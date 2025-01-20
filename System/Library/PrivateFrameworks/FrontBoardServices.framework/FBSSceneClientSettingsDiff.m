@interface FBSSceneClientSettingsDiff
+ (Class)_settingsClass;
+ (id)diffFromSettings:(id)a3 toSettings:(id)a4;
- (id)settingsByApplyingToMutableCopyOfSettings:(id)a3;
@end

@implementation FBSSceneClientSettingsDiff

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___FBSSceneClientSettingsDiff;
  v4 = [super diffFromSettings:a3 toSettings:a4];

  return v4;
}

- (id)settingsByApplyingToMutableCopyOfSettings:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBSSceneClientSettingsDiff;
  v3 = [(FBSSettingsDiff *)&v5 settingsByApplyingToMutableCopyOfSettings:a3];

  return v3;
}

+ (Class)_settingsClass
{
  return (Class)objc_opt_class();
}

@end