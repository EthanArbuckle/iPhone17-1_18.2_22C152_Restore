@interface EXService_Subsystem
+ (id)initForPlugInKit;
+ (id)sharedInstance;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
@end

@implementation EXService_Subsystem

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EXService_Subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, block);
  }
  v2 = (void *)sharedInstance___instance_0;

  return v2;
}

+ (id)initForPlugInKit
{
  v2 = _EXLegacyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "Initializing 'EXService_Subsystem'", v5, 2u);
  }

  v3 = +[EXService_Subsystem sharedInstance];

  return v3;
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _EXLegacyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_191F29000, v8, OS_LOG_TYPE_DEFAULT, "Begin using %{public}@ for bundle %{public}@", (uint8_t *)&v16, 0x16u);
  }

  v9 = +[_EXRunningExtensionInfo extensionInfoForCurrentProcess];
  if (!v9)
  {
    v15 = _EXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[EXService_Subsystem beginUsing:withBundle:](v15);
    }

    __break(1u);
  }
  v10 = v9;
  v11 = [v9 runLoopType];
  uint64_t v12 = [v11 isEqualToString:@"NSRunLoop"];

  v13 = _EXDefaultLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      -[EXService_Subsystem beginUsing:withBundle:](v13);
    }
  }
  else if (v14)
  {
    -[EXService_Subsystem beginUsing:withBundle:](v10, v13);
  }

  [MEMORY[0x1E4F292B0] _startListening:v12];
}

- (void)beginUsing:(os_log_t)log withBundle:.cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = "info";
  __int16 v3 = 2080;
  int v1 = 136315650;
  v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/PK Subsystems/EX"
       "Service_Subsystem.m";
  __int16 v5 = 1024;
  int v6 = 36;
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Failed to get extension info  for current process", (uint8_t *)&v1, 0x1Cu);
}

- (void)beginUsing:(os_log_t)log withBundle:.cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_191F29000, log, OS_LOG_TYPE_DEBUG, "NSRunLoop type detected. Start listening with imediate launchd checkin.", v1, 2u);
}

- (void)beginUsing:(void *)a1 withBundle:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [a1 runLoopType];
  int v4 = 138543362;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_191F29000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ (non-NSRunLoop) type detected. Start listening with delayed launchd checkin.", (uint8_t *)&v4, 0xCu);
}

@end