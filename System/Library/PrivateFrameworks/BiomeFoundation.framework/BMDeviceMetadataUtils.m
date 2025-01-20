@interface BMDeviceMetadataUtils
+ (BOOL)currentlyInGameMode;
+ (id)osBuildSupplementalVersion;
+ (id)osBuildVersion;
+ (int64_t)platform;
@end

@implementation BMDeviceMetadataUtils

+ (int64_t)platform
{
  uint64_t v5 = 0;
  v2 = 0;
  if (!sysctlbyname_get_data_np())
  {
    v2 = objc_msgSend(NSString, "stringWithUTF8String:", 0, 0);
    free(0);
  }
  if (objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", @"iPhone", v5)) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = [v2 localizedCaseInsensitiveContainsString:@"iPad"];
  }

  return v3;
}

+ (id)osBuildVersion
{
  if (sysctlbyname_get_data_np())
  {
    v2 = @"?";
  }
  else
  {
    objc_msgSend(NSString, "stringWithUTF8String:", 0, 0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(0);
  }
  return v2;
}

+ (id)osBuildSupplementalVersion
{
  CFDictionaryRef v2 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F1CD10]);
    if (Value) {
      uint64_t v5 = Value;
    }
    else {
      uint64_t v5 = @"?";
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v5 = @"?";
  }
  return v5;
}

+ (BOOL)currentlyInGameMode
{
  int out_token = -1;
  uint64_t v3 = 0;
  notify_register_check("com.apple.system.console_mode_changed", &out_token);
  notify_get_state(out_token, &v3);
  if (out_token != -1) {
    notify_cancel(out_token);
  }
  return v3 != 0;
}

@end