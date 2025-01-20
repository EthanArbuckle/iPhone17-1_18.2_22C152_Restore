@interface WFShortcutsAdvancedSettingsController
- (id)allowDeletingLargeAmountOfDataSwitchSpecifier;
- (id)allowDeletingWithoutConfirmationSwitchSpecifier;
- (id)allowSharingLargeAmountOfDataSwitchSpecifier;
- (id)defaultGroupSpecifier;
- (id)scriptingGroupSpecifier;
- (id)scriptingSwitchSpecifier;
- (id)specifiers;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WFShortcutsAdvancedSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(WFShortcutsAdvancedSettingsController *)self scriptingGroupSpecifier];
    v6 = [(WFShortcutsAdvancedSettingsController *)self scriptingSwitchSpecifier];
    v15[1] = v6;
    v7 = [(WFShortcutsAdvancedSettingsController *)self defaultGroupSpecifier];
    v15[2] = v7;
    v8 = [(WFShortcutsAdvancedSettingsController *)self allowSharingLargeAmountOfDataSwitchSpecifier];
    v15[3] = v8;
    v9 = [(WFShortcutsAdvancedSettingsController *)self defaultGroupSpecifier];
    v15[4] = v9;
    v10 = [(WFShortcutsAdvancedSettingsController *)self allowDeletingWithoutConfirmationSwitchSpecifier];
    v15[5] = v10;
    v11 = [(WFShortcutsAdvancedSettingsController *)self allowDeletingLargeAmountOfDataSwitchSpecifier];
    v15[6] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v15 count:7];
    v13 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v12;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)defaultGroupSpecifier
{
  return +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:0 edit:0];
}

- (id)allowDeletingLargeAmountOfDataSwitchSpecifier
{
  uint64_t v3 = WFShortcutsSettingsGetValueForKey(@"ALLOW_DELETING_LARGE_AMOUNT_OF_DATA_SWITCH_LABEL", @"ShortcutsAdvancedSettings");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v4 setProperty:@"com.apple.siri.shortcuts" forKey:PSDefaultsKey];
  [v4 setProperty:WFAllowDeletingLargeAmountsOfDataKey forKey:PSKeyNameKey];
  [v4 setProperty:&__kCFBooleanFalse forKey:PSDefaultValueKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v4;
}

- (id)allowDeletingWithoutConfirmationSwitchSpecifier
{
  uint64_t v3 = WFShortcutsSettingsGetValueForKey(@"ALLOW_DELETING_WITHOUT_CONFIRMATION_SWITCH_LABEL", @"ShortcutsAdvancedSettings");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v4 setProperty:@"com.apple.siri.shortcuts" forKey:PSDefaultsKey];
  [v4 setProperty:WFAllowDeletingWithoutConfirmationKey forKey:PSKeyNameKey];
  [v4 setProperty:&__kCFBooleanFalse forKey:PSDefaultValueKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v4;
}

- (id)allowSharingLargeAmountOfDataSwitchSpecifier
{
  uint64_t v3 = WFShortcutsSettingsGetValueForKey(@"ALLOW_SHARING_LARGE_AMOUNT_OF_DATA_SWITCH_LABEL", @"ShortcutsAdvancedSettings");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v4 setProperty:@"com.apple.siri.shortcuts" forKey:PSDefaultsKey];
  [v4 setProperty:WFAllowSharingLargeAmountsOfDataKey forKey:PSKeyNameKey];
  [v4 setProperty:&__kCFBooleanFalse forKey:PSDefaultValueKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v4;
}

- (id)scriptingSwitchSpecifier
{
  uint64_t v3 = WFShortcutsSettingsGetValueForKey(@"SCRIPTING_SWITCH_LABEL", @"ShortcutsAdvancedSettings");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v4 setProperty:@"com.apple.siri.shortcuts" forKey:PSDefaultsKey];
  [v4 setProperty:WFScriptingActionEnabledKey forKey:PSKeyNameKey];
  [v4 setProperty:&__kCFBooleanFalse forKey:PSDefaultValueKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v4;
}

- (id)scriptingGroupSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:0 edit:0];
  uint64_t v3 = WFShortcutsSettingsGetValueForKey(@"SCRIPTING_GROUP_FOOTER", @"ShortcutsAdvancedSettings");
  [v2 setProperty:v3 forKey:PSFooterTextGroupKey];

  return v2;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFShortcutsAdvancedSettingsController;
  id v5 = a4;
  [(WFShortcutsAdvancedSettingsController *)&v9 setPreferenceValue:a3 specifier:v5];
  v6 = objc_msgSend(v5, "propertyForKey:", PSKeyNameKey, v9.receiver, v9.super_class);

  v7 = objc_opt_new();
  v8 = +[NSSet setWithObject:v6];
  [v7 synchronizeUserDefaultsDomain:@"com.apple.siri.shortcuts" keys:v8];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFShortcutsAdvancedSettingsController;
  [(WFShortcutsAdvancedSettingsController *)&v10 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.shortcuts/ShortcutsAdvancedSettings"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Advanced" table:0 locale:v6 bundleURL:v8];

  [(WFShortcutsAdvancedSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:VCBundleIdentifierShortcutsiOS title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

@end