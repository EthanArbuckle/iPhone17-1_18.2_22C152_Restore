@interface FTDeviceSupport
+ (id)marketingNameForDeviceType:(int64_t)a3;
+ (id)sharedInstance;
- (BOOL)SIMInserted;
- (BOOL)_enoughPowerToSupportEffects;
- (BOOL)_legacy_supportsSMSIdentification;
- (BOOL)accountModificationRestricted;
- (BOOL)callingAvailable;
- (BOOL)callingBlocked;
- (BOOL)callingSupported;
- (BOOL)commCenterDead;
- (BOOL)conferencingAllowed;
- (BOOL)conferencingBlocked;
- (BOOL)conferencingEnabled;
- (BOOL)faceTimeAvailable;
- (BOOL)iMessageAvailable;
- (BOOL)identityServicesSupported;
- (BOOL)inProcess_isCallingSupported;
- (BOOL)isC2KEquipment;
- (BOOL)isGreenTea;
- (BOOL)isInDualPhoneIdentityMode;
- (BOOL)isInMultiUserMode;
- (BOOL)isTelephonyDevice;
- (BOOL)lowRAMDevice;
- (BOOL)madridAvailable;
- (BOOL)madridBlocked;
- (BOOL)madridSupported;
- (BOOL)mmsConfigured;
- (BOOL)multiwayAvailable;
- (BOOL)multiwayBlocked;
- (BOOL)multiwaySupported;
- (BOOL)nonBluetoothAvailableForBundleId:(id)a3;
- (BOOL)nonWifiAvailableForBundleId:(id)a3;
- (BOOL)nonWifiCallingAvailable;
- (BOOL)nonWifiFaceTimeAvailable;
- (BOOL)registrationSupported;
- (BOOL)slowCPUDevice;
- (BOOL)supportsAnimojiV2;
- (BOOL)supportsAppleIDIdentification;
- (BOOL)supportsApplePay;
- (BOOL)supportsBackFacingCamera;
- (BOOL)supportsCellularData;
- (BOOL)supportsCinematicFraming;
- (BOOL)supportsEmojiImages;
- (BOOL)supportsFMDV2;
- (BOOL)supportsFriendingViaPush;
- (BOOL)supportsFrontFacingCamera;
- (BOOL)supportsFunCam;
- (BOOL)supportsHDRdecoding;
- (BOOL)supportsHEIFEncoding;
- (BOOL)supportsHandoff;
- (BOOL)supportsHarmony;
- (BOOL)supportsHomeKitResident;
- (BOOL)supportsKeySharing;
- (BOOL)supportsMMS;
- (BOOL)supportsManateeActivitySharing;
- (BOOL)supportsManateeForAppleCash;
- (BOOL)supportsNonWiFiFaceTime;
- (BOOL)supportsRegionForAppleCash;
- (BOOL)supportsSMS;
- (BOOL)supportsSMSIdentification;
- (BOOL)supportsSimultaneousVoiceAndDataRightNow;
- (BOOL)supportsStewie;
- (BOOL)supportsTethering;
- (BOOL)supportsUWB;
- (BOOL)supportsVenice;
- (BOOL)supportsWLAN;
- (BOOL)supportsWiFi;
- (BOOL)supportsZelkova;
- (BOOL)wantsBreakBeforeMake;
- (BOOL)wifiAllowedForBundleId:(id)a3;
- (FTDeviceSupport)init;
- (NSDictionary)CTNetworkInformation;
- (NSDictionary)telephonyCapabilities;
- (NSString)deviceColor;
- (NSString)deviceIDPrefix;
- (NSString)deviceInformationString;
- (NSString)deviceName;
- (NSString)deviceRegionInfo;
- (NSString)deviceTypeIDPrefix;
- (NSString)enclosureColor;
- (NSString)model;
- (NSString)productBuildVersion;
- (NSString)productName;
- (NSString)productOSVersion;
- (NSString)productVersion;
- (NSString)telephoneNumber;
- (NSString)userAgentString;
- (id)_serviceStatus;
- (id)registrationState;
- (int)cpuFamily;
- (int64_t)deviceType;
- (int64_t)memorySize;
- (int64_t)performanceClass;
- (void)_commCenterAlive;
- (void)_handleCarrierSettingsChanged;
- (void)_handlePotentialPhoneNumberRegistrationStateChanged;
- (void)_handleSIMStatusChangedToStatus:(id)a3;
- (void)_initializeSIMInsertedCachedValue;
- (void)_invalidateValuesCachedForSelectedPhoneNumberRegistration;
- (void)_lockdownStateChanged:(id)a3;
- (void)_registerForCapabilityNotifications;
- (void)_registerForCarrierNotifications;
- (void)_registerForCommCenterReadyNotifications;
- (void)_registerForInternalCoreTelephonyNotifications;
- (void)_registerForLockdownNotifications;
- (void)_registerForManagedConfigurationNotifications;
- (void)_registerForServiceStatusNotifications;
- (void)_unregisterForCommCenterReadyNotifications;
- (void)_unregisterForManagedConfigurationNotifications;
- (void)_unregisterForServiceStatusNotifications;
- (void)_updateCTNetworkDictionary:(id)a3 key:(id)a4 withTelephonyNetworkValue:(id)a5 telephonyError:(id)a6;
- (void)_updateCapabilities;
- (void)_updateManagedConfigurationSettings;
- (void)carrierBundleChange:(id)a3;
- (void)dealloc;
- (void)noteSelectedPhoneNumberRegistrationSubscriptionDidChange;
- (void)operatorBundleChange:(id)a3;
- (void)phoneNumberChanged:(id)a3;
- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)supportsStewieWithCompletion:(id)a3;
@end

@implementation FTDeviceSupport

- (void)_registerForManagedConfigurationNotifications
{
  v3 = (void *)MEMORY[0x1AD0D4F50](@"MCProfileConnection", @"ManagedConfiguration");
  objc_msgSend_sharedConnection(v3, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObserver_(v7, v6, (uint64_t)self);
}

- (void)_registerForCarrierNotifications
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Registering %@ for carrier changes", (uint8_t *)&v9, 0xCu);
  }

  if (self->_supportsSMS)
  {
    objc_msgSend__unregisterForCommCenterReadyNotifications(self, v5, v6);
    objc_msgSend__registerForCommCenterReadyNotifications(self, v7, v8);
  }
}

- (void)_unregisterForCommCenterReadyNotifications
{
  if (self->_supportsSMS)
  {
    v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Unregistering for comm center launch", v6, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F23D50], 0);
  }
}

- (void)_registerForLockdownNotifications
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Registering %@ for lockdown changes", (uint8_t *)&v9, 0xCu);
  }

  id v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6);
  objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)self, sel__lockdownStateChanged_, *MEMORY[0x1E4F6C1E0], 0);
}

