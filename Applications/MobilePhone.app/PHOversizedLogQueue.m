@interface PHOversizedLogQueue
@end

@implementation PHOversizedLogQueue

void __PHOversizedLogQueue_block_invoke(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)PHOversizedLogQueue_PHOversizedLogQueue;
  PHOversizedLogQueue_PHOversizedLogQueue = (uint64_t)v1;
}

@end