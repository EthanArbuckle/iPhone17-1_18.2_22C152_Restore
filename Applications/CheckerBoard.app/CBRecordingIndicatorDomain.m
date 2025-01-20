@interface CBRecordingIndicatorDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation CBRecordingIndicatorDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CBRecordingIndicatorDomain;
  v2 = [super rootSettings];

  return v2;
}

+ (id)domainGroupName
{
  return @"CheckerBoard";
}

+ (id)domainName
{
  return @"Recording Indicator";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end