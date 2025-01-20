@interface MessageListSelectionModel
- (BOOL)_allChildrenSelected:(id)a3;
- (BOOL)_trackItemIDs:(id)a3 updateCount:(BOOL)a4;
- (BOOL)_untrackItemIDs:(id)a3 updateCount:(BOOL)a4;
- (BOOL)isMultipleSelectionActive;
- (BOOL)isPerformingDataSourceUpdates;
- (BOOL)isSelectAll;
- (BOOL)isSelectedItemID:(id)a3;
- (BOOL)isSelectionValid;
- (BOOL)shouldRestoreSelection;
- (EFCancelable)restoreSelectionCancelable;
- (EFDebouncer)predictionDebouncer;
- (EFFuture)mailboxPredictionFuture;
- (EMMailbox)predictedMoveMailbox;
- (MessageListSelectionModel)initWithDataSource:(id)a3 delegate:(id)a4;
- (MessageListSelectionModelDataSource)dataSource;
- (MessageListSelectionModelDelegate)delegate;
- (NSArray)trackedMailboxes;
- (NSMutableSet)itemIDsMissingMessageListItem;
- (NSMutableSet)itemIDsPendingConfiguration;
- (NSMutableSet)itemsToDeselectAfterMultipleSelection;
- (NSString)ef_publicDescription;
- (TrackedMessageListItems)trackedItems;
- (id)cascadedItemIDsForItemID:(id)a3 isSelecting:(BOOL)a4;
- (id)currentMessageListItemSelection;
- (id)deselectItemWithItemID:(id)a3;
- (id)itemIDs;
- (id)itemIDsToUnselectForItemID:(id)a3;
- (id)selectItemWithItemID:(id)a3;
- (id)selectionWithMessageListItems:(id)a3 mailboxes:(id)a4;
- (int64_t)count;
- (int64_t)preserveSelectionTimeout;
- (int64_t)trackedItemsArchiveByDefault;
- (int64_t)trackedItemsCount;
- (int64_t)trackedItemsSupportArchiving;
- (int64_t)trackedItemsWillMoveToTrash;
- (int64_t)type;
- (unint64_t)deleteSelectionState;
- (void)__updatePredictionWithSelection:(id)a3;
- (void)_fetchMissingMessageListItems;
- (void)_scheduleMailboxPredictionUpdate;
- (void)_untrackAllItemIDs;
- (void)configureSelectionForItemID:(id)a3;
- (void)didExpandThreadItemID:(id)a3 addedItemIDs:(id)a4;
- (void)disableSelectAll;
- (void)enableSelectAllWithMailboxes:(id)a3;
- (void)preserveSelection;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemIDsMissingMessageListItem:(id)a3;
- (void)setItemIDsPendingConfiguration:(id)a3;
- (void)setMailboxPredictionFuture:(id)a3;
- (void)setMultipleSelectionActive:(BOOL)a3;
- (void)setPerformingDataSourceUpdates:(BOOL)a3;
- (void)setPredictionDebouncer:(id)a3;
- (void)setRestoreSelectionCancelable:(id)a3;
- (void)setShouldRestoreSelection:(BOOL)a3;
- (void)setTrackedItems:(id)a3;
- (void)setTrackedItemsArchiveByDefault:(int64_t)a3;
- (void)setTrackedItemsCount:(int64_t)a3;
- (void)setTrackedItemsSupportArchiving:(int64_t)a3;
- (void)setTrackedItemsWillMoveToTrash:(int64_t)a3;
- (void)setTrackedMailboxes:(id)a3;
- (void)setType:(int64_t)a3;
- (void)willCollapseThreadItemID:(id)a3;
@end

@implementation MessageListSelectionModel

uint64_t ___ef_log_MessageListSelectionModel_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MessageListSelectionModel");
  uint64_t v1 = _ef_log_MessageListSelectionModel_log;
  _ef_log_MessageListSelectionModel_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MessageListSelectionModel)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MessageListSelectionModel;
  v8 = [(MessageListSelectionModel *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = objc_alloc_init(TrackedMessageListItems);
    trackedItems = v9->_trackedItems;
    v9->_trackedItems = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemIDsPendingConfiguration = v9->_itemIDsPendingConfiguration;
    v9->_itemIDsPendingConfiguration = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemIDsMissingMessageListItem = v9->_itemIDsMissingMessageListItem;
    v9->_itemIDsMissingMessageListItem = v14;

    v9->_type = 0;
  }

  return v9;
}

