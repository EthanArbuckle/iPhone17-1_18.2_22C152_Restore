@interface CNContactListViewController
+ (id)collectionViewLayout;
+ (id)collectionViewLayoutWithFloatingHeaderViews:(BOOL)a3 contactListStyleApplier:(id)a4 trailingSwipeActionsProvider:(id)a5 shouldDisplaySupplementaryHeaderItemForSection:(id)a6 shouldShowSeparatorsForSection:(id)a7 directionalLayoutMargins:(id)a8 collectionViewIsShowingIndexBar:(id)a9 numberOfItemsInSection:(id)a10 contentUnavailable:(id)a11;
+ (id)descriptorForRequiredKeysForPreferredForNameMeContact;
+ (id)emptyContact;
+ (id)layoutSectionForLayoutConfiguration:(id)a3 layoutEnvironment:(id)a4 section:(int64_t)a5 contactListStyleApplier:(id)a6 shouldDisplaySupplementaryHeaderItemForSection:(id)a7 headerViewsFloat:(BOOL)a8 directionalLayoutMargins:(id)a9 collectionViewIsShowingIndexBar:(id)a10 contentUnavailable:(id)a11;
- (BOOL)allowsEditingActions;
- (BOOL)allowsListEditing;
- (BOOL)allowsMultiSelectContextMenus;
- (BOOL)allowsMultiSelection;
- (BOOL)bundleCanManageDuplicates;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canManageDuplicateContacts;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformDuplicatesMerge;
- (BOOL)canSelectContactAtCollectionViewIndexPath:(id)a3;
- (BOOL)canSelectContactAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionViewIsShowingIndexBar;
- (BOOL)collectionViewShouldDisplayCreateNewContact;
- (BOOL)containsPathToContentUnavailableRow:(id)a3;
- (BOOL)containsPathToCreateNewContactRow:(id)a3;
- (BOOL)containsPathToDuplicatesBanner:(id)a3;
- (BOOL)containsPathToLimitedAccessTipRow:(id)a3;
- (BOOL)didDeleteContact;
- (BOOL)disableContextMenus;
- (BOOL)hasAllRowsSelected;
- (BOOL)hasNoContacts;
- (BOOL)hasPickerPrivacyUI;
- (BOOL)hasSearchPrefix;
- (BOOL)headerViewNeedsUpdate;
- (BOOL)isContactProviderDataSource;
- (BOOL)isContactWithIdentifierEmergencyContact:(id)a3;
- (BOOL)isContactWithIdentifierMeContactOrLinkedToMeContact:(id)a3;
- (BOOL)isContentUnavailableRowSection:(int64_t)a3;
- (BOOL)isCreateNewContactRowSection:(int64_t)a3;
- (BOOL)isCurrentViewStillOpen;
- (BOOL)isDisplayingContentUnavailableViewAsCell;
- (BOOL)isDuplicatesLaunching;
- (BOOL)isDuplicatesRowSection:(int64_t)a3;
- (BOOL)isEasyToRecognizeWord:(id)a3;
- (BOOL)isHandlingSearch;
- (BOOL)isLimitedAccessTipRowSection:(int64_t)a3;
- (BOOL)isPathToContentUnavailableRow:(id)a3;
- (BOOL)isPathToCreateNewContactRow:(id)a3;
- (BOOL)isPathToDuplicatesBanner:(id)a3;
- (BOOL)isPathToLimitedAccessTipRow:(id)a3;
- (BOOL)isPerformingDuplicatesMerge;
- (BOOL)isSearchController;
- (BOOL)isSearching;
- (BOOL)isShowingAllContacts;
- (BOOL)isShowingCustomTitle;
- (BOOL)isShowingDuplicatesBanner;
- (BOOL)isShowingLimitedAccessTip;
- (BOOL)isShowingServerSearch;
- (BOOL)isValidIndexPath:(id)a3;
- (BOOL)isViewingTopLevelAllContacts;
- (BOOL)pendingSearchControllerActivation;
- (BOOL)presentsSearchUI;
- (BOOL)selectContact:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (BOOL)selectContact:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5 shouldScroll:(BOOL)a6;
- (BOOL)shouldAllowDrags;
- (BOOL)shouldAllowDrops;
- (BOOL)shouldAllowSearchForMultiSelect;
- (BOOL)shouldDisplayAddNewContactRow;
- (BOOL)shouldDisplayCount;
- (BOOL)shouldDisplayCreateNewContactAsRow;
- (BOOL)shouldDisplayEmergencyContacts;
- (BOOL)shouldDisplayGroupsGrid;
- (BOOL)shouldDisplayListHeaderView;
- (BOOL)shouldDisplayMeContactBanner;
- (BOOL)shouldDisplaySuggestionsController;
- (BOOL)shouldDisplaySupplementaryHeaderItemForSection:(int64_t)a3;
- (BOOL)shouldDisplayTipContentView;
- (BOOL)shouldEmbedContentUnavailableViewInCell;
- (BOOL)shouldEnableMultiSelectContextMenus;
- (BOOL)shouldHideDuplicates;
- (BOOL)shouldSearchBarBecomeFirstResponder;
- (BOOL)shouldShowDuplicateBannerView;
- (BOOL)shouldShowLimitedAccessTip;
- (BOOL)shouldUseLargeTitle;
- (BOOL)showingGroup;
- (BOOL)suggestionsController:(id)a3 canSelectContact:(id)a4;
- (BOOL)suggestionsController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5;
- (BOOL)validateSiriEnabled;
- (BOOL)validateSiriLanguage;
- (CNAvatarImageRenderer)avatarRenderer;
- (CNAvatarViewController)meBannerAvatarController;
- (CNCancelable)medicalIDLookupToken;
- (CNContact)preferredForNameMeContact;
- (CNContactDataSource)dataSource;
- (CNContactDataSource)originalDataSource;
- (CNContactFormatter)contactFormatter;
- (CNContactListActionHelper)actionHelper;
- (CNContactListBannerView)meContactBanner;
- (CNContactListSearchController)searchController;
- (CNContactListStyleApplier)contactListStyleApplier;
- (CNContactListStyleApplier)defaultContactListStyleApplier;
- (CNContactListViewController)initWithCollectionViewLayout:(id)a3;
- (CNContactListViewController)initWithDataSource:(id)a3 environment:(id)a4 shouldUseLargeTitle:(BOOL)a5;
- (CNContactListViewController)initWithDataSource:(id)a3 searchable:(BOOL)a4 environment:(id)a5 shouldUseLargeTitle:(BOOL)a6;
- (CNContactListViewController)initWithDataSource:(id)a3 shouldUseLargeTitle:(BOOL)a4;
- (CNContactListViewController)searchResultsController;
- (CNContactListViewController)visibleListViewController;
- (CNContactListViewControllerDelegate)delegate;
- (CNContactStore)contactStore;
- (CNContactSuggestionsViewController)suggestionsController;
- (CNDuplicateContactsController)duplicatesController;
- (CNHealthStoreManagerToken)medicalIDLookupRegistrationToken;
- (CNUIContactsEnvironment)environment;
- (CNVCardImportController)vCardImportController;
- (NSArray)pendingLayoutBlocks;
- (NSArray)selectedContacts;
- (NSArray)suggestedContacts;
- (NSArray)suggestionsIgnoredContactIdentifiers;
- (NSArray)suggestionsInteractionDomains;
- (NSIndexPath)indexPathToSelect;
- (NSSet)contactSelectionOnViewLoad;
- (NSSet)emergencyContactIdentifiers;
- (NSSet)limitedAccessContactSelection;
- (NSString)currentSearchString;
- (NSString)limitedAccessAppBundleId;
- (NSString)limitedAccessAppName;
- (NSString)meContactBannerFootnoteLabel;
- (NSString)meContactBannerFootnoteValue;
- (NSString)pendingSearchQuery;
- (UIButton)selectButton;
- (UIContentUnavailableConfiguration)cellContentUnavailableConfiguration;
- (UISearchBar)searchBar;
- (UIView)listHeaderView;
- (UIView)selectButtonView;
- (double)contactListHeaderHeight;
- (double)contentOffsetDueToMeContactBanner;
- (double)contentUnavailableCellHeight;
- (double)estimatedListHeaderViewHeight;
- (double)suggestionsControllerHeight;
- (float)selectAllButtonOffsetAccountingForSectionHeaders;
- (id)_contactAtCollectionViewIndexPath:(id)a3;
- (id)_contactAtIndexPath:(id)a3;
- (id)_contentUnavailableConfigurationState;
- (id)_sections;
- (id)appName;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewIndexPathForDataSourceIndexPath:(id)a3;
- (id)contactForActionsAtIndexPath:(id)a3 forMultiSelectAction:(BOOL)a4;
- (id)contactProvidersOnPasteboard;
- (id)contactsForActionsAtIndexPaths:(id)a3;
- (id)contentUnavailableConfigurationForState:(id)a3;
- (id)contextMenuConfigurationForContactsAtIndexPaths:(id)a3;
- (id)contextMenuInteraction;
- (id)createCollectionView;
- (id)dataSourceIndexPathForCollectionViewIndexPath:(id)a3;
- (id)dragItemsForIndexPath:(id)a3;
- (id)duplicatesBannerCell;
- (id)filteredSearchString;
- (id)getRecentCallCountAndSpeakableName;
- (id)getVisibleIndexPaths;
- (id)ignoredContactIdentifiersForSuggestionsController:(id)a3;
- (id)indexPathForGlobalIndex:(int64_t)a3;
- (id)indexTitlesForCollectionView:(id)a3;
- (id)limitedAccessContactsFromCurrentSelection;
- (id)limitedAccessTipCell;
- (id)limitedAccessTotalSelectedContacts;
- (id)mergableContacts;
- (id)pathToContentUnavailableRow;
- (id)pathToCreateNewContactRow;
- (id)pathToDuplicatesBanner;
- (id)pathToLimitedAccessTipRow;
- (id)recentOutgoingCalls;
- (id)searchCompletionBlock;
- (id)setupDuplicatesController;
- (id)tipKitContentView;
- (id)titleForHeaderInSection:(int64_t)a3;
- (id)trailingSwipeActionsConfigurationProvider;
- (int)limitedAccessPickerType;
- (int64_t)additionalSectionsAtTopCount;
- (int64_t)allDuplicatesCountToDisplay;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)contentUnavailableRowSection;
- (int64_t)createNewContactRowSection;
- (int64_t)dataSourceSectionIndexForCollectionViewSection:(int64_t)a3;
- (int64_t)limitedAccessTipSection;
- (int64_t)newDuplicatesCountToDisplay;
- (int64_t)numberOfSections;
- (unint64_t)globalIndexForCollectionViewIndexPath:(id)a3;
- (unint64_t)limitedAccessContactCaption;
- (unint64_t)totalNumberOfRows;
- (void)_applicationEnteringForeground:(id)a3;
- (void)_contactCountTelemetry:(unint64_t)a3;
- (void)_searchBarDidEndEditing:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateCountStringNow:(BOOL)a3;
- (void)action:(id)a3 presentViewController:(id)a4;
- (void)actionDidFinish:(id)a3;
- (void)addContactsToListTappedWithSourceView:(id)a3;
- (void)addSelectButtonView;
- (void)adjustTableViewOffsetForIncomingSearchUI;
- (void)applyStyle;
- (void)bannerView:(id)a3 wasSelectedToPresentMeContact:(id)a4;
- (void)beginSearch:(id)a3;
- (void)cancelSearch:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)configureNavigationBarForLargeTitles;
- (void)contactDataSourceDidChange:(id)a3;
- (void)contactDataSourceDisplayNameDidChange:(id)a3;
- (void)contactDataSourceMeContactDidChange:(id)a3;
- (void)contactStoreDidChangeWithNotification:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)copyContacts:(id)a3;
- (void)createNewContactTapped;
- (void)dealloc;
- (void)deleteContact:(id)a3;
- (void)deselectAllItemsExceptIndexPath:(id)a3;
- (void)deselectAllSelectedIndexPathsAnimated:(BOOL)a3;
- (void)didDismissSearchController:(id)a3;
- (void)didPerformDuplicatesMerge:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)didResetLimitedAccessSelectionTo:(id)a3;
- (void)didSelectViewAllDuplicates;
- (void)didUpdateContentForAvatarViewController:(id)a3;
- (void)disableSearchUI;
- (void)dismissKeyboard;
- (void)duplicatesBannerCellDidTapDismiss:(id)a3;
- (void)duplicatesDidChange:(id)a3;
- (void)fetchDuplicatesCountWithCompletionBlock:(id)a3;
- (void)handleSelectAllTapped;
- (void)initializeDuplicateContacts;
- (void)layoutSelectButtonView;
- (void)limitedAccessTipCellDidTapDismiss:(id)a3;
- (void)listActionHelper:(id)a3 didUpdateWithMenu:(id)a4;
- (void)loadView;
- (void)mergeUnifyContacts:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pasteContacts:(id)a3;
- (void)performWhenSearchCompleted:(id)a3;
- (void)performWhenViewIsLaidOut:(id)a3;
- (void)reconfigureVisibleItems;
- (void)refreshActionHelper;
- (void)refreshDuplicates;
- (void)refreshDuplicatesBanner;
- (void)refreshTableViewHeader;
- (void)refreshTableViewHeaderForContactChanges;
- (void)refreshTableViewHeaderIfVisible;
- (void)refreshTableViewHeaderIfVisibleWithSize:(CGSize)a3;
- (void)refreshTableViewHeaderWithSize:(CGSize)a3;
- (void)reloadContacts;
- (void)reloadTitle;
- (void)reloadVisibleItems;
- (void)removeDuplicatesBanner;
- (void)scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollTopToContactWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchForString:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)selectAllIndexPathsAnimated:(BOOL)a3;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)selectNextContact:(id)a3;
- (void)selectPreviousContact:(id)a3;
- (void)setActionHelper:(id)a3;
- (void)setAllowsEditingActions:(BOOL)a3;
- (void)setAllowsListEditing:(BOOL)a3;
- (void)setAllowsMultiSelectContextMenus:(BOOL)a3;
- (void)setAllowsMultiSelection:(BOOL)a3;
- (void)setAvatarRenderer:(id)a3;
- (void)setCellContentUnavailableConfiguration:(id)a3;
- (void)setCellStateSelected:(BOOL)a3 forContact:(id)a4 animated:(BOOL)a5;
- (void)setContactFormatter:(id)a3;
- (void)setContactListStyleApplier:(id)a3;
- (void)setContactSelectionOnViewLoad:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultContactListStyleApplier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDeleteContact:(BOOL)a3;
- (void)setDisableContextMenus:(BOOL)a3;
- (void)setDuplicatesController:(id)a3;
- (void)setEmergencyContactIdentifiers:(id)a3;
- (void)setEstimatedListHeaderViewHeight:(double)a3;
- (void)setHasPickerPrivacyUI:(BOOL)a3;
- (void)setHeaderViewNeedsUpdate:(BOOL)a3;
- (void)setImageForContact:(id)a3 imageUpdateBlock:(id)a4;
- (void)setIndexPathToSelect:(id)a3;
- (void)setIsCurrentViewStillOpen:(BOOL)a3;
- (void)setIsDuplicatesLaunching:(BOOL)a3;
- (void)setIsHandlingSearch:(BOOL)a3;
- (void)setIsShowingDuplicatesBanner:(BOOL)a3;
- (void)setIsViewingTopLevelAllContacts:(BOOL)a3;
- (void)setLimitedAccessAppBundleId:(id)a3;
- (void)setLimitedAccessAppName:(id)a3;
- (void)setLimitedAccessContactCaption:(unint64_t)a3;
- (void)setLimitedAccessContactSelection:(id)a3;
- (void)setLimitedAccessPickerType:(int)a3;
- (void)setListHeaderView:(id)a3;
- (void)setMeBannerAvatarController:(id)a3;
- (void)setMeContactBanner:(id)a3;
- (void)setMeContactBannerFootnoteLabel:(id)a3;
- (void)setMeContactBannerFootnoteValue:(id)a3;
- (void)setMedicalIDLookupRegistrationToken:(id)a3;
- (void)setMedicalIDLookupToken:(id)a3;
- (void)setNeedsHeaderViewUpdate;
- (void)setPendingLayoutBlocks:(id)a3;
- (void)setPendingSearchControllerActivation:(BOOL)a3;
- (void)setPendingSearchQuery:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchCompletionBlock:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultsController:(id)a3;
- (void)setSelectButton:(id)a3;
- (void)setSelectButtonView:(id)a3;
- (void)setShouldAllowDrags:(BOOL)a3;
- (void)setShouldAllowDrops:(BOOL)a3;
- (void)setShouldAllowSearchForMultiSelect:(BOOL)a3;
- (void)setShouldDisplayAddNewContactRow:(BOOL)a3;
- (void)setShouldDisplayCount:(BOOL)a3;
- (void)setShouldDisplayEmergencyContacts:(BOOL)a3;
- (void)setShouldDisplayGroupsGrid:(BOOL)a3;
- (void)setShouldDisplayMeContactBanner:(BOOL)a3;
- (void)setShouldDisplaySuggestionsController:(BOOL)a3;
- (void)setShouldHideDuplicates:(BOOL)a3;
- (void)setShouldSearchBarBecomeFirstResponder:(BOOL)a3;
- (void)setShouldShowLimitedAccessTip:(BOOL)a3;
- (void)setSuggestedContacts:(id)a3;
- (void)setSuggestionsController:(id)a3;
- (void)setSuggestionsControllerHeight:(double)a3;
- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3;
- (void)setSuggestionsInteractionDomains:(id)a3;
- (void)setTipKitContext:(id)a3;
- (void)setTipView:(id)a3;
- (void)setVCardImportController:(id)a3;
- (void)setupContactListForMultiSelectContextMenus;
- (void)setupForMultiSelection;
- (void)setupMeBannerAvatarController;
- (void)setupVCardImportController;
- (void)setupViewWithLimitedAccessContactSelection;
- (void)showCardForSelectedContactAtIndexPath:(id)a3;
- (void)startHandlingEmergencyContacts;
- (void)startSearching;
- (void)startSearchingForString:(id)a3 setSearchBarAsFirstResponder:(BOOL)a4;
- (void)suggestionsController:(id)a3 didChangeToHeight:(double)a4;
- (void)suggestionsController:(id)a3 didDeselectContact:(id)a4;
- (void)suggestionsController:(id)a3 didSelectContact:(id)a4;
- (void)tipKitDismissTip;
- (void)tipKitStartObservation;
- (void)tipKitStopObservation;
- (void)updateAdditionalSectionsAtTop;
- (void)updateDataSourceAndCollectionViewForDuplicatesBanner;
- (void)updateDataSourceAndCollectionViewForLimitedAccessTip;
- (void)updateDuplicatesBannerForProcessingState;
- (void)updateDuplicatesCountBanner;
- (void)updateInResponseToLimitedAccessSelectionChanged;
- (void)updateIsViewingTopLevelAllContacts;
- (void)updateMeContactBannerContentsWithTopKeyline:(BOOL)a3;
- (void)updateMeContactBannerTopKeyline;
- (void)updateNavTitleWithCount:(unint64_t)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateSelectAllButtonTitle;
- (void)updateSelectedContactCount;
- (void)updatelimitedAccessContactSelection;
- (void)vCardImportController:(id)a3 didSaveContacts:(id)a4;
- (void)vCardImportController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)vCardImportControllerDidCompleteQueue:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissSearchController:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
- (void)willPerformDuplicatesMergeAll:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation CNContactListViewController

- (id)titleForHeaderInSection:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = [(CNContactListViewController *)self _sections];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    unint64_t v5 = [v4 count];
    unint64_t v6 = v5;
    if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
    {
      v7 = [v4 objectAtIndexedSubscript:a3];
      v8 = [v7 title];

      goto LABEL_9;
    }
    v9 = CNUILogContactList();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218240;
      int64_t v12 = a3;
      __int16 v13 = 2048;
      unint64_t v14 = v6;
      _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Requesting header title for index out of bounds: %ld, sectionCount: %ld", (uint8_t *)&v11, 0x16u);
    }
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  v7 = [(CNContactDataSource *)self->_dataSource indexSections];
  v8 = [v7 objectAtIndexedSubscript:a5];

  v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(v8, "range"));
  v10 = [(CNContactListViewController *)self collectionViewIndexPathForDataSourceIndexPath:v9];

  return v10;
}

- (id)_contactAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_13;
  }
  unint64_t v5 = [(CNContactListViewController *)self _sections];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    unint64_t v6 = [v4 row];
LABEL_7:
    int v11 = [(CNContactDataSource *)self->_dataSource contacts];
    if ([v11 count] <= v6)
    {
      v7 = 0;
    }
    else
    {
      int64_t v12 = [(CNContactDataSource *)self->_dataSource contacts];
      v7 = [v12 objectAtIndexedSubscript:v6];
    }
    goto LABEL_12;
  }
  uint64_t v8 = [v4 section];
  if (v8 < [v5 count])
  {
    v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    uint64_t v10 = [v9 range];
    unint64_t v6 = v10 + [v4 row];

    goto LABEL_7;
  }
  v7 = 0;
LABEL_12:

LABEL_13:

  return v7;
}

- (id)_sections
{
  return (id)[(CNContactDataSource *)self->_dataSource sections];
}

- (BOOL)hasNoContacts
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(CNContactDataSource *)self->_dataSource isLoading] & 1) != 0)
  {
    return 0;
  }
  id v4 = [(CNContactDataSource *)self->_dataSource contacts];
  BOOL v3 = [v4 count] == 0;

  return v3;
}

- (void)didUpdateContentForAvatarViewController:(id)a3
{
  id v4 = [(CNContactListViewController *)self environment];
  BOOL v3 = [v4 launchCheckinRegistrar];
  [v3 checkInLaunchTasks:2];
}

- (int64_t)numberOfSections
{
  uint64_t v3 = *MEMORY[0x1E4F5A258];
  id v4 = [(CNContactListViewController *)self _sections];
  if ((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4))
  {
    uint64_t v5 = 1;
  }
  else
  {
    unint64_t v6 = [(CNContactListViewController *)self _sections];
    uint64_t v5 = [v6 count];
  }
  return [(CNContactListViewController *)self additionalSectionsAtTopCount] + v5;
}

id __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 contactListStyle];
  uint64_t v8 = [v6 traitCollection];
  uint64_t v9 = [v7 listAppearanceForTraitCollection:v8];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:v9];
  [v10 setHeaderMode:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke_2;
  v13[3] = &unk_1E5498520;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  [v10 setItemSeparatorHandler:v13];
  [*(id *)(a1 + 32) applyContactListStyleToCollectionLayoutConfiguration:v10];
  [v10 setTrailingSwipeActionsConfigurationProvider:*(void *)(a1 + 64)];
  int v11 = [(id)objc_opt_class() layoutSectionForLayoutConfiguration:v10 layoutEnvironment:v6 section:a2 contactListStyleApplier:*(void *)(a1 + 32) shouldDisplaySupplementaryHeaderItemForSection:*(void *)(a1 + 72) headerViewsFloat:*(unsigned __int8 *)(a1 + 104) directionalLayoutMargins:*(void *)(a1 + 56) collectionViewIsShowingIndexBar:*(void *)(a1 + 80) contentUnavailable:*(void *)(a1 + 88)];

  return v11;
}

+ (id)layoutSectionForLayoutConfiguration:(id)a3 layoutEnvironment:(id)a4 section:(int64_t)a5 contactListStyleApplier:(id)a6 shouldDisplaySupplementaryHeaderItemForSection:(id)a7 headerViewsFloat:(BOOL)a8 directionalLayoutMargins:(id)a9 collectionViewIsShowingIndexBar:(id)a10 contentUnavailable:(id)a11
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = (double (*)(id))*((void *)a11 + 2);
  id v17 = (uint64_t (**)(void))a10;
  v18 = (double (**)(void))a9;
  id v19 = a6;
  double v20 = v16(a11);
  if (v20 <= 0.0)
  {
    v31 = v44;
    v30 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v44 layoutEnvironment:v14];
  }
  else
  {
    double v21 = v20;
    v22 = (void *)MEMORY[0x1E4FB1338];
    v23 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v24 = [MEMORY[0x1E4FB1308] absoluteDimension:v21];
    v25 = [v22 sizeWithWidthDimension:v23 heightDimension:v24];

    v26 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v25];
    v27 = (void *)MEMORY[0x1E4FB1318];
    v51[0] = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    v29 = [v27 verticalGroupWithLayoutSize:v25 subitems:v28];

    v30 = [MEMORY[0x1E4FB1330] sectionWithGroup:v29];

    v31 = v44;
  }
  double v32 = v18[2](v18);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  uint64_t v39 = v17[2](v17);
  objc_msgSend(v19, "applyContactListDirectionalLayoutMargins:toLayoutSection:collectionViewIsShowingIndexBar:", v30, v39, v32, v34, v36, v38);

  v40 = [v30 boundarySupplementaryItems];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __257__CNContactListViewController_layoutSectionForLayoutConfiguration_layoutEnvironment_section_contactListStyleApplier_shouldDisplaySupplementaryHeaderItemForSection_headerViewsFloat_directionalLayoutMargins_collectionViewIsShowingIndexBar_contentUnavailable___block_invoke;
  v47[3] = &unk_1E54984F8;
  id v48 = v15;
  int64_t v49 = a5;
  BOOL v50 = a8;
  id v41 = v15;
  v42 = objc_msgSend(v40, "_cn_compactMap:", v47);
  [v30 setBoundarySupplementaryItems:v42];

  return v30;
}

id __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[5];
  id v7 = a2;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v6, [v7 section]);
  uint64_t v9 = [v7 row];
  uint64_t v10 = a1[6];
  uint64_t v11 = [v7 section];

  if ((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11))
  {
    BOOL v12 = v9 == v8 - 1;
    __int16 v13 = (void *)a1[4];
    (*(void (**)(void))(a1[7] + 16))();
    objc_msgSend(v13, "applyCellSeparatorInsetStyleToConfiguration:superviewDirectionalLayoutMargins:itemWantsFullLengthBottomSeparator:", v5, v12);
  }
  else
  {
    [v5 setTopSeparatorVisibility:2];
    [v5 setBottomSeparatorVisibility:2];
  }

  return v5;
}

double __51__CNContactListViewController_createCollectionView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isViewLoaded])
  {
    v2 = [WeakRetained view];
    [v2 directionalLayoutMargins];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4FB12A8];
  }

  return v4;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = [WeakRetained collectionView];
  uint64_t v5 = [v4 numberOfItemsInSection:a2];

  return v5;
}

double __51__CNContactListViewController_createCollectionView__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained contentUnavailableCellHeight];
  double v3 = v2;

  return v3;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained collectionViewIsShowingIndexBar];

  return v2;
}

- (double)contentUnavailableCellHeight
{
  BOOL v3 = [(CNContactListViewController *)self isDisplayingContentUnavailableViewAsCell];
  double result = 0.0;
  if (v3)
  {
    uint64_t v5 = [(CNContactListViewController *)self collectionView];
    [v5 frame];
    double Height = CGRectGetHeight(v14);

    [(CNContactListViewController *)self contactListHeaderHeight];
    double v8 = v7;
    uint64_t v9 = [(CNContactListViewController *)self collectionView];
    [v9 directionalLayoutMargins];
    double v11 = v10;
    double v13 = v12;

    return Height - v8 - v11 - v13;
  }
  return result;
}

- (BOOL)collectionViewIsShowingIndexBar
{
  if ([(CNContactListViewController *)self isHandlingSearch]) {
    return 0;
  }
  double v4 = [(CNContactDataSource *)self->_dataSource sections];
  BOOL v3 = (unint64_t)[v4 count] > 1;

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(CNContactListViewController *)self isPathToContentUnavailableRow:v7])
  {
    double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"CNContactListContentUnavailableCellIdentifier" forIndexPath:v7];
    uint64_t v9 = [(CNContactListViewController *)self cellContentUnavailableConfiguration];
    [(__CFString *)v8 setContentConfiguration:v9];
