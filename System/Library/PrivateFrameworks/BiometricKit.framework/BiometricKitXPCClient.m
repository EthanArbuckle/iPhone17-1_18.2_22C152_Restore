@interface BiometricKitXPCClient
+ (void)initialize;
- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4;
- (BOOL)isAriadneSignpostsEnabled;
- (BOOL)isFingerOn;
- (BOOL)isXARTAvailable;
- (BiometricKitXPCClient)init;
- (BiometricKitXPCClient)initWithDeviceType:(int64_t)a3 clientType:(int64_t)a4;
- (BiometricKitXPCClientDelegate)delegate;
- (id)getCalibrationDataInfo;
- (id)getIdentitiesDatabaseHashForUser:(unsigned int)a3;
- (id)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3;
- (id)getIdentityFromUUID:(id)a3;
- (id)getLogs:(BOOL)a3 withDetails:(id *)a4;
- (id)getNodeTopologyForIdentity:(id)a3;
- (id)getProtectedConfigurationForUser:(unsigned int)a3;
- (id)getSensorInfo;
- (id)getSystemProtectedConfiguration;
- (id)identities:(id)a3;
- (id)pullAlignmentData;
- (id)pullCalibrationData;
- (id)pullCaptureBuffer;
- (id)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 imageWidth:(unsigned int *)a5 imageHeight:(unsigned int *)a6;
- (id)pullMatchPolicyInfoData;
- (int)completeEnrollment;
- (int)connect;
- (int)diagnostics:(int)a3 withOptions:(id)a4 passed:(BOOL *)a5 withDetails:(id *)a6;
- (int)dropUnlockToken;
- (int)enableBackgroundFdet:(BOOL)a3;
- (int)enableMatchAutoRetry:(BOOL)a3;
- (int)enrollContinue;
- (int)forceBioLockoutForUser:(unsigned int)a3 withOptions:(id)a4;
- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4;
- (int)getBiometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4;
- (int)getCountersignedStoreToken:(id *)a3;
- (int)getDeviceHardwareState:(unsigned int *)a3;
- (int)getExpressModeState:(int64_t *)a3 forUser:(unsigned int)a4;
- (int)getFreeIdentityCount:(unint64_t *)a3 forUser:(unsigned int)a4 accessoryGroup:(id)a5;
- (int)getLastMatchEvent:(id *)a3;
- (int)getPeriocularMatchState:(unsigned int)a3 state:(int64_t *)a4;
- (int)getPreferencesValue:(id *)a3 forKey:(id)a4;
- (int)initializeConnection;
- (int)isPeriocularEnrollmentSupported:(BOOL *)a3;
- (int)listAccessories:(id *)a3;
- (int)pauseFaceDetectTimer:(BOOL)a3;
- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5;
- (int)registerDSID:(unint64_t)a3 withOptions:(id)a4;
- (int)registerStoreToken:(id)a3;
- (int)resetAppleConnectCounter;
- (int)setPreferencesValue:(id)a3 forKey:(id)a4;
- (int)setTemplate:(id)a3 forIdentity:(id)a4;
- (int)setUserDSID:(unint64_t)a3 withOptions:(id)a4;
- (int)startNewMatchAttempt;
- (int)suspendEnrollment:(BOOL)a3;
- (int64_t)getDeviceState;
- (int64_t)getFreeIdentityCount:(int)a3 forUser:(unsigned int)a4;
- (int64_t)getMaxIdentityCount:(int)a3;
- (int64_t)getProvisioningState;
- (int64_t)getSensorCalibrationStatus;
- (unint64_t)clientID;
- (unint64_t)connectionId;
- (void)cancel;
- (void)dealloc;
- (void)detectPresenceWithOptions:(id)a3 async:(BOOL)a4 withReply:(id)a5;
- (void)disconnect;
- (void)enroll:(int)a3 forUser:(unsigned int)a4 withOptions:(id)a5 async:(BOOL)a6 withReply:(id)a7;
- (void)interruptConnection;
- (void)invalidateConnection;
- (void)logEventOrCode:(unint64_t)a3;
- (void)match:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6;
- (void)notifyAppIsBackground:(BOOL)a3;
- (void)notifyAppIsInactive:(BOOL)a3;
- (void)registerDelegate:(BOOL)a3;
- (void)registerDelegateCall:(BOOL)a3;
- (void)removeAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6;
- (void)removeIdentity:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6;
- (void)removePeriocularTemplatesWithOptions:(id)a3 async:(BOOL)a4 withReply:(id)a5;
- (void)setDebugImages:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 withOptions:(id)a5 async:(BOOL)a6 withReply:(id)a7;
- (void)setSystemProtectedConfiguration:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6;
- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4;
- (void)updateIdentity:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6;
@end

@implementation BiometricKitXPCClient

void __58__BiometricKitXPCClient_getProtectedConfigurationForUser___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getProtectedConfigurationForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    if (__osLog) {
      v12 = __osLog;
    }
    else {
      v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 1143;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v7 = [WeakRetained xpcConnection];
    v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_322];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__BiometricKitXPCClient_getProtectedConfigurationForUser___block_invoke_2;
    v13[3] = &unk_1E6067DF0;
    v13[4] = &v14;
    [v8 getProtectedConfigurationForUser:v3 client:v9 replyBlock:v13];
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (int)initializeConnection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connectionInterrupted)
  {
    v2->_connectionInterrupted = 0;
    v2->_connectionInitialized = 0;
  }
  else if (v2->_connectionInitialized)
  {
    goto LABEL_7;
  }
  if (v2->_connectionInvalidated)
  {
LABEL_7:
    int v3 = 0;
    goto LABEL_8;
  }
  int v3 = [(BiometricKitXPCClient *)v2 connect];
  if (v3)
  {
    if (__osLog) {
      v6 = __osLog;
    }
    else {
      v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      v8 = "err == 0 ";
      __int16 v9 = 2048;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      v12 = &unk_1B3B370EE;
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v15 = 1024;
      int v16 = 659;
      _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
    -[BiometricKitXPCClient registerDelegateCall:](v2, "registerDelegateCall:", [WeakRetained isDelegate]);

    int v3 = 0;
    v2->_connectionInitialized = 1;
  }
LABEL_8:
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)clientID
{
  return self->_clientID;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    _clientIDs = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    MEMORY[0x1F41817F8]();
  }
}

- (BiometricKitXPCClient)init
{
  if (isTouchIDPlatform())
  {
    uint64_t v3 = 1;
  }
  else if (isFaceIDPlatform())
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 0;
  }
  return [(BiometricKitXPCClient *)self initWithDeviceType:v3 clientType:1];
}

