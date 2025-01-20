@interface FPExtensionCollectionDSCopySubscriber
- (FPExtensionCollectionDSCopySubscriber)init;
- (void)markObserving;
- (void)startMonitoringWithURL:(id)a3 publishingHandler:(id)a4;
- (void)stopMonitoring;
@end

@implementation FPExtensionCollectionDSCopySubscriber

- (FPExtensionCollectionDSCopySubscriber)init
{
  v7.receiver = self;
  v7.super_class = (Class)FPExtensionCollectionDSCopySubscriber;
  v2 = [(FPExtensionCollectionDSCopySubscriber *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.FileProvider.ItemCollection.progress-queue", v3);
    dsCopySubscriberQueue = v2->_dsCopySubscriberQueue;
    v2->_dsCopySubscriberQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)startMonitoringWithURL:(id)a3 publishingHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dsCopySubscriberQueue = self->_dsCopySubscriberQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__FPExtensionCollectionDSCopySubscriber_startMonitoringWithURL_publishingHandler___block_invoke;
  block[3] = &unk_1E5AF08A0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dsCopySubscriberQueue, block);
}

void *__82__FPExtensionCollectionDSCopySubscriber_startMonitoringWithURL_publishingHandler___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (!*(void *)(v3 + 8))
    {
      if (*(unsigned char *)(v3 + 25))
      {
        result = (void *)[result startAccessingSecurityScopedResource];
        *(unsigned char *)(*(void *)(a1 + 40) + 24) = (_BYTE)result;
        uint64_t v4 = *(void *)(a1 + 40);
        if (*(unsigned char *)(v4 + 24))
        {
          objc_storeStrong((id *)(v4 + 16), *(id *)(a1 + 32));
          *(void *)(*(void *)(a1 + 40) + 8) = [MEMORY[0x1E4F28F90] addSubscriberForFileURL:*(void *)(*(void *)(a1 + 40) + 16) withPublishingHandler:*(void *)(a1 + 48)];
          return (void *)MEMORY[0x1F41817F8]();
        }
      }
    }
  }
  return result;
}

- (void)markObserving
{
  dsCopySubscriberQueue = self->_dsCopySubscriberQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FPExtensionCollectionDSCopySubscriber_markObserving__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async(dsCopySubscriberQueue, block);
}

uint64_t __54__FPExtensionCollectionDSCopySubscriber_markObserving__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 25) = 1;
  return result;
}

- (void)stopMonitoring
{
  dsCopySubscriberQueue = self->_dsCopySubscriberQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FPExtensionCollectionDSCopySubscriber_stopMonitoring__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async(dsCopySubscriberQueue, block);
}

void __55__FPExtensionCollectionDSCopySubscriber_stopMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    objc_msgSend(MEMORY[0x1E4F28F90], "removeSubscriber:");
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 24))
  {
    [*(id *)(v2 + 16) stopAccessingSecurityScopedResource];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v5 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsCopySubscriberQueue, 0);
  objc_storeStrong((id *)&self->_dsCopySubscriberURL, 0);

  objc_storeStrong(&self->_dsCopySubscriber, 0);
}

@end