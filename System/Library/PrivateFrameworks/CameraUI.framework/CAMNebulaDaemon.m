@interface CAMNebulaDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CAMNebulaDaemon)init;
- (CAMNebulaIrisBackendController)_irisBackendController;
- (CAMNebulaKeepAliveController)_keepAliveController;
- (CAMPersistenceController)_persistenceController;
- (CAMTimelapseBackendController)_timelapseBackendController;
- (NSMutableArray)_connections;
- (NSXPCListener)_listener;
- (OS_dispatch_queue)_queue;
- (id)allowedProtocolForClientAccess:(id)a3;
- (void)daemonConnectionManagerHasBeenDisconnected:(id)a3;
- (void)performPendingWorkAfterDelay:(double)a3;
- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6;
@end

@implementation CAMNebulaDaemon

- (CAMNebulaDaemon)init
{
  v20.receiver = self;
  v20.super_class = (Class)CAMNebulaDaemon;
  v2 = [(CAMNebulaDaemon *)&v20 init];
  if (v2)
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Timelapse daemon started running", v19, 2u);
    }

    v4 = objc_alloc_init(CAMNebulaKeepAliveController);
    keepAliveController = v2->__keepAliveController;
    v2->__keepAliveController = v4;

    v6 = [[CAMPersistenceController alloc] initWithLocationController:0 burstController:0 protectionController:0 powerController:0 irisVideoController:0];
    persistenceController = v2->__persistenceController;
    v2->__persistenceController = v6;

    [(CAMPersistenceController *)v2->__persistenceController setResultDelegate:v2];
    v8 = [[CAMTimelapseBackendController alloc] initWithPersistenceController:v2->__persistenceController keepAliveController:v2->__keepAliveController];
    timelapseBackendController = v2->__timelapseBackendController;
    v2->__timelapseBackendController = v8;

    v10 = [[CAMNebulaIrisBackendController alloc] initWithPersistenceController:v2->__persistenceController keepAliveController:v2->__keepAliveController];
    irisBackendController = v2->__irisBackendController;
    v2->__irisBackendController = v10;

    [(CAMNebulaKeepAliveController *)v2->__keepAliveController removeKeepAliveFileIfNotKeptForAnyIdentifiers];
    [MEMORY[0x263F08D88] enableTransactions];
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    connections = v2->__connections;
    v2->__connections = (NSMutableArray *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.assetsd.nebulad.daemon", 0);
    queue = v2->__queue;
    v2->__queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.assetsd.nebulad"];
    listener = v2->__listener;
    v2->__listener = (NSXPCListener *)v16;

    [(NSXPCListener *)v2->__listener setDelegate:v2];
    [(NSXPCListener *)v2->__listener _setQueue:v2->__queue];
    [(NSXPCListener *)v2->__listener resume];
  }
  return v2;
}

- (void)performPendingWorkAfterDelay:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v12 = a3;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Timelapse daemon will check for pending work after %.2f seconds", buf, 0xCu);
  }

  v6 = (void *)os_transaction_create();
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__CAMNebulaDaemon_performPendingWorkAfterDelay___block_invoke;
  v9[3] = &unk_263FA0408;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

void __48__CAMNebulaDaemon_performPendingWorkAfterDelay___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Timelapse daemon checking for pending work", v5, 2u);
  }

  v3 = [*(id *)(a1 + 32) _timelapseBackendController];
  [v3 updatePendingWorkFromDiskForceEndLastSession:0];
  v4 = [*(id *)(a1 + 32) _irisBackendController];
  [v4 performIrisCrashRecoveryForceFileSystemCheck:0];
}

- (id)allowedProtocolForClientAccess:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"camera"])
  {
    v4 = (id *)&protocolRef_CAMNebulaDaemonProtocol;
LABEL_5:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"photos"])
  {
    v4 = (id *)&protocolRef_CAMNebulaDaemonProtocolLimited;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 valueForEntitlement:@"com.apple.private.assetsd.nebulad.access"];
  if (v6)
  {
    dispatch_time_t v7 = (__CFString *)v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = 0;
      int v9 = 1;
      goto LABEL_10;
    }
    id v10 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"com.apple.private.assetsd.nebulad.access";
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: value for entitlement %{public}@ is invalid", buf, 0x16u);
    }
  }
  v11 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = @"com.apple.private.assetsd.nebulad.access";
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ has no valid entitlement for %{public}@. Will fallback on bundle identifier", buf, 0x16u);
  }

  int v9 = 0;
  dispatch_time_t v7 = 0;
  int v8 = 1;
LABEL_10:
  long long v36 = 0u;
  long long v37 = 0u;
  if (v5) {
    [v5 auditToken];
  }
  CFStringRef v35 = 0;
  *(_OWORD *)buf = v36;
  *(_OWORD *)&buf[16] = v37;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    double v12 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ has no bundle identifier. Will fallback on process ID", buf, 0xCu);
    }

    int v13 = [v5 processIdentifier];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    memset(buf, 0, sizeof(buf));
    if (proc_name(v13, buf, 0x100u))
    {
      CFStringRef v35 = CFStringCreateWithCString(0, (const char *)buf, 0x8000100u);
      if (v35) {
        goto LABEL_23;
      }
      dispatch_queue_t v14 = os_log_create("com.apple.camera", "Nebula");
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)v38 = 0;
      v15 = "Can't decypher process name";
      uint64_t v16 = v14;
      uint32_t v17 = 2;
    }
    else
    {
      dispatch_queue_t v14 = os_log_create("com.apple.camera", "Nebula");
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        goto LABEL_23;
      }
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)v38 = 138543618;
      id v39 = v5;
      __int16 v40 = 2080;
      v41 = v19;
      v15 = "Can't get process name for %{public}@: %s";
      uint64_t v16 = v14;
      uint32_t v17 = 22;
    }
    _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, v15, v38, v17);
    goto LABEL_22;
  }
