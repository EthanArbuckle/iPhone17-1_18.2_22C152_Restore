@interface DYMTLIndirectArgumentBufferManager
@end

@implementation DYMTLIndirectArgumentBufferManager

id __DYMTLIndirectArgumentBufferManager_processCommandBuffer_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

@end