- (BiometricKitXPCClient)initWithDeviceType:(int64_t)a3 clientType:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v6 = +[BiometricKitXPCClientConnection connectionWithDeviceType:a3];
  if (!v6)
  {
    if (__osLog) {
      int v7 = __osLog;
    }
    else {
      int v7 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136316162;
    v21 = "0";
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    __int16 v24 = 2080;
    v25 = &unk_1B3B370EE;
    __int16 v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    __int16 v28 = 1024;
    int v29 = 526;
LABEL_13:
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_26;
  }
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    if (__osLog) {
      int v7 = __osLog;
    }
    else {
      int v7 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136316162;
    v21 = "0";
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    __int16 v24 = 2080;
    v25 = &unk_1B3B370EE;
    __int16 v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    __int16 v28 = 1024;
    int v29 = 531;
    goto LABEL_13;
  }
  v19.receiver = self;
  v19.super_class = (Class)BiometricKitXPCClient;
  self = [(BiometricKitXPCClient *)&v19 init];
  if (!self)
  {
    if (__osLog) {
      v18 = __osLog;
    }
    else {
      v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "self";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 536;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_30:
    self = self;
    uint64_t v14 = self;
    goto LABEL_27;
  }
  id v8 = (id)_clientIDs;
  objc_sync_enter(v8);
  uint64_t v9 = _clientIDIndex;
  unint64_t v10 = _clientIDIndex;
  while (!v10)
  {
LABEL_19:
    if (++v10 == v9)
    {
      if (__osLog) {
        __int16 v13 = __osLog;
      }
      else {
        __int16 v13 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "0";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2080;
        v25 = &unk_1B3B370EE;
        __int16 v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        __int16 v28 = 1024;
        int v29 = 544;
        _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      objc_sync_exit(v8);

      goto LABEL_26;
    }
  }
  __int16 v11 = (void *)_clientIDs;
  v12 = [NSNumber numberWithUnsignedLongLong:v10];
  LODWORD(v11) = [v11 containsObject:v12];

  if (v11)
  {
    uint64_t v9 = _clientIDIndex;
    goto LABEL_19;
  }
  int v16 = (void *)_clientIDs;
  uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v10];
  [v16 addObject:v17];

  self->_clientID = v10;
  _clientIDIndex = v10 + 1;
  objc_sync_exit(v8);

  self->_connectionID = arc4random();
  if ([v6 addClient:self])
  {
    objc_storeWeak((id *)&self->_connection, v6);
    self->_clientType = a4;
    goto LABEL_30;
  }
  if (__osLog) {
    int v7 = __osLog;
  }
  else {
    int v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v21 = "0";
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    __int16 v24 = 2080;
    v25 = &unk_1B3B370EE;
    __int16 v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    __int16 v28 = 1024;
    int v29 = 557;
    goto LABEL_13;
  }
LABEL_26:
  uint64_t v14 = 0;
LABEL_27:

  return v14;
}

- (void)dealloc
{
  [(BiometricKitXPCClient *)self invalidateConnection];
  id v3 = (id)_clientIDs;
  objc_sync_enter(v3);
  if (self->_clientID)
  {
    v4 = (void *)_clientIDs;
    int v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v4 removeObject:v5];
  }
  objc_sync_exit(v3);

  v6.receiver = self;
  v6.super_class = (Class)BiometricKitXPCClient;
  [(BiometricKitXPCClient *)&v6 dealloc];
}

- (unint64_t)connectionId
{
  return self->_connectionID;
}

- (void)invalidateConnection
{
  obj = self;
  objc_sync_enter(obj);
  id WeakRetained = objc_loadWeakRetained((id *)&obj->_connection);
  if (WeakRetained)
  {
    BOOL connectionInvalidated = obj->_connectionInvalidated;

    if (!connectionInvalidated)
    {
      if (obj->_connectionInitialized)
      {
        if (!obj->_connectionInterrupted) {
          [(BiometricKitXPCClient *)obj disconnect];
        }
        obj->_connectionInitialized = 0;
      }
      id v4 = objc_loadWeakRetained((id *)&obj->_connection);
      [v4 removeClient:obj];

      obj->_BOOL connectionInvalidated = 1;
    }
  }
  objc_sync_exit(obj);
}

- (void)interruptConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (__osLog) {
    id v3 = __osLog;
  }
  else {
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 134217984;
    unint64_t v9 = [(BiometricKitXPCClient *)self connectionId];
    _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::interruptConnection (_cid %lu)\n", buf, 0xCu);
  }
  self->_connectionInterrupted = 1;
  objc_initWeak((id *)buf, self);
  int v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BiometricKitXPCClient_interruptConnection__block_invoke;
  block[3] = &unk_1E6067AE0;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __44__BiometricKitXPCClient_interruptConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 6);
    [v2 connectionInterrupted];

    id WeakRetained = v3;
  }
}

- (int)connect
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  int v5 = [v4 bundleIdentifier];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"BKClientBundleIdentifier"];
  }
  objc_super v6 = NSNumber;
  id v7 = [MEMORY[0x1E4F28F80] processInfo];
  id v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  [v3 setObject:v8 forKeyedSubscript:@"BKClientProcessId"];

  unint64_t v9 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v10 = [v9 processName];
  [v3 setObject:v10 forKeyedSubscript:@"BKClientProcessName"];

  __int16 v11 = [NSNumber numberWithInteger:self->_clientType];
  [v3 setObject:v11 forKeyedSubscript:@"BKClientType"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BiometricKitXPCClient connectionId](self, "connectionId"));
  [v3 setObject:v12 forKeyedSubscript:@"BKClientConnectionId"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  uint64_t v14 = [WeakRetained xpcConnection];

  if (v14)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__BiometricKitXPCClient_connect__block_invoke;
    v21[3] = &unk_1E6067C48;
    v21[4] = &v22;
    __int16 v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v21];
    unint64_t v16 = [(BiometricKitXPCClient *)self clientID];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __32__BiometricKitXPCClient_connect__block_invoke_2;
    v20[3] = &unk_1E6067C70;
    v20[4] = &v22;
    [v15 connect:v3 client:v16 replyBlock:v20];

    int v17 = *((_DWORD *)v23 + 6);
  }
  else
  {
    if (__osLog) {
      objc_super v19 = __osLog;
    }
    else {
      objc_super v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "xcpConnection";
      __int16 v28 = 2048;
      uint64_t v29 = 0;
      __int16 v30 = 2080;
      v31 = &unk_1B3B370EE;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v34 = 1024;
      int v35 = 688;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v17 = 1;
    *((_DWORD *)v23 + 6) = 1;
  }

  _Block_object_dispose(&v22, 8);
  return v17;
}

uint64_t __32__BiometricKitXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __32__BiometricKitXPCClient_connect__block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 266)
  {
    if (isInternalBuild())
    {
      if (__osLog) {
        id v3 = __osLog;
      }
      else {
        id v3 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1B3AF1000, v3, OS_LOG_TYPE_ERROR, "Please adopt new BiometricKit entitlements (see rdar://105770455 for additional details)\n", v4, 2u);
      }
    }
    a2 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)disconnect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v3 = [WeakRetained xpcConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  objc_msgSend(v4, "disconnect:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_288);
}

- (void)registerDelegateCall:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  int v5 = [WeakRetained xpcConnection];
  objc_super v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_290];
  objc_msgSend(v6, "registerDelegate:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_292);
}

- (void)registerDelegate:(BOOL)a3
{
  if (self->_connectionInitialized)
  {
    [(BiometricKitXPCClient *)self registerDelegateCall:a3];
  }
  else if (a3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__BiometricKitXPCClient_registerDelegate___block_invoke;
    block[3] = &unk_1E6067CD8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __42__BiometricKitXPCClient_registerDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeConnection];
}

- (void)notifyAppIsBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  int v5 = [WeakRetained xpcConnection];
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_294];
  objc_msgSend(v6, "notifyAppIsBackground:client:", v3, -[BiometricKitXPCClient clientID](self, "clientID"));
}

- (void)notifyAppIsInactive:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  int v5 = [WeakRetained xpcConnection];
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_296];
  objc_msgSend(v6, "notifyAppIsInactive:client:", v3, -[BiometricKitXPCClient clientID](self, "clientID"));
}

