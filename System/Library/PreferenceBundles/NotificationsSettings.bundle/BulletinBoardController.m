@interface BulletinBoardController
+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4;
- (BOOL)_shouldShowSection:(id)a3;
- (BOOL)summarizePreviewsDetailController:(id)a3 shouldShowSection:(id)a4;
- (BOOL)telephonyDevice;
- (BulletinBoardController)init;
- (NSDictionary)urlResourceDictionary;
- (NSMutableDictionary)alertTypeKeys;
- (PSSpecifier)emptyCell;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_alphabetizedSpecifiersFrom:(id)a3;
- (id)_appclipsSpecifierForAppClips:(id)a3;
- (id)_filterSuppressedSections:(id)a3;
- (id)_sectionDescriptions;
- (id)_sectionIDs;
- (id)_sectionUIDescriptions;
- (id)_sortedSections:(id)a3;
- (id)cmasAlertsTitle:(id)a3;
- (id)cmasAlertsValue:(id)a3;
- (id)notificationListDisplayStyleSetting:(id)a3;
- (id)priorityNotificationSetting:(id)a3;
- (id)scheduledDeliverySetting:(id)a3;
- (id)screenSharingSetting:(id)a3;
- (id)sectionsOrderedByInOutState:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)showsPreview:(id)a3;
- (id)specifiers;
- (id)spokenNotifications:(id)a3;
- (id)summarizationSetting:(id)a3;
- (void)_addRegionalAlertGroupToSpecifiers:(id)a3;
- (void)_clearSections;
- (void)_loadGlobalSettings;
- (void)_loadSections;
- (void)_reallyLoadSections:(id)a3;
- (void)_reloadSections;
- (void)_updateStoredSectionsWithSectionInfo:(id)a3;
- (void)appDetailControllerWillDisappear:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)cmasPropertyChanged;
- (void)dealloc;
- (void)emitNavigationEventForRootController;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)priorityNotificationsDetailController:(id)a3 didUpdateSetting:(int64_t)a4;
- (void)profileNotification:(id)a3;
- (void)scheduledDeliverySettingsControllerDidChangeGlobalScheduledDeliverySettings:(id)a3;
- (void)setAlertTypeKeys:(id)a3;
- (void)setCmasAlertState:(id)a3 forSpecifier:(id)a4;
- (void)setDesiredVerticalContentOffset:(float)a3;
- (void)setEmptyCell:(id)a3;
- (void)setNotificationListDisplayStyleSetting:(id)a3 specifier:(id)a4;
- (void)setShowsPreview:(id)a3 specifier:(id)a4;
- (void)setTelephonyDevice:(BOOL)a3;
- (void)setUrlResourceDictionary:(id)a3;
- (void)settingsGateway:(id)a3 didUpdateSectionInfo:(id)a4;
- (void)settingsGatewayDidUpdateGlobalSettings:(id)a3;
- (void)spokenNotificationsDetailListController:(id)a3 didChangeGlobalSpokenNotificationSetting:(int64_t)a4;
- (void)summarizePreviewsDetailController:(id)a3 didChangeGlobalSummarizePreviewsSetting:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BulletinBoardController

- (BulletinBoardController)init
{
  v11.receiver = self;
  v11.super_class = (Class)BulletinBoardController;
  v2 = [(BulletinBoardController *)&v11 init];
  if (v2)
  {
    v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v4 = [v3 localizedStringForKey:@"TITLE" value:&stru_419A0 table:@"NotificationsSettings"];
    [(BulletinBoardController *)v2 setTitle:v4];

    v2->_telephonyDevice = MGGetBoolAnswer();
    v5 = +[APSubject subjectMonitorRegistry];
    uint64_t v6 = [v5 addMonitor:v2 subjectMask:1];
    appProtectionEventSubscription = v2->_appProtectionEventSubscription;
    v2->_appProtectionEventSubscription = (APSubjectMonitorSubscription *)v6;

    [(BulletinBoardController *)v2 _loadSections];
    [(BulletinBoardController *)v2 _loadGlobalSettings];
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"profileNotification:" name:@"PSProfileConnectionRestrictionChangedNotification" object:0];
    [v8 addObserver:v2 selector:"profileNotification:" name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];
    [v8 addObserver:v2 selector:"screenSharingSettingChanged:" name:kNCScreenSharingSettingChangedNotification object:0];
    v9 = +[NCSettingsGatewayController sharedInstance];
    [v9 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  v4 = +[NCSettingsGatewayController sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)BulletinBoardController;
  [(BulletinBoardController *)&v5 dealloc];
}

- (void)profileNotification:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:MCSetParametersForSettingsByTypeParamSenderPID];

  LODWORD(v4) = [v5 intValue];
  if (v4 != getpid()) {
    [(BulletinBoardController *)self reloadSpecifiers];
  }
}

