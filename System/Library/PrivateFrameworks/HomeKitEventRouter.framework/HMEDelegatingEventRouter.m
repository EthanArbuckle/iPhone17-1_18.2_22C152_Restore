@interface HMEDelegatingEventRouter
- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4;
- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 logger:(id)a5;
- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 storeReadHandle:(id)a5 logCategory:(const char *)a6 identifier:(id)a7;
- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 storeReadHandle:(id)a5 logger:(id)a6 identifier:(id)a7;
- (NSString)description;
- (NSUUID)identifier;
- (id)upstreamTopicsForTopic:(id)a3;
- (void)cachedEventsForTopicFilters:(id)a3 cachedEventCollection:(id)a4;
- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5;
- (void)registerSubRouter:(id)a3;
- (void)unregisterConsumer:(id)a3 completion:(id)a4;
- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5;
- (void)unregisterConsumerSync:(id)a3 completion:(id)a4;
- (void)unregisterSubRouter:(id)a3;
@end

@implementation HMEDelegatingEventRouter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_subRouters, 0);
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)cachedEventsForTopicFilters:(id)a3 cachedEventCollection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      v10 = WeakRetained;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = objc_getProperty(self, v9, 40, 1);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v17 = objc_msgSend(v10, "delegatingRouter:filteredTopics:forRouter:", self, v6, v16, (void)v18);
            if ([v17 count])
            {
              [v7 willAddAdditionalEvents];
              [v16 cachedEventsForTopicFilters:v6 cachedEventCollection:v7];
              [v10 delegatingRouter:self fetchCachedEventsForTopics:v17 forRouter:v16 cachedEventCollection:v7];
              [v7 didFinishAddingAdditionalEvents];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
  }
}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [WeakRetained delegatingRouter:self upstreamTopicsFor:v4];

  return v6;
}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v35 = a4;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = objc_getProperty(self, v6, 40, 1);
      uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (!v7) {
        goto LABEL_18;
      }
      uint64_t v10 = v7;
      uint64_t v33 = *(void *)v43;
      *(void *)&long long v9 = 138412802;
      long long v31 = v9;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(objc_getProperty(self, v8, 32, 1), "allRegisteredTopicFilters");
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
          v38[3] = &unk_1E5955D28;
          id v39 = WeakRetained;
          v40 = self;
          v41 = v12;
          uint64_t v14 = +[HMETopicRouter forwardingTopicsForAdditions:v36 removals:v35 current:v13 indexProvider:v38];

          v15 = [v14 objectAtIndexedSubscript:0];
          if ([v15 count])
          {
          }
          else
          {
            v16 = [v14 objectAtIndexedSubscript:1];
            uint64_t v17 = [v16 count];

            if (!v17) {
              goto LABEL_16;
            }
          }
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            long long v19 = logger;
            long long v20 = [v14 objectAtIndexedSubscript:0];
            uint64_t v21 = [v20 count];
            v22 = [v14 objectAtIndexedSubscript:1];
            uint64_t v23 = [v22 count];
            *(_DWORD *)buf = v31;
            v47 = v12;
            __int16 v48 = 2048;
            uint64_t v49 = v21;
            __int16 v50 = 2048;
            uint64_t v51 = v23;
            _os_log_impl(&dword_19D557000, v19, OS_LOG_TYPE_DEFAULT, "Delegating registrations to subRouter: %@, topicFilterAdditions: %lu, topicFilterRemovals: %lu", buf, 0x20u);

            logger = self->_logger;
          }
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            v28 = logger;
            v29 = [v14 objectAtIndexedSubscript:0];
            v30 = [v14 objectAtIndexedSubscript:1];
            *(_DWORD *)buf = v31;
            v47 = v12;
            __int16 v48 = 2112;
            uint64_t v49 = (uint64_t)v29;
            __int16 v50 = 2112;
            uint64_t v51 = (uint64_t)v30;
            _os_log_debug_impl(&dword_19D557000, v28, OS_LOG_TYPE_DEBUG, "Delegating registrations to subRouter: %@, topicFilterAdditions: %@, topicFilterRemovals: %@", buf, 0x20u);
          }
          v24 = objc_msgSend(v14, "objectAtIndexedSubscript:", 0, v31);
          v25 = [v24 allObjects];
          v26 = [v14 objectAtIndexedSubscript:1];
          v27 = [v26 allObjects];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_12;
          v37[3] = &unk_1E5955CD8;
          v37[4] = self;
          v37[5] = v12;
          [v12 changeRegistrationsSyncForConsumer:self topicFilterAdditions:v25 topicFilterRemovals:v27 completion:v37];

