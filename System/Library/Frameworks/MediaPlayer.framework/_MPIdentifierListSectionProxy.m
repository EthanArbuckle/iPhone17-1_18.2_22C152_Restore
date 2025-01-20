@interface _MPIdentifierListSectionProxy
- (MPSectionedIdentifierList)sectionedIdentifierList;
- (NSArray)itemIdentifiers;
- (NSMutableArray)mutableItemIdentifiers;
- (NSString)sectionIdentifier;
- (_MPIdentifierListSectionProxy)initWithSection:(id)a3 sectionedIdentifierList:(id)a4 existingItemIdentifiers:(id)a5;
- (void)applyChanges:(id)a3 itemLookupBlock:(id)a4;
- (void)insertItems:(id)a3 afterItem:(id)a4;
- (void)insertItemsAtHead:(id)a3;
- (void)insertItemsAtTail:(id)a3;
- (void)moveItem:(id)a3 afterItem:(id)a4;
- (void)moveItemToHead:(id)a3;
- (void)moveItemToTail:(id)a3;
- (void)removeItems:(id)a3;
- (void)setMutableItemIdentifiers:(id)a3;
- (void)updateItems:(id)a3;
- (void)updateSection;
@end

@implementation _MPIdentifierListSectionProxy

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (_MPIdentifierListSectionProxy)initWithSection:(id)a3 sectionedIdentifierList:(id)a4 existingItemIdentifiers:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_MPIdentifierListSectionProxy;
  v11 = [(_MPIdentifierListSectionProxy *)&v21 init];
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v9 identifier];
      uint64_t v14 = [v10 count];
      v15 = objc_msgSend(v10, "msv_compactDescription");
      *(_DWORD *)buf = 138544130;
      id v23 = v8;
      __int16 v24 = 2114;
      v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = v14;
      __int16 v28 = 2114;
      v29 = v15;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] init | [] sil=%{public}@ items=(:%lld)[%{public}@]", buf, 0x2Au);
    }
    uint64_t v16 = [v8 copy];
    sectionIdentifier = v11->_sectionIdentifier;
    v11->_sectionIdentifier = (NSString *)v16;

    objc_storeWeak((id *)&v11->_sectionedIdentifierList, v9);
    uint64_t v18 = [v10 mutableCopy];
    mutableItemIdentifiers = v11->_mutableItemIdentifiers;
    v11->_mutableItemIdentifiers = (NSMutableArray *)v18;
  }
  return v11;
}

- (NSArray)itemIdentifiers
{
  v2 = (void *)[(NSMutableArray *)self->_mutableItemIdentifiers copy];

  return (NSArray *)v2;
}

- (void)applyChanges:(id)a3 itemLookupBlock:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasChanges])
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
    id v9 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sectionIdentifier = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v35 = sectionIdentifier;
      __int16 v36 = 2114;
      id v37 = v6;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] applyChanges:… | begin transaction [] changes=%{public}@", buf, 0x16u);
    }

    [WeakRetained dataSourceBeginTransactionForSection:self->_sectionIdentifier];
    mutableItemIdentifiers = self->_mutableItemIdentifiers;
    v12 = [v6 updatedIndexes];
    v13 = [(NSMutableArray *)mutableItemIdentifiers objectsAtIndexes:v12];
    uint64_t v14 = (void *)[v13 mutableCopy];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke;
    v29[3] = &unk_1E57F6D88;
    id v16 = v15;
    id v30 = v16;
    v31 = self;
    id v17 = v7;
    id v33 = v17;
    id v18 = v14;
    id v32 = v18;
    [v6 enumerateMovesUsingBlock:v29];
    if ([v18 count]) {
      [(_MPIdentifierListSectionProxy *)self updateItems:v18];
    }
    v19 = self->_mutableItemIdentifiers;
    v20 = [v6 deletedIndexes];
    objc_super v21 = [(NSMutableArray *)v19 objectsAtIndexes:v20];

    v22 = [v6 insertedIndexes];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_2;
    v27[3] = &unk_1E57F6DB0;
    v27[4] = self;
    id v28 = v17;
    [v22 enumerateRangesUsingBlock:v27];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_3;
    v26[3] = &unk_1E57F76F0;
    v26[4] = self;
    [v16 enumerateKeysAndObjectsUsingBlock:v26];
    if ([v21 count]) {
      [(_MPIdentifierListSectionProxy *)self removeItems:v21];
    }
    [WeakRetained dataSourceEndTransactionForSection:self->_sectionIdentifier];
    id v23 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      __int16 v36 = 2114;
      id v37 = v6;
      _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] applyChanges:… | end transaction [] changes=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    WeakRetained = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      __int16 v36 = 2114;
      id v37 = v6;
      _os_log_impl(&dword_1952E8000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] applyChanges:… | ignoring [no changes] changes=%{public}@", buf, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableItemIdentifiers, 0);
  objc_destroyWeak((id *)&self->_sectionedIdentifierList);

  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

- (void)setMutableItemIdentifiers:(id)a3
{
}

