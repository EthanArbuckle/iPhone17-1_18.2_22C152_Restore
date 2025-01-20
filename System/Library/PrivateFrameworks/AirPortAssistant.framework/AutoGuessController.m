@interface AutoGuessController
+ (BOOL)isRestoreAnOptionForTheRecommendations:(id)a3;
+ (BOOL)shouldShowPasswordUIForRecommendation:(id)a3;
+ (id)fullAutoGuessDictionaryFromCompletionDict:(id)a3;
+ (id)primaryRecommendationDictionaryFromCompletionDict:(id)a3;
+ (id)recommendationStringFromCompletionDict:(id)a3;
+ (id)recommendationToActionChoice:(id)a3;
+ (id)restoreOfferFromCompletionDict:(id)a3;
+ (id)restoreRecommendationDictionaryFromCompletionDict:(id)a3;
+ (id)shortProductNameForUnconfiguredDeviceFromAutoGuessResults:(id)a3;
+ (id)shortProductNameFromBaseStationDictionary:(id)a3;
+ (id)sourceBaseStationFromRecommendation:(id)a3;
+ (id)sourceNetworkFromRecommendation:(id)a3;
+ (id)unconfiguredBaseStationCanBeConfiguredFromCompletionDict:(id)a3;
+ (id)unconfiguredBaseStationFromGuessCompleteDict:(id)a3;
+ (id)unconfiguredBaseStationFromRecommendation:(id)a3;
- (AutoGuessController)init;
- (AutoGuessUIDelegate)delegate;
- (BOOL)okToSwitchToShortBonjourTimeout:(id)a3;
- (NSArray)_wifiScanInfos;
- (NSDictionary)guessCompletionDict;
- (NSDictionary)lastInstrumentation;
- (NSDictionary)targetBrowseRecord;
- (NSDictionary)targetScanRecord;
- (NSDictionary)unconfiguredDeviceThatIsBeingSetup;
- (NSMutableDictionary)_browsedBases;
- (NSString)currentParamString;
- (NSString)lastParamString;
- (NSString)targetMACAddress;
- (NSTimer)_browseReadyTimer;
- (id)createCompletionDictFromAutoGuessResults:(id)a3;
- (id)targetInfo;
- (int)bonjourBrowseStatus;
- (int)cancelAutoGuess;
- (int)currentAutoGuessUISelector;
- (int)lastAutoGuessUISelector;
- (int)runAutoGuessWithWifiScanInfos:(id)a3;
- (int)startAutoGuessForUnconfiguredMACAddress:(id)a3 withWifiScanInfos:(id)a4;
- (int)startBonjourBrowser;
- (int)startWiFiScanner;
- (int)wifiScanStatus;
- (void)autoGuessEngineComplete;
- (void)bonjourTXTRemoved:(id)a3;
- (void)bonjourTXTUpdated:(id)a3;
- (void)browseReadyTimerCallback:(id)a3;
- (void)cancelBonjourBrowser;
- (void)cancelWiFiScanner;
- (void)dealloc;
- (void)runAutoGuessThread:(id)a3;
- (void)setBonjourBrowseStatus:(int)a3;
- (void)setCurrentAutoGuessUISelector:(int)a3;
- (void)setCurrentParamString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGuessCompletionDict:(id)a3;
- (void)setLastAutoGuessUISelector:(int)a3;
- (void)setLastInstrumentation:(id)a3;
- (void)setLastParamString:(id)a3;
- (void)setTargetBrowseRecord:(id)a3;
- (void)setTargetMACAddress:(id)a3;
- (void)setTargetScanRecord:(id)a3;
- (void)setUnconfiguredDeviceThatIsBeingSetup:(id)a3;
- (void)setWiFiScanStatus:(int)a3;
- (void)set_browseReadyTimer:(id)a3;
- (void)set_browsedBases:(id)a3;
- (void)set_wifiScanInfos:(id)a3;
- (void)startAutoGuessIfReady;
- (void)stopBonjourBrowser;
- (void)stopWiFiScanner;
- (void)uiAssetsUpdated:(id)a3;
- (void)updateTargetInfo:(BOOL)a3;
- (void)wirelessScanDone:(id)a3;
@end

@implementation AutoGuessController

- (AutoGuessController)init
{
  v33.receiver = self;
  v33.super_class = (Class)AutoGuessController;
  id v4 = [(AssistantCallbackController *)&v33 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v2, v3);
    objc_msgSend_set_browsedBases_(v4, v6, v5);
    objc_msgSend_setWiFiScanStatus_(v4, v7, 0);
    objc_msgSend_setBonjourBrowseStatus_(v4, v8, 0);
    sub_2268D4540((const void ***)v4 + 9, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v16 = *((void *)v4 + 9);
    uint64_t v19 = objc_msgSend_assistantCallback(v4, v17, v18);
    sub_2268D46C8(v16, v19, (uint64_t)v4, v20, v21, v22, v23, v24);
    sub_2268D4778(*((void *)v4 + 9), (uint64_t)sub_226840120, (uint64_t)v4, v25, v26, v27, v28, v29);
  }
  v30 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v2, v3);
  objc_msgSend_addSuiteNamed_(v30, v31, @"com.apple.airport.airportassistant");
  return (AutoGuessController *)v4;
}

- (void)dealloc
{
  id v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, @"com.apple.airport.airportutility.DataCache.UIAssets.Refresh.Notification", 0);
  sub_2268D4634((const void **)self->_guessContext, v6, v7, v8, v9, v10, v11, v12);
  self->_guessContext = 0;
  objc_msgSend_set_browsedBases_(self, v13, 0);
  uint64_t v16 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v14, v15);
  objc_msgSend_removeSuiteNamed_(v16, v17, @"com.apple.airport.airportassistant");
  v18.receiver = self;
  v18.super_class = (Class)AutoGuessController;
  [(AssistantCallbackController *)&v18 dealloc];
}

- (int)startWiFiScanner
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController startWiFiScanner]", 100, (uint64_t)"\n", v3, v4, v5, v6, v18);
  }
  uint64_t v8 = objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  if (objc_msgSend_airPortIsOn(v8, v9, v10))
  {
    objc_msgSend_setWiFiScanStatus_(self, v11, 1);
    uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v12, v13);
    objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)self, sel_wirelessScanDone_, @"com.apple.WiFiUtils.Scan.Complete", 0);
    objc_msgSend_asyncWiFiScan_wifiType_merge_maxAge_(v8, v16, 0, 3, 0, 0);
  }
  else
  {
    objc_msgSend_setWiFiScanStatus_(self, v11, 2);
  }
  return 0;
}

