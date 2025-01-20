@interface CHUISMutableWidgetSceneClientSettings
- (BOOL)baseContentTouchedDown;
- (BOOL)containsInteractiveControls;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (void)setBaseContentTouchedDown:(BOOL)a3;
- (void)setContainsInteractiveControls:(BOOL)a3;
@end

@implementation CHUISMutableWidgetSceneClientSettings

- (BOOL)containsInteractiveControls
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:88888];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (void)setContainsInteractiveControls:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:88888];
}

- (BOOL)baseContentTouchedDown
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:88889];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (void)setBaseContentTouchedDown:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:88889];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHUISWidgetSceneClientSettings alloc];

  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHUISMutableWidgetSceneClientSettings;
  v4 = -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
  if (a3 == 88888)
  {
    v5 = @"containsInteractiveControls";
  }
  else
  {
    if (a3 != 88889) {
      goto LABEL_6;
    }
    v5 = @"baseContentTouchedDown";
  }

  v4 = v5;
LABEL_6:

  return v4;
}

@end