@interface NWConcrete_nw_group_descriptor
- (NSString)description;
- (uint64_t)initWithType:(void *)a3 member:(_OWORD *)a4 groupID:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_group_descriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->specific_source, 0);

  objc_storeStrong((id *)&self->members, 0);
}

- (NSString)description
{
  uint64_t type = self->type;
  if (type > 4) {
    v3 = "unknown";
  }
  else {
    v3 = off_1E523BC90[type];
  }
  v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<%s %@>", v3, self->members);

  return (NSString *)v4;
}

- (void)dealloc
{
  members = self->members;
  self->members = 0;

  specific_source = self->specific_source;
  self->specific_source = 0;

  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_group_descriptor;
  [(NWConcrete_nw_group_descriptor *)&v5 dealloc];
}

- (uint64_t)initWithType:(void *)a3 member:(_OWORD *)a4 groupID:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a1) {
    goto LABEL_19;
  }
  v35.receiver = a1;
  v35.super_class = (Class)NWConcrete_nw_group_descriptor;
  v8 = (unsigned __int8 *)objc_msgSendSuper2(&v35, sel_init);
  a1 = (uint64_t *)v8;
  if (!v8)
  {
    v17 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (__nwlog_fault(v18, &type, &v33))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v19 = __nwlog_obj();
        os_log_type_t v20 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v19 = __nwlog_obj();
        os_log_type_t v26 = type;
        BOOL v27 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136446466;
            v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
            __int16 v38 = 2082;
            v39 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v19, v26, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_49;
        }
        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_1830D4000, v19, v26, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v19 = __nwlog_obj();
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_1830D4000, v19, v31, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_49:
    if (v18) {
      free(v18);
    }
    goto LABEL_18;
  }
  if (!a2)
  {
    v21 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (__nwlog_fault(v22, &type, &v33))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v23 = __nwlog_obj();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_1830D4000, v23, v24, "%{public}s called with null _type", buf, 0xCu);
        }
      }
      else if (v33)
      {
        v28 = (char *)__nw_create_backtrace_string();
        v23 = __nwlog_obj();
        os_log_type_t v29 = type;
        BOOL v30 = os_log_type_enabled(v23, type);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 136446466;
            v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
            __int16 v38 = 2082;
            v39 = v28;
            _os_log_impl(&dword_1830D4000, v23, v29, "%{public}s called with null _type, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v28);
          goto LABEL_54;
        }
        if (v30)
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_1830D4000, v23, v29, "%{public}s called with null _type, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v23 = __nwlog_obj();
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_1830D4000, v23, v32, "%{public}s called with null _type, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_54:
    if (v22) {
      free(v22);
    }

    goto LABEL_18;
  }
  v9 = v8 + 16;
  if (a4) {
    *(_OWORD *)v9 = *a4;
  }
  else {
    uuid_generate_random(v9);
  }
  *((_DWORD *)a1 + 2) = a2;
  if (v7 && !nw_group_descriptor_allows_endpoint(a1, v7))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *((unsigned int *)a1 + 2);
      if (v14 > 4) {
        v15 = "unknown";
      }
      else {
        v15 = off_1E523BC90[v14];
      }
      *(_DWORD *)buf = 136446466;
      v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
      __int16 v38 = 2080;
      v39 = (void *)v15;
      _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, "%{public}s Invalid endpoint type specified for group descriptor of type %s", buf, 0x16u);
    }

LABEL_18:
    a1 = 0;
    goto LABEL_19;
  }
  BOOL v10 = nw_array_create();
  v11 = (void *)a1[4];
  a1[4] = v10;

  if (v7) {
    nw_array_append(a1[4], v7);
  }
  v12 = (void *)a1[5];
  a1[5] = 0;

  *((unsigned char *)a1 + 48) &= ~1u;
LABEL_19:

  return a1;
}

@end