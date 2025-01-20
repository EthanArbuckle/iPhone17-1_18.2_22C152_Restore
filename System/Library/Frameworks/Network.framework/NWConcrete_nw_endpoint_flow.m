@interface NWConcrete_nw_endpoint_flow
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_flow)init;
- (id).cxx_construct;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_flow

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 616) = 0u;
  *(_OWORD *)((char *)self + 632) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 536) = 0u;
  *((_OWORD *)self + 43) = 0u;
  *((void *)self + 90) = 0;
  *((void *)self + 97) = 0;
  return self;
}

- (NWConcrete_nw_endpoint_flow)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_endpoint_flow;
  v2 = [(NWConcrete_nw_endpoint_flow *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->pre_connected_fd = -1;
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
          v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
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
        v18 = "-[NWConcrete_nw_endpoint_flow init]";
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

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (uint64_t (**)(void))a4;
  if (!v6)
  {
    v25 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
    os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v36 = 0;
    if (!__nwlog_fault(v13, &type, &v36)) {
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      char v14 = __nwlog_obj();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v26, "%{public}s called with null handler", buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (!v36)
    {
      char v14 = __nwlog_obj();
      os_log_type_t v34 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v34, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_38;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    char v14 = __nwlog_obj();
    os_log_type_t v30 = type;
    BOOL v31 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v30, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (v31)
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
      __int16 v40 = 2082;
      v41 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v14, v30, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_62:

    free(backtrace_string);
    goto LABEL_39;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 != 2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v11 = (id)gLogObj;
    if (v9 > 5) {
      BOOL v12 = "unknown-mode";
    }
    else {
      BOOL v12 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446722;
    v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
    __int16 v40 = 2082;
    v41 = (void *)v12;
    __int16 v42 = 2082;
    v43 = "flow";
    os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v36 = 0;
    if (__nwlog_fault(v13, &type, &v36))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v14 = (id)gLogObj;
        os_log_type_t v15 = type;
        if (os_log_type_enabled(v14, type))
        {
          if (v9 > 5) {
            objc_super v16 = "unknown-mode";
          }
          else {
            objc_super v16 = off_1E523FB08[v9];
          }
          *(_DWORD *)buf = 136446722;
          v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
          __int16 v40 = 2082;
          v41 = (void *)v16;
          __int16 v42 = 2082;
          v43 = "flow";
          _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v36)
      {
        v17 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v14 = (id)gLogObj;
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
            v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
            __int16 v40 = 2082;
            v41 = (void *)v20;
            __int16 v42 = 2082;
            v43 = "flow";
            __int16 v44 = 2082;
            v45 = v17;
            _os_log_impl(&dword_1830D4000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v17);
          if (!v13) {
            goto LABEL_41;
          }
          goto LABEL_40;
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
          v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
          __int16 v40 = 2082;
          v41 = (void *)v23;
          __int16 v42 = 2082;
          v43 = "flow";
          _os_log_impl(&dword_1830D4000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v14 = (id)gLogObj;
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
          v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
          __int16 v40 = 2082;
          v41 = (void *)v22;
          __int16 v42 = 2082;
          v43 = "flow";
          _os_log_impl(&dword_1830D4000, v14, v21, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_38;
    }
LABEL_39:
    if (!v13)
    {
LABEL_41:
      char v10 = 1;
      goto LABEL_42;
    }
LABEL_40:
    free(v13);
    goto LABEL_41;
  }
  if (!v7)
  {
    v27 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
    os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v36 = 0;
    if (!__nwlog_fault(v13, &type, &v36)) {
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      char v14 = __nwlog_obj();
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v28, "%{public}s called with null applyBlock", buf, 0xCu);
      }
LABEL_38:

      goto LABEL_39;
    }
    if (!v36)
    {
      char v14 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v35, "%{public}s called with null applyBlock, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_38;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    char v14 = __nwlog_obj();
    os_log_type_t v32 = type;
    BOOL v33 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v33)
      {
        *(_DWORD *)buf = 136446210;
        v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
        _os_log_impl(&dword_1830D4000, v14, v32, "%{public}s called with null applyBlock, no backtrace", buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (v33)
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[NWConcrete_nw_endpoint_flow applyWithHandler:toChildren:]";
      __int16 v40 = 2082;
      v41 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v14, v32, "%{public}s called with null applyBlock, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_62;
  }
  if (self->child_endpoint_handler) {
    char v10 = v7[2](v7);
  }
  else {
    char v10 = 0;
  }
LABEL_42:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connection_wide_metadata, 0);
  objc_storeStrong((id *)&self->connected_metadata, 0);
  objc_storeStrong(&self->metadata_changed_event_handler, 0);
  objc_storeStrong(&self->keepalive_event_handler, 0);
  objc_storeStrong(&self->adaptive_write_event_handler, 0);
  objc_storeStrong(&self->adaptive_read_event_handler, 0);
  objc_storeStrong((id *)&self->saved_original_endpoint, 0);
  objc_storeStrong((id *)&self->flow_divert_endpoint, 0);
  objc_storeStrong((id *)&self->flow_divert_token, 0);
  objc_storeStrong((id *)&self->candidate_endpoint_handlers, 0);
  objc_storeStrong((id *)&self->connected_endpoint_handler, 0);
  objc_storeStrong((id *)&self->child_endpoint_handler, 0);
  objc_storeStrong((id *)&self->channel, 0);
  objc_storeStrong((id *)&self->connected_fd_wrapper, 0);
  objc_storeStrong((id *)&self->last_error, 0);
  objc_storeStrong(&self->write_close_handler, 0);
  objc_storeStrong(&self->read_close_handler, 0);
  objc_storeStrong((id *)&self->client_queue, 0);
  objc_storeStrong((id *)&self->flow_registration, 0);
  if (*((unsigned char *)&self->multiplexed_message_protocol + 8)) {
    nw::release_if_needed<nw_protocol *>((uint64_t *)&self->multiplexed_message_protocol);
  }
  self->multiplexed_message_protocol.m_obj = 0;
  objc_storeStrong((id *)&self->multiplexed_message_definition, 0);
  if (*((unsigned char *)&self->transport_protocol + 8)) {
    nw::release_if_needed<nw_protocol *>((uint64_t *)&self->transport_protocol);
  }
  self->transport_protocol.m_obj = 0;
  objc_storeStrong((id *)&self->new_flow_read_requests, 0);

  objc_storeStrong((id *)&self->clone_from_flow, 0);
  objc_storeStrong((id *)&self->internally_retained_object, 0);
  objc_storeStrong((id *)&self->flow_path, 0);

  objc_storeStrong((id *)&self->connected_path, 0);
}

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v90 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
    v24 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_shared_protocol) = 0;
    if (__nwlog_fault(v24, type, &p_shared_protocol))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v25 = __nwlog_obj();
        os_log_type_t v91 = type[0];
        if (os_log_type_enabled(v25, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v25, v91, "%{public}s called with null handler", buf, 0xCu);
        }
        goto LABEL_77;
      }
      if (!(_BYTE)p_shared_protocol)
      {
        v25 = __nwlog_obj();
        os_log_type_t v95 = type[0];
        if (os_log_type_enabled(v25, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v25, v95, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_77;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v25 = __nwlog_obj();
      os_log_type_t v93 = type[0];
      BOOL v94 = os_log_type_enabled(v25, type[0]);
      if (!backtrace_string)
      {
        if (v94)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          _os_log_impl(&dword_1830D4000, v25, v93, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
        goto LABEL_77;
      }
      if (v94)
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
        __int16 v137 = 2082;
        v138 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v25, v93, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
LABEL_78:
    if (!v24) {
      goto LABEL_80;
    }
LABEL_79:
    free(v24);
    goto LABEL_80;
  }
  v8 = (unsigned int *)v6;
  uint64_t v9 = v8[29];

  if (v9 == 2)
  {
    if (*((unsigned char *)self + 32)) {
      goto LABEL_5;
    }
    if (self->multiplexed_message_definition) {
      goto LABEL_5;
    }
    default_input_handler = (nw_flow_protocol *)self->shared_protocol.protocol.default_input_handler;
    if (!default_input_handler) {
      goto LABEL_5;
    }
    name = default_input_handler->protocol.identifier->name;
    if (name)
    {
      if (!strcmp(default_input_handler->protocol.identifier->name, "endpoint_flow") || !strcmp(name, "flow_replay")) {
        goto LABEL_5;
      }
    }
    output_handler = (nw_flow_protocol *)self->shared_protocol.protocol.output_handler;
    if (!output_handler) {
      goto LABEL_5;
    }
    callbacks = output_handler->protocol.callbacks;
    if (!callbacks) {
      goto LABEL_5;
    }
    replace_input_handler = (uint64_t (*)(nw_flow_protocol *, nw_flow_protocol *, nw_flow_protocol *))callbacks->replace_input_handler;
    if (!replace_input_handler
      || (nw_flow_protocol *)default_input_handler->protocol.output_handler != &self->shared_protocol)
    {
      goto LABEL_5;
    }
    handle = output_handler->protocol.handle;
    if (handle == &nw_protocol_ref_counted_handle)
    {
      v54 = (char *)output_handler->listen_protocol.handle;
      if (v54) {
        output_handler->listen_protocol.handle = v54 + 1;
      }
      char v42 = -1;
    }
    else
    {
      char v42 = 0;
    }
    *(void *)buf = output_handler;
    buf[8] = v42;
    v55 = self->shared_protocol.protocol.handle;
    if (v55 == &nw_protocol_ref_counted_handle)
    {
      v57 = (char *)self->shared_protocol.listen_protocol.handle;
      if (v57) {
        self->shared_protocol.listen_protocol.handle = v57 + 1;
      }
      char v56 = -1;
    }
    else
    {
      char v56 = 0;
    }
    *(void *)os_log_type_t type = &self->shared_protocol;
    char v135 = v56;
    v58 = default_input_handler->protocol.handle;
    log = handle;
    v122 = v55;
    if (v58 == &nw_protocol_ref_counted_handle)
    {
      v60 = (char *)default_input_handler->listen_protocol.handle;
      if (v60) {
        default_input_handler->listen_protocol.handle = v60 + 1;
      }
      char v59 = -1;
    }
    else
    {
      char v59 = 0;
    }
    p_shared_protocol = default_input_handler;
    char v133 = v59;
    int v61 = replace_input_handler(output_handler, &self->shared_protocol, default_input_handler);
    if (v58 == &nw_protocol_ref_counted_handle) {
      nw::release_if_needed<nw_protocol *>((uint64_t *)&p_shared_protocol);
    }
    if (v122 == &nw_protocol_ref_counted_handle) {
      nw::release_if_needed<nw_protocol *>((uint64_t *)type);
    }
    if (log == &nw_protocol_ref_counted_handle) {
      nw::release_if_needed<nw_protocol *>((uint64_t *)buf);
    }
    if (!v61)
    {
      if ((nw_endpoint_handler_get_logging_disabled(v8) & 1) == 0)
      {
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
        }
        v71 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          id_string = nw_endpoint_handler_get_id_string(v8);
          v73 = nw_endpoint_handler_dry_run_string(v8);
          logb = v71;
          v74 = id_string;
          nw_endpoint_t v123 = nw_endpoint_handler_copy_endpoint(v8);
          logging_description = nw_endpoint_get_logging_description(v123);
          v76 = nw_endpoint_handler_state_string(v8);
          v77 = nw_endpoint_handler_mode_string(v8);
          id v78 = nw_endpoint_handler_copy_current_path(v8);
          *(_DWORD *)buf = 136447746;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          __int16 v137 = 2082;
          v138 = (void *)v74;
          __int16 v139 = 2082;
          v140 = v73;
          __int16 v141 = 2082;
          v142 = (void *)logging_description;
          __int16 v143 = 2082;
          v144 = v76;
          __int16 v145 = 2082;
          v146 = v77;
          __int16 v147 = 2114;
          id v148 = v78;
          v71 = logb;
          _os_log_impl(&dword_1830D4000, logb, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Failed to remove passthrough protocol from the stack on cancellation", buf, 0x48u);
        }
        goto LABEL_123;
      }
LABEL_5:
      char v10 = self->shared_protocol.protocol.output_handler;
      int v11 = 1;
      if (!v10 || v4 || (*((_WORD *)&self->shared_protocol + 166) & 0x800) != 0 || (*((unsigned char *)self + 35) & 6) != 0)
      {
        if ((*((unsigned char *)self + 34) & 0x10) == 0)
        {
LABEL_11:
          os_unfair_lock_lock(&self->lock);
          connected_path = self->connected_path;
          self->connected_path = 0;

          connected_metadata = self->connected_metadata;
          self->connected_metadata = 0;

          connection_wide_metadata = self->connection_wide_metadata;
          self->connection_wide_metadata = 0;

          connected_endpoint_handler = self->connected_endpoint_handler;
          self->connected_endpoint_handler = 0;

          os_unfair_lock_unlock(&self->lock);
          nw_endpoint_flow_cleanup_protocol(v8, (uint64_t)&self->shared_protocol, 0);
          os_unfair_lock_lock(&self->lock);
          candidate_endpoint_handlers = self->candidate_endpoint_handlers;
          self->candidate_endpoint_handlers = 0;

          os_unfair_lock_unlock(&self->lock);
          new_flow_read_requests = self->new_flow_read_requests;
          os_log_type_t v18 = -[NWConcrete_nw_error initWithDomain:code:]([NWConcrete_nw_error alloc], 1, 89);
          nw_read_request_report_error_with_override(new_flow_read_requests, 0, v18);

          BOOL v19 = self->new_flow_read_requests;
          self->new_flow_read_requests = 0;

          if (v11) {
            nw_endpoint_flow_failed_with_error(v8, 0, 0);
          }
          child_endpoint_handler = self->child_endpoint_handler;
          if (child_endpoint_handler)
          {
            nw_endpoint_handler_cancel(child_endpoint_handler, v4, 0);
            os_log_type_t v21 = self->child_endpoint_handler;
          }
          else
          {
            os_log_type_t v21 = 0;
          }
          self->child_endpoint_handler = 0;

          *((unsigned char *)self + 35) &= ~4u;
          last_error = self->last_error;
          self->last_error = 0;

          flow_divert_token = self->flow_divert_token;
          self->flow_divert_token = 0;

          flow_divert_endpoint = self->flow_divert_endpoint;
          self->flow_divert_endpoint = 0;

          saved_original_endpoint = self->saved_original_endpoint;
          self->saved_original_endpoint = 0;

          goto LABEL_80;
        }
LABEL_10:
        nw_endpoint_flow_reset_expected_progress_target(v8, 0, self->connection_uuid);
        goto LABEL_11;
      }
      uint64_t v46 = v10->handle;
      if (v46 == &nw_protocol_ref_counted_handle)
      {
        v48 = v10[1].callbacks;
        if (v48) {
          v10[1].callbacks = (nw_protocol_callbacks *)((char *)&v48->add_input_handler + 1);
        }
        *(void *)os_log_type_t type = v10;
        char v47 = v135 | 1;
      }
      else
      {
        *(void *)os_log_type_t type = self->shared_protocol.protocol.output_handler;
        char v47 = v135 & 0xFE;
      }
      char v135 = v47;
      v49 = self->shared_protocol.protocol.handle;
      if (v49 == &nw_protocol_ref_counted_handle)
      {
        v51 = (char *)self->shared_protocol.listen_protocol.handle;
        if (v51) {
          self->shared_protocol.listen_protocol.handle = v51 + 1;
        }
        p_shared_protocol = &self->shared_protocol;
        char v50 = v133 | 1;
      }
      else
      {
        p_shared_protocol = &self->shared_protocol;
        char v50 = v133 & 0xFE;
      }
      char v133 = v50;
      v52 = v10->callbacks;
      if (v52)
      {
        disconnect = (void (*)(nw_protocol *, nw_flow_protocol *))v52->disconnect;
        if (disconnect)
        {
          disconnect(v10, &self->shared_protocol);
          goto LABEL_69;
        }
      }
      v96 = __nwlog_obj();
      v97 = v10->identifier->name;
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "__nw_protocol_disconnect";
      if (!v97) {
        v97 = "invalid";
      }
      __int16 v137 = 2082;
      v138 = (void *)v97;
      __int16 v139 = 2048;
      v140 = (const char *)v10;
      loga = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v131 = OS_LOG_TYPE_ERROR;
      char v130 = 0;
      if (__nwlog_fault(loga, &v131, &v130))
      {
        if (v131 == OS_LOG_TYPE_FAULT)
        {
          v98 = __nwlog_obj();
          os_log_type_t v119 = v131;
          if (os_log_type_enabled(v98, v131))
          {
            v99 = v10->identifier->name;
            if (!v99) {
              v99 = "invalid";
            }
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "__nw_protocol_disconnect";
            __int16 v137 = 2082;
            v138 = (void *)v99;
            __int16 v139 = 2048;
            v140 = (const char *)v10;
            _os_log_impl(&dword_1830D4000, v98, v119, "%{public}s protocol %{public}s (%p) has invalid disconnect callback", buf, 0x20u);
          }
        }
        else
        {
          if (v130)
          {
            v100 = (char *)__nw_create_backtrace_string();
            v120 = __nwlog_obj();
            os_log_type_t v118 = v131;
            BOOL v101 = os_log_type_enabled(v120, v131);
            if (v100)
            {
              if (v101)
              {
                v102 = v10->identifier->name;
                if (!v102) {
                  v102 = "invalid";
                }
                *(_DWORD *)buf = 136446978;
                *(void *)&uint8_t buf[4] = "__nw_protocol_disconnect";
                __int16 v137 = 2082;
                v138 = (void *)v102;
                __int16 v139 = 2048;
                v140 = (const char *)v10;
                __int16 v141 = 2082;
                v142 = v100;
                _os_log_impl(&dword_1830D4000, v120, v118, "%{public}s protocol %{public}s (%p) has invalid disconnect callback, dumping backtrace:%{public}s", buf, 0x2Au);
              }

              free(v100);
            }
            else
            {
              if (v101)
              {
                v104 = v10->identifier->name;
                if (!v104) {
                  v104 = "invalid";
                }
                *(_DWORD *)buf = 136446722;
                *(void *)&uint8_t buf[4] = "__nw_protocol_disconnect";
                __int16 v137 = 2082;
                v138 = (void *)v104;
                __int16 v139 = 2048;
                v140 = (const char *)v10;
                _os_log_impl(&dword_1830D4000, v120, v118, "%{public}s protocol %{public}s (%p) has invalid disconnect callback, no backtrace", buf, 0x20u);
              }
            }
            goto LABEL_186;
          }
          v98 = __nwlog_obj();
          os_log_type_t v121 = v131;
          if (os_log_type_enabled(v98, v131))
          {
            v103 = v10->identifier->name;
            if (!v103) {
              v103 = "invalid";
            }
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "__nw_protocol_disconnect";
            __int16 v137 = 2082;
            v138 = (void *)v103;
            __int16 v139 = 2048;
            v140 = (const char *)v10;
            _os_log_impl(&dword_1830D4000, v98, v121, "%{public}s protocol %{public}s (%p) has invalid disconnect callback, backtrace limit exceeded", buf, 0x20u);
          }
        }
      }
LABEL_186:
      if (loga) {
        free(loga);
      }
LABEL_69:
      if (v49 == &nw_protocol_ref_counted_handle) {
        nw::release_if_needed<nw_protocol *>((uint64_t *)&p_shared_protocol);
      }
      if (v46 == &nw_protocol_ref_counted_handle) {
        nw::release_if_needed<nw_protocol *>((uint64_t *)type);
      }
      int v11 = 0;
      if ((*((unsigned char *)self + 34) & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    v62 = self->shared_protocol.protocol.output_handler;
    if (v62)
    {
      nw_protocol_release(v62);
      self->shared_protocol.protocol.output_handler = 0;
    }
    v63 = self->shared_protocol.protocol.default_input_handler;
    if (v63)
    {
      nw_protocol_release(v63);
      self->shared_protocol.protocol.default_input_handler = 0;
    }
    retained_flow = self->shared_protocol.retained_flow;
    self->shared_protocol.retained_flow = 0;

    v65 = (NWConcrete_nw_endpoint_flow *)default_input_handler->protocol.output_handler;
    BOOL v67 = v65 != (NWConcrete_nw_endpoint_flow *)&self->shared_protocol && v65 != 0;
    if (v65 != (NWConcrete_nw_endpoint_flow *)output_handler && !v67)
    {
      nw_protocol_release(v65);
      default_input_handler->protocol.output_handler = &output_handler->protocol;
      if (output_handler->protocol.handle == &nw_protocol_ref_counted_handle)
      {
        v68 = (char *)output_handler->listen_protocol.handle;
        if (v68) {
          output_handler->listen_protocol.handle = v68 + 1;
        }
      }
    }
    v69 = default_input_handler->protocol.handle;
    if (v69 == &nw_protocol_ref_counted_handle)
    {
      v79 = (char *)default_input_handler->listen_protocol.handle;
      if (v79) {
        default_input_handler->listen_protocol.handle = v79 + 1;
      }
      char v70 = -1;
    }
    else
    {
      char v70 = 0;
    }
    *(void *)os_log_type_t type = default_input_handler;
    char v135 = v70;
    v80 = output_handler->protocol.handle;
    if (v80 == &nw_protocol_ref_counted_handle)
    {
      v82 = (char *)output_handler->listen_protocol.handle;
      if (v82) {
        output_handler->listen_protocol.handle = v82 + 1;
      }
      char v81 = -1;
    }
    else
    {
      char v81 = 0;
    }
    p_shared_protocol = output_handler;
    char v133 = v81;
    v83 = default_input_handler->protocol.callbacks;
    if (v83)
    {
      notify = (void (*)(void, void, void, void, void))v83->notify;
      if (notify)
      {
        notify(default_input_handler, output_handler, 26, 0, 0);
        if (v80 != &nw_protocol_ref_counted_handle) {
          goto LABEL_136;
        }
        goto LABEL_135;
      }
    }
    v105 = __nwlog_obj();
    v106 = default_input_handler->protocol.identifier->name;
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "__nw_protocol_notify";
    if (!v106) {
      v106 = "invalid";
    }
    __int16 v137 = 2082;
    v138 = (void *)v106;
    __int16 v139 = 2048;
    v140 = (const char *)default_input_handler;
    v107 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v131 = OS_LOG_TYPE_ERROR;
    char v130 = 0;
    if (__nwlog_fault(v107, &v131, &v130))
    {
      if (v131 == OS_LOG_TYPE_FAULT)
      {
        v108 = __nwlog_obj();
        os_log_type_t v109 = v131;
        if (os_log_type_enabled(v108, v131))
        {
          v110 = default_input_handler->protocol.identifier->name;
          if (!v110) {
            v110 = "invalid";
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "__nw_protocol_notify";
          __int16 v137 = 2082;
          v138 = (void *)v110;
          __int16 v139 = 2048;
          v140 = (const char *)default_input_handler;
          _os_log_impl(&dword_1830D4000, v108, v109, "%{public}s protocol %{public}s (%p) has invalid notify callback", buf, 0x20u);
        }
LABEL_196:

        goto LABEL_214;
      }
      if (!v130)
      {
        v108 = __nwlog_obj();
        os_log_type_t v115 = v131;
        if (os_log_type_enabled(v108, v131))
        {
          v116 = default_input_handler->protocol.identifier->name;
          if (!v116) {
            v116 = "invalid";
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "__nw_protocol_notify";
          __int16 v137 = 2082;
          v138 = (void *)v116;
          __int16 v139 = 2048;
          v140 = (const char *)default_input_handler;
          _os_log_impl(&dword_1830D4000, v108, v115, "%{public}s protocol %{public}s (%p) has invalid notify callback, backtrace limit exceeded", buf, 0x20u);
        }
        goto LABEL_196;
      }
      v111 = (char *)__nw_create_backtrace_string();
      v112 = __nwlog_obj();
      os_log_type_t v125 = v131;
      BOOL v113 = os_log_type_enabled(v112, v131);
      if (v111)
      {
        if (v113)
        {
          v114 = default_input_handler->protocol.identifier->name;
          if (!v114) {
            v114 = "invalid";
          }
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "__nw_protocol_notify";
          __int16 v137 = 2082;
          v138 = (void *)v114;
          __int16 v139 = 2048;
          v140 = (const char *)default_input_handler;
          __int16 v141 = 2082;
          v142 = v111;
          _os_log_impl(&dword_1830D4000, v112, v125, "%{public}s protocol %{public}s (%p) has invalid notify callback, dumping backtrace:%{public}s", buf, 0x2Au);
        }

        free(v111);
      }
      else
      {
        if (v113)
        {
          v117 = default_input_handler->protocol.identifier->name;
          if (!v117) {
            v117 = "invalid";
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "__nw_protocol_notify";
          __int16 v137 = 2082;
          v138 = (void *)v117;
          __int16 v139 = 2048;
          v140 = (const char *)default_input_handler;
          _os_log_impl(&dword_1830D4000, v112, v125, "%{public}s protocol %{public}s (%p) has invalid notify callback, no backtrace", buf, 0x20u);
        }
      }
    }
LABEL_214:
    if (v107) {
      free(v107);
    }
    if (v80 != &nw_protocol_ref_counted_handle)
    {
LABEL_136:
      if (v69 == &nw_protocol_ref_counted_handle) {
        nw::release_if_needed<nw_protocol *>((uint64_t *)type);
      }
      if (gLogDatapath && (nw_endpoint_handler_get_logging_disabled(v8) & 1) == 0)
      {
        if (__nwlog_connection_log::onceToken != -1) {
          dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
        }
        v71 = (id)gconnectionLogObj;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          logc = nw_endpoint_handler_get_id_string(v8);
          v124 = nw_endpoint_handler_dry_run_string(v8);
          nw_endpoint_t v85 = nw_endpoint_handler_copy_endpoint(v8);
          v86 = nw_endpoint_get_logging_description(v85);
          v87 = nw_endpoint_handler_state_string(v8);
          v88 = nw_endpoint_handler_mode_string(v8);
          id v89 = nw_endpoint_handler_copy_current_path(v8);
          *(_DWORD *)buf = 136447746;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
          __int16 v137 = 2082;
          v138 = (void *)logc;
          __int16 v139 = 2082;
          v140 = v124;
          __int16 v141 = 2082;
          v142 = (void *)v86;
          __int16 v143 = 2082;
          v144 = v87;
          __int16 v145 = 2082;
          v146 = v88;
          __int16 v147 = 2114;
          id v148 = v89;
          _os_log_impl(&dword_1830D4000, v71, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Removed passthrough protocol from the stack on cancellation", buf, 0x48u);
        }
LABEL_123:

        goto LABEL_5;
      }
      goto LABEL_5;
    }
LABEL_135:
    nw::release_if_needed<nw_protocol *>((uint64_t *)&p_shared_protocol);
    goto LABEL_136;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v22 = (id)gLogObj;
  if (v9 > 5) {
    v23 = "unknown-mode";
  }
  else {
    v23 = off_1E523FB08[v9];
  }
  *(_DWORD *)buf = 136446722;
  *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
  __int16 v137 = 2082;
  v138 = (void *)v23;
  __int16 v139 = 2082;
  v140 = "flow";
  v24 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  LOBYTE(p_shared_protocol) = 0;
  if (!__nwlog_fault(v24, type, &p_shared_protocol)) {
    goto LABEL_78;
  }
  if (type[0] == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    os_log_type_t v26 = type[0];
    if (os_log_type_enabled(v25, type[0]))
    {
      if (v9 > 5) {
        v27 = "unknown-mode";
      }
      else {
        v27 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
      __int16 v137 = 2082;
      v138 = (void *)v27;
      __int16 v139 = 2082;
      v140 = "flow";
      _os_log_impl(&dword_1830D4000, v25, v26, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
LABEL_77:

    goto LABEL_78;
  }
  if (!(_BYTE)p_shared_protocol)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    os_log_type_t v43 = type[0];
    if (os_log_type_enabled(v25, type[0]))
    {
      if (v9 > 5) {
        __int16 v44 = "unknown-mode";
      }
      else {
        __int16 v44 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
      __int16 v137 = 2082;
      v138 = (void *)v44;
      __int16 v139 = 2082;
      v140 = "flow";
      _os_log_impl(&dword_1830D4000, v25, v43, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_77;
  }
  os_log_type_t v28 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v25 = (id)gLogObj;
  os_log_type_t v29 = type[0];
  BOOL v30 = os_log_type_enabled(v25, type[0]);
  if (!v28)
  {
    if (v30)
    {
      if (v9 > 5) {
        v45 = "unknown-mode";
      }
      else {
        v45 = off_1E523FB08[v9];
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
      __int16 v137 = 2082;
      v138 = (void *)v45;
      __int16 v139 = 2082;
      v140 = "flow";
      _os_log_impl(&dword_1830D4000, v25, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
    }
    goto LABEL_77;
  }
  if (v30)
  {
    if (v9 > 5) {
      BOOL v31 = "unknown-mode";
    }
    else {
      BOOL v31 = off_1E523FB08[v9];
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow cancelWithHandler:forced:]";
    __int16 v137 = 2082;
    v138 = (void *)v31;
    __int16 v139 = 2082;
    v140 = "flow";
    __int16 v141 = 2082;
    v142 = v28;
    _os_log_impl(&dword_1830D4000, v25, v29, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v28);
  if (v24) {
    goto LABEL_79;
  }
LABEL_80:
}

- (void)startWithHandler:(id)a3
{
  uint64_t v250 = *MEMORY[0x1E4F143B8];
  id v233 = a3;
  if (!v233)
  {
    v190 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
    os_log_type_t v15 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v234 = 0;
    if (!__nwlog_fault(v15, type, &v234)) {
      goto LABEL_80;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      objc_super v16 = __nwlog_obj();
      os_log_type_t v191 = type[0];
      if (os_log_type_enabled(v16, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_1830D4000, v16, v191, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v234)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      objc_super v16 = __nwlog_obj();
      os_log_type_t v194 = type[0];
      BOOL v195 = os_log_type_enabled(v16, type[0]);
      if (backtrace_string)
      {
        if (v195)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&unsigned char buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v16, v194, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_80;
      }
      if (v195)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_1830D4000, v16, v194, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      objc_super v16 = __nwlog_obj();
      os_log_type_t v196 = type[0];
      if (os_log_type_enabled(v16, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        _os_log_impl(&dword_1830D4000, v16, v196, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_79:

    goto LABEL_80;
  }
  v3 = (unsigned int *)v233;
  uint64_t v4 = v3[29];

  if (v4 != 2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    if (v4 > 5) {
      char v14 = "unknown-mode";
    }
    else {
      char v14 = off_1E523FB08[v4];
    }
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
    *(_WORD *)&unsigned char buf[12] = 2082;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2082;
    v240 = "flow";
    os_log_type_t v15 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v234 = 0;
    if (__nwlog_fault(v15, type, &v234))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        objc_super v16 = (id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          if (v4 > 5) {
            os_log_type_t v18 = "unknown-mode";
          }
          else {
            os_log_type_t v18 = off_1E523FB08[v4];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&unsigned char buf[12] = 2082;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2082;
          v240 = "flow";
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v234)
      {
        BOOL v19 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        objc_super v16 = (id)gLogObj;
        os_log_type_t v20 = type[0];
        BOOL v21 = os_log_type_enabled(v16, type[0]);
        if (v19)
        {
          if (v21)
          {
            if (v4 > 5) {
              id v22 = "unknown-mode";
            }
            else {
              id v22 = off_1E523FB08[v4];
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
            *(_WORD *)&unsigned char buf[12] = 2082;
            *(void *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2082;
            v240 = "flow";
            *(_WORD *)v241 = 2082;
            *(void *)&v241[2] = v19;
            _os_log_impl(&dword_1830D4000, v16, v20, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v19);
          if (!v15) {
            goto LABEL_233;
          }
LABEL_81:
          free(v15);
          goto LABEL_233;
        }
        if (v21)
        {
          if (v4 > 5) {
            v48 = "unknown-mode";
          }
          else {
            v48 = off_1E523FB08[v4];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&unsigned char buf[12] = 2082;
          *(void *)&buf[14] = v48;
          *(_WORD *)&buf[22] = 2082;
          v240 = "flow";
          _os_log_impl(&dword_1830D4000, v16, v20, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        objc_super v16 = (id)gLogObj;
        os_log_type_t v36 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          if (v4 > 5) {
            v37 = "unknown-mode";
          }
          else {
            v37 = off_1E523FB08[v4];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
          *(_WORD *)&unsigned char buf[12] = 2082;
          *(void *)&buf[14] = v37;
          *(_WORD *)&buf[22] = 2082;
          v240 = "flow";
          _os_log_impl(&dword_1830D4000, v16, v36, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
      goto LABEL_79;
    }
LABEL_80:
    if (!v15) {
      goto LABEL_233;
    }
    goto LABEL_81;
  }
  objc_storeStrong((id *)&self->internally_retained_object, self);
  v5 = v3;
  unsigned int v6 = v5[30];
  v230 = v5;

  if (v6 != 1) {
    goto LABEL_233;
  }
  v7 = v230;
  char v8 = *((unsigned char *)v7 + 268);

  v229 = v7;
  if (v8)
  {
    v23 = v7;
    char v24 = *((unsigned char *)v7 + 268);

    if ((v24 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v25 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        os_log_type_t v26 = v23;

        v27 = v26;
        char v28 = *((unsigned char *)v229 + 268);

        if (v28) {
          os_log_type_t v29 = "dry-run ";
        }
        else {
          os_log_type_t v29 = "";
        }
        nw_endpoint_t v30 = nw_endpoint_handler_copy_endpoint(v27);
        logging_description = nw_endpoint_get_logging_description(v30);
        v225 = (NWConcrete_nw_endpoint_handler *)v30;
        obja = v26 + 168;
        os_log_type_t v32 = v27;
        BOOL v33 = v32;
        uint64_t v34 = v230[30];
        if (v34 > 5) {
          os_log_type_t v35 = "unknown-state";
        }
        else {
          os_log_type_t v35 = off_1E523FB38[v34];
        }

        char v50 = v33;
        v51 = v50;
        unsigned int v52 = v3[29];
        v53 = "path";
        switch(v52)
        {
          case 0u:
            break;
          case 1u:
            v53 = "resolver";
            break;
          case 2u:
            v53 = nw_endpoint_flow_mode_string(v50[31]);
            break;
          case 3u:
            v53 = "proxy";
            break;
          case 4u:
            v53 = "fallback";
            break;
          case 5u:
            v53 = "transform";
            break;
          default:
            v53 = "unknown-mode";
            break;
        }

        v68 = v51;
        os_unfair_lock_lock((os_unfair_lock_t)v68 + 28);
        v69 = v68[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v68 + 28);

        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = obja;
        *(_WORD *)&buf[22] = 2082;
        v240 = v29;
        *(_WORD *)v241 = 2082;
        *(void *)&v241[2] = logging_description;
        __int16 v242 = 2082;
        v243 = v35;
        __int16 v244 = 2082;
        v245 = v53;
        __int16 v246 = 2114;
        v247 = v69;
        _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);
      }
    }
    char v70 = v23;
    v230[30] = 3;

    v70[20] = 393219;
    nw_endpoint_handler_report(v70, 0, (_WORD *)v70 + 40, 0);
    goto LABEL_233;
  }
  *((unsigned char *)self + 32) |= 0x10u;
  *((unsigned char *)self + 35) &= ~4u;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  flow_path = self->flow_path;
  self->flow_path = 0;

  os_unfair_lock_unlock(&self->lock);
  nw_endpoint_flow_initialize_protocol(v7, (uint64_t)&self->shared_protocol, *((unsigned char *)self + 32) & 1);
  if ((*((unsigned char *)self + 32) & 2) == 0)
  {
    *(void *)os_log_type_t type = 0;
    v236 = type;
    uint64_t v237 = 0x2020000000;
    char v238 = 0;
    int v11 = (void *)*((void *)v7 + 4);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __nw_endpoint_handler_has_persistent_application_protocols_block_invoke;
    v240 = (const char *)&unk_1E523FA40;
    *(void *)v241 = type;
    nw_parameters_internal_iterate_protocol_stack(v11, 5, 0, buf);
    int v12 = *((unsigned __int8 *)v236 + 24);
    _Block_object_dispose(type, 8);
    *((unsigned char *)self + 32) = *((unsigned char *)self + 32) & 0xFB | (4 * (v12 == 0));
    goto LABEL_114;
  }
  *((unsigned char *)self + 32) &= ~4u;
  v38 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)v38 + 28);
  v39 = (NWConcrete_nw_path *)*((id *)v38 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)v38 + 28);

  if (v39)
  {
    __int16 v40 = v39;
    char v41 = *((unsigned char *)v40 + 473) & 0x20;

    *((unsigned char *)self + 34) = *((unsigned char *)self + 34) & 0xDF | v41;
    nw_path_assert_required_agents(v40);
  }
  char v42 = v38;
  os_log_type_t v43 = (NWConcrete_nw_endpoint_handler *)v42[4];

  if (nw_endpoint_flow_should_add_filter(v43, v39))
  {
    double Helper_x8__ne_filter_protocol_identifier = gotLoadHelper_x8__ne_filter_protocol_identifier(v44);
    if (*(void *)(v46 + 2112)) {
      uint64_t inited = ne_filter_protocol_identifier_delayInitStub(Helper_x8__ne_filter_protocol_identifier);
    }
    else {
      uint64_t inited = 0;
    }
    BOOL v49 = inited == 0;
  }
  else
  {
    BOOL v49 = 0;
  }
  char v54 = 0;
  if (self->pre_connected_fd < 0 && v39 && !v49)
  {
    if (nw_path_uses_nexus_internal(v39, 0)) {
      char v54 = ~(32 * *((unsigned char *)self + 34)) & 0x40;
    }
    else {
      char v54 = 0;
    }
  }
  *((unsigned char *)self + 33) = *((unsigned char *)self + 33) & 0xBF | v54;
  os_unfair_lock_lock(&self->lock);
  if (v39)
  {
    if (nw_path_allows_multipath(v39)) {
      char v55 = 0x80;
    }
    else {
      char v55 = 0;
    }
  }
  else
  {
    char v55 = 0;
  }
  *((unsigned char *)self + 33) = *((unsigned char *)self + 33) & 0x7F | v55;
  os_unfair_lock_unlock(p_lock);
  if ((*((unsigned char *)self + 33) & 0x40) != 0 || self->clone_from_flow || !nw_path_is_flow_divert(v39)) {
    goto LABEL_103;
  }
  flow_divert_endpoint = self->flow_divert_endpoint;
  self->flow_divert_endpoint = 0;

  v57 = (OS_xpc_object *)nw_path_copy_flow_divert_token(v39);
  flow_divert_token = self->flow_divert_token;
  self->flow_divert_token = v57;

  char v59 = self->flow_divert_token;
  v226 = v43;
  if (v59 && object_getClass(v59) == (Class)MEMORY[0x1E4F14580])
  {
    v71 = nw_endpoint_handler_copy_endpoint(v42);
    v60 = v71;
    log = v71;
    if ((!v71 || nw_endpoint_get_type(v71) == nw_endpoint_type_host) && nw_path_get_flow_divert_unit(v39))
    {
      *(_OWORD *)buf = xmmword_183E23448;
      address = (OS_nw_endpoint *)nw_endpoint_create_address((const sockaddr *)buf);
      v73 = self->flow_divert_endpoint;
      self->flow_divert_endpoint = address;

      v74 = self->flow_divert_endpoint;
      nw_endpoint_t v75 = nw_endpoint_handler_copy_endpoint(v42);
      nw_endpoint_set_parent_endpoint(v74, v75, 0);

      v60 = log;
    }
    os_unfair_lock_lock(p_lock);
    *((unsigned char *)self + 34) |= 4u;
    os_unfair_lock_unlock(p_lock);
    int minimize_logging = nw_endpoint_handler_get_minimize_logging(v42);
    char logging_disabled = nw_endpoint_handler_get_logging_disabled(v42);
    if (minimize_logging)
    {
      if (logging_disabled) {
        goto LABEL_101;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v204 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(v42);
        v206 = nw_endpoint_handler_dry_run_string(v42);
        nw_endpoint_t v221 = nw_endpoint_handler_copy_endpoint(v42);
        v207 = nw_endpoint_get_logging_description(v221);
        v208 = nw_endpoint_handler_state_string(v42);
        v209 = nw_endpoint_handler_mode_string(v42);
        v210 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v42);
        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = id_string;
        *(_WORD *)&buf[22] = 2082;
        v240 = v206;
        *(_WORD *)v241 = 2082;
        *(void *)&v241[2] = v207;
        __int16 v242 = 2082;
        v243 = v208;
        __int16 v244 = 2082;
        v245 = v209;
        __int16 v246 = 2114;
        v247 = v210;
        _os_log_impl(&dword_1830D4000, v204, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] using flow divert", buf, 0x48u);
      }
      id v78 = v204;
    }
    else
    {
      if (logging_disabled)
      {
LABEL_102:

        os_log_type_t v43 = v226;
        goto LABEL_103;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      id v78 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        v79 = nw_endpoint_handler_get_id_string(v42);
        v80 = nw_endpoint_handler_dry_run_string(v42);
        v220 = v78;
        nw_endpoint_t v81 = nw_endpoint_handler_copy_endpoint(v42);
        v82 = nw_endpoint_get_logging_description(v81);
        v83 = nw_endpoint_handler_state_string(v42);
        v84 = nw_endpoint_handler_mode_string(v42);
        nw_endpoint_t v85 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v42);
        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = v79;
        *(_WORD *)&buf[22] = 2082;
        v240 = v80;
        *(_WORD *)v241 = 2082;
        *(void *)&v241[2] = v82;
        __int16 v242 = 2082;
        v243 = v83;
        __int16 v244 = 2082;
        v245 = v84;
        __int16 v246 = 2114;
        v247 = v85;
        _os_log_impl(&dword_1830D4000, v220, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] using flow divert", buf, 0x48u);

        id v78 = v220;
      }
    }

LABEL_101:
    v60 = log;
    goto LABEL_102;
  }
  if ((nw_endpoint_handler_get_logging_disabled(v42) & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v60 = (id)gconnectionLogObj;
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_102;
    }
    int v61 = nw_endpoint_handler_get_id_string(v42);
    v62 = nw_endpoint_handler_dry_run_string(v42);
    log = v60;
    nw_endpoint_t v63 = nw_endpoint_handler_copy_endpoint(v42);
    v64 = nw_endpoint_get_logging_description(v63);
    v65 = nw_endpoint_handler_state_string(v42);
    v66 = nw_endpoint_handler_mode_string(v42);
    BOOL v67 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v42);
    *(_DWORD *)buf = 136447746;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
    *(_WORD *)&unsigned char buf[12] = 2082;
    *(void *)&buf[14] = v61;
    *(_WORD *)&buf[22] = 2082;
    v240 = v62;
    *(_WORD *)v241 = 2082;
    *(void *)&v241[2] = v64;
    __int16 v242 = 2082;
    v243 = v65;
    __int16 v244 = 2082;
    v245 = v66;
    __int16 v246 = 2114;
    v247 = v67;
    _os_log_impl(&dword_1830D4000, log, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] flow divert advertised, but failed to copy token", buf, 0x48u);

    goto LABEL_101;
  }
LABEL_103:
  if (!v39 || !nw_path_is_multilayer_packet_logging_enabled(v39)) {
    goto LABEL_113;
  }
  int v86 = nw_endpoint_handler_get_minimize_logging(v42);
  char v87 = nw_endpoint_handler_get_logging_disabled(v42);
  v227 = v43;
  if (v86)
  {
    if (v87) {
      goto LABEL_112;
    }
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v88 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      v197 = nw_endpoint_handler_get_id_string(v42);
      v198 = nw_endpoint_handler_dry_run_string(v42);
      nw_endpoint_t v199 = nw_endpoint_handler_copy_endpoint(v42);
      v200 = nw_endpoint_get_logging_description(v199);
      v201 = nw_endpoint_handler_state_string(v42);
      v202 = nw_endpoint_handler_mode_string(v42);
      v203 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v42);
      *(_DWORD *)buf = 136447746;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)&buf[14] = v197;
      *(_WORD *)&buf[22] = 2082;
      v240 = v198;
      *(_WORD *)v241 = 2082;
      *(void *)&v241[2] = v200;
      __int16 v242 = 2082;
      v243 = v201;
      __int16 v244 = 2082;
      v245 = v202;
      __int16 v246 = 2114;
      v247 = v203;
      _os_log_impl(&dword_1830D4000, v88, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Multilayer packet logging enabled", buf, 0x48u);
    }
    goto LABEL_111;
  }
  if ((v87 & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v88 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      id v89 = nw_endpoint_handler_get_id_string(v42);
      v90 = nw_endpoint_handler_dry_run_string(v42);
      logb = v88;
      nw_endpoint_t v91 = nw_endpoint_handler_copy_endpoint(v42);
      v92 = nw_endpoint_get_logging_description(v91);
      os_log_type_t v93 = nw_endpoint_handler_state_string(v42);
      BOOL v94 = nw_endpoint_handler_mode_string(v42);
      os_log_type_t v95 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v42);
      *(_DWORD *)buf = 136447746;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_flow startWithHandler:]";
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)&buf[14] = v89;
      *(_WORD *)&buf[22] = 2082;
      v240 = v90;
      *(_WORD *)v241 = 2082;
      *(void *)&v241[2] = v92;
      __int16 v242 = 2082;
      v243 = v93;
      __int16 v244 = 2082;
      v245 = v94;
      __int16 v246 = 2114;
      v247 = v95;
      _os_log_impl(&dword_1830D4000, logb, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Multilayer packet logging enabled", buf, 0x48u);

      v88 = logb;
    }
LABEL_111:

    os_log_type_t v43 = v227;
  }
LABEL_112:
  *((unsigned char *)self + 34) |= 8u;
LABEL_113:

  v7 = v229;
LABEL_114:
  v96 = v7;
  v230[30] = 2;

  if (!nw_endpoint_flow_validate_delegation(v96)) {
    goto LABEL_233;
  }
  clone_from_flow = self->clone_from_flow;
  if (!clone_from_flow || (*((unsigned char *)self + 32) & 0x40) != 0)
  {
    if ((*((unsigned char *)self + 32) & 0x42) == 2 && (*((unsigned char *)self + 33) & 0x40) != 0)
    {
      if (!nw_endpoint_flow_expected_to_join(v96, self) || !nw_endpoint_flow_setup_protocols(v96, 0, 0, 1, 1)) {
        nw_endpoint_flow_setup_channel(v96);
      }
    }
    else
    {
      BOOL v157 = nw_endpoint_flow_expected_to_join(v96, self);
      nw_endpoint_flow_setup_protocols(v96, 0, 0, 1, v157);
    }
    goto LABEL_233;
  }
  v98 = v96;
  v218 = clone_from_flow;
  v99 = v98;
  uint64_t v100 = v3[29];
  v228 = v99;

  if (v100 != 2)
  {
    v158 = __nwlog_obj();
    if (v100 > 5) {
      v159 = "unknown-mode";
    }
    else {
      v159 = off_1E523FB08[v100];
    }
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
    *(_WORD *)&unsigned char buf[12] = 2082;
    *(void *)&buf[14] = v159;
    *(_WORD *)&buf[22] = 2082;
    v240 = "flow";
    v169 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v234 = 0;
    if (__nwlog_fault(v169, type, &v234))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v170 = __nwlog_obj();
        os_log_type_t v171 = type[0];
        if (os_log_type_enabled(v170, type[0]))
        {
          if (v100 > 5) {
            v172 = "unknown-mode";
          }
          else {
            v172 = off_1E523FB08[v100];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
          *(_WORD *)&unsigned char buf[12] = 2082;
          *(void *)&buf[14] = v172;
          *(_WORD *)&buf[22] = 2082;
          v240 = "flow";
          _os_log_impl(&dword_1830D4000, v170, v171, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
        }
      }
      else if (v234)
      {
        v173 = (char *)__nw_create_backtrace_string();
        v170 = __nwlog_obj();
        os_log_type_t v174 = type[0];
        BOOL v175 = os_log_type_enabled(v170, type[0]);
        if (v173)
        {
          if (v175)
          {
            if (v100 > 5) {
              v176 = "unknown-mode";
            }
            else {
              v176 = off_1E523FB08[v100];
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
            *(_WORD *)&unsigned char buf[12] = 2082;
            *(void *)&buf[14] = v176;
            *(_WORD *)&buf[22] = 2082;
            v240 = "flow";
            *(_WORD *)v241 = 2082;
            *(void *)&v241[2] = v173;
            _os_log_impl(&dword_1830D4000, v170, v174, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
          }

          free(v173);
          goto LABEL_230;
        }
        if (v175)
        {
          if (v100 > 5) {
            v179 = "unknown-mode";
          }
          else {
            v179 = off_1E523FB08[v100];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
          *(_WORD *)&unsigned char buf[12] = 2082;
          *(void *)&buf[14] = v179;
          *(_WORD *)&buf[22] = 2082;
          v240 = "flow";
          _os_log_impl(&dword_1830D4000, v170, v174, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
        }
      }
      else
      {
        v170 = __nwlog_obj();
        os_log_type_t v177 = type[0];
        if (os_log_type_enabled(v170, type[0]))
        {
          if (v100 > 5) {
            v178 = "unknown-mode";
          }
          else {
            v178 = off_1E523FB08[v100];
          }
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
          *(_WORD *)&unsigned char buf[12] = 2082;
          *(void *)&buf[14] = v178;
          *(_WORD *)&buf[22] = 2082;
          v240 = "flow";
          _os_log_impl(&dword_1830D4000, v170, v177, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
        }
      }
    }
LABEL_230:
    if (v169) {
      free(v169);
    }
    goto LABEL_232;
  }
  nw_endpoint_t v211 = nw_endpoint_handler_copy_endpoint(v228);
  os_log_t loga = (os_log_t)nw_endpoint_handler_copy_parameters(v228);
  output_handler = v218->shared_protocol.protocol.output_handler;
  if (!output_handler)
  {
LABEL_174:
    v160 = v228;
    if ((nw_endpoint_handler_get_logging_disabled(v228) & 1) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v161 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
      {
        v162 = nw_endpoint_handler_get_id_string(v228);
        v163 = nw_endpoint_handler_dry_run_string(v228);
        nw_endpoint_t v164 = nw_endpoint_handler_copy_endpoint(v228);
        v165 = nw_endpoint_get_logging_description(v164);
        v166 = nw_endpoint_handler_state_string(v228);
        v167 = nw_endpoint_handler_mode_string(v228);
        v168 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v228);
        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = v162;
        *(_WORD *)&buf[22] = 2082;
        v240 = v163;
        *(_WORD *)v241 = 2082;
        *(void *)&v241[2] = v165;
        __int16 v242 = 2082;
        v243 = v166;
        __int16 v244 = 2082;
        v245 = v167;
        __int16 v246 = 2114;
        v247 = v168;
        _os_log_impl(&dword_1830D4000, v161, OS_LOG_TYPE_ERROR, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] could not find protocol to join in existing protocol stack", buf, 0x48u);
      }
      v160 = v228;
    }
    nw_endpoint_flow_failed_with_error(v160, 1, 0);
    goto LABEL_181;
  }
  lock = &v228->lock;
  while (1)
  {
    identifier = output_handler->identifier;
    if (identifier->mapping != 2) {
      goto LABEL_121;
    }
    v103 = v229;
    if (nw_parameters_has_protocol_in_stack(loga, output_handler->identifier->name)) {
      break;
    }
    v129 = v228;
    BOOL v130 = (v229[67] & 0x20) == 0;

    if (!v130) {
      goto LABEL_121;
    }
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v117 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
    {
      os_log_type_t v131 = v129;

      v132 = v131;
      BOOL v133 = (v229[67] & 1) == 0;

      if (v133) {
        v134 = "";
      }
      else {
        v134 = "dry-run ";
      }
      nw_endpoint_t v135 = nw_endpoint_handler_copy_endpoint(v132);
      v217 = nw_endpoint_get_logging_description(v135);
      v136 = v132;
      __int16 v137 = v136;
      uint64_t v138 = v230[30];
      __int16 v139 = "unknown-state";
      if (v138 <= 5) {
        __int16 v139 = off_1E523FB38[v138];
      }
      v215 = v139;

      v140 = v137;
      __int16 v141 = "path";
      switch(v3[29])
      {
        case 0u:
          break;
        case 1u:
          __int16 v141 = "resolver";
          break;
        case 2u:
          __int16 v141 = nw_endpoint_flow_mode_string(v228->mode_handler);
          break;
        case 3u:
          __int16 v141 = "proxy";
          break;
        case 4u:
          __int16 v141 = "fallback";
          break;
        case 5u:
          __int16 v141 = "transform";
          break;
        default:
          __int16 v141 = "unknown-mode";
          break;
      }

      v212 = identifier;
      nw_endpoint_t v142 = v135;
      __int16 v143 = v117;
      v144 = v140;
      os_unfair_lock_lock(lock);
      __int16 v145 = v228->current_path;
      os_unfair_lock_unlock(lock);

      v117 = v143;
      *(_DWORD *)buf = 136448002;
      *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)&buf[14] = v228->id_str;
      *(_WORD *)&buf[22] = 2082;
      v240 = v134;
      *(_WORD *)v241 = 2082;
      *(void *)&v241[2] = v217;
      __int16 v242 = 2082;
      v243 = v215;
      __int16 v244 = 2082;
      v245 = v141;
      __int16 v246 = 2114;
      v247 = v145;
      __int16 v248 = 2082;
      v249 = v212;
      _os_log_impl(&dword_1830D4000, v143, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Cannot join protocol %{public}s (not in request stack)", buf, 0x52u);
    }
LABEL_120:

LABEL_121:
    output_handler = output_handler->output_handler;
    if (!output_handler) {
      goto LABEL_174;
    }
  }
  callbacks = output_handler->callbacks;
  get_remote_endpoint = (uint64_t (*)(nw_protocol *))callbacks->get_remote_endpoint;
  if (!get_remote_endpoint || !callbacks->get_parameters) {
    goto LABEL_133;
  }
  v106 = (void *)get_remote_endpoint(output_handler);
  v107 = (void *)((uint64_t (*)(nw_protocol *))output_handler->callbacks->get_parameters)(output_handler);
  if ((nw_endpoint_is_equal(v106, v211, 3) & 1) == 0)
  {
    BOOL v108 = nw_endpoint_copy_proxy_original_endpoint(v211);
    if ((nw_endpoint_is_equal(v106, (void *)v108, 3) & 1) == 0)
    {
      BOOL v109 = nw_endpoint_copy_proxy_original_endpoint(v106);
      if ((nw_endpoint_is_equal((void *)v109, v211, 3) & 1) == 0)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v149 = gLogObj;
        if (!os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_133;
        }
        v150 = output_handler->identifier;
        v151 = nw_endpoint_get_logging_description(v211);
        v152 = nw_endpoint_get_logging_description(v106);
        BOOL v153 = nw_endpoint_copy_proxy_original_endpoint(v211);
        v154 = nw_endpoint_get_logging_description((void *)v153);
        BOOL v155 = nw_endpoint_copy_proxy_original_endpoint(v106);
        v156 = nw_endpoint_get_logging_description((void *)v155);
        *(_DWORD *)buf = 136447490;
        *(void *)&uint8_t buf[4] = "nw_protocol_can_join_existing";
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = v150;
        *(_WORD *)&buf[22] = 2082;
        v240 = v151;
        v103 = v229;
        *(_WORD *)v241 = 2082;
        *(void *)&v241[2] = v152;
        __int16 v242 = 2082;
        v243 = v154;
        __int16 v244 = 2082;
        v245 = v156;
        v112 = v149;
        BOOL v113 = "%{public}s Cannot join existing protocol %{public}s, endpoints do not match (%{public}s != %{public}s), ("
               "original %{public}s, existing original %{public}s)";
        uint32_t v114 = 62;
        goto LABEL_132;
      }
    }
  }
  if (!nw_parameters_are_compatible(loga, -1, v107, (uint64_t)output_handler, 0))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v110 = gLogObj;
    if (os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_DEBUG))
    {
      v111 = output_handler->identifier;
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "nw_protocol_can_join_existing";
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)&buf[14] = v111;
      v112 = v110;
      BOOL v113 = "%{public}s Cannot join existing protocol %{public}s, parameters do not match";
      uint32_t v114 = 22;
LABEL_132:
      _os_log_impl(&dword_1830D4000, v112, OS_LOG_TYPE_DEBUG, v113, buf, v114);
    }
LABEL_133:
    os_log_type_t v115 = v228;
    BOOL v116 = (v103[67] & 0x20) == 0;

    if (!v116) {
      goto LABEL_121;
    }
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v117 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
    {
      os_log_type_t v118 = v115;

      os_log_type_t v119 = v118;
      BOOL v120 = (v229[67] & 1) == 0;

      if (v120) {
        os_log_type_t v121 = "";
      }
      else {
        os_log_type_t v121 = "dry-run ";
      }
      nw_endpoint_t v122 = nw_endpoint_handler_copy_endpoint(v119);
      v216 = nw_endpoint_get_logging_description(v122);
      nw_endpoint_t v123 = v119;
      v124 = v123;
      uint64_t v125 = v230[30];
      v126 = "unknown-state";
      if (v125 <= 5) {
        v126 = off_1E523FB38[v125];
      }
      v214 = v126;

      v127 = v124;
      v128 = "path";
      switch(v3[29])
      {
        case 0u:
          break;
        case 1u:
          v128 = "resolver";
          break;
        case 2u:
          v128 = nw_endpoint_flow_mode_string(v228->mode_handler);
          break;
        case 3u:
          v128 = "proxy";
          break;
        case 4u:
          v128 = "fallback";
          break;
        case 5u:
          v128 = "transform";
          break;
        default:
          v128 = "unknown-mode";
          break;
      }

      nw_endpoint_t v213 = v122;
      v146 = v117;
      __int16 v147 = v127;
      os_unfair_lock_lock(lock);
      id v148 = v228->current_path;
      os_unfair_lock_unlock(lock);

      v117 = v146;
      *(_DWORD *)buf = 136448002;
      *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)&buf[14] = v228->id_str;
      *(_WORD *)&buf[22] = 2082;
      v240 = v121;
      *(_WORD *)v241 = 2082;
      *(void *)&v241[2] = v216;
      __int16 v242 = 2082;
      v243 = v214;
      __int16 v244 = 2082;
      v245 = v128;
      __int16 v246 = 2114;
      v247 = v148;
      __int16 v248 = 2082;
      v249 = identifier;
      _os_log_impl(&dword_1830D4000, v146, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Cannot join protocol %{public}s due to mismatch", buf, 0x52u);
    }
    goto LABEL_120;
  }
  if ((nw_endpoint_handler_get_logging_disabled(v228) & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v180 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
    {
      v181 = nw_endpoint_handler_get_id_string(v228);
      v182 = nw_endpoint_handler_dry_run_string(v228);
      nw_endpoint_t v183 = nw_endpoint_handler_copy_endpoint(v228);
      v184 = nw_endpoint_get_logging_description(v183);
      v185 = nw_endpoint_handler_state_string(v228);
      v186 = nw_endpoint_handler_mode_string(v228);
      v187 = (OS_nw_path *)nw_endpoint_handler_copy_current_path(v228);
      *(_DWORD *)buf = 136448002;
      *(void *)&uint8_t buf[4] = "nw_endpoint_flow_setup_cloned_protocols";
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)&buf[14] = v181;
      *(_WORD *)&buf[22] = 2082;
      v240 = v182;
      *(_WORD *)v241 = 2082;
      *(void *)&v241[2] = v184;
      __int16 v242 = 2082;
      v243 = v185;
      __int16 v244 = 2082;
      v245 = v186;
      __int16 v246 = 2114;
      v247 = v187;
      __int16 v248 = 2082;
      v249 = identifier;
      _os_log_impl(&dword_1830D4000, v180, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Joining protocol %{public}s", buf, 0x52u);
    }
  }
  if (v218->bottom_protocol)
  {
    v188 = nw_endpoint_handler_copy_flow(v228);
    *((void *)v188 + 94) = v218->bottom_protocol;
  }
  if ((*((unsigned char *)v218 + 35) & 8) != 0)
  {
    v189 = nw_endpoint_handler_copy_flow(v228);
    *((unsigned char *)v189 + 35) |= 8u;
  }
  nw_endpoint_flow_setup_protocols(v228, 0, output_handler, 1, 1);
LABEL_181:

LABEL_232:
  v192 = self->clone_from_flow;
  self->clone_from_flow = 0;

LABEL_233:
}

- (void)dealloc
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (!__nwlog_fault(v4, &type, &v32)) {
      goto LABEL_7;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      os_log_type_t v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v6, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
LABEL_6:

LABEL_7:
      if (!v4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if (!v32)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v28, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_6;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    os_log_type_t v20 = type;
    BOOL v21 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v20, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v21)
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      __int16 v36 = 2082;
      v37 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v5, v20, "%{public}s over-release of nw_endpoint_flow_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
    if (v4) {
LABEL_8:
    }
      free(v4);
  }
LABEL_9:
  if (!self->shared_protocol.read_requests) {
    goto LABEL_17;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
  char v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v32 = 0;
  if (!__nwlog_fault(v8, &type, &v32))
  {
LABEL_15:
    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v9 = (id)gLogObj;
    os_log_type_t v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_1830D4000, v9, v10, "%{public}s read requests not drained", buf, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v32)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v9 = (id)gLogObj;
    os_log_type_t v29 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_1830D4000, v9, v29, "%{public}s read requests not drained, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_14;
  }
  id v22 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v9 = (id)gLogObj;
  os_log_type_t v23 = type;
  BOOL v24 = os_log_type_enabled(v9, type);
  if (!v22)
  {
    if (v24)
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_1830D4000, v9, v23, "%{public}s read requests not drained, no backtrace", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (v24)
  {
    *(_DWORD *)buf = 136446466;
    os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
    __int16 v36 = 2082;
    v37 = v22;
    _os_log_impl(&dword_1830D4000, v9, v23, "%{public}s read requests not drained, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v22);
  if (v8) {
LABEL_16:
  }
    free(v8);
LABEL_17:
  if (!self->shared_protocol.write_requests) {
    goto LABEL_25;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v11 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
  int v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v32 = 0;
  if (!__nwlog_fault(v12, &type, &v32))
  {
LABEL_23:
    if (!v12) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    os_log_type_t v14 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s write requests not drained", buf, 0xCu);
    }
LABEL_22:

    goto LABEL_23;
  }
  if (!v32)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    os_log_type_t v30 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_1830D4000, v13, v30, "%{public}s write requests not drained, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_22;
  }
  v25 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v13 = (id)gLogObj;
  os_log_type_t v26 = type;
  BOOL v27 = os_log_type_enabled(v13, type);
  if (!v25)
  {
    if (v27)
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
      _os_log_impl(&dword_1830D4000, v13, v26, "%{public}s write requests not drained, no backtrace", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (v27)
  {
    *(_DWORD *)buf = 136446466;
    os_log_type_t v35 = "-[NWConcrete_nw_endpoint_flow dealloc]";
    __int16 v36 = 2082;
    v37 = v25;
    _os_log_impl(&dword_1830D4000, v13, v26, "%{public}s write requests not drained, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v25);
  if (v12) {
LABEL_24:
  }
    free(v12);
LABEL_25:
  tcp_info = self->tcp_info;
  if (tcp_info)
  {
    free(tcp_info);
    self->tcp_info = 0;
  }
  tcp_connection_info = self->tcp_connection_info;
  if (tcp_connection_info)
  {
    free(tcp_connection_info);
    self->tcp_connection_info = 0;
  }
  data_transfer_snapshot = self->data_transfer_snapshot;
  if (data_transfer_snapshot)
  {
    free(data_transfer_snapshot);
    self->data_transfer_snapshot = 0;
  }
  context = self->shared_protocol.context;
  self->shared_protocol.context = 0;

  v31.receiver = self;
  v31.super_class = (Class)NWConcrete_nw_endpoint_flow;
  [(NWConcrete_nw_endpoint_flow *)&v31 dealloc];
}

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    BOOL v130 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
    os_log_type_t v131 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_shared_protocol) = 0;
    if (__nwlog_fault(v131, type, &p_shared_protocol))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v132 = __nwlog_obj();
        os_log_type_t v133 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_1830D4000, v132, v133, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if ((_BYTE)p_shared_protocol)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v132 = __nwlog_obj();
        os_log_type_t v135 = type[0];
        BOOL v136 = os_log_type_enabled(v132, type[0]);
        if (backtrace_string)
        {
          if (v136)
          {
            *(_DWORD *)buf = 136446466;
            v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
            __int16 v203 = 2082;
            v204 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v132, v135, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_196;
        }
        if (v136)
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_1830D4000, v132, v135, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v132 = __nwlog_obj();
        os_log_type_t v137 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          _os_log_impl(&dword_1830D4000, v132, v137, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_196:
    if (v131) {
      free(v131);
    }
    id v11 = 0;
    goto LABEL_174;
  }
  os_log_type_t v6 = (NWConcrete_nw_endpoint_handler *)v4;
  uint64_t mode = v6->mode;

  if (mode == 2)
  {
    v187 = v6;
    char v8 = nw_endpoint_handler_copy_flow(v6);
    uint64_t v9 = (void *)*((void *)v8 + 104);
    v189 = v8;
    v181 = self;
    if (v9)
    {
      id obj = (id)nw_path_flow_registration_copy_path(v9);
    }
    else
    {
      BOOL v21 = v6;
      os_unfair_lock_lock(&v21->lock);
      id obj = v21->current_path;
      os_unfair_lock_unlock(&v21->lock);
    }
    v186 = v5;
    os_log_type_t v23 = (id *)((char *)v8 + 16);
    uint64_t v22 = *((void *)v8 + 2);
    if (v22) {
      int v24 = *(_DWORD *)(v22 + 272);
    }
    else {
      int v24 = 0;
    }
    v25 = (os_unfair_lock_s *)((char *)v8 + 880);
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 220);
    objc_storeStrong((id *)v8 + 2, obj);
    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 220);
    if (*((void *)v8 + 109)) {
      *((unsigned char *)v8 + 36) |= 1u;
    }
    if (v22)
    {
      if ((*((unsigned char *)v8 + 32) & 0x40) != 0)
      {
        if (*v23)
        {
          int v26 = *((_DWORD *)*v23 + 68);
          if (v26)
          {
            if (v24 != v26 && (v26 & 0x20000000) == 0)
            {
              if (nw_endpoint_handler_get_minimize_logging(v187))
              {
                if (nw_endpoint_handler_get_logging_disabled(v187)) {
                  goto LABEL_171;
                }
                if (__nwlog_connection_log::onceToken != -1) {
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                }
                os_log_type_t v29 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  id_string = nw_endpoint_handler_get_id_string(v187);
                  nw_endpoint_t v164 = nw_endpoint_handler_dry_run_string(v187);
                  nw_endpoint_t v165 = nw_endpoint_handler_copy_endpoint(v187);
                  logging_description = nw_endpoint_get_logging_description(v165);
                  v167 = nw_endpoint_handler_state_string(v187);
                  v168 = nw_endpoint_handler_mode_string(v187);
                  id v169 = nw_endpoint_handler_copy_current_path(v187);
                  *(_DWORD *)buf = 136448258;
                  v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
                  __int16 v203 = 2082;
                  v204 = (char *)id_string;
                  __int16 v205 = 2082;
                  v206 = v164;
                  __int16 v207 = 2082;
                  v208 = (void *)logging_description;
                  __int16 v209 = 2082;
                  v210 = v167;
                  __int16 v211 = 2082;
                  v212 = v168;
                  __int16 v213 = 2114;
                  id v214 = v169;
                  __int16 v215 = 1024;
                  int v216 = v24;
                  __int16 v217 = 1024;
                  int v218 = v26;
                  _os_log_impl(&dword_1830D4000, v29, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] filter state changed (%X --> %X), drop flow", buf, 0x54u);
                }
              }
              else
              {
                BOOL v27 = v187;
                char v28 = *((unsigned char *)v27 + 268);

                if ((v28 & 0x20) != 0)
                {
LABEL_171:
                  v129 = v187;
                  v126 = (NWConcrete_nw_endpoint_mode_handler *)v129[5];

                  v193[0] = MEMORY[0x1E4F143A8];
                  v193[1] = 3221225472;
                  v193[2] = __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke;
                  v193[3] = &unk_1E524BAA8;
                  os_log_type_t v194 = v129;
                  nw_queue_context_async(v126, v193);
                  uint64_t v125 = (id *)&v194;
                  goto LABEL_172;
                }
                if (__nwlog_connection_log::onceToken != -1) {
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                }
                os_log_type_t v29 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  os_log_type_t v30 = v27;

                  objc_super v31 = v30;
                  char v32 = *((unsigned char *)v27 + 268);

                  if (v32) {
                    BOOL v33 = "dry-run ";
                  }
                  else {
                    BOOL v33 = "";
                  }
                  nw_endpoint_t v34 = nw_endpoint_handler_copy_endpoint(v31);
                  v179 = nw_endpoint_get_logging_description(v34);
                  v182 = v33;
                  id_str = v30->id_str;
                  __int16 v36 = v31;
                  v37 = v36;
                  uint64_t v38 = v36[30];
                  if (v38 > 5) {
                    v39 = "unknown-state";
                  }
                  else {
                    v39 = off_1E523FB38[v38];
                  }

                  BOOL v116 = v37;
                  v117 = v116;
                  os_log_type_t v118 = "path";
                  switch(v187->mode)
                  {
                    case 0:
                      break;
                    case 1:
                      os_log_type_t v118 = "resolver";
                      break;
                    case 2:
                      os_log_type_t v118 = nw_endpoint_flow_mode_string(v116[31]);
                      break;
                    case 3:
                      os_log_type_t v118 = "proxy";
                      break;
                    case 4:
                      os_log_type_t v118 = "fallback";
                      break;
                    case 5:
                      os_log_type_t v118 = "transform";
                      break;
                    default:
                      os_log_type_t v118 = "unknown-mode";
                      break;
                  }

                  v127 = v117;
                  os_unfair_lock_lock((os_unfair_lock_t)v127 + 28);
                  id v128 = v127[8];
                  os_unfair_lock_unlock((os_unfair_lock_t)v127 + 28);

                  *(_DWORD *)buf = 136448258;
                  v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
                  __int16 v203 = 2082;
                  v204 = id_str;
                  __int16 v205 = 2082;
                  v206 = v182;
                  __int16 v207 = 2082;
                  v208 = (void *)v179;
                  __int16 v209 = 2082;
                  v210 = v39;
                  __int16 v211 = 2082;
                  v212 = v118;
                  __int16 v213 = 2114;
                  id v214 = v128;
                  __int16 v215 = 1024;
                  int v216 = v24;
                  __int16 v217 = 1024;
                  int v218 = v26;
                  _os_log_impl(&dword_1830D4000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] filter state changed (%X --> %X), drop flow", buf, 0x54u);
                }
              }

              goto LABEL_171;
            }
          }
        }
      }
    }
    if ((*((unsigned char *)v189 + 33) & 4) != 0)
    {
      os_unfair_lock_lock(v25);
      objc_storeStrong((id *)v189 + 1, *((id *)v189 + 2));
      os_unfair_lock_unlock(v25);
      __int16 v40 = v187;
      nw_endpoint_flow_connected_path_change(v187);
    }
    else
    {
      __int16 v40 = v187;
      if ((*((unsigned char *)v189 + 34) & 0x40) == 0)
      {
        char v41 = v187;
        char v42 = *((unsigned char *)v41 + 268);

        if ((v42 & 8) != 0)
        {
          if (nw_endpoint_handler_get_minimize_logging(v41))
          {
            if (nw_endpoint_handler_get_logging_disabled(v41)) {
              goto LABEL_163;
            }
            if (__nwlog_connection_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
            }
            v45 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              v151 = nw_endpoint_handler_get_id_string(v41);
              v152 = nw_endpoint_handler_dry_run_string(v41);
              nw_endpoint_t v153 = nw_endpoint_handler_copy_endpoint(v41);
              v154 = nw_endpoint_get_logging_description(v153);
              BOOL v155 = nw_endpoint_handler_state_string(v41);
              v156 = nw_endpoint_handler_mode_string(v41);
              id v157 = nw_endpoint_handler_copy_current_path(v41);
              *(_DWORD *)buf = 136447746;
              v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
              __int16 v203 = 2082;
              v204 = (char *)v151;
              __int16 v205 = 2082;
              v206 = v152;
              __int16 v207 = 2082;
              v208 = (void *)v154;
              __int16 v209 = 2082;
              v210 = v155;
              __int16 v211 = 2082;
              v212 = v156;
              __int16 v213 = 2114;
              id v214 = v157;
              _os_log_impl(&dword_1830D4000, v45, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, will try to reset", buf, 0x48u);
            }
          }
          else
          {
            os_log_type_t v43 = v41;
            char v44 = *((unsigned char *)v41 + 268);

            if ((v44 & 0x20) != 0)
            {
LABEL_163:
              nw_endpoint_t v123 = v41;
              id v124 = v123[5];

              v190[0] = MEMORY[0x1E4F143A8];
              v190[1] = 3221225472;
              v190[2] = __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke_7;
              v190[3] = &unk_1E524B9A0;
              os_log_type_t v191 = v123;
              v192 = v189;
              nw_queue_context_async(v124, v190);

              uint64_t v125 = (id *)&v191;
              v126 = v192;
LABEL_172:

              goto LABEL_173;
            }
            if (__nwlog_connection_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
            }
            v45 = (id)gconnectionLogObj;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              uint64_t v46 = v43;

              char v47 = v46;
              char v48 = *((unsigned char *)v41 + 268);

              if (v48) {
                BOOL v49 = "dry-run ";
              }
              else {
                BOOL v49 = "";
              }
              nw_endpoint_t v50 = nw_endpoint_handler_copy_endpoint(v47);
              nw_endpoint_t v183 = nw_endpoint_get_logging_description(v50);
              v51 = v46 + 168;
              unsigned int v52 = v47;
              v53 = v52;
              uint64_t v54 = v52[30];
              if (v54 > 5) {
                char v55 = "unknown-state";
              }
              else {
                char v55 = off_1E523FB38[v54];
              }

              BOOL v113 = v53;
              uint32_t v114 = v113;
              os_log_type_t v115 = "path";
              switch(v187->mode)
              {
                case 0:
                  break;
                case 1:
                  os_log_type_t v115 = "resolver";
                  break;
                case 2:
                  os_log_type_t v115 = nw_endpoint_flow_mode_string(v113[31]);
                  break;
                case 3:
                  os_log_type_t v115 = "proxy";
                  break;
                case 4:
                  os_log_type_t v115 = "fallback";
                  break;
                case 5:
                  os_log_type_t v115 = "transform";
                  break;
                default:
                  os_log_type_t v115 = "unknown-mode";
                  break;
              }

              os_log_type_t v121 = v114;
              os_unfair_lock_lock((os_unfair_lock_t)v121 + 28);
              id v122 = v121[8];
              os_unfair_lock_unlock((os_unfair_lock_t)v121 + 28);

              *(_DWORD *)buf = 136447746;
              v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
              __int16 v203 = 2082;
              v204 = v51;
              __int16 v205 = 2082;
              v206 = v49;
              __int16 v207 = 2082;
              v208 = (void *)v183;
              __int16 v209 = 2082;
              v210 = v55;
              __int16 v211 = 2082;
              v212 = v115;
              __int16 v213 = 2114;
              id v214 = v122;
              _os_log_impl(&dword_1830D4000, v45, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, will try to reset", buf, 0x48u);
            }
          }

          goto LABEL_163;
        }
      }
    }
    char v56 = v40;
    char v57 = *((unsigned char *)v56 + 268);

    if ((v57 & 0x20) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v58 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        char v59 = v56;

        v60 = v59;
        char v61 = *((unsigned char *)v56 + 268);

        if (v61) {
          v62 = "dry-run ";
        }
        else {
          v62 = "";
        }
        nw_endpoint_t v63 = nw_endpoint_handler_copy_endpoint(v60);
        v64 = nw_endpoint_get_logging_description(v63);
        v180 = v59 + 168;
        v65 = v60;
        v66 = v65;
        uint64_t v67 = v65[30];
        if (v67 > 5) {
          v68 = "unknown-state";
        }
        else {
          v68 = off_1E523FB38[v67];
        }
        *(void *)os_log_type_t v177 = v68;

        v69 = v66;
        char v70 = v69;
        v71 = "path";
        switch(v187->mode)
        {
          case 0:
            break;
          case 1:
            v71 = "resolver";
            break;
          case 2:
            v71 = nw_endpoint_flow_mode_string(v69[31]);
            break;
          case 3:
            v71 = "proxy";
            break;
          case 4:
            v71 = "fallback";
            break;
          case 5:
            v71 = "transform";
            break;
          default:
            v71 = "unknown-mode";
            break;
        }

        nw_endpoint_t v75 = v70;
        os_unfair_lock_lock((os_unfair_lock_t)v75 + 28);
        id v76 = v75[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v75 + 28);

        *(_DWORD *)buf = 136447746;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        __int16 v203 = 2082;
        v204 = v180;
        __int16 v205 = 2082;
        v206 = v62;
        __int16 v207 = 2082;
        v208 = (void *)v64;
        __int16 v209 = 2082;
        v210 = *(const char **)v177;
        __int16 v211 = 2082;
        v212 = v71;
        __int16 v213 = 2114;
        id v214 = v76;
        _os_log_impl(&dword_1830D4000, v58, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ", buf, 0x48u);
      }
    }
    v77 = v56;
    BOOL v78 = (*((unsigned char *)v56 + 268) & 1) == 0;

    if (v78)
    {
      v79 = v77;
      int state = v79->state;

      if (state == 5) {
        goto LABEL_135;
      }
      output_handler = v181->shared_protocol.protocol.output_handler;
      id v82 = *v23;
      v83 = v82;
      if (!output_handler) {
        goto LABEL_134;
      }
      callbacks = output_handler->callbacks;
      if (!callbacks) {
        goto LABEL_134;
      }
      if (callbacks->updated_path) {
        BOOL v85 = v82 == 0;
      }
      else {
        BOOL v85 = 1;
      }
      int v86 = !v85;

      if (!v86)
      {
LABEL_135:
        if ((*((unsigned char *)v181 + 33) & 0x40) != 0) {
          nw_endpoint_flow_setup_channel(v79);
        }
        goto LABEL_173;
      }
      id v87 = *v23;
      v83 = v87;
      handle = output_handler->handle;
      if (handle == &nw_protocol_ref_counted_handle)
      {
        v107 = output_handler[1].callbacks;
        if (v107) {
          output_handler[1].callbacks = (nw_protocol_callbacks *)((char *)&v107->add_input_handler + 1);
        }
        char v89 = -1;
      }
      else
      {
        char v89 = 0;
      }
      *(void *)os_log_type_t type = output_handler;
      char v200 = v89;
      BOOL v108 = v181->shared_protocol.protocol.handle;
      if (v108 == &nw_protocol_ref_counted_handle)
      {
        uint64_t v110 = (char *)v181->shared_protocol.listen_protocol.handle;
        if (v110) {
          v181->shared_protocol.listen_protocol.handle = v110 + 1;
        }
        char v109 = -1;
      }
      else
      {
        char v109 = 0;
      }
      p_shared_protocol = &v181->shared_protocol;
      char v198 = v109;
      if (v87)
      {
        v111 = output_handler->callbacks;
        if (v111)
        {
          updated_path = (void (*)(nw_protocol *, nw_flow_protocol *, id))v111->updated_path;
          if (updated_path)
          {
            updated_path(output_handler, &v181->shared_protocol, v87);
LABEL_130:
            if (v108 == &nw_protocol_ref_counted_handle) {
              nw::release_if_needed<nw_protocol *>((uint64_t *)&p_shared_protocol);
            }
            if (handle == &nw_protocol_ref_counted_handle) {
              nw::release_if_needed<nw_protocol *>((uint64_t *)type);
            }
LABEL_134:

            goto LABEL_135;
          }
        }
        __int16 v145 = __nwlog_obj();
        name = output_handler->identifier->name;
        *(_DWORD *)buf = 136446722;
        v202 = "__nw_protocol_updated_path";
        if (!name) {
          name = "invalid";
        }
        __int16 v203 = 2082;
        v204 = (char *)name;
        __int16 v205 = 2048;
        v206 = (const char *)output_handler;
        __int16 v147 = (char *)_os_log_send_and_compose_impl();

        os_log_type_t v196 = OS_LOG_TYPE_ERROR;
        char v195 = 0;
        if (!__nwlog_fault(v147, &v196, &v195)) {
          goto LABEL_252;
        }
        if (v196 == OS_LOG_TYPE_FAULT)
        {
          id v148 = __nwlog_obj();
          os_log_type_t v149 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            v150 = output_handler->identifier->name;
            if (!v150) {
              v150 = "invalid";
            }
            *(_DWORD *)buf = 136446722;
            v202 = "__nw_protocol_updated_path";
            __int16 v203 = 2082;
            v204 = (char *)v150;
            __int16 v205 = 2048;
            v206 = (const char *)output_handler;
            _os_log_impl(&dword_1830D4000, v148, v149, "%{public}s protocol %{public}s (%p) has invalid updated_path callback", buf, 0x20u);
          }
        }
        else
        {
          if (v195)
          {
            v160 = (char *)__nw_create_backtrace_string();
            v161 = __nwlog_obj();
            os_log_type_t v178 = v196;
            BOOL v162 = os_log_type_enabled(v161, v196);
            if (v160)
            {
              if (v162)
              {
                v163 = output_handler->identifier->name;
                if (!v163) {
                  v163 = "invalid";
                }
                *(_DWORD *)buf = 136446978;
                v202 = "__nw_protocol_updated_path";
                __int16 v203 = 2082;
                v204 = (char *)v163;
                __int16 v205 = 2048;
                v206 = (const char *)output_handler;
                __int16 v207 = 2082;
                v208 = v160;
                _os_log_impl(&dword_1830D4000, v161, v178, "%{public}s protocol %{public}s (%p) has invalid updated_path callback, dumping backtrace:%{public}s", buf, 0x2Au);
              }

              free(v160);
            }
            else
            {
              if (v162)
              {
                BOOL v175 = output_handler->identifier->name;
                if (!v175) {
                  BOOL v175 = "invalid";
                }
                *(_DWORD *)buf = 136446722;
                v202 = "__nw_protocol_updated_path";
                __int16 v203 = 2082;
                v204 = (char *)v175;
                __int16 v205 = 2048;
                v206 = (const char *)output_handler;
                _os_log_impl(&dword_1830D4000, v161, v178, "%{public}s protocol %{public}s (%p) has invalid updated_path callback, no backtrace", buf, 0x20u);
              }
            }
LABEL_252:
            if (!v147) {
              goto LABEL_130;
            }
LABEL_253:
            free(v147);
            goto LABEL_130;
          }
          id v148 = __nwlog_obj();
          os_log_type_t v173 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            os_log_type_t v174 = output_handler->identifier->name;
            if (!v174) {
              os_log_type_t v174 = "invalid";
            }
            *(_DWORD *)buf = 136446722;
            v202 = "__nw_protocol_updated_path";
            __int16 v203 = 2082;
            v204 = (char *)v174;
            __int16 v205 = 2048;
            v206 = (const char *)output_handler;
            _os_log_impl(&dword_1830D4000, v148, v173, "%{public}s protocol %{public}s (%p) has invalid updated_path callback, backtrace limit exceeded", buf, 0x20u);
          }
        }
      }
      else
      {
        v158 = __nwlog_obj();
        *(_DWORD *)buf = 136446210;
        v202 = "__nw_protocol_updated_path";
        __int16 v147 = (char *)_os_log_send_and_compose_impl();

        os_log_type_t v196 = OS_LOG_TYPE_ERROR;
        char v195 = 0;
        if (!__nwlog_fault(v147, &v196, &v195)) {
          goto LABEL_252;
        }
        if (v196 == OS_LOG_TYPE_FAULT)
        {
          id v148 = __nwlog_obj();
          os_log_type_t v159 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            *(_DWORD *)buf = 136446210;
            v202 = "__nw_protocol_updated_path";
            _os_log_impl(&dword_1830D4000, v148, v159, "%{public}s called with null path", buf, 0xCu);
          }
        }
        else if (v195)
        {
          v170 = (char *)__nw_create_backtrace_string();
          id v148 = __nwlog_obj();
          os_log_type_t v171 = v196;
          BOOL v172 = os_log_type_enabled(v148, v196);
          if (v170)
          {
            if (v172)
            {
              *(_DWORD *)buf = 136446466;
              v202 = "__nw_protocol_updated_path";
              __int16 v203 = 2082;
              v204 = v170;
              _os_log_impl(&dword_1830D4000, v148, v171, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v170);
            if (!v147) {
              goto LABEL_130;
            }
            goto LABEL_253;
          }
          if (v172)
          {
            *(_DWORD *)buf = 136446210;
            v202 = "__nw_protocol_updated_path";
            _os_log_impl(&dword_1830D4000, v148, v171, "%{public}s called with null path, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          id v148 = __nwlog_obj();
          os_log_type_t v176 = v196;
          if (os_log_type_enabled(v148, v196))
          {
            *(_DWORD *)buf = 136446210;
            v202 = "__nw_protocol_updated_path";
            _os_log_impl(&dword_1830D4000, v148, v176, "%{public}s called with null path, backtrace limit exceeded", buf, 0xCu);
          }
        }
      }

      goto LABEL_252;
    }
    if (*v23)
    {
      v90 = *v23;
      int v91 = v90[94];

      if (v91 == 1)
      {
        v77->event = (nw_endpoint_handler_event_s)393219;
        nw_endpoint_handler_report(v77, 0, &v77->event.domain, 0);
LABEL_173:

        id v11 = v186;
        goto LABEL_174;
      }
    }
    if (nw_endpoint_handler_get_minimize_logging(v77))
    {
      if (nw_endpoint_handler_get_logging_disabled(v77)) {
        goto LABEL_155;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      BOOL v94 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v138 = nw_endpoint_handler_get_id_string(v77);
        __int16 v139 = nw_endpoint_handler_dry_run_string(v77);
        nw_endpoint_t v140 = nw_endpoint_handler_copy_endpoint(v77);
        __int16 v141 = nw_endpoint_get_logging_description(v140);
        nw_endpoint_t v142 = nw_endpoint_handler_state_string(v77);
        __int16 v143 = nw_endpoint_handler_mode_string(v77);
        id v144 = nw_endpoint_handler_copy_current_path(v77);
        *(_DWORD *)buf = 136447746;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        __int16 v203 = 2082;
        v204 = (char *)v138;
        __int16 v205 = 2082;
        v206 = v139;
        __int16 v207 = 2082;
        v208 = (void *)v141;
        __int16 v209 = 2082;
        v210 = v142;
        __int16 v211 = 2082;
        v212 = v143;
        __int16 v213 = 2114;
        id v214 = v144;
        _os_log_impl(&dword_1830D4000, v94, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] path no longer satisfied, resetting", buf, 0x48u);
      }
    }
    else
    {
      v92 = v77;
      BOOL v93 = (*((unsigned char *)v56 + 268) & 0x20) == 0;

      if (!v93)
      {
LABEL_155:
        nw_endpoint_flow_failed_with_error(v77, 1, 0);
        goto LABEL_173;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      BOOL v94 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v95 = v92;

        v96 = v95;
        BOOL v97 = (*((unsigned char *)v56 + 268) & 1) == 0;

        if (v97) {
          v98 = "";
        }
        else {
          v98 = "dry-run ";
        }
        nw_endpoint_t v99 = nw_endpoint_handler_copy_endpoint(v96);
        uint64_t v100 = nw_endpoint_get_logging_description(v99);
        BOOL v101 = v96;
        v102 = v101;
        uint64_t v103 = v101[30];
        if (v103 > 5) {
          v104 = "unknown-state";
        }
        else {
          v104 = off_1E523FB38[v103];
        }

        v105 = v102;
        v106 = "path";
        switch(v187->mode)
        {
          case 0:
            break;
          case 1:
            v106 = "resolver";
            break;
          case 2:
            v106 = nw_endpoint_flow_mode_string(v105[31]);
            break;
          case 3:
            v106 = "proxy";
            break;
          case 4:
            v106 = "fallback";
            break;
          case 5:
            v106 = "transform";
            break;
          default:
            v106 = "unknown-mode";
            break;
        }
        v184 = v106;

        os_log_type_t v119 = v105;
        os_unfair_lock_lock((os_unfair_lock_t)v119 + 28);
        id v120 = v119[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v119 + 28);

        *(_DWORD *)buf = 136447746;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        __int16 v203 = 2082;
        v204 = v95->id_str;
        __int16 v205 = 2082;
        v206 = v98;
        __int16 v207 = 2082;
        v208 = (void *)v100;
        __int16 v209 = 2082;
        v210 = v104;
        __int16 v211 = 2082;
        v212 = v184;
        __int16 v213 = 2114;
        id v214 = v120;
        _os_log_impl(&dword_1830D4000, v94, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] path no longer satisfied, resetting", buf, 0x48u);
      }
    }

    goto LABEL_155;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v10 = (id)gLogObj;
  id v11 = v5;
  if (mode > 5) {
    int v12 = "unknown-mode";
  }
  else {
    int v12 = off_1E523FB08[mode];
  }
  *(_DWORD *)buf = 136446722;
  v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
  __int16 v203 = 2082;
  v204 = (char *)v12;
  __int16 v205 = 2082;
  v206 = "flow";
  id v13 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  LOBYTE(p_shared_protocol) = 0;
  if (__nwlog_fault(v13, type, &p_shared_protocol))
  {
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v14 = (id)gLogObj;
      os_log_type_t v15 = type[0];
      if (os_log_type_enabled(v14, type[0]))
      {
        if (mode > 5) {
          objc_super v16 = "unknown-mode";
        }
        else {
          objc_super v16 = off_1E523FB08[mode];
        }
        *(_DWORD *)buf = 136446722;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        __int16 v203 = 2082;
        v204 = (char *)v16;
        __int16 v205 = 2082;
        v206 = "flow";
        _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
      }
    }
    else if ((_BYTE)p_shared_protocol)
    {
      os_log_type_t v17 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v14 = (id)gLogObj;
      os_log_type_t v18 = type[0];
      BOOL v19 = os_log_type_enabled(v14, type[0]);
      if (v17)
      {
        if (v19)
        {
          if (mode > 5) {
            os_log_type_t v20 = "unknown-mode";
          }
          else {
            os_log_type_t v20 = off_1E523FB08[mode];
          }
          *(_DWORD *)buf = 136446978;
          v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
          __int16 v203 = 2082;
          v204 = (char *)v20;
          __int16 v205 = 2082;
          v206 = "flow";
          __int16 v207 = 2082;
          v208 = v17;
          _os_log_impl(&dword_1830D4000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s", buf, 0x2Au);
        }

        free(v17);
        if (v13) {
          goto LABEL_141;
        }
        goto LABEL_174;
      }
      if (v19)
      {
        if (mode > 5) {
          v74 = "unknown-mode";
        }
        else {
          v74 = off_1E523FB08[mode];
        }
        *(_DWORD *)buf = 136446722;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        __int16 v203 = 2082;
        v204 = (char *)v74;
        __int16 v205 = 2082;
        v206 = "flow";
        _os_log_impl(&dword_1830D4000, v14, v18, "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace", buf, 0x20u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v14 = (id)gLogObj;
      os_log_type_t v72 = type[0];
      if (os_log_type_enabled(v14, type[0]))
      {
        if (mode > 5) {
          v73 = "unknown-mode";
        }
        else {
          v73 = off_1E523FB08[mode];
        }
        *(_DWORD *)buf = 136446722;
        v202 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]";
        __int16 v203 = 2082;
        v204 = (char *)v73;
        __int16 v205 = 2082;
        v206 = "flow";
        _os_log_impl(&dword_1830D4000, v14, v72, "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded", buf, 0x20u);
      }
    }
  }
  if (v13) {
LABEL_141:
  }
    free(v13);
LABEL_174:
}

@end