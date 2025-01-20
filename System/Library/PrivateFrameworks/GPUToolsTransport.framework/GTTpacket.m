@interface GTTpacket
@end

@implementation GTTpacket

uint64_t __GTTpacket_finish_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) length];
}

@end