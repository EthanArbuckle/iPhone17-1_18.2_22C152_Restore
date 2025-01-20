@interface MUIMessageListViewController
- (BOOL)_shouldDisplayHelpMailLearn;
- (BOOL)_shouldDisplayOnboardingTip;
- (BOOL)didNotifyExtendedLaunchTracker;
- (BOOL)firstBatchCellConfigurationCompleted;
- (BOOL)focusAllowed;
- (BOOL)hasUpdatedAllVisibleSections;
- (BOOL)isBlackPearlEnabled;
- (BOOL)isBucketBarHidden;
- (BOOL)isFilterButtonEnabled;
- (BOOL)isFocusFilterEnabled;
- (BOOL)isInExpandedEnvironment;
- (BOOL)isIndexingMessagesForMessageListDataSource:(id)a3;
- (BOOL)isInitialCellConfigurationCompleted;
- (BOOL)isPresentingSearchViewController;
- (BOOL)isSearchControllerActive;
- (BOOL)isSearchViewController;
- (BOOL)isThreaded;
- (BOOL)messageListDataSource:(id)a3 section:(id)a4 shouldSuspendUpdatesAfterChange:(id)a5;
- (BOOL)messageListDataSource:(id)a3 shouldAnimateNextUpdateInSectionDataSource:(id)a4 change:(id)a5;
- (BOOL)messageListRecentSectionDataSourceIsInExpandedEnvironment:(id)a3;
- (BOOL)messageSelectionStrategy:(id)a3 anyExpandedThreadContainsItemID:(id)a4;
- (BOOL)messageSelectionStrategy:(id)a3 isExpandedThreadWithItemID:(id)a4;
- (BOOL)selectRowOfItemID:(id)a3 scrollToVisible:(BOOL)a4 animated:(BOOL)a5;
- (BOOL)selectRowOfItemID:(id)a3 scrollToVisible:(BOOL)a4 scrollPosition:(int64_t)a5 animated:(BOOL)a6;
- (BOOL)shouldDisplayGroupedSenders;
- (BOOL)shouldHideFollowUp;
- (BOOL)shouldIgnoreCommercePredicate;
- (BOOL)swipeActionVisible;
- (CSSuggestion)currentSuggestion;
- (Class)sectionListCellClassForMessageListSectionDataSource:(id)a3;
- (EFCancelable)diagnosticsHelperToken;
- (EFCancelable)focusObservationToken;
- (EFCancelable)shouldIgnoreCommercePredicateToken;
- (EFCancelable)userDefaultsObserver;
- (EFPromise)initialLoadCompletedPromise;
- (EMAccountRepository)accountRepository;
- (EMCachingContactStore)contactStore;
- (EMCollectionItemID)initialScrollItemID;
- (EMCollectionItemID)itemIDToSelectAfterMoveID;
- (EMCollectionItemID)lastSelectedItemID;
- (EMDaemonInterface)daemonInterface;
- (EMDiagnosticsHelper)diagnosticsHelper;
- (EMFocus)currentFocus;
- (EMFocusController)focusController;
- (EMMailboxCategoryCloudStorage)mailboxCategoryCloudStorage;
- (EMMailboxRepository)mailboxRepository;
- (EMMessage)messageToDisplayOnReload;
- (EMMessageListItem)referenceMessageListItem;
- (EMMessageListItem)senderSpecificMessageListItem;
- (EMMessageRepository)messageRepository;
- (EMNSUserDefaultsBoolObserver)hasCompletedAppleIntelligenceOnboarding;
- (EMNSUserDefaultsBoolObserver)showHighlights;
- (MSBucketBarConfigurationController)bucketBarConfigurationController;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (MUIBucketsViewControllerSession)bucketsViewController;
- (MUICategoryGroupingPreferenceController)categoryGroupingPreferenceController;
- (MUIHighlightedMessagesController)highlightedMessagesController;
- (MUIMailboxFilterController)filterController;
- (MUIMailboxFilterViewModel)filterViewModel;
- (MUIMessageListViewController)initWithDaemonInterface:(id)a3 focusController:(id)a4 mailboxCategoryCloudStorage:(id)a5 avatarGenerator:(id)a6 bucketBarConfigurationController:(id)a7 brandIndicatorProvider:(id)a8 mailboxes:(id)a9 contactStore:(id)a10 diagnosticsHelper:(id)a11;
- (MessageListCellLayoutValuesHelper)layoutValuesHelper;
- (MessageListCellsController)cellsController;
- (MessageListDataSource)dataSource;
- (MessageListFetchHelper)messageListFetchHelper;
- (MessageListPositionHelper)messageListPositionHelper;
- (MessageListSelectionModel)messageListSelectionModel;
- (MessageListViewControllerState)state;
- (MessageSelectionStrategy)messageSelectionStrategy;
- (NSArray)highlightedMessages;
- (NSArray)inputLanguages;
- (NSArray)lastSelectedMessageListItems;
- (NSArray)mailboxes;
- (NSDictionary)oldestItemsIDsByMailboxObjectID;
- (NSIndexPath)previouslySelectedIndexPath;
- (NSMutableSet)configuredSections;
- (NSMutableSet)indexPathsForConfiguredCollectionViewCells;
- (NSMutableSet)mailboxesPendingOldestItemsUpdates;
- (NSPredicate)currentFilterPredicate;
- (NSPredicate)unseenPredicate;
- (NSSet)indexPathsForToBeConfiguredCells;
- (NSString)userQueryString;
- (UICollectionView)collectionView;
- (double)bucketsViewControllerHeight;
- (id)_configuredBucketsViewControllerWithMailboxes:(id)a3;
- (id)_indexPathsForSelectedItems;
- (id)_predicateForFiltersEnabled:(void *)a1;
- (id)_updatedPredicateForReadLater:(id)a3;
- (id)_updatedPredicateForSelectedBucket:(id)a3;
- (id)cellLayoutValuesForHighlightedMessages;
- (id)createMailboxFilterController;
- (id)createMessageListForReload;
- (id)feedbackListViewModelForHelpMailLearnSectionDataSource:(id)a3;
- (id)indexPathOfSelectedMessageForMessageSelectionStrategy:(id)a3;
- (id)initialLoadCompletedPromiseForMessageListSectionDataSource:(id)a3;
- (id)messageListDataSource:(id)a3 sectionDataSourceForSection:(id)a4 objectID:(id)a5 messageList:(id)a6;
- (id)messageListItemsForDiagnosticsHelper:(id)a3;
- (id)messageSelectionStrategy:(id)a3 indexPathOfItemID:(id)a4;
- (id)messageSelectionStrategy:(id)a3 itemIDForIndexPath:(id)a4;
- (id)messageSelectionStrategy:(id)a3 messageListItemForItemID:(id)a4;
- (id)searchPredicateForMailboxes:(id)a3;
- (id)sectionDataSourceConfigurationWithIdentifier:(id)a3 section:(id)a4 messageList:(id)a5;
- (id)updatedPredicateForFocusedAccounts:(id)a3;
- (int)userBrowseDirection;
- (int64_t)numberOfItemsForMessageSelectionStrategy:(id)a3;
- (int64_t)selectedBucket;
- (int64_t)selectedBucketForMessageListRecentSectionDataSource:(id)a3;
- (uint64_t)_hasInitialLoadPromiseForSection:(uint64_t)a1;
- (void)_bucketBarUserInteractionEnabled:(BOOL)a3;
- (void)_disableFilters;
- (void)_enableFilters;
- (void)_highlightNextMessageAfterDeletingMessagesWithItemIdentifiers:(void *)a1;
- (void)_refreshBucketsSession;
- (void)_reloadServerSearchMessageListIfNecessaryWithQuery:(id)a3;
- (void)_reportFilterButtonTapped;
- (void)_reportFilterChangeEvent:(void *)a3 filters:;
- (void)_resetMailboxRepositoryForMailboxes:(id)a3;
- (void)_selectAllMail;
- (void)_selectBucket:(int64_t)a3;
- (void)_selectPrimary;
- (void)_selectPromotions;
- (void)_selectTransactions;
- (void)_selectUpdates;
- (void)_shouldApplyFilterPredicate:(void *)a1;
- (void)_updateBucketBarIsHidden:(BOOL)a3;
- (void)_updateUnseenCountQueries;
- (void)_updateViewPrimaryWithNoOnboardingIfNeeded;
- (void)applyFilterPredicate:(id)a3;
- (void)bucketBarConfigurationController:(id)a3 isHidden:(BOOL)a4 forMailboxes:(id)a5;
- (void)bucketBarConfigurationControllerRequiresReload:(id)a3;
- (void)cancelQueueSuspensionTimeout;
- (void)categoryGroupingPreferenceController:(id)a3 shouldDisableGrouping:(BOOL)a4 forBucket:(int64_t)a5;
- (void)configureDelegatesForDataSource:(id)a3;
- (void)createMessageListForReload;
- (void)currentFocusChanged:(id)a3;
- (void)dealloc;
- (void)deselectAllItemsInCollectionView:(id)a3 animated:(BOOL)a4;
- (void)deselectSelectedItemsInCollectionView;
- (void)highlightedMessagesController:(id)a3 didFindMessages:(id)a4;
- (void)highlightedMessagesViewDidChangeHeight;
- (void)highlightedMessagesViewDidProvideFeedbackForMessage:(id)a3 feedbackType:(int64_t)a4 feedbackFeature:(int64_t)a5;
- (void)highlightedMessagesViewDidSelectMessage:(id)a3;
- (void)messageListDataSource:(id)a3 willUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6 cleanSnapshot:(BOOL)a7;
- (void)messageListDataSourcePrepareUpdate:(id)a3 section:(id)a4 cleanSnapshot:(BOOL)a5;
- (void)messageListDataSourceUpdateFailed:(id)a3 section:(id)a4;
- (void)messageListSectionDataSource:(id)a3 deletedMessagesWithItemIdentifiers:(id)a4;
- (void)messageListSectionDataSource:(id)a3 didAddMessagesWithItemIdentifiers:(id)a4;
- (void)messageListSectionDataSource:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5 item:(id)a6 itemWasCached:(BOOL)a7 duration:(double)a8;
- (void)messageListSectionDataSource:(id)a3 didFailToConfigureCellAtIndexPath:(id)a4 error:(id)a5;
- (void)messageListSectionDataSource:(id)a3 handleRowSelectionAfterMovingMessagesWithItemIdentifiers:(id)a4;
- (void)messageListSectionDataSource:(id)a3 updatedOldestItemsForMailboxes:(id)a4;
- (void)refreshHighlightedMessagesController;
- (void)reloadDataSource;
- (void)reloadDataSourceApplyEmptySnapshot:(BOOL)a3;
- (void)reloadDataSourceWithMessageList:(id)a3;
- (void)reloadDataSourceWithMessageList:(id)a3 applyEmptySnapshot:(BOOL)a4;
- (void)reloadDataSourceWithMessageList:(id)a3 section:(id)a4;
- (void)reloadDataSourceWithSearchPredicate:(id)a3;
- (void)reloadFromMailboxes;
- (void)selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setBrandIndicatorProvider:(id)a3;
- (void)setBucketsViewController:(id)a3;
- (void)setCategoryGroupingPreferenceController:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setConfiguredSections:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCurrentFilterPredicate:(id)a3;
- (void)setCurrentFocus:(id)a3;
- (void)setCurrentSuggestion:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDiagnosticsHelperToken:(id)a3;
- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3;
- (void)setFilterButtonEnabled:(BOOL)a3;
- (void)setFilterController:(id)a3;
- (void)setFiltersEnabled:(BOOL)a3;
- (void)setFirstBatchCellConfigurationCompleted:(BOOL)a3;
- (void)setFocusFilterEnabled:(BOOL)a3;
- (void)setFocusObservationToken:(id)a3;
- (void)setHideFollowUp:(BOOL)a3;
- (void)setHighlightedMessages:(id)a3;
- (void)setIndexPathsForConfiguredCollectionViewCells:(id)a3;
- (void)setIndexPathsForToBeConfiguredCells:(id)a3;
- (void)setInitialCellConfigurationCompleted:(BOOL)a3;
- (void)setInitialLoadCompletedPromise:(id)a3;
- (void)setInitialScrollItemID:(id)a3;
- (void)setItemIDToSelectAfterMoveID:(id)a3;
- (void)setLastSelectedItemID:(id)a3;
- (void)setLastSelectedMessageListItems:(id)a3;
- (void)setLayoutValuesHelper:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setMessageListFetchHelper:(id)a3;
- (void)setMessageListPositionHelper:(id)a3;
- (void)setMessageListSelectionModel:(id)a3;
- (void)setMessageRepository:(id)a3;
- (void)setMessageToDisplayOnReload:(id)a3;
- (void)setOldestItemsIDsByMailboxObjectID:(id)a3;
- (void)setPreviouslySelectedIndexPath:(id)a3;
- (void)setPrimitiveFocusFilterEnabled:(BOOL)a3;
- (void)setPrimitiveMailboxes:(id)a3;
- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6;
- (void)setSelectedBucket:(int64_t)a3;
- (void)setSenderSpecificMessageListItem:(id)a3;
- (void)setShouldIgnoreCommercePredicate:(BOOL)a3;
- (void)setShouldIgnoreCommercePredicateToken:(id)a3;
- (void)setState:(id)a3;
- (void)setSwipeActionVisible:(BOOL)a3;
- (void)setThreaded:(BOOL)a3;
- (void)setUnseenPredicate:(id)a3;
- (void)setUserBrowseDirection:(int)a3;
- (void)setUserDefaultsObserver:(id)a3;
- (void)showBlankCellAlertForMessageListSectionDataSource:(id)a3 itemID:(id)a4 indexPath:(id)a5 reason:(id)a6;
- (void)toggleFilters;
- (void)updateFilterContextForMailboxes:(id)a3 focus:(id)a4 applyFilters:(BOOL)a5;
- (void)updateFilterControlWithFilterViewModel:(id)a3;
- (void)updateFilters;
- (void)updateHighlightsToggleVisibility;
- (void)updateHighlightsVisibility;
- (void)updateSelectedBucket:(int64_t)a3 unseenPredicate:(id)a4;
- (void)updateState:(id)a3 withMailboxes:(id)a4;
@end

