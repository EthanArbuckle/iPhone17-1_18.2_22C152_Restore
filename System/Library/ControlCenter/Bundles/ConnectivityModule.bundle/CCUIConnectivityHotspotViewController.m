@interface CCUIConnectivityHotspotViewController
+ (BOOL)isSupported;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isHotspotRestricted;
- (BOOL)_toggleState;
- (BOOL)isDiscoverable;
- (CCUIConnectivityHotspotViewController)init;
- (CCUIConnectivityManager)connectivityManager;
- (OS_dispatch_queue)queue;
- (WFPersonalHotspotStateMonitor)phStateMonitor;
- (id)_glyphImageForCurrentState;
- (id)displayName;
- (id)identifier;
- (id)subtitleText;
- (unsigned)connections;
- (void)_hostAPStateChanged;
- (void)_networkTetheringStateChanged;
- (void)_setGlobalServiceState:(int)a3;
- (void)_updateDiscoverability;
- (void)_updateState;
- (void)buttonTapped:(id)a3;
- (void)setConnections:(unsigned int)a3;
- (void)setConnectivityManager:(id)a3;
- (void)setDiscoverable:(BOOL)a3;
- (void)setPhStateMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)startObservingStateChanges;
- (void)stopObservingStateChanges;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CCUIConnectivityHotspotViewController

- (CCUIConnectivityHotspotViewController)init
{
  v3 = objc_msgSend__systemImageNamed_(MEMORY[0x263F1C6B0], a2, @"personalhotspot");
  v6 = objc_msgSend_systemGreenColor(MEMORY[0x263F1C550], v4, v5);
  v22.receiver = self;
  v22.super_class = (Class)CCUIConnectivityHotspotViewController;
  v7 = [(CCUIConnectivityButtonViewController *)&v22 initWithGlyphImage:v3 highlightColor:v6];

  if (v7)
  {
    objc_msgSend_setUseAutomaticSymbolColors_(v7, v8, 1);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ControlCenter.HotspotViewController", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v13 = objc_msgSend_sharedInstance(MEMORY[0x263F33C10], v11, v12);
    objc_storeWeak((id *)&v7->_connectivityManager, v13);
    v16 = objc_msgSend_hotspotStateMonitor(v13, v14, v15);
    objc_storeWeak((id *)&v7->_phStateMonitor, v16);
    v19 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v17, v18);
    objc_msgSend_registerObserver_(v19, v20, (uint64_t)v7);
  }
  return v7;
}

- (id)displayName
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  uint64_t v5 = objc_msgSend_bundleForClass_(v2, v4, v3);
  v7 = objc_msgSend_localizedStringForKey_value_table_(v5, v6, @"CONTROL_CENTER_STATUS_HOTSPOT_NAME", &stru_26F4C07A8, 0);

  return v7;
}

- (id)identifier
{
  return @"com.apple.ControlCenter.Hotspot";
}

- (id)subtitleText
{
  uint64_t v4 = objc_msgSend_connections(self, a2, v2);
  if (!objc_msgSend_isInoperative(self, v5, v6))
  {
    if (objc_msgSend_isEnabled(self, v7, v8))
    {
      if (v4)
      {
        v16 = (void *)MEMORY[0x263F086E0];
        uint64_t v17 = objc_opt_class();
        v19 = objc_msgSend_bundleForClass_(v16, v18, v17);
        uint64_t v12 = objc_msgSend_localizedStringForKey_value_table_(v19, v20, @"CONTROL_CENTER_STATUS_HOTSPOT_CONNECTIONS", &stru_26F4C07A8, @"ControlCenterUI+SystemModules");

        uint64_t v22 = objc_msgSend_localizedStringWithFormat_(NSString, v21, (uint64_t)v12, v4);
        goto LABEL_13;
      }
      int isDiscoverable = objc_msgSend_isDiscoverable(self, v14, v15);
      v30 = (void *)MEMORY[0x263F086E0];
      uint64_t v31 = objc_opt_class();
      uint64_t v12 = objc_msgSend_bundleForClass_(v30, v32, v31);
      if (!isDiscoverable)
      {
        v28 = @"CONTROL_CENTER_STATUS_HOTSPOT_UNDISCOVERABLE";
        goto LABEL_11;
      }
    }
    else
    {
      int v23 = objc_msgSend_isDiscoverable(self, v14, v15);
      v24 = (void *)MEMORY[0x263F086E0];
      uint64_t v25 = objc_opt_class();
      uint64_t v12 = objc_msgSend_bundleForClass_(v24, v26, v25);
      if (!v23)
      {
        v28 = @"CONTROL_CENTER_STATUS_HOTSPOT_OFF";
LABEL_11:
        objc_msgSend_localizedStringForKey_value_table_(v12, v27, (uint64_t)v28, &stru_26F4C07A8, 0);
        goto LABEL_12;
      }
    }
    v28 = @"CONTROL_CENTER_STATUS_HOTSPOT_DISCOVERABLE";
    goto LABEL_11;
  }
  dispatch_queue_t v9 = (void *)MEMORY[0x263F086E0];
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = objc_msgSend_bundleForClass_(v9, v11, v10);
  objc_msgSend_localizedStringForKey_value_table_(v12, v13, @"CONTROL_CENTER_STATUS_HOTSPOT_OFF", &stru_26F4C07A8, 0);
  uint64_t v22 = LABEL_12:;
LABEL_13:
  v33 = (void *)v22;

  return v33;
}