- (int)runAutoGuessWithWifiScanInfos:(id)a3
{
  if (!objc_msgSend_targetMACAddress(self, a2, (uint64_t)a3)
    && !objc_msgSend_targetScanRecord(self, v5, v6)
    && !objc_msgSend_targetBrowseRecord(self, v5, v6))
  {
    return -6705;
  }
  self->_updatedTargetInfo = 0;
  uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v5, v6);
  objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)self, sel_uiAssetsUpdated_, @"com.apple.airport.airportutility.DataCache.UIAssets.Refresh.Notification", 0);
  if (a3)
  {
    CFArrayRef v13 = objc_msgSend_count(a3, v9, v10) ? (const __CFArray *)a3 : 0;
    if (!objc_msgSend_targetScanRecord(self, v11, v12))
    {
      if (v13)
      {
        if (objc_msgSend_targetMACAddress(self, v9, v10))
        {
          CFStringRef v14 = (const __CFString *)objc_msgSend_targetMACAddress(self, v9, v10);
          uint64_t v15 = sub_22685C1DC(v14, 0, v13);
          if (v15 != -1)
          {
            uint64_t v16 = objc_msgSend_objectAtIndex_(v13, v9, v15);
            objc_msgSend_setTargetScanRecord_(self, v17, v16);
          }
        }
      }
    }
  }
  if (!objc_msgSend_targetMACAddress(self, v9, v10))
  {
    uint64_t v20 = objc_msgSend_targetInfo(self, v18, v19);
    if (!v20) {
      return -6705;
    }
    uint64_t v22 = objc_msgSend_objectForKey_(v20, v21, @"kRecommendationTargetInfoKey_MACAddress");
    objc_msgSend_setTargetMACAddress_(self, v23, v22);
  }
  if (!objc_msgSend_targetMACAddress(self, v18, v19)) {
    return -6705;
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend_autoguessProgressUpdated_paramString_(self->_delegate, v24, 15, 0);
  }
  objc_msgSend_setGuessCompletionDict_(self, v24, 0);
  uint64_t v27 = objc_msgSend_targetMACAddress(self, v25, v26);

  return MEMORY[0x270F9A6D0](self, sel_startAutoGuessForUnconfiguredMACAddress_withWifiScanInfos_, v27);
}

- (int)cancelAutoGuess
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend_autoguessProgressUpdated_paramString_(self->_delegate, a2, 19, 0);
  }
  objc_msgSend_cancel(self->_autoGuessThread, a2, v2);
  if (objc_msgSend_wifiScanStatus(self, v4, v5) == 1) {
    objc_msgSend_cancelWiFiScanner(self, v6, v7);
  }
  else {
    objc_msgSend_setWiFiScanStatus_(self, v6, 3);
  }
  if (objc_msgSend_bonjourBrowseStatus(self, v8, v9) == 1) {
    objc_msgSend_cancelBonjourBrowser(self, v10, v11);
  }
  else {
    objc_msgSend_setBonjourBrowseStatus_(self, v10, 3);
  }
  guessContext = self->_guessContext;

  return sub_2268DB0CC((uint64_t)guessContext, v12, v13, v14, v15, v16, v17, v18);
}

- (NSString)targetMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTargetMACAddress:(id)a3
{
}

- (NSDictionary)targetScanRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTargetScanRecord:(id)a3
{
}

- (NSDictionary)targetBrowseRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTargetBrowseRecord:(id)a3
{
}

- (NSTimer)_browseReadyTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_browseReadyTimer:(id)a3
{
}

- (NSMutableDictionary)_browsedBases
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)set_browsedBases:(id)a3
{
}

- (NSArray)_wifiScanInfos
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)set_wifiScanInfos:(id)a3
{
}

- (AutoGuessUIDelegate)delegate
{
  return (AutoGuessUIDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (NSString)lastParamString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastParamString:(id)a3
{
}

- (NSString)currentParamString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentParamString:(id)a3
{
}

- (int)lastAutoGuessUISelector
{
  return self->_lastAutoGuessUISelector;
}

- (void)setLastAutoGuessUISelector:(int)a3
{
  self->_lastAutoGuessUISelector = a3;
}

- (int)currentAutoGuessUISelector
{
  return self->_currentAutoGuessUISelector;
}

- (void)setCurrentAutoGuessUISelector:(int)a3
{
  self->_currentAutoGuessUISelector = a3;
}

- (NSDictionary)unconfiguredDeviceThatIsBeingSetup
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUnconfiguredDeviceThatIsBeingSetup:(id)a3
{
}

- (NSDictionary)lastInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastInstrumentation:(id)a3
{
}

- (NSDictionary)guessCompletionDict
{
  return self->_guessCompletionDict;
}

- (void)setGuessCompletionDict:(id)a3
{
}

- (int)startAutoGuessForUnconfiguredMACAddress:(id)a3 withWifiScanInfos:(id)a4
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u)))
  {
    objc_msgSend_count(a4, a2, (uint64_t)a3);
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) startAutoGuessForUnconfiguredMACAddress:withWifiScanInfos:]", 100, (uint64_t)"macAddress: %@ [scanInfos count]: %d\n", v7, v8, v9, v10, (uint64_t)a3);
  }
  if (!a3 || !objc_msgSend_length(a3, a2, (uint64_t)a3)) {
    return -6705;
  }
  objc_msgSend_removeAllObjects(self->_browsedBases, v11, v12);
  if (a4) {
    objc_msgSend_set_wifiScanInfos_(self, v13, (uint64_t)a4);
  }
  if (objc_msgSend_targetScanRecord(self, v13, v14)
    && (uint64_t v17 = objc_msgSend_targetScanRecord(self, v15, v16),
        objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, v18, v17)))
  {
    objc_msgSend_setBonjourBrowseStatus_(self, v15, 2);
  }
  else
  {
    int result = objc_msgSend_startBonjourBrowser(self, v15, v16);
    if (result) {
      return result;
    }
  }
  if (self->_wifiScanInfos
    || objc_msgSend_wifiScanStatus(self, v19, v20)
    || (int result = objc_msgSend_startWiFiScanner(self, v19, v20)) == 0)
  {
    objc_msgSend_startAutoGuessIfReady(self, v19, v20);
    return 0;
  }
  return result;
}

