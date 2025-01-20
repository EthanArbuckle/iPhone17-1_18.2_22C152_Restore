@interface AirPortAssistantController
+ (BOOL)isAirPlayDevice:(id)a3;
+ (BOOL)isGenericMFiAccessory:(id)a3;
+ (BOOL)isHomeKitSecureWACDevice:(id)a3;
+ (BOOL)isSTAOnlyDevice:(id)a3;
+ (BOOL)isUnconfiguredDevice:(id)a3;
+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5;
+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5 viewController:(id)a6;
+ (id)assistantUIViewControllerWithParameters:(id)a3;
+ (id)sharedInstance;
+ (id)unconfiguredDeviceID:(id)a3;
+ (id)unconfiguredDeviceName:(id)a3;
+ (id)uniqueBaseStationName:(id)a3 withBssid:(id)a4;
+ (void)cancelAirPortAssistantController;
- (AirPortAssistantControllerDelegate)delegate;
- (NSDictionary)unconfiguredWACDevices;
- (NSString)configuredSSID;
- (id)WACDeviceFromScanInfo:(id)a3;
- (id)context;
- (id)viewController;
- (int)configureUIViewControllerWithParameters:(id)a3;
- (int)start2_4WiFiScan;
- (void)assistantCompleteWithResult:(int)a3;
- (void)dealloc;
- (void)setConfiguredSSID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUnconfiguredWACDevices:(id)a3;
- (void)setViewController:(id)a3;
- (void)stop2_4WiFiScan;
- (void)updateWACListeners;
- (void)wirelessScanDone:(id)a3;
@end

@implementation AirPortAssistantController

+ (id)sharedInstance
{
  id result = (id)qword_268148248;
  if (!qword_268148248)
  {
    id result = objc_alloc_init(AirPortAssistantController);
    qword_268148248 = (uint64_t)result;
  }
  return result;
}

+ (id)assistantUIViewControllerWithParameters:(id)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v4 = objc_msgSend_objectForKey_(a3, a2, @"scanRecord");
    uint64_t v6 = objc_msgSend_objectForKey_(v3, v5, @"currentWiFiScan");
    uint64_t v8 = objc_msgSend_objectForKey_(v3, v7, @"deviceMACAddr");
    if (!(v4 | v8)) {
      return 0;
    }
    uint64_t v11 = v8;
    v3 = objc_msgSend_sharedInstance(AirPortAssistantController, v9, v10);
    if (v3)
    {
      v12 = [AssistantUIViewController alloc];
      v14 = objc_msgSend_initWithNibName_bundle_(v12, v13, 0, 0);
      if (v14)
      {
        v16 = v14;
        objc_msgSend_setAssistantDelegate_(v14, v15, (uint64_t)v3);
        objc_msgSend_setMacAddress_(v16, v17, v11);
        objc_msgSend_setScanInfoRecord_(v16, v18, v4);
        objc_msgSend_setParamScanResults_(v16, v19, v6);
        objc_msgSend_setViewController_(v3, v20, (uint64_t)v16);

        uint64_t v22 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v21, v4);
        objc_msgSend_setConfiguredSSID_(v3, v23, v22);
        return v3;
      }

      return 0;
    }
  }
  return v3;
}

+ (void)cancelAirPortAssistantController
{
  objc_msgSend_downloadAssetsCancel(AirPortAssistantController, a2, v2);
  if (qword_268148240)
  {
    v5 = objc_msgSend_uiAlert((void *)qword_268148240, v3, v4);
    objc_msgSend_dismissWithCancelActionAnimated_(v5, v6, 0);
  }
  if (qword_268148248)
  {
    v7 = objc_msgSend_delegate((void *)qword_268148248, v3, v4);
    objc_msgSend_setDelegate_((void *)qword_268148248, v8, 0);
    uint64_t v11 = objc_msgSend_viewController((void *)qword_268148248, v9, v10);
    objc_msgSend_handeImmediateCancel(v11, v12, v13);
    id v14 = (id)qword_268148248;
    if (v7)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v18 = qword_268148248;
        uint64_t v19 = objc_msgSend_context((void *)qword_268148248, v16, v17);
        objc_msgSend_airPortAssistantComplete_result_context_animated_(v7, v20, v18, 4294960573, v19, 0);
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend_airPortAssistantComplete_animated_(v7, v21, qword_268148248, 0);
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend_airPortAssistantComplete_(v7, v15, qword_268148248);
      }
    }
    uint64_t v22 = (void *)qword_268148248;
    objc_msgSend_setContext_(v22, v15, 0);
  }
}

