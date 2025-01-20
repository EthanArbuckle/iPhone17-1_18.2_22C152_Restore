@interface FLLogSystemQuery
@end

@implementation FLLogSystemQuery

uint64_t ___FLLogSystemQuery_block_invoke()
{
  _FLLogSystemQuery_log = (uint64_t)os_log_create("com.apple.followup", "query");

  return MEMORY[0x1F41817F8]();
}

@end