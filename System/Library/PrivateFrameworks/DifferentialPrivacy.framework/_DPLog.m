@interface _DPLog
+ (id)daemon;
+ (id)framework;
+ (id)service;
+ (id)tool;
@end

@implementation _DPLog

+ (id)daemon
{
  if (daemon_onceToken != -1) {
    dispatch_once(&daemon_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)daemon__daemon;
  return v2;
}

+ (id)framework
{
  if (framework_onceToken != -1) {
    dispatch_once(&framework_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)framework__framework;
  return v2;
}

+ (id)tool
{
  if (tool_onceToken[0] != -1) {
    dispatch_once(tool_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)tool__tool;
  return v2;
}

+ (id)service
{
  if (service_onceToken != -1) {
    dispatch_once(&service_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)service__service;
  return v2;
}

@end