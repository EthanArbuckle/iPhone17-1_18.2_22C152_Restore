@interface _BMBiomeXPCSchedulerInner
+ (id)streamIdentifierFromGraph:(id)a3;
- (BMAccessClient)accessClient;
- (BMComputeXPCPublisherClient)client;
- (BMComputeXPCPublisherStorage)bookmarkStorage;
- (BMComputeXPCSubscription)xpcSubscription;
- (BMDSL)graph;
- (BOOL)waking;
- (BPSSubscriber)downstream;
- (BPSSubscriptionStatus)status;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (_BMBiomeXPCSchedulerInner)initWithDownstream:(id)a3 identifier:(id)a4 graph:(id)a5 client:(id)a6 targetQueue:(id)a7 waking:(BOOL)a8;
- (int64_t)demand;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setAccessClient:(id)a3;
- (void)setBookmarkStorage:(id)a3;
- (void)setClient:(id)a3;
- (void)setDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setGraph:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStatus:(id)a3;
- (void)setWaking:(BOOL)a3;
- (void)setXpcSubscription:(id)a3;
- (void)switchToPublisherWithStreamIdentifier:(id)a3 storeEvent:(id)a4;
- (void)switchToUpdatedPublisher;
@end

@implementation _BMBiomeXPCSchedulerInner

- (_BMBiomeXPCSchedulerInner)initWithDownstream:(id)a3 identifier:(id)a4 graph:(id)a5 client:(id)a6 targetQueue:(id)a7 waking:(BOOL)a8
{
  id v27 = a3;
  id v26 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_BMBiomeXPCSchedulerInner;
  v18 = [(_BMBiomeXPCSchedulerInner *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_downstream, a3);
    objc_storeStrong((id *)&v19->_graph, a5);
    objc_storeStrong((id *)&v19->_client, a6);
    objc_storeStrong((id *)&v19->_identifier, a4);
    uint64_t v20 = +[BMComputeXPCPublisherStorage bookmarkStorageForCurrentProcess];
    bookmarkStorage = v19->_bookmarkStorage;
    v19->_bookmarkStorage = (BMComputeXPCPublisherStorage *)v20;

    objc_storeStrong((id *)&v19->_queue, a7);
    v19->_lock._os_unfair_lock_opaque = 0;
    v19->_waking = a8;
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F50238]) initWithState:0 subscription:0];
    status = v19->_status;
    v19->_status = (BPSSubscriptionStatus *)v22;

    bpsPublisher = v19->_bpsPublisher;
    v19->_bpsPublisher = 0;

    v19->_latestEventTime = 0.0;
  }

  return v19;
}

- (void)requestDemand:(int64_t)a3
{
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  v6 = [(_BMBiomeXPCSchedulerInner *)v4 downstream];
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = [(_BMBiomeXPCSchedulerInner *)v4 demand];
  if (v7 != *MEMORY[0x1E4F501C8]) {
    [(_BMBiomeXPCSchedulerInner *)v4 setDemand:[(_BMBiomeXPCSchedulerInner *)v4 demand] + a3];
  }
  if ([(_BMBiomeXPCSchedulerInner *)v4 demand]
    && ([(_BMBiomeXPCSchedulerInner *)v4 xpcSubscription],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    objc_initWeak(&location, v4);
    v9 = [(_BMBiomeXPCSchedulerInner *)v4 identifier];
    v10 = [(_BMBiomeXPCSchedulerInner *)v4 graph];
    os_unfair_lock_unlock(p_lock);
    v11 = [BMComputeXPCSubscription alloc];
    v12 = [MEMORY[0x1E4F4FB80] current];
    v13 = [v12 identifier];
    uint64_t v14 = [(_BMBiomeXPCSchedulerInner *)v4 waking];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke;
    v19[3] = &unk_1E55D8398;
    v19[4] = v4;
    objc_copyWeak(&v20, &location);
    id v15 = [(BMComputeXPCSubscription *)v11 initWithIdentifier:v9 client:v13 waking:v14 DSLGraph:v10 block:v19];

    os_unfair_lock_lock(p_lock);
    [(_BMBiomeXPCSchedulerInner *)v4 setXpcSubscription:v15];
    id v16 = [(_BMBiomeXPCSchedulerInner *)v4 client];
    id v17 = [MEMORY[0x1E4F4FB80] current];
    v18 = [v17 identifier];

    if (![(_BMBiomeXPCSchedulerInner *)v4 waking]) {
      [(BMComputeXPCPublisherStorage *)v4->_bookmarkStorage removeBookmarkFileForSubscriptionWithIdentifier:v9 client:v18];
    }
    os_unfair_lock_unlock(p_lock);
    [v16 subscribe:v15];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_6:
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)switchToPublisherWithStreamIdentifier:(id)a3 storeEvent:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(_BMBiomeXPCSchedulerInner *)self status];
  uint64_t v9 = [v8 state];

  if (v9 == 2)
  {
    [(_BMBiomeXPCSchedulerInner *)self setXpcSubscription:0];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_t lock = &self->_lock;
    v33 = self;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v10 = [(_BMBiomeXPCSchedulerInner *)self graph];
    v11 = [v10 streamPublishers];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v17 = [v16 identifier];
          int v18 = [v17 isEqualToString:v6];

          if (v18)
          {
            id v43 = v7;
            v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
            [v16 setBackingEvents:v19];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v13);
    }

    id v20 = [(_BMBiomeXPCSchedulerInner *)v33 graph];
    v21 = [v20 bpsPublisher];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v22 = [(_BMBiomeXPCSchedulerInner *)v33 graph];
    v23 = [v22 streamPublishers];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_super v28 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          v29 = [v28 identifier];
          int v30 = [v29 isEqualToString:v6];

          if (v30) {
            [v28 setBackingEvents:0];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v25);
    }

    bpsPublisher = v33->_bpsPublisher;
    v33->_bpsPublisher = 0;

    os_unfair_lock_unlock(lock);
    [v21 subscribe:v33];
  }
}