- (int64_t)count
{
  if ([(MessageListSelectionModel *)self type]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(MessageListSelectionModel *)self trackedItemsCount];
}

- (id)itemIDs
{
  BOOL v3 = [(MessageListSelectionModel *)self isSelectAll];
  v4 = [(MessageListSelectionModel *)self trackedItems];
  v5 = [v4 itemIDs];

  if (v3)
  {
    id v6 = [(MessageListSelectionModel *)self dataSource];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__MessageListSelectionModel_itemIDs__block_invoke;
    v10[3] = &unk_1E6D121D8;
    id v11 = v6;
    v12 = self;
    id v7 = v6;
    uint64_t v8 = objc_msgSend(v5, "ef_filter:", v10);

    v5 = (void *)v8;
  }
  return v5;
}

uint64_t __36__MessageListSelectionModel_itemIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) selectionModel:*(void *)(a1 + 40) isItemIDExpandedThread:a2] ^ 1;
}

- (BOOL)isSelectAll
{
  return [(MessageListSelectionModel *)self type] == 1;
}

- (BOOL)isSelectionValid
{
  if ([(MessageListSelectionModel *)self isSelectAll]) {
    return 1;
  }
  v4 = [(MessageListSelectionModel *)self itemIDs];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (id)currentMessageListItemSelection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MessageListSelectionModel *)self trackedItems];
  v4 = [v3 messageListItems];
  uint64_t v5 = [v4 count];
  if (v5 != [v3 count])
  {
    id v6 = _ef_log_MessageListSelectionModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = [v3 count];
      int v13 = 138543874;
      v14 = v11;
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2048;
      uint64_t v18 = v12 - [v4 count];
      _os_log_error_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Message list selection is missing %lu items", (uint8_t *)&v13, 0x20u);
    }
  }
  id v7 = [(MessageListSelectionModel *)self trackedMailboxes];
  uint64_t v8 = [(MessageListSelectionModel *)self selectionWithMessageListItems:v4 mailboxes:v7];

  return v8;
}

- (id)selectionWithMessageListItems:(id)a3 mailboxes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MessageListSelectionModel *)self isSelectionValid]
    && ([v6 count] || -[MessageListSelectionModel isSelectAll](self, "isSelectAll"))
    && ([v7 count] || !-[MessageListSelectionModel isSelectAll](self, "isSelectAll")))
  {
    BOOL v9 = [(MessageListSelectionModel *)self isSelectAll];
    id v10 = objc_alloc(MEMORY[0x1E4F73E58]);
    if (v9) {
      uint64_t v11 = [v10 initWithMailboxes:v7 excludedMessageListItems:v6];
    }
    else {
      uint64_t v11 = [v10 initWithMessageListItems:v6];
    }
    uint64_t v8 = (void *)v11;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)deleteSelectionState
{
  unint64_t result = [(MessageListSelectionModel *)self count];
  if (result)
  {
    int64_t v4 = [(MessageListSelectionModel *)self count];
    BOOL v5 = v4 == [(MessageListSelectionModel *)self trackedItemsWillMoveToTrash];
    int64_t v6 = [(MessageListSelectionModel *)self count];
    BOOL v7 = v6 == [(MessageListSelectionModel *)self trackedItemsSupportArchiving];
    int64_t v8 = [(MessageListSelectionModel *)self count];
    return (v5 || 4 * v7) | (2
                           * (v8 == [(MessageListSelectionModel *)self trackedItemsArchiveByDefault]));
  }
  return result;
}

