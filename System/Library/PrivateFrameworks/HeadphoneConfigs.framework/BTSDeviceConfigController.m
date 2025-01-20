@interface BTSDeviceConfigController
- (BOOL)BOOLFromBluetoothPreferences:(id)a3;
- (BOOL)adaptiveVolumeSupported;
- (BOOL)canDisconnect;
- (BOOL)canUnpair;
- (BOOL)conversationDetectSupported;
- (BOOL)deviceSupportsCarPlay;
- (BOOL)isCurrentDeviceApplePencil:(int *)a3;
- (BOOL)isWatch;
- (BOOL)isiCloudEnabled;
- (BOOL)isiPad;
- (BOOL)isiPhone;
- (BOOL)managedByDeviceAccess;
- (BOOL)nicknameEnabled;
- (BOOL)shouldForceShowFitTest;
- (BOOL)shouldShowCaseSoundForNewAccessories:(id)a3 productID:(int64_t)a4;
- (BOOL)shouldShowFindMyNetworkAlert;
- (BOOL)shouldShowInternalFitTestToggle;
- (BOOL)shouldShowLoudSoundReduction;
- (BOOL)supportAutoAncStrength;
- (BOOL)supportsFirmwareReleaseNotes;
- (BTSDeviceConfigController)init;
- (CRCarPlayPreferences)carplayPreferences;
- (CRPairedVehicleManager)vehicleManager;
- (HearingModeUIService)hearingModeUIService;
- (NDOACController)ndoController;
- (NSArray)b498Specifiers;
- (NSArray)turnOffListeningModeSpecifiers;
- (PSTableCell)listeningModeCell;
- (PowerUISmartChargeClientAudioAccessories)smartChargeClient;
- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)headphoneObserver;
- (id)_carPlayVehicle;
- (id)adaptiveTransparencySpecifier;
- (id)adaptiveVolumeMode;
- (id)ancsAuthorized;
- (id)automaticAnswerCallsEnabled;
- (id)carPlayEnabled:(id)a3;
- (id)classicSetupSpecifiers;
- (id)clickHoldModeLeft;
- (id)clickHoldModeRight;
- (id)contactSync:(id)a3;
- (id)device;
- (id)deviceName:(id)a3;
- (id)digitalCrownMode;
- (id)doubleTapAction;
- (id)doubleTapActionLeft;
- (id)doubleTapActionRight;
- (id)doubleTapCapability;
- (id)dynamicEnrollmentFeedback;
- (id)extraUnpairWarningMessage;
- (id)forceShowFitTest;
- (id)getANCAssetVersion:(id)a3;
- (id)getAdaptiveVolumeMode:(id)a3;
- (id)getAnswerCallOption:(id)a3;
- (id)getBudFirmwareVersion:(id)a3;
- (id)getBudLeftSerialNumber:(id)a3;
- (id)getBudRightSerialNumber:(id)a3;
- (id)getCaseFirmwareVersion:(id)a3;
- (id)getCaseName:(id)a3;
- (id)getCaseSoundEnabled:(id)a3;
- (id)getConversationDetectMode:(id)a3;
- (id)getEndCallMode;
- (id)getFindMyEnable:(id)a3;
- (id)getHealthDeviceType;
- (id)getHearingProtectionEnabled:(id)a3;
- (id)getModelName:(id)a3;
- (id)getModelNumber:(id)a3;
- (id)getMuteCallMode;
- (id)getSystemSerialNumber:(id)a3;
- (id)inEarDetectEnabled;
- (id)leDevice;
- (id)messagesEnabled:(id)a3;
- (id)micMode;
- (id)optimizedBatteryChargingEnabled;
- (id)sealDetect;
- (id)smartRouteMode;
- (id)smartRoutingIndicationForRealityDevice:(id)a3;
- (id)soundProfileAllowed;
- (id)spatialProfileVideoCapture;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)userSelectedDeviceType;
- (id)userSelectedHealthDataSyncConfig;
- (int)listeningMode;
- (unint64_t)cachedCarplayPairingStatus;
- (void)adaptiveVolumeMode;
- (void)addA2DPDisclosureUISpecifier;
- (void)addAdaptiveVolumeSpecifier;
- (void)addConversationDetectSpecifier;
- (void)addHearingSpecifiers;
- (void)addTopLevelEntryWithHpDevice:(id)a3;
- (void)allowClassicConnection;
- (void)cancelFitTest;
- (void)caseSoundChangedHandler:(id)a3;
- (void)contactGroupSelected:(id)a3;
- (void)cycleBetweenLeftBudValueUpdated:(id)a3;
- (void)cycleBetweenRightBudValueUpdated:(id)a3;
- (void)cycleBetweenV2LeftBudValueUpdated:(id)a3;
- (void)cycleBetweenV2RightBudValueUpdated:(id)a3;
- (void)dealloc;
- (void)deviceAccessDeviceLost:(id)a3;
- (void)deviceConnectedHandler:(id)a3;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)deviceRemoved:(id)a3;
- (void)deviceSupportsMAP:(id)a3;
- (void)deviceSupportsSync:(id)a3;
- (void)deviceUpdated:(id)a3;
- (void)disconnectDevice:(id)a3;
- (void)dismissCurrentViewController;
- (void)doubleTapActionLeft;
- (void)doubleTapActionRight;
- (void)findMyStatusUpdatedHandler:(id)a3;
- (void)forgetDevice;
- (void)forgetDeviceTapped:(id)a3;
- (void)getFindMyUrl;
- (void)getSoundMode;
- (void)handleCarPlayAllowedDidChange;
- (void)handlePairedVehiclesChanged:(id)a3;
- (void)handleTapOnLabel;
- (void)hearingModeUpdated;
- (void)initializeCaseConnection;
- (void)listeningModeConfigSelected:(id)a3;
- (void)listeningModeUpdatedHandler:(id)a3;
- (void)listeningModeUpdatedV2Handler:(id)a3;
- (void)loadAccessoryFirmwareInfo;
- (void)loadAccessoryInfo;
- (void)loadAccessorySettings;
- (void)loadSyncSettings;
- (void)metaGroupSelected:(id)a3;
- (void)nicknameEnabled;
- (void)optimizedBatteryChargingEnabled;
- (void)presentAssetLocationLink;
- (void)presentEnrollmentViewController;
- (void)presentFindMyLink;
- (void)presentFitTestController:(id)a3;
- (void)presentImportantMsgLink;
- (void)presentSpatialTutorialController:(id)a3;
- (void)presentTuningViewController;
- (void)presentViewController:(id)a3;
- (void)pressAndHoldModeSelectedHandler:(id)a3;
- (void)refreshFindMyStatus;
- (void)refreshFindMyStatusForPencilInBackground;
- (void)refreshFindMyStatusForPencilSynchronously;
- (void)releaseCaseConnection;
- (void)removeTopLevelEntryWithHpDevice:(id)a3;
- (void)sealDetect;
- (void)sealDetectSet:(id)a3;
- (void)sendSmartRoutingDisabledTipEvent;
- (void)setANCSAuthorized:(id)a3;
- (void)setAdaptiveVolumeMode:(id)a3;
- (void)setAdaptiveVolumeMode:(id)a3 specifier:(id)a4;
- (void)setAutomaticAnswerCallsEnabled:(id)a3;
- (void)setCachedCarplayPairingStatus:(unint64_t)a3;
- (void)setCarPlayEnabled:(id)a3 specifier:(id)a4;
- (void)setCarplayPreferences:(id)a3;
- (void)setCaseSoundEnabled:(id)a3 specifier:(id)a4;
- (void)setContactSync:(id)a3 specifier:(id)a4;
- (void)setConversationDetectMode:(id)a3 specifier:(id)a4;
- (void)setDeviceName:(id)a3 specifier:(id)a4;
- (void)setDigitalCrownMode:(id)a3;
- (void)setDynamicEnrollmentFeedback:(id)a3;
- (void)setEndCallMode:(id)a3;
- (void)setFindMyEnable:(id)a3 specifier:(id)a4;
- (void)setForceShowFitTest:(id)a3;
- (void)setGestureMode:(id)a3 specifier:(id)a4;
- (void)setHeadphoneObserver:(id)a3;
- (void)setHearingModeUIService:(id)a3;
- (void)setHearingProtectionEnabled:(id)a3 specifier:(id)a4;
- (void)setInEarDetectEnabled:(id)a3;
- (void)setListeningModeCell:(id)a3;
- (void)setMessagesEnabled:(id)a3 specifier:(id)a4;
- (void)setMicMode:(id)a3;
- (void)setMuteCallMode:(id)a3;
- (void)setNdoController:(id)a3;
- (void)setOptimizedBatteryChargingEnabled:(id)a3;
- (void)setSmartChargeClient:(id)a3;
- (void)setSmartRouteMode:(id)a3;
- (void)setSoundProfileAllowed:(id)a3;
- (void)setSpatialProfileVideoCapture:(id)a3;
- (void)setUserSelectedDeviceType:(id)a3;
- (void)setUserSelectedHealthDataSyncConfig:(id)a3;
- (void)setVehicleManager:(id)a3;
- (void)setdoubleTapAction:(id)a3;
- (void)setdoubleTapActionLeft:(id)a3;
- (void)setdoubleTapActionRight:(id)a3;
- (void)settingsChangedHandler:(id)a3;
- (void)showFindMyNetworkAlert;
- (void)spatialAudioProfileUpdateHandler:(id)a3;
- (void)spatialProfileTappedHandler:(id)a3;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)triggerSpatialProfileFeedback:(id)a3;
- (void)updateASKHeader;
- (void)updateBatteryStatus;
- (void)updateDisconnectButton:(BOOL)a3;
- (void)updateHearingProtectionSpecifiers;
- (void)updateSerialNumberSpecifier:(id)a3;
- (void)updateTopLevelEntryWithHpDevice:(id)a3;
- (void)updateVersionSpecifier:(id)a3;
- (void)upgradeDevice:(id)a3;
- (void)userDidTapNiPrivacyLink:(id)a3;
- (void)userDidTapRecommendedBuilds:(id)a3;
- (void)userDidTapSpatialA2DPLatencyDisclosure:(id)a3;
- (void)userDidTapSpatialProfileLearnMoreLink:(id)a3;
- (void)userDidTapSpatialProfileWarningLearnMoreLink:(id)a3;
- (void)userDidTapWalletLink:(id)a3;
- (void)userDidTapWatchLink:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BTSDeviceConfigController

- (BTSDeviceConfigController)init
{
  v37.receiver = self;
  v37.super_class = (Class)BTSDeviceConfigController;
  v2 = [(BTSDeviceConfigController *)&v37 init];
  if (v2)
  {
    v3 = +[HPSHeadphoneManager sharedInstance];
    [v3 addDelegate:v2];

    *((unsigned char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F00]) = 0;
    *(_DWORD *)&v2->_syncSettings.supported = 0;
    v2->_syncSettings.userPermissionGranted = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_deviceRemoved_ name:*MEMORY[0x1E4F50B38] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_deviceUpdated_ name:*MEMORY[0x1E4F50B40] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_deviceConnectedHandler_ name:*MEMORY[0x1E4F50B08] object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel_deviceConnectedHandler_ name:*MEMORY[0x1E4F50B00] object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_deviceSupportsSync_ name:*MEMORY[0x1E4F50B28] object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_deviceSupportsMAP_ name:*MEMORY[0x1E4F50B30] object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x1E4F50B18] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x1E4F50B10] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v2 selector:sel_settingsChangedHandler_ name:*MEMORY[0x1E4F50AE0] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_deviceAccessDeviceLost_ name:@"DADeviceLost" object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v2 selector:sel_listeningModeUpdatedHandler_ name:@"BTAccessorySetListeningModeUpdated" object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel_listeningModeUpdatedV2Handler_ name:@"HPSSetListeningModeUpdated" object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v2 selector:sel_pressAndHoldModeSelectedHandler_ name:@"BTAccessoryPressAndHoldModeSelected" object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel_cycleBetweenLeftBudValueUpdated_ name:@"CycleBetweenLeftBudValue" object:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel_cycleBetweenRightBudValueUpdated_ name:@"CycleBetweenRightBudValue" object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v2 selector:sel_cycleBetweenV2LeftBudValueUpdated_ name:@"CycleBetweenV2LeftBudValue" object:0];

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v2 selector:sel_cycleBetweenV2RightBudValueUpdated_ name:@"CycleBetweenV2RightBudValue" object:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v2 selector:sel_spatialProfileTappedHandler_ name:@"HPSSpatialAudioProfileTapped" object:0];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v2 selector:sel_deviceUpdated_ name:@"BluetoothDeviceUpdatedNotificationConfig" object:0];

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v2 selector:sel_triggerSpatialProfileFeedback_ name:@"SpatialProfileEnrollmentNotCompleted" object:0];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v2 selector:sel_caseSoundChangedHandler_ name:@"BTNotificationForSpeakerSettingChange" object:0];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v2 selector:sel_updateHearingProtectionSpecifiers name:@"HPSSoundProtectionUpdated" object:0];

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v2 selector:sel_hearingModeUpdated name:@"HearingModeUpdated" object:0];

    v2->_listeningModeConfigs = 0;
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v2 selector:sel_findMyStatusUpdatedHandler_ name:@"FindMyStatusUpdated" object:0];

    v2->_findMySupport = 0;
    v2->_findMyEnable = 0;
    v2->_findMySetInProgress = 0;
    batteryStatusView = v2->_batteryStatusView;
    v2->_batteryStatusView = 0;

    findMyUrl = v2->_findMyUrl;
    v2->_findMyUrl = 0;

    v2->_enteredFromTopLevelEntry = 0;
    v2->_caseSoundRetrieved = 0;
    v2->_caseSoundRetrieveInProgress = 0;
    v2->_caseSoundEnable = 1;
    v2->_caseSilentMode = 0;
    v2->_caseSoundSupport = 0;
    v2->_setCaseSoundModeInProgress = 0;
    airPodsServiceclient = v2->_airPodsServiceclient;
    v2->_airPodsServiceclient = 0;

    v31 = objc_alloc_init(HPSDeviceAnalytics);
    deviceAnalytics = v2->_deviceAnalytics;
    v2->_deviceAnalytics = v31;

    v2->_adaptiveTransparencyRetrieved = 0;
    v2->_adaptiveTransparencyIndex = 0;
    hearingModeUIService = v2->_hearingModeUIService;
    v2->_hearingModeUIService = 0;

    uint64_t v34 = [objc_alloc(NSNumber) initWithInt:50];
    adaptiveStrength = v2->_adaptiveStrength;
    v2->_adaptiveStrength = (NSNumber *)v34;

    v2->_findMyEnabledForPencil = 0;
    v2->_didFetchFindMyStatusForPencil = 0;
  }
  return v2;
}

- (void)dealloc
{
  ctkdLeDevice = self->_ctkdLeDevice;
  self->_ctkdLeDevice = 0;

  airPodsServiceclient = self->_airPodsServiceclient;
  self->_airPodsServiceclient = 0;

  v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 removeObserver:self];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7 = [(BTSDeviceConfigController *)self carplayPreferences];
  [v7 setPreferencesDelegate:0];

  v8.receiver = self;
  v8.super_class = (Class)BTSDeviceConfigController;
  [(BTSDeviceConfigController *)&v8 dealloc];
}

- (BOOL)canUnpair
{
  return ([(BluetoothDeviceProtocol *)self->_device cloudPaired] & 1) == 0
      && !self->_isWatch
      && !self->_isManagedByWallet
      && !self->_isManagedByAliroWallet;
}

- (BOOL)canDisconnect
{
  v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  BOOL v4 = v3
    && [(BluetoothDeviceProtocol *)self->_device connected]
    && ([(BluetoothDeviceProtocol *)self->_device cloudPaired] & 1) == 0
    && !self->_isWatch
    && !self->_isManagedByWallet
    && !self->_isManagedByAliroWallet;

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)BTSDeviceConfigController;
  [(BTSDeviceConfigController *)&v6 viewDidLoad];
  if (_os_feature_enabled_impl())
  {
    v3 = [(BTSDeviceConfigController *)self ndoController];
    [v3 setParentViewController:self];

    BOOL v4 = [(BTSDeviceConfigController *)self ndoController];
    [v4 updateSpecifiersWithCompletionHandler:&__block_literal_global_1];
  }
  int v5 = 0;
  if ([(BTSDeviceConfigController *)self isCurrentDeviceApplePencil:&v5] && v5 == 2) {
    [(BTSDeviceConfigController *)self refreshFindMyStatusForPencilInBackground];
  }
  if ([(BTSDeviceConfigController *)self managedByDeviceAccess]) {
    [(BTSDeviceConfigController *)self setTitle:0];
  }
  [(BTSDeviceConfigController *)self updateASKHeader];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BTSDeviceConfigController;
  [(BTSDeviceConfigController *)&v7 viewWillAppear:a3];
  [(BTSDeviceConfigController *)self reloadSpecifiers];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_enteredFromTopLevelEntry = 1;
    BOOL v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Top Level Entry", v6, 2u);
    }
    uint64_t v5 = 0;
  }
  else
  {
    BOOL v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Info Button", v6, 2u);
    }
    uint64_t v5 = 1;
  }

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateEntryPoint:v5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BTSDeviceConfigController;
  [(BTSDeviceConfigController *)&v11 viewDidDisappear:a3];
  if (self->_enteredFromTopLevelEntry)
  {
    BOOL v4 = [MEMORY[0x1E4F50B70] sharedInstance];
    int v5 = [v4 devicePairingEnabled];

    if (v5)
    {
      objc_super v6 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disable Pairing if enabled when leaving TLE", v10, 2u);
      }

      objc_super v7 = [MEMORY[0x1E4F50B70] sharedInstance];
      [v7 setDevicePairingEnabled:0];
    }
  }
  objc_super v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Case Sound: viewDidDisappear, releasing case connection", v10, 2u);
  }

  [(BTSDeviceConfigController *)self releaseCaseConnection];
  [(HPSDeviceAnalytics *)self->_deviceAnalytics submitDeviceAnalytics];
  [(ModernBatteryStatusView *)self->_batteryStatusView cleanUp];
  batteryStatusView = self->_batteryStatusView;
  self->_batteryStatusView = 0;
}

- (void)updateDisconnectButton:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NSArray *)self->_controlGroupSpecifiers objectAtIndex:1];
  uint64_t v6 = [(BTSDeviceConfigController *)self specifierForID:@"disconnect"];
  objc_super v7 = (void *)v6;
  if (v3)
  {
    if (!v6) {
      [(BTSDeviceConfigController *)self insertSpecifier:v5 atIndex:1];
    }
  }
  else if (v6)
  {
    [(BTSDeviceConfigController *)self removeSpecifier:v5];
  }
  if (_os_feature_enabled_impl())
  {
    objc_super v8 = [(NSArray *)self->_controlGroupSpecifiers objectAtIndex:3];
    v9 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    int v10 = [v9 isGuestPairingMode];

    if (v3)
    {
      if (v10)
      {
        objc_super v11 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Inserting Upgrade Button", buf, 2u);
        }

        [(BTSDeviceConfigController *)self insertSpecifier:v8 atIndex:2];
      }
    }
    else if (v10)
    {
      v12 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Removing Upgrade Button", v14, 2u);
      }

      [(BTSDeviceConfigController *)self removeSpecifier:v8];
    }
  }
  v13 = [(BTSDeviceConfigController *)self headphoneObserver];
  [v13 reloadAll];
}

- (void)forgetDeviceTapped:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    if ([(BTSDeviceConfigController *)self managedByDeviceAccess])
    {
      uint64_t v6 = [MEMORY[0x1E4F17518] forgetDeviceAlertTitle];
    }
    else
    {
      int v10 = NSString;
      objc_super v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"FORGET_ALERT_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];
      v13 = [(BluetoothDeviceProtocol *)self->_device name];
      uint64_t v6 = objc_msgSend(v10, "stringWithFormat:", v12, v13);
    }
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"FORGET_DEVICE" value:&stru_1F4097960 table:@"DeviceConfig"];

    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_1F4097960 table:@"DeviceConfig"];

    v18 = 0;
LABEL_19:
    uint64_t v26 = 1;
    goto LABEL_28;
  }
  objc_super v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  BOOL v9 = [(BTSDeviceConfigController *)self managedByDeviceAccess];
  if (v8 == 6)
  {
    if (v9)
    {
      uint64_t v6 = [MEMORY[0x1E4F17518] forgetDeviceAlertTitle];
    }
    else
    {
      v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v6 = [v19 localizedStringForKey:@"FORGET_SHEET_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];
    }
    if ([(BTSDeviceConfigController *)self managedByDeviceAccess])
    {
      v18 = [MEMORY[0x1E4F17518] forgetDeviceAlertBody];
    }
    else
    {
      v20 = NSString;
      v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"FORGET_ALERT_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];
      v23 = [(BluetoothDeviceProtocol *)self->_device name];
      v18 = objc_msgSend(v20, "stringWithFormat:", v22, v23);
    }
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v24 localizedStringForKey:@"FORGET_DEVICE" value:&stru_1F4097960 table:@"DeviceConfig"];

    v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v25 localizedStringForKey:@"CANCEL" value:&stru_1F4097960 table:@"DeviceConfig"];

    goto LABEL_19;
  }
  if (v9)
  {
    uint64_t v6 = [MEMORY[0x1E4F17518] forgetDeviceAlertTitle];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([(BTSDeviceConfigController *)self managedByDeviceAccess])
  {
    v18 = [MEMORY[0x1E4F17518] forgetDeviceAlertBody];
  }
  else
  {
    v18 = 0;
  }
  if ([(BTSDeviceConfigController *)self managedByDeviceAccess])
  {
    v15 = [MEMORY[0x1E4F17518] forgetDeviceAlertConfirm];
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v27 localizedStringForKey:@"FORGET_DEVICE" value:&stru_1F4097960 table:@"DeviceConfig"];
  }
  if ([(BTSDeviceConfigController *)self managedByDeviceAccess])
  {
    v17 = [MEMORY[0x1E4F17518] forgetDeviceAlertCancel];
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v28 localizedStringForKey:@"CANCEL" value:&stru_1F4097960 table:@"DeviceConfig"];
  }
  uint64_t v26 = 0;
LABEL_28:
  v29 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v18 preferredStyle:v26];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __48__BTSDeviceConfigController_forgetDeviceTapped___block_invoke;
  v32[3] = &unk_1E6EA83E0;
  v32[4] = self;
  v30 = [MEMORY[0x1E4FB1410] actionWithTitle:v15 style:2 handler:v32];
  v31 = [MEMORY[0x1E4FB1410] actionWithTitle:v17 style:0 handler:0];
  [v29 addAction:v30];
  [v29 addAction:v31];
  [(BTSDeviceConfigController *)self presentViewController:v29 animated:1 completion:0];
}

uint64_t __48__BTSDeviceConfigController_forgetDeviceTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) forgetDevice];
}

- (void)forgetDevice
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Unpairing DADevice failed: %@", v2, v3, v4, v5, v6);
}

void __41__BTSDeviceConfigController_forgetDevice__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F50B70] sharedInstance];
  char v3 = [v2 devicePairingEnabled];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F50B70] sharedInstance];
    [v4 setDevicePairingEnabled:1];

    do
    {
      uint64_t v5 = [MEMORY[0x1E4F50B70] sharedInstance];
      int v6 = [v5 devicePairingEnabled];
    }
    while (!v6);
    objc_super v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Pairing Disabled somehow, Enabled again", buf, 2u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 1384) unpair];
  int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1568);
  BOOL v9 = sharedBluetoothSettingsLogComponent();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Unpair from TLE", v25, 2u);
    }

    if ([*(id *)(a1 + 32) isiPad]) {
      goto LABEL_12;
    }
    objc_super v11 = [*(id *)(a1 + 32) view];
    [v11 size];
    double v13 = v12;
    v14 = [*(id *)(a1 + 32) view];
    [v14 size];
    double v16 = v15;

    if (v13 > v16)
    {
LABEL_12:
      v17 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Unpairing from TLE with side by side layout, jump to General", v24, 2u);
      }

      v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v19 = (void *)MEMORY[0x1E4F1CB10];
      v20 = @"prefs:root=General";
    }
    else
    {
      v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v19 = (void *)MEMORY[0x1E4F1CB10];
      v20 = @"prefs:root=ROOT";
    }
    v22 = [v19 URLWithString:v20];
    [v18 openSensitiveURL:v22 withOptions:0];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Unpair from Regular", v23, 2u);
    }

    v18 = [*(id *)(a1 + 32) navigationController];
    id v21 = (id)[v18 popViewControllerAnimated:1];
  }
}

