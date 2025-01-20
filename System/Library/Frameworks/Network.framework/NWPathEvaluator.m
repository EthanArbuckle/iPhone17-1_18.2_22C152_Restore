@interface NWPathEvaluator
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)copySavedPathEvaluatorForEndpoint:(id)a3 parameters:(id)a4;
+ (id)sharedDefaultEvaluator;
+ (void)initialize;
+ (void)savePathEvaluator:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesEndpoint:(id)a3 parameters:(id)a4;
- (BOOL)requestNexus;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (NWPath)internalPath;
- (NWPath)path;
- (NWPathEvaluator)init;
- (NWPathEvaluator)initWithBrowseDescriptor:(id)a3 parameters:(id)a4;
- (NWPathEvaluator)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWPathEvaluator)initWithEvaluator:(id)a3 parameters:(id)a4;
- (NWPathEvaluator)initWithListenParameters:(id)a3;
- (OS_nw_path_evaluator)internalEvaluator;
- (id)copyPath;
- (unint64_t)hash;
- (void)dealloc;
- (void)satisfyPathAgentsWithCompletionHandler:(id)a3;
- (void)setInternalPath:(id)a3;
- (void)triggerPathAgentsIncludingVoluntary:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)triggerVoluntaryPathAgentsWithCompletionHandler:(id)a3;
@end

@implementation NWPathEvaluator

- (NWPath)path
{
  id v2 = [(NWPathEvaluator *)self copyPath];

  return (NWPath *)v2;
}

- (id)copyPath
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = [(NWPathEvaluator *)v2 internalPath];
  objc_sync_exit(v2);

  return v3;
}

- (NWPath)internalPath
{
  return (NWPath *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)hash
{
  v3 = [(NWPathEvaluator *)self endpoint];
  uint64_t v4 = [v3 hash];
  v5 = [(NWPathEvaluator *)self parameters];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 32, 1);
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

+ (id)sharedDefaultEvaluator
{
  if (sharedDefaultEvaluator_initEvaluator != -1) {
    dispatch_once(&sharedDefaultEvaluator_initEvaluator, &__block_literal_global_88010);
  }
  id v2 = (void *)sharedDefaultEvaluator_sharedEvaluator;

  return v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWPathEvaluator;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v3 = (void *)savedPathEvaluators;
    savedPathEvaluators = v2;

    uint64_t v4 = objc_opt_new();
    unsigned __int8 v5 = (void *)savedPathEvaluatorsLock;
    savedPathEvaluatorsLock = v4;
  }
}

void __41__NWPathEvaluator_sharedDefaultEvaluator__block_invoke()
{
  v0 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:0];
  v1 = (void *)sharedDefaultEvaluator_sharedEvaluator;
  sharedDefaultEvaluator_sharedEvaluator = (uint64_t)v0;
}

- (NWPathEvaluator)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NWPathEvaluator copySavedPathEvaluatorForEndpoint:v7 parameters:v8];
  v10 = v9;
  if (!v9)
  {
    uint64_t v13 = [v8 copy];
    v14 = (void *)v13;
    if (!v8 || v13)
    {
      v20 = [v7 internalEndpoint];
      v21 = [v14 internalParameters];
      evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v20, v21);
      self = [(NWPathEvaluator *)self initWithEvaluator:evaluator_for_endpoint parameters:v14];

      if (self)
      {
        objc_storeStrong((id *)&self->_endpoint, a3);
        +[NWPathEvaluator savePathEvaluator:self];
        self = self;
        v12 = self;
LABEL_24:

        goto LABEL_25;
      }
LABEL_23:
      v12 = 0;
      goto LABEL_24;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
    __int16 v33 = 2114;
    id v34 = v8;
    v16 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (!__nwlog_fault((const char *)v16, &type, &v29))
    {
LABEL_21:
      if (v16) {
        free(v16);
      }
      goto LABEL_23;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446466;
        v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
        __int16 v33 = 2114;
        id v34 = v8;
        v19 = "%{public}s [%{public}@ copy] failed";
LABEL_18:
        v26 = v17;
        os_log_type_t v27 = v18;
LABEL_19:
        _os_log_impl(&dword_1830D4000, v26, v27, v19, buf, 0x16u);
      }
    }
    else
    {
      if (v29)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v17 = (id)gLogObj;
        os_log_type_t v24 = type;
        BOOL v25 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v25)
          {
            *(_DWORD *)buf = 136446722;
            v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
            __int16 v33 = 2114;
            id v34 = v8;
            __int16 v35 = 2082;
            v36 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v17, v24, "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          goto LABEL_21;
        }
        if (!v25) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446466;
        v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
        __int16 v33 = 2114;
        id v34 = v8;
        v19 = "%{public}s [%{public}@ copy] failed, no backtrace";
        v26 = v17;
        os_log_type_t v27 = v24;
        goto LABEL_19;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446466;
        v32 = "-[NWPathEvaluator initWithEndpoint:parameters:]";
        __int16 v33 = 2114;
        id v34 = v8;
        v19 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_18;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  id v11 = v9;

  self = (NWPathEvaluator *)v11;
  v12 = self;