- (void)buttonTapped:(id)a3
{
  id v4 = a3;
  objc_msgSend__toggleState(self, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityHotspotViewController;
  [(CCUIConnectivityButtonViewController *)&v7 buttonTapped:v4];
}

+ (BOOL)isSupported
{
  return MEMORY[0x270F95FB8](@"personal-hotspot", a2);
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityHotspotViewController;
  [(CCUIConnectivityHotspotViewController *)&v10 viewWillAppear:a3];
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateDiscoverability(self, v6, v7);
  objc_msgSend__updateState(self, v8, v9);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CCUIConnectivityHotspotViewController;
  [(CCUIConnectivityHotspotViewController *)&v12 viewDidDisappear:a3];
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
  if (objc_msgSend_isDiscoverable(self, v6, v7))
  {
    uint64_t v8 = *MEMORY[0x263F33C50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_24062E000, v8, OS_LOG_TYPE_DEFAULT, "[Hotspot] Stopping hotspot discoverability after delay", v11, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
    objc_msgSend_setMISDiscoveryState_immediateDisable_(WeakRetained, v10, 0, 0);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_toggleState
{
  char isEnabled = objc_msgSend_isEnabled(self, a2, v2);
  uint64_t v7 = (os_log_t *)MEMORY[0x263F33C50];
  if ((isEnabled & 1) == 0)
  {
    uint64_t v8 = *MEMORY[0x263F33C50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24062E000, v8, OS_LOG_TYPE_DEFAULT, "[Hotspot] Starting hotspot service", buf, 2u);
    }
    objc_msgSend__setGlobalServiceState_(self, v9, 1023);
  }
  if (objc_msgSend_connections(self, v5, v6))
  {
    objc_super v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_24062E000, v12, OS_LOG_TYPE_DEFAULT, "[Hotspot] Stopping hotspot service", v27, 2u);
    }
    objc_msgSend__setGlobalServiceState_(self, v13, 1022);
  }
  else
  {
    int isDiscoverable = objc_msgSend_isDiscoverable(self, v10, v11);
    uint64_t v17 = *v7;
    BOOL v18 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (isDiscoverable)
    {
      if (v18)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_24062E000, v17, OS_LOG_TYPE_DEFAULT, "[Hotspot] Shutting down hotspot discoverability immediately", v26, 2u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
      objc_msgSend_setMISDiscoveryState_immediateDisable_(WeakRetained, v20, 0, 1);
    }
    else
    {
      if (v18)
      {
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_24062E000, v17, OS_LOG_TYPE_DEFAULT, "[Hotspot] Starting hotspot discoverability", v25, 2u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
      objc_msgSend_setMISDiscoveryState_immediateDisable_(WeakRetained, v21, 1, 0);
    }
  }
  objc_msgSend__updateDiscoverability(self, v14, v15);
  objc_msgSend__updateState(self, v22, v23);
  return 1;
}

- (void)_setGlobalServiceState:(int)a3
{
  objc_initWeak(&location, self);
  uint64_t v7 = objc_msgSend_queue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2406360EC;
  block[3] = &unk_2650C94E0;
  objc_copyWeak(&v9, &location);
  int v10 = a3;
  dispatch_async(v7, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)_updateDiscoverability
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24063628C;
  v5[3] = &unk_2650C9530;
  objc_copyWeak(&v6, &location);
  objc_msgSend_asyncMISDiscoveryState_(WeakRetained, v4, (uint64_t)v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updateState
{
  uint64_t v3 = *MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24062E000, v3, OS_LOG_TYPE_DEFAULT, "[Hotspot] Updating state...", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  id v6 = objc_msgSend_queue(self, v4, v5);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_240636558;
  v7[3] = &unk_2650C9580;
  objc_copyWeak(&v8, buf);
  v7[4] = self;
  dispatch_async(v6, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(buf);
}

- (id)_glyphImageForCurrentState
{
  if (!objc_msgSend_isInoperative(self, a2, v2))
  {
    if (objc_msgSend_isEnabled(self, v4, v5))
    {
      id v6 = (void *)MEMORY[0x263F1C6B0];
    }
    else
    {
      int isDiscoverable = objc_msgSend_isDiscoverable(self, v4, v7);
      id v6 = (void *)MEMORY[0x263F1C6B0];
      if (!isDiscoverable) {
        goto LABEL_7;
      }
    }
    objc_msgSend__systemImageNamed_(v6, v4, @"personalhotspot");
    goto LABEL_8;
  }
  id v6 = (void *)MEMORY[0x263F1C6B0];
LABEL_7:
  objc_msgSend__systemImageNamed_(v6, v4, @"personalhotspot.slash");
  id v9 = LABEL_8:;

  return v9;
}

- (void)setDiscoverable:(BOOL)a3
{
  if (self->_discoverable != a3)
  {
    self->_discoverable = a3;
    objc_msgSend_view(self, a2, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNeedsLayout(v5, v3, v4);
  }
}

- (BOOL)_isHotspotRestricted
{
  uint64_t v3 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], a2, v2);
  char isPersonalHotspotModificationAllowed = objc_msgSend_isPersonalHotspotModificationAllowed(v3, v4, v5);

  return isPersonalHotspotModificationAllowed ^ 1;
}

- (void)_networkTetheringStateChanged
{
  uint64_t v3 = *MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_24062E000, v3, OS_LOG_TYPE_DEFAULT, "[Hotspot] Network tethering state changed", v6, 2u);
  }
  objc_msgSend__updateState(self, v4, v5);
}

- (void)_hostAPStateChanged
{
  uint64_t v3 = *MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_24062E000, v3, OS_LOG_TYPE_DEFAULT, "[Hotspot] Host AP state changed", v6, 2u);
  }
  objc_msgSend__updateDiscoverability(self, v4, v5);
}