- (BOOL)isiCloudEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  char v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isCurrentDeviceApplePencil:(int *)a3
{
  BOOL v4 = [(BTSDeviceConfigController *)self leDevice];
  uint64_t v5 = v4;
  if (v4) {
    char v6 = [v4 isApplePencil:a3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)extraUnpairWarningMessage
{
  char v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v4 = [v3 magicPaired];

  if (v4)
  {
    uint64_t v5 = NSString;
    char v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v7 = [v6 localizedStringForKey:@"FORGET_MAGIC_PAIRED_DEVICE_WARNING" value:&stru_1F4097960 table:@"DeviceConfig"];
    int v8 = [(BluetoothDeviceProtocol *)self->_device name];
    BOOL v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);
  }
  else
  {
    int v12 = 0;
    BOOL v9 = 0;
    if ([(BTSDeviceConfigController *)self isCurrentDeviceApplePencil:&v12] && v12 == 2)
    {
      if (!self->_didFetchFindMyStatusForPencil) {
        [(BTSDeviceConfigController *)self refreshFindMyStatusForPencilSynchronously];
      }
      if (self->_findMyEnabledForPencil)
      {
        BOOL v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        BOOL v9 = [v10 localizedStringForKey:@"FORGET_FINDMY_PAIRED_PENCIL_WARNING" value:&stru_1F4097960 table:@"DeviceConfig-B532"];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }

  return v9;
}

- (void)disconnectDevice:(id)a3
{
  if ([(BTSDeviceConfigController *)self canDisconnect])
  {
    [(BluetoothDeviceProtocol *)self->_device disconnect];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:18];
    [(BTSDeviceConfigController *)self updateDisconnectButton:0];
    [(BTSDeviceConfigController *)self dismissCurrentViewController];
  }
}

- (void)upgradeDevice:(id)a3
{
  int v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  char v5 = [v4 isGuestPairingMode];

  if ((v5 & 1) == 0)
  {
    objc_super v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      int v8 = "Guest Pairing: Cannot Upgrade, Device is Guest Paired";
      BOOL v9 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
LABEL_11:

    return;
  }
  if (![(BTSDeviceConfigController *)self canDisconnect])
  {
    objc_super v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      int v8 = "Guest Pairing: Cannot Upgrade, Device is not connected";
      BOOL v9 = (uint8_t *)&v10;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  char v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v6 setGuestPairingMode:0];

  [(BTSDeviceConfigController *)self dismissCurrentViewController];
}

- (void)dismissCurrentViewController
{
  BOOL enteredFromTopLevelEntry = self->_enteredFromTopLevelEntry;
  int v4 = sharedBluetoothSettingsLogComponent();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!enteredFromTopLevelEntry)
  {
    if (v5)
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disconnect from Regular", v19, 2u);
    }

    double v16 = [(BTSDeviceConfigController *)self navigationController];
    id v18 = (id)[v16 popViewControllerAnimated:1];
    goto LABEL_12;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disconnect from TLE", buf, 2u);
  }

  char v6 = [(BTSDeviceConfigController *)self parentViewController];
  objc_super v7 = [v6 navigationController];
  id v8 = (id)[v7 popViewControllerAnimated:1];

  if ([(BTSDeviceConfigController *)self isiPad]) {
    goto LABEL_6;
  }
  BOOL v9 = [(BTSDeviceConfigController *)self view];
  [v9 size];
  double v11 = v10;
  int v12 = [(BTSDeviceConfigController *)self view];
  [v12 size];
  double v14 = v13;

  if (v11 > v14)
  {
LABEL_6:
    double v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disconnecting from TLE with side by side layout, jump to General", v20, 2u);
    }

    double v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v17 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General"];
    [v16 openSensitiveURL:v17 withOptions:0];

LABEL_12:
  }
}

- (BOOL)isiPhone
{
  id v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

- (BOOL)isiPad
{
  id v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (BOOL)isWatch
{
  id v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"Watch"];

  return v3;
}

- (id)leDevice
{
  char v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  BOOL v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    id v8 = self->_device;
  }
  else
  {
    uint64_t v9 = (int)*MEMORY[0x1E4F92FA0];
    double v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + v9) userInfo];
    double v11 = [v10 objectForKeyedSubscript:@"ctkd-device"];

    int v12 = [*(id *)((char *)&self->super.super.super.super.super.isa + v9) userInfo];
    double v13 = v12;
    if (v11) {
      double v14 = @"ctkd-device";
    }
    else {
      double v14 = @"linked-le-device";
    }
    id v8 = [v12 objectForKeyedSubscript:v14];
  }

  return v8;
}

- (BOOL)managedByDeviceAccess
{
  id v2 = [(BTSDeviceConfigController *)self leDevice];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 isManagedByDeviceAccess];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)deviceConnectedHandler:(id)a3
{
  id v7 = [a3 object];
  char v4 = [v7 address];
  BOOL v5 = [(BluetoothDeviceProtocol *)self->_device identifier];
  if ([v4 isEqualToString:v5])
  {
    BOOL dismissed = self->_dismissed;

    if (dismissed) {
      goto LABEL_8;
    }
    char v4 = [(NSArray *)self->_controlGroupSpecifiers objectAtIndex:2];
    if ([(BTSDeviceConfigController *)self canUnpair])
    {
      [v4 setProperty:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F93130]];
      [(BTSDeviceConfigController *)self reloadSpecifier:v4];
    }
    self->_devicePendingCTKDConnection = 0;
    [(BTSDeviceConfigController *)self removeSpecifierID:@"CLASSIC_SETUP_TITLE_ID"];
    [(BTSDeviceConfigController *)self removeSpecifierID:@"CLASSIC_SETUP_BODY_ID"];
    [(BTSDeviceConfigController *)self removeSpecifierID:@"CLASSIC_SETUP_BUTTON_ID"];
    [(BTSDeviceConfigController *)self updateDisconnectButton:[(BTSDeviceConfigController *)self canDisconnect]];
  }
  else
  {
  }
LABEL_8:
}

- (void)deviceDisconnectedHandler:(id)a3
{
  char v4 = [a3 object];
  BOOL v5 = [v4 address];
  char v6 = [(BluetoothDeviceProtocol *)self->_device identifier];
  if ([v5 isEqualToString:v6])
  {
    BOOL dismissed = self->_dismissed;

    if (!dismissed) {
      [(BTSDeviceConfigController *)self updateDisconnectButton:[(BTSDeviceConfigController *)self canDisconnect]];
    }
  }
  else
  {
  }
  id v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Case Sound: device disconnected, releasing case connection", v9, 2u);
  }

  [(BTSDeviceConfigController *)self releaseCaseConnection];
}

- (void)caseSoundChangedHandler:(id)a3
{
  char v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Case Sound: caseSoundChangedHandler, BTNotificationForSpeakerSettingChange", v5, 2u);
  }

  [(BTSDeviceConfigController *)self getSoundMode];
}

- (void)deviceSupportsSync:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 object];
  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v5 name];
    double v10 = [v6 name];
    int v15 = 138412802;
    double v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "%@ received %@ for device %@", (uint8_t *)&v15, 0x20u);
  }
  if (!self->_syncSettings.supported)
  {
    double v11 = [v6 address];
    int v12 = [(BluetoothDeviceProtocol *)self->_device identifier];
    if ([v11 isEqualToString:v12])
    {
      BOOL dismissed = self->_dismissed;

      if (!dismissed)
      {
        [(BTSDeviceConfigController *)self loadSyncSettings];
        if (!self->_syncSettings.supported) {
          -[BTSDeviceConfigController deviceSupportsSync:]();
        }
        if (self->_supportsMAP) {
          double v14 = @"MAP_SWITCH";
        }
        else {
          double v14 = @"FORGET_BUTTON";
        }
        [(BTSDeviceConfigController *)self insertContiguousSpecifiers:self->_syncContactsSpecifiers afterSpecifierID:v14 animated:1];
        if (self->_syncSettings.enabled) {
          [(BTSDeviceConfigController *)self insertContiguousSpecifiers:self->_syncGroupsSpecifiers afterSpecifierID:@"SYNC_SWITCH" animated:1];
        }
      }
    }
    else
    {
    }
  }
}

- (void)deviceSupportsMAP:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 object];
  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v5 name];
    double v10 = [v6 name];
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "%@ received %@ for device %@", (uint8_t *)&v17, 0x20u);
  }
  if (!self->_supportsMAP)
  {
    double v11 = [v6 address];
    int v12 = [(BluetoothDeviceProtocol *)self->_device identifier];
    if ([v11 isEqualToString:v12])
    {
      BOOL dismissed = self->_dismissed;

      if (!dismissed)
      {
        self->_supportsMAP = 1;
        double v14 = [v6 getServiceSetting:512 key:@"BT_KEY_MAP_ENABLED"];
        self->_BOOL messagingEnabled = [v14 isEqualToString:@"BT_VALUE_MAP_ENABLED"];

        int v15 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          BOOL messagingEnabled = self->_messagingEnabled;
          int v17 = 67109120;
          LODWORD(v18) = messagingEnabled;
          _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "After calling getServiceSetting, MAP messaging is set to: %d", (uint8_t *)&v17, 8u);
        }

        [(BTSDeviceConfigController *)self insertContiguousSpecifiers:self->_messagingSpecifiers afterSpecifierID:@"FORGET_BUTTON" animated:1];
      }
    }
    else
    {
    }
  }
}

- (void)deviceUpdated:(id)a3
{
  id v14 = [a3 object];
  char v4 = [v14 address];
  id v5 = [(BluetoothDeviceProtocol *)self->_device identifier];
  if ([v4 isEqualToString:v5])
  {
    BOOL dismissed = self->_dismissed;

    if (dismissed) {
      goto LABEL_10;
    }
    char v4 = [v14 productName];
    if ([(BTSDeviceConfigController *)self nicknameEnabled])
    {
      uint64_t v7 = [v14 name];

      char v4 = (void *)v7;
    }
    uint64_t v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      double v10 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      int v11 = [v10 magicPaired];

      if (v11)
      {
        uint64_t v12 = [v14 name];

        char v4 = (void *)v12;
      }
    }
    [(BTSDeviceConfigController *)self setTitle:v4];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v13 = [v5 localizedStringForKey:@"DEVICE_NAME_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];
    [(BTSDeviceConfigController *)self reloadSpecifierID:v13];
  }
LABEL_10:
}

- (void)listeningModeUpdatedHandler:(id)a3
{
  if (self->_deviceAnalytics)
  {
    id v9 = [a3 userInfo];
    char v4 = [v9 objectForKey:@"ListeningModes"];

    if (v4)
    {
      id v5 = [v9 objectForKeyedSubscript:@"ListeningModes"];
      uint64_t v6 = [v5 unsignedIntValue];

      [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:31 value:v6 featureValueString:0];
      [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:30];
    }
    else
    {
      uint64_t v7 = [v9 objectForKeyedSubscript:@"ListeningModesValueOnly"];
      uint64_t v8 = [v7 unsignedIntValue];

      [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:31 value:v8 featureValueString:0];
    }
  }
}

- (void)listeningModeUpdatedV2Handler:(id)a3
{
  if (self->_deviceAnalytics)
  {
    id v9 = [a3 userInfo];
    char v4 = [v9 objectForKey:@"ListeningModesV2"];

    if (v4)
    {
      id v5 = [v9 objectForKeyedSubscript:@"ListeningModesV2"];
      uint64_t v6 = [v5 unsignedIntValue];

      [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:33 value:v6 featureValueString:0];
      [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:32];
    }
    else
    {
      uint64_t v7 = [v9 objectForKeyedSubscript:@"ListeningModesV2ValueOnly"];
      uint64_t v8 = [v7 unsignedIntValue];

      [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:33 value:v8 featureValueString:0];
    }
  }
}

- (void)pressAndHoldModeSelectedHandler:(id)a3
{
  if (self->_deviceAnalytics)
  {
    id v8 = [a3 userInfo];
    char v4 = [v8 objectForKeyedSubscript:@"pressHoldRightBudValue"];
    uint64_t v5 = [v4 unsignedIntValue];

    uint64_t v6 = [v8 objectForKeyedSubscript:@"pressHoldLeftBudValue"];
    uint64_t v7 = [v6 unsignedIntValue];

    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:44 value:v5 featureValueString:0];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:43 value:v7 featureValueString:0];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:42];
  }
}

- (void)cycleBetweenLeftBudValueUpdated:(id)a3
{
  if (self->_deviceAnalytics)
  {
    id v5 = [a3 userInfo];
    char v4 = [v5 objectForKeyedSubscript:@"cycleBetweenLeftBudValue"];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:9 value:0 featureValueString:v4];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:9];
  }
}

- (void)cycleBetweenRightBudValueUpdated:(id)a3
{
  if (self->_deviceAnalytics)
  {
    id v5 = [a3 userInfo];
    char v4 = [v5 objectForKeyedSubscript:@"cycleBetweenRightBudValue"];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:11 value:0 featureValueString:v4];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:11];
  }
}

- (void)cycleBetweenV2LeftBudValueUpdated:(id)a3
{
  if (self->_deviceAnalytics)
  {
    id v5 = [a3 userInfo];
    char v4 = [v5 objectForKeyedSubscript:@"cycleBetweenV2LeftBudValue"];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:13 value:0 featureValueString:v4];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:12];
  }
}

- (void)cycleBetweenV2RightBudValueUpdated:(id)a3
{
  if (self->_deviceAnalytics)
  {
    id v5 = [a3 userInfo];
    char v4 = [v5 objectForKeyedSubscript:@"cycleBetweenV2RightBudValue"];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:15 value:0 featureValueString:v4];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:14];
  }
}

- (void)spatialProfileTappedHandler:(id)a3
{
  deviceAnalytics = self->_deviceAnalytics;
  if (deviceAnalytics) {
    [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:50];
  }
}

- (void)settingsChangedHandler:(id)a3
{
  char v4 = [a3 object];
  id v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
  uint64_t v6 = +[HPSDevice deviceKey];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v7 headphoneDevice];

  id v9 = [v4 address];
  double v10 = [(BluetoothDeviceProtocol *)self->_device identifier];
  if ([v9 isEqualToString:v10] && !self->_dismissed)
  {

    if (v8)
    {
      int v11 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Headphone Configs: settingsChangedHandler reload!", v12, 2u);
      }

      [(BTSDeviceConfigController *)self reloadSpecifierID:@"LISTENING_MODE_ID"];
      [(BTSDeviceConfigController *)self reloadSpecifierID:@"SPEECH_DETECTION_ID"];
      [(BTSDeviceConfigController *)self reloadSpecifierID:@"ADAPTIVE_VOLUME_ID"];
    }
  }
  else
  {
  }
}

- (void)deviceRemoved:(id)a3
{
  char v4 = [a3 object];
  id v5 = [v4 address];
  uint64_t v6 = [(BluetoothDeviceProtocol *)self->_device identifier];
  if ([v5 isEqualToString:v6])
  {
    BOOL dismissed = self->_dismissed;

    if (!dismissed)
    {
      self->_BOOL dismissed = 1;
      BOOL enteredFromTopLevelEntry = self->_enteredFromTopLevelEntry;
      id v9 = sharedBluetoothSettingsLogComponent();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (enteredFromTopLevelEntry)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Removed while entered from TLE", buf, 2u);
        }

        if ([(BTSDeviceConfigController *)self isiPad]) {
          goto LABEL_8;
        }
        int v11 = [(BTSDeviceConfigController *)self view];
        [v11 size];
        double v13 = v12;
        id v14 = [(BTSDeviceConfigController *)self view];
        [v14 size];
        double v16 = v15;

        if (v13 > v16)
        {
LABEL_8:
          int v17 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Removed from TLE with side by side layout, jump to General", v24, 2u);
          }

          id v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          __int16 v19 = (void *)MEMORY[0x1E4F1CB10];
          v20 = @"prefs:root=General";
        }
        else
        {
          id v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          __int16 v19 = (void *)MEMORY[0x1E4F1CB10];
          v20 = @"prefs:root=ROOT";
        }
        v22 = [v19 URLWithString:v20];
        [v18 openSensitiveURL:v22 withOptions:0];
      }
      else
      {
        if (v10)
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Removed from Regular", v23, 2u);
        }

        id v18 = [(BTSDeviceConfigController *)self navigationController];
        id v21 = (id)[v18 popViewControllerAnimated:1];
      }
    }
  }
  else
  {
  }
}

- (void)deviceAccessDeviceLost:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_dismissed && [(BTSDeviceConfigController *)self managedByDeviceAccess])
  {
    id v5 = [(BTSDeviceConfigController *)self leDevice];
    if (v5)
    {
      uint64_t v6 = [v4 object];
      uint64_t v7 = [v5 underlyingDADevice];
      id v8 = [v7 identifier];
      int v9 = [v8 isEqualToString:v6];

      if (v9)
      {
        BOOL v10 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = [v5 underlyingDADevice];
          int v14 = 138412290;
          double v15 = v11;
          _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Headphone Configs: DADevice Lost, popping to previous page. %@", (uint8_t *)&v14, 0xCu);
        }
        self->_BOOL dismissed = 1;
        double v12 = [(BTSDeviceConfigController *)self navigationController];
        id v13 = (id)[v12 popViewControllerAnimated:1];
      }
    }
  }
}

- (void)allowClassicConnection
{
  char v3 = [(BTSDeviceConfigController *)self leDevice];
  if (v3)
  {
    id v7 = v3;
    [v3 setDenyIncomingClassicConnection:0];
    [(BluetoothDeviceProtocol *)self->_device connect];
    self->_devicePendingCTKDConnection = 1;
    id v4 = [(BTSDeviceConfigController *)self specifierForID:@"CLASSIC_SETUP_BUTTON_ID"];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"CLASSIC_SETUP_BUTTON_CONNECTING" value:&stru_1F4097960 table:@"DeviceConfig"];
    [v4 setName:v6];

    [v4 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    [(BTSDeviceConfigController *)self reloadSpecifierID:@"CLASSIC_SETUP_BUTTON_ID"];

    char v3 = v7;
  }
}

- (id)messagesEnabled:(id)a3
{
  return (id)[NSNumber numberWithBool:self->_messagingEnabled];
}

- (void)setMessagesEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_messagingEnabled != [v5 BOOLValue])
  {
    self->_BOOL messagingEnabled = [v5 BOOLValue];
    uint64_t v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL messagingEnabled = self->_messagingEnabled;
      int v14 = 67109120;
      LODWORD(v15) = messagingEnabled;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "User wants MAP set to: %d", (uint8_t *)&v14, 8u);
    }

    id v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    int v9 = v8;
    if (self->_messagingEnabled) {
      BOOL v10 = @"BT_VALUE_MAP_ENABLED";
    }
    else {
      BOOL v10 = @"BT_VALUE_MAP_DISABLED";
    }
    [v8 setServiceSetting:512 key:@"BT_KEY_MAP_ENABLED" value:v10];

    int v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      id v13 = [v12 getServiceSetting:512 key:@"BT_KEY_MAP_ENABLED"];
      int v14 = 138412290;
      double v15 = v13;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "After setting MAP, result is: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)contactSync:(id)a3
{
  return (id)[NSNumber numberWithBool:self->_syncSettings.enabled];
}

- (void)setContactSync:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  if (self->_syncSettings.enabled != [v7 BOOLValue])
  {
    self->_syncSettings.enabled = [v7 BOOLValue];
    self->_syncSettings.userPermissionGranted = 1;
    id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    [v5 setSyncSettings:*(unsigned int *)&self->_syncSettings.supported | ((unint64_t)self->_syncSettings.userPermissionGranted << 32)];

    syncGroupsSpecifiers = self->_syncGroupsSpecifiers;
    if (self->_syncSettings.enabled) {
      [(BTSDeviceConfigController *)self insertContiguousSpecifiers:syncGroupsSpecifiers afterSpecifierID:@"SYNC_SWITCH" animated:1];
    }
    else {
      [(BTSDeviceConfigController *)self removeContiguousSpecifiers:syncGroupsSpecifiers animated:1];
    }
  }
}

- (id)userSelectedDeviceType
{
  id v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unsigned int v3 = [v2 getUserSelectedDeviceType];

  if (v3 <= 5)
  {
    id v4 = [NSNumber numberWithInt:dword_1E4CC46E8[v3]];
  }

  return v4;
}

- (void)setUserSelectedDeviceType:(id)a3
{
  id v4 = a3;
  switch([v4 intValue])
  {
    case 1u:
      id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      uint64_t v6 = v5;
      uint64_t v7 = 1;
      goto LABEL_7;
    case 2u:
      id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      uint64_t v6 = v5;
      uint64_t v7 = 2;
      goto LABEL_7;
    case 3u:
      id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      uint64_t v6 = v5;
      uint64_t v7 = 3;
      goto LABEL_7;
    case 4u:
      id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      uint64_t v6 = v5;
      uint64_t v7 = 4;
      goto LABEL_7;
    case 5u:
      id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      uint64_t v6 = v5;
      uint64_t v7 = 5;
LABEL_7:
      char v8 = [v5 setUserSelectedDeviceType:v7];

      if ((v8 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_11;
    default:
LABEL_8:
      int v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BTSDeviceConfigController setUserSelectedDeviceType:](v4);
      }

LABEL_11:
      return;
  }
}

- (id)automaticAnswerCallsEnabled
{
  unsigned int v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v4 = [v3 autoAnswerMode];

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:35 value:v4 featureValueString:0];
  id v5 = [NSNumber numberWithBool:v4 == 1];

  return v5;
}

- (void)setAutomaticAnswerCallsEnabled:(id)a3
{
  deviceAnalytics = self->_deviceAnalytics;
  id v5 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:34];
  uint64_t v6 = [v5 BOOLValue];

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:35 value:v6 featureValueString:0];
  uint64_t v7 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  id v9 = v7;
  if (v6) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v7 setAutoAnswerMode:v8];
}

- (id)doubleTapAction
{
  id v2 = NSNumber;
  unsigned int v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "doubleTapAction"));

  return v4;
}

- (void)setdoubleTapAction:(id)a3
{
  deviceAnalytics = self->_deviceAnalytics;
  id v5 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:19];
  id v7 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v6 = [v5 intValue];

  [v7 setDoubleTapAction:v6];
}

- (id)doubleTapActionLeft
{
  int v7 = 1;
  unsigned int v8 = 1;
  unsigned int v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v3 doubleTapActionEx:&v8 rightAction:&v7];

  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BTSDeviceConfigController doubleTapActionLeft](&v8);
  }

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:20 value:v8 featureValueString:0];
  id v5 = [NSNumber numberWithInteger:v8];

  return v5;
}

- (void)setdoubleTapActionLeft:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = [v4 intValue];
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Set Double tap action left : %d", (uint8_t *)v9, 8u);
  }

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:19];
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 20, [v4 intValue], 0);
  uint64_t v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v7 = [v4 intValue];
  unsigned int v8 = [(BTSDeviceConfigController *)self doubleTapActionRight];
  objc_msgSend(v6, "setDoubleTapActionEx:rightAction:", v7, objc_msgSend(v8, "intValue"));
}

- (id)doubleTapActionRight
{
  unsigned int v7 = 1;
  int v8 = 1;
  unsigned int v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v3 doubleTapActionEx:&v8 rightAction:&v7];

  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BTSDeviceConfigController doubleTapActionRight](&v7);
  }

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:21 value:v7 featureValueString:0];
  id v5 = [NSNumber numberWithInteger:v7];

  return v5;
}

- (void)setdoubleTapActionRight:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = [v4 intValue];
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Set Double tap action right : %d", (uint8_t *)v8, 8u);
  }

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:19];
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 21, [v4 intValue], 0);
  uint64_t v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unsigned int v7 = [(BTSDeviceConfigController *)self doubleTapActionLeft];
  objc_msgSend(v6, "setDoubleTapActionEx:rightAction:", objc_msgSend(v7, "intValue"), objc_msgSend(v4, "intValue"));
}

- (id)inEarDetectEnabled
{
  deviceAnalytics = self->_deviceAnalytics;
  id v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  if ([v4 inEarDetectEnabled]) {
    id v5 = @"On";
  }
  else {
    id v5 = @"Off";
  }
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureValue:29 value:0 featureValueString:v5];

  uint64_t v6 = NSNumber;
  unsigned int v7 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "inEarDetectEnabled"));

  return v8;
}

- (void)setInEarDetectEnabled:(id)a3
{
  deviceAnalytics = self->_deviceAnalytics;
  id v5 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:28];
  uint64_t v6 = [v5 BOOLValue];

  if (v6) {
    unsigned int v7 = @"On";
  }
  else {
    unsigned int v7 = @"Off";
  }
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:29 value:0 featureValueString:v7];
  id v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v8 setInEarDetectEnabled:v6];
}

- (void)setSoundProfileAllowed:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v5 setDeviceSoundProfileAllowed:v4];
}

- (id)soundProfileAllowed
{
  id v2 = NSNumber;
  unsigned int v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "getDeviceSoundProfileAllowed"));

  return v4;
}

- (id)getEndCallMode
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unint64_t v4 = [v3 getCallManagementConfig];
  uint64_t v5 = HIDWORD(v4) & 0xFFFFFF;

  int v6 = v4;
  if (v4 == 1)
  {
    int v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = BYTE3(v4);
      int v19 = 67110144;
      int v20 = 1;
      LODWORD(v4) = BYTE4(v4);
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 1024;
      int v24 = v5;
      __int16 v25 = 1024;
      int v26 = BYTE5(v4);
      __int16 v27 = 1024;
      int v28 = BYTE6(v4);
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Call Controls: getEndCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)&v19, 0x20u);
    }
    else
    {
      LODWORD(v4) = BYTE4(v4);
    }

    if (v4 != 4 && v4 >= 2) {
      unsigned __int8 v14 = v5;
    }
    else {
      unsigned __int8 v14 = 2;
    }
  }
  else if ((_BYTE)v4)
  {
    id v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109120;
      int v20 = v6;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "Call Controls: getEndCallMode invalid version: %u", (uint8_t *)&v19, 8u);
    }

    unsigned __int8 v14 = 0;
  }
  else
  {
    unint64_t v7 = v4 >> 16;
    id v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = BYTE1(v4);
      unsigned int v10 = BYTE2(v4);
      int v19 = 67109632;
      int v20 = 0;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 1024;
      int v24 = v7;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "End Call: Get Config, version: %u, Status: %d, Mode: %d", (uint8_t *)&v19, 0x14u);
    }
    else
    {
      unsigned int v10 = BYTE2(v4);
    }

    if (v10 != 4 && v10 >= 2) {
      unsigned __int8 v14 = v7;
    }
    else {
      unsigned __int8 v14 = 2;
    }
  }
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:24 value:v5 featureValueString:0];
  int v17 = [NSNumber numberWithInt:v14];

  return v17;
}

- (void)setEndCallMode:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:23];
  uint64_t v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unint64_t v6 = [v5 getCallManagementConfig];

  int v7 = v6;
  if (v6 == 1)
  {
    LOBYTE(v8) = [v4 intValue];
    if (v8 == 3) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = BYTE6(v6);
    }
    if (v8 == 2) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = v12;
    }
    unsigned __int8 v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67110144;
      int v18 = 1;
      __int16 v19 = 1024;
      unsigned int v20 = BYTE3(v6);
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 1024;
      int v24 = BYTE5(v6);
      __int16 v25 = 1024;
      int v26 = v13;
      _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "Call Controls: setEndCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)&v17, 0x20u);
    }

    double v15 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    [v15 setCallConfig:v6 & 0xFF0000000000 | (v13 << 48) | ((unint64_t)v8 << 32) | v6];

    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:39 value:v13 featureValueString:0];
  }
  else
  {
    uint64_t v8 = HIDWORD(v6) & 0xFFFFFF;
    if ((_BYTE)v6)
    {
      uint64_t v16 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 67109120;
        int v18 = v7;
        _os_log_impl(&dword_1E4BFE000, v16, OS_LOG_TYPE_DEFAULT, "Call Controls: setEndCallMode invalid version: %u", (uint8_t *)&v17, 8u);
      }
    }
    else
    {
      int v9 = [v4 intValue];
      unsigned int v10 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 67109632;
        int v18 = 0;
        __int16 v19 = 1024;
        unsigned int v20 = BYTE1(v6);
        __int16 v21 = 1024;
        int v22 = v9;
        _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "End Call: Set Config, version: %u, Status: %d, Mode: %d", (uint8_t *)&v17, 0x14u);
      }

      int v11 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      [v11 setCallConfig:v6 & 0xFFFFFFFF00FFFFLL | (v9 << 16)];
    }
  }
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:24 value:v8 featureValueString:0];
}

