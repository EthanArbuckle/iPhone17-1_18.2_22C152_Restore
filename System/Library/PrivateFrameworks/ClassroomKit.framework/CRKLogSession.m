@interface CRKLogSession
@end

@implementation CRKLogSession

uint64_t ___CRKLogSession_block_invoke()
{
  _CRKLogSession_logObj = (uint64_t)os_log_create("com.apple.classroom", "Session");

  return MEMORY[0x270F9A758]();
}

uint64_t ___CRKLogSession_block_invoke_0()
{
  _CRKLogSession_logObj_0 = (uint64_t)os_log_create("com.apple.classroom", "Session");

  return MEMORY[0x270F9A758]();
}

@end