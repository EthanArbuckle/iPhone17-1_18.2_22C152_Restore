@interface CRKLogSettings
@end

@implementation CRKLogSettings

uint64_t ___CRKLogSettings_block_invoke()
{
  _CRKLogSettings_logObj = (uint64_t)os_log_create("com.apple.classroom", "Settings");

  return MEMORY[0x270F9A758]();
}

uint64_t ___CRKLogSettings_block_invoke_0()
{
  _CRKLogSettings_logObj_0 = (uint64_t)os_log_create("com.apple.classroom", "Settings");

  return MEMORY[0x270F9A758]();
}

@end