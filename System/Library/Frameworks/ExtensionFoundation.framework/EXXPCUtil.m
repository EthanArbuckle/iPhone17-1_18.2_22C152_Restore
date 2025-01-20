@interface EXXPCUtil
+ (id)sharedInstance;
+ (int)addExternalServiceForPid:(int)a3 path:(id)a4 overlay:(id)a5;
+ (int)servicePidFromXPCConnection:(id)a3;
+ (void)assertIsExtensionProcess;
+ (void)checkInWithLaunchd;
@end

@implementation EXXPCUtil

+ (void)checkInWithLaunchd
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_16);
  }
  return (id)sharedInstance_sharedInstance_1;
}

EXXPCUtil *__27__EXXPCUtil_sharedInstance__block_invoke()
{
  result = objc_alloc_init(EXXPCUtil);
  sharedInstance_sharedInstance_1 = (uint64_t)result;
  return result;
}

+ (void)assertIsExtensionProcess
{
  if (assertIsExtensionProcess_safetyCheck != -1) {
    dispatch_once(&assertIsExtensionProcess_safetyCheck, &__block_literal_global_2_0);
  }
}

void __37__EXXPCUtil_assertIsExtensionProcess__block_invoke()
{
  getpid();
  v0 = (void *)launch_copy_extension_properties_for_pid();
  if (!v0) {
    __37__EXXPCUtil_assertIsExtensionProcess__block_invoke_cold_1();
  }

  xpc_release(v0);
}

+ (int)addExternalServiceForPid:(int)a3 path:(id)a4 overlay:(id)a5
{
  [a4 UTF8String];
  uint64_t v5 = _CFXPCCreateXPCObjectFromCFObject();
  if (!v5) {
    return -1;
  }
  v6 = (void *)v5;
  int v7 = launch_add_external_service();
  xpc_release(v6);
  return v7;
}

+ (int)servicePidFromXPCConnection:(id)a3
{
  v3 = (void *)launch_copy_extension_properties();
  if (!v3) {
    return 0;
  }
  v4 = v3;
  int int64 = xpc_dictionary_get_int64(v3, (const char *)*MEMORY[0x1E4F14930]);
  xpc_release(v4);
  return int64;
}

void __37__EXXPCUtil_assertIsExtensionProcess__block_invoke_cold_1()
{
  qword_1E92FDD98 = (uint64_t)"NSExtensionContext cannot accept connections in non-extension processes";
  abort();
}

@end