@interface FTEntitlementSupport
+ (id)sharedInstance;
- (BOOL)_disconnectCTServerConnection;
- (BOOL)_reconnectCTServerConnectionIfNecessary;
- (BOOL)_registerForCTEntitlementNotifications;
- (BOOL)_setupCTServerConnection;
- (BOOL)faceTimeNonWiFiEntitled;
- (FTEntitlementSupport)init;
- (NSDictionary)registrationState;
- (id)_rawEntitlementValue;
- (void)_cleanupMachInfo;
- (void)_entitlementStatusChanged;
- (void)_handleCTServiceRequestName:(__CFString *)a3 userInfo:(__CFDictionary *)a4 contextInfo:(void *)a5;
- (void)_updateEntitlementStatusUsingCTEntitlementsInfo:(__CFDictionary *)a3;
@end

@implementation FTEntitlementSupport

+ (id)sharedInstance
{
  if (qword_1EB47C8C0 != -1) {
    dispatch_once(&qword_1EB47C8C0, &unk_1EFE07940);
  }
  v2 = (void *)qword_1EB47C878;

  return v2;
}

- (FTEntitlementSupport)init
{
  v7.receiver = self;
  v7.super_class = (Class)FTEntitlementSupport;
  v4 = [(FTEntitlementSupport *)&v7 init];
  if (v4)
  {
    v5 = (const void *)*MEMORY[0x1E4F23B90];
    v4->_entitlementStatus = (__CFString *)*MEMORY[0x1E4F23B90];
    if (v5) {
      CFRetain(v5);
    }
    objc_msgSend__setupCTServerConnection(v4, v2, v3);
  }
  return v4;
}

- (void)_cleanupMachInfo
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, " Cleaning up mach bits", v6, 2u);
  }

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    self->_ctServerConnection = 0;
    CFRelease(ctServerConnection);
  }
}

- (BOOL)_setupCTServerConnection
{
  if (self->_ctServerConnection) {
    return 1;
  }
  objc_msgSend__cleanupMachInfo(self, a2, v2);
  objc_super v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to CT for requests", buf, 2u);
  }

  uint64_t v23 = 0;
  *(_OWORD *)buf = 0u;
  long long v22 = 0u;
  v8 = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
  self->_ctServerConnection = v8;
  BOOL v3 = v8 != 0;
  if (v8)
  {
    v11 = im_primary_queue();
    _CTServerConnectionSetTargetQueue();

    if ((unint64_t)_CTServerConnectionRegisterForNotification() >> 32)
    {
      v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_ERROR, "Carrier Entitlements: Could not register for Message received notification", v20, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F23D50], 0);
    objc_msgSend__registerForCTEntitlementNotifications(self, v14, v15);
  }
  else
  {
    v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, " ** Failed connection", v20, 2u);
    }

    objc_msgSend__cleanupMachInfo(self, v17, v18);
  }
  return v3;
}

- (void)_updateEntitlementStatusUsingCTEntitlementsInfo:(__CFDictionary *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    uint64_t v18 = a3;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Entitlement update: %@", (uint8_t *)&v17, 0xCu);
  }

  if (a3)
  {
    entitlementStatus = self->_entitlementStatus;
    if (entitlementStatus)
    {
      CFRelease(entitlementStatus);
      self->_entitlementStatus = 0;
    }
    v8 = (const void *)*MEMORY[0x1E4F23B88];
    if (*MEMORY[0x1E4F23B88]) {
      self->_entitlementStatus = (__CFString *)CFDictionaryGetValue(a3, v8);
    }
    v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], (const char *)v8, v6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self->_entitlementStatus;
      int v17 = 138412290;
      uint64_t v18 = (__CFDictionary *)v10;
      _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "CT returned entitlement value: %@", (uint8_t *)&v17, 0xCu);
    }

    v11 = self->_entitlementStatus;
    v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, " => saving it", (uint8_t *)&v17, 2u);
      }

      v16 = self->_entitlementStatus;
LABEL_17:
      CFRetain(v16);
      return;
    }
    if (v15)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, " => empty value, defaulting to allowed", (uint8_t *)&v17, 2u);
    }

    v16 = (__CFString *)*MEMORY[0x1E4F23B90];
    self->_entitlementStatus = (__CFString *)*MEMORY[0x1E4F23B90];
    if (v16) {
      goto LABEL_17;
    }
  }
}

