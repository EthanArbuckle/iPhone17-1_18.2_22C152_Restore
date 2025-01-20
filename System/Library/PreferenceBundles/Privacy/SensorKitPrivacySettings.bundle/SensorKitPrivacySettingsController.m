@interface SensorKitPrivacySettingsController
+ (void)initialize;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)presentingEnableSensorKit;
- (NSString)followUpBundlePath;
- (SRAuthorizationStore)authStore;
- (SensorKitPrivacySettingsController)init;
- (id)appsAndStudiesWhenFirstRunCompleteGroup;
- (id)appsSpecifierGroup;
- (id)authGroupSpecifierForAuthGroup:(id)a3;
- (id)collectedDataSpecifiers;
- (id)dataAndAppsSpecifiers;
- (id)dataOptionsSpecifiers;
- (id)firstRunGroup;
- (id)globalSwitchSpecifierGroupSpecifiers;
- (id)isGlobalSwitchOn;
- (id)legacyAppsInstalled;
- (id)legacyAppsSpecifiers;
- (id)pendingAppSpecifiers;
- (id)selectSpecifier:(id)a3;
- (id)specifierForID:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)valueForSpecifier:(id)a3;
- (void)authorizationStore:(id)a3 didUpdateAuthorizationsForBundleId:(id)a4 sensors:(id)a5;
- (void)dealloc;
- (void)deleteAllSamples;
- (void)enableSensorKit:(id)a3;
- (void)fetchPendingApp;
- (void)profileSettingsChanged:(id)a3;
- (void)setAuthStore:(id)a3;
- (void)setFollowUpBundlePath:(id)a3;
- (void)setGlobalSwitch:(id)a3;
- (void)setPresentingEnableSensorKit:(BOOL)a3;
- (void)showActionSheet:(id)a3;
- (void)showSensorKitPrivacyPage;
- (void)updateDataCollection:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SensorKitPrivacySettingsController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_11168 = (uint64_t)os_log_create("com.apple.SensorKit", "PrivacySettingsController");
  }
}

