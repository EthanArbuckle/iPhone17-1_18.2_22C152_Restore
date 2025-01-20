@interface NWConcrete_nw_pac_resolver
- (NWConcrete_nw_pac_resolver)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_pac_resolver

- (id).cxx_construct
{
  *((_DWORD *)self + 20) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 2, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (void)dealloc
{
  v2 = self;
  v3 = (const void *)*((void *)v2 + 3);
  if (v3)
  {
    CFRelease(v3);
    *((void *)v2 + 3) = 0;
  }
  v4 = (const void *)*((void *)v2 + 4);
  if (v4)
  {
    CFRelease(v4);
    *((void *)v2 + 4) = 0;
  }
  v5 = (const void *)*((void *)v2 + 5);
  if (v5)
  {
    CFRelease(v5);
    *((void *)v2 + 5) = 0;
  }

  v6.receiver = v2;
  v6.super_class = (Class)NWConcrete_nw_pac_resolver;
  [(NWConcrete_nw_pac_resolver *)&v6 dealloc];
}

- (NWConcrete_nw_pac_resolver)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_pac_resolver;
  v2 = [(NWConcrete_nw_pac_resolver *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  objc_super v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_pac_resolver init]";
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
        v18 = "-[NWConcrete_nw_pac_resolver init]";
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
          v18 = "-[NWConcrete_nw_pac_resolver init]";
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
        v18 = "-[NWConcrete_nw_pac_resolver init]";
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
        v18 = "-[NWConcrete_nw_pac_resolver init]";
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