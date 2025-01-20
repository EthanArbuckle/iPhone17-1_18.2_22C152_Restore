@interface MIOLog
+ (BOOL)debugEnabled;
+ (OS_os_log)defaultLog;
+ (void)recheckDebugEnabled;
@end

@implementation MIOLog

+ (void)recheckDebugEnabled
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.movstreamio.framework"];
  sMIOLogDebugEnabled = [v2 BOOLForKey:@"DEBUG_LOG"];

  objc_sync_exit(obj);
}

+ (BOOL)debugEnabled
{
  if (debugEnabled_onceToken != -1) {
    dispatch_once(&debugEnabled_onceToken, &__block_literal_global_2);
  }
  return sMIOLogDebugEnabled;
}

uint64_t __22__MIOLog_debugEnabled__block_invoke()
{
  return +[MIOLog recheckDebugEnabled];
}

+ (OS_os_log)defaultLog
{
  if (defaultLog_onceToken != -1) {
    dispatch_once(&defaultLog_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)defaultLog_log;

  return (OS_os_log *)v2;
}

uint64_t __20__MIOLog_defaultLog__block_invoke()
{
  defaultLog_log = (uint64_t)os_log_create("com.apple.movstreamio.defaultlog", "MOVStreamIO");

  return MEMORY[0x270F9A758]();
}

@end