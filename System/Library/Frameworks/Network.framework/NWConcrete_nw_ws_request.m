@interface NWConcrete_nw_ws_request
- (NWConcrete_nw_ws_request)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_ws_request

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->header_values, 0);
  objc_storeStrong((id *)&self->header_names, 0);

  objc_storeStrong((id *)&self->subprotocols, 0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_ws_request;
  [(NWConcrete_nw_ws_request *)&v2 dealloc];
}

- (NWConcrete_nw_ws_request)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)NWConcrete_nw_ws_request;
  objc_super v2 = [(NWConcrete_nw_ws_request *)&v21 init];
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_array_create(0, 0);
    subprotocols = v2->subprotocols;
    v2->subprotocols = v3;

    v5 = (OS_xpc_object *)xpc_array_create(0, 0);
    header_names = v2->header_names;
    v2->header_names = v5;

    v7 = (OS_xpc_object *)xpc_array_create(0, 0);
    header_values = v2->header_values;
    v2->header_values = v7;

    v9 = v2;
    goto LABEL_3;
  }
  v11 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v23 = "-[NWConcrete_nw_ws_request init]";
  v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v19 = 0;
  if (__nwlog_fault(v12, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWConcrete_nw_ws_request init]";
        _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v19)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v13 = __nwlog_obj();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v23 = "-[NWConcrete_nw_ws_request init]";
          __int16 v24 = 2082;
          v25 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWConcrete_nw_ws_request init]";
        _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v13 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "-[NWConcrete_nw_ws_request init]";
        _os_log_impl(&dword_1830D4000, v13, v18, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v12) {
    free(v12);
  }
LABEL_3:

  return v2;
}

@end