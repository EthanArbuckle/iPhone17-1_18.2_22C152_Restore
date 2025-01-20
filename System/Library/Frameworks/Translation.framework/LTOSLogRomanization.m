@interface LTOSLogRomanization
@end

@implementation LTOSLogRomanization

uint64_t ___LTOSLogRomanization_block_invoke()
{
  _LTOSLogRomanization_log = (uint64_t)os_log_create("com.apple.Translation", "Romanization");

  return MEMORY[0x270F9A758]();
}

@end