- (void)assistantCompleteWithResult:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = self;
  if (self->_delegate)
  {
    char v7 = objc_opt_respondsToSelector();
    id delegate = self->_delegate;
    if (v7)
    {
      uint64_t v10 = objc_msgSend_context(self, v6, v8);
      objc_msgSend_airPortAssistantComplete_result_context_animated_(delegate, v11, (uint64_t)self, v3, v10, 1);
    }
    else if (delegate)
    {
      char v12 = objc_opt_respondsToSelector();
      id v13 = self->_delegate;
      if (v12)
      {
        objc_msgSend_airPortAssistantComplete_animated_(v13, v6, (uint64_t)self, 1);
      }
      else if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_airPortAssistantComplete_(self->_delegate, v6, (uint64_t)self);
      }
    }
  }

  objc_msgSend_setContext_(self, v6, 0);
}

+ (BOOL)isAirPlayDevice:(id)a3
{
  return (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, a2, (uint64_t)a3) & 0xFFFFFFFE) == 2;
}

+ (BOOL)isSTAOnlyDevice:(id)a3
{
  return objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, a2, (uint64_t)a3);
}

+ (BOOL)isGenericMFiAccessory:(id)a3
{
  return objc_msgSend_scanInfoDeviceKind_(WiFiUtils, a2, (uint64_t)a3) == 4;
}

+ (BOOL)isHomeKitSecureWACDevice:(id)a3
{
  return MEMORY[0x270F9A6D0](WiFiUtils, sel_scanInfoIsHomeKitSecureWAC_, a3);
}

+ (BOOL)isUnconfiguredDevice:(id)a3
{
  objc_msgSend_downloadAssetsIfNeeded(AirPortAssistantController, a2, (uint64_t)a3);
  int IsUnconfigured = objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, v4, (uint64_t)a3);
  char v7 = objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v6, (uint64_t)a3);
  char v9 = objc_msgSend_scanInfoSupportsACPConfigV1_(WiFiUtils, v8, (uint64_t)a3);
  char v11 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v10, (uint64_t)a3);
  int v13 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v12, (uint64_t)a3);
  if (!IsUnconfigured) {
    return 0;
  }
  if (v13) {
    char v14 = 1;
  }
  else {
    char v14 = v7;
  }
  return v14 | v9 | v11;
}

+ (id)unconfiguredDeviceName:(id)a3
{
  uint64_t v4 = (const char *)objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);

  return sub_22685D9D0((uint64_t)a3, v4, 0);
}

+ (id)unconfiguredDeviceID:(id)a3
{
  return (id)objc_msgSend_scanInfoDeviceID_(WiFiUtils, a2, (uint64_t)a3);
}

+ (id)uniqueBaseStationName:(id)a3 withBssid:(id)a4
{
  v5 = (char *)sub_22685DC10(a4, 0, (uint64_t)a3);
  uint64_t v6 = (void *)MEMORY[0x263F089D8];
  uint64_t v8 = objc_msgSend_substringFromIndex_(v5, v7, 9);
  uint64_t v10 = objc_msgSend_stringWithString_(v6, v9, v8);
  uint64_t v13 = objc_msgSend_length(v10, v11, v12);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v10, v14, @":", &stru_26DA6BE88, 0, 0, v13 - 1);
  return (id)objc_msgSend_stringWithFormat_(NSString, v15, @"%@ %@", a3, v10);
}

+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5
{
  return MEMORY[0x270F9A6D0](AirPortAssistantController, sel_launchAUForNetwork_withMacAddress_getAUFromAppStore_viewController_, a3);
}

