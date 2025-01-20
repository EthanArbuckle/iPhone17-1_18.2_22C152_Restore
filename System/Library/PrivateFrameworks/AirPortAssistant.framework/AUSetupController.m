@interface AUSetupController
+ (id)setupController;
+ (void)initialize;
- (AUSetupController)init;
- (BOOL)activeTask;
- (BOOL)dirty;
- (BOOL)hasACPFeature:(unsigned int)a3;
- (BOOL)isMonitoring;
- (BOOL)performingManualRead;
- (BOOL)rememberBasePassword;
- (BOOL)rememberDiskPassword;
- (BOOL)rememberWiFiPassword;
- (BOOL)snapshotDirty;
- (NSDate)lastHeardFromDevice;
- (NSDictionary)bonjourRecord;
- (NSDictionary)lastInstrumentation;
- (NSMutableSet)setupDelegates;
- (NSString)autoGuessSetupRecommendation;
- (NSString)keychainBasePassword;
- (NSString)keychainDiskPassword;
- (NSString)keychainWiFiPassword;
- (NSString)lastDNSName;
- (NSString)lastSystemName;
- (SetupUIConfigDelegate)uiConfigDelegate;
- (_BaseStation)bsRef;
- (id)allKeychainMACAddresses;
- (id)bestKeychainMACAddress;
- (id)context;
- (id)snapshotChangedKeys;
- (id)targetBaseInfoDict;
- (id)validateAllSettingsAndGetErrors;
- (id)validateSettingsAndGetErrors:(id)a3;
- (int)busyState;
- (int)cancelSetup;
- (int)cancelTask;
- (int)closeAllConnections;
- (int)closeAllConnections:(BOOL)a3;
- (int)copyValue:(id *)a3 forBSSetting:(int)a4;
- (int)copyValue:(id *)a3 forSettingPath:(id)a4;
- (int)getValue:(id *)a3 forBSSetting:(int)a4;
- (int)getValue:(id *)a3 forSettingPath:(id)a4;
- (int)ignoreProblemCode:(unsigned int)a3;
- (int)joinAndBrowseAsync;
- (int)joinAsync;
- (int)readAllPropertiesFromBaseAsync;
- (int)readPropertyListFromBaseAsync:(id)a3;
- (int)rpcDisconnectAllDiskUsersWithMessageAsync:(id)a3;
- (int)rpcRefreshBSSettingAsync:(int)a3;
- (int)rpcRenewDHCPLeaseAsync;
- (int)rpcStartRemoteBrowse:(id)a3 withService:(id)a4;
- (int)rpcSystemInterfacesAsync;
- (int)rpcWPSAllowClientAsync:(id)a3;
- (int)rpcWPSStartAsync:(BOOL)a3 dayPass:(BOOL)a4 timeout:(unsigned int)a5;
- (int)rpcWPSStopAsync;
- (int)setMonitorForChanges:(BOOL)a3;
- (int)setValue:(id)a3 forBSSetting:(int)a4;
- (int)setValue:(id)a3 forSettingPath:(id)a4;
- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4;
- (int)setupWithTargetBaseStation:(id)a3 andSettings:(id)a4;
- (int)setupWithTargetNetwork:(id)a3;
- (int)snapshotPop:(BOOL)a3;
- (int)snapshotPush;
- (int)stateForProblem:(unsigned int)a3;
- (int)subclassAssistantCallback:(AssistantCallbackContext *)a3;
- (int)taskArchiveDiskAsync:(id)a3;
- (int)taskEraseDiskAsync:(id)a3;
- (int)taskRestartAsync;
- (int)taskRestoreDefaultsAsync:(BOOL)a3;
- (int)taskState;
- (int)taskUploadFirmwareAsync:(id)a3;
- (int)unIgnoreProblemCode:(unsigned int)a3;
- (int)updateKeychainWithPasswords;
- (int)updateKeychainWithPasswordsWithStatus:(int)a3;
- (int)updateSettingsAsync;
- (int64_t)ethernetPortCount;
- (int64_t)unignoredProblemCount;
- (unsigned)taskCode;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)dealloc;
- (void)deleteKeychainBasePassword;
- (void)deleteKeychainWirelessPassword;
- (void)handleBusyComplete;
- (void)handleBusyStart;
- (void)handleSetupComplete:(int)a3;
- (void)handleTaskComplete;
- (void)loadKeychainBasePassword;
- (void)loadKeychainWirelessPassword;
- (void)logChangesToCCL;
- (void)resetWiFiState;
- (void)saveKeychainBasePassword;
- (void)setActiveTask:(BOOL)a3;
- (void)setAutoGuessSetupRecommendation:(id)a3;
- (void)setBonjourRecord:(id)a3;
- (void)setContext:(id)a3;
- (void)setKeychainBasePassword:(id)a3;
- (void)setKeychainDiskPassword:(id)a3;
- (void)setKeychainWiFiPassword:(id)a3;
- (void)setLastDNSName:(id)a3;
- (void)setLastInstrumentation:(id)a3;
- (void)setLastSystemName:(id)a3;
- (void)setRememberBasePassword:(BOOL)a3;
- (void)setRememberDiskPassword:(BOOL)a3;
- (void)setRememberWiFiPassword:(BOOL)a3;
- (void)setUiConfigDelegate:(id)a3;
- (void)setupUIConfigResult:(int)a3 withOptions:(id)a4;
- (void)setupWiFiState;
- (void)snapshotResetAll;
- (void)updateLastHeardFromDevice;
- (void)updateRememberKeychainFlagsButSkipBasePassword:(BOOL)a3;
- (void)updateRememberKeychainFlagsIfInitializing;
@end

@implementation AUSetupController

+ (void)initialize
{
  if (qword_2681482B8 != -1) {
    dispatch_once(&qword_2681482B8, &unk_26DA6B198);
  }
}

- (AUSetupController)init
{
  v33.receiver = self;
  v33.super_class = (Class)AUSetupController;
  id v6 = [(AssistantCallbackController *)&v33 init];
  if (v6)
  {
    *((void *)v6 + 7) = objc_alloc_init(MEMORY[0x263EFF9C0]);
    sub_2268AE340((uint64_t *)v6 + 5, v7, v8, v9, v10, v11, v12, v13);
    sub_2268AE8B0(*((void *)v6 + 5), (uint64_t)sub_226875560, (uint64_t)v6, v14, v15, v16, v17, v18);
    uint64_t v19 = *((void *)v6 + 5);
    uint64_t v22 = objc_msgSend_assistantCallback(v6, v20, v21);
    sub_2268AE974(v19, v22, (uint64_t)v6, v23, v24, v25, v26, v27);
    *((unsigned char *)v6 + 88) = 1;
    v30 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v28, v29);
    objc_msgSend_addObserver_selector_name_object_(v30, v31, (uint64_t)v6, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x263F1D050], 0);
  }
  if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController init]", 800, (uint64_t)"\n", v2, v3, v4, v5, (uint64_t)v33.receiver);
  }
  return (AUSetupController *)v6;
}

- (void)dealloc
{
  objc_msgSend_closeAllConnections_(self, a2, 1);
  objc_msgSend_setLastDNSName_(self, v3, 0);
  objc_msgSend_setLastSystemName_(self, v4, 0);
  objc_msgSend_setAutoGuessSetupRecommendation_(self, v5, 0);
  objc_msgSend_setLastInstrumentation_(self, v6, 0);

  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v7, v8);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, *MEMORY[0x263F1D050], 0);
  v11.receiver = self;
  v11.super_class = (Class)AUSetupController;
  [(AssistantCallbackController *)&v11 dealloc];
}

- (int)closeAllConnections:(BOOL)a3
{
  int v7 = a3;
  if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController closeAllConnections:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v25);
  }
  if (!objc_msgSend_activeTask(self, a2, a3) || v7)
  {
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x263F8C6D0], v9, (uint64_t)self, sel_handleCopyAllSettingsUpdateThread_, 0);
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x263F8C6D0], v10, (uint64_t)self, sel_handleSettingsUpdate_, 0);

    self->_setupDelegates = 0;
    objc_sync_enter(self);
    configContext = self->_configContext;
    if (configContext)
    {
      sub_2268AE8B0((uint64_t)configContext, 0, 0, v11, v12, v13, v14, v15);
      int v7 = sub_2268AE470((uint64_t)self->_configContext, v17, v18, v19, v20, v21, v22, v23);
      self->_configContext = 0;
    }
    else
    {
      int v7 = 0;
    }
    objc_sync_exit(self);

    self->_lastHeardFromDevice = 0;
  }
  return v7;
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
}

