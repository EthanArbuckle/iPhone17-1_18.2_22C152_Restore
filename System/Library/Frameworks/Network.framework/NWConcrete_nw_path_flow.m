@interface NWConcrete_nw_path_flow
- (NSString)description;
- (NWConcrete_nw_path_flow)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_path_flow

- (void)dealloc
{
  nexus_key = self->nexus_key;
  if (nexus_key)
  {
    free(nexus_key);
    self->nexus_key = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_path_flow;
  [(NWConcrete_nw_path_flow *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assigned_protocol, 0);
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->resolved_endpoints, 0);
  objc_storeStrong((id *)&self->discovered_endpoints, 0);
  objc_storeStrong((id *)&self->remote_endpoint, 0);
  objc_storeStrong((id *)&self->local_endpoint, 0);
  objc_storeStrong((id *)&self->nexus_agent, 0);

  objc_storeStrong((id *)&self->interface, 0);
}

- (NWConcrete_nw_path_flow)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_path_flow;
  v2 = [(NWConcrete_nw_path_flow *)&v16 init];
  v3 = v2;
  if (v2)
  {
    objc_super v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path_flow init]";
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
        v18 = "-[NWConcrete_nw_path_flow init]";
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
          v18 = "-[NWConcrete_nw_path_flow init]";
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
        v18 = "-[NWConcrete_nw_path_flow init]";
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
        v18 = "-[NWConcrete_nw_path_flow init]";
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

- (NSString)description
{
  v2 = nw_path_flow_copy_description(self);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  }

  return (NSString *)v2;
}

@end