- (void)enroll:(int)a3 forUser:(unsigned int)a4 withOptions:(id)a5 async:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  __int16 v13 = (void (**)(id, void))a7;
  int v14 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v14)
  {
    uint64_t v24 = v14;
    if (__osLog) {
      int v25 = __osLog;
    }
    else {
      int v25 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v35 = "status == 0 ";
      __int16 v36 = 2048;
      uint64_t v37 = v24;
      __int16 v38 = 2080;
      v39 = &unk_1B3B370EE;
      __int16 v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v42 = 1024;
      int v43 = 784;
      _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13[2](v13, v24);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v16 = [WeakRetained xpcConnection];
    if (v8)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke;
      v32[3] = &unk_1E6067D00;
      int v17 = v13;
      id v33 = v17;
      v18 = [v16 remoteObjectProxyWithErrorHandler:v32];
      unint64_t v19 = [(BiometricKitXPCClient *)self clientID];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_2;
      v30[3] = &unk_1E6067D28;
      v31 = v17;
      [v18 enroll:v10 user:v9 options:v12 async:1 client:v19 replyBlock:v30];

      v20 = v33;
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_3;
      v28[3] = &unk_1E6067D00;
      v21 = v13;
      id v29 = v21;
      uint64_t v22 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v28];
      unint64_t v23 = [(BiometricKitXPCClient *)self clientID];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_4;
      v26[3] = &unk_1E6067D28;
      v27 = v21;
      [v22 enroll:v10 user:v9 options:v12 async:0 client:v23 replyBlock:v26];

      v20 = v29;
    }
  }
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)match:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  int v13 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v13)
  {
    uint64_t v23 = v13;
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v34 = "status == 0 ";
      __int16 v35 = 2048;
      uint64_t v36 = v23;
      __int16 v37 = 2080;
      __int16 v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v41 = 1024;
      int v42 = 816;
      _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v23);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    __int16 v15 = [WeakRetained xpcConnection];
    if (v7)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke;
      v31[3] = &unk_1E6067D00;
      unint64_t v16 = v12;
      id v32 = v16;
      int v17 = [v15 remoteObjectProxyWithErrorHandler:v31];
      unint64_t v18 = [(BiometricKitXPCClient *)self clientID];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_2;
      v29[3] = &unk_1E6067D28;
      __int16 v30 = v16;
      [v17 match:v10 options:v11 async:1 client:v18 replyBlock:v29];

      unint64_t v19 = v32;
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_3;
      v27[3] = &unk_1E6067D00;
      v20 = v12;
      id v28 = v20;
      v21 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v27];
      unint64_t v22 = [(BiometricKitXPCClient *)self clientID];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_4;
      v25[3] = &unk_1E6067D28;
      __int16 v26 = v20;
      [v21 match:v10 options:v11 async:0 client:v22 replyBlock:v25];

      unint64_t v19 = v28;
    }
  }
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)detectPresenceWithOptions:(id)a3 async:(BOOL)a4 withReply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  int v10 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v10)
  {
    uint64_t v20 = v10;
    if (__osLog) {
      v21 = __osLog;
    }
    else {
      v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v31 = "status == 0 ";
      __int16 v32 = 2048;
      uint64_t v33 = v20;
      __int16 v34 = 2080;
      __int16 v35 = &unk_1B3B370EE;
      __int16 v36 = 2080;
      __int16 v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v38 = 1024;
      int v39 = 848;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9[2](v9, v20);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v12 = [WeakRetained xpcConnection];
    if (v6)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke;
      v28[3] = &unk_1E6067D00;
      int v13 = v9;
      id v29 = v13;
      int v14 = [v12 remoteObjectProxyWithErrorHandler:v28];
      unint64_t v15 = [(BiometricKitXPCClient *)self clientID];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_2;
      v26[3] = &unk_1E6067D28;
      v27 = v13;
      [v14 detectPresenceWithOptions:v8 async:1 client:v15 replyBlock:v26];

      unint64_t v16 = v29;
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_3;
      v24[3] = &unk_1E6067D00;
      int v17 = v9;
      id v25 = v17;
      unint64_t v18 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v24];
      unint64_t v19 = [(BiometricKitXPCClient *)self clientID];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_4;
      v22[3] = &unk_1E6067D28;
      uint64_t v23 = v17;
      [v18 detectPresenceWithOptions:v8 async:0 client:v19 replyBlock:v22];

      unint64_t v16 = v25;
    }
  }
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    int v6 = v3;
    if (__osLog) {
      BOOL v7 = __osLog;
    }
    else {
      BOOL v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v10 = "[self initializeConnection] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      int v14 = &unk_1B3B370EE;
      __int16 v15 = 2080;
      unint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v17 = 1024;
      int v18 = 877;
      _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v4 = [WeakRetained xpcConnection];
    int v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_300];
    objc_msgSend(v5, "cancel:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_302);
  }
}

- (void)updateIdentity:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  int v13 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v13)
  {
    uint64_t v23 = v13;
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v34 = "status == 0 ";
      __int16 v35 = 2048;
      uint64_t v36 = v23;
      __int16 v37 = 2080;
      __int16 v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      uint64_t v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v41 = 1024;
      int v42 = 894;
      _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v23);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    __int16 v15 = [WeakRetained xpcConnection];
    if (v7)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke;
      v31[3] = &unk_1E6067D00;
      unint64_t v16 = v12;
      id v32 = v16;
      __int16 v17 = [v15 remoteObjectProxyWithErrorHandler:v31];
      unint64_t v18 = [(BiometricKitXPCClient *)self clientID];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_2;
      v29[3] = &unk_1E6067D28;
      __int16 v30 = v16;
      [v17 updateIdentity:v10 options:v11 async:1 client:v18 replyBlock:v29];

      uint64_t v19 = v32;
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_3;
      v27[3] = &unk_1E6067D00;
      uint64_t v20 = v12;
      id v28 = v20;
      v21 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v27];
      unint64_t v22 = [(BiometricKitXPCClient *)self clientID];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_4;
      v25[3] = &unk_1E6067D28;
      __int16 v26 = v20;
      [v21 updateIdentity:v10 options:v11 async:0 client:v22 replyBlock:v25];

      uint64_t v19 = v28;
    }
  }
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeIdentity:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  int v13 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v13)
  {
    uint64_t v23 = v13;
    if (__osLog) {
      uint64_t v24 = __osLog;
    }
    else {
      uint64_t v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v34 = "status == 0 ";
      __int16 v35 = 2048;
      uint64_t v36 = v23;
      __int16 v37 = 2080;
      __int16 v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      uint64_t v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v41 = 1024;
      int v42 = 926;
      _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v23);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    __int16 v15 = [WeakRetained xpcConnection];
    if (v7)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke;
      v31[3] = &unk_1E6067D00;
      unint64_t v16 = v12;
      id v32 = v16;
      __int16 v17 = [v15 remoteObjectProxyWithErrorHandler:v31];
      unint64_t v18 = [(BiometricKitXPCClient *)self clientID];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_2;
      v29[3] = &unk_1E6067D28;
      __int16 v30 = v16;
      [v17 removeIdentity:v10 options:v11 async:1 client:v18 replyBlock:v29];

      uint64_t v19 = v32;
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_3;
      v27[3] = &unk_1E6067D00;
      uint64_t v20 = v12;
      id v28 = v20;
      v21 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v27];
      unint64_t v22 = [(BiometricKitXPCClient *)self clientID];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_4;
      v25[3] = &unk_1E6067D28;
      __int16 v26 = v20;
      [v21 removeIdentity:v10 options:v11 async:0 client:v22 replyBlock:v25];

      uint64_t v19 = v28;
    }
  }
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = (void (**)(id, void))a6;
  int v12 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v12)
  {
    uint64_t v22 = v12;
    if (__osLog) {
      uint64_t v23 = __osLog;
    }
    else {
      uint64_t v23 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "status == 0 ";
      __int16 v34 = 2048;
      uint64_t v35 = v22;
      __int16 v36 = 2080;
      __int16 v37 = &unk_1B3B370EE;
      __int16 v38 = 2080;
      __int16 v39 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v40 = 1024;
      int v41 = 958;
      _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11[2](v11, v22);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v14 = [WeakRetained xpcConnection];
    if (v7)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke;
      v30[3] = &unk_1E6067D00;
      __int16 v15 = v11;
      id v31 = v15;
      unint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v30];
      unint64_t v17 = [(BiometricKitXPCClient *)self clientID];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_2;
      v28[3] = &unk_1E6067D28;
      id v29 = v15;
      [v16 removeAllIdentitiesForUser:v8 options:v10 async:1 client:v17 replyBlock:v28];

      unint64_t v18 = v31;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_3;
      v26[3] = &unk_1E6067D00;
      uint64_t v19 = v11;
      id v27 = v19;
      uint64_t v20 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v26];
      unint64_t v21 = [(BiometricKitXPCClient *)self clientID];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_4;
      v24[3] = &unk_1E6067D28;
      id v25 = v19;
      [v20 removeAllIdentitiesForUser:v8 options:v10 async:0 client:v21 replyBlock:v24];

      unint64_t v18 = v27;
    }
  }
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getIdentityFromUUID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = __Block_byref_object_copy_;
  unint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      unint64_t v21 = "[self initializeConnection] == 0 ";
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      id v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      id v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 989;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    BOOL v7 = [WeakRetained xpcConnection];
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_304];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__BiometricKitXPCClient_getIdentityFromUUID___block_invoke_2;
    v13[3] = &unk_1E6067D50;
    v13[4] = &v14;
    [v8 getIdentityFromUUID:v4 client:v9 replyBlock:v13];
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __45__BiometricKitXPCClient_getIdentityFromUUID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)identities:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = __Block_byref_object_copy_;
  unint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      unint64_t v21 = "[self initializeConnection] == 0 ";
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      id v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      id v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 1008;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    BOOL v7 = [WeakRetained xpcConnection];
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_307];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__BiometricKitXPCClient_identities___block_invoke_2;
    v13[3] = &unk_1E6067D78;
    v13[4] = &v14;
    [v8 identities:v4 client:v9 replyBlock:v13];
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __36__BiometricKitXPCClient_identities___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)getMaxIdentityCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v5;
      __int16 v22 = 2080;
      uint64_t v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      id v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1027;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    BOOL v7 = [WeakRetained xpcConnection];
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_310];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__BiometricKitXPCClient_getMaxIdentityCount___block_invoke_2;
    v13[3] = &unk_1E6067DA0;
    v13[4] = &v14;
    [v8 getMaxIdentityCount:v3 client:v9 replyBlock:v13];
  }
  int64_t v10 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __45__BiometricKitXPCClient_getMaxIdentityCount___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)getFreeIdentityCount:(int)a3 forUser:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v7)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "[self initializeConnection] == 0 ";
      __int16 v22 = 2048;
      uint64_t v23 = v7;
      __int16 v24 = 2080;
      id v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 1046;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v9 = [WeakRetained xpcConnection];
    int64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_313];
    unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__BiometricKitXPCClient_getFreeIdentityCount_forUser___block_invoke_2;
    v15[3] = &unk_1E6067DA0;
    v15[4] = &v16;
    [v10 getFreeIdentityCount:v5 user:v4 client:v11 replyBlock:v15];
  }
  int64_t v12 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v12;
}

