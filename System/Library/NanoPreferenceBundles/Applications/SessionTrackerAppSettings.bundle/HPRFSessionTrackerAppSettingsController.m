@interface HPRFSessionTrackerAppSettingsController
- (BOOL)_deviceSupportsCyclingAutoStart;
- (HPRFSessionTrackerAppSettingsController)init;
- (id)NFCAlwaysOn:(id)a3;
- (id)_createConfigurationDataSourceSpecifiers;
- (id)applicationBundleIdentifier;
- (id)autoPauseItemValue;
- (id)bundle;
- (id)createPowerSpecifiers;
- (id)getGuidedRunPrefetchEnabled:(id)a3;
- (id)getGuidedWorkoutPrefetchEnabled:(id)a3;
- (id)isAutoPauseEnabled;
- (id)isConfirmEndWorkoutEnabled;
- (id)isCyclingAutoPauseEnabled;
- (id)isEndRemindersEnabled:(id)a3;
- (id)isGuidedRunMediaMomentsEnabled:(id)a3;
- (id)isGuidedWorkoutMediaMomentsEnabled:(id)a3;
- (id)isMirrorModeEnabled;
- (id)isPrecisionStartEnabled;
- (id)isResumeRemindersEnabled:(id)a3;
- (id)isRunningAutoPauseEnabled;
- (id)isStartRemindersEnabled:(id)a3;
- (id)isVoiceFeedbackEnabled:(id)a3;
- (id)isWorkoutSafetyCheckInEnabled;
- (id)localizedPaneTitle;
- (id)lowPowerModeName;
- (id)selectedLPMIdentifierSwitch;
- (id)selectedMusicViewString:(id)a3;
- (id)selectedPaceViewString:(id)a3;
- (id)selectedUltraIdentifier;
- (id)shouldAlertOnWatchWhenMirrored;
- (id)shouldTrackTrainingLoad;
- (id)specifiers;
- (void)_addAboutTextToSpecifier:(id)a3;
- (void)_addGestureLinkToSpecifier:(id)a3;
- (void)_addLearnMoreExtendedLowPowerModeTextToSpecifier:(id)a3;
- (void)_addLearnMoreLowPowerModeTextToSpecifier:(id)a3;
- (void)_addPreKincaidFooterTextToSpecifier:(id)a3;
- (void)_openEltonSetting;
- (void)_openPrivacyLink;
- (void)_refreshManagedConfigurationDataSources;
- (void)_showConfigurationDataSourceProviderSpecifiers:(BOOL)a3;
- (void)_showLearnMoreAboutLowPowerMode;
- (void)_updateShuffleSelectionInSpecifiers:(id)a3;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)dealloc;
- (void)expressGymKitAvailabilityManager:(id)a3 didChangeIsExpressGymKitAllowed:(BOOL)a4;
- (void)isSubscribedWithCompletion:(id)a3;
- (void)onMessagesAppInstalled;
- (void)onMessagesAppUninstalled;
- (void)reloadSpecifiers;
- (void)setGuidedRunPrefetchEnabled:(id)a3 specifier:(id)a4;
- (void)setGuidedWorkoutPrefetchEnabled:(id)a3 specifier:(id)a4;
- (void)setNFCAlwaysOn:(id)a3 specifier:(id)a4;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setSelectedLPMIdentifierSwitch:(id)a3;
- (void)setSelectedUltraIdentifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateWorkoutInstallState:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HPRFSessionTrackerAppSettingsController

- (HPRFSessionTrackerAppSettingsController)init
{
  v24.receiver = self;
  v24.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  v2 = [(HPRFSessionTrackerAppSettingsController *)&v24 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_C9F4, @"NanoLifestyleSessionTrackerAppPreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)sub_C9FC, @"ConnectedGymPreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)sub_CA78, @"GuidedWorkoutPreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)sub_CB48, @"GuidedRunPreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v7 = [[HPRFSessionTrackerAppSettingsContext alloc] initWithWheelchairUseCache:v2->_wheelchairUseCharacteristicCache];
    sessionTrackerAppSettingsContext = v2->_sessionTrackerAppSettingsContext;
    v2->_sessionTrackerAppSettingsContext = v7;

    v2->_isSubscribed = 0;
    v9 = +[NRPairedDeviceRegistry sharedInstance];
    v10 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v11 = [v9 getAllDevicesWithArchivedAltAccountDevicesMatching:v10];
    uint64_t v12 = [v11 firstObject];
    device = v2->_device;
    v2->_device = (NRDevice *)v12;

    uint64_t v14 = FIUIHealthStoreForDevice();
    healthStore = v2->_healthStore;
    v2->_healthStore = (HKHealthStore *)v14;

    v16 = (_HKWheelchairUseCharacteristicCache *)[objc_alloc((Class)_HKWheelchairUseCharacteristicCache) initWithHealthStore:v2->_healthStore];
    wheelchairUseCharacteristicCache = v2->_wheelchairUseCharacteristicCache;
    v2->_wheelchairUseCharacteristicCache = v16;

    [(_HKWheelchairUseCharacteristicCache *)v2->_wheelchairUseCharacteristicCache addObserver:v2];
    v18 = (NPKExpressGymKitAvailabilityManager *)[objc_alloc((Class)sub_CC18()) initWithDelegate:v2];
    expressGymKitAvailabilityManager = v2->_expressGymKitAvailabilityManager;
    v2->_expressGymKitAvailabilityManager = v18;

    v2->_isWorkoutAppInstalled = 0;
    v2->_activityMoveMode = FIActivityMoveModeWithHealthStore();
    v20 = (SMAppDeletionManager *)objc_alloc_init((Class)SMAppDeletionManager);
    appDeletionManager = v2->_appDeletionManager;
    v2->_appDeletionManager = v20;

    [(SMAppDeletionManager *)v2->_appDeletionManager addObserver:v2];
    v22 = +[ACXDeviceConnection sharedDeviceConnection];
    [v22 addObserver:v2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v10 viewDidLoad];
  v3 = +[ACXDeviceConnection sharedDeviceConnection];
  device = self->_device;
  id v9 = 0;
  [v3 getApplicationIsInstalled:&self->_isWorkoutAppInstalled withBundleID:@"com.apple.SessionTrackerApp" onPairedDevice:device error:&v9];
  id v5 = v9;

  if (self->_isWorkoutAppInstalled)
  {
    v6 = [(HPRFSessionTrackerAppSettingsController *)self localizedPaneTitle];
    [(HPRFSessionTrackerAppSettingsController *)self setTitle:v6];
  }
  else
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PANE_TITLE_UNINSTALLED" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [(HPRFSessionTrackerAppSettingsController *)self setTitle:v7];
  }
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_willEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v5 viewWillAppear:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_CF04;
  v4[3] = &unk_31100;
  v4[4] = self;
  [(HPRFSessionTrackerAppSettingsController *)self isSubscribedWithCompletion:v4];
  [(HPRFSessionTrackerAppSettingsController *)self _refreshManagedConfigurationDataSources];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v8 viewDidAppear:a3];
  if (!self->_device)
  {
    v4 = +[_HKBehavior sharedBehavior];
    unsigned int v5 = [v4 isAppleInternalInstall];

    if (v5)
    {
      v6 = +[UIAlertController alertControllerWithTitle:@"Unexpected state!" message:@"Didn't get an active watch, this is unexpected and will lead to unexpected results. Please file a radar." preferredStyle:1];
      v7 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
      [v6 addAction:v7];

      [(HPRFSessionTrackerAppSettingsController *)self presentViewController:v6 animated:1 completion:0];
    }
  }
}