- (id)cascadedItemIDsForItemID:(id)a3 isSelecting:(BOOL)a4
{
  int v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int64_t v8 = [(MessageListSelectionModel *)self dataSource];
  if ([v8 selectionModel:self isThreadedItemID:v7])
  {
    int v9 = [v8 selectionModel:self isItemIDExpandedThread:v7];
    id v10 = _ef_log_MessageListSelectionModel();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      int v21 = 138544386;
      v22 = v11;
      __int16 v23 = 2114;
      id v24 = v7;
      __int16 v25 = 1024;
      int v26 = v4;
      __int16 v27 = 1024;
      int v28 = 1;
      __int16 v29 = 1024;
      LODWORD(v30) = v9;
      _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - itemID: %{public}@, isSelecting: %{BOOL}d, isThread: %{BOOL}d, isExpanded: %{BOOL}d", (uint8_t *)&v21, 0x28u);
    }
    if (v9)
    {
      uint64_t v12 = [v8 selectionModel:self itemIDsInExpandedThread:v7];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    int v13 = [v8 selectionModel:self threadItemIDForItemInExpandedThread:v7];
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v15 = [v8 selectionModel:self itemIDsInExpandedThread:v13];
      v16 = [v14 setWithArray:v15];

      int v17 = [(MessageListSelectionModel *)self _allChildrenSelected:v16];
      uint64_t v18 = _ef_log_MessageListSelectionModel();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = NSStringFromSelector(a2);
        int v21 = 138544642;
        v22 = v19;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 1024;
        int v26 = v4;
        __int16 v27 = 1024;
        int v28 = v17;
        __int16 v29 = 2114;
        v30 = v13;
        __int16 v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_1DDCDB000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - itemID: %{public}@, isSelecting: %{BOOL}d, allChildrenSelected: %{BOOL}d, parent: %{public}@, children: %{public}@", (uint8_t *)&v21, 0x36u);
      }
      if (v17 == v4)
      {
        uint64_t v12 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v13];
      }
      else
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v12;
}

- (id)itemIDsToUnselectForItemID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MessageListSelectionModel *)self dataSource];
  if ([v5 selectionModel:self isThreadedItemID:v4]
    && [v5 selectionModel:self isItemIDExpandedThread:v4])
  {
    int64_t v6 = [v5 selectionModel:self itemIDsInExpandedThread:v4];
  }
  else
  {
    int64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (BOOL)_allChildrenSelected:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MessageListSelectionModel *)self trackedItems];
  int64_t v6 = [v5 itemIDsSet];

  if ([(MessageListSelectionModel *)self isSelectAll])
  {
    if ([v6 count]) {
      int v7 = [v6 intersectsSet:v4] ^ 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = [v4 isSubsetOfSet:v6];
  }

  return v7;
}

- (void)_fetchMissingMessageListItems
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 itemIDsMissingMessageListItem];
    BOOL v3 = [v2 allObjects];

    if ([v3 count])
    {
      id v4 = _ef_log_MessageListSelectionModel();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v5 = (objc_class *)objc_opt_class();
        int64_t v6 = NSStringFromClass(v5);
        *(_DWORD *)buf = 138544130;
        __int16 v29 = v6;
        __int16 v30 = 2048;
        __int16 v31 = a1;
        __int16 v32 = 2048;
        uint64_t v33 = [v3 count];
        __int16 v34 = 2114;
        v35 = v3;
        _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Fetch message list items for item ids (%lu): %{public}@", buf, 0x2Au);
      }
      int v7 = [a1 itemIDsMissingMessageListItem];
      [v7 removeAllObjects];

      int64_t v8 = [a1 trackedItems];
      int v9 = [a1 dataSource];
      id v10 = a1;
      uint64_t v11 = [v9 selectionModel:a1 messageListItemsForItemIDs:v3];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id obj = v11;
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            int v17 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke;
            v21[3] = &unk_1E6D12200;
            id v22 = v8;
            [v16 onScheduler:v17 addSuccessBlock:v21];

            uint64_t v18 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2;
            v20[3] = &unk_1E6D12228;
            v20[4] = v10;
            [v16 onScheduler:v18 addFailureBlock:v20];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }
    }
  }
}

uint64_t __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateMessageListItem:a2];
}

void __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ef_log_MessageListSelectionModel();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2_cold_1(a1, v3, v4);
  }
}