uint64_t __54__BiometricKitXPCClient_getFreeIdentityCount_forUser___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)enrollContinue
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog) {
      int64_t v10 = __osLog;
    }
    else {
      int64_t v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "status == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v25 = 1024;
      int v26 = 1066;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v5 = [WeakRetained xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__BiometricKitXPCClient_enrollContinue__block_invoke;
    v12[3] = &unk_1E6067C48;
    v12[4] = &v13;
    int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__BiometricKitXPCClient_enrollContinue__block_invoke_2;
    v11[3] = &unk_1E6067C70;
    v11[4] = &v13;
    [v6 enrollContinue:v7 replyBlock:v11];
  }
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __39__BiometricKitXPCClient_enrollContinue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __39__BiometricKitXPCClient_enrollContinue__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)pullAlignmentData
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  int v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int64_t v10 = __osLog;
    }
    else {
      int64_t v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      __int16 v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1086;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v5 = [WeakRetained xpcConnection];
    int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_315];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__BiometricKitXPCClient_pullAlignmentData__block_invoke_2;
    v11[3] = &unk_1E6067DC8;
    v11[4] = &v12;
    [v6 pullAlignmentData:v7 replyBlock:v11];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __42__BiometricKitXPCClient_pullAlignmentData__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)pullMatchPolicyInfoData
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  int v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int64_t v10 = __osLog;
    }
    else {
      int64_t v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      __int16 v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1105;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v5 = [WeakRetained xpcConnection];
    int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_318];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__BiometricKitXPCClient_pullMatchPolicyInfoData__block_invoke_2;
    v11[3] = &unk_1E6067DC8;
    v11[4] = &v12;
    [v6 pullMatchPolicyInfoData:v7 replyBlock:v11];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __48__BiometricKitXPCClient_pullMatchPolicyInfoData__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getNodeTopologyForIdentity:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "[self initializeConnection] == 0 ";
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      __int16 v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 1124;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v7 = [WeakRetained xpcConnection];
    id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_320];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__BiometricKitXPCClient_getNodeTopologyForIdentity___block_invoke_2;
    v13[3] = &unk_1E6067DC8;
    v13[4] = &v14;
    [v8 getNodeTopologyForIdentity:v4 client:v9 replyBlock:v13];
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __52__BiometricKitXPCClient_getNodeTopologyForIdentity___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getSystemProtectedConfiguration
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      uint64_t v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1162;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_325];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__BiometricKitXPCClient_getSystemProtectedConfiguration__block_invoke_2;
    v11[3] = &unk_1E6067DF0;
    v11[4] = &v12;
    [v6 getSystemProtectedConfiguration:v7 replyBlock:v11];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __56__BiometricKitXPCClient_getSystemProtectedConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 withOptions:(id)a5 async:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void))a7;
  int v15 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v15)
  {
    uint64_t v25 = v15;
    if (__osLog) {
      __int16 v26 = __osLog;
    }
    else {
      __int16 v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v36 = "status == 0 ";
      __int16 v37 = 2048;
      uint64_t v38 = v25;
      __int16 v39 = 2080;
      __int16 v40 = &unk_1B3B370EE;
      __int16 v41 = 2080;
      uint64_t v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v43 = 1024;
      int v44 = 1182;
      _os_log_impl(&dword_1B3AF1000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v14[2](v14, v25);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v17 = [WeakRetained xpcConnection];
    if (v8)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke;
      v33[3] = &unk_1E6067D00;
      uint64_t v18 = v14;
      id v34 = v18;
      id v19 = [v17 remoteObjectProxyWithErrorHandler:v33];
      unint64_t v20 = [(BiometricKitXPCClient *)self clientID];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_2;
      v31[3] = &unk_1E6067D28;
      id v32 = v18;
      [v19 setProtectedConfiguration:v12 user:v10 options:v13 async:1 client:v20 replyBlock:v31];

      uint64_t v21 = v34;
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_3;
      v29[3] = &unk_1E6067D00;
      __int16 v22 = v14;
      id v30 = v22;
      uint64_t v23 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v29];
      unint64_t v24 = [(BiometricKitXPCClient *)self clientID];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_4;
      v27[3] = &unk_1E6067D28;
      uint64_t v28 = v22;
      [v23 setProtectedConfiguration:v12 user:v10 options:v13 async:0 client:v24 replyBlock:v27];

      uint64_t v21 = v30;
    }
  }
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSystemProtectedConfiguration:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  int v13 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v13)
  {
    uint64_t v23 = v13;
    if (__osLog) {
      unint64_t v24 = __osLog;
    }
    else {
      unint64_t v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v34 = "status == 0 ";
      __int16 v35 = 2048;
      uint64_t v36 = v23;
      __int16 v37 = 2080;
      uint64_t v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v41 = 1024;
      int v42 = 1214;
      _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v23);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v15 = [WeakRetained xpcConnection];
    if (v7)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke;
      v31[3] = &unk_1E6067D00;
      uint64_t v16 = v12;
      id v32 = v16;
      id v17 = [v15 remoteObjectProxyWithErrorHandler:v31];
      unint64_t v18 = [(BiometricKitXPCClient *)self clientID];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_2;
      v29[3] = &unk_1E6067D28;
      id v30 = v16;
      [v17 setSystemProtectedConfiguration:v10 options:v11 async:1 client:v18 replyBlock:v29];

      id v19 = v32;
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_3;
      v27[3] = &unk_1E6067D00;
      unint64_t v20 = v12;
      id v28 = v20;
      uint64_t v21 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v27];
      unint64_t v22 = [(BiometricKitXPCClient *)self clientID];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_4;
      v25[3] = &unk_1E6067D28;
      __int16 v26 = v20;
      [v21 setSystemProtectedConfiguration:v10 options:v11 async:0 client:v22 replyBlock:v25];

      id v19 = v28;
    }
  }
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    int v7 = [(BiometricKitXPCClient *)self initializeConnection];
    *((_DWORD *)v19 + 6) = v7;
    if (v7)
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = "status == 0 ";
        __int16 v24 = 2048;
        uint64_t v25 = v7;
        __int16 v26 = 2080;
        int v27 = &unk_1B3B370EE;
        __int16 v28 = 2080;
        int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        __int16 v30 = 1024;
        int v31 = 1248;
        _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      unint64_t v9 = [WeakRetained xpcConnection];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke;
      v17[3] = &unk_1E6067C48;
      v17[4] = &v18;
      id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v17];
      unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke_2;
      v16[3] = &unk_1E6067E18;
      v16[4] = &v18;
      v16[5] = a3;
      [v10 getBioLockoutStateForUser:v4 client:v11 replyBlock:v16];
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = "state";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = &unk_1B3B370EE;
      __int16 v28 = 2080;
      int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v30 = 1024;
      int v31 = 1245;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v19 + 6) = 22;
  }
  int v12 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(result + 40);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *uint64_t v3 = a3;
  return result;
}

