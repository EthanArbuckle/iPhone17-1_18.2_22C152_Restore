@interface SBufConsumerStop
@end

@implementation SBufConsumerStop

void ___SBufConsumerStop_block_invoke(uint64_t a1)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 144), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  uint64_t v2 = *(void *)(a1 + 32);
  *(void *)(v2 + 152) = 0;
  *(void *)(v2 + 160) = 0;
}

@end