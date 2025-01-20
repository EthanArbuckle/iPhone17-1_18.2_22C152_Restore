@interface HPSFeatureStatus
+ (BOOL)isAnalyticsAndImprovementSettingsEnabled;
+ (BOOL)isHomePodBetaEnrollmentEnabled;
+ (BOOL)isLocalSettingsEnabled;
+ (BOOL)isOpalEnabled;
+ (BOOL)isPyreEnabled;
@end

@implementation HPSFeatureStatus

+ (BOOL)isHomePodBetaEnrollmentEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = _os_feature_enabled_impl();
  v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "+[HPSFeatureStatus isHomePodBetaEnrollmentEnabled]";
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_impl(&dword_23D144000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

+ (BOOL)isLocalSettingsEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = _os_feature_enabled_impl();
  v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "+[HPSFeatureStatus isLocalSettingsEnabled]";
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_impl(&dword_23D144000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

+ (BOOL)isAnalyticsAndImprovementSettingsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPyreEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOpalEnabled
{
  return _os_feature_enabled_impl();
}

@end