- (void)dealloc
{
  [(SMAppDeletionManager *)self->_appDeletionManager removeObserver:self];
  v3 = +[ACXDeviceConnection sharedDeviceConnection];
  [v3 removeObserver:self];

  [(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache removeObserver:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v5 dealloc];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v3;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFSessionTrackerAppSettingsController *)self bundle];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (BOOL)_deviceSupportsCyclingAutoStart
{
  device = self->_device;
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C5C226E6-01A7-4731-BDDA-D7F62A979D52"];
  LOBYTE(device) = [(NRDevice *)device supportsCapability:v3];

  return (char)device;
}

- (void)setSelectedLPMIdentifierSwitch:(id)a3
{
  [a3 BOOLValue];

  FIUISetIsPowerSavingModeEnabled();
}

- (id)selectedLPMIdentifierSwitch
{
  uint64_t v2 = FIUIIsPowerSavingModeEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (void)setSelectedUltraIdentifier:(id)a3
{
  [a3 BOOLValue];

  FIUISetWorkoutExtendedModeEnabled();
}

- (id)selectedUltraIdentifier
{
  uint64_t v2 = FIUIIsWorkoutExtendedModeEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)lowPowerModeName
{
  device = self->_device;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C26AD300-9198-11EC-8BC2-0800200C9A66"];
  LODWORD(device) = [(NRDevice *)device supportsCapability:v4];

  if (device)
  {
    objc_super v5 = FIUIBundle();
    v6 = v5;
    CFStringRef v7 = @"WORKOUT_MODE_LOW_POWER_LABEL";
    CFStringRef v8 = @"Localizable";
  }
  else
  {
    id v9 = self->_device;
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F5E0C9C7-CA38-421E-808A-0705258C1EF9"];
    unsigned int v11 = [(NRDevice *)v9 supportsCapability:v10];

    objc_super v5 = FIUIBundle();
    v6 = v5;
    if (v11)
    {
      CFStringRef v7 = @"WORKOUT_LOW_POWER_MODE_LEARN_MORE_TITLE";
      CFStringRef v8 = @"Localizable-meadow";
    }
    else
    {
      CFStringRef v7 = @"POWER_SAVING_MODE_LABEL";
      CFStringRef v8 = @"Localizable";
    }
  }
  uint64_t v12 = [v5 localizedStringForKey:v7 value:&stru_31A20 table:v8];

  return v12;
}

- (id)createPowerSpecifiers
{
  id v3 = objc_opt_new();
  id v4 = [(HPRFSessionTrackerAppSettingsController *)self lowPowerModeName];
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setSelectedLPMIdentifierSwitch:" get:"selectedLPMIdentifierSwitch" detail:0 cell:6 edit:0];
  uint64_t v6 = PSValueChangedNotificationKey;
  [v5 setProperty:@"NanoLifestyleSessionTrackerAppPreferencesChangedNotification" forKey:PSValueChangedNotificationKey];
  uint64_t v7 = PSIDKey;
  [v5 setProperty:@"LPM_SWITCH" forKey:PSIDKey];
  [v3 addObject:v5];
  if (FIUIIsWorkoutExtendedModeSupported())
  {
    v17 = v4;
    CFStringRef v8 = FIUIBundle();
    id v9 = [v8 localizedStringForKey:@"WORKOUT_ULTRA_MODE_GROUP_TITLE" value:&stru_31A20 table:@"Localizable"];
    id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v10 setProperty:@"ULTRA_GROUP_ID" forKey:v7];
    unsigned int v11 = FIUIBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"WORKOUT_ULTRA_MODE_TRACK_RUNNING_FOOTER" value:&stru_31A20 table:@"Localizable"];

    [v10 setProperty:v12 forKey:PSFooterTextGroupKey];
    [v3 addObject:v10];
    v13 = FIUIBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"WORKOUT_MODE_ULTRA_LABEL" value:&stru_31A20 table:@"Localizable"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setSelectedUltraIdentifier:" get:"selectedUltraIdentifier" detail:0 cell:6 edit:0];

    [v15 setProperty:@"NanoLifestyleSessionTrackerAppPreferencesChangedNotification" forKey:v6];
    [v15 setProperty:@"ULTRA_SWITCH" forKey:v7];
    [v3 addObject:v15];

    id v4 = v17;
  }

  return v3;
}