- (void)switchToUpdatedPublisher
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Failed to fetch bookmark for subscription %@. Error: %@");
}

- (void)cancel
{
  p_os_unfair_lock_t lock = &self->_lock;
  v10 = self;
  os_unfair_lock_lock(p_lock);
  v3 = [(_BMBiomeXPCSchedulerInner *)v10 client];
  v4 = [(_BMBiomeXPCSchedulerInner *)v10 xpcSubscription];
  v5 = [v4 identifier];

  id v6 = [MEMORY[0x1E4F4FB80] current];
  id v7 = [v6 identifier];

  [(BMComputeXPCPublisherStorage *)v10->_bookmarkStorage removeBookmarkFileForSubscriptionWithIdentifier:v5 client:v7];
  os_unfair_lock_unlock(p_lock);
  [v3 unsubscribeWithIdentifier:v5];
  os_unfair_lock_lock(p_lock);
  [(_BMBiomeXPCSchedulerInner *)v10 setClient:0];
  [(_BMBiomeXPCSchedulerInner *)v10 setXpcSubscription:0];
  [(_BMBiomeXPCSchedulerInner *)v10 setDownstream:0];
  v8 = [(_BMBiomeXPCSchedulerInner *)v10 status];
  [v8 setState:2];

  uint64_t v9 = [(_BMBiomeXPCSchedulerInner *)v10 status];
  [v9 setSubscription:0];

  os_unfair_lock_unlock(p_lock);
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v14 = self;
  p_os_unfair_lock_t lock = &v14->_lock;
  os_unfair_lock_lock(&v14->_lock);
  if (v14->_bpsPublisher
    && ([(_BMBiomeXPCSchedulerInner *)v14 status],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 subscription],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 conformsToProtocol:&unk_1EDDDD148],
        v5,
        v4,
        v6))
  {
    id v7 = [(_BMBiomeXPCSchedulerInner *)v14 status];
    v8 = [v7 subscription];

    uint64_t v9 = [(_BMBiomeXPCSchedulerInner *)v14 identifier];
    v10 = [(_BMBiomeXPCSchedulerInner *)v14 bookmarkStorage];
    os_unfair_lock_unlock(p_lock);
    v11 = (void *)[v8 newBookmark];
    uint64_t v12 = [MEMORY[0x1E4F4FB80] current];
    uint64_t v13 = [v12 identifier];
    [v10 writeBookmark:v11 forSubscriptionWithIdentifier:v9 client:v13];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (int64_t)receiveInput:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  p_os_unfair_lock_t lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  id v7 = [(_BMBiomeXPCSchedulerInner *)v5 status];
  uint64_t v8 = [v7 state];

  if (v8 == 2) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    [v9 timestamp];
    BOOL v11 = v10 >= v5->_latestEventTime;
    uint64_t v12 = __biome_log_for_category();
    uint64_t v13 = v12;
    if (!v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(_BMBiomeXPCSchedulerInner *)v9 receiveInput:v13];
      }

      os_unfair_lock_unlock(p_lock);
      goto LABEL_12;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(_BMBiomeXPCSchedulerInner *)v5 identifier];
      id v15 = NSNumber;
      [v9 timestamp];
      id v16 = objc_msgSend(v15, "numberWithDouble:");
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_18E67D000, v13, OS_LOG_TYPE_DEFAULT, "BMBiomeScheduler publishing event for %@ with timestamp %@", buf, 0x16u);
    }
    [v9 timestamp];
    v5->_latestEventTime = v17;
  }
  if ([(_BMBiomeXPCSchedulerInner *)v5 demand] < 1)
  {
LABEL_11:
    os_unfair_lock_unlock(p_lock);
LABEL_12:
    int64_t v19 = *MEMORY[0x1E4F501C0];
    goto LABEL_13;
  }
  [(_BMBiomeXPCSchedulerInner *)v5 setDemand:[(_BMBiomeXPCSchedulerInner *)v5 demand] - 1];
  int v18 = [(_BMBiomeXPCSchedulerInner *)v5 downstream];
  os_unfair_lock_unlock(p_lock);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int64_t v19 = *MEMORY[0x1E4F501C0];
  uint64_t v28 = *MEMORY[0x1E4F501C0];
  id v20 = [(_BMBiomeXPCSchedulerInner *)v5 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___BMBiomeXPCSchedulerInner_receiveInput___block_invoke;
  block[3] = &unk_1E55D68A0;
  uint64_t v26 = buf;
  id v21 = v18;
  id v24 = v21;
  id v25 = v4;
  dispatch_async(v20, block);

  os_unfair_lock_lock(p_lock);
  if (*(uint64_t *)(*(void *)&buf[8] + 24) >= 1) {
    [(_BMBiomeXPCSchedulerInner *)v5 setDemand:*(void *)(*(void *)&buf[8] + 24) + [(_BMBiomeXPCSchedulerInner *)v5 demand]];
  }
  os_unfair_lock_unlock(p_lock);

  _Block_object_dispose(buf, 8);
LABEL_13:

  return v19;
}

