@interface _NWHTTPConnectionInfo
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isValid;
- (void)sendPingWithReceiveHandler:(id)a3;
@end

@implementation _NWHTTPConnectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrapper, 0);

  objc_storeStrong((id *)&self->_connectionMetadata, 0);
}

- (BOOL)isValid
{
  if (self) {
    self = (_NWHTTPConnectionInfo *)self->_connectionMetadata;
  }
  return !nw_http_connection_metadata_get_is_closed(self);
}

- (void)sendPingWithReceiveHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    connectionMetadata = self->_connectionMetadata;
  }
  else {
    connectionMetadata = 0;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke;
  v28[3] = &unk_1E52427E8;
  v28[4] = self;
  id v29 = v4;
  id v6 = v4;
  v7 = connectionMetadata;
  v8 = v28;
  if (!v7)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v30 = 0;
    if (!__nwlog_fault(v15, &type, &v30)) {
      goto LABEL_44;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s called with null metadata", buf, 0xCu);
      }
    }
    else if (v30)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      os_log_type_t v21 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v16, v21, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_44:
        if (!v15) {
          goto LABEL_10;
        }
LABEL_45:
        free(v15);
        goto LABEL_10;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_1830D4000, v16, v21, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
        _os_log_impl(&dword_1830D4000, v16, v26, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_43:

    goto LABEL_44;
  }
  v9 = v7;
  id v10 = v9[1];

  if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
  }
  BOOL is_equal_unsafe = nw_protocol_definition_is_equal_unsafe((uint64_t)v10, nw_protocol_copy_http_connection_definition_definition);

  if (is_equal_unsafe)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __nw_http_connection_metadata_send_ping_block_invoke;
    v33 = &unk_1E52491D8;
    v12 = v9;
    v34 = v12;
    v13 = v8;
    id v35 = v13;
    if (v12[4])
    {
      (*(void (**)(unsigned char *))&buf[16])(buf);
      v13 = v35;
    }

    goto LABEL_10;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v18 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
  v15 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v30 = 0;
  if (!__nwlog_fault(v15, &type, &v30)) {
    goto LABEL_44;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    os_log_type_t v19 = type;
    if (os_log_type_enabled(v16, type))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
      _os_log_impl(&dword_1830D4000, v16, v19, "%{public}s metadata must be http_connection", buf, 0xCu);
    }
    goto LABEL_43;
  }
  if (!v30)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    os_log_type_t v27 = type;
    if (os_log_type_enabled(v16, type))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
      _os_log_impl(&dword_1830D4000, v16, v27, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_43;
  }
  v23 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v16 = (id)gLogObj;
  os_log_type_t v24 = type;
  BOOL v25 = os_log_type_enabled(v16, type);
  if (!v23)
  {
    if (v25)
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
      _os_log_impl(&dword_1830D4000, v16, v24, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
    }
    goto LABEL_43;
  }
  if (v25)
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "nw_http_connection_metadata_send_ping";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v23;
    _os_log_impl(&dword_1830D4000, v16, v24, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v23);
  if (v15) {
    goto LABEL_45;
  }
LABEL_10:
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NWHTTPConnectionInfo;
  if (-[_NWHTTPConnectionInfo isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

@end