- (void)startAutoGuessIfReady
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) startAutoGuessIfReady]", 100, (uint64_t)"\n", v3, v4, v5, v6, v21);
  }
  if (!self->_autoGuessThread
    && objc_msgSend_wifiScanStatus(self, a2, v2) != 3
    && objc_msgSend_bonjourBrowseStatus(self, v8, v9) != 3)
  {
    objc_msgSend_updateTargetInfo_(self, v10, 0);
    if ((self->_wifiScanInfos || objc_msgSend_wifiScanStatus(self, v11, v12) == 2)
      && objc_msgSend_bonjourBrowseStatus(self, v11, v12) == 2)
    {
      id v13 = objc_allocWithZone(MEMORY[0x263F08B88]);
      uint64_t v16 = objc_msgSend_targetMACAddress(self, v14, v15);
      uint64_t v18 = (NSThread *)(id)objc_msgSend_initWithTarget_selector_object_(v13, v17, (uint64_t)self, sel_runAutoGuessThread_, v16);
      self->_autoGuessThread = v18;
      objc_msgSend_start(v18, v19, v20);
    }
  }
}

- (void)autoGuessEngineComplete
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) autoGuessEngineComplete]", 100, (uint64_t)"\n", v3, v4, v5, v6, v15);
  }
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, @"com.apple.airport.airportutility.DataCache.UIAssets.Refresh.Notification", 0);
  if (self->_autoJoinState)
  {
    uint64_t v12 = objc_msgSend_sharedInstanceRef(WiFiUtils, v10, v11);
    objc_msgSend_setAutoJoinState_(v12, v13, self->_autoJoinState);
  }
  self->_autoJoinState = 0;

  uint64_t v14 = self;
}

- (id)targetInfo
{
  if (!objc_msgSend_targetScanRecord(self, a2, v2) && !objc_msgSend_targetBrowseRecord(self, v4, v5)) {
    return 0;
  }
  uint64_t v6 = objc_msgSend_targetBrowseRecord(self, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKey_(v6, v7, @"syAP");
  unsigned int v13 = objc_msgSend_integerValue(v8, v9, v10);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_targetBrowseRecord(self, v11, v12);
    unsigned int v22 = sub_22685AB68(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    uint64_t v25 = objc_msgSend_targetScanRecord(self, v11, v12);
    unsigned int v13 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v26, v25);
    uint64_t v29 = objc_msgSend_targetScanRecord(self, v27, v28);
    unsigned int v22 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v30, v29);
  }
  unsigned int v31 = v22;
  if (v22 - 3 > 1)
  {
    v37 = objc_msgSend_targetBrowseRecord(self, v23, v24);
    uint64_t v39 = objc_msgSend_objectForKey_(v37, v38, @"name");
    if (v39) {
      goto LABEL_11;
    }
    v40 = objc_msgSend_targetScanRecord(self, v35, v36);
    uint64_t v34 = objc_msgSend_objectForKey_(v40, v41, @"SSID_STR");
  }
  else
  {
    uint64_t v32 = objc_msgSend_targetScanRecord(self, v23, v24);
    uint64_t v34 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v33, v32);
  }
  uint64_t v39 = v34;
LABEL_11:
  v42 = objc_msgSend_targetBrowseRecord(self, v35, v36);
  uint64_t v46 = objc_msgSend_objectForKey_(v42, v43, @"raMA");
  if (v46)
  {
    if (!v39) {
      return 0;
    }
  }
  else
  {
    v47 = objc_msgSend_targetScanRecord(self, v44, v45);
    uint64_t v46 = objc_msgSend_objectForKey_(v47, v48, @"BSSID");
    if (!v39) {
      return 0;
    }
  }
  if (v46)
  {
    v49 = NSDictionary;
    uint64_t v50 = objc_msgSend_numberWithInteger_(NSNumber, v44, v13);
    uint64_t v52 = objc_msgSend_numberWithInteger_(NSNumber, v51, v31);
    return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v49, v53, v39, @"kRecommendationTargetInfoKey_BaseName", v50, @"kRecommendationTargetInfoKey_ProductID", v46, @"kRecommendationTargetInfoKey_MACAddress", v52, @"kRecommendationTargetInfoKey_DeviceKind", 0);
  }
  return 0;
}

- (void)updateTargetInfo:(BOOL)a3
{
  BOOL v7 = a3;
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) updateTargetInfo:]", 100, (uint64_t)"inForceUpdate: %d _updatedTargetInfo: %d\n", v3, v4, v5, v6, v7);
  }
  if (!self->_updatedTargetInfo || v7)
  {
    uint64_t v10 = objc_msgSend_targetInfo(self, a2, a3);
    if (v10)
    {
      uint64_t v11 = v10;
      if (self->_delegate)
      {
        if (objc_opt_respondsToSelector())
        {
          objc_msgSend_autoguessUpdateTargetInfo_(self->_delegate, v12, v11);
          self->_updatedTargetInfo = 1;
        }
      }
    }
  }
}

- (void)uiAssetsUpdated:(id)a3
{
  uint64_t v4 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  if (v4)
  {
    uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"productID");
    uint64_t v11 = objc_msgSend_integerValue(v6, v7, v8);
    if (v11)
    {
      uint64_t v12 = objc_msgSend_targetInfo(self, v9, v10);
      uint64_t v14 = objc_msgSend_objectForKey_(v12, v13, @"kRecommendationTargetInfoKey_ProductID");
      int v22 = objc_msgSend_integerValue(v14, v15, v16);
      if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
        sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) uiAssetsUpdated:]", 100, (uint64_t)"asset updated id: %d my target id: %d\n", v18, v19, v20, v21, v11);
      }
      if (v22 && v11 == v22)
      {
        objc_msgSend_updateTargetInfo_(self, v17, 1);
      }
    }
  }
}

