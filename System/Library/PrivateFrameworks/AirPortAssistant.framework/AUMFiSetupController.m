@interface AUMFiSetupController
+ (id)setupController;
- (AUMFiSetupController)init;
- (NSMutableSet)setupDelegates;
- (NSString)destinationNetworkPassword;
- (NSTimer)linkUpOnDestinationNetworkTimer;
- (id)targetBaseInfoDict;
- (int)cancelSetup;
- (int)endSetup:(int)a3;
- (int)joinTargetSWAP;
- (int)sendProgressToUI:(int)a3 withParamDict:(id)a4;
- (int)sendSetupCompleteToUIWithResult:(int)a3;
- (int)sendiAPOverWiFiDeviceConfiguredXPCMessage;
- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4;
- (int)updateSettingsAsync;
- (void)_startEasyConfigWhenReady;
- (void)acquireDestinationNetworkPassword;
- (void)askUserForNetworkPassword:(id)a3;
- (void)askUserForSetupCodeWithRetryStatus:(BOOL)a3;
- (void)askUserForUncertified;
- (void)callbackAskUserForPasswordResult:(int)a3 password:(id)a4 remember:(int)a5;
- (void)callbackAskUserForSetupCodeResult:(int)a3 password:(id)a4;
- (void)callbackAskUserForUncertifiedResult:(int)a3;
- (void)createEasyConfigDeviceConfiguration;
- (void)dealloc;
- (void)handleEasyConfigProgress:(id)a3;
- (void)handleEasyConfigProgressAppliedConfigurationToDevice:(id)a3;
- (void)handleEasyConfigProgressSearchingForPostConfigDevice:(id)a3;
- (void)handleEasyConfigStopped:(id)a3;
- (void)invalidateLinkUpOnDestinationNetworkTimer;
- (void)joinDestinationAPDone:(id)a3;
- (void)joinDestinationNetworkTimeoutFired:(id)a3;
- (void)joinSWAPDone:(id)a3;
- (void)linkChangeNotification:(id)a3;
- (void)linkUpOnDestinationAP:(id)a3;
- (void)linkUpOnSWAP:(id)a3;
- (void)logCompletionStatus:(int)a3;
- (void)setDestinationNetworkPassword:(id)a3;
- (void)setLinkUpOnDestinationNetworkTimer:(id)a3;
- (void)startEasyConfigWhenReady;
- (void)startListeningForEasyConfigDeviceStatusNotifications;
- (void)stopListeningToAllNotifications;
- (void)stopListeningToEasyConfigDeviceStatusNotifications;
@end

@implementation AUMFiSetupController

+ (id)setupController
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"+[AUMFiSetupController setupController]", 800, (uint64_t)"\n", v2, v3, v4, v5, vars0);
  }
  v6 = objc_alloc_init(AUMFiSetupController);

  return v6;
}

- (AUMFiSetupController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AUMFiSetupController;
  v6 = [(AUSetupController *)&v8 init];
  if (v6) {
    v6->_mfiSetupDelegates = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController init]", 800, (uint64_t)"\n", v2, v3, v4, v5, (uint64_t)v8.receiver);
  }
  v6->_successfullyEstablishedLinkOnTargetDeviceSWAP = 0;
  v6->_successfullyEstablishedLinkOnDestinationAP = 0;
  v6->_promptedUserForDestinationWiFiPSK = 0;
  v6->_postediAPAccessoryConfiguredNotification = 0;
  v6->_destinationNetworkPasswordAccepted = 0;
  v6->_setupEnded = 0;
  v6->_waitingForLinkState = 0;
  v6->_easyConfigPreConfigMetrics.hitJoiningTargetSWAPTimeout = 0;
  v6->_easyConfigPostConfigMetrics.hitJoiningDestinationAPTimeout = 0;
  return v6;
}

- (void)dealloc
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController dealloc]", 800, (uint64_t)"\n", v3, v4, v5, v6, (uint64_t)v14.receiver);
  }
  objc_msgSend_invalidateLinkUpOnDestinationNetworkTimer(self, a2, v2);
  objc_msgSend_stopListeningToAllNotifications(self, v8, v9);
  objc_msgSend_closeAllConnections(self, v10, v11);

  self->_mfiSetupDelegates = 0;
  self->_autoGuessRecommendationDict = 0;

  self->_setupOptionsDict = 0;
  self->_destinationNetworkScanRecord = 0;

  self->_targetMFiDeviceScanRecord = 0;
  self->_destinationNetworkSSID = 0;

  self->_destinationNetworkPassword = 0;
  self->_accessoryResponseDict = 0;
  askUserForPasswordSemaphore = self->_askUserForPasswordSemaphore;
  if (askUserForPasswordSemaphore) {
    dispatch_release(askUserForPasswordSemaphore);
  }
  linkUpOnTargetSWAPSemaphore = self->_linkUpOnTargetSWAPSemaphore;
  if (linkUpOnTargetSWAPSemaphore) {
    dispatch_release(linkUpOnTargetSWAPSemaphore);
  }
  self->_askUserForPasswordSemaphore = 0;
  self->_linkUpOnTargetSWAPSemaphore = 0;
  v14.receiver = self;
  v14.super_class = (Class)AUMFiSetupController;
  [(AUSetupController *)&v14 dealloc];
}

- (int)cancelSetup
{
  v6.receiver = self;
  v6.super_class = (Class)AUMFiSetupController;
  int v3 = [(AUSetupController *)&v6 cancelSetup];
  linkUpOnTargetSWAPSemaphore = self->_linkUpOnTargetSWAPSemaphore;
  if (linkUpOnTargetSWAPSemaphore) {
    dispatch_semaphore_signal(linkUpOnTargetSWAPSemaphore);
  }
  if (v3 == -6771) {
    return 0;
  }
  else {
    return v3;
  }
}

- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4
{
  self->_easyConfigPreConfigMetrics.startTime = CFAbsoluteTimeGetCurrent();
  self->_autoGuessRecommendationDict = (NSDictionary *)a3;
  setupOptionsDict = (NSDictionary *)a4;
  self->_setupOptionsDict = setupOptionsDict;
  if (self->_autoGuessRecommendationDict) {
    BOOL v13 = setupOptionsDict == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    return -6762;
  }
  if (dword_2681481A0 <= 800)
  {
    if (dword_2681481A0 != -1
      || (BOOL v14 = sub_226865630((uint64_t)&dword_2681481A0, 0x320u), setupOptionsDict = self->_setupOptionsDict, v14))
    {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController setupFromAutoguessRecommendation:withOptions:]", 800, (uint64_t)"Setup Options: %@\n", v9, v10, v11, v12, (uint64_t)setupOptionsDict);
      setupOptionsDict = self->_setupOptionsDict;
    }
  }
  v15 = (NSString *)objc_msgSend_objectForKey_(setupOptionsDict, v8, @"kBSAutoGuessSetupOptionKey_BaseName");
  self->_postConfigTargetDeviceFriendlyName = v15;
  if (!objc_msgSend_length(v15, v16, v17)) {
    return -6762;
  }
  self->_destinationNetworkScanRecord = (NSDictionary *)(id)objc_msgSend_objectForKey_(self->_setupOptionsDict, v18, @"kBSAutoGuessSetupOptionKey_SourceNetwork");
  v21 = (NSDictionary *)(id)objc_msgSend_objectForKey_(self->_setupOptionsDict, v19, @"BSAutoGuess_UnconfiguredNetwork");
  self->_targetMFiDeviceScanRecord = v21;
  int result = -6762;
  if (self->_destinationNetworkScanRecord && v21)
  {
    v23 = objc_msgSend_objectForKey_(v21, v20, @"SNR");
    v25 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v24, @"RSSI");
    v27 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v26, @"CHANNEL");
    self->_easyConfigPreConfigMetrics.snrOfSWAP = objc_msgSend_integerValue(v23, v28, v29);
    self->_easyConfigPreConfigMetrics.rssiOfSWAP = objc_msgSend_integerValue(v25, v30, v31);
    self->_easyConfigPreConfigMetrics.channelOfSWAP = objc_msgSend_integerValue(v27, v32, v33);
    v35 = objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v34, @"SNR");
    v37 = objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v36, @"RSSI");
    v39 = objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v38, @"CHANNEL");
    self->_easyConfigPostConfigMetrics.snrOfDestinationAP = objc_msgSend_integerValue(v35, v40, v41);
    self->_easyConfigPostConfigMetrics.rssiOfDestinationAP = objc_msgSend_integerValue(v37, v42, v43);
    self->_easyConfigPostConfigMetrics.channelOfDestinationAP = objc_msgSend_integerValue(v39, v44, v45);
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController setupFromAutoguessRecommendation:withOptions:]", 800, (uint64_t)"Destination Network Scan Record: %@\n", v46, v47, v48, v49, (uint64_t)self->_destinationNetworkScanRecord);
    }
    id v50 = [NSString alloc];
    uint64_t v52 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v51, (uint64_t)self->_destinationNetworkScanRecord);
    v54 = (NSString *)objc_msgSend_initWithString_(v50, v53, v52);
    self->_destinationNetworkSSID = v54;
    if (v54)
    {
      uint64_t v56 = objc_msgSend_objectForKey_(self->_autoGuessRecommendationDict, v55, @"BSAutoGuess_SourceNetwork");
      uint64_t v58 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v57, v56);
      self->_easyConfigPreConfigMetrics.destinationNetworkRecommendationUsed = objc_msgSend_isEqualToString_(self->_destinationNetworkSSID, v59, v58);
      postConfigTargetDeviceFriendlyName = self->_postConfigTargetDeviceFriendlyName;
      uint64_t v62 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v61, (uint64_t)self->_targetMFiDeviceScanRecord);
      self->_easyConfigPreConfigMetrics.userChangedFriendlyName = objc_msgSend_isEqualToString_(postConfigTargetDeviceFriendlyName, v63, v62) ^ 1;
      v66 = objc_msgSend_sharedInstance(WiFiUtils, v64, v65);
      objc_msgSend_setAutoJoinState_(v66, v67, 0);
      v68 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      int result = 0;
      self->_linkUpOnTargetSWAPSemaphore = v68;
      return result;
    }
    return -6762;
  }
  return result;
}

- (int)updateSettingsAsync
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_226905D48;
  block[3] = &unk_2647B8428;
  block[4] = self;
  dispatch_async(global_queue, block);
  return 0;
}

- (void)linkChangeNotification:(id)a3
{
  if (!self->_waitingForLinkState || (uint64_t v8 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3)) == 0)
  {
    uint64_t v24 = 0;
LABEL_22:
    v18 = &stru_26DA6BE88;
    goto LABEL_23;
  }
  uint64_t v10 = (void *)v8;
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"linkDict: %@\n", v3, v4, v5, v6, (uint64_t)v10);
  }
  uint64_t v11 = objc_msgSend_objectForKey_(v10, v9, @"kNetworkLinkManager_LinkChangeKey_LinkState");
  uint64_t v14 = objc_msgSend_integerValue(v11, v12, v13);
  if (v14 != 1)
  {
    uint64_t v24 = v14;
    goto LABEL_22;
  }
  objc_msgSend_objectForKey_(v10, v15, @"kNetworkLinkManager_LinkChangeKey_IfName");
  v18 = (__CFString *)objc_msgSend_objectForKey_(v10, v16, @"kNetworkLinkManager_LinkChangeKey_WiFiName");
  if (v18)
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"Link Up on SSID: %@\n", v3, v4, v5, v6, (uint64_t)v18);
    }
    if (self->_waitingForLinkState == 1) {
      v19 = &OBJC_IVAR___AUMFiSetupController__targetMFiDeviceScanRecord;
    }
    else {
      v19 = &OBJC_IVAR___AUMFiSetupController__destinationNetworkScanRecord;
    }
    v20 = objc_msgSend_objectForKey_(*(void **)((char *)&self->super.super.super.isa + *v19), v17, @"SSID_STR");
    if (objc_msgSend_isEqualToString_(v20, v21, (uint64_t)v18))
    {
      int waitingForLinkState = self->_waitingForLinkState;
      if (waitingForLinkState == 2)
      {
        objc_msgSend_linkUpOnDestinationAP_(self, v22, (uint64_t)v18);
      }
      else if (waitingForLinkState == 1)
      {
        objc_msgSend_linkUpOnSWAP_(self, v22, (uint64_t)v18);
      }
    }
  }
  uint64_t v24 = 1;
LABEL_23:
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"eWaitingForLinkState: %d\n", v3, v4, v5, v6, self->_waitingForLinkState);
  }
  int v25 = self->_waitingForLinkState;
  if (!v25) {
    return;
  }
  if (!v24)
  {
    if (dword_2681481A0 > 800 || dword_2681481A0 == -1 && !sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      return;
    }
    v27 = "Link Down\n";
    goto LABEL_43;
  }
  if (!v18)
  {
    if (dword_2681481A0 > 800 || dword_2681481A0 == -1 && !sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      return;
    }
    v27 = "No SSID Associated\n";
LABEL_43:
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)v27, v3, v4, v5, v6, v29);
    return;
  }
  if (v25 == 1)
  {
    if (self->_successfullyEstablishedLinkOnTargetDeviceSWAP) {
      return;
    }
    int v26 = dword_2681481A0;
    if (dword_2681481A0 > 800) {
      return;
    }
  }
  else
  {
    if (v25 != 2) {
      return;
    }
    if (self->_successfullyEstablishedLinkOnDestinationAP) {
      return;
    }
    int v26 = dword_2681481A0;
    if (dword_2681481A0 >= 801) {
      return;
    }
  }
  if (v26 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"ERROR: Currently associated to: %@, expected: %@\n", v3, v4, v5, v6, (uint64_t)v18);
  }
}

- (void)linkUpOnSWAP:(id)a3
{
  self->_easyConfigPreConfigMetrics.secondsToGetLinkUpOnSWAP = CFAbsoluteTimeGetCurrent() - self->_timeSWAPJoinStarted;
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController linkUpOnSWAP:]", 800, (uint64_t)"SSID: %@\n", v5, v6, v7, v8, (uint64_t)a3);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_linkUpOnTargetSWAPSemaphore);
  self->_successfullyEstablishedLinkOnTargetDeviceSWAP = 1;
  self->_int waitingForLinkState = 0;
}

- (void)linkUpOnDestinationAP:(id)a3
{
  self->_easyConfigPostConfigMetrics.secondsToGetLinkUpOnDestination = CFAbsoluteTimeGetCurrent()
                                                                     - self->_timeDestinationAPJoinStarted;
  objc_msgSend_invalidateLinkUpOnDestinationNetworkTimer(self, v5, v6);
  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v7, v8);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, @"com.apple.AirPort.WiFiShim.Notification.LinkChange", 0);
  objc_msgSend_resumePostConfig(self->_easyConfigDevice, v11, v12);
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController linkUpOnDestinationAP:]", 800, (uint64_t)"SSID: %@\n", v13, v14, v15, v16, (uint64_t)a3);
  }
  self->_successfullyEstablishedLinkOnDestinationAP = 1;
  self->_int waitingForLinkState = 0;
}

