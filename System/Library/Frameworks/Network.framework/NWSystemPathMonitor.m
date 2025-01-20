@interface NWSystemPathMonitor
+ (id)sharedSystemPathMonitor;
- (BKSApplicationStateMonitor)applicationMonitor;
- (BOOL)getSymptomsFallback;
- (BOOL)interfaceInUse;
- (BOOL)isEthernetPrimary;
- (BOOL)isVPNActive;
- (BOOL)isWiFiPrimary;
- (NSMutableDictionary)perAppVPNEvaluators;
- (NWMonitor)vpnMonitor;
- (NWPathEvaluator)primaryEvaluator;
- (NWSystemPathMonitor)init;
- (OS_dispatch_source)mptcpWatcher;
- (OS_dispatch_source)smoothingTimer;
- (OS_nw_interface_use_observer)interfaceUseObserver;
- (int)symptomsNotifyToken;
- (int)vpnNotifyToken;
- (void)appStateChangedWithUserInfo:(id)a3;
- (void)dealloc;
- (void)eventFired;
- (void)fallbackWatcher;
- (void)registerForSymptomsFallbackNotification;
- (void)registerForVPNNotifications;
- (void)setApplicationMonitor:(id)a3;
- (void)setEthernetPrimary:(BOOL)a3;
- (void)setFallbackWatcher:(void *)a3;
- (void)setInterfaceInUse:(BOOL)a3;
- (void)setInterfaceUseObserver:(id)a3;
- (void)setMptcpWatcher:(id)a3;
- (void)setPerAppVPNEvaluators:(id)a3;
- (void)setPrimaryEvaluator:(id)a3;
- (void)setSmoothingTimer:(id)a3;
- (void)setSymptomsNotifyToken:(int)a3;
- (void)setVpnActive:(BOOL)a3;
- (void)setVpnMonitor:(id)a3;
- (void)setVpnNotifyToken:(int)a3;
- (void)setWifiPrimary:(BOOL)a3;
- (void)startWatchingApplicationStates;
- (void)stopWatchingApplicationStates;
- (void)updateFlags;
- (void)updateVPNMonitor;
@end

@implementation NWSystemPathMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceUseObserver, 0);
  objc_storeStrong((id *)&self->_mptcpWatcher, 0);
  objc_storeStrong((id *)&self->_smoothingTimer, 0);
  objc_storeStrong((id *)&self->_perAppVPNEvaluators, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_primaryEvaluator, 0);

  objc_storeStrong((id *)&self->_vpnMonitor, 0);
}

- (void)setInterfaceInUse:(BOOL)a3
{
  self->_interfaceInUse = a3;
}

- (BOOL)interfaceInUse
{
  return self->_interfaceInUse;
}

- (void)setInterfaceUseObserver:(id)a3
{
}

- (OS_nw_interface_use_observer)interfaceUseObserver
{
  return (OS_nw_interface_use_observer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMptcpWatcher:(id)a3
{
}

- (OS_dispatch_source)mptcpWatcher
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFallbackWatcher:(void *)a3
{
  self->_fallbackWatcher = a3;
}

- (void)fallbackWatcher
{
  return self->_fallbackWatcher;
}

- (void)setSmoothingTimer:(id)a3
{
}

- (OS_dispatch_source)smoothingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPerAppVPNEvaluators:(id)a3
{
}

- (NSMutableDictionary)perAppVPNEvaluators
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplicationMonitor:(id)a3
{
}

- (BKSApplicationStateMonitor)applicationMonitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSymptomsNotifyToken:(int)a3
{
  self->_symptomsNotifyToken = a3;
}

- (int)symptomsNotifyToken
{
  return self->_symptomsNotifyToken;
}

- (void)setVpnNotifyToken:(int)a3
{
  self->_vpnNotifyToken = a3;
}

- (int)vpnNotifyToken
{
  return self->_vpnNotifyToken;
}

- (void)setPrimaryEvaluator:(id)a3
{
}

- (NWPathEvaluator)primaryEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVpnMonitor:(id)a3
{
}

- (NWMonitor)vpnMonitor
{
  return (NWMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVpnActive:(BOOL)a3
{
  self->_vpnActive = a3;
}

- (BOOL)isVPNActive
{
  return self->_vpnActive;
}

- (void)setEthernetPrimary:(BOOL)a3
{
  self->_ethernetPrimary = a3;
}

- (BOOL)isEthernetPrimary
{
  return self->_ethernetPrimary;
}

- (void)setWifiPrimary:(BOOL)a3
{
  self->_wifiPrimary = a3;
}

- (BOOL)isWiFiPrimary
{
  return self->_wifiPrimary;
}

- (BOOL)getSymptomsFallback
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NWSystemPathMonitor *)self symptomsNotifyToken] == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state([(NWSystemPathMonitor *)self symptomsNotifyToken], &state64);
  if (!state) {
    return state64 != 0;
  }
  uint32_t v4 = state;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
  __int16 v21 = 1024;
  uint32_t v22 = v4;
  v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v6, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      v9 = "%{public}s notify_get_state [%u] failed";
LABEL_18:
      v14 = v7;
      os_log_type_t v15 = v8;
      goto LABEL_19;
    }
    if (!v16)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      v9 = "%{public}s notify_get_state [%u] failed, backtrace limit exceeded";
      goto LABEL_18;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    os_log_type_t v12 = type;
    BOOL v13 = os_log_type_enabled(v7, type);
    if (!backtrace_string)
    {
      if (!v13)
      {
LABEL_20:

        if (!v6) {
          return 0;
        }
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      v9 = "%{public}s notify_get_state [%u] failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v12;
LABEL_19:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0x12u);
      goto LABEL_20;
    }
    if (v13)
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      __int16 v23 = 2082;
      v24 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v12, "%{public}s notify_get_state [%u] failed, dumping backtrace:%{public}s", buf, 0x1Cu);
    }

    free(backtrace_string);
  }
  if (v6) {
LABEL_14:
  }
    free(v6);
  return 0;
}

