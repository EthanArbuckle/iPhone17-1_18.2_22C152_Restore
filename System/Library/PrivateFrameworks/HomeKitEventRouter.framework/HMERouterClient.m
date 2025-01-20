@interface HMERouterClient
- (BOOL)handleChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4;
- (BOOL)isActiveForSaving;
- (BOOL)isCachedEventSourceCurrentProcess;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMELastEventStoreWriteHandle)eventStoreWriteHandle;
- (HMERouterClient)initWithQueue:(id)a3;
- (HMERouterClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 logger:(id)a5;
- (HMERouterClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logger:(id)a6;
- (HMERouterClientDelegate)privateDelegate;
- (HMETopicRouter)topicRouter;
- (OS_dispatch_queue)queue;
- (id)_cachedEventsForExpandedTopics:(void *)a1;
- (id)dumpStateDescription;
- (id)forwardingTopicsForTopics:(id)a3;
- (id)processReceivedCachedEvents:(id)a3;
- (id)upstreamTopicsForTopic:(id)a3;
- (unint64_t)willWriteToStore;
- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4;
- (void)processReceivedEvents:(id)a3;
- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5;
- (void)setPrivateDelegate:(id)a3;
- (void)unregisterConsumer:(id)a3 completion:(id)a4;
- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5;
- (void)unregisterConsumerSync:(id)a3 completion:(id)a4;
@end

@implementation HMERouterClient

- (void)setPrivateDelegate:(id)a3
{
}

- (HMETopicRouter)topicRouter
{
  return (HMETopicRouter *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMERouterClientDelegate)privateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);
  return (HMERouterClientDelegate *)WeakRetained;
}

- (HMERouterClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logger:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMERouterClient;
  v15 = [(HMERouterClient *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_logger, a6);
    objc_storeStrong((id *)&v16->_queue, a3);
    v17 = [[HMETopicRouter alloc] initWithDelegate:v16 logger:v14];
    topicRouter = v16->_topicRouter;
    v16->_topicRouter = v17;

    objc_storeStrong((id *)&v16->_eventStoreReadHandle, a4);
    objc_storeStrong((id *)&v16->_eventStoreWriteHandle, a5);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventStoreWriteHandle, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMELastEventStoreWriteHandle)eventStoreWriteHandle
{
  return (HMELastEventStoreWriteHandle *)objc_getProperty(self, a2, 24, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)willWriteToStore
{
  return 0;
}

- (BOOL)isActiveForSaving
{
  return 1;
}

- (id)forwardingTopicsForTopics:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  return 0;
}

- (BOOL)handleChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMERouterClient *)self topicRouter];
  v9 = [v8 allRegisteredTopicFilters];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
  v25[3] = &unk_1E5955E68;
  v25[4] = self;
  v10 = +[HMETopicRouter forwardingTopicsForAdditions:v6 removals:v7 current:v9 indexProvider:v25];

  id v11 = [v10 objectAtIndexedSubscript:0];
  id v12 = [v11 allObjects];
  if ([v12 count])
  {

LABEL_4:
    objc_initWeak(&location, self);
    v16 = [(HMERouterClient *)self privateDelegate];
    v17 = [v10 objectAtIndexedSubscript:0];
    v18 = [v17 allObjects];
    v19 = [v10 objectAtIndexedSubscript:1];
    objc_super v20 = [v19 allObjects];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2;
    v22[3] = &unk_1E5955CB0;
    objc_copyWeak(&v23, &location);
    [v16 sendChangeRegistrationsMessageWithAddedFilters:v18 removedFilters:v20 completion:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    goto LABEL_5;
  }
  id v13 = [v10 objectAtIndexedSubscript:1];
  id v14 = [v13 allObjects];
  uint64_t v15 = [v14 count];

  if (v15) {
    goto LABEL_4;
  }
LABEL_5:

  return 1;
}

uint64_t __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) forwardingTopicsForTopics:a2];
}

void __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_3;
    v7[3] = &unk_1E5955FD0;
    v7[4] = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

id __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) processReceivedCachedEvents:*(void *)(a1 + 40)];
}