- (void)setDesiredVerticalContentOffset:(float)a3
{
  *(_DWORD *)&self->PSListController_opaque[OBJC_IVAR___PSListController__verticalContentOffset] = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BulletinBoardController;
  [(BulletinBoardController *)&v5 viewWillAppear:a3];
  v4 = [(BulletinBoardController *)self table];
  [v4 setAllowsSelectionDuringEditing:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BulletinBoardController;
  [(BulletinBoardController *)&v4 viewDidAppear:a3];
  [(BulletinBoardController *)self emitNavigationEventForRootController];
}

- (void)_addRegionalAlertGroupToSpecifiers:(id)a3
{
  id v9 = a3;
  if (MGGetBoolAnswer())
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = _CTServerConnectionCreate();
    if (v3)
    {
      objc_super v4 = (const void *)v3;
      CFArrayRef theArray = 0;
      unint64_t v5 = _CTServerConnectionCopyCellBroadcastAlertTypesForAllSIMSlots();
      if (HIDWORD(v5))
      {
        uint64_t v6 = v5;
        v8 = v4;
        v7 = NCLogEmergencyAlerts;
        if (os_log_type_enabled((os_log_t)NCLogEmergencyAlerts, OS_LOG_TYPE_ERROR)) {
          sub_2C218(v6, v7);
        }
        objc_super v4 = v8;
      }
      CFRelease(v4);
    }
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  if (qword_50150)
  {
    v7.receiver = self;
    v7.super_class = (Class)BulletinBoardController;
    [(BulletinBoardController *)&v7 handleURL:a3 withCompletion:v6];
  }
  else
  {
    [(BulletinBoardController *)self setUrlResourceDictionary:a3];
    if (v6) {
      v6[2](v6);
    }
  }
}

- (id)sectionsOrderedByInOutState:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  unint64_t v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (BBSectionShouldShowInNotificationCenter(v11)) {
          long long v12 = v4;
        }
        else {
          long long v12 = v5;
        }
        objc_msgSend(v12, "addObject:", v11, (void)v14);
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v4 addObjectsFromArray:v5];

  return v4;
}