- (void)registerForSymptomsFallbackNotification
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(NWSystemPathMonitor *)self symptomsNotifyToken] == -1)
  {
    int out_token = -1;
    objc_initWeak(&location, self);
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
    }
    v3 = (id)NWCopyInternalQueue_nwQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__NWSystemPathMonitor_registerForSymptomsFallbackNotification__block_invoke;
    handler[3] = &unk_1E523A228;
    objc_copyWeak(&v16, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.symptoms.celloutrankeffective", &out_token, v3, handler);

    if (!v4)
    {
      [(NWSystemPathMonitor *)self setSymptomsNotifyToken:out_token];
      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
    __int16 v21 = 2082;
    uint32_t v22 = "com.apple.symptoms.celloutrankeffective";
    __int16 v23 = 1024;
    uint32_t v24 = v4;
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v13 = 0;
    if (__nwlog_fault(v6, &type, &v13))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          __int16 v21 = 2082;
          uint32_t v22 = "com.apple.symptoms.celloutrankeffective";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl(&dword_1830D4000, v7, v8, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed", buf, 0x1Cu);
        }
      }
      else if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        os_log_type_t v10 = type;
        BOOL v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)buf = 136446978;
            v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
            __int16 v21 = 2082;
            uint32_t v22 = "com.apple.symptoms.celloutrankeffective";
            __int16 v23 = 1024;
            uint32_t v24 = v4;
            __int16 v25 = 2082;
            v26 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          if (!v6) {
            goto LABEL_13;
          }
          goto LABEL_11;
        }
        if (v11)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          __int16 v21 = 2082;
          uint32_t v22 = "com.apple.symptoms.celloutrankeffective";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, no backtrace", buf, 0x1Cu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          __int16 v21 = 2082;
          uint32_t v22 = "com.apple.symptoms.celloutrankeffective";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl(&dword_1830D4000, v7, v12, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, backtrace limit exceeded", buf, 0x1Cu);
        }
      }
    }
    if (!v6)
    {
LABEL_13:
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      return;
    }
LABEL_11:
    free(v6);
    goto LABEL_13;
  }
}

void __62__NWSystemPathMonitor_registerForSymptomsFallbackNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained eventFired];
}

