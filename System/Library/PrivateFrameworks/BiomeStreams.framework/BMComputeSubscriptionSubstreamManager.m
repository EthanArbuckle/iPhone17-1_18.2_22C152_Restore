@interface BMComputeSubscriptionSubstreamManager
- (BMComputeSubscriptionSubstreamManager)initWithQueue:(id)a3;
- (BOOL)supportsStream:(id)a3;
- (double)timestamp;
- (id)_initWithDomain:(unint64_t)a3 queue:(id)a4 library:(id)a5;
- (id)_loadSubscriptionsFromSubscriptionsSubstreams;
- (id)_subscriptionSourceForStream:(id)a3;
- (void)_checkinTimeout;
- (void)_removeSubscriptionsPassingTest:(id)a3;
- (void)addSubscription:(id)a3;
- (void)initialCheckinsComplete;
- (void)removeSubscription:(id)a3;
@end

@implementation BMComputeSubscriptionSubstreamManager

- (BMComputeSubscriptionSubstreamManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = BiomeLibraryAndInternalLibraryNode();
  v6 = [(BMComputeSubscriptionSubstreamManager *)self _initWithDomain:0 queue:v4 library:v5];

  return v6;
}

- (id)_initWithDomain:(unint64_t)a3 queue:(id)a4 library:(id)a5
{
  v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2(v8);
  v17.receiver = self;
  v17.super_class = (Class)BMComputeSubscriptionSubstreamManager;
  v10 = [(BMComputeSubscriptionSubstreamManager *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    objc_storeStrong((id *)&v11->_library, a5);
    uint64_t v12 = objc_opt_new();
    checkins = v11->_checkins;
    v11->_checkins = (NSMutableDictionary *)v12;

    uint64_t v14 = [(BMComputeSubscriptionSubstreamManager *)v11 _loadSubscriptionsFromSubscriptionsSubstreams];
    subscriptions = v11->_subscriptions;
    v11->_subscriptions = (NSDictionary *)v14;
  }
  return v11;
}

- (id)_loadSubscriptionsFromSubscriptionsSubstreams
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v20 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(BMLibraryNode *)self->_library allStreams];
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    uint64_t v6 = *MEMORY[0x1E4F4FB08];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v9 = [v8 configuration];
        int v10 = [v9 enableSubscriptionSubstream];

        if (v10)
        {
          v11 = objc_opt_new();
          uint64_t v12 = [v8 subscriptionPublisherWithUseCase:v6 options:v11];
          v13 = +[BMPairedEventSession sessionPublisherWithStreamPublisher:v12 startingBlock:&__block_literal_global_12 sessionKeyBlock:&__block_literal_global_7 options:0];
          uint64_t v14 = objc_opt_new();
          v15 = [v8 identifier];
          [v20 setObject:v14 forKeyedSubscript:v15];

          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3;
          v22[3] = &unk_1E55D7720;
          id v23 = v14;
          id v16 = v14;
          id v17 = (id)[v13 sinkWithBookmark:0 completion:v22 receiveInput:&__block_literal_global_13];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }

  v18 = (void *)[v20 copy];

  return v18;
}

uint64_t __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 starting];

  return v3;
}

id __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_2(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 eventBody];
  uint64_t v4 = [v3 client];
  v9[0] = v4;
  uint64_t v5 = [v2 eventBody];

  uint64_t v6 = [v5 identifier];
  v9[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  return v7;
}

void __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 error];
  if (v6)
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = +[BMPairedEventSession openSessionsFromBookmark:](BMPairedEventSession, "openSessionsFromBookmark:", v5, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) startEvent];
          v13 = [v12 eventBody];

          uint64_t v14 = *(void **)(a1 + 32);
          v15 = [v13 uniqueIdentifier];
          [v14 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)supportsStream:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_subscriptions objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (double)timestamp
{
  dateOverride = self->_dateOverride;
  if (!dateOverride) {
    return CFAbsoluteTimeGetCurrent();
  }
  [(NSDate *)dateOverride timeIntervalSinceReferenceDate];
  return result;
}