- (id)specifiers
{
  id v3 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_90;
  }
  uint64_t v164 = OBJC_IVAR___PSListController__specifiers;
  id v4 = [(HPRFSessionTrackerAppSettingsController *)self loadSpecifiersFromPlistName:@"SessionTrackerAppSettings" target:self];
  uint64_t v5 = FIActivityMoveModeWithHealthStore();
  healthStore = self->_healthStore;
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"HEALTH_SHARING_REQUIRED" value:&stru_31A20 table:@"SessionTrackerAppSettings-tinker"];

  if (healthStore)
  {
    id v9 = [v4 specifierForID:@"METRIC_VIEW_FOOTER_ID"];
    [v4 removeObject:v9];
  }
  else
  {
    id v10 = [v4 specifierForID:@"METRIC_VIEW_ID"];
    unsigned int v11 = +[NSNumber numberWithBool:0];
    [v10 setProperty:v11 forKey:PSEnabledKey];

    id v9 = [v4 specifierForID:@"METRIC_VIEW_FOOTER_ID"];
    [v9 setProperty:v8 forKey:PSFooterTextGroupKey];
  }
  v163 = (void *)v8;

  uint64_t v12 = [v4 specifierForID:@"POWER_SAVING_MODE_GROUP_ID"];
  [(HPRFSessionTrackerAppSettingsController *)self _addLearnMoreLowPowerModeTextToSpecifier:v12];
  v161 = [(HPRFSessionTrackerAppSettingsController *)self createPowerSpecifiers];
  v162 = (void *)v12;
  objc_msgSend(v4, "ps_insertObjectsFromArray:afterObject:");
  device = self->_device;
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"66DE554B-3959-40C7-88B1-81E8481E3B84"];
  LOBYTE(device) = [(NRDevice *)device supportsCapability:v14];

  if ((device & 1) == 0)
  {
    v15 = [v4 specifierForID:@"MUSIC_AUTOSTART_FOOTER_ID"];
    [v4 removeObject:v15];

    v16 = [v4 specifierForID:@"MUSIC_AUTOSTART_TITLE_ID"];
    [v4 removeObject:v16];
  }
  v17 = self->_device;
  id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"97181DA3-0809-43D6-9559-3FDBC5629F62"];
  unsigned __int8 v19 = [(NRDevice *)v17 supportsCapability:v18];
  if (v5 == 2) {
    unsigned __int8 v20 = 0;
  }
  else {
    unsigned __int8 v20 = v19;
  }

  v21 = [v4 specifierForID:@"NFC_ENABLED_FOOTER_ID"];
  if (v20)
  {
    [(HPRFSessionTrackerAppSettingsController *)self _addAboutTextToSpecifier:v21];
  }
  else
  {
    [v4 removeObject:v21];

    v21 = [v4 specifierForID:@"NFC_ENABLED_LABEL_ID"];
    [v4 removeObject:v21];
  }

  v22 = [v4 specifierForID:@"AUTO_PAUSE_GROUP_ID"];
  if (v22)
  {
    if (v5 == 2)
    {
      v23 = FIUIBundle();
      objc_super v24 = v23;
      CFStringRef v25 = @"AUTO_PAUSE_ENABLED_FOOTER_FITNESS_JUNIOR";
      CFStringRef v26 = @"Localizable-tinker";
    }
    else
    {
      v23 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v24 = v23;
      if (v20) {
        CFStringRef v25 = @"AUTO_PAUSE_ENABLED_FOOTER";
      }
      else {
        CFStringRef v25 = @"AUTO_PAUSE_ENABLED_FOOTER_WITHOUT_SPARTAN";
      }
      CFStringRef v26 = @"SessionTrackerAppSettings";
    }
    v27 = [v23 localizedStringForKey:v25 value:&stru_31A20 table:v26];

    [v22 setProperty:v27 forKey:PSFooterTextGroupKey];
  }
  unsigned __int8 v28 = [(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache isWheelchairUser];
  if (!FIDeviceMeetsMinimumOSVersionGlory() || (v28 & 1) != 0 || v5 == 2)
  {
    v29 = [v4 specifierForID:@"REMINDERS_GROUP"];
    [v4 removeObject:v29];

    v30 = [v4 specifierForID:@"AUTO_START_WORKOUT_NOTIFICATIONS_ENABLED_LABEL"];
    [v4 removeObject:v30];

    v31 = [v4 specifierForID:@"RESUME_REMINDERS_ENABLED_LABEL"];
    [v4 removeObject:v31];

    v32 = [v4 specifierForID:@"END_REMINDERS_ENABLED_LABEL"];
    [v4 removeObject:v32];
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v33 = [v4 specifierForID:@"RESUME_REMINDERS_ENABLED_LABEL"];
    [v4 removeObject:v33];

    v34 = [v4 specifierForID:@"REMINDERS_GROUP"];
    if (v34)
    {
      v35 = +[NSBundle bundleForClass:objc_opt_class()];
      v36 = [v35 localizedStringForKey:@"REMINDERS_FOOTER_NO_RESUME" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      [v34 setProperty:v36 forKey:PSFooterTextGroupKey];
    }
  }
  v37 = +[NMSMediaPinningManager sharedManager];
  v38 = [v37 workoutPlaylistID];

  if (!v38)
  {
    selectedAlbumTitle = self->_selectedAlbumTitle;
    self->_selectedAlbumTitle = 0;
  }
  v160 = v22;
  if (+[HPRFSessionTrackerMusicViewController didSelectWorkoutMusicPlaylist])
  {
    [(HPRFSessionTrackerAppSettingsController *)self _updateShuffleSelectionInSpecifiers:v4];
    id v40 = objc_alloc_init((Class)MPModelLibraryRequest);
    v41 = +[MPModelSong kindWithVariants:1];
    v174 = v41;
    v42 = +[NSArray arrayWithObjects:&v174 count:1];
    v43 = +[MPModelPlaylistEntry kindWithKinds:v42];

    v44 = +[MPModelPlaylist kindWithVariants:19 playlistEntryKind:v43 options:0];
    [v40 setItemKind:v44];

    uint64_t v173 = MPModelPropertyPlaylistName;
    v45 = +[NSArray arrayWithObjects:&v173 count:1];
    v46 = +[MPPropertySet propertySetWithProperties:v45];
    [v40 setItemProperties:v46];

    v47 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistLibraryAddedDate ascending:0];
    v172 = v47;
    v48 = +[NSArray arrayWithObjects:&v172 count:1];
    [v40 setItemSortDescriptors:v48];

    v165[0] = _NSConcreteStackBlock;
    v165[1] = 3221225472;
    v165[2] = sub_EF60;
    v165[3] = &unk_31178;
    id v166 = v4;
    v167 = self;
    [v40 performWithResponseHandler:v165];
  }
  else
  {
    v49 = [v4 specifierForID:@"WORKOUT_MUSIC_SHUFFLE_GROUP_ID"];
    [v4 removeObject:v49];

    v50 = [v4 specifierForID:@"WORKOUT_MUSIC_PLAY_FROM_BEGINNING_SETTING_ID"];
    [v4 removeObject:v50];

    id v40 = [v4 specifierForID:@"WORKOUT_MUSIC_SHUFFLE_SETTING_ID"];
    [v4 removeObject:v40];
  }

  BOOL isSubscribed = self->_isSubscribed;
  _HKInitializeLogging();
  v52 = HKLogWorkouts;
  BOOL v53 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (isSubscribed)
  {
    if (v53)
    {
      BOOL v54 = self->_isSubscribed;
      *(_DWORD *)buf = 67109120;
      LODWORD(v169) = v54;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "[HPRFSessionTrackerAppSettingsController] seymour settings should have been added: %d", buf, 8u);
    }
    v55 = [v4 specifierForID:@"GUIDED_WORKOUT_PREFETCH_FOOTER_ID"];
    v56 = +[NSBundle bundleForClass:objc_opt_class()];
    v159 = [v56 localizedStringForKey:@"GUIDED_WORKOUT_PREFETCH_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings-seymour"];

    v156 = v55;
    uint64_t v57 = PSFooterTextGroupKey;
    objc_msgSend(v55, "setProperty:forKey:", v159);
    v58 = +[NSBundle bundleForClass:objc_opt_class()];
    v158 = [v58 localizedStringForKey:@"GUIDED_WORKOUT_PREFETCH_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings-seymour"];

    [v55 setName:v158];
    v59 = [v4 specifierForID:@"GUIDED_WORKOUT_PREFETCH_LABEL_ID"];
    v60 = +[NSBundle bundleForClass:objc_opt_class()];
    v157 = [v60 localizedStringForKey:@"GUIDED_WORKOUT_PREFETCH_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings-seymour"];

    v155 = v59;
    [v59 setName:v157];
    uint64_t v61 = PSAllowMultilineTitleKey;
    [v59 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v154 = [v4 specifierForID:@"GUIDED_WORKOUT_MEDIA_MOMENTS_FOOTER"];
    v62 = +[NSBundle bundleForClass:objc_opt_class()];
    v153 = [v62 localizedStringForKey:@"GUIDED_WORKOUT_MEDIA_MOMENTS_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings-seymour"];

    uint64_t v63 = v57;
    [v154 setProperty:v153 forKey:v57];
    v64 = [v4 specifierForID:@"GUIDED_WORKOUT_MEDIA_MOMENTS_LABEL"];
    v65 = +[NSBundle bundleForClass:objc_opt_class()];
    v151 = [v65 localizedStringForKey:@"GUIDED_WORKOUT_MEDIA_MOMENTS_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings-seymour"];

    v152 = v64;
    [v64 setName:v151];
    [v64 setProperty:&__kCFBooleanTrue forKey:v61];
    v66 = [v4 specifierForID:@"GUIDED_RUN_PREFETCH_FOOTER_ID"];
    v67 = +[NSBundle bundleForClass:objc_opt_class()];
    v150 = [v67 localizedStringForKey:@"GUIDED_RUN_PREFETCH_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings-breeze"];

    v149 = v66;
    uint64_t v68 = v63;
    [v66 setProperty:v150 forKey:v63];
    v69 = +[NSBundle bundleForClass:objc_opt_class()];
    v148 = [v69 localizedStringForKey:@"GUIDED_RUN_PREFETCH_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings-breeze"];

    [v66 setName:v148];
    v70 = [v4 specifierForID:@"GUIDED_RUN_PREFETCH_LABEL_ID"];
    v71 = +[NSBundle bundleForClass:objc_opt_class()];
    v147 = [v71 localizedStringForKey:@"GUIDED_RUN_PREFETCH_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings-breeze"];

    [v70 setName:v147];
    [v70 setProperty:&__kCFBooleanTrue forKey:v61];
    v72 = [v4 specifierForID:@"GUIDED_RUN_MEDIA_MOMENTS_FOOTER"];
    v73 = +[NSBundle bundleForClass:objc_opt_class()];
    v74 = [v73 localizedStringForKey:@"GUIDED_RUN_MEDIA_MOMENTS_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings-breeze"];

    [v72 setProperty:v74 forKey:v68];
    v75 = [v4 specifierForID:@"GUIDED_RUN_MEDIA_MOMENTS_LABEL"];
    v76 = +[NSBundle bundleForClass:objc_opt_class()];
    v77 = [v76 localizedStringForKey:@"GUIDED_RUN_MEDIA_MOMENTS_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings-breeze"];

    [v75 setName:v77];
    [v75 setProperty:&__kCFBooleanTrue forKey:v61];

    v78 = v156;
  }
  else
  {
    if (v53)
    {
      BOOL v79 = self->_isSubscribed;
      *(_DWORD *)buf = 67109120;
      LODWORD(v169) = v79;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "[HPRFSessionTrackerAppSettingsController] seymour settings should have been removed: %d", buf, 8u);
    }
    v80 = [v4 specifierForID:@"GUIDED_WORKOUT_PREFETCH_FOOTER_ID"];
    [v4 removeObject:v80];

    v81 = [v4 specifierForID:@"GUIDED_WORKOUT_PREFETCH_LABEL_ID"];
    [v4 removeObject:v81];

    v82 = [v4 specifierForID:@"GUIDED_WORKOUT_MEDIA_MOMENTS_FOOTER"];
    [v4 removeObject:v82];

    v83 = [v4 specifierForID:@"GUIDED_WORKOUT_MEDIA_MOMENTS_LABEL"];
    [v4 removeObject:v83];

    v84 = [v4 specifierForID:@"GUIDED_RUN_PREFETCH_FOOTER_ID"];
    [v4 removeObject:v84];

    v85 = [v4 specifierForID:@"GUIDED_RUN_PREFETCH_LABEL_ID"];
    [v4 removeObject:v85];

    v86 = [v4 specifierForID:@"GUIDED_RUN_MEDIA_MOMENTS_FOOTER"];
    [v4 removeObject:v86];

    v78 = [v4 specifierForID:@"GUIDED_RUN_MEDIA_MOMENTS_LABEL"];
    [v4 removeObject:v78];
  }

  if (!_os_feature_enabled_impl())
  {
    v93 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyCurrentUserLocale];
    v89 = +[NSLocale localeWithLocaleIdentifier:v93];

    v94 = [v89 languageCode];
    int v95 = FIUIIsWorkoutVoiceFeedbackSupportedForLanguage();

    _HKInitializeLogging();
    v96 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v97 = v96;
      v98 = [v89 languageCode];
      *(_DWORD *)buf = 138412546;
      v169 = v98;
      __int16 v170 = 1024;
      int v171 = v95 ^ 1;
      _os_log_impl(&dword_0, v97, OS_LOG_TYPE_DEFAULT, "[HPRFSessionTrackerAppSettingsController] pairedDeviceLanguageCode=%@ shouldHideWorkoutVoiceFeedback=%{BOOL}d", buf, 0x12u);
    }
    if (v95) {
      goto LABEL_49;
    }
    v99 = [v4 specifierForID:@"WORKOUT_VOICE_FEEDBACK_FOOTER"];
    [v4 removeObject:v99];

    v90 = [v4 specifierForID:@"WORKOUT_VOICE_FEEDBACK_LABEL"];
    [v4 removeObject:v90];
