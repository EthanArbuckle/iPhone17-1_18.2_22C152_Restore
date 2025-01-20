@interface BiometricKitXPCExportedObject
- (BOOL)isClient:(unint64_t)a3 entitled:(int)a4 forMethod:(const char *)a5;
- (BOOL)legacyAllowlisted:(id)a3;
- (BiometricKitXPCExportedObject)init;
- (BiometricKitXPCServer)server;
- (NSXPCConnection)connection;
- (id)client:(unint64_t)a3;
- (id)clients;
- (id)entitlementsNeededForPermissionGroup:(int)a3;
- (int)clientEntitlement;
- (void)cancel:(unint64_t)a3 replyBlock:(id)a4;
- (void)completeEnrollment:(unint64_t)a3 replyBlock:(id)a4;
- (void)connect:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)dealloc;
- (void)detectPresenceWithOptions:(id)a3 async:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)diagnostics:(int)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)disconnect:(unint64_t)a3 replyBlock:(id)a4;
- (void)dropUnlockToken:(unint64_t)a3 replyBlock:(id)a4;
- (void)enableBackgroundFdet:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)enableMatchAutoRetry:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)enroll:(int)a3 user:(unsigned int)a4 options:(id)a5 async:(BOOL)a6 client:(unint64_t)a7 replyBlock:(id)a8;
- (void)enrollContinue:(unint64_t)a3 replyBlock:(id)a4;
- (void)fileRadarWithLogs:(id)a3 description:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)forceBioLockoutForUser:(unsigned int)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)getBioLockoutStateForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getBiometryAvailabilityForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getCalibrationDataInfo:(unint64_t)a3 replyBlock:(id)a4;
- (void)getCountersignedStoreToken:(unint64_t)a3 replyBlock:(id)a4;
- (void)getDeviceHardwareState:(unint64_t)a3 replyBlock:(id)a4;
- (void)getDeviceState:(unint64_t)a3 replyBlock:(id)a4;
- (void)getExpressModeStateForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getFreeIdentityCount:(int)a3 user:(unsigned int)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)getFreeIdentityCountForUser:(unsigned int)a3 accessoryGroup:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)getIdentitiesDatabaseHashForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getIdentityFromUUID:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getLastMatchEvent:(unint64_t)a3 replyBlock:(id)a4;
- (void)getLogs:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getMaxIdentityCount:(int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getNodeTopologyForIdentity:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getPeriocularMatchState:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getPreferencesValueForKey:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getProtectedConfigurationForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)getProvisioningState:(unint64_t)a3 replyBlock:(id)a4;
- (void)getSensorCalibrationStatus:(unint64_t)a3 replyBlock:(id)a4;
- (void)getSensorInfo:(unint64_t)a3 replyBlock:(id)a4;
- (void)getSystemProtectedConfiguration:(unint64_t)a3 replyBlock:(id)a4;
- (void)identities:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)isAriadneSignpostsEnabled:(unint64_t)a3 replyBlock:(id)a4;
- (void)isFingerOn:(unint64_t)a3 replyBlock:(id)a4;
- (void)isPeriocularEnrollmentSupported:(unint64_t)a3 replyBlock:(id)a4;
- (void)isXARTAvailable:(unint64_t)a3 replyBlock:(id)a4;
- (void)listAccessories:(unint64_t)a3 replyBlock:(id)a4;
- (void)logEventOrCode:(unint64_t)a3;
- (void)match:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7;
- (void)notifyAppIsBackground:(BOOL)a3 client:(unint64_t)a4;
- (void)notifyAppIsInactive:(BOOL)a3 client:(unint64_t)a4;
- (void)pauseFaceDetectTimer:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)pullAlignmentData:(unint64_t)a3 replyBlock:(id)a4;
- (void)pullCalibrationData:(unint64_t)a3 replyBlock:(id)a4;
- (void)pullCaptureBuffer:(unint64_t)a3 replyBlock:(id)a4;
- (void)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)pullMatchPolicyInfoData:(unint64_t)a3 replyBlock:(id)a4;
- (void)queryIdentityMigrationFailureForUser:(unsigned int)a3 clear:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)registerDSID:(unint64_t)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)registerDelegate:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)registerStoreToken:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)removeAllIdentitiesForUser:(unsigned int)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7;
- (void)removeIdentity:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7;
- (void)removePeriocularTemplatesWithOptions:(id)a3 async:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)resetAppleConnectCounter:(unint64_t)a3 replyBlock:(id)a4;
- (void)setClientEntitlement:(int)a3;
- (void)setConnection:(id)a3;
- (void)setDebugImages:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)setPreferencesValue:(id)a3 forKey:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)setProtectedConfiguration:(id)a3 user:(unsigned int)a4 options:(id)a5 async:(BOOL)a6 client:(unint64_t)a7 replyBlock:(id)a8;
- (void)setServer:(id)a3;
- (void)setSystemProtectedConfiguration:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7;
- (void)setTemplate:(id)a3 forIdentity:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)setUserDSID:(unint64_t)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)startNewMatchAttempt:(unint64_t)a3 replyBlock:(id)a4;
- (void)suspendEnrollment:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5;
- (void)terminate;
- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4 client:(unint64_t)a5 replyBlock:(id)a6;
- (void)updateIdentity:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7;
@end

@implementation BiometricKitXPCExportedObject

- (void)getProtectedConfigurationForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  v8 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getProtectedConfigurationForUser:client:replyBlock:]"))
  {
    v9 = (void *)MEMORY[0x223C64ED0]();
    v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          v16 = __osLog;
        }
        else {
          v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          v22 = &unk_22004A573;
          __int16 v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 1372;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      v12 = [(BiometricKitXPCServer *)self->_server getProtectedConfigurationForUser:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        v14 = __osLog;
      }
      else {
        v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        v22 = &unk_22004A573;
        __int16 v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 1371;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      v12 = 0;
    }
  }
  else
  {
    if (__osLog) {
      v13 = __osLog;
    }
    else {
      v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      v22 = &unk_22004A573;
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 1364;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v12 = 0;
  }
  v8[2](v8, v12);
}

- (BOOL)isClient:(unint64_t)a3 entitled:(int)a4 forMethod:(const char *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  switch(a4)
  {
    case 0:
      return 1;
    case 1:
      if (![(BiometricKitXPCExportedObject *)self clientEntitlement]) {
        goto LABEL_18;
      }
      break;
    case 2:
      if (([(BiometricKitXPCExportedObject *)self clientEntitlement] & 4) == 0) {
        goto LABEL_18;
      }
      break;
    case 3:
      if (([(BiometricKitXPCExportedObject *)self clientEntitlement] & 8) == 0) {
        goto LABEL_18;
      }
      break;
    case 4:
      if (([(BiometricKitXPCExportedObject *)self clientEntitlement] & 0x10) == 0) {
        goto LABEL_18;
      }
      break;
    case 5:
      if (([(BiometricKitXPCExportedObject *)self clientEntitlement] & 0x20) == 0) {
        goto LABEL_18;
      }
      break;
    case 6:
      if (([(BiometricKitXPCExportedObject *)self clientEntitlement] & 0x40) == 0) {
        goto LABEL_18;
      }
      break;
    case 7:
      goto LABEL_18;
    default:
      if (__osLog) {
        v9 = __osLog;
      }
      else {
        v9 = &_os_log_internal;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v20 = 67109120;
        LODWORD(v21) = v6;
        _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "Unexpected value %d of permission group\n", (uint8_t *)&v20, 8u);
      }
LABEL_18:
      if (isInternalBuild())
      {
        v10 = [(BiometricKitXPCExportedObject *)self client:a3];
        if ([(BiometricKitXPCExportedObject *)self clientEntitlement] != 1)
        {
          int v11 = [v10 name];
          if (__osLog) {
            v12 = __osLog;
          }
          else {
            v12 = &_os_log_internal;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = v12;
            v14 = [(BiometricKitXPCExportedObject *)self connection];
            int v15 = [v14 processIdentifier];
            v16 = [(BiometricKitXPCExportedObject *)self entitlementsNeededForPermissionGroup:v6];
            int v20 = 138413058;
            __int16 v21 = v11;
            __int16 v22 = 1024;
            int v23 = v15;
            __int16 v24 = 2080;
            __int16 v25 = a5;
            __int16 v26 = 2112;
            uint64_t v27 = v16;
            _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "Client %@ with PID %d calls %s which needs entitlement '%@'.\n", (uint8_t *)&v20, 0x26u);
          }
          int v17 = [(BiometricKitXPCExportedObject *)self server];
          v18 = [v17 reporter];
          [v18 reportMissingPermission:v6 forClientName:v11];
        }
      }
      break;
  }
  return 1;
}

- (int)clientEntitlement
{
  return self->_clientEntitlement;
}

- (id)client:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  clients = v4->_clients;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  v7 = [(NSMutableDictionary *)clients objectForKey:v6];

  objc_sync_exit(v4);
  return v7;
}

- (id)entitlementsNeededForPermissionGroup:(int)a3
{
  if (a3 > 7) {
    return @"(unknown)";
  }
  else {
    return off_26454E300[a3];
  }
}

- (BOOL)legacyAllowlisted:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3) {
    int v4 = [&unk_26D1E0C28 containsObject:v3];
  }
  else {
    int v4 = 0;
  }
  if (__osLog) {
    v5 = __osLog;
  }
  else {
    v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_INFO, "Client %@ allowlisted=%d\n", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

- (BiometricKitXPCExportedObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)BiometricKitXPCExportedObject;
  v2 = [(BiometricKitXPCExportedObject *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  connection = self->_connection;
  self->_server = 0;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)BiometricKitXPCExportedObject;
  [(BiometricKitXPCExportedObject *)&v4 dealloc];
}

- (void)terminate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)v2->_clients allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [(BiometricKitXPCServer *)v2->_server cancelWithClient:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [(NSMutableDictionary *)v2->_clients removeAllObjects];
  objc_sync_exit(v2);
}

- (id)clients
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSMutableDictionary *)v2->_clients allValues];
  objc_sync_exit(v2);

  return v3;
}

