@interface InternationalSettingsController
+ (id)canonicalLocaleIdentifierWithValidCalendarForComponents:(id)a3;
+ (id)formattedMoneyAndNumbers:(id)a3;
+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4;
+ (void)loadFormatExampleWithSpecifiers:(id)a3;
+ (void)loadRegionWithSpecifiers:(id)a3;
+ (void)mirrorToWatchIfNecessary;
+ (void)postNotificationForLanguageChange;
+ (void)setLanguage:(id)a3;
+ (void)setPreferredLanguages:(id)a3;
+ (void)syncPreferencesAndPostNotificationForLanguageChange;
+ (void)syncPreferencesForLanguageOrLocaleChange;
+ (void)syncToCloudSettings;
+ (void)writeLanguageAndLocaleConfigurationIfNeededWithCompletion:(id)a3;
- (BOOL)changePrimaryLanguage;
- (BOOL)shouldReloadSpecifiers;
- (InternationalSettingsController)init;
- (NSArray)deviceLanguageGroup;
- (NSArray)preferredLanguagesGroup;
- (NSArray)regionFormatExampleGroup;
- (NSArray)regionFormatGroup;
- (NSOperationQueue)reloadQueue;
- (PSSpecifier)numberingSystemSpecifier;
- (_TtC21InternationalSettings8Settings)settings;
- (id)calendar:(id)a3;
- (id)currentCalendarDisplayString;
- (id)currentInflectionDisplayString;
- (id)language:(id)a3;
- (id)liveTextEnabled;
- (id)locale:(id)a3;
- (id)localizedLanguage:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)changeLanguage:(id)a3;
- (void)dealloc;
- (void)emitNavigationEventForRootController;
- (void)inflectionSettingViewController:(id)a3 shareSettingDidChange:(BOOL)a4;
- (void)inflectionSettingsViewController:(id)a3 inflectionDidChange:(id)a4;
- (void)logStatistics;
- (void)reloadLocale:(id)a3;
- (void)reloadOnLocaleChange;
- (void)setCalendar:(id)a3 specifier:(id)a4;
- (void)setChangePrimaryLanguage:(BOOL)a3;
- (void)setDeviceLanguageGroup:(id)a3;
- (void)setLiveTextEnabled:(id)a3 specifier:(id)a4;
- (void)setLocaleOnly:(id)a3;
- (void)setNumberingSystemSpecifier:(id)a3;
- (void)setPreferredLanguagesGroup:(id)a3;
- (void)setRegionFormatExampleGroup:(id)a3;
- (void)setRegionFormatGroup:(id)a3;
- (void)setReloadQueue:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShouldReloadSpecifiers:(BOOL)a3;
- (void)showLanguageSheet:(id)a3;
- (void)showOfficialLanguageSheet:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation InternationalSettingsController

- (InternationalSettingsController)init
{
  v10.receiver = self;
  v10.super_class = (Class)InternationalSettingsController;
  v2 = [(ISInternationalViewController *)&v10 init];
  v3 = objc_alloc_init(_TtC21InternationalSettings8Settings);
  settings = v2->_settings;
  v2->_settings = v3;

  uint64_t v5 = objc_opt_new();
  reloadQueue = v2->_reloadQueue;
  v2->_reloadQueue = (NSOperationQueue *)v5;

  [(NSOperationQueue *)v2->_reloadQueue setMaxConcurrentOperationCount:1];
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:v2 selector:"reloadOnLocaleChange" name:NSCurrentLocaleDidChangeNotification object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:v2 selector:"logStatistics" name:UIApplicationDidEnterBackgroundNotification object:0];

  return v2;
}

