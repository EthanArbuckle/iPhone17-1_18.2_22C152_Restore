@interface DDScannerSetQOS
@end

@implementation DDScannerSetQOS

__CFBundle *__DDScannerSetQOS_block_invoke()
{
  result = CFBundleGetMainBundle();
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    if (result)
    {
      result = (__CFBundle *)CFStringHasPrefix((CFStringRef)result, @"com.apple.WebKit.WebContent");
      DDScannerSetQOS_inWebProcess = (char)result;
    }
  }
  return result;
}

@end