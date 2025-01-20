@interface NWConcrete_nw_masque_server
- (NSString)description;
- (id).cxx_construct;
@end

@implementation NWConcrete_nw_masque_server

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 16, 0);
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);

  objc_storeStrong((id *)self + 3, 0);
}

- (NSString)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    v3 = __nwlog_obj();
    *(_DWORD *)cStr = 136446210;
    *(void *)&cStr[4] = "nw_masque_server_copy_description";
    v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v12 = 0;
    if (__nwlog_fault(v4, &type, &v12))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v5 = __nwlog_obj();
        os_log_type_t v6 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_masque_server_copy_description";
          _os_log_impl(&dword_1830D4000, v5, v6, "%{public}s called with null server", cStr, 0xCu);
        }
      }
      else if (v12)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v5 = __nwlog_obj();
        os_log_type_t v8 = type;
        BOOL v9 = os_log_type_enabled(v5, type);
        if (backtrace_string)
        {
          if (v9)
          {
            *(_DWORD *)cStr = 136446466;
            *(void *)&cStr[4] = "nw_masque_server_copy_description";
            __int16 v15 = 2082;
            v16 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v5, v8, "%{public}s called with null server, dumping backtrace:%{public}s", cStr, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_20;
        }
        if (v9)
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_masque_server_copy_description";
          _os_log_impl(&dword_1830D4000, v5, v8, "%{public}s called with null server, no backtrace", cStr, 0xCu);
        }
      }
      else
      {
        v5 = __nwlog_obj();
        os_log_type_t v10 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_masque_server_copy_description";
          _os_log_impl(&dword_1830D4000, v5, v10, "%{public}s called with null server, backtrace limit exceeded", cStr, 0xCu);
        }
      }
    }
LABEL_20:
    if (v4) {
      free(v4);
    }
    goto LABEL_22;
  }
  *(void *)cStr = 0;
  asprintf((char **)cStr, "[SP%llu %s]", *((void *)self + 1), "MASQUE");
  if (*(void *)cStr)
  {
    v2 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(const char **)cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
    goto LABEL_23;
  }
LABEL_22:
  v2 = 0;
LABEL_23:

  return (NSString *)v2;
}

@end