@interface FigWiredMemory
+ (void)initialize;
- (FigWiredMemory)initWithLength:(unint64_t)a3;
- (unint64_t)length;
- (void)bytes;
- (void)dealloc;
@end

@implementation FigWiredMemory

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigWiredMemory)initWithLength:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)FigWiredMemory;
  v4 = [(FigWiredMemory *)&v12 init];
  v5 = v4;
  if (v4)
  {
    vm_size_t v6 = (a3 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
    v4->_roundedLength = v6;
    p_bytes = (const void **)&v4->_bytes;
    if (vm_allocate(*MEMORY[0x1E4F14960], (vm_address_t *)&v4->_bytes, v6, 1694498817) || !*p_bytes)
    {
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      ReportMemoryException();

      return 0;
    }
    else
    {
      if (mlock(*p_bytes, v5->_roundedLength))
      {
        v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        ReportMemoryException();
        char v9 = 0;
      }
      else
      {
        char v9 = 1;
      }
      v5->_isWired = v9;
      v5->_length = a3;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  bytes = self->_bytes;
  if (bytes)
  {
    if (self->_isWired && munlock(bytes, self->_roundedLength))
    {
      int v8 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (MEMORY[0x1A62735F0](*MEMORY[0x1E4F14960], self->_bytes, self->_roundedLength))
    {
      int v8 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FigWiredMemory;
  [(FigWiredMemory *)&v6 dealloc];
}

- (void)bytes
{
  return self->_bytes;
}

- (unint64_t)length
{
  return self->_length;
}

@end