- (int)getExpressModeState:(int64_t *)a3 forUser:(unsigned int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    int v7 = [(BiometricKitXPCClient *)self initializeConnection];
    *((_DWORD *)v19 + 6) = v7;
    if (v7)
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = "status == 0 ";
        __int16 v24 = 2048;
        uint64_t v25 = v7;
        __int16 v26 = 2080;
        int v27 = &unk_1B3B370EE;
        __int16 v28 = 2080;
        int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        __int16 v30 = 1024;
        int v31 = 1272;
        _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      unint64_t v9 = [WeakRetained xpcConnection];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke;
      v17[3] = &unk_1E6067C48;
      v17[4] = &v18;
      id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v17];
      unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke_2;
      v16[3] = &unk_1E6067E18;
      v16[4] = &v18;
      v16[5] = a3;
      [v10 getExpressModeStateForUser:v4 client:v11 replyBlock:v16];
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = "state";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = &unk_1B3B370EE;
      __int16 v28 = 2080;
      int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v30 = 1024;
      int v31 = 1269;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v19 + 6) = 22;
  }
  int v12 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(result + 40);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *uint64_t v3 = a3;
  return result;
}

- (int64_t)getProvisioningState
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v17 = "[self initializeConnection] == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      int v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v24 = 1024;
      int v25 = 1293;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_329];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__BiometricKitXPCClient_getProvisioningState__block_invoke_2;
    v11[3] = &unk_1E6067DA0;
    v11[4] = &v12;
    [v6 getProvisioningState:v7 replyBlock:v11];
  }
  int64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __45__BiometricKitXPCClient_getProvisioningState__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)dropUnlockToken
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = "status == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v25 = 1024;
      int v26 = 1313;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__BiometricKitXPCClient_dropUnlockToken__block_invoke;
    v12[3] = &unk_1E6067C48;
    v12[4] = &v13;
    int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__BiometricKitXPCClient_dropUnlockToken__block_invoke_2;
    v11[3] = &unk_1E6067C70;
    v11[4] = &v13;
    [v6 dropUnlockToken:v7 replyBlock:v11];
  }
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __40__BiometricKitXPCClient_dropUnlockToken__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __40__BiometricKitXPCClient_dropUnlockToken__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)forceBioLockoutForUser:(unsigned int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v22 = "status == 0 ";
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2080;
      int v26 = &unk_1B3B370EE;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v29 = 1024;
      int v30 = 1334;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v9 = [WeakRetained xpcConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke;
    v16[3] = &unk_1E6067C48;
    v16[4] = &v17;
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
    unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke_2;
    v15[3] = &unk_1E6067C70;
    v15[4] = &v17;
    [v10 forceBioLockoutForUser:v4 options:v6 client:v11 replyBlock:v15];
  }
  int v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)registerDSID:(unint64_t)a3 withOptions:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v22 = "err == 0 ";
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2080;
      int v26 = &unk_1B3B370EE;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v29 = 1024;
      int v30 = 1357;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v9 = [WeakRetained xpcConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke;
    v16[3] = &unk_1E6067C48;
    v16[4] = &v17;
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
    unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke_2;
    v15[3] = &unk_1E6067C70;
    v15[4] = &v17;
    [v10 registerDSID:a3 options:v6 client:v11 replyBlock:v15];
  }
  int v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)resetAppleConnectCounter
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = "status == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v25 = 1024;
      int v26 = 1378;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke;
    v12[3] = &unk_1E6067C48;
    v12[4] = &v13;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke_2;
    v11[3] = &unk_1E6067C70;
    v11[4] = &v13;
    [v6 resetAppleConnectCounter:v7 replyBlock:v11];
  }
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)registerStoreToken:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = "err == 0 ";
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      uint64_t v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v27 = 1024;
      int v28 = 1399;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__BiometricKitXPCClient_registerStoreToken___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v15;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__BiometricKitXPCClient_registerStoreToken___block_invoke_2;
    v13[3] = &unk_1E6067C70;
    v13[4] = &v15;
    [v8 registerStoreToken:v4 client:v9 replyBlock:v13];
  }
  int v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __44__BiometricKitXPCClient_registerStoreToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __44__BiometricKitXPCClient_registerStoreToken___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)getCountersignedStoreToken:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy_;
  __int16 v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v22 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v26 = "err == 0 ";
      __int16 v27 = 2048;
      uint64_t v28 = v5;
      __int16 v29 = 2080;
      int v30 = &unk_1B3B370EE;
      __int16 v31 = 2080;
      uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v33 = 1024;
      int v34 = 1421;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v21;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke_2;
    v13[3] = &unk_1E6067E40;
    v13[4] = &v21;
    void v13[5] = &v15;
    [v8 getCountersignedStoreToken:v9 replyBlock:v13];

    if (a3) {
      *a3 = (id) v16[5];
    }
  }
  int v10 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke_2(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  int v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "[self initializeConnection] == 0 ";
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      __int16 v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 1444;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v7 = [WeakRetained xpcConnection];
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_332];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__BiometricKitXPCClient_getIdentitiesDatabaseUUIDForUser___block_invoke_2;
    v13[3] = &unk_1E6067E68;
    v13[4] = &v14;
    [v8 getIdentitiesDatabaseUUIDForUser:v3 client:v9 replyBlock:v13];
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __58__BiometricKitXPCClient_getIdentitiesDatabaseUUIDForUser___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getIdentitiesDatabaseHashForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  int v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "[self initializeConnection] == 0 ";
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      __int16 v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 1463;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v7 = [WeakRetained xpcConnection];
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_335];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__BiometricKitXPCClient_getIdentitiesDatabaseHashForUser___block_invoke_2;
    v13[3] = &unk_1E6067DC8;
    v13[4] = &v14;
    [v8 getIdentitiesDatabaseHashForUser:v3 client:v9 replyBlock:v13];
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __58__BiometricKitXPCClient_getIdentitiesDatabaseHashForUser___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int)diagnostics:(int)a3 withOptions:(id)a4 passed:(BOOL *)a5 withDetails:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy_;
  __int16 v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  int v11 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v32 + 6) = v11;
  if (v11)
  {
    if (__osLog) {
      int v18 = __osLog;
    }
    else {
      int v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v36 = "err == 0 ";
      __int16 v37 = 2048;
      uint64_t v38 = v11;
      __int16 v39 = 2080;
      __int16 v40 = &unk_1B3B370EE;
      __int16 v41 = 2080;
      int v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v43 = 1024;
      int v44 = 1486;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v13 = [WeakRetained xpcConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke;
    v20[3] = &unk_1E6067C48;
    v20[4] = &v31;
    uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];
    unint64_t v15 = [(BiometricKitXPCClient *)self clientID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke_2;
    v19[3] = &unk_1E6067E90;
    v19[4] = &v31;
    v19[5] = &v27;
    v19[6] = &v21;
    [v14 diagnostics:v8 options:v10 client:v15 replyBlock:v19];

    if (a5) {
      *a5 = *((unsigned char *)v28 + 24);
    }
    if (a6) {
      *a6 = (id) v22[5];
    }
  }
  int v16 = *((_DWORD *)v32 + 6);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

uint64_t __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke_2(void *a1, int a2, char a3, id obj)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v7)
  {
    int v10 = v7;
    if (__osLog) {
      int v11 = __osLog;
    }
    else {
      int v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = "[self initializeConnection] == 0 ";
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      int v18 = &unk_1B3B370EE;
      __int16 v19 = 2080;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v21 = 1024;
      int v22 = 1509;
      _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v8 = [WeakRetained xpcConnection];
    unint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_338];
    objc_msgSend(v9, "timestampEvent:absoluteTime:client:replyBlock:", a3, a4, -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_340);
  }
}

