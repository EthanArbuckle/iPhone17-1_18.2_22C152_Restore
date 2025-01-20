@interface HKBridgeHealthController
- (BOOL)_isTinkerDevice;
- (BOOL)loadingProfileData;
- (BOOL)shouldShowSetupMedicalID;
- (BOOL)suppressSendToNotificationCenterOption;
- (HKBridgeControllerDelegate)secondaryUserDelegate;
- (HKBridgeHealthController)initWithHealthStore:(id)a3;
- (HKBridgeHealthController)initWithHealthStore:(id)a3 activeTinkerDevice:(id)a4;
- (HKCloudSyncObserver)cloudSyncObserver;
- (HKHealthStore)healthStore;
- (HKMedicalIDStore)medicalIDStore;
- (HKSecondaryDevicePairingAgent)secondaryDevicePairingAgent;
- (NRDevice)activeTinkerDevice;
- (NSString)firstName;
- (_HKMedicalIDData)medicalIDData;
- (id)_healthDataGroupSpecifier;
- (id)_healthDataTinkerGroupSpecifier;
- (id)_healthProfileSpecifier;
- (id)_loadingMedicalIDSpecifier;
- (id)_medicalIDSpecifier;
- (id)_setUpMedicalIDSpecifier;
- (id)_stopReceivingSharedHealthDataGroupSpecifier;
- (id)_stoppedReceivingSharedHealthDataSpecifier;
- (id)_viewMedicalIDSpecifier;
- (id)_viewPrimaryDataGroupSpecifier;
- (id)_viewPrimaryDataSpecifier;
- (id)_viewTinkerDataGroupSpecifier;
- (id)_viewTinkerDataSpecifier;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_contactStoreDidChange:(id)a3;
- (void)_dismissMedicalID;
- (void)_dismissMedicalIDEditorWithCompletion:(id)a3;
- (void)_loadProfileData;
- (void)_stopReceivingSharedHealthData;
- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4;
- (void)dealloc;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidDelete:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)openBrowseViewInHealthApp:(id)a3;
- (void)setActiveTinkerDevice:(id)a3;
- (void)setCloudSyncObserver:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setLoadingProfileData:(BOOL)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setMedicalIDStore:(id)a3;
- (void)setSecondaryDevicePairingAgent:(id)a3;
- (void)setSecondaryUserDelegate:(id)a3;
- (void)setShouldShowSetupMedicalID:(BOOL)a3;
- (void)setUpMedicalID:(id)a3;
- (void)showHealthProfileController:(id)a3;
- (void)showMedicalIDController:(id)a3;
- (void)stopReceivingSharedHealthDataButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKBridgeHealthController

- (HKBridgeHealthController)initWithHealthStore:(id)a3 activeTinkerDevice:(id)a4
{
  id v7 = a4;
  v8 = [(HKBridgeHealthController *)self initWithHealthStore:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_activeTinkerDevice, a4);
    id v10 = objc_alloc((Class)HKSecondaryDevicePairingAgent);
    id v11 = objc_alloc_init((Class)HKHealthStore);
    v12 = (HKSecondaryDevicePairingAgent *)[v10 initWithHealthStore:v11];
    secondaryDevicePairingAgent = v9->_secondaryDevicePairingAgent;
    v9->_secondaryDevicePairingAgent = v12;

    v14 = (HKCloudSyncObserver *)[objc_alloc((Class)HKCloudSyncObserver) initWithHealthStore:v9->_healthStore delegate:v9];
    cloudSyncObserver = v9->_cloudSyncObserver;
    v9->_cloudSyncObserver = v14;

    [(HKCloudSyncObserver *)v9->_cloudSyncObserver startObservingSyncStatus];
  }

  return v9;
}

