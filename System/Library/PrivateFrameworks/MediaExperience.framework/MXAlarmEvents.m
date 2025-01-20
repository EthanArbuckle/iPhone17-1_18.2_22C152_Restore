@interface MXAlarmEvents
+ (id)sharedInstance;
- (MXAlarmEvents)init;
- (void)handleAlarmEventNotification:(id)a3;
- (void)resetAlarmEvent:(id)a3;
- (void)setAlarmEvent:(double)a3 eventName:(id)a4;
@end

@implementation MXAlarmEvents

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_48);
  }
  return (id)sharedInstance_sSharedInstance_6;
}

void __31__MXAlarmEvents_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance_6 = objc_alloc_init(MXAlarmEvents);
  [(id)sharedInstance_sSharedInstance_6 resetAlarmEvent:@"com.apple.mediaexperience.silentmode.timer"];
  v0 = *(NSObject **)(sharedInstance_sSharedInstance_6 + 8);
  xpc_set_event_stream_handler("com.apple.alarm", v0, &__block_literal_global_5_1);
}

uint64_t __31__MXAlarmEvents_sharedInstance__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [(id)sharedInstance_sSharedInstance_6 handleAlarmEventNotification:a2];
}

- (MXAlarmEvents)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MXAlarmEvents;
  v2 = [(MXAlarmEvents *)&v6 init];
  if (v2)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->mAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.MXAlarmEvents", v4);
  }
  return v2;
}

- (void)handleAlarmEventNotification:(id)a3
{
  FigXPCMessageCopyCFString();
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (void)setAlarmEvent:(double)a3 eventName:(id)a4
{
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MXAlarmEvents_setAlarmEvent_eventName___block_invoke;
  v5[3] = &unk_1E57CA3A0;
  v5[4] = a4;
  *(double *)&v5[5] = a3;
  MXDispatchAsync((uint64_t)"-[MXAlarmEvents setAlarmEvent:eventName:]", (uint64_t)"MXAlarmEvents.m", 92, 0, 0, mAccessQueue, (uint64_t)v5);
}

void __41__MXAlarmEvents_setAlarmEvent_eventName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  xpc_set_event();
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  unint64_t v4 = (unint64_t)(*(double *)(a1 + 40) * 1000000000.0);
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  xpc_dictionary_set_uint64(v2, "Date", v3 + v4);
  xpc_dictionary_set_string(v2, "Type", "Monotonic");
  [*(id *)(a1 + 32) UTF8String];
  xpc_set_event();
  xpc_release(v2);
}

- (void)resetAlarmEvent:(id)a3
{
  mAccessQueue = self->mAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__MXAlarmEvents_resetAlarmEvent___block_invoke;
  v4[3] = &unk_1E57C6368;
  v4[4] = a3;
  MXDispatchAsync((uint64_t)"-[MXAlarmEvents resetAlarmEvent:]", (uint64_t)"MXAlarmEvents.m", 111, 0, 0, mAccessQueue, (uint64_t)v4);
}

uint64_t __33__MXAlarmEvents_resetAlarmEvent___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "UTF8String", v4, v5);
  return xpc_set_event();
}

@end