@implementation MUIMessageListViewController

- (MUIBucketsViewControllerSession)bucketsViewController
{
  return self->_bucketsViewController;
}

- (void)setBucketsViewController:(id)a3
{
}

- (EMMailboxCategoryCloudStorage)mailboxCategoryCloudStorage
{
  return self->_mailboxCategoryCloudStorage;
}

- (BOOL)messageListDataSource:(id)a3 section:(id)a4 shouldSuspendUpdatesAfterChange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 section];
  if (![v8 isMessagesSection:v11])
  {

LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  BOOL v12 = [(MUIMessageListViewController *)self isInitialCellConfigurationCompleted];

  if (v12
    || !+[MessageListSectionDataSource isFirstChange:](MessageListSectionDataSource, "isFirstChange:", v10)|| +[MessageListSectionDataSource numberOfChanges:v10] < 1)
  {
    goto LABEL_9;
  }
  os_unfair_lock_lock(&self->_queueSuspensionTimeoutTokenLock);
  queueSuspensionTimeoutToken = self->_queueSuspensionTimeoutToken;
  if (queueSuspensionTimeoutToken) {
    [(EFCancelable *)queueSuspensionTimeoutToken cancel];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__MUIMessageListViewController_messageListDataSource_section_shouldSuspendUpdatesAfterChange___block_invoke;
  v19[3] = &unk_1E6D117D8;
  objc_copyWeak(&v20, &location);
  v15 = [v14 afterDelay:v19 performBlock:2.0];
  v16 = self->_queueSuspensionTimeoutToken;
  self->_queueSuspensionTimeoutToken = v15;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(&self->_queueSuspensionTimeoutTokenLock);
  BOOL v17 = 1;
LABEL_10:

  return v17;
}

- (BOOL)isInitialCellConfigurationCompleted
{
  return self->_initialCellConfigurationCompleted;
}

void __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sectionListCellClassForMessageListSectionDataSource:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 32) collectionView];
  v4 = [v3 visibleCells];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke_2;
  v9[3] = &unk_1E6D13280;
  id v5 = v2;
  id v10 = v5;
  v6 = objc_msgSend(v4, "ef_filter:", v9);

  if ([v6 count])
  {
    v7 = objc_msgSend(v6, "ef_compactMap:", &__block_literal_global_107);
    id v8 = [*(id *)(a1 + 32) cellsController];
    [v8 markItemIDsAsVisibleBeforeUpdate:v7];
  }
}

- (NSSet)indexPathsForToBeConfiguredCells
{
  return self->_indexPathsForToBeConfiguredCells;
}

- (MessageListCellsController)cellsController
{
  return self->_cellsController;
}

- (BOOL)firstBatchCellConfigurationCompleted
{
  return self->_firstBatchCellConfigurationCompleted;
}

- (id)sectionDataSourceConfigurationWithIdentifier:(id)a3 section:(id)a4 messageList:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if (-[MUIMessageListViewController _hasInitialLoadPromiseForSection:]((uint64_t)self, v8))
  {
    v22 = [(MUIMessageListViewController *)self initialLoadCompletedPromise];
  }
  else
  {
    v22 = 0;
  }
  v24 = v8;
  v25 = v9;
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && ([v8 isEqualToString:@"MessageListSectionPriority"] & 1) != 0)
  {
    uint64_t v11 = 1;
  }
  else if (MUIBucketAllowsNewAndOldSections([(MUIMessageListViewController *)self selectedBucket]))
  {
    BOOL v12 = [(MUIMessageListViewController *)self dataSource];
    int v13 = [v12 isMessagesSection:v8];

    if (v13) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v14 = [MessageListSectionDataSourceConfiguration alloc];
  v15 = [(MUIMessageListViewController *)self collectionView];
  v16 = [(MUIMessageListViewController *)self layoutValuesHelper];
  BOOL v17 = [(MUIMessageListViewController *)self state];
  v18 = [(MUIMessageListViewController *)self brandIndicatorProvider];
  v19 = [(MUIMessageListViewController *)self avatarGenerator];
  id v20 = [(MUIMessageListViewController *)self contactStore];
  v23 = [(MessageListSectionDataSourceConfiguration *)v14 initWithIdentifier:v10 section:v24 collectionView:v15 messageList:v25 layoutValuesHelper:v16 state:v17 delegate:self selectionModelProvider:self initialLoadCompletedPromise:v22 searchProgressView:0 headerType:v11 brandIndicatorProvider:v18 avatarGenerator:v19 contactStore:v20];

  return v23;
}

- (MessageListViewControllerState)state
{
  state = self->_state;
  if (!state)
  {
    v4 = objc_alloc_init(MessageListViewControllerState);
    id v5 = self->_state;
    self->_state = v4;

    state = self->_state;
  }
  return state;
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (void)updateState:(id)a3 withMailboxes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MUIMessageListViewController *)self senderSpecificMessageListItem];
  [v6 updateWithMailboxes:v7 senderSpecificMessageListItem:v8];

  if (_os_feature_enabled_impl())
  {
    int v9 = [v6 containsOutbox];
LABEL_7:
    uint64_t v10 = v9 ^ 1u;
    goto LABEL_8;
  }
  if (([v6 containsInbox] & 1) != 0
    || ([v6 containsReadLaterMailbox] & 1) != 0
    || [v6 containsSmartMailbox])
  {
    int v9 = [(MUIMessageListViewController *)self isSearchViewController];
    goto LABEL_7;
  }
  uint64_t v10 = 0;
LABEL_8:
  [v6 setCanShowReadLaterDate:v10];
  if ([v6 canShowReadLaterDate]) {
    uint64_t v11 = [v6 isCommerceMailbox] ^ 1;
  }
  else {
    uint64_t v11 = 0;
  }
  [v6 setCanShowReadLaterDate:v11];
  BOOL v12 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = objc_msgSend(v6, "ef_publicDescription");
    int v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "Updated state to %{public}@", (uint8_t *)&v14, 0xCu);
  }
}

- (BOOL)focusAllowed
{
  v3 = [(MUIMessageListViewController *)self currentFocus];
  if (v3)
  {
    v4 = [(MUIMessageListViewController *)self state];
    char v5 = [v4 containsSmartMailbox];
  }
  else
  {
    char v5 = 0;
  }

  id v6 = [(MUIMessageListViewController *)self senderSpecificMessageListItem];

  if (v6) {
    return 0;
  }
  else {
    return v5;
  }
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (EMMessageListItem)senderSpecificMessageListItem
{
  return self->_senderSpecificMessageListItem;
}

- (BOOL)isBucketBarHidden
{
  v3 = [(MUIMessageListViewController *)self bucketBarConfigurationController];

  if (!v3) {
    return 1;
  }
  v4 = [(MUIMessageListViewController *)self bucketBarConfigurationController];
  char v5 = [(MUIMessageListViewController *)self mailboxes];
  char v6 = [v4 isBucketBarHiddenForMailboxes:v5];

  return v6;
}

- (MSBucketBarConfigurationController)bucketBarConfigurationController
{
  return self->_bucketBarConfigurationController;
}

- (BOOL)shouldDisplayGroupedSenders
{
  if ([(MUIMessageListViewController *)self isBlackPearlEnabled])
  {
    v3 = [(MUIMessageListViewController *)self bucketBarConfigurationController];
    v4 = [(MUIMessageListViewController *)self mailboxes];
    if (([v3 isBucketBarHiddenForMailboxes:v4] & 1) != 0
      || !MUIBucketIsBusinessBucket([(MUIMessageListViewController *)self selectedBucket])
      || ([MEMORY[0x1E4F602E0] preferenceEnabled:43] & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      id v7 = [(MUIMessageListViewController *)self categoryGroupingPreferenceController];
      int v5 = objc_msgSend(v7, "shouldDisableGroupingForBucket:", -[MUIMessageListViewController selectedBucket](self, "selectedBucket")) ^ 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (int64_t)selectedBucket
{
  return self->_selectedBucket;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (BOOL)isBlackPearlEnabled
{
  return self->_isBlackPearlEnabled;
}

- (BOOL)hasUpdatedAllVisibleSections
{
  v3 = [(MUIMessageListViewController *)self dataSource];
  v4 = [v3 visibleMessageListSections];
  uint64_t v5 = [v4 count];
  char v6 = [(MUIMessageListViewController *)self configuredSections];
  LOBYTE(v5) = v5 == [v6 count];

  return v5;
}

- (MessageListDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [MessageListDataSource alloc];
    uint64_t v5 = [(MUIMessageListViewController *)self collectionView];
    char v6 = [(MessageListDataSource *)v4 initWithCollectionView:v5];

    [(MUIMessageListViewController *)self configureDelegatesForDataSource:v6];
    id v7 = self->_dataSource;
    self->_dataSource = v6;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (NSMutableSet)configuredSections
{
  return self->_configuredSections;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (uint64_t)_hasInitialLoadPromiseForSection:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (([v3 isEqualToString:@"MessageListSectionRecent"] & 1) != 0
      || ([v4 isEqualToString:@"MessageListSectionIndexedSearch"] & 1) != 0
      || ([v4 isEqualToString:@"MessageListSectionServerSearch"] & 1) != 0
      || ([v4 isEqualToString:@"MessageListSectionTopHits"] & 1) != 0
      || ([v4 isEqualToString:@"MessageListSectionInstantAnswers"] & 1) != 0)
    {
      a1 = 1;
    }
    else
    {
      a1 = [v4 isEqualToString:@"MessageListSectionGroupedSender"];
    }
  }

  return a1;
}

- (void)messageListDataSourcePrepareUpdate:(id)a3 section:(id)a4 cleanSnapshot:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(MUIMessageListViewController *)self messageListSelectionModel];
  [v7 setPerformingDataSourceUpdates:1];

  if (v5)
  {
    id v8 = [(MUIMessageListViewController *)self messageListPositionHelper];
    [v8 reset];
  }
}

- (MessageListPositionHelper)messageListPositionHelper
{
  return self->_messageListPositionHelper;
}

- (MessageListSelectionModel)messageListSelectionModel
{
  return self->_messageListSelectionModel;
}

- (void)setSelectedBucket:(int64_t)a3
{
  if (self->_selectedBucket != a3)
  {
    self->_selectedBucket = a3;
    [(MUIMessageListViewController *)self _updateViewPrimaryWithNoOnboardingIfNeeded];
    id v5 = [MEMORY[0x1E4F28EA0] notificationWithName:@"SelectedBucketDidChangeNotification" object:self userInfo:0];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotification:v5];
  }
}

- (void)messageListSectionDataSource:(id)a3 didAddMessagesWithItemIdentifiers:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(MUIMessageListViewController *)self initialScrollItemID];
  if ([v6 containsObject:v7])
  {
    [(MUIMessageListViewController *)self setInitialScrollItemID:0];
    id v8 = [(MUIMessageListViewController *)self dataSource];
    int v9 = [v8 indexPathForItemIdentifier:v7];

    uint64_t v10 = [(MUIMessageListViewController *)self collectionView];
    objc_msgSend(v10, "mui_scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 1, 0);
  }
  uint64_t v11 = [(MUIMessageListViewController *)self state];
  if (([v11 containsDraftsOrOutbox] & 1) == 0) {
    goto LABEL_9;
  }
  BOOL v12 = [(MUIMessageListViewController *)self referenceMessageListItem];

  if (v12 && [v6 count] == 1)
  {
    uint64_t v11 = [v6 firstObject];
    int v13 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = NSStringFromSelector(a2);
      int v21 = 138543618;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1DDCDB000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Set reference message list item for first item from drafts or outbox: %{public}@", (uint8_t *)&v21, 0x16u);
    }
    v15 = [(MUIMessageListViewController *)self dataSource];
    uint64_t v16 = [v15 messageListItemForItemID:v11];
    BOOL v17 = [v16 result];

    v18 = [(MUIMessageListViewController *)self dataSource];
    v19 = [v17 itemID];
    id v20 = [v18 messageListForMessageListItemWithIdentifier:v19];

    [(MUIMessageListViewController *)self setReferenceMessageListItem:v17 referenceMessageList:v20 showAsConversation:0 animated:1];
LABEL_9:
  }
}

- (EMCollectionItemID)initialScrollItemID
{
  return self->_initialScrollItemID;
}

- (void)messageListDataSource:(id)a3 willUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6 cleanSnapshot:(BOOL)a7
{
  id v10 = a5;
  if (+[MessageListSectionDataSource isValidChange:a4]
    && !a6)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    id v13 = v10;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v12, 3221225472, __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke, &unk_1E6D11A50, self);
    [v11 performBlock:&v12];
  }
}

