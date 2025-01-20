@interface NWConcrete_nw_h3_0rtt_storage_canvas
- (NWConcrete_nw_h3_0rtt_storage_canvas)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_h3_0rtt_storage_canvas

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tls_state, 0);
  objc_storeStrong((id *)&self->quic_state, 0);

  objc_storeStrong((id *)&self->settings_data, 0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_h3_0rtt_storage_canvas;
  [(NWConcrete_nw_h3_0rtt_storage_canvas *)&v2 dealloc];
}

- (NWConcrete_nw_h3_0rtt_storage_canvas)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NWConcrete_nw_h3_0rtt_storage_canvas;
  objc_super v2 = [(NWConcrete_nw_h3_0rtt_storage_canvas *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
        v10 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v8 = __nwlog_obj();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
            __int16 v18 = 2082;
            v19 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v12) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
        v10 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
        v10 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

@end