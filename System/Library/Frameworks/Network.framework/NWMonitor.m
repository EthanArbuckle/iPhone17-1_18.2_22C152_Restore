@interface NWMonitor
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NWMonitor)monitorWithNetworkDescription:(id)a3 endpoint:(id)a4 parameters:(id)a5;
+ (NWMonitor)monitorWithNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5;
+ (id)copySavedMonitorForNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5;
+ (id)mainOperationQueue;
+ (id)queue;
+ (void)initialize;
+ (void)saveMonitor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5;
- (NSArray)networkDescriptionArray;
- (NSString)description;
- (NSString)privateDescription;
- (NSURL)lastProbeURL;
- (NSUUID)lastProbeUUID;
- (NWEndpoint)endpoint;
- (NWInterface)interface;
- (NWNetworkDescription)bestAvailableNetworkDescription;
- (NWParameters)parameters;
- (NWPathEvaluator)pathEvaluator;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int64_t)status;
- (unint64_t)hash;
- (unsigned)mID;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)evaluateStartingAtIndex:(unint64_t)a3 probeUUID:(id)a4 probeWasSuccessful:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBestAvailableNetworkDescription:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setInterface:(id)a3;
- (void)setLastProbeURL:(id)a3;
- (void)setLastProbeUUID:(id)a3;
- (void)setMID:(unsigned int)a3;
- (void)setNetworkDescriptionArray:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation NWMonitor

+ (id)queue
{
  if (queue_onceToken != -1) {
    dispatch_once(&queue_onceToken, &__block_literal_global_10570);
  }
  v2 = (void *)queue_mQueue;

  return v2;
}

void __18__NWMonitor_queue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.network.monitor_queue", v2);
  v1 = (void *)queue_mQueue;
  queue_mQueue = (uint64_t)v0;
}

+ (id)mainOperationQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__NWMonitor_mainOperationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mainOperationQueue_opQueueToken != -1) {
    dispatch_once(&mainOperationQueue_opQueueToken, block);
  }
  v2 = (void *)mainOperationQueue_opQueue;

  return v2;
}

void __31__NWMonitor_mainOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)mainOperationQueue_opQueue;
  mainOperationQueue_opQueue = (uint64_t)v0;

  id v2 = [(id)objc_opt_class() queue];
  [(id)mainOperationQueue_opQueue setUnderlyingQueue:v2];
}

+ (NWMonitor)monitorWithNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  nw_allow_use_of_dispatch_internal();
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v17 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v75 = 0;
    if (!__nwlog_fault(v18, &type, &v75)) {
      goto LABEL_86;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v20 = type;
      if (!os_log_type_enabled(v19, type)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v21 = "%{public}s called with null networkDescriptionArray";
    }
    else
    {
      if (v75)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        os_log_type_t v31 = type;
        BOOL v32 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136446466;
            v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
            __int16 v79 = 2082;
            v80 = (__CFString *)backtrace_string;
            v33 = "%{public}s called with null networkDescriptionArray, dumping backtrace:%{public}s";
LABEL_35:
            v35 = v19;
            os_log_type_t v36 = v31;
            uint32_t v37 = 22;
LABEL_36:
            _os_log_impl(&dword_1830D4000, v35, v36, v33, buf, v37);
          }
LABEL_37:

          free(backtrace_string);
          goto LABEL_86;
        }
        if (!v32)
        {
LABEL_49:

          if (!v18) {
            goto LABEL_88;
          }
          goto LABEL_87;
        }
        *(_DWORD *)buf = 136446210;
        v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
        v21 = "%{public}s called with null networkDescriptionArray, no backtrace";
        v42 = v19;
        os_log_type_t v43 = v31;
LABEL_48:
        _os_log_impl(&dword_1830D4000, v42, v43, v21, buf, 0xCu);
        goto LABEL_49;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v20 = type;
      if (!os_log_type_enabled(v19, type)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v21 = "%{public}s called with null networkDescriptionArray, backtrace limit exceeded";
    }
    v42 = v19;
    os_log_type_t v43 = v20;
    goto LABEL_48;
  }
  if (![v8 count])
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v27 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v75 = 0;
    if (!__nwlog_fault(v18, &type, &v75)) {
      goto LABEL_86;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v28 = type;
      if (!os_log_type_enabled(v19, type)) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v29 = "%{public}s called with null networkDescriptionArray (empty)";
      goto LABEL_59;
    }
    if (!v75)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      os_log_type_t v28 = type;
      if (!os_log_type_enabled(v19, type)) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v29 = "%{public}s called with null networkDescriptionArray (empty), backtrace limit exceeded";
