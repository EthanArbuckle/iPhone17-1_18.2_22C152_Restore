@interface NWBrowser
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (NSSet)discoveredEndpoints;
- (NSSet)internalDiscoveredEndpoints;
- (NWBrowseDescriptor)descriptor;
- (NWBrowser)initWithDescriptor:(id)a3 parameters:(id)a4;
- (NWParameters)parameters;
- (OS_nw_browser)internalBrowser;
- (id)copyDiscoveredEndpoints;
- (void)cancel;
- (void)dealloc;
- (void)setInternalDiscoveredEndpoints:(id)a3;
- (void)setUpdateHandler;
@end

@implementation NWBrowser

- (NWBrowser)initWithDescriptor:(id)a3 parameters:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NWBrowser;
  v9 = [(NWBrowser *)&v27 init];
  v10 = v9;
  if (!v9)
  {
    v18 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWBrowser initWithDescriptor:parameters:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (!__nwlog_fault(v19, &type, &v25)) {
      goto LABEL_24;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
        v22 = "%{public}s [super init] failed";
LABEL_22:
        _os_log_impl(&dword_1830D4000, v20, v21, v22, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v20 = __nwlog_obj();
        os_log_type_t v21 = type;
        BOOL v24 = os_log_type_enabled(v20, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136446466;
            v29 = "-[NWBrowser initWithDescriptor:parameters:]";
            __int16 v30 = 2082;
            v31 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v20, v21, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v24) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
        v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }
      v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWBrowser initWithDescriptor:parameters:]";
        v22 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_23:

LABEL_24:
    if (v19) {
      free(v19);
    }
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v9->_descriptor, a3);
  objc_storeStrong((id *)&v10->_parameters, a4);
  v11 = [v7 internalDescriptor];
  v12 = [v8 internalParameters];
  nw_browser_t v13 = nw_browser_create(v11, v12);
  internalBrowser = v10->_internalBrowser;
  v10->_internalBrowser = (OS_nw_browser *)v13;

  if (!v10->_internalBrowser)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWBrowser initWithDescriptor:parameters:]";
      __int16 v30 = 2114;
      v31 = (char *)v7;
      __int16 v32 = 2114;
      id v33 = v8;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s nw_browser_create failed with descriptor %{public}@ and parameters %{public}@", buf, 0x20u);
    }

LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  [(NWBrowser *)v10 setUpdateHandler];
  v15 = v10;
LABEL_8:

  return v15;
}

void __29__NWBrowser_setUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained && a4)
  {
    id v11 = WeakRetained;
    objc_sync_enter(v11);
    [v11 willChangeValueForKey:@"discoveredEndpoints"];
    v12 = [MEMORY[0x1E4F1CA48] array];
    nw_browser_t v13 = [*(id *)(a1 + 32) internalBrowser];
    nw_browser_copy_browse_results(v13);
    v14 = (atomic_uchar *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __29__NWBrowser_setUpdateHandler__block_invoke_2;
      v17[3] = &unk_1E524AE18;
      id v15 = v12;
      id v18 = v15;
      nw_array_apply(v14, (uint64_t)v17);
      v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
      [v11 setInternalDiscoveredEndpoints:v16];
    }
    else
    {
      [v11 setInternalDiscoveredEndpoints:0];
    }
    [v11 didChangeValueForKey:@"discoveredEndpoints"];

    objc_sync_exit(v11);
  }
}

- (void)setUpdateHandler
{
  objc_initWeak(&location, self);
  v3 = [(NWBrowser *)self internalBrowser];
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  v4 = (id)NWCopyInternalQueue_nwQueue;
  nw_browser_set_queue(v3, v4);

  v5 = [(NWBrowser *)self internalBrowser];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __29__NWBrowser_setUpdateHandler__block_invoke;
  handler[3] = &unk_1E5247CF8;
  objc_copyWeak(&v8, &location);
  handler[4] = self;
  nw_browser_set_browse_results_changed_handler(v5, handler);

  v6 = [(NWBrowser *)self internalBrowser];
  nw_browser_start(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"discoveredEndpoints"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWBrowser;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDiscoveredEndpoints, 0);
  objc_storeStrong((id *)&self->_internalBrowser, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)setInternalDiscoveredEndpoints:(id)a3
{
}

- (NSSet)internalDiscoveredEndpoints
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (OS_nw_browser)internalBrowser
{
  return (OS_nw_browser *)objc_getProperty(self, a2, 24, 1);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 16, 1);
}

- (NWBrowseDescriptor)descriptor
{
  return (NWBrowseDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)discoveredEndpoints
{
  id v2 = [(NWBrowser *)self copyDiscoveredEndpoints];

  return (NSSet *)v2;
}

- (id)copyDiscoveredEndpoints
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = [(NWBrowser *)v2 internalDiscoveredEndpoints];
  objc_sync_exit(v2);

  return v3;
}

- (void)dealloc
{
  [(NWBrowser *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)NWBrowser;
  [(NWBrowser *)&v3 dealloc];
}

- (void)cancel
{
  objc_super v3 = [(NWBrowser *)self internalBrowser];

  if (v3)
  {
    id v4 = [(NWBrowser *)self internalBrowser];
    nw_browser_cancel(v4);
  }
}

uint64_t __29__NWBrowser_setUpdateHandler__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id endpoint = nw_browse_result_get_endpoint(a3);
  unsigned __int8 v5 = +[NWEndpoint endpointWithInternalEndpoint:endpoint];
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return 1;
}

@end