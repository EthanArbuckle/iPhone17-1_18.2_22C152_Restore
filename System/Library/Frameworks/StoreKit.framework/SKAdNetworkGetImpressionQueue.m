@interface SKAdNetworkGetImpressionQueue
@end

@implementation SKAdNetworkGetImpressionQueue

void ___SKAdNetworkGetImpressionQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreKit.SKAdNetworkImpressionQueue", 0);
  v1 = (void *)_SKAdNetworkGetImpressionQueue_sSKAdNetworkImpressionQueue;
  _SKAdNetworkGetImpressionQueue_sSKAdNetworkImpressionQueue = (uint64_t)v0;

  v2 = _SKAdNetworkGetImpressionQueue_sSKAdNetworkImpressionQueue;
  v3 = dispatch_get_global_queue(25, 0);
  dispatch_set_target_queue(v2, v3);
}

@end