@interface NWPrivilegedHelper
- (BOOL)startXPCListener;
- (NSMutableArray)allKnownEntitlementGroup;
- (NSMutableDictionary)handlers;
- (NSMutableSet)allKnownEntitlementSet;
- (NWPrivilegedHelper)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)listener;
- (void)handleRequest:(id)a3 onConnection:(id)a4;
- (void)registerHandlerFunction:(void *)a3 type:(int)a4 allowedEntitlementGroup:(id)a5;
- (void)registerHelperFunctions;
- (void)setAllKnownEntitlementGroup:(id)a3;
- (void)setAllKnownEntitlementSet:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)startThrottlePolicyEventListener;
@end

@implementation NWPrivilegedHelper

- (void)registerHelperFunctions
{
  v90[2] = *MEMORY[0x1E4F143B8];
  v89 = @"com.apple.networkd_privileged";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v90[0] = v3;
  v88 = @"com.apple.networkd.disable_opportunistic";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  v90[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleOpportunistic type:2 allowedEntitlementGroup:v5];

  v86 = @"com.apple.networkd_privileged";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  v87[0] = v6;
  v85 = @"com.apple.networkd.persistent_interface";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v87[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleCreateNetworkAgentKernelSocket type:12 allowedEntitlementGroup:v8];

  v83 = @"com.apple.networkd_privileged";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v84[0] = v9;
  v82 = @"com.apple.networkd.advisory_socket";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  v84[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleCreateNetworkAdvisoryKernelSocket type:13 allowedEntitlementGroup:v11];

  v80 = @"com.apple.networkd_privileged";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  v81 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleSetNetworkAgentOnInterface type:8 allowedEntitlementGroup:v13];

  v78 = @"com.apple.networkd_privileged";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
  v79[0] = v14;
  v77 = @"com.apple.networkd.persistent_interface";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  v79[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleSetPersistentNetworkAgentOnInterface type:14 allowedEntitlementGroup:v16];

  v75 = @"com.apple.networkd_privileged";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  v76 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleReloadManagedNetworkSettings type:9 allowedEntitlementGroup:v18];

  v73 = @"com.apple.networkd_privileged";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  v74[0] = v19;
  v72 = @"com.apple.networkd.modify_settings";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  v74[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleCheckMobileAsset type:11 allowedEntitlementGroup:v21];

  v70 = @"com.apple.networkd_privileged";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  v71[0] = v22;
  v69 = @"com.apple.networkd.modify_settings";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v71[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleSetNetworkdSetting type:10 allowedEntitlementGroup:v24];

  v67 = @"com.apple.networkd_privileged";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  v68[0] = v25;
  v66 = @"com.apple.networkd.modify_settings";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  v68[1] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleConstrained type:15 allowedEntitlementGroup:v27];

  v64 = @"com.apple.networkd_privileged";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v65[0] = v28;
  v63 = @"com.apple.networkd.modify_settings";
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v65[1] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleUltraConstrained type:22 allowedEntitlementGroup:v30];

  v61 = @"com.apple.networkd_privileged";
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v62[0] = v31;
  v60 = @"com.apple.networkd.modify_settings";
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  v62[1] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleExpensive type:16 allowedEntitlementGroup:v33];

  v58 = @"com.apple.networkd_privileged";
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  v59 = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleSetupFakeEthernetPair type:17 allowedEntitlementGroup:v35];

  v56 = @"com.apple.networkd_privileged";
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  v57 = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleTeardownFakeEthernetPair type:18 allowedEntitlementGroup:v37];

  v54 = @"com.apple.networkd_privileged";
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v55[0] = v38;
  v53 = @"com.apple.networkd.modify_settings";
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v55[1] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleThroughputEstimates type:19 allowedEntitlementGroup:v40];

  v51 = @"com.apple.networkd_privileged";
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v52[0] = v41;
  v50 = @"com.apple.networkd.modify_settings";
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v52[1] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleRadioType type:20 allowedEntitlementGroup:v43];

  v48 = @"com.apple.networkd_privileged";
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v49[0] = v44;
  v47 = @"com.apple.networkd.modify_settings";
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v49[1] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  [(NWPrivilegedHelper *)self registerHandlerFunction:handleRunProbes type:21 allowedEntitlementGroup:v46];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKnownEntitlementGroup, 0);
  objc_storeStrong((id *)&self->_allKnownEntitlementSet, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAllKnownEntitlementGroup:(id)a3
{
}

- (NSMutableArray)allKnownEntitlementGroup
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAllKnownEntitlementSet:(id)a3
{
}

- (NSMutableSet)allKnownEntitlementSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setListener:(id)a3
{
}

- (OS_xpc_object)listener
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)handleRequest:(id)a3 onConnection:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [[NWPHContext alloc] initWithRequest:v6 onConnection:v7];
  if (v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, (const char *)networkd_privileged_key_type);
    v10 = [(NWPrivilegedHelper *)self handlers];
    v11 = [NSNumber numberWithUnsignedInt:uint64];
    v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      v13 = [v12 allowedEntitlementGroup];
      int v14 = connectionMatchesEntitlementGroup(v7, v13);

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if ((uint64 - 2) > 0x14) {
            v17 = "unknown";
          }
          else {
            v17 = off_1E523A6F0[(uint64 - 2)];
          }
          int v27 = 136446722;
          v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
          __int16 v29 = 2082;
          *(void *)v30 = v17;
          *(_WORD *)&v30[8] = 1024;
          *(_DWORD *)v31 = [(NWPHContext *)v8 pid];
          _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Handling %{public}s from pid %d", (uint8_t *)&v27, 0x1Cu);
        }

        int64_t v22 = ((uint64_t (*)(NWPHContext *))[v12 handlerFunction])(v8);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          if ((uint64 - 2) > 0x14) {
            v23 = "unknown";
          }
          else {
            v23 = off_1E523A6F0[(uint64 - 2)];
          }
          int v24 = [(NWPHContext *)v8 pid];
          int v27 = 136446978;
          v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
          __int16 v29 = 2048;
          *(void *)v30 = v22;
          *(_WORD *)&v30[8] = 2082;
          *(void *)v31 = v23;
          *(_WORD *)&v31[8] = 1024;
          int v32 = v24;
          _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Returning %lld for %{public}s to pid %d", (uint8_t *)&v27, 0x26u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v20 = [(NWPHContext *)v8 pid];
        if ((uint64 - 2) > 0x14) {
          v21 = "unknown";
        }
        else {
          v21 = off_1E523A6F0[(uint64 - 2)];
        }
        int v27 = 136446978;
        v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
        __int16 v29 = 1024;
        *(_DWORD *)v30 = v20;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = uint64;
        *(_WORD *)v31 = 2082;
        *(void *)&v31[2] = v21;
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s Client pid %d missing entitlements for type [%u] %{public}s", (uint8_t *)&v27, 0x22u);
        int64_t v22 = -1002;
      }
      else
      {
        int64_t v22 = -1002;
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v18 = [(NWPHContext *)v8 pid];
        if ((uint64 - 2) > 0x14) {
          v19 = "unknown";
        }
        else {
          v19 = off_1E523A6F0[(uint64 - 2)];
        }
        int v27 = 136446978;
        v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
        __int16 v29 = 1024;
        *(_DWORD *)v30 = v18;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = uint64;
        *(_WORD *)v31 = 2082;
        *(void *)&v31[2] = v19;
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s Client pid %d sent invalid type [%u] %{public}s", (uint8_t *)&v27, 0x22u);
      }
      int64_t v22 = -1003;
    }

    v25 = [(NWPHContext *)v8 reply];
    xpc_dictionary_set_int64(v25, (const char *)networkd_privileged_key_result, v22);

    v26 = [(NWPHContext *)v8 reply];
    xpc_connection_send_message((xpc_connection_t)v7, v26);
  }
}