- (void)setMessageListSelectionModel:(id)a3
{
}

- (void)configureDelegatesForDataSource:(id)a3
{
  id v4 = a3;
  [v4 setProvider:self];
  [v4 setDelegate:self];
}

- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3
{
  self->_didNotifyExtendedLaunchTracker = a3;
}

- (BOOL)messageListDataSource:(id)a3 shouldAnimateNextUpdateInSectionDataSource:(id)a4 change:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([(MUIMessageListViewController *)self didNotifyExtendedLaunchTracker])
  {
    id v7 = [(MUIMessageListViewController *)self messageToDisplayOnReload];
    BOOL v8 = v7 == 0;
  }
  else
  {
    int v9 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = +[MessageListSectionDataSource publicDescriptionForChange:v6];
      int v14 = 138412802;
      v15 = v11;
      __int16 v16 = 2048;
      BOOL v17 = self;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Launch] Skip animation for message list change: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (EMMessage)messageToDisplayOnReload
{
  return self->_messageToDisplayOnReload;
}

- (BOOL)didNotifyExtendedLaunchTracker
{
  return self->_didNotifyExtendedLaunchTracker;
}

- (void)setThreaded:(BOOL)a3
{
  if (self->_threaded != a3)
  {
    self->_threaded = a3;
    id v4 = [(MUIMessageListViewController *)self viewIfLoaded];

    if (v4)
    {
      [(MUIMessageListViewController *)self reloadDataSource];
    }
  }
}

uint64_t __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __58__MUIMessageListViewController_createMessageListForReload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCoreSpotlightMailbox];
}

- (void)reloadDataSourceWithMessageList:(id)a3
{
}

- (BOOL)_shouldDisplayOnboardingTip
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (EMBlackPearlIsFeatureEnabled()
    && ![(MUIMessageListViewController *)self isBucketBarHidden])
  {
    uint64_t v5 = [(MUIMessageListViewController *)self selectedBucket];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    id v7 = MUIOnboardingTipKeyForBucket(v5);
    if (v7)
    {
      uint64_t v8 = [v6 integerForKey:v7];
      if (!v8)
      {
        BOOL v4 = 1;
LABEL_13:

        return v4;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
    BOOL v4 = 0;
    if (v5 == 1 && v8 == 1)
    {
      uint64_t v9 = [v6 integerForKey:*MEMORY[0x1E4F601B8]];
      BOOL v4 = v9 > 2;
      id v10 = _ef_log_MUIMessageListViewController();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = NSStringFromSelector(a2);
        int v13 = 138543618;
        int v14 = v11;
        __int16 v15 = 1024;
        BOOL v16 = v9 > 2;
        _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_INFO, "%{public}@ diplaySecondTip:%{BOOL}d", (uint8_t *)&v13, 0x12u);
      }
    }
    goto LABEL_13;
  }
  return 0;
}

- (id)_predicateForFiltersEnabled:(void *)a1
{
  if (a1)
  {
    if (a2)
    {
      id v3 = [a1 filterViewModel];
      BOOL v4 = [v3 predicateForSelectedFilters];
    }
    else
    {
      BOOL v4 = 0;
    }
    uint64_t v5 = [a1 updatedPredicateForFocusedAccounts:v4];

    id v6 = [a1 _updatedPredicateForReadLater:v5];

    if (([a1 isBucketBarHidden] & 1) == 0)
    {
      uint64_t v7 = [a1 _updatedPredicateForSelectedBucket:v6];

      id v6 = (void *)v7;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)updatedPredicateForFocusedAccounts:(id)a3
{
  id v4 = a3;
  if ([(MUIMessageListViewController *)self isFocusFilterEnabled]
    && [(MUIMessageListViewController *)self focusAllowed])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F60290];
    id v6 = [(MUIMessageListViewController *)self currentFocus];
    uint64_t v7 = [(MUIMessageListViewController *)self accountRepository];
    id v8 = [v5 updatedPredicateForFocus:v6 currentPredicate:v4 usingAccountRepository:v7];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (BOOL)isFocusFilterEnabled
{
  return self->_focusFilterEnabled;
}

- (id)_updatedPredicateForSelectedBucket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSPredicateFromBucket([(MUIMessageListViewController *)self selectedBucket]);
  id v6 = objc_msgSend(MEMORY[0x1E4F28BA0], "ef_andCompoundPredicateForOptionalPredicate:second:", v4, v5);

  return v6;
}

- (id)_updatedPredicateForReadLater:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)refreshHighlightedMessagesController
{
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    id v5 = [(MUIMessageListViewController *)self highlightedMessagesController];
    if (_os_feature_enabled_impl()
      && EMIsGreymatterAvailableWithOverride()
      && ![(MUIMessageListViewController *)self isFilterButtonEnabled]
      && MUIBucketAllowsPriorityMessageDisplay([(MUIMessageListViewController *)self selectedBucket]))
    {
      id v3 = [(MUIMessageListViewController *)self mailboxes];
      [v5 setMailboxes:v3];

      id v4 = [(MUIMessageListViewController *)self currentFilterPredicate];
      [v5 setFilterPredicate:v4];

      [v5 reloadApplyingEmptyUpdate:0];
    }
    else
    {
      [v5 setMailboxes:MEMORY[0x1E4F1CBF0]];
      [v5 setFilterPredicate:0];
    }
  }
}

- (MUIHighlightedMessagesController)highlightedMessagesController
{
  return self->_highlightedMessagesController;
}

- (void)setUnseenPredicate:(id)a3
{
}

- (id)messageListDataSource:(id)a3 sectionDataSourceForSection:(id)a4 objectID:(id)a5 messageList:(id)a6
{
  id v9 = a4;
  id v10 = [(MUIMessageListViewController *)self sectionDataSourceConfigurationWithIdentifier:a5 section:v9 messageList:a6];
  if ([v9 isEqualToString:@"MessageListSectionPriority"])
  {
    uint64_t v11 = MUIMessageListPrioritySectionDataSource;
LABEL_6:
    uint64_t v12 = (MUIMessageListOnboardingTipDataSource *)[[v11 alloc] initWithConfiguration:v10];
LABEL_7:
    int v13 = (MUIMessageListBucketBarSectionDataSource *)v12;
    goto LABEL_8;
  }
  if (([v9 isEqualToString:@"MessageListSectionRecent"] & 1) != 0
    || [v9 isEqualToString:@"MessageListSectionRecentUnseen"])
  {
    uint64_t v11 = MessageListRecentSectionDataSource;
    goto LABEL_6;
  }
  if (([v9 isEqualToString:@"MessageListSectionGroupedSenderUnseen"] & 1) != 0
    || [v9 isEqualToString:@"MessageListSectionGroupedSender"])
  {
    uint64_t v11 = MUIMessageListGroupedSenderSectionDataSource;
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"MessageListSectionHelpMailLearn"])
  {
    uint64_t v11 = MUIMessageListHelpMailLearnSectionDataSource;
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"MessageListSectionOnboardingTip"])
  {
    uint64_t v12 = [[MUIMessageListOnboardingTipDataSource alloc] initWithConfiguration:v10 bucket:[(MUIMessageListViewController *)self selectedBucket]];
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"MessageListSectionBucketBar"])
  {
    __int16 v15 = [(MUIMessageListViewController *)self mailboxes];
    BOOL v16 = [(MUIMessageListViewController *)self _configuredBucketsViewControllerWithMailboxes:v15];

    uint64_t v17 = [v16 parentViewController];

    if (!v17) {
      [(MUIMessageListViewController *)self addChildViewController:v16];
    }
    int v13 = [[MUIMessageListBucketBarSectionDataSource alloc] initWithConfiguration:v10 bucketsViewController:v16];
  }
  else
  {
    int v13 = 0;
  }
LABEL_8:

  return v13;
}

- (void)reloadDataSourceWithMessageList:(id)a3 applyEmptySnapshot:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (pthread_main_np() != 1)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2 object:self file:@"MUIMessageListViewController.m" lineNumber:764 description:@"Current thread must be main"];
  }
  id v8 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = objc_msgSend(v7, "ef_publicDescription");
    *(_DWORD *)buf = 138412802;
    v51 = v10;
    __int16 v52 = 2048;
    v53 = self;
    __int16 v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> Reloading messageList:%@", buf, 0x20u);
  }
  uint64_t v12 = [(MUIMessageListViewController *)self configuredSections];
  [v12 removeAllObjects];

  [(MUIMessageListViewController *)self setIndexPathsForToBeConfiguredCells:0];
  int v13 = [(MUIMessageListViewController *)self indexPathsForConfiguredCollectionViewCells];
  [v13 removeAllObjects];

  [(MUIMessageListViewController *)self setFirstBatchCellConfigurationCompleted:0];
  int v14 = MFMessageListLoadingSignpostLog();
  __int16 v15 = [v7 objectID];
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v14, v15);

  uint64_t v17 = MFMessageListLoadingSignpostLog();
  __int16 v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "MessageListLoading", "Begin loading message list enableTelemetry=YES ", buf, 2u);
  }

  [(MUIMessageListViewController *)self cancelQueueSuspensionTimeout];
  v19 = [(MUIMessageListViewController *)self mailboxes];
  uint64_t v20 = objc_msgSend(v19, "ef_all:", &__block_literal_global_85);
  int v21 = [(MUIMessageListViewController *)self state];
  [v21 setShouldDisplayUnreadAndVIP:v20];

  [(MUIMessageListViewController *)self setSwipeActionVisible:0];
  if (v7)
  {
    v22 = [(MUIMessageListViewController *)self initialLoadCompletedPromise];
    [v22 finishWithResult:MEMORY[0x1E4F1CC28]];

    __int16 v23 = [MEMORY[0x1E4F60E18] promise];
    [(MUIMessageListViewController *)self setInitialLoadCompletedPromise:v23];

    v24 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    if (_os_feature_enabled_impl()
      && EMIsGreymatterAvailableWithOverride()
      && MUIBucketAllowsPriorityMessageDisplay([(MUIMessageListViewController *)self selectedBucket]))
    {
      v26 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionPriority" messageList:v7];
      [v24 addObject:v26];
    }
    else
    {
      [v25 addObject:@"MessageListSectionPriority"];
    }
    v27 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionRecent" messageList:v7];
    [v24 addObject:v27];

    if ([(MUIMessageListViewController *)self shouldDisplayGroupedSenders])
    {
      v28 = (void *)MEMORY[0x1E4F1CA48];
      v29 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionGroupedSenderUnseen" messageList:v7];
      v30 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionGroupedSender" messageList:v7];
      uint64_t v31 = objc_msgSend(v28, "arrayWithObjects:", v29, v30, 0);

      v49[0] = @"MessageListSectionRecentUnseen";
      v49[1] = @"MessageListSectionRecent";
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      [v25 addObjectsFromArray:v32];
      v24 = (void *)v31;
    }
    else
    {
      v48[0] = @"MessageListSectionGroupedSenderUnseen";
      v48[1] = @"MessageListSectionGroupedSender";
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
      [v25 addObjectsFromArray:v33];

      if (![(MUIMessageListViewController *)self isBlackPearlEnabled]) {
        goto LABEL_19;
      }
      v32 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionRecentUnseen" messageList:v7];
      [v24 insertObject:v32 atIndex:1];
    }

LABEL_19:
    v34 = [MEMORY[0x1E4F60D58] currentDevice];
    int v35 = [v34 isInternal];

    if (v35)
    {
      if ([(MUIMessageListViewController *)self _shouldDisplayHelpMailLearn])
      {
        v36 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionHelpMailLearn"];
        [v24 insertObject:v36 atIndex:0];
      }
      else
      {
        [v25 insertObject:@"MessageListSectionHelpMailLearn" atIndex:0];
      }
    }
    if ([(MUIMessageListViewController *)self _shouldDisplayOnboardingTip])
    {
      v37 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionOnboardingTip"];
      [v24 insertObject:v37 atIndex:0];
    }
    else
    {
      [v25 insertObject:@"MessageListSectionOnboardingTip" atIndex:0];
    }
    if (EMBlackPearlIsFeatureEnabled())
    {
      if ([(MUIMessageListViewController *)self isBucketBarHidden])
      {
        [v25 addObject:@"MessageListSectionBucketBar"];
      }
      else
      {
        v38 = [(MUIMessageListViewController *)self dataSource];
        char v39 = [v38 messageListSectionIsVisible:@"MessageListSectionBucketBar"];

        if (v39)
        {
          int v40 = 1;
LABEL_33:
          v42 = [[MessageListDataSourceUpdateRequest alloc] initWithSectionUpdates:v24 sectionsToRemove:v25 startsWithEmptySnapshot:v4];
          v43 = [(MUIMessageListViewController *)self dataSource];
          [v43 applyMessageListDataSourceUpdate:v42];

          if (v40)
          {
            v44 = [(MUIMessageListViewController *)self bucketsViewController];
            v45 = [(MUIMessageListViewController *)self mailboxes];
            [v44 updateWithMailboxes:v45];
          }
          v46 = [(MUIMessageListViewController *)self messageListFetchHelper];
          [v46 fetchMailboxesIsUserInitiated:0];

          goto LABEL_36;
        }
        v41 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:@"MessageListSectionBucketBar" messageList:0 shouldClearSnapshot:0];
        [v24 insertObject:v41 atIndex:0];
      }
    }
    int v40 = 0;
    goto LABEL_33;
  }
