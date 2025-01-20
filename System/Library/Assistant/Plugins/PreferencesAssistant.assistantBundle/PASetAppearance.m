@interface PASetAppearance
+ (void)setCarPlayAppearanceStyle:(id)a3;
+ (void)setiOSAppearanceStyle:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation PASetAppearance

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v16 = [(PASetAppearance *)self appearance];
  id v5 = [objc_alloc((Class)CARSessionStatus) initAndWaitUntilSessionUpdated];
  v6 = [v5 currentSession];

  if (v6) {
    +[PAGetAppearance carPlayAppearanceStyle];
  }
  else {
  v7 = +[PAGetAppearance iOSAppearanceStyle];
  }
  NSLog(@"Setting value to %@, previous value is %@", v16, v7);
  unsigned int v8 = [v16 isEqualToString:v7];
  unsigned __int8 v9 = [(PASetAppearance *)self dryRun];
  if (v8)
  {
    id v10 = objc_alloc_init((Class)SACommandFailed);
    [v10 setErrorCode:SASettingValueUnchangedErrorCode];
    [v10 setReason:@"Value unchanged, No change was made"];
    NSLog(@"Command failed due to value unchanged");
  }
  else
  {
    id v10 = 0;
  }
  if (v10) {
    char v11 = 1;
  }
  else {
    char v11 = v9;
  }
  if (v11)
  {
    id v12 = v10;
    if (v10)
    {
      id v13 = v12;
      goto LABEL_17;
    }
  }
  else if (v6)
  {
    +[PASetAppearance setCarPlayAppearanceStyle:v16];
  }
  else
  {
    +[PASetAppearance setiOSAppearanceStyle:v16];
  }
  id v14 = objc_alloc_init((Class)SASettingAppearanceEntity);
  [v14 setValue:v16];
  [v14 setPreviousValue:v7];
  id v13 = objc_alloc_init((Class)SASettingSetAppearanceResponse);
  [v13 setSetting:v14];

LABEL_17:
  v15 = [v13 dictionary];
  v4[2](v4, v15);
}

+ (void)setiOSAppearanceStyle:(id)a3
{
  id v7 = a3;
  id v3 = [objc_alloc((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
  [v3 modeValue];
  if (UISUserInterfaceStyleModeValueIsAutomatic())
  {
    NSLog(@"User interface style is automatic");
    if ([v7 isEqualToString:SASettingAppearanceDarkValue])
    {
      uint64_t v4 = 2;
    }
    else if ([v7 isEqualToString:SASettingAppearanceLightValue])
    {
      uint64_t v4 = 1;
    }
    else
    {
      NSLog(&CFSTR("Value is not equal to SASettingAppearanceDarkValue or SASettingAppearanceLightValue, setting override style"
                   " to UISUserInterfaceStyleModeOverrideStyleNone").isa);
      uint64_t v4 = 0;
    }
    objc_msgSend(v3, "setOverride:", v4, 1);
    goto LABEL_13;
  }
  if ([v7 isEqualToString:SASettingAppearanceDarkValue])
  {
    id v5 = v3;
    uint64_t v6 = 2;
  }
  else
  {
    if (![v7 isEqualToString:SASettingAppearanceLightValue]) {
      goto LABEL_13;
    }
    id v5 = v3;
    uint64_t v6 = 1;
  }
  [v5 setModeValue:v6];
LABEL_13:
}

+ (void)setCarPlayAppearanceStyle:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:SASettingAppearanceDarkValue])
  {
    id v3 = +[CARPrototypePref interfaceStyle];
    uint64_t v4 = v3;
    id v5 = &off_10EE0;
  }
  else
  {
    if (![v6 isEqualToString:SASettingAppearanceLightValue]) {
      goto LABEL_6;
    }
    id v3 = +[CARPrototypePref interfaceStyle];
    uint64_t v4 = v3;
    id v5 = &off_10EF8;
  }
  [v3 setValue:v5];

LABEL_6:
}

@end