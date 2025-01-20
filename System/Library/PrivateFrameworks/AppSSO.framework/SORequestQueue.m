@interface SORequestQueue
+ (id)debugDescription;
+ (id)requestQueueWithIdentifier:(id)a3;
+ (void)removeQueueWithIdentifier:(id)a3;
- (SORequestQueue)initWithIdentifier:(id)a3;
- (id)description;
- (id)processItemBlock;
- (unint64_t)queueCount;
- (void)_itemCompleted;
- (void)_processItem:(id)a3;
- (void)enqueueRequest:(id)a3;
- (void)processNextRequest;
- (void)removeAllRequestsWithBlock:(id)a3;
- (void)removeRequestWithIdentifier:(id)a3 block:(id)a4;
- (void)setProcessItemBlock:(id)a3;
@end

@implementation SORequestQueue

+ (id)requestQueueWithIdentifier:(id)a3
{
  id v3 = a3;
  if (requestQueueWithIdentifier__onceToken != -1) {
    dispatch_once(&requestQueueWithIdentifier__onceToken, &__block_literal_global_3);
  }
  id v4 = (id)queues;
  objc_sync_enter(v4);
  v5 = [(id)queues objectForKeyedSubscript:v3];
  if (!v5)
  {
    v5 = [[SORequestQueue alloc] initWithIdentifier:v3];
    [(id)queues setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

uint64_t __45__SORequestQueue_requestQueueWithIdentifier___block_invoke()
{
  queues = [MEMORY[0x263EFF9A0] dictionary];
  return MEMORY[0x270F9A758]();
}

+ (id)debugDescription
{
  id v2 = (id)queues;
  objc_sync_enter(v2);
  id v3 = [(id)queues description];
  objc_sync_exit(v2);

  return v3;
}

- (SORequestQueue)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SORequestQueue;
  v5 = [(SORequestQueue *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    queue = v5->_queue;
    v5->_queue = (NSMutableArray *)v8;

    processingItem = v5->_processingItem;
    v5->_processingItem = 0;
  }
  return v5;
}

- (void)enqueueRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  [(NSMutableArray *)v5->_queue addObject:v4];
  uint64_t v6 = SO_LOG_SORequestQueue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    identifier = v5->_identifier;
    uint64_t v8 = [v4 requestParameters];
    v9 = [v8 identifier];
    int v10 = [(NSMutableArray *)v5->_queue count];
    int v11 = 138544386;
    objc_super v12 = identifier;
    __int16 v13 = 2048;
    id v14 = v4;
    __int16 v15 = 2114;
    id v16 = v4;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 1024;
    int v20 = v10;
    _os_log_debug_impl(&dword_2185C9000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: enqueueRequest: %p, %{public}@, %{public}@, queue count: %d", (uint8_t *)&v11, 0x30u);
  }
  if ([(NSMutableArray *)v5->_queue count] == 1) {
    [(SORequestQueue *)v5 _processItem:v4];
  }
  objc_sync_exit(v5);
}

- (void)processNextRequest
{
  OUTLINED_FUNCTION_0_3(a1, a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: processNextRequest: queue count: %d", v3, 0x12u);
}

- (void)removeAllRequestsWithBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  os_log_t v4 = (void (**)(id, SORequestQueue *, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = SO_LOG_SORequestQueue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(SORequestQueue *)(uint64_t)v5->_identifier removeAllRequestsWithBlock:(uint64_t)v30];
  }

  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = (void *)[(NSMutableArray *)v5->_queue copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      int v20 = v7;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          objc_super v12 = SO_LOG_SORequestQueue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            identifier = v5->_identifier;
            __int16 v15 = [v11 requestParameters];
            id v16 = [v15 identifier];
            *(_DWORD *)buf = 138543618;
            v26 = identifier;
            __int16 v27 = 2114;
            v28 = v16;
            _os_log_debug_impl(&dword_2185C9000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: checking %{public}@", buf, 0x16u);

            v7 = v20;
          }

          if (([v11 isRunning] & 1) == 0)
          {
            __int16 v13 = SO_LOG_SORequestQueue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              __int16 v17 = v5->_identifier;
              v18 = [v11 requestParameters];
              __int16 v19 = [v18 identifier];
              *(_DWORD *)buf = 138543618;
              v26 = v17;
              __int16 v27 = 2114;
              v28 = v19;
              _os_log_debug_impl(&dword_2185C9000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: removing %{public}@", buf, 0x16u);

              v7 = v20;
            }

            v4[2](v4, v5, v11);
            [(NSMutableArray *)v5->_queue removeObject:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }
  }
  objc_sync_exit(v5);
}

- (void)removeRequestWithIdentifier:(id)a3 block:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v26 = (void (**)(id, SORequestQueue *, void *))a4;
  v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = SO_LOG_SORequestQueue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SORequestQueue removeRequestWithIdentifier:block:]((uint64_t)v7, (uint64_t)v6, v8);
  }

  if (v26)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = (void *)[(NSMutableArray *)v7->_queue copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v28;
      id v25 = v6;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v9);
          }
          __int16 v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
          id v14 = SO_LOG_SORequestQueue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            identifier = v7->_identifier;
            int v20 = [v13 requestParameters];
            long long v21 = [v20 identifier];
            *(_DWORD *)buf = 138543618;
            v32 = identifier;
            __int16 v33 = 2114;
            v34 = v21;
            _os_log_debug_impl(&dword_2185C9000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: checking %{public}@", buf, 0x16u);

            id v6 = v25;
          }

          if (([v13 isRunning] & 1) == 0)
          {
            __int16 v15 = [v13 requestParameters];
            id v16 = [v15 identifier];
            int v17 = [v16 isEqualToString:v6];

            if (v17)
            {
              v18 = SO_LOG_SORequestQueue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                long long v22 = v7->_identifier;
                long long v23 = [v13 requestParameters];
                long long v24 = [v23 identifier];
                *(_DWORD *)buf = 138543618;
                v32 = v22;
                __int16 v33 = 2114;
                v34 = v24;
                _os_log_debug_impl(&dword_2185C9000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: removing %{public}@", buf, 0x16u);

                id v6 = v25;
              }

              v26[2](v26, v7, v13);
              [(NSMutableArray *)v7->_queue removeObject:v13];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v10);
    }
  }
  objc_sync_exit(v7);
}

