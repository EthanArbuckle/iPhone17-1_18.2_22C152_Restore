@interface CADeviceIsAppleBundle
@end

@implementation CADeviceIsAppleBundle

CFStringRef __CADeviceIsAppleBundle_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFStringRef result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    CFStringRef result = (const __CFString *)CFStringHasPrefix(result, @"com.apple.");
    CADeviceIsAppleBundle::apple_bundle = result != 0;
  }
  return result;
}

@end