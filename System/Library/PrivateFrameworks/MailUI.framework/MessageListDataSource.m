@interface MessageListDataSource
+ (OS_os_log)log;
- (BOOL)_isSectionVisible:(BOOL)a1;
- (BOOL)anyExpandedThreadContainsItemID:(id)a3;
- (BOOL)hasAdditionalSections;
- (BOOL)isExpandedThread:(id)a3;
- (BOOL)isMessagesSection:(id)a3;
- (BOOL)isMessagesSectionAtIndex:(int64_t)a3;
- (BOOL)isSection:(id)a3 atIndex:(int64_t)a4;
- (BOOL)messageListSectionIsVisible:(id)a3;
- (BOOL)shouldDisplaySupplementaryKind:(id)a3 forSectionAtIndex:(int64_t)a4;
- (BOOL)shouldReloadMessageListSectionDataSource:(id)a3;
- (EFLocked)dataSourcesForObjectIdentifier;
- (EFLocked)objectIdentifiersForSection;
- (EFLocked)pendingSectionsToClear;
- (EFLocked)visibleSections;
- (MessageListDataSource)initWithCollectionView:(id)a3;
- (MessageListDataSourceDelegate)delegate;
- (MessageListDataSourceProvider)provider;
- (MessageListSectionUpdate)_removeMessageListSection:(uint64_t)a3 animated:;
- (NSSet)messagesSections;
- (OS_dispatch_queue)updateQueue;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)_allDataSources;
- (id)_configuredCellForCollectionView:(void *)a3 indexPath:(void *)a4 itemID:(void *)a5 cellIdentifier:;
- (id)_createSectionDataSourceForSection:(void *)a3 messageList:;
- (id)_dataSourceContainingItemID:(void *)a1;
- (id)_dataSourceForObjectID:(id)a1;
- (id)_dataSourceForSection:(void *)a1;
- (id)_dataSourceForSectionIndex:(id)a1;
- (id)_groupMessagesListItemIDsBySection:(void *)a3 snapshot:;
- (id)_indexPathsForPreparedItems;
- (id)_messageListInSectionWithObjectIdentifier:(void *)a1;
- (id)_objectIDForSection:(id)a1;
- (id)_supplementaryViewForCollectionView:(void *)a3 elementKind:(void *)a4 indexPath:;
- (id)indexPathForItemIdentifier:(id)a3;
- (id)itemIDsInExpandedThread:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiers;
- (id)messageListAtSectionIndex:(int64_t)a3;
- (id)messageListForMessageListItemWithIdentifier:(id)a3;
- (id)messageListForSection:(id)a3;
- (id)messageListItemAtIndexPath:(id)a3;
- (id)messageListItemForItemID:(id)a3;
- (id)messageListItemForItemID:(id)a3 section:(id)a4;
- (id)messageListItemsForItemIDs:(id)a3;
- (id)messageListItemsForItemIDs:(id)a3 section:(id)a4;
- (id)messageListItemsInSection:(id)a3 limit:(unint64_t)a4;
- (id)messageListSectionDataSource:(id)a3 indexPathForItemIdentifier:(id)a4;
- (id)messageListSectionDataSource:(id)a3 indexPathsForItemIdentifiers:(id)a4;
- (id)messageListSectionDataSource:(id)a3 itemIdentifierForIndexPath:(id)a4;
- (id)messageListSectionDataSource:(id)a3 itemIdentifiersForIndexPaths:(id)a4;
- (id)messagesInMessageListItem:(id)a3;
- (id)objectIDForItemID:(id)a3;
- (id)relatedItemIDsForSelectedItemID:(id)a3 atIndexPath:(id)a4;
- (id)sectionAfterIndex:(int64_t)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (id)sectionBeforeIndex:(int64_t)a3;
- (id)snapshotForMessageListSectionDataSource:(id)a3;
- (id)threadItemIDForItemInExpandedThread:(id)a3;
- (id)viewModelForSupplementaryViewKind:(id)a3 sectionAtIndex:(int64_t)a4;
- (id)visibleMessageListSections;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsAtSectionIndex:(int64_t)a3;
- (int64_t)numberOfItemsInMessagesSections;
- (int64_t)numberOfSections;
- (int64_t)sectionIndexForSection:(id)a3;
- (int64_t)updateQueueSuspensionCount;
- (void)_insertDefaultSectionsIntoSnapshot:(uint64_t)a1;
- (void)_performDataSourceUpdateAnimated:(void *)a3 withSectionDataSource:(uint64_t)a4 cleanSnapshot:(void *)a5 prepare:(void *)a6 update:(uint64_t)a7 immediateCompletion:(void *)a8 completion:;
- (void)_performDataSourceUpdates:(uint64_t)a1;
- (void)_resumeUpdatesWithForce:(os_unfair_lock_s *)a1;
- (void)_setDataSource:(void *)a3 forObjectID:;
- (void)applyFilterPredicate:(id)a3 userFiltered:(BOOL)a4 ignoreMessagesPredicate:(id)a5 section:(id)a6;
- (void)applyMessageListDataSourceUpdate:(id)a3;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)deleteItemsWithIDs:(id)a3 animated:(BOOL)a4 immediateCompletion:(BOOL)a5 completion:(id)a6;
- (void)didScheduleReadInteractionForItemID:(id)a3;
- (void)didSelectDisclosureButtonForMessageListItem:(id)a3 disclosureEnabled:(BOOL)a4;
- (void)messageListSectionDataSource:(id)a3 performUpdateAnimated:(BOOL)a4 cleanSnapshot:(BOOL)a5 prepare:(id)a6 update:(id)a7 completion:(id)a8;
- (void)reconfigureVisibleCells;
- (void)refresh;
- (void)reloadItemsWithItemIDs:(id)a3;
- (void)reloadVisibleCellsInvalidatingCache:(BOOL)a3;
- (void)removeMessageListSection:(id)a3 animated:(BOOL)a4;
- (void)resumeUpdates;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSourcesForObjectIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasAdditionalSections:(BOOL)a3;
- (void)setMessagesSections:(id)a3;
- (void)setObjectIdentifiersForSection:(id)a3;
- (void)setPendingSectionsToClear:(id)a3;
- (void)setProvider:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setUpdateQueueSuspensionCount:(int64_t)a3;
- (void)setVisibleSections:(id)a3;
- (void)showMessageListSection:(id)a3 animated:(BOOL)a4;
- (void)suspendUpdates;
@end

