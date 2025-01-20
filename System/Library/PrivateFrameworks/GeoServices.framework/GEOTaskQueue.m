@interface GEOTaskQueue
- (BOOL)removeTaskIfPending:(id)a3;
- (GEOTaskQueue)init;
- (unint64_t)width;
- (void)_sendMoreRequestsIfPossible;
- (void)addTask:(id)a3;
- (void)setWidth:(unint64_t)a3;
- (void)taskFinished:(id)a3;
@end

@implementation GEOTaskQueue

- (GEOTaskQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTaskQueue;
  v2 = [(GEOTaskQueue *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

- (unint64_t)width
{
  v5 = self->_isolation;
  _geo_isolate_lock_data();
  unint64_t width = self->_width;
  _geo_isolate_unlock();

  return width;
}

- (void)setWidth:(unint64_t)a3
{
}

uint64_t __25__GEOTaskQueue_setWidth___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  return result;
}

- (void)_sendMoreRequestsIfPossible
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__47;
    v19 = __Block_byref_object_dispose__47;
    id v20 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __43__GEOTaskQueue__sendMoreRequestsIfPossible__block_invoke;
    v12 = &unk_1E53D7C00;
    uint64_t v13 = a1;
    v14 = &v15;
    geo_isolate_sync_data();
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    id v1 = (id)v16[5];
    uint64_t v2 = [v1 countByEnumeratingWithState:&v5 objects:v21 count:16];
    if (v2)
    {
      uint64_t v3 = *(void *)v6;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          objc_msgSend(*(id *)(*((void *)&v5 + 1) + 8 * v4++), "runTask", (void)v5);
        }
        while (v2 != v4);
        uint64_t v2 = [v1 countByEnumeratingWithState:&v5 objects:v21 count:16];
      }
      while (v2);
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (void)addTask:(id)a3
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  id v3 = a3;
  geo_isolate_sync_data();
  if (*((unsigned char *)v5 + 24)) {
    [v3 runTask];
  }

  _Block_object_dispose(&v4, 8);
}

uint64_t __24__GEOTaskQueue_addTask___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 16)) {
    BOOL v3 = (unint64_t)[*(id *)(v2 + 24) count] < *(void *)(a1[4] + 16);
  }
  else {
    BOOL v3 = 1;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v3;
  uint64_t v4 = a1[4];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    long long v5 = *(void **)(v4 + 24);
    if (v5) {
      goto LABEL_10;
    }
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v7 = a1[4];
    long long v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;
    uint64_t v9 = 24;
  }
  else
  {
    long long v5 = *(void **)(v4 + 32);
    if (v5) {
      goto LABEL_10;
    }
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = a1[4];
    long long v8 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v10;
    uint64_t v9 = 32;
  }

  long long v5 = *(void **)(a1[4] + v9);
LABEL_10:
  uint64_t v12 = a1[5];

  return [v5 addObject:v12];
}

- (BOOL)removeTaskIfPending:(id)a3
{
  id v4 = a3;
  uint64_t v7 = self->_isolation;
  _geo_isolate_lock_data();
  char v5 = [(NSMutableArray *)self->_pending containsObject:v4];
  [(NSMutableArray *)self->_pending removeObject:v4];
  _geo_isolate_unlock();

  return v5;
}

- (void)taskFinished:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = a3;
  geo_isolate_sync_data();
  if (*((unsigned char *)v6 + 24)) {
    -[GEOTaskQueue _sendMoreRequestsIfPossible]((uint64_t)self);
  }

  _Block_object_dispose(&v5, 8);
}

uint64_t __29__GEOTaskQueue_taskFinished___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 24) containsObject:a1[5]];
  [*(id *)(a1[4] + 24) removeObject:a1[5]];
  uint64_t v2 = a1[5];
  BOOL v3 = *(void **)(a1[4] + 32);

  return [v3 removeObject:v2];
}

unint64_t __43__GEOTaskQueue__sendMoreRequestsIfPossible__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (result < *(void *)(v3 + 16))
  {
    unint64_t result = [*(id *)(v3 + 32) count];
    if (result)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(v4 + 16);
      if (v5)
      {
        unint64_t v6 = v5 - [*(id *)(v4 + 24) count];
        unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        uint64_t v8 = *(void *)(a1 + 32);
        if (v6 >= v7)
        {
          uint64_t v10 = [*(id *)(v8 + 32) count];
        }
        else
        {
          uint64_t v9 = *(void *)(v8 + 16);
          uint64_t v10 = v9 - [*(id *)(v8 + 24) count];
        }
        uint64_t v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "subarrayWithRange:", 0, v10);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectsInRange:", 0, v10);
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v4 + 32));
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void **)(v11 + 32);
        *(void *)(v11 + 32) = 0;
      }
      v16 = *(void **)(*(void *)(a1 + 32) + 24);
      if (!v16)
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = *(void **)(v18 + 24);
        *(void *)(v18 + 24) = v17;

        v16 = *(void **)(*(void *)(a1 + 32) + 24);
      }
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      return [v16 addObjectsFromArray:v20];
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_inFlight, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

@end