- (id)specifiers
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v73 = OBJC_IVAR___PSListController__specifiers;
    id v74 = objc_alloc_init((Class)NSMutableArray);
    objc_super v4 = +[UIDevice currentDevice];
    unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 || _os_feature_enabled_impl())
    {
      id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v7 = [v6 localizedStringForKey:@"NOTIFICATION_LIST_DISPLAY_STYLE_TITLE" value:&stru_419A0 table:@"NotificationsSettings"];
      id v8 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_LIST_DISPLAY_STYLE_GROUP_ID" name:v7];

      [v74 addObject:v8];
      uint64_t v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v10 = [v9 localizedStringForKey:@"NOTIFICATION_LIST_DISPLAY_STYLE_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
      [v8 setProperty:v10 forKey:PSFooterTextGroupKey];

      long long v11 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setNotificationListDisplayStyleSetting:specifier:" get:"notificationListDisplayStyleSetting:" detail:0 cell:-1 edit:0];
      [v11 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v11 setIdentifier:@"NOTIFICATION_LIST_DISPLAY_STYLE_CELL"];
      [v74 addObject:v11];
    }
    long long v12 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_GLOBAL_SETTINGS_GROUP_ID"];
    notificationsGlobalSettingsGroupSpecifier = self->_notificationsGlobalSettingsGroupSpecifier;
    self->_notificationsGlobalSettingsGroupSpecifier = v12;

    [v74 addObject:self->_notificationsGlobalSettingsGroupSpecifier];
    long long v14 = +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:");
    long long v15 = objc_msgSend(v14, "localizedStringForKey:value:table:", @"SCHEDULED_DELIVERY");
    long long v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"scheduledDeliverySetting:" detail:objc_opt_class() cell:2 edit:0];

    [v16 setIdentifier:@"SCHEDULED_DELIVERY_ID"];
    uint64_t v69 = PSDeferItemSelectionKey;
    objc_msgSend(v16, "setProperty:forKey:", &__kCFBooleanFalse);
    v72 = v16;
    [v74 addObject:v16];
    long long v17 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v18 = [v17 localizedStringForKey:@"SHOW_PREVIEW_OPTION_ALWAYS" value:&stru_419A0 table:@"NotificationsSettings"];
    v76[0] = v18;
    v19 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v20 = [v19 localizedStringForKey:@"SHOW_PREVIEW_OPTION_UNLOCKED" value:&stru_419A0 table:@"NotificationsSettings"];
    v76[1] = v20;
    v21 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v22 = [v21 localizedStringForKey:@"SHOW_PREVIEW_OPTION_NEVER" value:&stru_419A0 table:@"NotificationsSettings"];
    v76[2] = v22;
    uint64_t v23 = +[NSArray arrayWithObjects:v76 count:3];

    v24 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
    v25 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v26 = [v25 localizedStringForKey:@"SHOW_PREVIEWS" value:&stru_419A0 table:@"NotificationsSettings"];
    v27 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
    v28 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:"setShowsPreview:specifier:" get:"showsPreview:" detail:objc_opt_class() cell:2 edit:0];
    showPreviewsGroupSpecifier = self->_showPreviewsGroupSpecifier;
    self->_showPreviewsGroupSpecifier = v28;

    [(PSSpecifier *)self->_showPreviewsGroupSpecifier setIdentifier:@"SHOW_PREVIEW_GROUP_ID"];
    v71 = (void *)v23;
    [(PSSpecifier *)self->_showPreviewsGroupSpecifier setValues:&off_44880 titles:v23];
    [(PSSpecifier *)self->_showPreviewsGroupSpecifier setProperty:&__kCFBooleanFalse forKey:v69];
    [(PSSpecifier *)self->_showPreviewsGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v74 addObject:self->_showPreviewsGroupSpecifier];
    v30 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v31 = [v30 localizedStringForKey:@"SCREEN_SHARING" value:&stru_419A0 table:@"NotificationsSettings"];
    v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:0 get:"screenSharingSetting:" detail:objc_opt_class() cell:2 edit:0];

    [v32 setIdentifier:@"SCREENSHARING_ID"];
    v70 = v32;
    [v74 addObject:v32];
    if (_os_feature_enabled_impl()
      && NCAreGenerativePrioritizationModelsAvailable()
      && self->_globalHighlightsSetting != -1)
    {
      v33 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v34 = [v33 localizedStringForKey:@"PRIORITIZE_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
      v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:"priorityNotificationSetting:" detail:objc_opt_class() cell:2 edit:0];

      [v35 setIdentifier:@"PRIORITIZE_NOTIFICATIONS_ID"];
      [v74 addObject:v35];
    }
    if (NCAreGenerativeSummarizationModelsAvailable() && self->_globalSummarizationSetting != -1)
    {
      v36 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v37 = [v36 localizedStringForKey:@"SUMMARIZE_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
      v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:self set:0 get:"summarizationSetting:" detail:objc_opt_class() cell:2 edit:0];

      [v38 setIdentifier:@"SUMMARIZE_NOTIFICATIONS_ID"];
      [v74 addObject:v38];
    }
    v39 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v40 = [v39 localizedStringForKey:@"SIRI" value:&stru_419A0 table:@"NotificationsSettings"];
    v41 = +[PSSpecifier groupSpecifierWithName:v40];

    [v41 setIdentifier:@"SIRI_GROUP_ID"];
    [v74 addObject:v41];
    v42 = +[NCSettingsGatewayController sharedInstance];
    id v43 = [v42 effectiveGlobalAnnounceSetting];

    v44 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v45 = v44;
    if (v43 == (id)-1)
    {
      v53 = [v44 localizedStringForKey:@"SIRI_SUGGESTIONS_FOOTER_TEXT" value:&stru_419A0 table:@"NotificationsSettings"];
      [v41 setProperty:v53 forKey:PSFooterTextGroupKey];
    }
    else
    {
      v46 = [v44 localizedStringForKey:@"OFF" value:&stru_419A0 table:@"NotificationsSettings"];
      v75[0] = v46;
      v47 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      [v47 localizedStringForKey:@"ON" value:&stru_419A0 table:@"NotificationsSettings"];
      v49 = v48 = v41;
      v75[1] = v49;
      uint64_t v50 = +[NSArray arrayWithObjects:v75 count:2];

      v51 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v27 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
      v24 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
      v52 = [v51 localizedStringForKey:@"SPOKEN_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
      v41 = v48;
      v53 = +[PSSpecifier preferenceSpecifierNamed:v52 target:self set:0 get:"spokenNotifications:" detail:objc_opt_class() cell:2 edit:0];

      [v53 setIdentifier:@"SPOKEN_NOTIFICATIONS_ID"];
      [v53 setValues:&off_44898 titles:v50];
      [v74 addObject:v53];
      v45 = (void *)v50;
    }

    v54 = v27[307];
    v55 = [v24[283] bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v56 = [v55 localizedStringForKey:@"SIRI_SUGGESTIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    v57 = [v54 preferenceSpecifierNamed:v56 target:self set:0 get:0 detail:0 cell:2 edit:0];

    [v57 setIdentifier:@"SIRI_SUGGESTIONS_ID"];
    v58 = PSBundlePathForPreferenceBundle();
    [v57 setProperty:v58 forKey:PSLazilyLoadedBundleKey];

    [v57 setProperty:@"ASTLockScreenSuggestionsDetailListController" forKey:PSDetailControllerClassKey];
    [v57 setProperty:&__kCFBooleanTrue forKey:PSBundleOverridePrincipalClassKey];
    [v57 setControllerLoadAction:"lazyLoadBundle:"];
    [v74 addObject:v57];
    if ([(id)qword_50150 count])
    {
      v59 = [v74 specifierForID:@"SPINNTER_GROUP"];
      [v74 removeObject:v59];

      v60 = [v74 specifierForID:@"SPINNER_CELL"];
      [v74 removeObject:v60];

      v61 = [(BulletinBoardController *)self _alphabetizedSpecifiersFrom:qword_50150];
      [v74 addObjectsFromArray:v61];

      [(BulletinBoardController *)self _addRegionalAlertGroupToSpecifiers:v74];
      [(BulletinBoardController *)self _reloadSections];
    }
    else
    {
      v62 = v27[307];
      v63 = [v24[283] bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v64 = [v63 localizedStringForKey:@"NOTIFICATION_STYLE" value:&stru_419A0 table:@"NotificationsSettings"];
      v65 = [v62 groupSpecifierWithName:v64];

      [v65 setIdentifier:@"SPINNTER_GROUP"];
      [v74 addObject:v65];
      v66 = [v27[307] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:15 edit:0];
      [v66 setIdentifier:@"SPINNER_CELL"];
      [v74 addObject:v66];
    }
    v67 = *(void **)&self->PSListController_opaque[v73];
    *(void *)&self->PSListController_opaque[v73] = v74;

    id v3 = *(void **)&self->PSListController_opaque[v73];
  }

  return v3;
}

- (void)setShowsPreview:(id)a3 specifier:(id)a4
{
  self->_globalContentPreviewSetting = (int64_t)[a3 integerValue];
  unint64_t v5 = +[NCSettingsGatewayController sharedInstance];
  [v5 setEffectiveGlobalContentPreviewsSetting:self->_globalContentPreviewSetting];

  [(BulletinBoardController *)self reloadSpecifiers];
}

- (id)showsPreview:(id)a3
{
  return +[NSNumber numberWithInteger:self->_globalContentPreviewSetting];
}

- (void)setNotificationListDisplayStyleSetting:(id)a3 specifier:(id)a4
{
  id v5 = [a3 integerValue];
  id v6 = +[NCSettingsGatewayController sharedInstance];
  [v6 removeObserver:self];

  id v7 = +[NCSettingsGatewayController sharedInstance];
  [v7 setEffectiveGlobalNotificationListDisplayStyleSetting:v5];

  id v8 = +[NCSettingsGatewayController sharedInstance];
  [v8 addObserver:self];
}

- (id)notificationListDisplayStyleSetting:(id)a3
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  id v4 = [v3 effectiveGlobalNotificationListDisplayStyleSetting];

  return +[NSNumber numberWithInteger:v4];
}

- (id)spokenNotifications:(id)a3
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  id v4 = [v3 effectiveGlobalAnnounceSetting];

  return +[NSNumber numberWithInteger:v4];
}

