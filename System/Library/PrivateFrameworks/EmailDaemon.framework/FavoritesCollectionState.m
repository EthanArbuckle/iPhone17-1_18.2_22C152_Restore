@interface FavoritesCollectionState
+ (OS_os_log)log;
+ (id)displayOrder;
- (BOOL)addExpandedItem:(id)a3;
- (BOOL)addItem:(id)a3 ordered:(BOOL)a4;
- (BOOL)isAccountsCollection;
- (BOOL)isEditing;
- (BOOL)isMailboxesCollection;
- (FavoritesCollectionState)initWithType:(unint64_t)a3;
- (NSArray)expandedItems;
- (NSArray)items;
- (NSArray)selectedItems;
- (NSArray)visibleItems;
- (NSDictionary)expandedItemBySyncKey;
- (id)addOrUpdateExpandedItem:(id)a3 didAdd:(BOOL *)a4 didReplace:(BOOL *)a5;
- (id)addOrUpdateItem:(id)a3 didAdd:(BOOL *)a4 didReplace:(BOOL *)a5;
- (id)dictionaryRepresentations;
- (id)expandedItemWithSyncKey:(id)a3;
- (id)itemWithSyncKey:(id)a3;
- (id)mutableExpandedItemBySyncKey;
- (id)mutableExpandedItems;
- (id)mutableItems;
- (id)orderedAccountIds;
- (id)removeExpandedItem:(id)a3;
- (id)removeItem:(id)a3;
- (id)removeItemWithSyncKey:(id)a3;
- (int64_t)_indexForNewItem:(id)a3;
- (unint64_t)countOfVisibleItems;
- (unint64_t)type;
- (void)_addAccountsCollectionVisibleItemsToArray:(id)a3;
- (void)_addMailboxCollectionVisibleItemsToArray:(id)a3;
- (void)_addSubitems:(id)a3 toArray:(id)a4;
- (void)_addVisibleItem:(id)a3 toArray:(id)a4;
- (void)invalidateVisibleItems;
- (void)setEditing:(BOOL)a3;
- (void)setExpandedItemBySyncKey:(id)a3;
- (void)setExpandedItems:(id)a3;
- (void)setItems:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FavoritesCollectionState

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E444;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B7C0 != -1) {
    dispatch_once(&qword_10016B7C0, block);
  }
  v2 = (void *)qword_10016B7B8;

  return (OS_os_log *)v2;
}

- (FavoritesCollectionState)initWithType:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FavoritesCollectionState;
  v4 = [(FavoritesCollectionState *)&v12 init];
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    items = v4->_items;
    v4->_items = v5;

    v7 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    expandedItems = v4->_expandedItems;
    v4->_expandedItems = v7;

    v9 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    expandedItemBySyncKey = v4->_expandedItemBySyncKey;
    v4->_expandedItemBySyncKey = v9;

    v4->_type = a3;
  }
  return v4;
}

- (id)mutableItems
{
  return self->_items;
}

- (id)mutableExpandedItems
{
  return self->_expandedItems;
}

- (id)mutableExpandedItemBySyncKey
{
  return self->_expandedItemBySyncKey;
}

- (BOOL)isMailboxesCollection
{
  return self->_type == 1;
}

- (BOOL)isAccountsCollection
{
  return self->_type == 3;
}

- (BOOL)addItem:(id)a3 ordered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(FavoritesCollectionState *)self mutableItems];
  unsigned __int8 v8 = [v7 containsObject:v6];
  if ((v8 & 1) == 0)
  {
    if (v4
      && (int64_t v9 = [(FavoritesCollectionState *)self _indexForNewItem:v6], v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      [v7 insertObject:v6 atIndex:v9];
    }
    else
    {
      [v7 addObject:v6];
    }
  }

  return v8 ^ 1;
}

