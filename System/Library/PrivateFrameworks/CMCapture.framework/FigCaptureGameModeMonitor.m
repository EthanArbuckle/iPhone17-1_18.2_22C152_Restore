@interface FigCaptureGameModeMonitor
+ (void)initialize;
- (BOOL)isGameModeEnabled;
- (FigCaptureGameModeMonitor)initWithStateChangeHandler:(id)a3;
- (void)dealloc;
@end

@implementation FigCaptureGameModeMonitor

- (FigCaptureGameModeMonitor)initWithStateChangeHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)FigCaptureGameModeMonitor;
  v4 = [(FigCaptureGameModeMonitor *)&v19 init];
  if (v4)
  {
    v5 = (void *)[MEMORY[0x1E4F28F80] processInfo];
    if ([v5 isDeviceCertifiedFor:*MEMORY[0x1E4F35198]])
    {
      v4->_int gameModeNotifyToken = 0;
      v4->_gameModeStateChangeHandler = (id)[a3 copy];
      v6 = (const char *)[@"com.apple.system.console_mode_changed_camera_jettison_s2r" UTF8String];
      global_queue = dispatch_get_global_queue(0, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __56__FigCaptureGameModeMonitor_initWithStateChangeHandler___block_invoke;
      handler[3] = &unk_1E5C25910;
      handler[4] = v4;
      uint32_t v8 = notify_register_dispatch(v6, &v4->_gameModeNotifyToken, global_queue, handler);
      if (!v8) {
        return v4;
      }
      uint32_t v11 = v8;
      unsigned int v18 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v13 = v18;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        int gameModeNotifyToken = v4->_gameModeNotifyToken;
        int v20 = 136315650;
        v21 = "-[FigCaptureGameModeMonitor initWithStateChangeHandler:]";
        __int16 v22 = 1024;
        uint32_t v23 = v11;
        __int16 v24 = 1024;
        int v25 = gameModeNotifyToken;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      FigDebugAssert3();
      unsigned int v18 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 0;
  }
  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

uint64_t __56__FigCaptureGameModeMonitor_initWithStateChangeHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (dword_1E96B6BA8)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)dealloc
{
  notify_cancel(self->_gameModeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureGameModeMonitor;
  [(FigCaptureGameModeMonitor *)&v3 dealloc];
}

- (BOOL)isGameModeEnabled
{
  state64[20] = *MEMORY[0x1E4F143B8];
  state64[0] = 0;
  if (notify_get_state(self->_gameModeNotifyToken, state64)) {
    goto LABEL_5;
  }
  if (dword_1E96B6BA8)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (state64[0] >= 2)
  {
LABEL_5:
    objc_super v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return state64[0] == 1;
}

@end