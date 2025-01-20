@interface SettingsViewController
- (NoiseOnboardingViewController)welcomeController;
- (id)_enableMeasurementsSpecifier;
- (id)_loudEnvironmentSpecifier;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)getNoiseEnabled:(id)a3;
- (id)localizedPaneTitle;
- (id)notificationCoalescingTitles;
- (id)notificationCoalescingValue:(id)a3;
- (id)notificationCoalescingValues;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)preferredUserInterfaceStyle;
- (void)_environmentalAudioExposureAboutLinkTapped;
- (void)onboardingCompletedWithEnabled:(BOOL)a3;
- (void)setNoiseEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setNotificationCoalescingValue:(id)a3 specifier:(id)a4;
- (void)setWelcomeController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SettingsViewController

- (void)traitCollectionDidChange:(id)a3
{
  v4 = [a3 preferredContentSizeCategory];
  v5 = [(SettingsViewController *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];

  if (v4 != v6)
  {
    [(SettingsViewController *)self reload];
  }
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"MAIN_PANE_TITLE" value:&stru_8600 table:0];
  v5 = [v2 localizedStringForKey:@"MAIN_PANE_TITLE" value:v4 table:@"Noise"];

  return v5;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.Noise";
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SettingsViewController;
  [(SettingsViewController *)&v7 viewDidAppear:a3];
  v4 = +[HUNoiseSettings sharedInstance];
  unsigned __int8 v5 = [v4 onboardingCompleted];

  if (v5)
  {
    [(SettingsViewController *)self reloadSpecifiers];
  }
  else
  {
    v6 = objc_alloc_init(NoiseOnboardingViewController);
    [(NoiseOnboardingViewController *)v6 setNoiseOnboardingDelegate:self];
    [(SettingsViewController *)self setNeedsUserInterfaceAppearanceUpdate];
    [(SettingsViewController *)self setWelcomeController:v6];
    [(NoiseOnboardingViewController *)v6 setModalPresentationStyle:0];
    [(SettingsViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  uint64_t v2 = +[HUNoiseSettings sharedInstance];
  if ([v2 onboardingCompleted]) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (void)onboardingCompletedWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = +[HUNoiseSettings sharedInstance];
  [v5 setOnboardingCompleted:1];

  v6 = +[HUNoiseSettings sharedInstance];
  [v6 setNoiseEnabled:v3];

  objc_super v7 = +[HUNoiseSettings sharedInstance];
  [v7 setNotificationsEnabled:v3];

  welcomeController = self->_welcomeController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3004;
  v9[3] = &unk_82E0;
  BOOL v10 = v3;
  v9[4] = self;
  [(NoiseOnboardingViewController *)welcomeController dismissViewControllerAnimated:1 completion:v9];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    unsigned __int8 v5 = +[NSMutableArray array];
    v6 = [(SettingsViewController *)self localizedPaneTitle];
    [(SettingsViewController *)self setTitle:v6];

    objc_super v7 = +[PSSpecifier groupSpecifierWithID:@"HEADER"];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:PSHeaderCellClassGroupKey];

    v49 = v7;
    [v5 addObject:v7];
    BOOL v10 = +[PSSpecifier groupSpecifierWithID:@"ENABLE_MEASUREMENTS_GROUP_ID"];
    v11 = +[HUNoiseSettings sharedInstance];
    v12 = [v11 environmentalMeasurementsFooterDescription];
    [v10 setObject:v12 forKeyedSubscript:PSFooterTextGroupKey];

    v13 = v5;
    v48 = v10;
    [v5 addObject:v10];
    v14 = [(SettingsViewController *)self _enableMeasurementsSpecifier];
    uint64_t v15 = PSEnabledKey;
    [v14 setObject:0 forKeyedSubscript:PSEnabledKey];
    v47 = v14;
    [v5 addObject:v14];
    v16 = +[HUNoiseSettings sharedInstance];
    v17 = [v16 noiseThresholdSectionTitle];
    v18 = +[PSSpecifier groupSpecifierWithID:@"LOUD_NOTIFICATION_GROUP_ID" name:v17];

    v19 = +[HUNoiseSettings sharedInstance];
    v20 = [v19 noiseThresholdFooterDescription];

    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v18 setObject:v22 forKeyedSubscript:PSFooterCellClassGroupKey];

    [v18 setObject:v20 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
    v23 = +[HUNoiseSettings sharedInstance];
    v24 = [v23 noiseThresholdFooterLinkTitle];
    v53.location = (NSUInteger)[v20 rangeOfString:v24];
    v25 = NSStringFromRange(v53);
    [v18 setObject:v25 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

    v26 = +[NSValue valueWithNonretainedObject:self];
    [v18 setObject:v26 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

    [v18 setObject:@"_environmentalAudioExposureAboutLinkTapped" forKeyedSubscript:PSFooterHyperlinkViewActionKey];
    [v13 addObject:v18];
    v27 = [(SettingsViewController *)self _loudEnvironmentSpecifier];
    [v27 setObject:0 forKeyedSubscript:v15];
    [v13 addObject:v27];
    v28 = +[NRPairedDeviceRegistry sharedInstance];
    v29 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
    uint64_t v30 = [v28 getAllDevicesWithArchivedAltAccountDevicesMatching:v29];
    v31 = [(id)v30 firstObject];

    v32 = [v31 valueForProperty:NRDevicePropertyIsAltAccount];
    LOBYTE(v30) = [v32 BOOLValue];

    if ((v30 & 1) == 0)
    {
      v33 = +[HUNoiseSettings sharedInstance];
      unsigned int v34 = [v33 notificationsEnabled];

      if (v34)
      {
        v50.receiver = self;
        v50.super_class = (Class)SettingsViewController;
        id v35 = [(SettingsViewController *)&v50 specifiers];
        v45 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_COALESCING_GROUP_ID"];
        v36 = +[PSSpecifier preferenceSpecifierNamed:@"NOTIFICATION_COALESCING_TITLE" target:self set:"setNotificationCoalescingValue:specifier:" get:"notificationCoalescingValue:" detail:objc_opt_class() cell:2 edit:0];
        v44 = +[NSBundle bundleForClass:objc_opt_class()];
        v37 = +[NSBundle bundleForClass:objc_opt_class()];
        [v37 localizedStringForKey:@"NOTIFICATION_COALESCING_TITLE" value:&stru_8600 table:0];
        v38 = v46 = v13;
        [v44 localizedStringForKey:@"NOTIFICATION_COALESCING_TITLE" value:v38 table:@"Noise"];
        v40 = v39 = v20;
        [v36 setName:v40];

        v20 = v39;
        v13 = v46;

        [v36 setIdentifier:@"NOTIFICATION_COALESCING_ID"];
        [v36 setProperty:@"notificationCoalescingTitles" forKey:PSTitlesDataSourceKey];
        [v36 setProperty:@"notificationCoalescingValues" forKey:PSValuesDataSourceKey];
        v51[0] = v45;
        v51[1] = v36;
        v41 = +[NSArray arrayWithObjects:v51 count:2];
        [v46 addObjectsFromArray:v41];
      }
    }
    v42 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v13;

    v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SettingsViewController;
  id v6 = a4;
  objc_super v7 = [(SettingsViewController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[SettingsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v14.receiver, v14.super_class);

  v9 = [v8 identifier];
  LODWORD(v6) = [v9 isEqualToString:@"ENABLE_MEASUREMENTS_ID"];

  if (v6)
  {
    BOOL v10 = [v7 textLabel];
    [v10 setNumberOfLines:0];

    v11 = [v7 textLabel];
    LODWORD(v12) = 0.5;
    [v11 _setHyphenationFactor:v12];
  }

  return v7;
}

- (id)notificationCoalescingTitles
{
  objc_super v14 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v15 localizedStringForKey:@"NOTIFICATION_COALESCING_OFF" value:&stru_8600 table:0];
  uint64_t v2 = [v14 localizedStringForKey:@"NOTIFICATION_COALESCING_OFF" value:v13 table:@"Noise"];
  v16[0] = v2;
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v5 = [v4 localizedStringForKey:@"NOTIFICATION_COALESCING_AUTO" value:&stru_8600 table:0];
  id v6 = [v3 localizedStringForKey:@"NOTIFICATION_COALESCING_AUTO" value:v5 table:@"Noise"];
  v16[1] = v6;
  objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"NOTIFICATION_COALESCING_BY_APP" value:&stru_8600 table:0];
  BOOL v10 = [v7 localizedStringForKey:@"NOTIFICATION_COALESCING_BY_APP" value:v9 table:@"Noise"];
  v16[2] = v10;
  v11 = +[NSArray arrayWithObjects:v16 count:3];

  return v11;
}

- (id)notificationCoalescingValues
{
  return &off_8900;
}

- (id)notificationCoalescingValue:(id)a3
{
  uint64_t v3 = [(SettingsViewController *)self sectionInfo];
  v4 = [v3 objectForKey:BPSNanoBulletinCoalescingBehavior];

  if (v4) {
    unsigned __int8 v5 = v4;
  }
  else {
    unsigned __int8 v5 = &off_88B8;
  }
  id v6 = v5;

  return v6;
}

- (void)setNotificationCoalescingValue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(SettingsViewController *)self sectionInfo];
  [v6 setObject:v5 forKey:BPSNanoBulletinCoalescingBehavior];

  [(SettingsViewController *)self writeSectionState];
}

- (void)_environmentalAudioExposureAboutLinkTapped
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = +[NSURL URLWithString:@"https://support.apple.com/kb/HT209593"];
  [v3 openURL:v2 withCompletionHandler:0];
}

- (id)_loudEnvironmentSpecifier
{
  uint64_t v2 = +[HUNoiseSettings sharedInstance];
  id v3 = [v2 noiseThresholdTitleDescription];
  uint64_t v4 = objc_opt_class();
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v3 target:v4 set:0 get:"thresholdSPLString" detail:objc_opt_class() cell:2 edit:0];

  [v5 setIdentifier:@"LOUD_NOTIFICATION_ID"];

  return v5;
}

- (id)_enableMeasurementsSpecifier
{
  id v3 = +[HUNoiseSettings sharedInstance];
  uint64_t v4 = [v3 environmentalMeasurementsTitleDescription];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setNoiseEnabled:forSpecifier:" get:"getNoiseEnabled:" detail:0 cell:6 edit:0];

  [v5 setIdentifier:@"ENABLE_MEASUREMENTS_ID"];

  return v5;
}

- (void)setNoiseEnabled:(id)a3 forSpecifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[HUNoiseSettings sharedInstance];
  [v5 setNoiseEnabled:v4];
}

- (id)getNoiseEnabled:(id)a3
{
  id v3 = +[HUNoiseSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 noiseEnabled]);

  return v4;
}

- (NoiseOnboardingViewController)welcomeController
{
  return self->_welcomeController;
}

- (void)setWelcomeController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end