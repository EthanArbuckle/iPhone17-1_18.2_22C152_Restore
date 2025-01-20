@interface MessageListSectionDataSource
+ (BOOL)isAdditionChange:(id)a3;
+ (BOOL)isFirstChange:(id)a3;
+ (BOOL)isValidChange:(id)a3;
+ (id)publicDescriptionForChange:(id)a3;
+ (int64_t)numberOfChanges:(id)a3;
- (BOOL)_isSectionHeaderAllowed;
- (BOOL)hasReloadedForTimeOut;
- (BOOL)hasSupplementaryViewOfKind:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRefreshing;
- (BOOL)messageListItemHelper:(id)a3 anyExpandedThreadContainsItemID:(id)a4;
- (BOOL)messageListItemHelper:(id)a3 isItemIDExpandedThread:(id)a4;
- (BOOL)messageListItemHelper:(id)a3 isItemIDSelected:(id)a4;
- (BOOL)nextUpdateNeedsCleanSnapshot;
- (BOOL)shouldShowSupplementaryViewOfKindIfEmpty:(id)a3 isIndexing:(BOOL)a4;
- (EFCancelable)numberOfPreviewLinesToken;
- (EFCancelable)shouldAlertOnBlankCellToken;
- (EFLocked)failedItemIDs;
- (EFPromise)initialLoadCompletedPromise;
- (EMCachingContactStore)contactStore;
- (EMMessageList)messageList;
- (EMObjectID)objectID;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (MessageListCellLayoutValuesHelper)layoutValuesHelper;
- (MessageListCollectionHelper)collectionHelper;
- (MessageListItemHelper)itemHelper;
- (MessageListSectionDataSource)initWithConfiguration:(id)a3;
- (MessageListSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9 headerType:(unint64_t)a10;
- (MessageListSectionDataSourceDelegate)delegate;
- (MessageListSectionDataSourceProvider)provider;
- (MessageListSectionDataSourceSelectionModelProvider)selectionModelProvider;
- (MessageListThreadHelper)threadHelper;
- (MessageListViewControllerState)state;
- (NSMutableSet)timedOutItemIDs;
- (NSSet)expandedThreadItemIDs;
- (NSString)section;
- (OS_os_log)log;
- (OS_os_log)signpostLog;
- (UICollectionView)collectionView;
- (UICollectionViewSupplementaryRegistration)headerRegistration;
- (id)_preparedMessageListItemIDs;
- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6;
- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5;
- (id)itemIDsInExpandedThread:(id)a3;
- (id)messageListItemForItemID:(id)a3 indexPath:(id)a4 receiver:(id)a5 completion:(id)a6;
- (id)relatedItemIDsForSelectedItemID:(id)a3 snapshot:(id)a4;
- (id)threadItemIDForItemInExpandedThread:(id)a3;
- (int64_t)numberOfPreviewLines;
- (unint64_t)hash;
- (unint64_t)headerType;
- (void)_addedItemIDs:(id)a3 before:(BOOL)a4 existingItemID:(id)a5 toThreadWithItemID:(id)a6 inCollection:(id)a7;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5;
- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 animated:(BOOL)a5 useImmediateCompletion:(BOOL)a6 completionHandler:(id)a7;
- (void)_enumerateItemIDs:(id)a3 block:(id)a4;
- (void)_maybeReloadForTimedOutItemIDs;
- (void)_performDataSourceUpdateAnimated:(BOOL)a3 cleanSnapshot:(BOOL)a4 prepare:(id)a5 update:(id)a6 completion:(id)a7;
- (void)_recordTailspinForBlankCellWithError:(void *)a1;
- (void)_recoverFailedItemIDsIfNeededForCollection:(id)a3 completion:(id)a4;
- (void)_recoverFailedItemIDsIfNeededForCollection:(id)a3 excluding:(id)a4 completion:(id)a5;
- (void)_reloadDataSource;
- (void)_reloadItemsWithItemIDs:(id)a3;
- (void)_reloadPreparedItemIDsForCollection:(id)a3 completion:(id)a4;
- (void)_showBlankCellAlertWithItemID:(void *)a3 indexPath:(void *)a4 reason:;
- (void)_updateSelectionStateForItemsWithIDs:(id)a3 inThreadWithItemID:(id)a4 snapshot:(id)a5 shouldDeselectMessages:(BOOL)a6;
- (void)applyFilterPredicate:(id)a3 userFiltered:(BOOL)a4 ignoreMessagesPredicate:(id)a5;
- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7;
- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 didFinishInitialLoadForThreadWithItemID:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 oldestItemsUpdatedForMailboxes:(id)a4;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)dealloc;
- (void)deleteItemsWithIDs:(id)a3 animated:(BOOL)a4 useImmediateCompletion:(BOOL)a5 completionHandler:(id)a6;
- (void)didFinishRecoveryForCollection:(id)a3;
- (void)didFinishRemoteSearchForCollection:(id)a3;
- (void)didScheduleReadInteractionForItemID:(id)a3;
- (void)didSelectDisclosureButtonForMessageListItem:(id)a3 disclosureEnabled:(BOOL)a4;
- (void)messageListThreadHelper:(id)a3 didCollapseMessageListItem:(id)a4;
- (void)messageListThreadHelper:(id)a3 didExpandMessageListItem:(id)a4;
- (void)reconfigureItemsAtIndexPaths:(id)a3;
- (void)refresh;
- (void)replaceMessageList:(id)a3 initialLoadCompletedPromise:(id)a4;
- (void)setBrandIndicatorProvider:(id)a3;
- (void)setCollectionHelper:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFailedItemIDs:(id)a3;
- (void)setHasReloadedForTimeOut:(BOOL)a3;
- (void)setHeaderRegistration:(id)a3;
- (void)setHeaderType:(unint64_t)a3;
- (void)setInitialLoadCompletedPromise:(id)a3;
- (void)setIsRefreshing:(BOOL)a3;
- (void)setItemHelper:(id)a3;
- (void)setLayoutValuesHelper:(id)a3;
- (void)setLog:(id)a3;
- (void)setMessageList:(id)a3;
- (void)setNextUpdateNeedsCleanSnapshot:(BOOL)a3;
- (void)setNumberOfPreviewLines:(int64_t)a3;
- (void)setNumberOfPreviewLinesToken:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSelectionModelProvider:(id)a3;
- (void)setShouldAlertOnBlankCellToken:(id)a3;
- (void)setSignpostLog:(id)a3;
- (void)setState:(id)a3;
- (void)setThreadHelper:(id)a3;
- (void)setTimedOutItemIDs:(id)a3;
- (void)stopObserving;
@end

@implementation MessageListSectionDataSource

uint64_t __56__MessageListSectionDataSource__enumerateItemIDs_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
}

void __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 mutableCopy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [v6 removeAllObjects];
}

+ (BOOL)isFirstChange:(id)a3
{
  return [a3 isFirstChange];
}

+ (int64_t)numberOfChanges:(id)a3
{
  return [a3 numberOfChanges];
}

- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4
{
  if (a4)
  {
    os_unfair_lock_lock(&self->_nextUpdateNeedsCleanSnapshotLock);
    [(MessageListSectionDataSource *)self setNextUpdateNeedsCleanSnapshot:1];
    os_unfair_lock_unlock(&self->_nextUpdateNeedsCleanSnapshotLock);
  }
  os_unfair_lock_lock(&self->_isRefreshingLock);
  [(MessageListSectionDataSource *)self setIsRefreshing:0];
  os_unfair_lock_unlock(&self->_isRefreshingLock);
  id v5 = [(MessageListSectionDataSource *)self messageList];
  [v5 beginObserving:self];
}

- (void)setIsRefreshing:(BOOL)a3
{
  self->_isRefreshing = a3;
}

- (unint64_t)hash
{
  v2 = [(MessageListSectionDataSource *)self section];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)section
{
  return self->_section;
}

- (BOOL)hasSupplementaryViewOfKind:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4FB2770]]
      && [(MessageListSectionDataSource *)self _isSectionHeaderAllowed];
}

- (BOOL)_isSectionHeaderAllowed
{
  return [(MessageListSectionDataSource *)self headerType] == 3;
}

- (unint64_t)headerType
{
  return self->_headerType;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (MessageListThreadHelper)threadHelper
{
  return self->_threadHelper;
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a4 == 1)
  {
    v8 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(a1 + 40) count];
      if (*(unsigned char *)(a1 + 96)) {
        v11 = @"before";
      }
      else {
        v11 = @"after";
      }
      uint64_t v12 = *(void *)(a1 + 48);
      v13 = objc_msgSend(v7, "ef_shortDescriptionString");
      uint64_t v14 = *(void *)(a1 + 56);
      v15 = *(void **)(a1 + 64);
      int v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      int v17 = *(unsigned __int8 *)(a1 + 97);
      int v18 = *(unsigned __int8 *)(a1 + 98);
      int v19 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      int v20 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      int v45 = 134220802;
      uint64_t v46 = v9;
      __int16 v47 = 2048;
      uint64_t v48 = v10;
      __int16 v49 = 2114;
      v50 = v11;
      __int16 v51 = 2112;
      uint64_t v52 = v12;
      __int16 v53 = 2112;
      uint64_t v54 = (uint64_t)v13;
      __int16 v55 = 2112;
      uint64_t v56 = v14;
      __int16 v57 = 2048;
      v58 = v15;
      __int16 v59 = 1024;
      *(_DWORD *)v60 = v16;
      *(_WORD *)&v60[4] = 1024;
      *(_DWORD *)&v60[6] = v17;
      LOWORD(v61) = 1024;
      *(_DWORD *)((char *)&v61 + 2) = v18;
      HIWORD(v61) = 1024;
      *(_DWORD *)v62 = v19;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)v63 = v20;
      _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Added %lu item IDs %{public}@ %@: %@. To Thread: %@ for Message List: %p. Should deselect expanding items: %d (Select All: %d, Initial Load Completed: %d, Is Expanding: %d, Parent is selected: %d)", (uint8_t *)&v45, 0x66u);
    }
  }
  else
  {
    if (a3 != 1)
    {
      v33 = [*(id *)(a1 + 32) log];
      v8 = v33;
      if (a3 == a4)
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        uint64_t v34 = *(void *)(a1 + 32);
        uint64_t v35 = [*(id *)(a1 + 40) count];
        if (*(unsigned char *)(a1 + 96)) {
          v36 = @"before";
        }
        else {
          v36 = @"after";
        }
        uint64_t v37 = *(void *)(a1 + 48);
        v38 = objc_msgSend(v7, "ef_shortDescriptionString");
        int v45 = 134219522;
        uint64_t v46 = v34;
        __int16 v47 = 2048;
        uint64_t v48 = v35;
        __int16 v49 = 2114;
        v50 = v36;
        __int16 v51 = 2112;
        uint64_t v52 = v37;
        __int16 v53 = 2048;
        uint64_t v54 = a4;
        __int16 v55 = 2048;
        uint64_t v56 = a4;
        __int16 v57 = 2112;
        v58 = v38;
        v39 = v8;
        os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      }
      else
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
          goto LABEL_25;
        }
        uint64_t v41 = *(void *)(a1 + 32);
        uint64_t v42 = [*(id *)(a1 + 40) count];
        if (*(unsigned char *)(a1 + 96)) {
          v43 = @"before";
        }
        else {
          v43 = @"after";
        }
        uint64_t v44 = *(void *)(a1 + 48);
        v38 = objc_msgSend(v7, "ef_shortDescriptionString");
        int v45 = 134219522;
        uint64_t v46 = v41;
        __int16 v47 = 2048;
        uint64_t v48 = v42;
        __int16 v49 = 2114;
        v50 = v43;
        __int16 v51 = 2112;
        uint64_t v52 = v44;
        __int16 v53 = 2048;
        uint64_t v54 = a3;
        __int16 v55 = 2048;
        uint64_t v56 = a4;
        __int16 v57 = 2112;
        v58 = v38;
        v39 = v8;
        os_log_type_t v40 = OS_LOG_TYPE_INFO;
      }
      _os_log_impl(&dword_1DDCDB000, v39, v40, "%p: Added %lu item IDs %{public}@ %@ (log %lu/%lu): %@.", (uint8_t *)&v45, 0x48u);

      goto LABEL_25;
    }
    v8 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = [*(id *)(a1 + 40) count];
      if (*(unsigned char *)(a1 + 96)) {
        v23 = @"before";
      }
      else {
        v23 = @"after";
      }
      uint64_t v24 = *(void *)(a1 + 48);
      v25 = objc_msgSend(v7, "ef_shortDescriptionString");
      uint64_t v26 = *(void *)(a1 + 56);
      uint64_t v27 = *(void *)(a1 + 64);
      int v28 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      int v29 = *(unsigned __int8 *)(a1 + 97);
      int v30 = *(unsigned __int8 *)(a1 + 98);
      int v31 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      int v32 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      int v45 = 134221314;
      uint64_t v46 = v21;
      __int16 v47 = 2048;
      uint64_t v48 = v22;
      __int16 v49 = 2114;
      v50 = v23;
      __int16 v51 = 2112;
      uint64_t v52 = v24;
      __int16 v53 = 2048;
      uint64_t v54 = 1;
      __int16 v55 = 2048;
      uint64_t v56 = a4;
      __int16 v57 = 2112;
      v58 = v25;
      __int16 v59 = 2112;
      *(void *)v60 = v26;
      *(_WORD *)&v60[8] = 2048;
      uint64_t v61 = v27;
      *(_WORD *)v62 = 1024;
      *(_DWORD *)&v62[2] = v28;
      *(_WORD *)v63 = 1024;
      *(_DWORD *)&v63[2] = v29;
      __int16 v64 = 1024;
      int v65 = v30;
      __int16 v66 = 1024;
      int v67 = v31;
      __int16 v68 = 1024;
      int v69 = v32;
      _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Added %lu item IDs %{public}@ %@ (log %lu/%lu): %@. To Thread: %@ for Message List: %p. Should deselect expanding items: %d (Select All: %d, Initial Load Completed: %d, Is Expanding: %d, Parent is selected: %d)", (uint8_t *)&v45, 0x7Au);
    }
  }
