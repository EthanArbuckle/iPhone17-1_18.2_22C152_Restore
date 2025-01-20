@interface FTUserConfiguration
+ (id)sharedInstance;
- (BOOL)_adequateInternalOrCarrierInstall;
- (BOOL)_getCellularDataEnabledForBundleID:(id)a3;
- (BOOL)_getNonBluetoothDataAllowedForBundleID:(id)a3;
- (BOOL)_getWifiDataAllowedForBundleID:(id)a3;
- (BOOL)_nonWifiFaceTimeEntitled;
- (BOOL)allowAnyNetwork;
- (BOOL)cellularDataEnabledForBundleId:(id)a3;
- (BOOL)cellularFaceTimeEnabled;
- (BOOL)isDeviceInDualPhoneIdentityMode;
- (BOOL)isDeviceInManualPhoneSelectionMode;
- (BOOL)nonBluetoothAllowedForBundleId:(id)a3;
- (BOOL)shouldCacheCTConnection;
- (BOOL)wifiAllowedForBundleId:(id)a3;
- (FTUserConfiguration)init;
- (NSArray)selectedPhoneNumberRegistrationSubscriptionLabels;
- (NSMutableDictionary)nonBTAllowedCache;
- (NSNumber)selectedPhoneNumberRegistrationSubscriptionNumber;
- (__CTServerConnection)ctServerConnection;
- (void)_clearCaches;
- (void)_setAppCellularDataEnabled:(BOOL)a3;
- (void)_setupUsageHandlerIfNeeded;
- (void)dealloc;
- (void)setAllowAnyNetwork:(BOOL)a3;
- (void)setCellularFaceTimeEnabled:(BOOL)a3;
- (void)setCtServerConnection:(__CTServerConnection *)a3;
- (void)setIsDeviceInDualPhoneIdentityMode:(BOOL)a3;
- (void)setIsDeviceInManualPhoneSelectionMode:(BOOL)a3;
- (void)setNonBTAllowedCache:(id)a3;
- (void)setSelectedPhoneNumberRegistrationSubscriptionLabels:(id)a3;
- (void)setShouldCacheCTConnection:(BOOL)a3;
- (void)silentlySetSelectedPhoneNumberRegistrationSubscriptionLabels:(id)a3;
@end

@implementation FTUserConfiguration

- (NSNumber)selectedPhoneNumberRegistrationSubscriptionNumber
{
  v2 = MEMORY[0x1AD0D4E20](@"com.apple.conference", @"phoneNumberRegistrationSubscriptionNumber");
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSArray)selectedPhoneNumberRegistrationSubscriptionLabels
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = MEMORY[0x1AD0D4E20](@"com.apple.conference", @"phoneNumberRegistrationSubscriptionLabel");
  if (!v3) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = v3;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v8, 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSelectedPhoneNumberRegistrationSubscriptionLabels_(self, v6, (uint64_t)v5);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v3;
  }
  else {
LABEL_6:
  }
    id v5 = 0;
LABEL_7:

  return (NSArray *)v5;
}

- (FTUserConfiguration)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)FTUserConfiguration;
  v2 = [(FTUserConfiguration *)&v19 init];
  id v5 = v2;
  if (v2)
  {
    v2->_shouldCacheCTConnection = 1;
    v6 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v3, v4);
    v9 = objc_msgSend_processName(v6, v7, v8);

    if (objc_msgSend_isEqualToString_(v9, v10, @"InCallService"))
    {
      v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_DEFAULT, "Not building UserConfiguration cache for {processName: %@}", buf, 0xCu);
      }

      v5->_shouldCacheCTConnection = 0;
    }
    else
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      cellularDataAvailableCache = v5->_cellularDataAvailableCache;
      v5->_cellularDataAvailableCache = v12;

      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      wifiAllowedCache = v5->_wifiAllowedCache;
      v5->_wifiAllowedCache = v14;

      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      nonBTAllowedCache = v5->_nonBTAllowedCache;
      v5->_nonBTAllowedCache = v16;
    }
  }
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1EB47C8C8 != -1) {
    dispatch_once(&qword_1EB47C8C8, &unk_1EFE07960);
  }
  v2 = (void *)qword_1EB47C880;

  return v2;
}

