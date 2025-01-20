@interface UTSetRuntimeIssueCatcher
@end

@implementation UTSetRuntimeIssueCatcher

uint64_t (*___UTSetRuntimeIssueCatcher_block_invoke())(void)
{
  result = (uint64_t (*)(void))os_log_set_fault_callback();
  off_1EB20A6B0 = result;
  return result;
}

@end