- (HKBridgeHealthController)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKBridgeHealthController;
  v6 = [(HKBridgeHealthController *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = (HKMedicalIDStore *)[objc_alloc((Class)HKMedicalIDStore) initWithHealthStore:v5];
    medicalIDStore = v7->_medicalIDStore;
    v7->_medicalIDStore = v8;
  }
  return v7;
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HEALTH_LABEL" value:&stru_18860 table:@"Localizable"];

  return v3;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HKBridgeHealthController;
  [(HKBridgeHealthController *)&v9 viewDidLoad];
  [(HKBridgeHealthController *)self _loadProfileData];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_contactStoreDidChange:" name:CNContactStoreDidChangeNotification object:0];

  objc_initWeak(&location, self);
  v4 = (const char *)kHKMedicalIDDidChangeNotification;
  id v5 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_99F0;
  v6[3] = &unk_186B8;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v4, &self->_medicalIDChangedToken, (dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_medicalIDChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)HKBridgeHealthController;
  [(HKBridgeHealthController *)&v4 dealloc];
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.Health";
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(HKBridgeHealthController *)self localizedPaneTitle];
    [(HKBridgeHealthController *)self setTitle:v5];

    v6 = +[NSMutableArray array];
    if (!self->_loadingProfileData)
    {
      if ([(HKBridgeHealthController *)self _isTinkerDevice])
      {
        id v7 = [(HKBridgeHealthController *)self _healthDataTinkerGroupSpecifier];
        [v6 addObject:v7];

        v8 = [(HKBridgeHealthController *)self _healthProfileSpecifier];
        [v6 addObject:v8];

        objc_super v9 = [(HKBridgeHealthController *)self _medicalIDSpecifier];
        [v6 addObject:v9];

        id v10 = [(HKBridgeHealthController *)self _viewTinkerDataGroupSpecifier];
        [v6 addObject:v10];

        objc_super v11 = [(HKBridgeHealthController *)self _viewTinkerDataSpecifier];
        [v6 addObject:v11];

        v12 = [(HKBridgeHealthController *)self _stopReceivingSharedHealthDataGroupSpecifier];
        [v6 addObject:v12];

        v13 = [(HKBridgeHealthController *)self _stoppedReceivingSharedHealthDataSpecifier];
        [v6 addObject:v13];
      }
      else
      {
        v14 = [(HKBridgeHealthController *)self _healthDataGroupSpecifier];
        [v6 addObject:v14];

        v15 = [(HKBridgeHealthController *)self _healthProfileSpecifier];
        [v6 addObject:v15];

        v16 = [(HKBridgeHealthController *)self _medicalIDSpecifier];
        [v6 addObject:v16];

        v17 = [(HKBridgeHealthController *)self _viewPrimaryDataGroupSpecifier];
        [v6 addObject:v17];

        v18 = [(HKBridgeHealthController *)self _viewPrimaryDataSpecifier];
        [v6 addObject:v18];

        v28.receiver = self;
        v28.super_class = (Class)HKBridgeHealthController;
        uint64_t v19 = [(HKBridgeHealthController *)&v28 specifiers];
        v20 = (void *)v19;
        v21 = &__NSArray0__struct;
        if (v19) {
          v21 = (void *)v19;
        }
        id v22 = v21;

        v23 = [v22 specifierForID:BPSMirrorGroupID];
        v24 = +[NSBundle bundleForClass:objc_opt_class()];
        v25 = [v24 localizedStringForKey:@"NOTIFICATION_SETTINGS" value:&stru_18860 table:@"Localizable"];
        [v23 setName:v25];

        [v6 addObjectsFromArray:v22];
      }
    }
    v26 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v6;

    objc_super v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
  }

  return v4;
}

- (id)_healthDataGroupSpecifier
{
  v2 = +[PSSpecifier groupSpecifierWithID:@"HealthDataGroupIdentifier"];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"MEDICAL_ID_EXPLANATION" value:&stru_18860 table:@"Localizable"];
  [v2 setObject:v4 forKeyedSubscript:PSFooterTextGroupKey];

  return v2;
}

- (id)_healthDataTinkerGroupSpecifier
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"HealthDataTinkerGroupIdentifier"];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"MEDICAL_ID_EXPLANATION_TINKER_%@" value:&stru_18860 table:@"Localizable-tinker"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, self->_firstName);
  [v3 setObject:v6 forKeyedSubscript:PSFooterTextGroupKey];

  return v3;
}