- (void)reloadOnLocaleChange
{
  id v3 = objc_alloc_init((Class)NSBlockOperation);
  objc_initWeak(&location, v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2F84;
  v6[3] = &unk_30BF0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v3 addExecutionBlock:v6];
  v4 = [(InternationalSettingsController *)self reloadQueue];
  [v4 cancelAllOperations];

  uint64_t v5 = [(InternationalSettingsController *)self reloadQueue];
  [v5 addOperation:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)logStatistics
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InternationalSettingsController;
  [(InternationalSettingsController *)&v4 viewWillAppear:a3];
  self->super._deviceLanguageIndex = -1;
  if ([(InternationalSettingsController *)self shouldReloadSpecifiers]) {
    [(InternationalSettingsController *)self reloadSpecifiers];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InternationalSettingsController;
  [(InternationalSettingsController *)&v4 viewDidAppear:a3];
  [(InternationalSettingsController *)self emitNavigationEventForRootController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InternationalSettingsController;
  [(InternationalSettingsController *)&v4 viewWillDisappear:a3];
  if (([(InternationalSettingsController *)self isMovingFromParentViewController] & 1) != 0|| [(InternationalSettingsController *)self isBeingDismissed])
  {
    [(InternationalSettingsController *)self logStatistics];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(InternationalSettingsController *)self isEditing])
  {
    v20.receiver = self;
    v20.super_class = (Class)InternationalSettingsController;
    v8 = [(ISInternationalViewController *)&v20 tableView:v6 cellForRowAtIndexPath:v7];
  }
  else
  {
    id v9 = [(InternationalSettingsController *)self indexForIndexPath:v7];
    objc_super v10 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v9];
    v21.receiver = self;
    v21.super_class = (Class)InternationalSettingsController;
    v8 = [(ISInternationalViewController *)&v21 tableView:v6 cellForRowAtIndexPath:v7];
    v11 = [v10 identifier];
    unsigned int v12 = [v11 isEqualToString:@"LOCALE"];

    if (v12)
    {
      v13 = +[NSLocale _deviceLanguage];
      v14 = +[NSLocale localeWithLocaleIdentifier:v13];
      v15 = [v10 propertyForKey:@"country"];
      v16 = [v14 localizedStringForRegion:v15 context:3 short:0];
      v17 = [v8 detailTextLabel];
      [v17 setText:v16];

      v18 = [v8 detailTextLabel];
      [v18 setLineBreakMode:5];
    }
  }

  return v8;
}

- (void)showLanguageSheet:(id)a3
{
  objc_super v4 = (char *)a3;
  uint64_t v5 = objc_alloc_init(ISDeviceLanguageSetupController);
  [(ISDeviceLanguageSetupController *)v5 setParentController:self];
  [(ISDeviceLanguageSetupController *)v5 setSpecifier:v4];
  objc_storeWeak((id *)&v4[OBJC_IVAR___PSSpecifier_target], self);

  [(InternationalSettingsController *)self showController:v5];
}

- (void)showOfficialLanguageSheet:(id)a3
{
  objc_super v4 = (char *)a3;
  uint64_t v5 = [(ISLanguageSetupController *)[ISDeviceLanguageSetupController alloc] initWithOfficialLanguages];
  [(ISDeviceLanguageSetupController *)v5 setParentController:self];
  [(ISDeviceLanguageSetupController *)v5 setSpecifier:v4];
  objc_storeWeak((id *)&v4[OBJC_IVAR___PSSpecifier_target], self);

  [(InternationalSettingsController *)self showController:v5];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)InternationalSettingsController;
  [(InternationalSettingsController *)&v4 dealloc];
}