- (SensorKitPrivacySettingsController)init
{
  v4.receiver = self;
  v4.super_class = (Class)SensorKitPrivacySettingsController;
  v2 = [(SensorKitPrivacySettingsController *)&v4 init];
  if (v2)
  {
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"profileSettingsChanged:" name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];
    v2->_appsAndStudiesSpecifiers = (NSMutableSet *)+[NSMutableSet set];
    v2->_showPendingApp = 1;
    [(SensorKitPrivacySettingsController *)v2 setAuthStore:+[SRAuthorizationStore allSensorsStore]];
    [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)v2 authStore] addReaderAuthorizationDelegate:v2];
    [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)v2 authStore] addWriterAuthorizationDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)self authStore] removeReaderAuthorizationDelegate:self];
  [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)self authStore] removeWriterAuthorizationDelegate:self];
  [(SensorKitPrivacySettingsController *)self setAuthStore:0];

  self->_appsAndStudiesSpecifiers = 0;
  [(SensorKitPrivacySettingsController *)self setFollowUpBundlePath:0];
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SensorKitPrivacySettingsController;
  [(SensorKitPrivacySettingsController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SensorKitPrivacySettingsController;
  [(SensorKitPrivacySettingsController *)&v6 viewDidAppear:a3];
  id v4 = sub_78A0();
  id v5 = objc_msgSend(objc_alloc((Class)_NSLocalizedStringResource), "initWithKey:table:locale:bundleURL:", @"SENSORKIT_SECTION_TITLE", 0, +[NSLocale currentLocale](NSLocale, "currentLocale"), -[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "bundleURL"));
  [(SensorKitPrivacySettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.research-sensor-and-usage-data" title:v5 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)fetchPendingApp
{
  objc_super v3 = qword_11168;
  if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(location[0]) = 0;
    _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "Looking for a pending app follow up item", (uint8_t *)location, 2u);
  }
  id v4 = objc_alloc_init((Class)SRFollowUp);
  objc_initWeak(location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4014;
  v5[3] = &unk_C308;
  v5[4] = v4;
  objc_copyWeak(&v6, location);
  [v4 pendingFollowUpItemsWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(location);
}

- (id)legacyAppsInstalled
{
  v2 = +[NSSet setWithArray:](NSSet, "setWithArray:", [+[SRAuthorizationClient sharedInstance] legacyResearchStudyBundleIDs]);
  id v3 = [+[SRAuthorizationClient sharedInstance] legacyResearchStudyEntitlement];
  id v4 = +[LSApplicationRecord enumeratorWithOptions:0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_42DC;
  v6[3] = &unk_C330;
  v6[4] = v2;
  v6[5] = v3;
  [v4 setFilter:v6];
  return v4;
}

- (id)firstRunGroup
{
  id v3 = +[PSSpecifier emptyGroupSpecifier];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [(NSBundle *)v4 localizedStringForKey:@"DESCRIPTION_SENSORKIT" value:&stru_C670 table:0];
  id v6 = [(NSBundle *)v4 localizedStringForKey:@"LEARN_MORE" value:&stru_C670 table:0];
  v7 = +[NSString stringWithFormat:@"%@\n%@\n", v5, v6];
  v8 = (objc_class *)objc_opt_class();
  [v3 setObject:NSStringFromClass(v8) forKeyedSubscript:PSFooterCellClassGroupKey];
  [v3 setObject:v7 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  v11.location = (NSUInteger)[(NSString *)v7 rangeOfString:v6];
  [v3 setObject:NSStringFromRange(v11) forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];
  v9 = +[NSValue valueWithNonretainedObject:self];
  [v3 setObject:v9 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];
  [v3 setObject:@"showSensorKitPrivacyPage" forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  return v3;
}

- (id)appsAndStudiesWhenFirstRunCompleteGroup
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = +[NSMutableDictionary dictionary];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v12 = sub_46FC;
  v13 = &unk_C358;
  id v14 = v5;
  id v15 = v4;
  v16 = self;
  sub_46FC((uint64_t)v11, [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)self authStore] readerAuthorizationBundleIdValues]);
  id v6 = [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)self authStore] writerAuthorizationValues];
  v12((uint64_t)v11, v6);
  v7 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v4 allValues]);
  v8 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v5 allValues]);
  [(NSMutableArray *)v7 sortUsingFunction:sub_4A78 context:0];
  [(NSMutableArray *)v8 sortUsingFunction:sub_4A78 context:0];
  objc_msgSend(v3, "addObject:", -[SensorKitPrivacySettingsController appsSpecifierGroup](self, "appsSpecifierGroup"));
  if ([(NSMutableSet *)self->_appsAndStudiesSpecifiers count])
  {
    [v3 addObjectsFromArray:v7];
    [v3 addObjectsFromArray:v8];
  }
  else
  {
    v9 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NO_APPS_OR_STUDIES_AUTHORIZED" value:&stru_C670 table:0];
    objc_msgSend(v3, "addObject:", +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, "valueForSpecifier:", objc_opt_class(), 7, 0));
  }
  return +[NSArray arrayWithArray:v3];
}

- (id)legacyAppsSpecifiers
{
  id v3 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(SensorKitPrivacySettingsController *)self legacyAppsInstalled];
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v5) {
    goto LABEL_17;
  }
  id v7 = v5;
  uint64_t v8 = *(void *)v27;
  *(void *)&long long v6 = 138543618;
  long long v25 = v6;
  do
  {
    v9 = 0;
    do
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
      id v11 = objc_msgSend(v10, "URL", v25);
      if (!v11)
      {
        uint64_t v14 = qword_11168;
        if (!os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        id v15 = [v10 applicationIdentifier];
        *(_DWORD *)buf = 138543362;
        id v31 = v15;
        v16 = v14;
        v17 = "Error getting bundle URL for %{public}@";
        uint32_t v18 = 12;
        goto LABEL_15;
      }
      id v12 = v11;
      v13 = +[NSBundle bundleWithURL:v11];
      if (v13)
      {
        objc_msgSend(v3, "addObject:", +[PSSpecifier sk_appSpecifierForBundle:value:cellType:target:](PSSpecifier, "sk_appSpecifierForBundle:value:cellType:target:", v13, -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OTHER_APP_AUTHORIZED_STRING", &stru_C670, 0), 4, self));
        goto LABEL_12;
      }
      uint64_t v19 = qword_11168;
      if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v10 applicationIdentifier];
        *(_DWORD *)buf = v25;
        id v31 = v20;
        __int16 v32 = 2114;
        id v33 = v12;
        v16 = v19;
        v17 = "Error getting bundle for %{public}@ with URL %{public}@";
        uint32_t v18 = 22;
LABEL_15:
        _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
      }
LABEL_12:
      v9 = (char *)v9 + 1;
    }
    while (v7 != v9);
    id v21 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    id v7 = v21;
  }
  while (v21);
