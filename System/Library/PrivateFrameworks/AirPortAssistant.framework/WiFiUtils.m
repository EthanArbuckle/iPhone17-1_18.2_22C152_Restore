@interface WiFiUtils
+ (BOOL)network:(id)a3 shouldBeIgnored:(int)a4;
+ (BOOL)networkIsApple:(id)a3 productID:(unsigned int *)a4;
+ (BOOL)networkIsSecure:(id)a3 secMode:(int *)a4 isEnterprise:(BOOL *)a5;
+ (BOOL)scanInfoCanJoin2_4GHzNetworks:(id)a3;
+ (BOOL)scanInfoCanJoin5GHzNetworks:(id)a3;
+ (BOOL)scanInfoCanJoinWPA3Networks:(id)a3;
+ (BOOL)scanInfoIs5GHz:(id)a3;
+ (BOOL)scanInfoIsAirPlayDevice:(id)a3;
+ (BOOL)scanInfoIsAudioDevice:(id)a3;
+ (BOOL)scanInfoIsDWDSCapable:(id)a3 isDWDSEnabled:(BOOL *)a4;
+ (BOOL)scanInfoIsGuestNetwork:(id)a3;
+ (BOOL)scanInfoIsHomeKitSecureWAC:(id)a3;
+ (BOOL)scanInfoIsIBSS:(id)a3;
+ (BOOL)scanInfoIsInSoftReset:(id)a3;
+ (BOOL)scanInfoIsMFIAirPlayDevice:(id)a3;
+ (BOOL)scanInfoIsSTAOnly:(id)a3;
+ (BOOL)scanInfoIsUnconfigured:(id)a3;
+ (BOOL)scanInfoIsWPA3:(id)a3;
+ (BOOL)scanInfoIsiAPOverWiFiDevice:(id)a3;
+ (BOOL)scanInfoSupportsACPConfigV1:(id)a3;
+ (BOOL)scanInfoSupportsMFIConfigV1:(id)a3;
+ (BOOL)scanInfoSupportsSecureWAC:(id)a3;
+ (BOOL)scanInfoSupportsSoftwareTokenAuth:(id)a3;
+ (BOOL)scanInfoSupportsSpruce:(id)a3;
+ (BOOL)scanInfoTestBitFromAppleDeviceIE:(id)a3 forType:(int64_t)a4;
+ (BOOL)stringArray:(id)a3 containsBSSID:(id)a4;
+ (id)copyFilteredNetworks:(id)a3 ignoreOptions:(int)a4;
+ (id)getNetworkPassword:(id)a3;
+ (id)scanInfoAirPortUniqueIdentifier:(id)a3;
+ (id)scanInfoBSSIDStr:(id)a3;
+ (id)scanInfoDataFromAppleDeviceIE:(id)a3 forType:(int64_t)a4;
+ (id)scanInfoDeviceID:(id)a3;
+ (id)scanInfoFriendlyName:(id)a3;
+ (id)scanInfoManufacturerName:(id)a3;
+ (id)scanInfoModelName:(id)a3;
+ (id)scanInfoNetworkName:(id)a3;
+ (id)scanInfoStringFromAppleDeviceIE:(id)a3 forType:(int64_t)a4;
+ (id)sharedInstance;
+ (id)sharedInstanceRef;
+ (int)barsForRSSI:(int)a3;
+ (int)scanInfoDeviceKind:(id)a3;
+ (unsigned)scanInfoAppleProductID:(id)a3;
+ (unsigned)scanInfoSubAppleProductID:(id)a3;
+ (void)sharedInstanceRelease;
- (BOOL)airPortIsOn;
- (BOOL)getAutoJoinState;
- (BOOL)isCurrentlyAssociatedToAnInfrastructureNetwork:(BOOL *)a3;
- (BOOL)isJoinInProgress;
- (BOOL)isScanInProgress;
- (BOOL)isScanningActive;
- (NSTimer)_scanTimer;
- (WiFiUtils)init;
- (double)periodicScanInterval;
- (id)getCurrentAssociationInfo;
- (id)getCurrentAssociationInfoOrNil;
- (id)getCurrentAssociationScanInfo;
- (id)getIfList;
- (id)getLinkStatus;
- (id)getNetworkPasswordForNetworkNamed:(id)a3;
- (id)getPreferredNetworks:(BOOL)a3;
- (id)mergedScanInfoArray;
- (id)resetScanInfosOfType:(int)a3;
- (id)scanInfoForMACAddress:(id)a3;
- (id)scanInfoForName:(id)a3 wifiType:(int)a4;
- (id)unconfiguredScanInfosOfType:(int)a3;
- (id)unmergedScanInfoArray;
- (id)unmergedScanInfoDict;
- (int)_asyncWiFiScan:(id)a3 wifiType:(int)a4 merge:(BOOL)a5 maxAge:(unint64_t)a6 isPeriodic:(BOOL)a7;
- (int)asyncWiFiScan:(id)a3 wifiType:(int)a4 merge:(BOOL)a5 maxAge:(unint64_t)a6;
- (int)clearScanCacheSync;
- (int)closeWiFi;
- (int)disassociateSync;
- (int)joinNetworkWithNameAsync:(id)a3 password:(id)a4 rememberChoice:(int)a5;
- (int)joinNetworkWithScanInfoAsync:(id)a3 password:(id)a4 rememberChoice:(int)a5;
- (int)joinNetworkWithScanInfoSync:(id)a3 password:(id)a4 rememberChoice:(int)a5;
- (int)openWiFi;
- (int)periodicScanType;
- (int)setAutoJoinState:(BOOL)a3;
- (void)activateScanning:(BOOL)a3;
- (void)asyncWiFiScanThread:(id)a3;
- (void)cancelAsync;
- (void)clearScanCache;
- (void)dealloc;
- (void)joinNetworkWithNameThread:(id)a3;
- (void)joinNetworkWithScanInfoThread:(id)a3;
- (void)mergeScanResults:(id)a3 ageOut:(BOOL)a4;
- (void)scanTimerCallback:(id)a3;
- (void)setJoinInProgress:(BOOL)a3;
- (void)setPeriodicScanInterval:(double)a3;
- (void)setPeriodicScanType:(int)a3;
- (void)setScanInProgress:(BOOL)a3;
- (void)setScanOnlyWhenAppActive:(BOOL)a3;
- (void)setUnmergedScanInfoDict:(id)a3;
- (void)set_scanTimer:(id)a3;
- (void)triggerScan;
@end

@implementation WiFiUtils