- (BOOL)okToSwitchToShortBonjourTimeout:(id)a3
{
  if (self->_onShortTimer)
  {
    return 1;
  }
  else
  {
    uint64_t v6 = objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)a3);
    if (objc_msgSend_airPortIsOn(v6, v7, v8))
    {
      BOOL onShortTimer = sub_22685AE08((const __CFString *)a3, v9, v10, v11, v12, v13, v14, v15);
      self->_BOOL onShortTimer = onShortTimer;
      if (dword_268145D48 <= 100)
      {
        if (dword_268145D48 != -1
          || (BOOL v17 = sub_226865630((uint64_t)&dword_268145D48, 0x64u), onShortTimer = self->_onShortTimer, v17))
        {
          objc_msgSend_objectForKey_(a3, v16, @"raMA");
          sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) okToSwitchToShortBonjourTimeout:]", 100, (uint64_t)"_onShortTimer: %d inBaseStation: %@\n", v18, v19, v20, v21, onShortTimer);
          return self->_onShortTimer;
        }
      }
    }
    else
    {
      BOOL onShortTimer = 1;
      self->_BOOL onShortTimer = 1;
    }
  }
  return onShortTimer;
}

- (void)setWiFiScanStatus:(int)a3
{
  objc_sync_enter(self);
  self->_wifiScanStatus = a3;

  objc_sync_exit(self);
}

- (int)wifiScanStatus
{
  objc_sync_enter(self);
  int wifiScanStatus = self->_wifiScanStatus;
  objc_sync_exit(self);
  return wifiScanStatus;
}

- (void)setBonjourBrowseStatus:(int)a3
{
  objc_sync_enter(self);
  self->_bonjourBrowseStatus = a3;

  objc_sync_exit(self);
}

- (int)bonjourBrowseStatus
{
  objc_sync_enter(self);
  int bonjourBrowseStatus = self->_bonjourBrowseStatus;
  objc_sync_exit(self);
  return bonjourBrowseStatus;
}

- (int)startBonjourBrowser
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) startBonjourBrowser]", 100, (uint64_t)"\n", v3, v4, v5, v6, v28);
  }
  p_acpBrowserSession = &self->_acpBrowserSession;
  if (self->_acpBrowserSession) {
    objc_msgSend_stopBonjourBrowser(self, a2, v2);
  }
  int result = sub_226844B50("com.apple.bonjour.txt.Updated", "com.apple.bonjour.txt.Removed", "AutoGuess:BrowseSession", (uint64_t *)&self->_acpBrowserSession);
  if (!result)
  {
    if (*p_acpBrowserSession)
    {
      uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v10, v11);
      objc_msgSend_addObserver_selector_name_object_(v12, v13, (uint64_t)self, sel_bonjourTXTUpdated_, @"com.apple.bonjour.txt.Updated", 0);
      uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v14, v15);
      objc_msgSend_addObserver_selector_name_object_(v16, v17, (uint64_t)self, sel_bonjourTXTRemoved_, @"com.apple.bonjour.txt.Removed", 0);
      self->_BOOL onShortTimer = 0;
      uint64_t v18 = (uint64_t)*p_acpBrowserSession;
      uint64_t v21 = objc_msgSend_UTF8String(0, v19, v20);
      int result = sub_226845064(v18, v21);
      if (result) {
        BOOL v23 = result == -6745;
      }
      else {
        BOOL v23 = 1;
      }
      if (v23)
      {
        double v24 = 15.0;
        if (result == -6745) {
          double v24 = 0.0;
        }
        uint64_t v25 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], v22, (uint64_t)self, sel_browseReadyTimerCallback_, 0, 0, v24);
        objc_msgSend_set_browseReadyTimer_(self, v26, v25);
        objc_msgSend_setBonjourBrowseStatus_(self, v27, 1);
        return 0;
      }
    }
    else
    {
      return -6728;
    }
  }
  return result;
}

- (void)cancelBonjourBrowser
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) cancelBonjourBrowser]", 100, (uint64_t)"\n", v3, v4, v5, v6, v9);
  }
  objc_msgSend_stopBonjourBrowser(self, a2, v2);

  objc_msgSend_setBonjourBrowseStatus_(self, v8, 3);
}

- (void)stopBonjourBrowser
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) stopBonjourBrowser]", 100, (uint64_t)"\n", v3, v4, v5, v6, v19);
  }
  objc_msgSend_invalidate(self->_browseReadyTimer, a2, v2);
  objc_msgSend_set_browseReadyTimer_(self, v8, 0);
  uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v9, v10);
  objc_msgSend_removeObserver_name_object_(v11, v12, (uint64_t)self, @"com.apple.bonjour.txt.Updated", 0);
  uint64_t v15 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v13, v14);
  objc_msgSend_removeObserver_name_object_(v15, v16, (uint64_t)self, @"com.apple.bonjour.txt.Removed", 0);
  acpBrowserSession = self->_acpBrowserSession;
  if (acpBrowserSession)
  {
    if (!sub_226845294((dispatch_queue_t *)acpBrowserSession)) {
      sub_226845378(self->_acpBrowserSession);
    }
    self->_acpBrowserSession = 0;
  }

  objc_msgSend_setBonjourBrowseStatus_(self, v17, 0);
}

- (void)wirelessScanDone:(id)a3
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) wirelessScanDone:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v23);
  }
  objc_msgSend_stopWiFiScanner(self, a2, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_sharedInstance(WiFiUtils, v8, v9);
  uint64_t v13 = objc_msgSend_unmergedScanInfoArray(v10, v11, v12);
  objc_msgSend_set_wifiScanInfos_(self, v14, v13);
  if (!objc_msgSend_targetScanRecord(self, v15, v16))
  {
    CFStringRef v19 = (const __CFString *)objc_msgSend_targetMACAddress(self, v17, v18);
    uint64_t v20 = sub_22685C1DC(v19, 0, (CFArrayRef)self->_wifiScanInfos);
    if (v20 != -1)
    {
      uint64_t v21 = objc_msgSend_objectAtIndex_(self->_wifiScanInfos, v17, v20);
      objc_msgSend_setTargetScanRecord_(self, v22, v21);
    }
  }

  objc_msgSend_startAutoGuessIfReady(self, v17, v18);
}

- (void)cancelWiFiScanner
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) cancelWiFiScanner]", 100, (uint64_t)"\n", v3, v4, v5, v6, v14);
  }
  uint64_t v8 = objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  objc_msgSend_cancelAsync(v8, v9, v10);
  objc_msgSend_stopWiFiScanner(self, v11, v12);

  objc_msgSend_setWiFiScanStatus_(self, v13, 3);
}

- (void)stopWiFiScanner
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) stopWiFiScanner]", 100, (uint64_t)"\n", v3, v4, v5, v6, v11);
  }
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, @"com.apple.WiFiUtils.Scan.Complete", 0);

  objc_msgSend_setWiFiScanStatus_(self, v10, 2);
}