LABEL_59:
      v46 = v19;
      os_log_type_t v47 = v28;
      goto LABEL_60;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v19 = (id)gLogObj;
    os_log_type_t v31 = type;
    BOOL v34 = os_log_type_enabled(v19, type);
    if (!backtrace_string)
    {
      if (!v34) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v29 = "%{public}s called with null networkDescriptionArray (empty), no backtrace";
      v46 = v19;
      os_log_type_t v47 = v31;
LABEL_60:
      uint32_t v48 = 12;
LABEL_84:
      _os_log_impl(&dword_1830D4000, v46, v47, v29, buf, v48);
      goto LABEL_85;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      __int16 v79 = 2082;
      v80 = (__CFString *)backtrace_string;
      v33 = "%{public}s called with null networkDescriptionArray (empty), dumping backtrace:%{public}s";
      goto LABEL_35;
    }
    goto LABEL_37;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v72;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v72 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = [*(id *)(*((void *)&v71 + 1) + 8 * i) ssidOptions];

      if (v16)
      {

        if (currentProcessHasSSIDEntitlement_onceToken != -1) {
          dispatch_once(&currentProcessHasSSIDEntitlement_onceToken, &__block_literal_global_229);
        }
        if (currentProcessHasSSIDEntitlement_hasSSIDEntitlement) {
          goto LABEL_19;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v40 = (id)gLogObj;
        *(_DWORD *)buf = 136446466;
        v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
        __int16 v79 = 2114;
        v80 = @"com.apple.private.corewifi";
        v18 = (char *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v75 = 0;
        if (!__nwlog_fault(v18, &type, &v75)) {
          goto LABEL_86;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v19 = (id)gLogObj;
          os_log_type_t v41 = type;
          if (!os_log_type_enabled(v19, type)) {
            goto LABEL_85;
          }
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          __int16 v79 = 2114;
          v80 = @"com.apple.private.corewifi";
          v29 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID";
LABEL_82:
          v46 = v19;
          os_log_type_t v47 = v41;
LABEL_83:
          uint32_t v48 = 22;
          goto LABEL_84;
        }
        if (!v75)
        {
          v19 = __nwlog_obj();
          os_log_type_t v41 = type;
          if (!os_log_type_enabled(v19, type)) {
            goto LABEL_85;
          }
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          __int16 v79 = 2114;
          v80 = @"com.apple.private.corewifi";
          v29 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID, backtrace limit exceeded";
          goto LABEL_82;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        os_log_type_t v44 = type;
        BOOL v45 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (!v45) {
            goto LABEL_37;
          }
          *(_DWORD *)buf = 136446722;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          __int16 v79 = 2114;
          v80 = @"com.apple.private.corewifi";
          __int16 v81 = 2082;
          v82 = backtrace_string;
          v33 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID, dumping backtrace:%{public}s";
          v35 = v19;
          os_log_type_t v36 = v44;
          uint32_t v37 = 32;
          goto LABEL_36;
        }
        if (v45)
        {
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          __int16 v79 = 2114;
          v80 = @"com.apple.private.corewifi";
          v29 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID, no backtrace";
          v46 = v19;
          os_log_type_t v47 = v44;
          goto LABEL_83;
        }
LABEL_85:

LABEL_86:
        if (!v18)
        {
LABEL_88:
          v26 = 0;
          goto LABEL_111;
        }
LABEL_87:
        free(v18);
        goto LABEL_88;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_11:

LABEL_19:
  id v22 = +[NWMonitor copySavedMonitorForNetworkDescriptionArray:v11 endpoint:v9 parameters:v10];
  v23 = v22;
  if (v22)
  {
    v24 = [v22 privateDescription];
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      __int16 v79 = 2114;
      v80 = v24;
      _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_DEBUG, "%{public}s found matching monitor %{public}@", buf, 0x16u);
    }

    v26 = v23;
    goto LABEL_110;
  }
  v70.receiver = a1;
  v70.super_class = (Class)&OBJC_METACLASS___NWMonitor;
  v38 = (__CFString *)objc_msgSend(objc_msgSendSuper2(&v70, sel_alloc), "init");
  v24 = v38;
  if (!a1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v49 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v50 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v75 = 0;
    if (!__nwlog_fault(v50, &type, &v75)) {
      goto LABEL_107;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v51 = (id)gLogObj;
      os_log_type_t v52 = type;
      if (os_log_type_enabled(v51, type))
      {
        *(_DWORD *)buf = 136446210;
        v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
        v53 = "%{public}s super alloc init failed";
        goto LABEL_105;
      }
      goto LABEL_106;
    }
    if (v75)
    {
      v65 = (char *)__nw_create_backtrace_string();
      v51 = __nwlog_obj();
      os_log_type_t v52 = type;
      BOOL v66 = os_log_type_enabled(v51, type);
      if (v65)
      {
        if (v66)
        {
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          __int16 v79 = 2082;
          v80 = (__CFString *)v65;
          v67 = "%{public}s super alloc init failed, dumping backtrace:%{public}s";
LABEL_93:
          _os_log_impl(&dword_1830D4000, v51, v52, v67, buf, 0x16u);
        }
LABEL_94:

        free(v65);
        goto LABEL_107;
      }
      if (!v66) {
        goto LABEL_106;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s super alloc init failed, no backtrace";
    }
    else
    {
      v51 = __nwlog_obj();
      os_log_type_t v52 = type;
      if (!os_log_type_enabled(v51, type)) {
        goto LABEL_106;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s super alloc init failed, backtrace limit exceeded";
    }
LABEL_105:
    _os_log_impl(&dword_1830D4000, v51, v52, v53, buf, 0xCu);
    goto LABEL_106;
  }
  [(__CFString *)v38 setEndpoint:v9];
  if (v10) {
    v39 = (NWParameters *)[v10 copy];
  }
  else {
    v39 = objc_alloc_init(NWParameters);
  }
  v54 = v39;
  [(__CFString *)v24 setParameters:v39];

  v55 = [NWPathEvaluator alloc];
  v56 = [(__CFString *)v24 endpoint];
  v57 = [(__CFString *)v24 parameters];
  v58 = [(NWPathEvaluator *)v55 initWithEndpoint:v56 parameters:v57];
  [(__CFString *)v24 setPathEvaluator:v58];

  v59 = [(__CFString *)v24 pathEvaluator];

  if (v59)
  {
    v60 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v11 copyItems:1];
    [(__CFString *)v24 setNetworkDescriptionArray:v60];

    [(__CFString *)v24 setStatus:0];
    [(__CFString *)v24 setBestAvailableNetworkDescription:0];
    +[NWMonitor saveMonitor:v24];
    v61 = [(__CFString *)v24 pathEvaluator];
    [v61 addObserver:v24 forKeyPath:@"path" options:5 context:0];

    v62 = [0 privateDescription];
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v63 = (id)gLogObj;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      __int16 v79 = 2114;
      v80 = v62;
      _os_log_impl(&dword_1830D4000, v63, OS_LOG_TYPE_DEBUG, "%{public}s created monitor %{public}@", buf, 0x16u);
    }

    v24 = v24;
    v26 = v24;
    goto LABEL_110;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v64 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
  v50 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v75 = 0;
  if (!__nwlog_fault(v50, &type, &v75)) {
    goto LABEL_107;
  }
  if (type != OS_LOG_TYPE_FAULT)
  {
    if (v75)
    {
      v65 = (char *)__nw_create_backtrace_string();
      v51 = __nwlog_obj();
      os_log_type_t v52 = type;
      BOOL v68 = os_log_type_enabled(v51, type);
      if (v65)
      {
        if (v68)
        {
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          __int16 v79 = 2082;
          v80 = (__CFString *)v65;
          v67 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed, dumping backtrace:%{public}s";
          goto LABEL_93;
        }
        goto LABEL_94;
      }
      if (!v68) {
        goto LABEL_106;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed, no backtrace";
    }
    else
    {
      v51 = __nwlog_obj();
      os_log_type_t v52 = type;
      if (!os_log_type_enabled(v51, type)) {
        goto LABEL_106;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed, backtrace limit exceeded";
    }
    goto LABEL_105;
  }
  v51 = __nwlog_obj();
  os_log_type_t v52 = type;
  if (os_log_type_enabled(v51, type))
  {
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v53 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed";
    goto LABEL_105;
  }
LABEL_106:

LABEL_107:
  if (v50) {
    free(v50);
  }
  v26 = 0;
LABEL_110:

LABEL_111:

  return (NWMonitor *)v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_lastProbeURL, 0);
  objc_storeStrong((id *)&self->_lastProbeUUID, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_networkDescriptionArray, 0);

  objc_storeStrong((id *)&self->_bestAvailableNetworkDescription, 0);
}

- (void)setMID:(unsigned int)a3
{
  self->_mID = a3;
}

- (unsigned)mID
{
  return self->_mID;
}

- (void)setInterface:(id)a3
{
}

- (NWInterface)interface
{
  return (NWInterface *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastProbeURL:(id)a3
{
}

- (NSURL)lastProbeURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastProbeUUID:(id)a3
{
}

- (NSUUID)lastProbeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPathEvaluator:(id)a3
{
}

- (NWPathEvaluator)pathEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParameters:(id)a3
{
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkDescriptionArray:(id)a3
{
}

- (NSArray)networkDescriptionArray
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBestAvailableNetworkDescription:(id)a3
{
}

- (NWNetworkDescription)bestAvailableNetworkDescription
{
  return (NWNetworkDescription *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)privateDescription
{
  id v2 = [(NWMonitor *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (NSString)description
{
  id v2 = [(NWMonitor *)self descriptionWithIndent:0 showFullContent:0];

  return (NSString *)v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v4) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWMonitor mID](self, "mID"), @"monitorID", v5);
  }
  unint64_t v8 = [(NWMonitor *)self status];
  if (v8 >= 3)
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v8);
  }
  else
  {
    id v9 = (void *)*((void *)&off_1E523BC78 + v8);
  }
  [v7 appendPrettyObject:v9 withName:@"status" indent:v5 showFullContent:v4];

  id v10 = [(NWMonitor *)self endpoint];
  [v7 appendPrettyObject:v10 withName:@"endpoint" indent:v5 showFullContent:v4];

  id v11 = [(NWMonitor *)self parameters];
  [v7 appendPrettyObject:v11 withName:@"parameters" indent:v5 showFullContent:v4];

  uint64_t v12 = [(NWMonitor *)self networkDescriptionArray];
  [v7 appendPrettyObject:v12 withName:@"descriptions" indent:v5 showFullContent:v4];

  uint64_t v13 = [(NWMonitor *)self bestAvailableNetworkDescription];
  [v7 appendPrettyObject:v13 withName:@"current" indent:v5 showFullContent:v4];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(NWMonitor *)self networkDescriptionArray];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NWMonitor *)self endpoint];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(NWMonitor *)self parameters];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [v5 networkDescriptionArray];
    id v7 = [v5 endpoint];
    unint64_t v8 = [v5 parameters];

    BOOL v9 = [(NWMonitor *)self matchesNetworkDescriptionArray:v6 endpoint:v7 parameters:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)matchesNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NWMonitor *)self networkDescriptionArray];
  int v12 = [v11 isEqualToArray:v10];

  if (v12)
  {
    id v13 = [(NWMonitor *)self parameters];
    id v14 = v9;
    id v15 = v14;
    if (v13 != v14 && v13 && v14)
    {
      if (![v13 isMemberOfClass:objc_opt_class()]) {
        goto LABEL_14;
      }
      char v16 = [v13 isEqual:v15];

      if (v16)
      {
LABEL_7:
        id v13 = [(NWMonitor *)self endpoint];
        id v17 = v8;
        id v15 = v17;
        char v18 = v13 == v17;
        if (v13 == v17 || !v13 || !v17) {
          goto LABEL_15;
        }
        if ([v13 isMemberOfClass:objc_opt_class()])
        {
          char v18 = [v13 isEqual:v15];
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        char v18 = 0;
        goto LABEL_15;
      }
    }
    else
    {

      if (v13 == v15) {
        goto LABEL_7;
      }
    }
  }
  char v18 = 0;
LABEL_16:

  return v18;
}