- (void)updateVPNMonitor
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
    _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_INFO, "%{public}s Update VPN monitor due to configuration change", buf, 0xCu);
  }

  uint32_t v4 = [(NWSystemPathMonitor *)v2 vpnMonitor];

  if (v4)
  {
    id v5 = [(NWSystemPathMonitor *)v2 vpnMonitor];
    [v5 removeObserver:v2 forKeyPath:@"status"];

    [(NWSystemPathMonitor *)v2 setVpnMonitor:0];
  }
  v6 = objc_alloc_init(NWParameters);
  int v7 = ne_session_always_on_vpn_configs_present();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  os_log_type_t v8 = (id)gLogObj;
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_INFO, "%{public}s Monitoring Always-On VPN", buf, 0xCu);
    }
    os_log_type_t v10 = @"AOVPN";
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_INFO, "%{public}s Monitoring system VPN", buf, 0xCu);
    }
    os_log_type_t v10 = @"VPN";
  }

  [(NWParameters *)v6 requireNetworkAgentWithDomain:@"NetworkExtension" type:v10];
  BOOL v11 = objc_alloc_init(NWNetworkDescription);
  os_log_type_t v12 = +[NWMonitor monitorWithNetworkDescription:v11 endpoint:0 parameters:v6];
  [(NWSystemPathMonitor *)v2 setVpnMonitor:v12];

  char v13 = [(NWSystemPathMonitor *)v2 vpnMonitor];
  LODWORD(v11) = v13 == 0;

  if (!v11)
  {
    v14 = [(NWSystemPathMonitor *)v2 vpnMonitor];
    [v14 addObserver:v2 forKeyPath:@"status" options:5 context:0];

    if (ne_session_app_vpn_configs_present())
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v15 = (id)gLogObj;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
        _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_INFO, "%{public}s Monitoring Per-App VPN", buf, 0xCu);
      }

      [(NWSystemPathMonitor *)v2 startWatchingApplicationStates];
    }
    else
    {
      [(NWSystemPathMonitor *)v2 stopWatchingApplicationStates];
    }
    goto LABEL_37;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v16 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
  v17 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (!__nwlog_fault(v17, &type, &v24)) {
    goto LABEL_35;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    os_log_type_t v19 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_1830D4000, v18, v19, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed", buf, 0xCu);
    }
LABEL_34:

LABEL_35:
    if (!v17) {
      goto LABEL_37;
    }
LABEL_36:
    free(v17);
    goto LABEL_37;
  }
  if (!v24)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    os_log_type_t v23 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_1830D4000, v18, v23, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_34;
  }
  backtrace_string = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v18 = (id)gLogObj;
  os_log_type_t v21 = type;
  BOOL v22 = os_log_type_enabled(v18, type);
  if (!backtrace_string)
  {
    if (v22)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_1830D4000, v18, v21, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed, no backtrace", buf, 0xCu);
    }
    goto LABEL_34;
  }
  if (v22)
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
    __int16 v28 = 2082;
    v29 = backtrace_string;
    _os_log_impl(&dword_1830D4000, v18, v21, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(backtrace_string);
  if (v17) {
    goto LABEL_36;
  }
LABEL_37:

  objc_sync_exit(v2);
}

- (void)registerForVPNNotifications
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(NWSystemPathMonitor *)self vpnNotifyToken] == -1)
  {
    int out_token = -1;
    objc_initWeak(&location, self);
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
    }
    v3 = (id)NWCopyInternalQueue_nwQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __50__NWSystemPathMonitor_registerForVPNNotifications__block_invoke;
    handler[3] = &unk_1E523A228;
    objc_copyWeak(&v16, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.neconfigurationchanged", &out_token, v3, handler);

    if (!v4)
    {
      [(NWSystemPathMonitor *)self setVpnNotifyToken:out_token];
      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
    __int16 v21 = 2082;
    BOOL v22 = "com.apple.neconfigurationchanged";
    __int16 v23 = 1024;
    uint32_t v24 = v4;
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v13 = 0;
    if (__nwlog_fault(v6, &type, &v13))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.neconfigurationchanged";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl(&dword_1830D4000, v7, v8, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed", buf, 0x1Cu);
        }
      }
      else if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v7 = (id)gLogObj;
        os_log_type_t v10 = type;
        BOOL v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)buf = 136446978;
            v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
            __int16 v21 = 2082;
            BOOL v22 = "com.apple.neconfigurationchanged";
            __int16 v23 = 1024;
            uint32_t v24 = v4;
            __int16 v25 = 2082;
            v26 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          if (!v6) {
            goto LABEL_13;
          }
          goto LABEL_11;
        }
        if (v11)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.neconfigurationchanged";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, no backtrace", buf, 0x1Cu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v7 = (id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.neconfigurationchanged";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl(&dword_1830D4000, v7, v12, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, backtrace limit exceeded", buf, 0x1Cu);
        }
      }
    }
    if (!v6)
    {
LABEL_13:
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      return;
    }
LABEL_11:
    free(v6);
    goto LABEL_13;
  }
}

void __50__NWSystemPathMonitor_registerForVPNNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVPNMonitor];
}

- (void)stopWatchingApplicationStates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NWSystemPathMonitor *)v2 applicationMonitor];

  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint32_t v4 = [(NWSystemPathMonitor *)v2 perAppVPNEvaluators];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
          BOOL v9 = [(NWSystemPathMonitor *)v2 perAppVPNEvaluators];
          os_log_type_t v10 = [v9 objectForKeyedSubscript:v8];

          [v10 removeObserver:v2 forKeyPath:@"path"];
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    BOOL v11 = [(NWSystemPathMonitor *)v2 applicationMonitor];
    [v11 invalidate];

    [(NWSystemPathMonitor *)v2 setApplicationMonitor:0];
  }
  objc_sync_exit(v2);
}

