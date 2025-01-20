@interface NWConcrete_nw_endpoint_proxy
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_proxy)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_proxy

- (NWConcrete_nw_endpoint_proxy)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_endpoint_proxy;
  v2 = [(NWConcrete_nw_endpoint_proxy *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
          v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->child_error, 0);
  objc_storeStrong((id *)&self->pac_resolvers, 0);
  objc_storeStrong((id *)&self->parsed_proxy_configs, 0);
  objc_storeStrong((id *)&self->path_proxy_configs, 0);
  objc_storeStrong((id *)&self->custom_proxy_configs, 0);
  objc_storeStrong((id *)&self->connected_child, 0);
  objc_storeStrong((id *)&self->failed_child_endpoint_handlers, 0);

  objc_storeStrong((id *)&self->child_endpoint_handlers, 0);
}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v26 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
    char v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39)) {
      goto LABEL_37;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v15 = __nwlog_obj();
      os_log_type_t v27 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v27, "%{public}s called with null handler", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v39)
    {
      v15 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v35, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    v15 = __nwlog_obj();
    os_log_type_t v31 = type;
    BOOL v32 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v15, v31, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_60:

    free(backtrace_string);
    goto LABEL_37;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 != 3)
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
    v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
    __int16 v43 = 2082;
    v44 = (void *)v13;
    __int16 v45 = 2082;
    v46 = "proxy";
    char v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault(v14, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        os_log_type_t v16 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5) {
            v17 = "unknown-mode";
          }
          else {
            v17 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          v44 = (void *)v17;
          __int16 v45 = 2082;
          v46 = "proxy";
          _os_log_impl(&dword_1830D4000, v15, v16, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v39)
      {
        v18 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
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
            v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
            __int16 v43 = 2082;
            v44 = (void *)v21;
            __int16 v45 = 2082;
            v46 = "proxy";
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
          v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          v44 = (void *)v24;
          __int16 v45 = 2082;
          v46 = "proxy";
          _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        os_log_type_t v22 = type;
        if (os_log_type_enabled(v15, type))
        {
          if (v9 > 5) {
            v23 = "unknown-mode";
          }
          else {
            v23 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          v44 = (void *)v23;
          __int16 v45 = 2082;
          v46 = "proxy";
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
    v28 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
    char v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (!__nwlog_fault(v14, &type, &v39)) {
      goto LABEL_37;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v15 = __nwlog_obj();
      os_log_type_t v29 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v29, "%{public}s called with null applyBlock", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v39)
    {
      v15 = __nwlog_obj();
      os_log_type_t v36 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v36, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    v15 = __nwlog_obj();
    os_log_type_t v33 = type;
    BOOL v34 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v15, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_60;
  }
  child_endpoint_handlers = self->child_endpoint_handlers;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__NWConcrete_nw_endpoint_proxy_applyWithHandler_toChildren___block_invoke;
  v37[3] = &unk_1E524AE90;
  id v38 = v7;
  BOOL v11 = nw_array_apply((atomic_uchar *)child_endpoint_handlers, (uint64_t)v37);

LABEL_40:
  return v11;
}

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v75 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
    os_log_type_t v22 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v110 = 0;
    if (!__nwlog_fault(v22, type, &v110)) {
      goto LABEL_85;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v23 = __nwlog_obj();
      os_log_type_t v76 = type[0];
      if (os_log_type_enabled(v23, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v23, v76, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v110)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v23 = __nwlog_obj();
      os_log_type_t v78 = type[0];
      BOOL v79 = os_log_type_enabled(v23, type[0]);
      if (backtrace_string)
      {
        if (v79)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v23, v78, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_85;
      }
      if (v79)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v23, v78, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v23 = __nwlog_obj();
      os_log_type_t v87 = type[0];
      if (os_log_type_enabled(v23, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v23, v87, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_84:

    goto LABEL_85;
  }
  id v6 = (unsigned int *)v4;
  uint64_t v7 = v6[29];

  if (v7 != 3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v20 = (id)gLogObj;
    if (v7 > 5) {
      uint64_t v21 = "unknown-mode";
    }
    else {
      uint64_t v21 = off_1E523FB08[v7];
    }
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2082;
    v116 = "proxy";
    os_log_type_t v22 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v110 = 0;
    if (__nwlog_fault(v22, type, &v110))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        os_log_type_t v24 = type[0];
        if (os_log_type_enabled(v23, type[0]))
        {
          if (v7 > 5) {
            v25 = "unknown-mode";
          }
          else {
            v25 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2082;
          v116 = "proxy";
          _os_log_impl(&dword_1830D4000, v23, v24, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v110)
      {
        char v39 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        os_log_type_t v40 = type[0];
        BOOL v41 = os_log_type_enabled(v23, type[0]);
        if (v39)
        {
          if (v41)
          {
            if (v7 > 5) {
              v42 = "unknown-mode";
            }
            else {
              v42 = off_1E523FB08[v7];
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v42;
            *(_WORD *)&buf[22] = 2082;
            v116 = "proxy";
            *(_WORD *)v117 = 2082;
            *(void *)&v117[2] = v39;
            _os_log_impl(&dword_1830D4000, v23, v40, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v39);
          if (!v22) {
            goto LABEL_87;
          }
LABEL_86:
          free(v22);
          goto LABEL_87;
        }
        if (v41)
        {
          if (v7 > 5) {
            uint64_t v49 = "unknown-mode";
          }
          else {
            uint64_t v49 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v49;
          *(_WORD *)&buf[22] = 2082;
          v116 = "proxy";
          _os_log_impl(&dword_1830D4000, v23, v40, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        os_log_type_t v43 = type[0];
        if (os_log_type_enabled(v23, type[0]))
        {
          if (v7 > 5) {
            v44 = "unknown-mode";
          }
          else {
            v44 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v44;
          *(_WORD *)&buf[22] = 2082;
          v116 = "proxy";
          _os_log_impl(&dword_1830D4000, v23, v43, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_84;
    }
LABEL_85:
    if (!v22) {
      goto LABEL_87;
    }
    goto LABEL_86;
  }
  v8 = v6;
  uint64_t v9 = (os_unfair_lock_s *)(v8 + 28);
  os_unfair_lock_lock((os_unfair_lock_t)v8 + 28);
  id v10 = *((id *)v8 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 28);

  BOOL should_use_proxy = nw_endpoint_proxy_unsatisfied_handler_should_use_proxy(v10);
  if (!should_use_proxy)
  {
    if (nw_endpoint_handler_get_minimize_logging(v8))
    {
      if (nw_endpoint_handler_get_logging_disabled(v8)) {
        goto LABEL_70;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v28 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(v8);
        v81 = nw_endpoint_handler_dry_run_string(v8);
        nw_endpoint_t v82 = nw_endpoint_handler_copy_endpoint(v8);
        logging_description = nw_endpoint_get_logging_description(v82);
        v84 = nw_endpoint_handler_state_string(v8);
        v85 = nw_endpoint_handler_mode_string(v8);
        id v86 = nw_endpoint_handler_copy_current_path(v8);
        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = id_string;
        *(_WORD *)&buf[22] = 2082;
        v116 = v81;
        *(_WORD *)v117 = 2082;
        *(void *)&v117[2] = logging_description;
        *(_WORD *)&v117[10] = 2082;
        *(void *)&v117[12] = v84;
        __int16 v118 = 2082;
        v119 = v85;
        __int16 v120 = 2114;
        id v121 = v86;
        _os_log_impl(&dword_1830D4000, v28, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to disallowed proxy settings", buf, 0x48u);
      }
    }
    else
    {
      v26 = v8;
      char v27 = *((unsigned char *)v26 + 268);

      if ((v27 & 0x20) != 0)
      {
LABEL_70:
        nw_endpoint_handler_reset_mode(v8, 1);
        goto LABEL_87;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v28 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v29 = v26;

        v30 = v29;
        char v31 = *((unsigned char *)v26 + 268);

        if (v31) {
          BOOL v32 = "dry-run ";
        }
        else {
          BOOL v32 = "";
        }
        nw_endpoint_t v33 = nw_endpoint_handler_copy_endpoint(v30);
        v107 = nw_endpoint_get_logging_description(v33);
        os_log_t log = (os_log_t)v32;
        BOOL v34 = v29 + 168;
        os_log_type_t v35 = v30;
        os_log_type_t v36 = v35;
        uint64_t v37 = v35[30];
        if (v37 > 5) {
          id v38 = "unknown-state";
        }
        else {
          id v38 = off_1E523FB38[v37];
        }

        __int16 v45 = v36;
        v46 = v45;
        unsigned int v47 = v6[29];
        v48 = "path";
        switch(v47)
        {
          case 0u:
            break;
          case 1u:
            v48 = "resolver";
            break;
          case 2u:
            v48 = nw_endpoint_flow_mode_string(v45[31]);
            break;
          case 3u:
            v48 = "proxy";
            break;
          case 4u:
            v48 = "fallback";
            break;
          case 5u:
            v48 = "transform";
            break;
          default:
            v48 = "unknown-mode";
            break;
        }

        v61 = v46;
        os_unfair_lock_lock(v9);
        id v62 = *((id *)v8 + 8);
        os_unfair_lock_unlock(v9);

        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2082;
        v116 = (const char *)log;
        *(_WORD *)v117 = 2082;
        *(void *)&v117[2] = v107;
        *(_WORD *)&v117[10] = 2082;
        *(void *)&v117[12] = v38;
        __int16 v118 = 2082;
        v119 = v48;
        __int16 v120 = 2114;
        id v121 = v62;
        _os_log_impl(&dword_1830D4000, v28, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to disallowed proxy settings", buf, 0x48u);
      }
    }

    goto LABEL_70;
  }
  if ((*((unsigned char *)self + 97) & 8) == 0 && (*((unsigned char *)self + 97) & 0x20) == 0 && !self->connected_child)
  {
    id v12 = v8;
    os_unfair_lock_lock(v9);
    id v13 = *((id *)v8 + 8);
    os_unfair_lock_unlock(v9);

    id v14 = nw_path_copy_proxy_configs(v13);
    if (v14)
    {
      v15 = self->path_proxy_configs;
      os_log_type_t v16 = (OS_nw_array *)v14;
      v17 = v16;
      if (v15 == v16)
      {

        goto LABEL_81;
      }
      if (!v15 || v15[3].super.super.isa - v15[2].super.super.isa != v16[3].super.super.isa - v16[2].super.super.isa)
      {

        goto LABEL_72;
      }
      *(void *)os_log_type_t type = 0;
      v112 = type;
      uint64_t v113 = 0x2020000000;
      char v114 = 1;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL35nw_endpoint_proxy_configs_are_equalPU22objcproto11OS_nw_array8NSObjectS1__block_invoke;
      v116 = (const char *)&unk_1E524A2E8;
      v18 = v16;
      *(void *)v117 = v18;
      *(void *)&v117[8] = type;
      nw_array_apply((atomic_uchar *)v15, (uint64_t)buf);
      BOOL v19 = *((unsigned char *)v112 + 24) == 0;

      _Block_object_dispose(type, 8);
      if (v19)
      {
LABEL_72:
        v63 = v12;
        v63[66] = 0;

        v63[20] = 393220;
        nw_endpoint_handler_report(v63, 0, (_WORD *)v63 + 40, 0);
        int minimize_logging = nw_endpoint_handler_get_minimize_logging(v63);
        char logging_disabled = nw_endpoint_handler_get_logging_disabled(v63);
        if (minimize_logging)
        {
          if (logging_disabled) {
            goto LABEL_79;
          }
          id v109 = v14;
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v94 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            logd = nw_endpoint_handler_get_id_string(v63);
            v101 = nw_endpoint_handler_dry_run_string(v63);
            nw_endpoint_t v95 = nw_endpoint_handler_copy_endpoint(v63);
            v96 = nw_endpoint_get_logging_description(v95);
            v97 = nw_endpoint_handler_state_string(v63);
            v98 = nw_endpoint_handler_mode_string(v63);
            id v99 = nw_endpoint_handler_copy_current_path(v63);
            *(_DWORD *)buf = 136447746;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = logd;
            *(_WORD *)&buf[22] = 2082;
            v116 = v101;
            *(_WORD *)v117 = 2082;
            *(void *)&v117[2] = v96;
            *(_WORD *)&v117[10] = 2082;
            *(void *)&v117[12] = v97;
            __int16 v118 = 2082;
            v119 = v98;
            __int16 v120 = 2114;
            id v121 = v99;
            v66 = v94;
            _os_log_impl(&dword_1830D4000, v94, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] restarting due to changing proxy settings", buf, 0x48u);

            id v14 = v109;
          }
          else
          {
            v66 = v94;
          }
        }
        else
        {
          if (logging_disabled)
          {
LABEL_79:
            v74 = v63;
            v74[30] = 1;

            [(NWConcrete_nw_endpoint_proxy *)self cancelWithHandler:v74 forced:1];
            [(NWConcrete_nw_endpoint_proxy *)self startWithHandler:v74];
            goto LABEL_81;
          }
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v66 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            v67 = nw_endpoint_handler_get_id_string(v63);
            v68 = nw_endpoint_handler_dry_run_string(v63);
            logb = v66;
            id v108 = v14;
            v69 = v67;
            nw_endpoint_t v100 = nw_endpoint_handler_copy_endpoint(v63);
            v70 = nw_endpoint_get_logging_description(v100);
            v71 = nw_endpoint_handler_state_string(v63);
            v72 = nw_endpoint_handler_mode_string(v63);
            id v73 = nw_endpoint_handler_copy_current_path(v63);
            *(_DWORD *)buf = 136447746;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v69;
            *(_WORD *)&buf[22] = 2082;
            v116 = v68;
            *(_WORD *)v117 = 2082;
            *(void *)&v117[2] = v70;
            *(_WORD *)&v117[10] = 2082;
            *(void *)&v117[12] = v71;
            __int16 v118 = 2082;
            v119 = v72;
            __int16 v120 = 2114;
            id v121 = v73;
            v66 = logb;
            _os_log_impl(&dword_1830D4000, logb, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] restarting due to changing proxy settings", buf, 0x48u);

            id v14 = v108;
          }
        }

        goto LABEL_79;
      }
LABEL_81:

      goto LABEL_87;
    }
    v50 = v12;
    v50[66] = 1;

    v50[20] = 393220;
    nw_endpoint_handler_report(v50, 0, (_WORD *)v50 + 40, 0);
    if (nw_endpoint_handler_get_minimize_logging(v50))
    {
      if (nw_endpoint_handler_get_logging_disabled(v50)) {
        goto LABEL_59;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v53 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        v88 = nw_endpoint_handler_get_id_string(v50);
        logc = nw_endpoint_handler_dry_run_string(v50);
        nw_endpoint_t v89 = nw_endpoint_handler_copy_endpoint(v50);
        v90 = nw_endpoint_get_logging_description(v89);
        v91 = nw_endpoint_handler_state_string(v50);
        v92 = nw_endpoint_handler_mode_string(v50);
        id v93 = nw_endpoint_handler_copy_current_path(v50);
        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v88;
        *(_WORD *)&buf[22] = 2082;
        v116 = logc;
        *(_WORD *)v117 = 2082;
        *(void *)&v117[2] = v90;
        *(_WORD *)&v117[10] = 2082;
        *(void *)&v117[12] = v91;
        __int16 v118 = 2082;
        v119 = v92;
        __int16 v120 = 2114;
        id v121 = v93;
        _os_log_impl(&dword_1830D4000, v53, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to losing proxy settings", buf, 0x48u);

        id v14 = 0;
      }
    }
    else
    {
      v51 = v50;
      char v52 = *((unsigned char *)v51 + 268);

      if ((v52 & 0x20) != 0)
      {
LABEL_59:
        nw_endpoint_handler_reset_mode(v50, 1);
        goto LABEL_81;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v53 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = nw_endpoint_handler_get_id_string(v51);
        v55 = nw_endpoint_handler_dry_run_string(v51);
        loga = v53;
        nw_endpoint_t v56 = nw_endpoint_handler_copy_endpoint(v51);
        v57 = nw_endpoint_get_logging_description(v56);
        v58 = nw_endpoint_handler_state_string(v51);
        v59 = nw_endpoint_handler_mode_string(v51);
        id v60 = nw_endpoint_handler_copy_current_path(v51);
        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2082;
        v116 = v55;
        *(_WORD *)v117 = 2082;
        *(void *)&v117[2] = v57;
        *(_WORD *)&v117[10] = 2082;
        *(void *)&v117[12] = v58;
        __int16 v118 = 2082;
        v119 = v59;
        __int16 v120 = 2114;
        id v121 = v60;
        v53 = loga;
        _os_log_impl(&dword_1830D4000, loga, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] resetting due to losing proxy settings", buf, 0x48u);

        id v14 = 0;
      }
    }

    goto LABEL_59;
  }
LABEL_87:
}

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    v51 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
    v25 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v62 = 0;
    if (__nwlog_fault(v25, &type, &v62))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v26 = __nwlog_obj();
        os_log_type_t v52 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)buf = 136446210;
          v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v26, v52, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_57;
      }
      if (!v62)
      {
        v26 = __nwlog_obj();
        os_log_type_t v56 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)buf = 136446210;
          v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v26, v56, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_57;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v26 = __nwlog_obj();
      os_log_type_t v54 = type;
      BOOL v55 = os_log_type_enabled(v26, type);
      if (!backtrace_string)
      {
        if (v55)
        {
          *(_DWORD *)buf = 136446210;
          v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v26, v54, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_57;
      }
      if (v55)
      {
        *(_DWORD *)buf = 136446466;
        v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
        __int16 v66 = 2082;
        v67 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v26, v54, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_58:
    if (!v25) {
      goto LABEL_60;
    }
LABEL_59:
    free(v25);
    goto LABEL_60;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 == 3)
  {
    id v10 = v8;
    char v11 = *((unsigned char *)v10 + 268);

    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      id v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v59 = v7;
        id v13 = v10;

        id v14 = v13;
        char v15 = *((unsigned char *)v10 + 268);

        if (v15) {
          os_log_type_t v16 = "dry-run ";
        }
        else {
          os_log_type_t v16 = "";
        }
        nw_endpoint_t v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        v58 = (char *)(v13 + 42);
        BOOL v19 = v14;
        id v20 = v19;
        uint64_t v21 = v19[30];
        if (v21 > 5) {
          os_log_type_t v22 = "unknown-state";
        }
        else {
          os_log_type_t v22 = off_1E523FB38[v21];
        }
        v57 = v22;

        nw_endpoint_t v33 = v20;
        BOOL v34 = v33;
        unsigned int v35 = v8[29];
        os_log_type_t v36 = "path";
        switch(v35)
        {
          case 0u:
            break;
          case 1u:
            os_log_type_t v36 = "resolver";
            break;
          case 2u:
            os_log_type_t v36 = nw_endpoint_flow_mode_string(v33[31]);
            break;
          case 3u:
            os_log_type_t v36 = "proxy";
            break;
          case 4u:
            os_log_type_t v36 = "fallback";
            break;
          case 5u:
            os_log_type_t v36 = "transform";
            break;
          default:
            os_log_type_t v36 = "unknown-mode";
            break;
        }

        os_log_type_t v40 = v34;
        os_unfair_lock_lock((os_unfair_lock_t)v40 + 28);
        id v41 = v40[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v40 + 28);

        *(_DWORD *)buf = 136447746;
        v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
        __int16 v66 = 2082;
        v67 = v58;
        __int16 v68 = 2082;
        v69 = v16;
        __int16 v70 = 2082;
        v71 = (void *)logging_description;
        __int16 v72 = 2082;
        id v73 = v57;
        __int16 v74 = 2082;
        v75 = v36;
        __int16 v76 = 2114;
        id v77 = v41;
        _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

        uint64_t v7 = v59;
      }
    }
    child_endpoint_handlers = self->child_endpoint_handlers;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __57__NWConcrete_nw_endpoint_proxy_cancelWithHandler_forced___block_invoke;
    v60[3] = &__block_descriptor_33_e35_B24__0Q8__NSObject_OS_nw_object__16l;
    BOOL v61 = a4;
    nw_array_apply((atomic_uchar *)child_endpoint_handlers, (uint64_t)v60);
    os_log_type_t v43 = self->child_endpoint_handlers;
    self->child_endpoint_handlers = 0;

    failed_child_endpoint_handlers = self->failed_child_endpoint_handlers;
    self->failed_child_endpoint_handlers = 0;

    pac_resolvers = self->pac_resolvers;
    self->pac_resolvers = 0;

    custom_proxy_configs = self->custom_proxy_configs;
    self->custom_proxy_configs = 0;

    path_proxy_configs = self->path_proxy_configs;
    self->path_proxy_configs = 0;

    parsed_proxy_configs = self->parsed_proxy_configs;
    self->parsed_proxy_configs = 0;

    url = self->url;
    if (url)
    {
      CFRelease(url);
      self->url = 0;
    }
    child_timer = self->child_timer;
    if (child_timer)
    {
      nw_queue_cancel_source((uint64_t)child_timer);
      self->child_timer = 0;
    }
    goto LABEL_60;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v23 = (id)gLogObj;
  if (v9 > 5) {
    os_log_type_t v24 = "unknown-mode";
  }
  else {
    os_log_type_t v24 = off_1E523FB08[v9];
  }
  *(_DWORD *)buf = 136446722;
  v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
  __int16 v66 = 2082;
  v67 = (void *)v24;
  __int16 v68 = 2082;
  v69 = "proxy";
  v25 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v62 = 0;
  if (!__nwlog_fault(v25, &type, &v62)) {
    goto LABEL_58;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v26 = (id)gLogObj;
    os_log_type_t v27 = type;
    if (os_log_type_enabled(v26, type))
    {
      if (v9 > 5) {
        v28 = "unknown-mode";
      }
      else {
        v28 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
      __int16 v66 = 2082;
      v67 = (void *)v28;
      __int16 v68 = 2082;
      v69 = "proxy";
      _os_log_impl(&dword_1830D4000, v26, v27, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_57:

    goto LABEL_58;
  }
  if (!v62)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v26 = (id)gLogObj;
    os_log_type_t v37 = type;
    if (os_log_type_enabled(v26, type))
    {
      if (v9 > 5) {
        id v38 = "unknown-mode";
      }
      else {
        id v38 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
      __int16 v66 = 2082;
      v67 = (void *)v38;
      __int16 v68 = 2082;
      v69 = "proxy";
      _os_log_impl(&dword_1830D4000, v26, v37, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_57;
  }
  os_log_type_t v29 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v26 = (id)gLogObj;
  os_log_type_t v30 = type;
  BOOL v31 = os_log_type_enabled(v26, type);
  if (!v29)
  {
    if (v31)
    {
      if (v9 > 5) {
        char v39 = "unknown-mode";
      }
      else {
        char v39 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
      __int16 v66 = 2082;
      v67 = (void *)v39;
      __int16 v68 = 2082;
      v69 = "proxy";
      _os_log_impl(&dword_1830D4000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_57;
  }
  if (v31)
  {
    if (v9 > 5) {
      BOOL v32 = "unknown-mode";
    }
    else {
      BOOL v32 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446978;
    v65 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
    __int16 v66 = 2082;
    v67 = (void *)v32;
    __int16 v68 = 2082;
    v69 = "proxy";
    __int16 v70 = 2082;
    v71 = v29;
    _os_log_impl(&dword_1830D4000, v26, v30, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v29);
  if (v25) {
    goto LABEL_59;
  }
LABEL_60:
}

- (void)startWithHandler:(id)a3
{
  uint64_t v289 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v201 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
    v202 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v261) = 0;
    if (__nwlog_fault(v202, type, &v261))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v203 = __nwlog_obj();
        os_log_type_t v204 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v203, v204, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if ((_BYTE)v261)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v203 = __nwlog_obj();
        os_log_type_t v206 = type[0];
        BOOL v207 = os_log_type_enabled(v203, type[0]);
        if (backtrace_string)
        {
          if (v207)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v203, v206, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_253;
        }
        if (v207)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v203, v206, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v203 = __nwlog_obj();
        os_log_type_t v212 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v203, v212, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_253:
    if (v202) {
      free(v202);
    }
    v5 = 0;
    goto LABEL_231;
  }
  id v6 = (unsigned int *)v4;
  uint64_t v7 = v6[29];

  if (v7 != 3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v24 = (id)gLogObj;
    v25 = v5;
    if (v7 > 5) {
      v26 = "unknown-mode";
    }
    else {
      v26 = off_1E523FB08[v7];
    }
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2082;
    v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
    os_log_type_t v27 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v261) = 0;
    if (__nwlog_fault(v27, type, &v261))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v28 = (id)gLogObj;
        os_log_type_t v29 = type[0];
        if (os_log_type_enabled(v28, type[0]))
        {
          if (v7 > 5) {
            os_log_type_t v30 = "unknown-mode";
          }
          else {
            os_log_type_t v30 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2082;
          v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
          _os_log_impl(&dword_1830D4000, v28, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if ((_BYTE)v261)
      {
        BOOL v31 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v28 = (id)gLogObj;
        os_log_type_t v32 = type[0];
        BOOL v33 = os_log_type_enabled(v28, type[0]);
        if (v31)
        {
          if (v33)
          {
            if (v7 > 5) {
              BOOL v34 = "unknown-mode";
            }
            else {
              BOOL v34 = off_1E523FB08[v7];
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2082;
            v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
            *(_WORD *)v281 = 2082;
            *(void *)&v281[2] = v31;
            _os_log_impl(&dword_1830D4000, v28, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v31);
          if (!v27) {
            goto LABEL_111;
          }
          goto LABEL_110;
        }
        if (v33)
        {
          if (v7 > 5) {
            os_log_type_t v40 = "unknown-mode";
          }
          else {
            os_log_type_t v40 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v40;
          *(_WORD *)&buf[22] = 2082;
          v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
          _os_log_impl(&dword_1830D4000, v28, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v28 = (id)gLogObj;
        os_log_type_t v35 = type[0];
        if (os_log_type_enabled(v28, type[0]))
        {
          if (v7 > 5) {
            os_log_type_t v36 = "unknown-mode";
          }
          else {
            os_log_type_t v36 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2082;
          v280 = (uint64_t (*)(uint64_t, uint64_t))"proxy";
          _os_log_impl(&dword_1830D4000, v28, v35, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
    }
    if (!v27)
    {
LABEL_111:
      v5 = v25;
      goto LABEL_231;
    }
LABEL_110:
    free(v27);
    goto LABEL_111;
  }
  v8 = v6;
  unsigned int v9 = v8[30];

  if (v9 == 1)
  {
    v231 = v5;
    v232 = v6;
    v239 = v8;
    id v10 = v8;
    char v11 = *((unsigned char *)v10 + 268);
    v250 = v10;

    object = self;
    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      id v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = v250;

        id v14 = v13;
        char v15 = *((unsigned char *)v250 + 268);

        if (v15) {
          os_log_type_t v16 = "dry-run ";
        }
        else {
          os_log_type_t v16 = "";
        }
        nw_endpoint_t v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        BOOL v19 = v13 + 168;
        id v20 = v14;
        uint64_t v21 = v20;
        uint64_t v22 = v239[30];
        if (v22 > 5) {
          id v23 = "unknown-state";
        }
        else {
          id v23 = off_1E523FB38[v22];
        }

        os_log_type_t v37 = v21;
        id v38 = v37;
        char v39 = "path";
        switch(v232[29])
        {
          case 0u:
            break;
          case 1u:
            char v39 = "resolver";
            break;
          case 2u:
            char v39 = nw_endpoint_flow_mode_string(v37[31]);
            break;
          case 3u:
            char v39 = "proxy";
            break;
          case 4u:
            char v39 = "fallback";
            break;
          case 5u:
            char v39 = "transform";
            break;
          default:
            char v39 = "unknown-mode";
            break;
        }

        id v41 = v38;
        os_unfair_lock_lock((os_unfair_lock_t)v41 + 28);
        id v42 = v41[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v41 + 28);

        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2082;
        v280 = (uint64_t (*)(uint64_t, uint64_t))v16;
        *(_WORD *)v281 = 2082;
        *(void *)&v281[2] = logging_description;
        *(_WORD *)&v281[10] = 2082;
        *(void *)&v281[12] = v23;
        *(_WORD *)&v281[20] = 2082;
        *(void *)&v281[22] = v39;
        *(_WORD *)&v281[30] = 2114;
        id v282 = v42;
        _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);
      }
      self = object;
    }
    custom_proxy_configs = self->custom_proxy_configs;
    self->custom_proxy_configs = 0;

    path_proxy_configs = object->path_proxy_configs;
    object->path_proxy_configs = 0;

    *((unsigned char *)object + 96) &= 0xC6u;
    __int16 v45 = nw_endpoint_handler_copy_endpoint(v250);
    v229 = v45;
    if (nw_endpoint_get_type(v45) == nw_endpoint_type_host)
    {
      v46 = v250;
      os_unfair_lock_lock((os_unfair_lock_t)v46 + 28);
      unsigned int v47 = (NWConcrete_nw_path *)*((id *)v46 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)v46 + 28);

      *(_DWORD *)os_log_type_t type = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      if (nw_path_get_vpn_config_uuid(v47, (unsigned __int8 (*)[16])buf, (int *)type, 1, 1))
      {
        type[0] = OS_LOG_TYPE_DEFAULT;
        int v48 = nw_path_voluntary_agent_matches_address(v47, (uint64_t)&xmmword_183E23448);
        int v49 = type[0] ? v48 : 0;
        if (v49 == 1 && nw_endpoint_handler_trigger_agents(v46, 1))
        {
          int minimize_logging = nw_endpoint_handler_get_minimize_logging(v46);
          char logging_disabled = nw_endpoint_handler_get_logging_disabled(v46);
          if (minimize_logging)
          {
            if (logging_disabled) {
              goto LABEL_66;
            }
            if (__nwlog_connection_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
            }
            os_log_type_t v52 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              id_string = nw_endpoint_handler_get_id_string(v46);
              v218 = nw_endpoint_handler_dry_run_string(v46);
              nw_endpoint_t v219 = nw_endpoint_handler_copy_endpoint(v46);
              v220 = nw_endpoint_get_logging_description(v219);
              v221 = nw_endpoint_handler_state_string(v46);
              v222 = nw_endpoint_handler_mode_string(v46);
              id v223 = nw_endpoint_handler_copy_current_path(v46);
              *(_DWORD *)buf = 136447746;
              *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = id_string;
              *(_WORD *)&buf[22] = 2082;
              v280 = (uint64_t (*)(uint64_t, uint64_t))v218;
              *(_WORD *)v281 = 2082;
              *(void *)&v281[2] = v220;
              *(_WORD *)&v281[10] = 2082;
              *(void *)&v281[12] = v221;
              *(_WORD *)&v281[20] = 2082;
              *(void *)&v281[22] = v222;
              *(_WORD *)&v281[30] = 2114;
              id v282 = v223;
              _os_log_impl(&dword_1830D4000, v52, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] proxy requires agent trigger before attempting to connect", buf, 0x48u);
            }
          }
          else
          {
            if (logging_disabled)
            {
LABEL_66:
              nw_endpoint_handler_reset_mode(v46, 0);

LABEL_230:
              v5 = v231;
              goto LABEL_231;
            }
            if (__nwlog_connection_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
            }
            os_log_type_t v52 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              v53 = nw_endpoint_handler_get_id_string(v46);
              os_log_type_t v54 = nw_endpoint_handler_dry_run_string(v46);
              nw_endpoint_t v55 = nw_endpoint_handler_copy_endpoint(v46);
              os_log_type_t v56 = nw_endpoint_get_logging_description(v55);
              v57 = nw_endpoint_handler_state_string(v46);
              v58 = nw_endpoint_handler_mode_string(v46);
              id v59 = nw_endpoint_handler_copy_current_path(v46);
              *(_DWORD *)buf = 136447746;
              *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v53;
              *(_WORD *)&buf[22] = 2082;
              v280 = (uint64_t (*)(uint64_t, uint64_t))v54;
              *(_WORD *)v281 = 2082;
              *(void *)&v281[2] = v56;
              *(_WORD *)&v281[10] = 2082;
              *(void *)&v281[12] = v57;
              *(_WORD *)&v281[20] = 2082;
              *(void *)&v281[22] = v58;
              *(_WORD *)&v281[30] = 2114;
              id v282 = v59;
              _os_log_impl(&dword_1830D4000, v52, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] proxy requires agent trigger before attempting to connect", buf, 0x48u);
            }
          }

          goto LABEL_66;
        }
      }

      __int16 v45 = v229;
    }
    v243 = v45;
    if (v243)
    {
      pthread_mutex_lock(&sOutstandingPacURLMutex);
      if (nw_get_outstanding_pac_urls(void)::onceToken != -1) {
        dispatch_once(&nw_get_outstanding_pac_urls(void)::onceToken, &__block_literal_global_31787);
      }
      CFArrayRef v60 = (const __CFArray *)nw_get_outstanding_pac_urls(void)::gPACURLs;
      if (nw_get_outstanding_pac_urls(void)::gPACURLs)
      {
        BOOL v61 = v243;
        int v62 = [v61 type];

        CFIndex Count = CFArrayGetCount(v60);
        if (Count >= 1)
        {
          if (v62 == 2)
          {
            CFIndex v64 = 0;
            CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            BOOL v65 = 1;
            while (1)
            {
              CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v60, v64);
              CFStringRef v67 = CFURLCopyHostName(ValueAtIndex);
              if (v67)
              {
                __int16 v68 = v61;
                v69 = (const char *)[v68 hostname];

                if (v69 && (CFStringRef v70 = CFStringCreateWithCString(alloc, v69, 0x8000100u)) != 0)
                {
                  BOOL v71 = CFEqual(v67, v70);
                  CFRelease(v70);
                }
                else
                {
                  BOOL v71 = 0;
                }
                CFRelease(v67);
                if (v71)
                {
                  SInt32 v72 = CFURLGetPortNumber(ValueAtIndex);
                  id v73 = v68;
                  unsigned int v74 = [v73 port];

                  if (v74)
                  {
                    if (v72 && v72 == __rev16(v74)) {
                      break;
                    }
                  }
                }
              }
              BOOL v65 = ++v64 < Count;
              if (Count == v64) {
                goto LABEL_118;
              }
            }
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v75 = (id)gLogObj;
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              __int16 v76 = nw_endpoint_get_logging_description(v73);
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v76;
              *(_WORD *)&buf[22] = 2114;
              v280 = (uint64_t (*)(uint64_t, uint64_t))ValueAtIndex;
              _os_log_impl(&dword_1830D4000, v75, OS_LOG_TYPE_DEBUG, "%{public}s Endpoint %{public}s matched PAC URL %{public}@", buf, 0x20u);
            }

            goto LABEL_118;
          }
          for (CFIndex i = 0; i != Count; ++i)
          {
            CFURLRef v82 = (const __CFURL *)CFArrayGetValueAtIndex(v60, i);
            CFStringRef v83 = CFURLCopyHostName(v82);
            if (v83) {
              CFRelease(v83);
            }
          }
        }
LABEL_117:
        BOOL v65 = 0;
LABEL_118:
        pthread_mutex_unlock(&sOutstandingPacURLMutex);

        if (v65) {
          char v88 = 64;
        }
        else {
          char v88 = 0;
        }
        goto LABEL_121;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v77 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
      uint64_t v78 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v261) = 0;
      if (__nwlog_fault(v78, type, &v261))
      {
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v79 = (id)gLogObj;
          os_log_type_t v80 = type[0];
          if (os_log_type_enabled(v79, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            _os_log_impl(&dword_1830D4000, v79, v80, "%{public}s nw_get_outstanding_pac_urls failed", buf, 0xCu);
          }
        }
        else if ((_BYTE)v261)
        {
          v84 = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v79 = (id)gLogObj;
          os_log_type_t v85 = type[0];
          BOOL v86 = os_log_type_enabled(v79, type[0]);
          if (v84)
          {
            if (v86)
            {
              *(_DWORD *)buf = 136446466;
              *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v84;
              _os_log_impl(&dword_1830D4000, v79, v85, "%{public}s nw_get_outstanding_pac_urls failed, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v84);
            if (!v78) {
              goto LABEL_117;
            }
            goto LABEL_116;
          }
          if (v86)
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            _os_log_impl(&dword_1830D4000, v79, v85, "%{public}s nw_get_outstanding_pac_urls failed, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v79 = (id)gLogObj;
          os_log_type_t v87 = type[0];
          if (os_log_type_enabled(v79, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            _os_log_impl(&dword_1830D4000, v79, v87, "%{public}s nw_get_outstanding_pac_urls failed, backtrace limit exceeded", buf, 0xCu);
          }
        }
      }
      if (!v78) {
        goto LABEL_117;
      }
LABEL_116:
      free(v78);
      goto LABEL_117;
    }
    v208 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
    v209 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v261) = 0;
    if (__nwlog_fault(v209, type, &v261))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v210 = __nwlog_obj();
        os_log_type_t v211 = type[0];
        if (os_log_type_enabled(v210, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
          _os_log_impl(&dword_1830D4000, v210, v211, "%{public}s called with null endpoint", buf, 0xCu);
        }
      }
      else if ((_BYTE)v261)
      {
        v213 = (char *)__nw_create_backtrace_string();
        v210 = __nwlog_obj();
        os_log_type_t v214 = type[0];
        BOOL v215 = os_log_type_enabled(v210, type[0]);
        if (v213)
        {
          if (v215)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v213;
            _os_log_impl(&dword_1830D4000, v210, v214, "%{public}s called with null endpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v213);
          goto LABEL_267;
        }
        if (v215)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
          _os_log_impl(&dword_1830D4000, v210, v214, "%{public}s called with null endpoint, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v210 = __nwlog_obj();
        os_log_type_t v216 = type[0];
        if (os_log_type_enabled(v210, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_pac_resolver_endpoint_is_pac_url";
          _os_log_impl(&dword_1830D4000, v210, v216, "%{public}s called with null endpoint, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_267:
    if (v209) {
      free(v209);
    }
    char v88 = 0;
LABEL_121:
    *((unsigned char *)object + 97) = *((unsigned char *)object + 97) & 0xBF | v88;
    nw_endpoint_t v89 = v250;
    id alloca = v89[4];
    v242 = v89;

    if (nw_parameters_get_privacy_proxy_fail_closed(alloca)) {
      char v90 = 2;
    }
    else {
      char v90 = 0;
    }
    *((unsigned char *)object + 96) = *((unsigned char *)object + 96) & 0xFD | v90;
    if (nw_parameters_get_privacy_proxy_fail_closed_for_unreachable_hosts(alloca)) {
      char v91 = 4;
    }
    else {
      char v91 = 0;
    }
    *((unsigned char *)object + 96) = *((unsigned char *)object + 96) & 0xFB | v91;
    if (nw_parameters_get_prohibit_privacy_proxy(alloca)) {
      *((unsigned char *)object + 96) |= 8u;
    }
    v92 = v89;
    id v237 = v92[5];

    id v93 = (OS_nw_array *)nw_parameters_copy_custom_proxy_configs(alloca);
    v94 = object->custom_proxy_configs;
    object->custom_proxy_configs = v93;

    nw_endpoint_t v95 = (atomic_uchar *)object->custom_proxy_configs;
    if (v95)
    {
      *((unsigned char *)object + 97) |= 0x20u;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v280) = 0;
      v260[0] = MEMORY[0x1E4F143A8];
      v260[1] = 3221225472;
      v260[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke;
      v260[3] = &unk_1E5248058;
      v260[4] = buf;
      nw_array_apply(v95, (uint64_t)v260);
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        BOOL v96 = nw_array_create();
        v97 = (atomic_uchar *)object->custom_proxy_configs;
        v257[0] = MEMORY[0x1E4F143A8];
        v257[1] = 3221225472;
        v257[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_2;
        v257[3] = &unk_1E5247FB8;
        v98 = (OS_nw_array *)(id)v96;
        v258 = v98;
        id v259 = v237;
        nw_array_apply(v97, (uint64_t)v257);
        id v99 = object->custom_proxy_configs;
        object->custom_proxy_configs = v98;
        nw_endpoint_t v100 = v98;
      }
      _Block_object_dispose(buf, 8);
    }
    v101 = v92;
    os_unfair_lock_lock((os_unfair_lock_t)v101 + 28);
    id v102 = v101[8];
    lock = (os_unfair_lock_s *)(v101 + 14);
    os_unfair_lock_unlock((os_unfair_lock_t)v101 + 28);
    v235 = v101;

    v103 = (OS_nw_array *)nw_path_copy_proxy_configs(v102);
    v104 = object->path_proxy_configs;
    object->path_proxy_configs = v103;

    v105 = object;
    if (!object->custom_proxy_configs && object->path_proxy_configs)
    {
      BOOL v106 = nw_array_create();
      v107 = (atomic_uchar *)object->path_proxy_configs;
      v253[0] = MEMORY[0x1E4F143A8];
      v253[1] = 3221225472;
      v253[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_3;
      v253[3] = &unk_1E52497B8;
      id v254 = v237;
      v255 = v243;
      id v108 = (OS_nw_array *)(id)v106;
      v256 = v108;
      nw_array_apply(v107, (uint64_t)v253);
      id v109 = object->path_proxy_configs;
      object->path_proxy_configs = v108;
      char v110 = v108;

      v105 = object;
    }
    if (nw_parameters_get_is_known_tracker(alloca)) {
      char v111 = 16;
    }
    else {
      char v111 = 0;
    }
    *((unsigned char *)v105 + 97) = *((unsigned char *)v105 + 97) & 0xEF | v111;
    v112 = v235;
    v239[30] = 2;
    v244 = v112;

    *((_DWORD *)v244 + 20) = 65540;
    v238 = v244 + 10;
    nw_endpoint_handler_report(v244, 0, (_WORD *)v244 + 40, 0);
    uint64_t v113 = v244;
    char v114 = nw_endpoint_handler_copy_proxy(v113);
    v115 = v114;
    uint64_t v116 = 40;
    if (!*((void *)v114 + 5)) {
      uint64_t v116 = 48;
    }
    id v117 = *(id *)((char *)v114 + v116);
    v245 = v113;
    objecta = (atomic_uchar *)v117;
    __int16 v118 = nw_endpoint_handler_copy_proxy(v245);
    v119 = v118;
    uint64_t v261 = 0;
    uint64_t v262 = (uint64_t)&v261;
    uint64_t v263 = 0x2020000000;
    LOBYTE(v264) = 0;
    if (objecta && v118)
    {
      *(void *)os_log_type_t type = MEMORY[0x1E4F143A8];
      uint64_t v270 = 3221225472;
      uint64_t v271 = (uint64_t)___ZL31nw_endpoint_proxy_check_for_pacP30NWConcrete_nw_endpoint_handlerPU22objcproto11OS_nw_array8NSObject_block_invoke;
      v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E524A2E8;
      v273 = v118;
      v274 = (NWConcrete_nw_proxy_config *)&v261;
      nw_array_apply(objecta, (uint64_t)type);
    }
    __int16 v120 = v245;
    BOOL v121 = (v250[67] & 0x20) == 0;

    if (v121)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      uint64_t v122 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
      {
        v123 = v120;

        v124 = v123;
        BOOL v125 = (v250[67] & 1) == 0;

        if (v125) {
          v126 = "";
        }
        else {
          v126 = "dry-run ";
        }
        nw_endpoint_t v127 = nw_endpoint_handler_copy_endpoint(v124);
        v128 = nw_endpoint_get_logging_description(v127);
        v129 = v124;
        v130 = v129;
        uint64_t v131 = v239[30];
        if (v131 > 5) {
          v132 = "unknown-state";
        }
        else {
          v132 = off_1E523FB38[v131];
        }
        v228 = v132;

        v133 = v130;
        v134 = v133;
        v246 = "path";
        switch(v232[29])
        {
          case 0u:
            goto LABEL_162;
          case 1u:
            v135 = "resolver";
            goto LABEL_161;
          case 2u:
            v246 = nw_endpoint_flow_mode_string(v133[31]);
            goto LABEL_162;
          case 3u:
            v135 = "proxy";
            goto LABEL_161;
          case 4u:
            v135 = "fallback";
            goto LABEL_161;
          case 5u:
            v135 = "transform";
            goto LABEL_161;
          default:
            v135 = "unknown-mode";
LABEL_161:
            v246 = v135;
LABEL_162:

            v136 = v134;
            os_unfair_lock_lock(lock);
            id v137 = v235[8];
            os_unfair_lock_unlock(lock);

            BOOL v138 = *(unsigned char *)(v262 + 24) == 0;
            *(_DWORD *)buf = 136448002;
            *(void *)&uint8_t buf[4] = "nw_endpoint_proxy_check_for_pac";
            if (v138) {
              v139 = "does not have";
            }
            else {
              v139 = "has";
            }
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v123->id_str;
            *(_WORD *)&buf[22] = 2082;
            v280 = (uint64_t (*)(uint64_t, uint64_t))v126;
            *(_WORD *)v281 = 2082;
            *(void *)&v281[2] = v128;
            *(_WORD *)&v281[10] = 2082;
            *(void *)&v281[12] = v228;
            *(_WORD *)&v281[20] = 2082;
            *(void *)&v281[22] = v246;
            *(_WORD *)&v281[30] = 2114;
            id v282 = v137;
            __int16 v283 = 2080;
            v284 = v139;
            _os_log_impl(&dword_1830D4000, v122, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] proxy %s PAC", buf, 0x52u);

            break;
        }
      }
    }
    _Block_object_dispose(&v261, 8);

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v280 = __Block_byref_object_copy__26574;
    *(void *)v281 = __Block_byref_object_dispose__26575;
    *(void *)&v281[8] = 0;
    *(void *)os_log_type_t type = MEMORY[0x1E4F143A8];
    uint64_t v270 = 3221225472;
    uint64_t v271 = (uint64_t)___ZL43nw_endpoint_proxy_check_for_companion_proxyPU22objcproto11OS_nw_array8NSObject_block_invoke;
    v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5248058;
    v273 = (void (*)(uint64_t))buf;
    nw_array_apply(objecta, (uint64_t)type);
    id v247 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    v140 = v120;
    v141 = nw_endpoint_handler_copy_proxy(v140);
    v142 = (const void *)*((void *)v141 + 8);
    if (v142)
    {
      CFRelease(v142);
      *((void *)v141 + 8) = 0;
    }
    v143 = v140;
    id v144 = v242[4];

    id v145 = nw_parameters_copy_url_endpoint(v144);
    v146 = v145;
    if (v145)
    {
      CFURLRef v147 = (const __CFURL *)nw_endpoint_copy_cfurl(v145);
      *((void *)v141 + 8) = v147;
      if (!v147) {
        goto LABEL_209;
      }
    }
    else
    {
      nw_endpoint_t v148 = nw_endpoint_handler_copy_endpoint(v143);
      char v149 = *((unsigned char *)v141 + 97);
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_t log = v148;
      CFURLRef v150 = nw_endpoint_proxy_copy_synthesized_url(v148, v144, (v149 & 2) == 0, type);
      *((void *)v141 + 8) = v150;
      BOOL v151 = v150 == 0;
      v152 = v143;
      char v153 = *((unsigned char *)v250 + 268);

      if (v151)
      {
        if ((v153 & 0x20) == 0)
        {
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v164 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG))
          {
            v165 = nw_endpoint_handler_get_id_string(v152);
            v233 = nw_endpoint_handler_dry_run_string(v152);
            v236 = v165;
            nw_endpoint_t v240 = nw_endpoint_handler_copy_endpoint(v152);
            v166 = nw_endpoint_get_logging_description(v240);
            v167 = nw_endpoint_handler_state_string(v152);
            v168 = nw_endpoint_handler_mode_string(v152);
            id v169 = nw_endpoint_handler_copy_current_path(v152);
            *(_DWORD *)buf = 136447746;
            *(void *)&uint8_t buf[4] = "nw_endpoint_proxy_fillout_url";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v236;
            *(_WORD *)&buf[22] = 2082;
            v280 = (uint64_t (*)(uint64_t, uint64_t))v233;
            *(_WORD *)v281 = 2082;
            *(void *)&v281[2] = v166;
            *(_WORD *)&v281[10] = 2082;
            *(void *)&v281[12] = v167;
            *(_WORD *)&v281[20] = 2082;
            *(void *)&v281[22] = v168;
            *(_WORD *)&v281[30] = 2114;
            id v282 = v169;
            _os_log_impl(&dword_1830D4000, v164, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Failed to synthesize URL", buf, 0x48u);
          }
        }
      }
      else
      {
        if ((v153 & 0x20) == 0)
        {
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v154 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            v226 = v154;
            v155 = v152;

            v156 = v155;
            BOOL v157 = (v250[67] & 1) == 0;

            if (v157) {
              v158 = "";
            }
            else {
              v158 = "dry-run ";
            }
            nw_endpoint_t v159 = nw_endpoint_handler_copy_endpoint(v156);
            v225 = nw_endpoint_get_logging_description(v159);
            v160 = v156;
            v161 = v160;
            uint64_t v162 = v239[30];
            v224 = (uint64_t (*)(uint64_t, uint64_t))v158;
            if (v162 > 5) {
              v163 = "unknown-state";
            }
            else {
              v163 = off_1E523FB38[v162];
            }
            v241 = v163;

            v170 = v161;
            v171 = v170;
            v172 = "path";
            switch(v232[29])
            {
              case 0u:
                break;
              case 1u:
                v172 = "resolver";
                break;
              case 2u:
                v172 = nw_endpoint_flow_mode_string(v170[31]);
                break;
              case 3u:
                v172 = "proxy";
                break;
              case 4u:
                v172 = "fallback";
                break;
              case 5u:
                v172 = "transform";
                break;
              default:
                v172 = "unknown-mode";
                break;
            }
            BOOL v234 = (v149 & 2) == 0;

            v173 = v171;
            os_unfair_lock_lock(lock);
            id v174 = v235[8];
            os_unfair_lock_unlock(lock);

            v175 = (const char *)*((void *)v141 + 8);
            *(_DWORD *)buf = 136448514;
            *(void *)&uint8_t buf[4] = "nw_endpoint_proxy_fillout_url";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v155->id_str;
            *(_WORD *)&buf[22] = 2082;
            v280 = v224;
            *(_WORD *)v281 = 2082;
            *(void *)&v281[2] = v225;
            *(_WORD *)&v281[10] = 2082;
            *(void *)&v281[12] = v241;
            *(_WORD *)&v281[20] = 2082;
            *(void *)&v281[22] = v172;
            *(_WORD *)&v281[30] = 2114;
            id v282 = v174;
            __int16 v283 = 2114;
            v284 = v175;
            __int16 v285 = 1024;
            BOOL v286 = v234;
            __int16 v287 = 1024;
            int v288 = type[0];
            _os_log_impl(&dword_1830D4000, v226, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Synthesized URL %{public}@ (allowed to override scheme: %u, overrode scheme %u)", buf, 0x5Eu);

            v154 = v226;
          }
        }
        *((unsigned char *)v141 + 96) |= 0x40u;
        *((unsigned char *)v141 + 97) = *((unsigned char *)v141 + 97) & 0xFE | type[0];
      }

      CFURLRef v147 = (const __CFURL *)*((void *)v141 + 8);
      if (!v147) {
        goto LABEL_209;
      }
    }
    CFStringRef v176 = CFURLCopyScheme(v147);
    CFStringRef v177 = v176;
    if (!v176)
    {
LABEL_209:

      BOOL v180 = nw_array_create();
      v181 = (void *)*((void *)v115 + 7);
      *((void *)v115 + 7) = v180;

      *((unsigned char *)v115 + 96) &= ~0x20u;
      *((_DWORD *)v115 + 6) = 0;
      if ((*((unsigned char *)v115 + 97) & 0x40) != 0)
      {
        direct = nw_proxy_config_create_direct();
        if (direct) {
          nw_array_append(*((void *)v115 + 7), direct);
        }
      }
      else
      {
        v182 = v143;
        direct = (NWConcrete_nw_proxy_config *)v242[4];

        int no_proxy = nw_parameters_get_no_proxy(direct);
        prefer_int no_proxy = nw_parameters_get_prefer_no_proxy(&direct->super);
        BOOL v186 = nw_array_create();
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = ___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke;
        aBlock[3] = &unk_1E524AE18;
        id v187 = (id)v186;
        id v278 = v187;
        v188 = _Block_copy(aBlock);
        nw_array_apply(*((atomic_uchar **)v115 + 6), (uint64_t)v188);
        nw_array_apply(*((atomic_uchar **)v115 + 5), (uint64_t)v188);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = ___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke_2;
        v280 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52446D8;
        v189 = v182;
        *(void *)v281 = v189;
        *(void *)&v281[8] = direct;
        id v190 = v187;
        *(void *)&v281[16] = v190;
        id v191 = v247;
        *(void *)&v281[24] = v191;
        nw_array_apply(objecta, (uint64_t)buf);
        char v192 = prefer_no_proxy | no_proxy;
        if ((prefer_no_proxy | no_proxy) == 1)
        {
          v193 = nw_proxy_config_create_direct();
          if (v193) {
            nw_array_append(*((void *)v115 + 7), v193);
          }
        }
        if ((no_proxy & 1) == 0)
        {
          *(void *)os_log_type_t type = MEMORY[0x1E4F143A8];
          uint64_t v270 = 3221225472;
          uint64_t v271 = (uint64_t)___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke_3;
          v272 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52446D8;
          v273 = v189;
          v274 = direct;
          id v275 = v190;
          id v276 = v191;
          nw_array_apply(objecta, (uint64_t)type);
        }
        if ((v192 & 1) == 0 && ((*((unsigned char *)v115 + 96) & 0x20) == 0 || nw_array_is_empty(*((void *)v115 + 7))))
        {
          v194 = nw_proxy_config_create_direct();
          if (v194) {
            nw_array_append(*((void *)v115 + 7), v194);
          }
        }
        if ((no_proxy & 1) == 0)
        {
          uint64_t v261 = MEMORY[0x1E4F143A8];
          uint64_t v262 = 3221225472;
          uint64_t v263 = (uint64_t)___ZL32nw_endpoint_proxy_process_configP30NWConcrete_nw_endpoint_handler_block_invoke_4;
          v264 = &unk_1E52446D8;
          v265 = v189;
          v266 = direct;
          id v267 = v190;
          id v268 = v191;
          nw_array_apply(objecta, (uint64_t)&v261);
        }
      }

      *((_DWORD *)v244 + 20) = 131076;
      nw_endpoint_handler_report(v143, 0, v238, 0);

      v195 = v143;
      v196 = (id *)nw_endpoint_handler_copy_proxy(v195);
      *((_DWORD *)v244 + 20) = 196612;
      nw_endpoint_handler_report(v195, 0, v238, 0);
      *(void *)os_log_type_t type = 0;
      uint64_t v270 = (uint64_t)type;
      uint64_t v271 = 0x3032000000;
      v272 = __Block_byref_object_copy__26574;
      v273 = __Block_byref_object_dispose__26575;
      v274 = 0;
      v197 = (atomic_uchar *)v196[7];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL32nw_endpoint_proxy_resolve_configP30NWConcrete_nw_endpoint_handler_block_invoke;
      v280 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5244660;
      v198 = v195;
      *(void *)v281 = v198;
      v199 = v196;
      *(void *)&v281[8] = v199;
      *(void *)&v281[16] = type;
      nw_array_apply(v197, (uint64_t)buf);
      v200 = *(void **)(v270 + 40);
      if (v200) {
        objc_storeStrong(v196 + 7, v200);
      }
      nw_endpoint_proxy_complete_resolve(v198);

      _Block_object_dispose(type, 8);
      goto LABEL_230;
    }
    if (CFStringCompare(v176, @"https", 1uLL) && CFStringCompare(v177, @"wss", 1uLL))
    {
      if (CFStringCompare(v177, @"http", 1uLL) && CFStringCompare(v177, @"ws", 1uLL)) {
        goto LABEL_208;
      }
      char v178 = 0x80;
      uint64_t v179 = 97;
    }
    else
    {
      char v178 = 1;
      uint64_t v179 = 98;
    }
    *((unsigned char *)v141 + v179) |= v178;
LABEL_208:
    CFRelease(v177);
    goto LABEL_209;
  }
LABEL_231:
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_endpoint_proxy;
  [(NWConcrete_nw_endpoint_proxy *)&v2 dealloc];
}

@end