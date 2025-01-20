@interface EMDaemonInterfaceRequest
+ (OS_os_log)signpostLog;
+ (id)systemScopeSignpostLog;
+ (unint64_t)uniqueRequestID;
- (unint64_t)signpostID;
@end

@implementation EMDaemonInterfaceRequest

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EMDaemonInterfaceRequest_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1) {
    dispatch_once(&signpostLog_onceToken_0, block);
  }
  v2 = (void *)signpostLog_log_0;
  return (OS_os_log *)v2;
}

void __39__EMDaemonInterfaceRequest_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (id)systemScopeSignpostLog
{
  if (systemScopeSignpostLog_onceToken != -1) {
    dispatch_once(&systemScopeSignpostLog_onceToken, &__block_literal_global_458);
  }
  v2 = (void *)systemScopeSignpostLog_log;
  return v2;
}

void __50__EMDaemonInterfaceRequest_systemScopeSignpostLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email.signposts", "EMRequestIDGenerationCategory");
  os_log_t v1 = (void *)systemScopeSignpostLog_log;
  systemScopeSignpostLog_log = (uint64_t)v0;
}

+ (unint64_t)uniqueRequestID
{
  v2 = +[EMDaemonInterfaceRequest systemScopeSignpostLog];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  return v3;
}

@end