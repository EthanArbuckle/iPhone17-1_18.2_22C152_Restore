@interface CNScheduler
+ (CNScheduler)globalAsyncScheduler;
+ (CNScheduler)immediateScheduler;
+ (CNScheduler)inlineScheduler;
+ (CNScheduler)mainThreadScheduler;
+ (CNScheduler)offMainThreadScheduler;
+ (id)offMainThreadSchedulerWithBackgroundScheduler:(id)a3;
+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3;
+ (id)serialDispatchQueueSchedulerWithName:(id)a3;
+ (id)synchronousSerialDispatchQueueWithName:(id)a3;
@end

@implementation CNScheduler

+ (id)serialDispatchQueueSchedulerWithName:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v6 = dispatch_queue_create(v3, v5);

  v7 = [[_CNQueueScheduler alloc] initWithQueue:v6];

  return v7;
}

+ (CNScheduler)immediateScheduler
{
  if (immediateScheduler_cn_once_token_1 != -1) {
    dispatch_once(&immediateScheduler_cn_once_token_1, &__block_literal_global_25);
  }
  v2 = (void *)immediateScheduler_cn_once_object_1;

  return (CNScheduler *)v2;
}

+ (id)synchronousSerialDispatchQueueWithName:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v6 = dispatch_queue_create(v3, v5);

  v7 = [[_CNSynchronousQueueScheduler alloc] initWithQueue:v6];

  return v7;
}

+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3
{
  v3 = [[_CNOperationQueueScheduler alloc] initWithMaxConcurrentOperationCount:a3];

  return v3;
}

+ (CNScheduler)inlineScheduler
{
  if (inlineScheduler_cn_once_token_5 != -1) {
    dispatch_once(&inlineScheduler_cn_once_token_5, &__block_literal_global_11);
  }
  v2 = (void *)inlineScheduler_cn_once_object_5;

  return (CNScheduler *)v2;
}

+ (CNScheduler)mainThreadScheduler
{
  if (mainThreadScheduler_cn_once_token_3 != -1) {
    dispatch_once(&mainThreadScheduler_cn_once_token_3, &__block_literal_global_5);
  }
  v2 = (void *)mainThreadScheduler_cn_once_object_3;

  return (CNScheduler *)v2;
}

+ (CNScheduler)globalAsyncScheduler
{
  if (globalAsyncScheduler_cn_once_token_2 != -1) {
    dispatch_once(&globalAsyncScheduler_cn_once_token_2, &__block_literal_global_2_0);
  }
  v2 = (void *)globalAsyncScheduler_cn_once_object_2;

  return (CNScheduler *)v2;
}

uint64_t __35__CNScheduler_globalAsyncScheduler__block_invoke()
{
  globalAsyncScheduler_cn_once_object_2 = objc_alloc_init(_CNQueueScheduler);

  return MEMORY[0x1F41817F8]();
}

uint64_t __33__CNScheduler_immediateScheduler__block_invoke()
{
  immediateScheduler_cn_once_object_1 = objc_alloc_init(_CNImmediateScheduler);

  return MEMORY[0x1F41817F8]();
}

uint64_t __30__CNScheduler_inlineScheduler__block_invoke()
{
  inlineScheduler_cn_once_object_5 = objc_alloc_init(_CNInlineScheduler);

  return MEMORY[0x1F41817F8]();
}

uint64_t __34__CNScheduler_mainThreadScheduler__block_invoke()
{
  mainThreadScheduler_cn_once_object_3 = objc_alloc_init(_CNMainThreadScheduler);

  return MEMORY[0x1F41817F8]();
}

+ (CNScheduler)offMainThreadScheduler
{
  if (offMainThreadScheduler_cn_once_token_4 != -1) {
    dispatch_once(&offMainThreadScheduler_cn_once_token_4, &__block_literal_global_8_0);
  }
  v2 = (void *)offMainThreadScheduler_cn_once_object_4;

  return (CNScheduler *)v2;
}

uint64_t __37__CNScheduler_offMainThreadScheduler__block_invoke()
{
  offMainThreadScheduler_cn_once_object_4 = objc_alloc_init(_CNOffMainThreadScheduler);

  return MEMORY[0x1F41817F8]();
}

+ (id)offMainThreadSchedulerWithBackgroundScheduler:(id)a3
{
  id v3 = a3;
  v4 = [[_CNOffMainThreadScheduler alloc] initWithBackgroundScheduler:v3];

  return v4;
}

@end