- (void)connect:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v9 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject connect:client:replyBlock:]"))
  {
    long long v10 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v11 = self;
    objc_sync_enter(v11);
    clients = v11->_clients;
    v13 = [NSNumber numberWithUnsignedLongLong:a4];
    v14 = [(NSMutableDictionary *)clients objectForKey:v13];

    if (v14)
    {
      int v15 = [(BiometricKitXPCExportedClientObject *)v14 clientInfo];
      char v16 = [v15 isEqualToDictionary:v8];

      if ((v16 & 1) == 0)
      {
        if (__osLog) {
          int v17 = __osLog;
        }
        else {
          int v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v29 = 136316162;
          v30 = "[client.clientInfo isEqualToDictionary:clientInfo]";
          __int16 v31 = 2048;
          uint64_t v32 = 0;
          __int16 v33 = 2080;
          v34 = &unk_22004A573;
          __int16 v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v37 = 1024;
          int v38 = 565;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v29, 0x30u);
        }
        uint64_t v18 = 258;
LABEL_22:

        objc_sync_exit(v11);
        goto LABEL_23;
      }
    }
    else
    {
      v14 = [[BiometricKitXPCExportedClientObject alloc] initWithClientID:a4 clientInfo:v8 exportedObject:v11];
      if (!v14)
      {
        if (__osLog) {
          uint64_t v28 = __osLog;
        }
        else {
          uint64_t v28 = &_os_log_internal;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int v29 = 136316162;
          v30 = "client";
          __int16 v31 = 2048;
          uint64_t v32 = 0;
          __int16 v33 = 2080;
          v34 = &unk_22004A573;
          __int16 v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v37 = 1024;
          int v38 = 560;
          _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v29, 0x30u);
        }
        v14 = 0;
        uint64_t v18 = 260;
        goto LABEL_22;
      }
      __int16 v19 = v11->_clients;
      int v20 = [NSNumber numberWithUnsignedLongLong:a4];
      [(NSMutableDictionary *)v19 setObject:v14 forKey:v20];
    }
    if (([(BiometricKitXPCExportedObject *)v11 clientEntitlement] & 1) != 0
      && isInternalBuild())
    {
      __int16 v21 = [(BiometricKitXPCExportedClientObject *)v14 name];
      __int16 v22 = (void *)__osLog;
      if (!__osLog) {
        __int16 v22 = (void *)&_os_log_internal;
      }
      int v23 = v22;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = [(BiometricKitXPCExportedObject *)v11 connection];
        int v29 = 138412546;
        v30 = v21;
        __int16 v31 = 1024;
        LODWORD(v32) = [v24 processIdentifier];
        _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_ERROR, "Client %@ with PID %d does have legacy entitlement com.apple.private.bmk.allow, please set one of fine grained entitlements com.apple.private.biometrickit.allow-*\n", (uint8_t *)&v29, 0x12u);
      }
      if (![(BiometricKitXPCExportedObject *)v11 legacyAllowlisted:v21])
      {
        __int16 v25 = [(BiometricKitXPCExportedObject *)v11 server];
        __int16 v26 = [v25 reporter];
        [v26 reportLegacyClient:v21];
      }
      uint64_t v18 = 266;
    }
    else
    {
      uint64_t v18 = 0;
    }
    goto LABEL_22;
  }
  if (__osLog) {
    uint64_t v27 = __osLog;
  }
  else {
    uint64_t v27 = &_os_log_internal;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    int v29 = 136316162;
    v30 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
    __int16 v31 = 2048;
    uint64_t v32 = 0;
    __int16 v33 = 2080;
    v34 = &unk_22004A573;
    __int16 v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
    __int16 v37 = 1024;
    int v38 = 546;
    _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v29, 0x30u);
  }
  uint64_t v18 = 257;
LABEL_23:
  v9[2](v9, v18);
}

- (void)disconnect:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy_;
  __int16 v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject disconnect:replyBlock:]"))
  {
    long long v7 = self;
    objc_sync_enter(v7);
    uint64_t v8 = [(BiometricKitXPCExportedObject *)v7 client:a3];
    long long v9 = (void *)v18[5];
    v18[5] = v8;

    if (v18[5])
    {
      clients = v7->_clients;
      uint64_t v11 = [NSNumber numberWithUnsignedLongLong:a3];
      [(NSMutableDictionary *)clients removeObjectForKey:v11];

      objc_sync_exit(v7);
      uint64_t v12 = [(BiometricKitXPCServer *)v7->_server cmdDispatchQueue];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __55__BiometricKitXPCExportedObject_disconnect_replyBlock___block_invoke;
      v16[3] = &unk_26454E1C8;
      v16[4] = v7;
      v16[5] = &v17;
      dispatch_async(v12, v16);

      uint64_t v13 = 0;
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v24 = "client";
        __int16 v25 = 2048;
        uint64_t v26 = 0;
        __int16 v27 = 2080;
        uint64_t v28 = &unk_22004A573;
        __int16 v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v31 = 1024;
        int v32 = 597;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      objc_sync_exit(v7);

      uint64_t v13 = 22;
    }
  }
  else
  {
    if (__osLog) {
      v14 = __osLog;
    }
    else {
      v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v24 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2080;
      uint64_t v28 = &unk_22004A573;
      __int16 v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v31 = 1024;
      int v32 = 592;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v13 = 257;
  }
  v6[2](v6, v13);
  _Block_object_dispose(&v17, 8);
}

void __55__BiometricKitXPCExportedObject_disconnect_replyBlock___block_invoke(uint64_t a1)
{
  id v5 = (id)os_transaction_create();
  v2 = (void *)MEMORY[0x223C64ED0]();
  [*(id *)(*(void *)(a1 + 32) + 24) cancelWithClient:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)registerDelegate:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject registerDelegate:client:replyBlock:]"))
  {
    long long v9 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v9)
    {
      long long v10 = v9;
      [v9 setDelegateRegistered:v6];
      uint64_t v11 = (void *)os_transaction_create();
      uint64_t v12 = (void *)MEMORY[0x223C64ED0]();
      [(BiometricKitXPCServer *)self->_server registerDelegate:v6 withClient:v10];

      uint64_t v13 = 0;
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316162;
        uint64_t v17 = "client";
        __int16 v18 = 2048;
        uint64_t v19 = 0;
        __int16 v20 = 2080;
        __int16 v21 = &unk_22004A573;
        __int16 v22 = 2080;
        int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v24 = 1024;
        int v25 = 632;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
      }
      uint64_t v13 = 22;
    }
  }
  else
  {
    if (__osLog) {
      v14 = __osLog;
    }
    else {
      v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      uint64_t v17 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      __int16 v21 = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v24 = 1024;
      int v25 = 629;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    uint64_t v13 = 257;
  }
  v8[2](v8, v13);
}

- (void)notifyAppIsBackground:(BOOL)a3 client:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject notifyAppIsBackground:client:]"))
  {
    long long v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a4];
    long long v9 = v8;
    if (v8) {
      [v8 setClientAppIsBackground:v5];
    }
  }
  else
  {
    if (__osLog) {
      long long v10 = __osLog;
    }
    else {
      long long v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136316162;
      uint64_t v12 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      int v16 = &unk_22004A573;
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v19 = 1024;
      int v20 = 655;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (void)notifyAppIsInactive:(BOOL)a3 client:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject notifyAppIsInactive:client:]"))
  {
    long long v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a4];
    long long v9 = v8;
    if (v8)
    {
      [v8 setClientAppIsInactive:v5];
      [(BiometricKitXPCServer *)self->_server notifyAppIsInactive:v5 withClient:v9];
    }
  }
  else
  {
    if (__osLog) {
      long long v10 = __osLog;
    }
    else {
      long long v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136316162;
      uint64_t v12 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      int v16 = &unk_22004A573;
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v19 = 1024;
      int v20 = 674;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (void)enroll:(int)a3 user:(unsigned int)a4 options:(id)a5 async:(BOOL)a6 client:(unint64_t)a7 replyBlock:(id)a8
{
  BOOL v10 = a6;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v14 = a5;
  __int16 v15 = (void (**)(id, uint64_t))a8;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  int v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a7, 2, "-[BiometricKitXPCExportedObject enroll:user:options:async:client:replyBlock:]"))
  {
    if (__osLog) {
      int v20 = __osLog;
    }
    else {
      int v20 = &_os_log_internal;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      __int16 v37 = 2048;
      uint64_t v38 = 0;
      __int16 v39 = 2080;
      v40 = &unk_22004A573;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v43 = 1024;
      int v44 = 695;
      _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v21 = 257;
    goto LABEL_20;
  }
  uint64_t v16 = [(BiometricKitXPCExportedObject *)self client:a7];
  __int16 v17 = (void *)v30[5];
  v30[5] = v16;

  if (!v30[5])
  {
    if (__osLog) {
      __int16 v22 = __osLog;
    }
    else {
      __int16 v22 = &_os_log_internal;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "client";
      __int16 v37 = 2048;
      uint64_t v38 = 0;
      __int16 v39 = 2080;
      v40 = &unk_22004A573;
      __int16 v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v43 = 1024;
      int v44 = 697;
      _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v21 = 22;
LABEL_20:
    v15[2](v15, v21);
    goto LABEL_7;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__BiometricKitXPCExportedObject_enroll_user_options_async_client_replyBlock___block_invoke;
  block[3] = &unk_26454E1F0;
  block[4] = self;
  int v27 = a3;
  unsigned int v28 = a4;
  id v24 = v14;
  uint64_t v26 = &v29;
  int v25 = v15;
  dispatch_block_t v18 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
  if (v10) {
    __int16 v19 = {;
  }
    dispatch_async(v19, v18);
  }
  else {
    __int16 v19 = {;
  }
    dispatch_sync(v19, v18);
  }

LABEL_7:
  _Block_object_dispose(&v29, 8);
}

uint64_t __77__BiometricKitXPCExportedObject_enroll_user_options_async_client_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(*(void *)(a1 + 32) + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      uint64_t v8 = __osLog;
    }
    else {
      uint64_t v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      BOOL v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      id v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 706;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) enroll:*(unsigned int *)(a1 + 64) forUser:*(unsigned int *)(a1 + 68) withOptions:*(void *)(a1 + 40) withClient:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)match:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  BOOL v9 = a5;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, uint64_t))a7;
  uint64_t v27 = 0;
  unsigned int v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 4, "-[BiometricKitXPCExportedObject match:options:async:client:replyBlock:]"))
  {
    if (__osLog) {
      uint64_t v19 = __osLog;
    }
    else {
      uint64_t v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v34 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      __int16 v35 = 2048;
      uint64_t v36 = 0;
      __int16 v37 = 2080;
      uint64_t v38 = &unk_22004A573;
      __int16 v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v41 = 1024;
      int v42 = 733;
      _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v20 = 257;
    goto LABEL_20;
  }
  uint64_t v15 = [(BiometricKitXPCExportedObject *)self client:a6];
  uint64_t v16 = (void *)v28[5];
  v28[5] = v15;

  if (!v28[5])
  {
    if (__osLog) {
      uint64_t v21 = __osLog;
    }
    else {
      uint64_t v21 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v34 = "client";
      __int16 v35 = 2048;
      uint64_t v36 = 0;
      __int16 v37 = 2080;
      uint64_t v38 = &unk_22004A573;
      __int16 v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v41 = 1024;
      int v42 = 736;
      _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v20 = 22;
LABEL_20:
    v14[2](v14, v20);
    goto LABEL_7;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BiometricKitXPCExportedObject_match_options_async_client_replyBlock___block_invoke;
  block[3] = &unk_26454E218;
  block[4] = self;
  id v23 = v12;
  id v24 = v13;
  uint64_t v26 = &v27;
  int v25 = v14;
  dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
  if (v9) {
    int v18 = {;
  }
    dispatch_async(v18, v17);
  }
  else {
    int v18 = {;
  }
    dispatch_sync(v18, v17);
  }

LABEL_7:
  _Block_object_dispose(&v27, 8);
}

uint64_t __71__BiometricKitXPCExportedObject_match_options_async_client_replyBlock___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(a1[4] + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      uint64_t v8 = __osLog;
    }
    else {
      uint64_t v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      BOOL v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      id v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 745;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(a1[4] + 24) match:a1[5] withOptions:a1[6] withClient:*(void *)(*(void *)(a1[8] + 8) + 40)];
  uint64_t v4 = *(void *)(a1[8] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)detectPresenceWithOptions:(id)a3 async:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  BOOL v8 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  __int16 v11 = (void (**)(id, uint64_t))a6;
  uint64_t v27 = 0;
  unsigned int v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject detectPresenceWithOptions:async:client:replyBlock:]"))
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v34 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v35 = 2048;
      uint64_t v36 = 0;
      __int16 v37 = 2080;
      uint64_t v38 = &unk_22004A573;
      __int16 v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v41 = 1024;
      int v42 = 772;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v17 = 257;
    goto LABEL_20;
  }
  uint64_t v12 = [(BiometricKitXPCExportedObject *)self client:a5];
  __int16 v13 = (void *)v28[5];
  v28[5] = v12;

  if (!v28[5])
  {
    if (__osLog) {
      int v18 = __osLog;
    }
    else {
      int v18 = &_os_log_internal;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v34 = "client";
      __int16 v35 = 2048;
      uint64_t v36 = 0;
      __int16 v37 = 2080;
      uint64_t v38 = &unk_22004A573;
      __int16 v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v41 = 1024;
      int v42 = 775;
      _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v17 = 22;
LABEL_20:
    v11[2](v11, v17);
    goto LABEL_7;
  }
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __83__BiometricKitXPCExportedObject_detectPresenceWithOptions_async_client_replyBlock___block_invoke;
  __int16 v22 = &unk_26454E240;
  id v23 = self;
  id v24 = v10;
  uint64_t v26 = &v27;
  int v25 = v11;
  dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, &v19);
  [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
  if (v8) {
    __int16 v15 = {;
  }
    dispatch_async(v15, v14);
  }
  else {
    __int16 v15 = {;
  }
    dispatch_sync(v15, v14);
  }

LABEL_7:
  _Block_object_dispose(&v27, 8);
}

