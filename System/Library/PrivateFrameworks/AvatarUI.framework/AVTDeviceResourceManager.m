@interface AVTDeviceResourceManager
- (AVTDeviceResourceManager)initWithLogger:(id)a3 lockProvider:(id)a4;
- (AVTUILogger)logger;
- (NSMutableArray)consumers;
- (OS_dispatch_queue)stateLock;
- (void)consumer:(id)a3 willConsumeRenderingResourceForEstimatedDuration:(double)a4;
- (void)performWorkWithConsumers:(id)a3;
- (void)registerConsumer:(id)a3;
- (void)unregisterConsumer:(id)a3;
@end

@implementation AVTDeviceResourceManager

- (AVTDeviceResourceManager)initWithLogger:(id)a3 lockProvider:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, const char *))a4;
  v16.receiver = self;
  v16.super_class = (Class)AVTDeviceResourceManager;
  v9 = [(AVTDeviceResourceManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    uint64_t v11 = v8[2](v8, "com.apple.AvatarUI.AVTDeviceResourceManager.stateLock");
    stateLock = v10->_stateLock;
    v10->_stateLock = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    consumers = v10->_consumers;
    v10->_consumers = (NSMutableArray *)v13;
  }
  return v10;
}

- (void)performWorkWithConsumers:(id)a3
{
  id v4 = a3;
  v5 = [(AVTDeviceResourceManager *)self stateLock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__AVTDeviceResourceManager_performWorkWithConsumers___block_invoke;
  v7[3] = &unk_263FF02C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __53__AVTDeviceResourceManager_performWorkWithConsumers___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) consumers];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)registerConsumer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__AVTDeviceResourceManager_registerConsumer___block_invoke;
  v6[3] = &unk_263FF2B80;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(AVTDeviceResourceManager *)self performWorkWithConsumers:v6];
}

void __45__AVTDeviceResourceManager_registerConsumer___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 setConsumerDelegate:v4];
  [v5 addObject:*(void *)(a1 + 32)];
}

- (void)unregisterConsumer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__AVTDeviceResourceManager_unregisterConsumer___block_invoke;
  v6[3] = &unk_263FF2BA8;
  id v7 = v4;
  id v5 = v4;
  [(AVTDeviceResourceManager *)self performWorkWithConsumers:v6];
}

void __47__AVTDeviceResourceManager_unregisterConsumer___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setConsumerDelegate:0];
  [v4 removeObject:*(void *)(a1 + 32)];
}

- (void)consumer:(id)a3 willConsumeRenderingResourceForEstimatedDuration:(double)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  objc_super v16 = __Block_byref_object_copy__17;
  v17 = __Block_byref_object_dispose__17;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke;
  v10[3] = &unk_263FF2BF8;
  id v7 = v6;
  id v11 = v7;
  v12 = &v13;
  [(AVTDeviceResourceManager *)self performWorkWithConsumers:v10];
  id v8 = (void *)v14[5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_3;
  v9[3] = &__block_descriptor_40_e44_v32__0___AVTDeviceResourceConsumer__8Q16_B24l;
  *(double *)&v9[4] = a4;
  [v8 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(&v13, 8);
}

void __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_2;
  v9[3] = &unk_263FF2BD0;
  id v10 = *(id *)(a1 + 32);
  id v4 = [v3 indexesOfObjectsPassingTest:v9];
  unint64_t v5 = [v4 count];
  if (v5 < [v3 count])
  {
    uint64_t v6 = [v3 objectsAtIndexes:v4];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

BOOL __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

uint64_t __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 releaseRenderingResourceForEstimatedDuration:*(double *)(a1 + 32)];
}

- (NSMutableArray)consumers
{
  return self->_consumers;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
}

@end