LABEL_25:

  return v12;
}

+ (void)savePathEvaluator:(id)a3
{
  id v4 = a3;
  id v3 = (id)savedPathEvaluatorsLock;
  objc_sync_enter(v3);
  [(id)savedPathEvaluators addObject:v4];
  objc_sync_exit(v3);
}

+ (id)copySavedPathEvaluatorForEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)savedPathEvaluatorsLock;
  objc_sync_enter(v7);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = (id)savedPathEvaluators;
  id v9 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "matchesEndpoint:parameters:", v5, v6, (void)v14))
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v7);
  return v9;
}

- (NWPathEvaluator)initWithEvaluator:(id)a3 parameters:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    __int16 v33 = __nwlog_obj();
    *(_DWORD *)location = 136446210;
    *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
    id v34 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v52 = 0;
    if (__nwlog_fault(v34, &type, &v52))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __int16 v35 = __nwlog_obj();
        os_log_type_t v36 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_1830D4000, v35, v36, "%{public}s called with null evaluator", location, 0xCu);
        }
      }
      else if (v52)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __int16 v35 = __nwlog_obj();
        os_log_type_t v42 = type;
        BOOL v43 = os_log_type_enabled(v35, type);
        if (backtrace_string)
        {
          if (v43)
          {
            *(_DWORD *)location = 136446466;
            *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
            __int16 v55 = 2082;
            v56 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v35, v42, "%{public}s called with null evaluator, dumping backtrace:%{public}s", location, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_58;
        }
        if (v43)
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_1830D4000, v35, v42, "%{public}s called with null evaluator, no backtrace", location, 0xCu);
        }
      }
      else
      {
        __int16 v35 = __nwlog_obj();
        os_log_type_t v47 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_1830D4000, v35, v47, "%{public}s called with null evaluator, backtrace limit exceeded", location, 0xCu);
        }
      }
    }
LABEL_58:
    if (v34) {
      free(v34);
    }

    goto LABEL_15;
  }
  v51.receiver = self;
  v51.super_class = (Class)NWPathEvaluator;
  id v9 = [(NWPathEvaluator *)&v51 init];
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v37 = __nwlog_obj();
    *(_DWORD *)location = 136446210;
    *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
    v38 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v52 = 0;
    if (__nwlog_fault(v38, &type, &v52))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v39 = __nwlog_obj();
        os_log_type_t v40 = type;
        if (os_log_type_enabled(v39, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_1830D4000, v39, v40, "%{public}s [super init] failed", location, 0xCu);
        }
      }
      else if (v52)
      {
        v44 = (char *)__nw_create_backtrace_string();
        v39 = __nwlog_obj();
        os_log_type_t v45 = type;
        BOOL v46 = os_log_type_enabled(v39, type);
        if (v44)
        {
          if (v46)
          {
            *(_DWORD *)location = 136446466;
            *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
            __int16 v55 = 2082;
            v56 = v44;
            _os_log_impl(&dword_1830D4000, v39, v45, "%{public}s [super init] failed, dumping backtrace:%{public}s", location, 0x16u);
          }

          free(v44);
          goto LABEL_64;
        }
        if (v46)
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_1830D4000, v39, v45, "%{public}s [super init] failed, no backtrace", location, 0xCu);
        }
      }
      else
      {
        v39 = __nwlog_obj();
        os_log_type_t v48 = type;
        if (os_log_type_enabled(v39, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          _os_log_impl(&dword_1830D4000, v39, v48, "%{public}s [super init] failed, backtrace limit exceeded", location, 0xCu);
        }
      }
    }
