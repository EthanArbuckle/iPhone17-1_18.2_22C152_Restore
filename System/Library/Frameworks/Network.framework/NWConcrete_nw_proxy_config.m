@interface NWConcrete_nw_proxy_config
- (NSString)description;
- (NWConcrete_nw_proxy_config)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_proxy_config

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->alternate_agents, 0);
  objc_storeStrong((id *)&self->preferred_domains, 0);
  objc_storeStrong((id *)&self->excluded_domains, 0);
  objc_storeStrong((id *)&self->match_domains, 0);
  objc_storeStrong((id *)&self->pac_script, 0);
  objc_storeStrong((id *)&self->credential, 0);
  objc_storeStrong((id *)&self->agent, 0);
  objc_storeStrong((id *)&self->fallback_config, 0);
  objc_storeStrong((id *)&self->resolved_endpoints, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
  objc_storeStrong((id *)&self->remove_protocols, 0);
  objc_storeStrong((id *)&self->required_protocols, 0);
  objc_storeStrong((id *)&self->proxied_transports, 0);

  objc_storeStrong((id *)&self->stacks, 0);
}

- (NSString)description
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  v4 = Mutable;
  switch(self->mode)
  {
    case 0:
      CFStringAppendFormat(Mutable, 0, @"Invalid Proxy");
      break;
    case 1:
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      char v14 = 0;
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2020000000;
      char v12 = 0;
      if (nw_dictionary_get_count((uint64_t)self->stacks))
      {
        stacks = self->stacks;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __41__NWConcrete_nw_proxy_config_description__block_invoke;
        v8[3] = &unk_1E5240D60;
        v8[4] = self;
        v8[5] = v13;
        v8[6] = &v9;
        v8[7] = v4;
        nw_dictionary_apply((uint64_t)stacks, (uint64_t)v8);
      }
      if (!*((unsigned char *)v10 + 24)) {
        CFStringAppendFormat(v4, 0, @"%@", self->endpoint);
      }
      _Block_object_dispose(&v9, 8);
      _Block_object_dispose(v13, 8);
      break;
    case 2:
      endpoint = self->endpoint;
      goto LABEL_10;
    case 3:
      endpoint = self->pac_script;
LABEL_10:
      CFStringAppendFormat(Mutable, 0, @"PAC: %@", endpoint);
      break;
    case 4:
      CFStringAppendFormat(Mutable, 0, @"No Proxy");
      break;
    default:
      break;
  }

  return (NSString *)v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_proxy_config;
  [(NWConcrete_nw_proxy_config *)&v2 dealloc];
}

- (NWConcrete_nw_proxy_config)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_proxy_config;
  objc_super v2 = [(NWConcrete_nw_proxy_config *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_proxy_config init]";
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
        v18 = "-[NWConcrete_nw_proxy_config init]";
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
          v18 = "-[NWConcrete_nw_proxy_config init]";
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
        v18 = "-[NWConcrete_nw_proxy_config init]";
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
        v18 = "-[NWConcrete_nw_proxy_config init]";
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