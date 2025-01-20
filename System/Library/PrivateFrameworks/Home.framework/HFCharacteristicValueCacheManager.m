@interface HFCharacteristicValueCacheManager
- (BOOL)_transaction:(id)a3 isWritingCharacteristic:(id)a4;
- (BOOL)_transaction:(id)a3 isWritingCharacteristic:(id)a4 allowingActions:(BOOL)a5;
- (BOOL)containsTransactionsExecutingActionSet:(id)a3;
- (BOOL)containsTransactionsReadingCharacteristic:(id)a3 filterBlock:(id)a4;
- (BOOL)containsTransactionsWritingCharacteristic:(id)a3;
- (HFCharacteristicValueCacheManager)init;
- (NSMutableDictionary)transactionsByActionSetID;
- (NSMutableDictionary)transactionsByCharacteristicID;
- (NSMutableOrderedSet)unprocessedAddedTransactions;
- (NSMutableOrderedSet)unprocessedRemovedTransactions;
- (id)_perfomUpdatedCacheRead:(id)a3;
- (id)_performLock:(os_unfair_lock_s *)a3 block:(id)a4;
- (id)cachedValueForCharacteristic:(id)a3;
- (id)transactionsExecutingActionSet:(id)a3;
- (id)transactionsReadingCharacteristic:(id)a3 filterBlock:(id)a4;
- (id)transactionsWritingCharacteristic:(id)a3;
- (void)_enumerateTransactionsRemovingFailingItems:(id)a3 block:(id)a4;
- (void)_locked_updateWithAddedTransaction:(id)a3;
- (void)_locked_updateWithRemovedTransaction:(id)a3;
- (void)setTransactionsByActionSetID:(id)a3;
- (void)setTransactionsByCharacteristicID:(id)a3;
- (void)setUnprocessedAddedTransactions:(id)a3;
- (void)setUnprocessedRemovedTransactions:(id)a3;
- (void)transactionAdded:(id)a3;
- (void)transactionRemoved:(id)a3;
@end

@implementation HFCharacteristicValueCacheManager

- (BOOL)containsTransactionsReadingCharacteristic:(id)a3 filterBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke;
  v13[3] = &unk_264095F60;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = [(HFCharacteristicValueCacheManager *)self _perfomUpdatedCacheRead:v13];
  char v11 = [v10 BOOLValue];

  return v11;
}

- (BOOL)containsTransactionsWritingCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  char v11 = __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke;
  v12 = &unk_264091A08;
  v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = [(HFCharacteristicValueCacheManager *)self _perfomUpdatedCacheRead:&v9];
  char v7 = objc_msgSend(v6, "BOOLValue", v9, v10, v11, v12, v13);

  return v7;
}

- (void)_enumerateTransactionsRemovingFailingItems:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F089C8];
  id v7 = a3;
  id v8 = [v6 indexSet];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __86__HFCharacteristicValueCacheManager__enumerateTransactionsRemovingFailingItems_block___block_invoke;
  id v14 = &unk_264096208;
  id v15 = v8;
  id v16 = v5;
  id v9 = v8;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:&v11];
  objc_msgSend(v7, "removeObjectsAtIndexes:", v9, v11, v12, v13, v14);
}

- (id)_perfomUpdatedCacheRead:(id)a3
{
  id v4 = a3;
  if (dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0))
  {
    id v5 = [MEMORY[0x263EFF9B0] orderedSet];
    id v6 = [MEMORY[0x263EFF9B0] orderedSet];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke;
    v19[3] = &unk_264096190;
    id v7 = v5;
    id v20 = v7;
    v21 = self;
    id v8 = v6;
    id v22 = v8;
    id v9 = [(HFCharacteristicValueCacheManager *)self _performLock:&self->_unprocessedTransctionLock block:v19];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_2;
    v14[3] = &unk_2640961E0;
    id v15 = v7;
    id v16 = self;
    id v17 = v8;
    id v18 = v4;
    id v10 = v8;
    id v11 = v7;
    uint64_t v12 = [(HFCharacteristicValueCacheManager *)self _performLock:&self->_cacheLock block:v14];
  }
  else
  {
    uint64_t v12 = [(HFCharacteristicValueCacheManager *)self _performLock:&self->_cacheLock block:v4];
  }

  return v12;
}