LABEL_25:
}

- (OS_os_log)log
{
  return self->_log;
}

- (BOOL)messageListItemHelper:(id)a3 isItemIDExpandedThread:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListSectionDataSource *)self messageList];
  id v7 = [v6 expandedThreadItemIDs];
  char v8 = [v7 containsObject:v5];

  return v8;
}

- (BOOL)messageListItemHelper:(id)a3 anyExpandedThreadContainsItemID:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListSectionDataSource *)self messageList];
  char v7 = [v6 anyExpandedThreadContainsItemID:v5];

  return v7;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (MessageListViewControllerState)state
{
  return self->_state;
}

- (MessageListSectionDataSourceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (MessageListSectionDataSourceProvider *)WeakRetained;
}

- (MessageListSectionDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MessageListSectionDataSourceDelegate *)WeakRetained;
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (MessageListItemHelper)itemHelper
{
  itemHelper = self->_itemHelper;
  if (!itemHelper)
  {
    uint64_t v4 = [(MessageListSectionDataSource *)self threadHelper];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = [[MessageListItemHelper alloc] initWithDelegate:self];
    }
    char v7 = self->_itemHelper;
    self->_itemHelper = v6;

    itemHelper = self->_itemHelper;
  }
  return itemHelper;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)_updateSelectionStateForItemsWithIDs:(id)a3 inThreadWithItemID:(id)a4 snapshot:(id)a5 shouldDeselectMessages:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__MessageListSectionDataSource__updateSelectionStateForItemsWithIDs_inThreadWithItemID_snapshot_shouldDeselectMessages___block_invoke;
  v19[3] = &unk_1E6D121B0;
  BOOL v23 = a6;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  v13 = v19;
  uint64_t v14 = (void *)MEMORY[0x1E4F60F28];
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  int v18 = [v14 mainThreadScheduler];
  [v18 performBlock:v13];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __96__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_before_unreadItemIDs___block_invoke;
  v21[3] = &unk_1E6D11F08;
  v21[4] = self;
  id v22 = v12;
  id v23 = v14;
  id v24 = v13;
  id v25 = v11;
  id v15 = (void *)MEMORY[0x1E4F60F28];
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  id v19 = v11;
  id v20 = [v15 mainThreadScheduler];
  [v20 performBlock:v21];
}

- (EMObjectID)objectID
{
  return self->_objectID;
}

void __120__MessageListSectionDataSource__updateSelectionStateForItemsWithIDs_inThreadWithItemID_snapshot_shouldDeselectMessages___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) selectionModelProvider];
  unint64_t v3 = [v2 selectionModelForMessageListSectionDataSource:*(void *)(a1 + 32)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 64);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      uint64_t v32 = v6;
      __int16 v33 = 1024;
      int v34 = v5;
      __int16 v35 = 2112;
      uint64_t v36 = v7;
      __int16 v37 = 2112;
      uint64_t v38 = v8;
      _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Update selection (should deselect: %d) for %@ in thread %@", buf, 0x26u);
    }

    uint64_t v9 = objc_msgSend(*(id *)(a1 + 56), "mui_validItemIDFromExistingItemID:updateReason:", *(void *)(a1 + 48), @"Adding items");
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 64))
    {
      id v11 = [v3 deselectItemWithItemID:*(void *)(a1 + 48)];
      [v10 addObjectsFromArray:v11];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = objc_msgSend(v3, "deselectItemWithItemID:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
            [v10 addObjectsFromArray:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v14);
      }
    }
    if (v9)
    {
      id v18 = [*(id *)(a1 + 32) threadHelper];
      id v19 = [v18 itemIDsForReloadAfterInsertingItemsAfterItemID:v9 snapshot:*(void *)(a1 + 56)];
      if (v19)
      {
        id v20 = *(void **)(a1 + 32);
        id v21 = [v10 allObjects];
        id v22 = [v19 arrayByAddingObjectsFromArray:v21];
        [v20 _reloadItemsWithItemIDs:v22];

        [v3 didExpandThreadItemID:v9 addedItemIDs:*(void *)(a1 + 40)];
        id v23 = [*(id *)(a1 + 40) lastObject];
        int v29 = v23;
        id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        [v18 addItemIDsNeedingReloadPostUpdate:v24];
      }
    }
  }
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 32) threadHelper];
  uint64_t v4 = [(id)*v2 selectionModelProvider];
  int v5 = [v4 selectionModelForMessageListSectionDataSource:*v2];

  *(unsigned char *)(*(void *)(v2[5] + 8) + 24) = [v3 isThreadExpandingWithItemID:v2[1]];
  char v6 = [v5 isSelectAll];
  *(unsigned char *)(*(void *)(v2[6] + 8) + 24) = [v5 isSelectedItemID:v2[1]];
  if (*(unsigned char *)(*(void *)(v2[5] + 8) + 24) || (v6 & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      LOBYTE(v7) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 0;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v7;
  uint64_t v8 = a1 + 96;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2;
  v21[3] = &unk_1E6D11FF8;
  v21[4] = v9;
  id v22 = *(id *)(a1 + 48);
  char v28 = *(unsigned char *)(a1 + 104);
  id v23 = *(id *)(a1 + 56);
  id v24 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 88);
  id v25 = v11;
  uint64_t v26 = v12;
  char v29 = v6;
  char v30 = 1;
  long long v27 = *(_OWORD *)(a1 + 72);
  [v9 _enumerateItemIDs:v10 block:v21];
  uint64_t v13 = [MEMORY[0x1E4F60D58] currentDevice];
  char v14 = [v13 isInternal];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:*(void *)(*(void *)(*(void *)v8 + 8) + 40)];
    uint64_t v16 = [v15 count];
    if (v16 != [*(id *)(*(void *)(*(void *)v8 + 8) + 40) count])
    {
      id v17 = [(id)*v2 log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_cold_1();
      }

      uint64_t v18 = [v15 array];
      uint64_t v19 = *(void *)(*(void *)v8 + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
}

- (BOOL)messageListItemHelper:(id)a3 isItemIDSelected:(id)a4
{
  id v5 = a4;
  char v6 = [(MessageListSectionDataSource *)self selectionModelProvider];
  uint64_t v7 = [v6 selectionModelForMessageListSectionDataSource:self];
  char v8 = [v7 isSelectedItemID:v5];

  return v8;
}

- (MessageListSectionDataSourceSelectionModelProvider)selectionModelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionModelProvider);
  return (MessageListSectionDataSourceSelectionModelProvider *)WeakRetained;
}

- (void)_enumerateItemIDs:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = vcvtpd_u64_f64((double)(unint64_t)[v5 count] / 200.0);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MessageListSectionDataSource__enumerateItemIDs_block___block_invoke;
  v9[3] = &unk_1E6D12098;
  id v8 = v6;
  id v10 = v8;
  id v11 = v13;
  unint64_t v12 = v7;
  objc_msgSend(v5, "ef_enumerateObjectsInBatchesOfSize:block:", 200, v9);

  _Block_object_dispose(v13, 8);
}

uint64_t __96__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_before_unreadItemIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addedItemIDs:*(void *)(a1 + 40) before:1 existingItemID:*(void *)(a1 + 48) toThreadWithItemID:*(void *)(a1 + 56) inCollection:*(void *)(a1 + 64)];
}

id __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  unint64_t v3 = [*(id *)(a1 + 32) threadHelper];
  uint64_t v4 = [v3 popItemIDsNeedingReloadPostUpdate];

  if ([v4 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_2;
    v14[3] = &unk_1E6D11860;
    v14[4] = *(void *)(a1 + 32);
    id v5 = objc_msgSend(v4, "ef_filter:", v14);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_3;
    v11[3] = &unk_1E6D11A50;
    uint64_t v6 = *(void *)(a1 + 32);
    id v12 = v5;
    uint64_t v13 = v6;
    unint64_t v7 = (void *)MEMORY[0x1E4F60F28];
    id v8 = v5;
    uint64_t v9 = [v7 mainThreadScheduler];
    [v9 performBlock:v11];
  }
  return v2;
}

- (MessageListCollectionHelper)collectionHelper
{
  return self->_collectionHelper;
}

- (void)_addedItemIDs:(id)a3 before:(BOOL)a4 existingItemID:(id)a5 toThreadWithItemID:(id)a6 inCollection:(id)a7
{
  BOOL v30 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(MessageListSectionDataSource *)self messageList];

  if (v16 == v15)
  {
    id v17 = [(MessageListSectionDataSource *)self provider];
    if (!v17)
    {
      char v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"MessageListSectionDataSource.m" lineNumber:782 description:@"provider cannot be nil"];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v63 = __Block_byref_object_copy__0;
    __int16 v64 = __Block_byref_object_dispose__0;
    id v65 = (id)0xAAAAAAAAAAAAAAAALL;
    id v65 = (id)[v12 copy];
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    char v59 = -86;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x2020000000;
    char v57 = -86;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x2020000000;
    char v55 = -86;
    uint64_t v19 = [(MessageListSectionDataSource *)self signpostLog];
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    id v21 = [(MessageListSectionDataSource *)self signpostLog];
    id v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      uint64_t v23 = [*(id *)(*(void *)&buf[8] + 40) count];
      *(_DWORD *)v60 = 134217984;
      uint64_t v61 = v23;
      _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MessageListViewControllerAddedItemsBatch", "itemIDsCount=%ld enableTelemetry=YES ", v60, 0xCu);
    }

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke;
    v44[3] = &unk_1E6D12020;
    v44[4] = self;
    __int16 v49 = v58;
    id v45 = v14;
    v50 = v56;
    __int16 v51 = v54;
    uint64_t v52 = buf;
    id v46 = v12;
    BOOL v53 = v30;
    id v24 = v13;
    id v25 = v13;
    id v26 = v12;
    id v27 = v24;
    id v47 = v24;
    id v48 = v15;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_137;
    v38[3] = &unk_1E6D12048;
    BOOL v43 = v30;
    v38[4] = self;
    uint64_t v41 = buf;
    id v28 = v27;
    id v12 = v26;
    id v13 = v25;
    id v39 = v28;
    id v40 = v45;
    uint64_t v42 = v54;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2_138;
    v31[3] = &unk_1E6D12070;
    id v32 = v48;
    __int16 v33 = self;
    int v34 = buf;
    __int16 v35 = v58;
    uint64_t v36 = v56;
    os_signpost_id_t v37 = v20;
    [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:1 cleanSnapshot:0 prepare:v44 update:v38 completion:v31];

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(v56, 8);
    _Block_object_dispose(v58, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v17 = [(MessageListSectionDataSource *)self log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_msgSend(v15, "ef_publicDescription");
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v63 = (uint64_t (*)(uint64_t, uint64_t))v12;
      LOWORD(v64) = 1024;
      *(_DWORD *)((char *)&v64 + 2) = v30;
      HIWORD(v64) = 2114;
      id v65 = v13;
      __int16 v66 = 2114;
      id v67 = v14;
      _os_log_impl(&dword_1DDCDB000, v17, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore added item ids: %{public}@, before: %{BOOL}d, existingItemID: %{public}@, threadItemID: %{public}@", buf, 0x3Au);
    }
  }
}