+ (id)sharedInstance
{
  id result = (id)qword_2681482B0;
  if (!qword_2681482B0)
  {
    id result = objc_alloc_init(WiFiUtils);
    qword_2681482B0 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedInstanceRef
{
  return (id)qword_2681482B0;
}

+ (void)sharedInstanceRelease
{
  if (qword_2681482B0)
  {
    v3 = objc_msgSend__scanTimer((void *)qword_2681482B0, a2, v2);
    objc_msgSend_invalidate(v3, v4, v5);
    objc_msgSend_set_scanTimer_((void *)qword_2681482B0, v6, 0);

    qword_2681482B0 = 0;
  }
}

- (WiFiUtils)init
{
  v41.receiver = self;
  v41.super_class = (Class)WiFiUtils;
  uint64_t v2 = [(WiFiUtils *)&v41 init];
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_openWiFi(v2, v3, v4);
    if (v6)
    {
      if (dword_268146700 <= 800)
      {
        uint64_t v12 = v6;
        if (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
          sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils init]", 800, (uint64_t)"Could not init WIFi err: %ld\n", v8, v9, v10, v11, v12);
        }
      }
    }
    objc_msgSend_setPeriodicScanType_(v5, v7, 3);
    objc_msgSend_setPeriodicScanInterval_(v5, v13, v14, 15.0);
    v5->_wifiBusy = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v5->_missingBSSIDCounts = (NSMutableDictionary *)(id)objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v15, v16);
    uint64_t v19 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v17, v18);
    objc_msgSend_setUnmergedScanInfoDict_(v5, v20, v19);
    v21 = (void *)MEMORY[0x263EFFA20];
    v24 = objc_msgSend_distantFuture(MEMORY[0x263EFF910], v22, v23);
    uint64_t v27 = objc_msgSend_date(MEMORY[0x263EFF910], v25, v26);
    objc_msgSend_timeIntervalSinceDate_(v24, v28, v27);
    uint64_t v30 = objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(v21, v29, (uint64_t)v5, sel_scanTimerCallback_, 0, 1);
    objc_msgSend_set_scanTimer_(v5, v31, v30);
    v34 = objc_msgSend_mainRunLoop(MEMORY[0x263EFF9F0], v32, v33);
    uint64_t v37 = objc_msgSend__scanTimer(v5, v35, v36);
    objc_msgSend_addTimer_forMode_(v34, v38, v37, *MEMORY[0x263EFF478]);
    objc_msgSend_activateScanning_(v5, v39, 0);
  }
  return v5;
}

- (void)dealloc
{
  if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils dealloc]", 800, (uint64_t)"%s\n", v2, v3, v4, v5, (uint64_t)"-[WiFiUtils dealloc]");
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_closeWiFi(self, v7, v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
  dispatch_release((dispatch_object_t)self->_wifiBusy);
  self->_wifiBusy = 0;
  objc_msgSend_setUnmergedScanInfoDict_(self, v9, 0);

  self->_missingBSSIDCounts = 0;
  v10.receiver = self;
  v10.super_class = (Class)WiFiUtils;
  [(WiFiUtils *)&v10 dealloc];
}

- (BOOL)airPortIsOn
{
  return sub_2268FC868((uint64_t)self->_wifiShim, (uint64_t)a2, v2, v3, v4, v5, v6, v7) != 0;
}

- (void)setScanOnlyWhenAppActive:(BOOL)a3
{
  if (self->_scanOnlyWhenAppActive != a3)
  {
    self->_scanOnlyWhenAppActive = a3;
    if (!a3 && self->_scanningActive) {
      MEMORY[0x270F9A6D0](self, sel_triggerScan, a3);
    }
  }
}

- (void)activateScanning:(BOOL)a3
{
  BOOL v7 = a3;
  if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils activateScanning:]", 800, (uint64_t)"flag: %d _scanningActive: %d\n", v3, v4, v5, v6, v7);
  }
  if (self->_scanningActive != v7)
  {
    self->_scanningActive = v7;
    if (v7)
    {
      MEMORY[0x270F9A6D0](self, sel_triggerScan, a3);
    }
  }
}

- (BOOL)isScanningActive
{
  return self->_scanningActive;
}

- (BOOL)isScanInProgress
{
  objc_sync_enter(self);
  BOOL scanInProgress = self->_scanInProgress;
  objc_sync_exit(self);
  return scanInProgress;
}

- (BOOL)isJoinInProgress
{
  objc_sync_enter(self);
  BOOL joinInProgress = self->_joinInProgress;
  objc_sync_exit(self);
  return joinInProgress;
}

- (void)cancelAsync
{
  if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils cancelAsync]", 800, (uint64_t)"%s\n", v3, v4, v5, v6, (uint64_t)"-[WiFiUtils cancelAsync]");
  }
  if (objc_msgSend_isScanInProgress(self, a2, v2))
  {
    sub_2268FDA88((uint64_t)self->_wifiShim, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
    objc_msgSend_setScanInProgress_(self, v15, 0);
  }
  else
  {
    if (!objc_msgSend_isJoinInProgress(self, v8, v9)) {
      return;
    }
    sub_2268FDA88((uint64_t)self->_wifiShim, v16, v17, v18, v19, v20, v21, v22);
    objc_msgSend_setJoinInProgress_(self, v23, 0);
  }
  wifiBusy = self->_wifiBusy;

  dispatch_semaphore_signal(wifiBusy);
}

- (void)clearScanCache
{
  uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);

  objc_msgSend_setUnmergedScanInfoDict_(self, v4, v5);
}

- (id)unmergedScanInfoArray
{
  uint64_t v3 = objc_msgSend_unmergedScanInfoDict(self, a2, v2);
  id v6 = (id)objc_msgSend_allValues(v3, v4, v5);

  return v6;
}

- (id)mergedScanInfoArray
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  BOOL v7 = objc_msgSend_unmergedScanInfoArray(self, v5, v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v7);
        }
        v15 = *(__CFString **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_objectForKey_(v15, v10, @"SSID_STR");
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = (const char *)objc_msgSend_objectForKey_(v4, v10, v16);
          if (!v18 || sub_22685BA60(v15, v18)) {
            objc_msgSend_setObject_forKey_(v4, v10, (uint64_t)v15, v17);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v20, v24, 16);
    }
    while (v12);
  }
  return (id)objc_msgSend_allValues(v4, v10, v11);
}

- (id)unconfiguredScanInfosOfType:(int)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, *(uint64_t *)&a3);
  uint64_t v8 = objc_msgSend_unmergedScanInfoArray(self, v6, v7);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, v11, (uint64_t)v15))
        {
          int v16 = objc_msgSend_scanInfoIs5GHz_(WiFiUtils, v11, (uint64_t)v15);
          if ((a3 & 2) != 0) {
            int v17 = 0;
          }
          else {
            int v17 = v16;
          }
          if (v17 == 1 || ((a3 | v16) & 1) == 0)
          {
            if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u)))
            {
              uint64_t v24 = objc_msgSend_objectForKey_(v15, v11, @"SSID_STR");
              objc_msgSend_objectForKey_(v15, v25, @"CHANNEL");
              sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils unconfiguredScanInfosOfType:]", 800, (uint64_t)"Skipping Unconfigured %@ for Channel %@\n", v26, v27, v28, v29, v24);
            }
          }
          else
          {
            if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u)))
            {
              uint64_t v18 = objc_msgSend_objectForKey_(v15, v11, @"SSID_STR");
              objc_msgSend_objectForKey_(v15, v19, @"CHANNEL");
              sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils unconfiguredScanInfosOfType:]", 800, (uint64_t)"Adding Unconfigured %@ for Channel %@\n", v20, v21, v22, v23, v18);
            }
            objc_msgSend_addObject_(v5, v11, (uint64_t)v15);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v31, v35, 16);
    }
    while (v12);
  }
  return v5;
}

