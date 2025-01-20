@interface HFCameraClipPlayerQueueUpdate
- (BOOL)hasQueueChanges;
- (BOOL)queueChangesRequireRebuild;
- (HFCameraClipManager)clipManager;
- (HFCameraClipPlayerQueueUpdate)initWithClipManager:(id)a3 clips:(id)a4 targetPosition:(id)a5 queuedItems:(id)a6 queueLimit:(unint64_t)a7;
- (HFCameraClipPosition)targetPosition;
- (HFUniqueArrayDiff)queueDiff;
- (NSArray)clips;
- (NSArray)initialQueuedItems;
- (NSArray)updatedClipQueue;
- (NSDictionary)initialQueuedItemsByClipID;
- (id)_buildNewClipQueueForPosition:(id)a3;
- (unint64_t)queueLimit;
- (void)_computeQueueDiff;
- (void)performUpdatesOnQueue:(id)a3;
- (void)setHasQueueChanges:(BOOL)a3;
- (void)setQueueChangesRequireRebuild:(BOOL)a3;
- (void)setQueueDiff:(id)a3;
- (void)setUpdatedClipQueue:(id)a3;
@end

@implementation HFCameraClipPlayerQueueUpdate

- (HFCameraClipPlayerQueueUpdate)initWithClipManager:(id)a3 clips:(id)a4 targetPosition:(id)a5 queuedItems:(id)a6 queueLimit:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HFCameraClipPlayerQueueUpdate;
  v17 = [(HFCameraClipPlayerQueueUpdate *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clipManager, a3);
    objc_storeStrong((id *)&v18->_clips, a4);
    objc_storeStrong((id *)&v18->_targetPosition, a5);
    uint64_t v19 = [v16 copy];
    initialQueuedItems = v18->_initialQueuedItems;
    v18->_initialQueuedItems = (NSArray *)v19;

    v18->_queueLimit = a7;
    uint64_t v21 = objc_msgSend(v16, "na_dictionaryWithKeyGenerator:", &__block_literal_global_0);
    initialQueuedItemsByClipID = v18->_initialQueuedItemsByClipID;
    v18->_initialQueuedItemsByClipID = (NSDictionary *)v21;

    [(HFCameraClipPlayerQueueUpdate *)v18 _computeQueueDiff];
  }

  return v18;
}

id __97__HFCameraClipPlayerQueueUpdate_initWithClipManager_clips_targetPosition_queuedItems_queueLimit___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 clip];
  v3 = [v2 uniqueIdentifier];

  return v3;
}

- (void)performUpdatesOnQueue:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFCameraClipPlayerQueueUpdate *)self initialQueuedItems];
  v6 = [v4 queuableItems];
  char v7 = [v5 isEqualToArray:v6];

  if (v7)
  {
    if ([(HFCameraClipPlayerQueueUpdate *)self hasQueueChanges])
    {
      v8 = [(HFCameraClipPlayerQueueUpdate *)self queueDiff];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke;
      v22[3] = &unk_26408CC30;
      id v9 = v4;
      id v23 = v9;
      objc_super v24 = self;
      [v8 enumerateDeletesUsingBlock:v22];

      v10 = [(HFCameraClipPlayerQueueUpdate *)self queueDiff];
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2;
      uint64_t v19 = &unk_26408CC30;
      v20 = self;
      id v21 = v9;
      [v10 enumerateInsertsUsingBlock:&v16];
    }
    v11 = objc_msgSend(v4, "queuableItems", v16, v17, v18, v19, v20);
    v12 = [v11 firstObject];

    if (v12)
    {
      id v13 = [(HFCameraClipPlayerQueueUpdate *)self targetPosition];
      [v13 offset];
      objc_msgSend(v4, "seekToOffset:inItem:", v12);
    }
  }
  else
  {
    v12 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(HFCameraClipPlayerQueueUpdate *)self initialQueuedItems];
      id v15 = [v4 queuableItems];
      *(_DWORD *)buf = 138413058;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v4;
      __int16 v29 = 2112;
      v30 = v14;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Attempting to perform updates %@ on queue %@ when its items do not match our initial queued items! Expected; %@, actual: %@",
        buf,
        0x2Au);
    }
  }
}

