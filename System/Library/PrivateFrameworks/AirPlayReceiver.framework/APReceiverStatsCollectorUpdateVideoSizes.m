@interface APReceiverStatsCollectorUpdateVideoSizes
@end

@implementation APReceiverStatsCollectorUpdateVideoSizes

__n128 __APReceiverStatsCollectorUpdateVideoSizes_block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 144) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(*(void *)(a1 + 32) + 176) = *(_OWORD *)(a1 + 56);
  __n128 result = *(__n128 *)(a1 + 72);
  *(__n128 *)(*(void *)(a1 + 32) + 160) = result;
  return result;
}

@end