- (id)resetScanInfosOfType:(int)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, *(uint64_t *)&a3);
  uint64_t v8 = objc_msgSend_unmergedScanInfoArray(self, v6, v7);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend_scanInfoIsInSoftReset_(WiFiUtils, v11, (uint64_t)v15))
        {
          int v16 = objc_msgSend_scanInfoIs5GHz_(WiFiUtils, v11, (uint64_t)v15);
          if ((a3 & 2) != 0) {
            int v17 = 0;
          }
          else {
            int v17 = v16;
          }
          if (v17 == 1 || ((a3 | v16) & 1) == 0)
          {
            if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u)))
            {
              uint64_t v24 = objc_msgSend_objectForKey_(v15, v11, @"SSID_STR");
              objc_msgSend_objectForKey_(v15, v25, @"CHANNEL");
              sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils resetScanInfosOfType:]", 800, (uint64_t)"Skipping reset %@ for Channel %@\n", v26, v27, v28, v29, v24);
            }
          }
          else
          {
            if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u)))
            {
              uint64_t v18 = objc_msgSend_objectForKey_(v15, v11, @"SSID_STR");
              objc_msgSend_objectForKey_(v15, v19, @"CHANNEL");
              sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils resetScanInfosOfType:]", 800, (uint64_t)"Adding reset %@ for Channel %@\n", v20, v21, v22, v23, v18);
            }
            objc_msgSend_addObject_(v5, v11, (uint64_t)v15);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v31, v35, 16);
    }
    while (v12);
  }
  return v5;
}

- (id)scanInfoForMACAddress:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  if (objc_msgSend_isEqualToString_(a3, a2, @"00:00:00:00:00:00")) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_unmergedScanInfoArray(self, v5, v6);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (!v9) {
    return 0;
  }
  uint64_t v11 = v9;
  uint64_t v12 = *(void *)v18;
LABEL_5:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v18 != v12) {
      objc_enumerationMutation(v7);
    }
    uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
    CFStringRef v15 = (const __CFString *)objc_msgSend_objectForKey_(v14, v10, @"BSSID");
    if (sub_2268A1408((const __CFString *)a3, v15)) {
      return v14;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
      uint64_t v14 = 0;
      if (v11) {
        goto LABEL_5;
      }
      return v14;
    }
  }
}

- (id)scanInfoForName:(id)a3 wifiType:(int)a4
{
  uint64_t v4 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    uint64_t v7 = objc_msgSend_unmergedScanInfoArray(self, a2, (uint64_t)a3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v20;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v4 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        int v14 = objc_msgSend_scanInfoIs5GHz_(WiFiUtils, v10, (uint64_t)v4);
        int v15 = (a4 & 2) != 0 ? 0 : v14;
        if (v15 != 1 && ((a4 | v14) & 1) != 0)
        {
          uint64_t v16 = objc_msgSend_objectForKey_(v4, v10, @"SSID_STR");
          if (objc_msgSend_isEqualToString_(a3, v17, v16)) {
            break;
          }
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v19, v23, 16);
          uint64_t v4 = 0;
          if (v11) {
            goto LABEL_5;
          }
          return v4;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (id)scanInfoNetworkName:(id)a3
{
  return (id)objc_msgSend_objectForKey_(a3, a2, @"SSID_STR");
}

+ (id)scanInfoBSSIDStr:(id)a3
{
  uint64_t v9 = 0;
  if (!a3) {
    return 0;
  }
  sub_22686088C((const __CFString *)a3, (uint64_t)&v9, (UInt8 *)"%kO", v3, v4, v5, v6, v7, @"BSSID");
  return v9;
}

+ (id)scanInfoFriendlyName:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](WiFiUtils, sel_scanInfoStringFromAppleDeviceIE_forType_, a3);
}

+ (id)scanInfoDeviceID:(id)a3
{
  uint64_t v3 = objc_msgSend_scanInfoDataFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 7);
  if (v3
    && (uint64_t v6 = v3, objc_msgSend_length(v3, v4, v5) == 6)
    && (uint64_t v9 = (unsigned __int8 *)objc_msgSend_bytes(v6, v7, v8)) != 0)
  {
    return (id)objc_msgSend_stringWithFormat_(NSString, v10, @"%02x%02x%02x%02x%02x%02x", *v9, v9[1], v9[2], v9[3], v9[4], v9[5]);
  }
  else
  {
    return 0;
  }
}

+ (id)scanInfoManufacturerName:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](WiFiUtils, sel_scanInfoStringFromAppleDeviceIE_forType_, a3);
}

+ (id)scanInfoModelName:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](WiFiUtils, sel_scanInfoStringFromAppleDeviceIE_forType_, a3);
}

+ (id)scanInfoStringFromAppleDeviceIE:(id)a3 forType:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  unsigned __int8 v4 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v13 = 0;
  int v14 = 0;
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
  CFIndex Length = CFDataGetLength(Value);
  int v8 = sub_226869708(BytePtr, (unint64_t)&BytePtr[Length], 10502144, &v14, &v13, 0);
  id result = 0;
  if (!v8)
  {
    int v10 = sub_226869698(v14, (unint64_t)&v14[v13], v4, &v16, &v15, 0);
    id result = 0;
    if (!v10)
    {
      id v11 = [NSString alloc];
      return (id)objc_msgSend_initWithBytes_length_encoding_(v11, v12, (uint64_t)v16, v15, 4);
    }
  }
  return result;
}

+ (id)scanInfoDataFromAppleDeviceIE:(id)a3 forType:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  unsigned __int8 v4 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
  CFIndex Length = CFDataGetLength(Value);
  int v8 = sub_226869708(BytePtr, (unint64_t)&BytePtr[Length], 10502144, &v13, &v12, 0);
  id result = 0;
  if (!v8)
  {
    id result = 0;
    if (v13)
    {
      if (v12)
      {
        int v11 = sub_226869698(v13, (unint64_t)&v13[v12], v4, &v15, &v14, 0);
        id result = 0;
        if (!v11)
        {
          if (v15)
          {
            if (v14) {
              return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, (uint64_t)v15);
            }
          }
        }
      }
    }
  }
  return result;
}

+ (id)scanInfoAirPortUniqueIdentifier:(id)a3
{
  int v10 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  int v3 = sub_226872B6C((CFDictionaryRef)a3, &v10, &v8);
  id result = 0;
  if (!v3)
  {
    int v6 = sub_2268698B8(v10, (unint64_t)&v10[v8], 1, &v9, &v7, 0);
    id result = 0;
    if (!v6) {
      return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v5, (uint64_t)v9, v7);
    }
  }
  return result;
}

