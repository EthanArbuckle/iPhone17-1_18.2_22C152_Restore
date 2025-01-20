@interface AMMotionDetectionDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation AMMotionDetectionDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AMMotionDetectionDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"Domino";
}

+ (id)domainName
{
  return @"Motion Detection";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end