@interface MUIIntelligenceLightDefaults
+ (BOOL)shimmerWhenAppearing;
+ (double)preferredMessageListAnimationDelay;
+ (double)preferredMessageListBackgroundCornerRadius;
+ (double)preferredMessageListFadeInDuration;
+ (double)preferredMessageListFadeOutDelay;
+ (double)preferredMessageListFadeOutDuration;
+ (double)preferredMessageListRimLightColorOpacity;
+ (double)preferredMessageListRimLightSoftRadius;
+ (double)preferredMessageListRimLightThickness;
+ (id)_defaults;
+ (int64_t)preferredMessageListBeginningAnimationCurve;
+ (int64_t)preferredMessageListEndingAnimationCurve;
+ (void)restoreDefaultValues;
+ (void)setInitialSettingsIfNecessary;
@end

@implementation MUIIntelligenceLightDefaults

+ (void)setInitialSettingsIfNecessary
{
  v3 = [a1 _defaults];
  char v4 = [v3 BOOLForKey:@"MUIIntelligenceLightDefaultsKeyHasSetupMessageListIntelligenceLightInitialSettingsKey.v2"];

  if ((v4 & 1) == 0)
  {
    [a1 restoreDefaultValues];
    id v5 = [a1 _defaults];
    [v5 setBool:1 forKey:@"MUIIntelligenceLightDefaultsKeyHasSetupMessageListIntelligenceLightInitialSettingsKey.v2"];
  }
}

+ (id)_defaults
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

+ (int64_t)preferredMessageListBeginningAnimationCurve
{
  v2 = [a1 _defaults];
  int64_t v3 = [v2 integerForKey:@"MUIIntelligenceLightDefaultsKeyMessageListBeginningAnimationCurve"];

  return v3;
}

+ (int64_t)preferredMessageListEndingAnimationCurve
{
  v2 = [a1 _defaults];
  int64_t v3 = [v2 integerForKey:@"MUIIntelligenceLightDefaultsKeyMessageListEndingAnimationCurve"];

  return v3;
}

+ (double)preferredMessageListAnimationDelay
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListAnimationDelay"];
  double v4 = v3;

  return v4;
}

+ (double)preferredMessageListFadeInDuration
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListFadeInDuration"];
  double v4 = v3;

  return v4;
}

+ (double)preferredMessageListFadeOutDelay
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListFadeOutDelay"];
  double v4 = v3;

  return v4;
}

+ (double)preferredMessageListFadeOutDuration
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListFadeOutDuration"];
  double v4 = v3;

  return v4;
}

+ (double)preferredMessageListBackgroundCornerRadius
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListBackgroundCornerRadius"];
  double v4 = v3;

  return v4;
}

+ (double)preferredMessageListRimLightThickness
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListRimLightThickness"];
  double v4 = v3;

  return v4;
}

+ (double)preferredMessageListRimLightSoftRadius
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListRimLightSoftRadius"];
  double v4 = v3;

  return v4;
}

+ (double)preferredMessageListRimLightColorOpacity
{
  v2 = [a1 _defaults];
  [v2 doubleForKey:@"MUIIntelligenceLightDefaultsKeyMessageListRimLightColorOpacity"];
  double v4 = v3;

  return v4;
}

+ (BOOL)shimmerWhenAppearing
{
  return [MEMORY[0x1E4F602E0] preferenceEnabled:61];
}

+ (void)restoreDefaultValues
{
  double v3 = [a1 _defaults];
  [v3 setInteger:1 forKey:@"MUIIntelligenceLightDefaultsKeyMessageListBeginningAnimationCurve"];

  double v4 = [a1 _defaults];
  [v4 setInteger:2 forKey:@"MUIIntelligenceLightDefaultsKeyMessageListEndingAnimationCurve"];

  id v5 = [a1 _defaults];
  [v5 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListAnimationDelay" forKey:0.1];

  v6 = [a1 _defaults];
  [v6 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListFadeInDuration" forKey:1.2];

  v7 = [a1 _defaults];
  [v7 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListFadeOutDelay" forKey:0.5];

  v8 = [a1 _defaults];
  [v8 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListFadeOutDuration" forKey:2.4];

  v9 = [a1 _defaults];
  [v9 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListBackgroundCornerRadius" forKey:28.0];

  v10 = [a1 _defaults];
  [v10 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListRimLightThickness" forKey:0.0];

  v11 = [a1 _defaults];
  [v11 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListRimLightSoftRadius" forKey:0.0];

  id v12 = [a1 _defaults];
  [v12 setDouble:@"MUIIntelligenceLightDefaultsKeyMessageListRimLightColorOpacity" forKey:0.0];
}

@end