@interface LargeDatabasesMediumSeveritySignpostLogHandle
@end

@implementation LargeDatabasesMediumSeveritySignpostLogHandle

void ___LargeDatabasesMediumSeveritySignpostLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ConditionInducer.MediumSeverity", "LargeDatabasesCondition");
  v1 = (void *)_LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_object_2;
  _LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_object_2 = (uint64_t)v0;
}

@end