LABEL_36:
}

- (NSMutableSet)indexPathsForConfiguredCollectionViewCells
{
  return self->_indexPathsForConfiguredCollectionViewCells;
}

- (void)setIndexPathsForToBeConfiguredCells:(id)a3
{
}

- (MessageListFetchHelper)messageListFetchHelper
{
  return self->_messageListFetchHelper;
}

- (void)_resetMailboxRepositoryForMailboxes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 repository];

        if (!v10)
        {
          uint64_t v11 = [(MUIMessageListViewController *)self mailboxRepository];
          [v9 setRepository:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)setFirstBatchCellConfigurationCompleted:(BOOL)a3
{
  self->_firstBatchCellConfigurationCompleted = a3;
}

- (EFPromise)initialLoadCompletedPromise
{
  return self->_initialLoadCompletedPromise;
}

- (void)cancelQueueSuspensionTimeout
{
  p_queueSuspensionTimeoutTokenLock = &self->_queueSuspensionTimeoutTokenLock;
  os_unfair_lock_lock(&self->_queueSuspensionTimeoutTokenLock);
  if (self->_queueSuspensionTimeoutToken)
  {
    id v4 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "[Launch] Cancel queue timeout", v6, 2u);
    }

    [(EFCancelable *)self->_queueSuspensionTimeoutToken cancel];
    queueSuspensionTimeoutToken = self->_queueSuspensionTimeoutToken;
    self->_queueSuspensionTimeoutToken = 0;
  }
  os_unfair_lock_unlock(p_queueSuspensionTimeoutTokenLock);
}

- (void)setShouldIgnoreCommercePredicateToken:(id)a3
{
}

- (void)setShouldIgnoreCommercePredicate:(BOOL)a3
{
  self->_shouldIgnoreCommercePredicate = a3;
}

- (void)setInitialLoadCompletedPromise:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
  uint64_t v5 = (UICollectionView *)a3;
  p_collectionView = &self->_collectionView;
  if (self->_collectionView != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_collectionView, a3);
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    uint64_t v5 = v8;
  }
  MEMORY[0x1F41817F8](p_collectionView, v5);
}

- (id)createMessageListForReload
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = [(MUIMessageListViewController *)self mailboxes];
  if (![v3 count])
  {
    v19 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MUIMessageListViewController createMessageListForReload](v19);
    }
    goto LABEL_14;
  }
  id v4 = [(MUIMessageListViewController *)self messageRepository];

  if (!v4)
  {
    v19 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MUIMessageListViewController createMessageListForReload](v19);
    }
LABEL_14:
    uint64_t v20 = 0;
    goto LABEL_42;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F60DC0]);
  BOOL v6 = [(MUIMessageListViewController *)self shouldDisplayGroupedSenders];
  uint64_t v7 = [(MUIMessageListViewController *)self unseenPredicate];

  if (v7)
  {
    id v8 = [(MUIMessageListViewController *)self unseenPredicate];
    id v9 = MessageListSectionGroupedSenderUnseen;
    if (!v6) {
      id v9 = MessageListSectionRecentUnseen;
    }
    [v5 setOrAddObject:v8 forKey:*v9];
  }
  if (v6)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v11 = [v10 preferredGroupedSenderGrouping];

    long long v12 = (void *)MEMORY[0x1E4F60380];
    long long v13 = [(MUIMessageListViewController *)self messageRepository];
    long long v14 = [v12 groupedCommerceSenderMessageListForMailboxes:v3 withRepository:v13 grouping:v11 sectionPredicates:v5 countOfItemsToPrecache:16];

    long long v15 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      __int16 v18 = [v14 query];
      *(_DWORD *)buf = 138412802;
      __int16 v54 = v17;
      __int16 v55 = 2048;
      uint64_t v56 = self;
      __int16 v57 = 2112;
      v58 = v18;
      _os_log_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_DEFAULT, "<%@: %p> Created new grouped sender message list for mailboxes with query %@", buf, 0x20u);
    }
    goto LABEL_34;
  }
  long long v15 = [(MUIMessageListViewController *)self state];
  int v21 = [v15 containsInbox];
  char v22 = [v15 containsSent];
  int v23 = 0;
  if ((v22 & 1) == 0 && v21) {
    int v23 = ![(MUIMessageListViewController *)self shouldHideFollowUp];
  }
  unsigned int v51 = v23;
  if (v21) {
    uint64_t v24 = _os_feature_enabled_impl();
  }
  else {
    uint64_t v24 = 0;
  }
  id v52 = v5;
  if (objc_msgSend(v3, "ef_any:", &__block_literal_global_80)) {
    uint64_t v25 = 32;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = v25 | [v15 isSearch] ^ 1;
  if ([v15 containsInbox]
    && [(MUIMessageListViewController *)self isThreaded])
  {
    v26 |= 0x1000uLL;
  }
  v27 = (void *)MEMORY[0x1E4F60390];
  v28 = [(MUIMessageListViewController *)self mailboxRepository];
  v29 = [(MUIMessageListViewController *)self senderSpecificMessageListItem];
  v30 = [v29 senderList];
  uint64_t v31 = [v30 firstObject];
  v32 = [v27 transformPredicateWithMailboxes:v3 mailboxTypeResolver:v28 shouldIncludeFollowUps:v51 shouldIncludeReadLater:v24 limitToSender:v31];

  v33 = [v15 sortDescriptors];
  LODWORD(v30) = [(MUIMessageListViewController *)self isThreaded];
  v34 = (void *)MEMORY[0x1E4F60380];
  int v35 = [(MUIMessageListViewController *)self messageRepository];
  if (v30)
  {
    LOBYTE(v50) = 0;
    id v5 = v52;
    long long v14 = [v34 threadedMessageListForMailboxes:v3 withRepository:v35 additionalQueryOptions:v26 countOfItemsToPrecache:16 shouldUpdateDisplayDate:1 sortDescriptors:v33 sectionPredicates:v52 transformPredicate:v32 ignoreMessageAdditionsPredicate:0 shouldShowBundle:v50];

    v36 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      [v14 query];
      v40 = char v39 = v33;
      *(_DWORD *)buf = 138412802;
      __int16 v54 = v38;
      __int16 v55 = 2048;
      uint64_t v56 = self;
      __int16 v57 = 2112;
      v58 = v40;
      v41 = "<%@: %p> Created new threaded list for mailboxes with query %@";
LABEL_32:
      _os_log_impl(&dword_1DDCDB000, v36, OS_LOG_TYPE_DEFAULT, v41, buf, 0x20u);

      v33 = v39;
    }
  }
  else
  {
    LOBYTE(v49) = 0;
    long long v14 = [v34 simpleMessageListForMailboxes:v3 withRepository:v35 additionalQueryOptions:v26 countOfItemsToPrecache:16 shouldUpdateDisplayDate:1 sortDescriptors:v33 transformPredicate:v32 ignoreMessageAdditionsPredicate:0 shouldShowBundle:v49];

    v36 = _ef_log_MUIMessageListViewController();
    id v5 = v52;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v42);
      [v14 query];
      v40 = char v39 = v33;
      *(_DWORD *)buf = 138412802;
      __int16 v54 = v38;
      __int16 v55 = 2048;
      uint64_t v56 = self;
      __int16 v57 = 2112;
      v58 = v40;
      v41 = "<%@: %p> Created new non-threaded list for mailboxes with query %@";
      goto LABEL_32;
    }
  }

LABEL_34:
  v43 = [(MUIMessageListViewController *)self filterViewModel];
  int v44 = [v43 isFilterEnabled];

  if (v44) {
    uint64_t v45 = [(MUIMessageListViewController *)self shouldDisplayGroupedSenders] ^ 1;
  }
  else {
    uint64_t v45 = 0;
  }
  v46 = -[MUIMessageListViewController _predicateForFiltersEnabled:](self, v45);
  if (-[MUIMessageListViewController _shouldApplyFilterPredicate:](self, v46))
  {
    [(MUIMessageListViewController *)self setCurrentFilterPredicate:v46];
    [(MUIMessageListViewController *)self refreshHighlightedMessagesController];
  }
  if (v46)
  {
    uint64_t v47 = [v14 filteredMessageListWithPredicate:v46 ignoredMessagesPredicate:0 userFiltered:v45];

    long long v14 = (void *)v47;
  }
  v19 = v14;

  uint64_t v20 = v19;
LABEL_42:

  return v20;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (BOOL)isThreaded
{
  return self->_threaded;
}

- (void)updateFilterContextForMailboxes:(id)a3 focus:(id)a4 applyFilters:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = +[MUIMailboxFilterContext contextWithMailboxes:v9 focus:v8 isFilteringAvailable:[(MUIMessageListViewController *)self shouldDisplayGroupedSenders] ^ 1];

  id v10 = [(MUIMessageListViewController *)self filterController];
  [v10 updateWithFilterContext:v12];

  uint64_t v11 = [(MUIMessageListViewController *)self filterViewModel];
  -[MUIMessageListViewController setFilterButtonEnabled:](self, "setFilterButtonEnabled:", [v11 isFilterEnabled]);
  [(MUIMessageListViewController *)self updateFilterControlWithFilterViewModel:v11];
  if (v5) {
    [(MUIMessageListViewController *)self updateFilters];
  }
}

- (MUIMailboxFilterViewModel)filterViewModel
{
  v2 = [(MUIMessageListViewController *)self filterController];
  id v3 = [v2 viewModel];

  return (MUIMailboxFilterViewModel *)v3;
}

- (MUIMailboxFilterController)filterController
{
  filterController = self->_filterController;
  if (!filterController)
  {
    BOOL v5 = [(MUIMessageListViewController *)self createMailboxFilterController];
    BOOL v6 = self->_filterController;
    self->_filterController = v5;

    filterController = self->_filterController;
    if (!filterController)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"MUIMessageListViewController.m" lineNumber:476 description:@"createMailboxFilterController did not return a valid instance"];

      filterController = self->_filterController;
    }
  }
  return filterController;
}

- (NSPredicate)unseenPredicate
{
  return self->_unseenPredicate;
}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (void)setCurrentFilterPredicate:(id)a3
{
}

- (BOOL)swipeActionVisible
{
  return self->_swipeActionVisible;
}

- (NSDictionary)oldestItemsIDsByMailboxObjectID
{
  return self->_oldestItemsIDsByMailboxObjectID;
}

- (void)setSenderSpecificMessageListItem:(id)a3
{
}

- (void)setMessageListPositionHelper:(id)a3
{
}

- (void)setLastSelectedMessageListItems:(id)a3
{
}

- (void)_shouldApplyFilterPredicate:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = [v2 currentFilterPredicate];
    int v5 = EFObjectsAreEqual();

    v2 = (void *)(v5 ^ 1u);
  }
  return v2;
}

- (NSPredicate)currentFilterPredicate
{
  return self->_currentFilterPredicate;
}

- (void)reloadFromMailboxes
{
  [(MUIMessageListViewController *)self setPrimitiveFocusFilterEnabled:1];
  id v3 = [(MUIMessageListViewController *)self mailboxes];
  id v4 = [(MUIMessageListViewController *)self currentFocus];
  [(MUIMessageListViewController *)self updateFilterContextForMailboxes:v3 focus:v4 applyFilters:0];

  [(MUIMessageListViewController *)self reloadDataSource];
}

