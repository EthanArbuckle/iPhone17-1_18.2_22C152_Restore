@interface NWConcrete_nw_endpoint_resolver
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_resolver)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_resolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->modified_endpoint, 0);
  objc_storeStrong((id *)&self->resolver_resolved_endpoints, 0);
  objc_storeStrong((id *)&self->path_resolved_endpoints, 0);
  objc_storeStrong((id *)&self->resolve_flow_registrations, 0);
  objc_storeStrong((id *)&self->failed_child_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->child_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->connected_child, 0);

  objc_storeStrong((id *)&self->resolver, 0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_endpoint_resolver;
  [(NWConcrete_nw_endpoint_resolver *)&v2 dealloc];
}

- (NWConcrete_nw_endpoint_resolver)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_endpoint_resolver;
  objc_super v2 = [(NWConcrete_nw_endpoint_resolver *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_resolver init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v8 = __nwlog_obj();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_endpoint_resolver init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v31 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
    v20 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault(v20, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        uint64_t v21 = __nwlog_obj();
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v21, type))
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v21, v32, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_42;
      }
      if (!v39)
      {
        uint64_t v21 = __nwlog_obj();
        os_log_type_t v36 = type;
        if (os_log_type_enabled(v21, type))
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v21, v36, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_42;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      uint64_t v21 = __nwlog_obj();
      os_log_type_t v34 = type;
      BOOL v35 = os_log_type_enabled(v21, type);
      if (!backtrace_string)
      {
        if (v35)
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v21, v34, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_42;
      }
      if (v35)
      {
        *(_DWORD *)buf = 136446466;
        v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
        __int16 v43 = 2082;
        v44 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v21, v34, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_43:
    if (!v20) {
      goto LABEL_45;
    }
LABEL_44:
    free(v20);
    goto LABEL_45;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 == 1)
  {
    child_endpoint_handlers = self->child_endpoint_handlers;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __60__NWConcrete_nw_endpoint_resolver_cancelWithHandler_forced___block_invoke;
    v37[3] = &__block_descriptor_33_e35_B24__0Q8__NSObject_OS_nw_object__16l;
    BOOL v38 = a4;
    nw_array_apply((atomic_uchar *)child_endpoint_handlers, (uint64_t)v37);
    os_log_type_t v11 = self->child_endpoint_handlers;
    self->child_endpoint_handlers = 0;

    failed_child_endpoint_handlers = self->failed_child_endpoint_handlers;
    self->failed_child_endpoint_handlers = 0;

    resolver = self->resolver;
    if (resolver)
    {
      nw_resolver_cancel(resolver);
      char v14 = self->resolver;
      self->resolver = 0;
    }
    self->last_resolver_status = 0;
    child_timer = self->child_timer;
    if (child_timer)
    {
      nw_queue_cancel_source((uint64_t)child_timer);
      self->child_timer = 0;
    }
    trigger_agent_timer = self->trigger_agent_timer;
    if (trigger_agent_timer)
    {
      nw_queue_cancel_source((uint64_t)trigger_agent_timer);
      self->trigger_agent_timer = 0;
    }
    desperate_ivan_timer = self->desperate_ivan_timer;
    if (desperate_ivan_timer)
    {
      nw_queue_cancel_source((uint64_t)desperate_ivan_timer);
      self->desperate_ivan_timer = 0;
    }
    goto LABEL_45;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v18 = (id)gLogObj;
  if (v9 > 5) {
    __int16 v19 = "unknown-mode";
  }
  else {
    __int16 v19 = off_1E523FB08[v9];
  }
  *(_DWORD *)buf = 136446722;
  v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
  __int16 v43 = 2082;
  v44 = (void *)v19;
  __int16 v45 = 2082;
  v46 = "resolver";
  v20 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v39 = 0;
  if (!__nwlog_fault(v20, &type, &v39)) {
    goto LABEL_43;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v21 = (id)gLogObj;
    os_log_type_t v22 = type;
    if (os_log_type_enabled(v21, type))
    {
      if (v9 > 5) {
        v23 = "unknown-mode";
      }
      else {
        v23 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
      __int16 v43 = 2082;
      v44 = (void *)v23;
      __int16 v45 = 2082;
      v46 = "resolver";
      _os_log_impl(&dword_1830D4000, v21, v22, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_42:

    goto LABEL_43;
  }
  if (!v39)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v21 = (id)gLogObj;
    os_log_type_t v28 = type;
    if (os_log_type_enabled(v21, type))
    {
      if (v9 > 5) {
        v29 = "unknown-mode";
      }
      else {
        v29 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
      __int16 v43 = 2082;
      v44 = (void *)v29;
      __int16 v45 = 2082;
      v46 = "resolver";
      _os_log_impl(&dword_1830D4000, v21, v28, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_42;
  }
  v24 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v21 = (id)gLogObj;
  os_log_type_t v25 = type;
  BOOL v26 = os_log_type_enabled(v21, type);
  if (!v24)
  {
    if (v26)
    {
      if (v9 > 5) {
        v30 = "unknown-mode";
      }
      else {
        v30 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
      __int16 v43 = 2082;
      v44 = (void *)v30;
      __int16 v45 = 2082;
      v46 = "resolver";
      _os_log_impl(&dword_1830D4000, v21, v25, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_42;
  }
  if (v26)
  {
    if (v9 > 5) {
      v27 = "unknown-mode";
    }
    else {
      v27 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446978;
    v42 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
    __int16 v43 = 2082;
    v44 = (void *)v27;
    __int16 v45 = 2082;
    v46 = "resolver";
    __int16 v47 = 2082;
    v48 = v24;
    _os_log_impl(&dword_1830D4000, v21, v25, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v24);
  if (v20) {
    goto LABEL_44;
  }
LABEL_45:
}

- (void)startWithHandler:(id)a3
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v66 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
    os_log_type_t v25 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v99 = 0;
    if (!__nwlog_fault(v25, type, &v99)) {
      goto LABEL_70;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      BOOL v26 = __nwlog_obj();
      os_log_type_t v67 = type[0];
      if (os_log_type_enabled(v26, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_1830D4000, v26, v67, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v99)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      BOOL v26 = __nwlog_obj();
      os_log_type_t v69 = type[0];
      BOOL v70 = os_log_type_enabled(v26, type[0]);
      if (backtrace_string)
      {
        if (v70)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v26, v69, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_70;
      }
      if (v70)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_1830D4000, v26, v69, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      BOOL v26 = __nwlog_obj();
      os_log_type_t v80 = type[0];
      if (os_log_type_enabled(v26, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_1830D4000, v26, v80, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_69:

    goto LABEL_70;
  }
  id v6 = (unsigned int *)v4;
  uint64_t v7 = v6[29];

  if (v7 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v23 = (id)gLogObj;
    if (v7 > 5) {
      v24 = "unknown-mode";
    }
    else {
      v24 = off_1E523FB08[v7];
    }
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v24;
    __int16 v101 = 2082;
    v102 = "resolver";
    os_log_type_t v25 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v99 = 0;
    if (__nwlog_fault(v25, type, &v99))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v26 = (id)gLogObj;
        os_log_type_t v27 = type[0];
        if (os_log_type_enabled(v26, type[0]))
        {
          if (v7 > 5) {
            os_log_type_t v28 = "unknown-mode";
          }
          else {
            os_log_type_t v28 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v28;
          __int16 v101 = 2082;
          v102 = "resolver";
          _os_log_impl(&dword_1830D4000, v26, v27, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v99)
      {
        v29 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v26 = (id)gLogObj;
        os_log_type_t v30 = type[0];
        BOOL v31 = os_log_type_enabled(v26, type[0]);
        if (v29)
        {
          if (v31)
          {
            if (v7 > 5) {
              os_log_type_t v32 = "unknown-mode";
            }
            else {
              os_log_type_t v32 = off_1E523FB08[v7];
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v32;
            __int16 v101 = 2082;
            v102 = "resolver";
            __int16 v103 = 2082;
            v104 = v29;
            _os_log_impl(&dword_1830D4000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v29);
          if (!v25) {
            goto LABEL_72;
          }
LABEL_71:
          free(v25);
          goto LABEL_72;
        }
        if (v31)
        {
          if (v7 > 5) {
            char v39 = "unknown-mode";
          }
          else {
            char v39 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v39;
          __int16 v101 = 2082;
          v102 = "resolver";
          _os_log_impl(&dword_1830D4000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v26 = (id)gLogObj;
        os_log_type_t v33 = type[0];
        if (os_log_type_enabled(v26, type[0]))
        {
          if (v7 > 5) {
            os_log_type_t v34 = "unknown-mode";
          }
          else {
            os_log_type_t v34 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v34;
          __int16 v101 = 2082;
          v102 = "resolver";
          _os_log_impl(&dword_1830D4000, v26, v33, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_69;
    }
LABEL_70:
    if (!v25) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  v8 = v6;
  unsigned int v9 = v8[30];

  if (v9 == 1)
  {
    v10 = v8;
    char v11 = *((unsigned char *)v10 + 268);
    v92 = v10;

    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      BOOL v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        os_log_type_t v13 = v92;

        char v14 = v13;
        char v15 = *((unsigned char *)v92 + 268);

        if (v15) {
          objc_super v16 = "dry-run ";
        }
        else {
          objc_super v16 = "";
        }
        nw_endpoint_t v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        nw_endpoint_t v87 = v17;
        v90 = v13 + 168;
        __int16 v19 = v14;
        v20 = v19;
        uint64_t v21 = v8[30];
        if (v21 > 5) {
          os_log_type_t v22 = "unknown-state";
        }
        else {
          os_log_type_t v22 = off_1E523FB38[v21];
        }

        BOOL v35 = v20;
        os_log_type_t v36 = v35;
        unsigned int v37 = v6[29];
        BOOL v38 = "path";
        switch(v37)
        {
          case 0u:
            break;
          case 1u:
            BOOL v38 = "resolver";
            break;
          case 2u:
            BOOL v38 = nw_endpoint_flow_mode_string(v35[31]);
            break;
          case 3u:
            BOOL v38 = "proxy";
            break;
          case 4u:
            BOOL v38 = "fallback";
            break;
          case 5u:
            BOOL v38 = "transform";
            break;
          default:
            BOOL v38 = "unknown-mode";
            break;
        }

        v40 = v36;
        os_unfair_lock_lock((os_unfair_lock_t)v40 + 28);
        id v41 = v40[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v40 + 28);

        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v90;
        __int16 v101 = 2082;
        v102 = v16;
        __int16 v103 = 2082;
        v104 = (void *)logging_description;
        __int16 v105 = 2082;
        v106 = v22;
        __int16 v107 = 2082;
        v108 = v38;
        __int16 v109 = 2114;
        id v110 = v41;
        _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);
      }
    }
    v42 = v92;
    os_unfair_lock_lock((os_unfair_lock_t)v42 + 28);
    id v91 = *((id *)v42 + 8);
    os_unfair_lock_unlock((os_unfair_lock_t)v42 + 28);

    __int16 v43 = v42;
    BOOL v44 = (v92[67] & 1) == 0;

    if (v44) {
      nw_path_assert_required_agents(v91);
    }
    __int16 v45 = v43;
    id v46 = v45[4];

    __int16 v47 = v45;
    v48 = (NWConcrete_nw_path *)v91;
    id v49 = v46;
    if (v48)
    {
      v50 = [NWConcrete_nw_resolver alloc];
      v51 = v48;
      id v52 = v51[3];

      v53 = -[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:](v50, v52, v49, v51, (uint64_t)(v47 + 21));
      goto LABEL_56;
    }
    v71 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
    v72 = (const char *)_os_log_send_and_compose_impl();

    v73 = (char *)v72;
    type[0] = OS_LOG_TYPE_ERROR;
    char v99 = 0;
    if (__nwlog_fault(v72, type, &v99))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v74 = __nwlog_obj();
        os_log_type_t v75 = type[0];
        if (os_log_type_enabled(v74, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
          _os_log_impl(&dword_1830D4000, v74, v75, "%{public}s called with null path", buf, 0xCu);
        }
      }
      else if (v99)
      {
        v81 = (char *)__nw_create_backtrace_string();
        v74 = __nwlog_obj();
        os_log_type_t v88 = type[0];
        BOOL v82 = os_log_type_enabled(v74, type[0]);
        if (v81)
        {
          if (v82)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v81;
            _os_log_impl(&dword_1830D4000, v74, v88, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v81);
          goto LABEL_118;
        }
        if (v82)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
          _os_log_impl(&dword_1830D4000, v74, v88, "%{public}s called with null path, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v74 = __nwlog_obj();
        os_log_type_t v85 = type[0];
        if (os_log_type_enabled(v74, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_resolver_create_with_path_parameters_and_log_string";
          _os_log_impl(&dword_1830D4000, v74, v85, "%{public}s called with null path, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_118:
    if (v73) {
      free(v73);
    }
    v53 = 0;
LABEL_56:

    objc_storeStrong((id *)&self->resolver, v53);
    self->last_resolver_status = 0;
    v54 = v47;
    v8[30] = 2;

    v55 = nw_endpoint_handler_copy_endpoint(v54);
    nw_endpoint_type_t v56 = nw_endpoint_get_type(v55);
    if (v56 == (nw_endpoint_type_url|nw_endpoint_type_address)) {
      __int16 v57 = 6;
    }
    else {
      __int16 v57 = 1;
    }
    if (v56 == nw_endpoint_type_bonjour_service) {
      __int16 v58 = 3;
    }
    else {
      __int16 v58 = v57;
    }

    v54->event.domain = 2;
    v54->event.event = v58;
    nw_endpoint_handler_report(v54, 0, &v54->event.domain, 0);
    *(_DWORD *)os_log_type_t type = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    if (nw_path_get_vpn_config_uuid(v48, (unsigned __int8 (*)[16])buf, (int *)type, 1, 1)) {
      nw_endpoint_resolver_setup_trigger_agent_timer(v54, 0);
    }
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke;
    v96[3] = &unk_1E523F8E8;
    v59 = v54;
    v97 = v59;
    v60 = v53;
    v61 = v96;
    if (v60)
    {
      os_unfair_lock_lock((os_unfair_lock_t)v60 + 3);
      v62 = _Block_copy(v61);
      nw_endpoint_t v63 = v60[21];
      v60[21] = v62;

      os_unfair_lock_unlock((os_unfair_lock_t)v60 + 3);
LABEL_66:

      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke_2;
      v93[3] = &unk_1E523F910;
      v64 = v59;
      v94 = v64;
      v65 = v60;
      v95 = v65;
      nw_resolver_set_update_handler(v65, 0, v93);
      nw_endpoint_resolver_update_path_resolver_locked(v64);

      goto LABEL_72;
    }
    v76 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_resolver_set_alternative_handler";
    v77 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v99 = 0;
    if (__nwlog_fault(v77, type, &v99))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v78 = __nwlog_obj();
        os_log_type_t v79 = type[0];
        if (os_log_type_enabled(v78, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_resolver_set_alternative_handler";
          _os_log_impl(&dword_1830D4000, v78, v79, "%{public}s called with null resolver", buf, 0xCu);
        }
      }
      else if (v99)
      {
        v83 = (char *)__nw_create_backtrace_string();
        v78 = __nwlog_obj();
        os_log_type_t v89 = type[0];
        BOOL v84 = os_log_type_enabled(v78, type[0]);
        if (v83)
        {
          if (v84)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "nw_resolver_set_alternative_handler";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v83;
            _os_log_impl(&dword_1830D4000, v78, v89, "%{public}s called with null resolver, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v83);
          goto LABEL_124;
        }
        if (v84)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_resolver_set_alternative_handler";
          _os_log_impl(&dword_1830D4000, v78, v89, "%{public}s called with null resolver, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v78 = __nwlog_obj();
        os_log_type_t v86 = type[0];
        if (os_log_type_enabled(v78, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_resolver_set_alternative_handler";
          _os_log_impl(&dword_1830D4000, v78, v86, "%{public}s called with null resolver, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_124:
    if (v77) {
      free(v77);
    }
    goto LABEL_66;
  }
LABEL_72:
}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    BOOL v26 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
    char v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39)) {
      goto LABEL_37;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      char v15 = __nwlog_obj();
      os_log_type_t v27 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v27, "%{public}s called with null handler", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v39)
    {
      char v15 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v35, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    char v15 = __nwlog_obj();
    os_log_type_t v31 = type;
    BOOL v32 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      BOOL v44 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v15, v31, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_60:

    free(backtrace_string);
    goto LABEL_37;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    if (v9 > 5) {
      os_log_type_t v13 = "unknown-mode";
    }
    else {
      os_log_type_t v13 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446722;
    v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
    __int16 v43 = 2082;
    BOOL v44 = (void *)v13;
    __int16 v45 = 2082;
    id v46 = "resolver";
    char v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault(v14, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v15 = (id)gLogObj;
        os_log_type_t v16 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5) {
            nw_endpoint_t v17 = "unknown-mode";
          }
          else {
            nw_endpoint_t v17 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          BOOL v44 = (void *)v17;
          __int16 v45 = 2082;
          id v46 = "resolver";
          _os_log_impl(&dword_1830D4000, v15, v16, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v39)
      {
        id v18 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v15 = (id)gLogObj;
        os_log_type_t v19 = type;
        BOOL v20 = os_log_type_enabled(v15, type);
        if (v18)
        {
          if (v20)
          {
            if (v9 > 5) {
              uint64_t v21 = "unknown-mode";
            }
            else {
              uint64_t v21 = off_1E523FB08[v9];
            }
            *(_DWORD *)buf = 136446978;
            v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
            __int16 v43 = 2082;
            BOOL v44 = (void *)v21;
            __int16 v45 = 2082;
            id v46 = "resolver";
            __int16 v47 = 2082;
            v48 = v18;
            _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v18);
          if (!v14) {
            goto LABEL_39;
          }
          goto LABEL_38;
        }
        if (v20)
        {
          if (v9 > 5) {
            v24 = "unknown-mode";
          }
          else {
            v24 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          BOOL v44 = (void *)v24;
          __int16 v45 = 2082;
          id v46 = "resolver";
          _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v15 = (id)gLogObj;
        os_log_type_t v22 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5) {
            id v23 = "unknown-mode";
          }
          else {
            id v23 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          BOOL v44 = (void *)v23;
          __int16 v45 = 2082;
          id v46 = "resolver";
          _os_log_impl(&dword_1830D4000, v15, v22, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_36;
    }
LABEL_37:
    if (!v14)
    {
LABEL_39:
      BOOL v11 = 1;
      goto LABEL_40;
    }
LABEL_38:
    free(v14);
    goto LABEL_39;
  }
  if (!v7)
  {
    os_log_type_t v28 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
    char v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39)) {
      goto LABEL_37;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      char v15 = __nwlog_obj();
      os_log_type_t v29 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v29, "%{public}s called with null applyBlock", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v39)
    {
      char v15 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v36, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    char v15 = __nwlog_obj();
    os_log_type_t v33 = type;
    BOOL v34 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      BOOL v44 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v15, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_60;
  }
  child_endpoint_handlers = self->child_endpoint_handlers;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __63__NWConcrete_nw_endpoint_resolver_applyWithHandler_toChildren___block_invoke;
  v37[3] = &unk_1E524AE90;
  id v38 = v7;
  BOOL v11 = nw_array_apply((atomic_uchar *)child_endpoint_handlers, (uint64_t)v37);

LABEL_40:
  return v11;
}

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    BOOL v20 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (__nwlog_fault(v9, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v10 = __nwlog_obj();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_1830D4000, v10, v21, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (!v26)
      {
        v10 = __nwlog_obj();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_1830D4000, v10, v25, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_35;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v10 = __nwlog_obj();
      os_log_type_t v23 = type;
      BOOL v24 = os_log_type_enabled(v10, type);
      if (!backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_1830D4000, v10, v23, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
        __int16 v30 = 2082;
        os_log_type_t v31 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v10, v23, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_36:
    if (!v9) {
      goto LABEL_38;
    }
LABEL_37:
    free(v9);
    goto LABEL_38;
  }
  v5 = (NWConcrete_nw_endpoint_handler *)v3;
  uint64_t mode = v5->mode;

  if (mode == 1)
  {
    nw_endpoint_resolver_update_path_resolver_locked(v5);
    goto LABEL_38;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v7 = (id)gLogObj;
  if (mode > 5) {
    v8 = "unknown-mode";
  }
  else {
    v8 = off_1E523FB08[mode];
  }
  *(_DWORD *)buf = 136446722;
  os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
  __int16 v30 = 2082;
  os_log_type_t v31 = (void *)v8;
  __int16 v32 = 2082;
  os_log_type_t v33 = "resolver";
  uint64_t v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v26 = 0;
  if (!__nwlog_fault(v9, &type, &v26)) {
    goto LABEL_36;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    os_log_type_t v11 = type;
    if (os_log_type_enabled(v10, type))
    {
      if (mode > 5) {
        id v12 = "unknown-mode";
      }
      else {
        id v12 = off_1E523FB08[mode];
      }
      *(_DWORD *)buf = 136446722;
      os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
      __int16 v30 = 2082;
      os_log_type_t v31 = (void *)v12;
      __int16 v32 = 2082;
      os_log_type_t v33 = "resolver";
      _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_35:

    goto LABEL_36;
  }
  if (!v26)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    os_log_type_t v17 = type;
    if (os_log_type_enabled(v10, type))
    {
      if (mode > 5) {
        id v18 = "unknown-mode";
      }
      else {
        id v18 = off_1E523FB08[mode];
      }
      *(_DWORD *)buf = 136446722;
      os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
      __int16 v30 = 2082;
      os_log_type_t v31 = (void *)v18;
      __int16 v32 = 2082;
      os_log_type_t v33 = "resolver";
      _os_log_impl(&dword_1830D4000, v10, v17, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_35;
  }
  os_log_type_t v13 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v10 = (id)gLogObj;
  os_log_type_t v14 = type;
  BOOL v15 = os_log_type_enabled(v10, type);
  if (!v13)
  {
    if (v15)
    {
      if (mode > 5) {
        os_log_type_t v19 = "unknown-mode";
      }
      else {
        os_log_type_t v19 = off_1E523FB08[mode];
      }
      *(_DWORD *)buf = 136446722;
      os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
      __int16 v30 = 2082;
      os_log_type_t v31 = (void *)v19;
      __int16 v32 = 2082;
      os_log_type_t v33 = "resolver";
      _os_log_impl(&dword_1830D4000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_35;
  }
  if (v15)
  {
    if (mode > 5) {
      os_log_type_t v16 = "unknown-mode";
    }
    else {
      os_log_type_t v16 = off_1E523FB08[mode];
    }
    *(_DWORD *)buf = 136446978;
    os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
    __int16 v30 = 2082;
    os_log_type_t v31 = (void *)v16;
    __int16 v32 = 2082;
    os_log_type_t v33 = "resolver";
    __int16 v34 = 2082;
    os_log_type_t v35 = v13;
    _os_log_impl(&dword_1830D4000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v13);
  if (v9) {
    goto LABEL_37;
  }
LABEL_38:
}

@end