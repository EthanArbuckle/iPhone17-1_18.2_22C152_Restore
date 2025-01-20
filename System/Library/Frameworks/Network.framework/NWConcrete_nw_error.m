@interface NWConcrete_nw_error
- (NSString)description;
- initWithDomain:(int)a3 code:;
@end

@implementation NWConcrete_nw_error

- initWithDomain:(int)a3 code:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  v15.receiver = result;
  v15.super_class = (Class)NWConcrete_nw_error;
  result = objc_msgSendSuper2(&v15, sel_init);
  if (result)
  {
    result[2] = a2;
    result[3] = a3;
    return result;
  }
  v5 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
  v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v6, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v7 = __nwlog_obj();
      os_log_type_t v8 = type;
      if (os_log_type_enabled(v7, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_1830D4000, v7, v8, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v13)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v7 = __nwlog_obj();
      os_log_type_t v10 = type;
      BOOL v11 = os_log_type_enabled(v7, type);
      if (backtrace_string)
      {
        if (v11)
        {
          *(_DWORD *)buf = 136446466;
          v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
          __int16 v18 = 2082;
          v19 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_21;
      }
      if (v11)
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v7 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v7, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_1830D4000, v7, v12, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_21:
  if (v6) {
    free(v6);
  }
  return 0;
}

- (NSString)description
{
  *(void *)&v43[61] = *MEMORY[0x1E4F143B8];
  switch(self->domain)
  {
    case 0:
      v3 = @"Invalid";
      goto LABEL_59;
    case 1:
      if (strerror_r(self->code, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      v3 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], __strerrbuf, 0x8000100u);
      if (v3) {
        goto LABEL_59;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v4 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v37 = "-[NWConcrete_nw_error description]";
      v5 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v34 = 0;
      if (!__nwlog_fault(v5, &type, &v34)) {
        goto LABEL_65;
      }
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v6 = (id)gLogObj;
        os_log_type_t v7 = type;
        if (os_log_type_enabled(v6, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_1830D4000, v6, v7, "%{public}s CFStringCreateWithCString failed", buf, 0xCu);
        }
LABEL_64:

LABEL_65:
        if (v5) {
          goto LABEL_66;
        }
        goto LABEL_59;
      }
      if (!v34)
      {
        v6 = __nwlog_obj();
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v6, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_1830D4000, v6, v31, "%{public}s CFStringCreateWithCString failed, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_64;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v6 = __nwlog_obj();
      os_log_type_t v26 = type;
      BOOL v27 = os_log_type_enabled(v6, type);
      if (!backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_1830D4000, v6, v26, "%{public}s CFStringCreateWithCString failed, no backtrace", buf, 0xCu);
        }
        goto LABEL_64;
      }
      if (v27)
      {
        *(_DWORD *)buf = 136446466;
        v37 = "-[NWConcrete_nw_error description]";
        __int16 v38 = 2082;
        v39 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v6, v26, "%{public}s CFStringCreateWithCString failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
      if (v5)
      {
LABEL_66:
        free(v5);
        goto LABEL_59;
      }
      goto LABEL_59;
    case 2:
      string_for_dns_service_error = nwlog_get_string_for_dns_service_error(self->code);
      v3 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"DNS Error: %s", string_for_dns_service_error);
      if (v3) {
        goto LABEL_59;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v9 = (id)gLogObj;
      *(_DWORD *)__strerrbuf = 136446210;
      v41 = "-[NWConcrete_nw_error description]";
      os_log_type_t v10 = (char *)_os_log_send_and_compose_impl();

      buf[0] = 16;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v10, buf, &type)) {
        goto LABEL_56;
      }
      if (buf[0] == 17)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v11 = (id)gLogObj;
        os_log_type_t v12 = buf[0];
        if (os_log_type_enabled(v11, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__strerrbuf = 136446210;
          v41 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s CFStringCreateWithFormat failed", (uint8_t *)__strerrbuf, 0xCu);
        }
LABEL_52:

        goto LABEL_56;
      }
      if (type == OS_LOG_TYPE_DEFAULT)
      {
        BOOL v11 = __nwlog_obj();
        os_log_type_t v28 = buf[0];
        if (os_log_type_enabled(v11, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__strerrbuf = 136446210;
          v41 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_1830D4000, v11, v28, "%{public}s CFStringCreateWithFormat failed, backtrace limit exceeded", (uint8_t *)__strerrbuf, 0xCu);
        }
        goto LABEL_52;
      }
      __int16 v18 = (char *)__nw_create_backtrace_string();
      BOOL v11 = __nwlog_obj();
      os_log_type_t v19 = buf[0];
      BOOL v20 = os_log_type_enabled(v11, (os_log_type_t)buf[0]);
      if (!v18)
      {
        if (v20)
        {
          *(_DWORD *)__strerrbuf = 136446210;
          v41 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_1830D4000, v11, v19, "%{public}s CFStringCreateWithFormat failed, no backtrace", (uint8_t *)__strerrbuf, 0xCu);
        }
        goto LABEL_52;
      }
      if (v20)
      {
        *(_DWORD *)__strerrbuf = 136446466;
        v41 = "-[NWConcrete_nw_error description]";
        __int16 v42 = 2082;
        *(void *)v43 = v18;
        _os_log_impl(&dword_1830D4000, v11, v19, "%{public}s CFStringCreateWithFormat failed, dumping backtrace:%{public}s", (uint8_t *)__strerrbuf, 0x16u);
      }

      free(v18);
      if (v10) {
LABEL_57:
      }
        free(v10);
