@interface CADeviceDisableMinimumFrameDurationOnPhone
@end

@implementation CADeviceDisableMinimumFrameDurationOnPhone

CFDictionaryRef __CADeviceDisableMinimumFrameDurationOnPhone_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFDictionaryRef result = CFBundleGetInfoDictionary(MainBundle);
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"CADisableMinimumFrameDurationOnPhone");
    if (result)
    {
      CFDictionaryRef result = (const __CFDictionary *)CA_CFBoolValue(result);
      CADeviceDisableMinimumFrameDurationOnPhone::disabled = (char)result;
    }
  }
  return result;
}

@end