- (id)scheduledDeliverySetting:(id)a3
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  id v4 = [v3 effectiveGlobalScheduledDeliverySetting];

  id v5 = +[NCSettingsGatewayController sharedInstance];
  id v6 = [v5 effectiveGlobalScheduledDeliveryTimes];

  id v7 = NCStringForScheduledDeliverySummary((uint64_t)v4, v6);

  return v7;
}

- (id)summarizationSetting:(id)a3
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  id v4 = (char *)[v3 effectiveGlobalSummarizationSetting];
  id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v6 = v5;
  if (v4 == (unsigned char *)&dword_0 + 2) {
    CFStringRef v7 = @"ON";
  }
  else {
    CFStringRef v7 = @"OFF";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_419A0 table:@"NotificationsSettings"];

  return v8;
}

- (id)screenSharingSetting:(id)a3
{
  BOOL v3 = NCGetAllowNotificationsDuringScreenSharing();
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"SCREEN_SHARING_NOTIFICATIONS_ON";
  }
  else {
    CFStringRef v6 = @"SCREEN_SHARING_NOTIFICATIONS_OFF";
  }
  CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_419A0 table:@"NotificationsSettings"];

  return v7;
}

- (id)priorityNotificationSetting:(id)a3
{
  int64_t globalHighlightsSetting = self->_globalHighlightsSetting;
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v5 = v4;
  if (globalHighlightsSetting == 2) {
    CFStringRef v6 = @"ON";
  }
  else {
    CFStringRef v6 = @"OFF";
  }
  CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_419A0 table:@"NotificationsSettings"];

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BulletinBoardController *)self specifierForID:@"NOTIFICATION_LIST_DISPLAY_STYLE_CELL"];
  uint64_t v9 = [(BulletinBoardController *)self indexPathForSpecifier:v8];
  unsigned int v10 = [v9 isEqual:v7];

  if (v10)
  {
    [v6 bounds];
    double v12 = v11;
    [v6 _sectionContentInset];
    double v14 = v13;
    double v16 = v15;
    long long v17 = [(BulletinBoardController *)self tableView:v6 cellForRowAtIndexPath:v7];
    if (v17)
    {
      [v6 bounds];
      objc_msgSend(v17, "sizeThatFits:", v12 - v14 - v16, CGRectGetHeight(v23));
      double v19 = v18;
    }
    else
    {
      double v19 = 0.0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)BulletinBoardController;
    [(BulletinBoardController *)&v22 tableView:v6 heightForRowAtIndexPath:v7];
    double v19 = v20;
  }

  return v19;
}

- (id)_sectionIDs
{
  v2 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [(id)qword_50150 count]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)qword_50150;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "sectionID", (void)v10);
        [v2 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)_sectionDescriptions
{
  v2 = +[NSMutableString string];
  [v2 appendString:@"MODEL\n{\n"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)qword_50150;
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v8 = [v7 subsections];
        id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v20;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              if ([*(id *)(*((void *)&v19 + 1) + 8 * (void)j) notificationCenterSetting] == (char *)&dword_0 + 2)
              {
                CFStringRef v13 = @"Subsections In Notification Center";
                goto LABEL_16;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
        CFStringRef v13 = @"Subsections Not In Notification Center";
LABEL_16:

        double v14 = [v7 sectionID];
        double v15 = (char *)[v7 notificationCenterSetting];
        CFStringRef v16 = @"Not In Notification Center";
        if (v15 == (unsigned char *)&dword_0 + 2) {
          CFStringRef v16 = @"In Notification Center";
        }
        [v2 appendFormat:@"\t%@\t%@ / %@\n", v14, v16, v13];
      }
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  [v2 appendString:@"}\n"];

  return v2;
}

- (id)_sectionUIDescriptions
{
  id v3 = +[NSMutableString string];
  [v3 appendString:@"VIEW\n{\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) propertyForKey:@"BBSECTION_INFO_KEY"];
        id v10 = v9;
        if (v9)
        {
          uint64_t v11 = [v9 sectionID];
          long long v12 = (char *)[v10 notificationCenterSetting];
          CFStringRef v13 = @"Not In Notification Center";
          if (v12 == (unsigned char *)&dword_0 + 2) {
            CFStringRef v13 = @"In Notification Center";
          }
          [v3 appendFormat:@"\t%@\t%@\n", v11, v13, (void)v15];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"}\n"];

  return v3;
}

- (void)_clearSections
{
  v2 = (void *)qword_50150;
  qword_50150 = 0;
}

- (BOOL)_shouldShowSection:(id)a3
{
  id v4 = a3;
  if ([v4 isRestricted])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v4 sectionID];
    if ([v6 isEqualToString:@"com.apple.gamecenter"])
    {
      uint64_t v7 = +[MCProfileConnection sharedConnection];
      unsigned __int8 v5 = [v7 isBoolSettingLockedDownByRestrictions:@"allowGameCenter"];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  id v8 = [v4 sectionID];
  id v9 = +[APApplication applicationWithBundleIdentifier:v8];
  unsigned __int8 v10 = [v9 isHidden];

  uint64_t v11 = [v4 sectionID];
  if ([v11 isEqualToString:@"com.apple.mobilephone"]) {
    BOOL telephonyDevice = self->_telephonyDevice;
  }
  else {
    BOOL telephonyDevice = 1;
  }

  if (([v4 suppressFromSettings] | v5)) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = telephonyDevice & (v10 ^ 1);
  }

  return v13;
}