@implementation MessageListDataSource

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke_50(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  v60 = [*(id *)(a1 + 32) dataSource];
  v1 = [v60 snapshot];
  LOBYTE(v66) = objc_msgSend(*(id *)(a1 + 40), "ef_all:", &__block_literal_global_53);
  v64 = [MEMORY[0x1E4F1CA48] array];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v69 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (v69)
  {
    uint64_t v68 = *(void *)v90;
    v65 = v1;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v90 != v68) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v4 = [v3 sectionDataSource];
        v5 = *(void **)(a1 + 32);
        v6 = [v4 objectID];
        v7 = -[MessageListDataSource _dataSourceForObjectID:](v5, v6);

        if (v7 == v4)
        {
          v11 = [v4 objectID];
          v12 = [v1 sectionIdentifiers];
          int v13 = objc_msgSend(v12, "ef_isEmpty");

          if (v13) {
            -[MessageListDataSource _insertDefaultSectionsIntoSnapshot:](*(void *)(a1 + 32), v1);
          }
          uint64_t v85 = 0;
          v86 = &v85;
          uint64_t v87 = 0x2020000000;
          char v88 = 0;
          if ([v3 cleanSnapshot])
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy_;
            *(void *)&buf[32] = __Block_byref_object_dispose_;
            v94[0] = (id)0xAAAAAAAAAAAAAAAALL;
            v94[0] = [v1 itemIdentifiersInSectionWithIdentifier:v11];
            if ([*(id *)(*(void *)&buf[8] + 40) count]) {
              *((unsigned char *)v86 + 24) = 1;
            }
            [v1 deleteItemsWithIdentifiers:*(void *)(*(void *)&buf[8] + 40)];
            v14 = [*(id *)(a1 + 32) pendingSectionsToClear];
            v80[0] = MEMORY[0x1E4F143A8];
            v80[1] = 3221225472;
            v80[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_54;
            v80[3] = &unk_1E6D11BA8;
            v80[4] = *(void *)(a1 + 32);
            unsigned int v15 = atomic_load((unsigned int *)(a1 + 64));
            unsigned int v84 = v15;
            v82 = buf;
            id v81 = v1;
            v83 = &v85;
            [v14 performWhileLocked:v80];

            _Block_object_dispose(buf, 8);
          }
          v16 = [v3 updateHandler];
          v17 = ((void (**)(void, void *, void *))v16)[2](v16, v1, v11);

          v18 = *(void **)(a1 + 32);
          v19 = [v4 section];
          LOBYTE(v18) = [v18 messageListSectionIsVisible:v19];

          if (v18 & 1) != 0 || ([v17 isSectionRemoval])
          {
            if ([v17 failed])
            {
              v20 = +[MessageListDataSource log];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                uint64_t v45 = *(void *)(a1 + 32);
                unsigned int v46 = atomic_load((unsigned int *)(a1 + 64));
                v47 = [v1 itemIdentifiers];
                *(_DWORD *)buf = 134218498;
                *(void *)&buf[4] = v45;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v46;
                *(_WORD *)&buf[18] = 2114;
                *(void *)&buf[20] = v47;
                _os_log_error_impl(&dword_1DDCDB000, v20, OS_LOG_TYPE_ERROR, "%p: [%u] Reloading datasource as we failed to update snapshot with stale snapshot identifiers:%{public}@", buf, 0x1Cu);
              }
              [*(id *)(a1 + 48) messageListDataSourceUpdateFailed:*(void *)(a1 + 32) section:v4];
            }
            else if ([v17 skipped] && !*((unsigned char *)v86 + 24) {
                   || [v17 isCleanSnapshot] && !*((unsigned char *)v86 + 24))
            }
            {
              v29 = +[MessageListDataSource log];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v62 = *(void *)(a1 + 32);
                unsigned int v30 = atomic_load((unsigned int *)(a1 + 64));
                unsigned int v61 = v30;
                v31 = [v4 section];
                int v32 = [v3 cleanSnapshot];
                int v33 = *((unsigned __int8 *)v86 + 24);
                v34 = objc_msgSend(v17, "ef_publicDescription");
                *(_DWORD *)buf = 134219266;
                *(void *)&buf[4] = v62;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v61;
                *(_WORD *)&buf[18] = 2114;
                *(void *)&buf[20] = v31;
                *(_WORD *)&buf[28] = 1024;
                *(_DWORD *)&buf[30] = v32;
                *(_WORD *)&buf[34] = 1024;
                *(_DWORD *)&buf[36] = v33;
                LOWORD(v94[0]) = 2114;
                *(id *)((char *)v94 + 2) = v34;
                _os_log_impl(&dword_1DDCDB000, v29, OS_LOG_TYPE_DEFAULT, "%p: [%u] Skip data source update for section: %{public}@, cleanSnapshot: %{BOOL}d, didCleanSnapshot: %{BOOL}d, change: %{public}@", buf, 0x32u);

                v1 = v65;
              }

              [*(id *)(a1 + 48) messageListDataSourceDidSkipUpdate:*(void *)(a1 + 32) section:v4 change:v17];
            }
            else
            {
              v21 = [*(id *)(a1 + 32) delegate];
              int v22 = [v21 messageListDataSource:*(void *)(a1 + 32) section:v4 shouldSuspendUpdatesAfterChange:v17];

              if (v22) {
                [*(id *)(a1 + 32) suspendUpdates];
              }
              if (v66)
              {
                v23 = [*(id *)(a1 + 32) provider];
                unsigned int v66 = [v23 messageListDataSource:*(void *)(a1 + 32) shouldAnimateNextUpdateInSectionDataSource:v4 change:v17];
              }
              else
              {
                unsigned int v66 = 0;
              }
              objc_msgSend(*(id *)(a1 + 48), "messageListDataSource:willUpdateWithChange:section:animated:cleanSnapshot:", *(void *)(a1 + 32), v17, v4, v66, objc_msgSend(v3, "cleanSnapshot"));
              v35 = +[MessageListDataSource log];
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v36 = *(void *)(a1 + 32);
                unsigned int v37 = atomic_load((unsigned int *)(a1 + 64));
                unsigned int v63 = v37;
                v38 = [v3 sectionDataSource];
                v39 = [v38 section];
                v40 = objc_msgSend(v17, "ef_publicDescription");
                *(_DWORD *)buf = 134218754;
                *(void *)&buf[4] = v36;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v63;
                *(_WORD *)&buf[18] = 2114;
                *(void *)&buf[20] = v39;
                *(_WORD *)&buf[28] = 2114;
                *(void *)&buf[30] = v40;
                _os_log_impl(&dword_1DDCDB000, v35, OS_LOG_TYPE_DEFAULT, "%p: [%u][%{public}@] Perform data source update: %{public}@", buf, 0x26u);

                v1 = v65;
              }

              v41 = [MEMORY[0x1E4F60DF0] pairWithFirst:v4 second:v17];
              [v64 addObject:v41];
            }
          }
          else
          {
            v24 = +[MessageListDataSource log];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = *(void *)(a1 + 32);
              unsigned int v26 = atomic_load((unsigned int *)(a1 + 64));
              v27 = objc_msgSend(v17, "ef_publicDescription");
              v28 = [v4 section];
              *(_DWORD *)buf = 134218754;
              *(void *)&buf[4] = v25;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v26;
              *(_WORD *)&buf[18] = 2114;
              *(void *)&buf[20] = v27;
              *(_WORD *)&buf[28] = 2114;
              *(void *)&buf[30] = v28;
              _os_log_impl(&dword_1DDCDB000, v24, OS_LOG_TYPE_DEFAULT, "%p: [%u] Skip data source update (%{public}@) - %{public}@ is not visible", buf, 0x26u);

              v1 = v65;
            }

            [v4 stopObserving];
          }

          _Block_object_dispose(&v85, 8);
        }
        else
        {
          v8 = +[MessageListDataSource log];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            uint64_t v42 = *(void *)(a1 + 32);
            unsigned int v43 = atomic_load((unsigned int *)(a1 + 64));
            v44 = [v7 section];
            *(_DWORD *)buf = 134218754;
            *(void *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v43;
            *(_WORD *)&buf[18] = 2114;
            *(void *)&buf[20] = v44;
            *(_WORD *)&buf[28] = 2048;
            *(void *)&buf[30] = v4;
            _os_log_error_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_ERROR, "%p: [%u] Skip data source update - %{public}@ is stale: %p", buf, 0x26u);
          }
          v9 = *(void **)(a1 + 48);
          uint64_t v10 = *(void *)(a1 + 32);
          v11 = +[MessageListSectionDataSourceChange skipped];
          [v9 messageListDataSourceDidSkipUpdate:v10 section:v4 change:v11];
        }
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
    }
    while (v69);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_56;
  aBlock[3] = &unk_1E6D11BD0;
  uint64_t v48 = a1;
  uint64_t v49 = *(void *)(a1 + 32);
  uint64_t v77 = *(void *)(a1 + 56);
  aBlock[4] = v49;
  id v50 = v64;
  id v74 = v50;
  unsigned int v51 = atomic_load((unsigned int *)(a1 + 64));
  unsigned int v78 = v51;
  char v79 = v66 & 1;
  id v75 = *(id *)(v48 + 48);
  id v76 = *(id *)(v48 + 40);
  v52 = _Block_copy(aBlock);
  v53 = +[MessageListDataSource log];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = *(void *)(a1 + 32);
    unsigned int v55 = atomic_load((unsigned int *)(a1 + 64));
    uint64_t v56 = [v50 count];
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = v54;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v55;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v56;
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v50;
    _os_log_impl(&dword_1DDCDB000, v53, OS_LOG_TYPE_DEFAULT, "%p: [%u] Applying changes (%lu): %{public}@", buf, 0x26u);
  }

  if ([v50 count])
  {
    if (objc_msgSend(*(id *)(a1 + 40), "ef_any:", &__block_literal_global_62)) {
      v57 = 0;
    }
    else {
      v57 = v52;
    }
    v58 = _Block_copy(v57);
    if (v66) {
      [v60 applySnapshot:v1 animatingDifferences:1 completion:v58];
    }
    else {
      [v60 applySnapshotUsingReloadData:v1 completion:v58];
    }
    if (!v58)
    {
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_2_63;
      v71[3] = &unk_1E6D11BF8;
      id v72 = v52;
      v59 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      [v59 performBlock:v71];
    }
  }
}

id __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_4()
{
  return +[MessageListSectionDataSourceChange cleanSnapshot];
}

- (BOOL)shouldDisplaySupplementaryKind:(id)a3 forSectionAtIndex:(int64_t)a4
{
  v4 = [(MessageListDataSource *)self viewModelForSupplementaryViewKind:a3 sectionAtIndex:a4];
  char v5 = [v4 shouldDisplaySupplementaryView];

  return v5;
}

void __60__MessageListDataSource__removeMessageListSection_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsObject:*(void *)(a1 + 32)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [v3 removeObject:*(void *)(a1 + 32)];
  }
}

void __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 section];
  [v3 addObject:v4];
}

id __48__MessageListDataSource_initWithCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v11 = -[MessageListDataSource _configuredCellForCollectionView:indexPath:itemID:cellIdentifier:](WeakRetained, v9, v8, v7, 0);

  return v11;
}

- (id)_configuredCellForCollectionView:(void *)a3 indexPath:(void *)a4 itemID:(void *)a5 cellIdentifier:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    int v13 = -[MessageListDataSource _dataSourceForSectionIndex:](a1, [v10 section]);
    v14 = v13;
    if (v13)
    {
      a1 = [v13 configuredCollectionViewCellForCollectionView:v9 indexPath:v10 itemID:v11 cellIdentifier:v12];
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

id __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  char v5 = -[MessageListDataSource _removeMessageListSection:animated:](v2, v4, [v3 startsWithEmptySnapshot]);

  return v5;
}