+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5 viewController:(id)a6
{
  BOOL v7 = a5;
  uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, a2, @"apmanage://manage?");
  if (a4) {
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v10, @"%@macaddr=%@", v11, a4);
  }
  if (a3)
  {
    uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v10, @"%@&network=%@", v11, a3);
    uint64_t v15 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v13, v14);
    uint64_t v11 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v12, v16, v15);
  }
  uint64_t v17 = objc_msgSend_URLWithString_(NSURL, v10, v11);
  BOOL v18 = sub_2269012B4(v17);
  if (!v18 && v7)
  {
    sub_22685D5C4(@"SetupRecommendations");
    uint64_t v19 = [AUUIAlert alloc];
    id v21 = (id)objc_msgSend_initWithViewController_(v19, v20, (uint64_t)a6);
    uint64_t v22 = sub_22685D62C(@"AskToGetAirPortUtility1", qword_268148378);
    objc_msgSend_setTitle_(v21, v23, v22);
    uint64_t v24 = sub_22685D62C(@"AskToGetAirPortUtility2", qword_268148378);
    objc_msgSend_setMessage_(v21, v25, v24);
    uint64_t v26 = sub_22685D62C(@"kOK", qword_268148378);
    objc_msgSend_setOkButtonTitle_(v21, v27, v26);
    uint64_t v28 = sub_22685D62C(@"kCancel", qword_268148378);
    objc_msgSend_setCancelButtonTitle_(v21, v29, v28);
    qword_268148240 = objc_alloc_init(AUUIAlertDelegateClass);
    objc_msgSend_setDelegate_(v21, v30, qword_268148240);
    objc_msgSend_setUiAlert_((void *)qword_268148240, v31, (uint64_t)v21);
    objc_msgSend_show(v21, v32, v33);
  }
  return v18;
}

- (int)start2_4WiFiScan
{
  uint64_t v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  if (!v4) {
    return -6728;
  }
  BOOL v7 = v4;
  if (!objc_msgSend_airPortIsOn(v4, v5, v6)) {
    return -6729;
  }
  if (objc_msgSend_isScanningActive(v7, v8, v9)) {
    return -6709;
  }
  objc_msgSend_setUnconfiguredWACDevices_(self, v10, 0);
  objc_msgSend_clearScanCache(v7, v12, v13);
  objc_msgSend_setPeriodicScanType_(v7, v14, 1);
  objc_msgSend_setPeriodicScanInterval_(v7, v15, v16, 10.0);
  objc_msgSend_activateScanning_(v7, v17, 1);
  v20 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v18, v19);
  objc_msgSend_addObserver_selector_name_object_(v20, v21, (uint64_t)self, sel_wirelessScanDone_, @"com.apple.WiFiUtils.Scan.Complete", 0);
  return 0;
}

- (void)stop2_4WiFiScan
{
  uint64_t v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  if (v4)
  {
    BOOL v7 = v4;
    if (objc_msgSend_isScanningActive(v4, v5, v6))
    {
      objc_msgSend_activateScanning_(v7, v5, 0);
      objc_msgSend_cancelAsync(v7, v8, v9);
    }
  }
  uint64_t v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v5, v6);

  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, @"com.apple.WiFiUtils.Scan.Complete", 0);
}

- (int)configureUIViewControllerWithParameters:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  if (!a3) {
    return -6762;
  }
  uint64_t v5 = objc_msgSend_objectForKey_(a3, a2, @"scanRecord");
  uint64_t v7 = objc_msgSend_objectForKey_(a3, v6, @"currentWiFiScan");
  uint64_t v9 = objc_msgSend_objectForKey_(a3, v8, @"deviceMACAddr");
  uint64_t v11 = objc_msgSend_objectForKey_(a3, v10, @"wacShouldHideFindAppUI");
  if (!(v5 | v9)) {
    return -6762;
  }
  uint64_t v12 = v11;
  uint64_t v13 = [AssistantUIViewController alloc];
  uint64_t v15 = objc_msgSend_initWithNibName_bundle_(v13, v14, 0, 0);
  if (!v15) {
    return -6762;
  }
  uint64_t v17 = v15;
  objc_msgSend_setAssistantDelegate_(v15, v16, (uint64_t)self);
  objc_msgSend_setMacAddress_(v17, v18, v9);
  objc_msgSend_setScanInfoRecord_(v17, v19, v5);
  objc_msgSend_setParamScanResults_(v17, v20, v7);
  if (v12)
  {
    v25 = @"wacShouldHideFindAppUI";
    v26[0] = v12;
    uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v26, &v25, 1);
    objc_msgSend_setCallerParamDict_(v17, v23, v22);
  }
  objc_msgSend_setViewController_(self, v21, (uint64_t)v17);

  return 0;
}

