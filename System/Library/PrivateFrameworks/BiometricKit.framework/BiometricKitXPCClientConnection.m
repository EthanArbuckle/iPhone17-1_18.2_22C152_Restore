@interface BiometricKitXPCClientConnection
+ (id)connectionWithDeviceType:(int64_t)a3;
- (BOOL)addClient:(id)a3;
- (BOOL)removeClient:(id)a3;
- (BiometricKitXPCClientConnection)initWithDeviceType:(int64_t)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (id)client:(unint64_t)a3;
- (void)dealloc;
- (void)enrollFeedback:(id)a3 client:(unint64_t)a4;
- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5;
- (void)enrollUpdate:(id)a3 client:(unint64_t)a4;
- (void)homeButtonPressed:(unint64_t)a3;
- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5;
- (void)taskResumeStatus:(int)a3 client:(unint64_t)a4;
- (void)templateUpdate:(id)a3 details:(id)a4 client:(unint64_t)a5;
- (void)touchIDButtonPressed:(BOOL)a3 client:(unint64_t)a4;
@end

@implementation BiometricKitXPCClientConnection

- (NSXPCConnection)xpcConnection
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  xpcConnection = v2->_xpcConnection;
  if (xpcConnection && !v2->_invalidated)
  {
LABEL_15:
    v41 = xpcConnection;
    goto LABEL_23;
  }
  objc_initWeak(&location, v2);
  int64_t deviceType = v2->_deviceType;
  if (deviceType == 1)
  {
    v5 = @"com.apple.biometrickitd";
  }
  else
  {
    if (deviceType != 2)
    {
      if (__osLog) {
        v42 = __osLog;
      }
      else {
        v42 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136316162;
      v54 = "0";
      __int16 v55 = 2048;
      uint64_t v56 = 0;
      __int16 v57 = 2080;
      v58 = &unk_1B3B370EE;
      __int16 v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v61 = 1024;
      int v62 = 162;
      goto LABEL_21;
    }
    v5 = @"com.apple.pearld";
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v5 options:0];
  v7 = v2->_xpcConnection;
  v2->_xpcConnection = (NSXPCConnection *)v6;

  if (v2->_xpcConnection)
  {
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C597E0];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v8];

    v9 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    v10 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    [v9 setClasses:v10 forSelector:sel_getIdentityFromUUID_client_replyBlock_ argumentIndex:0 ofReply:1];

    v11 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    [v11 setClasses:v14 forSelector:sel_identities_client_replyBlock_ argumentIndex:0 ofReply:1];

    v15 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    [v15 setClasses:v20 forSelector:sel_getLastMatchEvent_replyBlock_ argumentIndex:1 ofReply:1];

    v21 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    [v21 setClasses:v24 forSelector:sel_getPreferencesValueForKey_client_replyBlock_ argumentIndex:1 ofReply:1];

    v25 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    [v25 setClasses:v28 forSelector:sel_listAccessories_replyBlock_ argumentIndex:1 ofReply:1];

    v29 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C54D50];
    [(NSXPCConnection *)v2->_xpcConnection setExportedInterface:v29];

    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:v2];
    v30 = [(NSXPCConnection *)v2->_xpcConnection exportedInterface];
    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v31, "setWithObjects:", v32, v33, v34, v35, v36, objc_opt_class(), 0);
    [v30 setClasses:v37 forSelector:sel_statusMessage_details_client_ argumentIndex:1 ofReply:0];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke;
    v50[3] = &unk_1E6067AE0;
    objc_copyWeak(&v51, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:v50];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_225;
    v48[3] = &unk_1E6067B08;
    objc_copyWeak(&v49, &location);
    v48[4] = v2;
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:v48];
    if (!v2->_serverStartedNotificationToken)
    {
      v38 = dispatch_get_global_queue(0, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_227;
      handler[3] = &unk_1E6067B30;
      objc_copyWeak(&v47, &location);
      notify_register_dispatch("com.apple.BiometricKit.serverStarted", &v2->_serverStartedNotificationToken, v38, handler);

      objc_destroyWeak(&v47);
    }
    if (v2->_invalidated)
    {
      v2->_invalidated = 0;
      v39 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_229;
      block[3] = &unk_1E6067AE0;
      objc_copyWeak(&v45, &location);
      dispatch_async(v39, block);

      objc_destroyWeak(&v45);
    }
    if (xpc_user_sessions_enabled())
    {
      xpc_user_sessions_get_foreground_uid();
      v40 = [(NSXPCConnection *)v2->_xpcConnection _xpcConnection];
      xpc_connection_set_target_user_session_uid();
    }
    [(NSXPCConnection *)v2->_xpcConnection resume];
    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
    xpcConnection = v2->_xpcConnection;
    goto LABEL_15;
  }
  if (__osLog) {
    v42 = __osLog;
  }
  else {
    v42 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v54 = "_xpcConnection";
    __int16 v55 = 2048;
    uint64_t v56 = 0;
    __int16 v57 = 2080;
    v58 = &unk_1B3B370EE;
    __int16 v59 = 2080;
    v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    __int16 v61 = 1024;
    int v62 = 167;
LABEL_21:
    _os_log_impl(&dword_1B3AF1000, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_22:
  objc_destroyWeak(&location);
  v41 = 0;
LABEL_23:
  objc_sync_exit(v2);

  return v41;
}

+ (id)connectionWithDeviceType:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke_2;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = a1;
    if (connectionWithDeviceType__once_1 != -1) {
      dispatch_once(&connectionWithDeviceType__once_1, v7);
    }
    v3 = (void *)connectionWithDeviceType__pearlConnection;
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a1;
    if (connectionWithDeviceType__once != -1) {
      dispatch_once(&connectionWithDeviceType__once, block);
    }
    v3 = (void *)connectionWithDeviceType__touchIdConnection;
LABEL_9:
    id v4 = v3;
    goto LABEL_16;
  }
  if (__osLog) {
    v5 = __osLog;
  }
  else {
    v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v10 = "0";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    v14 = &unk_1B3B370EE;
    __int16 v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    __int16 v17 = 1024;
    int v18 = 89;
    _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  id v4 = 0;
LABEL_16:

  return v4;
}

