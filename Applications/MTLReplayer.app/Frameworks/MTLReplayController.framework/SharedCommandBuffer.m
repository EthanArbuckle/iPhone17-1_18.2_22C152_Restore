@interface SharedCommandBuffer
@end

@implementation SharedCommandBuffer

id __SharedCommandBuffer_commitCommandBuffer_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

@end