- (id)_performLock:(os_unfair_lock_s *)a3 block:(id)a4
{
  id v5 = (void (**)(void))a4;
  os_unfair_lock_lock(a3);
  id v6 = v5[2](v5);

  os_unfair_lock_unlock(a3);
  return v6;
}

id __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke(id *a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v2 = [a1[4] transactionsByCharacteristicID];
  v3 = [a1[5] uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 transactionsReading];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke_2;
  v9[3] = &unk_264095F88;
  id v6 = a1[4];
  id v10 = a1[5];
  uint64_t v12 = &v13;
  id v11 = a1[6];
  [v6 _enumerateTransactionsRemovingFailingItems:v5 block:v9];
  id v7 = [NSNumber numberWithBool:*((unsigned __int8 *)v14 + 24)];

  _Block_object_dispose(&v13, 8);
  return v7;
}

id __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
  v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 transactionsWriting];

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke_2;
  v9[3] = &unk_264095FD8;
  void v9[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = &v12;
  [v6 _enumerateTransactionsRemovingFailingItems:v5 block:v9];
  id v7 = [NSNumber numberWithBool:*((unsigned __int8 *)v13 + 24)];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (NSMutableDictionary)transactionsByCharacteristicID
{
  return self->_transactionsByCharacteristicID;
}

void __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 transactionsReading];
  [v4 removeObject:*(void *)(a1 + 32)];

  id v5 = [v3 transactionsWriting];

  [v5 removeObject:*(void *)(a1 + 32)];
}

- (id)cachedValueForCharacteristic:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke;
  v8[3] = &unk_264091A08;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(HFCharacteristicValueCacheManager *)self _perfomUpdatedCacheRead:v8];

  return v6;
}

uint64_t __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unprocessedRemovedTransactions];
  [v2 addObject:*(void *)(a1 + 40)];

  return 0;
}

uint64_t __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unprocessedAddedTransactions];
  [v2 addObject:*(void *)(a1 + 40)];

  return 0;
}

id __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_3;
  v7[3] = &unk_2640961B8;
  v7[4] = a1[5];
  [v2 enumerateObjectsUsingBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_4;
  v6[3] = &unk_2640961B8;
  id v3 = (void *)a1[6];
  v6[4] = a1[5];
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (*(void (**)(void))(a1[7] + 16))();
  return v4;
}

id __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke(uint64_t a1)
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v2 = [*(id *)(a1 + 32) transactionsByActionSetID];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke_2;
  id v11 = &unk_264096028;
  id v5 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = &v14;
  [v5 _enumerateTransactionsRemovingFailingItems:v4 block:&v8];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v15 + 24), v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
  return v6;
}

id __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 transactionsWriting];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__14;
  char v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_21;
  v8[3] = &unk_264096078;
  id v9 = *(id *)(a1 + 40);
  id v10 = &v11;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __86__HFCharacteristicValueCacheManager__enumerateTransactionsRemovingFailingItems_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 addIndex:a3];
  }
  return result;
}

uint64_t __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 characteristicsToRead];
  int v7 = [v6 containsObject:a1[4]];

  uint64_t v8 = *(void *)(a1[6] + 8);
  char v9 = *(unsigned char *)(v8 + 24) != 0;
  if (!*(unsigned char *)(v8 + 24) && ((v7 ^ 1) & 1) == 0)
  {
    uint64_t v10 = a1[5];
    if (v10)
    {
      char v9 = (*(uint64_t (**)(uint64_t, id))(v10 + 16))(v10, v5);
      uint64_t v8 = *(void *)(a1[6] + 8);
    }
    else
    {
      char v9 = 1;
    }
  }
  *(unsigned char *)(v8 + 24) = v9;
  *a3 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);

  return v7 ^ 1u;
}

uint64_t __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateWithAddedTransaction:", a2);
}

