@interface CDSystemTimeCallbackSchedulerSetAlarmEventStreamHandler
@end

@implementation CDSystemTimeCallbackSchedulerSetAlarmEventStreamHandler

void ___CDSystemTimeCallbackSchedulerSetAlarmEventStreamHandler_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  v5 = [v3 date];
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14560]);

  xpc_set_event();
  v7 = _os_activity_create(&dword_18EC9B000, "Duet: ContextStore com.apple.alarm handler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)v10 = 0;
  *(void *)&v10[8] = 0;
  os_activity_scope_enter(v7, (os_activity_scope_state_t)v10);
  os_activity_scope_leave((os_activity_scope_state_t)v10);

  v8 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = _CDFormattedDate();
    *(_DWORD *)v10 = 138412546;
    *(void *)&v10[4] = v9;
    *(_WORD *)&v10[12] = 2080;
    *(void *)&v10[14] = string;
    _os_log_impl(&dword_18EC9B000, v8, OS_LOG_TYPE_DEFAULT, "com.apple.alarm xpc event handler at %@ for %s", v10, 0x16u);
  }
  [*(id *)(a1 + 32) _handleCallbackAtDate:v5];
}

@end