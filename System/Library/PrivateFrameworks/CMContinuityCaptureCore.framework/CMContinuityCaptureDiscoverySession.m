@interface CMContinuityCaptureDiscoverySession
+ (id)rapportDeviceIdentifier:(id)a3;
+ (id)sharedInstance;
+ (void)invalidate;
+ (void)unscheduleAllNotificationForDeviceIdentifier:(id)a3;
- (BOOL)invalidated;
- (BOOL)isSessionInitiatedOnCommunalDevice;
- (BOOL)isUserSelectedDeviceIfApplicable:(id)a3;
- (BOOL)setupRPClient;
- (BOOL)validateSessionInfoForEvent:(id)a3;
- (CMContinuityCaptureDiscoverySession)initWithQueue:(id)a3;
- (NSArray)availableClientDevices;
- (OS_dispatch_queue)queue;
- (id)_deviceForIdentifier:(id)a3;
- (id)currentDeviceList;
- (id)currentUserSelectedInSessionDeviceIdentifier;
- (id)description;
- (id)discoveredCompatibleDevices:(id)a3 rapportDevices:(id)a4;
- (id)discoveredLocalDevices;
- (id)discoveredRapportDevices;
- (id)rpRemoteDisplayDiscovery;
- (id)validateCapabilitiesAndCacheIncompatibleNotificationIfApplicable:(id)a3 majorVersion:(unint64_t)a4;
- (unint64_t)transportErrorFlags;
- (void)activate;
- (void)addSidebandMessageNotificationHandler:(id)a3 forDeviceIdentifier:(id)a4;
- (void)boostDiscoveryForReason:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)currentDeviceList;
- (void)device:(id)a3 isNearby:(BOOL)a4;
- (void)discardUserSelectedDeviceIfApplicableWithReason:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeSidebandMessageNotificationHandlerForDeviceIdentifier:(id)a3;
- (void)setupProxyMonitoring;
- (void)setupRPRemoteDisplayDiscovery;
- (void)showIncompatableDeviceNotificationIfApplicable;
- (void)updateState;
@end

@implementation CMContinuityCaptureDiscoverySession

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)_discoverySession;
  return v2;
}

uint64_t __53__CMContinuityCaptureDiscoverySession_sharedInstance__block_invoke()
{
  v0 = [CMContinuityCaptureDiscoverySession alloc];
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.continuitycapture.discoverysession", v1);
  uint64_t v3 = [(CMContinuityCaptureDiscoverySession *)v0 initWithQueue:v2];
  v4 = (void *)_discoverySession;
  _discoverySession = v3;

  v5 = (void *)_discoverySession;
  return [v5 activate];
}

+ (void)invalidate
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (_discoverySession && ([(id)_discoverySession invalidated] & 1) == 0) {
    dispatch_async(*(dispatch_queue_t *)(_discoverySession + 24), &__block_literal_global_10);
  }
  objc_sync_exit(obj);
}

uint64_t __49__CMContinuityCaptureDiscoverySession_invalidate__block_invoke()
{
  return [(id)_discoverySession cancel];
}

- (CMContinuityCaptureDiscoverySession)initWithQueue:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CMContinuityCaptureDiscoverySession;
  v6 = [(CMContinuityCaptureDiscoverySession *)&v25 init];
  if (!v6)
  {
LABEL_8:
    v22 = 0;
    goto LABEL_4;
  }
  id v7 = objc_alloc_init(NSDictionary);
  v8 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v7;

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v10 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v9;

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v12 = (void *)*((void *)v6 + 18);
  *((void *)v6 + 18) = v11;

  objc_storeStrong((id *)v6 + 3, a3);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v14 = (void *)*((void *)v6 + 12);
  *((void *)v6 + 12) = v13;

  id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v16 = (void *)*((void *)v6 + 17);
  *((void *)v6 + 17) = v15;

  if (([v6 setupRPClient] & 1) == 0)
  {
    v24 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_235FC2000, v24, OS_LOG_TYPE_DEFAULT, "%@ rpCompanionclient setup failed", buf, 0xCu);
    }

    goto LABEL_8;
  }
  [v6 setupRPRemoteDisplayDiscovery];
  [v6 setupProxyMonitoring];
  v17 = (void *)MEMORY[0x263EFF8C0];
  v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CMContinuityCaptureCore"];
  v19 = [v18 pathForResource:@"UnsupportedDeviceModels_iOS15" ofType:@"plist"];
  uint64_t v20 = [v17 arrayWithContentsOfFile:v19];
  v21 = (void *)*((void *)v6 + 8);
  *((void *)v6 + 8) = v20;

  *((void *)v6 + 11) = 1;
  *(_OWORD *)(v6 + 72) = xmmword_236059428;
  v6[128] = FigGetCFPreferenceBooleanWithDefault() != 0;
  v22 = v6;
LABEL_4:

  return v22;
}

- (unint64_t)transportErrorFlags
{
  dispatch_queue_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(RPCompanionLinkClient *)v2->_rpCompanionLinkClient errorFlags];
  objc_sync_exit(v2);

  return v3;
}

- (id)currentUserSelectedInSessionDeviceIdentifier
{
  dispatch_queue_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_currentUserSelectedInSessionDeviceIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (id)rpRemoteDisplayDiscovery
{
  dispatch_queue_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_rpRemoteDisplayDiscovery;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSessionInitiatedOnCommunalDevice
{
  return 0;
}

- (void)discardUserSelectedDeviceIfApplicableWithReason:(id)a3
{
  id obj = self;
  objc_sync_enter(obj);
  currentUserSelectedInSessionDeviceIdentifier = obj->_currentUserSelectedInSessionDeviceIdentifier;
  obj->_currentUserSelectedInSessionDeviceIdentifier = 0;

  currentUserSelectedInSessionDevice = obj->_currentUserSelectedInSessionDevice;
  obj->_currentUserSelectedInSessionDevice = 0;

  objc_sync_exit(obj);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: [%p]", v5, self];

  return v6;
}

- (void)boostDiscoveryForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  rpCompanionLinkClient = self->_rpCompanionLinkClient;
  if (rpCompanionLinkClient)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__CMContinuityCaptureDiscoverySession_boostDiscoveryForReason_completion___block_invoke;
    v10[3] = &unk_264C995C0;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    id v12 = v7;
    [(RPCompanionLinkClient *)rpCompanionLinkClient triggerEnhancedDiscoveryForReason:v11 useCase:131079 completion:v10];

    objc_destroyWeak(&v13);
  }
  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870911 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureDiscoverySession_boostDiscoveryForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ triggerEnhancedDiscovery ForReason %@ Error %@", (uint8_t *)&v7, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setupProxyMonitoring
{
  self->_proximityMonitor = [[CMContinuityCaptureProximityMonitor alloc] initWithQueue:self->_queue delegate:self];
  MEMORY[0x270F9A758]();
}

- (void)setupRPRemoteDisplayDiscovery
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x263F62BC8]);
  v4 = self;
  objc_sync_enter(v4);
  objc_storeStrong((id *)&v4->_rpRemoteDisplayDiscovery, v3);
  objc_sync_exit(v4);

  [v3 setDispatchQueue:v4->_queue];
  objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 3);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke;
  v15[3] = &unk_264C995E8;
  objc_copyWeak(&v16, &location);
  [v3 setDeviceFoundHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_43;
  v13[3] = &unk_264C995E8;
  objc_copyWeak(&v14, &location);
  [v3 setDeviceLostHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_44;
  v11[3] = &unk_264C99610;
  objc_copyWeak(&v12, &location);
  [v3 setDeviceChangedHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_46;
  v9[3] = &unk_264C995E8;
  objc_copyWeak(&v10, &location);
  [v3 setDedicatedDeviceChangedHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_47;
  v7[3] = &unk_264C995E8;
  objc_copyWeak(&v8, &location);
  [v3 setDeviceSelectedHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_48;
  v5[3] = &unk_264C99638;
  objc_copyWeak(&v6, &location);
  [v3 setDiscoverySessionStateChangedHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained(v4);
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ New Device %{public}@ added", (uint8_t *)&v8, 0x16u);
    }
    [WeakRetained updateState];
  }
}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained(v4);
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Current Device %{public}@ lost", (uint8_t *)&v8, 0x16u);
    }
    [WeakRetained updateState];
  }
}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_44(uint64_t a1, void *a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained(v6);
      int v10 = 138543874;
      id v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Device %{public}@ device state changed %x", (uint8_t *)&v10, 0x1Cu);
    }
    [WeakRetained updateState];
  }
}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained(v4);
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Dedicated Device changed %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [WeakRetained updateState];
  }
}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained(v4);
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Device Selected %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __68__CMContinuityCaptureDiscoverySession_setupRPRemoteDisplayDiscovery__block_invoke_48(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_13;
  }
  int v8 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_loadWeakRetained(v6);
    *(_DWORD *)buf = 138543874;
    id v24 = v9;
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 2114;
    id v28 = v5;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Session state changed to %d for device %{public}@", buf, 0x1Cu);
  }
  __int16 v10 = +[CMContinuityCaptureSessionStateManager sharedInstance];
  uint64_t v11 = [v10 activeSession];
  if (!v11) {
    goto LABEL_8;
  }
  uint64_t v12 = (void *)v11;
  +[CMContinuityCaptureSessionStateManager sharedInstance];
  id v13 = v22 = a2;
  __int16 v14 = [v13 activeSession];
  int v15 = [v14 device];
  uint64_t v16 = [v15 deviceIdentifier];
  v17 = [v16 UUIDString];
  char v18 = [v17 isEqualToString:v5];

  a2 = v22;
  if (v22 == 1 && (v18 & 1) == 0)
  {
    __int16 v10 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    [v10 stopCurrentSession:@"Device switch" syncOnOwnedQueue:1];
LABEL_8:
  }
  v19 = (id *)WeakRetained;
  objc_sync_enter(v19);
  if (a2 == 1) {
    uint64_t v20 = v5;
  }
  else {
    uint64_t v20 = 0;
  }
  objc_storeStrong(v19 + 14, v20);
  id v21 = v19[15];
  v19[15] = 0;

  objc_sync_exit(v19);
  [v19 updateState];