- (MessageListSectionUpdate)_removeMessageListSection:(uint64_t)a3 animated:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v6 = [a1 visibleSections];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__MessageListDataSource__removeMessageListSection_animated___block_invoke;
    v16[3] = &unk_1E6D11990;
    id v7 = v5;
    v17 = v7;
    v18 = &v19;
    [v6 performWhileLocked:v16];

    if (*((unsigned char *)v20 + 24))
    {
      id v8 = -[MessageListDataSource _dataSourceForSection:](a1, v7);
      if (v8)
      {
        id v9 = +[MessageListDataSource log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v24 = a1;
          __int16 v25 = 2048;
          unsigned int v26 = v8;
          __int16 v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "%p: Remove data source (%p) from section: %{public}@", buf, 0x20u);
        }

        [v8 stopObserving];
        id v10 = [MessageListSectionUpdate alloc];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __60__MessageListDataSource__removeMessageListSection_animated___block_invoke_26;
        v14[3] = &unk_1E6D119B8;
        unsigned int v15 = v7;
        id v11 = [(MessageListSectionUpdate *)v10 initWithMessageListSectionDataSource:v8 animated:a3 cleanSnapshot:1 updateHandler:v14];
        id v12 = v15;
      }
      else
      {
        id v12 = +[MessageListDataSource log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v24 = a1;
          __int16 v25 = 2114;
          unsigned int v26 = v7;
          _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "%p: Section does not exist. Cannot remove data source from section: %{public}@", buf, 0x16u);
        }
        id v11 = 0;
      }
    }
    else
    {
      id v8 = +[MessageListDataSource log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v24 = a1;
        __int16 v25 = 2114;
        unsigned int v26 = v7;
        _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Message list section (%{public}@) is not visible", buf, 0x16u);
      }
      id v11 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)applyMessageListDataSourceUpdate:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[MessageListDataSource log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 134218242;
    uint64_t v45 = self;
    __int16 v46 = 2114;
    v47 = v6;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: applyMessageListDataSourceUpdate: %{public}@", buf, 0x16u);
  }
  id v7 = [(MessageListDataSource *)self pendingSectionsToClear];
  [v7 performWhileLocked:&__block_literal_global_3];

  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA80] set];
  id v10 = [v4 sectionsToRemove];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_2;
  v41[3] = &unk_1E6D11920;
  v41[4] = self;
  id v11 = v4;
  id v42 = v11;
  id v12 = objc_msgSend(v10, "ef_map:", v41);
  uint64_t v13 = objc_msgSend(v12, "ef_filter:", *MEMORY[0x1E4F60CE8]);

  if ([v11 startsWithEmptySnapshot])
  {
    [v8 addObjectsFromArray:v13];
  }
  else
  {
    v14 = [v11 sectionsToRemove];
    [v9 addObjectsFromArray:v14];
  }
  unsigned int v15 = [v11 sectionsToUpdate];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_3;
  v37[3] = &unk_1E6D11968;
  v37[4] = self;
  id v16 = v11;
  id v38 = v16;
  id v17 = v8;
  id v39 = v17;
  id v18 = v9;
  id v40 = v18;
  uint64_t v19 = objc_msgSend(v15, "ef_map:", v37);

  if ([v16 startsWithEmptySnapshot]) {
    -[MessageListDataSource _performDataSourceUpdates:]((uint64_t)self, v17);
  }
  uint64_t v29 = (void *)v13;
  if (([v16 startsWithEmptySnapshot] & 1) == 0)
  {
    v20 = [(MessageListDataSource *)self pendingSectionsToClear];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_5;
    v35[3] = &unk_1E6D117B0;
    id v36 = v18;
    [v20 performWhileLocked:v35];
  }
  v28 = v18;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        unsigned int v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        -[MessageListDataSource _resumeUpdatesWithForce:]((os_unfair_lock_s *)self, 1);
        __int16 v27 = [(MessageListDataSource *)self visibleSections];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_6;
        v30[3] = &unk_1E6D117B0;
        v30[4] = v26;
        [v27 performWhileLocked:v30];

        objc_msgSend(v26, "beginObservingAnimated:nextUpdateNeedsCleanSnapshot:", 1, objc_msgSend(v16, "startsWithEmptySnapshot") ^ 1);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v23);
  }
}

- (EFLocked)pendingSectionsToClear
{
  return self->_pendingSectionsToClear;
}

- (void)suspendUpdates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_updateQueueLock = &self->_updateQueueLock;
  os_unfair_lock_lock(&self->_updateQueueLock);
  int64_t v4 = [(MessageListDataSource *)self updateQueueSuspensionCount];
  if (v4)
  {
    id v5 = +[MessageListDataSource log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      id v8 = self;
      __int16 v9 = 2048;
      int64_t v10 = v4;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Queue is already suspended (count=%ld)", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    v6 = +[MessageListDataSource log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      id v8 = self;
      __int16 v9 = 2048;
      int64_t v10 = 0;
      _os_log_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Suspend update queue (count=%ld)", (uint8_t *)&v7, 0x16u);
    }

    id v5 = [(MessageListDataSource *)self updateQueue];
    dispatch_suspend(v5);
  }

  [(MessageListDataSource *)self setUpdateQueueSuspensionCount:[(MessageListDataSource *)self updateQueueSuspensionCount] + 1];
  os_unfair_lock_unlock(p_updateQueueLock);
}

- (void)_resumeUpdatesWithForce:(os_unfair_lock_s *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int64_t v4 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    uint64_t v5 = [(os_unfair_lock_s *)a1 updateQueueSuspensionCount];
    if (v5)
    {
      if (a2) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v5 - 1;
      }
      if (v6)
      {
        int v7 = +[MessageListDataSource log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 134218496;
          uint64_t v11 = a1;
          __int16 v12 = 2048;
          uint64_t v13 = v6;
          __int16 v14 = 1024;
          int v15 = a2;
          _os_log_impl(&dword_1DDCDB000, v7, OS_LOG_TYPE_DEFAULT, "%p: Skip resume queue (count=%ld, force=%{BOOL}d)", (uint8_t *)&v10, 0x1Cu);
        }
      }
      else
      {
        __int16 v9 = +[MessageListDataSource log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 134218496;
          uint64_t v11 = a1;
          __int16 v12 = 2048;
          uint64_t v13 = 0;
          __int16 v14 = 1024;
          int v15 = a2;
          _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "%p: Resume update queue (count=%ld, force=%{BOOL}d)", (uint8_t *)&v10, 0x1Cu);
        }

        int v7 = [(os_unfair_lock_s *)a1 updateQueue];
        dispatch_resume(v7);
      }

      [(os_unfair_lock_s *)a1 setUpdateQueueSuspensionCount:v6];
    }
    else
    {
      id v8 = +[MessageListDataSource log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134218496;
        uint64_t v11 = a1;
        __int16 v12 = 2048;
        uint64_t v13 = 0;
        __int16 v14 = 1024;
        int v15 = a2;
        _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Queue is already resumed (count=%ld, force=%{BOOL}d)", (uint8_t *)&v10, 0x1Cu);
      }
    }
    os_unfair_lock_unlock(v4);
  }
}

- (int64_t)updateQueueSuspensionCount
{
  return self->_updateQueueSuspensionCount;
}

- (void)setUpdateQueueSuspensionCount:(int64_t)a3
{
  self->_updateQueueSuspensionCount = a3;
}