- (void)reloadLocale:(id)a3
{
  id v11 = a3;
  objc_super v4 = [(ISInternationalViewController *)self numberingSystemsValues];
  id v5 = [v4 count];

  uint64_t v6 = [v11 specifierForID:@"NUMBERING_SYSTEM"];
  id v7 = (void *)v6;
  if ((unint64_t)v5 < 2)
  {
    if (v6)
    {
      [(InternationalSettingsController *)self setNumberingSystemSpecifier:v6];
      [v11 removeObject:v7];
    }
  }
  else if (!v6)
  {
    v8 = [(InternationalSettingsController *)self numberingSystemSpecifier];

    if (v8)
    {
      id v9 = [v11 indexOfSpecifierWithID:@"CALENDAR"];
      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
        id v9 = [v11 count];
      }
      objc_super v10 = [(InternationalSettingsController *)self numberingSystemSpecifier];
      [v11 insertObject:v10 atIndex:v9];
    }
  }

  [(id)objc_opt_class() loadRegionWithSpecifiers:v11];
  [(id)objc_opt_class() loadFormatExampleWithSpecifiers:v11];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers]
    || [(InternationalSettingsController *)self shouldReloadSpecifiers])
  {
    uint64_t v24 = v3;
    objc_super v4 = [(InternationalSettingsController *)self loadSpecifiersFromPlistName:@"InternationalSettings" target:self];
    id v5 = [v4 mutableCopy];

    v23 = [(InternationalSettingsController *)self settings];
    v22 = [v23 temperatureUnitSpecifier];
    v25[0] = v22;
    objc_super v21 = [(InternationalSettingsController *)self settings];
    objc_super v20 = [v21 measurementSystemSpecifier];
    v25[1] = v20;
    uint64_t v6 = [(InternationalSettingsController *)self settings];
    id v7 = [v6 firstWeekdaySpecifier];
    v25[2] = v7;
    v8 = objc_alloc_init(_TtC21InternationalSettings17DateFormatSetting);
    id v9 = [(DateFormatSetting *)v8 dateFormatSpecifier];
    v25[3] = v9;
    objc_super v10 = [(InternationalSettingsController *)self settings];
    id v11 = [v10 numberFormatSpecifier];
    v25[4] = v11;
    unsigned int v12 = +[NSArray arrayWithObjects:v25 count:5];
    v13 = [v5 specifierForID:@"CALENDAR"];
    objc_msgSend(v5, "ps_insertObjectsFromArray:afterObject:", v12, v13);

    if ((+[_NSAttributedStringGrammarInflection canSelectUserInflection] & 1) == 0)
    {
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "indexOfSpecifierWithID:", @"INFLECTION_GROUP"));
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "indexOfSpecifierWithID:", @"INFLECTION_CELL"));
    }
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "indexOfSpecifierWithID:", @"LIVE_TEXT_GROUP"));
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "indexOfSpecifierWithID:", @"LIVE_TEXT_CELL"));
    }
    uint64_t v3 = v24;
    if ([v5 count]) {
      [(ISInternationalViewController *)self addLanguagesToSpecifiers:v5];
    }
    [(InternationalSettingsController *)self reloadLocale:v5];
    v14 = *(void **)&self->super.PSListController_opaque[v24];
    *(void *)&self->super.PSListController_opaque[v24] = v5;

    v15 = [(InternationalSettingsController *)self table];
    unsigned __int8 v16 = [v15 isEditing];

    if ((v16 & 1) == 0)
    {
      v17 = [(InternationalSettingsController *)self table];
      [v17 reloadData];
    }
    self->_shouldReloadSpecifiers = 0;
  }
  v18 = *(void **)&self->super.PSListController_opaque[v3];

  return v18;
}

- (id)language:(id)a3
{
  return +[NSLocale _deviceLanguage];
}

- (id)localizedLanguage:(id)a3
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = +[NSLocale _deviceLanguage];
  id v5 = [v3 localizedStringForKey:v4 value:&stru_31478 table:@"InternationalSettings"];

  return v5;
}

+ (void)setLanguage:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:a1 name:NSCurrentLocaleDidChangeNotification object:0];

  +[NSLocale setPreferredLanguageAndUpdateLocale:v4];
  uint64_t v6 = objc_opt_class();

  [v6 syncPreferencesAndPostNotificationForLanguageChange];
}

+ (void)syncPreferencesAndPostNotificationForLanguageChange
{
  [a1 syncPreferencesForLanguageOrLocaleChange];

  _[a1 postNotificationForLanguageChange];
}

