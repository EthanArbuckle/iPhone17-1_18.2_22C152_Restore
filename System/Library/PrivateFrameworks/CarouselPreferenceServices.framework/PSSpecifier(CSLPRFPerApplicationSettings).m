@interface PSSpecifier(CSLPRFPerApplicationSettings)
- (uint64_t)cslprf_setSettings:()CSLPRFPerApplicationSettings;
- (uint64_t)cslprf_settings;
@end

@implementation PSSpecifier(CSLPRFPerApplicationSettings)

- (uint64_t)cslprf_setSettings:()CSLPRFPerApplicationSettings
{
  return [a1 setProperty:a3 forKey:@"CSLPRFPerApplicationSettings"];
}

- (uint64_t)cslprf_settings
{
  return [a1 propertyForKey:@"CSLPRFPerApplicationSettings"];
}

@end