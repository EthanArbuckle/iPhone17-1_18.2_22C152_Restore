@interface NWConcrete_nw_connection
- (BOOL)initWithEndpoint:(void *)a3 parameters:(int)a4 identifier:;
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_connection

- (BOOL)initWithEndpoint:(void *)a3 parameters:(int)a4 identifier:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v8 = a2;
  id v9 = a3;
  if (!a1)
  {
LABEL_37:

    return (BOOL)a1;
  }
  v45.receiver = a1;
  v45.super_class = (Class)NWConcrete_nw_connection;
  id v10 = objc_msgSendSuper2(&v45, sel_init);
  if (!v10)
  {
    v34 = __nwlog_obj();
    *(_DWORD *)__str = 136446210;
    *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
    v35 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    char v44 = 0;
    if (__nwlog_fault(v35, buf, &v44))
    {
      if (buf[0] == 17)
      {
        v36 = __nwlog_obj();
        os_log_type_t v37 = buf[0];
        if (os_log_type_enabled(v36, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__str = 136446210;
          *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
          _os_log_impl(&dword_1830D4000, v36, v37, "%{public}s [super init] failed", (uint8_t *)__str, 0xCu);
        }
      }
      else if (v44)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v36 = __nwlog_obj();
        os_log_type_t v41 = buf[0];
        BOOL v42 = os_log_type_enabled(v36, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v42)
          {
            *(_DWORD *)__str = 136446466;
            *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
            *(_WORD *)&__str[12] = 2082;
            *(void *)&__str[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v36, v41, "%{public}s [super init] failed, dumping backtrace:%{public}s", (uint8_t *)__str, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_56;
        }
        if (v42)
        {
          *(_DWORD *)__str = 136446210;
          *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
          _os_log_impl(&dword_1830D4000, v36, v41, "%{public}s [super init] failed, no backtrace", (uint8_t *)__str, 0xCu);
        }
      }
      else
      {
        v36 = __nwlog_obj();
        os_log_type_t v43 = buf[0];
        if (os_log_type_enabled(v36, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__str = 136446210;
          *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
          _os_log_impl(&dword_1830D4000, v36, v43, "%{public}s [super init] failed, backtrace limit exceeded", (uint8_t *)__str, 0xCu);
        }
      }
    }
LABEL_56:
    if (v35) {
      free(v35);
    }
    a1 = 0;
    goto LABEL_37;
  }
  v11 = (char *)v10;
  *((_WORD *)v11 + 160) = 16;
  v12 = malloc_type_calloc(0x10uLL, 0x10uLL, 0xEAFB8F1AuLL);
  if (v12)
  {
LABEL_4:
    *((void *)v11 + 39) = v12;

    v13 = (void **)(v11 + 16);
    objc_storeStrong((id *)v11 + 2, a3);
    if (nw_endpoint_get_type(v8) == nw_endpoint_type_url)
    {
      BOOL v14 = nw_endpoint_copy_host_port_endpoint_for_url(v8);
      v15 = (void *)*((void *)v11 + 1);
      *((void *)v11 + 1) = v14;

      nw_parameters_set_url_endpoint(*((void **)v11 + 2), v8);
    }
    else
    {
      objc_storeStrong((id *)v11 + 1, a2);
    }
    if (!nw_parameters_get_sensitive_redacted(*v13)) {
      nw_endpoint_set_do_not_redact(*((void **)v11 + 1));
    }
    *((_DWORD *)v11 + 112) = a4;
    if (!a4) {
      *((_DWORD *)v11 + 112) = nw_endpoint_handler_get_next_top_id();
    }
    id v16 = nw_parameters_copy_context(*((void **)v11 + 2));
    v17 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v16;

    if (nw_context_is_inline(*((void **)v11 + 3)))
    {
      v18 = (void *)*((void *)v11 + 5);
      *((void *)v11 + 5) = 0;
    }
    else
    {
      BOOL v19 = nw_context_copy_workloop(*((void **)v11 + 3));
      v18 = (void *)*((void *)v11 + 5);
      *((void *)v11 + 5) = v19;
    }

    memset(__str, 0, 39);
    snprintf(__str, 0x27uLL, "com.apple.network.connection-%u", *((_DWORD *)v11 + 112));
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create_with_target_V2(__str, v20, *((dispatch_queue_t *)v11 + 5));
    v22 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v21;

    uuid_generate_random((unsigned __int8 *)v11 + 452);
    nw_parameters_get_pid(*v13);
    nw_parameters_get_effective_bundle_id(*v13);
    if (_symptoms_is_daemon_fallback_blacklisted()) {
      nw_parameters_set_no_cellular_fallback(*v13, 1);
    }
    v23 = v11;
    if (_os_feature_enabled_impl())
    {
      id v24 = nw_parameters_copy_url_endpoint(*v13);
      v25 = v24;
      if (v24)
      {
        id v26 = v24;
        v27 = (const char *)[v26 hostname];

        uint64_t url_path = nw_endpoint_get_url_path(v26);
        if (v27)
        {
          v29 = (char *)url_path;
          if (url_path)
          {
            if (!strcmp(v27, "safebrowsing.googleapis.com")
              && (strstr(v29, "fullHashes") || strstr(v29, "threatListUpdates")))
            {
              xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
              xpc_dictionary_set_BOOL(v30, "HTTPSEnable", 1);
              xpc_dictionary_set_int64(v30, "HTTPSPort", 80);
              xpc_dictionary_set_string(v30, "HTTPSProxy", "safebrowsing-proxy.networking.apple");
              nw_parameters_set_proxy_configuration(*v13, v30);
              if (*v13 && !nw_path_parameters_get_logging_disabled(*((void *)*v13 + 13)))
              {
                if (__nwlog_connection_log::onceToken != -1) {
                  dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
                }
                v31 = (id)gconnectionLogObj;
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  int v32 = *((_DWORD *)v11 + 112);
                  *(_DWORD *)buf = 136446466;
                  *(void *)&buf[4] = "nw_connection_apply_proxy_feature_flags";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v32;
                  _os_log_impl(&dword_1830D4000, v31, OS_LOG_TYPE_INFO, "%{public}s [C%u] Applying proxy to Safe Browsing URL", buf, 0x12u);
                }
              }
            }
          }
        }
      }
    }
    if (_os_feature_enabled_impl()) {
      nw_parameters_disable_legacy_tls_versions(*v13);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    nw_endpoint_get_agent_identifier(v23[1], buf);
    if (!uuid_is_null(buf)) {
      nw_parameters_require_netagent_uuid(*v13, buf);
    }
    *((_DWORD *)v23 + 34) = 0;
    v23[33] = 0;
    v23[34] = v23 + 33;
    *((_DWORD *)v23 + 126) = 0;
    a1 = v23;
    goto LABEL_37;
  }
  v38 = __nwlog_obj();
  os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
  *(_DWORD *)__str = 136446722;
  *(void *)&__str[4] = "strict_calloc";
  *(_WORD *)&__str[12] = 2048;
  *(void *)&__str[14] = 16;
  *(_WORD *)&__str[22] = 2048;
  *(void *)&__str[24] = 16;
  v39 = (void *)_os_log_send_and_compose_impl();

  BOOL result = __nwlog_abort((uint64_t)v39);
  if (!result)
  {
    free(v39);
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_internal_reference)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)dispatch_queue_t v21 = "-[NWConcrete_nw_connection dealloc]";
    v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v18 = 0;
    if (!__nwlog_fault(v4, &type, &v18)) {
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
        *(void *)dispatch_queue_t v21 = "-[NWConcrete_nw_connection dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v6, "%{public}s over-release of nw_connection_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
LABEL_6:

LABEL_7:
      if (!v4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if (!v18)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)dispatch_queue_t v21 = "-[NWConcrete_nw_connection dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v16, "%{public}s over-release of nw_connection_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_6;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    os_log_type_t v14 = type;
    BOOL v15 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)dispatch_queue_t v21 = "-[NWConcrete_nw_connection dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v14, "%{public}s over-release of nw_connection_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)dispatch_queue_t v21 = "-[NWConcrete_nw_connection dealloc]";
      *(_WORD *)&v21[8] = 2082;
      *(void *)&v21[10] = backtrace_string;
      _os_log_impl(&dword_1830D4000, v5, v14, "%{public}s over-release of nw_connection_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
    if (v4) {
LABEL_8:
    }
      free(v4);
  }