LABEL_6:

    goto LABEL_7;
  }
  if ([(CNContactListViewController *)self isPathToDuplicatesBanner:v7])
  {
    double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"CNContactListDuplicatesBannerIdentifier" forIndexPath:v7];
    [(__CFString *)v8 setDelegate:self];
    double v10 = [(CNContactListViewController *)self contactListStyleApplier];
    [(__CFString *)v8 setContactListStyleApplier:v10];

    if (self->_duplicatesController)
    {
      uint64_t v9 = [(CNContactListViewController *)self duplicatesController];
      [v9 decorateBannerViewCell:v8];
      goto LABEL_6;
    }
    [(__CFString *)v8 updateWithCount:[(CNContactListViewController *)self newDuplicatesCountToDisplay]];
  }
  else if ([(CNContactListViewController *)self isPathToCreateNewContactRow:v7])
  {
    double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"CNContactListAddNewContactCellIdentifier" forIndexPath:v7];
    double v12 = [(__CFString *)v8 defaultContentConfiguration];
    double v13 = CNContactsUIBundle();
    CGRect v14 = [v13 localizedStringForKey:@"ADD_NEW_CONTACT_CELL_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    [v12 setText:v14];

    id v15 = +[CNUIColorRepository contactListAddNewContactLabelTextColor];
    id v16 = [v12 textProperties];
    [v16 setColor:v15];

    [(__CFString *)v8 setContentConfiguration:v12];
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1520]);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v46[3] = &unk_1E549B488;
    v46[4] = self;
    [v17 setActionHandler:v46];
    [v17 setDisplayedState:0];
    v47[0] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    [(__CFString *)v8 setAccessories:v18];
  }
  else if ([(CNContactListViewController *)self isPathToLimitedAccessTipRow:v7])
  {
    double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"CNContactListLimitedAccessTipIdentifier" forIndexPath:v7];
    [(__CFString *)v8 setDelegate:self];
    id v19 = [(CNContactListViewController *)self contactListStyleApplier];
    [(__CFString *)v8 setContactListStyleApplier:v19];

    double v20 = [(CNContactListViewController *)self appName];
    [(__CFString *)v8 updateWithAppName:v20 isLimited:+[CNLimitedAccessPickerSupport isPickerLimitedAccess:[(CNContactListViewController *)self limitedAccessPickerType]]];
  }
  else
  {
    double v21 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v7];
    if ([(CNContactListViewController *)self limitedAccessPickerType] == 6)
    {
      v22 = [v6 dequeueReusableCellWithReuseIdentifier:@"CNLimitedAccessContactListCellIdentifier" forIndexPath:v7];
      v23 = [(CNContactListViewController *)self contactFormatter];
      [v22 setContactFormatter:v23];

      objc_msgSend(v22, "setUserInteractionEnabled:", -[CNContactListViewController canSelectContactAtCollectionViewIndexPath:](self, "canSelectContactAtCollectionViewIndexPath:", v7));
      [v22 setContact:v21];
      objc_msgSend(v22, "setCaption:", -[CNContactListViewController limitedAccessContactCaption](self, "limitedAccessContactCaption"));
      objc_msgSend(v22, "setIsShowingSearchResult:", -[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"));
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
      v44[3] = &unk_1E5498B20;
      double v8 = v22;
      v45 = v8;
      [(CNContactListViewController *)self setImageForContact:v21 imageUpdateBlock:v44];
      v24 = v45;
    }
    else
    {
      BOOL v25 = [(CNContactListViewController *)self isHandlingSearch];
      v26 = @"CNContactListCellIdentifier";
      if (v25) {
        v26 = @"CNSearchListCellIdentifier";
      }
      v24 = v26;
      double v8 = [v6 dequeueReusableCellWithReuseIdentifier:v24 forIndexPath:v7];
      v27 = [(CNContactListViewController *)self contactListStyleApplier];
      [(__CFString *)v8 setContactListStyleApplier:v27];

      v28 = [(CNContactListViewController *)self contactFormatter];
      [(__CFString *)v8 setContactFormatter:v28];

      v29 = [(CNContactDataSource *)self->_dataSource contactMatchInfos];
      v30 = [v21 identifier];
      uint64_t v37 = [v29 objectForKey:v30];

      objc_initWeak(&location, self);
      objc_initWeak(&from, v8);
      v31 = v39;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_3;
      v39[3] = &unk_1E5498798;
      objc_copyWeak(&v40, &from);
      objc_copyWeak(&v41, &location);
      [(__CFString *)v8 setContactMatchInfo:v37 completionBlock:v39];
      [(__CFString *)v8 setUserInteractionEnabled:[(CNContactListViewController *)self canSelectContactAtCollectionViewIndexPath:v7]];
      [(__CFString *)v8 setContact:v21];
      BOOL v32 = [(CNContactListViewController *)self shouldDisplayEmergencyContacts];
      if (v32)
      {
        v31 = [v21 identifier];
        BOOL v33 = [(CNContactListViewController *)self isContactWithIdentifierEmergencyContact:v31];
      }
      else
      {
        BOOL v33 = 0;
      }
      -[__CFString setIsEmergencyContact:](v8, "setIsEmergencyContact:", v33, v37);
      if (v32) {

      }
      double v34 = [v21 identifier];
      [(__CFString *)v8 setIsMeCard:[(CNContactListViewController *)self isContactWithIdentifierMeContactOrLinkedToMeContact:v34]];

      if ([v6 allowsMultipleSelectionDuringEditing]) {
        uint64_t v35 = [v6 isEditing];
      }
      else {
        uint64_t v35 = 0;
      }
      [(__CFString *)v8 setAllowsMultiSelection:v35];
      [(__CFString *)v8 setAllowsMultiSelectContextMenus:[(CNContactListViewController *)self shouldEnableMultiSelectContextMenus]];
      if ([(CNContactListViewController *)self isHandlingSearch])
      {
        double v36 = [(CNContactListViewController *)self contactListStyleApplier];
        [v36 applyContactListStyleToSearchCell:v8];
      }
      else
      {
        double v36 = [(CNContactListViewController *)self contactListStyleApplier];
        [v36 applyContactListStyleToCell:v8];
      }

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
LABEL_7:

  return v8;
}

- (BOOL)isHandlingSearch
{
  return self->_isHandlingSearch;
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (BOOL)shouldEnableMultiSelectContextMenus
{
  if ([(CNContactListViewController *)self allowsMultiSelectContextMenus])
  {
    BOOL v3 = [(CNContactListViewController *)self collectionView];
    int v4 = [v3 isEditing] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)allowsMultiSelectContextMenus
{
  return self->_allowsMultiSelectContextMenus;
}

- (int)limitedAccessPickerType
{
  return self->_limitedAccessPickerType;
}

- (BOOL)shouldDisplayEmergencyContacts
{
  return self->_shouldDisplayEmergencyContacts;
}

- (BOOL)isPathToDuplicatesBanner:(id)a3
{
  id v4 = a3;
  if ([(CNContactListViewController *)self isShowingDuplicatesBanner])
  {
    id v5 = [(CNContactListViewController *)self pathToDuplicatesBanner];
    BOOL v6 = v5 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isContactWithIdentifierMeContactOrLinkedToMeContact:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNContactListViewController *)self preferredForNameMeContact];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 identifier];
    char v8 = [v7 isEqualToString:v4];

    if (v8)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      double v10 = objc_msgSend(v6, "linkedContacts", 0);
      uint64_t v9 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v10);
            }
            double v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) identifier];
            char v14 = [v13 isEqualToString:v4];

            if (v14)
            {
              LOBYTE(v9) = 1;
              goto LABEL_15;
            }
          }
          uint64_t v9 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (CNContact)preferredForNameMeContact
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_preferredForNameMeContact && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dataSource = self->_dataSource;
    id v4 = [(id)objc_opt_class() descriptorForRequiredKeysForPreferredForNameMeContact];
    v10[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    BOOL v6 = [(CNContactDataSource *)dataSource preferredForNameMeContactWithKeysToFetch:v5];
    preferredForNameMeContact = self->_preferredForNameMeContact;
    self->_preferredForNameMeContact = v6;
  }
  char v8 = self->_preferredForNameMeContact;

  return v8;
}

- (BOOL)isContactWithIdentifierEmergencyContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListViewController *)self emergencyContactIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)emergencyContactIdentifiers
{
  return self->_emergencyContactIdentifiers;
}

- (BOOL)canSelectContactAtCollectionViewIndexPath:(id)a3
{
  BOOL v3 = self;
  id v4 = [(CNContactListViewController *)self dataSourceIndexPathForCollectionViewIndexPath:a3];
  LOBYTE(v3) = [(CNContactListViewController *)v3 canSelectContactAtIndexPath:v4];

  return (char)v3;
}

- (BOOL)canSelectContactAtIndexPath:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNContactListViewController *)self _contactAtIndexPath:v4];
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 contactListViewController:self canSelectContact:v7];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)_contactAtCollectionViewIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || -[CNContactListViewController isDuplicatesRowSection:](self, "isDuplicatesRowSection:", [v4 section])|| -[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v5)|| -[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v5)|| -[CNContactListViewController isPathToLimitedAccessTipRow:](self, "isPathToLimitedAccessTipRow:", v5))
  {
    char v6 = 0;
  }
  else
  {
    id v8 = [(CNContactListViewController *)self dataSourceIndexPathForCollectionViewIndexPath:v5];
    char v6 = [(CNContactListViewController *)self _contactAtIndexPath:v8];
  }

  return v6;
}

- (BOOL)isPathToCreateNewContactRow:(id)a3
{
  id v4 = a3;
  if ([(CNContactListViewController *)self shouldDisplayCreateNewContactAsRow])
  {
    id v5 = [(CNContactListViewController *)self pathToCreateNewContactRow];
    BOOL v6 = v5 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isPathToContentUnavailableRow:(id)a3
{
  id v4 = a3;
  if ([(CNContactListViewController *)self isDisplayingContentUnavailableViewAsCell])
  {
    id v5 = [(CNContactListViewController *)self pathToContentUnavailableRow];
    BOOL v6 = v5 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if ([(CNContactListViewController *)self isDuplicatesRowSection:a4]
    || [(CNContactListViewController *)self isCreateNewContactRowSection:a4]
    || [(CNContactListViewController *)self isContentUnavailableRowSection:a4]
    || [(CNContactListViewController *)self isLimitedAccessTipRowSection:a4])
  {
    return 1;
  }
  int64_t v8 = [(CNContactListViewController *)self dataSourceSectionIndexForCollectionViewSection:a4];
  char v9 = [(CNContactListViewController *)self _sections];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    double v10 = [(CNContactDataSource *)self->_dataSource contacts];
    int64_t v6 = [v10 count];
  }
  else
  {
    double v10 = [v9 objectAtIndexedSubscript:v8];
    [v10 range];
    int64_t v6 = v11;
  }

  return v6;
}

- (id)collectionViewIndexPathForDataSourceIndexPath:(id)a3
{
  if (a3)
  {
    id v5 = (void *)MEMORY[0x1E4F28D58];
    id v6 = a3;
    uint64_t v7 = [v6 item];
    uint64_t v8 = [v6 section];

    char v9 = objc_msgSend(v5, "indexPathForItem:inSection:", v7, -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount") + v8);
  }
  else
  {
    char v9 = 0;
  }
  return v9;
}

- (id)dataSourceIndexPathForCollectionViewIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CNContactListViewController dataSourceSectionIndexForCollectionViewSection:](self, "dataSourceSectionIndexForCollectionViewSection:", [v4 section]);
  id v6 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v7 = [v4 item];

  return (id)[v6 indexPathForItem:v7 inSection:v5];
}

- (int64_t)dataSourceSectionIndexForCollectionViewSection:(int64_t)a3
{
  int64_t v4 = [(CNContactListViewController *)self additionalSectionsAtTopCount];
  return (a3 - v4) & ~((a3 - v4) >> 63);
}

- (BOOL)shouldDisplaySupplementaryHeaderItemForSection:(int64_t)a3
{
  if ([(CNContactListViewController *)self hasNoContacts]) {
    return 0;
  }
  if (![(CNContactListViewController *)self isHandlingSearch])
  {
    if (![(CNContactListViewController *)self isDuplicatesRowSection:a3]
      && ![(CNContactListViewController *)self isCreateNewContactRowSection:a3]
      && ![(CNContactListViewController *)self isContentUnavailableRowSection:a3]
      && ![(CNContactListViewController *)self isLimitedAccessTipRowSection:a3])
    {
      uint64_t v7 = [(CNContactListViewController *)self _sections];
      BOOL v5 = (unint64_t)[v7 count] > 1;

      return v5;
    }
    return 0;
  }
  return 1;
}

- (BOOL)isCreateNewContactRowSection:(int64_t)a3
{
  BOOL v5 = [(CNContactListViewController *)self shouldDisplayCreateNewContactAsRow];
  if (v5) {
    LOBYTE(v5) = [(CNContactListViewController *)self createNewContactRowSection] == a3;
  }
  return v5;
}

- (BOOL)isPathToLimitedAccessTipRow:(id)a3
{
  id v4 = a3;
  if ([(CNContactListViewController *)self isShowingLimitedAccessTip])
  {
    id v5 = [(CNContactListViewController *)self pathToLimitedAccessTipRow];
    BOOL v6 = v5 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isContentUnavailableRowSection:(int64_t)a3
{
  BOOL v5 = [(CNContactListViewController *)self isDisplayingContentUnavailableViewAsCell];
  if (v5) {
    LOBYTE(v5) = [(CNContactListViewController *)self contentUnavailableRowSection] == a3;
  }
  return v5;
}

- (BOOL)isLimitedAccessTipRowSection:(int64_t)a3
{
  BOOL v5 = [(CNContactListViewController *)self isShowingLimitedAccessTip];
  if (v5) {
    LOBYTE(v5) = [(CNContactListViewController *)self limitedAccessTipSection] == a3;
  }
  return v5;
}

- (int64_t)additionalSectionsAtTopCount
{
  if ([(CNContactListViewController *)self isDisplayingContentUnavailableViewAsCell])
  {
    return 1;
  }
  BOOL v4 = [(CNContactListViewController *)self isShowingDuplicatesBanner];
  uint64_t v5 = [(CNContactListViewController *)self shouldDisplayCreateNewContactAsRow];
  return v5 + v4 + [(CNContactListViewController *)self isShowingLimitedAccessTip];
}

- (BOOL)isDisplayingContentUnavailableViewAsCell
{
  uint64_t v2 = [(CNContactListViewController *)self cellContentUnavailableConfiguration];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIContentUnavailableConfiguration)cellContentUnavailableConfiguration
{
  return self->_cellContentUnavailableConfiguration;
}

- (BOOL)shouldShowLimitedAccessTip
{
  return self->_shouldShowLimitedAccessTip;
}

- (BOOL)isShowingLimitedAccessTip
{
  if ([(CNContactListViewController *)self hasNoContacts]) {
    return 0;
  }

  return [(CNContactListViewController *)self shouldShowLimitedAccessTip];
}

- (BOOL)shouldDisplayCreateNewContactAsRow
{
  BOOL v3 = [(CNContactListViewController *)self collectionViewShouldDisplayCreateNewContact];
  if (v3) {
    LOBYTE(v3) = ![(CNContactListViewController *)self hasNoContacts];
  }
  return v3;
}

- (BOOL)collectionViewShouldDisplayCreateNewContact
{
  BOOL v3 = [(CNContactListViewController *)self shouldDisplayAddNewContactRow];
  if (v3)
  {
    LOBYTE(v3) = [(CNContactListViewController *)self isViewingTopLevelAllContacts];
  }
  return v3;
}

- (BOOL)shouldDisplayAddNewContactRow
{
  return self->_shouldDisplayAddNewContactRow;
}

- (BOOL)isDuplicatesRowSection:(int64_t)a3
{
  BOOL result = [(CNContactListViewController *)self isShowingDuplicatesBanner];
  if (a3) {
    return 0;
  }
  return result;
}

- (BOOL)isShowingDuplicatesBanner
{
  return self->_isShowingDuplicatesBanner;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isDuplicatesRowSection:a2]
    && ([WeakRetained duplicatesController],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 wantsToDisplayNewDuplicatesBanner:3],
        v4,
        v5))
  {
    BOOL v6 = [WeakRetained duplicatesController];
    if ([v6 isPerformingMerge])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = [WeakRetained duplicatesController];
      uint64_t v7 = [v8 isInMergeCooldown:3];
    }
  }
  else if ([WeakRetained isContentUnavailableRowSection:a2])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [WeakRetained isLimitedAccessTipRowSection:a2] ^ 1;
  }

  return v7;
}

id __257__CNContactListViewController_layoutSectionForLayoutConfiguration_layoutEnvironment_section_contactListStyleApplier_shouldDisplaySupplementaryHeaderItemForSection_headerViewsFloat_directionalLayoutMargins_collectionViewIsShowingIndexBar_contentUnavailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 elementKind];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4FB2770]];

  if (v5 && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    [v3 setPinToVisibleBounds:*(unsigned __int8 *)(a1 + 48)];
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained shouldDisplaySupplementaryHeaderItemForSection:a2];

  return v4;
}

+ (id)descriptorForRequiredKeysForPreferredForNameMeContact
{
  if (descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_token_11 != -1) {
    dispatch_once(&descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_token_11, &__block_literal_global_573);
  }
  uint64_t v2 = (void *)descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_object_11;

  return v2;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"CNContactListLayoutFooterIdentifier"])
  {
    int v17 = [v9 isEqualToString:@"CNContactListLayoutHeaderIdentifier"];
    long long v18 = [(CNContactListViewController *)self collectionView];
    long long v19 = v18;
    if (v17)
    {
      double v12 = [v18 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"CNContactListHeaderViewIdentifier" forIndexPath:v10];

      double v20 = [MEMORY[0x1E4FB1498] clearConfiguration];
      [v12 setBackgroundConfiguration:v20];

      id v16 = [(CNContactListViewController *)self listHeaderView];
      [v12 setHeaderView:v16];
      goto LABEL_17;
    }
    double v12 = [v18 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"CNContactListSectionHeaderFooterIdentifier" forIndexPath:v10];

    id v16 = [(CNContactListViewController *)self dataSourceIndexPathForCollectionViewIndexPath:v10];
    int v21 = [v9 isEqualToString:*MEMORY[0x1E4FB2770]];
    if ([(CNContactListViewController *)self isHandlingSearch])
    {
      v22 = -[CNContactListViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", [v16 section]);
      v23 = [(CNContactListViewController *)self contactListStyleApplier];
      [v23 applyContactListStyleToSearchHeader:v12 withTitle:v22];
    }
    else
    {
      if (!v21)
      {
        [v12 setContentConfiguration:0];
        goto LABEL_17;
      }
      v24 = [(CNContactListViewController *)self view];
      BOOL v25 = [v24 traitCollection];
      uint64_t v26 = [v25 layoutDirection];

      v22 = -[CNContactListViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", [v16 section]);
      v27 = [(CNContactListViewController *)self contactListStyleApplier];

      if (!v27)
      {
        +[CNContactListStyleApplier applyDefaultContactListStyleToHeaderFooter:v12 withTitle:v22 isRTL:v26 == 1];
        goto LABEL_15;
      }
      v23 = [(CNContactListViewController *)self contactListStyleApplier];
      [v23 applyContactListStyleToHeaderFooter:v12 withTitle:v22 isRTL:v26 == 1];
    }

LABEL_15:
    goto LABEL_17;
  }
  int64_t v11 = [(CNContactListViewController *)self collectionView];
  double v12 = [v11 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"CNContactListCountFooterViewIdentifier" forIndexPath:v10];

  double v13 = [MEMORY[0x1E4FB1498] clearConfiguration];
  [v12 setBackgroundConfiguration:v13];

  objc_msgSend(v12, "setShouldHideCountFooter:", +[CNLimitedAccessPickerSupport isPickerLimitedAccess:](CNLimitedAccessPickerSupport, "isPickerLimitedAccess:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")));
  objc_opt_class();
  id v14 = v8;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    [v16 setContactCountView:v12];
    [v12 setDelegate:self];
  }
LABEL_17:

  return v12;
}

void __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) frame];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
  uint64_t v2 = [*(id *)(a1 + 40) view];
  id v3 = [v2 traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  if (*(void *)(a1 + 48))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    if (v4 == 1)
    {
      int64_t v11 = [*(id *)(a1 + 40) view];
      [v11 layoutMargins];
      double v13 = v12;
      id v14 = [*(id *)(a1 + 40) view];
      [v14 layoutMargins];
      double v10 = v10 - (v13 + v15);
    }
    double v16 = *(double *)(a1 + 112);
    int v17 = *(void **)(a1 + 32);
    if (v17)
    {
      [v17 frame];
      double v19 = v18;
      [*(id *)(a1 + 32) frame];
      double v8 = v8 + v19 + v20;
    }
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", v6, v8, v10, v16);
  }
  if (*(void *)(a1 + 56))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    if (v4 == 1)
    {
      v27 = [*(id *)(a1 + 40) view];
      [v27 layoutMargins];
      double v29 = v28;
      v30 = [*(id *)(a1 + 40) view];
      [v30 safeAreaInsets];
      double v26 = v26 - (v29 + v31);
    }
    double v32 = *(double *)(a1 + 128);
    BOOL v33 = *(void **)(a1 + 48);
    if (v33)
    {
      [v33 frame];
      double v35 = v34;
      [*(id *)(a1 + 48) frame];
      double v24 = v24 + v35 + v36;
    }
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", v22, v24, v26, v32);
  }
  if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v37 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 153))
    {
      if (*(unsigned char *)(a1 + 154))
      {
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_2;
        v48[3] = &unk_1E5498810;
        id v49 = *(id *)(a1 + 48);
        id v38 = *(id *)(a1 + 64);
        long long v39 = *(_OWORD *)(a1 + 104);
        long long v55 = *(_OWORD *)(a1 + 136);
        long long v56 = v39;
        uint64_t v40 = *(void *)(a1 + 40);
        id v50 = v38;
        uint64_t v51 = v40;
        id v52 = *(id *)(a1 + 56);
        id v53 = *(id *)(a1 + 32);
        long long v41 = *(_OWORD *)(a1 + 88);
        long long v57 = *(_OWORD *)(a1 + 120);
        long long v58 = v41;
        int8x16_t v54 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
        [v37 performWhenViewIsLaidOut:v48];
      }
      else
      {
        v47 = *(void **)(a1 + 40);
        [v47 tipKitDismissTip];
      }
    }
    else
    {
      double v42 = *(double *)(a1 + 144);
      v43 = [*(id *)(a1 + 40) tipKitContentView];
      [v43 bounds];
      double v44 = v42 - CGRectGetHeight(v60);

      [*(id *)(a1 + 40) tipKitDismissTip];
      double v45 = *(double *)(a1 + 136);
      v46 = *(void **)(a1 + 64);
      objc_msgSend(v46, "setContentOffset:", v45, v44);
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    double v6 = v8;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [v7 cancelAsyncOperations];
  }
}

- (id)_contentUnavailableConfigurationState
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactListViewController;
  id v3 = [(CNContactListViewController *)&v6 _contentUnavailableConfigurationState];
  uint64_t v4 = [(CNContactListViewController *)self filteredSearchString];
  [v3 setSearchControllerText:v4];

  return v3;
}

- (id)filteredSearchString
{
  objc_opt_class();
  id v3 = [(CNContactListViewController *)self dataSource];
  uint64_t v4 = [v3 filter];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 fullTextString];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (CNContactDataSource)dataSource
{
  if ([(CNContactListViewController *)self isSearching])
  {
    id v3 = [(CNContactListViewController *)self searchResultsController];
    uint64_t v4 = [v3 dataSource];
  }
  else
  {
    uint64_t v4 = self->_dataSource;
  }

  return v4;
}

- (BOOL)isSearching
{
  return [(CNContactListSearchController *)self->_searchController isActive];
}

- (CNContactDataSource)originalDataSource
{
  return self->_dataSource;
}

- (void)setupContactListForMultiSelectContextMenus
{
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    if ([(CNContactListViewController *)self shouldEnableMultiSelectContextMenus])
    {
      int v3 = [(CNContactListViewController *)self isHandlingSearch];
      uint64_t v4 = [(CNContactListViewController *)self collectionView];
      int v5 = [v4 allowsMultipleSelection];

      if (v3 == v5)
      {
        id v6 = [(CNContactListViewController *)self collectionView];
        [v6 setAllowsMultipleSelection:v3 ^ 1u];
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    int v5 = [(CNContactListViewController *)self searchResultsController];
    [v5 setDelegate:obj];
  }
}

- (void)setContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    [(CNContactListViewController *)self applyStyle];
  }
}

- (void)setContactFormatter:(id)a3
{
  id v7 = a3;
  id v5 = [(CNContactListViewController *)self contactFormatter];

  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_contactFormatter, a3);
    id v6 = [(CNContactListViewController *)self searchResultsController];
    [v6 setContactFormatter:v7];
  }
}

- (void)setAllowsMultiSelectContextMenus:(BOOL)a3
{
  if (self->_allowsMultiSelectContextMenus != a3)
  {
    self->_allowsMultiSelectContextMenus = a3;
    [(CNContactListViewController *)self setupContactListForMultiSelectContextMenus];
  }
}

- (CNContactListViewController)initWithDataSource:(id)a3 environment:(id)a4 shouldUseLargeTitle:(BOOL)a5
{
  return [(CNContactListViewController *)self initWithDataSource:a3 searchable:1 environment:a4 shouldUseLargeTitle:a5];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

void __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  int v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [v4 emergencyContacts];

  id v7 = +[CNHealthStoreManager identifiersForContactMatchingEmergencyContacts:v6 contactStore:*(void *)(a1 + 32)];

  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_2;
  v10[3] = &unk_1E549BF80;
  v10[4] = WeakRetained;
  id v11 = v8;
  id v9 = v8;
  [WeakRetained performWhenViewIsLaidOut:v10];
}

- (void)performWhenViewIsLaidOut:(id)a3
{
  id v4 = a3;
  id v8 = [(CNContactListViewController *)self pendingLayoutBlocks];
  id v5 = (void *)[v4 copy];

  id v6 = _Block_copy(v5);
  id v7 = [v8 arrayByAddingObject:v6];
  [(CNContactListViewController *)self setPendingLayoutBlocks:v7];
}

- (void)applyStyle
{
  int v3 = [(CNContactListViewController *)self contactListStyleApplier];
  id v4 = [(CNContactListViewController *)self searchBar];
  [v3 applyContactListStyleToSearchBar:v4];

  id v5 = [(CNContactListViewController *)self contactListStyleApplier];
  id v6 = [(CNContactListViewController *)self navigationController];
  id v7 = [v6 navigationBar];
  [v5 applyContactListStyleToNavigationBar:v7];

  id v8 = [(CNContactListViewController *)self contactListStyleApplier];
  id v9 = [(CNContactListViewController *)self collectionView];
  [v8 applyContactListStyleToCollectionView:v9];

  [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
  double v10 = [(CNContactListViewController *)self contactListStyleApplier];
  id v11 = [(CNContactListViewController *)self meContactBanner];
  [v11 setContactListStyleApplier:v10];

  if ([(CNContactListViewController *)self isHandlingSearch])
  {
    double v12 = [(CNContactListViewController *)self contactListStyleApplier];
    double v13 = [(CNContactListViewController *)self searchResultsController];
    [v13 setContactListStyleApplier:v12];
  }
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    id v14 = [(CNContactListViewController *)self collectionView];
    double v15 = [v14 window];

    if (v15)
    {
      uint64_t v16 = *MEMORY[0x1E4F5A258];
      id v20 = [(CNContactListViewController *)self collectionView];
      int v17 = [v20 indexPathsForVisibleItems];
      if ((*(unsigned int (**)(uint64_t, void *))(v16 + 16))(v16, v17))
      {
      }
      else
      {
        double v18 = [(CNContactListViewController *)self collectionView];
        double v19 = [v18 window];

        if (v19)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __41__CNContactListViewController_applyStyle__block_invoke;
          v21[3] = &unk_1E549B488;
          v21[4] = self;
          [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v21];
        }
      }
    }
  }
}

- (void)refreshTableViewHeaderIfVisible
{
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    int v3 = [(CNContactListViewController *)self view];
    id v4 = [v3 window];

    if (v4)
    {
      id v7 = [(CNContactListViewController *)self view];
      [v7 bounds];
      -[CNContactListViewController refreshTableViewHeaderIfVisibleWithSize:](self, "refreshTableViewHeaderIfVisibleWithSize:", v5, v6);
    }
  }
}

- (void)refreshTableViewHeaderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__26684;
  v107 = __Block_byref_object_dispose__26685;
  id v108 = 0;
  double v6 = [(CNContactListViewController *)self collectionView];
  BOOL v7 = [(CNContactListViewController *)self shouldDisplayMeContactBanner];
  BOOL v8 = [(CNContactListViewController *)self shouldDisplaySuggestionsController];
  [v6 contentOffset];
  double v10 = v9;
  double v12 = v11;
  double v13 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNContactListViewController *)self isSearchController])
  {
    BOOL v14 = 0;
LABEL_6:
    int v16 = 0;
    goto LABEL_7;
  }
  if (![(CNContactListViewController *)self shouldDisplayTipContentView]
    || [(CNContactListViewController *)self isSearching])
  {
    double v15 = [(CNContactListViewController *)self tipKitContentView];
    BOOL v14 = v15 != 0;

    goto LABEL_6;
  }
  BOOL v14 = 0;
  int v16 = 1;