- (int)closeAllConnections
{
  return objc_msgSend_closeAllConnections_(self, a2, 0);
}

- (int)subclassAssistantCallback:(AssistantCallbackContext *)a3
{
  if (!a3)
  {
    LODWORD(v13) = -6705;
    return v13;
  }
  uint64_t v52 = 0;
  v53 = 0;
  sub_2268DCEEC((uint64_t)a3, @"kBSAssistantCallback_Configuration_UIConfigSelector", &v53, v3, v4, v5, v6, v7);
  int v12 = v13;
  LODWORD(v13) = 0;
  if (!v12 && v53)
  {
    uint64_t v14 = objc_msgSend_integerValue(v53, v10, v11);
    if (sub_2268DD020((uint64_t)a3, @"kBSAssistantCallback_Configuration_UIConfigParamDict"))
    {
      sub_2268DCEEC((uint64_t)a3, @"kBSAssistantCallback_Configuration_UIConfigParamDict", &v52, v17, v18, v19, v20, v21);
      if (v13) {
        return v13;
      }
      if (!v52) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v52 = 0;
    }
    if ((v14 - 1) >= 6)
    {
      if ((v14 - 7) >= 2)
      {
        LODWORD(v13) = -6705;
        return v13;
      }
      if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController subclassAssistantCallback:]", 800, (uint64_t)"selector: %d paramDict: %@\n", v18, v19, v20, v21, v14);
      }
      uint64_t v13 = objc_msgSend_uiConfigDelegate(self, v15, v16);
      if (v13)
      {
        objc_msgSend_uiConfigDelegate(self, v43, v44);
        if (objc_opt_respondsToSelector())
        {
          callbackContext = self->super._callbackContext;
          if (callbackContext) {
            BOOL v48 = callbackContext == a3;
          }
          else {
            BOOL v48 = 1;
          }
          if (!v48) {
            goto LABEL_43;
          }
          self->super._callbackContext = a3;
          v49 = objc_msgSend_uiConfigDelegate(self, v45, v46);
          objc_msgSend_setupUIConfigPrompt_paramDict_forController_(v49, v50, v14, v52, self);
        }
LABEL_42:
        LODWORD(v13) = 0;
      }
    }
    else
    {
      sub_2268DCEEC((uint64_t)a3, @"kBSAssistantCallback_Configuration_UIConfigConnectionStatusOSStatus", &v53, v17, v18, v19, v20, v21);
      if (!v13)
      {
        if (!v53)
        {
LABEL_38:
          LODWORD(v13) = -6728;
          return v13;
        }
        uint64_t v30 = objc_msgSend_integerValue(v53, v22, v23);
        if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController subclassAssistantCallback:]", 800, (uint64_t)"selector: %d status: %ld paramDict: %@\n", v26, v27, v28, v29, v14);
        }
        if (!objc_msgSend_uiConfigDelegate(self, v24, v25)
          || (objc_msgSend_uiConfigDelegate(self, v31, v32), (objc_opt_respondsToSelector() & 1) == 0))
        {
          if (v30) {
            sub_2268DD134(a3, -6757, v32, v33, v34, v35, v36, v37);
          }
          goto LABEL_42;
        }
        v39 = self->super._callbackContext;
        if (!v39 || v39 == a3)
        {
          if (v30) {
            v40 = a3;
          }
          else {
            v40 = 0;
          }
          self->super._callbackContext = v40;
          v41 = objc_msgSend_uiConfigDelegate(self, v38, v32);
          objc_msgSend_setupUIConfigConnectionStatusUpdated_status_paramDict_forController_(v41, v42, v14, v30, v52, self);
          goto LABEL_42;
        }
LABEL_43:
        LODWORD(v13) = -6721;
      }
    }
  }
  return v13;
}

+ (id)setupController
{
  uint64_t v2 = objc_alloc_init(AUSetupController);

  return v2;
}

- (int)cancelTask
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268AE78C(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return -6720;
  }
}

- (int)cancelSetup
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268AE640((uint64_t)configContext, 0, v2, v3, v4, v5, v6, v7);
  }
  else {
    return -6720;
  }
}

- (int)setValue:(id)a3 forBSSetting:(int)a4
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  uint64_t v8 = 0;
  int result = sub_2268B0494((uint64_t)configContext, &v8);
  if (!result)
  {
    if (v8) {
      return sub_2268A5444(v8, a4, (const __CFString *)a3);
    }
    else {
      return -6728;
    }
  }
  return result;
}

- (int)copyValue:(id *)a3 forBSSetting:(int)a4
{
  if (!a3) {
    return -6705;
  }
  *a3 = 0;
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  if (!a4) {
    return -6705;
  }
  uint64_t v8 = 0;
  int result = sub_2268B0494((uint64_t)configContext, &v8);
  if (!result)
  {
    if (v8) {
      return sub_2268A55B8(v8, a4, (CFMutableDictionaryRef *)a3);
    }
    else {
      return -6728;
    }
  }
  return result;
}

- (int)getValue:(id *)a3 forBSSetting:(int)a4
{
  int v5 = objc_msgSend_copyValue_forBSSetting_(self, a2, (uint64_t)a3, *(void *)&a4);
  if (!v5) {
    id v6 = *a3;
  }
  return v5;
}

- (int)setValue:(id)a3 forSettingPath:(id)a4
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  uint64_t v12 = 0;
  int result = sub_2268B0494((uint64_t)configContext, &v12);
  if (!result)
  {
    uint64_t v10 = v12;
    if (v12)
    {
      uint64_t v11 = (char *)objc_msgSend_UTF8String(a4, v8, v9);
      return sub_2268A520C(v10, v11, (const __CFString *)a3);
    }
    else
    {
      return -6728;
    }
  }
  return result;
}

- (int)copyValue:(id *)a3 forSettingPath:(id)a4
{
  if (!a3) {
    return -6705;
  }
  *a3 = 0;
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  if (!a4) {
    return -6705;
  }
  uint64_t v12 = 0;
  int result = sub_2268B0494((uint64_t)configContext, &v12);
  if (!result)
  {
    uint64_t v10 = v12;
    if (v12)
    {
      uint64_t v11 = (char *)objc_msgSend_UTF8String(a4, v8, v9);
      return sub_2268A54A8(v10, v11, (CFMutableDictionaryRef *)a3);
    }
    else
    {
      return -6728;
    }
  }
  return result;
}

- (int)getValue:(id *)a3 forSettingPath:(id)a4
{
  int v5 = objc_msgSend_copyValue_forSettingPath_(self, a2, (uint64_t)a3, a4);
  if (!v5) {
    id v6 = *a3;
  }
  return v5;
}

- (BOOL)hasACPFeature:(unsigned int)a3
{
  configContext = self->_configContext;
  if (configContext)
  {
    BOOL v6 = 0;
    if (sub_2268B0494((uint64_t)configContext, &v6))
    {
      LOBYTE(configContext) = 0;
    }
    else
    {
      LOBYTE(configContext) = v6;
      if (v6) {
        LOBYTE(configContext) = sub_2268A58D0(v6, a3);
      }
    }
  }
  return (char)configContext;
}

- (int)stateForProblem:(unsigned int)a3
{
  configContext = self->_configContext;
  if (configContext)
  {
    BOOL v8 = 0;
    BOOL v7 = 0;
    int v5 = sub_2268B0494((uint64_t)configContext, &v8);
    LODWORD(configContext) = 0;
    if (!v5)
    {
      LODWORD(configContext) = v8;
      if (v8)
      {
        LODWORD(configContext) = sub_2268A58D0(v8, 1400460148);
        if (configContext)
        {
          LODWORD(configContext) = sub_2268A5904(v8, a3, &v7);
          if (configContext)
          {
            if (v7) {
              LODWORD(configContext) = 1;
            }
            else {
              LODWORD(configContext) = 2;
            }
          }
        }
      }
    }
  }
  return (int)configContext;
}