- (void)_registerForCommCenterReadyNotifications
{
  if (self->_supportsSMS)
  {
    v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Registering for comm center launch", v6, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1A7BCEA2C, (CFStringRef)*MEMORY[0x1E4F23D50], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (NSString)telephoneNumber
{
  if (objc_msgSend_isTelephonyDevice(self, a2, v2)
    && objc_msgSend_isTelephonyDevice(self, v4, v5))
  {
    number = self->_number;
    if (number)
    {
      uint64_t v8 = number;
    }
    else
    {
      v10 = objc_msgSend_selectedRegistrationPhoneNumberWithError_(self->_selectedPNRSubscription, v6, 0);
      if (v10)
      {
        uint64_t v11 = IMInternationalForPhoneNumberWithOptions();
        if (objc_msgSend_length(v11, v12, v13))
        {
          id v14 = v11;

          v10 = v14;
        }
      }
      v15 = self->_number;
      self->_number = (NSString *)v10;
      id v16 = v10;

      uint64_t v8 = self->_number;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isTelephonyDevice
{
  return self->_supportsSMS;
}

- (FTDeviceSupport)init
{
  v20.receiver = self;
  v20.super_class = (Class)FTDeviceSupport;
  uint64_t v2 = [(FTDeviceSupport *)&v20 init];
  v3 = v2;
  if (v2)
  {
    v2->_blockPost = 1;
    v2->_simBecameNotReady = 0;
    id v4 = objc_alloc(MEMORY[0x1E4F23A80]);
    uint64_t v5 = im_primary_queue();
    uint64_t v7 = objc_msgSend_initWithQueue_(v4, v6, (uint64_t)v5);
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = (CoreTelephonyClient *)v7;

    if (!v3->_coreTelephonyClient)
    {
      uint64_t v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1A7BFDDCC();
      }
    }
    uint64_t v12 = objc_msgSend_sharedInstance(FTSelectedPNRSubscription, v9, v10);
    selectedPNRSubscription = v3->_selectedPNRSubscription;
    v3->_selectedPNRSubscription = (FTSelectedPNRSubscription *)v12;

    v3->_simInserted = -1;
    objc_msgSend__updateCapabilities(v3, v14, v15);
    objc_msgSend__updateManagedConfigurationSettings(v3, v16, v17);
    v3->_blockPost = 0;
    v3->_isPNRSupportedCachedValue = -1;
    v3->_performanceClass = -1;
    v19 = v3;
    im_dispatch_after_primary_queue();
  }
  return v3;
}

- (void)_updateManagedConfigurationSettings
{
  v3 = (void *)MEMORY[0x1AD0D54C0](self, a2);
  if (!qword_1EB47C7D8)
  {
    id v4 = (void **)MEMORY[0x1AD0D4F60]("MCFeatureVideoConferencingAllowed", @"ManagedConfiguration");
    if (v4) {
      uint64_t v5 = *v4;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C7D8, v5);
  }
  if (!qword_1EB47C7E0)
  {
    uint64_t v6 = (void **)MEMORY[0x1AD0D4F60]("MCFeatureAudioConferencingAllowed", @"ManagedConfiguration");
    if (v6) {
      uint64_t v7 = *v6;
    }
    else {
      uint64_t v7 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C7E0, v7);
  }
  if (!qword_1EB47C7E8)
  {
    uint64_t v8 = (void **)MEMORY[0x1AD0D4F60]("MCFeatureChatAllowed", @"ManagedConfiguration");
    if (v8) {
      int v9 = *v8;
    }
    else {
      int v9 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C7E8, v9);
  }
  if (!qword_1EB47C7F0)
  {
    uint64_t v10 = (void **)MEMORY[0x1AD0D4F60]("MCFeatureAccountModificationAllowed", @"ManagedConfiguration");
    if (v10) {
      uint64_t v11 = *v10;
    }
    else {
      uint64_t v11 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C7F0, v11);
  }
  if (qword_1EB47C808 != -1) {
    dispatch_once(&qword_1EB47C808, &unk_1EFE077C0);
  }
  pthread_mutex_lock(&stru_1EB47C660);
  int iMessageBlocked = self->_iMessageBlocked;
  int faceTimeBlocked = self->_faceTimeBlocked;
  int accountModificationRestricted = self->_accountModificationRestricted;
  uint64_t v17 = objc_msgSend_sharedConnection((void *)qword_1EB47C7F8, v15, v16);
  v19 = v17;
  if (qword_1EB47C7E8) {
    BOOL v20 = objc_msgSend_effectiveBoolValueForSetting_(v17, v18, qword_1EB47C7E8) == 2;
  }
  else {
    BOOL v20 = 0;
  }
  self->_int iMessageBlocked = v20;
  if (qword_1EB47C7D8) {
    BOOL v21 = objc_msgSend_effectiveBoolValueForSetting_(v19, v18, qword_1EB47C7D8) == 2;
  }
  else {
    BOOL v21 = 0;
  }
  self->_int faceTimeBlocked = v21;
  self->_int accountModificationRestricted = objc_msgSend_effectiveBoolValueForSetting_(v19, v18, qword_1EB47C7F0) == 2;
  v24 = objc_msgSend_sharedManager((void *)qword_1EB47C800, v22, v23);
  objc_msgSend_invalidateRestrictions(v24, v25, v26);

  v29 = objc_msgSend_sharedManager((void *)qword_1EB47C800, v27, v28);
  objc_msgSend_invalidateSettings(v29, v30, v31);

  int v32 = self->_iMessageBlocked;
  int v33 = self->_faceTimeBlocked;
  int v34 = self->_accountModificationRestricted;
  pthread_mutex_unlock(&stru_1EB47C660);
  if ((iMessageBlocked != v32 || faceTimeBlocked != v33 || accountModificationRestricted != v34) && !self->_blockPost)
  {
    v37 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v35, v36);
    objc_msgSend___mainThreadPostNotificationName_object_(v37, v38, @"__kFaceTimeDeviceRestictionsChangedNotification", 0);
  }
}

+ (id)sharedInstance
{
  if (qword_1EB47C898 != -1) {
    dispatch_once(&qword_1EB47C898, &unk_1EFE07840);
  }
  uint64_t v2 = (void *)qword_1EB47C850;

  return v2;
}

- (void)_updateCapabilities
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = pthread_mutex_lock(&stru_1EB47C6A0);
  context = (void *)MEMORY[0x1AD0D54C0](v3);
  uint64_t v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v6, OS_LOG_TYPE_DEFAULT, "Updating GS Capabilities", buf, 2u);
  }

  int v9 = objc_msgSend__serviceStatus(self, v7, v8);
  int v145 = objc_msgSend_iMessageSupported(v9, v10, v11);

  id v14 = objc_msgSend__serviceStatus(self, v12, v13);
  int v152 = objc_msgSend_faceTimeAudioSupported(v14, v15, v16);

  v19 = objc_msgSend__serviceStatus(self, v17, v18);
  int v151 = objc_msgSend_faceTimeMultiwaySupported(v19, v20, v21);

  int v153 = MGGetBoolAnswer();
  int v22 = MGGetBoolAnswer();
  if (MGGetBoolAnswer()) {
    int v150 = objc_msgSend_deviceType(self, v23, v24) == 2;
  }
  else {
    int v150 = 0;
  }
  if (MGGetBoolAnswer()) {
    int v149 = objc_msgSend_deviceType(self, v25, v26) == 2;
  }
  else {
    int v149 = 0;
  }
  int v27 = MGGetBoolAnswer();
  int v146 = MGGetBoolAnswer();
  int v142 = MGGetBoolAnswer();
  int v143 = MGGetBoolAnswer();
  int v147 = MGGetBoolAnswer();
  int v144 = v27;
  if (v27) {
    int v27 = objc_msgSend_deviceType(self, v28, v29) == 2 || objc_msgSend_deviceType(self, v28, v29) == 4;
  }
  uint64_t v30 = objc_msgSend_performanceClass(self, v28, v29);
  BOOL v33 = v30 != -1;
  if (v30 == -1) {
    int v34 = 0;
  }
  else {
    int v34 = v27;
  }
  int v154 = v34;
  if (objc_msgSend_isInMultiUserMode(self, v31, v32))
  {
    int v37 = _os_feature_enabled_impl();
    v40 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v38, v39);
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (v41)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v40, OS_LOG_TYPE_DEFAULT, "In multi user mode, however not disabling handoff due to Feature Flag", buf, 2u);
      }
    }
    else
    {
      if (v41)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v40, OS_LOG_TYPE_DEFAULT, "In multi user mode, disabling handoff", buf, 2u);
      }
      BOOL v33 = 0;
      int v154 = 0;
    }
  }
  v42 = objc_msgSend_sharedMessageCenter(MEMORY[0x1E4F239E8], v35, v36);
  int isMmsConfigured = objc_msgSend_isMmsConfigured(v42, v43, v44);

  v47 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v45, v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    if (v150) {
      v48 = @"YES";
    }
    else {
      v48 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v48;
    _os_log_impl(&dword_1A7BC0000, v47, OS_LOG_TYPE_DEFAULT, "               Supports SMS: %@", buf, 0xCu);
  }

  v51 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v49, v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    if (v149) {
      v52 = @"YES";
    }
    else {
      v52 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v52;
    _os_log_impl(&dword_1A7BC0000, v51, OS_LOG_TYPE_DEFAULT, "               Supports MMS: %@", buf, 0xCu);
  }

  v55 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v53, v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    if (isMmsConfigured) {
      v56 = @"YES";
    }
    else {
      v56 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v56;
    _os_log_impl(&dword_1A7BC0000, v55, OS_LOG_TYPE_DEFAULT, "             MMS Configured: %@", buf, 0xCu);
  }

  v59 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v57, v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    if (v22) {
      v60 = @"YES";
    }
    else {
      v60 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v60;
    _os_log_impl(&dword_1A7BC0000, v59, OS_LOG_TYPE_DEFAULT, "                         GT: %@", buf, 0xCu);
  }

  v63 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v61, v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    if (v153) {
      v64 = @"YES";
    }
    else {
      v64 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v64;
    _os_log_impl(&dword_1A7BC0000, v63, OS_LOG_TYPE_DEFAULT, "                Supports FT: %@", buf, 0xCu);
  }

  v67 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v65, v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    if (v152) {
      v68 = @"YES";
    }
    else {
      v68 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v68;
    _os_log_impl(&dword_1A7BC0000, v67, OS_LOG_TYPE_DEFAULT, "               Supports FTA: %@", buf, 0xCu);
  }

  v71 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v69, v70);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    if (v151) {
      v72 = @"YES";
    }
    else {
      v72 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v72;
    _os_log_impl(&dword_1A7BC0000, v71, OS_LOG_TYPE_DEFAULT, "              Supports FTMW: %@", buf, 0xCu);
  }

  v75 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v73, v74);
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    if (v145) {
      v76 = @"YES";
    }
    else {
      v76 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v76;
    _os_log_impl(&dword_1A7BC0000, v75, OS_LOG_TYPE_DEFAULT, "          Supports iMessage: %@", buf, 0xCu);
  }

  v79 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v77, v78);
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v156 = @"YES";
    _os_log_impl(&dword_1A7BC0000, v79, OS_LOG_TYPE_DEFAULT, "              Supports WiFi: %@", buf, 0xCu);
  }

  v82 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v80, v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    if (v146) {
      v83 = @"YES";
    }
    else {
      v83 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v83;
    _os_log_impl(&dword_1A7BC0000, v82, OS_LOG_TYPE_DEFAULT, "             Supports 3G FT: %@", buf, 0xCu);
  }

  v86 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v84, v85);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    if (v147) {
      v87 = @"YES";
    }
    else {
      v87 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v87;
    _os_log_impl(&dword_1A7BC0000, v86, OS_LOG_TYPE_DEFAULT, "              Supports WLAN: %@", buf, 0xCu);
  }

  v90 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v88, v89);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    if (v144) {
      v91 = @"YES";
    }
    else {
      v91 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v91;
    _os_log_impl(&dword_1A7BC0000, v90, OS_LOG_TYPE_DEFAULT, "         Supports Cell Data: %@", buf, 0xCu);
  }

  v94 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v92, v93);
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
    if (v143) {
      v95 = @"YES";
    }
    else {
      v95 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v95;
    _os_log_impl(&dword_1A7BC0000, v94, OS_LOG_TYPE_DEFAULT, "      Supports Front Camera: %@", buf, 0xCu);
  }

  v98 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v96, v97);
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    if (v142) {
      v99 = @"YES";
    }
    else {
      v99 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v99;
    _os_log_impl(&dword_1A7BC0000, v98, OS_LOG_TYPE_DEFAULT, "       Supports Back Camera: %@", buf, 0xCu);
  }

  v102 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v100, v101);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    if (v33) {
      v103 = @"YES";
    }
    else {
      v103 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v103;
    _os_log_impl(&dword_1A7BC0000, v102, OS_LOG_TYPE_DEFAULT, "           Supports Handoff: %@", buf, 0xCu);
  }

  v106 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v104, v105);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    if (v154) {
      v107 = @"YES";
    }
    else {
      v107 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v156 = v107;
    _os_log_impl(&dword_1A7BC0000, v106, OS_LOG_TYPE_DEFAULT, "         Supports Tethering: %@", buf, 0xCu);
  }

  v110 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v108, v109);
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v111 = self->_simInserted + 1;
    if (v111 > 2) {
      v112 = @"Invalid";
    }
    else {
      v112 = off_1E5D1AF08[v111];
    }
    *(_DWORD *)buf = 138412290;
    v156 = v112;
    _os_log_impl(&dword_1A7BC0000, v110, OS_LOG_TYPE_DEFAULT, "         SIM Inserted State: %@", buf, 0xCu);
  }
  int v139 = v33;
  int v140 = v22;

  v115 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v113, v114);
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v116 = self->_isPNRSupportedCachedValue + 1;
    if (v116 > 2) {
      v117 = @"Invalid";
    }
    else {
      v117 = off_1E5D1AF08[v116];
    }
    *(_DWORD *)buf = 138412290;
    v156 = v117;
    _os_log_impl(&dword_1A7BC0000, v115, OS_LOG_TYPE_DEFAULT, "        PNR Supported State: %@", buf, 0xCu);
  }

  int isGreenTea = self->_isGreenTea;
  int supportsHandoff = self->_supportsHandoff;
  int supportsTethering = self->_supportsTethering;
  int supportsFT = self->_supportsFT;
  int supportsFTA = self->_supportsFTA;
  int supportsFTMW = self->_supportsFTMW;
  int supportsSMS = self->_supportsSMS;
  int mmsConfigured = self->_mmsConfigured;
  int supportsMMS = self->_supportsMMS;
  BOOL supportsWiFi = self->_supportsWiFi;
  int supportsWLAN = self->_supportsWLAN;
  int supportsiMessage = self->_supportsiMessage;
  int supportsNonWiFiFaceTime = self->_supportsNonWiFiFaceTime;
  int supportsFrontCamera = self->_supportsFrontCamera;
  int supportsCellularData = self->_supportsCellularData;
  self->_BOOL supportsWiFi = 1;
  self->_supportsStewieState = -1;
  int supportsBackCamera = self->_supportsBackCamera;
  self->_int isGreenTea = v140;
  self->_int supportsHandoff = v139;
  self->_int supportsTethering = v154;
  self->_int supportsBackCamera = v142;
  self->_int supportsFrontCamera = v143;
  self->_int supportsMMS = v149;
  self->_int mmsConfigured = isMmsConfigured;
  self->_int supportsSMS = v150;
  self->_int supportsFT = v153;
  self->_int supportsFTA = v152;
  self->_int supportsFTMW = v151;
  self->_int supportsWLAN = v147;
  self->_int supportsNonWiFiFaceTime = v146;
  self->_int supportsiMessage = v145;
  self->_int supportsCellularData = v144;
  *(void *)&long long v125 = -1;
  *((void *)&v125 + 1) = -1;
  *(_OWORD *)&self->_supportsZelkovaState = v125;
  *(_OWORD *)&self->_supportsKeySharingState = v125;
  *(_OWORD *)&self->_supportsFMDV2State = v125;
  *(_OWORD *)&self->_supportsManateeForAppleCash = v125;
  *(_OWORD *)&self->_supportsApplePayState = v125;
  pthread_mutex_unlock(&stru_1EB47C6A0);
  if ((isGreenTea != v140
     || supportsHandoff != v139
     || supportsTethering != v154
     || supportsFT != v153
     || supportsFTA != v152
     || supportsFTMW != v151
     || supportsSMS != v150
     || supportsMMS != v149
     || mmsConfigured != isMmsConfigured
     || supportsWLAN != v147
     || !supportsWiFi
     || supportsNonWiFiFaceTime != v146
     || supportsiMessage != v145
     || supportsCellularData != v144
     || supportsFrontCamera != v143
     || supportsBackCamera != v142)
    && !self->_blockPost)
  {
    v128 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v126, v127);
    objc_msgSend___mainThreadPostNotificationName_object_(v128, v129, @"__kFaceTimeDeviceCapabilityChangedNotification", 0);
  }
}

