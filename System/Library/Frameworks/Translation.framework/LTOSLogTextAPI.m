@interface LTOSLogTextAPI
@end

@implementation LTOSLogTextAPI

uint64_t ___LTOSLogTextAPI_block_invoke()
{
  _LTOSLogTextAPI_log = (uint64_t)os_log_create("com.apple.Translation", "TextAPI");

  return MEMORY[0x270F9A758]();
}

@end