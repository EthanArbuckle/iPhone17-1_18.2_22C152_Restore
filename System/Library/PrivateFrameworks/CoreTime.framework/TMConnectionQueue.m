@interface TMConnectionQueue
@end

@implementation TMConnectionQueue

dispatch_queue_t ___TMConnectionQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.timed.xpc", 0);
  _TMConnectionQueue_sConnectionQueue = (uint64_t)result;
  return result;
}

@end