LABEL_17:
  if (![v3 count]) {
    return &__NSArray0__struct;
  }
  [v3 sortUsingFunction:sub_4A78 context:0];
  id v22 = +[NSMutableArray array];
  id v23 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"OTHER_APPS_USING_SENSOR_AND_USAGE_DATA" value:&stru_C670 table:0]);
  objc_msgSend(v23, "setObject:forKeyedSubscript:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"OTHER_APPS_FOOTER", &stru_C670, 0), PSFooterTextGroupKey);
  [v23 setObject:@"LEGACY_APPS_GROUP" forKeyedSubscript:PSIDKey];
  [v22 addObject:v23];
  [v22 addObjectsFromArray:v3];
  return +[NSArray arrayWithArray:v22];
}

- (id)globalSwitchSpecifierGroupSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = +[PSSpecifier emptyGroupSpecifier];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:[(NSBundle *)v4 localizedStringForKey:@"GLOBAL_SWITCH" value:&stru_C670 table:0] target:self set:"setGlobalSwitch:" get:"isGlobalSwitchOn" detail:0 cell:6 edit:0];
  [v5 setObject:@"GLOBAL_SWITCH_GROUP" forKeyedSubscript:PSIDKey];
  id v7 = [(NSBundle *)v4 localizedStringForKey:@"GLOBAL_SWITCH_FOOTER_DESCRIPTION" value:&stru_C670 table:0];
  uint64_t v8 = [(NSBundle *)v4 localizedStringForKey:@"GLOBAL_SWITCH_LEARN_MORE" value:&stru_C670 table:0];
  v9 = +[NSString stringWithFormat:@"%@ %@\n", v7, v8];
  v10 = (objc_class *)objc_opt_class();
  [v5 setObject:NSStringFromClass(v10) forKeyedSubscript:PSFooterCellClassGroupKey];
  [v5 setObject:v9 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  v14.location = (NSUInteger)[(NSString *)v9 rangeOfString:v8];
  [v5 setObject:NSStringFromRange(v14) forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];
  id v11 = +[NSValue valueWithNonretainedObject:self];
  [v5 setObject:v11 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];
  [v5 setObject:@"showSensorKitPrivacyPage" forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  [v3 addObject:v5];
  [v3 addObject:v6];

  return +[NSArray arrayWithArray:v3];
}

- (id)appsSpecifierGroup
{
  id v2 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"APPS_AND_STUDIES_USING_RESEARCH_SENSORS" value:&stru_C670 table:0]);
  [v2 setObject:@"APP_AND_STUDIES_GROUP" forKeyedSubscript:PSIDKey];
  return v2;
}

- (id)valueForSpecifier:(id)a3
{
  return [a3 propertyForKey:PSValueKey];
}

- (id)specifiers
{
  if (self->_showPendingApp) {
    [(SensorKitPrivacySettingsController *)self fetchPendingApp];
  }
  else {
    [(SensorKitPrivacySettingsController *)self setFollowUpBundlePath:0];
  }
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id result = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!result)
  {
    id v5 = +[NSMutableArray array];
    unsigned __int8 v6 = [+[SRAuthorizationClient sharedInstance] firstRunOnboardingCompleted];
    unsigned int v7 = objc_msgSend(-[SensorKitPrivacySettingsController isGlobalSwitchOn](self, "isGlobalSwitchOn"), "BOOLValue");
    if (v6)
    {
      unsigned int v8 = v7;
      objc_msgSend(v5, "addObjectsFromArray:", -[SensorKitPrivacySettingsController globalSwitchSpecifierGroupSpecifiers](self, "globalSwitchSpecifierGroupSpecifiers"));
      if (v8)
      {
        objc_msgSend(v5, "addObjectsFromArray:", -[SensorKitPrivacySettingsController dataAndAppsSpecifiers](self, "dataAndAppsSpecifiers"));
        objc_msgSend(v5, "addObjectsFromArray:", -[SensorKitPrivacySettingsController legacyAppsSpecifiers](self, "legacyAppsSpecifiers"));
        id v9 = [(SensorKitPrivacySettingsController *)self dataOptionsSpecifiers];
LABEL_10:
        [v5 addObjectsFromArray:v9];
        id result = +[NSArray arrayWithArray:v5];
        *(void *)&self->PSListController_opaque[v3] = result;
        return result;
      }
    }
    else
    {
      objc_msgSend(v5, "addObject:", -[SensorKitPrivacySettingsController firstRunGroup](self, "firstRunGroup"));
      id v10 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"ENABLE_SENSORKIT_BUTTON" value:&stru_C670 table:0], self, 0, 0, 0, 13, 0);
      [v10 setButtonAction:"enableSensorKit:"];
      [v10 setObject:@"ENABLE_SENSORKIT" forKeyedSubscript:PSIDKey];
      [v5 addObject:v10];
    }
    id v9 = [(SensorKitPrivacySettingsController *)self legacyAppsSpecifiers];
    goto LABEL_10;
  }
  return result;
}