- (id)_filterSuppressedSections:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[BulletinBoardController _shouldShowSection:](self, "_shouldShowSection:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_reallyLoadSections:(id)a3
{
  if (!qword_50150)
  {
    [(BulletinBoardController *)self removeSpecifierID:@"SPINNTER_GROUP"];
    [(BulletinBoardController *)self removeSpecifierID:@"SPINNER_CELL"];
    id v4 = [(BulletinBoardController *)self _alphabetizedSpecifiersFrom:qword_50150];
    id v5 = +[NSMutableArray arrayWithArray:v4];

    [(BulletinBoardController *)self _addRegionalAlertGroupToSpecifiers:v5];
    [(BulletinBoardController *)self addSpecifiersFromArray:v5 animated:1];
  }
}

- (void)_loadSections
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  id v4 = [v3 activeSectionInfo];

  id v5 = [(BulletinBoardController *)self _filterSuppressedSections:v4];
  uint64_t v6 = [(BulletinBoardController *)self sectionsOrderedByInOutState:v5];
  id v7 = (void *)qword_50150;
  qword_50150 = v6;

  [(BulletinBoardController *)self _reallyLoadSections:v4];
  id v8 = [(BulletinBoardController *)self urlResourceDictionary];

  if (v8)
  {
    uint64_t v9 = [(BulletinBoardController *)self urlResourceDictionary];
    v10.receiver = self;
    v10.super_class = (Class)BulletinBoardController;
    [(BulletinBoardController *)&v10 handleURL:v9 withCompletion:0];

    [(BulletinBoardController *)self setUrlResourceDictionary:0];
  }
}

- (void)_loadGlobalSettings
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  self->_globalContentPreviewSetting = (int64_t)[v3 effectiveGlobalContentPreviewsSetting];

  id v4 = +[NCSettingsGatewayController sharedInstance];
  self->_globalSummarizationSetting = (int64_t)[v4 effectiveGlobalSummarizationSetting];

  id v5 = +[NCSettingsGatewayController sharedInstance];
  self->_int64_t globalHighlightsSetting = (int64_t)[v5 effectiveGlobalHighlightsSetting];
}

- (id)_sortedSections:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_412E0];
}

- (id)_alphabetizedSpecifiersFrom:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  uint64_t v6 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v7 = [v6 localizedStringForKey:@"NOTIFICATION_STYLE" value:&stru_419A0 table:@"NotificationsSettings"];
  uint64_t v8 = +[PSSpecifier groupSpecifierWithName:v7];

  v37 = v5;
  v34 = (void *)v8;
  [v5 addObject:v8];
  v35 = self;
  v36 = v4;
  uint64_t v9 = [(BulletinBoardController *)self _sortedSections:v4];
  objc_super v10 = +[NSMutableArray array];
  uint64_t v11 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
  id v14 = v12;
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v40;
    uint64_t v38 = PSEnabledKey;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v18 isAppClip])
        {
          [v10 addObject:v18];
        }
        else
        {
          long long v19 = v10;
          objc_opt_class();
          objc_opt_class();
          long long v20 = PSApplicationSpecifierForBBSection();
          long long v21 = +[MCProfileConnection sharedConnection];
          long long v22 = [v18 sectionID];
          unsigned __int8 v23 = [v21 isNotificationsModificationAllowedForBundleID:v22];

          if ((v23 & 1) == 0)
          {
            long long v24 = +[NSNumber numberWithBool:0];
            [v20 setProperty:v24 forKey:v38];
          }
          [v11 addObject:v20];

          objc_super v10 = v19;
          id v12 = v14;
        }
      }
      id v15 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v15);
  }

  if ([v10 count])
  {
    long long v25 = [(BulletinBoardController *)v35 _appclipsSpecifierForAppClips:v10];
    [v37 addObject:v25];
  }
  [v37 addObjectsFromArray:v11];
  if (![v12 count])
  {
    long long v26 = [(BulletinBoardController *)v35 emptyCell];

    if (!v26)
    {
      v27 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v28 = [v27 localizedStringForKey:@"EMPTY" value:&stru_419A0 table:@"NotificationsSettings"];
      v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:v35 set:0 get:0 detail:0 cell:13 edit:0];
      [(BulletinBoardController *)v35 setEmptyCell:v29];

      id v12 = v14;
      v30 = [(BulletinBoardController *)v35 emptyCell];
      v31 = +[NSNumber numberWithBool:0];
      [v30 setProperty:v31 forKey:PSEnabledKey];
    }
    v32 = [(BulletinBoardController *)v35 emptyCell];
    [v37 addObject:v32];
  }

  return v37;
}