+ (void)syncPreferencesForLanguageOrLocaleChange
{
  uint64_t v3 = +[UIApplication sharedApplication];
  id v4 = [v3 beginBackgroundTaskWithName:@"com.apple.InternationalSettings.setLanguagesToIdMS" expirationHandler:0];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3BD4;
  v5[3] = &unk_30C10;
  v5[4] = v4;
  [a1 writeLanguageAndLocaleConfigurationIfNeededWithCompletion:v5];
  [a1 mirrorToWatchIfNecessary];
  [a1 syncToCloudSettings];
}

+ (void)syncToCloudSettings
{
  id v2 = [sub_3C80() sharedCloudSettingsManager];
  [v2 writeToCloudSettings:&off_32950 forStore:@"com.apple.cloudsettings.international"];
}

+ (void)writeLanguageAndLocaleConfigurationIfNeededWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  id v4 = [sub_3E4C() sharedManager];
  unsigned __int8 v5 = [v4 isSharedIPad];

  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3F30;
    block[3] = &unk_30C60;
    v8 = v3;
    dispatch_async(v6, block);
  }
  else if (v3)
  {
    v3[2](v3);
  }
}

+ (void)postNotificationForLanguageChange
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleLanguagePreferencesChangedNotification", 0, 0, 1u);
  uint64_t v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v3, @"AppleKeyboardsPreferencesChangedNotification", 0, 0, 1u);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v4, @"com.apple.language.changed", 0, 0, 1u);

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_30CA0);
}

+ (void)mirrorToWatchIfNecessary
{
  if (PSIsNanoMirroringDomain() && (COSActivePairingIsTinker() & 1) == 0)
  {
    v8 = [[COSLanguageSelector alloc] initWithInternationalController:0];
    id v2 = +[NSLocale preferredLanguages];
    [(COSLanguageSelector *)v8 setLanguages:v2];

    uint64_t v3 = [[COSLocaleSelector alloc] initWithInternationalController:0];
    id v4 = +[NSLocale preferredLocale];
    unsigned __int8 v5 = [v4 localeIdentifier];
    [(COSLocaleSelector *)v3 setLocale:v5];

    uint64_t v6 = [[COSInflectionSelector alloc] initWithInternationalController:0];
    id v7 = +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection];
    [(COSInflectionSelector *)v6 setInflection:v7];

    [(COSInflectionSelector *)v6 setCanShareInflectionWithApps:+[_NSAttributedStringGrammarInflection _thirdPartyApplicationsCanAccessUserInflection]];
  }
}

- (id)currentInflectionDisplayString
{
  id v2 = +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection];
  uint64_t v3 = [v2 localizedShortDescription];

  return v3;
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)InternationalSettingsController;
  unsigned __int8 v5 = [(InternationalSettingsController *)&v10 selectSpecifier:v4];
  id v6 = [v4 detailControllerClass];
  if (v6 == (id)objc_opt_class())
  {
    id v7 = v5;
    v8 = +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection];
    [v7 setInflection:v8];

    objc_msgSend(v7, "setCanShareInflection:", +[_NSAttributedStringGrammarInflection _thirdPartyApplicationsCanAccessUserInflection](_NSAttributedStringGrammarInflection, "_thirdPartyApplicationsCanAccessUserInflection"));
    [v7 setDelegate:self];
  }
  +[InternationalSettingsController emitNavigationEventForSpecifier:v4 viewController:v5];

  return v5;
}

- (void)inflectionSettingsViewController:(id)a3 inflectionDidChange:(id)a4
{
  id v5 = a4;
  id v9 = +[BMStreams discoverabilitySignal];
  id v6 = [objc_alloc((Class)BMDiscoverabilitySignalEvent) initWithIdentifier:@"com.apple.InternationalSettings.inflection-set" bundleID:@"com.apple.InternationalSettings" context:0];
  id v7 = [v9 source];
  [v7 sendEvent:v6];

  [v5 _setAsGlobalUserInflection];
  [(InternationalSettingsController *)self reloadSpecifiers];
  v8 = [sub_3C80() sharedCloudSettingsManager];
  [v8 writeToCloudSettings:&off_32968 forStore:@"com.apple.cloudsettings.international"];

  [(id)objc_opt_class() syncPreferencesForLanguageOrLocaleChange];
}

