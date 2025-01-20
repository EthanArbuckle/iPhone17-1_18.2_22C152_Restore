@interface _ANELog
+ (id)common;
+ (id)compiler;
+ (id)daemon;
+ (id)framework;
+ (id)maintenance;
+ (id)tests;
+ (id)tool;
@end

@implementation _ANELog

+ (id)daemon
{
  if (daemon_onceToken != -1) {
    dispatch_once(&daemon_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)daemon__daemon;
  return v2;
}

+ (id)framework
{
  if (framework_onceToken != -1) {
    dispatch_once(&framework_onceToken, &__block_literal_global_3_0);
  }
  v2 = (void *)framework__framework;
  return v2;
}

+ (id)common
{
  if (common_onceToken != -1) {
    dispatch_once(&common_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)common__common;
  return v2;
}

+ (id)compiler
{
  if (compiler_onceToken != -1) {
    dispatch_once(&compiler_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)compiler__compiler;
  return v2;
}

+ (id)maintenance
{
  if (maintenance_onceToken != -1) {
    dispatch_once(&maintenance_onceToken, &__block_literal_global_9_0);
  }
  v2 = (void *)maintenance__maintenance;
  return v2;
}

+ (id)tool
{
  if (tool_onceToken != -1) {
    dispatch_once(&tool_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)tool__tool;
  return v2;
}

+ (id)tests
{
  if (tests_onceToken != -1) {
    dispatch_once(&tests_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)tests__tests;
  return v2;
}

@end