- (id)_appclipsSpecifierForAppClips:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  uint64_t v6 = [v5 localizedStringForKey:@"APP_CLIPS" value:&stru_419A0 table:@"NotificationsSettings"];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v7 setIdentifier:@"APP_CLIPS_ID"];
  [v7 setProperty:v4 forKey:@"APP_CLIP_SECTION_INFOS"];

  [v7 setProperty:@"com.apple.graphic-icon.app-clips" forKey:PSIconUTTypeIdentifierKey];
  [v7 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];

  return v7;
}

- (void)setCmasAlertState:(id)a3 forSpecifier:(id)a4
{
  id v19 = a3;
  long long v18 = [a4 propertyForKey:@"CMAS_ALERT_TYPE"];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alertTypeKeys, "objectForKeyedSubscript:");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = v23 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        uint64_t v12 = _CTServerConnectionCreate();
        if (v12)
        {
          id v13 = (const void *)v12;
          unsigned int v14 = [v19 BOOLValue];
          uint64_t v15 = _CTServerConnectionSetCellBroadcastSettingForAlertType();
          uint64_t v16 = NCLogEmergencyAlerts;
          if (os_log_type_enabled((os_log_t)NCLogEmergencyAlerts, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            uint64_t v25 = v11;
            __int16 v26 = 1024;
            unsigned int v27 = v14;
            __int16 v28 = 1024;
            int v29 = 0;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "########### Set CMAS Type: \"%{public}@\" to %d (is did succeed %d)", buf, 0x18u);
          }
          long long v17 = NCLogEmergencyAlerts;
          if (os_log_type_enabled((os_log_t)NCLogEmergencyAlerts, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v25 = v15 >> 32;
            __int16 v26 = 1024;
            unsigned int v27 = 0;
            _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "### Error with CT Error code: %ld, Did succeed: %d", buf, 0x12u);
          }
          CFRelease(v13);
        }
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v8);
  }
}

- (id)cmasAlertsValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"CMAS_ALERT_TYPE"];
  uint64_t v6 = [(NSMutableDictionary *)self->_alertTypeKeys objectForKeyedSubscript:v5];
  if ([v6 count])
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = [v4 propertyForKey:@"CMAS_ENABLED_BY_DEFAULT"];
    unint64_t v9 = (unint64_t)[v8 BOOLValue];

    uint64_t v10 = _CTServerConnectionCreate();
    if (v10)
    {
      uint64_t v11 = (const void *)v10;
      unint64_t CellBroadcastSettingForAlertType = _CTServerConnectionGetCellBroadcastSettingForAlertType();
      if (HIDWORD(CellBroadcastSettingForAlertType))
      {
        uint64_t v13 = CellBroadcastSettingForAlertType;
        unsigned int v14 = NCLogEmergencyAlerts;
        if (os_log_type_enabled((os_log_t)NCLogEmergencyAlerts, OS_LOG_TYPE_ERROR)) {
          sub_2C294(v13, v14);
        }
      }
      uint64_t v15 = NCLogEmergencyAlerts;
      if (os_log_type_enabled((os_log_t)NCLogEmergencyAlerts, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v7;
        __int16 v20 = 1024;
        int v21 = 0;
        __int16 v22 = 1024;
        int v23 = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "########### Read CMAS Type: \"%@\" to %d (is valid %d)", buf, 0x18u);
      }
      CFRelease(v11);
      unint64_t v9 = v9;
    }
    uint64_t v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9, 0, 0, 0, 0, 0);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)cmasAlertsTitle:(id)a3
{
  id v3 = [(BulletinBoardController *)self cmasAlertsValue:a3];
  unsigned int v4 = [v3 BOOLValue];

  id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  uint64_t v6 = v5;
  if (v4) {
    CFStringRef v7 = @"ON";
  }
  else {
    CFStringRef v7 = @"OFF";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_419A0 table:@"NotificationsSettings"];

  return v8;
}

- (void)cmasPropertyChanged
{
  NSLog(@"Property changed callback. Reloading", a2);

  [(BulletinBoardController *)self reloadSpecifiers];
}