- (void)browseReadyTimerCallback:(id)a3
{
  if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) browseReadyTimerCallback:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v24);
  }
  objc_msgSend_invalidate(self->_browseReadyTimer, a2, (uint64_t)a3);
  objc_msgSend_set_browseReadyTimer_(self, v8, 0);
  if (objc_msgSend_bonjourBrowseStatus(self, v9, v10) != 3)
  {
    if (!objc_msgSend_targetBrowseRecord(self, v11, v12))
    {
      uint64_t v15 = objc_msgSend_allValues(self->_browsedBases, v13, v14);
      if (v15)
      {
        CFArrayRef v16 = (const __CFArray *)v15;
        CFStringRef v17 = (const __CFString *)objc_msgSend_targetMACAddress(self, v13, v14);
        uint64_t v18 = sub_22685BC94(v16, v17);
        if (v18 != -1)
        {
          uint64_t v19 = objc_msgSend_objectAtIndex_(v16, v13, v18);
          objc_msgSend_setTargetBrowseRecord_(self, v20, v19);
        }
      }
    }
    objc_msgSend_stopBonjourBrowser(self, v13, v14);
    objc_msgSend_setBonjourBrowseStatus_(self, v21, 2);
    objc_msgSend_startAutoGuessIfReady(self, v22, v23);
  }
}

- (void)bonjourTXTUpdated:(id)a3
{
  uint64_t v4 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"name");
  if (v4)
  {
    uint64_t v8 = v6;
    if (v6)
    {
      uint64_t v9 = objc_msgSend_objectForKey_(v4, v7, @"raMA");
      if (objc_msgSend_okToSwitchToShortBonjourTimeout_(self, v10, (uint64_t)v4)) {
        double v12 = 2.0;
      }
      else {
        double v12 = 5.0;
      }
      objc_msgSend_setObject_forKey_(self->_browsedBases, v11, (uint64_t)v4, v8);
      browseReadyTimer = self->_browseReadyTimer;
      uint64_t v16 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v14, v15, v12);
      objc_msgSend_setFireDate_(browseReadyTimer, v17, v16);
      if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
        sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) bonjourTXTUpdated:]", 100, (uint64_t)"MAC: %@\n", v18, v19, v20, v21, v9);
      }
    }
  }
}

- (void)bonjourTXTRemoved:(id)a3
{
  uint64_t v4 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"name");
  if (v4)
  {
    uint64_t v8 = v6;
    if (v6)
    {
      uint64_t v9 = objc_msgSend_objectForKey_(v4, v7, @"raMA");
      objc_msgSend_removeObjectForKey_(self->_browsedBases, v10, v8);
      browseReadyTimer = self->_browseReadyTimer;
      uint64_t v14 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v12, v13, 5.0);
      objc_msgSend_setFireDate_(browseReadyTimer, v15, v14);
      if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
        sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) bonjourTXTRemoved:]", 100, (uint64_t)"MAC: %@\n", v16, v17, v18, v19, v9);
      }
    }
  }
}

- (void)runAutoGuessThread:(id)a3
{
  id v58 = objc_alloc_init(MEMORY[0x263F086B0]);
  if ((objc_msgSend_isCancelled(self->_autoGuessThread, v5, v6) & 1) == 0)
  {
    if (dword_268145D48 <= 100 && (dword_268145D48 != -1 || sub_226865630((uint64_t)&dword_268145D48, 0x64u))) {
      sub_226865EB4((uint64_t)&dword_268145D48, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) runAutoGuessThread:]", 100, (uint64_t)"unconfiguredMACAddress: %@\n", v9, v10, v11, v12, (uint64_t)a3);
    }
    uint64_t v13 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v7, v8);
    uint64_t v16 = objc_msgSend_sharedInstance(WiFiUtils, v14, v15);
    int v19 = objc_msgSend_airPortIsOn(v16, v17, v18);
    uint64_t v21 = objc_msgSend_numberWithBool_(NSNumber, v20, v19 ^ 1u);
    objc_msgSend_setValue_forKey_(v13, v22, v21, @"BSAutoGuessContext_HostNotUsingWireless");
    uint64_t v24 = objc_msgSend_numberWithBool_(NSNumber, v23, 1);
    objc_msgSend_setValue_forKey_(v13, v25, v24, @"BSAutoGuessContext_HostHasPreferredNetworkSupport");
    uint64_t PreferredNetworks = objc_msgSend_getPreferredNetworks_(v16, v26, 0);
    if (PreferredNetworks) {
      objc_msgSend_setObject_forKey_(v13, v28, PreferredNetworks, @"BSAutoGuessContext_HostPreferredNetworks");
    }
    v30 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v31 = objc_msgSend_allValues(self->_browsedBases, v28, v29);
    uint64_t v33 = objc_msgSend_arrayWithArray_(v30, v32, v31);
    if (v33) {
      objc_msgSend_setObject_forKey_(v13, v34, v33, @"BSAutoGuessContext_HostBrowsedBaseStations");
    }
    if (a3)
    {
      if (objc_msgSend_targetBrowseRecord(self, v34, v35))
      {
        uint64_t v38 = objc_msgSend_targetBrowseRecord(self, v36, v37);
        objc_msgSend_setObject_forKey_(v13, v39, v38, @"BSAutoGuessContext_ChosenUnconfiguredBrowseRecord");
      }
      else if (objc_msgSend_targetScanRecord(self, v36, v37))
      {
        uint64_t v40 = objc_msgSend_targetScanRecord(self, v34, v35);
        objc_msgSend_setObject_forKey_(v13, v41, v40, @"BSAutoGuessContext_ChosenUnconfiguredScanRecord");
      }
    }
    if (v19)
    {
      wifiScanInfos = self->_wifiScanInfos;
      if (wifiScanInfos)
      {
        uint64_t v43 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v34, (uint64_t)wifiScanInfos);
        objc_msgSend_setObject_forKey_(v13, v44, v43, @"BSAutoGuessContext_HostScannedNetworks");
      }
      if (objc_msgSend_isCurrentlyAssociatedToAnInfrastructureNetwork_(v16, v34, 0))
      {
        uint64_t CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(v16, v34, v35);
        if (CurrentAssociationInfo) {
          objc_msgSend_setObject_forKey_(v13, v34, CurrentAssociationInfo, @"BSAutoGuessContext_HostCurrentWirelessAssociation");
        }
      }
    }
    self->super._callbackContext = 0;
    if ((objc_msgSend_isCancelled(self->_autoGuessThread, v34, v35) & 1) == 0)
    {
      guessContext = (uint64_t *)self->_guessContext;
      if (guessContext)
      {
        if (!sub_2268D4828(guessContext, (CFDictionaryRef)v13, v46, v47, v48, v49, v50, v51))
        {
          int AutoJoinState = objc_msgSend_getAutoJoinState(v16, v53, v54);
          self->_autoJoinState = AutoJoinState;
          if (AutoJoinState) {
            objc_msgSend_setAutoJoinState_(v16, v56, 0);
          }
          v57 = self;
        }
      }
    }
  }
  self->_autoGuessThread = 0;
}