- (int64_t)deviceType
{
  int64_t result = qword_1EB47C820;
  if (qword_1EB47C820 <= 0)
  {
    uint64_t v3 = (void *)MGCopyAnswer();
    objc_msgSend_rangeOfString_(v3, v4, @"iPhone");
    if (v5)
    {
      uint64_t v6 = 2;
    }
    else
    {
      objc_msgSend_rangeOfString_(v3, 0, @"iPod");
      if (v7)
      {
        uint64_t v6 = 3;
      }
      else
      {
        objc_msgSend_rangeOfString_(v3, 0, @"iPad");
        if (v8)
        {
          uint64_t v6 = 4;
        }
        else
        {
          objc_msgSend_rangeOfString_(v3, 0, @"Watch");
          if (v9)
          {
            uint64_t v6 = 6;
          }
          else
          {
            objc_msgSend_rangeOfString_(v3, 0, @"Vision");
            if (!v10)
            {
              if (qword_1E9739550 != -1) {
                dispatch_once(&qword_1E9739550, &unk_1EFE07AA0);
              }
              goto LABEL_13;
            }
            uint64_t v6 = 9;
          }
        }
      }
    }
    qword_1EB47C820 = v6;
LABEL_13:

    return qword_1EB47C820;
  }
  return result;
}

- (id)_serviceStatus
{
  return (id)objc_msgSend_sharedInstance(FTServiceStatus, a2, v2);
}