void __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke(uint64_t a1)
{
  if (isTouchIDPlatform())
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)&OBJC_METACLASS___BiometricKitXPCClientConnection;
    uint64_t v2 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "initWithDeviceType:", 1);
    v3 = (void *)connectionWithDeviceType__touchIdConnection;
    connectionWithDeviceType__touchIdConnection = v2;
  }
}

void __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke_2(uint64_t a1)
{
  if (isFaceIDPlatform())
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)&OBJC_METACLASS___BiometricKitXPCClientConnection;
    uint64_t v2 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "initWithDeviceType:", 2);
    v3 = (void *)connectionWithDeviceType__pearlConnection;
    connectionWithDeviceType__pearlConnection = v2;
  }
}

- (BiometricKitXPCClientConnection)initWithDeviceType:(int64_t)a3
{
  v3 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) <= 1)
  {
    self->_int64_t deviceType = a3;
    v14.receiver = self;
    v14.super_class = (Class)BiometricKitXPCClientConnection;
    objc_super v4 = [(BiometricKitXPCClientConnection *)&v14 init];
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      clients = v4->_clients;
      v4->_clients = v5;

      dispatch_queue_t v7 = dispatch_queue_create("com.apple.BiometricKitXPCClientConnection.dispatch", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v7;

      v9 = [(BiometricKitXPCClientConnection *)v4 xpcConnection];

      if (v9) {
        goto LABEL_4;
      }
      __int16 v13 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      *(_DWORD *)buf = 136316162;
      v16 = "[self xpcConnection]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      v20 = &unk_1B3B370EE;
      __int16 v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v23 = 1024;
      int v24 = 125;
    }
    else
    {
      if (__osLog) {
        __int16 v13 = __osLog;
      }
      else {
        __int16 v13 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      *(_DWORD *)buf = 136316162;
      v16 = "self";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      v20 = &unk_1B3B370EE;
      __int16 v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v23 = 1024;
      int v24 = 117;
    }
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_4:
    v3 = v4;
    v10 = v3;
    goto LABEL_11;
  }
  if (__osLog) {
    __int16 v11 = __osLog;
  }
  else {
    __int16 v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v16 = "0";
    __int16 v17 = 2048;
    uint64_t v18 = 0;
    __int16 v19 = 2080;
    v20 = &unk_1B3B370EE;
    __int16 v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    __int16 v23 = 1024;
    int v24 = 112;
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  int serverStartedNotificationToken = self->_serverStartedNotificationToken;
  if (serverStartedNotificationToken) {
    notify_cancel(serverStartedNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)BiometricKitXPCClientConnection;
  [(BiometricKitXPCClientConnection *)&v4 dealloc];
}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (__osLog) {
    uint64_t v2 = __osLog;
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v2, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::initWithDeviceType : connection interrupted\n", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    [v5[5] allValues];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "interruptConnection", (void)v10);
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }

    objc_sync_exit(v5);
  }
}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_225(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (__osLog) {
    uint64_t v2 = __osLog;
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v2, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::initWithDeviceType : connection invalidated\n", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
    [v5[5] allValues];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "interruptConnection", (void)v10);
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }

    objc_sync_exit(v5);
  }
}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_227(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (__osLog) {
    uint64_t v2 = __osLog;
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v2, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::initWithDeviceType : processing kBiometricKitServerStartedNotification\n", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    id v6 = [v5[5] allValues];
    objc_sync_exit(v5);

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "initializeConnection", (void)v11);
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_229(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    objc_super v4 = [v3[5] allValues];
    objc_sync_exit(v3);

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "initializeConnection", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)addClient:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  clients = v5->_clients;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
  uint64_t v8 = [(NSMutableDictionary *)clients objectForKey:v7];

  if (v8)
  {
    if (__osLog) {
      long long v12 = __osLog;
    }
    else {
      long long v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136316162;
      uint64_t v14 = "![_clients objectForKey:@(client.clientID)]";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = &unk_1B3B370EE;
      __int16 v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v21 = 1024;
      int v22 = 307;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  else
  {
    long long v9 = v5->_clients;
    long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
    [(NSMutableDictionary *)v9 setObject:v4 forKey:v10];
  }
  objc_sync_exit(v5);

  return v8 == 0;
}

- (BOOL)removeClient:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  clients = v5->_clients;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
  uint64_t v8 = [(NSMutableDictionary *)clients objectForKey:v7];

  if (v8)
  {
    long long v9 = v5->_clients;
    long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];
  }
  else
  {
    if (__osLog) {
      long long v12 = __osLog;
    }
    else {
      long long v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136316162;
      uint64_t v14 = "[_clients objectForKey:@(client.clientID)]";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = &unk_1B3B370EE;
      __int16 v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      __int16 v21 = 1024;
      int v22 = 328;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  objc_sync_exit(v5);

  return v8 != 0;
}

- (id)client:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  clients = v4->_clients;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v7 = [(NSMutableDictionary *)clients objectForKey:v6];

  objc_sync_exit(v4);

  return v7;
}

- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__BiometricKitXPCClientConnection_enrollResult_details_client___block_invoke;
  v13[3] = &unk_1E6067B58;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __63__BiometricKitXPCClientConnection_enrollResult_details_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 56)];
  uint64_t v2 = [v3 delegate];
  [v2 enrollResult:*(void *)(a1 + 40) details:*(void *)(a1 + 48) client:*(void *)(a1 + 56)];
}