- (void)reloadVisibleCellsInvalidatingCache:(BOOL)a3
{
  BOOL v21 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int64_t v4 = -[MessageListDataSource _indexPathsForPreparedItems](self);
  if ([v4 count])
  {
    uint64_t v5 = +[MessageListDataSource log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      long long v33 = self;
      __int16 v34 = 2048;
      uint64_t v35 = [v4 count];
      __int16 v36 = 2112;
      unsigned int v37 = v4;
      __int16 v38 = 1024;
      BOOL v39 = v21;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: updateListForChange - reloading visible cells at (%lu) indexPaths:%@ invalidateCache:%{BOOL}d", buf, 0x26u);
    }

    uint64_t v6 = [(MessageListDataSource *)self dataSource];
    int v7 = [v6 snapshot];

    uint64_t v19 = v4;
    v20 = objc_msgSend(v7, "mui_validItemIDsFromIndexPaths:", v4);
    id v18 = v7;
    id v8 = -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v20, v7);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    __int16 v9 = [v8 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          int v15 = -[MessageListDataSource _dataSourceForObjectID:](self, v14);
          uint64_t v16 = objc_msgSend(v8, "objectForKeyedSubscript:", v14, v18);
          if ([v16 count])
          {
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __61__MessageListDataSource_reloadVisibleCellsInvalidatingCache___block_invoke;
            v22[3] = &unk_1E6D11A78;
            uint64_t v23 = v16;
            uint64_t v24 = self;
            BOOL v26 = v21;
            id v25 = v15;
            -[MessageListDataSource _performDataSourceUpdateAnimated:withSectionDataSource:cleanSnapshot:prepare:update:immediateCompletion:completion:]((uint64_t)self, 0, v25, 0, 0, v22, 0, 0);

            id v17 = v23;
          }
          else
          {
            id v17 = +[MessageListDataSource log];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              long long v33 = self;
              __int16 v34 = 2114;
              uint64_t v35 = (uint64_t)v20;
              _os_log_impl(&dword_1DDCDB000, v17, OS_LOG_TYPE_DEFAULT, "%p: skip reloading visible items (%{public}@)", buf, 0x16u);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    int64_t v4 = v19;
  }
}

- (id)_indexPathsForPreparedItems
{
  if (a1)
  {
    v1 = [a1 collectionView];
    v2 = objc_msgSend(v1, "mui_indexPathsForPreparedItems");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)sectionBeforeIndex:(int64_t)a3
{
  uint64_t v5 = [(MessageListDataSource *)self collectionView];
  if (a3 >= 1)
  {
    unint64_t v6 = a3 + 1;
    do
    {
      if ([v5 numberOfItemsInSection:v6 - 2])
      {
        int v7 = [(MessageListDataSource *)self sectionAtIndex:v6 - 2];
        if ([(MessageListDataSource *)self messageListSectionIsVisible:v7]) {
          goto LABEL_8;
        }
      }
      --v6;
    }
    while (v6 > 1);
  }
  int v7 = 0;
LABEL_8:

  return v7;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

uint64_t __53__MessageListDataSource_messageListSectionIsVisible___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __60__MessageListDataSource__insertDefaultSectionsIntoSnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v3 = -[MessageListDataSource _objectIDForSection:](*(id *)(a1 + 32), a2);
  int64_t v4 = [*(id *)(a1 + 40) sectionIdentifiers];
  char v5 = [v4 containsObject:v3];

  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = v3;
  }

  return v6;
}

- (id)visibleMessageListSections
{
  id v3 = [(MessageListDataSource *)self messagesSections];
  int64_t v4 = (void *)[v3 mutableCopy];

  char v5 = [(MessageListDataSource *)self visibleSections];
  id v6 = [v5 getObject];
  [v4 intersectSet:v6];

  return v4;
}

- (id)viewModelForSupplementaryViewKind:(id)a3 sectionAtIndex:(int64_t)a4
{
  id v6 = a3;
  int v7 = -[MessageListDataSource _dataSourceForSectionIndex:](self, a4);
  id v8 = [v7 section];
  BOOL v9 = [(MessageListDataSource *)self messageListSectionIsVisible:v8];

  if (v9)
  {
    if ([v7 hasSupplementaryViewOfKind:v6])
    {
      uint64_t v10 = [(MessageListDataSource *)self collectionView];
      uint64_t v11 = [v10 numberOfItemsInSection:a4];

      if (v11)
      {
        uint64_t v12 = 1;
        id v13 = v6;
        int64_t v14 = a4;
        uint64_t v15 = 3;
      }
      else
      {
        uint64_t v16 = [(MessageListDataSource *)self delegate];
        uint64_t v17 = objc_msgSend(v7, "shouldShowSupplementaryViewOfKindIfEmpty:isIndexing:", v6, objc_msgSend(v16, "isIndexingMessagesForMessageListDataSource:", self));

        uint64_t v12 = v17;
        id v13 = v6;
        int64_t v14 = a4;
        uint64_t v15 = 1;
      }
    }
    else
    {
      uint64_t v12 = 0;
      id v13 = v6;
      int64_t v14 = a4;
      uint64_t v15 = 2;
    }
  }
  else
  {
    uint64_t v12 = 0;
    id v13 = v6;
    int64_t v14 = a4;
    uint64_t v15 = 0;
  }
  id v18 = +[MUIMessageListSupplementaryViewModel supplementaryViewModelWithDisplay:v12 kind:v13 sectionIndex:v14 reason:v15];

  return v18;
}

- (BOOL)messageListSectionIsVisible:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  char v5 = [(MessageListDataSource *)self visibleSections];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MessageListDataSource_messageListSectionIsVisible___block_invoke;
  v8[3] = &unk_1E6D11800;
  uint64_t v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 performWhileLocked:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (EFLocked)visibleSections
{
  return self->_visibleSections;
}

- (int64_t)numberOfItemsInMessagesSections
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(MessageListDataSource *)self dataSource];
  id v4 = [v3 snapshot];

  uint64_t v16 = v4;
  [v4 sectionIdentifiers];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = -[MessageListDataSource _dataSourceForObjectID:](self, v10);
        uint64_t v12 = [(MessageListDataSource *)self messagesSections];
        uint64_t v13 = [v11 section];
        int v14 = [v12 containsObject:v13];

        if (v14) {
          v7 += [v16 numberOfItemsInSection:v10];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_dataSourceForObjectID:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy_;
    uint64_t v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    id v4 = [a1 dataSourcesForObjectIdentifier];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__MessageListDataSource__dataSourceForObjectID___block_invoke;
    v6[3] = &unk_1E6D11AC0;
    uint64_t v8 = &v9;
    id v7 = v3;
    [v4 performWhileLocked:v6];

    a1 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  return a1;
}

- (EFLocked)dataSourcesForObjectIdentifier
{
  return self->_dataSourcesForObjectIdentifier;
}

- (NSSet)messagesSections
{
  return self->_messagesSections;
}

- (BOOL)isMessagesSectionAtIndex:(int64_t)a3
{
  id v3 = self;
  id v4 = [(MessageListDataSource *)self sectionAtIndex:a3];
  LOBYTE(v3) = [(MessageListDataSource *)v3 isMessagesSection:v4];

  return (char)v3;
}

- (BOOL)isMessagesSection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MessageListDataSource *)self messagesSections];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)sectionAtIndex:(int64_t)a3
{
  id v3 = -[MessageListDataSource _dataSourceForSectionIndex:](self, a3);
  id v4 = [v3 section];

  return v4;
}

- (BOOL)isSection:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MessageListDataSource *)self dataSource];
  uint64_t v8 = [v7 sectionIdentifierForIndex:a4];

  uint64_t v9 = -[MessageListDataSource _objectIDForSection:](self, v6);

  LOBYTE(v6) = [v9 isEqual:v8];
  return (char)v6;
}

- (id)_dataSourceForSectionIndex:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v4 = [a1 dataSource];
    uint64_t v5 = [v4 sectionIdentifierForIndex:a2];

    -[MessageListDataSource _dataSourceForObjectID:](v2, v5);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (id)_objectIDForSection:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy_;
    uint64_t v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    id v4 = [a1 objectIdentifiersForSection];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__MessageListDataSource__objectIDForSection___block_invoke;
    v6[3] = &unk_1E6D11AC0;
    uint64_t v8 = &v9;
    id v7 = v3;
    [v4 performWhileLocked:v6];

    a1 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  return a1;
}

- (EFLocked)objectIdentifiersForSection
{
  return self->_objectIdentifiersForSection;
}

uint64_t __51__MessageListDataSource__performDataSourceUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 animated];
}

uint64_t __51__MessageListDataSource__performDataSourceUpdates___block_invoke_60(uint64_t a1, void *a2)
{
  return [a2 immediateCompletion];
}

- (id)snapshotForMessageListSectionDataSource:(id)a3
{
  id v3 = [(MessageListDataSource *)self dataSource];
  id v4 = [v3 snapshot];

  return v4;
}

uint64_t __47__MessageListDataSource__dataSourceForSection___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

- (void)_performDataSourceUpdates:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke;
    v6[3] = &unk_1E6D11888;
    void v6[4] = a1;
    id v7 = v3;
    uint64_t v8 = sel__performDataSourceUpdates_;
    uint64_t v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v5 performBlock:v6];
  }
}

void __45__MessageListDataSource__objectIDForSection___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F60400]) initAsEphemeralID:1];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