- (int64_t)performanceClass
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  int64_t result = self->_performanceClass;
  if (result < 0)
  {
    id v4 = (void *)MGCopyAnswer();
    if ((unint64_t)objc_msgSend_length(v4, v5, v6) < 4)
    {
      uint64_t v12 = objc_msgSend_copy(v4, v7, v8);
      if (v12) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v9 = objc_msgSend_substringWithRange_(v4, v7, 0, 4);
      uint64_t v12 = objc_msgSend_copy(v9, v10, v11);

      if (v12)
      {
LABEL_4:
        id v13 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v15 = objc_msgSend_initWithObjects_(v13, v14, @"N94", @"K94", @"K93", @"K95", @"J2A", @"J2a", @"J1A", @"J1a", 0);
        id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v18 = objc_msgSend_initWithObjects_(v16, v17, @"P105", @"P106", @"P107", 0);
        id v19 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v21 = objc_msgSend_initWithObjects_(v19, v20, @"N41", @"N42", 0);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v22 = v15;
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v52, v58, 16);
        if (v24)
        {
          uint64_t v26 = v24;
          uint64_t v27 = *(void *)v53;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v53 != v27) {
                objc_enumerationMutation(v22);
              }
              if (objc_msgSend_hasPrefix_(v12, v25, *(void *)(*((void *)&v52 + 1) + 8 * i)))
              {
                int64_t v41 = -1;
                id v29 = v22;
                goto LABEL_36;
              }
            }
            uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v52, v58, 16);
            if (v26) {
              continue;
            }
            break;
          }
        }

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v29 = v18;
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v48, v57, 16);
        if (v31)
        {
          uint64_t v33 = v31;
          uint64_t v34 = *(void *)v49;
          while (2)
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v49 != v34) {
                objc_enumerationMutation(v29);
              }
              if (objc_msgSend_hasPrefix_(v12, v32, *(void *)(*((void *)&v48 + 1) + 8 * j)))
              {
                int64_t v41 = 0;
                goto LABEL_36;
              }
            }
            uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v48, v57, 16);
            if (v33) {
              continue;
            }
            break;
          }
        }

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v29 = v21;
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v44, v56, 16);
        if (v37)
        {
          uint64_t v39 = v37;
          v43 = v21;
          uint64_t v40 = *(void *)v45;
          int64_t v41 = 2;
          while (2)
          {
            for (uint64_t k = 0; k != v39; ++k)
            {
              if (*(void *)v45 != v40) {
                objc_enumerationMutation(v29);
              }
              if (objc_msgSend_hasPrefix_(v12, v38, *(void *)(*((void *)&v44 + 1) + 8 * k)))
              {
                int64_t v41 = 1;
                goto LABEL_34;
              }
            }
            uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v38, (uint64_t)&v44, v56, 16);
            if (v39) {
              continue;
            }
            break;
          }
LABEL_34:
          uint64_t v21 = v43;
        }
        else
        {
          int64_t v41 = 2;
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    int64_t v41 = 2;
LABEL_37:
    self->_performanceClass = v41;

    return self->_performanceClass;
  }
  return result;
}

- (BOOL)isInMultiUserMode
{
  uint64_t v2 = (void *)MEMORY[0x1AD0D4F50](@"UMUserManager", @"UserManagement");
  qword_1EB47C828 = (uint64_t)v2;
  if (v2)
  {
    uint64_t v5 = objc_msgSend_sharedManager(v2, v3, v4);
    char isMultiUser = objc_msgSend_isMultiUser(v5, v6, v7);

    LOBYTE(v2) = isMultiUser;
  }
  return (char)v2;
}

- (BOOL)supportsSMS
{
  return self->_supportsSMS;
}

- (BOOL)madridSupported
{
  return self->_supportsiMessage;
}

- (void)_registerForServiceStatusNotifications
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v4, (uint64_t)self, sel__updateCapabilities, @"FTServiceStatusDidChangeNotification", 0);
}

- (void)_registerForCapabilityNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BC1FC8;
  block[3] = &unk_1E5D1AD78;
  block[4] = self;
  if (qword_1EB47C818 != -1) {
    dispatch_once(&qword_1EB47C818, block);
  }
}

- (void)dealloc
{
  objc_msgSend__unregisterForManagedConfigurationNotifications(self, a2, v2);
  objc_msgSend__unregisterForCommCenterReadyNotifications(self, v4, v5);
  objc_msgSend__unregisterForServiceStatusNotifications(self, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)FTDeviceSupport;
  [(FTDeviceSupport *)&v8 dealloc];
}

- (void)_unregisterForManagedConfigurationNotifications
{
  uint64_t v3 = (void *)MEMORY[0x1AD0D4F50](@"MCProfileConnection", @"ManagedConfiguration");
  objc_msgSend_sharedConnection(v3, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserver_(v7, v6, (uint64_t)self);
}

- (void)_unregisterForServiceStatusNotifications
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v5, v4, (uint64_t)self, @"FTServiceStatusDidChangeNotification", 0);
}

- (void)_commCenterAlive
{
  if (self->_supportsSMS)
  {
    self->_isPNRSupportedCachedValue = -1;
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v4, v3, @"__kFaceTimeDeviceRegistrationCapabilityChangedNotification", 0);
  }
}

- (void)_registerForInternalCoreTelephonyNotifications
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = coreTelephonyClient;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Setting CoreTelephonyClient delegate to start receiving notifications { self: %@, coreTelephonyClient: %@ }", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend_setDelegate_(self->_coreTelephonyClient, v6, (uint64_t)self);
  if (self->_supportsSMS && !self->_isPNRSupportedCachedValue)
  {
    self->_isPNRSupportedCachedValue = -1;
    uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8);
    objc_msgSend___mainThreadPostNotificationName_object_(v9, v10, @"__kFaceTimeDeviceRegistrationCapabilityChangedNotification", 0);
  }
}

- (BOOL)madridAvailable
{
  int v4 = objc_msgSend_madridSupported(self, a2, v2);
  if (v4) {
    LOBYTE(v4) = objc_msgSend_madridBlocked(self, v5, v6) ^ 1;
  }
  return v4;
}

- (BOOL)madridBlocked
{
  return self->_iMessageBlocked;
}

- (BOOL)callingAvailable
{
  if ((objc_msgSend_callingSupported(self, a2, v2) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "FTA isn't allowed, disabled";
      uint64_t v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (objc_msgSend_callingBlocked(self, v4, v5))
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      uint64_t v9 = "FTA isn't allowed, managed profile doesn't allow it";
      uint64_t v10 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)multiwayAvailable
{
  if ((objc_msgSend_multiwaySupported(self, a2, v2) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "FTMW isn't allowed, disabled";
      uint64_t v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (objc_msgSend_multiwayBlocked(self, v4, v5))
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      uint64_t v9 = "FTMW isn't allowed, managed profile doesn't allow it";
      uint64_t v10 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)multiwayBlocked
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1F4181798])(self, sel_faceTimeBlocked);
}

- (BOOL)multiwaySupported
{
  return self->_supportsFTMW;
}

- (BOOL)callingBlocked
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1F4181798])(self, sel_faceTimeBlocked);
}

- (BOOL)callingSupported
{
  return self->_supportsFTA;
}

- (BOOL)inProcess_isCallingSupported
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B3E8], a2, v2);
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_carrierBundleValueFromAllSIMsForKey_ofType_withFallback_(v3, v5, @"AllowsFaceTimeAudio", v4, MEMORY[0x1E4F1CC28]);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, v39, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v30;
    LOBYTE(v14) = 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v7);
        }
        if (v14) {
          int v14 = objc_msgSend_BOOLValue(*(void **)(*((void *)&v29 + 1) + 8 * i), v10, v11, (void)v29);
        }
        else {
          int v14 = 0;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v29, v39, 16);
    }
    while (v12);
  }
  else
  {
    int v14 = 1;
  }

  if (objc_msgSend_count(v7, v16, v17)) {
    int v18 = v14;
  }
  else {
    int v18 = 0;
  }
  int v19 = MGGetBoolAnswer();
  int v22 = MGGetBoolAnswer();
  if (v22) {
    char v23 = v18 | v19 ^ 1;
  }
  else {
    char v23 = 0;
  }
  uint64_t v24 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v20, v21, (void)v29);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = @"NO";
    if (v22) {
      uint64_t v26 = @"YES";
    }
    else {
      uint64_t v26 = @"NO";
    }
    if (v18) {
      uint64_t v27 = @"YES";
    }
    else {
      uint64_t v27 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v34 = v26;
    __int16 v35 = 2112;
    uint64_t v36 = v27;
    if (v19) {
      v25 = @"YES";
    }
    __int16 v37 = 2112;
    v38 = v25;
    _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_DEFAULT, "Checked FTA support in process {supportsFT: %@, carrierOverrideFTA: %@, GT: %@}", buf, 0x20u);
  }

  return v23;
}

