@interface DPCLoggingFacility
@end

@implementation DPCLoggingFacility

uint64_t ___DPCLoggingFacility_block_invoke(uint64_t a1)
{
  _DPCLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.devicepresence", *(const char **)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

@end