+ (id)recommendationToActionChoice:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = objc_msgSend_objectForKey_(a3, a2, @"BSAutoGuess_Recommendation");
  if (!v3) {
    return 0;
  }
  uint64_t v4 = qword_268148378;

  return (id)sub_22685D62C(v3, v4);
}

+ (BOOL)isRestoreAnOptionForTheRecommendations:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v3 = objc_msgSend_valueForKey_(a3, a2, @"BSAutoGuessComplete_Suggestions");
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, v16, 16);
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v3);
          }
          uint64_t v10 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v12 + 1) + 8 * i), v6, @"BSAutoGuess_Recommendation");
          if (v10 && (objc_msgSend_isEqualToString_(v10, v6, @"BSSetupRecommend_OfferRestore") & 1) != 0)
          {
            LOBYTE(v5) = 1;
            return v5;
          }
        }
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, v16, 16);
        LOBYTE(v5) = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)shortProductNameFromBaseStationDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_msgSend_objectForKey_(a3, a2, @"syAP");
  if (!v4) {
    return 0;
  }
  unsigned int v7 = objc_msgSend_integerValue(v4, v5, v6);
  int v15 = sub_22685AB68((uint64_t)a3, v8, v9, v10, v11, v12, v13, v14);

  return sub_22685D7D0(v7, v15, 0);
}

+ (id)shortProductNameForUnconfiguredDeviceFromAutoGuessResults:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_msgSend_valueForKey_(a3, a2, @"BSAutoGuessComplete_Suggestions");
  if (!v4) {
    return 0;
  }
  unsigned int v7 = v4;
  if (!objc_msgSend_count(v4, v5, v6)) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_objectAtIndex_(v7, v8, 0);
  if (!v9) {
    return 0;
  }
  uint64_t v11 = v9;
  uint64_t v12 = objc_msgSend_valueForKey_(v9, v10, @"BSAutoGuess_UnconfiguredBase");
  if (v12)
  {
    return (id)MEMORY[0x270F9A6D0](a1, sel_shortProductNameFromBaseStationDictionary_, v12);
  }
  uint64_t v14 = objc_msgSend_valueForKey_(v11, v13, @"BSAutoGuess_UnconfiguredNetwork");
  if (!v14) {
    return 0;
  }
  uint64_t v16 = v14;
  unsigned int v17 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v15, v14);
  int v19 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v18, v16);

  return sub_22685D7D0(v17, v19, 0);
}

+ (id)sourceBaseStationFromRecommendation:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_objectForKey_(a3, a2, @"BSAutoGuess_SourceBase");
  }
  else {
    return 0;
  }
}

+ (id)sourceNetworkFromRecommendation:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_objectForKey_(a3, a2, @"BSAutoGuess_SourceNetwork");
  }
  else {
    return 0;
  }
}

+ (id)unconfiguredBaseStationFromGuessCompleteDict:(id)a3
{
  id result = (id)objc_msgSend_valueForKey_(a3, a2, @"primaryRecommendationDict");
  if (result)
  {
    id v5 = result;
    id result = (id)objc_msgSend_valueForKey_(result, v4, @"BSAutoGuess_UnconfiguredBase");
    if (!result)
    {
      return (id)objc_msgSend_valueForKey_(v5, v6, @"BSAutoGuess_UnconfiguredNetwork");
    }
  }
  return result;
}

+ (id)unconfiguredBaseStationFromRecommendation:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_objectForKey_(a3, a2, @"BSAutoGuess_UnconfiguredBase");
  }
  else {
    return 0;
  }
}

+ (BOOL)shouldShowPasswordUIForRecommendation:(id)a3
{
  if ((objc_msgSend_isEqualToString_(a3, a2, @"BSSetupRecommend_OfferCreate") & 1) != 0
    || (int isEqualToString = objc_msgSend_isEqualToString_(a3, v4, @"BSSetupRecommend_OfferJoinNetwork")) != 0)
  {
    LOBYTE(isEqualToString) = 1;
  }
  return isEqualToString;
}

+ (id)restoreOfferFromCompletionDict:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = objc_msgSend_restoreRecommendationDictionaryFromCompletionDict_(AutoGuessController, a2, (uint64_t)a3);

  return (id)objc_msgSend_objectForKey_(v3, v4, @"BSAutoGuess_Recommendation");
}

+ (id)recommendationStringFromCompletionDict:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_valueForKey_(a3, a2, @"recommendationText");
  }
  else {
    return 0;
  }
}

+ (id)unconfiguredBaseStationCanBeConfiguredFromCompletionDict:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_valueForKey_(a3, a2, @"baseStationCanBeConfigured");
  }
  else {
    return 0;
  }
}

+ (id)primaryRecommendationDictionaryFromCompletionDict:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_valueForKey_(a3, a2, @"primaryRecommendationDict");
  }
  else {
    return 0;
  }
}

+ (id)restoreRecommendationDictionaryFromCompletionDict:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_valueForKey_(a3, a2, @"restoreRecommendationDict");
  }
  else {
    return 0;
  }
}

+ (id)fullAutoGuessDictionaryFromCompletionDict:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_valueForKey_(a3, a2, @"fullGuessResults");
  }
  else {
    return 0;
  }
}