- (BOOL)iMessageAvailable
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1F4181798])(self, sel_madridAvailable);
}

- (BOOL)faceTimeAvailable
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1F4181798])(self, sel_conferencingEnabled);
}

- (BOOL)identityServicesSupported
{
  return 1;
}

- (BOOL)supportsNonWiFiFaceTime
{
  if (self->_supportsNonWiFiFaceTime) {
    return 1;
  }
  uint64_t v4 = objc_msgSend_sharedInstance(FTUserConfiguration, a2, v2);
  char v7 = objc_msgSend__nonWifiFaceTimeEntitled(v4, v5, v6);

  return v7;
}

- (BOOL)conferencingBlocked
{
  return self->_faceTimeBlocked;
}

- (BOOL)conferencingEnabled
{
  if ((objc_msgSend_conferencingAllowed(self, a2, v2) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Conferencing isn't allowed, disabled";
      uint64_t v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (objc_msgSend_conferencingBlocked(self, v4, v5))
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      uint64_t v9 = "Conferencing isn't allowed, managed profile doesn't allow it";
      uint64_t v10 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)conferencingAllowed
{
  return self->_supportsFT;
}

- (BOOL)registrationSupported
{
  if ((objc_msgSend_faceTimeSupported(self, a2, v2) & 1) != 0
    || (int v6 = objc_msgSend_iMessageSupported(self, v4, v5)) != 0)
  {
    LOBYTE(v6) = MEMORY[0x1F4181798](self, sel_supportsAppleIDIdentification, v5);
  }
  return v6;
}

- (BOOL)accountModificationRestricted
{
  return self->_accountModificationRestricted;
}

- (BOOL)supportsAnimojiV2
{
  return MGGetBoolAnswer();
}

- (BOOL)supportsEmojiImages
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportsHomeKitResident
{
  return (objc_msgSend_deviceType(self, a2, v2) & 0xFFFFFFFFFFFFFFFDLL) == 5;
}

- (BOOL)supportsCinematicFraming
{
  return MGIsDeviceOneOfType();
}

- (BOOL)supportsHEIFEncoding
{
  return MGGetBoolAnswer();
}

- (NSString)model
{
  uint64_t v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], a2, v2);
  int v6 = objc_msgSend_model(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)deviceIDPrefix
{
  return (NSString *)@"U";
}

- (NSString)deviceTypeIDPrefix
{
  if (!self->_supportsSMS) {
    return (NSString *)@"U";
  }
  if (objc_msgSend_isC2KEquipment(self, a2, v2)) {
    return (NSString *)@"m";
  }
  return (NSString *)@"i";
}

- (NSDictionary)telephonyCapabilities
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_supportsSMS)
  {
    uint64_t v2 = (const void *)_CTServerConnectionCreate();
    if (v2)
    {
      uint64_t v3 = _CTServerConnectionCopySystemCapabilities();
      CFRelease(v2);
      if (v3 != 2)
      {
        uint64_t v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v11 = 0;
          __int16 v12 = 2048;
          uint64_t v13 = (int)v3;
          __int16 v14 = 2048;
          uint64_t v15 = v3 >> 32;
          _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_INFO, "CT returned system capabilities: %@  error: (%ld:%ld)", buf, 0x20u);
        }

        if (v3)
        {
          uint64_t v8 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v11 = (int)v3;
            __int16 v12 = 2048;
            uint64_t v13 = v3 >> 32;
            _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_ERROR, "Error querying system capabilities: (%ld:%ld)", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            _IDSWarnV();
            _IDSLogV();
            _IDSLogTransport();
          }
        }
        uint64_t v9 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_ERROR, "Empty system capabilities returned", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
      }
    }
  }

  return (NSDictionary *)0;
}

- (BOOL)isC2KEquipment
{
  if (!self->_supportsSMS) {
    return 0;
  }
  uint64_t v3 = objc_msgSend_telephonyCapabilities(self, a2, v2);
  uint64_t v5 = objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E4F24328]);
  BOOL v8 = objc_msgSend_intValue(v5, v6, v7) == 0;

  return v8;
}

- (BOOL)supportsHDRdecoding
{
  CFDictionaryRef v2 = (const __CFDictionary *)VTCopyHEVCDecoderCapabilitiesDictionary();
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  BOOL v4 = CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F44BE8]) == (const void *)*MEMORY[0x1E4F1CFD0];
  CFRelease(v3);
  return v4;
}

- (BOOL)supportsSimultaneousVoiceAndDataRightNow
{
  if (!self->_supportsSMS) {
    return 1;
  }
  CFDictionaryRef v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B3E8], a2, v2);
  char doesAnySIMSupportsSimultaneousVoiceAndDataRightNow = objc_msgSend_doesAnySIMSupportsSimultaneousVoiceAndDataRightNow(v3, v4, v5);

  return doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
}

- (BOOL)SIMInserted
{
  int64_t simInserted = self->_simInserted;
  if (simInserted == -1)
  {
    objc_msgSend__initializeSIMInsertedCachedValue(self, a2, v2);
    int64_t simInserted = self->_simInserted;
  }
  return simInserted == 1;
}

- (void)_initializeSIMInsertedCachedValue
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  selectedPNRSubscription = self->_selectedPNRSubscription;
  id v19 = 0;
  BOOL v4 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, a2, (uint64_t)&v19);
  id v7 = v19;
  if (v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v18 = 0;
    uint64_t v9 = objc_msgSend_getSIMStatus_error_(coreTelephonyClient, v5, (uint64_t)v4, &v18);
    id v10 = v18;
    uint64_t v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
    __int16 v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Loaded initial SIM status { simStatus: %@ }", buf, 0xCu);
      }

      if (objc_msgSend_isEqualToString_(v9, v15, *MEMORY[0x1E4F241F0]))
      {
        int64_t v16 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFDE54();
      }
    }
    int64_t v16 = 1;
    goto LABEL_14;
  }
  uint64_t v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Unable to find selected context to load SIM status { subscriptionError: %@ }", buf, 0xCu);
  }

  int64_t v16 = 0;
  uint64_t v9 = 0;
LABEL_14:
  self->_int64_t simInserted = v16;
}

- (BOOL)supportsStewie
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (!byte_1E9739578)
  {
    int64_t supportsStewieState = self->_supportsStewieState;
    if (supportsStewieState != -1) {
      return supportsStewieState == 1;
    }
    coreTelephonyClient = self->_coreTelephonyClient;
    id v19 = 0;
    BOOL v8 = objc_msgSend_getStewieSupport_(coreTelephonyClient, a2, (uint64_t)&v19);
    uint64_t v9 = (__CFString *)v19;
    unsigned int v12 = objc_msgSend_hwSupport(v8, v10, v11);
    uint64_t v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        uint64_t v17 = "Failed to get stewie hw support { error: %@ }";
LABEL_15:
        _os_log_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      }
    }
    else if (v16)
    {
      id v18 = @"NO";
      if (v12) {
        id v18 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v21 = v18;
      uint64_t v17 = "Got stewie hw support { stewieHWSupport: %@ }";
      goto LABEL_15;
    }

    self->_int64_t supportsStewieState = v12;
    int64_t supportsStewieState = self->_supportsStewieState;
    return supportsStewieState == 1;
  }
  BOOL v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Stewie", buf, 2u);
  }

  return 1;
}

- (void)supportsStewieWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(id, uint64_t, void))a3;
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Stewie", buf, 2u);
    }

    v6[2](v6, 1, 0);
  }
  else
  {
    int64_t supportsStewieState = self->_supportsStewieState;
    if (supportsStewieState == -1)
    {
      coreTelephonyClient = self->_coreTelephonyClient;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_1A7BCFF4C;
      v11[3] = &unk_1E5D1AE70;
      v11[4] = self;
      unsigned int v12 = v6;
      objc_msgSend_getStewieSupportWithCompletion_(coreTelephonyClient, v10, (uint64_t)v11);
    }
    else
    {
      v6[2](v6, supportsStewieState == 1, 0);
    }
  }
}

- (BOOL)supportsFriendingViaPush
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    CFDictionaryRef v3 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1A7BC0000, v3, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Game Center Friending", v5, 2u);
    }

    return 1;
  }
  else
  {
    return _os_feature_enabled_impl();
  }
}

- (BOOL)wantsBreakBeforeMake
{
  if (IMGetCachedDomainBoolForKey()) {
    return 1;
  }
  if (!self->_supportsSMS || (objc_msgSend_supportsSimultaneousVoiceAndDataRightNow(self, v3, v4) & 1) != 0) {
    return 0;
  }
  BOOL v8 = objc_msgSend_sharedInstance(FTEntitlementSupport, v6, v7);
  char v11 = objc_msgSend_faceTimeNonWiFiEntitled(v8, v9, v10);

  return v11;
}