LABEL_13:
}

- (void)addSidebandMessageNotificationHandler:(id)a3 forDeviceIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    int v8 = (void *)MEMORY[0x237DFB780](v9);
    [(NSMutableDictionary *)v7->_sidebandNotificationHandlersForIdentifier setObject:v8 forKeyedSubscript:v6];

    objc_sync_exit(v7);
  }
}

- (void)removeSidebandMessageNotificationHandlerForDeviceIdentifier:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_sidebandNotificationHandlersForIdentifier removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (BOOL)validateSessionInfoForEvent:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientShieldSessionIDKey"];
  int v8 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientEventOriginTimeInNativeClockKey"];
  id v9 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    uint64_t v11 = [v10 activeSession];
    *(_DWORD *)buf = 138413058;
    v34 = self;
    __int16 v35 = 2114;
    id v36 = v11;
    __int16 v37 = 2114;
    v38 = v7;
    __int16 v39 = 2114;
    v40 = v8;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ received shield sessionID %{public}@ originTime %{public}@", buf, 0x2Au);
  }
  v32 = self;

  uint64_t v12 = +[CMContinuityCaptureSessionStateManager sharedInstance];
  id v13 = [v12 activeSession];
  if (v13)
  {
    __int16 v14 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    id v3 = [v14 activeSession];
    uint64_t v15 = [v3 shieldSessionID];
    if (!v15)
    {

      BOOL v25 = 1;
LABEL_20:

      goto LABEL_21;
    }
    v4 = (void *)v15;
    v30 = v14;
    if (!v7) {
      goto LABEL_15;
    }
  }
  else if (!v7)
  {
    goto LABEL_16;
  }
  v31 = v8;
  uint64_t v16 = +[CMContinuityCaptureSessionStateManager sharedInstance];
  v17 = [v16 activeSession];
  uint64_t v18 = [v17 shieldSessionID];
  if (!v18)
  {

    int v8 = v31;
    if (v13)
    {
LABEL_15:
    }
LABEL_16:

LABEL_17:
    uint64_t v12 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v32;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ out of session event %@", buf, 0x16u);
    }
    BOOL v25 = 0;
    goto LABEL_20;
  }
  v19 = (void *)v18;
  id v29 = v6;
  uint64_t v20 = +[CMContinuityCaptureSessionStateManager sharedInstance];
  id v21 = [v20 activeSession];
  int v22 = [v21 shieldSessionID];
  v23 = v7;
  id v24 = v22;
  id v28 = v23;
  char v27 = objc_msgSend(v22, "isEqualToString:");

  if (v13)
  {
  }
  id v7 = v28;
  id v6 = v29;
  int v8 = v31;
  if ((v27 & 1) == 0) {
    goto LABEL_17;
  }
  BOOL v25 = 1;
LABEL_21:

  return v25;
}

- (BOOL)setupRPClient
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x263F62B70]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke;
  v17[3] = &unk_264C990F8;
  objc_copyWeak(&v18, &location);
  v4 = (void *)MEMORY[0x237DFB780](v17);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_52;
  v15[3] = &unk_264C990F8;
  objc_copyWeak(&v16, &location);
  id v5 = (void *)MEMORY[0x237DFB780](v15);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_53;
  v12[3] = &unk_264C99120;
  objc_copyWeak(&v14, &location);
  id v6 = v3;
  id v13 = v6;
  id v7 = (void *)MEMORY[0x237DFB780](v12);
  if (v6)
  {
    int v8 = self;
    objc_sync_enter(v8);
    objc_storeStrong((id *)&v8->_rpCompanionLinkClient, v3);
    objc_sync_exit(v8);

    [v6 setDispatchQueue:v8->_queue];
    [v6 setInvalidationHandler:v4];
    [v6 setInterruptionHandler:v5];
    [v6 setErrorFlagsChangedHandler:v7];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_54;
    v10[3] = &unk_264C99660;
    objc_copyWeak(&v11, &location);
    [v6 registerEventID:@"ContinuityCaptureCompanionSessionEventID" options:0 handler:v10];
    objc_destroyWeak(&v11);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v6 != 0;
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_queue_t v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Client Invalidated", (uint8_t *)&v4, 0xCu);
  }
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_52(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_queue_t v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Rapport Client Interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_53(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_queue_t v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = [*(id *)(a1 + 32) errorFlags];
    int v7 = 138412546;
    id v8 = WeakRetained;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Client ErrorChange, newError %llu", (uint8_t *)&v7, 0x16u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = v5;
  if (v5) {
    [v5 updateState];
  }
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  int v7 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      __int16 v9 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v80 = (id *)objc_loadWeakRetained(v7);
        *(_DWORD *)buf = 138412802;
        v96 = v80;
        __int16 v97 = 2112;
        v98 = v5;
        __int16 v99 = 2112;
        v100 = v6;
        _os_log_debug_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEBUG, "%@ Client Event %@ Option %@", buf, 0x20u);
      }
    }
    uint64_t v10 = [(__CFString *)v5 objectForKey:@"ContinuityCaptureRapportClientMessageTypeKey"];

    if (v10)
    {
      if (v6)
      {
        uint64_t v11 = *MEMORY[0x263F62C88];
        uint64_t v12 = [(__CFString *)v6 objectForKeyedSubscript:*MEMORY[0x263F62C88]];
        if (v12)
        {
          v88 = [(__CFString *)v6 objectForKeyedSubscript:v11];
        }
        else
        {
          v88 = 0;
        }
      }
      else
      {
        v88 = 0;
      }
      id v13 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (id *)objc_loadWeakRetained(v7);
        *(_DWORD *)buf = 138412546;
        v96 = v14;
        __int16 v97 = 2112;
        v98 = v88;
        _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ deviceIdentifier %@", buf, 0x16u);
      }
      v87 = [WeakRetained _deviceForIdentifier:v88];
      uint64_t v15 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
      if ([v15 integerValue] == 3)
      {
        id v16 = [(__CFString *)v5 objectForKey:@"ContinuityCaptureRapportClientEventNameKey"];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
          id v18 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientEventNameKey"];
          int v19 = [v18 isEqualToString:@"kCMContinuityCaptureEventUserDisconnect"];

          if (!v19) {
            goto LABEL_80;
          }
          uint64_t v20 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientUserDisconnectReasonKey"];

          if (v20)
          {
            v86 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientUserDisconnectReasonKey"];
          }
          else
          {
            v86 = @"Unknown";
          }
          uint64_t v41 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (id *)objc_loadWeakRetained(v7);
            *(_DWORD *)buf = 138412802;
            v96 = v42;
            __int16 v97 = 2114;
            v98 = v88;
            __int16 v99 = 2114;
            v100 = v86;
            _os_log_impl(&dword_235FC2000, v41, OS_LOG_TYPE_DEFAULT, "%@ User Disconnect for %{public}@ reason %{public}@", buf, 0x20u);
          }
          int v85 = [WeakRetained validateSessionInfoForEvent:v5];
          v43 = +[CMContinuityCaptureSessionStateManager sharedInstance];
          v44 = [v43 activeSession];
          if (v44)
          {
            v45 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            v46 = [v45 activeSession];
            v47 = [v46 device];
            v48 = [v47 deviceIdentifier];
            v49 = [v48 UUIDString];
            int v81 = [v49 isEqualToString:v88];

            if (!v81) {
              goto LABEL_49;
            }
            v43 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            [v43 stopCurrentSession:v86 syncOnOwnedQueue:1];
          }

