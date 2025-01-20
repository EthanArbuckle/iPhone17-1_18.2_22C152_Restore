@interface LTOSLogUserFeedback
@end

@implementation LTOSLogUserFeedback

uint64_t ___LTOSLogUserFeedback_block_invoke()
{
  _LTOSLogUserFeedback_log = (uint64_t)os_log_create("com.apple.Translation", "UserFeedback");

  return MEMORY[0x270F9A758]();
}

@end