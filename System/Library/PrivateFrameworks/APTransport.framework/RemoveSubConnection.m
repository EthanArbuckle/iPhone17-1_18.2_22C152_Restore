@interface RemoveSubConnection
@end

@implementation RemoveSubConnection

uint64_t __udpconnectionAggregate_RemoveSubConnection_block_invoke(uint64_t a1)
{
  return MEMORY[0x1F40F3DF0](*(void *)(*(void *)(a1 + 32) + 320), *(void *)(a1 + 40));
}

@end