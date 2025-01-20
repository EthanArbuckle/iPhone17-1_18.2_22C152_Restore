@interface ARLogSession
@end

@implementation ARLogSession

void ___ARLogSession_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Session");
  v1 = (void *)_ARLogSession_logObj;
  _ARLogSession_logObj = (uint64_t)v0;
}

void ___ARLogSession_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Session");
  v1 = (void *)_ARLogSession_logObj_0;
  _ARLogSession_logObj_0 = (uint64_t)v0;
}

void ___ARLogSession_block_invoke_1()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Session");
  v1 = (void *)_ARLogSession_logObj_1;
  _ARLogSession_logObj_1 = (uint64_t)v0;
}

void ___ARLogSession_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Session");
  v1 = (void *)_ARLogSession_logObj_2;
  _ARLogSession_logObj_2 = (uint64_t)v0;
}

@end