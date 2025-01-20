@interface BMBiomeScheduler
- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4;
- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 client:(id)a5;
- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 client:(id)a5 waking:(BOOL)a6;
- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 waking:(BOOL)a5;
- (BMBookmarkablePublisher)bpsPublisher;
- (BMComputeXPCPublisherClient)client;
- (BMDSL)graph;
- (BOOL)waking;
- (NSString)identifier;
- (NSString)subscriptionIdentifier;
- (OS_dispatch_queue)queue;
- (id)_publisherWithStreamIdentifier:(id)a3 storeEvent:(id)a4;
- (id)_updatedPublisherForSubscription:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_persistBookmarkForPublisher:(id)a3;
- (void)cancel;
- (void)setBpsPublisher:(id)a3;
- (void)setGraph:(id)a3;
- (void)setSubscriptionIdentifier:(id)a3;
- (void)subscribeWithDSLGraph:(id)a3 forSubscriber:(id)a4;
- (void)subscribeWithDSLGraph:(id)a3 publisherBlock:(id)a4;
@end

@implementation BMBiomeScheduler

void __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_162(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  id v2 = [*(id *)(a1 + 32) _updatedPublisherForSubscription:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(a1 + 32) _persistBookmarkForPublisher:v2];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
}

- (void)_persistBookmarkForPublisher:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4 && [v4 conformsToProtocol:&unk_1EDDDD510])
  {
    v5 = [v4 bookmarkNode];
    bookmarkStorage = self->_bookmarkStorage;
    v7 = [(BMBiomeScheduler *)self identifier];
    v8 = [MEMORY[0x1E4F4FB80] current];
    v9 = [v8 identifier];
    [(BMComputeXPCPublisherStorage *)bookmarkStorage writeBookmark:v5 forSubscriptionWithIdentifier:v7 client:v9];

    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BMBiomeScheduler _persistBookmarkForPublisher:](self, v10);
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

void __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = __biome_log_for_category();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8 && v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412802;
        id v26 = v7;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v8;
        _os_log_impl(&dword_18E67D000, v11, OS_LOG_TYPE_INFO, "BMBiomeScheduler received callback from subscription %@, publishing event %@ for stream %@", buf, 0x20u);
      }

      v13 = [WeakRetained queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_161;
      block[3] = &unk_1E55D83C0;
      block[4] = WeakRetained;
      v14 = &v21;
      id v21 = v7;
      v15 = &v22;
      id v22 = v9;
      v23 = v8;
      id v24 = *(id *)(a1 + 32);
      dispatch_async(v13, block);

      v16 = v23;
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v7;
        _os_log_impl(&dword_18E67D000, v11, OS_LOG_TYPE_INFO, "BMBiomeScheduler received callback from subscription %@, reading bookmark and subscribing to DSL graph publisher", buf, 0xCu);
      }

      v16 = [WeakRetained queue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_162;
      v17[3] = &unk_1E55D83E8;
      v17[4] = WeakRetained;
      v14 = &v18;
      id v18 = v7;
      v15 = &v19;
      id v19 = *(id *)(a1 + 32);
      dispatch_async(v16, v17);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_updatedPublisherForSubscription:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = [(BMBiomeScheduler *)self bpsPublisher];

  if (!v5)
  {
    v6 = [(BMBiomeScheduler *)self graph];
    id v7 = [v6 bpsPublisher];

    bookmarkStorage = self->_bookmarkStorage;
    id v28 = 0;
    id v9 = [v4 fetchBookmarkFromStorage:bookmarkStorage error:&v28];
    id v10 = v28;
    id v11 = v10;
    if (v9 && !v10)
    {
      BOOL v12 = [v7 validateBookmarkNode:v9];
      if (v12)
      {
        v13 = [MEMORY[0x1E4F4FB80] current];
        v14 = [v13 identifier];

        v15 = self->_bookmarkStorage;
        v16 = [v4 identifier];
        [(BMComputeXPCPublisherStorage *)v15 removeBookmarkFileForSubscriptionWithIdentifier:v16 client:v14];

        v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[BMBiomeScheduler _updatedPublisherForSubscription:].cold.6();
        }

        id v18 = self->_bookmarkStorage;
        id v27 = 0;
        uint64_t v19 = [v4 fetchBookmarkFromStorage:v18 error:&v27];
        id v11 = v27;

        id v9 = (void *)v19;
      }
      else
      {
        id v11 = 0;
      }
    }
    if (v11)
    {
      v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_BMBiomeXPCSchedulerInner switchToUpdatedPublisher]();
      }
    }
    id v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[_BMBiomeXPCSchedulerInner switchToUpdatedPublisher]();
    }

    [v7 applyBookmarkNode:v9];
    id v22 = [v7 startWithSubscriber:0];
    if (v22)
    {
      v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[BMBiomeScheduler _updatedPublisherForSubscription:]();
      }
    }
    else
    {
      [(BMBiomeScheduler *)self setBpsPublisher:v7];
      v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[BMBiomeScheduler _updatedPublisherForSubscription:](v23);
      }
    }
  }
  id v24 = __biome_log_for_category();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[BMBiomeScheduler _updatedPublisherForSubscription:](v24);
  }

  v25 = [(BMBiomeScheduler *)self bpsPublisher];

  return v25;
}