- (id)processReceivedCachedEvents:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMERouterClient *)self isActiveForSaving];
  logger = self->_logger;
  BOOL v7 = os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = logger;
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = [v4 count];
      _os_log_impl(&dword_19D557000, v8, OS_LOG_TYPE_DEFAULT, "Processing received cached events %ld", buf, 0xCu);

      logger = self->_logger;
    }
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = (uint64_t)v4;
      _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Processing received cached events %@", buf, 0xCu);
    }
    unint64_t v37 = [(HMERouterClient *)self willWriteToStore];
    v39 = [MEMORY[0x1E4F1CA48] array];
    v9 = [(HMERouterClient *)self queue];
    dispatch_assert_queue_V2(v9);

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v38 = v4;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v49;
      uint64_t v40 = *(void *)v49;
      id v41 = v10;
      do
      {
        uint64_t v14 = 0;
        uint64_t v42 = v12;
        do
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x19F3A6E70]();
          id v17 = [v10 objectForKeyedSubscript:v15];
          id v18 = v15;
          if (!self) {
            goto LABEL_30;
          }
          v19 = [(HMERouterClient *)self queue];
          dispatch_assert_queue_V2(v19);

          uint64_t v20 = [(HMERouterClient *)self eventStoreWriteHandle];
          if (!v20) {
            goto LABEL_30;
          }
          v21 = (void *)v20;
          BOOL v22 = [(HMERouterClient *)self isActiveForSaving];

          if (v22)
          {
            id v23 = [(HMERouterClient *)self eventStoreWriteHandle];
            int v24 = [v23 writer:self saveEventIfDifferent:v17 topic:v18];

            if (!v24) {
              goto LABEL_32;
            }
            v25 = self->_logger;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v55 = (uint64_t)v18;
              _os_log_debug_impl(&dword_19D557000, v25, OS_LOG_TYPE_DEBUG, "Forwarding received cached event for topic %@", buf, 0xCu);
            }
            v43 = v16;
            v26 = [(HMERouterClient *)self topicRouter];
            v27 = [v26 consumersForTopic:v18];

            if (![v27 count]) {
              [v39 addObject:v18];
            }
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v28 = v27;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v45;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v45 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                  if (v33 && (objc_opt_respondsToSelector() & 1) != 0) {
                    [v33 didReceiveCachedEvent:v17 topic:v18 source:self];
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v30);
              id v18 = v28;
              uint64_t v13 = v40;
              id v10 = v41;
            }
            else
            {
              id v18 = v28;
            }
            uint64_t v12 = v42;
          }
          else
          {
LABEL_30:
            v43 = v16;
            id v28 = v17;
          }

          v16 = v43;
LABEL_32:

          ++v14;
        }
        while (v14 != v12);
        uint64_t v34 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
        uint64_t v12 = v34;
      }
      while (v34);
    }

    [(HMERouterClient *)self finishedWritingToStore:v37];
    v35 = (void *)[v39 copy];

    id v4 = v38;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Not processing events when not active", buf, 2u);
    }
    v35 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v35;
}

- (void)processReceivedEvents:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMERouterClient *)self isActiveForSaving])
  {
    unint64_t v29 = [(HMERouterClient *)self willWriteToStore];
    BOOL v5 = [(HMERouterClient *)self queue];
    dispatch_assert_queue_V2(v5);

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = v4;
    obuint64_t j = v4;
    uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(obj);
          }
          BOOL v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v8 = [v7 event];
          if (![(HMERouterClient *)self isActiveForSaving])
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Went inactive", buf, 2u);
            }

            goto LABEL_30;
          }
          v9 = [v7 topic];
          id v10 = v8;
          id v11 = v9;
          if (self)
          {
            uint64_t v12 = [(HMERouterClient *)self queue];
            dispatch_assert_queue_V2(v12);

            uint64_t v13 = [(HMERouterClient *)self eventStoreWriteHandle];

            if (v13)
            {
              uint64_t v14 = [(HMERouterClient *)self eventStoreWriteHandle];
              [v14 writer:self saveEventIfAllowed:v10 topic:v11];
            }
          }

          uint64_t v15 = self->_logger;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            id v17 = [v7 topic];
            *(_DWORD *)buf = 138412290;
            long long v44 = v17;
            _os_log_impl(&dword_19D557000, v16, OS_LOG_TYPE_DEFAULT, "Forwarding received event for topic %@", buf, 0xCu);
          }
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v18 = [(HMERouterClient *)self topicRouter];
          v19 = [v7 topic];
          uint64_t v20 = [v18 consumersForTopic:v19];

          uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v35 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                if (v25)
                {
                  v26 = [v7 topic];
                  [v25 didReceiveEvent:v10 topic:v26];
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v22);
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
LABEL_30:

    [(HMERouterClient *)self finishedWritingToStore:v29];
    id v4 = v30;
  }
  else
  {
    v27 = self->_logger;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D557000, v27, OS_LOG_TYPE_DEFAULT, "Not processing events when not active", buf, 2u);
    }
  }
}