LABEL_7:
  if ([(CNContactListViewController *)self shouldDisplayMeContactBanner]) {
    [(CNContactListViewController *)self setupMeBannerAvatarController];
  }
  if ([(CNContactListViewController *)self shouldDisplayListHeaderView])
  {
    BOOL v74 = v14;
    uint64_t v96 = 0;
    v97 = (double *)&v96;
    uint64_t v98 = 0x4010000000;
    v99 = &unk_18BA11DF2;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v100 = *MEMORY[0x1E4F1DB28];
    uint64_t v102 = *((void *)&v17 + 1);
    double v101 = width;
    double v18 = [MEMORY[0x1E4F1CA48] array];
    [v6 adjustedContentInset];
    double v20 = v12 + v19;
    BOOL v73 = v12 + v19 == 0.0;
    if (v14)
    {
      double v21 = [(CNContactListViewController *)self tipKitContentView];
      double v22 = [v21 superview];
      BOOL v23 = v22 != 0;
    }
    else
    {
      BOOL v23 = 0;
    }
    double v29 = *MEMORY[0x1E4F1DB30];
    double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    BOOL v30 = v20 == 0.0 && v23;
    if ((v16 | v30) == 1)
    {
      double v31 = [(CNContactListViewController *)self tipKitContentView];
      [v31 setTranslatesAutoresizingMaskIntoConstraints:1];
      LODWORD(v32) = 1148846080;
      LODWORD(v33) = 1132068864;
      objc_msgSend(v31, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v97[6], 0.0, v32, v33);
      uint64_t v35 = v34;
      double v37 = v36;
      if (v31)
      {
        [v18 addObject:v31];
        uint64_t v72 = v35;
        if (v7)
        {
          BOOL v38 = 0;
          goto LABEL_30;
        }
        goto LABEL_39;
      }
      uint64_t v40 = CNUILogContactList();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v40, OS_LOG_TYPE_ERROR, "Attempting to display tipContentView when view is nil", buf, 2u);
      }

      if (!v7)
      {
        uint64_t v72 = v35;
        double v31 = 0;
LABEL_39:
        long long v39 = 0;
        goto LABEL_40;
      }
    }
    else
    {
      double v37 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      uint64_t v35 = *MEMORY[0x1E4F1DB30];
      if (!v7)
      {
        double v31 = 0;
        long long v39 = 0;
        uint64_t v72 = *MEMORY[0x1E4F1DB30];
        double v37 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_40:
        double v47 = v28;
        double v44 = v29;
LABEL_41:
        BOOL v49 = v23;
        if (v8)
        {
          id v50 = [(CNContactListViewController *)self suggestionsController];
          uint64_t v51 = [v50 view];

          id v52 = [(CNContactListViewController *)self view];
          [v52 bounds];
          double v54 = v53;
          [(CNContactListViewController *)self suggestionsControllerHeight];
          double v28 = v55;

          long long v56 = [(CNContactListViewController *)self suggestionsController];
          [v56 willMoveToParentViewController:self];

          [v18 addObject:v51];
          long long v57 = [(CNContactListViewController *)self suggestionsController];
          [(CNContactListViewController *)self addChildViewController:v57];
          double v29 = v54 + -10.0;
        }
        else
        {
          uint64_t v51 = 0;
        }
        v97[7] = v37 + v47 + v28;
        -[CNContactListViewController setEstimatedListHeaderViewHeight:](self, "setEstimatedListHeaderViewHeight:");
        long long v58 = [(CNContactListViewController *)self listHeaderView];

        if (v58)
        {
          uint64_t v59 = [(CNContactListViewController *)self listHeaderView];
          CGRect v60 = (void *)v104[5];
          v104[5] = v59;

          [(id)v104[5] bounds];
          BOOL v27 = v61 != v97[7];
          objc_msgSend((id)v104[5], "setFrame:", v97[4], v97[5], v97[6], v97[7]);
        }
        else
        {
          id v62 = objc_alloc(MEMORY[0x1E4FB1EB0]);
          uint64_t v63 = objc_msgSend(v62, "initWithFrame:", v97[4], v97[5], v97[6], v97[7]);
          v64 = (void *)v104[5];
          v104[5] = v63;

          BOOL v27 = 1;
        }
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke;
        v76[3] = &unk_1E5498838;
        id v65 = v51;
        v82 = &v103;
        double v84 = v29;
        double v85 = v28;
        id v77 = v65;
        v78 = self;
        id v66 = v31;
        id v79 = v66;
        uint64_t v86 = v72;
        double v87 = v37;
        id v67 = v39;
        id v80 = v67;
        double v88 = v44;
        double v89 = v47;
        BOOL v92 = v74;
        BOOL v93 = v73;
        double v90 = v10;
        double v91 = v12;
        BOOL v94 = v49;
        id v81 = v6;
        v83 = &v96;
        v68 = (void *)[v76 copy];
        v69 = _Block_copy(v68);
        [v13 addObject:v69];

        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_5;
        v75[3] = &unk_1E5498860;
        v75[4] = &v103;
        [v18 enumerateObjectsUsingBlock:v75];

        _Block_object_dispose(&v96, 8);
        goto LABEL_48;
      }
    }
    uint64_t v72 = v35;
    long long v41 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v38 = [v41 userInterfaceIdiom] != 1;

    double v31 = 0;
LABEL_30:
    [(CNContactListViewController *)self updateMeContactBannerContentsWithTopKeyline:v38];
    long long v39 = [(CNContactListViewController *)self meContactBanner];
    double v42 = [(CNContactListViewController *)self meContactBanner];
    objc_msgSend(v42, "sizeThatFits:", width, height);
    double v44 = v43;
    double v46 = v45;

    if (v38) {
      double v47 = v46 + 1.0;
    }
    else {
      double v47 = v46;
    }
    if (v39)
    {
      [v18 addObject:v39];
    }
    else
    {
      id v48 = CNUILogContactList();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v48, OS_LOG_TYPE_ERROR, "Attempting to display meContactBanner when view is nil", buf, 2u);
      }

      long long v39 = 0;
    }
    goto LABEL_41;
  }
  if (!v7)
  {
    double v24 = [(CNContactListViewController *)self environment];
    double v25 = [v24 launchCheckinRegistrar];
    [v25 checkInLaunchTasks:2];
  }
  [(CNContactListBannerView *)self->_meContactBanner removeFromSuperview];
  double v26 = [(CNContactSuggestionsViewController *)self->_suggestionsController view];
  [v26 removeFromSuperview];

  BOOL v27 = 0;
LABEL_48:
  [(CNContactListViewController *)self setListHeaderView:v104[5]];
  objc_msgSend(v6, "setContentOffset:", v10, v12);
  objc_msgSend(v13, "_cn_each:", &__block_literal_global_583);
  if (v27 || [(CNContactListViewController *)self headerViewNeedsUpdate])
  {
    self->_headerViewNeedsUpdate = 0;
    [(CNContactListViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
    v70 = [(CNContactListViewController *)self collectionView];
    v71 = [v70 collectionViewLayout];
    [v71 invalidateLayout];
  }
  _Block_object_dispose(&v103, 8);
}

- (BOOL)shouldDisplayMeContactBanner
{
  if (!self->_shouldDisplayMeContactBanner) {
    return 0;
  }
  int v3 = [(CNContactListViewController *)self preferredForNameMeContact];

  if (v3) {
    return 1;
  }
  double v5 = [(CNContactListViewController *)self meContactBannerFootnoteLabel];
  if (v5)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v6 = [(CNContactListViewController *)self meContactBannerFootnoteValue];
    BOOL v4 = v6 != 0;
  }
  return v4;
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactListViewController;
  [(CNContactListViewController *)&v7 viewDidLayoutSubviews];
  int v3 = [(CNContactListViewController *)self pendingLayoutBlocks];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_430];

  [(CNContactListViewController *)self setPendingLayoutBlocks:MEMORY[0x1E4F1CBF0]];
  if ([(CNContactListViewController *)self pendingSearchControllerActivation])
  {
    BOOL v4 = [(CNContactListViewController *)self searchController];
    [v4 setActive:1];

    [(CNContactListViewController *)self setPendingSearchControllerActivation:0];
  }
  double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v5 userInterfaceIdiom] == 1)
  {
  }
  else
  {
    double v6 = [(CNContactListViewController *)self meContactBanner];

    if (v6) {
      [(CNContactListViewController *)self updateMeContactBannerTopKeyline];
    }
  }
  [(CNContactListViewController *)self layoutSelectButtonView];
}

- (void)updateMeContactBannerTopKeyline
{
  int v3 = [(CNContactListViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  double v6 = [(CNContactListViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = v5 - v7;

  id v17 = [(CNContactListViewController *)self meContactBanner];
  double v9 = [(CNContactListViewController *)self view];
  [v9 frame];
  double v11 = v10;
  double v12 = [(CNContactListViewController *)self view];
  [v12 layoutMargins];
  double v14 = v13;
  double v15 = [(CNContactListViewController *)self view];
  [v15 layoutMargins];
  [v17 setTopSeparatorWithInset:v8 andLength:v11 - (v14 + v16)];
}

- (CNContactListBannerView)meContactBanner
{
  meContactBanner = self->_meContactBanner;
  if (!meContactBanner)
  {
    double v4 = objc_alloc_init(CNContactListBannerView);
    double v5 = self->_meContactBanner;
    self->_meContactBanner = v4;

    [(CNContactListBannerView *)self->_meContactBanner setDelegate:self];
    meContactBanner = self->_meContactBanner;
  }

  return meContactBanner;
}

- (void)setPendingLayoutBlocks:(id)a3
{
}

- (NSArray)pendingLayoutBlocks
{
  return self->_pendingLayoutBlocks;
}

- (BOOL)pendingSearchControllerActivation
{
  return self->_pendingSearchControllerActivation;
}

- (UIView)listHeaderView
{
  return self->_listHeaderView;
}

- (BOOL)isSearchController
{
  return 0;
}

- (BOOL)shouldDisplayTipContentView
{
  uint64_t v2 = [(CNContactListViewController *)self tipKitContentView];
  int v3 = v2;
  if (v2)
  {
    double v4 = [v2 superview];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)tipKitContentView
{
  uint64_t v2 = +[CNTipsHelper shared];
  int v3 = [v2 currentTipView];

  return v3;
}

- (BOOL)shouldDisplaySuggestionsController
{
  return self->_shouldDisplaySuggestionsController
      && [(CNContactListViewController *)self isViewingTopLevelAllContacts];
}

- (void)viewDidLoad
{
  v58.receiver = self;
  v58.super_class = (Class)CNContactListViewController;
  [(CNContactListViewController *)&v58 viewDidLoad];
  int v3 = [(CNContactListViewController *)self view];
  [v3 setAccessibilityIdentifier:@"ContactsListView"];

  if ([(CNContactListViewController *)self presentsSearchUI])
  {
    double v4 = (void *)[(CNContactDataSource *)self->_dataSource copyWithZone:0];
    if (objc_opt_respondsToSelector()) {
      [v4 reset];
    }
    BOOL v5 = [CNContactListViewSearchController alloc];
    double v6 = [(CNContactListViewController *)self environment];
    double v7 = [(CNContactListViewController *)v5 initWithDataSource:v4 searchable:0 environment:v6 shouldUseLargeTitle:0];
    [(CNContactListViewController *)self setSearchResultsController:v7];

    uint64_t v8 = [(CNContactListViewController *)self limitedAccessPickerType];
    double v9 = [(CNContactListViewController *)self searchResultsController];
    [v9 setLimitedAccessPickerType:v8];

    unint64_t v10 = [(CNContactListViewController *)self limitedAccessContactCaption];
    double v11 = [(CNContactListViewController *)self searchResultsController];
    [v11 setLimitedAccessContactCaption:v10];

    BOOL v12 = [(CNContactListViewController *)self disableContextMenus];
    double v13 = [(CNContactListViewController *)self searchResultsController];
    [v13 setDisableContextMenus:v12];

    BOOL v14 = [(CNContactListViewController *)self shouldAllowDrags];
    double v15 = [(CNContactListViewController *)self searchResultsController];
    [v15 setShouldAllowDrags:v14];

    double v16 = [(CNContactListViewController *)self searchResultsController];
    [v16 setShouldAllowDrops:0];

    id v17 = [(CNContactListViewController *)self searchResultsController];
    [v17 setShouldDisplayCount:0];

    double v18 = [(CNContactListViewController *)self contactFormatter];
    double v19 = [(CNContactListViewController *)self searchResultsController];
    [v19 setContactFormatter:v18];

    double v20 = [(CNContactListViewController *)self delegate];
    double v21 = [(CNContactListViewController *)self searchResultsController];
    [v21 setDelegate:v20];

    double v22 = [(CNContactListViewController *)self searchResultsController];
    BOOL v23 = [(CNContactListViewController *)self searchResultsController];
    double v24 = [v23 dataSource];
    [v24 setDelegate:v22];

    double v25 = [(CNContactListViewController *)self contactListStyleApplier];
    double v26 = [(CNContactListViewController *)self searchResultsController];
    [v26 setContactListStyleApplier:v25];

    BOOL v27 = [(CNContactListViewController *)self allowsMultiSelectContextMenus];
    double v28 = [(CNContactListViewController *)self searchResultsController];
    [v28 setAllowsMultiSelectContextMenus:v27];

    double v29 = [(CNContactListViewController *)self searchResultsController];
    [v29 setShouldHideDuplicates:1];

    BOOL v30 = [CNContactListSearchController alloc];
    double v31 = [(CNContactListViewController *)self searchResultsController];
    double v32 = [(CNContactListSearchController *)v30 initWithSearchResultsController:v31];

    [(CNContactListSearchController *)v32 setSearchResultsUpdater:self];
    [(CNContactListSearchController *)v32 setRestorationIdentifier:@"UISearchControllerRestorationIdentifier"];
    [(CNContactListSearchController *)v32 setDelegate:self];
    double v33 = [MEMORY[0x1E4FB1618] linkColor];
    uint64_t v34 = [(CNContactListSearchController *)v32 searchBar];
    [v34 setTintColor:v33];

    [(CNContactListViewController *)self setSearchController:v32];
    uint64_t v35 = [(CNContactListViewController *)self navigationItem];
    [v35 setSearchController:v32];

    double v36 = [(CNContactListViewController *)self navigationItem];
    [v36 setHidesSearchBarWhenScrolling:0];

    if ([(CNContactListViewController *)self hasPickerPrivacyUI])
    {
      [(CNContactListViewController *)self setShouldShowLimitedAccessTip:+[CNPrivateAccessAggregator shouldShowPickerTipForBundleIdentifier:self->_limitedAccessAppBundleId]];
      uint64_t v37 = [(CNContactListViewController *)self shouldShowLimitedAccessTip] ^ 1;
      BOOL v38 = [CNContactListPrivacyTitleView alloc];
      long long v39 = [(CNContactListViewController *)self navigationItem];
      uint64_t v40 = [v39 title];
      long long v41 = [(CNContactListPrivacyTitleView *)v38 initWithTitle:v40 hasIcon:v37];

      double v42 = [(CNContactListViewController *)self navigationItem];
      [v42 setTitleView:v41];
    }
    double v43 = [(CNContactListViewController *)self navigationItem];
    [v43 setPreferredSearchBarPlacement:2];

    double v44 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    double v45 = [v44 featureFlags];
    int v46 = [v45 isFeatureEnabled:15];

    if (v46)
    {
      double v47 = [(CNContactListViewController *)self navigationItem];
      [v47 setBackButtonDisplayMode:2];
    }
    [(CNContactListViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
    id v48 = [(CNContactListSearchController *)v32 searchBar];
    BOOL v49 = CNContactsUIBundle();
    id v50 = [v49 localizedStringForKey:@"SEARCH_LOCAL_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
    [v48 setPlaceholder:v50];

    [v48 setAutoresizingMask:2];
    [v48 setAutocorrectionType:1];
    [v48 setDelegate:self];
    [v48 sizeToFit];
    [v48 setAutoresizingMask:2];
    [(CNContactListViewController *)self setSearchBar:v48];
    uint64_t v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v52 = *MEMORY[0x1E4FB3020];
    double v53 = [v48 searchField];
    [v51 addObserver:self selector:sel__searchBarDidEndEditing_ name:v52 object:v53];
  }
  if ([(CNContactListViewController *)self shouldAllowDrags])
  {
    double v54 = [(CNContactListViewController *)self collectionView];
    [v54 setDragSourceDelegate:self];
  }
  if ([(CNContactListViewController *)self shouldAllowDrops])
  {
    double v55 = [(CNContactListViewController *)self collectionView];
    [v55 setDragDestinationDelegate:self];
  }
  long long v56 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_dismissKeyboard];
  [v56 setCancelsTouchesInView:0];
  long long v57 = [(CNContactListViewController *)self collectionView];
  [v57 addGestureRecognizer:v56];
}

- (CNContactListViewController)searchResultsController
{
  return self->_searchResultsController;
}

- (BOOL)shouldAllowDrags
{
  return self->_shouldAllowDrags;
}

- (void)layoutSelectButtonView
{
  int v3 = [(CNContactListViewController *)self collectionView];
  double v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount"));
  id v38 = [v3 layoutAttributesForItemAtIndexPath:v4];

  BOOL v5 = [(CNContactListViewController *)self searchBar];
  [v38 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(CNContactListViewController *)self view];
  objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
  double v16 = v15;

  id v17 = [(CNContactListViewController *)self collectionView];
  [v17 frame];
  double v19 = v18;
  double v20 = [(CNContactListViewController *)self collectionView];
  [v20 layoutMargins];
  double v22 = v19 - v21;
  BOOL v23 = [(CNContactListViewController *)self selectButton];
  [v23 bounds];
  double v25 = v22 - v24 + -20.0;

  double v26 = [(CNContactListViewController *)self searchBar];
  [v26 bounds];
  double v28 = v16 + v27;
  [(CNContactListViewController *)self selectAllButtonOffsetAccountingForSectionHeaders];
  double v30 = v28 + v29;

  double v31 = [(CNContactListViewController *)self selectButton];
  [v31 bounds];
  double v33 = v32;

  uint64_t v34 = [(CNContactListViewController *)self selectButton];
  [v34 bounds];
  double v36 = v35;

  uint64_t v37 = [(CNContactListViewController *)self selectButtonView];
  objc_msgSend(v37, "setFrame:", v25, v30, v36, v33);
}

- (UIButton)selectButton
{
  return self->_selectButton;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (UIView)selectButtonView
{
  return self->_selectButtonView;
}

- (float)selectAllButtonOffsetAccountingForSectionHeaders
{
  int v3 = [(CNContactListViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];
  int64_t v5 = [(CNContactListViewController *)self additionalSectionsAtTopCount] + 1;

  LODWORD(v6) = 8.0;
  if (v4 > v5)
  {
    BOOL v7 = [(CNContactListViewController *)self isShowingLimitedAccessTip];
    LODWORD(v6) = -1036779520;
    if (v7) {
      *(float *)&double v6 = -40.0;
    }
  }
  return *(float *)&v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CNContactListViewController *)self isCurrentViewStillOpen])
  {
    v25.receiver = self;
    v25.super_class = (Class)CNContactListViewController;
    [(CNContactListViewController *)&v25 viewWillAppear:v3];
    [(CNContactListViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
    [(CNContactListViewController *)self configureNavigationBarForLargeTitles];
    uint64_t v5 = [(CNContactListViewController *)self splitViewController];
    if (!v5
      || (double v6 = (void *)v5,
          [(CNContactListViewController *)self splitViewController],
          BOOL v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isCollapsed],
          v7,
          v6,
          v8))
    {
      [(CNContactListViewController *)self deselectAllSelectedIndexPathsAnimated:v3];
      [(CNContactListViewController *)self adjustTableViewOffsetForIncomingSearchUI];
    }
    if (![(CNContactListViewController *)self isSearchController]) {
      [(CNContactListViewController *)self tipKitStartObservation];
    }
    uint64_t v9 = [(CNContactListViewController *)self indexPathToSelect];
    if (v9)
    {
      double v10 = (void *)v9;
      uint64_t v11 = [(CNContactListViewController *)self listHeaderView];
      if (v11)
      {
        double v12 = (void *)v11;
        double v13 = [(CNContactListViewController *)self indexPathToSelect];
        BOOL v14 = [(CNContactListViewController *)self isValidIndexPath:v13];

        if (v14)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __46__CNContactListViewController_viewWillAppear___block_invoke;
          block[3] = &unk_1E549B488;
          block[4] = self;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
      else
      {
      }
    }
    if (+[CNLimitedAccessPickerSupport isPickerLimitedAccess:[(CNContactListViewController *)self limitedAccessPickerType]])
    {
      [(CNContactListViewController *)self setupViewWithLimitedAccessContactSelection];
      if (+[CNLimitedAccessPickerSupport shouldLimitedAccessPickerSupportSelectAll:[(CNContactListViewController *)self limitedAccessPickerType]])
      {
        [(CNContactListViewController *)self addSelectButtonView];
      }
      if (!+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithLists:[(CNContactListViewController *)self limitedAccessPickerType]])[(CNContactListViewController *)self disableSearchUI]; {
    }
      }
    if ([(CNContactListViewController *)self hasPickerPrivacyUI])
    {
      objc_opt_class();
      double v15 = [(CNContactListViewController *)self navigationItem];
      double v16 = [v15 titleView];
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
      id v18 = v17;

      double v19 = [(CNContactListViewController *)self navigationItem];
      double v20 = [v19 title];
      [v18 setTitle:v20];
    }
    [(CNContactListViewController *)self applyStyle];
    double v21 = [(CNContactListViewController *)self collectionView];
    if ([v21 isEditing])
    {
      double v22 = [(CNContactListViewController *)self collectionView];
      int v23 = [v22 allowsMultipleSelectionDuringEditing];

      if (v23)
      {
        [(CNContactListViewController *)self _updateCountStringNow:1];
        [(CNContactListViewController *)self updateSelectedContactCount];
      }
    }
    else
    {
    }
  }
}

- (BOOL)hasPickerPrivacyUI
{
  return self->_hasPickerPrivacyUI;
}

- (void)tipKitStartObservation
{
  id v3 = +[CNTipsHelper shared];
  [v3 tipKitStartObservation:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CNContactListViewController;
  [(CNContactListViewController *)&v13 viewDidAppear:a3];
  [(CNContactListViewController *)self setIsCurrentViewStillOpen:1];
  [(CNContactListViewController *)self setDidDeleteContact:0];
  uint64_t v4 = [(CNContactDataSource *)self->_dataSource delegate];

  if (v4 != self) {
    [(CNContactDataSource *)self->_dataSource setDelegate:self];
  }
  if (![(CNContactListViewController *)self isHandlingSearch]) {
    [(UICollectionViewController *)self _cnui_updateAccountsRefreshControl];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CNContactListViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  char v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  double v6 = [(CNContactListViewController *)self listHeaderView];
  [v6 frame];
  double v8 = v7;
  uint64_t v9 = [(CNContactListViewController *)self view];
  [v9 frame];
  double v11 = v10;

  if ((v5 & 1) != 0 || v8 != v11) {
    [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
  }
  if ([(CNContactListViewController *)self shouldEnableMultiSelectContextMenus]) {
    [(CNContactListViewController *)self setupContactListForMultiSelectContextMenus];
  }
  if ([(CNContactListViewController *)self shouldDisplayEmergencyContacts]) {
    [(CNContactListViewController *)self startHandlingEmergencyContacts];
  }
}

- (void)updateMeContactBannerContentsWithTopKeyline:(BOOL)a3
{
  BOOL v3 = a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  double v6 = [(CNContactListViewController *)self preferredForNameMeContact];
  double v7 = [(CNContactListViewController *)self meContactBanner];
  double v8 = [(CNContactListViewController *)self contactStore];
  [v7 setContactStore:v8];

  if (v6)
  {
    uint64_t v9 = [(CNContactListViewController *)self meBannerAvatarController];

    if (!v9)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"_CNContactListViewController.m" lineNumber:2885 description:@"Avatar Controller should be created in init"];
    }
    v19[0] = v6;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    double v11 = [(CNContactListViewController *)self meBannerAvatarController];
    [v11 setContacts:v10];
  }
  else
  {
    double v10 = [(id)objc_opt_class() emptyContact];
    id v18 = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    double v12 = [(CNContactListViewController *)self meBannerAvatarController];
    [v12 setContacts:v11];
  }
  objc_super v13 = [(CNContactListViewController *)self meBannerAvatarController];
  BOOL v14 = [v13 view];
  [v7 setAvatarView:v14];

  double v15 = [(CNContactListViewController *)self meContactBannerFootnoteLabel];
  double v16 = [(CNContactListViewController *)self meContactBannerFootnoteValue];
  [v7 setMeContact:v6 footnoteTitle:v15 footnoteValue:v16];

  if (v3) {
    [(CNContactListViewController *)self updateMeContactBannerTopKeyline];
  }
}

- (void)startHandlingEmergencyContacts
{
  BOOL v3 = [(CNContactListViewController *)self medicalIDLookupToken];

  if (!v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = [(CNContactListViewController *)self contactStore];
    char v5 = [(CNContactListViewController *)self environment];
    double v6 = [v5 healthStoreManager];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke;
    v16[3] = &unk_1E549BBA8;
    objc_copyWeak(&v18, &location);
    id v7 = v4;
    id v17 = v7;
    double v8 = [v6 registerMedicalIDDataHandler:v16];
    [(CNContactListViewController *)self setMedicalIDLookupRegistrationToken:v8];
    uint64_t v9 = (void *)MEMORY[0x1E4F5A368];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_5;
    v13[3] = &unk_1E549BF80;
    id v10 = v6;
    id v14 = v10;
    id v11 = v8;
    id v15 = v11;
    double v12 = [v9 tokenWithCancelationBlock:v13];
    [(CNContactListViewController *)self setMedicalIDLookupToken:v12];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldDisplayListHeaderView
{
  BOOL v3 = [(CNContactListViewController *)self shouldDisplayMeContactBanner];
  BOOL v4 = [(CNContactListViewController *)self shouldDisplaySuggestionsController];
  if ([(CNContactListViewController *)self isSearchController])
  {
    BOOL v5 = 0;
  }
  else
  {
    if ([(CNContactListViewController *)self shouldDisplayTipContentView]
      && ![(CNContactListViewController *)self isSearching])
    {
      return 1;
    }
    double v6 = [(CNContactListViewController *)self tipKitContentView];
    BOOL v5 = v6 != 0;
  }
  return v3 || v5 || v4;
}

- (BOOL)shouldAllowDrops
{
  return self->_shouldAllowDrops;
}

- (void)setupMeBannerAvatarController
{
  BOOL v3 = [(CNContactListViewController *)self meBannerAvatarController];

  if (!v3)
  {
    BOOL v4 = [(CNContactListViewController *)self contactStore];
    id v16 = [v4 mainContactStore];

    id v5 = objc_alloc(MEMORY[0x1E4F5A6E0]);
    double v6 = [(CNContactListViewController *)self environment];
    id v7 = [v6 defaultSchedulerProvider];
    double v8 = (void *)[v5 initWithContactStore:v16 schedulerProvider:v7];

    [v8 setProhibitedSources:8];
    uint64_t v9 = [(CNContactListViewController *)self environment];
    id v10 = [v9 defaultSchedulerProvider];

    id v11 = [MEMORY[0x1E4F5A6C0] rendererWithLikenessResolver:v8 schedulerProvider:v10];
    double v12 = +[CNAvatarViewControllerSettings settingsWithLikenessResolver:v8 likenessRenderer:v11 contactStore:v16 threeDTouchEnabled:0 schedulerProvider:v10 backgroundStyle:0];
    objc_super v13 = [[CNAvatarViewController alloc] initWithSettings:v12];
    [(CNContactListViewController *)self setMeBannerAvatarController:v13];

    id v14 = [(CNContactListViewController *)self meBannerAvatarController];
    [v14 setObjectViewControllerDelegate:self];

    id v15 = [(CNContactListViewController *)self meBannerAvatarController];
    [v15 setDelegate:self];
  }
}

- (CNAvatarViewController)meBannerAvatarController
{
  return self->_meBannerAvatarController;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContactStore)contactStore
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(CNContactDataSource *)self->_dataSource store];
  }
  else
  {
    BOOL v4 = [(CNContactListViewController *)self environment];
    BOOL v3 = [v4 inProcessContactStore];
  }

  return (CNContactStore *)v3;
}

- (void)setShouldHideDuplicates:(BOOL)a3
{
  self->_shouldHideDuplicates = a3;
}

- (void)setShouldDisplayCount:(BOOL)a3
{
  self->_shouldDisplayCount = a3;
}

- (void)setShouldAllowDrops:(BOOL)a3
{
  self->_shouldAllowDrops = a3;
}

- (void)setShouldAllowDrags:(BOOL)a3
{
  self->_shouldAllowDrags = a3;
}

- (void)setSearchResultsController:(id)a3
{
}

- (void)setSearchController:(id)a3
{
}

- (void)setSearchBar:(id)a3
{
}

- (void)setMedicalIDLookupToken:(id)a3
{
}

- (void)setMedicalIDLookupRegistrationToken:(id)a3
{
}

- (void)setMeBannerAvatarController:(id)a3
{
}

- (void)setListHeaderView:(id)a3
{
}

- (void)setLimitedAccessPickerType:(int)a3
{
  self->_limitedAccessPickerType = a3;
}

- (void)setLimitedAccessContactCaption:(unint64_t)a3
{
  self->_limitedAccessContactCaption = a3;
}

- (void)setIsCurrentViewStillOpen:(BOOL)a3
{
  self->_isCurrentViewStillOpen = a3;
}

- (void)setEstimatedListHeaderViewHeight:(double)a3
{
  self->_estimatedListHeaderViewdouble Height = a3;
}

- (void)setDisableContextMenus:(BOOL)a3
{
  self->_disableContextMenus = a3;
}

- (void)setDidDeleteContact:(BOOL)a3
{
  self->_didDeleteContact = a3;
}

- (BOOL)presentsSearchUI
{
  return self->_presentsSearchUI;
}

- (CNCancelable)medicalIDLookupToken
{
  return self->_medicalIDLookupToken;
}

- (NSString)meContactBannerFootnoteValue
{
  return self->_meContactBannerFootnoteValue;
}

- (NSString)meContactBannerFootnoteLabel
{
  return self->_meContactBannerFootnoteLabel;
}

- (unint64_t)limitedAccessContactCaption
{
  return self->_limitedAccessContactCaption;
}

- (BOOL)isCurrentViewStillOpen
{
  return self->_isCurrentViewStillOpen;
}

- (NSIndexPath)indexPathToSelect
{
  return self->_indexPathToSelect;
}

- (BOOL)disableContextMenus
{
  return self->_disableContextMenus;
}

- (void)deselectAllSelectedIndexPathsAnimated:(BOOL)a3
{
  id v5 = [(CNContactListViewController *)self collectionView];
  double v6 = [v5 indexPathsForSelectedItems];

  if ([(CNContactListViewController *)self isSearching])
  {
    id v7 = [(CNContactListViewController *)self searchResultsController];
    double v8 = [v7 collectionView];
    uint64_t v9 = [v8 indexPathsForSelectedItems];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *MEMORY[0x1E4F5A258];
  if (((*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v6) & 1) == 0)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke;
    v18[3] = &unk_1E54986F8;
    v18[4] = self;
    BOOL v19 = a3;
    objc_msgSend(v6, "_cn_each:", v18);
  }
  if (((*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v9) & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_2;
    v16[3] = &unk_1E54986F8;
    void v16[4] = self;
    BOOL v17 = a3;
    objc_msgSend(v9, "_cn_each:", v16);
  }
  suggestionsController = self->_suggestionsController;
  if (suggestionsController)
  {
    double v12 = [(CNContactSuggestionsViewController *)suggestionsController collectionView];
    objc_super v13 = [v12 indexPathsForSelectedItems];

    if (((*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v13) & 1) == 0)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_3;
      v14[3] = &unk_1E54986F8;
      v14[4] = self;
      BOOL v15 = a3;
      objc_msgSend(v13, "_cn_each:", v14);
    }
  }
}

- (CNContactListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListViewControllerDelegate *)WeakRetained;
}

- (void)configureNavigationBarForLargeTitles
{
  if ([(CNContactListViewController *)self shouldUseLargeTitle])
  {
    BOOL v3 = [(CNContactListViewController *)self navigationController];
    BOOL v4 = [v3 navigationBar];
    [v4 setPrefersLargeTitles:1];
  }
  if ([(CNContactListViewController *)self shouldUseLargeTitle]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [(CNContactListViewController *)self navigationItem];
  [v6 setLargeTitleDisplayMode:v5];
}

- (BOOL)shouldUseLargeTitle
{
  return self->_shouldUseLargeTitle;
}

- (void)setTipKitContext:(id)a3
{
  id v3 = a3;
  id v4 = +[CNTipsHelper shared];
  [v4 tipKitSetSiriTipContext:v3];
}

- (void)adjustTableViewOffsetForIncomingSearchUI
{
  id v3 = [(CNContactListViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;

  if (v5 == 0.0)
  {
    uint64_t v6 = *MEMORY[0x1E4F5A258];
    id v7 = [(CNContactListViewController *)self collectionView];
    double v8 = [v7 indexPathsForSelectedItems];
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v8))
    {
      BOOL v9 = [(CNContactListViewController *)self didDeleteContact];

      if (!v9) {
        return;
      }
    }
    else
    {
    }
    if ([(CNContactListViewController *)self presentsSearchUI])
    {
      if ([(CNContactListViewController *)self isMovingToParentViewController])
      {
        uint64_t v10 = [(CNContactListViewController *)self searchController];
        if (v10)
        {
          id v11 = (void *)v10;
          double v12 = [(CNContactListViewController *)self searchController];
          objc_super v13 = [v12 searchBar];

          if (v13)
          {
            id v14 = [(CNContactListViewController *)self collectionView];
            [v14 contentOffset];
            double v16 = v15;

            BOOL v17 = [(CNContactListViewController *)self navigationController];
            id v18 = [v17 navigationBar];
            [v18 bounds];
            double v20 = v19;

            id v21 = [(CNContactListViewController *)self collectionView];
            objc_msgSend(v21, "setContentOffset:", v16, v20);
          }
        }
      }
    }
  }
}

- (BOOL)didDeleteContact
{
  return self->_didDeleteContact;
}

- (void)loadView
{
  id v6 = [(CNContactListViewController *)self createCollectionView];
  [v6 setDataSource:self];
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v3 userInterfaceIdiom] == 1)
  {
    char v4 = objc_opt_respondsToSelector();

    double v5 = v6;
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    [v6 _setSectionHeaderFooterPadding:8.0];
  }
  else
  {
  }
  double v5 = v6;
LABEL_6:
  [v5 setKeyboardDismissMode:1];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CNContactListCellIdentifier"];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CNLimitedAccessContactListCellIdentifier"];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CNSearchListCellIdentifier"];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CNContactListDuplicatesBannerIdentifier"];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CNContactListAddNewContactCellIdentifier"];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CNContactListContentUnavailableCellIdentifier"];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CNContactListLimitedAccessTipIdentifier"];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"CNContactListSectionHeaderFooterIdentifier"];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"CNContactListLayoutHeaderIdentifier" withReuseIdentifier:@"CNContactListHeaderViewIdentifier"];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"CNContactListLayoutFooterIdentifier" withReuseIdentifier:@"CNContactListCountFooterViewIdentifier"];
  [(CNContactListViewController *)self setCollectionView:v6];
  [(CNContactListViewController *)self _updateCountStringNow:0];
  [(CNContactListViewController *)self updateIsViewingTopLevelAllContacts];
  [(CNContactListViewController *)self refreshTableViewHeader];
}

- (void)updateIsViewingTopLevelAllContacts
{
  if ([(CNContactListViewController *)self isHandlingSearch])
  {
    self->_isViewingTopLevelAllContacts = 0;
  }
  else
  {
    objc_opt_class();
    id v3 = [(CNContactListViewController *)self dataSource];
    if (objc_opt_isKindOfClass()) {
      char v4 = v3;
    }
    else {
      char v4 = 0;
    }
    id v5 = v4;

    if (v5)
    {
      if ([(CNContactListViewController *)self isShowingAllContacts])
      {
        self->_isViewingTopLevelAllContacts = 1;
      }
      else
      {
        id v6 = [(CNContactListViewController *)self contactStore];
        uint64_t v11 = 0;
        id v7 = [v6 containersMatchingPredicate:0 error:&v11];

        if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
        {
          self->_isViewingTopLevelAllContacts = 1;
        }
        else
        {
          double v8 = [v5 filter];
          BOOL v9 = [v8 containerIdentifiers];
          uint64_t v10 = [v9 count];
          self->_isViewingTopLevelAllContacts = v10 == [v7 count];
        }
      }
    }
    else
    {
      self->_isViewingTopLevelAllContacts = 0;
    }
  }
}

- (void)refreshTableViewHeader
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactListViewController *)self view];
  [v3 bounds];
  if (v4 <= 0.0)
  {
  }
  else
  {
    id v5 = [(CNContactListViewController *)self view];
    [v5 bounds];
    double v7 = v6;

    if (v7 > 0.0)
    {
      id v19 = [(CNContactListViewController *)self view];
      [v19 bounds];
      -[CNContactListViewController refreshTableViewHeaderWithSize:](self, "refreshTableViewHeaderWithSize:", v8, v9);

      return;
    }
  }
  uint64_t v10 = CNUILogContactList();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(CNContactListViewController *)self view];
    [v14 bounds];
    uint64_t v16 = v15;
    BOOL v17 = [(CNContactListViewController *)self view];
    [v17 bounds];
    *(_DWORD *)buf = 134218240;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = v18;
    _os_log_debug_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEBUG, "Attempted to refresh list header view when superview has width or height of 0.0 (%.2f x %.2f), skipping refresh", buf, 0x16u);
  }
  uint64_t v11 = [(CNContactListViewController *)self listHeaderView];

  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    objc_super v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNContactListViewController *)self setListHeaderView:v13];
  }
}