LABEL_48:

LABEL_49:
    goto LABEL_50;
  }
  v87 = +[AFPreferences sharedPreferences];
  unsigned __int8 v88 = [v87 nanoAssistantEnabled];

  if ((v88 & 1) == 0)
  {
    v89 = [v4 specifierForID:@"WORKOUT_VOICE_FEEDBACK_LABEL"];
    [v89 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    v90 = [v4 specifierForID:@"WORKOUT_VOICE_FEEDBACK_FOOTER"];
    v91 = +[NSBundle bundleForClass:objc_opt_class()];
    v92 = [v91 localizedStringForKey:@"WORKOUT_VOICE_FEEDBACK_FOOTER_SIRI_DISABLED" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v90 setProperty:v92 forKey:PSFooterTextGroupKey];

    goto LABEL_48;
  }
LABEL_50:
  v100 = self->_device;
  id v101 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0D852855-E6CF-45FA-B786-B26BE87FF939"];
  unsigned __int8 v102 = [(NRDevice *)v100 supportsCapability:v101];

  if (self->_activityMoveMode == 2 || (v102 & 1) == 0)
  {
    v103 = [v4 specifierForID:@"CYCLING_POWER_ZONES_GROUP"];
    [v4 removeObject:v103];

    v104 = [v4 specifierForID:@"CYCLING_POWER_ZONES_BUTTON"];
    [v4 removeObject:v104];
  }
  if ((v102 & 1) == 0)
  {
    v105 = [v4 specifierForID:@"MIRROR_WORKOUTS_ENABLED_LABEL_ID"];
    [v4 removeObject:v105];

    v106 = [v4 specifierForID:@"MIRROR_WORKOUTS_GROUP_ID"];
    [v4 removeObject:v106];

    v107 = [v4 specifierForID:@"ALERT_ON_WATCH_WHEN_MIRRORED_LABEL_ID"];
    [v4 removeObject:v107];

    v108 = [v4 specifierForID:@"ALERT_ON_WATCH_WHEN_MIRRORED_GROUP_ID"];
    [v4 removeObject:v108];
  }
  if (!_os_feature_enabled_impl()
    || (FIIsTinkerVegaOrFitnessJunior() & 1) != 0
    || (v109 = self->_device,
        id v110 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"210C1233-537B-4A1E-8EE0-253962851B43"], LOBYTE(v109) = -[NRDevice supportsCapability:](v109, "supportsCapability:", v110), v110, (v109 & 1) == 0))
  {
    v111 = [v4 specifierForID:@"TRAINING_LOAD_ENABLED_LABEL_ID"];
    [v4 removeObject:v111];

    v112 = [v4 specifierForID:@"TRAINING_LOAD_GROUP_ID"];
    [v4 removeObject:v112];
  }
  if ((v102 & 1) == 0)
  {
    v113 = [v4 specifierForID:@"WorkoutConfirmEndGroup"];
    [v4 removeObject:v113];

    v114 = [v4 specifierForID:@"WorkoutConfirmEndSwitch"];
    [v4 removeObject:v114];
  }
  if (_os_feature_enabled_impl())
  {
    v115 = +[IMSafetyMonitorCoordinator sharedCoordinator];
    if ([v115 shouldDisallowBasedOnRegulatoryDomain])
    {
    }
    else
    {
      unsigned __int8 v116 = [(SMAppDeletionManager *)self->_appDeletionManager isMessagesAppInstalled];

      if (v116) {
        goto LABEL_66;
      }
    }
  }
  v117 = [v4 specifierForID:@"WorkoutSafetyCheckInGroup"];
  [v4 removeObject:v117];

  v118 = [v4 specifierForID:@"WorkoutSafetyCheckInSwitch"];
  [v4 removeObject:v118];