- (id)_healthProfileSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"HEALTH_DETAILS" value:&stru_18860 table:@"Localizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v5 setControllerLoadAction:"showHealthProfileController:"];
  [v5 setIdentifier:@"HealthProfileIdentifier"];

  return v5;
}

- (id)_setUpMedicalIDSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"SET_UP_MEDICAL_ID" value:&stru_18860 table:@"Localizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:"setUpMedicalID:"];
  [v5 setIdentifier:@"SetUpMedicalIDIdentifier"];

  return v5;
}

- (id)_viewMedicalIDSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"MEDICAL_ID" value:&stru_18860 table:@"Localizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v5 setControllerLoadAction:"showMedicalIDController:"];
  [v5 setIdentifier:@"MedicalIDIdentifier"];

  return v5;
}

- (id)_loadingMedicalIDSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"MEDICAL_ID" value:&stru_18860 table:@"Localizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v5 setIdentifier:@"LoadingMedicalIDIdentifier"];

  return v5;
}

- (id)_medicalIDSpecifier
{
  uint64_t v3 = [(HKCloudSyncObserver *)self->_cloudSyncObserver status];
  objc_super v4 = [v3 lastPullDate];

  if (self->_shouldShowSetupMedicalID && v4 == 0)
  {
    v6 = [(HKBridgeHealthController *)self _loadingMedicalIDSpecifier];
  }
  else
  {
    if (self->_shouldShowSetupMedicalID) {
      [(HKBridgeHealthController *)self _setUpMedicalIDSpecifier];
    }
    else {
    v6 = [(HKBridgeHealthController *)self _viewMedicalIDSpecifier];
    }
  }

  return v6;
}

- (id)_viewTinkerDataGroupSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"HEALTH_DATA_SECTION_TITLE" value:&stru_18860 table:@"Localizable"];
  id v5 = +[PSSpecifier groupSpecifierWithID:@"ViewTinkerDataInHealthAppGroupIdentifier" name:v4];

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"VIEW_TINKER_HEALTH_DATA_IN_HEALTH_DESCRIPTION_%@" value:&stru_18860 table:@"Localizable-tinker"];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, self->_firstName);
  [v5 setObject:v8 forKeyedSubscript:PSFooterTextGroupKey];

  return v5;
}

- (id)_viewTinkerDataSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"VIEW_TINKER_HEALTH_DATA_IN_HEALTH_%@" value:&stru_18860 table:@"Localizable-tinker"];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, self->_firstName);
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setButtonAction:"openBrowseViewInHealthApp:"];
  [v6 setIdentifier:@"ViewTinkerDataInHealthAppIdentifier"];

  return v6;
}

- (id)_stopReceivingSharedHealthDataGroupSpecifier
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"StopReceivingSharedDataGroupIdentifier"];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"STOP_RECEIVING_SHARED_HEALTH_DATA_DESCRIPTION_%@_%@_%@" value:&stru_18860 table:@"Localizable-tinker"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, self->_firstName, self->_firstName, self->_firstName);
  [v3 setObject:v6 forKeyedSubscript:PSFooterTextGroupKey];

  return v3;
}

- (id)_stoppedReceivingSharedHealthDataSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"STOP_RECEIVING_SHARED_HEALTH_DATA_%@" value:&stru_18860 table:@"Localizable-tinker"];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, self->_firstName);
  v6 = +[PSSpecifier deleteButtonSpecifierWithName:v5 target:self action:"stopReceivingSharedHealthDataButton:"];

  [v6 setProperty:&off_19498 forKey:PSAlignmentKey];
  [v6 setIdentifier:@"StopReceivingSharedDataIdentifier"];

  return v6;
}

- (id)_viewPrimaryDataGroupSpecifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"HEALTH_DATA_SECTION_TITLE" value:&stru_18860 table:@"Localizable"];
  objc_super v4 = +[PSSpecifier groupSpecifierWithID:@"ViewDataInHealthAppGroupIdentifier" name:v3];

  return v4;
}

- (id)_viewPrimaryDataSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"VIEW_PRIMARY_HEALTH_DATA_IN_HEALTH" value:&stru_18860 table:@"Localizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:"openBrowseViewInHealthApp:"];
  [v5 setIdentifier:@"ViewDataInHealthAppIdentifier"];

  return v5;
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
}

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  medicalIDData = self->_medicalIDData;
  self->_medicalIDData = 0;
  id v5 = a3;

  self->_shouldShowSetupMedicalID = 1;
  v6 = [(HKBridgeHealthController *)self medicalIDStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_AACC;
  v9[3] = &unk_18568;
  v9[4] = self;
  [v6 deleteMedicalIDDataWithCompletion:v9];

  [(HKBridgeHealthController *)self reloadSpecifiers];
  id v7 = [v5 navigationController];

  id v8 = [v7 popViewControllerAnimated:1];
}

- (void)showHealthProfileController:(id)a3
{
  objc_super v4 = [[HKBridgeHealthProfileController alloc] initWithHealthStore:self->_healthStore activeTinkerDevice:self->_activeTinkerDevice];
  [(HKBridgeHealthController *)self showController:v4 animate:1];
}

- (void)showMedicalIDController:(id)a3
{
  objc_super v4 = +[_HKBehavior sharedBehavior];
  id v5 = [v4 features];
  unsigned int v6 = [v5 medicalIDV2];

  if (v6)
  {
    id v7 = +[MIUIDisplayConfiguration standardConfiguration];
    [v7 setAccessPoint:8];
    [v7 setIsDeletionAvailable:!self->_shouldShowSetupMedicalID];
    id v8 = [objc_alloc((Class)MIUIMedicalIDViewController) initWithHealthStore:self->_healthStore medicalIDData:self->_medicalIDData displayConfiguration:v7];
  }
  else
  {
    id v8 = [objc_alloc((Class)HKMedicalIDViewController) initInEditMode:0 inBuddy:0 organDonationSignupAvailable:0];
    [v8 setHealthStore:self->_healthStore];
    [v8 setMedicalIDStore:self->_medicalIDStore];
    [v8 setMedicalID:self->_medicalIDData];
    [v8 setDelegate:self];
    objc_msgSend(v8, "setIsSecondaryProfileMedicalID:", -[HKBridgeHealthController _isTinkerDevice](self, "_isTinkerDevice"));
    [v8 setShowsDeleteButton:!self->_shouldShowSetupMedicalID];
    [v8 setInBridge:1];
    [v8 setAllowsEditing:1];
  }
  [(HKBridgeHealthController *)self showController:v8 animate:1];
}