- (OS_os_log)signpostLog
{
  return self->_signpostLog;
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 cleanSnapshot:(BOOL)a4 prepare:(id)a5 update:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  os_unfair_lock_lock(&self->_nextUpdateNeedsCleanSnapshotLock);
  if ([(MessageListSectionDataSource *)self nextUpdateNeedsCleanSnapshot])
  {
    [(MessageListSectionDataSource *)self setNextUpdateNeedsCleanSnapshot:0];
    BOOL v9 = 1;
  }
  os_unfair_lock_unlock(&self->_nextUpdateNeedsCleanSnapshotLock);
  id v15 = [(MessageListSectionDataSource *)self provider];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke;
  v17[3] = &unk_1E6D12138;
  v17[4] = self;
  id v18 = v13;
  id v16 = v13;
  [v15 messageListSectionDataSource:self performUpdateAnimated:v10 cleanSnapshot:v9 prepare:v12 update:v17 completion:v14];
}

- (BOOL)nextUpdateNeedsCleanSnapshot
{
  return self->_nextUpdateNeedsCleanSnapshot;
}

+ (BOOL)isValidChange:(id)a3
{
  return [a3 hasChanges];
}

+ (id)publicDescriptionForChange:(id)a3
{
  return (id)objc_msgSend(a3, "ef_publicDescription");
}

- (void)setProvider:(id)a3
{
}

void __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 134218240;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "%p: Finish initial load for collection: %p", (uint8_t *)&v8, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) initialLoadCompletedPromise];
  [v5 finishWithResult:MEMORY[0x1E4F1CC38]];

  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 messageListSectionDataSource:*(void *)(a1 + 32) collectionFinishedSearching:*(void *)(a1 + 40) remote:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 messageListSectionDataSourceDidFinishInitialLoad:*(void *)(a1 + 32)];
  }
  unint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"kMessageListItemsFinishedLoad" object:*(void *)(a1 + 40)];
}

- (EFPromise)initialLoadCompletedPromise
{
  return self->_initialLoadCompletedPromise;
}

- (MessageListSectionDataSource)initWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = [v4 section];
  unint64_t v7 = [v4 collectionView];
  int v8 = [v4 messageList];
  uint64_t v9 = [v4 initialLoadCompletedPromise];
  __int16 v10 = [v4 layoutValuesHelper];
  uint64_t v11 = [v4 state];
  uint64_t v12 = -[MessageListSectionDataSource initWithIdentifier:section:collectionView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:headerType:](self, "initWithIdentifier:section:collectionView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:headerType:", v5, v6, v7, v8, v9, v10, v11, [v4 headerType]);

  if (v12)
  {
    id v13 = [v4 delegate];
    objc_storeWeak((id *)&v12->_delegate, v13);

    id v14 = [v4 selectionModelProvider];
    objc_storeWeak((id *)&v12->_selectionModelProvider, v14);

    uint64_t v15 = [v4 contactStore];
    contactStore = v12->_contactStore;
    v12->_contactStore = (EMCachingContactStore *)v15;

    uint64_t v17 = [v4 brandIndicatorProvider];
    brandIndicatorProvider = v12->_brandIndicatorProvider;
    v12->_brandIndicatorProvider = (MUIBrandIndicatorProvider *)v17;
  }
  return v12;
}

- (MessageListSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9 headerType:(unint64_t)a10
{
  id v17 = a3;
  id v54 = a4;
  id v18 = a5;
  id v19 = a6;
  id v53 = a7;
  id v55 = a8;
  id v52 = a9;
  v62.receiver = self;
  v62.super_class = (Class)MessageListSectionDataSource;
  os_signpost_id_t v20 = [(MessageListSectionDataSource *)&v62 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_objectID, a3);
    objc_storeStrong((id *)&v21->_section, a4);
    objc_storeWeak((id *)&v21->_collectionView, v18);
    objc_storeStrong((id *)&v21->_messageList, a6);
    objc_storeStrong((id *)&v21->_initialLoadCompletedPromise, a7);
    objc_storeStrong((id *)&v21->_layoutValuesHelper, a8);
    objc_storeStrong((id *)&v21->_state, a9);
    v21->_headerType = a10;
    id v22 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v24 = [v22 initWithObject:v23];
    failedItemIDs = v21->_failedItemIDs;
    v21->_failedItemIDs = (EFLocked *)v24;

    id v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    timedOutItemIDs = v21->_timedOutItemIDs;
    v21->_timedOutItemIDs = v26;

    *(void *)&v21->_timedOutItemIDsLock._os_unfair_lock_opaque = 0;
    v21->_isRefreshingLock._os_unfair_lock_opaque = 0;
    id v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    id v29 = objc_claimAutoreleasedReturnValue();
    os_log_t v30 = os_log_create("com.apple.email", (const char *)[v29 UTF8String]);
    log = v21->_log;
    v21->_log = (OS_os_log *)v30;

    id v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    os_log_t v34 = os_log_create("com.apple.email.signposts", (const char *)[v33 UTF8String]);
    signpostLog = v21->_signpostLog;
    v21->_signpostLog = (OS_os_log *)v34;

    id v36 = v17;
    os_signpost_id_t v37 = [[MessageListCollectionHelper alloc] initWithLog:v21->_log updateQueueName:@"remove.me" sectionObjectID:v17];
    collectionHelper = v21->_collectionHelper;
    v21->_collectionHelper = v37;

    if ([v19 isThreaded])
    {
      id v39 = [[MessageListThreadHelper alloc] initWithDelegate:v21];
      threadHelper = v21->_threadHelper;
      v21->_threadHelper = v39;
    }
    uint64_t v41 = objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice", v19);
    int v42 = [v41 isInternal];

    if (v42)
    {
      v21->_shouldAlertOnBlankCell = [MEMORY[0x1E4F602E0] preferenceEnabled:24];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v21);
      BOOL v43 = (void *)MEMORY[0x1E4F602E0];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __150__MessageListSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke;
      v59[3] = &unk_1E6D11E40;
      objc_copyWeak(&v60, &location);
      uint64_t v44 = [v43 observeChangesForPreference:24 usingBlock:v59];
      shouldAlertOnBlankCellToken = v21->_shouldAlertOnBlankCellToken;
      v21->_shouldAlertOnBlankCellToken = (EFCancelable *)v44;

      objc_destroyWeak(&v60);
      objc_destroyWeak(&location);
    }
    id v46 = [(MessageListSectionDataSource *)v21 headerRegistration];
    if (v46 || !EMBlackPearlIsFeatureEnabled())
    {

      goto LABEL_11;
    }
    if (a10 == 3)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v21);
      id v47 = (void *)MEMORY[0x1E4FB15F8];
      uint64_t v48 = objc_opt_class();
      uint64_t v49 = *MEMORY[0x1E4FB2770];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __150__MessageListSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke_2;
      void v56[3] = &unk_1E6D11DA8;
      objc_copyWeak(&v58, &location);
      id v57 = v55;
      v50 = [v47 registrationWithSupplementaryClass:v48 elementKind:v49 configurationHandler:v56];
      [(MessageListSectionDataSource *)v21 setHeaderRegistration:v50];

      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);
LABEL_11:
      id v17 = v36;
    }
  }

  return v21;
}

- (UICollectionViewSupplementaryRegistration)headerRegistration
{
  return self->_headerRegistration;
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke;
  v9[3] = &unk_1E6D11A50;
  void v9[4] = self;
  id v10 = v4;
  id v5 = v9;
  uint64_t v6 = (void *)MEMORY[0x1E4F60F28];
  id v7 = v4;
  int v8 = [v6 mainThreadScheduler];
  [v8 performBlock:v5];
}

void __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) messageList];
  uint64_t v3 = *(void **)(a1 + 40);

  id v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    int v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_108;
    v9[3] = &unk_1E6D11A50;
    void v9[4] = v4;
    id v10 = v8;
    [v4 _recoverFailedItemIDsIfNeededForCollection:v10 completion:v9];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      *(_DWORD *)buf = 134218242;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore did finish initial load", buf, 0x16u);
    }
  }
}

- (void)_recoverFailedItemIDsIfNeededForCollection:(id)a3 excluding:(id)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v28 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke;
  aBlock[3] = &unk_1E6D11BF8;
  id v26 = v8;
  id v45 = v26;
  id v27 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__0;
  int v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  uint64_t v9 = [(MessageListSectionDataSource *)self failedItemIDs];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_2;
  v37[3] = &unk_1E6D12160;
  v37[4] = &v38;
  [v9 performWhileLocked:v37];

  if (![(id)v39[5] count]
    || ([(MessageListSectionDataSource *)self messageList],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        BOOL v11 = v10 == v29,
        v10,
        v11))
  {
    uint64_t v12 = [(MessageListSectionDataSource *)self messageList];
    id v14 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = (id)v39[5];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (([v12 containsItemID:v19] & 1) == 0)
          {
            os_signpost_id_t v20 = [(MessageListSectionDataSource *)self log];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v48 = self;
              __int16 v49 = 2114;
              uint64_t v50 = (uint64_t)v19;
              _os_log_impl(&dword_1DDCDB000, v20, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ is not part of collection - do not attempt recovery", buf, 0x16u);
            }

            [v14 addObject:v19];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v16);
    }

    objc_msgSend((id)v39[5], "ef_removeObjectsInArray:", v14);
    if ([(id)v39[5] count])
    {
      if ([v28 count])
      {
        uint64_t v21 = [(id)v39[5] count];
        objc_msgSend((id)v39[5], "ef_removeObjectsInArray:", v28);
        if ([(id)v39[5] count] != v21)
        {
          id v22 = [(MessageListSectionDataSource *)self log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [(id)v39[5] count];
            *(_DWORD *)buf = 134218240;
            uint64_t v48 = self;
            __int16 v49 = 2048;
            uint64_t v50 = v21 - v23;
            _os_log_impl(&dword_1DDCDB000, v22, OS_LOG_TYPE_DEFAULT, "%p: Skipping reloading of %ld failedItemIDs", buf, 0x16u);
          }
        }
      }
      if ([(id)v39[5] count])
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_152;
        v30[3] = &unk_1E6D12188;
        v30[4] = self;
        id v32 = &v38;
        int v31 = v27;
        [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:0 cleanSnapshot:0 prepare:0 update:v30 completion:0];

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v24 = [(MessageListSectionDataSource *)self log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = objc_msgSend(v29, "ef_publicDescription");
        *(_DWORD *)buf = 134218242;
        uint64_t v48 = self;
        __int16 v49 = 2114;
        uint64_t v50 = (uint64_t)v25;
        _os_log_impl(&dword_1DDCDB000, v24, OS_LOG_TYPE_DEFAULT, "%p: Skip recovery of collection:%{public}@, no failed item ids", buf, 0x16u);
      }
    }
    v27[2]();
    goto LABEL_28;
  }
  uint64_t v12 = [(MessageListSectionDataSource *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = objc_msgSend(v29, "ef_publicDescription");
    *(_DWORD *)buf = 134218242;
    uint64_t v48 = self;
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v13;
    _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "%p: Skip recovery, collection stale:%@", buf, 0x16u);
  }
LABEL_29:

  _Block_object_dispose(&v38, 8);
}

uint64_t __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (EFLocked)failedItemIDs
{
  return self->_failedItemIDs;
}

- (void)_recoverFailedItemIDsIfNeededForCollection:(id)a3 completion:(id)a4
{
}

+ (BOOL)isAdditionChange:(id)a3
{
  return [a3 isAddition];
}

void __150__MessageListSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[23] = a3;
  }
}

void __150__MessageListSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained section];
    uint64_t v6 = MUITitleFromSection(v5);
    [v7 setTitle:v6];

    [v7 setLayoutValuesHelper:*(void *)(a1 + 32)];
  }
}