- (BOOL)_registerForCTEntitlementNotifications
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v3, OS_LOG_TYPE_DEFAULT, "Registering for CT entitlement requests", buf, 2u);
  }

  v4 = IMSingleObjectArray();
  if (objc_msgSend_count(v4, v5, v6))
  {
    uint64_t v9 = _CTServerConnectionVerifyCarrierEntitlements();
    v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (HIDWORD(v9))
    {
      if (!v13)
      {
LABEL_20:

        goto LABEL_21;
      }
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = (int)v9;
      __int16 v27 = 2048;
      uint64_t v28 = v9 >> 32;
      v21 = " => Failed registration (domain: %ld error: %ld)";
      long long v22 = v12;
      uint32_t v23 = 22;
LABEL_19:
      _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      goto LABEL_20;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, " => Registered for entitlements updates", buf, 2u);
    }
  }
  v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Retrieving initial CT carrier entitlements", buf, 2u);
  }

  unint64_t CarrierEntitlements = _CTServerConnectionGetCarrierEntitlements();
  if (!HIDWORD(CarrierEntitlements))
  {
    v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v16, v17);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v21 = " => Initial carrier CT entitlements dictionary was NULL";
    long long v22 = v12;
    uint32_t v23 = 2;
    goto LABEL_19;
  }
  uint64_t v19 = CarrierEntitlements;
  v20 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v16, v17);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v26 = (int)v19;
    __int16 v27 = 2048;
    uint64_t v28 = v19 >> 32;
    _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, " => Failed to retrieve initial CT carrier entitlements (domain: %ld error: %ld)", buf, 0x16u);
  }

LABEL_21:
  return 0;
}

- (BOOL)faceTimeNonWiFiEntitled
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_sharedInstance(FTDeviceSupport, a2, v2);
  char v7 = objc_msgSend_supportsNonWiFiFaceTime(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_sharedInstance(FTUserConfiguration, v8, v9);
    char v13 = objc_msgSend__nonWifiFaceTimeEntitled(v10, v11, v12);

    if (v13)
    {
      return 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        entitlementStatus = self->_entitlementStatus;
        int v20 = 138412290;
        v21 = entitlementStatus;
        _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "Returning entitlement based on status: %@", (uint8_t *)&v20, 0xCu);
      }

      return CFEqual(self->_entitlementStatus, (CFTypeRef)*MEMORY[0x1E4F23B98]) == 0;
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "This device does not support non WiFi facetime, thus we're not entitled", (uint8_t *)&v20, 2u);
    }

    return 0;
  }
}

- (NSDictionary)registrationState
{
  BOOL v3 = objc_msgSend_sharedInstance(FTDeviceSupport, a2, v2);
  uint64_t v6 = objc_msgSend_registrationState(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (id)_rawEntitlementValue
{
  return self->_entitlementStatus;
}

- (void)_entitlementStatusChanged
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Posting notification for entitlement status changed", v9, 2u);
  }

  char v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v7, v8, @"__kFTEntitlementStatusChangedNotification", self, 0);
}

- (BOOL)_reconnectCTServerConnectionIfNecessary
{
  char v17 = 0;
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Reconnecting to CT if we can", buf, 2u);
  }

  if (objc_msgSend__setupCTServerConnection(self, v5, v6))
  {
    if (self->_ctServerConnection
      && (int CommCenterInitializationState = _CTServerConnectionGetCommCenterInitializationState(),
          self->_ctServerConnection)
      && (CommCenterInitializationState || v17))
    {
      objc_msgSend__registerForCTEntitlementNotifications(self, v7, v8);
    }
    else
    {
      objc_msgSend__cleanupMachInfo(self, v7, v8);
      uint64_t v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, " => Watching for launch", v15, 2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1A7BEE4A0, (CFStringRef)*MEMORY[0x1E4F23D50], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return 1;
}

- (BOOL)_disconnectCTServerConnection
{
  if (self->_ctServerConnection)
  {
    v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Disconnect CT server connection", v10, 2u);
    }

    objc_msgSend__unregisterForCTEntitlementNotifications(self, v5, v6);
    objc_msgSend__cleanupMachInfo(self, v7, v8);
  }
  return 1;
}

- (void)_handleCTServiceRequestName:(__CFString *)a3 userInfo:(__CFDictionary *)a4 contextInfo:(void *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F23BA0]))
  {
    uint64_t v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Entitlement update", (uint8_t *)&v23, 2u);
    }

    objc_msgSend__updateEntitlementStatusUsingCTEntitlementsInfo_(self, v11, (uint64_t)a4);
    objc_msgSend__entitlementStatusChanged(self, v12, v13);
  }
  else
  {
    int v14 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F23D48]);
    char v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v15, v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v18)
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "** CT Mach port died", (uint8_t *)&v23, 2u);
      }

      objc_msgSend__disconnectCTServerConnection(self, v19, v20);
      objc_msgSend__reconnectCTServerConnectionIfNecessary(self, v21, v22);
    }
    else
    {
      if (v18)
      {
        int v23 = 138412546;
        v24 = a3;
        __int16 v25 = 2112;
        uint64_t v26 = a4;
        _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Unhandled request type, name: %@   userInfo: %@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
}

@end