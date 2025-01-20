@interface SCNetworkConnectionQueue
@end

@implementation SCNetworkConnectionQueue

dispatch_queue_t ____SCNetworkConnectionQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("SCNetworkConnectionQueue", 0);
  __SCNetworkConnectionQueue_q = (uint64_t)result;
  return result;
}

@end