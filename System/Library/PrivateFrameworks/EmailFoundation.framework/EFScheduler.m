@interface EFScheduler
+ (EFScheduler)globalAsyncScheduler;
+ (EFScheduler)immediateScheduler;
+ (EFScheduler)mainThreadScheduler;
+ (id)_globalAsyncSchedulerWithQualityOfService:(int64_t)a3;
+ (id)dispatchQueueSchedulerWithQueue:(id)a3;
+ (id)globalAsyncSchedulerWithQualityOfService:(int64_t)a3;
+ (id)onScheduler:(id)a3 performWithObject:(id)a4;
+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3;
+ (id)serialDispatchQueueSchedulerWithName:(id)a3;
+ (id)serialDispatchQueueSchedulerWithName:(id)a3 qualityOfService:(int64_t)a4;
@end

@implementation EFScheduler

+ (EFScheduler)mainThreadScheduler
{
  if (mainThreadScheduler_onceToken != -1) {
    dispatch_once(&mainThreadScheduler_onceToken, &__block_literal_global_13_1);
  }
  v2 = (void *)mainThreadScheduler_scheduler;
  return (EFScheduler *)v2;
}

void __34__EFScheduler_mainThreadScheduler__block_invoke()
{
  v0 = objc_alloc_init(EFMainThreadScheduler);
  v1 = (void *)mainThreadScheduler_scheduler;
  mainThreadScheduler_scheduler = (uint64_t)v0;
}

void __56__EFScheduler_globalAsyncSchedulerWithQualityOfService___block_invoke(uint64_t a1)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = &unk_1F0EC0070;
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) _globalAsyncSchedulerWithQualityOfService:-1];
  v11[0] = v3;
  v10[1] = &unk_1F0EC0088;
  v4 = [*v2 _globalAsyncSchedulerWithQualityOfService:9];
  v11[1] = v4;
  v10[2] = &unk_1F0EC00A0;
  v5 = [*(id *)(a1 + 32) _globalAsyncSchedulerWithQualityOfService:17];
  v11[2] = v5;
  v10[3] = &unk_1F0EC00B8;
  v6 = [*(id *)(a1 + 32) _globalAsyncSchedulerWithQualityOfService:25];
  v11[3] = v6;
  v10[4] = &unk_1F0EC00D0;
  v7 = [*(id *)(a1 + 32) _globalAsyncSchedulerWithQualityOfService:33];
  v11[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  v9 = (void *)globalAsyncSchedulerWithQualityOfService__qosSchedulers;
  globalAsyncSchedulerWithQualityOfService__qosSchedulers = v8;
}

+ (id)_globalAsyncSchedulerWithQualityOfService:(int64_t)a3
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = v5;
  unint64_t v7 = __ROR8__(a3 - 9, 3);
  dispatch_qos_class_t v8 = 8 * v7 + 9;
  if (v7 >= 4) {
    dispatch_qos_class_t v9 = QOS_CLASS_DEFAULT;
  }
  else {
    dispatch_qos_class_t v9 = v8;
  }
  v10 = dispatch_queue_attr_make_with_qos_class(v5, v9, 0);

  dispatch_queue_t v11 = dispatch_queue_create(0, v10);
  v12 = [a1 dispatchQueueSchedulerWithQueue:v11];

  return v12;
}

+ (id)serialDispatchQueueSchedulerWithName:(id)a3
{
  v3 = [a1 serialDispatchQueueSchedulerWithName:a3 qualityOfService:-1];
  return v3;
}

+ (id)serialDispatchQueueSchedulerWithName:(id)a3 qualityOfService:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_qos_class_t v8 = v7;
  unint64_t v9 = __ROR8__(a4 - 9, 3);
  dispatch_qos_class_t v10 = 8 * v9 + 9;
  if (v9 >= 4) {
    dispatch_qos_class_t v11 = QOS_CLASS_DEFAULT;
  }
  else {
    dispatch_qos_class_t v11 = v10;
  }
  v12 = dispatch_queue_attr_make_with_qos_class(v7, v11, 0);

  id v13 = v6;
  dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], v12);
  v15 = [a1 dispatchQueueSchedulerWithQueue:v14];

  return v15;
}

+ (id)dispatchQueueSchedulerWithQueue:(id)a3
{
  id v3 = a3;
  v4 = [[EFQueueScheduler alloc] initWithQueue:v3];

  return v4;
}

+ (EFScheduler)globalAsyncScheduler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EFScheduler_globalAsyncScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (globalAsyncScheduler_onceToken != -1) {
    dispatch_once(&globalAsyncScheduler_onceToken, block);
  }
  v2 = (void *)globalAsyncScheduler_scheduler;
  return (EFScheduler *)v2;
}

+ (EFScheduler)immediateScheduler
{
  if (immediateScheduler_onceToken != -1) {
    dispatch_once(&immediateScheduler_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)immediateScheduler_scheduler;
  return (EFScheduler *)v2;
}

+ (id)onScheduler:(id)a3 performWithObject:(id)a4
{
  v4 = +[EFSchedulerTrampoline trampolineWithScheduler:a3 object:a4];
  return v4;
}

void __33__EFScheduler_immediateScheduler__block_invoke()
{
  v0 = objc_alloc_init(EFImmediateScheduler);
  v1 = (void *)immediateScheduler_scheduler;
  immediateScheduler_scheduler = (uint64_t)v0;
}

void __35__EFScheduler_globalAsyncScheduler__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) globalAsyncSchedulerWithQualityOfService:-1];
  v2 = (void *)globalAsyncScheduler_scheduler;
  globalAsyncScheduler_scheduler = v1;
}

+ (id)globalAsyncSchedulerWithQualityOfService:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EFScheduler_globalAsyncSchedulerWithQualityOfService___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (globalAsyncSchedulerWithQualityOfService__onceToken != -1) {
    dispatch_once(&globalAsyncSchedulerWithQualityOfService__onceToken, block);
  }
  v4 = (void *)globalAsyncSchedulerWithQualityOfService__qosSchedulers;
  v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3
{
  id v3 = [[EFOperationQueueScheduler alloc] initWithMaxConcurrentOperationCount:a3];
  return v3;
}

@end