- (int)joinTargetSWAP
{
  self->_int waitingForLinkState = 1;
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)))
  {
    uint64_t v3 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, a2, @"SSID_STR");
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController joinTargetSWAP]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, v3);
  }
  self->_timeSWAPJoinStarted = CFAbsoluteTimeGetCurrent();
  uint64_t v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v8, v9);
  objc_msgSend_addObserver_selector_name_object_(v10, v11, (uint64_t)self, sel_joinSWAPDone_, @"com.apple.WiFiUtils.Join.Complete", 0);
  uint64_t v14 = objc_msgSend_sharedInstance(WiFiUtils, v12, v13);
  targetMFiDeviceScanRecord = self->_targetMFiDeviceScanRecord;

  return objc_msgSend_joinNetworkWithScanInfoAsync_password_rememberChoice_(v14, v15, (uint64_t)targetMFiDeviceScanRecord, 0, 1);
}

- (void)joinDestinationNetworkTimeoutFired:(id)a3
{
  linkUpOnDestinationNetworkTimer = self->_linkUpOnDestinationNetworkTimer;
  if (linkUpOnDestinationNetworkTimer)
  {
    if (objc_msgSend_isValid(linkUpOnDestinationNetworkTimer, a2, (uint64_t)a3))
    {
      objc_msgSend_invalidateLinkUpOnDestinationNetworkTimer(self, v5, v6);
      if (!self->_successfullyEstablishedLinkOnDestinationAP)
      {
        self->_easyConfigPostConfigMetrics.hitJoiningDestinationAPTimeout = 1;
        uint64_t v9 = objc_msgSend_sharedInstance(WiFiUtils, v7, v8);
        objc_msgSend_cancelAsync(v9, v10, v11);
        if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController joinDestinationNetworkTimeoutFired:]", 800, (uint64_t)"ERROR: Did not successfully join destination network. Hit %d sec timeout.\n", v13, v14, v15, v16, 60);
        }
        objc_msgSend_endSetup_(self, v12, 4294960574);
      }
    }
  }
}

- (void)joinDestinationAPDone:(id)a3
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, @"com.apple.WiFiUtils.Join.Complete", 0);
  uint64_t v9 = objc_msgSend_userInfo(a3, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, @"WiFiUtils_OSStatus");
  if (v11)
  {
    uint64_t v14 = objc_msgSend_integerValue(v11, v12, v13);
    uint64_t v20 = v14;
    if (v14)
    {
      if (v14 == -16)
      {
        if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController joinDestinationAPDone:]", 800, (uint64_t)"ERROR: Incorrect destination network password for %@\n", v16, v17, v18, v19, (uint64_t)self->_destinationNetworkSSID);
        }
        objc_msgSend_endSetup_(self, v15, 4294960534);
        LODWORD(v20) = -16;
      }
      else if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)))
      {
        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController joinDestinationAPDone:]", 800, (uint64_t)"ERROR: %#m\n", v16, v17, v18, v19, v20);
      }
    }
    else
    {
      self->_destinationNetworkPasswordAccepted = 1;
    }
  }
  else
  {
    LODWORD(v20) = -6705;
  }
  self->_easyConfigPostConfigMetrics.wifiJoinDestinationAPError = v20;
}

- (void)joinSWAPDone:(id)a3
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, @"com.apple.WiFiUtils.Join.Complete", 0);
  uint64_t v9 = objc_msgSend_userInfo(a3, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, @"WiFiUtils_OSStatus");
  if (v11) {
    int v14 = objc_msgSend_integerValue(v11, v12, v13);
  }
  else {
    int v14 = -6705;
  }
  self->_easyConfigPreConfigMetrics.wifiJoinSWAPError = v14;
}

- (void)invalidateLinkUpOnDestinationNetworkTimer
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController invalidateLinkUpOnDestinationNetworkTimer]", 800, (uint64_t)"\n", v3, v4, v5, v6, v9);
  }
  objc_msgSend_invalidate(self->_linkUpOnDestinationNetworkTimer, a2, v2);

  objc_msgSend_setLinkUpOnDestinationNetworkTimer_(self, v8, 0);
}

- (void)acquireDestinationNetworkPassword
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController acquireDestinationNetworkPassword]", 800, (uint64_t)"\n", v2, v3, v4, v5, v18);
  }
  char v19 = 0;
  if (objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, a2, (uint64_t)self->_destinationNetworkScanRecord, 0, &v19))
  {
    if (v19)
    {
      if (dword_2681481A0 > 800 || dword_2681481A0 == -1 && !sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
        goto LABEL_12;
      }
      uint64_t v12 = "ERROR: Destination network has Enterprise security.\n";
LABEL_11:
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController acquireDestinationNetworkPassword]", 800, (uint64_t)v12, v8, v9, v10, v11, v18);
LABEL_12:
      objc_msgSend_endSetup_(self, v7, 4294960534);
      return;
    }
    uint64_t NetworkPassword = objc_msgSend_getNetworkPassword_(WiFiUtils, v7, (uint64_t)self->_destinationNetworkScanRecord);
    objc_msgSend_setDestinationNetworkPassword_(self, v14, NetworkPassword);
    self->_easyConfigPostConfigMetrics.destinationNetworkPSKInKeychain = 1;
    if (!self->_destinationNetworkPassword)
    {
      self->_askUserForPasswordSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v15, (uint64_t)sel_askUserForNetworkPassword_, self->_destinationNetworkSSID, 0);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_askUserForPasswordSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      self->_easyConfigPostConfigMetrics.destinationNetworkPSKInKeychain = 0;
      if (!objc_msgSend_length(self->_destinationNetworkPassword, v16, v17))
      {
        if (dword_2681481A0 > 800 || dword_2681481A0 == -1 && !sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
          goto LABEL_12;
        }
        uint64_t v12 = "ERROR: Network is secure, but _destinationNetworkPassword is zero length!\n";
        goto LABEL_11;
      }
    }
  }
}

- (void)startListeningForEasyConfigDeviceStatusNotifications
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController startListeningForEasyConfigDeviceStatusNotifications]", 800, (uint64_t)"\n", v3, v4, v5, v6, v15);
  }
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_addObserver_selector_name_object_(v8, v9, (uint64_t)self, sel_handleEasyConfigProgress_, *MEMORY[0x263F3B090], 0);
  uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v10, v11);
  uint64_t v14 = *MEMORY[0x263F3B098];

  objc_msgSend_addObserver_selector_name_object_(v12, v13, (uint64_t)self, sel_handleEasyConfigStopped_, v14, 0);
}

- (void)stopListeningToEasyConfigDeviceStatusNotifications
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController stopListeningToEasyConfigDeviceStatusNotifications]", 800, (uint64_t)"\n", v3, v4, v5, v6, v15);
  }
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, *MEMORY[0x263F3B090], 0);
  uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v10, v11);
  uint64_t v14 = *MEMORY[0x263F3B098];

  objc_msgSend_removeObserver_name_object_(v12, v13, (uint64_t)self, v14, 0);
}