- (int)setUserDSID:(unint64_t)a3 withOptions:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v22 = "err == 0 ";
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2080;
      id v26 = &unk_1B3B370EE;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v29 = 1024;
      int v30 = 1528;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v9 = [WeakRetained xpcConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke;
    v16[3] = &unk_1E6067C48;
    v16[4] = &v17;
    int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
    unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke_2;
    v15[3] = &unk_1E6067C70;
    v15[4] = &v17;
    [v10 setUserDSID:a3 options:v6 client:v11 replyBlock:v15];
  }
  int v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)getSensorCalibrationStatus
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "[self initializeConnection] == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      __int16 v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v24 = 1024;
      int v25 = 1548;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_342];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__BiometricKitXPCClient_getSensorCalibrationStatus__block_invoke_2;
    v11[3] = &unk_1E6067DA0;
    v11[4] = &v12;
    [v6 getSensorCalibrationStatus:v7 replyBlock:v11];
  }
  int64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __51__BiometricKitXPCClient_getSensorCalibrationStatus__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)getCalibrationDataInfo
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      __int16 v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1568;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_344];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__BiometricKitXPCClient_getCalibrationDataInfo__block_invoke_2;
    v11[3] = &unk_1E6067DC8;
    v11[4] = &v12;
    [v6 getCalibrationDataInfo:v7 replyBlock:v11];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __47__BiometricKitXPCClient_getCalibrationDataInfo__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getSensorInfo
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      __int16 v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1587;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_346];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__BiometricKitXPCClient_getSensorInfo__block_invoke_2;
    v11[3] = &unk_1E6067DC8;
    v11[4] = &v12;
    [v6 getSensorInfo:v7 replyBlock:v11];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __38__BiometricKitXPCClient_getSensorInfo__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)pullCalibrationData
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      __int16 v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1606;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_348];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__BiometricKitXPCClient_pullCalibrationData__block_invoke_2;
    v11[3] = &unk_1E6067DC8;
    v11[4] = &v12;
    [v6 pullCalibrationData:v7 replyBlock:v11];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __44__BiometricKitXPCClient_pullCalibrationData__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)pullCaptureBuffer
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = "[self initializeConnection] == 0 ";
      __int16 v20 = 2048;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      __int16 v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v26 = 1024;
      int v27 = 1625;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_350];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__BiometricKitXPCClient_pullCaptureBuffer__block_invoke_2;
    v11[3] = &unk_1E6067DC8;
    v11[4] = &v12;
    [v6 pullCaptureBuffer:v7 replyBlock:v11];
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __42__BiometricKitXPCClient_pullCaptureBuffer__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 imageWidth:(unsigned int *)a5 imageHeight:(unsigned int *)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy_;
  __int16 v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  int v11 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v11)
  {
    if (__osLog) {
      __int16 v18 = __osLog;
    }
    else {
      __int16 v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v27 = "[self initializeConnection] == 0 ";
      __int16 v28 = 2048;
      uint64_t v29 = v11;
      __int16 v30 = 2080;
      uint64_t v31 = &unk_1B3B370EE;
      __int16 v32 = 2080;
      uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v34 = 1024;
      int v35 = 1644;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v13 = [WeakRetained xpcConnection];
    uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_352];
    unint64_t v15 = [(BiometricKitXPCClient *)self clientID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__BiometricKitXPCClient_pullDebugImageData_rotated_imageWidth_imageHeight___block_invoke_2;
    v19[3] = &unk_1E6067EB8;
    v19[4] = &v20;
    v19[5] = a5;
    v19[6] = a6;
    [v14 pullDebugImageData:v9 rotated:v8 client:v15 replyBlock:v19];
  }
  id v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v16;
}

void __75__BiometricKitXPCClient_pullDebugImageData_rotated_imageWidth_imageHeight___block_invoke_2(void *a1, void *a2, int a3, int a4)
{
  id v10 = a2;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  BOOL v8 = (_DWORD *)a1[5];
  if (v8) {
    _DWORD *v8 = a3;
  }
  BOOL v9 = (_DWORD *)a1[6];
  if (v9) {
    *BOOL v9 = a4;
  }
}

- (void)setDebugImages:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    int v8 = v5;
    if (__osLog) {
      BOOL v9 = __osLog;
    }
    else {
      BOOL v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = "[self initializeConnection] == 0 ";
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      id v16 = &unk_1B3B370EE;
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v19 = 1024;
      int v20 = 1663;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v6 = [WeakRetained xpcConnection];
    unint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_355];
    objc_msgSend(v7, "setDebugImages:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_357);
  }
}

- (id)getLogs:(BOOL)a3 withDetails:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  __int16 v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy_;
  int v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v7)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v29 = "[self initializeConnection] == 0 ";
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      __int16 v32 = 2080;
      uint64_t v33 = &unk_1B3B370EE;
      __int16 v34 = 2080;
      int v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v36 = 1024;
      int v37 = 1681;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    BOOL v9 = [WeakRetained xpcConnection];
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_359];
    unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__BiometricKitXPCClient_getLogs_withDetails___block_invoke_2;
    v15[3] = &unk_1E6067EE0;
    v15[4] = &v22;
    void v15[5] = &v16;
    [v10 getLogs:v5 client:v11 replyBlock:v15];

    if (a4) {
      *a4 = (id) v17[5];
    }
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __45__BiometricKitXPCClient_getLogs_withDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  int v8 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v8)
  {
    if (__osLog) {
      __int16 v15 = __osLog;
    }
    else {
      __int16 v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = "[self initializeConnection] == 0 ";
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      __int16 v25 = 2080;
      __int16 v26 = &unk_1B3B370EE;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v29 = 1024;
      int v30 = 1702;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v10 = [WeakRetained xpcConnection];
    id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_362];
    unint64_t v12 = [(BiometricKitXPCClient *)self clientID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__BiometricKitXPCClient_fileRadarWithLogs_withDescription___block_invoke_2;
    v16[3] = &unk_1E6067F08;
    v16[4] = &v17;
    [v11 fileRadarWithLogs:v6 description:v7 client:v12 replyBlock:v16];
  }
  BOOL v13 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  return v13;
}

