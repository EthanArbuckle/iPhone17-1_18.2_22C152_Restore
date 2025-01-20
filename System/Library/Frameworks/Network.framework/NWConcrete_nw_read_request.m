@interface NWConcrete_nw_read_request
- (NSString)description;
- (NWConcrete_nw_read_request)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_read_request

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->context_array, 0);
  objc_storeStrong((id *)&self->read_array, 0);
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->repliable_message, 0);
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->data, 0);
  objc_storeStrong((id *)&self->fd, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong(&self->buffer_completion, 0);
  objc_storeStrong(&self->data_multiple_completion, 0);
  objc_storeStrong(&self->file_handler, 0);
  objc_storeStrong(&self->data_completion, 0);

  objc_storeStrong((id *)&self->next, 0);
}

- (NWConcrete_nw_read_request)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_read_request;
  v2 = [(NWConcrete_nw_read_request *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_read_request init]";
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
        v18 = "-[NWConcrete_nw_read_request init]";
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
          v18 = "-[NWConcrete_nw_read_request init]";
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
        v18 = "-[NWConcrete_nw_read_request init]";
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
        v18 = "-[NWConcrete_nw_read_request init]";
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

- (void)dealloc
{
  progress_timer_source = self->progress_timer_source;
  if (progress_timer_source)
  {
    nw_queue_cancel_source((uint64_t)progress_timer_source);
    self->progress_timer_source = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_read_request;
  [(NWConcrete_nw_read_request *)&v4 dealloc];
}

- (NSString)description
{
  if (*((unsigned char *)self + 176)) {
    v2 = " reported";
  }
  else {
    v2 = "";
  }
  v3 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<nw_read_request %zu/[%zu-%zu]%s>", self->progress, self->min, self->max, v2);

  return (NSString *)v3;
}

@end