- (BOOL)_trackItemIDs:(id)a3 updateCount:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    int v7 = [(MessageListSelectionModel *)self trackedItems];
    int64_t v8 = [v7 itemIDsSet];
    int v9 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    [v9 minusSet:v8];
    if ([v9 count])
    {
      id v10 = [v9 allObjects];
      uint64_t v11 = [(MessageListSelectionModel *)self dataSource];
      v40 = v11;
      v41 = v10;
      if ([(MessageListSelectionModel *)self isPerformingDataSourceUpdates])
      {
        uint64_t v12 = _ef_log_MessageListSelectionModel();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = (objc_class *)objc_opt_class();
          uint64_t v14 = NSStringFromClass(v13);
          *(_DWORD *)buf = 138544130;
          v53 = v14;
          __int16 v54 = 2048;
          v55 = self;
          __int16 v56 = 2048;
          uint64_t v57 = [v10 count];
          __int16 v58 = 2114;
          v59 = v10;
          _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Data source is performing updates, load message list items (%lu) once completed: %{public}@", buf, 0x2Au);
        }
        __int16 v15 = [(MessageListSelectionModel *)self itemIDsMissingMessageListItem];
        [v15 addObjectsFromArray:v10];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v16 = v10;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v47 != v19) {
                objc_enumerationMutation(v16);
              }
              [v7 trackMessageListItemWithItemID:*(void *)(*((void *)&v46 + 1) + 8 * i)];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v18);
        }
      }
      else
      {
        v37 = v9;
        id v38 = v6;
        BOOL v39 = v4;
        int v21 = [v11 selectionModel:self messageListItemsForItemIDs:v10];
        id v22 = objc_msgSend(v21, "ef_map:", &__block_literal_global_48);

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v16 = v22;
        uint64_t v23 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v43;
          uint64_t v26 = *MEMORY[0x1E4F60CE8];
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v16);
              }
              uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * j);
              if ((*(unsigned int (**)(uint64_t, uint64_t))(v26 + 16))(v26, v28))
              {
                [v7 trackmessageListItem:v28];
              }
              else
              {
                __int16 v29 = _ef_log_MessageListSelectionModel();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  __int16 v30 = (objc_class *)objc_opt_class();
                  __int16 v31 = NSStringFromClass(v30);
                  *(_DWORD *)buf = 138543618;
                  v53 = v31;
                  __int16 v54 = 2048;
                  v55 = self;
                  _os_log_error_impl(&dword_1DDCDB000, v29, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Skip tracking message -- message is null", buf, 0x16u);
                }
              }
            }
            uint64_t v24 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v24);
        }

        BOOL v4 = v39;
        id v6 = v38;
        int v9 = v37;
      }

      if (v4)
      {
        __int16 v32 = [v9 allObjects];
        -[MessageListSelectionModel setTrackedItemsCount:](self, "setTrackedItemsCount:", -[MessageListSelectionModel trackedItemsCount](self, "trackedItemsCount")+ [v40 selectionModel:self countForItemIDs:v32]);

        uint64_t v33 = [v9 allObjects];
        -[MessageListSelectionModel setTrackedItemsWillMoveToTrash:](self, "setTrackedItemsWillMoveToTrash:", -[MessageListSelectionModel trackedItemsWillMoveToTrash](self, "trackedItemsWillMoveToTrash")+ [v40 selectionModel:self countDeleteMovesToTrashForItemIDs:v33]);

        __int16 v34 = [v9 allObjects];
        -[MessageListSelectionModel setTrackedItemsSupportArchiving:](self, "setTrackedItemsSupportArchiving:", -[MessageListSelectionModel trackedItemsSupportArchiving](self, "trackedItemsSupportArchiving")+ [v40 selectionModel:self countSupportsArchivingForItemIDs:v34]);

        v35 = [v9 allObjects];
        -[MessageListSelectionModel setTrackedItemsArchiveByDefault:](self, "setTrackedItemsArchiveByDefault:", -[MessageListSelectionModel trackedItemsArchiveByDefault](self, "trackedItemsArchiveByDefault")+ [v40 selectionModel:self countShouldArchiveByDefaultForItemIDs:v35]);
      }
      [(MessageListSelectionModel *)self _scheduleMailboxPredictionUpdate];
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

uint64_t __55__MessageListSelectionModel__trackItemIDs_updateCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 result];
}

