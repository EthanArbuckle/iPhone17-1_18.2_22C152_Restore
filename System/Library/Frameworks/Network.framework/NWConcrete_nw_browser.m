@interface NWConcrete_nw_browser
- (NSString)description;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_browser

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 20, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);

  objc_storeStrong((id *)self + 2, 0);
}

- (id)redactedDescription
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = (const char *)nw_browser_get_description(self);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return v4;
}

- (NSString)description
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = (const char *)nw_browser_get_description(self);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return (NSString *)v4;
}

- (void)dealloc
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!*((void *)self + 6) || nw_parameters_get_logging_disabled(*((void *)self + 5))) {
    goto LABEL_14;
  }
  if (__nwlog_browser_log::onceToken[0] != -1) {
    dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
  }
  id v3 = (id)gbrowserLogObj;
  int v4 = *((_DWORD *)self + 48);
  *(_DWORD *)buf = 136446466;
  v41 = "-[NWConcrete_nw_browser dealloc]";
  __int16 v42 = 1024;
  int v43 = v4;
  int v36 = 18;
  v35 = buf;
  v5 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v38 = 0;
  if (__nwlog_fault(v5, &type, &v38))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
      }
      v6 = (id)gbrowserLogObj;
      os_log_type_t v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        int v8 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v8;
        _os_log_impl(&dword_1830D4000, v6, v7, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating", buf, 0x12u);
      }
    }
    else if (v38)
    {
      backtrace_string = __nw_create_backtrace_string();
      if (backtrace_string)
      {
        v18 = (char *)backtrace_string;
        if (__nwlog_browser_log::onceToken[0] != -1) {
          dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
        }
        v19 = (id)gbrowserLogObj;
        os_log_type_t v20 = type;
        if (os_log_type_enabled(v19, type))
        {
          int v21 = *((_DWORD *)self + 48);
          *(_DWORD *)buf = 136446722;
          v41 = "-[NWConcrete_nw_browser dealloc]";
          __int16 v42 = 1024;
          int v43 = v21;
          __int16 v44 = 2082;
          v45 = v18;
          _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x1Cu);
        }

        free(v18);
        if (v5) {
          goto LABEL_13;
        }
        goto LABEL_14;
      }
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
      }
      v6 = (id)gbrowserLogObj;
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v6, type))
      {
        int v32 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v32;
        _os_log_impl(&dword_1830D4000, v6, v31, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, no backtrace", buf, 0x12u);
      }
    }
    else
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
      }
      v6 = (id)gbrowserLogObj;
      os_log_type_t v27 = type;
      if (os_log_type_enabled(v6, type))
      {
        int v28 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v28;
        _os_log_impl(&dword_1830D4000, v6, v27, "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0x12u);
      }
    }
  }
  if (v5) {
LABEL_13:
  }
    free(v5);
LABEL_14:
  if (*((void *)self + 15) && !nw_parameters_get_logging_disabled(*((void *)self + 5)))
  {
    if (__nwlog_browser_log::onceToken[0] != -1) {
      dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
    }
    id v9 = (id)gbrowserLogObj;
    int v10 = *((_DWORD *)self + 48);
    *(_DWORD *)buf = 136446466;
    v41 = "-[NWConcrete_nw_browser dealloc]";
    __int16 v42 = 1024;
    int v43 = v10;
    int v36 = 18;
    v35 = buf;
    v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (!__nwlog_fault(v11, &type, &v38))
    {
LABEL_25:
      if (!v11) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
      }
      v12 = (id)gbrowserLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v14 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v14;
        _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef", buf, 0x12u);
      }
LABEL_24:

      goto LABEL_25;
    }
    if (!v38)
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
      }
      v12 = (id)gbrowserLogObj;
      os_log_type_t v29 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v30 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v30;
        _os_log_impl(&dword_1830D4000, v12, v29, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef, backtrace limit exceeded", buf, 0x12u);
      }
      goto LABEL_24;
    }
    v22 = __nw_create_backtrace_string();
    if (!v22)
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
      }
      v12 = (id)gbrowserLogObj;
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v34 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v34;
        _os_log_impl(&dword_1830D4000, v12, v33, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef, no backtrace", buf, 0x12u);
      }
      goto LABEL_24;
    }
    v23 = (char *)v22;
    if (__nwlog_browser_log::onceToken[0] != -1) {
      dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_20_44865);
    }
    v24 = (id)gbrowserLogObj;
    os_log_type_t v25 = type;
    if (os_log_type_enabled(v24, type))
    {
      int v26 = *((_DWORD *)self + 48);
      *(_DWORD *)buf = 136446722;
      v41 = "-[NWConcrete_nw_browser dealloc]";
      __int16 v42 = 1024;
      int v43 = v26;
      __int16 v44 = 2082;
      v45 = v23;
      _os_log_impl(&dword_1830D4000, v24, v25, "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef, dumping backtrace:%{public}s", buf, 0x1Cu);
    }

    free(v23);
    if (v11) {
LABEL_26:
    }
      free(v11);
  }
LABEL_27:
  v15 = (void *)*((void *)self + 22);
  if (v15)
  {
    free(v15);
    *((void *)self + 22) = 0;
  }
  v16 = (void *)*((void *)self + 23);
  if (v16)
  {
    free(v16);
    *((void *)self + 23) = 0;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWConcrete_nw_browser;
  [(NWConcrete_nw_browser *)&v37 dealloc];
}

@end