- (void)setPrimitiveFocusFilterEnabled:(BOOL)a3
{
  self->_focusFilterEnabled = a3;
}

- (void)setInitialCellConfigurationCompleted:(BOOL)a3
{
  if (self->_initialCellConfigurationCompleted != a3)
  {
    self->_initialCellConfigurationCompleted = a3;
    [(MUIMessageListViewController *)self didFinishLoadViewController];
  }
}

- (void)setPrimitiveMailboxes:(id)a3
{
  if (self->_mailboxes != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    mailboxes = self->_mailboxes;
    self->_mailboxes = v4;

    id v6 = [(MUIMessageListViewController *)self state];
    [v6 setDidAlertOnBlankCell:0];
    [v6 setDidRecordTailspin:0];
    [(MUIMessageListViewController *)self _resetMailboxRepositoryForMailboxes:self->_mailboxes];
    [(MUIMessageListViewController *)self updateState:v6 withMailboxes:self->_mailboxes];
    [(MUIMessageListViewController *)self refreshHighlightedMessagesController];
  }
}

uint64_t ___ef_log_MUIMessageListViewController_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MUIMessageListViewController");
  uint64_t v1 = _ef_log_MUIMessageListViewController_log;
  _ef_log_MUIMessageListViewController_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

BOOL __83__MUIMessageListViewController_reloadDataSourceWithMessageList_applyEmptySnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] != 6 && objc_msgSend(v2, "type") != 5;

  return v3;
}

- (MUIMessageListViewController)initWithDaemonInterface:(id)a3 focusController:(id)a4 mailboxCategoryCloudStorage:(id)a5 avatarGenerator:(id)a6 bucketBarConfigurationController:(id)a7 brandIndicatorProvider:(id)a8 mailboxes:(id)a9 contactStore:(id)a10 diagnosticsHelper:(id)a11
{
  id v17 = a3;
  id v78 = a4;
  id v18 = a4;
  v19 = v17;
  id v20 = a8;
  id v86 = v18;
  id v85 = a5;
  id v84 = a6;
  id v83 = a7;
  id v82 = a8;
  id v21 = a9;
  id v81 = a10;
  id v80 = a11;
  v97.receiver = self;
  v97.super_class = (Class)MUIMessageListViewController;
  char v22 = [(MUIMessageListViewController *)&v97 initWithNibName:0 bundle:0];
  if (v22)
  {
    id v77 = v21;
    uint64_t v23 = [v21 copy];
    mailboxes = v22->_mailboxes;
    v22->_mailboxes = (NSArray *)v23;

    objc_storeStrong((id *)&v22->_contactStore, a10);
    uint64_t v25 = objc_alloc_init(MessageListViewControllerState);
    state = v22->_state;
    v22->_state = v25;

    v27 = [[MessageSelectionStrategy alloc] initWithDataSource:v22];
    messageSelectionStrategy = v22->_messageSelectionStrategy;
    v22->_messageSelectionStrategy = v27;

    [(MUIMessageListViewController *)v22 updateState:v22->_state withMailboxes:v22->_mailboxes];
    objc_storeStrong((id *)&v22->_daemonInterface, a3);
    uint64_t v29 = [v19 messageRepository];
    messageRepository = v22->_messageRepository;
    v22->_messageRepository = (EMMessageRepository *)v29;

    uint64_t v31 = [v19 mailboxRepository];
    mailboxRepository = v22->_mailboxRepository;
    v22->_mailboxRepository = (EMMailboxRepository *)v31;

    uint64_t v33 = [v19 accountRepository];
    accountRepository = v22->_accountRepository;
    v22->_accountRepository = (EMAccountRepository *)v33;

    objc_storeStrong((id *)&v22->_diagnosticsHelper, a11);
    uint64_t v35 = [(EMDiagnosticsHelper *)v22->_diagnosticsHelper registerDiagnosticFileProvider:v22];
    diagnosticsHelperToken = v22->_diagnosticsHelperToken;
    v22->_diagnosticsHelperToken = (EFCancelable *)v35;

    v37 = [MessageListFetchHelper alloc];
    v38 = [v19 fetchController];
    uint64_t v39 = [(MessageListFetchHelper *)v37 initWithFetchController:v38 mailboxes:0];
    messageListFetchHelper = v22->_messageListFetchHelper;
    v22->_messageListFetchHelper = (MessageListFetchHelper *)v39;

    v41 = objc_alloc_init(MessageListCellLayoutValuesHelper);
    layoutValuesHelper = v22->_layoutValuesHelper;
    v22->_layoutValuesHelper = v41;

    uint64_t v43 = [MEMORY[0x1E4F60E18] promise];
    initialLoadCompletedPromise = v22->_initialLoadCompletedPromise;
    v22->_initialLoadCompletedPromise = (EFPromise *)v43;

    uint64_t v45 = [MEMORY[0x1E4F1CA80] set];
    mailboxesPendingOldestItemsUpdates = v22->_mailboxesPendingOldestItemsUpdates;
    v22->_mailboxesPendingOldestItemsUpdates = (NSMutableSet *)v45;

    v22->_queueSuspensionTimeoutTokenLock._os_unfair_lock_opaque = 0;
    uint64_t v47 = objc_alloc_init(MessageListCellsController);
    cellsController = v22->_cellsController;
    v22->_cellsController = v47;

    uint64_t v49 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    configuredSections = v22->_configuredSections;
    v22->_configuredSections = v49;

    unsigned int v51 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    indexPathsForConfiguredCollectionViewCells = v22->_indexPathsForConfiguredCollectionViewCells;
    v22->_indexPathsForConfiguredCollectionViewCells = v51;

    objc_storeStrong((id *)&v22->_avatarGenerator, a6);
    v22->_isBlackPearlEnabled = EMBlackPearlIsFeatureEnabled();
    objc_storeStrong((id *)&v22->_bucketBarConfigurationController, a7);
    objc_storeStrong((id *)&v22->_mailboxCategoryCloudStorage, a5);
    objc_storeStrong((id *)&v22->_brandIndicatorProvider, v20);
    if ([(MUIMessageListViewController *)v22 isBlackPearlEnabled]
      && ![(MUIMessageListViewController *)v22 isSearchViewController])
    {
      -[MUIMessageListViewController setShouldIgnoreCommercePredicate:](v22, "setShouldIgnoreCommercePredicate:", [MEMORY[0x1E4F602E0] preferenceEnabled:41]);
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v22);
      v53 = (void *)MEMORY[0x1E4F602E0];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke;
      v94[3] = &unk_1E6D11E40;
      objc_copyWeak(&v95, &location);
      __int16 v54 = [v53 observeChangesForPreference:41 autoCancelToken:1 usingBlock:v94];
      [(MUIMessageListViewController *)v22 setShouldIgnoreCommercePredicateToken:v54];

      [(MSBucketBarConfigurationController *)v22->_bucketBarConfigurationController addConfigurationObserver:v22];
      objc_destroyWeak(&v95);
      objc_destroyWeak(&location);
    }
    __int16 v55 = [[MUICategoryGroupingPreferenceController alloc] initWithDelegate:v22];
    categoryGroupingPreferenceController = v22->_categoryGroupingPreferenceController;
    v22->_categoryGroupingPreferenceController = v55;

    __int16 v57 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v58 = *MEMORY[0x1E4F600F0];
    -[MUIMessageListViewController setHideFollowUp:](v22, "setHideFollowUp:", [v57 BOOLForKey:*MEMORY[0x1E4F600F0]]);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v22);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_3;
    v91[3] = &unk_1E6D11C98;
    objc_copyWeak(&v93, &location);
    id v59 = v57;
    id v92 = v59;
    uint64_t v60 = objc_msgSend(v59, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v58, 1, 1, v91);
    userDefaultsObserver = v22->_userDefaultsObserver;
    v22->_userDefaultsObserver = (EFCancelable *)v60;

    [(MUIMessageListViewController *)v22 _resetMailboxRepositoryForMailboxes:v21];
    objc_storeStrong((id *)&v22->_focusController, v78);
    uint64_t v62 = [v86 addObserver:v22 currentFocus:&v22->_currentFocus];
    focusObservationToken = v22->_focusObservationToken;
    v22->_focusObservationToken = (EFCancelable *)v62;

    if (_os_feature_enabled_impl()
      && EMIsGreymatterSupportedWithOverride()
      && ![(MUIMessageListViewController *)v22 isSearchViewController])
    {
      v64 = [[MUIHighlightedMessagesController alloc] initWithRepository:v22->_messageRepository delegate:v22];
      highlightedMessagesController = v22->_highlightedMessagesController;
      v22->_highlightedMessagesController = v64;

      [(MUIHighlightedMessagesController *)v22->_highlightedMessagesController setMailboxes:v21];
      v66 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
      id v67 = objc_alloc(MEMORY[0x1E4F603F8]);
      uint64_t v68 = *MEMORY[0x1E4F60190];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_4;
      v89[3] = &unk_1E6D116E0;
      objc_copyWeak(&v90, &location);
      uint64_t v69 = [v67 initWithUserDefaults:v66 keyPath:v68 keyRepresentsDisabled:1 handler:v89];
      showHighlights = v22->_showHighlights;
      v22->_showHighlights = (EMNSUserDefaultsBoolObserver *)v69;

      id v71 = objc_alloc(MEMORY[0x1E4F603F8]);
      uint64_t v72 = *MEMORY[0x1E4F60108];
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_5;
      v87[3] = &unk_1E6D116E0;
      objc_copyWeak(&v88, &location);
      uint64_t v73 = [v71 initWithUserDefaults:v66 keyPath:v72 keyRepresentsDisabled:0 handler:v87];
      hasCompletedAppleIntelligenceOnboarding = v22->_hasCompletedAppleIntelligenceOnboarding;
      v22->_hasCompletedAppleIntelligenceOnboarding = (EMNSUserDefaultsBoolObserver *)v73;

      v75 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v75 addObserver:v22 selector:sel__generativeModelsAvailabilityDidChange_ name:*MEMORY[0x1E4F5FCF0] object:0];

      objc_destroyWeak(&v88);
      objc_destroyWeak(&v90);

      id v21 = v77;
    }

    objc_destroyWeak(&v93);
    objc_destroyWeak(&location);
  }
  return v22;
}

void __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_2;
  v9[3] = &unk_1E6D13210;
  id v10 = WeakRetained;
  char v11 = a3;
  int v5 = v9;
  id v6 = (void *)MEMORY[0x1E4F60F28];
  id v7 = WeakRetained;
  id v8 = [v6 mainThreadScheduler];
  [v8 performBlock:v5];
}

uint64_t __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldIgnoreCommercePredicate:*(unsigned __int8 *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 reloadDataSource];
}

void __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setHideFollowUp:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E4F600F0]));
    [WeakRetained reloadDataSource];
  }
}

void __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateHighlightsVisibility];
    id WeakRetained = v2;
  }
}

void __213__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxCategoryCloudStorage_avatarGenerator_bucketBarConfigurationController_brandIndicatorProvider_mailboxes_contactStore_diagnosticsHelper___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateHighlightsVisibility];
    [v2 updateHighlightsToggleVisibility];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(MSBucketBarConfigurationController *)self->_bucketBarConfigurationController removeConfigurationObserver:self];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(MUIMessageListViewController *)self diagnosticsHelperToken];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)MUIMessageListViewController;
  [(MUIMessageListViewController *)&v5 dealloc];
}

- (void)setMessageRepository:(id)a3
{
  objc_super v5 = (EMMessageRepository *)a3;
  p_messageRepository = &self->_messageRepository;
  if (self->_messageRepository != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_messageRepository, a3);
    p_messageRepository = (EMMessageRepository **)[(MUIMessageListViewController *)self reloadDataSource];
    objc_super v5 = v7;
  }
  MEMORY[0x1F41817F8](p_messageRepository, v5);
}

- (void)_updateViewPrimaryWithNoOnboardingIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(MUIMessageListViewController *)self selectedBucket] == 1)
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    BOOL v3 = MUIOnboardingTipKeyForBucket(1);
    if ([v2 integerForKey:v3] == 1)
    {
      uint64_t v4 = *MEMORY[0x1E4F601B8];
      uint64_t v5 = [v2 integerForKey:*MEMORY[0x1E4F601B8]];
      uint64_t v6 = 2;
      if (v5 < 2) {
        uint64_t v6 = v5;
      }
      uint64_t v7 = v6 + 1;
      id v8 = _ef_log_MUIMessageListViewController();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 134217984;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_INFO, "Updated viewedPrimaryWithNoOnboarding:%ld", (uint8_t *)&v9, 0xCu);
      }

      [v2 setInteger:v7 forKey:v4];
    }
  }
}