- (BOOL)_untrackItemIDs:(id)a3 updateCount:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    int v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    int64_t v8 = [(MessageListSelectionModel *)self trackedItems];
    int v9 = [v8 itemIDsSet];
    [v7 intersectSet:v9];
    if ([v7 count])
    {
      id v10 = [v7 allObjects];
      [v8 untrackMessageListItemsWithItemIDs:v10];

      if (v4)
      {
        uint64_t v11 = [(MessageListSelectionModel *)self dataSource];
        uint64_t v12 = [v7 allObjects];
        -[MessageListSelectionModel setTrackedItemsCount:](self, "setTrackedItemsCount:", -[MessageListSelectionModel trackedItemsCount](self, "trackedItemsCount")- [v11 selectionModel:self countForItemIDs:v12]);

        uint64_t v13 = [v7 allObjects];
        -[MessageListSelectionModel setTrackedItemsWillMoveToTrash:](self, "setTrackedItemsWillMoveToTrash:", -[MessageListSelectionModel trackedItemsWillMoveToTrash](self, "trackedItemsWillMoveToTrash")- [v11 selectionModel:self countDeleteMovesToTrashForItemIDs:v13]);

        uint64_t v14 = [v7 allObjects];
        -[MessageListSelectionModel setTrackedItemsSupportArchiving:](self, "setTrackedItemsSupportArchiving:", -[MessageListSelectionModel trackedItemsSupportArchiving](self, "trackedItemsSupportArchiving")- [v11 selectionModel:self countSupportsArchivingForItemIDs:v14]);

        __int16 v15 = [v7 allObjects];
        -[MessageListSelectionModel setTrackedItemsArchiveByDefault:](self, "setTrackedItemsArchiveByDefault:", -[MessageListSelectionModel trackedItemsArchiveByDefault](self, "trackedItemsArchiveByDefault")- [v11 selectionModel:self countShouldArchiveByDefaultForItemIDs:v15]);
      }
      [(MessageListSelectionModel *)self _scheduleMailboxPredictionUpdate];
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_untrackAllItemIDs
{
  id v3 = [(MessageListSelectionModel *)self trackedItems];
  [v3 untrackAllMessageListItems];

  [(MessageListSelectionModel *)self setTrackedItemsCount:0];
  [(MessageListSelectionModel *)self setTrackedItemsWillMoveToTrash:0];
  [(MessageListSelectionModel *)self setTrackedItemsSupportArchiving:0];
  [(MessageListSelectionModel *)self setTrackedItemsArchiveByDefault:0];
  [(MessageListSelectionModel *)self _scheduleMailboxPredictionUpdate];
}

- (id)selectItemWithItemID:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(MessageListSelectionModel *)self isSelectAll];
    id v6 = [(MessageListSelectionModel *)self itemIDsToUnselectForItemID:v4];
    if (v5)
    {
      [(MessageListSelectionModel *)self _trackItemIDs:v6 updateCount:1];
      v14[0] = v4;
      int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      BOOL v8 = [(MessageListSelectionModel *)self _untrackItemIDs:v7 updateCount:1];

      int v9 = [(MessageListSelectionModel *)self cascadedItemIDsForItemID:v4 isSelecting:1];
      [(MessageListSelectionModel *)self _untrackItemIDs:v9 updateCount:!v8];
    }
    else
    {
      [(MessageListSelectionModel *)self _untrackItemIDs:v6 updateCount:1];
      id v13 = v4;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      BOOL v11 = [(MessageListSelectionModel *)self _trackItemIDs:v10 updateCount:1];

      int v9 = [(MessageListSelectionModel *)self cascadedItemIDsForItemID:v4 isSelecting:1];
      [(MessageListSelectionModel *)self _trackItemIDs:v9 updateCount:!v11];
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)deselectItemWithItemID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(MessageListSelectionModel *)self isSelectAll])
    {
      v12[0] = v4;
      BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      BOOL v6 = [(MessageListSelectionModel *)self _trackItemIDs:v5 updateCount:1];

      int v7 = [(MessageListSelectionModel *)self cascadedItemIDsForItemID:v4 isSelecting:0];
      [(MessageListSelectionModel *)self _trackItemIDs:v7 updateCount:!v6];
    }
    else
    {
      id v11 = v4;
      BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      BOOL v9 = [(MessageListSelectionModel *)self _untrackItemIDs:v8 updateCount:1];

      int v7 = [(MessageListSelectionModel *)self cascadedItemIDsForItemID:v4 isSelecting:0];
      [(MessageListSelectionModel *)self _untrackItemIDs:v7 updateCount:!v9];
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void)willCollapseThreadItemID:(id)a3
{
  id v8 = a3;
  id v4 = -[MessageListSelectionModel cascadedItemIDsForItemID:isSelecting:](self, "cascadedItemIDsForItemID:isSelecting:");
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
  if (![(MessageListSelectionModel *)self _allChildrenSelected:v5])
  {
    id v6 = [(MessageListSelectionModel *)self deselectItemWithItemID:v8];
    int v7 = [(MessageListSelectionModel *)self delegate];
    [v7 selectionModel:self deselectItemID:v8];
  }
  [(MessageListSelectionModel *)self _untrackItemIDs:v4 updateCount:0];
}

