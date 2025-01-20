@interface AKLogSystemQuery
@end

@implementation AKLogSystemQuery

uint64_t ___AKLogSystemQuery_block_invoke()
{
  _AKLogSystemQuery_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "query");

  return MEMORY[0x1F41817F8]();
}

@end