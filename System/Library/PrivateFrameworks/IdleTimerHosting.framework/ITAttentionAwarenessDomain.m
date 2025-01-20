@interface ITAttentionAwarenessDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation ITAttentionAwarenessDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ITAttentionAwarenessDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);

  return v2;
}

+ (id)domainGroupName
{
  return @"IdleTimerServices";
}

+ (id)domainName
{
  return @"Attention Awareness";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end