- (id)getMuteCallMode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v4 = [v3 getCallManagementConfig];

  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67110144;
    v12[1] = v4;
    __int16 v13 = 1024;
    int v14 = BYTE3(v4);
    __int16 v15 = 1024;
    int v16 = BYTE4(v4);
    __int16 v17 = 1024;
    int v18 = BYTE5(v4);
    __int16 v19 = 1024;
    int v20 = BYTE6(v4);
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Call Controls: getMuteCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)v12, 0x20u);
  }

  BOOL v7 = (BYTE6(v4) == 4 || BYTE6(v4) < 2u) && v4 == 1;
  deviceAnalytics = self->_deviceAnalytics;
  if (v7) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = BYTE6(v4);
  }
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureValue:39 value:v9 featureValueString:0];
  unsigned int v10 = [NSNumber numberWithInt:v9];

  return v10;
}

- (void)setMuteCallMode:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  deviceAnalytics = self->_deviceAnalytics;
  id v5 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:38];
  unint64_t v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unint64_t v7 = [v6 getCallManagementConfig];

  unsigned __int8 v8 = [v5 intValue];
  if (v7 == 1)
  {
    uint64_t v9 = HIDWORD(v7) & 0xFFFFFF;
    if (v8 == 3) {
      LOBYTE(v9) = 2;
    }
    if (v8 == 2) {
      unsigned __int8 v10 = 3;
    }
    else {
      unsigned __int8 v10 = v9;
    }
    int v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67110144;
      uint64_t v12 = v10;
      v14[1] = 1;
      __int16 v15 = 1024;
      int v16 = BYTE3(v7);
      __int16 v17 = 1024;
      int v18 = v10;
      __int16 v19 = 1024;
      int v20 = BYTE5(v7);
      __int16 v21 = 1024;
      int v22 = v8;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Call Controls: setMuteCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)v14, 0x20u);
    }
    else
    {
      uint64_t v12 = v10;
    }

    __int16 v13 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    [v13 setCallConfig:v7 & 0xFF0000000000 | ((unint64_t)v8 << 48) | ((unint64_t)v10 << 32) | v7];

    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:24 value:v12 featureValueString:0];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:39 value:v8 featureValueString:0];
  }
}

- (id)micMode
{
  deviceAnalytics = self->_deviceAnalytics;
  uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 37, [v4 micMode], 0);

  id v5 = NSNumber;
  unint64_t v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unint64_t v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "micMode"));

  return v7;
}

- (void)setMicMode:(id)a3
{
  deviceAnalytics = self->_deviceAnalytics;
  id v5 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:36];
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 37, [v5 intValue], 0);
  id v7 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v6 = [v5 intValue];

  [v7 setMicMode:v6];
}

- (id)smartRouteMode
{
  deviceAnalytics = self->_deviceAnalytics;
  uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 49, [v4 smartRouteMode], 0);

  id v5 = NSNumber;
  uint64_t v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  id v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "smartRouteMode"));

  return v7;
}

- (void)setSmartRouteMode:(id)a3
{
  deviceAnalytics = self->_deviceAnalytics;
  id v5 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:48];
  uint64_t v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  objc_msgSend(v6, "setSmartRouteMode:", objc_msgSend(v5, "intValue"));

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 49, [v5 intValue], 0);
  LODWORD(v6) = [v5 intValue];

  if (v6 == 2)
  {
    [(BTSDeviceConfigController *)self sendSmartRoutingDisabledTipEvent];
  }
}

- (void)sendSmartRoutingDisabledTipEvent
{
  id v7 = [MEMORY[0x1E4F504C8] discoverabilitySignal];
  id v2 = [v7 source];
  id v3 = objc_alloc(MEMORY[0x1E4F50318]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundleIdentifier];
  uint64_t v6 = (void *)[v3 initWithIdentifier:@"com.apple.bluetooth.smartrouting" bundleID:v5 context:@"off"];

  [v2 sendEvent:v6];
}

- (id)doubleTapCapability
{
  id v2 = NSNumber;
  id v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "doubleTapCapability"));

  return v4;
}

- (void)setDeviceName:(id)a3 specifier:(id)a4
{
}

- (id)deviceName:(id)a3
{
  return (id)[(BluetoothDeviceProtocol *)self->_device name];
}

- (id)clickHoldModeLeft
{
  uint64_t v5 = 0;
  id v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v2 clickHoldMode:(char *)&v5 + 4 rightAction:&v5];

  id v3 = [NSNumber numberWithInt:HIDWORD(v5)];

  return v3;
}

- (id)clickHoldModeRight
{
  uint64_t v5 = 0;
  id v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v2 clickHoldMode:(char *)&v5 + 4 rightAction:&v5];

  id v3 = [NSNumber numberWithInt:v5];

  return v3;
}

- (void)setGestureMode:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:42];
  uint64_t v19 = 0;
  p_device = &self->_device;
  uint64_t v9 = [(BluetoothDeviceProtocol *)*p_device classicDevice];
  [v9 clickHoldMode:(char *)&v19 + 4 rightAction:&v19];

  unsigned __int8 v10 = [v7 identifier];
  int v11 = [v10 isEqualToString:@"LEFT_ID"];

  if (v11)
  {
    uint64_t v12 = [(BluetoothDeviceProtocol *)*p_device classicDevice];
    uint64_t v13 = [v6 intValue];
    uint64_t v14 = v19;
    __int16 v15 = v12;
LABEL_5:
    [v15 setClickHoldMode:v13 rightMode:v14];
    goto LABEL_8;
  }
  int v16 = [v7 identifier];
  int v17 = [v16 isEqualToString:@"RIGHT_ID"];

  if (v17)
  {
    uint64_t v12 = [(BluetoothDeviceProtocol *)*p_device classicDevice];
    uint64_t v18 = HIDWORD(v19);
    uint64_t v14 = [v6 intValue];
    __int16 v15 = v12;
    uint64_t v13 = v18;
    goto LABEL_5;
  }
  uint64_t v12 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[BTSDeviceConfigController setGestureMode:specifier:]((id *)p_device);
  }
LABEL_8:
}

- (int)listeningMode
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "listeningMode : getter", v4, 2u);
  }

  return 0;
}

- (id)optimizedBatteryChargingEnabled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  smartChargeClient = self->_smartChargeClient;
  if (!smartChargeClient)
  {
    unsigned __int8 v10 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BTSDeviceConfigController optimizedBatteryChargingEnabled]();
    }

    goto LABEL_9;
  }
  uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v5 = [v4 address];
  id v16 = 0;
  uint64_t v6 = [(PowerUISmartChargeClientAudioAccessories *)smartChargeClient isSmartChargingCurrentlyEnabledForDevice:v5 withError:&v16];
  id v7 = v16;

  unsigned __int8 v8 = sharedBluetoothSettingsLogComponent();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BTSDeviceConfigController optimizedBatteryChargingEnabled]();
    }

LABEL_9:
    BOOL v11 = 0;
    p_deviceAnalytics = &self->_deviceAnalytics;
    uint64_t v13 = @"Off";
    goto LABEL_15;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "OBC state : %lu", buf, 0xCu);
  }

  BOOL v11 = v6 == 1;
  p_deviceAnalytics = &self->_deviceAnalytics;
  if (v6 == 1) {
    uint64_t v13 = @"On";
  }
  else {
    uint64_t v13 = @"Off";
  }
LABEL_15:
  [(HPSDeviceAnalytics *)*p_deviceAnalytics updateFeatureValue:41 value:0 featureValueString:v13];
  uint64_t v14 = [NSNumber numberWithBool:v11];

  return v14;
}

- (void)setOptimizedBatteryChargingEnabled:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_smartChargeClient)
  {
    int v4 = [a3 BOOLValue];
    uint64_t v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = v4;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "set OBC state : %d", buf, 8u);
    }

    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:40];
    if (v4) {
      uint64_t v6 = @"On";
    }
    else {
      uint64_t v6 = @"Off";
    }
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:41 value:0 featureValueString:v6];
    if (v4)
    {
      smartChargeClient = self->_smartChargeClient;
      unsigned __int8 v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      uint64_t v9 = [v8 address];
      id v29 = 0;
      [(PowerUISmartChargeClientAudioAccessories *)smartChargeClient enableSmartChargingForDevice:v9 withError:&v29];
      unsigned __int8 v10 = v29;
    }
    else
    {
      BOOL v11 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"OBC_ALERT_MESSAGE" value:&stru_1F4097960 table:@"DeviceConfig"];
      unsigned __int8 v10 = [v11 alertControllerWithTitle:0 message:v13 preferredStyle:1];

      uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
      __int16 v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v16 = [v15 localizedStringForKey:@"OBC_TURN_OFF" value:&stru_1F4097960 table:@"DeviceConfig"];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke;
      v28[3] = &unk_1E6EA83E0;
      v28[4] = self;
      int v17 = [v14 actionWithTitle:v16 style:0 handler:v28];

      uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v20 = [v19 localizedStringForKey:@"OBC_LEAVE_ON" value:&stru_1F4097960 table:@"DeviceConfig"];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_767;
      v27[3] = &unk_1E6EA83E0;
      v27[4] = self;
      __int16 v21 = [v18 actionWithTitle:v20 style:0 handler:v27];

      int v22 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v24 = [v23 localizedStringForKey:@"OBC_TEMP_DISABLE" value:&stru_1F4097960 table:@"DeviceConfig"];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_771;
      v26[3] = &unk_1E6EA83E0;
      v26[4] = self;
      __int16 v25 = [v22 actionWithTitle:v24 style:0 handler:v26];

      [v10 addAction:v25];
      [v10 addAction:v17];
      [v10 addAction:v21];
      [v10 setPreferredAction:v25];
      [(BTSDeviceConfigController *)self presentViewController:v10 animated:1 completion:0];
    }
  }
  else
  {
    unsigned __int8 v10 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BTSDeviceConfigController setOptimizedBatteryChargingEnabled:]();
    }
  }
}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "User disabled smart charging", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 1656);
  uint64_t v5 = [*(id *)(v3 + 1384) classicDevice];
  uint64_t v6 = [v5 address];
  id v14 = 0;
  int v7 = [v4 disableSmartChargingForDevice:v6 withError:&v14];
  id v8 = v14;

  uint64_t v9 = sharedBluetoothSettingsLogComponent();
  unsigned __int8 v10 = v9;
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Smart charging disabled", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_cold_1();
  }

  uint64_t v12 = [*(id *)(a1 + 32) headphoneObserver];
  [v12 reloadAll];
}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_767(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "User left smart charging on", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) headphoneObserver];
  [v3 reloadAll];
}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_771(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "User temporarily disabled smart charging", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 1656);
  uint64_t v5 = [*(id *)(v3 + 1384) classicDevice];
  uint64_t v6 = [v5 address];
  id v15 = 0;
  int v7 = [v4 temporarilyDisableSmartChargingForDevice:v6 withError:&v15];
  id v8 = v15;

  uint64_t v9 = [*(id *)(a1 + 32) headphoneObserver];
  [v9 reloadAll];

  unsigned __int8 v10 = sharedBluetoothSettingsLogComponent();
  BOOL v11 = v10;
  if (v7) {
    BOOL v12 = v8 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Smart charging temporarily disabled", v14, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_771_cold_1();
  }

  uint64_t v13 = [*(id *)(a1 + 32) headphoneObserver];
  [v13 reloadAll];
}

- (id)sealDetect
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[BTSDeviceConfigController sealDetect]();
  }

  return 0;
}

- (void)sealDetectSet:(id)a3
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[BTSDeviceConfigController sealDetectSet:]();
  }
}

- (void)presentFitTestController:(id)a3
{
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:22];
  uint64_t v13 = objc_alloc_init(BTSFitTestWelcomeController);
  int v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
  uint64_t v5 = +[HPSDevice deviceKey];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  [(BTSFitTestWelcomeController *)v13 setCurrentDevice:v6];

  int v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelFitTest];
  id v8 = [(BTSFitTestWelcomeController *)v13 navigationItem];
  [v8 setLeftBarButtonItem:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F83AC0]) initWithRootViewController:v13];
  unsigned __int8 v10 = [v9 navigationBar];
  BOOL v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v10 setBackgroundColor:v11];

  BOOL v12 = [v9 navigationBar];
  [v12 _setHidesShadow:1];

  [v9 setModalPresentationStyle:2];
  [(BTSDeviceConfigController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)cancelFitTest
{
}

- (void)presentImportantMsgLink
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "URL string is malformed", v2, v3, v4, v5, v6);
}

- (void)presentAssetLocationLink
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Accessory Firmware: URL string is malformed", v2, v3, v4, v5, v6);
}

- (void)presentFindMyLink
{
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:54];
  if (!self->_findMyUrl) {
    [(BTSDeviceConfigController *)self getFindMyUrl];
  }
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:self->_findMyUrl];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v4 openURL:v3 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
  else
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BTSDeviceConfigController presentImportantMsgLink]();
    }
  }
}

- (void)presentSpatialTutorialController:(id)a3
{
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:51];
  int v45 = 3;
  int v46 = 3;
  uint64_t v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
  uint64_t v5 = +[HPSDevice deviceKey];
  uint8_t v6 = [v4 objectForKeyedSubscript:v5];

  int v7 = [v6 classicDevice];
  [v7 inEarStatusPrimary:&v46 secondary:&v45];

  int v9 = v45;
  int v8 = v46;
  unsigned __int8 v10 = [v6 classicDevice];
  if ([v10 productId] == 8215)
  {

LABEL_22:
    id v15 = [[BTSpatialTutorialViewController alloc] initWithDevice:v6];
    [(BTSDeviceConfigController *)self presentViewController:v15 animated:1 completion:0];
    goto LABEL_23;
  }
  int v11 = v8 | v9;
  BOOL v12 = [v6 classicDevice];
  int v13 = [v12 productId];

  if (!v11 || v13 == 8229) {
    goto LABEL_22;
  }
  id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING" value:&stru_1F4097960 table:@"DeviceConfig"];

  id v16 = [v6 classicDevice];
  int v17 = [v16 getAACPCapabilityBit:32];

  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"SPATIAL_TUTORIAL_NOT_ON_HEAD_WARNING" value:&stru_1F4097960 table:@"DeviceConfig-b515"];

    id v15 = (BTSpatialTutorialViewController *)v19;
  }
  int v20 = [v6 classicDevice];
  if ([v20 getAACPCapabilityBit:10])
  {
    __int16 v21 = [v6 classicDevice];
    int v22 = [v21 productId];

    if (v22 != 8210) {
      goto LABEL_11;
    }
    int v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v23 = [v20 localizedStringForKey:@"SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING" value:&stru_1F4097960 table:@"DeviceConfig-B494"];

    id v15 = (BTSpatialTutorialViewController *)v23;
  }

LABEL_11:
  int v24 = [v6 classicDevice];
  if (![v24 getAACPCapabilityBit:10])
  {
LABEL_14:

    goto LABEL_15;
  }
  __int16 v25 = [v6 classicDevice];
  int v26 = [v25 productId];

  if (v26 == 8221)
  {
    int v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v27 = [v24 localizedStringForKey:@"SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING" value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];

    id v15 = (BTSpatialTutorialViewController *)v27;
    goto LABEL_14;
  }
LABEL_15:
  int v28 = [v6 classicDevice];
  int v29 = [v28 productId];

  if (v29 == 8211)
  {
    v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v31 = [v30 localizedStringForKey:@"SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING" value:&stru_1F4097960 table:@"DeviceConfig-B688"];

    id v15 = (BTSpatialTutorialViewController *)v31;
  }
  uint64_t v32 = [v6 classicDevice];
  int v33 = [v32 productId];

  if (v33 == 8212)
  {
    uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v35 = [v34 localizedStringForKey:@"SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING" value:&stru_1F4097960 table:@"DeviceConfig-B698"];

    id v15 = (BTSpatialTutorialViewController *)v35;
  }
  v36 = [v6 classicDevice];
  int v37 = [v36 productId];

  if (v37 == 8228)
  {
    v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v39 = [v38 localizedStringForKey:@"SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING" value:&stru_1F4097960 table:@"DeviceConfig-B698"];

    id v15 = (BTSpatialTutorialViewController *)v39;
  }
  v40 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v15 message:&stru_1F4097960 preferredStyle:1];
  v41 = (void *)MEMORY[0x1E4FB1410];
  v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v43 = [v42 localizedStringForKey:@"OK" value:&stru_1F4097960 table:@"DeviceConfig"];
  v44 = [v41 actionWithTitle:v43 style:0 handler:&__block_literal_global_813];
  [v40 addAction:v44];

  [(BTSDeviceConfigController *)self presentViewController:v40 animated:1 completion:0];
LABEL_23:
}

- (id)ancsAuthorized
{
  p_device = (id *)&self->_device;
  if ([(BluetoothDeviceProtocol *)self->_device isCTKDDevice]) {
    p_device = (id *)&self->_ctkdLeDevice;
  }
  uint64_t v4 = [*p_device ancsAuthorized];
  uint64_t v5 = NSNumber;

  return (id)[v5 numberWithBool:v4];
}

- (void)setANCSAuthorized:(id)a3
{
  p_device = (void **)&self->_device;
  device = self->_device;
  id v6 = a3;
  if ([(BluetoothDeviceProtocol *)device isCTKDDevice]) {
    p_device = (void **)&self->_ctkdLeDevice;
  }
  int v7 = *p_device;
  uint64_t v8 = [v6 BOOLValue];

  [v7 setANCSAuthorization:v8];
}

- (id)getHealthDeviceType
{
  return (id)[(BluetoothDeviceProtocol *)self->_device healthDeviceType];
}

- (id)userSelectedHealthDataSyncConfig
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(BluetoothDeviceProtocol *)self->_device userSelectedHealthDataSyncConfig];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Get user HealthDataSyncConfig: %d", (uint8_t *)v6, 8u);
  }

  uint64_t v4 = [NSNumber numberWithInt:v2];

  return v4;
}

- (void)setUserSelectedHealthDataSyncConfig:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "User set HealthDataSyncConfig: %@", (uint8_t *)&v6, 0xCu);
  }

  -[BluetoothDeviceProtocol setUserSelectedHealthDataSyncConfig:](self->_device, "setUserSelectedHealthDataSyncConfig:", [v4 intValue]);
}

- (id)digitalCrownMode
{
  deviceAnalytics = self->_deviceAnalytics;
  id v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 7, [v4 crownRotationDirection], 0);

  uint64_t v5 = NSNumber;
  int v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  id v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "crownRotationDirection"));

  return v7;
}

- (void)setDigitalCrownMode:(id)a3
{
  deviceAnalytics = self->_deviceAnalytics;
  id v5 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:6];
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 7, [v5 intValue], 0);
  id v7 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v6 = [v5 intValue];

  [v7 setCrownRotationDirection:v6];
}

- (void)refreshFindMyStatusForPencilInBackground
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(BluetoothDeviceProtocol *)self->_device identifier];
  id v5 = (void *)[v3 initWithUUIDString:v4];

  id v6 = objc_alloc_init(MEMORY[0x1E4F97C50]);
  id v7 = [v6 ownerSession];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke;
  v8[3] = &unk_1E6EA8450;
  v8[4] = self;
  [v7 peripheralConnectionMaterialForAccessoryIdentifier:v5 completion:v8];
}

void __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke_2;
  v5[3] = &unk_1E6EA8428;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 1625) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 1624) = *(void *)(a1 + 40) != 0;
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1624)) {
      id v3 = "Yes";
    }
    else {
      id v3 = "No";
    }
    int v4 = 136315138;
    id v5 = v3;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Pencil FindMy Enabled: %s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)refreshFindMyStatusForPencilSynchronously
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  int v4 = [(BluetoothDeviceProtocol *)self->_device identifier];
  id v5 = (void *)[v3 initWithUUIDString:v4];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  int v17 = __Block_byref_object_dispose_;
  dispatch_group_t v18 = 0;
  dispatch_group_t v18 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v14[5]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F97C50]);
  id v7 = [v6 ownerSession];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __70__BTSDeviceConfigController_refreshFindMyStatusForPencilSynchronously__block_invoke;
  v12[3] = &unk_1E6EA8478;
  v12[4] = self;
  v12[5] = &v13;
  [v7 peripheralConnectionMaterialForAccessoryIdentifier:v5 completion:v12];
  uint64_t v8 = v14[5];
  dispatch_time_t v9 = dispatch_time(0, 20000000);
  dispatch_group_wait(v8, v9);
  unsigned __int8 v10 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_findMyEnabledForPencil) {
      int v11 = "Yes";
    }
    else {
      int v11 = "No";
    }
    *(_DWORD *)buf = 136315138;
    int v20 = v11;
    _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Pencil FindMy Enabled: %s", buf, 0xCu);
  }

  _Block_object_dispose(&v13, 8);
}

void __70__BTSDeviceConfigController_refreshFindMyStatusForPencilSynchronously__block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1625) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 1624) = a2 != 0;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)refreshFindMyStatus
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "FindMy Status: Invalid Hex Address, Cannot Get", v2, v3, v4, v5, v6);
}

void __48__BTSDeviceConfigController_refreshFindMyStatus__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint8_t v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__BTSDeviceConfigController_refreshFindMyStatus__block_invoke_cold_1(v5, v6);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 1548) = 1;
    *(unsigned char *)(*(void *)(a1 + 40) + 1549) = a2;
    uint8_t v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "Disabled";
      if (a2) {
        id v7 = "Enabled";
      }
      int v8 = 136315138;
      dispatch_time_t v9 = v7;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "FindMy Status: Get Completed: Status: %s", (uint8_t *)&v8, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

- (id)getFindMyEnable:(id)a3
{
  uint64_t v4 = NSNumber;
  BOOL findMySetInProgress = self->_findMySetInProgress;
  id v6 = a3;
  id v7 = [v4 numberWithBool:findMySetInProgress];
  [v6 setProperty:v7 forKey:*MEMORY[0x1E4F930E8]];

  if (self->_findMyEnable) {
    int v8 = @"On";
  }
  else {
    int v8 = @"Off";
  }
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:26 value:0 featureValueString:v8];
  dispatch_time_t v9 = NSNumber;
  BOOL findMyEnable = self->_findMyEnable;

  return (id)[v9 numberWithBool:findMyEnable];
}

- (void)setFindMyEnable:(id)a3 specifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  dispatch_time_t v9 = [v8 address];

  if (v9)
  {
    __int16 v24 = 0;
    int v23 = 0;
    uint64_t v10 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    char v11 = [v10 getHexDeviceAddress:&v23];

    if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:6];
      if (v12)
      {
        if (v6)
        {
          [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:25];
          uint64_t v13 = [v6 BOOLValue];
          id v14 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            int v26 = v9;
            __int16 v27 = 1024;
            int v28 = v13;
            _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "FindMy Status: Set Address: %@, New Mode: %u", buf, 0x12u);
          }

          if (v13) {
            uint64_t v15 = @"On";
          }
          else {
            uint64_t v15 = @"Off";
          }
          [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:26 value:0 featureValueString:v15];
          self->_BOOL findMySetInProgress = 1;
          [(BTSDeviceConfigController *)self reloadSpecifier:v7 animated:1];
          id v16 = objc_alloc_init(MEMORY[0x1E4F97C50]);
          int v17 = [v16 ownerSession];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke;
          v19[3] = &unk_1E6EA84C8;
          id v20 = v17;
          uint64_t v21 = self;
          char v22 = v13;
          id v18 = v17;
          [v18 setFindMyNetworkStatusForMACAddress:v12 status:v13 completion:v19];
        }
        else
        {
          id v16 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[BTSDeviceConfigController setFindMyEnable:specifier:]();
          }
        }
      }
      else
      {
        id v16 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[BTSDeviceConfigController setFindMyEnable:specifier:]();
        }
      }
    }
    else
    {
      BOOL v12 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BTSDeviceConfigController setFindMyEnable:specifier:].cold.4();
      }
    }
  }
  else
  {
    BOOL v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BTSDeviceConfigController setFindMyEnable:specifier:]();
    }
  }
}

void __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 1549) = *(unsigned char *)(a1 + 48);
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 40) + 1549)) {
        id v5 = "Enabled";
      }
      else {
        id v5 = "Disabled";
      }
      int v7 = 136315138;
      int v8 = v5;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "FindMy Status: Mode set to %s", (uint8_t *)&v7, 0xCu);
    }
  }

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"FindMyStatusUpdated" object:0];
}

- (void)findMyStatusUpdatedHandler:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__BTSDeviceConfigController_findMyStatusUpdatedHandler___block_invoke;
  block[3] = &unk_1E6EA82F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__BTSDeviceConfigController_findMyStatusUpdatedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "FindMy Status: Set Completed, reload specifiers", v9, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1550) = 0;
  [*(id *)(a1 + 32) reloadSpecifierID:@"FIND_MY_ID" animated:1];
  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1549);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    id v6 = @"FIND_MY_NETWORK_GROUP_FOOTER_ENABLED";
  }
  else {
    id v6 = @"FIND_MY_NETWORK_GROUP_FOOTER_DISABLED";
  }
  int v7 = [v4 localizedStringForKey:v6 value:&stru_1F4097960 table:@"DeviceConfig"];

  int v8 = [*(id *)(a1 + 32) getGroupSpecifierForSpecifierID:@"FIND_MY_GROUP_ID"];
  [v8 setProperty:v7 forKey:*MEMORY[0x1E4F93170]];

  [*(id *)(a1 + 32) reloadSpecifierID:@"FIND_MY_GROUP_ID" animated:1];
}

- (BOOL)deviceSupportsCarPlay
{
  uint64_t v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  char v3 = [v2 isServiceSupported:0x40000];

  return v3;
}