- (void)dealloc
{
  v3 = [(NWMonitor *)self pathEvaluator];
  [v3 removeObserver:self forKeyPath:@"path"];

  v4.receiver = self;
  v4.super_class = (Class)NWMonitor;
  [(NWMonitor *)&v4 dealloc];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void))a7;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[NWMonitor URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]";
    __int16 v12 = 1024;
    unsigned int v13 = [(NWMonitor *)self mID];
    _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %u received a redirect on probe URL request, not following redirect", (uint8_t *)&v10, 0x12u);
  }

  v8[2](v8, 0);
}

- (void)evaluateStartingAtIndex:(unint64_t)a3 probeUUID:(id)a4 probeWasSuccessful:(BOOL)a5
{
  id v8 = a4;
  id v9 = [(id)objc_opt_class() queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke;
  v11[3] = &unk_1E523BC58;
  id v12 = v8;
  unsigned int v13 = self;
  unint64_t v14 = a3;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);
}

void __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke(uint64_t a1)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_super v4 = [v3 lastProbeUUID];
    char v5 = [v2 isEqual:v4];

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v6 = (id)gLogObj;
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if ((v5 & 1) == 0)
    {
      if (v7)
      {
        int v40 = [*(id *)(a1 + 40) mID];
        os_log_type_t v41 = [v2 UUIDString];
        v42 = [*(id *)(a1 + 40) lastProbeUUID];
        os_log_type_t v43 = [v42 UUIDString];
        *(_DWORD *)buf = 136446978;
        v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v83 = 1024;
        int v84 = v40;
        __int16 v85 = 2114;
        v86 = v41;
        __int16 v87 = 2114;
        v88 = v43;
        _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEBUG, "%{public}s %u received stale probe %{public}@ (current one is %{public}@)", buf, 0x26u);
      }
      goto LABEL_43;
    }
    if (v7)
    {
      int v8 = [*(id *)(a1 + 40) mID];
      id v9 = [v2 UUIDString];
      *(_DWORD *)buf = 136446722;
      v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = v8;
      __int16 v85 = 2114;
      v86 = v9;
      _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEBUG, "%{public}s %u received valid probe %{public}@", buf, 0x1Cu);
    }
  }
  else
  {
    id v10 = [v3 pathEvaluator];
    id v11 = [v10 path];
    uint64_t v6 = [v11 privateDescription];

    if (gLogDatapath)
    {
      v67 = __nwlog_obj();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        int v68 = [*(id *)(a1 + 40) mID];
        *(_DWORD *)buf = 136446722;
        v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v83 = 1024;
        int v84 = v68;
        __int16 v85 = 2114;
        v86 = v6;
        _os_log_impl(&dword_1830D4000, v67, OS_LOG_TYPE_DEBUG, "%{public}s %u received path change %{public}@", buf, 0x1Cu);
      }
    }
  }

  id v12 = [*(id *)(a1 + 40) networkDescriptionArray];
  unint64_t v13 = [v12 count];

  unint64_t v14 = [*(id *)(a1 + 40) pathEvaluator];
  uint64_t v6 = [v14 path];

  long long v72 = [*(id *)(a1 + 40) interface];
  BOOL v15 = [v6 interface];
  [*(id *)(a1 + 40) setInterface:v15];

  unint64_t v16 = *(void *)(a1 + 48);
  if ([v6 status] != 1) {
    goto LABEL_9;
  }
  uint64_t v17 = [*(id *)(a1 + 40) interface];
  if (!v17
    || (char v18 = (void *)v17,
        [*(id *)(a1 + 40) interface],
        v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 isDeepEqual:v72],
        v19,
        v18,
        (v20 & 1) == 0))
  {
LABEL_9:
    id v22 = [*(id *)(a1 + 40) privateDescription];
    if (gLogDatapath)
    {
      v65 = __nwlog_obj();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        int v66 = [*(id *)(a1 + 40) mID];
        *(_DWORD *)buf = 136446722;
        v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v83 = 1024;
        int v84 = v66;
        __int16 v85 = 2114;
        v86 = v22;
        _os_log_impl(&dword_1830D4000, v65, OS_LOG_TYPE_DEBUG, "%{public}s %u resetting self to unsatisfied: %{public}@", buf, 0x1Cu);
      }
    }
    [*(id *)(a1 + 40) setLastProbeUUID:0];
    [*(id *)(a1 + 40) setLastProbeURL:0];

    if (v13)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        v24 = [*(id *)(a1 + 40) networkDescriptionArray];
        v25 = [v24 objectAtIndexedSubscript:i];

        [v25 setState:0];
      }
    }

    unint64_t v16 = 0;
    id v2 = 0;
  }
  if (v16 >= v13)
  {
LABEL_29:
    id v38 = 0;
    uint64_t v39 = 2;
LABEL_37:
    [*(id *)(a1 + 40) setLastProbeUUID:0];
    [*(id *)(a1 + 40) setLastProbeURL:0];
    id v47 = [*(id *)(a1 + 40) bestAvailableNetworkDescription];

    BOOL v48 = v38 != v47;
    if (v38 != v47 || v39 != [*(id *)(a1 + 40) status])
    {
      if (NWCopyInternalQueue_init_once != -1) {
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
      }
      id v49 = (id)NWCopyInternalQueue_nwQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_39;
      block[3] = &unk_1E523BC58;
      BOOL v76 = v48;
      block[4] = *(void *)(a1 + 40);
      id v38 = v38;
      id v74 = v38;
      uint64_t v75 = v39;
      dispatch_async(v49, block);
    }
    goto LABEL_42;
  }
  v26 = &nwlog_legacy_init(void)::init_once;
  id v27 = (id *)&unk_1EB267000;
  long long v71 = v6;
  objc_msgSend(*(id *)(a1 + 40), "networkDescriptionArray", 136446466, v21);
  while (1)
    os_log_type_t v28 = {;
    v29 = [v28 objectAtIndexedSubscript:v16];

    [v29 updateStateWithPath:v6];
    uint64_t v30 = [v29 state];
    if (v30 != 2)
    {
      if (v30 != 1) {
        goto LABEL_17;
      }
      id v38 = v29;
LABEL_36:

      uint64_t v39 = 1;
      goto LABEL_37;
    }
    if (!v2) {
      break;
    }
    if (*(unsigned char *)(a1 + 56))
    {
      [v29 setState:1];
      id v38 = v29;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v44 = v27[237];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        int v45 = [*(id *)(a1 + 40) mID];
        v46 = [v2 UUIDString];
        *(_DWORD *)buf = 136446722;
        v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v83 = 1024;
        int v84 = v45;
        __int16 v85 = 2114;
        v86 = v46;
        _os_log_impl(&dword_1830D4000, v44, OS_LOG_TYPE_DEBUG, "%{public}s %u received successful probe %{public}@", buf, 0x1Cu);
      }
      id v2 = 0;
      goto LABEL_36;
    }
    [v29 setState:3];
    pthread_once(v26, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v31 = v27[237];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      BOOL v32 = v26;
      v33 = v27;
      int v34 = [*(id *)(a1 + 40) mID];
      v35 = [v2 UUIDString];
      *(_DWORD *)buf = 136446722;
      v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = v34;
      id v27 = v33;
      v26 = v32;
      uint64_t v6 = v71;
      __int16 v85 = 2114;
      v86 = v35;
      _os_log_impl(&dword_1830D4000, v31, OS_LOG_TYPE_DEBUG, "%{public}s %u received unsuccessful probe %{public}@", buf, 0x1Cu);
    }