- (BOOL)isShowingAllContacts
{
  objc_opt_class();
  id v3 = [(CNContactListViewController *)self dataSource];
  double v4 = [v3 filter];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    char v7 = [v6 showsEverything];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)createCollectionView
{
  BOOL v3 = [(CNContactListViewController *)self isHandlingSearch];
  objc_initWeak(location, self);
  double v9 = [CNContactListCollectionView alloc];
  uint64_t v10 = objc_opt_class();
  double v4 = [(CNContactListViewController *)self contactListStyleApplier];
  id v5 = [(CNContactListViewController *)self trailingSwipeActionsConfigurationProvider];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__CNContactListViewController_createCollectionView__block_invoke;
  v21[3] = &unk_1E5498570;
  objc_copyWeak(&v22, location);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __51__CNContactListViewController_createCollectionView__block_invoke_2;
  v19[3] = &unk_1E5498570;
  objc_copyWeak(&v20, location);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__CNContactListViewController_createCollectionView__block_invoke_3;
  v17[3] = &unk_1E5498598;
  objc_copyWeak(&v18, location);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__CNContactListViewController_createCollectionView__block_invoke_4;
  v15[3] = &unk_1E54985C0;
  objc_copyWeak(&v16, location);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CNContactListViewController_createCollectionView__block_invoke_5;
  v13[3] = &unk_1E54985E8;
  objc_copyWeak(&v14, location);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__CNContactListViewController_createCollectionView__block_invoke_6;
  v11[3] = &unk_1E5498610;
  objc_copyWeak(&v12, location);
  id v6 = [v10 collectionViewLayoutWithFloatingHeaderViews:!v3 contactListStyleApplier:v4 trailingSwipeActionsProvider:v5 shouldDisplaySupplementaryHeaderItemForSection:v21 shouldShowSeparatorsForSection:v19 directionalLayoutMargins:v17 collectionViewIsShowingIndexBar:v15 numberOfItemsInSection:v13 contentUnavailable:v11];
  char v7 = -[CNContactListCollectionView initWithFrame:collectionViewLayout:](v9, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(CNContactListCollectionView *)v7 setDragDelegate:self];
  [(CNContactListCollectionView *)v7 setDropDelegate:self];
  [(CNContactListCollectionView *)v7 setSelectionFollowsFocus:1];
  [(CNContactListCollectionView *)v7 setCountViewDelegate:self];
  [(CNContactListCollectionView *)v7 setContactListCollectionViewDelegate:self];
  [(CNContactListCollectionView *)v7 _setAllowsVisibleCellUpdatesDuringUpdateAnimations:1];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(location);

  return v7;
}

- (id)trailingSwipeActionsConfigurationProvider
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__CNContactListViewController_trailingSwipeActionsConfigurationProvider__block_invoke;
  v5[3] = &unk_1E5498638;
  objc_copyWeak(&v6, &location);
  uint64_t v2 = _Block_copy(v5);
  BOOL v3 = _Block_copy(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)_updateCountStringNow:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v5 = [(CNContactListViewController *)self collectionView];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CNContactListViewController__updateCountStringNow___block_invoke;
    aBlock[3] = &unk_1E549B488;
    aBlock[4] = self;
    char v7 = _Block_copy(aBlock);
    double v8 = v7;
    if (v3)
    {
      (*((void (**)(void *))v7 + 2))(v7);
    }
    else
    {
      double v9 = dispatch_get_global_queue(9, 0);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __53__CNContactListViewController__updateCountStringNow___block_invoke_2;
      v10[3] = &unk_1E549B8A0;
      id v11 = v8;
      dispatch_async(v9, v10);
    }
  }
}

- (CNContactListViewController)initWithDataSource:(id)a3 searchable:(BOOL)a4 environment:(id)a5 shouldUseLargeTitle:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  objc_super v13 = +[CNContactListViewController collectionViewLayout];
  v25.receiver = self;
  v25.super_class = (Class)CNContactListViewController;
  id v14 = [(CNContactListViewController *)&v25 initWithCollectionViewLayout:v13];

  if (v14)
  {
    [(CNContactListViewController *)v14 setClearsSelectionOnViewWillAppear:0];
    objc_storeStrong((id *)&v14->_environment, a5);
    objc_storeStrong((id *)&v14->_dataSource, a3);
    v14->_presentsSearchUI = a4;
    v14->_isHandlingSearch = !a4;
    pendingLayoutBlocks = v14->_pendingLayoutBlocks;
    v14->_pendingLayoutBlocks = (NSArray *)MEMORY[0x1E4F1CBF0];

    if (objc_opt_respondsToSelector())
    {
      id v16 = [v11 displayName];
      [(CNContactListViewController *)v14 setTitle:v16];
    }
    else
    {
      id v16 = CNContactsUIBundle();
      BOOL v17 = [v16 localizedStringForKey:@"CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
      [(CNContactListViewController *)v14 setTitle:v17];
    }
    v14->_shouldUseLargeTitle = a6;
    v14->_shouldDisplayCount = 1;
    v14->_shouldAllowDrags = 1;
    v14->_shouldAllowDrops = 1;
    v14->_shouldDisplayEmergencyContacts = 1;
    v14->_allowsEditingActions = 1;
    v14->_allowsListEditing = 1;
    v14->_suggestionsControllerdouble Height = 0.0;
    duplicatesController = v14->_duplicatesController;
    v14->_duplicatesController = 0;

    v14->_isDuplicatesLaunching = 0;
    v14->_shouldSearchBarBecomeFirstResponder = 1;
    [(CNContactListViewController *)v14 setDefinesPresentationContext:1];
    id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v14 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F1AF80] object:0];

    id v20 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v20 addObserver:v14 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F5A180] object:0];

    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v14 selector:sel__applicationEnteringForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v14 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v23 = v14;
  }

  return v14;
}

+ (id)collectionViewLayout
{
  return (id)[(id)objc_opt_class() collectionViewLayoutWithFloatingHeaderViews:1 contactListStyleApplier:0 trailingSwipeActionsProvider:0 shouldDisplaySupplementaryHeaderItemForSection:&__block_literal_global_26193 shouldShowSeparatorsForSection:&__block_literal_global_291 directionalLayoutMargins:&__block_literal_global_294 collectionViewIsShowingIndexBar:&__block_literal_global_297 numberOfItemsInSection:&__block_literal_global_300 contentUnavailable:&__block_literal_global_303];
}

+ (id)collectionViewLayoutWithFloatingHeaderViews:(BOOL)a3 contactListStyleApplier:(id)a4 trailingSwipeActionsProvider:(id)a5 shouldDisplaySupplementaryHeaderItemForSection:(id)a6 shouldShowSeparatorsForSection:(id)a7 directionalLayoutMargins:(id)a8 collectionViewIsShowingIndexBar:(id)a9 numberOfItemsInSection:(id)a10 contentUnavailable:(id)a11
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = objc_alloc(MEMORY[0x1E4FB1580]);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke;
  v48[3] = &unk_1E5498548;
  id v49 = v16;
  id v50 = v22;
  id v51 = v19;
  id v52 = v20;
  id v56 = v23;
  id v57 = a1;
  id v53 = v17;
  id v54 = v18;
  BOOL v58 = a3;
  id v55 = v21;
  id v47 = v23;
  id v45 = v21;
  id v44 = v18;
  id v43 = v17;
  id v42 = v20;
  id v41 = v19;
  id v25 = v22;
  id v26 = v16;
  double v27 = (void *)[v24 initWithSectionProvider:v48];
  double v28 = [v27 configuration];
  float v29 = (void *)MEMORY[0x1E4FB1338];
  double v30 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  double v31 = [MEMORY[0x1E4FB1308] estimatedDimension:0.0];
  double v32 = [v29 sizeWithWidthDimension:v30 heightDimension:v31];

  double v33 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v32 elementKind:@"CNContactListLayoutHeaderIdentifier" alignment:2];
  uint64_t v34 = (void *)MEMORY[0x1E4FB1338];
  double v35 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  double v36 = [MEMORY[0x1E4FB1308] estimatedDimension:*MEMORY[0x1E4FB2F30]];
  uint64_t v37 = [v34 sizeWithWidthDimension:v35 heightDimension:v36];

  id v38 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v37 elementKind:@"CNContactListLayoutFooterIdentifier" alignment:5];
  v59[0] = v33;
  v59[1] = v38;
  long long v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  [v28 setBoundarySupplementaryItems:v39];

  [v27 setConfiguration:v28];

  return v27;
}

- (void)initializeDuplicateContacts
{
  if ([(CNContactListViewController *)self canManageDuplicateContacts])
  {
    if (!self->_isDuplicatesLaunching)
    {
      [(CNContactListViewController *)self setIsDuplicatesLaunching:1];
      BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      double v4 = [v3 schedulerProvider];
      id v5 = [v4 mainThreadScheduler];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__CNContactListViewController_initializeDuplicateContacts__block_invoke;
      v7[3] = &unk_1E549B488;
      v7[4] = self;
      id v6 = (id)[v5 afterDelay:v7 performBlock:4.0];
    }
  }
}

- (void)refreshDuplicates
{
  if ([(CNContactListViewController *)self canManageDuplicateContacts]
    && !self->_isDuplicatesLaunching)
  {
    if (self->_duplicatesController)
    {
      BOOL v3 = [(CNContactListViewController *)self duplicatesController];
      [v3 resetDuplicates];

      id v4 = [(CNContactListViewController *)self duplicatesController];
      [v4 findDuplicates];
    }
    else
    {
      [(CNContactListViewController *)self initializeDuplicateContacts];
    }
  }
}

- (void)_applicationEnteringForeground:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1B8A8], "_cnui_requestRefreshWithUserAction:", 0);
  id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v5 = [v4 featureFlags];
  int v6 = [v5 isFeatureEnabled:8];

  if (v6)
  {
    [(CNContactListViewController *)self refreshDuplicates];
  }
}

- (BOOL)bundleCanManageDuplicates
{
  uint64_t v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  BOOL v3 = [v2 featureFlags];
  int v4 = [v3 isFeatureEnabled:8];

  if (!v4) {
    return 0;
  }
  if (bundleCanManageDuplicates_cn_once_token_24 != -1) {
    dispatch_once(&bundleCanManageDuplicates_cn_once_token_24, &__block_literal_global_651);
  }
  id v5 = (void *)bundleCanManageDuplicates_cn_once_object_24;

  return [v5 BOOLValue];
}

- (BOOL)canManageDuplicateContacts
{
  BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  int v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:8];

  if (!v5
    || [(CNContactListViewController *)self shouldHideDuplicates]
    || ![(CNContactListViewController *)self bundleCanManageDuplicates])
  {
    return 0;
  }

  return [(CNContactListViewController *)self isViewingTopLevelAllContacts];
}

- (BOOL)shouldHideDuplicates
{
  return self->_shouldHideDuplicates;
}

- (BOOL)isViewingTopLevelAllContacts
{
  return self->_isViewingTopLevelAllContacts;
}

- (void)setIsDuplicatesLaunching:(BOOL)a3
{
  self->_isDuplicatesLaunching = a3;
}

void __84__CNContactListViewController_descriptorForRequiredKeysForPreferredForNameMeContact__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  v1 = +[CNAvatarViewController descriptorForRequiredKeysWithThreeDTouchEnabled:0];
  v7[0] = v1;
  uint64_t v2 = +[CNContactListBannerView descriptorForRequiredKeys];
  v7[1] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  int v4 = [NSString stringWithUTF8String:"+[CNContactListViewController descriptorForRequiredKeysForPreferredForNameMeContact]_block_invoke"];
  uint64_t v5 = [v0 descriptorWithKeyDescriptors:v3 description:v4];
  int v6 = (void *)descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_object_11;
  descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_object_11 = v5;
}

uint64_t __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __53__CNContactListViewController__updateCountStringNow___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setShouldDisplayMeContactBanner:(BOOL)a3
{
  if (self->_shouldDisplayMeContactBanner != a3)
  {
    self->_shouldDisplayMeContactBanner = a3;
    [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
  }
}

void __56__CNContactListViewController_bundleCanManageDuplicates__block_invoke()
{
  v0 = NSNumber;
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v4 bundleIdentifier];
  uint64_t v2 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(&unk_1ED915B18, "containsObject:", v1));
  BOOL v3 = (void *)bundleCanManageDuplicates_cn_once_object_24;
  bundleCanManageDuplicates_cn_once_object_24 = v2;
}

void __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) subviews];
  char v4 = objc_msgSend(v3, "_cn_containsObject:", v5);

  if ((v4 & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addSubview:v5];
  }
}

void __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v5 = v3;

  if (v5 && [v5 duplicateCount] != *(void *)(a1 + 48))
  {
    objc_msgSend(v5, "setDuplicateCount:");
    char v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    char v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

uint64_t __58__CNContactListViewController_updateDuplicatesCountBanner__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) refreshDuplicatesBanner];
  }
  return result;
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    if ([(CNContactListViewController *)self isSearching])
    {
      id v5 = [(CNContactListViewController *)self searchBar];
      [(CNContactListViewController *)self searchBarCancelButtonClicked:v5];
    }
  }
}

void __53__CNContactListViewController__updateCountStringNow___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v10 = v3;

  char v4 = v10;
  if (v10)
  {
    if ([v10 isEditing]) {
      int v5 = [v10 allowsMultipleSelectionDuringEditing];
    }
    else {
      int v5 = 0;
    }
    if (![*(id *)(a1 + 32) shouldDisplayCount] || v5)
    {
      [v10 setContactCount:0];
      [v10 setDuplicateCount:0];
    }
    else
    {
      objc_super v6 = [*(id *)(a1 + 32) dataSource];
      char v7 = [v6 contacts];
      uint64_t v8 = [v7 count];

      BOOL v9 = [v10 contactCount] == v8;
      char v4 = v10;
      if (v9) {
        goto LABEL_14;
      }
      [v10 setContactCount:v8];
      [*(id *)(a1 + 32) _contactCountTelemetry:v8];
      [*(id *)(a1 + 32) updateDuplicatesCountBanner];
    }
    char v4 = v10;
  }
LABEL_14:
}

- (void)updateDuplicatesCountBanner
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__CNContactListViewController_updateDuplicatesCountBanner__block_invoke;
  v2[3] = &unk_1E549B1C0;
  v2[4] = self;
  [(CNContactListViewController *)self fetchDuplicatesCountWithCompletionBlock:v2];
}

- (BOOL)shouldDisplayCount
{
  return self->_shouldDisplayCount;
}

- (void)fetchDuplicatesCountWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  objc_super v6 = [v5 schedulerProvider];
  char v7 = [v6 backgroundSchedulerWithQualityOfService:4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E549B710;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

void __54__CNContactListViewController__contactCountTelemetry___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  _LargeDatabasesSignpostLastContactsCountLogTimestamp = v3;

  if (*(void *)(a1 + 32) >= 0xBB8uLL)
  {
    if (_LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_token_2 != -1) {
      dispatch_once(&_LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_token_2, &__block_literal_global_7_28061);
    }
    id v4 = (id)_LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_object_2;
    if (os_signpost_enabled(v4))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 134349056;
      uint64_t v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_18B625000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HighContactsCount", " enableTelemetry=YES %{public, signpost.telemetry:number1, name=ContactsCount}lu", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_contactCountTelemetry:(unint64_t)a3
{
  double v4 = *(double *)&_LargeDatabasesSignpostLastContactsCountLogTimestamp + 60.0;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  if (v4 < v7)
  {
    uint64_t v8 = _LargeDatabasesSignpostLogQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__CNContactListViewController__contactCountTelemetry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async(v8, block);
  }
}

void __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) allDuplicatesCountToDisplay];
  uint64_t v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  double v4 = [v3 schedulerProvider];
  uint64_t v5 = [v4 mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke_2;
  void v7[3] = &unk_1E5498770;
  double v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  uint64_t v9 = v2;
  [v5 performBlock:v7];
}

- (int64_t)allDuplicatesCountToDisplay
{
  if (!self->_duplicatesController
    || ![(CNContactListViewController *)self canManageDuplicateContacts])
  {
    return 0;
  }
  duplicatesController = self->_duplicatesController;

  return [(CNDuplicateContactsController *)duplicatesController allDuplicatesCount];
}

void __53__CNContactListViewController__updateCountStringNow___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CNContactListViewController__updateCountStringNow___block_invoke_3;
  block[3] = &unk_1E549B8A0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)indexTitlesForCollectionView:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5A258];
  uint64_t v5 = [(CNContactListViewController *)self _sections];
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    double v6 = 0;
  }
  else
  {
    double v7 = [(CNContactDataSource *)self->_dataSource indexSections];
    double v6 = [v7 valueForKey:@"title"];
  }

  return v6;
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v11 = [(CNContactListViewController *)self cellContentUnavailableConfiguration];
  uint64_t v5 = [(CNContactListViewController *)self contentUnavailableConfigurationForState:v4];

  BOOL v6 = [(CNContactListViewController *)self shouldEmbedContentUnavailableViewInCell];
  if (v6) {
    double v7 = v5;
  }
  else {
    double v7 = 0;
  }
  if (v6) {
    id v8 = 0;
  }
  else {
    id v8 = v5;
  }
  [(CNContactListViewController *)self setCellContentUnavailableConfiguration:v7];
  [(CNContactListViewController *)self _setContentUnavailableConfiguration:v8];
  id v9 = [(CNContactListViewController *)self cellContentUnavailableConfiguration];
  if (v11 != v9 && (!v11 || !v9 || ([v11 isEqual:v9] & 1) == 0))
  {
    id v10 = [(CNContactListViewController *)self collectionView];
    [v10 reloadData];
  }
}

- (BOOL)shouldEmbedContentUnavailableViewInCell
{
  id v2 = [(CNContactListViewController *)self listHeaderView];
  [v2 frame];
  BOOL v3 = !CGRectIsEmpty(v5);

  return v3;
}

- (void)setCellContentUnavailableConfiguration:(id)a3
{
}

