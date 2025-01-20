@interface NWConcrete_nw_agent
- (NWConcrete_nw_agent)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_agent

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *(_OWORD *)((char *)self + 360) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *(_OWORD *)((char *)self + 504) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *((_OWORD *)self + 39) = 0u;
  *(_OWORD *)((char *)self + 648) = 0u;
  *((_OWORD *)self + 42) = 0u;
  *(_OWORD *)((char *)self + 696) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 106, 0);
  objc_storeStrong((id *)self + 105, 0);
  objc_storeStrong((id *)self + 104, 0);
  objc_storeStrong((id *)self + 103, 0);
  objc_storeStrong((id *)self + 102, 0);
  objc_storeStrong((id *)self + 101, 0);
  objc_storeStrong((id *)self + 100, 0);
  objc_storeStrong((id *)self + 99, 0);
  objc_storeStrong((id *)self + 98, 0);
  objc_storeStrong((id *)self + 97, 0);
  objc_storeStrong((id *)self + 96, 0);
  objc_storeStrong((id *)self + 95, 0);
  objc_storeStrong((id *)self + 94, 0);
  objc_storeStrong((id *)self + 93, 0);
  objc_storeStrong((id *)self + 92, 0);

  objc_storeStrong((id *)self + 31, 0);
  objc_storeStrong((id *)self + 30, 0);
  objc_storeStrong((id *)self + 28, 0);

  objc_storeStrong((id *)self + 27, 0);
}

- (void)dealloc
{
  if (*((unsigned char *)self + 712))
  {
    unint64_t v3 = 0;
    v4 = (void **)((char *)self + 368);
    do
    {
      v5 = *(v4 - 1);
      *(v4 - 1) = 0;

      v6 = *v4;
      *v4 = 0;
      v4 += 3;

      ++v3;
    }
    while (v3 < *((unsigned __int8 *)self + 712));
  }
  v7 = *((void *)self + 106);
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = (void *)*((void *)self + 106);
    *((void *)self + 106) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_agent;
  [(NWConcrete_nw_agent *)&v9 dealloc];
}

- (NWConcrete_nw_agent)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)NWConcrete_nw_agent;
  id v2 = [(NWConcrete_nw_agent *)&v18 init];
  unint64_t v3 = v2;
  if (v2)
  {
    uuid_generate_random((unsigned __int8 *)v2 + 720);
    v4 = nw_dictionary_create();
    v5 = (void *)v3[92];
    v3[92] = v4;

    *((_DWORD *)v3 + 3) = nw_agent_get_next_id();
    v6 = v3;
    goto LABEL_3;
  }
  v8 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWConcrete_nw_agent init]";
  objc_super v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v9, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v10 = __nwlog_obj();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_agent init]";
        _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v16)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v10 = __nwlog_obj();
      os_log_type_t v13 = type;
      BOOL v14 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136446466;
          v20 = "-[NWConcrete_nw_agent init]";
          __int16 v21 = 2082;
          v22 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v10, v13, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v14)
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_agent init]";
        _os_log_impl(&dword_1830D4000, v10, v13, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v10 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_agent init]";
        _os_log_impl(&dword_1830D4000, v10, v15, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v9) {
    free(v9);
  }
LABEL_3:

  return (NWConcrete_nw_agent *)v3;
}

@end