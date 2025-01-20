@interface EDConversationPruningActivityManager
+ (OS_os_log)log;
+ (void)scheduleWithConversationManager:(id)a3;
@end

@implementation EDConversationPruningActivityManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EDConversationPruningActivityManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_28 != -1) {
    dispatch_once(&log_onceToken_28, block);
  }
  v2 = (void *)log_log_28;

  return (OS_os_log *)v2;
}

void __43__EDConversationPruningActivityManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_28;
  log_log_28 = (uint64_t)v1;
}

+ (void)scheduleWithConversationManager:(id)a3
{
  id v3 = a3;
  v4 = +[EDConversationPruningActivityManager log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "Library purgeable upgrader has been scheduled.", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__EDConversationPruningActivityManager_scheduleWithConversationManager___block_invoke_2;
  aBlock[3] = &unk_1E6C008D8;
  id v5 = v3;
  id v8 = v5;
  v6 = _Block_copy(aBlock);
  ef_xpc_activity_register();
}

void __72__EDConversationPruningActivityManager_scheduleWithConversationManager___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14340], 1);
}

void __72__EDConversationPruningActivityManager_scheduleWithConversationManager___block_invoke_2(uint64_t a1)
{
  v2 = +[EDConversationPruningActivityManager log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_INFO, "Started pruning conversations", buf, 2u);
  }

  [*(id *)(a1 + 32) pruneDatabasePurgingOldestEntries:0];
  id v3 = +[EDConversationPruningActivityManager log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_INFO, "Finished pruning conversations", v4, 2u);
  }
}

@end