void __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(a1 + 32) queuableItems];
  uint64_t v5 = [v4 count];

  v6 = *(void **)(a1 + 32);
  char v7 = [*(id *)(a1 + 40) initialQueuedItems];
  v8 = [v7 objectAtIndexedSubscript:a2];
  [v6 removeQueueableItem:v8];

  id v9 = [*(id *)(a1 + 32) queuableItems];
  uint64_t v10 = [v9 count];

  if (v10 != v5 - 1)
  {
    v11 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [*(id *)(a1 + 32) queuableItems];
      int v13 = 134218240;
      uint64_t v14 = a2;
      __int16 v15 = 2048;
      uint64_t v16 = [v12 count] - v5;
      _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Remove from queue at index %lu actually resulted in net %lu items!", (uint8_t *)&v13, 0x16u);
    }
  }
}

void __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(a1 + 32) updatedClipQueue];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a2];

  v6 = [*(id *)(a1 + 32) initialQueuedItemsByClipID];
  char v7 = [v5 uniqueIdentifier];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8 || ([v8 isPlayable] & 1) == 0)
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) clipManager];
    uint64_t v11 = [v9 createQueueableItemForClipManager:v10 clip:v5];

    v8 = (void *)v11;
  }
  v12 = [*(id *)(a1 + 40) queuableItems];
  uint64_t v13 = [v12 count];

  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  objc_super v24 = __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2;
  v25 = &unk_26408CC58;
  uint64_t v27 = a2;
  id v15 = v14;
  id v26 = v15;
  uint64_t v16 = __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2((uint64_t)&v22);
  objc_msgSend(v15, "insertQueueableItem:afterItem:", v8, v16, v22, v23, v24, v25);

  uint64_t v17 = [*(id *)(a1 + 40) queuableItems];
  uint64_t v18 = [v17 count];

  if (v18 != v13 + 1)
  {
    uint64_t v19 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [*(id *)(a1 + 40) queuableItems];
      uint64_t v21 = [v20 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v29 = a2;
      __int16 v30 = 2048;
      uint64_t v31 = v21 - v13;
      _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "Insert in queue at index %lu actually resulted in net %lu items!", buf, 0x16u);
    }
  }
}

id __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) queuableItems];
  unint64_t v4 = [v3 count];

  if (v2 >= v4)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = [*(id *)(a1 + 32) queuableItems];
    uint64_t v9 = [v8 count];

    if (v7 != v9)
    {
      uint64_t v10 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = [*(id *)(a1 + 32) queuableItems];
        int v14 = 134218242;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Insertion index %lu is out of bounds of queue %@! This likely indicates that the queue was mutated from out under the queue update.", (uint8_t *)&v14, 0x16u);
      }
    }
    v6 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) queuableItems];
    v6 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 40)];
  }
  return v6;
}

- (void)_computeQueueDiff
{
  v3 = [(HFCameraClipPlayerQueueUpdate *)self initialQueuedItems];
  unint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_6);

  uint64_t v5 = [(HFCameraClipPlayerQueueUpdate *)self targetPosition];
  v6 = [(HFCameraClipPlayerQueueUpdate *)self _buildNewClipQueueForPosition:v5];
  [(HFCameraClipPlayerQueueUpdate *)self setUpdatedClipQueue:v6];

  uint64_t v7 = [v4 firstObject];
  v8 = [(HFCameraClipPlayerQueueUpdate *)self updatedClipQueue];
  uint64_t v9 = [v8 firstObject];
  if (v7 == v9)
  {
    uint64_t v10 = [(HFCameraClipPlayerQueueUpdate *)self initialQueuedItems];
    uint64_t v11 = [v10 firstObject];
    -[HFCameraClipPlayerQueueUpdate setQueueChangesRequireRebuild:](self, "setQueueChangesRequireRebuild:", [v11 isPlayable] ^ 1);
  }
  else
  {
    [(HFCameraClipPlayerQueueUpdate *)self setQueueChangesRequireRebuild:1];
  }

  uint64_t v12 = objc_opt_new();
  [v12 setAllowMoves:0];
  if ([(HFCameraClipPlayerQueueUpdate *)self queueChangesRequireRebuild])
  {
    uint64_t v13 = &__block_literal_global_9;
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke_3;
    v17[3] = &unk_26408CCC0;
    v17[4] = self;
    uint64_t v13 = v17;
  }
  [v12 setEqualComparator:v13];
  int v14 = [(HFCameraClipPlayerQueueUpdate *)self updatedClipQueue];
  uint64_t v15 = +[HFUniqueArrayDiff diffFromArray:v4 toArray:v14 options:v12];
  [(HFCameraClipPlayerQueueUpdate *)self setQueueDiff:v15];

  __int16 v16 = [(HFCameraClipPlayerQueueUpdate *)self queueDiff];
  -[HFCameraClipPlayerQueueUpdate setHasQueueChanges:](self, "setHasQueueChanges:", [v16 numberOfOperations] != 0);
}