LABEL_66:
  v119 = self->_device;
  id v120 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A97647CC-89CB-4C3C-A144-18371D6DD41F"];
  if (![(NRDevice *)v119 supportsCapability:v120])
  {
LABEL_71:

    goto LABEL_72;
  }
  v121 = self->_device;
  id v122 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  if (([(NRDevice *)v121 supportsCapability:v122] & 1) == 0)
  {

    goto LABEL_71;
  }
  char active = FIIsActivePairedDeviceSatellitePaired();

  if ((active & 1) == 0)
  {
    v124 = [v4 specifierForID:@"WorkoutDoubleTapToScrollGroup"];
    [(HPRFSessionTrackerAppSettingsController *)self _addGestureLinkToSpecifier:v124];
    goto LABEL_73;
  }
LABEL_72:
  v125 = [v4 specifierForID:@"WorkoutDoubleTapToScrollGroup"];
  [v4 removeObject:v125];

  v124 = [v4 specifierForID:@"WorkoutDoubleTapToScrollSwitch"];
  [v4 removeObject:v124];
LABEL_73:

  v126 = [v4 specifierForID:@"PrecisionStartGroup"];
  uint64_t v127 = [v4 specifierForID:@"PrecisionStartSwitch"];
  v128 = (void *)v127;
  if (v126 && v127)
  {
    v129 = FIUIBundle();
    v130 = [v129 localizedStringForKey:@"PRECISION_START_DESCRIPTION" value:&stru_31A20 table:@"Localizable"];
    [v126 setProperty:v130 forKey:PSFooterTextGroupKey];

    v131 = FIUIBundle();
    v132 = [v131 localizedStringForKey:@"PRECISION_START" value:&stru_31A20 table:@"Localizable"];
    [v128 setName:v132];
  }
  if ([(WOWorkoutConfigurationDataSourcesBridgedModel *)self->_configurationDataSourcesModel hasDataSources])
  {
    v133 = [(HPRFSessionTrackerAppSettingsController *)self _createConfigurationDataSourceSpecifiers];
    [v4 addObjectsFromArray:v133];
  }
  if (self->_isWorkoutAppInstalled)
  {
    v134 = [(HPRFSessionTrackerAppSettingsController *)self localizedPaneTitle];
    [(HPRFSessionTrackerAppSettingsController *)self setTitle:v134];
  }
  else
  {
    v134 = +[NSBundle bundleForClass:objc_opt_class()];
    v135 = [v134 localizedStringForKey:@"PANE_TITLE_UNINSTALLED" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [(HPRFSessionTrackerAppSettingsController *)self setTitle:v135];
  }
  if (!self->_isWorkoutAppInstalled)
  {
    v136 = (char *)[v4 count];
    if (v136)
    {
      v137 = v136 - 1;
      do
      {
        v138 = [v4 objectAtIndex:v137];
        v139 = [v138 identifier];
        unsigned __int8 v140 = [&off_34510 containsObject:v139];

        if ((v140 & 1) == 0) {
          [v4 removeObjectAtIndex:v137];
        }

        --v137;
      }
      while (v137 != (char *)-1);
    }
  }
  v141 = self->_device;
  id v142 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"622B6312-95FA-4F09-9148-69E286A9C31F"];
  LOBYTE(v141) = [(NRDevice *)v141 supportsCapability:v142];

  if ((v141 & 1) == 0)
  {
    v143 = [v4 specifierForID:@"BacktrackGroup"];
    [v4 removeObject:v143];

    v144 = [v4 specifierForID:@"BacktrackSwitch"];
    [v4 removeObject:v144];
  }
  v145 = *(void **)&self->BPSNotificationAppController_opaque[v164];
  *(void *)&self->BPSNotificationAppController_opaque[v164] = v4;

  id v3 = *(void **)&self->BPSNotificationAppController_opaque[v164];
LABEL_90:

  return v3;
}

- (void)_refreshManagedConfigurationDataSources
{
  device = self->_device;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E8688E98-D216-469E-9B5C-4D33527B0C6F"];
  LODWORD(device) = [(NRDevice *)device supportsCapability:v4];

  if (device)
  {
    if (!self->_configurationDataSourcesModel)
    {
      uint64_t v5 = objc_alloc_init(WOWorkoutConfigurationDataSourcesBridgedModel);
      configurationDataSourcesModel = self->_configurationDataSourcesModel;
      self->_configurationDataSourcesModel = v5;
    }
    objc_initWeak(&location, self);
    uint64_t v7 = self->_configurationDataSourcesModel;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_F3A4;
    v8[3] = &unk_311A0;
    objc_copyWeak(&v9, &location);
    [(WOWorkoutConfigurationDataSourcesBridgedModel *)v7 reload:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (id)_createConfigurationDataSourceSpecifiers
{
  id v3 = +[PSSpecifier groupSpecifierWithID:@"WORKOUT_CONFIGURATION_DATA_SOURCES_GROUP_ID"];
  id v4 = +[HPRFWorkoutConfigurationDataSourcesViewController title];
  uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v5 setIdentifier:@"WORKOUT_CONFIGURATION_DATA_SOURCES_ROW_ID"];
  [v5 setUserInfo:self->_configurationDataSourcesModel];
  v8[0] = v3;
  v8[1] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (void)_showConfigurationDataSourceProviderSpecifiers:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(HPRFSessionTrackerAppSettingsController *)self specifiers];
    uint64_t v5 = [v4 specifierForID:@"WORKOUT_CONFIGURATION_DATA_SOURCES_GROUP_ID"];

    if (!v5)
    {
      id v10 = [(HPRFSessionTrackerAppSettingsController *)self _createConfigurationDataSourceSpecifiers];
      unsigned int v11 = [(HPRFSessionTrackerAppSettingsController *)self specifiers];
      -[HPRFSessionTrackerAppSettingsController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v10, [v11 count], 1);

      [(HPRFSessionTrackerAppSettingsController *)self reloadSpecifiers];
    }
  }
  else
  {
    id v12 = (id)objc_opt_new();
    uint64_t v6 = [(HPRFSessionTrackerAppSettingsController *)self specifiers];
    uint64_t v7 = [v6 specifierForID:@"WORKOUT_CONFIGURATION_DATA_SOURCES_GROUP_ID"];

    if (v7) {
      [v12 addObject:v7];
    }
    uint64_t v8 = [(HPRFSessionTrackerAppSettingsController *)self specifiers];
    id v9 = [v8 specifierForID:@"WORKOUT_CONFIGURATION_DATA_SOURCES_ROW_ID"];

    if (v9) {
      [v12 addObject:v9];
    }
    if ([v12 count])
    {
      [(HPRFSessionTrackerAppSettingsController *)self removeContiguousSpecifiers:v12];
      [(HPRFSessionTrackerAppSettingsController *)self reloadSpecifiers];
    }
  }
}