- (id)_carPlayVehicle
{
  char v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v4 = [v3 address];

  if (v4)
  {
    id v5 = [(BTSDeviceConfigController *)self vehicleManager];
    id v6 = [v5 vehicleForBluetoothAddress:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)carPlayEnabled:(id)a3
{
  char v3 = NSNumber;
  BOOL v4 = [(BTSDeviceConfigController *)self cachedCarplayPairingStatus] == 2;

  return (id)[v3 numberWithBool:v4];
}

- (void)setCarPlayEnabled:(id)a3 specifier:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  int v7 = [(BTSDeviceConfigController *)self _carPlayVehicle];
  int v8 = [v6 BOOLValue];

  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v7 setPairingStatus:v9];
  uint64_t v10 = [(BTSDeviceConfigController *)self vehicleManager];
  char v11 = [v10 saveVehicle:v7];

  if (v11) {
    [(BTSDeviceConfigController *)self setCachedCarplayPairingStatus:v9];
  }
  else {
    [(BTSDeviceConfigController *)self reloadSpecifier:v12 animated:1];
  }
}

- (void)handlePairedVehiclesChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__BTSDeviceConfigController_handlePairedVehiclesChanged___block_invoke;
  block[3] = &unk_1E6EA82F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__BTSDeviceConfigController_handlePairedVehiclesChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _carPlayVehicle];
  uint64_t v3 = [v2 pairingStatus];

  if (v3 != [*(id *)(a1 + 32) cachedCarplayPairingStatus])
  {
    [*(id *)(a1 + 32) setCachedCarplayPairingStatus:v3];
    id v4 = [*(id *)(a1 + 32) headphoneObserver];
    [v4 reloadAll];
  }
}

- (void)handleCarPlayAllowedDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BTSDeviceConfigController_handleCarPlayAllowedDidChange__block_invoke;
  block[3] = &unk_1E6EA82F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__BTSDeviceConfigController_handleCarPlayAllowedDidChange__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) headphoneObserver];
  [v1 reloadAll];
}

- (void)metaGroupSelected:(id)a3
{
  id v12 = a3;
  id v4 = [v12 propertyForKey:*MEMORY[0x1E4F93220]];
  objc_msgSend(v4, "setChecked:", objc_msgSend(v4, "isChecked") ^ 1);
  id v5 = [v12 identifier];
  int v6 = [v5 isEqualToString:@"PhoneFavorites"];

  if (v6)
  {
    char v7 = [v4 isChecked];
    p_favorites = &self->_syncSettings.favorites;
  }
  else
  {
    uint64_t v9 = [v12 identifier];
    int v10 = [v9 isEqualToString:@"PhoneRecents"];

    if (!v10) {
      goto LABEL_6;
    }
    char v7 = [v4 isChecked];
    p_favorites = &self->_syncSettings.recents;
  }
  BOOL *p_favorites = v7;
LABEL_6:
  char v11 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v11 setSyncSettings:*(unsigned int *)&self->_syncSettings.supported | ((unint64_t)self->_syncSettings.userPermissionGranted << 32)];
}

- (void)contactGroupSelected:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (PSSpecifier *)a3;
  uint64_t v6 = *MEMORY[0x1E4F93220];
  char v7 = [(PSSpecifier *)self->_lastSelectedSyncGroup propertyForKey:*MEMORY[0x1E4F93220]];
  [v7 setChecked:0];

  if (self->_lastSelectedSyncGroup == v5)
  {
    char v11 = 0;
    uint64_t v10 = 4294967294;
    lastSelectedSyncGroup = v5;
  }
  else
  {
    int v8 = [(PSSpecifier *)v5 propertyForKey:v6];
    [v8 setChecked:1];

    uint64_t v9 = [(PSSpecifier *)v5 identifier];
    uint64_t v10 = [v9 intValue];

    char v11 = v5;
    lastSelectedSyncGroup = self->_lastSelectedSyncGroup;
  }
  self->_lastSelectedSyncGroup = v11;

  uint64_t v13 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = NSStringFromSelector(a2);
    uint64_t v15 = (void *)v14;
    id v16 = @"None";
    if (v10 != -2) {
      id v16 = (__CFString *)v5;
    }
    int v18 = 138412546;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "%@ new contact sync group is %@", (uint8_t *)&v18, 0x16u);
  }
  int v17 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v17 setSyncGroup:v10 enabled:1];
}

- (void)listeningModeConfigSelected:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:*MEMORY[0x1E4F93220]];
  p_listeningModeConfigs = &self->_listeningModeConfigs;
  p_BOOL anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
  if (self->_listeningModeConfigs.transparency + self->_listeningModeConfigs.anc + self->_listeningModeConfigs.normal != 2) {
    goto LABEL_13;
  }
  int v8 = [v4 identifier];
  if ([v8 isEqualToString:@"ANC"] && p_anc->normal) {
    goto LABEL_7;
  }
  uint64_t v9 = [v4 identifier];
  if ([v9 isEqualToString:@"Passthrough"]
    && self->_listeningModeConfigs.transparency)
  {

LABEL_7:
    goto LABEL_10;
  }
  uint64_t v10 = [v4 identifier];
  if (([v10 isEqualToString:@"Off"] & 1) == 0)
  {

LABEL_13:
    objc_msgSend(v5, "setChecked:", objc_msgSend(v5, "isChecked") ^ 1);
    uint64_t v13 = [v4 identifier];
    char v14 = [v13 isEqualToString:@"ANC"];

    if (v14) {
      goto LABEL_16;
    }
    uint64_t v15 = [v4 identifier];
    char v16 = [v15 isEqualToString:@"Passthrough"];

    p_BOOL anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
    if ((v16 & 1) != 0
      || ([v4 identifier],
          int v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 isEqualToString:@"Off"],
          v17,
          p_BOOL anc = &self->_listeningModeConfigs,
          v18))
    {
LABEL_16:
      p_anc->BOOL normal = [v5 isChecked];
    }
    BOOL anc = self->_listeningModeConfigs.anc;
    int v20 = (2 * anc) | 4;
    if (!self->_listeningModeConfigs.transparency) {
      int v20 = 2 * anc;
    }
    uint64_t v21 = v20 | p_listeningModeConfigs->normal;
    if (!self->_listeningModeConfigs.anc) {
      goto LABEL_26;
    }
    if (self->_listeningModeConfigs.transparency)
    {
      if (p_listeningModeConfigs->normal) {
        uint64_t v22 = @"NC&Off&T";
      }
      else {
        uint64_t v22 = @"NC&T";
      }
      goto LABEL_27;
    }
    if (p_listeningModeConfigs->normal) {
      uint64_t v22 = @"NC&Off";
    }
    else {
LABEL_26:
    }
      uint64_t v22 = @"T&Off";
LABEL_27:
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:16 value:0 featureValueString:v22];
    id v12 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    [v12 setListeningModeConfigs:v21];
    goto LABEL_28;
  }
  BOOL normal = p_listeningModeConfigs->normal;

  if (!normal) {
    goto LABEL_13;
  }
LABEL_10:
  id v12 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[BTSDeviceConfigController listeningModeConfigSelected:]();
  }
LABEL_28:
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v38 = a4;
  char v7 = -[BTSDeviceConfigController specifierAtIndex:](self, "specifierAtIndex:", -[BTSDeviceConfigController indexOfGroup:](self, "indexOfGroup:", [a5 section]));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v38;
    uint64_t v9 = [v8 titleLabel];
    [v9 setLineBreakMode:0];

    uint64_t v10 = [v8 titleLabel];
    [v10 setNumberOfLines:0];

    char v11 = [v8 specifier];
    id v12 = [v11 identifier];
    int v13 = [v12 isEqualToString:@"IMPORTANT_MSG_ID"];

    if (v13)
    {
      char v14 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:16.0];
      uint64_t v15 = [v8 titleLabel];
      [v15 setFont:v14];
    }
    char v16 = [v8 specifier];
    int v17 = [v16 identifier];
    int v18 = [v17 isEqualToString:@"PhoneFavorites"];

    if (v18)
    {
      p_favorites = &self->_syncSettings.favorites;
    }
    else
    {
      int v20 = [v8 specifier];
      uint64_t v21 = [v20 identifier];
      int v22 = [v21 isEqualToString:@"PhoneRecents"];

      if (!v22)
      {
        if (self->_lastSelectedSyncGroup
          && ([v8 specifier],
              uint64_t v31 = (PSSpecifier *)objc_claimAutoreleasedReturnValue(),
              lastSelectedSyncGroup = self->_lastSelectedSyncGroup,
              v31,
              v31 == lastSelectedSyncGroup))
        {
          BOOL v23 = 1;
        }
        else
        {
          int v33 = [v7 propertyForKey:*MEMORY[0x1E4F931A8]];
          char v34 = [v33 BOOLValue];

          if (v34) {
            goto LABEL_20;
          }
          BOOL v23 = 0;
        }
LABEL_9:
        [v8 setChecked:v23];
        __int16 v24 = [v8 specifier];
        __int16 v25 = [v24 identifier];
        int v26 = [v25 isEqualToString:@"ANC"];

        if (v26)
        {
          p_BOOL anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
LABEL_19:
          [v8 setChecked:p_anc->normal];
          goto LABEL_20;
        }
        int v28 = [v8 specifier];
        uint64_t v29 = [v28 identifier];
        int v30 = [v29 isEqualToString:@"Passthrough"];

        if (v30)
        {
          p_BOOL anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
          goto LABEL_19;
        }
        uint64_t v35 = [v8 specifier];
        v36 = [v35 identifier];
        int v37 = [v36 isEqualToString:@"Off"];

        if (v37)
        {
          p_BOOL anc = &self->_listeningModeConfigs;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      p_favorites = &self->_syncSettings.recents;
    }
    BOOL v23 = *p_favorites;
    goto LABEL_9;
  }
LABEL_21:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BTSDeviceConfigController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:@"LISTENING_MODE_ID"];

  if (v10)
  {
    listeningModeCell = self->_listeningModeCell;
    if (!listeningModeCell)
    {
      v37.receiver = self;
      v37.super_class = (Class)BTSDeviceConfigController;
      id v12 = [(BTSDeviceConfigController *)&v37 tableView:v6 cellForRowAtIndexPath:v7];
      int v13 = self->_listeningModeCell;
      self->_listeningModeCell = v12;

      listeningModeCell = self->_listeningModeCell;
    }
    [(PSTableCell *)listeningModeCell refreshCellContentsWithSpecifier:v8];
    char v14 = self->_listeningModeCell;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)BTSDeviceConfigController;
    char v14 = [(BTSDeviceConfigController *)&v36 tableView:v6 cellForRowAtIndexPath:v7];
    uint64_t v15 = [v8 identifier];
    int v16 = [v15 isEqualToString:@"CLASSIC_SETUP_TITLE_ID"];

    if (v16) {
      -[PSTableCell setSeparatorInset:](v14, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
    }
    int v17 = [v8 identifier];
    int v18 = [v17 isEqualToString:@"CLASSIC_SETUP_BODY_ID"];

    if (v18)
    {
      uint64_t v19 = [(PSTableCell *)v14 defaultContentConfiguration];
      int v20 = [v8 name];
      [v19 setText:v20];

      uint64_t v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      int v22 = [v19 textProperties];
      [v22 setColor:v21];

      [(PSTableCell *)v14 setContentConfiguration:v19];
      BOOL v23 = v14;
    }
    else
    {
      __int16 v24 = [v8 identifier];
      int v25 = [v24 isEqualToString:@"CLASSIC_SETUP_BUTTON_ID"];

      if (v25)
      {
        if (self->_devicePendingCTKDConnection)
        {
          int v26 = [(PSTableCell *)v14 defaultContentConfiguration];
          __int16 v27 = [v8 name];
          [v26 setText:v27];

          int v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
          uint64_t v29 = [v26 textProperties];
          [v29 setColor:v28];

          [(PSTableCell *)v14 setContentConfiguration:v26];
          int v30 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
          [(PSTableCell *)v14 setAccessoryView:v30];

          uint64_t v31 = [(PSTableCell *)v14 accessoryView];
          [v31 startAnimating];
        }
      }
      else
      {
        uint64_t v32 = [v8 identifier];
        int v33 = [v32 isEqualToString:@"OCCLUSION_DETECTION_ID"];

        if (v33) {
          [(PSTableCell *)v14 setAccessoryType:0];
        }
      }
      char v34 = v14;
    }
  }

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  char v9 = [v8 accessorySettingFeatureBitMask];

  int v10 = -[BTSDeviceConfigController specifierAtIndex:](self, "specifierAtIndex:", -[BTSDeviceConfigController indexOfGroup:](self, "indexOfGroup:", [v7 section]));
  char v11 = [(BTSDeviceConfigController *)self specifierAtIndexPath:v7];
  if ((v9 & 6) == 2)
  {
    id v12 = [v10 propertyForKey:*MEMORY[0x1E4F931A8]];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      char v14 = [(BTSDeviceConfigController *)self specifierForID:@"SIRI_ID"];

      if (v14 == v11)
      {
        int v17 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
        int v18 = v17;
        uint64_t v19 = 1;
      }
      else
      {
        uint64_t v15 = [(BTSDeviceConfigController *)self specifierForID:@"MEDIA_ID"];

        if (v15 == v11)
        {
          int v17 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
          int v18 = v17;
          uint64_t v19 = 2;
        }
        else
        {
          int v16 = [(BTSDeviceConfigController *)self specifierForID:@"OFF_ID"];

          if (v16 != v11) {
            goto LABEL_10;
          }
          int v17 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
          int v18 = v17;
          uint64_t v19 = 0;
        }
      }
      [v17 setDoubleTapAction:v19];
    }
  }
LABEL_10:
  int v20 = [v11 identifier];
  int v21 = [v20 isEqualToString:@"ACCESSORY_ABOUT_SERIAL_NUMBER_ID"];

  if (v21)
  {
    [(BTSDeviceConfigController *)self updateSerialNumberSpecifier:v11];
LABEL_14:
    [(BTSDeviceConfigController *)self reloadSpecifier:v11];
    goto LABEL_15;
  }
  int v22 = [v11 identifier];
  int v23 = [v22 isEqualToString:@"ACCESSORY_ABOUT_VERSION_ID"];

  if (v23)
  {
    [(BTSDeviceConfigController *)self updateVersionSpecifier:v11];
    goto LABEL_14;
  }
LABEL_15:
  v24.receiver = self;
  v24.super_class = (Class)BTSDeviceConfigController;
  [(BTSDeviceConfigController *)&v24 tableView:v6 didSelectRowAtIndexPath:v7];
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) selectRowAtIndexPath:0 animated:1 scrollPosition:0];
}

- (void)userDidTapWatchLink:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"bridge:"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)userDidTapSpatialProfileLearnMoreLink:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht213318?cid=mc-ols-airpods-article_ht2133318-ios_ui-06162022"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)userDidTapSpatialA2DPLatencyDisclosure:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht213920?cid=mc-ols-visionpro-article_ht213920-visionos_ui-09182023"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)userDidTapSpatialProfileWarningLearnMoreLink:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/guide/airpods/control-spatial-audio-and-head-tracking-dev00eb7e0a3/web"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)userDidTapRecommendedBuilds:(id)a3
{
  uint64_t v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v4 = [v3 productId];

  if ((v4 - 8212) > 0x10) {
    goto LABEL_7;
  }
  if (((1 << (v4 - 20)) & 0x14A0) != 0)
  {
    id v5 = @"https://at.apple.com/5nbILf";
    goto LABEL_10;
  }
  if (v4 == 8212 || v4 == 8228)
  {
    id v5 = @"https://at.apple.com/OLhUo";
  }
  else
  {
LABEL_7:
    if (v4 == 8210) {
      id v5 = @"https://at.apple.com/oDu4dF";
    }
    else {
      id v5 = @"https://at.apple.com/n4WLN";
    }
  }
LABEL_10:
  id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  [v7 openSensitiveURL:v6 withOptions:0];
}

- (void)userDidTapWalletLink:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"wallet:"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)userDidTapNiPrivacyLink:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=NEARBY_INTERACTIONS"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (HearingModeUIService)hearingModeUIService
{
  hearingModeUIService = self->_hearingModeUIService;
  if (!hearingModeUIService)
  {
    id v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Occlusion Detection: Init HearingModeUIService", (uint8_t *)v12, 2u);
    }

    uint64_t v13 = 0;
    char v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v5 = (void *)getHearingModeUIServiceClass_softClass;
    uint64_t v16 = getHearingModeUIServiceClass_softClass;
    if (!getHearingModeUIServiceClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      _DWORD v12[2] = __getHearingModeUIServiceClass_block_invoke;
      v12[3] = &unk_1E6EA85B8;
      v12[4] = &v13;
      __getHearingModeUIServiceClass_block_invoke((uint64_t)v12);
      id v5 = (void *)v14[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v13, 8);
    id v7 = [v6 alloc];
    id v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    char v9 = (HearingModeUIService *)[v7 initWithDevice:v8];
    int v10 = self->_hearingModeUIService;
    self->_hearingModeUIService = v9;

    [(HearingModeUIService *)self->_hearingModeUIService setDelegate:self];
    hearingModeUIService = self->_hearingModeUIService;
  }

  return hearingModeUIService;
}