- (void)receiveSubscription:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(_BMBiomeXPCSchedulerInner *)self status];
  uint64_t v5 = [v4 state];

  if (v5 == 2)
  {
    os_unfair_lock_unlock(&self->_lock);
    [v9 cancel];
  }
  else
  {
    int v6 = [(_BMBiomeXPCSchedulerInner *)self status];
    [v6 setState:1];

    id v7 = [(_BMBiomeXPCSchedulerInner *)self status];
    [v7 setSubscription:v9];

    uint64_t v8 = [(_BMBiomeXPCSchedulerInner *)self demand];
    os_unfair_lock_unlock(&self->_lock);
    if (v8 >= 1) {
      objc_msgSend(v9, "requestDemand:", -[_BMBiomeXPCSchedulerInner demand](self, "demand"));
    }
  }
}

+ (id)streamIdentifierFromGraph:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if (![v5 count])
  {
LABEL_6:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  while (1)
  {
    int v6 = [v5 firstObject];
    if (v6) {
      break;
    }
LABEL_5:

    if (![v5 count]) {
      goto LABEL_6;
    }
  }
  [v5 removeObjectAtIndex:0];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v7 = [v6 upstreams];
    [v5 addObjectsFromArray:v7];

    goto LABEL_5;
  }
  uint64_t v8 = [v6 identifier];

LABEL_8:

  return v8;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (BMComputeXPCPublisherClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BMDSL)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
}

- (BMComputeXPCSubscription)xpcSubscription
{
  return self->_xpcSubscription;
}

- (void)setXpcSubscription:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)waking
{
  return self->_waking;
}

- (void)setWaking:(BOOL)a3
{
  self->_waking = a3;
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (BMAccessClient)accessClient
{
  return self->_accessClient;
}

- (void)setAccessClient:(id)a3
{
}

- (BMComputeXPCPublisherStorage)bookmarkStorage
{
  return self->_bookmarkStorage;
}

- (void)setBookmarkStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_xpcSubscription, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_downstream, 0);

  objc_storeStrong((id *)&self->_bpsPublisher, 0);
}

- (void)receiveInput:(NSObject *)a3 .cold.1(void *a1, double *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v6 = NSNumber;
  [a1 timestamp];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [NSNumber numberWithDouble:*a2];
  id v9 = [a1 eventBody];
  int v10 = 138412802;
  BOOL v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_error_impl(&dword_18E67D000, a3, OS_LOG_TYPE_ERROR, "BMBiomeScheduler skipping event with time %@ that is older than latest event time %@. event: %@", (uint8_t *)&v10, 0x20u);
}

@end