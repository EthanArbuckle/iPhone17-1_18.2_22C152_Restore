@interface CKTranscriptBalloonSelectionManager
- (BOOL)isMessageGuidSelected:(id)a3;
- (CKTranscriptBalloonSelectionManager)init;
- (CKTranscriptBalloonSelectionManagerDataSource)dataSource;
- (CKTranscriptBalloonSelectionManagerDelegate)delegate;
- (NSArray)chatItems;
- (NSMutableDictionary)selectedStates;
- (NSMutableOrderedSet)selectedMessageGuids;
- (NSString)trackedGuid;
- (id)_chatItemForGUID:(id)a3;
- (id)selectedGuidAtIndex:(unint64_t)a3;
- (id)selectedStateForGuid:(id)a3;
- (int64_t)indexOfGuid:(id)a3 inChatItems:(id)a4;
- (unint64_t)selectedGuidCount;
- (void)addSelectedMessageGuid:(id)a3 selectionState:(id)a4;
- (void)removeAllSelectedMessageGuids;
- (void)removeAllSelectedMessageGuidsExceptTrackedGuid;
- (void)removeSelectedMessageGuid:(id)a3;
- (void)removeTrackedGuid;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedGuids:(id)a3;
- (void)setSelectedMessageGuids:(id)a3;
- (void)setSelectedStates:(id)a3;
- (void)setTrackedGuid:(id)a3;
- (void)trackSelectedGuid:(id)a3 selectionState:(id)a4;
@end

@implementation CKTranscriptBalloonSelectionManager

- (CKTranscriptBalloonSelectionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBalloonSelectionManager;
  v2 = [(CKTranscriptBalloonSelectionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    selectedMessageGuids = v2->_selectedMessageGuids;
    v2->_selectedMessageGuids = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    selectedStates = v2->_selectedStates;
    v2->_selectedStates = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)_chatItemForGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKTranscriptBalloonSelectionManager *)self chatItems];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "IMChatItem", (void)v14);
        v11 = [v10 guid];
        char v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)chatItems
{
  uint64_t v3 = [(CKTranscriptBalloonSelectionManager *)self dataSource];
  id v4 = [v3 selectionManagerChatItems:self];

  return (NSArray *)v4;
}

- (int64_t)indexOfGuid:(id)a3 inChatItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CKTranscriptBalloonSelectionManager_indexOfGuid_inChatItems___block_invoke;
  v10[3] = &unk_1E5622268;
  id v7 = v5;
  id v11 = v7;
  char v12 = &v13;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v10];
  int64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __63__CKTranscriptBalloonSelectionManager_indexOfGuid_inChatItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 IMChatItem];
  id v8 = [v7 guid];

  if ([v8 isEqualToString:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)addSelectedMessageGuid:(id)a3 selectionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(CKTranscriptBalloonSelectionManager *)self chatItems];
    int64_t v9 = [(CKTranscriptBalloonSelectionManager *)self indexOfGuid:v6 inChatItems:v8];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v10 = v9;
      id v11 = [v8 objectAtIndexedSubscript:v9];
      if ([v11 canBeSelectedInEditMode])
      {
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x2020000000;
        char v30 = 0;
        selectedMessageGuids = self->_selectedMessageGuids;
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        uint64_t v19 = __77__CKTranscriptBalloonSelectionManager_addSelectedMessageGuid_selectionState___block_invoke;
        v20 = &unk_1E562B338;
        v21 = self;
        id v22 = v8;
        int64_t v26 = v10;
        id v13 = v6;
        id v23 = v13;
        id v14 = v7;
        id v24 = v14;
        v25 = &v27;
        [(NSMutableOrderedSet *)selectedMessageGuids enumerateObjectsUsingBlock:&v17];
        if (!*((unsigned char *)v28 + 24))
        {
          -[NSMutableOrderedSet addObject:](self->_selectedMessageGuids, "addObject:", v13, v17, v18, v19, v20, v21, v22, v23);
          [(NSMutableDictionary *)self->_selectedStates setObject:v14 forKey:v13];
        }
        uint64_t v15 = [(CKTranscriptBalloonSelectionManager *)self delegate];
        uint64_t v16 = [(CKTranscriptBalloonSelectionManager *)self _chatItemForGUID:v13];
        [v15 selectionManager:self didAddChatItem:v16 selectionState:v14];

        _Block_object_dispose(&v27, 8);
      }
    }
  }
}