- (void)didExpandThreadItemID:(id)a3 addedItemIDs:(id)a4
{
  id v6 = a4;
  if ([(MessageListSelectionModel *)self isSelectedItemID:a3])
  {
    if ([(MessageListSelectionModel *)self isSelectAll]) {
      [(MessageListSelectionModel *)self _untrackItemIDs:v6 updateCount:0];
    }
    else {
      [(MessageListSelectionModel *)self _trackItemIDs:v6 updateCount:0];
    }
  }
}

- (BOOL)isSelectedItemID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MessageListSelectionModel *)self trackedItems];
  char v6 = [v5 hasMessageListItemForItemID:v4];

  return v6 ^ [(MessageListSelectionModel *)self isSelectAll];
}

- (void)configureSelectionForItemID:(id)a3
{
  id v6 = a3;
  if ([(MessageListSelectionModel *)self isPerformingDataSourceUpdates])
  {
    id v4 = [(MessageListSelectionModel *)self itemIDsPendingConfiguration];
    [v4 addObject:v6];
  }
  else
  {
    id v4 = [(MessageListSelectionModel *)self delegate];
    if ([(MessageListSelectionModel *)self isSelectedItemID:v6]) {
      [v4 selectionModel:self selectItemID:v6];
    }
    else {
      [v4 selectionModel:self deselectItemID:v6];
    }
    BOOL v5 = [(MessageListSelectionModel *)self itemIDsPendingConfiguration];
    [v5 removeObject:v6];
  }
}

- (void)setPerformingDataSourceUpdates:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_performingDataSourceUpdates != a3)
  {
    self->_performingDataSourceUpdates = a3;
    if (!a3)
    {
      id v4 = [(MessageListSelectionModel *)self itemIDsPendingConfiguration];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        id v6 = [(MessageListSelectionModel *)self itemIDsPendingConfiguration];
        int v7 = (void *)[v6 mutableCopy];

        id v8 = [(MessageListSelectionModel *)self trackedItems];
        BOOL v9 = [v8 itemIDs];
        [v7 addObjectsFromArray:v9];

        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v10 = v7;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              -[MessageListSelectionModel configureSelectionForItemID:](self, "configureSelectionForItemID:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v12);
        }
      }
      -[MessageListSelectionModel _fetchMissingMessageListItems](self);
    }
  }
}

- (void)setMultipleSelectionActive:(BOOL)a3
{
  if (self->_multipleSelectionActive != a3)
  {
    id v3 = self;
    self->_multipleSelectionActive = a3;
    if (a3)
    {
      self = (MessageListSelectionModel *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      itemsToDeselectAfterMultipleSelection = v3->_itemsToDeselectAfterMultipleSelection;
      v3->_itemsToDeselectAfterMultipleSelection = (NSMutableSet *)self;
    }
    else
    {
      itemsToDeselectAfterMultipleSelection = self->_itemsToDeselectAfterMultipleSelection;
      self->_itemsToDeselectAfterMultipleSelection = 0;
    }
    MEMORY[0x1F41817F8](self, itemsToDeselectAfterMultipleSelection);
  }
}

- (EMMailbox)predictedMoveMailbox
{
  if ([(MessageListSelectionModel *)self type])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(MessageListSelectionModel *)self mailboxPredictionFuture];
    id v3 = [v4 resultIfAvailable];
  }
  return (EMMailbox *)v3;
}

- (void)_scheduleMailboxPredictionUpdate
{
  if ([(MessageListSelectionModel *)self isSelectAll]
    || ([(MessageListSelectionModel *)self trackedItems],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        !v4))
  {
    [(MessageListSelectionModel *)self setMailboxPredictionFuture:0];
  }
  else
  {
    uint64_t v5 = [(MessageListSelectionModel *)self predictionDebouncer];

    if (!v5)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      id v6 = objc_alloc(MEMORY[0x1E4F60D50]);
      int v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __61__MessageListSelectionModel__scheduleMailboxPredictionUpdate__block_invoke;
      long long v15 = &unk_1E6D12250;
      objc_copyWeak(&v16, &location);
      id v8 = (void *)[v6 initWithTimeInterval:v7 scheduler:0 startAfter:&v12 block:0.25];
      -[MessageListSelectionModel setPredictionDebouncer:](self, "setPredictionDebouncer:", v8, v12, v13, v14, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    BOOL v9 = [(MessageListSelectionModel *)self trackedItems];
    id v10 = [v9 itemIDs];

    uint64_t v11 = [(MessageListSelectionModel *)self predictionDebouncer];
    [v11 debounceResult:v10];
  }
}

void __61__MessageListSelectionModel__scheduleMailboxPredictionUpdate__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "__updatePredictionWithSelection:", v3);
}