- (id)specifiers
{
  uint64_t v2 = self;
  uint64_t v386 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]);
  id v4 = [*v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"bt-device"];

  id v6 = [*v3 userInfo];
  id v7 = +[HPSDevice deviceKey];
  id obj = [v6 objectForKeyedSubscript:v7];

  id v8 = (objc_class *)objc_opt_class();
  char v9 = NSStringFromClass(v8);
  int v10 = (objc_class *)objc_opt_class();
  char v11 = NSStringFromClass(v10);
  if (([v9 isEqualToString:v11] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v12 = [v5 classicDevice];

  if (v12)
  {
LABEL_7:
    v373 = v2;
    if (!v5
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || ([v5 classicDevice],
          int v17 = objc_claimAutoreleasedReturnValue(),
          BOOL v18 = +[HPSProductUtils isAppleHeadphone:v17],
          v17,
          v18))
    {
      uint64_t v19 = [*v3 userInfo];
      int v20 = +[HPSDevice deviceKey];
      int v21 = [v19 objectForKeyedSubscript:v20];

      if (v21)
      {
        objc_storeStrong((id *)&v2->_device, obj);
        int v22 = +[HPSHeadphoneManager sharedInstance];
        [v22 updateHPSDevice:obj];

        batteryStatusView = v2->_batteryStatusView;
        objc_super v24 = [obj headphoneDevice];
        [(ModernBatteryStatusView *)batteryStatusView startLisentingWithDevice:v24];

        int v25 = [obj headphoneDevice];
        int v26 = [(BTSDeviceConfigController *)v2 headphoneObserver];
        [v26 setHeadphoneDevice:v25];
      }
      else
      {
        __int16 v27 = [HPSDevice alloc];
        int v28 = [*v3 userInfo];
        uint64_t v29 = [v28 objectForKeyedSubscript:@"bt-device"];
        uint64_t v30 = [(HPSDevice *)v27 initWithHeadphoneDevice:0 btsDevice:v29];
        device = v2->_device;
        v2->_device = (BluetoothDeviceProtocol *)v30;

        uint64_t v32 = v2->_device;
        int v33 = [*v3 userInfo];
        char v34 = +[HPSDevice deviceKey];
        [v33 setObject:v32 forKeyedSubscript:v34];

        uint64_t v35 = +[HPSHeadphoneManager sharedInstance];
        [v35 updateHPSDevice:v2->_device];

        objc_super v36 = v2->_batteryStatusView;
        int v25 = [obj headphoneDevice];
        [(ModernBatteryStatusView *)v36 startLisentingWithDevice:v25];
      }
    }
    else
    {
      objc_super v37 = v5;
      int v25 = v2->_device;
      v2->_device = v37;
    }

    id v38 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [v5 debugDescription];
      v40 = [*v3 userInfo];
      v41 = +[HPSDevice deviceKey];
      v42 = [v40 objectForKeyedSubscript:v41];
      [*v3 userInfo];
      v44 = v43 = v3;
      [v44 objectForKeyedSubscript:@"HPS_DeviceInfo"];
      v46 = int v45 = v5;
      *(_DWORD *)buf = 138412802;
      v381 = v39;
      __int16 v382 = 2112;
      v383 = v42;
      __int16 v384 = 2112;
      v385 = v46;
      _os_log_impl(&dword_1E4BFE000, v38, OS_LOG_TYPE_DEFAULT, "HeadphoneConfigs: specifiers deviceKeyDevice: %@, HEADPHONE_DEVICE: %@, USER_INFO: %@", buf, 0x20u);

      id v5 = v45;
      uint64_t v3 = v43;

      uint64_t v2 = v373;
    }

    v47 = v2->_device;
    if (!v47)
    {
      id v16 = 0;
      goto LABEL_136;
    }
    deviceAnalytics = v2->_deviceAnalytics;
    v49 = [(BluetoothDeviceProtocol *)v47 classicDevice];
    -[HPSDeviceAnalytics updateProductID:](deviceAnalytics, "updateProductID:", [v49 productId]);

    location = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
    if (*location) {
      goto LABEL_129;
    }
    v50 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
    v51 = [v50 accessoryInfo];

    v365 = v51;
    uint64_t v52 = [v51 objectForKey:@"AACPVersionInfo"];
    v366 = (void *)v52;
    v358 = v3;
    if (v52
      && (v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (unint64_t)[v53 count] >= 0xB)
    {
      objc_storeStrong((id *)&v2->_versionInfo, v53);
      v54 = [v365 objectForKey:@"ANCAssetVersion"];
      if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v55 = v54;
        ancAssetVersion = v2->_ancAssetVersion;
        v2->_ancAssetVersion = v55;
      }
      else
      {
        ancAssetVersion = v2->_ancAssetVersion;
        v2->_ancAssetVersion = 0;
      }

      v344 = [v365 objectForKey:@"CaseInfo"];
      if (v344 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v57 = v5;
        v345 = v344;
        caseInfo = v2->_caseInfo;
        v2->_caseInfo = v345;
      }
      else
      {
        v57 = v5;
        caseInfo = v2->_caseInfo;
        v2->_caseInfo = 0;
      }
    }
    else
    {
      v57 = v5;
      versionInfo = v2->_versionInfo;
      v2->_versionInfo = 0;

      v59 = v2->_ancAssetVersion;
      v2->_ancAssetVersion = 0;

      v54 = v2->_caseInfo;
      v2->_caseInfo = 0;
    }

    v60 = (void *)MEMORY[0x1E4F1C978];
    v61 = [(BTSDeviceConfigController *)v2 loadSpecifiersFromPlistName:@"DeviceConfig" target:v2];
    v367 = [v60 arrayWithArray:v61];

    v370 = objc_opt_new();
    v62 = v2;
    if (v2->_accessoryHeaderController)
    {
      v63 = [(BTSDeviceConfigController *)v2 leDevice];
      v64 = [v63 relatedFutureRadioAddress];

      if (v64)
      {
        v65 = [(PSListController *)v2->_accessoryHeaderController specifiers];
        v66 = [v65 objectAtIndexedSubscript:0];
        v67 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v68 = [v67 localizedStringForKey:@"FOLLOW_PAIR_INSTRUCTION_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig"];
        [v66 setProperty:v68 forKey:*MEMORY[0x1E4F93170]];
      }
      v69 = [(PSListController *)v2->_accessoryHeaderController specifiers];
      [v370 addObjectsFromArray:v69];
    }
    v368 = v57;
    id v70 = objc_alloc(MEMORY[0x1E4F1C978]);
    v71 = [v367 objectAtIndexedSubscript:0];
    v72 = [v367 objectAtIndexedSubscript:1];
    v73 = [v367 objectAtIndexedSubscript:2];
    v74 = [v367 objectAtIndexedSubscript:8];
    uint64_t v75 = objc_msgSend(v70, "initWithObjects:", v71, v72, v73, v74, 0);
    controlGroupSpecifiers = v62->_controlGroupSpecifiers;
    v62->_controlGroupSpecifiers = (NSArray *)v75;

    id v77 = objc_alloc(MEMORY[0x1E4F1C978]);
    v78 = [v367 objectAtIndexedSubscript:3];
    v79 = [v367 objectAtIndexedSubscript:4];
    uint64_t v80 = objc_msgSend(v77, "initWithObjects:", v78, v79, 0);
    messagingSpecifiers = v62->_messagingSpecifiers;
    v62->_messagingSpecifiers = (NSArray *)v80;

    id v82 = objc_alloc(MEMORY[0x1E4F1C978]);
    v83 = [v367 objectAtIndexedSubscript:5];
    v84 = [v367 objectAtIndexedSubscript:6];
    uint64_t v85 = objc_msgSend(v82, "initWithObjects:", v83, v84, 0);
    syncContactsSpecifiers = v62->_syncContactsSpecifiers;
    v62->_syncContactsSpecifiers = (NSArray *)v85;

    id v87 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v88 = [v367 objectAtIndexedSubscript:7];
    uint64_t v89 = objc_msgSend(v87, "initWithObjects:", v88, 0);
    syncGroupsSpecifiers = v62->_syncGroupsSpecifiers;
    v62->_syncGroupsSpecifiers = (NSMutableArray *)v89;

    v91 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aacpControlSpecifiers = v62->_aacpControlSpecifiers;
    v62->_aacpControlSpecifiers = v91;

    v93 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    accessoryFirmwareSpecifiers = v62->_accessoryFirmwareSpecifiers;
    v62->_accessoryFirmwareSpecifiers = v93;

    v95 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nameControlSpecifiers = v62->_nameControlSpecifiers;
    v62->_nameControlSpecifiers = v95;

    v97 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    ancsControlSpecifiers = v62->_ancsControlSpecifiers;
    v62->_ancsControlSpecifiers = v97;

    v99 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deviceTypeSpecifiers = v62->_deviceTypeSpecifiers;
    v62->_deviceTypeSpecifiers = v99;

    v101 = [MEMORY[0x1E4F79EF0] sharedInstance];
    v102 = [MEMORY[0x1E4F79EF0] pairedDevicesSelectorBlock];
    v103 = [v101 getAllDevicesWithArchivedAltAccountDevicesMatching:v102];

    long long v376 = 0u;
    long long v377 = 0u;
    long long v374 = 0u;
    long long v375 = 0u;
    id v372 = v103;
    uint64_t v104 = [v372 countByEnumeratingWithState:&v374 objects:v379 count:16];
    uint64_t v2 = v62;
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v375;
      uint64_t v107 = *MEMORY[0x1E4F79F00];
      do
      {
        for (uint64_t i = 0; i != v105; ++i)
        {
          if (*(void *)v375 != v106) {
            objc_enumerationMutation(v372);
          }
          v109 = [*(id *)(*((void *)&v374 + 1) + 8 * i) valueForProperty:v107];
          v110 = [(BluetoothDeviceProtocol *)v2->_device identifier];
          v111 = [v109 UUIDString];
          int v112 = [v110 isEqualToString:v111];

          uint64_t v2 = v373;
          if (v112) {
            v373->_isWatch = 1;
          }
        }
        uint64_t v105 = [v372 countByEnumeratingWithState:&v374 objects:v379 count:16];
      }
      while (v105);
    }

    [(BTSDeviceConfigController *)v2 loadAccessorySettings];
    [(BTSDeviceConfigController *)v2 loadAccessoryInfo];
    if (!+[HPSProductUtils isRealityDevice]) {
      [(BTSDeviceConfigController *)v2 loadAccessoryFirmwareInfo];
    }
    v113 = (void *)MEMORY[0x1E4F93148];
    if (v2->_isWatch)
    {
      v114 = [(NSArray *)v2->_controlGroupSpecifiers objectAtIndexedSubscript:0];
      v115 = NSString;
      v116 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v117 = [v116 localizedStringForKey:@"APPLE_WATCH_FOOTER_TEXT" value:&stru_1F4097960 table:@"DeviceConfig"];
      v118 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v119 = [v118 localizedStringForKey:@"APPLE_WATCH_APP_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v120 = objc_msgSend(v115, "stringWithFormat:", v117, v119);

      v121 = (objc_class *)objc_opt_class();
      v122 = NSStringFromClass(v121);
      [v114 setProperty:v122 forKey:*MEMORY[0x1E4F93140]];

      [v114 setProperty:v120 forKey:*MEMORY[0x1E4F93160]];
      v113 = (void *)MEMORY[0x1E4F93148];
      v123 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v124 = [v123 localizedStringForKey:@"APPLE_WATCH_APP_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v388.location = [v120 rangeOfString:v124];
      v125 = NSStringFromRange(v388);
      [v114 setProperty:v125 forKey:*MEMORY[0x1E4F93150]];

      uint64_t v2 = v373;
      v126 = (void *)MEMORY[0x1E4F93158];

      v127 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v373];
      [v114 setProperty:v127 forKey:*v126];

      [v114 setProperty:@"userDidTapWatchLink:" forKey:*v113];
    }
    v128 = v370;
    if ([(BluetoothDeviceProtocol *)v2->_device isManagedByWallet])
    {
      v2->_isManagedByWallet = 1;
      v129 = [(NSArray *)v2->_controlGroupSpecifiers objectAtIndexedSubscript:0];
      v130 = NSString;
      v131 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v132 = [v131 localizedStringForKey:@"MANAGED_BY_WALLET_FOOTER_TEXT" value:&stru_1F4097960 table:@"DeviceConfig"];
      v133 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v134 = [v133 localizedStringForKey:@"WALLET_APP_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v135 = objc_msgSend(v130, "stringWithFormat:", v132, v134);

      v128 = v370;
      v136 = (objc_class *)objc_opt_class();
      v137 = NSStringFromClass(v136);
      [v129 setProperty:v137 forKey:*MEMORY[0x1E4F93140]];

      [v129 setProperty:v135 forKey:*MEMORY[0x1E4F93160]];
      v138 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v139 = [v138 localizedStringForKey:@"WALLET_APP_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v389.location = [v135 rangeOfString:v139];
      v140 = NSStringFromRange(v389);
      [v129 setProperty:v140 forKey:*MEMORY[0x1E4F93150]];

      uint64_t v2 = v373;
      v141 = (void *)MEMORY[0x1E4F93158];

      v142 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v373];
      [v129 setProperty:v142 forKey:*v141];

      [v129 setProperty:@"userDidTapWalletLink:" forKey:*v113];
    }
    id v5 = v57;
    if ([(BluetoothDeviceProtocol *)v2->_device isManagedByAliroWallet])
    {
      v2->_isManagedByAliroWallet = 1;
      v143 = [(NSArray *)v2->_controlGroupSpecifiers objectAtIndexedSubscript:0];
      v144 = NSString;
      v145 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v146 = [v145 localizedStringForKey:@"MANAGED_BY_WALLET_ALIRO_FOOTER_TEXT" value:&stru_1F4097960 table:@"DeviceConfig"];
      v147 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v148 = [v147 localizedStringForKey:@"WALLET_APP_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v149 = objc_msgSend(v144, "stringWithFormat:", v146, v148);

      id v5 = v57;
      v128 = v370;
      v150 = (objc_class *)objc_opt_class();
      v151 = NSStringFromClass(v150);
      [v143 setProperty:v151 forKey:*MEMORY[0x1E4F93140]];

      [v143 setProperty:v149 forKey:*MEMORY[0x1E4F93160]];
      v152 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v153 = [v152 localizedStringForKey:@"WALLET_APP_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v390.location = [v149 rangeOfString:v153];
      v154 = NSStringFromRange(v390);
      [v143 setProperty:v154 forKey:*MEMORY[0x1E4F93150]];

      uint64_t v2 = v373;
      v155 = (void *)MEMORY[0x1E4F93158];

      v156 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v373];
      [v143 setProperty:v156 forKey:*v155];

      [v143 setProperty:@"userDidTapWalletLink:" forKey:*v113];
    }
    if ([(BluetoothDeviceProtocol *)v2->_device doesSupportBackgroundNI])
    {
      v157 = [(NSArray *)v2->_controlGroupSpecifiers objectAtIndexedSubscript:0];
      v158 = NSString;
      v159 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v160 = [v159 localizedStringForKey:@"NI_BACKGROUND_FOOTER_TEXT" value:&stru_1F4097960 table:@"DeviceConfig"];
      v161 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v162 = [v161 localizedStringForKey:@"NI_PRIVACY_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v163 = objc_msgSend(v158, "stringWithFormat:", v160, v162);

      id v5 = v57;
      v128 = v370;
      v164 = (objc_class *)objc_opt_class();
      v165 = NSStringFromClass(v164);
      [v157 setProperty:v165 forKey:*MEMORY[0x1E4F93140]];

      [v157 setProperty:v163 forKey:*MEMORY[0x1E4F93160]];
      v166 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v167 = [v166 localizedStringForKey:@"NI_PRIVACY_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];
      v391.location = [v163 rangeOfString:v167 options:4];
      v168 = NSStringFromRange(v391);
      [v157 setProperty:v168 forKey:*MEMORY[0x1E4F93150]];

      uint64_t v2 = v373;
      v169 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v373];
      [v157 setProperty:v169 forKey:*MEMORY[0x1E4F93158]];

      [v157 setProperty:@"userDidTapNiPrivacyLink:" forKey:*v113];
    }
    if ([(BluetoothDeviceProtocol *)v2->_device isCTKDDevice])
    {
      v170 = [*v358 userInfo];
      uint64_t v171 = [v170 objectForKeyedSubscript:@"ctkd-device"];
      ctkdLeDevice = v2->_ctkdLeDevice;
      v2->_ctkdLeDevice = (BTSDeviceLE *)v171;
    }
    v173 = [(BTSDeviceConfigController *)v2 classicSetupSpecifiers];
    [v128 addObjectsFromArray:v173];

    if (([(BluetoothDeviceProtocol *)v2->_device supportsANCS] & 1) != 0
      || [(BluetoothDeviceProtocol *)v2->_device isCTKDDevice]
      && [(BTSDeviceLE *)v2->_ctkdLeDevice supportsANCS])
    {
      v174 = (void *)MEMORY[0x1E4F92E70];
      v175 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v176 = [v175 localizedStringForKey:@"SYSTEM_NOTIFICATIONS" value:&stru_1F4097960 table:@"DeviceConfig"];
      v177 = [v174 preferenceSpecifierNamed:v176 target:v373 set:0 get:0 detail:0 cell:0 edit:0];

      [(NSMutableArray *)v373->_ancsControlSpecifiers addObject:v177];
      v178 = (void *)MEMORY[0x1E4F92E70];
      v128 = v370;
      v179 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v180 = [v179 localizedStringForKey:@"SHARE_SYSTEM_NOTIFICATIONS" value:&stru_1F4097960 table:@"DeviceConfig"];
      v181 = [v178 preferenceSpecifierNamed:v180 target:v373 set:sel_setANCSAuthorized_ get:sel_ancsAuthorized detail:0 cell:6 edit:0];

      uint64_t v2 = v373;
      [(NSMutableArray *)v373->_ancsControlSpecifiers addObject:v181];
    }
    v182 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
    int v183 = [v182 getLowSecurityStatus];

    if (v183)
    {
      v184 = (void *)MEMORY[0x1E4F92E70];
      v185 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v186 = [v185 localizedStringForKey:&stru_1F4097960 value:&stru_1F4097960 table:@"DeviceConfig"];
      v187 = [v184 preferenceSpecifierNamed:v186 target:v373 set:0 get:0 detail:0 cell:0 edit:0];

      v188 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:v373 set:0 get:0 detail:0 cell:-1 edit:0];
      [v188 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
      v189 = [(BluetoothDeviceProtocol *)v373->_device name];
      v190 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v191 = [v190 localizedStringForKey:@"UNSECURED_ACCESSORY_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];

      v192 = NSString;
      v193 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v194 = [v193 localizedStringForKey:@"UNSECURED_ACCESSORY_BODY" value:&stru_1F4097960 table:@"DeviceConfig"];
      v195 = objc_msgSend(v192, "stringWithFormat:", v194, v189);

      id v196 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v197 = v373->_device;
      v198 = +[HPSDevice deviceKey];
      v199 = v197;
      v128 = v370;
      [v196 setObject:v199 forKey:v198];

      [v196 setObject:v191 forKey:@"warning-cell-title"];
      [v196 setObject:v195 forKey:@"warning-cell-body"];
      [v188 setUserInfo:v196];
      [v370 addObject:v187];
      [v370 addObject:v188];

      id v5 = v368;
      uint64_t v2 = v373;
    }
    if ([(BluetoothDeviceProtocol *)v2->_device isLimitedConnectivityDevice])
    {
      v200 = (void *)MEMORY[0x1E4F92E70];
      v201 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v202 = [v201 localizedStringForKey:&stru_1F4097960 value:&stru_1F4097960 table:@"DeviceConfig"];
      v359 = [v200 preferenceSpecifierNamed:v202 target:v2 set:0 get:0 detail:0 cell:0 edit:0];

      v203 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:-1 edit:0];
      [v203 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
      v204 = [(BluetoothDeviceProtocol *)v2->_device name];
      v205 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v355 = [v205 localizedStringForKey:@"CONNECTIVITY_WARNING_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];

      int v206 = MGGetBoolAnswer();
      v207 = @"WIFI";
      if (v206) {
        v207 = @"WLAN";
      }
      v208 = v207;
      v209 = [NSString stringWithFormat:@"%@_CONNECTIVITY_WARNING_BODY", v208];
      v210 = NSString;
      v211 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v212 = [v211 localizedStringForKey:v209 value:&stru_1F4097960 table:@"DeviceConfig"];
      v213 = objc_msgSend(v210, "stringWithFormat:", v212, v204);

      id v214 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v215 = v373->_device;
      v216 = +[HPSDevice deviceKey];
      v217 = v215;
      uint64_t v2 = v373;
      [v214 setObject:v217 forKey:v216];

      v128 = v370;
      [v214 setObject:v355 forKey:@"warning-cell-title"];
      [v214 setObject:v213 forKey:@"warning-cell-body"];
      [v203 setUserInfo:v214];
      [v370 addObject:v359];
      [v370 addObject:v203];

      id v5 = v368;
    }
    int v218 = [(BluetoothDeviceProtocol *)v2->_device isFirmwareUpdateRequiredDevice];
    v219 = (void *)MEMORY[0x1E4F930A8];
    if (v218)
    {
      v220 = (void *)MEMORY[0x1E4F92E70];
      v221 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v222 = objc_msgSend(v221, "localizedStringForKey:value:table:", &stru_1F4097960, &stru_1F4097960);
      v360 = [v220 preferenceSpecifierNamed:v222 target:v2 set:0 get:0 detail:0 cell:0 edit:0];

      v223 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:4 edit:0];
      [v223 setProperty:objc_opt_class() forKey:*v219];
      v224 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v225 = [v224 localizedStringForKey:@"FIRMWARE_UPDATE_WARNING_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];

      v226 = NSString;
      v227 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v228 = [v227 localizedStringForKey:@"FIRMWARE_UPDATE_WARNING_BODY" value:&stru_1F4097960 table:@"DeviceConfig"];
      v229 = [v226 stringWithFormat:v228];

      v230 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v231 = [v230 localizedStringForKey:@"FIRMWARE_UPDATE_WARNING_TEXT_TO_SET_AS_LINK" value:&stru_1F4097960 table:@"DeviceConfig"];

      id v232 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v233 = v373->_device;
      v234 = +[HPSDevice deviceKey];
      [v232 setObject:v233 forKey:v234];

      id v5 = v368;
      [v232 setObject:v225 forKey:@"warning-cell-title"];
      [v232 setObject:v229 forKey:@"warning-cell-body"];
      [v232 setObject:v231 forKey:@"warning-cell-body-link-text"];
      [v232 setObject:@"https://support.apple.com/en-us/HT211232" forKey:@"warning-cell-body-url"];
      [v223 setUserInfo:v232];
      [v370 addObject:v360];
      [v370 addObject:v223];

      v128 = v370;
      uint64_t v2 = v373;
    }
    if ([(BTSDeviceConfigController *)v2 deviceSupportsCarPlay])
    {
      v235 = [(BTSDeviceConfigController *)v2 carplayPreferences];

      if (!v235)
      {
        id v236 = objc_alloc_init(MEMORY[0x1E4F57F00]);
        [(BTSDeviceConfigController *)v2 setCarplayPreferences:v236];
        [v236 setPreferencesDelegate:v2];
      }
      v237 = [(BTSDeviceConfigController *)v2 carplayPreferences];
      int v238 = [v237 isCarPlayAllowed];

      if (v238)
      {
        v239 = [(BTSDeviceConfigController *)v2 vehicleManager];

        if (!v239)
        {
          id v240 = objc_alloc_init(MEMORY[0x1E4F57F10]);
          [(BTSDeviceConfigController *)v2 setVehicleManager:v240];
          v241 = [MEMORY[0x1E4F28C40] defaultCenter];
          [v241 addObserver:v2 selector:sel_handlePairedVehiclesChanged_ name:*MEMORY[0x1E4F57EB8] object:0];
        }
        v242 = [(BTSDeviceConfigController *)v2 _carPlayVehicle];
        v243 = v242;
        if (v242)
        {
          -[BTSDeviceConfigController setCachedCarplayPairingStatus:](v2, "setCachedCarplayPairingStatus:", [v242 pairingStatus]);
          v244 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"CARPLAY_GROUP"];
          v245 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v246 = [v245 localizedStringForKey:@"CARPLAY_FOOTER_TEXT" value:&stru_1F4097960 table:@"DeviceConfig"];
          [v244 setProperty:v246 forKey:*MEMORY[0x1E4F93170]];

          v247 = (void *)MEMORY[0x1E4F92E70];
          v248 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v2 = v373;
          v249 = [v248 localizedStringForKey:@"CARPLAY_SWITCH" value:&stru_1F4097960 table:@"DeviceConfig"];
          v250 = [v247 preferenceSpecifierNamed:v249 target:v373 set:sel_setCarPlayEnabled_specifier_ get:sel_carPlayEnabled_ detail:0 cell:6 edit:0];

          v128 = v370;
          id v5 = v368;
          [v250 setIdentifier:@"CARPLAY_SWITCH"];
          v378[0] = v244;
          v378[1] = v250;
          v251 = [MEMORY[0x1E4F1C978] arrayWithObjects:v378 count:2];
          [v370 addObjectsFromArray:v251];
        }
      }
    }
    v252 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
    int v253 = [v252 isServiceSupported:512];

    if (v253)
    {
      v2->_supportsMAP = 1;
      v254 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
      v255 = [v254 getServiceSetting:512 key:@"BT_KEY_MAP_ENABLED"];
      v2->_BOOL messagingEnabled = [v255 isEqualToString:@"BT_VALUE_MAP_ENABLED"];

      [v128 addObjectsFromArray:v2->_messagingSpecifiers];
    }
    if (_os_feature_enabled_impl())
    {
      v256 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
      if (+[HPSProductUtils isAppleHeadphone:v256])
      {
        v257 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
        char v258 = [v257 isTemporaryPaired];

        if ((v258 & 1) == 0)
        {
          v259 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
          int v260 = [v259 isGenuineAirPods];

          if (v260) {
            [(BTSDeviceConfigController *)v2 updateBatteryStatus];
          }
        }
      }
      else
      {
      }
    }
    v261 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
    if ([v261 hearingAidSupport])
    {
      int v262 = _os_feature_enabled_impl();

      if (!v262)
      {
LABEL_86:
        uint64_t v265 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
        if (v265)
        {
          v266 = (void *)v265;
          v267 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
          char v268 = [v267 isGenuineAirPods];

          if ((v268 & 1) == 0)
          {
            v269 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
            {
              v270 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
              int v271 = [v270 productId];
              *(_DWORD *)buf = 67109120;
              LODWORD(v381) = v271;
              _os_log_impl(&dword_1E4BFE000, v269, OS_LOG_TYPE_DEFAULT, "Device %i is fake", buf, 8u);
            }
            v272 = (void *)MEMORY[0x1E4F92E70];
            v273 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v274 = v2;
            v275 = [v273 localizedStringForKey:&stru_1F4097960 value:&stru_1F4097960 table:@"DeviceConfig"];
            v276 = [v272 groupSpecifierWithID:v275];

            v277 = (void *)MEMORY[0x1E4F92E70];
            v278 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v279 = [v278 localizedStringForKey:@"IMPORTANT_MSG" value:&stru_1F4097960 table:@"DeviceConfig"];
            v280 = [v277 preferenceSpecifierNamed:v279 target:v274 set:0 get:0 detail:0 cell:4 edit:0];

            [v280 setIdentifier:@"IMPORTANT_MSG_ID"];
            v281 = (void *)MEMORY[0x1E4F92E70];
            v282 = [(BluetoothDeviceProtocol *)v274->_device classicDevice];
            unsigned int v283 = [v282 productId] - 8194;
            if (v283 <= 0x22 && ((1 << v283) & 0x472863101) != 0)
            {
              v284 = v373;
              v285 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              v286 = v285;
              v287 = @"IMPORTANT_MSG_NON_GENUINE_AIRPODS";
            }
            else
            {
              v284 = v373;
              v285 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              v286 = v285;
              v287 = @"IMPORTANT_MSG_NON_GENUINE_BEATS";
            }
            v288 = [v285 localizedStringForKey:v287 value:&stru_1F4097960 table:@"DeviceConfig"];
            v289 = [v281 preferenceSpecifierNamed:v288 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

            [v289 setIdentifier:@"IMPORTANT_MSG_NON_GENUINE_ID"];
            [v289 setProperty:&unk_1F40ABAD8 forKey:*MEMORY[0x1E4F93218]];
            v290 = (void *)MEMORY[0x1E4F92E70];
            v291 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v292 = [v291 localizedStringForKey:@"IMPORTANT_MSG_LEARN_MORE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v293 = [v290 preferenceSpecifierNamed:v292 target:v284 set:0 get:0 detail:0 cell:13 edit:0];

            [v293 setButtonAction:sel_presentImportantMsgLink];
            v128 = v370;
            [v370 addObject:v276];
            [v370 addObject:v280];
            [v370 addObject:v289];
            [v370 addObject:v293];

            uint64_t v2 = v284;
            id v5 = v368;
          }
        }
        if ([(BTSDeviceConfigController *)v2 canDisconnect]) {
          [v128 addObjectsFromArray:v2->_nameControlSpecifiers];
        }
        v364 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
        if (v364)
        {
          v294 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
          if ([v294 vendorId] == 76)
          {
LABEL_102:

            goto LABEL_103;
          }
          v295 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
          if ([v295 isServiceSupported:1])
          {

LABEL_101:
            v364 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"DEVICE_TYPE_GROUP_ID"];
            [(NSMutableArray *)v2->_deviceTypeSpecifiers addObject:v364];
            v298 = (void *)MEMORY[0x1E4F92E70];
            v299 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v300 = objc_msgSend(v299, "localizedStringForKey:value:table:", @"DEVICE_TYPE");
            v363 = [v298 preferenceSpecifierNamed:v300 target:v373 set:&sel_setUserSelectedDeviceType_ get:sel_userSelectedDeviceType detail:objc_opt_class() cell:2 edit:0];

            id v361 = objc_alloc(MEMORY[0x1E4F1C978]);
            v356 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v351 = [v356 localizedStringForKey:@"CAR_STEREO_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v353 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v301 = [v353 localizedStringForKey:@"HEADPHONE_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v302 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v303 = [v302 localizedStringForKey:@"HEARING_AID_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v304 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v305 = [v304 localizedStringForKey:@"SPEAKER_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v306 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v307 = [v306 localizedStringForKey:@"OTHER_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v362 = objc_msgSend(v361, "initWithObjects:", v351, v301, v303, v305, v307, 0);

            id v308 = objc_alloc(MEMORY[0x1E4F1C978]);
            v309 = [NSNumber numberWithInt:1];
            v310 = [NSNumber numberWithInt:2];
            v311 = [NSNumber numberWithInt:3];
            v312 = [NSNumber numberWithInt:4];
            v313 = [NSNumber numberWithInt:5];
            v357 = objc_msgSend(v308, "initWithObjects:", v309, v310, v311, v312, v313, 0);

            id v349 = objc_alloc(MEMORY[0x1E4F1C978]);
            v354 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v348 = [v354 localizedStringForKey:@"CAR_STEREO_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v352 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v347 = [v352 localizedStringForKey:@"HEADPHONE_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v314 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v315 = [v314 localizedStringForKey:@"HEARING_AID_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v316 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v317 = [v316 localizedStringForKey:@"SPEAKER_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v318 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v319 = [v318 localizedStringForKey:@"OTHER_TYPE" value:&stru_1F4097960 table:@"DeviceConfig"];
            v350 = objc_msgSend(v349, "initWithObjects:", v348, v347, v315, v317, v319, 0);

            v294 = v363;
            id v5 = v368;

            v128 = v370;
            uint64_t v2 = v373;

            [v363 setValues:v357 titles:v362 shortTitles:v350];
            v320 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v321 = [v320 localizedStringForKey:@"DEVICE_TYPE_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig"];
            [v363 setProperty:v321 forKey:*MEMORY[0x1E4F93208]];

            [(NSMutableArray *)v373->_deviceTypeSpecifiers addObject:v363];
            goto LABEL_102;
          }
          v296 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
          int v297 = [v296 isServiceSupported:16];

          if (v297) {
            goto LABEL_101;
          }
        }
LABEL_103:
        [(BTSDeviceConfigController *)v2 loadSyncSettings];
        if (v2->_syncSettings.supported)
        {
          [v128 addObjectsFromArray:v2->_syncContactsSpecifiers];
          if (v2->_syncSettings.enabled) {
            [v128 addObjectsFromArray:v2->_syncGroupsSpecifiers];
          }
        }
        v322 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
        if ([v322 isServiceSupported:0x80000])
        {
          BOOL v323 = [(BTSDeviceConfigController *)v2 canDisconnect];

          if (v323) {
            [v128 addObjectsFromArray:v2->_aacpControlSpecifiers];
          }
        }
        else
        {
        }
        v324 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
        int v325 = [v324 connected];

        if (v325) {
          [v128 addObjectsFromArray:v2->_accessoryFirmwareSpecifiers];
        }
        if (v2->_versionInfo) {
          [v128 addObjectsFromArray:v2->_accessoryInfoSpecifiers];
        }
        v326 = v366;
        if ([(NSMutableArray *)v2->_deviceTypeSpecifiers count]) {
          [v128 addObjectsFromArray:v2->_deviceTypeSpecifiers];
        }
        if ([(BTSDeviceConfigController *)v2 canDisconnect])
        {
          [v128 addObjectsFromArray:v2->_ancsControlSpecifiers];
          v327 = [(NSArray *)v2->_controlGroupSpecifiers objectAtIndexedSubscript:0];
          [v128 addObject:v327];

          v328 = [(NSArray *)v2->_controlGroupSpecifiers objectAtIndexedSubscript:1];
          [v128 addObject:v328];

          v329 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
          int v330 = [v329 isGuestPairingMode];

          v331 = sharedBluetoothSettingsLogComponent();
          BOOL v332 = os_log_type_enabled(v331, OS_LOG_TYPE_DEFAULT);
          if (!v330)
          {
            v326 = v366;
            if (v332)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E4BFE000, v331, OS_LOG_TYPE_DEFAULT, "Guest Pairing: NOT Adding Upgrade Button", buf, 2u);
            }
            goto LABEL_124;
          }
          v326 = v366;
          if (v332)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4BFE000, v331, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Adding Upgrade Button", buf, 2u);
          }

          v333 = v2->_controlGroupSpecifiers;
          uint64_t v334 = 3;
        }
        else
        {
          if (![(BTSDeviceConfigController *)v2 canUnpair])
          {
            uint64_t v335 = 0;
            goto LABEL_128;
          }
          [v128 addObjectsFromArray:v2->_ancsControlSpecifiers];
          v333 = v2->_controlGroupSpecifiers;
          uint64_t v334 = 0;
        }
        v331 = [(NSArray *)v333 objectAtIndexedSubscript:v334];
        [v128 addObject:v331];
LABEL_124:

        uint64_t v335 = 2;
LABEL_128:
        v336 = [(NSArray *)v2->_controlGroupSpecifiers objectAtIndexedSubscript:v335];
        [v128 addObject:v336];

        objc_storeStrong(location, v128);
LABEL_129:
        char v14 = [(BluetoothDeviceProtocol *)v2->_device productName];
        if ([(BTSDeviceConfigController *)v2 nicknameEnabled])
        {
          uint64_t v337 = [(BluetoothDeviceProtocol *)v2->_device name];

          char v14 = (void *)v337;
        }
        uint64_t v338 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
        if (v338)
        {
          v339 = (void *)v338;
          v340 = [(BluetoothDeviceProtocol *)v2->_device classicDevice];
          int v341 = [v340 magicPaired];

          if (v341)
          {
            uint64_t v342 = [(BluetoothDeviceProtocol *)v2->_device name];

            char v14 = (void *)v342;
          }
        }
        [(BTSDeviceConfigController *)v2 setTitle:v14];
        id v16 = *location;
        goto LABEL_135;
      }
      v263 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v263, OS_LOG_TYPE_DEFAULT, "Occlusion Detection: Get Occlusion Detection Specifiers", buf, 2u);
      }

      v261 = [(BTSDeviceConfigController *)v2 hearingModeUIService];
      v264 = [v261 occlusionDetectionSpecifiers];
      [v128 addObjectsFromArray:v264];
    }
    goto LABEL_86;
  }
  uint64_t v13 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    [(BTSDeviceConfigController *)v5 specifiers];
  }

  char v14 = [(BTSDeviceConfigController *)v2 navigationController];
  id v15 = (id)[v14 popViewControllerAnimated:1];
  id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_135:

LABEL_136:

  return v16;
}

- (void)loadAccessoryFirmwareInfo
{
  int v3 = MGGetBoolAnswer();
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v3) {
    BOOL v5 = Int64 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5) {
    return;
  }
  id v22 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  if (+[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:"))
  {
    id v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    char v7 = [v6 isTemporaryPaired];

    if (v7) {
      return;
    }
    id v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    int v9 = [v8 isGenuineAirPods];

    if (!v9) {
      return;
    }
    id v22 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:@"Internal" target:self set:0 get:0 detail:0 cell:0 edit:0];
    -[NSMutableArray addObject:](self->_accessoryFirmwareSpecifiers, "addObject:");
    if ([(BTSDeviceConfigController *)self shouldShowInternalFitTestToggle])
    {
      int v10 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:@"Force Show Fit Test" target:self set:sel_setForceShowFitTest_ get:sel_forceShowFitTest detail:0 cell:6 edit:0];
      [(NSMutableArray *)self->_accessoryFirmwareSpecifiers addObject:v10];
    }
    char v11 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    if ([v11 getAACPCapabilityBit:64])
    {
      id v12 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      int v13 = [v12 getSpatialAudioPlatformSupport];

      if (v13 != 1)
      {
LABEL_15:
        id v16 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:@"Configure Livability" target:self set:0 get:0 detail:0 cell:13 edit:0];
        [v16 setButtonAction:sel_presentAssetLocationLink];
        int v17 = [NSString stringWithFormat:@"More details available at %@.", @"Recommended Builds"];
        BOOL v18 = (objc_class *)objc_opt_class();
        uint64_t v19 = NSStringFromClass(v18);
        [v22 setProperty:v19 forKey:*MEMORY[0x1E4F93140]];

        [v22 setProperty:v17 forKey:*MEMORY[0x1E4F93160]];
        v24.location = [v17 rangeOfString:@"Recommended Builds"];
        int v20 = NSStringFromRange(v24);
        [v22 setProperty:v20 forKey:*MEMORY[0x1E4F93150]];

        int v21 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
        [v22 setProperty:v21 forKey:*MEMORY[0x1E4F93158]];

        [v22 setProperty:@"userDidTapRecommendedBuilds:" forKey:*MEMORY[0x1E4F93148]];
        [(NSMutableArray *)self->_accessoryFirmwareSpecifiers addObject:v16];

        goto LABEL_16;
      }
      char v11 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:@"Use Spatial Audio Profile" target:self set:sel_setSoundProfileAllowed_ get:sel_soundProfileAllowed detail:0 cell:6 edit:0];
      [(NSMutableArray *)self->_accessoryFirmwareSpecifiers addObject:v11];
      char v14 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:@"Dynamic Audio Feedback" target:self set:sel_setDynamicEnrollmentFeedback_ get:sel_dynamicEnrollmentFeedback detail:0 cell:6 edit:0];
      [(NSMutableArray *)self->_accessoryFirmwareSpecifiers addObject:v14];
      id v15 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:@"Video Capture Spatial Audio Profile" target:self set:sel_setSpatialProfileVideoCapture_ get:sel_spatialProfileVideoCapture detail:0 cell:6 edit:0];
      [(NSMutableArray *)self->_accessoryFirmwareSpecifiers addObject:v15];
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (BOOL)shouldForceShowFitTest
{
  int v3 = [(BTSDeviceConfigController *)self forceShowFitTest];
  if ([v3 BOOLValue]) {
    BOOL v4 = [(BTSDeviceConfigController *)self shouldShowInternalFitTestToggle];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowInternalFitTestToggle
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v3 = [v2 productId];

  unsigned int v4 = ((v3 - 8217) < 8) & (0xA5u >> (v3 - 25));
  BOOL v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "No";
    if (v4) {
      id v6 = "Yes";
    }
    int v8 = 136315138;
    int v9 = v6;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Internal Fit Test: Should Show Internal Fit Test Toggle: %s", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (id)forceShowFitTest
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t Int64 = CFPrefs_GetInt64();
  int v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = "No";
    if (Int64) {
      unsigned int v4 = "Yes";
    }
    int v7 = 136315138;
    int v8 = v4;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Internal Fit Test: Force Show Fit Test: %s", (uint8_t *)&v7, 0xCu);
  }

  BOOL v5 = [NSNumber numberWithBool:Int64 != 0];

  return v5;
}

- (void)setForceShowFitTest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = [a3 BOOLValue];
  CFPrefs_SetValue();
  unsigned int v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = "No";
    if (v3) {
      BOOL v5 = "Yes";
    }
    int v6 = 136315138;
    int v7 = v5;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Internal Fit Test: Set Force Show Fit Test to: %s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)setSpatialProfileVideoCapture:(id)a3
{
  [a3 BOOLValue];

  CFPrefs_SetValue();
}

- (id)spatialProfileVideoCapture
{
  BOOL v2 = CFPrefs_GetInt64() != 0;
  int v3 = NSNumber;

  return (id)[v3 numberWithBool:v2];
}

- (void)setAdaptiveVolumeMode:(id)a3
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  [v5 setDeviceAdaptiveVolumeMode:v4];
}