- (BOOL)addExpandedItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 syncKey];

  if (v5)
  {
    id v6 = [(FavoritesCollectionState *)self mutableExpandedItems];
    v7 = [(FavoritesCollectionState *)self mutableExpandedItemBySyncKey];
    unsigned __int8 v8 = [v4 syncKey];
    int64_t v9 = [v7 objectForKeyedSubscript:v8];
    BOOL v10 = v9 == 0;

    if (!v9)
    {
      [v6 addObject:v4];
      v11 = [v4 syncKey];
      [v7 setObject:v4 forKeyedSubscript:v11];
    }
  }
  else
  {
    objc_super v12 = +[FavoritesCollectionState log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v14 = (id)objc_opt_class();
      v15 = objc_msgSend(v4, "ef_publicDescription");
      int v16 = 138412802;
      id v17 = v14;
      __int16 v18 = 2048;
      v19 = self;
      __int16 v20 = 2114;
      v21 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "<%@: %p> Attempting to add an expanded item without a sync key: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)addOrUpdateItem:(id)a3 didAdd:(BOOL *)a4 didReplace:(BOOL *)a5
{
  id v8 = a3;
  int64_t v9 = [(FavoritesCollectionState *)self mutableItems];
  BOOL v10 = [v8 syncKey];
  v11 = [(FavoritesCollectionState *)self itemWithSyncKey:v10];

  if (v11)
  {
    id v12 = [v9 indexOfObject:v11];
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
LABEL_8:
      if (([v8 isEqual:v11] & 1) == 0)
      {
        [v9 replaceObjectAtIndex:v12 withObject:v8];
        if (a5) {
          goto LABEL_10;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v12 = [v9 indexOfObject:v8];
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = [v9 objectAtIndexedSubscript:v12];
      goto LABEL_8;
    }
  }
  [(FavoritesCollectionState *)self addItem:v8 ordered:1];
  v13 = 0;
  a5 = a4;
  if (a4) {
LABEL_10:
  }
    *a5 = 1;
LABEL_11:

  return v13;
}

- (id)addOrUpdateExpandedItem:(id)a3 didAdd:(BOOL *)a4 didReplace:(BOOL *)a5
{
  id v8 = a3;
  int64_t v9 = [v8 syncKey];

  if (v9)
  {
    BOOL v10 = [(FavoritesCollectionState *)self mutableExpandedItems];
    v11 = [(FavoritesCollectionState *)self mutableExpandedItemBySyncKey];
    id v12 = [v8 syncKey];
    v13 = [(FavoritesCollectionState *)self expandedItemWithSyncKey:v12];

    if (v13)
    {
      id v14 = [v10 indexOfObject:v13];
      if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = 0;
LABEL_12:
        id v17 = [v10 objectAtIndex:v14];
        __int16 v18 = [v17 syncKey];

        [v10 replaceObjectAtIndex:v14 withObject:v8];
        [v11 setObject:0 forKeyedSubscript:v18];
        v19 = [v8 syncKey];
        [v11 setObject:v8 forKeyedSubscript:v19];

        if (a5) {
          *a5 = 1;
        }

LABEL_15:
        goto LABEL_16;
      }
    }
    else
    {
      id v14 = [v10 indexOfObject:v8];
      if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = [v10 objectAtIndexedSubscript:v14];
        goto LABEL_12;
      }
    }
    [(FavoritesCollectionState *)self addExpandedItem:v8];
    v15 = 0;
    if (a4) {
      *a4 = 1;
    }
    goto LABEL_15;
  }
  int v16 = +[FavoritesCollectionState log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    id v21 = (id)objc_opt_class();
    v22 = objc_msgSend(v8, "ef_publicDescription");
    int v23 = 138412802;
    id v24 = v21;
    __int16 v25 = 2048;
    v26 = self;
    __int16 v27 = 2114;
    v28 = v22;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "<%@: %p> Attempting to add/update an expanded item without a sync key: %{public}@", (uint8_t *)&v23, 0x20u);
  }
  v15 = 0;
LABEL_16:

  return v15;
}

+ (id)displayOrder
{
  if (qword_10016B7D0 != -1) {
    dispatch_once(&qword_10016B7D0, &stru_10013A698);
  }
  v2 = (void *)qword_10016B7C8;

  return v2;
}