- (void)setUpMedicalID:(id)a3
{
  objc_super v4 = +[_HKBehavior sharedBehavior];
  id v5 = [v4 features];
  unsigned int v6 = [v5 medicalIDV2];

  if (v6)
  {
    id v7 = +[MIUIDisplayConfiguration standardConfiguration];
    [v7 setAccessPoint:8];
    [v7 setSuggestHealthData:1];
    [v7 setIsDeletionAvailable:!self->_shouldShowSetupMedicalID];
    id v12 = [objc_alloc((Class)MIUIMedicalIDViewController) initWithHealthStore:self->_healthStore medicalIDData:self->_medicalIDData displayConfiguration:v7];
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissMedicalID"];
    objc_super v9 = [v12 navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  else
  {
    id v12 = [objc_alloc((Class)HKMedicalIDViewController) initInEditMode:1 inBuddy:0 organDonationSignupAvailable:0];
    [v12 setHealthStore:self->_healthStore];
    [v12 setMedicalIDStore:self->_medicalIDStore];
    [v12 setMedicalID:self->_medicalIDData];
    [v12 setDelegate:self];
    objc_msgSend(v12, "setIsSecondaryProfileMedicalID:", -[HKBridgeHealthController _isTinkerDevice](self, "_isTinkerDevice"));
    [v12 setShowsDeleteButton:!self->_shouldShowSetupMedicalID];
    [v12 setInBridge:1];
  }
  id v10 = (HKNavigationController *)[objc_alloc((Class)HKNavigationController) initWithRootViewController:v12];
  [(HKBridgeHealthController *)self presentViewController:v10 animated:1 completion:0];
  medicalIDEditor = self->_medicalIDEditor;
  self->_medicalIDEditor = v10;
}

- (void)_dismissMedicalID
{
}

- (void)openBrowseViewInHealthApp:(id)a3
{
  objc_super v4 = +[_HKBehavior sharedBehavior];
  unsigned int v5 = [v4 healthAppHiddenOrNotInstalled];

  if (v5)
  {
    CFStringRef v6 = @"prefs:root=HEALTH";
LABEL_7:
    id v14 = +[NSURL URLWithString:v6];
    id v12 = +[LSApplicationWorkspace defaultWorkspace];
    [v12 openSensitiveURL:v14 withOptions:&__NSDictionary0__struct];

    return;
  }
  id v7 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  id v8 = (char *)[v7 type];

  if (v8 != (unsigned char *)&dword_0 + 3)
  {
    CFStringRef v6 = @"x-apple-health://browse";
    goto LABEL_7;
  }
  objc_super v9 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  id v10 = +[NSURL _hk_urlForHKProfileIdentifier:v9];

  if (v10)
  {
    objc_super v11 = +[LSApplicationWorkspace defaultWorkspace];
    [v11 openSensitiveURL:v10 withOptions:&__NSDictionary0__struct];
  }
  else
  {
    _HKInitializeLogging();
    v13 = HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_E7B0(v13);
    }
  }
}

- (void)stopReceivingSharedHealthDataButton:(id)a3
{
  id v4 = objc_alloc_init((Class)PSConfirmationSpecifier);
  uint64_t v13 = PSConfirmationTitleKey;
  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v6 = [v5 localizedStringForKey:@"STOP_RECEIVING_SHARED_HEALTH_DATA_CONFIRMATION" value:&stru_18860 table:@"Localizable-tinker"];
  v16[0] = v6;
  uint64_t v14 = PSConfirmationPromptKey;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"STOP_RECEIVING_SHARED_HEALTH_DATA_ALERT_%@" value:&stru_18860 table:@"Localizable-tinker"];
  objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, self->_firstName, v13, v14);
  v16[1] = v9;
  uint64_t v15 = PSConfirmationCancelKey;
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v11 = [v10 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_18860 table:@"Localizable"];
  v16[2] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:&v13 count:3];
  [v4 setupWithDictionary:v12];

  [v4 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v4 setTarget:self];
  [v4 setConfirmationAction:"_stopReceivingSharedHealthData"];
  [(HKBridgeHealthController *)self showConfirmationViewForSpecifier:v4];
}

- (void)_stopReceivingSharedHealthData
{
  self->_isTearingDownSharing = 1;
  uint64_t v3 = [(HKBridgeHealthController *)self table];
  [v3 reloadData];

  secondaryDevicePairingAgent = self->_secondaryDevicePairingAgent;
  unsigned int v5 = [(NRDevice *)self->_activeTinkerDevice pairingID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_B4B8;
  v6[3] = &unk_18568;
  void v6[4] = self;
  [(HKSecondaryDevicePairingAgent *)secondaryDevicePairingAgent tearDownHealthSharingWithTinkerDeviceWithNRUUID:v5 completion:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)HKBridgeHealthController;
  unsigned int v5 = [(HKBridgeHealthController *)&v16 tableView:a3 cellForRowAtIndexPath:a4];
  CFStringRef v6 = [v5 textLabel];
  [v6 setNumberOfLines:0];

  BOOL v7 = !self->_isTearingDownSharing;
  [v5 setUserInteractionEnabled:v7];
  [v5 setCellEnabled:v7];
  id v8 = [v5 specifier];
  objc_super v9 = [v8 identifier];
  unsigned int v10 = [v9 isEqualToString:@"LoadingMedicalIDIdentifier"];

  if (v10)
  {
    [v5 setUserInteractionEnabled:0];
    [v5 setCellEnabled:0];
LABEL_5:
    id v14 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v14 setHidesWhenStopped:1];
    [v5 setAccessoryView:v14];
    [v14 startAnimating];

    goto LABEL_7;
  }
  objc_super v11 = [v5 specifier];
  id v12 = [v11 identifier];
  unsigned int v13 = [v12 isEqualToString:@"StopReceivingSharedDataIdentifier"];

  if (v13 && self->_isTearingDownSharing) {
    goto LABEL_5;
  }
  [v5 setAccessoryView:0];
LABEL_7:

  return v5;
}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B868;
  block[3] = &unk_184F0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_isTinkerDevice
{
  return self->_activeTinkerDevice != 0;
}