- (NSString)deviceRegionInfo
{
  uint64_t v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)deviceName
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  CFDictionaryRef v3 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
  objc_sync_exit(v2);

  if (objc_msgSend_length(v3, v4, v5))
  {
    objc_msgSend___stringByStrippingControlCharacters(v3, v6, v7);
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = objc_msgSend_model(v2, v6, v7);
    if (objc_msgSend_length(v9, v10, v11))
    {
      objc_msgSend___stringByStrippingControlCharacters(v9, v12, v13);
      BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = @"Unnamed Device";
    }
  }

  return (NSString *)v8;
}

+ (id)marketingNameForDeviceType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C878];
      goto LABEL_11;
    case 1:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C868];
      goto LABEL_11;
    case 2:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C890];
      goto LABEL_11;
    case 3:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C898];
      goto LABEL_11;
    case 4:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C888];
      goto LABEL_11;
    case 5:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C850];
      goto LABEL_11;
    case 6:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C880];
      goto LABEL_11;
    case 7:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C858];
      goto LABEL_11;
    case 8:
      uint64_t v4 = (id *)MEMORY[0x1E4F6C860];
LABEL_11:
      id v5 = *v4;
      break;
    default:
      id v5 = (id)*MEMORY[0x1E4F6C878];
      if (a3 == 9)
      {
        id v7 = (id)*MEMORY[0x1E4F6C870];

        id v5 = v7;
      }
      break;
  }

  return v5;
}

- (NSString)deviceColor
{
  uint64_t v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)enclosureColor
{
  uint64_t v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (BOOL)isInDualPhoneIdentityMode
{
  return objc_msgSend_isDeviceInDualPhoneIdentityMode(self->_selectedPNRSubscription, a2, v2);
}

- (id)registrationState
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  selectedPNRSubscription = self->_selectedPNRSubscription;
  id v44 = 0;
  uint64_t v4 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, a2, (uint64_t)&v44);
  id v7 = v44;
  if (v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v43 = 0;
    uint64_t v9 = objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v5, (uint64_t)v4, &v43);
    uint64_t v10 = v43;
    uint64_t v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
    uint64_t v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_isReady(v9, v15, v16)) {
          id v19 = @"YES";
        }
        else {
          id v19 = @"NO";
        }
        BOOL v20 = objc_msgSend_phoneNumber(v9, v17, v18);
        char v23 = objc_msgSend_imsi(v9, v21, v22);
        uint64_t v26 = objc_msgSend_plmn(v9, v24, v25);
        *(_DWORD *)buf = 138413570;
        id v46 = v9;
        __int16 v47 = 2112;
        long long v48 = v19;
        __int16 v49 = 2112;
        long long v50 = v20;
        __int16 v51 = 2112;
        long long v52 = v23;
        __int16 v53 = 2112;
        long long v54 = v26;
        __int16 v55 = 2112;
        v56 = v4;
        _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Read telephony phone number registration context { PNRContext: %@, isReady: %@, phoneNumber: %@, IMSI: %@, PLMN: %@, subscriptionContext: %@ }", buf, 0x3Eu);
      }
      uint64_t v27 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v28 = NSNumber;
      uint64_t isReady = objc_msgSend_isReady(v9, v29, v30);
      uint64_t v33 = objc_msgSend_numberWithBool_(v28, v32, isReady);
      if (v33) {
        CFDictionarySetValue(v27, @"__kFTCTRegistrationStatusCanRegisterKey", v33);
      }

      uint64_t v36 = objc_msgSend_phoneNumber(v9, v34, v35);
      if (v36) {
        CFDictionarySetValue(v27, @"__kFTCTRegistrationStatusPhoneNumberKey", v36);
      }

      uint64_t v39 = objc_msgSend_imsi(v9, v37, v38);
      if (v39) {
        CFDictionarySetValue(v27, @"__kFTCTRegistrationStatusIMSIKey", v39);
      }

      uint64_t v14 = objc_msgSend_plmn(v9, v40, v41);
      if (v14) {
        CFDictionarySetValue(v27, @"__kFTCTRegistrationStatusPLMNKey", v14);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFDEC8();
      }
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v7;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Could not find user-selected subscription to check phone number registration state -- returning nil { error: %@ }", buf, 0xCu);
    }
    uint64_t v27 = 0;
  }

  return v27;
}

- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  im_dispatch_after_primary_queue();
}

- (void)phoneNumberChanged:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  im_dispatch_after_primary_queue();
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BD0B18;
  block[3] = &unk_1E5D1AD78;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)operatorBundleChange:(id)a3
{
  id v4 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BD0BA8;
  block[3] = &unk_1E5D1AD78;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  im_dispatch_after_primary_queue();
}

- (void)_handleSIMStatusChangedToStatus:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Handling relevant SIM status change { status: %@ }", buf, 0xCu);
  }

  if (self->_supportsSMS)
  {
    if (objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E4F24210]))
    {
      self->_int64_t simInserted = 1;
      if (self->_simBecameNotReady)
      {
        uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10);
        objc_msgSend___mainThreadPostNotificationName_object_(v11, v12, @"__kFaceTimeDeviceSIMInsertedNotification", 0);
      }
      self->_simBecameNotReady = 0;
    }
    else if (objc_msgSend_isEqualToString_(v4, v9, *MEMORY[0x1E4F241F0]))
    {
      self->_simBecameNotReady = 1;
      self->_int64_t simInserted = 0;
      im_dispatch_after_primary_queue();
    }
  }
}

- (void)_handleCarrierSettingsChanged
{
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed, processing in a bit...", buf, 2u);
  }

  im_dispatch_after_primary_queue();
  if (self->_supportsSMS)
  {
    self->_isPNRSupportedCachedValue = -1;
    id v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6);
    objc_msgSend___mainThreadPostNotificationName_object_(v7, v8, @"__kFaceTimeDeviceRegistrationCapabilityChangedNotification", 0);
  }
}

- (void)noteSelectedPhoneNumberRegistrationSubscriptionDidChange
{
  objc_msgSend__invalidateValuesCachedForSelectedPhoneNumberRegistration(self, a2, v2);

  objc_msgSend__handlePotentialPhoneNumberRegistrationStateChanged(self, v4, v5);
}

- (void)_invalidateValuesCachedForSelectedPhoneNumberRegistration
{
  self->_simBecameNotReady = 0;
  self->_int64_t simInserted = -1;
  self->_isPNRSupportedCachedValue = -1;
  self->_number = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_handlePotentialPhoneNumberRegistrationStateChanged
{
  if ((byte_1E97394A0 & 1) == 0)
  {
    number = self->_number;
    self->_number = 0;

    byte_1E97394A0 = 1;
    im_dispatch_after_primary_queue();
  }
}

- (NSDictionary)CTNetworkInformation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (self->_supportsSMS)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    selectedPNRSubscription = self->_selectedPNRSubscription;
    id v39 = 0;
    uint64_t v6 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, v5, (uint64_t)&v39);
    id v7 = v39;
    id v10 = v7;
    if (v6)
    {

      coreTelephonyClient = self->_coreTelephonyClient;
      id v38 = 0;
      uint64_t v13 = objc_msgSend_copyLastKnownMobileSubscriberCountryCode_error_(coreTelephonyClient, v12, (uint64_t)v6, &v38);
      id v14 = v38;
      objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v15, (uint64_t)v3, @"sim-mcc", v13, v14);

      uint64_t v16 = self->_coreTelephonyClient;
      id v37 = 0;
      uint64_t v18 = objc_msgSend_copyMobileSubscriberNetworkCode_error_(v16, v17, (uint64_t)v6, &v37);
      id v19 = v37;
      objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v20, (uint64_t)v3, @"sim-mnc", v18, v19);

      id v21 = self->_coreTelephonyClient;
      id v36 = 0;
      char v23 = objc_msgSend_copyMobileCountryCode_error_(v21, v22, (uint64_t)v6, &v36);
      id v24 = v36;
      objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v25, (uint64_t)v3, @"network-mcc", v23, v24);

      uint64_t v26 = self->_coreTelephonyClient;
      id v35 = 0;
      uint64_t v28 = objc_msgSend_copyMobileNetworkCode_error_(v26, v27, (uint64_t)v6, &v35);
      id v10 = v35;
      objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v29, (uint64_t)v3, @"network-mnc", v28, v10);
    }
    else
    {
      uint64_t v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v10;
        _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Unable to find selected context to load telephony network information { error: %@ }", buf, 0xCu);
      }
    }

    uint64_t v33 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v31, v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v3;
      _os_log_impl(&dword_1A7BC0000, v33, OS_LOG_TYPE_DEFAULT, "Returning telephony network information { networkInformation: %@ }", buf, 0xCu);
    }

    id v30 = v3;
  }
  else
  {
    id v30 = 0;
  }

  return (NSDictionary *)v30;
}

