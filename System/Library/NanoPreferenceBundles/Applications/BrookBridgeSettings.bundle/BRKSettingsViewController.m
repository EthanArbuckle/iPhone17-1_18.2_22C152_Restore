@interface BRKSettingsViewController
- (BOOL)_isDeviceSatellitePaired;
- (BOOL)_needsRemindersSpecifiers;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (BRKSettingsViewController)init;
- (id)_getRemindersEnabled:(id)a3;
- (id)_getTimerEnabled:(id)a3;
- (id)_newRemindersSpecifiers;
- (id)_newSpecifiers;
- (id)_newTimerSpecifiers;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)localizedPaneTitle;
- (void)_applicationDidBecomeActive;
- (void)_contactStoreDidChange;
- (void)_dismissPresentedViewController;
- (void)_handleRemindersFooterHyperlinkTapped;
- (void)_openURLString:(id)a3;
- (void)_presentMeContactCard;
- (void)_presentNewContactCard;
- (void)_setRemindersEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_setTimerEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_settingsDidUpdate;
- (void)_showDataCollectionOptInIfNeeded;
- (void)_updateRemindersSpecifiers;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BRKSettingsViewController

- (BRKSettingsViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)BRKSettingsViewController;
  v2 = [(BRKSettingsViewController *)&v15 init];
  v3 = v2;
  if (v2 && [(BRKSettingsViewController *)v2 settingsMode] != (char *)&dword_0 + 1)
  {
    v4 = +[NRPairedDeviceRegistry sharedInstance];
    v5 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    uint64_t v7 = [v6 firstObject];
    device = v3->_device;
    v3->_device = (NRDevice *)v7;

    uint64_t v9 = +[BRKSettings settingsForDevice:v3->_device];
    brookSettings = v3->_brookSettings;
    v3->_brookSettings = (BRKSettings *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v3 selector:"_settingsDidUpdate" name:BRKSettingsDidUpdateNotification object:0];
    if (![(BRKSettingsViewController *)v3 _isDeviceSatellitePaired]
      || [(BRKSettings *)v3->_brookSettings isCachedLocationAuthFlowEnabled])
    {
      v12 = (BRKRemindersSettingsHelper *)[objc_alloc((Class)BRKRemindersSettingsHelper) initWithDelegate:v3 settings:v3->_brookSettings];
      helper = v3->_helper;
      v3->_helper = v12;

      [v11 addObserver:v3 selector:"_applicationDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];
      [v11 addObserver:v3 selector:"_contactStoreDidChange" name:CNContactStoreDidChangeNotification object:0];
    }
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRKSettingsViewController;
  [(BRKSettingsViewController *)&v4 viewWillAppear:a3];
  [(BRKRemindersSettingsHelper *)self->_helper update];
  [(BRKSettingsViewController *)self _showDataCollectionOptInIfNeeded];
}

- (void)_showDataCollectionOptInIfNeeded
{
  if ([(BRKSettings *)self->_brookSettings isEnabled])
  {
    +[BRKDataCollectionOnboardingViewController presentInViewController:self];
  }
}

- (id)localizedPaneTitle
{
  return +[BRKSettings settingsTitle];
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.brook.BrookUI";
}

- (id)applicationGroupSpecifiers
{
  id v2 = [(BRKSettingsViewController *)self _newSpecifiers];

  return v2;
}

- (BOOL)suppressMirrorOption
{
  return 1;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
}

- (id)_newSpecifiers
{
  v3 = +[NSMutableArray array];
  if ([(BRKSettings *)self->_brookSettings isAvailable])
  {
    if (![(BRKSettingsViewController *)self settingsMode])
    {
      id v4 = [(BRKSettingsViewController *)self _newTimerSpecifiers];
      [v3 addObjectsFromArray:v4];
    }
    if ([(BRKSettingsViewController *)self _needsRemindersSpecifiers])
    {
      id v5 = [(BRKSettingsViewController *)self _newRemindersSpecifiers];
      [v3 addObjectsFromArray:v5];
    }
  }
  id v6 = [v3 copy];

  return v6;
}

- (id)_newTimerSpecifiers
{
  v3 = +[PSSpecifier groupSpecifierWithID:@"HANDWASHING_TIMER_GROUP_ID"];
  id v4 = +[BRKSettings timerSettingFooter];
  [v3 setProperty:v4 forKey:PSFooterTextGroupKey];

  id v5 = +[BRKSettings timerSettingTitle];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"_setTimerEnabled:withSpecifier:" get:"_getTimerEnabled:" detail:0 cell:6 edit:0];

  [v6 setIdentifier:@"HANDWASHING_TIMER_ID"];
  [v6 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  v9[0] = v3;
  v9[1] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v9 count:2];

  return v7;
}