uint64_t __83__BiometricKitXPCExportedObject_detectPresenceWithOptions_async_client_replyBlock___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(a1[4] + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      BOOL v8 = __osLog;
    }
    else {
      BOOL v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      id v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      dispatch_block_t v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 784;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(a1[4] + 24) detectPresenceWithOptions:a1[5] withClient:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v4 = *(void *)(a1[7] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)cancel:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, uint64_t))a4;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  if (!-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject cancel:replyBlock:]"))
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v23 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      uint64_t v27 = &unk_22004A573;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v30 = 1024;
      int v31 = 811;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v11 = 257;
    goto LABEL_17;
  }
  uint64_t v7 = [(BiometricKitXPCExportedObject *)self client:a3];
  BOOL v8 = (void *)v17[5];
  v17[5] = v7;

  if (!v17[5])
  {
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v23 = "client";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      uint64_t v27 = &unk_22004A573;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v30 = 1024;
      int v31 = 814;
      _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v11 = 22;
LABEL_17:
    v6[2](v6, v11);
    goto LABEL_4;
  }
  int v9 = [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BiometricKitXPCExportedObject_cancel_replyBlock___block_invoke;
  block[3] = &unk_26454E268;
  block[4] = self;
  __int16 v15 = &v16;
  dispatch_block_t v14 = v6;
  dispatch_async(v9, block);

LABEL_4:
  _Block_object_dispose(&v16, 8);
}

uint64_t __51__BiometricKitXPCExportedObject_cancel_replyBlock___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(a1[4] + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      BOOL v8 = __osLog;
    }
    else {
      BOOL v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      id v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      dispatch_block_t v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 823;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(a1[4] + 24) cancelWithClient:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v4 = *(void *)(a1[6] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)updateIdentity:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  BOOL v9 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 3, "-[BiometricKitXPCExportedObject updateIdentity:options:async:client:replyBlock:]"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v35 = __Block_byref_object_copy_;
    *(void *)&long long v36 = __Block_byref_object_dispose_;
    *((void *)&v36 + 1) = [(BiometricKitXPCExportedObject *)self client:a6];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__BiometricKitXPCExportedObject_updateIdentity_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_26454E218;
      block[4] = self;
      id v20 = v12;
      id v21 = v13;
      id v23 = buf;
      id v22 = v14;
      dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
      if (v9) {
        uint64_t v16 = {;
      }
        dispatch_async(v16, v15);
      }
      else {
        uint64_t v16 = {;
      }
        dispatch_sync(v16, v15);
      }
    }
    else
    {
      if (__osLog) {
        int v18 = __osLog;
      }
      else {
        int v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v24 = 136316162;
        uint64_t v25 = "client";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        uint64_t v29 = &unk_22004A573;
        __int16 v30 = 2080;
        int v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v32 = 1024;
        int v33 = 844;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 22);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (__osLog) {
      __int16 v17 = __osLog;
    }
    else {
      __int16 v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      __int16 v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_22004A573;
      LOWORD(v36) = 2080;
      *(void *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 841;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 257);
  }
}

uint64_t __80__BiometricKitXPCExportedObject_updateIdentity_options_async_client_replyBlock___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(a1[4] + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      BOOL v8 = __osLog;
    }
    else {
      BOOL v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      id v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      id v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 853;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(a1[4] + 24) updateIdentity:a1[5] withOptions:a1[6] withClient:*(void *)(*(void *)(a1[8] + 8) + 40)];
  uint64_t v4 = *(void *)(a1[8] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)removeIdentity:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  BOOL v9 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 3, "-[BiometricKitXPCExportedObject removeIdentity:options:async:client:replyBlock:]"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v35 = __Block_byref_object_copy_;
    *(void *)&long long v36 = __Block_byref_object_dispose_;
    *((void *)&v36 + 1) = [(BiometricKitXPCExportedObject *)self client:a6];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__BiometricKitXPCExportedObject_removeIdentity_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_26454E218;
      block[4] = self;
      id v20 = v12;
      id v21 = v13;
      id v23 = buf;
      id v22 = v14;
      dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
      if (v9) {
        uint64_t v16 = {;
      }
        dispatch_async(v16, v15);
      }
      else {
        uint64_t v16 = {;
      }
        dispatch_sync(v16, v15);
      }
    }
    else
    {
      if (__osLog) {
        int v18 = __osLog;
      }
      else {
        int v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v24 = 136316162;
        uint64_t v25 = "client";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        uint64_t v29 = &unk_22004A573;
        __int16 v30 = 2080;
        int v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v32 = 1024;
        int v33 = 878;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 22);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (__osLog) {
      __int16 v17 = __osLog;
    }
    else {
      __int16 v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      __int16 v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_22004A573;
      LOWORD(v36) = 2080;
      *(void *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 875;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 257);
  }
}

uint64_t __80__BiometricKitXPCExportedObject_removeIdentity_options_async_client_replyBlock___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(a1[4] + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      BOOL v8 = __osLog;
    }
    else {
      BOOL v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      id v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      id v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 887;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(a1[4] + 24) removeIdentity:a1[5] withOptions:a1[6] withClient:*(void *)(*(void *)(a1[8] + 8) + 40)];
  uint64_t v4 = *(void *)(a1[8] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 3, "-[BiometricKitXPCExportedObject removeAllIdentitiesForUser:options:async:client:replyBlock:]"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v34 = __Block_byref_object_copy_;
    *(void *)&long long v35 = __Block_byref_object_dispose_;
    *((void *)&v35 + 1) = [(BiometricKitXPCExportedObject *)self client:a6];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__BiometricKitXPCExportedObject_removeAllIdentitiesForUser_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_26454E290;
      block[4] = self;
      unsigned int v22 = a3;
      id v19 = v12;
      id v21 = buf;
      id v20 = v13;
      dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
      if (v9) {
        __int16 v15 = {;
      }
        dispatch_async(v15, v14);
      }
      else {
        __int16 v15 = {;
      }
        dispatch_sync(v15, v14);
      }
    }
    else
    {
      if (__osLog) {
        __int16 v17 = __osLog;
      }
      else {
        __int16 v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v23 = 136316162;
        __int16 v24 = "client";
        __int16 v25 = 2048;
        uint64_t v26 = 0;
        __int16 v27 = 2080;
        __int16 v28 = &unk_22004A573;
        __int16 v29 = 2080;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v31 = 1024;
        int v32 = 912;
        _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v23, 0x30u);
      }
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 22);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      id v34 = (uint64_t (*)(uint64_t, uint64_t))&unk_22004A573;
      LOWORD(v35) = 2080;
      *(void *)((char *)&v35 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v35) = 1024;
      HIDWORD(v35) = 909;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 257);
  }
}

uint64_t __92__BiometricKitXPCExportedObject_removeAllIdentitiesForUser_options_async_client_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(*(void *)(a1 + 32) + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      BOOL v8 = __osLog;
    }
    else {
      BOOL v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      id v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      dispatch_block_t v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 921;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllIdentitiesForUser:*(unsigned int *)(a1 + 64) withOptions:*(void *)(a1 + 40) withClient:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getIdentityFromUUID:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getIdentityFromUUID:client:replyBlock:]"))
  {
    id v10 = (void *)MEMORY[0x223C64ED0]();
    __int16 v11 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v11)
    {
      int v12 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v12)
      {
        int v16 = v12;
        if (__osLog) {
          __int16 v17 = __osLog;
        }
        else {
          __int16 v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316162;
          uint64_t v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v20 = 2048;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          id v23 = &unk_22004A573;
          __int16 v24 = 2080;
          __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v26 = 1024;
          int v27 = 952;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      __int16 v13 = [(BiometricKitXPCServer *)self->_server getIdentityFromUUID:v8 withClient:v11];
    }
    else
    {
      if (__osLog) {
        __int16 v15 = __osLog;
      }
      else {
        __int16 v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316162;
        uint64_t v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        id v23 = &unk_22004A573;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 951;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      __int16 v13 = 0;
    }
  }
  else
  {
    if (__osLog) {
      dispatch_block_t v14 = __osLog;
    }
    else {
      dispatch_block_t v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      uint64_t v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      id v23 = &unk_22004A573;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 944;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    __int16 v13 = 0;
  }
  v9[2](v9, v13);
}

- (void)identities:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject identities:client:replyBlock:]"))
  {
    id v10 = (void *)MEMORY[0x223C64ED0]();
    __int16 v11 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v11)
    {
      int v12 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v12)
      {
        int v16 = v12;
        if (__osLog) {
          __int16 v17 = __osLog;
        }
        else {
          __int16 v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316162;
          uint64_t v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v20 = 2048;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          id v23 = &unk_22004A573;
          __int16 v24 = 2080;
          __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v26 = 1024;
          int v27 = 974;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      __int16 v13 = [(BiometricKitXPCServer *)self->_server identities:v8 withClient:v11];
    }
    else
    {
      if (__osLog) {
        __int16 v15 = __osLog;
      }
      else {
        __int16 v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316162;
        uint64_t v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        id v23 = &unk_22004A573;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 973;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      __int16 v13 = 0;
    }
  }
  else
  {
    if (__osLog) {
      dispatch_block_t v14 = __osLog;
    }
    else {
      dispatch_block_t v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      uint64_t v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      id v23 = &unk_22004A573;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 966;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    __int16 v13 = 0;
  }
  v9[2](v9, v13);
}

- (void)getMaxIdentityCount:(int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, int64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getMaxIdentityCount:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    id v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          int v16 = __osLog;
        }
        else {
          int v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          int v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          __int16 v22 = &unk_22004A573;
          __int16 v23 = 2080;
          __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 997;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      int64_t v12 = [(BiometricKitXPCServer *)self->_server getMaxIdentityCount:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        dispatch_block_t v14 = __osLog;
      }
      else {
        dispatch_block_t v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        int v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = &unk_22004A573;
        __int16 v23 = 2080;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 996;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      int64_t v12 = 0;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      int v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = &unk_22004A573;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 988;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    int64_t v12 = -1;
  }
  v8[2](v8, v12);
}

- (void)getFreeIdentityCount:(int)a3 user:(unsigned int)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = (void (**)(id, int64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject getFreeIdentityCount:user:client:replyBlock:]"))
  {
    int v11 = (void *)MEMORY[0x223C64ED0]();
    int64_t v12 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v12)
    {
      int v13 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v13)
      {
        int v17 = v13;
        if (__osLog) {
          int v18 = __osLog;
        }
        else {
          int v18 = &_os_log_internal;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316162;
          uint64_t v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v21 = 2048;
          uint64_t v22 = v17;
          __int16 v23 = 2080;
          __int16 v24 = &unk_22004A573;
          __int16 v25 = 2080;
          int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v27 = 1024;
          int v28 = 1019;
          _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
        }
      }
      int64_t v14 = [(BiometricKitXPCServer *)self->_server getFreeIdentityCount:v8 forUser:v7 withClient:v12];
    }
    else
    {
      if (__osLog) {
        int v16 = __osLog;
      }
      else {
        int v16 = &_os_log_internal;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316162;
        uint64_t v20 = "client";
        __int16 v21 = 2048;
        uint64_t v22 = 0;
        __int16 v23 = 2080;
        __int16 v24 = &unk_22004A573;
        __int16 v25 = 2080;
        int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v27 = 1024;
        int v28 = 1018;
        _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
      }
      int64_t v14 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      uint64_t v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      __int16 v24 = &unk_22004A573;
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v27 = 1024;
      int v28 = 1011;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    int64_t v14 = -1;
  }
  v10[2](v10, v14);
}