- (void)startWatchingApplicationStates
{
  v3 = self;
  objc_sync_enter(v3);
  uint32_t v4 = [(NWSystemPathMonitor *)v3 applicationMonitor];

  if (!v4)
  {
    gotLoadHelper_x21__OBJC_CLASS___BKSApplicationStateMonitor(v5);
    if (objc_opt_class())
    {
      objc_initWeak(&location, v3);
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NWSystemPathMonitor *)v3 setPerAppVPNEvaluators:v6];

      id v7 = objc_alloc_init(*(Class *)(v2 + 624));
      [(NWSystemPathMonitor *)v3 setApplicationMonitor:v7];

      uint64_t v9 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v10, &location);
      uint64_t v8 = [(NWSystemPathMonitor *)v3 applicationMonitor];
      [v8 setHandler:&v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  objc_sync_exit(v3);
}

void __53__NWSystemPathMonitor_startWatchingApplicationStates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained appStateChangedWithUserInfo:v3];
}

- (void)appStateChangedWithUserInfo:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v29 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
    uint64_t v30 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v44 = 0;
    if (__nwlog_fault((const char *)v30, &type, &v44))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_1830D4000, v31, v32, "%{public}s called with null userInfo", buf, 0xCu);
        }
      }
      else if (v44)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        os_log_type_t v39 = type;
        BOOL v40 = os_log_type_enabled(v31, type);
        if (backtrace_string)
        {
          if (v40)
          {
            *(_DWORD *)buf = 136446466;
            v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
            __int16 v48 = 2082;
            v49 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v31, v39, "%{public}s called with null userInfo, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          if (!v30) {
            goto LABEL_37;
          }
LABEL_36:
          free(v30);
          goto LABEL_37;
        }
        if (v40)
        {
          *(_DWORD *)buf = 136446210;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_1830D4000, v31, v39, "%{public}s called with null userInfo, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        os_log_type_t v41 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_1830D4000, v31, v41, "%{public}s called with null userInfo, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
    if (!v30) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  gotLoadHelper_x8__OBJC_CLASS___BKSApplicationStateMonitor(v5);
  if (objc_opt_class())
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    double Helper_x8__BKSApplicationStateDisplayIDKey = gotLoadHelper_x8__BKSApplicationStateDisplayIDKey(v7);
    id v10 = objc_msgSend(v4, "objectForKeyedSubscript:", **(void **)(v9 + 568), Helper_x8__BKSApplicationStateDisplayIDKey);
    double Helper_x8__BKSApplicationStateProcessIDKey = gotLoadHelper_x8__BKSApplicationStateProcessIDKey(v11);
    long long v14 = objc_msgSend(v4, "objectForKeyedSubscript:", **(void **)(v13 + 608), Helper_x8__BKSApplicationStateProcessIDKey);
    double Helper_x8__BKSApplicationStateKey = gotLoadHelper_x8__BKSApplicationStateKey(v15);
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", **(void **)(v17 + 592), Helper_x8__BKSApplicationStateKey);
    os_log_type_t v19 = v18;
    if (v18 && [v18 unsignedIntValue] == 8)
    {
      v20 = [(NWSystemPathMonitor *)v6 perAppVPNEvaluators];
      __int16 v21 = [v20 objectForKeyedSubscript:v10];

      if (!v21)
      {
        BOOL v22 = objc_alloc_init(NWParameters);
        -[NWParameters setPid:](v22, "setPid:", [v14 intValue]);
        [(NWParameters *)v22 setSourceApplicationWithBundleID:v10];
        [v10 UTF8String];
        __int16 v23 = (void *)NEHelperCopyPerAppDomains();
        uint32_t v24 = v23;
        if (v23
          && object_getClass(v23) == (Class)MEMORY[0x1E4F14568]
          && xpc_array_get_count(v24)
          && (string = xpc_array_get_string(v24, 0)) != 0)
        {
          v43 = [NSString stringWithUTF8String:string];
          __int16 v25 = +[NWHostEndpoint endpointWithHostname:v43 port:@"0"];
        }
        else
        {
          __int16 v25 = 0;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v26 = (id)gLogObj;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          __int16 v48 = 2114;
          v49 = (char *)v10;
          _os_log_impl(&dword_1830D4000, v26, OS_LOG_TYPE_INFO, "%{public}s Start watching path for foreground app %{public}@", buf, 0x16u);
        }

        uint64_t v27 = [[NWPathEvaluator alloc] initWithEndpoint:v25 parameters:v22];
        [(NWPathEvaluator *)v27 addObserver:v6 forKeyPath:@"path" options:5 context:0];
        __int16 v28 = [(NWSystemPathMonitor *)v6 perAppVPNEvaluators];
        [v28 setObject:v27 forKeyedSubscript:v10];

LABEL_21:
      }
    }
    else
    {
      v33 = [(NWSystemPathMonitor *)v6 perAppVPNEvaluators];
      v34 = [v33 objectForKeyedSubscript:v10];

      if (v34)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v35 = (id)gLogObj;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          __int16 v48 = 2114;
          v49 = (char *)v10;
          _os_log_impl(&dword_1830D4000, v35, OS_LOG_TYPE_INFO, "%{public}s Stop watching path for background app %{public}@", buf, 0x16u);
        }

        v36 = [(NWSystemPathMonitor *)v6 perAppVPNEvaluators];
        BOOL v22 = [v36 objectForKeyedSubscript:v10];

        [(NWParameters *)v22 removeObserver:v6 forKeyPath:@"path"];
        v37 = [(NWSystemPathMonitor *)v6 perAppVPNEvaluators];
        [v37 setObject:0 forKeyedSubscript:v10];

        [(NWSystemPathMonitor *)v6 eventFired];
        goto LABEL_21;
      }
    }

    objc_sync_exit(v6);
  }