- (void)inflectionSettingViewController:(id)a3 shareSettingDidChange:(BOOL)a4
{
  +[_NSAttributedStringGrammarInflection _setThirdPartyApplicationsCanAccessUserInflection:a4];
  id v4 = objc_opt_class();

  [v4 syncPreferencesForLanguageOrLocaleChange];
}

- (id)locale:(id)a3
{
  id v4 = a3;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(InternationalSettingsController *)self specifierForID:@"LOCALE"]; {
    sub_20BBC();
  }

  id v5 = [v4 propertyForKey:PSValueKey];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSLocale currentLocale];
  }
  v8 = v7;

  return v8;
}

- (void)setCalendar:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  id v4 = +[NSLocale currentLocale];
  id v5 = [v4 localeIdentifier];

  id v6 = +[NSLocale componentsFromLocaleIdentifier:v5];
  id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  v8 = +[IntlUtility defaultCalendarForLocaleID:v5];
  if ([v8 isEqual:v10]) {
    [v7 removeObjectForKey:@"calendar"];
  }
  else {
    [v7 setObject:v10 forKey:@"calendar"];
  }
  if (([v6 isEqual:v7] & 1) == 0)
  {
    uint64_t v9 = +[NSLocale canonicalLocaleIdentifierFromComponents:v7];

    +[NSLocale setLocaleOnly:v9];
    [(id)objc_opt_class() syncPreferencesForLanguageOrLocaleChange];
    id v5 = (void *)v9;
  }
}

- (id)calendar:(id)a3
{
  id v4 = a3;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(InternationalSettingsController *)self specifierForID:@"CALENDAR"]; {
    sub_20BE8();
  }

  id v5 = [v4 propertyForKey:PSValueKey];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = +[NSLocale currentLocale];
    uint64_t v9 = [v8 localeIdentifier];

    id v10 = +[NSLocale componentsFromLocaleIdentifier:v9];
    id v7 = [v10 objectForKey:@"calendar"];
    if (!v7)
    {
      id v7 = +[IntlUtility defaultCalendarForLocaleID:v9];
    }
  }

  return v7;
}

- (id)liveTextEnabled
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"AppleLiveTextEnabled" inDomain:NSGlobalDomain];

  if (v3)
  {
    unint64_t v4 = (unint64_t)[v3 BOOLValue];
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      id v5 = [&off_32998 arrayByAddingObjectsFromArray:&off_329B0];
    }
    else
    {
      id v5 = &off_32998;
    }
    id v6 = +[NSLocale _deviceLanguage];
    id v11 = v6;
    id v7 = +[NSArray arrayWithObjects:&v11 count:1];
    v8 = +[NSLocale matchedLanguagesFromAvailableLanguages:v5 forPreferredLanguages:v7];

    unint64_t v4 = [v8 count] != 0;
  }

  uint64_t v9 = +[NSNumber numberWithBool:v4];

  return v9;
}

