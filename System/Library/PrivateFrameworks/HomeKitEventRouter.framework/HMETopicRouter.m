@interface HMETopicRouter
+ (id)forwardingTopicsForAdditions:(id)a3 removals:(id)a4 current:(id)a5 indexProvider:(id)a6;
- (HMETopicRouter)init;
- (HMETopicRouter)initWithDelegate:(id)a3;
- (HMETopicRouter)initWithDelegate:(id)a3 logCategory:(const char *)a4;
- (HMETopicRouter)initWithDelegate:(id)a3 logger:(id)a4;
- (HMETopicRouterDelegate)delegate;
- (NSMapTable)registrations;
- (NSMutableSet)registeredTopics;
- (id)allRegisteredTopicFilters;
- (id)consumersForTopic:(id)a3;
- (id)dumpStateDescription;
- (id)minimalSpanningTopicFilters;
- (id)topicsForConsumer:(id)a3;
- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5;
- (void)fetchCachedEventsForConsumer:(id)a3 topicFilters:(id)a4 cachedEventCollection:(id)a5;
- (void)registerConsumer:(id)a3 topicFilters:(id)a4;
- (void)unregisterConsumer:(id)a3;
- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4;
@end

@implementation HMETopicRouter

- (id)allRegisteredTopicFilters
{
  v2 = [(HMETopicRouter *)self registeredTopics];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSMutableSet)registeredTopics
{
  return self->_registeredTopics;
}

- (HMETopicRouter)initWithDelegate:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMETopicRouter;
  v8 = [(HMETopicRouter *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_logger, a4);
    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    registrations = v9->_registrations;
    v9->_registrations = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    registeredTopics = v9->_registeredTopics;
    v9->_registeredTopics = (NSMutableSet *)v12;

    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registeredTopics, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMETopicRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMETopicRouterDelegate *)WeakRetained;
}

- (NSMapTable)registrations
{
  return self->_registrations;
}

- (id)dumpStateDescription
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v2 = [(HMETopicRouter *)self registrations];
  v3 = (void *)[v2 copy];

  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v3;
    uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    v37 = v3;
    id v5 = 0;
    if (!v39) {
      goto LABEL_40;
    }
    uint64_t v38 = *(void *)v54;
    v42 = v4;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v54 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v6;
        id v7 = [obj objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * v6)];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v44 = v7;
        uint64_t v46 = [v7 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v46)
        {
          uint64_t v45 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v50 != v45) {
                objc_enumerationMutation(v44);
              }
              v9 = [*(id *)(*((void *)&v49 + 1) + 8 * i) componentsSeparatedByString:@"."];
              if ((unint64_t)[v9 count] < 5)
              {
LABEL_27:
                id v21 = 0;
                id v22 = 0;
                id v23 = 0;
                int v26 = 0;
                goto LABEL_30;
              }
              uint64_t v10 = [v9 objectAtIndexedSubscript:2];
              if ([v10 isEqualToString:@"settings"])
              {
                v11 = [v9 lastObject];
                int v12 = [v11 isEqualToString:@"updated"];

                if (!v12) {
                  goto LABEL_27;
                }
                id v43 = v5;
                id v13 = objc_alloc(MEMORY[0x1E4F29128]);
                v14 = [v9 objectAtIndexedSubscript:0];
                uint64_t v10 = (void *)[v13 initWithUUIDString:v14];

                id v15 = objc_alloc(MEMORY[0x1E4F29128]);
                v16 = [v9 objectAtIndexedSubscript:1];
                v17 = (void *)[v15 initWithUUIDString:v16];

                v18 = objc_msgSend(v9, "subarrayWithRange:", 3, objc_msgSend(v9, "count") - 4);
                uint64_t v19 = [v18 componentsJoinedByString:@"."];
                v20 = (void *)v19;
                id v21 = 0;
                id v22 = 0;
                id v23 = 0;
                if (v10) {
                  BOOL v24 = v17 == 0;
                }
                else {
                  BOOL v24 = 1;
                }
                BOOL v25 = v24 || v19 == 0;
                int v26 = !v25;
                if (!v25)
                {
                  id v21 = v10;
                  id v22 = v17;
                  id v23 = v20;
                }

                v4 = v42;
                id v5 = v43;
              }
              else
              {
                id v21 = 0;
                id v22 = 0;
                id v23 = 0;
                int v26 = 0;
              }