uint64_t __48__MessageListDataSource__dataSourceForObjectID___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke_56(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (pthread_main_np() != 1)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"MessageListDataSource.m" lineNumber:984 description:@"Current thread must be main"];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
  uint64_t v49 = a1;
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v55;
    *(void *)&long long v3 = 134218754;
    long long v42 = v3;
    uint64_t v46 = *(void *)v55;
    do
    {
      uint64_t v6 = 0;
      uint64_t v47 = v4;
      do
      {
        if (*(void *)v55 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v54 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "first", v42);
        id v9 = *(void **)(a1 + 32);
        uint64_t v10 = [v8 objectID];
        uint64_t v11 = -[MessageListDataSource _dataSourceForObjectID:](v9, v10);

        uint64_t v12 = +[MessageListDataSource log];
        uint64_t v13 = v12;
        if (v11 == v8)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v44 = *(void *)(a1 + 32);
            unsigned int v17 = atomic_load((unsigned int *)(a1 + 72));
            unsigned int v43 = v17;
            uint64_t v45 = [v7 second];
            long long v18 = objc_msgSend(v45, "ef_publicDescription");
            int v19 = *(unsigned __int8 *)(a1 + 76);
            long long v20 = [v7 first];
            long long v21 = [v7 first];
            uint64_t v22 = [v21 messageList];
            *(_DWORD *)buf = 134219266;
            uint64_t v60 = v44;
            __int16 v61 = 1024;
            unsigned int v62 = v43;
            __int16 v63 = 2114;
            v64 = v18;
            __int16 v65 = 1024;
            *(_DWORD *)unsigned int v66 = v19;
            *(_WORD *)&v66[4] = 2114;
            *(void *)&v66[6] = v20;
            __int16 v67 = 2114;
            uint64_t v68 = v22;
            _os_log_impl(&dword_1DDCDB000, v13, OS_LOG_TYPE_DEFAULT, "%p: [%u] dataSource update completion: %{public}@ (animated=%{BOOL}d) to section datasource: %{public}@ with message list: %{public}@", buf, 0x36u);

            a1 = v49;
          }

          uint64_t v23 = *(void **)(a1 + 48);
          uint64_t v24 = *(void *)(a1 + 32);
          uint64_t v13 = [v7 second];
          id v25 = [v7 first];
          [v23 messageListDataSource:v24 didUpdateWithChange:v13 section:v25 animated:*(unsigned __int8 *)(v49 + 76)];

          a1 = v49;
          uint64_t v5 = v46;
          uint64_t v4 = v47;
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          unsigned int v15 = atomic_load((unsigned int *)(a1 + 72));
          uint64_t v16 = [v11 section];
          *(_DWORD *)buf = v42;
          uint64_t v60 = v14;
          __int16 v61 = 1024;
          unsigned int v62 = v15;
          uint64_t v5 = v46;
          uint64_t v4 = v47;
          __int16 v63 = 2114;
          v64 = v16;
          __int16 v65 = 2048;
          *(void *)unsigned int v66 = v8;
          _os_log_error_impl(&dword_1DDCDB000, v13, OS_LOG_TYPE_ERROR, "%p: [%u] Skip data source completion - %{public}@ is stale: %p", buf, 0x26u);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
    }
    while (v4);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v26 = *(id *)(a1 + 56);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        long long v32 = [v31 sectionDataSource];
        long long v33 = *(void **)(a1 + 32);
        __int16 v34 = [v32 objectID];
        uint64_t v35 = -[MessageListDataSource _dataSourceForObjectID:](v33, v34);

        if (v35 == v32)
        {
          uint64_t v40 = [v31 completionHandler];

          if (!v40) {
            goto LABEL_27;
          }
          uint64_t v36 = [v31 completionHandler];
          (*(void (**)(void))(v36 + 16))();
        }
        else
        {
          uint64_t v36 = +[MessageListDataSource log];
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            uint64_t v37 = *(void *)(v49 + 32);
            unsigned int v38 = atomic_load((unsigned int *)(v49 + 72));
            BOOL v39 = [v35 section];
            *(_DWORD *)buf = 134218754;
            uint64_t v60 = v37;
            a1 = v49;
            __int16 v61 = 1024;
            unsigned int v62 = v38;
            __int16 v63 = 2114;
            v64 = v39;
            __int16 v65 = 2048;
            *(void *)unsigned int v66 = v32;
            _os_log_error_impl(&dword_1DDCDB000, (os_log_t)v36, OS_LOG_TYPE_ERROR, "%p: [%u] Skip update completion handler - %{public}@ is stale: %p", buf, 0x26u);
          }
        }

LABEL_27:
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v28);
  }
}

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 8), 1u);
  long long v3 = +[MessageListDataSource log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v31 = v4;
    __int16 v32 = 1024;
    unsigned int v33 = add;
    __int16 v34 = 2114;
    uint64_t v35 = v5;
    _os_log_impl(&dword_1DDCDB000, v3, OS_LOG_TYPE_DEFAULT, "%p: [%u] Enqueue updates: %{public}@ ", buf, 0x1Cu);
  }

  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = [v12 sectionDataSource];
        objc_msgSend(v6, "messageListDataSourcePrepareUpdate:section:cleanSnapshot:", v13, v14, objc_msgSend(v12, "cleanSnapshot"));

        unsigned int v15 = [v12 prepareHandler];

        if (v15)
        {
          uint64_t v16 = [v12 prepareHandler];
          v16[2]();
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  unsigned int v17 = [*(id *)(a1 + 32) updateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_50;
  block[3] = &unk_1E6D11C20;
  long long v18 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  unsigned int v24 = add;
  id v21 = v18;
  id v22 = v6;
  uint64_t v23 = *(void *)(a1 + 48);
  id v19 = v6;
  dispatch_async(v17, block);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MessageListDataSource_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  uint64_t v2 = (void *)log_log_2;
  return (OS_os_log *)v2;
}

- (MessageListDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MessageListDataSourceDelegate *)WeakRetained;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

uint64_t __52__MessageListDataSource__setDataSource_forObjectID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[MessageListDataSource log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    unsigned int v6 = atomic_load((unsigned int *)(a1 + 64));
    *(_DWORD *)buf = 134218754;
    uint64_t v23 = v5;
    __int16 v24 = 1024;
    unsigned int v25 = v6;
    __int16 v26 = 2048;
    uint64_t v27 = [v3 count];
    __int16 v28 = 2114;
    id v29 = v3;
    _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "%p: [%u] Clearing %lu other sections: %{public}@", buf, 0x26u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(a1 + 40);
        uint64_t v13 = -[MessageListDataSource _objectIDForSection:](*(id *)(a1 + 32), *(void **)(*((void *)&v17 + 1) + 8 * v11));
        uint64_t v14 = objc_msgSend(v12, "itemIdentifiersInSectionWithIdentifier:", v13, (void)v17);
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        [*(id *)(a1 + 40) deleteItemsWithIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [v7 removeAllObjects];
}

- (void)messageListSectionDataSource:(id)a3 performUpdateAnimated:(BOOL)a4 cleanSnapshot:(BOOL)a5 prepare:(id)a6 update:(id)a7 completion:(id)a8
{
}

- (void)_performDataSourceUpdateAnimated:(void *)a3 withSectionDataSource:(uint64_t)a4 cleanSnapshot:(void *)a5 prepare:(void *)a6 update:(uint64_t)a7 immediateCompletion:(void *)a8 completion:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v15 = a8;
    id v16 = a6;
    id v17 = a5;
    id v18 = a3;
    long long v19 = [[MessageListSectionUpdate alloc] initWithMessageListSectionDataSource:v18 animated:a2 cleanSnapshot:a4 prepareHandler:v17 updateHandler:v16 immediateCompletion:a7 completionHandler:v15];

    v21[0] = v19;
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    -[MessageListDataSource _performDataSourceUpdates:](a1, v20);
  }
}

- (void)setProvider:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

uint64_t __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

id __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 section];
  unsigned int v6 = -[MessageListDataSource _dataSourceForSection:](v4, v5);

  [v6 stopObserving];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v3 section];
  uint64_t v9 = [v3 messageList];
  uint64_t v10 = -[MessageListDataSource _createSectionDataSourceForSection:messageList:](v7, v8, v9);

  if ([v3 shouldClearSnapshot])
  {
    if ([*(id *)(a1 + 40) startsWithEmptySnapshot])
    {
      uint64_t v11 = [[MessageListSectionUpdate alloc] initWithMessageListSectionDataSource:v10 animated:0 cleanSnapshot:1 updateHandler:&__block_literal_global_15];
      uint64_t v12 = *(void **)(a1 + 48);
    }
    else
    {
      uint64_t v13 = *(void **)(a1 + 56);
      uint64_t v11 = [v3 section];
      uint64_t v12 = v13;
    }
    [v12 addObject:v11];
  }
  return v10;
}

- (id)_dataSourceForSection:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy_;
    uint64_t v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    uint64_t v4 = [a1 objectIdentifiersForSection];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__MessageListDataSource__dataSourceForSection___block_invoke;
    v6[3] = &unk_1E6D11AC0;
    uint64_t v8 = &v9;
    id v7 = v3;
    [v4 performWhileLocked:v6];

    a1 = -[MessageListDataSource _dataSourceForObjectID:](a1, (void *)v10[5]);

    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

- (id)_createSectionDataSourceForSection:(void *)a3 messageList:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = a3;
    id v7 = -[MessageListDataSource _objectIDForSection:](a1, v5);
    uint64_t v8 = [a1 provider];
    uint64_t v9 = [v8 messageListDataSource:a1 sectionDataSourceForSection:v5 objectID:v7 messageList:v6];

    if (!v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__createSectionDataSourceForSection_messageList_ object:a1 file:@"MessageListDataSource.m" lineNumber:270 description:@"Cannot reload message list with empty data source"];
    }
    [v9 setProvider:a1];
    uint64_t v10 = +[MessageListDataSource log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218498;
      id v14 = a1;
      __int16 v15 = 2048;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "%p: creating new data source (%p) for section: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    -[MessageListDataSource _setDataSource:forObjectID:](a1, v9, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (MessageListDataSourceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (MessageListDataSourceProvider *)WeakRetained;
}