- (id)contentUnavailableConfigurationForState:(id)a3
{
  id v4 = a3;
  if (![(CNContactListViewController *)self hasNoContacts])
  {
    BOOL v6 = 0;
    goto LABEL_6;
  }
  if ([(CNContactListViewController *)self isHandlingSearch]
    || [(CNContactListViewController *)self isShowingServerSearch])
  {
    CGRect v5 = [MEMORY[0x1E4FB1658] searchConfiguration];
    BOOL v6 = [v5 updatedConfigurationForState:v4];

    goto LABEL_6;
  }
  id v8 = [MEMORY[0x1E4FB1658] emptyProminentConfiguration];
  BOOL v6 = [v8 updatedConfigurationForState:v4];

  if (![(CNContactListViewController *)self shouldDisplayMeContactBanner])
  {
    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.fill"];
    [v6 setImage:v9];
  }
  id v10 = [(CNContactListViewController *)self delegate];
  int v11 = [v10 conformsToProtocol:&unk_1ED98D6F8];

  if (v11)
  {
    id v12 = [(CNContactListViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      int v13 = [v12 isAddContactButtonShowing];
    }
    else {
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
  }
  id v14 = CNContactsUIBundle();
  uint64_t v15 = [v14 localizedStringForKey:@"NO_CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
  [v6 setText:v15];

  id v16 = CNContactsUIBundle();
  id v17 = [v16 localizedStringForKey:@"NO_CONTACTS_HINT" value:&stru_1ED8AC728 table:@"Localized"];
  [v6 setSecondaryText:v17];

  BOOL v18 = [(CNContactListViewController *)self showingGroup];
  BOOL v19 = [(CNContactListViewController *)self collectionViewShouldDisplayCreateNewContact];
  if (!v13 || !v18)
  {
    if (((v13 | v19) & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
  if (![(CNContactListViewController *)self allowsListEditing])
  {
LABEL_22:
    double v28 = CNContactsUIBundle();
    float v29 = [v28 localizedStringForKey:@"CREATE_NEW_CONTACT_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    double v30 = [v6 buttonProperties];
    double v31 = [v30 configuration];
    [v31 setTitle:v29];

    id v24 = (void *)MEMORY[0x1E4FB13F0];
    id v25 = CNContactsUIBundle();
    id v26 = [v25 localizedStringForKey:@"CREATE_NEW_CONTACT_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    id v41 = __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke;
    id v42 = &unk_1E549BDC8;
    id v43 = self;
    double v27 = &v39;
    goto LABEL_23;
  }
  id v20 = CNContactsUIBundle();
  id v21 = [v20 localizedStringForKey:@"ADD_CONTACTS_TO_LIST_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  id v22 = [v6 buttonProperties];
  id v23 = [v22 configuration];
  [v23 setTitle:v21];

  id v24 = (void *)MEMORY[0x1E4FB13F0];
  id v25 = CNContactsUIBundle();
  id v26 = [v25 localizedStringForKey:@"ADD_CONTACTS_TO_LIST_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  double v36 = __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke_2;
  uint64_t v37 = &unk_1E549BDC8;
  id v38 = self;
  double v27 = &v34;
LABEL_23:
  double v32 = objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, 0, 0, v27, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
  double v33 = [v6 buttonProperties];
  [v33 setPrimaryAction:v32];

LABEL_6:

  return v6;
}

void __45__CNContactListViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSearching])
  {
    if ([*(id *)(a1 + 32) shouldSearchBarBecomeFirstResponder])
    {
      id v2 = [*(id *)(a1 + 32) searchController];
      BOOL v3 = [v2 searchBar];
      char v4 = [v3 isFirstResponder];

      if ((v4 & 1) == 0)
      {
        id v6 = [*(id *)(a1 + 32) searchController];
        CGRect v5 = [v6 searchBar];
        [v5 becomeFirstResponder];
      }
    }
  }
}

+ (id)emptyContact
{
  if (emptyContact_cn_once_token_15 != -1) {
    dispatch_once(&emptyContact_cn_once_token_15, &__block_literal_global_589);
  }
  id v2 = (void *)emptyContact_cn_once_object_15;

  return v2;
}

void __43__CNContactListViewController_emptyContact__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  v1 = (void *)emptyContact_cn_once_object_15;
  emptyContact_cn_once_object_15 = (uint64_t)v0;
}

double __51__CNContactListViewController_collectionViewLayout__block_invoke_6()
{
  return 0.0;
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke_5()
{
  return 0;
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke_4()
{
  return 0;
}

double __51__CNContactListViewController_collectionViewLayout__block_invoke_3()
{
  return *MEMORY[0x1E4FB12A8];
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke_2()
{
  return 1;
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke()
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppName, 0);
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, 0);
  objc_storeStrong((id *)&self->_listHeaderView, 0);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);
  objc_storeStrong((id *)&self->_selectButtonView, 0);
  objc_storeStrong((id *)&self->_contactSelectionOnViewLoad, 0);
  objc_storeStrong((id *)&self->_cellContentUnavailableConfiguration, 0);
  objc_storeStrong((id *)&self->_duplicatesController, 0);
  objc_storeStrong((id *)&self->_actionHelper, 0);
  objc_storeStrong((id *)&self->_indexPathToSelect, 0);
  objc_storeStrong((id *)&self->_defaultContactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupToken, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupRegistrationToken, 0);
  objc_storeStrong((id *)&self->_emergencyContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_vCardImportController, 0);
  objc_storeStrong((id *)&self->_pendingSearchQuery, 0);
  objc_storeStrong((id *)&self->_pendingLayoutBlocks, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_meBannerAvatarController, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_meContactBanner, 0);
  objc_storeStrong((id *)&self->_suggestionsController, 0);
  objc_storeStrong(&self->_searchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_meContactBannerFootnoteValue, 0);
  objc_storeStrong((id *)&self->_meContactBannerFootnoteLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_preferredForNameMeContact, 0);
}

- (void)setHasPickerPrivacyUI:(BOOL)a3
{
  self->_hasPickerPrivacyUI = a3;
}

- (void)setLimitedAccessAppBundleId:(id)a3
{
}

- (NSString)limitedAccessAppBundleId
{
  return self->_limitedAccessAppBundleId;
}

- (void)setLimitedAccessAppName:(id)a3
{
}

- (NSString)limitedAccessAppName
{
  return self->_limitedAccessAppName;
}

- (void)setLimitedAccessContactSelection:(id)a3
{
}

- (NSSet)limitedAccessContactSelection
{
  return self->_limitedAccessContactSelection;
}

- (void)setShouldDisplayAddNewContactRow:(BOOL)a3
{
  self->_shouldDisplayAddNewContactRow = a3;
}

- (void)setAllowsListEditing:(BOOL)a3
{
  self->_allowsListEditing = a3;
}

- (BOOL)allowsListEditing
{
  return self->_allowsListEditing;
}

- (void)setAllowsEditingActions:(BOOL)a3
{
  self->_allowsEditingActions = a3;
}

- (double)estimatedListHeaderViewHeight
{
  return self->_estimatedListHeaderViewHeight;
}

- (void)setSuggestedContacts:(id)a3
{
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
}

- (void)setSuggestionsInteractionDomains:(id)a3
{
}

- (NSArray)suggestionsInteractionDomains
{
  return self->_suggestionsInteractionDomains;
}

- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3
{
}

- (NSArray)suggestionsIgnoredContactIdentifiers
{
  return self->_suggestionsIgnoredContactIdentifiers;
}

- (void)setShouldAllowSearchForMultiSelect:(BOOL)a3
{
  self->_shouldAllowSearchForMultiSelect = a3;
}

- (BOOL)shouldAllowSearchForMultiSelect
{
  return self->_shouldAllowSearchForMultiSelect;
}

- (void)setShouldDisplayEmergencyContacts:(BOOL)a3
{
  self->_shouldDisplayEmergencyContacts = a3;
}

- (void)setShouldDisplayGroupsGrid:(BOOL)a3
{
  self->_shouldDisplayGroupsGrid = a3;
}

- (BOOL)shouldDisplayGroupsGrid
{
  return self->_shouldDisplayGroupsGrid;
}

- (void)setIsHandlingSearch:(BOOL)a3
{
  self->_isHandlingSearch = a3;
}

- (void)setShouldShowLimitedAccessTip:(BOOL)a3
{
  self->_shouldShowLimitedAccessTip = a3;
}

- (void)setSelectButton:(id)a3
{
}

- (void)setSelectButtonView:(id)a3
{
}

- (void)setContactSelectionOnViewLoad:(id)a3
{
}

- (NSSet)contactSelectionOnViewLoad
{
  return self->_contactSelectionOnViewLoad;
}

- (void)setIsShowingDuplicatesBanner:(BOOL)a3
{
  self->_isShowingDuplicatesBanner = a3;
}

- (void)setIsViewingTopLevelAllContacts:(BOOL)a3
{
  self->_isViewingTopLevelAllContacts = a3;
}

- (BOOL)isDuplicatesLaunching
{
  return self->_isDuplicatesLaunching;
}

- (void)setDuplicatesController:(id)a3
{
}

- (void)setActionHelper:(id)a3
{
}

- (void)setIndexPathToSelect:(id)a3
{
}

- (void)setDefaultContactListStyleApplier:(id)a3
{
}

- (CNContactListStyleApplier)defaultContactListStyleApplier
{
  return self->_defaultContactListStyleApplier;
}

- (CNHealthStoreManagerToken)medicalIDLookupRegistrationToken
{
  return self->_medicalIDLookupRegistrationToken;
}

- (void)setEmergencyContactIdentifiers:(id)a3
{
}

- (void)setHeaderViewNeedsUpdate:(BOOL)a3
{
  self->_headerViewNeedsUpdate = a3;
}

- (BOOL)headerViewNeedsUpdate
{
  return self->_headerViewNeedsUpdate;
}

- (void)setVCardImportController:(id)a3
{
}

- (CNVCardImportController)vCardImportController
{
  return self->_vCardImportController;
}

- (void)setPendingSearchControllerActivation:(BOOL)a3
{
  self->_pendingSearchControllerActivation = a3;
}

- (void)setShouldSearchBarBecomeFirstResponder:(BOOL)a3
{
  self->_shouldSearchBarBecomeFirstResponder = a3;
}

- (BOOL)shouldSearchBarBecomeFirstResponder
{
  return self->_shouldSearchBarBecomeFirstResponder;
}

- (void)setPendingSearchQuery:(id)a3
{
}

- (NSString)pendingSearchQuery
{
  return self->_pendingSearchQuery;
}

- (void)setAvatarRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (double)contentOffsetDueToMeContactBanner
{
  return self->_contentOffsetDueToMeContactBanner;
}

- (void)setMeContactBanner:(id)a3
{
}

- (void)setSuggestionsControllerHeight:(double)a3
{
  self->_suggestionsControllerdouble Height = a3;
}

- (double)suggestionsControllerHeight
{
  return self->_suggestionsControllerHeight;
}

- (void)setSuggestionsController:(id)a3
{
}

- (void)setSearchCompletionBlock:(id)a3
{
}

- (id)searchCompletionBlock
{
  return self->_searchCompletionBlock;
}

- (CNContactListSearchController)searchController
{
  return self->_searchController;
}

- (void)setAllowsMultiSelection:(BOOL)a3
{
  self->_allowsMultiSelection = a3;
}

- (BOOL)allowsMultiSelection
{
  return self->_allowsMultiSelection;
}

- (void)duplicatesBannerCellDidTapDismiss:(id)a3
{
  char v4 = [(CNContactListViewController *)self duplicatesController];
  [v4 ignoreNewDuplicatesBanner];

  [(CNContactListViewController *)self removeDuplicatesBanner];
}

- (void)addContactsToListTappedWithSourceView:(id)a3
{
  id v7 = a3;
  char v4 = [(CNContactListViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactListViewController *)self delegate];
    [v6 contactListViewControllerSelectedAddContactToList:self withSourceView:v7];
  }
}

- (void)createNewContactTapped
{
  BOOL v3 = [(CNContactListViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNContactListViewController *)self delegate];
    [v5 contactListViewControllerSelectedCreateNewContact:self];
  }
}

- (id)pathToContentUnavailableRow
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CNContactListViewController_pathToContentUnavailableRow__block_invoke;
  block[3] = &unk_1E549B488;
  void block[4] = self;
  if (pathToContentUnavailableRow_cn_once_token_30 != -1) {
    dispatch_once(&pathToContentUnavailableRow_cn_once_token_30, block);
  }
  return (id)pathToContentUnavailableRow_cn_once_object_30;
}

void __58__CNContactListViewController_pathToContentUnavailableRow__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "contentUnavailableRowSection"));
  id v2 = (void *)pathToContentUnavailableRow_cn_once_object_30;
  pathToContentUnavailableRow_cn_once_object_30 = v1;
}

- (id)pathToCreateNewContactRow
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CNContactListViewController_pathToCreateNewContactRow__block_invoke;
  block[3] = &unk_1E549B488;
  void block[4] = self;
  if (pathToCreateNewContactRow_cn_once_token_29 != -1) {
    dispatch_once(&pathToCreateNewContactRow_cn_once_token_29, block);
  }
  return (id)pathToCreateNewContactRow_cn_once_object_29;
}

void __56__CNContactListViewController_pathToCreateNewContactRow__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "createNewContactRowSection"));
  id v2 = (void *)pathToCreateNewContactRow_cn_once_object_29;
  pathToCreateNewContactRow_cn_once_object_29 = v1;
}

- (BOOL)containsPathToContentUnavailableRow:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__CNContactListViewController_containsPathToContentUnavailableRow___block_invoke;
  v4[3] = &unk_1E54988F8;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

uint64_t __67__CNContactListViewController_containsPathToContentUnavailableRow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isPathToContentUnavailableRow:a2];
}

- (BOOL)containsPathToCreateNewContactRow:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CNContactListViewController_containsPathToCreateNewContactRow___block_invoke;
  v4[3] = &unk_1E54988F8;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

uint64_t __65__CNContactListViewController_containsPathToCreateNewContactRow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isPathToCreateNewContactRow:a2];
}

- (int64_t)contentUnavailableRowSection
{
  return [(CNContactListViewController *)self isDisplayingContentUnavailableViewAsCell]- 1;
}

- (int64_t)createNewContactRowSection
{
  return [(CNContactListViewController *)self shouldDisplayCreateNewContactAsRow]
       - 1;
}

- (BOOL)isPerformingDuplicatesMerge
{
  if (!self->_duplicatesController) {
    return 0;
  }
  id v2 = [(CNContactListViewController *)self duplicatesController];
  char v3 = [v2 isPerformingMerge];

  return v3;
}

- (void)didPerformDuplicatesMerge:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F5A3D8], "currentEnvironment", a3);
  id v5 = [v4 featureFlags];
  int v6 = [v5 isFeatureEnabled:8];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v8 = [v7 schedulerProvider];
    id v9 = [v8 mainThreadScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke;
    v10[3] = &unk_1E549B488;
    void v10[4] = self;
    [v9 performBlock:v10];
  }
}

void __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  char v3 = [*(id *)(a1 + 32) collectionView];
  char v4 = [*(id *)(a1 + 32) collectionView];
  id v5 = [v4 indexPathsForVisibleItems];
  [v3 reconfigureItemsAtIndexPaths:v5];

  int v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v7 = [v6 schedulerProvider];
  id v8 = [v7 mainThreadScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke_2;
  v10[3] = &unk_1E549B488;
  void v10[4] = *(void *)(a1 + 32);
  id v9 = (id)[v8 afterDelay:v10 performBlock:3.0];
}

uint64_t __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldShowDuplicateBannerView];
  if ((result & 1) == 0)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 removeDuplicatesBanner];
  }
  return result;
}

- (void)willPerformDuplicatesMergeAll:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F5A3D8], "currentEnvironment", a3);
  id v5 = [v4 featureFlags];
  int v6 = [v5 isFeatureEnabled:8];

  if (v6)
  {
    [(CNContactListViewController *)self refreshDuplicatesBanner];
  }
}

- (void)duplicatesDidChange:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F5A3D8], "currentEnvironment", a3);
  id v5 = [v4 featureFlags];
  int v6 = [v5 isFeatureEnabled:8];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__CNContactListViewController_duplicatesDidChange___block_invoke;
    void v7[3] = &unk_1E549B1C0;
    v7[4] = self;
    [(CNContactListViewController *)self fetchDuplicatesCountWithCompletionBlock:v7];
  }
}

void __51__CNContactListViewController_duplicatesDidChange___block_invoke(uint64_t a1, char a2)
{
  if (([*(id *)(a1 + 32) isPerformingDuplicatesMerge] & 1) == 0)
  {
    int v4 = [*(id *)(a1 + 32) isShowingDuplicatesBanner];
    int v5 = v4 ^ [*(id *)(a1 + 32) shouldShowDuplicateBannerView];
    if ((a2 & 1) != 0 || v5)
    {
      int v6 = *(void **)(a1 + 32);
      if (v5)
      {
        [v6 refreshDuplicatesBanner];
      }
      else
      {
        id v10 = [v6 duplicatesBannerCell];
        uint64_t v7 = [v10 state];
        [*(id *)(a1 + 32) updateDuplicatesBannerForProcessingState];
        if (v7 != [v10 state])
        {
          id v8 = [*(id *)(a1 + 32) collectionView];
          id v9 = [v8 collectionViewLayout];
          [v9 invalidateLayout];
        }
      }
    }
  }
}

- (BOOL)containsPathToDuplicatesBanner:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__CNContactListViewController_containsPathToDuplicatesBanner___block_invoke;
  v4[3] = &unk_1E54988F8;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

uint64_t __62__CNContactListViewController_containsPathToDuplicatesBanner___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isPathToDuplicatesBanner:a2];
}

- (id)pathToDuplicatesBanner
{
  if (pathToDuplicatesBanner_cn_once_token_28 != -1) {
    dispatch_once(&pathToDuplicatesBanner_cn_once_token_28, &__block_literal_global_664);
  }
  id v2 = (void *)pathToDuplicatesBanner_cn_once_object_28;

  return v2;
}

void __53__CNContactListViewController_pathToDuplicatesBanner__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  uint64_t v1 = (void *)pathToDuplicatesBanner_cn_once_object_28;
  pathToDuplicatesBanner_cn_once_object_28 = v0;
}

- (void)updateDataSourceAndCollectionViewForDuplicatesBanner
{
  char v3 = [(CNContactListViewController *)self collectionView];
  int v4 = [v3 window];

  if (v4)
  {
    int v5 = [(CNContactListViewController *)self collectionView];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__CNContactListViewController_updateDataSourceAndCollectionViewForDuplicatesBanner__block_invoke;
    void v7[3] = &unk_1E549B488;
    v7[4] = self;
    [v5 performBatchUpdates:v7 completion:0];
  }
  else
  {
    [(CNContactListViewController *)self updateAdditionalSectionsAtTop];
    id v6 = [(CNContactListViewController *)self collectionView];
    [v6 reloadData];
  }
}

void __83__CNContactListViewController_updateDataSourceAndCollectionViewForDuplicatesBanner__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) collectionView];
  uint64_t v3 = [v2 numberOfSections];

  [*(id *)(a1 + 32) updateAdditionalSectionsAtTop];
  uint64_t v4 = [*(id *)(a1 + 32) numberOfSections];
  int v5 = [*(id *)(a1 + 32) pathToDuplicatesBanner];
  if (v3 == v4)
  {
    id v6 = CNUILogContactList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(a1 + 32) additionalSectionsAtTopCount];
      *(_DWORD *)buf = 134349056;
      uint64_t v16 = v7;
      _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "Refreshing duplicates banner: reloading indexPath for banner | additional sections at top: %{public}ld", buf, 0xCu);
    }

    id v8 = [*(id *)(a1 + 32) collectionView];
    id v14 = v5;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v8 reloadItemsAtIndexPaths:v9];
  }
  else
  {
    id v10 = CNUILogContactList();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v3 >= v4)
    {
      if (v11)
      {
        uint64_t v13 = [*(id *)(a1 + 32) additionalSectionsAtTopCount];
        *(_DWORD *)buf = 134349056;
        uint64_t v16 = v13;
        _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_INFO, "Refreshing duplicates banner: deleting section | additional sections at top: %{public}ld", buf, 0xCu);
      }

      id v8 = [*(id *)(a1 + 32) collectionView];
      id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      [v8 deleteSections:v9];
    }
    else
    {
      if (v11)
      {
        uint64_t v12 = [*(id *)(a1 + 32) additionalSectionsAtTopCount];
        *(_DWORD *)buf = 134349056;
        uint64_t v16 = v12;
        _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_INFO, "Refreshing duplicates banner: inserting section | additional sections at top: %{public}ld", buf, 0xCu);
      }

      id v8 = [*(id *)(a1 + 32) collectionView];
      id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      [v8 insertSections:v9];
    }
  }
}

- (void)updateDuplicatesBannerForProcessingState
{
  id v4 = [(CNContactListViewController *)self duplicatesBannerCell];
  if (v4)
  {
    uint64_t v3 = [(CNContactListViewController *)self duplicatesController];
    [v3 decorateBannerViewCell:v4];
  }
}

- (id)duplicatesBannerCell
{
  uint64_t v3 = [(CNContactListViewController *)self pathToDuplicatesBanner];
  id v4 = [(CNContactListViewController *)self collectionView];
  int v5 = [v4 cellForItemAtIndexPath:v3];

  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)removeDuplicatesBanner
{
  if ([(CNContactListViewController *)self isShowingDuplicatesBanner])
  {
    id v3 = [(CNContactListViewController *)self duplicatesBannerCell];
    [v3 setDelegate:0];
    [(CNContactListViewController *)self updateDataSourceAndCollectionViewForDuplicatesBanner];
  }
}

- (void)refreshDuplicatesBanner
{
  id v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 schedulerProvider];
  int v5 = [v4 mainThreadScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CNContactListViewController_refreshDuplicatesBanner__block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v5 performBlock:v6];
}

uint64_t __54__CNContactListViewController_refreshDuplicatesBanner__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) shouldShowDuplicateBannerView];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 updateDataSourceAndCollectionViewForDuplicatesBanner];
  }
  else
  {
    return [v3 removeDuplicatesBanner];
  }
}

- (void)didSelectViewAllDuplicates
{
  id v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:8];

  if (v5)
  {
    if ([(CNContactListViewController *)self isSearching]) {
      [(CNContactListViewController *)self cancelSearch:self];
    }
    id v6 = [(CNContactListViewController *)self duplicatesController];
    [v6 presentSheetBasedMergeForController:self showsIgnored:1];

    [(CNContactListViewController *)self deselectAllSelectedIndexPathsAnimated:0];
  }
}

uint64_t __58__CNContactListViewController_initializeDuplicateContacts__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) duplicatesController];
  [v2 findDuplicates];

  id v3 = *(void **)(a1 + 32);

  return [v3 updateDuplicatesCountBanner];
}

- (BOOL)canPerformDuplicatesMerge
{
  if (![(CNContactListViewController *)self canManageDuplicateContacts]) {
    return 0;
  }
  id v3 = [(CNContactListViewController *)self collectionView];
  if ([v3 isEditing])
  {
    id v4 = [(CNContactListViewController *)self collectionView];
    char v5 = [v4 allowsMultipleSelectionDuringEditing];

    if (v5) {
      return 0;
    }
  }
  else
  {
  }
  uint64_t v7 = [(CNContactListViewController *)self duplicatesController];
  char v8 = [v7 canMergeDuplicates];

  return v8;
}

- (int64_t)newDuplicatesCountToDisplay
{
  if (!self->_duplicatesController
    || ![(CNContactListViewController *)self canManageDuplicateContacts])
  {
    return 0;
  }
  duplicatesController = self->_duplicatesController;

  return [(CNDuplicateContactsController *)duplicatesController newDuplicatesCount];
}

- (BOOL)shouldShowDuplicateBannerView
{
  if (![(CNContactListViewController *)self canManageDuplicateContacts]) {
    return 0;
  }
  objc_opt_class();
  id v3 = [(CNContactListViewController *)self collectionView];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5 && [v5 contactCount] >= 1 && self->_duplicatesController)
  {
    id v6 = [(CNContactListViewController *)self duplicatesController];
    char v7 = [v6 wantsToDisplayNewDuplicatesBanner:3];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)updateNavTitleWithCount:(unint64_t)a3
{
  if ([(CNContactListViewController *)self isShowingCustomTitle])
  {
    objc_opt_class();
    id v5 = [(CNContactListViewController *)self dataSource];
    id v6 = [v5 filter];
    if (objc_opt_isKindOfClass()) {
      char v7 = v6;
    }
    else {
      char v7 = 0;
    }
    id v8 = v7;

    id v9 = NSString;
    id v10 = CNContactsUIBundle();
    BOOL v11 = [v10 localizedStringForKey:@"SELECTED_COUNT" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, a3);
    [v8 setCustomDisplayName:v12];

    [(CNContactListViewController *)self reloadTitle];
  }
}

- (void)updateSelectAllButtonTitle
{
  id v3 = [(CNContactListViewController *)self selectButtonView];

  if (v3)
  {
    BOOL v4 = [(CNContactListViewController *)self hasAllRowsSelected];
    id v5 = CNContactsUIBundle();
    id v6 = v5;
    if (v4) {
      char v7 = @"LIMITED_CONTACTS_DESELECT_ALL";
    }
    else {
      char v7 = @"LIMITED_CONTACTS_SELECT_ALL";
    }
    id v11 = [v5 localizedStringForKey:v7 value:&stru_1ED8AC728 table:@"Localized"];

    id v8 = [(CNContactListViewController *)self selectButton];
    [v8 setTitle:v11 forState:0];

    id v9 = [(CNContactListViewController *)self selectButton];
    [v9 setNeedsLayout];

    id v10 = [(CNContactListViewController *)self selectButton];
    [v10 layoutIfNeeded];

    [(CNContactListViewController *)self layoutSelectButtonView];
  }
}

- (void)addSelectButtonView
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithLists:[(CNContactListViewController *)self limitedAccessPickerType]])
  {
    id v3 = [(CNContactListViewController *)self selectButtonView];

    if (!v3)
    {
      if ([(CNContactListViewController *)self showingGroup])
      {
        unint64_t v4 = [(CNContactListViewController *)self totalNumberOfRows];
        if (v4 - [(CNContactListViewController *)self additionalSectionsAtTopCount] >= 6)
        {
          id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
          [v5 setClipsToBounds:1];
          [v5 setAutoresizingMask:2];
          [v5 setTranslatesAutoresizingMaskIntoConstraints:1];
          id v6 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
          char v7 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
          id v8 = [v6 background];
          [v8 setBackgroundColor:v7];

          id v9 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
          id v10 = [v6 background];
          [v10 setVisualEffect:v9];

          id v11 = [MEMORY[0x1E4FB1618] linkColor];
          [v6 setBaseForegroundColor:v11];

          [v6 setCornerStyle:4];
          [v6 setButtonSize:2];
          objc_msgSend(v6, "setContentInsets:", 6.0, 10.0, 6.0, 10.0);
          uint64_t v12 = CNContactsUIBundle();
          uint64_t v13 = [v12 localizedStringForKey:@"LIMITED_CONTACTS_SELECT_ALL" value:&stru_1ED8AC728 table:@"Localized"];
          [v6 setTitle:v13];

          [v6 setTitleTextAttributesTransformer:&__block_literal_global_639];
          id v14 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v6 primaryAction:0];
          [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v14 addTarget:self action:sel_handleSelectAllTapped forControlEvents:64];
          [v5 addSubview:v14];
          [(CNContactListViewController *)self setSelectButton:v14];
          id v25 = [(CNContactListViewController *)self selectButton];
          id v23 = [v25 centerYAnchor];
          id v24 = v5;
          uint64_t v15 = [v5 centerYAnchor];
          uint64_t v16 = [v23 constraintEqualToAnchor:v15];
          v26[0] = v16;
          uint64_t v17 = [(CNContactListViewController *)self selectButton];
          BOOL v18 = [v17 centerXAnchor];
          BOOL v19 = [v5 centerXAnchor];
          id v20 = [v18 constraintEqualToAnchor:v19];
          v26[1] = v20;
          id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];

          [MEMORY[0x1E4F28DC8] activateConstraints:v21];
          id v22 = [(CNContactListViewController *)self view];
          [v22 addSubview:v24];

          [(CNContactListViewController *)self setSelectButtonView:v24];
        }
      }
    }
  }
}

id __50__CNContactListViewController_addSelectButtonView__block_invoke(uint64_t a1, void *a2)
{
  char v2 = (void *)[a2 mutableCopy];
  id v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0 weight:*MEMORY[0x1E4FB09D8]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (void)handleSelectAllTapped
{
  if ([(CNContactListViewController *)self hasAllRowsSelected]) {
    [(CNContactListViewController *)self deselectAllSelectedIndexPathsAnimated:1];
  }
  else {
    [(CNContactListViewController *)self selectAllIndexPathsAnimated:1];
  }

  [(CNContactListViewController *)self updateInResponseToLimitedAccessSelectionChanged];
}

- (void)selectAllIndexPathsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CNContactListViewController *)self additionalSectionsAtTopCount];
  id v6 = [(CNContactListViewController *)self collectionView];
  uint64_t v7 = [v6 numberOfSections];

  if (v5 < v7)
  {
    do
    {
      id v8 = [(CNContactListViewController *)self collectionView];
      uint64_t v9 = [v8 numberOfItemsInSection:v5];

      if (v9 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          id v11 = [(CNContactListViewController *)self collectionView];
          uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:v5];
          [v11 selectItemAtIndexPath:v12 animated:v3 scrollPosition:0];

          ++v10;
          uint64_t v13 = [(CNContactListViewController *)self collectionView];
          uint64_t v14 = [v13 numberOfItemsInSection:v5];
        }
        while (v10 < v14);
      }
      ++v5;
      uint64_t v15 = [(CNContactListViewController *)self collectionView];
      uint64_t v16 = [v15 numberOfSections];
    }
    while (v5 < v16);
  }
}