- (BOOL)_shouldDisplayHelpMailLearn
{
  BOOL v3 = [(MUIMessageListViewController *)self _shouldDisplayOnboardingTip];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v5 = *MEMORY[0x1E4F60198];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F60198]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    [v4 removeObjectForKey:v5];
    uint64_t v6 = 0;
  }
  if (((objc_msgSend(v6, "ef_isLaterThanNow") | v3) & 1) != 0
    || !EMBlackPearlIsFeatureEnabled())
  {
    char v8 = 0;
  }
  else
  {
    uint64_t v7 = [(MUIMessageListViewController *)self mailboxes];
    char v8 = objc_msgSend(v7, "ef_any:", &__block_literal_global_29_0);
  }
  return v8;
}

BOOL __59__MUIMessageListViewController__shouldDisplayHelpMailLearn__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 7;
}

- (void)setSwipeActionVisible:(BOOL)a3
{
  if (self->_swipeActionVisible != a3)
  {
    BOOL v3 = a3;
    self->_swipeActionVisible = a3;
    uint64_t v4 = [(MUIMessageListViewController *)self dataSource];
    id v5 = v4;
    if (v3) {
      [v4 suspendUpdates];
    }
    else {
      [v4 resumeUpdates];
    }
  }
}

- (BOOL)isSearchViewController
{
  return 0;
}

- (BOOL)isInExpandedEnvironment
{
  return 1;
}

- (BOOL)isSearchControllerActive
{
  return 0;
}

- (BOOL)isPresentingSearchViewController
{
  return 0;
}

- (NSArray)inputLanguages
{
}

- (id)searchPredicateForMailboxes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(MUIMessageListViewController *)self currentSuggestion];
  uint64_t v7 = objc_msgSend(v6, "mui_messageListSearchPredicate");
  objc_msgSend(v5, "ef_addOptionalObject:", v7);
  char v8 = [(MUIMessageListViewController *)self userQueryString];
  if ([v8 length])
  {
    int v9 = [MEMORY[0x1E4F60398] spotlightSearchPredicateForValue:v8];
    [v5 addObject:v9];
  }
  uint64_t v10 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend(v7, "ef_publicDescription");
    id v12 = [MEMORY[0x1E4F60220] publicDescriptionForSuggestion:v6];
    long long v13 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v8];
    int v20 = 138412802;
    id v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "Generated remote search predicate:%@ for suggestion:%@ (%@)", (uint8_t *)&v20, 0x20u);
  }
  if ([v4 count])
  {
    long long v14 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxes:v4];
    objc_msgSend(v5, "ef_addOptionalObject:", v14);
    long long v15 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412802;
      id v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_DEFAULT, "Generated localMailboxPredicate:%@ for suggestion:%@ (%@)", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    long long v14 = [MEMORY[0x1E4F60390] predicateForExcludingMessagesInMailboxesWithTypes:&unk_1F39E1E30];
    [v5 addObject:v14];
    long long v15 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v16 = [MEMORY[0x1E4F60220] publicDescriptionForSuggestion:v6];
      id v17 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v8];
      int v20 = 138412802;
      id v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_DEFAULT, "Generated excludeJunkAndTrashPredicate:%@ for suggestion:%@ (%@)", (uint8_t *)&v20, 0x20u);
    }
  }

  if ([v5 count])
  {
    id v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (NSString)userQueryString
{
  BOOL v3 = [(MUIMessageListViewController *)self currentSuggestion];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 userQueryString];
    uint64_t v6 = [(MUIMessageListViewController *)self inputLanguages];
    uint64_t v7 = objc_msgSend(v5, "ef_stringByRemovingWhitespaceAndUnbalancedQuotesForLanguages:", v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)isFilterButtonEnabled
{
}

- (void)setFilterButtonEnabled:(BOOL)a3
{
}

- (void)updateFilterControlWithFilterViewModel:(id)a3
{
  id v5 = a3;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController updateFilterControlWithFilterViewModel:]", "MUIMessageListViewController.m", 466, "0");
}

- (id)createMailboxFilterController
{
}

- (void)applyFilterPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MUIMessageListViewController *)self setCurrentFilterPredicate:v4];
  id v5 = [(MUIMessageListViewController *)self dataSource];
  uint64_t v6 = [v5 visibleMessageListSections];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        long long v13 = [(MUIMessageListViewController *)self dataSource];
        long long v14 = [(MUIMessageListViewController *)self filterViewModel];
        objc_msgSend(v13, "applyFilterPredicate:userFiltered:ignoreMessagesPredicate:section:", v4, objc_msgSend(v14, "isFilterEnabled"), 0, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(MUIMessageListViewController *)self refreshHighlightedMessagesController];
}

- (void)toggleFilters
{
  uint64_t v3 = [(MUIMessageListViewController *)self isFilterButtonEnabled] ^ 1;
  [(MUIMessageListViewController *)self setFiltersEnabled:v3];
}

- (void)setFiltersEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[MUIMessageListViewController setFilterButtonEnabled:](self, "setFilterButtonEnabled:");
  [(MUIMessageListViewController *)self updateFilters];
  if (v3)
  {
    [(MUIMessageListViewController *)self _reportFilterButtonTapped];
  }
}

- (void)updateFilters
{
  if ([(MUIMessageListViewController *)self isFilterButtonEnabled])
  {
    -[MUIMessageListViewController _enableFilters](self);
  }
  else
  {
    -[MUIMessageListViewController _disableFilters](self);
  }
}

- (void)_enableFilters
{
  if (a1)
  {
    id v4 = [a1 filterViewModel];
    [v4 setFilterEnabled:1];
    id v2 = -[MUIMessageListViewController _predicateForFiltersEnabled:](a1, 1);
    if (-[MUIMessageListViewController _shouldApplyFilterPredicate:](a1, v2))
    {
      [a1 applyFilterPredicate:v2];
      [a1 updateFilterControlWithFilterViewModel:v4];
      BOOL v3 = [v4 selectedFilters];
      -[MUIMessageListViewController _reportFilterChangeEvent:filters:]((uint64_t)a1, 1, v3);
    }
  }
}

- (void)_disableFilters
{
  if (a1)
  {
    id v2 = [a1 filterViewModel];
    [v2 setFilterEnabled:0];

    -[MUIMessageListViewController _predicateForFiltersEnabled:](a1, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (-[MUIMessageListViewController _shouldApplyFilterPredicate:](a1, v3))
    {
      [a1 applyFilterPredicate:v3];
      -[MUIMessageListViewController _reportFilterChangeEvent:filters:]((uint64_t)a1, 0, 0);
    }
  }
}

- (void)_reportFilterChangeEvent:(void *)a3 filters:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__MUIMessageListViewController__reportFilterChangeEvent_filters___block_invoke;
    v7[3] = &unk_1E6D13210;
    char v9 = a2;
    id v8 = v5;
    [v6 performBlock:v7];
  }
}

- (void)_reportFilterButtonTapped
{
  id v2 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
  [v2 performBlock:&__block_literal_global_54];
}

uint64_t __57__MUIMessageListViewController__reportFilterButtonTapped__block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __57__MUIMessageListViewController__reportFilterButtonTapped__block_invoke_2()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v1 = [v0 primaryAuthKitAccount];
  uint64_t v2 = [v0 userIsSeniorForAccount:v1];
  uint64_t v6 = @"u65_flag";
  id v3 = [NSNumber numberWithBool:v2];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

void __65__MUIMessageListViewController__reportFilterChangeEvent_filters___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __65__MUIMessageListViewController__reportFilterChangeEvent_filters___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"isEnabled"];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = NSStringFromMUIMailboxFilterType(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "type", (void)v11));
        [v2 setObject:&unk_1F39E1DD0 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v2;
}

- (void)reloadDataSource
{
}

- (void)reloadDataSourceApplyEmptySnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MUIMessageListViewController *)self createMessageListForReload];
  [(MUIMessageListViewController *)self reloadDataSourceWithMessageList:v5 applyEmptySnapshot:v3];
}

- (void)reloadDataSourceWithMessageList:(id)a3 section:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412802;
    long long v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> Reload message list in section: %{public}@", buf, 0x20u);
  }
  [(MUIMessageListViewController *)self cancelQueueSuspensionTimeout];
  long long v11 = [[MessageListSectionDataSourceUpdateRequest alloc] initWithSection:v6 messageList:v7];

  long long v12 = [MessageListDataSourceUpdateRequest alloc];
  uint64_t v16 = v11;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  long long v14 = [(MessageListDataSourceUpdateRequest *)v12 initWithSectionUpdates:v13 sectionsToRemove:0 startsWithEmptySnapshot:1];

  long long v15 = [(MUIMessageListViewController *)self dataSource];
  [v15 applyMessageListDataSourceUpdate:v14];
}

- (void)reloadDataSourceWithSearchPredicate:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 138412802;
    v42 = v7;
    __int16 v43 = 2048;
    int v44 = self;
    __int16 v45 = 2114;
    v46 = v8;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Reload data source with search predicate: %{public}@", buf, 0x20u);
  }
  [(MUIMessageListViewController *)self isThreaded];
  uint64_t v9 = objc_opt_class();
  int v10 = _os_feature_enabled_impl();
  if (v10)
  {
    if ([MEMORY[0x1E4F602E0] preferenceEnabled:54])
    {
      long long v11 = _ef_log_MUIMessageListViewController();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        long long v12 = (objc_class *)objc_opt_class();
        long long v13 = NSStringFromClass(v12);
        long long v14 = objc_msgSend(v4, "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        v42 = v13;
        __int16 v43 = 2048;
        int v44 = self;
        __int16 v45 = 2114;
        v46 = v14;
        _os_log_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_DEFAULT, "<%@: %p> Disabling SearchIndexer generated results: %{public}@", buf, 0x20u);
      }
      uint64_t v15 = 32;
    }
    else
    {
      uint64_t v15 = 50;
    }
    if ([MEMORY[0x1E4F602E0] preferenceEnabled:53])
    {
      v15 |= 4uLL;
      long long v18 = _ef_log_MUIMessageListViewController();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        __int16 v21 = objc_msgSend(v4, "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        v42 = v20;
        __int16 v43 = 2048;
        int v44 = self;
        __int16 v45 = 2114;
        v46 = v21;
        _os_log_impl(&dword_1DDCDB000, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> Disabling maild generated results: %{public}@", buf, 0x20u);
      }
      id v16 = v4;
    }
    else
    {
      id v16 = v4;
    }
    long long v17 = @"message list indexed search";
  }
  else
  {
    id v16 = v4;
    long long v17 = @"message list search";
    uint64_t v15 = 34;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v23 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  int v40 = v23;
  __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  uint64_t v25 = [(MUIMessageListViewController *)self currentSuggestion];
  v38 = v17;
  uint64_t v26 = v16;
  v27 = (void *)[v22 initWithTargetClass:v9 predicate:v16 sortDescriptors:v24 suggestion:v25 limit:0 queryOptions:v15 targetClassOptions:0 label:v38];

  [(MUIMessageListViewController *)self setOldestItemsIDsByMailboxObjectID:0];
  v28 = [(MUIMessageListViewController *)self mailboxesPendingOldestItemsUpdates];
  [v28 removeAllObjects];

  id v29 = objc_alloc(MEMORY[0x1E4F60380]);
  v30 = [(MUIMessageListViewController *)self messageRepository];
  uint64_t v31 = (void *)[v29 initWithQuery:v27 repository:v30];

  v32 = [(MUIMessageListViewController *)self state];
  [v32 setShouldDisplayUnreadAndVIP:1];

  [(MUIMessageListViewController *)self reloadDataSourceWithMessageList:v31 section:@"MessageListSectionIndexedSearch"];
  if (v10)
  {
    id v33 = objc_alloc(MEMORY[0x1E4F60418]);
    v34 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
    uint64_t v39 = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    v36 = [(MUIMessageListViewController *)self currentSuggestion];
    v37 = (void *)[v33 initWithTargetClass:v9 predicate:v16 sortDescriptors:v35 suggestion:v36 limit:0 queryOptions:38 targetClassOptions:0 label:@"message list server search"];

    [(MUIMessageListViewController *)self _reloadServerSearchMessageListIfNecessaryWithQuery:v37];
  }
}

- (void)_reloadServerSearchMessageListIfNecessaryWithQuery:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F60380];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(MUIMessageListViewController *)self messageRepository];
  id v8 = (id)[v6 initWithQuery:v5 repository:v7];

  [(MUIMessageListViewController *)self reloadDataSourceWithMessageList:v8 section:@"MessageListSectionServerSearch"];
}

void __94__MUIMessageListViewController_messageListDataSource_section_shouldSuspendUpdatesAfterChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "[Launch] Timeout - Resume updates", v4, 2u);
  }

  BOOL v3 = [WeakRetained dataSource];
  [v3 resumeUpdates];
}

