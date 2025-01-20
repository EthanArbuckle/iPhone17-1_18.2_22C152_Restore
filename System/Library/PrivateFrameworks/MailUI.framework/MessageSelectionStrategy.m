@interface MessageSelectionStrategy
- (BOOL)shouldChangeSelectionAfterDeletedMessageItemIDs:(id)a3 selectedItemIDs:(id)a4;
- (MessageSelectionStrategy)initWithDataSource:(id)a3;
- (MessageSelectionStrategyDataSource)dataSource;
- (id)_itemIDToSelectFromItemID:(id)a3 deletedMessageIDs:(id)a4 withDirection:(int)a5;
- (id)itemIDToSelectAfterDeletedMessageItemIDs:(id)a3;
- (id)itemIDToSelectFromItemID:(id)a3 withDirection:(int)a4;
@end

@implementation MessageSelectionStrategy

- (MessageSelectionStrategy)initWithDataSource:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[MessageSelectionStrategy initWithDataSource:]();
  }
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)MessageSelectionStrategy;
  v6 = [(MessageSelectionStrategy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataSource, v5);
    v8 = v7;
  }

  return v7;
}

uint64_t ___ef_log_MessageSelectionStrategy_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MessageSelectionStrategy");
  uint64_t v1 = _ef_log_MessageSelectionStrategy_log;
  _ef_log_MessageSelectionStrategy_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)shouldChangeSelectionAfterDeletedMessageItemIDs:(id)a3 selectedItemIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 count];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__MessageSelectionStrategy_shouldChangeSelectionAfterDeletedMessageItemIDs_selectedItemIDs___block_invoke;
  v13[3] = &unk_1E6D121D8;
  id v14 = v6;
  v15 = self;
  id v9 = v6;
  char v10 = objc_msgSend(v7, "ef_any:", v13);

  if (v8) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __92__MessageSelectionStrategy_shouldChangeSelectionAfterDeletedMessageItemIDs_selectedItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  int v6 = [WeakRetained messageSelectionStrategy:*(void *)(a1 + 40) isExpandedThreadWithItemID:v3];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    uint64_t v8 = [v7 messageSelectionStrategy:*(void *)(a1 + 40) indexPathOfItemID:v3];

    if (v8)
    {
      for (uint64_t i = [v8 item] + 1; ; ++i)
      {
        id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
        uint64_t v11 = *(void *)(a1 + 40);
        v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", i, objc_msgSend(v8, "section"));
        v13 = [v10 messageSelectionStrategy:v11 itemIDForIndexPath:v12];

        id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
        LODWORD(v12) = [v14 messageSelectionStrategy:*(void *)(a1 + 40) anyExpandedThreadContainsItemID:v13];

        if (!v12) {
          break;
        }
        if ([*(id *)(a1 + 32) containsObject:v13])
        {
          uint64_t v4 = 1;
          break;
        }
      }
    }
  }
  return v4;
}