- (void)handleEasyConfigProgress:(id)a3
{
  unint64_t lastHeardEasyConfigProgressNotification = self->_lastHeardEasyConfigProgressNotification;
  uint64_t v6 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x263F3B0E0]);
  int64_t v11 = objc_msgSend_integerValue(v8, v9, v10);
  self->_unint64_t lastHeardEasyConfigProgressNotification = v11;
  if (v11 != 50)
  {
    int64_t v17 = v11;
    if (v11 != 40)
    {
      if (v11 == 10)
      {
        if (lastHeardEasyConfigProgressNotification >= 0xB
          && dword_2681481A0 <= 800
          && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)))
        {
          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgress:]", 800, (uint64_t)"RETRY: EasyConfig backed up states\n", v13, v14, v15, v16, v33);
        }
        return;
      }
      if (dword_2681481A0 > 800) {
        return;
      }
      if (dword_2681481A0 == -1)
      {
        if (!sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
          return;
        }
        int64_t v17 = self->_lastHeardEasyConfigProgressNotification;
      }
      if (v17 <= 29)
      {
        uint64_t v18 = "Start";
        switch(v17)
        {
          case 1:
            goto LABEL_53;
          case 2:
            uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Final");
            break;
          case 3:
            uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Error");
            break;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            goto LABEL_47;
          case 10:
            uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Search for pre-config device");
            break;
          default:
            if (v17 != 20) {
              goto LABEL_47;
            }
            uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Authenticating pre-config device");
            break;
        }
        goto LABEL_54;
      }
      if (v17 <= 49)
      {
        if (v17 == 30)
        {
          uint64_t v18 = "Applying configuration to device";
LABEL_53:
          uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)v18);
          goto LABEL_54;
        }
        if (v17 == 40)
        {
          uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Applied configuration to device");
          goto LABEL_54;
        }
      }
      else
      {
        switch(v17)
        {
          case '2':
            uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Searching for post-config device");
            goto LABEL_54;
          case '<':
            uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Performing post-config check of device");
            goto LABEL_54;
          case 'F':
            uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Performed post-config check of device");
LABEL_54:
            sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgress:]", 800, (uint64_t)"Unhandled: %@\n", v20, v21, v22, v23, v19);
            return;
        }
      }
LABEL_47:
      if (v17 == 100) {
        uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Configuration complete");
      }
      else {
        uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"?");
      }
      goto LABEL_54;
    }
    if (lastHeardEasyConfigProgressNotification <= 0x27)
    {
      MEMORY[0x270F9A6D0](self, sel_handleEasyConfigProgressAppliedConfigurationToDevice_, a3);
      return;
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1)
    {
      uint64_t v24 = NSString;
      goto LABEL_28;
    }
    if (!sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      return;
    }
    int64_t v31 = self->_lastHeardEasyConfigProgressNotification;
    uint64_t v24 = NSString;
    if (v31 <= 29)
    {
      int v25 = "Start";
      switch(v31)
      {
        case 1:
          goto LABEL_29;
        case 2:
          uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Final");
          break;
        case 3:
          uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Error");
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_71;
        case 10:
          uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Search for pre-config device");
          break;
        default:
          if (v31 != 20) {
            goto LABEL_71;
          }
          uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Authenticating pre-config device");
          break;
      }
      goto LABEL_30;
    }
    if (v31 <= 49)
    {
      if (v31 == 30)
      {
        uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Applying configuration to device");
        goto LABEL_30;
      }
      if (v31 == 40)
      {
LABEL_28:
        int v25 = "Applied configuration to device";
LABEL_29:
        uint64_t v26 = objc_msgSend_stringWithUTF8String_(v24, v12, (uint64_t)v25);
        goto LABEL_30;
      }
    }
    else
    {
      switch(v31)
      {
        case '2':
          uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Searching for post-config device");
          goto LABEL_30;
        case '<':
          uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Performing post-config check of device");
          goto LABEL_30;
        case 'F':
          uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Performed post-config check of device");
LABEL_30:
          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgress:]", 800, (uint64_t)"Ignoring duplicate %@\n", v27, v28, v29, v30, v26);
          return;
      }
    }
LABEL_71:
    if (v31 == 100) {
      uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"Configuration complete");
    }
    else {
      uint64_t v26 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"?");
    }
    goto LABEL_30;
  }

  MEMORY[0x270F9A6D0](self, sel_handleEasyConfigProgressSearchingForPostConfigDevice_, a3);
}

- (void)handleEasyConfigProgressAppliedConfigurationToDevice:(id)a3
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgressAppliedConfigurationToDevice:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v26);
  }
  self->_int waitingForLinkState = 2;
  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, (uint64_t)a3);
  objc_msgSend_addObserver_selector_name_object_(v9, v10, (uint64_t)self, sel_joinDestinationAPDone_, @"com.apple.WiFiUtils.Join.Complete", 0);
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgressAppliedConfigurationToDevice:]", 800, (uint64_t)"Asking WiFiUtils to join destination network: %@\n", v11, v12, v13, v14, (uint64_t)self->_destinationNetworkSSID);
  }
  self->_timeDestinationAPJoinStarted = CFAbsoluteTimeGetCurrent();
  int64_t v17 = objc_msgSend_sharedInstance(WiFiUtils, v15, v16);
  objc_msgSend_joinNetworkWithScanInfoAsync_password_rememberChoice_(v17, v18, (uint64_t)self->_destinationNetworkScanRecord, self->_destinationNetworkPassword, 2);
  uint64_t v20 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], v19, (uint64_t)self, sel_joinDestinationNetworkTimeoutFired_, 0, 0, 60.0);
  objc_msgSend_setLinkUpOnDestinationNetworkTimer_(self, v21, v20);
  uint64_t v24 = objc_msgSend_userInfo(a3, v22, v23);
  self->_accessoryResponseDict = (NSDictionary *)(id)objc_msgSend_objectForKey_(v24, v25, *MEMORY[0x263F3B0F0]);
}

- (void)handleEasyConfigProgressSearchingForPostConfigDevice:(id)a3
{
  uint64_t v4 = NSDictionary;
  uint64_t v5 = objc_msgSend_objectForKey_(self->_setupOptionsDict, a2, @"kBSAutoGuessSetupOptionKey_BaseName");
  uint64_t v8 = objc_msgSend_dictionaryWithObject_forKey_(v4, v6, v5, @"BSAssistantProgressKey_StringParameter");

  objc_msgSend_sendProgressToUI_withParamDict_(self, v7, 7, v8);
}

- (void)handleEasyConfigStopped:(id)a3
{
  uint64_t v4 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x263F3B0E8]);
  uint64_t v10 = objc_msgSend_code(v6, v7, v8);

  objc_msgSend_endSetup_(self, v9, v10);
}

- (void)createEasyConfigDeviceConfiguration
{
  uint64_t v3 = objc_msgSend_objectForKey_(self->_autoGuessRecommendationDict, a2, @"BSAutoGuess_UnconfiguredNetwork");
  uint64_t v5 = (EasyConfigDevice *)(id)objc_msgSend_deviceWithScanRecord_(MEMORY[0x263F3B110], v4, v3);
  self->_easyConfigDevice = v5;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2269074C0;
  v26[3] = &unk_2647BABF8;
  v26[4] = self;
  objc_msgSend_setPromptForSetupCodeHandler_(v5, v6, (uint64_t)v26);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend_setObject_forKey_(v7, v8, (uint64_t)self->_destinationNetworkSSID, *MEMORY[0x263F3B108]);
  objc_msgSend_acquireDestinationNetworkPassword(self, v9, v10);
  if (objc_msgSend_length(self->_destinationNetworkPassword, v11, v12)) {
    objc_msgSend_setObject_forKey_(v7, v13, (uint64_t)self->_destinationNetworkPassword, *MEMORY[0x263F3B100]);
  }
  objc_msgSend_setObject_forKey_(v7, v13, (uint64_t)self->_postConfigTargetDeviceFriendlyName, *MEMORY[0x263F3B0D0]);
  if (objc_msgSend_scanInfoIsMFIAirPlayDevice_(WiFiUtils, v14, (uint64_t)self->_targetMFiDeviceScanRecord))
  {
    uint64_t v16 = objc_msgSend_objectForKey_(self->_setupOptionsDict, v15, @"kBSAutoGuessSetupOptionKey_AirPlayPassword");
    uint64_t v19 = objc_msgSend_length(v16, v17, v18);
    unsigned __int8 v20 = v19 != 0;
    if (v19) {
      objc_msgSend_setObject_forKey_(v7, v15, (uint64_t)v16, *MEMORY[0x263F3B0D8]);
    }
    self->_easyConfigPreConfigMetrics.playPasswordSet = v20;
  }
  objc_msgSend_setConfiguration_(self->_easyConfigDevice, v15, (uint64_t)v7);
  objc_msgSend_setPausesAfterApply_(self->_easyConfigDevice, v21, 1);
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController createEasyConfigDeviceConfiguration]", 800, (uint64_t)"Config dict: %@\n", v22, v23, v24, v25, (uint64_t)v7);
  }
}

