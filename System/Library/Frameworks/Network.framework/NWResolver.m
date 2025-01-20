@interface NWResolver
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (NSArray)internalResolvedEndpointArray;
- (NSArray)resolvedEndpointArray;
- (NSSet)internalResolvedEndpoints;
- (NSSet)resolvedEndpoints;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (NWResolver)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWResolver)initWithPath:(id)a3;
- (OS_nw_resolver)internalResolver;
- (id)copyResolvedEndpointArray;
- (id)copyResolvedEndpoints;
- (int64_t)internalStatus;
- (int64_t)status;
- (void)dealloc;
- (void)setInternalResolvedEndpointArray:(id)a3;
- (void)setInternalResolvedEndpoints:(id)a3;
- (void)setInternalStatus:(int64_t)a3;
- (void)setUpdateHandler;
@end

@implementation NWResolver

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"status"] & 1) != 0
    || ([v4 isEqualToString:@"resolvedEndpoints"] & 1) != 0
    || ([v4 isEqualToString:@"resolvedEndpointArray"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWResolver;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalResolvedEndpointArray, 0);
  objc_storeStrong((id *)&self->_internalResolvedEndpoints, 0);
  objc_storeStrong((id *)&self->_internalResolver, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)setInternalResolvedEndpointArray:(id)a3
{
}

- (NSArray)internalResolvedEndpointArray
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalResolvedEndpoints:(id)a3
{
}

- (NSSet)internalResolvedEndpoints
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalStatus:(int64_t)a3
{
  self->_internalStatus = a3;
}

- (int64_t)internalStatus
{
  return self->_internalStatus;
}

- (OS_nw_resolver)internalResolver
{
  return (OS_nw_resolver *)objc_getProperty(self, a2, 24, 1);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 16, 1);
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)resolvedEndpointArray
{
  id v2 = [(NWResolver *)self copyResolvedEndpointArray];

  return (NSArray *)v2;
}

- (id)copyResolvedEndpointArray
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = [(NWResolver *)v2 internalResolvedEndpointArray];
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)resolvedEndpoints
{
  id v2 = [(NWResolver *)self copyResolvedEndpoints];

  return (NSSet *)v2;
}

- (id)copyResolvedEndpoints
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = [(NWResolver *)v2 internalResolvedEndpoints];
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)status
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(NWResolver *)v2 internalStatus];
  objc_sync_exit(v2);

  return v3;
}

- (void)dealloc
{
  int64_t v3 = [(NWResolver *)self internalResolver];
  nw_resolver_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)NWResolver;
  [(NWResolver *)&v4 dealloc];
}

- (NWResolver)initWithPath:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NWResolver;
  unsigned __int8 v5 = [(NWResolver *)&v34 init];
  if (!v5)
  {
    v26 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWResolver initWithPath:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (!__nwlog_fault(v15, &type, &v32)) {
      goto LABEL_14;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v27 = __nwlog_obj();
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_1830D4000, v27, v28, v29, buf, 0xCu);
      }
    }
    else
    {
      if (v32)
      {
        backtrace_string = __nw_create_backtrace_string();
        v27 = __nwlog_obj();
        os_log_type_t v28 = type;
        BOOL v31 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v36 = "-[NWResolver initWithPath:]";
            __int16 v37 = 2082;
            v38 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v27, v28, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          v22 = (char *)backtrace_string;
LABEL_13:
          free(v22);
          goto LABEL_14;
        }
        if (!v31) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }
      v27 = __nwlog_obj();
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWResolver initWithPath:]";
        v29 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_40:

