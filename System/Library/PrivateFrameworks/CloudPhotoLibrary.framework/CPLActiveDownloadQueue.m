@interface CPLActiveDownloadQueue
- (BOOL)isFIFOQueue;
- (BOOL)isHighPriority;
- (CPLActiveDownloadQueue)initWithName:(id)a3 type:(unint64_t)a4 FIFOQueue:(BOOL)a5 maximumBatchSize:(unint64_t)a6 maximumConcurrentTransportTasks:(unint64_t)a7 coalescingInterval:(int64_t)a8 groupConstructor:(id)a9;
- (NSArray)allTransferTasks;
- (NSString)name;
- (id)dequeueBatchOfTransferTasksDequeuedSize:(unint64_t *)a3;
- (id)dequeueLastTransportTask;
- (id)groupConstructor;
- (id)status;
- (int64_t)coalescingInterval;
- (unint64_t)countOfTransferTasks;
- (unint64_t)countOfTransferTasksInTransportTasks;
- (unint64_t)countOfTransportTasks;
- (unint64_t)maximumBatchSize;
- (unint64_t)maximumConcurrentTransportTasks;
- (unint64_t)type;
- (void)addTransferTask:(id)a3;
- (void)addTransportTask:(id)a3;
- (void)removeAllTransferTasks;
- (void)removeTransferTask:(id)a3;
- (void)removeTransportTask:(id)a3;
@end

@implementation CPLActiveDownloadQueue

- (void).cxx_destruct
{
  objc_storeStrong(&self->_groupConstructor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_transportTasks, 0);
  objc_storeStrong((id *)&self->_transferTasks, 0);
}

- (unint64_t)maximumConcurrentTransportTasks
{
  return self->_maximumConcurrentTransportTasks;
}

- (id)groupConstructor
{
  return self->_groupConstructor;
}

- (int64_t)coalescingInterval
{
  return self->_coalescingInterval;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (BOOL)isFIFOQueue
{
  return self->_FIFOQueue;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isHighPriority
{
  return self->_type - 1 < 2;
}

- (id)status
{
  uint64_t v3 = [(NSMutableArray *)self->_transferTasks count];
  uint64_t v4 = [(NSMutableArray *)self->_transportTasks count];
  unint64_t v5 = [(CPLActiveDownloadQueue *)self countOfTransferTasksInTransportTasks];
  if (v4)
  {
    [NSString stringWithFormat:@"%@ queued: %lu - transport: %lu for %lu resources", self->_name, v3, v4, v5];
    v6 = LABEL_5:;
    goto LABEL_6;
  }
  if (v3)
  {
    [NSString stringWithFormat:@"%@ queued: %lu", self->_name, v3, v8, v9];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:
  return v6;
}

- (id)dequeueLastTransportTask
{
  uint64_t v3 = [(NSMutableArray *)self->_transportTasks lastObject];
  if (v3) {
    [(NSMutableArray *)self->_transportTasks removeLastObject];
  }
  return v3;
}

- (unint64_t)countOfTransferTasksInTransportTasks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_transportTasks;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "downloadTasks", (void)v10);
        v5 += [v8 count];
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)countOfTransportTasks
{
  return [(NSMutableArray *)self->_transportTasks count];
}

- (void)removeTransportTask:(id)a3
{
}

- (void)addTransportTask:(id)a3
{
}

- (void)removeAllTransferTasks
{
}

- (NSArray)allTransferTasks
{
  return (NSArray *)self->_transferTasks;
}

- (id)dequeueBatchOfTransferTasksDequeuedSize:(unint64_t *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  transferTasks = self->_transferTasks;
  if (self->_FIFOQueue) {
    [(NSMutableArray *)transferTasks objectEnumerator];
  }
  else {
    [(NSMutableArray *)transferTasks reverseObjectEnumerator];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v27 = a3;
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v31;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v28 = v11;
      uint64_t v29 = v11 + v9;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        uint64_t v15 = [v14 cloudResource];
        unint64_t v16 = [v15 estimatedResourceSize];

        unint64_t maximumBatchSize = self->_maximumBatchSize;
        BOOL v18 = maximumBatchSize > v10;
        unint64_t v19 = maximumBatchSize - v10;
        BOOL v20 = v18 && v19 >= v16;
        if (!v20 && [v5 count])
        {
          uint64_t v21 = v28 + v13;
          goto LABEL_18;
        }
        [v5 addObject:v14];
        v10 += v16;
        ++v13;
      }
      while (v9 != v13);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v21 = v29;
      uint64_t v11 = v29;
      if (v9) {
        continue;
      }
      break;
    }
LABEL_18:

    if (v21)
    {
      if (v27) {
        unint64_t *v27 = v10;
      }
      BOOL FIFOQueue = self->_FIFOQueue;
      v23 = self->_transferTasks;
      if (FIFOQueue)
      {
        v24 = v23;
        uint64_t v25 = 0;
      }
      else
      {
        uint64_t v25 = [(NSMutableArray *)v23 count] - v21;
        v24 = v23;
      }
      -[NSMutableArray removeObjectsInRange:](v24, "removeObjectsInRange:", v25, v21);
    }
  }
  else
  {
  }
  return v5;
}

- (unint64_t)countOfTransferTasks
{
  return [(NSMutableArray *)self->_transferTasks count];
}

- (void)removeTransferTask:(id)a3
{
}

- (void)addTransferTask:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!self->_FIFOQueue && [v4 willGenerateReport])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_transferTasks;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "noteTaskHasBeenPreempted", (void)v11);
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  -[NSMutableArray addObject:](self->_transferTasks, "addObject:", v5, (void)v11);
}

- (CPLActiveDownloadQueue)initWithName:(id)a3 type:(unint64_t)a4 FIFOQueue:(BOOL)a5 maximumBatchSize:(unint64_t)a6 maximumConcurrentTransportTasks:(unint64_t)a7 coalescingInterval:(int64_t)a8 groupConstructor:(id)a9
{
  id v15 = a3;
  id v16 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CPLActiveDownloadQueue;
  v17 = [(CPLActiveDownloadQueue *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v15 copy];
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_BOOL FIFOQueue = a5;
    v17->_type = a4;
    v17->_unint64_t maximumBatchSize = a6;
    BOOL v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transferTasks = v17->_transferTasks;
    v17->_transferTasks = v20;

    v17->_maximumConcurrentTransportTasks = a7;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transportTasks = v17->_transportTasks;
    v17->_transportTasks = v22;

    v17->_coalescingInterval = a8;
    uint64_t v24 = MEMORY[0x1BA994060](v16);
    id groupConstructor = v17->_groupConstructor;
    v17->_id groupConstructor = (id)v24;
  }
  return v17;
}

@end