- (void)wirelessScanDone:(id)a3
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x270F9A6D0](self, sel_updateWACListeners, v4);
  }
}

- (void)updateWACListeners
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  uint64_t v7 = objc_msgSend_mergedScanInfoArray(v4, v5, v6);
  uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v8, v9);
  v83 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v11, v12);
  if (objc_msgSend_count(self->_unconfiguredWACDevices, v13, v14))
  {
    uint64_t v17 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v18 = objc_msgSend_unconfiguredWACDevices(self, v15, v16);
    v85 = objc_msgSend_dictionaryWithDictionary_(v17, v19, v18);
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v20, (uint64_t)&v94, v104, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v95 != v25) {
            objc_enumerationMutation(v7);
          }
          uint64_t v27 = *(void *)(*((void *)&v94 + 1) + 8 * i);
          if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v22, v27) & 1) != 0
            || objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v22, v27))
          {
            v29 = objc_msgSend_unconfiguredWACDevices(self, v22, v28);
            uint64_t v31 = objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, v30, v27);
            if (!objc_msgSend_objectForKey_(v29, v32, v31))
            {
              uint64_t v33 = objc_msgSend_WACDeviceFromScanInfo_(self, v22, v27);
              uint64_t v35 = objc_msgSend_objectForKey_(v33, v34, @"wacMACAddress");
              objc_msgSend_setObject_forKey_(v10, v36, (uint64_t)v33, v35);
              objc_msgSend_setObject_forKey_(v85, v37, (uint64_t)v33, v35);
            }
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v22, (uint64_t)&v94, v104, 16);
      }
      while (v24);
    }
    v38 = objc_msgSend_unconfiguredWACDevices(self, v22, v23);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    obuint64_t j = (id)objc_msgSend_allValues(v38, v39, v40);
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v90, v103, 16);
    if (v42)
    {
      uint64_t v44 = v42;
      v81 = v10;
      v82 = self;
      uint64_t v45 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v91 != v45) {
            objc_enumerationMutation(obj);
          }
          v47 = *(void **)(*((void *)&v90 + 1) + 8 * j);
          v48 = objc_msgSend_objectForKey_(v47, v43, @"wacMACAddress");
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v49, (uint64_t)&v86, v102, 16);
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v87;
LABEL_20:
            uint64_t v53 = 0;
            while (1)
            {
              if (*(void *)v87 != v52) {
                objc_enumerationMutation(v7);
              }
              uint64_t v54 = objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, v43, *(void *)(*((void *)&v86 + 1) + 8 * v53));
              if (objc_msgSend_isEqualToString_(v48, v55, v54)) {
                break;
              }
              if (v51 == ++v53)
              {
                uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v43, (uint64_t)&v86, v102, 16);
                if (v51) {
                  goto LABEL_20;
                }
                goto LABEL_26;
              }
            }
          }
          else
          {
LABEL_26:
            objc_msgSend_setObject_forKey_(v83, v43, (uint64_t)v47, v48);
            objc_msgSend_removeObjectForKey_(v85, v56, (uint64_t)v48);
          }
        }
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v90, v103, 16);
      }
      while (v44);
      uint64_t v10 = v81;
      self = v82;
    }
    objc_msgSend_setUnconfiguredWACDevices_(self, v43, (uint64_t)v85);
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v15, (uint64_t)&v98, v105, 16);
    uint64_t v61 = (uint64_t)v10;
    if (v59)
    {
      uint64_t v62 = v59;
      uint64_t v63 = *(void *)v99;
      do
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v99 != v63) {
            objc_enumerationMutation(v7);
          }
          uint64_t v65 = *(void *)(*((void *)&v98 + 1) + 8 * k);
          if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v60, v65) & 1) != 0
            || objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v60, v65))
          {
            v66 = objc_msgSend_WACDeviceFromScanInfo_(self, v60, v65);
            uint64_t v68 = objc_msgSend_objectForKey_(v66, v67, @"wacMACAddress");
            objc_msgSend_setObject_forKey_(v10, v69, (uint64_t)v66, v68);
          }
        }
        uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v60, (uint64_t)&v98, v105, 16);
      }
      while (v62);
      uint64_t v61 = (uint64_t)v10;
    }
    objc_msgSend_setUnconfiguredWACDevices_(self, v60, v61);
  }
  if (objc_msgSend_count(v10, v57, v58) || objc_msgSend_count(v83, v70, v71))
  {
    id delegate = self->_delegate;
    uint64_t v73 = objc_msgSend_allValues(v10, v70, v71);
    uint64_t v76 = objc_msgSend_allValues(v83, v74, v75);
    objc_msgSend_wacDevicesAdded_andWACDevicesRemoved_withController_(delegate, v77, v73, v76, self);
  }
  v78 = objc_msgSend_sharedInstance(WiFiUtils, v70, v71);
  objc_msgSend_clearScanCache(v78, v79, v80);
}

