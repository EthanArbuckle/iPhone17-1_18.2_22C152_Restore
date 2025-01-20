@interface CHUISWidgetSceneClientSettings
- (BOOL)baseContentTouchedDown;
- (BOOL)containsInteractiveControls;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation CHUISWidgetSceneClientSettings

- (BOOL)containsInteractiveControls
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:88888];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)baseContentTouchedDown
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:88889];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CHUISMutableWidgetSceneClientSettings alloc];

  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 88888)
  {
    v5 = @"containsInteractiveControls";
  }
  else if (a3 == 88889)
  {
    v5 = @"baseContentTouchedDown";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)CHUISWidgetSceneClientSettings;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end