+ (unsigned)scanInfoSubAppleProductID:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (!sub_226872B6C((CFDictionaryRef)a3, &v9, &v7)
    && ((uint64_t v6 = 0, !sub_2268698B8(v9, (unint64_t)&v9[v7], 2, &v8, &v6, 0))
      ? (BOOL v3 = v8 == 0)
      : (BOOL v3 = 1),
        !v3 ? (BOOL v4 = v6 == 1) : (BOOL v4 = 0),
        v4))
  {
    return *v8;
  }
  else
  {
    return 0;
  }
}

+ (unsigned)scanInfoAppleProductID:(id)a3
{
  if (a3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
    if (Value)
    {
      CFDataRef v4 = Value;
      unsigned __int8 v9 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v4);
      int v7 = sub_226869794(BytePtr, (unint64_t)&BytePtr[Length], &v9, 0);
      LODWORD(Value) = 0;
      if (!v7) {
        LODWORD(Value) = v9;
      }
    }
  }
  else
  {
    LODWORD(Value) = 0;
  }
  return Value;
}

+ (int)scanInfoDeviceKind:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (objc_msgSend_scanInfoIsMFIAirPlayDevice_(WiFiUtils, a2, (uint64_t)a3)) {
    return 3;
  }
  if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v4, (uint64_t)a3) & 1) != 0
    || objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v6, (uint64_t)a3)
    && !objc_msgSend_scanInfoSupportsSecureWAC_(WiFiUtils, v7, (uint64_t)a3))
  {
    return 4;
  }
  if (objc_msgSend_scanInfoIsAirPlayDevice_(WiFiUtils, v7, (uint64_t)a3)) {
    return 2;
  }
  return 1;
}

+ (BOOL)scanInfoIsUnconfigured:(id)a3
{
  if (a3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
    if (Value)
    {
      CFDataRef v5 = Value;
      unsigned __int16 v10 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v5);
      if (sub_226869794(BytePtr, (unint64_t)&BytePtr[Length], 0, &v10)) {
        LOBYTE(Value) = objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, v8, (uint64_t)a3, 1);
      }
      else {
        LODWORD(Value) = (v10 >> 1) & 1;
      }
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsGuestNetwork:(id)a3
{
  if (a3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
    if (Value)
    {
      CFDataRef v4 = Value;
      unsigned __int16 v9 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v4);
      int v7 = sub_226869794(BytePtr, (unint64_t)&BytePtr[Length], 0, &v9);
      LOBYTE(Value) = 0;
      if (!v7) {
        LODWORD(Value) = (v9 >> 3) & 1;
      }
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsAudioDevice:(id)a3
{
  if (a3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
    if (Value)
    {
      CFDataRef v5 = Value;
      unsigned __int16 v10 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v5);
      if (sub_226869794(BytePtr, (unint64_t)&BytePtr[Length], 0, &v10)) {
        LOBYTE(Value) = objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, v8, (uint64_t)a3, 0);
      }
      else {
        LODWORD(Value) = (v10 >> 11) & 1;
      }
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsSTAOnly:(id)a3
{
  if (a3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
    if (Value)
    {
      CFDataRef v5 = Value;
      unsigned __int16 v11 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v5);
      if (sub_226869794(BytePtr, (unint64_t)&BytePtr[Length], 0, &v11))
      {
        if (objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v8, (uint64_t)a3)) {
          LOBYTE(Value) = 1;
        }
        else {
          LOBYTE(Value) = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v9, (uint64_t)a3);
        }
      }
      else
      {
        LODWORD(Value) = (v11 >> 7) & 1;
      }
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoSupportsMFIConfigV1:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 2);
}

+ (BOOL)scanInfoSupportsSpruce:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 17);
}

+ (BOOL)scanInfoSupportsACPConfigV1:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 12);
}

+ (BOOL)scanInfoSupportsSecureWAC:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 20);
}

+ (BOOL)scanInfoSupportsSoftwareTokenAuth:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 22);
}

+ (BOOL)scanInfoIsMFIAirPlayDevice:(id)a3
{
  int v4 = objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, a2, (uint64_t)a3);
  if (v4)
  {
    LOBYTE(v4) = objc_msgSend_scanInfoIsAirPlayDevice_(WiFiUtils, v5, (uint64_t)a3);
  }
  return v4;
}

+ (BOOL)scanInfoIsWPA3:(id)a3
{
  return sub_2268FBFBC(a3, a2) == 13;
}

+ (BOOL)scanInfoIsHomeKitSecureWAC:(id)a3
{
  int v4 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, a2, (uint64_t)a3);
  if (v4)
  {
    LOBYTE(v4) = objc_msgSend_scanInfoSupportsSecureWAC_(WiFiUtils, v5, (uint64_t)a3);
  }
  return v4;
}

+ (BOOL)scanInfoIsAirPlayDevice:(id)a3
{
  int IsSTAOnly = objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, a2, (uint64_t)a3);
  if (IsSTAOnly)
  {
    LOBYTE(IsSTAOnly) = MEMORY[0x270F9A6D0](WiFiUtils, sel_scanInfoIsAudioDevice_, a3);
  }
  return IsSTAOnly;
}

+ (BOOL)scanInfoIsiAPOverWiFiDevice:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 9);
}

+ (BOOL)scanInfoTestBitFromAppleDeviceIE:(id)a3 forType:(int64_t)a4
{
  if (a3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
    if (Value)
    {
      CFDataRef v6 = Value;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v12 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v6);
      if (!sub_226869708(BytePtr, (unint64_t)&BytePtr[Length], 10502144, &v14, &v12, 0))
      {
        unsigned __int16 v9 = &v14[v12];
        uint64_t v12 = 0;
        int v10 = sub_226869698(v14, (unint64_t)v9, 0, &v13, &v12, 0);
        LOBYTE(Value) = 0;
        if (v10) {
          return (char)Value;
        }
        if (a4 < (unint64_t)(8 * v12))
        {
          LODWORD(Value) = (v13[a4 / 8] >> (~(_BYTE)a4 & 7)) & 1;
          return (char)Value;
        }
      }
      LOBYTE(Value) = 0;
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsInSoftReset:(id)a3
{
  if (a3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IE");
    if (Value)
    {
      CFDataRef v4 = Value;
      unsigned __int16 v9 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v4);
      int v7 = sub_226869794(BytePtr, (unint64_t)&BytePtr[Length], 0, &v9);
      LOBYTE(Value) = 0;
      if (!v7) {
        LODWORD(Value) = (v9 >> 10) & 1;
      }
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIs5GHz:(id)a3
{
  BOOL v3 = objc_msgSend_objectForKey_(a3, a2, @"CHANNEL");
  return objc_msgSend_integerValue(v3, v4, v5) > 14;
}

+ (BOOL)scanInfoIsIBSS:(id)a3
{
  return sub_2268FC1A4((const __CFString *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7) != 0;
}

+ (BOOL)scanInfoIsDWDSCapable:(id)a3 isDWDSEnabled:(BOOL *)a4
{
  if (!a3) {
    return 0;
  }
  unsigned int v11 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);
  BOOL result = 0;
  BOOL v13 = v11 > 3 || v11 == 2;
  if (v13 && v11 != 102)
  {
    if (a4)
    {
      int v17 = 0;
      sub_22686088C((const __CFString *)a3, (uint64_t)&v17, (UInt8 *)"%kO.%kO:int", v6, v7, v8, v9, v10, @"DWDS_IE");
      if (v14) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = v17 == 0;
      }
      BOOL v16 = !v15;
      *a4 = v16;
    }
    return 1;
  }
  return result;
}

+ (BOOL)scanInfoCanJoin2_4GHzNetworks:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 14);
}

+ (BOOL)scanInfoCanJoin5GHzNetworks:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 15);
}

