@interface HGObjCLoggingFacility
@end

@implementation HGObjCLoggingFacility

uint64_t ___HGObjCLoggingFacility_block_invoke(uint64_t a1)
{
  _HGObjCLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.HeadGestures", *(const char **)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

@end