- (id)WACDeviceFromScanInfo:(id)a3
{
  uint64_t v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3);
  uint64_t v5 = NSNumber;
  uint64_t IsMFIAirPlayDevice = objc_msgSend_scanInfoIsMFIAirPlayDevice_(WiFiUtils, v6, (uint64_t)a3);
  uint64_t v36 = objc_msgSend_numberWithBool_(v5, v8, IsMFIAirPlayDevice);
  uint64_t v9 = NSNumber;
  uint64_t v11 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v10, (uint64_t)a3);
  uint64_t v13 = objc_msgSend_numberWithBool_(v9, v12, v11);
  uint64_t v14 = NSNumber;
  uint64_t v16 = objc_msgSend_scanInfoSupportsSecureWAC_(WiFiUtils, v15, (uint64_t)a3);
  uint64_t v18 = objc_msgSend_numberWithBool_(v14, v17, v16);
  uint64_t v20 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v19, (uint64_t)a3);
  uint64_t v22 = objc_msgSend_scanInfoDeviceID_(WiFiUtils, v21, (uint64_t)a3);
  uint64_t v24 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v23, (uint64_t)a3);
  uint64_t v26 = objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, v25, (uint64_t)a3);
  uint64_t v28 = objc_msgSend_scanInfoModelName_(WiFiUtils, v27, (uint64_t)a3);
  uint64_t v30 = objc_msgSend_scanInfoManufacturerName_(WiFiUtils, v29, (uint64_t)a3);
  objc_msgSend_setObject_forKey_(v4, v31, v36, @"wacSupportsAirPlay");
  objc_msgSend_setObject_forKey_(v4, v32, v13, @"wacSupportsSpruce");
  objc_msgSend_setObject_forKey_(v4, v33, v18, @"wacSupportsSecureWAC");
  if (v20) {
    objc_msgSend_setObject_forKey_(v4, v34, v20, @"wacFriendlyName");
  }
  if (v22) {
    objc_msgSend_setObject_forKey_(v4, v34, v22, @"wacDeviceID");
  }
  if (v24) {
    objc_msgSend_setObject_forKey_(v4, v34, v24, @"wacSSID");
  }
  if (v26) {
    objc_msgSend_setObject_forKey_(v4, v34, v26, @"wacMACAddress");
  }
  if (v28) {
    objc_msgSend_setObject_forKey_(v4, v34, v28, @"wacModelName");
  }
  if (v30) {
    objc_msgSend_setObject_forKey_(v4, v34, v30, @"wacManufacturerName");
  }
  return v4;
}

- (void)dealloc
{
  qword_268148248 = 0;
  objc_msgSend_sharedInstanceRelease(WiFiUtils, v3, v4);

  self->_configuredSSID = 0;
  objc_msgSend_setUnconfiguredWACDevices_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)AirPortAssistantController;
  [(AirPortAssistantController *)&v6 dealloc];
}

- (AirPortAssistantControllerDelegate)delegate
{
  return (AirPortAssistantControllerDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (id)viewController
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setViewController:(id)a3
{
}

- (id)context
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setContext:(id)a3
{
}

- (NSString)configuredSSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguredSSID:(id)a3
{
}

- (NSDictionary)unconfiguredWACDevices
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnconfiguredWACDevices:(id)a3
{
}

@end