- (id)itemIDToSelectAfterDeletedMessageItemIDs:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ef_log_MessageSelectionStrategy();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v60 = v6;
    __int16 v61 = 2114;
    uint64_t v62 = (uint64_t)v4;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
  }
  id v7 = [v4 firstObject];
  aSelector = a2;
  if ((unint64_t)[v4 count] < 2)
  {
    uint64_t v11 = v7;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v9 = [WeakRetained messageSelectionStrategy:self indexPathOfItemID:v7];

    if (v9) {
      uint64_t v10 = [v9 item];
    }
    else {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v47 = v9;
    id v48 = v4;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v4;
    uint64_t v12 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
    v51 = v7;
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = v7;
      uint64_t v15 = *(void *)v56;
      uint64_t v16 = v10;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v56 != v15) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v19 = objc_loadWeakRetained((id *)&self->_dataSource);
          v20 = [v19 messageSelectionStrategy:self indexPathOfItemID:v18];

          if (v20)
          {
            uint64_t v21 = [v20 item];
            if (v21 > v10)
            {
              id v22 = v18;

              v51 = v22;
              uint64_t v10 = v21;
            }
            if (v21 < v16)
            {
              id v23 = v18;

              id v14 = v23;
              uint64_t v16 = v21;
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v13);
    }
    else
    {
      id v14 = v7;
    }

    id v4 = v48;
    id v7 = v51;
    uint64_t v11 = v14;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__MessageSelectionStrategy_itemIDToSelectAfterDeletedMessageItemIDs___block_invoke;
  aBlock[3] = &unk_1E6D11860;
  aBlock[4] = self;
  v24 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v25 = [(MessageSelectionStrategy *)self _itemIDToSelectFromItemID:v11 deletedMessageIDs:v4 withDirection:0xFFFFFFFFLL];
  int v26 = v24[2](v24, v25);
  uint64_t v27 = [(MessageSelectionStrategy *)self _itemIDToSelectFromItemID:v7 deletedMessageIDs:v4 withDirection:1];
  int v28 = v24[2](v24, v27);
  if ((!v25 || v27) && (v25 || !v27))
  {
    if (v26 == v28)
    {
      if (v25 | v27)
      {
        v39 = v11;
        id v40 = objc_loadWeakRetained((id *)&self->_dataSource);
        int v41 = [v40 lastChangeDirectionForMessageSelectionStrategy:self];

        v42 = _ef_log_MessageSelectionStrategy();
        BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        if (v41 == 1)
        {
          uint64_t v11 = v39;
          if (v43)
          {
            v44 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138544130;
            v60 = v44;
            __int16 v61 = 2114;
            uint64_t v62 = v27;
            __int16 v63 = 2114;
            uint64_t v64 = v25;
            __int16 v65 = 2114;
            id v66 = 0;
            _os_log_impl(&dword_1DDCDB000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Last browse direction was explicitly down. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);
          }
          id v45 = (id)v27;
        }
        else
        {
          uint64_t v11 = v39;
          if (v43)
          {
            v46 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138544130;
            v60 = v46;
            __int16 v61 = 2114;
            uint64_t v62 = v27;
            __int16 v63 = 2114;
            uint64_t v64 = v25;
            __int16 v65 = 2114;
            id v66 = 0;
            _os_log_impl(&dword_1DDCDB000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Last browse directio was up or not defined. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);
          }
          id v45 = (id)v25;
        }
        id v31 = v45;
      }
      else
      {
        id v31 = 0;
      }
    }
    else
    {
      v53 = v11;
      v36 = _ef_log_MessageSelectionStrategy();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138544130;
        v60 = v37;
        __int16 v61 = 2114;
        uint64_t v62 = v27;
        __int16 v63 = 2114;
        uint64_t v64 = v25;
        __int16 v65 = 2114;
        id v66 = 0;
        _os_log_impl(&dword_1DDCDB000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Only one adjacent message is unread. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);
      }
      if (v26) {
        v38 = (void *)v25;
      }
      else {
        v38 = (void *)v27;
      }
      id v31 = v38;
      uint64_t v11 = v53;
    }
  }
  else
  {
    v29 = v11;
    if (v25) {
      v30 = (void *)v25;
    }
    else {
      v30 = (void *)v27;
    }
    id v31 = v30;
    v32 = _ef_log_MessageSelectionStrategy();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138544130;
      v60 = v33;
      __int16 v61 = 2114;
      uint64_t v62 = v27;
      __int16 v63 = 2114;
      uint64_t v64 = v25;
      __int16 v65 = 2114;
      id v66 = v31;
      _os_log_impl(&dword_1DDCDB000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ One of the adjacent messages does not exist. Older: %{public}@, Newer: %{public}@, Selected: %{public}@", buf, 0x2Au);
    }
    uint64_t v11 = v29;
  }
  id v34 = v31;

  return v34;
}