- (NWPrivilegedHelper)initWithQueue:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((gIsHelper & 1) == 0)
  {
    gIsHelper = 1;
    nw_allow_use_of_dispatch_internal();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
  }
  v36.receiver = self;
  v36.super_class = (Class)NWPrivilegedHelper;
  v5 = [(NWPrivilegedHelper *)&v36 init];
  id v6 = v5;
  if (v5)
  {
    if (v4)
    {
      [(NWPrivilegedHelper *)v5 setQueue:v4];
    }
    else
    {
      id v7 = getMainQueue();
      [(NWPrivilegedHelper *)v6 setQueue:v7];
    }
    id v8 = [(NWPrivilegedHelper *)v6 queue];
    id v9 = +[ManagedNetworkSettings sharedMNS];
    [v9 setQueue:v8];

    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NWPrivilegedHelper *)v6 setHandlers:v10];

    v11 = [MEMORY[0x1E4F1CA80] set];
    [(NWPrivilegedHelper *)v6 setAllKnownEntitlementSet:v11];

    [(NWPrivilegedHelper *)v6 registerHelperFunctions];
    v12 = [MEMORY[0x1E4F1CA48] array];
    [(NWPrivilegedHelper *)v6 setAllKnownEntitlementGroup:v12];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v13 = [(NWPrivilegedHelper *)v6 allKnownEntitlementSet];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v19 = [(NWPrivilegedHelper *)v6 allKnownEntitlementGroup];
          uint64_t v37 = v18;
          int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
          [v19 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v15);
    }

    [(NWPrivilegedHelper *)v6 setAllKnownEntitlementSet:0];
    v21 = 0;
    if ([(NWPrivilegedHelper *)v6 startXPCListener])
    {
      [(NWPrivilegedHelper *)v6 startThrottlePolicyEventListener];
      v21 = v6;
    }
    goto LABEL_16;
  }
  v23 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v40 = "-[NWPrivilegedHelper initWithQueue:]";
  int v24 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v34 = 0;
  if (__nwlog_fault(v24, &type, &v34))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v25 = __nwlog_obj();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        int v27 = "%{public}s [super init] failed";
LABEL_30:
        _os_log_impl(&dword_1830D4000, v25, v26, v27, buf, 0xCu);
      }
    }
    else
    {
      if (v34)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v25 = __nwlog_obj();
        os_log_type_t v26 = type;
        BOOL v29 = os_log_type_enabled(v25, type);
        if (backtrace_string)
        {
          if (v29)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWPrivilegedHelper initWithQueue:]";
            __int16 v41 = 2082;
            v42 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v25, v26, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_32;
        }
        if (!v29) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        int v27 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_30;
      }
      v25 = __nwlog_obj();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        int v27 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_30;
      }
    }