LABEL_49:
          if (v87) {
            int v50 = v85;
          }
          else {
            int v50 = 0;
          }
          if (v50 == 1)
          {
            v51 = [WeakRetained queue];
            v93[0] = MEMORY[0x263EF8330];
            v93[1] = 3221225472;
            v93[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_58;
            v93[3] = &unk_264C99148;
            id v94 = v87;
            dispatch_async(v51, v93);
          }
          goto LABEL_78;
        }
      }
      else
      {
      }
      id v21 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
      if ([v21 integerValue] == 6
        && ([(__CFString *)v5 objectForKey:@"ContinuityCaptureRapportClientEventCapabilitiesPayloadKey"], (int v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v23 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientEventCapabilitiesPayloadKey"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          BOOL v25 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientEventCapabilitiesPayloadKey"];
          int v26 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            char v27 = (id *)objc_loadWeakRetained(v7);
            *(_DWORD *)buf = 138412546;
            v96 = v27;
            __int16 v97 = 2114;
            v98 = v88;
            _os_log_impl(&dword_235FC2000, v26, OS_LOG_TYPE_DEFAULT, "%@ Received camera capabilities for %{public}@", buf, 0x16u);
          }
          if (v88)
          {
            id v28 = objc_msgSend(WeakRetained[2], "objectForKey:");
            BOOL v29 = v28 == 0;

            if (!v29)
            {
              v30 = CMContinuityCaptureLog(0);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = (id *)objc_loadWeakRetained(v7);
                *(_DWORD *)buf = 138412290;
                v96 = v31;
                _os_log_impl(&dword_235FC2000, v30, OS_LOG_TYPE_DEFAULT, "%@ update device state with new set of capabilities", buf, 0xCu);
              }
              [WeakRetained[2] setObject:v25 forKeyedSubscript:v88];
              v32 = [WeakRetained queue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_59;
              block[3] = &unk_264C990F8;
              objc_copyWeak(&v92, v7);
              dispatch_async(v32, block);

              objc_destroyWeak(&v92);
            }
          }
          goto LABEL_79;
        }
      }
      else
      {
      }
      v33 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
      BOOL v34 = [v33 integerValue] == 4;

      if (v34)
      {
        __int16 v35 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v96 = WeakRetained;
          __int16 v97 = 2114;
          v98 = v88;
          _os_log_impl(&dword_235FC2000, v35, OS_LOG_TYPE_DEFAULT, "%@ Received skip placement step for %{public}@", buf, 0x16u);
        }

        if (!v87) {
          goto LABEL_80;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ![WeakRetained validateSessionInfoForEvent:v5])
        {
          goto LABEL_80;
        }
        id v36 = [v87 queue];
        v89[0] = MEMORY[0x263EF8330];
        v89[1] = 3221225472;
        v89[2] = __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_61;
        v89[3] = &unk_264C99148;
        id v90 = v87;
        dispatch_async(v36, v89);

        BOOL v25 = v90;
        goto LABEL_79;
      }
      __int16 v37 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
      BOOL v38 = [v37 integerValue] == 2;

      if (!v38) {
        goto LABEL_80;
      }
      v86 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientShieldSessionIDKey"];
      __int16 v39 = [(__CFString *)v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientEventOriginTimeInNativeClockKey"];
      v84 = v39;
      if (v39)
      {
        v40 = CMContinuityCaptureGetDateFromTimeString(v39);
      }
      else
      {
        v40 = 0;
      }
      uint64_t v52 = *MEMORY[0x263F62C90];
      v53 = [(__CFString *)v6 objectForKeyedSubscript:*MEMORY[0x263F62C90]];
      if (v53)
      {
      }
      else
      {
        v54 = [(__CFString *)v5 objectForKeyedSubscript:v52];
        BOOL v55 = v54 == 0;

        if (v55)
        {
          +[CMContinuityCaptureSessionStateManager sharedInstance];
          goto LABEL_62;
        }
      }
      v56 = [(__CFString *)v6 objectForKeyedSubscript:v52];
      if (v56) {
        v57 = v6;
      }
      else {
        v57 = v5;
      }
      v58 = [(__CFString *)v57 objectForKeyedSubscript:v52];
      uint64_t v82 = CMContinuityCaptureDeviceModelFromModelString();

      +[CMContinuityCaptureSessionStateManager sharedInstance];
      v59 = LABEL_62:;
      v60 = [v59 activeSession];
      v61 = [v60 shieldSessionID];

      v62 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      v63 = [v62 activeSession];
      v64 = [v63 shieldSessionIDGeneratedTime];

      v65 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413826;
        v96 = WeakRetained;
        __int16 v97 = 2114;
        v98 = v88;
        __int16 v99 = 2114;
        v100 = v86;
        __int16 v101 = 2114;
        v102 = v40;
        __int16 v103 = 1024;
        int v104 = v83;
        __int16 v105 = 2114;
        v106 = v61;
        __int16 v107 = 2114;
        v108 = v64;
        _os_log_impl(&dword_235FC2000, v65, OS_LOG_TYPE_DEFAULT, "%@ Received shield launched event for %{public}@ shieldID %{public}@ generatedTime %{public}@ deviceModel %d. activeSession shieldID %{public}@ generatedTime %{public}@", buf, 0x44u);
      }

      BOOL v66 = 0;
      if (v64 && v40) {
        BOOL v66 = [v64 compare:v40] == 1;
      }
      v67 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      v68 = [v67 activeSession];
      if (v68) {
        BOOL v69 = v86 == 0;
      }
      else {
        BOOL v69 = 1;
      }
      char v70 = v69 || v66;
      if ((v70 & 1) == 0)
      {
        char v71 = objc_msgSend(v61, "isEqualToString:");

        if (v71)
        {
LABEL_77:

LABEL_78:
          BOOL v25 = v86;
LABEL_79:

LABEL_80:
          v76 = WeakRetained;
          objc_sync_enter(v76);
          if (v88)
          {
            v77 = [v76[18] objectForKey:v88];
            BOOL v78 = v77 == 0;

            if (!v78)
            {
              v79 = [v76[18] objectForKeyedSubscript:v88];
              ((void (**)(void, __CFString *, __CFString *))v79)[2](v79, v88, v5);
            }
          }
          objc_sync_exit(v76);

          goto LABEL_84;
        }
        v72 = +[CMContinuityCaptureSessionStateManager sharedInstance];
        v73 = [v72 activeSession];
        [v73 setShieldSessionID:v86];

        v74 = +[CMContinuityCaptureSessionStateManager sharedInstance];
        v75 = [v74 activeSession];
        [v75 setShieldSessionIDGeneratedTime:v40];

        v67 = +[CMContinuityCaptureSessionStateManager sharedInstance];
        v68 = [v67 activeSession];
        [v68 setDeviceModel:v83];
      }

      goto LABEL_77;
    }
  }
LABEL_84:
}

uint64_t __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserDisconnected:1];
}

void __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_59(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateState];
    id WeakRetained = v2;
  }
}

uint64_t __52__CMContinuityCaptureDiscoverySession_setupRPClient__block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlacementStepSkipped:1];
}