uint64_t __69__MessageSelectionStrategy_itemIDToSelectAfterDeletedMessageItemIDs___block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  id v3 = (id *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = [WeakRetained messageSelectionStrategy:*(void *)(a1 + 32) messageListItemForItemID:v4];

  if (v6)
  {
    id v7 = [v6 flags];
    uint64_t v8 = [v7 read] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)itemIDToSelectFromItemID:(id)a3 withDirection:(int)a4
{
  return [(MessageSelectionStrategy *)self _itemIDToSelectFromItemID:a3 deletedMessageIDs:0 withDirection:*(void *)&a4];
}

- (id)_itemIDToSelectFromItemID:(id)a3 deletedMessageIDs:(id)a4 withDirection:(int)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v13 = 0;
    goto LABEL_42;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v11 = [WeakRetained messageSelectionStrategy:self indexPathOfItemID:v8];

  if (v11) {
    uint64_t v12 = [v11 item];
  }
  else {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v14 = _ef_log_MessageSelectionStrategy();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    id v47 = v8;
    __int16 v48 = 1024;
    int v49 = a5;
    __int16 v50 = 2048;
    uint64_t v51 = v12;
    _os_log_debug_impl(&dword_1DDCDB000, v14, OS_LOG_TYPE_DEBUG, "_itemIDToSelectFromItemID:%{public}@ direction:%i startIndex:%li", buf, 0x1Cu);
  }

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v16 = [v15 indexPathOfSelectedMessageForMessageSelectionStrategy:self];

    if (v16)
    {
      uint64_t v12 = [v16 item];
      char v17 = 0;
      uint64_t v11 = v16;
    }
    else
    {
      id v18 = objc_loadWeakRetained((id *)&self->_dataSource);
      uint64_t v11 = [v18 indexPathOfPreviouslySelectedMessageForMessageSelectionStrategy:self];

      if (v11) {
        uint64_t v12 = [v11 item];
      }
      else {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v19 = _ef_log_MessageSelectionStrategy();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[MessageSelectionStrategy _itemIDToSelectFromItemID:deletedMessageIDs:withDirection:]((uint64_t)v8, v12, v19);
      }

      char v17 = 1;
    }
  }
  else
  {
    char v17 = 0;
  }
  if (a5 != 1)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_dataSource);
    int v23 = [v22 messageSelectionStrategy:self anyExpandedThreadContainsItemID:v8];

    if (v23)
    {
      id v24 = objc_loadWeakRetained((id *)&self->_dataSource);
      uint64_t v25 = [v24 messageSelectionStrategy:self indexPathOfItemID:v8];

      if (v25)
      {
        id v26 = v8;
        id v27 = v9;
        id v28 = objc_loadWeakRetained((id *)&self->_dataSource);
        v29 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v25, "item") - 1, objc_msgSend(v25, "section"));
        v30 = [v28 messageSelectionStrategy:self itemIDForIndexPath:v29];

        if (v30)
        {
          id v31 = objc_loadWeakRetained((id *)&self->_dataSource);
          [v31 messageSelectionStrategy:self anyExpandedThreadContainsItemID:v30];
        }
        id v9 = v27;
        id v8 = v26;
      }
    }
    BOOL v32 = v12 < 1;
    uint64_t v33 = v12 - 1;
    if (v32)
    {
      uint64_t v13 = 0;
    }
    else
    {
      id v34 = objc_loadWeakRetained((id *)&self->_dataSource);
      v35 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v33, objc_msgSend(v11, "section"));
      uint64_t v13 = [v34 messageSelectionStrategy:self itemIDForIndexPath:v35];
    }
    goto LABEL_39;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MessageSelectionStrategy__itemIDToSelectFromItemID_deletedMessageIDs_withDirection___block_invoke;
  aBlock[3] = &unk_1E6D122A0;
  aBlock[4] = self;
  v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ((v17 & 1) == 0)
  {
    id v36 = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v37 = [v36 numberOfItemsForMessageSelectionStrategy:self] - 1;

    if (v12 < v37)
    {
      id v44 = v8;
      v38 = v9;
      while (1)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", ++v12, objc_msgSend(v11, "section", v44));
        uint64_t v13 = v20[2](v20, v39);

        id v9 = v38;
        if (![v38 containsObject:v13]) {
          break;
        }

        id v40 = objc_loadWeakRetained((id *)&self->_dataSource);
        uint64_t v41 = [v40 numberOfItemsForMessageSelectionStrategy:self] - 1;

        if (v12 >= v41)
        {
          uint64_t v13 = 0;
          id v9 = v38;
          break;
        }
      }
      id v8 = v44;
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_36:
    uint64_t v13 = 0;
    goto LABEL_37;
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v12, objc_msgSend(v11, "section"));
  uint64_t v13 = v20[2](v20, v21);

LABEL_37:
LABEL_39:
  v42 = _ef_log_MessageSelectionStrategy();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    -[MessageSelectionStrategy _itemIDToSelectFromItemID:deletedMessageIDs:withDirection:]((uint64_t)v8, (uint64_t)v13, v42);
  }

LABEL_42:
  return v13;
}

id __86__MessageSelectionStrategy__itemIDToSelectFromItemID_deletedMessageIDs_withDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = [WeakRetained messageSelectionStrategy:*(void *)(a1 + 32) itemIDForIndexPath:v4];

  return v6;
}

- (MessageSelectionStrategyDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (MessageSelectionStrategyDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)initWithDataSource:.cold.1()
{
  __assert_rtn("-[MessageSelectionStrategy initWithDataSource:]", "MessageSelectionStrategy.m", 24, "nil != dataSource");
}

- (void)_itemIDToSelectFromItemID:(uint64_t)a1 deletedMessageIDs:(uint64_t)a2 withDirection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_1(&dword_1DDCDB000, a2, a3, "_itemIDToSelectFromItemID:%{public}@ result:%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_itemIDToSelectFromItemID:(uint64_t)a1 deletedMessageIDs:(uint64_t)a2 withDirection:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_1(&dword_1DDCDB000, a2, a3, "_itemIDToSelectFromItemID:%{public}@ message was deleted. Get the index of where it should have been startIndex:%li", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end