- (void)_updateCTNetworkDictionary:(id)a3 key:(id)a4 withTelephonyNetworkValue:(id)a5 telephonyError:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v15 = objc_msgSend_length(v11, v13, v14);
  if (v10 && v15)
  {
    objc_msgSend_setObject_forKey_(v9, v16, (uint64_t)v11, v10);
  }
  else
  {
    uint64_t v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v16, v17);
    id v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412802;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v11;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl(&dword_1A7BC0000, v19, OS_LOG_TYPE_DEFAULT, "Error reading telephony network information { key: %@, value: %@, error: %@ }", (uint8_t *)&v20, 0x20u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      sub_1A7BFDF30();
    }
  }
}

- (BOOL)supportsSMSIdentification
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_supportsSMS)
  {
    int64_t isPNRSupportedCachedValue = self->_isPNRSupportedCachedValue;
    if (isPNRSupportedCachedValue == -1)
    {
      selectedPNRSubscription = self->_selectedPNRSubscription;
      id v25 = 0;
      uint64_t v6 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, a2, (uint64_t)&v25);
      id v7 = (__CFString *)v25;
      id v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
      id v4 = v10;
      if (v6)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1A7BFE00C();
        }

        coreTelephonyClient = self->_coreTelephonyClient;
        id v24 = 0;
        LODWORD(v4) = objc_msgSend_isPNRSupported_outError_(coreTelephonyClient, v12, (uint64_t)v6, &v24);
        id v13 = v24;
        uint64_t v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
        uint64_t v17 = v16;
        if (v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_1A7BFDFA4();
          }

          LOBYTE(v4) = objc_msgSend__legacy_supportsSMSIdentification(self, v18, v19);
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = @"NO";
            if (v4) {
              __int16 v22 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v27 = v22;
            __int16 v28 = 2112;
            long long v29 = v6;
            _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Determined value for isPNRSupported { isPNRSupported: %@, subscription: %@ }", buf, 0x16u);
          }

          self->_int64_t isPNRSupportedCachedValue = v4;
        }
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v7;
          _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Unable to locate user-selected subscription to check isPNRSupported -- falling back { error: %@ }", buf, 0xCu);
        }

        LOBYTE(v4) = objc_msgSend__legacy_supportsSMSIdentification(self, v20, v21);
      }
    }
    else
    {
      LOBYTE(v4) = isPNRSupportedCachedValue == 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)_legacy_supportsSMSIdentification
{
  *(void *)&v22[7] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  if (qword_1E9739538 != -1) {
    dispatch_once(&qword_1E9739538, &unk_1EFE07A80);
  }
  if (qword_1E9739548 != -1) {
    dispatch_once(&qword_1E9739548, &unk_1EFE075E0);
  }
  unsigned __int8 v18 = -86;
  uint64_t v2 = off_1E9739530(*MEMORY[0x1E4F1CF80], nullsub_1, &v15);
  if (!v2)
  {
    id v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4, v15, v16, v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Could not create CT server connection to query _CTServerConnectionIsPhoneNumberRegistrationSupported", buf, 2u);
    }

    return 1;
  }
  uint64_t v5 = (const void *)v2;
  uint64_t v6 = off_1E9739540(v2, &v18);
  uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8, v15, v16, v17);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v20 = v18;
    __int16 v21 = 1024;
    *(_DWORD *)__int16 v22 = v6;
    v22[2] = 2048;
    *(void *)&v22[3] = v6 >> 32;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsPhoneNumberRegistrationSupported returned value { registrationSupported: %d, error: (%d:%ld) }", buf, 0x18u);
  }

  CFRelease(v5);
  if (v6)
  {
    id v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v20 = v6;
      __int16 v21 = 2048;
      *(void *)__int16 v22 = v6 >> 32;
      _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, "Failed to query _CTServerConnectionIsPhoneNumberRegistrationSupported from CT { error: (%d:%ld) }", buf, 0x12u);
    }

    return 1;
  }
  return v18 != 0;
}

- (BOOL)supportsAppleIDIdentification
{
  return 1;
}

- (NSString)userAgentString
{
  id v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], a2, v2);
  uint64_t v6 = objc_msgSend_userAgentString(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)productName
{
  id v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], a2, v2);
  uint64_t v6 = objc_msgSend_productName(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)productVersion
{
  id v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], a2, v2);
  uint64_t v6 = objc_msgSend_productVersion(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)productBuildVersion
{
  id v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], a2, v2);
  uint64_t v6 = objc_msgSend_productBuildVersion(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)productOSVersion
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_productName(self, a2, v2);
  uint64_t v8 = objc_msgSend_productVersion(self, v6, v7);
  uint64_t v11 = objc_msgSend_productBuildVersion(self, v9, v10);
  id v13 = objc_msgSend_stringWithFormat_(v4, v12, @"%@,%@,%@", v5, v8, v11);

  return (NSString *)v13;
}

- (NSString)deviceInformationString
{
  id v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], a2, v2);
  uint64_t v6 = objc_msgSend_deviceInformationString(v3, v4, v5);

  return (NSString *)v6;
}

- (void)_lockdownStateChanged:(id)a3
{
  id v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], a2, (uint64_t)a3);
  int isActivated = objc_msgSend_isActivated(v3, v4, v5);

  if (isActivated)
  {
    uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v18 = 0;
      _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Lockdown became activated, let's notify", v18, 2u);
    }

    id v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v10, v11);
    objc_msgSend___mainThreadPostNotificationName_object_(v12, v13, @"__kFaceTimeDeviceRegistrationStateChangedNotification", 0);

    long long v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v14, v15);
    objc_msgSend___mainThreadPostNotificationName_object_(v16, v17, @"__kFaceTimeDeviceRegistrationCapabilityChangedNotification", 0);
  }
}

- (BOOL)nonWifiFaceTimeAvailable
{
  uint64_t v4 = objc_msgSend_sharedInstance(FTEntitlementSupport, a2, v2);
  if (objc_msgSend_faceTimeNonWiFiEntitled(v4, v5, v6)) {
    char v8 = objc_msgSend_nonWifiAvailableForBundleId_(self, v7, @"com.apple.facetime");
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)nonWifiAvailableForBundleId:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_sharedInstance(FTUserConfiguration, v4, v5);
  char v8 = objc_msgSend_cellularDataEnabledForBundleId_(v6, v7, (uint64_t)v3);

  if (v8)
  {
    char v11 = 1;
  }
  else
  {
    id v12 = objc_msgSend_sharedInstance(FTNetworkSupport, v9, v10);
    char v11 = objc_msgSend_allowAnyNetwork(v12, v13, v14);
  }
  return v11;
}

- (BOOL)wifiAllowedForBundleId:(id)a3
{
  id v3 = a3;
  if (MGGetBoolAnswer())
  {
    uint64_t v6 = objc_msgSend_sharedInstance(FTUserConfiguration, v4, v5);
    if (objc_msgSend_wifiAllowedForBundleId_(v6, v7, (uint64_t)v3))
    {
      char v10 = 1;
    }
    else
    {
      char v11 = objc_msgSend_sharedInstance(FTNetworkSupport, v8, v9);
      char v10 = objc_msgSend_allowAnyNetwork(v11, v12, v13);
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)nonBluetoothAvailableForBundleId:(id)a3
{
  return 1;
}

- (BOOL)nonWifiCallingAvailable
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1F4181798])(self, sel_nonWifiFaceTimeAvailable);
}

- (BOOL)supportsApplePay
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Apple Pay", v7, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsApplePayState = self->_supportsApplePayState;
    if (supportsApplePayState == -1)
    {
      if (qword_1E9739460 != -1) {
        dispatch_once(&qword_1E9739460, &unk_1EFE07AC0);
      }
      int64_t supportsApplePayState = (int64_t)off_1E9739458;
      if (off_1E9739458) {
        int64_t supportsApplePayState = off_1E9739458();
      }
      self->_int64_t supportsApplePayState = supportsApplePayState;
    }
    return supportsApplePayState == 1;
  }
}

