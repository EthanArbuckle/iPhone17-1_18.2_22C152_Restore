@interface FMScheduler
+ (FMScheduler)schedulerWithDispatchQueue:(id)a3;
+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3;
+ (id)serialDispatchQueueSchedulerWithName:(id)a3;
@end

@implementation FMScheduler

id __33__FMScheduler_immediateScheduler__block_invoke()
{
  if (_block_invoke_fm_once_token_0 != -1) {
    dispatch_once(&_block_invoke_fm_once_token_0, &__block_literal_global_3);
  }
  v0 = (void *)_block_invoke_fm_once_object_0;
  return v0;
}

uint64_t __33__FMScheduler_immediateScheduler__block_invoke_2()
{
  _block_invoke_fm_once_object_0 = objc_alloc_init(_FMImmediateScheduler);
  return MEMORY[0x1F41817F8]();
}

id __35__FMScheduler_globalAsyncScheduler__block_invoke()
{
  if (_block_invoke_2_fm_once_token_1 != -1) {
    dispatch_once(&_block_invoke_2_fm_once_token_1, &__block_literal_global_7_0);
  }
  v0 = (void *)_block_invoke_2_fm_once_object_1;
  return v0;
}

void __35__FMScheduler_globalAsyncScheduler__block_invoke_2()
{
  v0 = [_FMQueueScheduler alloc];
  dispatch_get_global_queue(21, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(_FMQueueScheduler *)v0 initWithQueue:v3];
  v2 = (void *)_block_invoke_2_fm_once_object_1;
  _block_invoke_2_fm_once_object_1 = v1;
}

id __34__FMScheduler_mainThreadScheduler__block_invoke()
{
  if (_block_invoke_3_fm_once_token_2 != -1) {
    dispatch_once(&_block_invoke_3_fm_once_token_2, &__block_literal_global_12);
  }
  v0 = (void *)_block_invoke_3_fm_once_object_2;
  return v0;
}

uint64_t __34__FMScheduler_mainThreadScheduler__block_invoke_2()
{
  _block_invoke_3_fm_once_object_2 = objc_alloc_init(_FMMainThreadScheduler);
  return MEMORY[0x1F41817F8]();
}

+ (FMScheduler)schedulerWithDispatchQueue:(id)a3
{
  id v3 = a3;
  v4 = [[_FMQueueScheduler alloc] initWithQueue:v3];

  return (FMScheduler *)v4;
}

+ (id)serialDispatchQueueSchedulerWithName:(id)a3
{
  id v3 = (const char *)[a3 UTF8String];
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v5 = dispatch_queue_create(v3, v4);

  v6 = [[_FMQueueScheduler alloc] initWithQueue:v5];
  return v6;
}

+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3
{
  id v3 = [[_FMOperationQueueScheduler alloc] initWithMaxConcurrentOperationCount:a3];
  return v3;
}

@end