uint64_t __59__BiometricKitXPCClient_fileRadarWithLogs_withDescription___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isFingerOn
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "[self initializeConnection] == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      id v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v24 = 1024;
      int v25 = 1721;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_365];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__BiometricKitXPCClient_isFingerOn__block_invoke_2;
    v11[3] = &unk_1E6067F08;
    v11[4] = &v12;
    [v6 isFingerOn:v7 replyBlock:v11];
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __35__BiometricKitXPCClient_isFingerOn__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)enableBackgroundFdet:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v20 = "status == 0 ";
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      __int16 v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v27 = 1024;
      int v28 = 1741;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v15;
    char v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke_2;
    v13[3] = &unk_1E6067C70;
    v13[4] = &v15;
    [v8 enableBackgroundFdet:v3 client:v9 replyBlock:v13];
  }
  int v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAriadneSignpostsEnabled
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "[self initializeConnection] == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      __int16 v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v24 = 1024;
      int v25 = 1761;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_367];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__BiometricKitXPCClient_isAriadneSignpostsEnabled__block_invoke_2;
    v11[3] = &unk_1E6067F08;
    v11[4] = &v12;
    [v6 isAriadneSignpostsEnabled:v7 replyBlock:v11];
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __50__BiometricKitXPCClient_isAriadneSignpostsEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isXARTAvailable
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "[self initializeConnection] == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      __int16 v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v24 = 1024;
      int v25 = 1780;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_369];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__BiometricKitXPCClient_isXARTAvailable__block_invoke_2;
    v11[3] = &unk_1E6067F08;
    v11[4] = &v12;
    [v6 isXARTAvailable:v7 replyBlock:v11];
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __40__BiometricKitXPCClient_isXARTAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)getDeviceState
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "[self initializeConnection] == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      __int16 v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v24 = 1024;
      int v25 = 1799;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_371];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__BiometricKitXPCClient_getDeviceState__block_invoke_2;
    v11[3] = &unk_1E6067DA0;
    v11[4] = &v12;
    [v6 getDeviceState:v7 replyBlock:v11];
  }
  int64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __39__BiometricKitXPCClient_getDeviceState__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)startNewMatchAttempt
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = "status == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v25 = 1024;
      int v26 = 1819;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke;
    v12[3] = &unk_1E6067C48;
    v12[4] = &v13;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke_2;
    v11[3] = &unk_1E6067C70;
    v11[4] = &v13;
    [v6 startNewMatchAttempt:v7 replyBlock:v11];
  }
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)getBiometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v22 = "status == 0 ";
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2080;
      int v26 = &unk_1B3B370EE;
      __int16 v27 = 2080;
      int v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v29 = 1024;
      int v30 = 1840;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v9 = [WeakRetained xpcConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke;
    v16[3] = &unk_1E6067C48;
    v16[4] = &v17;
    int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
    unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke_2;
    v15[3] = &unk_1E6067E18;
    v15[4] = &v17;
    void v15[5] = a3;
    [v10 getBiometryAvailabilityForUser:v4 client:v11 replyBlock:v15];
  }
  int v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  int v3 = *(void **)(result + 40);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (v3) {
    *int v3 = a3;
  }
  return result;
}

- (int)completeEnrollment
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  int v3 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = "status == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v3;
      __int16 v21 = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v25 = 1024;
      int v26 = 1862;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v5 = [WeakRetained xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__BiometricKitXPCClient_completeEnrollment__block_invoke;
    v12[3] = &unk_1E6067C48;
    v12[4] = &v13;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
    unint64_t v7 = [(BiometricKitXPCClient *)self clientID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__BiometricKitXPCClient_completeEnrollment__block_invoke_2;
    v11[3] = &unk_1E6067C70;
    v11[4] = &v13;
    [v6 completeEnrollment:v7 replyBlock:v11];
  }
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __43__BiometricKitXPCClient_completeEnrollment__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __43__BiometricKitXPCClient_completeEnrollment__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)suspendEnrollment:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = "status == 0 ";
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      uint64_t v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v27 = 1024;
      int v28 = 1883;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__BiometricKitXPCClient_suspendEnrollment___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v15;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__BiometricKitXPCClient_suspendEnrollment___block_invoke_2;
    v13[3] = &unk_1E6067C70;
    v13[4] = &v15;
    [v8 suspendEnrollment:v3 client:v9 replyBlock:v13];
  }
  int v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __43__BiometricKitXPCClient_suspendEnrollment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __43__BiometricKitXPCClient_suspendEnrollment___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)setTemplate:(id)a3 forIdentity:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  int v8 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v19 + 6) = v8;
  if (v8)
  {
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v23 = "status == 0 ";
      __int16 v24 = 2048;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      __int16 v27 = &unk_1B3B370EE;
      __int16 v28 = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v30 = 1024;
      int v31 = 1904;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v10 = [WeakRetained xpcConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke;
    v17[3] = &unk_1E6067C48;
    v17[4] = &v18;
    unint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];
    unint64_t v12 = [(BiometricKitXPCClient *)self clientID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke_2;
    v16[3] = &unk_1E6067C70;
    v16[4] = &v18;
    [v11 setTemplate:v6 forIdentity:v7 client:v12 replyBlock:v16];
  }
  int v13 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);

  return v13;
}

uint64_t __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)isPeriocularEnrollmentSupported:(BOOL *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  if (a3)
  {
    int v5 = [(BiometricKitXPCClient *)self initializeConnection];
    *((_DWORD *)v17 + 6) = v5;
    if (v5)
    {
      if (__osLog) {
        int v13 = __osLog;
      }
      else {
        int v13 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v21 = "status == 0 ";
        __int16 v22 = 2048;
        uint64_t v23 = v5;
        __int16 v24 = 2080;
        uint64_t v25 = &unk_1B3B370EE;
        __int16 v26 = 2080;
        __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        __int16 v28 = 1024;
        int v29 = 1929;
        _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      id v7 = [WeakRetained xpcConnection];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke;
      v15[3] = &unk_1E6067C48;
      v15[4] = &v16;
      int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];
      unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke_2;
      v14[3] = &unk_1E6067F30;
      v14[4] = &v16;
      void v14[5] = a3;
      [v8 isPeriocularEnrollmentSupported:v9 replyBlock:v14];
    }
  }
  else
  {
    if (__osLog) {
      unint64_t v12 = __osLog;
    }
    else {
      unint64_t v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v21 = "supported";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      uint64_t v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v28 = 1024;
      int v29 = 1926;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v17 + 6) = 22;
  }
  int v10 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke_2(uint64_t result, int a2, char a3)
{
  BOOL v3 = *(unsigned char **)(result + 40);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *BOOL v3 = a3;
  return result;
}

- (int)getPeriocularMatchState:(unsigned int)a3 state:(int64_t *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  if (a4)
  {
    uint64_t v5 = *(void *)&a3;
    int v7 = [(BiometricKitXPCClient *)self initializeConnection];
    *((_DWORD *)v19 + 6) = v7;
    if (v7)
    {
      if (__osLog) {
        uint64_t v15 = __osLog;
      }
      else {
        uint64_t v15 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = "status == 0 ";
        __int16 v24 = 2048;
        uint64_t v25 = v7;
        __int16 v26 = 2080;
        __int16 v27 = &unk_1B3B370EE;
        __int16 v28 = 2080;
        int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        __int16 v30 = 1024;
        int v31 = 1953;
        _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      unint64_t v9 = [WeakRetained xpcConnection];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke;
      v17[3] = &unk_1E6067C48;
      v17[4] = &v18;
      int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v17];
      unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke_2;
      v16[3] = &unk_1E6067E18;
      v16[4] = &v18;
      void v16[5] = a4;
      [v10 getPeriocularMatchState:v5 client:v11 replyBlock:v16];
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = "state";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      __int16 v27 = &unk_1B3B370EE;
      __int16 v28 = 2080;
      int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v30 = 1024;
      int v31 = 1950;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v19 + 6) = 22;
  }
  int v12 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  BOOL v3 = *(void **)(result + 40);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *BOOL v3 = a3;
  return result;
}

- (void)removePeriocularTemplatesWithOptions:(id)a3 async:(BOOL)a4 withReply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = (void (**)(id, void))a5;
  int v10 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v10)
  {
    uint64_t v20 = v10;
    if (__osLog) {
      int v21 = __osLog;
    }
    else {
      int v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v31 = "status == 0 ";
      __int16 v32 = 2048;
      uint64_t v33 = v20;
      __int16 v34 = 2080;
      int v35 = &unk_1B3B370EE;
      __int16 v36 = 2080;
      int v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v38 = 1024;
      int v39 = 1975;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9[2](v9, v20);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v12 = [WeakRetained xpcConnection];
    if (v6)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke;
      v28[3] = &unk_1E6067D00;
      int v13 = v9;
      id v29 = v13;
      uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v28];
      unint64_t v15 = [(BiometricKitXPCClient *)self clientID];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_2;
      v26[3] = &unk_1E6067D28;
      __int16 v27 = v13;
      [v14 removePeriocularTemplatesWithOptions:v8 async:1 client:v15 replyBlock:v26];

      uint64_t v16 = v29;
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_3;
      v24[3] = &unk_1E6067D00;
      uint64_t v17 = v9;
      id v25 = v17;
      uint64_t v18 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v24];
      unint64_t v19 = [(BiometricKitXPCClient *)self clientID];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_4;
      v22[3] = &unk_1E6067D28;
      uint64_t v23 = v17;
      [v18 removePeriocularTemplatesWithOptions:v8 async:0 client:v19 replyBlock:v22];

      uint64_t v16 = v25;
    }
  }
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  int v9 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v20 + 6) = v9;
  if (v9)
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v24 = "status == 0 ";
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      __int16 v27 = 2080;
      __int16 v28 = &unk_1B3B370EE;
      __int16 v29 = 2080;
      __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v31 = 1024;
      int v32 = 2009;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v11 = [WeakRetained xpcConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke;
    v18[3] = &unk_1E6067C48;
    v18[4] = &v19;
    int v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
    unint64_t v13 = [(BiometricKitXPCClient *)self clientID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke_2;
    v17[3] = &unk_1E6067F30;
    v17[4] = &v19;
    void v17[5] = a4;
    [v12 queryIdentityMigrationFailureForUser:v7 clear:v5 client:v13 replyBlock:v17];
  }
  int v14 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v14;
}