- (void)dealloc
{
  uint64_t v3 = [(MessageListSectionDataSource *)self shouldAlertOnBlankCellToken];
  [v3 cancel];

  [(MessageListSectionDataSource *)self setShouldAlertOnBlankCellToken:0];
  id v4 = [(MessageListSectionDataSource *)self numberOfPreviewLinesToken];
  [v4 cancel];

  [(MessageListSectionDataSource *)self setNumberOfPreviewLinesToken:0];
  v5.receiver = self;
  v5.super_class = (Class)MessageListSectionDataSource;
  [(MessageListSectionDataSource *)&v5 dealloc];
}

- (void)replaceMessageList:(id)a3 initialLoadCompletedPromise:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageListSectionDataSource *)self messageList];
  uint64_t v9 = [(MessageListSectionDataSource *)self log];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 == v6)
  {
    if (v10)
    {
      int v14 = 134217984;
      id v15 = self;
      _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "%p: Message list is the same - no need to replace", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      int v14 = 134218498;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "%p: replace message list: %{public}@, old: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    if (v8) {
      [v8 stopObserving:self];
    }
    BOOL v11 = [(MessageListSectionDataSource *)self failedItemIDs];
    [v11 performWhileLocked:&__block_literal_global_7];

    os_unfair_lock_lock(&self->_timedOutItemIDsLock);
    uint64_t v12 = [(MessageListSectionDataSource *)self timedOutItemIDs];
    [v12 removeAllObjects];

    [(MessageListSectionDataSource *)self setHasReloadedForTimeOut:0];
    os_unfair_lock_unlock(&self->_timedOutItemIDsLock);
    [(MessageListSectionDataSource *)self setMessageList:v6];
    if ([v6 isThreaded])
    {
      __int16 v13 = [[MessageListThreadHelper alloc] initWithDelegate:self];
      [(MessageListSectionDataSource *)self setThreadHelper:v13];
    }
    else
    {
      [(MessageListSectionDataSource *)self setThreadHelper:0];
    }
    [(MessageListSectionDataSource *)self setInitialLoadCompletedPromise:v7];
  }
}

uint64_t __79__MessageListSectionDataSource_replaceMessageList_initialLoadCompletedPromise___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)refresh
{
  p_isRefreshingLock = &self->_isRefreshingLock;
  os_unfair_lock_lock(&self->_isRefreshingLock);
  if (![(MessageListSectionDataSource *)self isRefreshing])
  {
    [(MessageListSectionDataSource *)self setIsRefreshing:1];
    id v4 = [(MessageListSectionDataSource *)self messageList];
    [v4 refresh];
  }
  os_unfair_lock_unlock(p_isRefreshingLock);
}

- (void)stopObserving
{
  id v3 = [(MessageListSectionDataSource *)self messageList];
  [v3 stopObserving:self];
}

- (void)reconfigureItemsAtIndexPaths:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MessageListSectionDataSource *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int16 v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Reconfigure items at index paths: %{public}@", buf, 0x16u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__MessageListSectionDataSource_reconfigureItemsAtIndexPaths___block_invoke;
  v10[3] = &unk_1E6D11A50;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  id v7 = (void *)MEMORY[0x1E4F60F28];
  id v8 = v4;
  uint64_t v9 = [v7 mainThreadScheduler];
  [v9 performBlock:v6];
}

void __61__MessageListSectionDataSource_reconfigureItemsAtIndexPaths___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) collectionView];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = objc_msgSend(v2, "mui_indexPathsForPreparedItems");
  id v39 = [v3 setWithArray:v4];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v61 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v42;
    *(void *)&long long v6 = 134218242;
    long long v33 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v11 = objc_msgSend(v2, "cellForItemAtIndexPath:", v10, v33);
        if (v11 || ![v39 containsObject:v10])
        {
          [v11 frame];
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          [v2 bounds];
          v64.origin.x = v23;
          v64.origin.y = v24;
          v64.size.width = v25;
          v64.size.height = v26;
          v63.origin.x = v16;
          v63.origin.y = v18;
          v63.size.width = v20;
          v63.size.height = v22;
          if (CGRectIntersectsRect(v63, v64))
          {
            if ([v11 isHidden] & 1) != 0 || (objc_msgSend(v11, "isHiddenOrHasHiddenAncestor")) {
              goto LABEL_29;
            }
            [v11 alpha];
            if (v27 < 0.0) {
              double v27 = -v27;
            }
            if (v27 < 2.22044605e-16)
            {
LABEL_29:
              if ([v11 conformsToProtocol:&unk_1F3A0D128])
              {
                id v28 = [v11 messageListItem];
              }
              else
              {
                id v28 = 0;
              }
              id v29 = [*(id *)(a1 + 32) log];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
              {
                uint64_t v38 = *(void *)(a1 + 32);
                uint64_t v37 = [v10 section];
                uint64_t v36 = [v10 item];
                int v31 = [v11 _layoutAttributes];
                int v35 = [v11 isHidden];
                int v34 = [v11 isHiddenOrHasHiddenAncestor];
                [v11 alpha];
                *(_DWORD *)buf = 134219778;
                uint64_t v46 = v38;
                __int16 v47 = 2048;
                uint64_t v48 = v37;
                __int16 v49 = 2048;
                uint64_t v50 = v36;
                __int16 v51 = 1024;
                BOOL v52 = v28 != 0;
                __int16 v53 = 2114;
                id v54 = v31;
                __int16 v55 = 1024;
                int v56 = v35;
                __int16 v57 = 1024;
                int v58 = v34;
                __int16 v59 = 2048;
                uint64_t v60 = v32;
                _os_log_fault_impl(&dword_1DDCDB000, v29, OS_LOG_TYPE_FAULT, "%p: Cell is unexpectedly hidden:\n\tindexPath: (%ld, %ld)\n\thasItem: %{BOOL}d\n\tlayoutAttributes: %{public}@\n\tisHidden: %{BOOL}d\n\tisHiddenOrHasHiddenAncestor: %{BOOL}d\n\talpha: %f", buf, 0x46u);
              }
            }
          }
          os_log_t v30 = *(void **)(a1 + 32);
          uint64_t v12 = [v30 provider];
          __int16 v14 = [v12 messageListSectionDataSource:*(void *)(a1 + 32) itemIdentifierForIndexPath:v10];
          [v30 _configureCell:v11 atIndexPath:v10 itemID:v14];
        }
        else
        {
          uint64_t v12 = [*(id *)(a1 + 32) log];
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          uint64_t v13 = *(void *)(a1 + 32);
          __int16 v14 = objc_msgSend(v10, "ef_publicDescription");
          *(_DWORD *)buf = v33;
          uint64_t v46 = v13;
          __int16 v47 = 2114;
          uint64_t v48 = (uint64_t)v14;
          _os_log_error_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_ERROR, "%p: Unable to reconfigure cell at %{public}@ - cell is nil", buf, 0x16u);
        }

LABEL_24:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v61 count:16];
    }
    while (v7);
  }
}

- (void)deleteItemsWithIDs:(id)a3 animated:(BOOL)a4 useImmediateCompletion:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(MessageListSectionDataSource *)self messageList];
  [(MessageListSectionDataSource *)self _deleteItemsWithIDs:v11 fromCollection:v12 animated:v7 useImmediateCompletion:v6 completionHandler:v10];
}

- (id)relatedItemIDsForSelectedItemID:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [(MessageListSectionDataSource *)self itemHelper];
  id v10 = [v9 itemIDBeforeItemID:v6 snapshot:v7];
  objc_msgSend(v8, "ef_addOptionalObject:", v10);

  id v11 = [v9 itemIDAfterItemID:v6 snapshot:v7];
  objc_msgSend(v8, "ef_addOptionalObject:", v11);

  id v12 = [(MessageListSectionDataSource *)self messageList];
  uint64_t v13 = [(MessageListSectionDataSource *)self threadHelper];
  if (v13)
  {
    __int16 v14 = [v12 expandedThreadItemIDs];
    int v15 = [v14 containsObject:v6];

    if (v15)
    {
      CGFloat v16 = [v13 itemIDsInExpandedThread:v6 snapshot:v7];
      double v17 = [v16 lastObject];
      if (v17)
      {
        [v8 addObject:v17];
        CGFloat v18 = [v13 itemIDAfterItemID:v17 snapshot:v7];
        objc_msgSend(v8, "ef_addOptionalObject:", v18);
      }
    }
    else
    {
      if (![v12 anyExpandedThreadContainsItemID:v6]) {
        goto LABEL_10;
      }
      CGFloat v16 = [v13 threadItemIDForItemInExpandedThread:v6 snapshot:v7];
      if (!v16) {
        goto LABEL_9;
      }
      [v8 addObject:v16];
      double v17 = [v13 itemIDBeforeItemID:v16 snapshot:v7];
      objc_msgSend(v8, "ef_addOptionalObject:", v17);
    }

LABEL_9:
  }
LABEL_10:
  [v8 addObject:v6];

  return v8;
}

- (void)applyFilterPredicate:(id)a3 userFiltered:(BOOL)a4 ignoreMessagesPredicate:(id)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  id v8 = a5;
  uint64_t v9 = [(MessageListSectionDataSource *)self messageList];
  id v10 = [v9 unfilteredMessageList];
  id v11 = v10;
  if (v16)
  {
    uint64_t v12 = [v10 filteredMessageListWithPredicate:v16 ignoredMessagesPredicate:v8 userFiltered:v6];

    id v11 = (void *)v12;
  }

  uint64_t v13 = [(MessageListSectionDataSource *)self messageList];

  if (v11 != v13)
  {
    __int16 v14 = [(MessageListSectionDataSource *)self delegate];
    int v15 = [v14 initialLoadCompletedPromiseForMessageListSectionDataSource:self];

    [(MessageListSectionDataSource *)self replaceMessageList:v11 initialLoadCompletedPromise:v15];
    [(MessageListSectionDataSource *)self beginObservingAnimated:1 nextUpdateNeedsCleanSnapshot:1];
  }
}

- (void)didScheduleReadInteractionForItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListSectionDataSource *)self collectionHelper];
  [v5 didScheduleReadInteractionForItemID:v4];
}

- (id)threadItemIDForItemInExpandedThread:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListSectionDataSource *)self threadHelper];
  BOOL v6 = [(MessageListSectionDataSource *)self provider];
  id v7 = [v6 snapshotForMessageListSectionDataSource:self];
  id v8 = [v5 threadItemIDForItemInExpandedThread:v4 snapshot:v7];

  return v8;
}

- (id)itemIDsInExpandedThread:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListSectionDataSource *)self threadHelper];
  BOOL v6 = [(MessageListSectionDataSource *)self provider];
  id v7 = [v6 snapshotForMessageListSectionDataSource:self];
  id v8 = [v5 itemIDsInExpandedThread:v4 snapshot:v7];

  return v8;
}

- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [(MessageListSectionDataSource *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageListSectionDataSource configuredCollectionViewCellForCollectionView:indexPath:itemID:cellIdentifier:]", "MessageListSectionDataSource.m", 320, "0");
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(MessageListSectionDataSource *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageListSectionDataSource _configureCell:atIndexPath:itemID:]", "MessageListSectionDataSource.m", 324, "0");
}