- (void)enrollUpdate:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__BiometricKitXPCClientConnection_enrollUpdate_client___block_invoke;
  block[3] = &unk_1E6067B80;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __55__BiometricKitXPCClientConnection_enrollUpdate_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 48)];
  uint64_t v2 = [v3 delegate];
  [v2 enrollUpdate:*(void *)(a1 + 40) client:*(void *)(a1 + 48)];
}

- (void)enrollFeedback:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__BiometricKitXPCClientConnection_enrollFeedback_client___block_invoke;
  block[3] = &unk_1E6067B80;
  id v9 = v6;
  unint64_t v10 = a4;
  void block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__BiometricKitXPCClientConnection_enrollFeedback_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 48)];
  uint64_t v2 = [v3 delegate];
  [v2 enrollFeedback:*(void *)(a1 + 40) client:*(void *)(a1 + 48)];
}

- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__BiometricKitXPCClientConnection_matchResult_details_client___block_invoke;
  v13[3] = &unk_1E6067B58;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __62__BiometricKitXPCClientConnection_matchResult_details_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 56)];
  uint64_t v2 = [v3 delegate];
  [v2 matchResult:*(void *)(a1 + 40) details:*(void *)(a1 + 48) client:*(void *)(a1 + 56)];
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__BiometricKitXPCClientConnection_statusMessage_client___block_invoke;
  block[3] = &unk_1E6067BA8;
  void block[4] = self;
  void block[5] = a4;
  unsigned int v6 = a3;
  dispatch_async(queue, block);
}