- (void)transactionRemoved:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke;
  v11[3] = &unk_264091A08;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(HFCharacteristicValueCacheManager *)self _performLock:&self->_unprocessedTransctionLock block:v11];
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_2;
  v9[3] = &unk_26408D450;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)transactionAdded:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke;
  v11[3] = &unk_264091A08;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(HFCharacteristicValueCacheManager *)self _performLock:&self->_unprocessedTransctionLock block:v11];
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_2;
  v9[3] = &unk_26408D450;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

uint64_t __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) unprocessedAddedTransactions];
  [v2 unionOrderedSet:v3];

  id v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) unprocessedRemovedTransactions];
  [v4 unionOrderedSet:v5];

  id v6 = [*(id *)(a1 + 40) unprocessedAddedTransactions];
  [v6 removeAllObjects];

  int v7 = [*(id *)(a1 + 40) unprocessedRemovedTransactions];
  [v7 removeAllObjects];

  return 0;
}

uint64_t __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unprocessedRemovedTransactions];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) unprocessedRemovedTransactions];
  [v3 removeObject:*(void *)(a1 + 40)];

  return 0;
}

- (NSMutableOrderedSet)unprocessedRemovedTransactions
{
  return self->_unprocessedRemovedTransactions;
}

uint64_t __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unprocessedAddedTransactions];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) unprocessedAddedTransactions];
  [v3 removeObject:*(void *)(a1 + 40)];

  return 0;
}

- (NSMutableOrderedSet)unprocessedAddedTransactions
{
  return self->_unprocessedAddedTransactions;
}

- (HFCharacteristicValueCacheManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)HFCharacteristicValueCacheManager;
  v2 = [(HFCharacteristicValueCacheManager *)&v18 init];
  id v3 = v2;
  if (v2)
  {
    *(void *)&v2->_cacheLock._os_unfair_lock_opaque = 0;
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("HFCharacteristicValueCacheManagerQueue", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    dispatchGroup = v3->_dispatchGroup;
    v3->_dispatchGroup = (OS_dispatch_group *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    transactionsByCharacteristicID = v3->_transactionsByCharacteristicID;
    v3->_transactionsByCharacteristicID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    transactionsByActionSetID = v3->_transactionsByActionSetID;
    v3->_transactionsByActionSetID = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9B0] orderedSet];
    unprocessedAddedTransactions = v3->_unprocessedAddedTransactions;
    v3->_unprocessedAddedTransactions = (NSMutableOrderedSet *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9B0] orderedSet];
    unprocessedRemovedTransactions = v3->_unprocessedRemovedTransactions;
    v3->_unprocessedRemovedTransactions = (NSMutableOrderedSet *)v15;
  }
  return v3;
}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
  id v4 = [v9 uniqueIdentifier];
  dispatch_queue_t v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5) {
    dispatch_queue_t v5 = objc_alloc_init(_HFCharacteristicReadAndWriteTransactions);
  }
  id v6 = [(_HFCharacteristicReadAndWriteTransactions *)v5 transactionsReading];
  [v6 addObject:*(void *)(a1 + 40)];

  dispatch_group_t v7 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
  id v8 = [v9 uniqueIdentifier];
  [v7 setObject:v5 forKeyedSubscript:v8];
}

- (BOOL)containsTransactionsExecutingActionSet:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke;
  id v12 = &unk_264091A08;
  uint64_t v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = [(HFCharacteristicValueCacheManager *)self _perfomUpdatedCacheRead:&v9];
  char v7 = objc_msgSend(v6, "BOOLValue", v9, v10, v11, v12, v13);

  return v7;
}