- (void)_setDataSource:(void *)a3 forObjectID:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 dataSourcesForObjectIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__MessageListDataSource__setDataSource_forObjectID___block_invoke;
    v8[3] = &unk_1E6D11AE8;
    id v9 = v6;
    id v10 = v5;
    [v7 performWhileLocked:v8];
  }
}

- (MessageListDataSource)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MessageListDataSource;
  id v5 = [(MessageListDataSource *)&v39 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mobilemail.messagelistdatasource.collectionViewUpdate", v8);
    updateQueue = v6->_updateQueue;
    v6->_updateQueue = (OS_dispatch_queue *)v9;

    atomic_store(0, &v6->_updateIdentifier);
    v6->_updateQueueLock._os_unfair_lock_opaque = 0;
    id v11 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = [v11 initWithObject:v12];
    objectIdentifiersForSection = v6->_objectIdentifiersForSection;
    v6->_objectIdentifiersForSection = (EFLocked *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = [v15 initWithObject:v16];
    dataSourcesForObjectIdentifier = v6->_dataSourcesForObjectIdentifier;
    v6->_dataSourcesForObjectIdentifier = (EFLocked *)v17;

    id v19 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v21 = [v19 initWithObject:v20];
    visibleSections = v6->_visibleSections;
    v6->_visibleSections = (EFLocked *)v21;

    id v23 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v25 = [v23 initWithObject:v24];
    pendingSectionsToClear = v6->_pendingSectionsToClear;
    v6->_pendingSectionsToClear = (EFLocked *)v25;

    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"MessageListSectionRecent", @"MessageListSectionIndexedSearch", @"MessageListSectionServerSearch", 0);
    [v27 addObject:@"MessageListSectionRecentUnseen"];
    [v27 addObject:@"MessageListSectionGroupedSender"];
    [v27 addObject:@"MessageListSectionGroupedSenderUnseen"];
    uint64_t v28 = [v27 copy];
    messagesSections = v6->_messagesSections;
    v6->_messagesSections = (NSSet *)v28;

    v6->_hasAdditionalSections = EMBlackPearlIsFeatureEnabled();
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    [v4 setPrefetchDataSource:v6];
    id v30 = objc_alloc(MEMORY[0x1E4FB1598]);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __48__MessageListDataSource_initWithCollectionView___block_invoke;
    v36[3] = &unk_1E6D118B0;
    objc_copyWeak(&v37, &location);
    uint64_t v31 = (UICollectionViewDiffableDataSource *)[v30 initWithCollectionView:v4 cellProvider:v36];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __48__MessageListDataSource_initWithCollectionView___block_invoke_2;
    v34[3] = &unk_1E6D118D8;
    objc_copyWeak(&v35, &location);
    [(UICollectionViewDiffableDataSource *)v31 setSupplementaryViewProvider:v34];
    dataSource = v6->_dataSource;
    v6->_dataSource = v31;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)_insertDefaultSectionsIntoSnapshot:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"MessageListSectionPriority", @"MessageListSectionRecent", 0);
    if (EMBlackPearlIsFeatureEnabled())
    {
      objc_msgSend(v4, "insertObject:atIndex:", @"MessageListSectionRecentUnseen", objc_msgSend(v4, "indexOfObject:", @"MessageListSectionRecent"));
      id v5 = [MEMORY[0x1E4F60D58] currentDevice];
      int v6 = [v5 isInternal];

      if (v6) {
        [v4 insertObject:@"MessageListSectionHelpMailLearn" atIndex:0];
      }
      [v4 insertObject:@"MessageListSectionOnboardingTip" atIndex:0];
      [v4 insertObject:@"MessageListSectionBucketBar" atIndex:0];
      [v4 addObject:@"MessageListSectionGroupedSenderUnseen"];
      [v4 addObject:@"MessageListSectionGroupedSender"];
    }
    [v4 addObject:@"MessageListSectionIndexedSearch"];
    if (_os_feature_enabled_impl()) {
      [v4 addObject:@"MessageListSectionServerSearch"];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__MessageListDataSource__insertDefaultSectionsIntoSnapshot___block_invoke;
    v9[3] = &unk_1E6D11C48;
    v9[4] = a1;
    id v7 = v3;
    id v10 = v7;
    uint64_t v8 = objc_msgSend(v4, "ef_compactMap:", v9);
    [v7 appendSectionsWithIdentifiers:v8];
  }
}

void __28__MessageListDataSource_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesSections, 0);
  objc_storeStrong((id *)&self->_pendingSectionsToClear, 0);
  objc_storeStrong((id *)&self->_dataSourcesForObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifiersForSection, 0);
  objc_storeStrong((id *)&self->_visibleSections, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_provider);
}

- (void)resumeUpdates
{
}

- (int64_t)numberOfItems
{
  uint64_t v2 = [(MessageListDataSource *)self dataSource];
  id v3 = [v2 snapshot];
  int64_t v4 = [v3 numberOfItems];

  return v4;
}

id __48__MessageListDataSource_initWithCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  int v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = -[MessageListDataSource _supplementaryViewForCollectionView:elementKind:indexPath:](WeakRetained, v9, v8, v7);

  return v11;
}

- (id)_supplementaryViewForCollectionView:(void *)a3 elementKind:(void *)a4 indexPath:
{
  if (a1)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    id v10 = -[MessageListDataSource _dataSourceForSectionIndex:](a1, [v7 section]);
    id v11 = [v10 configuredReusableSupplementaryViewForCollectionView:v9 elementKind:v8 indexPath:v7];

    id v12 = [a1 delegate];
    [v12 messageListDataSource:a1 didConfigureSupplementaryView:v11 elementKind:v8 section:v10];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (int64_t)numberOfSections
{
  uint64_t v2 = [(MessageListDataSource *)self dataSource];
  id v3 = [v2 snapshot];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (int64_t)numberOfItemsAtSectionIndex:(int64_t)a3
{
  int64_t v4 = [(MessageListDataSource *)self dataSource];
  id v5 = [v4 snapshot];
  int v6 = [v4 sectionIdentifierForIndex:a3];
  int64_t v7 = [v5 numberOfItemsInSection:v6];

  return v7;
}

- (id)itemIdentifiers
{
  uint64_t v2 = [(MessageListDataSource *)self dataSource];
  id v3 = [v2 snapshot];
  int64_t v4 = [v3 itemIdentifiers];

  return v4;
}

uint64_t __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setSet:*(void *)(a1 + 32)];
}

- (void)showMessageListSection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(MessageListDataSource *)self visibleSections];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __57__MessageListDataSource_showMessageListSection_animated___block_invoke;
  id v15 = &unk_1E6D11800;
  uint64_t v17 = &v18;
  id v8 = v6;
  id v16 = v8;
  [v7 performWhileLocked:&v12];
  id v9 = +[MessageListDataSource log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 134218754;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 1024;
    int v27 = v10;
    __int16 v28 = 1024;
    BOOL v29 = v4;
    _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "%p: showMessageListSection: %{public}@, requiresUpdate: %{BOOL}d, animated: %{BOOL}d", buf, 0x22u);
  }

  if (*((unsigned char *)v19 + 24))
  {
    id v11 = -[MessageListDataSource _dataSourceForSection:](self, v8);
    [v11 beginObservingAnimated:v4 nextUpdateNeedsCleanSnapshot:0];
  }
  _Block_object_dispose(&v18, 8);
}

void __57__MessageListDataSource_showMessageListSection_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 containsObject:*(void *)(a1 + 32)] ^ 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [v3 addObject:*(void *)(a1 + 32)];
  }
}

- (void)removeMessageListSection:(id)a3 animated:(BOOL)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[MessageListDataSource _removeMessageListSection:animated:](self, a3, a4);
  id v6 = (void *)v5;
  if (v5)
  {
    v8[0] = v5;
    int64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    -[MessageListDataSource _performDataSourceUpdates:]((uint64_t)self, v7);
  }
}

id __60__MessageListDataSource__removeMessageListSection_animated___block_invoke_26(uint64_t a1)
{
  return +[MessageListSectionDataSourceChange sectionRemovedWithSection:*(void *)(a1 + 32)];
}

- (void)deleteItemsWithIDs:(id)a3 animated:(BOOL)a4 immediateCompletion:(BOOL)a5 completion:(id)a6
{
  BOOL v25 = a5;
  BOOL v7 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = +[MessageListDataSource log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    __int16 v32 = self;
    __int16 v33 = 2114;
    id v34 = v9;
    __int16 v35 = 1024;
    BOOL v36 = v7;
    __int16 v37 = 1024;
    BOOL v38 = v25;
    _os_log_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_DEFAULT, "%p: delete items with ids: %{public}@, animated: %{BOOL}d, immediateCompletion: %{BOOL}d", buf, 0x22u);
  }

  uint64_t v12 = [(MessageListDataSource *)self dataSource];
  uint64_t v13 = [v12 snapshot];

  id v23 = v13;
  __int16 v24 = v9;
  id v14 = -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v9, v13);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = [v14 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        char v21 = [v14 objectForKeyedSubscript:v20];
        id v22 = -[MessageListDataSource _dataSourceForObjectID:](self, v20);
        [v22 deleteItemsWithIDs:v21 animated:v7 useImmediateCompletion:v25 completionHandler:v10];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }
}

