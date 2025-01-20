@interface CKDMMCSItemGroupSetContext
- (CKDMMCSItemGroupSet)itemGroupSet;
- (CKDMMCSItemGroupSetContext)initWithItemGroupSet:(id)a3 itemGroupSetCompletionBlock:(id)a4;
- (CKDOperation)operation;
- (NSMutableArray)itemGroupContexts;
- (OS_dispatch_group)itemGroupSetCompletionGroup;
- (id)itemGroupCompletionBlock;
- (id)itemGroupSetCompletionBlock;
- (int64_t)mmcsOperationType;
- (void)addItemGroupContext:(id)a3;
- (void)cancel;
- (void)setItemGroupCompletionBlock:(id)a3;
- (void)setItemGroupContexts:(id)a3;
- (void)setItemGroupSet:(id)a3;
- (void)setItemGroupSetCompletionBlock:(id)a3;
- (void)setItemGroupSetCompletionGroup:(id)a3;
- (void)setMmcsOperationType:(int64_t)a3;
- (void)setOperation:(id)a3;
- (void)start;
@end

@implementation CKDMMCSItemGroupSetContext

- (CKDMMCSItemGroupSetContext)initWithItemGroupSet:(id)a3 itemGroupSetCompletionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CKDMMCSItemGroupSetContext;
  v9 = [(CKDMMCSItemGroupSetContext *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemGroupSet, a3);
    uint64_t v11 = objc_opt_new();
    itemGroupContexts = v10->_itemGroupContexts;
    v10->_itemGroupContexts = (NSMutableArray *)v11;

    v13 = _Block_copy(v8);
    id itemGroupSetCompletionBlock = v10->_itemGroupSetCompletionBlock;
    v10->_id itemGroupSetCompletionBlock = v13;

    dispatch_group_t v15 = dispatch_group_create();
    itemGroupSetCompletionGroup = v10->_itemGroupSetCompletionGroup;
    v10->_itemGroupSetCompletionGroup = (OS_dispatch_group *)v15;

    objc_initWeak(&location, v10);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1C4D4E08C;
    v20[3] = &unk_1E64F05A0;
    objc_copyWeak(&v21, &location);
    v17 = _Block_copy(v20);
    id itemGroupCompletionBlock = v10->_itemGroupCompletionBlock;
    v10->_id itemGroupCompletionBlock = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)cancel
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend_itemGroupContexts(self, a2, v2, 0);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, v15, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_cancel(*(void **)(*((void *)&v11 + 1) + 8 * v10++), v6, v7);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }
}

- (void)addItemGroupContext:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_mmcsOperationType(self, v5, v6);
  objc_msgSend_setMmcsOperationType_(v4, v8, v7);
  objc_msgSend_itemGroupContexts(self, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v11, (uint64_t)v4);
}

- (void)start
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = objc_msgSend_itemGroupContexts(self, a2, v2);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v21, v25, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v4);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        long long v13 = objc_msgSend_itemGroupSetCompletionGroup(self, v7, v8);
        dispatch_group_enter(v13);

        objc_msgSend_start(v12, v14, v15);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v21, v25, 16);
    }
    while (v9);
  }

  v18 = objc_msgSend_itemGroupSetCompletionGroup(self, v16, v17);
  v19 = CKGetGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D4E3DC;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_group_notify(v18, v19, block);
}

- (CKDMMCSItemGroupSet)itemGroupSet
{
  return self->_itemGroupSet;
}

- (void)setItemGroupSet:(id)a3
{
}

- (CKDOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (CKDOperation *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (NSMutableArray)itemGroupContexts
{
  return self->_itemGroupContexts;
}

- (void)setItemGroupContexts:(id)a3
{
}

- (id)itemGroupCompletionBlock
{
  return self->_itemGroupCompletionBlock;
}

- (void)setItemGroupCompletionBlock:(id)a3
{
}

- (id)itemGroupSetCompletionBlock
{
  return self->_itemGroupSetCompletionBlock;
}

- (void)setItemGroupSetCompletionBlock:(id)a3
{
}

- (OS_dispatch_group)itemGroupSetCompletionGroup
{
  return self->_itemGroupSetCompletionGroup;
}

- (void)setItemGroupSetCompletionGroup:(id)a3
{
}

- (int64_t)mmcsOperationType
{
  return self->_mmcsOperationType;
}

- (void)setMmcsOperationType:(int64_t)a3
{
  self->_mmcsOperationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemGroupSetCompletionGroup, 0);
  objc_storeStrong(&self->_itemGroupSetCompletionBlock, 0);
  objc_storeStrong(&self->_itemGroupCompletionBlock, 0);
  objc_storeStrong((id *)&self->_itemGroupContexts, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_itemGroupSet, 0);
}

@end