- (void)registerDSID:(unint64_t)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a4;
  int v11 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 7, "-[BiometricKitXPCExportedObject registerDSID:options:client:replyBlock:]"))
  {
    int64_t v12 = (void *)MEMORY[0x223C64ED0]();
    int v13 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v13)
    {
      int v14 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v14)
      {
        int v18 = v14;
        if (__osLog) {
          int v19 = __osLog;
        }
        else {
          int v19 = &_os_log_internal;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          __int16 v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v22 = 2048;
          uint64_t v23 = v18;
          __int16 v24 = 2080;
          __int16 v25 = &unk_22004A573;
          __int16 v26 = 2080;
          __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v28 = 1024;
          int v29 = 1041;
          _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }
      uint64_t v15 = [(BiometricKitXPCServer *)self->_server registerDSID:a3 withOptions:v10 withClient:v13];
    }
    else
    {
      if (__osLog) {
        int v17 = __osLog;
      }
      else {
        int v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316162;
        __int16 v21 = "client";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        __int16 v25 = &unk_22004A573;
        __int16 v26 = 2080;
        __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v28 = 1024;
        int v29 = 1040;
        _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      uint64_t v15 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v16 = __osLog;
    }
    else {
      int v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      __int16 v21 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      __int16 v25 = &unk_22004A573;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v28 = 1024;
      int v29 = 1033;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    uint64_t v15 = 257;
  }
  v11[2](v11, v15);
}

- (void)registerStoreToken:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 7, "-[BiometricKitXPCExportedObject registerStoreToken:client:replyBlock:]"))
  {
    id v10 = (void *)MEMORY[0x223C64ED0]();
    int v11 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v11)
    {
      int v12 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v12)
      {
        int v16 = v12;
        if (__osLog) {
          int v17 = __osLog;
        }
        else {
          int v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316162;
          int v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v20 = 2048;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          uint64_t v23 = &unk_22004A573;
          __int16 v24 = 2080;
          __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v26 = 1024;
          int v27 = 1063;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      uint64_t v13 = [(BiometricKitXPCServer *)self->_server registerStoreToken:v8 withClient:v11];
    }
    else
    {
      if (__osLog) {
        uint64_t v15 = __osLog;
      }
      else {
        uint64_t v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316162;
        int v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        uint64_t v23 = &unk_22004A573;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 1062;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      uint64_t v13 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      int v19 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      uint64_t v23 = &unk_22004A573;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 1055;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    uint64_t v13 = 257;
  }
  v9[2](v9, v13);
}

- (void)getCountersignedStoreToken:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t, id))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject getCountersignedStoreToken:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    id v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v15 = v9;
        if (__osLog) {
          int v16 = __osLog;
        }
        else {
          int v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          int v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          __int16 v22 = 2080;
          uint64_t v23 = &unk_22004A573;
          __int16 v24 = 2080;
          __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v26 = 1024;
          int v27 = 1087;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      id v17 = 0;
      uint64_t v11 = [(BiometricKitXPCServer *)server getCountersignedStoreToken:&v17 withClient:v8];
      id v12 = v17;
    }
    else
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        uint64_t v23 = &unk_22004A573;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 1086;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v12 = 0;
      uint64_t v11 = 22;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v19 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      uint64_t v23 = &unk_22004A573;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 1079;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v12 = 0;
    uint64_t v11 = 257;
  }
  v6[2](v6, v11, v12);
}

- (void)diagnostics:(int)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v11 = (void (**)(id, uint64_t, BOOL, id))a6;
  char v24 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject diagnostics:options:client:replyBlock:]"))
  {
    id v12 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v13 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v13)
    {
      int v14 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v14)
      {
        int v21 = v14;
        if (__osLog) {
          __int16 v22 = __osLog;
        }
        else {
          __int16 v22 = &_os_log_internal;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v26 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v27 = 2048;
          uint64_t v28 = v21;
          __int16 v29 = 2080;
          uint64_t v30 = &unk_22004A573;
          __int16 v31 = 2080;
          int v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v33 = 1024;
          int v34 = 1109;
          _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      id v23 = 0;
      uint64_t v16 = [(BiometricKitXPCServer *)server diagnostics:v8 withOptions:v10 passed:&v24 withDetails:&v23 withClient:v13];
      id v17 = v23;
    }
    else
    {
      if (__osLog) {
        __int16 v20 = __osLog;
      }
      else {
        __int16 v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v26 = "client";
        __int16 v27 = 2048;
        uint64_t v28 = 0;
        __int16 v29 = 2080;
        uint64_t v30 = &unk_22004A573;
        __int16 v31 = 2080;
        int v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v33 = 1024;
        int v34 = 1108;
        _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v17 = 0;
      uint64_t v16 = 22;
    }

    BOOL v18 = v24 != 0;
  }
  else
  {
    if (__osLog) {
      int v19 = __osLog;
    }
    else {
      int v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v26 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2080;
      uint64_t v30 = &unk_22004A573;
      __int16 v31 = 2080;
      int v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v33 = 1024;
      int v34 = 1104;
      _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    BOOL v18 = 0;
    id v17 = 0;
    uint64_t v16 = 257;
  }
  v11[2](v11, v16, v18, v17);
}

- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject timestampEvent:absoluteTime:client:replyBlock:]"))
  {
    uint64_t v11 = (void *)MEMORY[0x223C64ED0]();
    id v12 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v12)
    {
      int v13 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v13)
      {
        int v17 = v13;
        if (__osLog) {
          BOOL v18 = __osLog;
        }
        else {
          BOOL v18 = &_os_log_internal;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316162;
          __int16 v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v21 = 2048;
          uint64_t v22 = v17;
          __int16 v23 = 2080;
          char v24 = &unk_22004A573;
          __int16 v25 = 2080;
          __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v27 = 1024;
          int v28 = 1128;
          _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
        }
      }
      [(BiometricKitXPCServer *)self->_server timestampEvent:a3 absoluteTime:a4];
      uint64_t v14 = 0;
    }
    else
    {
      if (__osLog) {
        uint64_t v16 = __osLog;
      }
      else {
        uint64_t v16 = &_os_log_internal;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316162;
        __int16 v20 = "client";
        __int16 v21 = 2048;
        uint64_t v22 = 0;
        __int16 v23 = 2080;
        char v24 = &unk_22004A573;
        __int16 v25 = 2080;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v27 = 1024;
        int v28 = 1127;
        _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
      }
      uint64_t v14 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      __int16 v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      char v24 = &unk_22004A573;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v27 = 1024;
      int v28 = 1123;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    uint64_t v14 = 257;
  }
  v10[2](v10, v14);
}

- (void)setUserDSID:(unint64_t)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v11 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 7, "-[BiometricKitXPCExportedObject setUserDSID:options:client:replyBlock:]"))
  {
    id v12 = (void *)MEMORY[0x223C64ED0]();
    int v13 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v13)
    {
      int v14 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v14)
      {
        int v18 = v14;
        if (__osLog) {
          int v19 = __osLog;
        }
        else {
          int v19 = &_os_log_internal;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          __int16 v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v22 = 2048;
          uint64_t v23 = v18;
          __int16 v24 = 2080;
          __int16 v25 = &unk_22004A573;
          __int16 v26 = 2080;
          __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v28 = 1024;
          int v29 = 1150;
          _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }
      uint64_t v15 = [(BiometricKitXPCServer *)self->_server setUserDSID:a3 withOptions:v10 withClient:v13];
    }
    else
    {
      if (__osLog) {
        int v17 = __osLog;
      }
      else {
        int v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316162;
        __int16 v21 = "client";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        __int16 v25 = &unk_22004A573;
        __int16 v26 = 2080;
        __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v28 = 1024;
        int v29 = 1149;
        _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      uint64_t v15 = 22;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      __int16 v21 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      __int16 v25 = &unk_22004A573;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v28 = 1024;
      int v29 = 1142;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    uint64_t v15 = 257;
  }
  v11[2](v11, v15);
}

- (void)resetAppleConnectCounter:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject resetAppleConnectCounter:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          int v14 = __osLog;
        }
        else {
          int v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          int v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1172;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server resetAppleConnectCounterWithClient:v8];
    }
    else
    {
      if (__osLog) {
        id v12 = __osLog;
      }
      else {
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        uint64_t v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        int v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1171;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 22;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      int v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1164;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 257;
  }
  v6[2](v6, v10);
}

- (void)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getIdentitiesDatabaseUUIDForUser:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          uint64_t v16 = __osLog;
        }
        else {
          uint64_t v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          uint64_t v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          __int16 v22 = &unk_22004A573;
          __int16 v23 = 2080;
          int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 1194;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      id v12 = [(BiometricKitXPCServer *)self->_server getIdentitiesDatabaseUUIDForUser:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        uint64_t v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = &unk_22004A573;
        __int16 v23 = 2080;
        int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 1193;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      id v12 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      uint64_t v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = &unk_22004A573;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 1186;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    id v12 = 0;
  }
  v8[2](v8, v12);
}

- (void)getIdentitiesDatabaseHashForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getIdentitiesDatabaseHashForUser:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          uint64_t v16 = __osLog;
        }
        else {
          uint64_t v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          uint64_t v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          __int16 v22 = &unk_22004A573;
          __int16 v23 = 2080;
          int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 1216;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      id v12 = [(BiometricKitXPCServer *)self->_server getIdentitiesDatabaseHashForUser:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        uint64_t v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = &unk_22004A573;
        __int16 v23 = 2080;
        int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 1215;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      id v12 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      uint64_t v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = &unk_22004A573;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 1208;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    id v12 = 0;
  }
  v8[2](v8, v12);
}

- (void)dropUnlockToken:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject dropUnlockToken:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          int v14 = __osLog;
        }
        else {
          int v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          uint64_t v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1239;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server dropUnlockTokenWithClient:v8];
    }
    else
    {
      if (__osLog) {
        id v12 = __osLog;
      }
      else {
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        uint64_t v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        uint64_t v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1238;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1230;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 257;
  }
  v6[2](v6, v10);
}