- (id)_groupMessagesListItemIDsBySection:(void *)a3 snapshot:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__MessageListDataSource__groupMessagesListItemIDsBySection_snapshot___block_invoke;
    v9[3] = &unk_1E6D11B38;
    id v10 = v5;
    BOOL v7 = objc_msgSend(a2, "ef_groupBy:", v9);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)reloadItemsWithItemIDs:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke;
  v9[3] = &unk_1E6D11A50;
  id v10 = v4;
  id v11 = self;
  id v5 = v9;
  id v6 = (void *)MEMORY[0x1E4F60F28];
  id v7 = v4;
  id v8 = [v6 mainThreadScheduler];
  [v8 performBlock:v5];
}

void __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2;
  v13[3] = &unk_1E6D119E0;
  v13[4] = *(void *)(a1 + 40);
  id v3 = objc_msgSend(v2, "ef_compactMap:", v13);
  uint64_t v4 = [v3 count];
  id v5 = +[MessageListDataSource log];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = [v3 count];
      uint64_t v9 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134218496;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: reload %lu items (intial set: %lu)", buf, 0x20u);
    }

    id v5 = objc_msgSend(v3, "ef_groupBy:", &__block_literal_global_32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2_34;
    v12[3] = &unk_1E6D11A28;
    v12[4] = *(void *)(a1 + 40);
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else if (v6)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: skip reload items (%{public}@) - requested items are not visible", buf, 0x16u);
  }
}

id __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 dataSource];
  id v5 = [v4 indexPathForItemIdentifier:v3];

  return v5;
}

uint64_t __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 section];
  return [v2 numberWithInteger:v3];
}

void __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  -[MessageListDataSource _dataSourceForSectionIndex:](v4, [a2 integerValue]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 reconfigureItemsAtIndexPaths:v5];
}

id __61__MessageListDataSource_reloadVisibleCellsInvalidatingCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "mui_validItemIDsFromExistingItemIDs:updateReason:", *(void *)(a1 + 32), @"reloadVisibleCellsInvalidatingCache");
  uint64_t v5 = [v4 count];
  if (v5)
  {
    id v6 = +[MessageListDataSource log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 134218498;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v4;
      _os_log_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEFAULT, "%p: updateListForChange - reloading (%ld) itemIDs %@", (uint8_t *)&v11, 0x20u);
    }

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v8 = [*(id *)(a1 + 48) messageList];
      [v8 invalidateCacheForItemIDs:v4];
    }
    [v3 reloadItemsWithIdentifiers:v4];
  }
  uint64_t v9 = +[MessageListSectionDataSourceChange updated:v5];

  return v9;
}

- (void)reconfigureVisibleCells
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = -[MessageListDataSource _indexPathsForPreparedItems](self);
  if ([v3 count])
  {
    uint64_t v4 = [(MessageListDataSource *)self dataSource];
    uint64_t v5 = [v4 snapshot];

    id v6 = objc_msgSend(v5, "mui_validItemIDsFromIndexPaths:", v3);
    uint64_t v7 = +[MessageListDataSource log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218754;
      uint64_t v9 = self;
      __int16 v10 = 2048;
      uint64_t v11 = [v3 count];
      __int16 v12 = 2112;
      __int16 v13 = v3;
      __int16 v14 = 2048;
      uint64_t v15 = [v6 count];
      _os_log_impl(&dword_1DDCDB000, v7, OS_LOG_TYPE_DEFAULT, "%p: updateListForChange - reconfigureVisibleCells visible cells at (%lu) indexPaths:%@ itemIDs (%lu)", (uint8_t *)&v8, 0x2Au);
    }

    [(MessageListDataSource *)self reloadItemsWithItemIDs:v6];
  }
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(MessageListDataSource *)self dataSource];
    id v6 = [v5 itemIdentifierForIndexPath:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)indexPathForItemIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(MessageListDataSource *)self dataSource];
    id v6 = [v5 indexPathForItemIdentifier:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)messageListAtSectionIndex:(int64_t)a3
{
  uint64_t v5 = [(MessageListDataSource *)self dataSource];
  id v6 = [v5 sectionIdentifierForIndex:a3];

  uint64_t v7 = -[MessageListDataSource _messageListInSectionWithObjectIdentifier:](self, v6);

  return v7;
}

- (id)_messageListInSectionWithObjectIdentifier:(void *)a1
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    id v3 = -[MessageListDataSource _dataSourceForObjectID:](a1, a2);
    uint64_t v2 = [v3 messageList];
  }
  return v2;
}

- (id)messageListForSection:(id)a3
{
  id v4 = -[MessageListDataSource _objectIDForSection:](self, a3);
  uint64_t v5 = -[MessageListDataSource _messageListInSectionWithObjectIdentifier:](self, v4);

  return v5;
}

- (int64_t)sectionIndexForSection:(id)a3
{
  id v4 = -[MessageListDataSource _objectIDForSection:](self, a3);
  uint64_t v5 = [(MessageListDataSource *)self dataSource];
  int64_t v6 = [v5 indexForSectionIdentifier:v4];

  return v6;
}

- (id)messageListForMessageListItemWithIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(MessageListDataSource *)self dataSource];
    int64_t v6 = [v5 snapshot];
    uint64_t v7 = [v6 sectionIdentifierForSectionContainingItemIdentifier:v4];

    int v8 = -[MessageListDataSource _messageListInSectionWithObjectIdentifier:](self, v7);
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (void)refresh
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = -[MessageListDataSource _allDataSources](self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = [(MessageListDataSource *)self messagesSections];
        __int16 v10 = [v8 section];
        int v11 = [v9 containsObject:v10];

        if (v11) {
          [v8 refresh];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)_allDataSources
{
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3032000000;
    int v8 = __Block_byref_object_copy_;
    uint64_t v9 = __Block_byref_object_dispose_;
    id v10 = 0;
    os_log_t v1 = [a1 dataSourcesForObjectIdentifier];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__MessageListDataSource__allDataSources__block_invoke;
    v4[3] = &unk_1E6D11B10;
    v4[4] = &v5;
    [v1 performWhileLocked:v4];

    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)messageListItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(MessageListDataSource *)self dataSource];
    uint64_t v6 = [v5 itemIdentifierForIndexPath:v4];

    if (v6)
    {
      uint64_t v7 = -[MessageListDataSource _dataSourceForSectionIndex:](self, [v4 section]);
      int v8 = [v7 messageList];
      uint64_t v9 = [v8 messageListItemForItemID:v6];
    }
    else
    {
      id v10 = +[MessageListDataSource log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(MessageListDataSource *)(uint64_t)self messageListItemAtIndexPath:v10];
      }

      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)messageListItemForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  uint64_t v6 = [v5 messageList];
  uint64_t v7 = [v6 messageListItemForItemID:v4];

  return v7;
}

- (id)_dataSourceContainingItemID:(void *)a1
{
  id v2 = 0;
  if (a1 && a2)
  {
    id v4 = a2;
    uint64_t v5 = [a1 dataSource];
    uint64_t v6 = [v5 snapshot];
    uint64_t v7 = [v6 sectionIdentifierForSectionContainingItemIdentifier:v4];

    id v2 = -[MessageListDataSource _dataSourceForObjectID:](a1, v7);
  }
  return v2;
}

- (id)messageListItemForItemID:(id)a3 section:(id)a4
{
  id v6 = a3;
  uint64_t v7 = -[MessageListDataSource _dataSourceForSection:](self, a4);
  int v8 = [v7 messageList];
  uint64_t v9 = [v8 messageListItemForItemID:v6];

  return v9;
}

- (id)messageListItemsForItemIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MessageListDataSource *)self dataSource];
  id v6 = [v5 snapshot];

  uint64_t v19 = v6;
  uint64_t v20 = v4;
  uint64_t v7 = -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v4, v6);
  int v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v7 allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v14 = [v7 objectForKeyedSubscript:v13];
        long long v15 = -[MessageListDataSource _dataSourceForObjectID:](self, v13);
        uint64_t v16 = [v15 messageList];
        uint64_t v17 = [v16 messageListItemsForItemIDs:v14];
        [v8 addObjectsFromArray:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)messageListItemsForItemIDs:(id)a3 section:(id)a4
{
  id v6 = a3;
  uint64_t v7 = -[MessageListDataSource _dataSourceForSection:](self, a4);
  int v8 = [v7 messageList];
  uint64_t v9 = [v8 messageListItemsForItemIDs:v6];

  return v9;
}