uint64_t __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke(uint64_t a1, void *a2)
{
  return [a2 clip];
}

uint64_t __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke_2()
{
  return 0;
}

uint64_t __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) initialQueuedItemsByClipID];
  v8 = [v5 uniqueIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  int v10 = [v9 isPlayable];

  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v11 = [*(id *)(a1 + 32) initialQueuedItemsByClipID];
  uint64_t v12 = [v6 uniqueIdentifier];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  int v14 = [v13 isPlayable];

  if (v14) {
    uint64_t v15 = [v5 isEqual:v6];
  }
  else {
LABEL_4:
  }
    uint64_t v15 = 0;

  return v15;
}

- (id)_buildNewClipQueueForPosition:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = [(HFCameraClipPlayerQueueUpdate *)self clips];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __63__HFCameraClipPlayerQueueUpdate__buildNewClipQueueForPosition___block_invoke;
  uint64_t v23 = &unk_26408CCE8;
  id v6 = v4;
  id v24 = v6;
  v25 = &v26;
  [v5 enumerateObjectsUsingBlock:&v20];

  if (v27[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = objc_msgSend(v6, "clip", v20, v21, v22, v23);
      uint64_t v17 = [v16 uniqueIdentifier];
      uint64_t v18 = [(HFCameraClipPlayerQueueUpdate *)self clips];
      uint64_t v19 = [v18 count];
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v17;
      __int16 v32 = 2048;
      uint64_t v33 = v19;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Could not find matching playlist for clip %@ in clips %ld", buf, 0x16u);
    }
    v8 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    if ([(HFCameraClipPlayerQueueUpdate *)self queueLimit]) {
      unint64_t v9 = [(HFCameraClipPlayerQueueUpdate *)self queueLimit];
    }
    else {
      unint64_t v9 = -1;
    }
    int v10 = [(HFCameraClipPlayerQueueUpdate *)self clips];
    uint64_t v11 = [v10 count];
    uint64_t v12 = v27[3];

    uint64_t v13 = [(HFCameraClipPlayerQueueUpdate *)self clips];
    uint64_t v7 = v13;
    if (v9 >= v11 - v12) {
      unint64_t v14 = v11 - v12;
    }
    else {
      unint64_t v14 = v9;
    }
    v8 = -[NSObject subarrayWithRange:](v13, "subarrayWithRange:", v27[3], v14);
  }

  _Block_object_dispose(&v26, 8);
  return v8;
}

void __63__HFCameraClipPlayerQueueUpdate__buildNewClipQueueForPosition___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 uniqueIdentifier];
  v8 = [v7 UUIDString];
  unint64_t v9 = [*(id *)(a1 + 32) clip];
  int v10 = [v9 uniqueIdentifier];
  uint64_t v11 = [v10 UUIDString];
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (HFCameraClipPosition)targetPosition
{
  return self->_targetPosition;
}

- (NSArray)initialQueuedItems
{
  return self->_initialQueuedItems;
}

- (unint64_t)queueLimit
{
  return self->_queueLimit;
}

- (NSArray)updatedClipQueue
{
  return self->_updatedClipQueue;
}

- (void)setUpdatedClipQueue:(id)a3
{
}

- (BOOL)hasQueueChanges
{
  return self->_hasQueueChanges;
}

- (void)setHasQueueChanges:(BOOL)a3
{
  self->_hasQueueChanges = a3;
}

- (BOOL)queueChangesRequireRebuild
{
  return self->_queueChangesRequireRebuild;
}

- (void)setQueueChangesRequireRebuild:(BOOL)a3
{
  self->_queueChangesRequireRebuild = a3;
}

- (HFCameraClipManager)clipManager
{
  return self->_clipManager;
}

- (NSDictionary)initialQueuedItemsByClipID
{
  return self->_initialQueuedItemsByClipID;
}

- (HFUniqueArrayDiff)queueDiff
{
  return self->_queueDiff;
}

- (void)setQueueDiff:(id)a3
{
}

- (NSArray)clips
{
  return self->_clips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_queueDiff, 0);
  objc_storeStrong((id *)&self->_initialQueuedItemsByClipID, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_updatedClipQueue, 0);
  objc_storeStrong((id *)&self->_initialQueuedItems, 0);
  objc_storeStrong((id *)&self->_targetPosition, 0);
}

@end