- (void)_updateShuffleSelectionInSpecifiers:(id)a3
{
  id v4 = a3;
  id v8 = [v4 specifierForID:@"WORKOUT_MUSIC_SHUFFLE_GROUP_ID"];
  uint64_t v5 = [v4 specifierForID:@"WORKOUT_MUSIC_SHUFFLE_SETTING_ID"];
  uint64_t v6 = [v4 specifierForID:@"WORKOUT_MUSIC_PLAY_FROM_BEGINNING_SETTING_ID"];

  if (FIUIMusicIsPlaybackModeShuffle()) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v6;
  }
  [v8 setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
  [(HPRFSessionTrackerAppSettingsController *)self reloadSpecifier:v8];
}

- (void)reloadSpecifiers
{
  id v3 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  v4.receiver = self;
  v4.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v4 reloadSpecifiers];
}

- (void)_addLearnMoreLowPowerModeTextToSpecifier:(id)a3
{
  id v10 = a3;
  device = self->_device;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F5E0C9C7-CA38-421E-808A-0705258C1EF9"];
  if ([(NRDevice *)device supportsCapability:v5])
  {

LABEL_4:
    id v8 = FIUIBundle();
    id v9 = [v8 localizedStringForKey:@"WORKOUT_LOW_POWER_MODE_FOOTER_NO_LINK" value:&stru_31A20 table:@"Localizable-meadow"];

    [v10 setProperty:v9 forKey:PSFooterTextGroupKey];
    goto LABEL_6;
  }
  uint64_t v6 = self->_device;
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C26AD300-9198-11EC-8BC2-0800200C9A66"];
  LODWORD(v6) = [(NRDevice *)v6 supportsCapability:v7];

  if (v6) {
    goto LABEL_4;
  }
  [(HPRFSessionTrackerAppSettingsController *)self _addPreKincaidFooterTextToSpecifier:v10];
LABEL_6:
}

- (void)_addPreKincaidFooterTextToSpecifier:(id)a3
{
  id v28 = a3;
  uint64_t v4 = FIActivityMoveModeWithHealthStore();
  device = self->_device;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6AABB66B-8E1B-4CAB-8FC4-AC577BA0AFB0"];
  unsigned int v7 = [(NRDevice *)device supportsCapability:v6];

  id v8 = FIUIBundle();
  id v9 = [v8 localizedStringForKey:@"POWER_SAVING_MODE_FOOTER" value:&stru_31A20 table:@"Localizable"];

  unsigned int v10 = [(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache isWheelchairUser];
  if (v7)
  {
    unsigned int v11 = FIUIBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"POWER_SAVING_MODE_FOOTER_TRITIUM" value:&stru_31A20 table:@"Localizable-tritium"];

    id v9 = (void *)v12;
  }
  if (v10)
  {
    v13 = FIUIBundle();
    id v14 = [v13 localizedStringForKey:@"POWER_SAVING_MODE_FOOTER_WHEELCHAIR" value:&stru_31A20 table:@"Localizable"];

    if (v7)
    {
      v15 = FIUIBundle();
      v16 = v15;
      CFStringRef v17 = @"POWER_SAVING_MODE_FOOTER_WHEELCHAIR_TRITIUM";
LABEL_9:
      id v9 = [v15 localizedStringForKey:v17 value:&stru_31A20 table:@"Localizable-tritium"];

      goto LABEL_11;
    }
  }
  else
  {
    if (v4 != 2) {
      goto LABEL_11;
    }
    id v18 = FIUIBundle();
    id v14 = [v18 localizedStringForKey:@"POWER_SAVING_MODE_FOOTER_FITNESS_JUNIOR" value:&stru_31A20 table:@"Localizable-tinker"];

    if (v7)
    {
      v15 = FIUIBundle();
      v16 = v15;
      CFStringRef v17 = @"POWER_SAVING_MODE_FOOTER_FITNESS_WORKOUT_TRITIUM";
      goto LABEL_9;
    }
  }
  id v9 = v14;
LABEL_11:
  unsigned __int8 v19 = self->_device;
  id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
  LODWORD(v19) = [(NRDevice *)v19 supportsCapability:v20];

  if (!v19) {
    goto LABEL_22;
  }
  if (v10)
  {
    v21 = FIUIBundle();
    v22 = [v21 localizedStringForKey:@"POWER_SAVING_MODE_FOOTER_WHEELCHAIR_TELEPHONY" value:&stru_31A20 table:@"Localizable-Sashimi"];

    if (v7)
    {
      v23 = FIUIBundle();
      objc_super v24 = v23;
      CFStringRef v25 = @"POWER_SAVING_MODE_FOOTER_WHEELCHAIR_TELEPHONY_TRITIUM";
LABEL_20:
      id v9 = [v23 localizedStringForKey:v25 value:&stru_31A20 table:@"Localizable-tritium"];

      goto LABEL_22;
    }
  }
  else
  {
    CFStringRef v26 = FIUIBundle();
    v27 = v26;
    if (v4 == 2)
    {
      v22 = [v26 localizedStringForKey:@"POWER_SAVING_MODE_FOOTER_FITNESS_JUNIOR_TELEPHONY" value:&stru_31A20 table:@"Localizable-tinker"];

      if (v7)
      {
        v23 = FIUIBundle();
        objc_super v24 = v23;
        CFStringRef v25 = @"POWER_SAVING_MODE_FOOTER_FITNESS_WORKOUT_TELEPHONY_TRITIUM";
        goto LABEL_20;
      }
    }
    else
    {
      v22 = [v26 localizedStringForKey:@"POWER_SAVING_MODE_FOOTER_TELEPHONY" value:&stru_31A20 table:@"Localizable-Sashimi"];

      if (v7)
      {
        v23 = FIUIBundle();
        objc_super v24 = v23;
        CFStringRef v25 = @"POWER_SAVING_MODE_FOOTER_TELEPHONY_TRITIUM";
        goto LABEL_20;
      }
    }
  }
  id v9 = v22;
LABEL_22:
  [v28 setProperty:v9 forKey:PSFooterTextGroupKey];
}