- (id)_newRemindersSpecifiers
{
  v3 = +[PSSpecifier groupSpecifierWithID:@"HANDWASHING_REMINDERS_GROUP_ID"];
  id v4 = [(BRKRemindersSettingsHelper *)self->_helper remindersFooterTextAndLinkString];
  id v5 = [v4 firstObject];
  if ([v4 count] == (char *)&dword_0 + 2)
  {
    id v6 = [v4 lastObject];
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v3 setProperty:v8 forKey:PSFooterCellClassGroupKey];

    [v3 setProperty:v5 forKey:PSFooterHyperlinkViewTitleKey];
    v18.location = (NSUInteger)[v5 localizedStandardRangeOfString:v6];
    uint64_t v9 = NSStringFromRange(v18);
    [v3 setProperty:v9 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v10 = +[NSValue valueWithNonretainedObject:self];
    [v3 setProperty:v10 forKey:PSFooterHyperlinkViewTargetKey];

    v11 = NSStringFromSelector("_handleRemindersFooterHyperlinkTapped");
    [v3 setProperty:v11 forKey:PSFooterHyperlinkViewActionKey];
  }
  else
  {
    [v3 setProperty:v5 forKey:PSFooterTextGroupKey];
  }
  v12 = +[BRKSettings remindersSettingTitle];
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"_setRemindersEnabled:withSpecifier:" get:"_getRemindersEnabled:" detail:0 cell:6 edit:0];

  [v13 setIdentifier:@"HANDWASHING_REMINDERS_ID"];
  v14 = +[NSNumber numberWithBool:[(BRKRemindersSettingsHelper *)self->_helper areRemindersAvailable]];
  [v13 setProperty:v14 forKey:PSEnabledKey];

  [v13 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  v17[0] = v3;
  v17[1] = v13;
  objc_super v15 = +[NSArray arrayWithObjects:v17 count:2];

  return v15;
}

- (BOOL)_needsRemindersSpecifiers
{
  LODWORD(v3) = [(BRKSettings *)self->_brookSettings isEnabled];
  if (v3)
  {
    id v3 = [(BRKSettingsViewController *)self alertingMode];
    if (v3) {
      LOBYTE(v3) = ![(BRKSettingsViewController *)self _isDeviceSatellitePaired];
    }
  }
  return (char)v3;
}

- (void)_updateRemindersSpecifiers
{
  if ([(BRKSettings *)self->_brookSettings areRemindersEnabled]
    && ([(BRKRemindersSettingsHelper *)self->_helper areRemindersAvailable] & 1) == 0)
  {
    [(BRKSettings *)self->_brookSettings setRemindersEnabled:0];
  }
  id v3 = [(BRKSettingsViewController *)self specifierForID:@"HANDWASHING_REMINDERS_GROUP_ID"];
  id v4 = [(BRKSettingsViewController *)self specifierForID:@"HANDWASHING_REMINDERS_ID"];
  unsigned int v5 = [(BRKSettingsViewController *)self _needsRemindersSpecifiers];
  if (v5 && v3)
  {
    v16[0] = v3;
    v16[1] = v4;
    id v6 = +[NSArray arrayWithObjects:v16 count:2];
    id v7 = [(BRKSettingsViewController *)self _newRemindersSpecifiers];
    [(BRKSettingsViewController *)self replaceContiguousSpecifiers:v6 withSpecifiers:v7 animated:0];

LABEL_19:
    goto LABEL_20;
  }
  if (v3) {
    char v8 = v5;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    v15[0] = v3;
    v15[1] = v4;
    id v6 = +[NSArray arrayWithObjects:v15 count:2];
    [(BRKSettingsViewController *)self removeContiguousSpecifiers:v6 animated:1];
    goto LABEL_19;
  }
  if (v3) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = v5;
  }
  if (v9 == 1)
  {
    id v10 = [(BRKSettingsViewController *)self settingsMode];
    v11 = @"NOTIFICATION_COALESCING_GROUP_ID";
    if (!v10) {
      v11 = @"HANDWASHING_TIMER_ID";
    }
    v12 = v11;
    id v13 = [(BRKSettingsViewController *)self _newRemindersSpecifiers];
    v14 = [(BRKSettingsViewController *)self specifierForID:v12];

    [(BRKSettingsViewController *)self insertContiguousSpecifiers:v13 afterSpecifier:v14 animated:1];
  }
