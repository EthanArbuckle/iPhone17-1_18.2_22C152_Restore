@interface AXLocTables
@end

@implementation AXLocTables

uint64_t ___AXLocTables_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stringByAppendingString:a2];
}

@end