LABEL_28:

    id v2 = 0;
LABEL_17:

    if (v13 == ++v16) {
      goto LABEL_29;
    }
    objc_msgSend(*(id *)(a1 + 40), "networkDescriptionArray", v69, v70);
  }
  uint64_t v36 = [v29 probeURL];
  if (!v36)
  {
    pthread_once(v26, nwlog_legacy_init_once);
    networkd_settings_init();
    id v2 = v27[237];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v37 = [*(id *)(a1 + 40) mID];
      *(_DWORD *)buf = v69;
      v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = v37;
      _os_log_impl(&dword_1830D4000, v2, OS_LOG_TYPE_ERROR, "%{public}s %u ERROR: NWNDShouldProbe but nil probeURL", buf, 0x12u);
    }
    goto LABEL_28;
  }
  v50 = (void *)v36;
  v51 = [*(id *)(a1 + 40) lastProbeURL];
  int v52 = [v50 isEqual:v51];

  if (v52)
  {
    if (gLogDatapath)
    {
      v53 = __nwlog_obj();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        int v54 = [*(id *)(a1 + 40) mID];
        *(_DWORD *)buf = v69;
        v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v83 = 1024;
        int v84 = v54;
        _os_log_impl(&dword_1830D4000, v53, OS_LOG_TYPE_DEBUG, "%{public}s %u already sent probe out", buf, 0x12u);
      }
      uint64_t v6 = v71;
      goto LABEL_52;
    }
  }
  else
  {
    v55 = [MEMORY[0x1E4F29128] UUID];
    [*(id *)(a1 + 40) setLastProbeUUID:v55];
    [*(id *)(a1 + 40) setLastProbeURL:v50];
    v56 = __nwlog_obj();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      int v57 = [*(id *)(a1 + 40) mID];
      v58 = [v55 UUIDString];
      *(_DWORD *)buf = 136447234;
      v82 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = v57;
      __int16 v85 = 2114;
      v86 = v58;
      __int16 v87 = 2114;
      v88 = v50;
      __int16 v89 = 2048;
      unint64_t v90 = v16;
      _os_log_impl(&dword_1830D4000, v56, OS_LOG_TYPE_DEBUG, "%{public}s %u sending out probe %{public}@ to %{public}@ for description %lu", buf, 0x30u);
    }
    v59 = (void *)MEMORY[0x1E4F18DC0];
    v60 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    uint64_t v61 = *(void *)(a1 + 40);
    v62 = [(id)objc_opt_class() mainOperationQueue];
    v53 = [v59 sessionWithConfiguration:v60 delegate:v61 delegateQueue:v62];

    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_36;
    v77[3] = &unk_1E523BC30;
    v77[4] = *(void *)(a1 + 40);
    id v78 = v55;
    id v79 = v50;
    unint64_t v80 = v16;
    id v63 = v55;
    id v64 = [v53 dataTaskWithURL:v79 completionHandler:v77];
    [v64 resume];
    [v53 finishTasksAndInvalidate];