- (id)adaptiveVolumeMode
{
  BOOL v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v3 = [v2 getDeviceAdaptiveVolumeMode];

  if (v3 == 1)
  {
    uint64_t v12 = 1;
  }
  else
  {
    if (!v3)
    {
      uint64_t v4 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(BTSDeviceConfigController *)v4 adaptiveVolumeMode];
      }
    }
    uint64_t v12 = 0;
  }
  int v13 = [NSNumber numberWithBool:v12];

  return v13;
}

- (void)setDynamicEnrollmentFeedback:(id)a3
{
  int v3 = [a3 BOOLValue];
  uint64_t v4 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v4 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(@"DynamicEnrollmentFeedback", *v4, @"com.apple.BTServer");

  CFPreferencesAppSynchronize(@"com.apple.BTServer");
}

- (id)dynamicEnrollmentFeedback
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DynamicEnrollmentFeedback", @"com.apple.BTServer", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  uint64_t v5 = [NSNumber numberWithBool:v4];

  return v5;
}

- (void)loadSyncSettings
{
  id v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1E4BFE000, v2, v3, "%@ BTServer's sync group out-of-date, defaulting to None", v4, v5, v6, v7, v8);
}

- (void)loadAccessorySettings
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_DEBUG, "Accessory feature support : %06x", (uint8_t *)v2, 8u);
}

- (void)addA2DPDisclosureUISpecifier
{
  if (!+[HPSProductUtils isRealityDevice]) {
    return;
  }
  uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unsigned int v5 = [v4 productId];
  if (v5 >= 0x2002)
  {
    uint64_t v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    if ([v2 productId] < 0x200A) {
      goto LABEL_8;
    }
  }
  uint64_t v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  if ([v6 productId] == 8208)
  {
LABEL_7:

    if (v5 <= 0x2001)
    {
LABEL_9:

LABEL_10:
      uint8_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v29 = [v8 localizedStringForKey:@"SPATIAL_TUTORIAL_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];

      uint64_t v9 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:0 edit:0];
      [v9 setProperty:@"SPATIAL_AUDIO_GROUP_ID_A2DP" forKey:*MEMORY[0x1E4F93188]];
      uint64_t v10 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      int v11 = [v10 productId];

      uint64_t v12 = NSString;
      int v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v14 = v13;
      if (v11 == 8194)
      {
        id v15 = [v13 localizedStringForKey:@"SPATIAL_AUDIO_DETAIL_REALITYDEVICE_AIRPODS" value:&stru_1F4097960 table:@"DeviceConfig"];
        id v16 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
        int v17 = [v16 productName];
        BOOL v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"LEARN_MORE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
        int v20 = objc_msgSend(v12, "stringWithFormat:", v15, v17, v19);
      }
      else
      {
        id v15 = [v13 localizedStringForKey:@"SPATIAL_AUDIO_DETAIL_REALITYDEVICE_BEATS" value:&stru_1F4097960 table:@"DeviceConfig"];
        id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        int v17 = [v16 localizedStringForKey:@"LEARN_MORE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
        int v20 = objc_msgSend(v12, "stringWithFormat:", v15, v17);
      }

      [v9 setProperty:v20 forKey:*MEMORY[0x1E4F93170]];
      int v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      [v9 setProperty:v22 forKey:*MEMORY[0x1E4F93140]];

      [v9 setProperty:v20 forKey:*MEMORY[0x1E4F93160]];
      int v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      NSRange v24 = [v23 localizedStringForKey:@"LEARN_MORE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
      v31.location = [v20 rangeOfString:v24];
      int v25 = NSStringFromRange(v31);
      [v9 setProperty:v25 forKey:*MEMORY[0x1E4F93150]];

      int v26 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
      [v9 setProperty:v26 forKey:*MEMORY[0x1E4F93158]];

      [v9 setProperty:@"userDidTapSpatialA2DPLatencyDisclosure:" forKey:*MEMORY[0x1E4F93148]];
      [(NSMutableArray *)self->_aacpControlSpecifiers addObject:v9];

      return;
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v7 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  if ([v7 productId] == 8214)
  {

    goto LABEL_7;
  }
  __int16 v27 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v28 = [v27 productId];

  if (v5 > 0x2001) {
  if (v28 == 8209)
  }
    goto LABEL_10;
}

- (void)addHearingSpecifiers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BTSDeviceConfigController *)self adaptiveTransparencySpecifier];
  if ([(BTSDeviceConfigController *)self adaptiveVolumeSupported]
    || [(BTSDeviceConfigController *)self conversationDetectSupported]
    || v3)
  {
    unsigned int v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Hearing: Device Supported, Adding Hearing Specifiers", buf, 2u);
    }

    uint64_t v6 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint8_t v8 = [v7 localizedStringForKey:@"AUDIO" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
    uint64_t v4 = [v6 preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:0 edit:0];

    if (+[HPSProductUtils isRealityDevice])
    {
      uint64_t v9 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      uint64_t v10 = +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:", [v9 productId], @"AUDIO_GROUP_FOOTER");

      [v4 setProperty:v10 forKey:*MEMORY[0x1E4F93170]];
    }
    [(NSMutableArray *)self->_aacpControlSpecifiers addObject:v4];
    [(BTSDeviceConfigController *)self addAdaptiveVolumeSpecifier];
    [(BTSDeviceConfigController *)self addConversationDetectSpecifier];
    if (v3) {
      [(NSMutableArray *)self->_aacpControlSpecifiers addObject:v3];
    }
    if ([(BTSDeviceConfigController *)self supportAutoAncStrength])
    {
      int v11 = (void *)MEMORY[0x1E4F92E70];
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v13 = [v12 localizedStringForKey:@"ADAPTIVE_AUDIO" value:&stru_1F4097960 table:@"DeviceConfig"];
      char v14 = [v11 preferenceSpecifierNamed:v13 target:self set:sel_setAdaptiveStrengthWithValue_ get:sel_getAdaptiveStrength detail:objc_opt_class() cell:2 edit:0];

      id v15 = +[HPSDevice deviceKey];
      device = self->_device;
      BOOL v18 = v15;
      uint64_t v19 = device;
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [v14 setUserInfo:v17];

      [v14 setIdentifier:@"ADAPTIVE_STRENGTH"];
      if (+[HPSProductUtils isRealityDevice]) {
        [v14 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
      }
      [(NSMutableArray *)self->_aacpControlSpecifiers addObject:v14];
    }
  }
  else
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      BOOL v21 = [(BTSDeviceConfigController *)self adaptiveVolumeSupported];
      __int16 v22 = 1024;
      BOOL v23 = [(BTSDeviceConfigController *)self conversationDetectSupported];
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Hearing: showHearing == False %i %i %@,", buf, 0x18u);
    }
  }
}

- (id)adaptiveTransparencySpecifier
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!+[HPSProductUtils isRealityDevice])
  {
    if (![(BTSDeviceConfigController *)self shouldShowLoudSoundReduction])
    {
LABEL_23:
      uint64_t v9 = 0;
      goto LABEL_24;
    }
    __int16 v24 = [MEMORY[0x1E4F67CD8] sharedInstance];
    uint64_t v25 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    uint64_t v26 = [v25 address];
    int v27 = [v24 activeHearingProtectionAvailableForAddress:v26];

    if (!v27)
    {
      if (!self->_adaptiveTransparencyRetrieved)
      {
        int v33 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          BOOL adaptiveTransparencyRetrieved = self->_adaptiveTransparencyRetrieved;
          unint64_t adaptiveTransparencyIndex = self->_adaptiveTransparencyIndex;
          *(_DWORD *)buf = 67109376;
          BOOL v39 = adaptiveTransparencyRetrieved;
          __int16 v40 = 2048;
          unint64_t v41 = adaptiveTransparencyIndex;
          _os_log_impl(&dword_1E4BFE000, v33, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveTransparency:  initial _adaptiveTransparencyRetrieved %d  _adaptiveTransparencyIndex %lu", buf, 0x12u);
        }

        self->_unint64_t adaptiveTransparencyIndex = [(NSMutableArray *)self->_aacpControlSpecifiers count];
        objc_super v36 = [MEMORY[0x1E4F67CD8] sharedInstance];
        [v36 registerUpdateBlock:&__block_literal_global_1694 forRetrieveSelector:sel_activeHearingProtectionAvailable withListener:self];
      }
      goto LABEL_23;
    }
    id v28 = objc_alloc(MEMORY[0x1E4F92E70]);
    id v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v30 = [v29 localizedStringForKey:@"ADAPTIVE_TRANSPARENCY" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
    uint64_t v9 = (void *)[v28 initWithName:v30 target:self set:sel_setHearingProtectionEnabled_specifier_ get:sel_getHearingProtectionEnabled_ detail:0 cell:6 edit:0];

    [v9 setIdentifier:@"ADAPTIVE_TRANSPARENCY_ID"];
    [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v20 = [v19 localizedStringForKey:@"ADAPTIVE_TRANSPARENCY_DESC" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
    BOOL v23 = (void *)*MEMORY[0x1E4F93230];
    BOOL v21 = v9;
    __int16 v22 = v20;
LABEL_15:
    [v21 setProperty:v22 forKey:v23];

    goto LABEL_24;
  }
  uint64_t v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v4 = [v3 productId];

  if (v4 != 8212 && v4 != 8228)
  {
    NSRange v31 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v31, OS_LOG_TYPE_DEFAULT, "Hearing: Adaptive Transparency: accessory doesn't  support the feature, returning", buf, 2u);
    }

    goto LABEL_23;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F92E70]);
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint8_t v8 = [v7 localizedStringForKey:@"ADAPTIVE_TRANSPARENCY" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
  uint64_t v9 = (void *)[v6 initWithName:v8 target:self set:sel_setHearingProtectionEnabled_specifier_ get:sel_getHearingProtectionEnabled_ detail:0 cell:6 edit:0];

  [v9 setIdentifier:@"ADAPTIVE_TRANSPARENCY_ID"];
  [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
  [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"ADAPTIVE_TRANSPARENCY_DESC" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
  [v9 setProperty:v11 forKey:*MEMORY[0x1E4F93230]];

  uint64_t v12 = [(BTSDeviceConfigController *)self getHearingProtectionEnabled:v9];
  int v13 = [v12 BOOLValue];
  char v14 = @"CELL_LABEL_OFF";
  if (v13) {
    char v14 = @"CELL_LABEL_ON";
  }
  id v15 = v14;

  id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v17 = [v16 localizedStringForKey:v15 value:&stru_1F4097960 table:@"DeviceConfig-B698"];

  BOOL v18 = +[HPSVisionOSSubtitleOnOffIndicatorCell onOffKey];
  [v9 setProperty:v17 forKey:v18];

  if (v4 == 8228 || v4 == 8212)
  {
    uint64_t v19 = [NSNumber numberWithBool:1];
    int v20 = +[HPSVisionOSSubtitleOnOffIndicatorCell cellDisabledKey];
    BOOL v21 = v9;
    __int16 v22 = v19;
    BOOL v23 = v20;
    goto LABEL_15;
  }
LABEL_24:

  return v9;
}

void __58__BTSDeviceConfigController_adaptiveTransparencySpecifier__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HPSSoundProtectionUpdated" object:0];
}

- (id)getHearingProtectionEnabled:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[HPSProductUtils isRealityDevice])
  {
    uint64_t v4 = 1;
  }
  else
  {
    unsigned int v5 = [MEMORY[0x1E4F67CD8] sharedInstance];
    id v6 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    uint64_t v7 = [v6 address];
    uint64_t v4 = [v5 activeHearingProtectionEnabledForAddress:v7];

    uint8_t v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v4;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveTransparency: getHearingProtectionEnabled %d", (uint8_t *)v12, 8u);
    }

    if (v4) {
      uint64_t v9 = @"On";
    }
    else {
      uint64_t v9 = @"Off";
    }
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:1 value:0 featureValueString:v9];
  }
  uint64_t v10 = [NSNumber numberWithBool:v4];

  return v10;
}

- (void)setHearingProtectionEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 BOOLValue];
  id v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveTransparency: setHearingProtectionEnabled %d", (uint8_t *)v11, 8u);
  }

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:0];
  if (v5) {
    uint64_t v7 = @"On";
  }
  else {
    uint64_t v7 = @"Off";
  }
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:1 value:0 featureValueString:v7];
  uint8_t v8 = [MEMORY[0x1E4F67CD8] sharedInstance];
  uint64_t v9 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  uint64_t v10 = [v9 address];
  [v8 setActiveHearingProtectionEnabled:v5 forAddress:v10];
}

- (void)updateHearingProtectionSpecifiers
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Hearing: AdaptiveTransparency: Environmental Sound Protection has been retrieved", v2, v3, v4, v5, v6);
}

uint64_t __62__BTSDeviceConfigController_updateHearingProtectionSpecifiers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"ADAPTIVE_TRANSPARENCY_ID" animated:1];
}

- (void)addConversationDetectSpecifier
{
  if (_os_feature_enabled_impl())
  {
    BOOL v3 = +[HPSProductUtils isRealityDevice];
    uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    uint64_t v5 = v4;
    if (v3)
    {
      char v6 = [v4 getAACPCapabilityBit:160];

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v32 = 0;
          uint8_t v8 = "Hearing: ConversationDetect: Accessory doesn't support the feature";
          uint64_t v9 = (uint8_t *)&v32;
LABEL_18:
          _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else
    {
      int v10 = [v4 getConversationDetectSupport];

      if ((v10 & 1) == 0)
      {
        uint64_t v7 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)NSRange v31 = 0;
          uint8_t v8 = "Hearing: ConversationDetect: Support Disabled";
          uint64_t v9 = v31;
          goto LABEL_18;
        }
        goto LABEL_22;
      }
    }
    int v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Hearing: ConversationDetect: Enabled, adding Specifier", buf, 2u);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v14 = [v13 localizedStringForKey:@"SPEECH_DETECTION" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
    uint64_t v7 = [v12 preferenceSpecifierNamed:v14 target:self set:sel_setConversationDetectMode_specifier_ get:sel_getConversationDetectMode_ detail:0 cell:6 edit:0];

    [v7 setIdentifier:@"SPEECH_DETECTION_ID"];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = *MEMORY[0x1E4F930A8];
    [v7 setProperty:v15 forKey:*MEMORY[0x1E4F930A8]];
    int v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v18 = [v17 localizedStringForKey:@"SPEECH_DETECTION_DESC" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
    [v7 setProperty:v18 forKey:*MEMORY[0x1E4F93230]];

    if (+[HPSProductUtils isRealityDevice])
    {
      [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
      [v7 setProperty:objc_opt_class() forKey:v16];
      uint64_t v19 = [(BTSDeviceConfigController *)self getConversationDetectMode:v7];
      int v20 = @"CELL_LABEL_ON";
      if (!v19) {
        int v20 = @"CELL_LABEL_OFF";
      }
      BOOL v21 = v20;

      __int16 v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v23 = [v22 localizedStringForKey:v21 value:&stru_1F4097960 table:@"DeviceConfig-B698"];

      __int16 v24 = +[HPSVisionOSSubtitleOnOffIndicatorCell onOffKey];
      [v7 setProperty:v23 forKey:v24];

      uint64_t v25 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      if ([v25 productId] == 8228)
      {

LABEL_20:
        id v28 = [NSNumber numberWithBool:1];
        id v29 = +[HPSVisionOSSubtitleOnOffIndicatorCell cellDisabledKey];
        [v7 setProperty:v28 forKey:v29];

        goto LABEL_21;
      }
      uint64_t v26 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      int v27 = [v26 productId];

      if (v27 == 8212) {
        goto LABEL_20;
      }
    }
LABEL_21:
    [(NSMutableArray *)self->_aacpControlSpecifiers addObject:v7];
    goto LABEL_22;
  }
  uint64_t v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = 0;
    uint8_t v8 = "Hearing: ConversationDetect: Feature Disabled";
    uint64_t v9 = (uint8_t *)&v33;
    goto LABEL_18;
  }
LABEL_22:
}

- (id)getConversationDetectMode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v5 = [v4 getConversationDetectMode];

  char v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "Disabled";
    if (v5 == 1) {
      uint64_t v7 = "Enabled";
    }
    int v11 = 136315138;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Hearing: ConversationDetect: Get Mode: %s", (uint8_t *)&v11, 0xCu);
  }
  BOOL v8 = v5 == 1;

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:53 value:v8 featureValueString:0];
  uint64_t v9 = [NSNumber numberWithBool:v8];

  return v9;
}

- (void)setConversationDetectMode:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  deviceAnalytics = self->_deviceAnalytics;
  id v6 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:52];
  uint64_t v7 = [v6 BOOLValue];

  BOOL v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = "Disabled";
    if (v7) {
      uint64_t v9 = "Enabled";
    }
    int v13 = 136315138;
    char v14 = v9;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Hearing: ConversationDetect: Set Mode: %s", (uint8_t *)&v13, 0xCu);
  }

  int v10 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v11 = v10;
  if (v7) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  [v10 setConversationDetectMode:v12];

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:53 value:v7 featureValueString:0];
}

- (void)addAdaptiveVolumeSpecifier
{
  if (_os_feature_enabled_impl())
  {
    BOOL v3 = +[HPSProductUtils isRealityDevice];
    uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    int v5 = v4;
    if (v3)
    {
      char v6 = [v4 getAACPCapabilityBit:144];

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v32 = 0;
          BOOL v8 = "Hearing: AdaptiveVolume: Accessory doesn't support the feature";
          uint64_t v9 = (uint8_t *)&v32;
LABEL_18:
          _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else
    {
      int v10 = [v4 getAdaptiveVolumeSupport];

      if ((v10 & 1) == 0)
      {
        uint64_t v7 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)NSRange v31 = 0;
          BOOL v8 = "Hearing: AdaptiveVolume: Support Disabled";
          uint64_t v9 = v31;
          goto LABEL_18;
        }
        goto LABEL_22;
      }
    }
    int v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveVolume: Enabled, adding Specifier", buf, 2u);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F92E70];
    int v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v14 = [v13 localizedStringForKey:@"ADAPTIVE_VOLUME" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
    uint64_t v7 = [v12 preferenceSpecifierNamed:v14 target:self set:sel_setAdaptiveVolumeMode_specifier_ get:sel_getAdaptiveVolumeMode_ detail:0 cell:6 edit:0];

    [v7 setIdentifier:@"ADAPTIVE_VOLUME_ID"];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = *MEMORY[0x1E4F930A8];
    [v7 setProperty:v15 forKey:*MEMORY[0x1E4F930A8]];
    int v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v18 = [v17 localizedStringForKey:@"ADAPTIVE_VOLUME_DESC" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
    [v7 setProperty:v18 forKey:*MEMORY[0x1E4F93230]];

    if (+[HPSProductUtils isRealityDevice])
    {
      [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
      [v7 setProperty:objc_opt_class() forKey:v16];
      uint64_t v19 = [(BTSDeviceConfigController *)self getAdaptiveVolumeMode:v7];
      int v20 = @"CELL_LABEL_ON";
      if (!v19) {
        int v20 = @"CELL_LABEL_OFF";
      }
      BOOL v21 = v20;

      __int16 v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v23 = [v22 localizedStringForKey:v21 value:&stru_1F4097960 table:@"DeviceConfig-B698"];

      __int16 v24 = +[HPSVisionOSSubtitleOnOffIndicatorCell onOffKey];
      [v7 setProperty:v23 forKey:v24];

      uint64_t v25 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      if ([v25 productId] == 8228)
      {

LABEL_20:
        id v28 = [NSNumber numberWithBool:1];
        id v29 = +[HPSVisionOSSubtitleOnOffIndicatorCell cellDisabledKey];
        [v7 setProperty:v28 forKey:v29];

        goto LABEL_21;
      }
      uint64_t v26 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      int v27 = [v26 productId];

      if (v27 == 8212) {
        goto LABEL_20;
      }
    }
LABEL_21:
    [(NSMutableArray *)self->_aacpControlSpecifiers addObject:v7];
    goto LABEL_22;
  }
  uint64_t v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = 0;
    BOOL v8 = "Hearing: AdaptiveVolume: Feature Disabled";
    uint64_t v9 = (uint8_t *)&v33;
    goto LABEL_18;
  }
LABEL_22:
}

- (id)getAdaptiveVolumeMode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v5 = [v4 getAdaptiveVolumeMode];

  char v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "Disabled";
    if (v5 == 1) {
      uint64_t v7 = "Enabled";
    }
    int v11 = 136315138;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveVolume: Get Mode: %s", (uint8_t *)&v11, 0xCu);
  }
  BOOL v8 = v5 == 1;

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:3 value:v8 featureValueString:0];
  uint64_t v9 = [NSNumber numberWithBool:v8];

  return v9;
}