- (void)forceBioLockoutForUser:(unsigned int)a3 options:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a4;
  int v11 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject forceBioLockoutForUser:options:client:replyBlock:]"))
  {
    id v12 = (void *)MEMORY[0x223C64ED0]();
    int v13 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v13)
    {
      int v14 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v14)
      {
        int v18 = v14;
        if (__osLog) {
          __int16 v19 = __osLog;
        }
        else {
          __int16 v19 = &_os_log_internal;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          __int16 v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v22 = 2048;
          uint64_t v23 = v18;
          __int16 v24 = 2080;
          uint64_t v25 = &unk_22004A573;
          __int16 v26 = 2080;
          uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v28 = 1024;
          int v29 = 1261;
          _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }
      uint64_t v15 = [(BiometricKitXPCServer *)self->_server forceBioLockoutForUser:v8 withOptions:v10 withClient:v13];
    }
    else
    {
      if (__osLog) {
        __int16 v17 = __osLog;
      }
      else {
        __int16 v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316162;
        __int16 v21 = "client";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        uint64_t v25 = &unk_22004A573;
        __int16 v26 = 2080;
        uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v28 = 1024;
        int v29 = 1260;
        _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      uint64_t v15 = 22;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      __int16 v21 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      uint64_t v25 = &unk_22004A573;
      __int16 v26 = 2080;
      uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v28 = 1024;
      int v29 = 1253;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    uint64_t v15 = 257;
  }
  v11[2](v11, v15);
}

- (void)enrollContinue:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 2, "-[BiometricKitXPCExportedObject enrollContinue:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          int v14 = __osLog;
        }
        else {
          int v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          int v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1283;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server enrollContinue];
    }
    else
    {
      if (__osLog) {
        id v12 = __osLog;
      }
      else {
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        uint64_t v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        int v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1282;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      int v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1275;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 257;
  }
  v6[2](v6, v10);
}

- (void)pullAlignmentData:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 2, "-[BiometricKitXPCExportedObject pullAlignmentData:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          int v14 = __osLog;
        }
        else {
          int v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          int v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1306;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server pullAlignmentData];
    }
    else
    {
      if (__osLog) {
        id v12 = __osLog;
      }
      else {
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        uint64_t v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        int v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1305;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      int v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1298;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)pullMatchPolicyInfoData:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject pullMatchPolicyInfoData:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          int v14 = __osLog;
        }
        else {
          int v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          int v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1328;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server pullMatchPolicyInfoData];
    }
    else
    {
      if (__osLog) {
        id v12 = __osLog;
      }
      else {
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        uint64_t v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        int v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1327;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      uint64_t v16 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      int v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1320;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)getNodeTopologyForIdentity:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 6, "-[BiometricKitXPCExportedObject getNodeTopologyForIdentity:client:replyBlock:]"))
  {
    uint64_t v10 = (void *)MEMORY[0x223C64ED0]();
    int v11 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v11)
    {
      int v12 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v12)
      {
        int v16 = v12;
        if (__osLog) {
          __int16 v17 = __osLog;
        }
        else {
          __int16 v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316162;
          __int16 v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v20 = 2048;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          __int16 v23 = &unk_22004A573;
          __int16 v24 = 2080;
          uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v26 = 1024;
          int v27 = 1350;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
        }
      }
      int v13 = [(BiometricKitXPCServer *)self->_server getNodeTopologyForIdentity:v8 withClient:v11];
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316162;
        __int16 v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        __int16 v23 = &unk_22004A573;
        __int16 v24 = 2080;
        uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 1349;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
      }
      int v13 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      __int16 v19 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      __int16 v23 = &unk_22004A573;
      __int16 v24 = 2080;
      uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 1342;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    int v13 = 0;
  }
  v9[2](v9, v13);
}

- (void)getSystemProtectedConfiguration:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getSystemProtectedConfiguration:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    id v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          int v14 = __osLog;
        }
        else {
          int v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          int v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1394;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server getSystemProtectedConfigurationWithClient:v8];
    }
    else
    {
      if (__osLog) {
        int v12 = __osLog;
      }
      else {
        int v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        int v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1393;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1386;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)setProtectedConfiguration:(id)a3 user:(unsigned int)a4 options:(id)a5 async:(BOOL)a6 client:(unint64_t)a7 replyBlock:(id)a8
{
  BOOL v10 = a6;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a7, 5, "-[BiometricKitXPCExportedObject setProtectedConfiguration:user:options:async:client:replyBlock:]"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    int v42 = __Block_byref_object_copy_;
    *(void *)&long long v43 = __Block_byref_object_dispose_;
    *((void *)&v43 + 1) = [(BiometricKitXPCExportedObject *)self client:a7];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      __int16 v23 = __96__BiometricKitXPCExportedObject_setProtectedConfiguration_user_options_async_client_replyBlock___block_invoke;
      int v24 = &unk_26454E2B8;
      uint64_t v25 = self;
      id v26 = v14;
      unsigned int v30 = a4;
      id v27 = v15;
      int v29 = buf;
      id v28 = v16;
      dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, &v21);
      [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
      if (v10) {
        uint64_t v18 = {;
      }
        dispatch_async(v18, v17);
      }
      else {
        uint64_t v18 = {;
      }
        dispatch_sync(v18, v17);
      }
    }
    else
    {
      if (__osLog) {
        __int16 v20 = __osLog;
      }
      else {
        __int16 v20 = &_os_log_internal;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v31 = 136316162;
        int v32 = "client";
        __int16 v33 = 2048;
        uint64_t v34 = 0;
        __int16 v35 = 2080;
        uint64_t v36 = &unk_22004A573;
        __int16 v37 = 2080;
        uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v39 = 1024;
        int v40 = 1409;
        _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v31, 0x30u);
      }
      (*((void (**)(id, uint64_t))v16 + 2))(v16, 22);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (__osLog) {
      __int16 v19 = __osLog;
    }
    else {
      __int16 v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupConfig forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      int v42 = (uint64_t (*)(uint64_t, uint64_t))&unk_22004A573;
      LOWORD(v43) = 2080;
      *(void *)((char *)&v43 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v43) = 1024;
      HIDWORD(v43) = 1407;
      _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v16 + 2))(v16, 257);
  }
}

uint64_t __96__BiometricKitXPCExportedObject_setProtectedConfiguration_user_options_async_client_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(*(void *)(a1 + 32) + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      id v8 = __osLog;
    }
    else {
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      BOOL v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      id v14 = &unk_22004A573;
      __int16 v15 = 2080;
      id v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 1418;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setProtectedConfiguration:*(void *)(a1 + 40) forUser:*(unsigned int *)(a1 + 72) withOptions:*(void *)(a1 + 48) withClient:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)setSystemProtectedConfiguration:(id)a3 options:(id)a4 async:(BOOL)a5 client:(unint64_t)a6 replyBlock:(id)a7
{
  BOOL v9 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a6, 5, "-[BiometricKitXPCExportedObject setSystemProtectedConfiguration:options:async:client:replyBlock:]"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v35 = __Block_byref_object_copy_;
    *(void *)&long long v36 = __Block_byref_object_dispose_;
    *((void *)&v36 + 1) = [(BiometricKitXPCExportedObject *)self client:a6];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __97__BiometricKitXPCExportedObject_setSystemProtectedConfiguration_options_async_client_replyBlock___block_invoke;
      block[3] = &unk_26454E218;
      block[4] = self;
      id v20 = v12;
      id v21 = v13;
      __int16 v23 = buf;
      id v22 = v14;
      dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
      if (v9) {
        id v16 = {;
      }
        dispatch_async(v16, v15);
      }
      else {
        id v16 = {;
      }
        dispatch_sync(v16, v15);
      }
    }
    else
    {
      if (__osLog) {
        int v18 = __osLog;
      }
      else {
        int v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v24 = 136316162;
        uint64_t v25 = "client";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        int v29 = &unk_22004A573;
        __int16 v30 = 2080;
        __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v32 = 1024;
        int v33 = 1442;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 22);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (__osLog) {
      __int16 v17 = __osLog;
    }
    else {
      __int16 v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupConfig forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      __int16 v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_22004A573;
      LOWORD(v36) = 2080;
      *(void *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 1440;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 257);
  }
}

uint64_t __97__BiometricKitXPCExportedObject_setSystemProtectedConfiguration_options_async_client_replyBlock___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(a1[4] + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      id v8 = __osLog;
    }
    else {
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      BOOL v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      id v14 = &unk_22004A573;
      __int16 v15 = 2080;
      id v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 1451;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(a1[4] + 24) setSystemProtectedConfiguration:a1[5] withOptions:a1[6] withClient:*(void *)(*(void *)(a1[8] + 8) + 40)];
  uint64_t v4 = *(void *)(a1[8] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)getProvisioningState:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, int64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getProvisioningState:replyBlock:]"))
  {
    int v7 = (void *)MEMORY[0x223C64ED0]();
    id v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          id v14 = __osLog;
        }
        else {
          id v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          id v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          id v20 = &unk_22004A573;
          __int16 v21 = 2080;
          id v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1483;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      int64_t v10 = [(BiometricKitXPCServer *)self->_server getProvisioningStateWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        id v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        id v20 = &unk_22004A573;
        __int16 v21 = 2080;
        id v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1482;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      int64_t v10 = -1;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v11 = __osLog;
    }
    else {
      __int16 v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      id v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      id v20 = &unk_22004A573;
      __int16 v21 = 2080;
      id v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1474;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)getBioLockoutStateForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v17 = -1;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getBioLockoutStateForUser:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    int64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      uint64_t v11 = [(BiometricKitXPCServer *)self->_server getBioLockoutState:&v17 forUser:v6 withClient:v10];
      uint64_t v12 = dispatch_get_global_queue(0, 0);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77__BiometricKitXPCExportedObject_getBioLockoutStateForUser_client_replyBlock___block_invoke;
      v16[3] = &unk_26454E2E0;
      v16[4] = self;
      dispatch_async(v12, v16);
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        __int16 v23 = &unk_22004A573;
        __int16 v24 = 2080;
        uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 1515;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v11 = 22;
    }

    uint64_t v13 = v17;
  }
  else
  {
    if (__osLog) {
      id v14 = __osLog;
    }
    else {
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      __int16 v23 = &unk_22004A573;
      __int16 v24 = 2080;
      uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 1498;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v11 = 257;
    uint64_t v13 = -1;
  }
  v8[2](v8, v11, v13);
}

void __77__BiometricKitXPCExportedObject_getBioLockoutStateForUser_client_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v1 = [*(id *)(*(void *)(a1 + 32) + 24) loadCatacombAfterFirstUnlock];
  if (v1)
  {
    int v2 = v1;
    if (__osLog) {
      int v3 = __osLog;
    }
    else {
      int v3 = &_os_log_internal;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136316162;
      BOOL v5 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v6 = 2048;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      int v9 = &unk_22004A573;
      __int16 v10 = 2080;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v12 = 1024;
      int v13 = 1520;
      _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
}

- (void)getExpressModeStateForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  __int16 v8 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v18 = -1;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getExpressModeStateForUser:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    __int16 v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v16 = v11;
        if (__osLog) {
          uint64_t v17 = __osLog;
        }
        else {
          uint64_t v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v21 = 2048;
          uint64_t v22 = v16;
          __int16 v23 = 2080;
          __int16 v24 = &unk_22004A573;
          __int16 v25 = 2080;
          __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v27 = 1024;
          int v28 = 1560;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      uint64_t v12 = [(BiometricKitXPCServer *)self->_server getExpressModeState:&v18 forUser:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v20 = "client";
        __int16 v21 = 2048;
        uint64_t v22 = 0;
        __int16 v23 = 2080;
        __int16 v24 = &unk_22004A573;
        __int16 v25 = 2080;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v27 = 1024;
        int v28 = 1559;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v12 = 22;
    }

    uint64_t v13 = v18;
  }
  else
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      __int16 v24 = &unk_22004A573;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v27 = 1024;
      int v28 = 1542;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 257;
    uint64_t v13 = -1;
  }
  v8[2](v8, v12, v13);
}