- (BOOL)isDeviceInDualPhoneIdentityMode
{
  return IMGetDomainBoolForKey();
}

- (void)dealloc
{
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection) {
    CFRelease(ctServerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)FTUserConfiguration;
  [(FTUserConfiguration *)&v4 dealloc];
}

- (__CTServerConnection)ctServerConnection
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  ctServerConnection = self->_ctServerConnection;
  if (!ctServerConnection)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    objc_super v4 = im_primary_queue();
    objc_copyWeak(&v17, &location);
    ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    if (ctServerConnection)
    {
      uint64_t v5 = *MEMORY[0x1E4F23E88];
      unint64_t v6 = _CTServerConnectionRegisterForNotification();
      int v7 = v6;
      if (v6)
      {
        unint64_t v8 = HIDWORD(v6);
        v9 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v20 = v5;
          __int16 v21 = 1024;
          int v22 = v7;
          __int16 v23 = 1024;
          int v24 = v8;
          _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_ERROR, "Failed to register CT server DataAccessPolicyChanged notification %@ (domain: %d error: %d).", buf, 0x18u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
      }
      uint64_t v10 = *MEMORY[0x1E4F23D48];
      unint64_t v11 = _CTServerConnectionRegisterForNotification();
      int v12 = v11;
      if (!v11) {
        goto LABEL_17;
      }
      unint64_t v13 = HIDWORD(v11);
      v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v20 = v10;
        __int16 v21 = 1024;
        int v22 = v12;
        __int16 v23 = 1024;
        int v24 = v13;
        _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_ERROR, "Failed to register CT server ConnectionInvalidated notification %@ (domain: %d error: %d).", buf, 0x18u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_17;
      }
    }
    else
    {
      v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_ERROR, "Failed to create CT server connection", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_17;
      }
    }
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
LABEL_17:
    if (self->_shouldCacheCTConnection)
    {
      self->_ctServerConnection = ctServerConnection;
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      return self->_ctServerConnection;
    }
    else
    {
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return ctServerConnection;
}

- (void)_clearCaches
{
  pthread_mutex_lock(&stru_1EB47C620);
  objc_msgSend_removeAllObjects(self->_cellularDataAvailableCache, v3, v4);
  pthread_mutex_unlock(&stru_1EB47C620);
  pthread_mutex_lock(&stru_1EB47C5E0);
  objc_msgSend_removeAllObjects(self->_wifiAllowedCache, v5, v6);
  pthread_mutex_unlock(&stru_1EB47C5E0);
  pthread_mutex_lock(&stru_1EB47C5A0);
  objc_msgSend_removeAllObjects(self->_nonBTAllowedCache, v7, v8);

  pthread_mutex_unlock(&stru_1EB47C5A0);
}