- (id)messageListItemForItemID:(id)a3 indexPath:(id)a4 receiver:(id)a5 completion:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MessageListSectionDataSource *)self signpostLog];
  spid = (char *)os_signpost_id_generate(v14);

  int v15 = [(MessageListSectionDataSource *)self signpostLog];
  id v16 = v15;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    double v17 = objc_msgSend(v11, "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    __int16 v65 = 2114;
    __int16 v66 = v17;
    _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "MessageListViewControllerItemFetch", "itemID=%{public}@, indexPath=%{public}@", buf, 0x16u);
  }
  id val = [(MessageListSectionDataSource *)self messageList];
  CGFloat v18 = [val messageListItemForItemID:v10];
  [v12 setItemID:v10];
  [v12 setMessageListItemFuture:v18];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  double v19 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke;
  v57[3] = &unk_1E6D11E68;
  objc_copyWeak(&v61, (id *)buf);
  objc_copyWeak(v62, &location);
  id v20 = v10;
  id v58 = v20;
  id v21 = v11;
  id v59 = v21;
  v62[1] = spid;
  id v22 = v13;
  id v60 = v22;
  CGFloat v23 = [v19 afterDelay:v57 performBlock:2.0];
  [v12 setMessageListItemFetchTimeoutCancelable:v23];

  CGFloat v24 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_76;
  v49[3] = &unk_1E6D11E90;
  id v25 = v12;
  id v50 = v25;
  id v26 = v18;
  id v51 = v26;
  BOOL v52 = self;
  int v56 = spid;
  id v27 = v20;
  id v53 = v27;
  id v28 = v21;
  id v54 = v28;
  id v29 = v22;
  id v55 = v29;
  [v26 onScheduler:v24 addSuccessBlock:v49];

  os_log_t v30 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_78;
  v41[3] = &unk_1E6D11EB8;
  objc_copyWeak(&v47, (id *)buf);
  objc_copyWeak(v48, &location);
  id v31 = v27;
  id v42 = v31;
  id v32 = v28;
  id v43 = v32;
  id v33 = v25;
  id v44 = v33;
  v48[1] = spid;
  id v34 = v26;
  id v45 = v34;
  id v35 = v29;
  id v46 = v35;
  [v34 onScheduler:v30 addFailureBlock:v41];

  uint64_t v36 = v46;
  id v37 = v34;

  objc_destroyWeak(v48);
  objc_destroyWeak(&v47);

  objc_destroyWeak(v62);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v37;
}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 64));
    if (v3)
    {
      if (EFContentProtectionGetObservedState())
      {
        id v4 = [(os_unfair_lock_s *)WeakRetained log];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          BOOL v6 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
          id v7 = EFContentProtectionStateDescription();
          int v18 = 138543874;
          uint64_t v19 = v5;
          __int16 v20 = 2114;
          id v21 = v6;
          __int16 v22 = 2114;
          v23[0] = v7;
          _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "Skip timeout for item (id=%{public}@) at indexPath=%{public}@ - device is not unlocked (%{public}@)", (uint8_t *)&v18, 0x20u);
        }
      }
      else
      {
        id v8 = [(os_unfair_lock_s *)WeakRetained messageList];

        if (v3 == v8)
        {
          id v11 = [(os_unfair_lock_s *)WeakRetained signpostLog];
          id v12 = v11;
          os_signpost_id_t v13 = *(void *)(a1 + 72);
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
          {
            uint64_t v14 = *(void *)(a1 + 32);
            int v15 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            int v18 = 138544130;
            uint64_t v19 = v14;
            __int16 v20 = 2114;
            id v21 = v15;
            __int16 v22 = 1026;
            LODWORD(v23[0]) = 1;
            WORD2(v23[0]) = 1026;
            *(_DWORD *)((char *)v23 + 6) = 0;
            _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "MessageListViewControllerItemFetch", "itemID=%{public}@, indexPath=%{public}@, TimedOut=%{public,signpost.telemetry:number1}u Error=%{public,signpost.telemetry:number2}u enableTelemetry=YES ", (uint8_t *)&v18, 0x22u);
          }
          id v16 = [(os_unfair_lock_s *)WeakRetained log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_cold_1((uint64_t)WeakRetained, a1, v16);
          }

          id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemTimeoutError");
          -[MessageListSectionDataSource _recordTailspinForBlankCellWithError:](WeakRetained, v4);
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          os_unfair_lock_lock(WeakRetained + 2);
          double v17 = [(os_unfair_lock_s *)WeakRetained timedOutItemIDs];
          [v17 addObject:*(void *)(a1 + 32)];

          os_unfair_lock_unlock(WeakRetained + 2);
          [(os_unfair_lock_s *)WeakRetained _maybeReloadForTimedOutItemIDs];
          if (HIBYTE(WeakRetained[5]._os_unfair_lock_opaque)) {
            -[MessageListSectionDataSource _showBlankCellAlertWithItemID:indexPath:reason:](WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), @"Message list item fetch timeout.");
          }
        }
        else
        {
          id v4 = [(os_unfair_lock_s *)WeakRetained log];
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v9 = *(void *)(a1 + 32);
            id v10 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            int v18 = 138543618;
            uint64_t v19 = v9;
            __int16 v20 = 2114;
            id v21 = v10;
            _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "Stale message list item (%{public}@) - skip timeout for message at index path: %{public}@", (uint8_t *)&v18, 0x16u);
          }
        }
      }
    }
  }
}

- (void)_recordTailspinForBlankCellWithError:(void *)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 state];
    if ([v4 didRecordTailspin])
    {
      uint64_t v5 = [a1 log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v10 = a1;
        _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Tailspin has already been generated in this session", buf, 0xCu);
      }
    }
    else
    {
      [v4 setDidRecordTailspin:1];
      BOOL v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Blank Cell - Error %ld", objc_msgSend(v3, "code"));
      id v7 = objc_msgSend(v3, "ef_underlyingError");

      if (v7)
      {
        id v8 = objc_msgSend(v3, "ef_underlyingError");
        objc_msgSend(v6, "appendFormat:", @" (%ld)", objc_msgSend(v8, "code"));
      }
      EFSaveTailspin();
    }
  }
}

- (void)_showBlankCellAlertWithItemID:(void *)a3 indexPath:(void *)a4 reason:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [a1 state];
    if ([v10 didAlertOnBlankCell])
    {
      uint64_t v11 = [a1 log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218498;
        os_signpost_id_t v13 = a1;
        __int16 v14 = 2114;
        id v15 = v7;
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_DEFAULT, "%p: Blank cell alert controller was already visible. Don't show for itemID: %{public}@, indexPath: %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }
    else
    {
      [v10 setDidAlertOnBlankCell:1];
      uint64_t v11 = [a1 delegate];
      [v11 showBlankCellAlertForMessageListSectionDataSource:a1 itemID:v7 indexPath:v8 reason:v9];
    }
  }
}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) messageListItemFuture];
  uint64_t v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    id v9 = [*(id *)(a1 + 32) messageListItemFetchTimeoutCancelable];
    [v9 cancel];

    [*(id *)(a1 + 32) setMessageListItemFetchTimeoutCancelable:0];
    id v10 = [*(id *)(a1 + 48) signpostLog];
    uint64_t v11 = v10;
    os_signpost_id_t v12 = *(void *)(a1 + 80);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      __int16 v14 = objc_msgSend(*(id *)(a1 + 64), "ef_publicDescription");
      int v15 = 138544130;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      __int16 v19 = 1026;
      int v20 = 0;
      __int16 v21 = 1026;
      int v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "MessageListViewControllerItemFetch", "itemID=%{public}@, indexPath=%{public}@, TimedOut=%{public,signpost.telemetry:number1}u Error=%{public,signpost.telemetry:number2}u enableTelemetry=YES ", (uint8_t *)&v15, 0x22u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    BOOL v6 = [*(id *)(a1 + 48) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      id v8 = objc_msgSend(*(id *)(a1 + 64), "ef_publicDescription");
      int v15 = 138543618;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEFAULT, "Skip updating cell for message with itemID=%{public}@ at indexPath=%{public}@ - cell has already been configured", (uint8_t *)&v15, 0x16u);
    }
  }
}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 80));
    if (v5)
    {
      id v6 = [WeakRetained messageList];

      if (v5 == v6)
      {
        uint64_t v11 = [*(id *)(a1 + 48) messageListItemFetchTimeoutCancelable];
        [v11 cancel];

        if ((objc_msgSend(v3, "ef_isCancelledError") & 1) == 0 && (objc_msgSend(v3, "em_isItemNotFoundError") & 1) == 0)
        {
          os_signpost_id_t v12 = [WeakRetained signpostLog];
          uint64_t v13 = v12;
          os_signpost_id_t v14 = *(void *)(a1 + 88);
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
          {
            int v15 = *(unsigned char **)(a1 + 32);
            uint64_t v16 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138413058;
            uint64_t v38 = v15;
            __int16 v39 = 2112;
            uint64_t v40 = v16;
            __int16 v41 = 1026;
            *(_DWORD *)id v42 = 0;
            *(_WORD *)&v42[4] = 2050;
            *(void *)&v42[6] = [v3 code];
            _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "MessageListViewControllerItemFetch", "itemID=%@, indexPath=%@, TimedOut=%{public,signpost.telemetry:number1}u Error=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x26u);
          }

          __int16 v17 = [WeakRetained log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = *(void *)(a1 + 32);
            id v32 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            id v33 = objc_msgSend(v3, "ef_publicDescription");
            *(_DWORD *)buf = 134218754;
            uint64_t v38 = WeakRetained;
            __int16 v39 = 2114;
            uint64_t v40 = v31;
            __int16 v41 = 2114;
            *(void *)id v42 = v32;
            *(_WORD *)&v42[8] = 2114;
            *(void *)&v42[10] = v33;
            _os_log_error_impl(&dword_1DDCDB000, v17, OS_LOG_TYPE_ERROR, "%p: [Blank cell] Message list item fetch failed (id:%{public}@, indexPath:%{public}@) with error: %{public}@", buf, 0x2Au);
          }
          -[MessageListSectionDataSource _recordTailspinForBlankCellWithError:](WeakRetained, v3);
          uint64_t v18 = [WeakRetained failedItemIDs];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_79;
          v34[3] = &unk_1E6D117B0;
          id v35 = *(id *)(a1 + 32);
          [v18 performWhileLocked:v34];

          if (WeakRetained[23])
          {
            __int16 v19 = *(void **)(a1 + 32);
            int v20 = *(void **)(a1 + 40);
            __int16 v21 = NSString;
            int v22 = objc_msgSend(v3, "ef_publicDescription");
            uint64_t v23 = [v21 stringWithFormat:@"Message list item fetch failed with error: %@.", v22];
            -[MessageListSectionDataSource _showBlankCellAlertWithItemID:indexPath:reason:](WeakRetained, v19, v20, v23);
          }
        }
        CGFloat v24 = [*(id *)(a1 + 48) messageListItemFuture];
        id v25 = *(void **)(a1 + 56);

        if (v24 == v25) {
          [*(id *)(a1 + 48) setMessageListItemFuture:0];
        }
        if (objc_msgSend(v3, "em_isItemNotFoundError"))
        {
          id v26 = [WeakRetained log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *(void *)(a1 + 32);
            id v28 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            *(_DWORD *)buf = 134218498;
            uint64_t v38 = WeakRetained;
            __int16 v39 = 2114;
            uint64_t v40 = v27;
            __int16 v41 = 2114;
            *(void *)id v42 = v28;
            _os_log_impl(&dword_1DDCDB000, v26, OS_LOG_TYPE_DEFAULT, "%p: Deleting itemID:%{public}@ at indexPath:%{public}@ from the data source because we could not find the item", buf, 0x20u);
          }
          if (*(void *)(a1 + 32))
          {
            uint64_t v36 = *(void *)(a1 + 32);
            id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
            os_log_t v30 = [WeakRetained messageList];
            [WeakRetained _deleteItemsWithIDs:v29 fromCollection:v30 animated:1 useImmediateCompletion:0 completionHandler:0];
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        uint64_t v7 = [WeakRetained log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = *(unsigned char **)(a1 + 32);
          uint64_t v9 = *(void *)(a1 + 40);
          id v10 = objc_msgSend(v3, "ef_publicDescription");
          *(_DWORD *)buf = 138543874;
          uint64_t v38 = v8;
          __int16 v39 = 2114;
          uint64_t v40 = v9;
          __int16 v41 = 2114;
          *(void *)id v42 = v10;
          _os_log_impl(&dword_1DDCDB000, v7, OS_LOG_TYPE_DEFAULT, "Stale message list item (%{public}@) - skip message list item at index path: %{public}@, failure: %{public}@", buf, 0x20u);
        }
      }
    }
  }
}

uint64_t __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_79(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (int64_t)numberOfPreviewLines
{
  if (!self->_numberOfPreviewLinesToken)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    self->_numberOfPreviewLines = objc_msgSend(MEMORY[0x1E4F1CB18], "em_linesOfPreview");
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v4 = *MEMORY[0x1E4F60130];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__MessageListSectionDataSource_numberOfPreviewLines__block_invoke;
    v8[3] = &unk_1E6D11EE0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v4, 1, 1, v8);
    id v5 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
    numberOfPreviewLinesToken = self->_numberOfPreviewLinesToken;
    self->_numberOfPreviewLinesToken = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return self->_numberOfPreviewLines;
}