- (BMBookmarkablePublisher)bpsPublisher
{
  return self->_bpsPublisher;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BMComputeXPCPublisherClient shared];
  id v9 = [(BMBiomeScheduler *)self initWithIdentifier:v7 targetQueue:v6 client:v8];

  return v9;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 client:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F4FB80] current];
  uint64_t v11 = [v10 isManagedByLaunchd];

  BOOL v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 bundleURL];
  v25[0] = *MEMORY[0x1E4F1C618];
  uint64_t v14 = v25[0];
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v24 = 0;
  v16 = [v13 resourceValuesForKeys:v15 error:&v24];
  id v17 = v24;

  id v18 = [v16 objectForKeyedSubscript:v14];
  uint64_t v19 = v18;
  if (v17)
  {
    v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[BMBiomeScheduler initWithIdentifier:targetQueue:client:]();
    }
    goto LABEL_6;
  }
  if ([v18 BOOLValue])
  {
    v20 = [v12 bundleIdentifier];
    uint64_t v11 = [v20 isEqualToString:@"com.apple.springboard"];
LABEL_6:
  }
  id v21 = -[BMBiomeScheduler initWithIdentifier:targetQueue:client:waking:](self, "initWithIdentifier:targetQueue:client:waking:", v7, v8, v9, v11, self);

  return v21;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 client:(id)a5 waking:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMBiomeScheduler;
  v13 = [(BMBiomeScheduler *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_queue, a4);
    objc_storeStrong((id *)&v13->_client, a5);
    v13->_waking = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 waking:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[BMComputeXPCPublisherClient shared];
  id v11 = [(BMBiomeScheduler *)self initWithIdentifier:v9 targetQueue:v8 client:v10 waking:v5];

  return v11;
}

- (void)subscribeWithDSLGraph:(id)a3 forSubscriber:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 streamPublishers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = (_BMBiomeXPCSchedulerInner *)(id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [(_BMBiomeXPCSchedulerInner *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "streamType", (void)v19) != 1 && objc_msgSend(v13, "streamType") != 2)
        {
          id v18 = v8;
          goto LABEL_14;
        }
      }
      uint64_t v10 = [(_BMBiomeXPCSchedulerInner *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = [_BMBiomeXPCSchedulerInner alloc];
  v15 = [(BMBiomeScheduler *)self identifier];
  v16 = [(BMBiomeScheduler *)self client];
  objc_super v17 = [(BMBiomeScheduler *)self queue];
  id v18 = [(_BMBiomeXPCSchedulerInner *)v14 initWithDownstream:v7 identifier:v15 graph:v6 client:v16 targetQueue:v17 waking:[(BMBiomeScheduler *)self waking]];

  if (self->_bookmarkStorage) {
    -[_BMBiomeXPCSchedulerInner setBookmarkStorage:](v18, "setBookmarkStorage:");
  }
  objc_msgSend(v7, "receiveSubscription:", v18, (void)v19);
LABEL_14:
}

- (void)subscribeWithDSLGraph:(id)a3 publisherBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 streamPublishers];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v13 streamType] != 1 && objc_msgSend(v13, "streamType") != 2)
        {
          id v26 = __biome_log_for_category();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[BMBiomeScheduler subscribeWithDSLGraph:publisherBlock:](v13, v26);
          }

          goto LABEL_18;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke;
  aBlock[3] = &unk_1E55D8410;
  objc_copyWeak(&v29, &location);
  id v28 = v8;
  uint64_t v14 = _Block_copy(aBlock);
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_graph, a3);
  if (!self->_bookmarkStorage)
  {
    v15 = +[BMComputeXPCPublisherStorage bookmarkStorageForCurrentProcess];
    bookmarkStorage = self->_bookmarkStorage;
    self->_bookmarkStorage = v15;
  }
  objc_super v17 = [MEMORY[0x1E4F4FB80] current];
  id v18 = [v17 identifier];

  if (![(BMBiomeScheduler *)self waking])
  {
    long long v19 = self->_bookmarkStorage;
    long long v20 = [(BMBiomeScheduler *)self identifier];
    [(BMComputeXPCPublisherStorage *)v19 removeBookmarkFileForSubscriptionWithIdentifier:v20 client:v18];
  }
  long long v21 = [BMComputeXPCSubscription alloc];
  long long v22 = [(BMBiomeScheduler *)self identifier];
  v23 = [(BMComputeXPCSubscription *)v21 initWithIdentifier:v22 client:v18 waking:[(BMBiomeScheduler *)self waking] DSLGraph:v7 block:v14];

  uint64_t v24 = [(BMComputeXPCSubscription *)v23 identifier];
  [(BMBiomeScheduler *)self setSubscriptionIdentifier:v24];

  os_unfair_lock_unlock(&self->_lock);
  v25 = [(BMBiomeScheduler *)self client];
  [v25 subscribe:v23];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