+ (BOOL)scanInfoCanJoinWPA3Networks:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 27);
}

- (int)joinNetworkWithScanInfoAsync:(id)a3 password:(id)a4 rememberChoice:(int)a5
{
  char v32 = 0;
  if (!a3)
  {
    int v11 = -6705;
LABEL_7:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v11;
  }
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3))
  {
    int v11 = -6735;
    goto LABEL_7;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0)) {
    return -6721;
  }
  if (objc_msgSend_length(a4, v9, v10)) {
    id v14 = a4;
  }
  else {
    id v14 = 0;
  }
  if (!v14
    && objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, v13, (uint64_t)a3, 0, &v32)&& !v32)
  {
    int v11 = -16;
    goto LABEL_7;
  }
  BOOL v15 = NSDictionary;
  objc_msgSend_numberWithInteger_(NSNumber, v13, a5);
  uint64_t v17 = objc_msgSend_dictionaryWithObjectsAndKeys_(v15, v16, (uint64_t)a3);
  if (!v17)
  {
    int v11 = -6728;
    goto LABEL_7;
  }
  uint64_t v18 = v17;
  id v19 = objc_allocWithZone(MEMORY[0x263F08B88]);
  id v21 = (id)objc_msgSend_initWithTarget_selector_object_(v19, v20, (uint64_t)self, sel_joinNetworkWithScanInfoThread_, v18);
  objc_msgSend_start(v21, v22, v23);
  if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils joinNetworkWithScanInfoAsync:password:rememberChoice:]", 800, (uint64_t)"starting Join thread\n", v26, v27, v28, v29, @"JoinParam_ScanInfo");
  }
  uint64_t v30 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v24, v25);
  objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v30, v31, @"com.apple.WiFiUtils.Join.Start", self, a3, 0);
  return 0;
}

- (int)joinNetworkWithNameAsync:(id)a3 password:(id)a4 rememberChoice:(int)a5
{
  if (!a3)
  {
    int v9 = -6705;
LABEL_7:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v9;
  }
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3))
  {
    int v9 = -6735;
    goto LABEL_7;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0)) {
    return -6721;
  }
  int v11 = NSDictionary;
  objc_msgSend_numberWithInteger_(NSNumber, v8, a5);
  uint64_t v13 = objc_msgSend_dictionaryWithObjectsAndKeys_(v11, v12, (uint64_t)a3);
  if (!v13)
  {
    int v9 = -6728;
    goto LABEL_7;
  }
  uint64_t v14 = v13;
  id v15 = objc_allocWithZone(MEMORY[0x263F08B88]);
  id v17 = (id)objc_msgSend_initWithTarget_selector_object_(v15, v16, (uint64_t)self, sel_joinNetworkWithNameThread_, v14);
  objc_msgSend_start(v17, v18, v19);
  if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils joinNetworkWithNameAsync:password:rememberChoice:]", 800, (uint64_t)"starting Join (with name) thread\n", v22, v23, v24, v25, @"JoinParam_Name");
  }
  uint64_t v26 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v20, v21);
  objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v26, v27, @"com.apple.WiFiUtils.Join.Start", self, 0, 0);
  return 0;
}

- (int)disassociateSync
{
  if (!objc_msgSend_airPortIsOn(self, a2, v2))
  {
    int v12 = -6735;
    goto LABEL_5;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0)) {
    return -6721;
  }
  wifiShim = self->_wifiShim;
  if (!wifiShim)
  {
    int v12 = -6718;
    goto LABEL_5;
  }
  int v12 = sub_2268FD518((uint64_t)wifiShim, v4, v5, v6, v7, v8, v9, v10);
  int result = -6721;
  if (v12 != -6721)
  {
LABEL_5:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v12;
  }
  return result;
}

- (int)clearScanCacheSync
{
  if (!objc_msgSend_airPortIsOn(self, a2, v2))
  {
    int v12 = -6735;
    goto LABEL_5;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0)) {
    return -6721;
  }
  wifiShim = self->_wifiShim;
  if (!wifiShim)
  {
    int v12 = -6718;
    goto LABEL_5;
  }
  int v12 = sub_2268FC910((uint64_t)wifiShim, v4, v5, v6, v7, v8, v9, v10);
  int result = -6721;
  if (v12 != -6721)
  {
LABEL_5:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v12;
  }
  return result;
}

- (id)getCurrentAssociationInfo
{
  id v11 = 0;
  id result = self->_wifiShim;
  if (result)
  {
    int v9 = sub_2268FCCE0((uint64_t)result, &v11, v2, v3, v4, v5, v6, v7);
    id result = v11;
    if (!v9)
    {
      if (v11)
      {
        id v10 = v11;
        return v11;
      }
    }
  }
  return result;
}

- (id)getCurrentAssociationInfoOrNil
{
  if (!objc_msgSend_airPortIsOn(self, a2, v2)) {
    return 0;
  }

  return (id)objc_msgSend_getCurrentAssociationInfo(self, v4, v5);
}

- (id)getCurrentAssociationScanInfo
{
  CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(self, a2, v2);
  id result = (id)objc_msgSend_objectForKey_(CurrentAssociationInfo, v5, @"BSSID");
  if (result)
  {
    return (id)objc_msgSend_scanInfoForMACAddress_(self, v7, (uint64_t)result);
  }
  return result;
}

- (id)getIfList
{
  id v11 = 0;
  id result = self->_wifiShim;
  if (result)
  {
    int v9 = sub_2268FDB7C((uint64_t)result, (uint64_t *)&v11, v2, v3, v4, v5, v6, v7);
    id result = v11;
    if (!v9)
    {
      if (v11)
      {
        id v10 = v11;
        return v11;
      }
    }
  }
  return result;
}

- (id)getLinkStatus
{
  id v6 = 0;
  id result = self->_wifiShim;
  if (result)
  {
    sub_2268FBD90((CFArrayRef *)result, (char *)&v6);
    int v4 = v3;
    id result = v6;
    if (!v4)
    {
      if (v6)
      {
        id v5 = v6;
        return v6;
      }
    }
  }
  return result;
}