- (void)_reloadSections
{
  if (qword_50150)
  {
    id v3 = +[NCSettingsGatewayController sharedInstance];
    uint64_t v4 = [v3 activeSectionInfo];

    uint64_t v50 = (void *)v4;
    id v5 = [(BulletinBoardController *)self _filterSuppressedSections:v4];
    uint64_t v6 = [(BulletinBoardController *)self sectionsOrderedByInOutState:v5];

    id v7 = [(id)qword_50150 count];
    BOOL v55 = v7 == [v6 count];
    id v8 = [(BulletinBoardController *)self navigationController];
    unint64_t v9 = [v8 topViewController];
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();

    if (v4)
    {
      uint64_t v10 = [v8 topViewController];
    }
    else
    {
      uint64_t v10 = 0;
    }
    v49 = self;
    uint64_t v11 = v10;
    uint64_t v12 = [v10 specifier];
    uint64_t v13 = [v12 propertyForKey:@"BBSECTION_INFO_KEY"];
    v58 = [v13 sectionID];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = (id)qword_50150;
    id v57 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v57)
    {
      LODWORD(v14) = 0;
      unsigned __int8 v15 = 0;
      uint64_t v56 = *(void *)v67;
      uint64_t v16 = v11;
      v51 = v8;
      v52 = v6;
LABEL_7:
      uint64_t v17 = 0;
      unint64_t v14 = (int)v14;
      while (1)
      {
        if (*(void *)v67 != v56) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v66 + 1) + 8 * v17);
        if ((unint64_t)[v6 count] <= v14) {
          goto LABEL_45;
        }
        id v19 = [v6 objectAtIndex:v14];
        __int16 v20 = v19;
        unint64_t v59 = v14;
        if (v15)
        {
          unsigned __int8 v60 = 1;
        }
        else
        {
          int v21 = [v19 sectionID];
          unsigned __int8 v60 = [v58 isEqualToString:v21];
        }
        __int16 v22 = [v20 subsections];
        id v23 = [v22 count];
        long long v24 = [v18 subsections];
        id v25 = [v24 count];

        v61 = v20;
        if (v23 == v25)
        {
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          __int16 v26 = [v20 subsections];
          id v27 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (v27)
          {
            id v28 = v27;
            v53 = v16;
            int v29 = 0;
            uint64_t v30 = *(void *)v63;
            while (2)
            {
              v31 = 0;
              uint64_t v32 = v29;
              do
              {
                if (*(void *)v63 != v30) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v33 = *(void *)(*((void *)&v62 + 1) + 8 * (void)v31);
                v34 = [v18 subsections];
                v35 = [v34 objectAtIndex:(char *)v31 + v32];

                LODWORD(v34) = [v35 isEqualToSection:v33];
                if (!v34)
                {
                  char v36 = 0;
                  goto LABEL_26;
                }
                v31 = (char *)v31 + 1;
              }
              while (v28 != v31);
              id v28 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
              int v29 = v32 + v31;
              if (v28) {
                continue;
              }
              break;
            }
            char v36 = 1;
LABEL_26:
            id v8 = v51;
            uint64_t v6 = v52;
            uint64_t v16 = v53;
            __int16 v20 = v61;
          }
          else
          {
            char v36 = 1;
          }
        }
        else
        {
          char v36 = 0;
        }
        v37 = [v18 sectionID];
        uint64_t v38 = [v20 sectionID];
        if ([v37 isEqualToString:v38]
          && (long long v39 = v20,
              id v40 = [v18 notificationCenterSetting],
              v40 == [v39 notificationCenterSetting])
          && (id v41 = [v18 pushSettings], v41 == objc_msgSend(v39, "pushSettings")))
        {

          if (v36)
          {
            unsigned __int8 v15 = v60;
            goto LABEL_39;
          }
        }
        else
        {
        }
        unsigned __int8 v15 = v60;
        if (v16)
        {
          long long v42 = [v18 sectionID];
          unsigned int v43 = [v42 isEqualToString:v58];

          unint64_t v44 = v59;
          if (v43)
          {
            uint64_t v45 = [v8 topViewController];

            BOOL v55 = 0;
            uint64_t v16 = (void *)v45;
          }
          else
          {
            BOOL v55 = 0;
          }
          goto LABEL_41;
        }
        BOOL v55 = 0;
LABEL_39:
        unint64_t v44 = v59;
LABEL_41:
        unint64_t v14 = v44 + 1;

        if ((id)++v17 == v57)
        {
          id v57 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
          if (v57) {
            goto LABEL_7;
          }
          goto LABEL_45;
        }
      }
    }
    unsigned __int8 v15 = 0;
    uint64_t v16 = v11;
LABEL_45:

    if ((v15 & 1) == 0 && v16) {
      id v46 = [v8 popToViewController:v49 animated:1];
    }
    if (!v55)
    {
      id v47 = [objc_alloc((Class)NSMutableArray) initWithArray:v6];
      v48 = (void *)qword_50150;
      qword_50150 = (uint64_t)v47;

      [(BulletinBoardController *)v49 reloadSpecifiers];
      [v16 reloadSpecifiers];
    }
  }
}

- (void)_updateStoredSectionsWithSectionInfo:(id)a3
{
  id v3 = a3;
  if (qword_50150)
  {
    id v4 = [(id)qword_50150 mutableCopy];
    id v5 = (void *)qword_50150;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1B580;
    v10[3] = &unk_40E00;
    id v6 = v3;
    id v11 = v6;
    id v7 = [v5 indexOfObjectPassingTest:v10];
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [v4 addObject:v6];
    }
    else {
      [v4 setObject:v6 atIndexedSubscript:v7];
    }
    id v8 = (void *)qword_50150;
    qword_50150 = (uint64_t)v4;
    id v9 = v4;
  }
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BulletinBoardController;
  id v5 = [(BulletinBoardController *)&v7 selectSpecifier:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v5 setDelegate:self];
  }
  +[BulletinBoardController emitNavigationEventForSpecifier:v4 viewController:v5];

  return v5;
}

- (void)appDetailControllerWillDisappear:(id)a3
{
  id v4 = [a3 specifier];
  [(BulletinBoardController *)self reloadSpecifier:v4];
}

- (void)spokenNotificationsDetailListController:(id)a3 didChangeGlobalSpokenNotificationSetting:(int64_t)a4
{
}

- (void)scheduledDeliverySettingsControllerDidChangeGlobalScheduledDeliverySettings:(id)a3
{
}

- (void)summarizePreviewsDetailController:(id)a3 didChangeGlobalSummarizePreviewsSetting:(int64_t)a4
{
}

- (BOOL)summarizePreviewsDetailController:(id)a3 shouldShowSection:(id)a4
{
  id v5 = a4;
  LOBYTE(self) = [(BulletinBoardController *)self _shouldShowSection:v5];
  unsigned __int8 v6 = [v5 allowsNotifications];

  return self & v6;
}

- (void)priorityNotificationsDetailController:(id)a3 didUpdateSetting:(int64_t)a4
{
  self->_int64_t globalHighlightsSetting = a4;
  [(BulletinBoardController *)self reloadSpecifierID:@"PRIORITIZE_NOTIFICATIONS_ID"];
}

