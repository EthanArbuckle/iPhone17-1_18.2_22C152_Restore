@interface SGMILiteralStringComparator
@end

@implementation SGMILiteralStringComparator

CFComparisonResult _SGMILiteralStringComparator_block_invoke(int a1, CFStringRef theString1, CFStringRef theString2)
{
  return CFStringCompare(theString1, theString2, 0);
}

@end