void __52__MessageListSectionDataSource_numberOfPreviewLines__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "setNumberOfPreviewLines:", objc_msgSend(v4, "integerValue"));
    }
  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_after_unreadItemIDs___block_invoke;
  v21[3] = &unk_1E6D11F08;
  v21[4] = self;
  id v22 = v12;
  id v23 = v14;
  id v24 = v13;
  id v25 = v11;
  int v15 = (void *)MEMORY[0x1E4F60F28];
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  id v19 = v11;
  int v20 = [v15 mainThreadScheduler];
  [v20 performBlock:v21];
}

uint64_t __95__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_after_unreadItemIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addedItemIDs:*(void *)(a1 + 40) before:0 existingItemID:*(void *)(a1 + 48) toThreadWithItemID:*(void *)(a1 + 56) inCollection:*(void *)(a1 + 64)];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke;
  v17[3] = &unk_1E6D11780;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v11 = v17;
  id v12 = (void *)MEMORY[0x1E4F60F28];
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = [v12 mainThreadScheduler];
  [v16 performBlock:v11];
}

void __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] messageList];
  id v3 = a1[5];

  id v4 = a1[4];
  if (v2 == v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_97;
    v14[3] = &unk_1E6D11F30;
    id v10 = a1[6];
    id v11 = a1[4];
    id v15 = v10;
    id v16 = v11;
    id v17 = a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_2;
    v12[3] = &unk_1E6D11A50;
    v12[4] = a1[4];
    id v13 = a1[6];
    [v4 _performDataSourceUpdateAnimated:1 cleanSnapshot:0 prepare:0 update:v14 completion:v12];

    id v5 = v15;
  }
  else
  {
    id v5 = [a1[4] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[4];
      uint64_t v7 = objc_msgSend(a1[5], "ef_publicDescription");
      id v8 = a1[6];
      id v9 = a1[7];
      *(_DWORD *)buf = 134218754;
      id v19 = v6;
      __int16 v20 = 2114;
      __int16 v21 = v7;
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v9;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore moved item ids: %{public}@, before: %{public}@", buf, 0x2Au);
    }
  }
}

id __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_msgSend(*(id *)(a1 + 40), "collectionHelper", (void)v17);
        v10 += [v14 moveItemID:v13 before:*(void *)(a1 + 48) snapshot:v5 section:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  id v15 = +[MessageListSectionDataSourceChange moved:v10];

  return v15;
}

void __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageListSectionDataSource:*(void *)(a1 + 32) handleRowSelectionAfterMovingMessagesWithItemIdentifiers:*(void *)(a1 + 40)];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke;
  v17[3] = &unk_1E6D11780;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  uint64_t v11 = v17;
  id v12 = (void *)MEMORY[0x1E4F60F28];
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = [v12 mainThreadScheduler];
  [v16 performBlock:v11];
}

void __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] messageList];
  id v3 = a1[5];

  id v4 = a1[4];
  if (v2 == v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_100;
    v14[3] = &unk_1E6D11F30;
    id v10 = a1[6];
    id v11 = a1[4];
    id v15 = v10;
    id v16 = v11;
    id v17 = a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_3;
    v12[3] = &unk_1E6D11A50;
    v12[4] = a1[4];
    id v13 = a1[6];
    [v4 _performDataSourceUpdateAnimated:1 cleanSnapshot:0 prepare:0 update:v14 completion:v12];

    id v5 = v15;
  }
  else
  {
    id v5 = [a1[4] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[4];
      id v7 = objc_msgSend(a1[5], "ef_publicDescription");
      id v8 = a1[6];
      id v9 = a1[7];
      *(_DWORD *)buf = 134218754;
      id v19 = v6;
      __int16 v20 = 2114;
      __int16 v21 = v7;
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v9;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore moved item ids: %{public}@, after: %{public}@", buf, 0x2Au);
    }
  }
}

id __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_100(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_2;
  v14[3] = &unk_1E6D11F58;
  id v8 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v9 = (void *)a1[6];
  id v18 = &v19;
  void v14[4] = v7;
  id v15 = v9;
  id v10 = v5;
  id v16 = v10;
  id v11 = v6;
  id v17 = v11;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v14];
  id v12 = +[MessageListSectionDataSourceChange moved:v20[3]];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v6 = [v3 collectionHelper];
  uint64_t v5 = [v6 moveItemID:v4 after:a1[5] snapshot:a1[6] section:a1[7]];

  *(void *)(*(void *)(a1[8] + 8) + 24) += v5;
}

void __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageListSectionDataSource:*(void *)(a1 + 32) handleRowSelectionAfterMovingMessagesWithItemIdentifiers:*(void *)(a1 + 40)];
}

- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__MessageListSectionDataSource_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke;
  v17[3] = &unk_1E6D11780;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v11 = v17;
  id v12 = (void *)MEMORY[0x1E4F60F28];
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = [v12 mainThreadScheduler];
  [v16 performBlock:v11];
}

void __82__MessageListSectionDataSource_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) messageList];
  id v3 = *(void **)(a1 + 40);

  id v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    id v10 = [v4 provider];
    uint64_t v5 = [v10 snapshotForMessageListSectionDataSource:*(void *)(a1 + 32)];

    id v11 = [*(id *)(a1 + 32) collectionHelper];
    uint64_t v7 = [v11 changeItemIDs:*(void *)(a1 + 48) snapshot:v5];

    id v12 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v34 = v13;
      __int16 v35 = 2048;
      uint64_t v36 = [v7 count];
      __int16 v37 = 2112;
      uint64_t v38 = v7;
      _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "%p: Reloading itemIDs(%ld): %@", buf, 0x20u);
    }

    id v14 = [*(id *)(a1 + 32) initialLoadCompletedPromise];
    id v15 = v14;
    if (v14)
    {
      id v16 = [v14 future];
      id v17 = [v16 resultIfAvailable];
      char v18 = [v17 BOOLValue];

      char v19 = v18 ^ 1;
    }
    else
    {
      char v19 = 0;
    }
    id v20 = [*(id *)(a1 + 32) selectionModelProvider];
    uint64_t v21 = [v20 selectionModelForMessageListSectionDataSource:*(void *)(a1 + 32)];

    if ([v21 isSelectAll] && (v19 & 1) == 0)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v22 = *(id *)(a1 + 56);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v29 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = (id)objc_msgSend(v21, "deselectItemWithItemID:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v24);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reloadItemsWithItemIDs:", v7, (void)v28);

    goto LABEL_20;
  }
  uint64_t v5 = [v4 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218754;
    uint64_t v34 = v6;
    __int16 v35 = 2114;
    uint64_t v36 = (uint64_t)v7;
    __int16 v37 = 2114;
    uint64_t v38 = v8;
    __int16 v39 = 2114;
    uint64_t v40 = v9;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore changed item ids: %{public}@, item ids with count changes: %{public}@", buf, 0x2Au);
LABEL_20:
  }
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke;
  v17[3] = &unk_1E6D11780;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v11 = v17;
  id v12 = (void *)MEMORY[0x1E4F60F28];
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = [v12 mainThreadScheduler];
  [v16 performBlock:v11];
}

void __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] messageList];
  id v3 = a1[5];

  if (v2 == v3)
  {
    int v9 = [a1[6] isEqual:a1[7]];
    id v10 = a1[4];
    if (v9)
    {
      id v11 = [a1[4] log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = a1[4];
        id v13 = a1[6];
        id v14 = a1[7];
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&unsigned char buf[24] = v14;
        _os_log_error_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_ERROR, "%p: Replaced existingItemID: %@ same as newItemID %@", buf, 0x20u);
      }

      memset(buf, 170, sizeof(buf));
      *(_DWORD *)&buf[32] = 0;
      *(void *)id v20 = 0xE00000001;
      int v21 = 1;
      pid_t v22 = getpid();
      size_t v18 = 648;
      if (!sysctl(v20, 4u, buf, &v18, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0)
      {
        __debugbreak();
        JUMPOUT(0x1DDD032ECLL);
      }
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_102;
      v15[3] = &unk_1E6D11F30;
      v15[4] = v10;
      id v16 = a1[6];
      id v17 = a1[7];
      [v10 _performDataSourceUpdateAnimated:0 cleanSnapshot:0 prepare:0 update:v15 completion:0];
    }
  }
  else
  {
    id v4 = [a1[4] log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      uint64_t v6 = objc_msgSend(a1[5], "ef_publicDescription");
      id v7 = a1[6];
      id v8 = a1[7];
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&unsigned char buf[24] = v7;
      *(_WORD *)&buf[32] = 2114;
      *(void *)&buf[34] = v8;
      _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore replaced item id: %{public}@, with new item id: %{public}@", buf, 0x2Au);
    }
  }
}

id __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_102(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_102_cold_1();
  }

  if ([v3 indexOfItemIdentifier:*(void *)(a1 + 40)] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    v12[0] = *(void *)(a1 + 48);
    uint64_t v5 = 1;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v3 insertItemsWithIdentifiers:v6 beforeItemWithIdentifier:*(void *)(a1 + 40)];

    uint64_t v11 = *(void *)(a1 + 40);
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v3 deleteItemsWithIdentifiers:v7];

    id v8 = [*(id *)(a1 + 32) collectionHelper];
    [v8 removePendingReadCancelablesForItemID:*(void *)(a1 + 40)];
  }
  int v9 = +[MessageListSectionDataSourceChange updated:v5];

  return v9;
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__MessageListSectionDataSource_collection_deletedItemIDs___block_invoke;
  v13[3] = &unk_1E6D11F80;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v13;
  int v9 = (void *)MEMORY[0x1E4F60F28];
  id v10 = v7;
  id v11 = v6;
  id v12 = [v9 mainThreadScheduler];
  [v12 performBlock:v8];
}

void __58__MessageListSectionDataSource_collection_deletedItemIDs___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) messageList];
  id v3 = *(void **)(a1 + 40);

  id v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    [v4 _deleteItemsWithIDs:v9 fromCollection:v10 animated:1 useImmediateCompletion:0 completionHandler:0];
  }
  else
  {
    uint64_t v5 = [v4 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      uint64_t v8 = *(void *)(a1 + 48);
      int v11 = 134218498;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore deleted item ids: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)didFinishRecoveryForCollection:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke;
  v9[3] = &unk_1E6D11A50;
  void v9[4] = self;
  id v10 = v4;
  uint64_t v5 = v9;
  uint64_t v6 = (void *)MEMORY[0x1E4F60F28];
  id v7 = v4;
  uint64_t v8 = [v6 mainThreadScheduler];
  [v8 performBlock:v5];
}

void __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (os_unfair_lock_s **)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) messageList];
  id v4 = *(void **)(a1 + 40);

  uint64_t v5 = *v2;
  if (v3 == v4)
  {
    uint64_t v9 = v5 + 4;
    os_unfair_lock_lock(v5 + 4);
    int v10 = [*(id *)(a1 + 32) isRefreshing];
    [*(id *)(a1 + 32) setIsRefreshing:0];
    os_unfair_lock_unlock(v9);
    int v11 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      __int16 v13 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      int v21 = v13;
      __int16 v22 = 1024;
      int v23 = v10;
      _os_log_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_DEFAULT, "%p: Did finish recovery for collection: %@ from refresh: %{BOOL}d", buf, 0x1Cu);
    }
    __int16 v15 = *(void **)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    if (v10)
    {
      [*(id *)(a1 + 32) _recoverFailedItemIDsIfNeededForCollection:v14 excluding:0 completion:0];
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke_103;
      v16[3] = &unk_1E6D11FA8;
      v16[4] = v15;
      id v17 = v14;
      [v15 _reloadPreparedItemIDsForCollection:v17 completion:v16];
    }
  }
  else
  {
    uint64_t v6 = [(os_unfair_lock_s *)v5 log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      *(_DWORD *)buf = 134218242;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      int v21 = v8;
      _os_log_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore did finish recover for collection", buf, 0x16u);
    }
  }
}

uint64_t __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke_103(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recoverFailedItemIDsIfNeededForCollection:*(void *)(a1 + 40) excluding:a2 completion:0];
}

- (void)didFinishRemoteSearchForCollection:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__MessageListSectionDataSource_didFinishRemoteSearchForCollection___block_invoke;
  v9[3] = &unk_1E6D11A50;
  void v9[4] = self;
  id v10 = v4;
  uint64_t v5 = v9;
  uint64_t v6 = (void *)MEMORY[0x1E4F60F28];
  id v7 = v4;
  uint64_t v8 = [v6 mainThreadScheduler];
  [v8 performBlock:v5];
}