- (unint64_t)queueCount
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(NSMutableArray *)v2->_queue count];
  objc_sync_exit(v2);

  return v3;
}

+ (void)removeQueueWithIdentifier:(id)a3
{
  id v4 = a3;
  id v3 = (id)queues;
  objc_sync_enter(v3);
  [(id)queues setObject:0 forKeyedSubscript:v4];
  objc_sync_exit(v3);
}

- (void)_processItem:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  v7 = SO_LOG_SORequestQueue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SORequestQueue _processItem:]();
  }

  objc_storeStrong((id *)&v6->_processingItem, a3);
  if (v6->_processItemBlock)
  {
    [v5 setIsRunning:1];
    (*((void (**)(void))v6->_processItemBlock + 2))();
  }
  objc_sync_exit(v6);
}

- (void)_itemCompleted
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_2185C9000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: itemCompleted: %p", v2, 0x16u);
}

- (id)description
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSMutableArray *)v2->_queue description];
  objc_sync_exit(v2);

  return v3;
}

- (id)processItemBlock
{
  return self->_processItemBlock;
}

- (void)setProcessItemBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processItemBlock, 0);
  objc_storeStrong((id *)&self->_processingItem, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)removeAllRequestsWithBlock:(uint64_t)a3 .cold.1(uint64_t a1, int a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_3(a1, a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: removeAllRequests: queue count: %d", v3, 0x12u);
}

- (void)removeRequestWithIdentifier:(NSObject *)a3 block:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 8);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_2185C9000, a2, a3, "%{public}@: removeRequestWithIdentifier: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_processItem:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_2185C9000, v0, v1, "%{public}@: processItem: %p");
}

@end