LABEL_37:
}

- (void)eventFired
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NWSystemPathMonitor *)v2 smoothingTimer];

  if (!v3)
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
    }
    id v4 = (id)NWCopyInternalQueue_nwQueue;
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    [(NWSystemPathMonitor *)v2 setSmoothingTimer:v5];

    uint64_t v6 = [(NWSystemPathMonitor *)v2 smoothingTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33__NWSystemPathMonitor_eventFired__block_invoke;
    handler[3] = &unk_1E524BAA8;
    void handler[4] = v2;
    dispatch_source_set_event_handler(v6, handler);

    double v7 = [(NWSystemPathMonitor *)v2 smoothingTimer];
    dispatch_time_t v8 = dispatch_time(0, 200000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);

    uint64_t v9 = [(NWSystemPathMonitor *)v2 smoothingTimer];
    dispatch_resume(v9);
  }
  objc_sync_exit(v2);
}

uint64_t __33__NWSystemPathMonitor_eventFired__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) smoothingTimer];
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) setSmoothingTimer:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 updateFlags];
}

- (void)updateFlags
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NWSystemPathMonitor *)v2 vpnMonitor];
  uint64_t v4 = [v3 status];

  if (v4 == 1)
  {
    char v5 = 1;
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v6 = [(NWSystemPathMonitor *)v2 perAppVPNEvaluators];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v54 count:16];
    if (v7)
    {
      int v8 = 0;
      char v5 = 0;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          long long v12 = [(NWSystemPathMonitor *)v2 perAppVPNEvaluators];
          uint64_t v13 = [v12 objectForKeyedSubscript:v11];
          long long v14 = [v13 path];

          if ([v14 status] == 1)
          {
            double v15 = [v14 genericNetworkAgentsWithDomain:@"NetworkExtension" type:@"AppVPN"];

            v5 |= v15 != 0;
            v8 |= [v14 usesInterfaceType:1];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v54 count:16];
      }
      while (v7);

      if (v8)
      {
        uint64_t v16 = 1;
        goto LABEL_16;
      }
    }
    else
    {

      char v5 = 0;
    }
  }
  uint64_t v17 = [(NWSystemPathMonitor *)v2 primaryEvaluator];
  v18 = [v17 path];
  uint64_t v16 = [v18 usesInterfaceType:1];

LABEL_16:
  os_log_type_t v19 = [(NWSystemPathMonitor *)v2 primaryEvaluator];
  v20 = [v19 path];
  uint64_t v21 = [v20 usesInterfaceType:3];

  BOOL v22 = [(NWSystemPathMonitor *)v2 primaryEvaluator];
  __int16 v23 = [v22 path];
  uint32_t v24 = [v23 genericNetworkAgentsWithDomain:@"AVConference" type:@"CellularFallback"];

  if (!v16)
  {
    int v26 = 0;
    goto LABEL_20;
  }
  if (tcp_fallback_watcher_fallback_inuse((uint64_t)[(NWSystemPathMonitor *)v2 fallbackWatcher]))
  {
    uint64_t v16 = 0;
    __int16 v25 = " (due to cellular fallback)";
    int v26 = 1;
    goto LABEL_21;
  }
  uint64_t v16 = 0;
  if ([(NWSystemPathMonitor *)v2 getSymptomsFallback])
  {
    __int16 v25 = " (due to reverse cellular fallback)";
    int v26 = 1;
    goto LABEL_21;
  }
  if (sMptcpUsesCell) {
    __int16 v25 = " (due to MPTCP sending on Cell)";
  }
  else {
    __int16 v25 = " (due to cellular fallback from AVConference)";
  }
  int v26 = 1;
  if ((sMptcpUsesCell & 1) == 0 && !v24)
  {
    if ([(NWSystemPathMonitor *)v2 interfaceInUse])
    {
      uint64_t v16 = 0;
      __int16 v25 = " (due to AirDrop using cellular)";
      goto LABEL_21;
    }
    int v26 = 0;
    uint64_t v16 = 1;
LABEL_20:
    __int16 v25 = "";
  }