- (void)addSubscription:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  checkins = self->_checkins;
  uint64_t v6 = [v4 uniqueIdentifier];
  id v27 = v4;
  [(NSMutableDictionary *)checkins setObject:v4 forKeyedSubscript:v6];

  LODWORD(v6) = self->_initialCheckinsComplete;
  v7 = __biome_log_for_category();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [v4 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl(&dword_18E67D000, v7, OS_LOG_TYPE_DEFAULT, "addSubscription: %@", buf, 0xCu);
    }
    v7 = -[BMComputeXPCSubscription startEvent](v4);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [v4 streamIdentifiers];
    uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if ([(BMComputeSubscriptionSubstreamManager *)self supportsStream:v14])
          {
            v15 = [(NSDictionary *)self->_subscriptions objectForKeyedSubscript:v14];
            long long v16 = [v27 uniqueIdentifier];
            long long v17 = [v15 objectForKeyedSubscript:v16];

            id v18 = v17;
            long long v19 = [v7 serialize];
            v20 = [v18 serialize];

            char v21 = [v19 isEqual:v20];
            if ((v21 & 1) == 0)
            {
              v22 = [(BMComputeSubscriptionSubstreamManager *)self _subscriptionSourceForStream:v14];
              [(BMComputeSubscriptionSubstreamManager *)self timestamp];
              objc_msgSend(v22, "sendEvent:timestamp:", v7);
              id v23 = [(NSDictionary *)self->_subscriptions objectForKeyedSubscript:v14];
              long long v24 = [v27 uniqueIdentifier];
              [v23 setObject:v7 forKeyedSubscript:v24];
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }
  }
  else if (v8)
  {
    long long v25 = [v4 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    v34 = v25;
    _os_log_impl(&dword_18E67D000, v7, OS_LOG_TYPE_DEFAULT, "addSubscription: %@ pending barrier", buf, 0xCu);
  }
}

- (void)removeSubscription:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 uniqueIdentifier];
  [(NSMutableDictionary *)self->_checkins setObject:0 forKeyedSubscript:v5];
  BOOL initialCheckinsComplete = self->_initialCheckinsComplete;
  __biome_log_for_category();
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT);
  if (initialCheckinsComplete)
  {
    if (v8)
    {
      uint64_t v9 = [v4 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      long long v28 = v9;
      _os_log_impl(&dword_18E67D000, &v7->super, OS_LOG_TYPE_DEFAULT, "removeSubscription: %@", buf, 0xCu);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v7 = self->_subscriptions;
    uint64_t v10 = [(NSDictionary *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v21 = v4;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v15 = [(NSDictionary *)self->_subscriptions objectForKeyedSubscript:v14];
          long long v16 = [v15 objectForKeyedSubscript:v5];

          if (v16)
          {
            long long v17 = -[BMSubscriptionEvent endEvent](v16);
            id v18 = [(BMComputeSubscriptionSubstreamManager *)self _subscriptionSourceForStream:v14];
            [(BMComputeSubscriptionSubstreamManager *)self timestamp];
            objc_msgSend(v18, "sendEvent:timestamp:", v17);
            long long v19 = [(NSDictionary *)self->_subscriptions objectForKeyedSubscript:v14];
            [v19 setObject:0 forKeyedSubscript:v5];
          }
        }
        uint64_t v11 = [(NSDictionary *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
      id v4 = v21;
    }
  }
  else if (v8)
  {
    v20 = [v4 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    long long v28 = v20;
    _os_log_impl(&dword_18E67D000, &v7->super, OS_LOG_TYPE_DEFAULT, "removeSubscription: %@ before barrier", buf, 0xCu);
  }
}

- (void)initialCheckinsComplete
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_initialCheckinsComplete
    || ([MEMORY[0x1E4F28B00] currentHandler],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [v18 handleFailureInMethod:a2 object:self file:@"BMComputeSubscriptionSubstreamManager.m" lineNumber:216 description:@"initialCheckinsComplete must only be called once"], v18, !self->_initialCheckinsComplete))
  {
    self->_BOOL initialCheckinsComplete = 1;
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    dateOverride = self->_dateOverride;
    self->_dateOverride = v4;

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke;
    v24[3] = &unk_1E55D7748;
    v24[4] = self;
    [(BMComputeSubscriptionSubstreamManager *)self _removeSubscriptionsPassingTest:v24];
    uint64_t v6 = self->_checkins;
    checkins = self->_checkins;
    self->_checkins = 0;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v8 = [(NSMutableDictionary *)v6 allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          [(BMComputeSubscriptionSubstreamManager *)self addSubscription:*(void *)(*((void *)&v20 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    v13 = self->_checkins;
    self->_checkins = v6;
    uint64_t v14 = v6;

    v15 = self->_dateOverride;
    self->_dateOverride = 0;

    dispatch_time_t v16 = dispatch_time(0, 15000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke_22;
    block[3] = &unk_1E55D6C48;
    block[4] = self;
    dispatch_after(v16, queue, block);
  }
}

uint64_t __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v5 = [v3 uniqueIdentifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  if (v6)
  {

LABEL_4:
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  v7 = [v3 bootUUID];
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F29128], "bm_bootSessionUUID");
  char v9 = [v7 isEqual:v8];

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v3 uniqueIdentifier];
    int v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_18E67D000, v12, OS_LOG_TYPE_DEFAULT, "Removing subscription from previous boot %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v10 = 1;
LABEL_5:

  return v10;
}

uint64_t __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkinTimeout];
}

- (void)_checkinTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_initialCheckinsComplete
    || ([MEMORY[0x1E4F28B00] currentHandler],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 handleFailureInMethod:a2 object:self file:@"BMComputeSubscriptionSubstreamManager.m" lineNumber:262 description:@"initialCheckinsComplete must be called before _checkinTimeout"], v5, self->_initialCheckinsComplete))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__BMComputeSubscriptionSubstreamManager__checkinTimeout__block_invoke;
    v6[3] = &unk_1E55D7748;
    v6[4] = self;
    [(BMComputeSubscriptionSubstreamManager *)self _removeSubscriptionsPassingTest:v6];
    checkins = self->_checkins;
    self->_checkins = 0;
  }
}