id __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 cellHelper];
  BOOL v3 = [v2 messageListItem];
  id v4 = [v3 itemID];

  return v4;
}

- (void)messageListDataSourceUpdateFailed:(id)a3 section:(id)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__MUIMessageListViewController_messageListDataSourceUpdateFailed_section___block_invoke;
  v5[3] = &unk_1E6D11708;
  v5[4] = self;
  id v4 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", a3, a4);
  [v4 performBlock:v5];
}

uint64_t __74__MUIMessageListViewController_messageListDataSourceUpdateFailed_section___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageListSelectionModel];
  [v2 setPerformingDataSourceUpdates:0];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 reloadDataSource];
}

- (BOOL)isIndexingMessagesForMessageListDataSource:(id)a3
{
  return 0;
}

- (id)initialLoadCompletedPromiseForMessageListSectionDataSource:(id)a3
{
  id v4 = [a3 section];
  int v5 = [v4 isEqualToString:@"MessageListSectionRecent"];

  if (v5)
  {
    id v6 = [(MUIMessageListViewController *)self initialLoadCompletedPromise];
    [v6 finishWithResult:MEMORY[0x1E4F1CC28]];

    id v7 = [MEMORY[0x1E4F60E18] promise];
    [(MUIMessageListViewController *)self setInitialLoadCompletedPromise:v7];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)messageListSectionDataSource:(id)a3 updatedOldestItemsForMailboxes:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(MUIMessageListViewController *)self mailboxesPendingOldestItemsUpdates];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        long long v13 = [(MUIMessageListViewController *)self oldestItemsIDsByMailboxObjectID];
        long long v14 = [v13 objectForKeyedSubscript:v12];

        uint64_t v15 = [v5 objectForKeyedSubscript:v12];
        id v16 = v15;
        if (v15 != v14 && ([v15 isEqual:v14] & 1) == 0) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  long long v17 = [(MUIMessageListViewController *)self mailboxesPendingOldestItemsUpdates];
  objc_msgSend(v17, "ef_removeObjectsInArray:", v6);

  long long v18 = (void *)[v5 copy];
  [(MUIMessageListViewController *)self setOldestItemsIDsByMailboxObjectID:v18];
}

- (void)messageListSectionDataSource:(id)a3 deletedMessagesWithItemIdentifiers:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MUIMessageListViewController *)self referenceMessageListItem];
  uint64_t v9 = [v8 itemID];

  if (v9)
  {
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    if (![v7 containsObject:v9]) {
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = v7;
  }
  uint64_t v11 = [v6 messageList];
  int v12 = [v11 recentlyCollapsedThreadContainsItemID:v9];

  if (v12)
  {
    long long v13 = [v6 messageList];
    [v13 clearRecentlyCollapsedThread];
  }
  else if ([(MUIMessageListViewController *)self isPresentingSearchViewController])
  {
    -[MUIMessageListViewController _highlightNextMessageAfterDeletingMessagesWithItemIdentifiers:](self, v10);
  }
  else
  {
    [(MUIMessageListViewController *)self selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:v10];
  }
LABEL_10:
}

- (void)_highlightNextMessageAfterDeletingMessagesWithItemIdentifiers:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 messageSelectionStrategy];
    id v5 = [v4 itemIDToSelectAfterDeletedMessageItemIDs:v3];

    id v6 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v9 = 138413058;
      id v10 = v8;
      __int16 v11 = 2048;
      int v12 = a1;
      __int16 v13 = 2114;
      long long v14 = v5;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Highlight next message with item id: %{public}@, after deleting messages with ids: %{public}@", (uint8_t *)&v9, 0x2Au);
    }
    [a1 selectRowOfItemID:v5 scrollToVisible:0 animated:0];
  }
}

- (void)messageListSectionDataSource:(id)a3 handleRowSelectionAfterMovingMessagesWithItemIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController messageListSectionDataSource:handleRowSelectionAfterMovingMessagesWithItemIdentifiers:]", "MUIMessageListViewController.m", 1221, "0");
}

- (void)showBlankCellAlertForMessageListSectionDataSource:(id)a3 itemID:(id)a4 indexPath:(id)a5 reason:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController showBlankCellAlertForMessageListSectionDataSource:itemID:indexPath:reason:]", "MUIMessageListViewController.m", 1226, "0");
}

- (void)messageListSectionDataSource:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5 item:(id)a6 itemWasCached:(BOOL)a7 duration:(double)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController messageListSectionDataSource:didConfigureCell:atIndexPath:item:itemWasCached:duration:]", "MUIMessageListViewController.m", 1231, "0");
}

- (void)messageListSectionDataSource:(id)a3 didFailToConfigureCellAtIndexPath:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = [(MUIMessageListViewController *)self cellsController];
  [v7 reportCellDidLoad:0 error:v6];
}

- (Class)sectionListCellClassForMessageListSectionDataSource:(id)a3
{
  id v5 = a3;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController sectionListCellClassForMessageListSectionDataSource:]", "MUIMessageListViewController.m", 1244, "0");
}

- (BOOL)messageListRecentSectionDataSourceIsInExpandedEnvironment:(id)a3
{
  return 1;
}

- (int64_t)selectedBucketForMessageListRecentSectionDataSource:(id)a3
{
  id v5 = a3;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController selectedBucketForMessageListRecentSectionDataSource:]", "MUIMessageListViewController.m", 1274, "0");
}

- (id)feedbackListViewModelForHelpMailLearnSectionDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [_TtC6MailUI23FeedbackViewModelHelper alloc];
  int64_t v6 = [(MUIMessageListViewController *)self selectedBucket];
  id v7 = [(MUIMessageListViewController *)self mailboxes];
  id v8 = [(FeedbackViewModelHelper *)v5 initWithSelectedBucket:v6 selectedMailboxes:v7];

  int v9 = [_TtC6MailUI21FeedbackListViewModel alloc];
  id v10 = [(MUIMessageListViewController *)self daemonInterface];
  id v11 = [(MUIMessageListViewController *)self diagnosticsHelper];
  id v12 = [(FeedbackListViewModel *)v9 initWithDaemonInterface:v10 diagnosticsHelper:v11 viewModelHelper:v8];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __87__MUIMessageListViewController_feedbackListViewModelForHelpMailLearnSectionDataSource___block_invoke;
  v14[3] = &unk_1E6D117D8;
  objc_copyWeak(&v15, &location);
  [(FeedbackListViewModel *)v12 setCancellationHandler:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

void __87__MUIMessageListViewController_feedbackListViewModelForHelpMailLearnSectionDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v2;
  }
}

- (void)categoryGroupingPreferenceController:(id)a3 shouldDisableGrouping:(BOOL)a4 forBucket:(int64_t)a5
{
  BOOL v5 = a4;
  if ([(MUIMessageListViewController *)self selectedBucket] == a5)
  {
    id v7 = [(MUIMessageListViewController *)self filterViewModel];
    [v7 setFilterAvailable:v5];

    [(MUIMessageListViewController *)self reloadDataSource];
  }
}

- (id)messageSelectionStrategy:(id)a3 indexPathOfItemID:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(MUIMessageListViewController *)self dataSource];
  id v7 = [v6 indexPathForItemIdentifier:v5];

  return v7;
}

- (id)messageSelectionStrategy:(id)a3 itemIDForIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(MUIMessageListViewController *)self dataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  return v7;
}

- (int64_t)numberOfItemsForMessageSelectionStrategy:(id)a3
{
  id v3 = [(MUIMessageListViewController *)self dataSource];
  int64_t v4 = [v3 numberOfItems];

  return v4;
}

- (id)indexPathOfSelectedMessageForMessageSelectionStrategy:(id)a3
{
  id v3 = [(MUIMessageListViewController *)self _indexPathsForSelectedItems];
  int64_t v4 = [v3 firstObject];

  return v4;
}

- (id)messageSelectionStrategy:(id)a3 messageListItemForItemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MUIMessageListViewController.m", 1340, @"Invalid parameter not satisfying: %@", @"itemID" object file lineNumber description];
  }
  int v9 = [(MUIMessageListViewController *)self dataSource];
  id v10 = [v9 messageListItemForItemID:v8];

  id v17 = 0;
  id v11 = [v10 resultWithTimeout:&v17 error:1.0];
  id v12 = v17;
  if (!v11)
  {
    id v13 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MUIMessageListViewController messageSelectionStrategy:messageListItemForItemID:]((uint64_t)v8, v12, v13);
    }

    id v14 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[MUIMessageListViewController messageSelectionStrategy:messageListItemForItemID:](v14);
    }
  }
  return v11;
}

- (BOOL)messageSelectionStrategy:(id)a3 anyExpandedThreadContainsItemID:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(MUIMessageListViewController *)self dataSource];
  char v7 = [v6 anyExpandedThreadContainsItemID:v5];

  return v7;
}

- (BOOL)messageSelectionStrategy:(id)a3 isExpandedThreadWithItemID:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(MUIMessageListViewController *)self dataSource];
  char v7 = [v6 isExpandedThread:v5];

  return v7;
}

- (id)_indexPathsForSelectedItems
{
  id v2 = [(MUIMessageListViewController *)self collectionView];
  id v3 = [v2 indexPathsForSelectedItems];

  return v3;
}

- (EMMessageListItem)referenceMessageListItem
{
}

- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:]", "MUIMessageListViewController.m", 1377, "0");
}

- (BOOL)selectRowOfItemID:(id)a3 scrollToVisible:(BOOL)a4 animated:(BOOL)a5
{
  return [(MUIMessageListViewController *)self selectRowOfItemID:a3 scrollToVisible:a4 scrollPosition:0 animated:a5];
}

- (BOOL)selectRowOfItemID:(id)a3 scrollToVisible:(BOOL)a4 scrollPosition:(int64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    int v24 = 138413826;
    uint64_t v25 = v14;
    __int16 v26 = 2048;
    v27 = self;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 1024;
    int v33 = v8;
    __int16 v34 = 2048;
    int64_t v35 = a5;
    __int16 v36 = 1024;
    BOOL v37 = v6;
    _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - itemID:%@, scrollToVisible:%{BOOL}d, scrollPosition:%lu, animated:%{BOOL}d", (uint8_t *)&v24, 0x40u);
  }
  id v16 = [(MUIMessageListViewController *)self dataSource];
  id v17 = [v16 indexPathForItemIdentifier:v11];

  long long v18 = [(MUIMessageListViewController *)self collectionView];
  if (v17)
  {
    [(MUIMessageListViewController *)self setLastSelectedItemID:v11];
    if ([(MUIMessageListViewController *)self isInExpandedEnvironment])
    {
      long long v19 = [(MUIMessageListViewController *)self _indexPathsForSelectedItems];
      char v20 = [v19 containsObject:v17];

      if ((v20 & 1) == 0)
      {
        [(MUIMessageListViewController *)self deselectSelectedItemsInCollectionView];
        objc_msgSend(v18, "mui_selectItemAtIndexPath:animated:scrollPosition:", v17, v6 & ~v8, 0);
      }
    }
    if (v8)
    {
      uint64_t v21 = [v17 item];
      if (v21 < objc_msgSend(v18, "numberOfItemsInSection:", objc_msgSend(v17, "section"))
        && (objc_msgSend(v18, "mui_isIndexPathVisible:", v17) & 1) == 0)
      {
        objc_msgSend(v18, "mui_scrollToItemAtIndexPath:atScrollPosition:animated:", v17, a5, v6);
      }
    }
    if (![(MUIMessageListViewController *)self isSearchControllerActive]) {
      [(MUIMessageListViewController *)self setSplitViewControllerNeedsFocusUpdate];
    }
  }
  else
  {
    long long v22 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MUIMessageListViewController selectRowOfItemID:scrollToVisible:scrollPosition:animated:]((uint64_t)self, (uint64_t)v11, v22);
    }

    [(MUIMessageListViewController *)self setLastSelectedItemID:0];
    [(MUIMessageListViewController *)self deselectAllItemsInCollectionView:v18 animated:v6];
  }

  return v17 != 0;
}

- (void)deselectSelectedItemsInCollectionView
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(MUIMessageListViewController *)self collectionView];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v4 = [(MUIMessageListViewController *)self _indexPathsForSelectedItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 deselectItemAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) animated:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)deselectAllItemsInCollectionView:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController deselectAllItemsInCollectionView:animated:]", "MUIMessageListViewController.m", 1427, "0");
}

- (void)selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3
{
  id v5 = a3;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:]", "MUIMessageListViewController.m", 1438, "0");
}