- (void)__updatePredictionWithSelection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MessageListSelectionModel *)self dataSource];
  id v6 = [v5 selectionModel:self objectIDsForItemIDs:v4];
  int v7 = objc_msgSend(NSString, "ef_UUID");
  id v8 = _ef_log_MessageListSelectionModel();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v20 = [v4 count];
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_INFO, "Requesting predicted mailbox for %lu messages. predictionID=%{public}@", buf, 0x16u);
  }

  BOOL v9 = [v5 selectionModel:self predictMailboxForMovingMessagesWithIDs:v6];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke;
  v17[3] = &unk_1E6D12278;
  id v10 = v7;
  id v18 = v10;
  [v9 addSuccessBlock:v17];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke_54;
  long long v15 = &unk_1E6D12228;
  id v16 = v10;
  id v11 = v10;
  [v9 addFailureBlock:&v12];
  -[MessageListSelectionModel setMailboxPredictionFuture:](self, "setMailboxPredictionFuture:", v9, v12, v13, v14, v15);
}

void __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ef_log_MessageListSelectionModel();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_msgSend(v3, "ef_publicDescription");
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_INFO, "Mailbox prediction finished with mailbox=%{public}@ predictionID=%{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __61__MessageListSelectionModel___updatePredictionWithSelection___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_msgSend(v3, "ef_isCancelledError"))
  {
    id v4 = _ef_log_MessageListSelectionModel();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v5;
      uint64_t v6 = "Mailbox prediction cancelled. predictionID=%{public}@";
LABEL_7:
      _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    int v7 = objc_msgSend(v3, "em_isItemNotFoundError");
    id v4 = _ef_log_MessageListSelectionModel();
    BOOL v8 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v9;
        uint64_t v6 = "Mailbox prediction finished with no mailbox found. predictionID=%{public}@";
        goto LABEL_7;
      }
    }
    else if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = objc_msgSend(v3, "ef_publicDescription");
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      long long v15 = v11;
      _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_INFO, "Mailbox prediction produced an unexpected error. predictionID=%{public}@ error=%{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)setMailboxPredictionFuture:(id)a3
{
  id v4 = (EFFuture *)a3;
  [(EFFuture *)self->_mailboxPredictionFuture cancel];
  mailboxPredictionFuture = self->_mailboxPredictionFuture;
  self->_mailboxPredictionFuture = v4;
}

- (void)preserveSelection
{
  id v3 = [(MessageListSelectionModel *)self restoreSelectionCancelable];
  id v4 = v3;
  if (v3) {
    [v3 cancel];
  }
  [(MessageListSelectionModel *)self setShouldRestoreSelection:1];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  double v6 = (double)[(MessageListSelectionModel *)self preserveSelectionTimeout];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __46__MessageListSelectionModel_preserveSelection__block_invoke;
  uint64_t v11 = &unk_1E6D117D8;
  objc_copyWeak(&v12, &location);
  int v7 = [v5 afterDelay:&v8 performBlock:v6];
  -[MessageListSelectionModel setRestoreSelectionCancelable:](self, "setRestoreSelectionCancelable:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __46__MessageListSelectionModel_preserveSelection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldRestoreSelection:0];
}

- (int64_t)preserveSelectionTimeout
{
  return 30;
}

- (void)enableSelectAllWithMailboxes:(id)a3
{
  id v4 = a3;
  [(MessageListSelectionModel *)self clearAll];
  uint64_t v5 = (void *)[v4 copy];

  [(MessageListSelectionModel *)self setTrackedMailboxes:v5];
  [(MessageListSelectionModel *)self setType:1];
}

- (void)disableSelectAll
{
  [(MessageListSelectionModel *)self clearAll];
  [(MessageListSelectionModel *)self setTrackedMailboxes:0];
  [(MessageListSelectionModel *)self setType:0];
}

- (NSString)ef_publicDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double v6 = [(MessageListSelectionModel *)self trackedItems];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [(MessageListSelectionModel *)self trackedItems];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [(MessageListSelectionModel *)self trackedMailboxes];
  uint64_t v11 = [v3 stringWithFormat:@"<%@: %p> itemIDs:%ld, messageListItems:%ld, mailboxes:%ld, isSelectAll:%{BOOL}d", v5, self, v7, v9, objc_msgSend(v10, "count"), -[MessageListSelectionModel isSelectAll](self, "isSelectAll")];

  return (NSString *)v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)shouldRestoreSelection
{
  return self->_shouldRestoreSelection;
}

