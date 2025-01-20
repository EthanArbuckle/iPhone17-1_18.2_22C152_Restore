@interface AddSubConnection
@end

@implementation AddSubConnection

uint64_t __udpconnectionAggregate_AddSubConnection_block_invoke(uint64_t a1)
{
  return MEMORY[0x1F40F3DE8](*(void *)(*(void *)(a1 + 32) + 320), *(void *)(a1 + 40));
}

@end