void __67__MessageListSectionDataSource_didFinishRemoteSearchForCollection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) messageList];
  id v3 = *(void **)(a1 + 40);

  id v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    id v8 = [v4 delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 messageListSectionDataSource:*(void *)(a1 + 32) collectionFinishedSearching:*(void *)(a1 + 40) remote:1];
    }
  }
  else
  {
    uint64_t v5 = [v4 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      *(_DWORD *)buf = 134218242;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore did finish remove search for collection", buf, 0x16u);
    }
  }
}

- (void)collection:(id)a3 didFinishInitialLoadForThreadWithItemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke;
  v13[3] = &unk_1E6D11F80;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v13;
  uint64_t v9 = (void *)MEMORY[0x1E4F60F28];
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [v9 mainThreadScheduler];
  [v12 performBlock:v8];
}

void __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] messageList];
  id v3 = a1[5];

  id v4 = a1[4];
  if (v2 == v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_107;
    v10[3] = &unk_1E6D11A50;
    v10[4] = v4;
    id v9 = a1[5];
    id v11 = a1[6];
    [v4 _recoverFailedItemIDsIfNeededForCollection:v9 completion:v10];
  }
  else
  {
    uint64_t v5 = [a1[4] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[4];
      id v7 = objc_msgSend(a1[5], "ef_publicDescription");
      id v8 = a1[6];
      *(_DWORD *)buf = 134218498;
      id v13 = v6;
      __int16 v14 = 2114;
      id v15 = v7;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - did finish initial load for thread with item id: %{public}@", buf, 0x20u);
    }
  }
}

void __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_107(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_2;
  v3[3] = &unk_1E6D11A50;
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v1;
  id v2 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v3[0], 3221225472, __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_2, &unk_1E6D11A50, v4);
  [v2 performBlock:v3];
}

void __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "%p: Finish initial load for thread: %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) threadHelper];
  [v5 removeExpandingThreadWithItemID:*(void *)(a1 + 40)];
}

void __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_108(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_2;
  v3[3] = &unk_1E6D11A50;
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v1;
  id v2 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v3[0], 3221225472, __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_2, &unk_1E6D11A50, v4);
  [v2 performBlock:v3];
}

- (void)collection:(id)a3 oldestItemsUpdatedForMailboxes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__MessageListSectionDataSource_collection_oldestItemsUpdatedForMailboxes___block_invoke;
  v13[3] = &unk_1E6D11F80;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  __int16 v8 = v13;
  uint64_t v9 = (void *)MEMORY[0x1E4F60F28];
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [v9 mainThreadScheduler];
  [v12 performBlock:v8];
}

void __74__MessageListSectionDataSource_collection_oldestItemsUpdatedForMailboxes___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) messageList];
  uint64_t v3 = *(void **)(a1 + 40);

  uint64_t v4 = [*(id *)(a1 + 32) log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      __int16 v8 = *(void **)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      int v11 = 134218498;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2114;
      __int16 v16 = v10;
      _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Update oldest items for mailboxes: %{public}@, collection: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 messageListSectionDataSource:*(void *)(a1 + 32) updatedOldestItemsForMailboxes:*(void *)(a1 + 48)];
    }
  }
  else if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    int v11 = 134218242;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore updated oldest items", (uint8_t *)&v11, 0x16u);
  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(MessageListSectionDataSource *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageListSectionDataSource collection:addedItemIDs:after:]", "MessageListSectionDataSource.m", 686, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(MessageListSectionDataSource *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageListSectionDataSource collection:addedItemIDs:before:]", "MessageListSectionDataSource.m", 690, "0");
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(MessageListSectionDataSource *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageListSectionDataSource collection:changedItemIDs:]", "MessageListSectionDataSource.m", 694, "0");
}

- (NSSet)expandedThreadItemIDs
{
  id v2 = [(MessageListSectionDataSource *)self messageList];
  uint64_t v3 = [v2 expandedThreadItemIDs];

  return (NSSet *)v3;
}

- (void)messageListThreadHelper:(id)a3 didCollapseMessageListItem:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MessageListSectionDataSource *)self messageList];
    [v5 collapseThread:v6];
  }
}

- (void)messageListThreadHelper:(id)a3 didExpandMessageListItem:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MessageListSectionDataSource *)self messageList];
    [v5 expandThread:v6];
  }
}

- (void)_maybeReloadForTimedOutItemIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_timedOutItemIDsLock = &self->_timedOutItemIDsLock;
  os_unfair_lock_lock(&self->_timedOutItemIDsLock);
  uint64_t v4 = [(MessageListSectionDataSource *)self provider];
  char v5 = [v4 shouldReloadMessageListSectionDataSource:self];

  if ((v5 & 1) == 0)
  {
    id v10 = [(MessageListSectionDataSource *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v15 = self;
      _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "%p: Skip reload for timed out item ids", buf, 0xCu);
    }
    goto LABEL_10;
  }
  id v6 = [(MessageListSectionDataSource *)self timedOutItemIDs];
  unint64_t v7 = [v6 count];

  if (v7 >= 0xB)
  {
    EFSaveTailspin();
    if (![(MessageListSectionDataSource *)self hasReloadedForTimeOut])
    {
      id v8 = [(MessageListSectionDataSource *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(MessageListSectionDataSource *)self timedOutItemIDs];
        *(_DWORD *)buf = 134218240;
        __int16 v15 = self;
        __int16 v16 = 2048;
        uint64_t v17 = [v9 count];
        _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Triggering a reload for %lu timed out itemIDs", buf, 0x16u);
      }
      [(MessageListSectionDataSource *)self setHasReloadedForTimeOut:1];
      id v10 = [(MessageListSectionDataSource *)self timedOutItemIDs];
      id v11 = [MEMORY[0x1E4F1CA80] set];
      [(MessageListSectionDataSource *)self setTimedOutItemIDs:v11];

      if ([v10 count])
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke;
        v12[3] = &unk_1E6D11FD0;
        v12[4] = self;
        id v10 = v10;
        __int16 v13 = v10;
        [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:0 cleanSnapshot:0 prepare:0 update:v12 completion:0];
      }
LABEL_10:
    }
  }
  os_unfair_lock_unlock(p_timedOutItemIDsLock);
}

id __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  char v5 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_cold_1();
  }

  id v6 = [*(id *)(a1 + 40) allObjects];
  unint64_t v7 = objc_msgSend(v3, "mui_validItemIDsFromExistingItemIDs:updateReason:", v6, @"Reload timedOutitemIDs");

  id v8 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *v4;
    *(_DWORD *)buf = 134218242;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v7;
    _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Reloading itemIDs: %@", buf, 0x16u);
  }

  uint64_t v10 = [v7 count];
  uint64_t v11 = [v7 count];
  if (v11 == [*(id *)(a1 + 40) count])
  {
    [v3 reloadItemsWithIdentifiers:v7];
  }
  else
  {
    uint64_t v12 = [*v4 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      id v20 = v16;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_error_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_ERROR, "%p: timedOutItemIDs: %@ has diverged from itemIDs: %@, reload data source", buf, 0x20u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_121;
    v18[3] = &unk_1E6D11708;
    v18[4] = *v4;
    __int16 v13 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v13 performBlock:v18];

    uint64_t v10 = 0;
  }
  id v14 = +[MessageListSectionDataSourceChange updated:v10];

  return v14;
}

void __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_121(uint64_t a1)
{
}

- (void)_reloadDataSource
{
  if (a1)
  {
    [a1 stopObserving];
    id v2 = [a1 messageList];
    id v5 = (id)[v2 copy];

    id v3 = [a1 delegate];
    uint64_t v4 = [v3 initialLoadCompletedPromiseForMessageListSectionDataSource:a1];
    [a1 replaceMessageList:v5 initialLoadCompletedPromise:v4];

    [a1 beginObservingAnimated:1 nextUpdateNeedsCleanSnapshot:1];
  }
}

id __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 numberOfItemsInSection:v6];
  int v8 = *(unsigned __int8 *)(a1 + 72);
  id v9 = [*(id *)(a1 + 32) collectionHelper];
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v8) {
    uint64_t v13 = [v9 addItemIDs:v11 before:v12 snapshot:v5 section:v6 validateOtherSections:1];
  }
  else {
    uint64_t v13 = [v9 addItemIDs:v11 after:v12 snapshot:v5 section:v6 validateOtherSections:1];
  }
  uint64_t v14 = v13;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(a1 + 32) _updateSelectionStateForItemsWithIDs:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) inThreadWithItemID:*(void *)(a1 + 48) snapshot:v5 shouldDeselectMessages:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  }
  __int16 v15 = +[MessageListSectionDataSourceChange added:v14 isFirstChange:v7 == 0];

  return v15;
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2_138(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"kMessageListItemsFirstBatchRetrieved" object:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 40) delegate];
  [v3 messageListSectionDataSource:*(void *)(a1 + 40) didAddMessagesWithItemIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [v3 messageListSectionDataSource:*(void *)(a1 + 40) addMessagesToStackWithItemIDs:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  uint64_t v4 = [*(id *)(a1 + 40) signpostLog];
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MessageListViewControllerAddedItemsBatch", "", v7, 2u);
  }
}

- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 animated:(BOOL)a5 useImmediateCompletion:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  void v23[3] = __Block_byref_object_copy__0;
  v23[4] = __Block_byref_object_dispose__0;
  id v24 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke;
  v22[3] = &unk_1E6D120C0;
  v22[4] = self;
  v22[5] = v23;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  int v20[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D11FD0;
  v20[4] = self;
  id v21 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_143;
  v16[3] = &unk_1E6D120E8;
  id v14 = v13;
  id v18 = v14;
  v16[4] = self;
  id v15 = v21;
  id v17 = v15;
  uint64_t v19 = v23;
  [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:v8 cleanSnapshot:0 prepare:v22 update:v20 completion:v16];

  _Block_object_dispose(v23, 8);
}

uint64_t __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) threadHelper];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

id __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  os_signpost_id_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  BOOL v8 = [v6 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    uint64_t v11 = *(void *)(a1 + 40);
    int v16 = 134218498;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: deletedItemIDs(%ld): %@", (uint8_t *)&v16, 0x20u);
  }

  id v12 = objc_msgSend(v5, "mui_validItemIDsFromExistingItemIDs:section:updateReason:", *(void *)(a1 + 40), v7, @"Deleting itemIDs");

  uint64_t v13 = [v12 count];
  if (v13) {
    [v5 deleteItemsWithIdentifiers:v12];
  }
  id v14 = +[MessageListSectionDataSourceChange removed:v13];

  return v14;
}

void __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_143(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) provider];
  uint64_t v4 = [v3 snapshotForMessageListSectionDataSource:*(void *)(a1 + 32)];

  id v5 = objc_msgSend(v4, "mui_validItemIDsFromExistingItemIDs:updateReason:", *(void *)(a1 + 40), @"Reloading itemIDs after Delete");
  os_signpost_id_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) itemIDsForReloadAfterDeletingItemIDs:v5 snapshot:v4];
  if ([v6 count]) {
    [*(id *)(a1 + 32) _reloadItemsWithItemIDs:v6];
  }
  id v7 = [*(id *)(a1 + 32) failedItemIDs];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2_147;
  v11[3] = &unk_1E6D117B0;
  id v12 = *(id *)(a1 + 40);
  [v7 performWhileLocked:v11];

  BOOL v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(v8);
  uint64_t v9 = [*(id *)(a1 + 32) timedOutItemIDs];
  objc_msgSend(v9, "ef_removeObjectsInArray:", *(void *)(a1 + 40));

  os_unfair_lock_unlock(v8);
  uint64_t v10 = [*(id *)(a1 + 32) delegate];
  [v10 messageListSectionDataSource:*(void *)(a1 + 32) deletedMessagesWithItemIdentifiers:*(void *)(a1 + 40)];
}

uint64_t __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2_147(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_removeObjectsInArray:", *(void *)(a1 + 32));
}

