@interface FSFSiriPreferenceUtil
+ (BOOL)isOptedIn;
@end

@implementation FSFSiriPreferenceUtil

+ (BOOL)isOptedIn
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  unint64_t v3 = [v2 siriDataSharingOptInStatus];

  if (v3 >= 4)
  {
    BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v6 = 134217984;
      unint64_t v7 = v3;
      _os_log_impl(&dword_21D935000, &_os_log_internal, OS_LOG_TYPE_INFO, "Unexpected siriPreferenceDataSharingOptInStatus value %ld", (uint8_t *)&v6, 0xCu);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = (v3 & 0xF) == 1;
  }
  return v4;
}

@end