@interface NWConcrete_nw_application_id
- (BOOL)initWithUUID:(long long *)a3 auditToken:(const char *)a4 pid:(char)a5 bundleID:isBundleIDExternal:systemService:;
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_application_id

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (BOOL)initWithUUID:(long long *)a3 auditToken:(const char *)a4 pid:(char)a5 bundleID:isBundleIDExternal:systemService:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int is_null = uuid_is_null(uu);
  if (!a4 && !a3 && is_null)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
      _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_ERROR, "%{public}s cannot create application id without application information", buf, 0xCu);
    }

    return 0;
  }
  v41.receiver = a1;
  v41.super_class = (Class)NWConcrete_nw_application_id;
  v12 = (char *)objc_msgSendSuper2(&v41, sel_init);
  if (!v12)
  {
    v27 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
    v28 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v44[0] = 0;
    if (__nwlog_fault(v28, type, v44))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v29 = __nwlog_obj();
        os_log_type_t v30 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_1830D4000, v29, v30, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v44[0])
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v29 = __nwlog_obj();
        os_log_type_t v36 = type[0];
        BOOL v37 = os_log_type_enabled(v29, type[0]);
        if (backtrace_string)
        {
          if (v37)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v29, v36, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_62;
        }
        if (v37)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_1830D4000, v29, v36, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v29 = __nwlog_obj();
        os_log_type_t v40 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_1830D4000, v29, v40, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_62:
    if (v28) {
      free(v28);
    }
    return 0;
  }
  if (uuid_is_null(uu))
  {
    if (a3 && *(void *)a3 | *((void *)a3 + 1) | *((void *)a3 + 2) | *((void *)a3 + 3))
    {
      long long v13 = *a3;
      *(_OWORD *)(v12 + 124) = a3[1];
      *(_OWORD *)(v12 + 108) = v13;
    }
    else
    {
      if (!a4)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_ERROR, "%{public}s cannot create application id without application information", buf, 0xCu);
        }

        return 0;
      }
      v14 = strdup(a4);
      if (!v14)
      {
        v38 = __nwlog_obj();
        os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "strict_strdup";
        v39 = (void *)_os_log_send_and_compose_impl();

        BOOL result = __nwlog_abort((uint64_t)v39);
        if (result) {
          goto LABEL_64;
        }
        free(v39);
      }
      *((void *)v12 + 10) = v14;
      v12[104] = a5;
    }
  }
  else
  {
    *((_OWORD *)v12 + 1) = *(_OWORD *)uu;
  }
  if (nw_utilities_get_self_name::onceToken != -1) {
    dispatch_once(&nw_utilities_get_self_name::onceToken, &__block_literal_global_11_44681);
  }
  v15 = (const char *)nw_utilities_get_self_name::name;
  if (!nw_utilities_get_self_name::name)
  {
    v31 = __nwlog_obj();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "strict_strdup";
    v32 = (void *)_os_log_send_and_compose_impl();

    BOOL result = __nwlog_abort((uint64_t)v32);
    if (result) {
      goto LABEL_64;
    }
    free(v32);
  }
  v16 = strdup(v15);
  if (v16) {
    goto LABEL_21;
  }
  v33 = __nwlog_obj();
  os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  *(void *)&buf[4] = "strict_strdup";
  v34 = (void *)_os_log_send_and_compose_impl();

  BOOL result = __nwlog_abort((uint64_t)v34);
  if (!result)
  {
    free(v34);
LABEL_21:
    *((void *)v12 + 9) = v16;
    v17 = v12;
    v18 = v17;
    long long v19 = *(_OWORD *)(v17 + 124);
    *(_OWORD *)type = *(_OWORD *)(v17 + 108);
    long long v43 = v19;
    if (*(void *)type | *(void *)&type[8] | (unint64_t)v19 | *((void *)&v19 + 1))
    {
      v20 = v17;
      int v21 = *((_DWORD *)v20 + 32);
      *((_DWORD *)v20 + 35) = v21;
      uint64_t v48 = 0;
      long long v47 = 0u;
      memset(buf, 0, sizeof(buf));
      if (proc_pidinfo(v21, 17, 1uLL, buf, 56) == 56)
      {
        *((_OWORD *)v20 + 1) = *(_OWORD *)buf;

        return (BOOL)v20;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v23 = (id)gLogObj;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 136446210;
        v45 = "nw_application_id_validate_audit_token";
        _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_ERROR, "%{public}s Failed to convert from audit token PID to UUID", v44, 0xCu);
      }

      goto LABEL_30;
    }
    if (*((void *)v17 + 10))
    {
      char v22 = nw_application_id_validate_bundle_id((NWConcrete_nw_application_id *)v17);

      if ((v22 & 1) == 0)
      {
LABEL_30:
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v24 = (id)gLogObj;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_1830D4000, v24, OS_LOG_TYPE_ERROR, "%{public}s application id validation failed", buf, 0xCu);
        }

        return 0;
      }
    }
    else
    {
    }
    return (BOOL)v18;
  }
LABEL_64:
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = (void *)*((void *)self + 9);
  if (v3)
  {
    free(v3);
    *((void *)self + 9) = 0;
  }
  v4 = (void *)*((void *)self + 10);
  if (v4)
  {
    free(v4);
    *((void *)self + 10) = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_application_id;
  [(NWConcrete_nw_application_id *)&v5 dealloc];
}

- (NSString)description
{
  v3 = (char *)self + 88;
  if (uuid_is_null((const unsigned __int8 *)self + 88))
  {
    v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<nw_application_id %p>", self);
  }
  else
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v3];
    v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<nw_application_id %p p:%@>", self, v5);
  }

  return (NSString *)v4;
}

@end