- (void)setLiveTextEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 BOOLValue];
  if (!v7) {
    goto LABEL_6;
  }
  if (_os_feature_enabled_impl())
  {
    v8 = [&off_32998 arrayByAddingObjectsFromArray:&off_329B0];
  }
  else
  {
    v8 = &off_32998;
  }
  uint64_t v9 = +[NSLocale _deviceLanguage];
  v50 = v9;
  id v10 = +[NSArray arrayWithObjects:&v50 count:1];
  id v11 = +[NSLocale matchedLanguagesFromAvailableLanguages:v8 forPreferredLanguages:v10];

  id v12 = [v11 count];
  if (!v12)
  {
    v41 = self;
    v42 = v6;
    unsigned __int8 v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v16 localizedStringForKey:@"LIVE_TEXT_ALERT_MESSAGE_%@" value:&stru_31478 table:@"InternationalSettings"];

    v17 = objc_opt_new();
    v18 = [v17 supportedRecognitionLanguagesAndReturnError:0];

    v19 = +[NSMutableOrderedSet orderedSet];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v20 = v18;
    id v21 = [v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = +[NSLocale localeWithLocaleIdentifier:*(void *)(*((void *)&v45 + 1) + 8 * (void)v24)];
          v26 = [v25 languageCode];

          v27 = +[NSLocale currentLocale];
          v28 = [v27 localizedStringForLanguage:v26 context:5];

          [v19 addObject:v28];
          uint64_t v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        id v22 = [v20 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v22);
    }

    [v19 sortUsingComparator:&stru_30CE0];
    v29 = [v19 array];
    v40 = +[NSListFormatter localizedStringByJoiningStrings:v29];

    v39 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v40);
    v30 = +[NSBundle bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"LIVE_TEXT_ALERT_TITLE" value:&stru_31478 table:@"InternationalSettings"];
    v32 = +[UIAlertController alertControllerWithTitle:v31 message:v39 preferredStyle:1];

    v33 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"LIVE_TEXT_CANCEL" value:&stru_31478 table:@"InternationalSettings"];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_51F8;
    v43[3] = &unk_30D08;
    id v6 = v42;
    v43[4] = v41;
    id v44 = v42;
    v35 = +[UIAlertAction actionWithTitle:v34 style:1 handler:v43];

    v36 = +[NSBundle bundleForClass:objc_opt_class()];
    v37 = [v36 localizedStringForKey:@"LIVE_TEXT_TURN_ON" value:&stru_31478 table:@"InternationalSettings"];
    v38 = +[UIAlertAction actionWithTitle:v37 style:0 handler:&stru_30D48];

    [v32 addAction:v35];
    [v32 addAction:v38];
    [v32 setPreferredAction:v38];
    [(InternationalSettingsController *)v41 presentViewController:v32 animated:1 completion:0];
  }
  else
  {
LABEL_6:
    v13 = +[NSUserDefaults standardUserDefaults];
    v14 = +[NSNumber numberWithBool:v7];
    [v13 setObject:v14 forKey:@"AppleLiveTextEnabled" inDomain:NSGlobalDomain];

    v15 = [sub_3C80() sharedCloudSettingsManager];
    [v15 writeToCloudSettings:&off_32980 forStore:@"com.apple.cloudsettings.international"];
  }
}

- (id)currentCalendarDisplayString
{
  id v2 = +[ISInternationalLocaleRepresentation sharedInstance];
  uint64_t v3 = [v2 calendarIdentifier];

  unint64_t v4 = [v3 uppercaseString];
  id v5 = [v4 stringByAppendingString:@"_CALENDAR"];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:v5 value:&stru_31478 table:@"InternationalCalendar"];

  id v8 = v7;
  uint64_t v9 = v8;
  if ([UIApp userInterfaceLayoutDirection] != (char *)&dword_0 + 1) {
    goto LABEL_13;
  }
  id v10 = +[ISInternationalLocaleRepresentation sharedInstance];
  id v11 = (char *)[v10 calendarDirectionality];

  if (v11 == (unsigned char *)&dword_0 + 2)
  {
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = v12;
    CFStringRef v14 = @"CALENDAR_DIRECTIONALITY_RIGHT_TO_LEFT";
  }
  else
  {
    if (v11 != (unsigned char *)&dword_0 + 1)
    {
      v15 = 0;
      goto LABEL_8;
    }
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = v12;
    CFStringRef v14 = @"CALENDAR_DIRECTIONALITY_LEFT_TO_RIGHT";
  }
  v15 = [v12 localizedStringForKey:v14 value:&stru_31478 table:@"InternationalCalendar"];

LABEL_8:
  uint64_t v9 = v8;
  if ([v15 length])
  {
    unsigned __int8 v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CALENDAR_TYPE_PLUS_DIRECTIONALITY_FORMAT" value:&stru_31478 table:@"InternationalCalendar"];

    uint64_t v9 = v8;
    if ([v17 length])
    {
      uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v8, v15);
    }
  }