- (void)_loadProfileData
{
  if (!self->_loadingProfileData)
  {
    self->_loadingProfileData = 1;
    id v3 = objc_alloc((Class)HKProfileStore);
    id v4 = [(HKBridgeHealthController *)self healthStore];
    id v5 = [v3 initWithHealthStore:v4];

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_B960;
    v6[3] = &unk_18540;
    void v6[4] = self;
    [v5 fetchDisplayName:v6];
  }
}

- (void)_dismissMedicalIDEditorWithCompletion:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(HKBridgeHealthController *)self presentedViewController];
  if (v4)
  {
    id v5 = (void *)v4;
    CFStringRef v6 = [(HKBridgeHealthController *)self presentedViewController];
    medicalIDEditor = self->_medicalIDEditor;

    if (v6 == medicalIDEditor)
    {
      [(HKBridgeHealthController *)self dismissViewControllerAnimated:1 completion:v9];
      id v8 = self->_medicalIDEditor;
      self->_medicalIDEditor = 0;
    }
  }
}

- (void)_contactStoreDidChange:(id)a3
{
  if ([(_HKMedicalIDData *)self->_medicalIDData updateEmergencyContacts])
  {
    [(HKBridgeHealthController *)self reloadSpecifiers];
    medicalIDStore = self->_medicalIDStore;
    medicalIDData = self->_medicalIDData;
    [(HKMedicalIDStore *)medicalIDStore updateMedicalIDData:medicalIDData completion:0];
  }
}

- (HKBridgeControllerDelegate)secondaryUserDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryUserDelegate);

  return (HKBridgeControllerDelegate *)WeakRetained;
}

- (void)setSecondaryUserDelegate:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void)setMedicalIDStore:(id)a3
{
}

- (NRDevice)activeTinkerDevice
{
  return self->_activeTinkerDevice;
}

- (void)setActiveTinkerDevice:(id)a3
{
}

- (HKSecondaryDevicePairingAgent)secondaryDevicePairingAgent
{
  return self->_secondaryDevicePairingAgent;
}

- (void)setSecondaryDevicePairingAgent:(id)a3
{
}

- (HKCloudSyncObserver)cloudSyncObserver
{
  return self->_cloudSyncObserver;
}

- (void)setCloudSyncObserver:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (BOOL)loadingProfileData
{
  return self->_loadingProfileData;
}

- (void)setLoadingProfileData:(BOOL)a3
{
  self->_loadingProfileData = a3;
}

- (BOOL)shouldShowSetupMedicalID
{
  return self->_shouldShowSetupMedicalID;
}

- (void)setShouldShowSetupMedicalID:(BOOL)a3
{
  self->_shouldShowSetupMedicalID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_cloudSyncObserver, 0);
  objc_storeStrong((id *)&self->_secondaryDevicePairingAgent, 0);
  objc_storeStrong((id *)&self->_activeTinkerDevice, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_secondaryUserDelegate);
  objc_storeStrong((id *)&self->_medicalIDEditor, 0);

  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
}

@end