LABEL_31:
  }
LABEL_32:
  if (v24) {
    free(v24);
  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (void)startThrottlePolicyEventListener
{
  v2 = [(NWPrivilegedHelper *)self queue];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v2, &__block_literal_global_43191);
}

void __54__NWPrivilegedHelper_startThrottlePolicyEventListener__block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v40[13] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v32 = 0;
  size_t v31 = 4;
  if (sysctlbyname("kern.ipc.io_policy.throttled", &v32, &v31, 0, 0))
  {
    int v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v4 = (id)gLogObj;
    v5 = v4;
    if (v3 == 2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = 2;
        _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_ERROR, "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d", buf, 0x1Cu);
      }

      goto LABEL_17;
    }
    *(_DWORD *)buf = 136446722;
    char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
    __int16 v35 = 2082;
    objc_super v36 = "kern.ipc.io_policy.throttled";
    __int16 v37 = 1024;
    int v38 = v3;
    id v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (__nwlog_fault(v6, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        id v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d";
LABEL_38:
        v25 = v7;
        os_log_type_t v26 = v8;
        goto LABEL_39;
      }
      if (!v29)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        id v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, backtrace limit exceeded";
        goto LABEL_38;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_40:

          if (!v6) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        id v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, no backtrace";
        v25 = v7;
        os_log_type_t v26 = v11;
LABEL_39:
        _os_log_impl(&dword_1830D4000, v25, v26, v9, buf, 0x1Cu);
        goto LABEL_40;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446978;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        __int16 v39 = 2082;
        *(void *)v40 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, dumping backtrace:%{public}s", buf, 0x26u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_17:
      int v32 = -1;
      goto LABEL_18;
    }
LABEL_16:
    free(v6);
    goto LABEL_17;
  }
LABEL_18:
  int v13 = xpc_dictionary_get_uint64(v2, "_State") & 1;
  if (v13 == v32) {
    goto LABEL_51;
  }
  if (sysctlbyname("kern.ipc.io_policy.throttled", 0, 0, &v32, 4uLL))
  {
    int v14 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v15 = (id)gLogObj;
    uint64_t v16 = v15;
    if (v14 == 2)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v13;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = 2;
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d", buf, 0x22u);
      }

      goto LABEL_51;
    }
    *(_DWORD *)buf = 136446978;
    char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
    __int16 v35 = 2082;
    objc_super v36 = "kern.ipc.io_policy.throttled";
    __int16 v37 = 1024;
    int v38 = v13;
    __int16 v39 = 1024;
    *(_DWORD *)v40 = v14;
    uint64_t v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (!__nwlog_fault(v18, &type, &v29)) {
      goto LABEL_49;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446978;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v13;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v14;
        v21 = "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d";
LABEL_46:
        int v27 = v19;
        os_log_type_t v28 = v20;
LABEL_47:
        _os_log_impl(&dword_1830D4000, v27, v28, v21, buf, 0x22u);
      }
    }
    else if (v29)
    {
      int64_t v22 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v23 = type;
      BOOL v24 = os_log_type_enabled(v19, type);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136447234;
          char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
          __int16 v35 = 2082;
          objc_super v36 = "kern.ipc.io_policy.throttled";
          __int16 v37 = 1024;
          int v38 = v13;
          __int16 v39 = 1024;
          *(_DWORD *)v40 = v14;
          v40[2] = 2082;
          *(void *)&v40[3] = v22;
          _os_log_impl(&dword_1830D4000, v19, v23, "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d, dumping backtrace:%{public}s", buf, 0x2Cu);
        }

        free(v22);
        goto LABEL_49;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446978;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v13;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v14;
        v21 = "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d, no backtrace";
        int v27 = v19;
        os_log_type_t v28 = v23;
        goto LABEL_47;
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446978;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v13;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v14;
        v21 = "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d, backtrace limit exceeded";
        goto LABEL_46;
      }
    }

LABEL_49:
    if (v18) {
      free(v18);
    }
    goto LABEL_51;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v17 = (id)gLogObj;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
    __int16 v35 = 2082;
    objc_super v36 = "kern.ipc.io_policy.throttled";
    __int16 v37 = 1024;
    int v38 = v13;
    __int16 v39 = 1024;
    *(_DWORD *)v40 = v32;
    _os_log_impl(&dword_1830D4000, v17, OS_LOG_TYPE_DEBUG, "%{public}s %{public}s=%d (old=%d)", buf, 0x22u);
  }

LABEL_51:
}

