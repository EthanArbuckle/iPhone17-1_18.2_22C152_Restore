@interface ZL40
@end

@implementation ZL40

void _ZL40_nw_content_context_default_stream_block_block_invoke_3()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v0 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v13 = "_ZL40_nw_content_context_default_stream_block_block_invoke_3";
  v1 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v10 = 0;
  if (!__nwlog_fault(v1, &type, &v10)) {
    goto LABEL_10;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v2 = (id)gLogObj;
    os_log_type_t v3 = type;
    if (!os_log_type_enabled(v2, type)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136446210;
    v13 = "_ZL40_nw_content_context_default_stream_block_block_invoke_3";
    v4 = "%{public}s _nw_content_context_default_stream invoked directly";
LABEL_15:
    v8 = v2;
    os_log_type_t v9 = v3;
LABEL_16:
    _os_log_impl(&dword_1830D4000, v8, v9, v4, buf, 0xCu);
    goto LABEL_17;
  }
  if (!v10)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v2 = (id)gLogObj;
    os_log_type_t v3 = type;
    if (!os_log_type_enabled(v2, type)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136446210;
    v13 = "_ZL40_nw_content_context_default_stream_block_block_invoke_3";
    v4 = "%{public}s _nw_content_context_default_stream invoked directly, backtrace limit exceeded";
    goto LABEL_15;
  }
  backtrace_string = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  os_log_type_t v6 = type;
  BOOL v7 = os_log_type_enabled(v2, type);
  if (backtrace_string)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136446466;
      v13 = "_ZL40_nw_content_context_default_stream_block_block_invoke_3";
      __int16 v14 = 2082;
      v15 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v2, v6, "%{public}s _nw_content_context_default_stream invoked directly, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
LABEL_10:
    if (!v1) {
      return;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    *(_DWORD *)buf = 136446210;
    v13 = "_ZL40_nw_content_context_default_stream_block_block_invoke_3";
    v4 = "%{public}s _nw_content_context_default_stream invoked directly, no backtrace";
    v8 = v2;
    os_log_type_t v9 = v6;
    goto LABEL_16;
  }
LABEL_17:

  if (v1) {
LABEL_11:
  }
    free(v1);
}

@end