- (void)setAdaptiveVolumeMode:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  deviceAnalytics = self->_deviceAnalytics;
  id v6 = a3;
  [(HPSDeviceAnalytics *)deviceAnalytics updateFeatureChangeCount:2];
  uint64_t v7 = [v6 BOOLValue];

  BOOL v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = "Disabled";
    if (v7) {
      uint64_t v9 = "Enabled";
    }
    int v13 = 136315138;
    char v14 = v9;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveVolume: Set Mode: %s", (uint8_t *)&v13, 0xCu);
  }

  int v10 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v11 = v10;
  if (v7) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  [v10 setAdaptiveVolumeMode:v12];

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:3 value:v7 featureValueString:0];
}

- (BOOL)BOOLFromBluetoothPreferences:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, @"com.apple.BTServer", &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (BOOL)nicknameEnabled
{
  BOOL v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(BTSDeviceConfigController *)(uint64_t)self nicknameEnabled];
  }

  return ![(BTSDeviceConfigController *)self BOOLFromBluetoothPreferences:@"nicknamingDisabled"];
}

- (void)loadAccessoryInfo
{
  BOOL v3 = (NSMutableArray *)objc_opt_new();
  if (!self->_versionInfo) {
    goto LABEL_80;
  }
  uint64_t v4 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  unint64_t v5 = 0x1E4F28000uLL;
  unint64_t v6 = 0x1E4F92000;
  if ([v4 featureCapability:32])
  {
    uint64_t v7 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    if ([v7 smartRouteSupport])
    {
      BOOL v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      char v9 = [v8 connected];

      if (v9) {
        goto LABEL_46;
      }
      int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v11 = [(id)MGGetStringAnswer() uppercaseString];
      uint64_t v12 = [@"SMARTROUTE_" stringByAppendingString:v11];
      uint64_t v4 = [v10 localizedStringForKey:v12 value:&stru_1F4097960 table:@"DeviceConfig"];

      int v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v14 = [(id)MGGetStringAnswer() uppercaseString];
      uint64_t v15 = [@"SMARTROUTE_MANUAL_" stringByAppendingString:v14];
      uint64_t v136 = [v13 localizedStringForKey:v15 value:&stru_1F4097960 table:@"DeviceConfig"];

      uint64_t v16 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      int v17 = [v16 productId];

      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"ACCESSORY_MODEL_NAME_%d", (v17 - 0x2000));
      uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v20 = [v19 localizedStringForKey:v18 value:&stru_1F4097960 table:@"DeviceConfig"];
      uint64_t v21 = [v20 length];

      int v135 = v17;
      if (v21 && v17 >> 4 < 0x201)
      {
        uint64_t v133 = 0;
        uint64_t v131 = 0;
        unint64_t v22 = 0x1E4F92000;
      }
      else
      {

        BOOL v23 = @"ACCESSORY_MODEL_NAME_15";
        BOOL v24 = v17 <= 8220;
        int v25 = v17;
        unint64_t v22 = 0x1E4F92000uLL;
        if (v24)
        {
          uint64_t v26 = @"ACCESSORY_MODEL_NAME_18";
          BOOL v27 = 0;
          if (v25 == 8212) {
            BOOL v23 = @"ACCESSORY_MODEL_NAME_20";
          }
          BOOL v28 = v25 == 8210;
          BOOL v30 = v25 != 8210 && v25 == 8212;
          LODWORD(v133) = v30;
          LODWORD(v131) = v25 == 8210;
          BOOL v29 = 0;
        }
        else
        {
          uint64_t v26 = @"ACCESSORY_MODEL_NAME_42";
          if (v25 == 8228) {
            BOOL v23 = @"ACCESSORY_MODEL_NAME_20";
          }
          BOOL v27 = v25 != 8223 && v25 == 8228;
          if (v25 == 8223) {
            BOOL v23 = @"ACCESSORY_MODEL_NAME_10";
          }
          BOOL v28 = v25 == 8221;
          LODWORD(v133) = 0;
          LODWORD(v131) = 0;
          BOOL v29 = v25 == 8221;
        }
        HIDWORD(v131) = v29;
        BOOL v31 = !v28 && v27;
        HIDWORD(v133) = v31;
        if (v28) {
          BOOL v18 = v26;
        }
        else {
          BOOL v18 = v23;
        }
      }
      __int16 v32 = [(id)MGGetStringAnswer() uppercaseString];
      v139 = [@"SMARTROUTE_FOOTER_" stringByAppendingFormat:@"%@_%@", v32, v18];

      v134 = [*(id *)(v22 + 3696) groupSpecifierWithID:@"SMART_ROUTE_GROUP_ID"];
      v138 = [*(id *)(v22 + 3696) preferenceSpecifierNamed:v4 target:self set:sel_setSmartRouteMode_ get:sel_smartRouteMode detail:objc_opt_class() cell:2 edit:0];
      id v33 = objc_alloc(MEMORY[0x1E4F1C978]);
      char v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v35 = [v34 localizedStringForKey:@"SMARTROUTE_AUTOMATIC" value:&stru_1F4097960 table:@"DeviceConfig"];
      v137 = objc_msgSend(v33, "initWithObjects:", v35, v136, 0);

      id v36 = objc_alloc(MEMORY[0x1E4F1C978]);
      objc_super v37 = [NSNumber numberWithInt:1];
      id v38 = [NSNumber numberWithInt:2];
      uint64_t v39 = objc_msgSend(v36, "initWithObjects:", v37, v38, 0);

      id v40 = objc_alloc(MEMORY[0x1E4F1C978]);
      unint64_t v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v42 = [v41 localizedStringForKey:@"SMARTROUTE_AUTOMATIC" value:&stru_1F4097960 table:@"DeviceConfig"];
      uint64_t v43 = objc_msgSend(v40, "initWithObjects:", v42, v136, 0);

      unint64_t v5 = 0x1E4F28000uLL;
      v132 = (void *)v39;
      v130 = (void *)v43;
      [v138 setValues:v39 titles:v137 shortTitles:v43];
      v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v45 = [v44 localizedStringForKey:v139 value:&stru_1F4097960 table:@"DeviceConfig"];
      uint64_t v46 = *MEMORY[0x1E4F93208];
      [v138 setProperty:v45 forKey:*MEMORY[0x1E4F93208]];

      if (v131)
      {
        v47 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
        int v48 = [v47 getAACPCapabilityBit:10];

        if (v48)
        {
          v49 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v50 = [v49 localizedStringForKey:v139 value:&stru_1F4097960 table:@"DeviceConfig-B494"];
          [v138 setProperty:v50 forKey:v46];
        }
      }
      if (HIDWORD(v131))
      {
        v51 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
        int v52 = [v51 getAACPCapabilityBit:10];

        if (v52)
        {
          v53 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v54 = [v53 localizedStringForKey:v139 value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];
          [v138 setProperty:v54 forKey:v46];
        }
      }
      uint64_t v7 = (void *)v136;
      if (v133)
      {
        v55 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v56 = [v55 localizedStringForKey:v139 value:&stru_1F4097960 table:@"DeviceConfig-B698"];
        [v138 setProperty:v56 forKey:v46];
      }
      if (HIDWORD(v133))
      {
        v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v58 = [v57 localizedStringForKey:v139 value:&stru_1F4097960 table:@"DeviceConfig-B698"];
        [v138 setProperty:v58 forKey:v46];
      }
      if (v135 == 8223 || v135 == 8202)
      {
        v59 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
        int v60 = [v59 getAACPCapabilityBit:32];

        if (v60)
        {
          v61 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v62 = [v61 localizedStringForKey:v139 value:&stru_1F4097960 table:@"DeviceConfig-b515"];
          [v138 setProperty:v62 forKey:v46];
        }
      }
      [(NSMutableArray *)v3 addObject:v134];
      [(NSMutableArray *)v3 addObject:v138];

      unint64_t v6 = 0x1E4F92000uLL;
    }
  }
LABEL_46:
  if (!_os_feature_enabled_impl()) {
    goto LABEL_52;
  }
  v63 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  if (+[HPSProductUtils isFeatureSupported:1 byDevice:v63]&& [(BTSDeviceConfigController *)self isiCloudEnabled])
  {
    v64 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    char v65 = [v64 connected];

    if (v65) {
      goto LABEL_52;
    }
    v63 = [*(id *)(v6 + 3696) groupSpecifierWithID:@"FIND_MY_GROUP_ID"];
    v66 = *(void **)(v6 + 3696);
    v67 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v68 = [v67 localizedStringForKey:@"FIND_MY" value:&stru_1F4097960 table:@"DeviceConfig"];
    v69 = [v66 preferenceSpecifierNamed:v68 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v69 setButtonAction:sel_presentFindMyLink];
    [(NSMutableArray *)v3 addObject:v63];
    [(NSMutableArray *)v3 addObject:v69];
  }
LABEL_52:
  if (_os_feature_enabled_impl())
  {
    id v70 = [(BTSDeviceConfigController *)self turnOffListeningModeSpecifiers];
    [(NSMutableArray *)v3 addObjectsFromArray:v70];
  }
  v71 = *(void **)(v6 + 3696);
  v72 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v73 = [v72 localizedStringForKey:@"ACCESSORY_ABOUT_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];
  v74 = [v71 preferenceSpecifierNamed:v73 target:self set:0 get:0 detail:0 cell:0 edit:0];

  [(NSMutableArray *)v3 addObject:v74];
  uint64_t v75 = [(BTSDeviceConfigController *)self getModelName:0];

  v76 = (void *)MEMORY[0x1E4F93108];
  if (v75)
  {
    id v77 = *(void **)(v6 + 3696);
    v78 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v79 = [v78 localizedStringForKey:@"ACCESSORY_ABOUT_BUD_MODEL_NAME" value:&stru_1F4097960 table:@"DeviceConfig"];
    uint64_t v80 = [v77 preferenceSpecifierNamed:v79 target:self set:0 get:sel_getModelName_ detail:0 cell:4 edit:0];

    [v80 setProperty:MEMORY[0x1E4F1CC38] forKey:*v76];
    [(NSMutableArray *)v3 addObject:v80];
  }
  v81 = [(BTSDeviceConfigController *)self getModelNumber:0];

  if (v81)
  {
    id v82 = *(void **)(v6 + 3696);
    v83 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v84 = [v83 localizedStringForKey:@"ACCESSORY_ABOUT_BUD_MODEL_NUMBER" value:&stru_1F4097960 table:@"DeviceConfig"];
    uint64_t v85 = [v82 preferenceSpecifierNamed:v84 target:self set:0 get:sel_getModelNumber_ detail:0 cell:4 edit:0];

    [v85 setProperty:MEMORY[0x1E4F1CC38] forKey:*v76];
    [(NSMutableArray *)v3 addObject:v85];
  }
  v86 = [(BTSDeviceConfigController *)self getSystemSerialNumber:0];
  id v87 = v86;
  BOOL v88 = v86 == 0;
  if (v86)
  {
    uint64_t v89 = 0;
LABEL_62:

LABEL_63:
    v90 = *(void **)(v6 + 3696);
    v91 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v92 = [v91 localizedStringForKey:@"ACCESSORY_ABOUT_SERIAL_NUMBER" value:&stru_1F4097960 table:@"DeviceConfig"];
    v93 = &selRef_getSystemSerialNumber_;
    v94 = &selRef_getBudLeftSerialNumber_;
    if (!v88) {
      v94 = &selRef_getBudRightSerialNumber_;
    }
    if (!v87) {
      v93 = v94;
    }
    v95 = [v90 preferenceSpecifierNamed:v92 target:self set:0 get:*v93 detail:0 cell:4 edit:0];

    unint64_t v5 = 0x1E4F28000uLL;
    [v95 setIdentifier:@"ACCESSORY_ABOUT_SERIAL_NUMBER_ID"];
    v96 = [NSNumber numberWithInt:v89];
    [v95 setProperty:v96 forKey:@"SERIAL_NUMBER_TYPE"];

    [v95 setProperty:MEMORY[0x1E4F1CC38] forKey:*v76];
    [(NSMutableArray *)v3 addObject:v95];

    goto LABEL_68;
  }
  v86 = [(BTSDeviceConfigController *)self getBudLeftSerialNumber:0];
  if (v86)
  {
    uint64_t v89 = 1;
    goto LABEL_62;
  }
  v129 = [(BTSDeviceConfigController *)self getBudRightSerialNumber:0];

  if (v129)
  {
    BOOL v88 = 0;
    uint64_t v89 = 2;
    goto LABEL_63;
  }
LABEL_68:
  v97 = [(BTSDeviceConfigController *)self getBudFirmwareVersion:0];

  if (v97)
  {
    BOOL v98 = [(BTSDeviceConfigController *)self supportsFirmwareReleaseNotes];
    v99 = (void *)MEMORY[0x1E4F92E70];
    v100 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v101 = [v100 localizedStringForKey:@"ACCESSORY_ABOUT_BUD_VERSION_FIRMWARE" value:&stru_1F4097960 table:@"DeviceConfig"];
    if (v98)
    {
      v102 = [v99 preferenceSpecifierNamed:v101 target:self set:0 get:sel_getBudFirmwareVersion_ detail:objc_opt_class() cell:2 edit:0];

      id v103 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v104 = [(BTSDeviceConfigController *)self getBudFirmwareVersion:0];

      if (v104)
      {
        uint64_t v105 = [(BTSDeviceConfigController *)self getBudFirmwareVersion:0];
        [v103 setObject:v105 forKey:@"device-bud-version"];
      }
      uint64_t v106 = [(BTSDeviceConfigController *)self getCaseFirmwareVersion:0];

      unint64_t v5 = 0x1E4F28000;
      if (v106)
      {
        uint64_t v107 = [(BTSDeviceConfigController *)self getCaseFirmwareVersion:0];
        [v103 setObject:v107 forKey:@"device-case-version"];
      }
      [v102 setUserInfo:v103];
    }
    else
    {
      v102 = [v99 preferenceSpecifierNamed:v101 target:self set:0 get:sel_getBudFirmwareVersion_ detail:0 cell:4 edit:0];

      [v102 setIdentifier:@"ACCESSORY_ABOUT_VERSION_ID"];
      id v103 = [NSNumber numberWithInt:0];
      [v102 setProperty:v103 forKey:@"VERSION_TYPE"];
      unint64_t v5 = 0x1E4F28000uLL;
    }

    [v102 setProperty:MEMORY[0x1E4F1CC38] forKey:*v76];
    [(NSMutableArray *)v3 addObject:v102];
  }
  v108 = [(NSDictionary *)self->_caseInfo objectForKey:@"CaseInfoName"];
  if (v108)
  {
    v109 = (void *)MEMORY[0x1E4F92E70];
    v110 = [*(id *)(v5 + 2896) bundleForClass:objc_opt_class()];
    v111 = [v110 localizedStringForKey:@"ACCESSORY_ABOUT_CASE_NAME" value:&stru_1F4097960 table:@"DeviceConfig"];
    int v112 = [v109 preferenceSpecifierNamed:v111 target:self set:0 get:sel_getCaseName_ detail:0 cell:4 edit:0];

    [v112 setProperty:MEMORY[0x1E4F1CC38] forKey:*v76];
    [(NSMutableArray *)v3 addObject:v112];
  }
LABEL_80:
  if (_os_feature_enabled_impl())
  {
    v113 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    BOOL v114 = +[HPSProductUtils isAppleHeadphone:v113];

    if (v114)
    {
      v115 = [(BTSDeviceConfigController *)self getSystemSerialNumber:0];
      if (v115)
      {
        v116 = [(BTSDeviceConfigController *)self ndoController];

        if (!v116)
        {
          v117 = (void *)[objc_alloc(MEMORY[0x1E4F7A7A0]) initWithSerialNumber:v115];
          [(BTSDeviceConfigController *)self setNdoController:v117];
        }
        v118 = [(NSMutableArray *)v3 lastObject];
        v119 = [v118 identifier];
        v120 = [(BTSDeviceConfigController *)self ndoController];
        [v120 setSpecifierIDToInsertAfter:v119];

        v121 = [(BTSDeviceConfigController *)self ndoController];
        uint64_t v122 = [v121 specifiers];
        if (!v122) {
          goto LABEL_88;
        }
        v123 = (void *)v122;
        v124 = [(BTSDeviceConfigController *)self ndoController];
        v125 = [v124 specifiers];
        uint64_t v126 = [v125 count];

        if (v126)
        {
          v121 = [(BTSDeviceConfigController *)self ndoController];
          v127 = [v121 specifiers];
          [(NSMutableArray *)v3 addObjectsFromArray:v127];

LABEL_88:
        }
      }
    }
  }
  accessoryInfoSpecifiers = self->_accessoryInfoSpecifiers;
  self->_accessoryInfoSpecifiers = v3;
}

- (void)initializeCaseConnection
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Case Sound: failed to get the serialNumber", v2, v3, v4, v5, v6);
}

- (void)releaseCaseConnection
{
  airPodsServiceclient = self->_airPodsServiceclient;
  if (airPodsServiceclient)
  {
    [(BTAirPodsControlServiceClient *)airPodsServiceclient invalidate];
    uint64_t v4 = self->_airPodsServiceclient;
    self->_airPodsServiceclient = 0;
  }
  self->_caseSoundRetrieved = 0;
  self->_caseSoundRetrieveInProgress = 0;
}

- (void)getSoundMode
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1E4BFE000, v0, OS_LOG_TYPE_DEBUG, "Case Sound: (_caseSoundRetrieved == YES) returning", v1, 2u);
}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1576);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__BTSDeviceConfigController_getSoundMode__block_invoke_2;
  v4[3] = &unk_1E6EA8518;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v3 getSilentModeWithCompletionHandler:v4];
  objc_destroyWeak(&v6);
}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 1569) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 1570) = 0;
  if (v5)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1573) = 0;
    id v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__BTSDeviceConfigController_getSoundMode__block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1572) = a2;
    *(unsigned char *)(*(void *)(a1 + 32) + 1573) = 1;
    uint64_t v7 = *(NSObject **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __41__BTSDeviceConfigController_getSoundMode__block_invoke_3;
    v8[3] = &unk_1E6EA84F0;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    v8[4] = *(void *)(a1 + 32);
    dispatch_async(v7, v8);
    objc_destroyWeak(&v9);
  }
}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"CASE_SOUND_ID" value:&stru_1F4097960 table:@"DeviceConfig"];
  [WeakRetained reloadSpecifierID:v4 animated:1];

  id v5 = objc_loadWeakRetained(v1);
  id v6 = [v5 getGroupSpecifierForSpecifierID:@"CASE_SOUND_GROUP_ID"];
  [v6 setProperty:&stru_1F4097960 forKey:*MEMORY[0x1E4F93170]];

  id v9 = objc_loadWeakRetained(v1);
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v8 = [v7 localizedStringForKey:@"CASE_SOUND_GROUP_ID" value:&stru_1F4097960 table:@"DeviceConfig"];
  [v9 reloadSpecifierID:v8 animated:1];
}

- (id)getCaseSoundEnabled:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [NSNumber numberWithBool:self->_setCaseSoundModeInProgress];
  [v4 setProperty:v5 forKey:*MEMORY[0x1E4F930E8]];

  if (self->_setCaseSoundModeInProgress)
  {
    id v6 = NSNumber;
    p_caseSoundEnable = (unsigned __int8 *)&self->_caseSoundEnable;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F93130];
    if (self->_caseSoundSupport)
    {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v8];
      id v9 = [(BTSDeviceConfigController *)self getGroupSpecifierForSpecifierID:@"CASE_SOUND_GROUP_ID"];
      [v9 setProperty:&stru_1F4097960 forKey:*MEMORY[0x1E4F93170]];

      int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v11 = [v10 localizedStringForKey:@"CASE_SOUND_GROUP_ID" value:&stru_1F4097960 table:@"DeviceConfig"];
      [(BTSDeviceConfigController *)self reloadSpecifierID:v11 animated:1];

      uint64_t v12 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "Case Sound: Releasing case connection", (uint8_t *)v18, 2u);
      }

      [(BTSDeviceConfigController *)self releaseCaseConnection];
    }
    else
    {
      [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v8];
    }
    p_caseSoundEnable = (unsigned __int8 *)&self->_caseSoundEnable;
    self->_caseSoundEnable = !self->_caseSilentMode;
    int v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *p_caseSoundEnable;
      v18[0] = 67109120;
      v18[1] = v14;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "Case Sound: getCaseSoundEnabled %d", (uint8_t *)v18, 8u);
    }

    if (*p_caseSoundEnable) {
      uint64_t v15 = @"On";
    }
    else {
      uint64_t v15 = @"Off";
    }
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:5 value:0 featureValueString:v15];
    id v6 = NSNumber;
  }
  uint64_t v16 = [v6 numberWithBool:*p_caseSoundEnable];

  return v16;
}

- (void)setCaseSoundEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureChangeCount:4];
  [(BTSDeviceConfigController *)self initializeCaseConnection];
  self->_setCaseSoundModeInProgress = 1;
  [(BTSDeviceConfigController *)self reloadSpecifier:v7 animated:1];
  id location = 0;
  objc_initWeak(&location, self);
  int v8 = [v6 BOOLValue];
  if (v8) {
    id v9 = @"On";
  }
  else {
    id v9 = @"Off";
  }
  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFeatureValue:5 value:0 featureValueString:v9];
  int v10 = (void *)MEMORY[0x1E4F14428];
  id v11 = MEMORY[0x1E4F14428];
  uint64_t v12 = [(BTAirPodsControlServiceClient *)self->_airPodsServiceclient dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke;
  block[3] = &unk_1E6EA8590;
  block[4] = self;
  char v18 = v8 ^ 1;
  id v13 = v10;
  id v16 = v10;
  objc_copyWeak(&v17, &location);
  dispatch_async(v12, block);

  int v14 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v21 = v8;
    _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "Case Sound: setCaseSoundEnabled %d", buf, 8u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1576);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2;
  v5[3] = &unk_1E6EA8568;
  v5[4] = v2;
  char v8 = v4;
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v7, (id *)(a1 + 48));
  [v3 setSilentMode:v4 completionHandler:v5];
  objc_destroyWeak(&v7);
}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 1574) = 0;
  if (v3)
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1573) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 1572) = *(unsigned char *)(a1 + 56);
  }
  id v5 = *(NSObject **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_1768;
  v6[3] = &unk_1E6EA84F0;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6[4] = *(void *)(a1 + 32);
  dispatch_async(v5, v6);
  objc_destroyWeak(&v7);
}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_1768(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v2 = [v1 localizedStringForKey:@"CASE_SOUND_ID" value:&stru_1F4097960 table:@"DeviceConfig"];
  [WeakRetained reloadSpecifierID:v2 animated:1];
}

- (void)updateSerialNumberSpecifier:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (!v4) {
    goto LABEL_17;
  }
  id v13 = v4;
  id v5 = [v4 propertyForKey:@"SERIAL_NUMBER_TYPE"];
  uint64_t v6 = [v5 intValue];

  uint64_t v7 = (((int)v6 + 1) % 3);
  if (v7 == v6)
  {
LABEL_13:
    uint64_t v7 = v6;
    goto LABEL_16;
  }
  char v8 = &selRef_getSystemSerialNumber_;
  while (v7 == 2)
  {
    int v10 = [(BTSDeviceConfigController *)self getBudRightSerialNumber:v13];

    if (v10)
    {
      char v8 = &selRef_getBudRightSerialNumber_;
      goto LABEL_15;
    }
LABEL_12:
    uint64_t v7 = (((int)v7 + 1) % 3);
    if (v7 == v6) {
      goto LABEL_13;
    }
  }
  if (v7 != 1)
  {
    if (!v7)
    {
      id v9 = [(BTSDeviceConfigController *)self getSystemSerialNumber:v13];

      if (v9) {
        goto LABEL_15;
      }
    }
    goto LABEL_12;
  }
  id v11 = [(BTSDeviceConfigController *)self getBudLeftSerialNumber:v13];

  if (!v11) {
    goto LABEL_12;
  }
  char v8 = &selRef_getBudLeftSerialNumber_;
LABEL_15:
  *(void *)&v13[*MEMORY[0x1E4F92F38]] = *v8;
LABEL_16:
  uint64_t v12 = [NSNumber numberWithInt:v7];
  [v13 setProperty:v12 forKey:@"SERIAL_NUMBER_TYPE"];

  uint64_t v4 = v13;
LABEL_17:
}

- (void)updateVersionSpecifier:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (v4)
  {
    int v14 = v4;
    id v5 = [v4 propertyForKey:@"VERSION_TYPE"];
    LODWORD(v6) = [v5 intValue];
LABEL_3:

    do
    {
      while (1)
      {
        uint64_t v6 = (((int)v6 + 1) % 3);
        if (v6 == 1) {
          break;
        }
        if (v6 == 2)
        {
          id v5 = [(BTSDeviceConfigController *)self getANCAssetVersion:v14];
          [v5 length];
          goto LABEL_3;
        }
        if (!v6)
        {
          *(void *)&v14[*MEMORY[0x1E4F92F38]] = sel_getBudFirmwareVersion_;
          id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v10 = v9;
          id v11 = @"ACCESSORY_ABOUT_BUD_VERSION_FIRMWARE";
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(BTSDeviceConfigController *)self getCaseFirmwareVersion:v14];
      unint64_t v8 = [v7 length];
    }
    while (v8 < 2);
    *(void *)&v14[*MEMORY[0x1E4F92F38]] = sel_getCaseFirmwareVersion_;
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v10 = v9;
    id v11 = @"ACCESSORY_ABOUT_CASE_VERSION_FIRMWARE";
LABEL_11:
    uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_1F4097960 table:@"DeviceConfig"];
    [v14 setName:v12];

    id v13 = [NSNumber numberWithInt:v6];
    [v14 setProperty:v13 forKey:@"VERSION_TYPE"];

    uint64_t v4 = v14;
  }
}