- (void)setShouldRestoreSelection:(BOOL)a3
{
  self->_shouldRestoreSelection = a3;
}

- (BOOL)isMultipleSelectionActive
{
  return self->_multipleSelectionActive;
}

- (NSMutableSet)itemsToDeselectAfterMultipleSelection
{
  return self->_itemsToDeselectAfterMultipleSelection;
}

- (BOOL)isPerformingDataSourceUpdates
{
  return self->_performingDataSourceUpdates;
}

- (MessageListSelectionModelDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (MessageListSelectionModelDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (MessageListSelectionModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MessageListSelectionModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TrackedMessageListItems)trackedItems
{
  return self->_trackedItems;
}

- (void)setTrackedItems:(id)a3
{
}

- (NSMutableSet)itemIDsPendingConfiguration
{
  return self->_itemIDsPendingConfiguration;
}

- (void)setItemIDsPendingConfiguration:(id)a3
{
}

- (NSMutableSet)itemIDsMissingMessageListItem
{
  return self->_itemIDsMissingMessageListItem;
}

- (void)setItemIDsMissingMessageListItem:(id)a3
{
}

- (NSArray)trackedMailboxes
{
  return self->_trackedMailboxes;
}

- (void)setTrackedMailboxes:(id)a3
{
}

- (int64_t)trackedItemsCount
{
  return self->_trackedItemsCount;
}

- (void)setTrackedItemsCount:(int64_t)a3
{
  self->_trackedItemsCount = a3;
}

- (int64_t)trackedItemsWillMoveToTrash
{
  return self->_trackedItemsWillMoveToTrash;
}

- (void)setTrackedItemsWillMoveToTrash:(int64_t)a3
{
  self->_trackedItemsWillMoveToTrash = a3;
}

- (int64_t)trackedItemsArchiveByDefault
{
  return self->_trackedItemsArchiveByDefault;
}

- (void)setTrackedItemsArchiveByDefault:(int64_t)a3
{
  self->_trackedItemsArchiveByDefault = a3;
}

- (int64_t)trackedItemsSupportArchiving
{
  return self->_trackedItemsSupportArchiving;
}

- (void)setTrackedItemsSupportArchiving:(int64_t)a3
{
  self->_trackedItemsSupportArchiving = a3;
}

- (EFDebouncer)predictionDebouncer
{
  return self->_predictionDebouncer;
}

- (void)setPredictionDebouncer:(id)a3
{
}

- (EFFuture)mailboxPredictionFuture
{
  return self->_mailboxPredictionFuture;
}

- (EFCancelable)restoreSelectionCancelable
{
  return self->_restoreSelectionCancelable;
}

- (void)setRestoreSelectionCancelable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreSelectionCancelable, 0);
  objc_storeStrong((id *)&self->_mailboxPredictionFuture, 0);
  objc_storeStrong((id *)&self->_predictionDebouncer, 0);
  objc_storeStrong((id *)&self->_trackedMailboxes, 0);
  objc_storeStrong((id *)&self->_itemIDsMissingMessageListItem, 0);
  objc_storeStrong((id *)&self->_itemIDsPendingConfiguration, 0);
  objc_storeStrong((id *)&self->_trackedItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_itemsToDeselectAfterMultipleSelection, 0);
}

void __58__MessageListSelectionModel__fetchMissingMessageListItems__block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = objc_msgSend(a2, "ef_publicDescription");
  int v10 = 138543874;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = v8;
  __int16 v14 = 2114;
  long long v15 = v9;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Failed to get message list item: %{public}@", (uint8_t *)&v10, 0x20u);
}

@end