LABEL_52:
  }

  id v2 = 0;
  id v38 = 0;
LABEL_42:

LABEL_43:
}

void __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_36(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v12 = [v10 code];

      if (v12 != -1202) {
        goto LABEL_7;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136446210;
        char v20 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s probe URL failed due to untrusted server certificate", (uint8_t *)&v19, 0xCu);
      }
    }
  }
LABEL_7:
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  unint64_t v13 = (id)gLogObj;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = [*(id *)(a1 + 32) mID];
    BOOL v15 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    int v19 = 136447746;
    char v20 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = v14;
    __int16 v23 = 2114;
    v24 = v15;
    __int16 v25 = 2114;
    uint64_t v26 = v16;
    __int16 v27 = 2048;
    uint64_t v28 = v17;
    __int16 v29 = 2048;
    id v30 = v7;
    __int16 v31 = 2114;
    id v32 = v8;
    _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_DEBUG, "%{public}s %u received response for probe %{public}@ to %{public}@ for description%lu: data = %p, response = %{public}@", (uint8_t *)&v19, 0x44u);
  }
  if (v7)
  {
    objc_opt_class();
    BOOL v18 = (objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)([v8 statusCode] - 200) < 0x64;
  }
  else
  {
    BOOL v18 = 0;
  }
  [*(id *)(a1 + 32) evaluateStartingAtIndex:*(void *)(a1 + 56) probeUUID:*(void *)(a1 + 40) probeWasSuccessful:v18];
}