void __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v2 = *(char **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_3;
  v8[3] = &unk_2640960A0;
  uint64_t v10 = &v11;
  void v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  id v3 = (id)[v2 _performLock:v2 + 20 block:v8];
  if (*((unsigned char *)v12 + 24))
  {
    id v4 = *(char **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_4;
    v6[3] = &unk_264091A08;
    v6[4] = v4;
    id v7 = *(id *)(a1 + 40);
    id v5 = (id)[v4 _performLock:v4 + 16 block:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));

  _Block_object_dispose(&v11, 8);
}

void __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v2 = *(char **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_3;
  v8[3] = &unk_2640960A0;
  uint64_t v10 = &v11;
  void v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  id v3 = (id)[v2 _performLock:v2 + 20 block:v8];
  if (*((unsigned char *)v12 + 24))
  {
    id v4 = *(char **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_4;
    v6[3] = &unk_264091A08;
    v6[4] = v4;
    id v7 = *(id *)(a1 + 40);
    id v5 = (id)[v4 _performLock:v4 + 16 block:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));

  _Block_object_dispose(&v11, 8);
}

uint64_t __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_4(uint64_t a1)
{
  return 0;
}

uint64_t __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_4(uint64_t a1)
{
  return 0;
}

- (void)_locked_updateWithRemovedTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCharacteristicValueCacheManager *)self transactionsByCharacteristicID];
  id v6 = [v5 allValues];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke;
  v13[3] = &unk_264096140;
  id v7 = v4;
  id v14 = v7;
  objc_msgSend(v6, "na_each:", v13);

  id v8 = [(HFCharacteristicValueCacheManager *)self transactionsByActionSetID];
  id v9 = [v8 allValues];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke_2;
  v11[3] = &unk_264096168;
  id v12 = v7;
  id v10 = v7;
  objc_msgSend(v9, "na_each:", v11);
}

- (NSMutableDictionary)transactionsByActionSetID
{
  return self->_transactionsByActionSetID;
}

- (void)_locked_updateWithAddedTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 characteristicsToRead];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke;
  v19[3] = &unk_264090878;
  void v19[4] = self;
  id v6 = v4;
  id v20 = v6;
  objc_msgSend(v5, "na_each:", v19);

  id v7 = [v6 writeCharacteristicRequests];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_2;
  v17[3] = &unk_2640960C8;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  objc_msgSend(v7, "na_each:", v17);

  id v9 = [v8 actionsToExecute];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_3;
  v15[3] = &unk_2640960F0;
  v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  objc_msgSend(v9, "na_each:", v15);

  uint64_t v11 = [v10 actionSetsToExecute];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_4;
  v13[3] = &unk_264096118;
  void v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  objc_msgSend(v11, "na_each:", v13);
}

- (id)transactionsReadingCharacteristic:(id)a3 filterBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke;
  v12[3] = &unk_264095F60;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(HFCharacteristicValueCacheManager *)self _perfomUpdatedCacheRead:v12];

  return v10;
}

id __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke(id *a1)
{
  v2 = [a1[4] transactionsByCharacteristicID];
  id v3 = [a1[5] uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 transactionsReading];

  id v6 = [MEMORY[0x263EFF9B0] orderedSet];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke_2;
  v12[3] = &unk_264095F38;
  id v7 = a1[4];
  id v13 = a1[5];
  id v15 = a1[6];
  id v8 = v6;
  id v14 = v8;
  [v7 _enumerateTransactionsRemovingFailingItems:v5 block:v12];
  id v9 = v14;
  id v10 = v8;

  return v10;
}

uint64_t __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 characteristicsToRead];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v3)) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }

  return v5 ^ 1u;
}

- (id)transactionsWritingCharacteristic:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke;
  v8[3] = &unk_264091A08;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(HFCharacteristicValueCacheManager *)self _perfomUpdatedCacheRead:v8];

  return v6;
}

id __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 transactionsWriting];

  uint64_t v6 = [MEMORY[0x263EFF9B0] orderedSet];
  id v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke_2;
  v12[3] = &unk_264095FB0;
  void v12[4] = v7;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v14 = v8;
  [v7 _enumerateTransactionsRemovingFailingItems:v5 block:v12];
  id v9 = v14;
  id v10 = v8;

  return v10;
}

uint64_t __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _transaction:v3 isWritingCharacteristic:*(void *)(a1 + 40)];
  if (v4) {
    [*(id *)(a1 + 48) addObject:v3];
  }

  return v4 ^ 1u;
}

uint64_t __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v5 = [*(id *)(a1 + 32) _transaction:a2 isWritingCharacteristic:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v7 = 1;
  }
  else {
    char v7 = v5;
  }
  *(unsigned char *)(v6 + 24) = v7;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v5 ^ 1u;
}

- (id)transactionsExecutingActionSet:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke;
  v8[3] = &unk_264091A08;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(HFCharacteristicValueCacheManager *)self _perfomUpdatedCacheRead:v8];

  return v6;
}

