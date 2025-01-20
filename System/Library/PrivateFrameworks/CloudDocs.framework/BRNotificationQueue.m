@interface BRNotificationQueue
- (BRNotificationQueue)init;
- (id)description;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_filterIndex:(id)a3;
- (void)addDequeueCallback:(id)a3;
- (void)addNotification:(id)a3 asDead:(BOOL)a4;
- (void)dequeue:(unint64_t)a3 block:(id)a4;
- (void)processDequeueCallbacks;
- (void)removeAllObjects;
@end

@implementation BRNotificationQueue

- (BRNotificationQueue)init
{
  v10.receiver = self;
  v10.super_class = (Class)BRNotificationQueue;
  v2 = [(BRNotificationQueue *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:128];
    array = v2->_array;
    v2->_array = (NSMutableArray *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    callbacks = v2->_callbacks;
    v2->_callbacks = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:128];
    index = v2->_index;
    v2->_index = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p updates:%lld>", objc_opt_class(), self, -[NSMutableArray count](self->_array, "count")];
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_array count];
}

- (void)removeAllObjects
{
  uint64_t v3 = [(NSMutableArray *)self->_array count];
  index = self->_index;
  self->_dequeued += v3;
  [(NSMutableDictionary *)index removeAllObjects];
  array = self->_array;

  [(NSMutableArray *)array removeAllObjects];
}

- (void)addNotification:(id)a3 asDead:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 fileObjectID];
  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_index objectForKey:v7];
    if (v8)
    {
      v9 = v8;
      objc_super v10 = -[NSMutableArray objectAtIndex:](self->_array, "objectAtIndex:", [v8 unsignedIntegerValue] - self->_dequeued);
      if ([v10 canMerge:v6])
      {
        [v10 merge:v6];
        if (v4) {
          [v10 markDead];
        }
        goto LABEL_12;
      }

      if (!v4)
      {
LABEL_11:
        [(NSMutableArray *)self->_array addObject:v6];
        index = self->_index;
        v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_dequeued + -[NSMutableArray count](self->_array, "count") - 1);
        [(NSMutableDictionary *)index setObject:v15 forKey:v7];

        v9 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      objc_super v10 = 0;
      if (!v4) {
        goto LABEL_11;
      }
    }
    v13 = (void *)[v6 copy];

    [v13 markDead];
    id v6 = v13;
    goto LABEL_11;
  }
  v11 = brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addNotification:asDead:]", 63);
  v12 = brc_default_log(0);
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
    -[BRNotificationQueue addNotification:asDead:]((uint64_t)v6, (uint64_t)v11, v12);
  }

LABEL_13:
}

- (void)processDequeueCallbacks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_dequeuedNotificationCount = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_callbacks;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6 + v5;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if (!(*(unsigned int (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v8)))
        {
          uint64_t v9 = v6 + v8;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
LABEL_11:

    if (v9) {
      -[NSMutableArray removeObjectsInRange:](self->_callbacks, "removeObjectsInRange:", 0, v9, (void)v10);
    }
  }
  else
  {
  }
}

- (void)addDequeueCallback:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  if ([(NSMutableArray *)self->_array count] || self->_dequeuedNotificationCount)
  {
    unint64_t dequeued = self->_dequeued;
    uint64_t v6 = [(NSMutableArray *)self->_array count];
    objc_initWeak(&location, self);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __42__BRNotificationQueue_addDequeueCallback___block_invoke;
    v18 = &unk_1E59AFA38;
    v20[1] = (id)(v6 + dequeued);
    objc_copyWeak(v20, &location);
    v19 = v4;
    uint64_t v7 = (void *)MEMORY[0x19F3C48D0](&v15);
    uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addDequeueCallback:]", 122);
    uint64_t v9 = brc_default_log(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v23 = v7;
      __int16 v24 = 2112;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Delaying callback %p in %@%@", buf, 0x20u);
    }

    callbacks = self->_callbacks;
    long long v11 = (void *)MEMORY[0x19F3C48D0](v7);
    -[NSMutableArray addObject:](callbacks, "addObject:", v11, v15, v16, v17, v18);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v12 = brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addDequeueCallback:]", 125);
    long long v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)MEMORY[0x19F3C48D0](v4);
      *(_DWORD *)buf = 134218498;
      v23 = v14;
      __int16 v24 = 2112;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v12;
      _os_log_debug_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Firing callback %p right away in %@%@", buf, 0x20u);
    }
    v4[2](v4);
  }
}

BOOL __42__BRNotificationQueue_addDequeueCallback___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 <= a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addDequeueCallback:]_block_invoke", 116);
    uint64_t v7 = brc_default_log(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = (void *)MEMORY[0x19F3C48D0](*(void *)(a1 + 32));
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 134219010;
      long long v12 = v9;
      __int16 v13 = 2112;
      id v14 = WeakRetained;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      unint64_t v18 = a2;
      __int16 v19 = 2112;
      v20 = v6;
      _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Firing delayed callback %p in %@ (%lu vs %lu)%@", (uint8_t *)&v11, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return v3 <= a2;
}

- (void)_filterIndex:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_array count];
  if ([v4 count] >= v5)
  {
    [(NSMutableDictionary *)self->_index removeAllObjects];
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v16 = [(NSMutableArray *)self->_array objectAtIndex:i];
        index = self->_index;
        unint64_t v18 = [NSNumber numberWithUnsignedInteger:i + self->_dequeued];
        __int16 v19 = [v16 fileObjectID];
        [(NSMutableDictionary *)index setObject:v18 forKey:v19];
      }
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v10), "fileObjectID", (void)v20);
          if (v11)
          {
            long long v12 = [(NSMutableDictionary *)self->_index objectForKey:v11];
            unint64_t v13 = [v12 unsignedIntegerValue];
            unint64_t dequeued = self->_dequeued;

            if (v13 < dequeued) {
              [(NSMutableDictionary *)self->_index removeObjectForKey:v11];
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
}

- (void)dequeue:(unint64_t)a3 block:(id)a4
{
  int v11 = (void (**)(id, NSMutableArray *))a4;
  unint64_t v6 = [(NSMutableArray *)self->_array count];
  if (v6)
  {
    if (v6 <= a3)
    {
      self->_dequeued += v6;
      uint64_t v8 = self->_array;
      uint64_t v9 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:128];
      array = self->_array;
      self->_array = v9;
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x19F3C4670]();
      self->_dequeued += a3;
      -[NSMutableArray subarrayWithRange:](self->_array, "subarrayWithRange:", 0, a3);
      uint64_t v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](self->_array, "removeObjectsInRange:", 0, a3);
    }
    [(BRNotificationQueue *)self _filterIndex:v8];
    self->_dequeuedNotificationCount += [(NSMutableArray *)v8 count];
    v11[2](v11, v8);
  }
  else
  {
    v11[2](v11, 0);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_array countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);

  objc_storeStrong((id *)&self->_array, 0);
}

- (void)addNotification:(os_log_t)log asDead:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] No object id for update %@%@", (uint8_t *)&v3, 0x16u);
}

@end