- (int64_t)_indexForNewItem:(id)a3
{
  id v4 = a3;
  if (qword_10016B7E0 != -1) {
    dispatch_once(&qword_10016B7E0, &stru_10013A6B8);
  }
  v5 = [(FavoritesCollectionState *)self items];
  if ([v5 count])
  {
    id v6 = +[FavoritesCollectionState displayOrder];
    id v7 = [v6 indexOfObject:objc_opt_class()];
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= (unint64_t)[v5 count])
      {
        unint64_t i = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_12;
      }
      int64_t v9 = [v5 objectAtIndexedSubscript:i];
      if (([v9 isEqual:qword_10016B7D8] & 1) == 0
        && (uint64_t)v7 < (uint64_t)[v6 indexOfObject:objc_opt_class()])
      {
        break;
      }
    }
LABEL_12:
  }
  else
  {
    unint64_t i = 0x7FFFFFFFFFFFFFFFLL;
  }

  return i;
}

- (id)itemWithSyncKey:(id)a3
{
  id v4 = a3;
  v5 = [(FavoritesCollectionState *)self items];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F120;
  v10[3] = &unk_10013A6E0;
  id v6 = v4;
  id v11 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v10];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 objectAtIndex:v7];
  }

  return v8;
}

- (id)expandedItemWithSyncKey:(id)a3
{
  id v4 = a3;
  v5 = [(FavoritesCollectionState *)self expandedItemBySyncKey];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)removeItemWithSyncKey:(id)a3
{
  id v4 = a3;
  v5 = [(FavoritesCollectionState *)self mutableItems];
  id v6 = [(FavoritesCollectionState *)self itemWithSyncKey:v4];
  if (v6) {
    [v5 removeObject:v6];
  }

  return v6;
}

- (void)_addSubitems:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        -[FavoritesCollectionState _addVisibleItem:toArray:](self, "_addVisibleItem:toArray:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), v7, (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_addVisibleItem:(id)a3 toArray:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 isVisible])
  {
    [v6 addObject:v11];
    id v7 = [v11 subItems];
    id v8 = [v7 count];

    if ([(FavoritesCollectionState *)self isEditing]
      || ([v11 isExpandable] & 1) == 0)
    {
      if (![(FavoritesCollectionState *)self isEditing]) {
        goto LABEL_11;
      }
      unsigned int v9 = [v11 isExpandableInEditMode];
    }
    else
    {
      unsigned int v9 = 1;
    }
    if (v8 && v9 && [v11 isExpanded])
    {
      uint64_t v10 = [v11 subItems];
      [(FavoritesCollectionState *)self _addSubitems:v10 toArray:v6];
    }
  }
LABEL_11:
}

- (void)_addMailboxCollectionVisibleItemsToArray:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(FavoritesCollectionState *)self items];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned int v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (-[FavoritesCollectionState isEditing](self, "isEditing") || [v9 isSelected]) {
          [(FavoritesCollectionState *)self _addVisibleItem:v9 toArray:v4];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_addAccountsCollectionVisibleItemsToArray:(id)a3
{
  id v4 = a3;
  [(FavoritesCollectionState *)self items];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  id v8 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v11 isVisible])
        {
          id v12 = v11;

          ++v6;
          uint64_t v7 = v12;
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  unsigned int v13 = [(FavoritesCollectionState *)self isEditing];
  if (v6 == 1) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 == 1)
  {
    [v7 setExpanded:1];
LABEL_16:
    id v15 = [v7 subItems];
    [(FavoritesCollectionState *)self _addSubitems:v15 toArray:v4];
    goto LABEL_17;
  }
  if (v6 == 1) {
    goto LABEL_16;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v15 = v5;
  id v16 = [v15 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        -[FavoritesCollectionState _addVisibleItem:toArray:](self, "_addVisibleItem:toArray:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), v4, (void)v19);
      }
      id v16 = [v15 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
LABEL_17:
}

- (id)removeItem:(id)a3
{
  id v4 = a3;
  id v5 = [(FavoritesCollectionState *)self mutableItems];
  if ([v5 containsObject:v4])
  {
    [v5 removeObject:v4];
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)removeExpandedItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 syncKey];

  if (v5)
  {
    id v6 = [(FavoritesCollectionState *)self mutableExpandedItems];
    uint64_t v7 = [(FavoritesCollectionState *)self mutableExpandedItemBySyncKey];
    id v8 = [v4 syncKey];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      [v6 removeObject:v4];
      long long v10 = [v4 syncKey];
      [v7 setObject:0 forKeyedSubscript:v10];

      id v9 = v4;
    }
  }
  else
  {
    long long v11 = +[FavoritesCollectionState log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = (id)objc_opt_class();
      unsigned int v14 = objc_msgSend(v4, "ef_publicDescription");
      int v15 = 138412802;
      id v16 = v13;
      __int16 v17 = 2048;
      __int16 v18 = self;
      __int16 v19 = 2114;
      long long v20 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "<%@: %p> Attempting to remove an expanded item without a sync key: %{public}@", (uint8_t *)&v15, 0x20u);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(FavoritesCollectionState *)self items];
  id v6 = [(FavoritesCollectionState *)self expandedItems];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
        if (v11) {
          [v3 addObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)j), "dictionaryRepresentationRemovingSyncKeys", (void)v19);
        if (v16) {
          [v4 addObject:v16];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v13);
  }

  if (_os_feature_enabled_impl())
  {
    v29[0] = @"items";
    v29[1] = @"expandedItems";
    v30[0] = v3;
    v30[1] = v4;
    +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  }
  else
  {
    CFStringRef v27 = @"items";
    id v28 = v3;
    +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  __int16 v17 = };

  return v17;
}