- (id)dataAndAppsSpecifiers
{
  id v3 = +[NSMutableArray array];
  [(NSMutableSet *)self->_appsAndStudiesSpecifiers removeAllObjects];
  objc_msgSend(v3, "addObjectsFromArray:", -[SensorKitPrivacySettingsController collectedDataSpecifiers](self, "collectedDataSpecifiers"));
  objc_msgSend(v3, "addObjectsFromArray:", -[SensorKitPrivacySettingsController pendingAppSpecifiers](self, "pendingAppSpecifiers"));
  objc_msgSend(v3, "addObjectsFromArray:", -[SensorKitPrivacySettingsController appsAndStudiesWhenFirstRunCompleteGroup](self, "appsAndStudiesWhenFirstRunCompleteGroup"));

  return +[NSArray arrayWithArray:v3];
}

- (void)profileSettingsChanged:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned int v5 = objc_msgSend(objc_msgSend(v4, "objectForKey:", MCSetParametersForSettingsByTypeParamSenderPID), "intValue");
  if (v5 != getpid())
  {
    [(SensorKitPrivacySettingsController *)self reloadSpecifiers];
  }
}

- (void)showSensorKitPrivacyPage
{
  id v3 = +[OBPrivacyPresenter srui_presenterForPrivacySplash];
  [v3 setPresentingViewController:self];

  [v3 present];
}

- (void)setGlobalSwitch:(id)a3
{
  if ([a3 BOOLValue])
  {
    id v4 = self;
    uint64_t v5 = 1;
LABEL_13:
    [(SensorKitPrivacySettingsController *)v4 updateDataCollection:v5];
    return;
  }
  if (![(NSMutableSet *)self->_appsAndStudiesSpecifiers count])
  {
    id v4 = self;
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  unsigned __int8 v6 = (char *)[(NSMutableSet *)self->_appsAndStudiesSpecifiers count];
  if (v6 == (unsigned char *)&dword_0 + 1) {
    uint64_t v7 = 83;
  }
  else {
    uint64_t v7 = 84;
  }
  if (v6 == (unsigned char *)&dword_0 + 1) {
    uint64_t v8 = 85;
  }
  else {
    uint64_t v8 = 86;
  }
  id v9 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", v7), +[NSString srui_localizedStringForCode:v8], 1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5658;
  v15[3] = &unk_C380;
  v15[4] = self;
  char v16 = 0;
  id v10 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", +[NSString srui_localizedStringForCode:41], 2, v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5668;
  v14[3] = &unk_C3A8;
  v14[4] = self;
  id v11 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", +[NSString srui_localizedStringForCode:26], 0, v14);
  [(UIAlertController *)v9 addAction:v10];
  [(UIAlertController *)v9 addAction:v11];
  if (v9)
  {
    [(SensorKitPrivacySettingsController *)self presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    id v12 = qword_11168;
    if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_0, v12, OS_LOG_TYPE_FAULT, "Failed to create an alert", v13, 2u);
    }
  }
}