LABEL_21:
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v27 = (id)gLogObj;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    if (v26) {
      __int16 v28 = "fallback: Wi-Fi shown ";
    }
    else {
      __int16 v28 = "primary: ";
    }
    BOOL v29 = [(NWSystemPathMonitor *)v2 isWiFiPrimary];
    BOOL v30 = [(NWSystemPathMonitor *)v2 isEthernetPrimary];
    BOOL v31 = [(NWSystemPathMonitor *)v2 isVPNActive];
    *(_DWORD *)buf = 136448258;
    v37 = "-[NWSystemPathMonitor updateFlags]";
    __int16 v38 = 2082;
    os_log_type_t v39 = v28;
    __int16 v40 = 1024;
    BOOL v41 = v29;
    __int16 v42 = 1024;
    int v43 = v16;
    __int16 v44 = 2082;
    v45 = v25;
    __int16 v46 = 1024;
    BOOL v47 = v30;
    __int16 v48 = 1024;
    int v49 = v21;
    __int16 v50 = 1024;
    BOOL v51 = v31;
    __int16 v52 = 1024;
    int v53 = v5 & 1;
    _os_log_impl(&dword_1830D4000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s Wi-Fi %{public}s%{BOOL}d->%{BOOL}d%{public}s, Ethernet primary: %{BOOL}d->%{BOOL}d, VPN active: %{BOOL}d->%{BOOL}d", buf, 0x44u);
  }

  if (v16 != [(NWSystemPathMonitor *)v2 isWiFiPrimary]) {
    [(NWSystemPathMonitor *)v2 setWifiPrimary:v16];
  }
  if (v21 != [(NWSystemPathMonitor *)v2 isEthernetPrimary]) {
    [(NWSystemPathMonitor *)v2 setEthernetPrimary:v21];
  }
  if ((v5 & 1) != [(NWSystemPathMonitor *)v2 isVPNActive]) {
    -[NWSystemPathMonitor setVpnActive:](v2, "setVpnActive:");
  }
  objc_sync_exit(v2);
}

- (void)dealloc
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ([(NWSystemPathMonitor *)v2 vpnNotifyToken] != -1)
  {
    notify_cancel([(NWSystemPathMonitor *)v2 vpnNotifyToken]);
    [(NWSystemPathMonitor *)v2 setVpnNotifyToken:0xFFFFFFFFLL];
  }
  id v3 = [(NWSystemPathMonitor *)v2 vpnMonitor];

  if (v3)
  {
    uint64_t v4 = [(NWSystemPathMonitor *)v2 vpnMonitor];
    [v4 removeObserver:v2 forKeyPath:@"status"];

    [(NWSystemPathMonitor *)v2 setVpnMonitor:0];
  }
  if ([(NWSystemPathMonitor *)v2 symptomsNotifyToken] != -1)
  {
    notify_cancel([(NWSystemPathMonitor *)v2 symptomsNotifyToken]);
    [(NWSystemPathMonitor *)v2 setSymptomsNotifyToken:0xFFFFFFFFLL];
  }
  char v5 = [(NWSystemPathMonitor *)v2 primaryEvaluator];

  if (v5)
  {
    uint64_t v6 = [(NWSystemPathMonitor *)v2 primaryEvaluator];
    [v6 removeObserver:v2 forKeyPath:@"path"];

    [(NWSystemPathMonitor *)v2 setPrimaryEvaluator:0];
  }
  uint64_t v7 = [(NWSystemPathMonitor *)v2 smoothingTimer];

  if (v7)
  {
    int v8 = [(NWSystemPathMonitor *)v2 smoothingTimer];
    dispatch_source_cancel(v8);

    [(NWSystemPathMonitor *)v2 setSmoothingTimer:0];
  }
  if ([(NWSystemPathMonitor *)v2 fallbackWatcher])
  {
    tcp_connection_fallback_watcher_destroy((uint64_t)[(NWSystemPathMonitor *)v2 fallbackWatcher]);
    [(NWSystemPathMonitor *)v2 setFallbackWatcher:0];
  }
  uint64_t v9 = [(NWSystemPathMonitor *)v2 mptcpWatcher];

  if (v9)
  {
    id v10 = [(NWSystemPathMonitor *)v2 mptcpWatcher];
    dispatch_source_cancel(v10);

    [(NWSystemPathMonitor *)v2 setMptcpWatcher:0];
  }
  uint64_t v11 = [(NWSystemPathMonitor *)v2 interfaceUseObserver];

  if (v11)
  {
    long long v12 = [(NWSystemPathMonitor *)v2 interfaceUseObserver];
    nw_interface_use_observer_cancel(v12);

    [(NWSystemPathMonitor *)v2 setInterfaceUseObserver:0];
  }
  [(NWSystemPathMonitor *)v2 stopWatchingApplicationStates];
  objc_sync_exit(v2);

  v13.receiver = v2;
  v13.super_class = (Class)NWSystemPathMonitor;
  [(NWSystemPathMonitor *)&v13 dealloc];
}

