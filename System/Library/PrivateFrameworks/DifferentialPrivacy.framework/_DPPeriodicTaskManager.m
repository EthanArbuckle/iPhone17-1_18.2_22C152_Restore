@interface _DPPeriodicTaskManager
+ (void)registerTask:(id)a3;
+ (void)unregisterTask:(id)a3;
@end

@implementation _DPPeriodicTaskManager

+ (void)registerTask:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[_DPLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 name];
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1DC55E000, v4, OS_LOG_TYPE_INFO, "Registered CTS task %@", buf, 0xCu);
  }
  id v6 = [v3 name];
  v7 = (const char *)[v6 UTF8String];
  v8 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39___DPPeriodicTaskManager_registerTask___block_invoke;
  handler[3] = &unk_1E6C43BE0;
  id v11 = v3;
  id v9 = v3;
  xpc_activity_register(v7, v8, handler);
}

+ (void)unregisterTask:(id)a3
{
  id v3 = [a3 name];
  xpc_activity_unregister((const char *)[v3 UTF8String]);
}

@end