LABEL_64:
    if (v38) {
      free(v38);
    }
    goto LABEL_15;
  }
  p_internalEvaluator = (os_unfair_lock_s **)&v9->_internalEvaluator;
  objc_storeStrong((id *)&v9->_internalEvaluator, a3);
  objc_storeStrong((id *)&v10->_parameters, a4);
  v12 = [NWPath alloc];
  uint64_t v13 = nw_path_evaluator_copy_path(*p_internalEvaluator);
  uint64_t v14 = [(NWPath *)v12 initWithPath:v13];
  internalPath = v10->_internalPath;
  v10->_internalPath = (NWPath *)v14;

  if (!v10->_internalPath)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v19 = (id)gLogObj;
    v20 = *p_internalEvaluator;
    *(_DWORD *)location = 136446466;
    *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
    __int16 v55 = 2114;
    v56 = v20;
    v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v52 = 0;
    if (__nwlog_fault(v21, &type, &v52))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (os_log_type_enabled(v22, type))
        {
          os_log_type_t v24 = *p_internalEvaluator;
          *(_DWORD *)location = 136446466;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          __int16 v55 = 2114;
          v56 = v24;
          _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed", location, 0x16u);
        }
      }
      else if (v52)
      {
        v26 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        os_log_type_t v27 = type;
        BOOL v28 = os_log_type_enabled(v22, type);
        if (v26)
        {
          if (v28)
          {
            char v29 = *p_internalEvaluator;
            *(_DWORD *)location = 136446722;
            *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
            __int16 v55 = 2114;
            v56 = v29;
            __int16 v57 = 2082;
            v58 = v26;
            _os_log_impl(&dword_1830D4000, v22, v27, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed, dumping backtrace:%{public}s", location, 0x20u);
          }

          free(v26);
          if (!v21) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
        if (v28)
        {
          v32 = *p_internalEvaluator;
          *(_DWORD *)location = 136446466;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          __int16 v55 = 2114;
          v56 = v32;
          _os_log_impl(&dword_1830D4000, v22, v27, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed, no backtrace", location, 0x16u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        os_log_type_t v30 = type;
        if (os_log_type_enabled(v22, type))
        {
          v31 = *p_internalEvaluator;
          *(_DWORD *)location = 136446466;
          *(void *)&location[4] = "-[NWPathEvaluator initWithEvaluator:parameters:]";
          __int16 v55 = 2114;
          v56 = v31;
          _os_log_impl(&dword_1830D4000, v22, v30, "%{public}s [[NWPath alloc] initWithPath:nw_path_evaluator_copy_path(%{public}@)] failed, backtrace limit exceeded", location, 0x16u);
        }
      }
    }
    if (!v21)
    {
LABEL_14:

LABEL_15:
      os_log_type_t v18 = 0;
      goto LABEL_16;
    }
LABEL_13:
    free(v21);
    goto LABEL_14;
  }
  objc_initWeak((id *)location, v10);
  internalEvaluator = v10->_internalEvaluator;
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  id v17 = (id)NWCopyInternalQueue_nwQueue;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __48__NWPathEvaluator_initWithEvaluator_parameters___block_invoke;
  v49[3] = &unk_1E524B478;
  objc_copyWeak(&v50, (id *)location);
  nw_path_evaluator_set_update_handler(internalEvaluator, v17, v49);

  os_log_type_t v18 = v10;
  objc_destroyWeak(&v50);
  objc_destroyWeak((id *)location);

LABEL_16:
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_internalPath, 0);
  objc_storeStrong((id *)&self->_internalEvaluator, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)setInternalPath:(id)a3
{
}

- (OS_nw_path_evaluator)internalEvaluator
{
  return (OS_nw_path_evaluator *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    id v6 = [v5 endpoint];
    id v7 = [v5 parameters];

    BOOL v8 = [(NWPathEvaluator *)self matchesEndpoint:v6 parameters:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)matchesEndpoint:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NWPathEvaluator *)self endpoint];
  id v9 = v7;
  id v10 = v9;
  int v11 = v8 == v9;
  if (v8 != v9 && v8 && v9)
  {
    if (![v8 isMemberOfClass:objc_opt_class()])
    {

      char v13 = 0;
      uint64_t v14 = v8;
LABEL_16:

      goto LABEL_17;
    }
    int v11 = [v8 isEqual:v10];
  }

  if (v11)
  {
    id v10 = [(NWPathEvaluator *)self parameters];
    id v12 = v6;
    id v8 = v12;
    char v13 = v10 == v12;
    if (v10 != v12 && v10 && v12)
    {
      if ([v10 isMemberOfClass:objc_opt_class()]) {
        char v13 = [v10 isEqual:v8];
      }
      else {
        char v13 = 0;
      }
    }
    uint64_t v14 = v10;
    goto LABEL_16;
  }
  char v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)requestNexus
{
  uint64_t v2 = [(NWPathEvaluator *)self internalEvaluator];
  BOOL v3 = nw_path_evaluator_request_nexus(v2);

  return v3;
}

