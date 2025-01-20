@interface NWConcrete_nw_endpoint_fallback
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_fallback)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_fallback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fallback_interface, 0);
  objc_storeStrong((id *)&self->primary_interface, 0);
  objc_storeStrong((id *)&self->fallback_child, 0);

  objc_storeStrong((id *)&self->primary_child, 0);
}

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (unsigned int (**)(void))a4;
  if (!v6)
  {
    v25 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v37 = 0;
    if (!__nwlog_fault(v13, &type, &v37)) {
      goto LABEL_41;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v14 = __nwlog_obj();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v26, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v37)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v14 = __nwlog_obj();
      os_log_type_t v30 = type;
      BOOL v31 = os_log_type_enabled(v14, type);
      if (backtrace_string)
      {
        if (v31)
        {
          *(_DWORD *)buf = 136446466;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          __int16 v41 = 2082;
          v42 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v14, v30, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_41;
      }
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v30, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v14 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v35, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_40:

    goto LABEL_41;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 != 4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v11 = (id)gLogObj;
    if (v9 > 5) {
      v12 = "unknown-mode";
    }
    else {
      v12 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446722;
    v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
    __int16 v41 = 2082;
    v42 = (void *)v12;
    __int16 v43 = 2082;
    v44 = "fallback";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v37 = 0;
    if (__nwlog_fault(v13, &type, &v37))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        os_log_type_t v15 = type;
        if (os_log_type_enabled(v14, type))
        {
          if (v9 > 5) {
            v16 = "unknown-mode";
          }
          else {
            v16 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          __int16 v41 = 2082;
          v42 = (void *)v16;
          __int16 v43 = 2082;
          v44 = "fallback";
          _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v37)
      {
        v17 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        os_log_type_t v18 = type;
        BOOL v19 = os_log_type_enabled(v14, type);
        if (v17)
        {
          if (v19)
          {
            if (v9 > 5) {
              v20 = "unknown-mode";
            }
            else {
              v20 = off_1E523FB08[v9];
            }
            *(_DWORD *)buf = 136446978;
            v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
            __int16 v41 = 2082;
            v42 = (void *)v20;
            __int16 v43 = 2082;
            v44 = "fallback";
            __int16 v45 = 2082;
            v46 = v17;
            _os_log_impl(&dword_1830D4000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v17);
          if (!v13) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
        if (v19)
        {
          if (v9 > 5) {
            v23 = "unknown-mode";
          }
          else {
            v23 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          __int16 v41 = 2082;
          v42 = (void *)v23;
          __int16 v43 = 2082;
          v44 = "fallback";
          _os_log_impl(&dword_1830D4000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v14, type))
        {
          if (v9 > 5) {
            v22 = "unknown-mode";
          }
          else {
            v22 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          __int16 v41 = 2082;
          v42 = (void *)v22;
          __int16 v43 = 2082;
          v44 = "fallback";
          _os_log_impl(&dword_1830D4000, v14, v21, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  if (!v7)
  {
    v27 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v37 = 0;
    if (__nwlog_fault(v13, &type, &v37))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v14 = __nwlog_obj();
        os_log_type_t v28 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          _os_log_impl(&dword_1830D4000, v14, v28, "%{public}s called with null applyBlock", buf, 0xCu);
        }
      }
      else if (v37)
      {
        v32 = (char *)__nw_create_backtrace_string();
        v14 = __nwlog_obj();
        os_log_type_t v33 = type;
        BOOL v34 = os_log_type_enabled(v14, type);
        if (v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
            __int16 v41 = 2082;
            v42 = v32;
            _os_log_impl(&dword_1830D4000, v14, v33, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v32);
          if (!v13) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          _os_log_impl(&dword_1830D4000, v14, v33, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v14 = __nwlog_obj();
        os_log_type_t v36 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          _os_log_impl(&dword_1830D4000, v14, v36, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
        }
      }
      goto LABEL_40;
    }
LABEL_41:
    if (!v13)
    {
LABEL_43:
      BOOL v10 = 1;
      goto LABEL_44;
    }
LABEL_42:
    free(v13);
    goto LABEL_43;
  }
  if ((!self->primary_child || v7[2](v7)) && (!self->fallback_child || v7[2](v7))) {
    goto LABEL_43;
  }
  BOOL v10 = 0;
LABEL_44:

  return v10;
}

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v79 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v121 = 0;
    if (!__nwlog_fault(v29, &type, &v121)) {
      goto LABEL_65;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v30 = __nwlog_obj();
      os_log_type_t v80 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v30, v80, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v121)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      os_log_type_t v30 = __nwlog_obj();
      os_log_type_t v82 = type;
      BOOL v83 = os_log_type_enabled(v30, type);
      if (backtrace_string)
      {
        if (v83)
        {
          *(_DWORD *)buf = 136446466;
          v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          __int16 v125 = 2082;
          v126 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v30, v82, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_65;
      }
      if (v83)
      {
        *(_DWORD *)buf = 136446210;
        v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v30, v82, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      os_log_type_t v30 = __nwlog_obj();
      os_log_type_t v84 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_1830D4000, v30, v84, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_64:

    goto LABEL_65;
  }
  id v6 = (unsigned int *)v4;
  uint64_t v7 = v6[29];

  if (v7 != 4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v27 = (id)gLogObj;
    if (v7 > 5) {
      os_log_type_t v28 = "unknown-mode";
    }
    else {
      os_log_type_t v28 = off_1E523FB08[v7];
    }
    *(_DWORD *)buf = 136446722;
    v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
    __int16 v125 = 2082;
    v126 = (void *)v28;
    __int16 v127 = 2082;
    v128 = "fallback";
    v29 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v121 = 0;
    if (__nwlog_fault(v29, &type, &v121))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v30 = (id)gLogObj;
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v30, type))
        {
          if (v7 > 5) {
            v32 = "unknown-mode";
          }
          else {
            v32 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          __int16 v125 = 2082;
          v126 = (void *)v32;
          __int16 v127 = 2082;
          v128 = "fallback";
          _os_log_impl(&dword_1830D4000, v30, v31, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v121)
      {
        os_log_type_t v33 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v30 = (id)gLogObj;
        os_log_type_t v34 = type;
        BOOL v35 = os_log_type_enabled(v30, type);
        if (v33)
        {
          if (v35)
          {
            if (v7 > 5) {
              os_log_type_t v36 = "unknown-mode";
            }
            else {
              os_log_type_t v36 = off_1E523FB08[v7];
            }
            *(_DWORD *)buf = 136446978;
            v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            __int16 v125 = 2082;
            v126 = (void *)v36;
            __int16 v127 = 2082;
            v128 = "fallback";
            __int16 v129 = 2082;
            v130 = v33;
            _os_log_impl(&dword_1830D4000, v30, v34, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v33);
          if (!v29) {
            goto LABEL_93;
          }
LABEL_66:
          free(v29);
          goto LABEL_93;
        }
        if (v35)
        {
          if (v7 > 5) {
            v39 = "unknown-mode";
          }
          else {
            v39 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          __int16 v125 = 2082;
          v126 = (void *)v39;
          __int16 v127 = 2082;
          v128 = "fallback";
          _os_log_impl(&dword_1830D4000, v30, v34, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v30 = (id)gLogObj;
        os_log_type_t v37 = type;
        if (os_log_type_enabled(v30, type))
        {
          if (v7 > 5) {
            v38 = "unknown-mode";
          }
          else {
            v38 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          __int16 v125 = 2082;
          v126 = (void *)v38;
          __int16 v127 = 2082;
          v128 = "fallback";
          _os_log_impl(&dword_1830D4000, v30, v37, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_64;
    }
LABEL_65:
    if (!v29) {
      goto LABEL_93;
    }
    goto LABEL_66;
  }
  if ((*((unsigned char *)self + 108) & 0x20) == 0 && self->fallback_interface)
  {
    v8 = v6;
    p_lock = &v8->lock;
    os_unfair_lock_lock(&v8->lock);
    BOOL v10 = v8->current_path;
    os_unfair_lock_unlock(&v8->lock);

    v120 = v10;
    int fallback_interface_index = nw_path_get_fallback_interface_index((uint64_t)v10);
    if (!fallback_interface_index
      || (fallback_interface = self->fallback_interface) == 0
      || fallback_interface_index != *((_DWORD *)fallback_interface + 2))
    {
      fallback_timer = self->fallback_timer;
      if (fallback_timer)
      {
        nw_queue_cancel_source((uint64_t)fallback_timer);
        self->fallback_timer = 0;
      }
      if (!self->result && self->fallback_child)
      {
        if (nw_endpoint_handler_get_minimize_logging(v8))
        {
          if (nw_endpoint_handler_get_logging_disabled(v8)) {
            goto LABEL_51;
          }
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v97 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            loge = nw_endpoint_handler_get_id_string(v8);
            v98 = nw_endpoint_handler_dry_run_string(v8);
            nw_endpoint_t v99 = nw_endpoint_handler_copy_endpoint(v8);
            logging_description = nw_endpoint_get_logging_description(v99);
            v101 = nw_endpoint_handler_state_string(v8);
            v102 = nw_endpoint_handler_mode_string(v8);
            v103 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
            *(_DWORD *)buf = 136447746;
            v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            __int16 v125 = 2082;
            v126 = (void *)loge;
            __int16 v127 = 2082;
            v128 = v98;
            __int16 v129 = 2082;
            v130 = (void *)logging_description;
            __int16 v131 = 2082;
            v132 = v101;
            __int16 v133 = 2082;
            v134 = v102;
            __int16 v135 = 2114;
            v136 = v103;
            v42 = v97;
            _os_log_impl(&dword_1830D4000, v97, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed, cancelling fallback attempt", buf, 0x48u);
          }
          else
          {
            v42 = v97;
          }
        }
        else
        {
          v40 = v8;
          char v41 = *((unsigned char *)v40 + 268);

          if ((v41 & 0x20) != 0)
          {
LABEL_51:
            nw_endpoint_handler_cancel(self->fallback_child, 0, 1);
            goto LABEL_74;
          }
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v42 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            id_string = nw_endpoint_handler_get_id_string(v40);
            v44 = nw_endpoint_handler_dry_run_string(v40);
            loga = v42;
            nw_endpoint_t v45 = nw_endpoint_handler_copy_endpoint(v40);
            v46 = nw_endpoint_get_logging_description(v45);
            uint64_t v47 = nw_endpoint_handler_state_string(v40);
            v48 = nw_endpoint_handler_mode_string(v40);
            v49 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v40);
            *(_DWORD *)buf = 136447746;
            v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            __int16 v125 = 2082;
            v126 = (void *)id_string;
            __int16 v127 = 2082;
            v128 = v44;
            __int16 v129 = 2082;
            v130 = (void *)v46;
            __int16 v131 = 2082;
            v132 = v47;
            __int16 v133 = 2082;
            v134 = v48;
            __int16 v135 = 2114;
            v136 = v49;
            v42 = loga;
            _os_log_impl(&dword_1830D4000, loga, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed, cancelling fallback attempt", buf, 0x48u);
          }
        }

        goto LABEL_51;
      }
      if (nw_endpoint_handler_get_minimize_logging(v8))
      {
        if (nw_endpoint_handler_get_logging_disabled(v8)) {
          goto LABEL_74;
        }
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
        }
        v16 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          logc = nw_endpoint_handler_get_id_string(v8);
          v85 = nw_endpoint_handler_dry_run_string(v8);
          nw_endpoint_t v86 = nw_endpoint_handler_copy_endpoint(v8);
          v87 = nw_endpoint_get_logging_description(v86);
          v88 = nw_endpoint_handler_state_string(v8);
          v89 = nw_endpoint_handler_mode_string(v8);
          v90 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
          *(_DWORD *)buf = 136447746;
          v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          __int16 v125 = 2082;
          v126 = (void *)logc;
          __int16 v127 = 2082;
          v128 = v85;
          __int16 v129 = 2082;
          v130 = (void *)v87;
          __int16 v131 = 2082;
          v132 = v88;
          __int16 v133 = 2082;
          v134 = v89;
          __int16 v135 = 2114;
          v136 = v90;
          _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed", buf, 0x48u);
        }
        goto LABEL_73;
      }
      v14 = v8;
      char v15 = *((unsigned char *)v14 + 268);

      if ((v15 & 0x20) == 0)
      {
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
        }
        v16 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v119 = v8;
          v17 = v14;

          os_log_type_t v18 = v17;
          char v19 = *((unsigned char *)v14 + 268);

          if (v19) {
            v20 = "dry-run ";
          }
          else {
            v20 = "";
          }
          nw_endpoint_t v21 = nw_endpoint_handler_copy_endpoint(v18);
          v22 = nw_endpoint_get_logging_description(v21);
          id_str = v17->id_str;
          v23 = v18;
          v24 = v23;
          uint64_t v25 = v23[30];
          if (v25 > 5) {
            os_log_type_t v26 = "unknown-state";
          }
          else {
            os_log_type_t v26 = off_1E523FB38[v25];
          }
          v111 = v26;
          os_log_t log = v21;

          v50 = v24;
          v51 = v50;
          unsigned int v52 = v6[29];
          v53 = v22;
          v54 = "path";
          switch(v52)
          {
            case 0u:
              break;
            case 1u:
              v54 = "resolver";
              break;
            case 2u:
              v54 = nw_endpoint_flow_mode_string(v50[31]);
              break;
            case 3u:
              v54 = "proxy";
              break;
            case 4u:
              v54 = "fallback";
              break;
            case 5u:
              v54 = "transform";
              break;
            default:
              v54 = "unknown-mode";
              break;
          }

          v55 = v51;
          os_unfair_lock_lock(p_lock);
          v8 = v119;
          v56 = v119->current_path;
          os_unfair_lock_unlock(p_lock);

          *(_DWORD *)buf = 136447746;
          v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          __int16 v125 = 2082;
          v126 = id_str;
          __int16 v127 = 2082;
          v128 = v20;
          __int16 v129 = 2082;
          v130 = (void *)v53;
          __int16 v131 = 2082;
          v132 = v111;
          __int16 v133 = 2082;
          v134 = v54;
          __int16 v135 = 2114;
          v136 = v56;
          _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Fallback advisory removed", buf, 0x48u);
        }
LABEL_73:
      }
    }
LABEL_74:
    if (!nw_path_fallback_is_forced(v120) || (*((unsigned char *)self + 108) & 8) != 0) {
      goto LABEL_92;
    }
    v57 = &unk_1EB267000;
    v58 = (id *)&unk_1EB267000;
    if (nw_endpoint_handler_get_minimize_logging(v8))
    {
      if (nw_endpoint_handler_get_logging_disabled(v8))
      {
LABEL_83:
        *((unsigned char *)self + 108) |= 8u;
        if (!self->result)
        {
          nw_endpoint_fallback_start_fallback_child(v8);
          nw_endpoint_handler_cancel(self->primary_child, 0, 1);
          goto LABEL_92;
        }
        if (nw_endpoint_handler_get_minimize_logging(v8))
        {
          if (nw_endpoint_handler_get_logging_disabled(v8)) {
            goto LABEL_92;
          }
          if (v57[191] != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v71 = v58[192];
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            v104 = nw_endpoint_handler_get_id_string(v8);
            v105 = nw_endpoint_handler_dry_run_string(v8);
            nw_endpoint_t v106 = nw_endpoint_handler_copy_endpoint(v8);
            v107 = nw_endpoint_get_logging_description(v106);
            v108 = nw_endpoint_handler_state_string(v8);
            v109 = nw_endpoint_handler_mode_string(v8);
            v110 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
            *(_DWORD *)buf = 136447746;
            v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            __int16 v125 = 2082;
            v126 = (void *)v104;
            __int16 v127 = 2082;
            v128 = v105;
            __int16 v129 = 2082;
            v130 = (void *)v107;
            __int16 v131 = 2082;
            v132 = v108;
            __int16 v133 = 2082;
            v134 = v109;
            __int16 v135 = 2114;
            v136 = v110;
            _os_log_impl(&dword_1830D4000, v71, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring immediate fallback request since race is complete", buf, 0x48u);
          }
        }
        else
        {
          v69 = v8;
          BOOL v70 = (*((unsigned char *)v69 + 268) & 0x20) == 0;

          if (!v70)
          {
LABEL_92:

            goto LABEL_93;
          }
          if (v57[191] != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v71 = v58[192];
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            v72 = nw_endpoint_handler_get_id_string(v69);
            v73 = nw_endpoint_handler_dry_run_string(v69);
            nw_endpoint_t v74 = nw_endpoint_handler_copy_endpoint(v69);
            v75 = nw_endpoint_get_logging_description(v74);
            v76 = nw_endpoint_handler_state_string(v69);
            v77 = nw_endpoint_handler_mode_string(v69);
            v78 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v69);
            *(_DWORD *)buf = 136447746;
            v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
            __int16 v125 = 2082;
            v126 = (void *)v72;
            __int16 v127 = 2082;
            v128 = v73;
            __int16 v129 = 2082;
            v130 = (void *)v75;
            __int16 v131 = 2082;
            v132 = v76;
            __int16 v133 = 2082;
            v134 = v77;
            __int16 v135 = 2114;
            v136 = v78;
            _os_log_impl(&dword_1830D4000, v71, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring immediate fallback request since race is complete", buf, 0x48u);
          }
        }

        goto LABEL_92;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v61 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        logd = nw_endpoint_handler_get_id_string(v8);
        v91 = nw_endpoint_handler_dry_run_string(v8);
        nw_endpoint_t v92 = nw_endpoint_handler_copy_endpoint(v8);
        v93 = nw_endpoint_get_logging_description(v92);
        v94 = nw_endpoint_handler_state_string(v8);
        v95 = nw_endpoint_handler_mode_string(v8);
        v96 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v8);
        *(_DWORD *)buf = 136447746;
        v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        __int16 v125 = 2082;
        v126 = (void *)logd;
        __int16 v127 = 2082;
        v128 = v91;
        __int16 v129 = 2082;
        v130 = (void *)v93;
        __int16 v131 = 2082;
        v132 = v94;
        __int16 v133 = 2082;
        v134 = v95;
        __int16 v135 = 2114;
        v136 = v96;
        _os_log_impl(&dword_1830D4000, v61, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Immediate fallback requested", buf, 0x48u);

        v58 = (id *)&unk_1EB267000;
        v57 = (void *)&unk_1EB267000;
      }
    }
    else
    {
      v59 = v8;
      BOOL v60 = (*((unsigned char *)v59 + 268) & 0x20) == 0;

      if (!v60) {
        goto LABEL_83;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v61 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        v62 = nw_endpoint_handler_get_id_string(v59);
        v63 = nw_endpoint_handler_dry_run_string(v59);
        logb = v61;
        nw_endpoint_t v64 = nw_endpoint_handler_copy_endpoint(v59);
        v65 = nw_endpoint_get_logging_description(v64);
        v66 = nw_endpoint_handler_state_string(v59);
        v67 = nw_endpoint_handler_mode_string(v59);
        v68 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v59);
        *(_DWORD *)buf = 136447746;
        v124 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        __int16 v125 = 2082;
        v126 = (void *)v62;
        __int16 v127 = 2082;
        v128 = v63;
        __int16 v129 = 2082;
        v130 = (void *)v65;
        __int16 v131 = 2082;
        v132 = v66;
        __int16 v133 = 2082;
        v134 = v67;
        __int16 v135 = 2114;
        v136 = v68;
        v61 = logb;
        _os_log_impl(&dword_1830D4000, logb, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Immediate fallback requested", buf, 0x48u);

        v58 = (id *)&unk_1EB267000;
        v57 = &unk_1EB267000;
      }
    }

    goto LABEL_83;
  }
LABEL_93:
}

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    v32 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
    nw_endpoint_t v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v21, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v22 = __nwlog_obj();
        os_log_type_t v33 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v22, v33, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_45;
      }
      if (!v38)
      {
        v22 = __nwlog_obj();
        os_log_type_t v37 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v22, v37, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_45;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v22 = __nwlog_obj();
      os_log_type_t v35 = type;
      BOOL v36 = os_log_type_enabled(v22, type);
      if (!backtrace_string)
      {
        if (v36)
        {
          *(_DWORD *)buf = 136446210;
          char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v22, v35, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_45;
      }
      if (v36)
      {
        *(_DWORD *)buf = 136446466;
        char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
        __int16 v42 = 2082;
        __int16 v43 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v22, v35, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_46:
    if (!v21) {
      goto LABEL_48;
    }
LABEL_47:
    free(v21);
    goto LABEL_48;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 == 4)
  {
    fallback_timer = self->fallback_timer;
    if (fallback_timer)
    {
      nw_queue_cancel_source((uint64_t)fallback_timer);
      self->fallback_timer = 0;
    }
    post_transport_timer = self->post_transport_timer;
    if (post_transport_timer)
    {
      nw_queue_cancel_source((uint64_t)post_transport_timer);
      self->post_transport_timer = 0;
    }
    usage_cap_timer = self->usage_cap_timer;
    if (usage_cap_timer)
    {
      nw_queue_cancel_source((uint64_t)usage_cap_timer);
      self->usage_cap_timer = 0;
    }
    primary_child = self->primary_child;
    if (primary_child) {
      nw_endpoint_handler_cancel(primary_child, v4, 0);
    }
    fallback_child = self->fallback_child;
    if (fallback_child) {
      nw_endpoint_handler_cancel(fallback_child, v4, 0);
    }
    char v15 = self->primary_child;
    self->primary_child = 0;

    v16 = self->fallback_child;
    self->fallback_child = 0;

    primary_interface = self->primary_interface;
    self->primary_interface = 0;

    fallback_interface = self->fallback_interface;
    self->fallback_interface = 0;

    goto LABEL_48;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v19 = (id)gLogObj;
  if (v9 > 5) {
    v20 = "unknown-mode";
  }
  else {
    v20 = off_1E523FB08[v9];
  }
  *(_DWORD *)buf = 136446722;
  char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
  __int16 v42 = 2082;
  __int16 v43 = (void *)v20;
  __int16 v44 = 2082;
  nw_endpoint_t v45 = "fallback";
  nw_endpoint_t v21 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v38 = 0;
  if (!__nwlog_fault(v21, &type, &v38)) {
    goto LABEL_46;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v22 = (id)gLogObj;
    os_log_type_t v23 = type;
    if (os_log_type_enabled(v22, type))
    {
      if (v9 > 5) {
        v24 = "unknown-mode";
      }
      else {
        v24 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
      __int16 v42 = 2082;
      __int16 v43 = (void *)v24;
      __int16 v44 = 2082;
      nw_endpoint_t v45 = "fallback";
      _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_45:

    goto LABEL_46;
  }
  if (!v38)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v22 = (id)gLogObj;
    os_log_type_t v29 = type;
    if (os_log_type_enabled(v22, type))
    {
      if (v9 > 5) {
        os_log_type_t v30 = "unknown-mode";
      }
      else {
        os_log_type_t v30 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
      __int16 v42 = 2082;
      __int16 v43 = (void *)v30;
      __int16 v44 = 2082;
      nw_endpoint_t v45 = "fallback";
      _os_log_impl(&dword_1830D4000, v22, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_45;
  }
  uint64_t v25 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v22 = (id)gLogObj;
  os_log_type_t v26 = type;
  BOOL v27 = os_log_type_enabled(v22, type);
  if (!v25)
  {
    if (v27)
    {
      if (v9 > 5) {
        os_log_type_t v31 = "unknown-mode";
      }
      else {
        os_log_type_t v31 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
      __int16 v42 = 2082;
      __int16 v43 = (void *)v31;
      __int16 v44 = 2082;
      nw_endpoint_t v45 = "fallback";
      _os_log_impl(&dword_1830D4000, v22, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_45;
  }
  if (v27)
  {
    if (v9 > 5) {
      os_log_type_t v28 = "unknown-mode";
    }
    else {
      os_log_type_t v28 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446978;
    char v41 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
    __int16 v42 = 2082;
    __int16 v43 = (void *)v28;
    __int16 v44 = 2082;
    nw_endpoint_t v45 = "fallback";
    __int16 v46 = 2082;
    uint64_t v47 = v25;
    _os_log_impl(&dword_1830D4000, v22, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v25);
  if (v21) {
    goto LABEL_47;
  }
LABEL_48:
}

- (void)startWithHandler:(id)a3
{
  uint64_t v277 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v191 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
    v192 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v255) = 0;
    if (__nwlog_fault(v192, type, &v255))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v193 = __nwlog_obj();
        os_log_type_t v194 = type[0];
        if (os_log_type_enabled(v193, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v193, v194, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if ((_BYTE)v255)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v193 = __nwlog_obj();
        os_log_type_t v196 = type[0];
        BOOL v197 = os_log_type_enabled(v193, type[0]);
        if (backtrace_string)
        {
          if (v197)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v193, v196, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_258;
        }
        if (v197)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v193, v196, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v193 = __nwlog_obj();
        os_log_type_t v198 = type[0];
        if (os_log_type_enabled(v193, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_1830D4000, v193, v198, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_258:
    if (v192) {
      free(v192);
    }
    v5 = 0;
    goto LABEL_206;
  }
  id v6 = (unsigned int *)v4;
  uint64_t v7 = v6[29];

  if (v7 != 4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v24 = (id)gLogObj;
    uint64_t v25 = v5;
    if (v7 > 5) {
      os_log_type_t v26 = "unknown-mode";
    }
    else {
      os_log_type_t v26 = off_1E523FB08[v7];
    }
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2082;
    *(void *)&buf[24] = "fallback";
    BOOL v27 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v255) = 0;
    if (__nwlog_fault(v27, type, &v255))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v28 = (id)gLogObj;
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
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2082;
          *(void *)&buf[24] = "fallback";
          _os_log_impl(&dword_1830D4000, v28, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if ((_BYTE)v255)
      {
        os_log_type_t v31 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v28 = (id)gLogObj;
        os_log_type_t v32 = type[0];
        BOOL v33 = os_log_type_enabled(v28, type[0]);
        if (v31)
        {
          if (v33)
          {
            if (v7 > 5) {
              os_log_type_t v34 = "unknown-mode";
            }
            else {
              os_log_type_t v34 = off_1E523FB08[v7];
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2082;
            *(void *)&buf[24] = "fallback";
            *(_WORD *)&buf[32] = 2082;
            *(void *)&buf[34] = v31;
            _os_log_impl(&dword_1830D4000, v28, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v31);
          if (!v27) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
        if (v33)
        {
          if (v7 > 5) {
            char v41 = "unknown-mode";
          }
          else {
            char v41 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v41;
          *(_WORD *)&buf[22] = 2082;
          *(void *)&buf[24] = "fallback";
          _os_log_impl(&dword_1830D4000, v28, v32, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v28 = (id)gLogObj;
        os_log_type_t v35 = type[0];
        if (os_log_type_enabled(v28, type[0]))
        {
          if (v7 > 5) {
            BOOL v36 = "unknown-mode";
          }
          else {
            BOOL v36 = off_1E523FB08[v7];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2082;
          *(void *)&buf[24] = "fallback";
          _os_log_impl(&dword_1830D4000, v28, v35, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
    }
    if (!v27)
    {
LABEL_34:
      v5 = v25;
      goto LABEL_206;
    }
LABEL_33:
    free(v27);
    goto LABEL_34;
  }
  v8 = v6;
  unsigned int v9 = v8[30];

  if (v9 == 1)
  {
    v237 = v5;
    v241 = v8;
    BOOL v10 = v8;
    char v11 = *((unsigned char *)v10 + 268);
    v246 = v10;

    if ((v11 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v12 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = v246;

        v14 = v13;
        char v15 = *((unsigned char *)v246 + 268);

        if (v15) {
          v16 = "dry-run ";
        }
        else {
          v16 = "";
        }
        nw_endpoint_t v17 = nw_endpoint_handler_copy_endpoint(v14);
        logging_description = nw_endpoint_get_logging_description(v17);
        id v19 = v13 + 168;
        v20 = v14;
        nw_endpoint_t v21 = v20;
        uint64_t v22 = v8[30];
        if (v22 > 5) {
          os_log_type_t v23 = "unknown-state";
        }
        else {
          os_log_type_t v23 = off_1E523FB38[v22];
        }
        v251 = self;

        os_log_type_t v37 = v21;
        char v38 = v37;
        v39 = logging_description;
        v40 = "path";
        switch(v6[29])
        {
          case 0u:
            break;
          case 1u:
            v40 = "resolver";
            break;
          case 2u:
            v40 = nw_endpoint_flow_mode_string(v37[31]);
            break;
          case 3u:
            v40 = "proxy";
            break;
          case 4u:
            v40 = "fallback";
            break;
          case 5u:
            v40 = "transform";
            break;
          default:
            v40 = "unknown-mode";
            break;
        }

        __int16 v42 = v38;
        os_unfair_lock_lock((os_unfair_lock_t)v42 + 28);
        id v43 = v42[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v42 + 28);

        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2082;
        *(void *)&buf[24] = v16;
        *(_WORD *)&buf[32] = 2082;
        *(void *)&buf[34] = v39;
        *(_WORD *)&buf[42] = 2082;
        *(void *)&buf[44] = v23;
        *(_WORD *)&buf[52] = 2082;
        *(void *)&buf[54] = v40;
        *(_WORD *)&buf[62] = 2114;
        *(void *)v275 = v43;
        _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);

        self = v251;
      }
    }
    primary_child = self->primary_child;
    self->primary_child = 0;

    fallback_child = self->fallback_child;
    self->fallback_child = 0;

    primary_interface = self->primary_interface;
    self->primary_interface = 0;

    fallback_interface = self->fallback_interface;
    self->fallback_interface = 0;

    nw_endpoint_t v242 = nw_endpoint_handler_copy_endpoint(v246);
    uint64_t v48 = v246;
    os_unfair_lock_lock((os_unfair_lock_t)v48 + 28);
    v252 = (id *)*((id *)v48 + 8);
    lock = (os_unfair_lock_s *)(v48 + 112);
    os_unfair_lock_unlock((os_unfair_lock_t)v48 + 28);

    v49 = (char *)self + 108;
    if (nw_path_fallback_is_weak(v252)) {
      char v50 = 2;
    }
    else {
      char v50 = 0;
    }
    unsigned char *v49 = *((unsigned char *)self + 108) & 0xFD | v50;
    if (nw_path_fallback_should_not_use_timer(v252)) {
      char v51 = 4;
    }
    else {
      char v51 = 0;
    }
    unsigned char *v49 = *v49 & 0xFB | v51;
    if (nw_path_fallback_is_forced(v252)) {
      char v52 = 8;
    }
    else {
      char v52 = 0;
    }
    unsigned char *v49 = *v49 & 0xF7 | v52;
    if (nw_path_fallback_is_preferred(v252)) {
      char v53 = 16;
    }
    else {
      char v53 = 0;
    }
    unsigned char *v49 = *v49 & 0xEF | v53;
    v54 = v48;
    id v240 = v54[4];
    v250 = v54;

    if ((*v49 & 2) != 0) {
      goto LABEL_94;
    }
    v55 = v240;
    if (v55)
    {
      int v56 = *(_DWORD *)(v55[13] + 72);

      if (v56 != 200 && v56 != 100) {
        goto LABEL_94;
      }
      *((unsigned char *)self + 108) |= 2u;
      if (!nw_endpoint_handler_get_minimize_logging(v54))
      {
        v57 = v54;
        BOOL v58 = (v246[67] & 0x20) == 0;

        if (!v58) {
          goto LABEL_94;
        }
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
        }
        v59 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          BOOL v60 = v57;

          v61 = v60;
          BOOL v62 = (v246[67] & 1) == 0;

          if (v62) {
            v63 = "";
          }
          else {
            v63 = "dry-run ";
          }
          nw_endpoint_t v64 = nw_endpoint_handler_copy_endpoint(v61);
          v65 = nw_endpoint_get_logging_description(v64);
          v66 = v61;
          v67 = v66;
          uint64_t v68 = v241[30];
          v247 = v65;
          if (v68 > 5) {
            v69 = "unknown-state";
          }
          else {
            v69 = off_1E523FB38[v68];
          }
          v243 = v69;

          BOOL v70 = v67;
          v71 = "path";
          switch(v6[29])
          {
            case 0u:
              break;
            case 1u:
              v71 = "resolver";
              break;
            case 2u:
              v71 = nw_endpoint_flow_mode_string(v70[31]);
              break;
            case 3u:
              v71 = "proxy";
              break;
            case 4u:
              v71 = "fallback";
              break;
            case 5u:
              v71 = "transform";
              break;
            default:
              v71 = "unknown-mode";
              break;
          }
          v238 = v71;

          v72 = v60;
          nw_endpoint_t v73 = v64;
          nw_endpoint_t v74 = v70;
          os_unfair_lock_lock(lock);
          id v75 = *((id *)v48 + 8);
          os_unfair_lock_unlock(lock);

          *(_DWORD *)buf = 136447746;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v72 + 21;
          *(_WORD *)&buf[22] = 2082;
          *(void *)&buf[24] = v63;
          *(_WORD *)&buf[32] = 2082;
          *(void *)&buf[34] = v247;
          *(_WORD *)&buf[42] = 2082;
          *(void *)&buf[44] = v243;
          *(_WORD *)&buf[52] = 2082;
          *(void *)&buf[54] = v238;
          *(_WORD *)&buf[62] = 2114;
          *(void *)v275 = v75;
          _os_log_impl(&dword_1830D4000, v59, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Overriding strong fallback to weak fallback for background traffic", buf, 0x48u);
        }
        goto LABEL_93;
      }
      if ((nw_endpoint_handler_get_logging_disabled(v54) & 1) == 0)
      {
        v210 = v48;
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
        }
        v59 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          id_string = nw_endpoint_handler_get_id_string(v54);
          v245 = nw_endpoint_handler_dry_run_string(v54);
          nw_endpoint_t v211 = nw_endpoint_handler_copy_endpoint(v54);
          v212 = nw_endpoint_get_logging_description(v211);
          v213 = nw_endpoint_handler_state_string(v250);
          v214 = nw_endpoint_handler_mode_string(v250);
          id v215 = nw_endpoint_handler_copy_current_path(v250);
          *(_DWORD *)buf = 136447746;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = id_string;
          *(_WORD *)&buf[22] = 2082;
          *(void *)&buf[24] = v245;
          *(_WORD *)&buf[32] = 2082;
          *(void *)&buf[34] = v212;
          *(_WORD *)&buf[42] = 2082;
          *(void *)&buf[44] = v213;
          *(_WORD *)&buf[52] = 2082;
          *(void *)&buf[54] = v214;
          *(_WORD *)&buf[62] = 2114;
          *(void *)v275 = v215;
          _os_log_impl(&dword_1830D4000, v59, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Overriding strong fallback to weak fallback for background traffic", buf, 0x48u);

          uint64_t v48 = v210;
        }
LABEL_93:
      }
LABEL_94:
      id v76 = v240;
      v248 = (NWConcrete_nw_parameters *)-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v76, 0, 0);

      id v77 = v76;
      BOOL v244 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v77, 0, 0);
      v239 = v77;

      if (v252) {
        v78 = (OS_nw_interface *)v252[12];
      }
      else {
        v78 = 0;
      }
      v79 = self->primary_interface;
      self->primary_interface = v78;

      os_log_type_t v80 = v252;
      unsigned int fallback_interface_index = nw_path_get_fallback_interface_index((uint64_t)v252);
      if (fallback_interface_index)
      {
        unsigned int v82 = fallback_interface_index;
        if (nw_context_copy_implicit_context::onceToken != -1) {
          dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_18);
        }
        id v83 = (id)nw_context_copy_implicit_context::implicit_context;
        os_log_type_t v84 = (OS_nw_interface *)nw_path_copy_interface_with_generation(v83, v82, 0);

        v85 = self->fallback_interface;
        self->fallback_interface = v84;

        nw_endpoint_t v86 = self->fallback_interface;
        if (v86)
        {
          v87 = v86;
          int v88 = *((_DWORD *)v87 + 24);

          LOBYTE(v86) = 8 * (v88 == 2);
        }
        char v89 = *((unsigned char *)self + 109) & 0xF7 | v86;
        *((unsigned char *)self + 109) = v89;
        os_log_type_t v80 = v252;
        v90 = (NWConcrete_nw_parameters *)v244;
        if ((v89 & 8) == 0) {
          goto LABEL_106;
        }
      }
      else
      {
        v90 = (NWConcrete_nw_parameters *)v244;
        if ((*((unsigned char *)self + 109) & 8) == 0) {
          goto LABEL_106;
        }
      }
      if ((*((unsigned char *)self + 108) & 0x18) == 0)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        nw_parameters_get_e_proc_uuid(v239, buf);
        nw_parameters_get_pid(v239);
        nw_parameters_get_effective_bundle_id(v239);
        self->fallback_disposition = _symptoms_daemon_fallback_initial_disposition();
        v90 = (NWConcrete_nw_parameters *)v244;
LABEL_107:
        if ((nw_path_update_parameters_for_fallback(v80, v90) & 1) == 0)
        {
          nw_parameters_set_required_interface_type(&v90->super, nw_interface_type_cellular);
          nw_parameters_set_only_primary_requires_type(v90, 1);
          *((unsigned char *)self + 108) |= 0x22u;
        }
        nw_parameters_set_fallback_applied(v248, 1);
        nw_parameters_set_fallback_applied(v90, 1);
        nw_parameters_set_is_fallback(v90, 1);
        if ((*((unsigned char *)self + 108) & 0x10) != 0)
        {
          char v91 = 4;
        }
        else if ((*((unsigned char *)self + 108) & 4) != 0)
        {
          char v91 = 1;
        }
        else if ((*((unsigned char *)self + 108) & 2) != 0)
        {
          char v91 = 2;
        }
        else
        {
          char v91 = 3;
        }
        nw_parameters_set_fallback_mode(v90, v91);
        long long v255 = 0uLL;
        if (nw_path_get_client_id(v80, &v255))
        {
          nw_parameters_set_parent_id_inner(v248, (const unsigned __int8 *)&v255, 0);
          nw_parameters_set_parent_id_inner(v90, (const unsigned __int8 *)&v255, 0);
        }
        if ((*((unsigned char *)self + 108) & 8) == 0)
        {
          if ((*((unsigned char *)self + 108) & 0x10) != 0)
          {
            inner = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v242, v90, nw_endpoint_fallback_receive_report, v250, v250, 0, 0);
            v90 = v248;
          }
          else
          {
            inner = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v242, v248, nw_endpoint_fallback_receive_report, v250, v250, 0, 0);
          }
          nw_endpoint_t v106 = self->primary_child;
          self->primary_child = inner;

          v107 = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v242, v90, nw_endpoint_fallback_receive_report, v250, v250, 0, 0);
          v108 = self->fallback_child;
          self->fallback_child = v107;

          v109 = v250;
          v110 = nw_endpoint_handler_copy_fallback(v109);
          uint64_t v111 = *((void *)v110 + 9);
          v233 = (int64_t *)v110;
          if (v111)
          {
            nw_queue_cancel_source(v111);
            *((void *)v110 + 9) = 0;
          }
          if ((*((unsigned char *)v110 + 108) & 4) != 0) {
            goto LABEL_204;
          }
          locka = v109;
          v231 = v109;
          v112 = nw_endpoint_handler_copy_fallback(locka);
          v232 = v112;
          if ((*((unsigned char *)v112 + 108) & 0x10) != 0)
          {
            v113 = &nw_fallback_delay_max_limit_ms;
            v114 = &nw_setting_tcpconn_fallback_delay_cap_ms;
          }
          else
          {
            if ((*((unsigned char *)v112 + 108) & 2) != 0)
            {
              if ((*((unsigned char *)v112 + 108) & 0x20) != 0)
              {
                unint64_t int64_with_default = networkd_settings_get_int64_with_default((const char *)nw_setting_tcpconn_weak_fallback_delay, 200);
                unint64_t v167 = networkd_settings_get_int64_with_default(nw_setting_tcpconn_fallback_delay_cap_ms, 500);
                int64_t v115 = v167;
                if (int64_with_default <= 0x7FFFFFFFFFFFFFFELL && 2 * int64_with_default < v167) {
                  int64_t v115 = 2 * int64_with_default;
                }
              }
              else
              {
                int64_t v115 = networkd_settings_get_int64_with_default((const char *)nw_setting_tcpconn_weak_fallback_delay, 0);
                if ((unint64_t)(v115 - 0x8637BD05AF6) < 0xFFFFF79C842FA50BLL)
                {
                  int64_t v153 = networkd_settings_get_int64_with_default((const char *)nw_setting_tcpconn_fallback_wifi_advantage_per_rtt_ms, 175);
                  if (v153 <= 0) {
                    unint64_t v154 = 175;
                  }
                  else {
                    unint64_t v154 = v153;
                  }
                  unint64_t v155 = 500;
                  int64_t v156 = networkd_settings_get_int64_with_default(nw_setting_tcpconn_fallback_delay_cap_ms, 500);
                  *(_OWORD *)&v275[16] = 0u;
                  long long v276 = 0u;
                  if ((unint64_t)(v156 - 1) < 0x8637BD05AF5) {
                    unint64_t v155 = v156;
                  }
                  *(_OWORD *)v275 = 0uLL;
                  memset(buf, 0, sizeof(buf));
                  if (nw_endpoint_handler_fillout_route_stats(locka, (uint64_t)buf)) {
                    unint64_t v157 = (DWORD2(v276) + 2 * (unint64_t)HIDWORD(v276)) >> 5;
                  }
                  else {
                    unint64_t v157 = 0;
                  }
                  unint64_t v230 = v157;
                  if (nw_endpoint_handler_fillout_route_stats(*((void **)v232 + 5), (uint64_t)buf)
                    && (unint64_t v170 = DWORD2(v276) + 2 * HIDWORD(v276), v170 > 0x1F))
                  {
                    unint64_t v179 = v170 >> 5;
                  }
                  else if (nw_endpoint_handler_get_logging_disabled(locka))
                  {
                    unint64_t v179 = 200;
                  }
                  else
                  {
                    if (__nwlog_connection_log::onceToken != -1) {
                      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                    }
                    v171 = (id)gconnectionLogObj;
                    if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
                    {
                      v172 = nw_endpoint_handler_get_id_string(locka);
                      v173 = nw_endpoint_handler_dry_run_string(locka);
                      v174 = v172;
                      nw_endpoint_t v228 = nw_endpoint_handler_copy_endpoint(locka);
                      v175 = nw_endpoint_get_logging_description(v228);
                      v176 = nw_endpoint_handler_state_string(locka);
                      v177 = nw_endpoint_handler_mode_string(locka);
                      id v178 = nw_endpoint_handler_copy_current_path(locka);
                      *(_DWORD *)os_log_type_t type = 136448002;
                      v257 = "nw_endpoint_fallback_get_timeout_nanos";
                      __int16 v258 = 2082;
                      v259 = (void *)v174;
                      __int16 v260 = 2082;
                      v261 = v173;
                      __int16 v262 = 2082;
                      v263 = v175;
                      __int16 v264 = 2082;
                      v265 = v176;
                      __int16 v266 = 2082;
                      v267 = v177;
                      __int16 v268 = 2114;
                      id v269 = v178;
                      __int16 v270 = 2048;
                      uint64_t v271 = 200;
                      _os_log_impl(&dword_1830D4000, v171, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] No RTT information for fallback interface, will use a default value %llums", (uint8_t *)type, 0x52u);

                      v109 = v231;
                    }

                    unint64_t v179 = 200;
                    unint64_t v157 = v230;
                  }
                  unint64_t v180 = v157 - v179;
                  if (v157 - v179 <= v154) {
                    unint64_t v180 = v154;
                  }
                  if (v157 <= v179) {
                    unint64_t v180 = v154;
                  }
                  uint64_t v181 = 2 * v180;
                  if (2 * v180 >= v155) {
                    uint64_t v181 = v155;
                  }
                  if (v180 >= 0x7FFFFFFFFFFFFFFFLL) {
                    int64_t v115 = v155;
                  }
                  else {
                    int64_t v115 = v181;
                  }
                  if ((nw_endpoint_handler_get_logging_disabled(locka) & 1) == 0)
                  {
                    if (__nwlog_connection_log::onceToken != -1) {
                      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                    }
                    v182 = (id)gconnectionLogObj;
                    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG))
                    {
                      int64_t v229 = v115;
                      v183 = nw_endpoint_handler_get_id_string(locka);
                      v184 = nw_endpoint_handler_dry_run_string(locka);
                      nw_endpoint_t v185 = nw_endpoint_handler_copy_endpoint(locka);
                      v186 = v184;
                      v187 = nw_endpoint_get_logging_description(v185);
                      v188 = nw_endpoint_handler_state_string(locka);
                      v189 = nw_endpoint_handler_mode_string(locka);
                      id v190 = nw_endpoint_handler_copy_current_path(locka);
                      *(_DWORD *)os_log_type_t type = 136448258;
                      v257 = "nw_endpoint_fallback_get_timeout_nanos";
                      __int16 v258 = 2082;
                      v259 = (void *)v183;
                      __int16 v260 = 2082;
                      v261 = v186;
                      __int16 v262 = 2082;
                      v263 = v187;
                      __int16 v264 = 2082;
                      v265 = v188;
                      __int16 v266 = 2082;
                      v267 = v189;
                      __int16 v268 = 2114;
                      id v269 = v190;
                      __int16 v270 = 2048;
                      uint64_t v271 = v230;
                      __int16 v272 = 2048;
                      unint64_t v273 = v179;
                      _os_log_impl(&dword_1830D4000, v182, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Primary RTT: %llums, fallback RTT: %llums", (uint8_t *)type, 0x5Cu);

                      v109 = v231;
                      int64_t v115 = v229;
                    }
                  }
                }
              }
LABEL_141:
              if ((nw_endpoint_handler_get_logging_disabled(locka) & 1) == 0)
              {
                if (__nwlog_connection_log::onceToken != -1) {
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                }
                v116 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
                {
                  v117 = nw_endpoint_handler_get_id_string(locka);
                  v118 = nw_endpoint_handler_dry_run_string(locka);
                  nw_endpoint_t v119 = nw_endpoint_handler_copy_endpoint(locka);
                  int64_t v120 = v115;
                  char v121 = nw_endpoint_get_logging_description(v119);
                  v122 = nw_endpoint_handler_state_string(locka);
                  v123 = nw_endpoint_handler_mode_string(locka);
                  id v124 = nw_endpoint_handler_copy_current_path(locka);
                  __int16 v125 = v124;
                  char v126 = *((unsigned char *)v232 + 108);
                  __int16 v127 = ", weak";
                  *(_DWORD *)buf = 136448258;
                  *(void *)&uint8_t buf[4] = "nw_endpoint_fallback_get_timeout_nanos";
                  *(_WORD *)&buf[12] = 2082;
                  if ((v126 & 2) == 0) {
                    __int16 v127 = ", strong";
                  }
                  *(void *)&buf[14] = v117;
                  *(_WORD *)&buf[22] = 2082;
                  *(void *)&buf[24] = v118;
                  *(_WORD *)&buf[32] = 2082;
                  *(void *)&buf[34] = v121;
                  *(_WORD *)&buf[42] = 2082;
                  *(void *)&buf[44] = v122;
                  *(_WORD *)&buf[52] = 2082;
                  *(void *)&buf[54] = v123;
                  *(_WORD *)&buf[62] = 2114;
                  *(void *)v275 = v124;
                  *(_WORD *)&v275[8] = 2048;
                  int64_t v115 = v120;
                  *(void *)&v275[10] = v120;
                  *(_WORD *)&v275[18] = 2082;
                  *(void *)&v275[20] = v127;
                  _os_log_impl(&dword_1830D4000, v116, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Setting %llums fallback timer%{public}s", buf, 0x5Cu);

                  v109 = v231;
                }
              }
              v128 = v233;
              v233[3] = 1000000 * v115;
              int minimize_logging = nw_endpoint_handler_get_minimize_logging(locka);
              char logging_disabled = nw_endpoint_handler_get_logging_disabled(locka);
              if (minimize_logging)
              {
                if (logging_disabled)
                {
LABEL_156:
                  id v140 = nw_endpoint_handler_copy_context(locka);
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = ___ZL32nw_endpoint_fallback_start_timerP30NWConcrete_nw_endpoint_handler_block_invoke;
                  *(void *)&buf[24] = &unk_1E524BAA8;
                  *(void *)&buf[32] = locka;
                  v128[9] = nw_queue_context_create_source(v140, 2, 3, 0, buf, 0);

                  if (v128[9])
                  {
                    uint64_t v141 = mach_continuous_time();
                    if (v141 <= 1) {
                      uint64_t v142 = 1;
                    }
                    else {
                      uint64_t v142 = v141;
                    }
                    v233[12] = v142;
                    uint64_t v143 = v233[9];
                    dispatch_time_t v144 = dispatch_time(0x8000000000000000, v233[3]);
                    nw_queue_set_timer_values(v143, v144, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
                    nw_queue_activate_source(v233[9]);
LABEL_203:

                    v110 = (NWConcrete_nw_endpoint_mode_handler *)v233;
LABEL_204:

                    goto LABEL_205;
                  }
                  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                  networkd_settings_init();
                  id v149 = (id)gLogObj;
                  *(_DWORD *)os_log_type_t type = 136446210;
                  v257 = "nw_endpoint_fallback_start_timer";
                  v150 = (char *)_os_log_send_and_compose_impl();

                  os_log_type_t v254 = OS_LOG_TYPE_ERROR;
                  char v253 = 0;
                  if (__nwlog_fault(v150, &v254, &v253))
                  {
                    if (v254 == OS_LOG_TYPE_FAULT)
                    {
                      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                      networkd_settings_init();
                      v151 = (id)gLogObj;
                      os_log_type_t v152 = v254;
                      if (os_log_type_enabled(v151, v254))
                      {
                        *(_DWORD *)os_log_type_t type = 136446210;
                        v257 = "nw_endpoint_fallback_start_timer";
                        _os_log_impl(&dword_1830D4000, v151, v152, "%{public}s nw_queue_context_create_source(timer) failed", (uint8_t *)type, 0xCu);
                      }
                    }
                    else
                    {
                      if (v253)
                      {
                        v158 = (char *)__nw_create_backtrace_string();
                        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                        networkd_settings_init();
                        v159 = (id)gLogObj;
                        os_log_type_t v160 = v254;
                        BOOL v161 = os_log_type_enabled(v159, v254);
                        if (v158)
                        {
                          if (v161)
                          {
                            *(_DWORD *)os_log_type_t type = 136446466;
                            v257 = "nw_endpoint_fallback_start_timer";
                            __int16 v258 = 2082;
                            v259 = v158;
                            _os_log_impl(&dword_1830D4000, v159, v160, "%{public}s nw_queue_context_create_source(timer) failed, dumping backtrace:%{public}s", (uint8_t *)type, 0x16u);
                          }

                          free(v158);
                        }
                        else
                        {
                          if (v161)
                          {
                            *(_DWORD *)os_log_type_t type = 136446210;
                            v257 = "nw_endpoint_fallback_start_timer";
                            _os_log_impl(&dword_1830D4000, v159, v160, "%{public}s nw_queue_context_create_source(timer) failed, no backtrace", (uint8_t *)type, 0xCu);
                          }
                        }
                        goto LABEL_201;
                      }
                      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                      networkd_settings_init();
                      v151 = (id)gLogObj;
                      os_log_type_t v168 = v254;
                      if (os_log_type_enabled(v151, v254))
                      {
                        *(_DWORD *)os_log_type_t type = 136446210;
                        v257 = "nw_endpoint_fallback_start_timer";
                        _os_log_impl(&dword_1830D4000, v151, v168, "%{public}s nw_queue_context_create_source(timer) failed, backtrace limit exceeded", (uint8_t *)type, 0xCu);
                      }
                    }
                  }
LABEL_201:
                  if (v150) {
                    free(v150);
                  }
                  goto LABEL_203;
                }
                if (__nwlog_connection_log::onceToken != -1) {
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                }
                __int16 v131 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                {
                  v216 = nw_endpoint_handler_get_id_string(locka);
                  v217 = nw_endpoint_handler_dry_run_string(locka);
                  nw_endpoint_t v218 = nw_endpoint_handler_copy_endpoint(locka);
                  v219 = nw_endpoint_get_logging_description(v218);
                  v220 = nw_endpoint_handler_state_string(locka);
                  v221 = nw_endpoint_handler_mode_string(locka);
                  id v222 = nw_endpoint_handler_copy_current_path(locka);
                  *(void *)&uint8_t buf[4] = "nw_endpoint_fallback_start_timer";
                  unint64_t v223 = v233[3];
                  *(_DWORD *)buf = 136448002;
                  *(void *)&buf[14] = v216;
                  *(_WORD *)&buf[12] = 2082;
                  *(_WORD *)&buf[22] = 2082;
                  *(void *)&buf[24] = v217;
                  *(_WORD *)&buf[32] = 2082;
                  *(void *)&buf[34] = v219;
                  *(_WORD *)&buf[42] = 2082;
                  *(void *)&buf[44] = v220;
                  *(_WORD *)&buf[52] = 2082;
                  *(void *)&buf[54] = v221;
                  *(_WORD *)&buf[62] = 2114;
                  *(void *)v275 = v222;
                  *(_WORD *)&v275[8] = 2048;
                  *(void *)&v275[10] = v223 / 0xF4240;
                  _os_log_impl(&dword_1830D4000, v131, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] starting fallback endpoint in %llums", buf, 0x52u);

                  v109 = v231;
                }
                else
                {
                  v109 = v231;
                }
              }
              else
              {
                if (logging_disabled) {
                  goto LABEL_156;
                }
                if (__nwlog_connection_log::onceToken != -1) {
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                }
                __int16 v131 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
                {
                  v132 = nw_endpoint_handler_get_id_string(locka);
                  __int16 v133 = nw_endpoint_handler_dry_run_string(locka);
                  nw_endpoint_t v134 = nw_endpoint_handler_copy_endpoint(locka);
                  __int16 v135 = nw_endpoint_get_logging_description(v134);
                  v136 = nw_endpoint_handler_state_string(locka);
                  uint64_t v137 = nw_endpoint_handler_mode_string(locka);
                  id v138 = nw_endpoint_handler_copy_current_path(locka);
                  *(void *)&uint8_t buf[4] = "nw_endpoint_fallback_start_timer";
                  unint64_t v139 = v233[3];
                  *(_DWORD *)buf = 136448002;
                  *(void *)&buf[14] = v132;
                  *(_WORD *)&buf[12] = 2082;
                  *(_WORD *)&buf[22] = 2082;
                  *(void *)&buf[24] = v133;
                  *(_WORD *)&buf[32] = 2082;
                  *(void *)&buf[34] = v135;
                  *(_WORD *)&buf[42] = 2082;
                  *(void *)&buf[44] = v136;
                  *(_WORD *)&buf[52] = 2082;
                  *(void *)&buf[54] = v137;
                  *(_WORD *)&buf[62] = 2114;
                  *(void *)v275 = v138;
                  *(_WORD *)&v275[8] = 2048;
                  *(void *)&v275[10] = v139 / 0xF4240;
                  _os_log_impl(&dword_1830D4000, v131, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] starting fallback endpoint in %llums", buf, 0x52u);

                  v109 = v231;
                }
              }

              v128 = v233;
              goto LABEL_156;
            }
            v113 = &nw_default_strong_fallback_delay_ms;
            v114 = &nw_setting_tcpconn_strong_fallback_delay;
          }
          int64_t v115 = networkd_settings_get_int64_with_default(*v114, *v113);
          goto LABEL_141;
        }
        if (nw_endpoint_handler_get_minimize_logging(v250))
        {
          if (nw_endpoint_handler_get_logging_disabled(v250)) {
            goto LABEL_190;
          }
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v95 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            v203 = nw_endpoint_handler_get_id_string(v250);
            v204 = nw_endpoint_handler_dry_run_string(v250);
            nw_endpoint_t v205 = nw_endpoint_handler_copy_endpoint(v250);
            v206 = nw_endpoint_get_logging_description(v205);
            v207 = nw_endpoint_handler_state_string(v250);
            v208 = nw_endpoint_handler_mode_string(v250);
            id v209 = nw_endpoint_handler_copy_current_path(v250);
            *(_DWORD *)buf = 136447746;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v203;
            *(_WORD *)&buf[22] = 2082;
            *(void *)&buf[24] = v204;
            *(_WORD *)&buf[32] = 2082;
            *(void *)&buf[34] = v206;
            *(_WORD *)&buf[42] = 2082;
            *(void *)&buf[44] = v207;
            *(_WORD *)&buf[52] = 2082;
            *(void *)&buf[54] = v208;
            *(_WORD *)&buf[62] = 2114;
            *(void *)v275 = v209;
            _os_log_impl(&dword_1830D4000, v95, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] fallback advisory is forced", buf, 0x48u);
          }
        }
        else
        {
          v93 = v250;
          BOOL v94 = (v246[67] & 0x20) == 0;

          if (!v94)
          {
LABEL_190:
            v164 = (NWConcrete_nw_endpoint_handler *)nw_endpoint_handler_create_inner(v242, (void *)v244, nw_endpoint_fallback_receive_report, v250, v250, 0, 0);
            v165 = self->primary_child;
            self->primary_child = v164;

LABEL_205:
            v169 = v250;
            v241[30] = 2;

            *((_DWORD *)v169 + 20) = 65541;
            nw_endpoint_handler_report(v169, 0, (_WORD *)v169 + 40, 0);
            nw_endpoint_handler_start(self->primary_child);

            v5 = v237;
            goto LABEL_206;
          }
          if (__nwlog_connection_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
          }
          v95 = (id)gconnectionLogObj;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
          {
            v96 = v93;

            v97 = v96;
            BOOL v98 = (v246[67] & 1) == 0;

            if (v98) {
              nw_endpoint_t v99 = "";
            }
            else {
              nw_endpoint_t v99 = "dry-run ";
            }
            nw_endpoint_t v100 = nw_endpoint_handler_copy_endpoint(v97);
            v101 = nw_endpoint_get_logging_description(v100);
            v102 = v97;
            v103 = v102;
            uint64_t v104 = v241[30];
            if (v104 > 5) {
              v105 = "unknown-state";
            }
            else {
              v105 = off_1E523FB38[v104];
            }
            v234 = v105;

            v145 = v103;
            v146 = v145;
            unsigned int v147 = v6[29];
            v148 = "path";
            switch(v147)
            {
              case 0u:
                break;
              case 1u:
                v148 = "resolver";
                break;
              case 2u:
                v148 = nw_endpoint_flow_mode_string(v145[31]);
                break;
              case 3u:
                v148 = "proxy";
                break;
              case 4u:
                v148 = "fallback";
                break;
              case 5u:
                v148 = "transform";
                break;
              default:
                v148 = "unknown-mode";
                break;
            }

            v162 = v146;
            os_unfair_lock_lock(lock);
            id v163 = *((id *)v48 + 8);
            os_unfair_lock_unlock(lock);

            *(_DWORD *)buf = 136447746;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v96 + 21;
            *(_WORD *)&buf[22] = 2082;
            *(void *)&buf[24] = v99;
            *(_WORD *)&buf[32] = 2082;
            *(void *)&buf[34] = v101;
            *(_WORD *)&buf[42] = 2082;
            *(void *)&buf[44] = v234;
            *(_WORD *)&buf[52] = 2082;
            *(void *)&buf[54] = v148;
            *(_WORD *)&buf[62] = 2114;
            *(void *)v275 = v163;
            _os_log_impl(&dword_1830D4000, v95, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] fallback advisory is forced", buf, 0x48u);
          }
        }

        goto LABEL_190;
      }
LABEL_106:
      self->fallback_disposition = 1;
      goto LABEL_107;
    }
    v199 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_parameters_traffic_class_is_background";
    v200 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v255) = 0;
    if (__nwlog_fault(v200, type, &v255))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v201 = __nwlog_obj();
        os_log_type_t v202 = type[0];
        if (os_log_type_enabled(v201, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_parameters_traffic_class_is_background";
          _os_log_impl(&dword_1830D4000, v201, v202, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if ((_BYTE)v255)
      {
        v224 = (char *)__nw_create_backtrace_string();
        v201 = __nwlog_obj();
        os_log_type_t v225 = type[0];
        BOOL v226 = os_log_type_enabled(v201, type[0]);
        if (v224)
        {
          if (v226)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "nw_parameters_traffic_class_is_background";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v224;
            _os_log_impl(&dword_1830D4000, v201, v225, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v224);
          goto LABEL_284;
        }
        if (v226)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_parameters_traffic_class_is_background";
          _os_log_impl(&dword_1830D4000, v201, v225, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v201 = __nwlog_obj();
        os_log_type_t v227 = type[0];
        if (os_log_type_enabled(v201, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_parameters_traffic_class_is_background";
          _os_log_impl(&dword_1830D4000, v201, v227, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_284:
    if (v200) {
      free(v200);
    }
    v59 = 0;
    goto LABEL_93;
  }
LABEL_206:
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_endpoint_fallback;
  [(NWConcrete_nw_endpoint_fallback *)&v2 dealloc];
}

- (NWConcrete_nw_endpoint_fallback)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_endpoint_fallback;
  objc_super v2 = [(NWConcrete_nw_endpoint_fallback *)&v16 init];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
    goto LABEL_3;
  }
  id v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v18 = "-[NWConcrete_nw_endpoint_fallback init]";
  uint64_t v7 = (char *)_os_log_send_and_compose_impl();

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
        os_log_type_t v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
          os_log_type_t v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        os_log_type_t v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        os_log_type_t v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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

@end