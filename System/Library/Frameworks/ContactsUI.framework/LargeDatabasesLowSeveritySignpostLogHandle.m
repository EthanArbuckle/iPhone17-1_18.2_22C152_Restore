@interface LargeDatabasesLowSeveritySignpostLogHandle
@end

@implementation LargeDatabasesLowSeveritySignpostLogHandle

void ___LargeDatabasesLowSeveritySignpostLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ConditionInducer.LowSeverity", "LargeDatabasesCondition");
  v1 = (void *)_LargeDatabasesLowSeveritySignpostLogHandle_cn_once_object_1;
  _LargeDatabasesLowSeveritySignpostLogHandle_cn_once_object_1 = (uint64_t)v0;
}

@end