BOOL __56__BMComputeSubscriptionSubstreamManager__checkinTimeout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v5 = [v3 uniqueIdentifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [v3 uniqueIdentifier];
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_18E67D000, v7, OS_LOG_TYPE_DEFAULT, "Removing subscription that missed checkin %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6 == 0;
}

- (void)_removeSubscriptionsPassingTest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void *))a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = self->_subscriptions;
  uint64_t v20 = [(NSDictionary *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v5;
        uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * v5);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v23 = v6;
        v7 = -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:");
        BOOL v8 = [v7 allValues];

        id v22 = v8;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v22);
              }
              int v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              if (v4[2](v4, v14))
              {
                if (!v11)
                {
                  uint64_t v11 = [(BMComputeSubscriptionSubstreamManager *)self _subscriptionSourceForStream:v23];
                }
                v15 = -[BMSubscriptionEvent endEvent](v14);
                [(BMComputeSubscriptionSubstreamManager *)self timestamp];
                objc_msgSend(v11, "sendEvent:timestamp:", v15);
                uint64_t v16 = [(NSDictionary *)self->_subscriptions objectForKeyedSubscript:v23];
                long long v17 = [v14 uniqueIdentifier];
                [v16 setObject:0 forKeyedSubscript:v17];
              }
            }
            uint64_t v10 = [v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v11 = 0;
        }

        uint64_t v5 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [(NSDictionary *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }
}

- (id)_subscriptionSourceForStream:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BMComputeSubscriptionSubstreamManager *)self supportsStream:v4])
  {
    library = self->_library;
    id v11 = 0;
    uint64_t v6 = [(BMLibraryNode *)library streamWithIdentifier:v4 error:&v11];
    id v7 = v11;
    if (v7)
    {
      BOOL v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(BMComputeSubscriptionSubstreamManager *)(uint64_t)v4 _subscriptionSourceForStream:v8];
      }

      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [v6 subscriptionSource];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkins, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_dateOverride, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

void __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "Failed to compute open subscriptions %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_subscriptionSourceForStream:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "BMComputeSubscriptionSubstreamManager: could not find stream for streamIdentifier: %@, err: %@", (uint8_t *)&v3, 0x16u);
}

@end