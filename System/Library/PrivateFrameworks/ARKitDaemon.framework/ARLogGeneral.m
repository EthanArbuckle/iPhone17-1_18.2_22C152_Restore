@interface ARLogGeneral
@end

@implementation ARLogGeneral

uint64_t ___ARLogGeneral_block_invoke()
{
  _ARLogGeneral_logObj = (uint64_t)os_log_create("com.apple.ARKit", "General");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogGeneral_block_invoke_0()
{
  _ARLogGeneral_logObj_0 = (uint64_t)os_log_create("com.apple.ARKit", "General");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogGeneral_block_invoke_1()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "General");
  uint64_t v1 = _ARLogGeneral_logObj_1;
  _ARLogGeneral_logObj_1 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t ___ARLogGeneral_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "General");
  uint64_t v1 = _ARLogGeneral_logObj_2;
  _ARLogGeneral_logObj_2 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end