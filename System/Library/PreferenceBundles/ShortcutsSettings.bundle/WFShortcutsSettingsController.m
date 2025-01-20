@interface WFShortcutsSettingsController
- (BOOL)isPrivateSharingEnabled;
- (PSSystemPolicyForApp)policy;
- (UISwitch)requestingPINSwtich;
- (UISwitch)sharingSwitch;
- (id)OSSSpecifier;
- (id)advancedSettingsSpecifier;
- (id)dummyGroupSpecifier;
- (id)privateSharingEnabled:(id)a3;
- (id)privateSharingGroupSpecifier;
- (id)privateSharingGroupUntrustedShortcutsDescription;
- (id)privateSharingSwitchSpecifier;
- (id)sharingGroupAboutLinkText;
- (id)specifiers;
- (id)syncSpecifier;
- (void)setPolicy:(id)a3;
- (void)setPrivateSharingEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setRequestingPINSwtich:(id)a3;
- (void)setSharingSwitch:(id)a3;
- (void)showShortcutsSharingAndPrivacy;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WFShortcutsSettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_requestingPINSwtich, 0);

  objc_storeStrong((id *)&self->_sharingSwitch, 0);
}

- (void)setPolicy:(id)a3
{
}

- (PSSystemPolicyForApp)policy
{
  return self->_policy;
}

- (void)setRequestingPINSwtich:(id)a3
{
}

- (UISwitch)requestingPINSwtich
{
  return self->_requestingPINSwtich;
}

- (void)setSharingSwitch:(id)a3
{
}

- (UISwitch)sharingSwitch
{
  return self->_sharingSwitch;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc((Class)PSSystemPolicyForApp);
    v6 = (PSSystemPolicyForApp *)[v5 initWithBundleIdentifier:VCBundleIdentifierShortcutsiOS];
    policy = self->_policy;
    self->_policy = v6;
    v8 = v6;

    v9 = +[WFDevice currentDevice];
    unsigned int v10 = [v9 isChineseRegionDevice];

    if (v10) {
      uint64_t v11 = 33619972;
    }
    else {
      uint64_t v11 = 33619968;
    }
    v12 = [(PSSystemPolicyForApp *)v8 specifiersForPolicyOptions:v11 force:0];
    id v13 = [v12 mutableCopy];

    v14 = [(WFShortcutsSettingsController *)self dummyGroupSpecifier];
    [v13 addObject:v14];

    v15 = [(WFShortcutsSettingsController *)self syncSpecifier];
    [v13 addObject:v15];

    v16 = [(WFShortcutsSettingsController *)self privateSharingGroupSpecifier];
    [v13 addObject:v16];

    v17 = [(WFShortcutsSettingsController *)self privateSharingSwitchSpecifier];
    [v13 addObject:v17];

    v18 = [(WFShortcutsSettingsController *)self dummyGroupSpecifier];
    [v13 addObject:v18];

    v19 = [(WFShortcutsSettingsController *)self advancedSettingsSpecifier];
    [v13 addObject:v19];

    v20 = [(WFShortcutsSettingsController *)self dummyGroupSpecifier];
    [v13 addObject:v20];

    v21 = [(WFShortcutsSettingsController *)self OSSSpecifier];
    [v13 addObject:v21];

    id v22 = [v13 copy];
    v23 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v22;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)OSSSpecifier
{
  uint64_t v3 = WFShortcutsSettingsLocalizedString(@"Legal Notices");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:objc_opt_class() cell:2 edit:0];

  return v4;
}

- (id)dummyGroupSpecifier
{
  return +[PSSpecifier groupSpecifierWithID:@"soup"];
}

- (id)advancedSettingsSpecifier
{
  uint64_t v3 = WFShortcutsSettingsLocalizedString(@"Advanced");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:objc_opt_class() cell:2 edit:0];

  [v4 setProperty:@"ShortcutsAdvancedSettings" forKey:PSIDKey];

  return v4;
}

- (void)showShortcutsSharingAndPrivacy
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.shortcutssharing"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (id)sharingGroupAboutLinkText
{
  return WFShortcutsSettingsLocalizedString(@"About Shortcuts Sharing & Privacy…");
}

- (void)setPrivateSharingEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a4;
  id v6 = [a3 BOOLValue];
  id v8 = [v5 propertyForKey:PSControlKey];

  [v8 setOn:v6 animated:1];
  v7 = +[NSUserDefaults systemShortcutsUserDefaults];
  [v7 setBool:v6 forKey:WFShortcutsPrivateSharingEnabledKey];
}

- (id)privateSharingEnabled:(id)a3
{
  BOOL v3 = [(WFShortcutsSettingsController *)self isPrivateSharingEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (BOOL)isPrivateSharingEnabled
{
  v2 = +[NSUserDefaults systemShortcutsUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:WFShortcutsPrivateSharingEnabledKey];

  return v3;
}

- (id)privateSharingSwitchSpecifier
{
  unsigned __int8 v3 = WFShortcutsSettingsLocalizedString(@"Private Sharing");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPrivateSharingEnabled:forSpecifier:" get:"privateSharingEnabled:" detail:0 cell:6 edit:0];

  return v4;
}

- (id)privateSharingGroupSpecifier
{
  unsigned __int8 v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:0 edit:0];
  v4 = [(WFShortcutsSettingsController *)self privateSharingGroupUntrustedShortcutsDescription];
  id v5 = [(WFShortcutsSettingsController *)self sharingGroupAboutLinkText];
  id v6 = +[NSString stringWithFormat:@"%@ %@", v4, v5];

  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v3 setProperty:v8 forKey:PSFooterCellClassGroupKey];

  [v3 setProperty:v6 forKey:PSFooterHyperlinkViewTitleKey];
  v9 = [(WFShortcutsSettingsController *)self sharingGroupAboutLinkText];
  v14.location = (NSUInteger)[v6 rangeOfString:v9];
  unsigned int v10 = NSStringFromRange(v14);
  [v3 setProperty:v10 forKey:PSFooterHyperlinkViewLinkRangeKey];

  uint64_t v11 = +[NSValue valueWithNonretainedObject:self];
  [v3 setProperty:v11 forKey:PSFooterHyperlinkViewTargetKey];

  [v3 setProperty:@"showShortcutsSharingAndPrivacy" forKey:PSFooterHyperlinkViewActionKey];

  return v3;
}

- (id)privateSharingGroupUntrustedShortcutsDescription
{
  return WFShortcutsSettingsLocalizedString(@"Allow receiving shortcuts directly from people in your contacts. Apple cannot verify the authenticity of shortcuts shared privately.");
}

- (id)syncSpecifier
{
  unsigned __int8 v3 = WFShortcutsSettingsLocalizedString(@"iCloud Sync");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v4 setProperty:@"group.is.workflow.my.app" forKey:PSDefaultsKey];
  [v4 setProperty:WFCloudKitSyncEnabledKey forKey:PSKeyNameKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFShortcutsSettingsController;
  [(WFShortcutsSettingsController *)&v10 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.shortcuts"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  id v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Shortcuts" table:0 locale:v6 bundleURL:v8];

  [(WFShortcutsSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:VCBundleIdentifierShortcutsiOS title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

@end