- (NSArray)availableClientDevices
{
  id v2 = self;
  objc_sync_enter(v2);
  availableClientDeviceByIdentifiers = v2->_availableClientDeviceByIdentifiers;
  if (availableClientDeviceByIdentifiers)
  {
    uint64_t v4 = [(NSDictionary *)availableClientDeviceByIdentifiers allValues];
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (id)_deviceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSDictionary *)v5->_availableClientDeviceByIdentifiers objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)device:(id)a3 isNearby:(BOOL)a4
{
  int v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(CMContinuityCaptureDiscoverySession *)self _deviceForIdentifier:v6];
  id v8 = [(CMContinuityCaptureDiscoverySession *)self queue];
  dispatch_assert_queue_V2(v8);

  if (!v7 || [v7 nearby] != v4)
  {
    __int16 v9 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = "LEFT";
      int v11 = 138412802;
      uint64_t v12 = self;
      if (v4) {
        uint64_t v10 = "ENTERED";
      }
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 2082;
      id v16 = v10;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ device %{public}@ %{public}s nearby range", (uint8_t *)&v11, 0x20u);
    }

    [(CMContinuityCaptureDiscoverySession *)self updateState];
  }
}

- (void)activate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2080;
    int v11 = "-[CMContinuityCaptureDiscoverySession activate]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CMContinuityCaptureDiscoverySession_activate__block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v6, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__CMContinuityCaptureDiscoverySession_activate__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[32]) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ ContinuityCapture error : discovery client already activated", *(void *)(a1 + 32) format];
    }
    v4[32] = 1;
    id v5 = (void *)*((void *)v4 + 5);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_2;
    v7[3] = &unk_264C99260;
    objc_copyWeak(&v8, v2);
    [v5 activateWithCompletion:v7];
    id v6 = +[CMContinuityCaptureUserOnboarding sharedInstance];
    [v6 addObserver:v4 forKeyPath:@"state" options:3 context:0];

    objc_destroyWeak(&v8);
  }
}

void __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3 && [v3 code])
    {
      id v6 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138412546;
        id v12 = v7;
        __int16 v13 = 2112;
        id v14 = v3;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ RPClient ActivateWithCompletion error %@", buf, 0x16u);
      }
    }
    else
    {
      id v8 = [WeakRetained rpRemoteDisplayDiscovery];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_69;
      v9[3] = &unk_264C99260;
      objc_copyWeak(&v10, v4);
      [v8 activateWithCompletion:v9];

      objc_destroyWeak(&v10);
    }
  }
}

void __47__CMContinuityCaptureDiscoverySession_activate__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained(v4);
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ RPRemoteDisplayDiscovery ActivateWithCompletion error %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    [v8 stopCurrentSession:@"ContinuityCaptureAgent launch" syncOnOwnedQueue:1];

    [WeakRetained updateState];
  }
}

- (void)cancel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = "-[CMContinuityCaptureDiscoverySession cancel]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CMContinuityCaptureDiscoverySession_cancel__block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v6, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __45__CMContinuityCaptureDiscoverySession_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __int16 v10 = WeakRetained;
    if (!WeakRetained[32])
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ ContinuityCapture error : discovery client already cancelled", *(void *)(a1 + 32) format];
      id WeakRetained = v10;
    }
    WeakRetained[32] = 0;
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    int v4 = (void *)v3[5];
    if (v4)
    {
      [v4 invalidate];
      id v5 = (void *)v3[5];
      v3[5] = 0;
    }
    objc_sync_exit(v3);

    id v6 = v3;
    objc_sync_enter(v6);
    id v7 = (void *)v6[6];
    if (v7)
    {
      [v7 invalidate];
      id v8 = (void *)v6[6];
      v6[6] = 0;
    }
    objc_sync_exit(v6);

    int v9 = +[CMContinuityCaptureUserOnboarding sharedInstance];
    [v9 removeObserver:v6 forKeyPath:@"state" context:0];

    *((unsigned char *)v6 + 104) = 1;
    id WeakRetained = v10;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    __int16 v50 = 2080;
    v51 = "-[CMContinuityCaptureDiscoverySession observeValueForKeyPath:ofObject:change:context:]";
    __int16 v52 = 2114;
    id v53 = v9;
    __int16 v54 = 2114;
    id v55 = v10;
    _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@ %{public}@", buf, 0x2Au);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  if ([v9 isEqualToString:@"state"])
  {
    uint64_t v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    BOOL v14 = [v13 integerValue] == 1;

    if (v14)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_264C990F8;
      objc_copyWeak(&v45, (id *)buf);
      dispatch_async(queue, block);
      objc_destroyWeak(&v45);
    }
    goto LABEL_20;
  }
  if ([v9 isEqualToString:@"userDisconnected"])
  {
    id v16 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if ([v16 BOOLValue])
    {
      uint64_t v17 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      char v18 = [v17 BOOLValue];

      if ((v18 & 1) == 0)
      {
        int v19 = self->_queue;
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v41[3] = &unk_264C99120;
        objc_copyWeak(&v43, (id *)buf);
        id v20 = v10;
        id v42 = v20;
        dispatch_async(v19, v41);
        id v21 = [v20 deviceModel];
        BOOL v22 = continuityCaptureNotificationCenter_isiPhone(v21);

        BOOL v38 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
        v23 = @"DISCONNECT_NOTIFICATION_TITLE_IPAD";
        if (v22) {
          v23 = @"DISCONNECT_NOTIFICATION_TITLE_IPHONE";
        }
        v48[0] = v23;
        v47[0] = @"kContinuityCaptureNotificationKeyTitle";
        v47[1] = @"kContinuityCaptureNotificationKeyTitleArgs";
        id v24 = [v20 deviceName];
        v46 = v24;
        uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
        int v26 = (void *)v25;
        char v27 = @"DISCONNECT_NOTIFICATION_BODY_IPAD";
        if (v22) {
          char v27 = @"DISCONNECT_NOTIFICATION_BODY_IPHONE";
        }
        v48[1] = v25;
        v48[2] = v27;
        v47[2] = @"kContinuityCaptureNotificationKeyBody";
        v47[3] = @"kContinuityCaptureNotificationKeyIdentifier";
        id v28 = NSString;
        BOOL v29 = [v20 deviceIdentifier];
        v30 = [v29 UUIDString];
        v31 = [v28 stringWithFormat:@"%@%@", @"CMContinuityCaptureDisconnectNotification", v30];
        v48[3] = v31;
        v48[4] = MEMORY[0x263EFFA88];
        v47[4] = @"kContinuityCaptureNotificationKeyOneTime";
        v47[5] = @"kContinuityCaptureNotificationKeyDeviceModel";
        v32 = [v20 deviceModel];
        v48[5] = v32;
        v33 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:6];
        [v38 scheduleNotification:1 data:v33];

        objc_destroyWeak(&v43);
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  if ([v9 isEqualToString:@"streamIntent"])
  {
    BOOL v34 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if ([v34 BOOLValue])
    {
    }
    else
    {
      __int16 v35 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      int v36 = [v35 BOOLValue];

      if (v36)
      {
        __int16 v37 = self->_queue;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
        v39[3] = &unk_264C990F8;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_async(v37, v39);
        objc_destroyWeak(&v40);
      }
    }
  }
LABEL_20:
  objc_destroyWeak((id *)buf);
}

void __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showIncompatableDeviceNotificationIfApplicable];
    id WeakRetained = v2;
  }
}

void __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    id v3 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    uint64_t v4 = [v3 activeSession];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      id v7 = [v6 activeSession];
      id v8 = [v7 device];
      id v9 = [v8 deviceIdentifier];
      id v10 = [v9 UUIDString];
      id v11 = [*(id *)(a1 + 32) deviceIdentifier];
      uint64_t v12 = [v11 UUIDString];
      int v13 = [v10 isEqualToString:v12];

      if (!v13)
      {
LABEL_6:
        [v14 updateState];
        id WeakRetained = v14;
        goto LABEL_7;
      }
      id v3 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      [v3 stopCurrentSession:@"User disconnect" syncOnOwnedQueue:1];
    }

    goto LABEL_6;
  }
LABEL_7:
}

void __86__CMContinuityCaptureDiscoverySession_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateState];
    id WeakRetained = v2;
  }
}

+ (id)rapportDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 idsDeviceIdentifier];
  if (v5
    && ([v4 idsDeviceIdentifier],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 length]))
  {
    id v6 = [v4 idsDeviceIdentifier];
  }
  else
  {
    id v6 = [v4 identifier];
    if (!v5) {
      goto LABEL_6;
    }
  }