- (BOOL)startXPCListener
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v3 = (const char *)networkd_privileged_service;
  id v4 = [(NWPrivilegedHelper *)self queue];
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v3, v4, 1uLL);
  [(NWPrivilegedHelper *)self setListener:mach_service];

  id v6 = [(NWPrivilegedHelper *)self listener];

  if (!v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
    __int16 v32 = 2082;
    uint64_t v33 = networkd_privileged_service;
    os_log_type_t v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v28 = 0;
    if (!__nwlog_fault(v11, &type, &v28)) {
      goto LABEL_37;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v12 = (id)gLogObj;
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl(&dword_1830D4000, v12, v15, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (!v28)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v12 = (id)gLogObj;
      os_log_type_t v25 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl(&dword_1830D4000, v12, v25, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, backtrace limit exceeded", buf, 0x16u);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v12 = (id)gLogObj;
    os_log_type_t v22 = type;
    BOOL v23 = os_log_type_enabled(v12, type);
    if (!backtrace_string)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136446466;
        size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl(&dword_1830D4000, v12, v22, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, no backtrace", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (v23)
    {
      *(_DWORD *)buf = 136446722;
      size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
      __int16 v32 = 2082;
      uint64_t v33 = networkd_privileged_service;
      __int16 v34 = 2082;
      __int16 v35 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v12, v22, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, dumping backtrace:%{public}s", buf, 0x20u);
    }
    goto LABEL_23;
  }
  id v7 = [(NWPrivilegedHelper *)self listener];
  Class Class = object_getClass(v7);
  id v9 = (objc_class *)MEMORY[0x1E4F14578];

  if (Class == v9)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v16 = [(NWPrivilegedHelper *)self listener];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __38__NWPrivilegedHelper_startXPCListener__block_invoke;
    handler[3] = &unk_1E5241C78;
    objc_copyWeak(&v27, (id *)buf);
    handler[4] = self;
    xpc_connection_set_event_handler(v16, handler);

    v17 = [(NWPrivilegedHelper *)self listener];
    xpc_connection_resume(v17);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    return 1;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v10 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
  __int16 v32 = 2082;
  uint64_t v33 = networkd_privileged_service;
  os_log_type_t v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v28 = 0;
  if (__nwlog_fault(v11, &type, &v28))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed", buf, 0x16u);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v28)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v12 = (id)gLogObj;
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl(&dword_1830D4000, v12, v24, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed, backtrace limit exceeded", buf, 0x16u);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v12 = (id)gLogObj;
    os_log_type_t v20 = type;
    BOOL v21 = os_log_type_enabled(v12, type);
    if (!backtrace_string)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136446466;
        size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl(&dword_1830D4000, v12, v20, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed, no backtrace", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (v21)
    {
      *(_DWORD *)buf = 136446722;
      size_t v31 = "-[NWPrivilegedHelper startXPCListener]";
      __int16 v32 = 2082;
      uint64_t v33 = networkd_privileged_service;
      __int16 v34 = 2082;
      __int16 v35 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v12, v20, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed, dumping backtrace:%{public}s", buf, 0x20u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v11) {
      return 0;
    }
    goto LABEL_38;
  }
LABEL_37:
  if (v11) {
LABEL_38:
  }
    free(v11);
  return 0;
}

void __38__NWPrivilegedHelper_startXPCListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (!WeakRetained) {
      goto LABEL_50;
    }
    Class Class = object_getClass(v3);
    if (Class == (Class)MEMORY[0x1E4F14578])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      int v38 = __Block_byref_object_copy__43223;
      __int16 v39 = __Block_byref_object_dispose__43224;
      id v18 = v3;
      id v40 = v18;
      v19 = [WeakRetained allKnownEntitlementGroup];
      LOBYTE(v18) = connectionMatchesEntitlementGroup(v18, v19);

      if (v18)
      {
        os_log_type_t v20 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40);
        BOOL v21 = [*(id *)(a1 + 32) queue];
        xpc_connection_set_target_queue(v20, v21);

        objc_initWeak((id *)type, WeakRetained);
        os_log_type_t v22 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __38__NWPrivilegedHelper_startXPCListener__block_invoke_73;
        handler[3] = &unk_1E5241C50;
        handler[4] = buf;
        objc_copyWeak(&v31, (id *)type);
        xpc_connection_set_event_handler(v22, handler);
        xpc_connection_resume(*(xpc_connection_t *)(*(void *)&buf[8] + 40));
        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)type);
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v23 = (id)gLogObj;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)&buf[8] + 40));
          *(_DWORD *)os_log_type_t type = 136446466;
          __int16 v34 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          __int16 v35 = 1024;
          pid_t v36 = pid;
          _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_ERROR, "%{public}s client pid %d does not have any known entitlement", (uint8_t *)type, 0x12u);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(*(void *)&buf[8] + 40));
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_50;
    }
    if (Class != (Class)MEMORY[0x1E4F145A8])
    {
LABEL_50:

      goto LABEL_51;
    }
    id v6 = (void *)MEMORY[0x185319370](v3);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v6;
    os_log_type_t v8 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (__nwlog_fault(v8, type, &v32))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v9 = (id)gLogObj;
        os_log_type_t v10 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_1830D4000, v9, v10, "%{public}s FATAL: XPC listener received error %{public}s", buf, 0x16u);
        }
      }
      else if (v32)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v9 = (id)gLogObj;
        os_log_type_t v27 = type[0];
        BOOL v28 = os_log_type_enabled(v9, type[0]);
        if (backtrace_string)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v6;
            *(_WORD *)&buf[22] = 2082;
            int v38 = (uint64_t (*)(uint64_t, uint64_t))backtrace_string;
            _os_log_impl(&dword_1830D4000, v9, v27, "%{public}s FATAL: XPC listener received error %{public}s, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          if (!v8) {
            goto LABEL_49;
          }
          goto LABEL_48;
        }
        if (v28)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_1830D4000, v9, v27, "%{public}s FATAL: XPC listener received error %{public}s, no backtrace", buf, 0x16u);
        }
      }
      else
      {
        id v9 = __nwlog_obj();
        os_log_type_t v29 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_1830D4000, v9, v29, "%{public}s FATAL: XPC listener received error %{public}s, backtrace limit exceeded", buf, 0x16u);
        }
      }
    }
    if (!v8)
    {
LABEL_49:
      free(v6);
      goto LABEL_50;
    }