unint64_t __77__CKTranscriptBalloonSelectionManager_addSelectedMessageGuid_selectionState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = [*(id *)(a1 + 32) indexOfGuid:a2 inChatItems:*(void *)(a1 + 40)];
  if (result != 0x7FFFFFFFFFFFFFFFLL && *(void *)(a1 + 72) < result)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) insertObject:*(void *)(a1 + 48) atIndex:a3];
    unint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) setObject:*(void *)(a1 + 56) forKey:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)removeSelectedMessageGuid:(id)a3
{
  id v8 = a3;
  if ([v8 length])
  {
    id v4 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
    [v4 removeObject:v8];

    id v5 = [(CKTranscriptBalloonSelectionManager *)self selectedStates];
    [v5 removeObjectForKey:v8];

    id v6 = [(CKTranscriptBalloonSelectionManager *)self delegate];
    id v7 = [(CKTranscriptBalloonSelectionManager *)self _chatItemForGUID:v8];
    [v6 selectionManager:self didRemoveChatItem:v7];
  }
}

- (void)removeAllSelectedMessageGuids
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(CKTranscriptBalloonSelectionManager *)self setTrackedGuid:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        int64_t v9 = [(CKTranscriptBalloonSelectionManager *)self delegate];
        int64_t v10 = [(CKTranscriptBalloonSelectionManager *)self _chatItemForGUID:v8];
        [v9 selectionManager:self didRemoveChatItem:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  id v11 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
  [v11 removeAllObjects];

  char v12 = [(CKTranscriptBalloonSelectionManager *)self selectedStates];
  [v12 removeAllObjects];

  id v13 = [(CKTranscriptBalloonSelectionManager *)self delegate];
  [v13 selectionManagerDidRemoveAllSelectedChatItems:self];
}

- (BOOL)isMessageGuidSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
  if ([v5 containsObject:v4])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(CKTranscriptBalloonSelectionManager *)self trackedGuid];
    char v6 = [v7 isEqualToString:v4];
  }
  return v6;
}

- (unint64_t)selectedGuidCount
{
  v2 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)selectedGuidAtIndex:(unint64_t)a3
{
  id v4 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (void)removeAllSelectedMessageGuidsExceptTrackedGuid
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CKTranscriptBalloonSelectionManager *)self trackedGuid];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v10 isEqualToString:v3] & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[CKTranscriptBalloonSelectionManager removeSelectedMessageGuid:](self, "removeSelectedMessageGuid:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)trackSelectedGuid:(id)a3 selectionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CKTranscriptBalloonSelectionManager *)self setTrackedGuid:v7];
  [(CKTranscriptBalloonSelectionManager *)self addSelectedMessageGuid:v7 selectionState:v6];
}

- (id)selectedStateForGuid:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(CKTranscriptBalloonSelectionManager *)self selectedStates];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)removeTrackedGuid
{
  unint64_t v3 = [(CKTranscriptBalloonSelectionManager *)self trackedGuid];
  [(CKTranscriptBalloonSelectionManager *)self removeSelectedMessageGuid:v3];

  [(CKTranscriptBalloonSelectionManager *)self setTrackedGuid:0];
}

- (void)setSelectedGuids:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptBalloonSelectionManager *)self trackedGuid];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = [(CKTranscriptBalloonSelectionManager *)self selectedMessageGuids];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v13 = [v4 objectForKey:v12];
        if (v13)
        {
        }
        else if (!v5 || ([v12 isEqualToString:v5] & 1) == 0)
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        [(CKTranscriptBalloonSelectionManager *)self removeSelectedMessageGuid:*(void *)(*((void *)&v30 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v16);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8 * k);
        if (!-[CKTranscriptBalloonSelectionManager isMessageGuidSelected:](self, "isMessageGuidSelected:", v24, (void)v26))
        {
          v25 = [v19 objectForKey:v24];
          [(CKTranscriptBalloonSelectionManager *)self addSelectedMessageGuid:v24 selectionState:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }
}

- (CKTranscriptBalloonSelectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTranscriptBalloonSelectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKTranscriptBalloonSelectionManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CKTranscriptBalloonSelectionManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)trackedGuid
{
  return self->_trackedGuid;
}

- (void)setTrackedGuid:(id)a3
{
}

- (NSMutableOrderedSet)selectedMessageGuids
{
  return self->_selectedMessageGuids;
}

- (void)setSelectedMessageGuids:(id)a3
{
}

- (NSMutableDictionary)selectedStates
{
  return self->_selectedStates;
}

- (void)setSelectedStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedStates, 0);
  objc_storeStrong((id *)&self->_selectedMessageGuids, 0);
  objc_storeStrong((id *)&self->_trackedGuid, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_destroyWeak((id *)&self->_delegate);
}

@end