- (BOOL)isCachedEventSourceCurrentProcess
{
  return 0;
}

- (void)unregisterConsumerSync:(id)a3 completion:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  BOOL v7 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMERouterClient *)self topicRouter];
  [v8 unregisterConsumer:v6];

  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    v9 = v10;
  }
}

- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v16 = a4;
  id v10 = (void (**)(id, void *, void))a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [(HMERouterClient *)self topicRouter];
  [v14 changeRegistrationsForConsumer:v12 topicFilterAdditions:v16 topicFilterRemovals:v11];

  if (v10)
  {
    uint64_t v15 = -[HMERouterClient _cachedEventsForExpandedTopics:](self, v16);
    v10[2](v10, v15, 0);
  }
}

- (id)_cachedEventsForExpandedTopics:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 queue];
    dispatch_assert_queue_V2(v4);

    BOOL v5 = [a1 eventStoreReadHandle];

    if (v5)
    {
      id v6 = [a1 eventStoreReadHandle];
      a1 = [v6 eventsForTopicFilters:v3];
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
  id v11 = [(HMERouterClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HMERouterClient_unregisterConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E5956048;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __62__HMERouterClient_unregisterConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) topicRouter];
  [v2 unregisterConsumer:*(void *)(a1 + 40) topicFilters:*(void *)(a1 + 48)];

  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)unregisterConsumer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMERouterClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMERouterClient_unregisterConsumer_completion___block_invoke;
  block[3] = &unk_1E5956070;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __49__HMERouterClient_unregisterConsumer_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterConsumerSync:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMERouterClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HMERouterClient_registerConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E5956048;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __60__HMERouterClient_registerConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) topicRouter];
  [v2 registerConsumer:*(void *)(a1 + 40) topicFilters:*(void *)(a1 + 48)];

  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    -[HMERouterClient _cachedEventsForExpandedTopics:](*(void **)(a1 + 32), *(void **)(a1 + 48));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
  }
}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMERouterClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__HMERouterClient_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
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

uint64_t __102__HMERouterClient_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeRegistrationsSyncForConsumer:*(void *)(a1 + 40) topicFilterAdditions:*(void *)(a1 + 48) topicFilterRemovals:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[HMERouterClient handleChangeRegistrationsWithTopicFilterAdditions:removals:](self, "handleChangeRegistrationsWithTopicFilterAdditions:removals:", v6, v7)&& ([v6 count] || objc_msgSend(v7, "count")))
  {
    objc_initWeak(&location, self);
    id v8 = [(HMERouterClient *)self privateDelegate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
    v9[3] = &unk_1E5955CB0;
    objc_copyWeak(&v10, &location);
    [v8 sendChangeRegistrationsMessageWithAddedFilters:v6 removedFilters:v7 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2;
    v7[3] = &unk_1E5955FD0;
    v7[4] = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

id __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) processReceivedCachedEvents:*(void *)(a1 + 40)];
}

- (id)dumpStateDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(HMERouterClient *)self topicRouter];
  id v7 = [v6 dumpStateDescription];
  id v8 = [v3 stringWithFormat:@"[%@: \n\t topicRouter: %@]", v5, v7];

  return v8;
}

- (HMERouterClient)initWithQueue:(id)a3
{
  id v4 = a3;
  os_log_t v5 = os_log_create("com.apple.HomeKitEventRouter", "HMERouterClient");
  id v6 = [(HMERouterClient *)self initWithQueue:v4 storeReadHandle:0 logger:v5];

  return v6;
}

- (HMERouterClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 logger:(id)a5
{
  return [(HMERouterClient *)self initWithQueue:a3 storeReadHandle:a4 storeWriteHandle:0 logger:a5];
}

@end