LABEL_23:
  objc_super v20 = (__CFString *)v35;
  if (!v35)
  {
    objc_super v20 = (__CFString *)CFRetain(@"anonymous");
    CFStringRef v35 = v20;
    if (v8) {
      goto LABEL_25;
    }
LABEL_31:
    if (!v9) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  if (!v8) {
    goto LABEL_31;
  }
LABEL_25:
  if (([(__CFString *)v20 isEqual:@"com.apple.camera"] & 1) != 0
    || [(__CFString *)v20 isEqual:@"com.apple.MobileSMS"])
  {
    v21 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = @"camera";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "Will use default camera access '%{public}@' for %{public}@", buf, 0x16u);
    }

    dispatch_time_t v7 = @"camera";
  }
  else
  {
    v22 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"com.apple.private.assetsd.nebulad.access";
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v20;
      _os_log_impl(&dword_2099F8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ has no valid entitlement for %{public}@ and bundle id %{public}@ not accepted", buf, 0x20u);
    }

    dispatch_time_t v7 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_43;
    }
  }
LABEL_36:
  v23 = [(CAMNebulaDaemon *)self allowedProtocolForClientAccess:v7];
  v24 = os_log_create("com.apple.camera", "Nebula");
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      v26 = NSStringFromProtocol(v23);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v26;
      LOWORD(v43) = 2114;
      *(void *)((char *)&v43 + 2) = v7;
      _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "Accepting a new connection from %{public}@ (bundle identifier: %{public}@). Allowed protocol is %{public}@ (%{public}@)", buf, 0x2Au);
    }
    v27 = (void *)[[NSString alloc] initWithFormat:@"%@[%@]", v20, v7];
    v28 = [[CAMNebulaDaemonConnectionManager alloc] initWithConnection:v5 name:v27 bundleIdentifier:v20 queue:self->__queue clientAccess:v7 allowedProtocol:v23];
    [(CAMNebulaDaemonConnectionManager *)v28 setDelegate:self];
    [(CAMNebulaDaemonConnectionManager *)v28 addTarget:self->__timelapseBackendController forProtocol:&unk_26BE49E60];
    [(CAMNebulaDaemonConnectionManager *)v28 addTarget:self->__irisBackendController forProtocol:&unk_26BE49F58];
    [(NSMutableArray *)self->__connections addObject:v28];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__CAMNebulaDaemon_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_263FA0408;
    v33 = v28;
    v34 = self;
    v29 = v28;
    dispatch_async(MEMORY[0x263EF83A0], block);

    BOOL v30 = 1;
    goto LABEL_46;
  }
  if (v25)
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v20;
    _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "Unknown access type '%{public}@' from %{public}@ (%{public}@)", buf, 0x20u);
  }

LABEL_43:
  v23 = (Protocol *)os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
    -[CAMNebulaDaemon listener:shouldAcceptNewConnection:]((uint64_t)v5, v23);
  }
  BOOL v30 = 0;
LABEL_46:

  return v30;
}

void __54__CAMNebulaDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clientAccess];
  int v3 = [v2 isEqualToString:@"camera"];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 40) _timelapseBackendController];
    [v5 handleClientConnection:*(void *)(a1 + 32)];
    v4 = [*(id *)(a1 + 40) _irisBackendController];
    [v4 handleClientConnection:*(void *)(a1 + 32)];
  }
}

- (void)daemonConnectionManagerHasBeenDisconnected:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  int v8 = __62__CAMNebulaDaemon_daemonConnectionManagerHasBeenDisconnected___block_invoke;
  int v9 = &unk_263FA0408;
  id v10 = v4;
  v11 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], &v6);
  -[NSMutableArray removeObject:](self->__connections, "removeObject:", v5, v6, v7, v8, v9);
}

void __62__CAMNebulaDaemon_daemonConnectionManagerHasBeenDisconnected___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clientAccess];
  int v3 = [v2 isEqualToString:@"camera"];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 40) _timelapseBackendController];
    [v5 handleClientDisconnection];
    id v4 = [*(id *)(a1 + 40) _irisBackendController];
    [v4 handleClientDisconnection:*(void *)(a1 + 32)];
  }
}

- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  if ([v10 type] == 1) {
    [(CAMNebulaDaemon *)self _timelapseBackendController];
  }
  else {
  id v14 = [(CAMNebulaDaemon *)self _irisBackendController];
  }
  [v14 persistenceController:v13 didGenerateVideoLocalPersistenceResult:v12 forCaptureResult:v11 fromRequest:v10];
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (CAMTimelapseBackendController)_timelapseBackendController
{
  return self->__timelapseBackendController;
}

- (CAMNebulaIrisBackendController)_irisBackendController
{
  return self->__irisBackendController;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (CAMNebulaKeepAliveController)_keepAliveController
{
  return self->__keepAliveController;
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (NSMutableArray)_connections
{
  return self->__connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connections, 0);
  objc_storeStrong((id *)&self->__listener, 0);
  objc_storeStrong((id *)&self->__keepAliveController, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__irisBackendController, 0);
  objc_storeStrong((id *)&self->__timelapseBackendController, 0);
  objc_storeStrong((id *)&self->__queue, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Refusing connection from %{public}@", (uint8_t *)&v2, 0xCu);
}

@end