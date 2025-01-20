@interface OS_nw_parallel_array
- (void)dealloc;
@end

@implementation OS_nw_parallel_array

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    isa = self[2].super.super.isa;
    if (isa)
    {
      Class v4 = self[3].super.super.isa;
      Class v5 = self[2].super.super.isa;
      if (v4 != isa)
      {
        Class v6 = self[3].super.super.isa;
        do
        {
          v8 = (void *)*((void *)v6 - 1);
          Class v6 = (Class)((char *)v6 - 8);
          v7 = v8;
          if (v8) {
            os_release(v7);
          }
          *((void *)v4 - 1) = 0;
          Class v4 = v6;
        }
        while (v6 != isa);
        Class v5 = self[2].super.super.isa;
      }
      self[3].super.super.isa = isa;
      operator delete(v5);
    }
    v9 = self[5].super.super.isa;
    if (v9)
    {
      Class v10 = self[6].super.super.isa;
      Class v11 = self[5].super.super.isa;
      if (v10 != v9)
      {
        Class v12 = self[6].super.super.isa;
        do
        {
          v14 = (void *)*((void *)v12 - 1);
          Class v12 = (Class)((char *)v12 - 8);
          v13 = v14;
          if (v14) {
            os_release(v13);
          }
          *((void *)v10 - 1) = 0;
          Class v10 = v12;
        }
        while (v12 != v9);
        Class v11 = self[5].super.super.isa;
      }
      self[6].super.super.isa = v9;
      operator delete(v11);
    }
    goto LABEL_18;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  *(_DWORD *)buf = 136446210;
  v27 = "nw_parallel_array_dispose";
  int v22 = 12;
  v21 = buf;
  v15 = (char *)_os_log_send_and_compose_impl();
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v15, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = gLogObj;
      os_log_type_t v17 = type;
      if (!os_log_type_enabled((os_log_t)gLogObj, type)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136446210;
      v27 = "nw_parallel_array_dispose";
      v18 = "%{public}s called with null object";
      goto LABEL_32;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = gLogObj;
      os_log_type_t v17 = type;
      if (!os_log_type_enabled((os_log_t)gLogObj, type)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136446210;
      v27 = "nw_parallel_array_dispose";
      v18 = "%{public}s called with null object, backtrace limit exceeded";
      goto LABEL_32;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = gLogObj;
    os_log_type_t v17 = type;
    BOOL v20 = os_log_type_enabled((os_log_t)gLogObj, type);
    if (backtrace_string)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "nw_parallel_array_dispose";
        __int16 v28 = 2082;
        v29 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s called with null object, dumping backtrace:%{public}s", buf, 0x16u);
      }
      free(backtrace_string);
      goto LABEL_33;
    }
    if (v20)
    {
      *(_DWORD *)buf = 136446210;
      v27 = "nw_parallel_array_dispose";
      v18 = "%{public}s called with null object, no backtrace";
LABEL_32:
      _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
    }
  }
LABEL_33:
  if (v15) {
    free(v15);
  }
LABEL_18:
  v23.receiver = self;
  v23.super_class = (Class)OS_nw_parallel_array;
  [(OS_nw_parallel_array *)&v23 dealloc];
}

@end