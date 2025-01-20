@interface FigContinuityCaptureNotificationMonitor
+ (id)sharedInstance;
+ (void)initialize;
- (FigContinuityCaptureNotificationMonitor)init;
- (void)_handleContinuityCaptureNotification:(id)a3;
- (void)dealloc;
@end

@implementation FigContinuityCaptureNotificationMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken != -1) {
    dispatch_once(&sharedInstance_sOnceToken, &__block_literal_global_40);
  }
  return (id)sharedInstance_sSharedContinuityCaptureNotificationMonitor;
}

FigContinuityCaptureNotificationMonitor *__57__FigContinuityCaptureNotificationMonitor_sharedInstance__block_invoke()
{
  result = objc_alloc_init(FigContinuityCaptureNotificationMonitor);
  sharedInstance_sSharedContinuityCaptureNotificationMonitor = (uint64_t)result;
  return result;
}

- (void)_handleContinuityCaptureNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 name];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)[a3 object];
    if (dword_1EB4C5330)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(v5, "isEqualToString:", @"ContinuityCaptureNotificationOnBoardingComplete", v10, v11)&& objc_msgSend(v6, "isEqualToString:", @"YES"))
    {
      v8 = (const void *)[MEMORY[0x1E4F1C9C8] now];
      if (dword_1EB4C5330)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CFPreferencesSetValue(@"ContinuityCaptureLastUsedDate", v8, @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    }
  }
}

- (FigContinuityCaptureNotificationMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigContinuityCaptureNotificationMonitor;
  v2 = [(FigContinuityCaptureNotificationMonitor *)&v4 init];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__handleContinuityCaptureNotification_, @"ContinuityCaptureNotificationOnBoardingComplete", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "removeObserver:name:object:", self, @"ContinuityCaptureNotificationOnBoardingComplete", 0);
  v3.receiver = self;
  v3.super_class = (Class)FigContinuityCaptureNotificationMonitor;
  [(FigContinuityCaptureNotificationMonitor *)&v3 dealloc];
}

@end