- (void)startEasyConfigWhenReady
{
  if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, a2, (uint64_t)self->_targetMFiDeviceScanRecord) & 1) != 0|| !objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v3, (uint64_t)self->_targetMFiDeviceScanRecord))
  {
    MEMORY[0x270F9A6D0](self, sel__startEasyConfigWhenReady, v4);
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel_askUserForUncertified, v4);
  }
}

- (void)_startEasyConfigWhenReady
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_226907850;
  block[3] = &unk_2647B8428;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_msgSend_createEasyConfigDeviceConfiguration(self, v3, v4);
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"_joinTargetSWAPCompleteSemaphore - WAITING\n", v5, v6, v7, v8, v20);
  }
  linkUpOnTargetSWAPSemaphore = self->_linkUpOnTargetSWAPSemaphore;
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(linkUpOnTargetSWAPSemaphore, v10);
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"_joinTargetSWAPCompleteSemaphore - DONE\n", v13, v14, v15, v16, v20);
  }
  BOOL successfullyEstablishedLinkOnTargetDeviceSWAP = self->_successfullyEstablishedLinkOnTargetDeviceSWAP;
  self->_easyConfigPreConfigMetrics.hitJoiningTargetSWAPTimeout = !successfullyEstablishedLinkOnTargetDeviceSWAP;
  if (successfullyEstablishedLinkOnTargetDeviceSWAP)
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"Successfully joined target device SWAP\n", v13, v14, v15, v16, v20);
    }
    objc_msgSend_startListeningForEasyConfigDeviceStatusNotifications(self, v11, v12);
    objc_msgSend_start(self->_easyConfigDevice, v18, v19);
  }
  else
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"ERROR: Did not successfully join target device SWAP. Hit %d sec timeout\n", v13, v14, v15, v16, 30);
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_226907860;
    v21[3] = &unk_2647B8428;
    v21[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v21);
  }
}

- (id)targetBaseInfoDict
{
  uint64_t v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v5, v6);
  uint64_t v9 = objc_msgSend_objectForKey_(self->_autoGuessRecommendationDict, v8, @"BSAutoGuess_Recommendation");
  objc_msgSend_setObject_forKey_(v4, v10, v9, @"BSAutoGuess_Recommendation");
  objc_msgSend_setObject_forKey_(v4, v11, (uint64_t)self->_autoGuessRecommendationDict, @"kSetupBaseStationInfoKey_RecommendationInfo");
  objc_msgSend_setObject_forKey_(v4, v12, (uint64_t)self->_targetMFiDeviceScanRecord, @"kSetupBaseStationInfoKey_BrowseRecord");
  destinationNetworkSSID = self->_destinationNetworkSSID;
  uint64_t v14 = sub_22685D6E8(1918979693);
  objc_msgSend_setObject_forKey_(v7, v15, (uint64_t)destinationNetworkSSID, v14);
  objc_msgSend_setObject_forKey_(v4, v16, (uint64_t)v7, @"kSetupBaseStationInfoKey_RadioInfo");
  accessoryResponseDict = self->_accessoryResponseDict;
  if (accessoryResponseDict) {
    objc_msgSend_setObject_forKey_(v4, v17, (uint64_t)accessoryResponseDict, @"kSetupBaseStationInfoKey_MFiAccessoryResponse");
  }
  return v4;
}

- (void)askUserForUncertified
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController askUserForUncertified]", 800, (uint64_t)"\n", v2, v3, v4, v5, v8);
  }
  id uiDelegate = self->super.super._uiDelegate;

  MEMORY[0x270F9A6D0](uiDelegate, sel_callbackAskUserForUncertifiedForController_, self);
}

- (void)callbackAskUserForUncertifiedResult:(int)a3
{
  if (a3)
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController callbackAskUserForUncertifiedResult:]", 800, (uint64_t)"User denied uncertified accessory.\n", v3, v4, v5, v6, v8);
    }
    objc_msgSend_endSetup_(self, a2, 4294960573);
  }
  else
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController callbackAskUserForUncertifiedResult:]", 800, (uint64_t)"User approved uncertified accessory.\n", v3, v4, v5, v6, v8);
    }
    objc_msgSend_performSelectorInBackground_withObject_(self, a2, (uint64_t)sel__startEasyConfigWhenReady, 0);
  }
}

- (void)askUserForSetupCodeWithRetryStatus:(BOOL)a3
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController askUserForSetupCodeWithRetryStatus:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v9);
  }
  id uiDelegate = self->super.super._uiDelegate;

  MEMORY[0x270F9A6D0](uiDelegate, sel_callbackAskUserForSetupCode_isRetry_forController_, 2);
}

- (void)callbackAskUserForSetupCodeResult:(int)a3 password:(id)a4
{
  if (a3)
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController callbackAskUserForSetupCodeResult:password:]", 800, (uint64_t)"Failed to obtain MFi setup code from user.\n", v4, v5, v6, v7, v12);
    }
    easyConfigDevice = self->_easyConfigDevice;
    objc_msgSend_stop(easyConfigDevice, a2, *(uint64_t *)&a3);
  }
  else
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController callbackAskUserForSetupCodeResult:password:]", 800, (uint64_t)"Successfully obtained MFi setup code from user.\n", v4, v5, v6, v7, v12);
    }
    uint64_t v11 = self->_easyConfigDevice;
    MEMORY[0x270F9A6D0](v11, sel_trySetupCode_, a4);
  }
}

- (void)askUserForNetworkPassword:(id)a3
{
  self->_promptedUserForDestinationWiFiPSK = 1;
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController askUserForNetworkPassword:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v10);
  }
  id uiDelegate = self->super.super._uiDelegate;

  objc_msgSend_callbackAskUserForPassword_param_forController_(uiDelegate, a2, 1, a3, self);
}

- (void)callbackAskUserForPasswordResult:(int)a3 password:(id)a4 remember:(int)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController callbackAskUserForPasswordResult:password:remember:]", 800, (uint64_t)"Did NOT get destination network password from user\n", *(uint64_t *)&a5, v5, v6, v7, v22);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)objc_msgSend_copy(self->_mfiSetupDelegates, a2, *(uint64_t *)&a3, 0);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, v26, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v18 = objc_msgSend_targetBaseInfoDict(self, v16, v17);
            objc_msgSend_setupCompleteWithResult_baseStationInfo_forController_(v15, v19, 4294960527, v18, self);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v22, v26, 16);
      }
      while (v12);
    }
  }
  else
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController callbackAskUserForPasswordResult:password:remember:]", 800, (uint64_t)"Successfully obtained destination network password from user.\n", *(uint64_t *)&a5, v5, v6, v7, v22);
    }
    objc_msgSend_setDestinationNetworkPassword_(self, a2, (uint64_t)a4);
    askUserForPasswordSemaphore = self->_askUserForPasswordSemaphore;
    dispatch_semaphore_signal(askUserForPasswordSemaphore);
  }
}

