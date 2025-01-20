@interface NWConcrete_nw_fd_wrapper
- (NSString)description;
- initWithFileDescriptor:(void *)a1;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_fd_wrapper

- (id).cxx_construct
{
  *((_DWORD *)self + 3) = 0;
  return self;
}

- (NSString)description
{
  v2 = "true";
  if ((*((unsigned char *)self + 24) & 1) == 0) {
    v2 = "false";
  }
  v3 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<fd_wrapper %d, guarded: %s>", *((unsigned int *)self + 2), v2);

  return (NSString *)v3;
}

- (void)dealloc
{
  nw_fd_wrapper_close(self);
  v3.receiver = self;
  v3.super_class = (Class)NWConcrete_nw_fd_wrapper;
  [(NWConcrete_nw_fd_wrapper *)&v3 dealloc];
}

- initWithFileDescriptor:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)NWConcrete_nw_fd_wrapper;
  objc_super v3 = objc_msgSendSuper2(&v16, sel_init);
  v4 = v3;
  if (!v3)
  {
    v6 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
            v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
            __int16 v19 = 2082;
            v20 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_21;
        }
        if (v12)
        {
          *(_DWORD *)buf = 136446210;
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
          _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_21:
    if (v7) {
      free(v7);
    }
    return 0;
  }
  v3[2] = a2;
  *((unsigned char *)v3 + 24) &= ~2u;
  arc4random_buf(v3 + 4, 8uLL);
  return v4;
}

@end