- (void)_setAppCellularDataEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_ctServerConnection(self, a2, a3))
  {
    uint64_t v10 = *MEMORY[0x1E4F23D10];
    uint64_t v5 = (void *)MEMORY[0x1E4F23D18];
    if (!v3) {
      uint64_t v5 = (void *)MEMORY[0x1E4F23D20];
    }
    v11[0] = *v5;
    uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v11, &v10, 1);
    _CTServerConnectionSetCellularUsagePolicy();
  }
  else
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = @"com.apple.facetime";
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_ERROR, "Failed to set the data usage policy for bundle %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (BOOL)_getCellularDataEnabledForBundleID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    pthread_mutex_lock(&stru_1EB47C620);
    uint64_t v8 = objc_msgSend_objectForKey_(self->_cellularDataAvailableCache, v5, (uint64_t)v4);
    if (!v8)
    {
      if (objc_msgSend_ctServerConnection(self, v6, v7))
      {
        uint64_t v9 = _CTServerConnectionCopyCellularUsagePolicy();
        uint64_t v10 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v17 = 0;
          __int16 v18 = 1024;
          int v19 = v9;
          __int16 v20 = 1024;
          int v21 = HIDWORD(v9);
          _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "_getCellularDataEnabledForBundleID copied cellularPolicy %@ {ctError.domain: %d, ctError.error: %d}", buf, 0x18u);
        }
      }
      else
      {
        uint64_t v10 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "_getCellularDataEnabledForBundleID unable to get a server connection", buf, 2u);
        }
      }

      int v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_ERROR, "Failed to get the data usage policy for bundle %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      uint64_t v8 = 0;
    }
    pthread_mutex_unlock(&stru_1EB47C620);
    char v11 = objc_msgSend_BOOLValue(v8, v13, v14);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_getWifiDataAllowedForBundleID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    pthread_mutex_lock(&stru_1EB47C5E0);
    uint64_t v8 = objc_msgSend_objectForKey_(self->_wifiAllowedCache, v5, (uint64_t)v4);
    if (!v8)
    {
      if (objc_msgSend_ctServerConnection(self, v6, v7))
      {
        uint64_t v9 = _CTServerConnectionCopyCellularUsagePolicy();
        uint64_t v10 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v17 = 0;
          __int16 v18 = 1024;
          int v19 = v9;
          __int16 v20 = 1024;
          int v21 = HIDWORD(v9);
          _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "_getWifiDataAllowedForBundleID copied cellularPolicy %@ {ctError.domain: %d, ctError.error: %d}", buf, 0x18u);
        }
      }
      else
      {
        uint64_t v10 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "_getWifiDataAllowedForBundleID unable to get a server connection", buf, 2u);
        }
      }

      int v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_ERROR, "Failed to get the data usage policy for bundle %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      uint64_t v8 = 0;
    }
    pthread_mutex_unlock(&stru_1EB47C5E0);
    char v11 = objc_msgSend_BOOLValue(v8, v13, v14);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_setupUsageHandlerIfNeeded
{
  if (!self->_usageClient)
  {
    BOOL v3 = objc_msgSend_weakRefWithObject_(MEMORY[0x1E4F6C428], a2, (uint64_t)self);
    self->_usageClient = (network_usage_policy_client_s *)network_usage_policy_create_client();
    id v4 = im_primary_queue();
    uint64_t v6 = v3;
    id v5 = v3;
    network_usage_policy_set_changed_handler();
  }
}

- (BOOL)_getNonBluetoothDataAllowedForBundleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    pthread_mutex_lock(&stru_1EB47C5A0);
    objc_msgSend__setupUsageHandlerIfNeeded(self, v5, v6);
    uint64_t v23 = 0;
    int v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = sub_1A7BEFBBC;
    v27 = sub_1A7BEFBCC;
    id v28 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend_objectForKey_(self->_nonBTAllowedCache, v7, (uint64_t)v4);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    if (!v24[5])
    {
      uint64_t v9 = objc_msgSend_weakRefWithObject_(MEMORY[0x1E4F6C428], v8, (uint64_t)self);
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      char v22 = 1;
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      id v11 = v4;
      objc_msgSend_UTF8String(v11, v12, v13);
      id v18 = v11;
      id v19 = v9;
      __int16 v20 = v10;
      network_usage_policy_get_for_bundle();
      dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

      _Block_object_dispose(v21, 8);
    }
    pthread_mutex_unlock(&stru_1EB47C5A0);
    char v16 = objc_msgSend_BOOLValue((void *)v24[5], v14, v15);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)_adequateInternalOrCarrierInstall
{
  BOOL v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], a2, v2);
  if (objc_msgSend_isInternalInstall(v3, v4, v5))
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v6, v7);
    if (objc_msgSend_isCarrierInstall(v9, v10, v11)) {
      char v8 = IMGetAppBoolForKey();
    }
    else {
      char v8 = 0;
    }
  }
  return v8;
}