- (void)startObservingStateChanges
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityHotspotViewController;
  [(CCUIConnectivityButtonViewController *)&v7 startObservingStateChanges];
  uint64_t v5 = objc_msgSend_connectivityManager(self, v3, v4);
  objc_msgSend_addHotspotViewControllerObservingStateChanges_(v5, v6, (uint64_t)self);
}

- (void)stopObservingStateChanges
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityHotspotViewController;
  [(CCUIConnectivityButtonViewController *)&v7 stopObservingStateChanges];
  uint64_t v5 = objc_msgSend_connectivityManager(self, v3, v4);
  objc_msgSend_removeHotspotViewControllerObservingStateChanges_(v5, v6, (uint64_t)self);
}

- (WFPersonalHotspotStateMonitor)phStateMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);

  return (WFPersonalHotspotStateMonitor *)WeakRetained;
}

- (void)setPhStateMonitor:(id)a3
{
}

- (CCUIConnectivityManager)connectivityManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectivityManager);

  return (CCUIConnectivityManager *)WeakRetained;
}

- (void)setConnectivityManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isDiscoverable
{
  return self->_discoverable;
}

- (unsigned)connections
{
  return self->_connections;
}

- (void)setConnections:(unsigned int)a3
{
  self->_connections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_connectivityManager);

  objc_destroyWeak((id *)&self->_phStateMonitor);
}

@end