LABEL_20:
}

- (void)_setTimerEnabled:(id)a3 withSpecifier:(id)a4
{
  -[BRKSettings setEnabled:](self->_brookSettings, "setEnabled:", [a3 BOOLValue]);
  [(BRKSettingsViewController *)self _updateRemindersSpecifiers];
  if (([(BRKSettings *)self->_brookSettings isOnboardingComplete] & 1) == 0)
  {
    unsigned int v5 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "User manually enabled/disabled Brook. Skipping onboarding.", v6, 2u);
    }

    [(BRKSettings *)self->_brookSettings setOnboardingComplete:1];
  }
  [(BRKSettingsViewController *)self _showDataCollectionOptInIfNeeded];
}

- (id)_getTimerEnabled:(id)a3
{
  id v3 = [(BRKSettings *)self->_brookSettings isEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setRemindersEnabled:(id)a3 withSpecifier:(id)a4
{
  -[BRKSettings setRemindersEnabled:](self->_brookSettings, "setRemindersEnabled:", [a3 BOOLValue]);
  if ([(BRKSettings *)self->_brookSettings areRemindersEnabled])
  {
    helper = self->_helper;
    [(BRKRemindersSettingsHelper *)helper requestLocationAuthorizationIfNeeded];
  }
}

- (id)_getRemindersEnabled:(id)a3
{
  if ([(BRKSettings *)self->_brookSettings areRemindersEnabled]) {
    [(BRKRemindersSettingsHelper *)self->_helper requestLocationAuthorizationIfNeeded];
  }
  id v4 = [(BRKSettings *)self->_brookSettings areRemindersEnabled];

  return +[NSNumber numberWithBool:v4];
}

- (BOOL)_isDeviceSatellitePaired
{
  id v2 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)_settingsDidUpdate
{
}

- (void)_applicationDidBecomeActive
{
}

- (void)_contactStoreDidChange
{
}

- (void)_handleRemindersFooterHyperlinkTapped
{
  if (([(BRKRemindersSettingsHelper *)self->_helper isMeCardAvailable] & 1) != 0
    || ([(BRKRemindersSettingsHelper *)self->_helper isLocationAvailable] & 1) != 0)
  {
    if ([(BRKRemindersSettingsHelper *)self->_helper isLocationAvailable])
    {
      if ([(BRKRemindersSettingsHelper *)self->_helper isLocationAuthorizationValid])
      {
        unsigned int v5 = BRKLoggingObjectForDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_2238(v5);
        }
      }
      else
      {
        [(BRKSettingsViewController *)self _openURLString:@"prefs:root=Privacy&path=LOCATION"];
      }
    }
    else
    {
      [(BRKSettingsViewController *)self _presentMeContactCard];
    }
  }
  else
  {
    [(BRKSettingsViewController *)self _presentNewContactCard];
  }
}

- (void)_openURLString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EA8;
  block[3] = &unk_41E8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_presentMeContactCard
{
  helper = self->_helper;
  uint64_t v4 = +[CNContactViewController descriptorForRequiredKeys];
  v12 = v4;
  id v5 = +[NSArray arrayWithObjects:&v12 count:1];
  id v6 = [(BRKRemindersSettingsHelper *)helper meContactWithKeysToFetch:v5];

  if (v6)
  {
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissPresentedViewController"];
    char v8 = +[CNContactViewController viewControllerForContact:v6];
    [v8 setAllowsEditing:1];
    unsigned int v9 = [v8 navigationItem];
    [v9 setRightBarButtonItem:v7];

    id v10 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
    v11 = [(BRKSettingsViewController *)self rootController];
    [v11 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id v7 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_22BC(v7);
    }
  }
}

- (void)_presentNewContactCard
{
  id v5 = +[CNContactViewController viewControllerForNewContact:0];
  [v5 setDelegate:self];
  id v3 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  uint64_t v4 = [(BRKSettingsViewController *)self rootController];
  [v4 presentViewController:v3 animated:1 completion:0];
}

- (void)_dismissPresentedViewController
{
  [(BRKRemindersSettingsHelper *)self->_helper update];
  id v4 = [(BRKSettingsViewController *)self rootController];
  id v3 = [v4 presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_brookSettings, 0);
}

@end