@interface ARLogGeneral
@end

@implementation ARLogGeneral

uint64_t ___ARLogGeneral_block_invoke()
{
  _ARLogGeneral_logObj = (uint64_t)os_log_create("com.apple.ARKit", "General");

  return MEMORY[0x270F9A758]();
}

@end