LABEL_9:
  if (!nw_parameters_get_logging_disabled((uint64_t)self->parameters))
  {
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v7 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned int top_id = self->top_id;
      logging_description = nw_endpoint_get_logging_description(self->endpoint);
      parameters = self->parameters;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)dispatch_queue_t v21 = top_id;
      *(_WORD *)&v21[4] = 2082;
      *(void *)&v21[6] = logging_description;
      *(_WORD *)&v21[14] = 2114;
      *(void *)&v21[16] = parameters;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_INFO, "[C%u %{public}s %{public}@] dealloc", buf, 0x1Cu);
    }
  }
  timestamps = self->timestamps;
  if (timestamps)
  {
    free(timestamps);
    self->timestamps = 0;
  }
  stats_report = self->stats_report;
  if (stats_report)
  {
    free(stats_report);
    self->stats_report = 0;
  }
  nw_connection_cancel_update_handler(self);
  v17.receiver = self;
  v17.super_class = (Class)NWConcrete_nw_connection;
  [(NWConcrete_nw_connection *)&v17 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->current_interface, 0);
  objc_storeStrong(&self->interface_use_update_block, 0);
  objc_storeStrong((id *)&self->errors, 0);
  objc_storeStrong((id *)&self->failed_resolution_report, 0);
  objc_storeStrong((id *)&self->data_transfer_reports, 0);
  objc_storeStrong((id *)&self->establishment_report, 0);
  objc_storeStrong((id *)&self->cancel_group, 0);
  objc_storeStrong((id *)&self->probes, 0);
  objc_storeStrong((id *)&self->activities, 0);
  objc_storeStrong(&self->low_throughput_handler, 0);
  objc_storeStrong((id *)&self->attempted_endpoints, 0);
  objc_storeStrong(&self->path_changed_handler, 0);
  objc_storeStrong(&self->alternate_path_state_handler, 0);
  objc_storeStrong(&self->better_path_available_handler, 0);
  objc_storeStrong(&self->viability_changed_handler, 0);
  objc_storeStrong(&self->cancel_handler, 0);
  objc_storeStrong(&self->client_handler, 0);
  objc_storeStrong((id *)&self->client_queue, 0);
  objc_storeStrong((id *)&self->ready_dry_run_endpoint_handler, 0);
  objc_storeStrong((id *)&self->dry_run_endpoint_handler, 0);
  objc_storeStrong((id *)&self->initial_read_requests, 0);
  objc_storeStrong((id *)&self->initial_write_requests, 0);
  objc_storeStrong((id *)&self->transport_endpoint_handler, 0);
  objc_storeStrong((id *)&self->parent_endpoint_handler, 0);
  objc_storeStrong((id *)&self->batched_receives, 0);
  objc_storeStrong((id *)&self->batched_sends, 0);
  objc_storeStrong((id *)&self->start_trace, 0);
  objc_storeStrong((id *)&self->ids_info, 0);
  objc_storeStrong((id *)&self->candidate_manager, 0);
  objc_storeStrong((id *)&self->_internal_reference, 0);
  objc_storeStrong((id *)&self->workloop, 0);
  objc_storeStrong((id *)&self->request_queue, 0);
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->parameters, 0);

  objc_storeStrong((id *)&self->endpoint, 0);
}

- (id)redactedDescription
{
  v2 = nw_connection_copy_description_level(self, 2);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  }

  return v2;
}

- (NSString)description
{
  v2 = nw_connection_copy_description(&self->super);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  }

  return (NSString *)v2;
}

@end