LABEL_14:
    if (!v15)
    {
LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
LABEL_15:
    free(v15);
    goto LABEL_16;
  }
  uint64_t v6 = [v4 endpoint];
  endpoint = v5->_endpoint;
  v5->_endpoint = (NWEndpoint *)v6;

  uint64_t v8 = [v4 parameters];
  parameters = v5->_parameters;
  v5->_parameters = (NWParameters *)v8;

  v10 = [v4 internalPath];
  v11 = nw_resolver_create_with_path(v10);
  internalResolver = v5->_internalResolver;
  v5->_internalResolver = (OS_nw_resolver *)v11;

  if (!v5->_internalResolver)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWResolver initWithPath:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (!__nwlog_fault(v15, &type, &v32)) {
      goto LABEL_14;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      os_log_type_t v17 = type;
      if (!os_log_type_enabled(v16, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWResolver initWithPath:]";
      v18 = "%{public}s nw_resolver_create_with_path failed";
LABEL_20:
      v24 = v16;
      os_log_type_t v25 = v17;
      goto LABEL_21;
    }
    if (!v32)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      os_log_type_t v17 = type;
      if (!os_log_type_enabled(v16, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWResolver initWithPath:]";
      v18 = "%{public}s nw_resolver_create_with_path failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    v19 = __nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    os_log_type_t v20 = type;
    BOOL v21 = os_log_type_enabled(v16, type);
    if (!v19)
    {
      if (!v21)
      {
LABEL_22:

        if (!v15) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWResolver initWithPath:]";
      v18 = "%{public}s nw_resolver_create_with_path failed, no backtrace";
      v24 = v16;
      os_log_type_t v25 = v20;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v24, v25, v18, buf, 0xCu);
      goto LABEL_22;
    }
    if (v21)
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWResolver initWithPath:]";
      __int16 v37 = 2082;
      v38 = v19;
      _os_log_impl(&dword_1830D4000, v16, v20, "%{public}s nw_resolver_create_with_path failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    v22 = (char *)v19;
    goto LABEL_13;
  }
  [(NWResolver *)v5 setUpdateHandler];
  v13 = v5;
LABEL_17:

  return v13;
}

- (NWResolver)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NWResolver;
  v9 = [(NWResolver *)&v27 init];
  v10 = v9;
  if (!v9)
  {
    v18 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWResolver initWithEndpoint:parameters:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (!__nwlog_fault(v19, &type, &v25)) {
      goto LABEL_24;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
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
        os_log_type_t v20 = __nwlog_obj();
        os_log_type_t v21 = type;
        BOOL v24 = os_log_type_enabled(v20, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136446466;
            v29 = "-[NWResolver initWithEndpoint:parameters:]";
            __int16 v30 = 2082;
            BOOL v31 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v20, v21, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v24) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
        v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }
      os_log_type_t v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWResolver initWithEndpoint:parameters:]";
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
  objc_storeStrong((id *)&v9->_endpoint, a3);
  objc_storeStrong((id *)&v10->_parameters, a4);
  v11 = [v7 internalEndpoint];
  v12 = [v8 internalParameters];
  v13 = nw_resolver_create_with_endpoint(v11, v12);
  internalResolver = v10->_internalResolver;
  v10->_internalResolver = (OS_nw_resolver *)v13;

  if (!v10->_internalResolver)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWResolver initWithEndpoint:parameters:]";
      __int16 v30 = 2114;
      BOOL v31 = (char *)v7;
      __int16 v32 = 2114;
      id v33 = v8;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s nw_resolver_create_with_endpoint failed with endpoint %{public}@ and parameters %{public}@", buf, 0x20u);
    }

LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  [(NWResolver *)v10 setUpdateHandler];
  v15 = v10;
LABEL_8:

  return v15;
}

- (void)setUpdateHandler
{
  objc_initWeak(&location, self);
  int64_t v3 = [(NWResolver *)self internalResolver];
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  id v4 = (id)NWCopyInternalQueue_nwQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__NWResolver_setUpdateHandler__block_invoke;
  v5[3] = &unk_1E524AE40;
  objc_copyWeak(&v6, &location);
  nw_resolver_set_update_handler(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __30__NWResolver_setUpdateHandler__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  unsigned __int8 v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    uint64_t v9 = [v8 internalStatus];
    if (v9 != a2)
    {
      [v8 willChangeValueForKey:@"status"];
      [v8 setInternalStatus:a2];
    }
    [v8 willChangeValueForKey:@"resolvedEndpoints"];
    [v8 willChangeValueForKey:@"resolvedEndpointArray"];
    if (v5)
    {
      v10 = [MEMORY[0x1E4F1CA48] array];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __30__NWResolver_setUpdateHandler__block_invoke_2;
      v13[3] = &unk_1E524AE18;
      id v11 = v10;
      id v14 = v11;
      nw_array_apply(v5, (uint64_t)v13);
      [v8 setInternalResolvedEndpointArray:v11];
      v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
      [v8 setInternalResolvedEndpoints:v12];
    }
    else
    {
      [v8 setInternalResolvedEndpointArray:0];
      [v8 setInternalResolvedEndpoints:0];
    }
    objc_sync_exit(v8);

    [v8 didChangeValueForKey:@"resolvedEndpointArray"];
    [v8 didChangeValueForKey:@"resolvedEndpoints"];
    if (v9 != a2) {
      [v8 didChangeValueForKey:@"status"];
    }
  }
}

uint64_t __30__NWResolver_setUpdateHandler__block_invoke_2(uint64_t a1)
{
  id v2 = +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:");
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1;
}

@end