LABEL_16:
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (!v10)
        {
LABEL_18:

          break;
        }
      }
    }
  }
}

id __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(void *a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [a2 allObjects];
  uint64_t v7 = [v4 delegatingRouter:v5 filteredTopics:v6 forRouter:a1[6]];
  v8 = [v3 setWithArray:v7];

  return v8;
}

void __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_12(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19D557000, v2, OS_LOG_TYPE_DEFAULT, "changed registrations on subRouter: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    Property = objc_getProperty(self, v10, 24, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Received cached event for topic %@, event: %@", buf, 0x16u);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = objc_msgSend(objc_getProperty(self, v14, 32, 1), "consumersForTopic:", v9, 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v20 didReceiveCachedEvent:v8 topic:v9 source:v11];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (self) {
    Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Received event for topic %@, event: %@", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = objc_msgSend(objc_getProperty(self, v11, 32, 1), "consumersForTopic:", v8, 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v17) {
          [v17 didReceiveEvent:v6 topic:v8];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)unregisterConsumerSync:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = (void (**)(id, void))a4;
  if (self) {
    Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Unregistering consumer: %@", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(objc_getProperty(self, v11, 32, 1), "unregisterConsumer:", v6);
  v8[2](v8, 0);
}

- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v14 = (void (**)(id, void *, void))a6;
  if (self) {
    Property = objc_getProperty(self, v13, 24, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = logger;
    int v23 = 138412802;
    id v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = [v11 count];
    __int16 v27 = 2048;
    uint64_t v28 = [v12 count];
    _os_log_impl(&dword_19D557000, v17, OS_LOG_TYPE_DEFAULT, "Delegating router changing registrations for consumer: %@, topicFilterAdditions: %ld, topicFilterRemovals: %ld", (uint8_t *)&v23, 0x20u);

    logger = self->_logger;
  }
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138412802;
    id v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = (uint64_t)v11;
    __int16 v27 = 2112;
    uint64_t v28 = (uint64_t)v12;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Delegating router changing registrations for consumer: %@, topicFilterAdditions: %@, topicFilterRemovals: %@", (uint8_t *)&v23, 0x20u);
  }
  objc_msgSend(objc_getProperty(self, v18, 32, 1), "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", v10, v11, v12);
  if (v14)
  {
    id v19 = v11;
    if (objc_getProperty(self, v20, 56, 1))
    {
      long long v22 = objc_msgSend(objc_getProperty(self, v21, 56, 1), "eventsForTopicFilters:", v19);
    }
    else
    {
      long long v22 = (void *)MEMORY[0x1E4F1CC08];
    }

    v14[2](v14, v22, 0);
  }
}

- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HMEDelegatingEventRouter_unregisterConsumer_topicFilters_completion___block_invoke;
  v10[3] = &unk_1E5955D00;
  id v11 = v8;
  id v9 = v8;
  [(HMEDelegatingEventRouter *)self changeRegistrationsForConsumer:a3 topicFilterAdditions:MEMORY[0x1E4F1CBF0] topicFilterRemovals:a4 completion:v10];
}

uint64_t __71__HMEDelegatingEventRouter_unregisterConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterConsumer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMEDelegatingEventRouter_unregisterConsumer_completion___block_invoke;
  block[3] = &unk_1E5956070;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(Property, block);
}

