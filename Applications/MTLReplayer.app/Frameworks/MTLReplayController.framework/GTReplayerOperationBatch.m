@interface GTReplayerOperationBatch
- (GTReplayerOperationBatch)initWithRequestID:(unint64_t)a3;
- (unint64_t)uuid;
- (void)addOperation:(id)a3;
- (void)finish:(id)a3;
- (void)flush:(id)a3;
@end

@implementation GTReplayerOperationBatch

- (void).cxx_destruct
{
}

- (unint64_t)uuid
{
  return self->_uuid;
}

- (void)finish:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_operations count])
  {
    v5 = [(NSMutableArray *)self->_operations lastObject];
    unint64_t uuid = self->_uuid;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __35__GTReplayerOperationBatch_finish___block_invoke;
    v16[3] = &__block_descriptor_40_e5_v8__0l;
    v16[4] = uuid;
    [v5 setCompletionBlock:v16];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = self->_operations;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [v4 addOperation:[v12 objectAtIndex:v11]];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }

    [(NSMutableArray *)self->_operations removeAllObjects];
  }
  else
  {
    GTCoreOperationControl_removeOperation(self->_uuid);
  }
}

uint64_t __35__GTReplayerOperationBatch_finish___block_invoke(uint64_t a1)
{
  return GTCoreOperationControl_removeOperation(*(void *)(a1 + 32));
}

- (void)flush:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_operations count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_operations;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addOperation:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) v10];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_operations removeAllObjects];
  }
}

- (void)addOperation:(id)a3
{
}

- (GTReplayerOperationBatch)initWithRequestID:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GTReplayerOperationBatch;
  id v4 = [(GTReplayerOperationBatch *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_unint64_t uuid = a3;
    id v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:16];
    operations = v5->_operations;
    v5->_operations = v6;

    GTCoreOperationControl_addOperation(a3);
  }
  return v5;
}

@end