@interface FBKLog
+ (OS_os_log)appHandle;
+ (OS_os_log)appleConnect;
+ (OS_os_log)attachHandle;
+ (OS_os_log)clientHandle;
+ (OS_os_log)data;
+ (OS_os_log)ded;
+ (OS_os_log)ffu;
+ (OS_os_log)model;
+ (OS_os_log)net;
+ (OS_os_log)reachability;
+ (OS_os_log)sp2;
+ (OS_os_log)upload;
+ (id)currentURLActionActivity;
+ (id)newURLActionActivity;
@end

@implementation FBKLog

+ (OS_os_log)upload
{
  if (upload_onceToken1 != -1) {
    dispatch_once(&upload_onceToken1, &__block_literal_global_14);
  }
  v2 = (void *)upload_handle;

  return (OS_os_log *)v2;
}

uint64_t __16__FBKLog_upload__block_invoke()
{
  upload_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "upload");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)model
{
  if (model_onceToken1 != -1) {
    dispatch_once(&model_onceToken1, &__block_literal_global_8);
  }
  v2 = (void *)model_handle;

  return (OS_os_log *)v2;
}

uint64_t __15__FBKLog_model__block_invoke()
{
  model_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "model");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)ffu
{
  if (ffu_onceToken1 != -1) {
    dispatch_once(&ffu_onceToken1, &__block_literal_global_11);
  }
  v2 = (void *)ffu_handle;

  return (OS_os_log *)v2;
}

uint64_t __13__FBKLog_ffu__block_invoke()
{
  ffu_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "ffu");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)clientHandle
{
  if (clientHandle_onceToken1 != -1) {
    dispatch_once(&clientHandle_onceToken1, &__block_literal_global_14);
  }
  v2 = (void *)clientHandle_handle;

  return (OS_os_log *)v2;
}

uint64_t __22__FBKLog_clientHandle__block_invoke()
{
  clientHandle_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "Client");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)net
{
  if (net_onceToken1 != -1) {
    dispatch_once(&net_onceToken1, &__block_literal_global_17);
  }
  v2 = (void *)net_handle;

  return (OS_os_log *)v2;
}

uint64_t __13__FBKLog_net__block_invoke()
{
  net_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "net");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)appHandle
{
  if (appHandle_onceToken != -1) {
    dispatch_once(&appHandle_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)appHandle_handle;

  return (OS_os_log *)v2;
}

uint64_t __19__FBKLog_appHandle__block_invoke()
{
  appHandle_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "Application");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)attachHandle
{
  if (attachHandle_onceToken != -1) {
    dispatch_once(&attachHandle_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)attachHandle_handle;

  return (OS_os_log *)v2;
}

uint64_t __22__FBKLog_attachHandle__block_invoke()
{
  attachHandle_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "attach");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)reachability
{
  if (reachability_onceToken != -1) {
    dispatch_once(&reachability_onceToken, &__block_literal_global_26_0);
  }
  v2 = (void *)reachability_handle;

  return (OS_os_log *)v2;
}

uint64_t __22__FBKLog_reachability__block_invoke()
{
  reachability_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "reachability");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)ded
{
  if (ded_onceToken != -1) {
    dispatch_once(&ded_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)ded_handle;

  return (OS_os_log *)v2;
}

uint64_t __13__FBKLog_ded__block_invoke()
{
  ded_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "fded");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)data
{
  if (data_onceToken != -1) {
    dispatch_once(&data_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)data_handle;

  return (OS_os_log *)v2;
}

uint64_t __14__FBKLog_data__block_invoke()
{
  data_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "data");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)sp2
{
  if (sp2_onceToken != -1) {
    dispatch_once(&sp2_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)sp2_handle;

  return (OS_os_log *)v2;
}

uint64_t __13__FBKLog_sp2__block_invoke()
{
  sp2_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "sp2");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)appleConnect
{
  if (appleConnect_onceToken != -1) {
    dispatch_once(&appleConnect_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)appleConnect_handle;

  return (OS_os_log *)v2;
}

uint64_t __22__FBKLog_appleConnect__block_invoke()
{
  appleConnect_handle = (uint64_t)os_log_create("com.apple.FeedbackCore", "apple-connect");

  return MEMORY[0x270F9A758]();
}

+ (id)newURLActionActivity
{
  os_activity_t v2 = _os_activity_create(&dword_22A36D000, "Starting feedback via URL scheme", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v3 = (void *)_URLActionActivity;
  _URLActionActivity = (uint64_t)v2;

  v4 = (void *)_URLActionActivity;

  return v4;
}

+ (id)currentURLActionActivity
{
  if (_URLActionActivity) {
    os_activity_t v2 = (void *)[a1 newURLActionActivity];
  }
  else {
    os_activity_t v2 = 0;
  }

  return v2;
}

@end