- (int64_t)unignoredProblemCount
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  configContext = self->_configContext;
  if (!configContext) {
    return 0;
  }
  CFMutableDictionaryRef v30 = 0;
  uint64_t v31 = 0;
  int64_t v4 = 0;
  if (sub_2268B0494((uint64_t)configContext, &v31)) {
    return v4;
  }
  if (!v31) {
    return 0;
  }
  if (!sub_2268A58D0(v31, 1400460148))
  {
    CFStringRef v29 = 0;
    sub_2268B0914((uint64_t *)self->_configContext, &v29);
    if (v29) {
      return sub_22685B8F0(v29, v17, v18, v19, v20, v21, v22, v23);
    }
    return 0;
  }
  int64_t v4 = 0;
  if (!sub_2268A55B8(v31, 1937331060, &v30) && v30)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    BOOL v6 = objc_msgSend_objectForKey_(v30, v5, @"problems", 0);
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, v32, 16);
    if (v8)
    {
      uint64_t v10 = v8;
      int64_t v4 = 0;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v25 + 1) + 8 * i), v9, @"code");
          uint64_t v15 = sub_22685DD98(v13, v14);
          if (objc_msgSend_stateForProblem_(self, v16, (uint64_t)v15) == 2) {
            ++v4;
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v25, v32, 16);
      }
      while (v10);
    }
    else
    {
      int64_t v4 = 0;
    }
  }
  return v4;
}

- (id)validateAllSettingsAndGetErrors
{
  id v6 = 0;
  id result = self->_configContext;
  if (result)
  {
    BOOL v7 = 0;
    int v3 = sub_2268B0494((uint64_t)result, &v7);
    id result = 0;
    if (!v3)
    {
      id result = v7;
      if (v7)
      {
        int v4 = sub_2268A5D18((uint64_t)v7, (__CFArray **)&v6);
        id result = v6;
        if (v4 != -6727)
        {
          if (v6)
          {
            id v5 = v6;
            return v6;
          }
        }
      }
    }
  }
  return result;
}

- (id)validateSettingsAndGetErrors:(id)a3
{
  id v8 = 0;
  id result = self->_configContext;
  if (result)
  {
    *(void *)uint64_t v9 = 0;
    int v5 = sub_2268B0494((uint64_t)result, v9);
    id result = 0;
    if (!v5)
    {
      id result = *(id *)v9;
      if (*(void *)v9)
      {
        int v6 = sub_2268A59E8(*(uint64_t *)v9, (const __CFString *)a3, (__CFArray **)&v8);
        id result = v8;
        if (v6 != -6727)
        {
          if (v8)
          {
            id v7 = v8;
            return v8;
          }
        }
      }
    }
  }
  return result;
}

- (int)ignoreProblemCode:(unsigned int)a3
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  uint64_t v6 = 0;
  int result = sub_2268B0494((uint64_t)configContext, &v6);
  if (!result)
  {
    if (v6) {
      return sub_2268A5928(v6, a3);
    }
    else {
      return -6728;
    }
  }
  return result;
}

- (int)unIgnoreProblemCode:(unsigned int)a3
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  uint64_t v6 = 0;
  int result = sub_2268B0494((uint64_t)configContext, &v6);
  if (!result)
  {
    if (v6) {
      return sub_2268A593C(v6, a3);
    }
    else {
      return -6728;
    }
  }
  return result;
}

- (NSString)keychainBasePassword
{
  objc_sync_enter(self);
  keychainBasePassword = self->_keychainBasePassword;
  objc_sync_exit(self);
  return keychainBasePassword;
}

- (NSString)keychainWiFiPassword
{
  objc_sync_enter(self);
  keychainWiFiPassword = self->_keychainWiFiPassword;
  objc_sync_exit(self);
  return keychainWiFiPassword;
}

- (NSString)keychainDiskPassword
{
  objc_sync_enter(self);
  keychainDiskPassword = self->_keychainDiskPassword;
  objc_sync_exit(self);
  return keychainDiskPassword;
}

- (void)setKeychainBasePassword:(id)a3
{
  keychainBasePassword = self->_keychainBasePassword;
  if (keychainBasePassword) {
    BOOL v4 = keychainBasePassword == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    objc_sync_enter(self);
    id v7 = a3;

    self->_keychainBasePassword = (NSString *)a3;
    if (objc_msgSend_length(a3, v8, v9))
    {
      uint64_t v12 = objc_msgSend_rememberBasePassword(self, v10, v11);
      objc_msgSend_setRememberBasePassword_(self, v13, v12);
    }
    else
    {
      objc_msgSend_setRememberBasePassword_(self, v10, 0);
    }
    objc_sync_exit(self);
  }
}

- (void)setKeychainWiFiPassword:(id)a3
{
  keychainWiFiPassword = self->_keychainWiFiPassword;
  if (keychainWiFiPassword) {
    BOOL v4 = keychainWiFiPassword == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    objc_sync_enter(self);
    if (objc_msgSend_length(a3, v7, v8)) {
      BOOL v11 = objc_msgSend_length(self->_keychainWiFiPassword, v9, v10) == 0;
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = a3;

    self->_keychainWiFiPassword = (NSString *)a3;
    if (v11)
    {
      objc_msgSend_setRememberWiFiPassword_(self, v13, 1);
    }
    else if (objc_msgSend_length(a3, v13, v14))
    {
      uint64_t v17 = objc_msgSend_rememberWiFiPassword(self, v15, v16);
      objc_msgSend_setRememberWiFiPassword_(self, v18, v17);
    }
    else
    {
      objc_msgSend_setRememberWiFiPassword_(self, v15, 0);
    }
    objc_sync_exit(self);
  }
}

- (void)setKeychainDiskPassword:(id)a3
{
  keychainDiskPassword = self->_keychainDiskPassword;
  if (keychainDiskPassword) {
    BOOL v4 = keychainDiskPassword == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    objc_sync_enter(self);
    id v7 = a3;

    self->_keychainDiskPassword = (NSString *)a3;
    if (objc_msgSend_length(a3, v8, v9))
    {
      uint64_t v12 = objc_msgSend_rememberDiskPassword(self, v10, v11);
      objc_msgSend_setRememberDiskPassword_(self, v13, v12);
    }
    else
    {
      objc_msgSend_setRememberDiskPassword_(self, v10, 0);
    }
    objc_sync_exit(self);
  }
}

- (int)joinAsync
{
  return sub_2268B095C((uint64_t)self->_configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int)joinAndBrowseAsync
{
  return sub_2268B0C04((uint64_t)self->_configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int)readAllPropertiesFromBaseAsync
{
  return MEMORY[0x270F9A6D0](self, sel_readPropertyListFromBaseAsync_, 0);
}

- (int)readPropertyListFromBaseAsync:(id)a3
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  int result = sub_2268B0F70((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v11, v12);
    int result = 0;
    self->_performingManualRead = 1;
  }
  return result;
}

- (int)updateSettingsAsync
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  int result = sub_2268B1228((uint64_t)configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v11, v12);
    objc_msgSend_setupWiFiState(self, v13, v14);
    return 0;
  }
  return result;
}

- (id)snapshotChangedKeys
{
  id v7 = 0;
  uint64_t v3 = objc_msgSend_bsRef(self, a2, v2);
  int v4 = sub_2268A5838(v3, (const __CFArray **)&v7);
  id result = v7;
  if (!v4)
  {
    if (v7)
    {
      id v6 = v7;
      return v7;
    }
  }
  return result;
}

- (void)snapshotResetAll
{
  uint64_t v3 = objc_msgSend_bsRef(self, a2, v2);

  sub_2268A585C(v3);
}

- (BOOL)snapshotDirty
{
  uint64_t v3 = objc_msgSend_bsRef(self, a2, v2);
  return sub_2268A584C(v3);
}

- (int)snapshotPush
{
  uint64_t v3 = objc_msgSend_bsRef(self, a2, v2);

  return sub_2268A586C(v3);
}

- (int)snapshotPop:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = objc_msgSend_bsRef(self, a2, a3);

  return sub_2268A587C(v4, v3);
}

