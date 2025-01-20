@interface MessageListThreadHelper
- (BOOL)_isNextItemAnExpandedItemID:(id)a3 snapshot:(id)a4;
- (BOOL)_isNextItemAnExpandedThreadItemID:(id)a3 snapshot:(id)a4;
- (BOOL)isThreadExpandingWithItemID:(id)a3;
- (BOOL)needsFlushSeparatorForItemID:(id)a3 snapshot:(id)a4;
- (MessageListThreadHelper)initWithDelegate:(id)a3;
- (NSMutableSet)collapsingItemIDs;
- (NSMutableSet)expandingItemIDs;
- (NSMutableSet)itemIDsNeedingReloadPostUpdate;
- (id)collapsingOrExpandingItemIDs;
- (id)itemIDsForReloadAfterDeletingItemIDs:(id)a3 snapshot:(id)a4;
- (id)itemIDsForReloadAfterInsertingItemsAfterItemID:(id)a3 snapshot:(id)a4;
- (id)itemIDsInExpandedThread:(id)a3 snapshot:(id)a4;
- (id)popItemIDsNeedingReloadPostUpdate;
- (id)threadItemIDForItemInExpandedThread:(id)a3 snapshot:(id)a4;
- (int64_t)styleForMessageListItem:(id)a3;
- (void)addExpandingThreadWithItemID:(id)a3;
- (void)addItemIDsNeedingReloadPostUpdate:(id)a3;
- (void)collapseMessageListItem:(id)a3;
- (void)expandMessageListItem:(id)a3;
- (void)removeExpandingThreadWithItemID:(id)a3;
- (void)setCollapsingItemIDs:(id)a3;
- (void)setExpandingItemIDs:(id)a3;
- (void)setItemIDsNeedingReloadPostUpdate:(id)a3;
@end

@implementation MessageListThreadHelper

- (int64_t)styleForMessageListItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 itemID];
  if (v5)
  {
    v6 = [(MessageListItemHelper *)self delegate];
    if ((unint64_t)[v4 count] <= 1)
    {
      if ([v6 messageListItemHelper:self anyExpandedThreadContainsItemID:v5]) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = 0;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)needsFlushSeparatorForItemID:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(MessageListItemHelper *)self delegate];
    if ([v8 messageListItemHelper:self anyExpandedThreadContainsItemID:v6]) {
      BOOL v9 = [(MessageListItemHelper *)self _isNextItemLastExpandedItemID:v6 snapshot:v7];
    }
    else {
      BOOL v9 = [(MessageListThreadHelper *)self _isNextItemAnExpandedThreadItemID:v6 snapshot:v7];
    }
    BOOL v10 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_isNextItemAnExpandedThreadItemID:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = [(MessageListItemHelper *)self itemIDAfterItemID:v6 snapshot:a4];

  char v8 = 0;
  if (v7 && v7 != v6)
  {
    BOOL v9 = [(MessageListItemHelper *)self delegate];
    char v8 = [v9 messageListItemHelper:self isItemIDExpandedThread:v7];
  }
  return v8;
}

