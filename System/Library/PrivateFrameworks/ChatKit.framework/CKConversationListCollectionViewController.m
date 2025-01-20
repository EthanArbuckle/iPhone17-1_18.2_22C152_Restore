@interface CKConversationListCollectionViewController
+ (id)conversationListCollectionViewControllerLogHandle;
+ (id)updaterLogHandle;
- (BOOL)_canShowCatalystFiltersNavigation;
- (BOOL)_canShowSyncProgressFooter;
- (BOOL)_cellsShouldShowChevron;
- (BOOL)_conversationHasActivityItem:(id)a3;
- (BOOL)_focusFilterBannerShouldUseFullWidthKeylines;
- (BOOL)_hasAlertsEnabledForAllConversations:(id)a3;
- (BOOL)_hasReadAllConversations:(id)a3;
- (BOOL)_hasStewieConversationSelected;
- (BOOL)_hasUnreadConversation;
- (BOOL)_hidesBackButton;
- (BOOL)_imageForkedFromMeCard;
- (BOOL)_isDropForSession:(id)a3 toLeadingEdgeOfView:(id)a4;
- (BOOL)_isNewComposeSelected;
- (BOOL)_isOnlyActivityItemInRowForConversation:(id)a3 itemIdentifier:(id)a4;
- (BOOL)_isRunningPPT;
- (BOOL)_meCardSharingEnabled;
- (BOOL)_messageSpamFilteringEnabled;
- (BOOL)_messageUnknownFilteringEnabled;
- (BOOL)_shouldAllowLargeTitles;
- (BOOL)_shouldAnimatePinningChangesForUpdateFollowingHoldForReason:(id)a3;
- (BOOL)_shouldKeepSelection;
- (BOOL)_shouldResizeNavigationBar;
- (BOOL)_shouldRestoreFirstResponderAfterDetailsViewDismiss;
- (BOOL)_shouldSelectConversationAfterDeletingIndexPath:(id)a3;
- (BOOL)_shouldShowInboxView;
- (BOOL)_shouldShowToolbar;
- (BOOL)_shouldUpdateConversationSelection;
- (BOOL)_shouldUsePreviewProviderForDragItemAtIndexPath:(id)a3;
- (BOOL)_updateAddsTypingChatItem:(id)a3;
- (BOOL)_updateRemovesTypingChatItem:(id)a3;
- (BOOL)_wantsThreeColumnLayout;
- (BOOL)canShowSuggestedPinningOnboardingCell;
- (BOOL)cellAtIndexPath:(id)a3 isVisibleInCollectionView:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)completedDeferredSetup;
- (BOOL)compositionWasSent;
- (BOOL)contextMenuInteractionShouldBeginAtIndexPath:(id)a3;
- (BOOL)hasActivePinnedConversationDropSession;
- (BOOL)hasDetailsNavigationController;
- (BOOL)hasTransparentSideBar;
- (BOOL)haveAppliedInitialSnapshot;
- (BOOL)hidePinsForAnimation;
- (BOOL)holdPinningUpdatesForConversationDeletion;
- (BOOL)holdPinningUpdatesForOnboardingAnimation;
- (BOOL)isAppearing;
- (BOOL)isApplyingSnapshot;
- (BOOL)isBelowMacSnapToMinWidth;
- (BOOL)isCheckingIfPinningOnboardingNeeded;
- (BOOL)isCommitingDiffableDataSourceTransaction;
- (BOOL)isCurrentlyAnimatingPinningOnboardingSuggestions;
- (BOOL)isDetailsNavigationControllerDetached;
- (BOOL)isInitialAppearance;
- (BOOL)isOscarModal;
- (BOOL)isRecentlyDeletedModal;
- (BOOL)isSearchActive;
- (BOOL)isSearchActiveAndDisplayingResultsForSearchText;
- (BOOL)isShowingConversationFromCatalystOpenURL;
- (BOOL)isShowingPinnedChatDropTarget;
- (BOOL)isShowingPinningOnboarding;
- (BOOL)isShowingSwipeDeleteConfirmation;
- (BOOL)isVisible;
- (BOOL)itemIdentifierIsFromPinnedSection:(id)a3;
- (BOOL)itemProviderDisablesTouches;
- (BOOL)keyboardIsShowing;
- (BOOL)listCellIsBeingDisplayedAsGhostedCellInPinnedSection:(id)a3;
- (BOOL)macShouldShowZKWSearch;
- (BOOL)nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)sectionHasActionableConversations:(unint64_t)a3;
- (BOOL)sectionHasSelectableConversations:(unint64_t)a3;
- (BOOL)shouldAnimatePositionForRecommendedItemIdentifiers:(id)a3 pinnedItemIdentifiers:(id)a4;
- (BOOL)shouldInsetResultsForSearchController:(id)a3;
- (BOOL)shouldScrollCollectionViewForCellSelection:(id)a3;
- (BOOL)shouldShowInternalDebugMenu;
- (BOOL)shouldShowPendingCell;
- (BOOL)shouldShowPinnedConversations;
- (BOOL)shouldShowTipKitContent;
- (BOOL)shouldUseFastPreviewText;
- (BOOL)willRotate;
- (CGRect)collectionViewBoundsForPinnedConversationCollectionViewCell:(id)a3;
- (CGRect)pinnedConversationMultitaskingDragExclusionRect;
- (CKCloudSyncStatusView)syncStatusView;
- (CKConversation)conversationToPinPendingOrbDismissal;
- (CKConversation)conversationToUnpinPendingOrbDismissal;
- (CKConversationListCellLayout)cellLayout;
- (CKConversationListCellLayout)junkCellLayout;
- (CKConversationListCellLayout)standardCellLayout;
- (CKConversationListCollectionViewController)init;
- (CKConversationListCollectionViewControllerBannerProtocol)presentedBanner;
- (CKConversationListCollectionViewLayout)conversationLayout;
- (CKConversationListControllerDelegate)delegate;
- (CKConversationListTipManager)tipManager;
- (CKMacToolbarController)macToolbarController;
- (CKMacToolbarItem)composeToolbarItem;
- (CKOnboardingController)onboardingController;
- (CKPinnedConversationCollectionViewCell)prototypePinnedConversationCollectionViewCell;
- (CKSearchViewController)searchResultsController;
- (CNContact)meContact;
- (CNContactStore)contactStore;
- (CoreTelephonyClient)coreTelephonyClient;
- (IMReasonTrackingUpdater)updater;
- (NSArray)frozenConversations;
- (NSArray)frozenPinnedConversations;
- (NSArray)recommendedPinningConversations;
- (NSCache)cacheForLastDisplayedActivitySnapshotByConversation;
- (NSDate)lastUserSelectedConversationTime;
- (NSDictionary)blockedSnapshotInfo;
- (NSLayoutConstraint)bannerTopConstraint;
- (NSMutableSet)itemIdentifiersForVisibleContextMenuInteractions;
- (NSString)deferredSearchQuery;
- (NSString)lastSelectedConversationItemIdentifier;
- (NSString)lastUserSelectedConversationItemIdentifier;
- (NSTimer)refreshControlTimer;
- (OS_dispatch_queue)tipKitQueue;
- (OS_os_log)conversationListCollectionViewControllerLogHandle;
- (UIBarButtonItem)cancelButtonItem;
- (UIBarButtonItem)catalystFiltersNavigationBackButton;
- (UIBarButtonItem)closeButtonItem;
- (UIBarButtonItem)composeButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (UIBarButtonItem)editOscarButtonItem;
- (UIBarButtonItem)moveSelectedToRecentlyDeletedButtonItem;
- (UIBarButtonItem)optionsButtonItem;
- (UIBarButtonItem)permanentDeleteAllButtonItem;
- (UIBarButtonItem)permanentDeleteAllJunkButtonItem;
- (UIBarButtonItem)permanentDeleteSelectedButtonItem;
- (UIBarButtonItem)permanentDeleteSelectedJunkButtonItem;
- (UIBarButtonItem)recoverAllButtonItem;
- (UIBarButtonItem)recoverSelectedButtonItem;
- (UIBarButtonItem)selectAllButtonItem;
- (UIButton)macVirtualComposeButton;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIRefreshControl)collectionViewRefreshControl;
- (UISearchController)searchController;
- (UIView)noMessagesDialogView;
- (_PSMessagesPinningSuggester)pinnedConversationSuggester;
- (double)_activityItemTopInsetForIndexPath:(id)a3;
- (double)animationDistanceForCompletingOnboarding;
- (double)bannerHeight;
- (double)virtualToolbarPreferredHeight;
- (double)widthForDeterminingAvatarVisibility;
- (double)yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:(id)a3;
- (id)_allFrozenConversations;
- (id)_avatarProviderFromNickname:(id)a3;
- (id)_contactStore;
- (id)_conversationActionMenusForItemIdentifier:(id)a3 inSection:(unint64_t)a4 withCell:(id)a5 forSearch:(BOOL)a6;
- (id)_conversationAfterDropDestination:(id)a3 fromDiffableDataSource:(id)a4 snapshot:(id)a5 excludingDraggedConversation:(id)a6;
- (id)_conversationDetailsActionForItemIdentifier:(id)a3 withCell:(id)a4;
- (id)_conversationDropProposalForCollectionView:(id)a3 dropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (id)_conversationFromDragItem:(id)a3;
- (id)_conversationsEligibleForMute:(id)a3;
- (id)_conversationsEligibleForReadStateToggle:(id)a3;
- (id)_conversationsFromLocalDropSession:(id)a3;
- (id)_conversationsInRowOfItemIdentifier:(id)a3;
- (id)_defaultEmptyStateConfiguration;
- (id)_deleteActionForSelectedConversations:(id)a3;
- (id)_deleteConversationActionForItemIdentifier:(id)a3 withCell:(id)a4;
- (id)_deleteSwipeActionForIndexPath:(id)a3;
- (id)_dndSwipeActionForIndexPath:(id)a3;
- (id)_dragItemsForConversation:(id)a3 indexPath:(id)a4 inCollectionView:(id)a5;
- (id)_editNicknameMenu:(id)a3;
- (id)_getTitleForCurrentFilterMode;
- (id)_indexPathOfDefaultConversation;
- (id)_indexPaths:(id)a3 containingHandleWithUID:(id)a4;
- (id)_internalMenuForSelectedConversation:(id)a3;
- (id)_internalMenuForSelectedConversations:(id)a3;
- (id)_internalMenuForSelectedConversations:(id)a3 customMenuElements:(id)a4;
- (id)_itemIdentifierOfDefaultConversation;
- (id)_lastDisplayedActivitySnapshotCacheKeyForConversation:(id)a3;
- (id)_markAsActionForConversations:(id)a3;
- (id)_markUnreadSwipeActionForIndexPath:(id)a3;
- (id)_meCardSharingNameProviderWithContact:(id)a3;
- (id)_meCardSharingState;
- (id)_meContact;
- (id)_multitaskingDragExclusionRects;
- (id)_muteActionConversations:(id)a3;
- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)_openConversationInNewWindowActionForItemIdentifier:(id)a3;
- (id)_permanentDeleteButtonToUseForSelectedJunkConversations:(BOOL)a3;
- (id)_permanentDeleteJunkAction:(id)a3;
- (id)_permanentDeleteRecentlyDeletedAction:(id)a3;
- (id)_permanentDeletebuttonToUseForSelectedConversations:(BOOL)a3;
- (id)_pinActionForItemIdentifier:(id)a3;
- (id)_pinConversationSwipeActionForIndexPath:(id)a3;
- (id)_pinnedConversationShortNames;
- (id)_pinningSuggestionsForConversations:(id)a3;
- (id)_previewForHighlightingOrDismissingContextMenuWithConfiguration:(id)a3 indexPath:(id)a4 collectionView:(id)a5;
- (id)_previewProviderForConversation:(id)a3;
- (id)_recentMessagesInPinnedConversations;
- (id)_recentlyDeletedDisclosureLabelText;
- (id)_recoverButtonToUseForSelectedConversations:(BOOL)a3;
- (id)_recoverRecentlyDeletedAction:(id)a3;
- (id)_removeFromJunkAction:(id)a3;
- (id)_secondaryTextForFilterMode:(unint64_t)a3;
- (id)_selectedConversationsInRecentlyDeletedSection;
- (id)_simFilterActionsForActiveSubscriptions;
- (id)_simFilterSubMenu;
- (id)_snapshotOfAvatarViewForConversation:(id)a3;
- (id)_topLevelMenuForItemIdentifier:(id)a3 inSection:(unint64_t)a4 withCell:(id)a5;
- (id)_topLevelMenuForMultipleSelectedConversations:(id)a3;
- (id)_userDefaults;
- (id)activeConversations;
- (id)cellForCollapsedSidebarFocusFilterCellInCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)cellForFocusFilterInCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)cellForIndexPath:(id)a3 inCollectionView:(id)a4 withItemIdentifier:(id)a5;
- (id)cellForPinnedConversationDropTargetInCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)cellForPinnedConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)cellForPinningOnboardingTitleViewCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)cellForRecoverableConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)cellForStandardConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)cellPinningOnboardingItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)complimentaryIndexPathForConversationAtIndexPath:(id)a3;
- (id)contextMenusForConversation:(id)a3;
- (id)conversationAtIndexPath:(id)a3;
- (id)conversationForItemIdentifier:(id)a3;
- (id)conversationList;
- (id)conversationsAtIndexPaths:(id)a3;
- (id)conversationsForItemIdentifiers:(id)a3;
- (id)dataSourceWithCollectionView:(id)a3;
- (id)dragOrDropPreviewParametersForItemAtIndexPath:(id)a3 inCollectionView:(id)a4;
- (id)dragPreviewViewForPinnedConversation:(id)a3 inCollectionView:(id)a4;
- (id)editButtonDropdownMenu;
- (id)firstVisibleIndexPathInCollectionView;
- (id)generateSnapshot;
- (id)indexPathOfFirstSelectedItem;
- (id)initForOscarModal;
- (id)initForRecentlyDeletedModal;
- (id)itemIdentifierForConversation:(id)a3 inSection:(unint64_t)a4;
- (id)itemIdentifiersForConversations:(id)a3 inSection:(unint64_t)a4;
- (id)junkConversationMenu:(id)a3;
- (id)lastVisibleIndexPathInCollectionView;
- (id)leadingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)newMessageCellInCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)nextSequentialIndexPathForIndexPath:(id)a3 descending:(BOOL)a4;
- (id)nicknameController;
- (id)pinnedConversationIdentifiers;
- (id)pinnedConversations;
- (id)pinnedConversationsFromSnapshot:(id)a3;
- (id)preferredFocusEnvironments;
- (id)presentingViewControllerForOnboardingController:(id)a3;
- (id)previousPinnedConversationActivitySnapshotForConversation:(id)a3;
- (id)recentlyDeletedConversationMenu:(id)a3;
- (id)reportConcernForChat:(id)a3;
- (id)searchBarForSearchViewController:(id)a3;
- (id)searchController:(id)a3 conversationForChatGUID:(id)a4;
- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4;
- (id)selectedConversations;
- (id)showOscarModalAction;
- (id)showRecentlyDeletedModalAction;
- (id)supplementaryViewForIndexPath:(id)a3 inCollectionView:(id)a4 withKind:(id)a5;
- (id)tipCollectionViewCell:(id)a3 atIndexPath:(id)a4;
- (id)tipKitOnboardingCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)toggleReadButtonItem;
- (id)toolbarItemForIdentifier:(id)a3;
- (id)toolbarItems;
- (id)toolbarItemsForJunkFilterHasConversations:(BOOL)a3 hasSelectedConversations:(BOOL)a4;
- (id)toolbarItemsForRecentlyDeletedFilterHasConversations:(BOOL)a3 hasSelectedConversations:(BOOL)a4;
- (id)trailingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)transparentNavBarAppearance;
- (id)updaterLogHandle;
- (int64_t)_activityItemOriginationDirectionForItemIdentifier:(id)a3 conversation:(id)a4;
- (int64_t)_alertControllerStyle;
- (int64_t)_alertControllerStyleForCollapsedState:(BOOL)a3;
- (int64_t)_feedbackPinningInteractionMethod;
- (int64_t)distanceBetweenConversationIndexPath:(id)a3 andIndexPath:(id)a4;
- (int64_t)numberOfConversations;
- (int64_t)numberOfPinnedConversations;
- (int64_t)pinnedConversationViewLayoutStyle;
- (int64_t)pinningInteractionMethod;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)_destinationSectionForDropSession:(id)a3 destinationIndexPath:(id)a4;
- (unint64_t)_maxNumberOfDaysUntilDeletionInConversations:(id)a3;
- (unint64_t)_meCardSharingAudience;
- (unint64_t)_minNumberOfDaysUntilDeletionInConversations:(id)a3;
- (unint64_t)_numberOfRecoverableMessagesInConversations:(id)a3;
- (unint64_t)_numberOfSelectedConversations;
- (unint64_t)_preferredEditingMode:(unint64_t)a3;
- (unint64_t)_sanitizedFilterMode:(unint64_t)a3;
- (unint64_t)_sanitizedFilterModeForFilterUnknownDisabled:(unint64_t)a3;
- (unint64_t)_sanitizedFilterModeForFilterUnknownEnabled:(unint64_t)a3;
- (unint64_t)editingMode;
- (unint64_t)filterMode;
- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3;
- (void)_appendRecentlyDeletedIdentifersToSnapshot:(id)a3;
- (void)_cancelDeletion:(id)a3;
- (void)_chatAllowedByScreenTimeChanged:(id)a3;
- (void)_chatItemsDidChange:(id)a3;
- (void)_chatParticipantsChangedNotification:(id)a3;
- (void)_chatUnreadCountDidChange:(id)a3;
- (void)_chatWatermarkDidChange:(id)a3;
- (void)_ck_setNeedsUpdateOfMultitaskingDragExclusionRects;
- (void)_configureAvatarViewInConversationCell:(id)a3 forItemIdentifier:(id)a4;
- (void)_configureCloudTipViewModelIfNeeded;
- (void)_configureForFilterMode:(unint64_t)a3;
- (void)_configureInteractiveAvatarInConversationCell:(id)a3 forItemIdentifier:(id)a4;
- (void)_configureNavbarButtonsForNavigationItem:(id)a3;
- (void)_configurePinnedConversationCell:(id)a3 forConversation:(id)a4 itemIdentifier:(id)a5 indexPath:(id)a6 animated:(BOOL)a7;
- (void)_configureSearchBarClearButton:(BOOL)a3 searchController:(id)a4;
- (void)_configureSecondarySubMenuInParentMenuItems:(id)a3;
- (void)_consumeSummaryForConversationAtIndexPathIfNeeded:(id)a3;
- (void)_consumeSummaryOnUnreadCountChangeForChatIfNeeded:(id)a3;
- (void)_contactStoreDidFinishLoadingNotification:(id)a3;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_conversationContactPhotosEnabledChangedNotification:(id)a3;
- (void)_conversationDisplayNameChangedNotification:(id)a3;
- (void)_conversationFilteringStateChangedNotification:(id)a3;
- (void)_conversationIsFilteredChangedNotification:(id)a3;
- (void)_conversationListDidChange:(id)a3;
- (void)_conversationListDidFinishLoadingConversations:(id)a3;
- (void)_conversationListPinnedConversationsDidChange:(id)a3;
- (void)_conversationMessageWasSent:(id)a3;
- (void)_conversationMuteDidChangeNotification:(id)a3;
- (void)_conversationSpamFilteringStateChangedNotification:(id)a3;
- (void)_deselectSelectedIndexPathsInCollectionView:(id)a3 animated:(BOOL)a4;
- (void)_didPullToRefresh:(id)a3;
- (void)_didReceiveSummaries:(id)a3;
- (void)_dismissPresentedNavController:(id)a3;
- (void)_downtimeStateChanged:(id)a3;
- (void)_endHoldingUpdatesForBatchEditing:(BOOL)a3;
- (void)_endHoldingUpdatesOnViewWillAppear;
- (void)_ensureCellLayoutOnCell:(id)a3;
- (void)_freezeConversations;
- (void)_handingPendingConversationDidChange:(id)a3;
- (void)_handleChatRegistryDidPermanentlyDeleteRecoverableMessages:(id)a3;
- (void)_handleDidRecoverMessagesInChatsNotification:(id)a3;
- (void)_increaseContrastDidChange:(id)a3;
- (void)_infiniteScrollReachedIndexPath:(id)a3;
- (void)_iosUpdateNavbarLayoutIfNeeded;
- (void)_isDownloadingPendingSatelliteMessagesChanged;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_markAllConversationsAsRead;
- (void)_moveToRecentlyDeletedButtonTapped:(id)a3;
- (void)_multiWayCallStateChanged:(id)a3;
- (void)_pendingSatelliteCountChanged;
- (void)_performConversationDropWithCollectionView:(id)a3 dropCoordinator:(id)a4;
- (void)_performItemDropWithCollectionView:(id)a3 dropCoordinator:(id)a4;
- (void)_performMultiSelectCleanUp;
- (void)_performRecentlyDeletedMultiSelectCleanUp;
- (void)_performRecoverableDeletionForConversations:(id)a3 deleteDate:(id)a4;
- (void)_performTranscriptPushForItemAtIndexPath:(id)a3 userInitiated:(BOOL)a4;
- (void)_permanentDeleteAllButtonTapped:(id)a3;
- (void)_permanentDeleteAllJunkButtonTapped:(id)a3;
- (void)_permanentDeleteSelectedButtonTapped:(id)a3;
- (void)_permanentDeleteSelectedConversations;
- (void)_permanentDeleteSelectedJunkButtonTapped:(id)a3;
- (void)_permanentDeletionConfirmedForConversations:(id)a3;
- (void)_popToInbox;
- (void)_presentPermanentDeletionConfirmationsForConversations:(id)a3;
- (void)_presentRecoverConfirmationsForConversations:(id)a3;
- (void)_recoverAllButtonTapped:(id)a3;
- (void)_recoverConfirmedForConversations:(id)a3;
- (void)_recoverSelectedButtonTapped:(id)a3;
- (void)_recoverSelectedConversations;
- (void)_refreshConversationListCellForGroupPhotoUpdate:(id)a3;
- (void)_reloadRecoverableMetadataForNotification:(id)a3;
- (void)_reloadVisibleConversationList:(id)a3;
- (void)_removalCompleted;
- (void)_removeConversationsFromFrozenConversations:(id)a3;
- (void)_removeRefreshControl;
- (void)_resetMessageFiltering;
- (void)_resetSimFilteringToDefaultState;
- (void)_selectConversationAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)_setPinnedConversationViewLayoutStyle:(int64_t)a3 shouldInvalidateLayout:(BOOL)a4;
- (void)_showConversation:(id)a3 withComposition:(id)a4;
- (void)_showConversationWithComposition:(id)a3 atIndexPath:(id)a4;
- (void)_showOscarModalActionTapped;
- (void)_showRecentlyDeletedModalActionTapped;
- (void)_startRefreshControlTimer;
- (void)_submitFeedbackIfNecessaryForPinsChangedWithPreviousPinnedConversationIdentifiers:(id)a3;
- (void)_submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:(BOOL)a3;
- (void)_toggleUnreadStateForSelectedConversations:(id)a3;
- (void)_unfreezeConversations;
- (void)_updateAccountRegistrationFailureNotification;
- (void)_updateBannerLayoutConstraints;
- (void)_updateCollectionViewImmediatelyIfNeeded;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateConversationFilteredFlagsAndReportSpam;
- (void)_updateConversationListsAndSortIfEnabled;
- (void)_updateConversations:(id)a3 alertsHidden:(BOOL)a4;
- (void)_updateConversations:(id)a3 asRead:(BOOL)a4;
- (void)_updateForCurrentEditingStateAnimated:(BOOL)a3;
- (void)_updateInsets;
- (void)_updateLargeTitleDisplayModeWithAnimation:(BOOL)a3;
- (void)_updateNavbarLayoutIfNeeded;
- (void)_updateRefreshControlVisibility;
- (void)_updateScrollEdgeAppearanceProgress;
- (void)_updateSearchControllerForConversationListBelowMacSnapWidth:(BOOL)a3;
- (void)_updateSelectAllButtonItemTitle;
- (void)_updateSyncStatusViewWithSyncState:(id)a3;
- (void)_updateToolbarItems;
- (void)_updatedSelectedIndexPathCount;
- (void)addBanner:(id)a3 animated:(BOOL)a4;
- (void)animateInCollectionView:(id)a3 aboveBackgroundSnapshotView:(id)a4 enteringOnboarding:(BOOL)a5 animationDistance:(double)a6;
- (void)animateInPinsToFinalPosition;
- (void)animateOutBackgroundSnapshotView:(id)a3;
- (void)applicationWillSuspend;
- (void)applyConversationListSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5;
- (void)avatarHeaderWasTappedForConversation:(id)a3;
- (void)avatarViewTapped:(id)a3;
- (void)backButtonPressed;
- (void)beginHoldingConversationListUpdatesForPPTTests;
- (void)cancelButtonTapped:(id)a3;
- (void)catalystFiltersNavigationBackButtonTapped:(id)a3;
- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)commitPinnedConversationsForEditingPins;
- (void)commitPinnedConversationsFromSnapshot:(id)a3;
- (void)completeAnimation;
- (void)composeButtonClicked:(id)a3;
- (void)compositionSent;
- (void)configureAppEntityForConversationCell:(id)a3 forItemIdentifier:(id)a4;
- (void)configureConversationCell:(id)a3 forItemIdentifier:(id)a4;
- (void)configureDropTargetCell:(id)a3;
- (void)configureFocusFilterCell:(id)a3;
- (void)configureFocusFilterCollapsedCell:(id)a3;
- (void)configureForOscarFilter;
- (void)configureForRecentlyDeletedFilter;
- (void)configureNewMessageCell:(id)a3;
- (void)configureOnboardingTitleCell:(id)a3;
- (void)configurePinnedConversationCell:(id)a3 forItemIdentifier:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)configureRecoverableConversationCell:(id)a3 forItemIdentifier:(id)a4;
- (void)configureSearchBarEnabled:(BOOL)a3;
- (void)configureSelectionBarButtonItem:(id)a3 usingStyle:(unint64_t)a4;
- (void)configureTipCollectionViewCell:(id)a3;
- (void)configureTipKitOnboardingCell:(id)a3;
- (void)configureWithToolbarController:(id)a3;
- (void)dealloc;
- (void)deleteButtonTappedForItemIdentifier:(id)a3 completionHandler:(id)a4 cellToUpdate:(id)a5;
- (void)deleteSelectedConversation;
- (void)detailsAdapter:(id)a3 wantsToStageComposition:(id)a4;
- (void)detailsAdapterDidDismiss:(id)a3;
- (void)detailsAdapterWantsToPresentKTContactVerificationUI:(id)a3;
- (void)detailsAdapterWantsToPresentReportToAppleUI:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)didReorderConversationsWithTransaction:(id)a3;
- (void)dismissCatalystSearch;
- (void)dismissDetailsNavigationController;
- (void)dismissDetailsViewAndShowConversationList;
- (void)doneButtonTapped:(id)a3;
- (void)editButtonMenuWillShow;
- (void)editNameAndPhotoMenuItemSelected;
- (void)endHoldingConversationListUpdatesForPPTTests;
- (void)fetchPinningSuggestions;
- (void)focusFilterBannerEnabledStateDidChange:(BOOL)a3;
- (void)focusStateDidChange;
- (void)invalidateCellLayout;
- (void)ktFailureTipUpdated;
- (void)leaveJunkFilterIfNeeded;
- (void)loadView;
- (void)micCloudTipUpdated;
- (void)muteConversationButtonTappedForConversationWithItemIdentifier:(id)a3 setMuted:(BOOL)a4;
- (void)onboardingControllerDidFinish:(id)a3;
- (void)oscarViewWillAppear:(BOOL)a3;
- (void)performDeletionForActiveConversation:(id)a3 itemIdentifier:(id)a4 completionHandler:(id)a5 cellToUpdate:(id)a6;
- (void)performDeletionForPendingConversationCell:(id)a3 completionHandler:(id)a4;
- (void)performResumeDeferredSetup;
- (void)performSearch:(id)a3 completion:(id)a4;
- (void)pinButtonTappedForCell:(id)a3;
- (void)pinConversation:(id)a3 withReason:(id)a4;
- (void)pinConversationsWithCompletion:(id)a3;
- (void)pinnedConversationView:(id)a3 didUpdateWithActivitySnapshot:(id)a4;
- (void)pinningTipActionTapped;
- (void)pinningTipUpdated;
- (void)prepareForSuspend;
- (void)presentDetailsForItemIdentifier:(id)a3 fromView:(id)a4;
- (void)presentJunkConversationRecoveryConfirmation:(id)a3;
- (void)presentPermanentJunkConversationDeletionConfirmation:(id)a3;
- (void)presentPermanentJunkConversationDeletionConfirmation:(id)a3 alertsCompletedBlock:(id)a4 cancelBlock:(id)a5;
- (void)presentRecoverableDeleteConfirmationsWithConversations:(id)a3 collapsedAppearance:(BOOL)a4 alertsCompletedBlock:(id)a5 cancelBlock:(id)a6;
- (void)providerWillBeRemovedFromToolbarController:(id)a3;
- (void)reasonTrackingUpdater:(id)a3 didBeginHoldingUpdatesWithInitialReason:(id)a4;
- (void)reasonTrackingUpdater:(id)a3 didEndHoldingUpdatesWithFinalReason:(id)a4;
- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5;
- (void)recentlyDeletedViewWillAppear:(BOOL)a3;
- (void)recoverableDeleteSelectedConversations;
- (void)registerForCloudKitEventsImmediately;
- (void)registerForCloudKitEventsWithDelayedRegistration:(BOOL)a3;
- (void)registerForFocusStateChanges;
- (void)reloadData;
- (void)removeBanner:(id)a3 animated:(BOOL)a4;
- (void)removeNewlyPinnedSuggestionCells:(id)a3;
- (void)removePendingConversationCell;
- (void)scrollToFirstSelectedItemIfNecessary;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)searchController:(id)a3 didSelectItem:(id)a4 inChat:(id)a5;
- (void)searchControllerDidBeginDragging:(id)a3;
- (void)searchViewController:(id)a3 requestsPushOfSearchController:(id)a4;
- (void)selectAllButtonTapped:(id)a3;
- (void)selectConversationClosestToDeletedIndex:(id)a3;
- (void)selectDefaultConversationAnimated:(BOOL)a3;
- (void)selectDefaultConversationAnimated:(BOOL)a3 removingPendingConversationCell:(BOOL)a4;
- (void)selectDefaultConversationAnimated:(BOOL)a3 shouldUsePreviousySelectedIndexPath:(BOOL)a4;
- (void)selectFirstActiveConversation;
- (void)selectNextSequentialConversation:(BOOL)a3;
- (void)selectPinnedConversationForItem:(int64_t)a3;
- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4;
- (void)setBannerHeight:(double)a3;
- (void)setBannerTopConstraint:(id)a3;
- (void)setBlockedSnapshotInfo:(id)a3;
- (void)setCacheForLastDisplayedActivitySnapshotByConversation:(id)a3;
- (void)setCanShowSuggestedPinningOnboardingCell:(BOOL)a3;
- (void)setCancelButtonItem:(id)a3;
- (void)setCatalystFiltersNavigationBackButton:(id)a3;
- (void)setCellLayout:(id)a3;
- (void)setCloseButtonItem:(id)a3;
- (void)setCollectionViewRefreshControl:(id)a3;
- (void)setCompletedDeferredSetup:(BOOL)a3;
- (void)setComposeButtonItem:(id)a3;
- (void)setComposeToolbarItem:(id)a3;
- (void)setCompositionWasSent:(BOOL)a3;
- (void)setContactStore:(id)a3;
- (void)setConversationLayout:(id)a3;
- (void)setConversationToPinPendingOrbDismissal:(id)a3;
- (void)setConversationToUnpinPendingOrbDismissal:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDeferredSearchQuery:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setEditOscarButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingMode:(unint64_t)a3;
- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4 shouldUpdate:(BOOL)a5;
- (void)setFilterMode:(unint64_t)a3;
- (void)setFrozenConversations:(id)a3;
- (void)setFrozenPinnedConversations:(id)a3;
- (void)setHasActivePinnedConversationDropSession:(BOOL)a3;
- (void)setHaveAppliedInitialSnapshot:(BOOL)a3;
- (void)setHidePinsForAnimation:(BOOL)a3;
- (void)setHoldPinningUpdatesForConversationDeletion:(BOOL)a3;
- (void)setHoldPinningUpdatesForOnboardingAnimation:(BOOL)a3;
- (void)setIsAppearing:(BOOL)a3;
- (void)setIsApplyingSnapshot:(BOOL)a3;
- (void)setIsBelowMacSnapToMinWidth:(BOOL)a3;
- (void)setIsCheckingIfPinningOnboardingNeeded:(BOOL)a3;
- (void)setIsCommitingDiffableDataSourceTransaction:(BOOL)a3;
- (void)setIsCurrentlyAnimatingPinningOnboardingSuggestions:(BOOL)a3;
- (void)setIsInitialAppearance:(BOOL)a3;
- (void)setIsShowingPinnedChatDropTarget:(BOOL)a3;
- (void)setIsShowingPinningOnboarding:(BOOL)a3;
- (void)setIsShowingSwipeDeleteConfirmation:(BOOL)a3;
- (void)setItemIdentifiersForVisibleContextMenuInteractions:(id)a3;
- (void)setJunkCellLayout:(id)a3;
- (void)setKeyboardIsShowing:(BOOL)a3;
- (void)setLastSelectedConversationItemIdentifier:(id)a3;
- (void)setLastUserSelectedConversationItemIdentifier:(id)a3;
- (void)setLastUserSelectedConversationTime:(id)a3;
- (void)setMacShouldShowZKWSearch:(BOOL)a3;
- (void)setMacToolbarController:(id)a3;
- (void)setMacVirtualComposeButton:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setMoveSelectedToRecentlyDeletedButtonItem:(id)a3;
- (void)setNeedsConversationListUpdateForFocusStateChange;
- (void)setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:(BOOL)a3;
- (void)setNoMessagesDialogView:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)setOptionsButtonItem:(id)a3;
- (void)setOscarModal:(BOOL)a3;
- (void)setPermanentDeleteAllButtonItem:(id)a3;
- (void)setPermanentDeleteAllJunkButtonItem:(id)a3;
- (void)setPermanentDeleteSelectedButtonItem:(id)a3;
- (void)setPermanentDeleteSelectedJunkButtonItem:(id)a3;
- (void)setPinnedConversationSuggester:(id)a3;
- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3;
- (void)setPinningInteractionMethod:(int64_t)a3;
- (void)setPresentedBanner:(id)a3;
- (void)setPrototypePinnedConversationCollectionViewCell:(id)a3;
- (void)setRecentlyDeletedModal:(BOOL)a3;
- (void)setRecommendedPinningConversations:(id)a3;
- (void)setRecoverAllButtonItem:(id)a3;
- (void)setRecoverSelectedButtonItem:(id)a3;
- (void)setRefreshControlTimer:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultsController:(id)a3;
- (void)setSelectAllButtonItem:(id)a3;
- (void)setShouldUseFastPreviewText:(BOOL)a3;
- (void)setStandardCellLayout:(id)a3;
- (void)setSyncStatusView:(id)a3;
- (void)setTipKitQueue:(id)a3;
- (void)setTipManager:(id)a3;
- (void)setUpdater:(id)a3;
- (void)setWillRotate:(BOOL)a3;
- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4;
- (void)showCannotPinMoreConversationsAlert;
- (void)showMeCardViewController;
- (void)showMeCardViewControllerWithNickname:(id)a3;
- (void)showMultiplePhoneNumbersAlertForNicknames;
- (void)showiCloudNotSignedInAlertForNicknames;
- (void)significantTimeChange;
- (void)siriTipUpdated;
- (void)startCompletePinningOnboardingAnimation;
- (void)startEndSuggestedPinsAnimation;
- (void)startSuggestedPinsAnimation;
- (void)startTipCellAnimatingIfNecessary;
- (void)stopTipCellAnimatingIfNecessary;
- (void)togglePinStateForConversation:(id)a3 withReason:(id)a4;
- (void)toggleReadButtonTapped:(id)a3;
- (void)trackSIMFilterUpdateEventFromOldSIMFilterIndex:(int64_t)a3 toSelectedSIMFilterIndex:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)unpinButtonTappedForCell:(id)a3 withConversation:(id)a4;
- (void)unpinConversation:(id)a3 withReason:(id)a4;
- (void)unregisterForCloudKitEvents;
- (void)updateBackButton;
- (void)updateBannerConstraintsForScrollViewDidScroll:(id)a3;
- (void)updateBannerVisualEffectGroup;
- (void)updateConfigurationStateForSelectedCell;
- (void)updateContentsOfAllCellsAnimated:(BOOL)a3;
- (void)updateContentsOfCell:(id)a3 withItemIdentifier:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6;
- (void)updateContentsOfCellForConversation:(id)a3 animated:(BOOL)a4;
- (void)updateContentsOfCellWithIndexPath:(id)a3 animated:(BOOL)a4;
- (void)updateContentsOfCellWithItemIdentifier:(id)a3 animated:(BOOL)a4;
- (void)updateContentsOfCellWithItemIdentifier:(id)a3 indexPath:(id)a4 animated:(BOOL)a5;
- (void)updateContentsOfCellsWithItemIdentifiers:(id)a3 animated:(BOOL)a4;
- (void)updateConversationList;
- (void)updateConversationListForMessageSentToConversation:(id)a3;
- (void)updateConversationNamesForNicknames:(id)a3;
- (void)updateConversationSelection;
- (void)updateConversationSelectionPreservingLastSelectedItemIdentifier;
- (void)updateConversationSelectionToNewCompose;
- (void)updateFocusFilterBannerWithAnimation:(BOOL)a3;
- (void)updateNavigationItems;
- (void)updateNoMessagesDialog;
- (void)updateSIMFilterIndexAndReloadData:(int64_t)a3;
- (void)updateSMSSpamConversationsDisplayName;
- (void)updateSnapshotAnimatingDifferences:(BOOL)a3;
- (void)updateSnapshotAnimatingDifferences:(BOOL)a3 completion:(id)a4;
- (void)updateSyncProgressIfNeeded;
- (void)userDeletedJunkConversationFromTranscript;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidAppearDeferredSetup;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation CKConversationListCollectionViewController

- (void)loadView
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  self->_isInitialAppearance = 1;
  self->_shouldUseFastPreviewText = ![(CKConversationListCollectionViewController *)self completedDeferredSetup];
  v108.receiver = self;
  v108.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v108 loadView];
  v3 = [(CKConversationListCollectionViewController *)self conversationLayout];
  [v3 updatePinnedConversationViewLayoutStyle];

  v4 = [(CKConversationListCollectionViewController *)self collectionView];
  v5 = [(CKConversationListCollectionViewController *)self dataSourceWithCollectionView:v4];
  [(CKConversationListCollectionViewController *)self setDataSource:v5];

  v6 = [(CKConversationListCollectionViewController *)self dataSource];
  v7 = [(CKConversationListCollectionViewController *)self collectionView];
  [v7 setDataSource:v6];

  v8 = [(CKConversationListCollectionViewController *)self collectionView];
  [v8 setAutoresizingMask:18];

  v9 = [(CKConversationListCollectionViewController *)self collectionView];
  [v9 setDelegate:self];

  v10 = [(CKConversationListCollectionViewController *)self collectionView];
  [v10 setDragInteractionEnabled:1];

  v11 = [(CKConversationListCollectionViewController *)self collectionView];
  [v11 setDragDelegate:self];

  v12 = [(CKConversationListCollectionViewController *)self collectionView];
  [v12 setDropDelegate:self];

  v13 = [(CKConversationListCollectionViewController *)self collectionView];
  [v13 setAlwaysBounceVertical:1];

  v14 = [(CKConversationListCollectionViewController *)self collectionView];
  [v14 setPreservesSuperviewLayoutMargins:1];

  v15 = [(CKConversationListCollectionViewController *)self collectionView];
  [v15 setAllowsFocus:0];

  v16 = +[CKUIBehavior sharedBehaviors];
  v17 = [v16 theme];
  uint64_t v18 = [v17 scrollIndicatorStyle];
  v19 = [(CKConversationListCollectionViewController *)self collectionView];
  [v19 setIndicatorStyle:v18];

  v20 = [(CKConversationListCollectionViewController *)self collectionView];
  [v20 setShowsHorizontalScrollIndicator:0];

  v21 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v18) = [v21 darkUIEnabled];
  uint64_t v22 = [(CKConversationListCollectionViewController *)self collectionView];
  [(id)v22 setShowsVerticalScrollIndicator:v18 ^ 1];

  v23 = [(CKConversationListCollectionViewController *)self collectionView];
  [v23 setAccessibilityIdentifier:@"ConversationList"];

  v24 = [(CKConversationListCollectionViewController *)self collectionView];
  LOBYTE(v22) = objc_opt_respondsToSelector();

  if (v22)
  {
    v25 = [(CKConversationListCollectionViewController *)self collectionView];
    [v25 _setDelaysUserInitiatedItemSelection:1];
  }
  v26 = objc_alloc_init(CKConversationListCollectionViewDragFeedbackGenerator);
  v27 = [(CKConversationListCollectionViewController *)self collectionView];
  [v27 _setReorderFeedbackGenerator:v26];

  v28 = [(CKConversationListCollectionViewController *)self collectionView];
  [v28 _setPreferredDragDestinationVisualStyle:1];

  v29 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v30 = objc_opt_class();
  v31 = +[CKFocusFilterBannerCollectionViewCell reuseIdentifier];
  [v29 registerClass:v30 forCellWithReuseIdentifier:v31];

  v32 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v33 = objc_opt_class();
  v34 = +[CKFocusFilterBannerCollapsedCollectionViewCell reuseIdentifier];
  [v32 registerClass:v33 forCellWithReuseIdentifier:v34];

  v35 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v36 = objc_opt_class();
  v37 = +[CKPinningOnboardingTitleCell reuseIdentifier];
  [v35 registerClass:v36 forCellWithReuseIdentifier:v37];

  v38 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v39 = objc_opt_class();
  v40 = +[CKPinnedConversationCollectionViewCell reuseIdentifier];
  [v38 registerClass:v39 forCellWithReuseIdentifier:v40];

  v41 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v42 = objc_opt_class();
  v43 = +[CKPinnedConversationDropTargetCollectionViewCell reuseIdentifier];
  [v41 registerClass:v42 forCellWithReuseIdentifier:v43];

  v44 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v45 = objc_opt_class();
  v46 = +[CKConversationListNewMessageCollectionViewCell reuseIdentifier];
  [v44 registerClass:v45 forCellWithReuseIdentifier:v46];

  v47 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v48 = objc_opt_class();
  v49 = +[CKConversationListEmbeddedStandardTableViewCell reuseIdentifier];
  [v47 registerClass:v48 forCellWithReuseIdentifier:v49];

  v50 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v51 = objc_opt_class();
  v52 = +[CKConversationListEmbeddedLargeTextTableViewCell reuseIdentifier];
  [v50 registerClass:v51 forCellWithReuseIdentifier:v52];

  v53 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v54 = objc_opt_class();
  v55 = +[CKTipKitOnboardingCollectionViewCell reuseIdentifier];
  [v53 registerClass:v54 forCellWithReuseIdentifier:v55];

  v56 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v57 = objc_opt_class();
  v58 = +[CKTipCollectionViewCell reuseIdentifier];
  [v56 registerClass:v57 forCellWithReuseIdentifier:v58];

  v59 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v60 = objc_opt_class();
  v61 = +[CKPinnedSectionSeparatorView reuseIdentifier];
  v62 = +[CKPinnedSectionSeparatorView reuseIdentifier];
  [v59 registerClass:v60 forSupplementaryViewOfKind:v61 withReuseIdentifier:v62];

  v63 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v64 = objc_opt_class();
  v65 = +[CKRecoverableSectionDisclosureView reuseIdentifier];
  v66 = +[CKRecoverableSectionDisclosureView reuseIdentifier];
  [v63 registerClass:v64 forSupplementaryViewOfKind:v65 withReuseIdentifier:v66];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v67 = +[CKConversationListCollectionViewRecoverableConversationCell reuseIdentifiers];
  uint64_t v68 = [v67 countByEnumeratingWithState:&v104 objects:v112 count:16];
  if (v68)
  {
    uint64_t v69 = *(void *)v105;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v105 != v69) {
          objc_enumerationMutation(v67);
        }
        uint64_t v71 = *(void *)(*((void *)&v104 + 1) + 8 * v70);
        v72 = [(CKConversationListCollectionViewController *)self collectionView];
        [v72 registerClass:objc_opt_class() forCellWithReuseIdentifier:v71];

        ++v70;
      }
      while (v68 != v70);
      uint64_t v68 = [v67 countByEnumeratingWithState:&v104 objects:v112 count:16];
    }
    while (v68);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v73 = +[CKConversationListCollectionViewRecoverableConversationCell reuseIdentifiers];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v100 objects:v111 count:16];
  if (v74)
  {
    uint64_t v75 = *(void *)v101;
    do
    {
      uint64_t v76 = 0;
      do
      {
        if (*(void *)v101 != v75) {
          objc_enumerationMutation(v73);
        }
        uint64_t v77 = *(void *)(*((void *)&v100 + 1) + 8 * v76);
        v78 = [(CKConversationListCollectionViewController *)self collectionView];
        [v78 registerClass:objc_opt_class() forCellWithReuseIdentifier:v77];

        ++v76;
      }
      while (v74 != v76);
      uint64_t v74 = [v73 countByEnumeratingWithState:&v100 objects:v111 count:16];
    }
    while (v74);
  }

  v79 = +[CKUIBehavior sharedBehaviors];
  v80 = [v79 theme];

  v81 = [v80 conversationListBackgroundColor];
  if (v81)
  {
  }
  else if (!CKIsRunningInMacCatalyst() {
         || ([MEMORY[0x1E4F6E778] sharedFeatureFlags],
  }
             v84 = objc_claimAutoreleasedReturnValue(),
             int v85 = [v84 macApplicationMetricsGatheringEnabled],
             v84,
             !v85))
  {
    v82 = [(CKConversationListCollectionViewController *)self collectionView];
    v83 = [v80 conversationListCollectionViewBackgroundColor];
    [v82 setBackgroundColor:v83];
    goto LABEL_23;
  }
  v82 = [(CKConversationListCollectionViewController *)self collectionView];
  v83 = [v80 conversationListBackgroundColor];
  [v82 setBackgroundColor:v83];
LABEL_23:

  if (!CKIsRunningInMacCatalyst()
    || ([MEMORY[0x1E4F6E778] sharedFeatureFlags],
        v86 = objc_claimAutoreleasedReturnValue(),
        char v87 = [v86 macApplicationMetricsGatheringEnabled],
        v86,
        (v87 & 1) == 0))
  {
    v88 = [(CKConversationListCollectionViewController *)self collectionView];
    id v89 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v90 = [(CKConversationListCollectionViewController *)self collectionView];
    [v90 bounds];
    v91 = objc_msgSend(v89, "initWithFrame:");
    [v88 setBackgroundView:v91];
  }
  v92 = [(CKConversationListCollectionViewController *)self navigationController];
  v93 = [v92 navigationBar];
  v94 = [MEMORY[0x1E4F428B8] clearColor];
  [v93 setBackgroundColor:v94];

  [(CKConversationListCollectionViewController *)self updateNavigationItems];
  if (!self->_tipManager)
  {
    v95 = [[CKConversationListTipManager alloc] initWithConversationListController:self];
    tipManager = self->_tipManager;
    self->_tipManager = v95;
  }
  v97 = [(CKConversationListCollectionViewController *)self updater];
  [v97 setNeedsDeferredUpdateWithReason:@"viewLoaded"];

  if (IMOSLoggingEnabled())
  {
    v98 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      v99 = [(CKConversationListCollectionViewController *)self collectionView];
      *(_DWORD *)buf = 138412290;
      v110 = v99;
      _os_log_impl(&dword_18EF18000, v98, OS_LOG_TYPE_INFO, "loadView, collectionView initialized as:%@", buf, 0xCu);
    }
  }
}

- (id)dataSourceWithCollectionView:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F42880]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke;
  v12[3] = &unk_1E5625CD0;
  objc_copyWeak(&v13, &location);
  v6 = (void *)[v5 initWithCollectionView:v4 cellProvider:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_2;
  v10[3] = &unk_1E5625CF8;
  objc_copyWeak(&v11, &location);
  [v6 setSupplementaryViewProvider:v10];
  [v6 _setCanReorderItemHandler:&__block_literal_global_100];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_4;
  v8[3] = &unk_1E5627A68;
  objc_copyWeak(&v9, &location);
  [v6 _setDidReorderItemsHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v6;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)completedDeferredSetup
{
  return self->_completedDeferredSetup;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 willDisplayCell];
  }
  [(CKConversationListCollectionViewController *)self _infiniteScrollReachedIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = [(CKConversationListCollectionViewController *)self dataSource];
    v10 = [v9 itemIdentifierForIndexPath:v7];
    [(CKConversationListCollectionViewController *)self configureAppEntityForConversationCell:v8 forItemIdentifier:v10];
  }
}

- (void)configureAppEntityForConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:a4];
  [v6 configureAppEntityForConversation:v7];
}

- (void)_infiniteScrollReachedIndexPath:(id)a3
{
  id v13 = a3;
  if ([v13 section] == 5)
  {
    id v4 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v13];
    if (v4)
    {
      id v5 = [(CKConversationListCollectionViewController *)self dataSource];
      id v6 = [(CKConversationListCollectionViewController *)self collectionView];
      uint64_t v7 = objc_msgSend(v5, "collectionView:numberOfItemsInSection:", v6, objc_msgSend(v13, "section"));
      uint64_t v8 = v7 - [v13 row];

      id v9 = [(CKConversationListCollectionViewController *)self conversationList];
      v10 = [v9 scrollingController];
      id v11 = [v4 chat];
      v12 = [v11 lastFinishedMessageDate];
      objc_msgSend(v10, "reachedConversationWithLastMessageDate:filterMode:remainingRows:", v12, -[CKConversationListCollectionViewController filterMode](self, "filterMode"), v8);
    }
  }
}

- (id)conversationForItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CKConversationListNewMessageCollectionViewCell reuseIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(CKConversationListCollectionViewController *)self conversationList];
    uint64_t v8 = [v7 pendingConversation];
    goto LABEL_15;
  }
  id v9 = @"pinned-";
  if (([v4 hasPrefix:@"pinned-"] & 1) != 0
    || (id v9 = @"list-", ([v4 hasPrefix:@"list-"] & 1) != 0)
    || (id v9 = @"junk-", ([v4 hasPrefix:@"junk-"] & 1) != 0)
    || (id v9 = @"recoverable-", ([v4 hasPrefix:@"recoverable-"] & 1) != 0))
  {
    uint64_t v7 = objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v9, "length"));
    if ([v7 length])
    {
      v10 = [(CKConversationListCollectionViewController *)self conversationList];
      uint64_t v8 = [v10 conversationForExistingChatWithGUID:v7];

      goto LABEL_15;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Invalid conversation itemIdentifier. Lacks section prefix.", v13, 2u);
      }
    }
    uint64_t v7 = 0;
  }
  uint64_t v8 = 0;
LABEL_15:

  return v8;
}

- (id)conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (id)conversationAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self dataSource];
  int v6 = [v5 itemIdentifierForIndexPath:v4];

  uint64_t v7 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];

  return v7;
}

- (void)updateContentsOfCellWithIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  int v6 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v7 = [v6 itemIdentifierForIndexPath:v8];
  if (v7) {
    [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v7 indexPath:v8 animated:v4];
  }
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)updateContentsOfCellWithItemIdentifier:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = [(CKConversationListCollectionViewController *)self collectionView];
  v10 = [v9 cellForItemAtIndexPath:v8];

  if (v10) {
    [(CKConversationListCollectionViewController *)self updateContentsOfCell:v10 withItemIdentifier:v11 atIndexPath:v8 animated:v5];
  }
}

- (void)updateContentsOfCell:(id)a3 withItemIdentifier:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CKConversationListCollectionViewController *)self configurePinnedConversationCell:v10 forItemIdentifier:v11 indexPath:v12 animated:v6];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CKConversationListCollectionViewController *)self configureDropTargetCell:v10];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v13];
    [(CKConversationListCollectionViewController *)self configureNewMessageCell:v13];
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v13];
    [(CKConversationListCollectionViewController *)self configureRecoverableConversationCell:v13 forItemIdentifier:v11];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v13];
    [(CKConversationListCollectionViewController *)self configureConversationCell:v13 forItemIdentifier:v11];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CKConversationListCollectionViewController *)self configureTipKitOnboardingCell:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CKConversationListCollectionViewController *)self configureTipCollectionViewCell:v10];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CKConversationListCollectionViewController *)self configureOnboardingTitleCell:v10];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CKConversationListCollectionViewController *)self configureFocusFilterCell:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(CKConversationListCollectionViewController *)self configureFocusFilterCollapsedCell:v10];
          }
          else if (IMOSLoggingEnabled())
          {
            v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = (objc_class *)objc_opt_class();
              v16 = NSStringFromClass(v15);
              int v17 = 138412290;
              uint64_t v18 = v16;
              _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Unhandled cell of class %@ in -[updateContentsOfCell:withItemIdentifier:atIndexPath:animated:].", (uint8_t *)&v17, 0xCu);
            }
          }
        }
      }
    }
  }
LABEL_12:
}

- (void)configureConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];
  [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v7];
  objc_msgSend(v7, "updateContentsForConversation:fastPreview:", v11, -[CKConversationListCollectionViewController shouldUseFastPreviewText](self, "shouldUseFastPreviewText"));
  id v8 = objc_msgSend(v7, "leadingEditingAccessoryConfigurationsForEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  [v7 setLeadingEditingAccessoryConfigurations:v8];

  id v9 = objc_msgSend(v7, "trailingEditingAccessoryConfigurationsForEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  [v7 setTrailingEditingAccessoryConfigurations:v9];

  id v10 = [(CKConversationListCollectionViewController *)self delegate];
  objc_msgSend(v7, "setShouldUseSidebarBackgroundConfiguration:", objc_msgSend(v10, "isCollapsed") ^ 1);

  objc_msgSend(v7, "setEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  [v7 setEmbeddedCellDelegate:self];
  [(CKConversationListCollectionViewController *)self _configureAvatarViewInConversationCell:v7 forItemIdentifier:v6];
  [(CKConversationListCollectionViewController *)self _configureInteractiveAvatarInConversationCell:v7 forItemIdentifier:v6];
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (CKConversationListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKConversationListControllerDelegate *)WeakRetained;
}

- (BOOL)shouldUseFastPreviewText
{
  return self->_shouldUseFastPreviewText;
}

- (void)_configureInteractiveAvatarInConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 avatarView];
  [v7 setUserInteractionEnabled:1];
  [v7 setForcePressView:v7];
  id v8 = [v12 avatarViewTapGestureRecognizer];

  if (!v8)
  {
    id v9 = [[_CKCollectionViewTapGestureRecognizer alloc] initWithTarget:self action:sel_avatarViewTapped_];
    [v12 setAvatarViewTapGestureRecognizer:v9];

    id v10 = [v12 avatarViewTapGestureRecognizer];
    [v7 addGestureRecognizer:v10];
  }
  id v11 = [v12 avatarViewTapGestureRecognizer];
  [v11 setOriginatingItemIdentifier:v6];
}

- (void)_configureAvatarViewInConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v5 = a3;
  [v5 setDelegate:self];
  id v6 = [v5 avatarView];

  [v6 setPresentingViewController:self];
}

- (void)_ensureCellLayoutOnCell:(id)a3
{
  id v5 = a3;
  id v6 = [(CKConversationListCollectionViewController *)self cellLayout];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"CKConversationListCollectionViewController+DataSource.m", 1260, @"%@ needs a cell layout.", v9 object file lineNumber description];
  }
  id v10 = [(CKConversationListCollectionViewController *)self cellLayout];
  [v5 setCellLayout:v10];
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (double)widthForDeterminingAvatarVisibility
{
  v2 = [(CKConversationListCollectionViewController *)self collectionView];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_2()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Completed cloud tip configuration", v1, 2u);
    }
  }
}

- (void)pinningTipUpdated
{
  if ([(CKConversationListTipManager *)self->_tipManager presentedTip] == 2)
  {
    [(CKConversationListCollectionViewController *)self fetchPinningSuggestions];
  }
  else
  {
    [(CKConversationListCollectionViewController *)self setCanShowSuggestedPinningOnboardingCell:0];
    [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
  }
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  double v4 = [(CKConversationListCollectionViewController *)self delegate];
  char v5 = [v4 isCollapsed];

  if ((v5 & 1) == 0
    || [(CKConversationListCollectionViewController *)self filterMode] == 7
    || [(CKConversationListCollectionViewController *)self filterMode] == 9
    || ([(CKConversationListCollectionViewController *)self dataSource],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 snapshot],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 numberOfItems],
        v7,
        v6,
        v8 >= 1))
  {
    [(CKConversationListCollectionViewController *)self _setContentUnavailableConfiguration:0];
  }
  else
  {
    id v9 = [(CKConversationListCollectionViewController *)self _defaultEmptyStateConfiguration];
    [(CKConversationListCollectionViewController *)self _setContentUnavailableConfiguration:v9];
  }
}

id __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained cellForIndexPath:v8 inCollectionView:v9 withItemIdentifier:v7];

  return v11;
}

- (id)cellForIndexPath:(id)a3 inCollectionView:(id)a4 withItemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch([v8 section])
  {
    case 0:
      if ([(CKConversationListCollectionViewController *)self isBelowMacSnapToMinWidth]) {
        [(CKConversationListCollectionViewController *)self cellForCollapsedSidebarFocusFilterCellInCollectionView:v9 atIndexPath:v8];
      }
      else {
      uint64_t v11 = [(CKConversationListCollectionViewController *)self cellForFocusFilterInCollectionView:v9 atIndexPath:v8];
      }
      goto LABEL_22;
    case 1:
      uint64_t v11 = [(CKConversationListCollectionViewController *)self cellForPinningOnboardingTitleViewCollectionView:v9 atIndexPath:v8];
      goto LABEL_22;
    case 2:
      id v12 = +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier];
      if ([v10 isEqualToString:v12])
      {

LABEL_13:
        uint64_t v11 = [(CKConversationListCollectionViewController *)self cellForPinnedConversationDropTargetInCollectionView:v9 atIndexPath:v8];
        goto LABEL_22;
      }
      v16 = +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifierForDropTargetAtItemIndex:](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifierForDropTargetAtItemIndex:", [v8 item]);
      int v17 = [v10 isEqualToString:v16];

      if (v17) {
        goto LABEL_13;
      }
      if ([(CKConversationListCollectionViewController *)self isBelowMacSnapToMinWidth])
      {
LABEL_19:
        id v15 = [(CKConversationListCollectionViewController *)self cellForStandardConversationWithItemIdentifier:v10 inCollectionView:v9 atIndexPath:v8];
LABEL_20:
        v20 = v15;
        [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v15];
      }
      else
      {
        uint64_t v11 = [(CKConversationListCollectionViewController *)self cellForPinnedConversationWithItemIdentifier:v10 inCollectionView:v9 atIndexPath:v8];
LABEL_22:
        v20 = (void *)v11;
      }
LABEL_23:

      return v20;
    case 3:
      id v13 = +[CKTipKitOnboardingCollectionViewCell reuseIdentifier];
      int v14 = [v10 isEqualToString:v13];

      if (v14)
      {
        uint64_t v11 = [(CKConversationListCollectionViewController *)self tipKitOnboardingCollectionView:v9 atIndexPath:v8];
        goto LABEL_22;
      }
      uint64_t v18 = +[CKTipCollectionViewCell reuseIdentifier];
      int v19 = [v10 isEqualToString:v18];

      if (v19)
      {
        uint64_t v11 = [(CKConversationListCollectionViewController *)self tipCollectionViewCell:v9 atIndexPath:v8];
        goto LABEL_22;
      }
LABEL_16:
      v20 = 0;
      goto LABEL_23;
    case 4:
      id v15 = [(CKConversationListCollectionViewController *)self newMessageCellInCollectionView:v9 atIndexPath:v8];
      goto LABEL_20;
    case 5:
      goto LABEL_19;
    case 6:
      id v15 = [(CKConversationListCollectionViewController *)self cellForRecoverableConversationWithItemIdentifier:v10 inCollectionView:v9 atIndexPath:v8];
      goto LABEL_20;
    default:
      goto LABEL_16;
  }
}

- (id)cellForStandardConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    uint64_t v11 = [(CKConversationListCollectionViewController *)self cellForRecoverableConversationWithItemIdentifier:v8 inCollectionView:v9 atIndexPath:v10];
  }
  else
  {
    id v12 = +[CKConversationListCollectionViewConversationCell reuseIdentifier];
    uint64_t v11 = [v9 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v10];

    id v13 = [(CKConversationListCollectionViewController *)self standardCellLayout];
    [(CKConversationListCollectionViewController *)self setCellLayout:v13];

    [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v11];
    [(CKConversationListCollectionViewController *)self configureConversationCell:v11 forItemIdentifier:v8];
  }

  return v11;
}

- (CKConversationListCellLayout)standardCellLayout
{
  standardCellLayout = self->_standardCellLayout;
  if (!standardCellLayout)
  {
    double v4 = (CKConversationListCellLayout *)objc_opt_new();
    char v5 = self->_standardCellLayout;
    self->_standardCellLayout = v4;

    standardCellLayout = self->_standardCellLayout;
  }

  return standardCellLayout;
}

- (void)setCellLayout:(id)a3
{
}

void __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_3;
  v17[3] = &unk_1E5629F88;
  v17[4] = *(void *)(a1 + 40);
  double v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", v17);

  double v4 = [MEMORY[0x1E4F6C360] sharedInstance];
  if (![v4 isInternalInstall])
  {
LABEL_11:

    goto LABEL_12;
  }
  int v5 = IMGetCachedDomainBoolForKeyWithDefaultValue();

  if (v5)
  {
    uint64_t v6 = [v3 count];
    if (v6 != 3)
    {
      unint64_t v7 = 3 - v6;
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v19 = v7;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Populating (%lu) remaining onboarding conversations.", buf, 0xCu);
        }
      }
      id v9 = [*(id *)(a1 + 40) conversationList];
      id v10 = [v9 conversations];

      if ([v10 count] >= v7)
      {
        double v4 = objc_msgSend(v10, "subarrayWithRange:", 0, v7);

        uint64_t v11 = [v3 arrayByAddingObjectsFromArray:v4];

        double v3 = (void *)v11;
      }
      else
      {
        double v4 = v10;
      }
      goto LABEL_11;
    }
  }
LABEL_12:
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [*(id *)(a1 + 32) count];
      uint64_t v14 = [v3 count];
      *(_DWORD *)buf = 134218240;
      unint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "We were asked to show onboarding tip. Suggestions: (%lu) Conversations: (%lu)", buf, 0x16u);
    }
  }
  if ((unint64_t)[v3 count] >= 3)
  {
    v16 = *(void **)(a1 + 40);
    id v15 = (id *)(a1 + 40);
    [v16 setRecommendedPinningConversations:v3];
    [*v15 setCanShowSuggestedPinningOnboardingCell:1];
    [*v15 updateSnapshotAnimatingDifferences:1];
  }
}

- (id)itemIdentifiersForConversations:(id)a3 inSection:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v10 = 138412546;
    long long v19 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v13, a4, v19);
        if (![v14 length])
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_16;
          }
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            unint64_t v25 = a4;
            __int16 v26 = 2112;
            uint64_t v27 = v13;
            _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Conversation has a nil item identifier for section: %ld, conversation: %@", buf, 0x16u);
          }
          goto LABEL_15;
        }
        uint64_t v15 = [v7 count];
        [v7 addObject:v14];
        if (v15 == [v7 count] && IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            unint64_t v25 = (unint64_t)v14;
            __int16 v26 = 2112;
            uint64_t v27 = v13;
            _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Conversation list contains duplicate chat guids. Offending identifier: %@, conversation: %@", buf, 0x16u);
          }
LABEL_15:
        }
LABEL_16:
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }

  int v17 = [v7 array];

  return v17;
}

- (id)itemIdentifierForConversation:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
      id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid section identifier" userInfo:0];
      objc_exception_throw(v11);
    case 2uLL:
      uint64_t v8 = [v6 conversationListCollectionViewPinnedItemIdentifier];
      goto LABEL_10;
    case 4uLL:
      uint64_t v8 = +[CKConversationListNewMessageCollectionViewCell reuseIdentifier];
      goto LABEL_10;
    case 5uLL:
      if ([(CKConversationListCollectionViewController *)self filterMode] == 9) {
        [v7 conversationListCollectionViewJunkItemIdentifier];
      }
      else {
      uint64_t v8 = [v7 conversationListCollectionViewListItemIdentifier];
      }
      goto LABEL_10;
    case 6uLL:
      uint64_t v8 = [v6 conversationListCollectionViewRecentlyDeletedListItemIdentifier];
LABEL_10:
      uint64_t v9 = (void *)v8;
      break;
    default:
      uint64_t v9 = 0;
      break;
  }

  return v9;
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (void)setCompletedDeferredSetup:(BOOL)a3
{
  self->_completedDeferredSetup = a3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CKConversationListFilterModeStringValue([(CKConversationListCollectionViewController *)self filterMode]);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v82 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Filter Mode] conversationlist will appear with filterMode: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v3) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      int64_t v9 = [(CKConversationListCollectionViewController *)self numberOfConversations];
      CKConversationListFilterModeStringValue([(CKConversationListCollectionViewController *)self filterMode]);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [(CKConversationListCollectionViewController *)self collectionView];
      *(_DWORD *)buf = 138413058;
      v82 = v8;
      __int16 v83 = 2048;
      int64_t v84 = v9;
      __int16 v85 = 2112;
      id v86 = v10;
      __int16 v87 = 2112;
      v88 = v11;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "viewWillAppear, animated=%@, numberOfChats:%tu filterMode:%@, collectionView:%@", buf, 0x2Au);
    }
  }
  v79.receiver = self;
  v79.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v79 viewWillAppear:v3];
  [(CKConversationListCollectionViewController *)self setIsAppearing:1];
  id v12 = [(CKConversationListCollectionViewController *)self macToolbarController];
  if (v12)
  {
    int v13 = [(CKConversationListCollectionViewController *)self conformsToProtocol:&unk_1EDF48CA0];

    if (v13)
    {
      uint64_t v14 = [(CKConversationListCollectionViewController *)self macToolbarController];
      [v14 setPrimaryItemProvider:self];

      uint64_t v15 = [(CKConversationListCollectionViewController *)self macToolbarController];
      [v15 setShouldDrawPrimaryBlur:0];
    }
  }
  if (self->_isInitialAppearance)
  {
    v16 = [(CKConversationListCollectionViewController *)self searchController];
    int v17 = [v16 searchBar];

    [v17 setDelegate:self];
    uint64_t v18 = CKFrameworkBundle();
    long long v19 = [v18 localizedStringForKey:@"SEARCH" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v17 setPlaceholder:v19];

    [v17 sizeToFit];
    long long v20 = [(CKConversationListCollectionViewController *)self navigationItem];
    long long v21 = [(CKConversationListCollectionViewController *)self searchController];
    [v20 setSearchController:v21];

    [(CKConversationListCollectionViewController *)self invalidateCellLayout];
    long long v22 = +[CKUIBehavior sharedBehaviors];
    LODWORD(v21) = [v22 conversationListShowsSearchOnAppear];

    if (v21)
    {
      long long v23 = [(CKConversationListCollectionViewController *)self navigationItem];
      [v23 setHidesSearchBarWhenScrolling:0];
    }
    else
    {
      long long v23 = +[CKUIBehavior sharedBehaviors];
      uint64_t v24 = [v23 conversationListHidesSearchBarWhenScrolling];
      unint64_t v25 = [(CKConversationListCollectionViewController *)self navigationItem];
      [v25 setHidesSearchBarWhenScrolling:v24];
    }
    if (!CKIsRunningInMacCatalyst())
    {
      __int16 v26 = +[CKUIBehavior sharedBehaviors];
      uint64_t v27 = [v26 conversationListSearchHidesNavigationBarDuringPresentation];
      v28 = [(CKConversationListCollectionViewController *)self searchController];
      [v28 setHidesNavigationBarDuringPresentation:v27];

      uint64_t v29 = [(CKConversationListCollectionViewController *)self navigationController];
      uint64_t v30 = [v29 navigationBar];
      [v30 setPrefersLargeTitles:1];

      v31 = [(CKConversationListCollectionViewController *)self navigationItem];
      v32 = [(CKConversationListCollectionViewController *)self transparentNavBarAppearance];
      [v31 setScrollEdgeAppearance:v32];
    }
  }
  self->_isVisible = 1;
  uint64_t v33 = [(CKConversationListCollectionViewController *)self splitViewController];
  int v34 = [v33 isCollapsed];

  if (v34)
  {
    if ([(CKConversationListCollectionViewController *)self compositionWasSent])
    {
      v35 = [(CKConversationListCollectionViewController *)self searchController];
      int v36 = [v35 isActive];

      if (v36)
      {
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke;
        v78[3] = &unk_1E5620C40;
        v78[4] = self;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v78];
      }
    }
  }
  [(CKConversationListCollectionViewController *)self setCompositionWasSent:0];
  [(CKConversationListCollectionViewController *)self _endHoldingUpdatesOnViewWillAppear];
  if ([(CKConversationListCollectionViewController *)self isShowingSwipeDeleteConfirmation])
  {
    if (IMOSLoggingEnabled())
    {
      v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "isShowingSwipeDeleteConfirmation is YES on viewWillAppear. This is an unexpected state", buf, 2u);
      }
    }
    [(CKConversationListCollectionViewController *)self setIsShowingSwipeDeleteConfirmation:0];
    [(CKConversationListCollectionViewController *)self updateNavigationItems];
  }
  if (![(CKConversationListCollectionViewController *)self _shouldKeepSelection])
  {
    v38 = [(CKConversationListCollectionViewController *)self lastSelectedConversationItemIdentifier];
    uint64_t v39 = [(CKConversationListCollectionViewController *)self dataSource];
    v40 = [v39 indexPathForItemIdentifier:v38];

    [(CKConversationListCollectionViewController *)self setLastSelectedConversationItemIdentifier:0];
    if (v40)
    {
      if ([v40 section] == 2)
      {
        v41 = [(CKConversationListCollectionViewController *)self collectionView];
        uint64_t v42 = [v41 cellForItemAtIndexPath:v40];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v43 = [(CKConversationListCollectionViewController *)self collectionView];
          v44 = [v43 cellForItemAtIndexPath:v40];

          uint64_t v45 = [v44 pinnedConversationView];
          [v45 setDimmed:0];
        }
        else
        {
          v44 = IMLogHandleForCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[CKConversationListCollectionViewController viewWillAppear:]();
          }
        }
      }
      v46 = [(CKConversationListCollectionViewController *)self collectionView];
      [v46 deselectItemAtIndexPath:v40 animated:0];
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v75 = 0u;
    long long v74 = 0u;
    v47 = [(CKConversationListCollectionViewController *)self collectionView];
    uint64_t v48 = [v47 indexPathsForSelectedItems];

    uint64_t v49 = [v48 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v75 != v50) {
            objc_enumerationMutation(v48);
          }
          v52 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          if (([v52 isEqual:v40] & 1) == 0)
          {
            v53 = [(CKConversationListCollectionViewController *)self collectionView];
            [v53 deselectItemAtIndexPath:v52 animated:v3];

            if ([v52 section] == 2)
            {
              uint64_t v54 = [(CKConversationListCollectionViewController *)self collectionView];
              v55 = [v54 cellForItemAtIndexPath:v52];

              v56 = [v55 pinnedConversationView];
              [v56 setDimmed:0];
            }
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v74 objects:v80 count:16];
      }
      while (v49);
    }
  }
  if (!*((unsigned char *)&self->super.super.super.super.isa + v70)
    && [(CKConversationListCollectionViewController *)self _shouldResizeNavigationBar])
  {
    uint64_t v57 = [(CKConversationListCollectionViewController *)self navigationController];
    v58 = [v57 navigationBar];
    [v58 sizeToFit];
  }
  v59 = [(CKConversationListCollectionViewController *)self tipKitQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_575;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(v59, block);

  uint64_t v60 = [MEMORY[0x1E4F42738] sharedApplication];
  char v61 = [v60 isSuspended];

  if ((v61 & 1) == 0) {
    [(CKConversationListCollectionViewController *)self startTipCellAnimatingIfNecessary];
  }
  v62 = [(CKConversationListCollectionViewController *)self navigationController];
  v63 = [v62 navigationBar];
  uint64_t v64 = +[CKUIBehavior sharedBehaviors];
  v65 = [v64 theme];
  objc_msgSend(v63, "setBarStyle:", objc_msgSend(v65, "navBarStyle"));

  [(CKConversationListCollectionViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(CKConversationListCollectionViewController *)self _updateInsets];
  [(CKConversationListCollectionViewController *)self _updateNavbarLayoutIfNeeded];
  [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:0];
  if (self->_searchResultsController)
  {
    v66 = [(CKConversationListCollectionViewController *)self searchResultsController];
    [v66 viewWillAppear:v3];
  }
  v67 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_2;
  v72[3] = &unk_1E5620C40;
  v72[4] = self;
  [v67 updateRecoverableMessagesMetadataSynchronously:0 completionHandler:v72];

  if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
  {
    [(CKConversationListCollectionViewController *)self recentlyDeletedViewWillAppear:v3];
  }
  else if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    [(CKConversationListCollectionViewController *)self oscarViewWillAppear:v3];
  }
  else
  {
    [(CKConversationListCollectionViewController *)self setEditingMode:0];
  }
  [(CKConversationListCollectionViewController *)self _configureCatalystFiltersNavigation];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_3;
  v71[3] = &unk_1E5620C40;
  v71[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v71);
  uint64_t v68 = [(CKConversationListCollectionViewController *)self navigationController];
  uint64_t v69 = [v68 navigationBar];
  [v69 setTintColor:0];
}

- (void)updateFocusFilterBannerWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:");
  id v5 = +[CKFocusFilterBannerCollectionViewCell itemIdentifier];
  [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v5 animated:v3];
}

- (void)updateContentsOfCellWithItemIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(CKConversationListCollectionViewController *)self dataSource];
  unint64_t v7 = [v6 indexPathForItemIdentifier:v8];
  if (v7) {
    [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v8 indexPath:v7 animated:v4];
  }
}

- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Updating conversation list for reasons: %@ following hold for reason: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  BOOL v12 = [(CKConversationListCollectionViewController *)self _shouldAnimatePinningChangesForUpdateFollowingHoldForReason:v10];
  int v13 = [(CKConversationListCollectionViewController *)self conversationList];
  [v13 resort];

  [(CKConversationListCollectionViewController *)self _updateConversationListsAndSortIfEnabled];
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0];
  [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:v12];
  [(CKConversationListCollectionViewController *)self updateConversationSelectionPreservingLastSelectedItemIdentifier];
  uint64_t v14 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v13) = [v14 showsNoMessagesDialog];

  if (v13) {
    [(CKConversationListCollectionViewController *)self updateNoMessagesDialog];
  }
  [(CKConversationListCollectionViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  [(CKConversationListCollectionViewController *)self _configureCatalystFiltersNavigation];
}

- (void)updateSnapshotAnimatingDifferences:(BOOL)a3
{
}

- (void)_updateConversationListsAndSortIfEnabled
{
  id v2 = [(CKConversationListCollectionViewController *)self conversationList];
  [v2 updateConversationListsAndSortIfEnabled];
}

- (void)updateConversationSelectionPreservingLastSelectedItemIdentifier
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(CKConversationListCollectionViewController *)self _shouldUpdateConversationSelection])
  {
    BOOL v3 = [(CKConversationListCollectionViewController *)self delegate];
    int v4 = [v3 isShowingComposeChatController];

    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        id v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "multi-select: Currently showing compose chat controller. updating selection to compose cell", (uint8_t *)&v30, 2u);
        }
      }
      [(CKConversationListCollectionViewController *)self updateConversationSelectionToNewCompose];
    }
    else
    {
      id v6 = [(CKConversationListCollectionViewController *)self delegate];
      unint64_t v7 = [v6 currentlyShownConversation];

      if (v7)
      {
        if ([(CKConversationListCollectionViewController *)self shouldShowPinnedConversations])
        {
          int v8 = [v7 isPinned];
          if (v8) {
            uint64_t v9 = 2;
          }
          else {
            uint64_t v9 = 5;
          }
        }
        else
        {
          int v8 = 0;
          uint64_t v9 = 5;
        }
        int v13 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v7 inSection:v9];
        if (v13)
        {
          uint64_t v14 = [(CKConversationListCollectionViewController *)self dataSource];
          int v15 = [v14 indexPathForItemIdentifier:v13];

          if (v15)
          {
            id v16 = [(CKConversationListCollectionViewController *)self collectionView];
            __int16 v17 = [v16 indexPathsForSelectedItems];

            LODWORD(v16) = [v17 containsObject:v15];
            int v18 = IMOSLoggingEnabled();
            if (v16)
            {
              if (v18)
              {
                uint64_t v19 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  LOWORD(v30) = 0;
                  _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "multi-select: not updating selection, already selected", (uint8_t *)&v30, 2u);
                }
              }
            }
            else
            {
              if (v18)
              {
                uint64_t v27 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  int v30 = 138412290;
                  v31 = v15;
                  _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "multi-select: selecting item at target indexPath: %@", (uint8_t *)&v30, 0xCu);
                }
              }
              v28 = [(CKConversationListCollectionViewController *)self collectionView];
              [(CKConversationListCollectionViewController *)self _deselectSelectedIndexPathsInCollectionView:v28 animated:0];

              uint64_t v29 = [(CKConversationListCollectionViewController *)self collectionView];
              [v29 selectItemAtIndexPath:v15 animated:0 scrollPosition:0];

              [(CKConversationListCollectionViewController *)self setLastSelectedConversationItemIdentifier:v13];
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              long long v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                long long v22 = [NSNumber numberWithUnsignedInteger:v9];
                int v30 = 138412802;
                v31 = v22;
                __int16 v32 = 2112;
                uint64_t v33 = v7;
                __int16 v34 = 2112;
                v35 = v13;
                _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | multi-select: failed to find indexPath in section: %@ for currentConversation: %@, itemIdentifier: %@, trying opposing section lookup", (uint8_t *)&v30, 0x20u);
              }
            }
            if (v8) {
              uint64_t v23 = 5;
            }
            else {
              uint64_t v23 = 2;
            }
            __int16 v17 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v7 inSection:v23];
            uint64_t v24 = [(CKConversationListCollectionViewController *)self dataSource];
            int v15 = [v24 indexPathForItemIdentifier:v17];

            if (!v15)
            {
              if (IMOSLoggingEnabled())
              {
                unint64_t v25 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  int v30 = 138412546;
                  v31 = v7;
                  __int16 v32 = 2112;
                  uint64_t v33 = v13;
                  _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | multi-select: failed to find indexPath for currentConversation: %@, itemIdentifier: %@, showing selection view controller to gracefully compensate.", (uint8_t *)&v30, 0x16u);
                }
              }
              __int16 v26 = [(CKConversationListCollectionViewController *)self delegate];
              [v26 conversationListFailedToSelectShownConversation];
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            long long v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              int v30 = 138412290;
              v31 = v7;
              _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | multi-select: failed to find itemIdentifier for currentConversation: %@, showing selection view controller to gracefully compensate.", (uint8_t *)&v30, 0xCu);
            }
          }
          int v15 = [(CKConversationListCollectionViewController *)self delegate];
          [v15 conversationListFailedToSelectShownConversation];
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          id v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            id v11 = [(CKConversationListCollectionViewController *)self collectionView];
            BOOL v12 = [v11 indexPathsForSelectedItems];
            int v30 = 138412290;
            v31 = v12;
            _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "multi-select: No currently shown conversation. Updating selected index path delegate. SelectedIndexPaths: %@", (uint8_t *)&v30, 0xCu);
          }
        }
        [(CKConversationListCollectionViewController *)self _updatedSelectedIndexPathCount];
        int v13 = [(CKConversationListCollectionViewController *)self delegate];
        [v13 conversationListFailedToSelectShownConversation];
      }
    }
  }
}

- (BOOL)_shouldUpdateConversationSelection
{
  if ([(CKConversationListCollectionViewController *)self _shouldKeepSelection])
  {
    if ([(CKConversationListCollectionViewController *)self isVisible])
    {
      if ([(CKConversationListCollectionViewController *)self haveAppliedInitialSnapshot])
      {
        BOOL v3 = [(CKConversationListCollectionViewController *)self searchController];
        int v4 = [v3 isActive];

        if (v4)
        {
          id v5 = [(CKConversationListCollectionViewController *)self collectionView];
          [(CKConversationListCollectionViewController *)self _deselectSelectedIndexPathsInCollectionView:v5 animated:0];

          int v6 = IMOSLoggingEnabled();
          LOBYTE(v7) = 0;
          if (v6)
          {
            int v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              __int16 v12 = 0;
              uint64_t v9 = "multi-select: deselecting all indexPaths because searchController is active";
              id v10 = (uint8_t *)&v12;
LABEL_17:
              _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
              goto LABEL_18;
            }
            goto LABEL_18;
          }
        }
        else
        {
          LOBYTE(v7) = 1;
        }
      }
      else
      {
        int v7 = IMOSLoggingEnabled();
        if (v7)
        {
          int v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            uint64_t v9 = "multi-select: Not updating conversation selection because dataSource has not updated before.";
            id v10 = buf;
            goto LABEL_17;
          }
          goto LABEL_18;
        }
      }
    }
    else
    {
      int v7 = IMOSLoggingEnabled();
      if (v7)
      {
        int v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          __int16 v14 = 0;
          uint64_t v9 = "multi-select: Not updating conversation selection because view is not visible";
          id v10 = (uint8_t *)&v14;
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
    int v7 = IMOSLoggingEnabled();
    if (v7)
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        uint64_t v9 = "multi-select: Not updating conversation selection because current configuration does not show selection.";
        id v10 = (uint8_t *)&v15;
        goto LABEL_17;
      }
LABEL_18:

      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)_shouldKeepSelection
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 alwaysShowSelectionInConversationList];

  if (v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v6 = [(CKConversationListCollectionViewController *)self splitViewController];
    if (v6)
    {
      int v7 = [(CKConversationListCollectionViewController *)self splitViewController];
      int v5 = [v7 isCollapsed] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_shouldAnimatePinningChangesForUpdateFollowingHoldForReason:(id)a3
{
  return [a3 isEqualToString:@"viewVisiblity"] ^ 1;
}

- (int64_t)numberOfPinnedConversations
{
  id v2 = [(CKConversationListCollectionViewController *)self pinnedConversations];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)updateSnapshotAnimatingDifferences:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CKConversationListCollectionViewController *)self generateSnapshot];
  [(CKConversationListCollectionViewController *)self applyConversationListSnapshot:v7 animatingDifferences:v4 completion:v6];
}

- (id)generateSnapshot
{
  v46[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  BOOL v4 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
  int v5 = v4;
  unint64_t v6 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "generateSnapshot", "", buf, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F42650]);
  [v7 appendSectionsWithIdentifiers:&unk_1EDF15428];
  int v8 = [MEMORY[0x1E4F6E788] sharedManager];
  int v9 = [v8 shouldDisplayFocusFilterBanner];

  unint64_t v10 = [(CKConversationListCollectionViewController *)self filterMode];
  if (v10 == 7) {
    int v11 = 0;
  }
  else {
    int v11 = v9;
  }
  if (v11 == 1)
  {
    __int16 v12 = +[CKFocusFilterBannerCollectionViewCell itemIdentifier];
    v46[0] = v12;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    [v7 appendItemsWithIdentifiers:v13];
  }
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1EDF15440, spid);
  if ([(CKConversationListCollectionViewController *)self isShowingPinningOnboarding]) {
    [v7 appendItemsWithIdentifiers:&unk_1EDF15458];
  }
  [v7 appendSectionsWithIdentifiers:&unk_1EDF15470];
  if ([(CKConversationListCollectionViewController *)self isShowingPinnedChatDropTarget])
  {
    __int16 v14 = +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier];
    uint64_t v45 = v14;
    __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v7 appendItemsWithIdentifiers:v15];
  }
  id v16 = [(CKConversationListCollectionViewController *)self pinnedConversations];
  __int16 v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  if (-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations")&& [v16 count])
  {
    int v18 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v16 inSection:2];
    [v7 appendItemsWithIdentifiers:v18];
    [v17 addObjectsFromArray:v16];
  }
  [v7 appendSectionsWithIdentifiers:&unk_1EDF15488];
  if ([(CKConversationListCollectionViewController *)self shouldShowTipKitContent])
  {
    uint64_t v19 = [(CKConversationListCollectionViewController *)self tipManager];
    uint64_t v20 = [v19 presentedTip];

    if ((unint64_t)(v20 - 1) <= 4)
    {
      uint64_t v21 = [(__objc2_class *)*(&off_1E5627AF8)[v20 - 1] reuseIdentifier];
      long long v22 = (void *)v21;
      if (v21)
      {
        uint64_t v44 = v21;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
        [v7 appendItemsWithIdentifiers:v23];
      }
    }
  }
  [v7 appendSectionsWithIdentifiers:&unk_1EDF154A0];
  BOOL v24 = [(CKConversationListCollectionViewController *)self shouldShowPendingCell];
  if (IMOSLoggingEnabled())
  {
    unint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v43 = v24;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "snapshot contains new message identifier: %{BOOL}d", buf, 8u);
    }
  }
  if (v24)
  {
    __int16 v26 = +[CKConversationListNewMessageCollectionViewCell reuseIdentifier];
    v41 = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v7 appendItemsWithIdentifiers:v27];
  }
  [v7 appendSectionsWithIdentifiers:&unk_1EDF154B8];
  if ([(CKConversationListCollectionViewController *)self isShowingPinningOnboarding])
  {
    v28 = [(CKConversationListCollectionViewController *)self recommendedPinningConversations];
    uint64_t v29 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v28 inSection:5];
    if (![(CKConversationListCollectionViewController *)self isCurrentlyAnimatingPinningOnboardingSuggestions])
    {
      int v30 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v17 inSection:5];
      uint64_t v31 = [v29 arrayByExcludingObjectsInArray:v30];

      uint64_t v29 = (void *)v31;
    }
    [v7 appendItemsWithIdentifiers:v29];
    [v17 addObjectsFromArray:v28];
  }
  if (v10 == 7)
  {
    [v7 appendSectionsWithIdentifiers:&unk_1EDF154D0];
    [(CKConversationListCollectionViewController *)self _appendRecentlyDeletedIdentifersToSnapshot:v7];
  }
  else
  {
    __int16 v32 = [(CKConversationListCollectionViewController *)self activeConversations];
    uint64_t v33 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v32 inSection:5];
    if ([v33 count])
    {
      __int16 v34 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v17 inSection:5];
      v35 = [v33 arrayByExcludingObjectsInArray:v34];
      [v7 appendItemsWithIdentifiers:v35];
    }
    [v7 appendSectionsWithIdentifiers:&unk_1EDF154D0];
  }
  uint64_t v36 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
  v37 = v36;
  if (v6 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v37, OS_SIGNPOST_INTERVAL_END, spida, "generateSnapshot", "", buf, 2u);
  }

  return v7;
}

- (BOOL)isShowingPinningOnboarding
{
  return self->_isShowingPinningOnboarding;
}

- (id)pinnedConversations
{
  BOOL v3 = [(CKConversationListCollectionViewController *)self shouldShowPinnedConversations];
  id v4 = (id)MEMORY[0x1E4F1CBF0];
  if (v3)
  {
    int v5 = [(CKConversationListCollectionViewController *)self frozenPinnedConversations];
    unint64_t v6 = v5;
    if (v5)
    {
      id v4 = v5;
    }
    else
    {
      id v7 = [(CKConversationListCollectionViewController *)self conversationList];
      int v8 = [v7 pinnedConversations];

      if (v8) {
        int v9 = v8;
      }
      else {
        int v9 = v4;
      }
      id v4 = v9;
    }
  }

  return v4;
}

- (BOOL)shouldShowPinnedConversations
{
  int v3 = [MEMORY[0x1E4F6BD70] processSupportsPinnedConversations];
  if (v3) {
    LOBYTE(v3) = [(CKConversationListCollectionViewController *)self filterMode] < 3;
  }
  return v3;
}

- (NSArray)frozenPinnedConversations
{
  return self->_frozenPinnedConversations;
}

- (id)activeConversations
{
  int v3 = [(CKConversationListCollectionViewController *)self frozenConversations];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unint64_t v6 = [(CKConversationListCollectionViewController *)self filterMode];
    id v7 = [(CKConversationListCollectionViewController *)self conversationList];
    id v5 = [v7 conversationsForFilterMode:v6];
  }

  return v5;
}

- (NSArray)frozenConversations
{
  return self->_frozenConversations;
}

- (BOOL)shouldShowPendingCell
{
  int v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 showPendingInConversationList];

  if (!v4) {
    return 0;
  }
  id v5 = [(CKConversationListCollectionViewController *)self delegate];
  char v6 = [v5 isCollapsed];

  if (v6) {
    return 0;
  }
  id v7 = [(CKConversationListCollectionViewController *)self conversationList];
  int v8 = [v7 pendingConversation];

  if (!v8) {
    return 0;
  }
  if ([(CKConversationListCollectionViewController *)self editingMode]) {
    return CKIsRunningInMacCatalyst() != 0;
  }
  return 1;
}

- (void)applyConversationListSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (![(CKConversationListCollectionViewController *)self isCommitingDiffableDataSourceTransaction])
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __120__CKConversationListCollectionViewController_DataSource__applyConversationListSnapshot_animatingDifferences_completion___block_invoke;
    aBlock[3] = &unk_1E5622688;
    objc_copyWeak(&v45, (id *)buf);
    id v11 = v9;
    id v44 = v11;
    __int16 v12 = (void (**)(void))_Block_copy(aBlock);
    if ([(CKConversationListCollectionViewController *)self isApplyingSnapshot])
    {
      int v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[CKConversationListCollectionViewController(DataSource) applyConversationListSnapshot:animatingDifferences:completion:](v13);
      }

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      __int16 v15 = v14;
      if (v8) {
        [v14 setObject:v8 forKey:@"CKBlockedSnapshotApplicationSnapshotKey"];
      }
      id v16 = [NSNumber numberWithBool:v6];
      [v15 setObject:v16 forKey:@"CKBlockedSnapshotApplicationAnimateDifferencesKey"];

      if (v11)
      {
        __int16 v17 = _Block_copy(v11);
        [v15 setObject:v17 forKey:@"CKBlockedSnapshotApplicationCompletionKey"];
      }
      int v18 = (void *)[v15 copy];
      [(CKConversationListCollectionViewController *)self setBlockedSnapshotInfo:v18];
      goto LABEL_39;
    }
    [(CKConversationListCollectionViewController *)self setIsApplyingSnapshot:1];
    uint64_t v19 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    uint64_t v21 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
    long long v22 = v21;
    os_signpost_id_t spid = v20;
    unint64_t v23 = v20 - 1;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)uint64_t v42 = 0;
      _os_signpost_emit_with_name_impl(&dword_18EF18000, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "applySnapshot", "", v42, 2u);
    }

    if ([(CKConversationListCollectionViewController *)self haveAppliedInitialSnapshot])
    {
      BOOL v24 = [(CKConversationListCollectionViewController *)self dataSource];
      unint64_t v25 = [v24 snapshot];
      int v26 = [v25 isEqual:v8];

      if (v26)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v42 = 0;
            _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Skipping application of snapshot update with no changes", v42, 2u);
          }
        }
        if (v12) {
          v12[2](v12);
        }
        goto LABEL_32;
      }
      uint64_t v29 = [(CKConversationListCollectionViewController *)self dataSource];
      [v29 applySnapshot:v8 animatingDifferences:v6 completion:v12];
    }
    else
    {
      [(CKConversationListCollectionViewController *)self setHaveAppliedInitialSnapshot:1];
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Applying initial snapshot", v42, 2u);
        }
      }
      uint64_t v29 = [(CKConversationListCollectionViewController *)self dataSource];
      [v29 applySnapshot:v8 animatingDifferences:0 completion:v12];
    }

LABEL_32:
    int v30 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
    uint64_t v31 = v30;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)uint64_t v42 = 0;
      _os_signpost_emit_with_name_impl(&dword_18EF18000, v31, OS_SIGNPOST_INTERVAL_END, spid, "applySnapshot", "", v42, 2u);
    }

    [(CKConversationListCollectionViewController *)self setIsApplyingSnapshot:0];
    __int16 v32 = [(CKConversationListCollectionViewController *)self blockedSnapshotInfo];

    if (v32)
    {
      uint64_t v33 = [(CKConversationListCollectionViewController *)self blockedSnapshotInfo];
      __int16 v34 = [v33 objectForKey:@"CKBlockedSnapshotApplicationSnapshotKey"];

      v35 = [(CKConversationListCollectionViewController *)self blockedSnapshotInfo];
      uint64_t v36 = [v35 objectForKey:@"CKBlockedSnapshotApplicationAnimateDifferencesKey"];
      uint64_t v37 = [v36 BOOLValue];

      v38 = [(CKConversationListCollectionViewController *)self blockedSnapshotInfo];
      uint64_t v39 = [v38 objectForKey:@"CKBlockedSnapshotApplicationCompletionKey"];

      [(CKConversationListCollectionViewController *)self setBlockedSnapshotInfo:0];
      [(CKConversationListCollectionViewController *)self applyConversationListSnapshot:v34 animatingDifferences:v37 completion:v39];
    }
    if ([(CKConversationListCollectionViewController *)self filterMode] != 7) {
      goto LABEL_40;
    }
    __int16 v15 = [(CKConversationListCollectionViewController *)self delegate];
    int v18 = [(CKConversationListCollectionViewController *)self collectionView];
    v40 = [v18 indexPathsForSelectedItems];
    objc_msgSend(v15, "conversationListUpdatedSelectedIndexPathCount:", objc_msgSend(v40, "count"));

LABEL_39:
LABEL_40:

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Skipping application of snapshot update while we are commiting a diffable data source transaction", buf, 2u);
    }
  }
LABEL_41:
}

- (void)setIsApplyingSnapshot:(BOOL)a3
{
  self->_isApplyingSnapshot = a3;
}

- (BOOL)shouldShowTipKitContent
{
  int64_t v3 = [(CKConversationListTipManager *)self->_tipManager presentedTip];
  if (v3)
  {
    if ([(CKConversationListCollectionViewController *)self editingMode])
    {
LABEL_3:
      LOBYTE(v3) = 0;
      return v3;
    }
    if ([(CKConversationListTipManager *)self->_tipManager presentedTip] != 2)
    {
LABEL_9:
      LOBYTE(v3) = 1;
      return v3;
    }
    LODWORD(v3) = [(CKConversationListCollectionViewController *)self shouldShowPinnedConversations];
    if (v3)
    {
      LODWORD(v3) = [(CKConversationListCollectionViewController *)self canShowSuggestedPinningOnboardingCell];
      if (v3)
      {
        int v4 = [(CKConversationListCollectionViewController *)self recommendedPinningConversations];
        unint64_t v5 = [v4 count];

        if (v5 < 3
          || [(CKConversationListCollectionViewController *)self numberOfPinnedConversations] > 0)
        {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  return v3;
}

- (BOOL)isShowingPinnedChatDropTarget
{
  return self->_isShowingPinnedChatDropTarget;
}

- (BOOL)isCommitingDiffableDataSourceTransaction
{
  return self->_isCommitingDiffableDataSourceTransaction;
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

- (BOOL)haveAppliedInitialSnapshot
{
  return self->_haveAppliedInitialSnapshot;
}

- (NSDictionary)blockedSnapshotInfo
{
  return self->_blockedSnapshotInfo;
}

- (void)updateContentsOfAllCellsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "updateContentsOfAllCells", "", buf, 2u);
  }

  id v9 = [(CKConversationListCollectionViewController *)self collectionView];
  unint64_t v10 = [v9 indexPathsForVisibleItems];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        -[CKConversationListCollectionViewController updateContentsOfCellWithIndexPath:animated:](self, "updateContentsOfCellWithIndexPath:animated:", *(void *)(*((void *)&v18 + 1) + 8 * i), v3, (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }

  id v16 = [(CKConversationListCollectionViewController *)self conversationListCollectionViewControllerLogHandle];
  __int16 v17 = v16;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v17, OS_SIGNPOST_INTERVAL_END, v6, "updateContentsOfAllCells", "", buf, 2u);
  }
}

- (OS_os_log)conversationListCollectionViewControllerLogHandle
{
  id v2 = objc_opt_class();

  return (OS_os_log *)[v2 conversationListCollectionViewControllerLogHandle];
}

+ (id)conversationListCollectionViewControllerLogHandle
{
  if (conversationListCollectionViewControllerLogHandle_onceToken != -1) {
    dispatch_once(&conversationListCollectionViewControllerLogHandle_onceToken, &__block_literal_global_905);
  }
  id v2 = (void *)conversationListCollectionViewControllerLogHandle_sLogHandle;

  return v2;
}

uint64_t __120__CKConversationListCollectionViewController_DataSource__applyConversationListSnapshot_animatingDifferences_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_ck_setNeedsUpdateOfMultitaskingDragExclusionRects");

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    int v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_ck_setNeedsUpdateOfMultitaskingDragExclusionRects
{
  if (objc_opt_respondsToSelector())
  {
    [(CKConversationListCollectionViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
  }
}

- (OS_dispatch_queue)tipKitQueue
{
  tipKitQueue = self->_tipKitQueue;
  if (!tipKitQueue)
  {
    int v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.messages.chatkit.tipkit", 0);
    unint64_t v5 = self->_tipKitQueue;
    self->_tipKitQueue = v4;

    tipKitQueue = self->_tipKitQueue;
  }

  return tipKitQueue;
}

- (void)startTipCellAnimatingIfNecessary
{
  BOOL v3 = [(CKConversationListCollectionViewController *)self dataSource];
  int v4 = +[CKTipKitOnboardingCollectionViewCell reuseIdentifier];
  id v7 = [v3 indexPathForItemIdentifier:v4];

  unint64_t v5 = [(CKConversationListCollectionViewController *)self collectionView];
  os_signpost_id_t v6 = [v5 cellForItemAtIndexPath:v7];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(CKConversationListCollectionViewController *)self isVisible]) {
    [v6 willDisplayCell];
  }
}

- (void)setLastSelectedConversationItemIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lastSelectedConversationItemIdentifier = &self->_lastSelectedConversationItemIdentifier;
  if (![(NSString *)self->_lastSelectedConversationItemIdentifier isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_lastSelectedConversationItemIdentifier, a3);
    if ([(NSString *)*p_lastSelectedConversationItemIdentifier length]
      && ![(CKConversationListCollectionViewController *)self _isRunningPPT])
    {
      id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v7 setObject:*p_lastSelectedConversationItemIdentifier forKey:@"CKLastSelectedItemIdentifier" inDomain:@"com.apple.MobileSMS"];
    }
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "multi-select: set last selected conversation item identifier: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)setHaveAppliedInitialSnapshot:(BOOL)a3
{
  self->_haveAppliedInitialSnapshot = a3;
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setEditingMode:(unint64_t)a3
{
}

- (void)setCompositionWasSent:(BOOL)a3
{
  self->_compositionWasSent = a3;
}

- (CKMacToolbarController)macToolbarController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_macToolbarController);

  return (CKMacToolbarController *)WeakRetained;
}

- (NSString)lastSelectedConversationItemIdentifier
{
  return self->_lastSelectedConversationItemIdentifier;
}

- (BOOL)isShowingSwipeDeleteConfirmation
{
  return self->_isShowingSwipeDeleteConfirmation;
}

- (BOOL)compositionWasSent
{
  return self->_compositionWasSent;
}

- (int64_t)preferredStatusBarStyle
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  BOOL v3 = [v2 theme];
  int64_t v4 = [v3 statusBarStyle];

  return v4;
}

- (void)updateNavigationItems
{
  id v3 = [(CKConversationListCollectionViewController *)self navigationItem];
  if (!CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests()) {
    [(CKConversationListCollectionViewController *)self _configureNavbarButtonsForNavigationItem:v3];
  }
  [(CKConversationListCollectionViewController *)self _updateSearchControllerForConversationListBelowMacSnapWidth:[(CKConversationListCollectionViewController *)self isBelowMacSnapToMinWidth]];
}

- (BOOL)isBelowMacSnapToMinWidth
{
  return self->_isBelowMacSnapToMinWidth;
}

- (void)_updateSearchControllerForConversationListBelowMacSnapWidth:(BOOL)a3
{
  BOOL v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    id v5 = [(CKConversationListCollectionViewController *)self searchController];
    os_signpost_id_t v6 = [v5 searchBar];
    objc_msgSend(v6, "setHidden:", -[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth"));

    if (!v3) {
      return;
    }
    id v10 = [(CKConversationListCollectionViewController *)self navigationItem];
    [v10 setSearchController:0];
  }
  else
  {
    if (self->_isInitialAppearance) {
      return;
    }
    id v7 = [(CKConversationListCollectionViewController *)self navigationItem];
    id v8 = [v7 searchController];

    if (v8) {
      return;
    }
    id v10 = [(CKConversationListCollectionViewController *)self navigationItem];
    int v9 = [(CKConversationListCollectionViewController *)self searchController];
    [v10 setSearchController:v9];
  }
}

- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3
{
}

- (void)_setPinnedConversationViewLayoutStyle:(int64_t)a3 shouldInvalidateLayout:(BOOL)a4
{
  if (self->_pinnedConversationViewLayoutStyle != a3)
  {
    BOOL v4 = a4;
    self->_pinnedConversationViewLayoutStyle = a3;
    [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:0];
    if (v4)
    {
      id v7 = [(CKConversationListCollectionViewController *)self collectionView];
      os_signpost_id_t v6 = [v7 collectionViewLayout];
      [v6 invalidateLayout];
    }
  }
}

void __95__CKConversationListCollectionViewController_registerForCloudKitEventsWithDelayedRegistration___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 integerForKey:@"cloudkit-sync-ui-tests"];

  if (v1 >= 1)
  {
    registerForCloudKitEventsWithDelayedRegistration__sRegistrationDelay = 0x3FF0000000000000;
    if (IMOSLoggingEnabled())
    {
      id v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v3 = 134218240;
        uint64_t v4 = 0x3FF0000000000000;
        __int16 v5 = 2048;
        uint64_t v6 = 0x4014000000000000;
        _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "registration delay artificially set to %f from %f for runtime tests only", (uint8_t *)&v3, 0x16u);
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)viewSafeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v5 viewSafeAreaInsetsDidChange];
  int v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = objc_msgSend(v3, "conversationListShouldManuallyApplyBottomSafeAreaInsetForIsRecentlyDeletedModal:", -[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal"));

  if (v4) {
    [(CKConversationListCollectionViewController *)self _updateInsets];
  }
}

- (void)_updateInsets
{
  if (!self->_willRotate)
  {
    id v40 = [MEMORY[0x1E4F42C68] sharedInstance];
    char v3 = [v40 isUndocked];
    int v4 = [(CKConversationListCollectionViewController *)self collectionView];
    [v4 contentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    uint64_t v11 = [(CKConversationListCollectionViewController *)self delegate];
    char v12 = [v11 isCollapsed];

    double v13 = 0.0;
    if ((v12 & 1) == 0 && (v3 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      __int16 v15 = [WeakRetained chatController];

      [v15 accessoryViewHeight];
      double v13 = -v16;
    }
    __int16 v17 = +[CKUIBehavior sharedBehaviors];
    int v18 = objc_msgSend(v17, "conversationListShouldManuallyApplyBottomSafeAreaInsetForIsRecentlyDeletedModal:", -[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal"));

    if (v18)
    {
      long long v19 = [(CKConversationListCollectionViewController *)self view];
      [v19 safeAreaInsets];
      double v13 = v20;
    }
    [(CKConversationListCollectionViewController *)self bannerHeight];
    double v22 = v21;
    unint64_t v23 = [(CKConversationListCollectionViewController *)self syncStatusView];
    int v24 = [v23 isVisibleInViewHierarchy];

    double v25 = v13;
    if (v24)
    {
      int v26 = [(CKConversationListCollectionViewController *)self view];
      [v26 bounds];
      double v28 = v27;
      uint64_t v29 = +[CKUIBehavior sharedBehaviors];
      [v29 syncBarFooterHeight];
      double v31 = v30;

      __int16 v32 = [(CKConversationListCollectionViewController *)self syncStatusView];
      objc_msgSend(v32, "systemLayoutSizeFittingSize:", v28, v31);
      double v34 = v33;

      v35 = [(CKConversationListCollectionViewController *)self syncStatusView];
      [v35 safeAreaInsets];
      double v37 = v36;

      double v25 = v13 + v34 - v37;
    }
    v38 = [(CKConversationListCollectionViewController *)self collectionView];
    objc_msgSend(v38, "setContentInset:", v22, v8, v25, v10);

    uint64_t v39 = [(CKConversationListCollectionViewController *)self collectionView];
    objc_msgSend(v39, "setScrollIndicatorInsets:", v6, v8, v13, v10);
  }
}

- (CKCloudSyncStatusView)syncStatusView
{
  return self->_syncStatusView;
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v3 viewLayoutMarginsDidChange];
  [(CKConversationListCollectionViewController *)self _updateNavbarLayoutIfNeeded];
}

- (void)invalidateCellLayout
{
  objc_super v3 = [(CKConversationListCollectionViewController *)self junkCellLayout];
  [v3 invalidate];

  BOOL v4 = [(CKConversationListCollectionViewController *)self _cellsShouldShowChevron];
  double v5 = [(CKConversationListCollectionViewController *)self junkCellLayout];
  [v5 setShouldShowChevron:v4];

  double v6 = [(CKConversationListCollectionViewController *)self collectionView];
  [v6 bounds];
  double Width = CGRectGetWidth(v19);
  double v8 = [(CKConversationListCollectionViewController *)self junkCellLayout];
  [v8 setTableViewWidth:Width];

  double v9 = [(CKConversationListCollectionViewController *)self standardCellLayout];
  [v9 invalidate];

  BOOL v10 = [(CKConversationListCollectionViewController *)self _cellsShouldShowChevron];
  uint64_t v11 = [(CKConversationListCollectionViewController *)self standardCellLayout];
  [v11 setShouldShowChevron:v10];

  char v12 = [(CKConversationListCollectionViewController *)self collectionView];
  [v12 bounds];
  double v13 = CGRectGetWidth(v20);
  uint64_t v14 = [(CKConversationListCollectionViewController *)self standardCellLayout];
  [v14 setTableViewWidth:v13];

  __int16 v15 = [(CKConversationListCollectionViewController *)self conversationLayout];
  [v15 updatePinnedConversationViewLayoutStyle];

  [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:0];
  id v17 = [(CKConversationListCollectionViewController *)self collectionView];
  double v16 = [v17 collectionViewLayout];
  [v16 invalidateLayout];
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v19 viewDidLayoutSubviews];
  objc_super v3 = [(CKConversationListCollectionViewController *)self cellLayout];
  [v3 tableViewWidth];
  double v5 = v4;

  double v6 = [(CKConversationListCollectionViewController *)self collectionView];
  [v6 bounds];
  double v8 = v7;

  double v9 = [(CKConversationListCollectionViewController *)self cellLayout];
  int v10 = [v9 shouldShowChevron];
  int v11 = [(CKConversationListCollectionViewController *)self _cellsShouldShowChevron];

  if (!self->_isInitialAppearance && (vabdd_f64(v5, v8) >= 0.1 || v10 != v11)) {
    [(CKConversationListCollectionViewController *)self invalidateCellLayout];
  }
  if (CKIsRunningInMacCatalyst())
  {
    double v13 = [(CKConversationListCollectionViewController *)self view];
    [v13 frame];
    double v15 = v14;

    double v16 = +[CKUIBehavior sharedBehaviors];
    [v16 snapToMinConversationListWidth];
    [(CKConversationListCollectionViewController *)self setIsBelowMacSnapToMinWidth:v15 < v17];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CKConversationListCollectionViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (viewDidLayoutSubviews_showConversationIfNecessaryToken != -1) {
    dispatch_once(&viewDidLayoutSubviews_showConversationIfNecessaryToken, block);
  }
  [(CKConversationListCollectionViewController *)self _updateNavbarLayoutIfNeeded];
}

- (BOOL)_cellsShouldShowChevron
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained isCollapsed];

  return v3;
}

- (void)_updateNavbarLayoutIfNeeded
{
  if (CKIsRunningInMacCatalyst())
  {
    [(CKConversationListCollectionViewController *)self _macosUpdateNavbarLayoutIfNeeded];
  }
  else
  {
    [(CKConversationListCollectionViewController *)self _iosUpdateNavbarLayoutIfNeeded];
  }
}

- (CKConversationListCellLayout)junkCellLayout
{
  junkCellLayout = self->_junkCellLayout;
  if (!junkCellLayout)
  {
    double v4 = (CKConversationListCellLayout *)objc_opt_new();
    double v5 = self->_junkCellLayout;
    self->_junkCellLayout = v4;

    junkCellLayout = self->_junkCellLayout;
  }

  return junkCellLayout;
}

- (CKConversationListCollectionViewLayout)conversationLayout
{
  return self->_conversationLayout;
}

- (void)_configureNavbarButtonsForNavigationItem:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "setHidesBackButton:", -[CKConversationListCollectionViewController _hidesBackButton](self, "_hidesBackButton"));
  double v5 = +[CKUIBehavior sharedBehaviors];
  char v6 = [v5 supportsConversationListEditing];

  if (v6)
  {
    BOOL v7 = [(CKConversationListCollectionViewController *)self _shouldShowInboxView];
    unint64_t v8 = [(CKConversationListCollectionViewController *)self editingMode];
    switch(v8)
    {
      case 2uLL:
        if ([(CKConversationListCollectionViewController *)self isShowingPinningOnboarding])
        {
          double v15 = [(CKConversationListCollectionViewController *)self cancelButtonItem];
          double v28 = v15;
          int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];

          int v11 = [(CKConversationListCollectionViewController *)self doneButtonItem];
          double v27 = v11;
          char v12 = (void *)MEMORY[0x1E4F1C978];
          double v13 = &v27;
          goto LABEL_30;
        }
        uint64_t v19 = [(CKConversationListCollectionViewController *)self doneButtonItem];
        int v11 = (void *)v19;
        if (v7)
        {
          uint64_t v25 = v19;
          double v17 = (void *)MEMORY[0x1E4F1C978];
          int v18 = &v25;
          goto LABEL_18;
        }
        uint64_t v26 = v19;
        double v21 = (void *)MEMORY[0x1E4F1C978];
        double v22 = &v26;
        break;
      case 1uLL:
        if ([(CKConversationListCollectionViewController *)self shouldShowPinnedConversations])
        {
          uint64_t v16 = [(CKConversationListCollectionViewController *)self doneButtonItem];
          int v11 = (void *)v16;
          if (v7)
          {
            uint64_t v33 = v16;
            double v17 = (void *)MEMORY[0x1E4F1C978];
            int v18 = &v33;
            goto LABEL_18;
          }
          uint64_t v34 = v16;
          double v21 = (void *)MEMORY[0x1E4F1C978];
          double v22 = &v34;
        }
        else
        {
          if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
          {
            if (![(CKConversationListCollectionViewController *)self isRecentlyDeletedModal]) {
              goto LABEL_19;
            }
            int v11 = [(CKConversationListCollectionViewController *)self closeButtonItem];
            __int16 v32 = v11;
            double v17 = (void *)MEMORY[0x1E4F1C978];
            int v18 = (uint64_t *)&v32;
LABEL_18:
            double v14 = objc_msgSend(v17, "arrayWithObjects:count:", v18, 1, v25);
LABEL_22:
            int v10 = 0;
LABEL_31:

            goto LABEL_32;
          }
          if (![(CKConversationListCollectionViewController *)self isOscarModal])
          {
            int v24 = [(CKConversationListCollectionViewController *)self selectAllButtonItem];
            double v30 = v24;
            int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];

            int v11 = [(CKConversationListCollectionViewController *)self doneButtonItem];
            uint64_t v29 = v11;
            char v12 = (void *)MEMORY[0x1E4F1C978];
            double v13 = &v29;
            goto LABEL_30;
          }
          int v11 = [(CKConversationListCollectionViewController *)self doneButtonItem];
          double v31 = v11;
          double v21 = (void *)MEMORY[0x1E4F1C978];
          double v22 = (uint64_t *)&v31;
        }
        break;
      case 0uLL:
        if ([(CKConversationListCollectionViewController *)self isOscarModal])
        {
          double v9 = [(CKConversationListCollectionViewController *)self editOscarButtonItem];
          uint64_t v39 = v9;
          int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];

          int v11 = [(CKConversationListCollectionViewController *)self closeButtonItem];
          v38 = v11;
          char v12 = (void *)MEMORY[0x1E4F1C978];
          double v13 = &v38;
LABEL_30:
          double v14 = [v12 arrayWithObjects:v13 count:1];
          goto LABEL_31;
        }
        if (!v7)
        {
          unint64_t v23 = [(CKConversationListCollectionViewController *)self editButtonItem];
          double v36 = v23;
          int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];

          int v11 = [(CKConversationListCollectionViewController *)self composeButtonItem];
          v35 = v11;
          char v12 = (void *)MEMORY[0x1E4F1C978];
          double v13 = &v35;
          goto LABEL_30;
        }
        int v11 = [(CKConversationListCollectionViewController *)self composeButtonItem];
        v37[0] = v11;
        CGRect v20 = [(CKConversationListCollectionViewController *)self optionsButtonItem];
        v37[1] = v20;
        double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];

        goto LABEL_22;
      default:
LABEL_19:
        int v10 = 0;
        double v14 = 0;
LABEL_32:
        [v4 setLeftBarButtonItems:v10 animated:1];
        goto LABEL_33;
    }
    int v10 = [v21 arrayWithObjects:v22 count:1];
    double v14 = 0;
    goto LABEL_31;
  }
  [v4 setLeftBarButtonItems:0 animated:1];
  int v10 = [(CKConversationListCollectionViewController *)self composeButtonItem];
  v40[0] = v10;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
LABEL_33:
  [v4 setRightBarButtonItems:v14 animated:1];
}

- (void)_iosUpdateNavbarLayoutIfNeeded
{
  char v3 = [(CKConversationListCollectionViewController *)self view];
  uint64_t v4 = [v3 _shouldReverseLayoutDirection];

  double v5 = +[CKUIBehavior sharedBehaviors];
  char v6 = [(CKConversationListCollectionViewController *)self view];
  [v6 layoutMargins];
  objc_msgSend(v5, "contentInsetsForConversationListSearchBarForLayoutMargins:isRTL:", v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = +[CKUIBehavior sharedBehaviors];
  uint64_t v16 = [v15 contentRectEdgeForConversationListSearchBarInsetsWithRTL:v4];

  id v18 = [(CKConversationListCollectionViewController *)self searchController];
  double v17 = [v18 searchBar];
  objc_msgSend(v17, "_setOverrideContentInsets:forRectEdges:", v16, v8, v10, v12, v14);
}

- (UISearchController)searchController
{
  if ([(CKConversationListCollectionViewController *)self isRecentlyDeletedModal]
    || [(CKConversationListCollectionViewController *)self isOscarModal])
  {
    char v3 = 0;
  }
  else
  {
    searchController = self->_searchController;
    if (!searchController)
    {
      double v5 = [(CKConversationListCollectionViewController *)self searchResultsController];
      int v6 = CKIsRunningInMacCatalyst();
      double v7 = (Class *)0x1E4F42DC0;
      if (v6) {
        double v7 = (Class *)off_1E561DD68;
      }
      double v8 = (UISearchController *)[objc_alloc(*v7) initWithSearchResultsController:v5];
      [(UISearchController *)v8 setSearchResultsUpdater:v5];
      [(UISearchController *)v8 setDelegate:self];
      double v9 = [(UISearchController *)v8 searchBar];
      double v10 = +[CKUIBehavior sharedBehaviors];
      double v11 = [v10 theme];
      objc_msgSend(v9, "setBarStyle:", objc_msgSend(v11, "defaultBarStyle"));

      double v12 = [(UISearchController *)v8 searchBar];
      double v13 = +[CKUIBehavior sharedBehaviors];
      double v14 = [v13 theme];
      objc_msgSend(v12, "setKeyboardAppearance:", objc_msgSend(v14, "keyboardAppearance"));

      double v15 = +[CKUIBehavior sharedBehaviors];
      -[UISearchController setObscuresBackgroundDuringPresentation:](v8, "setObscuresBackgroundDuringPresentation:", [v15 searchControllerObscuresConversationList]);

      uint64_t v16 = self->_searchController;
      self->_searchController = v8;

      searchController = self->_searchController;
    }
    char v3 = searchController;
  }

  return v3;
}

- (BOOL)isOscarModal
{
  return self->_oscarModal;
}

- (BOOL)isRecentlyDeletedModal
{
  return self->_recentlyDeletedModal;
}

- (UIBarButtonItem)editButtonItem
{
  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    uint64_t v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:2 primaryAction:0];
    double v5 = self->_editButtonItem;
    self->_editButtonItem = v4;

    [(UIBarButtonItem *)self->_editButtonItem setAccessibilityIdentifier:@"optionsButton"];
    BOOL v6 = [(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession];
    editButtonItem = self->_editButtonItem;
    if (!v6)
    {
      [(UIBarButtonItem *)editButtonItem setSpringLoaded:1];
      id location = 0;
      objc_initWeak(&location, self);
      double v7 = self->_editButtonItem;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      double v11 = __60__CKConversationListCollectionViewController_editButtonItem__block_invoke;
      double v12 = &unk_1E5629DA8;
      objc_copyWeak(&v13, &location);
      [(UIBarButtonItem *)v7 _setSecondaryActionsProvider:&v9];
      -[UIBarButtonItem setSecondaryActionsArePrimary:](self->_editButtonItem, "setSecondaryActionsArePrimary:", 1, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      editButtonItem = self->_editButtonItem;
    }
  }

  return editButtonItem;
}

- (UIBarButtonItem)composeButtonItem
{
  composeButtonItem = self->_composeButtonItem;
  if (!composeButtonItem)
  {
    uint64_t v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.and.pencil"];
    double v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithImage:v4 style:0 target:self action:sel_composeButtonClicked_];
    BOOL v6 = self->_composeButtonItem;
    self->_composeButtonItem = v5;

    [(UIBarButtonItem *)self->_composeButtonItem setAccessibilityIdentifier:@"composeButton"];
    if (CKIsRunningInMacCatalyst())
    {
      double v7 = [MEMORY[0x1E4F428B8] labelColor];
      [(UIBarButtonItem *)self->_composeButtonItem setTintColor:v7];
    }
    [(UIBarButtonItem *)self->_composeButtonItem setSpringLoaded:1];

    composeButtonItem = self->_composeButtonItem;
  }

  return composeButtonItem;
}

- (BOOL)_hidesBackButton
{
  if ([(CKConversationListCollectionViewController *)self _shouldShowInboxView])
  {
    unint64_t v3 = [(CKConversationListCollectionViewController *)self editingMode];
    if (v3) {
      LOBYTE(v3) = [(CKConversationListCollectionViewController *)self filterMode] != 7;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_shouldShowInboxView
{
  return CKShouldShowInboxView() != 0;
}

- (BOOL)hasActivePinnedConversationDropSession
{
  return self->_hasActivePinnedConversationDropSession;
}

- (CKSearchViewController)searchResultsController
{
  searchResultsController = self->_searchResultsController;
  if (!searchResultsController)
  {
    uint64_t v4 = [CKSearchViewController alloc];
    double v5 = +[CKSpotlightQueryUtilities defaultSearchControllers];
    BOOL v6 = [(CKSearchViewController *)v4 initWithSearchControllerClasses:v5];

    [(CKSearchViewController *)v6 setDelegate:self];
    double v7 = self->_searchResultsController;
    self->_searchResultsController = v6;

    searchResultsController = self->_searchResultsController;
  }

  return searchResultsController;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v14 traitCollectionDidChange:v4];
  [v4 displayScale];
  double v6 = v5;
  double v7 = [(CKConversationListCollectionViewController *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  if (v6 != v9) {
    [(CKConversationListCollectionViewController *)self invalidateCellLayout];
  }
  uint64_t v10 = [v4 userInterfaceStyle];
  double v11 = [(CKConversationListCollectionViewController *)self traitCollection];
  uint64_t v12 = [v11 userInterfaceStyle];

  if (v10 != v12)
  {
    id v13 = +[CKDualSIMUtilities sharedUtilities];
    [v13 updateConversationListSIMLabelImagesDictionary];
  }
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v8 viewWillLayoutSubviews];
  if (CKIsRunningInMacCatalyst())
  {
    unint64_t v3 = [(CKConversationListCollectionViewController *)self view];
    [v3 frame];
    double v5 = v4;

    double v6 = +[CKUIBehavior sharedBehaviors];
    [v6 snapToMinConversationListWidth];
    [(CKConversationListCollectionViewController *)self setIsBelowMacSnapToMinWidth:v5 < v7];
  }
}

uint64_t __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_575(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1504) conversationListControllerDidAppear];
}

- (void)performResumeDeferredSetup
{
  if ([(CKConversationListCollectionViewController *)self shouldUseFastPreviewText])
  {
    [(CKConversationListCollectionViewController *)self setShouldUseFastPreviewText:0];
    [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:0];
  }
  [(CKConversationListCollectionViewController *)self updateSyncProgressIfNeeded];
  unint64_t v3 = [MEMORY[0x1E4F6BC48] sharedInstance];
  char v4 = [v3 isStewieActive];

  if ((v4 & 1) == 0)
  {
    double v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
    [v5 presentSatelliteConnectionBannerIfNecessaryWithChat:0 withReason:@"AppResume" ignoreTimerLimit:0];
  }

  [(CKConversationListCollectionViewController *)self setCompletedDeferredSetup:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(32);
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v6 = @"NO";
      if (v3) {
        double v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      double v31 = (const char *)v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "viewDidAppear, animated=%@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    double v7 = @"NO";
    if (v3) {
      double v7 = @"YES";
    }
    uint64_t v25 = v7;
    _CKLog();
  }
  v29.receiver = self;
  v29.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewDidAppear:](&v29, sel_viewDidAppear_, v3, v25);
  objc_super v8 = [(CKConversationListCollectionViewController *)self collectionView];
  [v8 flashScrollIndicators];

  double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
  [v9 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
  if (__CurrentTestName
    && ([(id)__CurrentTestName rangeOfString:@"ShowMessages"] != 0x7FFFFFFFFFFFFFFFLL
     || ([(id)__CurrentTestName isEqualToString:@"ScrollTranscript"] & 1) != 0
     || ([(id)__CurrentTestName isEqualToString:@"ScrollTranscriptWebView"] & 1) != 0
     || ([(id)__CurrentTestName isEqualToString:@"ScrollTranscriptEmoji"] & 1) != 0
     || [(id)__CurrentTestName isEqualToString:@"ScrollTranscriptFullScreen"]))
  {
    uint64_t v10 = (id *)MEMORY[0x1E4F43630];
    if (objc_opt_respondsToSelector()) {
      [*v10 didShowTranscriptList];
    }
  }
  double v11 = +[CKUIBehavior sharedBehaviors];
  uint64_t v12 = [v11 conversationListHidesSearchBarWhenScrolling];
  id v13 = [(CKConversationListCollectionViewController *)self navigationItem];
  [v13 setHidesSearchBarWhenScrolling:v12];

  [(CKConversationListCollectionViewController *)self setIsAppearing:0];
  [(CKConversationListCollectionViewController *)self updateSyncProgressIfNeeded];
  [(CKConversationListCollectionViewController *)self updateBannerVisualEffectGroup];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_super v14 = [(CKConversationListCollectionViewController *)self deferredSearchQuery];

  if (v14)
  {
    double v15 = [(CKConversationListCollectionViewController *)self deferredSearchQuery];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke_2;
    v26[3] = &unk_1E5620C40;
    id v27 = v15;
    id v16 = v15;
    [(CKConversationListCollectionViewController *)self performSearch:v16 completion:v26];
    [(CKConversationListCollectionViewController *)self setDeferredSearchQuery:0];
  }
  if (IMOSLoggingEnabled())
  {
    double v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [MEMORY[0x1E4F43058] keyWindow];
      uint64_t v19 = [MEMORY[0x1E4F43058] keyWindow];
      CGRect v20 = [v19 firstResponder];
      double v21 = [MEMORY[0x1E4F43058] keyWindow];
      double v22 = [v21 firstResponder];
      int v23 = [v22 _isPinningInputViews];
      int v24 = @"NO";
      *(_DWORD *)buf = 136315906;
      double v31 = "-[CKConversationListCollectionViewController viewDidAppear:]";
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      if (v23) {
        int v24 = @"YES";
      }
      __int16 v34 = 2112;
      v35 = v20;
      __int16 v36 = 2112;
      double v37 = v24;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "[%s] Is UIWindow.keyWindow: %@, firstResponder: %@, pinning input views: %@", buf, 0x2Au);
    }
  }
}

- (void)updateSyncProgressIfNeeded
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "-updateSyncProgressIfNeeded invoked in response to a change to the view or event lifecycle.", v4, 2u);
    }
  }
  BOOL v3 = [MEMORY[0x1E4F6BC60] sharedInstance];
  [v3 fetchSyncState];
}

- (void)viewDidAppearDeferredSetup
{
  self->_isInitialAppearance = 0;
  [(CKConversationListCollectionViewController *)self setIsAppearing:0];
  if (CKIsRunningInMessages())
  {
    dispatch_time_t v3 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
  char v4 = [MEMORY[0x1E4F42738] sharedApplication];
  double v5 = v4;
  if (!__CurrentTestName) {
    goto LABEL_6;
  }
  double v6 = [v4 _launchTestName];
  if (![v5 isRunningTest:v6])
  {
LABEL_7:

    goto LABEL_8;
  }
  int v7 = [v5 shouldRecordExtendedLaunchTime];

  if (v7)
  {
LABEL_6:
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke_2;
    id v13 = &unk_1E5620C40;
    id v14 = v5;
    dispatch_async(MEMORY[0x1E4F14428], &v10);
    double v6 = v14;
    goto LABEL_7;
  }
LABEL_8:
  objc_super v8 = +[CKPreviewDispatchCache genmojiPreviewCache];
  [v8 resume];

  double v9 = +[CKPreviewDispatchCache transcriptPreviewCache];
  [v9 resume];
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (void)setShouldUseFastPreviewText:(BOOL)a3
{
  self->_shouldUseFastPreviewText = a3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  id v4 = [(CKConversationListCollectionViewController *)self collectionView];

  double v5 = v7;
  if (v4 == v7)
  {
    [(CKConversationListCollectionViewController *)self updateBannerConstraintsForScrollViewDidScroll:v7];
    BOOL v6 = [(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession];
    double v5 = v7;
    if (v6)
    {
      [(CKConversationListCollectionViewController *)self _ck_setNeedsUpdateOfMultitaskingDragExclusionRects];
      double v5 = v7;
    }
  }
}

- (void)updateBannerConstraintsForScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self collectionView];

  if (v5 == v4)
  {
    [(CKConversationListCollectionViewController *)self _updateBannerLayoutConstraints];
    [(CKConversationListCollectionViewController *)self _updateScrollEdgeAppearanceProgress];
  }
}

- (void)_updateScrollEdgeAppearanceProgress
{
  id v6 = [(CKConversationListCollectionViewController *)self navigationItem];
  [v6 _manualScrollEdgeAppearanceProgress];
  double v4 = v3;
  id v5 = [(CKConversationListCollectionViewController *)self presentedBanner];
  [v5 setScrollEdgeAppearanceProgress:v4];
}

- (void)updateBannerVisualEffectGroup
{
  double v3 = [(CKConversationListCollectionViewController *)self navigationController];
  double v4 = [v3 navigationBar];
  id v6 = [v4 _backdropViewLayerGroupName];

  id v5 = [(CKConversationListCollectionViewController *)self presentedBanner];
  [v5 setScrollEdgeAppearanceBackdropGroupName:v6];
}

- (CKConversationListCollectionViewControllerBannerProtocol)presentedBanner
{
  return self->_presentedBanner;
}

- (void)_updateBannerLayoutConstraints
{
  double v3 = [(CKConversationListCollectionViewController *)self bannerTopConstraint];
  if (v3)
  {
    id v15 = v3;
    double v4 = [(CKConversationListCollectionViewController *)self collectionView];
    id v5 = [(CKConversationListCollectionViewController *)self navigationItem];
    uint64_t v6 = [v5 largeTitleDisplayMode];

    [v4 contentOffset];
    double v8 = v7;
    [v4 adjustedContentInset];
    double v10 = v8 + v9;
    BOOL v11 = v10 < 0.0 && v6 == 0;
    double v12 = -v10;
    if (v11) {
      double v13 = v12;
    }
    else {
      double v13 = 0.0;
    }
    [v15 constant];
    if (v13 != v14) {
      [v15 setConstant:v13];
    }

    double v3 = v15;
  }
}

- (NSString)deferredSearchQuery
{
  return self->_deferredSearchQuery;
}

- (NSLayoutConstraint)bannerTopConstraint
{
  return self->_bannerTopConstraint;
}

- (id)transparentNavBarAppearance
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42BF0]);
  [v2 configureWithTransparentBackground];

  return v2;
}

void __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[1023]) {
    return;
  }
  id v7 = [v2 collectionView];
  double v3 = [v7 indexPathsForSelectedItems];
  if ([v3 count]) {
    goto LABEL_5;
  }
  double v4 = [*(id *)(a1 + 32) delegate];
  if ([v4 isCollapsed])
  {

LABEL_5:

    return;
  }
  char v5 = [*(id *)(a1 + 32) isShowingConversationFromCatalystOpenURL];

  if ((v5 & 1) == 0 && ([*(id *)(a1 + 32) isRecentlyDeletedModal] & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 selectDefaultConversationAnimated:0];
  }
}

void __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  id v2 = [*(id *)(a1 + 32) _launchTestName];
  [v3 finishedTest:v2 extraResults:0];
}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_858()
{
  id v0 = +[CKCloudTipViewModel sharedInstance];
  [v0 configureCloudTipManagerWithCompletionHandler:&__block_literal_global_862];
}

- (void)viewDidLoad
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v11 viewDidLoad];
  if (!CKIsRunningInMacCatalyst())
  {
    [(CKConversationListCollectionViewController *)self setClearsSelectionOnViewWillAppear:0];
    id v3 = [(CKConversationListCollectionViewController *)self collectionView];
    [v3 setAllowsSelectionDuringEditing:1];

    double v4 = [(CKConversationListCollectionViewController *)self collectionView];
    [v4 setAllowsMultipleSelectionDuringEditing:1];
  }
  BOOL v5 = CKIsRunningInMacCatalyst() != 0;
  uint64_t v6 = [(CKConversationListCollectionViewController *)self collectionView];
  [v6 setAllowsMultipleSelection:v5];

  [(CKConversationListCollectionViewController *)self setDefinesPresentationContext:1];
  id v7 = [MEMORY[0x1E4F6BC60] sharedInstance];
  [v7 setProgressPollingInterval:60.0];

  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = [MEMORY[0x1E4F6BC60] sharedInstance];
      [v9 progressPollingInterval];
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v10;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "set progress polling interval to %f", buf, 0xCu);
    }
  }
  [(CKConversationListCollectionViewController *)self registerForCloudKitEventsWithDelayedRegistration:1];
  [(CKConversationListCollectionViewController *)self _configureCloudTipViewModelIfNeeded];
  [(CKConversationListCollectionViewController *)self updateBackButton];
}

- (void)updateBackButton
{
  if (IMEnableTranscriptChromelessNavBar())
  {
    id v3 = [(CKConversationListCollectionViewController *)self conversationList];
    uint64_t v4 = [v3 unreadCountForFilterMode:1];

    uint64_t v6 = [[CKBackBarButtonItem alloc] initWithUnreadCount:v4];
    BOOL v5 = [(CKConversationListCollectionViewController *)self navigationItem];
    [v5 setBackBarButtonItem:v6];
  }
}

- (void)registerForCloudKitEventsWithDelayedRegistration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (registerForCloudKitEventsWithDelayedRegistration__onceToken != -1) {
    dispatch_once(&registerForCloudKitEventsWithDelayedRegistration__onceToken, &__block_literal_global_796_0);
  }
  if (v3) {
    double v5 = *(double *)&registerForCloudKitEventsWithDelayedRegistration__sRegistrationDelay;
  }
  else {
    double v5 = 1.0;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "registering for cloudkit events with delay: %f", buf, 0xCu);
    }
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__CKConversationListCollectionViewController_registerForCloudKitEventsWithDelayedRegistration___block_invoke_797;
  block[3] = &unk_1E56215C8;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (CKConversationListCollectionViewController)init
{
  BOOL v3 = objc_alloc_init(CKConversationListCollectionViewLayout);
  uint64_t v4 = [(CKConversationListCollectionViewLayout *)v3 conversationListLayout];
  v20.receiver = self;
  v20.super_class = (Class)CKConversationListCollectionViewController;
  double v5 = [(CKConversationListCollectionViewController *)&v20 initWithCollectionViewLayout:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_isInitialAppearance = 1;
    dispatch_time_t v7 = [(CKConversationListCollectionViewController *)v5 standardCellLayout];
    [(CKConversationListCollectionViewController *)v6 setCellLayout:v7];

    [(CKConversationListCollectionViewLayout *)v3 setConversationListController:v6];
    [(CKConversationListCollectionViewController *)v6 setConversationLayout:v3];
    [(CKConversationListCollectionViewController *)v6 setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:1];
    [(CKConversationListCollectionViewController *)v6 setInstallsStandardGestureForInteractiveMovement:0];
    [(CKConversationListCollectionViewController *)v6 setFilterMode:0];
    double v8 = +[CKConversationListCollectionViewController updaterLogHandle];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6E900]) initWithLogHandle:v8 delegate:v6];
    [(CKConversationListCollectionViewController *)v6 setUpdater:v9];

    uint64_t v10 = [(CKConversationListCollectionViewController *)v6 updater];
    [v10 beginHoldingUpdatesForReason:@"viewVisiblity"];

    [(CKConversationListCollectionViewController *)v6 _updateConversationListsAndSortIfEnabled];
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__chatItemsDidChange_ name:*MEMORY[0x1E4F6B8D8] object:0];
    [v11 addObserver:v6 selector:sel__chatWatermarkDidChange_ name:*MEMORY[0x1E4F6BAA0] object:0];
    [v11 addObserver:v6 selector:sel__conversationListDidFinishLoadingConversations_ name:@"CKConversationListFinishedLoadingNotification" object:0];
    [v11 addObserver:v6 selector:sel__contactStoreDidFinishLoadingNotification_ name:*MEMORY[0x1E4F6D1D0] object:0];
    double v12 = [(CKConversationListCollectionViewController *)v6 conversationList];
    [v11 addObserver:v6 selector:sel__conversationListDidChange_ name:@"CKConversationListChangedNotification" object:v12];

    [v11 addObserver:v6 selector:sel__chatUnreadCountDidChange_ name:*MEMORY[0x1E4F6BA90] object:0];
    [v11 addObserver:v6 selector:sel__chatUnreadCountDidChange_ name:*MEMORY[0x1E4F6BA50] object:0];
    [v11 addObserver:v6 selector:sel__chatParticipantsChangedNotification_ name:*MEMORY[0x1E4F6B9C8] object:0];
    [v11 addObserver:v6 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];
    [v11 addObserver:v6 selector:sel__increaseContrastDidChange_ name:*MEMORY[0x1E4F43418] object:0];
    [v11 addObserver:v6 selector:sel__adaptiveImageGlyphWasGeneratedNotification_ name:@"CKAdaptiveImageGlyphGeneratedNotification" object:0];
    [v11 addObserver:v6 selector:sel__conversationIsFilteredChangedNotification_ name:*MEMORY[0x1E4F6B8D0] object:0];
    [v11 addObserver:v6 selector:sel__conversationDisplayNameChangedNotification_ name:*MEMORY[0x1E4F6B898] object:0];
    [v11 addObserver:v6 selector:sel__conversationMuteDidChangeNotification_ name:*MEMORY[0x1E4F6DDB8] object:0];
    [v11 addObserver:v6 selector:sel__conversationFilteringStateChangedNotification_ name:CKMessageFilteringChangedNotification[0] object:0];
    [v11 addObserver:v6 selector:sel__conversationSpamFilteringStateChangedNotification_ name:CKMessageSpamFilteringChangedNotification object:0];
    [v11 addObserver:v6 selector:sel__conversationContactPhotosEnabledChangedNotification_ name:CKConversationListContactPhotosEnabledNotification object:0];
    [v11 addObserver:v6 selector:sel__didReceiveSummaries_ name:@"CKConversationListDidReceiveSummaries" object:0];
    if (IMIsOscarEnabled()) {
      [v11 addObserver:v6 selector:sel_updateConversationList name:@"CKConversationListDidRecoverJunkConversationsNotification" object:0];
    }
    [v11 addObserver:v6 selector:sel__multiWayCallStateChanged_ name:*MEMORY[0x1E4F6B9C0] object:0];
    [v11 addObserver:v6 selector:sel__reloadVisibleConversationList_ name:@"CKConversationListUpdateVisibleConversationsNotification" object:0];
    [v11 addObserver:v6 selector:sel__downtimeStateChanged_ name:*MEMORY[0x1E4F6BAE0] object:0];
    [v11 addObserver:v6 selector:sel__chatAllowedByScreenTimeChanged_ name:*MEMORY[0x1E4F6B888] object:0];
    [v11 addObserver:v6 selector:sel_updateConversationNamesForNicknames_ name:*MEMORY[0x1E4F6BB48] object:0];
    [v11 addObserver:v6 selector:sel_updateConversationNamesForNicknames_ name:*MEMORY[0x1E4F6BB50] object:0];
    [v11 addObserver:v6 selector:sel__conversationListPinnedConversationsDidChange_ name:@"CKConversationListPinnedConversationsChangedNotification" object:0];
    [v11 addObserver:v6 selector:sel__refreshConversationListCellForGroupPhotoUpdate_ name:@"CKConversationListAvatarUpdateNotification" object:0];
    [v11 addObserver:v6 selector:sel__handleAccountRegistrationChange_ name:*MEMORY[0x1E4F6BBC0] object:0];
    uint64_t v13 = *MEMORY[0x1E4F6B850];
    [v11 addObserver:v6 selector:sel__handleAccountRegistrationChange_ name:*MEMORY[0x1E4F6B850] object:0];
    [v11 addObserver:v6 selector:sel__handleAccountRegistrationChange_ name:*MEMORY[0x1E4F6B818] object:0];
    [v11 addObserver:v6 selector:sel__handingPendingConversationDidChange_ name:@"CKConversationListPendingConversationChangedNotification" object:0];
    [v11 addObserver:v6 selector:sel__reloadRecoverableMetadataForNotification_ name:*MEMORY[0x1E4F6BA28] object:0];
    [v11 addObserver:v6 selector:sel__handleDidRecoverMessagesInChatsNotification_ name:*MEMORY[0x1E4F6BA38] object:0];
    [v11 addObserver:v6 selector:sel__updateAccountRegistrationFailureNotification name:v13 object:0];
    uint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isCarrierPigeonEnabled];

    if (v15)
    {
      [v11 addObserver:v6 selector:sel__updateRefreshControlVisibility name:*MEMORY[0x1E4F6BAA8] object:0];
      [v11 addObserver:v6 selector:sel__pendingSatelliteCountChanged name:*MEMORY[0x1E4F6B9D0] object:0];
      [v11 addObserver:v6 selector:sel__isDownloadingPendingSatelliteMessagesChanged name:*MEMORY[0x1E4F6B8C8] object:0];
    }
    [(CKConversationListCollectionViewController *)v6 registerForFocusStateChanges];
    [(CKConversationListCollectionViewController *)v6 setUseLayoutToLayoutNavigationTransitions:0];
    id v16 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    uint64_t v17 = [v16 getContactStore];
    contactStore = v6->_contactStore;
    v6->_contactStore = (CNContactStore *)v17;
  }
  return v6;
}

- (void)registerForFocusStateChanges
{
  id v3 = [MEMORY[0x1E4F6E788] sharedManager];
  [v3 addDelegate:self];
  [v3 updateFocusStateForCurrentFocusFilterActionAsync];
  [(CKConversationListCollectionViewController *)self updateFocusFilterBannerWithAnimation:0];
}

- (void)setUpdater:(id)a3
{
}

- (void)setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:(BOOL)a3
{
  self->_nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate = a3;
}

- (void)setFilterMode:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_unint64_t filterMode = &self->_filterMode;
  unint64_t filterMode = self->_filterMode;
  self->_unint64_t filterMode = -[CKConversationListCollectionViewController _sanitizedFilterMode:](self, "_sanitizedFilterMode:");
  dispatch_time_t v7 = [(CKConversationListCollectionViewController *)self delegate];
  [v7 updatedFilterMode:*p_filterMode previousFilterMode:filterMode];

  [(CKConversationListCollectionViewController *)self _configureForFilterMode:*p_filterMode];
  if (filterMode == 7) {
    [(CKConversationListCollectionViewController *)self setEditingMode:0];
  }
  double v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isCarrierPigeonEnabled];

  if (v9 && filterMode != a3) {
    [(CKConversationListCollectionViewController *)self _updateRefreshControlVisibility];
  }
  uint64_t v10 = [(CKConversationListCollectionViewController *)self _getTitleForCurrentFilterMode];
  [(CKConversationListCollectionViewController *)self setTitle:v10];
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CKConversationListFilterModeStringValue(a3);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      CKConversationListFilterModeStringValue(self->_filterMode);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      CKConversationListFilterModeStringValue(filterMode);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v15 = [(CKConversationListCollectionViewController *)self _messageUnknownFilteringEnabled];
      id v16 = @"NO";
      int v17 = 138413058;
      id v18 = v12;
      __int16 v19 = 2112;
      if (v15) {
        id v16 = @"YES";
      }
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      __int16 v23 = 2112;
      int v24 = v16;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "ConversationListController: setFilterMode called with filterMode: %@, previous filterMode: %@, current filterMode: %@, when messageFilteringEnabled: %@.", (uint8_t *)&v17, 0x2Au);
    }
  }
}

- (void)setConversationLayout:(id)a3
{
}

- (unint64_t)_sanitizedFilterModeForFilterUnknownDisabled:(unint64_t)a3
{
  if (a3 == 9)
  {
    if ([(CKConversationListCollectionViewController *)self isOscarModal]
      || CKIsRunningInMacCatalyst())
    {
      return 9;
    }
  }
  else if (a3 == 7 {
         && ([(CKConversationListCollectionViewController *)self isRecentlyDeletedModal]
  }
          || CKIsRunningInMacCatalyst()))
  {
    return 7;
  }
  return 0;
}

- (unint64_t)_sanitizedFilterMode:(unint64_t)a3
{
  if ([(CKConversationListCollectionViewController *)self _messageUnknownFilteringEnabled])
  {
    return [(CKConversationListCollectionViewController *)self _sanitizedFilterModeForFilterUnknownEnabled:a3];
  }
  else
  {
    return [(CKConversationListCollectionViewController *)self _sanitizedFilterModeForFilterUnknownDisabled:a3];
  }
}

- (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (id)_getTitleForCurrentFilterMode
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ([(CKConversationListCollectionViewController *)self isShowingPinningOnboarding])
  {
    id v3 = &stru_1EDE4CA38;
    goto LABEL_47;
  }
  unint64_t filterMode = self->_filterMode;
  if (filterMode == 9)
  {
    double v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"OSCAR" value:&stru_1EDE4CA38 table:@"ChatKit"];
    goto LABEL_7;
  }
  if (filterMode == 7)
  {
    double v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"RECENTLY_DELETED" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_7:
    id v3 = (__CFString *)v6;

    goto LABEL_47;
  }
  if (!CKIsRunningInMacCatalyst()
    && ![(CKConversationListCollectionViewController *)self _shouldShowInboxView])
  {
    double v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    goto LABEL_7;
  }
  if ([(CKConversationListCollectionViewController *)self filterMode] >= 0x10)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    dispatch_time_t v7 = objc_msgSend(MEMORY[0x1E4F6E938], "fetchSMSFilterExtensionParams", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          unint64_t v12 = [(CKConversationListCollectionViewController *)self filterMode];
          if (v12 == [v11 filterMode])
          {
            BOOL v15 = IMSharedUtilitiesFrameworkBundle();
            id v16 = [v11 folderName];
            id v3 = [v15 localizedStringForKey:v16 value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];

            goto LABEL_47;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  switch([(CKConversationListCollectionViewController *)self filterMode])
  {
    case 1uLL:
      goto LABEL_21;
    case 2uLL:
      BOOL v17 = CKIsRunningInMacCatalyst() == 0;
      id v18 = CKFrameworkBundle();
      id v13 = v18;
      if (v17) {
        [v18 localizedStringForKey:@"KNOWN" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      else {
        [v18 localizedStringForKey:@"KNOWN_SENDERS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      goto LABEL_35;
    case 3uLL:
      BOOL v19 = CKIsRunningInMacCatalyst() == 0;
      id v20 = CKFrameworkBundle();
      id v13 = v20;
      if (v19) {
        [v20 localizedStringForKey:@"UNKNOWN" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      else {
        [v20 localizedStringForKey:@"UNKNOWN_SENDERS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      goto LABEL_35;
    case 4uLL:
      id v13 = CKFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"TRANSACTIONAL_SENDER_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      break;
    case 5uLL:
      id v13 = CKFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"PROMOTIONAL_SENDER_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      break;
    case 6uLL:
      BOOL v21 = CKIsBlackholeEnabled();
      id v22 = CKFrameworkBundle();
      id v13 = v22;
      if (v21) {
        [v22 localizedStringForKey:@"JUNK_BLACKHOLE_SENDER_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      else {
        [v22 localizedStringForKey:@"JUNK_SENDER_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      goto LABEL_35;
    case 7uLL:
      id v13 = CKFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"RECENTLY_DELETED" value:&stru_1EDE4CA38 table:@"ChatKit"];
      break;
    case 8uLL:
      BOOL v23 = CKIsRunningInMacCatalyst() == 0;
      int v24 = CKFrameworkBundle();
      id v13 = v24;
      if (v23) {
        [v24 localizedStringForKey:@"UNREAD" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      else {
        [v24 localizedStringForKey:@"UNREAD_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      uint64_t v14 = LABEL_35:;
      break;
    case 9uLL:
      id v13 = CKFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"OSCAR" value:&stru_1EDE4CA38 table:@"ChatKit"];
      break;
    default:
      if (IMOSLoggingEnabled())
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          unint64_t v26 = [(CKConversationListCollectionViewController *)self filterMode];
          BOOL v27 = [(CKConversationListCollectionViewController *)self _messageUnknownFilteringEnabled];
          BOOL v28 = [(CKConversationListCollectionViewController *)self _shouldShowInboxView];
          *(_DWORD *)buf = 134218496;
          unint64_t v35 = v26;
          __int16 v36 = 1024;
          BOOL v37 = v27;
          __int16 v38 = 1024;
          BOOL v39 = v28;
          _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "unknown filterMode %ld with filtering state %d and inbox view state %d", buf, 0x18u);
        }
      }
LABEL_21:
      id v13 = CKFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
      break;
  }
  id v3 = (__CFString *)v14;

LABEL_47:

  return v3;
}

- (void)_configureForFilterMode:(unint64_t)a3
{
  if (a3 == 9)
  {
    [(CKConversationListCollectionViewController *)self configureForOscarFilter];
  }
  else if (a3 == 7)
  {
    [(CKConversationListCollectionViewController *)self configureForRecentlyDeletedFilter];
  }
  else
  {
    if (!self->_isInitialAppearance)
    {
      uint64_t v4 = [(CKConversationListCollectionViewController *)self searchController];
      double v5 = [(CKConversationListCollectionViewController *)self navigationItem];
      [v5 setSearchController:v4];

      [(CKConversationListCollectionViewController *)self configureSearchBarEnabled:1];
    }
    BOOL v6 = [(CKConversationListCollectionViewController *)self _shouldShowToolbar];
    id v7 = [(CKConversationListCollectionViewController *)self navigationController];
    [v7 setToolbarHidden:!v6 animated:0];
  }
}

- (BOOL)_shouldShowToolbar
{
  if (CKIsRunningInMacCatalyst())
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    unint64_t v3 = [(CKConversationListCollectionViewController *)self editingMode];
    if (v3 != 1) {
      LOBYTE(v3) = [(CKConversationListCollectionViewController *)self filterMode] == 9;
    }
  }
  return v3;
}

- (void)_configureCloudTipViewModelIfNeeded
{
  unint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isMessagesInICloudNewUIEnabled];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      double v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Configuring the CKCloudTipViewModel handler.", buf, 2u);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    BOOL v6 = +[CKCloudTipViewModel sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke;
    v8[3] = &unk_1E5629F38;
    objc_copyWeak(&v9, (id *)buf);
    [v6 setOnCloudTipChanged:v8];

    id v7 = dispatch_get_global_queue(0, 0);
    dispatch_async(v7, &__block_literal_global_860_1);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

+ (id)updaterLogHandle
{
  if (updaterLogHandle_onceToken != -1) {
    dispatch_once(&updaterLogHandle_onceToken, &__block_literal_global_186);
  }
  id v2 = (void *)updaterLogHandle_sLogHandle;

  return v2;
}

- (void)focusStateDidChange
{
  [(CKConversationListCollectionViewController *)self setNeedsConversationListUpdateForFocusStateChange];

  [(CKConversationListCollectionViewController *)self updateFocusFilterBannerWithAnimation:1];
}

- (void)setNeedsConversationListUpdateForFocusStateChange
{
  id v2 = [(CKConversationListCollectionViewController *)self updater];
  [v2 setNeedsDeferredUpdateWithReason:@"focusStateChanged"];
}

- (void)_endHoldingUpdatesOnViewWillAppear
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"viewWillAppear"];

  int v4 = [(CKConversationListCollectionViewController *)self updater];
  [v4 endAllHoldsOnUpdatesForReason:@"viewVisiblity" updateTriggeredIfNotHeldShouldBeDeferred:0];

  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = [(CKConversationListCollectionViewController *)self updater];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Conversation list end holding updates, _updater is: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (IMReasonTrackingUpdater)updater
{
  return self->_updater;
}

void __67__CKConversationListCollectionViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id v2 = CKAppExtensionDevelopmentTargetBundle();
  uint64_t v3 = [v2 length];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) conversationList];
    id v7 = [v4 conversations];

    if ([v7 count])
    {
      double v5 = [*(id *)(a1 + 32) delegate];
      BOOL v6 = [v7 firstObject];
      [v5 showConversation:v6 animate:0];
    }
  }
}

- (void)reasonTrackingUpdater:(id)a3 didBeginHoldingUpdatesWithInitialReason:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Freezing conversations with initial reason for freeze: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(CKConversationListCollectionViewController *)self _freezeConversations];
}

- (void)_freezeConversations
{
  id v3 = [(CKConversationListCollectionViewController *)self pinnedConversations];
  if (!v3) {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  id v5 = v3;
  [(CKConversationListCollectionViewController *)self setFrozenPinnedConversations:v3];
  int v4 = [(CKConversationListCollectionViewController *)self activeConversations];
  [(CKConversationListCollectionViewController *)self setFrozenConversations:v4];
}

- (void)_unfreezeConversations
{
  [(CKConversationListCollectionViewController *)self setFrozenPinnedConversations:0];

  [(CKConversationListCollectionViewController *)self setFrozenConversations:0];
}

- (void)setFrozenPinnedConversations:(id)a3
{
}

- (void)reasonTrackingUpdater:(id)a3 didEndHoldingUpdatesWithFinalReason:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Unfreezing conversations with final reason for unfreeze: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(CKConversationListCollectionViewController *)self _unfreezeConversations];
}

- (void)setFrozenConversations:(id)a3
{
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  int v9 = -[CKConversationListCollectionView initWithFrame:collectionViewLayout:]([CKConversationListCollectionView alloc], "initWithFrame:collectionViewLayout:", v8, x, y, width, height);

  return v9;
}

void __95__CKConversationListCollectionViewController_conversationListCollectionViewControllerLogHandle__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Messages", "ConversationListCollectionViewController");
  uint64_t v1 = (void *)conversationListCollectionViewControllerLogHandle_sLogHandle;
  conversationListCollectionViewControllerLogHandle_sLogHandle = (uint64_t)v0;
}

void __62__CKConversationListCollectionViewController_updaterLogHandle__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Messages", "ConversationListViewControllerUpdater");
  uint64_t v1 = (void *)updaterLogHandle_sLogHandle;
  updaterLogHandle_sLogHandle = (uint64_t)v0;
}

void __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) conversationList];
  [v1 updateRecoverableConversationList];
}

void __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [*(id *)(a1 + 32) chatGuidsForMessagesPinningWithMaxSuggestions:*(void *)(a1 + 48)];
  int v4 = [v2 orderedSetWithArray:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_2;
  v7[3] = &unk_1E5620AF8;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) filterMode] == 3 || objc_msgSend(*(id *)(a1 + 32), "filterMode") == 2)
  {
    id v2 = [*(id *)(a1 + 32) conversationList];
    [v2 updateConversationsWasKnownSender];

    id v3 = [*(id *)(a1 + 32) conversationList];
    [v3 beginWasKnownSenderHold];
  }
  int v4 = *(void **)(a1 + 32);

  return [v4 viewDidAppearDeferredSetup];
}

- (void)fetchPinningSuggestions
{
  if ([(CKConversationListCollectionViewController *)self numberOfPinnedConversations] < 1)
  {
    int64_t v4 = [(CKConversationListCollectionViewController *)self numberOfConversations];
    uint64_t v5 = [(CKConversationListCollectionViewController *)self pinnedConversationSuggester];
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke;
    block[3] = &unk_1E5620E38;
    uint64_t v9 = self;
    int64_t v10 = v4;
    id v8 = v5;
    id v3 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Already have pinned conversations, not fetching conversations.", buf, 2u);
    }
  }
}

- (int64_t)numberOfConversations
{
  id v2 = [(CKConversationListCollectionViewController *)self activeConversations];
  int64_t v3 = [v2 count];

  return v3;
}

- (_PSMessagesPinningSuggester)pinnedConversationSuggester
{
  pinnedConversationSuggester = self->_pinnedConversationSuggester;
  if (!pinnedConversationSuggester)
  {
    int64_t v4 = (_PSMessagesPinningSuggester *)objc_alloc_init(MEMORY[0x1E4F89C88]);
    uint64_t v5 = self->_pinnedConversationSuggester;
    self->_pinnedConversationSuggester = v4;

    pinnedConversationSuggester = self->_pinnedConversationSuggester;
  }

  return pinnedConversationSuggester;
}

- (void)_updateLargeTitleDisplayModeWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKConversationListCollectionViewController *)self _shouldAllowLargeTitles];
  id v6 = [(CKConversationListCollectionViewController *)self navigationItem];
  uint64_t v7 = [v6 largeTitleDisplayMode];

  if (v5) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 2;
  }
  if (v7 != v8)
  {
    uint64_t v9 = [(CKConversationListCollectionViewController *)self collectionView];
    [v9 contentInset];
    uint64_t v11 = v10;

    if (v3)
    {
      unint64_t v12 = [(CKConversationListCollectionViewController *)self navigationController];
      id v13 = [v12 navigationBar];

      uint64_t v14 = [v13 _restingHeights];
      BOOL v15 = [v13 snapshotViewAfterScreenUpdates:0];
      id v16 = [(CKConversationListCollectionViewController *)self collectionView];
      BOOL v17 = [v16 backgroundColor];
      [v15 setBackgroundColor:v17];

      [v13 frame];
      objc_msgSend(v15, "setFrame:");
      id v18 = [(CKConversationListCollectionViewController *)self navigationController];
      BOOL v19 = [v18 view];
      [v19 addSubview:v15];
    }
    else
    {
      uint64_t v14 = 0;
      BOOL v15 = 0;
    }
    id v20 = [(CKConversationListCollectionViewController *)self navigationItem];
    [v20 setLargeTitleDisplayMode:v8];

    BOOL v21 = [(CKConversationListCollectionViewController *)self navigationItem];
    id v22 = [v21 searchController];
    char v23 = [v22 isActive];

    if ((v23 & 1) == 0)
    {
      int v24 = [(CKConversationListCollectionViewController *)self navigationItem];
      uint64_t v25 = [v24 searchController];

      unint64_t v26 = [(CKConversationListCollectionViewController *)self navigationItem];
      [v26 setSearchController:0];

      BOOL v27 = [(CKConversationListCollectionViewController *)self navigationController];
      BOOL v28 = [v27 navigationBar];
      [v28 setNeedsLayout];

      objc_super v29 = [(CKConversationListCollectionViewController *)self navigationController];
      long long v30 = [v29 navigationBar];
      [v30 sizeToFit];

      long long v31 = [(CKConversationListCollectionViewController *)self navigationItem];
      [v31 setSearchController:v25];
    }
    if (!v3) {
      goto LABEL_23;
    }
    long long v32 = [(CKConversationListCollectionViewController *)self collectionView];
    [v32 contentInset];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;

    if (v7) {
      char v41 = 1;
    }
    else {
      char v41 = v5;
    }
    if (v41)
    {
      if (v7 != 2 || !v5) {
        goto LABEL_22;
      }
      BOOL v43 = [v14 firstObject];
    }
    else
    {
      BOOL v43 = [v14 lastObject];
    }
    id v44 = v43;
    [v43 floatValue];
    double v34 = v45;

LABEL_22:
    v46 = [(CKConversationListCollectionViewController *)self collectionView];
    objc_msgSend(v46, "setContentInset:", v34, v36, v38, v40);

    v47 = [(CKConversationListCollectionViewController *)self collectionView];
    [v47 contentInset];
    uint64_t v49 = v48;
    uint64_t v51 = v50;
    uint64_t v53 = v52;

    uint64_t v54 = (void *)MEMORY[0x1E4F42FF0];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke;
    v57[3] = &unk_1E56285E8;
    v57[4] = self;
    uint64_t v59 = v11;
    uint64_t v60 = v49;
    uint64_t v61 = v51;
    uint64_t v62 = v53;
    id v58 = v15;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke_2;
    v55[3] = &unk_1E5620BF0;
    id v56 = v58;
    [v54 animateWithDuration:0 delay:v57 options:v55 animations:0.300000012 completion:0.0];

LABEL_23:
  }
}

- (BOOL)_shouldAllowLargeTitles
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 converastionListAlwaysSupportsLargeTitles];

  if ((v4 & 1) != 0
    || ![(CKConversationListCollectionViewController *)self shouldShowPinnedConversations])
  {
    return 1;
  }
  if ([(CKConversationListCollectionViewController *)self numberOfPinnedConversations]
    || [(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession])
  {
    return 0;
  }
  return ![(CKConversationListCollectionViewController *)self isShowingPinningOnboarding];
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4 shouldUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unint64_t v8 = [(CKConversationListCollectionViewController *)self _preferredEditingMode:a3];
  unint64_t editingMode = self->_editingMode;
  if (editingMode != v8)
  {
    unint64_t v10 = v8;
    if (!v8
      && [(CKConversationListCollectionViewController *)self isShowingPinningOnboarding]
      && ![(CKConversationListCollectionViewController *)self isCurrentlyAnimatingPinningOnboardingSuggestions])
    {
      [(CKConversationListCollectionViewController *)self setIsShowingPinningOnboarding:0];
    }
    self->_unint64_t editingMode = v10;
    uint64_t v11 = [(CKConversationListCollectionViewController *)self collectionView];
    unint64_t v12 = [v11 visibleCells];
    id v13 = (void *)[v12 _copyForEnumerating];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __83__CKConversationListCollectionViewController_setEditingMode_animated_shouldUpdate___block_invoke;
    v25[3] = &unk_1E5629DD0;
    v25[4] = self;
    v25[5] = v10;
    BOOL v26 = v6;
    [v13 enumerateObjectsUsingBlock:v25];
    if (v5) {
      [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:v6];
    }
    uint64_t v14 = [(CKConversationListCollectionViewController *)self collectionView];
    [v14 setAllowsSelectionDuringEditing:v10 != 2];

    BOOL v15 = [(CKConversationListCollectionViewController *)self collectionView];
    [v15 setAllowsMultipleSelectionDuringEditing:v10 != 2];

    if (v10 == 2)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v24 = 0;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Editing mode changed to CKConversationListControllerEditingModePin", v24, 2u);
        }
      }
      [(CKConversationListCollectionViewController *)self _freezeConversations];
      id v22 = [(CKConversationListCollectionViewController *)self _getTitleForCurrentFilterMode];
      [(CKConversationListCollectionViewController *)self setTitle:v22];

      [(CKConversationListCollectionViewController *)self _updateNavbarLayoutIfNeeded];
    }
    else
    {
      if (v10 != 1)
      {
        if (v10)
        {
LABEL_33:
          char v23 = [(CKConversationListCollectionViewController *)self delegate];
          objc_msgSend(v23, "conversationListWillBeginEditing:", -[CKConversationListCollectionViewController editingMode](self, "editingMode") != 0);

          return;
        }
        if (IMOSLoggingEnabled())
        {
          id v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int v24 = 0;
            _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Editing mode changed to CKConversationListControllerEditingModeNone", v24, 2u);
          }
        }
        if (!CKIsRunningInMacCatalyst())
        {
          BOOL v17 = [(CKConversationListCollectionViewController *)self collectionView];
          [v17 setAllowsMultipleSelection:0];
        }
        if (editingMode == 2)
        {
          [(CKConversationListCollectionViewController *)self _unfreezeConversations];
          if (v5) {
            [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
          }
          id v18 = [(CKConversationListCollectionViewController *)self _getTitleForCurrentFilterMode];
          [(CKConversationListCollectionViewController *)self setTitle:v18];

          [(CKConversationListCollectionViewController *)self _updateNavbarLayoutIfNeeded];
        }
        uint64_t v19 = 0;
LABEL_32:
        [(CKConversationListCollectionViewController *)self setEditing:v19 animated:v6];
        goto LABEL_33;
      }
      if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v24 = 0;
          _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Editing mode changed to CKConversationListControllerEditingModeManage", v24, 2u);
        }
      }
    }
    uint64_t v19 = 1;
    goto LABEL_32;
  }
}

- (unint64_t)_preferredEditingMode:(unint64_t)a3
{
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7) {
    return 1;
  }
  else {
    return a3;
  }
}

- (void)startEndSuggestedPinsAnimation
{
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = [(CKConversationListCollectionViewController *)self navigationController];
  char v4 = [v3 view];
  BOOL v5 = [v4 snapshotViewAfterScreenUpdates:0];

  BOOL v6 = [(CKConversationListCollectionViewController *)self navigationController];
  uint64_t v7 = [v6 view];
  [v7 addSubview:v5];

  [(CKConversationListCollectionViewController *)self setIsShowingPinningOnboarding:0];
  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:0 shouldUpdate:0];
  [(CKConversationListCollectionViewController *)self setCanShowSuggestedPinningOnboardingCell:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__CKConversationListCollectionViewController_Onboarding__startEndSuggestedPinsAnimation__block_invoke;
  v9[3] = &unk_1E5622AB8;
  objc_copyWeak(&v11, &location);
  id v8 = v5;
  id v10 = v8;
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __88__CKConversationListCollectionViewController_Onboarding__startEndSuggestedPinsAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained animateOutBackgroundSnapshotView:*(void *)(a1 + 32)];
}

- (void)startCompletePinningOnboardingAnimation
{
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = [(CKConversationListCollectionViewController *)self view];
  char v4 = [v3 snapshotViewAfterScreenUpdates:0];

  BOOL v5 = [(CKConversationListCollectionViewController *)self view];
  [v5 addSubview:v4];

  [(CKConversationListCollectionViewController *)self animationDistanceForCompletingOnboarding];
  uint64_t v7 = v6;
  [(CKConversationListCollectionViewController *)self setIsShowingPinningOnboarding:0];
  [(CKConversationListCollectionViewController *)self commitPinnedConversationsForEditingPins];
  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:0 shouldUpdate:0];
  [(CKConversationListCollectionViewController *)self setCanShowSuggestedPinningOnboardingCell:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__CKConversationListCollectionViewController_Onboarding__startCompletePinningOnboardingAnimation__block_invoke;
  v9[3] = &unk_1E56233A0;
  objc_copyWeak(v11, &location);
  id v8 = v4;
  id v10 = v8;
  v11[1] = v7;
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0 completion:v9];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __97__CKConversationListCollectionViewController_Onboarding__startCompletePinningOnboardingAnimation__block_invoke(uint64_t a1)
{
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [v3 collectionView];
  [v3 animateInCollectionView:v2 aboveBackgroundSnapshotView:*(void *)(a1 + 32) enteringOnboarding:0 animationDistance:*(double *)(a1 + 48)];
}

- (void)startSuggestedPinsAnimation
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(CKConversationListCollectionViewController *)self delegate];
  char v4 = [v3 isCollapsed];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = [(CKConversationListCollectionViewController *)self delegate];
    [v5 showConversation:0 animate:0];
  }
  BOOL v6 = [(CKConversationListCollectionViewController *)self navigationController];
  uint64_t v7 = [v6 view];
  [v7 setUserInteractionEnabled:0];

  id v8 = [(CKConversationListCollectionViewController *)self navigationController];
  uint64_t v9 = [v8 view];
  id v10 = [v9 snapshotViewAfterScreenUpdates:0];

  id v11 = [(CKConversationListCollectionViewController *)self view];
  [v11 addSubview:v10];

  unint64_t v12 = [(CKConversationListCollectionViewController *)self navigationItem];
  [v12 setSearchController:0];

  [(CKConversationListCollectionViewController *)self setIsShowingPinningOnboarding:1];
  [(CKConversationListCollectionViewController *)self setEditingMode:2 animated:0 shouldUpdate:0];
  [(CKConversationListCollectionViewController *)self setCanShowSuggestedPinningOnboardingCell:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke;
  v14[3] = &unk_1E5622AB8;
  objc_copyWeak(&v16, &location);
  id v13 = v10;
  id v15 = v13;
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = [v3 collectionView];
  [v3 animateInCollectionView:v4 aboveBackgroundSnapshotView:*(void *)(a1 + 32) enteringOnboarding:1 animationDistance:150.0];

  id WeakRetained = objc_loadWeakRetained(v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke_2;
  v6[3] = &unk_1E5623920;
  objc_copyWeak(&v7, v2);
  [WeakRetained pinConversationsWithCompletion:v6];

  objc_destroyWeak(&v7);
}

void __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained animateInPinsToFinalPosition];

  id v5 = objc_loadWeakRetained(v2);
  [v5 removeNewlyPinnedSuggestionCells:v3];
}

- (double)animationDistanceForCompletingOnboarding
{
  id v3 = [(CKConversationListCollectionViewController *)self dataSource];
  char v4 = [v3 snapshot];
  id v5 = [v4 itemIdentifiersInSectionWithIdentifier:&unk_1EDF163D0];
  BOOL v6 = [v5 firstObject];

  id v7 = [(CKConversationListCollectionViewController *)self dataSource];
  id v8 = [v7 indexPathForItemIdentifier:v6];

  uint64_t v9 = [(CKConversationListCollectionViewController *)self collectionView];
  id v10 = [v9 cellForItemAtIndexPath:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 frame];
    double MaxY = CGRectGetMaxY(v13);
  }
  else
  {
    double MaxY = 150.0;
  }

  return MaxY;
}

- (void)animateInCollectionView:(id)a3 aboveBackgroundSnapshotView:(id)a4 enteringOnboarding:(BOOL)a5 animationDistance:(double)a6
{
  BOOL v7 = a5;
  v96[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  unint64_t v12 = [v11 layer];
  [v12 position];
  double v14 = v13;
  double v88 = v13;
  double v16 = v15;
  double v90 = v15;

  double v89 = v16 + a6;
  BOOL v17 = [v11 layer];
  objc_msgSend(v17, "setPosition:", v14, v16 + a6);

  id v18 = [v11 layer];
  [v18 setOpacity:0.0];

  uint64_t v19 = [(CKConversationListCollectionViewController *)self view];
  [v19 bringSubviewToFront:v11];

  id v20 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v11 origin];
  double v22 = v21;
  [v11 bounds];
  double v24 = v23;
  [v11 origin];
  BOOL v26 = objc_msgSend(v20, "initWithFrame:", v22, 0.0, v24, v25);
  BOOL v27 = [v11 backgroundColor];
  [v26 setBackgroundColor:v27];

  BOOL v28 = [v26 layer];
  [v28 setOpacity:0.0];

  objc_super v29 = [v26 layer];
  [v29 position];
  double v87 = v30;
  double v32 = v31;

  double v86 = v32 - a6;
  double v33 = [(CKConversationListCollectionViewController *)self view];
  [v33 insertSubview:v26 belowSubview:v11];

  v91 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v91 setValue:MEMORY[0x1E4F1CC38] forKeyPath:*MEMORY[0x1E4F3A1B8]];
  id v34 = objc_alloc_init(MEMORY[0x1E4F39B40]);
  double v35 = [(CKConversationListCollectionViewController *)self view];
  double v36 = [v35 layer];
  [v36 bounds];
  objc_msgSend(v34, "setFrame:");

  v96[0] = v91;
  double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
  [v34 setFilters:v37];

  double v38 = [(CKConversationListCollectionViewController *)self view];
  double v39 = [v38 layer];
  double v40 = [v26 layer];
  [v39 insertSublayer:v34 below:v40];

  double v41 = CACurrentMediaTime();
  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v42 = (void *)MEMORY[0x1E4F39CF8];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __147__CKConversationListCollectionViewController_Onboarding__animateInCollectionView_aboveBackgroundSnapshotView_enteringOnboarding_animationDistance___block_invoke;
  v92[3] = &unk_1E5620AA8;
  id v93 = v26;
  id v94 = v34;
  id v95 = v10;
  id v85 = v10;
  id v43 = v34;
  id v44 = v26;
  [v42 setCompletionBlock:v92];
  float v45 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"backgroundColor"];
  [v45 setBeginTime:v41];
  v46 = [v11 backgroundColor];
  id v47 = [v46 colorWithAlphaComponent:0.0];
  objc_msgSend(v45, "setFromValue:", objc_msgSend(v47, "CGColor"));

  uint64_t v48 = [v11 backgroundColor];
  id v49 = [v48 colorWithAlphaComponent:1.0];
  objc_msgSend(v45, "setToValue:", objc_msgSend(v49, "CGColor"));

  if (v7) {
    double v50 = 1.255;
  }
  else {
    double v50 = 0.8;
  }
  if (v7) {
    double v51 = 14.7146;
  }
  else {
    double v51 = 50.0;
  }
  if (v7) {
    double v52 = 54.1299;
  }
  else {
    double v52 = 300.0;
  }
  if (v7) {
    double v53 = 0.02;
  }
  else {
    double v53 = 0.0;
  }
  if (v7) {
    double v54 = 78.8239;
  }
  else {
    double v54 = 309.319;
  }
  if (v7) {
    double v55 = 17.7566;
  }
  else {
    double v55 = 35.1749;
  }
  if (v7) {
    double v56 = 1.04;
  }
  else {
    double v56 = 0.525;
  }
  double v57 = 16.788;
  if (v7) {
    double v57 = 15.3252;
  }
  double v83 = v57;
  double v58 = 70.4594;
  if (v7) {
    double v58 = 58.7152;
  }
  double v82 = v58;
  double v59 = 1.1;
  if (v7) {
    double v59 = 1.205;
  }
  double v84 = v59;
  [v45 setDuration:v50];
  [v45 setMass:1.0];
  [v45 setDamping:v51];
  [v45 setStiffness:v52];
  uint64_t v60 = *MEMORY[0x1E4F39F98];
  [v45 setFillMode:*MEMORY[0x1E4F39F98]];
  [v43 addAnimation:v45 forKey:@"backgroundColor"];
  id v61 = [v11 backgroundColor];
  objc_msgSend(v43, "setBackgroundColor:", objc_msgSend(v61, "CGColor"));

  uint64_t v62 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v62 setBeginTime:v41];
  [v62 setFromValue:&unk_1EDF163E8];
  [v62 setToValue:&unk_1EDF16400];
  [v62 setDuration:v50];
  [v62 setMass:1.0];
  [v62 setDamping:v51];
  [v62 setStiffness:v52];
  [v62 setFillMode:v60];
  [v43 addAnimation:v62 forKey:@"filters.gaussianBlur.inputRadius"];
  [v43 setValue:&unk_1EDF16400 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  v63 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v63 setBeginTime:v53 + v41];
  [v63 setStiffness:v54];
  [v63 setDamping:v55];
  [v63 setFromValue:&unk_1EDF17088];
  [v63 setToValue:&unk_1EDF17098];
  [v63 setDuration:v56];
  [v63 setFillMode:v60];
  uint64_t v64 = [v11 layer];
  [v64 addAnimation:v63 forKey:@"opacity"];

  v65 = [v44 layer];
  [v65 addAnimation:v63 forKey:@"opacity"];

  v66 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v66 setBeginTime:v41];
  [v66 setDamping:v83];
  [v66 setStiffness:v82];
  [v66 setFillMode:v60];
  v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v88, v89);
  [v66 setFromValue:v67];

  uint64_t v68 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v88, v90);
  [v66 setToValue:v68];

  [v66 setDuration:v84];
  uint64_t v69 = [v11 layer];
  [v69 addAnimation:v66 forKey:@"position"];

  uint64_t v70 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v70 setBeginTime:v41];
  [v70 setDamping:v83];
  [v70 setStiffness:v82];
  [v70 setFillMode:v60];
  uint64_t v71 = (void *)MEMORY[0x1E4F29238];
  [v44 position];
  v72 = objc_msgSend(v71, "valueWithCGPoint:");
  [v70 setFromValue:v72];

  v73 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v87, v86);
  [v70 setToValue:v73];

  [v70 setDuration:v84];
  long long v74 = [v44 layer];
  [v74 addAnimation:v70 forKey:@"position"];

  [MEMORY[0x1E4F39CF8] commit];
  long long v75 = [v11 layer];
  objc_msgSend(v75, "setPosition:", v88, v90);

  long long v76 = [v11 layer];

  LODWORD(v77) = 1.0;
  [v76 setOpacity:v77];

  v78 = [v44 layer];
  LODWORD(v79) = 1.0;
  [v78 setOpacity:v79];

  v80 = [v44 layer];
  objc_msgSend(v80, "setPosition:", v87, v86);

  LODWORD(v81) = 1.0;
  [v43 setOpacity:v81];
}

uint64_t __147__CKConversationListCollectionViewController_Onboarding__animateInCollectionView_aboveBackgroundSnapshotView_enteringOnboarding_animationDistance___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperlayer];
  id v2 = *(void **)(a1 + 48);

  return [v2 removeFromSuperview];
}

- (void)animateOutBackgroundSnapshotView:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 layer];
  [v5 position];
  double v7 = v6;
  double v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v4 origin];
  double v12 = v11;
  [v4 bounds];
  double v13 = objc_msgSend(v10, "initWithFrame:", v12, -150.0);
  double v14 = [(CKConversationListCollectionViewController *)self collectionView];
  double v15 = [v14 backgroundColor];
  [v13 setBackgroundColor:v15];

  double v16 = [v13 layer];
  LODWORD(v17) = 1.0;
  [v16 setOpacity:v17];

  id v18 = [v13 layer];
  [v18 position];
  double v20 = v19;
  double v22 = v21;

  double v23 = v22 + 150.0;
  double v24 = [(CKConversationListCollectionViewController *)self navigationController];
  double v25 = [v24 view];
  [v25 insertSubview:v13 belowSubview:v4];

  double v52 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v52 setValue:MEMORY[0x1E4F1CC38] forKeyPath:*MEMORY[0x1E4F3A1B8]];
  id v26 = objc_alloc_init(MEMORY[0x1E4F39B40]);
  BOOL v27 = [v4 layer];
  [v27 bounds];
  objc_msgSend(v26, "setFrame:");

  v56[0] = v52;
  BOOL v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
  [v26 setFilters:v28];

  objc_super v29 = [v4 layer];
  [v29 addSublayer:v26];

  double v30 = CACurrentMediaTime();
  [MEMORY[0x1E4F39CF8] begin];
  double v31 = (void *)MEMORY[0x1E4F39CF8];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __91__CKConversationListCollectionViewController_Onboarding__animateOutBackgroundSnapshotView___block_invoke;
  v53[3] = &unk_1E5620AF8;
  id v54 = v26;
  id v55 = v4;
  id v32 = v4;
  id v33 = v26;
  [v31 setCompletionBlock:v53];
  id v34 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v34 setBeginTime:v30];
  [v34 setFromValue:&unk_1EDF163E8];
  [v34 setToValue:&unk_1EDF16400];
  [v34 setDuration:0.8];
  [v34 setMass:1.0];
  [v34 setDamping:50.0];
  [v34 setStiffness:300.0];
  uint64_t v35 = *MEMORY[0x1E4F39F98];
  [v34 setFillMode:*MEMORY[0x1E4F39F98]];
  [v33 addAnimation:v34 forKey:@"filters.gaussianBlur.inputRadius"];
  [v33 setValue:&unk_1EDF16400 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  double v36 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v36 setBeginTime:v30];
  [v36 setStiffness:309.319];
  [v36 setDamping:35.1749];
  [v36 setFromValue:&unk_1EDF17098];
  [v36 setToValue:&unk_1EDF17088];
  [v36 setDuration:0.525];
  [v36 setFillMode:v35];
  double v37 = [v32 layer];
  [v37 addAnimation:v36 forKey:@"opacity"];

  double v38 = [v13 layer];
  [v38 addAnimation:v36 forKey:@"opacity"];

  double v39 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v39 setBeginTime:v30];
  [v39 setDamping:16.788];
  [v39 setStiffness:70.4594];
  [v39 setFillMode:v35];
  double v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v7, v9);
  [v39 setFromValue:v40];

  double v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v7, v9 + 150.0);
  [v39 setToValue:v41];

  [v39 setDuration:1.1];
  uint64_t v42 = [v32 layer];
  [v42 addAnimation:v39 forKey:@"position"];

  id v43 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v43 setBeginTime:v30];
  [v43 setDamping:16.788];
  [v43 setStiffness:70.4594];
  [v43 setFillMode:v35];
  id v44 = (void *)MEMORY[0x1E4F29238];
  [v13 position];
  float v45 = objc_msgSend(v44, "valueWithCGPoint:");
  [v43 setFromValue:v45];

  v46 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v20, v23);
  [v43 setToValue:v46];

  [v43 setDuration:1.1];
  id v47 = [v13 layer];
  [v47 addAnimation:v43 forKey:@"position"];

  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v48 = [v32 layer];
  objc_msgSend(v48, "setPosition:", v7, v9 + 150.0);

  id v49 = [v32 layer];
  [v49 setOpacity:0.0];

  double v50 = [v13 layer];
  [v50 setOpacity:0.0];

  double v51 = [v13 layer];
  objc_msgSend(v51, "setPosition:", v20, v23);
}

uint64_t __91__CKConversationListCollectionViewController_Onboarding__animateOutBackgroundSnapshotView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperlayer];
  id v2 = *(void **)(a1 + 40);

  return [v2 removeFromSuperview];
}

- (void)pinConversationsWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self recommendedPinningConversations];
  unint64_t v6 = [v5 count];

  if (v6 >= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v6;
  }
  double v8 = [(CKConversationListCollectionViewController *)self recommendedPinningConversations];
  double v9 = objc_msgSend(v8, "subarrayWithRange:", 0, v7);

  [(CKConversationListCollectionViewController *)self setHoldPinningUpdatesForOnboardingAnimation:1];
  [(CKConversationListCollectionViewController *)self setHidePinsForAnimation:1];
  [(CKConversationListCollectionViewController *)self setIsCurrentlyAnimatingPinningOnboardingSuggestions:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    uint64_t v14 = *MEMORY[0x1E4F6BB80];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        [(CKConversationListCollectionViewController *)self togglePinStateForConversation:*(void *)(*((void *)&v21 + 1) + 8 * i) withReason:v14];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__CKConversationListCollectionViewController_Onboarding__pinConversationsWithCompletion___block_invoke;
  v18[3] = &unk_1E5623828;
  id v19 = v10;
  id v20 = v4;
  id v16 = v10;
  id v17 = v4;
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0 completion:v18];
}

uint64_t __89__CKConversationListCollectionViewController_Onboarding__pinConversationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)shouldAnimatePositionForRecommendedItemIdentifiers:(id)a3 pinnedItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __131__CKConversationListCollectionViewController_Onboarding__shouldAnimatePositionForRecommendedItemIdentifiers_pinnedItemIdentifiers___block_invoke;
  v10[3] = &unk_1E5624D48;
  id v8 = v6;
  id v11 = v8;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v10];
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __131__CKConversationListCollectionViewController_Onboarding__shouldAnimatePositionForRecommendedItemIdentifiers_pinnedItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) dataSource];
    id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    id v16 = [v7 indexPathForItemIdentifier:v8];

    double v9 = [*(id *)(a1 + 40) collectionView];
    id v10 = [v9 cellForItemAtIndexPath:v16];

    id v11 = [*(id *)(a1 + 40) collectionView];
    uint64_t v12 = [v11 indexPathsForVisibleItems];
    int v13 = [v12 containsObject:v16];

    if (!v13
      || !v10
      || ([v10 avatarView],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v14 isHidden],
          v14,
          v15))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

- (void)animateInPinsToFinalPosition
{
  id v3 = [(CKConversationListCollectionViewController *)self dataSource];
  id v4 = [v3 snapshot];
  id v5 = [v4 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16418];

  id v6 = [(CKConversationListCollectionViewController *)self dataSource];
  id v7 = [v6 snapshot];
  id v8 = [v7 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16430];

  LOBYTE(v7) = [(CKConversationListCollectionViewController *)self shouldAnimatePositionForRecommendedItemIdentifiers:v8 pinnedItemIdentifiers:v5];
  CFTimeInterval v9 = CACurrentMediaTime();
  id location = 0;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke;
  v12[3] = &unk_1E5624D98;
  id v10 = v8;
  id v13 = v10;
  uint64_t v14 = self;
  char v17 = (char)v7;
  v16[1] = *(id *)&v9;
  id v11 = v5;
  id v15 = v11;
  objc_copyWeak(v16, &location);
  [v11 enumerateObjectsUsingBlock:v12];
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
}

void __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count] > (unint64_t)a3)
  {
    id v6 = [*(id *)(a1 + 40) dataSource];
    uint64_t v7 = [v6 indexPathForItemIdentifier:v5];

    id v8 = [*(id *)(a1 + 40) collectionView];
    CFTimeInterval v9 = [v8 cellForItemAtIndexPath:v7];

    id v10 = [v9 contentView];
    [v10 setAlpha:1.0];

    id v11 = [*(id *)(a1 + 40) collectionView];
    [v11 bringSubviewToFront:v9];

    uint64_t v12 = [*(id *)(a1 + 40) dataSource];
    id v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    uint64_t v14 = [v12 indexPathForItemIdentifier:v13];

    id v15 = [*(id *)(a1 + 40) collectionView];
    id v16 = [v15 cellForItemAtIndexPath:v14];

    if (*(unsigned char *)(a1 + 72) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v17 = [v16 avatarView];
      [v17 setHidden:1];

      id v18 = [v16 avatarView];
      [v18 frame];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      BOOL v27 = [*(id *)(a1 + 40) collectionView];
      objc_msgSend(v16, "convertRect:toView:", v27, v20, v22, v24, v26);
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      double v35 = v34;
    }
    else
    {
      id v18 = [v9 pinnedConversationView];
      BOOL v27 = [v18 avatarView];
      [v27 frame];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      id v44 = [*(id *)(a1 + 40) collectionView];
      objc_msgSend(v9, "convertRect:toView:", v44, v37, v39, v41, v43);
      CGFloat v29 = v45;
      CGFloat v31 = v46;
      CGFloat v33 = v47;
      double v35 = v48;
    }
    [v9 frame];
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    v177.origin.double x = v29;
    v177.origin.double y = v31;
    v177.size.double width = v33;
    v177.size.double height = v35;
    double MidX = CGRectGetMidX(v177);
    v178.origin.double x = v29;
    v178.origin.double y = v31;
    v178.size.double width = v33;
    v178.size.double height = v35;
    double MidY = CGRectGetMidY(v178);
    v179.origin.double x = v50;
    v179.origin.double y = v52;
    v179.size.double width = v54;
    v179.size.double height = v56;
    double v58 = CGRectGetMidX(v179);
    v180.origin.double x = v50;
    v180.origin.double y = v52;
    v180.size.double width = v54;
    v180.size.double height = v56;
    double v59 = CGRectGetMidY(v180);
    uint64_t v60 = [v9 pinnedConversationView];
    id v61 = [v60 avatarView];
    [v61 bounds];
    double v63 = v35 / v62;

    memset(&v176, 0, sizeof(v176));
    uint64_t v64 = [v9 layer];
    v65 = v64;
    if (v64) {
      [v64 transform];
    }
    else {
      memset(&v175, 0, sizeof(v175));
    }
    CATransform3DScale(&v176, &v175, v63, v63, 1.0);

    [v9 frame];
    double v67 = v66;
    uint64_t v68 = [v9 pinnedConversationView];
    uint64_t v69 = [v68 avatarView];
    [v69 frame];
    double v71 = v70;

    double v72 = *(double *)(a1 + 64);
    [MEMORY[0x1E4F39CF8] begin];
    v73 = (void *)MEMORY[0x1E4F39CF8];
    v172[0] = MEMORY[0x1E4F143A8];
    v172[1] = 3221225472;
    v172[2] = __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke_2;
    v172[3] = &unk_1E5624D70;
    v174[1] = a3;
    id v173 = *(id *)(a1 + 48);
    objc_copyWeak(v174, (id *)(a1 + 56));
    [v73 setCompletionBlock:v172];
    long long v74 = [v9 unpinAccessoryView];
    long long v75 = [v74 layer];
    [v75 opacity];
    int v77 = v76;

    v78 = [v9 pinnedConversationView];
    double v79 = [v78 titleLabel];
    v80 = [v79 layer];
    [v80 opacity];
    int v166 = v81;

    double v82 = [v9 pinnedConversationView];
    double v83 = [v82 unreadIndicator];
    double v84 = [v83 layer];
    [v84 opacity];
    int v165 = v85;
    v163 = v16;
    v164 = (void *)v14;

    double v86 = [v9 pinnedConversationView];
    double v87 = [v86 radiantShadowImageView];
    double v88 = [v87 layer];
    [v88 opacity];
    int v162 = v89;

    double v90 = [v9 layer];
    double v91 = MidY + v63 * (v67 * 0.5 - v71 * 0.5) * 0.5;
    objc_msgSend(v90, "setPosition:", MidX, v91);

    CATransform3D v171 = v176;
    v92 = [v9 layer];
    CATransform3D v170 = v171;
    [v92 setTransform:&v170];

    id v93 = [v9 unpinAccessoryView];
    id v94 = [v93 layer];
    [v94 setOpacity:0.0];

    id v95 = [v9 pinnedConversationView];
    v96 = [v95 titleLabel];
    v97 = [v96 layer];
    [v97 setOpacity:0.0];

    v98 = [v9 pinnedConversationView];
    v99 = [v98 unreadIndicator];
    long long v100 = [v99 layer];
    [v100 setOpacity:0.0];

    long long v101 = [v9 pinnedConversationView];
    long long v102 = [v101 radiantShadowImageView];
    long long v103 = [v102 layer];
    [v103 setOpacity:0.0];

    long long v104 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
    [v104 setMass:2.0];
    [v104 setStiffness:300.0];
    [v104 setDamping:50.0];
    double v105 = v72 + 0.49 + (double)(unint64_t)a3 * 0.1;
    [v104 setBeginTime:v105];
    CATransform3D v169 = v176;
    long long v106 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v169];
    [v104 setFromValue:v106];

    long long v160 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v161 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v169.m31 = v161;
    *(_OWORD *)&v169.m33 = v160;
    long long v158 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v159 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v169.m41 = v159;
    *(_OWORD *)&v169.m43 = v158;
    long long v156 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v157 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v169.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v169.m13 = v156;
    long long v154 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v155 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v169.m21 = v155;
    *(_OWORD *)&v169.m23 = v154;
    long long v107 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v169];
    [v104 setToValue:v107];

    uint64_t v108 = *MEMORY[0x1E4F39F98];
    [v104 setFillMode:*MEMORY[0x1E4F39F98]];
    [v104 setDuration:0.8];
    v109 = [v9 layer];
    [v109 addAnimation:v104 forKey:@"transform"];

    v110 = [v9 unpinAccessoryView];
    v111 = [v110 layer];
    [v111 addAnimation:v104 forKey:@"transform"];

    v112 = (void *)v7;
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v113 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
      [v113 setMass:1.0];
      [v113 setStiffness:63.633];
      [v113 setDamping:15.9541];
      [v113 setBeginTime:v105];
      [v113 setDuration:1.1575];
      v114 = [NSNumber numberWithDouble:MidX];
      [v113 setFromValue:v114];

      v115 = [NSNumber numberWithDouble:v58];
      [v113 setToValue:v115];

      [v113 setFillMode:v108];
      v116 = [v9 layer];
      [v116 addAnimation:v113 forKey:@"position.x"];

      v117 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.y"];
      [v117 setMass:1.0];
      [v117 setStiffness:41.8381];
      [v117 setDamping:12.9365];
      [v117 setBeginTime:v105 + 0.1];
      [v117 setDuration:1.4275];
      v118 = [NSNumber numberWithDouble:v91];
      [v117 setFromValue:v118];

      v119 = [NSNumber numberWithDouble:v59];
      [v117 setToValue:v119];

      [v117 setFillMode:v108];
      v120 = [v9 layer];
      [v120 addAnimation:v117 forKey:@"position.y"];

      v121 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
      [v121 setMass:2.0];
      [v121 setStiffness:300.0];
      [v121 setDamping:50.0];
      [v121 setBeginTime:v105];
      v122 = [NSNumber numberWithFloat:0.0];
      [v121 setFromValue:v122];

      [v121 setDuration:0.8];
      [v121 setFillMode:v108];
      v123 = [v9 unpinAccessoryView];
      v124 = [v123 layer];
      [v124 addAnimation:v121 forKey:@"opacity"];

      v125 = [v9 pinnedConversationView];
      v126 = [v125 titleLabel];
      v127 = [v126 layer];
      [v127 addAnimation:v121 forKey:@"opacity"];

      v128 = [v9 pinnedConversationView];
      v129 = [v128 unreadIndicator];
      v130 = [v129 layer];
      [v130 addAnimation:v121 forKey:@"opacity"];

      v131 = [v9 pinnedConversationView];
      v132 = [v131 radiantShadowImageView];
      v133 = [v132 layer];
      [v133 addAnimation:v121 forKey:@"opacity"];
    }
    else
    {
      uint64_t v113 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
      [v113 setMass:2.0];
      [v113 setStiffness:300.0];
      [v113 setDamping:50.0];
      [v113 setBeginTime:v105];
      v134 = [NSNumber numberWithFloat:0.0];
      [v113 setFromValue:v134];

      LODWORD(v135) = 1.0;
      v136 = [NSNumber numberWithFloat:v135];
      [v113 setToValue:v136];

      [v113 setFillMode:v108];
      [v113 setDuration:1.5];
      v117 = [v9 layer];
      [v117 addAnimation:v113 forKey:@"opacity"];
    }

    v137 = [v9 layer];
    objc_msgSend(v137, "setPosition:", v58, v59);

    v138 = [v9 layer];
    v168[4] = v161;
    v168[5] = v160;
    v168[6] = v159;
    v168[7] = v158;
    v168[0] = v157;
    v168[1] = v156;
    v168[2] = v155;
    v168[3] = v154;
    [v138 setTransform:v168];

    v139 = [v9 unpinAccessoryView];
    v140 = [v139 layer];
    LODWORD(v141) = v77;
    [v140 setOpacity:v141];

    v142 = [v9 pinnedConversationView];
    v143 = [v142 titleLabel];
    v144 = [v143 layer];
    LODWORD(v145) = v166;
    [v144 setOpacity:v145];

    v146 = [v9 pinnedConversationView];
    v147 = [v146 unreadIndicator];
    v148 = [v147 layer];
    LODWORD(v149) = v165;
    [v148 setOpacity:v149];

    v150 = [v9 pinnedConversationView];
    v151 = [v150 radiantShadowImageView];
    v152 = [v151 layer];
    LODWORD(v153) = v162;
    [v152 setOpacity:v153];

    [MEMORY[0x1E4F39CF8] commit];
    objc_destroyWeak(v174);
  }
}

void __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == [*(id *)(a1 + 32) count] - 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained completeAnimation];
  }
}

- (void)removeNewlyPinnedSuggestionCells:(id)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 800000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke;
  v4[3] = &unk_1E56215C8;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsCurrentlyAnimatingPinningOnboardingSuggestions:0];

  dispatch_time_t v3 = (void *)MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke_2;
  v4[3] = &unk_1E56215C8;
  objc_copyWeak(&v5, v1);
  [v3 _animateUsingSpringWithDuration:0 delay:v4 options:0 mass:0.9775 stiffness:0.0 damping:1.0 initialVelocity:89.2259 animations:18.8919 completion:0.0];
  objc_destroyWeak(&v5);
}

void __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSnapshotAnimatingDifferences:1];
}

- (void)completeAnimation
{
  [(CKConversationListCollectionViewController *)self setHoldPinningUpdatesForOnboardingAnimation:0];
  [(CKConversationListCollectionViewController *)self setHidePinsForAnimation:0];
  id v4 = [(CKConversationListCollectionViewController *)self navigationController];
  dispatch_time_t v3 = [v4 view];
  [v3 setUserInteractionEnabled:1];
}

- (void)removeBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CKConversationListCollectionViewController *)self bannerHeight];
  double v8 = v7;
  CFTimeInterval v9 = [(CKConversationListCollectionViewController *)self bannerTopConstraint];
  if (v4)
  {
    id v10 = [(CKConversationListCollectionViewController *)self view];
    [v10 layoutIfNeeded];
    id v11 = (void *)MEMORY[0x1E4F42FF0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke;
    v17[3] = &unk_1E5625118;
    id v18 = v6;
    double v22 = v8;
    id v19 = v9;
    id v20 = v10;
    double v21 = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke_2;
    v13[3] = &unk_1E5625140;
    id v14 = v18;
    id v15 = v19;
    id v16 = self;
    id v12 = v10;
    [v11 animateWithDuration:v17 animations:v13 completion:0.3];
  }
  else
  {
    [v6 removeConstraint:v9];
    [(CKConversationListCollectionViewController *)self setBannerTopConstraint:0];
    [(CKConversationListCollectionViewController *)self setBannerHeight:0.0];
    [(CKConversationListCollectionViewController *)self setPresentedBanner:0];
    [v6 removeFromSuperview];
    [(CKConversationListCollectionViewController *)self _updateCollectionViewOffsetRemovingBannerViewHeight:v8];
  }
}

uint64_t __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setConstant:-*(double *)(a1 + 64)];
  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  [*(id *)(a1 + 48) layoutIfNeeded];
  [*(id *)(a1 + 56) setBannerHeight:0.0];
  uint64_t v2 = *(void **)(a1 + 56);
  double v3 = *(double *)(a1 + 64);

  return [v2 _updateCollectionViewOffsetRemovingBannerViewHeight:v3];
}

uint64_t __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeConstraint:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setBannerTopConstraint:0];
  [*(id *)(a1 + 48) setPresentedBanner:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 removeFromSuperview];
}

- (void)addBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(CKConversationListCollectionViewController *)self presentedBanner];

  if (v7)
  {
    double v8 = [(CKConversationListCollectionViewController *)self presentedBanner];
    [(CKConversationListCollectionViewController *)self removeBanner:v8 animated:0];
  }
  CFTimeInterval v9 = [v6 superview];

  if (v9) {
    [(CKConversationListCollectionViewController *)self removeBanner:v6 animated:0];
  }
  id v10 = [(CKConversationListCollectionViewController *)self view];
  if (v10)
  {
    [(CKConversationListCollectionViewController *)self setPresentedBanner:v6];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
    [v10 bounds];
    double v12 = v11;
    LODWORD(v11) = 1148846080;
    LODWORD(v13) = 1112014848;
    objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v12, 1.79769313e308, v11, v13);
    double v15 = v14;
    [(CKConversationListCollectionViewController *)self setBannerHeight:v14];
    id v16 = [v6 heightAnchor];
    [(CKConversationListCollectionViewController *)self bannerHeight];
    char v17 = objc_msgSend(v16, "constraintEqualToConstant:");
    [v17 setActive:1];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 addSubview:v6];
    id v18 = [v6 leadingAnchor];
    id v19 = [v10 leadingAnchor];
    id v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    double v21 = [v6 trailingAnchor];
    double v22 = [v10 trailingAnchor];
    double v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    [(CKConversationListCollectionViewController *)self updateBannerVisualEffectGroup];
    [(CKConversationListCollectionViewController *)self _updateScrollEdgeAppearanceProgress];
    double v24 = [v6 topAnchor];
    double v25 = [v10 safeAreaLayoutGuide];
    double v26 = [v25 topAnchor];
    if (v4)
    {
      BOOL v27 = [v24 constraintEqualToAnchor:v26 constant:-v15];
      [(CKConversationListCollectionViewController *)self setBannerTopConstraint:v27];

      double v28 = [(CKConversationListCollectionViewController *)self bannerTopConstraint];
      [v28 setActive:1];

      [v6 setAlpha:0.0];
      [v10 layoutIfNeeded];
      CGFloat v29 = (void *)MEMORY[0x1E4F42FF0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __74__CKConversationListCollectionViewController_Banners__addBanner_animated___block_invoke;
      v33[3] = &unk_1E5625168;
      id v34 = v6;
      double v35 = self;
      id v36 = v10;
      double v37 = v15;
      [v29 animateWithDuration:v33 animations:0.3];
    }
    else
    {
      CGFloat v31 = [v24 constraintEqualToAnchor:v26 constant:0.0];
      [(CKConversationListCollectionViewController *)self setBannerTopConstraint:v31];

      double v32 = [(CKConversationListCollectionViewController *)self bannerTopConstraint];
      [v32 setActive:1];

      [(CKConversationListCollectionViewController *)self _updateCollectionViewOffsetAddingBannerViewHeight:v15];
    }
  }
  else
  {
    double v30 = IMLogHandleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[CKConversationListCollectionViewController(Banners) addBanner:animated:](v6, v30);
    }
  }
}

uint64_t __74__CKConversationListCollectionViewController_Banners__addBanner_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = [*(id *)(a1 + 40) bannerTopConstraint];
  [v2 setConstant:0.0];

  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  [*(id *)(a1 + 48) layoutIfNeeded];
  double v3 = *(void **)(a1 + 40);
  double v4 = *(double *)(a1 + 56);

  return [v3 _updateCollectionViewOffsetAddingBannerViewHeight:v4];
}

- (id)initForOscarModal
{
  uint64_t v2 = [(CKConversationListCollectionViewController *)self init];
  double v3 = v2;
  if (v2)
  {
    [(CKConversationListCollectionViewController *)v2 setOscarModal:1];
    [(CKConversationListCollectionViewController *)v3 setFilterMode:9];
  }
  return v3;
}

- (void)oscarViewWillAppear:(BOOL)a3
{
  if ([(CKConversationListCollectionViewController *)self isOscarModal])
  {
    double v4 = [(CKConversationListCollectionViewController *)self navigationItem];
    [v4 setLargeTitleDisplayMode:2];
  }
  id v5 = [(CKConversationListCollectionViewController *)self collectionView];
  id v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];

  [(CKConversationListCollectionViewController *)self configureForOscarFilter];
  double v7 = [MEMORY[0x1E4F6EA88] sharedInstance];
  [v7 sendJunkInboxOpenedEvent];

  id v8 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v8 trackiMessageJunkEvent:3];
}

- (id)toolbarItemsForJunkFilterHasConversations:(BOOL)a3 hasSelectedConversations:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v12[3] = *MEMORY[0x1E4F143B8];
  double v7 = [(CKConversationListCollectionViewController *)self toggleReadButtonItem];
  [v7 setEnabled:v5];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
  CFTimeInterval v9 = [(CKConversationListCollectionViewController *)self _permanentDeleteButtonToUseForSelectedJunkConversations:v4];
  [v9 setEnabled:v5];
  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  return v10;
}

- (void)configureForOscarFilter
{
  if (!CKIsRunningInMacCatalyst())
  {
    double v3 = [(CKConversationListCollectionViewController *)self navigationItem];
    [v3 setSearchController:0];
  }
  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:0];
  [(CKConversationListCollectionViewController *)self _updateForCurrentEditingStateAnimated:0];
  BOOL v4 = +[CKConversationList sharedConversationList];
  id v6 = [v4 conversationsForFilterMode:9];

  BOOL v5 = +[CKConversationList sharedConversationList];
  [v5 updateEarliestMessageDateForConversations:v6];

  [(CKConversationListCollectionViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
}

- (id)showOscarModalAction
{
  double v3 = (void *)MEMORY[0x1E4F426E8];
  BOOL v4 = CKFrameworkBundle();
  BOOL v5 = [v4 localizedStringForKey:@"SHOW_OSCAR" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v6 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark.bin"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__CKConversationListCollectionViewController_Oscar__showOscarModalAction__block_invoke;
  v9[3] = &unk_1E56211C8;
  void v9[4] = self;
  double v7 = [v3 actionWithTitle:v5 image:v6 identifier:0 handler:v9];

  return v7;
}

uint64_t __73__CKConversationListCollectionViewController_Oscar__showOscarModalAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showOscarModalActionTapped];
}

- (void)_showOscarModalActionTapped
{
  id v3 = [[CKMessagesController alloc] initAsOscarModal];
  [v3 setModalPresentationStyle:2];
  [v3 setPreferredDisplayMode:1];
  [(CKConversationListCollectionViewController *)self presentViewController:v3 animated:1 completion:&__block_literal_global_76];
}

void __80__CKConversationListCollectionViewController_Oscar___showOscarModalActionTapped__block_invoke()
{
  if (IMOSLoggingEnabled())
  {
    os_log_t v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v1 = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Presented modal navigation controller", v1, 2u);
    }
  }
}

- (id)_permanentDeleteButtonToUseForSelectedJunkConversations:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(CKConversationListCollectionViewController *)self permanentDeleteSelectedJunkButtonItem];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F427C0]);
      id v6 = CKFrameworkBundle();
      double v7 = [v6 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v8 = (void *)[v5 initWithTitle:v7 style:0 target:self action:sel__permanentDeleteSelectedJunkButtonTapped_];

      [v8 accessibilitySetIdentification:@"deleteSelectedJunkButton"];
      [(CKConversationListCollectionViewController *)self setPermanentDeleteSelectedJunkButtonItem:v8];
    }
    CFTimeInterval v9 = [(CKConversationListCollectionViewController *)self permanentDeleteSelectedJunkButtonItem];
  }
  else
  {
    id v10 = [(CKConversationListCollectionViewController *)self permanentDeleteAllJunkButtonItem];

    if (!v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F427C0]);
      double v12 = CKFrameworkBundle();
      double v13 = [v12 localizedStringForKey:@"DELETE_ALL" value:&stru_1EDE4CA38 table:@"ChatKit"];
      double v14 = (void *)[v11 initWithTitle:v13 style:0 target:self action:sel__permanentDeleteAllJunkButtonTapped_];

      [v14 accessibilitySetIdentification:@"deleteAllJunkButton"];
      [(CKConversationListCollectionViewController *)self setPermanentDeleteAllJunkButtonItem:v14];
    }
    CFTimeInterval v9 = [(CKConversationListCollectionViewController *)self permanentDeleteAllJunkButtonItem];
  }

  return v9;
}

- (void)_permanentDeleteSelectedJunkButtonTapped:(id)a3
{
  id v4 = [(CKConversationListCollectionViewController *)self selectedConversations];
  [(CKConversationListCollectionViewController *)self presentPermanentJunkConversationDeletionConfirmation:v4];
}

- (void)_permanentDeleteAllJunkButtonTapped:(id)a3
{
  id v4 = +[CKConversationList sharedConversationList];
  id v5 = [v4 conversationsForFilterMode:9];

  [(CKConversationListCollectionViewController *)self presentPermanentJunkConversationDeletionConfirmation:v5];
}

- (void)presentPermanentJunkConversationDeletionConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  CFTimeInterval v9 = __106__CKConversationListCollectionViewController_Oscar__presentPermanentJunkConversationDeletionConfirmation___block_invoke;
  id v10 = &unk_1E5620AF8;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = _Block_copy(&v7);
  -[CKConversationListCollectionViewController presentPermanentJunkConversationDeletionConfirmation:alertsCompletedBlock:cancelBlock:](self, "presentPermanentJunkConversationDeletionConfirmation:alertsCompletedBlock:cancelBlock:", v5, v6, 0, v7, v8, v9, v10, v11);
}

uint64_t __106__CKConversationListCollectionViewController_Oscar__presentPermanentJunkConversationDeletionConfirmation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = [v2 isCollapsed];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 collectionView];
    [v4 _deselectSelectedIndexPathsInCollectionView:v5 animated:1];
  }
  [*(id *)(a1 + 32) setEditingMode:0 animated:1];
  id v6 = +[CKConversationList sharedConversationList];
  [v6 deleteConversations:*(void *)(a1 + 40)];

  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 leaveJunkFilterIfNeeded];
}

- (void)presentPermanentJunkConversationDeletionConfirmation:(id)a3 alertsCompletedBlock:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id location = 0;
  id v12 = objc_initWeak(&location, self);
  id v13 = objc_loadWeakRetained(&location);
  objc_msgSend(v11, "presentPermanentJunkDeletionConfirmationFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", self, v8, objc_msgSend(v13, "_alertControllerStyle"), v9, v10);

  objc_destroyWeak(&location);
}

- (void)presentJunkConversationRecoveryConfirmation:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__CKConversationListCollectionViewController_Oscar__presentJunkConversationRecoveryConfirmation___block_invoke;
  aBlock[3] = &unk_1E5620AF8;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = objc_loadWeakRetained(&location);
  objc_msgSend(v5, "presentRecoverJunkConversationsConfirmationFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", v8, v6, objc_msgSend(v8, "_alertControllerStyle"), v7, 0);

  objc_destroyWeak(&location);
}

uint64_t __97__CKConversationListCollectionViewController_Oscar__presentJunkConversationRecoveryConfirmation___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CKConversationList sharedConversationList];
  [v2 recoverJunkMessagesInConversations:*(void *)(a1 + 32)];

  char v3 = *(void **)(a1 + 40);

  return [v3 leaveJunkFilterIfNeeded];
}

- (void)leaveJunkFilterIfNeeded
{
  unint64_t v3 = [(CKConversationListCollectionViewController *)self filterMode];
  int v4 = IMOSLoggingEnabled();
  if (v3 == 9)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Checking if we need to leave the junk inbox", buf, 2u);
      }
    }
    [(CKConversationListCollectionViewController *)self _updateCollectionViewImmediatelyIfNeeded];
    id v6 = [(CKConversationListCollectionViewController *)self dataSource];
    uint64_t v7 = [v6 snapshot];

    if ([v7 numberOfItemsInSection:&unk_1EDF16490] <= 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Junk filtering | Leaving junk filter because no items left in activeConversationSection", v12, 2u);
        }
      }
      BOOL v9 = [(CKConversationListCollectionViewController *)self isOscarModal];
      id v10 = &selRef__dismissPresentedNavController_;
      if (!v9) {
        id v10 = &selRef__popToInbox;
      }
      [(CKConversationListCollectionViewController *)self performSelector:*v10 withObject:0 afterDelay:0.35];
    }
  }
  else if (v4)
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController Warning: Not viewing junk conversation controller. Not performing any action", v14, 2u);
    }
  }
}

- (id)junkConversationMenu:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self _removeFromJunkAction:v4];
  id v6 = [(CKConversationListCollectionViewController *)self _permanentDeleteJunkAction:v4];

  v10[0] = v5;
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v7];

  return v8;
}

- (id)_removeFromJunkAction:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"arrow.up.bin"];
  id v6 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"REMOVE_FROM_JUNK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__CKConversationListCollectionViewController_Oscar___removeFromJunkAction___block_invoke;
  v12[3] = &unk_1E5624B40;
  void v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  id v10 = [v6 actionWithTitle:v8 image:v5 identifier:0 handler:v12];

  return v10;
}

uint64_t __75__CKConversationListCollectionViewController_Oscar___removeFromJunkAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentJunkConversationRecoveryConfirmation:*(void *)(a1 + 40)];
}

- (id)_permanentDeleteJunkAction:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"trash"];
  id v6 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __80__CKConversationListCollectionViewController_Oscar___permanentDeleteJunkAction___block_invoke;
  double v15 = &unk_1E5624B40;
  id v16 = self;
  id v17 = v4;
  id v9 = v4;
  id v10 = [v6 actionWithTitle:v8 image:v5 identifier:0 handler:&v12];

  if (!CKIsRunningInMacCatalyst()) {
    objc_msgSend(v10, "setAttributes:", 2, v12, v13, v14, v15, v16, v17);
  }

  return v10;
}

uint64_t __80__CKConversationListCollectionViewController_Oscar___permanentDeleteJunkAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPermanentJunkConversationDeletionConfirmation:*(void *)(a1 + 40)];
}

id __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained supplementaryViewForIndexPath:v7 inCollectionView:v9 withKind:v8];

  return v11;
}

uint64_t __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_3()
{
  return 0;
}

void __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didReorderConversationsWithTransaction:v3];
}

- (id)supplementaryViewForIndexPath:(id)a3 inCollectionView:(id)a4 withKind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
  {
    id v11 = +[CKRecoverableSectionDisclosureView reuseIdentifier];
    uint64_t v12 = [v9 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v11 forIndexPath:v8];

    [v12 configureForRecentlyDeleted];
  }
  else if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    uint64_t v13 = +[CKRecoverableSectionDisclosureView reuseIdentifier];
    uint64_t v12 = [v9 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v13 forIndexPath:v8];

    [v12 configureForJunkFiltering];
  }
  else
  {
    double v14 = +[CKPinnedSectionSeparatorView reuseIdentifier];
    uint64_t v12 = [v9 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v14 forIndexPath:v8];
  }

  return v12;
}

- (id)cellForPinningOnboardingTitleViewCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CKPinningOnboardingTitleCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(CKConversationListCollectionViewController *)self configureOnboardingTitleCell:v9];

  return v9;
}

- (void)configureOnboardingTitleCell:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CKConversationListCollectionViewController *)self pinnedConversationViewLayoutStyle];
  id v6 = [(CKConversationListCollectionViewController *)self delegate];
  objc_msgSend(v4, "setPinnedConversationViewLayoutStyle:collapsedState:", v5, objc_msgSend(v6, "isCollapsed"));
}

- (id)cellForCollapsedSidebarFocusFilterCellInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CKFocusFilterBannerCollapsedCollectionViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(CKConversationListCollectionViewController *)self configureFocusFilterCollapsedCell:v9];

  return v9;
}

- (id)cellForFocusFilterInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CKFocusFilterBannerCollectionViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(CKConversationListCollectionViewController *)self configureFocusFilterCell:v9];

  return v9;
}

- (id)tipKitOnboardingCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CKTipKitOnboardingCollectionViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(CKConversationListCollectionViewController *)self configureTipKitOnboardingCell:v9];

  return v9;
}

- (id)tipCollectionViewCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CKTipCollectionViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(CKConversationListCollectionViewController *)self configureTipCollectionViewCell:v9];

  return v9;
}

- (void)configureTipKitOnboardingCell:(id)a3
{
  id v4 = a3;
  id v7 = [(CKConversationListCollectionViewController *)self tipManager];
  int64_t v5 = [v7 miniTipUIView];
  id v6 = [(CKConversationListCollectionViewController *)self recommendedPinningConversations];
  [v4 setTipUIView:v5 withRecommendedPinningConversations:v6];
}

- (void)configureTipCollectionViewCell:(id)a3
{
  id v4 = a3;
  id v6 = [(CKConversationListCollectionViewController *)self tipManager];
  int64_t v5 = [v6 miniTipUIView];
  [v4 setTipHostingView:v5];
}

- (id)cellForPinnedConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = +[CKPinnedConversationCollectionViewCell reuseIdentifier];
  uint64_t v12 = [v10 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v9];

  uint64_t v13 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v8];
  double v14 = [(CKConversationListCollectionViewController *)self previousPinnedConversationActivitySnapshotForConversation:v13];
  if (v14)
  {
    double v15 = [v12 pinnedConversationView];
    [v15 reapplyPreviouslyDisplayedActivitySnapshot:v14];
  }
  [(CKConversationListCollectionViewController *)self _configurePinnedConversationCell:v12 forConversation:v13 itemIdentifier:v8 indexPath:v9 animated:v14 != 0];

  return v12;
}

- (void)configurePinnedConversationCell:(id)a3 forItemIdentifier:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v11];
  [(CKConversationListCollectionViewController *)self _configurePinnedConversationCell:v12 forConversation:v13 itemIdentifier:v11 indexPath:v10 animated:v6];

  [v12 configureAppEntityForConversation:v13];
}

- (void)_configurePinnedConversationCell:(id)a3 forConversation:(id)a4 itemIdentifier:(id)a5 indexPath:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v39 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  double v15 = [v39 pinnedConversationView];
  [v15 setDelegate:self];
  [v15 setShowsLiveActivity:1];
  objc_msgSend(v15, "setActivityItemOriginationDirection:", -[CKConversationListCollectionViewController _activityItemOriginationDirectionForItemIdentifier:conversation:](self, "_activityItemOriginationDirectionForItemIdentifier:conversation:", v13, v12));
  objc_msgSend(v15, "setLayoutStyle:", -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));
  [(CKConversationListCollectionViewController *)self _activityItemTopInsetForIndexPath:v14];
  double v17 = v16;

  [v15 setActivityItemTopInset:v17];
  id v18 = [(CKConversationListCollectionViewController *)self delegate];
  objc_msgSend(v39, "setShowsBackgroundViewWhenSelected:", objc_msgSend(v18, "isCollapsed") ^ 1);

  id v19 = [(CKConversationListCollectionViewController *)self delegate];
  objc_msgSend(v39, "setAllowActivitySuppressionWhenSelected:", objc_msgSend(v19, "isCollapsed") ^ 1);

  id v20 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v21 = [v20 conversationPinningUsesLastNameForDuplicatesEnabled];

  if (v21)
  {
    double v22 = [(CKConversationListCollectionViewController *)self _pinnedConversationShortNames];
    double v23 = [v12 pinnedConversationDisplayNamePreferringShortName:1];
    objc_msgSend(v15, "setPreferShortConversationName:", objc_msgSend(v22, "countForObject:", v23) < 2);
  }
  else
  {
    [v15 setPreferShortConversationName:1];
  }
  double v24 = +[CKUIBehavior sharedBehaviors];
  unint64_t v25 = [v24 messageCountToLoadForPinnedConversationsIfNecessary];

  if (![v12 hasUnreadMessages] || v25 <= objc_msgSend(v12, "limitToLoad")) {
    goto LABEL_12;
  }
  double v26 = [v12 chat];
  BOOL v27 = [v26 lastIncomingFinishedMessage];

  if ([v12 isGroupConversation])
  {
    int v28 = [v12 isAdHocGroupConversation] ^ 1;
    if (!v27) {
      goto LABEL_11;
    }
LABEL_10:
    if (!v28) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  int v28 = 0;
  if (v27) {
    goto LABEL_10;
  }
LABEL_11:
  [v12 setLoadedMessageCount:v25];
LABEL_12:
  CGFloat v29 = [(CKConversationListCollectionViewController *)self _recentMessagesInPinnedConversations];
  [v15 setConversation:v12];
  [v15 setRecentMessagesInPinnedConversations:v29];
  double v30 = [v12 chat];
  char v31 = [v30 allowedByScreenTime];

  if (v31) {
    [v15 endSuppressingActivityWithReason:@"ScreenTime" animated:v7 completion:0];
  }
  else {
    [v15 beginSuppressingActivityWithReason:@"ScreenTime" animated:v7 completion:0];
  }
  double v32 = [(CKConversationListCollectionViewController *)self itemIdentifiersForVisibleContextMenuInteractions];
  int v33 = [v32 containsObject:v13];

  if (v33)
  {
    id v34 = [v39 pinnedConversationView];
    [v34 setDimmed:0];

    [v15 beginSuppressingActivityWithReason:@"ContextMenuInteraction" animated:v7 completion:0];
  }
  else
  {
    [v15 endSuppressingActivityWithReason:@"ContextMenuInteraction" animated:v7 completion:0];
  }
  double v35 = [MEMORY[0x1E4F6E788] sharedManager];
  if ([v35 shouldFilterConversationsByFocus]) {
    uint64_t v36 = [v12 allowedByPersonListInActiveFocus] ^ 1;
  }
  else {
    uint64_t v36 = 0;
  }
  [v15 setIsFilteredByFocus:v36 animated:v7];
  [v39 setDelegate:self];
  objc_msgSend(v39, "setEditingMode:animated:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"), v7);
  if ([(CKConversationListCollectionViewController *)self hidePinsForAnimation]) {
    double v37 = 0.0;
  }
  else {
    double v37 = 1.0;
  }
  double v38 = [v39 contentView];
  [v38 setAlpha:v37];

  [v15 updateActivityViewAnimated:v7 completion:0];
}

- (double)_activityItemTopInsetForIndexPath:(id)a3
{
  id v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    if ((unint64_t)([v3 item] + 2) >= 5) {
      double v4 = 0.0;
    }
    else {
      double v4 = 5.0;
    }
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (int64_t)_activityItemOriginationDirectionForItemIdentifier:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKConversationListCollectionViewController *)self dataSource];
  id v9 = [v8 snapshot];
  uint64_t v10 = [v9 numberOfItemsInSection:&unk_1EDF16610];

  id v11 = [(CKConversationListCollectionViewController *)self dataSource];
  id v12 = [v11 indexPathForItemIdentifier:v6];

  if (v10 < 2) {
    goto LABEL_4;
  }
  uint64_t v13 = [v12 item];
  if (v10 != 2)
  {
    if (v13 % 3 != 1) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v14 = [(CKConversationListCollectionViewController *)self _isOnlyActivityItemInRowForConversation:v7 itemIdentifier:v6] ^ 1;
    goto LABEL_7;
  }
  if (v13 == 1) {
    goto LABEL_6;
  }
LABEL_4:
  int64_t v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)_conversationHasActivityItem:(id)a3
{
  id v3 = a3;
  if ([v3 hasUnreadMessages])
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [v3 chat];
    id v6 = [v5 lastIncomingMessage];
    char v4 = [v6 isTypingMessage];
  }
  return v4;
}

- (BOOL)_isOnlyActivityItemInRowForConversation:(id)a3 itemIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(CKConversationListCollectionViewController *)self _conversationHasActivityItem:a3])
  {
    id v7 = [(CKConversationListCollectionViewController *)self _conversationsInRowOfItemIdentifier:v6];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          v10 += [(CKConversationListCollectionViewController *)self _conversationHasActivityItem:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
      BOOL v13 = v10 == 1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_conversationsInRowOfItemIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(CKConversationListCollectionViewController *)self dataSource];
  id v6 = [v5 indexPathForItemIdentifier:v4];

  uint64_t v7 = [v6 item];
  uint64_t v8 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v9 = [v8 snapshot];
  uint64_t v10 = [v9 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16610];

  uint64_t v11 = [v10 count];
  id v12 = +[CKUIBehavior sharedBehaviors];
  uint64_t v13 = [v12 conversationListLayoutPinnedSectionNumberOfColumns];

  uint64_t v14 = v7 / v13 * v13;
  if (v13 >= (unint64_t)(v11 - v14)) {
    uint64_t v15 = v11 - v14;
  }
  else {
    uint64_t v15 = v13;
  }
  long long v16 = objc_msgSend(v10, "subarrayWithRange:", v14, v15);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", *(void *)(*((void *)&v26 + 1) + 8 * i), (void)v26);
        if (v23) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }

  double v24 = (void *)[v17 copy];

  return v24;
}

- (id)_recentMessagesInPinnedConversations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CKConversationListCollectionViewController *)self pinnedConversations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) chat];
        uint64_t v10 = [v9 lastIncomingFinishedMessage];

        if (v10 && ([v10 isRead] & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v3 sortUsingComparator:&__block_literal_global_97_1];
  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

uint64_t __94__CKConversationListCollectionViewController_DataSource___recentMessagesInPinnedConversations__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 comparisonType:3];
}

- (id)_pinnedConversationShortNames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CKConversationListCollectionViewController *)self pinnedConversations];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) pinnedConversationDisplayNamePreferringShortName:1];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)cellForPinnedConversationDropTargetInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CKPinnedConversationDropTargetCollectionViewCell reuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(CKConversationListCollectionViewController *)self configureDropTargetCell:v9];

  return v9;
}

- (void)configureDropTargetCell:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "setLayoutStyle:", -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));
  unint64_t v4 = [(CKConversationListCollectionViewController *)self editingMode];
  BOOL v5 = v4 == 2;
  [v6 setShouldAnimateCircle:v4 != 2];
  [v6 setShouldHideLabel:v5];
}

- (id)newMessageCellInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CKConversationListNewMessageCollectionViewCell reuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(CKConversationListCollectionViewController *)self configureNewMessageCell:v9];
  return v9;
}

- (void)configureNewMessageCell:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(CKConversationListCollectionViewController *)self delegate];
  objc_msgSend(v7, "setShouldUseSidebarBackgroundConfiguration:", objc_msgSend(v4, "isCollapsed") ^ 1);

  [v7 setDelegate:self];
  [v7 updateFontSize];
  if (v7)
  {
    BOOL v5 = [(CKConversationListCollectionViewController *)self conversationList];
    id v6 = [v5 pendingConversation];
    [v7 updateContentsForConversation:v6];
  }
}

- (id)cellPinningOnboardingItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = +[CKConversationListCollectionViewConversationCell reuseIdentifier];
  long long v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

  [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v12];
  [(CKConversationListCollectionViewController *)self configureConversationCell:v12 forItemIdentifier:v10];

  return v12;
}

- (id)cellForRecoverableConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    long long v11 = [(CKConversationListCollectionViewController *)self junkCellLayout];
    long long v12 = off_1E561D650;
LABEL_5:
    [(CKConversationListCollectionViewController *)self setCellLayout:v11];

    long long v13 = [(__objc2_class *)*v12 reuseIdentifier];
    long long v14 = [v8 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v9];

    goto LABEL_7;
  }
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
  {
    long long v11 = [(CKConversationListCollectionViewController *)self standardCellLayout];
    long long v12 = off_1E561D660;
    goto LABEL_5;
  }
  long long v14 = 0;
LABEL_7:
  [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v14];
  [(CKConversationListCollectionViewController *)self configureRecoverableConversationCell:v14 forItemIdentifier:v10];

  return v14;
}

- (void)configureRecoverableConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CKConversationListCollectionViewController *)self _ensureCellLayoutOnCell:v7];
  id v9 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];

  [v7 setEmbeddedCellDelegate:self];
  objc_msgSend(v7, "updateContentsForConversation:fastPreview:", v9, -[CKConversationListCollectionViewController shouldUseFastPreviewText](self, "shouldUseFastPreviewText"));
  id v8 = [(CKConversationListCollectionViewController *)self delegate];
  objc_msgSend(v7, "setShouldUseSidebarBackgroundConfiguration:", objc_msgSend(v8, "isCollapsed") ^ 1);

  objc_msgSend(v7, "setEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  [v7 setDelegate:self];
}

- (void)avatarViewTapped:(id)a3
{
  id v4 = a3;
  id v9 = [(CKConversationListCollectionViewController *)self collectionView];
  BOOL v5 = [v4 originatingItemIdentifier];

  id v6 = [(CKConversationListCollectionViewController *)self dataSource];
  id v7 = [v6 indexPathForItemIdentifier:v5];

  [v9 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
  id v8 = [v9 delegate];
  [v8 collectionView:v9 didSelectItemAtIndexPath:v7];
}

- (id)pinnedConversationIdentifiers
{
  uint64_t v2 = [(CKConversationListCollectionViewController *)self pinnedConversations];
  id v3 = [v2 arrayByApplyingSelector:sel_pinningIdentifier];

  return v3;
}

- (id)_allFrozenConversations
{
  id v3 = [(CKConversationListCollectionViewController *)self frozenPinnedConversations];
  id v4 = [(CKConversationListCollectionViewController *)self frozenConversations];
  BOOL v5 = v4;
  if (v3 && v4)
  {
    id v6 = [v3 arrayByAddingObjectsFromArray:v4];
LABEL_8:
    id v7 = v6;
    goto LABEL_9;
  }
  if (v3)
  {
    id v6 = v3;
    goto LABEL_8;
  }
  if (v4)
  {
    id v6 = v4;
    goto LABEL_8;
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (void)_removeConversationsFromFrozenConversations:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F28F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__CKConversationListCollectionViewController_DataSource___removeConversationsFromFrozenConversations___block_invoke;
  v12[3] = &unk_1E5627AB0;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 predicateWithBlock:v12];
  id v8 = [(CKConversationListCollectionViewController *)self frozenPinnedConversations];
  id v9 = [v8 filteredArrayUsingPredicate:v7];

  [(CKConversationListCollectionViewController *)self setFrozenPinnedConversations:v9];
  id v10 = [(CKConversationListCollectionViewController *)self frozenConversations];
  long long v11 = [v10 filteredArrayUsingPredicate:v7];

  [(CKConversationListCollectionViewController *)self setFrozenConversations:v11];
}

uint64_t __102__CKConversationListCollectionViewController_DataSource___removeConversationsFromFrozenConversations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 chat];
  id v4 = [v3 guid];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "chat", (void)v15);
        long long v11 = [v10 guid];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

- (id)conversationsAtIndexPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v12 = (void *)[v5 copy];

  return v12;
}

- (BOOL)_messageSpamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (void)_appendRecentlyDeletedIdentifersToSnapshot:(id)a3
{
  id v7 = a3;
  id v4 = [(CKConversationListCollectionViewController *)self conversationList];
  id v5 = [v4 conversationsForFilterMode:7];

  id v6 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v5 inSection:6];
  if ([v6 count]) {
    [v7 appendItemsWithIdentifiers:v6];
  }
}

- (void)updateContentsOfCellsWithItemIdentifiers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * v10++) animated:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)pinnedConversationsFromSnapshot:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = v4;
  id v6 = [v4 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16610];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier];
        char v13 = [v11 isEqualToString:v12];

        if ((v13 & 1) == 0)
        {
          long long v14 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v11];
          if (v14) {
            [v5 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  long long v15 = (void *)[v5 copy];

  return v15;
}

- (BOOL)itemIdentifierIsFromPinnedSection:(id)a3
{
  return [a3 hasPrefix:@"pinned-"];
}

- (id)conversationsForItemIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)[v5 copy];

  return v12;
}

- (double)yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self dataSource];
  id v6 = [v5 snapshot];

  double MinY = 0.0;
  if ([v6 indexOfSectionIdentifier:&unk_1EDF16688] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_22;
  }
  uint64_t v8 = [v6 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16688];
  uint64_t v9 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v4 inSection:5];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v8;
  id v11 = (id)[v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (([v9 containsObject:v14] & 1) == 0)
        {
          id v11 = v14;
          goto LABEL_12;
        }
      }
      id v11 = (id)[v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if ([v11 length])
  {
    long long v15 = [(CKConversationListCollectionViewController *)self dataSource];
    long long v16 = [v15 indexPathForItemIdentifier:v11];

    if (v16)
    {
      long long v17 = [(CKConversationListCollectionViewController *)self collectionView];
      long long v18 = [v17 layoutAttributesForItemAtIndexPath:v16];

      if (v18)
      {
        [v18 frame];
        double MinY = CGRectGetMinY(v44);
      }
      else
      {
        double MinY = 0.0;
      }
    }
    else
    {
      double MinY = 0.0;
    }
  }
  else
  {
    double MinY = 0.0;
  }

  if (MinY == 0.0)
  {
LABEL_22:
    if ([v6 indexOfSectionIdentifier:&unk_1EDF16610] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v19 = [v6 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16610];
      long long v20 = [(CKConversationListCollectionViewController *)self itemIdentifiersForConversations:v4 inSection:2];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v21 = [v19 reverseObjectEnumerator];
      id v22 = (id)[v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v34;
        while (2)
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v21);
            }
            unint64_t v25 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
            if (([v20 containsObject:v25] & 1) == 0)
            {
              id v22 = v25;
              goto LABEL_33;
            }
          }
          id v22 = (id)[v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
LABEL_33:

      if ([v22 length])
      {
        long long v26 = [(CKConversationListCollectionViewController *)self dataSource];
        long long v27 = [v26 indexPathForItemIdentifier:v22];

        if (v27)
        {
          long long v28 = [(CKConversationListCollectionViewController *)self collectionView];
          long long v29 = [v28 layoutAttributesForItemAtIndexPath:v27];

          if (v29)
          {
            [v29 frame];
            double MinY = CGRectGetMaxY(v45);
          }
        }
      }
    }
  }
  if (MinY == 0.0 && IMOSLoggingEnabled())
  {
    double v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v32 = 0;
      _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Could not determine yCoordinateForBorderBetweenPinnedAndActiveSection.", v32, 2u);
    }
  }
  return MinY;
}

- (CGRect)pinnedConversationMultitaskingDragExclusionRect
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [(CKConversationListCollectionViewController *)self yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:MEMORY[0x1E4F1CBF0]];
  if (v7 != 0.0)
  {
    double v8 = v7;
    uint64_t v9 = [(CKConversationListCollectionViewController *)self collectionView];
    [v9 contentInset];
    double v11 = v8 - v10;
    if (v11 > 0.0)
    {
      double v12 = v10;
      [v9 bounds];
      double v14 = v13;
      [v9 bounds];
      double v16 = v15;
      long long v17 = [(CKConversationListCollectionViewController *)self view];
      long long v18 = [(CKConversationListCollectionViewController *)self collectionView];
      objc_msgSend(v17, "convertRect:fromView:", v18, v14, v12, v16, v11);
      double v3 = v19;
      double v4 = v20;
      double v5 = v21;
      double v6 = v22;
    }
  }
  double v23 = v3;
  double v24 = v4;
  double v25 = v5;
  double v26 = v6;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (id)nextSequentialIndexPathForIndexPath:(id)a3 descending:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(CKConversationListCollectionViewController *)self dataSource];
  double v8 = [v7 snapshot];

  if (!v4)
  {
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    *((void *)&v42 + 1) = 0;
    long long v43 = 0uLL;
    long long v18 = objc_msgSend(&unk_1EDF154E8, "reverseObjectEnumerator", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (!v19) {
      goto LABEL_26;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v43;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v24 = [v8 numberOfItemsInSection:v23];
        uint64_t v25 = v24 - 1;
        if (v24 >= 1)
        {
          uint64_t v26 = [v6 section];
          if (v26 >= [v23 integerValue])
          {
            uint64_t v27 = [v6 section];
            if (v27 != [v23 integerValue])
            {
              long long v28 = (void *)MEMORY[0x1E4F28D58];
              uint64_t v29 = [v23 integerValue];
              double v30 = v28;
              uint64_t v31 = v25;
LABEL_35:
              long long v17 = [v30 indexPathForItem:v31 inSection:v29];
              goto LABEL_36;
            }
            if ([v6 item] >= 1)
            {
              uint64_t v38 = [v6 item];
              if (v38 - 1 >= v25) {
                uint64_t v39 = v25;
              }
              else {
                uint64_t v39 = v38 - 1;
              }
              long long v40 = (void *)MEMORY[0x1E4F28D58];
              uint64_t v29 = [v23 integerValue];
              double v30 = v40;
              uint64_t v31 = v39;
              goto LABEL_35;
            }
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (!v20)
      {
LABEL_26:
        long long v17 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
  }
  long long v48 = 0uLL;
  long long v49 = 0uLL;
  long long v46 = 0uLL;
  long long v47 = 0uLL;
  uint64_t v9 = [&unk_1EDF154E8 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v9)
  {
    long long v17 = 0;
    goto LABEL_37;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v47;
  while (2)
  {
    for (uint64_t j = 0; j != v10; ++j)
    {
      if (*(void *)v47 != v11) {
        objc_enumerationMutation(&unk_1EDF154E8);
      }
      double v13 = *(void **)(*((void *)&v46 + 1) + 8 * j);
      uint64_t v14 = [v8 numberOfItemsInSection:v13];
      uint64_t v15 = [v6 section];
      if (v15 <= [v13 integerValue])
      {
        uint64_t v16 = [v6 section];
        if (v16 == [v13 integerValue])
        {
          if ([v6 item] < v14 - 1)
          {
            double v32 = (void *)MEMORY[0x1E4F28D58];
            uint64_t v33 = [v6 item] + 1;
            uint64_t v34 = [v13 integerValue];
            long long v35 = v32;
            uint64_t v36 = v33;
LABEL_30:
            long long v17 = [v35 indexPathForItem:v36 inSection:v34];
            goto LABEL_37;
          }
        }
        else if (v14 >= 1)
        {
          long long v37 = (void *)MEMORY[0x1E4F28D58];
          uint64_t v34 = [v13 integerValue];
          long long v35 = v37;
          uint64_t v36 = 0;
          goto LABEL_30;
        }
      }
    }
    uint64_t v10 = [&unk_1EDF154E8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    long long v17 = 0;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_37:

  return v17;
}

- (int64_t)distanceBetweenConversationIndexPath:(id)a3 andIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 section];
  if (v8 == [v7 section])
  {
    uint64_t v9 = [v7 item];
    uint64_t v10 = [v6 item];
    if (v9 - v10 >= 0) {
      int64_t v11 = v9 - v10;
    }
    else {
      int64_t v11 = v10 - v9;
    }
  }
  else
  {
    uint64_t v12 = [v6 section];
    uint64_t v13 = [v7 section];
    if (v12 >= v13) {
      uint64_t v14 = v7;
    }
    else {
      uint64_t v14 = v6;
    }
    if (v12 >= v13) {
      uint64_t v15 = v6;
    }
    else {
      uint64_t v15 = v7;
    }
    id v16 = v14;
    id v17 = v15;
    long long v18 = [(CKConversationListCollectionViewController *)self dataSource];
    uint64_t v19 = [v18 snapshot];

    uint64_t v20 = [v16 section];
    if (v20 <= [v17 section])
    {
      int64_t v11 = 0;
      do
      {
        uint64_t v21 = [NSNumber numberWithInteger:v20];
        uint64_t v22 = [v19 numberOfItemsInSection:v21];

        if (v20 == [v16 section]) {
          int64_t v11 = v22 + v11 - [v16 item];
        }
        if (v20 == [v17 section]) {
          uint64_t v22 = [v17 item];
        }
        v11 += v22;
      }
      while (v20++ < [v17 section]);
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  return v11;
}

- (id)selectedConversations
{
  double v3 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v4 = [(CKConversationListCollectionViewController *)self collectionView];
  double v5 = [v4 indexPathsForSelectedItems];
  id v6 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v8 = [v7 indexPathsForSelectedItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__CKConversationListCollectionViewController_DataSource__selectedConversations__block_invoke;
  v13[3] = &unk_1E5627AD8;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  [v8 enumerateObjectsUsingBlock:v13];

  uint64_t v10 = v14;
  id v11 = v9;

  return v11;
}

void __79__CKConversationListCollectionViewController_DataSource__selectedConversations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) conversationAtIndexPath:v3];
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | No conversation for selected index path: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)pinnedConversationView:(id)a3 didUpdateWithActivitySnapshot:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(CKConversationListCollectionViewController *)self cacheForLastDisplayedActivitySnapshotByConversation];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(CKConversationListCollectionViewController *)self setCacheForLastDisplayedActivitySnapshotByConversation:v8];
  }
  id v9 = [v13 conversation];
  uint64_t v10 = [(CKConversationListCollectionViewController *)self _lastDisplayedActivitySnapshotCacheKeyForConversation:v9];
  id v11 = v10;
  if (v6 && [v10 length])
  {
    uint64_t v12 = [(CKConversationListCollectionViewController *)self cacheForLastDisplayedActivitySnapshotByConversation];
    [v12 setObject:v6 forKey:v11];
  }
}

- (id)previousPinnedConversationActivitySnapshotForConversation:(id)a3
{
  BOOL v4 = [(CKConversationListCollectionViewController *)self _lastDisplayedActivitySnapshotCacheKeyForConversation:a3];
  if ([v4 length])
  {
    double v5 = [(CKConversationListCollectionViewController *)self cacheForLastDisplayedActivitySnapshotByConversation];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_lastDisplayedActivitySnapshotCacheKeyForConversation:(id)a3
{
  return (id)[a3 pinningIdentifier];
}

- (id)initForRecentlyDeletedModal
{
  uint64_t v2 = [(CKConversationListCollectionViewController *)self init];
  id v3 = v2;
  if (v2)
  {
    [(CKConversationListCollectionViewController *)v2 setRecentlyDeletedModal:1];
    [(CKConversationListCollectionViewController *)v3 setFilterMode:7];
    [(CKConversationListCollectionViewController *)v3 setEditingMode:1 animated:0];
  }
  return v3;
}

- (void)recentlyDeletedViewWillAppear:(BOOL)a3
{
  if ([(CKConversationListCollectionViewController *)self isRecentlyDeletedModal])
  {
    BOOL v4 = [(CKConversationListCollectionViewController *)self navigationItem];
    [v4 setLargeTitleDisplayMode:2];
  }

  [(CKConversationListCollectionViewController *)self configureForRecentlyDeletedFilter];
}

- (void)configureForRecentlyDeletedFilter
{
  [(CKConversationListCollectionViewController *)self setEditingMode:1 animated:0];
  [(CKConversationListCollectionViewController *)self _updateForCurrentEditingStateAnimated:0];
  if (CKIsRunningInMacCatalyst())
  {
    [(CKConversationListCollectionViewController *)self _configureCatalystFiltersNavigation];
  }
  else
  {
    id v3 = [(CKConversationListCollectionViewController *)self navigationItem];
    [v3 setSearchController:0];
  }
  [(CKConversationListCollectionViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  BOOL v4 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__CKConversationListCollectionViewController_RecentlyDeleted__configureForRecentlyDeletedFilter__block_invoke;
  v6[3] = &unk_1E5620C40;
  void v6[4] = self;
  [v4 updateRecoverableMessagesMetadataSynchronously:0 loadChats:1 completionHandler:v6];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__reloadRecoverableMetadataForNotification_ name:*MEMORY[0x1E4F6BA30] object:0];
  [v5 addObserver:self selector:sel__reloadRecoverableMetadataForNotification_ name:*MEMORY[0x1E4F6BA20] object:0];
}

uint64_t __96__CKConversationListCollectionViewController_RecentlyDeleted__configureForRecentlyDeletedFilter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) conversationList];
  [v2 updateRecoverableConversationList];

  [*(id *)(a1 + 32) updateSnapshotAnimatingDifferences:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 _setNeedsUpdateContentUnavailableConfiguration];
}

- (void)presentRecoverableDeleteConfirmationsWithConversations:(id)a3 collapsedAppearance:(BOOL)a4 alertsCompletedBlock:(id)a5 cancelBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id location = 0;
  objc_initWeak(&location, self);
  id v13 = objc_opt_new();
  id v14 = objc_loadWeakRetained(&location);
  objc_msgSend(v13, "presentRecoverableDeletionConfirmationsFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", v14, v10, -[CKConversationListCollectionViewController _alertControllerStyleForCollapsedState:](self, "_alertControllerStyleForCollapsedState:", v8), v11, v12);

  objc_destroyWeak(&location);
}

- (void)_performRecoverableDeletionForConversations:(id)a3 deleteDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "[Recently Deleted] Recoverable deletion confirmed", buf, 2u);
    }
  }
  [(CKConversationListCollectionViewController *)self _removeConversationsFromFrozenConversations:v6];
  id v9 = [(CKConversationListCollectionViewController *)self delegate];
  [v9 conversationListIsDeletingConversations:v6];

  id v10 = [(CKConversationListCollectionViewController *)self conversationList];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __118__CKConversationListCollectionViewController_RecentlyDeleted___performRecoverableDeletionForConversations_deleteDate___block_invoke;
  v11[3] = &unk_1E5620C40;
  v11[4] = self;
  [v10 recoverableDeleteForConversations:v6 deleteDate:v7 synchronousQuery:0 completionHandler:v11];

  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
}

void __118__CKConversationListCollectionViewController_RecentlyDeleted___performRecoverableDeletionForConversations_deleteDate___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) conversationList];
  [v1 updateConversationListsAndSortIfEnabled];
}

- (void)_presentPermanentDeletionConfirmationsForConversations:(id)a3
{
  id v4 = a3;
  double v5 = [(CKConversationListCollectionViewController *)self delegate];
  uint64_t v6 = [v5 isCollapsed];

  id location = 0;
  objc_initWeak(&location, self);
  id v7 = objc_opt_new();
  id v8 = objc_loadWeakRetained(&location);
  int64_t v9 = [(CKConversationListCollectionViewController *)self _alertControllerStyleForCollapsedState:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __118__CKConversationListCollectionViewController_RecentlyDeleted___presentPermanentDeletionConfirmationsForConversations___block_invoke;
  v11[3] = &unk_1E5622AB8;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v7 presentPermanentDeletionConfirmationFromViewController:v8 forConversations:v10 alertControllerStyle:v9 alertsCompletedBlock:v11 cancelBlock:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __118__CKConversationListCollectionViewController_RecentlyDeleted___presentPermanentDeletionConfirmationsForConversations___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _permanentDeletionConfirmedForConversations:*(void *)(a1 + 32)];
}

- (void)_permanentDeletionConfirmedForConversations:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Permanent deletion confirmed", buf, 2u);
    }
  }
  [(CKConversationListCollectionViewController *)self _removeConversationsFromFrozenConversations:v4];
  uint64_t v6 = [(CKConversationListCollectionViewController *)self delegate];
  [v6 conversationListIsDeletingConversations:v4];

  id v7 = [(CKConversationListCollectionViewController *)self conversationList];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke;
  v8[3] = &unk_1E5620C40;
  void v8[4] = self;
  [v7 permanentlyDeleteRecoverableMessagesInConversations:v4 synchronousQuery:0 completionHandler:v8];
}

uint64_t __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) conversationList];
  [v2 updateRecoverableConversationList];

  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke_2;
  v5[3] = &unk_1E5620C40;
  v5[4] = v3;
  return [v3 updateSnapshotAnimatingDifferences:1 completion:v5];
}

uint64_t __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removalCompleted];
}

- (void)_presentRecoverConfirmationsForConversations:(id)a3
{
  id v4 = a3;
  double v5 = [(CKConversationListCollectionViewController *)self delegate];
  uint64_t v6 = [v5 isCollapsed];

  id location = 0;
  objc_initWeak(&location, self);
  id v7 = objc_opt_new();
  id v8 = objc_loadWeakRetained(&location);
  int64_t v9 = [(CKConversationListCollectionViewController *)self _alertControllerStyleForCollapsedState:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___presentRecoverConfirmationsForConversations___block_invoke;
  v11[3] = &unk_1E5622AB8;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v7 presentRecoverDeletedConversationsConfirmationFromViewController:v8 forConversations:v10 alertControllerStyle:v9 alertsCompletedBlock:v11 cancelBlock:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __108__CKConversationListCollectionViewController_RecentlyDeleted___presentRecoverConfirmationsForConversations___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _recoverConfirmedForConversations:*(void *)(a1 + 32)];
}

- (void)_recoverConfirmedForConversations:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recovery confirmed", buf, 2u);
    }
  }
  [(CKConversationListCollectionViewController *)self _removeConversationsFromFrozenConversations:v4];
  uint64_t v6 = [(CKConversationListCollectionViewController *)self delegate];
  [v6 conversationListIsDeletingConversations:v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 chat];
        int v13 = [v12 isDeletingIncomingMessages];

        if (v13)
        {
          id v14 = [v11 chat];
          [v14 setDeletingIncomingMessages:0];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [(CKConversationListCollectionViewController *)self conversationList];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke;
  v16[3] = &unk_1E5620C40;
  v16[4] = self;
  [v15 recoverDeletedMessagesInConversations:v7 synchronousQuery:0 completionHandler:v16];
}

uint64_t __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) conversationList];
  [v2 updateConversationListsAndSortIfEnabled];

  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke_2;
  v5[3] = &unk_1E5620C40;
  v5[4] = v3;
  return [v3 updateSnapshotAnimatingDifferences:1 completion:v5];
}

uint64_t __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removalCompleted];
}

- (void)_removalCompleted
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Recently Deleted | removal completed", (uint8_t *)&v13, 2u);
    }
  }
  id v4 = [(CKConversationListCollectionViewController *)self dataSource];
  double v5 = [v4 snapshot];
  BOOL v6 = [v5 indexOfSectionIdentifier:&unk_1EDF16718] == 0x7FFFFFFFFFFFFFFFLL;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | recently deleted section is not in the converesation. Early returning.", (uint8_t *)&v13, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = [(CKConversationListCollectionViewController *)self dataSource];
    uint64_t v9 = [v8 snapshot];
    uint64_t v10 = [v9 numberOfItemsInSection:&unk_1EDF16718];

    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [NSNumber numberWithInteger:v10];
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | Viewing recently deleted section of %@ items", (uint8_t *)&v13, 0xCu);
      }
    }
    if (!v10)
    {
      if ([(CKConversationListCollectionViewController *)self isRecentlyDeletedModal]) {
        [(CKConversationListCollectionViewController *)self performSelector:sel__dismissPresentedNavController_ withObject:0 afterDelay:0.35];
      }
      else {
        [(CKConversationListCollectionViewController *)self performSelector:sel__popToInbox withObject:0 afterDelay:0.35];
      }
    }
  }
}

- (void)_popToInbox
{
  id v2 = [(CKConversationListCollectionViewController *)self delegate];
  [v2 dismissConversationListAnimated:1];
}

- (id)showRecentlyDeletedModalAction
{
  id v3 = (void *)MEMORY[0x1E4F426E8];
  id v4 = CKFrameworkBundle();
  double v5 = [v4 localizedStringForKey:@"SHOW_RECENTLY_DELETED" value:&stru_1EDE4CA38 table:@"ChatKit"];
  BOOL v6 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"trash"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__CKConversationListCollectionViewController_RecentlyDeleted__showRecentlyDeletedModalAction__block_invoke;
  v9[3] = &unk_1E56211C8;
  void v9[4] = self;
  id v7 = [v3 actionWithTitle:v5 image:v6 identifier:0 handler:v9];

  return v7;
}

uint64_t __93__CKConversationListCollectionViewController_RecentlyDeleted__showRecentlyDeletedModalAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showRecentlyDeletedModalActionTapped];
}

- (void)_performRecentlyDeletedMultiSelectCleanUp
{
  id v3 = [(CKConversationListCollectionViewController *)self delegate];
  char v4 = [v3 isCollapsed];

  if ((v4 & 1) == 0)
  {
    double v5 = [(CKConversationListCollectionViewController *)self collectionView];
    [(CKConversationListCollectionViewController *)self _deselectSelectedIndexPathsInCollectionView:v5 animated:1];

    id v8 = [(CKConversationListCollectionViewController *)self delegate];
    BOOL v6 = [(CKConversationListCollectionViewController *)self collectionView];
    id v7 = [v6 indexPathsForSelectedItems];
    objc_msgSend(v8, "conversationListUpdatedSelectedIndexPathCount:", objc_msgSend(v7, "count"));
  }
}

- (void)_moveToRecentlyDeletedButtonTapped:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recoverable deletion requested", v6, 2u);
    }
  }
  [(CKConversationListCollectionViewController *)self recoverableDeleteSelectedConversations];
}

- (void)_permanentDeleteSelectedButtonTapped:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Permanent deletion on selected requested", v6, 2u);
    }
  }
  [(CKConversationListCollectionViewController *)self _permanentDeleteSelectedConversations];
}

- (void)_permanentDeleteSelectedConversations
{
  id v3 = [(CKConversationListCollectionViewController *)self _selectedConversationsInRecentlyDeletedSection];
  [(CKConversationListCollectionViewController *)self _presentPermanentDeletionConfirmationsForConversations:v3];
}

- (void)_permanentDeleteAllButtonTapped:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Permanent deletion on all requested", v8, 2u);
    }
  }
  BOOL v6 = [(CKConversationListCollectionViewController *)self conversationList];
  id v7 = [v6 conversationsForFilterMode:7];

  [(CKConversationListCollectionViewController *)self _presentPermanentDeletionConfirmationsForConversations:v7];
}

- (void)_recoverSelectedButtonTapped:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recover selected requested", v6, 2u);
    }
  }
  [(CKConversationListCollectionViewController *)self _recoverSelectedConversations];
}

- (void)_recoverSelectedConversations
{
  id v3 = [(CKConversationListCollectionViewController *)self _selectedConversationsInRecentlyDeletedSection];
  [(CKConversationListCollectionViewController *)self _presentRecoverConfirmationsForConversations:v3];
}

- (void)_recoverAllButtonTapped:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recover all requested", v8, 2u);
    }
  }
  BOOL v6 = [(CKConversationListCollectionViewController *)self conversationList];
  id v7 = [v6 conversationsForFilterMode:7];

  [(CKConversationListCollectionViewController *)self _presentRecoverConfirmationsForConversations:v7];
}

- (void)_showRecentlyDeletedModalActionTapped
{
  id v3 = [[CKConversationListCollectionViewController alloc] initForRecentlyDeletedModal];
  id v4 = [(CKConversationListCollectionViewController *)self delegate];
  [v3 setDelegate:v4];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v3];
  BOOL v6 = [v5 navigationBar];
  [v6 setPrefersLargeTitles:1];

  [v5 setModalPresentationStyle:2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__CKConversationListCollectionViewController_RecentlyDeleted___showRecentlyDeletedModalActionTapped__block_invoke;
  v8[3] = &unk_1E5620C40;
  id v9 = v5;
  id v7 = v5;
  [(CKConversationListCollectionViewController *)self presentViewController:v7 animated:1 completion:v8];
}

void __100__CKConversationListCollectionViewController_RecentlyDeleted___showRecentlyDeletedModalActionTapped__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Presented modal navigation controller: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)recoverableDeleteSelectedConversations
{
  uint64_t v3 = [(CKConversationListCollectionViewController *)self collectionView];
  int v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_124];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  if ([v6 count])
  {
    id v7 = [(CKConversationListCollectionViewController *)self conversationsAtIndexPaths:v6];
    id v8 = [MEMORY[0x1E4F1C9C8] now];
    id v9 = [(CKConversationListCollectionViewController *)self delegate];
    uint64_t v10 = [v9 isCollapsed];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__CKConversationListCollectionViewController_RecentlyDeleted__recoverableDeleteSelectedConversations__block_invoke_69;
    aBlock[3] = &unk_1E5628498;
    void aBlock[4] = self;
    id v11 = v7;
    id v17 = v11;
    id v12 = v8;
    id v18 = v12;
    char v20 = v10;
    id v19 = v6;
    int v13 = _Block_copy(aBlock);
    [(CKConversationListCollectionViewController *)self presentRecoverableDeleteConfirmationsWithConversations:v11 collapsedAppearance:v10 alertsCompletedBlock:v13 cancelBlock:0];
    if ([(id)__CurrentTestName isEqualToString:@"UITestDeleteTopChat"])
    {
      id v14 = (id *)MEMORY[0x1E4F43630];
      if (objc_opt_respondsToSelector()) {
        [*v14 didDeleteChat];
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Delete requested for selectedIndexPaths count of 0", buf, 2u);
    }
  }
}

BOOL __101__CKConversationListCollectionViewController_RecentlyDeleted__recoverableDeleteSelectedConversations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 section] == 5 || objc_msgSend(v2, "section") == 2;

  return v3;
}

uint64_t __101__CKConversationListCollectionViewController_RecentlyDeleted__recoverableDeleteSelectedConversations__block_invoke_69(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isNewComposeSelected])
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 conversationListControllerTappedDeleteNewMessage:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _performRecoverableDeletionForConversations:*(void *)(a1 + 40) deleteDate:*(void *)(a1 + 48)];
  if (!*(unsigned char *)(a1 + 64))
  {
    BOOL v3 = *(void **)(a1 + 32);
    int v4 = [v3 collectionView];
    [v3 _deselectSelectedIndexPathsInCollectionView:v4 animated:1];

    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 56) lastObject];
    [v5 selectConversationClosestToDeletedIndex:v6];
  }
  id v7 = *(void **)(a1 + 32);

  return [v7 setEditingMode:0 animated:1];
}

- (BOOL)_isNewComposeSelected
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(CKConversationListCollectionViewController *)self collectionView];
  BOOL v3 = [v2 indexPathsForSelectedItems];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__CKConversationListCollectionViewController_RecentlyDeleted___isNewComposeSelected__block_invoke;
  v5[3] = &unk_1E56284C0;
  v5[4] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __84__CKConversationListCollectionViewController_RecentlyDeleted___isNewComposeSelected__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 section];
  if (result == 4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)recentlyDeletedConversationMenu:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKConversationListCollectionViewController *)self _recoverRecentlyDeletedAction:v4];
  uint64_t v6 = [(CKConversationListCollectionViewController *)self _permanentDeleteRecentlyDeletedAction:v4];

  v10[0] = v5;
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v7];

  return v8;
}

- (id)_recoverRecentlyDeletedAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"arrow.up.bin"];
  uint64_t v6 = (void *)MEMORY[0x1E4F426E8];
  id v7 = CKFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"RECOVER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__CKConversationListCollectionViewController_RecentlyDeleted___recoverRecentlyDeletedAction___block_invoke;
  v12[3] = &unk_1E5624B40;
  void v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  uint64_t v10 = [v6 actionWithTitle:v8 image:v5 identifier:0 handler:v12];

  return v10;
}

uint64_t __93__CKConversationListCollectionViewController_RecentlyDeleted___recoverRecentlyDeletedAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentRecoverConfirmationsForConversations:*(void *)(a1 + 40)];
}

- (id)_permanentDeleteRecentlyDeletedAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"trash"];
  uint64_t v6 = (void *)MEMORY[0x1E4F426E8];
  id v7 = CKFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __101__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeleteRecentlyDeletedAction___block_invoke;
  uint64_t v15 = &unk_1E5624B40;
  id v16 = self;
  id v17 = v4;
  id v9 = v4;
  uint64_t v10 = [v6 actionWithTitle:v8 image:v5 identifier:0 handler:&v12];

  if (!CKIsRunningInMacCatalyst()) {
    objc_msgSend(v10, "setAttributes:", 2, v12, v13, v14, v15, v16, v17);
  }

  return v10;
}

uint64_t __101__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeleteRecentlyDeletedAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentPermanentDeletionConfirmationsForConversations:*(void *)(a1 + 40)];
}

- (id)toolbarItemsForRecentlyDeletedFilterHasConversations:(BOOL)a3 hasSelectedConversations:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [(CKConversationListCollectionViewController *)self _permanentDeletebuttonToUseForSelectedConversations:v4];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
  uint64_t v10 = [(CKConversationListCollectionViewController *)self _recoverButtonToUseForSelectedConversations:v4];
  [v8 setEnabled:v5];
  [v10 setEnabled:v5];
  [v7 addObject:v8];
  [v7 addObject:v9];
  [v7 addObject:v10];

  return v7;
}

- (id)_permanentDeletebuttonToUseForSelectedConversations:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(CKConversationListCollectionViewController *)self permanentDeleteSelectedButtonItem];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F427C0]);
      uint64_t v6 = CKFrameworkBundle();
      id v7 = [v6 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v8 = (void *)[v5 initWithTitle:v7 style:0 target:self action:sel__permanentDeleteSelectedButtonTapped_];

      [v8 accessibilitySetIdentification:@"deleteButton"];
      [(CKConversationListCollectionViewController *)self setPermanentDeleteSelectedButtonItem:v8];
    }
    id v9 = [(CKConversationListCollectionViewController *)self permanentDeleteSelectedButtonItem];
  }
  else
  {
    uint64_t v10 = [(CKConversationListCollectionViewController *)self permanentDeleteAllButtonItem];

    if (!v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F427C0]);
      uint64_t v12 = CKFrameworkBundle();
      uint64_t v13 = [v12 localizedStringForKey:@"DELETE_ALL" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v14 = (void *)[v11 initWithTitle:v13 style:0 target:self action:sel__permanentDeleteAllButtonTapped_];

      [v14 accessibilitySetIdentification:@"deleteButton"];
      [(CKConversationListCollectionViewController *)self setPermanentDeleteAllButtonItem:v14];
    }
    id v9 = [(CKConversationListCollectionViewController *)self permanentDeleteAllButtonItem];
  }

  return v9;
}

- (id)_recoverButtonToUseForSelectedConversations:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(CKConversationListCollectionViewController *)self recoverSelectedButtonItem];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F427C0]);
      uint64_t v6 = CKFrameworkBundle();
      id v7 = [v6 localizedStringForKey:@"RECOVER" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v8 = (void *)[v5 initWithTitle:v7 style:0 target:self action:sel__recoverSelectedButtonTapped_];

      [v8 accessibilitySetIdentification:@"recoverButton"];
      [(CKConversationListCollectionViewController *)self setRecoverSelectedButtonItem:v8];
    }
    id v9 = [(CKConversationListCollectionViewController *)self recoverSelectedButtonItem];
  }
  else
  {
    uint64_t v10 = [(CKConversationListCollectionViewController *)self recoverAllButtonItem];

    if (!v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F427C0]);
      uint64_t v12 = CKFrameworkBundle();
      uint64_t v13 = [v12 localizedStringForKey:@"RECOVER_ALL" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v14 = (void *)[v11 initWithTitle:v13 style:0 target:self action:sel__recoverAllButtonTapped_];

      [v14 accessibilitySetIdentification:@"recoverButton"];
      [(CKConversationListCollectionViewController *)self setRecoverAllButtonItem:v14];
    }
    id v9 = [(CKConversationListCollectionViewController *)self recoverAllButtonItem];
  }

  return v9;
}

- (id)_selectedConversationsInRecentlyDeletedSection
{
  BOOL v3 = [(CKConversationListCollectionViewController *)self collectionView];
  BOOL v4 = [v3 indexPathsForSelectedItems];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_110_0];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  id v7 = [(CKConversationListCollectionViewController *)self conversationsAtIndexPaths:v6];

  return v7;
}

BOOL __109__CKConversationListCollectionViewController_RecentlyDeleted___selectedConversationsInRecentlyDeletedSection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 section] == 6;
}

- (unint64_t)_numberOfRecoverableMessagesInConversations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) chat];
        v6 += [v9 recoverableMessagesCount];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)_reloadRecoverableMetadataForNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = [v4 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Reloading recoverable message metadata for notification %@", buf, 0xCu);
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__CKConversationListCollectionViewController_RecentlyDeleted___reloadRecoverableMetadataForNotification___block_invoke;
  v8[3] = &unk_1E5620C40;
  void v8[4] = self;
  [v7 updateRecoverableMessagesMetadataSynchronously:0 loadChats:1 completionHandler:v8];
}

uint64_t __105__CKConversationListCollectionViewController_RecentlyDeleted___reloadRecoverableMetadataForNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversationList];
  [v2 updateConversationListsAndSortIfEnabled];

  [*(id *)(a1 + 32) updateSnapshotAnimatingDifferences:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 updateContentsOfAllCellsAnimated:1];
}

- (void)_handleChatRegistryDidPermanentlyDeleteRecoverableMessages:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6BC40], "sharedRegistry", a3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke;
  v5[3] = &unk_1E5620C40;
  v5[4] = self;
  [v4 updateRecoverableMessagesMetadataSynchronously:0 loadChats:1 completionHandler:v5];
}

uint64_t __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversationList];
  [v2 updateConversationListsAndSortIfEnabled];

  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke_2;
  v5[3] = &unk_1E5620C40;
  v5[4] = v3;
  return [v3 updateSnapshotAnimatingDifferences:1 completion:v5];
}

uint64_t __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removalCompleted];
}

- (void)_handleDidRecoverMessagesInChatsNotification:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6BC40], "sharedRegistry", a3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke;
  v5[3] = &unk_1E5620C40;
  v5[4] = self;
  [v4 updateRecoverableMessagesMetadataSynchronously:0 loadChats:1 completionHandler:v5];
}

uint64_t __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversationList];
  [v2 updateConversationListsAndSortIfEnabled];

  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke_2;
  v5[3] = &unk_1E5620C40;
  v5[4] = v3;
  return [v3 updateSnapshotAnimatingDifferences:1 completion:v5];
}

uint64_t __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removalCompleted];
}

- (id)_recentlyDeletedDisclosureLabelText
{
  id v3 = [(CKConversationListCollectionViewController *)self _selectedConversationsInRecentlyDeletedSection];
  if ([v3 count])
  {
    unint64_t v4 = [(CKConversationListCollectionViewController *)self _numberOfRecoverableMessagesInConversations:v3];
    unint64_t v5 = [(CKConversationListCollectionViewController *)self _minNumberOfDaysUntilDeletionInConversations:v3];
    if ((unint64_t)[v3 count] < 2) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = [(CKConversationListCollectionViewController *)self _maxNumberOfDaysUntilDeletionInConversations:v3];
    }
    id v9 = NSString;
    uint64_t v10 = CKFrameworkBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"RECENTLY_DELETED_MESSAGES_SELECTED" value:&stru_1EDE4CA38 table:@"ChatKit"];
    long long v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v4);

    long long v13 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v14 = [v13 userInterfaceLayoutDirection];

    if (v14 == 1) {
      uint64_t v15 = @"\u200F";
    }
    else {
      uint64_t v15 = @"\u200E";
    }
    uint64_t v7 = [(__CFString *)v15 stringByAppendingString:v12];

    if ([v3 count] == 1 || v5 == v6)
    {
      uint64_t v23 = NSString;
      uint64_t v24 = CKFrameworkBundle();
      uint64_t v25 = v24;
      if (v4 == 1) {
        uint64_t v26 = @"RECENTLY_DELETED_IT_WILL_BE_DELETED";
      }
      else {
        uint64_t v26 = @"RECENTLY_DELETED_THEY_WILL_BE_DELETED";
      }
      uint64_t v27 = [v24 localizedStringForKey:v26 value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v19 = objc_msgSend(v23, "localizedStringWithFormat:", v27, v5);

      long long v28 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v29 = [v28 userInterfaceLayoutDirection];

      if (v29 == 1) {
        uint64_t v22 = @"\u200F";
      }
      else {
        uint64_t v22 = @"\u200E";
      }
    }
    else
    {
      uint64_t v16 = NSString;
      id v17 = CKFrameworkBundle();
      id v18 = [v17 localizedStringForKey:@"RECENTLY_DELETED_RANGED_DATES_DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v5, v6);

      char v20 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v21 = [v20 userInterfaceLayoutDirection];

      if (v21 == 1) {
        uint64_t v22 = @"\u200F";
      }
      else {
        uint64_t v22 = @"\u200E";
      }
    }
    double v30 = [(__CFString *)v22 stringByAppendingString:v19];

    uint64_t v31 = NSString;
    double v32 = CKFrameworkBundle();
    uint64_t v33 = [v32 localizedStringForKey:@"MESSAGES_SELECTED_JOIN_THEY_WILL_BE_DELETED" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v34 = objc_msgSend(v31, "stringWithFormat:", v33, v7, v30);

    long long v35 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v36 = [v35 userInterfaceLayoutDirection];

    if (v36 == 1) {
      long long v37 = @"\u200F";
    }
    else {
      long long v37 = @"\u200E";
    }
    uint64_t v8 = [(__CFString *)v37 stringByAppendingString:v34];
  }
  else
  {
    uint64_t v7 = CKFrameworkBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"RECENTLY_DELETED_DISCLOSURE_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  return v8;
}

- (unint64_t)_minNumberOfDaysUntilDeletionInConversations:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___minNumberOfDaysUntilDeletionInConversations___block_invoke;
  v6[3] = &unk_1E56284E8;
  void v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  if ((unint64_t)v8[3] <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = v8[3];
  }
  v8[3] = v4;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __108__CKConversationListCollectionViewController_RecentlyDeleted___minNumberOfDaysUntilDeletionInConversations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 chat];
  unint64_t v4 = [v3 earliestRecoverableMessageDeletionDate];
  unint64_t v5 = +[CKUtilities daysUntilRecentlyDeletedDeletionForDate:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v7 = *(void *)(v6 + 24);
  if (v7 >= v5) {
    unint64_t v7 = v5;
  }
  *(void *)(v6 + 24) = v7;
}

- (unint64_t)_maxNumberOfDaysUntilDeletionInConversations:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___maxNumberOfDaysUntilDeletionInConversations___block_invoke;
  v6[3] = &unk_1E56284E8;
  void v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __108__CKConversationListCollectionViewController_RecentlyDeleted___maxNumberOfDaysUntilDeletionInConversations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 chat];
  unint64_t v4 = [v3 earliestRecoverableMessageDeletionDate];
  unint64_t v5 = +[CKUtilities daysUntilRecentlyDeletedDeletionForDate:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v7 = *(void *)(v6 + 24);
  if (v7 <= v5) {
    unint64_t v7 = v5;
  }
  *(void *)(v6 + 24) = v7;
}

- (id)_defaultEmptyStateConfiguration
{
  id v3 = [MEMORY[0x1E4F428E8] emptyExtraProminentConfiguration];
  unint64_t v4 = CKFrameworkBundle();
  unint64_t v5 = [v4 localizedStringForKey:@"NO_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v3 setText:v5];

  uint64_t v6 = [(CKConversationListCollectionViewController *)self _secondaryTextForFilterMode:[(CKConversationListCollectionViewController *)self filterMode]];
  [v3 setSecondaryText:v6];

  unint64_t v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"message.fill"];
  [v3 setImage:v7];

  return v3;
}

- (id)_secondaryTextForFilterMode:(unint64_t)a3
{
  if (a3 >= 0x10)
  {
    uint64_t v8 = IMSharedUtilitiesFrameworkBundle();
    uint64_t v9 = [MEMORY[0x1E4F6E938] smsFilterParamForFilterMode:a3];
    uint64_t v10 = [v9 folderName];
    uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];

    long long v12 = NSString;
    long long v13 = CKFrameworkBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"NO_SUBFOLDER_MESSAGE_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);

    uint64_t v16 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v17 = [v16 userInterfaceLayoutDirection];

    if (v17 == 1) {
      id v18 = @"\u200F";
    }
    else {
      id v18 = @"\u200E";
    }
    id v19 = [(__CFString *)v18 stringByAppendingString:v15];

    id v20 = v19;
  }
  else
  {
    unint64_t v4 = 0;
    switch(a3)
    {
      case 2uLL:
        unint64_t v5 = CKFrameworkBundle();
        uint64_t v6 = v5;
        unint64_t v7 = @"NO_KNOWN_MESSAGES_DESCRIPTION";
        goto LABEL_15;
      case 3uLL:
        unint64_t v5 = CKFrameworkBundle();
        uint64_t v6 = v5;
        unint64_t v7 = @"NO_UNKNOWN_MESSAGES_DESCRIPTION";
        goto LABEL_15;
      case 4uLL:
        unint64_t v5 = CKFrameworkBundle();
        uint64_t v6 = v5;
        unint64_t v7 = @"NO_TRANSACTIONS_MESSAGE_DESCRIPTION";
        goto LABEL_15;
      case 5uLL:
        unint64_t v5 = CKFrameworkBundle();
        uint64_t v6 = v5;
        unint64_t v7 = @"NO_PROMOTIONAL_MESSAGE_DESCRIPTION";
        goto LABEL_15;
      case 6uLL:
        BOOL v21 = CKIsBlackholeEnabled();
        unint64_t v5 = CKFrameworkBundle();
        uint64_t v6 = v5;
        if (v21) {
          unint64_t v7 = @"NO_SMS_JUNK_MESSAGES_DESCRIPTION";
        }
        else {
          unint64_t v7 = @"NO_JUNK_MESSAGES_DESCRIPTION";
        }
        goto LABEL_15;
      case 7uLL:
        goto LABEL_16;
      case 8uLL:
        unint64_t v5 = CKFrameworkBundle();
        uint64_t v6 = v5;
        unint64_t v7 = @"NO_UNREAD_MESSAGES_DESCRIPTION";
        goto LABEL_15;
      default:
        unint64_t v5 = CKFrameworkBundle();
        uint64_t v6 = v5;
        unint64_t v7 = @"NO_MESSAGES_DESCRIPTION";
LABEL_15:
        unint64_t v4 = [v5 localizedStringForKey:v7 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_16:
        id v20 = v4;
        break;
    }
  }

  return v20;
}

- (id)updaterLogHandle
{
  id v2 = objc_opt_class();

  return (id)[v2 updaterLogHandle];
}

- (void)_refreshConversationListCellForGroupPhotoUpdate:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Notification to refresh the cell for avatar view update.", v10, 2u);
    }
  }
  uint64_t v6 = [v4 userInfo];
  unint64_t v7 = [v6 valueForKey:@"conversation"];
  [v7 setNeedsUpdatedGroupPhotoForVisualIdentity];
  if ([v7 isPinned]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 5;
  }
  uint64_t v9 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v7 inSection:v8];
  [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v9 animated:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UISearchController *)self->_searchController setDelegate:0];
  [(UISearchController *)self->_searchController setSearchResultsUpdater:0];
  [(CKSearchViewController *)self->_searchResultsController setDelegate:0];
  id v4 = [(CKConversationListCollectionViewController *)self collectionView];
  [v4 setDataSource:0];

  unint64_t v5 = [(CKConversationListCollectionViewController *)self collectionView];
  [v5 setDelegate:0];

  uint64_t v6 = [(CKConversationListCollectionViewController *)self collectionView];
  [v6 setDragDelegate:0];

  unint64_t v7 = [(CKConversationListCollectionViewController *)self collectionView];
  [v7 setDropDelegate:0];

  uint64_t v8 = [(CKConversationListCollectionViewController *)self refreshControlTimer];

  if (v8)
  {
    uint64_t v9 = [(CKConversationListCollectionViewController *)self refreshControlTimer];
    [v9 invalidate];

    [(CKConversationListCollectionViewController *)self setRefreshControlTimer:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v10 dealloc];
}

- (void)_dismissPresentedNavController:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (id)indexPathOfFirstSelectedItem
{
  id v2 = [(CKConversationListCollectionViewController *)self collectionView];
  id v3 = [v2 indexPathsForSelectedItems];

  id v4 = [v3 firstObject];

  return v4;
}

- (void)significantTimeChange
{
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0];

  [(CKConversationListCollectionViewController *)self updateConversationSelection];
}

- (void)_updateCollectionViewImmediatelyIfNeeded
{
  id v2 = [(CKConversationListCollectionViewController *)self updater];
  [v2 updateImmediatelyIfNeeded];
}

- (void)compositionSent
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKConversationListCollectionViewController *)self splitViewController];
  int v4 = [v3 isCollapsed];

  if (v4)
  {
    [(CKConversationListCollectionViewController *)self setCompositionWasSent:1];
    unint64_t v5 = [(CKConversationListCollectionViewController *)self navigationController];
    uint64_t v6 = [v5 viewControllers];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    id v9 = v7;
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v18;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v10) {
            goto LABEL_4;
          }
          id v9 = v7;
          goto LABEL_13;
        }
      }
      id v9 = v13;

      if (!v9) {
        goto LABEL_14;
      }
      id v21 = v9;
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v21, 1, (void)v17);
      uint64_t v15 = [v7 arrayByExcludingObjectsInArray:v14];

      uint64_t v16 = [(CKConversationListCollectionViewController *)self navigationController];
      [v16 setViewControllers:v15];
    }
LABEL_13:

LABEL_14:
  }
}

- (void)_showConversation:(id)a3 withComposition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isPinned]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 5;
  }
  id v11 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v7 inSection:v8];

  id v9 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v10 = [v9 indexPathForItemIdentifier:v11];

  [(CKConversationListCollectionViewController *)self _showConversationWithComposition:v6 atIndexPath:v10];
}

- (void)_showConversationWithComposition:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(CKConversationListCollectionViewController *)self isEditing] & 1) == 0)
  {
    uint64_t v8 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v7];
    id v9 = [(CKConversationListCollectionViewController *)self delegate];
    uint64_t v10 = [v9 currentlyShownConversation];

    BOOL v11 = [(CKConversationListCollectionViewController *)self _shouldKeepSelection];
    BOOL v12 = v8 == v10 && v11;
    id v13 = [v8 unsentComposition];

    if ([v7 section] == 4)
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      char v16 = [WeakRetained isComposingMessage];

      id v17 = objc_loadWeakRetained((id *)p_delegate);
      id v18 = v17;
      if ((v16 & 1) == 0)
      {
        [v17 showNewMessageCompositionPanelAppendingToExistingDraft:v6 animated:1];
        goto LABEL_15;
      }
    }
    else
    {
      char v19 = !v12;
      if (!v6) {
        char v19 = 1;
      }
      if ((v19 & 1) != 0 || v13 == v6)
      {
        if (v8) {
          char v20 = v12;
        }
        else {
          char v20 = 1;
        }
        if ((v20 & 1) == 0)
        {
          id v21 = [(CKConversationListCollectionViewController *)self updater];
          [v21 beginHoldingUpdatesForReason:@"chatItemChangeSuppression"];

          [v8 updateUnsentCompositionByAppendingComposition:v6];
          id v22 = objc_loadWeakRetained((id *)&self->_delegate);
          [v22 showConversation:v8 animate:1 userInitiated:1];

          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __91__CKConversationListCollectionViewController__showConversationWithComposition_atIndexPath___block_invoke;
          v23[3] = &unk_1E5620AF8;
          v23[4] = self;
          id v24 = v8;
          dispatch_async(MEMORY[0x1E4F14428], v23);

          goto LABEL_16;
        }
        if (!v12)
        {
LABEL_16:

          goto LABEL_17;
        }
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 chatControllerDidReselectConversation:v8];
LABEL_15:

        goto LABEL_16;
      }
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      id v18 = v17;
    }
    [v17 updateCompositionInEntryViewWithComposition:v6];
    goto LABEL_15;
  }
  [(CKConversationListCollectionViewController *)self _updateToolbarItems];
LABEL_17:
}

void __91__CKConversationListCollectionViewController__showConversationWithComposition_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updater];
  [v2 endHoldingUpdatesForReason:@"chatItemChangeSuppression" updateTriggeredIfNotHeldShouldBeDeferred:1];

  id v4 = [MEMORY[0x1E4F6BC48] sharedInstance];
  id v3 = [*(id *)(a1 + 40) chat];
  [v4 presentSatelliteConnectionBannerIfNecessaryWithChat:v3 withReason:@"OpenChat" ignoreTimerLimit:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKConversationListCollectionViewController *)self collectionView];

  if (v8 == v6)
  {
    [(CKConversationListCollectionViewController *)self _updateToolbarItems];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E5620AF8;
    void aBlock[4] = self;
    id v15 = v7;
    BOOL v11 = (void (**)(void))_Block_copy(aBlock);
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updatedSelectedIndexPathCount object:0];
    if (CKIsRunningInMacCatalyst())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_261;
      block[3] = &unk_1E5620F48;
      id v13 = v11;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v11[2](v11);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(CKConversationListCollectionViewController *)self collectionView];
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      char v19 = v10;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController: processing didSelectItemAtIndexPath on an unexpected collectionView: %@. Expected: %@", buf, 0x16u);
    }
  }
}

void __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 32) collectionView];
      id v4 = [v3 indexPathsForSelectedItems];
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "multi-select: didSelectItemAtIndexPath. SelectedIndexPaths: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if ([*(id *)(a1 + 32) filterMode] == 7
    || ([*(id *)(a1 + 32) collectionView],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 indexPathsForSelectedItems],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = [v6 count] == 1,
        v6,
        v5,
        !v7))
  {
    [*(id *)(a1 + 32) _updatedSelectedIndexPathCount];
  }
  else
  {
    if (CKIsRunningInMacCatalyst()) {
      [*(id *)(a1 + 32) setEditingMode:0 animated:0];
    }
    id v9 = *(void **)(a1 + 32);
    uint64_t v8 = a1 + 32;
    [v9 _performTranscriptPushForItemAtIndexPath:*(void *)(v8 + 8) userInitiated:1];
    uint64_t v10 = [*(id *)v8 dataSource];
    BOOL v11 = [v10 itemIdentifierForIndexPath:*(void *)(v8 + 8)];
    [*(id *)v8 setLastSelectedConversationItemIdentifier:v11];
  }
}

uint64_t __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_261(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = ![(CKConversationListCollectionViewController *)self isAppearing]
    && -[CKConversationListCollectionViewController sectionHasSelectableConversations:](self, "sectionHasSelectableConversations:", [v5 section]);

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "section", a3);

  return [(CKConversationListCollectionViewController *)self sectionHasSelectableConversations:v5];
}

- (BOOL)cellAtIndexPath:(id)a3 isVisibleInCollectionView:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 cellForItemAtIndexPath:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 bounds];
    objc_msgSend(v6, "convertRect:fromView:", v8);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat rect1 = v13;
    CGFloat v15 = v14;
    double v16 = v11 + v14;
    id v17 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [v6 bounds];
    __int16 v18 = objc_msgSend(v17, "initWithFrame:", 0.0, v16);
    char v19 = [MEMORY[0x1E4F428B8] blueColor];
    [v18 setBackgroundColor:v19];

    [v6 bounds];
    double v39 = v21;
    double v40 = v20;
    double v38 = v22;
    double v24 = v23;
    [v6 adjustedContentInset];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v24 - (v25 + v31);
    if (!self->_keyboardIsShowing)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v34 = [WeakRetained chatController];

      [v34 accessoryViewHeight];
      double v32 = v32 + v35;
    }
    v43.origin.double x = v10;
    v43.origin.double y = v12;
    v43.size.double width = rect1;
    v43.size.double height = v15;
    BOOL v36 = 0;
    if (!CGRectEqualToRect(v43, *MEMORY[0x1E4F1DB28]))
    {
      v44.origin.double x = v40 + v28;
      v44.origin.double y = v39 + v26;
      v44.size.double width = v38 - (v28 + v30);
      v44.size.double height = v32;
      v42.double x = v10;
      v42.double y = v16;
      if (CGRectContainsPoint(v44, v42)) {
        BOOL v36 = 1;
      }
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (id)complimentaryIndexPathForConversationAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section] == 5)
  {
    uint64_t v5 = 2;
LABEL_5:
    id v6 = [(CKConversationListCollectionViewController *)self dataSource];
    BOOL v7 = [v6 itemIdentifierForIndexPath:v4];

    uint64_t v8 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v7];
    double v9 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v8 inSection:v5];
    CGFloat v10 = [(CKConversationListCollectionViewController *)self dataSource];
    double v11 = [v10 indexPathForItemIdentifier:v9];

    goto LABEL_7;
  }
  if ([v4 section] == 2)
  {
    uint64_t v5 = 5;
    goto LABEL_5;
  }
  double v11 = 0;
LABEL_7:

  return v11;
}

- (void)_performTranscriptPushForItemAtIndexPath:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "User attempted to select a converstion, but they are already dragging another conversation. Ignoring.", (uint8_t *)&v33, 2u);
      }
    }
    uint64_t v8 = [(CKConversationListCollectionViewController *)self collectionView];
    [v8 deselectItemAtIndexPath:v6 animated:0];

    goto LABEL_38;
  }
  unint64_t v9 = [(CKConversationListCollectionViewController *)self editingMode];
  BOOL v10 = [v6 section] == 4 || objc_msgSend(v6, "section") == 2 || objc_msgSend(v6, "section") == 5;
  if (v9 == 2)
  {
    if (IMOSLoggingEnabled())
    {
      double v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        CGFloat v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
        int v33 = 138412290;
        uint64_t v34 = v12;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "multi-select: not showing conversation - currently under editing mode: %@", (uint8_t *)&v33, 0xCu);
      }
    }
    goto LABEL_38;
  }
  if (v10)
  {
    double v13 = [(CKConversationListCollectionViewController *)self lastSelectedConversationItemIdentifier];
    double v14 = [(CKConversationListCollectionViewController *)self dataSource];
    CGFloat v15 = [v14 indexPathForItemIdentifier:v13];

    if (([v6 isEqual:v15] & 1) == 0)
    {
      double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"CKConversationListSelectionDidChangeNotification" object:self];

      if ([MEMORY[0x1E4F6E790] messageSummarizationEnabled])
      {
        id v17 = [(CKConversationListCollectionViewController *)self splitViewController];
        int v18 = [v17 isCollapsed];

        if (v18) {
          id v19 = v6;
        }
        else {
          id v19 = v15;
        }
        [(CKConversationListCollectionViewController *)self _consumeSummaryForConversationAtIndexPathIfNeeded:v19];
      }
    }
    double v20 = [(CKConversationListCollectionViewController *)self dataSource];
    double v21 = [v20 itemIdentifierForIndexPath:v6];

    if (CKIsRunningInMacCatalyst())
    {
      double v22 = [(CKConversationListCollectionViewController *)self lastUserSelectedConversationTime];
      if (v22)
      {
        double v23 = [(CKConversationListCollectionViewController *)self lastUserSelectedConversationItemIdentifier];
        int v24 = [v21 isEqualToString:v23];

        if (v24)
        {
          double v25 = [(CKConversationListCollectionViewController *)self lastUserSelectedConversationTime];
          [v25 timeIntervalSinceNow];
          double v27 = v26;

          if (fabs(v27) < cellDoubleClickInterval())
          {
            double v28 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v6];
            double v29 = [(CKConversationListCollectionViewController *)self delegate];
            [v29 showConversationInNewWindow:v28];
          }
        }
      }
      if (!v4)
      {
        [(CKConversationListCollectionViewController *)self _showConversationWithComposition:0 atIndexPath:v6];
        [(CKConversationListCollectionViewController *)self setLastSelectedConversationItemIdentifier:v21];
LABEL_37:

        goto LABEL_38;
      }
      double v30 = [MEMORY[0x1E4F1C9C8] date];
      [(CKConversationListCollectionViewController *)self setLastUserSelectedConversationTime:v30];
    }
    [(CKConversationListCollectionViewController *)self _showConversationWithComposition:0 atIndexPath:v6];
    [(CKConversationListCollectionViewController *)self setLastSelectedConversationItemIdentifier:v21];
    if (v4) {
      [(CKConversationListCollectionViewController *)self setLastUserSelectedConversationItemIdentifier:v21];
    }
    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    double v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      double v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "section"));
      int v33 = 138412290;
      uint64_t v34 = v32;
      _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "multi-select: not showing conversation - section is invalid: %@", (uint8_t *)&v33, 0xCu);
    }
  }
LABEL_38:
}

- (void)_consumeSummaryForConversationAtIndexPathIfNeeded:(id)a3
{
  id v5 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:a3];
  id v3 = [v5 chat];
  BOOL v4 = [v3 chatSummary];

  if (v4) {
    [v3 consumeSummaryIfNeeded];
  }
}

- (void)_consumeSummaryOnUnreadCountChangeForChatIfNeeded:(id)a3
{
  id v7 = a3;
  if (![v7 unreadMessageCount])
  {
    BOOL v4 = [(CKConversationListCollectionViewController *)self splitViewController];
    int v5 = [v4 isCollapsed];

    if (v5)
    {
      id v6 = [v7 chatSummary];

      if (v6) {
        [v7 consumeSummaryIfNeeded];
      }
    }
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = [(CKConversationListCollectionViewController *)self collectionView];
      BOOL v10 = [v9 indexPathsForSelectedItems];
      int v11 = 138412290;
      CGFloat v12 = v10;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "multi-select: didDeselectItemAtIndexPath. SelectedIndexPaths: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  [(CKConversationListCollectionViewController *)self _updateToolbarItems];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updatedSelectedIndexPathCount object:0];
  [(CKConversationListCollectionViewController *)self performSelector:sel__updatedSelectedIndexPathCount withObject:0 afterDelay:0.0];
}

- (void)_updatedSelectedIndexPathCount
{
  id v5 = [(CKConversationListCollectionViewController *)self delegate];
  id v3 = [(CKConversationListCollectionViewController *)self collectionView];
  BOOL v4 = [v3 indexPathsForSelectedItems];
  objc_msgSend(v5, "conversationListUpdatedSelectedIndexPathCount:", objc_msgSend(v4, "count"));
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        unint64_t v9 = "Not allowing the collection view to begin multiple selection interaction as we have an active pinned conver"
             "sation drop session";
        BOOL v10 = (uint8_t *)&v15;
LABEL_13:
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else if ([v7 section] == 5)
  {
    if ([(CKConversationListCollectionViewController *)self editingMode] != 2)
    {
      BOOL v11 = 1;
      goto LABEL_16;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = 0;
        unint64_t v9 = "Not allowing the collection view to begin multiple selection interaction as we are pin edit mode";
        BOOL v10 = (uint8_t *)&v13;
        goto LABEL_13;
      }
LABEL_14:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "Not allowing the collection view to begin multiple selection interaction as the interaction is not on the act"
           "ive conversations section";
      BOOL v10 = buf;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v9 = a4;
  if (-[CKConversationListCollectionViewController sectionHasSelectableConversations:](self, "sectionHasSelectableConversations:", [v9 section])&& (-[CKConversationListCollectionViewController isEditing](self, "isEditing") & 1) == 0&& !-[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
  {
    [(CKConversationListCollectionViewController *)self setEditingMode:1 animated:CKIsRunningInMacCatalyst() == 0];
    id v5 = [(CKConversationListCollectionViewController *)self collectionView];
    [v5 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];

    id v6 = [(CKConversationListCollectionViewController *)self delegate];
    id v7 = [(CKConversationListCollectionViewController *)self collectionView];
    uint64_t v8 = [v7 indexPathsForSelectedItems];
    objc_msgSend(v6, "conversationListDidBeginMultipleSelectionWithInitialSelectedCount:", objc_msgSend(v8, "count"));
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v6 pinnedConversationView];
    [v5 didEndDisplaying];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 didEndDisplaying];
    }
  }
}

- (BOOL)isSearchActive
{
  id v2 = [(CKConversationListCollectionViewController *)self searchController];
  char v3 = [v2 isActive];

  return v3;
}

- (BOOL)isSearchActiveAndDisplayingResultsForSearchText
{
  if (![(CKConversationListCollectionViewController *)self isSearchActive]) {
    return 0;
  }
  char v3 = [(CKConversationListCollectionViewController *)self searchController];
  BOOL v4 = [v3 searchBar];
  id v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (!v6) {
    return 0;
  }
  id v7 = [(CKConversationListCollectionViewController *)self searchResultsController];
  char v8 = [v7 conversationSearchHasResult];

  return v8;
}

- (void)performSearch:(id)a3 completion:(id)a4
{
  id v14 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (v14)
  {
    id v7 = [(CKConversationListCollectionViewController *)self collectionView];
    objc_msgSend(v7, "__ck_scrollToTop:", 1);

    char v8 = [(CKConversationListCollectionViewController *)self searchController];
    [v8 setActive:1];

    id v9 = [(CKConversationListCollectionViewController *)self searchController];
    BOOL v10 = [v9 searchBar];
    [v10 setText:v14];

    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    BOOL v11 = [(CKConversationListCollectionViewController *)self searchController];
    CGFloat v12 = [v11 searchBar];
    [v12 setText:0];

    __int16 v13 = [(CKConversationListCollectionViewController *)self searchController];
    [v13 setActive:0];

    ck_dispatch_main_after_seconds(v6, 0.0);
  }
}

- (id)preferredFocusEnvironments
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(CKConversationListCollectionViewController *)self _itemIdentifierOfDefaultConversation];
  id v5 = [(CKConversationListCollectionViewController *)self lastSelectedConversationItemIdentifier];
  if ([v5 length]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;
  if ([v7 length])
  {
    char v8 = [(CKConversationListCollectionViewController *)self dataSource];
    id v9 = [v8 indexPathForItemIdentifier:v7];

    BOOL v10 = [(CKConversationListCollectionViewController *)self collectionView];
    BOOL v11 = [v10 cellForItemAtIndexPath:v9];

    if (v11) {
      [v3 addObject:v11];
    }
  }

  return v3;
}

- (BOOL)sectionHasSelectableConversations:(unint64_t)a3
{
  return (a3 < 7) & (0x74u >> a3);
}

- (BOOL)sectionHasActionableConversations:(unint64_t)a3
{
  if (a3 - 5 < 2) {
    return 1;
  }
  if (a3 == 4) {
    return CKIsRunningInMacCatalyst() != 0;
  }
  return a3 == 2;
}

- (BOOL)contextMenuInteractionShouldBeginAtIndexPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((![MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]
     || ([(CKConversationListCollectionViewController *)self conversationAtIndexPath:v4],
         id v5 = objc_claimAutoreleasedReturnValue(),
         [v5 chat],
         uint64_t v6 = objc_claimAutoreleasedReturnValue(),
         v5,
         LODWORD(v5) = [v6 allowedByScreenTime],
         v6,
         v5))
    && -[CKConversationListCollectionViewController sectionHasActionableConversations:](self, "sectionHasActionableConversations:", [v4 section]))
  {
    id v7 = +[CKAdaptivePresentationController sharedInstance];
    char v8 = [v7 presentedViewController];

    BOOL v9 = v8 == 0;
    if (v8 && IMOSLoggingEnabled())
    {
      BOOL v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        __int16 v13 = v8;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Not presenting context menu because presenting viewController: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [v8 firstObject];
  if ([(CKConversationListCollectionViewController *)self contextMenuInteractionShouldBeginAtIndexPath:v9])
  {
    BOOL v10 = [(CKConversationListCollectionViewController *)self dataSource];
    BOOL v11 = [v10 itemIdentifierForIndexPath:v9];

    int v12 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v11];
    if (v12)
    {
      if ((unint64_t)[v8 count] >= 2 && objc_msgSend(v8, "containsObject:", v9))
      {
        __int16 v13 = [(CKConversationListCollectionViewController *)self selectedConversations];
        uint64_t v14 = [(CKConversationListCollectionViewController *)self _topLevelMenuForMultipleSelectedConversations:v13];
      }
      else
      {
        uint64_t v16 = [v9 section];
        id v17 = [(CKConversationListCollectionViewController *)self collectionView];
        __int16 v13 = [v17 cellForItemAtIndexPath:v9];

        uint64_t v14 = [(CKConversationListCollectionViewController *)self _topLevelMenuForItemIdentifier:v11 inSection:v16 withCell:v13];
      }
      int v18 = (void *)v14;

      if (v18)
      {
        id v19 = [(CKConversationListCollectionViewController *)self _previewProviderForConversation:v12];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __112__CKConversationListCollectionViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
        aBlock[3] = &unk_1E56212E0;
        id v24 = v18;
        double v20 = _Block_copy(aBlock);
        __int16 v15 = [MEMORY[0x1E4F428F0] configurationWithIdentifier:v11 previewProvider:v19 actionProvider:v20];
      }
      else
      {
        __int16 v15 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        double v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          double v26 = v9;
          __int16 v27 = 2112;
          double v28 = v11;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController: Warning: expected conversation to create context menu for indexPath: %@, itemIdentifier: %@, returning nil context menu", buf, 0x16u);
        }
      }
      __int16 v15 = 0;
    }
  }
  else
  {
    __int16 v15 = 0;
  }

  return v15;
}

id __112__CKConversationListCollectionViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_previewProviderForConversation:(id)a3
{
  id v4 = a3;
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 supportsOrbPreviewsInConversationList];

    if (v7)
    {
      unsigned int v8 = [v4 limitToLoad];
      BOOL v9 = +[CKUIBehavior sharedBehaviors];
      unint64_t v10 = [v9 defaultConversationViewingMessageCount];

      if (v10 >= v8) {
        unint64_t v10 = v8;
      }
      BOOL v11 = +[CKUIBehavior sharedBehaviors];
      unint64_t v12 = [v11 initialConversationViewingMessageCount];

      if (v10 <= v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = v10;
      }
      [v4 setLoadedMessageCount:v13];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      id v16[2] = __78__CKConversationListCollectionViewController__previewProviderForConversation___block_invoke;
      v16[3] = &unk_1E5629C50;
      v16[4] = self;
      id v17 = v4;
      uint64_t v14 = _Block_copy(v16);
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v5 = _Block_copy(v14);
  }

  return v5;
}

CKTranscriptPreviewController *__78__CKConversationListCollectionViewController__previewProviderForConversation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 frame];
  double v4 = v3;

  [*(id *)(a1 + 32) systemMinimumLayoutMargins];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [*(id *)(a1 + 32) view];
  uint64_t v14 = [v13 effectiveUserInterfaceLayoutDirection];
  if (v14) {
    double v15 = v12;
  }
  else {
    double v15 = v8;
  }
  if (!v14) {
    double v8 = v12;
  }

  uint64_t v16 = -[CKTranscriptPreviewController initWithConversation:transcriptWidth:layoutMargins:]([CKTranscriptPreviewController alloc], "initWithConversation:transcriptWidth:layoutMargins:", *(void *)(a1 + 40), v4, v6, v15, v10, v8);

  return v16;
}

- (void)_deselectSelectedIndexPathsInCollectionView:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  double v6 = [v5 indexPathsForSelectedItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__CKConversationListCollectionViewController__deselectSelectedIndexPathsInCollectionView_animated___block_invoke;
  v8[3] = &unk_1E5629C78;
  id v9 = v5;
  BOOL v10 = a4;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __99__CKConversationListCollectionViewController__deselectSelectedIndexPathsInCollectionView_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:a2 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (id)_previewForHighlightingOrDismissingContextMenuWithConfiguration:(id)a3 indexPath:(id)a4 collectionView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = +[CKUIBehavior sharedBehaviors];
  if (([v10 supportsOrbPreviewsInConversationList] & 1) == 0)
  {

    goto LABEL_10;
  }
  double v11 = [v7 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_10:
    double v21 = 0;
    goto LABEL_24;
  }
  unint64_t v13 = [v9 cellForItemAtIndexPath:v8];
  if (!v13) {
    goto LABEL_22;
  }
  if ([v8 section] != 2) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v14 = v13;
  double v15 = [v14 pinnedConversationView];
  uint64_t v16 = [v15 avatarView];

  id v17 = [v16 _window];

  if (!v17)
  {
    if (IMOSLoggingEnabled())
    {
      double v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Not using the avatar view as the context menu preview because the avatar view is not in a window", buf, 2u);
      }
    }
    goto LABEL_16;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  id v19 = [MEMORY[0x1E4F427D0] bezierPath];
  [v18 setShadowPath:v19];

  double v20 = [MEMORY[0x1E4F428B8] clearColor];
  [v18 setBackgroundColor:v20];

  double v21 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v16 parameters:v18];
  if (!v21)
  {
LABEL_16:
    double v23 = [v13 _window];

    if (v23)
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
      double v25 = +[CKUIBehavior sharedBehaviors];
      double v26 = [v25 theme];
      __int16 v27 = [v26 conversationListCellPreviewBackgroundColor];
      [v24 setBackgroundColor:v27];

      double v21 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v13 parameters:v24];
      goto LABEL_23;
    }
    if (IMOSLoggingEnabled())
    {
      double v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v30 = 0;
        _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Returning nil for context menu preview because the cell is not in a window", v30, 2u);
      }
    }
LABEL_22:
    double v21 = 0;
  }
LABEL_23:

LABEL_24:

  return v21;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v9 identifier];
  double v12 = [(CKConversationListCollectionViewController *)self itemIdentifiersForVisibleContextMenuInteractions];

  if (!v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(CKConversationListCollectionViewController *)self setItemIdentifiersForVisibleContextMenuInteractions:v13];
  }
  id v14 = [(CKConversationListCollectionViewController *)self itemIdentifiersForVisibleContextMenuInteractions];
  [v14 addObject:v11];

  [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v11 animated:1];
  double v15 = [(CKConversationListCollectionViewController *)self _previewForHighlightingOrDismissingContextMenuWithConfiguration:v9 indexPath:v8 collectionView:v10];

  return v15;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  return [(CKConversationListCollectionViewController *)self _previewForHighlightingOrDismissingContextMenuWithConfiguration:a4 indexPath:a5 collectionView:a3];
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v10 previewViewController];
  id location = 0;
  objc_initWeak(&location, self);
  double v12 = [v11 childViewControllers];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = [(CKConversationListCollectionViewController *)self editingMode];
    unint64_t v15 = [(CKConversationListCollectionViewController *)self editingMode];
    BOOL v16 = v14 == 1;
    LODWORD(v13) = v15 == 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v21[3] = &unk_1E5629CA0;
  BOOL v27 = v16;
  id v17 = v9;
  id v22 = v17;
  double v23 = self;
  id v18 = v8;
  id v24 = v18;
  objc_copyWeak(&v26, &location);
  char v28 = v13;
  id v19 = v11;
  id v25 = v19;
  [v10 addAnimations:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2;
  v20[3] = &unk_1E5620C40;
  v20[4] = self;
  [v10 addCompletion:v20];
  [v10 setPreferredCommitStyle:v13];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    id v6 = [*(id *)(a1 + 32) identifier];
    id v2 = [*(id *)(a1 + 40) dataSource];
    double v3 = [v2 indexPathForItemIdentifier:v6];

    [*(id *)(a1 + 48) selectItemAtIndexPath:v3 animated:1 scrollPosition:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _updateToolbarItems];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 73)) {
      return;
    }
    id v5 = [*(id *)(a1 + 56) childViewControllers];
    id v6 = [v5 firstObject];

    double v3 = [v6 conversation];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1056));
    [WeakRetained showConversation:v3 animate:1];
  }
}

void __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_3;
  block[3] = &unk_1E5620C40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1056));
  double v3 = [WeakRetained chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1056));
    id v6 = [v5 chatController];

    [v6 showKeyboardForReply];
  }
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a4, "identifier", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(CKConversationListCollectionViewController *)self itemIdentifiersForVisibleContextMenuInteractions];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(CKConversationListCollectionViewController *)self setItemIdentifiersForVisibleContextMenuInteractions:v7];
  }
  id v8 = [(CKConversationListCollectionViewController *)self itemIdentifiersForVisibleContextMenuInteractions];
  [v8 addObject:v9];

  [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v9 animated:1];
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__CKConversationListCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke_2;
  aBlock[3] = &unk_1E5623328;
  id v11 = v9;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  double v12 = _Block_copy(aBlock);
  uint64_t v13 = v12;
  if (v10)
  {
    [v10 addAnimations:&__block_literal_global_288];
    [v10 addCompletion:v13];
  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __117__CKConversationListCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = (uint64_t *)(a1 + 32);
  double v3 = [*(id *)(a1 + 32) identifier];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = [WeakRetained itemIdentifiersForVisibleContextMenuInteractions];
    [v5 removeObject:v3];

    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    [v6 updateContentsOfCellWithItemIdentifier:v3 animated:1];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __117__CKConversationListCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke_2_cold_1(v2, v7);
    }
  }
  if (!CKIsRunningInMacCatalyst())
  {
    id v8 = (id *)(a1 + 40);
    id v9 = objc_loadWeakRetained(v8);
    id v10 = [v9 conversationToUnpinPendingOrbDismissal];

    id v11 = (void *)MEMORY[0x1E4F6BB70];
    if (v10)
    {
      id v12 = objc_loadWeakRetained(v8);
      [v12 setPinningInteractionMethod:4];

      id v13 = objc_loadWeakRetained(v8);
      unint64_t v14 = [v13 conversationToUnpinPendingOrbDismissal];
      [v13 unpinConversation:v14 withReason:*v11];

      id v15 = objc_loadWeakRetained(v8);
      [v15 setConversationToUnpinPendingOrbDismissal:0];
    }
    id v16 = objc_loadWeakRetained(v8);
    id v17 = [v16 conversationToPinPendingOrbDismissal];

    if (v17)
    {
      id v18 = objc_loadWeakRetained(v8);
      [v18 setPinningInteractionMethod:4];

      id v19 = objc_loadWeakRetained(v8);
      double v20 = [v19 conversationToPinPendingOrbDismissal];
      [v19 pinConversation:v20 withReason:*v11];

      id v21 = objc_loadWeakRetained(v8);
      [v21 setConversationToPinPendingOrbDismissal:0];
    }
  }
}

- (id)_topLevelMenuForMultipleSelectedConversations:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKConversationListCollectionViewController *)self filterMode] != 7)
  {
    if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
    {
      uint64_t v5 = [(CKConversationListCollectionViewController *)self junkConversationMenu:v4];
      goto LABEL_5;
    }
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    id v8 = [(CKConversationListCollectionViewController *)self _markAsActionForConversations:v4];
    id v9 = [(CKConversationListCollectionViewController *)self _muteActionConversations:v4];
    id v10 = [(CKConversationListCollectionViewController *)self _deleteActionForSelectedConversations:v4];
    if (v8) {
      [v7 addObject:v8];
    }
    if (v9) {
      [v7 addObject:v9];
    }
    if (v10)
    {
      id v11 = (void *)MEMORY[0x1E4F42B80];
      v19[0] = v10;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      id v13 = [v11 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v12];

      [v7 addObject:v13];
    }
    unint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v15 = [v14 BOOLForKey:@"CKInternalInstallShouldHideDebugMenu"];

    id v16 = [MEMORY[0x1E4F6C360] sharedInstance];
    if ([v16 isInternalInstall] && (v15 & 1) == 0)
    {
      int v17 = CKIsRunningInMacCatalyst();

      if (v17)
      {
LABEL_17:
        if ([v7 count])
        {
          id v6 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v7];
        }
        else
        {
          id v6 = 0;
        }

        goto LABEL_21;
      }
      id v16 = [(CKConversationListCollectionViewController *)self _internalMenuForSelectedConversations:v4];
      [v7 addObject:v16];
    }

    goto LABEL_17;
  }
  uint64_t v5 = [(CKConversationListCollectionViewController *)self recentlyDeletedConversationMenu:v4];
LABEL_5:
  id v6 = (void *)v5;
LABEL_21:

  return v6;
}

- (id)_topLevelMenuForItemIdentifier:(id)a3 inSection:(unint64_t)a4 withCell:(id)a5
{
  uint64_t v5 = [(CKConversationListCollectionViewController *)self _conversationActionMenusForItemIdentifier:a3 inSection:a4 withCell:a5 forSearch:0];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_conversationActionMenusForItemIdentifier:(id)a3 inSection:(unint64_t)a4 withCell:(id)a5 forSearch:(BOOL)a6
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v10];
  v70[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
  {
    unint64_t v14 = [(CKConversationListCollectionViewController *)self recentlyDeletedConversationMenu:v13];
    uint64_t v69 = v14;
    char v15 = (void *)MEMORY[0x1E4F1C978];
    id v16 = &v69;
LABEL_5:
    int v17 = [v15 arrayWithObjects:v16 count:1];
    goto LABEL_29;
  }
  if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    unint64_t v14 = [(CKConversationListCollectionViewController *)self junkConversationMenu:v13];
    uint64_t v68 = v14;
    char v15 = (void *)MEMORY[0x1E4F1C978];
    id v16 = &v68;
    goto LABEL_5;
  }
  unint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:MEMORY[0x1E4F1CBF0]];
  uint64_t v64 = [(CKConversationListCollectionViewController *)self _deleteConversationActionForItemIdentifier:v10 withCell:v11];
  if (a4 != 4
    || ![(CKConversationListCollectionViewController *)self sectionHasActionableConversations:4])
  {
    uint64_t v22 = [(CKConversationListCollectionViewController *)self _pinActionForItemIdentifier:v10];
    double v63 = [(CKConversationListCollectionViewController *)self _markAsActionForConversations:v13];
    double v62 = [(CKConversationListCollectionViewController *)self _muteActionConversations:v13];
    id v61 = [(CKConversationListCollectionViewController *)self _openConversationInNewWindowActionForItemIdentifier:v10];
    uint64_t v60 = (void *)v22;
    if (CKIsRunningInMacCatalyst())
    {
      if (v22)
      {
        double v23 = (void *)MEMORY[0x1E4F42B80];
        uint64_t v66 = v22;
        id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
        id v25 = [v23 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v24];

        [v14 addObject:v25];
      }
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v27 = v26;
      if (v63) {
        objc_msgSend(v26, "addObject:");
      }
      if (v62) {
        objc_msgSend(v27, "addObject:");
      }
      double v59 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v27];
      objc_msgSend(v14, "addObject:");
      [v27 removeAllObjects];
      char v28 = [(CKConversationListCollectionViewController *)self _conversationDetailsActionForItemIdentifier:v10 withCell:v11];
      if (v61) {
        objc_msgSend(v27, "addObject:");
      }
      if (v28 && !a6) {
        [v27 addObject:v28];
      }
      uint64_t v29 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v27];
      [v14 addObject:v29];
      [v27 removeAllObjects];
      if (v64) {
        [v27 addObject:v64];
      }
      double v30 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v27];
      [v14 addObject:v30];
    }
    else
    {
      id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v27 = v42;
      if (v22) {
        [v42 addObject:v22];
      }
      if (v63) {
        objc_msgSend(v27, "addObject:");
      }
      if (v62) {
        objc_msgSend(v27, "addObject:");
      }
      if (v61) {
        [v27 addObject:v61];
      }
      if (v64) {
        objc_msgSend(v27, "addObject:");
      }
      double v59 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v27];
      objc_msgSend(v14, "addObject:");
      CGRect v43 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v44 = [v43 isInboxSummaryEnabled];

      if (v44)
      {
        long long v45 = [v12 chat];
        long long v46 = [v45 chatSummary];
        if (v46)
        {
          id v57 = v46;
          [v12 chat];
          v47 = double v58 = v45;
          CGFloat v56 = [(CKConversationListCollectionViewController *)self reportConcernForChat:v47];

          CGFloat v54 = (void *)MEMORY[0x1E4F42B80];
          double v55 = CKFrameworkBundle();
          long long v48 = [v55 localizedStringForKey:@"SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v65 = v56;
          long long v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
          CGFloat v50 = [v54 menuWithTitle:v48 image:0 identifier:0 options:1 children:v49];

          long long v45 = v58;
          [v14 addObject:v50];

          long long v46 = v57;
        }
      }
      double v51 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", v54);
      char v52 = [v51 BOOLForKey:@"CKInternalInstallShouldHideDebugMenu"];

      char v28 = [MEMORY[0x1E4F6C360] sharedInstance];
      if ([v28 isInternalInstall] && (v52 & 1) == 0)
      {
        int v53 = CKIsRunningInMacCatalyst();

        if (v53) {
          goto LABEL_25;
        }
        char v28 = [(CKConversationListCollectionViewController *)self _internalMenuForSelectedConversation:v12];
        [v14 addObject:v28];
      }
    }

LABEL_25:
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v33 = [WeakRetained chatController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v35 = objc_loadWeakRetained((id *)p_delegate);
      BOOL v36 = [v35 chatController];

      long long v37 = [v36 entryView];
      double v38 = [v37 contentView];
      double v39 = [v38 textView];

      double v40 = objc_opt_new();
      [v39 setPasteConfiguration:v40];
    }
    int v17 = (void *)[v14 copy];

    id v21 = v60;
    goto LABEL_28;
  }
  id v18 = (void *)MEMORY[0x1E4F42B80];
  double v67 = v64;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  uint64_t v20 = [v18 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v19];

  id v21 = (void *)v20;
  [v14 addObject:v20];
  int v17 = (void *)[v14 copy];
LABEL_28:

LABEL_29:

  return v17;
}

- (id)_internalMenuForSelectedConversation:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[CKConversationListCollectionViewController _internalMenuForSelectedConversations:customMenuElements:](self, "_internalMenuForSelectedConversations:customMenuElements:", v6, 0, v9, v10);

  return v7;
}

- (id)_internalMenuForSelectedConversations:(id)a3
{
  return [(CKConversationListCollectionViewController *)self _internalMenuForSelectedConversations:a3 customMenuElements:0];
}

- (id)_internalMenuForSelectedConversations:(id)a3 customMenuElements:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"info.circle"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __103__CKConversationListCollectionViewController__internalMenuForSelectedConversations_customMenuElements___block_invoke;
  v19[3] = &unk_1E56210D8;
  objc_copyWeak(&v21, &location);
  id v11 = v6;
  id v20 = v11;
  id v12 = [v9 actionWithTitle:@"Conversation Details" image:v10 identifier:0 handler:v19];

  [v8 addObject:v12];
  if (v7) {
    [v8 addObjectsFromArray:v7];
  }
  id v13 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v8];
  unint64_t v14 = (void *)MEMORY[0x1E4F42B80];
  char v15 = [MEMORY[0x1E4F42A80] systemImageNamed:@"apple.logo"];
  v23[0] = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  int v17 = [v14 menuWithTitle:@"Internal" image:v15 identifier:0 options:128 children:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v17;
}

void __103__CKConversationListCollectionViewController__internalMenuForSelectedConversations_customMenuElements___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = [WeakRetained view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 showInspectorViewForConversations:*(void *)(a1 + 32)];
  }
}

- (id)_markAsActionForConversations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(CKConversationListCollectionViewController *)self _conversationsEligibleForReadStateToggle:v4];
    if ([v5 count])
    {
      BOOL v6 = [(CKConversationListCollectionViewController *)self _hasReadAllConversations:v5];
      if (v6)
      {
        id v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"message.badge"];
        unint64_t v8 = [v5 count];
        id v9 = CKFrameworkBundle();
        if (v8 > 1) {
          uint64_t v10 = @"MARK_AS_UNREAD_PLURAL";
        }
        else {
          uint64_t v10 = @"MARK_AS_UNREAD";
        }
      }
      else
      {
        id v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.message"];
        unint64_t v12 = [v5 count];
        id v9 = CKFrameworkBundle();
        if (v12 >= 2) {
          uint64_t v10 = @"MARK_AS_READ_PLURAL";
        }
        else {
          uint64_t v10 = @"MARK_AS_READ";
        }
      }
      id v13 = [v9 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit"];

      id location = 0;
      objc_initWeak(&location, self);
      unint64_t v14 = (void *)MEMORY[0x1E4F426E8];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      id v16[2] = __76__CKConversationListCollectionViewController__markAsActionForConversations___block_invoke;
      v16[3] = &unk_1E5629CC8;
      objc_copyWeak(&v18, &location);
      id v17 = v4;
      BOOL v19 = v6;
      id v11 = [v14 actionWithTitle:v13 image:v7 identifier:0 handler:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __76__CKConversationListCollectionViewController__markAsActionForConversations___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateConversations:*(void *)(a1 + 32) asRead:*(unsigned char *)(a1 + 48) == 0];

  id v4 = objc_loadWeakRetained(v2);
  [v4 updateContentsOfAllCellsAnimated:1];
}

- (BOOL)_hasReadAllConversations:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "hasUnreadMessages", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)_conversationsEligibleForReadStateToggle:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__CKConversationListCollectionViewController__conversationsEligibleForReadStateToggle___block_invoke;
  v8[3] = &unk_1E5622608;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __87__CKConversationListCollectionViewController__conversationsEligibleForReadStateToggle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 canReadStateBeToggled]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_updateConversations:(id)a3 asRead:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__CKConversationListCollectionViewController__updateConversations_asRead___block_invoke;
  v4[3] = &__block_descriptor_33_e31_v32__0__CKConversation_8Q16_B24l;
  BOOL v5 = a4;
  [a3 enumerateObjectsUsingBlock:v4];
}

uint64_t __74__CKConversationListCollectionViewController__updateConversations_asRead___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 markAllMessagesAsRead];
  }
  else {
    return [a2 markLastMessageAsUnread];
  }
}

- (id)_pinActionForItemIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CKConversationListCollectionViewController *)self shouldShowPinnedConversations])
  {
    BOOL v5 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v4];
    if (v5)
    {
      id v6 = [(CKConversationListCollectionViewController *)self dataSource];
      id v7 = [v6 indexPathForItemIdentifier:v4];

      uint64_t v8 = [v7 section];
      int v9 = v8 == 2;
      if (v9 != [v5 isPinned])
      {
        long long v10 = IMLogHandleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          [(CKConversationListCollectionViewController *)v5 _pinActionForItemIdentifier:v10];
        }
      }
      long long v11 = CKFrameworkBundle();
      long long v12 = v11;
      if (v8 == 2) {
        long long v13 = @"UNPIN_ACTION";
      }
      else {
        long long v13 = @"PIN_ACTION";
      }
      if (v8 == 2) {
        unint64_t v14 = @"pin.slash";
      }
      else {
        unint64_t v14 = @"pin";
      }
      uint64_t v15 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKit"];

      id v16 = [MEMORY[0x1E4F42A80] systemImageNamed:v14];
      id location = 0;
      objc_initWeak(&location, self);
      id v17 = (void *)MEMORY[0x1E4F426E8];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __74__CKConversationListCollectionViewController__pinActionForItemIdentifier___block_invoke;
      v20[3] = &unk_1E5629CC8;
      objc_copyWeak(&v22, &location);
      char v23 = v9;
      id v21 = v5;
      id v18 = [v17 actionWithTitle:v15 image:v16 identifier:0 handler:v20];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void __74__CKConversationListCollectionViewController__pinActionForItemIdentifier___block_invoke(uint64_t a1)
{
  if (CKIsRunningInMacCatalyst())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setPinningInteractionMethod:4];

    LODWORD(WeakRetained) = *(unsigned __int8 *)(a1 + 48);
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *MEMORY[0x1E4F6BB70];
    id v9 = v3;
    if (WeakRetained) {
      [v3 unpinConversation:v4 withReason:v5];
    }
    else {
      [v3 pinConversation:v4 withReason:v5];
    }
  }
  else
  {
    int v6 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = v8;
    if (v6) {
      [v8 setConversationToUnpinPendingOrbDismissal:v7];
    }
    else {
      [v8 setConversationToPinPendingOrbDismissal:v7];
    }
  }
}

- (id)_muteActionConversations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKConversationListCollectionViewController *)self _conversationsEligibleForMute:v4];
  if (![v5 count])
  {
    id v11 = 0;
    goto LABEL_14;
  }
  BOOL v6 = [(CKConversationListCollectionViewController *)self _hasAlertsEnabledForAllConversations:v5];
  int v7 = CKIsRunningInMacCatalyst();
  id v8 = CKFrameworkBundle();
  id v9 = v8;
  if (v7)
  {
    long long v10 = [v8 localizedStringForKey:@"CONVERSATION_LIST_CONTEXT_MENU_MAC_HIDE_ALERTS_TOGGLE_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!v6)
    {
      long long v10 = [v8 localizedStringForKey:@"CONVERSATION_LIST_CONTEXT_MENU_SHOW_ALERTS_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_10:
      long long v12 = @"bell";
      goto LABEL_11;
    }
    long long v10 = [v8 localizedStringForKey:@"CONVERSATION_LIST_CONTEXT_MENU_HIDE_ALERTS_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  long long v12 = @"bell.slash";
LABEL_11:
  long long v13 = [MEMORY[0x1E4F42A80] systemImageNamed:v12];
  id location = 0;
  objc_initWeak(&location, self);
  unint64_t v14 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = __71__CKConversationListCollectionViewController__muteActionConversations___block_invoke;
  id v20 = &unk_1E5629CC8;
  objc_copyWeak(&v22, &location);
  id v21 = v5;
  BOOL v23 = v6;
  uint64_t v15 = [v14 actionWithTitle:v10 image:v13 identifier:0 handler:&v17];
  if (CKIsRunningInMacCatalyst()) {
    objc_msgSend(v15, "setState:", !v6, v17, v18, v19, v20);
  }
  id v11 = v15;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

LABEL_14:

  return v11;
}

void __71__CKConversationListCollectionViewController__muteActionConversations___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateConversations:*(void *)(a1 + 32) alertsHidden:*(unsigned __int8 *)(a1 + 48)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 updateContentsOfAllCellsAnimated:1];
}

- (BOOL)_hasAlertsEnabledForAllConversations:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isMuted", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)_conversationsEligibleForMute:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__CKConversationListCollectionViewController__conversationsEligibleForMute___block_invoke;
  v8[3] = &unk_1E5622608;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __76__CKConversationListCollectionViewController__conversationsEligibleForMute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 canMuteStateBeToggled]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_updateConversations:(id)a3 alertsHidden:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__CKConversationListCollectionViewController__updateConversations_alertsHidden___block_invoke;
  v4[3] = &__block_descriptor_33_e31_v32__0__CKConversation_8Q16_B24l;
  BOOL v5 = a4;
  [a3 enumerateObjectsUsingBlock:v4];
}

void __80__CKConversationListCollectionViewController__updateConversations_alertsHidden___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    dispatch_time_t v2 = (void *)MEMORY[0x1E4F1C9C8];
    id v3 = a2;
    id v4 = [v2 distantFuture];
    objc_msgSend(v3, "setMutedUntilDate:");
  }
  else
  {
    id v4 = a2;
    [v4 unmute];
  }
}

- (id)_deleteConversationActionForItemIdentifier:(id)a3 withCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];
  id v9 = v8;
  if (v8 && [v8 isUserDeletable])
  {
    int v10 = CKIsRunningInMacCatalyst();
    long long v11 = CKFrameworkBundle();
    long long v12 = v11;
    if (v10) {
      long long v13 = @"DELETE_ELLIPSIS";
    }
    else {
      long long v13 = @"DELETE";
    }
    unint64_t v14 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v15 = [MEMORY[0x1E4F42A80] systemImageNamed:@"trash"];
    id location = 0;
    objc_initWeak(&location, self);
    id v16 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __98__CKConversationListCollectionViewController__deleteConversationActionForItemIdentifier_withCell___block_invoke;
    id v22 = &unk_1E5629D10;
    objc_copyWeak(&v25, &location);
    id v23 = v6;
    id v24 = v7;
    uint64_t v17 = [v16 actionWithTitle:v14 image:v15 identifier:0 handler:&v19];
    if (!CKIsRunningInMacCatalyst()) {
      objc_msgSend(v17, "setAttributes:", 2, v19, v20, v21, v22, v23);
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

void __98__CKConversationListCollectionViewController__deleteConversationActionForItemIdentifier_withCell___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained deleteButtonTappedForItemIdentifier:*(void *)(a1 + 32) completionHandler:0 cellToUpdate:*(void *)(a1 + 40)];
}

- (id)_deleteActionForSelectedConversations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    int v5 = CKIsRunningInMacCatalyst();
    id v6 = CKFrameworkBundle();
    id v7 = v6;
    if (v5) {
      BOOL v8 = @"DELETE_ELLIPSIS";
    }
    else {
      BOOL v8 = @"DELETE";
    }
    id v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"trash"];
    location[0] = 0;
    objc_initWeak(location, self);
    long long v11 = (void *)MEMORY[0x1E4F426E8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__CKConversationListCollectionViewController__deleteActionForSelectedConversations___block_invoke;
    v15[3] = &unk_1E5620ED8;
    objc_copyWeak(&v16, location);
    long long v12 = [v11 actionWithTitle:v9 image:v10 identifier:0 handler:v15];
    if (!CKIsRunningInMacCatalyst()) {
      [v12 setAttributes:2];
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "No conversations to perform delete on.", (uint8_t *)location, 2u);
      }
    }
    long long v12 = 0;
  }

  return v12;
}

void __84__CKConversationListCollectionViewController__deleteActionForSelectedConversations___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained recoverableDeleteSelectedConversations];
}

- (id)_openConversationInNewWindowActionForItemIdentifier:(id)a3
{
  id v4 = a3;
  if ((IMSharedHelperDeviceIsiPad() & 1) != 0 || CKIsRunningInMacCatalyst())
  {
    int v5 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v4];
    id v6 = v5;
    if (v5 && ([v5 isPending] & 1) == 0)
    {
      if (CKIsRunningInMacCatalyst())
      {
        id location = 0;
        objc_initWeak(&location, self);
        BOOL v8 = (void *)MEMORY[0x1E4F426E8];
        id v9 = CKFrameworkBundle();
        int v10 = [v9 localizedStringForKey:@"OPEN_IN_NEW_WINDOW" value:&stru_1EDE4CA38 table:@"ChatKit"];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        void v19[2] = __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke;
        v19[3] = &unk_1E56210D8;
        objc_copyWeak(&v21, &location);
        id v20 = v6;
        id v7 = [v8 actionWithTitle:v10 image:0 identifier:0 handler:v19];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        long long v11 = [v6 activityForNewScene];
        if (v11)
        {
          long long v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"rectangle.badge.plus"];
          long long v13 = (void *)MEMORY[0x1E4F426E8];
          unint64_t v14 = CKFrameworkBundle();
          uint64_t v15 = [v14 localizedStringForKey:@"OPEN_IN_NEW_WINDOW" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke_2;
          v17[3] = &unk_1E56211C8;
          id v18 = v11;
          id v7 = [v13 actionWithTitle:v15 image:v12 identifier:0 handler:v17];
        }
        else
        {
          long long v12 = IMLogHandleForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[CKConversationListCollectionViewController _openConversationInNewWindowActionForItemIdentifier:]();
          }
          id v7 = 0;
        }
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_time_t v2 = [WeakRetained delegate];
  [v2 showConversationInNewWindow:*(void *)(a1 + 32)];
}

void __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke_2(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F43070]);
  [v3 setPreferredPresentationStyle:2];
  dispatch_time_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  [v2 requestSceneSessionActivation:0 userActivity:*(void *)(a1 + 32) options:v3 errorHandler:0];
}

- (id)_conversationDetailsActionForItemIdentifier:(id)a3 withCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];
  id v9 = [v8 chat];

  if (v9)
  {
    id location = 0;
    objc_initWeak(&location, self);
    int v10 = (void *)MEMORY[0x1E4F426E8];
    long long v11 = CKFrameworkBundle();
    long long v12 = [v11 localizedStringForKey:@"SHOW_DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__CKConversationListCollectionViewController__conversationDetailsActionForItemIdentifier_withCell___block_invoke;
    v14[3] = &unk_1E5629D10;
    objc_copyWeak(&v17, &location);
    id v15 = v6;
    id v16 = v7;
    id v9 = [v10 actionWithTitle:v12 image:0 identifier:0 handler:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __99__CKConversationListCollectionViewController__conversationDetailsActionForItemIdentifier_withCell___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained presentDetailsForItemIdentifier:*(void *)(a1 + 32) fromView:*(void *)(a1 + 40)];
}

- (void)presentDetailsForItemIdentifier:(id)a3 fromView:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:a3];
  BOOL v8 = [[CKDetailsControllerAdapter alloc] initWithConversation:v7];
  id v9 = [[CKDetailsNavigationController alloc] initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
  [(CKDetailsNavigationController *)v9 setDetailsAdapter:v8];
  uint64_t v10 = [(CKDetailsControllerAdapter *)v8 detailsController];
  long long v11 = (void *)v10;
  if (v10)
  {
    v36[0] = v10;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [(CKDetailsNavigationController *)v9 setViewControllers:v12];
  }
  else
  {
    [(CKDetailsNavigationController *)v9 setViewControllers:MEMORY[0x1E4F1CBF0]];
  }
  [(CKDetailsNavigationController *)v9 setModalPresentationStyle:7];
  [(CKDetailsNavigationController *)v9 setDelegate:v11];
  long long v13 = [(CKDetailsNavigationController *)v9 popoverPresentationController];
  [v13 setSourceView:v6];

  [v6 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v6 layoutMargins];
  double v23 = v15 + v22;
  double v25 = v17 + v24;
  double v27 = v19 - (v22 + v26);
  double v29 = v21 - (v24 + v28);
  double v30 = [(CKDetailsNavigationController *)v9 popoverPresentationController];
  objc_msgSend(v30, "setSourceRect:", v23, v25, v27, v29);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CKConversationListCollectionViewController_presentDetailsForItemIdentifier_fromView___block_invoke;
  aBlock[3] = &unk_1E5621578;
  id v35 = v6;
  id v31 = v6;
  double v32 = _Block_copy(aBlock);
  int v33 = +[CKAdaptivePresentationController sharedInstance];
  [v33 presentViewController:v9 fromViewController:self presentationHandler:v32 dismissalHandler:0 animated:1 completion:0];
}

id __87__CKConversationListCollectionViewController_presentDetailsForItemIdentifier_fromView___block_invoke(uint64_t a1, double *a2, void *a3)
{
  [*(id *)(a1 + 32) bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [*(id *)(a1 + 32) layoutMargins];
  *a2 = v7 + v14;
  a2[1] = v9 + v15;
  a2[2] = v11 - (v14 + v16);
  a2[3] = v13 - (v15 + v17);
  id result = *(id *)(a1 + 32);
  *a3 = result;
  return result;
}

- (void)unpinButtonTappedForCell:(id)a3 withConversation:(id)a4
{
  id v5 = a4;
  [(CKConversationListCollectionViewController *)self setPinningInteractionMethod:2];
  [(CKConversationListCollectionViewController *)self unpinConversation:v5 withReason:*MEMORY[0x1E4F6BB88]];
}

- (CGRect)collectionViewBoundsForPinnedConversationCollectionViewCell:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)isDetailsNavigationControllerDetached
{
  dispatch_time_t v2 = [(CKConversationListCollectionViewController *)self delegate];
  char v3 = [v2 isDetailsNavigationControllerDetached];

  return v3;
}

- (BOOL)hasDetailsNavigationController
{
  dispatch_time_t v2 = [(CKConversationListCollectionViewController *)self delegate];
  char v3 = [v2 hasDetailsNavigationController];

  return v3;
}

- (void)dismissDetailsNavigationController
{
  id v2 = +[CKAdaptivePresentationController sharedInstance];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)dismissDetailsViewAndShowConversationList
{
  id v2 = [(CKConversationListCollectionViewController *)self delegate];
  [v2 dismissDetailsControllerAnimated:1];
}

- (void)detailsAdapter:(id)a3 wantsToStageComposition:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (CKIsRunningInMacCatalyst())
  {
    double v7 = [(CKConversationListCollectionViewController *)self delegate];
    [v7 dismissDetailsControllerAnimated:1];

    double v8 = [v9 conversation];
    [(CKConversationListCollectionViewController *)self _showConversation:v8 withComposition:v6];
  }
}

- (void)detailsAdapterDidDismiss:(id)a3
{
  if ([(CKConversationListCollectionViewController *)self _shouldRestoreFirstResponderAfterDetailsViewDismiss])
  {
    [(CKConversationListCollectionViewController *)self becomeFirstResponder];
  }
}

- (void)detailsAdapterWantsToPresentKTContactVerificationUI:(id)a3
{
  id v5 = [a3 conversation];
  double v4 = [v5 chat];
  +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:v4 fromViewController:self];
}

- (void)detailsAdapterWantsToPresentReportToAppleUI:(id)a3
{
}

- (BOOL)_shouldRestoreFirstResponderAfterDetailsViewDismiss
{
  return 0;
}

- (void)pinButtonTappedForCell:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  double v7 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v6];
  if (v7)
  {
    [(CKConversationListCollectionViewController *)self pinConversation:v7 withReason:*MEMORY[0x1E4F6BB88]];
  }
  else if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      double v10 = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "The user tapped the pin button, but the conversation at index path %@ was nil.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)avatarHeaderWasTappedForConversation:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[CKDetailsControllerAdapter alloc] initWithConversation:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
  uint64_t v7 = [(CKDetailsControllerAdapter *)v5 detailsController];
  double v8 = (void *)v7;
  if (v7)
  {
    v13[0] = v7;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v6 setViewControllers:v9];
  }
  else
  {
    [v6 setViewControllers:MEMORY[0x1E4F1CBF0]];
  }
  [v6 setModalPresentationStyle:6];
  [v6 setDelegate:v8];
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__dismissPresentedNavController_];
  uint64_t v11 = [v8 navigationItem];
  [v11 setRightBarButtonItem:v10];

  double v12 = [(CKConversationListCollectionViewController *)self navigationController];
  [v12 presentViewController:v6 animated:1 completion:0];
}

- (BOOL)listCellIsBeingDisplayedAsGhostedCellInPinnedSection:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  BOOL v9 = 0;
  if (v6)
  {
    uint64_t v7 = [v5 presentationIndexPathForDataSourceIndexPath:v6];
    uint64_t v8 = [v7 section];

    if (v8 == 2) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4
{
  id v9 = a4;
  id v5 = [(CKConversationListCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v9];

  if ([v6 section] == 4)
  {
    uint64_t v7 = [(CKConversationListCollectionViewController *)self delegate];
    [v7 conversationListControllerTappedDeleteNewMessage:self];
  }
  else
  {
    uint64_t v8 = [(CKConversationListCollectionViewController *)self dataSource];
    uint64_t v7 = [v8 itemIdentifierForIndexPath:v6];

    [(CKConversationListCollectionViewController *)self deleteButtonTappedForItemIdentifier:v7 completionHandler:0 cellToUpdate:v9];
  }
}

- (void)togglePinStateForConversation:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F6BD70] processSupportsPinnedConversations])
  {
    uint64_t v8 = [(CKConversationListCollectionViewController *)self frozenPinnedConversations];
    id v9 = v8;
    if (v8)
    {
      if ([v8 containsObject:v6])
      {
LABEL_4:
        [(CKConversationListCollectionViewController *)self unpinConversation:v6 withReason:v7];
LABEL_10:

        goto LABEL_11;
      }
    }
    else if ([v6 isPinned])
    {
      goto LABEL_4;
    }
    [(CKConversationListCollectionViewController *)self pinConversation:v6 withReason:v7];
    goto LABEL_10;
  }
  double v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CKConversationListCollectionViewController togglePinStateForConversation:withReason:]();
  }

LABEL_11:
}

- (void)unpinConversation:(id)a3 withReason:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F6BD70] processSupportsPinnedConversations])
  {
    if (v6)
    {
      double v29 = [(CKConversationListCollectionViewController *)self frozenPinnedConversations];
      int v8 = IMOSLoggingEnabled();
      if (v29)
      {
        if (v8)
        {
          id v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v6;
            _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "-[unpinConversation:] Pinned conversations are frozen. Removing conversation from frozenPinnedConversations: %@", buf, 0xCu);
          }
        }
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __75__CKConversationListCollectionViewController_unpinConversation_withReason___block_invoke;
        v34[3] = &unk_1E5622550;
        id v35 = v6;
        double v10 = objc_msgSend(v29, "__imArrayByFilteringWithBlock:", v34);
        [(CKConversationListCollectionViewController *)self setFrozenPinnedConversations:v10];

        [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:1];
        [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
        uint64_t v11 = v35;
        goto LABEL_39;
      }
      if (v8)
      {
        double v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v38 = v7;
          __int16 v39 = 2112;
          id v40 = v6;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "-[unpinConversation:] reason: %@, conversation: %@", buf, 0x16u);
        }
      }
      double v15 = [(CKConversationListCollectionViewController *)self dataSource];
      uint64_t v11 = [v15 snapshot];

      double v16 = [(CKConversationListCollectionViewController *)self pinnedConversationsFromSnapshot:v11];
      double v28 = (void *)[v16 mutableCopy];

      double v27 = [v6 pinningIdentifier];
      if ([v27 length])
      {
        uint64_t v17 = [v28 count];
        [v28 removeObject:v6];
        if (v17 != [v28 count])
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v20 = v28;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v36 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v31 != v22) {
                  objc_enumerationMutation(v20);
                }
                double v24 = [*(id *)(*((void *)&v30 + 1) + 8 * i) chat];
                [v19 addObject:v24];
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v36 count:16];
            }
            while (v21);
          }

          double v25 = [MEMORY[0x1E4F6BD70] sharedInstance];
          double v26 = (void *)[v19 copy];
          [v25 setPinnedChats:v26 withUpdateReason:v7];

          goto LABEL_38;
        }
        if (!IMOSLoggingEnabled())
        {
LABEL_38:

LABEL_39:
          goto LABEL_40;
        }
        double v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v6;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Attempted to unpin conversation with identifier that was not in the pinned conversation identifier list. Ignoring. Conversation: %@", buf, 0xCu);
        }
      }
      else
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_38;
        }
        double v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v6;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Attempted to unpin conversation with nil identifier. Ignoring. Conversation: %@", buf, 0xCu);
        }
      }

      goto LABEL_38;
    }
    if (IMOSLoggingEnabled())
    {
      double v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Tried to unpin a nil conversation.", buf, 2u);
      }
    }
  }
  else
  {
    double v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CKConversationListCollectionViewController unpinConversation:withReason:]();
    }
  }
LABEL_40:
}

uint64_t __75__CKConversationListCollectionViewController_unpinConversation_withReason___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 pinningIdentifier];
  id v4 = [*(id *)(a1 + 32) pinningIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

- (void)pinConversation:(id)a3 withReason:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F6BD70] processSupportsPinnedConversations])
  {
    if (v6)
    {
      int v8 = +[CKUIBehavior sharedBehaviors];
      unint64_t v9 = [v8 maximumNumberOfPinnedConversations];

      double v10 = [(CKConversationListCollectionViewController *)self frozenPinnedConversations];
      uint64_t v11 = v10;
      if (v10)
      {
        if ([v10 count] >= v9)
        {
          [(CKConversationListCollectionViewController *)self showCannotPinMoreConversationsAlert];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            double v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v49 = v6;
              _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "-[pinConversation:] Pinned conversations are frozen. Adding conversation to frozenPinnedConversations: %@", buf, 0xCu);
            }
          }
          double v13 = [v11 arrayByAddingObject:v6];
          [(CKConversationListCollectionViewController *)self setFrozenPinnedConversations:v13];

          if (![(CKConversationListCollectionViewController *)self holdPinningUpdatesForOnboardingAnimation])
          {
            [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:1];
            [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
          }
        }
      }
      else
      {
        double v16 = [(CKConversationListCollectionViewController *)self dataSource];
        long long v37 = [v16 snapshot];

        uint64_t v17 = [(CKConversationListCollectionViewController *)self pinnedConversationsFromSnapshot:v37];
        uint64_t v18 = [v17 mutableCopy];
        id v19 = (void *)v18;
        id v20 = (void *)MEMORY[0x1E4F1CBF0];
        if (v18) {
          id v20 = (void *)v18;
        }
        id v21 = v20;

        BOOL v36 = v21;
        if ([v21 count] >= v9)
        {
          [(CKConversationListCollectionViewController *)self showCannotPinMoreConversationsAlert];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v49 = v7;
              __int16 v50 = 2112;
              id v51 = v6;
              _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "-[pinConversation:] reason: %@, conversation: %@", buf, 0x16u);
            }
          }
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v23 = v21;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v47 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v43;
            while (2)
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v43 != v25) {
                  objc_enumerationMutation(v23);
                }
                if (*(id *)(*((void *)&v42 + 1) + 8 * i) == v6)
                {

                  if (IMOSLoggingEnabled())
                  {
                    id v35 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v49 = v6;
                      _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Attempted to pin conversation with identifier that was already in the pinned conversation identifier list. Ignoring. Conversation: %@", buf, 0xCu);
                    }
                  }
                  goto LABEL_47;
                }
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v47 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

          [v23 addObject:v6];
          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v28 = v23;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v39 != v30) {
                  objc_enumerationMutation(v28);
                }
                long long v32 = [*(id *)(*((void *)&v38 + 1) + 8 * j) chat];
                [v27 addObject:v32];
              }
              uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v29);
          }

          long long v33 = [MEMORY[0x1E4F6BD70] sharedInstance];
          uint64_t v34 = (void *)[v27 copy];
          [v33 setPinnedChats:v34 withUpdateReason:v7];
        }
LABEL_47:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Tried to pin a nil conversation.", buf, 2u);
      }
    }
  }
  else
  {
    double v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CKConversationListCollectionViewController pinConversation:withReason:]();
    }
  }
}

- (void)showCannotPinMoreConversationsAlert
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Ignoring request to show 'cannot pin conversation' alert from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
}

- (void)_toggleUnreadStateForSelectedConversations:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__CKConversationListCollectionViewController__toggleUnreadStateForSelectedConversations___block_invoke;
  v15[3] = &unk_1E56284E8;
  void v15[4] = &v16;
  [v4 enumerateObjectsUsingBlock:v15];
  uint64_t v5 = [(CKConversationListCollectionViewController *)self updater];
  [v5 beginHoldingUpdatesForReason:@"markAsRead"];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (*((unsigned char *)v17 + 24)) {
          [v10 markAllMessagesAsRead];
        }
        else {
          [v10 markLastMessageAsUnread];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v20 count:16];
    }
    while (v7);
  }

  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:1];
  im_dispatch_after();
  _Block_object_dispose(&v16, 8);
}

uint64_t __89__CKConversationListCollectionViewController__toggleUnreadStateForSelectedConversations___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasUnreadMessages];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __89__CKConversationListCollectionViewController__toggleUnreadStateForSelectedConversations___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 endHoldingUpdatesForReason:@"markAsRead" updateTriggeredIfNotHeldShouldBeDeferred:1];
}

- (void)_markAllConversationsAsRead
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Marking all conversations as read, none were selected", buf, 2u);
    }
  }
  id v4 = [MEMORY[0x1E4F6E788] sharedManager];
  if ([v4 shouldFilterConversationsByFocus])
  {

LABEL_8:
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "In focus mode or assistive access, only grabbing the ones in the list as a workaround for incomplete database queries", buf, 2u);
      }
    }
    uint64_t v8 = [(CKConversationListCollectionViewController *)self dataSource];
    unint64_t v9 = [v8 snapshot];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v11 = [v9 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16928];
    [v10 addObjectsFromArray:v11];
    long long v12 = [v9 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16940];
    [v10 addObjectsFromArray:v12];
    long long v13 = [(CKConversationListCollectionViewController *)self conversationsForItemIdentifiers:v10];
    [(CKConversationListCollectionViewController *)self _toggleUnreadStateForSelectedConversations:v13];

    goto LABEL_18;
  }
  uint64_t v5 = [MEMORY[0x1E4F6E5D8] sharedManager];
  int v6 = [v5 shouldFilterIncomingMessages];

  if (v6) {
    goto LABEL_8;
  }
  if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      unint64_t v15 = [(CKConversationListCollectionViewController *)self filterMode];
      *(_DWORD *)buf = 134217984;
      unint64_t v20 = v15;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Not in a focus mode, mark as read using the database queries with filter mode (%lu)", buf, 0xCu);
    }
  }
  uint64_t v16 = [(CKConversationListCollectionViewController *)self updater];
  [v16 beginHoldingUpdatesForReason:@"markAsRead"];

  uint64_t v17 = [(CKConversationListCollectionViewController *)self conversationList];
  unint64_t v9 = objc_msgSend(v17, "_chatPredicateForFilterMode:", -[CKConversationListCollectionViewController filterMode](self, "filterMode"));

  uint64_t v18 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  [v18 markChatsAsReadFilteredUsingPredicate:v9];

  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:1];
  im_dispatch_after();
LABEL_18:
}

void __73__CKConversationListCollectionViewController__markAllConversationsAsRead__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 endHoldingUpdatesForReason:@"markAsRead" updateTriggeredIfNotHeldShouldBeDeferred:1];
}

- (void)toggleReadButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKConversationListCollectionViewController *)self collectionView];
  int v6 = [v5 indexPathsForSelectedItems];

  if ([v6 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Marking conversations as read", v9, 2u);
      }
    }
    uint64_t v8 = [(CKConversationListCollectionViewController *)self conversationsAtIndexPaths:v6];
    [(CKConversationListCollectionViewController *)self _toggleUnreadStateForSelectedConversations:v8];
  }
  else
  {
    [(CKConversationListCollectionViewController *)self _markAllConversationsAsRead];
  }
}

- (void)muteConversationButtonTappedForConversationWithItemIdentifier:(id)a3 setMuted:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:a3];
  if (v4)
  {
    int v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v7 setMutedUntilDate:v6];
  }
  else
  {
    [v7 unmute];
  }
  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:1];
}

- (BOOL)hasTransparentSideBar
{
  if (!CKIsRunningInMacCatalyst()
    || ![(CKConversationListCollectionViewController *)self macShouldShowZKWSearch])
  {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v4 = [v3 macApplicationMetricsGatheringEnabled];

  return v4;
}

- (void)_configureSearchBarClearButton:(BOOL)a3 searchController:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  int v5 = CKIsRunningInMacCatalyst();
  int v6 = v9;
  if (v5)
  {
    id v7 = [v9 searchBar];
    uint64_t v8 = [v7 searchTextField];

    if (objc_opt_respondsToSelector()) {
      [v8 _setAlwaysShowsClearButtonWhenEmpty:v4];
    }

    int v6 = v9;
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(CKConversationListCollectionViewController *)self searchResultsController];
  [v4 setDismissingSearchController:0];

  if ([(CKConversationListCollectionViewController *)self hasTransparentSideBar])
  {
    int v5 = [(CKConversationListCollectionViewController *)self view];
    [v5 setHidden:1];
  }
  [(CKConversationListCollectionViewController *)self _configureSearchBarClearButton:1 searchController:v7];
  int v6 = [(CKConversationListCollectionViewController *)self delegate];
  [v6 conversationListControllerWillPresentSearchResultsController];

  [(CKConversationListCollectionViewController *)self _configureCatalystFiltersNavigation];
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  int v5 = [(CKConversationListCollectionViewController *)self searchResultsController];
  [v5 setDismissingSearchController:1];

  if ([(CKConversationListCollectionViewController *)self hasTransparentSideBar])
  {
    int v6 = [(CKConversationListCollectionViewController *)self view];
    [v6 setHidden:0];
  }
  id v7 = [(CKConversationListCollectionViewController *)self delegate];
  [v7 conversationListControllerWillDismissSearchResultsController];

  if ([v4 isActive]) {
    [(CKConversationListCollectionViewController *)self reloadInputViews];
  }
  uint64_t v8 = [(CKConversationListCollectionViewController *)self navigationItem];
  [v8 setBackButtonTitle:0];

  if (CKIsRunningInMacCatalyst() && [v4 isActive])
  {
    id v9 = [(CKConversationListCollectionViewController *)self transitionCoordinator];
    id v10 = v9;
    if (v9)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      id v11[2] = __74__CKConversationListCollectionViewController_willDismissSearchController___block_invoke;
      v11[3] = &unk_1E5621550;
      void v11[4] = self;
      [v9 animateAlongsideTransition:v11 completion:0];
    }
  }
}

void __74__CKConversationListCollectionViewController_willDismissSearchController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateNavigationItems];
  [*(id *)(a1 + 32) _configureCatalystFiltersNavigation];
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) collectionView];
  [v3 layoutIfNeeded];
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  int v5 = [(CKConversationListCollectionViewController *)self searchResultsController];
  [v5 setDismissingSearchController:0];

  int v6 = [(CKConversationListCollectionViewController *)self searchResultsController];
  [v6 searchEnded];

  [(CKConversationListCollectionViewController *)self _configureSearchBarClearButton:0 searchController:v4];
  if (CKIsRunningInMacCatalyst())
  {
    [(CKConversationListCollectionViewController *)self setMacShouldShowZKWSearch:0];
    [(CKConversationListCollectionViewController *)self _configureCatalystFiltersNavigation];
  }
  [(CKConversationListCollectionViewController *)self updateConversationSelection];

  [(CKConversationListCollectionViewController *)self updateNavigationItems];
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[CKConversationListCollectionViewController searchBarTextDidBeginEditing:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Did tap to begin search in %s", (uint8_t *)&v21, 0xCu);
    }
  }
  int v6 = [(CKConversationListCollectionViewController *)self navigationItem];
  uint64_t v7 = CKFrameworkBundle();
  uint64_t v8 = [(id)v7 localizedStringForKey:@"SEARCH" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v6 setBackButtonTitle:v8];

  id v9 = [(CKConversationListCollectionViewController *)self searchController];
  LOBYTE(v7) = [v9 showsSearchResultsController];

  if ((v7 & 1) == 0)
  {
    if (!CKIsRunningInMacCatalyst())
    {
      id v10 = [(CKConversationListCollectionViewController *)self searchController];
      [v10 setShowsSearchResultsController:1];
    }
    long long v11 = [(CKConversationListCollectionViewController *)self searchController];
    long long v12 = [v11 searchBar];
    long long v13 = [v12 text];
    BOOL v14 = [v13 length] == 0;

    if (v14)
    {
      unint64_t v15 = [(CKConversationListCollectionViewController *)self searchResultsController];
      [v15 searchWithText:&stru_1EDE4CA38];
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isSearchTokensEnabled];

  if (v17)
  {
    uint64_t v18 = [(CKConversationListCollectionViewController *)self searchResultsController];
    [v18 setCanShowTokenSuggestions:1];
  }
  char v19 = [(CKConversationListCollectionViewController *)self collectionView];
  unint64_t v20 = [(CKConversationListCollectionViewController *)self indexPathOfFirstSelectedItem];
  [v19 deselectItemAtIndexPath:v20 animated:0];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  if (objc_msgSend(a4, "length", a3))
  {
    if (!CKIsRunningInMacCatalyst()) {
      return;
    }
  }
  else
  {
    int v5 = [(CKConversationListCollectionViewController *)self searchResultsController];
    [v5 searchEnded];

    if (!CKIsRunningInMacCatalyst()) {
      return;
    }
    if (![(CKConversationListCollectionViewController *)self macShouldShowZKWSearch])
    {
      uint64_t v7 = 0;
      goto LABEL_9;
    }
  }
  int v6 = [(CKConversationListCollectionViewController *)self searchController];
  uint64_t v7 = [v6 isActive];

LABEL_9:
  uint64_t v8 = [(CKConversationListCollectionViewController *)self view];
  [v8 setHidden:v7];

  id v9 = [(CKConversationListCollectionViewController *)self searchController];
  [v9 setShowsSearchResultsController:v7];

  [(CKConversationListCollectionViewController *)self _configureCatalystFiltersNavigation];
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMacCatalyst()
    && ![(CKConversationListCollectionViewController *)self macShouldShowZKWSearch])
  {
    int v5 = [v4 text];
    if ([v5 length]
      || ([(CKConversationListCollectionViewController *)self presentedViewController],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
    }
    else
    {
      id v9 = (void *)v8;
      id v10 = [(CKConversationListCollectionViewController *)self presentedViewController];
      long long v11 = [(CKConversationListCollectionViewController *)self searchController];

      if (v10 == v11)
      {
        long long v12 = [(CKConversationListCollectionViewController *)self searchController];
        [(CKConversationListCollectionViewController *)self willDismissSearchController:v12];

        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        void v13[2] = __73__CKConversationListCollectionViewController_searchBarTextDidEndEditing___block_invoke;
        v13[3] = &unk_1E5620C40;
        void v13[4] = self;
        [(CKConversationListCollectionViewController *)self dismissViewControllerAnimated:0 completion:v13];
      }
    }
  }
  int v6 = [(CKConversationListCollectionViewController *)self delegate];
  uint64_t v7 = [v6 chatController];

  [v7 becomeFirstResponder];
}

void __73__CKConversationListCollectionViewController_searchBarTextDidEndEditing___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 searchController];
  [v1 didDismissSearchController:v2];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v5 = [v4 isSearchTokensEnabled];

  if (v5)
  {
    id v6 = [(CKConversationListCollectionViewController *)self searchResultsController];
    [v6 setCanShowTokenSuggestions:0];
  }
}

- (id)searchController:(id)a3 conversationForChatGUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CKConversationListCollectionViewController *)self conversationList];
  uint64_t v7 = [v6 conversationForExistingChatWithGUID:v5];

  return v7;
}

- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(CKConversationListCollectionViewController *)self conversationList];
  uint64_t v7 = [v6 conversationsForExistingChatsWithGUIDs:v5];

  return v7;
}

- (id)searchBarForSearchViewController:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self searchController];
  id v4 = [v3 searchBar];

  return v4;
}

- (void)searchController:(id)a3 didSelectItem:(id)a4 inChat:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained showConversationAndMessageForChatGUID:v8 messageGUID:v9 animate:1];

  long long v11 = [(CKConversationListCollectionViewController *)self delegate];
  long long v12 = [v11 chatController];
  [v12 becomeFirstResponder];

  id v14 = [(CKConversationListCollectionViewController *)self delegate];
  long long v13 = [v14 chatController];
  [v13 reloadInputViews];
}

- (void)searchControllerDidBeginDragging:(id)a3
{
  id v4 = [(CKConversationListCollectionViewController *)self searchController];
  id v3 = [v4 searchBar];
  [v3 resignFirstResponder];
}

- (void)searchViewController:(id)a3 requestsPushOfSearchController:(id)a4
{
  id v5 = a4;
  id v6 = [(CKConversationListCollectionViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (BOOL)shouldInsetResultsForSearchController:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self delegate];
  char v4 = [v3 isCollapsed];

  return v4;
}

- (id)contextMenusForConversation:(id)a3
{
  char v4 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:a3 inSection:5];
  id v5 = [(CKConversationListCollectionViewController *)self dataSource];
  id v6 = [v5 indexPathForItemIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [v6 section];
    id v8 = [(CKConversationListCollectionViewController *)self collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v6];

    id v10 = [(CKConversationListCollectionViewController *)self _conversationActionMenusForItemIdentifier:v4 inSection:v7 withCell:v9 forSearch:1];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__CKConversationListCollectionViewController__contentSizeCategoryDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__CKConversationListCollectionViewController__contentSizeCategoryDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateCellLayout];
  id v2 = [*(id *)(a1 + 32) searchController];
  int v3 = [v2 isActive];

  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) searchController];
    [v4 setActive:0];
  }
  id v5 = [*(id *)(a1 + 32) collectionView];
  [v5 reloadData];

  [*(id *)(a1 + 32) updateConversationSelection];
  id v6 = +[CKDualSIMUtilities sharedUtilities];
  [v6 updateConversationListSIMLabelImagesDictionary];
}

- (void)_increaseContrastDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CKConversationListCollectionViewController__increaseContrastDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__CKConversationListCollectionViewController__increaseContrastDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  int v3 = *(void **)(a1 + 32);

  return [v3 updateConversationSelection];
}

- (void)_chatItemsDidChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 name];
      int v25 = 136315394;
      double v26 = "-[CKConversationListCollectionViewController _chatItemsDidChange:]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "ConversationListController: %s, notification.name: %@", (uint8_t *)&v25, 0x16u);
    }
  }
  uint64_t v7 = [v4 object];
  id v8 = [(CKConversationListCollectionViewController *)self conversationList];
  uint64_t v9 = [v7 guid];
  id v10 = [v8 conversationForExistingChatWithGUID:v9];

  long long v11 = [(CKConversationListCollectionViewController *)self conversationList];
  LOBYTE(v9) = [v11 loadingConversations];

  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      long long v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Not loading all conversations, updating the conversation list", (uint8_t *)&v25, 2u);
      }
    }
    if (__CurrentTestName)
    {
      [(CKConversationListCollectionViewController *)self updateConversationList];
    }
    else if (-[CKConversationListCollectionViewController _updateAddsTypingChatItem:](self, "_updateAddsTypingChatItem:", v4)|| ([v4 userInfo], long long v13 = objc_claimAutoreleasedReturnValue(), v14 = -[CKConversationListCollectionViewController _updateRemovesTypingChatItem:](self, "_updateRemovesTypingChatItem:", v13), v13, v14))
    {
      [(CKConversationListCollectionViewController *)self updateContentsOfCellForConversation:v10 animated:1];
    }
    else
    {
      unint64_t v15 = [(CKConversationListCollectionViewController *)self updater];
      [v15 setNeedsDeferredUpdateWithReason:@"chatItemsChanged"];
    }
  }
  [v10 resetCaches];
  if ([v10 isAdHocGroupConversation])
  {
    uint64_t v16 = [v4 userInfo];
    int v17 = v16;
    if (!v16)
    {
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v18 = [v16 valueForKey:*MEMORY[0x1E4F6B8E0]];
    if (![v18 count])
    {
LABEL_27:

      goto LABEL_28;
    }
    char v19 = [v10 chat];
    unint64_t v20 = [v19 chatItems];
    int v21 = [v20 lastObject];

    uint64_t v22 = objc_opt_class();
    if ([v22 isSubclassOfClass:objc_opt_class()])
    {
      LOBYTE(v23) = 0;
      if (!v21) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v24 = objc_opt_class();
      int v23 = [v24 isSubclassOfClass:objc_opt_class()] ^ 1;
      if (!v21)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    if ((v23 & 1) == 0 && ([v21 isFromMe] & 1) == 0)
    {
      [v10 setNeedsUpdatedContactOrderForVisualIdentity];
      [(CKConversationListCollectionViewController *)self updateContentsOfCellForConversation:v10 animated:1];
    }
    goto LABEL_26;
  }
LABEL_29:
}

- (BOOL)_updateAddsTypingChatItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F6B8E0]];

  if ([v5 count] == 1)
  {
    id v6 = [v3 object];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 chatItems];
    id v8 = [v7 objectsAtIndexes:v5];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (IMOSLoggingEnabled())
            {
              long long v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)BOOL v14 = 0;
                _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Chat item update only adds typing indicator, do not resort conversation list.", v14, 2u);
              }
            }
            LOBYTE(v9) = 1;
            goto LABEL_17;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_updateRemovesTypingChatItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F6B8F0]];
  id v5 = [v3 objectForKey:*MEMORY[0x1E4F6B908]];
  if ([v5 count] != 1) {
    goto LABEL_8;
  }
  id v6 = [v4 objectsAtIndexes:v5];
  uint64_t v7 = [v6 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Chat item update only removes typing indicator, do not resort conversation list.", v12, 2u);
      }
    }
    BOOL v10 = 1;
  }
  else
  {
LABEL_8:
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_chatUnreadCountDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [(CKConversationListCollectionViewController *)self updater];
  [v4 setNeedsDeferredUpdateWithReason:@"unreadCountChanged"];

  id v5 = [v8 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = [v8 object];
    [(CKConversationListCollectionViewController *)self _consumeSummaryOnUnreadCountChangeForChatIfNeeded:v7];
  }
}

- (void)_chatParticipantsChangedNotification:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(CKConversationListCollectionViewController *)self conversationList];
  id v5 = [v7 guid];
  id v6 = [v4 conversationForExistingChatWithGUID:v5];

  [v6 resetCaches];
  if ([v6 isGroupConversation]) {
    [v6 setNeedsUpdatedContactOrderForVisualIdentity];
  }
  if ([v6 isAdHocGroupConversation]) {
    [(CKConversationListCollectionViewController *)self updateContentsOfCellForConversation:v6 animated:0];
  }
}

- (void)updateContentsOfCellForConversation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(CKConversationListCollectionViewController *)self updater];
  char v7 = [v6 isHoldingUpdates];

  if ((v7 & 1) == 0)
  {
    if ([v10 isPinned]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 5;
    }
    uint64_t v9 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v10 inSection:v8];
    [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v9 animated:v4];
  }
}

- (void)_conversationIsFilteredChangedNotification:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"conversationIsFilteredChanged"];
}

- (void)_conversationDisplayNameChangedNotification:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"conversationDisplayNameChanged"];
}

- (void)_conversationMuteDidChangeNotification:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"conversationMuteDidChanged"];
}

- (void)_conversationFilteringStateChangedNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Filter Mode] Conversation Filtering state changed", buf, 2u);
    }
  }
  if ([(CKConversationListCollectionViewController *)self isRecentlyDeletedModal]
    || [(CKConversationListCollectionViewController *)self isOscarModal])
  {
    id v6 = [(CKConversationListCollectionViewController *)self navigationController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if (v4
      || CKIsFilterCategory([(CKConversationListCollectionViewController *)self filterMode])
      && ![(CKConversationListCollectionViewController *)self _messageSpamFilteringEnabled])
    {
      if (IMOSLoggingEnabled())
      {
        char v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Conversation Filtering state changed, resetting SIM Filter state cache and SIM Filter Preference. Setting filter mode to no junk", v9, 2u);
        }
      }
      [(CKConversationListCollectionViewController *)self setFilterMode:1];
      [(CKConversationListCollectionViewController *)self _resetSimFilteringToDefaultState];
    }
    uint64_t v8 = [(CKConversationListCollectionViewController *)self updater];
    [v8 setNeedsDeferredUpdateWithReason:@"filteringStateChanged"];

    [(CKConversationListCollectionViewController *)self updateNavigationItems];
  }
}

- (void)_conversationSpamFilteringStateChangedNotification:(id)a3
{
  [(CKConversationListCollectionViewController *)self updateSMSSpamConversationsDisplayName];

  [(CKConversationListCollectionViewController *)self _conversationFilteringStateChangedNotification:0];
}

- (void)_conversationContactPhotosEnabledChangedNotification:(id)a3
{
  [(CKConversationListCollectionViewController *)self invalidateCellLayout];
  id v4 = [(CKConversationListCollectionViewController *)self updater];
  [v4 setNeedsDeferredUpdateWithReason:@"contactPhotosEnabled"];
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 transferGUID];
    if ([v5 length])
    {
      int v23 = v4;
      uint64_t v22 = [(CKConversationListCollectionViewController *)self conversationList];
      id v6 = [v22 conversations];
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if ([v13 shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID:v5])
            {
              if ([v13 isPinned]) {
                uint64_t v14 = 2;
              }
              else {
                uint64_t v14 = 5;
              }
              long long v15 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v13 inSection:v14];
              if (v15) {
                [v7 addObject:v15];
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v10);
      }

      long long v16 = (void *)[v7 copy];
      long long v17 = [(CKConversationListCollectionViewController *)self updater];
      int v18 = [v17 isHoldingUpdates];

      char v19 = IMLogHandleForCategory();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20) {
          -[CKConversationListCollectionViewController _adaptiveImageGlyphWasGeneratedNotification:]((uint64_t)v5, v19);
        }

        int v21 = [(CKConversationListCollectionViewController *)self updater];
        [v21 setNeedsDeferredUpdateWithReason:@"adaptiveImageGlyphGenerated"];

        id v4 = v23;
      }
      else
      {
        if (v20) {
          [(CKConversationListCollectionViewController *)v16 _adaptiveImageGlyphWasGeneratedNotification:v19];
        }

        id v4 = v23;
        if ([v16 count]) {
          [(CKConversationListCollectionViewController *)self updateContentsOfCellsWithItemIdentifiers:v16 animated:0];
        }
      }
    }
  }
}

- (void)_multiWayCallStateChanged:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "ConversationListController: _multiWayCallStateChanged", buf, 2u);
    }
  }
  id v6 = [(CKConversationListCollectionViewController *)self conversationList];
  char v7 = [v6 loadingConversations];

  if ((v7 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Not loading all conversations, updating the conversation list", v10, 2u);
      }
    }
    uint64_t v9 = [(CKConversationListCollectionViewController *)self updater];
    [v9 setNeedsDeferredUpdateWithReason:@"multiWayCallStateChanged"];
  }
}

- (void)_chatWatermarkDidChange:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"chatWatermarkDidChange"];
}

- (void)_conversationListDidFinishLoadingConversations:(id)a3
{
  id v4 = [(CKConversationListCollectionViewController *)self updater];
  [v4 setNeedsDeferredUpdateWithReason:@"didFinishLoadingConversations"];

  [(CKConversationListCollectionViewController *)self _updateConversationListsAndSortIfEnabled];
  id v5 = [(CKConversationListCollectionViewController *)self conversationList];
  int v6 = [v5 loadedConversations];

  if (v6)
  {
    [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0];
  }
}

- (void)_contactStoreDidFinishLoadingNotification:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"contactStoreDidFinishLoading"];
}

- (void)_conversationListDidChange:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"conversationListDidChange"];
}

- (void)_conversationMessageWasSent:(id)a3
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 setNeedsDeferredUpdateWithReason:@"messageWasSent"];
}

- (unint64_t)_sanitizedFilterModeForFilterUnknownEnabled:(unint64_t)a3
{
  unint64_t result = 1;
  switch(a3)
  {
    case 0uLL:
    case 0xAuLL:
      return result;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      BOOL v6 = ![(CKConversationListCollectionViewController *)self _messageSpamFilteringEnabled];
      goto LABEL_3;
    case 7uLL:
      if (![(CKConversationListCollectionViewController *)self isRecentlyDeletedModal]
        && !CKShouldShowInboxView())
      {
        CKIsRunningInMacCatalyst();
      }
      unint64_t result = 7;
      break;
    default:
      if (a3 >= 0x10)
      {
        int v7 = [MEMORY[0x1E4F6E938] isValidActiveFilterAction:a3 & 0xF subAction:a3 >> 4];
        BOOL v6 = ([(CKConversationListCollectionViewController *)self _messageSpamFilteringEnabled] & v7) == 0;
LABEL_3:
        if (v6) {
          unint64_t result = 1;
        }
        else {
          unint64_t result = a3;
        }
      }
      else
      {
        unint64_t result = a3;
      }
      break;
  }
  return result;
}

- (void)updateSMSSpamConversationsDisplayName
{
  id v3 = +[CKConversationList sharedConversationList];
  id v2 = [v3 conversations];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_476_0];
}

uint64_t __83__CKConversationListCollectionViewController_updateSMSSpamConversationsDisplayName__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateDisplayNameIfSMSSpam];
}

- (void)_handingPendingConversationDidChange:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 object];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = [v11 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [(CKConversationListCollectionViewController *)self conversationList];
      uint64_t v9 = [v8 pendingConversation];
      uint64_t v10 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v9 inSection:4];

      [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v10 animated:0];
    }
  }
}

- (void)_resetMessageFiltering
{
  CKResetBlackholeEnabledCache();
  CKResetFilteringSettings();
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:CKMessageFilteringChangedNotification[0] object:0];
}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  int v7 = [(CKConversationListCollectionViewController *)self dataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v6];

  uint64_t v9 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v8];
  uint64_t v10 = [v9 activityForNewScene];
  if (v10) {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F43068]) initWithUserActivity:v10];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

void __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchController];
  int v3 = [v2 isActive];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) searchController];
    [v4 setActive:0];
  }
}

- (BOOL)isShowingConversationFromCatalystOpenURL
{
  return 0;
}

void __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Performed deferred (viewDidAppear:) search with query: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) traitCollection];
  CKPrewarmPostLaunch(v2);

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  LODWORD(v2) = [v3 isCollapsed];

  if (v2)
  {
    CKPrewarmCKMessageEntryView();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(32);
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "viewWillDisappear, animated=%@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    int v7 = @"NO";
    if (v3) {
      int v7 = @"YES";
    }
    uint64_t v10 = v7;
    _CKLog();
  }
  if (self->_isVisible)
  {
    id v8 = [(CKConversationListCollectionViewController *)self updater];
    [v8 beginHoldingUpdatesForReason:@"viewVisiblity"];
  }
  self->_isVisible = 0;
  uint64_t v9 = [(CKConversationListCollectionViewController *)self tipKitQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CKConversationListCollectionViewController_viewWillDisappear___block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_async(v9, block);

  [(CKConversationListCollectionViewController *)self stopTipCellAnimatingIfNecessary];
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v11 viewWillDisappear:v3];
}

uint64_t __64__CKConversationListCollectionViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1504) conversationListControllerDidDisappear];
}

- (void)applicationWillSuspend
{
  v7.receiver = self;
  v7.super_class = (Class)CKConversationListCollectionViewController;
  [(CKConversationListCollectionViewController *)&v7 applicationWillSuspend];
  if (!CKIsRunningInMacCatalyst())
  {
    BOOL v3 = [(CKConversationListCollectionViewController *)self searchController];
    int v4 = [v3 isActive];

    if (v4)
    {
      uint64_t v5 = [(CKConversationListCollectionViewController *)self searchController];
      [v5 setActive:0];
    }
    uint64_t v6 = [(CKConversationListCollectionViewController *)self searchResultsController];
    [v6 cancelCurrentQuery];
  }
}

- (void)stopTipCellAnimatingIfNecessary
{
  BOOL v3 = [(CKConversationListCollectionViewController *)self dataSource];
  int v4 = +[CKTipKitOnboardingCollectionViewCell reuseIdentifier];
  id v7 = [v3 indexPathForItemIdentifier:v4];

  uint64_t v5 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 cellForItemAtIndexPath:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 didEndDisplaying];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(CKConversationListCollectionViewController *)self view];
  [v8 frame];
  double v10 = v9;

  if (vabdd_f64(width, v10) >= 0.001)
  {
    self->_willRotate = 1;
    objc_super v11 = +[CKUIBehavior sharedBehaviors];
    [v11 usesPopovers];

    void v12[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v13[3] = &unk_1E5621550;
    void v13[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v12[3] = &unk_1E5621550;
    [v7 animateAlongsideTransition:v13 completion:v12];
  }
}

uint64_t __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1024) = 0;
  return [*(id *)(a1 + 32) invalidateCellLayout];
}

uint64_t __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1024) = 0;
  return [*(id *)(a1 + 32) invalidateCellLayout];
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F43AE8]];
  [v6 CGRectValue];
  double v8 = v7;

  double v9 = [v4 userInfo];

  double v10 = [v9 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v10 CGRectValue];
  double v12 = v11;

  long long v13 = [(CKConversationListCollectionViewController *)self view];
  objc_super v14 = [v13 window];
  [v14 bounds];
  double v16 = v15;

  if ([(CKConversationListCollectionViewController *)self editingMode])
  {
    if (v8 > v12 && v8 != v16) {
      [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:1];
    }
  }
  [(CKConversationListCollectionViewController *)self _updateInsets];
  self->_keyboardIsShowing = 1;
}

- (void)_keyboardWillHide:(id)a3
{
  self->_keyboardIsShowing = 0;
}

- (void)scrollToFirstSelectedItemIfNecessary
{
  BOOL v3 = [(CKConversationListCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  id v8 = [v4 firstObject];

  if (v8)
  {
    if ([v8 section] != 4)
    {
      uint64_t v5 = [(CKConversationListCollectionViewController *)self collectionView];
      uint64_t v6 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v8, "section"));

      if (v6)
      {
        if ([(CKConversationListCollectionViewController *)self shouldScrollCollectionViewForCellSelection:v8])
        {
          double v7 = [(CKConversationListCollectionViewController *)self collectionView];
          [v7 scrollToItemAtIndexPath:v8 atScrollPosition:1 animated:1];
        }
      }
    }
  }
}

- (BOOL)shouldScrollCollectionViewForCellSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKConversationListCollectionViewController *)self lastVisibleIndexPathInCollectionView];
  uint64_t v6 = [(CKConversationListCollectionViewController *)self firstVisibleIndexPathInCollectionView];
  uint64_t v7 = [(CKConversationListCollectionViewController *)self distanceBetweenConversationIndexPath:v4 andIndexPath:v5];
  uint64_t v8 = [(CKConversationListCollectionViewController *)self distanceBetweenConversationIndexPath:v4 andIndexPath:v6];
  if (v7 < 2 || v8 <= 1)
  {
    double v10 = [(CKConversationListCollectionViewController *)self collectionView];
    BOOL v9 = objc_msgSend(v10, "numberOfItemsInSection:", objc_msgSend(v4, "section")) > 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)lastVisibleIndexPathInCollectionView
{
  id v2 = [(CKConversationListCollectionViewController *)self collectionView];
  BOOL v3 = [v2 indexPathsForVisibleItems];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  uint64_t v5 = [v4 lastObject];

  return v5;
}

- (id)firstVisibleIndexPathInCollectionView
{
  id v2 = [(CKConversationListCollectionViewController *)self collectionView];
  BOOL v3 = [v2 indexPathsForVisibleItems];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)_multitaskingDragExclusionRects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(CKConversationListCollectionViewController *)self pinnedConversationMultitaskingDragExclusionRect];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (!CGRectIsEmpty(v12))
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
    [v3 addObject:v8];
  }
  BOOL v9 = (void *)[v3 copy];

  return v9;
}

uint64_t __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  uint64_t v6 = [*(id *)(a1 + 32) collectionView];
  objc_msgSend(v6, "setContentInset:", v2, v3, v4, v5);

  uint64_t v7 = *(void **)(a1 + 40);

  return [v7 setAlpha:0.0];
}

uint64_t __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (BOOL)_shouldResizeNavigationBar
{
  double v2 = [(CKConversationListCollectionViewController *)self navigationController];
  double v3 = [v2 navigationBar];

  [v3 bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  [v3 bounds];
  LOBYTE(v2) = v7 < v8;

  return (char)v2;
}

- (void)commitPinnedConversationsForEditingPins
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Ignoring request to commit changes to pinned conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
}

- (BOOL)_canShowCatalystFiltersNavigation
{
  uint64_t v3 = [(CKConversationListCollectionViewController *)self searchController];
  char v4 = [v3 showsSearchResultsController];

  if ((v4 & 1) != 0
    || [(CKConversationListCollectionViewController *)self isBelowMacSnapToMinWidth])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unint64_t v5 = [(CKConversationListCollectionViewController *)self filterMode];
    if (v5) {
      LOBYTE(v5) = [(CKConversationListCollectionViewController *)self filterMode] != 1;
    }
  }
  return v5;
}

- (void)catalystFiltersNavigationBackButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self delegate];
  [v5 catalystFiltersNavigationBackButtonTapped:v4];
}

- (void)doneButtonTapped:(id)a3
{
  if ([(CKConversationListCollectionViewController *)self editingMode] == 2)
  {
    [(CKConversationListCollectionViewController *)self _submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:1];
    if ([(CKConversationListCollectionViewController *)self isShowingPinningOnboarding]) {
      [(CKConversationListCollectionViewController *)self startCompletePinningOnboardingAnimation];
    }
    else {
      [(CKConversationListCollectionViewController *)self commitPinnedConversationsForEditingPins];
    }
  }

  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:1];
}

- (void)cancelButtonTapped:(id)a3
{
  if ([(CKConversationListCollectionViewController *)self editingMode] == 2) {
    [(CKConversationListCollectionViewController *)self _submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:0];
  }
  if ([(CKConversationListCollectionViewController *)self isShowingPinningOnboarding])
  {
    [(CKConversationListCollectionViewController *)self startEndSuggestedPinsAnimation];
  }
  else
  {
    [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:1];
  }
}

- (void)selectAllButtonTapped:(id)a3
{
  id v4 = [(CKConversationListCollectionViewController *)self collectionView];
  id v21 = [v4 indexPathsForSelectedItems];

  uint64_t v5 = [v21 count];
  int64_t v6 = [(CKConversationListCollectionViewController *)self numberOfConversations];
  double v7 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v8 = [v7 numberOfItemsInSection:5];

  if (v5 == v6)
  {
    if (v8 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        double v15 = [(CKConversationListCollectionViewController *)self collectionView];
        double v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v14 inSection:5];
        [v15 deselectItemAtIndexPath:v16 animated:0];

        ++v14;
        long long v17 = [(CKConversationListCollectionViewController *)self collectionView];
        uint64_t v18 = [v17 numberOfItemsInSection:5];
      }
      while (v14 < v18);
    }
  }
  else if (v8 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      double v10 = [(CKConversationListCollectionViewController *)self collectionView];
      double v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:5];
      [v10 selectItemAtIndexPath:v11 animated:0 scrollPosition:0];

      ++v9;
      CGRect v12 = [(CKConversationListCollectionViewController *)self collectionView];
      uint64_t v13 = [v12 numberOfItemsInSection:5];
    }
    while (v9 < v13);
  }
  BOOL v19 = v5 != v6;
  BOOL v20 = [(CKConversationListCollectionViewController *)self selectAllButtonItem];
  [(CKConversationListCollectionViewController *)self configureSelectionBarButtonItem:v20 usingStyle:v19];

  [(CKConversationListCollectionViewController *)self _updateToolbarItems];
}

- (void)configureSelectionBarButtonItem:(id)a3 usingStyle:(unint64_t)a4
{
  id v9 = a3;
  if (a4 == 1)
  {
    uint64_t v5 = CKFrameworkBundle();
    int64_t v6 = v5;
    double v7 = @"DESELECT_ALL_BUTTON";
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    uint64_t v5 = CKFrameworkBundle();
    int64_t v6 = v5;
    double v7 = @"SELECT_ALL_BUTTON";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v9 setTitle:v8];

LABEL_6:
}

- (void)backButtonPressed
{
  uint64_t v3 = [(CKConversationListCollectionViewController *)self navigationController];
  id v4 = [v3 viewControllers];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    id v7 = [(CKConversationListCollectionViewController *)self navigationController];
    id v6 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (UIButton)macVirtualComposeButton
{
  uint64_t v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 useMacToolbar];

  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = (void *)MEMORY[0x1E4F42A80];
  id v7 = [MEMORY[0x1E4F42A98] configurationWithScale:v5];
  uint64_t v8 = [v6 systemImageNamed:@"square.and.pencil" withConfiguration:v7];

  macVirtualComposeButton = self->_macVirtualComposeButton;
  if (!macVirtualComposeButton)
  {
    double v10 = +[CKUIBehavior sharedBehaviors];
    char v11 = [v10 useMacToolbar];

    if ((v11 & 1) == 0)
    {
      CGRect v12 = [MEMORY[0x1E4F427E0] buttonWithType:0];
      uint64_t v13 = self->_macVirtualComposeButton;
      self->_macVirtualComposeButton = v12;

      [(UIButton *)self->_macVirtualComposeButton setContentMode:4];
      uint64_t v14 = [MEMORY[0x1E4F428B8] labelColor];
      [(UIButton *)self->_macVirtualComposeButton setTintColor:v14];

      [(UIButton *)self->_macVirtualComposeButton setBackgroundColor:0];
      double v15 = [(UIButton *)self->_macVirtualComposeButton imageView];
      [v15 setContentMode:1];

      double v16 = [(UIButton *)self->_macVirtualComposeButton layer];
      LODWORD(v17) = 1036831949;
      [v16 setShadowOpacity:v17];

      uint64_t v18 = [(UIButton *)self->_macVirtualComposeButton layer];
      [v18 setShadowRadius:1.0];

      if (v4) {
        double v19 = 5.0;
      }
      else {
        double v19 = 3.0;
      }
      BOOL v20 = [(UIButton *)self->_macVirtualComposeButton layer];
      [v20 setCornerRadius:v19];

      id v21 = [(UIButton *)self->_macVirtualComposeButton layer];
      objc_msgSend(v21, "setShadowOffset:", 0.0, 1.0);
    }
    [(UIButton *)self->_macVirtualComposeButton addTarget:self action:sel_composeButtonClicked_ forControlEvents:64];
    macVirtualComposeButton = self->_macVirtualComposeButton;
  }
  [(UIButton *)macVirtualComposeButton setImage:v8 forState:0];
  uint64_t v22 = self->_macVirtualComposeButton;

  return v22;
}

- (UIBarButtonItem)catalystFiltersNavigationBackButton
{
  return self->_catalystFiltersNavigationBackButton;
}

- (id)_editNicknameMenu:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = +[CKNameAndPhotoMenuElement menuElementWithNickname:v4];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  char v11 = __64__CKConversationListCollectionViewController__editNicknameMenu___block_invoke;
  CGRect v12 = &unk_1E5629D38;
  objc_copyWeak(&v13, &location);
  [v5 setPrimaryActionHandler:&v9];
  id v6 = objc_opt_new();
  objc_msgSend(v6, "addObject:", v5, v9, v10, v11, v12);
  id v7 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __64__CKConversationListCollectionViewController__editNicknameMenu___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained editNameAndPhotoMenuItemSelected];
}

- (id)editButtonDropdownMenu
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  location[0] = 0;
  objc_initWeak(location, self);
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isNameAndPhotoC3Enabled];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F6E820] sharedInstance];
    int v7 = [v6 sharingEnabled];

    if (v7)
    {
      if (IMSharedHelperNickNameEnabled())
      {
        uint64_t v8 = [MEMORY[0x1E4F6BD50] sharedInstance];
        [v8 fetchPersonalNicknameWithCompletion:&__block_literal_global_630_0];

        uint64_t v9 = [MEMORY[0x1E4F6BD50] sharedInstance];
        uint64_t v10 = [v9 personalNickname];

        char v11 = [v10 firstName];
        if ([v11 length])
        {
        }
        else
        {
          uint64_t v68 = [v10 lastName];
          uint64_t v69 = [v68 length];

          if (!v69)
          {
            char v12 = 0;
            goto LABEL_33;
          }
        }
        double v70 = [(CKConversationListCollectionViewController *)self _editNicknameMenu:v10];
        [v3 addObject:v70];

        char v12 = 1;
LABEL_33:

        goto LABEL_7;
      }
    }
  }
  char v12 = 0;
LABEL_7:
  if ([(CKConversationListCollectionViewController *)self numberOfConversations] > 0
    || [(CKConversationListCollectionViewController *)self numberOfPinnedConversations] >= 1)
  {
    id v13 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v14 = CKFrameworkBundle();
    double v15 = [v14 localizedStringForKey:@"MANAGE_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v16 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle"];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_2;
    v82[3] = &unk_1E5620ED8;
    objc_copyWeak(&v83, location);
    double v17 = [v13 actionWithTitle:v15 image:v16 identifier:0 handler:v82];

    [v3 addObject:v17];
    if ([(CKConversationListCollectionViewController *)self shouldShowPinnedConversations])
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F426E8];
      double v19 = CKFrameworkBundle();
      BOOL v20 = [v19 localizedStringForKey:@"EDIT_PINS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v21 = [MEMORY[0x1E4F42A80] systemImageNamed:@"pin"];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_3;
      v80[3] = &unk_1E5620ED8;
      objc_copyWeak(&v81, location);
      uint64_t v22 = [v18 actionWithTitle:v20 image:v21 identifier:0 handler:v80];

      [v3 addObject:v22];
      objc_destroyWeak(&v81);
    }

    objc_destroyWeak(&v83);
  }
  int v23 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v24 = v12 & [v23 isNameAndPhotoC3Enabled];

  if ((v24 & 1) == 0 && IMSharedHelperNickNameEnabled())
  {
    long long v25 = (void *)MEMORY[0x1E4F426E8];
    long long v26 = CKFrameworkBundle();
    long long v27 = [v26 localizedStringForKey:@"EDIT_PROFILE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v28 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.crop.circle"];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_4;
    v78[3] = &unk_1E5620ED8;
    objc_copyWeak(&v79, location);
    uint64_t v29 = [v25 actionWithTitle:v27 image:v28 identifier:0 handler:v78];

    [v3 addObject:v29];
    objc_destroyWeak(&v79);
  }
  if (![(CKConversationListCollectionViewController *)self _shouldShowInboxView]) {
    [(CKConversationListCollectionViewController *)self _configureSecondarySubMenuInParentMenuItems:v3];
  }
  if ([(CKConversationListCollectionViewController *)self _shouldShowInboxView]
    && CKMessageSIMFilteringEnabled())
  {
    uint64_t v30 = [(CKConversationListCollectionViewController *)self _simFilterSubMenu];
    [v3 addObject:v30];
  }
  if ([(CKConversationListCollectionViewController *)self shouldShowInternalDebugMenu])
  {
    id from = 0;
    objc_initWeak(&from, self);
    long long v31 = (void *)MEMORY[0x1E4F426E8];
    long long v32 = [MEMORY[0x1E4F42A80] systemImageNamed:@"ant"];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_5;
    v75[3] = &unk_1E5620ED8;
    objc_copyWeak(&v76, &from);
    long long v33 = [v31 actionWithTitle:@"Debug" image:v32 identifier:0 handler:v75];

    [v3 addObject:v33];
    uint64_t v34 = (void *)MEMORY[0x1E4F426E8];
    id v35 = [MEMORY[0x1E4F42A80] systemImageNamed:@"flag"];
    BOOL v36 = [v34 actionWithTitle:@"Feature Flags" image:v35 identifier:0 handler:&__block_literal_global_659_0];

    [v3 addObject:v36];
    int v37 = IMGetDomainBoolForKey();
    long long v38 = @"eye.slash";
    if (v37)
    {
      long long v38 = @"eye";
      long long v39 = @"Show Sensitive UI";
    }
    else
    {
      long long v39 = @"Hide Sensitive UI";
    }
    long long v40 = v38;
    long long v41 = v39;
    long long v42 = (void *)MEMORY[0x1E4F426E8];
    long long v43 = [MEMORY[0x1E4F42A80] systemImageNamed:v40];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_7;
    v73[3] = &unk_1E5620ED8;
    objc_copyWeak(&v74, &from);
    long long v44 = [v42 actionWithTitle:v41 image:v43 identifier:0 handler:v73];

    [v3 addObject:v44];
    objc_destroyWeak(&v74);

    objc_destroyWeak(&v76);
    objc_destroyWeak(&from);
  }
  long long v45 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v46 = [v45 isCarrierPigeonEnabled];

  if (v46)
  {
    long long v47 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v48 = [v47 BOOLForKey:@"ShowCarrierPigeonNotificationHelpers"];

    if (v48)
    {
      id v49 = (void *)MEMORY[0x1E4F426E8];
      __int16 v50 = CKFrameworkBundle();
      id v51 = [v50 localizedStringForKey:@"Connect" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v52 = [MEMORY[0x1E4F42A80] systemImageNamed:@"antenna.radiowaves.left.and.right"];
      int v53 = [v49 actionWithTitle:v51 image:v52 identifier:0 handler:&__block_literal_global_690];

      CGFloat v54 = (void *)MEMORY[0x1E4F426E8];
      double v55 = CKFrameworkBundle();
      CGFloat v56 = [v55 localizedStringForKey:@"Update count" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v57 = [MEMORY[0x1E4F42A80] systemImageNamed:@"number.circle"];
      double v58 = [v54 actionWithTitle:v56 image:v57 identifier:0 handler:&__block_literal_global_698];

      id from = 0;
      objc_initWeak(&from, self);
      double v59 = (void *)MEMORY[0x1E4F426E8];
      uint64_t v60 = CKFrameworkBundle();
      id v61 = [v60 localizedStringForKey:@"Remove invited handles" value:&stru_1EDE4CA38 table:@"ChatKit"];
      double v62 = [MEMORY[0x1E4F42A80] systemImageNamed:@"delete.left"];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_10;
      v71[3] = &unk_1E5620ED8;
      objc_copyWeak(&v72, &from);
      double v63 = [v59 actionWithTitle:v61 image:v62 identifier:0 handler:v71];

      [v3 addObject:v53];
      [v3 addObject:v58];
      [v3 addObject:v63];

      objc_destroyWeak(&v72);
      objc_destroyWeak(&from);
    }
  }
  uint64_t v64 = (void *)MEMORY[0x1E4F42B80];
  v65 = (void *)[v3 copy];
  uint64_t v66 = [v64 menuWithTitle:&stru_1EDE4CA38 children:v65];

  objc_destroyWeak(location);

  return v66;
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditingMode:1 animated:1];
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditingMode:2 animated:1];
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained editNameAndPhotoMenuItemSelected];
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 showDebugMenu];
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_6()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=Feature%20Flags/Messages"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  os_log_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained delegate];
  [v1 toggleSensitiveUI];
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_8()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v0, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E4F6BAA8], 0);
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_9()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v0, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E4F6B9D0], 0);
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F6E8D0] sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_11;
  v5[3] = &unk_1E5629D80;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  [v4 removeAllInvitedHandlesWithCompletion:v5];

  objc_destroyWeak(&v6);
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_11(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_12;
  block[3] = &unk_1E56249F0;
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v9);
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_12(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = @"Success";
  }
  else {
    uint64_t v2 = @"Removing invited handles failed.";
  }
  id v3 = v2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    char v11 = v3;
    uint64_t v5 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:");

    id v4 = (id)v5;
  }
  id v12 = v4;
  id v6 = +[CKAlertController alertControllerWithTitle:@"Remove invited handles" message:v4 preferredStyle:1];
  int v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v9 = +[CKAlertAction actionWithTitle:v8 style:1 handler:0];

  [v6 addAction:v9];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentViewController:v6 animated:1 completion:0];
}

- (BOOL)shouldShowInternalDebugMenu
{
  uint64_t v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v3 = [v2 isInternalInstall];

  if (!v3) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"showDebugMenu"];

  return v5;
}

- (void)_configureSecondarySubMenuInParentMenuItems:(id)a3
{
  id v14 = a3;
  id v4 = objc_opt_new();
  char v5 = [(CKConversationListCollectionViewController *)self conversationList];
  id v6 = [v5 conversationsForFilterMode:9];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(CKConversationListCollectionViewController *)self showOscarModalAction];
    [v4 addObject:v8];
  }
  id v9 = [(CKConversationListCollectionViewController *)self conversationList];
  char v10 = [v9 conversationsForFilterMode:7];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = [(CKConversationListCollectionViewController *)self showRecentlyDeletedModalAction];
    [v4 addObject:v12];
  }
  if ([v4 count])
  {
    id v13 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v4];
    [v14 addObject:v13];
  }
}

- (void)editNameAndPhotoMenuItemSelected
{
  int v3 = [MEMORY[0x1E4F6BD50] sharedInstance];
  char v4 = [v3 iCloudSignedInToUseNicknames];

  if ((v4 & 1) == 0)
  {
    [(CKConversationListCollectionViewController *)self showiCloudNotSignedInAlertForNicknames];
    goto LABEL_7;
  }
  char v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if (([v5 isAllowMultiplePhoneNumbersSNaPEnabled] & 1) == 0)
  {
    int v6 = [MEMORY[0x1E4F6BD50] multiplePhoneNumbersTiedToAppleID];

    if (!v6) {
      goto LABEL_8;
    }
    [(CKConversationListCollectionViewController *)self showMultiplePhoneNumbersAlertForNicknames];
LABEL_7:
    uint64_t v7 = [(CKConversationListCollectionViewController *)self _meCardSharingState];
    [v7 setSharingEnabled:0];

    goto LABEL_9;
  }

LABEL_8:
  [(CKConversationListCollectionViewController *)self showMeCardViewController];
LABEL_9:
  id v8 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v8 trackEvent:*MEMORY[0x1E4F6D850]];
}

- (id)_simFilterSubMenu
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id location = 0;
  objc_initWeak(&location, self);
  char v4 = (void *)MEMORY[0x1E4F426E8];
  char v5 = CKFrameworkBundle();
  int v6 = [v5 localizedStringForKey:@"SIM_FILTER_ALL_LINES" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"simcard.2"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __63__CKConversationListCollectionViewController__simFilterSubMenu__block_invoke;
  double v19 = &unk_1E5620ED8;
  objc_copyWeak(&v20, &location);
  id v8 = [v4 actionWithTitle:v6 image:v7 identifier:0 handler:&v16];

  id v9 = [(CKConversationListCollectionViewController *)self conversationList];
  uint64_t v10 = [v9 simFilterIndex];

  if (v10 == -1) {
    [v8 setState:1];
  }
  [v3 addObject:v8];
  uint64_t v11 = [(CKConversationListCollectionViewController *)self _simFilterActionsForActiveSubscriptions];
  [v3 addObjectsFromArray:v11];

  id v12 = (void *)MEMORY[0x1E4F42B80];
  id v13 = (void *)[v3 copy];
  id v14 = [v12 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __63__CKConversationListCollectionViewController__simFilterSubMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSIMFilterIndexAndReloadData:-1];

  id v2 = [NSNumber numberWithInteger:-1];
  IMSetDomainValueForKey();
}

- (id)_simFilterActionsForActiveSubscriptions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [MEMORY[0x1E4F6E668] sharedInstance];
  char v4 = [v3 ctSubscriptionInfo];
  char v5 = [v4 subscriptions];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v9 slotID])
        {
          uint64_t v10 = CKFrameworkBundle();
          uint64_t v11 = [v9 label];
          id v12 = [v10 localizedStringForKey:v11 value:&stru_1EDE4CA38 table:@"ChatKit"];

          id location = 0;
          objc_initWeak(&location, self);
          id v13 = (void *)MEMORY[0x1E4F426E8];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __85__CKConversationListCollectionViewController__simFilterActionsForActiveSubscriptions__block_invoke;
          v22[3] = &unk_1E56210D8;
          objc_copyWeak(&v23, &location);
          v22[4] = v9;
          id v14 = [v13 actionWithTitle:v12 image:0 identifier:0 handler:v22];
          double v15 = [(CKConversationListCollectionViewController *)self conversationList];
          objc_msgSend(v14, "setState:", objc_msgSend(v15, "simFilterIndex") == objc_msgSend(v9, "slotID"));

          uint64_t v16 = CKLocalizedShortNameForContext(v9);
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F42A80], "__ck_actionImageForSubscriptionShortName:isFilled:", v16, 0);
          [v14 setImage:v17];

          [v21 addObject:v14];
          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  uint64_t v18 = (void *)[v21 copy];

  return v18;
}

void __85__CKConversationListCollectionViewController__simFilterActionsForActiveSubscriptions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateSIMFilterIndexAndReloadData:", objc_msgSend(*(id *)(a1 + 32), "slotID"));

  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "slotID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();
}

- (void)editButtonMenuWillShow
{
  id v3 = [(CKConversationListCollectionViewController *)self delegate];
  [v3 dismissKeyboardIfVisible];

  if ([(CKConversationListCollectionViewController *)self isShowingSwipeDeleteConfirmation])
  {
    [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:1];
  }
  id v4 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v4 trackEvent:*MEMORY[0x1E4F6D9C8]];
}

id __60__CKConversationListCollectionViewController_editButtonItem__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained editButtonMenuWillShow];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 editButtonDropdownMenu];

  return v4;
}

- (UIBarButtonItem)editOscarButtonItem
{
  editOscarButtonItem = self->_editOscarButtonItem;
  if (!editOscarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:2 primaryAction:0];
    char v5 = self->_editOscarButtonItem;
    self->_editOscarButtonItem = v4;

    [(UIBarButtonItem *)self->_editOscarButtonItem setAccessibilityIdentifier:@"editJunkButton"];
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v6 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v7 = CKFrameworkBundle();
    id v8 = [v7 localizedStringForKey:@"MANAGE_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v9 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle"];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __65__CKConversationListCollectionViewController_editOscarButtonItem__block_invoke;
    double v15 = &unk_1E5620ED8;
    objc_copyWeak(&v16, &location);
    uint64_t v10 = [v6 actionWithTitle:v8 image:v9 identifier:0 handler:&v12];
    -[UIBarButtonItem setPrimaryAction:](self->_editOscarButtonItem, "setPrimaryAction:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    editOscarButtonItem = self->_editOscarButtonItem;
  }

  return editOscarButtonItem;
}

void __65__CKConversationListCollectionViewController_editOscarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditingMode:1 animated:1];
}

- (UIBarButtonItem)optionsButtonItem
{
  optionsButtonItem = self->_optionsButtonItem;
  if (!optionsButtonItem)
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    char v5 = [v4 conversationListOptionsButtonImageName];

    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    uint64_t v7 = [MEMORY[0x1E4F42A80] systemImageNamed:v5];
    id v8 = (UIBarButtonItem *)[v6 initWithImage:v7 style:0 target:self action:0];
    id v9 = self->_optionsButtonItem;
    self->_optionsButtonItem = v8;

    [(UIBarButtonItem *)self->_optionsButtonItem setAccessibilityIdentifier:@"optionsButton"];
    if (![(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession])
    {
      [(UIBarButtonItem *)self->_optionsButtonItem setSpringLoaded:1];
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __63__CKConversationListCollectionViewController_optionsButtonItem__block_invoke;
      id v14 = &unk_1E5629DA8;
      objc_copyWeak(&v15, &location);
      [(UIBarButtonItem *)self->_optionsButtonItem _setSecondaryActionsProvider:&v11];
      -[UIBarButtonItem setSecondaryActionsArePrimary:](self->_optionsButtonItem, "setSecondaryActionsArePrimary:", 1, v11, v12, v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    optionsButtonItem = self->_optionsButtonItem;
  }

  return optionsButtonItem;
}

id __63__CKConversationListCollectionViewController_optionsButtonItem__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained editButtonMenuWillShow];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 editButtonDropdownMenu];

  return v4;
}

- (UIBarButtonItem)cancelButtonItem
{
  cancelButtonItem = self->_cancelButtonItem;
  if (!cancelButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped_];
    char v5 = self->_cancelButtonItem;
    self->_cancelButtonItem = v4;

    [(UIBarButtonItem *)self->_cancelButtonItem setSpringLoaded:1];
    cancelButtonItem = self->_cancelButtonItem;
  }

  return cancelButtonItem;
}

- (UIBarButtonItem)doneButtonItem
{
  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped_];
    char v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    [(UIBarButtonItem *)self->_doneButtonItem setSpringLoaded:1];
    doneButtonItem = self->_doneButtonItem;
  }

  return doneButtonItem;
}

- (UIBarButtonItem)selectAllButtonItem
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (!self->_selectAllButtonItem)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v4 = CKFrameworkBundle();
    char v5 = [v4 localizedStringForKey:@"SELECT_ALL_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v6 = (UIBarButtonItem *)[v3 initWithTitle:v5 style:0 target:self action:sel_selectAllButtonTapped_];
    selectAllButtonItem = self->_selectAllButtonItem;
    self->_selectAllButtonItem = v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v9 = CKFrameworkBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"SELECT_ALL_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v17[0] = v10;
    uint64_t v11 = CKFrameworkBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"DESELECT_ALL_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v17[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v14 = (void *)[v8 initWithArray:v13];
    [(UIBarButtonItem *)self->_selectAllButtonItem setPossibleTitles:v14];

    [(UIBarButtonItem *)self->_selectAllButtonItem setAccessibilityIdentifier:@"selectAllButton"];
    [(UIBarButtonItem *)self->_selectAllButtonItem setSpringLoaded:1];
  }
  [(CKConversationListCollectionViewController *)self _updateSelectAllButtonItemTitle];
  id v15 = self->_selectAllButtonItem;

  return v15;
}

- (UIBarButtonItem)moveSelectedToRecentlyDeletedButtonItem
{
  moveSelectedToRecentlyDeletedButtonItem = self->_moveSelectedToRecentlyDeletedButtonItem;
  if (!moveSelectedToRecentlyDeletedButtonItem)
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    char v5 = [v4 conversationListMoveSelectedToRecentlyDeletedButtonItemWithTarget:self action:sel__moveToRecentlyDeletedButtonTapped_];

    [(UIBarButtonItem *)v5 accessibilitySetIdentification:@"deleteButton"];
    id v6 = self->_moveSelectedToRecentlyDeletedButtonItem;
    self->_moveSelectedToRecentlyDeletedButtonItem = v5;

    moveSelectedToRecentlyDeletedButtonItem = self->_moveSelectedToRecentlyDeletedButtonItem;
  }

  return moveSelectedToRecentlyDeletedButtonItem;
}

- (UIBarButtonItem)closeButtonItem
{
  closeButtonItem = self->_closeButtonItem;
  if (!closeButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__dismissPresentedNavController_];
    char v5 = self->_closeButtonItem;
    self->_closeButtonItem = v4;

    closeButtonItem = self->_closeButtonItem;
  }

  return closeButtonItem;
}

void __83__CKConversationListCollectionViewController_setEditingMode_animated_shouldUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(a1 + 32) collectionView];
  id v4 = [v3 indexPathForCell:v12];

  if ([v4 section] != 5)
  {
    if ([v4 section] != 2) {
      goto LABEL_9;
    }
    uint64_t v7 = [*(id *)(a1 + 32) dataSource];
    id v6 = [v7 itemIdentifierForIndexPath:v4];

    id v8 = +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier];
    if (([v6 isEqualToString:v8] & 1) == 0)
    {
      id v9 = +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifierForDropTargetAtItemIndex:](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifierForDropTargetAtItemIndex:", [v4 item]);
      char v10 = [v6 isEqualToString:v9];

      if (v10) {
        goto LABEL_8;
      }
      uint64_t v11 = *(void **)(a1 + 32);
      id v8 = v12;
      objc_msgSend(v8, "setEditingMode:animated:", objc_msgSend(v11, "editingMode"), *(unsigned __int8 *)(a1 + 48));
    }

    goto LABEL_8;
  }
  char v5 = *(void **)(a1 + 32);
  id v6 = v12;
  [v5 _ensureCellLayoutOnCell:v6];
  [v6 setEditingMode:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
LABEL_8:

LABEL_9:
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CKConversationListCollectionViewController *)self isEditing] != a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)CKConversationListCollectionViewController;
    [(CKConversationListCollectionViewController *)&v11 setEditing:v5 animated:v4];
    if (!v5 && [(CKConversationListCollectionViewController *)self editingMode]) {
      [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:0];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setEditing:v5 animated:v4];

    id v8 = +[CKUIBehavior sharedBehaviors];
    int v9 = [v8 selectNewConversationOnDeletion];

    if (v9 && !v5) {
      [(CKConversationListCollectionViewController *)self updateConversationSelection];
    }
    if (v5)
    {
      char v10 = [(CKConversationListCollectionViewController *)self updater];
      [v10 beginHoldingUpdatesForReason:@"editMode"];
    }
    else
    {
      [(CKConversationListCollectionViewController *)self _endHoldingUpdatesForBatchEditing:v4];
      [(CKConversationListCollectionViewController *)self updateSyncProgressIfNeeded];
    }
    [(CKConversationListCollectionViewController *)self _updateForCurrentEditingStateAnimated:v4];
  }
}

- (void)_updateForCurrentEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7
    || [(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    BOOL v5 = 0;
  }
  else
  {
    [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:v3];
    if ([(CKConversationListCollectionViewController *)self isEditing]) {
      BOOL v5 = CKIsRunningInMacCatalyst() != 0;
    }
    else {
      BOOL v5 = 1;
    }
  }
  [(CKConversationListCollectionViewController *)self configureSearchBarEnabled:v5];
  BOOL v6 = [(CKConversationListCollectionViewController *)self _shouldShowToolbar];
  if (v6) {
    [(CKConversationListCollectionViewController *)self _updateToolbarItems];
  }
  uint64_t v7 = [(CKConversationListCollectionViewController *)self syncStatusView];
  int v8 = [v7 isVisibleInViewHierarchy];

  uint64_t v9 = v8 ^ 1u;
  char v10 = [(CKConversationListCollectionViewController *)self navigationController];
  [v10 setToolbarHidden:!v6 animated:v9];

  [(CKConversationListCollectionViewController *)self updateNavigationItems];

  [(CKConversationListCollectionViewController *)self invalidateCellLayout];
}

- (void)configureSearchBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(CKConversationListCollectionViewController *)self navigationItem];
  BOOL v5 = [v4 searchController];
  id v7 = [v5 searchBar];

  BOOL v6 = [v7 searchTextField];
  [v6 setEnabled:v3];
}

- (void)_updateToolbarItems
{
  BOOL v3 = [(CKConversationListCollectionViewController *)self toolbarItems];
  BOOL v4 = [(CKConversationListCollectionViewController *)self navigationController];
  BOOL v5 = [v4 toolbar];
  [v5 setItems:v3];

  [(CKConversationListCollectionViewController *)self updateSyncProgressIfNeeded];
}

- (void)_endHoldingUpdatesForBatchEditing:(BOOL)a3
{
  if (a3)
  {
    [(CKConversationListCollectionViewController *)self updateNavigationItems];
    dispatch_time_t v4 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__CKConversationListCollectionViewController__endHoldingUpdatesForBatchEditing___block_invoke;
    block[3] = &unk_1E5620C40;
    void block[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v5 = [(CKConversationListCollectionViewController *)self updater];
    [v5 endAllHoldsOnUpdatesForReason:@"editMode" updateTriggeredIfNotHeldShouldBeDeferred:1];
  }
}

void __80__CKConversationListCollectionViewController__endHoldingUpdatesForBatchEditing___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 endAllHoldsOnUpdatesForReason:@"editMode" updateTriggeredIfNotHeldShouldBeDeferred:1];
}

- (void)composeButtonClicked:(id)a3
{
  id v4 = a3;
  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:0];
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7
    || [(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    id v5 = [(CKConversationListCollectionViewController *)self delegate];
    [v5 catalystFiltersNavigationBackButtonTapped:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v7 = [WeakRetained isAnimatingMessageSend];

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = 0;
        uint64_t v9 = "Compose button selected during an active message send animation, ignoring.";
        char v10 = (uint8_t *)&v16;
LABEL_12:
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else if ([(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession])
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        uint64_t v9 = "Compose button selected during an active conversation drag and drop session, ignoring.";
        char v10 = (uint8_t *)&v15;
        goto LABEL_12;
      }
LABEL_17:
    }
  }
  else
  {
    if ([(CKConversationListCollectionViewController *)self _wantsThreeColumnLayout])
    {
      objc_super v11 = [(CKConversationListCollectionViewController *)self splitViewController];
      [v11 hideColumn:0];
    }
    id v12 = +[CKDraftManager sharedInstance];
    [v12 setDraftForPendingConversation:0 withRecipients:0];

    uint64_t v13 = +[CKDraftManager sharedInstance];
    [v13 saveCompositionAndFlushCache:0];

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];

    [(CKConversationListCollectionViewController *)self dismissCatalystSearch];
    if ([(CKConversationListCollectionViewController *)self _shouldKeepSelection])
    {
      int v8 = [(CKConversationListCollectionViewController *)self collectionView];
      [v8 __ck_scrollToTop:1];
      goto LABEL_17;
    }
  }
}

- (void)dismissCatalystSearch
{
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v3 = [(CKConversationListCollectionViewController *)self searchController];
    int v4 = [v3 isActive];

    if (v4)
    {
      id v5 = [(CKConversationListCollectionViewController *)self searchController];
      [v5 setActive:0];

      id v6 = [(CKConversationListCollectionViewController *)self searchController];
      [v6 setShowsSearchResultsController:0];
    }
  }
}

- (void)showiCloudNotSignedInAlertForNicknames
{
  BOOL v3 = (void *)MEMORY[0x1E4F42728];
  int v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"NICKNAME_FEATURE_NOT_AVAILABLE_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v6 = CKFrameworkBundle();
  int v7 = [v6 localizedStringForKey:@"NICKNAME_APPLEID_ICLOUD_MISMATCH_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v18 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  int v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v4) = [v8 isNameAndPhotoC3Enabled];

  if (v4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F42728];
    char v10 = CKFrameworkBundle();
    objc_super v11 = [v10 localizedStringForKey:@"NICKNAME_FEATURE_NOT_AVAILABLE_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v12 = CKFrameworkBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"NICKNAME_ICLOUD_NOT_SIGNED_IN_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v14 = [v9 alertControllerWithTitle:v11 message:v13 preferredStyle:1];

    id v18 = (id)v14;
  }
  __int16 v15 = CKFrameworkBundle();
  __int16 v16 = [v15 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v17 = +[CKAlertAction actionWithTitle:v16 style:0 handler:0];
  [v18 addAction:v17];

  [(CKConversationListCollectionViewController *)self presentViewController:v18 animated:1 completion:0];
}

- (void)showMultiplePhoneNumbersAlertForNicknames
{
  BOOL v3 = (void *)MEMORY[0x1E4F42728];
  int v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"NICKNAME_FEATURE_NOT_AVAILABLE_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v6 = CKFrameworkBundle();
  int v7 = [v6 localizedStringForKey:@"NICKNAME_MULTIPLE_PHONE_NUMBERS_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v11 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  int v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  char v10 = +[CKAlertAction actionWithTitle:v9 style:0 handler:0];
  [v11 addAction:v10];

  [(CKConversationListCollectionViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)deleteButtonTappedForItemIdentifier:(id)a3 completionHandler:(id)a4 cellToUpdate:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v8];
  if (v11)
  {
    id v12 = [(CKConversationListCollectionViewController *)self conversationList];
    uint64_t v13 = [v12 pendingConversation];

    int v14 = IMOSLoggingEnabled();
    if (v11 == v13)
    {
      if (v14)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          id v19 = v8;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Delete action triggered for pending conversation with identifier: [%@].", (uint8_t *)&v18, 0xCu);
        }
      }
      [(CKConversationListCollectionViewController *)self performDeletionForPendingConversationCell:v10 completionHandler:v9];
    }
    else
    {
      if (v14)
      {
        __int16 v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          id v19 = v8;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Delete action triggered for active conversation with identifier: [%@].", (uint8_t *)&v18, 0xCu);
        }
      }
      [(CKConversationListCollectionViewController *)self performDeletionForActiveConversation:v11 itemIdentifier:v8 completionHandler:v9 cellToUpdate:v10];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Tried to delete item identifier [%@] which does not exist.", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (BOOL)_shouldSelectConversationAfterDeletingIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 selectNewConversationOnDeletion];

  if (!v6) {
    goto LABEL_7;
  }
  int v7 = [(CKConversationListCollectionViewController *)self delegate];
  char v8 = [v7 isCollapsed];

  if (v8) {
    goto LABEL_7;
  }
  id v9 = [(CKConversationListCollectionViewController *)self dataSource];
  id v10 = [v9 snapshot];
  id v11 = [v10 itemIdentifiers];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA80];
    int v14 = [(CKConversationListCollectionViewController *)self collectionView];
    __int16 v15 = [v14 indexPathsForSelectedItems];
    __int16 v16 = [v13 setWithArray:v15];

    if (v4) {
      [v16 removeObject:v4];
    }
    BOOL v17 = [v16 count] == 0;
  }
  else
  {
LABEL_7:
    BOOL v17 = 0;
  }

  return v17;
}

- (void)performDeletionForActiveConversation:(id)a3 itemIdentifier:(id)a4 completionHandler:(id)a5 cellToUpdate:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v29 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v10;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "[Recently Deleted] Initiating deletion on conversation: %@", buf, 0xCu);
    }
  }
  int v14 = [(CKConversationListCollectionViewController *)self delegate];
  uint64_t v15 = [v14 isCollapsed];

  __int16 v16 = [(CKConversationListCollectionViewController *)self dataSource];
  BOOL v17 = [v16 indexPathForItemIdentifier:v29];

  int v18 = [(CKConversationListCollectionViewController *)self updater];
  [v18 beginHoldingUpdatesForReason:@"swipeToDelete"];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke;
  aBlock[3] = &unk_1E5629DF8;
  void aBlock[4] = self;
  id v19 = v10;
  id v36 = v19;
  id v20 = v17;
  id v37 = v20;
  id v21 = v12;
  id v38 = v21;
  uint64_t v22 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_3;
  v32[3] = &unk_1E56271A8;
  id v23 = v22;
  id v33 = v23;
  id v24 = v11;
  id v34 = v24;
  long long v25 = _Block_copy(v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_4;
  v30[3] = &unk_1E5622330;
  v30[4] = self;
  id v26 = v24;
  id v31 = v26;
  long long v27 = _Block_copy(v30);
  if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    id v40 = v19;
    long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [(CKConversationListCollectionViewController *)self presentPermanentJunkConversationDeletionConfirmation:v28 alertsCompletedBlock:v25 cancelBlock:v27];
  }
  else
  {
    id v39 = v19;
    long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    [(CKConversationListCollectionViewController *)self presentRecoverableDeleteConfirmationsWithConversations:v28 collapsedAppearance:v15 alertsCompletedBlock:v25 cancelBlock:v27];
  }
}

void __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  id v4 = [*(id *)(a1 + 32) conversationList];
  [v4 removeConversation:*(void *)(a1 + 40)];

  id v5 = *(void **)(a1 + 32);
  v28[0] = *(void *)(a1 + 40);
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v5 _removeConversationsFromFrozenConversations:v6];

  if ([*(id *)(a1 + 40) isPinned]) {
    [*(id *)(a1 + 32) setHoldPinningUpdatesForConversationDeletion:1];
  }
  int v7 = [*(id *)(a1 + 32) delegate];
  uint64_t v27 = *(void *)(a1 + 40);
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [v7 conversationListIsDeletingConversations:v8];

  uint64_t v9 = [*(id *)(a1 + 32) filterMode];
  id v10 = [*(id *)(a1 + 32) conversationList];
  if (v9 == 9)
  {
    uint64_t v26 = *(void *)(a1 + 40);
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v10 deleteConversations:v11];
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 40);
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_2;
    v24[3] = &unk_1E5620C40;
    v24[4] = *(void *)(a1 + 32);
    [v10 recoverableDeleteForConversations:v11 deleteDate:v12 synchronousQuery:0 completionHandler:v24];
  }
  [*(id *)(a1 + 32) updateSnapshotAnimatingDifferences:1];
  uint64_t v13 = [*(id *)(a1 + 32) updater];
  [v13 endAllHoldsOnUpdatesForReason:@"swipeToDelete" updateTriggeredIfNotHeldShouldBeDeferred:1];

  int v14 = [*(id *)(a1 + 32) conversationList];
  uint64_t v15 = [v14 conversations];
  uint64_t v16 = [v15 count];

  if (!v16) {
    [*(id *)(a1 + 32) updateNavigationItems];
  }
  if ([*(id *)(a1 + 32) _shouldSelectConversationAfterDeletingIndexPath:*(void *)(a1 + 48)])
  {
    BOOL v17 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 48)) {
      objc_msgSend(v17, "selectConversationClosestToDeletedIndex:");
    }
    else {
      [v17 selectDefaultConversationAnimated:1];
    }
  }
  else
  {
    int v18 = [*(id *)(a1 + 32) delegate];
    if (![v18 isCollapsed])
    {
      id v19 = [*(id *)(a1 + 32) collectionView];
      id v20 = [v19 indexPathsForSelectedItems];
      uint64_t v21 = [v20 count];

      if (v21) {
        goto LABEL_16;
      }
      int v18 = [*(id *)(a1 + 32) delegate];
      [v18 updateForNoConversationSelected];
    }
  }
LABEL_16:
  [*(id *)(a1 + 32) leaveJunkFilterIfNeeded];
  if ([*(id *)(a1 + 56) conformsToProtocol:&unk_1EDF98C00]) {
    [*(id *)(a1 + 56) updateContentsForConversation:0];
  }
  uint64_t v22 = [*(id *)(a1 + 40) deviceIndependentID];
  id v23 = CKTextInputIdentifier();
  if (v23) {
    [MEMORY[0x1E4F42D40] clearTextInputContextIdentifier:v23];
  }
  if (v3) {
    v3[2](v3, 1);
  }
}

void __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) conversationList];
  [v1 updateConversationListsAndSortIfEnabled];
}

uint64_t __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelDeletion:*(void *)(a1 + 40)];
}

- (void)performDeletionForPendingConversationCell:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  id v5 = [(CKConversationListCollectionViewController *)self updater];
  [v5 beginHoldingUpdatesForReason:@"swipeToDelete"];

  int v6 = [(CKConversationListCollectionViewController *)self delegate];
  [v6 conversationListControllerTappedDeleteNewMessage:self];

  int v7 = [(CKConversationListCollectionViewController *)self updater];
  [v7 endAllHoldsOnUpdatesForReason:@"swipeToDelete" updateTriggeredIfNotHeldShouldBeDeferred:1];

  char v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    char v8 = v9;
  }
}

- (void)_cancelDeletion:(id)a3
{
  id v6 = a3;
  id v4 = [(CKConversationListCollectionViewController *)self updater];
  [v4 endAllHoldsOnUpdatesForReason:@"swipeToDelete" updateTriggeredIfNotHeldShouldBeDeferred:1];

  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    id v5 = v6;
  }
}

- (BOOL)_canShowSyncProgressFooter
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F6E720] sharedInstance];
  char v4 = [v3 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:@"cksync-always-show-progress" defaultValue:0];

  id v5 = [MEMORY[0x1E4F6BC68] sharedInstance];
  char v6 = [v5 isEnabled] | v4;

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6E720] sharedInstance];
    char v8 = [v7 getBoolFromDomain:@"com.apple.MobileSMS" forKey:@"MiCShowProgressFooter" defaultValue:1];

    if (v8)
    {
      if ([(CKConversationListCollectionViewController *)self filterMode] == 7
        || [(CKConversationListCollectionViewController *)self filterMode] == 9)
      {
        int v9 = IMOSLoggingEnabled();
        if (v9)
        {
          id v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Filter mode is recently deleted or oscar.", (uint8_t *)&v18, 2u);
          }
LABEL_16:

LABEL_17:
          LOBYTE(v9) = 0;
        }
      }
      else
      {
        if (![(CKConversationListCollectionViewController *)self isVisible]
          || [(CKConversationListCollectionViewController *)self isBelowMacSnapToMinWidth]
          || [(CKConversationListCollectionViewController *)self isEditing])
        {
          int v9 = IMOSLoggingEnabled();
          if (!v9) {
            return v9;
          }
          id v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            if ([(CKConversationListCollectionViewController *)self isVisible]) {
              id v12 = @"YES";
            }
            else {
              id v12 = @"NO";
            }
            BOOL v13 = [(CKConversationListCollectionViewController *)self isBelowMacSnapToMinWidth];
            int v14 = [(CKConversationListCollectionViewController *)self isEditing];
            if (v13) {
              uint64_t v15 = @"YES";
            }
            else {
              uint64_t v15 = @"NO";
            }
            int v18 = 138412802;
            if (v14) {
              uint64_t v16 = @"YES";
            }
            else {
              uint64_t v16 = @"NO";
            }
            id v19 = v12;
            __int16 v20 = 2112;
            uint64_t v21 = v15;
            __int16 v22 = 2112;
            id v23 = v16;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "isVisible={%@} / isBelowMacSnapToMinWidth={%@} / isEditing={%@}", (uint8_t *)&v18, 0x20u);
          }

          goto LABEL_17;
        }
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      int v9 = IMOSLoggingEnabled();
      if (v9)
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          id v19 = @"NO";
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "hasProgressEnabled={%@}.", (uint8_t *)&v18, 0xCu);
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
    int v9 = IMOSLoggingEnabled();
    if (v9)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = @"NO";
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "MiC is not enabled. forceShow={%@}.", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_16;
    }
  }
  return v9;
}

- (void)_updateSyncStatusViewWithSyncState:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 syncJobState];
  IMStringFromIMCloudKitSyncJobState();
  double v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v58;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Updating sync footer for syncJobState = %@.", buf, 0xCu);
    }
  }
  if ([(CKConversationListCollectionViewController *)self _canShowSyncProgressFooter])
  {
    char v6 = [(CKConversationListCollectionViewController *)self syncStatusView];
    if (v6)
    {
      int v7 = [(CKConversationListCollectionViewController *)self syncStatusView];
      int v8 = [v7 isVisibleInViewHierarchy];
    }
    else
    {
      int v8 = 0;
    }

    if (v4)
    {
      if ([v4 hasNotSyncedInLastSevenDays])
      {
        if ([v4 accountStatus] == 2) {
          int v13 = 1;
        }
        else {
          int v13 = [v4 accountNeedsRepair];
        }
      }
      else
      {
        int v13 = 0;
      }
      if ([v4 syncType] && objc_msgSend(v4, "syncType") != 1)
      {
        if ([v4 syncType] == 2) {
          int v16 = [v4 hasNotSyncedInLastSevenDays];
        }
        else {
          int v16 = 0;
        }
      }
      else
      {
        int v16 = 1;
      }
      BOOL v17 = [v4 syncJobState] == 2
         || [v4 syncJobState] == 3
         || [v4 syncJobState] == 4
         || [v4 syncJobState] == 5;
      int v18 = [v4 isBetweenInitialAndFullSync];
      id v19 = [MEMORY[0x1E4F6E720] sharedInstance];
      int v20 = [v19 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:@"cksync-always-show-progress" defaultValue:0];

      if (v13) {
        int v8 = 1;
      }
      else {
        int v8 = v16 & v17 | v18 | v20;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          __int16 v22 = @"NO";
          if (v8) {
            id v23 = @"YES";
          }
          else {
            id v23 = @"NO";
          }
          if (v13) {
            uint64_t v24 = @"YES";
          }
          else {
            uint64_t v24 = @"NO";
          }
          *(_DWORD *)buf = 138413314;
          id v61 = v23;
          if (v16) {
            uint64_t v25 = @"YES";
          }
          else {
            uint64_t v25 = @"NO";
          }
          __int16 v62 = 2112;
          double v63 = v24;
          if (v17) {
            uint64_t v26 = @"YES";
          }
          else {
            uint64_t v26 = @"NO";
          }
          __int16 v64 = 2112;
          v65 = v25;
          __int16 v66 = 2112;
          if (v18) {
            __int16 v22 = @"YES";
          }
          double v67 = v26;
          __int16 v68 = 2112;
          uint64_t v69 = v22;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "isSyncBarNeeded={%@} / needsRepair={%@} / syncTypeSupportsSyncBar={%@} / isRelevantJobState={%@} / isBetweenInitialAndFullSync={%@}", buf, 0x34u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = @"NO";
        if (v8) {
          uint64_t v15 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v61 = v15;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "isSyncBarNeeded={%@}", buf, 0xCu);
      }
    }
    if (!self->_syncStatusView && v8)
    {
      uint64_t v27 = objc_alloc_init(CKCloudSyncStatusView);
      [(CKCloudSyncStatusView *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_storeStrong((id *)&self->_syncStatusView, v27);
      if (IMOSLoggingEnabled())
      {
        long long v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Lazily created CKCloudSyncStatusView.", buf, 2u);
        }
      }
    }
    if (v4) {
      [(CKCloudSyncStatusView *)self->_syncStatusView updateWithSyncState:v4];
    }
    id v29 = [(CKConversationListCollectionViewController *)self syncStatusView];
    uint64_t v30 = v29;
    if (v8)
    {
      id v31 = [v29 superview];
      BOOL v32 = v31 == 0;

      if (v32)
      {
        if (IMOSLoggingEnabled())
        {
          id v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Sync footer is needed; adding Sync footer to view hierarchy.",
              buf,
              2u);
          }
        }
        id v34 = [(CKConversationListCollectionViewController *)self view];
        id v35 = [(CKConversationListCollectionViewController *)self syncStatusView];
        [v34 addSubview:v35];

        id v36 = [(CKConversationListCollectionViewController *)self view];
        id v37 = [(CKConversationListCollectionViewController *)self syncStatusView];
        [v36 bringSubviewToFront:v37];

        id v49 = (void *)MEMORY[0x1E4F28DC8];
        id v57 = [(CKConversationListCollectionViewController *)self syncStatusView];
        double v55 = [v57 leadingAnchor];
        CGFloat v56 = [(CKConversationListCollectionViewController *)self view];
        CGFloat v54 = [v56 leadingAnchor];
        int v53 = [v55 constraintEqualToAnchor:v54];
        v59[0] = v53;
        uint64_t v52 = [(CKConversationListCollectionViewController *)self syncStatusView];
        __int16 v50 = [v52 trailingAnchor];
        id v51 = [(CKConversationListCollectionViewController *)self view];
        id v38 = [v51 trailingAnchor];
        id v39 = [v50 constraintEqualToAnchor:v38];
        v59[1] = v39;
        id v40 = [(CKConversationListCollectionViewController *)self syncStatusView];
        long long v41 = [v40 bottomAnchor];
        id v42 = [(CKConversationListCollectionViewController *)self view];
        uint64_t v43 = [v42 bottomAnchor];
        long long v44 = [v41 constraintEqualToAnchor:v43];
        v59[2] = v44;
        long long v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
        [v49 activateConstraints:v45];

        [(CKConversationListCollectionViewController *)self _updateInsets];
      }
      goto LABEL_81;
    }
    int v46 = [v29 isVisibleInViewHierarchy];

    if (!v46) {
      goto LABEL_81;
    }
    if (IMOSLoggingEnabled())
    {
      long long v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "Removing Sync footer from view hierarchy as it's no longer needed.", buf, 2u);
      }
    }
LABEL_80:
    int v48 = [(CKConversationListCollectionViewController *)self syncStatusView];
    [v48 removeFromSuperview];

    [(CKConversationListCollectionViewController *)self setSyncStatusView:0];
    [(CKConversationListCollectionViewController *)self _updateInsets];
    goto LABEL_81;
  }
  if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Cloud Sync footer cannot be shown.", buf, 2u);
    }
  }
  id v10 = [(CKConversationListCollectionViewController *)self syncStatusView];
  int v11 = [v10 isVisibleInViewHierarchy];

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Removing Sync footer from view hierarchy.", buf, 2u);
      }
    }
    goto LABEL_80;
  }
LABEL_81:
}

- (void)registerForCloudKitEventsImmediately
{
}

void __95__CKConversationListCollectionViewController_registerForCloudKitEventsWithDelayedRegistration___block_invoke_797(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (IMOSLoggingEnabled())
    {
      id v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "registered for cloud kit events", v5, 2u);
      }
    }
    BOOL v3 = [MEMORY[0x1E4F6BC60] sharedInstance];
    [v3 addEventHandler:WeakRetained];

    id v4 = [MEMORY[0x1E4F6BC60] sharedInstance];
    [v4 fetchSyncState];
  }
}

- (void)unregisterForCloudKitEvents
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v4 = [v3 isMessagesIniCloudVersion2];

  if ((v4 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "unregistered for cloudkit events", v7, 2u);
      }
    }
    char v6 = [MEMORY[0x1E4F6BC60] sharedInstance];
    [v6 removeEventHandler:self];
  }
}

- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4
{
}

- (BOOL)_isRunningPPT
{
  return __CurrentTestName != 0;
}

- (id)_itemIdentifierOfDefaultConversation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained currentConversation];

  if (v4 && ([v4 isPending] & 1) == 0)
  {
    if ([v4 isPinned]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 5;
    }
    id v5 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v4 inSection:v6];
  }
  else
  {
    id v5 = &stru_1EDE4CA38;
  }
  if (![(__CFString *)v5 length])
  {
    int v7 = [(CKConversationListCollectionViewController *)self dataSource];
    int v8 = [v7 snapshot];
    uint64_t v9 = [v8 indexOfSectionIdentifier:&unk_1EDF16958];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Unable to find new conversation section in current snapshot", buf, 2u);
        }
      }
    }
    else
    {
      int v11 = [(CKConversationListCollectionViewController *)self dataSource];
      id v12 = [v11 snapshot];
      int v13 = [v12 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16958];
      uint64_t v14 = [v13 firstObject];

      id v5 = (__CFString *)v14;
    }
  }
  if (![(__CFString *)v5 length])
  {
    uint64_t v15 = [(CKConversationListCollectionViewController *)self dataSource];
    int v16 = [v15 snapshot];
    uint64_t v17 = [v16 indexOfSectionIdentifier:&unk_1EDF16940];

    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (IMOSLoggingEnabled())
      {
        int v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Unable to find active conversation section in current snapshot", buf, 2u);
        }
      }
    }
    else
    {
      id v19 = [(CKConversationListCollectionViewController *)self dataSource];
      int v20 = [v19 snapshot];
      uint64_t v21 = [v20 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16940];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v27 = -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v26, (void)v31);
            long long v28 = v27;
            if (v27 && ([v27 hasUnreadMessages] & 1) == 0)
            {
              id v29 = v26;

              id v5 = v29;
              goto LABEL_32;
            }
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
LABEL_32:
    }
  }

  return v5;
}

- (id)_indexPathOfDefaultConversation
{
  BOOL v3 = [(CKConversationListCollectionViewController *)self _itemIdentifierOfDefaultConversation];
  if ([v3 length])
  {
    char v4 = [(CKConversationListCollectionViewController *)self dataSource];
    id v5 = [v4 indexPathForItemIdentifier:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_selectConversationAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if (v4) {
        int v8 = @"YES";
      }
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      int v18 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Selecting conversation at indexPath: %@  animated:%@", (uint8_t *)&v15, 0x16u);
    }
  }
  [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:CKIsRunningInMacCatalyst() == 0];
  uint64_t v9 = [(CKConversationListCollectionViewController *)self collectionView];
  id v10 = v9;
  if (v6)
  {
    int v11 = [(CKConversationListCollectionViewController *)self collectionView];
    [(CKConversationListCollectionViewController *)self _deselectSelectedIndexPathsInCollectionView:v11 animated:v4];

    [v10 selectItemAtIndexPath:v6 animated:v4 scrollPosition:0];
    [v10 scrollToItemAtIndexPath:v6 atScrollPosition:0 animated:v4];
    [(CKConversationListCollectionViewController *)self _performTranscriptPushForItemAtIndexPath:v6 userInitiated:0];
  }
  else
  {
    id v12 = [v9 indexPathsForSelectedItems];
    int v13 = [v12 firstObject];
    [v10 deselectItemAtIndexPath:v13 animated:v4];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained showConversation:0 animate:v4];
  }
}

- (void)deleteSelectedConversation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKConversationListCollectionViewController *)self collectionView];
  BOOL v4 = [v3 indexPathsForSelectedItems];
  if (v4)
  {
    id v5 = [(CKConversationListCollectionViewController *)self collectionView];
    id v6 = [v5 indexPathsForSelectedItems];
    int v7 = [v6 objectAtIndex:0];
  }
  else
  {
    int v7 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Deleting selected conversation (index path %@)", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v7)
  {
    uint64_t v9 = [(CKConversationListCollectionViewController *)self collectionView];
    id v10 = [v9 cellForItemAtIndexPath:v7];

    int v11 = [(CKConversationListCollectionViewController *)self dataSource];
    id v12 = [v11 itemIdentifierForIndexPath:v7];

    [(CKConversationListCollectionViewController *)self deleteButtonTappedForItemIdentifier:v12 completionHandler:0 cellToUpdate:v10];
  }
}

- (void)removePendingConversationCell
{
}

- (void)selectDefaultConversationAnimated:(BOOL)a3 removingPendingConversationCell:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4) {
    [(CKConversationListCollectionViewController *)self removePendingConversationCell];
  }

  [(CKConversationListCollectionViewController *)self selectDefaultConversationAnimated:v4 shouldUsePreviousySelectedIndexPath:0];
}

- (void)selectDefaultConversationAnimated:(BOOL)a3 shouldUsePreviousySelectedIndexPath:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if (v5) {
        int v8 = @"YES";
      }
      int v17 = 138412290;
      int v18 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Selecting default conversation, animated:%@", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t v9 = [(CKConversationListCollectionViewController *)self _indexPathOfDefaultConversation];
  int v10 = CKIsRunningInMacCatalyst();
  if (v4 && v10)
  {
    int v11 = [(CKConversationListCollectionViewController *)self lastSelectedConversationItemIdentifier];
    if (![v11 length])
    {
      id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v13 = [v12 objectForKey:@"CKLastSelectedItemIdentifier" inDomain:@"com.apple.MobileSMS"];

      int v11 = (void *)v13;
    }
    uint64_t v14 = [(CKConversationListCollectionViewController *)self dataSource];
    uint64_t v15 = [v14 indexPathForItemIdentifier:v11];

    if (v15)
    {
      id v16 = v15;

      uint64_t v9 = v16;
    }
  }
  [(CKConversationListCollectionViewController *)self _selectConversationAtIndexPath:v9 animated:v5];
}

- (void)selectDefaultConversationAnimated:(BOOL)a3
{
}

- (void)selectNextSequentialConversation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKConversationListCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathsForSelectedItems];
  id v16 = [v6 firstObject];

  if (v16)
  {
    int v7 = [(CKConversationListCollectionViewController *)self nextSequentialIndexPathForIndexPath:v16 descending:v3];
    if (v7)
    {
      [(CKConversationListCollectionViewController *)self _selectConversationAtIndexPath:v7 animated:0];
    }
    else if (!v3)
    {
      int v8 = +[CKConversationList sharedConversationList];
      uint64_t v9 = [v8 pendingConversation];
      if (v9)
      {
        int v10 = (void *)v9;
        BOOL v11 = [(CKConversationListCollectionViewController *)self shouldShowPendingCell];

        if (v11)
        {
          [(CKConversationListCollectionViewController *)self setEditingMode:0 animated:0];
          p_delegate = &self->_delegate;
          id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          char v14 = [WeakRetained isComposingMessage];

          if ((v14 & 1) == 0)
          {
            id v15 = objc_loadWeakRetained((id *)p_delegate);
            [v15 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
          }
        }
      }
      else
      {
      }
    }
  }
  else
  {
    -[CKConversationListCollectionViewController selectDefaultConversationAnimated:](self, "selectDefaultConversationAnimated:");
  }
}

- (void)selectPinnedConversationForItem:(int64_t)a3
{
  if (![(CKConversationListCollectionViewController *)self hasActivePinnedConversationDropSession])
  {
    BOOL v5 = [(CKConversationListCollectionViewController *)self dataSource];
    id v6 = [v5 snapshot];
    unint64_t v7 = [v6 numberOfItemsInSection:&unk_1EDF16928];

    NSLog(&cfstr_NumerofchatsLd.isa, v7, a3);
    if (v7 >= a3)
    {
      id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 - 1 inSection:2];
      [(CKConversationListCollectionViewController *)self _selectConversationAtIndexPath:v8 animated:1];
    }
  }
}

- (void)selectFirstActiveConversation
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:5];
  [(CKConversationListCollectionViewController *)self _selectConversationAtIndexPath:v3 animated:1];
}

- (void)selectConversationClosestToDeletedIndex:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      uint64_t v8 = MEMORY[0x1E4F148E0];
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Selecting conversation closest to deleted index: %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  id v6 = [(CKConversationListCollectionViewController *)self nextSequentialIndexPathForIndexPath:v4 descending:0];
  if (v6
    || ([(CKConversationListCollectionViewController *)self nextSequentialIndexPathForIndexPath:v4 descending:1], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(CKConversationListCollectionViewController *)self _selectConversationAtIndexPath:v6 animated:1];
  }
  else
  {
    [(CKConversationListCollectionViewController *)self selectDefaultConversationAnimated:1];
  }
}

- (void)updateConversationSelection
{
  if ([(CKConversationListCollectionViewController *)self _shouldKeepSelection])
  {
    [(CKConversationListCollectionViewController *)self updateConversationSelectionPreservingLastSelectedItemIdentifier];
  }
  else
  {
    [(CKConversationListCollectionViewController *)self setLastSelectedConversationItemIdentifier:0];
  }
}

- (void)updateConversationSelectionToNewCompose
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(CKConversationListCollectionViewController *)self _shouldUpdateConversationSelection])
  {
    if ([(CKConversationListCollectionViewController *)self shouldShowPendingCell])
    {
      id v3 = [(CKConversationListCollectionViewController *)self delegate];
      char v4 = [v3 isShowingComposeChatController];

      int v5 = IMOSLoggingEnabled();
      if (v4)
      {
        if (v5)
        {
          id v6 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            LOWORD(v21) = 0;
            _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "multi-select: updating selection to new compose cell", (uint8_t *)&v21, 2u);
          }
        }
        int v7 = [(CKConversationListCollectionViewController *)self dataSource];
        uint64_t v8 = +[CKConversationListNewMessageCollectionViewCell reuseIdentifier];
        uint64_t v9 = [v7 indexPathForItemIdentifier:v8];

        if (v9)
        {
          int v10 = [(CKConversationListCollectionViewController *)self collectionView];
          BOOL v11 = [v10 indexPathsForSelectedItems];

          if (([v11 containsObject:v9] & 1) == 0)
          {
            id v12 = [(CKConversationListCollectionViewController *)self collectionView];
            [(CKConversationListCollectionViewController *)self _deselectSelectedIndexPathsInCollectionView:v12 animated:0];

            uint64_t v13 = [(CKConversationListCollectionViewController *)self collectionView];
            [v13 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];
          }
          char v14 = +[CKConversationListNewMessageCollectionViewCell reuseIdentifier];
          [(CKConversationListCollectionViewController *)self setLastSelectedConversationItemIdentifier:v14];

          if (IMOSLoggingEnabled())
          {
            id v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              int v21 = 138412290;
              id v22 = v9;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "multi-select: selected new compose indexPath: %@", (uint8_t *)&v21, 0xCu);
            }
          }
        }
        else
        {
          BOOL v16 = [(CKConversationListCollectionViewController *)self shouldShowPendingCell];
          int v17 = IMOSLoggingEnabled();
          if (v16)
          {
            if (v17)
            {
              int v18 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                LOWORD(v21) = 0;
                _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "multi-select: snapshot does not contain compose cell. Updating conversation list", (uint8_t *)&v21, 2u);
              }
            }
            uint64_t v19 = [(CKConversationListCollectionViewController *)self updater];
            [v19 setNeedsDeferredUpdateWithReason:@"showingNewCompose"];
          }
          else if (v17)
          {
            int v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              LOWORD(v21) = 0;
              _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "multi-select: new compose cell is not shown for current state. Bailing to preserve current selection and to prevent recursive loop", (uint8_t *)&v21, 2u);
            }
          }
        }
      }
      else
      {
        if (!v5) {
          return;
        }
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "multi-select: Not showing compose chatController. Bailing to preserve current selection", (uint8_t *)&v21, 2u);
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "multi-select: new compose cell is not shown for current state. Bailing to preserve current selection", (uint8_t *)&v21, 2u);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "multi-select: did not update selection to new compose cell - selection not allowed", (uint8_t *)&v21, 2u);
    }
  }
}

- (int64_t)_alertControllerStyle
{
  id v3 = [(CKConversationListCollectionViewController *)self delegate];
  int64_t v4 = -[CKConversationListCollectionViewController _alertControllerStyleForCollapsedState:](self, "_alertControllerStyleForCollapsedState:", [v3 isCollapsed]);

  return v4;
}

- (int64_t)_alertControllerStyleForCollapsedState:(BOOL)a3
{
  return !a3;
}

- (void)prepareForSuspend
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if (!CKIsRunningInMacCatalyst())
  {
    id v3 = [(CKConversationListCollectionViewController *)self searchController];
    int v4 = [v3 isActive];

    if (v4)
    {
      int v5 = [(CKConversationListCollectionViewController *)self searchController];
      [v5 setActive:0];
    }
    id v6 = [(CKConversationListCollectionViewController *)self searchResultsController];
    [v6 cancelCurrentQuery];

    int v7 = +[CKPluginExtensionStateObserver sharedInstance];
    char v8 = [v7 passKitUIPresented];

    if ((v8 & 1) == 0)
    {
      v26[0] = @"swipeToDelete";
      v26[1] = @"markAsRead";
      v26[2] = @"chatItemChangeSuppression";
      [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
            id v15 = [(CKConversationListCollectionViewController *)self updater];
            [v15 endAllHoldsOnUpdatesForReason:v14 updateTriggeredIfNotHeldShouldBeDeferred:1];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }
    }
    BOOL v16 = +[CKAdaptivePresentationController sharedInstance];
    int v17 = [v16 presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v19 = +[CKAdaptivePresentationController sharedInstance];
      [v19 dismissViewControllerAnimated:1 completion:0];

      int v20 = +[CKAdaptivePresentationController sharedInstance];
      [v20 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_conversationListPinnedConversationsDidChange:(id)a3
{
  int v4 = [a3 userInfo];
  id v6 = [v4 objectForKeyedSubscript:@"previousPinnedConversationIdentifiers"];

  [(CKConversationListCollectionViewController *)self _submitFeedbackIfNecessaryForPinsChangedWithPreviousPinnedConversationIdentifiers:v6];
  if ([(CKConversationListCollectionViewController *)self holdPinningUpdatesForConversationDeletion])
  {
    [(CKConversationListCollectionViewController *)self setHoldPinningUpdatesForConversationDeletion:0];
  }
  else
  {
    if ([(CKConversationListCollectionViewController *)self nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate])
    {
      BOOL v5 = [(CKConversationListCollectionViewController *)self isShowingPinningOnboarding];
    }
    else
    {
      BOOL v5 = 1;
    }
    [(CKConversationListCollectionViewController *)self setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:0];
    [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:v5];
    [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:v5];
    [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:v5];
    [(CKConversationListTipManager *)self->_tipManager userDidPinConversation];
  }
}

- (void)setHasActivePinnedConversationDropSession:(BOOL)a3
{
  if (self->_hasActivePinnedConversationDropSession != a3)
  {
    self->_hasActivePinnedConversationDropSession = a3;
    [(CKConversationListCollectionViewController *)self setEditButtonItem:0];
    [(CKConversationListCollectionViewController *)self setOptionsButtonItem:0];
    [(CKConversationListCollectionViewController *)self updateNavigationItems];
    [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:1];
  }
}

- (void)setIsShowingPinningOnboarding:(BOOL)a3
{
  if (self->_isShowingPinningOnboarding != a3) {
    self->_isShowingPinningOnboarding = a3;
  }
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(CKConversationListCollectionViewController *)self searchController];
  }
  BOOL v5 = [(CKConversationListCollectionViewController *)self navigationItem];
  [v5 setSearchController:v6];

  if (!a3)
  {
  }
}

- (void)_updateRefreshControlVisibility
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (!v4) {
    return;
  }
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7) {
    goto LABEL_6;
  }
  BOOL v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
  char v6 = [v5 isSatelliteConnectionActive];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
  int v7 = [MEMORY[0x1E4F6BC48] sharedInstance];
  if ([v7 isStewieActive])
  {
    char v8 = [MEMORY[0x1E4F6BC48] sharedInstance];
    char v9 = [v8 isMessagingActiveOverSatellite];

    if ((v9 & 1) == 0)
    {
LABEL_6:
      [(CKConversationListCollectionViewController *)self _removeRefreshControl];
      return;
    }
  }
  else
  {
  }
  uint64_t v10 = [(CKConversationListCollectionViewController *)self collectionViewRefreshControl];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F42D38]);
    [(CKConversationListCollectionViewController *)self setCollectionViewRefreshControl:v11];
  }
  uint64_t v12 = [(CKConversationListCollectionViewController *)self collectionViewRefreshControl];
  [v12 addTarget:self action:sel__didPullToRefresh_ forControlEvents:4096];

  uint64_t v13 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v14 = [(CKConversationListCollectionViewController *)self collectionViewRefreshControl];
  [v13 setRefreshControl:v14];

  id v15 = [(CKConversationListCollectionViewController *)self collectionViewRefreshControl];
  [v15 beginRefreshing];

  BOOL v16 = [(CKConversationListCollectionViewController *)self navigationController];
  [v16 _scrollToRevealNavigationBarPart:8 animated:1];

  [(CKConversationListCollectionViewController *)self _startRefreshControlTimer];
}

- (void)_pendingSatelliteCountChanged
{
  id v3 = [(CKConversationListCollectionViewController *)self collectionViewRefreshControl];
  [v3 endRefreshing];

  [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:1];
}

- (void)_isDownloadingPendingSatelliteMessagesChanged
{
}

- (void)_removeRefreshControl
{
  id v3 = [(CKConversationListCollectionViewController *)self refreshControlTimer];

  if (v3)
  {
    int v4 = [(CKConversationListCollectionViewController *)self refreshControlTimer];
    [v4 invalidate];

    [(CKConversationListCollectionViewController *)self setRefreshControlTimer:0];
  }
  BOOL v5 = [(CKConversationListCollectionViewController *)self collectionViewRefreshControl];

  if (v5)
  {
    char v6 = [(CKConversationListCollectionViewController *)self collectionViewRefreshControl];
    [v6 endRefreshing];

    [(CKConversationListCollectionViewController *)self setCollectionViewRefreshControl:0];
    id v7 = [(CKConversationListCollectionViewController *)self collectionView];
    [v7 setRefreshControl:0];
  }
}

- (void)_didPullToRefresh:(id)a3
{
  [a3 beginRefreshing];

  [(CKConversationListCollectionViewController *)self _startRefreshControlTimer];
}

- (void)_startRefreshControlTimer
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __71__CKConversationListCollectionViewController__startRefreshControlTimer__block_invoke;
  char v8 = &unk_1E5629740;
  objc_copyWeak(&v9, &location);
  int v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v5 block:30.0];
  -[CKConversationListCollectionViewController setRefreshControlTimer:](self, "setRefreshControlTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__CKConversationListCollectionViewController__startRefreshControlTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Timed out waiting on message summary / pending count change. Stopping refresh control.", v7, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained collectionViewRefreshControl];
  [v6 endRefreshing];
}

- (void)_updateAccountRegistrationFailureNotification
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Update Tip manager", v4, 2u);
    }
  }
  [(CKConversationListTipManager *)self->_tipManager updateKtTipRules];
}

- (id)leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section] == 5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [(CKConversationListCollectionViewController *)self _markUnreadSwipeActionForIndexPath:v4];
    if (v6) {
      [v5 addObject:v6];
    }
    id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v8 = [v7 isPinActionEnabled];

    if (v8)
    {
      id v9 = [(CKConversationListCollectionViewController *)self _pinConversationSwipeActionForIndexPath:v4];
      if (v9) {
        [v5 addObject:v9];
      }
    }
    if ([v5 count])
    {
      uint64_t v10 = [MEMORY[0x1E4F42E68] configurationWithActions:v5];
      [v10 setPerformsFirstActionWithFullSwipe:1];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (CKIsRunningInMacCatalyst() && [v4 section] == 4)
  {
    uint64_t v6 = [(CKConversationListCollectionViewController *)self _deleteSwipeActionForIndexPath:v4];
    if (v6) {
      [v5 addObject:v6];
    }
  }
  else
  {
    if ([v4 section] != 5) {
      goto LABEL_13;
    }
    uint64_t v6 = [(CKConversationListCollectionViewController *)self _deleteSwipeActionForIndexPath:v4];
    if (v6) {
      [v5 addObject:v6];
    }
    if ([(CKConversationListCollectionViewController *)self filterMode] != 9)
    {
      id v7 = [(CKConversationListCollectionViewController *)self _dndSwipeActionForIndexPath:v4];
      if (v7) {
        [v5 addObject:v7];
      }
    }
  }

LABEL_13:
  if ([v5 count])
  {
    int v8 = [MEMORY[0x1E4F42E68] configurationWithActions:v5];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)_markUnreadSwipeActionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];
  int v8 = [v7 hasUnreadMessages];
  id location = 0;
  objc_initWeak(&location, self);
  id v9 = CKFrameworkBundle();
  if (v8) {
    [v9 localizedStringForKey:@"MARK_AS_READ" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else {
  uint64_t v10 = [v9 localizedStringForKey:@"MARK_AS_UNREAD" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  id v11 = (void *)MEMORY[0x1E4F42900];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = __81__CKConversationListCollectionViewController__markUnreadSwipeActionForIndexPath___block_invoke;
  long long v23 = &unk_1E5629E20;
  objc_copyWeak(&v27, &location);
  id v12 = v4;
  id v24 = v12;
  id v13 = v6;
  id v25 = v13;
  uint64_t v26 = self;
  char v28 = v8;
  uint64_t v14 = [v11 contextualActionWithStyle:0 title:v10 handler:&v20];
  if (v8) {
    objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"checkmark.message.fill", v20, v21, v22, v23, v24);
  }
  else {
  id v15 = objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"message.badge.fill", v20, v21, v22, v23, v24);
  }
  [v14 setImage:v15];

  BOOL v16 = +[CKUIBehavior sharedBehaviors];
  int v17 = [v16 theme];
  int v18 = [v17 unreadIndicatorColor];
  [v14 setBackgroundColor:v18];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v14;
}

void __81__CKConversationListCollectionViewController__markUnreadSwipeActionForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v6 = [WeakRetained collectionView];
  id v7 = [v6 cellForItemAtIndexPath:*(void *)(a1 + 32)];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    id v9 = [v8 conversationForItemIdentifier:*(void *)(a1 + 40)];

    id v10 = v7;
    [*(id *)(a1 + 48) _ensureCellLayoutOnCell:v10];
    [v10 forceUnreadIndicatorVisibility:*(unsigned char *)(a1 + 64) == 0 forConversation:v9 animated:1];
    if (*(unsigned char *)(a1 + 64)) {
      [v9 markAllMessagesAsRead];
    }
    else {
      [v9 markLastMessageAsUnread];
    }
    v11[2](v11, 1);
  }
  else
  {
    v11[2](v11, 0);
  }
}

- (id)_pinConversationSwipeActionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v6 = [v5 itemIdentifierForIndexPath:v4];

  id location = 0;
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4F42900];
  id v8 = CKFrameworkBundle();
  id v9 = [v8 localizedStringForKey:@"PIN" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __86__CKConversationListCollectionViewController__pinConversationSwipeActionForIndexPath___block_invoke;
  uint64_t v19 = &unk_1E5629E48;
  objc_copyWeak(&v22, &location);
  id v10 = v4;
  id v20 = v10;
  id v11 = v6;
  id v21 = v11;
  id v12 = [v7 contextualActionWithStyle:0 title:v9 handler:&v16];

  id v13 = objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"pin.fill", v16, v17, v18, v19);
  [v12 setImage:v13];

  uint64_t v14 = [MEMORY[0x1E4F428B8] systemYellowColor];
  [v12 setBackgroundColor:v14];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v12;
}

void __86__CKConversationListCollectionViewController__pinConversationSwipeActionForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v13 = a4;
  id v5 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = [WeakRetained collectionView];
  id v8 = [v7 cellForItemAtIndexPath:*(void *)(a1 + 32)];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = [v9 conversationForItemIdentifier:*(void *)(a1 + 40)];

    id v11 = objc_loadWeakRetained(v5);
    [v11 setPinningInteractionMethod:3];

    id v12 = objc_loadWeakRetained(v5);
    [v12 togglePinStateForConversation:v10 withReason:*MEMORY[0x1E4F6BB90]];

    v13[2](v13, 1);
  }
  else
  {
    v13[2](v13, 0);
  }
}

- (id)_deleteSwipeActionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];
  id v8 = v7;
  if (v7 && [v7 isUserDeletable])
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v9 = (void *)MEMORY[0x1E4F42900];
    id v10 = CKFrameworkBundle();
    id v11 = [v10 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__CKConversationListCollectionViewController__deleteSwipeActionForIndexPath___block_invoke;
    v15[3] = &unk_1E5629E70;
    id v16 = v4;
    uint64_t v17 = self;
    objc_copyWeak(&v19, &location);
    id v18 = v6;
    id v12 = [v9 contextualActionWithStyle:1 title:v11 handler:v15];

    id v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"trash.fill"];
    [v12 setImage:v13];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __77__CKConversationListCollectionViewController__deleteSwipeActionForIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "[Recently Deleted] Swipe-Deleting indexPath: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v12 = [*(id *)(a1 + 40) collectionView];
  id v13 = [v12 cellForItemAtIndexPath:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained deleteButtonTappedForItemIdentifier:*(void *)(a1 + 48) completionHandler:v9 cellToUpdate:v13];
}

- (id)_dndSwipeActionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v6];
  id v8 = [v7 chat];
  char v9 = [v8 isStewieChat];

  id v10 = 0;
  if ((v9 & 1) == 0 && v6 && v7)
  {
    int v11 = [v7 isMuted];
    id v12 = CKFrameworkBundle();
    id v13 = v12;
    if (v11) {
      uint64_t v14 = @"UNMUTE_ACTION";
    }
    else {
      uint64_t v14 = @"MUTE_ACTION";
    }
    int v15 = [v12 localizedStringForKey:v14 value:&stru_1EDE4CA38 table:@"ChatKit"];

    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v16 = (void *)MEMORY[0x1E4F42900];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __74__CKConversationListCollectionViewController__dndSwipeActionForIndexPath___block_invoke;
    long long v23 = &unk_1E5629E98;
    objc_copyWeak(&v25, &location);
    id v24 = v6;
    char v26 = v11;
    id v10 = [v16 contextualActionWithStyle:0 title:v15 handler:&v20];
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F428B8], "systemIndigoColor", v20, v21, v22, v23);
    [v10 setBackgroundColor:v17];

    if (v11) {
      [MEMORY[0x1E4F42A80] systemImageNamed:@"bell.fill"];
    }
    else {
    id v18 = [MEMORY[0x1E4F42A80] systemImageNamed:@"bell.slash.fill"];
    }
    [v10 setImage:v18];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __74__CKConversationListCollectionViewController__dndSwipeActionForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 40);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained muteConversationButtonTappedForConversationWithItemIdentifier:*(void *)(a1 + 32) setMuted:*(unsigned char *)(a1 + 48) == 0];

  v7[2](v7, 1);
}

- (void)reloadData
{
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0];

  [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:0];
}

- (void)updateConfigurationStateForSelectedCell
{
  id v5 = [(CKConversationListCollectionViewController *)self indexPathOfFirstSelectedItem];
  if (v5)
  {
    id v3 = [(CKConversationListCollectionViewController *)self collectionView];
    id v4 = [v3 cellForItemAtIndexPath:v5];

    if (v4)
    {
      [v4 _setNeedsConfigurationStateUpdate];
    }
  }
}

- (void)_updateConversationFilteredFlagsAndReportSpam
{
  id v2 = [(CKConversationListCollectionViewController *)self conversationList];
  [v2 updateConversationFilteredFlagsAndReportSpam];
}

- (void)updateConversationListForMessageSentToConversation:(id)a3
{
  id v26 = a3;
  [(CKConversationListCollectionViewController *)self updateConversationList];
  if ([(CKConversationListCollectionViewController *)self _shouldKeepSelection])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [WeakRetained currentConversation];

    if (v5) {
      BOOL v6 = v5 == v26;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      if ([v26 isPending])
      {
        id v8 = [(CKConversationListCollectionViewController *)self dataSource];
        char v9 = [v8 snapshot];
        id v10 = [v9 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16958];
        id v7 = [v10 firstObject];
      }
      else
      {
        if ([v26 isPinned]) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 5;
        }
        id v7 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v26 inSection:v11];
      }
    }
    else
    {
      id v7 = 0;
    }
    if ([v7 length])
    {
      id v12 = [(CKConversationListCollectionViewController *)self dataSource];
      id v13 = [v12 indexPathForItemIdentifier:v7];

      if (v13)
      {
        uint64_t v14 = [(CKConversationListCollectionViewController *)self dataSource];
        int v15 = [(CKConversationListCollectionViewController *)self collectionView];
        uint64_t v16 = [v14 numberOfSectionsInCollectionView:v15];
        if (v16 <= [v13 section])
        {
        }
        else
        {
          uint64_t v17 = [(CKConversationListCollectionViewController *)self dataSource];
          id v18 = [(CKConversationListCollectionViewController *)self collectionView];
          uint64_t v19 = objc_msgSend(v17, "collectionView:numberOfItemsInSection:", v18, objc_msgSend(v13, "section"));
          uint64_t v20 = [v13 row];

          if (v19 <= v20) {
            goto LABEL_23;
          }
          uint64_t v21 = [(CKConversationListCollectionViewController *)self collectionView];
          id v22 = [v21 indexPathsForVisibleItems];
          char v23 = [v22 containsObject:v13];

          if (v23) {
            goto LABEL_23;
          }
          uint64_t v24 = [v13 section];
          id v25 = [(CKConversationListCollectionViewController *)self collectionView];
          uint64_t v14 = v25;
          if (v24 == 2) {
            objc_msgSend(v25, "__ck_scrollToTop:", 1);
          }
          else {
            [v25 scrollToItemAtIndexPath:v13 atScrollPosition:1 animated:1];
          }
        }
      }
    }
    else
    {
      id v13 = 0;
    }
LABEL_23:
  }
}

- (void)userDeletedJunkConversationFromTranscript
{
  id v3 = [(CKConversationListCollectionViewController *)self updater];
  [v3 endHoldingUpdatesForReason:@"viewVisiblity" updateTriggeredIfNotHeldShouldBeDeferred:0];

  [(CKConversationListCollectionViewController *)self leaveJunkFilterIfNeeded];
}

- (void)updateConversationList
{
  id v2 = [(CKConversationListCollectionViewController *)self updater];
  [v2 setNeedsDeferredUpdateWithReason:@"externalChange"];
}

- (void)beginHoldingConversationListUpdatesForPPTTests
{
  id v2 = [(CKConversationListCollectionViewController *)self updater];
  [v2 beginHoldingUpdatesForReason:@"pptTest"];
}

- (void)endHoldingConversationListUpdatesForPPTTests
{
  id v2 = [(CKConversationListCollectionViewController *)self updater];
  [v2 endHoldingUpdatesForReason:@"pptTest" updateTriggeredIfNotHeldShouldBeDeferred:1];
}

- (void)_reloadVisibleConversationList:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v4 = [v24 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"uid"];

  BOOL v6 = [(CKConversationListCollectionViewController *)self collectionView];
  id v7 = [v6 indexPathsForVisibleItems];

  if ([v5 length])
  {
    uint64_t v8 = [(CKConversationListCollectionViewController *)self _indexPaths:v7 containingHandleWithUID:v5];

    id v7 = (void *)v8;
  }
  if ([v7 count])
  {
    char v9 = [(CKConversationListCollectionViewController *)self updater];
    char v10 = [v9 isHoldingUpdates];

    int v11 = IMOSLoggingEnabled();
    if (v10)
    {
      if (v11)
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [(CKConversationListCollectionViewController *)self updater];
          *(_DWORD *)buf = 138412290;
          long long v31 = v13;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "***NOT*** Updating visible portion of conversation list, _updater is: %@", buf, 0xCu);
        }
      }
      id v14 = [(CKConversationListCollectionViewController *)self updater];
      [v14 setNeedsDeferredUpdateWithReason:@"updateVisibleConversationsNotification"];
    }
    else
    {
      if (v11)
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = [(CKConversationListCollectionViewController *)self updater];
          *(_DWORD *)buf = 138412546;
          long long v31 = v16;
          __int16 v32 = 2112;
          long long v33 = v7;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Reloading visible portion of conversation list, _updater is: %@, indexPaths: %@", buf, 0x16u);
        }
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v17 = v7;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v26;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * v20);
            id v22 = [(CKConversationListCollectionViewController *)self dataSource];
            char v23 = [v22 itemIdentifierForIndexPath:v21];

            if (v23) {
              [v14 addObject:v23];
            }

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v18);
      }

      [(CKConversationListCollectionViewController *)self updateContentsOfCellsWithItemIdentifiers:v14 animated:0];
    }
  }
}

- (id)_indexPaths:(id)a3 containingHandleWithUID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __82__CKConversationListCollectionViewController__indexPaths_containingHandleWithUID___block_invoke;
  uint64_t v16 = &unk_1E5629EC0;
  id v17 = self;
  id v18 = v6;
  id v8 = v6;
  id v9 = a3;
  char v10 = [v7 predicateWithBlock:&v13];
  int v11 = objc_msgSend(v9, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16, v17);

  return v11;
}

uint64_t __82__CKConversationListCollectionViewController__indexPaths_containingHandleWithUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) conversationAtIndexPath:a2];
  uint64_t v4 = [v3 containsHandleWithUID:*(void *)(a1 + 40)];

  return v4;
}

- (void)updateNoMessagesDialog
{
  id v3 = [(CKConversationListCollectionViewController *)self dataSource];
  uint64_t v4 = [v3 snapshot];
  uint64_t v5 = [v4 numberOfItems];

  if (v5 >= 1)
  {
    id v6 = [(CKConversationListCollectionViewController *)self noMessagesDialogView];
    [v6 removeFromSuperview];

    [(CKConversationListCollectionViewController *)self setNoMessagesDialogView:0];
    id v7 = [(CKConversationListCollectionViewController *)self collectionView];
    [v7 setScrollEnabled:1];
  }
}

- (void)_didReceiveSummaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F6E790] messageSummarizationEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received new summary, updating conversation list.", buf, 2u);
      }
    }
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F6BA68]];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
          id v12 = [(CKConversationListCollectionViewController *)self conversationList];
          uint64_t v13 = [v12 conversationForExistingChatWithGUID:v11];

          uint64_t v14 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v13 inSection:5];
          [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v14 animated:1];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

- (void)updateConversationNamesForNicknames:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"handleIDs"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = +[CKConversationList sharedConversationList];
  uint64_t v8 = [v7 conversations];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __82__CKConversationListCollectionViewController_updateConversationNamesForNicknames___block_invoke;
  uint64_t v13 = &unk_1E5629EE8;
  BOOL v15 = v6 == 0;
  id v14 = v6;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:&v10];

  -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 0, v10, v11, v12, v13);
}

void __82__CKConversationListCollectionViewController_updateConversationNamesForNicknames___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    [v3 resetNameCaches];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = [v3 handles];
    id v6 = objc_msgSend(v5, "__imArrayByApplyingBlock:", &__block_literal_global_853_0);
    id v7 = [v4 setWithArray:v6];

    if ([*(id *)(a1 + 32) intersectsSet:v7]) {
      [v8 resetNameCaches];
    }
  }
}

uint64_t __82__CKConversationListCollectionViewController_updateConversationNamesForNicknames___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 ID];
}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__51;
  void v6[4] = __Block_byref_object_dispose__51;
  id v7 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_856;
  v4[3] = &unk_1E5629F10;
  void v4[4] = v6;
  id v3 = v7;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  _Block_object_dispose(v6, 8);
}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_856(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) tipType];
      int v6 = 134217984;
      uint64_t v7 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Conversation list needs to update for tip %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained tipManager];
  [v5 updateCloudTipRulesForDescriptor:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)pinningTipActionTapped
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CKConversationListCollectionViewController_pinningTipActionTapped__block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__CKConversationListCollectionViewController_pinningTipActionTapped__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1504) miniTipUIView];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 startSuggestedPinsAnimation];
  }
}

- (void)micCloudTipUpdated
{
}

- (void)trackSIMFilterUpdateEventFromOldSIMFilterIndex:(int64_t)a3 toSelectedSIMFilterIndex:(int64_t)a4
{
  int v6 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v7 = v6;
  uint64_t v8 = *MEMORY[0x1E4F6DAA0];
  if (a3 == a4) {
    id v9 = &unk_1EDF17B40;
  }
  else {
    id v9 = &unk_1EDF17B68;
  }
  [v6 trackEvent:*MEMORY[0x1E4F6DAA0] withDictionary:v9];

  if (a3 == -1 && a4 != -1)
  {
    uint64_t v13 = [MEMORY[0x1E4F6E890] sharedInstance];
    id v14 = &unk_1EDF17B90;
LABEL_20:
    id v15 = v13;
    [v13 trackEvent:v8 withDictionary:v14];

    return;
  }
  if (a3 != -1 && a4 == -1)
  {
    uint64_t v13 = [MEMORY[0x1E4F6E890] sharedInstance];
    id v14 = &unk_1EDF17BB8;
    goto LABEL_20;
  }
  if (a3 != a4 && a3 != -1 && a4 != -1)
  {
    uint64_t v13 = [MEMORY[0x1E4F6E890] sharedInstance];
    id v14 = &unk_1EDF17BE0;
    goto LABEL_20;
  }
}

- (void)updateSIMFilterIndexAndReloadData:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [(CKConversationListCollectionViewController *)self conversationList];
      int v10 = 134218240;
      uint64_t v11 = [v6 simFilterIndex];
      __int16 v12 = 2048;
      int64_t v13 = a3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Updating SIM Filter Index from %ld to : %ld", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = [(CKConversationListCollectionViewController *)self conversationList];
  -[CKConversationListCollectionViewController trackSIMFilterUpdateEventFromOldSIMFilterIndex:toSelectedSIMFilterIndex:](self, "trackSIMFilterUpdateEventFromOldSIMFilterIndex:toSelectedSIMFilterIndex:", [v7 simFilterIndex], a3);

  uint64_t v8 = [(CKConversationListCollectionViewController *)self conversationList];
  [v8 setSimFilterIndex:a3];

  id v9 = [(CKConversationListCollectionViewController *)self updater];
  [v9 setNeedsDeferredUpdateWithReason:@"simFilterChanged"];
}

- (void)_resetSimFilteringToDefaultState
{
  CKResetMessageSIMFilteringEnabledCache();
  uint64_t v3 = [(CKConversationListCollectionViewController *)self conversationList];
  [v3 setSimFilterIndex:-1];

  id v4 = [NSNumber numberWithInteger:-1];
  IMSetDomainValueForKey();
}

- (void)showMeCardViewController
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke;
  aBlock[3] = &unk_1E5629F60;
  void aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  id v4 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v4 userInterfaceIdiom])
  {
    id v5 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v6 = [v5 userInterfaceIdiom] == 1;
  }
  else
  {
    BOOL v6 = 1;
  }

  uint64_t v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isNameAndPhotoC3Enabled];

  if (v8) {
    BOOL v9 = !v6;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int v10 = [(CKConversationListCollectionViewController *)self nicknameController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_2;
    v12[3] = &unk_1E5627F88;
    id v13 = v3;
    [v10 fetchPersonalNicknameWithCompletion:v12];

    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v11 = [(CKConversationListCollectionViewController *)self onboardingController];
    [v11 presentNicknameOnboardingOrEditFlow];
  }
}

void __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    [v2 showMeCardViewControllerWithNickname:a2];
  }
  else
  {
    id v3 = [v2 onboardingController];
    [v3 presentNicknameSharingSetupFlowWithMemoji:1 forUserInitiatedEdit:1];
  }
}

void __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_3;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_avatarProviderFromNickname:(id)a3
{
  id v3 = a3;
  id v4 = [CKMeCardSharingNicknameAvatarProvider alloc];
  id v5 = [v3 avatar];

  BOOL v6 = [v5 imageData];
  id v7 = [(CKMeCardSharingNicknameAvatarProvider *)v4 initWithImageData:v6];

  return v7;
}

- (void)showMeCardViewControllerWithNickname:(id)a3
{
  id v4 = a3;
  id v16 = [(CKConversationListCollectionViewController *)self _meContact];
  id v5 = +[CKMeCardSharingNameProvider nameProviderForNickname:v4];
  BOOL v6 = [(CKConversationListCollectionViewController *)self _contactStore];
  BOOL v7 = [(CKConversationListCollectionViewController *)self _meCardSharingEnabled];
  unint64_t v8 = [(CKConversationListCollectionViewController *)self _meCardSharingAudience];
  BOOL v9 = [(CKConversationListCollectionViewController *)self _avatarProviderFromNickname:v4];

  LOBYTE(v15) = 1;
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1BBE0]) initWithContactStore:v6 contact:v16 avatarProvider:v9 nameProvider:v5 sharingEnabled:v7 selectedSharingAudience:v8 showsWallpaperSuggestionsGalleryPicker:v15 headerMode:1];
  [v10 setDelegate:self];
  uint64_t v11 = [[CKMeCardNavigationController alloc] initWithRootViewController:v10];
  __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__dismissPresentedNavController_];
  id v13 = [v10 navigationItem];
  [v13 setRightBarButtonItem:v12];

  uint64_t v14 = [(CKConversationListCollectionViewController *)self navigationController];
  [v14 presentViewController:v11 animated:1 completion:0];
}

- (id)nicknameController
{
  return (id)[MEMORY[0x1E4F6BD50] sharedInstance];
}

- (id)_contactStore
{
  id v2 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  id v3 = [v2 getContactStore];

  return v3;
}

- (id)_meContact
{
  id v2 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  id v3 = [MEMORY[0x1E4F6E6D8] keysForNicknameHandling];
  id v4 = [v2 fetchMeContactWithKeys:v3];

  return v4;
}

- (id)_meCardSharingNameProviderWithContact:(id)a3
{
  id v3 = +[CKMeCardSharingNameProvider nameProviderForContact:a3];
  if (!v3)
  {
    id v3 = +[CKMeCardSharingNameProvider nameProviderForPrimaryAccount];
  }

  return v3;
}

- (id)_meCardSharingState
{
  return (id)[MEMORY[0x1E4F6E820] sharedInstance];
}

- (BOOL)_meCardSharingEnabled
{
  id v2 = [(CKConversationListCollectionViewController *)self _meCardSharingState];
  char v3 = [v2 sharingEnabled];

  return v3;
}

- (unint64_t)_meCardSharingAudience
{
  id v2 = [(CKConversationListCollectionViewController *)self _meCardSharingState];
  unint64_t v3 = [v2 sharingAudience];

  return v3;
}

- (BOOL)_imageForkedFromMeCard
{
  id v2 = [(CKConversationListCollectionViewController *)self _meCardSharingState];
  char v3 = [v2 imageForkedFromMeCard];

  return v3;
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(CKConversationListCollectionViewController *)self _meCardSharingState];
  [v5 setSharingEnabled:v4];
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  id v5 = [(CKConversationListCollectionViewController *)self _meCardSharingState];
  [v5 setSharingAudience:a4];
}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  BOOL v4 = (void *)MEMORY[0x1E4F6BD50];
  id v5 = a4;
  id v6 = [v4 sharedInstance];
  [v6 updatePersonalNicknameIfNecessaryWithMeCardSharingResult:v5];
}

- (CKOnboardingController)onboardingController
{
  onboardingController = self->_onboardingController;
  if (!onboardingController)
  {
    BOOL v4 = objc_alloc_init(CKOnboardingController);
    id v5 = self->_onboardingController;
    self->_onboardingController = v4;

    [(CKOnboardingController *)self->_onboardingController setDelegate:self];
    onboardingController = self->_onboardingController;
  }

  return onboardingController;
}

- (id)presentingViewControllerForOnboardingController:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewController *)self onboardingController];

  if (v5 == v4)
  {
    BOOL v7 = self;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Unexpected instance of onboardingController %@", (uint8_t *)&v9, 0xCu);
      }
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)onboardingControllerDidFinish:(id)a3
{
}

- (void)_downtimeStateChanged:(id)a3
{
}

- (void)_chatAllowedByScreenTimeChanged:(id)a3
{
  id v11 = a3;
  int v4 = [MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled];
  id v5 = v11;
  if (v4)
  {
    id v6 = [v11 object];
    BOOL v7 = [(CKConversationListCollectionViewController *)self conversationList];
    unint64_t v8 = [v7 conversationForExistingChat:v6];

    if (v8)
    {
      [v8 resetNameCaches];
      if ([v8 isPinned]) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 5;
      }
      id v10 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v8 inSection:v9];
      [(CKConversationListCollectionViewController *)self updateContentsOfCellWithItemIdentifier:v10 animated:0];
    }
    id v5 = v11;
  }
}

- (void)configureWithToolbarController:(id)a3
{
  id v10 = a3;
  id v4 = [(CKConversationListCollectionViewController *)self macToolbarController];

  if (v4 != v10) {
    [(CKConversationListCollectionViewController *)self setMacToolbarController:v10];
  }
  id v5 = [(CKConversationListCollectionViewController *)self view];
  uint64_t v6 = [v5 window];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    int v8 = [(CKConversationListCollectionViewController *)self conformsToProtocol:&unk_1EDF48CA0];

    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CKConversationListCollectionViewController *)self macToolbarController];
    [v9 setPrimaryItemProvider:self];

    id v5 = [(CKConversationListCollectionViewController *)self macToolbarController];
    [v5 setShouldDrawPrimaryBlur:0];
  }

LABEL_7:
}

- (void)providerWillBeRemovedFromToolbarController:(id)a3
{
}

- (BOOL)itemProviderDisablesTouches
{
  return 0;
}

- (double)virtualToolbarPreferredHeight
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  [v2 macAppKitToolbarHeight];
  double v4 = v3;

  return v4;
}

- (void)setIsBelowMacSnapToMinWidth:(BOOL)a3
{
  if (self->_isBelowMacSnapToMinWidth != a3) {
    self->_isBelowMacSnapToMindouble Width = a3;
  }
}

- (CKMacToolbarItem)composeToolbarItem
{
  composeToolbarItem = self->_composeToolbarItem;
  if (!composeToolbarItem)
  {
    [(CKConversationListCollectionViewController *)self composeButtonItem];

    composeToolbarItem = self->_composeToolbarItem;
  }

  return composeToolbarItem;
}

- (id)toolbarItemForIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CKConversationListCollectionViewController *)self isBelowMacSnapToMinWidth]
    || ![v4 isEqualToString:@"CKMacToolbarNewComposeItemIdentifier"])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(CKConversationListCollectionViewController *)self composeToolbarItem];
  }

  return v5;
}

id __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 conversationList];
  id v5 = [v4 conversationForExistingChatWithGUID:v3];

  return v5;
}

- (void)siriTipUpdated
{
}

- (void)ktFailureTipUpdated
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = NSNumber;
      id v5 = [(CKConversationListCollectionViewController *)self tipManager];
      uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "presentedTip"));
      int v7 = 138412290;
      int v8 = v6;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Update KT Failure tip to present: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
}

- (id)_userDefaults
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

- (void)_submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKConversationListCollectionViewController *)self isShowingPinningOnboarding])
  {
    id v10 = [(CKConversationListCollectionViewController *)self recommendedPinningConversations];
    id v5 = -[CKConversationListCollectionViewController _pinningSuggestionsForConversations:](self, "_pinningSuggestionsForConversations:");
    if (v3)
    {
      uint64_t v6 = [(CKConversationListCollectionViewController *)self frozenPinnedConversations];
      int v7 = [(CKConversationListCollectionViewController *)self _pinningSuggestionsForConversations:v6];
      int v8 = [MEMORY[0x1E4F89C80] acceptedWithActualPinnings:v7 OnboardingSuggestions:v5];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F89C80] skipOnboardingWithOnboardingSuggestions:v5];
    }
    uint64_t v9 = [(CKConversationListCollectionViewController *)self pinnedConversationSuggester];
    [v9 provideMessagesPinningFeedback:v8];
  }
}

- (void)_submitFeedbackIfNecessaryForPinsChangedWithPreviousPinnedConversationIdentifiers:(id)a3
{
  id v14 = a3;
  id v4 = [(CKConversationListCollectionViewController *)self conversationList];
  int v5 = [v4 loadedPinnedConversations];

  uint64_t v6 = v14;
  if (v5)
  {
    int v7 = [(CKConversationListCollectionViewController *)self conversationList];
    int v8 = [v7 pinnedConversations];

    uint64_t v9 = [(CKConversationListCollectionViewController *)self _pinningSuggestionsForConversations:v8];
    id v10 = [MEMORY[0x1E4F89C80] pinsChangedWithNowCurrentPins:v9];
    int64_t v11 = [(CKConversationListCollectionViewController *)self _feedbackPinningInteractionMethod];
    [v10 setInteractionMethod:v11];
    if (!v11)
    {
      uint64_t v12 = [v14 count];
      if (v12 == [v8 count]) {
        [v10 setActionType:3];
      }
    }
    id v13 = [(CKConversationListCollectionViewController *)self pinnedConversationSuggester];
    [v13 provideMessagesPinningFeedback:v10];

    [(CKConversationListCollectionViewController *)self setPinningInteractionMethod:0];
    uint64_t v6 = v14;
  }
}

- (id)_pinningSuggestionsForConversations:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "chat", (void)v15);
        int64_t v11 = [v10 guid];

        if ([v11 length])
        {
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F89C90]) initWithChatGuid:v11];
          if (v12) {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[v4 copy];

  return v13;
}

- (int64_t)_feedbackPinningInteractionMethod
{
  int64_t v2 = [(CKConversationListCollectionViewController *)self pinningInteractionMethod];
  if ((unint64_t)(v2 - 1) >= 4) {
    return 4;
  }
  else {
    return v2 - 1;
  }
}

- (BOOL)_wantsThreeColumnLayout
{
  int64_t v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 wantsUniversalThreeColumn];

  return v3;
}

- (void)_updateSelectAllButtonItemTitle
{
  char v3 = [(CKConversationListCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [v4 count];

  int64_t v6 = [(CKConversationListCollectionViewController *)self numberOfConversations];
  uint64_t v7 = CKFrameworkBundle();
  id v10 = v7;
  if (v5 == v6) {
    uint64_t v8 = @"DESELECT_ALL_BUTTON";
  }
  else {
    uint64_t v8 = @"SELECT_ALL_BUTTON";
  }
  uint64_t v9 = [v7 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(UIBarButtonItem *)self->_selectAllButtonItem setTitle:v9];
}

- (void)_performMultiSelectCleanUp
{
  if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
  {
    [(CKConversationListCollectionViewController *)self _performRecentlyDeletedMultiSelectCleanUp];
  }
  else
  {
    char v3 = [(CKConversationListCollectionViewController *)self delegate];
    char v4 = [v3 isCollapsed];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = [(CKConversationListCollectionViewController *)self collectionView];
      int64_t v6 = [v5 indexPathsForSelectedItems];
      uint64_t v7 = [v6 count];

      if (v7 == 1)
      {
        uint64_t v8 = [(CKConversationListCollectionViewController *)self dataSource];
        uint64_t v9 = [(CKConversationListCollectionViewController *)self collectionView];
        id v10 = [v9 indexPathsForSelectedItems];
        int64_t v11 = [v10 firstObject];
        uint64_t v12 = [v8 itemIdentifierForIndexPath:v11];
        [(CKConversationListCollectionViewController *)self setLastSelectedConversationItemIdentifier:v12];
      }
      id v13 = [(CKConversationListCollectionViewController *)self dataSource];
      id v14 = [(CKConversationListCollectionViewController *)self lastSelectedConversationItemIdentifier];
      long long v15 = [v13 indexPathForItemIdentifier:v14];

      [(CKConversationListCollectionViewController *)self _selectConversationAtIndexPath:v15 animated:CKIsRunningInMacCatalyst() == 0];
    }
    if ([(CKConversationListCollectionViewController *)self filterMode] != 7)
    {
      [(CKConversationListCollectionViewController *)self setEditingMode:0];
    }
  }
}

- (unint64_t)_numberOfSelectedConversations
{
  int64_t v2 = [(CKConversationListCollectionViewController *)self collectionView];
  char v3 = [v2 indexPathsForSelectedItems];

  unint64_t v4 = [v3 count];
  return v4;
}

- (id)toolbarItems
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (([(CKConversationListCollectionViewController *)self isEditing] & 1) != 0
    || [(CKConversationListCollectionViewController *)self filterMode] == 9)
  {
    unint64_t v3 = [(CKConversationListCollectionViewController *)self _numberOfSelectedConversations];
    unint64_t v4 = [(CKConversationListCollectionViewController *)self dataSource];
    uint64_t v5 = [v4 snapshot];
    uint64_t v6 = [v5 numberOfItems];

    if ([(CKConversationListCollectionViewController *)self filterMode] == 7)
    {
      uint64_t v7 = [(CKConversationListCollectionViewController *)self toolbarItemsForRecentlyDeletedFilterHasConversations:v6 > 0 hasSelectedConversations:v3 != 0];
LABEL_7:
      uint64_t v8 = (void *)v7;
      goto LABEL_12;
    }
    if ([(CKConversationListCollectionViewController *)self filterMode] == 9)
    {
      uint64_t v7 = [(CKConversationListCollectionViewController *)self toolbarItemsForJunkFilterHasConversations:v6 > 0 hasSelectedConversations:v3 != 0];
      goto LABEL_7;
    }
    uint64_t v9 = [(CKConversationListCollectionViewController *)self toggleReadButtonItem];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
    if (v3) {
      unint64_t v3 = [(CKConversationListCollectionViewController *)self _hasStewieConversationSelected] ^ 1;
    }
    int64_t v11 = [(CKConversationListCollectionViewController *)self moveSelectedToRecentlyDeletedButtonItem];
    [v11 setEnabled:v3];
    v13[0] = v9;
    v13[1] = v10;
    void v13[2] = v11;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_12:

  return v8;
}

- (BOOL)_hasStewieConversationSelected
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F6BC48] sharedInstance];
  int v4 = [v3 isStewieActive];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(CKConversationListCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 indexPathsForSelectedItems];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [(CKConversationListCollectionViewController *)self dataSource];
        id v14 = [v13 itemIdentifierForIndexPath:v12];

        long long v15 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v14];
        char v16 = [v15 isStewieConversation];

        if (v16)
        {
          BOOL v17 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)toggleReadButtonItem
{
  unint64_t v3 = CKFrameworkBundle();
  int v4 = [v3 localizedStringForKey:@"READ_ALL" value:&stru_1EDE4CA38 table:@"ChatKit"];

  if ([(CKConversationListCollectionViewController *)self _numberOfSelectedConversations])
  {
    BOOL v5 = [(CKConversationListCollectionViewController *)self _hasUnreadConversation];
    uint64_t v6 = CKFrameworkBundle();
    id v7 = v6;
    if (v5) {
      uint64_t v8 = @"MARK_AS_READ_BUTTON";
    }
    else {
      uint64_t v8 = @"MARK_AS_UNREAD_BUTTON";
    }
    uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v4 = (void *)v9;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:v4 style:0 target:self action:sel_toggleReadButtonTapped_];
  [v10 setEnabled:1];
  [v10 accessibilitySetIdentification:@"toggleReadButton"];

  return v10;
}

- (BOOL)_hasUnreadConversation
{
  int64_t v2 = self;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  unint64_t v3 = [(CKConversationListCollectionViewController *)self collectionView];
  int v4 = [v3 indexPathsForSelectedItems];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CKConversationListCollectionViewController__hasUnreadConversation__block_invoke;
  v6[3] = &unk_1E5629FB0;
  void v6[4] = v2;
  void v6[5] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];
  LOBYTE(v2) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __68__CKConversationListCollectionViewController__hasUnreadConversation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [*(id *)(a1 + 32) conversationAtIndexPath:a2];
  if ([v6 hasUnreadMessages])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setDeferredSearchQuery:(id)a3
{
}

- (BOOL)hidePinsForAnimation
{
  return self->_hidePinsForAnimation;
}

- (void)setHidePinsForAnimation:(BOOL)a3
{
  self->_hidePinsForAnimation = a3;
}

- (CKPinnedConversationCollectionViewCell)prototypePinnedConversationCollectionViewCell
{
  return self->_prototypePinnedConversationCollectionViewCell;
}

- (void)setPrototypePinnedConversationCollectionViewCell:(id)a3
{
}

- (NSDate)lastUserSelectedConversationTime
{
  return self->_lastUserSelectedConversationTime;
}

- (void)setLastUserSelectedConversationTime:(id)a3
{
}

- (NSString)lastUserSelectedConversationItemIdentifier
{
  return self->_lastUserSelectedConversationItemIdentifier;
}

- (void)setLastUserSelectedConversationItemIdentifier:(id)a3
{
}

- (UIView)noMessagesDialogView
{
  return self->_noMessagesDialogView;
}

- (void)setNoMessagesDialogView:(id)a3
{
}

- (void)setSearchController:(id)a3
{
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
}

- (BOOL)holdPinningUpdatesForConversationDeletion
{
  return self->_holdPinningUpdatesForConversationDeletion;
}

- (void)setHoldPinningUpdatesForConversationDeletion:(BOOL)a3
{
  self->_holdPinningUpdatesForConversationDeletion = a3;
}

- (BOOL)keyboardIsShowing
{
  return self->_keyboardIsShowing;
}

- (void)setKeyboardIsShowing:(BOOL)a3
{
  self->_keyboardIsShowing = a3;
}

- (void)setSearchResultsController:(id)a3
{
}

- (void)setMacVirtualComposeButton:(id)a3
{
}

- (void)setComposeButtonItem:(id)a3
{
}

- (void)setEditButtonItem:(id)a3
{
}

- (void)setEditOscarButtonItem:(id)a3
{
}

- (void)setOptionsButtonItem:(id)a3
{
}

- (void)setCancelButtonItem:(id)a3
{
}

- (void)setDoneButtonItem:(id)a3
{
}

- (void)setSelectAllButtonItem:(id)a3
{
}

- (void)setMoveSelectedToRecentlyDeletedButtonItem:(id)a3
{
}

- (void)setCloseButtonItem:(id)a3
{
}

- (void)setCatalystFiltersNavigationBackButton:(id)a3
{
}

- (UIBarButtonItem)permanentDeleteSelectedButtonItem
{
  return self->_permanentDeleteSelectedButtonItem;
}

- (void)setPermanentDeleteSelectedButtonItem:(id)a3
{
}

- (UIBarButtonItem)permanentDeleteAllButtonItem
{
  return self->_permanentDeleteAllButtonItem;
}

- (void)setPermanentDeleteAllButtonItem:(id)a3
{
}

- (UIBarButtonItem)recoverSelectedButtonItem
{
  return self->_recoverSelectedButtonItem;
}

- (void)setRecoverSelectedButtonItem:(id)a3
{
}

- (UIBarButtonItem)recoverAllButtonItem
{
  return self->_recoverAllButtonItem;
}

- (void)setRecoverAllButtonItem:(id)a3
{
}

- (UIBarButtonItem)permanentDeleteSelectedJunkButtonItem
{
  return self->_permanentDeleteSelectedJunkButtonItem;
}

- (void)setPermanentDeleteSelectedJunkButtonItem:(id)a3
{
}

- (UIBarButtonItem)permanentDeleteAllJunkButtonItem
{
  return self->_permanentDeleteAllJunkButtonItem;
}

- (void)setPermanentDeleteAllJunkButtonItem:(id)a3
{
}

- (void)setSyncStatusView:(id)a3
{
}

- (BOOL)isInitialAppearance
{
  return self->_isInitialAppearance;
}

- (void)setIsInitialAppearance:(BOOL)a3
{
  self->_isInitialAppearance = a3;
}

- (BOOL)willRotate
{
  return self->_willRotate;
}

- (void)setWillRotate:(BOOL)a3
{
  self->_willRotate = a3;
}

- (CKConversation)conversationToUnpinPendingOrbDismissal
{
  return self->_conversationToUnpinPendingOrbDismissal;
}

- (void)setConversationToUnpinPendingOrbDismissal:(id)a3
{
}

- (CKConversation)conversationToPinPendingOrbDismissal
{
  return self->_conversationToPinPendingOrbDismissal;
}

- (void)setConversationToPinPendingOrbDismissal:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void)setOnboardingController:(id)a3
{
}

- (void)setPinnedConversationSuggester:(id)a3
{
}

- (BOOL)macShouldShowZKWSearch
{
  return self->_macShouldShowZKWSearch;
}

- (void)setMacShouldShowZKWSearch:(BOOL)a3
{
  self->_macShouldShowZKWSearch = a3;
}

- (void)setMacToolbarController:(id)a3
{
}

- (void)setComposeToolbarItem:(id)a3
{
}

- (void)setTipKitQueue:(id)a3
{
}

- (void)setStandardCellLayout:(id)a3
{
}

- (void)setJunkCellLayout:(id)a3
{
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (UIRefreshControl)collectionViewRefreshControl
{
  return self->_collectionViewRefreshControl;
}

- (void)setCollectionViewRefreshControl:(id)a3
{
}

- (NSTimer)refreshControlTimer
{
  return self->_refreshControlTimer;
}

- (void)setRefreshControlTimer:(id)a3
{
}

- (void)setOscarModal:(BOOL)a3
{
  self->_oscarModal = a3;
}

- (void)setRecentlyDeletedModal:(BOOL)a3
{
  self->_recentlyDeletedModal = a3;
}

- (BOOL)holdPinningUpdatesForOnboardingAnimation
{
  return self->_holdPinningUpdatesForOnboardingAnimation;
}

- (void)setHoldPinningUpdatesForOnboardingAnimation:(BOOL)a3
{
  self->_holdPinningUpdatesForOnboardingAnimation = a3;
}

- (BOOL)nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate
{
  return self->_nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate;
}

- (void)setIsShowingPinnedChatDropTarget:(BOOL)a3
{
  self->_isShowingPinnedChatDropTarget = a3;
}

- (void)setPresentedBanner:(id)a3
{
}

- (void)setBannerTopConstraint:(id)a3
{
}

- (void)setBannerHeight:(double)a3
{
  self->_bannerHeight = a3;
}

- (void)setIsShowingSwipeDeleteConfirmation:(BOOL)a3
{
  self->_isShowingSwipeDeleteConfirmation = a3;
}

- (int64_t)pinningInteractionMethod
{
  return self->_pinningInteractionMethod;
}

- (void)setPinningInteractionMethod:(int64_t)a3
{
  self->_pinningInteractionMethod = a3;
}

- (int64_t)pinnedConversationViewLayoutStyle
{
  return self->_pinnedConversationViewLayoutStyle;
}

- (void)setIsCommitingDiffableDataSourceTransaction:(BOOL)a3
{
  self->_isCommitingDiffableDataSourceTransaction = a3;
}

- (void)setBlockedSnapshotInfo:(id)a3
{
}

- (NSMutableSet)itemIdentifiersForVisibleContextMenuInteractions
{
  return self->_itemIdentifiersForVisibleContextMenuInteractions;
}

- (void)setItemIdentifiersForVisibleContextMenuInteractions:(id)a3
{
}

- (BOOL)isCheckingIfPinningOnboardingNeeded
{
  return self->_isCheckingIfPinningOnboardingNeeded;
}

- (void)setIsCheckingIfPinningOnboardingNeeded:(BOOL)a3
{
  self->_isCheckingIfPinningOnboardingNeeded = a3;
}

- (BOOL)canShowSuggestedPinningOnboardingCell
{
  return self->_canShowSuggestedPinningOnboardingCell;
}

- (void)setCanShowSuggestedPinningOnboardingCell:(BOOL)a3
{
  self->_canShowSuggestedPinningOnboardingCell = a3;
}

- (BOOL)isCurrentlyAnimatingPinningOnboardingSuggestions
{
  return self->_isCurrentlyAnimatingPinningOnboardingSuggestions;
}

- (void)setIsCurrentlyAnimatingPinningOnboardingSuggestions:(BOOL)a3
{
  self->_isCurrentlyAnimatingPinningOnboardingSuggestions = a3;
}

- (NSArray)recommendedPinningConversations
{
  return self->_recommendedPinningConversations;
}

- (void)setRecommendedPinningConversations:(id)a3
{
}

- (CKConversationListTipManager)tipManager
{
  return self->_tipManager;
}

- (void)setTipManager:(id)a3
{
}

- (NSCache)cacheForLastDisplayedActivitySnapshotByConversation
{
  return self->_cacheForLastDisplayedActivitySnapshotByConversation;
}

- (void)setCacheForLastDisplayedActivitySnapshotByConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheForLastDisplayedActivitySnapshotByConversation, 0);
  objc_storeStrong((id *)&self->_tipManager, 0);
  objc_storeStrong((id *)&self->_recommendedPinningConversations, 0);
  objc_storeStrong((id *)&self->_itemIdentifiersForVisibleContextMenuInteractions, 0);
  objc_storeStrong((id *)&self->_blockedSnapshotInfo, 0);
  objc_storeStrong((id *)&self->_frozenConversations, 0);
  objc_storeStrong((id *)&self->_frozenPinnedConversations, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_bannerTopConstraint, 0);
  objc_storeStrong((id *)&self->_presentedBanner, 0);
  objc_storeStrong((id *)&self->_refreshControlTimer, 0);
  objc_storeStrong((id *)&self->_collectionViewRefreshControl, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_junkCellLayout, 0);
  objc_storeStrong((id *)&self->_standardCellLayout, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
  objc_storeStrong((id *)&self->_tipKitQueue, 0);
  objc_storeStrong((id *)&self->_composeToolbarItem, 0);
  objc_destroyWeak((id *)&self->_macToolbarController);
  objc_storeStrong((id *)&self->_pinnedConversationSuggester, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_conversationToPinPendingOrbDismissal, 0);
  objc_storeStrong((id *)&self->_conversationToUnpinPendingOrbDismissal, 0);
  objc_storeStrong((id *)&self->_syncStatusView, 0);
  objc_storeStrong((id *)&self->_permanentDeleteAllJunkButtonItem, 0);
  objc_storeStrong((id *)&self->_permanentDeleteSelectedJunkButtonItem, 0);
  objc_storeStrong((id *)&self->_recoverAllButtonItem, 0);
  objc_storeStrong((id *)&self->_recoverSelectedButtonItem, 0);
  objc_storeStrong((id *)&self->_permanentDeleteAllButtonItem, 0);
  objc_storeStrong((id *)&self->_permanentDeleteSelectedButtonItem, 0);
  objc_storeStrong((id *)&self->_catalystFiltersNavigationBackButton, 0);
  objc_storeStrong((id *)&self->_closeButtonItem, 0);
  objc_storeStrong((id *)&self->_moveSelectedToRecentlyDeletedButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_optionsButtonItem, 0);
  objc_storeStrong((id *)&self->_editOscarButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_composeButtonItem, 0);
  objc_storeStrong((id *)&self->_macVirtualComposeButton, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_noMessagesDialogView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_lastUserSelectedConversationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUserSelectedConversationTime, 0);
  objc_storeStrong((id *)&self->_lastSelectedConversationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationLayout, 0);
  objc_storeStrong((id *)&self->_prototypePinnedConversationCollectionViewCell, 0);
  objc_storeStrong((id *)&self->_deferredSearchQuery, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CKConversationListCollectionViewController *)self editingMode] == 1)
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Not creating items for a new drag session as the collection view is frozen for bulk editing", (uint8_t *)&v15, 2u);
      }
LABEL_12:
    }
  }
  else
  {
    if (-[CKConversationListCollectionViewController sectionHasActionableConversations:](self, "sectionHasActionableConversations:", [v10 section]))
    {
      uint64_t v12 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v10];
      if (v12)
      {
        [v9 setLocalContext:@"CKConversationListDragContext"];
        id v13 = [(CKConversationListCollectionViewController *)self _dragItemsForConversation:v12 indexPath:v10 inCollectionView:v8];
      }
      else
      {
        id v13 = (void *)MEMORY[0x1E4F1CBF0];
      }

      goto LABEL_16;
    }
    if (IMOSLoggingEnabled())
    {
      int64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v15 = 134217984;
        uint64_t v16 = [v10 section];
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Not creating items for a new drag session for a drag from a non-actionable section: %ld", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_12;
    }
  }
  id v13 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_16:

  return v13;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v10 hasItemsConformingToTypeIdentifiers:&unk_1EDF15938])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Not creating additional drag items for a non-conversation pinning drag session", (uint8_t *)&v19, 2u);
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v13 = [v12 conversationPinningMultiDragEnabled];

  if ((v13 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "User attempted to add drag items to an existing pinning drag session. This is not permitted.", (uint8_t *)&v19, 2u);
      }
      goto LABEL_17;
    }
LABEL_18:
    int v15 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  if (!-[CKConversationListCollectionViewController sectionHasActionableConversations:](self, "sectionHasActionableConversations:", [v11 section]))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v19 = 134217984;
        uint64_t v20 = [v11 section];
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Not creating items to addd to a drag session for a drag from a non-actionable section: %ld", (uint8_t *)&v19, 0xCu);
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  id v14 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v11];
  if (v14)
  {
    int v15 = [(CKConversationListCollectionViewController *)self _dragItemsForConversation:v14 indexPath:v11 inCollectionView:v9];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Could not find conversation to add drag items to drag session", (uint8_t *)&v19, 2u);
      }
    }
    int v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_19:

  return v15;
}

- (id)_dragItemsForConversation:(id)a3 indexPath:(id)a4 inCollectionView:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v11 registerObject:v8 visibility:3];
  uint64_t v12 = [v8 activityForNewSceneCreatedViaDrag:1];
  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      char v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v12 userInfo];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v27 = 2112;
        long long v28 = v14;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Creating conversation list drag item with user activity: %@, userInfo: %@", buf, 0x16u);
      }
    }
    [v11 registerObject:v12 visibility:1];
  }
  int v15 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v11];
  [v15 setLocalObject:v8];
  if ([(CKConversationListCollectionViewController *)self _shouldUsePreviewProviderForDragItemAtIndexPath:v9])
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __112__CKConversationListCollectionViewController_DragAndDrop___dragItemsForConversation_indexPath_inCollectionView___block_invoke;
    uint64_t v21 = &unk_1E562AC40;
    objc_copyWeak(&v24, (id *)buf);
    id v22 = v8;
    id v23 = v10;
    [v15 setPreviewProvider:&v18];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  long long v25 = v15;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v25, 1, v18, v19, v20, v21);

  return v16;
}

id __112__CKConversationListCollectionViewController_DragAndDrop___dragItemsForConversation_indexPath_inCollectionView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v3 = [WeakRetained dragPreviewViewForPinnedConversation:*(void *)(a1 + 32) inCollectionView:*(void *)(a1 + 40)];

  id v4 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  BOOL v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v5];

  id v6 = [MEMORY[0x1E4F427D0] bezierPath];
  [v4 setShadowPath:v6];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F429A8]) initWithView:v3 parameters:v4];

  return v7;
}

- (BOOL)_shouldUsePreviewProviderForDragItemAtIndexPath:(id)a3
{
  id v3 = a3;
  if (CKIsRunningInMacCatalyst()) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [v3 section] != 2;
  }

  return v4;
}

- (id)dragPreviewViewForPinnedConversation:(id)a3 inCollectionView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKConversationListCollectionViewController *)self _snapshotOfAvatarViewForConversation:v7];
  [v6 bounds];
  double v10 = v9;
  double v12 = v11;

  char v13 = [(CKConversationListCollectionViewController *)self conversationLayout];
  id v14 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v13, "widthForPinnedConversationCellInCollectionViewOfSize:numberOfItems:", objc_msgSend(v14, "maximumNumberOfPinnedConversations"), v10, v12);
  double v16 = v15;

  uint64_t v17 = -[CKPinnedConversationView initWithFrame:]([CKPinnedConversationView alloc], "initWithFrame:", 0.0, 0.0, v16, v16);
  [(CKPinnedConversationView *)v17 setShowsLiveActivity:0];
  [(CKPinnedConversationView *)v17 setConversation:v7];

  [(CKPinnedConversationView *)v17 setAvatarSnapshot:v8];
  uint64_t v18 = [MEMORY[0x1E4F428B8] clearColor];
  [(CKPinnedConversationView *)v17 setBackgroundColor:v18];

  [(CKPinnedConversationView *)v17 setLayoutStyle:[(CKConversationListCollectionViewController *)self pinnedConversationViewLayoutStyle]];
  [(CKPinnedConversationView *)v17 sizeToFit];

  return v17;
}

- (id)_snapshotOfAvatarViewForConversation:(id)a3
{
  id v4 = a3;
  if ([v4 isPinned]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 5;
  }
  id v6 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v4 inSection:v5];

  id v7 = [(CKConversationListCollectionViewController *)self dataSource];
  id v8 = [v7 indexPathForItemIdentifier:v6];

  if (!v8) {
    goto LABEL_12;
  }
  double v9 = [(CKConversationListCollectionViewController *)self collectionView];
  double v10 = [v9 cellForItemAtIndexPath:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v11 = [v10 pinnedConversationView];
    double v12 = [v11 avatarView];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v12 = [v10 avatarView];
LABEL_9:

    if (v12)
    {
      uint64_t v13 = [v12 contentImage];
      if (v13)
      {
        id v14 = (void *)v13;
      }
      else
      {
        [v12 bounds];
        v19.double width = v15;
        v19.double height = v16;
        UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
        [v12 bounds];
        objc_msgSend(v12, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
        id v14 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
      }
      double v10 = v12;
      goto LABEL_16;
    }
LABEL_12:
    id v14 = 0;
    goto LABEL_17;
  }
  id v14 = 0;
LABEL_16:

LABEL_17:

  return v14;
}

- (id)dragOrDropPreviewParametersForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  if ([a3 section] == 2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F429B0]);
    uint64_t v5 = [MEMORY[0x1E4F428B8] clearColor];
    [v4 setBackgroundColor:v5];

    id v6 = [MEMORY[0x1E4F427D0] bezierPath];
    [v4 setShadowPath:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return [(CKConversationListCollectionViewController *)self dragOrDropPreviewParametersForItemAtIndexPath:a4 inCollectionView:a3];
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return [(CKConversationListCollectionViewController *)self dragOrDropPreviewParametersForItemAtIndexPath:a4 inCollectionView:a3];
}

- (unint64_t)_destinationSectionForDropSession:(id)a3 destinationIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKConversationListCollectionViewController *)self dataSource];
  double v9 = [v8 snapshot];
  uint64_t v10 = [v9 numberOfItemsInSection:&unk_1EDF16B98];

  if (v7 && [v7 section] == 2 && objc_msgSend(v7, "item") <= v10)
  {
    unint64_t v17 = 2;
  }
  else
  {
    double v11 = [(CKConversationListCollectionViewController *)self _conversationsFromLocalDropSession:v6];
    [(CKConversationListCollectionViewController *)self yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:v11];
    if (v12 == 0.0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Could not determine destinationSectionForDropSession", v20, 2u);
        }
      }
      unint64_t v17 = 5;
    }
    else
    {
      double v13 = v12;
      id v14 = [(CKConversationListCollectionViewController *)self collectionView];
      [v6 locationInView:v14];
      double v16 = v15;

      if (v16 <= v13) {
        unint64_t v17 = 2;
      }
      else {
        unint64_t v17 = 5;
      }
    }
  }
  return v17;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 hasItemsConformingToTypeIdentifiers:&unk_1EDF15950])
  {
    uint64_t v11 = [(CKConversationListCollectionViewController *)self _conversationDropProposalForCollectionView:v8 dropSession:v9 withDestinationIndexPath:v10];
  }
  else
  {
    v21[0] = *MEMORY[0x1E4F22608];
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    int v13 = [v9 hasItemsConformingToTypeIdentifiers:v12];

    if (v13)
    {
      id v14 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v10];
      double v15 = [v14 unsentComposition];
      int v16 = [v15 isAudioComposition];
      id v17 = objc_alloc(MEMORY[0x1E4F42888]);
      if (v16) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = 2;
      }
      CGSize v19 = (void *)[v17 initWithDropOperation:v18 intent:2];

      goto LABEL_10;
    }
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:0];
  }
  CGSize v19 = (void *)v11;
LABEL_10:

  return v19;
}

- (id)_conversationDropProposalForCollectionView:(id)a3 dropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CKConversationListCollectionViewController *)self _conversationsFromLocalDropSession:v8];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v12);
        }
        int v16 = [*(id *)(*((void *)&v50 + 1) + 8 * i) pinningIdentifier];
        if ([v16 length]) {
          [v11 addObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v13);
  }

  id v17 = [(CKConversationListCollectionViewController *)self pinnedConversationIdentifiers];
  unint64_t v18 = [(CKConversationListCollectionViewController *)self _destinationSectionForDropSession:v8 destinationIndexPath:v9];
  if (v18 == 5)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v26 = v11;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(v26);
          }
          if ([v17 containsObject:*(void *)(*((void *)&v46 + 1) + 8 * j)])
          {

            if (IMOSLoggingEnabled())
            {
              long long v33 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Dragging pinned conversation to the non pinned section, returning unspecific move drop proposal", buf, 2u);
              }
            }
            goto LABEL_36;
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Dragging unpinned conversations over the unpinned section, return unspecified move drop proposal to work around collection view issue, should be cancel", buf, 2u);
      }
    }
LABEL_36:
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:3 intent:0];
    goto LABEL_37;
  }
  if (v18 != 2)
  {
    if (IMOSLoggingEnabled())
    {
      long long v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "Dragging conversations to a secion other than the pinned or list section, returning UIDropOperationCancel proposal", buf, 2u);
      }
    }
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:0 intent:0];
LABEL_37:
    uint64_t v34 = (void *)v32;
    goto LABEL_68;
  }
  CGSize v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v17];
  uint64_t v20 = [v11 array];
  [v19 removeObjectsInArray:v20];

  uint64_t v21 = [v11 array];
  [v19 addObjectsFromArray:v21];

  unint64_t v22 = [v19 count];
  id v23 = +[CKUIBehavior sharedBehaviors];
  BOOL v24 = v22 > [v23 maximumNumberOfPinnedConversations];

  if (v24)
  {
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:1 intent:0];
  }
  else
  {
    if ((unint64_t)[v12 count] < 2)
    {
      if ([(CKConversationListCollectionViewController *)self isShowingPinnedChatDropTarget])
      {
        if (IMOSLoggingEnabled())
        {
          id v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "Dragging item to the drop target, returning unspecified move drop proposal", buf, 2u);
          }
        }
      }
      else if (v9)
      {
        BOOL v37 = [v9 section] == 2;
        int v38 = IMOSLoggingEnabled();
        if (v37)
        {
          if (v38)
          {
            id v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              uint64_t v40 = [v9 section];
              uint64_t v41 = [v9 item];
              *(_DWORD *)buf = 134218240;
              uint64_t v56 = v40;
              __int16 v57 = 2048;
              uint64_t v58 = v41;
              _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Dragging item to a specific location in the pinned section (%ld,%ld), returning InsertAtDestinationIndexPath drop proposal", buf, 0x16u);
            }
          }
          uint64_t v25 = [objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:3 intent:1];
          goto LABEL_67;
        }
        if (v38)
        {
          uint64_t v43 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v43, OS_LOG_TYPE_INFO, "Dragging item to pinned section with an invalid destination index path, returning unspecified move drop proposal", buf, 2u);
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_INFO, "Dragging item to pinned section without a valid destination index path, returning unspecified move drop proposal", buf, 2u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Dragging multiple items to the pinned section, returning unspecified move drop proposal", buf, 2u);
      }
    }
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:3 intent:0];
  }
LABEL_67:
  uint64_t v34 = (void *)v25;

LABEL_68:
  [v34 setPrefersFullSizePreview:1];

  return v34;
}

- (BOOL)_isDropForSession:(id)a3 toLeadingEdgeOfView:(id)a4
{
  id v5 = a4;
  [a3 locationInView:v5];
  double v7 = v6;
  [v5 bounds];
  double MidX = CGRectGetMidX(v10);
  LODWORD(a3) = [v5 _shouldReverseLayoutDirection];

  if (a3) {
    return v7 > MidX;
  }
  else {
    return v7 < MidX;
  }
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  if ([a4 hasItemsConformingToTypeIdentifiers:&unk_1EDF15968])
  {
    [(CKConversationListCollectionViewController *)self setHasActivePinnedConversationDropSession:1];
    [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:1];
    if (![(CKConversationListCollectionViewController *)self numberOfPinnedConversations])
    {
      if ([(CKConversationListCollectionViewController *)self shouldShowPinnedConversations])
      {
        [(CKConversationListCollectionViewController *)self setIsShowingPinnedChatDropTarget:1];
        [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
      }
    }
  }
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  -[CKConversationListCollectionViewController setIsShowingPinnedChatDropTarget:](self, "setIsShowingPinnedChatDropTarget:", 0, a4);

  [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  if ([a4 hasItemsConformingToTypeIdentifiers:&unk_1EDF15980])
  {
    [(CKConversationListCollectionViewController *)self setHasActivePinnedConversationDropSession:0];
    if ([(CKConversationListCollectionViewController *)self isShowingPinnedChatDropTarget])
    {
      [(CKConversationListCollectionViewController *)self setIsShowingPinnedChatDropTarget:0];
      [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:1];
      [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:0];
    }
    else
    {
      [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:1];
    }
  }
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  char v5 = [v4 hasItemsConformingToTypeIdentifiers:&unk_1EDF15998];
  v9[0] = *MEMORY[0x1E4F22608];
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  char v7 = [v4 hasItemsConformingToTypeIdentifiers:v6];

  LOBYTE(v6) = [MEMORY[0x1E4F6EA58] dropSessionIsRepositioningSticker:v4];
  return (v5 | v7) & ~(_BYTE)v6;
}

- (id)_conversationFromDragItem:(id)a3
{
  id v3 = [a3 localObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_conversationsFromLocalDropSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 localDragSession];
  char v5 = [v4 items];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = -[CKConversationListCollectionViewController _conversationFromDragItem:](self, "_conversationFromDragItem:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)[v6 copy];

  return v13;
}

- (id)_conversationAfterDropDestination:(id)a3 fromDiffableDataSource:(id)a4 snapshot:(id)a5 excludingDraggedConversation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [a5 numberOfItemsInSection:&unk_1EDF16B98];
  if ([v12 isPinned]) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 5;
  }
  uint64_t v32 = self;
  long long v33 = v12;
  long long v15 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v12 inSection:v14];
  if (v15)
  {
    long long v16 = [v11 indexPathForItemIdentifier:v15];
    long long v17 = v16;
    if (v16)
    {
      if ([v16 section] == 2)
      {
        uint64_t v18 = [v17 item];
        if (v18 < [v10 item])
        {
          uint64_t v19 = [v10 item] + 1;
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    long long v17 = 0;
  }
  uint64_t v19 = [v10 item];
LABEL_11:
  if (v19 >= v13)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v30 = v17;
    long long v31 = v15;
    while (1)
    {
      uint64_t v20 = v13;
      id v21 = v10;
      unint64_t v22 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v19, objc_msgSend(v10, "section", v30, v31));
      id v23 = v11;
      BOOL v24 = [v11 itemIdentifierForIndexPath:v22];
      uint64_t v25 = [(CKConversationListCollectionViewController *)v32 conversationForItemIdentifier:v24];
      id v26 = [v33 pinningIdentifier];
      uint64_t v27 = [v25 pinningIdentifier];
      char v28 = [v26 isEqualToString:v27];

      if ((v28 & 1) == 0) {
        break;
      }

      ++v19;
      uint64_t v13 = v20;
      id v10 = v21;
      id v11 = v23;
      if (v20 == v19)
      {
        uint64_t v25 = 0;
        goto LABEL_18;
      }
    }

    id v10 = v21;
    id v11 = v23;
LABEL_18:
    long long v17 = v30;
    long long v15 = v31;
  }

  return v25;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Performing drop using non-diffable reordering (performDropWithCoordinator:)", v14, 2u);
    }
  }
  uint64_t v9 = [v7 session];
  int v10 = [v9 hasItemsConformingToTypeIdentifiers:&unk_1EDF159B0];

  if (v10)
  {
    [(CKConversationListCollectionViewController *)self _performConversationDropWithCollectionView:v6 dropCoordinator:v7];
  }
  else
  {
    id v11 = [v7 session];
    v15[0] = *MEMORY[0x1E4F22608];
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    int v13 = [v11 hasItemsConformingToTypeIdentifiers:v12];

    if (v13) {
      [(CKConversationListCollectionViewController *)self _performItemDropWithCollectionView:v6 dropCoordinator:v7];
    }
  }
}

- (void)_performConversationDropWithCollectionView:(id)a3 dropCoordinator:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 proposal];
  uint64_t v9 = [v8 operation];

  if (v9 != 3) {
    goto LABEL_40;
  }
  uint64_t v10 = [v7 session];
  id v11 = [(CKConversationListCollectionViewController *)self _conversationsFromLocalDropSession:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v67 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v66 + 1) + 8 * i) pinningIdentifier];
        if ([v18 length]) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v15);
  }
  id v53 = v6;

  [v7 destinationIndexPath];
  v20 = uint64_t v19 = v10;
  unint64_t v21 = -[CKConversationListCollectionViewController _destinationSectionForDropSession:destinationIndexPath:](self, "_destinationSectionForDropSession:destinationIndexPath:", v10);
  uint64_t v56 = [(CKConversationListCollectionViewController *)self dataSource];
  unint64_t v22 = [v56 snapshot];
  id v23 = +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier];
  double v71 = v23;
  BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  CGFloat v54 = v22;
  [v22 deleteItemsWithIdentifiers:v24];

  BOOL v25 = [(CKConversationListCollectionViewController *)self isShowingPinnedChatDropTarget];
  [(CKConversationListCollectionViewController *)self setIsShowingPinnedChatDropTarget:0];
  long long v52 = v13;
  if (v21 == 5)
  {
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke_2;
    v61[3] = &unk_1E5622508;
    v61[4] = self;
    id v62 = v22;
    [v13 enumerateObjectsUsingBlock:v61];

    id v26 = (void *)v19;
  }
  else
  {
    id v26 = (void *)v19;
    if (v21 == 2)
    {
      char v27 = [v13 count] != 1 || v25;
      if (v27)
      {
LABEL_17:
        char v28 = 0;
LABEL_29:
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke;
        v63[3] = &unk_1E562AC68;
        v63[4] = self;
        id v64 = v54;
        id v65 = v28;
        id v35 = v28;
        [v13 enumerateObjectsWithOptions:2 usingBlock:v63];

        goto LABEL_30;
      }
      if (v20 && [v20 section] == 2)
      {
        uint64_t v29 = [v13 firstObject];
        char v28 = [(CKConversationListCollectionViewController *)self _conversationAfterDropDestination:v20 fromDiffableDataSource:v56 snapshot:v54 excludingDraggedConversation:v29];
      }
      else
      {
        uint64_t v30 = [v54 numberOfItemsInSection:&unk_1EDF16B98];
        long long v31 = [(CKConversationListCollectionViewController *)self conversationLayout];
        uint64_t v32 = objc_msgSend(v31, "numberOfPinnedConversationColumnsForLayoutStyle:", -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));

        char v28 = 0;
        if (v30 < 1)
        {
          id v13 = v52;
          goto LABEL_29;
        }
        BOOL v33 = v30 < v32;
        id v13 = v52;
        if (!v33) {
          goto LABEL_29;
        }
        if (![(CKConversationListCollectionViewController *)self _isDropForSession:v19 toLeadingEdgeOfView:v53])goto LABEL_17; {
        uint64_t v29 = [v54 itemIdentifiersInSectionWithIdentifier:&unk_1EDF16B98];
        }
        uint64_t v34 = [v29 firstObject];
        char v28 = [(CKConversationListCollectionViewController *)self conversationForItemIdentifier:v34];

        id v13 = v52;
      }

      goto LABEL_29;
    }
  }
LABEL_30:
  long long v50 = v12;
  long long v51 = v26;
  -[CKConversationListCollectionViewController commitPinnedConversationsFromSnapshot:](self, "commitPinnedConversationsFromSnapshot:", v54, v20);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  double v55 = v7;
  id v36 = [v7 session];
  BOOL v37 = [v36 items];

  uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        uint64_t v43 = [(CKConversationListCollectionViewController *)self _conversationFromDragItem:v42];
        if (v43)
        {
          long long v44 = [(CKConversationListCollectionViewController *)self itemIdentifierForConversation:v43 inSection:v21];
          [v56 indexPathForItemIdentifier:v44];
          id v45 = self;
          long long v47 = v46 = v21;
          id v48 = (id)[v55 dropItem:v42 toItemAtIndexPath:v47];

          unint64_t v21 = v46;
          self = v45;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v39);
  }

  id v6 = v53;
  id v7 = v55;
LABEL_40:
}

void __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) itemIdentifierForConversation:v3 inSection:2];
  char v5 = [*(id *)(a1 + 40) itemIdentifiers];
  int v6 = [v5 containsObject:v4];

  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:1];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) itemIdentifierForConversation:v8 inSection:2];
      [*(id *)(a1 + 40) moveItemWithIdentifier:v4 beforeItemWithIdentifier:v9];
    }
    else
    {
      uint64_t v16 = *(void **)(a1 + 40);
      v21[0] = v4;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v16 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:&unk_1EDF16B98];
    }
  }
  else
  {
    uint64_t v9 = [v7 itemIdentifierForConversation:v3 inSection:5];
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v20 = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v10 deleteItemsWithIdentifiers:v11];

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      id v13 = [*(id *)(a1 + 32) itemIdentifierForConversation:v12 inSection:2];
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v19 = v4;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      [v14 insertItemsWithIdentifiers:v15 beforeItemWithIdentifier:v13];
    }
    else
    {
      long long v17 = *(void **)(a1 + 40);
      uint64_t v18 = v4;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      [v17 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:&unk_1EDF16B98];
    }
  }
}

void __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) itemIdentifierForConversation:a2 inSection:2];
  id v4 = *(void **)(a1 + 40);
  v6[0] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v4 deleteItemsWithIdentifiers:v5];
}

- (void)didReorderConversationsWithTransaction:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Performing drop using diffable reordering", v7, 2u);
    }
  }
  [(CKConversationListCollectionViewController *)self setIsCommitingDiffableDataSourceTransaction:1];
  int v6 = [v4 finalSnapshot];
  [(CKConversationListCollectionViewController *)self commitPinnedConversationsFromSnapshot:v6];
  [(CKConversationListCollectionViewController *)self setIsCommitingDiffableDataSourceTransaction:0];
}

- (void)commitPinnedConversationsFromSnapshot:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F6BD70] processSupportsPinnedConversations])
  {
    uint64_t v5 = [(CKConversationListCollectionViewController *)self pinnedConversationsFromSnapshot:v4];
    int v6 = (void *)v5;
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      uint64_t v8 = (void *)v5;
    }
    else {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v9 = v8;

    uint64_t v10 = [(CKConversationListCollectionViewController *)self pinnedConversations];
    id v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    else {
      uint64_t v12 = v7;
    }
    id v13 = v12;

    if ([v13 isEqualToArray:v9])
    {
      [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
    }
    else
    {
      uint64_t v14 = [(CKConversationListCollectionViewController *)self _allFrozenConversations];
      if (v14)
      {
        [(CKConversationListCollectionViewController *)self setFrozenPinnedConversations:v9];
        [(CKConversationListCollectionViewController *)self _updateLargeTitleDisplayModeWithAnimation:1];
        [(CKConversationListCollectionViewController *)self updateSnapshotAnimatingDifferences:1];
      }
      else
      {
        [(CKConversationListCollectionViewController *)self setPinningInteractionMethod:1];
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v16 = v9;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v25 != v19) {
                objc_enumerationMutation(v16);
              }
              unint64_t v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) chat];
              [v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v18);
        }

        unint64_t v22 = [MEMORY[0x1E4F6BD70] sharedInstance];
        id v23 = (void *)[v15 copy];
        [v22 setPinnedChats:v23 withUpdateReason:*MEMORY[0x1E4F6BB78]];

        uint64_t v14 = 0;
      }
    }
    [(CKConversationListCollectionViewController *)self updateContentsOfAllCellsAnimated:1];
  }
}

- (void)_performItemDropWithCollectionView:(id)a3 dropCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 destinationIndexPath];
  if (v8)
  {
    id v9 = [(CKConversationListCollectionViewController *)self conversationAtIndexPath:v8];
    uint64_t v10 = [v9 unsentComposition];
    if (([v10 isAudioComposition] & 1) == 0)
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v12 = [v7 items];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke;
      v18[3] = &unk_1E562AC90;
      id v13 = v11;
      id v19 = v13;
      [v12 enumerateObjectsUsingBlock:v18];

      id location = 0;
      objc_initWeak(&location, self);
      if ([v13 count])
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_2;
        v14[3] = &unk_1E5623788;
        objc_copyWeak(&v16, &location);
        id v15 = v8;
        +[CKComposition requestCompositionFromItemProviders:v13 completion:v14];

        objc_destroyWeak(&v16);
      }
      objc_destroyWeak(&location);
    }
  }
}

void __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v4 = [a2 dragItem];
  id v3 = [v4 itemProvider];
  [v2 addObject:v3];
}

void __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_3;
  block[3] = &unk_1E5622A90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _showConversationWithComposition:*(void *)(a1 + 32) atIndexPath:*(void *)(a1 + 40)];
}

- (void)configureFocusFilterCell:(id)a3
{
  id v5 = a3;
  [v5 setFocusFilterBannerDelegate:self];
  id v4 = [MEMORY[0x1E4F6E788] sharedManager];
  objc_msgSend(v5, "setIsFocusFilterEnabled:", objc_msgSend(v4, "userSwitchForFocusFilteringIsEnabled"));

  objc_msgSend(v5, "setUseFullWidthKeylines:", -[CKConversationListCollectionViewController _focusFilterBannerShouldUseFullWidthKeylines](self, "_focusFilterBannerShouldUseFullWidthKeylines"));
}

- (void)configureFocusFilterCollapsedCell:(id)a3
{
  id v4 = a3;
  [v4 setFocusFilterBannerDelegate:self];
  id v5 = [MEMORY[0x1E4F6E788] sharedManager];
  objc_msgSend(v4, "setIsFocusFilterEnabled:", objc_msgSend(v5, "userSwitchForFocusFilteringIsEnabled"));
}

- (BOOL)_focusFilterBannerShouldUseFullWidthKeylines
{
  int64_t v2 = [(CKConversationListCollectionViewController *)self dataSource];
  id v3 = [v2 snapshot];

  BOOL v4 = [v3 numberOfSections]
    && [v3 numberOfItems]
    && [v3 numberOfItemsInSection:&unk_1EDF16E98] <= 0
    && ([v3 numberOfItemsInSection:&unk_1EDF16EB0] > 0
     || [v3 numberOfItemsInSection:&unk_1EDF16EC8] > 0
     || [v3 numberOfItemsInSection:&unk_1EDF16EE0] > 0);

  return v4;
}

- (void)focusFilterBannerEnabledStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F6E788] sharedManager];
  [v5 setUserSwitchForFocusFilteringIsEnabled:v3];

  id v7 = [(CKConversationListCollectionViewController *)self collectionView];
  id v6 = [v7 collectionViewLayout];
  [v6 invalidateLayout];
}

- (id)reportConcernForChat:(id)a3
{
  BOOL v4 = (IMChat *)a3;
  id v5 = self;
  CKConversationListCollectionViewController.reportConcern(for:)(v6, v4);
  id v8 = v7;

  return v8;
}

void __117__CKConversationListCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "itemIdentifier not found on configuration: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_pinActionForItemIdentifier:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1 isPinned]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if (a2) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  id v8 = [a1 chat];
  int v9 = 138412802;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "conversation.isPinned == %@, but isPinned (in UI) == %@ conversation.chat: %@", (uint8_t *)&v9, 0x20u);
}

- (void)_openConversationInNewWindowActionForItemIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unexpectedly received a nil NSUserActivity from the CKConversation instance. Not including this UIAction.", v2, v3, v4, v5, v6);
}

- (void)togglePinStateForConversation:withReason:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Ignoring request to toggle pin state for conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
}

- (void)unpinConversation:withReason:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Ignoring request to unpin conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
}

- (void)pinConversation:withReason:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Ignoring request to pin conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18EF18000, a2, OS_LOG_TYPE_DEBUG, "Adding deferred update of conversation list for generated adaptive image glyph: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_2_2();
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_18EF18000, a3, OS_LOG_TYPE_DEBUG, "Updating %ld conversations previews for generated adaptive image glyph: %@", v5, 0x16u);
}

- (void)viewWillAppear:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_18EF18000, v1, OS_LOG_TYPE_ERROR, "expected cell of class CKPinnedConversationCollectionViewCell at selectedIndexPath: %@. Got cell: %@", v2, 0x16u);
}

@end