@interface CADevicePrefers60HzAPT
@end

@implementation CADevicePrefers60HzAPT

CFDictionaryRef __CADevicePrefers60HzAPT_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFDictionaryRef result = CFBundleGetInfoDictionary(MainBundle);
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"CAEnableVariableFrameDuration");
    if (result)
    {
      CFDictionaryRef result = (const __CFDictionary *)CA_CFBoolValue(result);
      CADevicePrefers60HzAPT::enabled = (char)result;
    }
  }
  return result;
}

@end