LABEL_13:

  return v9;
}

+ (id)canonicalLocaleIdentifierWithValidCalendarForComponents:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSLocale canonicalLocaleIdentifierFromComponents:v3];
  id v5 = +[IntlUtility defaultCalendarForLocaleID:v4];
  id v6 = [v3 objectForKey:@"calendar"];

  if (v6)
  {
    id v7 = [v3 objectForKey:@"calendar"];
    unsigned int v8 = [v7 isEqualToString:v5];

    if (!v8) {
      goto LABEL_7;
    }
    [v3 removeObjectForKey:@"calendar"];
  }
  else
  {
    uint64_t v9 = +[IntlUtility supportedCalendars];
    unsigned __int8 v10 = [v9 containsObject:v5];

    if (v10) {
      goto LABEL_7;
    }
    [v3 setObject:NSCalendarIdentifierGregorian forKey:@"calendar"];
  }
  uint64_t v11 = +[NSLocale canonicalLocaleIdentifierFromComponents:v3];

  unint64_t v4 = (void *)v11;
LABEL_7:

  return v4;
}

+ (id)formattedMoneyAndNumbers:(id)a3
{
  id v3 = objc_alloc_init((Class)NSNumberFormatter);
  [v3 setNumberStyle:2];
  unint64_t v4 = [v3 stringFromNumber:&off_329F8];
  [v3 setNumberStyle:1];
  id v5 = [v3 stringFromNumber:&off_32A08];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"DISPLAY_SAMPLE_MONEY_%@_AND_NUMBER_%@" value:&stru_31478 table:@"InternationalSettings"];
  unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v4, v5);

  return v8;
}

- (void)changeLanguage:(id)a3
{
  unint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];

  id v5 = [(ISInternationalViewController *)self updatedAppleLanguages];
  id v6 = [(ISInternationalViewController *)self topLanguageFromArray:v5];
  +[NSLocale setLocaleAfterLanguageChange:v6];

  id v7 = objc_opt_class();
  unsigned int v8 = [(ISInternationalViewController *)self updatedAppleLanguages];
  [v7 setPreferredLanguages:v8];

  uint64_t v9 = +[ISInternationalLocaleRepresentation sharedInstance];
  [v9 setCalendarDirectionality:0];

  unsigned __int8 v10 = [(id)objc_opt_class() deviceLanguageIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_58A8;
  v11[3] = &unk_30D70;
  v11[4] = self;
  [(InternationalSettingsController *)self showUpdatingLanguageViewWithLocalizationStringKey:@"CHANGE_UI_LANGUAGE_TEXT" languageIdentifier:v10 completionBlock:v11];

  [(ISInternationalViewController *)self setUpdatedAppleLanguages:0];
}

+ (void)setPreferredLanguages:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSMutableOrderedSet orderedSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v9), (void)v14);
        if ([v10 length]) {
          [v4 addObject:v10];
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v4 array];
      id v12 = +[NSLocale preferredLanguages];
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting preferred languages to %{public}@. Current languages is %{public}@.", buf, 0x16u);
    }
    v13 = objc_msgSend(v4, "array", (void)v14);
    +[NSLocale setPreferredLanguages:v13];
  }
}

- (void)setLocaleOnly:(id)a3
{
  +[NSLocale setLocaleOnly:a3];
  id v3 = objc_opt_class();

  [v3 syncPreferencesForLanguageOrLocaleChange];
}

