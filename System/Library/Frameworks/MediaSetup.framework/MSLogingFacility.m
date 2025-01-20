@interface MSLogingFacility
@end

@implementation MSLogingFacility

uint64_t ___MSLogingFacility_block_invoke()
{
  _MSLogingFacility_oslog = (uint64_t)os_log_create("com.apple.mediasetup.framework", "log");

  return MEMORY[0x270F9A758]();
}

@end