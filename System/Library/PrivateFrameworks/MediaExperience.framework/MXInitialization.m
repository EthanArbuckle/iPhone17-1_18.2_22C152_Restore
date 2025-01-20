@interface MXInitialization
+ (void)initialize;
+ (void)notifyMXIsFullyInitialized;
+ (void)start;
+ (void)waitUntilMXIsFullyInitialized;
@end

@implementation MXInitialization

+ (void)waitUntilMXIsFullyInitialized
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(id)sIsMXFullyInitializedCondition lock];
  if ((sIsMXFullyInitialized & 1) == 0)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "now", v4, v6);
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend((id)sIsMXFullyInitializedCondition, "wait", v5, v7);
      if (dword_1E9359ED0)
      {
        v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    while (sIsMXFullyInitialized != 1);
  }
  objc_msgSend((id)sIsMXFullyInitializedCondition, "unlock", v4, v6);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sIsMXFullyInitialized = 0;
    sIsMXFullyInitializedCondition = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28BB0]);
  }
}

+ (void)start
{
  if (start_onceToken != -1) {
    dispatch_once(&start_onceToken, &__block_literal_global_33);
  }
}

void __25__MXInitialization_start__block_invoke()
{
  v0 = MXGetPerformanceLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_194CDF000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MX initialization", (const char *)&unk_194EE9136, v1, 2u);
  }
}

+ (void)notifyMXIsFullyInitialized
{
  if (notifyMXIsFullyInitialized_onceToken != -1) {
    dispatch_once(&notifyMXIsFullyInitialized_onceToken, &__block_literal_global_4_1);
  }
}

uint64_t __46__MXInitialization_notifyMXIsFullyInitialized__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(id)sIsMXFullyInitializedCondition lock];
  sIsMXFullyInitialized = 1;
  [(id)sIsMXFullyInitializedCondition broadcast];
  v0 = MXGetPerformanceLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_194CDF000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MX initialization", (const char *)&unk_194EE9136, buf, 2u);
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend((id)sIsMXFullyInitializedCondition, "unlock", v3, v4);
}

@end