LABEL_58:
      v3 = 0;
LABEL_59:
      return (NSString *)v3;
    case 3:
      v3 = (__CFString *)SecCopyErrorMessageString(self->code, 0);
      if (v3) {
        goto LABEL_59;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v13 = (id)gLogObj;
      int code = self->code;
      *(_DWORD *)__strerrbuf = 136446466;
      v41 = "-[NWConcrete_nw_error description]";
      __int16 v42 = 1024;
      *(_DWORD *)v43 = code;
      os_log_type_t v10 = (char *)_os_log_send_and_compose_impl();

      buf[0] = 16;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v10, buf, &type)) {
        goto LABEL_56;
      }
      if (buf[0] == 17)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        objc_super v15 = (id)gLogObj;
        os_log_type_t v16 = buf[0];
        if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
        {
          int v17 = self->code;
          *(_DWORD *)__strerrbuf = 136446466;
          v41 = "-[NWConcrete_nw_error description]";
          __int16 v42 = 1024;
          *(_DWORD *)v43 = v17;
          _os_log_impl(&dword_1830D4000, v15, v16, "%{public}s SecCopyErrorMessageString(%d, NULL) failed", (uint8_t *)__strerrbuf, 0x12u);
        }
      }
      else if (type)
      {
        v21 = (char *)__nw_create_backtrace_string();
        objc_super v15 = __nwlog_obj();
        os_log_type_t v22 = buf[0];
        BOOL v23 = os_log_type_enabled(v15, (os_log_type_t)buf[0]);
        if (v21)
        {
          if (v23)
          {
            int v24 = self->code;
            *(_DWORD *)__strerrbuf = 136446722;
            v41 = "-[NWConcrete_nw_error description]";
            __int16 v42 = 1024;
            *(_DWORD *)v43 = v24;
            v43[2] = 2082;
            *(void *)&v43[3] = v21;
            _os_log_impl(&dword_1830D4000, v15, v22, "%{public}s SecCopyErrorMessageString(%d, NULL) failed, dumping backtrace:%{public}s", (uint8_t *)__strerrbuf, 0x1Cu);
          }

          free(v21);
          if (v10) {
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        if (v23)
        {
          int v32 = self->code;
          *(_DWORD *)__strerrbuf = 136446466;
          v41 = "-[NWConcrete_nw_error description]";
          __int16 v42 = 1024;
          *(_DWORD *)v43 = v32;
          _os_log_impl(&dword_1830D4000, v15, v22, "%{public}s SecCopyErrorMessageString(%d, NULL) failed, no backtrace", (uint8_t *)__strerrbuf, 0x12u);
        }
      }
      else
      {
        objc_super v15 = __nwlog_obj();
        os_log_type_t v29 = buf[0];
        if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
        {
          int v30 = self->code;
          *(_DWORD *)__strerrbuf = 136446466;
          v41 = "-[NWConcrete_nw_error description]";
          __int16 v42 = 1024;
          *(_DWORD *)v43 = v30;
          _os_log_impl(&dword_1830D4000, v15, v29, "%{public}s SecCopyErrorMessageString(%d, NULL) failed, backtrace limit exceeded", (uint8_t *)__strerrbuf, 0x12u);
        }
      }

LABEL_56:
      if (!v10) {
        goto LABEL_58;
      }
      goto LABEL_57;
    default:
      goto LABEL_58;
  }
}

@end