@interface CNCombinedBufferingStrategy
@end

@implementation CNCombinedBufferingStrategy

uint64_t __69___CNCombinedBufferingStrategy_buffer_didReceiveResults_forObserver___block_invoke(void *a1, void *a2)
{
  return [a2 buffer:a1[4] didReceiveResults:a1[5] forObserver:a1[6]];
}

uint64_t __53___CNCombinedBufferingStrategy_bufferDidSendResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bufferDidSendResults:*(void *)(a1 + 32)];
}

@end