- (void)emitNavigationEventForRootController
{
  id v8 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/INTERNATIONAL"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  unint64_t v4 = +[NSLocale currentLocale];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"INTERNATIONAL" table:@"InternationalSettings" locale:v4 bundleURL:v6];

  [(InternationalSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.language" title:v7 localizedNavigationComponents:&__NSArray0__struct deepLink:v8];
}

+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_class();
  if ([v7 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = v6;
    uint64_t v9 = [v5 identifier];
    if (v9)
    {
      unsigned __int8 v10 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.General/INTERNATIONAL/%@", v9];
      uint64_t v11 = +[NSURL URLWithString:v10];
      v33[0] = @"CALENDAR";
      v33[1] = @"TEMPERATURE_UNIT";
      v33[2] = @"MEASUREMENT_SYSTEM";
      v33[3] = @"FIRST_WEEKDAY";
      v33[4] = @"DATE_FORMAT";
      v33[5] = @"NUMBER_FORMAT";
      id v12 = +[NSArray arrayWithObjects:v33 count:6];
      if ([v12 containsObject:v9])
      {
        v29 = v11;
        id v13 = objc_alloc((Class)_NSLocalizedStringResource);
        long long v14 = +[NSLocale currentLocale];
        v31 = v8;
        long long v15 = +[NSBundle bundleForClass:objc_opt_class()];
        long long v16 = [v15 bundleURL];
        id v28 = [v13 initWithKey:@"GENERAL" table:@"InternationalSettings" locale:v14 bundleURL:v16];

        id v17 = objc_alloc((Class)_NSLocalizedStringResource);
        v18 = +[NSLocale currentLocale];
        v19 = +[NSBundle bundleForClass:objc_opt_class()];
        [v19 bundleURL];
        __int16 v20 = v30 = v10;
        id v21 = [v17 initWithKey:@"INTERNATIONAL" table:@"InternationalSettings" locale:v18 bundleURL:v20];

        uint64_t v11 = v29;
        id v22 = objc_alloc((Class)_NSLocalizedStringResource);
        uint64_t v23 = +[NSLocale currentLocale];
        uint64_t v24 = +[NSBundle bundleForClass:objc_opt_class()];
        v25 = [v24 bundleURL];
        id v26 = [v22 initWithKey:v9 table:@"InternationalSettings" locale:v23 bundleURL:v25];

        id v8 = v31;
        v32[0] = v28;
        v32[1] = v21;
        v27 = +[NSArray arrayWithObjects:v32 count:2];
        objc_msgSend(v31, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.language", v26, v27, v29);

        unsigned __int8 v10 = v30;
      }
    }
  }
}

- (BOOL)shouldReloadSpecifiers
{
  return self->_shouldReloadSpecifiers;
}

- (void)setShouldReloadSpecifiers:(BOOL)a3
{
  self->_shouldReloadSpecifiers = a3;
}

- (_TtC21InternationalSettings8Settings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSArray)deviceLanguageGroup
{
  return self->_deviceLanguageGroup;
}

- (void)setDeviceLanguageGroup:(id)a3
{
}

- (NSArray)preferredLanguagesGroup
{
  return self->_preferredLanguagesGroup;
}

- (void)setPreferredLanguagesGroup:(id)a3
{
}

- (NSArray)regionFormatGroup
{
  return self->_regionFormatGroup;
}

- (void)setRegionFormatGroup:(id)a3
{
}

- (NSArray)regionFormatExampleGroup
{
  return self->_regionFormatExampleGroup;
}

- (void)setRegionFormatExampleGroup:(id)a3
{
}

- (BOOL)changePrimaryLanguage
{
  return self->_changePrimaryLanguage;
}

- (void)setChangePrimaryLanguage:(BOOL)a3
{
  self->_changePrimaryLanguage = a3;
}

- (PSSpecifier)numberingSystemSpecifier
{
  return self->_numberingSystemSpecifier;
}

- (void)setNumberingSystemSpecifier:(id)a3
{
}

- (NSOperationQueue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setReloadQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_numberingSystemSpecifier, 0);
  objc_storeStrong((id *)&self->_regionFormatExampleGroup, 0);
  objc_storeStrong((id *)&self->_regionFormatGroup, 0);
  objc_storeStrong((id *)&self->_preferredLanguagesGroup, 0);
  objc_storeStrong((id *)&self->_deviceLanguageGroup, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

+ (void)loadRegionWithSpecifiers:(id)a3
{
  id v3 = a3;
  sub_1B5CC(v3);
}

+ (void)loadFormatExampleWithSpecifiers:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_1B0B8(v4);
}

@end