- (BOOL)isThreadExpandingWithItemID:(id)a3
{
  id v4 = a3;
  v5 = [(MessageListThreadHelper *)self expandingItemIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSMutableSet)expandingItemIDs
{
  return self->_expandingItemIDs;
}

- (id)popItemIDsNeedingReloadPostUpdate
{
  p_itemIDsNeedingReloadLock = &self->_itemIDsNeedingReloadLock;
  os_unfair_lock_lock(&self->_itemIDsNeedingReloadLock);
  id v4 = [(MessageListThreadHelper *)self itemIDsNeedingReloadPostUpdate];
  v5 = [v4 allObjects];

  char v6 = [(MessageListThreadHelper *)self itemIDsNeedingReloadPostUpdate];
  [v6 removeAllObjects];

  os_unfair_lock_unlock(p_itemIDsNeedingReloadLock);
  return v5;
}

- (NSMutableSet)itemIDsNeedingReloadPostUpdate
{
  return self->_itemIDsNeedingReloadPostUpdate;
}

- (MessageListThreadHelper)initWithDelegate:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MessageListThreadHelper;
  v3 = [(MessageListItemHelper *)&v11 initWithDelegate:a3];
  if (v3)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    collapsingItemIDs = v3->_collapsingItemIDs;
    v3->_collapsingItemIDs = v4;

    char v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    expandingItemIDs = v3->_expandingItemIDs;
    v3->_expandingItemIDs = v6;

    char v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemIDsNeedingReloadPostUpdate = v3->_itemIDsNeedingReloadPostUpdate;
    v3->_itemIDsNeedingReloadPostUpdate = v8;

    v3->_itemIDsNeedingReloadLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)collapseMessageListItem:(id)a3
{
  id v4 = a3;
  v5 = [(MessageListThreadHelper *)self collapsingItemIDs];
  char v6 = [v4 itemID];
  [v5 addObject:v6];

  v8.receiver = self;
  v8.super_class = (Class)MessageListThreadHelper;
  id v7 = [(MessageListItemHelper *)&v8 delegate];
  [v7 messageListThreadHelper:self didCollapseMessageListItem:v4];
}

- (void)expandMessageListItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MessageListThreadHelper;
  id v4 = a3;
  v5 = [(MessageListItemHelper *)&v6 delegate];
  objc_msgSend(v5, "messageListThreadHelper:didExpandMessageListItem:", self, v4, v6.receiver, v6.super_class);
}

- (id)collapsingOrExpandingItemIDs
{
  v8.receiver = self;
  v8.super_class = (Class)MessageListThreadHelper;
  v3 = [(MessageListItemHelper *)&v8 delegate];
  id v4 = [(MessageListThreadHelper *)self collapsingItemIDs];
  v5 = [v3 expandedThreadItemIDs];
  objc_super v6 = [v4 setByAddingObjectsFromSet:v5];

  return v6;
}

- (id)itemIDsForReloadAfterInsertingItemsAfterItemID:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MessageListThreadHelper *)self collapsingOrExpandingItemIDs];
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    BOOL v10 = [(MessageListThreadHelper *)self collapsingItemIDs];
    [v10 removeObject:v6];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v11 addObject:v6];
    v12 = [(MessageListItemHelper *)self itemIDBeforeItemID:v6 snapshot:v7];
    v13 = v12;
    if (v12 && ([v12 isEqual:v6] & 1) == 0) {
      [v11 addObject:v13];
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)itemIDsForReloadAfterDeletingItemIDs:(id)a3 snapshot:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MessageListThreadHelper *)self collapsingOrExpandingItemIDs];
  if ([v8 count])
  {
    int v9 = [(MessageListItemHelper *)self delegate];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__MessageListThreadHelper_itemIDsForReloadAfterDeletingItemIDs_snapshot___block_invoke;
    v33[3] = &unk_1E6D121D8;
    id v10 = v9;
    id v34 = v10;
    v35 = self;
    id v11 = objc_msgSend(v6, "ef_filter:", v33);
    if ([v11 count])
    {
      id v26 = v10;
      id v27 = v6;
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v25 = v11;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(id *)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v18 = -[MessageListItemHelper itemIDBeforeItemID:snapshot:](self, "itemIDBeforeItemID:snapshot:", v17, v7, v25);
            id v19 = (id)v18;
            if (v18) {
              BOOL v20 = v18 == (void)v17;
            }
            else {
              BOOL v20 = 1;
            }
            if (!v20)
            {
              while (![v8 containsObject:v19])
              {
                id v21 = v19;
                id v19 = [(MessageListItemHelper *)self itemIDBeforeItemID:v21 snapshot:v7];

                if (v19 == v21) {
                  goto LABEL_19;
                }
                if (!v19 || v19 == v17) {
                  goto LABEL_20;
                }
              }
              [v28 addObject:v19];
              id v21 = [(MessageListItemHelper *)self itemIDBeforeItemID:v19 snapshot:v7];

              if (v21) {
                [v28 addObject:v21];
              }
LABEL_19:

              id v19 = 0;
            }
LABEL_20:
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v14);
      }

      v22 = [(MessageListThreadHelper *)self collapsingItemIDs];
      [v22 minusSet:v28];

      v23 = [v28 allObjects];

      id v10 = v26;
      id v6 = v27;
      id v11 = v25;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