uint64_t __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_39(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = [*(id *)(a1 + 32) bestAvailableNetworkDescription];
    v3 = [v2 privateDescription];

    objc_super v4 = [*(id *)(a1 + 40) privateDescription];
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    char v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [*(id *)(a1 + 32) mID];
      *(_DWORD *)buf = 136446978;
      uint64_t v17 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 2114;
      id v21 = v3;
      __int16 v22 = 2114;
      __int16 v23 = v4;
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEBUG, "%{public}s %u updating best description from %{public}@ to %{public}@", buf, 0x26u);
    }

    [*(id *)(a1 + 32) willChangeValueForKey:@"bestAvailableNetworkDescription"];
    [*(id *)(a1 + 32) setBestAvailableNetworkDescription:*(void *)(a1 + 40)];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 32) status];
  if (v7 != result)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [*(id *)(a1 + 32) mID];
      unint64_t v11 = [*(id *)(a1 + 32) status];
      if (v11 >= 3)
      {
        uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v11);
      }
      else
      {
        uint64_t v12 = (void *)*((void *)&off_1E523BC78 + v11);
      }
      id v13 = v12;
      unint64_t v14 = *(void *)(a1 + 48);
      if (v14 >= 3)
      {
        BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", *(void *)(a1 + 48));
      }
      else
      {
        BOOL v15 = (void *)*((void *)&off_1E523BC78 + v14);
      }
      *(_DWORD *)buf = 136446978;
      uint64_t v17 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = v10;
      __int16 v20 = 2114;
      id v21 = v13;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_DEBUG, "%{public}s %u updating state from %{public}@ to %{public}@", buf, 0x26u);
    }
    [*(id *)(a1 + 32) willChangeValueForKey:@"status"];
    [*(id *)(a1 + 32) setStatus:*(void *)(a1 + 48)];
    uint64_t result = [*(id *)(a1 + 32) didChangeValueForKey:@"status"];
  }
  if (*(unsigned char *)(a1 + 56)) {
    return [*(id *)(a1 + 32) didChangeValueForKey:@"bestAvailableNetworkDescription"];
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      id v13 = "-[NWMonitor observeValueForKeyPath:ofObject:change:context:]";
      __int16 v14 = 1024;
      unsigned int v15 = [(NWMonitor *)self mID];
      __int16 v16 = 2114;
      id v17 = v9;
      unint64_t v11 = "%{public}s %u invalid object %{public}@";
LABEL_8:
      _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x1Cu);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (([v8 isEqualToString:@"path"] & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      id v13 = "-[NWMonitor observeValueForKeyPath:ofObject:change:context:]";
      __int16 v14 = 1024;
      unsigned int v15 = [(NWMonitor *)self mID];
      __int16 v16 = 2114;
      id v17 = v8;
      unint64_t v11 = "%{public}s %u invalid keypath %{public}@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(NWMonitor *)self evaluateStartingAtIndex:0 probeUUID:0 probeWasSuccessful:0];
LABEL_10:
}

+ (NWMonitor)monitorWithNetworkDescription:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  nw_allow_use_of_dispatch_internal();
  if (v8)
  {
    id v26 = v8;
    unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    int v12 = [a1 monitorWithNetworkDescriptionArray:v11 endpoint:v9 parameters:v10];

    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v13 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  uint64_t v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
  __int16 v14 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v14, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      unsigned int v15 = (id)gLogObj;
      os_log_type_t v16 = type;
      if (!os_log_type_enabled(v15, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
      id v17 = "%{public}s called with null networkDescription";
LABEL_20:
      __int16 v22 = v15;
      os_log_type_t v23 = v16;
      goto LABEL_21;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      unsigned int v15 = (id)gLogObj;
      os_log_type_t v16 = type;
      if (!os_log_type_enabled(v15, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
      id v17 = "%{public}s called with null networkDescription, backtrace limit exceeded";
      goto LABEL_20;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    unsigned int v15 = (id)gLogObj;
    os_log_type_t v19 = type;
    BOOL v20 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (!v20)
      {
LABEL_22:

        if (!v14) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
      id v17 = "%{public}s called with null networkDescription, no backtrace";
      __int16 v22 = v15;
      os_log_type_t v23 = v19;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v22, v23, v17, buf, 0xCu);
      goto LABEL_22;
    }
    if (v20)
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
      __int16 v29 = 2082;
      id v30 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s called with null networkDescription, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v14) {
LABEL_13:
  }
    free(v14);
LABEL_14:
  int v12 = 0;
LABEL_15:

  return (NWMonitor *)v12;
}

+ (void)saveMonitor:(id)a3
{
  id v4 = a3;
  id v3 = (id)savedMonitorsLock;
  objc_sync_enter(v3);
  ++saveMonitor__sMonitorID;
  objc_msgSend(v4, "setMID:");
  [(id)savedMonitors addObject:v4];
  objc_sync_exit(v3);
}

+ (id)copySavedMonitorForNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (id)savedMonitorsLock;
  objc_sync_enter(v10);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = (id)savedMonitors;
  id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        unsigned int v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v15, "matchesNetworkDescriptionArray:endpoint:parameters:", v7, v8, v9, (void)v17))
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v10);
  return v12;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v3 = (void *)savedMonitors;
    savedMonitors = v2;

    uint64_t v4 = objc_opt_new();
    char v5 = (void *)savedMonitorsLock;
    savedMonitorsLock = v4;
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"status"] & 1) != 0
    || ([v4 isEqualToString:@"bestAvailableNetworkDescription"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWMonitor;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

@end