- (BOOL)cellularFaceTimeEnabled
{
  return objc_msgSend_cellularDataEnabledForBundleId_(self, a2, @"com.apple.facetime");
}

- (BOOL)cellularDataEnabledForBundleId:(id)a3
{
  return MEMORY[0x1F4181798](self, sel__getCellularDataEnabledForBundleID_, a3);
}

- (BOOL)wifiAllowedForBundleId:(id)a3
{
  return MEMORY[0x1F4181798](self, sel__getWifiDataAllowedForBundleID_, a3);
}

- (BOOL)nonBluetoothAllowedForBundleId:(id)a3
{
  return 1;
}

- (void)setCellularFaceTimeEnabled:(BOOL)a3
{
}

- (BOOL)allowAnyNetwork
{
  int v3 = objc_msgSend__adequateInternalOrCarrierInstall(self, a2, v2);
  if (v3)
  {
    if (IMGetDomainBoolForKey())
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      uint64_t v6 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5);
      char v8 = objc_msgSend_fileExistsAtPath_(v6, v7, @"/Library/Preferences/SystemConfiguration/rtether.plist");

      LOBYTE(v3) = v8;
    }
  }
  return v3;
}

- (void)setAllowAnyNetwork:(BOOL)a3
{
}

- (void)setSelectedPhoneNumberRegistrationSubscriptionLabels:(id)a3
{
  id v4 = a3;
  objc_msgSend_silentlySetSelectedPhoneNumberRegistrationSubscriptionLabels_(self, v5, (uint64_t)v4);
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v9, v8, @"FTUserConfigurationSelectedSubscriptionLabelDidChange", v4);
}

- (void)silentlySetSelectedPhoneNumberRegistrationSubscriptionLabels:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Setting persisted phone number registration subscription label {subscriptionLabels: %@}", (uint8_t *)&v5, 0xCu);
  }

  IMSetDomainValueForKey();
}

- (void)setIsDeviceInDualPhoneIdentityMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = @"NO";
    if (v3) {
      int v5 = @"YES";
    }
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Setting persisted dual phone identity mode {isDeviceInDualPhoneIdentityMode: %@}", (uint8_t *)&v6, 0xCu);
  }

  IMSetDomainBoolForKey();
}

- (void)setIsDeviceInManualPhoneSelectionMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = @"NO";
    if (v3) {
      int v5 = @"YES";
    }
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Setting persisted manual phone identity mode {isDeviceInManualPhoneSelectionMode: %@}", (uint8_t *)&v6, 0xCu);
  }

  IMSetDomainBoolForKey();
}

- (BOOL)isDeviceInManualPhoneSelectionMode
{
  return IMGetDomainBoolForKey();
}

- (BOOL)_nonWifiFaceTimeEntitled
{
  int v3 = objc_msgSend__adequateInternalOrCarrierInstall(self, a2, v2);
  if (v3)
  {
    LOBYTE(v3) = IMGetCachedDomainBoolForKey();
  }
  return v3;
}

- (NSMutableDictionary)nonBTAllowedCache
{
  return self->_nonBTAllowedCache;
}

- (void)setNonBTAllowedCache:(id)a3
{
}

- (void)setCtServerConnection:(__CTServerConnection *)a3
{
  self->_ctServerConnection = a3;
}

- (BOOL)shouldCacheCTConnection
{
  return self->_shouldCacheCTConnection;
}

- (void)setShouldCacheCTConnection:(BOOL)a3
{
  self->_shouldCacheCTConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBTAllowedCache, 0);
  objc_storeStrong((id *)&self->_wifiAllowedCache, 0);

  objc_storeStrong((id *)&self->_cellularDataAvailableCache, 0);
}

@end