LABEL_30:
              id v27 = v21;
              id v28 = v22;
              id v29 = v23;
              if (v26)
              {
                if (!v5) {
                  id v5 = v27;
                }
                v30 = [v4 objectForKeyedSubscript:v28];

                if (!v30)
                {
                  v31 = [MEMORY[0x1E4F1CA48] array];
                  [v4 setObject:v31 forKeyedSubscript:v28];
                }
                v32 = [v4 objectForKeyedSubscript:v28];
                [v32 addObject:v29];
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v46);
        }

        uint64_t v6 = v41 + 1;
      }
      while (v41 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (!v39)
      {
LABEL_40:

        v33 = [MEMORY[0x1E4F28E78] stringWithString:@"{\n"];
        [v33 appendFormat:@"\t\t[(HM) uuid = %@]\n", v5];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __38__HMETopicRouter_dumpStateDescription__block_invoke;
        v47[3] = &unk_1E5955C88;
        id v48 = v33;
        id v34 = v33;
        [v4 enumerateKeysAndObjectsUsingBlock:v47];
        [v34 appendFormat:@"\t}\n"];
        v35 = [NSString stringWithFormat:@"[HMETopicRouter registrations: %@]", v34];

        v3 = v37;
        goto LABEL_42;
      }
    }
  }
  v35 = @"[HMETopicRouter registrations: {}]";
LABEL_42:

  return v35;
}

void __38__HMETopicRouter_dumpStateDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) appendFormat:@"\t\t\t[(AC) uuid = %@]\n", a2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) appendFormat:@"\t\t\t\t[(AS) keyPath = %@]\n", *(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)minimalSpanningTopicFilters
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unimplemented method" userInfo:0];
  objc_exception_throw(v2);
}

- (id)consumersForTopic:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v4 = [(HMETopicRouter *)self delegate];
  id v21 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(HMETopicRouter *)self registrations];
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      uint64_t v19 = v6;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x19F3A6E70]();
        long long v11 = [(HMETopicRouter *)self registrations];
        long long v12 = [v11 objectForKey:v9];

        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = v7;
          long long v14 = self;
          id v15 = [v4 upstreamTopicsForTopic:v22];
          uint64_t v16 = (void *)[v15 mutableCopy];

          [v16 intersectSet:v12];
          if ([v12 containsObject:v22])
          {
            self = v14;
            uint64_t v7 = v13;
            uint64_t v6 = v19;
LABEL_13:
            [v21 addObject:v9];
            goto LABEL_14;
          }
          if (v16)
          {
            self = v14;
            uint64_t v7 = v13;
            uint64_t v6 = v19;
            if (![v16 count]) {
              goto LABEL_14;
            }
            goto LABEL_13;
          }
          self = v14;
          uint64_t v7 = v13;
          uint64_t v6 = v19;
        }
        else
        {
          uint64_t v16 = 0;
          if ([v12 containsObject:v22]) {
            goto LABEL_13;
          }
        }
LABEL_14:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v6 = v17;
    }
    while (v17);
  }

  return v21;
}

- (void)unregisterConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMETopicRouter *)self registrations];
  uint64_t v6 = [v5 objectForKey:v4];
  id v8 = [v6 allObjects];

  uint64_t v7 = [(HMETopicRouter *)self registrations];
  [v7 removeObjectForKey:v4];

  [(HMETopicRouter *)self unregisterConsumer:v4 topicFilters:v8];
}