- (id)createCompletionDictFromAutoGuessResults:(id)a3
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  int v148 = 0;
  v143 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3);
  id v140 = a3;
  sub_22686088C((const __CFString *)a3, (uint64_t)&v148, (UInt8 *)"%ks:int", v4, v5, v6, v7, v8, (uint64_t)"BSAutoGuessComplete_ErrorResult");
  if (v10) {
    return v143;
  }
  if (v148 == -6723)
  {
    v118 = (void *)MEMORY[0x263F089D8];
    uint64_t v119 = qword_268148378;
    v120 = @"kSetup_SetupRecommendationErrorCanceled";
    goto LABEL_76;
  }
  if (v148)
  {
    v118 = (void *)MEMORY[0x263F089D8];
    uint64_t v119 = qword_268148378;
    v120 = @"kSetup_SetupRecommendationErrorGeneric";
LABEL_76:
    uint64_t v121 = sub_22685D62C((uint64_t)v120, v119);
    uint64_t v123 = objc_msgSend_stringWithString_(v118, v122, v121);
    uint64_t v124 = 0;
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    if (!v123) {
      return v143;
    }
LABEL_77:
    uint64_t v125 = v123;
    objc_msgSend_setValue_forKey_(v143, v15, (uint64_t)v140, @"fullGuessResults");
    objc_msgSend_setValue_forKey_(v143, v126, v125, @"recommendationText");
    uint64_t v128 = objc_msgSend_numberWithBool_(NSNumber, v127, v124);
    objc_msgSend_setValue_forKey_(v143, v129, v128, @"baseStationCanBeConfigured");
    if (v138) {
      objc_msgSend_setValue_forKey_(v143, v130, v138, @"primaryRecommendationDict");
    }
    if (v137) {
      objc_msgSend_setValue_forKey_(v143, v130, v137, @"restoreRecommendationDict");
    }
    return v143;
  }
  id obj = (id)objc_msgSend_objectForKey_(a3, v9, @"BSAutoGuessComplete_Suggestions");
  if (!obj) {
    return v143;
  }
  v136 = objc_msgSend_string(MEMORY[0x263F089D8], v12, v13);
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  uint64_t v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v144, v149, 16);
  if (v142)
  {
    uint64_t v137 = 0;
    uint64_t v138 = 0;
    uint64_t v141 = *(void *)v145;
    char v135 = 1;
LABEL_8:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v145 != v141) {
        objc_enumerationMutation(obj);
      }
      unsigned int v17 = *(void **)(*((void *)&v144 + 1) + 8 * v16);
      uint64_t v18 = objc_msgSend_objectForKey_(v17, v15, @"BSAutoGuess_Recommendation");
      if (!v18) {
        return v143;
      }
      uint64_t v20 = (void *)v18;
      uint64_t v21 = objc_msgSend_objectForKey_(v17, v19, @"BSAutoGuess_AskUserList");
      uint64_t v23 = (__CFString *)objc_msgSend_objectForKey_(v17, v22, @"BSAutoGuess_UnconfiguredBase");
      uint64_t v25 = objc_msgSend_objectForKey_(v17, v24, @"BSAutoGuess_UnconfiguredNetwork");
      uint64_t v33 = (void *)v25;
      if (v23) {
        break;
      }
      if (v25)
      {
        uint64_t v34 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v26, v25);
        int v42 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v53, (uint64_t)v33);
        if ((v42 - 3) > 1) {
          uint64_t v43 = objc_msgSend_shortProductNameForUnconfiguredDeviceFromAutoGuessResults_(AutoGuessController, v54, (uint64_t)v140);
        }
        else {
          uint64_t v43 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v54, (uint64_t)v33);
        }
        goto LABEL_14;
      }
      uint64_t v44 = 0;
      uint64_t v34 = 0;
      int v42 = 0;
LABEL_15:
      uint64_t v45 = sub_22685D75C(v34, v42);
      if (objc_msgSend_isEqualToString_(v20, v46, @"BSSetupRecommend_OfferCreate"))
      {
        uint64_t v48 = objc_msgSend_stringWithFormat_(NSString, v47, @"PrimarySetupRecommendation_Create%@", v45);
LABEL_19:
        uint64_t valid = sub_22685D62C(v48, qword_268148378);
        goto LABEL_20;
      }
      if (objc_msgSend_isEqualToString_(v20, v47, @"BSSetupRecommend_OfferExtendOverEthernet"))
      {
        uint64_t v48 = objc_msgSend_stringWithFormat_(NSString, v49, @"PrimarySetupRecommendation_ExtendEthernet%@", v45);
        goto LABEL_19;
      }
      if (objc_msgSend_isEqualToString_(v20, v49, @"BSSetupRecommend_OfferExtendWirelessly"))
      {
        v56 = objc_msgSend_objectForKey_(v17, v55, @"BSAutoGuess_SourceBase");
        id v58 = objc_msgSend_valueForKey_(v56, v57, @"raNm");
        uint64_t v61 = objc_msgSend_length(v58, v59, v60);
        v63 = NSString;
        BOOL v64 = v61 == 0;
        v65 = @"PrimarySetupRecommendation_ExtendWireless.Specific%@";
        v66 = @"PrimarySetupRecommendation_ExtendWireless%@";
LABEL_34:
        if (v64) {
          uint64_t v73 = objc_msgSend_stringWithFormat_(v63, v62, (uint64_t)v66, v45);
        }
        else {
          uint64_t v73 = objc_msgSend_stringWithFormat_(v63, v62, (uint64_t)v65, v45);
        }
        uint64_t v52 = (__CFString *)sub_22685D62C(v73, qword_268148378);
        if (!objc_msgSend_length(v58, v74, v75)) {
          goto LABEL_21;
        }
        v76 = NSString;
        uint64_t v131 = (uint64_t)v58;
        goto LABEL_42;
      }
      if (objc_msgSend_isEqualToString_(v20, v55, @"BSSetupRecommend_OfferJoinNetwork"))
      {
        v68 = objc_msgSend_objectForKey_(v17, v67, @"BSAutoGuess_SourceBase");
        id v58 = objc_msgSend_valueForKey_(v68, v69, @"raNm");
        uint64_t v72 = objc_msgSend_length(v58, v70, v71);
        v63 = NSString;
        BOOL v64 = v72 == 0;
        v65 = @"PrimarySetupRecommendation_Join.Specific%@";
        v66 = @"PrimarySetupRecommendation_Join%@";
        goto LABEL_34;
      }
      if (objc_msgSend_isEqualToString_(v20, v67, @"BSSetupRecommend_OfferReplace"))
      {
        uint64_t v78 = objc_msgSend_stringWithFormat_(NSString, v77, @"PrimarySetupRecommendation_Replace%@", v45);
        v80 = objc_msgSend_objectForKey_(v17, v79, @"BSAutoGuess_SourceBase");
        v81 = NSString;
        uint64_t v52 = (__CFString *)sub_22685D62C(v78, qword_268148378);
        uint64_t v131 = objc_msgSend_objectForKey_(v80, v82, @"raNm");
        v76 = v81;
LABEL_42:
        uint64_t v83 = (uint64_t)v52;
LABEL_43:
        uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v76, v51, v83, @"%@", 0, v131, v132, v134);
        goto LABEL_20;
      }
      if ((objc_msgSend_isEqualToString_(v20, v77, @"BSSetupRecommend_OfferRestore") & 1) != 0
        || (objc_msgSend_isEqualToString_(v20, v51, @"BSSetupRecommend_OfferNoRestore") & 1) != 0)
      {
        uint64_t v137 = (uint64_t)v17;
LABEL_47:
        uint64_t v52 = &stru_26DA6BE88;
        goto LABEL_21;
      }
      if (objc_msgSend_isEqualToString_(v20, v51, @"BSSetupRecommend_TellUserCannotFindDevices")|| objc_msgSend_isEqualToString_(v20, v84, @"BSSetupRecommend_WaitForBaseStation"))
      {
        uint64_t v86 = qword_268148378;
        v87 = @"kProgress_NothingNewFoundError";
LABEL_51:
        uint64_t v88 = sub_22685D62C((uint64_t)v87, v86);
        goto LABEL_52;
      }
      if (objc_msgSend_isEqualToString_(v20, v85, @"BSSetupRecommend_DeviceIsTooNewToSetUp"))
      {
        v87 = (__CFString *)objc_msgSend_stringWithFormat_(NSString, v89, @"BaseStationTooNew%@", v45);
        uint64_t v86 = qword_268148378;
        goto LABEL_51;
      }
      if (objc_msgSend_isEqualToString_(v20, v89, @"BSSetupRecommend_AskUserChooseBaseWired")|| objc_msgSend_isEqualToString_(v20, v90, @"BSSetupRecommend_AskUserChooseBaseWireless"))
      {
        unint64_t v92 = objc_msgSend_count(v21, v90, v91);
        v93 = NSString;
        if (v92 <= 3)
        {
          uint64_t v94 = sub_22685D62C(@"CantPickNamedBasesToExtend", qword_268148378);
          uint64_t v96 = objc_msgSend_valueForKey_(v23, v95, @"name");
          v97 = (const char *)sub_22685D62C(@"Conjunction_Or", qword_268148378);
          v99 = sub_226842A94(v21, v97, v98);
          goto LABEL_62;
        }
        uint64_t v101 = sub_22685D62C(@"CantPickOneOfManyBasesToExtend", qword_268148378);
        uint64_t v133 = objc_msgSend_valueForKey_(v23, v102, @"name");
        uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v93, v103, v101, @"%@%@", 0, v44, v133, v134);