- (id)bestKeychainMACAddress
{
  uint64_t v10 = 0;
  if ((!objc_msgSend_getValue_forBSSetting_(self, a2, (uint64_t)&v10, 2002865473)
     && objc_msgSend_length(v10, v3, v4)
     && !objc_msgSend_isEqualToString_(v10, v3, @"00:00:00:00:00:00")
     || (uint64_t v10 = 0, !objc_msgSend_getValue_forBSSetting_(self, v3, (uint64_t)&v10, 1918979393)))
    && objc_msgSend_length(v10, v3, v5)
    && !objc_msgSend_isEqualToString_(v10, v3, @"00:00:00:00:00:00")
    || (uint64_t v10 = 0,
        int Value_forBSSetting = objc_msgSend_getValue_forBSSetting_(self, v3, (uint64_t)&v10, 1818316097),
        id result = 0,
        !Value_forBSSetting))
  {
    id result = (id)objc_msgSend_length(v10, v3, v6);
    if (result)
    {
      if (objc_msgSend_isEqualToString_(v10, v9, @"00:00:00:00:00:00")) {
        return 0;
      }
      else {
        return v10;
      }
    }
  }
  return result;
}

- (id)allKeychainMACAddresses
{
  uint64_t v4 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2);
  uint64_t v15 = 0;
  if (!objc_msgSend_getValue_forBSSetting_(self, v5, (uint64_t)&v15, 2002865473)
    && objc_msgSend_length(v15, v6, v7)
    && (objc_msgSend_isEqualToString_(v15, v6, @"00:00:00:00:00:00") & 1) == 0)
  {
    objc_msgSend_addObject_(v4, v6, (uint64_t)v15);
  }
  uint64_t v15 = 0;
  if (!objc_msgSend_getValue_forBSSetting_(self, v6, (uint64_t)&v15, 1918979393)
    && objc_msgSend_length(v15, v8, v9)
    && (objc_msgSend_isEqualToString_(v15, v8, @"00:00:00:00:00:00") & 1) == 0)
  {
    objc_msgSend_addObject_(v4, v8, (uint64_t)v15);
  }
  uint64_t v15 = 0;
  if (!objc_msgSend_getValue_forBSSetting_(self, v8, (uint64_t)&v15, 1818316097)
    && objc_msgSend_length(v15, v10, v11)
    && (objc_msgSend_isEqualToString_(v15, v13, @"00:00:00:00:00:00") & 1) == 0)
  {
    objc_msgSend_addObject_(v4, v14, (uint64_t)v15);
  }
  return v4;
}

- (void)updateRememberKeychainFlagsIfInitializing
{
  if (!self->_initializedBasePasswordFlag && objc_msgSend_bonjourRecord(self, a2, v2))
  {
    self->_initializedBasePasswordFlag = 1;
    objc_msgSend_updateRememberKeychainFlagsButSkipBasePassword_(self, v4, 0);
  }
}

- (void)updateRememberKeychainFlagsButSkipBasePassword:(BOOL)a3
{
  if (!a3) {
    objc_msgSend_loadKeychainBasePassword(self, a2, a3);
  }

  MEMORY[0x270F9A6D0](self, sel_loadKeychainWirelessPassword, a3);
}

- (int)updateKeychainWithPasswordsWithStatus:(int)a3
{
  if (a3 == -16)
  {
    objc_msgSend_deleteKeychainBasePassword(self, a2, *(uint64_t *)&a3);
    return 0;
  }
  else
  {
    return objc_msgSend_updateKeychainWithPasswords(self, a2, *(uint64_t *)&a3);
  }
}

- (int)updateKeychainWithPasswords
{
  if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u)))
  {
    unsigned int v4 = objc_msgSend_rememberBasePassword(self, a2, v2);
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController updateKeychainWithPasswords]", 800, (uint64_t)"self.rememberBasePassword %d\n", v5, v6, v7, v8, v4);
  }
  if (objc_msgSend_rememberBasePassword(self, a2, v2)) {
    objc_msgSend_saveKeychainBasePassword(self, v9, v10);
  }
  return 0;
}

- (void)loadKeychainBasePassword
{
  CFTypeRef v5 = 0;
  objc_sync_enter(self);
  configContext = (uint64_t *)self->_configContext;
  if (configContext && !sub_2268B0914(configContext, &v5) && v5)
  {
    CFRetain(v5);
    objc_sync_exit(self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2268771F4;
    block[3] = &unk_2647BA838;
    block[4] = self;
    block[5] = v5;
    dispatch_group_async((dispatch_group_t)qword_2681482C8, (dispatch_queue_t)qword_2681482C0, block);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (void)saveKeychainBasePassword
{
  if (objc_msgSend_rememberBasePassword(self, a2, v2))
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    objc_sync_enter(self);
    configContext = self->_configContext;
    if (!configContext || sub_2268B0494((uint64_t)configContext, &v29) || !v29) {
      goto LABEL_4;
    }
    uint64_t v13 = objc_msgSend_bestKeychainMACAddress(self, v5, v6);
    if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController saveKeychainBasePassword]", 800, (uint64_t)"macAddress: %@ err: %#m\n", v9, v10, v11, v12, (uint64_t)v13);
    }
    if (!objc_msgSend_length(v13, v7, v8)
      || objc_msgSend_getValue_forBSSetting_(self, v14, (uint64_t)&v31, 1937330263)
      || (uint64_t v17 = v31) == 0)
    {
LABEL_4:
      objc_sync_exit(self);
      return;
    }
    if (dword_268146740 <= 800)
    {
      if (dword_268146740 != -1)
      {
LABEL_18:
        uint64_t v18 = objc_msgSend_length(v17, v15, v16);
        sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController saveKeychainBasePassword]", 800, (uint64_t)"password (length): %ld err: %#m\n", v19, v20, v21, v22, v18);
        goto LABEL_19;
      }
      if (sub_226865630((uint64_t)&dword_268146740, 0x320u))
      {
        uint64_t v17 = v31;
        goto LABEL_18;
      }
    }
LABEL_19:
    if (!objc_msgSend_getValue_forBSSetting_(self, v15, (uint64_t)&v30, 1937329773))
    {
      uint64_t v27 = v30;
      if (v30)
      {
        if (dword_268146740 <= 800)
        {
          if (dword_268146740 != -1)
          {
LABEL_25:
            sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController saveKeychainBasePassword]", 800, (uint64_t)"name: %@ err: %#m\n", v23, v24, v25, v26, v27);
            goto LABEL_26;
          }
          if (sub_226865630((uint64_t)&dword_268146740, 0x320u))
          {
            uint64_t v27 = v30;
            goto LABEL_25;
          }
        }
LABEL_26:
        objc_sync_exit(self);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_226877490;
        block[3] = &unk_2647BA860;
        block[4] = v31;
        block[5] = self;
        void block[6] = v13;
        block[7] = v30;
        dispatch_group_async((dispatch_group_t)qword_2681482C8, (dispatch_queue_t)qword_2681482C0, block);
        return;
      }
    }
    goto LABEL_4;
  }
}

