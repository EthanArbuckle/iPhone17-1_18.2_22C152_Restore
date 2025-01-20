@interface WeatherSettingsConstants
+ (NSString)PrivacyHomeWorkShowLabelsNavigationUrl;
+ (NSString)PrivacyResetNavigationUrl;
+ (NSString)RootNavigationUrl;
+ (NSString)TemperatureNavigationUrl;
- (_TtC15WeatherSettings24WeatherSettingsConstants)init;
@end

@implementation WeatherSettingsConstants

+ (NSString)RootNavigationUrl
{
  return (NSString *)sub_7194((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_70B4);
}

+ (NSString)TemperatureNavigationUrl
{
  return (NSString *)sub_7194((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_70EC);
}

+ (NSString)PrivacyResetNavigationUrl
{
  return (NSString *)sub_7194((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_7124);
}

+ (NSString)PrivacyHomeWorkShowLabelsNavigationUrl
{
  return (NSString *)sub_7194((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_715C);
}

- (_TtC15WeatherSettings24WeatherSettingsConstants)init
{
  return (_TtC15WeatherSettings24WeatherSettingsConstants *)sub_71E8();
}

@end