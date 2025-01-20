@interface TPSDialAssistBundleController
- (BOOL)isHidden;
- (BOOL)isSubscriptionListHidden;
- (TPSDialAssistController)dialAssistController;
- (id)isMainSwitchOn:(id)a3;
- (id)specifiers;
- (id)supportedSubscriptions;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
@end

@implementation TPSDialAssistBundleController

- (id)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier groupSpecifierWithID:@"DialAssistHelp"];
    v6 = +[TPSDialAssistStrings localizedStringForKey:@"BUNDLE_CONTROLLER_SPECIFIER_GROUP_FOOTER_TEXT"];
    [v5 setProperty:v6 forKey:PSFooterTextGroupKey];

    [v4 addObject:v5];
    v7 = +[TPSDialAssistStrings localizedStringForKey:@"BUNDLE_CONTROLLER_SPECIFIER_SWITCH_TITLE"];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setMainSwitchOn:specifier:" get:"isMainSwitchOn:" detail:0 cell:6 edit:0];

    [v8 setProperty:@"DialAssistSwitch" forKey:PSIDKey];
    [v8 setProperty:@"com.apple.telephonyutilities.dialassist" forKey:PSDefaultsKey];
    v9 = +[NSNumber numberWithBool:1];
    [v8 setProperty:v9 forKey:PSDefaultValueKey];

    [v8 setProperty:@"enable-dial-assist" forKey:PSKeyNameKey];
    [v8 setProperty:TUDialAssistUserSettingChanged forKey:PSValueChangedNotificationKey];
    [v4 addObject:v8];
    v10 = (NSArray *)[v4 copy];
    v11 = self->_specifiers;
    self->_specifiers = v10;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (TPSDialAssistController)dialAssistController
{
  dialAssistController = self->_dialAssistController;
  if (!dialAssistController)
  {
    v4 = objc_alloc_init(TPSDialAssistController);
    v5 = self->_dialAssistController;
    self->_dialAssistController = v4;

    dialAssistController = self->_dialAssistController;
  }

  return dialAssistController;
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)TPSDialAssistBundleController;
  if ([(TPSDialAssistBundleController *)&v3 isHidden]) {
    return 1;
  }
  else {
    return +[UIApplication isRunningInStoreDemoMode];
  }
}

- (BOOL)isSubscriptionListHidden
{
  return 1;
}

- (id)supportedSubscriptions
{
  supportedSubscriptions = self->_supportedSubscriptions;
  if (!supportedSubscriptions)
  {
    v21.receiver = self;
    v21.super_class = (Class)TPSDialAssistBundleController;
    v4 = [(TPSDialAssistBundleController *)&v21 subscriptions];
    v5 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v4 count]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isSimHidden", (void)v17) & 1) == 0)
          {
            v12 = [(TPSDialAssistBundleController *)self dialAssistController];
            unsigned int v13 = [v12 supportsDialAssistForSubscriptionContext:v11];

            if (v13) {
              [v5 addObject:v11];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }

    v14 = (NSOrderedSet *)[v5 copy];
    v15 = self->_supportedSubscriptions;
    self->_supportedSubscriptions = v14;

    supportedSubscriptions = self->_supportedSubscriptions;
  }

  return supportedSubscriptions;
}

- (id)isMainSwitchOn:(id)a3
{
  id v4 = a3;
  v5 = [(TPSDialAssistBundleController *)self parentListController];
  id v6 = [v5 readPreferenceValue:v4];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = [v6 BOOLValue];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = &dword_0 + 1;
  }
  id v8 = +[NSNumber numberWithBool:v7];

  return v8;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = TPSDialAssistLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v6 BOOLValue];
    CFStringRef v10 = @"Disabling";
    if (v9) {
      CFStringRef v10 = @"Enabling";
    }
    int v12 = 138412290;
    CFStringRef v13 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@ dial assist", (uint8_t *)&v12, 0xCu);
  }

  v11 = [(TPSDialAssistBundleController *)self parentListController];
  [v11 setPreferenceValue:v6 specifier:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSubscriptions, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);

  objc_storeStrong((id *)&self->_dialAssistController, 0);
}

@end