- (void)deleteKeychainBasePassword
{
  CFTypeRef v5 = 0;
  objc_sync_enter(self);
  configContext = (uint64_t *)self->_configContext;
  if (configContext && !sub_2268B0914(configContext, &v5) && v5)
  {
    CFRetain(v5);
    objc_sync_exit(self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_226877644;
    block[3] = &unk_2647BA838;
    block[4] = self;
    block[5] = v5;
    dispatch_group_async((dispatch_group_t)qword_2681482C8, (dispatch_queue_t)qword_2681482C0, block);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (void)loadKeychainWirelessPassword
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  objc_sync_enter(self);
  configContext = self->_configContext;
  if (configContext
    && !sub_2268B0494((uint64_t)configContext, &v17)
    && v17
    && (sub_2268A7C78(v17),
        uint64_t v4 = sub_22685DCDC(1918979693),
        !objc_msgSend_getValue_forSettingPath_(self, v5, (uint64_t)&v16, v4))
    && v16
    && objc_msgSend_length(v16, v6, v7)
    && !objc_msgSend_getValue_forBSSetting_(self, v8, (uint64_t)&v14, 1651717454)
    && v14
    && (!objc_msgSend_BOOLValue(v14, v9, v10)
     || (sub_2268A7C64(v17),
         uint64_t v11 = sub_22685DCDC(1918979693),
         !objc_msgSend_getValue_forSettingPath_(self, v12, (uint64_t)&v15, v11))
     && v15))
  {
    objc_sync_exit(self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_226877824;
    v13[3] = &unk_2647BA860;
    v13[4] = v16;
    v13[5] = v14;
    v13[6] = v15;
    v13[7] = self;
    dispatch_group_async((dispatch_group_t)qword_2681482C8, (dispatch_queue_t)qword_2681482C0, v13);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (void)deleteKeychainWirelessPassword
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  objc_sync_enter(self);
  configContext = self->_configContext;
  if (!configContext
    || sub_2268B0494((uint64_t)configContext, &v15)
    || !v15
    || objc_msgSend_getValue_forBSSetting_(self, v4, (uint64_t)&v12, 1651717454)
    || !v12
    || (sub_2268A7C78(v15),
        uint64_t v5 = sub_22685DCDC(1918979693),
        objc_msgSend_getValue_forSettingPath_(self, v6, (uint64_t)&v14, v5))
    || !v14
    || objc_msgSend_BOOLValue(v12, v7, v8)
    && ((sub_2268A7C64(v15),
         uint64_t v9 = sub_22685DCDC(1918979693),
         objc_msgSend_getValue_forSettingPath_(self, v10, (uint64_t)&v13, v9))
     || !v13))
  {
    objc_sync_exit(self);
  }
  else
  {
    objc_sync_exit(self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_226877AB8;
    v11[3] = &unk_2647BA860;
    v11[4] = v14;
    v11[5] = v12;
    v11[6] = v13;
    v11[7] = self;
    dispatch_group_async((dispatch_group_t)qword_2681482C8, (dispatch_queue_t)qword_2681482C0, v11);
  }
}

- (int)rpcSystemInterfacesAsync
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268A8FBC(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)rpcStartRemoteBrowse:(id)a3 withService:(id)a4
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268A91E4((uint64_t)configContext, (uint64_t)a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)rpcRefreshBSSettingAsync:(int)a3
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268A95F0((uint64_t)configContext, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)rpcDisconnectAllDiskUsersWithMessageAsync:(id)a3
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268A9914((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)rpcRenewDHCPLeaseAsync
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268A9BB4(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)rpcWPSStartAsync:(BOOL)a3 dayPass:(BOOL)a4 timeout:(unsigned int)a5
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268A9D68((uint64_t)configContext, a3, a4, *(uint64_t *)&a5, *(uint64_t *)&a5, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)rpcWPSStopAsync
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268AA09C(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)rpcWPSAllowClientAsync:(id)a3
{
  configContext = self->_configContext;
  if (configContext) {
    return sub_2268AA3B0((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (int)taskState
{
  int v4 = 0;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_2268A8E78((uint64_t)configContext, &v4);
    LODWORD(configContext) = v4;
  }
  return (int)configContext;
}

- (unsigned)taskCode
{
  unsigned int v5 = 0;
  if (!self->_configContext || objc_msgSend_taskState(self, a2, v2) != 6) {
    return 0;
  }
  sub_2268A8E3C((uint64_t)self->_configContext, &v5);
  return v5;
}

- (int)busyState
{
  int v4 = 0;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_2268A8F94((uint64_t)configContext, &v4);
    LODWORD(configContext) = v4;
  }
  return (int)configContext;
}

- (int)taskRestartAsync
{
  if (!self->_configContext) {
    return -6718;
  }
  objc_msgSend_setActiveTask_(self, a2, 1);
  int result = sub_2268AA6D4((uint64_t)self->_configContext, v3, v4, v5, v6, v7, v8, v9);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v11, v12);
    objc_msgSend_setupWiFiState(self, v13, v14);
    return 0;
  }
  return result;
}

- (int)taskRestoreDefaultsAsync:(BOOL)a3
{
  if (!self->_configContext) {
    return -6718;
  }
  BOOL v3 = a3;
  objc_msgSend_setActiveTask_(self, a2, 1);
  int result = sub_2268AB524((uint64_t)self->_configContext, v3, v5, v6, v7, v8, v9, v10);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v12, v13);
    objc_msgSend_setupWiFiState(self, v14, v15);
    return 0;
  }
  return result;
}

- (int)taskUploadFirmwareAsync:(id)a3
{
  if (!self->_configContext) {
    return -6718;
  }
  if (!a3) {
    return -6705;
  }
  objc_msgSend_setActiveTask_(self, a2, 1);
  int result = sub_2268AC360((uint64_t)self->_configContext, (CFDataRef)a3, v5, v6, v7, v8, v9, v10);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v12, v13);
    objc_msgSend_setupWiFiState(self, v14, v15);
    return 0;
  }
  return result;
}

- (int)taskEraseDiskAsync:(id)a3
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  if (a3) {
    return sub_2268AD554((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
  return -6705;
}

- (int)taskArchiveDiskAsync:(id)a3
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  if (a3) {
    return sub_2268ADB48((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
  return -6705;
}

- (int)setMonitorForChanges:(BOOL)a3
{
  if (self->_configContext) {
    return sub_2268B3AE4((dispatch_group_t *)self->_configContext, a3, self->_busy, v3, v4, v5, v6, v7);
  }
  else {
    return -6718;
  }
}

- (BOOL)isMonitoring
{
  char v4 = 0;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_2268B3BE8((uint64_t)configContext, &v4);
    LOBYTE(configContext) = v4 != 0;
  }
  return (char)configContext;
}

- (NSDate)lastHeardFromDevice
{
  return self->_lastHeardFromDevice;
}

- (BOOL)rememberBasePassword
{
  BOOL result = 1;
  char v11 = 1;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_2268B04DC((uint64_t)configContext, &v11, v2, v3, v4, v5, v6, v7);
    return v11 != 0;
  }
  return result;
}

- (void)setRememberBasePassword:(BOOL)a3
{
  configContext = self->_configContext;
  if (configContext) {
    sub_2268B058C((uint64_t)configContext, a3, a3, v3, v4, v5, v6, v7);
  }
}

- (BOOL)rememberWiFiPassword
{
  BOOL result = 1;
  char v11 = 1;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_2268B063C((uint64_t)configContext, &v11, v2, v3, v4, v5, v6, v7);
    return v11 != 0;
  }
  return result;
}

- (void)setRememberWiFiPassword:(BOOL)a3
{
  configContext = self->_configContext;
  if (configContext) {
    sub_2268B06EC((uint64_t)configContext, a3, a3, v3, v4, v5, v6, v7);
  }
}

- (NSDictionary)bonjourRecord
{
  uint64_t v3 = 0;
  BOOL result = (NSDictionary *)self->_configContext;
  if (result)
  {
    sub_2268B0914((uint64_t *)result, &v3);
    return v3;
  }
  return result;
}

- (void)setBonjourRecord:(id)a3
{
  if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController setBonjourRecord:]", 800, (uint64_t)"record: %@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  if (self->_configContext)
  {
    objc_sync_enter(self);
    if (a3)
    {
      self->_BOOL needToNilBonjour = 0;
LABEL_8:
      int v16 = objc_msgSend_taskState(self, v9, v10);
      if (v16 == 6 || !v16) {
        sub_2268AE1F8((uint64_t)self->_configContext, (const __CFString *)a3);
      }
      goto LABEL_21;
    }
    if (!self->_busy)
    {
      self->_BOOL needToNilBonjour = 0;
LABEL_25:
      uint64_t v19 = sub_2268AE640((uint64_t)self->_configContext, 1, v10, v11, v12, v13, v14, v15);
      if (dword_268146740 <= 800)
      {
        uint64_t v24 = v19;
        if (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u)) {
          sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController setBonjourRecord:]", 800, (uint64_t)"err: %#m\n", v20, v21, v22, v23, v24);
        }
      }
      goto LABEL_8;
    }
    int v17 = objc_msgSend_taskState(self, v9, v10);
    BOOL needToNilBonjour = v17 != 0;
    self->_BOOL needToNilBonjour = needToNilBonjour;
    if (!v17 || dword_268146740 > 800)
    {
LABEL_20:
      if (needToNilBonjour)
      {
LABEL_21:
        objc_sync_exit(self);
        return;
      }
      goto LABEL_25;
    }
    if (dword_268146740 == -1)
    {
      if (!sub_226865630((uint64_t)&dword_268146740, 0x320u))
      {
LABEL_19:
        BOOL needToNilBonjour = self->_needToNilBonjour;
        goto LABEL_20;
      }
      BOOL needToNilBonjour = self->_needToNilBonjour;
    }
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController setBonjourRecord:]", 800, (uint64_t)"_needToNilBonjour: %d\n", v12, v13, v14, v15, needToNilBonjour);
    goto LABEL_19;
  }
}