- (id)topicsForConsumer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(HMETopicRouter *)self registrations];
    uint64_t v6 = [v5 objectForKey:v4];

    uint64_t v7 = [v6 allObjects];
    id v8 = (void *)[v7 copy];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (void)fetchCachedEventsForConsumer:(id)a3 topicFilters:(id)a4 cachedEventCollection:(id)a5
{
  id v9 = a5;
  id v7 = a4;
  [v9 willAddAdditionalEvents];
  id v8 = [(HMETopicRouter *)self delegate];
  [v8 cachedEventsForTopicFilters:v7 cachedEventCollection:v9];

  [v9 didFinishAddingAdditionalEvents];
}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v48 = a5;
  long long v50 = [MEMORY[0x1E4F1CA80] set];
  v47 = [MEMORY[0x1E4F1CA80] set];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        id v15 = [(HMETopicRouter *)self registrations];
        uint64_t v16 = [v15 objectForKey:v8];

        if (!v16)
        {
          uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
          uint64_t v17 = [(HMETopicRouter *)self registrations];
          [v17 setObject:v16 forKey:v8];
        }
        [v16 addObject:v14];
        v18 = [(HMETopicRouter *)self registeredTopics];
        char v19 = [v18 containsObject:v14];

        if ((v19 & 1) == 0)
        {
          v20 = [(HMETopicRouter *)self registeredTopics];
          [v20 addObject:v14];

          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v67 = v14;
            _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Added topic filter %@", buf, 0xCu);
          }
          [v50 addObject:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v11);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v44 = v48;
  id v22 = v50;
  long long v23 = v47;
  uint64_t v49 = [v44 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v49)
  {
    uint64_t v46 = *(void *)v57;
    *(void *)&long long v24 = 138412290;
    long long v43 = v24;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v57 != v46) {
          objc_enumerationMutation(v44);
        }
        uint64_t v51 = v25;
        uint64_t v26 = *(void *)(*((void *)&v56 + 1) + 8 * v25);
        id v27 = [(HMETopicRouter *)self registrations];
        uint64_t v28 = [v27 objectForKey:v8];
        [v28 removeObject:v26];

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v29 = [(HMETopicRouter *)self registrations];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v53;
          while (2)
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v53 != v32) {
                objc_enumerationMutation(v29);
              }
              id v34 = *(id *)(*((void *)&v52 + 1) + 8 * j);
              if (v34 != v8)
              {
                v35 = [(HMETopicRouter *)self registrations];
                v36 = [v35 objectForKey:v34];
                char v37 = [v36 containsObject:v26];

                if (v37)
                {

                  id v22 = v50;
                  long long v23 = v47;
                  goto LABEL_32;
                }
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v52 objects:v64 count:16];
            if (v31) {
              continue;
            }
            break;
          }
        }

        uint64_t v38 = self->_logger;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v43;
          uint64_t v67 = v26;
          _os_log_debug_impl(&dword_19D557000, v38, OS_LOG_TYPE_DEBUG, "Removed topic filter %@", buf, 0xCu);
        }
        uint64_t v39 = [(HMETopicRouter *)self registeredTopics];
        [v39 removeObject:v26];

        long long v23 = v47;
        [v47 addObject:v26];
        id v22 = v50;
LABEL_32:
        uint64_t v25 = v51 + 1;
      }
      while (v51 + 1 != v49);
      uint64_t v49 = [v44 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v49);
  }

  if ([v22 count] || objc_msgSend(v23, "count"))
  {
    v40 = [(HMETopicRouter *)self delegate];
    uint64_t v41 = [v22 allObjects];
    v42 = [v23 allObjects];
    [v40 didChangeRegistrationsWithTopicFilterAdditions:v41 removals:v42];
  }
}

- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4
{
}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4
{
}

- (HMETopicRouter)initWithDelegate:(id)a3 logCategory:(const char *)a4
{
  id v6 = a3;
  os_log_t v7 = os_log_create("com.apple.HomeKitEventRouter", a4);
  id v8 = [(HMETopicRouter *)self initWithDelegate:v6 logger:v7];

  return v8;
}

- (HMETopicRouter)initWithDelegate:(id)a3
{
  return [(HMETopicRouter *)self initWithDelegate:a3 logCategory:"TopicRouter"];
}

- (HMETopicRouter)init
{
  return [(HMETopicRouter *)self initWithDelegate:0];
}

+ (id)forwardingTopicsForAdditions:(id)a3 removals:(id)a4 current:(id)a5 indexProvider:(id)a6
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *))a6;
  uint64_t v13 = (void *)MEMORY[0x19F3A6E70]();
  uint64_t v14 = (void *)[v11 mutableCopy];
  id v15 = (void *)[v14 mutableCopy];
  [v14 addObjectsFromArray:v10];
  uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v14 minusSet:v16];

  [v15 addObjectsFromArray:v9];
  uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  [v15 minusSet:v17];

  v18 = v12[2](v12, v15);
  char v19 = (void *)[v18 mutableCopy];

  v20 = v12[2](v12, v14);
  id v21 = (void *)[v20 mutableCopy];

  id v22 = (void *)[v19 mutableCopy];
  [v22 minusSet:v21];
  [v21 minusSet:v19];
  v25[0] = v22;
  v25[1] = v21;
  long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

  return v23;
}

@end