- (NSMutableArray)mutableItemIdentifiers
{
  return self->_mutableItemIdentifiers;
}

- (MPSectionedIdentifierList)sectionedIdentifierList
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);

  return (MPSectionedIdentifierList *)WeakRetained;
}

- (void)updateItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    uint64_t v7 = [v4 count];
    id v8 = objc_msgSend(v4, "msv_compactDescription");
    int v10 = 138543874;
    v11 = sectionIdentifier;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] updateItems:(:%lld)[%{public}@]", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceReloadItems:v4 inSection:self->_sectionIdentifier];
}

- (void)updateSection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    int v6 = 138543362;
    uint64_t v7 = sectionIdentifier;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] updateSection", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceUpdateSection:self->_sectionIdentifier];
}

- (void)removeItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    uint64_t v7 = [v4 count];
    uint64_t v8 = objc_msgSend(v4, "msv_compactDescription");
    int v10 = 138543874;
    v11 = sectionIdentifier;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] removeItems:(:%lld)[%{public}@]", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceRemoveItems:v4 fromSection:self->_sectionIdentifier];

  [(NSMutableArray *)self->_mutableItemIdentifiers removeObjectsInArray:v4];
}

- (void)moveItemToTail:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    int v8 = 138543618;
    id v9 = sectionIdentifier;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItemToTail:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceMoveItemToTail:v4 inSection:self->_sectionIdentifier];

  [(NSMutableArray *)self->_mutableItemIdentifiers removeObject:v4];
  [(NSMutableArray *)self->_mutableItemIdentifiers addObject:v4];
}

- (void)moveItem:(id)a3 afterItem:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 isEqualToString:v8];
  __int16 v10 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      sectionIdentifier = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543874;
      id v18 = sectionIdentifier;
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItem:%{public}@ afterItem:%{public}@ | ignoring [declaration doesn't declare anything]", buf, 0x20u);
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543874;
      id v18 = v13;
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItem:%{public}@ afterItem:%{public}@", buf, 0x20u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
    [WeakRetained dataSourceMoveItem:v7 afterItem:v8 inSection:self->_sectionIdentifier];

    [(NSMutableArray *)self->_mutableItemIdentifiers removeObject:v7];
    uint64_t v15 = [(NSMutableArray *)self->_mutableItemIdentifiers indexOfObject:v8];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList.m", 1172, @"Did not find item %@ to move after.", v8 object file lineNumber description];
    }
    [(NSMutableArray *)self->_mutableItemIdentifiers insertObject:v7 atIndex:v15 + 1];
  }
}

- (void)moveItemToHead:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    int v8 = 138543618;
    int v9 = sectionIdentifier;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] moveItemToHead:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceMoveItemToHead:v4 inSection:self->_sectionIdentifier];

  [(NSMutableArray *)self->_mutableItemIdentifiers removeObject:v4];
  [(NSMutableArray *)self->_mutableItemIdentifiers insertObject:v4 atIndex:0];
}

- (void)insertItemsAtTail:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    uint64_t v7 = [v4 count];
    int v8 = objc_msgSend(v4, "msv_compactDescription");
    int v10 = 138543874;
    id v11 = sectionIdentifier;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] insertItemsAtTail:(:%lld)[%{public}@]", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceInsertItemsAtTail:v4 inSection:self->_sectionIdentifier];

  [(NSMutableArray *)self->_mutableItemIdentifiers addObjectsFromArray:v4];
}

- (void)insertItems:(id)a3 afterItem:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    uint64_t v11 = [v7 count];
    __int16 v12 = objc_msgSend(v7, "msv_compactDescription");
    *(_DWORD *)buf = 138544130;
    __int16 v19 = sectionIdentifier;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] insertItems:… afterItem:%{public}@ | [] items=(:%lld)[%{public}@]", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceInsertItems:v7 afterItem:v8 inSection:self->_sectionIdentifier];

  uint64_t v14 = [(NSMutableArray *)self->_mutableItemIdentifiers indexOfObject:v8];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList.m", 1146, @"Did not find item %@ to insert after.", v8 object file lineNumber description];
  }
  mutableItemIdentifiers = self->_mutableItemIdentifiers;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v14 + 1, objc_msgSend(v7, "count"));
  [(NSMutableArray *)mutableItemIdentifiers insertObjects:v7 atIndexes:v16];
}

- (void)insertItemsAtHead:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    uint64_t v7 = [v4 count];
    id v8 = objc_msgSend(v4, "msv_compactDescription");
    int v12 = 138543874;
    uint64_t v13 = sectionIdentifier;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] insertItemsAtHead:(:%lld)[%{public}@]", (uint8_t *)&v12, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionedIdentifierList);
  [WeakRetained dataSourceInsertItemsAtHead:v4 inSection:self->_sectionIdentifier];

  mutableItemIdentifiers = self->_mutableItemIdentifiers;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  [(NSMutableArray *)mutableItemIdentifiers insertObjects:v4 atIndexes:v11];
}

@end