id __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transactionsByActionSetID];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [MEMORY[0x263EFF9B0] orderedSet];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke_2;
  v11[3] = &unk_264096000;
  uint64_t v6 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v7 = v5;
  id v13 = v7;
  [v6 _enumerateTransactionsRemovingFailingItems:v4 block:v11];
  id v8 = v13;
  id v9 = v7;

  return v9;
}

uint64_t __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 actionSetsToExecute];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return v5 ^ 1u;
}

uint64_t __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 actionSetsToExecute];
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = 1;
  }
  else {
    char v8 = v6;
  }
  *(unsigned char *)(v7 + 24) = v8;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return v6 ^ 1u;
}

void __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_21(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v6 = [a2 writeCharacteristicRequests];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_2;
  v9[3] = &unk_264096050;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  objc_msgSend(v6, "na_each:", v9);
}

void __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 characteristic];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    uint64_t v5 = [v8 value];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    **(unsigned char **)(a1 + 48) = 1;
  }
}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
  id v4 = [v11 characteristic];
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v3 objectForKeyedSubscript:v5];

  if (!v6) {
    uint64_t v6 = objc_alloc_init(_HFCharacteristicReadAndWriteTransactions);
  }
  id v7 = [(_HFCharacteristicReadAndWriteTransactions *)v6 transactionsWriting];
  [v7 addObject:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
  id v9 = [v11 characteristic];
  id v10 = [v9 uniqueIdentifier];
  [v8 setObject:v6 forKeyedSubscript:v10];
}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v14 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v14;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
    id v7 = [v5 characteristic];
    id v8 = [v7 uniqueIdentifier];
    id v9 = [v6 objectForKeyedSubscript:v8];

    if (!v9) {
      id v9 = objc_alloc_init(_HFCharacteristicReadAndWriteTransactions);
    }
    id v10 = [(_HFCharacteristicReadAndWriteTransactions *)v9 transactionsWriting];
    [v10 addObject:*(void *)(a1 + 40)];

    id v11 = [*(id *)(a1 + 32) transactionsByCharacteristicID];
    uint64_t v12 = [v5 characteristic];
    id v13 = [v12 uniqueIdentifier];
    [v11 setObject:v9 forKeyedSubscript:v13];
  }
}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) transactionsByActionSetID];
  id v4 = [v8 uniqueIdentifier];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    id v5 = [MEMORY[0x263EFF9B0] orderedSet];
  }
  [v5 addObject:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 32) transactionsByActionSetID];
  id v7 = [v8 uniqueIdentifier];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

uint64_t __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

uint64_t __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateWithRemovedTransaction:", a2);
}

- (BOOL)_transaction:(id)a3 isWritingCharacteristic:(id)a4
{
  return [(HFCharacteristicValueCacheManager *)self _transaction:a3 isWritingCharacteristic:a4 allowingActions:1];
}

- (BOOL)_transaction:(id)a3 isWritingCharacteristic:(id)a4 allowingActions:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 writeCharacteristicRequests];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke;
  v16[3] = &unk_264090468;
  id v10 = v8;
  id v17 = v10;
  char v11 = objc_msgSend(v9, "na_any:", v16);

  if ((v11 & 1) == 0 && v5)
  {
    uint64_t v12 = [v7 actionsToExecute];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke_2;
    v14[3] = &unk_264090490;
    id v15 = v10;
    char v11 = objc_msgSend(v12, "na_any:", v14);
  }
  return v11;
}

BOOL __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristic];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

BOOL __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 characteristic];
  BOOL v8 = v7 == *(void **)(a1 + 32);

  return v8;
}

- (void)setTransactionsByCharacteristicID:(id)a3
{
}

- (void)setTransactionsByActionSetID:(id)a3
{
}

- (void)setUnprocessedAddedTransactions:(id)a3
{
}

- (void)setUnprocessedRemovedTransactions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unprocessedRemovedTransactions, 0);
  objc_storeStrong((id *)&self->_unprocessedAddedTransactions, 0);
  objc_storeStrong((id *)&self->_transactionsByActionSetID, 0);
  objc_storeStrong((id *)&self->_transactionsByCharacteristicID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end