LABEL_6:
  return v6;
}

- (BOOL)isUserSelectedDeviceIfApplicable:(id)a3
{
  return 1;
}

- (id)currentDeviceList
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int CFPreferenceBooleanWithDefault = FigGetCFPreferenceBooleanWithDefault();
  id v4 = [(CMContinuityCaptureDiscoverySession *)self rpRemoteDisplayDiscovery];
  id v5 = v4;
  if (CFPreferenceBooleanWithDefault)
  {
    int v6 = [v4 currentState];

    if (v6)
    {
      uint64_t v7 = [(CMContinuityCaptureDiscoverySession *)self currentUserSelectedInSessionDeviceIdentifier];
      if (!v7) {
        goto LABEL_17;
      }
      id v8 = (void *)v7;
      id v9 = [(CMContinuityCaptureDiscoverySession *)self currentUserSelectedInSessionDeviceIdentifier];
      id v10 = [(CMContinuityCaptureDiscoverySession *)self rpRemoteDisplayDiscovery];
      id v11 = [v10 peerDeviceIdentifier];
      char v12 = [v9 isEqualToString:v11];

      if (v12)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        int v13 = [(CMContinuityCaptureDiscoverySession *)self rpRemoteDisplayDiscovery];
        id v5 = [v13 discoveredDevices];

        uint64_t v14 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v30;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v5);
              }
              char v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              int v19 = [v18 identifier];
              id v20 = [(CMContinuityCaptureDiscoverySession *)self rpRemoteDisplayDiscovery];
              id v21 = [v20 peerDeviceIdentifier];
              int v22 = [v19 isEqualToString:v21];

              if (v22)
              {
                char v27 = CMContinuityCaptureLog(0);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  __int16 v35 = self;
                  __int16 v36 = 2114;
                  __int16 v37 = v18;
                  _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, "%@ found selected device %{public}@", buf, 0x16u);
                }

                id v28 = self;
                objc_sync_enter(v28);
                objc_storeStrong((id *)&v28->_currentUserSelectedInSessionDevice, v18);
                objc_sync_exit(v28);

                v33 = v18;
                uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
                goto LABEL_16;
              }
            }
            uint64_t v15 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        v23 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureDiscoverySession currentDeviceList](self);
        }
      }
      else
      {
LABEL_17:
        v23 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureDiscoverySession currentDeviceList](self);
        }
      }
    }
    else
    {
      v23 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureDiscoverySession currentDeviceList](self);
      }
    }

    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v24 = [v4 discoveredDevices];
LABEL_16:
    uint64_t v25 = (void *)v24;
  }
  return v25;
}

- (id)discoveredLocalDevices
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (discoveredLocalDevices_onceToken != -1) {
    dispatch_once(&discoveredLocalDevices_onceToken, &__block_literal_global_94);
  }
  uint64_t v3 = discoveredLocalDevices_localDevice;
  if (discoveredLocalDevices_localDevice)
  {
    id v4 = [(id)discoveredLocalDevices_identifier UUIDString];
    [v2 setObject:v3 forKeyedSubscript:v4];
  }
  return v2;
}

void __61__CMContinuityCaptureDiscoverySession_discoveredLocalDevices__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)discoveredLocalDevices_identifier;
  discoveredLocalDevices_identifier = v0;

  id v6 = [MEMORY[0x263EFA598] continuityCaptureCameraCapabilities];
  if (v6)
  {
    id v2 = [[CMContinuityCaptureCapabilities alloc] initWithDictionaryRepresentation:v6];
    uint64_t v3 = [CMContinuityCaptureTransportNWDevice alloc];
    uint64_t v4 = [(CMContinuityCaptureTransportNWDevice *)v3 initWithCapabilities:v2 identifier:discoveredLocalDevices_identifier remote:1];
    id v5 = (void *)discoveredLocalDevices_localDevice;
    discoveredLocalDevices_localDevice = v4;
  }
}

- (id)discoveredRapportDevices
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(CMContinuityCaptureDiscoverySession *)self currentDeviceList];
  id v94 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v116 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v118 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v136 = self;
    __int16 v137 = 2114;
    v138 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ RapportDevices : %{public}@", buf, 0x16u);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v131 objects:v164 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v132;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v132 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        id v11 = NSNumber;
        if (v10)
        {
          [*(id *)(*((void *)&v131 + 1) + 8 * i) operatingSystemVersion];
          uint64_t v12 = v128;
        }
        else
        {
          uint64_t v12 = 0;
          uint64_t v128 = 0;
          uint64_t v129 = 0;
          uint64_t v130 = 0;
        }
        int v13 = [v11 numberWithInteger:v12];
        uint64_t v14 = [v10 idsDeviceIdentifier];
        [v116 setObject:v13 forKeyedSubscript:v14];

        uint64_t v15 = NSNumber;
        if (v10)
        {
          [v10 operatingSystemVersion];
          uint64_t v16 = v126;
        }
        else
        {
          uint64_t v16 = 0;
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          uint64_t v127 = 0;
        }
        uint64_t v17 = [v15 numberWithInteger:v16];
        char v18 = [v10 idsDeviceIdentifier];
        [v118 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v131 objects:v164 count:16];
    }
    while (v7);
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v5;
  int v19 = v116;
  uint64_t v112 = [obj countByEnumeratingWithState:&v121 objects:v163 count:16];
  if (v112)
  {
    uint64_t v107 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v112; ++j)
      {
        if (*(void *)v122 != v107) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v121 + 1) + 8 * j);
        int v22 = +[CMContinuityCaptureDiscoverySession rapportDeviceIdentifier:v21];
        v23 = [v21 name];
        int v24 = [v21 statusFlags];
        __int16 v25 = [v21 statusFlags];
        int v26 = [v21 cameraState];
        uint64_t v119 = [v21 model];
        if (v22)
        {
          v117 = v23;
          char v27 = [v19 objectForKey:v22];

          if (!v27)
          {
            id v28 = CMContinuityCaptureLog(0);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v136 = self;
              __int16 v137 = 2114;
              v138 = v22;
              _os_log_impl(&dword_235FC2000, v28, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) Missing device from rp display device list", buf, 0x16u);
            }
          }
          unint64_t v113 = v24 & 0x1000000;
          uint64_t v114 = j;
          unint64_t v108 = v25 & 0x200;
          long long v29 = [(CMContinuityCaptureDiscoverySession *)self rpRemoteDisplayDiscovery];
          long long v30 = [v29 dedicatedDevice];
          long long v31 = [v30 idsDeviceIdentifier];
          int v102 = [v31 isEqual:v22];

          BOOL v32 = [(CMContinuityCaptureProximityMonitor *)self->_proximityMonitor isDeviceNearby:v22];
          v33 = [v19 objectForKeyedSubscript:v22];
          uint64_t v115 = [v33 unsignedLongValue];

          BOOL v34 = [v118 objectForKeyedSubscript:v22];
          uint64_t v106 = [v34 unsignedLongValue];

          __int16 v35 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v98 = v26 == 1;
            __int16 v36 = [v21 cameraCapabilities];
            uint64_t v37 = [v21 statusFlags];
            *(_DWORD *)buf = 138415618;
            v136 = self;
            __int16 v137 = 2114;
            v138 = v22;
            __int16 v139 = 2114;
            v140 = v117;
            __int16 v141 = 2114;
            uint64_t v142 = v119;
            __int16 v143 = 1024;
            int v144 = v113 >> 24;
            __int16 v145 = 1024;
            int v146 = v108 >> 9;
            __int16 v147 = 1024;
            BOOL v148 = v98;
            __int16 v149 = 1024;
            BOOL v150 = v32;
            __int16 v151 = 1024;
            BOOL v152 = v36 != 0;
            int v19 = v116;
            __int16 v153 = 2048;
            uint64_t v154 = v115;
            __int16 v155 = 2048;
            uint64_t v156 = v106;
            __int16 v157 = 2048;
            v158 = v21;
            __int16 v159 = 2048;
            uint64_t v160 = v37;
            __int16 v161 = 1024;
            int v162 = v102;
            _os_log_impl(&dword_235FC2000, v35, OS_LOG_TYPE_DEFAULT, "%@ Client Device Identifier:%{public}@ Name:%{public}@ Model:%{public}@ Wired:%d Wireless:%d Magic:%d Nearby:%d Capabilities:%d Version:%llu.%llu devicePtr:%p status:%lx isDedicated:%d", buf, 0x76u);
          }
          BOOL v38 = (void *)v119;
          if (GestaltProductTypeStringToDeviceClass() == 11)
          {
            [(NSMutableDictionary *)self->_availableCapabilitiesByIdentifiers removeObjectForKey:v22];
LABEL_104:
            uint64_t j = v114;
            v23 = v117;
            goto LABEL_105;
          }
          id v40 = [(CMContinuityCaptureDiscoverySession *)self validateCapabilitiesAndCacheIncompatibleNotificationIfApplicable:v21 majorVersion:v115];
          uint64_t v41 = [(CMContinuityCaptureDiscoverySession *)self _deviceForIdentifier:v22];
          if (v41)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v40)
              {
                [v41 setCapabilities:v40];
                goto LABEL_38;
              }
            }
          }
          if (v40)
          {
LABEL_38:
            [v40 capabilitiesVersion];
            if (v120 <= 300)
            {
              id v42 = CMContinuityCaptureLog(0);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v136 = self;
                __int16 v137 = 2114;
                v138 = v22;
                id v43 = v42;
                v44 = "%@ Support with sidecar for %{public}@";
                goto LABEL_87;
              }
LABEL_88:

              [(NSMutableDictionary *)self->_availableCapabilitiesByIdentifiers removeObjectForKey:v22];
LABEL_103:

              goto LABEL_104;
            }
            if ([v40 userDisabled])
            {
              id v42 = CMContinuityCaptureLog(0);
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_88;
              }
              *(_DWORD *)buf = 138412546;
              v136 = self;
              __int16 v137 = 2114;
              v138 = v22;
              id v43 = v42;
              v44 = "%@ skip %{public}@ device since it's disabled by user";