- (int)sendProgressToUI:(int)a3 withParamDict:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  mfiSetupDelegates = self->_mfiSetupDelegates;
  if (!mfiSetupDelegates) {
    return -6762;
  }
  uint64_t v7 = *(void *)&a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_msgSend_copy(mfiSetupDelegates, a2, *(uint64_t *)&a3, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (!v10) {
    return -6700;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v19;
  int v13 = -6700;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_setupProgressUpdated_status_paramDict_forController_(v15, v16, v7, 0, a4, self);
        int v13 = 0;
      }
    }
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v16, (uint64_t)&v18, v22, 16);
  }
  while (v11);
  return v13;
}

- (int)sendSetupCompleteToUIWithResult:(int)a3
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController sendSetupCompleteToUIWithResult:]", 800, (uint64_t)"%#m\n", v3, v4, v5, v6, v7);
  }
  mfiSetupDelegates = self->_mfiSetupDelegates;
  if (!mfiSetupDelegates) {
    return -6762;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = (id)objc_msgSend_copy(mfiSetupDelegates, a2, *(uint64_t *)&a3);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v23, v27, 16);
  if (!v12) {
    return -6700;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v24;
  int v15 = -6700;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v20 = objc_msgSend_targetBaseInfoDict(self, v18, v19);
        objc_msgSend_setupCompleteWithResult_baseStationInfo_forController_(v17, v21, v7, v20, self);
        int v15 = 0;
      }
    }
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v18, (uint64_t)&v23, v27, 16);
  }
  while (v13);
  return v15;
}

- (int)sendiAPOverWiFiDeviceConfiguredXPCMessage
{
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController sendiAPOverWiFiDeviceConfiguredXPCMessage]", 800, (uint64_t)"\n", v2, v3, v4, v5, v24);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.iaptransportd.xpc", 0, 0);
  qword_268148370 = (uint64_t)mach_service;
  if (!mach_service && dword_2681481A0 <= 800)
  {
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController sendiAPOverWiFiDeviceConfiguredXPCMessage]", 800, (uint64_t)"ERROR: Unable to get iaptransportd xpc connection\n", v8, v9, v10, v11, v24);
    }
    mach_service = (_xpc_connection_s *)qword_268148370;
  }
  if (mach_service
    && (xpc_connection_set_event_handler(mach_service, &unk_26DA6B6C8),
        xpc_connection_resume((xpc_connection_t)qword_268148370),
        (xpc_object_t v12 = xpc_dictionary_create(0, 0, 0)) != 0))
  {
    uint64_t v13 = v12;
    xpc_dictionary_set_string(v12, "requestType", "kAirPortAssistantKey_ConfigurediAP");
    int v15 = (const char *)objc_msgSend_cStringUsingEncoding_(self->_postConfigTargetDeviceFriendlyName, v14, 4);
    xpc_dictionary_set_string(v13, "kAirPortAssistantKey_ConfigurediAP_Name", v15);
    uint64_t v17 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v16, @"BSSID");
    uint64_t v19 = (const char *)objc_msgSend_cStringUsingEncoding_(v17, v18, 4);
    xpc_dictionary_set_string(v13, "kAirPortAssistantKey_ConfigurediAP_MAC_Address", v19);
    long long v21 = (const char *)objc_msgSend_cStringUsingEncoding_(self->_destinationNetworkSSID, v20, 4);
    xpc_dictionary_set_string(v13, "kAirPortAssistantKey_ConfigurediAP_Destination_Network_SSID", v21);
    xpc_connection_send_message((xpc_connection_t)qword_268148370, v13);
    xpc_release(v13);
    int v22 = 0;
    self->_postediAPAccessoryConfiguredNotification = 1;
  }
  else
  {
    int v22 = -6762;
  }
  xpc_release((xpc_object_t)qword_268148370);
  return v22;
}

- (int)endSetup:(int)a3
{
  uint64_t v7 = *(void *)&a3;
  if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController endSetup:]", 800, (uint64_t)"%#m\n", v3, v4, v5, v6, v7);
  }
  objc_msgSend_stopListeningToAllNotifications(self, a2, *(uint64_t *)&a3);
  if (self->_setupEnded)
  {
    int v11 = 0;
  }
  else
  {
    self->_setupEnded = 1;
    objc_msgSend_sendSetupCompleteToUIWithResult_(self, v9, v7);
    if (v7
      || !objc_msgSend_scanInfoIsiAPOverWiFiDevice_(WiFiUtils, v12, (uint64_t)self->_targetMFiDeviceScanRecord))
    {
      int v11 = 0;
    }
    else
    {
      int v11 = objc_msgSend_sendiAPOverWiFiDeviceConfiguredXPCMessage(self, v12, v13);
      if (v11 && dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController endSetup:]", 800, (uint64_t)"ERROR: Unable to send iAP Accessory Configured XPC message\n", v14, v15, v16, v17, v28);
      }
    }
    objc_msgSend_logCompletionStatus_(self, v12, v7);
  }
  configContext = self->super._configContext;
  if (configContext)
  {
    uint64_t v19 = sub_2268AEA38((uint64_t)configContext);
    sub_2268DFCC0(v19);
  }
  uint64_t v20 = objc_msgSend_sharedInstance(WiFiUtils, v9, v10);
  objc_msgSend_setAutoJoinState_(v20, v21, 1);
  easyConfigDevice = self->_easyConfigDevice;
  if (easyConfigDevice)
  {
    objc_msgSend_setPreConfigMetrics_(easyConfigDevice, v22, (uint64_t)&self->_easyConfigPreConfigMetrics);
    objc_msgSend_setPostConfigMetrics_(self->_easyConfigDevice, v24, (uint64_t)&self->_easyConfigPostConfigMetrics);
    objc_msgSend_stop(self->_easyConfigDevice, v25, v26);
  }
  return v11;
}

- (void)stopListeningToAllNotifications
{
  objc_msgSend_stopListeningToEasyConfigDeviceStatusNotifications(self, a2, v2);
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v4, v5);
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, @"com.apple.AirPort.WiFiShim.Notification.LinkChange", 0);
  uint64_t v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v8, v9);

  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, @"com.apple.WiFiUtils.Join.Complete", 0);
}