- (void)getSensorCalibrationStatus:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, int64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getSensorCalibrationStatus:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          int v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1589;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      int64_t v10 = [(BiometricKitXPCServer *)self->_server getSensorCalibrationStatusWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        int v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1588;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      int64_t v10 = -1;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1581;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int64_t v10 = -1;
  }
  v6[2](v6, v10);
}

- (void)getCalibrationDataInfo:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getCalibrationDataInfo:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          int v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1611;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      int64_t v10 = [(BiometricKitXPCServer *)self->_server getCalibrationDataInfoWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        int v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1610;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      int64_t v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1603;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)getSensorInfo:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject getSensorInfo:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          int v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1633;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      int64_t v10 = [(BiometricKitXPCServer *)self->_server getSensorInfoWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        int v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1632;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      int64_t v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1625;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)setDebugImages:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 6, "-[BiometricKitXPCExportedObject setDebugImages:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    int64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          int v16 = __osLog;
        }
        else {
          int v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          uint64_t v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          uint64_t v22 = &unk_22004A573;
          __int16 v23 = 2080;
          int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 1652;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      uint64_t v12 = [(BiometricKitXPCServer *)self->_server setDebugImages:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        uint64_t v14 = __osLog;
      }
      else {
        uint64_t v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        uint64_t v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        uint64_t v22 = &unk_22004A573;
        __int16 v23 = 2080;
        int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 1651;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      uint64_t v12 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      uint64_t v18 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      uint64_t v22 = &unk_22004A573;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 1647;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    uint64_t v12 = 257;
  }
  v8[2](v8, v12);
}

- (void)pullCalibrationData:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 6, "-[BiometricKitXPCExportedObject pullCalibrationData:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          int v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          uint64_t v20 = &unk_22004A573;
          __int16 v21 = 2080;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1674;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      int64_t v10 = [(BiometricKitXPCServer *)self->_server pullCalibrationDataWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        int v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        uint64_t v20 = &unk_22004A573;
        __int16 v21 = 2080;
        uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1673;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      int64_t v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_22004A573;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1666;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)pullCaptureBuffer:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, void *))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 7, "-[BiometricKitXPCExportedObject pullCaptureBuffer:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          int v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          uint64_t v20 = &unk_22004A573;
          __int16 v21 = 2080;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1696;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      int64_t v10 = [(BiometricKitXPCServer *)self->_server pullCaptureBufferWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        int v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        uint64_t v20 = &unk_22004A573;
        __int16 v21 = 2080;
        uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1695;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      int64_t v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_22004A573;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1688;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int64_t v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  int64_t v10 = (void (**)(id, void *, uint64_t, uint64_t))a6;
  uint64_t v21 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 6, "-[BiometricKitXPCExportedObject pullDebugImageData:rotated:client:replyBlock:]"))
  {
    int v11 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v12 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v12)
    {
      int v13 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v13)
      {
        int v19 = v13;
        if (__osLog) {
          uint64_t v20 = __osLog;
        }
        else {
          uint64_t v20 = &_os_log_internal;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v23 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v24 = 2048;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          uint64_t v27 = &unk_22004A573;
          __int16 v28 = 2080;
          uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v30 = 1024;
          int v31 = 1720;
          _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      uint64_t v14 = [(BiometricKitXPCServer *)self->_server pullDebugImageData:v8 rotated:v7 hasWidth:(char *)&v21 + 4 hasHeight:&v21 withClient:v12];
    }
    else
    {
      if (__osLog) {
        uint64_t v18 = __osLog;
      }
      else {
        uint64_t v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v23 = "client";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2080;
        uint64_t v27 = &unk_22004A573;
        __int16 v28 = 2080;
        uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v30 = 1024;
        int v31 = 1719;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v14 = 0;
    }

    uint64_t v16 = v21;
    uint64_t v15 = HIDWORD(v21);
  }
  else
  {
    if (__osLog) {
      __int16 v17 = __osLog;
    }
    else {
      __int16 v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v23 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      uint64_t v27 = &unk_22004A573;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v30 = 1024;
      int v31 = 1712;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v16 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
  }
  v10[2](v10, v14, v15, v16);
}

- (void)getLogs:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v8 = (void (**)(id, void *, id))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 6, "-[BiometricKitXPCExportedObject getLogs:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    int64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v17 = v11;
        if (__osLog) {
          uint64_t v18 = __osLog;
        }
        else {
          uint64_t v18 = &_os_log_internal;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v21 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v22 = 2048;
          uint64_t v23 = v17;
          __int16 v24 = 2080;
          uint64_t v25 = &unk_22004A573;
          __int16 v26 = 2080;
          uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v28 = 1024;
          int v29 = 1740;
          _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      id v19 = 0;
      int v13 = [(BiometricKitXPCServer *)server getLogs:v6 withDetails:&v19];
      id v14 = v19;
    }
    else
    {
      if (__osLog) {
        uint64_t v16 = __osLog;
      }
      else {
        uint64_t v16 = &_os_log_internal;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = "client";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        uint64_t v25 = &unk_22004A573;
        __int16 v26 = 2080;
        uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v28 = 1024;
        int v29 = 1739;
        _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v13 = 0;
      id v14 = 0;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      uint64_t v25 = &unk_22004A573;
      __int16 v26 = 2080;
      uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v28 = 1024;
      int v29 = 1735;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v13 = 0;
    id v14 = 0;
  }
  v8[2](v8, v13, v14);
}

- (void)fileRadarWithLogs:(id)a3 description:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, BOOL))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 6, "-[BiometricKitXPCExportedObject fileRadarWithLogs:description:client:replyBlock:]"))
  {
    int v13 = (void *)MEMORY[0x223C64ED0]();
    id v14 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v14)
    {
      int v15 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v15)
      {
        int v19 = v15;
        if (__osLog) {
          uint64_t v20 = __osLog;
        }
        else {
          uint64_t v20 = &_os_log_internal;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136316162;
          __int16 v22 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v23 = 2048;
          uint64_t v24 = v19;
          __int16 v25 = 2080;
          __int16 v26 = &unk_22004A573;
          __int16 v27 = 2080;
          __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v29 = 1024;
          int v30 = 1759;
          _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
        }
      }
      BOOL v16 = [(BiometricKitXPCServer *)self->_server fileRadarWithLogs:v10 withDescription:v11];
    }
    else
    {
      if (__osLog) {
        uint64_t v18 = __osLog;
      }
      else {
        uint64_t v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136316162;
        __int16 v22 = "client";
        __int16 v23 = 2048;
        uint64_t v24 = 0;
        __int16 v25 = 2080;
        __int16 v26 = &unk_22004A573;
        __int16 v27 = 2080;
        __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v29 = 1024;
        int v30 = 1758;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
      }
      BOOL v16 = 0;
    }
  }
  else
  {
    if (__osLog) {
      int v17 = __osLog;
    }
    else {
      int v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      __int16 v22 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2080;
      __int16 v26 = &unk_22004A573;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v29 = 1024;
      int v30 = 1754;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    BOOL v16 = 0;
  }
  v12[2](v12, v16);
}

- (void)isFingerOn:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, BOOL))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isFingerOn:replyBlock:]"))
  {
    BOOL v7 = (void *)MEMORY[0x223C64ED0]();
    BOOL v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          id v14 = __osLog;
        }
        else {
          id v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          BOOL v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          uint64_t v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1778;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      BOOL v10 = [(BiometricKitXPCServer *)self->_server isFingerOnWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        BOOL v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        uint64_t v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1777;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      id v11 = __osLog;
    }
    else {
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      BOOL v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      uint64_t v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1773;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    BOOL v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)enableBackgroundFdet:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject enableBackgroundFdet:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    BOOL v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      uint64_t v11 = [(BiometricKitXPCServer *)self->_server enableBackgroundFdet:v6 withClient:v10];
      uint64_t v12 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__BiometricKitXPCExportedObject_enableBackgroundFdet_client_replyBlock___block_invoke;
      block[3] = &unk_26454E2E0;
      block[4] = self;
      dispatch_async(v12, block);
    }
    else
    {
      if (__osLog) {
        id v14 = __osLog;
      }
      else {
        id v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v17 = "client";
        __int16 v18 = 2048;
        uint64_t v19 = 0;
        __int16 v20 = 2080;
        __int16 v21 = &unk_22004A573;
        __int16 v22 = 2080;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v24 = 1024;
        int v25 = 1799;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v11 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v17 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      __int16 v21 = &unk_22004A573;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v24 = 1024;
      int v25 = 1792;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v11 = 257;
  }
  v8[2](v8, v11);
}

void __72__BiometricKitXPCExportedObject_enableBackgroundFdet_client_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v1 = [*(id *)(*(void *)(a1 + 32) + 24) loadCatacombAfterFirstUnlock];
  if (v1)
  {
    int v2 = v1;
    if (__osLog) {
      int v3 = __osLog;
    }
    else {
      int v3 = &_os_log_internal;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136316162;
      BOOL v5 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v6 = 2048;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      int v9 = &unk_22004A573;
      __int16 v10 = 2080;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v12 = 1024;
      int v13 = 1804;
      _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
}

- (void)isAriadneSignpostsEnabled:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  __int16 v6 = (void (**)(id, BOOL))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isAriadneSignpostsEnabled:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          BOOL v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1823;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      BOOL v10 = [(BiometricKitXPCServer *)self->_server ariadneSignposts];
    }
    else
    {
      if (__osLog) {
        __int16 v12 = __osLog;
      }
      else {
        __int16 v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        BOOL v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1822;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      BOOL v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1818;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    BOOL v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)isXARTAvailable:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  __int16 v6 = (void (**)(id, BOOL))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isXARTAvailable:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          BOOL v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1845;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      BOOL v10 = [(BiometricKitXPCServer *)self->_server isXARTAvailableWithClient:v8];
    }
    else
    {
      if (__osLog) {
        __int16 v12 = __osLog;
      }
      else {
        __int16 v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        BOOL v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1844;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      BOOL v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1837;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    BOOL v10 = 0;
  }
  v6[2](v6, v10);
}

- (void)getDeviceState:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  __int16 v6 = (void (**)(id, int64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getDeviceState:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          BOOL v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1867;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      int64_t v10 = [(BiometricKitXPCServer *)self->_server getDeviceStateWithClient:v8];
    }
    else
    {
      if (__osLog) {
        __int16 v12 = __osLog;
      }
      else {
        __int16 v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        BOOL v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1866;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      int64_t v10 = -1;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      BOOL v16 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1859;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int64_t v10 = -1;
  }
  v6[2](v6, v10);
}

- (void)startNewMatchAttempt:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  __int16 v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 4, "-[BiometricKitXPCExportedObject startNewMatchAttempt:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          BOOL v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1889;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server startNewMatchAttemptWithClient:v8];
    }
    else
    {
      if (__osLog) {
        __int16 v12 = __osLog;
      }
      else {
        __int16 v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        BOOL v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1888;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 22;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      BOOL v16 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1881;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 257;
  }
  v6[2](v6, v10);
}