- (id)orderedAccountIds
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(FavoritesCollectionState *)self items];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) account];
        uint64_t v9 = [v8 uniqueID];

        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v3;
}

- (NSArray)selectedItems
{
  selectedItems = self->_selectedItems;
  if (!selectedItems)
  {
    id v4 = [(FavoritesCollectionState *)self items];
    objc_msgSend(v4, "ef_filter:", &stru_10013A720);
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_selectedItems;
    self->_selectedItems = v5;

    selectedItems = self->_selectedItems;
  }
  id v7 = [(NSArray *)selectedItems copy];

  return (NSArray *)v7;
}

- (NSArray)visibleItems
{
  visibleItems = self->_visibleItems;
  if (!visibleItems)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    if ([(FavoritesCollectionState *)self isMailboxesCollection])
    {
      [(FavoritesCollectionState *)self _addMailboxCollectionVisibleItemsToArray:v4];
    }
    else if ([(FavoritesCollectionState *)self isAccountsCollection])
    {
      [(FavoritesCollectionState *)self _addAccountsCollectionVisibleItemsToArray:v4];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = [(FavoritesCollectionState *)self items];
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v14;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v5);
            }
            [(FavoritesCollectionState *)self _addVisibleItem:*(void *)(*((void *)&v13 + 1) + 8 * (void)v8) toArray:v4];
            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }
    }
    uint64_t v9 = (NSArray *)[v4 copy];
    long long v11 = self->_visibleItems;
    p_visibleItems = &self->_visibleItems;
    *p_visibleItems = v9;

    visibleItems = *p_visibleItems;
  }

  return visibleItems;
}

- (void)invalidateVisibleItems
{
  id v3 = +[FavoritesCollectionState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000C0684((uint64_t)self, v3);
  }

  visibleItems = self->_visibleItems;
  self->_visibleItems = 0;

  selectedItems = self->_selectedItems;
  self->_selectedItems = 0;
}

- (void)setItems:(id)a3
{
  id v5 = a3;
  id v4 = [(FavoritesCollectionState *)self mutableItems];
  [v4 setArray:v5];
}

- (void)setExpandedItems:(id)a3
{
  id v8 = a3;
  id v4 = [(FavoritesCollectionState *)self mutableExpandedItems];
  [v4 setArray:v8];

  id v5 = [(FavoritesCollectionState *)self mutableExpandedItemBySyncKey];
  id v6 = [v8 valueForKey:@"syncKey"];
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v6];
  [v5 setDictionary:v7];
}

- (unint64_t)countOfVisibleItems
{
  v2 = [(FavoritesCollectionState *)self items];
  id v3 = objc_msgSend(v2, "ef_countObjectsPassingTest:", &stru_10013A740);

  return (unint64_t)v3;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)expandedItems
{
  return self->_expandedItems;
}

- (NSDictionary)expandedItemBySyncKey
{
  return self->_expandedItemBySyncKey;
}

- (void)setExpandedItemBySyncKey:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedItemBySyncKey, 0);
  objc_storeStrong((id *)&self->_expandedItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedItems, 0);

  objc_storeStrong((id *)&self->_visibleItems, 0);
}

@end