- (void)logCompletionStatus:(int)a3
{
  uint64_t v7 = *(void *)&a3;
  if (dword_2681481A0 <= 800)
  {
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"************************ MFI CONFIG RESULTS *************************\n", v3, v4, v5, v6, v138);
    }
    if (dword_2681481A0 <= 800)
    {
      if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"TARGET INFO:\n", v3, v4, v5, v6, v138);
      }
      if (dword_2681481A0 <= 800)
      {
        if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
        {
          uint64_t v10 = NSString;
          if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v9, (uint64_t)self->_targetMFiDeviceScanRecord))
          {
            if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v11, (uint64_t)self->_targetMFiDeviceScanRecord) == 1)
            {
              uint64_t v13 = objc_msgSend_stringWithUTF8String_(v10, v12, (uint64_t)"Base Station");
            }
            else if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v12, (uint64_t)self->_targetMFiDeviceScanRecord) == 2)
            {
              uint64_t v13 = objc_msgSend_stringWithUTF8String_(v10, v18, (uint64_t)"Apple AirPlay Device");
            }
            else if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v18, (uint64_t)self->_targetMFiDeviceScanRecord) == 3)
            {
              uint64_t v13 = objc_msgSend_stringWithUTF8String_(v10, v19, (uint64_t)"MFi AirPlay Device");
            }
            else if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v19, (uint64_t)self->_targetMFiDeviceScanRecord) == 4)
            {
              uint64_t v13 = objc_msgSend_stringWithUTF8String_(v10, v20, (uint64_t)"MFi Device");
            }
            else
            {
              uint64_t v13 = objc_msgSend_stringWithUTF8String_(v10, v20, (uint64_t)"?");
            }
          }
          else
          {
            uint64_t v13 = objc_msgSend_stringWithUTF8String_(v10, v11, (uint64_t)"Unknown");
          }
          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    DEVICE KIND..: %@\n", v14, v15, v16, v17, v13);
        }
        if (dword_2681481A0 <= 800)
        {
          if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
          {
            uint64_t v21 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v9, (uint64_t)self->_targetMFiDeviceScanRecord);
            sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    FRIENDLY NAME: %@\n", v22, v23, v24, v25, v21);
          }
          if (dword_2681481A0 <= 800)
          {
            if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
            {
              uint64_t v26 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v9, @"SSID_STR");
              sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    SSID.........: %@\n", v27, v28, v29, v30, v26);
            }
            if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)))
            {
              uint64_t v31 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v9, @"BSSID");
              sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    MAC..........: %@\n", v32, v33, v34, v35, v31);
            }
          }
        }
      }
    }
  }
  if (self->_accessoryResponseDict)
  {
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    APP MATCHING VALUES:\n", v3, v4, v5, v6, v138);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      uint64_t v37 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0A0]);
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        BUNDLE SEED ID: %@\n", v38, v39, v40, v41, v37);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      v42 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0B8]);
      uint64_t v44 = objc_msgSend_componentsJoinedByString_(v42, v43, @", ");
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        PROTOCOLS.....: %@\n", v45, v46, v47, v48, v44);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      uint64_t v49 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0D0]);
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        NAME..........: %@\n", v50, v51, v52, v53, v49);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      uint64_t v54 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0C0]);
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        MANUFACTURER..: %@\n", v55, v56, v57, v58, v54);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      uint64_t v59 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0C8]);
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        MODEL.........: %@\n", v60, v61, v62, v63, v59);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      uint64_t v64 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0A8]);
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        FIRMWARE REV..: %@\n", v65, v66, v67, v68, v64);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      uint64_t v69 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0B0]);
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        HARDWARE REV..: %@\n", v70, v71, v72, v73, v69);
    }
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
    {
      uint64_t v139 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x263F3B0F8]);
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SERIAL NUMBER.: %@\n", v74, v75, v76, v77, v139);
    }
  }
  else
  {
    if (dword_2681481A0 > 800) {
      return;
    }
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    APP MATCHING VALUES: <<NULL>>\n", v3, v4, v5, v6, v138);
    }
  }
  if (dword_2681481A0 <= 800)
  {
    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"CONFIGURATION:\n", v3, v4, v5, v6, v138);
    }
    if (dword_2681481A0 <= 800)
    {
      if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    FRIENDLY NAME: %@\n", v3, v4, v5, v6, (uint64_t)self->_postConfigTargetDeviceFriendlyName);
      }
      if (dword_2681481A0 <= 800)
      {
        if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
        {
          uint64_t v83 = objc_msgSend_objectForKey_(self->_setupOptionsDict, v78, @"kBSAutoGuessSetupOptionKey_AirPlayPassword");
          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    PLAY PASSWORD: %@\n", v84, v85, v86, v87, v83);
        }
        if (dword_2681481A0 <= 800)
        {
          if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
            sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    DESTINATION:\n", v79, v80, v81, v82, v138);
          }
          if (dword_2681481A0 <= 800)
          {
            if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
              sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SSID...........: %@\n", v79, v80, v81, v82, (uint64_t)self->_destinationNetworkSSID);
            }
            if (dword_2681481A0 <= 800)
            {
              if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
              {
                uint64_t v89 = objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v88, @"BSSID");
                sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        MAC............: %@\n", v90, v91, v92, v93, v89);
              }
              if (dword_2681481A0 <= 800)
              {
                if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                {
                  if (objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, v88, (uint64_t)self->_destinationNetworkScanRecord, 0, 0))v99 = @"Yes"; {
                  else
                  }
                    v99 = @"No";
                  sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SECURED........: %@\n", v95, v96, v97, v98, (uint64_t)v99);
                }
                if (dword_2681481A0 <= 800)
                {
                  if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                  {
                    if (objc_msgSend_length(self->_destinationNetworkPassword, v88, v94)) {
                      v108 = @"Yes";
                    }
                    else {
                      v108 = @"No";
                    }
                    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        WIFI PSK VALID.: %@\n", v104, v105, v106, v107, (uint64_t)v108);
                  }
                  if (dword_2681481A0 <= 800)
                  {
                    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                    {
                      if (self->_promptedUserForDestinationWiFiPSK) {
                        v109 = @"User";
                      }
                      else {
                        v109 = @"Keychain";
                      }
                      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        WIFI PSK ORIGIN: %@\n", v100, v101, v102, v103, (uint64_t)v109);
                    }
                    if (dword_2681481A0 <= 800)
                    {
                      if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"AWD:\n", v100, v101, v102, v103, v138);
                      }
                      if (dword_2681481A0 <= 800)
                      {
                        if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    SWAP:\n", v100, v101, v102, v103, v138);
                        }
                        if (dword_2681481A0 <= 800)
                        {
                          if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                            sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        LINK UP TIME: %.3f seconds\n", v100, v101, v102, v103, *(void *)&self->_easyConfigPreConfigMetrics.secondsToGetLinkUpOnSWAP);
                          }
                          if (dword_2681481A0 <= 800)
                          {
                            if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                              sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        JOIN ERROR..: %#m\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.wifiJoinSWAPError);
                            }
                            if (dword_2681481A0 <= 800)
                            {
                              if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                                sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        RSSI........: %d\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.rssiOfSWAP);
                              }
                              if (dword_2681481A0 <= 800)
                              {
                                if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                                  sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SNR.........: %d\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.snrOfSWAP);
                                }
                                if (dword_2681481A0 <= 800)
                                {
                                  if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                                    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        CHANNEL.....: %d\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.channelOfSWAP);
                                  }
                                  if (dword_2681481A0 <= 800)
                                  {
                                    if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                                      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    DESTINATION AP:\n", v100, v101, v102, v103, v138);
                                    }
                                    if (dword_2681481A0 <= 800)
                                    {
                                      if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                                        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        LINK UP TIME: %.3f seconds\n", v100, v101, v102, v103, *(void *)&self->_easyConfigPostConfigMetrics.secondsToGetLinkUpOnDestination);
                                      }
                                      if (dword_2681481A0 <= 800)
                                      {
                                        if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                                          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        JOIN ERROR..: %#m\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.wifiJoinDestinationAPError);
                                        }
                                        if (dword_2681481A0 <= 800)
                                        {
                                          if (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)) {
                                            sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        RSSI........: %d\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.rssiOfDestinationAP);
                                          }
                                          if (dword_2681481A0 <= 800)
                                          {
                                            if (dword_2681481A0 != -1
                                              || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                            {
                                              sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SNR.........: %d\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.snrOfDestinationAP);
                                            }
                                            if (dword_2681481A0 <= 800)
                                            {
                                              if (dword_2681481A0 != -1
                                                || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                              {
                                                sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        CHANNEL.....: %d\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.channelOfDestinationAP);
                                              }
                                              if (dword_2681481A0 <= 800)
                                              {
                                                if (dword_2681481A0 != -1
                                                  || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                {
                                                  if (self->_easyConfigPreConfigMetrics.destinationNetworkRecommendationUsed) {
                                                    v110 = @"Yes";
                                                  }
                                                  else {
                                                    v110 = @"No";
                                                  }
                                                  sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    AUTOGUESS NETWORK USED....: %@\n", v100, v101, v102, v103, (uint64_t)v110);
                                                }
                                                if (dword_2681481A0 <= 800)
                                                {
                                                  if (dword_2681481A0 != -1
                                                    || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                  {
                                                    if (self->_easyConfigPreConfigMetrics.userChangedFriendlyName) {
                                                      v111 = @"Yes";
                                                    }
                                                    else {
                                                      v111 = @"No";
                                                    }
                                                    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    USER CHANGED FRIENDLY NAME: %@\n", v100, v101, v102, v103, (uint64_t)v111);
                                                  }
                                                  if (dword_2681481A0 <= 800)
                                                  {
                                                    if (dword_2681481A0 != -1
                                                      || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                    {
                                                      if (self->_easyConfigPreConfigMetrics.playPasswordSet) {
                                                        v112 = @"Yes";
                                                      }
                                                      else {
                                                        v112 = @"No";
                                                      }
                                                      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    PLAY PASSWORD SET.........: %@\n", v100, v101, v102, v103, (uint64_t)v112);
                                                    }
                                                    if (dword_2681481A0 <= 800)
                                                    {
                                                      if (dword_2681481A0 != -1
                                                        || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                      {
                                                        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
                                                        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    TOTAL TIME TO CONFIG......: %.3f seconds\n", v118, v119, v120, v121, COERCE__INT64(Current - self->_easyConfigPreConfigMetrics.startTime));
                                                      }
                                                      if (dword_2681481A0 <= 800)
                                                      {
                                                        if (dword_2681481A0 != -1
                                                          || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                        {
                                                          sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"STATUS:\n", v113, v114, v115, v116, v138);
                                                        }
                                                        if (dword_2681481A0 <= 800)
                                                        {
                                                          if (dword_2681481A0 == -1
                                                            && !sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                          {
LABEL_229:
                                                            if (dword_2681481A0 <= 800)
                                                            {
                                                              if (dword_2681481A0 != -1
                                                                || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                              {
                                                                if (self->_successfullyEstablishedLinkOnTargetDeviceSWAP) {
                                                                  v134 = @"Yes";
                                                                }
                                                                else {
                                                                  v134 = @"No";
                                                                }
                                                                sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     ESTABLISHED LINK ON TARGET SWAP...: %@\n", v123, v124, v125, v126, (uint64_t)v134);
                                                              }
                                                              if (dword_2681481A0 <= 800)
                                                              {
                                                                if (dword_2681481A0 != -1
                                                                  || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                                {
                                                                  if (self->_successfullyEstablishedLinkOnDestinationAP) {
                                                                    v135 = @"Yes";
                                                                  }
                                                                  else {
                                                                    v135 = @"No";
                                                                  }
                                                                  sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     ESTABLISHED LINK ON DESTINATION AP: %@\n", v123, v124, v125, v126, (uint64_t)v135);
                                                                }
                                                                if (dword_2681481A0 <= 800)
                                                                {
                                                                  if (dword_2681481A0 != -1
                                                                    || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                                  {
                                                                    if (self->_destinationNetworkPasswordAccepted) {
                                                                      v136 = @"Yes";
                                                                    }
                                                                    else {
                                                                      v136 = @"No";
                                                                    }
                                                                    sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     DESTINATION AP PASSWORD ACCEPTED..: %@\n", v123, v124, v125, v126, (uint64_t)v136);
                                                                  }
                                                                  if (dword_2681481A0 <= 800)
                                                                  {
                                                                    if (dword_2681481A0 != -1
                                                                      || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                                    {
                                                                      if (self->_postediAPAccessoryConfiguredNotification) {
                                                                        v137 = @"Yes";
                                                                      }
                                                                      else {
                                                                        v137 = @"No";
                                                                      }
                                                                      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     POSTED iAP OVER WIFI NOTIFICATION.: %@\n", v123, v124, v125, v126, (uint64_t)v137);
                                                                    }
                                                                    if (dword_2681481A0 <= 800)
                                                                    {
                                                                      if (dword_2681481A0 != -1
                                                                        || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))
                                                                      {
                                                                        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     RESULT............................: %#m\n", v123, v124, v125, v126, v7);
                                                                      }
                                                                      if (dword_2681481A0 <= 800
                                                                        && (dword_2681481A0 != -1
                                                                         || sub_226865630((uint64_t)&dword_2681481A0, 0x320u)))
                                                                      {
                                                                        sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"*********************************************************************\n", v123, v124, v125, v126, v141);
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                            return;
                                                          }
                                                          int64_t lastHeardEasyConfigProgressNotification = self->_lastHeardEasyConfigProgressNotification;
                                                          if (lastHeardEasyConfigProgressNotification <= 29)
                                                          {
                                                            v128 = "Start";
                                                            switch(lastHeardEasyConfigProgressNotification)
                                                            {
                                                              case 1:
                                                                goto LABEL_227;
                                                              case 2:
                                                                uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Final");
                                                                break;
                                                              case 3:
                                                                uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Error");
                                                                break;
                                                              case 4:
                                                              case 5:
                                                              case 6:
                                                              case 7:
                                                              case 8:
                                                              case 9:
                                                                goto LABEL_221;
                                                              case 10:
                                                                uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Search for pre-config device");
                                                                break;
                                                              default:
                                                                if (lastHeardEasyConfigProgressNotification != 20) {
                                                                  goto LABEL_221;
                                                                }
                                                                uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Authenticating pre-config device");
                                                                break;
                                                            }
                                                            goto LABEL_228;
                                                          }
                                                          if (lastHeardEasyConfigProgressNotification <= 49)
                                                          {
                                                            if (lastHeardEasyConfigProgressNotification == 30)
                                                            {
                                                              v128 = "Applying configuration to device";
LABEL_227:
                                                              uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)v128);
                                                              goto LABEL_228;
                                                            }
                                                            if (lastHeardEasyConfigProgressNotification == 40)
                                                            {
                                                              uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Applied configuration to device");
                                                              goto LABEL_228;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            switch(lastHeardEasyConfigProgressNotification)
                                                            {
                                                              case '2':
                                                                uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Searching for post-config device");
                                                                goto LABEL_228;
                                                              case '<':
                                                                uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Performing post-config check of device");
                                                                goto LABEL_228;
                                                              case 'F':
                                                                uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Performed post-config check of device");
LABEL_228:
                                                                sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     LAST EASYCONFIG NOTIFICATION......: %@\n", v130, v131, v132, v133, v129);
                                                                goto LABEL_229;
                                                            }
                                                          }
LABEL_221:
                                                          if (lastHeardEasyConfigProgressNotification == 100) {
                                                            uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"Configuration complete");
                                                          }
                                                          else {
                                                            uint64_t v129 = objc_msgSend_stringWithUTF8String_(NSString, v122, (uint64_t)"?");
                                                          }
                                                          goto LABEL_228;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (NSMutableSet)setupDelegates
{
  return self->_mfiSetupDelegates;
}

- (NSTimer)linkUpOnDestinationNetworkTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLinkUpOnDestinationNetworkTimer:(id)a3
{
}

- (NSString)destinationNetworkPassword
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDestinationNetworkPassword:(id)a3
{
}

@end