- (id)getAnswerCallOption:(id)a3
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"PRESS_ONCE" value:&stru_1F4097960 table:@"FeatureConfig-CallControls"];

  return v4;
}

- (id)smartRoutingIndicationForRealityDevice:(id)a3
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SMARTROUTE_AUTOMATIC" value:&stru_1F4097960 table:@"DeviceConfig"];

  return v4;
}

- (id)getModelName:(id)a3
{
  id v3 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v4 = [v3 productId];

  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"ACCESSORY_MODEL_NAME_%d", (v4 - 0x2000));
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:v5 value:&stru_1F4097960 table:@"DeviceConfig"];

  if (v4 == 8202 || v4 == 8223)
  {
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"ACCESSORY_MODEL_NAME_10" value:&stru_1F4097960 table:@"DeviceConfig-b515"];

    uint64_t v7 = (void *)v10;
  }
  else if (v4 == 8208)
  {
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v12 = v11;
    id v13 = @"ACCESSORY_MODEL_NAME_16";
    int v14 = @"DeviceConfig-B372";
LABEL_27:
    uint64_t v18 = [v11 localizedStringForKey:v13 value:&stru_1F4097960 table:v14];

    uint64_t v7 = (void *)v18;
    goto LABEL_28;
  }
  switch(v4)
  {
    case 8209:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_17";
      int v14 = @"DeviceConfig-B507";
      goto LABEL_27;
    case 8210:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_18";
      int v14 = @"DeviceConfig-B494";
      goto LABEL_27;
    case 8211:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_19";
      int v14 = @"DeviceConfig-B688";
      goto LABEL_27;
    case 8212:
    case 8228:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_20";
      int v14 = @"DeviceConfig-B698";
      goto LABEL_27;
    case 8214:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_22";
      int v14 = @"DeviceConfig-B607";
      goto LABEL_27;
    case 8215:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_23";
      int v14 = @"DeviceConfig-B453";
      goto LABEL_27;
    case 8217:
    case 8222:
      uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v16 = [v15 localizedStringForKey:@"ACCESSORY_MODEL_NAME_25" value:&stru_1F4097960 table:@"DeviceConfig-B768"];

      uint64_t v7 = (void *)v16;
      break;
    case 8218:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_26";
      int v14 = @"DeviceConfig-B487";
      goto LABEL_27;
    case 8221:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_42";
      int v14 = @"DeviceConfig-B498-v2";
      goto LABEL_27;
    case 8229:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_24";
      int v14 = @"DeviceConfig-B465";
      goto LABEL_27;
    case 8230:
      id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = v11;
      id v13 = @"ACCESSORY_MODEL_NAME_38";
      int v14 = @"DeviceConfig-B463";
      goto LABEL_27;
    default:
      break;
  }
  if (v4 == 8224 || v4 == 8219)
  {
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v12 = v11;
    id v13 = @"ACCESSORY_MODEL_NAME_27";
    int v14 = @"DeviceConfig-B768";
    goto LABEL_27;
  }
LABEL_28:
  if ((unint64_t)[v7 length] <= 1) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v7;
  }
  id v20 = v19;

  return v20;
}

- (id)getModelNumber:(id)a3
{
  id v3 = [(NSArray *)self->_versionInfo objectAtIndex:1];
  int v4 = [v3 stringByApplyingTransform:@"Any-Hex/Java" reverse:1];

  if ((unint64_t)[v4 length] <= 1) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)getSystemSerialNumber:(id)a3
{
  id v3 = [(NSArray *)self->_versionInfo objectAtIndex:3];
  int v4 = [v3 stringByApplyingTransform:@"Any-Hex/Java" reverse:1];

  if ((unint64_t)[v4 length] <= 1) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)getBudLeftSerialNumber:(id)a3
{
  id v3 = [(NSArray *)self->_versionInfo objectAtIndex:8];
  int v4 = [v3 stringByApplyingTransform:@"Any-Hex/Java" reverse:1];

  if ((unint64_t)[v4 length] < 2)
  {
    unint64_t v8 = 0;
  }
  else
  {
    id v5 = NSString;
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"ACCESSORY_ABOUT_SERIAL_NUMBER_LEFT" value:&stru_1F4097960 table:@"DeviceConfig"];
    unint64_t v8 = [v5 stringWithFormat:@"%@%@", v7, v4];
  }

  return v8;
}

- (id)getBudRightSerialNumber:(id)a3
{
  id v3 = [(NSArray *)self->_versionInfo objectAtIndex:9];
  int v4 = [v3 stringByApplyingTransform:@"Any-Hex/Java" reverse:1];

  if ((unint64_t)[v4 length] < 2)
  {
    unint64_t v8 = 0;
  }
  else
  {
    id v5 = NSString;
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"ACCESSORY_ABOUT_SERIAL_NUMBER_RIGHT" value:&stru_1F4097960 table:@"DeviceConfig"];
    unint64_t v8 = [v5 stringWithFormat:@"%@%@", v7, v4];
  }

  return v8;
}

- (id)getBudFirmwareVersion:(id)a3
{
  id v3 = [(NSArray *)self->_versionInfo objectAtIndex:10];
  int v4 = [v3 stringByApplyingTransform:@"Any-Hex/Java" reverse:1];

  if ((unint64_t)[v4 length] <= 1) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)getANCAssetVersion:(id)a3
{
  id v3 = [(NSString *)self->_ancAssetVersion stringByApplyingTransform:@"Any-Hex/Java" reverse:1];
  if ((unint64_t)[v3 length] <= 1) {
    int v4 = 0;
  }
  else {
    int v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)getCaseName:(id)a3
{
  id v3 = [(NSDictionary *)self->_caseInfo objectForKey:@"CaseInfoName"];
  int v4 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 1);
  int v5 = [v4 isEqualToString:@""]);

  uint64_t v6 = [v3 length];
  if (v5)
  {
    uint64_t v7 = [v3 substringToIndex:v6 - 6];
    unint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"CASE" value:&stru_1F4097960 table:@"DeviceConfig"];
    [v7 stringByAppendingFormat:@"(%@)", v9];
  }
  else
  {
    uint64_t v7 = [v3 substringToIndex:v6 - 4];
    unint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"CASE" value:&stru_1F4097960 table:@"DeviceConfig"];
    [v7 stringByAppendingFormat:@"%@", v9];
  uint64_t v10 = };

  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v10 length] >= 2)
  {
    id v11 = [v10 stringByApplyingTransform:@"Any-Hex/Java" reverse:1];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)getCaseFirmwareVersion:(id)a3
{
  id v3 = [(NSDictionary *)self->_caseInfo objectForKey:@"CaseInfoVersion"];
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v3 length] >= 2)
  {
    int v4 = [v3 stringByApplyingTransform:@"Any-Hex/Java" reverse:1];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BTSDeviceConfigController;
  id v4 = a3;
  [(BTSDeviceConfigController *)&v15 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 userInterfaceStyle];

  uint64_t v6 = [(BTSDeviceConfigController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    unint64_t v8 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    if (+[HPSProductUtils isAppleHeadphone:v8])
    {
      id v9 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
      char v10 = [v9 isTemporaryPaired];

      if ((v10 & 1) == 0)
      {
        id v11 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
        int v12 = [v11 isGenuineAirPods];

        if (v12)
        {
          batteryStatusView = self->_batteryStatusView;
          if (batteryStatusView)
          {
            self->_batteryStatusView = 0;
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__BTSDeviceConfigController_traitCollectionDidChange___block_invoke;
          block[3] = &unk_1E6EA82F0;
          block[4] = self;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
    }
    else
    {
    }
  }
}

uint64_t __54__BTSDeviceConfigController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBatteryStatus];
}

- (void)updateASKHeader
{
}

- (id)classicSetupSpecifiers
{
  v28[4] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v3 = [(BTSDeviceConfigController *)self leDevice];
    id v4 = v3;
    if (v3
      && ([v3 isManagedByDeviceAccess]
       && ([v4 shouldDenyIncomingClassicConnection] & 1) != 0
       || self->_devicePendingCTKDConnection))
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v7 = objc_msgSend(v6, "localizedStringForKey:value:table:", &stru_1F4097960, &stru_1F4097960);
      uint64_t v26 = [v5 groupSpecifierWithID:v7];

      unint64_t v8 = (void *)MEMORY[0x1E4F92E70];
      id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v10 = [v9 localizedStringForKey:@"CLASSIC_SETUP_TITLE" value:&stru_1F4097960 table:@"DeviceConfig"];
      id v11 = [v8 preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:4 edit:0];

      [v11 setIdentifier:@"CLASSIC_SETUP_TITLE_ID"];
      int v12 = (void *)MEMORY[0x1E4F92E70];
      id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v14 = [v13 localizedStringForKey:@"CLASSIC_SETUP_BODY" value:&stru_1F4097960 table:@"DeviceConfig"];
      objc_super v15 = [v12 preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

      [v15 setIdentifier:@"CLASSIC_SETUP_BODY_ID"];
      [v15 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
      uint64_t v16 = (void *)MEMORY[0x1E4F92E70];
      BOOL devicePendingCTKDConnection = self->_devicePendingCTKDConnection;
      uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v19 = v18;
      if (devicePendingCTKDConnection) {
        id v20 = @"CLASSIC_SETUP_BUTTON_CONNECTING";
      }
      else {
        id v20 = @"CLASSIC_SETUP_BUTTON";
      }
      int v21 = [v18 localizedStringForKey:v20 value:&stru_1F4097960 table:@"DeviceConfig"];
      uint64_t v22 = [v16 preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v22 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
      [v22 setButtonAction:sel_allowClassicConnection];
      [v22 setIdentifier:@"CLASSIC_SETUP_BUTTON_ID"];
      BOOL v23 = [NSNumber numberWithInt:!self->_devicePendingCTKDConnection];
      [v22 setProperty:v23 forKey:*MEMORY[0x1E4F93130]];

      v28[0] = v26;
      v28[1] = v11;
      v28[2] = v15;
      v28[3] = v22;
      BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];

      goto LABEL_13;
    }
  }
  else
  {
    id v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", buf, 2u);
    }
  }
  BOOL v24 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_13:

  return v24;
}

- (void)updateBatteryStatus
{
}

- (void)getFindMyUrl
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Invalid device address. Using default FindMy URL", v2, v3, v4, v5, v6);
}

- (void)spatialAudioProfileUpdateHandler:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__BTSDeviceConfigController_spatialAudioProfileUpdateHandler___block_invoke;
  block[3] = &unk_1E6EA82F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__BTSDeviceConfigController_spatialAudioProfileUpdateHandler___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) headphoneObserver];
  [v1 reloadAll];
}

- (void)triggerSpatialProfileFeedback:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feedback: Received Enrollment Not Completed Notification", (uint8_t *)&v17, 2u);
  }

  CFPreferencesAppSynchronize(@"com.apple.springboard");
  CFPreferencesCopyAppValue(@"LastSpatialProfileFeedbackDate", @"com.apple.springboard");
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setDateFormat:@"yyyyMMdd"];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v8 = [v6 stringFromDate:v7];

  int v9 = MGGetBoolAnswer();
  BOOL v10 = v9 && (!v5 || ([(__CFString *)v8 isEqualToString:v5] & 1) == 0);
  id v11 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = @"Null";
    if (v5) {
      int v12 = v5;
    }
    int v17 = 138413058;
    uint64_t v18 = v12;
    if (v9) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    if (v10) {
      int v14 = @"YES";
    }
    else {
      int v14 = @"NO";
    }
    __int16 v23 = 2112;
    BOOL v24 = v14;
    _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feedback: Last Feedback Date: %@, Current Feedback Date: %@, Internal Build: %@, Show Feedback: %@", (uint8_t *)&v17, 0x2Au);
  }

  if (v10)
  {
    objc_super v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feedback: Trigger feedback and update date: %@", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v16 = +[HPSSpatialProfileFeedback getDraftViewController];
    [(BTSDeviceConfigController *)self presentViewController:v16 animated:1 completion:0];
    CFPreferencesSetAppValue(@"LastSpatialProfileFeedbackDate", v8, @"com.apple.springboard");
    CFPreferencesAppSynchronize(@"com.apple.springboard");
  }
}

- (BOOL)supportsFirmwareReleaseNotes
{
  uint64_t v2 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
  int v3 = [v2 productId];

  return ((v3 - 8202) < 0x1B) & (0x4728631u >> (v3 - 10));
}

- (BOOL)shouldShowFindMyNetworkAlert
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (+[HPSProductUtils isRealityDevice])
  {
    int v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Find My Network: returning, feature not supported on this platform", (uint8_t *)&v12, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v5 = [(BluetoothDeviceProtocol *)self->_device classicDevice];
    BOOL v6 = +[HPSProductUtils isFeatureSupported:0 byDevice:v5];

    BOOL v4 = 0;
    if (v6) {
      BOOL v4 = !self->_findMySupport;
    }
    int v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = "No";
      if (v4) {
        unint64_t v8 = "Yes";
      }
      else {
        unint64_t v8 = "No";
      }
      BOOL findMySupport = self->_findMySupport;
      if (v6) {
        BOOL v10 = "Yes";
      }
      else {
        BOOL v10 = "No";
      }
      int v12 = 136315650;
      id v13 = v8;
      __int16 v14 = 2080;
      if (findMySupport) {
        uint64_t v7 = "Yes";
      }
      objc_super v15 = v10;
      __int16 v16 = 2080;
      int v17 = v7;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Find My Network: Should Show Alert: %s, Feature: %s, Support: %s", (uint8_t *)&v12, 0x20u);
    }
  }

  return v4;
}

- (void)showFindMyNetworkAlert
{
  int v3 = (void *)MEMORY[0x1E4FB1418];
  BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"FIND_MY_NETWORK_ALERT_TITLE" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
  BOOL v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"FIND_MY_NETWORK_ALERT_DESC" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
  id v16 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  unint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v10 = [v9 localizedStringForKey:@"OK" value:&stru_1F4097960 table:@"DeviceConfig"];
  id v11 = [v8 actionWithTitle:v10 style:0 handler:&__block_literal_global_1896];

  int v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v14 = [v13 localizedStringForKey:@"IMPORTANT_MSG_LEARN_MORE" value:&stru_1F4097960 table:@"DeviceConfig"];
  objc_super v15 = [v12 actionWithTitle:v14 style:0 handler:&__block_literal_global_1898];

  [v16 addAction:v11];
  [v16 addAction:v15];
  [v16 setPreferredAction:v11];
  [(BTSDeviceConfigController *)self presentViewController:v16 animated:1 completion:0];
}

void __51__BTSDeviceConfigController_showFindMyNetworkAlert__block_invoke_2()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht210982?cid=mc-ols-find-my-article_ht210982-settings_ui-07122023"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  os_log_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openURL:v1 withOptions:0];
}

- (void)hearingModeUpdated
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__BTSDeviceConfigController_hearingModeUpdated__block_invoke;
  block[3] = &unk_1E6EA82F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__BTSDeviceConfigController_hearingModeUpdated__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) headphoneObserver];
  [v1 reloadAll];
}

- (void)presentEnrollmentViewController
{
  id v4 = [(BTSDeviceConfigController *)self hearingModeUIService];
  int v3 = [v4 enrollmentViewController];
  [(BTSDeviceConfigController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)presentTuningViewController
{
  id v4 = [(BTSDeviceConfigController *)self hearingModeUIService];
  int v3 = [v4 tuningViewController];
  [(BTSDeviceConfigController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)presentViewController:(id)a3
{
}

- (id)device
{
  return self->_device;
}

- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)headphoneObserver
{
  headphoneObserver = self->_headphoneObserver;
  if (!headphoneObserver)
  {
    id v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
    uint64_t v5 = +[HPSDevice deviceKey];
    BOOL v6 = [v4 objectForKeyedSubscript:v5];

    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v7 = [_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver alloc];
    unint64_t v8 = [v6 headphoneDevice];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    _DWORD v14[2] = __46__BTSDeviceConfigController_headphoneObserver__block_invoke;
    v14[3] = &unk_1E6EA8340;
    objc_copyWeak(&v15, &location);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __46__BTSDeviceConfigController_headphoneObserver__block_invoke_1900;
    v12[3] = &unk_1E6EA8340;
    objc_copyWeak(&v13, &location);
    int v9 = [(BTSHeadphoneDevicePropertyObserver *)v7 initWithDevice:v8 onChangeAction:v14 onChangeReloadAllAction:v12];
    BOOL v10 = self->_headphoneObserver;
    self->_headphoneObserver = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    headphoneObserver = self->_headphoneObserver;
  }

  return headphoneObserver;
}

void __46__BTSDeviceConfigController_headphoneObserver__block_invoke(uint64_t a1)
{
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Headphone Config: Reload observed specifiers for value change", v7, 2u);
  }

  int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained reloadSpecifierID:@"LISTENING_MODE_ID"];

  id v5 = objc_loadWeakRetained(v3);
  [v5 reloadSpecifierID:@"SPEECH_DETECTION_ID"];

  id v6 = objc_loadWeakRetained(v3);
  [v6 reloadSpecifierID:@"ADAPTIVE_VOLUME_ID"];
}

void __46__BTSDeviceConfigController_headphoneObserver__block_invoke_1900(uint64_t a1)
{
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Headphone Config: Reload all specifiers for value change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (CRPairedVehicleManager)vehicleManager
{
  return self->_vehicleManager;
}

- (void)setVehicleManager:(id)a3
{
}

- (CRCarPlayPreferences)carplayPreferences
{
  return self->_carplayPreferences;
}

- (void)setCarplayPreferences:(id)a3
{
}

- (unint64_t)cachedCarplayPairingStatus
{
  return self->_cachedCarplayPairingStatus;
}

- (void)setCachedCarplayPairingStatus:(unint64_t)a3
{
  self->_cachedCarplayPairingStatus = a3;
}

- (PowerUISmartChargeClientAudioAccessories)smartChargeClient
{
  return self->_smartChargeClient;
}

- (void)setSmartChargeClient:(id)a3
{
}

- (NDOACController)ndoController
{
  return self->_ndoController;
}

- (void)setNdoController:(id)a3
{
}

- (void)setHeadphoneObserver:(id)a3
{
}

- (PSTableCell)listeningModeCell
{
  return self->_listeningModeCell;
}

- (void)setListeningModeCell:(id)a3
{
}

- (void)setHearingModeUIService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hearingModeUIService, 0);
  objc_storeStrong((id *)&self->_listeningModeCell, 0);
  objc_storeStrong((id *)&self->_headphoneObserver, 0);
  objc_storeStrong((id *)&self->_ndoController, 0);
  objc_storeStrong((id *)&self->_smartChargeClient, 0);
  objc_storeStrong((id *)&self->_carplayPreferences, 0);
  objc_storeStrong((id *)&self->_vehicleManager, 0);
  objc_storeStrong((id *)&self->_adaptiveStrength, 0);
  objc_storeStrong((id *)&self->_accessoryHeaderController, 0);
  objc_storeStrong((id *)&self->_deviceAnalytics, 0);
  objc_storeStrong((id *)&self->_airPodsServiceclient, 0);
  objc_storeStrong((id *)&self->_findMyUrl, 0);
  objc_storeStrong((id *)&self->_batteryStatusView, 0);
  objc_storeStrong((id *)&self->_ctkdLeDevice, 0);
  objc_storeStrong((id *)&self->_lastSelectedSyncGroup, 0);
  objc_storeStrong((id *)&self->_deviceTypeSpecifiers, 0);
  objc_storeStrong((id *)&self->_accessoryInfoSpecifiers, 0);
  objc_storeStrong((id *)&self->_nameControlSpecifiers, 0);
  objc_storeStrong((id *)&self->_ancsControlSpecifiers, 0);
  objc_storeStrong((id *)&self->_accessoryFirmwareSpecifiers, 0);
  objc_storeStrong((id *)&self->_aacpControlSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncGroupsSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncContactsSpecifiers, 0);
  objc_storeStrong((id *)&self->_messagingSpecifiers, 0);
  objc_storeStrong((id *)&self->_controlGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_caseInfo, 0);
  objc_storeStrong((id *)&self->_ancAssetVersion, 0);
  objc_storeStrong((id *)&self->_versionInfo, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)handleTapOnLabel
{
  uint64_t v2 = self;
  sub_1E4C8D1E4();
}

- (NSArray)b498Specifiers
{
  uint64_t v2 = self;
  BTSDeviceConfigController.b498Specifiers.getter();

  sub_1E4C7EA5C(0, &qword_1EAE8D880);
  int v3 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  BTSDeviceConfigController.removeTopLevelEntry(hpDevice:)();
}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _sSo25BTSDeviceConfigControllerC16HeadphoneConfigsE19updateTopLevelEntry8hpDevicey0D7Manager0dK0C_tF_0();
}

- (BOOL)adaptiveVolumeSupported
{
  uint64_t v2 = self;
  char v3 = BTSDeviceConfigController.adaptiveVolumeSupported.getter();

  return v3 & 1;
}

- (BOOL)conversationDetectSupported
{
  uint64_t v2 = self;
  char v3 = BTSDeviceConfigController.conversationDetectSupported.getter();

  return v3 & 1;
}

- (BOOL)supportAutoAncStrength
{
  uint64_t v2 = self;
  id v3 = [(BTSDeviceConfigController *)v2 device];
  char v4 = (char)v3;
  if (v3)
  {
    id v5 = (BTSDeviceConfigController *)sub_1E4C93630();
    swift_unknownObjectRelease();
    if (v5)
    {
      char v4 = sub_1E4CBEB30();

      uint64_t v2 = v5;
    }
    else
    {
      char v4 = 0;
    }
  }

  return v4 & 1;
}

- (BOOL)shouldShowCaseSoundForNewAccessories:(id)a3 productID:(int64_t)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  sub_1E4CBF550();
  swift_unknownObjectRelease();
  LOBYTE(a4) = sub_1E4C94334((uint64_t)v8, a4);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return a4 & 1;
}

- (BOOL)shouldShowLoudSoundReduction
{
  uint64_t v2 = self;
  char v3 = sub_1E4C93EC8();

  return v3 & 1;
}

- (NSArray)turnOffListeningModeSpecifiers
{
  uint64_t v2 = self;
  BTSDeviceConfigController.turnOffListeningModeSpecifiers.getter();

  sub_1E4C7EA5C(0, &qword_1EAE8D880);
  char v3 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)deviceSupportsSync:.cold.1()
{
}

- (void)setUserSelectedDeviceType:(void *)a1 .cold.1(void *a1)
{
  [a1 intValue];
  OUTLINED_FUNCTION_5(&dword_1E4BFE000, v1, v2, "Failed to set device type to set device type to %d", v3, v4, v5, v6, 0);
}

- (void)doubleTapActionLeft
{
  uint64_t v1 = [NSNumber numberWithInteger:*a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1E4BFE000, v2, v3, "Double tap action left : %@", v4, v5, v6, v7, v8);
}

- (void)doubleTapActionRight
{
  uint64_t v1 = [NSNumber numberWithInteger:*a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1E4BFE000, v2, v3, "Double tap action right : %@", v4, v5, v6, v7, v8);
}

- (void)setGestureMode:(id *)a1 specifier:.cold.1(id *a1)
{
  uint64_t v1 = [*a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1E4BFE000, v2, v3, "Cannot set gesture mode for device %@ with specifier : %@", v4, v5, v6, v7, v8);
}

- (void)optimizedBatteryChargingEnabled
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Unable to fetch smart charging status for accessory with error %@", v2, v3, v4, v5, v6);
}

- (void)setOptimizedBatteryChargingEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "PowerUIClient is NULL. Cannot set OBC", v2, v3, v4, v5, v6);
}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Failed to disable smart charging: %@", v2, v3, v4, v5, v6);
}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_771_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Failed to temporarily disable smart charging: %@", v2, v3, v4, v5, v6);
}

- (void)sealDetect
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "SealDetect : getter", v2, v3, v4, v5, v6);
}

- (void)sealDetectSet:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "SealDetect : setter", v2, v3, v4, v5, v6);
}

void __48__BTSDeviceConfigController_refreshFindMyStatus__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = "Yes";
  __int16 v5 = 1024;
  int v6 = [a1 code];
  _os_log_error_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_ERROR, "FindMy Status: Fetch Completed: Error: %s, Error code: %d", (uint8_t *)&v3, 0x12u);
}

- (void)setFindMyEnable:specifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "FindMy Status: Invalid Address, Cannot Set", v2, v3, v4, v5, v6);
}

- (void)setFindMyEnable:specifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "FindMy Status: Invalid Address Data, Cannot Set", v2, v3, v4, v5, v6);
}

- (void)setFindMyEnable:specifier:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "FindMy Status: Invalid Incoming Value, Cannot Set", v2, v3, v4, v5, v6);
}

- (void)setFindMyEnable:specifier:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "FindMy Status: Invalid Hex Address, Cannot Set", v2, v3, v4, v5, v6);
}

void __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_5(&dword_1E4BFE000, v1, v2, "FindMy Status: Set Error code: %d", v3, v4, v5, v6, 0);
}

- (void)listeningModeConfigSelected:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Invalid listening mode configuration. Early return", v2, v3, v4, v5, v6);
}

- (void)specifiers
{
  uint64_t v3 = [a1 debugDescription];
  uint64_t v4 = [*a2 userInfo];
  id v11 = [v4 objectForKeyedSubscript:@"HPS_DeviceInfo"];
  OUTLINED_FUNCTION_6(&dword_1E4BFE000, v5, v6, "HeadphoneConfigs: BTSDeviceClassic does not have undlyering device! Popping user back and reloading TopLevel %@ %@", v7, v8, v9, v10, 2u);
}

- (void)adaptiveVolumeMode
{
}

- (void)nicknameEnabled
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 1384);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_DEBUG, "Majestic Enabled - %@", (uint8_t *)&v3, 0xCu);
}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Case Sound: getSilentModeWithCompletionHandler failed due to %@", v2, v3, v4, v5, v6);
}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Case Sound: setSilentMode failed due to %@", v2, v3, v4, v5, v6);
}

@end