- (int)setAutoJoinState:(BOOL)a3
{
  wifiShim = self->_wifiShim;
  if (wifiShim) {
    return sub_2268FD268((uint64_t)wifiShim, a3, a3, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (BOOL)getAutoJoinState
{
  wifiShim = self->_wifiShim;
  if (wifiShim)
  {
    BOOL v5 = 0;
    int v3 = sub_2268FDD48((uint64_t)wifiShim, &v5);
    LOBYTE(wifiShim) = 0;
    if (!v3) {
      LOBYTE(wifiShim) = v5;
    }
  }
  return (char)wifiShim;
}

+ (id)getNetworkPassword:(id)a3
{
  id v10 = 0;
  if (!a3) {
    return 0;
  }
  sub_2268FDD94((uint64_t)a3, (const __CFString **)&v10, (uint64_t)a3, v3, v4, v5, v6, v7);
  id v8 = v10;
  return v10;
}

- (BOOL)isCurrentlyAssociatedToAnInfrastructureNetwork:(BOOL *)a3
{
  CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(self, a2, (uint64_t)a3);
  if (CurrentAssociationInfo)
  {
    uint64_t v7 = CurrentAssociationInfo;
    id v8 = objc_msgSend_objectForKey_(CurrentAssociationInfo, v6, @"STATE");
    if (objc_msgSend_integerValue(v8, v9, v10) == 4
      && (int v12 = objc_msgSend_objectForKey_(v7, v11, @"AP_MODE"),
          objc_msgSend_integerValue(v12, v13, v14) == 2))
    {
      if (a3)
      {
        *a3 = 0;
        uint64_t CurrentAssociationScanInfo = objc_msgSend_getCurrentAssociationScanInfo(self, v15, v16);
        if (CurrentAssociationScanInfo) {
          *a3 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v18, CurrentAssociationScanInfo) != 0;
        }
      }
      LOBYTE(CurrentAssociationInfo) = 1;
    }
    else
    {
      LOBYTE(CurrentAssociationInfo) = 0;
    }
  }
  return (char)CurrentAssociationInfo;
}

+ (BOOL)networkIsSecure:(id)a3 secMode:(int *)a4 isEnterprise:(BOOL *)a5
{
  int v7 = sub_2268FBFBC(a3, a2);
  if (a4) {
    *a4 = v7;
  }
  if (a5) {
    *a5 = (v7 - 9) < 4;
  }
  return v7 != 1;
}

+ (BOOL)networkIsApple:(id)a3 productID:(unsigned int *)a4
{
  unsigned int v5 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);
  if (a4) {
    *a4 = v5;
  }
  return v5 != 0;
}

- (id)getPreferredNetworks:(BOOL)a3
{
  id v11 = 0;
  id result = self->_wifiShim;
  if (result)
  {
    int v9 = sub_2268FC9B8(result, (const char *)a3, &v11, v3, v4, v5, v6, v7);
    id result = v11;
    if (!v9)
    {
      if (v11)
      {
        id v10 = v11;
        return v11;
      }
    }
  }
  return result;
}

+ (id)copyFilteredNetworks:(id)a3 ignoreOptions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v6, (uint64_t)&v15, v19, 16);
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(a3);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ((objc_msgSend_network_shouldBeIgnored_(WiFiUtils, v9, v13, v4) & 1) == 0) {
            objc_msgSend_addObject_(v7, v9, v13);
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v15, v19, 16);
      }
      while (v10);
    }
  }
  return v7;
}

+ (BOOL)network:(id)a3 shouldBeIgnored:(int)a4
{
  __int16 v4 = a4;
  if ((a4 & 1) != 0 && !objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this non-Apple network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 2) != 0 && objc_msgSend_scanInfoIsIBSS_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this IBSS network:%@ (%@)\n";
LABEL_60:
    uint64_t v10 = objc_msgSend_objectForKey_(a3, a2, @"SSID_STR");
    objc_msgSend_objectForKey_(a3, v11, @"BSSID");
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"+[WiFiUtils network:shouldBeIgnored:]", 800, (uint64_t)v6, v12, v13, v14, v15, v10);
    return 1;
  }
  if ((v4 & 0x20) != 0 && objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this unconfigured network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 0x40) != 0 && objc_msgSend_scanInfoIsGuestNetwork_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this guest network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 0x80) != 0
    && (objc_msgSend_scanInfoIsDWDSCapable_isDWDSEnabled_(WiFiUtils, a2, (uint64_t)a3, 0) & 1) == 0)
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this DWDS Incapable network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 0x100) != 0 && objc_msgSend_scanInfoIs5GHz_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this 5GHz network:%@ (%@)\n";
    goto LABEL_60;
  }
  unsigned int v7 = sub_2268FBFBC(a3, a2);
  if (v7 == 1)
  {
    if ((v4 & 0x10) == 0) {
      return 0;
    }
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this unsecured network:%@ (%@)\n";
    goto LABEL_60;
  }
  unsigned int v9 = v7;
  if ((v4 & 4) != 0 && v7 - 9 <= 3)
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this Enterprise network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 8) != 0 && v7 <= 0xB && ((1 << v7) & 0xB5C) != 0 || (BOOL result = 0, (v4 & 0x200) != 0) && v9 == 13)
  {
    if (dword_268146700 > 800 || dword_268146700 == -1 && !sub_226865630((uint64_t)&dword_268146700, 0x320u)) {
      return 1;
    }
    uint64_t v6 = "Ignoring this legacy Sec Mode network:%@ (%@)\n";
    goto LABEL_60;
  }
  return result;
}

+ (int)barsForRSSI:(int)a3
{
  int v3 = a3 - 100;
  if (a3 < 0) {
    int v3 = a3;
  }
  if (v3 < -99) {
    return 0;
  }
  uint64_t v5 = 0;
  while (v5 != 3)
  {
    int result = v5 + 1;
    int v6 = dword_226913040[++v5];
    if (v3 < v6) {
      return result;
    }
  }
  return 4;
}

- (id)getNetworkPasswordForNetworkNamed:(id)a3
{
  int v3 = objc_msgSend_scanInfoForName_wifiType_(self, a2, (uint64_t)a3, 3);
  id result = (id)objc_msgSend_count(v3, v4, v5);
  if (result)
  {
    return (id)objc_msgSend_getNetworkPassword_(WiFiUtils, v7, (uint64_t)v3);
  }
  return result;
}

- (int)_asyncWiFiScan:(id)a3 wifiType:(int)a4 merge:(BOOL)a5 maxAge:(unint64_t)a6 isPeriodic:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3))
  {
    int v14 = -6735;
LABEL_5:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v14;
  }
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0))
  {
    long long v16 = NSDictionary;
    uint64_t v17 = objc_msgSend_numberWithInteger_(NSNumber, v13, a4);
    uint64_t v19 = objc_msgSend_numberWithBool_(NSNumber, v18, v7);
    uint64_t v21 = objc_msgSend_numberWithInteger_(NSNumber, v20, a6);
    uint64_t v23 = objc_msgSend_numberWithBool_(NSNumber, v22, v9);
    uint64_t v25 = objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v24, v17, @"ScanParam_WiFiType", v19, @"ScanParam_IsPeriodic", v21, @"ScanParam_MaxAge", v23, @"ScanParam_MergeResults", a3, @"ScanParam_Name", 0);
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = objc_allocWithZone(MEMORY[0x263F08B88]);
      id v29 = (id)objc_msgSend_initWithTarget_selector_object_(v27, v28, (uint64_t)self, sel_asyncWiFiScanThread_, v26);
      objc_msgSend_start(v29, v30, v31);
      return 0;
    }
    int v14 = -6728;
    goto LABEL_5;
  }
  return -6721;
}

