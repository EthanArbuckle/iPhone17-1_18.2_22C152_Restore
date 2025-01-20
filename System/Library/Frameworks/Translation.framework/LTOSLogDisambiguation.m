@interface LTOSLogDisambiguation
@end

@implementation LTOSLogDisambiguation

uint64_t ___LTOSLogDisambiguation_block_invoke()
{
  _LTOSLogDisambiguation_log = (uint64_t)os_log_create("com.apple.Translation", "Disambiguation");

  return MEMORY[0x270F9A758]();
}

@end