LABEL_18:
}

void __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_161(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  [*(id *)(a1 + 48) timestamp];
  v3 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  [*(id *)(a1 + 40) setInitialBookmarkTimestamp:v3];

  id v5 = [*(id *)(a1 + 32) _publisherWithStreamIdentifier:*(void *)(a1 + 56) storeEvent:*(void *)(a1 + 48)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  id v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v4 = v5;
  }
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BMBiomeScheduler *)self subscriptionIdentifier];
  id v5 = [(BMBiomeScheduler *)self bpsPublisher];
  [(BMBiomeScheduler *)self setSubscriptionIdentifier:0];
  [(BMBiomeScheduler *)self setBpsPublisher:0];
  id v6 = [MEMORY[0x1E4F4FB80] current];
  id v7 = [v6 identifier];

  [(BMComputeXPCPublisherStorage *)self->_bookmarkStorage removeBookmarkFileForSubscriptionWithIdentifier:v4 client:v7];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v8 = [(BMBiomeScheduler *)self client];
    [v8 unsubscribeWithIdentifier:v4];
  }
  if (v5) {
    [v5 reset];
  }
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_18E67D000, v9, OS_LOG_TYPE_DEFAULT, "BMBiomeScheduler client invoked cancel, unsubscribing", v10, 2u);
  }
}

- (id)_publisherWithStreamIdentifier:(id)a3 storeEvent:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = self;
  id v8 = [(BMBiomeScheduler *)self graph];
  id v9 = [v8 streamPublishers];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v15 = [v14 identifier];
        int v16 = [v15 isEqualToString:v6];

        if (v16)
        {
          id v40 = v7;
          objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
          [v14 setBackingEvents:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v11);
  }

  id v18 = [(BMBiomeScheduler *)v30 graph];
  long long v19 = [v18 bpsPublisher];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v20 = [(BMBiomeScheduler *)v30 graph];
  long long v21 = [v20 streamPublishers];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        id v27 = [v26 identifier];
        int v28 = [v27 isEqualToString:v6];

        if (v28) {
          [v26 setBackingEvents:0];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);
  }

  return v19;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BMComputeXPCPublisherClient)client
{
  return self->_client;
}

- (BOOL)waking
{
  return self->_waking;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (void)setSubscriptionIdentifier:(id)a3
{
}

- (void)setBpsPublisher:(id)a3
{
}

- (BMDSL)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_bpsPublisher, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
}

- (void)initWithIdentifier:targetQueue:client:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Error checking whether process is an application: %@", v2, v3, v4, v5, v6);
}

- (void)subscribeWithDSLGraph:(void *)a1 publisherBlock:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMBiomeScheduler cannot subscribe to BMDSLStreamPublisher %@ because it is the incorrect streamType", v4, 0xCu);
}

- (void)_updatedPublisherForSubscription:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "BMBiomeScheduler using cached publisher", v1, 2u);
}

- (void)_updatedPublisherForSubscription:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "BMBiomeScheduler created and cached new publisher w/ bookmark", v1, 2u);
}

- (void)_updatedPublisherForSubscription:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMBiomeScheduler could not create new publisher w/ err: %@", v2, v3, v4, v5, v6);
}

- (void)_updatedPublisherForSubscription:.cold.6()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Client bookmark failed validation for subscription %@, removing old bookmark and creating new one", v2, v3, v4, v5, v6);
}

- (void)_persistBookmarkForPublisher:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  uint64_t v4 = [MEMORY[0x1E4F4FB80] current];
  uint64_t v5 = [v4 identifier];
  int v6 = 138412546;
  id v7 = v3;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "BMBiomeScheduler persisted new bookmark for identifier: %@, client: %@", (uint8_t *)&v6, 0x16u);
}

@end