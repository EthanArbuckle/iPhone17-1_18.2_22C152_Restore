@interface PAGetAppearance
+ (id)carPlayAppearanceStyle;
+ (id)iOSAppearanceStyle;
- (void)performWithCompletion:(id)a3;
@end

@implementation PAGetAppearance

- (void)performWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  id v4 = [objc_alloc((Class)CARSessionStatus) initAndWaitUntilSessionUpdated];
  id v9 = [v4 currentSession];

  if (v9) {
    +[PAGetAppearance carPlayAppearanceStyle];
  }
  else {
  v5 = +[PAGetAppearance iOSAppearanceStyle];
  }
  id v6 = objc_alloc_init((Class)SASettingAppearanceEntity);
  [v6 setValue:v5];
  id v7 = objc_alloc_init((Class)SASettingGetAppearanceResponse);
  [v7 setSetting:v6];
  v8 = [v7 dictionary];
  v3[2](v3, v8);
}

+ (id)iOSAppearanceStyle
{
  id v2 = [objc_alloc((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
  v3 = (char *)[v2 modeValue];
  if (!UISUserInterfaceStyleModeValueIsAutomatic())
  {
    NSLog(@"Mode value is %ld", v3);
    if (v3 != (unsigned char *)&dword_0 + 1)
    {
      if (v3 != (unsigned char *)&dword_0 + 2) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
LABEL_8:
    v5 = (id *)&SASettingAppearanceLightValue;
    goto LABEL_9;
  }
  NSLog(@"User interface style is automatic");
  id v4 = (char *)[v2 override];
  NSLog(@"Mode override style is %ld", v4);
  if (v4 == (unsigned char *)&dword_0 + 1) {
    goto LABEL_8;
  }
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
LABEL_7:
    v5 = (id *)&SASettingAppearanceDarkValue;
LABEL_9:
    id v6 = *v5;
    goto LABEL_11;
  }
  NSLog(@"Value is set to nil");
LABEL_10:
  id v6 = 0;
LABEL_11:

  return v6;
}

+ (id)carPlayAppearanceStyle
{
  id v2 = +[CARPrototypePref interfaceStyle];
  v3 = [v2 value];
  id v4 = (char *)[v3 integerValue];

  NSLog(@"Car style is %ld", v4);
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    v5 = (id *)&SASettingAppearanceDarkValue;
LABEL_5:
    id v6 = *v5;
    goto LABEL_7;
  }
  if ((unint64_t)v4 <= 1)
  {
    v5 = (id *)&SASettingAppearanceLightValue;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

@end