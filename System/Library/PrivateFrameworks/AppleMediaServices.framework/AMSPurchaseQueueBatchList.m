@interface AMSPurchaseQueueBatchList
- (AMSPurchaseQueueBatchList)init;
- (AMSThreadSafeObject)backingArray;
- (id)batchForPurchase:(id)a3;
- (id)nextPurchase;
- (unint64_t)count;
- (void)appendBatch:(id)a3;
- (void)popBatch:(id)a3;
- (void)setBackingArray:(id)a3;
@end

@implementation AMSPurchaseQueueBatchList

- (AMSPurchaseQueueBatchList)init
{
  v8.receiver = self;
  v8.super_class = (Class)AMSPurchaseQueueBatchList;
  v2 = [(AMSPurchaseQueueBatchList *)&v8 init];
  if (v2)
  {
    v3 = [AMSThreadSafeObject alloc];
    v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [(AMSThreadSafeObject *)v3 initWithObject:v4];
    backingArray = v2->_backingArray;
    v2->_backingArray = (AMSThreadSafeObject *)v5;
  }
  return v2;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(AMSPurchaseQueueBatchList *)self backingArray];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AMSPurchaseQueueBatchList_count__block_invoke;
  v5[3] = &unk_1E55A5BC0;
  v5[4] = &v6;
  [v2 read:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AMSPurchaseQueueBatchList_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)appendBatch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSPurchaseQueueBatchList *)self backingArray];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AMSPurchaseQueueBatchList_appendBatch___block_invoke;
  v7[3] = &unk_1E55A5BE8;
  id v8 = v4;
  id v6 = v4;
  [v5 readWrite:v7];
}

id __41__AMSPurchaseQueueBatchList_appendBatch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 addObject:v2];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (id)nextPurchase
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__59;
  v10 = __Block_byref_object_dispose__59;
  id v11 = 0;
  uint64_t v2 = [(AMSPurchaseQueueBatchList *)self backingArray];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AMSPurchaseQueueBatchList_nextPurchase__block_invoke;
  v5[3] = &unk_1E55A5BC0;
  v5[4] = &v6;
  [v2 read:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__AMSPurchaseQueueBatchList_nextPurchase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "nextPurchase", (void)v11);
        if (v8)
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
          v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)batchForPurchase:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__59;
  uint64_t v16 = __Block_byref_object_dispose__59;
  id v17 = 0;
  uint64_t v5 = [(AMSPurchaseQueueBatchList *)self backingArray];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__AMSPurchaseQueueBatchList_batchForPurchase___block_invoke;
  v9[3] = &unk_1E55A5C10;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [v5 read:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__AMSPurchaseQueueBatchList_batchForPurchase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier", (void)v11);
        id v10 = [v8 purchaseForPurchaseId:v9];

        if (v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)popBatch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSPurchaseQueueBatchList *)self backingArray];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__AMSPurchaseQueueBatchList_popBatch___block_invoke;
  v7[3] = &unk_1E55A5BE8;
  id v8 = v4;
  id v6 = v4;
  [v5 readWrite:v7];
}

id __38__AMSPurchaseQueueBatchList_popBatch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 removeObject:v2];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (AMSThreadSafeObject)backingArray
{
  return self->_backingArray;
}

- (void)setBackingArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end