- (void)triggerVoluntaryPathAgentsWithCompletionHandler:(id)a3
{
}

- (void)satisfyPathAgentsWithCompletionHandler:(id)a3
{
}

- (void)triggerPathAgentsIncludingVoluntary:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  xpc_object_t v7 = xpc_array_create(0, 0);
  id v8 = [(NWPathEvaluator *)self internalEvaluator];
  int v9 = nw_path_evaluator_trigger_agents(v8, a3, 0, v7);

  switch(v9)
  {
    case 2:
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = 2;
LABEL_7:
      id v11 = (id)[v12 initWithDomain:@"NWPathEvaluatorErrorDomain" code:v13 userInfo:0];
      v6[2](v6, v11, 0);
      goto LABEL_8;
    case 1:
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = 1;
      goto LABEL_7;
    case 0:
      id v10 = [MEMORY[0x1E4F1CA80] set];
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __77__NWPathEvaluator_triggerPathAgentsIncludingVoluntary_withCompletionHandler___block_invoke;
      applier[3] = &unk_1E524B4A0;
      id v15 = v10;
      id v11 = v10;
      xpc_array_apply(v7, applier);
      ((void (**)(id, id, id))v6)[2](v6, 0, v11);

LABEL_8:
      break;
  }
}

uint64_t __77__NWPathEvaluator_triggerPathAgentsIncludingVoluntary_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 alloc];
  bytes = xpc_uuid_get_bytes(v5);

  id v8 = (void *)[v6 initWithUUIDBytes:bytes];
  if (v8) {
    [*(id *)(a1 + 32) addObject:v8];
  }

  return 1;
}

- (NWPathEvaluator)init
{
  return [(NWPathEvaluator *)self initWithEndpoint:0 parameters:0];
}

- (NWPathEvaluator)initWithListenParameters:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  id v6 = v5;
  if (v4 && !v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
    __int16 v25 = 2114;
    id v26 = v4;
    id v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v21 = 0;
    if (__nwlog_fault(v8, &type, &v21))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v9 = (id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        id v11 = "%{public}s [%{public}@ copy] failed";
LABEL_19:
        id v19 = v9;
        os_log_type_t v20 = v10;
        goto LABEL_20;
      }
      if (!v21)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v9 = (id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        id v11 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_19;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v9 = (id)gLogObj;
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v9, type);
      if (!backtrace_string)
      {
        if (!v17)
        {
LABEL_21:

          if (!v8) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        id v11 = "%{public}s [%{public}@ copy] failed, no backtrace";
        id v19 = v9;
        os_log_type_t v20 = v16;
LABEL_20:
        _os_log_impl(&dword_1830D4000, v19, v20, v11, buf, 0x16u);
        goto LABEL_21;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446722;
        os_log_type_t v24 = "-[NWPathEvaluator initWithListenParameters:]";
        __int16 v25 = 2114;
        id v26 = v4;
        __int16 v27 = 2082;
        BOOL v28 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v9, v16, "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s", buf, 0x20u);
      }

      free(backtrace_string);
    }
    if (!v8)
    {
LABEL_15:
      uint64_t v14 = 0;
      goto LABEL_16;
    }
