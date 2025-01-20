@interface NWConcrete_nw_browse_descriptor
- (NSString)description;
- (NWConcrete_nw_browse_descriptor)init;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_browse_descriptor

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 8, 0);

  objc_storeStrong((id *)self + 7, 0);
}

- (id)redactedDescription
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = nw_browse_descriptor_get_description(self, 1);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return v4;
}

- (NSString)description
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = nw_browse_descriptor_get_description(self, 0);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return (NSString *)v4;
}

- (void)dealloc
{
  v3 = (void *)*((void *)self + 2);
  if (v3)
  {
    free(v3);
    *((void *)self + 2) = 0;
  }
  v4 = (void *)*((void *)self + 3);
  if (v4)
  {
    free(v4);
    *((void *)self + 3) = 0;
  }
  v5 = (void *)*((void *)self + 9);
  if (v5)
  {
    free(v5);
    *((void *)self + 9) = 0;
  }
  v6 = (void *)*((void *)self + 10);
  if (v6)
  {
    free(v6);
    *((void *)self + 10) = 0;
  }
  v7 = (void *)*((void *)self + 4);
  if (v7)
  {
    free(v7);
    *((void *)self + 4) = 0;
  }
  v8 = (void *)*((void *)self + 5);
  if (v8)
  {
    free(v8);
    *((void *)self + 5) = 0;
  }
  v9 = (void *)*((void *)self + 13);
  *((void *)self + 13) = 0;

  v10.receiver = self;
  v10.super_class = (Class)NWConcrete_nw_browse_descriptor;
  [(NWConcrete_nw_browse_descriptor *)&v10 dealloc];
}

- (NWConcrete_nw_browse_descriptor)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_browse_descriptor;
  CFAllocatorRef v2 = [(NWConcrete_nw_browse_descriptor *)&v16 init];
  v3 = v2;
  if (v2)
  {
    *((void *)v2 + 11) = -1;
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
          v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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