- (id)messageListItemsForDiagnosticsHelper:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 source] == 1)
  {
    id v5 = [(MUIMessageListViewController *)self lastSelectedMessageListItems];
    [(MUIMessageListViewController *)self setLastSelectedMessageListItems:0];
    id v6 = _ef_log_MUIMessageListViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218242;
      uint64_t v9 = [v5 count];
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEFAULT, "Providing %lu messages to %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)currentFocusChanged:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__MUIMessageListViewController_currentFocusChanged___block_invoke;
  v9[3] = &unk_1E6D11A50;
  void v9[4] = self;
  id v10 = v4;
  id v5 = v9;
  id v6 = (void *)MEMORY[0x1E4F60F28];
  id v7 = v4;
  int v8 = [v6 mainThreadScheduler];
  [v8 performSyncBlock:v5];
}

void __52__MUIMessageListViewController_currentFocusChanged___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setCurrentFocus:*(void *)(a1 + 40)];
  id v2 = _ef_log_MUIMessageListViewController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    id v4 = [*(id *)(a1 + 32) mailboxes];
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2112;
    int v8 = v4;
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "Current Focus changed: %{public}@, mailboxes: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)setFocusFilterEnabled:(BOOL)a3
{
  if (self->_focusFilterEnabled != a3)
  {
    self->_focusFilterEnabled = a3;
    if (a3)
    {
      id v4 = [(MUIMessageListViewController *)self filterController];
      [v4 reselectFocusedAccounts];
    }
    [(MUIMessageListViewController *)self updateFilters];
    [(MUIMessageListViewController *)self _updateUnseenCountQueries];
  }
}

- (void)updateHighlightsVisibility
{
}

- (void)updateHighlightsToggleVisibility
{
}

- (void)highlightedMessagesController:(id)a3 didFindMessages:(id)a4
{
}

- (void)highlightedMessagesViewDidSelectMessage:(id)a3
{
  id v5 = a3;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController highlightedMessagesViewDidSelectMessage:]", "MUIMessageListViewController.m", 1562, "0");
}

- (void)highlightedMessagesViewDidProvideFeedbackForMessage:(id)a3 feedbackType:(int64_t)a4 feedbackFeature:(int64_t)a5
{
  id v7 = a3;
  [(MUIMessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MUIMessageListViewController highlightedMessagesViewDidProvideFeedbackForMessage:feedbackType:feedbackFeature:]", "MUIMessageListViewController.m", 1566, "0");
}

- (void)highlightedMessagesViewDidChangeHeight
{
}

- (id)cellLayoutValuesForHighlightedMessages
{
  id v2 = [(MUIMessageListViewController *)self layoutValuesHelper];
  id v3 = [v2 layoutValuesForStyle:0];

  return v3;
}

- (void)updateSelectedBucket:(int64_t)a3 unseenPredicate:(id)a4
{
  id v9 = a4;
  id v6 = [(MUIMessageListViewController *)self unseenPredicate];

  if (v6 == v9)
  {
    if ([(MUIMessageListViewController *)self selectedBucket] == a3) {
      goto LABEL_7;
    }
  }
  else
  {
    -[MUIMessageListViewController setUnseenPredicate:](self, "setUnseenPredicate:");
    if ([(MUIMessageListViewController *)self selectedBucket] == a3) {
      goto LABEL_6;
    }
  }
  [(MUIMessageListViewController *)self setSelectedBucket:a3];
LABEL_6:
  uint64_t v7 = [(MUIMessageListViewController *)self shouldDisplayGroupedSenders] ^ 1;
  int v8 = [(MUIMessageListViewController *)self filterViewModel];
  [v8 setFilterAvailable:v7];

  [(MUIMessageListViewController *)self reloadDataSourceApplyEmptySnapshot:0];
LABEL_7:
}

- (EMAccountRepository)accountRepository
{
  return self->_accountRepository;
}

- (void)setMailboxes:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  return self->_diagnosticsHelper;
}

- (void)setMessageListFetchHelper:(id)a3
{
}

- (NSArray)lastSelectedMessageListItems
{
  return self->_lastSelectedMessageListItems;
}

- (void)setState:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setLayoutValuesHelper:(id)a3
{
}

- (void)setMessageToDisplayOnReload:(id)a3
{
}

- (NSMutableSet)mailboxesPendingOldestItemsUpdates
{
  return self->_mailboxesPendingOldestItemsUpdates;
}

- (void)setOldestItemsIDsByMailboxObjectID:(id)a3
{
}

- (NSArray)highlightedMessages
{
  return self->_highlightedMessages;
}

- (void)setHighlightedMessages:(id)a3
{
}

- (EMNSUserDefaultsBoolObserver)showHighlights
{
  return self->_showHighlights;
}

- (EMNSUserDefaultsBoolObserver)hasCompletedAppleIntelligenceOnboarding
{
  return self->_hasCompletedAppleIntelligenceOnboarding;
}

- (MessageSelectionStrategy)messageSelectionStrategy
{
  return self->_messageSelectionStrategy;
}

- (int)userBrowseDirection
{
  return self->_userBrowseDirection;
}

- (void)setUserBrowseDirection:(int)a3
{
  self->_userBrowseDirection = a3;
}

- (NSIndexPath)previouslySelectedIndexPath
{
  return self->_previouslySelectedIndexPath;
}

- (void)setPreviouslySelectedIndexPath:(id)a3
{
}

- (EMCollectionItemID)itemIDToSelectAfterMoveID
{
  return self->_itemIDToSelectAfterMoveID;
}

- (void)setItemIDToSelectAfterMoveID:(id)a3
{
}

- (EMCollectionItemID)lastSelectedItemID
{
  return self->_lastSelectedItemID;
}

- (void)setLastSelectedItemID:(id)a3
{
}

- (void)setInitialScrollItemID:(id)a3
{
}

- (EMFocusController)focusController
{
  return self->_focusController;
}

- (void)setCurrentFocus:(id)a3
{
}

- (void)setFilterController:(id)a3
{
}

- (CSSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (void)setCurrentSuggestion:(id)a3
{
}

- (BOOL)shouldIgnoreCommercePredicate
{
  return self->_shouldIgnoreCommercePredicate;
}

- (double)bucketsViewControllerHeight
{
  return self->_bucketsViewControllerHeight;
}

- (EFCancelable)diagnosticsHelperToken
{
  return self->_diagnosticsHelperToken;
}

- (void)setDiagnosticsHelperToken:(id)a3
{
}

- (EFCancelable)userDefaultsObserver
{
  return self->_userDefaultsObserver;
}

- (void)setUserDefaultsObserver:(id)a3
{
}

- (EFCancelable)focusObservationToken
{
  return self->_focusObservationToken;
}

- (void)setFocusObservationToken:(id)a3
{
}

- (EFCancelable)shouldIgnoreCommercePredicateToken
{
  return self->_shouldIgnoreCommercePredicateToken;
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (void)setAvatarGenerator:(id)a3
{
}

- (MUICategoryGroupingPreferenceController)categoryGroupingPreferenceController
{
  return self->_categoryGroupingPreferenceController;
}

- (void)setCategoryGroupingPreferenceController:(id)a3
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
}

- (void)setIndexPathsForConfiguredCollectionViewCells:(id)a3
{
}

- (void)setConfiguredSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredSections, 0);
  objc_storeStrong((id *)&self->_indexPathsForConfiguredCollectionViewCells, 0);
  objc_storeStrong((id *)&self->_indexPathsForToBeConfiguredCells, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_categoryGroupingPreferenceController, 0);
  objc_storeStrong((id *)&self->_unseenPredicate, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_shouldIgnoreCommercePredicateToken, 0);
  objc_storeStrong((id *)&self->_focusObservationToken, 0);
  objc_storeStrong((id *)&self->_userDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelperToken, 0);
  objc_storeStrong((id *)&self->_bucketsViewController, 0);
  objc_storeStrong((id *)&self->_bucketBarConfigurationController, 0);
  objc_storeStrong((id *)&self->_senderSpecificMessageListItem, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_currentFilterPredicate, 0);
  objc_storeStrong((id *)&self->_filterController, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_initialScrollItemID, 0);
  objc_storeStrong((id *)&self->_lastSelectedItemID, 0);
  objc_storeStrong((id *)&self->_itemIDToSelectAfterMoveID, 0);
  objc_storeStrong((id *)&self->_previouslySelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_messageSelectionStrategy, 0);
  objc_storeStrong((id *)&self->_hasCompletedAppleIntelligenceOnboarding, 0);
  objc_storeStrong((id *)&self->_showHighlights, 0);
  objc_storeStrong((id *)&self->_highlightedMessages, 0);
  objc_storeStrong((id *)&self->_highlightedMessagesController, 0);
  objc_storeStrong((id *)&self->_messageListPositionHelper, 0);
  objc_storeStrong((id *)&self->_cellsController, 0);
  objc_storeStrong((id *)&self->_messageListSelectionModel, 0);
  objc_storeStrong((id *)&self->_oldestItemsIDsByMailboxObjectID, 0);
  objc_storeStrong((id *)&self->_mailboxesPendingOldestItemsUpdates, 0);
  objc_storeStrong((id *)&self->_messageToDisplayOnReload, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_lastSelectedMessageListItems, 0);
  objc_storeStrong((id *)&self->_messageListFetchHelper, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelper, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxCategoryCloudStorage, 0);
  objc_storeStrong((id *)&self->_accountRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_queueSuspensionTimeoutToken, 0);
}

- (id)_configuredBucketsViewControllerWithMailboxes:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  id v5 = self;
  sub_1DDD79318();
  uint64_t v9 = sub_1DDEEEDA8();
  MUIMessageListViewController.configuredBucketsViewController(withMailboxes:)(v6, (Swift::OpaquePointer)v9);
  id v12 = v7;
  swift_bridgeObjectRelease();

  return v12;
}

- (void)_refreshBucketsSession
{
  swift_getObjectType();
  id v3 = self;
  MUIMessageListViewController.refreshBucketsSession()();
}

- (void)_selectBucket:(int64_t)a3
{
  swift_getObjectType();
  id v4 = self;
  MUIMessageListViewController.selectBucket(_:)(a3);
}

- (void)_updateBucketBarIsHidden:(BOOL)a3
{
  swift_getObjectType();
  id v4 = self;
  char v5 = sub_1DDEECF58();
  MUIMessageListViewController.updateBucketBar(isHidden:)(v5 & 1);
}

- (void)_bucketBarUserInteractionEnabled:(BOOL)a3
{
  swift_getObjectType();
  id v4 = self;
  char v5 = sub_1DDEECF58();
  MUIMessageListViewController.bucketBarUserInteractionEnabled(_:)(v5 & 1);
}

- (void)_updateUnseenCountQueries
{
  swift_getObjectType();
  id v3 = self;
  MUIMessageListViewController.updateUnseenCountQueries()();
}

- (void)_selectPrimary
{
  swift_getObjectType();
  id v3 = self;
  MUIMessageListViewController.selectPrimary()();
}

- (void)_selectTransactions
{
  swift_getObjectType();
  id v3 = self;
  MUIMessageListViewController.selectTransactions()();
}

- (void)_selectUpdates
{
  swift_getObjectType();
  id v3 = self;
  MUIMessageListViewController.selectUpdates()();
}

- (void)_selectPromotions
{
  swift_getObjectType();
  id v3 = self;
  MUIMessageListViewController.selectPromotions()();
}

- (void)_selectAllMail
{
  swift_getObjectType();
  id v3 = self;
  MUIMessageListViewController.selectAllMail()();
}

- (void)bucketBarConfigurationController:(id)a3 isHidden:(BOOL)a4 forMailboxes:(id)a5
{
  swift_getObjectType();
  id v6 = a3;
  id v7 = a5;
  int v8 = self;
  char v9 = sub_1DDEECF58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3410);
  uint64_t v10 = sub_1DDEEEDA8();
  MUIMessageListViewController.bucketBarConfigurationController(_:isHidden:forMailboxes:)((uint64_t)a3, v9 & 1, v10);
  swift_bridgeObjectRelease();
}

- (void)bucketBarConfigurationControllerRequiresReload:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  char v5 = self;
  MUIMessageListViewController.bucketBarConfigurationControllerRequiresReload(_:)(a3);
}

- (void)createMessageListForReload
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_ERROR, "Attempted to create message list with no message repository", v1, 2u);
}

- (void)messageSelectionStrategy:(os_log_t)log messageListItemForItemID:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_FAULT, "Failed to obtain message list item. See error log for details.", v1, 2u);
}

- (void)messageSelectionStrategy:(NSObject *)a3 messageListItemForItemID:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = objc_msgSend(a2, "ef_publicDescription");
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  char v9 = v5;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "Failed to obtain message list item for itemID: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)selectRowOfItemID:(NSObject *)a3 scrollToVisible:scrollPosition:animated:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138412802;
  char v9 = v7;
  __int16 v10 = 2048;
  uint64_t v11 = a1;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "<%@: %p> Cannot find last selected item (id=%{public}@) -> deselect all items", (uint8_t *)&v8, 0x20u);
}

@end