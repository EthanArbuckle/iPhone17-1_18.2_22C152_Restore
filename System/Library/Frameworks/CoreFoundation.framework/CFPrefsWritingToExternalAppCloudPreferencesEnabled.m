@interface CFPrefsWritingToExternalAppCloudPreferencesEnabled
@end

@implementation CFPrefsWritingToExternalAppCloudPreferencesEnabled

uint64_t ___CFPrefsWritingToExternalAppCloudPreferencesEnabled_block_invoke()
{
  v0 = _CFProcessPath();
  uint64_t result = strcmp(v0, "/usr/bin/defaults");
  if (result)
  {
    uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication");
    uint64_t result = _CFPrefsGetCacheStringForBundleID(@"com.apple.Preferences");
    BOOL v3 = CacheStringForBundleID == result;
  }
  else
  {
    BOOL v3 = 1;
  }
  _CFPrefsOverrideEnableWritingToExternalAppCloudPreferences = v3;
  return result;
}

@end