- (BOOL)supportsManateeForAppleCash
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Apple Cash", v7, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsManateeForAppleCash = self->_supportsManateeForAppleCash;
    if (supportsManateeForAppleCash == -1)
    {
      if (qword_1E9739480 != -1) {
        dispatch_once(&qword_1E9739480, &unk_1EFE07AE0);
      }
      int64_t supportsManateeForAppleCash = (int64_t)off_1E9739478;
      if (off_1E9739478) {
        int64_t supportsManateeForAppleCash = off_1E9739478();
      }
      self->_int64_t supportsManateeForAppleCash = supportsManateeForAppleCash;
    }
    return supportsManateeForAppleCash == 1;
  }
}

- (BOOL)supportsRegionForAppleCash
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Apple Cash", v7, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsRegionForAppleCash = self->_supportsRegionForAppleCash;
    if (supportsRegionForAppleCash == -1)
    {
      if (qword_1E9739490 != -1) {
        dispatch_once(&qword_1E9739490, &unk_1EFE07600);
      }
      int64_t supportsRegionForAppleCash = (int64_t)off_1E9739488;
      if (off_1E9739488) {
        int64_t supportsRegionForAppleCash = off_1E9739488();
      }
      self->_int64_t supportsRegionForAppleCash = supportsRegionForAppleCash;
    }
    return supportsRegionForAppleCash == 1;
  }
}

- (BOOL)supportsFMDV2
{
  int64_t supportsFMDV2State = self->_supportsFMDV2State;
  if (supportsFMDV2State == -1)
  {
    if (qword_1E9739468 != -1) {
      dispatch_once(&qword_1E9739468, &unk_1EFE07560);
    }
    int64_t supportsFMDV2State = (int64_t)off_1E9739470;
    if (off_1E9739470) {
      int64_t supportsFMDV2State = off_1E9739470();
    }
    self->_int64_t supportsFMDV2State = supportsFMDV2State;
  }
  return supportsFMDV2State == 1;
}

- (BOOL)supportsVenice
{
  int64_t supportsVeniceState = self->_supportsVeniceState;
  if (supportsVeniceState == -1)
  {
    int64_t supportsVeniceState = MGGetBoolAnswer();
    self->_int64_t supportsVeniceState = supportsVeniceState;
  }
  return supportsVeniceState == 1;
}

- (BOOL)supportsKeySharing
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v10 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Key Sharing", v10, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsKeySharingState = self->_supportsKeySharingState;
    if (supportsKeySharingState == -1)
    {
      uint64_t v7 = (void *)MEMORY[0x1AD0D4F50](@"DAManager", @"DigitalAccess");
      int64_t supportsKeySharingState = objc_msgSend_isSupported(v7, v8, v9);
      self->_int64_t supportsKeySharingState = supportsKeySharingState;
    }
    return supportsKeySharingState == 1;
  }
}

- (BOOL)supportsHarmony
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Harmony", v7, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsHarmonyState = self->_supportsHarmonyState;
    if (supportsHarmonyState == -1)
    {
      if (qword_1EB47C738 != -1) {
        dispatch_once(&qword_1EB47C738, &unk_1EFE07580);
      }
      int64_t supportsHarmonyState = (int64_t)off_1EB47C730;
      if (off_1EB47C730) {
        int64_t supportsHarmonyState = off_1EB47C730();
      }
      self->_int64_t supportsHarmonyState = supportsHarmonyState;
    }
    return supportsHarmonyState == 1;
  }
}

- (BOOL)supportsZelkova
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Zelkova", v7, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsZelkovaState = self->_supportsZelkovaState;
    if (supportsZelkovaState == -1)
    {
      if (qword_1E97394C8 != -1) {
        dispatch_once(&qword_1E97394C8, &unk_1EFE07B00);
      }
      int64_t supportsZelkovaState = (int64_t)off_1E97394C0;
      if (off_1E97394C0) {
        int64_t supportsZelkovaState = off_1E97394C0();
      }
      self->_int64_t supportsZelkovaState = supportsZelkovaState;
    }
    return supportsZelkovaState == 1;
  }
}

- (BOOL)supportsManateeActivitySharing
{
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Activity Sharing", v7, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsManateeActivitySharing = self->_supportsManateeActivitySharing;
    if (supportsManateeActivitySharing == -1)
    {
      int64_t supportsManateeActivitySharing = _os_feature_enabled_impl();
      self->_int64_t supportsManateeActivitySharing = supportsManateeActivitySharing;
    }
    return supportsManateeActivitySharing == 1;
  }
}

- (BOOL)supportsUWB
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB47C740 != -1) {
    dispatch_once(&qword_1EB47C740, &unk_1EFE07B60);
  }
  if (byte_1E9739578)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting UWB", (uint8_t *)&v15, 2u);
    }

    return 1;
  }
  else
  {
    int64_t supportsUWBState = self->_supportsUWBState;
    if (supportsUWBState == -1)
    {
      uint64_t v7 = (void *)MEMORY[0x1AD0D4F50](@"NISession", @"NearbyInteraction");
      unsigned int isSupported = objc_msgSend_isSupported(v7, v8, v9);
      self->_int64_t supportsUWBState = isSupported;
      uint64_t v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = @"NO";
        if (isSupported) {
          uint64_t v14 = @"YES";
        }
        int v15 = 138412290;
        long long v16 = v14;
        _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Supports UWB: %@", (uint8_t *)&v15, 0xCu);
      }

      int64_t supportsUWBState = self->_supportsUWBState;
    }
    return supportsUWBState == 1;
  }
}

- (BOOL)slowCPUDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BD2C08;
  block[3] = &unk_1E5D1AD78;
  block[4] = self;
  if (qword_1E9739560 != -1) {
    dispatch_once(&qword_1E9739560, block);
  }
  return byte_1E9739558;
}

- (int)cpuFamily
{
  if (qword_1E9739570 != -1) {
    dispatch_once(&qword_1E9739570, &unk_1EFE07B20);
  }
  return dword_1E9739568;
}

- (BOOL)lowRAMDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BD2EC0;
  block[3] = &unk_1E5D1AD78;
  block[4] = self;
  if (qword_1EB47C718 != -1) {
    dispatch_once(&qword_1EB47C718, block);
  }
  return byte_1E97394B8;
}

- (int64_t)memorySize
{
  if (qword_1EB47C728 != -1) {
    dispatch_once(&qword_1EB47C728, &unk_1EFE07B40);
  }
  return qword_1EB47C720;
}

- (BOOL)_enoughPowerToSupportEffects
{
  size_t v5 = 0;
  sysctlbyname("hw.cpufamily", 0, &v5, 0, 0);
  uint64_t v4 = 0;
  sysctlbyname("hw.cpufamily", &v4, &v5, 0, 0);
  BOOL result = 0;
  if (v4 > 2465937351)
  {
    if (v4 > 2823887817)
    {
      if (v4 == 2823887818) {
        return result;
      }
      uint64_t v3 = 3172666089;
    }
    else
    {
      if (v4 == 2465937352) {
        return result;
      }
      uint64_t v3 = 2517073649;
    }
  }
  else if (v4 > 747742333)
  {
    if (v4 == 747742334) {
      return result;
    }
    uint64_t v3 = 933271106;
  }
  else
  {
    if (v4 == 214503012) {
      return result;
    }
    uint64_t v3 = 506291073;
  }
  if (v4 != v3) {
    return 1;
  }
  return result;
}

- (BOOL)supportsFunCam
{
  char v4 = objc_msgSend__enoughPowerToSupportEffects(self, a2, v2);
  char v7 = objc_msgSend_lowRAMDevice(self, v5, v6);
  if (objc_msgSend_deviceType(self, v8, v9) == 4) {
    return v4 & (v7 ^ 1);
  }
  else {
    return v4;
  }
}

- (BOOL)isGreenTea
{
  return self->_isGreenTea;
}

- (BOOL)supportsHandoff
{
  return self->_supportsHandoff;
}

- (BOOL)supportsTethering
{
  return self->_supportsTethering;
}

- (BOOL)supportsFrontFacingCamera
{
  return self->_supportsFrontCamera;
}

- (BOOL)supportsBackFacingCamera
{
  return self->_supportsBackCamera;
}

- (BOOL)supportsWLAN
{
  return self->_supportsWLAN;
}

- (BOOL)supportsWiFi
{
  return self->_supportsWiFi;
}

- (BOOL)supportsCellularData
{
  return self->_supportsCellularData;
}

- (BOOL)supportsMMS
{
  return self->_supportsMMS;
}

- (BOOL)mmsConfigured
{
  return self->_mmsConfigured;
}

- (BOOL)commCenterDead
{
  return self->_commCenterDead;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPNRSubscription, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);

  objc_storeStrong((id *)&self->_number, 0);
}

@end