- (unint64_t)totalNumberOfRows
{
  BOOL v3 = [(CNContactListViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  do
  {
    uint64_t v7 = [(CNContactListViewController *)self collectionView];
    v6 += [v7 numberOfItemsInSection:v5];

    ++v5;
    id v8 = [(CNContactListViewController *)self collectionView];
    uint64_t v9 = [v8 numberOfSections];
  }
  while (v5 < v9);
  return v6;
}

- (BOOL)hasAllRowsSelected
{
  char v2 = self;
  BOOL v3 = [(CNContactListViewController *)self collectionView];
  uint64_t v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(CNContactListViewController *)v2 totalNumberOfRows];
  LOBYTE(v2) = v5 == v6
                   - [(CNContactListViewController *)v2 additionalSectionsAtTopCount];

  return (char)v2;
}

- (void)updateInResponseToLimitedAccessSelectionChanged
{
  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithMultiSelect:[(CNContactListViewController *)self limitedAccessPickerType]])
  {
    id v4 = [(CNContactListViewController *)self limitedAccessContactsFromCurrentSelection];
    BOOL v3 = [(CNContactListViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 didUpdateLimitedAccessSelection:v4];
    }
    [(CNContactListViewController *)self updateSelectAllButtonTitle];
    -[CNContactListViewController updateNavTitleWithCount:](self, "updateNavTitleWithCount:", [v4 count]);
  }
}

- (void)didResetLimitedAccessSelectionTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CNUILogContactList();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v4 count];
    _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "Reset Limited to %lu contacts", buf, 0xCu);
  }

  if ([(CNContactListViewController *)self limitedAccessPickerType] == 5)
  {
    objc_opt_class();
    uint64_t v6 = [(CNContactListViewController *)self dataSource];
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    uint64_t v9 = [v8 filter];
    [v9 setLimitedAccessIdentifiers:v4];

    [v8 reloadAsynchronously];
    uint64_t v10 = NSString;
    id v11 = CNContactsUIBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"LIMITED_CONTACTS_SELECTED_PROMPT" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, objc_msgSend(v4, "count"));
    uint64_t v14 = [(CNContactListViewController *)self navigationItem];
    [v14 setPrompt:v13];

    [(CNContactListViewController *)self setLimitedAccessContactSelection:v4];
  }
  else
  {
    [(CNContactListViewController *)self deselectAllSelectedIndexPathsAnimated:0];
    [(CNContactListViewController *)self setLimitedAccessContactSelection:v4];
    [(CNContactListViewController *)self setupViewWithLimitedAccessContactSelection];
    [(CNContactListViewController *)self updateInResponseToLimitedAccessSelectionChanged];
  }
}

- (void)updatelimitedAccessContactSelection
{
  id v3 = [(CNContactListViewController *)self limitedAccessContactsFromCurrentSelection];
  [(CNContactListViewController *)self setLimitedAccessContactSelection:v3];
}

- (id)limitedAccessContactsFromCurrentSelection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithMultiSelect:[(CNContactListViewController *)self limitedAccessPickerType]])
  {
    id v3 = [(CNContactListViewController *)self limitedAccessContactSelection];
    id v4 = (void *)[v3 mutableCopy];

    uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v6 = [(CNContactListViewController *)self selectedContacts];
    uint64_t v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_669);
    id v8 = [v5 setWithArray:v7];

    uint64_t v9 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v10 = [(CNContactListViewController *)self contactSelectionOnViewLoad];
    id v11 = [v9 setWithSet:v10];

    [v11 minusSet:v8];
    uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
    uint64_t v13 = [(CNContactListViewController *)self contactSelectionOnViewLoad];
    [v12 minusSet:v13];

    uint64_t v14 = CNUILogContactList();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      uint64_t v19 = [v11 count];
      _os_log_debug_impl(&dword_18B625000, v14, OS_LOG_TYPE_DEBUG, "Limited picker: %lu contacts deselected since table load", (uint8_t *)&v18, 0xCu);
    }

    [v4 minusSet:v11];
    uint64_t v15 = CNUILogContactList();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v12 count];
      int v18 = 134217984;
      uint64_t v19 = v17;
      _os_log_debug_impl(&dword_18B625000, v15, OS_LOG_TYPE_DEBUG, "Limited picker: %lu contacts selected since table load", (uint8_t *)&v18, 0xCu);
    }

    [v4 unionSet:v12];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setupViewWithLimitedAccessContactSelection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithMultiSelect:[(CNContactListViewController *)self limitedAccessPickerType]])
  {
    id v3 = [(CNContactListViewController *)self limitedAccessContactSelection];
    id v4 = [v3 allObjects];
    uint64_t v5 = [(CNContactListViewController *)self limitedAccessAppBundleId];
    uint64_t v6 = +[CNLimitedAccessPickerSupport contactsFromIdentifiers:v4 withBundleId:v5];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
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
          -[CNContactListViewController selectContact:animated:scrollPosition:shouldScroll:](self, "selectContact:animated:scrollPosition:shouldScroll:", *(void *)(*((void *)&v17 + 1) + 8 * v11++), 0, 0, 0, (void)v17);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = [(CNContactListViewController *)self selectedContacts];
    uint64_t v14 = objc_msgSend(v13, "_cn_map:", &__block_literal_global_669);
    uint64_t v15 = [v12 setWithArray:v14];

    uint64_t v16 = [(CNContactListViewController *)self contactSelectionOnViewLoad];

    if (!v16) {
      [(CNContactListViewController *)self setLimitedAccessContactSelection:v15];
    }
    -[CNContactListViewController setContactSelectionOnViewLoad:](self, "setContactSelectionOnViewLoad:", v15, (void)v17);
  }
}

- (void)limitedAccessTipCellDidTapDismiss:(id)a3
{
  if ([(CNContactListViewController *)self isShowingLimitedAccessTip])
  {
    id v4 = [(CNContactListViewController *)self limitedAccessTipCell];
    [v4 setDelegate:0];

    [(CNContactListViewController *)self setShouldShowLimitedAccessTip:0];
    objc_opt_class();
    uint64_t v5 = [(CNContactListViewController *)self navigationItem];
    uint64_t v6 = [v5 titleView];
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    [v8 setHasIcon:1];
    [(CNContactListViewController *)self updateDataSourceAndCollectionViewForLimitedAccessTip];
    id v9 = [(CNContactListViewController *)self limitedAccessAppBundleId];
    +[CNPrivateAccessAggregator recordPickerTipDismissalForBundleIdentifier:v9];
  }
}

- (void)updateDataSourceAndCollectionViewForLimitedAccessTip
{
  id v3 = [(CNContactListViewController *)self collectionView];
  id v4 = [v3 window];

  if (v4)
  {
    uint64_t v5 = [(CNContactListViewController *)self collectionView];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__CNContactListViewController_updateDataSourceAndCollectionViewForLimitedAccessTip__block_invoke;
    v6[3] = &unk_1E549B488;
    v6[4] = self;
    [v5 performBatchUpdates:v6 completion:0];
  }
}

void __83__CNContactListViewController_updateDataSourceAndCollectionViewForLimitedAccessTip__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) collectionView];
  uint64_t v3 = [v2 numberOfSections];

  [*(id *)(a1 + 32) updateAdditionalSectionsAtTop];
  uint64_t v4 = [*(id *)(a1 + 32) numberOfSections];
  uint64_t v5 = [*(id *)(a1 + 32) pathToLimitedAccessTipRow];
  if (v3 == v4)
  {
    uint64_t v6 = CNUILogContactList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [*(id *)(a1 + 32) additionalSectionsAtTopCount];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v11;
      _os_log_debug_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEBUG, "Refreshing duplicates banner: reloading indexPath for banner | additional sections at top: %ld", buf, 0xCu);
    }

    id v7 = [*(id *)(a1 + 32) collectionView];
    uint64_t v14 = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v7 reloadItemsAtIndexPaths:v8];
  }
  else
  {
    id v9 = CNUILogContactList();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v3 >= v4)
    {
      if (v10)
      {
        uint64_t v13 = [*(id *)(a1 + 32) additionalSectionsAtTopCount];
        *(_DWORD *)buf = 134217984;
        uint64_t v16 = v13;
        _os_log_debug_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEBUG, "Refreshing duplicates banner: deleting section | additional sections at top: %ld", buf, 0xCu);
      }

      id v7 = [*(id *)(a1 + 32) collectionView];
      id v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      [v7 deleteSections:v8];
    }
    else
    {
      if (v10)
      {
        uint64_t v12 = [*(id *)(a1 + 32) additionalSectionsAtTopCount];
        *(_DWORD *)buf = 134217984;
        uint64_t v16 = v12;
        _os_log_debug_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEBUG, "Refreshing duplicates banner: inserting section | additional sections at top: %ld", buf, 0xCu);
      }

      id v7 = [*(id *)(a1 + 32) collectionView];
      id v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      [v7 insertSections:v8];
    }
  }
}

- (id)limitedAccessTipCell
{
  uint64_t v3 = [(CNContactListViewController *)self pathToLimitedAccessTipRow];
  uint64_t v4 = [(CNContactListViewController *)self collectionView];
  uint64_t v5 = [v4 cellForItemAtIndexPath:v3];

  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)appName
{
  uint64_t v3 = [(CNContactListViewController *)self limitedAccessAppName];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {

    uint64_t v4 = [(CNContactListViewController *)self limitedAccessAppBundleId];
    uint64_t v3 = +[CNLimitedAccessPickerSupport appNameForBundleId:v4];

    [(CNContactListViewController *)self setLimitedAccessAppName:v3];
  }

  return v3;
}

- (BOOL)containsPathToLimitedAccessTipRow:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CNContactListViewController_containsPathToLimitedAccessTipRow___block_invoke;
  v4[3] = &unk_1E54988F8;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

uint64_t __65__CNContactListViewController_containsPathToLimitedAccessTipRow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isPathToLimitedAccessTipRow:a2];
}

- (id)pathToLimitedAccessTipRow
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CNContactListViewController_pathToLimitedAccessTipRow__block_invoke;
  block[3] = &unk_1E549B488;
  void block[4] = self;
  if (pathToLimitedAccessTipRow_cn_once_token_17 != -1) {
    dispatch_once(&pathToLimitedAccessTipRow_cn_once_token_17, block);
  }
  return (id)pathToLimitedAccessTipRow_cn_once_object_17;
}

void __56__CNContactListViewController_pathToLimitedAccessTipRow__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "limitedAccessTipSection"));
  char v2 = (void *)pathToLimitedAccessTipRow_cn_once_object_17;
  pathToLimitedAccessTipRow_cn_once_object_17 = v1;
}

- (int64_t)limitedAccessTipSection
{
  return [(CNContactListViewController *)self isShowingLimitedAccessTip] - 1;
}

- (id)getVisibleIndexPaths
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(CNContactListViewController *)self isViewLoaded])
  {
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = [(CNContactListViewController *)self collectionView];
  uint64_t v4 = [v3 indexPathsForVisibleItems];

  if ([v4 count])
  {
    uint64_t v5 = [(CNContactListViewController *)self collectionView];
    id v6 = [v5 visibleCells];
    uint64_t v7 = [v6 count];

    if ([v4 count] != v7)
    {
      id v8 = CNUILogContactList();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v4 count];
        uint64_t v11 = [(CNContactListViewController *)self collectionView];
        uint64_t v12 = [v11 visibleCells];
        int v13 = 134218240;
        uint64_t v14 = v10;
        __int16 v15 = 2048;
        uint64_t v16 = [v12 count];
        _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "indexPathsForVisibleRows.count %lu != visibleCells.count = %lu", (uint8_t *)&v13, 0x16u);
      }
      goto LABEL_7;
    }
  }
LABEL_8:

  return v4;
}

uint64_t __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterHandlerForToken:*(void *)(a1 + 40)];
}

void __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) environment];
  uint64_t v3 = [v2 defaultSchedulerProvider];
  uint64_t v4 = [v3 mainThreadScheduler];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_3;
  v6[3] = &unk_1E549BF80;
  uint64_t v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 performBlock:v6];
}

void __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) getVisibleIndexPaths];
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_4;
    aBlock[3] = &unk_1E54988F8;
    aBlock[4] = *(void *)(a1 + 32);
    uint64_t v3 = _Block_copy(aBlock);
    uint64_t v4 = objc_msgSend(v2, "_cn_filter:", v3);
    [*(id *)(a1 + 32) setEmergencyContactIdentifiers:*(void *)(a1 + 40)];
    uint64_t v5 = objc_msgSend(v2, "_cn_filter:", v3);
    if (([v4 isEqual:v5] & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 32) collectionView];
      [v6 reloadData];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setEmergencyContactIdentifiers:*(void *)(a1 + 40)];
  }
}

uint64_t __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _contactAtCollectionViewIndexPath:a2];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 identifier];
  uint64_t v6 = [v4 isContactWithIdentifierEmergencyContact:v5];

  return v6;
}

- (void)setupVCardImportController
{
  uint64_t v3 = [(CNContactListViewController *)self vCardImportController];

  if (!v3)
  {
    id v11 = [(CNContactListViewController *)self contactStore];
    objc_opt_class();
    uint64_t v4 = [(CNContactListViewController *)self navigationController];
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id v7 = [v6 targetGroupForNewContact];
      id v8 = [v6 targetContainerForNewContactWithTargetGroup:v7];
    }
    else
    {
      id v7 = 0;
      id v8 = 0;
    }
    id v9 = [[CNVCardImportController alloc] initWithContactStore:v11 presentationDelegate:self targetGroup:v7 targetContainer:v8];
    [(CNContactListViewController *)self setVCardImportController:v9];

    uint64_t v10 = [(CNContactListViewController *)self vCardImportController];
    [v10 setDelegate:self];
  }
}

- (void)pasteContacts:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1A78], "generalPasteboard", a3);
  uint64_t v5 = *MEMORY[0x1E4F5A258];
  id v6 = [v4 itemProviders];
  char v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    [(CNContactListViewController *)self setupVCardImportController];
    id v8 = [(CNContactListViewController *)self contactProvidersOnPasteboard];
    if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v8) & 1) == 0)
    {
      id v23 = self;
      id v24 = v4;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = v8;
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
        uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
        do
        {
          uint64_t v13 = 0;
          uint64_t v14 = v12;
          do
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(obj);
            }
            __int16 v15 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
            id v16 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
            uint64_t v17 = objc_opt_class();
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __45__CNContactListViewController_pasteContacts___block_invoke;
            v28[3] = &unk_1E54988D0;
            id v29 = v16;
            id v18 = v16;
            id v19 = (id)[v15 loadObjectOfClass:v17 completionHandler:v28];
            long long v20 = [v18 future];
            id v21 = [v20 result:0];

            uint64_t v12 = [v14 arrayByAddingObjectsFromArray:v21];

            ++v13;
            uint64_t v14 = v12;
          }
          while (v10 != v13);
          uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v10);
      }
      else
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__CNContactListViewController_pasteContacts___block_invoke_2;
      block[3] = &unk_1E549BF80;
      void block[4] = v23;
      id v27 = v12;
      id v22 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);

      uint64_t v4 = v24;
    }
  }
}

void __45__CNContactListViewController_pasteContacts___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v10[0] = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v8 = +[CNContactViewController descriptorForRequiredKeys];
    uint64_t v9 = +[CNUIDraggingContacts contactsFromDraggingContacts:v7 withKeys:v8];

    [*(id *)(a1 + 32) finishWithResult:v9];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CBF0]];
  }
}

void __45__CNContactListViewController_pasteContacts___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) vCardImportController];
  [v2 enqueueContacts:*(void *)(a1 + 40)];
}

- (id)contactProvidersOnPasteboard
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  uint64_t v3 = *MEMORY[0x1E4F5A258];
  id v4 = [v2 itemProviders];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v2 itemProviders];
    uint64_t v5 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_615);
  }

  return v5;
}

uint64_t __59__CNContactListViewController_contactProvidersOnPasteboard__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 canLoadObjectOfClass:objc_opt_class()];

  return v3;
}

- (void)vCardImportControllerDidCompleteQueue:(id)a3
{
}

- (void)vCardImportController:(id)a3 didSaveContacts:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "firstObject", a3);
  if (v5)
  {
    uint64_t v9 = v5;
    [(CNContactListViewController *)self selectContact:v5 animated:0 scrollPosition:2];
    id v6 = [(CNContactListViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    uint64_t v5 = v9;
    if (v7)
    {
      id v8 = [(CNContactListViewController *)self delegate];
      [v8 contactListViewController:self didSelectContact:v9 shouldScrollToContact:0];

      uint64_t v5 = v9;
    }
  }
}

- (void)vCardImportController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(CNContactListViewController *)self splitViewController];
  [v8 presentViewController:v7 animated:v5 completion:0];
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4FB15B8]) initWithDropOperation:2 dropLocation:2];

  return v5;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return +[CNUIDraggingContacts canAcceptDropForDropSession:a4];
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(CNContactListViewController *)self setupVCardImportController];
  id v6 = [v5 dropSession];
  int v7 = [v6 canLoadObjectsOfClass:objc_opt_class()];

  if (v7)
  {
    id v8 = [v5 dropSession];
    uint64_t v9 = [MEMORY[0x1E4F1B998] descriptorForRequiredKeys];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke;
    v14[3] = &unk_1E5499068;
    v14[4] = self;
    +[CNUIDraggingContacts provideContactsForDropSession:v8 withKeys:v9 completionBlock:v14];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v10 = [v5 dropSession];
  v15[0] = *MEMORY[0x1E4F225B8];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v12 = [v10 hasItemsConformingToTypeIdentifiers:v11];

  if (v12)
  {
    id v8 = [v5 dropSession];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke_2;
    v13[3] = &unk_1E5498888;
    void v13[4] = self;
    +[CNUIDraggingContacts provideVCardURLForDropSession:v8 completionBlock:v13];
    goto LABEL_5;
  }
LABEL_6:
}

void __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) vCardImportController];
    [v3 enqueueContacts:v4];
  }
}

void __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 vCardImportController];
  [v4 enqueueContactsAtURL:v3];
}

- (id)dragItemsForIndexPath:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNContactListViewController *)self isPathToCreateNewContactRow:v4]
    || [(CNContactListViewController *)self isPathToDuplicatesBanner:v4]
    || [(CNContactListViewController *)self isPathToContentUnavailableRow:v4]
    || [(CNContactListViewController *)self isPathToLimitedAccessTipRow:v4])
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v7 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v4];
    if (v7)
    {
      id v8 = [(CNContactListViewController *)self contactStore];
      uint64_t v9 = +[CNUIDraggingContacts dragItemForContact:v7 withContactStore:v8];
      v10[0] = v9;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      id v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v5;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v7 = a5;
  if ([(CNContactListViewController *)self shouldAllowDrags])
  {
    id v8 = [(CNContactListViewController *)self dragItemsForIndexPath:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  if ([(CNContactListViewController *)self shouldAllowDrags])
  {
    id v7 = [(CNContactListViewController *)self dragItemsForIndexPath:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)selectPreviousContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListViewController *)self navigationController];
  [v5 selectPreviousContact:v4];
}

- (void)selectNextContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListViewController *)self navigationController];
  [v5 selectNextContact:v4];
}

- (void)dismissKeyboard
{
  id v3 = [(CNContactListViewController *)self splitViewController];

  if (v3)
  {
    id v5 = [(CNContactListViewController *)self splitViewController];
    id v4 = [v5 view];
    [v4 endEditing:1];
  }
}

- (void)copyContacts:(id)a3
{
  id v4 = [(CNContactListViewController *)self collectionView];
  id v7 = [v4 indexPathsForSelectedItems];

  id v5 = [(CNContactListViewController *)self contactsForActionsAtIndexPaths:v7];
  id v6 = [(CNContactListViewController *)self actionHelper];
  [v6 copyContacts:v5];
}

- (void)mergeUnifyContacts:(id)a3
{
  id v5 = [(CNContactListViewController *)self mergableContacts];
  if (v5)
  {
    id v4 = [(CNContactListViewController *)self actionHelper];
    [v4 mergeContacts:v5];
  }
}

- (id)mergableContacts
{
  id v3 = [(CNContactListViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  if ((unint64_t)[v4 count] < 2)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(CNContactListViewController *)self contactsForActionsAtIndexPaths:v4];
    if ((unint64_t)[v5 count] < 2) {
      id v6 = 0;
    }
    else {
      id v6 = v5;
    }
  }

  return v6;
}

- (void)deleteContact:(id)a3
{
  id v4 = [(CNContactListViewController *)self collectionView];
  id v11 = [v4 indexPathsForSelectedItems];

  if ([v11 count])
  {
    id v5 = [(CNContactListViewController *)self contactsForActionsAtIndexPaths:v11];
    objc_opt_class();
    id v6 = [(CNContactListViewController *)self dataSource];
    id v7 = [v6 filter];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    uint64_t v10 = [(CNContactListViewController *)self actionHelper];
    [v10 deleteContacts:v5 dataSourceFilter:v9];
  }
}

- (void)startSearchingForString:(id)a3 setSearchBarAsFirstResponder:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if ([(CNContactListViewController *)self isViewLoaded]
    && ([(CNContactListViewController *)self view],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 window],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [(CNContactListViewController *)self searchController];
    int v9 = [v8 isActive];

    if (v9)
    {
      uint64_t v10 = [(CNContactListViewController *)self searchController];
      id v11 = [v10 searchBar];
      [v11 setText:v13];

      if (!v4) {
        goto LABEL_9;
      }
      int v12 = [(CNContactListViewController *)self searchBar];
      [v12 becomeFirstResponder];
    }
    else
    {
      [(CNContactListViewController *)self setPendingSearchQuery:v13];
      [(CNContactListViewController *)self setShouldSearchBarBecomeFirstResponder:v4];
      int v12 = [(CNContactListViewController *)self searchController];
      [v12 setActive:1];
    }
  }
  else
  {
    [(CNContactListViewController *)self setPendingSearchQuery:v13];
    [(CNContactListViewController *)self setShouldSearchBarBecomeFirstResponder:v4];
    [(CNContactListViewController *)self setPendingSearchControllerActivation:1];
  }
LABEL_9:
}

- (void)startSearching
{
}

- (void)cancelSearch:(id)a3
{
  BOOL v4 = [(CNContactListViewController *)self searchController];
  [v4 setActive:0];

  id v5 = [(CNContactListViewController *)self searchBar];
  [(CNContactListViewController *)self searchBarCancelButtonClicked:v5];
}

- (void)beginSearch:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(CNContactListViewController *)self searchController];
    id v5 = [v4 searchBar];
    [v5 setText:v10];
  }
  id v6 = [(CNContactListViewController *)self searchController];
  if ([v6 isActive])
  {
    BOOL v7 = [(CNContactListViewController *)self shouldSearchBarBecomeFirstResponder];

    if (v7)
    {
      id v8 = [(CNContactListViewController *)self searchController];
      int v9 = [v8 searchBar];
      [v9 becomeFirstResponder];

      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = [(CNContactListViewController *)self searchController];
  [v8 setActive:1];
LABEL_8:
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_isEqual(a3, sel_mergeUnifyContacts_))
  {
    BOOL v7 = [(CNContactListViewController *)self mergableContacts];
    LOBYTE(a3) = v7 != 0;
  }
  else if (sel_isEqual(a3, sel_pasteContacts_))
  {
    a3 = (SEL)*MEMORY[0x1E4F5A258];
    id v8 = [(CNContactListViewController *)self contactProvidersOnPasteboard];
    LODWORD(a3) = (*((uint64_t (**)(SEL, void *))a3 + 2))(a3, v8) ^ 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNContactListViewController;
    LOBYTE(a3) = [(CNContactListViewController *)&v10 canPerformAction:a3 withSender:v6];
  }

  return (char)a3;
}

- (void)bannerView:(id)a3 wasSelectedToPresentMeContact:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(CNContactListViewController *)self collectionView];
  BOOL v7 = [v6 indexPathsForSelectedItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
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
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        id v13 = [(CNContactListViewController *)self collectionView];
        [v13 deselectItemAtIndexPath:v12 animated:1];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v21 = *MEMORY[0x1E4F1AE08];
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  __int16 v15 = (void *)[v5 copyWithPropertyKeys:v14];

  id v16 = [(CNContactListViewController *)self delegate];
  [v16 contactListViewController:self shouldPresentContact:v15 shouldScrollToContact:0];
}

- (void)suggestionsController:(id)a3 didChangeToHeight:(double)a4
{
  -[CNContactListViewController setSuggestionsControllerHeight:](self, "setSuggestionsControllerHeight:", a3, a4);

  [(CNContactListViewController *)self refreshTableViewHeader];
}

- (id)ignoredContactIdentifiersForSuggestionsController:(id)a3
{
  id v3 = [(CNContactListViewController *)self suggestionsIgnoredContactIdentifiers];
  BOOL v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)suggestionsController:(id)a3 didDeselectContact:(id)a4
{
  id v5 = a4;
  if ([(CNContactListViewController *)self allowsMultiSelection]) {
    [(CNContactListViewController *)self setCellStateSelected:0 forContact:v5 animated:0];
  }
}

- (void)suggestionsController:(id)a3 didSelectContact:(id)a4
{
  id v6 = a4;
  id v5 = [(CNContactListViewController *)self delegate];
  [v5 contactListViewController:self didSelectContact:v6];

  if ([(CNContactListViewController *)self allowsMultiSelection]) {
    [(CNContactListViewController *)self setCellStateSelected:1 forContact:v6 animated:0];
  }
}

- (BOOL)suggestionsController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CNContactListViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(CNContactListViewController *)self delegate];
    char v14 = [v13 contactSuggestionViewController:v8 shouldSelectContact:v9 atIndexPath:v10];
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (BOOL)suggestionsController:(id)a3 canSelectContact:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 contactListViewController:self canSelectContact:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)setMeContactBannerFootnoteValue:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_meContactBannerFootnoteValue != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_meContactBannerFootnoteValue, a3);
    [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
    id v5 = v6;
  }
}

- (void)setMeContactBannerFootnoteLabel:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_meContactBannerFootnoteLabel != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_meContactBannerFootnoteLabel, a3);
    [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
    id v5 = v6;
  }
}

- (CNContactSuggestionsViewController)suggestionsController
{
  suggestionsController = self->_suggestionsController;
  if (!suggestionsController)
  {
    BOOL v4 = objc_alloc_init(CNContactSuggestionsViewController);
    id v5 = self->_suggestionsController;
    self->_suggestionsController = v4;

    [(CNContactSuggestionsViewController *)self->_suggestionsController setDelegate:self];
    id v6 = CNContactsUIBundle();
    char v7 = [v6 localizedStringForKey:@"SUGGESTED" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNContactSuggestionsViewController *)self->_suggestionsController setSuggestionsHeaderTitle:v7];

    [(CNContactSuggestionsViewController *)self->_suggestionsController setAllowsMultiSelection:[(CNContactListViewController *)self allowsMultiSelection]];
    id v8 = [(CNContactListViewController *)self suggestionsInteractionDomains];
    [(CNContactSuggestionsViewController *)self->_suggestionsController setInteractionDomains:v8];

    char v9 = [(CNContactListViewController *)self suggestedContacts];
    [(CNContactSuggestionsViewController *)self->_suggestionsController setOverrideSuggestedContacts:v9];

    suggestionsController = self->_suggestionsController;
  }

  return suggestionsController;
}

- (void)setShouldDisplaySuggestionsController:(BOOL)a3
{
  if (self->_shouldDisplaySuggestionsController != a3)
  {
    self->_shouldDisplaySuggestionsController = a3;
    if ([(CNContactListViewController *)self isViewLoaded])
    {
      [(CNContactListViewController *)self refreshTableViewHeader];
    }
  }
}

void __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_3;
  v17[3] = &unk_1E54987C0;
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 104);
  long long v20 = *(_OWORD *)(a1 + 88);
  long long v21 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_4;
  v8[3] = &unk_1E54987E8;
  id v4 = *(id *)(a1 + 40);
  long long v14 = *(_OWORD *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 136);
  long long v15 = *(_OWORD *)(a1 + 120);
  long long v16 = v7;
  long long v13 = *(_OWORD *)(a1 + 72);
  [v2 animateWithDuration:v17 animations:v8 completion:0.33];
}

uint64_t __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56) + *(double *)(a1 + 72);
  id v4 = *(void **)(a1 + 40);

  return objc_msgSend(v4, "setContentOffset:", v2, v3);
}

uint64_t __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 40) tipKitDismissTip];
  if (*(void *)(a1 + 48))
  {
    double v2 = *(double *)(a1 + 104);
    if (!*(void *)(a1 + 56))
    {
      double v3 = 0.0;
LABEL_6:
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 56) = v2 + v3;
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 56));
      [*(id *)(a1 + 40) setEstimatedListHeaderViewHeight:*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 56)];
      goto LABEL_7;
    }
LABEL_5:
    double v3 = *(double *)(a1 + 120);
    goto LABEL_6;
  }
  double v2 = 0.0;
  if (*(void *)(a1 + 56)) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

LABEL_7:
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v5 = *(void **)(a1 + 40);

  return [v5 setListHeaderView:v4];
}

- (void)setNeedsHeaderViewUpdate
{
  self->_headerViewNeedsUpdate = 1;
}