- (NWSystemPathMonitor)init
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)NWSystemPathMonitor;
  uint64_t v2 = [(NWSystemPathMonitor *)&v41 init];
  if (!v2)
  {
    uint32_t v24 = __nwlog_obj();
    *(_DWORD *)id location = 136446210;
    *(void *)&location[4] = "-[NWSystemPathMonitor init]";
    __int16 v25 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault(v25, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        int v26 = __nwlog_obj();
        os_log_type_t v27 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)id location = 136446210;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_1830D4000, v26, v27, "%{public}s [super init] failed", location, 0xCu);
        }
      }
      else if (v39)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        int v26 = __nwlog_obj();
        os_log_type_t v29 = type;
        BOOL v30 = os_log_type_enabled(v26, type);
        if (backtrace_string)
        {
          if (v30)
          {
            *(_DWORD *)id location = 136446466;
            *(void *)&location[4] = "-[NWSystemPathMonitor init]";
            __int16 v43 = 2082;
            __int16 v44 = (__CFString *)backtrace_string;
            _os_log_impl(&dword_1830D4000, v26, v29, "%{public}s [super init] failed, dumping backtrace:%{public}s", location, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_50;
        }
        if (v30)
        {
          *(_DWORD *)id location = 136446210;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_1830D4000, v26, v29, "%{public}s [super init] failed, no backtrace", location, 0xCu);
        }
      }
      else
      {
        int v26 = __nwlog_obj();
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)id location = 136446210;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_1830D4000, v26, v31, "%{public}s [super init] failed, backtrace limit exceeded", location, 0xCu);
        }
      }
    }
LABEL_50:
    if (v25) {
      free(v25);
    }
    goto LABEL_32;
  }
  if (init_onceToken[0] != -1) {
    dispatch_once(init_onceToken, &__block_literal_global);
  }
  if (!init_hasDelegateEntitlement)
  {
    objc_super v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)id location = 136446722;
    *(void *)&location[4] = "-[NWSystemPathMonitor init]";
    __int16 v43 = 2114;
    __int16 v44 = @"com.apple.private.network.socket-delegate";
    __int16 v45 = 2114;
    __int16 v46 = v14;
    uint64_t v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault(v16, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v17 = (id)gLogObj;
        os_log_type_t v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)id location = 136446722;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          __int16 v43 = 2114;
          __int16 v44 = @"com.apple.private.network.socket-delegate";
          __int16 v45 = 2114;
          __int16 v46 = v14;
          _os_log_impl(&dword_1830D4000, v17, v18, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API", location, 0x20u);
        }
      }
      else if (v39)
      {
        os_log_type_t v19 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v17 = (id)gLogObj;
        os_log_type_t v20 = type;
        BOOL v21 = os_log_type_enabled(v17, type);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)id location = 136446978;
            *(void *)&location[4] = "-[NWSystemPathMonitor init]";
            __int16 v43 = 2114;
            __int16 v44 = @"com.apple.private.network.socket-delegate";
            __int16 v45 = 2114;
            __int16 v46 = v14;
            __int16 v47 = 2082;
            __int16 v48 = v19;
            _os_log_impl(&dword_1830D4000, v17, v20, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API, dumping backtrace:%{public}s", location, 0x2Au);
          }

          free(v19);
          if (!v16) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        if (v21)
        {
          *(_DWORD *)id location = 136446722;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          __int16 v43 = 2114;
          __int16 v44 = @"com.apple.private.network.socket-delegate";
          __int16 v45 = 2114;
          __int16 v46 = v14;
          _os_log_impl(&dword_1830D4000, v17, v20, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API, no backtrace", location, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v17 = (id)gLogObj;
        os_log_type_t v22 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)id location = 136446722;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          __int16 v43 = 2114;
          __int16 v44 = @"com.apple.private.network.socket-delegate";
          __int16 v45 = 2114;
          __int16 v46 = v14;
          _os_log_impl(&dword_1830D4000, v17, v22, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API, backtrace limit exceeded", location, 0x20u);
        }
      }
    }
    if (!v16)
    {
LABEL_31:

LABEL_32:
      long long v12 = 0;
      goto LABEL_33;
    }