LABEL_87:
              _os_log_impl(&dword_235FC2000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 0x16u);
              goto LABEL_88;
            }
            int v99 = 1;
          }
          else
          {
            int v99 = 0;
          }
          if (!v113
            && (([(RPCompanionLinkClient *)self->_rpCompanionLinkClient errorFlags] & 4) != 0 || !v108))
          {
            id v45 = CMContinuityCaptureLog(0);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v136 = self;
              __int16 v137 = 2114;
              v138 = v22;
              _os_log_impl(&dword_235FC2000, v45, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) RPError : USB inactive and WifiOff", buf, 0x16u);
            }

            if (!v108)
            {
              id v42 = CMContinuityCaptureLog(0);
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_88;
              }
              *(_DWORD *)buf = 138412546;
              v136 = self;
              __int16 v137 = 2114;
              v138 = v22;
              id v43 = v42;
              v44 = "%@ (%{public}@) non wired with wifip2p2 disabled";
              goto LABEL_87;
            }
          }
          v46 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
          [v46 unscheduleNotificationForDeviceIdentifier:v22 type:14 clearHistory:0];

          if (v41)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              BOOL v95 = v32;
              v47 = CMContinuityCaptureLog(0);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v136 = self;
                __int16 v137 = 2114;
                v138 = v41;
                __int16 v139 = 2114;
                v140 = v117;
                _os_log_impl(&dword_235FC2000, v47, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ name %{public}@ present", buf, 0x20u);
              }
              uint64_t v109 = v22;

              v48 = +[CMContinuityCaptureSessionStateManager sharedInstance];
              uint64_t v49 = [v48 activeSession];
              if (v49)
              {
                __int16 v103 = (void *)v49;
                v88 = +[CMContinuityCaptureSessionStateManager sharedInstance];
                __int16 v50 = [v88 activeSession];
                v51 = [v50 device];
                __int16 v52 = [v51 deviceIdentifier];
                id v53 = [v52 UUIDString];
                int v91 = [v53 isEqualToString:v109];

                if (v91)
                {
                  if (v113) {
                    uint64_t v54 = 2;
                  }
                  else {
                    uint64_t v54 = 1;
                  }
                  v48 = +[CMContinuityCaptureSessionStateManager sharedInstance];
                  id v55 = [v48 activeSession];
                  [v55 setTransport:v54];

                  goto LABEL_64;
                }
              }
              else
              {
LABEL_64:
              }
              uint64_t v56 = [v41 device];
              char v57 = [v21 isEqual:v56];

              if ((v57 & 1) == 0) {
                [v41 resetDevice:v21];
              }
              int v22 = v109;
              [v94 setObject:v41 forKeyedSubscript:v109];
              v58 = [v94 objectForKeyedSubscript:v109];
              [v58 setNearby:v95];

              v59 = [v94 objectForKeyedSubscript:v109];
              [v59 setDeviceMajorVersion:v115];

              v60 = [v94 objectForKeyedSubscript:v109];
              [v60 setDeviceMinorVersion:v106];

              v61 = [v94 objectForKeyedSubscript:v109];
              [v61 notifyDeviceStateChange];

              int v19 = v116;
            }
            if (!v99) {
              goto LABEL_103;
            }
LABEL_102:
            [(CMContinuityCaptureProximityMonitor *)self->_proximityMonitor beginTracking:v22];
            goto LABEL_103;
          }
          if (!v99)
          {
            v73 = [(NSMutableDictionary *)self->_availableCapabilitiesByIdentifiers objectForKey:v22];

            if (!v73)
            {
              [(NSMutableDictionary *)self->_availableCapabilitiesByIdentifiers setObject:MEMORY[0x263EFFA78] forKeyedSubscript:v22];
              if (v113) {
                uint64_t v74 = 2;
              }
              else {
                uint64_t v74 = 1;
              }
              +[CMContinuityCaptureTransportRapportDevice queryCameraCapabilitiesFromRemoteDevice:v21 transport:v74];
            }
            goto LABEL_103;
          }
          v62 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413314;
            v136 = self;
            __int16 v137 = 2114;
            v138 = v22;
            __int16 v139 = 2114;
            v140 = v117;
            __int16 v141 = 2048;
            uint64_t v142 = (uint64_t)v40;
            __int16 v143 = 1024;
            int v144 = v102;
            _os_log_impl(&dword_235FC2000, v62, OS_LOG_TYPE_DEFAULT, "%@ New rapport client device %{public}@ name %{public}@ capabilities %p isDedicated: %d", buf, 0x30u);
          }

          v63 = [[CMContinuityCaptureTransportRapportDevice alloc] initWithRapportDevice:v21 capabilities:v40 remote:1];
          v64 = v63;
          if (v102) {
            [(CMContinuityCaptureTransportRapportDevice *)v63 setPlacementStepSkipped:1];
          }
          if (!v64)
          {
            id v42 = CMContinuityCaptureLog(0);
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_88;
            }
            *(_DWORD *)buf = 138412546;
            v136 = self;
            __int16 v137 = 2114;
            v138 = v22;
            id v43 = v42;
            v44 = "%@ Failed to create for device %{public}@";
            goto LABEL_87;
          }
          v65 = +[CMContinuityCaptureSessionStateManager sharedInstance];
          uint64_t v66 = [v65 activeSession];
          BOOL v96 = v32;
          if (v66)
          {
            v110 = (void *)v66;
            int v104 = v65;
            v67 = v64;
            v68 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            v100 = [v68 activeSession];
            id v92 = [v100 device];
            v89 = [v92 deviceIdentifier];
            BOOL v69 = [v89 UUIDString];
            if ([v69 isEqualToString:v22])
            {
              v87 = v68;
              char v70 = v22;
              int v85 = +[CMContinuityCaptureSessionStateManager sharedInstance];
              char v71 = [v85 activeSession];
              v72 = [v71 device];
              char v86 = [v72 isEqual:v67];

              v64 = v67;
              if ((v86 & 1) == 0)
              {
                v65 = +[CMContinuityCaptureSessionStateManager sharedInstance];
                v110 = [v65 activeSession];
                [v110 setDevice:v64];
                int v22 = v70;
                goto LABEL_91;
              }
LABEL_93:
              v75 = +[CMContinuityCaptureSessionStateManager sharedInstance];
              uint64_t v76 = [v75 activeSession];
              if (v76)
              {
                __int16 v105 = (void *)v76;
                __int16 v101 = +[CMContinuityCaptureSessionStateManager sharedInstance];
                v93 = [v101 activeSession];
                v77 = [v93 device];
                [v77 deviceIdentifier];
                BOOL v78 = v111 = v64;
                v79 = [v78 UUIDString];
                int v90 = [v79 isEqualToString:v70];

                int v22 = v70;
                v64 = v111;

                BOOL v80 = v96;
                if (v90)
                {
                  if (v113) {
                    uint64_t v81 = 2;
                  }
                  else {
                    uint64_t v81 = 1;
                  }
                  v75 = +[CMContinuityCaptureSessionStateManager sharedInstance];
                  uint64_t v82 = [v75 activeSession];
                  [v82 setTransport:v81];

                  v64 = v111;
LABEL_100:
                }
                [(CMContinuityCaptureTransportRapportDevice *)v64 setDeviceMajorVersion:v115];
                [(CMContinuityCaptureTransportRapportDevice *)v64 setDeviceMinorVersion:v106];
                [(CMContinuityCaptureTransportRapportDevice *)v64 setNearby:v80];
                [(NSMutableDictionary *)self->_availableCapabilitiesByIdentifiers removeObjectForKey:v22];
                [v94 setObject:v64 forKeyedSubscript:v22];
                uint64_t v83 = [v94 objectForKeyedSubscript:v22];
                [v83 notifyDeviceStateChange];

                goto LABEL_102;
              }
              int v22 = v70;
              BOOL v80 = v96;
              goto LABEL_100;
            }

            v64 = v67;
            v65 = v104;
LABEL_91:
            char v70 = v22;
          }
          else
          {
            char v70 = v22;
          }

          goto LABEL_93;
        }
        uint64_t v39 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v136 = self;
          _os_log_impl(&dword_235FC2000, v39, OS_LOG_TYPE_DEFAULT, "%@ Missing device identifier", buf, 0xCu);
        }

        BOOL v38 = (void *)v119;
