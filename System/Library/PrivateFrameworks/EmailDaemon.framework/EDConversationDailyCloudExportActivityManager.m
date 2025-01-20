@interface EDConversationDailyCloudExportActivityManager
+ (OS_os_log)log;
+ (void)scheduleWithConversationExportDelegate:(id)a3 conversationManager:(id)a4;
@end

@implementation EDConversationDailyCloudExportActivityManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EDConversationDailyCloudExportActivityManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_24 != -1) {
    dispatch_once(&log_onceToken_24, block);
  }
  v2 = (void *)log_log_24;

  return (OS_os_log *)v2;
}

void __52__EDConversationDailyCloudExportActivityManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_24;
  log_log_24 = (uint64_t)v1;
}

+ (void)scheduleWithConversationExportDelegate:(id)a3 conversationManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[EDConversationDailyCloudExportActivityManager log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Library purgeable upgrader has been scheduled.", buf, 2u);
  }

  v8 = [[EDConversationDailyiCloudExporter alloc] initWithDelegate:v5 conversationManager:v6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__EDConversationDailyCloudExportActivityManager_scheduleWithConversationExportDelegate_conversationManager___block_invoke_2;
  aBlock[3] = &unk_1E6C008D8;
  v12 = v8;
  v9 = v8;
  v10 = _Block_copy(aBlock);
  ef_xpc_activity_register();
}

void __108__EDConversationDailyCloudExportActivityManager_scheduleWithConversationExportDelegate_conversationManager___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14310], 1);
}

uint64_t __108__EDConversationDailyCloudExportActivityManager_scheduleWithConversationExportDelegate_conversationManager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

@end