- (int)asyncWiFiScan:(id)a3 wifiType:(int)a4 merge:(BOOL)a5 maxAge:(unint64_t)a6
{
  return objc_msgSend__asyncWiFiScan_wifiType_merge_maxAge_isPeriodic_(self, a2, (uint64_t)a3, *(void *)&a4, a5, a6, 0);
}

- (int)openWiFi
{
  p_wifiShim = &self->_wifiShim;
  int result = sub_2268FC608(&self->_wifiShim, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (!result)
  {
    if (*p_wifiShim) {
      return 0;
    }
    else {
      return -6728;
    }
  }
  return result;
}

- (int)closeWiFi
{
  wifiShim = self->_wifiShim;
  if (!wifiShim) {
    return -6718;
  }
  int result = sub_2268FC734((uint64_t)wifiShim, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  self->_wifiShim = 0;
  return result;
}

- (void)scanTimerCallback:(id)a3
{
  if (self->_scanOnlyWhenAppActive)
  {
    uint64_t v5 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], a2, (uint64_t)a3);
    BOOL v8 = objc_msgSend_applicationState(v5, v6, v7) == 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3);
  if (self->_scanningActive && v8)
  {
    if (objc_msgSend_airPortIsOn(self, v9, v10))
    {
      uint64_t v18 = objc_msgSend_periodicScanType(self, v12, v13);
      if (objc_msgSend__asyncWiFiScan_wifiType_merge_maxAge_isPeriodic_(self, v19, 0, v18, 0, 0, 1))
      {
        uint64_t v22 = (void *)MEMORY[0x263EFF910];
        objc_msgSend_periodicScanInterval(self, v20, v21);
        uint64_t v25 = objc_msgSend_dateWithTimeIntervalSinceNow_(v22, v23, v24);
        objc_msgSend_setFireDate_(a3, v26, v25);
      }
    }
  }
  else
  {
    uint64_t v27 = objc_msgSend_distantFuture(MEMORY[0x263EFF910], v9, v10);
    objc_msgSend_setFireDate_(a3, v28, v27);
    objc_msgSend_activateScanning_(self, v29, 0);
  }
  if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils scanTimerCallback:]", 800, (uint64_t)"_scanOnlyWhenAppActive: %d scanRightNow: %d airPortIsOn: %d asyncWiFiScan err: %d\n", v14, v15, v16, v17, self->_scanOnlyWhenAppActive);
  }
}

- (void)triggerScan
{
  if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils triggerScan]", 800, (uint64_t)"_scanningActive: %d\n", v3, v4, v5, v6, self->_scanningActive);
  }
  if (self->_scanningActive)
  {
    scanTimer = self->_scanTimer;
    uint64_t v10 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2);
    objc_msgSend_setFireDate_(scanTimer, v9, v10);
  }
}

- (void)setScanInProgress:(BOOL)a3
{
  objc_sync_enter(self);
  self->_BOOL scanInProgress = a3;

  objc_sync_exit(self);
}

- (void)setJoinInProgress:(BOOL)a3
{
  objc_sync_enter(self);
  self->_BOOL joinInProgress = a3;

  objc_sync_exit(self);
}

- (void)joinNetworkWithScanInfoThread:(id)a3
{
  id v28 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (a3
    && (uint64_t v7 = objc_msgSend_objectForKey_(a3, v5, @"JoinParam_ScanInfo")) != 0
    && (uint64_t v8 = v7, (v9 = objc_msgSend_objectForKey_(a3, v5, @"JoinParam_RememberChoice")) != 0))
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = objc_msgSend_objectForKey_(a3, v5, @"JoinParam_Password");
    objc_msgSend_setJoinInProgress_(self, v12, 1);
    uint64_t v15 = objc_msgSend_integerValue(v10, v13, v14);
    uint64_t v17 = (int)objc_msgSend_joinNetworkWithScanInfoSync_password_rememberChoice_(self, v16, v8, v11, v15);
  }
  else
  {
    uint64_t v17 = -6705;
  }
  if (objc_msgSend_isJoinInProgress(self, v5, v6))
  {
    objc_msgSend_setJoinInProgress_(self, v18, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    uint64_t v21 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v19, v20);
    uint64_t v22 = NSDictionary;
    uint64_t v24 = objc_msgSend_numberWithInteger_(NSNumber, v23, v17);
    uint64_t v26 = objc_msgSend_dictionaryWithObject_forKey_(v22, v25, v24, @"WiFiUtils_OSStatus");
    objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v21, v27, @"com.apple.WiFiUtils.Join.Complete", self, v26, 0);
  }
}

- (void)joinNetworkWithNameThread:(id)a3
{
  id v30 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (a3
    && (uint64_t v7 = objc_msgSend_objectForKey_(a3, v5, @"JoinParam_Name")) != 0
    && (uint64_t v8 = (const char *)v7, (v9 = objc_msgSend_objectForKey_(a3, v5, @"JoinParam_RememberChoice")) != 0))
  {
    uint64_t v10 = (void *)v9;
    CFStringRef v11 = (const __CFString *)objc_msgSend_objectForKey_(a3, v5, @"JoinParam_Password");
    objc_msgSend_setJoinInProgress_(self, v12, 1);
    wifiShim = self->_wifiShim;
    uint64_t v16 = objc_msgSend_integerValue(v10, v14, v15);
    uint64_t v19 = (int)sub_2268FBE10((uint64_t)wifiShim, v8, v11, 3, v16, 0, v17, v18);
  }
  else
  {
    uint64_t v19 = -6705;
  }
  if (objc_msgSend_isJoinInProgress(self, v5, v6))
  {
    objc_msgSend_setJoinInProgress_(self, v20, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    uint64_t v23 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v21, v22);
    uint64_t v24 = NSDictionary;
    uint64_t v26 = objc_msgSend_numberWithInteger_(NSNumber, v25, v19);
    uint64_t v28 = objc_msgSend_dictionaryWithObject_forKey_(v24, v27, v26, @"WiFiUtils_OSStatus");
    objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v23, v29, @"com.apple.WiFiUtils.Join.Complete", self, v28, 0);
  }
}

- (int)joinNetworkWithScanInfoSync:(id)a3 password:(id)a4 rememberChoice:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3)) {
    return -6735;
  }
  if (!a3) {
    return -6705;
  }
  wifiShim = self->_wifiShim;
  if (!wifiShim) {
    return -6718;
  }

  return sub_2268FCEC4((uint64_t)wifiShim, (uint64_t)a3, (const __CFString *)a4, v5, v9, v10, v11, v12);
}

