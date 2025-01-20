@interface MLCLog
+ (id)execution;
+ (id)framework;
+ (id)test;
@end

@implementation MLCLog

+ (id)framework
{
  if (framework_onceToken != -1) {
    dispatch_once(&framework_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)framework__framework;

  return v2;
}

uint64_t __19__MLCLog_framework__block_invoke()
{
  framework__framework = (uint64_t)os_log_create("com.apple.mlcompute", "framework");

  return MEMORY[0x1F41817F8]();
}

+ (id)execution
{
  if (execution_onceToken != -1) {
    dispatch_once(&execution_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)execution__execution;

  return v2;
}

uint64_t __19__MLCLog_execution__block_invoke()
{
  execution__execution = (uint64_t)os_log_create("com.apple.mlcompute", "PointsOfInterest");

  return MEMORY[0x1F41817F8]();
}

+ (id)test
{
  if (test_onceToken != -1) {
    dispatch_once(&test_onceToken, &__block_literal_global_6_0);
  }
  v2 = (void *)test__test;

  return v2;
}

uint64_t __14__MLCLog_test__block_invoke()
{
  test__test = (uint64_t)os_log_create("com.apple.mlcompute", "test");

  return MEMORY[0x1F41817F8]();
}

@end