- (BOOL)dirty
{
  configContext = self->_configContext;
  if (configContext)
  {
    char v6 = 0;
    uint64_t v5 = 0;
    int v3 = sub_2268B0494((uint64_t)configContext, &v5);
    LOBYTE(configContext) = 0;
    if (!v3)
    {
      LOBYTE(configContext) = v5;
      if (v5)
      {
        if (sub_2268A5094(v5, &v6)) {
          LOBYTE(configContext) = 0;
        }
        else {
          LOBYTE(configContext) = v6 != 0;
        }
      }
    }
  }
  return (char)configContext;
}

- (_BaseStation)bsRef
{
  int v3 = 0;
  BOOL result = (_BaseStation *)self->_configContext;
  if (result)
  {
    sub_2268B0494((uint64_t)result, &v3);
    return v3;
  }
  return result;
}

- (int64_t)ethernetPortCount
{
  uint64_t v7 = 0;
  int Value_forBSSetting = objc_msgSend_getValue_forBSSetting_(self, a2, (uint64_t)&v7, 1937326416);
  int64_t result = 0;
  if (!Value_forBSSetting)
  {
    uint64_t v6 = objc_msgSend_integerValue(v7, v2, v3);
    return sub_22683C4C8(v6);
  }
  return result;
}

- (void)setupUIConfigResult:(int)a3 withOptions:(id)a4
{
  callbackContext = self->super._callbackContext;
  if (callbackContext)
  {
    if (!a4
      || (int v11 = sub_2268DD050((uint64_t)callbackContext, @"kBSAssistantCallback_Configuration_UIConfigResultsDict", (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7)) == 0)
    {
      int v11 = a3;
    }
    uint64_t v12 = self->super._callbackContext;
    if (v12) {
      sub_2268DD134(v12, v11, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
    }
  }
  self->super._callbackContext = 0;
}

- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4
{
  if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController setupFromAutoguessRecommendation:withOptions:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v120);
  }
  if (!self->_configContext) {
    return -6718;
  }
  if (!a3) {
    return -6705;
  }
  uint64_t v11 = objc_msgSend_objectForKey_(a3, a2, @"BSAutoGuess_Recommendation");
  objc_msgSend_setAutoGuessSetupRecommendation_(self, v12, v11);
  if (!self->_autoGuessSetupRecommendation) {
    return -6727;
  }
  uint64_t v15 = a4
      ? objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v13, (uint64_t)a4)
      : objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v13, v14);
  uint64_t v18 = (void *)v15;
  uint64_t v19 = objc_msgSend_objectForKey_(a3, v16, @"BSAutoGuess_UnconfiguredBase");
  uint64_t v21 = objc_msgSend_objectForKey_(a3, v20, @"BSAutoGuess_UnconfiguredNetwork");
  if (!(v19 | v21)) {
    return -6727;
  }
  uint64_t v23 = v21;
  uint64_t v24 = objc_msgSend_objectForKey_(a3, v22, @"BSAutoGuess_UnconfiguredBaseSettings");
  uint64_t v32 = v24;
  if (v19)
  {
    if (!v24) {
      return -6727;
    }
  }
  if (v19) {
    objc_msgSend_setObject_forKey_(v18, v25, v19, @"kBSAutoGuessSetupOptionKey_TargetBase");
  }
  if (v32) {
    objc_msgSend_setObject_forKey_(v18, v25, v32, @"kBSAutoGuessSetupOptionKey_TargetSettings");
  }
  if (v23) {
    objc_msgSend_setObject_forKey_(v18, v25, v23, @"kBSAutoGuessSetupOptionKey_TargetNetwork");
  }
  if (v19)
  {
    unsigned int v33 = sub_22685AB94((const __CFString *)v19, (uint64_t)v25, v26, v27, v28, v29, v30, v31);
    int v41 = sub_22685AB68(v19, v34, v35, v36, v37, v38, v39, v40);
  }
  else
  {
    unsigned int v33 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v25, v23);
    int v41 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v43, v23);
  }
  int v44 = v41;
  v45 = objc_msgSend_objectForKey_(a4, v42, @"kBSAutoGuessSetupOptionKey_BaseName");
  if (objc_msgSend_length(v45, v46, v47))
  {
    if (!v45) {
      return -6727;
    }
  }
  else
  {
    v45 = sub_22685E04C(v33, v44);
    if (!objc_msgSend_length(v45, v49, v50)) {
      v45 = sub_22685E098(v33, v44);
    }
    if (!v45) {
      return -6727;
    }
    objc_msgSend_setObject_forKey_(v18, v51, (uint64_t)v45, @"kBSAutoGuessSetupOptionKey_BaseName");
  }
  if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v48, @"BSSetupRecommend_OfferExtendWirelessly") & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v52, @"BSSetupRecommend_AskUserChooseBaseWireless"))
  {
    v53 = objc_msgSend_objectForKey_(a4, v52, @"kBSAutoGuessSetupOptionKey_ExtendOption_JoinApple");
    int v56 = objc_msgSend_BOOLValue(v53, v54, v55);
    uint64_t v58 = objc_msgSend_objectForKey_(a3, v57, @"BSAutoGuess_SourceBase");
    if (v58) {
      objc_msgSend_setObject_forKey_(v18, v59, v58, @"kBSAutoGuessSetupOptionKey_SourceBase");
    }
    if (v56) {
      uint64_t v65 = 7;
    }
    else {
      uint64_t v65 = 6;
    }
    goto LABEL_46;
  }
  if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v52, @"BSSetupRecommend_OfferExtendOverEthernet") & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v66, @"BSSetupRecommend_AskUserChooseBaseWired"))
  {
    uint64_t v67 = objc_msgSend_objectForKey_(a3, v66, @"BSAutoGuess_SourceBase");
    if (v67) {
      objc_msgSend_setObject_forKey_(v18, v68, v67, @"kBSAutoGuessSetupOptionKey_SourceBase");
    }
    uint64_t v65 = 8;
    goto LABEL_46;
  }
  if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v66, @"BSSetupRecommend_OfferCreate") & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v81, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable"))
  {
    v82 = objc_msgSend_objectForKey_(a4, v81, @"kBSAutoGuessSetupOptionKey_SkipInternetTests");
    objc_msgSend_BOOLValue(v82, v83, v84);
    int result = sub_2268B079C((uint64_t)self->_configContext, 1, v85, v86, v87, v88, v89, v90);
    if (result) {
      return result;
    }
    if (objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v91, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable"))
    {
      uint64_t v93 = objc_msgSend_objectForKey_(a3, v92, @"BSAutoGuess_SourceBase");
      if (v93)
      {
        objc_msgSend_setObject_forKey_(v18, v94, v93, @"kBSAutoGuessSetupOptionKey_SourceBase");
        uint64_t v65 = 12;
        goto LABEL_46;
      }
      return -6727;
    }
    uint64_t v65 = 1;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v81, @"BSSetupRecommend_OfferJoinNetwork") & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v95, @"BSSetupRecommend_AskUserChooseNetworkToJoin"))
    {
      uint64_t v96 = objc_msgSend_objectForKey_(a3, v95, @"BSAutoGuess_SourceNetwork");
      if (v96) {
        objc_msgSend_setObject_forKey_(v18, v97, v96, @"kBSAutoGuessSetupOptionKey_SourceNetwork");
      }
      if ((v44 & 0xFFFFFFFE) == 2
        && !objc_msgSend_objectForKey_(v18, v97, @"kBSAutoGuessSetupOptionKey_BasePassword"))
      {
        int result = sub_2268B058C((uint64_t)self->_configContext, 0, v98, v99, v100, v101, v102, v103);
        if (result) {
          return result;
        }
      }
      else
      {
        int result = sub_2268B079C((uint64_t)self->_configContext, 1, v98, v99, v100, v101, v102, v103);
        if (result) {
          return result;
        }
      }
      uint64_t v65 = 2;
      goto LABEL_46;
    }
    if (objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v95, @"BSSetupRecommend_OfferRestore"))
    {
      v106 = objc_msgSend_objectForKey_(a4, v104, @"kBSAutoGuessSetupOptionKey_ConfigChangeLogDict");
      if (v106) {
        objc_msgSend_setObject_forKey_(v18, v105, (uint64_t)v106, @"kBSAutoGuessSetupOptionKey_ConfigChangeLogDict");
      }
      if (objc_msgSend_objectForKey_(v106, v105, @"device")) {
        objc_msgSend_setObject_forKey_(v18, v107, (uint64_t)v45, @"kBSAutoGuessSetupOptionKey_BaseName");
      }
      uint64_t v65 = 3;
      goto LABEL_46;
    }
    if (!objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v104, @"BSSetupRecommend_OfferReplaceConfiguration"))
    {
      if (!objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v108, @"BSSetupRecommend_OfferReplace"))return -6735; {
      uint64_t v118 = objc_msgSend_objectForKey_(a3, v117, @"BSAutoGuess_SourceBase");
      }
      if (!v118) {
        return -6727;
      }
      objc_msgSend_setObject_forKey_(v18, v119, v118, @"kBSAutoGuessSetupOptionKey_SourceBase");
      uint64_t v65 = 9;
      goto LABEL_46;
    }
    uint64_t v109 = objc_msgSend_objectForKey_(a4, v108, @"kBSAutoGuessSetupOptionKey_ConfigChangeLogDict");
    if (!v109) {
      return -6727;
    }
    objc_msgSend_setObject_forKey_(v18, v110, v109, @"kBSAutoGuessSetupOptionKey_ConfigChangeLogDict");
    int result = sub_2268B079C((uint64_t)self->_configContext, 1, v111, v112, v113, v114, v115, v116);
    if (result) {
      return result;
    }
    uint64_t v65 = 4;
  }