uint64_t __58__HMEDelegatingEventRouter_unregisterConsumer_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterConsumerSync:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v14 = a6;
  if (self) {
    Property = objc_getProperty(self, v13, 24, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__HMEDelegatingEventRouter_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
  block[3] = &unk_1E5956020;
  block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(Property, block);
}

uint64_t __111__HMEDelegatingEventRouter_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeRegistrationsSyncForConsumer:*(void *)(a1 + 40) topicFilterAdditions:*(void *)(a1 + 48) topicFilterRemovals:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)unregisterSubRouter:(id)a3
{
  id v5 = a3;
  if (self) {
    Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HMEDelegatingEventRouter_unregisterSubRouter___block_invoke;
  v8[3] = &unk_1E5955FD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

uint64_t __48__HMEDelegatingEventRouter_unregisterSubRouter___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40, 1);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  return [Property removeObject:v4];
}

- (void)registerSubRouter:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke;
  v8[3] = &unk_1E5955FD0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = *(id *)(a1 + 40);
    if (Property)
    {
      id Property = objc_getProperty(Property, a2, 40, 1);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    [Property addObject:v2];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v5 + 48));
      if (WeakRetained)
      {
        id v8 = WeakRetained;
        id v9 = *(id *)(a1 + 40);
        if (v9) {
          id v9 = objc_getProperty(v9, v7, 32, 1);
        }
        id v10 = [v9 allRegisteredTopicFilters];
        id v11 = [v10 allObjects];

        if ([v11 count])
        {
          id v12 = [v8 delegatingRouter:*(void *)(a1 + 40) filteredTopics:v11 forRouter:*(void *)(a1 + 32)];
          if ([v12 count])
          {
            uint64_t v13 = *(void *)(a1 + 40);
            id v14 = *(NSObject **)(v13 + 8);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              uint64_t v20 = v15;
              __int16 v21 = 2112;
              id v22 = v12;
              _os_log_impl(&dword_19D557000, v14, OS_LOG_TYPE_DEFAULT, "Subscribing to topics on subrouter register, router: %@, topics: %@", buf, 0x16u);
              uint64_t v13 = *(void *)(a1 + 40);
            }
            id v16 = *(void **)(a1 + 32);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke_5;
            v17[3] = &unk_1E5955CD8;
            v17[4] = v13;
            id v18 = v16;
            [v18 changeRegistrationsSyncForConsumer:v13 topicFilterAdditions:v12 topicFilterRemovals:MEMORY[0x1E4F1CBF0] completion:v17];
          }
        }
      }
    }
  }
}

void __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke_5(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19D557000, v2, OS_LOG_TYPE_DEFAULT, "Registered on subRouter: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v5 = [(HMEDelegatingEventRouter *)self identifier];
  if (self) {
    id Property = objc_getProperty(self, v4, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [v3 stringWithFormat:@"[<HMEDelegatingEventRouter %p> %@: subRouters: %@]", self, v5, Property];

  return (NSString *)v7;
}

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 storeReadHandle:(id)a5 logger:(id)a6 identifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMEDelegatingEventRouter;
  id v18 = [(HMEDelegatingEventRouter *)&v25 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeWeak((id *)&v19->_dataSource, v14);
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    subRouters = v19->_subRouters;
    v19->_subRouters = (NSMutableSet *)v20;

    objc_storeStrong((id *)&v19->_eventStoreReadHandle, a5);
    objc_storeStrong((id *)&v19->_logger, a6);
    id v22 = [[HMETopicRouter alloc] initWithDelegate:v19 logger:v16];
    topicRouter = v19->_topicRouter;
    v19->_topicRouter = v22;

    objc_storeStrong((id *)&v19->_identifier, a7);
  }

  return v19;
}

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 logger:(id)a5
{
  return [(HMEDelegatingEventRouter *)self initWithQueue:a3 dataSource:a4 storeReadHandle:0 logger:a5 identifier:0];
}

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 storeReadHandle:(id)a5 logCategory:(const char *)a6 identifier:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  os_log_t v16 = os_log_create("com.apple.HomeKitEventRouter", a6);
  id v17 = [(HMEDelegatingEventRouter *)self initWithQueue:v15 dataSource:v14 storeReadHandle:v13 logger:v16 identifier:v12];

  return v17;
}

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_log_t v8 = os_log_create("com.apple.HomeKitEventRouter", "Router.Delegating");
  id v9 = [(HMEDelegatingEventRouter *)self initWithQueue:v7 dataSource:v6 logger:v8];

  return v9;
}

@end