LABEL_48:
    free(v8);
    goto LABEL_49;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v11 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
  BOOL v12 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  char v32 = 0;
  if (__nwlog_fault(v12, type, &v32))
  {
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v13 = (id)gLogObj;
      os_log_type_t v14 = type[0];
      if (os_log_type_enabled(v13, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s called with null msg", buf, 0xCu);
      }
    }
    else if (v32)
    {
      os_log_type_t v15 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v13 = (id)gLogObj;
      os_log_type_t v16 = type[0];
      BOOL v17 = os_log_type_enabled(v13, type[0]);
      if (v15)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s called with null msg, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v15);
        if (v12) {
          goto LABEL_40;
        }
        goto LABEL_51;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s called with null msg, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v13 = (id)gLogObj;
      os_log_type_t v25 = type[0];
      if (os_log_type_enabled(v13, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        _os_log_impl(&dword_1830D4000, v13, v25, "%{public}s called with null msg, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
  if (v12) {
LABEL_40:
  }
    free(v12);
LABEL_51:
}

void __38__NWPrivilegedHelper_startXPCListener__block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id WeakRetained = (id)gLogObj;
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
      _os_log_impl(&dword_1830D4000, WeakRetained, OS_LOG_TYPE_DEBUG, "%{public}s received request on removed connection, ignoring.", buf, 0xCu);
    }
    goto LABEL_45;
  }
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      Class Class = object_getClass(v4);
      if (Class != (Class)MEMORY[0x1E4F14590])
      {
        if (Class != (Class)MEMORY[0x1E4F145A8])
        {
          id v7 = (char *)MEMORY[0x185319370](v4);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          os_log_type_t v8 = (id)gLogObj;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            __int16 v29 = 2082;
            long long v30 = v7;
            _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_ERROR, "%{public}s received unknown type for request: %{public}s", buf, 0x16u);
          }

          free(v7);
          goto LABEL_45;
        }
        if (v4 == (void *)MEMORY[0x1E4F14520])
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v21 = (id)gLogObj;
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_43;
          }
          *(_DWORD *)buf = 136446210;
          BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          os_log_type_t v22 = "%{public}s received XPC_ERROR_CONNECTION_INTERRUPTED, removing connection";
        }
        else
        {
          if (v4 != (void *)MEMORY[0x1E4F14528])
          {
            if (v4 != (void *)MEMORY[0x1E4F14550])
            {
              BOOL v17 = (char *)MEMORY[0x185319370](v4);
              id v18 = __nwlog_obj();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136446466;
                BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
                __int16 v29 = 2082;
                long long v30 = v17;
                _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_DEBUG, "%{public}s received unknown XPC error %{public}s, removing connection", buf, 0x16u);
              }

              free(v17);
              goto LABEL_44;
            }
            BOOL v21 = __nwlog_obj();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136446210;
              BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
              os_log_type_t v22 = "%{public}s received XPC_ERROR_TERMINATION_IMMINENT, removing connection";
              goto LABEL_42;
            }
LABEL_43:

LABEL_44:
            uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
            os_log_type_t v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = 0;

            goto LABEL_45;
          }
          BOOL v21 = __nwlog_obj();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_43;
          }
          *(_DWORD *)buf = 136446210;
          BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          os_log_type_t v22 = "%{public}s received XPC_ERROR_CONNECTION_INVALID, removing connection";
        }
LABEL_42:
        _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0xCu);
        goto LABEL_43;
      }
      [WeakRetained handleRequest:v4 onConnection:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    }
LABEL_45:

    goto LABEL_46;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
  os_log_type_t v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v25 = 0;
  if (__nwlog_fault(v10, &type, &v25))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        os_log_type_t v13 = "%{public}s called with null request";
LABEL_29:
        v19 = v11;
        os_log_type_t v20 = v12;
LABEL_30:
        _os_log_impl(&dword_1830D4000, v19, v20, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v11 = (id)gLogObj;
        os_log_type_t v15 = type;
        BOOL v16 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            __int16 v29 = 2082;
            long long v30 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v11, v15, "%{public}s called with null request, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_32;
        }
        if (!v16) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        os_log_type_t v13 = "%{public}s called with null request, no backtrace";
        v19 = v11;
        os_log_type_t v20 = v15;
        goto LABEL_30;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        os_log_type_t v13 = "%{public}s called with null request, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_31:
  }
LABEL_32:
  if (v10) {
    free(v10);
  }
LABEL_46:
}