LABEL_14:
    free(v8);
    goto LABEL_15;
  }
  id v12 = [v5 internalParameters];
  evaluator_for_listener = nw_path_create_evaluator_for_listener(v12, 0);
  self = [(NWPathEvaluator *)self initWithEvaluator:evaluator_for_listener parameters:v6];

  uint64_t v14 = self;
LABEL_16:

  return v14;
}

- (NWPathEvaluator)initWithBrowseDescriptor:(id)a3 parameters:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 copy];
  int v9 = (void *)v8;
  if (v7 && !v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
    __int16 v29 = 2114;
    id v30 = v7;
    id v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (__nwlog_fault(v11, &type, &v25))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v12 = (id)gLogObj;
        os_log_type_t v13 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        uint64_t v14 = "%{public}s [%{public}@ copy] failed";
LABEL_19:
        os_log_type_t v23 = v12;
        os_log_type_t v24 = v13;
        goto LABEL_20;
      }
      if (!v25)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v12 = (id)gLogObj;
        os_log_type_t v13 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446466;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        uint64_t v14 = "%{public}s [%{public}@ copy] failed, backtrace limit exceeded";
        goto LABEL_19;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v12 = (id)gLogObj;
      os_log_type_t v20 = type;
      BOOL v21 = os_log_type_enabled(v12, type);
      if (!backtrace_string)
      {
        if (!v21)
        {
LABEL_21:

          if (!v11) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446466;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        uint64_t v14 = "%{public}s [%{public}@ copy] failed, no backtrace";
        os_log_type_t v23 = v12;
        os_log_type_t v24 = v20;
LABEL_20:
        _os_log_impl(&dword_1830D4000, v23, v24, v14, buf, 0x16u);
        goto LABEL_21;
      }
      if (v21)
      {
        *(_DWORD *)buf = 136446722;
        BOOL v28 = "-[NWPathEvaluator initWithBrowseDescriptor:parameters:]";
        __int16 v29 = 2114;
        id v30 = v7;
        __int16 v31 = 2082;
        v32 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v12, v20, "%{public}s [%{public}@ copy] failed, dumping backtrace:%{public}s", buf, 0x20u);
      }

      free(backtrace_string);
    }
    if (!v11)
    {
LABEL_15:
      os_log_type_t v18 = 0;
      goto LABEL_16;
    }
LABEL_14:
    free(v11);
    goto LABEL_15;
  }
  id v15 = [v6 internalDescriptor];
  os_log_type_t v16 = [v9 internalParameters];
  evaluator_for_browse = nw_path_create_evaluator_for_browse(v15, v16);
  self = [(NWPathEvaluator *)self initWithEvaluator:evaluator_for_browse parameters:v9];

  os_log_type_t v18 = self;
LABEL_16:

  return v18;
}

void __48__NWPathEvaluator_initWithEvaluator_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    [v5 willChangeValueForKey:@"path"];
    id v6 = [[NWPath alloc] initWithPath:v7];
    [v5 setInternalPath:v6];

    objc_sync_exit(v5);
    [v5 didChangeValueForKey:@"path"];
  }
}

- (void)dealloc
{
  nw_path_evaluator_cancel(self->_internalEvaluator);
  v3.receiver = self;
  v3.super_class = (Class)NWPathEvaluator;
  [(NWPathEvaluator *)&v3 dealloc];
}

@end