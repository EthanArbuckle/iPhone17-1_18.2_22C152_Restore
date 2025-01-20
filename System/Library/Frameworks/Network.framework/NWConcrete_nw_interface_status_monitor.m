@interface NWConcrete_nw_interface_status_monitor
- (NSString)description;
- (NWConcrete_nw_interface_status_monitor)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_interface_status_monitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->update_handler_queue, 0);
  objc_storeStrong(&self->update_handler, 0);
  objc_storeStrong((id *)&self->packet_handler_queue, 0);
  objc_storeStrong(&self->packet_handler, 0);
  objc_storeStrong((id *)&self->channel, 0);

  objc_storeStrong((id *)&self->interface, 0);
}

- (NSString)description
{
  v2 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<nw_interface_status_monitor %@>", self->interface);

  return (NSString *)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_interface_status_monitor;
  [(NWConcrete_nw_interface_status_monitor *)&v2 dealloc];
}

- (NWConcrete_nw_interface_status_monitor)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_interface_status_monitor;
  objc_super v2 = [(NWConcrete_nw_interface_status_monitor *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_interface_status_monitor init]";
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
        v18 = "-[NWConcrete_nw_interface_status_monitor init]";
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
          v18 = "-[NWConcrete_nw_interface_status_monitor init]";
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
        v18 = "-[NWConcrete_nw_interface_status_monitor init]";
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
        v18 = "-[NWConcrete_nw_interface_status_monitor init]";
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