uint64_t __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke_2(uint64_t result, int a2, char a3)
{
  uint64_t v3 = *(unsigned char **)(result + 40);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (v3) {
    *uint64_t v3 = a3;
  }
  return result;
}

- (void)logEventOrCode:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  if (v5)
  {
    int v8 = v5;
    if (__osLog) {
      int v9 = __osLog;
    }
    else {
      int v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v12 = "[self initializeConnection] == 0 ";
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      uint64_t v16 = &unk_1B3B370EE;
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v19 = 1024;
      int v20 = 2030;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    BOOL v6 = [WeakRetained xpcConnection];
    uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_375];
    [v7 logEventOrCode:a3];
  }
}

- (int)enableMatchAutoRetry:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v20 = "status == 0 ";
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      __int16 v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v27 = 1024;
      int v28 = 2046;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v15;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke_2;
    v13[3] = &unk_1E6067C70;
    v13[4] = &v15;
    [v8 enableMatchAutoRetry:v3 client:v9 replyBlock:v13];
  }
  int v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)pauseFaceDetectTimer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v20 = "status == 0 ";
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      __int16 v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v27 = 1024;
      int v28 = 2067;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v15;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke_2;
    v13[3] = &unk_1E6067C70;
    v13[4] = &v15;
    [v8 pauseFaceDetectTimer:v3 client:v9 replyBlock:v13];
  }
  int v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)getLastMatchEvent:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy_;
  __int16 v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v22 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = "status == 0 ";
      __int16 v27 = 2048;
      uint64_t v28 = v5;
      __int16 v29 = 2080;
      __int16 v30 = &unk_1B3B370EE;
      __int16 v31 = 2080;
      int v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v33 = 1024;
      int v34 = 2089;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v21;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke_2;
    v13[3] = &unk_1E6067F58;
    v13[4] = &v21;
    void v13[5] = &v15;
    [v8 getLastMatchEvent:v9 replyBlock:v13];

    if (a3) {
      *a3 = (id) v16[5];
    }
  }
  int v10 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    a3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
}

- (int)getDeviceHardwareState:(unsigned int *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v20 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v24 = "status == 0 ";
      __int16 v25 = 2048;
      uint64_t v26 = v5;
      __int16 v27 = 2080;
      uint64_t v28 = &unk_1B3B370EE;
      __int16 v29 = 2080;
      __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v31 = 1024;
      int v32 = 2116;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v19;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke_2;
    v13[3] = &unk_1E6067F80;
    v13[4] = &v19;
    void v13[5] = &v15;
    [v8 getDeviceHardwareState:v9 replyBlock:v13];

    if (a3) {
      *a3 = *((_DWORD *)v16 + 6);
    }
  }
  int v10 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke_2(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24)) {
    a3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (int)listAccessories:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  int v5 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v22 + 6) = v5;
  if (v5)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = "status == 0 ";
      __int16 v27 = 2048;
      uint64_t v28 = v5;
      __int16 v29 = 2080;
      __int16 v30 = &unk_1B3B370EE;
      __int16 v31 = 2080;
      int v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v33 = 1024;
      int v34 = 2143;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v7 = [WeakRetained xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__BiometricKitXPCClient_listAccessories___block_invoke;
    v14[3] = &unk_1E6067C48;
    v14[4] = &v21;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    unint64_t v9 = [(BiometricKitXPCClient *)self clientID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__BiometricKitXPCClient_listAccessories___block_invoke_2;
    v13[3] = &unk_1E6067FA8;
    v13[4] = &v21;
    void v13[5] = &v15;
    [v8 listAccessories:v9 replyBlock:v13];

    if (a3) {
      *a3 = (id) v16[5];
    }
  }
  int v10 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t __41__BiometricKitXPCClient_listAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __41__BiometricKitXPCClient_listAccessories___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    a3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
}

- (int)getFreeIdentityCount:(unint64_t *)a3 forUser:(unsigned int)a4 accessoryGroup:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  int v9 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v24 + 6) = v9;
  if (v9)
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = "status == 0 ";
      __int16 v29 = 2048;
      uint64_t v30 = v9;
      __int16 v31 = 2080;
      int v32 = &unk_1B3B370EE;
      __int16 v33 = 2080;
      int v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v35 = 1024;
      int v36 = 2170;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    unint64_t v11 = [WeakRetained xpcConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke;
    v18[3] = &unk_1E6067C48;
    v18[4] = &v23;
    int v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
    unint64_t v13 = [(BiometricKitXPCClient *)self clientID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke_2;
    v17[3] = &unk_1E6067FD0;
    v17[4] = &v23;
    void v17[5] = &v19;
    [v12 getFreeIdentityCountForUser:v5 accessoryGroup:v8 client:v13 replyBlock:v17];

    if (a3) {
      *a3 = v20[3];
    }
  }
  int v14 = *((_DWORD *)v24 + 6);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

uint64_t __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24)) {
    a3 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (int)getPreferencesValue:(id *)a3 forKey:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  int v7 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v25 + 6) = v7;
  if (v7)
  {
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v29 = "status == 0 ";
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      __int16 v32 = 2080;
      __int16 v33 = &unk_1B3B370EE;
      __int16 v34 = 2080;
      __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v36 = 1024;
      int v37 = 2287;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v9 = [WeakRetained xpcConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke;
    v17[3] = &unk_1E6067C48;
    v17[4] = &v24;
    int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v17];
    unint64_t v11 = [(BiometricKitXPCClient *)self clientID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke_2;
    v16[3] = &unk_1E6067FF8;
    v16[4] = &v24;
    void v16[5] = &v18;
    [v10 getPreferencesValueForKey:v6 client:v11 replyBlock:v16];

    uint64_t v12 = *((int *)v25 + 6);
    if (!v12)
    {
      *a3 = (id) v19[5];
      goto LABEL_4;
    }
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v29 = "status == 0 ";
      __int16 v30 = 2048;
      uint64_t v31 = v12;
      __int16 v32 = 2080;
      __int16 v33 = &unk_1B3B370EE;
      __int16 v34 = 2080;
      __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v36 = 1024;
      int v37 = 2296;
      goto LABEL_15;
    }
  }
LABEL_4:
  int v13 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

uint64_t __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke_2(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (int)setPreferencesValue:(id)a3 forKey:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  int v8 = [(BiometricKitXPCClient *)self initializeConnection];
  *((_DWORD *)v19 + 6) = v8;
  if (v8)
  {
    if (__osLog) {
      uint64_t v15 = __osLog;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v23 = "status == 0 ";
      __int16 v24 = 2048;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      int v27 = &unk_1B3B370EE;
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v30 = 1024;
      int v31 = 2313;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    int v10 = [WeakRetained xpcConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke;
    v17[3] = &unk_1E6067C48;
    v17[4] = &v18;
    unint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];
    unint64_t v12 = [(BiometricKitXPCClient *)self clientID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke_2;
    v16[3] = &unk_1E6067C70;
    v16[4] = &v18;
    [v11 setPreferencesValue:v6 forKey:v7 client:v12 replyBlock:v16];
  }
  int v13 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);

  return v13;
}

uint64_t __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 code];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BiometricKitXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BiometricKitXPCClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_connection);
}

@end