- (void)registerHandlerFunction:(void *)a3 type:(int)a4 allowedEntitlementGroup:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!a3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v17 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    id v18 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v101 = 0;
    if (__nwlog_fault((const char *)v18, &type, &v101))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        os_log_type_t v20 = type;
        if (!os_log_type_enabled(v19, type)) {
          goto LABEL_52;
        }
        *(_DWORD *)buf = 136446210;
        v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        BOOL v21 = "%{public}s called with null handlerFunction";
LABEL_50:
        v54 = v19;
        os_log_type_t v55 = v20;
        goto LABEL_51;
      }
      if (!v101)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        os_log_type_t v20 = type;
        if (!os_log_type_enabled(v19, type)) {
          goto LABEL_52;
        }
        *(_DWORD *)buf = 136446210;
        v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        BOOL v21 = "%{public}s called with null handlerFunction, backtrace limit exceeded";
        goto LABEL_50;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v23 = type;
      BOOL v24 = os_log_type_enabled(v19, type);
      if (!backtrace_string)
      {
        if (!v24)
        {
LABEL_52:

          if (!v18) {
            goto LABEL_149;
          }
LABEL_53:
          free(v18);
          goto LABEL_149;
        }
        *(_DWORD *)buf = 136446210;
        v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        BOOL v21 = "%{public}s called with null handlerFunction, no backtrace";
        v54 = v19;
        os_log_type_t v55 = v23;
LABEL_51:
        _os_log_impl(&dword_1830D4000, v54, v55, v21, buf, 0xCu);
        goto LABEL_52;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446466;
        v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        __int16 v105 = 2082;
        *(void *)v106 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v19, v23, "%{public}s called with null handlerFunction, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v18) {
      goto LABEL_149;
    }
    goto LABEL_53;
  }
  id v9 = [[NWPHHandler alloc] initWithHandlerFunction:a3 allowedEntitlementGroup:v8];
  if (!v9) {
    goto LABEL_148;
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v5];
  id v11 = [(NWPrivilegedHelper *)self handlers];
  os_log_type_t v12 = [v11 objectForKeyedSubscript:v10];

  v92 = (void *)v10;
  if (v12)
  {
    os_log_type_t v13 = v9;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v14 = (id)gLogObj;
    unsigned int v15 = v5 - 2;
    if ((v5 - 2) > 0x14) {
      BOOL v16 = "unknown";
    }
    else {
      BOOL v16 = off_1E523A6F0[v15];
    }
    *(_DWORD *)buf = 136446722;
    v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    __int16 v105 = 1024;
    *(_DWORD *)v106 = v5;
    *(_WORD *)&v106[4] = 2082;
    *(void *)&v106[6] = v16;
    uint64_t v41 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v101 = 0;
    if (!__nwlog_fault((const char *)v41, &type, &v101))
    {
LABEL_100:
      if (!v41)
      {
LABEL_102:
        id v9 = v13;
        goto LABEL_146;
      }
LABEL_101:
      free(v41);
      goto LABEL_102;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v42 = (id)gLogObj;
      os_log_type_t v43 = type;
      if (!os_log_type_enabled(v42, type))
      {
LABEL_99:

        goto LABEL_100;
      }
      if (v15 > 0x14) {
        v44 = "unknown";
      }
      else {
        v44 = off_1E523A6F0[v15];
      }
      *(_DWORD *)buf = 136446722;
      v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      __int16 v105 = 1024;
      *(_DWORD *)v106 = v5;
      *(_WORD *)&v106[4] = 2082;
      *(void *)&v106[6] = v44;
      v69 = "%{public}s Trying to reregister handler for type [%u] %{public}s";
    }
    else
    {
      if (v101)
      {
        id v45 = v8;
        v46 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v47 = (id)gLogObj;
        os_log_type_t v48 = type;
        BOOL v49 = os_log_type_enabled(v47, type);
        if (v46)
        {
          if (v49)
          {
            if (v15 > 0x14) {
              v50 = "unknown";
            }
            else {
              v50 = off_1E523A6F0[v15];
            }
            *(_DWORD *)buf = 136446978;
            v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
            __int16 v105 = 1024;
            *(_DWORD *)v106 = v5;
            *(_WORD *)&v106[4] = 2082;
            *(void *)&v106[6] = v50;
            __int16 v107 = 2082;
            v108 = v46;
            _os_log_impl(&dword_1830D4000, v47, v48, "%{public}s Trying to reregister handler for type [%u] %{public}s, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(v46);
          id v8 = v45;
          if (!v41) {
            goto LABEL_102;
          }
        }
        else
        {
          if (v49)
          {
            if (v15 > 0x14) {
              v70 = "unknown";
            }
            else {
              v70 = off_1E523A6F0[v15];
            }
            *(_DWORD *)buf = 136446722;
            v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
            __int16 v105 = 1024;
            *(_DWORD *)v106 = v5;
            *(_WORD *)&v106[4] = 2082;
            *(void *)&v106[6] = v70;
            _os_log_impl(&dword_1830D4000, v47, v48, "%{public}s Trying to reregister handler for type [%u] %{public}s, no backtrace", buf, 0x1Cu);
          }

          id v8 = v45;
          if (!v41) {
            goto LABEL_102;
          }
        }
        goto LABEL_101;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v42 = (id)gLogObj;
      os_log_type_t v43 = type;
      if (!os_log_type_enabled(v42, type)) {
        goto LABEL_99;
      }
      if (v15 > 0x14) {
        v59 = "unknown";
      }
      else {
        v59 = off_1E523A6F0[v15];
      }
      *(_DWORD *)buf = 136446722;
      v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      __int16 v105 = 1024;
      *(_DWORD *)v106 = v5;
      *(_WORD *)&v106[4] = 2082;
      *(void *)&v106[6] = v59;
      v69 = "%{public}s Trying to reregister handler for type [%u] %{public}s, backtrace limit exceeded";
    }
    _os_log_impl(&dword_1830D4000, v42, v43, v69, buf, 0x1Cu);
    goto LABEL_99;
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v25 = v8;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v97 objects:v112 count:16];
  v90 = v9;
  if (!v26)
  {

    goto LABEL_55;
  }
  uint64_t v27 = v26;
  char v28 = 0;
  uint64_t v29 = *(void *)v98;
  id v89 = v8;
  v91 = v25;
  uint64_t v87 = *(void *)v98;
  do
  {
    uint64_t v30 = 0;
    uint64_t v88 = v27;
    do
    {
      if (*(void *)v98 != v29) {
        objc_enumerationMutation(v25);
      }
      uint64_t v31 = *(void **)(*((void *)&v97 + 1) + 8 * v30);
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v93 objects:v111 count:16];
      if (!v33) {
        goto LABEL_31;
      }
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v94;
      while (2)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v94 != v35) {
            objc_enumerationMutation(v32);
          }
          __int16 v37 = *(char **)(*((void *)&v93 + 1) + 8 * i);
          if (([v37 hasPrefix:@"com.apple."] & 1) == 0)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            id v51 = (id)gLogObj;
            unsigned int v52 = v5 - 2;
            if ((v5 - 2) > 0x14) {
              v53 = "unknown";
            }
            else {
              v53 = off_1E523A6F0[v52];
            }
            *(_DWORD *)buf = 136446978;
            v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
            __int16 v105 = 1024;
            *(_DWORD *)v106 = v5;
            *(_WORD *)&v106[4] = 2082;
            *(void *)&v106[6] = v53;
            __int16 v107 = 2114;
            v108 = v37;
            v60 = (void *)_os_log_send_and_compose_impl();

            os_log_type_t type = OS_LOG_TYPE_ERROR;
            char v101 = 0;
            if (__nwlog_fault((const char *)v60, &type, &v101))
            {
              if (type == OS_LOG_TYPE_FAULT)
              {
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v61 = (id)gLogObj;
                os_log_type_t v62 = type;
                if (os_log_type_enabled(v61, type))
                {
                  if (v52 > 0x14) {
                    v63 = "unknown";
                  }
                  else {
                    v63 = off_1E523A6F0[v52];
                  }
                  *(_DWORD *)buf = 136446978;
                  v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                  __int16 v105 = 1024;
                  *(_DWORD *)v106 = v5;
                  *(_WORD *)&v106[4] = 2082;
                  *(void *)&v106[6] = v63;
                  __int16 v107 = 2114;
                  v108 = v37;
                  v82 = "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public}@";
                  goto LABEL_126;
                }
                goto LABEL_127;
              }
              if (v101)
              {
                v64 = (char *)__nw_create_backtrace_string();
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v65 = (id)gLogObj;
                os_log_type_t v66 = type;
                BOOL v67 = os_log_type_enabled(v65, type);
                if (v64)
                {
                  if (v67)
                  {
                    if (v52 > 0x14) {
                      v68 = "unknown";
                    }
                    else {
                      v68 = off_1E523A6F0[v52];
                    }
                    *(_DWORD *)buf = 136447234;
                    v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                    __int16 v105 = 1024;
                    *(_DWORD *)v106 = v5;
                    *(_WORD *)&v106[4] = 2082;
                    *(void *)&v106[6] = v68;
                    __int16 v107 = 2114;
                    v108 = v37;
                    __int16 v109 = 2082;
                    v110 = v64;
                    _os_log_impl(&dword_1830D4000, v65, v66, "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public}@, dumping backtrace:%{public}s", buf, 0x30u);
                  }

                  free(v64);
                  if (!v60) {
                    goto LABEL_130;
                  }
                }
                else
                {
                  if (v67)
                  {
                    if (v52 > 0x14) {
                      v83 = "unknown";
                    }
                    else {
                      v83 = off_1E523A6F0[v52];
                    }
                    *(_DWORD *)buf = 136446978;
                    v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                    __int16 v105 = 1024;
                    *(_DWORD *)v106 = v5;
                    *(_WORD *)&v106[4] = 2082;
                    *(void *)&v106[6] = v83;
                    __int16 v107 = 2114;
                    v108 = v37;
                    _os_log_impl(&dword_1830D4000, v65, v66, "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public}@, no backtrace", buf, 0x26u);
                  }

                  if (!v60) {
                    goto LABEL_130;
                  }
                }
LABEL_129:
                free(v60);
LABEL_130:

                id v8 = v89;
                goto LABEL_145;
              }
              v61 = __nwlog_obj();
              os_log_type_t v62 = type;
              if (os_log_type_enabled(v61, type))
              {
                if (v52 > 0x14) {
                  v81 = "unknown";
                }
                else {
                  v81 = off_1E523A6F0[v52];
                }
                *(_DWORD *)buf = 136446978;
                v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                __int16 v105 = 1024;
                *(_DWORD *)v106 = v5;
                *(_WORD *)&v106[4] = 2082;
                *(void *)&v106[6] = v81;
                __int16 v107 = 2114;
                v108 = v37;
                v82 = "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public"
                      "}@, backtrace limit exceeded";
LABEL_126:
                _os_log_impl(&dword_1830D4000, v61, v62, v82, buf, 0x26u);
              }
LABEL_127:
            }
            if (v60) {
              goto LABEL_129;
            }
            goto LABEL_130;
          }
          int v38 = [(NWPrivilegedHelper *)self allKnownEntitlementSet];
          [v38 addObject:v37];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v93 objects:v111 count:16];
        if (v34) {
          continue;
        }
        break;
      }
      char v28 = 1;
      id v8 = v89;
      uint64_t v29 = v87;
      uint64_t v27 = v88;