- (void)updateDataCollection:(BOOL)a3
{
  BOOL v3 = a3;
  [+[SRAuthorizationClient sharedInstance] setDataCollectionEnabled:a3];
  uint64_t v5 = (char *)[(SensorKitPrivacySettingsController *)self rangeOfSpecifiersInGroupID:@"GLOBAL_SWITCH_GROUP"];
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = qword_11168;
    if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "Unable to find the global switch group but the switch just got toggled";
      id v9 = buf;
LABEL_4:
      _os_log_fault_impl(&dword_0, v7, OS_LOG_TYPE_FAULT, v8, v9, 2u);
    }
  }
  else
  {
    id v10 = &v5[v6];
    if (v3)
    {
      [(SensorKitPrivacySettingsController *)self insertContiguousSpecifiers:[(SensorKitPrivacySettingsController *)self dataAndAppsSpecifiers] atIndex:v10 animated:1];
      id v11 = [(SensorKitPrivacySettingsController *)self dataOptionsSpecifiers];
      if (v11)
      {
        [(SensorKitPrivacySettingsController *)self addSpecifiersFromArray:v11 animated:1];
      }
      else
      {
        uint64_t v7 = qword_11168;
        if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_FAULT))
        {
          __int16 v20 = 0;
          uint64_t v8 = "Unabled to find delete all specifier";
          id v9 = (uint8_t *)&v20;
          goto LABEL_4;
        }
      }
    }
    else
    {
      id v12 = (char *)[(SensorKitPrivacySettingsController *)self rangeOfSpecifiersInGroupID:@"LEGACY_APPS_GROUP"];
      if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        id v12 = (char *)[(SensorKitPrivacySettingsController *)self rangeOfSpecifiersInGroupID:@"DATA_OPTIONS_GROUP"];
        uint64_t v15 = v14;
        if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          char v16 = qword_11168;
          if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)uint64_t v19 = 0;
            _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Unable to find the last group ID to stop the collapse.", v19, 2u);
          }
          id v12 = v10;
        }
      }
      else
      {
        uint64_t v15 = v13;
      }
      -[SensorKitPrivacySettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "subarrayWithRange:", v10, &v12[-v15]), 1);
      id v17 = [(SensorKitPrivacySettingsController *)self specifierForID:@"DATA_OPTIONS_GROUP"];
      if (v17)
      {
        [(SensorKitPrivacySettingsController *)self removeSpecifier:v17 animated:1];
      }
      else
      {
        uint64_t v7 = qword_11168;
        if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_FAULT))
        {
          __int16 v18 = 0;
          uint64_t v8 = "Unabled to find delete all specifier";
          id v9 = (uint8_t *)&v18;
          goto LABEL_4;
        }
      }
    }
  }
}

- (id)isGlobalSwitchOn
{
  id v2 = [+[SRAuthorizationClient sharedInstance] dataCollectionEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (id)collectedDataSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"COLLECTED_DATA" value:&stru_C670 table:0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"COLLECTED_DATA_FOOTER", &stru_C670, 0), PSFooterTextGroupKey);
  [v3 addObject:v4];
  id v5 = +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  id v10 = sub_5B6C;
  id v11 = &unk_C3D0;
  id v12 = +[NSMutableSet set];
  id v13 = v5;
  uint64_t v14 = self;
  sub_5B6C((id *)v9, [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)self authStore] readerAuthorizationBundleIdValues], (uint64_t)&stru_C410);
  id v6 = [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)self authStore] writerAuthorizationValues];
  v10((id *)v9, v6, (uint64_t)&stru_C430);
  [v5 sortUsingFunction:sub_4A78 context:0];
  if ([v5 count])
  {
    [v3 addObjectsFromArray:v5];
  }
  else
  {
    uint64_t v7 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NO_DATA_COLLECTION" value:&stru_C670 table:0];
    objc_msgSend(v3, "addObject:", +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, objc_opt_class(), 7, 0));
  }
  return +[NSArray arrayWithArray:v3];
}

- (id)authGroupSpecifierForAuthGroup:(id)a3
{
  id v4 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", [a3 localizedDisplayName], self, 0, 0, 0, 2, 0);
  [v4 setUserInfo:a3];
  if (qword_11178 != -1) {
    dispatch_once(&qword_11178, &stru_C590);
  }
  id v5 = [a3 platforms];
  if ((unint64_t)[v5 count] <= 1) {
    CFStringRef v6 = (const __CFString *)objc_msgSend(objc_msgSend(v5, "firstObject"), "lowercaseString");
  }
  else {
    CFStringRef v6 = @"mix";
  }
  id v7 = +[UIImage imageNamed:v6 inBundle:qword_11170];
  [v4 setObject:v7 forKeyedSubscript:PSIconImageKey];
  return v4;
}

