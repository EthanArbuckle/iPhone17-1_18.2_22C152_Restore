@interface NWConcrete_nw_endpoint_transform
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_transform)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_transform

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_endpoint_transform;
  [(NWConcrete_nw_endpoint_transform *)&v2 dealloc];
}

- (NWConcrete_nw_endpoint_transform)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_endpoint_transform;
  objc_super v2 = [(NWConcrete_nw_endpoint_transform *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
          v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v29 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v37 = 0;
    if (__nwlog_fault(v18, &type, &v37))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __int16 v19 = __nwlog_obj();
        os_log_type_t v30 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v19, v30, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_36;
      }
      if (!v37)
      {
        __int16 v19 = __nwlog_obj();
        os_log_type_t v34 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v19, v34, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_36;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __int16 v19 = __nwlog_obj();
      os_log_type_t v32 = type;
      BOOL v33 = os_log_type_enabled(v19, type);
      if (!backtrace_string)
      {
        if (v33)
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v19, v32, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_36;
      }
      if (v33)
      {
        *(_DWORD *)buf = 136446466;
        v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
        __int16 v41 = 2082;
        v42 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v19, v32, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_37:
    if (!v18) {
      goto LABEL_39;
    }
LABEL_38:
    free(v18);
    goto LABEL_39;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 == 5)
  {
    child_endpoint_handlers = self->child_endpoint_handlers;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __61__NWConcrete_nw_endpoint_transform_cancelWithHandler_forced___block_invoke;
    v35[3] = &__block_descriptor_33_e35_B24__0Q8__NSObject_OS_nw_object__16l;
    BOOL v36 = a4;
    nw_array_apply((atomic_uchar *)child_endpoint_handlers, (uint64_t)v35);
    os_log_type_t v11 = self->child_endpoint_handlers;
    self->child_endpoint_handlers = 0;

    failed_child_endpoint_handlers = self->failed_child_endpoint_handlers;
    self->failed_child_endpoint_handlers = 0;

    blocked_protocols = self->blocked_protocols;
    self->blocked_protocols = 0;

    self->next_child_endpoint_index = 0;
    fallback_modes = self->fallback_modes;
    self->fallback_modes = 0;

    child_timer = self->child_timer;
    if (child_timer)
    {
      nw_queue_cancel_source((uint64_t)child_timer);
      self->child_timer = 0;
    }
    goto LABEL_39;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v16 = (id)gLogObj;
  if (v9 > 5) {
    v17 = "unknown-mode";
  }
  else {
    v17 = off_1E523FB08[v9];
  }
  *(_DWORD *)buf = 136446722;
  v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
  __int16 v41 = 2082;
  v42 = (void *)v17;
  __int16 v43 = 2082;
  v44 = "transform";
  v18 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v37 = 0;
  if (!__nwlog_fault(v18, &type, &v37)) {
    goto LABEL_37;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v19 = (id)gLogObj;
    os_log_type_t v20 = type;
    if (os_log_type_enabled(v19, type))
    {
      if (v9 > 5) {
        uint64_t v21 = "unknown-mode";
      }
      else {
        uint64_t v21 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
      __int16 v41 = 2082;
      v42 = (void *)v21;
      __int16 v43 = 2082;
      v44 = "transform";
      _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_36:

    goto LABEL_37;
  }
  if (!v37)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v19 = (id)gLogObj;
    os_log_type_t v26 = type;
    if (os_log_type_enabled(v19, type))
    {
      if (v9 > 5) {
        v27 = "unknown-mode";
      }
      else {
        v27 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
      __int16 v41 = 2082;
      v42 = (void *)v27;
      __int16 v43 = 2082;
      v44 = "transform";
      _os_log_impl(&dword_1830D4000, v19, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_36;
  }
  v22 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  __int16 v19 = (id)gLogObj;
  os_log_type_t v23 = type;
  BOOL v24 = os_log_type_enabled(v19, type);
  if (!v22)
  {
    if (v24)
    {
      if (v9 > 5) {
        v28 = "unknown-mode";
      }
      else {
        v28 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
      __int16 v41 = 2082;
      v42 = (void *)v28;
      __int16 v43 = 2082;
      v44 = "transform";
      _os_log_impl(&dword_1830D4000, v19, v23, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_36;
  }
  if (v24)
  {
    if (v9 > 5) {
      v25 = "unknown-mode";
    }
    else {
      v25 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446978;
    v40 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
    __int16 v41 = 2082;
    v42 = (void *)v25;
    __int16 v43 = 2082;
    v44 = "transform";
    __int16 v45 = 2082;
    v46 = v22;
    _os_log_impl(&dword_1830D4000, v19, v23, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v22);
  if (v18) {
    goto LABEL_38;
  }
LABEL_39:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->primary_endpoint, 0);
  objc_storeStrong((id *)&self->connected_child, 0);
  objc_storeStrong((id *)&self->blocked_protocols, 0);
  objc_storeStrong((id *)&self->fallback_modes, 0);
  objc_storeStrong((id *)&self->failed_child_endpoint_handlers, 0);

  objc_storeStrong((id *)&self->child_endpoint_handlers, 0);
}

- (void)startWithHandler:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v44 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
    BOOL v24 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault(v24, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v25 = __nwlog_obj();
        os_log_type_t v45 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v25, v45, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_55;
      }
      if (!v53)
      {
        v25 = __nwlog_obj();
        os_log_type_t v49 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v25, v49, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_55;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v25 = __nwlog_obj();
      os_log_type_t v47 = type;
      BOOL v48 = os_log_type_enabled(v25, type);
      if (!backtrace_string)
      {
        if (v48)
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v25, v47, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_55;
      }
      if (v48)
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
        __int16 v57 = 2082;
        v58 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v25, v47, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_56:
    if (!v24) {
      goto LABEL_58;
    }
LABEL_57:
    free(v24);
    goto LABEL_58;
  }
  id v6 = (unsigned int *)v4;
  uint64_t v7 = v6[29];

  if (v7 == 5)
  {
    v8 = v6;
    unsigned int v9 = v8[30];

    if (v9 == 1)
    {
      v10 = v8;
      char v11 = *((unsigned char *)v10 + 268);

      if ((v11 & 0x20) == 0)
      {
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
        }
        BOOL v12 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          os_log_type_t v13 = v10;

          char v14 = v13;
          char v15 = *((unsigned char *)v10 + 268);

          if (v15) {
            id v16 = "dry-run ";
          }
          else {
            id v16 = "";
          }
          nw_endpoint_t v17 = nw_endpoint_handler_copy_endpoint(v14);
          logging_description = nw_endpoint_get_logging_description(v17);
          v51 = v13 + 168;
          v18 = v14;
          __int16 v19 = v18;
          uint64_t v20 = v8[30];
          if (v20 > 5) {
            uint64_t v21 = "unknown-state";
          }
          else {
            uint64_t v21 = off_1E523FB38[v20];
          }
          v50 = v21;

          os_log_type_t v34 = v19;
          v35 = v34;
          unsigned int v36 = v6[29];
          char v37 = "path";
          switch(v36)
          {
            case 0u:
              break;
            case 1u:
              char v37 = "resolver";
              break;
            case 2u:
              char v37 = nw_endpoint_flow_mode_string(v34[31]);
              break;
            case 3u:
              char v37 = "proxy";
              break;
            case 4u:
              char v37 = "fallback";
              break;
            case 5u:
              char v37 = "transform";
              break;
            default:
              char v37 = "unknown-mode";
              break;
          }

          v39 = v35;
          os_unfair_lock_lock((os_unfair_lock_t)v39 + 28);
          id v40 = v39[8];
          os_unfair_lock_unlock((os_unfair_lock_t)v39 + 28);

          *(_DWORD *)buf = 136447746;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          __int16 v57 = 2082;
          v58 = v51;
          __int16 v59 = 2082;
          v60 = v16;
          __int16 v61 = 2082;
          v62 = (void *)logging_description;
          __int16 v63 = 2082;
          v64 = v50;
          __int16 v65 = 2082;
          v66 = v37;
          __int16 v67 = 2114;
          id v68 = v40;
          _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);
        }
      }
      __int16 v41 = (OS_nw_endpoint *)nw_endpoint_handler_copy_endpoint(v10);
      primary_endpoint = self->primary_endpoint;
      self->primary_endpoint = v41;

      __int16 v43 = v10;
      v8[30] = 2;

      v43->event = (nw_endpoint_handler_event_s)65543;
      nw_endpoint_handler_report(v43, 0, &v43->event.domain, 0);
      nw_endpoint_transform_add_children(v43);
      nw_endpoint_transform_start_next_child(v43);
    }
    goto LABEL_58;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v22 = (id)gLogObj;
  if (v7 > 5) {
    os_log_type_t v23 = "unknown-mode";
  }
  else {
    os_log_type_t v23 = off_1E523FB08[v7];
  }
  *(_DWORD *)buf = 136446722;
  v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
  __int16 v57 = 2082;
  v58 = (void *)v23;
  __int16 v59 = 2082;
  v60 = "transform";
  BOOL v24 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v53 = 0;
  if (!__nwlog_fault(v24, &type, &v53)) {
    goto LABEL_56;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    os_log_type_t v26 = type;
    if (os_log_type_enabled(v25, type))
    {
      if (v7 > 5) {
        v27 = "unknown-mode";
      }
      else {
        v27 = off_1E523FB08[v7];
      }
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
      __int16 v57 = 2082;
      v58 = (void *)v27;
      __int16 v59 = 2082;
      v60 = "transform";
      _os_log_impl(&dword_1830D4000, v25, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_55:

    goto LABEL_56;
  }
  if (!v53)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    os_log_type_t v32 = type;
    if (os_log_type_enabled(v25, type))
    {
      if (v7 > 5) {
        BOOL v33 = "unknown-mode";
      }
      else {
        BOOL v33 = off_1E523FB08[v7];
      }
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
      __int16 v57 = 2082;
      v58 = (void *)v33;
      __int16 v59 = 2082;
      v60 = "transform";
      _os_log_impl(&dword_1830D4000, v25, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_55;
  }
  v28 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v25 = (id)gLogObj;
  os_log_type_t v29 = type;
  BOOL v30 = os_log_type_enabled(v25, type);
  if (!v28)
  {
    if (v30)
    {
      if (v7 > 5) {
        v38 = "unknown-mode";
      }
      else {
        v38 = off_1E523FB08[v7];
      }
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
      __int16 v57 = 2082;
      v58 = (void *)v38;
      __int16 v59 = 2082;
      v60 = "transform";
      _os_log_impl(&dword_1830D4000, v25, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_55;
  }
  if (v30)
  {
    if (v7 > 5) {
      v31 = "unknown-mode";
    }
    else {
      v31 = off_1E523FB08[v7];
    }
    *(_DWORD *)buf = 136446978;
    v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
    __int16 v57 = 2082;
    v58 = (void *)v31;
    __int16 v59 = 2082;
    v60 = "transform";
    __int16 v61 = 2082;
    v62 = v28;
    _os_log_impl(&dword_1830D4000, v25, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v28);
  if (v24) {
    goto LABEL_57;
  }
LABEL_58:
}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    os_log_type_t v26 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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

  if (v9 != 5)
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
    v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
    __int16 v43 = 2082;
    v44 = (void *)v13;
    __int16 v45 = 2082;
    v46 = "transform";
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
          v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          v44 = (void *)v17;
          __int16 v45 = 2082;
          v46 = "transform";
          _os_log_impl(&dword_1830D4000, v15, v16, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v39)
      {
        v18 = (char *)__nw_create_backtrace_string();
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
            v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
            __int16 v43 = 2082;
            v44 = (void *)v21;
            __int16 v45 = 2082;
            v46 = "transform";
            __int16 v47 = 2082;
            BOOL v48 = v18;
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
            BOOL v24 = "unknown-mode";
          }
          else {
            BOOL v24 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          v44 = (void *)v24;
          __int16 v45 = 2082;
          v46 = "transform";
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
            os_log_type_t v23 = "unknown-mode";
          }
          else {
            os_log_type_t v23 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
          __int16 v43 = 2082;
          v44 = (void *)v23;
          __int16 v45 = 2082;
          v46 = "transform";
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
    v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v15, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v15, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_60;
  }
  child_endpoint_handlers = self->child_endpoint_handlers;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __64__NWConcrete_nw_endpoint_transform_applyWithHandler_toChildren___block_invoke;
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
  if (v3)
  {
    v5 = (unsigned int *)v3;
    uint64_t v6 = v5[29];

    if (v6 == 5) {
      goto LABEL_37;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    if (v6 > 5) {
      v8 = "unknown-mode";
    }
    else {
      v8 = off_1E523FB08[v6];
    }
    *(_DWORD *)buf = 136446722;
    os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
    __int16 v30 = 2082;
    os_log_type_t v31 = (void *)v8;
    __int16 v32 = 2082;
    os_log_type_t v33 = "transform";
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (!__nwlog_fault(v9, &type, &v26)) {
      goto LABEL_35;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        if (v6 > 5) {
          id v12 = "unknown-mode";
        }
        else {
          id v12 = off_1E523FB08[v6];
        }
        *(_DWORD *)buf = 136446722;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        __int16 v30 = 2082;
        os_log_type_t v31 = (void *)v12;
        __int16 v32 = 2082;
        os_log_type_t v33 = "transform";
        _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
      }
    }
    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v15)
        {
          if (v6 > 5) {
            os_log_type_t v16 = "unknown-mode";
          }
          else {
            os_log_type_t v16 = off_1E523FB08[v6];
          }
          *(_DWORD *)buf = 136446978;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
          __int16 v30 = 2082;
          os_log_type_t v31 = (void *)v16;
          __int16 v32 = 2082;
          os_log_type_t v33 = "transform";
          __int16 v34 = 2082;
          os_log_type_t v35 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
        }

        free(backtrace_string);
        if (v9) {
          goto LABEL_36;
        }
        goto LABEL_37;
      }
      if (v15)
      {
        if (v6 > 5) {
          os_log_type_t v19 = "unknown-mode";
        }
        else {
          os_log_type_t v19 = off_1E523FB08[v6];
        }
        *(_DWORD *)buf = 136446722;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        __int16 v30 = 2082;
        os_log_type_t v31 = (void *)v19;
        __int16 v32 = 2082;
        os_log_type_t v33 = "transform";
        _os_log_impl(&dword_1830D4000, v10, v14, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v10, type))
      {
        if (v6 > 5) {
          v18 = "unknown-mode";
        }
        else {
          v18 = off_1E523FB08[v6];
        }
        *(_DWORD *)buf = 136446722;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        __int16 v30 = 2082;
        os_log_type_t v31 = (void *)v18;
        __int16 v32 = 2082;
        os_log_type_t v33 = "transform";
        _os_log_impl(&dword_1830D4000, v10, v17, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
      }
    }
    goto LABEL_34;
  }
  BOOL v20 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
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
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v10, v21, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v26)
    {
      os_log_type_t v22 = (char *)__nw_create_backtrace_string();
      v10 = __nwlog_obj();
      os_log_type_t v23 = type;
      BOOL v24 = os_log_type_enabled(v10, type);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
          __int16 v30 = 2082;
          os_log_type_t v31 = v22;
          _os_log_impl(&dword_1830D4000, v10, v23, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v22);
        if (v9) {
          goto LABEL_36;
        }
        goto LABEL_37;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v10, v23, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v10 = __nwlog_obj();
      os_log_type_t v25 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v10, v25, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_34:
  }
LABEL_35:
  if (v9) {
LABEL_36:
  }
    free(v9);
LABEL_37:
}

@end