- (void)_showLearnMoreAboutLowPowerMode
{
  id v3 = FIUIBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"WORKOUT_LOW_POWER_MODE_LEARN_MORE_TITLE" value:&stru_31A20 table:@"Localizable-meadow"];

  id v5 = FIUIBundle();
  id v6 = [v5 localizedStringForKey:@"WORKOUT_LOW_POWER_MODE_LEARN_MORE_MESSAGE" value:&stru_31A20 table:@"Localizable-meadow"];

  unsigned int v7 = FIUIBundle();
  id v8 = [v7 localizedStringForKey:@"WORKOUT_LOW_POWER_MODE_LEARN_MORE_BULLETS" value:&stru_31A20 table:@"Localizable-meadow"];

  id v9 = objc_alloc((Class)NSMutableAttributedString);
  unsigned int v10 = [v6 stringByAppendingString:@"\n\n"];
  id v11 = [v9 initWithString:v10];

  uint64_t v12 = +[NSParagraphStyle defaultParagraphStyle];
  id v13 = [v12 mutableCopy];

  [v13 setAlignment:0];
  id v14 = objc_alloc((Class)NSAttributedString);
  v20[0] = NSParagraphStyleAttributeName;
  v20[1] = NSForegroundColorAttributeName;
  v21[0] = v13;
  v15 = +[UIColor lightGrayColor];
  v21[1] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v17 = [v14 initWithString:v8 attributes:v16];

  [v11 appendAttributedString:v17];
  id v18 = [[HPRFSessionTrackerAboutViewController alloc] initWithTitle:v4 message:v11];
  id v19 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v18];
  [v19 setModalPresentationStyle:2];
  [(HPRFSessionTrackerAppSettingsController *)self presentViewController:v19 animated:1 completion:0];
}

- (void)_addLearnMoreExtendedLowPowerModeTextToSpecifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = FIUIBundle();
  id v5 = [v4 localizedStringForKey:@"WORKOUT_ULTRA_MODE_FOOTER" value:&stru_31A20 table:@"Localizable"];

  [v3 setProperty:v5 forKey:PSFooterTextGroupKey];
}

