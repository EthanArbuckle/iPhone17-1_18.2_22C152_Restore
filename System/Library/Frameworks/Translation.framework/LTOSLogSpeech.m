@interface LTOSLogSpeech
@end

@implementation LTOSLogSpeech

uint64_t ___LTOSLogSpeech_block_invoke()
{
  _LTOSLogSpeech_log = (uint64_t)os_log_create("com.apple.Translation", "Speech");

  return MEMORY[0x270F9A758]();
}

@end