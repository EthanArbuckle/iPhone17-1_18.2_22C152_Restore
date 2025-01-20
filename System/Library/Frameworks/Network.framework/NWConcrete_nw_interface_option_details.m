@interface NWConcrete_nw_interface_option_details
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NWConcrete_nw_interface_option_details)init;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_interface_option_details

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->initial_data, 0);
  objc_storeStrong((id *)&self->remote_cid, 0);
  objc_storeStrong((id *)&self->local_cid, 0);
  objc_storeStrong((id *)&self->remote, 0);
  objc_storeStrong((id *)&self->evaluator, 0);

  objc_storeStrong((id *)&self->interface, 0);
}

- (NWConcrete_nw_interface_option_details)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_interface_option_details;
  v2 = [(NWConcrete_nw_interface_option_details *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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
          v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_interface_option_details;
  [(NWConcrete_nw_interface_option_details *)&v2 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NWConcrete_nw_interface_option_details *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = nw_interface_shallow_compare(self->interface, v5->interface)
        && nw_endpoint_is_equal(self->remote, v5->remote, 31)
        && !uuid_compare(self->nexus_agent, v5->nexus_agent)
        && nw_dispatch_data_is_equal((dispatch_data_t)self->local_cid, v5->local_cid)
        && nw_dispatch_data_is_equal((dispatch_data_t)self->remote_cid, v5->remote_cid)
        && self->sockfd == v5->sockfd;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)redactedDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (nwlog_get_sensitive_redacted::onceToken != -1) {
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_75);
  }
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    memset(out, 0, 37);
    uuid_unparse(self->nexus_agent, out);
    interface = self->interface;
    v4 = [(OS_nw_endpoint *)self->remote redactedDescription];
    uint64_t priority = self->priority;
    uint64_t sockfd = self->sockfd;
    v7 = [(OS_nw_path_evaluator *)self->evaluator redactedDescription];
    v8 = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@:%@ [%s, prio %d, fd %d, evaluator %@]", interface, v4, out, priority, sockfd, v7);
  }
  else
  {
    v8 = [(NWConcrete_nw_interface_option_details *)self description];
  }

  return v8;
}

- (NSString)description
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(out, 0, 37);
  uuid_unparse(self->nexus_agent, out);
  v3 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@:%@ [%s, prio %d, fd %d, evaluator %@]", self->interface, self->remote, out, self->priority, self->sockfd, self->evaluator);

  return (NSString *)v3;
}

@end