- (id)specifierForID:(id)a3
{
  if ([a3 isEqualToString:@"OPEN_ENABLE_SENSORKIT"])
  {
    [(SensorKitPrivacySettingsController *)self enableSensorKit:0];
    return 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SensorKitPrivacySettingsController;
    return [(SensorKitPrivacySettingsController *)&v6 specifierForID:a3];
  }
}

- (id)selectSpecifier:(id)a3
{
  if (-[NSMutableSet containsObject:](self->_appsAndStudiesSpecifiers, "containsObject:"))
  {
    id v5 = [objc_alloc((Class)SRAuthorizationCategoryGroupViewController) initWithStyle:1];
    objc_msgSend(v5, "setAppBundle:", +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", objc_msgSend(a3, "userInfo")));
    objc_msgSend(v5, "setTitle:", objc_msgSend(a3, "name"));
    objc_msgSend(v5, "setAuthStore:", -[SensorKitPrivacySettingsController authStore](self, "authStore"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    id v12 = sub_6218;
    id v13 = &unk_C458;
    id v14 = a3;
    objc_msgSend(v5, "setReaderAuthState:", sub_6218((uint64_t)v11, -[SRAuthorizationStore readerAuthorizationBundleIdValues](-[SensorKitPrivacySettingsController authStore](self, "authStore"), "readerAuthorizationBundleIdValues"), (uint64_t)&stru_C478));
    id v6 = [(SRAuthorizationStore *)[(SensorKitPrivacySettingsController *)self authStore] writerAuthorizationValues];
    objc_msgSend(v5, "setWriterAuthState:", v12((uint64_t)v11, v6, (uint64_t)&stru_C498));
    return v5;
  }
  else if ([a3 cellType] == (char *)&dword_0 + 2)
  {
    id v8 = [objc_alloc((Class)SRResearchDataPerCategoryViewController) initWithStyle:1];
    objc_msgSend(v8, "setAuthGroup:", objc_msgSend(a3, "userInfo"));
    objc_msgSend(v8, "setTitle:", objc_msgSend(a3, "name"));
    objc_msgSend(v8, "setAuthStore:", -[SensorKitPrivacySettingsController authStore](self, "authStore"));
    return v8;
  }
  else
  {
    if (objc_msgSend(objc_msgSend(a3, "identifier"), "isEqualToString:", @"PENDING_APP_SPECIFIER"))
    {
      id v9 = +[NSBundle bundleWithPath:[(SensorKitPrivacySettingsController *)self followUpBundlePath]];
      if (v9)
      {
        objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "openApplicationWithBundleID:", -[NSBundle sr_normalizedBundleIdentifier](v9, "sr_normalizedBundleIdentifier"));
        self->_showPendingApp = 0;
        [(SensorKitPrivacySettingsController *)self reloadSpecifiers];
      }
      else
      {
        id v10 = qword_11168;
        if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = [0 bundlePath];
          _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Unable to find bundle %{public}@ to launch", buf, 0xCu);
        }
      }
    }
    return 0;
  }
}

- (id)pendingAppSpecifiers
{
  id result = [(SensorKitPrivacySettingsController *)self followUpBundlePath];
  if (result)
  {
    id v4 = result;
    id v5 = +[NSBundle bundleWithPath:result];
    if (v5)
    {
      id v6 = v5;
      id v7 = [(NSBundle *)v5 sr_normalizedBundleIdentifier];
      uint64_t v12 = 0;
      if (objc_msgSend(objc_msgSend(+[LSApplicationRecord sr_applicationRecordWithIdentifier:error:](LSApplicationRecord, "sr_applicationRecordWithIdentifier:error:", v7, &v12), "applicationState"), "isInstalled"))
      {
        id v8 = +[NSMutableArray array];
        objc_msgSend(v8, "addObject:", +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PENDING_SENSORKIT_REQUESTS", &stru_C670, 0)));
        id v9 = +[PSSpecifier sk_appSpecifierForBundle:value:cellType:target:](PSSpecifier, "sk_appSpecifierForBundle:value:cellType:target:", v6, [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"PENDING_APP_REVIEW" value:&stru_C670 table:0], 4, self);
        [v9 setObject:@"PENDING_APP_SPECIFIER" forKeyedSubscript:PSIDKey];
        [v8 addObject:v9];
        return +[NSArray arrayWithArray:v8];
      }
      id v11 = qword_11168;
      if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v14 = v7;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ no longer installed %{public}@. Removing the pending app review group", buf, 0x16u);
      }
    }
    else
    {
      id v10 = qword_11168;
      if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v4;
        _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Failed to find bundle for %{public}@", buf, 0xCu);
      }
    }
    return 0;
  }
  return result;
}