LABEL_20:
        uint64_t v52 = (__CFString *)valid;
        goto LABEL_21;
      }
      if (objc_msgSend_isEqualToString_(v20, v90, @"BSSetupRecommend_AskUserChooseNetworkToJoin"))
      {
        v93 = NSString;
        uint64_t v94 = sub_22685D62C(@"CantPickNamedBasesToJoin", qword_268148378);
        uint64_t v96 = objc_msgSend_valueForKey_(v23, v105, @"name");
        v106 = (const char *)sub_22685D62C(@"Conjunction_Or", qword_268148378);
        v99 = sub_226842C70(v21, v106, v107);
LABEL_62:
        uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v93, v100, v94, @"%@%@%@", 0, v44, v96, v99);
        goto LABEL_20;
      }
      if ((objc_msgSend_isEqualToString_(v20, v104, @"BSSetupRecommend_UseAUFor80211g") & 1) == 0
        && !objc_msgSend_isEqualToString_(v20, v51, @"BSSetupRecommend_FirmwareUpdateRequired"))
      {
        if (objc_msgSend_isEqualToString_(v20, v51, @"BSSetupRecommend_NoNetworkToJoin"))
        {
          v116 = NSString;
          uint64_t v83 = sub_22685D62C(@"CantFindNetworksToJoin", qword_268148378);
          uint64_t v131 = v44;
          v76 = v116;
          goto LABEL_43;
        }
        goto LABEL_47;
      }
      if (v23)
      {
        v108 = NSString;
        uint64_t v109 = sub_22685D62C(@"UseAirPortUtilityFor80211g", qword_268148378);
        uint64_t v132 = objc_msgSend_valueForKey_(v23, v110, @"name");
        uint64_t v88 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v108, v111, v109, @"%@%@", 0, v44);
      }
      else
      {
        if (!v33)
        {
          char v135 = 0;
          goto LABEL_47;
        }
        v112 = NSString;
        uint64_t v113 = sub_22685D62C(@"UseAirPortUtilityFor80211g", qword_268148378);
        uint64_t v132 = objc_msgSend_valueForKey_(v33, v114, @"SSID_STR");
        uint64_t v88 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v112, v115, v113, @"%@%@", 0, v44);
      }
LABEL_52:
      uint64_t v52 = (__CFString *)v88;
      char v135 = 0;
LABEL_21:
      if ((objc_msgSend_isEqualToString_(v20, v51, @"BSSetupRecommend_OfferRestore") & 1) == 0
        && (objc_msgSend_isEqualToString_(v20, v15, @"BSSetupRecommend_OfferNoRestore") & 1) == 0)
      {
        objc_msgSend_setString_(v136, v15, (uint64_t)v52);
        uint64_t v138 = (uint64_t)v17;
      }
      if (v142 == ++v16)
      {
        uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v144, v149, 16);
        uint64_t v142 = v117;
        if (v117) {
          goto LABEL_8;
        }
        goto LABEL_82;
      }
    }
    uint64_t v34 = (uint64_t)sub_22685AB94(v23, (uint64_t)v26, v27, v28, v29, v30, v31, v32);
    int v42 = sub_22685AB68((uint64_t)v23, v35, v36, v37, v38, v39, v40, v41);
    uint64_t v43 = (uint64_t)sub_22685D7D0(v34, v42, 0);
LABEL_14:
    uint64_t v44 = v43;
    goto LABEL_15;
  }
  uint64_t v137 = 0;
  uint64_t v138 = 0;
  char v135 = 1;
LABEL_82:
  uint64_t v124 = v135 & 1;
  uint64_t v123 = (uint64_t)v136;
  if (v136) {
    goto LABEL_77;
  }
  return v143;
}

@end