void __56__BiometricKitXPCClientConnection_statusMessage_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 delegate];
  [v2 statusMessage:*(unsigned int *)(a1 + 48) client:*(void *)(a1 + 40)];
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__BiometricKitXPCClientConnection_statusMessage_details_client___block_invoke;
  v11[3] = &unk_1E6067BD0;
  id v12 = v8;
  unint64_t v13 = a5;
  unsigned int v14 = a3;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __64__BiometricKitXPCClientConnection_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 48)];
  uint64_t v2 = [v3 delegate];
  [v2 statusMessage:*(unsigned int *)(a1 + 56) details:*(void *)(a1 + 40) client:*(void *)(a1 + 48)];
}

- (void)homeButtonPressed:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__BiometricKitXPCClientConnection_homeButtonPressed___block_invoke;
  v4[3] = &unk_1E6067BF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __53__BiometricKitXPCClientConnection_homeButtonPressed___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 delegate];
  [v2 homeButtonPressed:*(void *)(a1 + 40)];
}

- (void)touchIDButtonPressed:(BOOL)a3 client:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__BiometricKitXPCClientConnection_touchIDButtonPressed_client___block_invoke;
  block[3] = &unk_1E6067C20;
  void block[4] = self;
  void block[5] = a4;
  BOOL v6 = a3;
  dispatch_async(queue, block);
}

void __63__BiometricKitXPCClientConnection_touchIDButtonPressed_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 delegate];
  [v2 touchIDButtonPressed:*(unsigned __int8 *)(a1 + 48) client:*(void *)(a1 + 40)];
}

- (void)templateUpdate:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__BiometricKitXPCClientConnection_templateUpdate_details_client___block_invoke;
  v13[3] = &unk_1E6067B58;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __65__BiometricKitXPCClientConnection_templateUpdate_details_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 56)];
  uint64_t v2 = [v3 delegate];
  [v2 templateUpdate:*(void *)(a1 + 40) details:*(void *)(a1 + 48) client:*(void *)(a1 + 56)];
}

- (void)taskResumeStatus:(int)a3 client:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BiometricKitXPCClientConnection_taskResumeStatus_client___block_invoke;
  block[3] = &unk_1E6067BA8;
  void block[4] = self;
  void block[5] = a4;
  int v6 = a3;
  dispatch_async(queue, block);
}

void __59__BiometricKitXPCClientConnection_taskResumeStatus_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 delegate];
  [v2 taskResumeStatus:*(unsigned int *)(a1 + 48) client:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end