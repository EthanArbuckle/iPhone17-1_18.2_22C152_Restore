@interface BRKSharedBackgroundQueue
@end

@implementation BRKSharedBackgroundQueue

void ___BRKSharedBackgroundQueue_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.brook.background-shared", attr);
  v2 = (void *)_BRKSharedBackgroundQueue_Queue;
  _BRKSharedBackgroundQueue_Queue = (uint64_t)v1;
}

@end