LABEL_30:
    free(v16);
    goto LABEL_31;
  }
  [(NWSystemPathMonitor *)v2 setVpnNotifyToken:0xFFFFFFFFLL];
  [(NWSystemPathMonitor *)v2 setSymptomsNotifyToken:0xFFFFFFFFLL];
  id v3 = v2;
  objc_sync_enter(v3);
  [(NWSystemPathMonitor *)v3 registerForVPNNotifications];
  [(NWSystemPathMonitor *)v3 registerForSymptomsFallbackNotification];
  [(NWSystemPathMonitor *)v3 updateVPNMonitor];
  uint64_t v4 = +[NWPathEvaluator sharedDefaultEvaluator];
  [(NWSystemPathMonitor *)v3 setPrimaryEvaluator:v4];

  char v5 = [(NWSystemPathMonitor *)v3 primaryEvaluator];
  [v5 addObserver:v3 forKeyPath:@"path" options:5 context:0];

  objc_initWeak((id *)location, v3);
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  uint64_t v6 = (id)NWCopyInternalQueue_nwQueue;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __27__NWSystemPathMonitor_init__block_invoke_5;
  v37[3] = &unk_1E5243FB0;
  objc_copyWeak(&v38, (id *)location);
  [(NWSystemPathMonitor *)v3 setFallbackWatcher:tcp_connection_fallback_watcher_create(0, v6, v37)];

  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  id v7 = (id)NWCopyInternalQueue_nwQueue;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __27__NWSystemPathMonitor_init__block_invoke_2;
  v34[3] = &unk_1E523A1D8;
  int v8 = v3;
  long long v35 = v8;
  objc_copyWeak(&v36, (id *)location);
  uint64_t v9 = network_config_mptcp_watcher_create((uint64_t)v7, (uint64_t)v34);
  [(NWSystemPathMonitor *)v8 setMptcpWatcher:v9];

  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  id v10 = (id)NWCopyInternalQueue_nwQueue;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __27__NWSystemPathMonitor_init__block_invoke_8;
  v32[3] = &unk_1E523C600;
  objc_copyWeak(&v33, (id *)location);
  uint64_t v11 = nw_interface_use_observer_create("com.apple.network.interface_use.airdrop", v10, v32);
  [(NWSystemPathMonitor *)v8 setInterfaceUseObserver:v11];

  [(NWSystemPathMonitor *)v8 updateFlags];
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)location);
  objc_sync_exit(v8);

  long long v12 = v8;
LABEL_33:

  return v12;
}

void __27__NWSystemPathMonitor_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained eventFired];
}

void __27__NWSystemPathMonitor_init__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v4 = (id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v8 = "-[NWSystemPathMonitor init]_block_invoke_2";
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_ERROR, "%{public}s Error: %d, destroying the MPTCP-watcher", buf, 0x12u);
    }

    char v5 = [*(id *)(a1 + 32) mptcpWatcher];
    dispatch_source_cancel(v5);

    [*(id *)(a1 + 32) setMptcpWatcher:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained eventFired];
  }
}

void __27__NWSystemPathMonitor_init__block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setInterfaceInUse:a2];
    [v4 eventFired];
    id WeakRetained = v4;
  }
}

BOOL __27__NWSystemPathMonitor_init__block_invoke()
{
  BOOL result = NWUtilsCurrentProcessHasEntitlement(@"com.apple.private.network.socket-delegate");
  init_hasDelegateEntitlement = result;
  return result;
}

+ (id)sharedSystemPathMonitor
{
  if (sharedSystemPathMonitor_initEvaluator != -1) {
    dispatch_once(&sharedSystemPathMonitor_initEvaluator, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)sharedSystemPathMonitor_sharedEvaluator;

  return v2;
}

void __46__NWSystemPathMonitor_sharedSystemPathMonitor__block_invoke()
{
  v0 = objc_alloc_init(NWSystemPathMonitor);
  v1 = (void *)sharedSystemPathMonitor_sharedEvaluator;
  sharedSystemPathMonitor_sharedEvaluator = (uint64_t)v0;
}

@end