- (void)getBiometryAvailabilityForUser:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  __int16 v8 = (void (**)(id, uint64_t, void))a5;
  uint64_t v18 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getBiometryAvailabilityForUser:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v16 = v11;
        if (__osLog) {
          __int16 v17 = __osLog;
        }
        else {
          __int16 v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v21 = 2048;
          uint64_t v22 = v16;
          __int16 v23 = 2080;
          int v24 = &unk_22004A573;
          __int16 v25 = 2080;
          uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v27 = 1024;
          int v28 = 1912;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      uint64_t v12 = [(BiometricKitXPCServer *)self->_server getBiometryAvailability:&v18 forUser:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v20 = "client";
        __int16 v21 = 2048;
        uint64_t v22 = 0;
        __int16 v23 = 2080;
        int v24 = &unk_22004A573;
        __int16 v25 = 2080;
        uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v27 = 1024;
        int v28 = 1911;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v12 = 22;
    }

    uint64_t v13 = v18;
  }
  else
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      int v24 = &unk_22004A573;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v27 = 1024;
      int v28 = 1904;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v13 = 0;
    uint64_t v12 = 257;
  }
  v8[2](v8, v12, v13);
}

- (void)completeEnrollment:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 2, "-[BiometricKitXPCExportedObject completeEnrollment:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v13 = v9;
        if (__osLog) {
          uint64_t v14 = __osLog;
        }
        else {
          uint64_t v14 = &_os_log_internal;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          int v16 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v17 = 2048;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = &unk_22004A573;
          __int16 v21 = 2080;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v23 = 1024;
          int v24 = 1934;
          _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server completeEnrollmentWithClient:v8];
    }
    else
    {
      if (__osLog) {
        uint64_t v12 = __osLog;
      }
      else {
        uint64_t v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316162;
        int v16 = "client";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        __int16 v20 = &unk_22004A573;
        __int16 v21 = 2080;
        uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v23 = 1024;
        int v24 = 1933;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
      }
      uint64_t v10 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      int v16 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_22004A573;
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v23 = 1024;
      int v24 = 1926;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    uint64_t v10 = 257;
  }
  v6[2](v6, v10);
}

- (void)suspendEnrollment:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 2, "-[BiometricKitXPCExportedObject suspendEnrollment:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          int v16 = __osLog;
        }
        else {
          int v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          uint64_t v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          uint64_t v22 = &unk_22004A573;
          __int16 v23 = 2080;
          int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 1956;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      uint64_t v12 = [(BiometricKitXPCServer *)self->_server suspendEnrollment:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        uint64_t v14 = __osLog;
      }
      else {
        uint64_t v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        uint64_t v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        uint64_t v22 = &unk_22004A573;
        __int16 v23 = 2080;
        int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 1955;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      uint64_t v12 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      uint64_t v18 = "[self isClient:clientID entitled:kBioPermissionGroupEnroll forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      uint64_t v22 = &unk_22004A573;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 1948;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    uint64_t v12 = 257;
  }
  v8[2](v8, v12);
}

- (void)setTemplate:(id)a3 forIdentity:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 6, "-[BiometricKitXPCExportedObject setTemplate:forIdentity:client:replyBlock:]"))
  {
    int v13 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v14 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v14)
    {
      int v15 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v15)
      {
        int v19 = v15;
        if (__osLog) {
          uint64_t v20 = __osLog;
        }
        else {
          uint64_t v20 = &_os_log_internal;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136316162;
          uint64_t v22 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v23 = 2048;
          uint64_t v24 = v19;
          __int16 v25 = 2080;
          int v26 = &unk_22004A573;
          __int16 v27 = 2080;
          int v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v29 = 1024;
          int v30 = 1978;
          _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
        }
      }
      uint64_t v16 = [(BiometricKitXPCServer *)self->_server setTemplate:v10 forIdentity:v11 withClient:v14];
    }
    else
    {
      if (__osLog) {
        uint64_t v18 = __osLog;
      }
      else {
        uint64_t v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136316162;
        uint64_t v22 = "client";
        __int16 v23 = 2048;
        uint64_t v24 = 0;
        __int16 v25 = 2080;
        int v26 = &unk_22004A573;
        __int16 v27 = 2080;
        int v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v29 = 1024;
        int v30 = 1977;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
      }
      uint64_t v16 = 22;
    }
  }
  else
  {
    if (__osLog) {
      int v17 = __osLog;
    }
    else {
      int v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      uint64_t v22 = "[self isClient:clientID entitled:kBioPermissionGroupInternal forMethod:__PRETTY_FUNCTION__]";
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2080;
      int v26 = &unk_22004A573;
      __int16 v27 = 2080;
      int v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v29 = 1024;
      int v30 = 1970;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    uint64_t v16 = 257;
  }
  v12[2](v12, v16);
}

- (void)isPeriocularEnrollmentSupported:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, uint64_t, BOOL))a4;
  char v16 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject isPeriocularEnrollmentSupported:replyBlock:]"))
  {
    uint64_t v7 = (void *)MEMORY[0x223C64ED0]();
    __int16 v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v14 = v9;
        if (__osLog) {
          int v15 = __osLog;
        }
        else {
          int v15 = &_os_log_internal;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v14;
          __int16 v21 = 2080;
          uint64_t v22 = &unk_22004A573;
          __int16 v23 = 2080;
          uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 2003;
          _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      uint64_t v10 = [(BiometricKitXPCServer *)self->_server isPeriocularEnrollmentSupported:&v16 withClient:v8];
    }
    else
    {
      if (__osLog) {
        int v13 = __osLog;
      }
      else {
        int v13 = &_os_log_internal;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        uint64_t v22 = &unk_22004A573;
        __int16 v23 = 2080;
        uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 2002;
        _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v10 = 22;
    }

    BOOL v11 = v16 != 0;
  }
  else
  {
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      uint64_t v22 = &unk_22004A573;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 1995;
      _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    BOOL v11 = 0;
    uint64_t v10 = 257;
  }
  v6[2](v6, v10, v11);
}

- (void)getPeriocularMatchState:(unsigned int)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  __int16 v8 = (void (**)(id, uint64_t, void))a5;
  uint64_t v18 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getPeriocularMatchState:client:replyBlock:]"))
  {
    int v9 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v16 = v11;
        if (__osLog) {
          int v17 = __osLog;
        }
        else {
          int v17 = &_os_log_internal;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v20 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v21 = 2048;
          uint64_t v22 = v16;
          __int16 v23 = 2080;
          uint64_t v24 = &unk_22004A573;
          __int16 v25 = 2080;
          int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v27 = 1024;
          int v28 = 2026;
          _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      uint64_t v12 = [(BiometricKitXPCServer *)self->_server getPeriocularMatchStateForUser:v6 state:&v18 withClient:v10];
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = "client";
        __int16 v21 = 2048;
        uint64_t v22 = 0;
        __int16 v23 = 2080;
        uint64_t v24 = &unk_22004A573;
        __int16 v25 = 2080;
        int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v27 = 1024;
        int v28 = 2025;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v12 = 22;
    }

    uint64_t v13 = v18;
  }
  else
  {
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      uint64_t v24 = &unk_22004A573;
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v27 = 1024;
      int v28 = 2018;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v13 = 0;
    uint64_t v12 = 257;
  }
  v8[2](v8, v12, v13);
}

- (void)removePeriocularTemplatesWithOptions:(id)a3 async:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  BOOL v8 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 3, "-[BiometricKitXPCExportedObject removePeriocularTemplatesWithOptions:async:client:replyBlock:]"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v35 = __Block_byref_object_copy_;
    *(void *)&long long v36 = __Block_byref_object_dispose_;
    *((void *)&v36 + 1) = [(BiometricKitXPCExportedObject *)self client:a5];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __94__BiometricKitXPCExportedObject_removePeriocularTemplatesWithOptions_async_client_replyBlock___block_invoke;
      __int16 v19 = &unk_26454E240;
      uint64_t v20 = self;
      id v21 = v10;
      __int16 v23 = buf;
      id v22 = v11;
      dispatch_block_t v12 = dispatch_block_create((dispatch_block_flags_t)0, &v16);
      [(BiometricKitXPCServer *)self->_server cmdDispatchQueue];
      if (v8) {
        uint64_t v13 = {;
      }
        dispatch_async(v13, v12);
      }
      else {
        uint64_t v13 = {;
      }
        dispatch_sync(v13, v12);
      }
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v24 = 136316162;
        __int16 v25 = "client";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        uint64_t v29 = &unk_22004A573;
        __int16 v30 = 2080;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v32 = 1024;
        int v33 = 2041;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v24, 0x30u);
      }
      (*((void (**)(id, uint64_t))v11 + 2))(v11, 22);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "[self isClient:clientID entitled:kBioPermissionGroupIdentityManagement forMethod:__PRETTY_FUNCTION__]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      __int16 v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_22004A573;
      LOWORD(v36) = 2080;
      *(void *)((char *)&v36 + 2) = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrick"
                                      "itd/BiometricKitXPCExportedObject.m";
      WORD5(v36) = 1024;
      HIDWORD(v36) = 2039;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 257);
  }
}

uint64_t __94__BiometricKitXPCExportedObject_removePeriocularTemplatesWithOptions_async_client_replyBlock___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x223C64ED0]();
  int v3 = [*(id *)(a1[4] + 24) loadCatacombAfterFirstUnlock];
  if (v3)
  {
    int v7 = v3;
    if (__osLog) {
      BOOL v8 = __osLog;
    }
    else {
      BOOL v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      id v10 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      int v14 = &unk_22004A573;
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v17 = 1024;
      int v18 = 2050;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  [*(id *)(a1[4] + 24) removePeriocularTemplatesWithOptions:a1[5] withClient:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v4 = *(void *)(a1[7] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)queryIdentityMigrationFailureForUser:(unsigned int)a3 clear:(BOOL)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = (void (**)(id, uint64_t, BOOL))a6;
  char v20 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 7, "-[BiometricKitXPCExportedObject queryIdentityMigrationFailureForUser:clear:client:replyBlock:]"))
  {
    __int16 v11 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v12 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v12)
    {
      int v13 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v13)
      {
        int v18 = v13;
        if (__osLog) {
          uint64_t v19 = __osLog;
        }
        else {
          uint64_t v19 = &_os_log_internal;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          id v22 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v23 = 2048;
          uint64_t v24 = v18;
          __int16 v25 = 2080;
          __int16 v26 = &unk_22004A573;
          __int16 v27 = 2080;
          __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v29 = 1024;
          int v30 = 2084;
          _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      uint64_t v14 = [(BiometricKitXPCServer *)self->_server queryIdentityMigrationFailureForUser:v8 failed:&v20 clear:v7 withClient:v12];
    }
    else
    {
      if (__osLog) {
        __int16 v17 = __osLog;
      }
      else {
        __int16 v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        id v22 = "client";
        __int16 v23 = 2048;
        uint64_t v24 = 0;
        __int16 v25 = 2080;
        __int16 v26 = &unk_22004A573;
        __int16 v27 = 2080;
        __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v29 = 1024;
        int v30 = 2083;
        _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v14 = 22;
    }

    BOOL v15 = v20 != 0;
  }
  else
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v22 = "[self isClient:clientID entitled:kBioPermissionGroupDisabled forMethod:__PRETTY_FUNCTION__]";
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2080;
      __int16 v26 = &unk_22004A573;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v29 = 1024;
      int v30 = 2076;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    BOOL v15 = 0;
    uint64_t v14 = 257;
  }
  v10[2](v10, v14, v15);
}