- (void)refreshTableViewHeaderForContactChanges
{
  if (![(CNContactListViewController *)self isSearchController])
  {
    if ([(CNContactListViewController *)self shouldDisplayTipContentView]
      || ([(CNContactListViewController *)self tipKitContentView],
          double v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
    }
  }
  BOOL v4 = [(CNContactListViewController *)self shouldDisplayMeContactBanner];
  BOOL v5 = [(CNContactListViewController *)self shouldDisplaySuggestionsController];
  id v6 = [(CNContactSuggestionsViewController *)self->_suggestionsController viewIfLoaded];
  uint64_t v7 = [v6 superview];

  id v8 = [(CNContactListViewController *)self meContactBanner];
  id v9 = [v8 superview];

  if (v7) {
    int v10 = 1;
  }
  else {
    int v10 = v5;
  }
  if (v4 && v9 && (v10 & 1) == 0)
  {
    [(CNContactListViewController *)self updateMeContactBannerContentsWithTopKeyline:0];
  }
  else
  {
    if (v9) {
      int v11 = 1;
    }
    else {
      int v11 = v4;
    }
    if (v7) {
      BOOL v12 = v5;
    }
    else {
      BOOL v12 = 0;
    }
    int v13 = v12 & (v11 ^ 1);
    int v14 = v13 | v10;
    int v15 = v13 ^ 1;
    if (v14) {
      int v16 = v15;
    }
    else {
      int v16 = v11;
    }
    if (v16 == 1)
    {
      [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
    }
  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    BOOL v5 = [(CNContactListViewController *)self view];
    [v5 safeAreaInsets];
    double v7 = 0.0 - (v6 + 1.0);

    id v8 = [(CNContactListViewController *)self collectionView];
    objc_msgSend(v8, "setContentOffset:animated:", v3, 0.0, v7);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    -[CNContactListViewController scrollToItemAtIndexPath:animated:scrollPosition:](self, "scrollToItemAtIndexPath:animated:scrollPosition:");
  }
}

- (double)contactListHeaderHeight
{
  BOOL v3 = [(CNContactListViewController *)self listHeaderView];

  if (!v3) {
    return 0.0;
  }
  BOOL v4 = [(CNContactListViewController *)self listHeaderView];
  [v4 frame];
  double v6 = v5;

  return v6;
}

- (void)refreshTableViewHeaderIfVisibleWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    double v6 = [(CNContactListViewController *)self view];
    double v7 = [v6 window];

    if (v7)
    {
      -[CNContactListViewController refreshTableViewHeaderWithSize:](self, "refreshTableViewHeaderWithSize:", width, height);
    }
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [(CNContactListViewController *)self updateSelectedContactCount];
  if (self->_suggestionsController && [(CNContactListViewController *)self allowsMultiSelection])
  {
    double v5 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v6];
    [(CNContactSuggestionsViewController *)self->_suggestionsController setCellStateSelected:0 forContact:v5 animated:0];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (![(CNContactListViewController *)self isPathToDuplicatesBanner:v6]
    && ![(CNContactListViewController *)self isPathToCreateNewContactRow:v6]
    && ![(CNContactListViewController *)self isPathToContentUnavailableRow:v6]
    && ![(CNContactListViewController *)self isPathToLimitedAccessTipRow:v6])
  {
    if (self->_suggestionsController
      && [(CNContactListViewController *)self allowsMultiSelection])
    {
      double v7 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v6];
      [(CNContactSuggestionsViewController *)self->_suggestionsController setCellStateSelected:1 forContact:v7 animated:0];
    }
    [(CNContactListViewController *)self updateSelectedContactCount];
    if ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
    {
      id v8 = [(CNContactListViewController *)self collectionView];
      int v9 = [v8 allowsMultipleSelection];

      if (v9)
      {
        int v10 = [v12 indexPathsForSelectedItems];
        unint64_t v11 = [v10 count];

        if (v11 <= 1) {
          [(CNContactListViewController *)self showCardForSelectedContactAtIndexPath:v6];
        }
      }
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v4 = a3;
  if ([v4 isEditing]
    && ([v4 allowsMultipleSelectionDuringEditing] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v4 indexPathsForSelectedItems];
    BOOL v5 = (unint64_t)[v6 count] > 1;
  }
  return v5;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(CNContactListViewController *)self isPathToDuplicatesBanner:v5])
  {
    BOOL v6 = [(CNContactListViewController *)self canPerformDuplicatesMerge];
    goto LABEL_8;
  }
  if ([(CNContactListViewController *)self isPathToCreateNewContactRow:v5])
  {
    [(CNContactListViewController *)self createNewContactTapped];
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  if ([(CNContactListViewController *)self isPathToContentUnavailableRow:v5]
    || [(CNContactListViewController *)self isPathToLimitedAccessTipRow:v5])
  {
    goto LABEL_7;
  }
  BOOL v8 = [(CNContactListViewController *)self canSelectContactAtCollectionViewIndexPath:v5];
  if (v5) {
    BOOL v6 = v8;
  }
  else {
    BOOL v6 = 0;
  }
LABEL_8:

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (![(CNContactListViewController *)self isPathToCreateNewContactRow:v5])
  {
    if ([(CNContactListViewController *)self isPathToDuplicatesBanner:v5]
      || [(CNContactListViewController *)self isPathToContentUnavailableRow:v5]
      || [(CNContactListViewController *)self isPathToLimitedAccessTipRow:v5]
      || ![(CNContactListViewController *)self canSelectContactAtCollectionViewIndexPath:v5]|| [(CNContactListViewController *)self limitedAccessPickerType] == 5)
    {
      char v6 = 0;
      goto LABEL_9;
    }
    BOOL v8 = [(CNContactListViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      int v10 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v5];
      unint64_t v11 = [(CNContactListViewController *)self delegate];
      char v6 = [v11 contactListViewController:self shouldSelectContact:v10 atIndexPath:v5];

      goto LABEL_9;
    }
  }
  char v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  id v4 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:a4];
  char v5 = [v4 isSuggested] ^ 1;

  return v5;
}

- (void)setImageForContact:(id)a3 imageUpdateBlock:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, void *))a4;
  BOOL v8 = [(CNContactListViewController *)self avatarRenderer];

  if (!v8)
  {
    char v9 = [CNAvatarImageRenderer alloc];
    int v10 = +[CNAvatarImageRendererSettings defaultSettingsWithCacheSize:8];
    unint64_t v11 = [(CNAvatarImageRenderer *)v9 initWithSettings:v10];
    [(CNContactListViewController *)self setAvatarRenderer:v11];
  }
  id v12 = [(CNContactListViewController *)self traitCollection];
  BOOL v13 = [v12 layoutDirection] == 1;

  int v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 scale];
  int v16 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v13, 0, 48.0, 48.0, v15);

  long long v17 = [(CNContactListViewController *)self avatarRenderer];
  v20[0] = v6;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v19 = [v17 avatarImageForContacts:v18 scope:v16];
  v7[2](v7, v19);
}

uint64_t __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createNewContactTapped];
}

uint64_t __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAvatarImage:a2];
}

void __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    char v5 = [v4 collectionView];
    id v6 = [v5 indexPathForCell:WeakRetained];

    if (v6)
    {
      double v7 = (void *)MEMORY[0x1E4FB1EB0];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_4;
      v8[3] = &unk_1E549BF80;
      void v8[4] = v4;
      id v9 = v6;
      [v7 performWithoutAnimation:v8];
    }
  }
}

void __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) collectionView];
  v4[0] = *(void *)(a1 + 40);
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 reloadItemsAtIndexPaths:v3];
}

- (void)updateAdditionalSectionsAtTop
{
  BOOL v3 = [(CNContactListViewController *)self shouldShowDuplicateBannerView];

  [(CNContactListViewController *)self setIsShowingDuplicatesBanner:v3];
}

- (void)contactDataSourceMeContactDidChange:(id)a3
{
  id v4 = +[CNUIContactsEnvironment currentEnvironment];
  char v5 = [v4 defaultSchedulerProvider];
  id v6 = [v5 mainThreadScheduler];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CNContactListViewController_contactDataSourceMeContactDidChange___block_invoke;
  void v7[3] = &unk_1E549B488;
  v7[4] = self;
  [v6 performBlock:v7];
}

uint64_t __67__CNContactListViewController_contactDataSourceMeContactDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1016);
  *(void *)(v2 + 1016) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 refreshTableViewHeaderForContactChanges];
}

- (void)reloadTitle
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CNContactDataSource *)self->_dataSource displayName];
    [(CNContactListViewController *)self setTitle:v3];
  }
}

- (void)contactDataSourceDisplayNameDidChange:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v5 displayName];
    [(CNContactListViewController *)self setTitle:v4];
  }
}

- (void)contactDataSourceDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListViewController *)self environment];
  id v6 = [v5 defaultSchedulerProvider];
  double v7 = [v6 mainThreadScheduler];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CNContactListViewController_contactDataSourceDidChange___block_invoke;
  v9[3] = &unk_1E549BF80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

void __58__CNContactListViewController_contactDataSourceDidChange___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) updateIsViewingTopLevelAllContacts];
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  id v3 = [*(id *)(a1 + 32) selectedContacts];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 40) displayName];
    [*(id *)(a1 + 32) setTitle:v4];
  }
  id v5 = (void *)MEMORY[0x1E4FB1EB0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_2;
  v20[3] = &unk_1E549BF80;
  v20[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v21 = v6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_552;
  v19[3] = &unk_1E549B1C0;
  void v19[4] = *(void *)(a1 + 32);
  [v5 animateWithDuration:v20 animations:v19 completion:0.0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v22 count:16];
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
        objc_msgSend(*(id *)(a1 + 32), "selectContact:animated:scrollPosition:shouldScroll:", *(void *)(*((void *)&v15 + 1) + 8 * v11++), 0, 0, 0, (void)v15);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v22 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 32) _setNeedsUpdateContentUnavailableConfiguration];
  [*(id *)(a1 + 32) setNeedsHeaderViewUpdate];
  [*(id *)(a1 + 32) _updateCountStringNow:1];
  id v12 = [*(id *)(a1 + 32) delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    int v14 = [*(id *)(a1 + 32) delegate];
    [v14 dataSourceChangedForContactListViewController:*(void *)(a1 + 32)];
  }
}

void __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPerformingDuplicatesMerge])
  {
    uint64_t v2 = CNUILogContactList();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v4 = 0;
      _os_log_debug_impl(&dword_18B625000, v2, OS_LOG_TYPE_DEBUG, "Currently performing duplicates merge, deferring reload until complete", v4, 2u);
    }
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    [v3 reloadData];
  }
}

void __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_552(uint64_t a1, int a2)
{
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) visibleListViewController];
    id v3 = [v7 dataSource];
    uint64_t v4 = [v3 contacts];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [*(id *)(a1 + 32) searchCompletionBlock];

      if (!v6) {
        return;
      }
      id v7 = [*(id *)(a1 + 32) searchCompletionBlock];
      [*(id *)(a1 + 32) setSearchCompletionBlock:0];
      v7[2]();
    }
    else
    {
    }
  }
}

uint64_t __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createNewContactTapped];
}

void __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 sender];
  [*(id *)(a1 + 32) addContactsToListTappedWithSourceView:v3];
}

- (BOOL)isShowingCustomTitle
{
  objc_opt_class();
  id v3 = [(CNContactListViewController *)self dataSource];
  uint64_t v4 = [v3 filter];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 customDisplayName];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isShowingServerSearch
{
  objc_opt_class();
  id v3 = [(CNContactListViewController *)self dataSource];
  uint64_t v4 = [v3 filter];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    char v7 = [v6 isServerFilter];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)showingGroup
{
  objc_opt_class();
  id v3 = [(CNContactListViewController *)self dataSource];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    char v6 = [v5 filterShowsSingleGroup];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)didDismissSearchController:(id)a3
{
  uint64_t v4 = [(CNContactListViewController *)self navigationItem];
  [v4 setBackButtonTitle:0];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(CNContactDataSource *)self->_dataSource shouldReturnToAccountsAndGroupsViewAfterSearchIsCanceled])
  {
    id v5 = [(CNContactListViewController *)self navigationController];
    [v5 presentGroupsViewController:0];
  }
  id v6 = [(CNContactListViewController *)self navigationController];
  [v6 clearServerSearchIfNeeded:0];
}

- (void)willDismissSearchController:(id)a3
{
  +[CNUIDataCollectionSearchSession end];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(CNContactDataSource *)self->_dataSource displayName];
    [(CNContactListViewController *)self setTitle:v4];
  }
  id v5 = [(CNContactListViewController *)self collectionView];
  [v5 setHidden:0];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v4 = [(CNContactListViewController *)self searchBar];
  id v5 = [v4 searchField];
  id v24 = [v5 text];

  int v6 = [&stru_1ED8AC728 isEqual:v24];
  char v7 = v6;
  if (v6)
  {
    BOOL v8 = [(CNContactListViewController *)self searchResultsController];
    uint64_t v9 = [v8 dataSource];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(CNContactListViewController *)self searchResultsController];
      id v12 = [v11 dataSource];
      [v12 reset];
    }
  }
  [(CNContactListViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  char v13 = [(CNContactDataSource *)self->_dataSource filter];
  int v14 = (void *)[v13 copy];

  [v14 setFullTextString:v24];
  long long v15 = [(CNContactListViewController *)self searchResultsController];
  long long v16 = [v15 dataSource];
  long long v17 = [v16 filter];
  char v18 = [v14 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    id v19 = +[CNUIDataCollectionSearchSession currentSession];
    [v19 searchStringDidChange];

    long long v20 = [(CNContactListViewController *)self searchResultsController];
    id v21 = [v20 dataSource];
    [v21 setFilter:v14];

    if ((v7 & 1) == 0)
    {
      id v22 = [(CNContactListViewController *)self searchResultsController];
      uint64_t v23 = [v22 dataSource];

      if (objc_opt_respondsToSelector()) {
        [v23 reloadAsynchronously];
      }
      else {
        [v23 reload];
      }
    }
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  uint64_t v4 = [(CNContactListViewController *)self searchBar];
  [v4 setText:&stru_1ED8AC728];

  id v5 = [(CNContactListViewController *)self searchController];
  [(CNContactListViewController *)self updateSearchResultsForSearchController:v5];
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListViewController *)self pendingSearchQuery];

  if (v5)
  {
    int v6 = [(CNContactListViewController *)self pendingSearchQuery];
    char v7 = [v4 searchBar];
    [v7 setText:v6];

    [(CNContactListViewController *)self setPendingSearchQuery:0];
  }
  BOOL v8 = [(CNContactListViewController *)self shouldSearchBarBecomeFirstResponder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __58__CNContactListViewController_didPresentSearchController___block_invoke;
  v10[3] = &unk_1E5499510;
  BOOL v12 = v8;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __58__CNContactListViewController_didPresentSearchController___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) searchBar];
    char v3 = [v2 isFirstResponder];

    if ((v3 & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 32) searchBar];
      [v4 becomeFirstResponder];
    }
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"SEARCH_NAV_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  int v6 = [(CNContactListViewController *)self navigationItem];
  [v6 setBackButtonTitle:v5];

  +[CNUIDataCollectionSearchSession begin];
  if (!CNUIIsFaceTime())
  {
    char v7 = [(CNContactListViewController *)self view];
    if ([v7 isOpaque])
    {
      BOOL v8 = [(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers];

      if (!v8) {
        return;
      }
    }
    else
    {
    }
  }
  id v9 = [(CNContactListViewController *)self collectionView];
  [v9 setHidden:1];
}

- (NSString)currentSearchString
{
  char v3 = [(CNContactListViewController *)self searchBar];

  if (v3)
  {
    id v4 = [(CNContactListViewController *)self searchBar];
    id v5 = [v4 text];
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"effectiveFilter"])
  {
    char v13 = [(CNContactListViewController *)self searchCompletionBlock];

    if (v13)
    {
      int v14 = [(CNContactListViewController *)self searchCompletionBlock];
      [(CNContactListViewController *)self setSearchCompletionBlock:0];
      v14[2](v14);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CNContactListViewController;
    [(CNContactListViewController *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)searchForString:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  id v10 = a3;
  id v7 = a5;
  if (v10)
  {
    [(CNContactListSearchController *)self->_searchController setActive:1];
    if (self->_shouldSearchBarBecomeFirstResponder) {
      [(UISearchBar *)self->_searchBar becomeFirstResponder];
    }
    [(CNContactListViewController *)self setSearchCompletionBlock:v7];
    BOOL v8 = [(CNContactListViewController *)self searchResultsController];
    id v9 = [v8 dataSource];
    [v9 addObserver:self forKeyPath:@"effectiveFilter" options:0 context:0];

    [(UISearchBar *)self->_searchBar setText:v10];
  }
  else
  {
    [(CNContactListViewController *)self setSearchCompletionBlock:0];
    [(CNContactListSearchController *)self->_searchController setActive:0];
  }
}

- (BOOL)hasSearchPrefix
{
  BOOL v3 = [(CNContactListViewController *)self isSearching];
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F5A2A0];
    id v5 = [(CNContactListViewController *)self currentSearchString];
    LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    LOBYTE(v3) = v4;
  }
  return v3;
}

- (void)_searchBarDidEndEditing:(id)a3
{
  uint64_t v4 = [(CNContactListViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(CNContactListViewController *)self searchBar];
    id v7 = [v6 searchField];
    [v7 resignFirstResponder];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CNContactListViewController__searchBarDidEndEditing___block_invoke;
    block[3] = &unk_1E549B488;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__CNContactListViewController__searchBarDidEndEditing___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CNContactListViewController__searchBarDidEndEditing___block_invoke_2;
  block[3] = &unk_1E549B488;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __55__CNContactListViewController__searchBarDidEndEditing___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) splitViewController];
  int v3 = [v2 isFirstResponder];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = [v5 nextResponderForContactListViewController:*(void *)(a1 + 32)];
    [v4 becomeFirstResponder];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(CNContactListViewController *)self reloadContacts];

  [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  uint64_t v4 = [(CNUIContactsEnvironment *)self->_environment defaultSchedulerProvider];
  id v5 = [v4 mainThreadScheduler];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CNContactListViewController_contactStoreDidChangeWithNotification___block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v5 performBlock:v6];
}

void __69__CNContactListViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshTableViewHeaderForContactChanges];
  if ([*(id *)(a1 + 32) hasNoContacts])
  {
    dispatch_time_t v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      [v4 resetContactViewController];
    }
  }
}

- (void)updateSelectedContactCount
{
  objc_opt_class();
  char v3 = [(CNContactListViewController *)self collectionView];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v6 = v4;

  id v5 = v6;
  if (v6)
  {
    [v6 updateSelectedContactCount];
    [(CNContactListViewController *)self updateInResponseToLimitedAccessSelectionChanged];
    id v5 = v6;
  }
}

- (void)reloadContacts
{
  [(CNContactDataSource *)self->_dataSource reload];

  [(CNContactListViewController *)self refreshDuplicates];
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __77__CNContactListViewController_selectItemAtIndexPath_animated_scrollPosition___block_invoke;
  long long v20 = &unk_1E5498748;
  unint64_t v23 = a5;
  id v21 = self;
  id v9 = v8;
  id v22 = v9;
  BOOL v24 = v6;
  id v10 = (void (**)(void))_Block_copy(&v17);
  if (-[CNContactListViewController isValidIndexPath:](self, "isValidIndexPath:", v9, v17, v18, v19, v20, v21))
  {
    id v11 = [(CNContactListViewController *)self collectionView];
    [v11 selectItemAtIndexPath:v9 animated:v6 scrollPosition:a5];

    id v12 = [(CNContactListViewController *)self collectionView];
    if ([v12 isEditing])
    {
      char v13 = [(CNContactListViewController *)self collectionView];
      char v14 = [v13 allowsMultipleSelectionDuringEditing];

      if (v14) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    [(CNContactListViewController *)self deselectAllItemsExceptIndexPath:v9];
  }
LABEL_7:
  if ([(CNContactListViewController *)self isViewLoaded]
    && ([(CNContactListViewController *)self collectionView],
        objc_super v15 = objc_claimAutoreleasedReturnValue(),
        [v15 window],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    v10[2](v10);
  }
  else
  {
    [(CNContactListViewController *)self performWhenViewIsLaidOut:v10];
  }
}

void __77__CNContactListViewController_selectItemAtIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 48) && [*(id *)(a1 + 32) isValidIndexPath:*(void *)(a1 + 40)])
  {
    id v2 = [*(id *)(a1 + 32) collectionView];
    [v2 scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:0 animated:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (void)scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __79__CNContactListViewController_scrollToItemAtIndexPath_animated_scrollPosition___block_invoke;
  uint64_t v17 = &unk_1E5498748;
  uint64_t v18 = self;
  id v19 = v8;
  unint64_t v20 = a5;
  BOOL v21 = a4;
  id v9 = v8;
  id v10 = (void (**)(void))_Block_copy(&v14);
  if ([(CNContactListViewController *)self isViewLoaded]
    && ([(CNContactListViewController *)self collectionView],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 window],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12))
  {
    v10[2](v10);
  }
  else
  {
    char v13 = [(CNContactListViewController *)self pendingSearchQuery];

    if (v13) {
      [(CNContactListViewController *)self performWhenSearchCompleted:v10];
    }
    else {
      [(CNContactListViewController *)self performWhenViewIsLaidOut:v10];
    }
  }
}

void __79__CNContactListViewController_scrollToItemAtIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) visibleListViewController];
  id v5 = [v2 collectionView];

  uint64_t v3 = [v5 numberOfSections];
  if (v3 > [*(id *)(a1 + 40) section])
  {
    uint64_t v4 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
    if (v4 > [*(id *)(a1 + 40) row]) {
      [v5 scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56)];
    }
  }
}

- (BOOL)selectContact:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5 shouldScroll:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = [(CNContactDataSource *)self->_dataSource indexPathForContact:a3];
  if (v10)
  {
    id v11 = [(CNContactListViewController *)self collectionViewIndexPathForDataSourceIndexPath:v10];
    BOOL v12 = [(CNContactListViewController *)self isValidIndexPath:v11];
    if (v12)
    {
      if (v6)
      {
        [(CNContactListViewController *)self selectItemAtIndexPath:v11 animated:v8 scrollPosition:a5];
      }
      else
      {
        char v13 = [(CNContactListViewController *)self collectionView];
        [v13 selectItemAtIndexPath:v11 animated:v8 scrollPosition:a5];
      }
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)selectContact:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  return [(CNContactListViewController *)self selectContact:a3 animated:a4 scrollPosition:a5 shouldScroll:1];
}

- (void)scrollTopToContactWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke;
  long long v16 = &unk_1E549BF80;
  uint64_t v17 = self;
  id v18 = v5;
  id v6 = v5;
  id v7 = (void (**)(void))_Block_copy(&v13);
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    BOOL v8 = [(CNContactListViewController *)self collectionView];
    uint64_t v9 = [v8 window];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [(CNContactListViewController *)self pendingSearchQuery];

      if (!v11)
      {
        v7[2](v7);
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  BOOL v12 = [(CNContactListViewController *)self pendingSearchQuery];

  if (v12) {
    [(CNContactListViewController *)self performWhenSearchCompleted:v7];
  }
  else {
    [(CNContactListViewController *)self performWhenViewIsLaidOut:v7];
  }
LABEL_9:
}

void __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataSource];
  uint64_t v3 = [v2 contacts];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke_2;
  v6[3] = &unk_1E5498720;
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 indexOfObjectPassingTest:v6];

  id v5 = [*(id *)(a1 + 32) indexPathForGlobalIndex:v4];
  if ([v5 section] || objc_msgSend(v5, "row")) {
    [*(id *)(a1 + 32) scrollToItemAtIndexPath:v5 animated:0 scrollPosition:1];
  }
}

uint64_t __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 collectionView];
  [v5 deselectItemAtIndexPath:v4 animated:*(unsigned __int8 *)(a1 + 40)];
}

void __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 searchResultsController];
  id v5 = [v6 collectionView];
  [v5 deselectItemAtIndexPath:v4 animated:*(unsigned __int8 *)(a1 + 40)];
}

void __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1120);
  id v4 = a2;
  id v5 = [v3 collectionView];
  [v5 deselectItemAtIndexPath:v4 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setCellStateSelected:(BOOL)a3 forContact:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v13 = a4;
  BOOL v8 = -[CNContactDataSource indexPathForContact:](self->_dataSource, "indexPathForContact:");
  uint64_t v9 = [(CNContactListViewController *)self collectionViewIndexPathForDataSourceIndexPath:v8];
  if (![(CNContactListViewController *)self isValidIndexPath:v9]) {
    goto LABEL_11;
  }
  id v10 = [(CNContactListViewController *)self collectionView];
  id v11 = v10;
  if (v6)
  {
    [v10 selectItemAtIndexPath:v9 animated:v5 scrollPosition:0];

    if (![(CNContactListViewController *)self shouldDisplayListHeaderView]
      || ![v9 isEqual:v8])
    {
      goto LABEL_8;
    }
    id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v9, "item"), objc_msgSend(v9, "section") + 1);
    [(CNContactListViewController *)self setIndexPathToSelect:v11];
  }
  else
  {
    [v10 deselectItemAtIndexPath:v9 animated:v5];
  }

LABEL_8:
  suggestionsController = self->_suggestionsController;
  if (suggestionsController) {
    [(CNContactSuggestionsViewController *)suggestionsController setCellStateSelected:v6 forContact:v13 animated:v5];
  }
  [(CNContactListViewController *)self updateInResponseToLimitedAccessSelectionChanged];
LABEL_11:
}

- (BOOL)isValidIndexPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && [v4 section] != 0x7FFFFFFFFFFFFFFFLL
    && ([v5 section] & 0x8000000000000000) == 0)
  {
    uint64_t v6 = [v5 section];
    id v7 = [(CNContactListViewController *)self collectionView];
    if (v6 >= [v7 numberOfSections]
      || [v5 row] == 0x7FFFFFFFFFFFFFFFLL
      || [v5 row] < 0)
    {
    }
    else
    {
      uint64_t v8 = [v5 row];
      uint64_t v9 = [(CNContactListViewController *)self collectionView];
      uint64_t v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v5, "section"));

      if (v8 < v10)
      {
        BOOL v11 = 1;
        goto LABEL_13;
      }
    }
  }
  BOOL v12 = CNUILogContactList();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    uint64_t v15 = v5;
    _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "invalid indexPath: %@", (uint8_t *)&v14, 0xCu);
  }

  BOOL v11 = 0;
LABEL_13:

  return v11;
}

- (id)limitedAccessTotalSelectedContacts
{
  if ([(CNContactListViewController *)self limitedAccessPickerType] == 5) {
    [(CNContactListViewController *)self limitedAccessContactSelection];
  }
  else {
  uint64_t v3 = [(CNContactListViewController *)self limitedAccessContactsFromCurrentSelection];
  }
  id v4 = [v3 allObjects];

  return v4;
}

- (NSArray)selectedContacts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNContactListViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (self->_suggestionsController)
  {
    BOOL v12 = [(CNContactListViewController *)self suggestionsController];
    id v13 = [v12 selectedContacts];
    [v5 addObjectsFromArray:v13];
  }

  return (NSArray *)v5;
}

- (void)setupForMultiSelection
{
  [(CNContactListViewController *)self setAllowsMultiSelection:1];
  if ([(CNContactListViewController *)self shouldDisplaySuggestionsController])
  {
    uint64_t v3 = [(CNContactListViewController *)self suggestionsController];
    [v3 setAllowsMultiSelection:1];
  }
  if (![(CNContactListViewController *)self shouldAllowSearchForMultiSelect]) {
    [(CNContactListViewController *)self disableSearchUI];
  }
  id v4 = [(CNContactListViewController *)self collectionView];
  [v4 setAllowsMultipleSelectionDuringEditing:1];
  [v4 setEditing:1];
}

- (void)disableSearchUI
{
  self->_presentsSearchUI = 0;
  self->_isHandlingSearch = 0;
  uint64_t v3 = [(CNContactListViewController *)self searchController];

  if (v3)
  {
    id v4 = [(CNContactListViewController *)self navigationItem];
    [v4 setSearchController:0];

    [(CNContactListViewController *)self setSearchResultsController:0];
    [(CNContactListViewController *)self setSearchController:0];
    [(CNContactListViewController *)self setSearchBar:0];
  }
}

- (void)performWhenSearchCompleted:(id)a3
{
  id v5 = (id)[a3 copy];
  id v4 = [(CNContactListViewController *)self searchResultsController];
  [v4 setSearchCompletionBlock:v5];
}