- (id)dataOptionsSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier emptyGroupSpecifier];
  [v4 setObject:@"DATA_OPTIONS_GROUP" forKeyedSubscript:PSIDKey];
  id v5 = +[NSString srui_localizedStringForCode:16];
  [v4 setObject:v5 forKeyedSubscript:PSFooterTextGroupKey];
  id v6 = +[PSSpecifier deleteButtonSpecifierWithName:target:action:](PSSpecifier, "deleteButtonSpecifierWithName:target:action:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"DELETE_ALL_TITLE" value:&stru_C670 table:0], self, "showActionSheet:");
  [v6 setObject:&off_CC00 forKeyedSubscript:PSAlignmentKey];
  [v3 addObject:v4];
  [v3 addObject:v6];

  return +[NSArray arrayWithArray:v3];
}

- (void)showActionSheet:(id)a3
{
  objc_initWeak(&location, self);
  id v4 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", +[NSString srui_localizedStringForCode:22], 0, 0);
  id v5 = +[NSString srui_localizedStringForCode:24];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_689C;
  id v10 = &unk_C4C0;
  objc_copyWeak(&v11, &location);
  id v6 = +[UIAlertAction actionWithTitle:v5 style:2 handler:&v7];
  -[UIAlertController addAction:](v4, "addAction:", v6, v7, v8, v9, v10);
  [(UIAlertController *)v4 addAction:+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", +[NSString srui_localizedStringForCode:26], 1, 0)];
  [(SensorKitPrivacySettingsController *)self presentViewController:v4 animated:1 completion:0];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)deleteAllSamples
{
}

- (void)enableSensorKit:(id)a3
{
  if (![(SensorKitPrivacySettingsController *)self presentingEnableSensorKit])
  {
    [(SensorKitPrivacySettingsController *)self setPresentingEnableSensorKit:1];
    id v4 = qword_11168;
    if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Loading First Run", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    objc_copyWeak(&v5, buf);
    SRRequestFirstRunOnBoarding();
    objc_destroyWeak(&v5);
    objc_destroyWeak(buf);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SensorKitPrivacySettingsController;
  id v6 = -[SensorKitPrivacySettingsController tableView:cellForRowAtIndexPath:](&v9, "tableView:cellForRowAtIndexPath:", a3);
  id v7 = [(SensorKitPrivacySettingsController *)self specifierAtIndexPath:a4];
  if ([(SensorKitPrivacySettingsController *)self specifierForID:@"PENDING_APP_SPECIFIER"] == v7)
  {
    objc_msgSend(objc_msgSend(v6, "detailTextLabel"), "setTextColor:", +[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    [v6 setSelectionStyle:3];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(objc_msgSend(v6, "titleLabel"), "setLineBreakMode:", 0);
    objc_msgSend(objc_msgSend(v6, "titleLabel"), "setNumberOfLines:", 0);
  }
  return v6;
}

- (void)authorizationStore:(id)a3 didUpdateAuthorizationsForBundleId:(id)a4 sensors:(id)a5
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6D28;
  v5[3] = &unk_C550;
  objc_copyWeak(&v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSString)followUpBundlePath
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFollowUpBundlePath:(id)a3
{
}

- (BOOL)presentingEnableSensorKit
{
  return self->_presentingEnableSensorKit;
}

- (void)setPresentingEnableSensorKit:(BOOL)a3
{
  self->_presentingEnableSensorKit = a3;
}

- (SRAuthorizationStore)authStore
{
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAuthStore:(id)a3
{
}

@end