LABEL_105:
      }
      uint64_t v112 = [obj countByEnumeratingWithState:&v121 objects:v163 count:16];
    }
    while (v112);
  }

  return v94;
}

- (id)validateCapabilitiesAndCacheIncompatibleNotificationIfApplicable:(id)a3 majorVersion:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[CMContinuityCaptureDiscoverySession rapportDeviceIdentifier:v5];
  if (!v6)
  {
    id v10 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = [v5 cameraCapabilities];

  if (v7)
  {
    uint64_t v8 = [CMContinuityCaptureCapabilities alloc];
    id v9 = [v5 cameraCapabilities];
    id v10 = [(CMContinuityCaptureCapabilities *)v8 initWithDictionaryRepresentation:v9];

    if (v10)
    {
      [(NSMutableSet *)self->_incompatibleDeviceByNotificationData removeAllObjects];
      goto LABEL_10;
    }
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_availableCapabilitiesByIdentifiers objectForKey:v6];
  if (!v11
    || (uint64_t v12 = (void *)v11,
        -[NSMutableDictionary objectForKeyedSubscript:](self->_availableCapabilitiesByIdentifiers, "objectForKeyedSubscript:", v6), int v13 = objc_claimAutoreleasedReturnValue(), v14 = [v13 count], v13, v12, !v14))
  {
    [(NSMutableSet *)self->_incompatibleDeviceByNotificationData removeAllObjects];
LABEL_14:
    int v19 = 0;
    goto LABEL_15;
  }
  uint64_t v15 = [CMContinuityCaptureCapabilities alloc];
  uint64_t v16 = [(NSMutableDictionary *)self->_availableCapabilitiesByIdentifiers objectForKeyedSubscript:v6];
  id v10 = [(CMContinuityCaptureCapabilities *)v15 initWithDictionaryRepresentation:v16];

  uint64_t v17 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    __int16 v25 = self;
    __int16 v26 = 2114;
    char v27 = v6;
    _os_log_impl(&dword_235FC2000, v17, OS_LOG_TYPE_DEFAULT, "%@ Use queried capabilities for %{public}@", (uint8_t *)&v24, 0x16u);
  }

  [(NSMutableSet *)self->_incompatibleDeviceByNotificationData removeAllObjects];
  if (!v10) {
    goto LABEL_14;
  }
LABEL_10:
  char v18 = [(CMContinuityCaptureCapabilities *)v10 devicesCapabilities];
  if (![v18 count])
  {
    BOOL v21 = [(CMContinuityCaptureCapabilities *)v10 userDisabled];

    if (v21) {
      goto LABEL_19;
    }
    int v19 = v10;
LABEL_15:
    id v20 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412802;
      __int16 v25 = self;
      __int16 v26 = 2114;
      char v27 = v6;
      __int16 v28 = 2114;
      long long v29 = v19;
      _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%@ skip %{public}@ device since it's missing camera capabilities %{public}@", (uint8_t *)&v24, 0x20u);
    }

    id v10 = 0;
    goto LABEL_20;
  }

LABEL_19:
  int v22 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v22 unscheduleNotificationForDeviceIdentifier:v6 type:8 clearHistory:1];

  int v19 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v19 unscheduleNotificationForDeviceIdentifier:v6 type:9 clearHistory:1];
LABEL_20:

LABEL_21:
  return v10;
}

- (id)discoveredCompatibleDevices:(id)a3 rapportDevices:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v9 = v5;
  id v10 = [v5 allKeys];
  uint64_t v11 = (void *)[v8 initWithArray:v10];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [v6 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        char v18 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = self;
          __int16 v41 = 2114;
          uint64_t v42 = v17;
          _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%@ Support with rapport for %{public}@", buf, 0x16u);
        }

        [v11 removeObject:v17];
        int v19 = [v6 objectForKeyedSubscript:v17];
        [v7 setObject:v19 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v14);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = [v11 allObjects];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        __int16 v26 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = self;
          __int16 v41 = 2114;
          uint64_t v42 = v25;
          _os_log_impl(&dword_235FC2000, v26, OS_LOG_TYPE_DEFAULT, "%@ Support with sidecar for %{public}@", buf, 0x16u);
        }

        char v27 = [v9 objectForKeyedSubscript:v25];
        [v7 setObject:v27 forKeyedSubscript:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v22);
  }

  return v7;
}

+ (void)unscheduleAllNotificationForDeviceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v4 unscheduleNotificationForDeviceIdentifier:v3 type:8 clearHistory:0];

  id v5 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v5 unscheduleNotificationForDeviceIdentifier:v3 type:9 clearHistory:0];

  id v6 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v6 unscheduleNotificationForDeviceIdentifier:v3 type:13 clearHistory:0];

  id v7 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v7 unscheduleNotificationForDeviceIdentifier:v3 type:14 clearHistory:0];

  id v8 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v8 unscheduleNotificationForDeviceIdentifier:v3 type:2 clearHistory:0];

  id v9 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v9 unscheduleNotificationForDeviceIdentifier:v3 type:3 clearHistory:0];

  id v10 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v10 unscheduleNotificationForDeviceIdentifier:v3 type:1 clearHistory:0];

  id v11 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v11 unscheduleNotificationForDeviceIdentifier:v3 type:11 clearHistory:0];
}