LABEL_46:
  int result = sub_2268ADFA4((uint64_t)self->_configContext, v65, v18, v60, v61, v62, v63, v64);
  if (!result)
  {
    configContext = self->_configContext;
    v71 = objc_msgSend_objectForKey_(a4, v69, @"kBSAutoGuessSetupOptionKey_RecommendationIsAutomatic");
    char v74 = objc_msgSend_BOOLValue(v71, v72, v73);
    return sub_2268B0834((uint64_t)configContext, v74, v75, v76, v77, v78, v79, v80);
  }
  return result;
}

- (int)setupWithTargetNetwork:(id)a3
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  if (a3) {
    return sub_2268AE060((uint64_t)configContext, a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
  return -6705;
}

- (int)setupWithTargetBaseStation:(id)a3 andSettings:(id)a4
{
  configContext = self->_configContext;
  if (!configContext) {
    return -6718;
  }
  if (a3) {
    return sub_2268AE114((uint64_t)configContext, (const __CFString *)a3, a4, (uint64_t)a4, v4, v5, v6, v7);
  }
  return -6705;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  self->_context = a3;
}

- (NSMutableSet)setupDelegates
{
  return self->_setupDelegates;
}

- (SetupUIConfigDelegate)uiConfigDelegate
{
  return (SetupUIConfigDelegate *)self->_uiConfigDelegate;
}

- (void)setUiConfigDelegate:(id)a3
{
  self->_uiConfigDelegate = a3;
}

- (NSString)autoGuessSetupRecommendation
{
  return self->_autoGuessSetupRecommendation;
}

- (void)setAutoGuessSetupRecommendation:(id)a3
{
}

- (NSDictionary)lastInstrumentation
{
  return self->_lastInstrumentation;
}

- (void)setLastInstrumentation:(id)a3
{
}

- (BOOL)rememberDiskPassword
{
  return self->_rememberDiskPassword;
}

- (void)setRememberDiskPassword:(BOOL)a3
{
  self->_rememberDiskPassword = a3;
}

- (NSString)lastSystemName
{
  return self->_lastSystemName;
}

- (void)setLastSystemName:(id)a3
{
}

- (NSString)lastDNSName
{
  return self->_lastDNSName;
}

- (void)setLastDNSName:(id)a3
{
}

- (BOOL)activeTask
{
  return self->_activeTask;
}

- (void)setActiveTask:(BOOL)a3
{
  self->_activeTask = a3;
}

- (BOOL)performingManualRead
{
  return self->_performingManualRead;
}

- (void)handleBusyStart
{
  if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController(private) handleBusyStart]", 800, (uint64_t)"_busy:\n %d\n", v2, v3, v4, v5, self->_busy);
  }
  self->_busy = 1;
  self->_BOOL needToNilBonjour = 0;
}

- (void)handleBusyComplete
{
  if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController(private) handleBusyComplete]", 800, (uint64_t)"_busy:\n %d\n", v2, v3, v4, v5, self->_busy);
  }
  self->_busy = 0;
  self->_performingManualRead = 0;
  if (self->_needToNilBonjour)
  {
    MEMORY[0x270F9A6D0](self, sel_setBonjourRecord_, 0);
  }
}

- (void)updateLastHeardFromDevice
{
  uint64_t v3 = self->_lastHeardFromDevice;
  self->_lastHeardFromDevice = (NSDate *)(id)objc_msgSend_date(MEMORY[0x263EFF910], v4, v5);
}

- (void)setupWiFiState
{
  uint64_t v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  int AutoJoinState = objc_msgSend_getAutoJoinState(v4, v5, v6);
  self->_autoJoinState = AutoJoinState;
  if (AutoJoinState) {
    objc_msgSend_setAutoJoinState_(v4, v8, 0);
  }
  int isScanningActive = objc_msgSend_isScanningActive(v4, v8, v9);
  self->_scanningState = isScanningActive;
  if (isScanningActive)
  {
    if (objc_msgSend_isScanInProgress(v4, v11, v12)) {
      objc_msgSend_cancelAsync(v4, v13, v14);
    }
    objc_msgSend_activateScanning_(v4, v13, 0);
  }
}

- (void)resetWiFiState
{
  if (self->_autoJoinState)
  {
    uint64_t v4 = objc_msgSend_sharedInstanceRef(WiFiUtils, a2, v2);
    objc_msgSend_setAutoJoinState_(v4, v5, self->_autoJoinState);
  }
  self->_autoJoinState = 0;
  if (self->_scanningState)
  {
    uint64_t v6 = objc_msgSend_sharedInstanceRef(WiFiUtils, a2, v2);
    objc_msgSend_activateScanning_(v6, v7, self->_scanningState);
  }
  self->_scanningState = 0;
}