LABEL_31:

      ++v30;
      id v25 = v91;
    }
    while (v30 != v27);
    uint64_t v27 = [v91 countByEnumeratingWithState:&v97 objects:v112 count:16];
  }
  while (v27);

  if (v28)
  {
    __int16 v39 = [(NWPrivilegedHelper *)self handlers];
    id v9 = v90;
    id v40 = v92;
    [v39 setObject:v90 forKeyedSubscript:v92];

    goto LABEL_147;
  }
LABEL_55:
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v56 = (id)gLogObj;
  unsigned int v57 = v5 - 2;
  if ((v5 - 2) > 0x14) {
    v58 = "unknown";
  }
  else {
    v58 = off_1E523A6F0[v57];
  }
  *(_DWORD *)buf = 136446722;
  v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
  __int16 v105 = 1024;
  *(_DWORD *)v106 = v5;
  *(_WORD *)&v106[4] = 2082;
  *(void *)&v106[6] = v58;
  v71 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v101 = 0;
  if (!__nwlog_fault(v71, &type, &v101))
  {
LABEL_143:
    if (!v71) {
      goto LABEL_145;
    }
    goto LABEL_144;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v72 = (id)gLogObj;
    os_log_type_t v73 = type;
    if (os_log_type_enabled(v72, type))
    {
      if (v57 > 0x14) {
        v74 = "unknown";
      }
      else {
        v74 = off_1E523A6F0[v57];
      }
      *(_DWORD *)buf = 136446722;
      v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      __int16 v105 = 1024;
      *(_DWORD *)v106 = v5;
      *(_WORD *)&v106[4] = 2082;
      *(void *)&v106[6] = v74;
      v85 = "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement";
      goto LABEL_141;
    }
    goto LABEL_142;
  }
  if (!v101)
  {
    v72 = __nwlog_obj();
    os_log_type_t v73 = type;
    if (os_log_type_enabled(v72, type))
    {
      if (v57 > 0x14) {
        v84 = "unknown";
      }
      else {
        v84 = off_1E523A6F0[v57];
      }
      *(_DWORD *)buf = 136446722;
      v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      __int16 v105 = 1024;
      *(_DWORD *)v106 = v5;
      *(_WORD *)&v106[4] = 2082;
      *(void *)&v106[6] = v84;
      v85 = "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement, backtrace limit exceeded";
LABEL_141:
      _os_log_impl(&dword_1830D4000, v72, v73, v85, buf, 0x1Cu);
    }
LABEL_142:

    goto LABEL_143;
  }
  id v75 = v8;
  v76 = (char *)__nw_create_backtrace_string();
  v77 = __nwlog_obj();
  os_log_type_t v78 = type;
  BOOL v79 = os_log_type_enabled(v77, type);
  if (v76)
  {
    if (v79)
    {
      if (v57 > 0x14) {
        v80 = "unknown";
      }
      else {
        v80 = off_1E523A6F0[v57];
      }
      *(_DWORD *)buf = 136446978;
      v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      __int16 v105 = 1024;
      *(_DWORD *)v106 = v5;
      *(_WORD *)&v106[4] = 2082;
      *(void *)&v106[6] = v80;
      __int16 v107 = 2082;
      v108 = v76;
      _os_log_impl(&dword_1830D4000, v77, v78, "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement, dumping backtrace:%{public}s", buf, 0x26u);
    }

    free(v76);
    id v8 = v75;
    if (!v71) {
      goto LABEL_145;
    }
LABEL_144:
    free(v71);
    goto LABEL_145;
  }
  if (v79)
  {
    if (v57 > 0x14) {
      v86 = "unknown";
    }
    else {
      v86 = off_1E523A6F0[v57];
    }
    *(_DWORD *)buf = 136446722;
    v104 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    __int16 v105 = 1024;
    *(_DWORD *)v106 = v5;
    *(_WORD *)&v106[4] = 2082;
    *(void *)&v106[6] = v86;
    _os_log_impl(&dword_1830D4000, v77, v78, "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement, no backtrace", buf, 0x1Cu);
  }

  id v8 = v75;
  if (v71) {
    goto LABEL_144;
  }
LABEL_145:
  id v9 = v90;
LABEL_146:
  id v40 = v92;
LABEL_147:

LABEL_148:
LABEL_149:
}

@end