@interface CDMDataDispatcherCompletionQueue
+ (id)getDataDispatcherCompletionQueue;
@end

@implementation CDMDataDispatcherCompletionQueue

+ (id)getDataDispatcherCompletionQueue
{
  if (getDataDispatcherCompletionQueue_once != -1) {
    dispatch_once(&getDataDispatcherCompletionQueue_once, &__block_literal_global_4185);
  }
  v2 = (void *)getDataDispatcherCompletionQueue_queue;
  return v2;
}

void __68__CDMDataDispatcherCompletionQueue_getDataDispatcherCompletionQueue__block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.siri.cdm.CDMDataDispatcherQueue", v0);
  v2 = (void *)getDataDispatcherCompletionQueue_queue;
  getDataDispatcherCompletionQueue_queue = (uint64_t)v1;
}

@end