- (id)messageListItemsInSection:(id)a3 limit:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = -[MessageListDataSource _dataSourceForSection:](self, a3);
  int v8 = [v7 messageList];
  uint64_t v9 = [v8 allItemIDs];
  uint64_t v10 = [v9 result];

  if ([v10 count] > a4)
  {
    uint64_t v11 = +[MessageListDataSource log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = NSStringFromSelector(a2);
      int v16 = 134218754;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = [v10 count];
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      _os_log_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ - limit the itemIDs.count:%lu to limit:%lu", (uint8_t *)&v16, 0x2Au);
    }
    uint64_t v13 = objc_msgSend(v10, "subarrayWithRange:", 0, a4);

    uint64_t v10 = (void *)v13;
  }
  long long v14 = [v8 messageListItemsForItemIDs:v10];

  return v14;
}

- (id)messagesInMessageListItem:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 itemID];
      uint64_t v7 = -[MessageListDataSource _dataSourceContainingItemID:](self, v6);

      int v8 = [v4 allItemIDs];
      uint64_t v9 = [v8 result:0];

      uint64_t v10 = [v7 messageList];
      uint64_t v11 = [v10 messageListItemsForItemIDs:v9];
      uint64_t v5 = objc_msgSend(v11, "ef_map:", &__block_literal_global_43);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if (v5) {
    long long v12 = v5;
  }
  else {
    long long v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v13 = v12;

  return v13;
}

id __51__MessageListDataSource_messagesInMessageListItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 result];
  id v3 = [v2 displayMessage];
  id v4 = [v3 result];

  return v4;
}

- (id)objectIDForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  id v6 = [v5 messageList];
  uint64_t v7 = [v6 objectIDForItemID:v4];

  return v7;
}

- (void)applyFilterPredicate:(id)a3 userFiltered:(BOOL)a4 ignoreMessagesPredicate:(id)a5 section:(id)a6
{
  BOOL v8 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = -[MessageListDataSource _dataSourceForSection:](self, v12);
  BOOL v14 = -[MessageListDataSource _isSectionVisible:]((BOOL)self, v12);
  long long v15 = +[MessageListDataSource log];
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v17 = 134218754;
      __int16 v18 = self;
      __int16 v19 = 1024;
      BOOL v20 = v10 != 0;
      __int16 v21 = 2114;
      id v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_DEFAULT, "%p: applyFilterPredicate: %{BOOL}d, section: %{public}@, dataSource: %{public}@", (uint8_t *)&v17, 0x26u);
    }

    [v13 applyFilterPredicate:v10 userFiltered:v8 ignoreMessagesPredicate:v11];
  }
  else
  {
    if (v16)
    {
      int v17 = 134218754;
      __int16 v18 = self;
      __int16 v19 = 1024;
      BOOL v20 = v10 != 0;
      __int16 v21 = 2114;
      id v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_DEFAULT, "%p: Cannot apply filter to hidden section: %{BOOL}d, section: %{public}@, dataSource: %{public}@", (uint8_t *)&v17, 0x26u);
    }
  }
}

- (BOOL)_isSectionVisible:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    id v4 = [(id)a1 visibleSections];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__MessageListDataSource__isSectionVisible___block_invoke;
    v6[3] = &unk_1E6D11800;
    BOOL v8 = &v9;
    id v7 = v3;
    [v4 performWhileLocked:v6];

    a1 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

- (BOOL)isExpandedThread:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  id v6 = [v5 messageList];
  id v7 = [v6 expandedThreadItemIDs];
  char v8 = [v7 containsObject:v4];

  return v8;
}

- (BOOL)anyExpandedThreadContainsItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  id v6 = [v5 messageList];
  char v7 = [v6 anyExpandedThreadContainsItemID:v4];

  return v7;
}

- (id)threadItemIDForItemInExpandedThread:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  id v6 = [v5 threadItemIDForItemInExpandedThread:v4];

  return v6;
}

- (id)itemIDsInExpandedThread:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  id v6 = [v5 itemIDsInExpandedThread:v4];

  return v6;
}

- (void)didScheduleReadInteractionForItemID:(id)a3
{
  id v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 didScheduleReadInteractionForItemID:v4];
}

- (id)relatedItemIDsForSelectedItemID:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  char v7 = -[MessageListDataSource _dataSourceForSectionIndex:](self, [a4 section]);
  char v8 = [(MessageListDataSource *)self dataSource];
  uint64_t v9 = [v8 snapshot];
  id v10 = [v7 relatedItemIDsForSelectedItemID:v6 snapshot:v9];

  return v10;
}

- (id)sectionAfterIndex:(int64_t)a3
{
  id v5 = [(MessageListDataSource *)self collectionView];
  id v6 = v5;
  for (int64_t i = a3 + 1; i < [v5 numberOfSections]; ++i)
  {
    if ([v6 numberOfItemsInSection:i])
    {
      char v8 = [(MessageListDataSource *)self sectionAtIndex:i];
      if ([(MessageListDataSource *)self messageListSectionIsVisible:v8]) {
        goto LABEL_8;
      }
    }
    id v5 = v6;
  }
  char v8 = 0;
LABEL_8:

  return v8;
}

uint64_t __40__MessageListDataSource__allDataSources__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allValues];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

uint64_t __69__MessageListDataSource__groupMessagesListItemIDsBySection_snapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sectionIdentifierForSectionContainingItemIdentifier:a2];
}

uint64_t __43__MessageListDataSource__isSectionVisible___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)didSelectDisclosureButtonForMessageListItem:(id)a3 disclosureEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [v6 itemID];
  -[MessageListDataSource _dataSourceContainingItemID:](self, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 didSelectDisclosureButtonForMessageListItem:v6 disclosureEnabled:v4];
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__MessageListDataSource_collectionView_prefetchItemsAtIndexPaths___block_invoke;
  v27[3] = &unk_1E6D11B60;
  v27[4] = self;
  uint64_t v5 = objc_msgSend(a4, "ef_compactMap:", v27);
  id v6 = [(MessageListDataSource *)self dataSource];
  char v7 = [v6 snapshot];

  __int16 v21 = v7;
  id v22 = v5;
  id v8 = -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v5, v7);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v15 = -[MessageListDataSource _dataSourceForObjectID:](self, v14);
        BOOL v16 = objc_msgSend(v8, "objectForKeyedSubscript:", v14, v21, v22);
        int v17 = +[MessageListDataSource log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v16 count];
          *(_DWORD *)buf = 134218498;
          long long v29 = self;
          __int16 v30 = 2048;
          uint64_t v31 = v18;
          __int16 v32 = 2112;
          __int16 v33 = v16;
          _os_log_impl(&dword_1DDCDB000, v17, OS_LOG_TYPE_DEFAULT, "%p: Prefetch %lu itemIDs: %@", buf, 0x20u);
        }

        __int16 v19 = [v15 messageList];
        id v20 = (id)[v19 messageListItemsForItemIDs:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v11);
  }
}

id __66__MessageListDataSource_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 dataSource];
  uint64_t v5 = [v4 itemIdentifierForIndexPath:v3];

  return v5;
}

uint64_t __51__MessageListDataSource__performDataSourceUpdates___block_invoke_2_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)messageListSectionDataSource:(id)a3 itemIdentifiersForIndexPaths:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListDataSource *)self dataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MessageListDataSource_messageListSectionDataSource_itemIdentifiersForIndexPaths___block_invoke;
  v10[3] = &unk_1E6D11B60;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(v5, "ef_compactMap:", v10);

  return v8;
}

uint64_t __83__MessageListDataSource_messageListSectionDataSource_itemIdentifiersForIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemIdentifierForIndexPath:a2];
}

- (id)messageListSectionDataSource:(id)a3 itemIdentifierForIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListDataSource *)self dataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  return v7;
}

- (id)messageListSectionDataSource:(id)a3 indexPathForItemIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListDataSource *)self dataSource];
  id v7 = [v6 indexPathForItemIdentifier:v5];

  return v7;
}

- (id)messageListSectionDataSource:(id)a3 indexPathsForItemIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListDataSource *)self dataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MessageListDataSource_messageListSectionDataSource_indexPathsForItemIdentifiers___block_invoke;
  v10[3] = &unk_1E6D119E0;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(v5, "ef_compactMap:", v10);

  return v8;
}

uint64_t __83__MessageListDataSource_messageListSectionDataSource_indexPathsForItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexPathForItemIdentifier:a2];
}

- (BOOL)shouldReloadMessageListSectionDataSource:(id)a3
{
  BOOL v4 = [a3 section];
  LOBYTE(self) = [(MessageListDataSource *)self messageListSectionIsVisible:v4];

  return (char)self;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setUpdateQueue:(id)a3
{
}

- (void)setVisibleSections:(id)a3
{
}

- (void)setObjectIdentifiersForSection:(id)a3
{
}

- (void)setDataSourcesForObjectIdentifier:(id)a3
{
}

- (BOOL)hasAdditionalSections
{
  return self->_hasAdditionalSections;
}

- (void)setHasAdditionalSections:(BOOL)a3
{
  self->_hasAdditionalSections = a3;
}

- (void)setPendingSectionsToClear:(id)a3
{
}

- (void)setMessagesSections:(id)a3
{
}

- (void)messageListItemAtIndexPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_ERROR, "%p: No EMCollectionItemID found at index path: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end