- (void)handleSetupComplete:(int)a3
{
  objc_msgSend_resetWiFiState(self, a2, *(uint64_t *)&a3);
  if (!a3)
  {
    CFStringRef v7 = (const __CFString *)objc_msgSend_bonjourRecord(self, v5, v6);
    sub_226904544(v7, 0, v8, v9, v10, v11, v12, v13);
  }
  CFDictionaryRef v20 = 0;
  uint64_t v14 = sub_2268AEA38((uint64_t)self->_configContext);
  if (!sub_2268DCE78(v14, &v20))
  {
    if (dword_268146740 <= 800 && (dword_268146740 != -1 || sub_226865630((uint64_t)&dword_268146740, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268146740, (uint64_t)"-[AUSetupController(private) handleSetupComplete:]", 800, (uint64_t)"instrumentation:\n %@\n", v16, v17, v18, v19, (uint64_t)v20);
    }
    objc_msgSend_setLastInstrumentation_(self, v15, (uint64_t)v20);
  }
}

- (void)handleTaskComplete
{
  objc_msgSend_resetWiFiState(self, a2, v2);

  objc_msgSend_setActiveTask_(self, v4, 0);
}

- (void)logChangesToCCL
{
  uint64_t v3 = objc_msgSend_bsRef(self, a2, v2);

  MEMORY[0x270F9A6D0](ConfigChangeLogs, sel_writeConfigChangeLog_, v3);
}

- (id)targetBaseInfoDict
{
  if (!self->_configContext) {
    return 0;
  }
  v105 = 0;
  uint64_t v106 = 0;
  v104 = 0;
  uint64_t v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  if (sub_2268B0494((uint64_t)self->_configContext, &v106)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v106 == 0;
  }
  if (!v6 && !objc_msgSend_getValue_forBSSetting_(self, v5, (uint64_t)&v105, 1651717454))
  {
    if (v105)
    {
      uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v7, v8);
      sub_2268A7C78(v106);
      uint64_t v10 = sub_22685DCDC(1918979693);
      if (!objc_msgSend_getValue_forSettingPath_(self, v11, (uint64_t)&v104, v10))
      {
        uint64_t v12 = (uint64_t)v104;
        if (v104)
        {
          uint64_t v13 = sub_22685D6E8(1918979693);
          objc_msgSend_setObject_forKey_(v9, v14, v12, v13);
          sub_2268A7C78(v106);
          uint64_t v15 = sub_22685DCDC(1651725131);
          if (!objc_msgSend_getValue_forSettingPath_(self, v16, (uint64_t)&v104, v15))
          {
            uint64_t v17 = (uint64_t)v104;
            if (v104)
            {
              uint64_t v18 = sub_22685D6E8(1651725131);
              objc_msgSend_setObject_forKey_(v9, v19, v17, v18);
              objc_msgSend_setObject_forKey_(v4, v20, (uint64_t)v9, @"kSetupBaseStationInfoKey_RadioInfo");
              if (objc_msgSend_BOOLValue(v105, v21, v22))
              {
                uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v23, v24);
                sub_2268A7C64(v106);
                uint64_t v26 = sub_22685DCDC(1918979693);
                if (objc_msgSend_getValue_forSettingPath_(self, v27, (uint64_t)&v104, v26)) {
                  return v4;
                }
                uint64_t v28 = (uint64_t)v104;
                if (!v104) {
                  return v4;
                }
                uint64_t v29 = sub_22685D6E8(1918979693);
                objc_msgSend_setObject_forKey_(v25, v30, v28, v29);
                sub_2268A7C64(v106);
                uint64_t v31 = sub_22685DCDC(1651725131);
                if (objc_msgSend_getValue_forSettingPath_(self, v32, (uint64_t)&v104, v31)) {
                  return v4;
                }
                uint64_t v33 = (uint64_t)v104;
                if (!v104) {
                  return v4;
                }
                uint64_t v34 = sub_22685D6E8(1651725131);
                objc_msgSend_setObject_forKey_(v25, v35, v33, v34);
                objc_msgSend_setObject_forKey_(v4, v36, (uint64_t)v25, @"kSetupBaseStationInfoKey_RadioInfo5GHz");
              }
              if (objc_msgSend_bonjourRecord(self, v23, v24))
              {
                uint64_t v39 = objc_msgSend_bonjourRecord(self, v37, v38);
                objc_msgSend_setObject_forKey_(v4, v40, v39, @"kSetupBaseStationInfoKey_BrowseRecord");
                v43 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v41, v42);
                if (!objc_msgSend_getValue_forBSSetting_(self, v44, (uint64_t)&v104, 1937330263))
                {
                  v45 = v104;
                  if (v104)
                  {
                    uint64_t v46 = sub_22685D6E8(1937330263);
                    objc_msgSend_setObject_forKey_(v43, v47, (uint64_t)v45, v46);
                    if (!objc_msgSend_getValue_forBSSetting_(self, v48, (uint64_t)&v104, 1937329773))
                    {
                      uint64_t v49 = (uint64_t)v104;
                      if (v104)
                      {
                        uint64_t v50 = sub_22685D6E8(1937329773);
                        objc_msgSend_setObject_forKey_(v43, v51, v49, v50);
                        if (!objc_msgSend_getValue_forBSSetting_(self, v52, (uint64_t)&v104, 1937326416))
                        {
                          uint64_t v53 = (uint64_t)v104;
                          if (v104)
                          {
                            uint64_t v54 = sub_22685D6E8(1937326416);
                            objc_msgSend_setObject_forKey_(v43, v55, v53, v54);
                            objc_msgSend_setObject_forKey_(v4, v56, (uint64_t)v43, @"kSetupBaseStationInfoKey_GeneralInfo");
                            if (!objc_msgSend_hasACPFeature_(self, v57, 1297314927)) {
                              goto LABEL_39;
                            }
                            uint64_t v60 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v58, v59);
                            if (!objc_msgSend_getValue_forBSSetting_(self, v61, (uint64_t)&v104, 1651721805))
                            {
                              uint64_t v62 = (uint64_t)v104;
                              if (v104)
                              {
                                uint64_t v63 = sub_22685D6E8(1651721805);
                                objc_msgSend_setObject_forKey_(v60, v64, v62, v63);
                                if (objc_msgSend_integerValue(v104, v65, v66) == 1)
                                {
                                  if (objc_msgSend_getValue_forBSSetting_(self, v67, (uint64_t)&v104, 1718842224))return v4; {
                                  v45 = v104;
                                  }
                                  if (!v104) {
                                    return v4;
                                  }
                                }
                                else
                                {
                                  if (objc_msgSend_integerValue(v104, v67, v68) != 2)
                                  {
                                    v104 = 0;
                                    goto LABEL_38;
                                  }
                                  v104 = v45;
                                }
                                uint64_t v71 = sub_22685D6E8(1718842224);
                                objc_msgSend_setObject_forKey_(v60, v72, (uint64_t)v45, v71);
LABEL_38:
                                objc_msgSend_setObject_forKey_(v4, v70, (uint64_t)v60, @"kSetupBaseStationInfoKey_DiskInfo");
LABEL_39:
                                if (objc_msgSend_hasACPFeature_(self, v58, 1198748750))
                                {
                                  uint64_t v75 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v73, v74);
                                  uint64_t v76 = sub_22685DCDC(1651722053);
                                  if (objc_msgSend_getValue_forSettingPath_(self, v77, (uint64_t)&v104, v76))return v4; {
                                  uint64_t v78 = (uint64_t)v104;
                                  }
                                  if (!v104) {
                                    return v4;
                                  }
                                  uint64_t v79 = sub_22685D6E8(1651722053);
                                  objc_msgSend_setObject_forKey_(v75, v80, v78, v79);
                                  if (objc_msgSend_integerValue(v104, v81, v82))
                                  {
                                    uint64_t v84 = sub_22685DCDC(1651722062);
                                    if (objc_msgSend_getValue_forSettingPath_(self, v85, (uint64_t)&v104, v84))return v4; {
                                    uint64_t v86 = (uint64_t)v104;
                                    }
                                    if (!v104) {
                                      return v4;
                                    }
                                    uint64_t v87 = sub_22685D6E8(1651722062);
                                    objc_msgSend_setObject_forKey_(v75, v88, v86, v87);
                                    uint64_t v89 = sub_22685DCDC(1651722067);
                                    if (objc_msgSend_getValue_forSettingPath_(self, v90, (uint64_t)&v104, v89))return v4; {
                                    uint64_t v91 = (uint64_t)v104;
                                    }
                                    if (!v104) {
                                      return v4;
                                    }
                                    uint64_t v92 = sub_22685D6E8(1651722067);
                                    objc_msgSend_setObject_forKey_(v75, v93, v91, v92);
                                    uint64_t v94 = sub_22685DCDC(1651722064);
                                    if (objc_msgSend_getValue_forSettingPath_(self, v95, (uint64_t)&v104, v94))return v4; {
                                    uint64_t v96 = (uint64_t)v104;
                                    }
                                    if (!v104) {
                                      return v4;
                                    }
                                    uint64_t v97 = sub_22685D6E8(1651722064);
                                    objc_msgSend_setObject_forKey_(v75, v98, v96, v97);
                                  }
                                  objc_msgSend_setObject_forKey_(v4, v83, (uint64_t)v75, @"kSetupBaseStationInfoKey_GuestNetworkInfo");
                                }
                                if (!self->_autoGuessSetupRecommendation) {
                                  return v4;
                                }
                                uint64_t v103 = 0;
                                uint64_t v99 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v73, v74);
                                objc_msgSend_setObject_forKey_(v99, v100, (uint64_t)self->_autoGuessSetupRecommendation, @"BSAutoGuess_Recommendation");
                                int v101 = sub_2268B08CC((uint64_t)self->_configContext, &v103);
                                if (v101 != -6727)
                                {
                                  if (v101 || !v103) {
                                    return v4;
                                  }
                                  objc_msgSend_setObject_forKey_(v99, v102, v103, @"BSAutoGuess_SourceBase");
                                }
                                objc_msgSend_setObject_forKey_(v4, v102, (uint64_t)v99, @"kSetupBaseStationInfoKey_RecommendationInfo");
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
  return v4;
}

@end