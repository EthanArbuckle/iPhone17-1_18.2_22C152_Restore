@interface HMEMemoryEventBus
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMELastEventStoreWriteHandle)eventStoreWriteHandle;
- (HMEMemoryEventBus)initWithQueue:(id)a3;
- (HMEMemoryEventBus)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logCategory:(const char *)a6;
- (HMEMemoryEventBusDataSource)dataSource;
- (HMEMemoryEventBusDelegate)delegate;
- (HMETopicRouter)topicRouter;
- (OS_dispatch_queue)queue;
- (id)_cachedEventsForTopics:(void *)a1;
- (id)upstreamTopicsForTopic:(id)a3;
- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5;
- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterConsumer:(id)a3 completion:(id)a4;
- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5;
- (void)unregisterConsumerSync:(id)a3 completion:(id)a4;
@end

@implementation HMEMemoryEventBus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreWriteHandle, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMELastEventStoreWriteHandle)eventStoreWriteHandle
{
  return (HMELastEventStoreWriteHandle *)objc_getProperty(self, a2, 56, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMETopicRouter)topicRouter
{
  return (HMETopicRouter *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMEMemoryEventBusDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMEMemoryEventBusDataSource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMEMemoryEventBusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMEMemoryEventBusDelegate *)WeakRetained;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4 = a3;
  v5 = [(HMEMemoryEventBus *)self dataSource];
  v6 = [v5 upstreamTopicsForTopic:v4];

  return v6;
}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMEMemoryEventBus *)self delegate];
  [v8 didChangeRegistrationsWithTopicFilterAdditions:v7 removals:v6];
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMEMemoryEventBus *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__HMEMemoryEventBus_didReceiveCachedEvent_topic_source___block_invoke;
  v15[3] = &unk_1E5956098;
  id v16 = v10;
  v17 = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __56__HMEMemoryEventBus_didReceiveCachedEvent_topic_source___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCachedEventSourceCurrentProcess] & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 56);
    id v4 = *(id *)(a1 + 48);
    id v5 = v3;
    if (v2)
    {
      id v6 = [v2 queue];
      dispatch_assert_queue_V2(v6);

      id v7 = [v2 eventStoreWriteHandle];

      if (v7)
      {
        id v8 = [v2 eventStoreWriteHandle];
        [v8 writer:v2 saveEventIfDifferent:v4 topic:v5];
      }
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = objc_msgSend(*(id *)(a1 + 40), "topicRouter", 0);
    id v10 = [v9 consumersForTopic:*(void *)(a1 + 56)];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (v15)
          {
            if (objc_opt_respondsToSelector()) {
              [v15 didReceiveCachedEvent:*(void *)(a1 + 48) topic:*(void *)(a1 + 56) source:*(void *)(a1 + 32)];
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
}

- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMEMemoryEventBus *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__HMEMemoryEventBus_forwardEvent_topic_completion___block_invoke;
  v15[3] = &unk_1E5956048;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

uint64_t __51__HMEMemoryEventBus_forwardEvent_topic_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = v2[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v4;
    _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Received event for topic %@", buf, 0xCu);
    v2 = *(void **)(a1 + 32);
    v3 = v2[1];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    uint64_t v29 = v20;
    _os_log_debug_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEBUG, "Received event for topic %@, event: %@", buf, 0x16u);
    v2 = *(void **)(a1 + 32);
  }
  id v5 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = v5;
  if (v2)
  {
    id v8 = [v2 queue];
    dispatch_assert_queue_V2(v8);

    id v9 = [v2 eventStoreWriteHandle];

    if (v9)
    {
      id v10 = [v2 eventStoreWriteHandle];
      [v10 writer:v2 saveEventIfAllowed:v6 topic:v7];
    }
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "topicRouter", 0);
  id v12 = [v11 consumersForTopic:*(void *)(a1 + 40)];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v17) {
          [v17 didReceiveEvent:*(void *)(a1 + 48) topic:*(void *)(a1 + 40)];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)unregisterConsumerSync:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(HMEMemoryEventBus *)self queue];
  dispatch_assert_queue_V2(v8);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Unregistering consumer: %@", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [(HMEMemoryEventBus *)self topicRouter];
  [v10 unregisterConsumer:v6];

  if (v7) {
    v7[2](v7, 0);
  }
}

- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *, void))a6;
  uint64_t v14 = [(HMEMemoryEventBus *)self queue];
  dispatch_assert_queue_V2(v14);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = logger;
    int v19 = 138412802;
    id v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = [v11 count];
    __int16 v23 = 2048;
    uint64_t v24 = [v12 count];
    _os_log_impl(&dword_19D557000, v16, OS_LOG_TYPE_DEFAULT, "Changing registrations for consumer: %@, topicFilterAdditions: %ld, topicFilterRemovals: %ld", (uint8_t *)&v19, 0x20u);

    logger = self->_logger;
  }
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = (uint64_t)v11;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v12;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Changing registrations for consumer: %@, topicFilterAdditions: %@, topicFilterRemovals: %@", (uint8_t *)&v19, 0x20u);
  }
  id v17 = [(HMEMemoryEventBus *)self topicRouter];
  [v17 changeRegistrationsForConsumer:v10 topicFilterAdditions:v11 topicFilterRemovals:v12];

  if (v13)
  {
    id v18 = -[HMEMemoryEventBus _cachedEventsForTopics:](self, v11);
    v13[2](v13, v18, 0);
  }
}

- (id)_cachedEventsForTopics:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 eventStoreReadHandle];

    if (v4)
    {
      id v5 = [a1 eventStoreReadHandle];
      a1 = [v5 eventsForTopicFilters:v3];
    }
    else
    {
      a1 = (void *)MEMORY[0x1E4F1CC08];
    }
  }

  return a1;
}

- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMEMemoryEventBus *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HMEMemoryEventBus_unregisterConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E5956048;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __64__HMEMemoryEventBus_unregisterConsumer_topicFilters_completion___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  id v3 = v2[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering consumer: %@ from topicFilters: %@", (uint8_t *)&v8, 0x16u);
    v2 = (void *)a1[4];
  }
  id v6 = [v2 topicRouter];
  [v6 unregisterConsumer:a1[5] topicFilters:a1[6]];

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)unregisterConsumer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMEMemoryEventBus *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMEMemoryEventBus_unregisterConsumer_completion___block_invoke;
  block[3] = &unk_1E5956070;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__HMEMemoryEventBus_unregisterConsumer_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterConsumerSync:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMEMemoryEventBus *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HMEMemoryEventBus_registerConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E5956048;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __62__HMEMemoryEventBus_registerConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = v2[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Registering consumer: %@ for topicFilters: %@", (uint8_t *)&v9, 0x16u);
    v2 = *(void **)(a1 + 32);
  }
  id v6 = [v2 topicRouter];
  [v6 registerConsumer:*(void *)(a1 + 40) topicFilters:*(void *)(a1 + 48)];

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    id v8 = -[HMEMemoryEventBus _cachedEventsForTopics:](*(void **)(a1 + 32), *(void **)(a1 + 48));
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMEMemoryEventBus *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__HMEMemoryEventBus_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
  block[3] = &unk_1E5956020;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __104__HMEMemoryEventBus_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeRegistrationsSyncForConsumer:*(void *)(a1 + 40) topicFilterAdditions:*(void *)(a1 + 48) topicFilterRemovals:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (HMEMemoryEventBus)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logCategory:(const char *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMEMemoryEventBus;
  id v14 = [(HMEMemoryEventBus *)&v20 init];
  if (v14)
  {
    os_log_t v15 = os_log_create("com.apple.HomeKitEventRouter", a6);
    logger = v14->_logger;
    v14->_logger = (OS_os_log *)v15;

    id v17 = [[HMETopicRouter alloc] initWithDelegate:v14 logger:v14->_logger];
    topicRouter = v14->_topicRouter;
    v14->_topicRouter = v17;

    objc_storeStrong((id *)&v14->_queue, a3);
    objc_storeStrong((id *)&v14->_eventStoreReadHandle, a4);
    objc_storeStrong((id *)&v14->_eventStoreWriteHandle, a5);
  }

  return v14;
}

- (HMEMemoryEventBus)initWithQueue:(id)a3
{
  return [(HMEMemoryEventBus *)self initWithQueue:a3 storeReadHandle:0 storeWriteHandle:0 logCategory:"MemoryEventBus"];
}

@end