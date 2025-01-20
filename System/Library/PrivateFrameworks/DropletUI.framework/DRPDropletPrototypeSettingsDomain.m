@interface DRPDropletPrototypeSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation DRPDropletPrototypeSettingsDomain

+ (id)rootSettings
{
  swift_getObjCClassMetadata();
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DRPDropletPrototypeSettingsDomain;
  id result = objc_msgSendSuper2(&v4, sel_rootSettings);
  if (result)
  {
    self;
    v3 = (void *)swift_dynamicCastObjCClassUnconditional();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)domainGroupName
{
  v2 = (void *)sub_24D149258();
  return v2;
}

+ (id)domainName
{
  v2 = (void *)sub_24D149258();
  return v2;
}

+ (Class)rootSettingsClass
{
  type metadata accessor for DRPDropletPrototypeSettings(0);
  return (Class)swift_getObjCClassFromMetadata();
}

@end