- (void)updateState
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(RPCompanionLinkClient *)self->_rpCompanionLinkClient errorFlags];
    *(_DWORD *)buf = 138412546;
    v93 = self;
    __int16 v94 = 2048;
    uint64_t v95 = v4;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ RapportErrorFlags : %llu", buf, 0x16u);
  }

  v72 = [(CMContinuityCaptureDiscoverySession *)self discoveredLocalDevices];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v5 = [v72 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v85 objects:v91 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v86 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        availableClientDeviceByIdentifiers = self->_availableClientDeviceByIdentifiers;
        id v11 = [v9 deviceIdentifier];
        uint64_t v12 = [v11 UUIDString];
        uint64_t v13 = [(NSDictionary *)availableClientDeviceByIdentifiers objectForKey:v12];
        if (v13)
        {
        }
        else
        {
          char v14 = [(NSMutableSet *)self->_observedDevices containsObject:v9];

          if ((v14 & 1) == 0)
          {
            uint64_t v15 = [v9 magicStateMonitor];
            [v15 setupMagicStateListener];

            uint64_t v16 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            uint64_t v17 = [v16 queue];
            dispatch_assert_queue_not_V2(v17);

            char v18 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            int v19 = [v18 queue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke;
            block[3] = &unk_264C99080;
            void block[4] = v9;
            void block[5] = self;
            dispatch_async_and_wait(v19, block);

            [v9 addObserver:self forKeyPath:@"userDisconnected" options:3 context:0];
            [(NSMutableSet *)self->_observedDevices addObject:v9];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v85 objects:v91 count:16];
    }
    while (v6);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v20 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers allKeys];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v81 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void *)(*((void *)&v80 + 1) + 8 * j);
        uint64_t v25 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
        if ([v25 canDeferTermination])
        {
          __int16 v26 = [v72 objectForKey:v24];
          BOOL v27 = v26 == 0;

          if (v27)
          {
            __int16 v28 = CMContinuityCaptureLog(0);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              long long v29 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
              *(_DWORD *)buf = 138412546;
              v93 = self;
              __int16 v94 = 2114;
              uint64_t v95 = (uint64_t)v29;
              _os_log_impl(&dword_235FC2000, v28, OS_LOG_TYPE_DEFAULT, "%@ mark %{public}@ as deferred", buf, 0x16u);
            }
            long long v30 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
            [v30 setTerminationDeferred:1];

            long long v31 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
            [v72 setObject:v31 forKeyedSubscript:v24];
            goto LABEL_30;
          }
        }
        else
        {
        }
        long long v31 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
        if ([v31 terminationDeferred])
        {
          long long v32 = [v72 objectForKey:v24];
          BOOL v33 = v32 == 0;

          if (v33) {
            goto LABEL_31;
          }
          long long v34 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            long long v35 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
            *(_DWORD *)buf = 138412546;
            v93 = self;
            __int16 v94 = 2114;
            uint64_t v95 = (uint64_t)v35;
            _os_log_impl(&dword_235FC2000, v34, OS_LOG_TYPE_DEFAULT, "%@ mark %{public}@ as un-deferred", buf, 0x16u);
          }
          long long v31 = [v72 objectForKeyedSubscript:v24];
          [v31 setTerminationDeferred:0];
        }
LABEL_30:

LABEL_31:
        long long v36 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
        if ([v36 userDisconnected])
        {
          long long v37 = [(NSDictionary *)self->_availableClientDeviceByIdentifiers objectForKeyedSubscript:v24];
          if ([v37 canReconnect])
          {
            BOOL v38 = [v72 objectForKey:v24];
            BOOL v39 = v38 == 0;

            if (v39) {
              continue;
            }
            long long v36 = [v72 objectForKeyedSubscript:v24];
            [v36 setUserDisconnected:0];
          }
          else
          {
          }
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v80 objects:v90 count:16];
    }
    while (v21);
  }

  [(CMContinuityCaptureDiscoverySession *)self willChangeValueForKey:@"availableClientDevices"];
  id obj = self;
  objc_sync_enter(obj);
  v67 = self->_availableClientDeviceByIdentifiers;
  id v40 = (NSDictionary *)[objc_alloc(NSDictionary) initWithDictionary:v72];
  __int16 v41 = self->_availableClientDeviceByIdentifiers;
  self->_availableClientDeviceByIdentifiers = v40;

  objc_sync_exit(obj);
  [(CMContinuityCaptureDiscoverySession *)obj didChangeValueForKey:@"availableClientDevices"];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v66 = [(NSDictionary *)v67 allKeys];
  uint64_t v69 = [v66 countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v69)
  {
    uint64_t v68 = *(void *)v77;
    v65 = @"User disabled Continuity Camera in Settings";
    do
    {
      for (uint64_t k = 0; k != v69; ++k)
      {
        if (*(void *)v77 != v68) {
          objc_enumerationMutation(v66);
        }
        uint64_t v43 = *(void *)(*((void *)&v76 + 1) + 8 * k);
        uint64_t v44 = objc_msgSend(v72, "objectForKey:", v43, v65);
        BOOL v45 = v44 == 0;

        if (v45)
        {
          char v70 = [(NSDictionary *)v67 objectForKeyedSubscript:v43];
          v46 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v93 = obj;
            __int16 v94 = 2114;
            uint64_t v95 = (uint64_t)v70;
            _os_log_impl(&dword_235FC2000, v46, OS_LOG_TYPE_DEFAULT, "%@ terminate %{public}@", buf, 0x16u);
          }

          +[CMContinuityCaptureDiscoverySession unscheduleAllNotificationForDeviceIdentifier:v43];
          v47 = +[CMContinuityCaptureSessionStateManager sharedInstance];
          v48 = [v47 activeSession];
          if (v48)
          {
            uint64_t v49 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            __int16 v50 = [v49 activeSession];
            v51 = [v50 device];
            __int16 v52 = [v51 deviceIdentifier];
            id v53 = [v52 UUIDString];
            int v54 = [v53 isEqualToString:v43];

            if (v54)
            {
              id v55 = [v70 capabilities];
              if (v55
                && ([v70 capabilities],
                    uint64_t v56 = objc_claimAutoreleasedReturnValue(),
                    int v57 = [v56 userDisabled],
                    v56,
                    v55,
                    v57))
              {
                v47 = +[CMContinuityCaptureSessionStateManager sharedInstance];
                [v47 stopCurrentSession:v65 syncOnOwnedQueue:1];
              }
              else
              {
                v47 = +[CMContinuityCaptureSessionStateManager sharedInstance];
                [v47 stopCurrentSession:@"Device lost" syncOnOwnedQueue:1];
              }
              goto LABEL_53;
            }
          }
          else
          {
LABEL_53:
          }
          if ([(NSMutableSet *)obj->_observedDevices containsObject:v70])
          {
            v58 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            v59 = [v58 queue];
            dispatch_assert_queue_not_V2(v59);

            v60 = +[CMContinuityCaptureSessionStateManager sharedInstance];
            v61 = [v60 queue];
            v73[0] = MEMORY[0x263EF8330];
            v73[1] = 3221225472;
            v73[2] = __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke_100;
            v73[3] = &unk_264C99080;
            id v62 = v70;
            id v74 = v62;
            v75 = obj;
            dispatch_async_and_wait(v61, v73);

            [v62 removeObserver:obj forKeyPath:@"userDisconnected" context:0];
            [(NSMutableSet *)obj->_observedDevices removeObject:v62];
          }
          [(CMContinuityCaptureProximityMonitor *)obj->_proximityMonitor endTracking:v43];
          v63 = [(NSDictionary *)v67 objectForKeyedSubscript:v43];
          v64 = [v63 magicStateMonitor];
          [v64 invalidate];

          [(NSMutableDictionary *)obj->_availableCapabilitiesByIdentifiers removeObjectForKey:v43];
          continue;
        }
      }
      uint64_t v69 = [v66 countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v69);
  }
}

uint64_t __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:@"streamIntent" options:3 context:0];
}

uint64_t __50__CMContinuityCaptureDiscoverySession_updateState__block_invoke_100(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"streamIntent" context:0];
}

- (void)showIncompatableDeviceNotificationIfApplicable
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_incompatibleDeviceByNotificationData;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
        id v10 = [v8 objectForKeyedSubscript:@"Type"];
        objc_msgSend(v9, "scheduleNotification:data:", objc_msgSend(v10, "integerValue"), v8);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebandNotificationHandlersForIdentifier, 0);
  objc_storeStrong((id *)&self->_observedDevices, 0);
  objc_storeStrong((id *)&self->_currentUserSelectedInSessionDevice, 0);
  objc_storeStrong((id *)&self->_currentUserSelectedInSessionDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_incompatibleDeviceByNotificationData, 0);
  objc_storeStrong((id *)&self->_incompatibleOSMajorVersion15Devices, 0);
  objc_storeStrong((id *)&self->_proximityMonitor, 0);
  objc_storeStrong((id *)&self->_rpRemoteDisplayDiscovery, 0);
  objc_storeStrong((id *)&self->_rpCompanionLinkClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_availableCapabilitiesByIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableClientDeviceByIdentifiers, 0);
}

- (void)currentDeviceList
{
  id v2 = [a1 rpRemoteDisplayDiscovery];
  [v2 currentState];
  id v3 = [a1 rpRemoteDisplayDiscovery];
  id v9 = [v3 peerDeviceIdentifier];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x1Cu);
}

@end