- (void)_reloadPreparedItemIDsForCollection:(id)a3 completion:(id)a4
{
  id v5 = a4;
  os_signpost_id_t v6 = [(MessageListSectionDataSource *)self _preparedMessageListItemIDs];
  if ([v6 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__MessageListSectionDataSource__reloadPreparedItemIDsForCollection_completion___block_invoke;
    v7[3] = &unk_1E6D12110;
    id v8 = v6;
    uint64_t v9 = self;
    id v10 = v5;
    [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:0 cleanSnapshot:0 prepare:0 update:v7 completion:0];
  }
  else
  {
    (*((void (**)(id, void *))v5 + 2))(v5, v6);
  }
}

id __79__MessageListSectionDataSource__reloadPreparedItemIDsForCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v4, "mui_validItemIDsFromExistingItemIDs:updateReason:", v3, @"Reloading visible itemIDs");
  uint64_t v6 = [v5 count];
  uint64_t v7 = [*(id *)(a1 + 32) count];
  id v8 = [*(id *)(a1 + 40) log];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 == v7)
  {
    if (!v9) {
      goto LABEL_7;
    }
    uint64_t v10 = *(void *)(a1 + 40);
    int v23 = 134218498;
    uint64_t v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = [v5 count];
    __int16 v27 = 2112;
    uint64_t v28 = (uint64_t)v5;
    uint64_t v11 = "%p: Reloading prepared itemIDs (%ld): %@";
    id v12 = v8;
    uint32_t v13 = 32;
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [v5 count];
    uint64_t v16 = [*(id *)(a1 + 32) count];
    int v23 = 134218754;
    uint64_t v24 = v14;
    __int16 v25 = 2048;
    uint64_t v26 = v15;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    __int16 v29 = 2112;
    long long v30 = v5;
    uint64_t v11 = "%p: Reloading prepared itemIDs (%ld valid out of %ld total): %@";
    id v12 = v8;
    uint32_t v13 = 42;
  }
  _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v23, v13);
LABEL_7:

  [v4 reloadItemsWithIdentifiers:v5];
  (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v17, v18, v19, v20);
  uint64_t v21 = +[MessageListSectionDataSourceChange updated:](_TtC6MailUI34MessageListSectionDataSourceChange, "updated:", [v5 count]);

  return v21;
}

BOOL __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 provider];
  uint64_t v6 = [v5 messageListSectionDataSource:*(void *)(a1 + 32) indexPathForItemIdentifier:v4];

  return v6 != 0;
}

uint64_t __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 _reloadItemsWithItemIDs:v4];
  }
  return result;
}

- (id)_preparedMessageListItemIDs
{
  uint64_t v3 = [(MessageListSectionDataSource *)self collectionView];
  uint64_t v4 = objc_msgSend(v3, "mui_indexPathsForPreparedItems");

  id v5 = [(MessageListSectionDataSource *)self provider];
  uint64_t v6 = [v5 snapshotForMessageListSectionDataSource:self];
  uint64_t v7 = objc_msgSend(v6, "mui_validItemIDsFromIndexPaths:", v4);

  return v7;
}

- (void)_reloadItemsWithItemIDs:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke;
  v9[3] = &unk_1E6D11A50;
  void v9[4] = self;
  id v10 = v4;
  id v5 = v9;
  uint64_t v6 = (void *)MEMORY[0x1E4F60F28];
  id v7 = v4;
  id v8 = [v6 mainThreadScheduler];
  [v8 performBlock:v5];
}

void __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) provider];
  id v4 = [v3 messageListSectionDataSource:*v2 indexPathsForItemIdentifiers:*(void *)(a1 + 40)];

  uint64_t v5 = [v4 count];
  uint64_t v6 = (void *)*v2;
  if (v5)
  {
    [v6 reconfigureItemsAtIndexPaths:v4];
  }
  else
  {
    id v7 = [v6 log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke_cold_1();
    }
  }
}

id __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_152_cold_1();
  }

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) allObjects];
  id v7 = objc_msgSend(v3, "mui_validItemIDsFromExistingItemIDs:updateReason:", v6, @"Recovery itemIDs");

  id v8 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *v4;
    *(_DWORD *)buf = 134218498;
    id v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = [v7 count];
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Reloading itemIDs(%ld): %@", buf, 0x20u);
  }

  uint64_t v10 = [v7 count];
  uint64_t v11 = [v7 count];
  if (v11 == [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    [v3 reloadItemsWithIdentifiers:v7];
  }
  else
  {
    id v12 = [*v4 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
      uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v19 = [v7 count];
      *(_DWORD *)buf = 134219010;
      id v22 = v16;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      long long v30 = v7;
      _os_log_error_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_ERROR, "%p: failedItemIDs(%ld): %@ has diverged from itemIDs(%ld): %@, reload data source", buf, 0x34u);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    int v20[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_156;
    v20[3] = &unk_1E6D11708;
    v20[4] = *v4;
    uint32_t v13 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v13 performBlock:v20];

    uint64_t v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v14 = +[MessageListSectionDataSourceChange updated:v10];

  return v14;
}

void __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_156(uint64_t a1)
{
}

- (void)didSelectDisclosureButtonForMessageListItem:(id)a3 disclosureEnabled:(BOOL)a4
{
  int v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 itemID];
  if (v7)
  {
    id v8 = [(MessageListSectionDataSource *)self messageList];
    id v9 = [v8 expandedThreadItemIDs];
    int v10 = [v9 containsObject:v7];

    if (v10 == v4)
    {
      uint64_t v11 = [(MessageListSectionDataSource *)self provider];
      uint64_t v12 = [v11 messageListSectionDataSource:self indexPathForItemIdentifier:v7];
      uint32_t v13 = [(MessageListSectionDataSource *)self collectionView];
      __int16 v29 = (void *)v12;
      uint64_t v14 = [v13 cellForItemAtIndexPath:v12];

      if ([v14 conformsToProtocol:&unk_1F39E2B58]) {
        [v14 setDisclosureEnabled:v4 ^ 1u animated:1];
      }
      uint64_t v15 = [(MessageListSectionDataSource *)self threadHelper];
      uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
      uint64_t v17 = [v6 itemID];
      uint64_t v18 = [v11 snapshotForMessageListSectionDataSource:self];
      uint64_t v19 = [v15 itemIDBeforeItemID:v17 snapshot:v18];

      if (v19) {
        [v16 addObject:v19];
      }
      [v15 addItemIDsNeedingReloadPostUpdate:v16];
      uint64_t v20 = [(MessageListSectionDataSource *)self log];
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v21)
        {
          id v22 = [v6 itemID];
          *(_DWORD *)buf = 134218242;
          uint64_t v31 = self;
          __int16 v32 = 2112;
          id v33 = v22;
          _os_log_impl(&dword_1DDCDB000, v20, OS_LOG_TYPE_DEFAULT, "%p: Collapse thread: %@", buf, 0x16u);
        }
        __int16 v23 = [(MessageListSectionDataSource *)self selectionModelProvider];
        uint64_t v24 = [v23 selectionModelForMessageListSectionDataSource:self];
        __int16 v25 = [v6 itemID];
        [v24 willCollapseThreadItemID:v25];

        [v15 collapseMessageListItem:v6];
      }
      else
      {
        if (v21)
        {
          uint64_t v26 = [v6 itemID];
          *(_DWORD *)buf = 134218242;
          uint64_t v31 = self;
          __int16 v32 = 2112;
          id v33 = v26;
          _os_log_impl(&dword_1DDCDB000, v20, OS_LOG_TYPE_DEFAULT, "%p: Expand thread: %@", buf, 0x16u);
        }
        __int16 v27 = [v6 itemID];
        [v15 addExpandingThreadWithItemID:v27];

        [v15 expandMessageListItem:v6];
      }
    }
    else
    {
      uint64_t v11 = [(MessageListSectionDataSource *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v31 = self;
        _os_log_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_DEFAULT, "%p: Skipping attempting to expand or collapse thread that is already expanded or collapsed", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = [(MessageListSectionDataSource *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MessageListSectionDataSource didSelectDisclosureButtonForMessageListItem:disclosureEnabled:]((uint64_t)self, v11);
    }
  }
}

- (BOOL)shouldShowSupplementaryViewOfKindIfEmpty:(id)a3 isIndexing:(BOOL)a4
{
  return 0;
}

- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]]
    && [(MessageListSectionDataSource *)self _isSectionHeaderAllowed])
  {
    uint64_t v11 = [(MessageListSectionDataSource *)self headerRegistration];
    uint64_t v12 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:v11 forIndexPath:v10];
  }
  else
  {
    uint32_t v13 = [(MessageListSectionDataSource *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134219010;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2114;
      id v22 = v10;
      __int16 v23 = 2048;
      unint64_t v24 = [(MessageListSectionDataSource *)self headerType];
      _os_log_error_impl(&dword_1DDCDB000, v13, OS_LOG_TYPE_ERROR, "%p: unable to configure supplementary view for collectionView:%{public}@ of elementKind:%{public}@ at indexPath:%{public}@, headerType:%lu", (uint8_t *)&v15, 0x34u);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (MessageListSectionDataSource *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      id v6 = [(MessageListSectionDataSource *)self section];
      id v7 = [(MessageListSectionDataSource *)v5 section];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void)setMessageList:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setSelectionModelProvider:(id)a3
{
}

- (void)setInitialLoadCompletedPromise:(id)a3
{
}

- (void)setFailedItemIDs:(id)a3
{
}

- (NSMutableSet)timedOutItemIDs
{
  return self->_timedOutItemIDs;
}

- (void)setTimedOutItemIDs:(id)a3
{
}

- (BOOL)hasReloadedForTimeOut
{
  return self->_hasReloadedForTimeOut;
}

- (void)setHasReloadedForTimeOut:(BOOL)a3
{
  self->_hasReloadedForTimeOut = a3;
}

- (void)setNextUpdateNeedsCleanSnapshot:(BOOL)a3
{
  self->_nextUpdateNeedsCleanSnapshot = a3;
}

- (BOOL)isRefreshing
{
  return self->_isRefreshing;
}

- (EFCancelable)shouldAlertOnBlankCellToken
{
  return self->_shouldAlertOnBlankCellToken;
}

- (void)setShouldAlertOnBlankCellToken:(id)a3
{
}

- (void)setHeaderType:(unint64_t)a3
{
  self->_headerType = a3;
}

- (EFCancelable)numberOfPreviewLinesToken
{
  return self->_numberOfPreviewLinesToken;
}

- (void)setNumberOfPreviewLinesToken:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (void)setLayoutValuesHelper:(id)a3
{
}

- (void)setThreadHelper:(id)a3
{
}

- (void)setItemHelper:(id)a3
{
}

- (void)setCollectionHelper:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
}

- (void)setNumberOfPreviewLines:(int64_t)a3
{
  self->_numberOfPreviewLines = a3;
}

- (void)setHeaderRegistration:(id)a3
{
}

- (void)setLog:(id)a3
{
}

- (void)setSignpostLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_headerRegistration, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_collectionHelper, 0);
  objc_storeStrong((id *)&self->_itemHelper, 0);
  objc_storeStrong((id *)&self->_threadHelper, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_numberOfPreviewLinesToken, 0);
  objc_storeStrong((id *)&self->_shouldAlertOnBlankCellToken, 0);
  objc_storeStrong((id *)&self->_timedOutItemIDs, 0);
  objc_storeStrong((id *)&self->_failedItemIDs, 0);
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, 0);
  objc_destroyWeak((id *)&self->_selectionModelProvider);
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a2 + 32);
  id v6 = objc_msgSend(*(id *)(a2 + 40), "ef_publicDescription");
  int v7 = 134218754;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = 0x4000000000000000;
  __int16 v11 = 2114;
  uint64_t v12 = v5;
  __int16 v13 = 2114;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "%p: [Blank cell] Message list item fetch timeout after %.2fs (itemID: %{public}@, indexPath: %{public}@)", (uint8_t *)&v7, 0x2Au);
}

void __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_102_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEBUG, "%p: replacedExistingItemID: %@ with %@", v3, 0x20u);
}

void __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_1DDCDB000, v0, v1, "%p: Reload for timedOutItemIDs: %@");
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1DDCDB000, v0, OS_LOG_TYPE_FAULT, "%p: Adding objectIDs but duplicate found %{public}@", v1, 0x16u);
}

void __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1DDCDB000, v0, OS_LOG_TYPE_ERROR, "%p: No indexPaths found to reload itemIDs: %{public}@", v1, 0x16u);
}

void __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_152_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_1DDCDB000, v0, v1, "%p: Recovery for failedItemIDs: %@");
}

- (void)didSelectDisclosureButtonForMessageListItem:(uint64_t)a1 disclosureEnabled:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_ERROR, "%p: Message list item id is nil, ignore disclosure button tap", (uint8_t *)&v2, 0xCu);
}

@end