- (void)logEventOrCode:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", -1, 1, "-[BiometricKitXPCExportedObject logEventOrCode:]"))
  {
    MEMORY[0x270F10C20](a3);
  }
  else
  {
    if (__osLog) {
      uint64_t v4 = __osLog;
    }
    else {
      uint64_t v4 = &_os_log_internal;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136316162;
      uint64_t v6 = "[self isClient:(ClientID)-1 entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v7 = 2048;
      uint64_t v8 = 0;
      __int16 v9 = 2080;
      id v10 = &unk_22004A573;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v13 = 1024;
      int v14 = 2097;
      _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v5, 0x30u);
    }
  }
}

- (void)enableMatchAutoRetry:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 4, "-[BiometricKitXPCExportedObject enableMatchAutoRetry:client:replyBlock:]"))
  {
    __int16 v9 = (void *)MEMORY[0x223C64ED0]();
    id v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          uint64_t v16 = __osLog;
        }
        else {
          uint64_t v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          int v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          id v22 = &unk_22004A573;
          __int16 v23 = 2080;
          uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 2118;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      uint64_t v12 = [(BiometricKitXPCServer *)self->_server enableMatchAutoRetry:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        int v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        id v22 = &unk_22004A573;
        __int16 v23 = 2080;
        uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 2117;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      uint64_t v12 = 22;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      int v18 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      id v22 = &unk_22004A573;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 2110;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    uint64_t v12 = 257;
  }
  v8[2](v8, v12);
}

- (void)pauseFaceDetectTimer:(BOOL)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 4, "-[BiometricKitXPCExportedObject pauseFaceDetectTimer:client:replyBlock:]"))
  {
    __int16 v9 = (void *)MEMORY[0x223C64ED0]();
    id v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      int v11 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v11)
      {
        int v15 = v11;
        if (__osLog) {
          uint64_t v16 = __osLog;
        }
        else {
          uint64_t v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          int v18 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v19 = 2048;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          id v22 = &unk_22004A573;
          __int16 v23 = 2080;
          uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v25 = 1024;
          int v26 = 2140;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
        }
      }
      uint64_t v12 = [(BiometricKitXPCServer *)self->_server pauseFaceDetectTimer:v6 withClient:v10];
    }
    else
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316162;
        int v18 = "client";
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        id v22 = &unk_22004A573;
        __int16 v23 = 2080;
        uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v25 = 1024;
        int v26 = 2139;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
      uint64_t v12 = 22;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      int v18 = "[self isClient:clientID entitled:kBioPermissionGroupMatch forMethod:__PRETTY_FUNCTION__]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      id v22 = &unk_22004A573;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v25 = 1024;
      int v26 = 2132;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    uint64_t v12 = 257;
  }
  v8[2](v8, v12);
}

- (void)getLastMatchEvent:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, uint64_t, id))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getLastMatchEvent:replyBlock:]"))
  {
    __int16 v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v15 = v9;
        if (__osLog) {
          uint64_t v16 = __osLog;
        }
        else {
          uint64_t v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          __int16 v22 = 2080;
          __int16 v23 = &unk_22004A573;
          __int16 v24 = 2080;
          __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v26 = 1024;
          int v27 = 2163;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      id v17 = 0;
      uint64_t v11 = [(BiometricKitXPCServer *)server getLastMatchEvent:&v17 withClient:v8];
      id v12 = v17;
    }
    else
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        __int16 v23 = &unk_22004A573;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 2162;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v12 = 0;
      uint64_t v11 = 22;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      __int16 v23 = &unk_22004A573;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 2155;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v12 = 0;
    uint64_t v11 = 257;
  }
  v6[2](v6, v11, v12);
}

- (void)getDeviceHardwareState:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, uint64_t, void))a4;
  unsigned int v13 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject getDeviceHardwareState:replyBlock:]"))
  {
    __int16 v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      uint64_t v9 = [(BiometricKitXPCServer *)self->_server getDeviceHardwareState:&v13 withClient:v8];
    }
    else
    {
      if (__osLog) {
        id v12 = __osLog;
      }
      else {
        id v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v15 = "client";
        __int16 v16 = 2048;
        uint64_t v17 = 0;
        __int16 v18 = 2080;
        __int16 v19 = &unk_22004A573;
        __int16 v20 = 2080;
        uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v22 = 1024;
        int v23 = 2186;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v9 = 22;
    }

    uint64_t v10 = v13;
  }
  else
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v15 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      __int16 v19 = &unk_22004A573;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v22 = 1024;
      int v23 = 2178;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v10 = 0;
    uint64_t v9 = 257;
  }
  v6[2](v6, v9, v10);
}

- (void)listAccessories:(unint64_t)a3 replyBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v6 = (void (**)(id, uint64_t, id))a4;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a3, 1, "-[BiometricKitXPCExportedObject listAccessories:replyBlock:]"))
  {
    __int16 v7 = (void *)MEMORY[0x223C64ED0]();
    uint64_t v8 = [(BiometricKitXPCExportedObject *)self client:a3];
    if (v8)
    {
      int v9 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v9)
      {
        int v15 = v9;
        if (__osLog) {
          __int16 v16 = __osLog;
        }
        else {
          __int16 v16 = &_os_log_internal;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v19 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          __int16 v22 = 2080;
          int v23 = &unk_22004A573;
          __int16 v24 = 2080;
          __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v26 = 1024;
          int v27 = 2210;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      server = self->_server;
      id v17 = 0;
      uint64_t v11 = [(BiometricKitXPCServer *)server listAccessories:&v17 client:v8];
      id v12 = v17;
    }
    else
    {
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v19 = "client";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        int v23 = &unk_22004A573;
        __int16 v24 = 2080;
        __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v26 = 1024;
        int v27 = 2209;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v12 = 0;
      uint64_t v11 = 22;
    }
  }
  else
  {
    if (__osLog) {
      unsigned int v13 = __osLog;
    }
    else {
      unsigned int v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v19 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      int v23 = &unk_22004A573;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v26 = 1024;
      int v27 = 2202;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v12 = 0;
    uint64_t v11 = 257;
  }
  v6[2](v6, v11, v12);
}

- (void)getFreeIdentityCountForUser:(unsigned int)a3 accessoryGroup:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v11 = (void (**)(id, uint64_t, void))a6;
  uint64_t v21 = 0;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 1, "-[BiometricKitXPCExportedObject getFreeIdentityCountForUser:accessoryGroup:client:replyBlock:]"))
  {
    id v12 = (void *)MEMORY[0x223C64ED0]();
    unsigned int v13 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v13)
    {
      int v14 = [(BiometricKitXPCServer *)self->_server loadCatacombAfterFirstUnlock];
      if (v14)
      {
        int v19 = v14;
        if (__osLog) {
          __int16 v20 = __osLog;
        }
        else {
          __int16 v20 = &_os_log_internal;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          int v23 = "[self->_server loadCatacombAfterFirstUnlock] == 0 ";
          __int16 v24 = 2048;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          int v27 = &unk_22004A573;
          __int16 v28 = 2080;
          __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v30 = 1024;
          int v31 = 2233;
          _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      uint64_t v15 = [(BiometricKitXPCServer *)self->_server getFreeIdentityCount:&v21 forUser:v8 accessoryGroup:v10 client:v13];
    }
    else
    {
      if (__osLog) {
        __int16 v18 = __osLog;
      }
      else {
        __int16 v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v23 = "client";
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2080;
        int v27 = &unk_22004A573;
        __int16 v28 = 2080;
        __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v30 = 1024;
        int v31 = 2232;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v15 = 22;
    }

    uint64_t v16 = v21;
  }
  else
  {
    if (__osLog) {
      id v17 = __osLog;
    }
    else {
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v23 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = &unk_22004A573;
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v30 = 1024;
      int v31 = 2225;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v16 = 0;
    uint64_t v15 = 257;
  }
  v11[2](v11, v15, v16);
}

- (void)getPreferencesValueForKey:(id)a3 client:(unint64_t)a4 replyBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, uint64_t, void *))a5;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a4, 1, "-[BiometricKitXPCExportedObject getPreferencesValueForKey:client:replyBlock:]"))
  {
    uint64_t v10 = [(BiometricKitXPCExportedObject *)self client:a4];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = (void *)MEMORY[0x223C64ED0]();
      server = self->_server;
      id v19 = 0;
      uint64_t v14 = [(BiometricKitXPCServer *)server getPreferencesValue:&v19 forKey:v8 withClient:v11];
      id v15 = v19;
      uint64_t v16 = v15;
      if (v14)
      {

        uint64_t v16 = 0;
      }

      v9[2](v9, v14, v16);
    }
    else
    {
      if (__osLog) {
        __int16 v18 = __osLog;
      }
      else {
        __int16 v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = "client";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        uint64_t v25 = &unk_22004A573;
        __int16 v26 = 2080;
        int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v28 = 1024;
        int v29 = 2332;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v9[2](v9, 22, 0);
    }
  }
  else
  {
    if (__osLog) {
      id v17 = __osLog;
    }
    else {
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "[self isClient:clientID entitled:kBioPermissionGroupDefault forMethod:__PRETTY_FUNCTION__]";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      uint64_t v25 = &unk_22004A573;
      __int16 v26 = 2080;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v28 = 1024;
      int v29 = 2330;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9[2](v9, 3758097122, 0);
  }
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 client:(unint64_t)a5 replyBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, uint64_t))a6;
  if (-[BiometricKitXPCExportedObject isClient:entitled:forMethod:](self, "isClient:entitled:forMethod:", a5, 5, "-[BiometricKitXPCExportedObject setPreferencesValue:forKey:client:replyBlock:]"))
  {
    uint64_t v13 = [(BiometricKitXPCExportedObject *)self client:a5];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      id v15 = (void *)MEMORY[0x223C64ED0]();
      if (![(BiometricKitXPCServer *)self->_server setPreferencesValue:v10 forKey:v11 withClient:v14])
      {
        if (__osLog) {
          id v19 = __osLog;
        }
        else {
          id v19 = &_os_log_internal;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          uint64_t v21 = "[self->_server setPreferencesValue:value forKey:key withClient:client]";
          __int16 v22 = 2048;
          uint64_t v23 = 0;
          __int16 v24 = 2080;
          uint64_t v25 = &unk_22004A573;
          __int16 v26 = 2080;
          int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
          __int16 v28 = 1024;
          int v29 = 2366;
          _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
        }
      }

      uint64_t v16 = 0;
    }
    else
    {
      if (__osLog) {
        __int16 v18 = __osLog;
      }
      else {
        __int16 v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316162;
        uint64_t v21 = "client";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        uint64_t v25 = &unk_22004A573;
        __int16 v26 = 2080;
        int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
        __int16 v28 = 1024;
        int v29 = 2359;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
      }
      uint64_t v16 = 22;
    }
  }
  else
  {
    uint64_t v16 = 3758097122;
    if (__osLog) {
      id v17 = __osLog;
    }
    else {
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      uint64_t v21 = "[self isClient:clientID entitled:kBioPermissionGroupConfig forMethod:__PRETTY_FUNCTION__]";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      uint64_t v25 = &unk_22004A573;
      __int16 v26 = 2080;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCExportedObject.m";
      __int16 v28 = 1024;
      int v29 = 2357;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
  }
  v12[2](v12, v16);
}

- (BiometricKitXPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  self->_server = (BiometricKitXPCServer *)a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setClientEntitlement:(int)a3
{
  self->_clientEntitlement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end