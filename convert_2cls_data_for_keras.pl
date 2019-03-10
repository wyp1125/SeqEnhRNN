if($#ARGV<4)
{
print "pos_trn neg_trn pos_val neg_val output_prefix\n";
exit;
}
open(output1,">$ARGV[4].trn.X");
open(output2,">$ARGV[4].trn.Y");
open(output3,">$ARGV[4].tst.X");
open(output4,">$ARGV[4].tst.Y");
open(input,"$ARGV[0]");
$n=0;
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line,2);
if($n%4==0)
{
$nline=$a[1];
}
else
{
$nline=$nline."\t".$a[1];
}
if($n%4==3)
{
print output1 &transpose($nline),"\n";
print output2 "0\t1\n";
}
$n++;
}
}
open(input,"$ARGV[1]");
$n=0;
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line,2);
if($n%4==0)
{
$nline=$a[1];
}
else
{
$nline=$nline."\t".$a[1];
}
if($n%4==3)
{
print output1 &transpose($nline),"\n";
print output2 "1\t0\n";
}
$n++;
}
}
open(input,"$ARGV[2]");
$n=0;
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line,2);
if($n%4==0)
{
$nline=$a[1];
}
else
{
$nline=$nline."\t".$a[1];
}
if($n%4==3)
{
print output3 &transpose($nline),"\n";
print output4 "0\t1\n";
}
$n++;
}
}
open(input,"$ARGV[3]");
$n=0;
while($line=<input>)
{
chomp($line);
if($line ne "")
{
@a=split("\t",$line,2);
if($n%4==0)
{
$nline=$a[1];
}
else
{
$nline=$nline."\t".$a[1];
}
if($n%4==3)
{
print output3 &transpose($nline),"\n";
print output4 "1\t0\n";
}
$n++;
}
}

sub transpose
{
my @b=split("\t",$_[0]);
my $xx="";
for(my $i=0;$i<200;$i++)
{
my $temp=$b[$i]."\t".$b[$i+200]."\t".$b[$i+400]."\t".$b[$i+600]."\t";
$xx=$xx.$temp;
}
chop($xx);
return $xx;
}