- (void)settingsGateway:(id)a3 didUpdateSectionInfo:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1B888;
  v5[3] = &unk_40D08;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)settingsGatewayDidUpdateGlobalSettings:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B9E8;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1BA64;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)emitNavigationEventForRootController
{
  id v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v9 = [v3 bundleURL];

  if (v9)
  {
    id v4 = +[NSURL URLWithString:kNotificationSettingsDeepLinkURLString];
    id v5 = objc_alloc((Class)_NSLocalizedStringResource);
    id v6 = kNotificationsSettingsLocalizedStringsTable;
    objc_super v7 = +[NSLocale currentLocale];
    id v8 = [v5 initWithKey:@"TITLE" table:v6 locale:v7 bundleURL:v9];

    [(BulletinBoardController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:kNotificationsSettingsGraphicIcon title:v8 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
  }
}

+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = objc_opt_class();
  if ([v7 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = v6;
    id v9 = [v5 identifier];
    uint64_t v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v11 = [v10 bundleURL];

    if (!v9) {
      goto LABEL_11;
    }
    if (!v11) {
      goto LABEL_11;
    }
    id v12 = [v5 detailControllerClass];
    if (v12 == (id)objc_opt_class()) {
      goto LABEL_11;
    }
    uint64_t v13 = +[NSURL URLWithString:kNotificationSettingsDeepLinkURLString];
    uint64_t v37 = [v13 URLByAppendingPathComponent:v9];

    v41[0] = @"SCHEDULED_DELIVERY_ID";
    v41[1] = @"SHOW_PREVIEW_GROUP_ID";
    v42[0] = @"SCHEDULED_DELIVERY";
    v42[1] = @"SHOW_PREVIEWS";
    v41[2] = @"SCREENSHARING_ID";
    v41[3] = @"SIRI_SUGGESTIONS_ID";
    v42[2] = @"SCREEN_SHARING";
    v42[3] = @"SIRI_SUGGESTIONS";
    v41[4] = @"SPOKEN_NOTIFICATIONS_ID";
    v42[4] = @"SPOKEN_NOTIFICATIONS";
    uint64_t v38 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:5];
    unint64_t v14 = [v38 objectForKeyedSubscript:v9];
    id v15 = objc_alloc((Class)_NSLocalizedStringResource);
    uint64_t v16 = kNotificationsSettingsLocalizedStringsTable;
    uint64_t v17 = +[NSLocale currentLocale];
    id v18 = [v15 initWithKey:@"TITLE" table:v16 locale:v17 bundleURL:v11];

    if (v14)
    {
      id v19 = objc_alloc((Class)_NSLocalizedStringResource);
      __int16 v20 = kNotificationsSettingsLocalizedStringsTable;
      int v21 = +[NSLocale currentLocale];
      char v36 = v14;
      id v22 = [v19 initWithKey:v14 table:v20 locale:v21 bundleURL:v11];

      id v23 = kNotificationsSettingsGraphicIcon;
      id v40 = v18;
      long long v24 = +[NSArray arrayWithObjects:&v40 count:1];
      id v25 = v8;
      __int16 v26 = v23;
      id v27 = v22;
      id v28 = v24;
      int v29 = (void *)v37;
      uint64_t v30 = v37;
    }
    else
    {
      int v29 = (void *)v37;
      if (!objc_msgSend(objc_msgSend(v5, "detailControllerClass"), "isSubclassOfClass:", objc_opt_class()))
      {
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      char v36 = 0;
      id v35 = objc_alloc((Class)_NSLocalizedStringResource);
      v31 = [v5 name];
      uint64_t v32 = kNotificationsSettingsLocalizedStringsTable;
      uint64_t v33 = +[NSLocale currentLocale];
      id v22 = [v35 initWithKey:@"APP_NAME_IN_DEFAULT_VALUE" defaultValue:v31 table:v32 locale:v33 bundleURL:v11];

      v34 = kNotificationsSettingsGraphicIcon;
      id v39 = v18;
      long long v24 = +[NSArray arrayWithObjects:&v39 count:1];
      id v25 = v8;
      __int16 v26 = v34;
      int v29 = (void *)v37;
      id v27 = v22;
      id v28 = v24;
      uint64_t v30 = v37;
    }
    objc_msgSend(v25, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", v26, v27, v28, v30);

    unint64_t v14 = v36;
    goto LABEL_10;
  }
LABEL_12:
}

- (PSSpecifier)emptyCell
{
  return self->_emptyCell;
}

- (void)setEmptyCell:(id)a3
{
}

- (NSMutableDictionary)alertTypeKeys
{
  return self->_alertTypeKeys;
}

- (void)setAlertTypeKeys:(id)a3
{
}

- (NSDictionary)urlResourceDictionary
{
  return self->_urlResourceDictionary;
}

- (void)setUrlResourceDictionary:(id)a3
{
}

- (BOOL)telephonyDevice
{
  return self->_telephonyDevice;
}

- (void)setTelephonyDevice:(BOOL)a3
{
  self->_BOOL telephonyDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlResourceDictionary, 0);
  objc_storeStrong((id *)&self->_alertTypeKeys, 0);
  objc_storeStrong((id *)&self->_emptyCell, 0);
  objc_storeStrong((id *)&self->_appProtectionEventSubscription, 0);
  objc_storeStrong((id *)&self->_showPreviewsGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_notificationsGlobalSettingsGroupSpecifier, 0);
}

@end