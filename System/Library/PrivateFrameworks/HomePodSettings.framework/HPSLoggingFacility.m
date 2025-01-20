@interface HPSLoggingFacility
@end

@implementation HPSLoggingFacility

uint64_t ___HPSLoggingFacility_block_invoke()
{
  _HPSLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.HPSettings", "log");
  return MEMORY[0x270F9A758]();
}

@end