- (void)_addAboutTextToSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v19 = [v5 localizedStringForKey:@"ABOUT_GYMKIT" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  id v6 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v7 = [v6 getActivePairedDevice];

  id v8 = [v7 valueForProperty:NRDevicePropertyGreenTeaDevice];
  unsigned int v9 = [v8 BOOLValue];

  unsigned int v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = v10;
  if (v9) {
    CFStringRef v12 = @"NFC_ENABLED_WITH_NFC_SWITCH_FOOTER";
  }
  else {
    CFStringRef v12 = @"NFC_ENABLED_FOOTER";
  }
  id v13 = [v10 localizedStringForKey:v12 value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  id v14 = +[NSString stringWithFormat:@"%@ %@", v13, v19];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v4 setProperty:v16 forKey:PSFooterCellClassGroupKey];

  [v4 setProperty:v14 forKey:PSFooterHyperlinkViewTitleKey];
  v21.id location = (NSUInteger)[v14 rangeOfString:v19];
  id v17 = NSStringFromRange(v21);
  [v4 setProperty:v17 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v18 = +[NSValue valueWithNonretainedObject:self];
  [v4 setProperty:v18 forKey:PSFooterHyperlinkViewTargetKey];

  [v4 setProperty:@"_openPrivacyLink" forKey:PSFooterHyperlinkViewActionKey];
}

- (void)_openPrivacyLink
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v3 localizedStringForKey:@"ABOUT_GYMKIT_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  id v4 = FIUIBundle();
  id v5 = [v4 localizedStringForKey:@"GYMKIT_CONSENT_DESCRIPTION" value:&stru_31A20 table:@"Localizable"];

  id v6 = [objc_alloc((Class)NSAttributedString) initWithString:v5];
  unsigned int v7 = [[HPRFSessionTrackerAboutViewController alloc] initWithTitle:v9 message:v6];
  id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  [v8 setModalPresentationStyle:2];
  [(HPRFSessionTrackerAppSettingsController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_addGestureLinkToSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"DOUBLE_TAP_TO_SCROLL_WORKOUT_VIEWS_ENABLED_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  unsigned int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"DOUBLE_TAP_TO_SCROLL_WORKOUT_VIEWS_ENABLED_GESTURE_LINK" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  v9.id location = (NSUInteger)[v6 localizedStandardRangeOfString:v8];
  if (v9.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    _HKInitializeLogging();
    unsigned int v10 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_1FCD4(v10);
    }
  }
  else
  {
    id v11 = NSStringFromRange(v9);
    [v4 setProperty:v11 forKey:PSFooterHyperlinkViewLinkRangeKey];
  }
  CFStringRef v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  [v4 setProperty:v13 forKey:PSFooterCellClassGroupKey];

  [v4 setProperty:v6 forKey:PSFooterHyperlinkViewTitleKey];
  id v14 = +[NSValue valueWithNonretainedObject:self];
  [v4 setProperty:v14 forKey:PSFooterHyperlinkViewTargetKey];

  v15 = NSStringFromSelector("_openEltonSetting");
  [v4 setProperty:v15 forKey:PSFooterHyperlinkViewActionKey];
}

- (void)_openEltonSetting
{
  id v3 = [objc_alloc((Class)NSURL) initWithString:@"bridge:root=ELTON_SETTINGS_ID"];
  uint64_t v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (id)selectedPaceViewString:(id)a3
{
  return +[HPRFSessionTrackerPaceSettingViewController selectedPaceViewString];
}

- (id)selectedMusicViewString:(id)a3
{
  selectedAlbumTitle = self->_selectedAlbumTitle;
  if (selectedAlbumTitle)
  {
    id v4 = selectedAlbumTitle;
  }
  else
  {
    id v4 = +[HPRFSessionTrackerMusicViewController selectedMusicViewString];
  }

  return v4;
}

- (void)isSubscribedWithCompletion:(id)a3
{
  id v4 = a3;
  sessionTrackerAppSettingsContext = self->_sessionTrackerAppSettingsContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_106BC;
  v7[3] = &unk_311C8;
  id v8 = v4;
  id v6 = v4;
  [(HPRFSessionTrackerAppSettingsContext *)sessionTrackerAppSettingsContext fetchSubscriptionStatusWithCompletion:v7];
}

- (id)getGuidedWorkoutPrefetchEnabled:(id)a3
{
  uint64_t v3 = FIUIIsGuidedWorkoutPrefetchEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setGuidedWorkoutPrefetchEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _FIUISetGuidedWorkoutPrefetchEnabled(v4);
}

- (id)isGuidedWorkoutMediaMomentsEnabled:(id)a3
{
  uint64_t v3 = FIUIIsGuidedWorkoutMediaMomentsEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (id)getGuidedRunPrefetchEnabled:(id)a3
{
  uint64_t v3 = FIUIIsGuidedRunPrefetchEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setGuidedRunPrefetchEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _FIUISetGuidedRunPrefetchEnabled(v4);
}

- (id)isGuidedRunMediaMomentsEnabled:(id)a3
{
  uint64_t v3 = FIUIIsGuidedRunMediaMomentsEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (id)NFCAlwaysOn:(id)a3
{
  uint64_t v3 = FIUIIsWorkoutNFCAllDayEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setNFCAlwaysOn:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  if ([v5 BOOLValue])
  {
    id v6 = objc_alloc_init((Class)sub_CC18());
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10A48;
    v7[3] = &unk_311F0;
    id v8 = v5;
    NSRange v9 = self;
    [v6 allowEnableExpressGymKitWithVisibleViewController:self completion:v7];
  }
  else
  {
    [v5 BOOLValue];
    FIUISetWorkoutNFCAllDayEnabled();
  }
}

- (id)isStartRemindersEnabled:(id)a3
{
  FIIsActivePairedDeviceSatellitePaired();
  FIActivityMoveModeWithHealthStore();
  uint64_t started = FIIsStartRemindersEnabled();

  return +[NSNumber numberWithBool:started];
}

- (id)isResumeRemindersEnabled:(id)a3
{
  FIIsActivePairedDeviceSatellitePaired();
  FIActivityMoveModeWithHealthStore();
  uint64_t v3 = FIIsResumeRemindersEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (id)isEndRemindersEnabled:(id)a3
{
  FIActivityMoveModeWithHealthStore();
  uint64_t v3 = FIIsEndRemindersEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (id)isConfirmEndWorkoutEnabled
{
  uint64_t v2 = FIUIShouldConfirmEndingWorkout();

  return +[NSNumber numberWithBool:v2];
}

- (id)isAutoPauseEnabled
{
  uint64_t v2 = FIUIIsAutoPauseEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)isRunningAutoPauseEnabled
{
  uint64_t v2 = FIUIIsRunningAutoPauseEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)isCyclingAutoPauseEnabled
{
  uint64_t v2 = FIUIIsCyclingAutoPauseEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)autoPauseItemValue
{
  uint64_t v3 = [(HPRFSessionTrackerAppSettingsController *)self isAutoPauseEnabled];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(HPRFSessionTrackerAppSettingsController *)self isRunningAutoPauseEnabled];
    unsigned int v7 = [v6 BOOLValue];

    if (v7)
    {
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      NSRange v9 = [v8 localizedStringForKey:@"AUTOPAUSE_RUNNING" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      [v5 addObject:v9];
    }
    unsigned int v10 = [(HPRFSessionTrackerAppSettingsController *)self isCyclingAutoPauseEnabled];
    unsigned int v11 = [v10 BOOLValue];

    if (v11)
    {
      CFStringRef v12 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"AUTOPAUSE_CYCLING" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      [v5 addObject:v13];
    }
    id v14 = +[NSListFormatter localizedStringByJoiningStrings:v5];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 propertyForKey:PSKeyNameKey];
  if (v8)
  {
    if (qword_3D080 != -1) {
      dispatch_once(&qword_3D080, &stru_31298);
    }
    unsigned int v9 = [(id)qword_3D088 containsObject:v8];
    if (v6)
    {
      if (v9)
      {
        unsigned int v10 = [v7 propertyForKey:PSValueKey];
        unsigned __int8 v11 = [v6 isEqual:v10];

        if ((v11 & 1) == 0)
        {
          CFStringRef v12 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v6 integerValue]);
          FIActivityAnalyticsSubmission();
        }
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v13 setPreferenceValue:v6 specifier:v7];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPRFSessionTrackerAppSettingsController *)self indexForIndexPath:v6];
  unsigned int v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  unsigned int v10 = [v9 identifier];
  if (([v10 isEqualToString:@"WORKOUT_MUSIC_SHUFFLE_SETTING_ID"] & 1) != 0
    || [v10 isEqualToString:@"WORKOUT_MUSIC_PLAY_FROM_BEGINNING_SETTING_ID"])
  {
    [v10 isEqualToString:@"WORKOUT_MUSIC_SHUFFLE_SETTING_ID"];
    FIUISetMusicPlaybackModeShuffle();
  }
  else if ([v10 isEqualToString:@"EnablePowerSavingMode"])
  {
    FIUISetIsPowerSavingModeEnabled();
  }
  else if ([v10 isEqualToString:@"WorkoutExtendedModeEnabled"])
  {
    FIUISetWorkoutExtendedModeEnabled();
  }
  else if ([v10 isEqualToString:@"kWOLPMNoneKey"])
  {
    FIUIClearWorkoutPowerMode();
  }
  v12.receiver = self;
  v12.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v12 reloadSpecifiers];
  v11.receiver = self;
  v11.super_class = (Class)HPRFSessionTrackerAppSettingsController;
  [(HPRFSessionTrackerAppSettingsController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDeletionManager, 0);
  objc_storeStrong((id *)&self->_configurationDataSourcesModel, 0);
  objc_storeStrong((id *)&self->_sessionTrackerAppSettingsContext, 0);
  objc_storeStrong((id *)&self->_expressGymKitAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_selectedAlbumTitle, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
}

- (void)onMessagesAppInstalled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11240;
  block[3] = &unk_31018;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)onMessagesAppUninstalled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_112BC;
  block[3] = &unk_31018;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)expressGymKitAvailabilityManager:(id)a3 didChangeIsExpressGymKitAllowed:(BOOL)a4
{
}

- (id)isVoiceFeedbackEnabled:(id)a3
{
  uint64_t v3 = FIUIIsWorkoutVoiceFeedbackEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (id)isPrecisionStartEnabled
{
  uint64_t started = FIUIIsPrecisionStartEnabled();

  return +[NSNumber numberWithBool:started];
}

- (id)isWorkoutSafetyCheckInEnabled
{
  uint64_t v2 = FIUIIsWorkoutSafetyCheckInEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)isMirrorModeEnabled
{
  uint64_t v2 = FIMirrorModeEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)shouldAlertOnWatchWhenMirrored
{
  uint64_t v2 = FIAlertOnWatchWhenMirrored();

  return +[NSNumber numberWithBool:v2];
}

- (id)shouldTrackTrainingLoad
{
  uint64_t v2 = FIShouldTrackTrainingLoad();

  return +[NSNumber numberWithBool:v2];
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_device pairingID];
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v14), "bundleIdentifier", (void)v17);
          unsigned int v16 = [v15 isEqualToString:@"com.apple.SessionTrackerApp"];

          if (v16) {
            [(HPRFSessionTrackerAppSettingsController *)self updateWorkoutInstallState:1];
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_device pairingID];
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "isEqualToString:", @"com.apple.SessionTrackerApp", (void)v15))-[HPRFSessionTrackerAppSettingsController updateWorkoutInstallState:](self, "updateWorkoutInstallState:", 0); {
          id v14 = (char *)v14 + 1;
          }
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)updateWorkoutInstallState:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_117A0;
  v3[3] = &unk_31218;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

@end