- (void)reloadVisibleItems
{
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    uint64_t v3 = [(CNContactListViewController *)self collectionView];
    id v4 = [v3 window];

    if (v4)
    {
      uint64_t v5 = *MEMORY[0x1E4F5A258];
      id v10 = [(CNContactListViewController *)self collectionView];
      id v6 = [v10 indexPathsForVisibleItems];
      if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) & 1) == 0)
      {
        uint64_t v7 = [(CNContactListViewController *)self collectionView];
        uint64_t v8 = [v7 window];

        if (!v8) {
          return;
        }
        id v10 = [(CNContactListViewController *)self collectionView];
        id v6 = [(CNContactListViewController *)self collectionView];
        uint64_t v9 = [v6 indexPathsForVisibleItems];
        [v10 reloadItemsAtIndexPaths:v9];
      }
    }
  }
}

- (void)reconfigureVisibleItems
{
  if ([(CNContactListViewController *)self isViewLoaded])
  {
    uint64_t v3 = [(CNContactListViewController *)self collectionView];
    id v4 = [v3 window];

    if (v4)
    {
      uint64_t v5 = *MEMORY[0x1E4F5A258];
      id v10 = [(CNContactListViewController *)self collectionView];
      id v6 = [v10 indexPathsForVisibleItems];
      if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) & 1) == 0)
      {
        uint64_t v7 = [(CNContactListViewController *)self collectionView];
        uint64_t v8 = [v7 window];

        if (!v8) {
          return;
        }
        id v10 = [(CNContactListViewController *)self collectionView];
        id v6 = [(CNContactListViewController *)self collectionView];
        uint64_t v9 = [v6 indexPathsForVisibleItems];
        [v10 reconfigureItemsAtIndexPaths:v9];
      }
    }
  }
}

void __41__CNContactListViewController_applyStyle__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) collectionView];
  id v2 = [*(id *)(a1 + 32) collectionView];
  uint64_t v3 = [v2 indexPathsForVisibleItems];
  [v4 reconfigureItemsAtIndexPaths:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CNContactListViewController;
  id v7 = a4;
  -[CNContactListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  void v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5498AF8;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E5498AF8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

void __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tipKitContentView];
  if (v2)
  {
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) view];
    id v4 = [v3 traitCollection];
    uint64_t v5 = [v4 layoutDirection];

    if (v5 != 1) {
      return;
    }
  }
  id v6 = *(void **)(a1 + 32);
  id v9 = [v6 view];
  [v9 bounds];
  objc_msgSend(v6, "refreshTableViewHeaderIfVisibleWithSize:", v7, v8);
}

void __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) meContactBanner];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) meContactBanner];
    [v3 frame];
    BOOL v5 = v4 <= 0.0;
  }
  else
  {
    BOOL v5 = 1;
  }

  id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  double v8 = [*(id *)(a1 + 32) tipKitContentView];
  if (v8 || v5)
  {
  }
  else if (v7 != 1)
  {
    id v9 = *(void **)(a1 + 32);
    [v9 updateMeContactBannerTopKeyline];
  }
}

uint64_t __52__CNContactListViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactListViewController;
  [(CNContactListViewController *)&v6 viewDidDisappear:a3];
  if (![(CNContactListViewController *)self isSearchController]) {
    [(CNContactListViewController *)self tipKitStopObservation];
  }
  [(CNContactListViewController *)self updatelimitedAccessContactSelection];
  double v4 = [(CNContactListViewController *)self selectButtonView];

  if (v4)
  {
    BOOL v5 = [(CNContactListViewController *)self selectButtonView];
    [v5 removeFromSuperview];

    [(CNContactListViewController *)self setSelectButtonView:0];
  }
  [(CNContactListViewController *)self setIsCurrentViewStillOpen:0];
}

uint64_t __46__CNContactListViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  uint64_t v3 = [*(id *)(a1 + 32) indexPathToSelect];
  [v2 selectItemAtIndexPath:v3 animated:0 scrollPosition:0];

  double v4 = *(void **)(a1 + 32);

  return [v4 setIndexPathToSelect:0];
}

- (id)contextMenuInteraction
{
  id v2 = [(CNContactListViewController *)self collectionView];
  uint64_t v3 = [v2 contextMenuInteraction];

  return v3;
}

- (void)listActionHelper:(id)a3 didUpdateWithMenu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  double v8 = [(CNContactListViewController *)self collectionView];
  id v9 = [v8 contextMenuInteraction];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CNContactListViewController_listActionHelper_didUpdateWithMenu___block_invoke;
  v11[3] = &unk_1E54986D0;
  id v13 = v14;
  id v10 = v7;
  id v12 = v10;
  [v9 updateVisibleMenuWithBlock:v11];

  _Block_object_dispose(v14, 8);
}

id __66__CNContactListViewController_listActionHelper_didUpdateWithMenu___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    id v6 = v3;
  }
  else
  {
    *(unsigned char *)(v5 + 24) = 1;
    id v7 = [v3 children];
    double v8 = objc_msgSend(v7, "_cn_filter:", &__block_literal_global_414);

    id v9 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:v8];
    id v6 = [v4 menuByReplacingChildren:v9];
  }

  return v6;
}

uint64_t __66__CNContactListViewController_listActionHelper_didUpdateWithMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 identifier];
    uint64_t v7 = [v6 isEqualToString:@"CNContactListActionHelperOrbMenuIdentifier"] ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)actionDidFinish:(id)a3
{
  if (![a3 shouldReloadListOnCompletion]) {
    return;
  }
  [(CNContactListViewController *)self reloadContacts];
  double v4 = [(CNContactListViewController *)self collectionView];
  id v24 = [v4 indexPathsForSelectedItems];

  [(CNContactListViewController *)self deselectAllSelectedIndexPathsAnimated:0];
  uint64_t v5 = [(CNContactListViewController *)self splitViewController];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(CNContactListViewController *)self splitViewController];
    int v8 = [v7 isCollapsed];

    if (!v8)
    {
      id v12 = [(CNContactListViewController *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        int v14 = [(CNContactListViewController *)self delegate];
        BOOL v11 = [v14 currentlyDisplayedContact];

        if (v11
          && [(CNContactListViewController *)self selectContact:v11 animated:1 scrollPosition:0])
        {
LABEL_15:
          if ([(CNContactListViewController *)self selectContact:v11 animated:1 scrollPosition:0])
          {
LABEL_17:
            if ([(CNContactListViewController *)self selectContact:v11 animated:1 scrollPosition:0])
            {
              id v19 = [(CNContactListViewController *)self delegate];
              char v20 = objc_opt_respondsToSelector();

              if ((v20 & 1) == 0) {
                goto LABEL_23;
              }
              BOOL v21 = [(CNContactListViewController *)self delegate];
              [v21 contactListViewController:self updatedSelectedContact:v11];
LABEL_22:

              goto LABEL_23;
            }
LABEL_20:
            id v22 = [(CNContactListViewController *)self delegate];
            char v23 = objc_opt_respondsToSelector();

            if ((v23 & 1) == 0) {
              goto LABEL_23;
            }
            BOOL v21 = [(CNContactListViewController *)self delegate];
            [v21 resetContactViewController];
            goto LABEL_22;
          }
LABEL_16:
          long long v17 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
          uint64_t v18 = [(CNContactListViewController *)self _contactAtIndexPath:v17];

          BOOL v11 = (void *)v18;
          if (!v18) {
            goto LABEL_20;
          }
          goto LABEL_17;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
      if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
      {
        char v15 = [v24 firstObject];
        uint64_t v16 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v15];

        BOOL v11 = (void *)v16;
      }
      if (!v11) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  id v9 = [(CNContactListViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    BOOL v11 = [(CNContactListViewController *)self delegate];
    [v11 resetContactViewController];
LABEL_23:
  }
}

- (void)action:(id)a3 presentViewController:(id)a4
{
  id v21 = a4;
  uint64_t v5 = [v21 popoverPresentationController];
  id v6 = [v5 sourceView];

  if (!v6)
  {
    uint64_t v7 = [(CNContactListViewController *)self collectionView];
    int v8 = [v21 popoverPresentationController];
    [v8 setSourceView:v7];

    id v9 = [(CNContactListViewController *)self collectionView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [v21 popoverPresentationController];
    objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);
  }
  id v19 = [(CNContactListViewController *)self splitViewController];

  if (v19) {
    [(CNContactListViewController *)self splitViewController];
  }
  else {
  char v20 = [(CNContactListViewController *)self navigationController];
  }
  [v20 presentViewController:v21 animated:1 completion:0];
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v5 = [(CNContactListViewController *)self actionHelper];
  [v5 willDismissMenu];
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a3;
  id v8 = [(CNContactListViewController *)self actionHelper];
  uint64_t v7 = [v6 contextMenuInteraction];

  [v8 willDisplayMenuWithContextMenuInteraction:v7];
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(CNContactListViewController *)self actionHelper];
  id v8 = [v7 contacts];
  uint64_t v9 = [v8 count];

  if (v9 == 1)
  {
    double v10 = [(CNContactListViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __104__CNContactListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v12[3] = &unk_1E549B488;
      v12[4] = self;
      [v6 addCompletion:v12];
    }
  }
}

void __104__CNContactListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 actionHelper];
  double v4 = [v3 contacts];
  id v5 = [v4 firstObject];
  [v6 contactListViewController:v2 didSelectContact:v5 shouldScrollToContact:0];
}

- (id)contextMenuConfigurationForContactsAtIndexPaths:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNContactListViewController *)self containsPathToDuplicatesBanner:v4]
    || [(CNContactListViewController *)self containsPathToCreateNewContactRow:v4]
    || [(CNContactListViewController *)self containsPathToContentUnavailableRow:v4]|| [(CNContactListViewController *)self containsPathToLimitedAccessTipRow:v4]|| [(CNContactListViewController *)self disableContextMenus])
  {
    id v5 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = [(CNContactListViewController *)self contactsForActionsAtIndexPaths:v4];
  objc_opt_class();
  id v8 = [v7 firstObject];
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (!v10)
  {
    double v13 = CNUILogContactList();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v20 = [v7 firstObject];
      *(_DWORD *)buf = 138412290;
      id v29 = v20;
      _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "contextMenuConfiguration on non-contact: %@", buf, 0xCu);
    }
LABEL_19:
    id v5 = 0;
    goto LABEL_21;
  }
  char v11 = [(CNContactListViewController *)self collectionView];
  double v12 = [v4 firstObject];
  double v13 = [v11 cellForItemAtIndexPath:v12];

  if (![(CNContactListViewController *)self isHandlingSearch])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_2;
    aBlock[3] = &unk_1E5499788;
    aBlock[4] = self;
    id v17 = v7;
    id v24 = v17;
    double v13 = v13;
    id v25 = v13;
    uint64_t v18 = _Block_copy(aBlock);
    id v19 = (void *)MEMORY[0x1E4FB1678];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_3;
    v21[3] = &unk_1E549AB90;
    id v22 = v17;
    id v5 = [v19 configurationWithIdentifier:&stru_1ED8AC728 previewProvider:v21 actionProvider:v18];

    goto LABEL_21;
  }
  if (!+[CNQuickActionsManager hasActionsForContact:v10])goto LABEL_19; {
  double v14 = [(CNContactListViewController *)self actionHelper];
  }
  double v15 = [v14 searchMenuActionProviderForContacts:v7];

  double v16 = (void *)MEMORY[0x1E4FB1678];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke;
  void v26[3] = &unk_1E549AB90;
  id v27 = v7;
  id v5 = [v16 configurationWithIdentifier:&stru_1ED8AC728 previewProvider:v26 actionProvider:v15];

LABEL_21:
LABEL_7:

  return v5;
}

CNContactOrbHeaderViewController *__79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke(uint64_t a1)
{
  uint64_t v1 = [[CNContactOrbHeaderViewController alloc] initWithContacts:*(void *)(a1 + 32)];

  return v1;
}

id __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) dataSource];
  id v3 = [v2 filter];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) actionHelper];
  uint64_t v7 = [v6 actionsForContacts:*(void *)(a1 + 40) dataSourceFilter:v5 sourceView:*(void *)(a1 + 48)];

  id v8 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 children:v7];

  return v8;
}

CNContactOrbHeaderViewController *__79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [[CNContactOrbHeaderViewController alloc] initWithContacts:*(void *)(a1 + 32)];

  return v1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if ([v6 count]
    && ([(CNContactListViewController *)self shouldEnableMultiSelectContextMenus]
     || [v6 count] == 1))
  {
    uint64_t v7 = [(CNContactListViewController *)self contextMenuConfigurationForContactsAtIndexPaths:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)showCardForSelectedContactAtIndexPath:(id)a3
{
  id v9 = a3;
  if (!-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:")
    && ![(CNContactListViewController *)self isPathToContentUnavailableRow:v9])
  {
    id v4 = [(CNContactListViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v9];
      if ([(CNContactListViewController *)self isHandlingSearch])
      {
        uint64_t v7 = +[CNUIDataCollectionSearchSession currentSession];
        [v7 didSelectResult:v6];
      }
      id v8 = [(CNContactListViewController *)self delegate];
      [v8 contactListViewController:self didSelectContact:v6 shouldScrollToContact:0];
    }
  }
}

- (void)deselectAllItemsExceptIndexPath:(id)a3
{
  id v4 = a3;
  char v5 = [(CNContactListViewController *)self collectionView];
  id v6 = [v5 indexPathsForSelectedItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CNContactListViewController_deselectAllItemsExceptIndexPath___block_invoke;
  v8[3] = &unk_1E5498688;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  objc_msgSend(v6, "_cn_each:", v8);
}

void __63__CNContactListViewController_deselectAllItemsExceptIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 40) collectionView];
    [v3 deselectItemAtIndexPath:v4 animated:0];
  }
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 isEditing]) {
    char v7 = [v10 allowsMultipleSelectionDuringEditing];
  }
  else {
    char v7 = 0;
  }
  id v8 = [v10 indexPathsForSelectedItems];
  unint64_t v9 = [v8 count];

  if (v9 >= 2 && (v7 & 1) == 0) {
    [(CNContactListViewController *)self deselectAllItemsExceptIndexPath:v6];
  }
  [(CNContactListViewController *)self showCardForSelectedContactAtIndexPath:v6];
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = ![(CNContactListViewController *)self isPathToCreateNewContactRow:v7]
    && ![(CNContactListViewController *)self isPathToContentUnavailableRow:v7]
    && (![v6 isEditing]
     || ([v6 allowsMultipleSelectionDuringEditing] & 1) == 0)
    && [(CNContactListViewController *)self canSelectContactAtCollectionViewIndexPath:v7];

  return v8;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  if ([(CNContactListViewController *)self isHandlingSearch]) {
    return 0;
  }

  return [(CNContactListViewController *)self shouldEnableMultiSelectContextMenus];
}

- (id)contactForActionsAtIndexPath:(id)a3 forMultiSelectAction:(BOOL)a4
{
  BOOL v4 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CNContactListViewController *)self _contactAtCollectionViewIndexPath:v6];
  dataSource = self->_dataSource;
  unint64_t v9 = +[CNContactListActionHelper descriptorForRequiredKeysForMultiSelectAction:v4];
  v20[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  char v11 = [(CNContactDataSource *)dataSource completeContactFromContact:v7 fromMainStoreOnly:1 keysToFetch:v10];

  double v12 = [MEMORY[0x1E4F1CA98] null];
  LODWORD(v9) = [v11 isEqual:v12];

  if (v9)
  {
    double v13 = CNUILogContactList();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "NSNull returned when attempting to refetch contact at  indexPath: %@, contact: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  double v14 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();

  return v14;
}

- (id)contactsForActionsAtIndexPaths:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  char v11 = __62__CNContactListViewController_contactsForActionsAtIndexPaths___block_invoke;
  double v12 = &unk_1E5498660;
  double v13 = self;
  BOOL v14 = v5 > 1;
  id v6 = objc_msgSend(v4, "_cn_map:", &v9);

  id v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_392, v9, v10, v11, v12);

  return v7;
}

uint64_t __62__CNContactListViewController_contactsForActionsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) contactForActionsAtIndexPath:a2 forMultiSelectAction:*(unsigned __int8 *)(a1 + 40)];
}

BOOL __62__CNContactListViewController_contactsForActionsAtIndexPaths___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (void)refreshActionHelper
{
  if (self->_actionHelper)
  {
    BOOL v3 = [(CNContactListViewController *)self allowsEditingActions];
    actionHelper = self->_actionHelper;
    [(CNContactListActionHelper *)actionHelper setIncludesEditingActions:v3];
  }
}

- (CNContactListActionHelper)actionHelper
{
  actionHelper = self->_actionHelper;
  if (!actionHelper)
  {
    id v4 = [CNContactListActionHelper alloc];
    unint64_t v5 = [(CNContactListViewController *)self contactStore];
    id v6 = [(CNContactListViewController *)self environment];
    id v7 = [(CNContactListViewController *)self contactFormatter];
    BOOL v8 = [(CNContactListViewController *)self undoManager];
    uint64_t v9 = [(CNContactListActionHelper *)v4 initWithContactStore:v5 environment:v6 contactFormatter:v7 undoManager:v8];
    uint64_t v10 = self->_actionHelper;
    self->_actionHelper = v9;

    [(CNContactListActionHelper *)self->_actionHelper setDelegate:self];
    [(CNContactListActionHelper *)self->_actionHelper setIncludesContactOrbActions:1];
    [(CNContactListActionHelper *)self->_actionHelper setIncludesEditingActions:[(CNContactListViewController *)self allowsEditingActions]];
    actionHelper = self->_actionHelper;
  }

  return actionHelper;
}

- (BOOL)isContactProviderDataSource
{
  objc_opt_class();
  BOOL v3 = [(CNContactListViewController *)self dataSource];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 filteredContainer];
    BOOL v7 = [v6 type] == 1003;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)allowsEditingActions
{
  if (self->_allowsEditingActions) {
    return ![(CNContactListViewController *)self isContactProviderDataSource];
  }
  else {
    return 0;
  }
}

- (CNContactListViewController)visibleListViewController
{
  if ([(CNContactListViewController *)self isSearching])
  {
    BOOL v3 = [(CNContactListViewController *)self searchResultsController];
  }
  else
  {
    BOOL v3 = self;
  }

  return v3;
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [(CNContactListViewController *)self dataSource];
  id v6 = [v5 sections];

  if (v6)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10 + v9;
        int64_t v14 = a3;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v12), "range", (void)v22);
          a3 = v14 - v15;
          if (v14 < v15)
          {
            uint64_t v13 = v10 + v12;
            a3 = v14;
            goto LABEL_14;
          }
          ++v12;
          v14 -= v15;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        uint64_t v10 = v13;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
LABEL_14:

    int v16 = (void *)MEMORY[0x1E4F28D58];
    int64_t v17 = a3;
    uint64_t v18 = v13;
  }
  else
  {
    int v16 = (void *)MEMORY[0x1E4F28D58];
    int64_t v17 = a3;
    uint64_t v18 = 0;
  }
  id v19 = objc_msgSend(v16, "indexPathForItem:inSection:", v17, v18, (void)v22);
  char v20 = [(CNContactListViewController *)self collectionViewIndexPathForDataSourceIndexPath:v19];

  return v20;
}

- (unint64_t)globalIndexForCollectionViewIndexPath:(id)a3
{
  id v4 = a3;
  if (-[CNContactListViewController isDuplicatesRowSection:](self, "isDuplicatesRowSection:", [v4 section]))
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v6 = [(CNContactListViewController *)self dataSourceIndexPathForCollectionViewIndexPath:v4];
    unint64_t v7 = [v6 section];
    uint64_t v8 = [(CNContactListViewController *)self dataSource];
    uint64_t v9 = [v8 sections];

    if (v9)
    {
      if ((v7 & 0x8000000000000000) != 0 || v7 >= [v9 count])
      {
        unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v10 = [v9 objectAtIndexedSubscript:v7];
        uint64_t v11 = [v10 range];
        unint64_t v5 = v11 + [v6 row];
      }
    }
    else
    {
      unint64_t v5 = [v6 item];
    }
  }
  return v5;
}

id __72__CNContactListViewController_trailingSwipeActionsConfigurationProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unint64_t v5 = [WeakRetained contactForActionsAtIndexPath:v3 forMultiSelectAction:0];

  if (v5)
  {
    objc_opt_class();
    id v6 = [WeakRetained dataSource];
    unint64_t v7 = [v6 filter];
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    uint64_t v10 = (void *)MEMORY[0x1E4FB1CC0];
    uint64_t v11 = [WeakRetained actionHelper];
    uint64_t v12 = [v11 trailingSwipeActionsForContact:v5 dataSourceFilter:v9];
    uint64_t v13 = [v10 configurationWithActions:v12];

    [v13 setPerformsFirstActionWithFullSwipe:0];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)setupDuplicatesController
{
  id v3 = [[CNDuplicateContactsController alloc] initWithDataSource:self->_dataSource environment:self->_environment delegate:self];
  duplicatesController = self->_duplicatesController;
  self->_duplicatesController = v3;

  [(CNContactListViewController *)self setIsDuplicatesLaunching:0];
  unint64_t v5 = self->_duplicatesController;

  return v5;
}

- (CNDuplicateContactsController)duplicatesController
{
  id v2 = cn_objectResultWithObjectLock();

  return (CNDuplicateContactsController *)v2;
}

id __51__CNContactListViewController_duplicatesController__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[156];
  if (!v3)
  {
    uint64_t v4 = [v2 setupDuplicatesController];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 1248);
    *(void *)(v5 + 1248) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 1248);
  }

  return v3;
}

- (void)setDataSource:(id)a3
{
  id v8 = a3;
  [(CNContactListViewController *)self willChangeValueForKey:@"dataSource"];
  objc_storeStrong((id *)&self->_dataSource, a3);
  [(CNContactDataSource *)self->_dataSource setDelegate:self];
  uint64_t v5 = [(CNContactListViewController *)self searchResultsController];
  id v6 = (void *)[v8 copyWithZone:0];
  [v5 setDataSource:v6];

  if ([(CNContactListViewController *)self canManageDuplicateContacts])
  {
    if (self->_duplicatesController)
    {
      unint64_t v7 = [(CNContactListViewController *)self duplicatesController];
      [v7 setDataSource:self->_dataSource];
    }
    [(CNContactListViewController *)self refreshDuplicates];
  }
  [(CNContactListViewController *)self refreshActionHelper];
  [(CNContactListViewController *)self didChangeValueForKey:@"dataSource"];
  [(CNContactListViewController *)self contactDataSourceDidChange:v8];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = [(CNContactListViewController *)self medicalIDLookupToken];
  [v4 cancel];

  [(CNContactListViewController *)self setMedicalIDLookupToken:0];
  v5.receiver = self;
  v5.super_class = (Class)CNContactListViewController;
  [(CNContactListViewController *)&v5 dealloc];
}

- (CNContactListViewController)initWithCollectionViewLayout:(id)a3
{
  return [(CNContactListViewController *)self initWithDataSource:0 shouldUseLargeTitle:0];
}

- (CNContactListViewController)initWithDataSource:(id)a3 shouldUseLargeTitle:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = +[CNUIContactsEnvironment currentEnvironment];
  id v8 = [(CNContactListViewController *)self initWithDataSource:v6 environment:v7 shouldUseLargeTitle:v4];

  return v8;
}

- (void)setTipView:(id)a3
{
  id v23 = a3;
  BOOL v4 = [(CNContactListViewController *)self tipKitContentView];
  char v5 = (v23 != 0) ^ (v4 == 0);

  if ((v5 & 1) == 0)
  {
    +[CNTipHeaderView verticalInsetTotal];
    if (v23)
    {
      double v7 = v6;
      double v8 = *MEMORY[0x1E4F1DB28];
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      uint64_t v11 = [(CNContactListViewController *)self view];
      [v11 bounds];
      double Width = CGRectGetWidth(v25);

      [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
      v26.origin.x = v8;
      v26.origin.y = v9;
      v26.size.double width = Width;
      v26.size.double height = v10;
      double v13 = CGRectGetWidth(v26) - v7;
      [v23 bounds];
      if (v13 != CGRectGetWidth(v27))
      {
        [v23 bounds];
        objc_msgSend(v23, "setBounds:");
      }
      LODWORD(v14) = 1148846080;
      LODWORD(v15) = 1132068864;
      objc_msgSend(v23, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, 0.0, v14, v15);
      double v17 = v7 + v16;
      uint64_t v18 = [_TtC10ContactsUI15CNTipHeaderView alloc];
      id v19 = -[CNTipHeaderView initWithFrame:separatorInset:](v18, "initWithFrame:separatorInset:", v8, v9, Width, v17, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      [(CNTipHeaderView *)v19 setHostingView:v23];
      [(CNTipHeaderView *)v19 setDisplaysBottomSeparator:0];
      char v20 = +[CNTipsHelper shared];
      [v20 setCurrentTipView:v19];
    }
    else
    {
      id v21 = +[CNTipsHelper shared];
      long long v22 = [v21 currentTipView];
      [v22 removeFromSuperview];

      id v19 = +[CNTipsHelper shared];
      [(CNTipHeaderView *)v19 setCurrentTipView:0];
    }

    [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
  }
}

- (void)tipKitDismissTip
{
}

- (id)getRecentCallCountAndSpeakableName
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactListViewController *)self contactStore];
  BOOL v4 = (void *)[objc_alloc(getCHContactProviderClass()) initWithDataSource:v3];
  char v5 = [(CNContactListViewController *)self recentOutgoingCalls];
  v29[0] = *MEMORY[0x1E4F1ADF0];
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  id v27 = 0;
  double v7 = [v4 contactsByHandleForCalls:v5 keyDescriptors:v6 error:&v27];
  id v8 = v27;

  if (v8 || !v7)
  {
    double v16 = CNUILogContactList();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "No recent calls", buf, 2u);
    }
    double v17 = 0;
  }
  else
  {
    id v21 = v4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v9 = [v7 allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      uint64_t v13 = 30;
      char v20 = v3;
      while (2)
      {
        uint64_t v14 = 0;
        uint64_t v19 = v13 - v11;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          if (v13 == v14)
          {
            double v16 = 0;
LABEL_20:
            id v3 = v20;
            goto LABEL_21;
          }
          double v15 = [*(id *)(*((void *)&v22 + 1) + 8 * v14) firstObject];
          double v16 = [v15 firstName];
          if (v16 && [(CNContactListViewController *)self isEasyToRecognizeWord:v16])
          {

            goto LABEL_20;
          }

          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
        double v16 = 0;
        uint64_t v13 = v19;
        id v3 = v20;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      double v16 = 0;
    }
LABEL_21:

    double v17 = +[CNRecentCallCountAndName instanceWithName:callCount:](CNRecentCallCountAndName, "instanceWithName:callCount:", v16, [v5 count]);
    id v8 = 0;
    BOOL v4 = v21;
  }

  return v17;
}

- (BOOL)validateSiriLanguage
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (softLinkAFAssistantRestricted()) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F1CA20] systemLanguages];
  if ([v3 count])
  {
    BOOL v4 = [(objc_class *)getAFPreferencesClass_45450() sharedPreferences];
    char v5 = [v4 languageCode];

    if ([v5 length])
    {
      double v6 = (void *)MEMORY[0x1E4F28B50];
      double v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      id v8 = [v6 preferredLocalizationsFromArray:v3 forPreferences:v7];
      double v9 = [v8 firstObject];

      uint64_t v10 = (void *)MEMORY[0x1E4F28B50];
      v15[0] = v5;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      uint64_t v12 = [v10 preferredLocalizationsFromArray:v3 forPreferences:v11];
      uint64_t v13 = [v12 firstObject];

      char v2 = [v9 isEqualToString:v13];
    }
    else
    {
      char v2 = 0;
    }
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (BOOL)validateSiriEnabled
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (softLinkAFAssistantRestricted())
  {
    int v2 = 0;
  }
  else
  {
    id v3 = [(objc_class *)getAFPreferencesClass_45450() sharedPreferences];
    int v2 = [v3 assistantIsEnabled];
  }
  BOOL v4 = CNUILogContactList();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "Assitant enabled = %d", (uint8_t *)v6, 8u);
  }

  return v2;
}

- (void)tipKitStopObservation
{
  id v2 = +[CNTipsHelper shared];
  [v2 tipKitStopObservation];
}

- (BOOL)isEasyToRecognizeWord:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  char v5 = [v3 currentLocale];
  char v6 = [(Class)get_EARUserProfileBuilderClass[0]() isEasyToRecognizeWord:v4 forLocale:v5];

  return v6;
}

- (id)recentOutgoingCalls
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(getCHManagerClass());
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [NSNumber numberWithUnsignedInt:getkCHCallTypeNormal()];
  char v5 = [NSNumber numberWithUnsignedInt:getkCHCallStatusCancelled()];
  v11[0] = v5;
  char v6 = [NSNumber numberWithUnsignedInt:getkCHCallStatusConnectedOutgoing()];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v8 = [v3 predicateWithFormat:@"callType == %@ AND callStatus IN %@", v4, v7];

  double v9 = [v2 recentCallsWithPredicate:v8];

  return v9;
}

@end