- (void)asyncWiFiScanThread:(id)a3
{
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  uint64_t v53 = 0;
  if (self->_wifiShim)
  {
    if (a3)
    {
      uint64_t v8 = (const char *)objc_msgSend_objectForKey_(a3, v5, @"ScanParam_Name");
      uint64_t v10 = objc_msgSend_objectForKey_(a3, v9, @"ScanParam_IsPeriodic");
      uint64_t v12 = objc_msgSend_objectForKey_(a3, v11, @"ScanParam_WiFiType");
      uint64_t v14 = objc_msgSend_objectForKey_(a3, v13, @"ScanParam_MaxAge");
      uint64_t v16 = objc_msgSend_objectForKey_(a3, v15, @"ScanParam_MergeResults");
      objc_msgSend_setScanInProgress_(self, v17, 1);
      wifiShim = self->_wifiShim;
      if (v12) {
        char v21 = objc_msgSend_integerValue(v12, v18, v19);
      }
      else {
        char v21 = 3;
      }
      int v23 = objc_msgSend_BOOLValue(v16, v18, v19);
      uint64_t v26 = objc_msgSend_unsignedIntegerValue(v14, v24, v25);
      uint64_t v22 = sub_2268FD5D8((uint64_t)wifiShim, v8, v21, v23, v26, (uint64_t)&v53, v27, v28);
      if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils asyncWiFiScanThread:]", 800, (uint64_t)"err: %d\n", v29, v30, v31, v32, v22);
      }
      if (!v22)
      {
        uint64_t v6 = v53;
        if (v53) {
          objc_msgSend_mergeScanResults_ageOut_(self, v5, v53, v8 == 0);
        }
        LODWORD(v22) = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
      LODWORD(v22) = -6705;
    }
  }
  else
  {
    uint64_t v10 = 0;
    LODWORD(v22) = -6718;
  }
  if (objc_msgSend_isScanInProgress(self, v5, v6))
  {
    objc_msgSend_setScanInProgress_(self, v33, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    uint64_t v37 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v35, v36);
    v38 = NSDictionary;
    uint64_t v40 = objc_msgSend_numberWithInteger_(NSNumber, v39, (int)v22);
    uint64_t v42 = objc_msgSend_dictionaryWithObjectsAndKeys_(v38, v41, v40, @"WiFiUtils_OSStatus", v53, @"WiFiUtils_ScanInfos", 0);
    objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v37, v43, @"com.apple.WiFiUtils.Scan.Complete", self, v42, 0);
  }
  if (objc_msgSend_BOOLValue(v10, v33, v34))
  {
    double v46 = 1.0;
    if (v22 != 16)
    {
      objc_msgSend_periodicScanInterval(self, v44, v45);
      double v46 = v47;
    }
    v48 = objc_msgSend__scanTimer(self, v44, v45);
    uint64_t v51 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v49, v50, v46);
    objc_msgSend_setFireDate_(v48, v52, v51);
  }
}

+ (BOOL)stringArray:(id)a3 containsBSSID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v12, v16, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        if (sub_2268A1408(*(const __CFString **)(*((void *)&v12 + 1) + 8 * v9), (const __CFString *)a4))
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v10, (uint64_t)&v12, v16, 16);
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (void)mergeScanResults:(id)a3 ageOut:(BOOL)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v54 = a4;
    uint64_t v6 = objc_msgSend_unmergedScanInfoDict(self, a2, (uint64_t)a3);
    id v9 = (id)objc_msgSend_mutableCopy(v6, v7, v8);
    uint64_t v10 = (void *)MEMORY[0x263EFF980];
    id v55 = v9;
    uint64_t v13 = objc_msgSend_allKeys(v9, v11, v12);
    long long v15 = objc_msgSend_arrayWithArray_(v10, v14, v13);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v16, (uint64_t)&v60, v65, 16);
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v61 != v20) {
            objc_enumerationMutation(a3);
          }
          uint64_t v22 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend_objectForKey_(v22, v18, @"BSSID");
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = objc_msgSend_indexOfObject_(v15, v18, v23);
            if (v25 != 0x7FFFFFFFFFFFFFFFLL) {
              objc_msgSend_removeObjectAtIndex_(v15, v26, v25);
            }
            objc_msgSend_setObject_forKey_(v55, v26, (uint64_t)v22, v24);
            objc_msgSend_removeObjectForKey_(self->_missingBSSIDCounts, v27, v24);
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v18, (uint64_t)&v60, v65, 16);
      }
      while (v19);
    }
    if (v54)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v56, v64, 16);
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v57 != v30) {
              objc_enumerationMutation(v15);
            }
            uint64_t v32 = *(void *)(*((void *)&v56 + 1) + 8 * j);
            uint64_t v33 = objc_msgSend_objectForKey_(self->_missingBSSIDCounts, v18, v32);
            if (v33 && (uint64_t v33 = objc_msgSend_integerValue((void *)v33, v34, v35), v33 > 1))
            {
              if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u)))
              {
                double v46 = objc_msgSend_objectForKey_(v55, v34, v32);
                uint64_t v48 = objc_msgSend_objectForKey_(v46, v47, @"SSID_STR");
                sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils mergeScanResults:ageOut:]", 800, (uint64_t)"Network: %@ is GONE\n", v49, v50, v51, v52, v48);
              }
              objc_msgSend_removeObjectForKey_(v55, v34, v32);
              objc_msgSend_removeObjectForKey_(self->_missingBSSIDCounts, v53, v32);
            }
            else
            {
              missingBSSIDCounts = self->_missingBSSIDCounts;
              uint64_t v37 = objc_msgSend_numberWithInteger_(NSNumber, v34, v33 + 1);
              objc_msgSend_setObject_forKey_(missingBSSIDCounts, v38, v37, v32);
              if (dword_268146700 <= 800 && (dword_268146700 != -1 || sub_226865630((uint64_t)&dword_268146700, 0x320u)))
              {
                v39 = objc_msgSend_objectForKey_(v55, v18, v32);
                uint64_t v41 = objc_msgSend_objectForKey_(v39, v40, @"SSID_STR");
                sub_226865EB4((uint64_t)&dword_268146700, (uint64_t)"-[WiFiUtils mergeScanResults:ageOut:]", 800, (uint64_t)"Network: %@ is %ld scan(s) old\n", v42, v43, v44, v45, v41);
              }
            }
          }
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v56, v64, 16);
        }
        while (v29);
      }
    }
    objc_msgSend_setUnmergedScanInfoDict_(self, v18, (uint64_t)v55);
  }
}

- (id)unmergedScanInfoDict
{
  objc_sync_enter(self);
  uint64_t v3 = self->_unmergedScanInfoDict;
  objc_sync_exit(self);
  return v3;
}

- (void)setUnmergedScanInfoDict:(id)a3
{
  objc_sync_enter(self);
  if (self->_unmergedScanInfoDict != a3)
  {
    id v5 = a3;

    self->_unmergedScanInfoDict = (NSDictionary *)a3;
  }

  objc_sync_exit(self);
}

- (NSTimer)_scanTimer
{
  return self->_scanTimer;
}

- (void)set_scanTimer:(id)a3
{
}

- (int)periodicScanType
{
  return self->_periodicScanType;
}

- (void)setPeriodicScanType:(int)a3
{
  self->_periodicScanType = a3;
}

- (double)periodicScanInterval
{
  return self->_periodicScanInterval;
}

- (void)setPeriodicScanInterval:(double)a3
{
  self->_periodicScanInterval = a3;
}

@end