uint64_t __73__MessageListThreadHelper_itemIDsForReloadAfterDeletingItemIDs_snapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) messageListItemHelper:*(void *)(a1 + 40) anyExpandedThreadContainsItemID:a2];
}

- (void)addItemIDsNeedingReloadPostUpdate:(id)a3
{
  id v6 = a3;
  p_itemIDsNeedingReloadLock = &self->_itemIDsNeedingReloadLock;
  os_unfair_lock_lock(&self->_itemIDsNeedingReloadLock);
  v5 = [(MessageListThreadHelper *)self itemIDsNeedingReloadPostUpdate];
  [v5 addObjectsFromArray:v6];

  os_unfair_lock_unlock(p_itemIDsNeedingReloadLock);
}

- (id)itemIDsInExpandedThread:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MessageListItemHelper *)self delegate];
  if ([v8 messageListItemHelper:self isItemIDExpandedThread:v6])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    while (1)
    {
      id v10 = [(MessageListItemHelper *)self itemIDAfterItemID:v6 snapshot:v7];
      if (!v10 || v10 == v6) {
        break;
      }
      id v11 = v6;
      id v6 = v10;

      if (![v8 messageListItemHelper:self anyExpandedThreadContainsItemID:v6])
      {
        id v10 = v6;
        break;
      }
      [v9 addObject:v6];
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)threadItemIDForItemInExpandedThread:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MessageListItemHelper *)self delegate];
  if ([v8 messageListItemHelper:self isItemIDExpandedThread:v6])
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [(MessageListItemHelper *)self itemIDBeforeItemID:v6 snapshot:v7];
    id v9 = 0;
    if (!v10 || v10 == v6)
    {
      id v11 = v6;
    }
    else
    {
      while (1)
      {
        id v11 = v10;
        if ([v8 messageListItemHelper:self isItemIDExpandedThread:v10]) {
          break;
        }

        id v10 = [(MessageListItemHelper *)self itemIDBeforeItemID:v11 snapshot:v7];
        id v9 = 0;
        if (v10)
        {
          id v6 = v11;
          if (v10 != v11) {
            continue;
          }
        }
        goto LABEL_11;
      }
      id v10 = v11;
      id v11 = v6;
      id v9 = v10;
    }
LABEL_11:

    id v6 = v11;
  }

  return v9;
}

- (BOOL)_isNextItemAnExpandedItemID:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = [(MessageListItemHelper *)self itemIDAfterItemID:v6 snapshot:a4];

  char v8 = 0;
  if (v7 && v7 != v6)
  {
    id v9 = [(MessageListItemHelper *)self delegate];
    char v8 = [v9 messageListItemHelper:self isItemIDExpandedThread:v7];
  }
  return v8;
}

- (void)addExpandingThreadWithItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListThreadHelper *)self expandingItemIDs];
  [v5 addObject:v4];
}

- (void)removeExpandingThreadWithItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListThreadHelper *)self expandingItemIDs];
  [v5 removeObject:v4];
}

- (NSMutableSet)collapsingItemIDs
{
  return self->_collapsingItemIDs;
}

- (void)setCollapsingItemIDs:(id)a3
{
}

- (void)setExpandingItemIDs:(id)a3
{
}

- (void)setItemIDsNeedingReloadPostUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIDsNeedingReloadPostUpdate, 0);
  objc_storeStrong((id *)&self->_expandingItemIDs, 0);
  objc_storeStrong((id *)&self->_collapsingItemIDs, 0);
}

@end