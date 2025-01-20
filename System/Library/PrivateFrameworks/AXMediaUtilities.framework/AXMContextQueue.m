@interface AXMContextQueue
@end

@implementation AXMContextQueue

void ___AXMContextQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("contextQueue", 0);
  v1 = (void *)_AXMContextQueue__ContextQueue;
  _AXMContextQueue__ContextQueue = (uint64_t)v0;
}

@end