@interface CKTranscriptCollectionViewController
+ (CGSize)defaultCollectionViewSize;
+ (id)chatItemsDidChangeNotification;
+ (id)initialTextEffectsState;
+ (id)logHandle;
+ (id)newTranscriptTextEffectCoordinatorForTranscriptCollectionViewController:(id)a3 isInline:(BOOL)a4;
+ (id)offrampLearnMoreURL;
- (BOOL)_allowsEffectAutoPlayback;
- (BOOL)_canShowWhileLocked;
- (BOOL)_canUseOpaqueMask;
- (BOOL)_isHistoryLoadingNeededForDirection:(int64_t)a3 withTargetContentOffset:(CGPoint)a4 forKeyboardNavigation:(BOOL)a5;
- (BOOL)_isRecognizerScrubbingOnCurrentAudioMessageBalloon:(id)a3;
- (BOOL)_pluginChatItem:(id)a3 hasControllerConformingToProtocol:(id)a4;
- (BOOL)_selectedChatItemsHaveMultipleSenders:(id)a3;
- (BOOL)_shouldMakeTextEffectStateReadyInViewDidAppearDeferredSetup;
- (BOOL)_shouldMarkAllInputContextHistoryEntriesAsJunk;
- (BOOL)_supportsStickersSensitiveContentContextMenu;
- (BOOL)_textMessagePartItemHasValidLayout:(id)a3 textBalloonView:(id)a4;
- (BOOL)allowsPluginPlayback;
- (BOOL)audioControllerWasPlayingBeforeScrub;
- (BOOL)balloonTextViewIsSelected;
- (BOOL)canInteractWithObscuredItem;
- (BOOL)canRaiseToListen;
- (BOOL)canRaiseToTalk;
- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldAllowSwipeForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionViewLayout:(id)a3 hasPlayingOrPausedTextEffectForChatItem:(id)a4 indexPath:(id)a5;
- (BOOL)compositorSupportsCustomLayoutGroupsForLayoutProvider:(id)a3;
- (BOOL)compositorSupportsCustomLayoutGroupsForSection:(int64_t)a3;
- (BOOL)filterAllButFirstMessage;
- (BOOL)hasCommSafetyNotViewableAssociatedItems:(id)a3;
- (BOOL)hasRecentTouchForSendingPlugin:(id)a3;
- (BOOL)isContentOffsetAtCurrentTime:(CGPoint)a3;
- (BOOL)isContentOffsetAtOrBelowBottom:(CGPoint)a3;
- (BOOL)isContentOffsetAtOrBelowReplies:(CGPoint)a3;
- (BOOL)isInline;
- (BOOL)isLoadMoreSpinnerAboutToBeVisibleForDirection:(int64_t)a3 withTargetContentOffset:(CGPoint)a4;
- (BOOL)isLoadMoreSpinnerVisibleForDirection:(int64_t)a3;
- (BOOL)isLoadingMoreMessages;
- (BOOL)isPeeking;
- (BOOL)isPerformingRegenerateOrReloadOnlyUpdate;
- (BOOL)isPresentingChatItemForKeyboard;
- (BOOL)isReportingEnabled;
- (BOOL)isSettingChatItems;
- (BOOL)isShowingTranscriptTimestamps;
- (BOOL)isTextEffectCoordinatorPaused;
- (BOOL)isTranscriptUpdateAnimated;
- (BOOL)isVisiblePlugin:(id)a3;
- (BOOL)playedLastImpactEffectForTransitionFromComposing;
- (BOOL)pointIntersectsRepositionEnabledSticker:(CGPoint)a3 chatItem:(id)a4;
- (BOOL)scrollToTopOfLastBubbleCellWithAnimationProperties:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldEndShowingEditHistoryOnViewDisappearance;
- (BOOL)shouldFreezeReplyDecorationsForCell:(id)a3;
- (BOOL)shouldLoadDefaultConversationViewingMessageCountOnAppear;
- (BOOL)shouldPresentHawkingPromptForChatItem:(id)a3;
- (BOOL)shouldUseOpaqueMask;
- (BOOL)sizedFullTranscript;
- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4;
- (BOOL)textEffectIsCandidateBalloonViewChecksForChatItem:(id)a3;
- (BOOL)textEffectIsCandidateBalloonViewChecksForChatItem:(id)a3 balloonView:(id)a4;
- (BOOL)transitionedFromComposing;
- (BOOL)transitioningFromComposing;
- (BOOL)wantsDrawerLayout;
- (CGPoint)_platformSpecificBottomContentOffset;
- (CGPoint)peekSampleTranslation;
- (CGPoint)topScrollPositionForIndexPath:(id)a3;
- (CGRect)collectionViewAdjustedContentFrameWithKeyboard:(UIEdgeInsets)a3;
- (CGRect)convertedBoundsToCullFromView:(id)a3;
- (CGSize)collectionViewSize;
- (CKBalloonEmphasisManager)balloonEmphasisManager;
- (CKChatItemController)chatItemController;
- (CKConversation)conversation;
- (CKFullScreenEffectManager)fullscreenEffectManager;
- (CKFullscreenEffectView)topEffectView;
- (CKGradientReferenceView)gradientReferenceView;
- (CKImpactEffectManager)impactEffectManager;
- (CKPluginPlaybackManager)pluginPlaybackManager;
- (CKTranscriptBalloonSelectionManager)selectionManager;
- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6;
- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6 collectionViewSize:(CGSize)a7;
- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7;
- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8;
- (CKTranscriptCollectionViewControllerDelegate)delegate;
- (CKTranscriptCompositor)compositor;
- (CKTranscriptLayoutMessageEditingContext)messageEditingContext;
- (CKTranscriptTextEffectsState)textEffectsState;
- (IMChat)chat;
- (IMStateCaptureAssistant)stateCaptureAssistant;
- (NSArray)associatedChatItems;
- (NSArray)chatItems;
- (NSArray)notifications;
- (NSDate)transcriptBecameVisibleTimestamp;
- (NSDictionary)cachedEmojiResponses;
- (NSDictionary)pluginSnapshots;
- (NSIndexSet)hiddenAssociatedItems;
- (NSIndexSet)hiddenAssociatedItemsForMessageEditing;
- (NSIndexSet)hiddenBalloonViews;
- (NSIndexSet)hiddenItems;
- (NSMutableArray)generativeContextHistory;
- (NSMutableArray)stickerGUIDsHiddenDuringStickerAddAnimation;
- (NSMutableSet)currentEffectDecorationViews;
- (NSSet)chatItemGUIDsOfHiddenTapbackPiles;
- (NSSet)hiddenChatItemGUIDs;
- (NSString)__CurrentTestName;
- (NSString)generatedSummary;
- (NSString)mostRecentlyTouchedPlugin;
- (NSString)poppedBalloonGUIDHiddenUntilNextChatItemUpdate;
- (NSString)speakerTransferGUID;
- (NSString)transcriptIdentifier;
- (NSValue)presentedChatItemScrollOffset;
- (OS_dispatch_group)updateAnimationGroup;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIDragInteractionDelegate)dragInteractionDelegate;
- (UIEdgeInsets)marginInsets;
- (UIInputContextHistory)inputContextHistory;
- (UITapGestureRecognizer)loggingTapGestureRecognizer;
- (UIView)snapshotOfPluginBeingReplacedByBreadcrumb;
- (_NSRange)_loggingRangeForLatestChatItems:(id)a3;
- (_NSRange)_loggingRangeForUpdates:(id)a3 chatItemsCount:(int64_t)a4;
- (_TtC7ChatKit23CKTextEffectCoordinator)transcriptTextEffectCoordinator;
- (double)_balloonHorizontalOffsetForParentChatItem:(id)a3 contentAlignmentRect:(CGRect)a4 responsibleChatItems:(id *)a5 individualOffsets:(id *)a6;
- (double)_fullMaxWidth;
- (double)balloonMaxWidth;
- (double)lastViewWidthUsedToLayoutChatItems;
- (double)pluginPlaybackDelay;
- (id)_buildRetryAlertWithMessage:(id)a3 sourceView:(id)a4 tryAgainAction:(id)a5;
- (id)_chatItemForGUID:(id)a3;
- (id)_ckChatItemWithGUID:(id)a3 inSection:(unint64_t)a4;
- (id)_collectionView:(id)a3 accessoriesForContextMenuWithConfiguration:(id)a4 layoutAnchor:(id *)a5;
- (id)_collectionView:(id)a3 styleForContextMenuWithConfiguration:(id)a4;
- (id)_currentTopChatItemForAggregateChatItem:(id)a3;
- (id)_indexPathOfCellContainingStampButton:(id)a3;
- (id)_inputContextIdentifiersForMe;
- (id)_inputContextIdentifiersForRecipients:(id)a3;
- (id)_insertChatItemsInto:(id)a3 withIMChatItems:(id)a4 inserted:(id)a5 insertedUnreadMessage:(id *)a6 insertedLocalUnsentChatItem:(id *)a7;
- (id)_itemGUIDsForItems:(id)a3 inIMChatItem:(id)a4;
- (id)_itemProviderForSelectedChatItemsWithMultipleSenders:(id)a3;
- (id)_itemProviderForSelectedChatItemsWithSingleSender:(id)a3;
- (id)_logChatItems:(id)a3 withIndex:(int64_t)a4;
- (id)_logChatItems:(id)a3 withUpdates:(id)a4;
- (id)_logLatestChatItems:(id)a3;
- (id)_mediaObjectsForOrganicChatItem:(id)a3 onIndexPath:(id)a4;
- (id)_nextChatItemOfType:(Class)a3 afterIndex:(int64_t)a4 inChatItems:(id)a5;
- (id)_participantsNameMapFromRecipients:(id)a3 mySenderIdentifiers:(id)a4;
- (id)_previousChatItemOfType:(Class)a3 beforeIndex:(int64_t)a4 inChatItems:(id)a5;
- (id)_sanitizeInsertedIndices:(id)a3 inChatItems:(id)a4 withIMChatItems:(id)a5;
- (id)_serviceForResendingMessage:(id)a3;
- (id)associatedChatItemForGUID:(id)a3;
- (id)audioMessageMediaObjectsFromBalloonView:(id)a3;
- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)balloonOffsetMapForLayout:(id)a3 resetsOffsetMapAfterUse:(BOOL)a4;
- (id)balloonPluginForViewController:(id)a3;
- (id)balloonViewForChatItem:(id)a3;
- (id)balloonViewForChatItemGUID:(id)a3 getChatItem:(id *)a4;
- (id)balloonViewForIndexPath:(id)a3;
- (id)cellForAssociatedChatItem:(id)a3;
- (id)cellForChatItem:(id)a3;
- (id)chatItemAtIndexPath:(id)a3;
- (id)chatItemForCell:(id)a3;
- (id)chatItemForGUID:(id)a3;
- (id)collectionView:(id)a3 cellForCKChatItem:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 layout:(id)a4 chatItemForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 layout:(id)a4 chatItemForSupplementaryViewAtIndexPath:(id)a5;
- (id)collectionViewLayout;
- (id)compositorDatasourceItemsForSection:(int64_t)a3;
- (id)currentEffectForCollectionView:(id)a3 layout:(id)a4;
- (id)dataSourceWithCollectionView:(id)a3;
- (id)generateSnapshotForCKChatItems:(id)a3;
- (id)hawkingFailurePromptMessageForHandle:(id)a3;
- (id)imChatItems;
- (id)indexPathForAssociatedChatItemGUID:(id)a3;
- (id)indexPathForAssociatedMessageGUID:(id)a3 messagePartIndex:(int64_t)a4;
- (id)indexPathForBalloonView:(id)a3;
- (id)indexPathForChatItemGUID:(id)a3;
- (id)indexPathForChatItemGUID:(id)a3 useAssociatedSection:(BOOL)a4;
- (id)indexPathForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4;
- (id)indexPathForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4 useAssociatedSection:(BOOL)a5;
- (id)indexPathOfLastBubble;
- (id)lastMessagePartChatItem;
- (id)latestScheduledMessageIndexPath;
- (id)layoutGroupForDatasourceItems:(id)a3 environment:(id)a4 layoutItems:(id)a5;
- (id)loadMoreItemIndexPathForDirection:(int64_t)a3;
- (id)logHandle;
- (id)makeHawkingPromptForMessage:(id)a3 toRecipient:(id)a4 fromSender:(id)a5 withSMSOption:(BOOL)a6;
- (id)mediaObjectsForCommSafetyReport:(id)a3;
- (id)messagePartForBalloonView:(id)a3;
- (id)newChatItemWithIMChatItem:(id)a3 traitCollection:(id)a4;
- (id)newChatItemWithNotification:(id)a3;
- (id)newChatItemsWithIMChatItems:(id)a3;
- (id)newChatItemsWithNotifications:(id)a3;
- (id)overrideCurrentFrameMapForLayout:(id)a3;
- (id)overrideTargetFrameMapForLayout:(id)a3;
- (id)printableViewController;
- (id)reportJunkAlertControllerTitle;
- (id)selectedChatItems;
- (id)selectedItems;
- (id)selectedMediaObjectForCommSafetyReport:(id)a3;
- (id)sharingMenu;
- (id)stateDictionaryForDiagnosticsRequest;
- (id)textEffectCoordinator:(id)a3 explodeConfigurationForTextViewIdentifier:(id)a4;
- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4;
- (id)textEffectCoordinator:(id)a3 textViewForTextViewIdentifier:(id)a4;
- (id)transcriptBackgroundColor;
- (id)transcriptBalloonCell:(id)a3 customTextRenderingDisplayLinkForTextBalloonViewTextView:(id)a4;
- (id)transcriptBalloonCell:(id)a3 layoutAttributesForTextBalloonView:(id)a4 messageDisplayViewFrame:(CGRect)a5 inContainerFrame:(CGRect)a6 proposedAttributes:(id)a7;
- (id)transcriptCollectionView:(id)a3 preferredIndexPathForAssociatedItemAtPoint:(CGPoint)a4;
- (id)transcriptUpdateCompletion;
- (id)videoPlayerReusePool;
- (id)visibleTextViewIdentifiersFor:(id)a3;
- (int64_t)_computeDesiredScrollIntentForInsertedUnreadChatItem:(id)a3 insertedLocalUnsentChatItem:(id)a4;
- (int64_t)_moreHelpMenuOptions:(BOOL)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)contentAnimationPauseReasons;
- (int64_t)desiredTranscriptScrollIntentForContentOffset:(CGPoint)a3;
- (int64_t)desiredTranscriptScrollIntentForCurrentContentOffset;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)_indexOfBreadcrumbReplacingTranscriptPluginInChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 outIndexOfReplacedPlugin:(unint64_t *)a6 outIndexOfNewPlugin:(unint64_t *)a7;
- (unint64_t)transcriptBalloonCell:(id)a3 allowedLayoutActionForTextBalloonView:(id)a4;
- (void)__raiseGestureRecognized:(id)a3;
- (void)__setCurrentTestName:(id)a3;
- (void)__updateLayoutAndConfigureVisibleMessagesCellsIncludingAssociatedCells:(BOOL)a3;
- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3;
- (void)_addAttachmentsToProvidersArray:(id)a3 forChatItems:(id)a4;
- (void)_addChatItemsToGenerativeContextHistory:(id)a3;
- (void)_addChatItemsToInputContextHistory:(id)a3 signalingResponseContextChangeIfNeeded:(BOOL)a4;
- (void)_animateAssociatedChatItemWithIndices:(id)a3;
- (void)_animateChatItemInsertion:(id)a3 inserted:(id)a4 wantsScrollToBottom:(BOOL)a5 scrollToBottomDuration:(double *)a6;
- (void)_animateChatItemReload:(id)a3 reload:(id)a4 associatedInserted:(id)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)_animateChatItemRemoval:(id)a3 removed:(id)a4;
- (void)_animateStickerRepositionWithAssociatedChatItem:(id)a3 associatedCell:(id)a4 associatedIndexPath:(id)a5;
- (void)_collectionViewDidRestAsync:(BOOL)a3;
- (void)_configureEditMarginInsetsForCell:(id)a3;
- (void)_conversationListFinishedMerging:(id)a3;
- (void)_createGenerativeContextHistory;
- (void)_createInputContextHistory;
- (void)_deferredStartPlayback;
- (void)_deselectChatItemGuid:(id)a3;
- (void)_diffAssociatedItemsWithOldAssociatedItems:(id)a3 removedAssociatedIndexes:(id *)a4 insertedAssociatedIndexes:(id *)a5;
- (void)_dismissInterventionController:(id)a3;
- (void)_dismissMoreHelpView:(id)a3;
- (void)_downgradeMessage:(id)a3;
- (void)_downgradeMessage:(id)a3 andDowngradeChat:(BOOL)a4;
- (void)_enumerateMediaObjectsForReportUsingBlock:(id)a3;
- (void)_forceReloadChatItems;
- (void)_handleAssociatedMessageCellTapEvent:(id)a3 isDoubleTap:(BOOL)a4;
- (void)_handleAudioBalloonTapForIndexPath:(id)a3;
- (void)_handleCommSafetyMessageSomeoneStatusButtonTappedForIndexPath:(id)a3;
- (void)_handleCommSafetySensitiveReceiveStatusButtonTappedForIndexPath:(id)a3;
- (void)_handleEditHistoryButtonTappedForIndexPath:(id)a3;
- (void)_handleFailedCancelStatusButtonTappedForIndexPath:(id)a3;
- (void)_handleFailedEditStatusButtonTappedForIndexPath:(id)a3;
- (void)_handlePluginBreadcrumbingInChatItems:(id)a3 withIMChatItems:(id)a4 inserted:(id *)a5 removed:(id *)a6 completion:(id)a7;
- (void)_handleSendViaSatelliteButtonTappedForIndexPath:(id)a3;
- (void)_handleTapOnGroupActionChatItem:(id)a3;
- (void)_handleTapOnGroupTitleChangeChatItem:(id)a3;
- (void)_handleTapOnMessageRetractionChatItem:(id)a3;
- (void)_handleTapOnParticipantChangeChatItem:(id)a3;
- (void)_hideBalloonViewIfNecessaryForCell:(id)a3 indexPath:(id)a4;
- (void)_highlightCell:(id)a3 autoDismiss:(BOOL)a4;
- (void)_identifyIndicesNeedingCustomAnimationsForIMChatItems:(id)a3 inserted:(id)a4 removed:(id)a5;
- (void)_indicesOfReplyChatItemsToInsertWithoutFading:(id)a3 inserted:(id)a4 outInsertIndices:(id *)a5;
- (void)_indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading:(id)a3 inserted:(id)a4 removed:(id)a5 outInsertIndices:(id *)a6 outRemoveIndices:(id *)a7;
- (void)_loadMessagesIfNeededWithTargetContentOffset:(CGPoint)a3 forKeyboardNavigation:(BOOL)a4;
- (void)_logVisibleChatItems;
- (void)_messageParents;
- (void)_prepareTextEffectCoordinatorForCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5;
- (void)_presentCancelledScheduledMessageConfirmationAlertForMessage:(id)a3;
- (void)_presentEditedMessageResendConfirmationAlertForMessage:(id)a3;
- (void)_presentEditedScheduledMessageResendConfirmationAlertForMessage:(id)a3;
- (void)_presentMessageCanNoLongerBeEditedAlert;
- (void)_presentMessageCanNoLongerBeRetractedAlert;
- (void)_presentOfframpDetonationAlert;
- (void)_presentRetractedMessageResendConfirmationAlertForIMChatItem:(id)a3;
- (void)_prewarmBalloonControllers;
- (void)_prewarmLinkPresentations;
- (void)_prewarmLinkPresentationsWithChatItems:(id)a3;
- (void)_prewarmMediaPreviews;
- (void)_prewarmTranscriptAssetsIfNecessary;
- (void)_quickActionPinButtonWasTapped:(id)a3 atIndexPath:(id)a4 chatItem:(id)a5;
- (void)_quickActionSaveButtonWasTapped:(id)a3 atIndexPath:(id)a4 chatItem:(id)a5;
- (void)_reattemptMessageCancellationForChatItem:(id)a3;
- (void)_refreshLocationsForRecipientsIfNecessary;
- (void)_regenerateChatItemsIn:(id)a3 withIMChatItems:(id)a4 regenerate:(id)a5 shouldShowBlackholeAlert:(BOOL *)a6;
- (void)_releaseActiveBalloonControllers;
- (void)_removeChatItemsFrom:(id)a3 removed:(id)a4;
- (void)_removeHighlightFromCell:(id)a3;
- (void)_replayLastImpactEffectIfNotFromMe;
- (void)_requestChatItemLayoutInvalidation;
- (void)_resendEditedMessageForChatItem:(id)a3;
- (void)_resendEditedScheduledMessageForChatItem:(id)a3;
- (void)_resendFailedMessages;
- (void)_resendMessage:(id)a3;
- (void)_resendMessageRetractionForChatItem:(id)a3;
- (void)_resendMessageUsingCurrentService:(id)a3;
- (void)_resizingEnd:(id)a3;
- (void)_resizingStart:(id)a3;
- (void)_saveMediaObjects:(id)a3 withMomentShareURL:(id)a4 sender:(id)a5;
- (void)_searchForSelectedBalloonHack;
- (void)_selectChatItemGuid:(id)a3 selectionState:(id)a4;
- (void)_setHoldingWhilePresentingKeyboardForChatItem:(BOOL)a3;
- (void)_showAutoDonationAlert:(id)a3 forAppName:(id)a4 bundleID:(id)a5;
- (void)_showBlockContactSelectionAlertFromView:(id)a3;
- (void)_showLeaveConversationFromView:(id)a3;
- (void)_showMoreHelp;
- (void)_startPlaybackWithIndexPaths:(id)a3;
- (void)_tearDownLiveBubbles;
- (void)_textMessagePartItem:(id)a3 textBalloonView:(id)a4 getHasValidOrigin:(BOOL *)a5 getHasValidSize:(BOOL *)a6;
- (void)_trackPhotoStackEvent:(id)a3 forStackBalloonView:(id)a4 transcriptOrientation:(char)a5;
- (void)_updateAudioControllerForInserted:(id)a3 chatItems:(id)a4;
- (void)_updateCollectionViewForChatItems:(id)a3 oldChatItems:(id)a4 inserted:(id)a5 removed:(id)a6 associatedInserted:(id *)a7 associatedRemoved:(id *)a8 animationDuration:(double)a9 animationCurve:(int64_t)a10 completion:(id)a11;
- (void)_updateCollectionViewSnapshotForChatItems:(id)a3 reloadingItemGUIDs:(id)a4 animatingDifferences:(BOOL)a5 associatedInserted:(id *)a6 associatedRemoved:(id *)a7 completion:(id)a8;
- (void)_updateEffectViewMessageRect:(id)a3 effect:(id)a4;
- (void)_updateLayoutAndConfigureVisibleCells;
- (void)_updatePluginPlaybackManagerForInsertedChatItems:(id)a3;
- (void)_updateSnapshotWithoutAnimation:(id)a3 reloadingItemGUIDs:(id)a4 completion:(id)a5;
- (void)_updateTranscriptChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 reload:(id)a6 regenerate:(id)a7 animated:(BOOL)a8 completion:(id)a9;
- (void)_updateTranscriptChatItemsWithAnimation:(id)a3 withIMChatItems:(id)a4 oldChatItems:(id)a5 insertedChatItems:(id)a6 inserted:(id)a7 removed:(id)a8 reload:(id)a9 reloadItemGUIDs:(id)a10 desiredScrollIntent:(int64_t)a11 scrollToBottomDuration:(double *)a12 animationCurve:(int64_t)a13 completion:(id)a14;
- (void)_updateTranscriptChatItemsWithoutAnimation:(id)a3;
- (void)_updateTranscriptScrollIntentForContentOffset:(CGPoint)a3 reason:(id)a4;
- (void)addContentAnimationPauseReasons:(int64_t)a3;
- (void)addressBookChanged:(id)a3;
- (void)adjustTargetContentOffsetToCurrentTimeIfNeeded:(CGPoint *)a3;
- (void)associatedMessageTranscriptCellDoubleTapped:(id)a3;
- (void)associatedMessageTranscriptCellLongTouched:(id)a3;
- (void)audioBalloonDidResize:(id)a3 isExpanded:(BOOL)a4;
- (void)audioBalloonScrubberDidChangeValue:(double)a3;
- (void)audioBalloonScrubberWithRecognizer:(id)a3 didChangeValue:(double)a4;
- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4;
- (void)audioController:(id)a3 updateAudioBalloonsForTime:(double)a4 mediaObject:(id)a5;
- (void)audioControllerDidPause:(id)a3;
- (void)audioControllerDidStop:(id)a3;
- (void)audioControllerPlayingDidChange:(id)a3;
- (void)balloonView:(id)a3 carouselScrolledToIndex:(int64_t)a4;
- (void)balloonView:(id)a3 mediaObjectDidFinishPlaying:(id)a4;
- (void)balloonView:(id)a3 selectedChipAction:(id)a4;
- (void)balloonView:(id)a3 selectedSuggestedReply:(id)a4 messageGUID:(id)a5;
- (void)balloonView:(id)a3 userDidDragOutsideBalloonWithPoint:(CGPoint)a4;
- (void)balloonView:(id)a3 willInsertPluginViewAsSubview:(id)a4;
- (void)balloonViewDoubleTapped:(id)a3;
- (void)balloonViewLongTouched:(id)a3;
- (void)balloonViewSelected:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5;
- (void)balloonViewShowInlineReply:(id)a3;
- (void)balloonViewTapped:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5;
- (void)balloonViewTextViewDidChangeSelection:(id)a3 selectedText:(id)a4 textView:(id)a5;
- (void)balloonViewTitleTapped:(id)a3;
- (void)beginEmphasisWithMessageGUID:(id)a3;
- (void)beginHidingStickerWithGUIDDuringAddStickerAnimation:(id)a3;
- (void)beginPresentingChatItemForKeyboardPresentation:(id)a3 layoutAreaContentInsets:(UIEdgeInsets)a4 completion:(id)a5;
- (void)chatItemControllerDidChangeAssociatedChatItemsWithChatItemDiff:(id)a3;
- (void)chatItemControllerDidInsertAssociatedChatItems;
- (void)chatItemControllerDidSetChatItems;
- (void)chatItemsDidChange:(id)a3;
- (void)clearRecentPluginTouch;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didRecognizePanGestureWithPoint:(CGPoint)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionViewDidInset:(id)a3;
- (void)collectionViewLayout:(id)a3 sizeDidChange:(CGSize)a4;
- (void)collectionViewLayoutRestingDidChange:(id)a3;
- (void)collectionViewWillInset:(id)a3 targetContentInset:(UIEdgeInsets *)a4;
- (void)collectionViewWillProgrammaticallyScroll:(id)a3 animated:(BOOL)a4;
- (void)collectionViewWillScroll:(id)a3 targetContentOffset:(CGPoint *)a4;
- (void)configureAssociatedCell:(id)a3 forChatItem:(id)a4 atIndexPath:(id)a5;
- (void)configureCell:(id)a3 forCKChatItem:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6 animationDuration:(double)a7 animationCurve:(int64_t)a8;
- (void)configurePluginChatItemForChatItemControllerWithChatItem:(id)a3;
- (void)configureSpeakerButtonCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)configureTranscriptCell:(id)a3 hidden:(BOOL)a4;
- (void)connectivityChanged:(id)a3;
- (void)copyChatItemsToPasteboard:(id)a3;
- (void)copySelectedChatItemsToPasteboard;
- (void)cullCellSubviews;
- (void)dateCell:(id)a3 requestsPresentEditDateViewController:(id)a4;
- (void)dealloc;
- (void)deleteChatItems:(id)a3 sender:(id)a4;
- (void)deleteConversationPressedInTranscriptCell:(id)a3;
- (void)deleteSelectedChatItems:(id)a3;
- (void)deselectAllBalloons;
- (void)didAskForMoreHelp:(id)a3;
- (void)didBlockContact:(id)a3;
- (void)didBlockContacts:(id)a3;
- (void)didConfirmForInterventionViewController:(id)a3;
- (void)didLeaveConversation:(id)a3;
- (void)didPinchPhotoStackCell:(id)a3;
- (void)didShowContent:(id)a3;
- (void)didTapBlockContact;
- (void)didTapChipListFromNotificationExtensionWithBalloonView:(id)a3;
- (void)didTapCommSafetyAttributionItemWithIndexPath:(id)a3 sender:(id)a4;
- (void)didTapPendingMomentSharePhotoStackBalloonView:(id)a3;
- (void)didTapTranscriptActionButtonCell:(id)a3;
- (void)didTapUnavailableMomentShareBalloonView:(id)a3;
- (void)didTapWaysToGetHelp;
- (void)didTapWorkoutBalloonView:(id)a3 workoutData:(id)a4;
- (void)effectManager:(id)a3 didStartEffect:(id)a4;
- (void)effectManager:(id)a3 didStopEffect:(id)a4;
- (void)endHidingStickerWithGUIDDuringAddStickerAnimation:(id)a3;
- (void)endHoldingUpdatesAfterQuicklookCancelsDismiss;
- (void)endPresentingChatItemForKeyboardPresentation:(id)a3 completion:(id)a4;
- (void)enforceTranscriptScrollIntentWithAnimationProperties:(id)a3;
- (void)evidenceToReportWithContext:(id)a3 balloonView:(id)a4 completionHandler:(id)a5;
- (void)evidenceToReportWithContext:(id)a3 completionHandler:(id)a4;
- (void)evidenceToReportWithIndexPath:(id)a3 completionHandler:(id)a4;
- (void)fetchEarlierMessagesForConversation:(id)a3;
- (void)fetchRecentMessagesForConversation:(id)a3;
- (void)freezeReplyDecorationsIfNeededForCell:(id)a3;
- (void)hideTranscriptTimestampsIfNeeded;
- (void)highlightItemAtIndexPathWhenDisplayed:(id)a3 autoDismiss:(BOOL)a4;
- (void)initiateSmartEmojiResponsesUpdateWithChatItems:(id)a3;
- (void)installedAppsChanged:(id)a3;
- (void)interactionStartedFromPreviewItemControllerInBalloonView:(id)a3;
- (void)interactionStartedWithPluginBalloonView:(id)a3;
- (void)interactionStoppedFromPreviewItemControllerInBalloonView:(id)a3;
- (void)invalidateChatItemLayoutWithNewBalloonMaxWidth:(double)a3 marginInsets:(UIEdgeInsets)a4 traitCollection:(id)a5;
- (void)keyTransparencyConversationViewControllerDidComplete:(id)a3;
- (void)keyTransparencyTranscriptCellDidRequestReportToApple:(id)a3;
- (void)keyTransparencyTranscriptCellDidRequestVerification:(id)a3;
- (void)keyTransparencyTranscriptCellDidSelectIgnoreFailures:(id)a3;
- (void)keyTransparencyTranscriptCellDidSelectLearnMore:(id)a3;
- (void)launchReaderViewForBalloonView:(id)a3;
- (void)liveBalloonTouched:(id)a3;
- (void)liveViewController:(id)a3 requestPresentationStyle:(unint64_t)a4;
- (void)liveViewController:(id)a3 stagePayload:(id)a4 skipShelf:(BOOL)a5 allowAllCommits:(BOOL)a6 completionHandler:(id)a7;
- (void)liveViewController:(id)a3 stageSticker:(id)a4 skipShelf:(BOOL)a5 allowAllCommits:(BOOL)a6 completionHandler:(id)a7;
- (void)loadEarlierMessages;
- (void)loadEarlierMessagesForConversation;
- (void)loadMessagesIfNeededSkipValidation;
- (void)loadRecentMessages;
- (void)loadRecentMessagesForConversation;
- (void)loadView;
- (void)locationShareBalloonViewIgnoreButtonTapped:(id)a3;
- (void)locationShareBalloonViewShareButtonTapped:(id)a3;
- (void)locationSharingClient:(id)a3 showShareLocationMenuWithBalloonPluginView:(id)a4;
- (void)locationStringDidChange:(id)a3;
- (void)multiwayCallStateChanged:(id)a3;
- (void)parentControllerDidBecomeActive;
- (void)performResumeDeferredSetup;
- (void)photoStackBalloonView:(id)a3 didChangeCurrentAssetReference:(id)a4 isProgrammaticChange:(BOOL)a5 didChangeIndex:(BOOL)a6;
- (void)photoStackBalloonView:(id)a3 photoStack:(id)a4 didSelectAssetReference:(id)a5;
- (void)photoStackBalloonView:(id)a3 photoStackDidSelectAdditionalItems:(id)a4;
- (void)playEffectsIfNecessaryWithInsertedUnreadMessage:(id)a3 insertedLocalUnsentChatItem:(id)a4;
- (void)playFullscreenEffectIfNecessaryAutoplayingOutgoingEffect:(BOOL)a3 autoplayingIncomingEffect:(BOOL)a4 insertedUnreadMessage:(id)a5 insertedLocalUnsentChatItem:(id)a6;
- (void)playImpactEffectIfNecessaryAutoplayingOutgoingEffect:(BOOL)a3 autoplayingIncomingEffect:(BOOL)a4 impactEffectChatItem:(id)a5;
- (void)playbackSpeedDidChangeForAudioMessageBalloonView:(id)a3 playbackSpeed:(double)a4;
- (void)pluginPlaybackManagerDidStopPlayback:(id)a3;
- (void)prepareForSuspend;
- (void)prepareTextEffectsForModalPresentation;
- (void)presentHawkingPromptForChatItem:(id)a3;
- (void)presentMoreHelpMenu;
- (void)presentUserInterventionScreenForIndexPath:(id)a3 shouldTargetAssociatedItems:(BOOL)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)previewDidChange:(id)a3;
- (void)prewarmTapbackPickerImages;
- (void)printTranscript;
- (void)quickActionButtonWasTapped:(id)a3;
- (void)raiseGestureRecognized:(id)a3;
- (void)reconfigureVisibleSpeakerButtonCells;
- (void)recoverJunkPressedInTranscriptCell:(id)a3;
- (void)reloadChatItemsAtIndexes:(id)a3 animated:(BOOL)a4;
- (void)reloadChatItemsAtIndexes:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reloadData;
- (void)removeContentAnimationPauseReasons:(int64_t)a3;
- (void)removeEmphasisFromCurrentMessage;
- (void)reportJunkAlertControllerActionHandler;
- (void)repromptLastBlackholeFailureIfNotPrompted;
- (void)scrollToBottomAnimated:(BOOL)a3 withDuration:(double)a4 animationCurve:(int64_t)a5 insertedUnreadMessage:(id)a6 insertedLocalUnsentChatItem:(id)a7 withCompletion:(id)a8;
- (void)scrollToCurrentTimeAnimated:(BOOL)a3 withDuration:(double)a4 animationCurve:(int64_t)a5 withCompletion:(id)a6;
- (void)scrollTranscriptToEntryViewInsertionTimeWithAnimation:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectChatItem:(id)a3;
- (void)selectRangeWithIndexPath:(id)a3;
- (void)selectSingleBalloonView:(id)a3;
- (void)selectionManager:(id)a3 didAddChatItem:(id)a4 selectionState:(id)a5;
- (void)selectionManager:(id)a3 didRemoveChatItem:(id)a4;
- (void)sendAnimationManagerDidStopAnimation:(id)a3 context:(id)a4;
- (void)sendAnimationManagerWillStartAnimation:(id)a3 context:(id)a4;
- (void)setAllowsPluginPlayback:(BOOL)a3;
- (void)setAssociatedChatItems:(id)a3;
- (void)setAudioControllerWasPlayingBeforeScrub:(BOOL)a3;
- (void)setBalloonEmphasisManager:(id)a3;
- (void)setBalloonMaxWidth:(double)a3;
- (void)setCachedEmojiResponses:(id)a3;
- (void)setChatItemController:(id)a3;
- (void)setChatItemGUIDsOfHiddenTapbackPiles:(id)a3;
- (void)setChatItemHidden:(BOOL)a3 forChatItemGUID:(id)a4;
- (void)setChatItems:(id)a3;
- (void)setChatItems:(id)a3 removedAssociatedIndexes:(id *)a4 insertedAssociatedIndexes:(id *)a5;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewSize:(CGSize)a3;
- (void)setCompositor:(id)a3;
- (void)setContentAnimationPauseReasons:(int64_t)a3;
- (void)setConversation:(id)a3;
- (void)setCurrentEffectDecorationViews:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragInteractionDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFilterAllButFirstMessage:(BOOL)a3;
- (void)setFullscreenEffectManager:(id)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setGenerativeContextHistory:(id)a3;
- (void)setGradientReferenceView:(id)a3;
- (void)setHiddenAssociatedItems:(id)a3;
- (void)setHiddenAssociatedItemsForMessageEditing:(id)a3;
- (void)setHiddenBalloonViews:(id)a3;
- (void)setHiddenChatItemGUIDs:(id)a3;
- (void)setHiddenItems:(id)a3;
- (void)setImpactEffectManager:(id)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setIsLoadingMoreMessages:(BOOL)a3;
- (void)setIsPerformingRegenerateOrReloadOnlyUpdate:(BOOL)a3;
- (void)setIsPresentingChatItemForKeyboard:(BOOL)a3;
- (void)setLastViewWidthUsedToLayoutChatItems:(double)a3;
- (void)setLoggingTapGestureRecognizer:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setMessageEditingContext:(id)a3;
- (void)setMostRecentlyTouchedPlugin:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setPeekSampleTranslation:(CGPoint)a3;
- (void)setPeeking:(BOOL)a3;
- (void)setPlayedLastImpactEffectForTransitionFromComposing:(BOOL)a3;
- (void)setPluginPlaybackDelay:(double)a3;
- (void)setPluginPlaybackManager:(id)a3;
- (void)setPluginSnapshots:(id)a3;
- (void)setPoppedBalloonGUIDHiddenUntilNextChatItemUpdate:(id)a3;
- (void)setPresentedChatItemScrollOffset:(id)a3;
- (void)setScrollAnchor:(double)a3;
- (void)setSelectedItems:(id)a3;
- (void)setSettingChatItems:(BOOL)a3;
- (void)setShouldLoadDefaultConversationViewingMessageCountOnAppear:(BOOL)a3;
- (void)setShouldUseOpaqueMask:(BOOL)a3;
- (void)setSizedFullTranscript:(BOOL)a3;
- (void)setSnapshotOfPluginBeingReplacedByBreadcrumb:(id)a3;
- (void)setSpeakerTransferGUID:(id)a3;
- (void)setStateCaptureAssistant:(id)a3;
- (void)setStickerGUIDsHiddenDuringStickerAddAnimation:(id)a3;
- (void)setTextEffectCoordinatorPaused:(BOOL)a3 reason:(id)a4;
- (void)setTextEffectsState:(id)a3;
- (void)setTopEffectView:(id)a3;
- (void)setTranscriptBecameVisibleTimestamp:(id)a3;
- (void)setTranscriptIdentifier:(id)a3;
- (void)setTranscriptTextEffectCoordinator:(id)a3;
- (void)setTranscriptUpdateAnimated:(BOOL)a3;
- (void)setTranscriptUpdateCompletion:(id)a3;
- (void)setTransitionedFromComposing:(BOOL)a3;
- (void)setTransitioningFromComposing:(BOOL)a3;
- (void)setUpdateAnimationGroup:(id)a3;
- (void)showGridForChatItem:(id)a3;
- (void)showTranscriptTimestamps;
- (void)sizeFullTranscriptIfNecessary;
- (void)snapshotDidChange:(id)a3;
- (void)startFullscreenEffectIfNeededForChatItem:(id)a3;
- (void)startPluginPlaybackAfterDelay:(double)a3;
- (void)stopFullscreenEffect;
- (void)stopPlayingAudio;
- (void)stopPluginPlayback;
- (void)textEffectCoordinator:(id)a3 didChangeStateOfAnimator:(id)a4 textView:(id)a5;
- (void)textEffectCoordinator:(id)a3 willRequestAnimatorUsing:(id)a4;
- (void)textEffectsEndTransitionSetReady;
- (void)touchUpInsideCellFailureButton:(id)a3;
- (void)touchUpInsideCellReportSpamButton:(id)a3;
- (void)touchUpInsideCellSpeakerButton:(id)a3;
- (void)touchUpInsideCellStampButton:(id)a3;
- (void)touchUpInsideCellStatusButton:(id)a3;
- (void)touchUpInsideNotifyAnywayButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transcriptBalloonCell:(id)a3 didChangeRenderBoundsOfTextBalloonView:(id)a4;
- (void)transcriptBalloonCell:(id)a3 didEndBalloonSwipeWithDelta:(double)a4 swipeVelocity:(CGPoint)a5;
- (void)transcriptBalloonCell:(id)a3 didTranslateBalloonByDelta:(double)a4;
- (void)transcriptBalloonCell:(id)a3 textBalloonView:(id)a4 didChangeTextEffectPlaybackCandidateStatus:(BOOL)a5;
- (void)transcriptCollectionView:(id)a3 shouldScrollToHighlightedMessage:(id)a4;
- (void)transcriptCollectionViewNeedsScrollIntentEnforced:(id)a3 withAnimationProperties:(id)a4;
- (void)transferRestored:(id)a3;
- (void)transferUpdated:(id)a3;
- (void)tuConversationBalloonJoinButtonTapped:(id)a3;
- (void)unloadCachedSizeAndReloadChatItemAtIndexPath:(id)a3;
- (void)updateAnimationPaused;
- (void)updateAssociatedItem:(id)a3 hidden:(BOOL)a4;
- (void)updateBalloonEmphasisIfNeededWithCell:(id)a3 chatItem:(id)a4;
- (void)updateEffectViewMessageRects;
- (void)updateEmphasis;
- (void)updateLastAddressedHandleID:(id)a3 lastAddressedSIMID:(id)a4;
- (void)updateScrollIntentWithTrigger:(id)a3 activeKeyboardAppearanceAnimationProperties:(id)a4;
- (void)updateTargetAlphaForVisibleChatItems;
- (void)updateTextEffectsState:(id)a3;
- (void)updateTranscript:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)updateTranscriptChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 reload:(id)a6 regenerate:(id)a7 animated:(BOOL)a8 checkFiltered:(BOOL)a9 completion:(id)a10;
- (void)updateTranscriptChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 reload:(id)a6 regenerate:(id)a7 animated:(BOOL)a8 completion:(id)a9;
- (void)updateTranscriptScrollIntentForSendAnimationContext:(id)a3;
- (void)updateTranscriptScrollIntentForUserScrollToContentOffset:(CGPoint)a3;
- (void)updateTranscriptScrollIntentToBottomOrHistoryBasedOnCurrentContentOffset;
- (void)verticallyScrollTranscriptByAmount:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)verticallyScrollTranscriptByAmount:(double)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidAppearDeferredSetup;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKTranscriptCollectionViewController

- (id)dataSourceWithCollectionView:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F42880]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__CKTranscriptCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke;
  v8[3] = &unk_1E5621D78;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  v6 = (void *)[v5 initWithCollectionView:v4 cellProvider:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

id __81__CKTranscriptCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  v10 = objc_msgSend(*(id *)(a1 + 32), "_ckChatItemWithGUID:inSection:", v7, objc_msgSend(v8, "section"));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = [WeakRetained collectionView:v9 cellForCKChatItem:v10 atIndexPath:v8];

  return v12;
}

- (id)generateSnapshotForCKChatItems:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CKTranscriptCollectionViewController logHandle];
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = +[CKTranscriptCollectionViewController logHandle];
  id v7 = v6;
  unint64_t v39 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "generateTranscriptSnapshot", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;

  id v40 = objc_alloc_init(MEMORY[0x1E4F42650]);
  [v40 appendSectionsWithIdentifiers:&unk_1EDF15128];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "IMChatItem", spid);
        v15 = [v14 guid];
        [v8 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v11);
  }

  v16 = (void *)[v8 copy];
  [v40 appendItemsWithIdentifiers:v16];

  [v40 appendSectionsWithIdentifiers:&unk_1EDF15140];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v9;
  uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v49;
    uint64_t v41 = *(void *)v49;
    do
    {
      uint64_t v21 = 0;
      uint64_t v42 = v19;
      do
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * v21), "IMChatItem", spid);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v8;
          id v24 = v22;
          v25 = [v24 visibleAssociatedMessageChatItems];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v57 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v45 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = [*(id *)(*((void *)&v44 + 1) + 8 * j) guid];
                [v17 addObject:v30];
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v57 count:16];
            }
            while (v27);
          }
          v31 = [v24 messageHighlightChatItem];
          v32 = v31;
          if (v31)
          {
            v33 = [v31 guid];
            [v17 addObject:v33];
          }
          id v8 = v23;
          uint64_t v20 = v41;
          uint64_t v19 = v42;
        }

        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v19);
  }

  v34 = (void *)[v17 copy];
  [v40 appendItemsWithIdentifiers:v34];

  v35 = +[CKTranscriptCollectionViewController logHandle];
  v36 = v35;
  if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v36, OS_SIGNPOST_INTERVAL_END, spid, "generateTranscriptSnapshot", "", buf, 2u);
  }

  return v40;
}

- (id)_ckChatItemWithGUID:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    goto LABEL_5;
  }
  if (!a4)
  {
    id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
LABEL_5:
    id v8 = v7;
    id v9 = objc_msgSend(v7, "__ck_chatItemWithGUID:", v6);

    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

+ (id)logHandle
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)logHandle_sLogHandle;

  return v2;
}

void __61__CKTranscriptCollectionViewController_DataSource__logHandle__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Messages", "Transcript");
  v1 = (void *)logHandle_sLogHandle;
  logHandle_sLogHandle = (uint64_t)v0;
}

- (id)logHandle
{
  v2 = objc_opt_class();

  return (id)[v2 logHandle];
}

+ (CGSize)defaultCollectionViewSize
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)imChatItems
{
  v2 = [(CKTranscriptCollectionViewController *)self chat];
  double v3 = [v2 chatItems];

  return v3;
}

- (NSArray)chatItems
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isConsolidatedChatItemsEnabled];

  if (!v4)
  {
    double v6 = self->_chatItems;
    goto LABEL_15;
  }
  if ([(CKTranscriptCollectionViewController *)self isViewLoaded])
  {
    if (self->_chatItemController)
    {
      double v5 = [(CKTranscriptCollectionViewController *)self chatItemController];
      double v6 = [v5 chatItems];

      goto LABEL_15;
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_14;
    }
    double v7 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v11 = 0;
    double v8 = "Accessing -[CKTranscriptCollectionViewController chatItems] with consolidated chat items enabled = YES but with"
         "out actually having a chatItemController. This not supported and indicates a programmer error. Returning an emp"
         "ty array as a fallback.";
    id v9 = (uint8_t *)&v11;
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      goto LABEL_14;
    }
    __int16 v12 = 0;
    double v8 = "Accessing -[CKTranscriptCollectionViewController chatItems] with consolidated chat items enabled = YES is not s"
         "upported before the view is actually loaded. This is a programmer error. Returning an empty array as a fallback"
         ". Please check why you are accessing the chat items that early.";
    id v9 = (uint8_t *)&v12;
LABEL_12:
    _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
    goto LABEL_13;
  }
LABEL_14:
  double v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
LABEL_15:

  return v6;
}

- (NSArray)associatedChatItems
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isConsolidatedChatItemsEnabled];

  if (!v4)
  {
    double v6 = self->_associatedChatItems;
    goto LABEL_15;
  }
  if ([(CKTranscriptCollectionViewController *)self isViewLoaded])
  {
    if (self->_chatItemController)
    {
      double v5 = [(CKTranscriptCollectionViewController *)self chatItemController];
      double v6 = [v5 associatedChatItems];

      goto LABEL_15;
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_14;
    }
    double v7 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v11 = 0;
    double v8 = "Accessing -[CKTranscriptCollectionViewController associatedChatItems] with consolidated chat items enabled = YE"
         "S but without actually having a chatItemController. This not supported and indicates a programmer error. Return"
         "ing an empty array as a fallback.";
    id v9 = (uint8_t *)&v11;
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      goto LABEL_14;
    }
    __int16 v12 = 0;
    double v8 = "Accessing -[CKTranscriptCollectionViewController associatedChatItems] with consolidated chat items enabled = YE"
         "S is not supported before the view is actually loaded. This is a programmer error. Returning an empty array as "
         "a fallback. Please check why you are accessing the chat items that early.";
    id v9 = (uint8_t *)&v12;
LABEL_12:
    _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
    goto LABEL_13;
  }
LABEL_14:
  double v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
LABEL_15:

  return v6;
}

- (NSString)transcriptIdentifier
{
  transcriptIdentifier = self->_transcriptIdentifier;
  if (!transcriptIdentifier)
  {
    int v4 = [MEMORY[0x1E4F29128] UUID];
    double v5 = [v4 UUIDString];
    double v6 = self->_transcriptIdentifier;
    self->_transcriptIdentifier = v5;

    transcriptIdentifier = self->_transcriptIdentifier;
  }

  return transcriptIdentifier;
}

- (CKBalloonEmphasisManager)balloonEmphasisManager
{
  balloonEmphasisManager = self->_balloonEmphasisManager;
  if (!balloonEmphasisManager)
  {
    int v4 = (CKBalloonEmphasisManager *)objc_opt_new();
    double v5 = self->_balloonEmphasisManager;
    self->_balloonEmphasisManager = v4;

    balloonEmphasisManager = self->_balloonEmphasisManager;
  }

  return balloonEmphasisManager;
}

- (void)dealloc
{
  double v3 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  [v3 invalidateDisplayLink];

  IMIsRunningInUnitTesting();
  [(CKTranscriptCollectionViewController *)self _releaseActiveBalloonControllers];
  int v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v5 = [v4 isBackgroundAudioMessagesEnabled];

  if ((v5 & 1) == 0)
  {
    double v6 = +[CKAppAudioController sharedInstance];
    double v7 = [v6 audioController];
    [v7 stop];

    double v8 = +[CKAppAudioController sharedInstance];
    id v9 = [v8 audioController];
    [v9 setDelegate:0];
  }
  uint64_t v10 = [(CKConversation *)self->_conversation chat];
  [v10 endHoldingChatItemsUpdatesForAllReasons];
  [(CKTranscriptCollectionView *)self->_collectionView setDelegate:0];
  [(CKTranscriptCollectionView *)self->_collectionView setDataSource:0];
  [(CKImpactEffectManager *)self->_impactEffectManager setDelegate:0];

  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKTranscriptCollectionViewController *)&v11 dealloc];
}

- (void)loadView
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v4 = IMLogHandleForCategory();
  char v5 = (void *)os_signpost_id_generate(v4);
  id v6 = objc_alloc(MEMORY[0x1E4F77E98]);
  double v7 = [(CKTranscriptCollectionViewController *)self conversation];
  double v8 = (void *)[v6 initWithLayoutContext:1 datasource:v7];

  [v8 setDelegate:self];
  [(CKTranscriptCollectionViewController *)self setCompositor:v8];
  id location = 0;
  objc_initWeak(&location, self);
  id v9 = [CKTranscriptCompositionalLayout alloc];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __48__CKTranscriptCollectionViewController_loadView__block_invoke;
  v41[3] = &unk_1E56270E8;
  uint64_t v10 = v4;
  uint64_t v42 = v10;
  v43[1] = v5;
  objc_copyWeak(v43, &location);
  objc_super v11 = [(CKTranscriptCompositionalLayout *)v9 initWithSectionProvider:v41];
  __int16 v12 = [(CKTranscriptCollectionViewController *)self chat];
  -[CKTranscriptCompositionalLayout setChatStyle:](v11, "setChatStyle:", [v12 chatStyle]);

  [(CKTranscriptCollectionViewController *)self collectionViewSize];
  double v14 = v13;
  [(CKTranscriptCollectionViewController *)self collectionViewSize];
  v16 = -[CKTranscriptCollectionView initWithFrame:collectionViewLayout:]([CKTranscriptCollectionView alloc], "initWithFrame:collectionViewLayout:", v11, 0.0, 0.0, v14, v15);
  id v17 = [(CKTranscriptCollectionViewController *)self compositor];

  if (v17)
  {
    uint64_t v18 = [(CKTranscriptCollectionViewController *)self compositor];
    [v18 setCollectionView:v16];
  }
  [(CKTranscriptCollectionView *)v16 setAutoresizingMask:18];
  uint64_t v19 = [(CKTranscriptCollectionViewController *)self transcriptBackgroundColor];
  [(CKTranscriptCollectionView *)v16 setBackgroundColor:v19];

  if (CKIsRunningInMessagesNotificationExtension())
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v21 = [(CKTranscriptCollectionViewController *)self conversation];
    v22 = [v21 handles];
    BOOL v23 = [v22 count] != 0;

    uint64_t v20 = 2 * v23;
  }
  [(CKTranscriptCollectionView *)v16 setKeyboardDismissMode:v20];
  id v24 = +[CKUIBehavior sharedBehaviors];
  -[CKTranscriptCollectionView setContentInsetAdjustmentBehavior:](v16, "setContentInsetAdjustmentBehavior:", [v24 transcriptContentInsetBehavior]);

  [(CKTranscriptCollectionView *)v16 setUpdateInsetBottomDuringKeyboardDismiss:1];
  [(CKTranscriptCollectionView *)v16 setAlwaysBounceVertical:1];
  [(CKTranscriptCollectionView *)v16 setAlwaysBounceHorizontal:[(CKTranscriptCollectionViewController *)self wantsDrawerLayout]];
  [(CKTranscriptCollectionView *)v16 setShowsHorizontalScrollIndicator:0];
  [(CKTranscriptCollectionView *)v16 setAutomaticallyAdjustsScrollIndicatorInsets:0];
  [(CKTranscriptCollectionView *)v16 _setAllowsVisibleCellUpdatesDuringUpdateAnimations:1];
  v25 = +[CKUIBehavior sharedBehaviors];
  uint64_t v26 = [v25 theme];
  -[CKTranscriptCollectionView setIndicatorStyle:](v16, "setIndicatorStyle:", [v26 scrollIndicatorStyle]);

  uint64_t v27 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v26) = [v27 isDiffableTranscriptDataSourceEnabled];

  if (v26)
  {
    uint64_t v28 = [(CKTranscriptCollectionViewController *)self dataSourceWithCollectionView:v16];
    [(CKTranscriptCollectionViewController *)self setDataSource:v28];
    [(CKTranscriptCollectionView *)v16 setDataSource:v28];
  }
  else
  {
    [(CKTranscriptCollectionView *)v16 setDataSource:self];
  }
  [(CKTranscriptCollectionView *)v16 setDelegate:self];
  v29 = +[CKUIBehavior sharedBehaviors];
  int v30 = [v29 forceMinTranscriptMarginInsets];
  if (v30)
  {
    v2 = +[CKUIBehavior sharedBehaviors];
    [v2 minTranscriptMarginInsets];
  }
  else
  {
    [(CKTranscriptCollectionViewController *)self marginInsets];
  }
  -[CKEditableCollectionView setMarginInsets:](v16, "setMarginInsets:");
  if (v30) {

  }
  [(CKTranscriptCollectionView *)v16 setAccessibilityIdentifier:@"TranscriptCollectionView"];
  v31 = +[CKUIBehavior sharedBehaviors];
  int v32 = [v31 isSizeConstrained];

  if (v32) {
    [(CKTranscriptCollectionView *)v16 setShowsVerticalScrollIndicator:0];
  }
  [(CKTranscriptCollectionViewController *)self setView:v16];
  [(CKTranscriptCollectionViewController *)self setCollectionView:v16];
  v33 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v34 = [v33 isDiffableTranscriptDataSourceEnabled];

  if (v34)
  {
    v35 = [(CKTranscriptCollectionViewController *)self chatItems];
    BOOL v36 = [v35 count] == 0;

    if (!v36)
    {
      v37 = [(CKTranscriptCollectionViewController *)self chatItems];
      [(CKTranscriptCollectionViewController *)self _updateTranscriptChatItemsWithoutAnimation:v37];
    }
  }
  if (IMOSLoggingEnabled())
  {
    v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      int v40 = _AXSReduceMotionAutoplayMessagesEffectsEnabled();
      *(_DWORD *)buf = 67109376;
      BOOL v46 = IsReduceMotionEnabled;
      __int16 v47 = 1024;
      int v48 = v40;
      _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "AutoPlayback allowed? ReduceMotionEnabled:%d - AutoplayEffectsEnabled:%d", buf, 0xEu);
    }
  }
  objc_destroyWeak(v43);

  objc_destroyWeak(&location);
}

id __48__CKTranscriptCollectionViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  double v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v18 = 134217984;
    uint64_t v19 = a2;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "layoutSectionProvider", "Section %ld", (uint8_t *)&v18, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = [WeakRetained compositor];
  objc_super v11 = [v10 layoutSectionForSection:a2 layoutEnvironment:v5];

  __int16 v12 = *(id *)(a1 + 32);
  double v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 48);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v18 = 134217984;
    uint64_t v19 = a2;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v13, OS_SIGNPOST_INTERVAL_END, v14, "layoutSectionProvider", "Section %ld", (uint8_t *)&v18, 0xCu);
  }

  if (!v11 && IMOSLoggingEnabled())
  {
    double v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [NSNumber numberWithInteger:a2];
      int v18 = 138412290;
      uint64_t v19 = v16;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "CKTranscriptCollectionViewController - Got nil layoutSection for %@, invalid state!", (uint8_t *)&v18, 0xCu);
    }
  }

  return v11;
}

- (void)viewDidLoad
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKTranscriptCollectionViewController *)&v14 viewDidLoad];
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (v4)
  {
    v15[0] = objc_opt_class();
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v6 = (id)[(CKTranscriptCollectionViewController *)self registerForTraitChanges:v5 withHandler:&__block_literal_global_99];
  }
  double v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isConsolidatedChatItemsEnabled];

  if (v8)
  {
    id v9 = [(CKTranscriptCollectionViewController *)self imChatItems];
    id v10 = [(CKTranscriptCollectionViewController *)self newChatItemsWithIMChatItems:v9];

    objc_super v11 = [CKChatItemController alloc];
    __int16 v12 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v13 = [(CKChatItemController *)v11 initForCollectionView:v12 chatItems:v10 delegate:self];

    [(CKTranscriptCollectionViewController *)self setChatItemController:v13];
  }
}

void __51__CKTranscriptCollectionViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 transcriptTextEffectCoordinator];
  [v2 updateWithReason:@"UITraitActiveAppearance trait did change"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v24 viewWillAppear:a3];
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  [(CKTranscriptCollectionViewController *)self setTranscriptBecameVisibleTimestamp:v4];

  +[CKAssociatedStickerChatItem clearTranscriptDisplayCaches];
  id v5 = [(CKTranscriptCollectionViewController *)self chat];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke;
  v22[3] = &unk_1E5620C40;
  id v6 = v5;
  id v23 = v6;
  [(CKTranscriptCollectionViewController *)self updateTranscript:v22 animated:0 completion:0];
  double v7 = [(CKTranscriptCollectionViewController *)self collectionView];
  int v8 = [v6 chatIdentifier];
  [v7 configureAppEntityForConversationId:v8];

  if ([(CKTranscriptCollectionViewController *)self shouldLoadDefaultConversationViewingMessageCountOnAppear])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_2;
    aBlock[3] = &unk_1E5621550;
    aBlock[4] = self;
    id v9 = _Block_copy(aBlock);
    id v10 = [(CKTranscriptCollectionViewController *)self transitionCoordinator];
    objc_super v11 = v10;
    if (v10)
    {
      [v10 animateAlongsideTransition:0 completion:v9];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_5;
      block[3] = &unk_1E5620F48;
      id v20 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  id v12 = objc_alloc(MEMORY[0x1E4F6EA48]);
  id v13 = (void *)[v12 initWithObject:self title:@"CKTranscriptCollectionViewController-Visible" queue:MEMORY[0x1E4F14428]];
  [(CKTranscriptCollectionViewController *)self setStateCaptureAssistant:v13];

  objc_super v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isFindMyNavBarEnabled];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    id v17 = [(CKTranscriptCollectionViewController *)self conversation];
    int v18 = [v17 chat];
    [v16 startTrackingLocationForChat:v18];
  }
}

uint64_t __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateChatItemsSynchronouslyIfAsyncUpdateIsPending];
}

uint64_t __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_3;
  v4[3] = &unk_1E5620C40;
  v4[4] = v3;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_4;
  v2[3] = &unk_1E5620C40;
  return [v3 updateTranscript:v4 animated:0 completion:v2];
}

void __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  v1 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v2, "setLoadedMessageCount:", objc_msgSend(v1, "defaultConversationViewingMessageCount"));
}

void __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_4(uint64_t a1)
{
  id v5 = +[CKScrollViewAnimationProperties unanimated];
  id v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 scrollToBottomStopsAtTopOfLastBubble];

  int v4 = *(void **)(a1 + 32);
  if (v3) {
    [v4 scrollToTopOfLastBubbleCellWithAnimationProperties:v5];
  }
  else {
    [v4 scrollTranscriptToEntryViewInsertionTimeWithAnimation:0];
  }
}

uint64_t __55__CKTranscriptCollectionViewController_viewWillAppear___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v18 viewWillDisappear:a3];
  int v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v5 = [v4 isBackgroundAudioMessagesEnabled];

  if ((v5 & 1) == 0)
  {
    id v6 = +[CKAppAudioController sharedInstance];
    double v7 = [v6 audioController];
    [v7 stop];
  }
  int v8 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v8 beginHoldingUpdatesForKey:@"CKFullscreenUpdatesDisappeared"];

  id v9 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v9 stopFullscreenEffect];

  id v10 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
  [v10 stopAllEffects];

  objc_super v11 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
  [v11 setIsDisabled:1];

  [(CKTranscriptCollectionViewController *)self addContentAnimationPauseReasons:8];
  [(CKTranscriptCollectionViewController *)self _tearDownLiveBubbles];
  id v12 = [(CKTranscriptCollectionViewController *)self stateCaptureAssistant];
  [v12 deregister];

  [(CKTranscriptCollectionViewController *)self setStateCaptureAssistant:0];
  [(CKTranscriptCollectionViewController *)self setTranscriptBecameVisibleTimestamp:0];
  +[CKAssociatedStickerChatItem clearTranscriptDisplayCaches];
  id v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isFindMyNavBarEnabled];

  if (v14)
  {
    int v15 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    v16 = [(CKTranscriptCollectionViewController *)self conversation];
    id v17 = [v16 chat];
    [v15 stopTrackingLocationForChat:v17];
  }
}

- (BOOL)shouldEndShowingEditHistoryOnViewDisappearance
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v6 viewDidDisappear:a3];
  if ([(CKTranscriptCollectionViewController *)self shouldEndShowingEditHistoryOnViewDisappearance])
  {
    int v4 = [(CKTranscriptCollectionViewController *)self chat];
    [v4 endShowingEditHistoryForAllChatItems];
  }
  char v5 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  [v5 invalidateDisplayLink];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKTranscriptCollectionViewController *)&v13 viewDidLayoutSubviews];
  int v3 = [(CKTranscriptCollectionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  [(CKTranscriptCollectionViewController *)self lastViewWidthUsedToLayoutChatItems];
  BOOL v7 = CKFloatApproximatelyEqualToFloatWithTolerance(v5, v6, 0.00000999999975);

  if (!v7)
  {
    [(CKTranscriptCollectionViewController *)self _requestChatItemLayoutInvalidation];
    int v8 = [(CKTranscriptCollectionViewController *)self view];
    [v8 bounds];
    [(CKTranscriptCollectionViewController *)self setLastViewWidthUsedToLayoutChatItems:v9];
  }
  [(CKTranscriptCollectionViewController *)self updateEffectViewMessageRects];
  id v10 = [(CKTranscriptCollectionViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CKTranscriptCollectionViewController *)self delegate];
    [v12 viewDidLayoutSubviewsForTranscriptCollectionViewController:self];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = self;
  char v11 = [(CKTranscriptCollectionViewController *)v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0
    || ([(CKTranscriptCollectionViewController *)v10 delegate],
        objc_super v13 = objc_claimAutoreleasedReturnValue(),
        [v13 viewControllerForAlertPresentationFromTranscriptCollectionViewController:v10],
        int v14 = (CKTranscriptCollectionViewController *)objc_claimAutoreleasedReturnValue(),
        v10,
        v13,
        v14 == v10))
  {
    v15.receiver = v10;
    v15.super_class = (Class)CKTranscriptCollectionViewController;
    [(CKTranscriptCollectionViewController *)&v15 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    [(CKTranscriptCollectionViewController *)v14 presentViewController:v8 animated:v6 completion:v9];
    id v10 = v14;
  }
}

- (id)transcriptBackgroundColor
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 theme];
  double v4 = [v3 transcriptBackgroundColor];

  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKTranscriptCollectionViewController;
  -[CKTranscriptCollectionViewController setEditing:animated:](&v16, sel_setEditing_animated_);
  BOOL v7 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v7 setAllowsSelection:v5];
  [v7 setAllowsMultipleSelection:v5];
  objc_msgSend(v7, "_ck_setEditing:animated:", v5, v4);
  objc_msgSend(v7, "setAlwaysBounceHorizontal:", -[CKTranscriptCollectionViewController wantsDrawerLayout](self, "wantsDrawerLayout"));
  if (v5)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v9 = [(CKTranscriptCollectionViewController *)self chatItems];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__CKTranscriptCollectionViewController_setEditing_animated___block_invoke;
    v14[3] = &unk_1E56255D8;
    id v15 = v8;
    id v10 = v8;
    [v9 enumerateObjectsUsingBlock:v14];

    [(CKTranscriptCollectionViewController *)self setHiddenItems:v10];
    char v11 = +[CKAppAudioController sharedInstance];
    char v12 = [v11 audioController];
    [v12 stop];
  }
  else
  {
    objc_super v13 = objc_opt_new();
    [(CKTranscriptCollectionViewController *)self setHiddenItems:v13];

    id v10 = [(CKTranscriptCollectionViewController *)self selectionManager];
    [v10 removeAllSelectedMessageGuids];
  }
}

void __60__CKTranscriptCollectionViewController_setEditing_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 itemIsReplyCount] & 1) == 0) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(CKTranscriptCollectionViewController *)self chat];
  id v9 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  id v10 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v8 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B970]];
  [v10 beginDisablingTranscriptDynamicsForReason:@"Rotation"];
  [v9 setUseInitialLayoutAttributesForRotation:1];
  objc_msgSend(v9, "setSizeForRotation:", width, height);
  v18.receiver = self;
  v18.super_class = (Class)CKTranscriptCollectionViewController;
  -[CKTranscriptCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__CKTranscriptCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E5627130;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [v7 animateAlongsideTransition:0 completion:v14];
}

uint64_t __91__CKTranscriptCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(id *a1)
{
  [a1[4] endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B970]];
  [a1[5] endDisablingTranscriptDynamicsForReason:@"Rotation"];
  [a1[6] setUseInitialLayoutAttributesForRotation:0];
  id v2 = a1[6];
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  return objc_msgSend(v2, "setSizeForRotation:", v3, v4);
}

- (double)_fullMaxWidth
{
  id v2 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v2 bounds];
  double v4 = v3;
  [v2 marginInsets];
  double v7 = v4 - (v5 + v6);

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_canUseOpaqueMask
{
  double v3 = [(CKTranscriptCollectionViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(CKTranscriptCollectionViewController *)self delegate];
    char v5 = [v4 transcriptCollectionViewControllerShouldForceOpaqueMask:self];

    if (v5) {
      return 0;
    }
  }
  else
  {
  }
  double v7 = +[CKUIBehavior sharedBehaviors];
  char v8 = [v7 transcriptCanUseOpaqueMask];

  return v8;
}

- (void)parentControllerDidBecomeActive
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v7 parentControllerDidBecomeActive];
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (v4) {
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator updateWithReason:@"potentially start a new animation because parentControllerDidBecomeActive"];
  }
  char v5 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
  [v5 setIsDisabled:0];

  double v6 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v6 endHoldingUpdatesForKey:@"CKFullscreenUpdatesAppSuspension"];

  [(CKTranscriptCollectionViewController *)self setAllowsPluginPlayback:1];
  [(CKTranscriptCollectionViewController *)self pluginPlaybackDelay];
  -[CKTranscriptCollectionViewController startPluginPlaybackAfterDelay:](self, "startPluginPlaybackAfterDelay:");
}

- (void)prepareForSuspend
{
  v10.receiver = self;
  v10.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v10 prepareForSuspend];
  double v3 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  [v3 invalidateDisplayLink];

  int v4 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  uint64_t v5 = [v4 currentEffect];
  [(id)v5 stopSoundEffect];

  double v6 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v6 beginHoldingUpdatesForKey:@"CKFullscreenUpdatesAppSuspension"];

  objc_super v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LOBYTE(v5) = [v7 isBackgroundAudioMessagesEnabled];

  if ((v5 & 1) == 0)
  {
    char v8 = +[CKAppAudioController sharedInstance];
    id v9 = [v8 audioController];
    [v9 stop];
  }
  [(CKTranscriptCollectionViewController *)self setAllowsPluginPlayback:0];
  [(CKTranscriptCollectionViewController *)self stopPluginPlayback];
  [(CKTranscriptCollectionViewController *)self _tearDownLiveBubbles];
}

- (void)performResumeDeferredSetup
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v19 performResumeDeferredSetup];
  double v3 = +[CKPreviewDispatchCache genmojiPreviewCache];
  [v3 resume];

  int v4 = +[CKPreviewDispatchCache transcriptPreviewCache];
  [v4 resume];

  uint64_t v5 = +[CKPreviewDispatchCache snapshotCache];
  [v5 resume];

  double v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  objc_super v7 = (void *)[v6 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v14 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
          [v13 performHostAppResumeWithContext:v14];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v13 viewDidAppear:a3];
  int v4 = +[CKUIBehavior sharedBehaviors];
  char v5 = [v4 shouldSizeInitialViewingMessageCount];

  if ((v5 & 1) == 0)
  {
    double v6 = [(CKTranscriptCollectionViewController *)self collectionView];
    int v7 = [v6 isUserInteractionEnabled];

    if (v7)
    {
      id v8 = [(CKTranscriptCollectionViewController *)self collectionView];
      [v8 flashScrollIndicators];
    }
  }
  [(CKTranscriptCollectionViewController *)self removeContentAnimationPauseReasons:8];
  uint64_t v9 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v9 endHoldingUpdatesForKey:@"CKFullscreenUpdatesDisappeared"];

  uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isExpressiveTextEnabled];

  if (v11)
  {
    uint64_t v12 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
    [v12 updateWithReason:@"viewDidAppear"];
  }
}

- (void)viewDidAppearDeferredSetup
{
  v16.receiver = self;
  v16.super_class = (Class)CKTranscriptCollectionViewController;
  [(CKViewController *)&v16 viewDidAppearDeferredSetup];
  [(CKTranscriptCollectionViewController *)self sizeFullTranscriptIfNecessary];
  double v3 = +[CKPreviewDispatchCache genmojiPreviewCache];
  [v3 resume];

  int v4 = +[CKPreviewDispatchCache transcriptPreviewCache];
  [v4 resume];

  char v5 = +[CKPreviewDispatchCache snapshotCache];
  [v5 resume];

  if ([(CKTranscriptCollectionViewController *)self _allowsEffectAutoPlayback])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__CKTranscriptCollectionViewController_viewDidAppearDeferredSetup__block_invoke;
    block[3] = &unk_1E5620C40;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  [(CKTranscriptCollectionViewController *)self setAllowsPluginPlayback:1];
  [(CKTranscriptCollectionViewController *)self pluginPlaybackDelay];
  -[CKTranscriptCollectionViewController startPluginPlaybackAfterDelay:](self, "startPluginPlaybackAfterDelay:");
  [(CKTranscriptCollectionViewController *)self _prewarmBalloonControllers];
  [(CKTranscriptCollectionViewController *)self _prewarmMediaPreviews];
  [(CKTranscriptCollectionViewController *)self _prewarmLinkPresentations];
  [(CKTranscriptCollectionViewController *)self _prewarmTranscriptAssetsIfNecessary];
  if ([MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled]) {
    [(CKTranscriptCollectionViewController *)self repromptLastBlackholeFailureIfNotPrompted];
  }
  double v6 = [MEMORY[0x1E4F42738] sharedApplication];
  int v7 = v6;
  if (!__CurrentTestName) {
    goto LABEL_8;
  }
  id v8 = [v6 _launchTestName];
  if (![v7 isRunningTest:v8])
  {
LABEL_9:

    goto LABEL_10;
  }
  int v9 = [v7 shouldRecordExtendedLaunchTime];

  if (v9)
  {
LABEL_8:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__CKTranscriptCollectionViewController_viewDidAppearDeferredSetup__block_invoke_2;
    v13[3] = &unk_1E5620C40;
    id v14 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v13);
    id v8 = v14;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isExpressiveTextEnabled];

  if (v11
    && [(CKTranscriptCollectionViewController *)self _shouldMakeTextEffectStateReadyInViewDidAppearDeferredSetup])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__CKTranscriptCollectionViewController_viewDidAppearDeferredSetup__block_invoke_3;
    v12[3] = &unk_1E5620C40;
    v12[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

uint64_t __66__CKTranscriptCollectionViewController_viewDidAppearDeferredSetup__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) impactEffectManager];
  [v2 setIsDisabled:0];

  double v3 = *(void **)(a1 + 32);

  return [v3 _replayLastImpactEffectIfNotFromMe];
}

void __66__CKTranscriptCollectionViewController_viewDidAppearDeferredSetup__block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  id v2 = [*(id *)(a1 + 32) _launchTestName];
  [v3 finishedTest:v2 extraResults:0];
}

uint64_t __66__CKTranscriptCollectionViewController_viewDidAppearDeferredSetup__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTextEffectsState:&__block_literal_global_384];
}

uint64_t __66__CKTranscriptCollectionViewController_viewDidAppearDeferredSetup__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setIsReady:1];
}

- (void)_prewarmTranscriptAssetsIfNecessary
{
  if (CKIsRunningInMessages()
    || CKIsRunningInCarousel()
    || CKIsRunningInMessagesNotificationExtension() && (IMSharedHelperIsOlderDevice() & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v4 = [v3 isEmojiTapbacksEnabled];

    if (v4)
    {
      [(CKTranscriptCollectionViewController *)self prewarmTapbackPickerImages];
    }
    else
    {
      id v5 = +[CKUIBehavior sharedBehaviors];
      [v5 prewarmAcknowledgementsImage];
    }
  }
}

+ (id)chatItemsDidChangeNotification
{
  return (id)*MEMORY[0x1E4F6B8D8];
}

- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  id v13 = a4;
  id v14 = a3;
  [(id)objc_opt_class() defaultCollectionViewSize];
  long long v17 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:](self, "initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:", v14, v13, MEMORY[0x1E4F1CBF0], a5, top, left, bottom, right, v15, v16);

  return v17;
}

- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6 collectionViewSize:(CGSize)a7
{
  return -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:](self, "initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:", a3, a4, MEMORY[0x1E4F1CBF0], a5, a6.top, a6.left, a6.bottom, a6.right, a7.width, a7.height);
}

- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7
{
  double right = a7.right;
  double bottom = a7.bottom;
  double left = a7.left;
  double top = a7.top;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  [(id)objc_opt_class() defaultCollectionViewSize];
  id v20 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:](self, "initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:", v17, v16, v15, a6, top, left, bottom, right, v18, v19);

  return v20;
}

- (CKTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  double right = a7.right;
  double bottom = a7.bottom;
  double left = a7.left;
  double top = a7.top;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v62.receiver = self;
  v62.super_class = (Class)CKTranscriptCollectionViewController;
  uint64_t v21 = [(CKTranscriptCollectionViewController *)&v62 initWithNibName:0 bundle:0];
  if (!v21) {
    goto LABEL_25;
  }
  id v59 = v20;
  v22 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v23 = [v22 isExpressiveTextEnabled];

  if (v23)
  {
    objc_super v24 = [v18 chat];
    int v25 = [v24 supportsCapabilities:0x100000];

    if (v25)
    {
      uint64_t v26 = objc_msgSend((id)objc_opt_class(), "newTranscriptTextEffectCoordinatorForTranscriptCollectionViewController:isInline:", v21, -[CKTranscriptCollectionViewController isInline](v21, "isInline"));
      transcriptTextEffectCoordinator = v21->_transcriptTextEffectCoordinator;
      v21->_transcriptTextEffectCoordinator = (_TtC7ChatKit23CKTextEffectCoordinator *)v26;

      [(CKTextEffectCoordinator *)v21->_transcriptTextEffectCoordinator setDelegate:v21];
      [(CKTextEffectCoordinator *)v21->_transcriptTextEffectCoordinator setConfigurationDelegate:v21];
      uint64_t v28 = [(id)objc_opt_class() initialTextEffectsState];
      textEffectsState = v21->_textEffectsState;
      v21->_textEffectsState = (CKTranscriptTextEffectsState *)v28;

      int v30 = v21->_transcriptTextEffectCoordinator;
      v31 = [(CKTranscriptCollectionViewController *)v21 textEffectsState];
      -[CKTextEffectCoordinator setPaused:includingAnimators:](v30, "setPaused:includingAnimators:", [v31 isPaused], 1);
    }
  }
  v21->_collectionViewSize.CGFloat width = width;
  v21->_collectionViewSize.CGFloat height = height;
  v21->_lastViewWidthUsedToLayoutChatItems = width;
  id v60 = v19;
  [(CKTranscriptCollectionViewController *)v21 setDelegate:v19];
  int v32 = [v18 chat];
  [(CKTranscriptCollectionViewController *)v21 setConversation:v18];
  [(CKTranscriptCollectionViewController *)v21 setBalloonMaxWidth:a6];
  -[CKTranscriptCollectionViewController setMarginInsets:](v21, "setMarginInsets:", top, left, bottom, right);
  [(CKTranscriptCollectionViewController *)v21 setShouldUseOpaqueMask:[(CKTranscriptCollectionViewController *)v21 _canUseOpaqueMask]];
  v33 = +[CKAppAudioController sharedInstance];
  int v34 = [v33 audioController];
  [v34 setDelegate:v21];

  uint64_t v35 = [(CKTranscriptCollectionViewController *)v21 imChatItems];
  if (IMOSLoggingEnabled())
  {
    BOOL v36 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "Displaying content from chatItems", buf, 2u);
    }
  }
  v58 = (void *)v35;
  id v37 = [(CKTranscriptCollectionViewController *)v21 newChatItemsWithIMChatItems:v35];
  v38 = +[CKUIBehavior sharedBehaviors];
  int v39 = [v38 shouldSizeInitialViewingMessageCount];

  int v40 = +[CKUIBehavior sharedBehaviors];
  unint64_t v41 = [v40 initialConversationSizingMessageCount];

  if (v39 && v41 < [v37 count])
  {
    objc_msgSend(v37, "subarrayWithRange:", objc_msgSend(v37, "count") - v41, v41);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [(CKTranscriptCollectionViewController *)v21 setSizedFullTranscript:1];
    id v42 = v37;
  }
  v43 = v42;
  long long v44 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v45 = [v44 isConsolidatedChatItemsEnabled];

  if (v45)
  {
    BOOL v46 = [(CKTranscriptCollectionViewController *)v21 chatItemController];
    id v47 = (id)[v46 setChatItems:v43 completion:0];

    if (!v39) {
      goto LABEL_19;
    }
LABEL_17:
    if (![(CKTranscriptCollectionViewController *)v21 sizedFullTranscript]) {
      [v32 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B920]];
    }
    goto LABEL_19;
  }
  [(CKTranscriptCollectionViewController *)v21 setChatItems:v43];
  if (v39) {
    goto LABEL_17;
  }
LABEL_19:
  [(CKTranscriptCollectionViewController *)v21 _createInputContextHistory];
  [(CKTranscriptCollectionViewController *)v21 _refreshLocationsForRecipientsIfNecessary];
  dispatch_group_t v48 = dispatch_group_create();
  [(CKTranscriptCollectionViewController *)v21 setUpdateAnimationGroup:v48];
  [(CKTranscriptCollectionViewController *)v21 setTranscriptUpdateAnimated:1];
  uint64_t v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 addObserver:v21 selector:sel_transferRestored_ name:@"CKFileTransferRestoredNotification" object:0];
  [v49 addObserver:v21 selector:sel_previewDidChange_ name:@"CKPreviewDidChangeNotification" object:0];
  [v49 addObserver:v21 selector:sel__adaptiveImageGlyphWasGeneratedNotification_ name:@"CKAdaptiveImageGlyphGeneratedNotification" object:0];
  [v49 addObserver:v21 selector:sel_snapshotDidChange_ name:@"CKSnapshotChangedNotification" object:0];
  [v49 addObserver:v21 selector:sel_locationStringDidChange_ name:@"CKLocationStringDidChangeNotification" object:0];
  [v49 addObserver:v21 selector:sel_transferUpdated_ name:@"CKFileTransferUpdatedNotification" object:0];
  [v49 addObserver:v21 selector:sel_addressBookChanged_ name:*MEMORY[0x1E4F6CA50] object:0];
  [v49 addObserver:v21 selector:sel__conversationListFinishedMerging_ name:@"CKConversationListFinishedMergingChatsNotification" object:0];
  [v49 addObserver:v21 selector:sel_installedAppsChanged_ name:*MEMORY[0x1E4F6B878] object:0];
  [v49 addObserver:v21 selector:sel_snapshotTaken_ name:*MEMORY[0x1E4F436F8] object:0];
  [v49 addObserver:v21 selector:sel_multiwayCallStateChanged_ name:*MEMORY[0x1E4F6B9C0] object:0];
  [v49 addObserver:v21 selector:sel_connectivityChanged_ name:*MEMORY[0x1E4F6B890] object:0];
  if (v32)
  {
    long long v50 = [(id)objc_opt_class() chatItemsDidChangeNotification];
    [v49 addObserver:v21 selector:sel_chatItemsDidChange_ name:v50 object:v32];
  }
  long long v51 = objc_alloc_init(CKImpactEffectManager);
  [(CKImpactEffectManager *)v51 setDelegate:v21];
  [(CKTranscriptCollectionViewController *)v21 setImpactEffectManager:v51];
  [(CKTranscriptCollectionViewController *)v21 setIsPerformingRegenerateOrReloadOnlyUpdate:0];
  v21->_allowsPluginPlayback = 0;
  v21->_pluginPlaybackDelay = 0.1;
  long long v52 = objc_alloc_init(CKTranscriptBalloonSelectionManager);
  selectionManager = v21->_selectionManager;
  v21->_selectionManager = v52;

  [(CKTranscriptBalloonSelectionManager *)v21->_selectionManager setDelegate:v21];
  [(CKTranscriptBalloonSelectionManager *)v21->_selectionManager setDataSource:v21];
  long long v54 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v55 = [v54 isDiffableTranscriptDataSourceEnabled];

  if (v55)
  {
    v56 = [(CKTranscriptCollectionViewController *)v21 viewIfLoaded];

    if (v56) {
      [(CKTranscriptCollectionViewController *)v21 _updateTranscriptChatItemsWithoutAnimation:v43];
    }
  }

  id v20 = v59;
  id v19 = v60;
LABEL_25:

  return v21;
}

- (IMChat)chat
{
  id v2 = [(CKTranscriptCollectionViewController *)self conversation];
  id v3 = [v2 chat];

  return (IMChat *)v3;
}

- (void)setHiddenItems:(id)a3
{
  int v4 = (NSIndexSet *)a3;
  id v5 = v4;
  if (self->_hiddenItems != v4)
  {
    double v6 = (NSIndexSet *)[(NSIndexSet *)v4 copy];

    objc_storeStrong((id *)&self->_hiddenItems, v6);
    int v7 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v8 = [v7 visibleCells];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__CKTranscriptCollectionViewController_setHiddenItems___block_invoke;
    v9[3] = &unk_1E5627158;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];

    id v5 = v6;
  }
}

void __55__CKTranscriptCollectionViewController_setHiddenItems___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) collectionView];
  int v4 = [v3 indexPathForCell:v7];

  if (![v4 section])
  {
    if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "containsIndex:", objc_msgSend(v4, "row"))) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    double v6 = [v7 contentView];
    [v6 setAlpha:v5];
  }
}

- (void)updateAssociatedItem:(id)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = [(CKTranscriptCollectionViewController *)self cellForAssociatedChatItem:a3];
  double v6 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v7 = [v6 indexPathForCell:v14];

  if (v7)
  {
    id v8 = [(CKTranscriptCollectionViewController *)self hiddenAssociatedItems];
    int v9 = (void *)[v8 mutableCopy];
    uint64_t v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_opt_new();
    }
    uint64_t v12 = v11;

    uint64_t v13 = [v7 item];
    if (v4) {
      [v12 addIndex:v13];
    }
    else {
      [v12 removeIndex:v13];
    }
    [(CKTranscriptCollectionViewController *)self setHiddenAssociatedItems:v12];
  }
}

- (void)setHiddenAssociatedItems:(id)a3
{
  BOOL v4 = (NSIndexSet *)a3;
  double v5 = v4;
  if (self->_hiddenAssociatedItems != v4)
  {
    double v6 = (NSIndexSet *)[(NSIndexSet *)v4 copy];

    objc_storeStrong((id *)&self->_hiddenAssociatedItems, v6);
    id v7 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v8 = [v7 visibleCells];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__CKTranscriptCollectionViewController_setHiddenAssociatedItems___block_invoke;
    v9[3] = &unk_1E5627158;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];

    double v5 = v6;
  }
}

void __65__CKTranscriptCollectionViewController_setHiddenAssociatedItems___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) collectionView];
  BOOL v4 = [v3 indexPathForCell:v8];

  int v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1120), "containsIndex:", objc_msgSend(v4, "row"));
  if ([v4 section] == 1)
  {
    if (v5) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    id v7 = [v8 contentView];
    [v7 setAlpha:v6];
  }
}

- (void)setHiddenAssociatedItemsForMessageEditing:(id)a3
{
  BOOL v4 = (NSIndexSet *)a3;
  int v5 = v4;
  if (self->_hiddenAssociatedItemsForMessageEditing != v4)
  {
    double v6 = (NSIndexSet *)[(NSIndexSet *)v4 copy];

    objc_storeStrong((id *)&self->_hiddenAssociatedItemsForMessageEditing, v6);
    id v7 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v8 = [v7 visibleCells];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__CKTranscriptCollectionViewController_setHiddenAssociatedItemsForMessageEditing___block_invoke;
    v9[3] = &unk_1E5627158;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];

    int v5 = v6;
  }
}

void __82__CKTranscriptCollectionViewController_setHiddenAssociatedItemsForMessageEditing___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) collectionView];
  BOOL v4 = [v3 indexPathForCell:v6];

  int v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1128), "containsIndex:", objc_msgSend(v4, "item"));
  if ([v4 section] == 1 && v5 != objc_msgSend(v6, "isHidden"))
  {
    if ([v6 isHidden]) {
      [v6 performReveal:0];
    }
    else {
      [v6 performHide:0];
    }
  }
}

- (void)setHiddenBalloonViews:(id)a3
{
  BOOL v4 = (NSIndexSet *)a3;
  int v5 = v4;
  if (self->_hiddenBalloonViews != v4)
  {
    id v6 = (NSIndexSet *)[(NSIndexSet *)v4 copy];

    objc_storeStrong((id *)&self->_hiddenBalloonViews, v6);
    id v7 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v8 = [v7 visibleCells];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__CKTranscriptCollectionViewController_setHiddenBalloonViews___block_invoke;
    v9[3] = &unk_1E5627158;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];

    int v5 = v6;
  }
}

void __62__CKTranscriptCollectionViewController_setHiddenBalloonViews___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(a1 + 32) collectionView];
    BOOL v4 = [v3 indexPathForCell:v7];

    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1136), "containsIndex:", objc_msgSend(v4, "item"));
    id v6 = [v7 balloonView];
    [v6 setHidden:v5];
  }
}

- (NSMutableArray)stickerGUIDsHiddenDuringStickerAddAnimation
{
  stickerGUIDsHiddenDuringStickerAddAnimation = self->_stickerGUIDsHiddenDuringStickerAddAnimation;
  if (!stickerGUIDsHiddenDuringStickerAddAnimation)
  {
    BOOL v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_stickerGUIDsHiddenDuringStickerAddAnimation;
    self->_stickerGUIDsHiddenDuringStickerAddAnimation = v4;

    stickerGUIDsHiddenDuringStickerAddAnimation = self->_stickerGUIDsHiddenDuringStickerAddAnimation;
  }

  return stickerGUIDsHiddenDuringStickerAddAnimation;
}

- (void)beginHidingStickerWithGUIDDuringAddStickerAnimation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self stickerGUIDsHiddenDuringStickerAddAnimation];
  [v5 addObject:v4];

  id v8 = [(CKTranscriptCollectionViewController *)self associatedChatItemForGUID:v4];

  id v6 = [(CKTranscriptCollectionViewController *)self cellForAssociatedChatItem:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 associatedItemView];
    [v7 setHidden:1];
  }
}

- (void)endHidingStickerWithGUIDDuringAddStickerAnimation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self stickerGUIDsHiddenDuringStickerAddAnimation];
  [v5 removeObject:v4];

  id v8 = [(CKTranscriptCollectionViewController *)self associatedChatItemForGUID:v4];

  id v6 = [(CKTranscriptCollectionViewController *)self cellForAssociatedChatItem:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 associatedItemView];
    [v7 setHidden:0];
  }
}

- (void)_highlightCell:(id)a3 autoDismiss:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (objc_opt_respondsToSelector())
  {
    itemIndexPathToHighlight = self->_itemIndexPathToHighlight;
    self->_itemIndexPathToHighlight = 0;

    id v7 = +[CKUIBehavior sharedBehaviors];
    int v8 = [v7 enableBalloonTextSelection];

    if (!v8 || v4)
    {
      uint64_t v10 = [v11 balloonView];
      [v10 setHasOverlay:1 autoDismiss:v4];
    }
  }
}

- (void)highlightItemAtIndexPathWhenDisplayed:(id)a3 autoDismiss:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (NSIndexPath *)a3;
  p_itemIndexPathToHighlight = &self->_itemIndexPathToHighlight;
  itemIndexPathToHighlight = self->_itemIndexPathToHighlight;
  if (itemIndexPathToHighlight != v7)
  {
    uint64_t v13 = v7;
    if (itemIndexPathToHighlight && self->_holdMessageEmphasisTillManuallyRemoved) {
      [(CKTranscriptCollectionViewController *)self removeEmphasisFromCurrentMessage];
    }
    objc_storeStrong((id *)&self->_itemIndexPathToHighlight, a3);
    self->_holdMessageEmphasisTillManuallyRemoved = !v4;
    id v7 = v13;
    if (v13)
    {
      uint64_t v10 = [(CKTranscriptCollectionViewController *)self collectionView];
      id v11 = [v10 cellForItemAtIndexPath:*p_itemIndexPathToHighlight];

      if (v11)
      {
        if (v4)
        {
          uint64_t v12 = *p_itemIndexPathToHighlight;
          *p_itemIndexPathToHighlight = 0;
        }
        [(CKTranscriptCollectionViewController *)self _highlightCell:v11 autoDismiss:v4];
      }

      id v7 = v13;
    }
  }
}

- (void)_removeHighlightFromCell:(id)a3
{
  id v8 = a3;
  if (objc_opt_respondsToSelector())
  {
    itemIndexPathToHighlight = self->_itemIndexPathToHighlight;
    self->_itemIndexPathToHighlight = 0;

    uint64_t v5 = +[CKUIBehavior sharedBehaviors];
    char v6 = [v5 enableBalloonTextSelection];

    if ((v6 & 1) == 0)
    {
      id v7 = [v8 balloonView];
      [v7 setHasOverlay:0 autoDismiss:0];
    }
  }
}

- (void)removeEmphasisFromCurrentMessage
{
  if (self->_itemIndexPathToHighlight)
  {
    id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v5 = [v3 cellForItemAtIndexPath:self->_itemIndexPathToHighlight];

    if (v5)
    {
      itemIndexPathToHighlight = self->_itemIndexPathToHighlight;
      self->_itemIndexPathToHighlight = 0;

      [(CKTranscriptCollectionViewController *)self _removeHighlightFromCell:v5];
    }
  }
}

- (id)selectedItems
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  BOOL v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      char v6 = [v4 objectAtIndex:v5];
      id v7 = [v6 IMChatItem];
      id v8 = [v7 guid];

      int v9 = [(CKTranscriptCollectionViewController *)self selectionManager];
      int v10 = [v9 isMessageGuidSelected:v8];

      if (v10) {
        [v3 addIndex:v5];
      }

      ++v5;
    }
    while (v5 < [v4 count]);
  }

  return v3;
}

- (void)setSelectedItems:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = [(CKTranscriptCollectionViewController *)self chatItems];
    [(CKTranscriptCollectionViewController *)self deselectAllBalloons];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__CKTranscriptCollectionViewController_setSelectedItems___block_invoke;
    v7[3] = &unk_1E56240E0;
    id v8 = v5;
    int v9 = self;
    id v6 = v5;
    [v4 enumerateIndexesUsingBlock:v7];
  }
}

void __57__CKTranscriptCollectionViewController_setSelectedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndex:a2];
  id v3 = [v7 IMChatItem];
  id v4 = [v3 guid];

  unint64_t v5 = [*(id *)(a1 + 40) selectionManager];
  id v6 = +[CKBalloonSelectionState balloonSelectionState:0];
  [v5 addSelectedMessageGuid:v4 selectionState:v6];
}

- (void)deleteSelectedChatItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self selectedChatItems];
  [(CKTranscriptCollectionViewController *)self deleteChatItems:v5 sender:v4];
}

- (id)_currentTopChatItemForAggregateChatItem:(id)a3
{
  id v3 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 stackView];
    id v5 = [v4 currentAssetReference];
    id v6 = [v5 asset];
    id v7 = [v6 chatItem];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)deleteChatItems:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(CKTranscriptCollectionViewController *)self chat];
    [v8 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B940]];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass() & 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke;
    aBlock[3] = &unk_1E5627180;
    aBlock[4] = self;
    id v10 = v6;
    char v29 = v9;
    id v27 = v10;
    id v28 = v8;
    id v11 = v8;
    uint64_t v12 = _Block_copy(aBlock);
    uint64_t v13 = objc_opt_new();
    BOOL v14 = CKIsRunningInMacCatalyst() != 0;
    uint64_t v15 = [v10 count];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_438;
    v24[3] = &unk_1E5620F48;
    id v25 = v12;
    id v16 = v12;
    [v13 presentRecoverableDeletionConfirmationsFromViewController:self forMessagesCount:v15 alertControllerStyle:v14 sender:v7 alertsCompletedBlock:v24 cancelBlock:0];
  }
  else
  {
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController deleteChatItems:sender:](v11, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

void __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateAnimationGroup];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_2;
  v4[3] = &unk_1E5627180;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v7 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, MEMORY[0x1E4F14428], v4);
}

void __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentViewController];
  [v2 setEditing:0 animated:1];

  id v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_3;
  v6[3] = &unk_1E5627180;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_432;
  v4[3] = &unk_1E5620C40;
  id v5 = *(id *)(a1 + 48);
  [v3 updateTranscript:v6 animated:1 completion:v4];
}

void __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_3(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v1 = (void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transcriptCollectionViewController:*v1 willDeleteChatItems:*(void *)(a1 + 40)];

  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v47;
    *(void *)&long long v4 = 136316162;
    long long v34 = v4;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(obj);
        }
        id v41 = *(id *)(*((void *)&v46 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = v41;
          id v6 = [v5 momentShareURL];

          if (*(unsigned char *)(a1 + 56)) {
            BOOL v7 = v6 != 0;
          }
          else {
            BOOL v7 = 1;
          }
          if (!v7)
          {
            id v8 = [*(id *)(a1 + 32) _currentTopChatItemForAggregateChatItem:v5];
            char v9 = [v8 IMChatItem];
            if (v9) {
              [v3 addObject:v9];
            }
          }
          if (IMOSLoggingEnabled())
          {
            id v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              id v11 = [v5 IMChatItem];
              uint64_t v12 = [v11 guid];
              uint64_t v13 = [v5 IMChatItem];
              BOOL v14 = [v13 guid];
              int v15 = *(unsigned __int8 *)(a1 + 56);
              *(_DWORD *)buf = v34;
              long long v52 = "-[CKTranscriptCollectionViewController deleteChatItems:sender:]_block_invoke_3";
              __int16 v53 = 2112;
              long long v54 = v12;
              __int16 v55 = 2112;
              v56 = v14;
              __int16 v57 = 1024;
              BOOL v58 = v6 != 0;
              __int16 v59 = 1024;
              int v60 = v15;
              _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%s Targeting chatItem.guid for deletion: %@, given aggregateAttachmentChatItem.guid: %@. isMomentShare: %{BOOL}d, isKeyCommandDelete: %{BOOL}d", buf, 0x2Cu);
            }
          }
        }
        int v39 = objc_msgSend(v41, "IMChatItem", v34);
        if (v39)
        {
          objc_msgSend(v3, "addObject:");
          id v16 = [v41 visibleAssociatedMessageChatItems];
          uint64_t v17 = (void *)[v16 mutableCopy];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [v41 visibleAssociatedMessageChatItemsIncludingTapbacks];
            uint64_t v19 = [v17 arrayByAddingObjectsFromArray:v18];
            uint64_t v20 = [v19 mutableCopy];

            uint64_t v17 = (void *)v20;
          }
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v21 = v17;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v43 != v23) {
                  objc_enumerationMutation(v21);
                }
                id v25 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                uint64_t v26 = [v25 IMChatItem];
                [v3 addObject:v26];

                id v27 = IMLogHandleForCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  id v28 = [v25 IMChatItem];
                  char v29 = [v28 guid];
                  *(_DWORD *)buf = 136315394;
                  long long v52 = "-[CKTranscriptCollectionViewController deleteChatItems:sender:]_block_invoke";
                  __int16 v53 = 2112;
                  long long v54 = v29;
                  _os_log_error_impl(&dword_18EF18000, v27, OS_LOG_TYPE_ERROR, "%s adding associatedMessageChatItem.guid for deletion %@", buf, 0x16u);
                }
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v22);
          }
        }
        else
        {
          uint64_t v21 = IMLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int v30 = [v41 IMChatItem];
            v31 = [v30 guid];
            *(_DWORD *)buf = 136315394;
            long long v52 = "-[CKTranscriptCollectionViewController deleteChatItems:sender:]_block_invoke";
            __int16 v53 = 2112;
            long long v54 = v31;
            _os_log_error_impl(&dword_18EF18000, v21, OS_LOG_TYPE_ERROR, "%s chatItem's underlying IMChatItem was nil. Will not delete chatItem.guid. %@", buf, 0x16u);
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
    }
    while (v38);
  }

  int v32 = IMLogHandleForCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_3_cold_1(v3, v32);
  }

  [*(id *)(a1 + 48) deleteChatItems:v3];
  if (CKIsRunningInMacCatalyst())
  {
    v33 = [*(id *)(a1 + 32) selectionManager];
    [v33 removeAllSelectedMessageGuids];
  }
}

void __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_432(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B940]];
  if (IMOSLoggingEnabled())
  {
    v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315138;
      long long v4 = "-[CKTranscriptCollectionViewController deleteChatItems:sender:]_block_invoke";
      _os_log_impl(&dword_18EF18000, v1, OS_LOG_TYPE_INFO, "%s requesting purge of default snapshot", (uint8_t *)&v3, 0xCu);
    }
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4FA69B8]);
  [v2 deleteSnapshotsForApplicationIdentifier:@"com.apple.MobileSMS"];
  [v2 invalidate];
}

uint64_t __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_438(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTransitionedFromComposing:(BOOL)a3
{
  self->_transitionedFromComposing = a3;
  if (a3) {
    [(CKTranscriptCollectionViewController *)self setTransitioningFromComposing:0];
  }
}

- (NSDictionary)pluginSnapshots
{
  pluginSnapshots = self->_pluginSnapshots;
  if (!pluginSnapshots)
  {
    self->_pluginSnapshots = (NSDictionary *)MEMORY[0x1E4F1CC08];

    pluginSnapshots = self->_pluginSnapshots;
  }

  return pluginSnapshots;
}

- (void)setTransitioningFromComposing:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self->_transitioningFromComposing = a3;
  if (a3)
  {
    long long v4 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
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
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = -[CKTranscriptCollectionViewController balloonViewForChatItem:](self, "balloonViewForChatItem:", v11, (void)v18);
            uint64_t v13 = [v11 IMChatItem];
            BOOL v14 = [v13 guid];

            int v15 = [v12 snapshotViewAfterScreenUpdates:0];
            [(NSDictionary *)v5 setObject:v15 forKeyedSubscript:v14];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    pluginSnapshots = self->_pluginSnapshots;
    self->_pluginSnapshots = v5;
  }
  else
  {
    uint64_t v17 = self->_pluginSnapshots;
    self->_pluginSnapshots = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (void)setScrollAnchor:(double)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  [v4 setAnchorYPosition:a3];
}

- (void)__updateLayoutAndConfigureVisibleMessagesCellsIncludingAssociatedCells:(BOOL)a3
{
  uint64_t v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isExpressiveTextEnabled];

  if (v6)
  {
    if ([(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator isPaused])
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator setPaused:1 includingAnimators:0];
      [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator reset];
      LOBYTE(v6) = 0;
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__CKTranscriptCollectionViewController___updateLayoutAndConfigureVisibleMessagesCellsIncludingAssociatedCells___block_invoke;
  v9[3] = &unk_1E5622A18;
  v9[4] = self;
  BOOL v10 = a3;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v9];
  uint64_t v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isExpressiveTextEnabled];

  if ((v6 & 1) == 0 && v8 && !+[CKApplicationState isResizing])
  {
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator setPaused:0 includingAnimators:0];
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator updateWithReason:@"TranscriptCollectionViewController did update and configure visible cells"];
  }
}

void __111__CKTranscriptCollectionViewController___updateLayoutAndConfigureVisibleMessagesCellsIncludingAssociatedCells___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) collectionView];
  int v3 = [*(id *)(a1 + 32) collectionViewLayout];
  [v3 reloadLayout];
  long long v20 = v3;
  [v3 prepareLayout];
  uint64_t v23 = [*(id *)(a1 + 32) chatItems];
  long long v21 = [*(id *)(a1 + 32) associatedChatItems];
  id v4 = [v2 indexPathsForVisibleItems];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    uint64_t v22 = v2;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        BOOL v10 = [v2 cellForItemAtIndexPath:v9];
        if (v10)
        {
          if (![v9 section])
          {
            id v11 = v4;
            uint64_t v12 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));
            uint64_t v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
            int v14 = [v13 isExpressiveTextEnabled];

            if (v14)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v15 = [v10 balloonView];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v16 = [v15 textView];
                  objc_msgSend(v16, "ck_invalidateAllAnimators");
                }
              }
            }
            [*(id *)(a1 + 32) configureCell:v10 forCKChatItem:v12 atIndexPath:v9 animated:0 animationDuration:3 animationCurve:0.0];

            id v4 = v11;
            id v2 = v22;
          }
          if (*(unsigned char *)(a1 + 40) && [v9 section] == 1)
          {
            uint64_t v17 = [v9 item];
            id v18 = v10;
            long long v19 = [v21 objectAtIndexedSubscript:v17];
            [*(id *)(a1 + 32) configureAssociatedCell:v18 forChatItem:v19 atIndexPath:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)_updateLayoutAndConfigureVisibleCells
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptCollectionViewController;
  id v4 = a3;
  [(CKTranscriptCollectionViewController *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(CKTranscriptCollectionViewController *)self _updateLayoutAndConfigureVisibleCells];
  }
}

- (void)_requestChatItemLayoutInvalidation
{
  id v3 = [(CKTranscriptCollectionViewController *)self delegate];
  [v3 transcriptCollectionViewControllerNeedsChatItemLayoutInvalidation:self];
}

- (void)invalidateChatItemLayoutWithNewBalloonMaxWidth:(double)a3 marginInsets:(UIEdgeInsets)a4 traitCollection:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  [(CKTranscriptCollectionViewController *)self setBalloonMaxWidth:a3];
  -[CKTranscriptCollectionViewController setMarginInsets:](self, "setMarginInsets:", top, left, bottom, right);
  uint64_t v12 = [(CKTranscriptCollectionViewController *)self collectionView];
  objc_msgSend(v12, "setMarginInsets:", top, left, bottom, right);

  uint64_t v13 = [(CKTranscriptCollectionViewController *)self notifications];

  if (v13)
  {
    int v14 = [(CKTranscriptCollectionViewController *)self notifications];
    id v15 = [(CKTranscriptCollectionViewController *)self newChatItemsWithNotifications:v14];

    id v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v17 = [v16 isConsolidatedChatItemsEnabled];

    if (v17)
    {
      id v18 = [(CKTranscriptCollectionViewController *)self chatItemController];
      [v18 setChatItemsUsingReloadDataWithoutAnimation:v15];
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self setChatItems:v15];
    }
  }
  else
  {
    [(CKTranscriptCollectionViewController *)self _fullMaxWidth];
    double v20 = v19;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v21 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) updateWithBalloonMaxWidth:v11 fullMaxWidth:a3 transcriptTraitCollection:v20];
        }
        uint64_t v22 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v22);
    }
  }

  [(CKTranscriptCollectionViewController *)self _updateLayoutAndConfigureVisibleCells];
}

- (void)_resizingStart:(id)a3
{
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v3 beginDisablingTranscriptDynamicsForReason:@"MacWindowResizing"];
}

- (void)_resizingEnd:(id)a3
{
  id v6 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v6 endDisablingTranscriptDynamicsForReason:@"MacWindowResizing"];
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isExpressiveTextEnabled];

  if (v5)
  {
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator setPaused:0 includingAnimators:0];
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator updateWithReason:@"TranscriptCollectionViewController _resizingEnd"];
  }
}

- (void)sizeFullTranscriptIfNecessary
{
  if (![(CKTranscriptCollectionViewController *)self sizedFullTranscript])
  {
    [(CKTranscriptCollectionViewController *)self setSizedFullTranscript:1];
    id v3 = [(CKTranscriptCollectionViewController *)self imChatItems];
    id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
    unint64_t v5 = [v3 count];
    if (v5 >= [v4 count])
    {
      objc_msgSend(v3, "subarrayWithRange:", 0, objc_msgSend(v3, "count") - objc_msgSend(v4, "count"));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = v4;
    }
    else
    {
      id v6 = v3;
      uint64_t v7 = [MEMORY[0x1E4F1C978] array];

      if (IMOSLoggingEnabled())
      {
        objc_super v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "ChatItems changed between collection view init and viewDidAppearDeferredSetup, resetting transcript state", buf, 2u);
        }
      }
    }
    uint64_t v9 = [(CKTranscriptCollectionViewController *)self notifications];

    if (v9)
    {
      id v10 = [(CKTranscriptCollectionViewController *)self notifications];
      id v11 = [(CKTranscriptCollectionViewController *)self newChatItemsWithNotifications:v10];
    }
    else
    {
      id v10 = [(CKTranscriptCollectionViewController *)self newChatItemsWithIMChatItems:v6];
      id v11 = [v10 arrayByAddingObjectsFromArray:v7];
    }
    uint64_t v12 = v11;

    uint64_t v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v14 = [v13 isConsolidatedChatItemsEnabled];

    if (v14)
    {
      id v15 = [(CKTranscriptCollectionViewController *)self chatItemController];
      [v15 setChatItemsUsingReloadDataWithoutAnimation:v12];
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self setChatItems:v12];
      id v16 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
      [v16 reloadData];

      [(CKTranscriptCollectionViewController *)self reloadData];
    }
    int v17 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v18 = +[CKScrollViewAnimationProperties unanimated];
    [v17 enforceTranscriptScrollIntentWithAnimationProperties:v18];
    double v19 = [(CKTranscriptCollectionViewController *)self chat];
    [v19 endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B920]];
    dispatch_time_t v20 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CKTranscriptCollectionViewController_sizeFullTranscriptIfNecessary__block_invoke;
    block[3] = &unk_1E5620C40;
    void block[4] = self;
    dispatch_after(v20, MEMORY[0x1E4F14428], block);
  }
}

void __69__CKTranscriptCollectionViewController_sizeFullTranscriptIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  int v3 = [v2 isUserInteractionEnabled];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) collectionView];
    [v4 flashScrollIndicators];
  }
}

- (void)_prewarmMediaPreviews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "prewarm media previews", buf, 2u);
    }
  }
  id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CKTranscriptCollectionViewController__prewarmMediaPreviews__block_invoke;
  v7[3] = &unk_1E5623C50;
  void v7[4] = &v8;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v7];

  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *((_DWORD *)v9 + 6);
      *(_DWORD *)buf = 67109120;
      int v13 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "prewarm media previews complete, %u warmed", buf, 8u);
    }
  }
  _Block_object_dispose(&v8, 8);
}

void __61__CKTranscriptCollectionViewController__prewarmMediaPreviews__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v3 = v9;
    id v4 = [v3 mediaObject];
    unint64_t v5 = +[CKUIBehavior sharedBehaviors];
    [v5 previewMaxWidth];
    double v7 = v6;
    uint64_t v8 = [v3 balloonOrientation];

    [v4 prewarmPreviewForWidth:v8 orientation:v7];
  }
}

- (void)_prewarmLinkPresentations
{
  id v3 = [(CKTranscriptCollectionViewController *)self chatItems];
  [(CKTranscriptCollectionViewController *)self _prewarmLinkPresentationsWithChatItems:v3];
}

- (void)_prewarmLinkPresentationsWithChatItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "prewarm link presentations", buf, 2u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__CKTranscriptCollectionViewController__prewarmLinkPresentationsWithChatItems___block_invoke;
  v7[3] = &unk_1E5623C50;
  void v7[4] = &v8;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v7];
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *((_DWORD *)v9 + 6);
      *(_DWORD *)buf = 67109120;
      int v13 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "prewarm media previews complete, %u warmed", buf, 8u);
    }
  }
  _Block_object_dispose(&v8, 8);
}

void __79__CKTranscriptCollectionViewController__prewarmLinkPresentationsWithChatItems___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v6 IMChatItem];
    id v4 = [v3 dataSource];
    unint64_t v5 = [v4 pluginPayload];

    [v5 acceptPurgedTransfers];
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)_prewarmBalloonControllers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(CKTranscriptCollectionViewController *)self chatItems];
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
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          uint64_t v10 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
          id v11 = (id)[v9 extensibleViewForContext:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)reloadData
{
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v3 reloadData];

  [(CKTranscriptCollectionViewController *)self reconfigureVisibleSpeakerButtonCells];
}

- (void)updateTranscript:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(void))a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v6) {
        id v11 = @"YES";
      }
      else {
        id v11 = @"NO";
      }
      long long v12 = _Block_copy(v9);
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Update transcript animated:%@, completion:%@", buf, 0x16u);
    }
  }
  long long v13 = [(CKTranscriptCollectionViewController *)self transcriptUpdateCompletion];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    [(CKTranscriptCollectionViewController *)self setTranscriptUpdateCompletion:v9];
  }
  else
  {
    long long v15 = [(CKTranscriptCollectionViewController *)self transcriptUpdateCompletion];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__CKTranscriptCollectionViewController_updateTranscript_animated_completion___block_invoke;
    aBlock[3] = &unk_1E56271A8;
    id v16 = v9;
    id v28 = v16;
    id v17 = v15;
    id v29 = v17;
    id v18 = _Block_copy(aBlock);
    if (IMOSLoggingEnabled())
    {
      double v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        long long v26 = [(CKTranscriptCollectionViewController *)self transcriptUpdateCompletion];
        dispatch_time_t v20 = (__CFString *)_Block_copy(v26);
        uint64_t v21 = _Block_copy(v16);
        uint64_t v22 = _Block_copy(v18);
        *(_DWORD *)buf = 134218496;
        v31 = v20;
        __int16 v32 = 2048;
        v33 = v21;
        __int16 v34 = 2048;
        uint64_t v35 = v22;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Update transcript while update is already in progress. Current completion: %p – new completion: %p - chained: %p", buf, 0x20u);
      }
    }
    [(CKTranscriptCollectionViewController *)self setTranscriptUpdateCompletion:v18];
  }
  [(CKTranscriptCollectionViewController *)self setTranscriptUpdateAnimated:v6];
  v8[2](v8);
  uint64_t v23 = [(CKTranscriptCollectionViewController *)self transcriptUpdateCompletion];
  BOOL v24 = v23 == 0;

  if (!v24)
  {
    long long v25 = [(CKTranscriptCollectionViewController *)self transcriptUpdateCompletion];
    v25[2]();
  }
  [(CKTranscriptCollectionViewController *)self setTranscriptUpdateCompletion:0];
  [(CKTranscriptCollectionViewController *)self setTranscriptUpdateAnimated:1];
}

void __77__CKTranscriptCollectionViewController_updateTranscript_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = _Block_copy(*(const void **)(a1 + 32));
      uint64_t v4 = _Block_copy(*(const void **)(a1 + 40));
      int v13 = 134218240;
      BOOL v14 = v3;
      __int16 v15 = 2048;
      id v16 = v4;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Update transcript while update is already in progress – chained completion handler called. Completion: %p - innerCompletion: %p", (uint8_t *)&v13, 0x16u);
    }
  }
  if (*(void *)(a1 + 32))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        BOOL v6 = _Block_copy(*(const void **)(a1 + 32));
        int v13 = 134217984;
        BOOL v14 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Update transcript while update is already in progress – chained completion handler called. Will call completion: %p", (uint8_t *)&v13, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = _Block_copy(*(const void **)(a1 + 32));
        int v13 = 134217984;
        BOOL v14 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Update transcript while update is already in progress – chained completion handler called. Did call completion: %p", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = _Block_copy(*(const void **)(a1 + 40));
        int v13 = 134217984;
        BOOL v14 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Update transcript while update is already in progress – chained completion handler called. Will call innerCompletion: %p", (uint8_t *)&v13, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        long long v12 = _Block_copy(*(const void **)(a1 + 40));
        int v13 = 134217984;
        BOOL v14 = v12;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Update transcript while update is already in progress – chained completion handler called. Did call innerCompletion: %p", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (id)latestScheduledMessageIndexPath
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__34;
  long long v12 = __Block_byref_object_dispose__34;
  id v13 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  id v2 = [(CKTranscriptCollectionViewController *)self chatItems];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__CKTranscriptCollectionViewController_latestScheduledMessageIndexPath__block_invoke;
  v5[3] = &unk_1E56271D0;
  v5[4] = v6;
  v5[5] = &v8;
  [v2 enumerateObjectsWithOptions:2 usingBlock:v5];

  id v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __71__CKTranscriptCollectionViewController_latestScheduledMessageIndexPath__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v13 messageItem],
        char v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 scheduleType],
        v7,
        v8 == 2)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_7:
    long long v12 = v13;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
    goto LABEL_7;
  }
  long long v12 = v13;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
LABEL_8:
}

- (void)scrollTranscriptToEntryViewInsertionTimeWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (v3) {
        BOOL v6 = @"YES";
      }
      else {
        BOOL v6 = @"NO";
      }
      char v7 = [(CKTranscriptCollectionViewController *)self collectionView];
      uint64_t v8 = CKDebugNameForCKTranscriptScrollIntent([v7 transcriptScrollIntent]);
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received request to figure out & scroll to latest desired time Animated: %@, currentIntent: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v10 = [WeakRetained transcriptCollectionViewControllerWantsCurrentDesiredIntent:self];

  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CKDebugNameForCKTranscriptScrollIntent(v10);
      long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Delegate informed us that the desired intent is: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v13 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v13 setTranscriptScrollIntent:v10];

  if (v3) {
    +[CKScrollViewAnimationProperties systemDefaultScrollAnimation];
  }
  else {
  BOOL v14 = +[CKScrollViewAnimationProperties unanimated];
  }
  [(CKTranscriptCollectionViewController *)self enforceTranscriptScrollIntentWithAnimationProperties:v14];
}

- (void)enforceTranscriptScrollIntentWithAnimationProperties:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v20 = 138543362;
    id v21 = v4;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received request to enforce transcript scrollIntent. Animation: %{public}@", (uint8_t *)&v20, 0xCu);
  }

  BOOL v6 = [(CKTranscriptCollectionViewController *)self collectionView];
  unint64_t v7 = [v6 transcriptScrollIntent];

  uint64_t v8 = CKDebugNameForCKTranscriptScrollIntent(v7);
  uint64_t v9 = IMLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v20 = 138543618;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Enforcing transcript scroll intent %{public}@ with animation: %{public}@", (uint8_t *)&v20, 0x16u);
  }

  switch(v7)
  {
    case 6uLL:
      id v13 = +[CKUIBehavior sharedBehaviors];
      int v14 = [v13 scrollToBottomStopsAtTopOfLastBubble];

      if (v14)
      {
        [(CKTranscriptCollectionViewController *)self scrollToTopOfLastBubbleCellWithAnimationProperties:v4];
      }
      else
      {
        if (![(CKViewController *)self deferredAppeared])
        {
          uint64_t v17 = +[CKScrollViewAnimationProperties unanimated];

          id v4 = (id)v17;
        }
        id v18 = [(CKTranscriptCollectionViewController *)self collectionView];
        [v18 scrollToBottomWithAnimationProperties:v4];
      }
      break;
    case 2uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v15 = [(CKTranscriptCollectionViewController *)self collectionView];
      id v16 = [v15 highlightedMessageScrollContext];
      [WeakRetained transcriptCollectionViewController:self shouldScrollToHighlightedMessage:v16];

LABEL_18:
      break;
    case 0uLL:
      unint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v11 = [v10 isScheduledMessagesCoreEnabled];

      if (v11)
      {
        id WeakRetained = [(CKTranscriptCollectionViewController *)self latestScheduledMessageIndexPath];
      }
      else
      {
        id WeakRetained = 0;
      }
      uint64_t v19 = [(CKTranscriptCollectionViewController *)self collectionView];
      [v19 scrollToBottomHidingMessageAtIndexPath:WeakRetained animationProperties:v4];

      goto LABEL_18;
  }
}

- (void)stopPlayingAudio
{
  id v3 = +[CKAppAudioController sharedInstance];
  id v2 = [v3 audioController];
  [v2 stop];
}

- (BOOL)canRaiseToListen
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (+[CKRaiseGesture isRaiseGestureEnabled])
  {
    id v3 = +[CKAppAudioController sharedInstance];
    id v4 = [v3 audioController];
    int v5 = [v4 isPlaying];

    if (v5)
    {
      *((unsigned char *)v11 + 24) = 1;
    }
    else
    {
      BOOL v6 = [(CKTranscriptCollectionViewController *)self chatItems];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__CKTranscriptCollectionViewController_canRaiseToListen__block_invoke;
      v9[3] = &unk_1E5623C50;
      v9[4] = &v10;
      [v6 enumerateObjectsWithOptions:2 usingBlock:v9];
    }
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __56__CKTranscriptCollectionViewController_canRaiseToListen__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = v11;
  if (isKindOfClass)
  {
    id v8 = v11;
    uint64_t v9 = [v8 mediaObject];
    char v10 = [v9 shouldSuppressPreview];

    if ((v10 & 1) == 0 && ([v8 isFromMe] & 1) == 0 && (objc_msgSend(v8, "isPlayed") & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }

    char v7 = v11;
  }
}

- (BOOL)canRaiseToTalk
{
  id v3 = [(CKTranscriptCollectionViewController *)self conversation];
  int v4 = [v3 isStewieConversation];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = 0;
        BOOL v6 = "Raise to talk disabled for Stewie";
        char v7 = (uint8_t *)&v12;
LABEL_9:
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    return 0;
  }
  id v8 = [(CKTranscriptCollectionViewController *)self conversation];
  int v9 = [v8 isReadOnlyChat];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        BOOL v6 = "Raise to talk disabled for read only chats";
        char v7 = (uint8_t *)&v11;
        goto LABEL_9;
      }
LABEL_10:
    }
    return 0;
  }

  return +[CKRaiseGesture isRaiseGestureEnabled];
}

- (void)raiseGestureRecognized:(id)a3
{
  id v6 = a3;
  int v4 = [(CKTranscriptCollectionViewController *)self conversation];
  char v5 = [v4 isBlockedByCommunicationLimits];

  if ((v5 & 1) == 0) {
    [(CKTranscriptCollectionViewController *)self __raiseGestureRecognized:v6];
  }
}

- (void)__raiseGestureRecognized:(id)a3
{
  id v4 = a3;
  char v5 = +[CKAppAudioController sharedInstance];
  id v6 = [v5 audioController];

  LODWORD(v5) = [v4 isRecognized];
  if (v5)
  {
    if (v6)
    {
      [(CKAudioController *)v6 setShouldUseSpeaker:0];
      if (![(CKAudioController *)v6 isPlaying]) {
        [(CKAudioController *)v6 playAfterDelay:0.5];
      }
    }
    else
    {
      char v7 = [(CKTranscriptCollectionViewController *)self chatItems];
      id v8 = objc_msgSend(v7, "__ck_indexesOfUnplayedAudioMessages");
      int v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __65__CKTranscriptCollectionViewController___raiseGestureRecognized___block_invoke;
      v14[3] = &unk_1E56271F8;
      id v15 = v9;
      id v10 = v9;
      [v7 enumerateObjectsAtIndexes:v8 options:0 usingBlock:v14];
      __int16 v11 = [CKAudioController alloc];
      __int16 v12 = [(CKTranscriptCollectionViewController *)self conversation];
      id v6 = [(CKAudioController *)v11 initWithMediaObjects:v10 conversation:v12];

      [(CKAudioController *)v6 setDelegate:self];
      char v13 = +[CKAppAudioController sharedInstance];
      [v13 setAudioController:v6];

      [(CKAudioController *)v6 setShouldUseSpeaker:0];
      [(CKAudioController *)v6 playAfterDelay:0.5];
    }
  }
  else
  {
    [(CKAudioController *)v6 pause];
  }
}

void __65__CKTranscriptCollectionViewController___raiseGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 mediaObject];
  [v2 addObject:v3];
}

- (CKFullScreenEffectManager)fullscreenEffectManager
{
  fullscreenEffectManager = self->_fullscreenEffectManager;
  if (!fullscreenEffectManager)
  {
    id v4 = objc_alloc_init(CKFullScreenEffectManager);
    char v5 = self->_fullscreenEffectManager;
    self->_fullscreenEffectManager = v4;

    [(CKFullScreenEffectManager *)self->_fullscreenEffectManager setDelegate:self];
    fullscreenEffectManager = self->_fullscreenEffectManager;
  }

  return fullscreenEffectManager;
}

- (NSMutableSet)currentEffectDecorationViews
{
  currentEffectDecorationViews = self->_currentEffectDecorationViews;
  if (!currentEffectDecorationViews)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    char v5 = self->_currentEffectDecorationViews;
    self->_currentEffectDecorationViews = v4;

    currentEffectDecorationViews = self->_currentEffectDecorationViews;
  }

  return currentEffectDecorationViews;
}

- (void)startFullscreenEffectIfNeededForChatItem:(id)a3
{
  id v4 = a3;
  char v5 = [v4 messageItem];
  int v6 = [v5 unsentIsFromMeItem];

  if (v6)
  {
    char v7 = [(CKTranscriptCollectionViewController *)self delegate];
    [v7 transcriptCollectionViewControllerWillBeginFullscreenEffectAnimationForOutgoingMessage:self];
  }
  id v10 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  id v8 = [(CKTranscriptCollectionViewController *)self textInputMode];
  int v9 = [v8 primaryLanguage];
  [v10 startFullscreenEffectForChatItem:v4 language:v9];
}

- (void)stopFullscreenEffect
{
  id v2 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v2 stopFullscreenEffect];
}

- (BOOL)isVisiblePlugin:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  int v6 = [v5 visibleCells];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = [(CKTranscriptCollectionViewController *)self chatItemForCell:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v12 = [v11 bundleIdentifier];
          char v13 = [v12 isEqualToString:v4];

          if (v13)
          {

            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)hasRecentTouchForSendingPlugin:(id)a3
{
  id v4 = a3;
  char v5 = [(CKTranscriptCollectionViewController *)self mostRecentlyTouchedPlugin];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (void)clearRecentPluginTouch
{
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v15 = a3;
  id v4 = [(CKTranscriptCollectionViewController *)self chat];
  uint64_t v5 = *MEMORY[0x1E4F6B950];
  if (([v4 isHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B950]] & 1) == 0) {
    [v4 beginHoldingChatItemsUpdatesForReason:v5];
  }
  char v6 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v6 setTranscriptScrollIntent:5];
  uint64_t v7 = [v6 panGestureRecognizer];
  [v7 locationInView:v6];
  double v9 = v8;

  id v10 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  [v10 setAnchorYPosition:v9];

  __int16 v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"transcriptCollectionViewWillBeginDragging" object:0];

  [(CKTranscriptCollectionViewController *)self stopPluginPlayback];
  [(CKTranscriptCollectionViewController *)self addContentAnimationPauseReasons:1];
  __int16 v12 = [(CKTranscriptCollectionViewController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    BOOL v14 = [(CKTranscriptCollectionViewController *)self delegate];
    [v15 contentOffset];
    objc_msgSend(v14, "transcriptCollectionViewController:willBeginDragging:", self);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  a5->x = 0.0;
  double v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isScheduledMessagesCoreEnabled];

  if (v9) {
    [(CKTranscriptCollectionViewController *)self adjustTargetContentOffsetToCurrentTimeIfNeeded:a5];
  }
  id v10 = [v7 panGestureRecognizer];
  char v11 = [v10 _canPanVertically];

  if (v11)
  {
    -[CKTranscriptCollectionViewController updateTranscriptScrollIntentForUserScrollToContentOffset:](self, "updateTranscriptScrollIntentForUserScrollToContentOffset:", a5->x, a5->y);
  }
  else
  {
    __int16 v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Not updating scroll intent for user drag gesture because vertical panning is disabled. Probably during a swipe to reply.", v17, 2u);
    }

    [(CKTranscriptCollectionViewController *)self updateTranscriptScrollIntentToBottomOrHistoryBasedOnCurrentContentOffset];
  }
  char v13 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  objc_msgSend(v13, "setTargetContentOffset:", a5->x, a5->y);

  -[CKTranscriptCollectionViewController _loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:](self, "_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:", 0, a5->x, a5->y);
  BOOL v14 = [(CKTranscriptCollectionViewController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    long long v16 = [(CKTranscriptCollectionViewController *)self delegate];
    [v7 contentOffset];
    objc_msgSend(v16, "transcriptCollectionViewController:willEndDragging:withVelocity:targetContentOffset:", self, a5);
  }
}

- (void)adjustTargetContentOffsetToCurrentTimeIfNeeded:(CGPoint *)a3
{
  if (-[CKTranscriptCollectionViewController isContentOffsetAtCurrentTime:](self, "isContentOffsetAtCurrentTime:", a3->x, a3->y))
  {
    id v7 = [(CKTranscriptCollectionViewController *)self latestScheduledMessageIndexPath];
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self collectionView];
    objc_msgSend(v5, "__ck_bottomOffsetHidingIndexPath:", v7);
    a3->y = v6;
  }
}

- (BOOL)isContentOffsetAtCurrentTime:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CGFloat v6 = [(CKTranscriptCollectionViewController *)self latestScheduledMessageIndexPath];
  id v7 = v6;
  if (v6 && [v6 item])
  {
    double v8 = [(CKTranscriptCollectionViewController *)self collectionView];
    objc_msgSend(v8, "__ck_bottomOffsetHidingIndexPath:", v7);
    double v10 = v9;

    char v11 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
    __int16 v12 = [v11 layoutAttributesForItemAtIndexPath:v7];

    char v13 = +[CKUIBehavior sharedBehaviors];
    [v13 largeTranscriptSpace];
    double v15 = v14;

    [v12 frame];
    if (y >= v10 - v15 && y <= v10 + v16 * 0.75)
    {
      if (IMOSLoggingEnabled())
      {
        long long v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v24.CGFloat x = x;
          v24.double y = y;
          long long v19 = NSStringFromCGPoint(v24);
          int v21 = 138412290;
          __int16 v22 = v19;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "We're currently at or around the currentTime offset, currentOffset: %@", (uint8_t *)&v21, 0xCu);
        }
      }
      BOOL v17 = 1;
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)isContentOffsetAtOrBelowBottom:(CGPoint)a3
{
  double y = a3.y;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(CKTranscriptCollectionViewController *)self _platformSpecificBottomContentOffset];
  double v5 = v4;
  double v6 = v4 + -1.0;
  id v7 = IMLogHandleForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (y < v6)
  {
    if (v8)
    {
      int v11 = 134218240;
      double v12 = y;
      __int16 v13 = 2048;
      double v14 = v5;
      double v9 = "Content offset of %.2f is above bottom offset %.2f.";
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    int v11 = 134218240;
    double v12 = y;
    __int16 v13 = 2048;
    double v14 = v5;
    double v9 = "Content offset of %.2f is at/below the bottom offset of %.2f.";
LABEL_6:
    _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v11, 0x16u);
  }

  return y >= v6;
}

- (BOOL)isContentOffsetAtOrBelowReplies:(CGPoint)a3
{
  return 0;
}

- (void)updateTranscriptScrollIntentForUserScrollToContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v7 = [v6 transcriptScrollIntent];
  if (v7 == 3)
  {
    BOOL v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[CKTranscriptCollectionViewController updateTranscriptScrollIntentForUserScrollToContentOffset:]();
    }
    goto LABEL_7;
  }
  if (v7 == 4)
  {
    BOOL v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[CKTranscriptCollectionViewController updateTranscriptScrollIntentForUserScrollToContentOffset:]();
    }
LABEL_7:
  }
  [(CKTranscriptCollectionViewController *)self _updateTranscriptScrollIntentForContentOffset:@"User scroll", x, y reason];
}

- (void)updateTranscriptScrollIntentToBottomOrHistoryBasedOnCurrentContentOffset
{
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  [(CKTranscriptCollectionViewController *)self _updateTranscriptScrollIntentForContentOffset:@"Current content offset", v5, v7 reason];
}

- (void)_updateTranscriptScrollIntentForContentOffset:(CGPoint)a3 reason:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = [(CKTranscriptCollectionViewController *)self collectionView];
  unint64_t v9 = -[CKTranscriptCollectionViewController desiredTranscriptScrollIntentForContentOffset:](self, "desiredTranscriptScrollIntentForContentOffset:", x, y);
  [v8 invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange];
  double v10 = CKDebugNameForCKTranscriptScrollIntent(v9);
  int v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    __int16 v13 = v10;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Updating scroll intent to %{public}@ reason: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [v8 setTranscriptScrollIntent:v9];
}

- (int64_t)desiredTranscriptScrollIntentForCurrentContentOffset
{
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v3 contentOffset];
  int64_t v4 = -[CKTranscriptCollectionViewController desiredTranscriptScrollIntentForContentOffset:](self, "desiredTranscriptScrollIntentForContentOffset:");

  return v4;
}

- (int64_t)desiredTranscriptScrollIntentForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (-[CKTranscriptCollectionViewController isContentOffsetAtOrBelowReplies:](self, "isContentOffsetAtOrBelowReplies:"))
  {
    unint64_t v6 = 7;
  }
  else
  {
    unint64_t v6 = 1;
    if (!-[CKTranscriptCollectionViewController isLoadMoreSpinnerAboutToBeVisibleForDirection:withTargetContentOffset:](self, "isLoadMoreSpinnerAboutToBeVisibleForDirection:withTargetContentOffset:", 1, x, y))
    {
      if (-[CKTranscriptCollectionViewController isContentOffsetAtOrBelowBottom:](self, "isContentOffsetAtOrBelowBottom:", x, y))
      {
        unint64_t v6 = 6;
      }
      else
      {
        unint64_t v6 = -[CKTranscriptCollectionViewController isContentOffsetAtCurrentTime:](self, "isContentOffsetAtCurrentTime:", x, y) ^ 1;
      }
    }
  }
  id v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = CKDebugNameForCKTranscriptScrollIntent(v6);
    v16.double x = x;
    v16.double y = y;
    unint64_t v9 = NSStringFromCGPoint(v16);
    int v11 = 138543618;
    int v12 = v8;
    __int16 v13 = 2114;
    __int16 v14 = v9;
    _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Calculated desiredTranscriptScrollIntent as %{public}@ for offset %{public}@", (uint8_t *)&v11, 0x16u);
  }
  return v6;
}

- (CGPoint)_platformSpecificBottomContentOffset
{
  id v2 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 scrollToBottomStopsAtTopOfLastBubble];

  if (v4)
  {
    double v5 = objc_msgSend(v2, "__ck_indexPathForInputView");
    objc_msgSend(v2, "__ck_bottomOffsetHidingIndexPath:", v5);
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    objc_msgSend(v2, "__ck_bottomOffset");
    double v7 = v10;
    double v9 = v11;
  }

  double v12 = v7;
  double v13 = v9;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(CKTranscriptCollectionViewController *)self chat];
  [v7 endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B950]];
  double v8 = [(CKTranscriptCollectionViewController *)self collectionView];
  if ([v8 transcriptScrollIntent] == 5)
  {
    double v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController scrollViewDidEndDragging:willDecelerate:]();
    }

    [(CKTranscriptCollectionViewController *)self updateTranscriptScrollIntentToBottomOrHistoryBasedOnCurrentContentOffset];
  }
  [v6 contentOffset];
  if (v10 == 0.0 && ([v6 isDragging] & 1) == 0) {
    [(CKTranscriptCollectionViewController *)self setPeeking:0];
  }
  -[CKTranscriptCollectionViewController setPeekSampleTranslation:](self, "setPeekSampleTranslation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if (!a4)
  {
    [(CKTranscriptCollectionViewController *)self removeContentAnimationPauseReasons:1];
    [(CKTranscriptCollectionViewController *)self _collectionViewDidRestAsync:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 contentOffset];
  if (v5 == 0.0 && ([v4 isDragging] & 1) == 0) {
    [(CKTranscriptCollectionViewController *)self setPeeking:0];
  }
  id v6 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
  [v6 matchScrollViewOffset:v4];

  [(CKTranscriptCollectionViewController *)self cullCellSubviews];
  [(CKTranscriptCollectionViewController *)self clearRecentPluginTouch];
  double v7 = [(CKTranscriptCollectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(CKTranscriptCollectionViewController *)self delegate];
    [v4 contentOffset];
    objc_msgSend(v9, "transcriptCollectionViewController:didScroll:", self);
  }
  if (CKIsRunningInMacCatalyst())
  {
    double v10 = +[CKUIBehavior sharedBehaviors];
    int v11 = [v10 shouldUseDynamicScrolling];

    if (v11)
    {
      if (([v4 isDecelerating] & 1) == 0)
      {
        double v12 = [v4 panGestureRecognizer];
        uint64_t v13 = [v12 state];

        if (v13 >= 1)
        {
          __int16 v14 = [v4 panGestureRecognizer];
          [v14 velocityInView:v4];
          CGFloat v16 = v15;
          double v18 = v17;

          long long v19 = [(CKTranscriptCollectionViewController *)self collectionView];
          int v20 = [v19 collectionViewLayout];

          if ((v18 == 0.0) != [v20 disableDynamicsWhileScrolling])
          {
            [v20 setDisableDynamicsWhileScrolling:v18 == 0.0];
            if (IMOSLoggingEnabled())
            {
              int v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                v31.double x = v16;
                v31.double y = v18;
                uint64_t v22 = NSStringFromCGPoint(v31);
                uint64_t v23 = (void *)v22;
                CGPoint v24 = @"NO";
                if (v18 == 0.0) {
                  CGPoint v24 = @"YES";
                }
                int v26 = 138412546;
                long long v27 = v24;
                __int16 v28 = 2112;
                uint64_t v29 = v22;
                _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Changing dynamicsDisabled on scroll to %@ - the scroll velocity is %@", (uint8_t *)&v26, 0x16u);
              }
            }
          }
        }
      }
    }
  }
  long long v25 = [(CKTranscriptCollectionViewController *)self presentedChatItemScrollOffset];

  if (v25) {
    [(CKTranscriptCollectionViewController *)self setPresentedChatItemScrollOffset:0];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(CKTranscriptCollectionViewController *)self removeContentAnimationPauseReasons:1];
  [(CKTranscriptCollectionViewController *)self _collectionViewDidRestAsync:0];
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isExpressiveTextEnabled];

  if (v5)
  {
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator resetBackoffState];
    transcriptTextEffectCoordinator = self->_transcriptTextEffectCoordinator;
    [(CKTextEffectCoordinator *)transcriptTextEffectCoordinator updateWithReason:@"scrollViewDidEndDecelerating"];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(CKTranscriptCollectionViewController *)self removeContentAnimationPauseReasons:1];

  [(CKTranscriptCollectionViewController *)self _collectionViewDidRestAsync:0];
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v5 = [WeakRetained transcriptCollectionViewControllerShouldShouldScrollToTopForStatusBarTap:self];

  id v6 = IMLogHandleForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Scrolling to top (probably because the user tapped status bar)", buf, 2u);
    }

    [(CKTranscriptCollectionViewController *)self addContentAnimationPauseReasons:1];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Returning NO from scrollViewShouldScrollToTop", v9, 2u);
    }
  }
  return v5;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  [(CKTranscriptCollectionViewController *)self removeContentAnimationPauseReasons:1];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  -[CKTranscriptCollectionViewController updateTranscriptScrollIntentForUserScrollToContentOffset:](self, "updateTranscriptScrollIntentForUserScrollToContentOffset:", v6, v8);

  [(CKTranscriptCollectionViewController *)self _collectionViewDidRestAsync:1];
}

- (void)_setHoldingWhilePresentingKeyboardForChatItem:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(CKTranscriptCollectionViewController *)self chat];
  double v5 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  double v6 = v5;
  if (v3)
  {
    [v5 beginHoldingUpdatesForKey:@"CKFullscreenUpdatesPresentingKeyboardForChatItem"];
    [(CKTranscriptCollectionViewController *)self addContentAnimationPauseReasons:16];
    [v7 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B948]];
  }
  else
  {
    [v5 endHoldingUpdatesForKey:@"CKFullscreenUpdatesPresentingKeyboardForChatItem"];
    [(CKTranscriptCollectionViewController *)self removeContentAnimationPauseReasons:16];
    [v7 endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B948]];
  }
}

- (CGRect)collectionViewAdjustedContentFrameWithKeyboard:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v7 adjustedContentInset];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [MEMORY[0x1E4F42B08] sizeForInterfaceOrientation:CKNonFlatDeviceOrientation() ignoreInputView:1];
  double v17 = v13 + v16;
  [v7 frame];
  double v20 = v9 + v19;
  double v22 = v21 - (v11 + v15);
  double v24 = v23 - (v9 + v17);
  double v25 = left + v11 + v18;
  double v26 = top + v20;
  double v27 = v22 - (left + right);
  double v28 = v24 - (top + bottom);

  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)beginPresentingChatItemForKeyboardPresentation:(id)a3 layoutAreaContentInsets:(UIEdgeInsets)a4 completion:(id)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v11 = a3;
  id v12 = a5;
  [(CKTranscriptCollectionViewController *)self _setHoldingWhilePresentingKeyboardForChatItem:1];
  [(CKTranscriptCollectionViewController *)self setIsPresentingChatItemForKeyboard:1];
  double v13 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v13 setIgnoresAutomaticScrollsTowardBottom:1];

  double v14 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v14 setScrollEnabled:0];

  dispatch_time_t v15 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__CKTranscriptCollectionViewController_beginPresentingChatItemForKeyboardPresentation_layoutAreaContentInsets_completion___block_invoke;
  block[3] = &unk_1E5627248;
  void block[4] = self;
  id v19 = v11;
  CGFloat v21 = top;
  CGFloat v22 = left;
  CGFloat v23 = bottom;
  CGFloat v24 = right;
  id v20 = v12;
  id v16 = v12;
  id v17 = v11;
  dispatch_after(v15, MEMORY[0x1E4F14428], block);
}

void __122__CKTranscriptCollectionViewController_beginPresentingChatItemForKeyboardPresentation_layoutAreaContentInsets_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 contentOffset];
  uint64_t v48 = v4;
  uint64_t v49 = v3;
  double v5 = [*(id *)(a1 + 32) balloonViewForChatItem:*(void *)(a1 + 40)];
  double v6 = [v2 window];
  [v5 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  dispatch_time_t v15 = [v5 superview];
  objc_msgSend(v6, "convertRect:fromView:", v15, v8, v10, v12, v14);
  CGFloat v17 = v16;
  double v19 = v18;
  CGFloat v21 = v20;
  double v23 = v22;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewAdjustedContentFrameWithKeyboard:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v32 = [v2 window];
  v33 = [v2 superview];
  objc_msgSend(v32, "convertRect:fromView:", v33, v25, v27, v29, v31);
  CGFloat v35 = v34;
  double v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;

  if (v19 >= v37)
  {
    v54.origin.double x = v17;
    v54.origin.double y = v19;
    v54.size.CGFloat width = v21;
    v54.size.CGFloat height = v23;
    double MaxY = CGRectGetMaxY(v54);
    v55.origin.double x = v35;
    v55.origin.double y = v37;
    v55.size.CGFloat width = v39;
    v55.size.CGFloat height = v41;
    BOOL v44 = MaxY <= CGRectGetMaxY(v55);
    double v42 = v19;
    if (!v44)
    {
      v56.origin.double x = v35;
      v56.origin.double y = v37;
      v56.size.CGFloat width = v39;
      v56.size.CGFloat height = v41;
      double v42 = CGRectGetMaxY(v56) - v23;
    }
  }
  else
  {
    double v42 = v37;
  }
  double v45 = v19 - v42;
  if (v45 != 0.0)
  {
    long long v46 = [*(id *)(a1 + 32) collectionView];
    [v46 setScrollEnabled:1];

    long long v47 = *(void **)(a1 + 32);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __122__CKTranscriptCollectionViewController_beginPresentingChatItemForKeyboardPresentation_layoutAreaContentInsets_completion___block_invoke_2;
    v50[3] = &unk_1E5627220;
    v50[4] = v47;
    uint64_t v52 = v49;
    uint64_t v53 = v48;
    id v51 = *(id *)(a1 + 48);
    [v47 verticallyScrollTranscriptByAmount:1 animated:v50 completion:v45];
  }
}

uint64_t __122__CKTranscriptCollectionViewController_beginPresentingChatItemForKeyboardPresentation_layoutAreaContentInsets_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 setScrollEnabled:1];

  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v3 = [MEMORY[0x1E4F29238] valueWithBytes:&v5 objCType:"{CGPoint=dd}"];
  [*(id *)(a1 + 32) setPresentedChatItemScrollOffset:v3];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)endPresentingChatItemForKeyboardPresentation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if ([(CKTranscriptCollectionViewController *)self isPresentingChatItemForKeyboard])
  {
    double v6 = [(CKTranscriptCollectionViewController *)self collectionView];
    [v6 setScrollEnabled:1];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    CGFloat v17 = __96__CKTranscriptCollectionViewController_endPresentingChatItemForKeyboardPresentation_completion___block_invoke;
    double v18 = &unk_1E5622330;
    double v19 = self;
    id v20 = v5;
    double v7 = (void (**)(void))_Block_copy(&v15);
    double v8 = [(CKTranscriptCollectionViewController *)self presentedChatItemScrollOffset];

    if (v8)
    {
      double v9 = [(CKTranscriptCollectionViewController *)self presentedChatItemScrollOffset];
      [v9 pointValue];
      double v11 = v10;

      [(CKTranscriptCollectionViewController *)self setPresentedChatItemScrollOffset:0];
      double v12 = [(CKTranscriptCollectionViewController *)self collectionView];
      [v12 contentOffset];
      double v14 = v13;

      [(CKTranscriptCollectionViewController *)self verticallyScrollTranscriptByAmount:1 animated:v7 completion:v11 - v14];
    }
    else
    {
      v7[2](v7);
    }
  }
}

void __96__CKTranscriptCollectionViewController_endPresentingChatItemForKeyboardPresentation_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHoldingWhilePresentingKeyboardForChatItem:0];
  [*(id *)(a1 + 32) setIsPresentingChatItemForKeyboard:0];
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 setScrollEnabled:1];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__CKTranscriptCollectionViewController_endPresentingChatItemForKeyboardPresentation_completion___block_invoke_2;
  block[3] = &unk_1E5620C40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __96__CKTranscriptCollectionViewController_endPresentingChatItemForKeyboardPresentation_completion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 setIgnoresAutomaticScrollsTowardBottom:0];
}

- (void)stopPluginPlayback
{
  id v2 = [(CKTranscriptCollectionViewController *)self pluginPlaybackManager];
  [v2 stopPlayback];
}

- (void)startPluginPlaybackAfterDelay:(double)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__deferredStartPlayback object:0];

  [(CKTranscriptCollectionViewController *)self performSelector:sel__deferredStartPlayback withObject:0 afterDelay:a3];
}

- (void)_deferredStartPlayback
{
  if ([(CKTranscriptCollectionViewController *)self allowsPluginPlayback])
  {
    uint64_t v3 = [(CKTranscriptCollectionViewController *)self pluginPlaybackManager];
    char v4 = [v3 isPlayingBack];

    if ((v4 & 1) == 0)
    {
      id v6 = [(CKTranscriptCollectionViewController *)self collectionView];
      id v5 = [v6 indexPathsForVisibleItems];
      [(CKTranscriptCollectionViewController *)self _startPlaybackWithIndexPaths:v5];
    }
  }
}

- (void)_startPlaybackWithIndexPaths:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v24 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v7 = 138412546;
    long long v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (!objc_msgSend(v10, "section", v23))
        {
          unint64_t v11 = [v10 item];
          double v12 = [(CKTranscriptCollectionViewController *)self chatItems];
          BOOL v13 = v11 < [v12 count];

          if (v13)
          {
            double v14 = [(CKTranscriptCollectionViewController *)self chatItems];
            uint64_t v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v10, "item"));

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v15;
              CGFloat v17 = [v16 IMChatItem];
              int v18 = [v17 wantsAutoPlayback];

              if (v18) {
                [v24 addObject:v16];
              }
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              double v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                id v20 = [(CKTranscriptCollectionViewController *)self chatItems];
                *(_DWORD *)buf = v23;
                double v30 = v10;
                __int16 v31 = 2112;
                double v32 = v20;
                _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Attempted to access chatItems out of bounds (%@): %@", buf, 0x16u);
              }
            }
            IMLogBacktrace();
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v6);
  }

  [v24 sortUsingComparator:&__block_literal_global_498_0];
  [(CKTranscriptCollectionViewController *)self stopPluginPlayback];
  CGFloat v21 = [[CKPluginPlaybackManager alloc] initWithPluginItems:v24];
  [(CKPluginPlaybackManager *)v21 setDelegate:self];
  double v22 = [(CKTranscriptCollectionViewController *)self pluginPlaybackManager];
  [v22 setDelegate:0];

  [(CKTranscriptCollectionViewController *)self setPluginPlaybackManager:v21];
  [(CKPluginPlaybackManager *)v21 startPlayback];
}

BOOL __69__CKTranscriptCollectionViewController__startPlaybackWithIndexPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 message];
  uint64_t v6 = [v5 messageID];
  long long v7 = [v4 message];

  BOOL v8 = v6 > [v7 messageID];
  return v8;
}

- (void)pluginPlaybackManagerDidStopPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self pluginPlaybackManager];

  if (v5 == v4)
  {
    [(CKTranscriptCollectionViewController *)self setPluginPlaybackManager:0];
  }
}

- (void)collectionViewLayoutRestingDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self delegate];
  [v5 transcriptCollectionViewControllerRestingStateDidChange:self];

  LODWORD(v5) = [v4 isResting];
  if (v5)
  {
    [(CKTranscriptCollectionViewController *)self _collectionViewDidRestAsync:1];
  }
}

- (id)overrideCurrentFrameMapForLayout:(id)a3
{
  return 0;
}

- (id)overrideTargetFrameMapForLayout:(id)a3
{
  return 0;
}

- (id)balloonOffsetMapForLayout:(id)a3 resetsOffsetMapAfterUse:(BOOL)a4
{
  return 0;
}

- (BOOL)collectionViewLayout:(id)a3 hasPlayingOrPausedTextEffectForChatItem:(id)a4 indexPath:(id)a5
{
  id v6 = a4;
  long long v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isExpressiveTextEnabled];

  if (v8)
  {
    if ([v6 _textContainsIMTextEffect]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v9 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v6];
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v10 = [v9 balloonView];
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          unint64_t v11 = [v10 textView];
          double v12 = v11;
          if (v11) {
            LOBYTE(v8) = objc_msgSend(v11, "ck_hasPlayingOrPausedTextAnimator");
          }
          else {
            LOBYTE(v8) = 0;
          }
        }
        else
        {
          LOBYTE(v8) = 0;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (void)_collectionViewDidRestAsync:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__CKTranscriptCollectionViewController__collectionViewDidRestAsync___block_invoke;
    block[3] = &unk_1E5620C40;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v4 = [(CKTranscriptCollectionViewController *)self collectionView];
    [v4 contentOffset];
    double v6 = v5;
    double v8 = v7;
    if ([v4 transcriptScrollIntent] == 6)
    {
      objc_msgSend(v4, "__ck_bottomOffset");
      double v6 = v9;
      double v8 = v10;
    }
    -[CKTranscriptCollectionViewController _loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:](self, "_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:", 0, v6, v8);
  }
  [(CKTranscriptCollectionViewController *)self pluginPlaybackDelay];
  -[CKTranscriptCollectionViewController startPluginPlaybackAfterDelay:](self, "startPluginPlaybackAfterDelay:");
}

uint64_t __68__CKTranscriptCollectionViewController__collectionViewDidRestAsync___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = *(void **)(a1 + 32);

  return objc_msgSend(v7, "_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:", 0, v4, v6);
}

- (id)compositorDatasourceItemsForSection:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    goto LABEL_5;
  }
  if (!a3)
  {
    double v3 = [(CKTranscriptCollectionViewController *)self chatItems];
LABEL_5:
    double v4 = v3;
    if (v3)
    {
      id v5 = v3;
      double v4 = v5;
    }
    else
    {
      id v5 = (id)objc_opt_new();
    }
    double v6 = v5;

    goto LABEL_10;
  }
  double v6 = 0;
LABEL_10:

  return v6;
}

- (id)layoutGroupForDatasourceItems:(id)a3 environment:(id)a4 layoutItems:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)[v7 count] >= 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v11)
    {
      double v12 = 0;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "customLayoutGroupProviderClass", (void)v23);
          uint64_t v16 = v15;
          if (v12)
          {
            if (v12 != (objc_class *)v15)
            {
              if (IMOSLoggingEnabled())
              {
                id v20 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  long long v28 = "-[CKTranscriptCollectionViewController layoutGroupForDatasourceItems:environment:layoutItems:]";
                  __int16 v29 = 2112;
                  double v30 = v12;
                  __int16 v31 = 2112;
                  uint64_t v32 = v16;
                  _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "CKTranscriptCollectionViewController - %s got a layout group with differing layout group classes, returning nil. Expected %@ got %@", buf, 0x20u);
                }
              }
              goto LABEL_25;
            }
          }
          else
          {
            double v12 = (objc_class *)v15;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }

      if (v12)
      {
        id v17 = objc_alloc_init(v12);
        int v18 = [v17 layoutGroupForDatasourceItems:v10 environment:v8 layoutItems:v9];

        goto LABEL_26;
      }
    }
    else
    {
    }
    if (IMOSLoggingEnabled())
    {
      CGFloat v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v28 = "-[CKTranscriptCollectionViewController layoutGroupForDatasourceItems:environment:layoutItems:]";
        __int16 v29 = 2112;
        double v30 = (objc_class *)v10;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKTranscriptCollectionViewController - %s got a nil layout group provider for items %@", buf, 0x16u);
      }
    }
  }
LABEL_25:
  int v18 = 0;
LABEL_26:

  return v18;
}

- (BOOL)compositorSupportsCustomLayoutGroupsForSection:(int64_t)a3
{
  return a3 == 0;
}

- (BOOL)compositorSupportsCustomLayoutGroupsForLayoutProvider:(id)a3
{
  uint64_t v3 = [a3 chatItemClass];
  return v3 == objc_opt_class();
}

- (void)collectionViewWillScroll:(id)a3 targetContentOffset:(CGPoint *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isDragging]
    && ![(CKTranscriptCollectionViewController *)self isPeeking])
  {
    id v20 = [v6 panGestureRecognizer];
    [v20 translationInView:v6];
    double v22 = v21;
    double v24 = v23;

    [(CKTranscriptCollectionViewController *)self peekSampleTranslation];
    double v26 = v25;
    double v28 = v27 - v22;
    __int16 v29 = [v6 layer];
    int v30 = [v29 flipsHorizontalAxis];

    if (v30) {
      double v28 = -v28;
    }
    if (v28 >= 20.0)
    {
      float v31 = v26 - v24;
      float v32 = v28;
      if (fabs(atan2f(v31, v32) * 57.2957795) < 5.0)
      {
        [(CKTranscriptCollectionViewController *)self setPeeking:1];
        double v22 = 20.0 - v28;
        v33 = [v6 panGestureRecognizer];
        objc_msgSend(v33, "setTranslation:inView:", v6, 20.0 - v28, v24);
      }
      -[CKTranscriptCollectionViewController setPeekSampleTranslation:](self, "setPeekSampleTranslation:", v22, v24);
    }
    a4->double x = 0.0;
    goto LABEL_23;
  }
  if (a4->x == 0.0)
  {
LABEL_23:
    double v34 = 0.0;
    goto LABEL_37;
  }
  id v7 = +[CKUIBehavior sharedBehaviors];
  [v6 marginInsets];
  objc_msgSend(v7, "transcriptDrawerMaxContentOffsetXForMarginInsets:");
  double v9 = v8;
  id v10 = [v6 layer];
  int v11 = [v10 flipsHorizontalAxis];

  double x = a4->x;
  if (v11)
  {
    double v13 = -x;
    if (v9 <= v13) {
      double v13 = v9;
    }
    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    double v14 = -v13;
    a4->double x = -v13;
    if (CKMainScreenScale_once_39 != -1) {
      dispatch_once(&CKMainScreenScale_once_39, &__block_literal_global_2509);
    }
    double v15 = *(double *)&CKMainScreenScale_sMainScreenScale_39;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_39 == 0.0) {
      double v15 = 1.0;
    }
    double v16 = floor(v15 * v14) / v15;
    CGFloat v17 = 0.0;
    if (v16 != 0.0) {
      CGFloat v17 = a4->x;
    }
    a4->double x = v17;
    [v7 transcriptDrawerGestureAcceleration];
    double v19 = -a4->x;
  }
  else
  {
    if (x >= v9) {
      double x = v9;
    }
    if (x >= 0.0) {
      double v35 = x;
    }
    else {
      double v35 = 0.0;
    }
    a4->double x = v35;
    if (CKMainScreenScale_once_39 != -1) {
      dispatch_once(&CKMainScreenScale_once_39, &__block_literal_global_2509);
    }
    double v36 = *(double *)&CKMainScreenScale_sMainScreenScale_39;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_39 == 0.0) {
      double v36 = 1.0;
    }
    double v37 = floor(v35 * v36) / v36;
    CGFloat v38 = 0.0;
    if (v37 != 0.0) {
      CGFloat v38 = a4->x;
    }
    a4->double x = v38;
    [v7 transcriptDrawerGestureAcceleration];
    double v19 = a4->x;
  }
  double v34 = fmin(v18 * (v19 / v9), 1.0);

LABEL_37:
  CGFloat v39 = +[CKUIBehavior sharedBehaviors];
  if ([v39 disableTranscriptTimestamps])
  {

    goto LABEL_39;
  }
  if (a4->x == 0.0)
  {
    objc_msgSend(v6, "contentOffset", a4->x);
    double v41 = v40;

    if (v41 == 0.0)
    {
LABEL_39:
      if (CKIsRunningInMacCatalyst()) {
        [(CKTranscriptCollectionViewController *)self hideTranscriptTimestampsIfNeeded];
      }
      goto LABEL_54;
    }
  }
  else
  {
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  double v42 = objc_msgSend(v6, "visibleCells", 0);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v49 != v45) {
          objc_enumerationMutation(v42);
        }
        long long v47 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [(CKTranscriptCollectionViewController *)self freezeReplyDecorationsIfNeededForCell:v47];
          [v47 setDrawerPercentRevealed:v34];
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v44);
  }

LABEL_54:
}

- (void)freezeReplyDecorationsIfNeededForCell:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    objc_msgSend(v4, "setShouldFreezeReplyDecorationsForTimestampReveal:", -[CKTranscriptCollectionViewController shouldFreezeReplyDecorationsForCell:](self, "shouldFreezeReplyDecorationsForCell:", v4));
  }
}

- (BOOL)shouldFreezeReplyDecorationsForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self chat];
  char v6 = [v5 isGroupChat];

  if (v6)
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      double v8 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v4];
      double v9 = [v8 IMChatItem];
      char v10 = [v9 isFromMe];

      if (v10)
      {
        char isKindOfClass = 0;
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
    }
  }

  return isKindOfClass & 1;
}

- (void)collectionViewWillProgrammaticallyScroll:(id)a3 animated:(BOOL)a4
{
  if (a4) {
    [(CKTranscriptCollectionViewController *)self addContentAnimationPauseReasons:1];
  }
}

- (void)transcriptCollectionView:(id)a3 shouldScrollToHighlightedMessage:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained transcriptCollectionViewController:self shouldScrollToHighlightedMessage:v6];
}

- (BOOL)isShowingTranscriptTimestamps
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v3 = [v2 visibleCells];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v7 drawerPercentRevealed];
          if (v8 > 0.0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)hideTranscriptTimestampsIfNeeded
{
  if ([(CKTranscriptCollectionViewController *)self isShowingTranscriptTimestamps])
  {
    uint64_t v3 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v4 = [v3 visibleCells];
    uint64_t v5 = (void *)MEMORY[0x1E4F42FF0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__CKTranscriptCollectionViewController_hideTranscriptTimestampsIfNeeded__block_invoke;
    v7[3] = &unk_1E5620C40;
    id v8 = v4;
    id v6 = v4;
    [v5 animateWithDuration:0 delay:v7 options:0 animations:0.25 completion:0.0];
  }
}

void __72__CKTranscriptCollectionViewController_hideTranscriptTimestampsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v6;
          objc_msgSend(v7, "setShouldFreezeReplyDecorationsForTimestampReveal:", 0, (void)v8);
          [v7 setDrawerPercentRevealed:0.0];
          [v7 layoutIfNeeded];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)showTranscriptTimestamps
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__CKTranscriptCollectionViewController_showTranscriptTimestamps__block_invoke;
  v2[3] = &unk_1E5620C40;
  void v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v2 options:0 animations:0.25 completion:0.0];
}

void __64__CKTranscriptCollectionViewController_showTranscriptTimestamps__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(v2, "visibleCells", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          [*(id *)(a1 + 32) freezeReplyDecorationsIfNeededForCell:v8];
          [v8 setDrawerPercentRevealed:1.0];
          [v8 layoutIfNeeded];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (id)newTranscriptTextEffectCoordinatorForTranscriptCollectionViewController:(id)a3 isInline:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isExpressiveTextEnabled];

  if (v7)
  {
    long long v8 = +[CKPrintController sharedInstance];
    char v9 = [v8 isPrinting];

    if ((v9 & 1) == 0)
    {
      if (v4)
      {
        if (!+[CKTextEffectCoordinator inlineRepliesTextEffectCoordinationDisabled])
        {
          long long v10 = @"transcript_inline";
LABEL_10:
          long long v11 = [[_TtC7ChatKit23CKTextEffectCoordinator alloc] initWithLogIdentifier:v10];
          [(CKTextEffectCoordinator *)v11 setDelegate:v5];
          goto LABEL_8;
        }
      }
      else if (!+[CKTextEffectCoordinator transcriptTextEffectCoordinationDisabled])
      {
        long long v10 = @"transcript";
        goto LABEL_10;
      }
    }
  }
  long long v11 = 0;
LABEL_8:

  return v11;
}

- (void)_textMessagePartItem:(id)a3 textBalloonView:(id)a4 getHasValidOrigin:(BOOL *)a5 getHasValidSize:(BOOL *)a6
{
  id v9 = a4;
  [a3 size];
  objc_msgSend(v9, "_computedTextViewFrameForBoundsSize:");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [v9 textView];

  [v18 frame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  BOOL v27 = CKPointApproximatelyEqualToPointWithTolerance(v20, v22, v11, v13, 0.5);
  if (a5) {
    *a5 = v27;
  }
  BOOL v28 = CKSizeApproximatelyEqualToSizeWithTolerance(v24, v26, v15, v17, 0.5);
  if (a6) {
    *a6 = v28;
  }
}

- (id)textEffectCoordinator:(id)a3 explodeConfigurationForTextViewIdentifier:(id)a4
{
  id v21 = 0;
  BOOL v4 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItemGUID:a4 getChatItem:&v21];
  id v5 = v21;
  uint64_t v6 = v5;
  if (v4
    && v5
    && ([v5 isFromMe] & 1) != 0
    && (long long v19 = 0u,
        long long v20 = 0u,
        long long v17 = 0u,
        long long v18 = 0u,
        long long v16 = 0u,
        [v4 balloonDescriptor],
        !BYTE2(v16) && v17 < 2u))
  {
    long long v13 = v18;
    long long v14 = v19;
    long long v15 = v20;
    long long v11 = v16;
    long long v12 = v17;
    int v7 = CKResolvedBackgroundColorForBalloonDescriptor((uint64_t)&v11);
    long long v13 = v18;
    long long v14 = v19;
    long long v15 = v20;
    long long v11 = v16;
    long long v12 = v17;
    long long v8 = CKResolvedColorForBalloonDescriptor((uint64_t)&v11);
    id v9 = [[_TtC7ChatKit32CKTextEffectExplodeConfiguration alloc] initWithSourceColor:v7 targetColor:v8];
  }
  else
  {
    id v9 = +[CKTextEffectExplodeConfiguration defaultConfiguration];
  }

  return v9;
}

- (id)visibleTextViewIdentifiersFor:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained) {
    goto LABEL_26;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    goto LABEL_26;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  [v8 effectiveVisibleRectOfCollectionViewForTranscriptCollectionViewController:self];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] != v14 || v17 != v16)
  {
    long long v19 = [(CKTranscriptCollectionViewController *)self collectionView];
    long long v20 = [v19 collectionViewLayout];
    id v21 = objc_msgSend(v20, "layoutAttributesForElementsInRect:", v10, v12, v14, v16);
    double v22 = v21;
    if (v21 && [v21 count])
    {
      double v36 = v20;
      double v37 = v19;
      CGFloat v38 = objc_opt_new();
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      double v35 = v22;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v40 != v26) {
              objc_enumerationMutation(v23);
            }
            BOOL v28 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            __int16 v29 = objc_msgSend(v28, "indexPath", v35);
            if (v29
              && ![v28 representedElementCategory]
              && [v29 length] == 2
              && [v29 item] != 0x7FFFFFFFFFFFFFFFLL
              && ![v29 section])
            {
              int v30 = [(CKTranscriptCollectionViewController *)self chatItemAtIndexPath:v29];
              float v31 = [v30 IMChatItem];
              float v32 = [v31 guid];

              if (v32 && [v30 _textContainsIMTextEffect]) {
                [v38 addObject:v32];
              }
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v25);
      }

      v33 = (void *)[v38 copy];
      long long v20 = v36;
      long long v19 = v37;
      double v22 = v35;
    }
    else
    {
      v33 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
LABEL_26:
    v33 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v33;
}

- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v21 = 0;
  id v8 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItemGUID:v7 getChatItem:&v21];
  id v9 = v21;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      double v11 = [v10 IMChatItem];
      [v10 ageForTextEffectCoordination];
      if (v12 <= 1.0)
      {
        dispatch_time_t v14 = dispatch_time(0, (uint64_t)((1.0 - v12 + 0.1) * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __113__CKTranscriptCollectionViewController_textEffectCoordinator_textViewIdentifierIsCandidateForTextEffectPlayback___block_invoke;
        block[3] = &unk_1E5620AF8;
        id v19 = v11;
        id v20 = v6;
        dispatch_after(v14, MEMORY[0x1E4F14428], block);
      }
      else
      {
        if (CKReduceMotionAutoplayEnabled()) {
          goto LABEL_5;
        }
        if (IMOSLoggingEnabled())
        {
          double v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)double v17 = 0;
            _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Autoplay text effects disabled.", v17, 2u);
          }
        }
        if ([v10 isFromMe]
          && [v10 isRecentForTextEffectCoordinationWithinTimeInterval:3.0])
        {
LABEL_5:
          BOOL v13 = [(CKTranscriptCollectionViewController *)self textEffectIsCandidateBalloonViewChecksForChatItem:v10 balloonView:v8];
LABEL_9:

          goto LABEL_10;
        }
      }
      BOOL v13 = 0;
      goto LABEL_9;
    }
  }
  BOOL v13 = 0;
LABEL_10:

  return v13;
}

void __113__CKTranscriptCollectionViewController_textEffectCoordinator_textViewIdentifierIsCandidateForTextEffectPlayback___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) guid];
  uint64_t v2 = [NSString stringWithFormat:@"item %@ was too young", v3];
  [*(id *)(a1 + 40) updateWithReason:v2];
}

- (BOOL)_textMessagePartItemHasValidLayout:(id)a3 textBalloonView:(id)a4
{
  __int16 v6 = 0;
  [(CKTranscriptCollectionViewController *)self _textMessagePartItem:a3 textBalloonView:a4 getHasValidOrigin:(char *)&v6 + 1 getHasValidSize:&v6];
  if (HIBYTE(v6)) {
    BOOL v4 = v6 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (BOOL)textEffectIsCandidateBalloonViewChecksForChatItem:(id)a3 balloonView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v9 = 0;
  if (!v7 || (isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_10;
  }
  id v10 = v7;
  if ([(CKTranscriptCollectionViewController *)self _textMessagePartItemHasValidLayout:v6 textBalloonView:v10])
  {
    char v9 = [v10 isCandidateForTextEffectPlayback];
  }
  else
  {
    char v9 = 0;
  }

LABEL_10:
  return v9;
}

- (BOOL)textEffectIsCandidateBalloonViewChecksForChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:v4];
  LOBYTE(self) = [(CKTranscriptCollectionViewController *)self textEffectIsCandidateBalloonViewChecksForChatItem:v4 balloonView:v5];

  return (char)self;
}

- (id)textEffectCoordinator:(id)a3 textViewForTextViewIdentifier:(id)a4
{
  uint64_t v7 = 0;
  id v4 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItemGUID:a4 getChatItem:&v7];
  id v5 = 0;
  if (v4 && v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 textView];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28D60] indexSet];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      double v12 = [v11 firstUnreadMessageItemGUIDForTranscriptCollectionViewController:self];

      if (v12)
      {
        BOOL v13 = [(CKTranscriptCollectionViewController *)self chatItems];
        dispatch_time_t v14 = objc_msgSend(v13, "__ck_indexesOfPartsOfMessageWithGUID:", v12);

        uint64_t v15 = [v14 firstIndex];
        double v16 = [(CKTranscriptCollectionViewController *)self chatItems];
        uint64_t v17 = [v16 count];

        if (v15 != 0x7FFFFFFFFFFFFFFFLL && v17 != 0x8000000000000000)
        {
          uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v15, v17 - 1 - v15);

          id v6 = (void *)v18;
        }
      }
    }
  }
  id v19 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = v5;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v26 = [(CKTranscriptCollectionViewController *)self chatItemForGUID:v25];
        if (v26)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v26 isRecentForTextEffectCoordinationWithinTimeInterval:3.0]) {
              [v19 addObject:v25];
            }
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v22);
  }

  if ([v6 count])
  {
    BOOL v27 = [(CKTranscriptCollectionViewController *)self chatItems];
    BOOL v28 = [v27 objectsAtIndexes:v6];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(v29);
          }
          double v34 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * j), "IMChatItem", (void)v37);
          double v35 = [v34 guid];

          if (v35 && [v20 containsObject:v35]) {
            [v19 addObject:v35];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v31);
    }
  }

  return v19;
}

- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self viewIfLoaded];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 window];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [v6 windowScene];
      if (v8)
      {
        id v9 = [(CKTranscriptCollectionViewController *)self traitCollection];
        char v10 = v9;
        BOOL v11 = v9
           && [v9 activeAppearance]
           && !+[CKApplicationState isResizing]
           && [v8 activationState] == 0;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)textEffectCoordinator:(id)a3 willRequestAnimatorUsing:(id)a4
{
  id v5 = a4;
  if (objc_msgSend(MEMORY[0x1E4F42F58], "ck_supportsDynamicallyTogglingAllowsTextAnimations"))
  {
    id v4 = [v5 textView];
    [v4 setAllowsTextAnimations:1];
  }
}

- (void)textEffectCoordinator:(id)a3 didChangeStateOfAnimator:(id)a4 textView:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if (objc_msgSend(MEMORY[0x1E4F42F58], "ck_supportsDynamicallyTogglingAllowsTextAnimations"))
  {
    unint64_t v8 = [v12 state];
    id v9 = [(CKTranscriptCollectionViewController *)self collectionView];
    char v10 = [v9 collectionViewLayout];

    [v10 reloadData];
    [v10 invalidateLayout];
    if (v8 <= 1)
    {
      BOOL v11 = [v12 animation];
      objc_msgSend(v7, "setAllowsTextAnimations:", objc_msgSend(v7, "ck_isLastTextAnimation:", v11) ^ 1);
    }
  }
}

- (BOOL)_shouldMakeTextEffectStateReadyInViewDidAppearDeferredSetup
{
  return 1;
}

+ (id)initialTextEffectsState
{
  uint64_t v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isExpressiveTextEnabled];

  if (v3)
  {
    id v4 = objc_alloc_init(CKTranscriptTextEffectsState);
    [(CKTranscriptTextEffectsState *)v4 setIsReady:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)updateTextEffectsState:(id)a3
{
  textEffectsState = self->_textEffectsState;
  if (textEffectsState)
  {
    id v5 = (void (**)(id, CKTranscriptTextEffectsState *))a3;
    BOOL v6 = [(CKTranscriptTextEffectsState *)textEffectsState isPaused];
    v5[2](v5, self->_textEffectsState);

    BOOL v7 = [(CKTranscriptTextEffectsState *)self->_textEffectsState isPaused];
    LODWORD(v5) = v7;
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator setPaused:v7 includingAnimators:1];
    objc_msgSend(NSString, "stringWithFormat:", @"changed text effect state – isPausedBeforeUpdate: %i – isPaused: %i", v6, v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator updateWithReason:v8];
  }
}

- (BOOL)isTextEffectCoordinatorPaused
{
  if (!self->_transcriptTextEffectCoordinator) {
    return 1;
  }
  uint64_t v2 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
  char v3 = [v2 isPaused];

  return v3;
}

- (void)setTextEffectCoordinatorPaused:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
  unsigned int v8 = [v7 isPaused];

  id v11 = [NSString stringWithFormat:@"paused %d ↦ %d: %@", v8, v4, v6];

  id v9 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
  [v9 setPaused:v4 includingAnimators:1];

  char v10 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
  [v10 updateWithReason:v11];
}

- (void)prepareTextEffectsForModalPresentation
{
  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (v4)
  {
    id v5 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
    [v5 setPaused:1 includingAnimators:0];
    [v5 reset];
    [(CKTranscriptCollectionViewController *)self __updateLayoutAndConfigureVisibleMessagesCellsIncludingAssociatedCells:0];
  }
}

- (void)textEffectsEndTransitionSetReady
{
}

void __72__CKTranscriptCollectionViewController_textEffectsEndTransitionSetReady__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setInTransition:0];
  [v2 setIsReady:1];
}

- (void)transcriptBalloonCell:(id)a3 didChangeRenderBoundsOfTextBalloonView:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  transcriptTextEffectCoordinator = self->_transcriptTextEffectCoordinator;
  if (transcriptTextEffectCoordinator
    && ![(CKTextEffectCoordinator *)transcriptTextEffectCoordinator isPaused])
  {
    id v9 = [v7 textView];
    char v10 = [v9 attributedText];

    if (objc_msgSend(v10, "ck_hasTextAnimation"))
    {
      id v11 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v6];
      if (v11)
      {
        uint64_t v23 = v10;
        [v7 bounds];
        double v13 = v12;
        double v15 = v14;
        [v6 setNeedsLayout];
        double v16 = [v11 visibleAssociatedMessageChatItems];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
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
              uint64_t v21 = [(CKTranscriptCollectionViewController *)self cellForAssociatedChatItem:*(void *)(*((void *)&v24 + 1) + 8 * i)];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v22 = v21;
                objc_msgSend(v22, "setParentSize:", v13, v15);
                [v22 setNeedsLayout];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v18);
        }

        char v10 = v23;
      }
    }
  }
}

- (void)transcriptBalloonCell:(id)a3 textBalloonView:(id)a4 didChangeTextEffectPlaybackCandidateStatus:(BOOL)a5
{
  objc_msgSend(NSString, "stringWithFormat:", @"TextEffectPlaybackCandidateStatus did change to %{BOOL}d", a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!+[CKApplicationState isResizing]) {
    [(CKTextEffectCoordinator *)self->_transcriptTextEffectCoordinator updateWithReason:v6];
  }
}

- (unint64_t)transcriptBalloonCell:(id)a3 allowedLayoutActionForTextBalloonView:(id)a4
{
  id v6 = a4;
  if (self->_transcriptTextEffectCoordinator)
  {
    id v7 = [(CKTranscriptCollectionViewController *)self chatItemForCell:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v10 = 0;
      [(CKTranscriptCollectionViewController *)self _textMessagePartItem:v7 textBalloonView:v6 getHasValidOrigin:0 getHasValidSize:&v10];
      unint64_t v8 = v10;
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)transcriptBalloonCell:(id)a3 customTextRenderingDisplayLinkForTextBalloonViewTextView:(id)a4
{
  int v4 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
  id v5 = [v4 customRenderDisplayLink];

  return v5;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section]
    || ![(CKTranscriptCollectionViewController *)self isEditing])
  {
    char v8 = 0;
  }
  else
  {
    id v6 = [(CKTranscriptCollectionViewController *)self chatItems];
    id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "item"));
    char v8 = [v7 canBeSelectedInEditMode];
  }
  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v14 = a4;
  id v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v6 = [v14 item];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    if (v6 < (unint64_t)[v5 count])
    {
      char v8 = [v5 objectAtIndex:v7];
      id v9 = [v8 IMChatItem];
      unsigned __int8 v10 = [v9 guid];

      id v11 = [(CKTranscriptCollectionViewController *)self selectionManager];
      double v12 = +[CKBalloonSelectionState balloonSelectionState:0];
      [v11 addSelectedMessageGuid:v10 selectionState:v12];
    }
  }
  double v13 = [(CKTranscriptCollectionViewController *)self delegate];
  [v13 transcriptCollectionViewController:self didSelectItemAtIndexPath:v14];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v13 = a4;
  id v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v6 = [v13 item];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    if (v6 < (unint64_t)[v5 count])
    {
      char v8 = [v5 objectAtIndex:v7];
      id v9 = [v8 IMChatItem];
      unsigned __int8 v10 = [v9 guid];

      id v11 = [(CKTranscriptCollectionViewController *)self selectionManager];
      [v11 removeSelectedMessageGuid:v10];
    }
  }
  double v12 = [(CKTranscriptCollectionViewController *)self delegate];
  [v12 transcriptCollectionViewController:self didDeselectItemAtIndexPath:v13];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v32 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v9 section] && !+[CKApplicationState isResizing](CKApplicationState, "isResizing"))
  {
    unint64_t v10 = [v9 item];
    id v11 = [(CKTranscriptCollectionViewController *)self chatItems];
    if (v10 < [v11 count])
    {
      double v12 = [v11 objectAtIndex:v10];
      id v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v14 = [v13 isExpressiveTextEnabled];

      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 setTextEffectsDelegate:0];
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v12;
        [v8 frame];
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        [v32 bounds];
        v35.origin.double x = v17;
        v35.origin.double y = v19;
        v35.size.CGFloat width = v21;
        v35.size.CGFloat height = v23;
        if (!CGRectIntersectsRect(v34, v35))
        {
          long long v24 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
          long long v25 = [v15 extensibleViewControllerForContext:v24];

          if (v25) {
            [v25 removeFromParentViewController];
          }
          long long v26 = [v15 IMChatItem];
          int v27 = [v26 isDataSourceInitialized];

          if (v27)
          {
            BOOL v28 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
            uint64_t v29 = [v15 balloonControllerForContext:v28];

            if (objc_opt_respondsToSelector()) {
              [v29 pluginContentViewDidDissapear];
            }
          }
        }
        uint64_t v30 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
        [v15 relinquishBalloonControllerForContext:v30];
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v31 = [v8 balloonView];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v31 prepareForReuse];
    }
  }
}

- (void)_prepareTextEffectCoordinatorForCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_transcriptTextEffectCoordinator)
  {
    if (!+[CKApplicationState isResizing])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 setTextEffectsDelegate:self];
        if ([v9 _textContainsIMTextEffect])
        {
          id location = 0;
          objc_initWeak(&location, self);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __97__CKTranscriptCollectionViewController__prepareTextEffectCoordinatorForCell_forItem_atIndexPath___block_invoke;
          v11[3] = &unk_1E5622A90;
          objc_copyWeak(&v14, &location);
          id v12 = v10;
          id v13 = v9;
          dispatch_async(MEMORY[0x1E4F14428], v11);

          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __97__CKTranscriptCollectionViewController__prepareTextEffectCoordinatorForCell_forItem_atIndexPath___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v2 = [WeakRetained transcriptTextEffectCoordinator];
  char v3 = NSString;
  uint64_t v4 = [a1[4] section];
  uint64_t v5 = [a1[4] item];
  uint64_t v6 = [a1[5] IMChatItem];
  uint64_t v7 = [v6 guid];
  id v8 = [v3 stringWithFormat:@"willDisplayCell at index path: %lu|%lu - identifier: %@", v4, v5, v7];
  [v2 updateWithReason:v8];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = [v8 item];
  if ([v8 section])
  {
    if ([v8 section] == 1)
    {
      id v10 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        id v12 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
        id v13 = [v12 objectAtIndexedSubscript:v9];

        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  id v14 = [(CKTranscriptCollectionViewController *)self chatItems];
  unint64_t v15 = [v14 count];

  if (v9 >= v15)
  {
LABEL_8:
    id v13 = 0;
    goto LABEL_9;
  }
  double v16 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v13 = [v16 objectAtIndexedSubscript:v9];

  CGFloat v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v18 = [v17 isExpressiveTextEnabled];

  if (v18) {
    [(CKTranscriptCollectionViewController *)self _prepareTextEffectCoordinatorForCell:v7 forItem:v13 atIndexPath:v8];
  }
LABEL_9:
  if (![v8 section])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v19 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
      double v20 = [v13 balloonControllerForContext:v19];

      if (objc_opt_respondsToSelector()) {
        [v20 pluginContentViewWillAppear];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v7;
      double v22 = [(CKTranscriptCollectionViewController *)self delegate];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        long long v24 = [(CKTranscriptCollectionViewController *)self delegate];
        [v24 transcriptCollectionViewController:self willDisplayStatusCell:v21];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setDelegate:self];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setDelegate:self];
    }
  }
  unint64_t v69 = v9;
  if ([(NSIndexPath *)self->_itemIndexPathToHighlight isEqual:v8]
    && !self->_holdMessageEmphasisTillManuallyRemoved)
  {
    [(CKTranscriptCollectionViewController *)self _highlightCell:v7 autoDismiss:1];
    itemIndexPathToHighlight = self->_itemIndexPathToHighlight;
    self->_itemIndexPathToHighlight = 0;
  }
  else if ([(NSIndexPath *)self->_itemIndexPathToHighlight isEqual:v8] {
         && self->_holdMessageEmphasisTillManuallyRemoved)
  }
  {
    [(CKTranscriptCollectionViewController *)self _highlightCell:v7 autoDismiss:0];
  }
  [(CKTranscriptCollectionViewController *)self updateEmphasis];
  if (objc_opt_respondsToSelector())
  {
    long long v26 = +[CKUIBehavior sharedBehaviors];
    int v27 = [v26 enableBalloonTextSelection];

    if (v27)
    {
      BOOL v28 = [v13 IMChatItem];
      uint64_t v29 = [v28 guid];

      uint64_t v30 = [(CKTranscriptCollectionViewController *)self selectionManager];
      uint64_t v31 = v30;
      if (v29 && [v30 isMessageGuidSelected:v29])
      {
        id v32 = [v7 balloonView];
        v33 = [v31 selectedStateForGuid:v29];
        [v32 setSelected:1 withSelectionState:v33];
      }
    }
  }
  CGRect v34 = [v13 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGRect v35 = [v34 message];
    double v36 = [(CKTranscriptCollectionViewController *)self chat];
    long long v37 = [v36 lastIncomingFinishedMessage];
    uint64_t v38 = [v37 compare:v35 comparisonType:2];

    if (v38) {
      goto LABEL_42;
    }
    long long v39 = [(CKTranscriptCollectionViewController *)self delegate];
    [v39 transcriptCollectionViewControllerWillDisplayLastBalloon:self];

    long long v40 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
    if ([v40 isAnimating])
    {
      long long v41 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
      long long v42 = [v41 animatingIdentifier];
      BOOL v43 = +[CKImpactEffectManager identifierShouldPlayInWindow:v42];

      if (v43)
      {
        uint64_t v44 = 1;
LABEL_41:
        [v7 setHidden:v44];
LABEL_42:
        uint64_t v45 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        if ([v45 isCatchUpEnabled])
        {
          long long v46 = [(CKTranscriptCollectionViewController *)self delegate];
          char v47 = objc_opt_respondsToSelector();

          if ((v47 & 1) == 0)
          {
LABEL_46:

            goto LABEL_47;
          }
          uint64_t v45 = [(CKTranscriptCollectionViewController *)self delegate];
          long long v48 = [v35 guid];
          [v7 frame];
          [v45 transcriptCollectionViewController:self willDisplayBalloonForGUID:v48 withIndexPath:v8 withOriginY:v49];
        }
        goto LABEL_46;
      }
    }
    else
    {
    }
    uint64_t v44 = 0;
    goto LABEL_41;
  }
LABEL_47:
  long long v50 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  long long v51 = [v50 currentEffect];

  if (v51)
  {
    if ([v8 section] == 1
      || ![v8 section]
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v52 = [(CKTranscriptCollectionViewController *)self chatItems];
      uint64_t v53 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
      CGRect v54 = [v53 currentEffect];
      CGRect v55 = [v54 triggeringChatItem];
      uint64_t v56 = [v52 indexOfObject:v55];

      __int16 v57 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
      BOOL v58 = [v57 currentEffect];
      __int16 v59 = v58;
      if (v69 == v56)
      {
        [v58 applyMessageFiltersToTriggeringCell:v7];
      }
      else
      {
        v70[0] = v7;
        int v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
        [v59 applyMessageFiltersToCells:v60];
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setDelegate:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = v7;
    [v61 setDelegate:self];
    uint64_t v62 = [v61 balloonView];
    if (v62)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v63 = *MEMORY[0x1E4F6D9F0];
        id v64 = v62;
        -[CKTranscriptCollectionViewController _trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:](self, "_trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:", v63, v64, [v13 transcriptOrientation]);
      }
    }
  }
  if (![v8 section])
  {
    v65 = [(CKTranscriptCollectionViewController *)self hiddenChatItemGUIDs];
    v66 = [v13 IMChatItem];
    v68 = [v66 guid];
    uint64_t v67 = [v65 containsObject:v68];

    goto LABEL_70;
  }
  if ([v8 section] == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v65 = [v13 associatedMessageGUID];
      v66 = [(CKTranscriptCollectionViewController *)self chatItemGUIDsOfHiddenTapbackPiles];
      uint64_t v67 = [v66 containsObject:v65];
LABEL_70:

      goto LABEL_71;
    }
  }
  uint64_t v67 = 0;
LABEL_71:
  [(CKTranscriptCollectionViewController *)self configureTranscriptCell:v7 hidden:v67];
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionViewWillInset:(id)a3 targetContentInset:(UIEdgeInsets *)a4
{
  id v6 = [(CKTranscriptCollectionViewController *)self delegate];
  [v6 transcriptCollectionViewControllerWillInset:self targetContentInset:a4];
}

- (void)collectionViewDidInset:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self delegate];
  [v4 transcriptCollectionViewControllerDidInset:self];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v8 = +[CKPrintController sharedInstance];
    char v9 = [v8 isPrinting];

    if ((v9 & 1) == 0)
    {
      id v7 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
      goto LABEL_7;
    }
  }
  else if (!a4)
  {
    id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
LABEL_7:
    unint64_t v11 = v7;
    int64_t v10 = [v7 count];

    goto LABEL_8;
  }
  int64_t v10 = 0;
LABEL_8:

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    unint64_t v8 = [v7 item];
    char v9 = [(CKTranscriptCollectionViewController *)self chatItems];
    unint64_t v10 = [v9 count];

    if (v8 >= v10)
    {
      unint64_t v11 = NSString;
      id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "section"));
      id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "item"));
      id v14 = [v11 stringWithFormat:@"[cellForItemAtIndexPath] Attempting to access chat item at invalid index (section: %@, item: %@)", v12, v13];

      unint64_t v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
      [v15 raise];
    }
  }
  if ([v7 section] == 1)
  {
    unint64_t v16 = [v7 item];
    CGFloat v17 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    unint64_t v18 = [v17 count];

    if (v16 >= v18)
    {
      CGFloat v19 = NSString;
      double v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "section"));
      id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "item"));
      double v22 = [v19 stringWithFormat:@"[cellForItemAtIndexPath] Attempting to access associated chat item at invalid index (section: %@, item: %@)", v20, v21];

      char v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
      [v23 raise];
    }
  }
  if (![v7 section])
  {
    long long v24 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v25 = objc_msgSend(v24, "objectAtIndex:", objc_msgSend(v7, "item"));
LABEL_11:
    long long v26 = (void *)v25;

    if (v26) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ([v7 section] == 1)
  {
    long long v24 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    uint64_t v25 = objc_msgSend(v24, "objectAtIndex:", objc_msgSend(v7, "item"));
    goto LABEL_11;
  }
LABEL_12:
  int v27 = NSString;
  BOOL v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "section"));
  uint64_t v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "item"));
  uint64_t v30 = [v27 stringWithFormat:@"[cellForItemAtIndexPath] Unable to retrieve chatItem for index (section: %@, item: %@), ", v28, v29];

  uint64_t v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
  [v31 raise];

  long long v26 = 0;
LABEL_13:
  id v32 = [(CKTranscriptCollectionViewController *)self collectionView:v6 cellForCKChatItem:v26 atIndexPath:v7];

  return v32;
}

- (id)collectionView:(id)a3 cellForCKChatItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  unint64_t v11 = [v8 cellIdentifier];
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v8, "cellClass"), v11);
  id v12 = [v10 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CKTranscriptCollectionViewController *)self configureAssociatedCell:v12 forChatItem:v8 atIndexPath:v9];
  }
  else {
    [(CKTranscriptCollectionViewController *)self configureCell:v12 forCKChatItem:v8 atIndexPath:v9 animated:0 animationDuration:3 animationCurve:0.0];
  }

  return v12;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v41 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = +[CKFullscreenEffectDecorationView decorationViewKind];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    unint64_t v15 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
    unint64_t v16 = [v15 currentEffect];

    CGFloat v17 = (objc_class *)[v16 effectViewClass];
    unint64_t v18 = [v41 collectionViewLayout];
    uint64_t v19 = objc_msgSend(v18, "effectIndexForDecorationViewAtIndex:", objc_msgSend(v11, "section"));

    id v20 = v10;
    id v21 = [(CKTranscriptCollectionViewController *)self currentEffectDecorationViews];
    [v21 addObject:v20];

    [v20 setUserInteractionEnabled:0];
    id v22 = [v17 alloc];
    [v20 bounds];
    char v23 = objc_msgSend(v22, "initWithFrame:");
    [v23 setUserInteractionEnabled:0];
    [v23 setZIndex:v19];
    [v20 setupForEffectView:v23];
    [(CKTranscriptCollectionViewController *)self _updateEffectViewMessageRect:v23 effect:v16];
    if ([v16 isForegroundEffect])
    {
      long long v24 = [v16 triggeringChatItem];
      uint64_t v25 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v24];

      [v41 addSubview:v25];
      [v41 insertSubview:v20 belowSubview:v25];
    }
    long long v26 = [v16 triggeringChatItem];
    int v27 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v26];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v28 = [v27 balloonView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v30 = [v27 balloonView];
        [v30 bounds];
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGRect v35 = [MEMORY[0x1E4F42D90] mainScreen];
        [v35 scale];
        CGFloat v37 = v36;
        v43.CGFloat width = v32;
        v43.CGFloat height = v34;
        UIGraphicsBeginImageContextWithOptions(v43, 1, v37);

        uint64_t v38 = [v27 balloonView];
        long long v39 = [v27 balloonView];
        [v39 bounds];
        objc_msgSend(v38, "drawViewHierarchyInRect:afterScreenUpdates:", 0);

        long long v40 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [v23 setMessageImage:v40];
      }
    }
    [v23 startAnimation];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v13 = a4;
  id v8 = a5;
  id v9 = +[CKFullscreenEffectDecorationView decorationViewKind];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    id v11 = v13;
    id v12 = [(CKTranscriptCollectionViewController *)self currentEffectDecorationViews];
    [v12 removeObject:v11];

    [v11 tearDownEffectView];
  }
}

- (void)updateEffectViewMessageRects
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  id v4 = [v3 currentEffect];

  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self currentEffectDecorationViews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = [*(id *)(*((void *)&v21 + 1) + 8 * v9) effectView];
          [(CKTranscriptCollectionViewController *)self _updateEffectViewMessageRect:v10 effect:v4];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = [(CKTranscriptCollectionViewController *)self delegate];
    id v12 = [v11 transcriptCollectionViewControllerAdditionalFullscreenEffectViews:self];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [(CKTranscriptCollectionViewController *)self _updateEffectViewMessageRect:*(void *)(*((void *)&v17 + 1) + 8 * v16++) effect:v4];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void)endHoldingUpdatesAfterQuicklookCancelsDismiss
{
  id v2 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v2 endHoldingUpdatesForKey:@"CKFullscreenUpdatesDisappeared"];
}

- (void)_addChatItemsToGenerativeContextHistory:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  uint64_t v30 = self;
  if (self->_generativeContextHistory)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v34;
      BOOL v28 = @"CKGenerativeContextDisplayName";
      uint64_t v29 = *(void *)v34;
      do
      {
        uint64_t v7 = 0;
        uint64_t v31 = v5;
        do
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            int v10 = [v9 text];
            id v11 = [v10 string];

            if ([v11 length])
            {
              id v12 = [v9 messageItem];
              uint64_t v13 = [v12 time];
              uint64_t v14 = [v12 sender];
              uint64_t v15 = MEMORY[0x192FBA710]();

              if (![v15 length] && objc_msgSend(v12, "isFromMe"))
              {
                uint64_t v16 = [v12 destinationCallerID];
                uint64_t v17 = MEMORY[0x192FBA710]();

                uint64_t v15 = (void *)v17;
              }
              long long v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v28);
              long long v19 = v18;
              if (v13) {
                [v18 setObject:v13 forKey:@"CKGenerativeContextTimestamp"];
              }
              if (v11) {
                [v19 setObject:v11 forKey:@"CKGenerativeContextText"];
              }
              if (v15) {
                [v19 setObject:v15 forKey:@"CKGenerativeContextHandle"];
              }
              long long v20 = [v9 sender];
              long long v21 = [v20 cnContact];
              long long v22 = [v21 displayName];

              if (v22)
              {
                long long v23 = [v9 sender];
                long long v24 = [v23 cnContact];
                uint64_t v25 = [v24 displayName];
                [v19 setObject:v25 forKey:v28];
              }
              long long v26 = [(CKTranscriptCollectionViewController *)v30 generativeContextHistory];
              uint64_t v27 = (void *)[v19 copy];
              [v26 addObject:v27];

              uint64_t v6 = v29;
              uint64_t v5 = v31;
            }
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)_shouldMarkAllInputContextHistoryEntriesAsJunk
{
  id v2 = [(CKTranscriptCollectionViewController *)self conversation];
  char v3 = [v2 chat];

  if (v3) {
    BOOL v4 = [v3 isFiltered] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_addChatItemsToInputContextHistory:(id)a3 signalingResponseContextChangeIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self inputContextHistory];
  BOOL v46 = [(CKTranscriptCollectionViewController *)self _shouldMarkAllInputContextHistoryEntriesAsJunk];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (!v9)
  {

    goto LABEL_45;
  }
  BOOL v40 = v4;
  id v41 = self;
  int v43 = 0;
  uint64_t v48 = *(void *)v54;
  uint64_t v42 = *MEMORY[0x1E4F6C218];
  id v44 = v8;
  uint64_t v45 = v7;
  uint64_t v10 = v9;
  do
  {
    uint64_t v11 = 0;
    uint64_t v47 = v10;
    do
    {
      if (*(void *)v54 != v48) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v53 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        uint64_t v14 = [v13 messageItem];
        uint64_t v15 = [v14 guid];
        uint64_t v16 = [v13 index];
        long long v50 = [MEMORY[0x1E4F6BD38] chatItemGUIDForMessageGUID:v15 partIndex:v16];
        uint64_t v17 = [v14 time];
        long long v18 = [v14 sender];
        long long v19 = MEMORY[0x192FBA710]();

        double v49 = (void *)v17;
        if (![v19 length] && objc_msgSend(v14, "isFromMe"))
        {
          long long v20 = [v14 destinationCallerID];
          uint64_t v21 = MEMORY[0x192FBA710]();

          long long v19 = (void *)v21;
        }
        long long v22 = [v14 threadIdentifier];
        if (v46)
        {
          long long v23 = 0;
          uint64_t v24 = 3;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v34 = [v13 text];
            if (objc_msgSend(v34, "attribute:existsInRange:", v42, 0, objc_msgSend(v34, "length"))) {
              uint64_t v24 = 2;
            }
            else {
              uint64_t v24 = 0;
            }
            long long v23 = [v34 string];
          }
          else
          {
            objc_opt_class();
            long long v23 = 0;
            if (objc_opt_isKindOfClass()) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = 4;
            }
          }
        }
        if ([v19 length])
        {
          long long v35 = objc_alloc_init(MEMORY[0x1E4FAE3D0]);
          [v35 setText:v23];
          [v35 setSenderIdentifier:v19];
          [v35 setTimestamp:v49];
          [v35 setEntryIdentifier:v50];
          [v35 setEntryType:v24];
          [v35 setThreadIdentifier:v22];
          if (objc_opt_respondsToSelector()) {
            [v35 setSpotlightCacheKey:v15];
          }
          uint64_t v7 = v45;
          if (objc_opt_respondsToSelector()) {
            -[NSObject setIsFromMe:](v35, "setIsFromMe:", [v14 isFromMe]);
          }
          id v36 = [v35 copy];
          [v45 addEntry:v36];

          int v43 = 1;
        }
        else
        {
          long long v35 = IMLogHandleForCategory();
          uint64_t v7 = v45;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            [(CKTranscriptCollectionViewController *)v58 _addChatItemsToInputContextHistory:&v59 signalingResponseContextChangeIfNeeded:v35];
          }
        }
        id v8 = v44;

        uint64_t v10 = v47;
        long long v33 = v49;
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_38;
      }
      id v25 = v12;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [v25 handle];
        long long v26 = [v14 ID];
        uint64_t v15 = MEMORY[0x192FBA710]();

        uint64_t v27 = [v7 recipientIdentifiers];
        char v28 = [v27 containsObject:v15];

        if ((v28 & 1) == 0)
        {
          uint64_t v29 = [MEMORY[0x1E4F28F30] descriptorForUsedKeys];
          __int16 v57 = v29;
          uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
          uint64_t v31 = [v14 cnContactWithKeys:v30];

          long long v50 = (void *)v31;
          uint64_t v32 = [MEMORY[0x1E4F28F30] componentsForContact:v31];
          long long v33 = (void *)v32;
          if (v15 && v32)
          {
            [v7 addNewParticipantWithIdentifier:v15 name:v32];
            int v43 = 1;
          }
LABEL_35:
        }
      }

LABEL_38:
      ++v11;
    }
    while (v10 != v11);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v60 count:16];
  }
  while (v10);

  if ((v43 & v40) == 1)
  {
    CGFloat v37 = [MEMORY[0x1E4F42B08] activeKeyboard];
    [v37 responseContextDidChange];

    uint64_t v38 = v41;
    goto LABEL_44;
  }
  uint64_t v38 = v41;
  if (v43)
  {
LABEL_44:
    dispatch_time_t v39 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__CKTranscriptCollectionViewController__addChatItemsToInputContextHistory_signalingResponseContextChangeIfNeeded___block_invoke;
    block[3] = &unk_1E5620AF8;
    void block[4] = v38;
    id v52 = v8;
    dispatch_after(v39, MEMORY[0x1E4F14428], block);
  }
LABEL_45:
}

uint64_t __114__CKTranscriptCollectionViewController__addChatItemsToInputContextHistory_signalingResponseContextChangeIfNeeded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initiateSmartEmojiResponsesUpdateWithChatItems:*(void *)(a1 + 40)];
}

- (void)_createInputContextHistory
{
  long long v22 = [(CKTranscriptCollectionViewController *)self conversation];
  int v3 = [v22 isKnownSender];
  BOOL v4 = v22;
  if (v3)
  {
    uint64_t v5 = [v22 deviceIndependentID];
    id v6 = CKTextInputIdentifier();

    uint64_t v7 = [(CKTranscriptCollectionViewController *)self chat];
    id v8 = [v7 inlineReplyController];
    uint64_t v9 = [v8 threadIdentifier];

    uint64_t v10 = [v22 recipients];
    uint64_t v11 = [(CKTranscriptCollectionViewController *)self _inputContextIdentifiersForRecipients:v10];
    id v12 = [(CKTranscriptCollectionViewController *)self _inputContextIdentifiersForMe];
    id v13 = [(CKTranscriptCollectionViewController *)self _participantsNameMapFromRecipients:v10 mySenderIdentifiers:v12];
    id v14 = objc_alloc(MEMORY[0x1E4F42AB8]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    uint64_t v17 = (void *)[v14 initWithThreadIdentifier:v6 participantsIDtoNames:v13 firstPerson:v12 primaryRecipients:v11 secondaryRecipients:v15 info:v16];

    if ([v9 length])
    {
      AssociatedMessageGUIDFromThreadIdentifier = (void *)IMMessageCreateAssociatedMessageGUIDFromThreadIdentifier();
      long long v19 = [v17 tiInputContextHistory];
      [v19 setFocusedEntryIdentifier:AssociatedMessageGUIDFromThreadIdentifier];
    }
    inputContextHistordouble y = self->_inputContextHistory;
    self->_inputContextHistordouble y = (UIInputContextHistory *)v17;

    uint64_t v21 = [(CKTranscriptCollectionViewController *)self chatItems];
    [(CKTranscriptCollectionViewController *)self _addChatItemsToInputContextHistory:v21 signalingResponseContextChangeIfNeeded:0];

    BOOL v4 = v22;
  }
}

- (NSMutableArray)generativeContextHistory
{
  generativeContextHistordouble y = self->_generativeContextHistory;
  if (!generativeContextHistory)
  {
    [(CKTranscriptCollectionViewController *)self _createGenerativeContextHistory];
    generativeContextHistordouble y = self->_generativeContextHistory;
  }

  return generativeContextHistory;
}

- (void)_createGenerativeContextHistory
{
  int v3 = [MEMORY[0x1E4F1CA48] array];
  generativeContextHistordouble y = self->_generativeContextHistory;
  self->_generativeContextHistordouble y = v3;

  id v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  [(CKTranscriptCollectionViewController *)self _addChatItemsToGenerativeContextHistory:v5];
}

- (id)_inputContextIdentifiersForRecipients:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "rawAddress", (void)v14);
        uint64_t v11 = MEMORY[0x192FBA710]();

        if ([v11 length]) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v4 copy];

  return v12;
}

- (id)_inputContextIdentifiersForMe
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  id v4 = [v3 senderIdentifiers];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = MEMORY[0x192FBA710](*(void *)(*((void *)&v13 + 1) + 8 * i));
        if (objc_msgSend(v10, "length", (void)v13)) {
          [v2 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v2 copy];

  return v11;
}

- (id)_participantsNameMapFromRecipients:(id)a3 mySenderIdentifiers:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [MEMORY[0x1E4F28F30] descriptorForUsedKeys];
  v44[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v15 = [v14 rawAddress];
        long long v16 = MEMORY[0x192FBA710]();

        long long v17 = [v14 cnContactWithKeys:v8];
        uint64_t v18 = [MEMORY[0x1E4F28F30] componentsForContact:v17];
        uint64_t v19 = (void *)v18;
        if (v16) {
          BOOL v20 = v18 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (!v20) {
          [v6 setObject:v18 forKeyedSubscript:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v11);
  }

  uint64_t v21 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  long long v22 = [v21 fetchMeContactWithKeys:v8];

  long long v23 = [MEMORY[0x1E4F28F30] componentsForContact:v22];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v24 = v33;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = MEMORY[0x192FBA710](*(void *)(*((void *)&v34 + 1) + 8 * j));
        if ([v29 length]) {
          BOOL v30 = v23 == 0;
        }
        else {
          BOOL v30 = 1;
        }
        if (!v30) {
          [v6 setObject:v23 forKeyedSubscript:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v26);
  }

  uint64_t v31 = (void *)[v6 copy];

  return v31;
}

- (void)_updateEffectViewMessageRect:(id)a3 effect:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 triggeringChatItem];
    id v9 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:v8];

    if (v9)
    {
      objc_msgSend(v7, "setMessageOrientation:", objc_msgSend(v9, "orientation"));
      [v9 center];
      double v11 = v10;
      double v13 = v12;
      long long v14 = [v9 superview];
      long long v15 = [v38 superview];
      objc_msgSend(v14, "convertPoint:toView:", v15, v11, v13);
      double v17 = v16;
      double v19 = v18;

      BOOL v20 = [v9 superview];
      [v9 frame];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      uint64_t v29 = [v38 superview];
      objc_msgSend(v20, "convertRect:toView:", v29, v22, v24, v26, v28);
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;

      if ([v7 shouldDrawOverNavigationBar])
      {
        -[CKFullscreenEffectView setFocusPoint:](self->_topEffectView, "setFocusPoint:", v17, v19);
        -[CKFullscreenEffectView setMessageRect:](self->_topEffectView, "setMessageRect:", v31, v33, v35, v37);
        -[CKFullscreenEffectView setMessageOrientation:](self->_topEffectView, "setMessageOrientation:", [v9 orientation]);
      }
      objc_msgSend(v38, "setFocusPoint:", v17, v19);
      objc_msgSend(v38, "setMessageRect:", v31, v33, v35, v37);
      objc_msgSend(v38, "setMessageOrientation:", objc_msgSend(v9, "orientation"));
    }
  }
}

- (id)collectionView:(id)a3 layout:(id)a4 chatItemForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v8 = [v6 item];

  id v9 = [v7 objectAtIndex:v8];

  return v9;
}

- (id)collectionView:(id)a3 layout:(id)a4 chatItemForSupplementaryViewAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
  uint64_t v8 = [v6 item];

  id v9 = [v7 objectAtIndex:v8];

  return v9;
}

- (id)chatItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (![v4 section])
  {
    id v5 = [(CKTranscriptCollectionViewController *)self chatItems];
    goto LABEL_5;
  }
  if ([v4 section] == 1)
  {
    id v5 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
LABEL_5:
    id v6 = v5;
    uint64_t v7 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));

    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (void)collectionViewLayout:(id)a3 sizeDidChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [(CKTranscriptCollectionViewController *)self delegate];
  objc_msgSend(v7, "transcriptCollectionViewController:collectionViewContentSizeDidChange:", self, width, height);
}

- (id)currentEffectForCollectionView:(id)a3 layout:(id)a4
{
  id v5 = [(CKTranscriptCollectionViewController *)self delegate];
  int v6 = [v5 transcriptCollectionViewControllerShouldLayoutFullscreenEffects:self];

  if (v6)
  {
    id v7 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
    uint64_t v8 = [v7 currentEffect];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)didTapBlockContact
{
  id v3 = [MEMORY[0x1E4F6E710] sharedInstance];
  [v3 logPrivatizedUIInteractionEvent:6];

  id v4 = [(CKTranscriptCollectionViewController *)self conversation];
  id v5 = [v4 recipients];
  id v7 = [v5 firstObject];

  int v6 = [v7 defaultIMHandle];
  [(CKTranscriptCollectionViewController *)self _blockHandle:v6];
}

- (void)didTapWaysToGetHelp
{
  id v3 = [MEMORY[0x1E4F6E710] sharedInstance];
  [v3 logPrivatizedUIInteractionEvent:4];

  [(CKTranscriptCollectionViewController *)self _showMoreHelp];
}

- (BOOL)isReportingEnabled
{
  id v3 = [(CKTranscriptCollectionViewController *)self conversation];
  id v4 = [v3 chat];
  if ([v4 hasCommSafetySensitiveMessageFromSomeoneElse])
  {
    id v5 = [(CKTranscriptCollectionViewController *)self conversation];
    int v6 = [v5 chat];
    id v7 = [MEMORY[0x1E4F6BDB8] iMessageService];
    if ([v6 hasMessageFromService:v7]) {
      char v8 = IMIsRunningInMessages();
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)balloonViewTapped:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v48 = a5;
  id v9 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v8];
  if ([v9 section] == 1)
  {
    double v10 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    unint64_t v11 = [v9 item];
    if (v11 < [v10 count])
    {
      double v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "item"));
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        long long v14 = [(CKTranscriptCollectionViewController *)self chatItems];
        long long v15 = [v13 associatedChatItemGUID];
        uint64_t v16 = [v13 associatedMessageRange];
        uint64_t v18 = objc_msgSend(v14, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v15, v16, v17);

        double v19 = [MEMORY[0x1E4F28D58] indexPathForItem:v18 inSection:0];
        BOOL v20 = [(CKTranscriptCollectionViewController *)self collectionView];
        double v21 = [v20 cellForItemAtIndexPath:v19];

        uint64_t v22 = [v21 balloonView];

        double v23 = +[CKUIBehavior sharedBehaviors];
        int v24 = [v23 canTapAssociatedAcknowledgment];

        if (v24)
        {
          double v25 = [(CKTranscriptCollectionViewController *)self delegate];
          [v25 transcriptCollectionViewController:self balloonView:v22 longPressedForItemWithIndexPath:v19];
        }
        id v8 = (id)v22;
      }

      goto LABEL_36;
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_36;
    }
    double v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      double v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "item"));
      double v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      *(_DWORD *)buf = 136315650;
      long long v50 = "-[CKTranscriptCollectionViewController balloonViewTapped:withModifierFlags:selectedText:]";
      __int16 v51 = 2112;
      id v52 = v27;
      __int16 v53 = 2112;
      long long v54 = v28;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "%s Got tap on balloon not in current associated chat items range. idx %@ count %@", buf, 0x20u);
    }
LABEL_14:

    goto LABEL_36;
  }
  if ([(CKTranscriptCollectionViewController *)self isEditing]) {
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CKTranscriptCollectionViewController *)self _presentOfframpDetonationAlert];
LABEL_22:
    int v29 = 1;
    goto LABEL_23;
  }
  if ([v8 conformsToProtocol:&unk_1EE0151E8])
  {
    [(CKTranscriptCollectionViewController *)self _handleAudioBalloonTapForIndexPath:v9];
    int v29 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  id v30 = v8;
  if (![v30 isObscured])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v47 = [v30 mediaObject];
      [(CKTranscriptCollectionViewController *)self balloonView:v30 mediaObjectDidFinishPlaying:v47];
    }
    goto LABEL_40;
  }
  if (![(CKTranscriptCollectionViewController *)self canInteractWithObscuredItem])
  {
LABEL_40:
    int v29 = 1;
    goto LABEL_41;
  }
  double v31 = [MEMORY[0x1E4F6E6D0] sharedManager];
  uint64_t v32 = [v31 enablementGroup];

  if (v32 != 2)
  {
    [(CKTranscriptCollectionViewController *)self _handleCommSafetySensitiveReceiveStatusButtonTappedForIndexPath:v9];
    goto LABEL_40;
  }
  double v33 = [(CKTranscriptCollectionViewController *)self delegate];
  [v33 transcriptCollectionViewController:self viewedCommSafetyItemWithIndexPath:v9];

  double v34 = [(CKTranscriptCollectionViewController *)self chatItems];
  double v35 = objc_msgSend(v34, "objectAtIndex:", objc_msgSend(v9, "item"));

  double v36 = [v35 IMChatItem];
  objc_msgSend(v30, "revealSensitiveContent:", objc_msgSend(v36, "isReplyContextPreview"));

  int v29 = 0;
LABEL_41:

LABEL_23:
  double v10 = [(CKTranscriptCollectionViewController *)self chatItems];
  unint64_t v37 = [v9 item];
  if (v37 >= [v10 count])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_36;
    }
    double v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "item"));
      BOOL v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      *(_DWORD *)buf = 136315650;
      long long v50 = "-[CKTranscriptCollectionViewController balloonViewTapped:withModifierFlags:selectedText:]";
      __int16 v51 = 2112;
      id v52 = v45;
      __int16 v53 = 2112;
      long long v54 = v46;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "%s Got tap on balloon not in current chat items range. idx %@ chatItems.count %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  id v38 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "item"));
  long long v39 = [(CKTranscriptCollectionViewController *)self delegate];
  int v40 = [v39 transcriptCollectionViewController:self balloonView:v8 shouldSelectChatItem:v38];

  if (a4 || v40)
  {
    [(CKTranscriptCollectionViewController *)self balloonViewSelected:v8 withModifierFlags:a4 selectedText:v48];
  }
  else
  {
    long long v41 = +[CKUIBehavior sharedBehaviors];
    int v42 = [v41 enableBalloonTextSelection];

    if (v42)
    {
      int v43 = [(CKTranscriptCollectionViewController *)self selectionManager];
      [v43 removeAllSelectedMessageGuids];
    }
    if (v29)
    {
      id v44 = [(CKTranscriptCollectionViewController *)self delegate];
      [v44 transcriptCollectionViewController:self balloonView:v8 tappedForChatItem:v38];
    }
  }

LABEL_36:
}

- (void)_handleAudioBalloonTapForIndexPath:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 item];
  int v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v7 = +[CKAppAudioController sharedInstance];
  id v8 = [v7 audioController];

  id v9 = [v8 currentMediaObject];
  double v10 = [v9 transfer];
  uint64_t v11 = objc_msgSend(v6, "__ck_indexOfTransfer:", v10);

  if (v11 == v5)
  {
    if ([v8 isPlaying])
    {
      [v8 pause];
    }
    else
    {
      uint64_t v17 = CKAudioPlaybackSpeakerEnabled();
      [v8 setShouldUseSpeaker:v17];
      double v18 = 1.0;
      if (v17) {
        double v18 = 0.0;
      }
      [v8 playAfterDelay:v18];
    }
  }
  else
  {
    double v12 = [(CKTranscriptCollectionViewController *)self delegate];
    int v13 = [v12 transcriptCollectionViewControllerShouldPlayAudio:self];

    if (v13)
    {
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v8 stop];

        id v8 = 0;
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      long long v15 = [v6 objectAtIndex:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isFromMe] & 1) != 0 || (objc_msgSend(v16, "isPlayed"))
        {
          [v14 addIndex:v5];
        }
        else
        {
          BOOL v20 = objc_msgSend(v6, "__ck_indexesOfUnplayedAudioMessages");
          [v14 addIndexes:v20];

          objc_msgSend(v14, "removeIndexesInRange:", 0, v5);
        }
        if ([v14 count])
        {
          double v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __75__CKTranscriptCollectionViewController__handleAudioBalloonTapForIndexPath___block_invoke;
          v29[3] = &unk_1E5627290;
          id v30 = v21;
          id v22 = v21;
          [v6 enumerateObjectsAtIndexes:v14 options:0 usingBlock:v29];
          double v23 = [CKAudioController alloc];
          int v24 = [(CKTranscriptCollectionViewController *)self conversation];
          double v25 = [(CKAudioController *)v23 initWithMediaObjects:v22 conversation:v24];

          [(CKAudioController *)v25 setDelegate:self];
          double v26 = +[CKAppAudioController sharedInstance];
          [v26 setAudioController:v25];

          uint64_t v27 = CKAudioPlaybackSpeakerEnabled();
          [(CKAudioController *)v25 setShouldUseSpeaker:v27];
          double v28 = 1.0;
          if (v27) {
            double v28 = 0.0;
          }
          [(CKAudioController *)v25 playAfterDelay:v28];

          id v8 = v25;
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          double v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v32 = v5;
            __int16 v33 = 2112;
            double v34 = v15;
            _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Handling audio balloon tapped for indexPath that returned an invalid chatItem type. Index: %lu, ChatItem: %@", buf, 0x16u);
          }
        }
        id v16 = 0;
      }
    }
  }
}

void __75__CKTranscriptCollectionViewController__handleAudioBalloonTapForIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 mediaObject];
  [v2 addObject:v3];
}

- (void)_presentOfframpDetonationAlert
{
  id v3 = IMSharedUtilitiesFrameworkBundle();
  id v13 = [v3 localizedStringForKey:@"LOCKDOWN_ATTACHMENT_BALLOON_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"IMSharedUtilities-Offramp"];

  id v4 = IMSharedUtilitiesFrameworkBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"LOCKDOWN_ATTACHMENT_BALLOON_ALERT_MESSAGE" value:&stru_1EDE4CA38 table:@"IMSharedUtilities-Offramp"];

  int v6 = CKFrameworkBundle();
  id v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v8 = +[CKAlertAction actionWithTitle:v7 style:1 handler:0];

  id v9 = IMSharedUtilitiesFrameworkBundle();
  double v10 = [v9 localizedStringForKey:@"LOCKDOWN_ATTACHMENT_BALLOON_ALERT_LEARN_MORE_BUTTON" value:&stru_1EDE4CA38 table:@"IMSharedUtilities-Offramp"];

  uint64_t v11 = +[CKAlertAction actionWithTitle:v10 style:0 handler:&__block_literal_global_689_0];
  double v12 = +[CKAlertController alertControllerWithTitle:v13 message:v5 preferredStyle:1];
  [v12 addAction:v8];
  [v12 addAction:v11];
  [(CKTranscriptCollectionViewController *)self presentViewController:v12 animated:1 completion:0];
}

void __70__CKTranscriptCollectionViewController__presentOfframpDetonationAlert__block_invoke()
{
  id v1 = +[CKTranscriptCollectionViewController offrampLearnMoreURL];
  os_log_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openURL:v1 configuration:0 completionHandler:0];
}

+ (id)offrampLearnMoreURL
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"offramp-learn-more-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Received offramp learn more URL from server: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = @"https://support.apple.com/kb/HT212650";
  }
  int v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

  return v6;
}

- (void)audioBalloonScrubberDidChangeValue:(double)a3
{
  id v4 = +[CKAppAudioController sharedInstance];
  id v5 = [v4 audioController];

  [v5 setCurrentTime:a3];
}

- (void)audioBalloonDidResize:(id)a3 isExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:a3];
  uint64_t v6 = [v9 item];
  id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  int v8 = [v7 objectAtIndex:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setIsExpanded:v4];
  }
  [(CKTranscriptCollectionViewController *)self unloadCachedSizeAndReloadChatItemAtIndexPath:v9];
}

- (void)launchReaderViewForBalloonView:(id)a3
{
  id v4 = a3;
  id v9 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v4];
  uint64_t v5 = [v9 item];
  uint64_t v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v7 = [v6 objectAtIndex:v5];

  int v8 = [(CKTranscriptCollectionViewController *)self delegate];
  [v8 transcriptCollectionViewController:self balloonView:v4 didRequestReaderViewControllerForChatItem:v7];
}

- (void)balloonView:(id)a3 selectedChipAction:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKTranscriptCollectionViewController *)self delegate];
    [v7 transcriptCollectionViewController:self selectedChipAction:v8];
  }
}

- (void)didTapChipListFromNotificationExtensionWithBalloonView:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKTranscriptCollectionViewController *)self delegate];
    [v6 launchAppFromExtensionWith:self];
  }
}

- (void)balloonView:(id)a3 selectedSuggestedReply:(id)a4 messageGUID:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(CKTranscriptCollectionViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(CKTranscriptCollectionViewController *)self delegate];
    [v10 transcriptCollectionViewController:self selectedSuggestedReply:v11 messageGUID:v7];
  }
}

- (void)balloonView:(id)a3 carouselScrolledToIndex:(int64_t)a4
{
  id v6 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:a3];
  uint64_t v7 = [v6 item];
  id v8 = [(CKTranscriptCollectionViewController *)self chatItems];
  char v9 = [v8 objectAtIndex:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [MEMORY[0x1E4F6BDD0] suggestedRepliesChatItemGUIDPrefix];
    id v11 = [v9 IMChatItem];
    double v12 = [v11 guid];
    id v13 = [v10 stringByAppendingString:v12];
    id v14 = [(CKTranscriptCollectionViewController *)self chatItemForGUID:v13];

    if ([v14 selectedIndex] != a4 && v14)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__CKTranscriptCollectionViewController_balloonView_carouselScrolledToIndex___block_invoke;
      block[3] = &unk_1E5620E38;
      void block[4] = self;
      id v24 = v14;
      int64_t v25 = a4;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    long long v15 = [MEMORY[0x1E4F6BD90] richCardCountChatItemGUIDPrefix];
    id v16 = [v9 IMChatItem];
    uint64_t v17 = [v16 guid];
    double v18 = [v15 stringByAppendingString:v17];
    double v19 = [(CKTranscriptCollectionViewController *)self chatItemForGUID:v18];

    if (v19 && [v19 selectedRichCardIndex] != a4)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __76__CKTranscriptCollectionViewController_balloonView_carouselScrolledToIndex___block_invoke_2;
      v20[3] = &unk_1E5620E38;
      v20[4] = self;
      id v21 = v19;
      int64_t v22 = a4;
      dispatch_async(MEMORY[0x1E4F14428], v20);
    }
  }
}

void __76__CKTranscriptCollectionViewController_balloonView_carouselScrolledToIndex___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) chat];
  id v2 = [*(id *)(a1 + 40) IMChatItem];
  [v3 setSelectedIndexOnCarouselChatItem:v2 selectedIndex:*(void *)(a1 + 48)];
}

void __76__CKTranscriptCollectionViewController_balloonView_carouselScrolledToIndex___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) chat];
  id v2 = [*(id *)(a1 + 40) IMChatItem];
  [v3 setSelectedIndexOnCarouselChatItem:v2 selectedIndex:*(void *)(a1 + 48)];
}

- (BOOL)_isRecognizerScrubbingOnCurrentAudioMessageBalloon:(id)a3
{
  id v3 = a3;
  id v4 = +[CKAppAudioController sharedInstance];
  char v5 = [v4 audioController];

  id v6 = [v3 view];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 mediaObject];
    id v8 = [v5 currentMediaObject];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)audioBalloonScrubberWithRecognizer:(id)a3 didChangeValue:(double)a4
{
  id v6 = a3;
  if ([(CKTranscriptCollectionViewController *)self _isRecognizerScrubbingOnCurrentAudioMessageBalloon:v6])
  {
    uint64_t v7 = +[CKAppAudioController sharedInstance];
    id v8 = [v7 audioController];

    uint64_t v9 = [v6 state];
    if (v9 == 2)
    {
      [v8 layoutViewsForScrubbingTime:a4];
    }
    else
    {
      if (v9 == 1)
      {
        [v8 layoutViewsForScrubbingTime:a4];
        if ([v8 isPlaying])
        {
          [(CKTranscriptCollectionViewController *)self setAudioControllerWasPlayingBeforeScrub:1];
          [v8 pause];
        }
        else
        {
          [(CKTranscriptCollectionViewController *)self setAudioControllerWasPlayingBeforeScrub:0];
        }
        uint64_t v10 = [(CKTranscriptCollectionViewController *)self collectionView];
        id v11 = v10;
        uint64_t v12 = 0;
      }
      else
      {
        [v8 setCurrentTime:a4];
        if ([(CKTranscriptCollectionViewController *)self audioControllerWasPlayingBeforeScrub])
        {
          [v8 play];
        }
        uint64_t v10 = [(CKTranscriptCollectionViewController *)self collectionView];
        id v11 = v10;
        uint64_t v12 = 1;
      }
      [v10 setScrollEnabled:v12];
    }
LABEL_16:

    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Attempted to scrub audio message balloon that is not currently being played.", v13, 2u);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)playbackSpeedDidChangeForAudioMessageBalloonView:(id)a3 playbackSpeed:(double)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[CKAppAudioController sharedInstance];
  id v8 = [v7 audioController];

  [v8 setPlaybackSpeed:a4];
  uint64_t v9 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v6];
  uint64_t v10 = [v9 item];
  id v11 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v12 = [v11 objectAtIndex:v10];

  v30[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  +[CKChatItem unloadSizesOfChatItems:v13];

  id v14 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  [v14 reloadLayout];

  long long v15 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v16 = [v8 currentMediaObject];
  uint64_t v17 = [v16 transfer];
  uint64_t v18 = objc_msgSend(v15, "__ck_indexOfTransfer:", v17);

  if (v18 == v10)
  {
    if (([v8 isPlaying] & 1) == 0)
    {
      uint64_t v19 = CKAudioPlaybackSpeakerEnabled();
      [v8 setShouldUseSpeaker:v19];
      double v20 = 1.0;
      if (v19) {
        double v20 = 0.0;
      }
      [v8 playAfterDelay:v20];
    }
  }
  else
  {
    id v21 = [(CKTranscriptCollectionViewController *)self delegate];
    int v22 = [v21 transcriptCollectionViewControllerShouldPlayAudio:self];

    if (v22)
    {
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v8 stop];

        id v8 = 0;
      }
      double v23 = [(CKTranscriptCollectionViewController *)self audioMessageMediaObjectsFromBalloonView:v6];
      if ([v23 count])
      {
        id v24 = [CKAudioController alloc];
        int64_t v25 = [(CKTranscriptCollectionViewController *)self conversation];
        double v26 = [(CKAudioController *)v24 initWithMediaObjects:v23 conversation:v25];

        [(CKAudioController *)v26 setDelegate:self];
        uint64_t v27 = +[CKAppAudioController sharedInstance];
        [v27 setAudioController:v26];

        uint64_t v28 = CKAudioPlaybackSpeakerEnabled();
        [(CKAudioController *)v26 setShouldUseSpeaker:v28];
        double v29 = 1.0;
        if (v28) {
          double v29 = 0.0;
        }
        [(CKAudioController *)v26 playAfterDelay:v29];
        [(CKAudioController *)v26 setPlaybackSpeed:a4];
        id v8 = v26;
      }
    }
  }
}

- (id)audioMessageMediaObjectsFromBalloonView:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v5];

  uint64_t v8 = [v7 item];
  uint64_t v9 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v10 = [v9 objectAtIndex:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  if (([v11 isFromMe] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v11 isPlayed] & 1) != 0)
  {
    [v6 addIndex:v8];
  }
  else
  {
    uint64_t v17 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v18 = objc_msgSend(v17, "__ck_indexesOfUnplayedAudioMessages");
    [v6 addIndexes:v18];

    objc_msgSend(v6, "removeIndexesInRange:", 0, v8);
  }
  if ([v6 count])
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    id v13 = [(CKTranscriptCollectionViewController *)self chatItems];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__CKTranscriptCollectionViewController_audioMessageMediaObjectsFromBalloonView___block_invoke;
    v19[3] = &unk_1E56255D8;
    id v20 = v12;
    id v14 = v12;
    [v13 enumerateObjectsAtIndexes:v6 options:0 usingBlock:v19];

    long long v15 = (void *)[v14 copy];
  }
  else
  {
    long long v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

void __80__CKTranscriptCollectionViewController_audioMessageMediaObjectsFromBalloonView___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 mediaObject];
    [v3 addObject:v4];
  }
}

- (void)liveBalloonTouched:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v11;
  if (isKindOfClass)
  {
    id v6 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v11];
    uint64_t v7 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v8 = [v7 cellForItemAtIndexPath:v6];

    uint64_t v9 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 bundleIdentifier];
      [(CKTranscriptCollectionViewController *)self setMostRecentlyTouchedPlugin:v10];
    }
    id v5 = v11;
  }
}

- (void)interactionStartedWithPluginBalloonView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v4];
    id v6 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v7 = [v6 cellForItemAtIndexPath:v5];

    uint64_t v8 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 syndicationBehavior];
      char v10 = [v8 isHighlighted];
      uint64_t v11 = [v8 syndicationType];
      if (v9 == 1 && (v10 & 1) == 0 && !v11)
      {
        uint64_t v12 = [v8 IMChatItem];
        id v13 = [v12 dataSource];
        id v14 = [v13 pluginPayload];

        long long v15 = [MEMORY[0x1E4F6BC18] sharedInstance];
        id v16 = [v15 dataSourceForPluginPayload:v14];

        uint64_t v17 = [v16 richLinkMetadata];
        uint64_t v18 = [v17 collaborationMetadata];

        char v19 = [v8 canPerformQuickAction];
        if ((v19 & 1) != 0 || v18)
        {
          BOOL v20 = v18 != 0;
          dispatch_time_t v21 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __80__CKTranscriptCollectionViewController_interactionStartedWithPluginBalloonView___block_invoke;
          block[3] = &unk_1E5622700;
          char v25 = v19;
          BOOL v26 = v20;
          id v23 = v8;
          id v24 = self;
          dispatch_after(v21, MEMORY[0x1E4F14428], block);
        }
      }
    }
  }
}

void __80__CKTranscriptCollectionViewController_interactionStartedWithPluginBalloonView___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 32) IMChatItem];
      uint64_t v4 = [v3 guid];
      id v5 = (void *)v4;
      id v6 = @"YES";
      int v7 = *(unsigned __int8 *)(a1 + 49);
      if (*(unsigned char *)(a1 + 48)) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      *(_DWORD *)id v14 = 138412802;
      if (!v7) {
        id v6 = @"NO";
      }
      *(void *)&void v14[4] = v4;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Sending syndication action \"Interacted with item\" for chatItem with guid %@. canPerformQuickAction: %@, supportsCollaboration: %@", v14, 0x20u);
    }
  }
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "chat", *(void *)v14);
  char v10 = [*(id *)(a1 + 32) IMChatItem];
  uint64_t v11 = [v10 guid];
  uint64_t v12 = [*(id *)(a1 + 32) messagePartRange];
  objc_msgSend(v9, "sendSyndicationAction:forMessagePartGUID:syndicatedMessagePartRange:", 64, v11, v12, v13);
}

- (void)balloonViewLongTouched:(id)a3
{
  id v4 = a3;
  id v6 = [(CKTranscriptCollectionViewController *)self delegate];
  id v5 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v4];
  [v6 transcriptCollectionViewController:self balloonView:v4 longPressedForItemWithIndexPath:v5];
}

- (void)balloonViewShowInlineReply:(id)a3
{
  id v4 = a3;
  id v7 = [(CKTranscriptCollectionViewController *)self delegate];
  id v5 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v4];
  id v6 = +[CKInlineReplyTransitionProperties defaultProperties];
  [v7 transcriptCollectionViewController:self balloonView:v4 showInlineReplyForItemWithIndexPath:v5 withReplyTransitionProperties:v6];
}

- (void)balloonViewDoubleTapped:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received balloonViewDoubleTapped: callback for balloonView %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (!CKIsRunningInMacCatalyst())
  {
    id v6 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v4];
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [(CKTranscriptCollectionViewController *)self delegate];
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v12;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Calling into delegate to handle balloon double tap with indexPath %@, delegate: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    uint64_t v8 = [(CKTranscriptCollectionViewController *)self delegate];
    [v8 transcriptCollectionViewController:self balloonView:v4 doubleTappedItemAtIndexPath:v6];
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v4];
    uint64_t v7 = [v6 item];
    uint64_t v8 = [(CKTranscriptCollectionViewController *)self delegate];
    uint64_t v9 = [(CKTranscriptCollectionViewController *)self chatItems];
    char v10 = [v9 objectAtIndex:v7];
    [v8 transcriptCollectionViewController:self balloonView:v4 tappedForChatItem:v10];

LABEL_13:
  }
}

- (void)balloonViewSelected:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5
{
  id v28 = a3;
  id v8 = a5;
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  int v10 = [v9 enableBalloonTextSelection];

  if (v10)
  {
    [(CKTranscriptCollectionViewController *)self _searchForSelectedBalloonHack];
    uint64_t v11 = [(CKTranscriptCollectionViewController *)self selectionManager];
    uint64_t v12 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v28];
    int v13 = [(CKTranscriptCollectionViewController *)self chatItems];
    unint64_t v14 = [v12 item];
    if ((v14 & 0x8000000000000000) != 0) {
      goto LABEL_25;
    }
    unint64_t v15 = v14;
    if (v14 >= [v13 count]) {
      goto LABEL_25;
    }
    id v16 = [v13 objectAtIndex:v15];
    uint64_t v17 = [v16 IMChatItem];
    uint64_t v18 = [v17 guid];

    if ([v11 isMessageGuidSelected:v18])
    {
      if (a4 == 0x100000)
      {
        [v11 removeSelectedMessageGuid:v18];
        goto LABEL_24;
      }
      if (a4 != 0x20000)
      {
        unint64_t v19 = [v11 selectedGuidCount];
        [v11 removeAllSelectedMessageGuids];
        if (v19 < 2) {
          goto LABEL_24;
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (a4 == 0x100000)
      {
        BOOL v20 = [v11 trackedGuid];

        if (v20)
        {
          dispatch_time_t v21 = [v11 trackedGuid];
          int v22 = [v11 selectedStateForGuid:v21];

          if (v22) {
            uint64_t v23 = [v22 style];
          }
          else {
            uint64_t v23 = 0;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        uint64_t v24 = v23;
        goto LABEL_23;
      }
      if (a4 != 0x20000)
      {
        if (![v8 length])
        {
          [v11 removeAllSelectedMessageGuids];
LABEL_18:
          uint64_t v24 = 0;
LABEL_23:
          char v25 = +[CKBalloonSelectionState balloonSelectionState:v24];
          [v11 addSelectedMessageGuid:v18 selectionState:v25];
        }
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    [(CKTranscriptCollectionViewController *)self selectRangeWithIndexPath:v12];
    goto LABEL_24;
  }
LABEL_26:
  BOOL v26 = [(CKTranscriptCollectionViewController *)self delegate];
  uint64_t v27 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v28];
  [v26 transcriptCollectionViewController:self balloonView:v28 selectedItemAtIndexPath:v27];
}

- (id)selectedChatItems
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(CKTranscriptCollectionViewController *)self selectionManager];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "IMChatItem", (void)v16);
        int v13 = [v12 guid];
        int v14 = [v5 isMessageGuidSelected:v13];

        if (v14) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

- (BOOL)balloonTextViewIsSelected
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(CKTranscriptCollectionViewController *)self selectedChatItems];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_selectChatItemGuid:(id)a3 selectionState:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (([(CKTranscriptCollectionViewController *)self isEditing] & 1) == 0)
  {
    long long v7 = [(CKTranscriptCollectionViewController *)self chatItems];
    long long v8 = objc_msgSend(v7, "__ck_chatItemWithGUID:", v11);

    long long v9 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v10 = [v9 balloonView];
      [v10 setSelected:1 withSelectionState:v6];
    }
  }
}

- (void)_deselectChatItemGuid:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  objc_msgSend(v5, "__ck_chatItemWithGUID:", v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v7 = [v6 balloonView];
    [v7 setSelected:0 withSelectionState:0];
  }
}

- (void)balloonViewTextViewDidChangeSelection:(id)a3 selectedText:(id)a4 textView:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  if ([a4 length])
  {
    long long v9 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v21];
    long long v10 = [(CKTranscriptCollectionViewController *)self chatItems];
    unint64_t v11 = [v9 item];
    if ((v11 & 0x8000000000000000) == 0)
    {
      unint64_t v12 = v11;
      if (v11 < [v10 count])
      {
        int v13 = [v10 objectAtIndex:v12];
        int v14 = [v13 IMChatItem];
        unint64_t v15 = [v14 guid];

        long long v16 = [(CKTranscriptCollectionViewController *)self selectionManager];
        uint64_t v17 = [v8 selectedRange];
        long long v19 = +[CKBalloonSelectionState balloonSelectionState:textSelectionRange:](CKBalloonSelectionState, "balloonSelectionState:textSelectionRange:", 1, v17, v18);
        [v16 trackSelectedGuid:v15 selectionState:v19];

        BOOL v20 = [(CKTranscriptCollectionViewController *)self selectionManager];
        [v20 removeAllSelectedMessageGuidsExceptTrackedGuid];
      }
    }
  }
}

- (void)balloonView:(id)a3 userDidDragOutsideBalloonWithPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v33 = a3;
  long long v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v8 = [(CKTranscriptCollectionViewController *)self collectionView];
  long long v9 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v33];
  long long v10 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v9, "item"));
  unint64_t v11 = [v10 IMChatItem];
  unint64_t v12 = [v11 guid];

  objc_msgSend(v8, "convertPoint:fromView:", v33, x, y);
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v18 = objc_msgSend(v17, "indexPathForItemAtPoint:", v14, v16);

  if (v18 && ![v18 section] && objc_msgSend(v18, "item") >= 1)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v19 = [v18 item];
    if (v19 >= [v9 item])
    {
      uint64_t v25 = [v9 item];
      if (v25 < [v18 item])
      {
        for (unint64_t i = [v9 item]; i <= objc_msgSend(v18, "item"); ++i)
        {
          uint64_t v27 = [v7 objectAtIndex:i];
          id v28 = [v27 IMChatItem];
          double v29 = [v28 guid];

          if (([v29 isEqualToString:v12] & 1) == 0)
          {
            id v30 = +[CKBalloonSelectionState balloonSelectionState:1];
            [v32 setObject:v30 forKey:v29];
          }
        }
      }
    }
    else
    {
      for (unint64_t j = [v18 item]; j <= objc_msgSend(v9, "item"); ++j)
      {
        id v21 = [v7 objectAtIndex:j];
        int v22 = [v21 IMChatItem];
        uint64_t v23 = [v22 guid];

        if (([v23 isEqualToString:v12] & 1) == 0)
        {
          uint64_t v24 = +[CKBalloonSelectionState balloonSelectionState:1];
          [v32 setObject:v24 forKey:v23];
        }
      }
    }
    double v31 = [(CKTranscriptCollectionViewController *)self selectionManager];
    [v31 setSelectedGuids:v32];
  }
}

- (void)balloonView:(id)a3 willInsertPluginViewAsSubview:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v6];
  uint64_t v9 = [v8 row];
  if (v8)
  {
    unint64_t v10 = v9;
    unint64_t v11 = [(CKTranscriptCollectionViewController *)self chatItems];
    unint64_t v12 = [v11 count];

    if (v10 < v12)
    {
      double v13 = [(CKTranscriptCollectionViewController *)self chatItems];
      double v14 = [v13 objectAtIndex:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v15 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
        double v16 = [v14 contentViewControllerForContext:v15];

        uint64_t v17 = [v16 parentViewController];
        uint64_t v18 = v17;
        if (v17)
        {
          if (v17 != self)
          {
            [(CKTranscriptCollectionViewController *)v17 removeChildViewController:v16];
            [(CKTranscriptCollectionViewController *)self addChildViewController:v16];
            if (IMOSLoggingEnabled())
            {
              uint64_t v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                int v20 = 134217984;
                unint64_t v21 = v10;
                _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Re-parented chat item content view controller for chat item at index:%li", (uint8_t *)&v20, 0xCu);
              }
            }
          }
        }
      }
    }
  }
}

- (void)quickActionButtonWasTapped:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Quick save button tapped.", buf, 2u);
    }
  }
  id v6 = [(CKTranscriptCollectionViewController *)self collectionView];
  *(void *)buf = 0;
  v28[0] = buf;
  v28[1] = 0x3032000000;
  v28[2] = __Block_byref_object_copy__34;
  v28[3] = __Block_byref_object_dispose__34;
  id v29 = 0;
  id v7 = [v6 indexPathsForVisibleItems];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__CKTranscriptCollectionViewController_quickActionButtonWasTapped___block_invoke;
  v23[3] = &unk_1E56272B8;
  id v8 = v6;
  id v24 = v8;
  id v9 = v4;
  id v25 = v9;
  BOOL v26 = buf;
  [v7 enumerateObjectsUsingBlock:v23];

  unint64_t v10 = [(CKTranscriptCollectionViewController *)self chatItems];
  unint64_t v11 = *(void **)(v28[0] + 40);
  if (!v11
    || [v11 item] < 0
    || (unint64_t v12 = [*(id *)(v28[0] + 40) item], v12 >= objc_msgSend(v10, "count")))
  {
    double v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController quickActionButtonWasTapped:]((uint64_t)v28, v13, v16, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    double v13 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(*(id *)(v28[0] + 40), "item"));
    if ([v13 canPerformQuickAction])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v15 = *(void *)(v28[0] + 40);
      if (isKindOfClass) {
        [(CKTranscriptCollectionViewController *)self _quickActionPinButtonWasTapped:v9 atIndexPath:v15 chatItem:v13];
      }
      else {
        [(CKTranscriptCollectionViewController *)self _quickActionSaveButtonWasTapped:v9 atIndexPath:v15 chatItem:v13];
      }
    }
    else
    {
      uint64_t v22 = IMLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController quickActionButtonWasTapped:]();
      }
    }
  }

  _Block_object_dispose(buf, 8);
}

void __67__CKTranscriptCollectionViewController_quickActionButtonWasTapped___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 quickActionButton];
    id v9 = *(void **)(a1 + 40);

    if (v8 == v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)_quickActionPinButtonWasTapped:(id)a3 atIndexPath:(id)a4 chatItem:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    unint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Request to Pin chat item: %@", buf, 0xCu);
    }
  }
  id v12 = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__CKTranscriptCollectionViewController__quickActionPinButtonWasTapped_atIndexPath_chatItem___block_invoke;
  aBlock[3] = &unk_1E5620C40;
  id v13 = v12;
  id v29 = v13;
  double v14 = (void (**)(void))_Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __92__CKTranscriptCollectionViewController__quickActionPinButtonWasTapped_atIndexPath_chatItem___block_invoke_2;
  v26[3] = &unk_1E56211F0;
  id v15 = v13;
  id v27 = v15;
  uint64_t v16 = _Block_copy(v26);
  v14[2](v14);
  dispatch_time_t v17 = dispatch_time(0, 100000000);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__CKTranscriptCollectionViewController__quickActionPinButtonWasTapped_atIndexPath_chatItem___block_invoke_3;
  v21[3] = &unk_1E56267D8;
  id v22 = v10;
  uint64_t v23 = self;
  id v24 = v15;
  id v25 = v16;
  id v18 = v10;
  id v19 = v16;
  id v20 = v15;
  dispatch_after(v17, MEMORY[0x1E4F14428], v21);
}

uint64_t __92__CKTranscriptCollectionViewController__quickActionPinButtonWasTapped_atIndexPath_chatItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:2 animated:1];
}

uint64_t __92__CKTranscriptCollectionViewController__quickActionPinButtonWasTapped_atIndexPath_chatItem___block_invoke_2(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = 3;
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return [v2 setState:v3 animated:v4];
}

void __92__CKTranscriptCollectionViewController__quickActionPinButtonWasTapped_atIndexPath_chatItem___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isHighlighted]) {
    uint64_t v2 = 8;
  }
  else {
    uint64_t v2 = 4;
  }
  uint64_t v3 = [*(id *)(a1 + 40) chat];
  uint64_t v4 = [*(id *)(a1 + 32) IMChatItem];
  id v5 = [(id)v4 guid];
  uint64_t v6 = [*(id *)(a1 + 32) messagePartRange];
  objc_msgSend(v3, "sendSyndicationAction:forMessagePartGUID:syndicatedMessagePartRange:", v2, v5, v6, v7);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v8 = [*(id *)(a1 + 32) IMChatItem];
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4)
  {
    id v9 = [*(id *)(a1 + 32) IMChatItem];
    id v19 = [v9 messageItem];

    id v10 = [v19 swyAppName];
    uint64_t v11 = [v19 swyBundleID];
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      if (v2 == 8)
      {
        id v18 = [MEMORY[0x1E4F6EA28] sharedManager];
        [v18 decrementPinCountForBundleID:v12];
      }
      else
      {
        id v13 = [MEMORY[0x1E4F6EA28] sharedManager];
        [v13 incrementPinCountForBundleID:v12];

        double v14 = [MEMORY[0x1E4F6EA28] sharedManager];
        uint64_t v15 = [v14 getPinCountForBundleID:v12];

        uint64_t v16 = [MEMORY[0x1E4F6EA28] sharedManager];
        char v17 = [v16 isSharedWithYouEnabledForApplicationWithBundleID:v12];

        if (v15 >= 3 && (v17 & 1) == 0) {
          [*(id *)(a1 + 40) _showAutoDonationAlert:*(void *)(a1 + 48) forAppName:v10 bundleID:v12];
        }
      }
    }
  }
}

- (void)_showAutoDonationAlert:(id)a3 forAppName:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length] && objc_msgSend(v10, "length"))
  {
    uint64_t v11 = NSString;
    id v12 = CKFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"SHARED_WITH_YOU_AUTO_DONATION_ALERT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v14 = objc_msgSend(v11, "stringWithFormat:", v13, v9, v9);

    uint64_t v15 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v16 = [v15 userInterfaceLayoutDirection];

    if (v16 == 1) {
      char v17 = @"\u200F";
    }
    else {
      char v17 = @"\u200E";
    }
    id v18 = [(__CFString *)v17 stringByAppendingString:v14];

    id v19 = +[CKAlertController alertControllerWithTitle:v18 message:0 preferredStyle:0];
    id v20 = CKFrameworkBundle();
    uint64_t v21 = [v20 localizedStringForKey:@"SHARED_WITH_YOU_OK_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __83__CKTranscriptCollectionViewController__showAutoDonationAlert_forAppName_bundleID___block_invoke;
    v27[3] = &unk_1E56218C8;
    id v28 = v10;
    id v29 = self;
    id v22 = +[CKAlertAction actionWithTitle:v21 style:0 handler:v27];
    [v19 addAction:v22];

    uint64_t v23 = CKFrameworkBundle();
    id v24 = [v23 localizedStringForKey:@"SHARED_WITH_YOU_CANCEL_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v25 = +[CKAlertAction actionWithTitle:v24 style:1 handler:0];
    [v19 addAction:v25];

    BOOL v26 = [v19 popoverPresentationController];
    [v26 setSourceView:v8];

    [(CKTranscriptCollectionViewController *)self presentViewController:v19 animated:1 completion:0];
  }
  else
  {
    id v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController _showAutoDonationAlert:forAppName:bundleID:]();
    }
  }
}

void __83__CKTranscriptCollectionViewController__showAutoDonationAlert_forAppName_bundleID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F6EA28] sharedManager];
  [v2 setSharedWithYouEnabled:1 forApplicationWithBundleID:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 40) collectionView];
  [v3 reloadData];
}

- (void)_quickActionSaveButtonWasTapped:(id)a3 atIndexPath:(id)a4 chatItem:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CKTranscriptCollectionViewController *)self balloonViewForIndexPath:v9];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = *MEMORY[0x1E4F6DA20];
      id v13 = v11;
      -[CKTranscriptCollectionViewController _trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:](self, "_trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:", v12, v13, [v10 transcriptOrientation]);
    }
  }
  if (IMOSLoggingEnabled())
  {
    double v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v10;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Request to quick save chat item: %@", buf, 0xCu);
    }
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [(CKTranscriptCollectionViewController *)self _mediaObjectsForOrganicChatItem:v10 onIndexPath:v9];
    if ([v16 count])
    {
      [v15 addObjectsFromArray:v16];
      char v17 = CKMomentShareURLForMediaObjects(v16);
    }
    else
    {
      id v22 = IMLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController _quickActionSaveButtonWasTapped:atIndexPath:chatItem:]();
      }

      char v17 = 0;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v10;
    id v18 = [v16 mediaObject];
    if (v18)
    {
      [v15 addObject:v18];
      uint64_t v23 = v18;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      char v17 = CKMomentShareURLForMediaObjects(v19);
    }
    else
    {
      char v17 = 0;
    }

LABEL_23:
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v10;
    char v17 = [v16 momentShareURL];
    id v20 = [v16 mediaObjects];

    if (v20)
    {
      uint64_t v21 = [v16 mediaObjects];
      [v15 addObjectsFromArray:v21];
    }
    goto LABEL_23;
  }
  char v17 = 0;
LABEL_24:
  [(CKTranscriptCollectionViewController *)self _saveMediaObjects:v15 withMomentShareURL:v17 sender:v8];
}

- (id)_mediaObjectsForOrganicChatItem:(id)a3 onIndexPath:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v6 = a4;
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  if (!v6 || [v6 item] < 0 || (unint64_t v8 = objc_msgSend(v6, "item"), v8 >= objc_msgSend(v7, "count")))
  {
    id v18 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v9 addObject:v35];
    id v10 = [v35 layoutRecipe];
    double v36 = [v10 groupIdentifier];

    uint64_t v11 = [v6 item];
    if (v11 >= 1)
    {
      uint64_t v12 = v11 + 1;
      while (1)
      {
        id v13 = objc_msgSend(v7, "objectAtIndex:", v12 - 2, v35);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v14 = v13;
        id v15 = [v14 layoutRecipe];
        id v16 = [v15 groupIdentifier];
        char v17 = [v36 isEqualToString:v16];

        if ((v17 & 1) == 0)
        {

          break;
        }
        [v9 addObject:v14];

        if ((unint64_t)--v12 < 2) {
          goto LABEL_16;
        }
      }
    }
LABEL_16:
    for (unint64_t i = objc_msgSend(v6, "item", v35) + 1; i < objc_msgSend(v7, "count"); ++i)
    {
      uint64_t v21 = [v7 objectAtIndex:i];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      id v22 = v21;
      uint64_t v23 = [v22 layoutRecipe];
      id v24 = [v23 groupIdentifier];
      char v25 = [v36 isEqualToString:v24];

      if ((v25 & 1) == 0)
      {

LABEL_22:
        break;
      }
      [v9 addObject:v22];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        *(_DWORD *)buf = 138412546;
        int v43 = v27;
        __int16 v44 = 2112;
        uint64_t v45 = v36;
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Quick saving all %@ chat items in organic layout group with identifier %@", buf, 0x16u);
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v9;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          id v33 = [v32 mediaObject];

          if (v33)
          {
            double v34 = [v32 mediaObject];
            [v18 addObject:v34];
          }
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v29);
    }
  }

  return v18;
}

- (void)_saveMediaObjects:(id)a3 withMomentShareURL:(id)a4 sender:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__CKTranscriptCollectionViewController__saveMediaObjects_withMomentShareURL_sender___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    id v12 = v11;
    id v27 = v12;
    id v13 = _Block_copy(aBlock);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __84__CKTranscriptCollectionViewController__saveMediaObjects_withMomentShareURL_sender___block_invoke_2;
    v24[3] = &unk_1E5620C40;
    id v14 = v12;
    id v25 = v14;
    id v15 = (void (**)(void))_Block_copy(v24);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __84__CKTranscriptCollectionViewController__saveMediaObjects_withMomentShareURL_sender___block_invoke_3;
    id v22 = &unk_1E56211F0;
    id v16 = v14;
    uint64_t v23 = v16;
    char v17 = _Block_copy(&v19);
    if (v9)
    {
      v15[2](v15);
      if (CKSaveMomentShareFromURL(v9, 0, v17))
      {
LABEL_11:

        goto LABEL_12;
      }
      id v18 = IMLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController _saveMediaObjects:withMomentShareURL:sender:]();
      }
    }
    else
    {
      id v18 = +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:](CKUtilities, "quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:", v8, 0, v16, *MEMORY[0x1E4F6DB88], v13, v15, v17, v19, v20, v21, v22);
      if (v18) {
        [(CKTranscriptCollectionViewController *)self presentViewController:v18 animated:1 completion:0];
      }
    }

    goto LABEL_11;
  }
  id v16 = IMLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CKTranscriptCollectionViewController _saveMediaObjects:withMomentShareURL:sender:]();
  }
LABEL_12:
}

uint64_t __84__CKTranscriptCollectionViewController__saveMediaObjects_withMomentShareURL_sender___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:0 animated:1];
}

uint64_t __84__CKTranscriptCollectionViewController__saveMediaObjects_withMomentShareURL_sender___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:2 animated:1];
}

uint64_t __84__CKTranscriptCollectionViewController__saveMediaObjects_withMomentShareURL_sender___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = 3;
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return [v2 setState:v3 animated:v4];
}

- (void)_handleAssociatedMessageCellTapEvent:(id)a3 isDoubleTap:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v19 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v7 = [v19 indexPathForCell:v6];

  id v8 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
  id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));

  id v10 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v11 = [v9 associatedChatItemGUID];
  uint64_t v12 = [v9 associatedMessageRange];
  uint64_t v14 = objc_msgSend(v10, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v11, v12, v13);

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = [MEMORY[0x1E4F28D58] indexPathForItem:v14 inSection:0];
    id v16 = [(CKTranscriptCollectionViewController *)self balloonViewForIndexPath:v15];
    if (v16)
    {
      char v17 = [(CKTranscriptCollectionViewController *)self delegate];
      id v18 = v17;
      if (v4) {
        [v17 transcriptCollectionViewController:self balloonView:v16 doubleTappedItemAtIndexPath:v15];
      }
      else {
        [v17 transcriptCollectionViewController:self balloonView:v16 longPressedForItemWithIndexPath:v15];
      }
    }
  }
}

- (void)associatedMessageTranscriptCellDoubleTapped:(id)a3
{
}

- (void)associatedMessageTranscriptCellLongTouched:(id)a3
{
}

- (void)liveViewController:(id)a3 requestPresentationStyle:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (!v7)
  {
LABEL_11:

LABEL_14:
    if (IMOSLoggingEnabled())
    {
      char v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "CKTranscriptCollectionViewController - Did not find a CKTranscriptPluginChatItem object to call transcriptCollectionViewController:balloonView:didRequestPresentationStyle:forChatItem:allowAllStyles: for viewController %@", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)v20;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v20 != v8) {
      objc_enumerationMutation(v6);
    }
    id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v11 = v10;
    uint64_t v12 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
    id v13 = [v11 extensibleViewControllerForContext:v12];
    BOOL v14 = v13 == v5;

    if (v14) {
      break;
    }

LABEL_9:
    if (v7 == ++v9)
    {
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v7) {
        goto LABEL_3;
      }
      goto LABEL_11;
    }
  }

  if (!v11) {
    goto LABEL_14;
  }
  id v15 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:v11];
  id v16 = [(CKTranscriptCollectionViewController *)self delegate];
  [v16 transcriptCollectionViewController:self balloonView:v15 didRequestPresentationStyle:a4 forChatItem:v11 allowAllStyles:1];

LABEL_18:
}

- (void)liveViewController:(id)a3 stagePayload:(id)a4 skipShelf:(BOOL)a5 allowAllCommits:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  BOOL v14 = [(CKTranscriptCollectionViewController *)self balloonPluginForViewController:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__CKTranscriptCollectionViewController_liveViewController_stagePayload_skipShelf_allowAllCommits_completionHandler___block_invoke;
  block[3] = &unk_1E56272E0;
  BOOL v22 = a5;
  void block[4] = self;
  id v19 = v12;
  BOOL v23 = a6;
  id v20 = v14;
  id v21 = v13;
  id v15 = v13;
  id v16 = v14;
  id v17 = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __116__CKTranscriptCollectionViewController_liveViewController_stagePayload_skipShelf_allowAllCommits_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v8 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) identifier];
  BOOL v6 = *(unsigned char *)(a1 + 65) != 0;
  if (v2)
  {
    id v9 = 0;
    [v8 transcriptCollectionViewController:v3 balloonViewDidRequestCommitPayload:v4 forPlugin:v5 allowAllCommits:v6 error:&v9];
    id v7 = v9;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [v8 transcriptCollectionViewController:v3 balloonViewDidRequestStartEditingPayload:v4 forPlugin:v5 allowAllCommits:v6 completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)liveViewController:(id)a3 stageSticker:(id)a4 skipShelf:(BOOL)a5 allowAllCommits:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  id v13 = [(CKTranscriptCollectionViewController *)self balloonPluginForViewController:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__CKTranscriptCollectionViewController_liveViewController_stageSticker_skipShelf_allowAllCommits_completionHandler___block_invoke;
  block[3] = &unk_1E5627308;
  void block[4] = self;
  id v18 = v11;
  BOOL v21 = a6;
  id v19 = v13;
  id v20 = v12;
  id v14 = v12;
  id v15 = v13;
  id v16 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __116__CKTranscriptCollectionViewController_liveViewController_stageSticker_skipShelf_allowAllCommits_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) identifier];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
  id v8 = 0;
  [v2 transcriptCollectionViewController:v3 balloonViewDidRequestCommitSticker:v4 forPlugin:v5 allowAllCommits:v6 error:&v8];
  id v7 = v8;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)didTapWorkoutBalloonView:(id)a3 workoutData:(id)a4
{
}

- (void)interactionStartedFromPreviewItemControllerInBalloonView:(id)a3
{
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v3 beginHoldingContentOffsetUpdatesForReason:@"TranscriptPreviewItem"];
}

- (void)interactionStoppedFromPreviewItemControllerInBalloonView:(id)a3
{
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v3 endHoldingContentOffsetUpdatesForReason:@"TranscriptPreviewItem"];
}

- (void)tuConversationBalloonJoinButtonTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Processing join button tapped from balloonView: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [(CKTranscriptCollectionViewController *)self chat];
    id v8 = [v6 tuConversationUUID];

    [v7 joinExistingTUConversationWithUUID:v8];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CKTranscriptCollectionViewController tuConversationBalloonJoinButtonTapped:]();
    }
  }
}

- (void)balloonView:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v5 = a4;
  id v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v7 = [v5 transfer];

  uint64_t v8 = objc_msgSend(v6, "__ck_indexOfTransfer:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = [v6 objectAtIndex:v8];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v9 isPlayed] & 1) == 0
      && ([v9 isFromMe] & 1) == 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __80__CKTranscriptCollectionViewController_balloonView_mediaObjectDidFinishPlaying___block_invoke;
      v10[3] = &unk_1E5620AF8;
      v10[4] = self;
      id v11 = v9;
      [(CKTranscriptCollectionViewController *)self updateTranscript:v10 animated:1 completion:0];
    }
  }
}

void __80__CKTranscriptCollectionViewController_balloonView_mediaObjectDidFinishPlaying___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) chat];
  int v2 = [*(id *)(a1 + 40) IMChatItem];
  [v3 markChatItemAsPlayed:v2];
}

- (id)videoPlayerReusePool
{
  return +[CKVideoPlayerReusePool sharedPool];
}

- (void)photoStackBalloonView:(id)a3 photoStack:(id)a4 didSelectAssetReference:(id)a5
{
  id v18 = a3;
  id v7 = a5;
  uint64_t v8 = [(CKTranscriptCollectionViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v18];
    id v11 = v10;
    if (v10)
    {
      unint64_t v12 = [v10 item];
      id v13 = [(CKTranscriptCollectionViewController *)self chatItems];
      unint64_t v14 = [v13 count];

      if (v12 < v14)
      {
        id v15 = [(CKTranscriptCollectionViewController *)self chatItems];
        id v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v11, "item"));

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [(CKTranscriptCollectionViewController *)self delegate];
          [v17 transcriptCollectionViewController:self didTapPhotoStackForChatItem:v16 assetReference:v7];

          -[CKTranscriptCollectionViewController _trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:](self, "_trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:", *MEMORY[0x1E4F6DA30], v18, [v16 transcriptOrientation]);
        }
      }
    }
  }
}

- (void)photoStackBalloonView:(id)a3 didChangeCurrentAssetReference:(id)a4 isProgrammaticChange:(BOOL)a5 didChangeIndex:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  if (v6 && !a5)
  {
    id v17 = v9;
    id v10 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v9];
    id v11 = v10;
    if (v10)
    {
      unint64_t v12 = [v10 item];
      id v13 = [(CKTranscriptCollectionViewController *)self chatItems];
      unint64_t v14 = [v13 count];

      if (v12 < v14)
      {
        id v15 = [(CKTranscriptCollectionViewController *)self chatItems];
        id v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v11, "item"));

        -[CKTranscriptCollectionViewController _trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:](self, "_trackPhotoStackEvent:forStackBalloonView:transcriptOrientation:", *MEMORY[0x1E4F6DA28], v17, [v16 transcriptOrientation]);
      }
    }

    id v9 = v17;
  }
}

- (void)photoStackBalloonView:(id)a3 photoStackDidSelectAdditionalItems:(id)a4
{
  id v16 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  id v7 = v16;
  if (v6)
  {
    uint64_t v8 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v16];
    id v9 = v8;
    if (v8)
    {
      unint64_t v10 = [v8 item];
      id v11 = [(CKTranscriptCollectionViewController *)self chatItems];
      unint64_t v12 = [v11 count];

      if (v10 < v12)
      {
        id v13 = [(CKTranscriptCollectionViewController *)self chatItems];
        unint64_t v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v9, "item"));

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [(CKTranscriptCollectionViewController *)self delegate];
          [v15 transcriptCollectionViewController:self didTapPhotoStackAdditionalItemsForChatItem:v14];
        }
      }
    }

    id v7 = v16;
  }
}

- (void)didTapPendingMomentSharePhotoStackBalloonView:(id)a3
{
  id v15 = a3;
  id v4 = [(CKTranscriptCollectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  char v6 = v15;
  if (v5)
  {
    id v7 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v15];
    uint64_t v8 = v7;
    if (v7)
    {
      unint64_t v9 = [v7 item];
      unint64_t v10 = [(CKTranscriptCollectionViewController *)self chatItems];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        unint64_t v12 = [(CKTranscriptCollectionViewController *)self chatItems];
        id v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "item"));

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v14 = [(CKTranscriptCollectionViewController *)self delegate];
          [v14 transcriptCollectionViewController:self didTapPendingMomentShareForChatItem:v13];
        }
      }
    }

    char v6 = v15;
  }
}

- (void)didTapUnavailableMomentShareBalloonView:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:a3];
  char v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 item];
    id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
    unint64_t v8 = [v7 count];

    if (v6 < v8)
    {
      unint64_t v9 = [(CKTranscriptCollectionViewController *)self chatItems];
      unint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "item"));

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v11 = [v10 momentShareURL];
        if (v11)
        {
          unint64_t v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __80__CKTranscriptCollectionViewController_didTapUnavailableMomentShareBalloonView___block_invoke;
          v14[3] = &unk_1E5627330;
          id v15 = v11;
          [v12 openURL:v15 configuration:0 completionHandler:v14];

          id v13 = v15;
        }
        else
        {
          id v13 = IMLogHandleForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[CKTranscriptCollectionViewController didTapUnavailableMomentShareBalloonView:]();
          }
        }
      }
    }
  }
}

void __80__CKTranscriptCollectionViewController_didTapUnavailableMomentShareBalloonView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    unint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __80__CKTranscriptCollectionViewController_didTapUnavailableMomentShareBalloonView___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (void)locationShareBalloonViewIgnoreButtonTapped:(id)a3
{
  id v3 = [(CKTranscriptCollectionViewController *)self chat];
  [v3 markAllLocationShareItemsAsUnactionable];
}

- (void)locationShareBalloonViewShareButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = +[CKAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke;
  aBlock[3] = &unk_1E5622978;
  void aBlock[4] = self;
  unint64_t v6 = _Block_copy(aBlock);
  id v7 = CKFrameworkBundle();
  unint64_t v8 = [v7 localizedStringForKey:@"SHARE_LOCATION_ONE_HOUR" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke_2;
  v28[3] = &unk_1E5621380;
  id v9 = v6;
  id v29 = v9;
  unint64_t v10 = +[CKAlertAction actionWithTitle:v8 style:0 handler:v28];
  [v5 addAction:v10];

  unint64_t v11 = CKFrameworkBundle();
  unint64_t v12 = [v11 localizedStringForKey:@"SHARE_LOCATION_EOD" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke_3;
  v26[3] = &unk_1E5621380;
  id v13 = v9;
  id v27 = v13;
  unint64_t v14 = +[CKAlertAction actionWithTitle:v12 style:0 handler:v26];
  [v5 addAction:v14];

  id v15 = CKFrameworkBundle();
  id v16 = [v15 localizedStringForKey:@"SHARE_INDEFINITELY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke_4;
  v24[3] = &unk_1E5621380;
  id v25 = v13;
  id v17 = v13;
  id v18 = +[CKAlertAction actionWithTitle:v16 style:0 handler:v24];
  [v5 addAction:v18];

  id v19 = CKFrameworkBundle();
  id v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  BOOL v21 = +[CKAlertAction actionWithTitle:v20 style:1 handler:0];
  [v5 addAction:v21];

  BOOL v22 = [v5 popoverPresentationController];
  [v22 setSourceView:v4];

  [(CKTranscriptCollectionViewController *)self presentViewController:v5 animated:1 completion:0];
}

void __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) conversation];
  id v5 = [v4 chat];
  [v5 shareLocationWithDuration:a2];

  id v6 = [*(id *)(a1 + 32) chat];
  [v6 markAllLocationShareItemsAsUnactionable];
}

uint64_t __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__CKTranscriptCollectionViewController_locationShareBalloonViewShareButtonTapped___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sharingMenu
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke;
  aBlock[3] = &unk_1E5621B68;
  objc_copyWeak(&v32, &location);
  int v2 = _Block_copy(aBlock);
  id v3 = (void *)MEMORY[0x1E4F426E8];
  id v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"SHARE_LOCATION_ONE_HOUR" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v6 = [MEMORY[0x1E4F42A80] systemImageNamed:@"clock"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke_2;
  v29[3] = &unk_1E5624780;
  id v7 = v2;
  id v30 = v7;
  unint64_t v8 = [v3 actionWithTitle:v5 image:v6 identifier:0 handler:v29];

  id v9 = (void *)MEMORY[0x1E4F426E8];
  unint64_t v10 = CKFrameworkBundle();
  unint64_t v11 = [v10 localizedStringForKey:@"SHARE_LOCATION_EOD" value:&stru_1EDE4CA38 table:@"ChatKit"];
  unint64_t v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"calendar"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke_3;
  v27[3] = &unk_1E5624780;
  id v13 = v7;
  id v28 = v13;
  unint64_t v14 = [v9 actionWithTitle:v11 image:v12 identifier:0 handler:v27];

  id v15 = (void *)MEMORY[0x1E4F426E8];
  id v16 = CKFrameworkBundle();
  id v17 = [v16 localizedStringForKey:@"SHARE_INDEFINITELY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v18 = [MEMORY[0x1E4F42A80] systemImageNamed:@"infinity"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke_4;
  v25[3] = &unk_1E5624780;
  id v19 = v13;
  id v26 = v19;
  id v20 = [v15 actionWithTitle:v17 image:v18 identifier:0 handler:v25];

  BOOL v21 = (void *)MEMORY[0x1E4F42B80];
  v34[0] = v8;
  v34[1] = v14;
  v34[2] = v20;
  BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  BOOL v23 = [v21 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v22];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v23;
}

void __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained conversation];
  id v6 = [v5 chat];
  [v6 shareLocationWithDuration:a2];

  id v8 = objc_loadWeakRetained(v3);
  id v7 = [v8 chat];
  [v7 markAllLocationShareItemsAsUnactionable];
}

uint64_t __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__CKTranscriptCollectionViewController_sharingMenu__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)locationSharingClient:(id)a3 showShareLocationMenuWithBalloonPluginView:(id)a4
{
  id v35 = a4;
  id v5 = +[CKAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke;
  aBlock[3] = &unk_1E5622978;
  void aBlock[4] = self;
  id v6 = _Block_copy(aBlock);
  id v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"SHARE_LOCATION_ONE_HOUR" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke_2;
  v40[3] = &unk_1E5621380;
  id v9 = v6;
  id v41 = v9;
  unint64_t v10 = +[CKAlertAction actionWithTitle:v8 style:0 handler:v40];
  [v5 addAction:v10];

  unint64_t v11 = CKFrameworkBundle();
  unint64_t v12 = [v11 localizedStringForKey:@"SHARE_LOCATION_EOD" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke_3;
  v38[3] = &unk_1E5621380;
  id v13 = v9;
  id v39 = v13;
  unint64_t v14 = +[CKAlertAction actionWithTitle:v12 style:0 handler:v38];
  [v5 addAction:v14];

  id v15 = CKFrameworkBundle();
  id v16 = [v15 localizedStringForKey:@"SHARE_INDEFINITELY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke_4;
  v36[3] = &unk_1E5621380;
  id v17 = v13;
  id v37 = v17;
  id v18 = +[CKAlertAction actionWithTitle:v16 style:0 handler:v36];
  [v5 addAction:v18];

  id v19 = CKFrameworkBundle();
  id v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  BOOL v21 = +[CKAlertAction actionWithTitle:v20 style:1 handler:0];
  [v5 addAction:v21];

  if (!CKIsRunningInMacCatalyst())
  {
    BOOL v22 = [v5 popoverPresentationController];
    BOOL v23 = [(CKTranscriptCollectionViewController *)self view];
    [v22 setSourceView:v23];

    id v24 = [v5 popoverPresentationController];
    id v25 = [(CKTranscriptCollectionViewController *)self view];
    [v35 frame];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v34 = [v35 superview];
    objc_msgSend(v25, "convertRect:fromView:", v34, v27, v29, v31, v33);
    objc_msgSend(v24, "setSourceRect:");
  }
  [(CKTranscriptCollectionViewController *)self presentViewController:v5 animated:1 completion:0];
}

void __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) conversation];
  id v3 = [v4 chat];
  [v3 shareLocationWithDuration:a2];
}

uint64_t __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __105__CKTranscriptCollectionViewController_locationSharingClient_showShareLocationMenuWithBalloonPluginView___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)balloonViewTitleTapped:(id)a3
{
  id v5 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:a3];
  id v4 = [(CKTranscriptCollectionViewController *)self delegate];
  [v4 transcriptCollectionViewController:self balloonViewTitleTappedForItemWithIndexPath:v5];
}

- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v5 = a4;
  id v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v7 = [v5 transfer];
  uint64_t v8 = objc_msgSend(v6, "__ck_indexOfTransfer:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v6 objectAtIndex:v8];
    if (([v9 isFromMe] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v9 isPlayed] & 1) == 0)
      {
        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        BOOL v23 = __84__CKTranscriptCollectionViewController_audioController_mediaObjectDidFinishPlaying___block_invoke;
        id v24 = &unk_1E5620AF8;
        id v25 = self;
        id v26 = v9;
        [(CKTranscriptCollectionViewController *)self updateTranscript:&v21 animated:1 completion:0];
      }
    }
    unint64_t v10 = [(CKTranscriptCollectionViewController *)self chatItems];

    unint64_t v11 = [v5 transfer];
    uint64_t v12 = objc_msgSend(v10, "__ck_indexOfTransfer:", v11);

    id v13 = [(CKTranscriptCollectionViewController *)self collectionView];
    unint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 inSection:0];
    id v15 = [v13 cellForItemAtIndexPath:v14];
    id v16 = v15;
    if (v15 && [v15 isAudioMessage])
    {
      id v17 = [v16 balloonView];
      [v17 setTime:0.0];
      [v17 setPlaying:0];
      [v17 setPlayed:1];
      [v17 prepareForDisplayIfNeeded];
    }
    id v6 = v10;
  }
  id v18 = [(CKTranscriptCollectionViewController *)self __CurrentTestName];
  int v19 = [v18 isEqualToString:@"AudioBalloonPlayBack"];

  if (v19)
  {
    id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 postNotificationName:@"kAudioBalloonViewPlaybackDidFinishNotification" object:0];
  }
}

void __84__CKTranscriptCollectionViewController_audioController_mediaObjectDidFinishPlaying___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) chat];
  int v2 = [*(id *)(a1 + 40) IMChatItem];
  [v3 markChatItemAsPlayed:v2];
}

- (void)audioController:(id)a3 updateAudioBalloonsForTime:(double)a4 mediaObject:(id)a5
{
  id v24 = a3;
  id v8 = a5;
  id v9 = [(CKTranscriptCollectionViewController *)self chatItems];
  unint64_t v10 = [v8 transfer];

  uint64_t v11 = objc_msgSend(v9, "__ck_indexOfTransfer:", v10);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
    unint64_t v14 = [v12 cellForItemAtIndexPath:v13];
    id v15 = v14;
    if (v14 && [v14 isAudioMessage])
    {
      id v16 = [v15 balloonView];
      [v16 setTime:a4];
      objc_msgSend(v16, "setPlaying:", objc_msgSend(v24, "isPlaying"));
      [v16 prepareForDisplayIfNeeded];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v24 stop];
      }
    }

    id v17 = [v9 objectAtIndex:v11];
    id v18 = [v17 mediaObject];
    int v19 = [v18 transferGUID];
    [(CKTranscriptCollectionViewController *)self setSpeakerTransferGUID:v19];

    [(CKTranscriptCollectionViewController *)self reconfigureVisibleSpeakerButtonCells];
  }
  id v20 = [(CKTranscriptCollectionViewController *)self __CurrentTestName];
  int v21 = [v20 isEqualToString:@"AudioBalloonPlayBack"];

  if (v21)
  {
    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v23 = v22;
    if (a4 == 0.0) {
      [v22 postNotificationName:@"kAudioBalloonViewPlaybackWillStartNotification" object:0];
    }
  }
}

- (void)audioControllerDidPause:(id)a3
{
  id v13 = a3;
  id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v5 = [v13 currentMediaObject];
  id v6 = [v5 transfer];
  uint64_t v7 = objc_msgSend(v4, "__ck_indexOfTransfer:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:0];
    unint64_t v10 = [v8 cellForItemAtIndexPath:v9];
    uint64_t v11 = v10;
    if (v10 && [v10 isAudioMessage])
    {
      uint64_t v12 = [v11 balloonView];
      [v12 setPlaying:0];
      [v12 prepareForDisplayIfNeeded];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v13 stop];
      }
    }
  }
}

- (void)audioControllerDidStop:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CKTranscriptCollectionViewController *)self delegate];
    [v7 transcriptCollectionViewControllerAudioControllerDidStop:self];
  }
  id v19 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v8 = [v4 currentMediaObject];

  id v9 = [v8 transfer];
  uint64_t v10 = objc_msgSend(v19, "__ck_indexOfTransfer:", v9);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:0];
    id v13 = [v11 cellForItemAtIndexPath:v12];
    unint64_t v14 = v13;
    if (v13 && [v13 isAudioMessage])
    {
      id v15 = [v14 balloonView];
      [v15 setTime:0.0];
      [v15 setPlaying:0];
      [v15 prepareForDisplayIfNeeded];
    }
  }
  id v16 = +[CKAppAudioController sharedInstance];
  id v17 = [v16 audioController];
  [v17 setDelegate:0];

  id v18 = +[CKAppAudioController sharedInstance];
  [v18 setAudioController:0];
}

- (void)audioControllerPlayingDidChange:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self delegate];
  [v4 transcriptCollectionViewControllerPlayingAudioDidChange:self];
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v7 = a4;
  if ([a5 isEqualToString:*MEMORY[0x1E4F1BAF8]])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v7;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      uint64_t v12 = *MEMORY[0x1E4F1ADC8];
      uint64_t v27 = *MEMORY[0x1E4F1AEE0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(obj);
          }
          unint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "key", v26);
          int v16 = [v15 isEqualToString:v12];

          if (v16)
          {
            id v17 = [v14 value];
          }
          else
          {
            id v18 = [v14 key];
            int v19 = [v18 isEqualToString:v27];

            if (v19)
            {
              id v20 = [v14 value];
              id v17 = [v20 stringValue];
            }
            else
            {
              id v17 = 0;
            }
          }
          int v21 = IMStripFormattingFromAddress();

          uint64_t v22 = [v29 preferredHandle];
          BOOL v23 = IMStripFormattingFromAddress();
          int v24 = MEMORY[0x192FBAF60](v21, v23);

          if (v24) {
            [v8 insertObject:v14 atIndex:0];
          }
          else {
            [v8 addObject:v14];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    id v7 = v26;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)effectManager:(id)a3 didStartEffect:(id)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    char v6 = [(CKTranscriptCollectionViewController *)self chat];
    id v7 = [v5 triggeringChatItem];
    id v8 = [v7 IMChatItem];
    [v6 markChatItemAsPlayedExpressiveSend:v8];

    uint64_t v9 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v10 = [v9 visibleCells];
    uint64_t v11 = (void *)[v10 mutableCopy];

    if ([v5 effectIsDark])
    {
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v98 objects:v102 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v99;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v99 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v98 + 1) + 8 * v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v17 setShouldConfigureForDarkFSM:1];
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v98 objects:v102 count:16];
        }
        while (v14);
      }
    }
    [v5 playSoundEffect];
    id v18 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
    [v18 beginHoldingUpdatesForKey:@"CKFullscreenUpdatesPlaying"];

    [(CKTranscriptCollectionViewController *)self addContentAnimationPauseReasons:4];
    [(CKTranscriptCollectionViewController *)self setShouldUseOpaqueMask:0];
    int v19 = [v5 triggeringChatItem];
    id v20 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v19];

    [v11 removeObject:v20];
    if ([v11 count]) {
      [v5 applyMessageFiltersToCells:v11];
    }
    if (v20)
    {
      int v21 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
      uint64_t v22 = [v21 currentEffect];
      [v22 applyMessageFiltersToTriggeringCell:v20];
    }
    BOOL v23 = [(CKTranscriptCollectionViewController *)self delegate];
    int v24 = [v23 transcriptCollectionViewController:self shouldSetupFullscreenEffectUI:v5];

    if (v24)
    {
      id v25 = [v5 backgroundColor];
      if (v25)
      {
        id v26 = [(CKTranscriptCollectionViewController *)self view];
        uint64_t v27 = [v26 backgroundColor];
        char v28 = [v27 isEqual:v25];

        if ((v28 & 1) == 0)
        {
          id v29 = (void *)MEMORY[0x1E4F42FF0];
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __69__CKTranscriptCollectionViewController_effectManager_didStartEffect___block_invoke;
          v96[3] = &unk_1E5620AF8;
          v96[4] = self;
          id v97 = v25;
          [v29 animateWithDuration:v96 animations:0 completion:0.3];
        }
      }
      if ([v5 shouldDrawOverNavigationBar] && CKIsRunningInMessages())
      {
        long long v30 = [(CKTranscriptCollectionViewController *)self delegate];
        long long v31 = [v30 transcriptCollectionViewControllerOuterEffectPresentingView:self];

        id v32 = objc_alloc((Class)[v5 effectViewClass]);
        long long v33 = [(CKTranscriptCollectionViewController *)self view];
        [v33 bounds];
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;
        int v42 = [(CKTranscriptCollectionViewController *)self view];
        objc_msgSend(v31, "convertRect:fromView:", v42, v35, v37, v39, v41);
        int v43 = objc_msgSend(v32, "initWithFrame:");

        [v43 setZIndex:3];
        [v43 setUserInteractionEnabled:0];
        [v31 addSubview:v43];
        __int16 v44 = +[CKUIBehavior sharedBehaviors];
        LODWORD(v42) = [v44 shouldHideStatusBarForFullScreenEffects];

        if (v42)
        {
          uint64_t v45 = [(id)*MEMORY[0x1E4F43630] statusBar];
          [v45 setHidden:1 animated:1];
        }
        [(CKTranscriptCollectionViewController *)self setTopEffectView:v43];
        [(CKTranscriptCollectionViewController *)self _updateEffectViewMessageRect:v43 effect:v5];
        uint64_t v46 = [v5 triggeringChatItem];
        uint64_t v47 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v46];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v48 = [v47 balloonView];
          double v49 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v47];
          objc_opt_class();
          v95 = v49;
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v49 transcriptOrientation] == 2)
            {
              id v48 = v48;
              int v50 = [v48 wantsGradient];
              __int16 v51 = v48;
              if (v50)
              {
                v94 = v48;
                CKBalloonViewForClass((objc_class *)[v49 balloonViewClass]);
                id v48 = (id)objc_claimAutoreleasedReturnValue();
                [v48 configureForMessagePart:v49];
                [v48 setInvisibleInkEffectEnabled:0];
                [v48 setCanUseOpaqueMask:0];
                if (objc_opt_respondsToSelector())
                {
                  id v52 = [(CKTranscriptCollectionViewController *)self gradientReferenceView];
                  [v48 setGradientReferenceView:v52];

                  double v49 = v95;
                }
                [v48 setNeedsPrepareForDisplay];
                [v48 prepareForDisplayIfNeeded];
                [v49 size];
                double v54 = v53;
                double v56 = v55;
                int v57 = [v49 itemIsReplyContextPreview];
                BOOL v58 = +[CKUIBehavior sharedBehaviors];
                if (v57)
                {
                  uint64_t v59 = v58;
                  [v58 replyBalloonMaskSizeWithTailShape:1 isMultiline:0];
                  [v48 setWantsSkinnyMask:v54 < v60];

                  uint64_t v61 = +[CKUIBehavior sharedBehaviors];
                  [v61 textReplyPreviewBalloonMinHeight];
                }
                else
                {
                  uint64_t v63 = v58;
                  [v58 balloonMaskSizeWithTailShape:1 isMultiline:0];
                  [v48 setWantsSkinnyMask:v54 < v64];

                  uint64_t v61 = +[CKUIBehavior sharedBehaviors];
                  [v61 textBalloonMinHeight];
                }
                [v48 setWantsMultilineMask:v56 > v62];

                [v94 bounds];
                objc_msgSend(v48, "setFrame:");
                [v48 layoutIfNeeded];
                v65 = [(CKTranscriptCollectionViewController *)self gradientReferenceView];
                [v65 gradientFrame];
                double v67 = v66;
                double v69 = v68;
                double v71 = v70;
                double v73 = v72;

                v74 = [(CKTranscriptCollectionViewController *)self gradientReferenceView];
                objc_msgSend(v74, "convertRect:toView:", v94, v67, v69, v71, v73);
                double v76 = v75;
                double v78 = v77;
                double v80 = v79;
                double v82 = v81;

                if (objc_opt_respondsToSelector()) {
                  objc_msgSend(v48, "setGradientOverrideFrame:", v76, v78, v80, v82);
                }
                [v48 layoutIfNeeded];

                __int16 v51 = v94;
              }
            }
          }
          [v48 bounds];
          CGFloat v85 = v84;
          CGFloat v86 = v83;
          if (v84 == *MEMORY[0x1E4F1DB30] && v83 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
          {
            v87 = IMLogHandleForCategory();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
              -[CKTranscriptCollectionViewController effectManager:didStartEffect:]();
            }
          }
          else
          {
            v88 = [MEMORY[0x1E4F42D90] mainScreen];
            [v88 scale];
            CGFloat v90 = v89;
            v104.double width = v85;
            v104.double height = v86;
            UIGraphicsBeginImageContextWithOptions(v104, 0, v90);

            [v48 bounds];
            objc_msgSend(v48, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
            v87 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            [v43 setMessageImage:v87];
          }
        }
        [v43 startAnimation];
      }
    }
    v91 = [(CKTranscriptCollectionViewController *)self collectionView];
    v92 = [v91 collectionViewLayout];
    [v92 invalidateLayout];

    v93 = [(CKTranscriptCollectionViewController *)self collectionView];
    [v93 reloadData];
  }
}

void __69__CKTranscriptCollectionViewController_effectManager_didStartEffect___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:*(void *)(a1 + 40)];
}

- (void)effectManager:(id)a3 didStopEffect:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = v5;
  if (v5)
  {
    if ([v5 effectIsDark])
    {
      id v7 = [(CKTranscriptCollectionViewController *)self collectionView];
      id v8 = [v7 visibleCells];
      uint64_t v9 = (void *)[v8 mutableCopy];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v36 = 0u;
      long long v35 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v36;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v15 setShouldConfigureForDarkFSM:0];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v12);
      }
    }
    uint64_t v16 = [(CKTranscriptCollectionViewController *)self __CurrentTestName];

    if (v16)
    {
      id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 postNotificationName:@"CKEffectManagerEffectDidEndForPPT" object:self];
    }
    id v18 = [(CKTranscriptCollectionViewController *)self collectionView];
    int v19 = [v18 visibleCells];
    [v6 clearMessageFiltersFromCells:v19];

    [v6 stopSoundEffect];
    id v20 = [(CKTranscriptCollectionViewController *)self collectionView];
    [v20 reloadData];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__CKTranscriptCollectionViewController_effectManager_didStopEffect___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    void aBlock[4] = self;
    int v21 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v22 = [(CKTranscriptCollectionViewController *)self delegate];
    int v23 = [v22 transcriptCollectionViewController:self shouldCleanupFullscreenEffectUI:v6];

    if (!v23) {
      goto LABEL_20;
    }
    int v24 = [(CKTranscriptCollectionViewController *)self topEffectView];
    [v24 stopAnimation];

    id v25 = [(CKTranscriptCollectionViewController *)self topEffectView];
    [v25 removeFromSuperview];

    [(CKTranscriptCollectionViewController *)self setTopEffectView:0];
    id v26 = +[CKUIBehavior sharedBehaviors];
    int v27 = [v26 shouldHideStatusBarForFullScreenEffects];

    if (v27)
    {
      char v28 = [(id)*MEMORY[0x1E4F43630] statusBar];
      [v28 setHidden:0 animated:1];
    }
    id v29 = [v6 backgroundColor];

    if (v29)
    {
      long long v30 = (void *)MEMORY[0x1E4F42FF0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __68__CKTranscriptCollectionViewController_effectManager_didStopEffect___block_invoke_2;
      v33[3] = &unk_1E5620C40;
      v33[4] = self;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__CKTranscriptCollectionViewController_effectManager_didStopEffect___block_invoke_3;
      v31[3] = &unk_1E5622358;
      id v32 = v21;
      [v30 animateWithDuration:v33 animations:v31 completion:0.5];
    }
    else
    {
LABEL_20:
      v21[2](v21);
    }
  }
}

void __68__CKTranscriptCollectionViewController_effectManager_didStopEffect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShouldUseOpaqueMask:", objc_msgSend(*(id *)(a1 + 32), "_canUseOpaqueMask"));
  [*(id *)(a1 + 32) removeContentAnimationPauseReasons:4];
  id v2 = [*(id *)(a1 + 32) fullscreenEffectManager];
  [v2 endHoldingUpdatesForKey:@"CKFullscreenUpdatesPlaying"];
}

void __68__CKTranscriptCollectionViewController_effectManager_didStopEffect___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  id v2 = [*(id *)(a1 + 32) transcriptBackgroundColor];
  [v3 setBackgroundColor:v2];
}

uint64_t __68__CKTranscriptCollectionViewController_effectManager_didStopEffect___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendAnimationManagerWillStartAnimation:(id)a3 context:(id)a4
{
  id v5 = a4;
  [(CKTranscriptCollectionViewController *)self setShouldUseOpaqueMask:0];
  char v6 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v6 beginHoldingUpdatesForKey:@"CKFullscreenUpdatesImpactAnimation"];

  id v7 = [(CKTranscriptCollectionViewController *)self delegate];
  [v7 transcriptCollectionViewController:self willBeginImpactEffectAnimationWithSendAnimationContext:v5];
}

- (void)sendAnimationManagerDidStopAnimation:(id)a3 context:(id)a4
{
  id v5 = a4;
  char v6 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  id v7 = [v6 currentEffect];

  if (!v7) {
    [(CKTranscriptCollectionViewController *)self setShouldUseOpaqueMask:[(CKTranscriptCollectionViewController *)self _canUseOpaqueMask]];
  }
  id v8 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  [v8 endHoldingUpdatesForKey:@"CKFullscreenUpdatesImpactAnimation"];

  uint64_t v9 = [(CKTranscriptCollectionViewController *)self delegate];
  [v9 transcriptCollectionViewController:self didEndImpactEffectAnimationWithSendAnimationContext:v5];

  [(CKTranscriptCollectionViewController *)self reloadData];
}

- (void)setPoppedBalloonGUIDHiddenUntilNextChatItemUpdate:(id)a3
{
  id v5 = (NSString *)a3;
  poppedBalloonGUIDHiddenUntilNextChatItemUpdate = self->_poppedBalloonGUIDHiddenUntilNextChatItemUpdate;
  id v7 = v5;
  if (poppedBalloonGUIDHiddenUntilNextChatItemUpdate != v5)
  {
    if (poppedBalloonGUIDHiddenUntilNextChatItemUpdate) {
      -[CKTranscriptCollectionViewController setChatItemHidden:forChatItemGUID:](self, "setChatItemHidden:forChatItemGUID:", 0);
    }
    objc_storeStrong((id *)&self->_poppedBalloonGUIDHiddenUntilNextChatItemUpdate, a3);
    if (self->_poppedBalloonGUIDHiddenUntilNextChatItemUpdate) {
      -[CKTranscriptCollectionViewController setChatItemHidden:forChatItemGUID:](self, "setChatItemHidden:forChatItemGUID:", 1);
    }
  }
}

- (void)transcriptBalloonCell:(id)a3 didTranslateBalloonByDelta:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CKTranscriptCollectionViewController_transcriptBalloonCell_didTranslateBalloonByDelta___block_invoke;
  aBlock[3] = &unk_1E5627358;
  void aBlock[4] = self;
  *(double *)&void aBlock[5] = a4;
  id v7 = (void (**)(void *, void, double))_Block_copy(aBlock);
  id v8 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = objc_msgSend(v8, "visibleAssociatedMessageChatItems", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v7[2](v7, *(void *)(*((void *)&v16 + 1) + 8 * v13++), a4);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [v8 messageHighlightChatItem];

  if (v14)
  {
    uint64_t v15 = [v8 messageHighlightChatItem];
    ((void (**)(void *, void *, double))v7)[2](v7, v15, a4);
  }
}

void __89__CKTranscriptCollectionViewController_transcriptBalloonCell_didTranslateBalloonByDelta___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) cellForAssociatedChatItem:a2];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v3 = *(double *)(a1 + 40);
      id v4 = v5;
      [v4 setSwipeToReplyDelta:v3];
      [v4 setNeedsLayout];
      [v4 layoutIfNeeded];
    }
  }
}

- (void)transcriptBalloonCell:(id)a3 didEndBalloonSwipeWithDelta:(double)a4 swipeVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v9];
  uint64_t v11 = [v10 IMChatItem];
  id v26 = [v11 guid];

  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = [v10 visibleAssociatedMessageChatItems];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [*(id *)(*((void *)&v27 + 1) + 8 * v17) IMChatItem];
        long long v19 = [v18 guid];
        [v12 addObject:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v15);
  }

  id v20 = [v9 balloonView];
  int v21 = objc_alloc_init(CKInlineReplyTransitionProperties);
  [(CKInlineReplyTransitionProperties *)v21 setInitialBalloonOffsetX:a4];
  long long v31 = v26;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [(CKInlineReplyTransitionProperties *)v21 setChatItemGUIDs:v22];

  int v23 = (void *)[v12 copy];
  [(CKInlineReplyTransitionProperties *)v21 setAssociatedChatItemGUIDs:v23];

  -[CKInlineReplyTransitionProperties setSwipeVelocity:](v21, "setSwipeVelocity:", x, y);
  int v24 = [(CKTranscriptCollectionViewController *)self delegate];
  id v25 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v20];
  [v24 transcriptCollectionViewController:self balloonView:v20 showInlineReplyForItemWithIndexPath:v25 withReplyTransitionProperties:v21];
}

- (id)transcriptBalloonCell:(id)a3 layoutAttributesForTextBalloonView:(id)a4 messageDisplayViewFrame:(CGRect)a5 inContainerFrame:(CGRect)a6 proposedAttributes:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  uint64_t v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isExpressiveTextEnabled];

  if (v14)
  {
    uint64_t v15 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v10];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v11 textView];
        char v17 = objc_msgSend(v16, "ck_hasPlayingOrPausedTextAnimator");

        if (v17)
        {
          [v11 alignmentRectInsets];
          double v43 = v19;
          double v44 = v18;
          double v21 = v20;
          double v23 = v22;
          [v11 textAlignmentInsets];
          double v41 = v25;
          double v42 = v24;
          double v27 = v26;
          double v29 = v28;
          long long v30 = [v11 textView];
          [v30 _customRenderBounds];
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          CGFloat v36 = v35;
          CGFloat v38 = v37;

          v46.origin.double x = v32;
          v46.origin.double y = v34;
          v46.size.double width = v36;
          v46.size.double height = v38;
          double v39 = v23 - v29 + v21 - v27 + CGRectGetWidth(v46);
          v47.origin.double x = v32;
          v47.origin.double y = v34;
          v47.size.double width = v36;
          v47.size.double height = v38;
          objc_msgSend(v12, "setSize:", v39, v43 - v41 + v44 - v42 + CGRectGetHeight(v47));
          [v12 setWantsFrameClamping:0];
        }
        else
        {
          [v15 size];
          objc_msgSend(v12, "setSize:");
        }
      }
    }
  }

  return v12;
}

- (void)didTapTranscriptActionButtonCell:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x3032000000;
  double v37 = __Block_byref_object_copy__34;
  CGFloat v38 = __Block_byref_object_dispose__34;
  id v39 = 0;
  id v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathsForVisibleItems];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __73__CKTranscriptCollectionViewController_didTapTranscriptActionButtonCell___block_invoke;
  v30[3] = &unk_1E56272B8;
  id v7 = v5;
  id v31 = v7;
  id v8 = v4;
  id v32 = v8;
  double v33 = &v34;
  [v6 enumerateObjectsUsingBlock:v30];

  id v9 = (void *)v35[5];
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = [v9 item];
    id v12 = objc_msgSend(v10, "indexPathForItem:inSection:", v11 + 1, objc_msgSend((id)v35[5], "section"));
    uint64_t v13 = [(CKTranscriptCollectionViewController *)self balloonViewForIndexPath:v12];
    int v14 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v12, "item"));

    if (v15 && v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v13;
        char v17 = [(CKTranscriptCollectionViewController *)self delegate];
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          double v19 = [(CKTranscriptCollectionViewController *)self delegate];
          double v20 = [v16 currentAssetReference];
          [v19 transcriptCollectionViewController:self didTapPhotoStackButtonForChatItem:v15 assetReference:v20];
        }
        uint64_t v21 = [v15 transcriptOrientation];
        [(CKTranscriptCollectionViewController *)self _trackPhotoStackEvent:*MEMORY[0x1E4F6D9E8] forStackBalloonView:v16 transcriptOrientation:v21];

LABEL_20:
        goto LABEL_21;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v25 = [(CKTranscriptCollectionViewController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v25 transcriptCollectionViewController:self didTapPhotoStackButtonForPendingMomentShareChatItem:v15];
        }

        goto LABEL_20;
      }
    }
    if (IMOSLoggingEnabled())
    {
      double v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        double v27 = [v8 attributedText];
        double v28 = [v27 string];
        uint64_t v29 = v35[5];
        *(_DWORD *)buf = 138412546;
        double v41 = v28;
        __int16 v42 = 2112;
        uint64_t v43 = v29;
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Failed to locate balloon view for action button: \"%@\", index path: %@", buf, 0x16u);
      }
    }
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    double v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      double v23 = [v8 attributedText];
      double v24 = [v23 string];
      *(_DWORD *)buf = 138412290;
      double v41 = v24;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Failed to look up index path for action button: \"%@\"", buf, 0xCu);
    }
  }
LABEL_21:

  _Block_object_dispose(&v34, 8);
}

void __73__CKTranscriptCollectionViewController_didTapTranscriptActionButtonCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (v7 == *(void **)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)showGridForChatItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [(CKTranscriptCollectionViewController *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [(CKTranscriptCollectionViewController *)self delegate];
        id v10 = [v6 currentAssetReference];
        [v9 transcriptCollectionViewController:self didTapPhotoStackButtonForChatItem:v4 assetReference:v10];
      }
LABEL_9:

      goto LABEL_15;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(CKTranscriptCollectionViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v6 transcriptCollectionViewController:self didTapPhotoStackButtonForPendingMomentShareChatItem:v4];
      }
      goto LABEL_9;
    }
  }
  if (!v5 && IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Failed to locate balloon view for chatItem: %@", (uint8_t *)&v12, 0xCu);
    }
  }
LABEL_15:
}

- (void)didPinchPhotoStackCell:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = __Block_byref_object_copy__34;
  double v27 = __Block_byref_object_dispose__34;
  id v28 = 0;
  id v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathsForVisibleItems];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__CKTranscriptCollectionViewController_didPinchPhotoStackCell___block_invoke;
  v19[3] = &unk_1E56272B8;
  id v7 = v5;
  id v20 = v7;
  id v8 = v4;
  id v21 = v8;
  double v22 = &v23;
  [v6 enumerateObjectsUsingBlock:v19];

  if (v24[5])
  {
    id v9 = -[CKTranscriptCollectionViewController balloonViewForIndexPath:](self, "balloonViewForIndexPath:");
    id v10 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend((id)v24[5], "item"));

    if (v11 && v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v12 = [(CKTranscriptCollectionViewController *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        uint64_t v14 = [(CKTranscriptCollectionViewController *)self delegate];
        uint64_t v15 = [v9 currentAssetReference];
        [v14 transcriptCollectionViewController:self didPinchPhotoStackForChatItem:v11 assetReference:v15];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = v24[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v17;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Failed to locate balloon view for transcriptPhotoStackCell, index path: %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    char v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Failed to look up index path for transcriptPhotoStackCell", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

void __63__CKTranscriptCollectionViewController_didPinchPhotoStackCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (v7 == *(void **)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)recoverJunkPressedInTranscriptCell:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(CKConversationConfirmationAlertsController);
  BOOL v6 = CKIsRunningInMacCatalyst() != 0;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  int v12 = __75__CKTranscriptCollectionViewController_recoverJunkPressedInTranscriptCell___block_invoke;
  char v13 = &unk_1E56215C8;
  objc_copyWeak(&v14, &location);
  id v7 = _Block_copy(&v10);
  id v8 = [(CKTranscriptCollectionViewController *)self conversation];
  v16[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [(CKConversationConfirmationAlertsController *)v5 presentRecoverJunkConversationsConfirmationFromViewController:self forConversations:v9 alertControllerStyle:v6 alertsCompletedBlock:v7 cancelBlock:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__CKTranscriptCollectionViewController_recoverJunkPressedInTranscriptCell___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained conversation];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 delegate];
  id v5 = objc_loadWeakRetained(v1);
  [v4 transcriptCollectionViewController:v5 requestRecoverJunkConversation:v6];
}

- (void)dateCell:(id)a3 requestsPresentEditDateViewController:(id)a4
{
}

- (void)deleteConversationPressedInTranscriptCell:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(CKConversationConfirmationAlertsController);
  BOOL v6 = CKIsRunningInMacCatalyst() != 0;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  int v12 = __82__CKTranscriptCollectionViewController_deleteConversationPressedInTranscriptCell___block_invoke;
  char v13 = &unk_1E56215C8;
  objc_copyWeak(&v14, &location);
  id v7 = _Block_copy(&v10);
  id v8 = [(CKTranscriptCollectionViewController *)self conversation];
  v16[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [(CKConversationConfirmationAlertsController *)v5 presentPermanentJunkDeletionConfirmationFromViewController:self forConversations:v9 alertControllerStyle:v6 alertsCompletedBlock:v7 cancelBlock:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __82__CKTranscriptCollectionViewController_deleteConversationPressedInTranscriptCell___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained conversation];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 delegate];
  id v5 = objc_loadWeakRetained(v1);
  [v4 transcriptCollectionViewController:v5 requestDeleteJunkConversation:v6];
}

- (void)keyTransparencyTranscriptCellDidRequestVerification:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self chat];
  +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:v4 fromViewController:self];
}

- (void)keyTransparencyTranscriptCellDidRequestReportToApple:(id)a3
{
}

- (void)keyTransparencyTranscriptCellDidSelectLearnMore:(id)a3
{
}

- (void)keyTransparencyTranscriptCellDidSelectIgnoreFailures:(id)a3
{
  id v9 = a3;
  id v4 = [(CKTranscriptCollectionViewController *)self conversation];
  id v5 = [v4 chat];
  id v6 = +[CKKeyTransparencyErrorUtilities ktClearWarningAlertControllerForChat:v5 confirmationHandler:0];

  if (!CKIsRunningInMacCatalyst() && +[CKUtilities isIpad])
  {
    id v7 = [v6 popoverPresentationController];
    id v8 = [v9 actionButton];
    [v7 setSourceView:v8];
    [v8 bounds];
    objc_msgSend(v7, "setSourceRect:");
  }
  [(CKTranscriptCollectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)keyTransparencyConversationViewControllerDidComplete:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self conversation];
  id v5 = [v4 chat];
  [v5 fetchKTStatus];

  [(CKTranscriptCollectionViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_793];
}

- (BOOL)_allowsEffectAutoPlayback
{
  id v2 = [(CKTranscriptCollectionViewController *)self chat];
  char v3 = [v2 isStewieChat];

  if (v3) {
    return 0;
  }

  return CKReduceMotionAutoplayEnabled();
}

- (BOOL)_pluginChatItem:(id)a3 hasControllerConformingToProtocol:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F6BC18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstance];
  id v9 = [v7 type];

  uint64_t v10 = [v8 balloonPluginForBundleID:v9];
  uint64_t v11 = (void *)[v10 bubbleClass];

  LOBYTE(v10) = [v11 conformsToProtocol:v6];
  return (char)v10;
}

- (void)configureCell:(id)a3 forCKChatItem:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6 animationDuration:(double)a7 animationCurve:(int64_t)a8
{
  BOOL v165 = a6;
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v171 = a5;
  id v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isExpressiveTextEnabled];

  if (v15)
  {
    if (![v171 section])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v12;
        [v16 setTextEffectsDelegate:self];
      }
    }
  }
  [(CKTranscriptCollectionViewController *)self _configureEditMarginInsetsForCell:v12];
  uint64_t v167 = [v171 item];
  uint64_t v17 = [(CKTranscriptCollectionViewController *)self traitCollection];
  [v13 setTranscriptTraitCollection:v17];

  char v18 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v19 = [v18 isDiffableTranscriptDataSourceEnabled];

  if ((v19 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v12, "setMayReparentPluginViews:", -[CKTranscriptCollectionViewController isPerformingRegenerateOrReloadOnlyUpdate](self, "isPerformingRegenerateOrReloadOnlyUpdate") ^ 1);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v170 = v13;
    id v20 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
    id v21 = [v170 extensibleViewControllerForContext:v20];

    if (v21)
    {
      double v22 = [v21 parentViewController];
      if (v22)
      {
      }
      else
      {
        uint64_t v23 = [v21 view];
        double v24 = [v23 window];

        if (v24)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              double v26 = [v21 view];
              double v27 = [v21 view];
              id v28 = [v27 superview];
              uint64_t v29 = [(CKTranscriptCollectionViewController *)self view];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v21;
              __int16 v177 = 2112;
              v178 = v26;
              __int16 v179 = 2112;
              v180 = v28;
              __int16 v181 = 2112;
              v182 = self;
              __int16 v183 = 2112;
              v184 = v29;
              _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Adding detached view controller %@ (view:%@, superview:%@) to transcript collection view controller %@ (view:%@)", buf, 0x34u);
            }
          }
          uint64_t v30 = [v21 view];
          [v30 removeFromSuperview];
        }
      }
      [(CKTranscriptCollectionViewController *)self addChildViewController:v21];
    }
  }
  else
  {
    id v170 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v31 = [v13 isFromMe];
  }
  else {
    int v31 = 0;
  }
  id v32 = +[CKUIBehavior sharedBehaviors];
  if ([v32 shouldShowContactPhotosInTranscript])
  {
    double v33 = [(CKTranscriptCollectionViewController *)self chat];
    BOOL v34 = [v33 chatStyle] != 45;
  }
  else
  {
    BOOL v34 = 0;
  }

  if (objc_opt_respondsToSelector()) {
    [v12 setChatEligibleForContactImage:v34];
  }
  if (v34)
  {
    if (objc_opt_respondsToSelector()) {
      [v12 setWantsContactImageLayout:v31 ^ 1u];
    }
    if (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        if ((v31 & 1) != 0 || ![v13 hasTail])
        {
          id v35 = 0;
          uint64_t v36 = 0;
        }
        else
        {
          id v35 = [v13 contact];

          uint64_t v36 = 1;
        }
        double v37 = [v13 sender];
        CGFloat v38 = [v37 ID];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v39 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
          uint64_t v40 = [v13 balloonControllerForContext:v39];

          if (objc_opt_respondsToSelector()) {
            int v41 = [v40 wantsTranscriptGroupMonograms];
          }
          else {
            int v41 = 0;
          }

          uint64_t v36 = v36 & v41;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v42 = v13;
          uint64_t v43 = v42;
          if (v36)
          {
            uint64_t v44 = [v42 layoutRecipe];
            uint64_t v36 = [v44 isLastItem];
          }
        }
        [v12 setShowAvatarView:v36 withContact:v35 preferredHandle:v38 avatarViewDelegate:self];
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v45 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGRect v46 = [(CKTranscriptCollectionViewController *)self chatItems];
      CGRect v47 = [(CKTranscriptCollectionViewController *)self _previousChatItemOfType:objc_opt_class() beforeIndex:v167 inChatItems:v46];
      id v48 = [(CKTranscriptCollectionViewController *)self _nextChatItemOfType:objc_opt_class() afterIndex:v167 inChatItems:v46];
      double v49 = v48;
      uint64_t v50 = 0;
      if (v47 && v48)
      {
        if (([v48 itemIsReply] & 1) != 0 || objc_msgSend(v49, "itemIsReplyCount"))
        {
          __int16 v51 = [v47 IMChatItem];
          id v52 = [v51 threadGroupIdentifier];

          double v53 = [v49 IMChatItem];
          double v54 = [v53 threadIdentifier];

          uint64_t v50 = [v52 isEqualToString:v54];
        }
        else
        {
          uint64_t v50 = 0;
        }
      }
    }
    else
    {
      CGRect v46 = IMLogHandleForCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController configureCell:forCKChatItem:atIndexPath:animated:animationDuration:animationCurve:]((uint64_t)v13, v46, v55);
      }
      uint64_t v50 = 0;
    }

    [v45 setWantsOffsetForReplyLine:v50];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = v12;
    int v57 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
    BOOL v58 = [v57 currentEffect];
    uint64_t v59 = [v58 effectIsDark];

    [v56 setShouldConfigureForDarkFSM:v59];
    double v60 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
    [v56 configureForChatItem:v13 context:v60 animated:v165 animationDuration:a8 animationCurve:a7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = v12;
    double v62 = [v61 balloonView];
    uint64_t v63 = [(CKTranscriptCollectionViewController *)self traitCollection];
    [v62 updateBalloonForTraitCollection:v63];

    [v61 setBalloonCellDelegate:self];
    [v61 configureAppEntityForMessage:v13];
  }
  if (v170)
  {
    double v64 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
    v65 = [v170 extensibleViewControllerForContext:v64];

    if (v65)
    {
      double v66 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
      double v67 = [v170 extensibleViewForContext:v66];

      if (objc_opt_respondsToSelector()) {
        [v67 configureForDisplay];
      }
      [v65 didMoveToParentViewController:self];
      if (objc_opt_respondsToSelector()) {
        [v65 setDelegate:self];
      }
    }
  }
  [v12 contentAlignmentRect];
  -[CKTranscriptCollectionViewController _balloonHorizontalOffsetForParentChatItem:contentAlignmentRect:responsibleChatItems:individualOffsets:](self, "_balloonHorizontalOffsetForParentChatItem:contentAlignmentRect:responsibleChatItems:individualOffsets:", v13, 0, 0);
  double v69 = v68;
  [(CKTranscriptCollectionViewController *)self marginInsets];
  double v71 = v70;
  double v73 = v72;
  v74 = +[CKUIBehavior sharedBehaviors];
  [v74 minTranscriptMarginInsets];
  double v76 = v75;
  double v78 = v77;

  if ([v13 transcriptOrientation])
  {
    if ([v13 transcriptOrientation] == 2)
    {
      if (v73 >= v78) {
        double v79 = v73;
      }
      else {
        double v79 = v78;
      }
      double v80 = v69 + v79;
      if (v80 <= 0.0) {
        double v69 = v80;
      }
      else {
        double v69 = 0.0;
      }
    }
  }
  else
  {
    if (v71 >= v76) {
      double v81 = v71;
    }
    else {
      double v81 = v76;
    }
    double v69 = fmax(v69 - v81, 0.0);
  }
  [v12 setAssociatedItemOffset:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 setMayReparentPluginViews:1];
  }
  double v82 = [MEMORY[0x1E4F6E6D0] sharedManager];
  int v83 = [v82 isFeatureEnabled];

  if (v83)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v84 = [v12 balloonView];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v85 = v84;
        [v85 setObscurableBalloonDelegate:self];
        CGFloat v86 = [v13 IMChatItem];
        uint64_t v87 = [v86 isReplyContextPreview];

        if ([v13 isCommSafetySensitiveViewable])
        {
          [v85 revealSensitiveContent:v87];
        }
        else if ([v13 isCommSafetySensitiveNotViewable])
        {
          [v85 obscureSensitiveContent:v87];
        }
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v88 = [v13 previousPluginChatItem];
    if (v88)
    {
      double v89 = [(CKTranscriptCollectionViewController *)self snapshotOfPluginBeingReplacedByBreadcrumb];
      [v12 setPreviousPluginSnapshot:v89];
    }
  }
  v169 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v169 marginInsets];
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v98 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
    long long v99 = [v13 balloonControllerForContext:v98];

    LOBYTE(v98) = [v99 wantsTranscriptTimestampDrawer];
    if ((v98 & 1) == 0)
    {
LABEL_103:
      BOOL v100 = 0;
      goto LABEL_106;
    }
  }
  else if (![v13 wantsDrawerLayout])
  {
    goto LABEL_103;
  }
  long long v101 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v101, "transcriptDrawerWidthForMarginInsets:", v91, v93, v95, v97);
  BOOL v100 = v97 <= v102 - v97;

LABEL_106:
  [v12 setWantsDrawerLayout:v100];
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    [v12 setIsRetractionStamp:objc_opt_isKindOfClass() & 1];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v103 = [v12 notifyAnywayButton];
    [v103 addTarget:self action:sel_touchUpInsideNotifyAnywayButton_ forControlEvents:64];
  }
  if (objc_opt_respondsToSelector())
  {
    CGSize v104 = [v12 failureButton];
    [v104 addTarget:self action:sel_touchUpInsideCellFailureButton_ forControlEvents:64];
  }
  if (objc_opt_respondsToSelector())
  {
    v105 = [v12 statusButton];
    [v105 addTarget:self action:sel_touchUpInsideCellStatusButton_ forControlEvents:64];
  }
  if (objc_opt_respondsToSelector())
  {
    v106 = [v12 stampButton];
    [v106 addTarget:self action:sel_touchUpInsideCellStampButton_ forControlEvents:64];
  }
  if (objc_opt_respondsToSelector())
  {
    v107 = [v12 reportSpamButton];
    [v107 addTarget:self action:sel_touchUpInsideCellReportSpamButton_ forControlEvents:64];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v108 = v12;
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v174[0] = MEMORY[0x1E4F143A8];
    v174[1] = 3221225472;
    v174[2] = __122__CKTranscriptCollectionViewController_configureCell_forCKChatItem_atIndexPath_animated_animationDuration_animationCurve___block_invoke;
    v174[3] = &unk_1E5627380;
    objc_copyWeak(&v175, (id *)buf);
    [v108 setConversationFetcher:v174];
    [v108 setDelegate:self];
    objc_destroyWeak(&v175);
    objc_destroyWeak((id *)buf);
  }
  if (objc_opt_respondsToSelector())
  {
    v109 = [v12 blockContactButton];
    [v109 addTarget:self action:sel_touchUpInsideCellBlockContactButton_ forControlEvents:64];
  }
  if (objc_opt_respondsToSelector())
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v172[0] = MEMORY[0x1E4F143A8];
    v172[1] = 3221225472;
    v172[2] = __122__CKTranscriptCollectionViewController_configureCell_forCKChatItem_atIndexPath_animated_animationDuration_animationCurve___block_invoke_2;
    v172[3] = &unk_1E56273A8;
    objc_copyWeak(&v173, (id *)buf);
    [v12 setQuickActionButtonTappedCallback:v172];
    objc_destroyWeak(&v173);
    objc_destroyWeak((id *)buf);
  }
  if ((objc_opt_respondsToSelector() & (v167 != 0)) == 1)
  {
    v110 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v111 = v167 - 1;
    v112 = [v110 objectAtIndex:v167 - 1];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      do
      {
        uint64_t v142 = v111;
        v113 = [v110 objectAtIndex:v111];

        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();
        BOOL v144 = v111-- != 0;
        v112 = v113;
      }
      while ((v144 & ~isKindOfClass & 1) != 0);
      if (!v142) {
        goto LABEL_129;
      }
    }
    else
    {
      v113 = v112;
    }
    [v113 size];
    objc_msgSend(v12, "setPrevBalloonWidth:");
LABEL_129:
  }
  v114 = +[CKUIBehavior sharedBehaviors];
  if (([v114 disableTranscriptTimestamps] & 1) == 0)
  {
    char v115 = objc_opt_respondsToSelector();

    if ((v115 & 1) == 0) {
      goto LABEL_134;
    }
    v114 = [(CKTranscriptCollectionViewController *)self collectionView];
    [v114 marginInsets];
    double v117 = v116;
    double v119 = v118;
    double v121 = v120;
    double v123 = v122;
    [v114 contentOffset];
    double v125 = v124;
    v126 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v126, "transcriptDrawerMaxContentOffsetXForMarginInsets:", v117, v119, v121, v123);
    [v12 setDrawerPercentRevealed:v125 / v127];
  }
LABEL_134:
  if (objc_opt_respondsToSelector())
  {
    v128 = [v12 balloonView];
    if (objc_opt_respondsToSelector())
    {
      v129 = [(CKTranscriptCollectionViewController *)self gradientReferenceView];
      [v128 setGradientReferenceView:v129];
    }
    objc_msgSend(v128, "setCanUseOpaqueMask:", -[CKTranscriptCollectionViewController shouldUseOpaqueMask](self, "shouldUseOpaqueMask"));
    v130 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v131 = [v130 isSwipeToReplyEnabled];

    if (v131
      && !CKIsRunningInMessagesNotificationExtension()
      && !CKIsRunningInMessagesNotificationViewService())
    {
      v132 = [v128 longPressGestureRecognizer];
      v133 = [v169 panGestureRecognizer];
      [v132 requireGestureRecognizerToFail:v133];
    }
    v134 = +[CKAppAudioController sharedInstance];
    v166 = [v134 audioController];

    if ([v128 isAudioMessage])
    {
      id v135 = v128;
      v136 = [v166 currentMediaObject];
      v137 = [v136 transferGUID];
      v138 = [v13 mediaObject];
      v139 = [v138 transferGUID];
      int v140 = [v137 isEqualToString:v139];

      if (v140)
      {
        [v166 currentMediaObjectTime];
        objc_msgSend(v135, "setTime:");
        uint64_t v141 = [v166 isPlaying];
      }
      else
      {
        [v135 setTime:0.0];
        uint64_t v141 = 0;
      }
      [v135 setPlaying:v141];
      [(CKTranscriptCollectionViewController *)self configureSpeakerButtonCell:v12 forItemAtIndexPath:v171];
    }
    [v128 setDelegate:self];
    [v128 prepareForDisplayIfNeeded];
    [v169 bounds];
    objc_msgSend(v169, "convertRect:toView:", v128);
    objc_msgSend(v128, "cullSubviewsWithVisibleBounds:");
    v145 = +[CKPrintController sharedInstance];
    char v146 = [v145 isPrinting];

    if ((v146 & 1) == 0)
    {
      v147 = [(CKTranscriptCollectionViewController *)self delegate];
      [v147 transcriptCollectionViewController:self targetAlphaForChatItem:v13];
      double v149 = v148;

      if (v149 != -1.0) {
        [v128 setAlpha:v149];
      }
    }
    BOOL v150 = +[CKApplicationState isResizing];
    v151 = [v128 dragInteraction];

    if (v151) {
      char v152 = 1;
    }
    else {
      char v152 = v150;
    }
    if ((v152 & 1) == 0)
    {
      id v153 = objc_alloc(MEMORY[0x1E4F42998]);
      v154 = [(CKTranscriptCollectionViewController *)self dragInteractionDelegate];
      v155 = (void *)[v153 initWithDelegate:v154];

      [v128 setDragInteraction:v155];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v12 startAnimatingActivityIndicator];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v12, "setAnimationPauseReasons:", -[CKTranscriptCollectionViewController contentAnimationPauseReasons](self, "contentAnimationPauseReasons"));
  }
  v156 = [(CKTranscriptCollectionViewController *)self hiddenItems];
  int v157 = objc_msgSend(v156, "containsIndex:", objc_msgSend(v171, "item"));

  if (v157) {
    double v158 = 0.0;
  }
  else {
    double v158 = 1.0;
  }
  v159 = [v12 contentView];
  [v159 setAlpha:v158];

  [(CKTranscriptCollectionViewController *)self _hideBalloonViewIfNecessaryForCell:v12 indexPath:v171];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(CKTranscriptCollectionViewController *)self transitioningFromComposing])
  {
    v160 = [v13 IMChatItem];
    v161 = [v160 guid];

    v162 = [(CKTranscriptCollectionViewController *)self pluginSnapshots];
    v163 = [v162 objectForKeyedSubscript:v161];
  }
  else
  {
    v163 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    v164 = [v12 balloonView];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v164 setPluginSnapshotView:v163];
    }
  }
}

id __122__CKTranscriptCollectionViewController_configureCell_forCKChatItem_atIndexPath_animated_animationDuration_animationCurve___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained conversation];

  return v2;
}

void __122__CKTranscriptCollectionViewController_configureCell_forCKChatItem_atIndexPath_animated_animationDuration_animationCurve___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained quickActionButtonWasTapped:v3];
}

- (id)_nextChatItemOfType:(Class)a3 afterIndex:(int64_t)a4 inChatItems:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 count];
  int64_t v8 = a4 + 1;
  if (v8 >= v7)
  {
    id v11 = 0;
  }
  else
  {
    int64_t v9 = v7;
    do
    {
      uint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
      }
      else
      {
        id v11 = 0;
        ++v8;
      }
    }
    while (!v11 && v8 < v9);
  }

  return v11;
}

- (id)_previousChatItemOfType:(Class)a3 beforeIndex:(int64_t)a4 inChatItems:(id)a5
{
  int64_t v5 = a4 - 1;
  if (a4 < 1)
  {
    id v8 = 0;
  }
  else
  {
    do
    {
      uint64_t v7 = [a5 objectAtIndexedSubscript:v5];
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
      }
      else
      {
        id v8 = 0;
        --v5;
      }
    }
    while (!v8 && (v5 & 0x8000000000000000) == 0);
  }

  return v8;
}

- (void)_hideBalloonViewIfNecessaryForCell:(id)a3 indexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self hiddenBalloonViews];
  if ([v7 count])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
    int64_t v9 = [(CKTranscriptCollectionViewController *)self hiddenBalloonViews];
    uint64_t v10 = objc_msgSend(v9, "containsIndex:", objc_msgSend(v6, "item"));

    uint64_t v7 = [v11 balloonView];
    [v7 setHidden:v10];
  }

LABEL_5:
}

- (void)_configureEditMarginInsetsForCell:(id)a3
{
  id v22 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int64_t v5 = v22;
  if (isKindOfClass)
  {
    id v6 = v22;
    uint64_t v7 = [(CKTranscriptCollectionViewController *)self collectionView];
    objc_msgSend(v6, "_ck_setEditing:", objc_msgSend(v7, "_ck_isEditing"));

    id v8 = +[CKUIBehavior sharedBehaviors];
    if ([v8 forceMinTranscriptMarginInsets])
    {
      int64_t v9 = +[CKUIBehavior sharedBehaviors];
      [v9 minTranscriptMarginInsets];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self marginInsets];
      double v11 = v18;
      double v13 = v19;
      double v15 = v20;
      double v17 = v21;
    }

    objc_msgSend(v6, "setMarginInsets:", v11, v13, v15, v17);
    int64_t v5 = v22;
  }
}

- (void)configureAssociatedCell:(id)a3 forChatItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(CKTranscriptCollectionViewController *)self _configureEditMarginInsetsForCell:v8];
  double v11 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  double v12 = [v11 layoutAttributesForItemAtIndexPath:v10];

  double v13 = [(CKTranscriptCollectionViewController *)self chatItems];
  double v14 = [v9 associatedChatItemGUID];
  uint64_t v15 = [v9 associatedMessageRange];
  uint64_t v17 = objc_msgSend(v13, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v14, v15, v16);

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v18 = [(CKTranscriptCollectionViewController *)self chatItems];
    double v19 = [v18 objectAtIndex:v17];

    [v8 contentAlignmentRect];
    id v83 = 0;
    id v84 = 0;
    -[CKTranscriptCollectionViewController _balloonHorizontalOffsetForParentChatItem:contentAlignmentRect:responsibleChatItems:individualOffsets:](self, "_balloonHorizontalOffsetForParentChatItem:contentAlignmentRect:responsibleChatItems:individualOffsets:", v19, &v84, &v83);
    double v21 = v20;
    id v22 = v84;
    id v23 = v83;
    if (v21 != 0.0)
    {
      [(CKTranscriptCollectionViewController *)self marginInsets];
      double v25 = v24;
      double v27 = v26;
      id v28 = +[CKUIBehavior sharedBehaviors];
      [v28 minTranscriptMarginInsets];
      double v30 = v29;
      double v32 = v31;

      if (v25 >= v30) {
        double v30 = v25;
      }
      if (v27 < v32) {
        double v27 = v32;
      }
      if ([v19 transcriptOrientation])
      {
        if ([v19 transcriptOrientation] == 2)
        {
          if (v21 + v27 <= 0.0) {
            double v21 = v21 + v27;
          }
          else {
            double v21 = 0.0;
          }
        }
      }
      else
      {
        double v21 = fmax(v21 - v30, 0.0);
      }
      if ([v22 containsObject:v9])
      {
        double v33 = objc_msgSend(v23, "objectAtIndex:", objc_msgSend(v22, "indexOfObject:", v9));
        [v33 doubleValue];
        double v35 = v34;

        if ([v19 transcriptOrientation])
        {
          if ([v19 transcriptOrientation] == 2)
          {
            if (v27 + v35 <= 0.0) {
              double v35 = v27 + v35;
            }
            else {
              double v35 = 0.0;
            }
          }
        }
        else
        {
          double v35 = fmax(v35 - v30, 0.0);
        }
        double v21 = v21 + v21 - v35;
      }
      [v8 setCumulativeAssociatedOffset:v21];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v8, "setParentIsFromMe:", objc_msgSend(v19, "isFromMe"));
    }
    [v19 stickerReactionInsets];
    objc_msgSend(v8, "setStickerReactionInsetsForParent:");
  }
  [v12 parentChatItemSize];
  objc_msgSend(v8, "setParentSize:");
  [v12 parentRotationOffset];
  objc_msgSend(v8, "setParentRotationOffset:");
  uint64_t v36 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
  [v8 configureForChatItem:v9 context:v36 animated:0 animationDuration:3 animationCurve:0.0];

  [v8 setDelegate:self];
  double v37 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v37 marginInsets];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  BOOL v46 = 0;
  if ([v9 wantsDrawerLayout])
  {
    CGRect v47 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v47, "transcriptDrawerWidthForMarginInsets:", v39, v41, v43, v45);
    BOOL v46 = v45 <= v48 - v45;
  }
  [v8 setWantsDrawerLayout:v46];
  double v49 = +[CKUIBehavior sharedBehaviors];
  if ([v49 shouldShowContactPhotosInTranscript])
  {
    uint64_t v50 = [(CKTranscriptCollectionViewController *)self chat];
    if ([v50 chatStyle] == 45) {
      uint64_t v51 = 0;
    }
    else {
      uint64_t v51 = [v9 parentMessageIsFromMe] ^ 1;
    }
  }
  else
  {
    uint64_t v51 = 0;
  }

  if (objc_opt_respondsToSelector()) {
    [v8 setWantsContactImageLayout:v51];
  }
  id v52 = [(CKTranscriptCollectionViewController *)self delegate];
  [v52 transcriptCollectionViewController:self targetAlphaForChatItem:v9];
  double v54 = v53;

  if (v54 != -1.0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v55 = [v8 balloonView];
      if (objc_opt_respondsToSelector())
      {
        id v56 = [(CKTranscriptCollectionViewController *)self gradientReferenceView];
        [v55 setGradientReferenceView:v56];
      }
      objc_msgSend(v55, "setCanUseOpaqueMask:", -[CKTranscriptCollectionViewController _canUseOpaqueMask](self, "_canUseOpaqueMask"));
      [v55 setDelegate:self];
      [v55 prepareForDisplayIfNeeded];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_43;
      }
      uint64_t v55 = [v8 imageView];
    }
    [v55 setAlpha:v54];
  }
LABEL_43:
  int v57 = +[CKUIBehavior sharedBehaviors];
  if (([v57 disableTranscriptTimestamps] & 1) == 0)
  {
    char v58 = objc_opt_respondsToSelector();

    if ((v58 & 1) == 0) {
      goto LABEL_47;
    }
    int v57 = [(CKTranscriptCollectionViewController *)self collectionView];
    [v57 marginInsets];
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
    [v57 contentOffset];
    double v68 = v67;
    double v69 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v69, "transcriptDrawerMaxContentOffsetXForMarginInsets:", v60, v62, v64, v66);
    [v8 setDrawerPercentRevealed:v68 / v70];
  }
LABEL_47:
  if (objc_opt_respondsToSelector())
  {
    double v71 = [v8 failureButton];
    [v71 addTarget:self action:sel_touchUpInsideCellFailureButton_ forControlEvents:64];
  }
  [(CKTranscriptCollectionViewController *)self setHiddenAssociatedItemsForMessageEditing:self->_hiddenAssociatedItemsForMessageEditing];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v72 = v8;
    double v73 = [v9 guid];
    v74 = [(CKTranscriptCollectionViewController *)self stickerGUIDsHiddenDuringStickerAddAnimation];
    int v75 = [v74 containsObject:v73];

    if (v75)
    {
      double v76 = [v72 associatedItemView];
      [v76 setHidden:1];
    }
    id v77 = objc_alloc(MEMORY[0x1E4F42998]);
    double v78 = [(CKTranscriptCollectionViewController *)self dragInteractionDelegate];
    double v79 = (void *)[v77 initWithDelegate:v78];

    double v80 = [v72 associatedItemView];
    [v80 setInteractions:MEMORY[0x1E4F1CBF0]];

    double v81 = [v72 associatedItemView];
    [v81 addInteraction:v79];

    double v82 = [v72 associatedItemView];
    [v82 setUserInteractionEnabled:1];
  }
}

- (double)_balloonHorizontalOffsetForParentChatItem:(id)a3 contentAlignmentRect:(CGRect)a4 responsibleChatItems:(id *)a5 individualOffsets:(id *)a6
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v49 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = [v7 visibleAssociatedMessageChatItems];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v53 = 0;
    uint64_t v12 = *(void *)v61;
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = 0.0;
    do
    {
      uint64_t v16 = 0;
      uint64_t v48 = v11;
      do
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v60 + 1) + 8 * v16);
        uint64_t v59 = 0;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v56 = 0u;
        if (v17) {
          [v17 geometryDescriptor];
        }
        int v18 = [v7 transcriptOrientation];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 isReaction])
        {
          [v7 size];
          double v20 = v19;
          double v22 = v21;
          [v7 stickerReactionInsets];
          +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v53, v18 == 2, v13, v14, v20, v22, v23, v24, v25, v26);
          double v28 = v27;
          if (v18 == 2)
          {
            if (v27 > v20)
            {
              double v29 = v27 - v20;
              [v49 addObject:v17];
              double v30 = [NSNumber numberWithDouble:v29];
              [v8 addObject:v30];

              if (v29 >= v15) {
                double v15 = v29;
              }
            }
          }
          else if (!v18 && v27 < 0.0)
          {
            [v49 addObject:v17];
            double v31 = [NSNumber numberWithDouble:v28];
            [v8 addObject:v31];

            if (v28 < v15) {
              double v15 = v28;
            }
          }
          ++v53;
          uint64_t v11 = v48;
        }
        if ((unint64_t)(v56 - 12) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          [v17 size];
          double v33 = v32;
          double v35 = v34;
          [v7 size];
          double v37 = v36;
          double v39 = v38;
          uint64_t v40 = [v17 transcriptOrientation];
          v54[0] = v56;
          v54[1] = v57;
          v54[2] = v58;
          uint64_t v55 = v59;
          +[CKAssociatedStickerChatItem computeHorizontalStickerFrameOffset:parentSize:forPositioningWithinContentAlignmentRect:geometryDescriptor:forTranscriptOrientation:](CKAssociatedStickerChatItem, "computeHorizontalStickerFrameOffset:parentSize:forPositioningWithinContentAlignmentRect:geometryDescriptor:forTranscriptOrientation:", v54, v40, v13, v14, v33, v35, v37, v39, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
          double v42 = v41;
          if (v18 == 2)
          {
            if (v41 < 0.0)
            {
              [v49 addObject:v17];
              double v44 = [NSNumber numberWithDouble:v42];
              [v8 addObject:v44];
            }
            if (v42 < v15) {
              double v15 = v42;
            }
          }
          else if (!(_BYTE)v18)
          {
            if (v41 > 0.0)
            {
              [v49 addObject:v17];
              double v43 = [NSNumber numberWithDouble:v42];
              [v8 addObject:v43];
            }
            if (v42 >= v15) {
              double v15 = v42;
            }
          }
        }
        ++v16;
      }
      while (v11 != v16);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v11);
  }
  else
  {
    double v15 = 0.0;
  }

  if (a5) {
    *a5 = (id)[v49 copy];
  }
  if (a6) {
    *a6 = (id)[v8 copy];
  }

  return v15;
}

- (void)_indicesOfReplyChatItemsToInsertWithoutFading:(id)a3 inserted:(id)a4 outInsertIndices:(id *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__CKTranscriptCollectionViewController__indicesOfReplyChatItemsToInsertWithoutFading_inserted_outInsertIndices___block_invoke;
  v11[3] = &unk_1E56273D0;
  id v10 = v9;
  id v12 = v10;
  [v7 enumerateObjectsAtIndexes:v8 options:0 usingBlock:v11];

  if (a5) {
    *a5 = (id)[v10 copy];
  }
}

void __112__CKTranscriptCollectionViewController__indicesOfReplyChatItemsToInsertWithoutFading_inserted_outInsertIndices___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([v5 itemIsReply] & 1) != 0 || objc_msgSend(v5, "itemIsReplyContextPreview")) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (void)_indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading:(id)a3 inserted:(id)a4 removed:(id)a5 outInsertIndices:(id *)a6 outRemoveIndices:(id *)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v48 = a4;
  id v12 = a5;
  double v44 = a7;
  BOOL v46 = a6;
  if ((unint64_t)a6 | (unint64_t)a7)
  {
    id v47 = v12;
    double v54 = [MEMORY[0x1E4F1CA48] array];
    id v52 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    double v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke;
    v69[3] = &unk_1E56273D0;
    id v15 = v13;
    id v70 = v15;
    [v49 enumerateObjectsAtIndexes:v48 options:0 usingBlock:v69];

    uint64_t v16 = [(CKTranscriptCollectionViewController *)self chatItems];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke_852;
    v67[3] = &unk_1E56255D8;
    id v50 = v14;
    id v68 = v50;
    [v16 enumerateObjectsAtIndexes:v47 options:0 usingBlock:v67];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obuint64_t j = v15;
    uint64_t v17 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v64;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v64 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          double v21 = objc_msgSend(v50, "objectForKey:", v20, v44);
          if (!v21)
          {

            goto LABEL_37;
          }
          double v22 = [obj objectForKey:v20];
          unint64_t v23 = [v22 count];
          unint64_t v24 = [v21 count];
          if (v23 >= v24) {
            unint64_t v23 = v24;
          }
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x2020000000;
          uint64_t v73 = 0;
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke_853;
          v59[3] = &unk_1E56273F8;
          id v60 = v54;
          long long v61 = buf;
          unint64_t v62 = v23;
          [v22 enumerateIndexesWithOptions:2 usingBlock:v59];
          *(void *)(*(void *)&buf[8] + 24) = 0;
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke_2;
          v55[3] = &unk_1E56273F8;
          id v56 = v52;
          long long v57 = buf;
          unint64_t v58 = v23;
          [v21 enumerateIndexesWithOptions:2 usingBlock:v55];

          _Block_object_dispose(buf, 8);
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if ([v52 count] && IMOSLoggingEnabled())
    {
      double v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        double v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v52;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "The indices to remove unconsumed breadcrumbs are (count: %@): %@", buf, 0x16u);
      }
    }
    if (objc_msgSend(v54, "count", v44) && IMOSLoggingEnabled())
    {
      double v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        double v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v54;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "The indices to insert unconsumed breadcrumbs are (count: %@): %@", buf, 0x16u);
      }
    }
    obuint64_t j = [MEMORY[0x1E4F28E60] indexSet];
    id v50 = [MEMORY[0x1E4F28E60] indexSet];
    if ([v54 count])
    {
      unint64_t v29 = 0;
      do
      {
        double v30 = [v54 objectAtIndexedSubscript:v29];
        unint64_t v31 = [v30 unsignedIntegerValue];

        double v32 = [v52 objectAtIndexedSubscript:v29];
        uint64_t v33 = [v32 unsignedIntegerValue];

        double v34 = [v49 objectAtIndexedSubscript:v31];
        double v35 = [(CKTranscriptCollectionViewController *)self chatItems];
        double v36 = [v35 objectAtIndexedSubscript:v33];
        double v37 = [v36 IMChatItem];

        LODWORD(v35) = [v34 isFromMe];
        if (v35 == [v37 isFromMe])
        {
          unint64_t v38 = v33 + 1;
          while (v38 <= v31)
          {
            double v39 = [(CKTranscriptCollectionViewController *)self chatItems];
            BOOL v40 = v38 < [v39 count];

            if (!v40) {
              break;
            }
            double v41 = [(CKTranscriptCollectionViewController *)self chatItems];
            double v42 = [v41 objectAtIndex:v38];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            ++v38;
            if (isKindOfClass) {
              goto LABEL_31;
            }
          }
          [obj addIndex:v31];
          [v50 addIndex:v33];
        }
LABEL_31:

        ++v29;
      }
      while (v29 < [v54 count]);
    }
    if (v46) {
      *BOOL v46 = obj;
    }
    if (v45)
    {
      id v51 = v50;
      *double v45 = v51;
    }
    else
    {
LABEL_37:
    }
    id v12 = v47;
  }
}

void __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v10;
  if (isKindOfClass)
  {
    id v7 = [v10 dataSource];
    id v8 = [v7 sessionGUID];

    id v9 = [*(id *)(a1 + 32) objectForKey:v8];
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F28E60] indexSet];
    }
    [v9 addIndex:a3];
    [*(id *)(a1 + 32) setObject:v9 forKey:v8];

    id v6 = v10;
  }
}

void __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke_852(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = [v12 IMChatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = v12;
  if (isKindOfClass)
  {
    id v8 = [v12 IMChatItem];
    id v9 = [v8 dataSource];
    id v10 = [v9 sessionGUID];

    uint64_t v11 = [*(id *)(a1 + 32) objectForKey:v10];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F28E60] indexSet];
    }
    [v11 addIndex:a3];
    [*(id *)(a1 + 32) setObject:v11 forKey:v10];

    id v7 = v12;
  }
}

void __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke_853(void *a1, uint64_t a2, unsigned char *a3)
{
  id v5 = (void *)a1[4];
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  [v5 addObject:v6];

  if (++*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6]) {
    *a3 = 1;
  }
}

void __156__CKTranscriptCollectionViewController__indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading_inserted_removed_outInsertIndices_outRemoveIndices___block_invoke_2(void *a1, uint64_t a2, unsigned char *a3)
{
  id v5 = (void *)a1[4];
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  [v5 addObject:v6];

  if (++*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6]) {
    *a3 = 1;
  }
}

- (unint64_t)_indexOfBreadcrumbReplacingTranscriptPluginInChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 outIndexOfReplacedPlugin:(unint64_t *)a6 outIndexOfNewPlugin:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a6) {
    *a6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a7) {
    *a7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__34;
  v46[4] = __Block_byref_object_dispose__34;
  id v47 = 0;
  id v15 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v16 = [v15 count];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __157__CKTranscriptCollectionViewController__indexOfBreadcrumbReplacingTranscriptPluginInChatItems_inserted_removed_outIndexOfReplacedPlugin_outIndexOfNewPlugin___block_invoke;
  v41[3] = &unk_1E5627420;
  uint64_t v45 = v16;
  id v17 = v15;
  id v42 = v17;
  double v43 = &v48;
  double v44 = v46;
  [v14 enumerateIndexesWithOptions:2 usingBlock:v41];
  uint64_t v18 = v49[3];
  unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v37 = 0;
    unint64_t v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = v18;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __157__CKTranscriptCollectionViewController__indexOfBreadcrumbReplacingTranscriptPluginInChatItems_inserted_removed_outIndexOfReplacedPlugin_outIndexOfNewPlugin___block_invoke_2;
    v31[3] = &unk_1E5627448;
    uint64_t v33 = v36;
    id v20 = v12;
    id v32 = v20;
    double v34 = v46;
    double v35 = &v37;
    [v13 enumerateIndexesUsingBlock:v31];
    if (v38[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v27 = 0;
      double v28 = &v27;
      uint64_t v29 = 0x2020000000;
      uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __157__CKTranscriptCollectionViewController__indexOfBreadcrumbReplacingTranscriptPluginInChatItems_inserted_removed_outIndexOfReplacedPlugin_outIndexOfNewPlugin___block_invoke_3;
      v22[3] = &unk_1E5627448;
      unint64_t v24 = &v37;
      id v23 = v20;
      double v25 = v46;
      double v26 = &v27;
      [v13 enumerateIndexesWithOptions:2 usingBlock:v22];
      if (a6) {
        *a6 = v49[3];
      }
      if (a7) {
        *a7 = v28[3];
      }
      unint64_t v19 = v38[3];

      _Block_object_dispose(&v27, 8);
    }

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&v37, 8);
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

  return v19;
}

void __157__CKTranscriptCollectionViewController__indexOfBreadcrumbReplacingTranscriptPluginInChatItems_inserted_removed_outIndexOfReplacedPlugin_outIndexOfNewPlugin___block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if (*(void *)(a1 + 56) > a2)
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndex:a2];
    id v11 = [v6 IMChatItem];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
      id v7 = [v11 dataSource];
      uint64_t v8 = [v7 sessionGUID];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      *a3 = 1;
    }
  }
}

void __157__CKTranscriptCollectionViewController__indexOfBreadcrumbReplacingTranscriptPluginInChatItems_inserted_removed_outIndexOfReplacedPlugin_outIndexOfNewPlugin___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2)
  {
    id v9 = [*(id *)(a1 + 32) objectAtIndex:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v9 dataSource];
      id v7 = [v6 sessionGUID];
      int v8 = [v7 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      if (v8)
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
        *a3 = 1;
      }
    }
  }
}

void __157__CKTranscriptCollectionViewController__indexOfBreadcrumbReplacingTranscriptPluginInChatItems_inserted_removed_outIndexOfReplacedPlugin_outIndexOfNewPlugin___block_invoke_3(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= a2)
  {
    *a3 = 1;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) objectAtIndex:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v9 dataSource];
      id v7 = [v6 sessionGUID];
      int v8 = [v7 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      if (v8)
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
        *a3 = 1;
      }
    }
  }
}

- (void)_updatePluginPlaybackManagerForInsertedChatItems:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] && !self->_notifications)
  {
    double v35 = [(CKTranscriptCollectionViewController *)self pluginPlaybackManager];
    if (v35)
    {
      uint64_t v33 = v4;
      id v5 = [MEMORY[0x1E4F1CA80] set];
      id v6 = [(CKTranscriptCollectionViewController *)self collectionView];
      id v7 = [v6 indexPathsForVisibleItems];

      int v8 = [(CKTranscriptCollectionViewController *)self chatItems];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v51 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v41 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (![v14 section])
            {
              unint64_t v15 = [v14 item];
              if (v15 >= [v8 count])
              {
                uint64_t v16 = IMLogHandleForCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v19 = [v8 count];
                  *(_DWORD *)buf = 136315650;
                  BOOL v46 = "-[CKTranscriptCollectionViewController _updatePluginPlaybackManagerForInsertedChatItems:]";
                  __int16 v47 = 2112;
                  uint64_t v48 = v14;
                  __int16 v49 = 2048;
                  uint64_t v50 = v19;
                  _os_log_error_impl(&dword_18EF18000, v16, OS_LOG_TYPE_ERROR, "%s visible IndexPath: %@, out of chatItem bounds: %lu", buf, 0x20u);
                }
              }
              else
              {
                uint64_t v16 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v14, "item"));
                id v17 = [v16 IMChatItem];
                uint64_t v18 = [v17 guid];

                if (v18) {
                  [v5 addObject:v18];
                }
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v51 count:16];
        }
        while (v11);
      }
      id v32 = v8;

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v20 = v33;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        char v34 = 0;
        uint64_t v23 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v37 != v23) {
              objc_enumerationMutation(v20);
            }
            double v25 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v26 = [v25 IMChatItem];
              uint64_t v27 = [v26 guid];
              int v28 = [v5 containsObject:v27];

              if (v28)
              {
                id v29 = v25;
                uint64_t v30 = [v29 IMChatItem];
                int v31 = [v30 wantsAutoPlayback];

                if (v31)
                {
                  [v35 addPluginItem:v29];
                  char v34 = 1;
                }
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v22);
      }
      else
      {
        char v34 = 0;
      }

      if ([v35 isPlayingBack] & 1) == 0 && (v34) {
        [v35 startPlayback];
      }

      id v4 = v33;
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self pluginPlaybackDelay];
      -[CKTranscriptCollectionViewController startPluginPlaybackAfterDelay:](self, "startPluginPlaybackAfterDelay:");
    }
  }
}

- (void)reloadChatItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
}

- (void)reloadChatItemsAtIndexes:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v13 = [(CKTranscriptCollectionViewController *)self imChatItems];
  uint64_t v10 = [MEMORY[0x1E4F28D60] indexSet];
  uint64_t v11 = [MEMORY[0x1E4F28D60] indexSet];
  uint64_t v12 = [MEMORY[0x1E4F28D60] indexSet];
  [(CKTranscriptCollectionViewController *)self updateTranscriptChatItems:v13 inserted:v10 removed:v11 reload:v9 regenerate:v12 animated:v5 completion:v8];
}

- (void)updateTranscriptChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 reload:(id)a6 regenerate:(id)a7 animated:(BOOL)a8 checkFiltered:(BOOL)a9 completion:(id)a10
{
  BOOL v33 = a8;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = self;
  id v21 = a10;
  if (a9)
  {
    id v32 = v15;
    uint64_t v22 = [(CKTranscriptCollectionViewController *)v20 chat];
    if ([v22 isFiltered])
    {
      uint64_t v23 = [(CKTranscriptCollectionViewController *)v20 chat];
      char v24 = [v23 isSMS];

      id v15 = v32;
      if ((v24 & 1) == 0)
      {
        int v31 = v20;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v25 = v32;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v35 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v30 setShouldDisplayRichLink:0];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v27);
        }

        id v15 = v32;
        id v20 = v31;
      }
    }
    else
    {

      id v15 = v32;
    }
  }
  [(CKTranscriptCollectionViewController *)v20 updateTranscriptChatItems:v15 inserted:v16 removed:v17 reload:v18 regenerate:v19 animated:v33 completion:v21];
}

- (void)updateTranscriptChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 reload:(id)a6 regenerate:(id)a7 animated:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v20 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  [(CKTranscriptCollectionViewController *)self _updateTranscriptChatItems:v20 inserted:v15 removed:v16 reload:v17 regenerate:v18 animated:v9 completion:v19];
}

- (void)_updateTranscriptChatItems:(id)a3 inserted:(id)a4 removed:(id)a5 reload:(id)a6 regenerate:(id)a7 animated:(BOOL)a8 completion:(id)a9
{
  BOOL v69 = a8;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v14 = (__CFString *)a4;
  uint64_t v74 = (__CFString *)a5;
  double v76 = (__CFString *)a6;
  uint64_t v73 = (__CFString *)a7;
  id v72 = a9;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [(CKTranscriptCollectionViewController *)self chat];
      id v17 = (void *)v16;
      id v18 = @"NO";
      if (v69) {
        id v18 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      double v95 = v18;
      __int16 v96 = 2112;
      uint64_t v97 = v16;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Beginning to update transcript chatItems (animated: %@) for chat: %@", buf, 0x16u);
    }
  }
  BOOL v19 = [(CKTranscriptCollectionViewController *)self isInline];
  int v20 = IMOSLoggingEnabled();
  if (v19)
  {
    if (!v20) {
      goto LABEL_16;
    }
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v70 = [(CKTranscriptCollectionViewController *)self chat];
      uint64_t v22 = [v70 inlineReplyController];
      uint64_t v23 = NSNumber;
      char v24 = [(CKTranscriptCollectionViewController *)self imChatItems];
      id v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v75, "count"));
      uint64_t v27 = NSNumber;
      uint64_t v28 = [(CKTranscriptCollectionViewController *)self chatItems];
      id v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
      *(_DWORD *)buf = 138413058;
      double v95 = v22;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v25;
      __int16 v98 = 2112;
      long long v99 = v26;
      __int16 v100 = 2112;
      long long v101 = v29;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "\tTranscript Type: Inline, inlineReplyController: %@, self.imChatItems<IMChatItem *>.count:%@, imChatItems<IMChatItem *>.count:%@, self.chatItems<CKChatItem *>.count:%@", buf, 0x2Au);
    }
  }
  else
  {
    if (!v20) {
      goto LABEL_16;
    }
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = NSNumber;
      int v31 = [(CKTranscriptCollectionViewController *)self imChatItems];
      objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
      id v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v75, "count"));
      long long v34 = NSNumber;
      long long v35 = [(CKTranscriptCollectionViewController *)self chatItems];
      long long v36 = objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      *(_DWORD *)buf = 138412802;
      double v95 = v32;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v33;
      __int16 v98 = 2112;
      long long v99 = v36;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "\tTranscript Type: Standard, self.imChatItems<IMChatItem *>.count:%@, imChatItems<IMChatItem *>.count:%@, self.chatItems<CKChatItem *>.count:%@", buf, 0x20u);
    }
  }

LABEL_16:
  long long v37 = [MEMORY[0x1E4F1CA48] array];
  if ([(__CFString *)v14 count])
  {
    if (IMOSLoggingEnabled())
    {
      long long v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v95 = v14;
        _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "\tinserted: %@", buf, 0xCu);
      }
    }
    [v37 addObject:v14];
  }
  if ([(__CFString *)v74 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v95 = v74;
        _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "\tremoved: %@", buf, 0xCu);
      }
    }
    [v37 addObject:v74];
  }
  if ([(__CFString *)v76 count])
  {
    if (IMOSLoggingEnabled())
    {
      long long v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v95 = v76;
        _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, "\treload: %@", buf, 0xCu);
      }
    }
    [v37 addObject:v76];
  }
  if ([(__CFString *)v73 count])
  {
    if (IMOSLoggingEnabled())
    {
      long long v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v95 = v73;
        _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "\tregenerate: %@", buf, 0xCu);
      }
    }
    [v37 addObject:v73];
  }
  double v71 = [(CKTranscriptCollectionViewController *)self _itemGUIDsForItems:v76 inIMChatItem:v75];
  long long v42 = [(CKTranscriptCollectionViewController *)self imChatItems];
  uint64_t v43 = [v42 count];
  LOBYTE(v43) = v43 == [v75 count];

  if ((v43 & 1) == 0)
  {
    double v44 = IMLogHandleForCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController _updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:]();
    }
  }
  itemIndexPathToHighlight = self->_itemIndexPathToHighlight;
  self->_itemIndexPathToHighlight = 0;

  if ([(CKTranscriptCollectionViewController *)self sizedFullTranscript])
  {
    BOOL v46 = [(CKTranscriptCollectionViewController *)self view];
    __int16 v47 = [v46 window];
    uint64_t v48 = [v47 windowScene];
    if ([v48 activationState])
    {
      BOOL v49 = CKIsRunningUnitTests() != 0;

      LOBYTE(v69) = v49 && v69;
    }
    else
    {
    }
    uint64_t v52 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v53 = (void *)[v52 mutableCopy];

    double v54 = (void *)[v53 copy];
    if ([(__CFString *)v14 count] || [(__CFString *)v74 count])
    {
      BOOL v55 = 0;
    }
    else if ([(__CFString *)v76 count])
    {
      BOOL v55 = 1;
    }
    else
    {
      BOOL v55 = [(__CFString *)v73 count] != 0;
    }
    [(CKTranscriptCollectionViewController *)self setIsPerformingRegenerateOrReloadOnlyUpdate:v55];
    if (![(CKTranscriptCollectionViewController *)self isPerformingRegenerateOrReloadOnlyUpdate])
    {
      id v56 = [(CKTranscriptCollectionViewController *)self _logChatItems:v53 withUpdates:v37];
      if (IMOSLoggingEnabled())
      {
        long long v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v53, "count"));
          unint64_t v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          double v95 = v58;
          __int16 v96 = 2112;
          uint64_t v97 = (uint64_t)v56;
          _os_log_impl(&dword_18EF18000, v57, OS_LOG_TYPE_INFO, "↱ %@ chatItems before update:\n %@", buf, 0x16u);
        }
      }
    }
    uint64_t v59 = [(CKTranscriptCollectionViewController *)self _sanitizeInsertedIndices:v14 inChatItems:v53 withIMChatItems:v75];

    id v60 = IMLogHandleForCategory();
    os_signpost_id_t v61 = os_signpost_id_generate(v60);
    unint64_t v62 = v60;
    long long v63 = v62;
    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18EF18000, v63, OS_SIGNPOST_INTERVAL_BEGIN, v61, "handlePluginBreadcrumbingInChatItems_all", "", buf, 2u);
    }

    double v92 = v74;
    id v93 = v59;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __122__CKTranscriptCollectionViewController__updateTranscriptChatItems_inserted_removed_reload_regenerate_animated_completion___block_invoke;
    v77[3] = &unk_1E5627470;
    os_signpost_id_t v90 = v61;
    double v78 = v63;
    double v79 = self;
    id v80 = v53;
    double v81 = v74;
    id v82 = v75;
    id v83 = v59;
    id v84 = v73;
    BOOL v91 = v69;
    id v85 = v71;
    id v89 = v72;
    id v86 = v54;
    uint64_t v87 = v76;
    id v88 = v37;
    id v64 = v54;
    id v65 = v59;
    long long v66 = v74;
    id v67 = v53;
    id v68 = v63;
    [(CKTranscriptCollectionViewController *)self _handlePluginBreadcrumbingInChatItems:v67 withIMChatItems:v82 inserted:&v93 removed:&v92 completion:v77];
    id v14 = (__CFString *)v93;

    uint64_t v74 = v92;
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      uint64_t v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412290;
      double v95 = v51;
      _os_log_impl(&dword_18EF18000, v50, OS_LOG_TYPE_INFO, "Chat items changed before full transcript was sized\n %@", buf, 0xCu);
    }
  }
}

void __122__CKTranscriptCollectionViewController__updateTranscriptChatItems_inserted_removed_reload_regenerate_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  BOOL v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 128);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "handlePluginBreadcrumbingInChatItems_completionHandler", "", buf, 2u);
  }

  [*(id *)(a1 + 40) _removeChatItemsFrom:*(void *)(a1 + 48) removed:*(void *)(a1 + 56)];
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 72);
  id v50 = 0;
  id v51 = v3;
  uint64_t v11 = [v7 _insertChatItemsInto:v9 withIMChatItems:v8 inserted:v10 insertedUnreadMessage:&v51 insertedLocalUnsentChatItem:&v50];
  id v12 = v51;

  id v13 = v50;
  char v49 = 0;
  [*(id *)(a1 + 40) _regenerateChatItemsIn:*(void *)(a1 + 48) withIMChatItems:*(void *)(a1 + 64) regenerate:*(void *)(a1 + 80) shouldShowBlackholeAlert:&v49];
  [*(id *)(a1 + 40) _updateAudioControllerForInserted:*(void *)(a1 + 72) chatItems:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) _prewarmLinkPresentationsWithChatItems:v11];
  [*(id *)(a1 + 40) _addChatItemsToInputContextHistory:v11 signalingResponseContextChangeIfNeeded:1];
  [*(id *)(a1 + 40) _addChatItemsToGenerativeContextHistory:v11];
  uint64_t v14 = [*(id *)(a1 + 40) _computeDesiredScrollIntentForInsertedUnreadChatItem:v12 insertedLocalUnsentChatItem:v13];
  id v15 = +[CKUIBehavior sharedBehaviors];
  [v15 transcriptScrollToBottomDuration];
  double v17 = v16;

  double v48 = v17;
  if (*(unsigned char *)(a1 + 136))
  {
    [*(id *)(a1 + 40) _updateTranscriptChatItemsWithAnimation:*(void *)(a1 + 48) withIMChatItems:*(void *)(a1 + 64) oldChatItems:*(void *)(a1 + 96) insertedChatItems:v11 inserted:*(void *)(a1 + 72) removed:*(void *)(a1 + 56) reload:*(void *)(a1 + 104) reloadItemGUIDs:*(void *)(a1 + 88) desiredScrollIntent:v14 scrollToBottomDuration:&v48 animationCurve:0 completion:*(void *)(a1 + 120)];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F6E778] sharedInstance];
    int v19 = [v18 isDiffableTranscriptDataSourceEnabled];

    int v20 = *(void **)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 48);
    if (v19) {
      [v20 _updateSnapshotWithoutAnimation:v21 reloadingItemGUIDs:*(void *)(a1 + 88) completion:*(void *)(a1 + 120)];
    }
    else {
      [v20 _updateTranscriptChatItemsWithoutAnimation:v21];
    }
  }
  if (v14 == 6)
  {
    uint64_t v27 = *(void **)(a1 + 40);
    uint64_t v28 = *(unsigned __int8 *)(a1 + 136);
    double v29 = v48;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __122__CKTranscriptCollectionViewController__updateTranscriptChatItems_inserted_removed_reload_regenerate_animated_completion___block_invoke_2;
    v42[3] = &unk_1E5620AA8;
    v42[4] = v27;
    id v43 = v12;
    id v44 = v13;
    [v27 scrollToBottomAnimated:v28 withDuration:0 animationCurve:v43 insertedUnreadMessage:v44 insertedLocalUnsentChatItem:v42 withCompletion:v29];
    id v25 = &v43;
    uint64_t v26 = &v44;
  }
  else
  {
    if (v14) {
      goto LABEL_14;
    }
    uint64_t v22 = *(void **)(a1 + 40);
    uint64_t v23 = *(unsigned __int8 *)(a1 + 136);
    double v24 = v48;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __122__CKTranscriptCollectionViewController__updateTranscriptChatItems_inserted_removed_reload_regenerate_animated_completion___block_invoke_858;
    v45[3] = &unk_1E5620AA8;
    v45[4] = v22;
    id v46 = v12;
    id v47 = v13;
    [v22 scrollToCurrentTimeAnimated:v23 withDuration:0 animationCurve:v45 withCompletion:v24];
    id v25 = &v46;
    uint64_t v26 = &v47;
  }

LABEL_14:
  if (v49) {
    [*(id *)(a1 + 40) repromptLastBlackholeFailureIfNotPrompted];
  }
  [*(id *)(a1 + 40) setPoppedBalloonGUIDHiddenUntilNextChatItemUpdate:0];
  if (([*(id *)(a1 + 40) isPerformingRegenerateOrReloadOnlyUpdate] & 1) == 0)
  {
    uint64_t v30 = [*(id *)(a1 + 40) _logChatItems:*(void *)(a1 + 48) withUpdates:*(void *)(a1 + 112)];
    if (IMOSLoggingEnabled())
    {
      int v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        id v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
        *(_DWORD *)buf = 138412546;
        uint64_t v53 = v32;
        __int16 v54 = 2112;
        BOOL v55 = v30;
        _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "↳ %@ chatItems after update:\n %@", buf, 0x16u);
      }
    }
  }
  if (!*(unsigned char *)(a1 + 136))
  {
    BOOL v33 = [MEMORY[0x1E4F6E778] sharedInstance];
    char v34 = [v33 isDiffableTranscriptDataSourceEnabled];

    if ((v34 & 1) == 0)
    {
      uint64_t v35 = *(void *)(a1 + 120);
      if (v35) {
        (*(void (**)(void))(v35 + 16))();
      }
    }
  }
  long long v36 = *(id *)(a1 + 32);
  long long v37 = v36;
  os_signpost_id_t v38 = *(void *)(a1 + 128);
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v37, OS_SIGNPOST_INTERVAL_END, v38, "handlePluginBreadcrumbingInChatItems_completionHandler", "", buf, 2u);
  }

  uint64_t v39 = *(id *)(a1 + 32);
  long long v40 = v39;
  os_signpost_id_t v41 = *(void *)(a1 + 128);
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v40, OS_SIGNPOST_INTERVAL_END, v41, "handlePluginBreadcrumbingInChatItems_all", "", buf, 2u);
  }
}

uint64_t __122__CKTranscriptCollectionViewController__updateTranscriptChatItems_inserted_removed_reload_regenerate_animated_completion___block_invoke_858(uint64_t a1)
{
  return [*(id *)(a1 + 32) playEffectsIfNecessaryWithInsertedUnreadMessage:*(void *)(a1 + 40) insertedLocalUnsentChatItem:*(void *)(a1 + 48)];
}

uint64_t __122__CKTranscriptCollectionViewController__updateTranscriptChatItems_inserted_removed_reload_regenerate_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) playEffectsIfNecessaryWithInsertedUnreadMessage:*(void *)(a1 + 40) insertedLocalUnsentChatItem:*(void *)(a1 + 48)];
}

- (void)_updateTranscriptChatItemsWithAnimation:(id)a3 withIMChatItems:(id)a4 oldChatItems:(id)a5 insertedChatItems:(id)a6 inserted:(id)a7 removed:(id)a8 reload:(id)a9 reloadItemGUIDs:(id)a10 desiredScrollIntent:(int64_t)a11 scrollToBottomDuration:(double *)a12 animationCurve:(int64_t)a13 completion:(id)a14
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v57 = a4;
  id v59 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v58 = a9;
  id v56 = a10;
  id v24 = a14;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v25 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v75 = self;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: _updateTranscriptChatItemsWithAnimation", buf, 0xCu);
    }
  }
  dispatch_group_enter(v25);
  if (IMOSLoggingEnabled())
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
      uint64_t v28 = (CKTranscriptCollectionViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v75 = v28;
      _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Preparing to animate transcript updates, chatItems (count): %@", buf, 0xCu);
    }
  }
  double v29 = [(CKTranscriptCollectionViewController *)self chat];
  uint64_t v30 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  [v29 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B910]];
  [v30 setHoldingBoundsInvalidation:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __236__CKTranscriptCollectionViewController__updateTranscriptChatItemsWithAnimation_withIMChatItems_oldChatItems_insertedChatItems_inserted_removed_reload_reloadItemGUIDs_desiredScrollIntent_scrollToBottomDuration_animationCurve_completion___block_invoke;
  block[3] = &unk_1E5623170;
  id v31 = v20;
  id v69 = v31;
  id v55 = v30;
  id v70 = v55;
  id v54 = v29;
  id v71 = v54;
  id v72 = self;
  id v52 = v21;
  id v73 = v52;
  id v32 = (void *)MEMORY[0x1E4F14428];
  dispatch_group_notify(v25, MEMORY[0x1E4F14428], block);

  [(CKTranscriptCollectionViewController *)self _animateChatItemRemoval:v59 removed:v23];
  [(CKTranscriptCollectionViewController *)self _identifyIndicesNeedingCustomAnimationsForIMChatItems:v57 inserted:v22 removed:v23];
  if (IMOSLoggingEnabled())
  {
    BOOL v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v75 = self;
      _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: collectionViewUpdateCompletion", buf, 0xCu);
    }
  }
  dispatch_group_enter(v25);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __236__CKTranscriptCollectionViewController__updateTranscriptChatItemsWithAnimation_withIMChatItems_oldChatItems_insertedChatItems_inserted_removed_reload_reloadItemGUIDs_desiredScrollIntent_scrollToBottomDuration_animationCurve_completion___block_invoke_861;
  aBlock[3] = &unk_1E5622BA8;
  void aBlock[4] = self;
  char v34 = v25;
  long long v66 = v34;
  id v53 = v24;
  id v67 = v53;
  uint64_t v35 = _Block_copy(aBlock);
  long long v36 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v37 = [v36 isDiffableTranscriptDataSourceEnabled];

  if (v37)
  {
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    [(CKTranscriptCollectionViewController *)self _updateCollectionViewSnapshotForChatItems:v31 reloadingItemGUIDs:v56 animatingDifferences:1 associatedInserted:&v64 associatedRemoved:&v63 completion:v35];
    os_signpost_id_t v38 = (id *)&v63;
    uint64_t v39 = (id *)&v64;
  }
  else
  {
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    [(CKTranscriptCollectionViewController *)self _updateCollectionViewForChatItems:v31 oldChatItems:v59 inserted:v22 removed:v23 associatedInserted:&v62 associatedRemoved:&v61 animationDuration:*a12 animationCurve:a13 completion:v35];
    os_signpost_id_t v38 = (id *)&v61;
    uint64_t v39 = (id *)&v62;
  }
  id v40 = *v39;
  id v41 = *v38;
  [(CKTranscriptCollectionViewController *)self _animateChatItemReload:v31 reload:v58 associatedInserted:v40 animationDuration:a13 animationCurve:*a12];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __236__CKTranscriptCollectionViewController__updateTranscriptChatItemsWithAnimation_withIMChatItems_oldChatItems_insertedChatItems_inserted_removed_reload_reloadItemGUIDs_desiredScrollIntent_scrollToBottomDuration_animationCurve_completion___block_invoke_862;
  v60[3] = &unk_1E5620C40;
  v60[4] = self;
  long long v42 = (void *)MEMORY[0x1E4F14428];
  dispatch_group_notify(v34, MEMORY[0x1E4F14428], v60);

  BOOL v44 = a11 == 6 || a11 == 0;
  [(CKTranscriptCollectionViewController *)self _animateChatItemInsertion:v31 inserted:v22 wantsScrollToBottom:v44 scrollToBottomDuration:a12];
  [(CKTranscriptCollectionViewController *)self _animateAssociatedChatItemWithIndices:v40];
  [(CKTranscriptCollectionViewController *)self reconfigureVisibleSpeakerButtonCells];
  if (IMOSLoggingEnabled())
  {
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v75 = self;
      _os_log_impl(&dword_18EF18000, v45, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: _updateTranscriptChatItemsWithAnimation", buf, 0xCu);
    }
  }
  dispatch_group_leave(v34);
  if ([v22 count] || objc_msgSend(v40, "count") || objc_msgSend(v58, "count"))
  {
    id v46 = [(CKTranscriptCollectionViewController *)self delegate];
    char v47 = objc_opt_respondsToSelector();

    if (v47)
    {
      double v48 = [(CKTranscriptCollectionViewController *)self delegate];
      [v48 transcriptCollectionViewController:self didInsertChatItems:v22 associatedChatItems:v40];
    }
  }
  if ([v23 count] || objc_msgSend(v41, "count") || objc_msgSend(v58, "count"))
  {
    char v49 = [(CKTranscriptCollectionViewController *)self delegate];
    char v50 = objc_opt_respondsToSelector();

    if (v50)
    {
      id v51 = [(CKTranscriptCollectionViewController *)self delegate];
      [v51 transcriptCollectionViewController:self didRemoveChatItems:v23 associatedChatItems:v41];
    }
  }
}

uint64_t __236__CKTranscriptCollectionViewController__updateTranscriptChatItemsWithAnimation_withIMChatItems_oldChatItems_insertedChatItems_inserted_removed_reload_reloadItemGUIDs_desiredScrollIntent_scrollToBottomDuration_animationCurve_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
      int v9 = 138412290;
      uint64_t v10 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Completed animating transcript updates, performing clean up. chatItems (count): %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v4 = *(void **)(a1 + 40);
  BOOL v5 = objc_opt_new();
  [v4 setIndicesOfChatItemsToBeRemovedWithoutFading:v5];

  os_signpost_id_t v6 = *(void **)(a1 + 40);
  id v7 = objc_opt_new();
  [v6 setIndicesOfChatItemsToBeInsertedWithoutFading:v7];

  [*(id *)(a1 + 40) setHoldingBoundsInvalidation:0];
  [*(id *)(a1 + 48) endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B910]];
  return [*(id *)(a1 + 56) _updatePluginPlaybackManagerForInsertedChatItems:*(void *)(a1 + 64)];
}

void __236__CKTranscriptCollectionViewController__updateTranscriptChatItemsWithAnimation_withIMChatItems_oldChatItems_insertedChatItems_inserted_removed_reload_reloadItemGUIDs_desiredScrollIntent_scrollToBottomDuration_animationCurve_completion___block_invoke_861(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v6 = 134217984;
      uint64_t v7 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: collectionViewUpdateCompletion", (uint8_t *)&v6, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  BOOL v5 = [*(id *)(a1 + 32) delegate];
  [v5 transcriptCollectionViewControllerPerformBatchUpdateCompleted:*(void *)(a1 + 32)];
}

uint64_t __236__CKTranscriptCollectionViewController__updateTranscriptChatItemsWithAnimation_withIMChatItems_oldChatItems_insertedChatItems_inserted_removed_reload_reloadItemGUIDs_desiredScrollIntent_scrollToBottomDuration_animationCurve_completion___block_invoke_862(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPerformingRegenerateOrReloadOnlyUpdate:0];
}

- (void)_updateSnapshotWithoutAnimation:(id)a3 reloadingItemGUIDs:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__CKTranscriptCollectionViewController__updateSnapshotWithoutAnimation_reloadingItemGUIDs_completion___block_invoke;
  v10[3] = &unk_1E5622330;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(CKTranscriptCollectionViewController *)self _updateCollectionViewSnapshotForChatItems:a3 reloadingItemGUIDs:a4 animatingDifferences:0 associatedInserted:0 associatedRemoved:0 completion:v10];
}

uint64_t __102__CKTranscriptCollectionViewController__updateSnapshotWithoutAnimation_reloadingItemGUIDs_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reconfigureVisibleSpeakerButtonCells];
  [*(id *)(a1 + 32) setIsPerformingRegenerateOrReloadOnlyUpdate:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transcriptCollectionViewControllerPerformBatchUpdateCompleted:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_updateTranscriptChatItemsWithoutAnimation:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isDiffableTranscriptDataSourceEnabled];

  if (v5)
  {
    [(CKTranscriptCollectionViewController *)self _updateSnapshotWithoutAnimation:v10 reloadingItemGUIDs:MEMORY[0x1E4F1CBF0] completion:0];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v7 = [v6 isConsolidatedChatItemsEnabled];

    if (v7)
    {
      id v8 = [(CKTranscriptCollectionViewController *)self chatItemController];
      [v8 setChatItemsUsingReloadDataWithoutAnimation:v10];
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self setChatItems:v10 removedAssociatedIndexes:0 insertedAssociatedIndexes:0];
      [(CKTranscriptCollectionViewController *)self reloadData];
    }
    [(CKTranscriptCollectionViewController *)self setIsPerformingRegenerateOrReloadOnlyUpdate:0];
    id v9 = [(CKTranscriptCollectionViewController *)self delegate];
    [v9 transcriptCollectionViewControllerPerformBatchUpdateCompleted:self];
  }
}

- (id)_itemGUIDsForItems:(id)a3 inIMChatItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __72__CKTranscriptCollectionViewController__itemGUIDsForItems_inIMChatItem___block_invoke;
    uint64_t v14 = &unk_1E56240E0;
    id v15 = v6;
    id v16 = v7;
    id v8 = v7;
    [v5 enumerateIndexesUsingBlock:&v11];
    id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C978] array];
  }

  return v9;
}

void __72__CKTranscriptCollectionViewController__itemGUIDsForItems_inIMChatItem___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = (id *)(a1 + 32);
  unint64_t v5 = [*(id *)(a1 + 32) count];
  if (a2 == 0x7FFFFFFFFFFFFFFFLL || v5 <= a2)
  {
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __72__CKTranscriptCollectionViewController__itemGUIDsForItems_inIMChatItem___block_invoke_cold_1(v4, a2, v9);
    }
  }
  else
  {
    id v6 = [*v4 objectAtIndexedSubscript:a2];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
      id v8 = [v10 guid];
      [*(id *)(a1 + 40) addObject:v8];
    }
  }
}

- (void)_removeChatItemsFrom:(id)a3 removed:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    [v5 removeObjectsAtIndexes:v6];
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
        int v9 = 138412546;
        id v10 = v6;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Removed chatItems at indices: %@, chatItems (count): %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (id)_insertChatItemsInto:(id)a3 withIMChatItems:(id)a4 inserted:(id)a5 insertedUnreadMessage:(id *)a6 insertedLocalUnsentChatItem:(id *)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v14 count])
  {
    id v15 = [(CKTranscriptCollectionViewController *)self delegate];
    id v16 = [v15 traitCollectionForTranscriptCollectionViewController:self];

    uint64_t v46 = 0;
    char v47 = &v46;
    uint64_t v48 = 0x3032000000;
    char v49 = __Block_byref_object_copy__34;
    char v50 = __Block_byref_object_dispose__34;
    id v51 = 0;
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x3032000000;
    id v43 = __Block_byref_object_copy__34;
    BOOL v44 = __Block_byref_object_dispose__34;
    id v45 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    int v37 = __Block_byref_object_copy__34;
    os_signpost_id_t v38 = __Block_byref_object_dispose__34;
    id v39 = 0;
    id v39 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __136__CKTranscriptCollectionViewController__insertChatItemsInto_withIMChatItems_inserted_insertedUnreadMessage_insertedLocalUnsentChatItem___block_invoke;
    uint64_t v27 = &unk_1E5627498;
    uint64_t v28 = self;
    id v17 = v16;
    id v29 = v17;
    id v18 = v12;
    id v30 = v18;
    id v31 = &v34;
    id v32 = &v46;
    BOOL v33 = &v40;
    [v13 enumerateObjectsAtIndexes:v14 options:0 usingBlock:&v24];
    int v19 = +[CKChatItemSizeCache sharedInstance];
    [v19 invalidateCachedSizeForChatItems:v35[5] reason:@"transcript_insert"];

    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        *(_DWORD *)buf = 138412546;
        id v53 = v14;
        __int16 v54 = 2112;
        id v55 = v21;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Inserted chatItems at indices: %@, chatItems (count): %@", buf, 0x16u);
      }
    }
    *a6 = (id) v47[5];
    *a7 = (id) v41[5];
    id v22 = (void *)[(id)v35[5] copy];

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&v46, 8);
  }
  else
  {
    id v22 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

void __136__CKTranscriptCollectionViewController__insertChatItemsInto_withIMChatItems_inserted_insertedUnreadMessage_insertedLocalUnsentChatItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v30 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)[*(id *)(a1 + 32) newChatItemWithIMChatItem:v30 traitCollection:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) insertObject:v5 atIndex:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v30;
      id v7 = [v6 message];
      id v8 = [v6 messageItem];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
        && ([v7 isFromMe] & 1) == 0
        && ([v7 isRead] & 1) == 0
        && ([v7 isTypingMessage] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
        }
      }
      if ([v8 unsentIsFromMeItem])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v5);
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v30;
      if ([v9 offerState] != 2)
      {
        id v10 = [MEMORY[0x1E4F6BCB8] sharedInstance];
        __int16 v11 = [v9 sender];
        id v12 = [v10 findMyLocationForHandle:v11];

        id v13 = [v12 fmfLocation];
        id v14 = v13;
        if (!v13) {
          goto LABEL_28;
        }
        uint64_t v15 = [v13 location];
        if (!v15) {
          goto LABEL_28;
        }
        id v16 = (void *)v15;
        id v17 = [MEMORY[0x1E4F1C9C8] date];
        id v18 = [v14 timestamp];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;
        id v21 = +[CKUIBehavior sharedBehaviors];
        [v21 locationValidInterval];
        double v23 = v22;

        if (v20 > v23)
        {
LABEL_28:
          uint64_t v24 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v25 = [v24 applicationState];

          if (!v25)
          {
            uint64_t v26 = [MEMORY[0x1E4F6BCB8] sharedInstance];
            uint64_t v27 = [v9 sender];
            uint64_t v28 = [*(id *)(a1 + 32) conversation];
            id v29 = [v28 chat];
            [v26 refreshLocationForHandle:v27 inChat:v29];
          }
        }
      }
    }
  }
}

- (void)_regenerateChatItemsIn:(id)a3 withIMChatItems:(id)a4 regenerate:(id)a5 shouldShowBlackholeAlert:(BOOL *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 count])
  {
    id v13 = [(CKTranscriptCollectionViewController *)self delegate];
    id v14 = [v13 traitCollectionForTranscriptCollectionViewController:self];

    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v15 = objc_opt_new();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __115__CKTranscriptCollectionViewController__regenerateChatItemsIn_withIMChatItems_regenerate_shouldShowBlackholeAlert___block_invoke;
    v22[3] = &unk_1E56274C0;
    void v22[4] = self;
    id v16 = v14;
    id v23 = v16;
    id v17 = v15;
    id v24 = v17;
    id v18 = v10;
    id v25 = v18;
    uint64_t v26 = &v27;
    [v11 enumerateObjectsAtIndexes:v12 options:0 usingBlock:v22];
    double v19 = +[CKChatItemSizeCache sharedInstance];
    [v19 invalidateCachedSizeForChatItems:v17 reason:@"transcript_regenerate"];

    if (IMOSLoggingEnabled())
    {
      double v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        *(_DWORD *)buf = 138412546;
        id v32 = v12;
        __int16 v33 = 2112;
        uint64_t v34 = v21;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Regenerated chatItems at indices: %@, chatItems (count): %@", buf, 0x16u);
      }
    }
    *a6 = *((unsigned char *)v28 + 24);

    _Block_object_dispose(&v27, 8);
  }
}

void __115__CKTranscriptCollectionViewController__regenerateChatItemsIn_withIMChatItems_regenerate_shouldShowBlackholeAlert___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v8;
  if (isKindOfClass)
  {
    id v7 = (void *)[*(id *)(a1 + 32) newChatItemWithIMChatItem:v8 traitCollection:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addObject:v7];
    [*(id *)(a1 + 56) replaceObjectAtIndex:a3 withObject:v7];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) shouldPresentHawkingPromptForChatItem:v8];
    }

    id v6 = v8;
  }
}

- (void)_updateAudioControllerForInserted:(id)a3 chatItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[CKAppAudioController sharedInstance];
  id v8 = [v7 audioController];

  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__CKTranscriptCollectionViewController__updateAudioControllerForInserted_chatItems___block_invoke;
    v9[3] = &unk_1E56240E0;
    id v10 = v6;
    id v11 = v8;
    [v5 enumerateIndexesUsingBlock:v9];
  }
}

void __84__CKTranscriptCollectionViewController__updateAudioControllerForInserted_chatItems___block_invoke(uint64_t a1, uint64_t a2)
{
  id v10 = [*(id *)(a1 + 32) objectAtIndex:a2];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = v10;
  if (isKindOfClass)
  {
    id v5 = v10;
    id v6 = [v5 mediaObject];
    char v7 = [v6 shouldSuppressPreview];

    if ((v7 & 1) == 0 && ([v5 isFromMe] & 1) == 0 && (objc_msgSend(v5, "isPlayed") & 1) == 0)
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = [v5 mediaObject];
      [v8 addMediaObject:v9];
    }
    uint64_t v4 = v10;
  }
}

- (void)_updateCollectionViewSnapshotForChatItems:(id)a3 reloadingItemGUIDs:(id)a4 animatingDifferences:(BOOL)a5 associatedInserted:(id *)a6 associatedRemoved:(id *)a7 completion:(id)a8
{
  BOOL v9 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v32 = a4;
  id v31 = a8;
  id v12 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
  id v13 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v14 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  char v30 = [(CKTranscriptCollectionViewController *)self dataSource];
  [v13 beginDisablingTranscriptDynamicsForReason:@"CollectionViewDiffableSnapshotUpdate"];
  uint64_t v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v16 = [v15 isConsolidatedChatItemsEnabled];

  if (v16)
  {
    id v17 = [(CKTranscriptCollectionViewController *)self chatItemController];
    id v18 = [v17 setChatItems:v35 completion:0];

    id v19 = [v18 inserted];
    id v20 = [v18 removed];
  }
  else
  {
    id v46 = 0;
    id v47 = 0;
    [(CKTranscriptCollectionViewController *)self setChatItems:v35 removedAssociatedIndexes:&v47 insertedAssociatedIndexes:&v46];
    id v20 = v47;
    id v19 = v46;
  }
  id v21 = [(CKTranscriptCollectionViewController *)self generateSnapshotForCKChatItems:v35];
  if (IMOSLoggingEnabled())
  {
    double v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      char v49 = self;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: will call applySnapshot", buf, 0xCu);
    }
  }
  dispatch_group_enter(v12);
  [v14 reloadData];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __170__CKTranscriptCollectionViewController__updateCollectionViewSnapshotForChatItems_reloadingItemGUIDs_animatingDifferences_associatedInserted_associatedRemoved_completion___block_invoke;
  v36[3] = &unk_1E56274E8;
  id v23 = v13;
  id v37 = v23;
  id v24 = v14;
  id v38 = v24;
  id v39 = self;
  id v25 = v12;
  uint64_t v40 = v25;
  id v26 = v31;
  id v44 = v26;
  id v27 = v32;
  id v41 = v27;
  id v28 = v21;
  id v42 = v28;
  id v29 = v30;
  id v43 = v29;
  BOOL v45 = v9;
  [v29 applySnapshot:v28 animatingDifferences:v9 completion:v36];
  if (a6) {
    *a6 = v19;
  }
  if (a7) {
    *a7 = v20;
  }
}

void __170__CKTranscriptCollectionViewController__updateCollectionViewSnapshotForChatItems_reloadingItemGUIDs_animatingDifferences_associatedInserted_associatedRemoved_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __170__CKTranscriptCollectionViewController__updateCollectionViewSnapshotForChatItems_reloadingItemGUIDs_animatingDifferences_associatedInserted_associatedRemoved_completion___block_invoke_2;
  aBlock[3] = &unk_1E5622C20;
  id v12 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  id v13 = v2;
  uint64_t v14 = v3;
  id v15 = v4;
  id v16 = *(id *)(a1 + 88);
  id v5 = (void (**)(void))_Block_copy(aBlock);
  if ([*(id *)(a1 + 64) count]
    && [*(id *)(a1 + 48) isPerformingRegenerateOrReloadOnlyUpdate])
  {
    [*(id *)(a1 + 72) reloadItemsWithIdentifiers:*(void *)(a1 + 64)];
    uint64_t v7 = *(void *)(a1 + 72);
    id v6 = *(void **)(a1 + 80);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 96);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __170__CKTranscriptCollectionViewController__updateCollectionViewSnapshotForChatItems_reloadingItemGUIDs_animatingDifferences_associatedInserted_associatedRemoved_completion___block_invoke_877;
    v9[3] = &unk_1E5620F48;
    id v10 = v5;
    [v6 applySnapshot:v7 animatingDifferences:v8 completion:v9];
  }
  else
  {
    v5[2](v5);
  }
}

uint64_t __170__CKTranscriptCollectionViewController__updateCollectionViewSnapshotForChatItems_reloadingItemGUIDs_animatingDifferences_associatedInserted_associatedRemoved_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) endDisablingTranscriptDynamicsForReason:@"CollectionViewDiffableSnapshotUpdate"];
  [*(id *)(a1 + 40) clearParentInitialIndexesAndFinalOffsets];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: will call applySnapshot", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __170__CKTranscriptCollectionViewController__updateCollectionViewSnapshotForChatItems_reloadingItemGUIDs_animatingDifferences_associatedInserted_associatedRemoved_completion___block_invoke_877(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateCollectionViewForChatItems:(id)a3 oldChatItems:(id)a4 inserted:(id)a5 removed:(id)a6 associatedInserted:(id *)a7 associatedRemoved:(id *)a8 animationDuration:(double)a9 animationCurve:(int64_t)a10 completion:(id)a11
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v34 = a11;
  id v20 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
  id v21 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
  double v22 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v22 beginDisablingTranscriptDynamicsForReason:@"CollectionViewBatchUpdate"];
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  id v65 = __Block_byref_object_copy__34;
  long long v66 = __Block_byref_object_dispose__34;
  id v67 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = __Block_byref_object_copy__34;
  id v60 = __Block_byref_object_dispose__34;
  id v61 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  _OWORD v54[3] = __Block_byref_object_copy__34;
  v54[4] = __Block_byref_object_dispose__34;
  id v55 = 0;
  id location = 0;
  objc_initWeak(&location, v22);
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v69 = self;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: will call performBatchUpdates", buf, 0xCu);
    }
  }
  dispatch_group_enter(v20);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke;
  v42[3] = &unk_1E5627588;
  v42[4] = self;
  id v31 = v16;
  id v43 = v31;
  char v49 = &v62;
  uint64_t v50 = &v56;
  id v51 = v54;
  id v24 = v18;
  id v44 = v24;
  id v25 = v17;
  id v45 = v25;
  objc_copyWeak(&v52, &location);
  id v26 = v19;
  id v46 = v26;
  id v47 = v21;
  id v48 = v22;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_5;
  v35[3] = &unk_1E56275D8;
  id v39 = v54;
  v35[4] = self;
  id v27 = v48;
  id v36 = v27;
  double v40 = a9;
  int64_t v41 = a10;
  id v28 = v47;
  id v37 = v28;
  id v29 = v34;
  id v38 = v29;
  [v27 performBatchUpdates:v42 completion:v35];

  objc_destroyWeak(&v52);
  if (IMOSLoggingEnabled())
  {
    char v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v69 = self;
      _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: will call performBatchUpdates", buf, 0xCu);
    }
  }
  dispatch_group_leave(v20);
  *a7 = (id) v63[5];
  *a8 = (id) v57[5];
  objc_destroyWeak(&location);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
}

void __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) associatedChatItems];
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isConsolidatedChatItemsEnabled];

  int v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 chatItemController];
    uint64_t v7 = [v6 setChatItems:*(void *)(a1 + 40) completion:0];

    uint64_t v8 = [v7 inserted];
    uint64_t v9 = *(void *)(*(void *)(a1 + 88) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [v7 removed];
    uint64_t v12 = *(void *)(*(void *)(a1 + 96) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [v7 parentItemsToReload];
    uint64_t v15 = *(void *)(*(void *)(a1 + 104) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
    id v18 = *(void **)(v17 + 40);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(*(void *)(a1 + 88) + 8);
    id v54 = *(id *)(v20 + 40);
    id v55 = v18;
    [v5 setChatItems:v19 removedAssociatedIndexes:&v55 insertedAssociatedIndexes:&v54];
    objc_storeStrong((id *)(v17 + 40), v55);
    objc_storeStrong((id *)(v20 + 40), v54);
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v22 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_2;
  v47[3] = &unk_1E5627510;
  id v23 = v2;
  id v48 = v23;
  id v49 = *(id *)(a1 + 40);
  id v50 = *(id *)(a1 + 48);
  id v51 = *(id *)(a1 + 56);
  objc_copyWeak(&v53, (id *)(a1 + 112));
  id v24 = v21;
  id v52 = v24;
  [v22 enumerateIndexesUsingBlock:v47];
  id v25 = [*(id *)(a1 + 32) associatedChatItems];
  id v26 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_3;
  v42[3] = &unk_1E5627538;
  id v27 = v25;
  id v43 = v27;
  id v44 = *(id *)(a1 + 56);
  id v45 = *(id *)(a1 + 64);
  id v46 = *(id *)(a1 + 72);
  [v26 enumerateIndexesUsingBlock:v42];
  id v28 = *(void **)(a1 + 80);
  id v29 = objc_msgSend(*(id *)(a1 + 48), "__ck_indexPathItemsInSection:", 0);
  [v28 insertItemsAtIndexPaths:v29];

  char v30 = *(void **)(a1 + 80);
  id v31 = objc_msgSend(*(id *)(a1 + 64), "__ck_indexPathItemsInSection:", 0);
  [v30 deleteItemsAtIndexPaths:v31];

  id v32 = *(void **)(a1 + 80);
  __int16 v33 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "__ck_indexPathItemsInSection:", 1);
  [v32 insertItemsAtIndexPaths:v33];

  id v34 = *(void **)(a1 + 80);
  id v35 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "__ck_indexPathItemsInSection:", 1);
  [v34 deleteItemsAtIndexPaths:v35];

  [*(id *)(a1 + 80) reloadData];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_4;
  v37[3] = &unk_1E5627560;
  id v36 = v23;
  id v38 = v36;
  id v39 = *(id *)(a1 + 40);
  objc_copyWeak(&v41, (id *)(a1 + 112));
  id v40 = *(id *)(a1 + 72);
  [v24 enumerateKeysAndObjectsUsingBlock:v37];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v53);
}

void __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v22 = [*(id *)(a1 + 32) objectAtIndex:a2];
  int v4 = *(void **)(a1 + 40);
  int v5 = [v22 associatedChatItemGUID];
  uint64_t v6 = [v22 associatedMessageRange];
  uint64_t v8 = objc_msgSend(v4, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v5, v6, v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && ([*(id *)(a1 + 48) containsIndex:v8] & 1) == 0)
  {
    uint64_t v9 = *(void **)(a1 + 56);
    id v10 = [v22 associatedChatItemGUID];
    uint64_t v11 = [v22 associatedMessageRange];
    uint64_t v13 = objc_msgSend(v9, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v10, v11, v12);

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:0];
    id v16 = [WeakRetained cellForItemAtIndexPath:v15];

    if (v16)
    {
      uint64_t v17 = *(void **)(a1 + 64);
      id v18 = NSNumber;
      [v16 frame];
      uint64_t v20 = [v18 numberWithDouble:v19];
      id v21 = [NSNumber numberWithUnsignedInteger:a2];
      [v17 setObject:v20 forKey:v21];
    }
  }
}

void __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) objectAtIndex:a2];
  int v4 = *(void **)(a1 + 40);
  int v5 = [v9 associatedChatItemGUID];
  uint64_t v6 = [v9 associatedMessageRange];
  uint64_t v8 = objc_msgSend(v4, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v5, v6, v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && ([*(id *)(a1 + 48) containsIndex:v8] & 1) == 0) {
    [*(id *)(a1 + 56) setInitialIndex:v8 forParentOfAssociatedItemInsertedAtIndex:a2];
  }
}

void __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v18, "unsignedIntegerValue"));
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 associatedChatItemGUID];
  uint64_t v9 = [v6 associatedMessageRange];
  uint64_t v11 = objc_msgSend(v7, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v8, v9, v10);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
  uint64_t v14 = [WeakRetained cellForItemAtIndexPath:v13];

  if (v14)
  {
    [v5 doubleValue];
    double v16 = v15;
    [v14 frame];
    objc_msgSend(*(id *)(a1 + 48), "setVerticalOffset:forParentOfAssociatedItemDeletedAtIndex:", objc_msgSend(v18, "unsignedIntegerValue"), v16 - v17);
  }
}

void __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_5(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "__ck_indexPathItemsInSection:", 0);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_6;
  uint64_t v9 = &unk_1E56275B0;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  [v2 enumerateObjectsUsingBlock:&v6];

  int v4 = objc_msgSend(*(id *)(a1 + 32), "collectionView", v6, v7, v8, v9, v10);
  [v4 endDisablingTranscriptDynamicsForReason:@"CollectionViewBatchUpdate"];

  [*(id *)(a1 + 48) clearParentInitialIndexesAndFinalOffsets];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __185__CKTranscriptCollectionViewController__updateCollectionViewForChatItems_oldChatItems_inserted_removed_associatedInserted_associatedRemoved_animationDuration_animationCurve_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v9 = a2;
  unint64_t v3 = [v9 item];
  int v4 = [*(id *)(a1 + 32) chatItems];
  unint64_t v5 = [v4 count];

  if (v3 < v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) chatItems];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));

    uint64_t v8 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v9];
    if (v8) {
      [*(id *)(a1 + 32) configureCell:v8 forCKChatItem:v7 atIndexPath:v9 animated:0 animationDuration:*(void *)(a1 + 56) animationCurve:*(double *)(a1 + 48)];
    }
  }
}

- (void)_handlePluginBreadcrumbingInChatItems:(id)a3 withIMChatItems:(id)a4 inserted:(id *)a5 removed:(id *)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, void))a7;
  uint64_t v102 = 0;
  unint64_t v103 = 0;
  unint64_t v15 = [(CKTranscriptCollectionViewController *)self _indexOfBreadcrumbReplacingTranscriptPluginInChatItems:v13 inserted:*a5 removed:*a6 outIndexOfReplacedPlugin:&v103 outIndexOfNewPlugin:&v102];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL || v103 == 0x7FFFFFFFFFFFFFFFLL || v102 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v19 = [v18 isConsolidatedChatItemsEnabled];

    if (v19)
    {
      uint64_t v20 = [(CKTranscriptCollectionViewController *)self chatItemController];
      id v21 = (id)[v20 setChatItems:v12 completion:0];

      if (!v14) {
        goto LABEL_33;
      }
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self setChatItems:v12];
      if (!v14) {
        goto LABEL_33;
      }
    }
    v14[2](v14, 0);
    goto LABEL_33;
  }
  uint64_t v22 = v15;
  id v72 = v14;
  id v61 = a6;
  uint64_t v62 = a5;
  id v23 = *a6;
  id v24 = *a5;
  id v100 = 0;
  id v101 = 0;
  id v98 = 0;
  id v99 = 0;
  CKSeparateInsertionsAndDeletions(v23, v24, v103, v22, &v101, &v100, &v99, &v98);
  id v25 = v101;
  id v26 = v100;
  id v74 = v99;
  id v27 = v98;
  id v28 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v29 = [(CKTranscriptCollectionViewController *)self delegate];
  uint64_t v30 = [v29 traitCollectionForTranscriptCollectionViewController:self];

  id v31 = [MEMORY[0x1E4F28D58] indexPathForItem:v103 inSection:0];
  id v71 = v28;
  id v32 = [v28 cellForItemAtIndexPath:v31];

  uint64_t v70 = v32;
  __int16 v33 = [v32 balloonView];
  id v34 = [v33 snapshot];
  id v69 = v33;
  [v33 frame];
  objc_msgSend(v34, "setFrame:");
  id v68 = v34;
  [(CKTranscriptCollectionViewController *)self setSnapshotOfPluginBeingReplacedByBreadcrumb:v34];
  uint64_t v35 = [v12 objectAtIndex:v103];
  [v12 removeObjectsAtIndexes:v25];
  id v36 = v13;
  uint64_t v37 = [v13 objectAtIndex:v22];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v73 = (void *)v30;
  long long v66 = (void *)v37;
  id v67 = (void *)v35;
  if (isKindOfClass)
  {
    uint64_t v58 = v25;
    id v39 = [(CKTranscriptCollectionViewController *)self newChatItemWithIMChatItem:v37 traitCollection:v30];
    [v39 setPreviousPluginChatItem:v35];
    id v40 = v12;
    objc_msgSend(v12, "insertObject:atIndex:", v39, objc_msgSend(v26, "firstIndex"));
    uint64_t v94 = 0;
    double v95 = &v94;
    uint64_t v96 = 0x2020000000;
    uint64_t v97 = v102;
    id v41 = v27;
    uint64_t v42 = [v27 countOfIndexesInRange:0];
    v95[3] -= v42;
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke;
    v93[3] = &unk_1E5627600;
    v93[4] = &v94;
    [v74 enumerateIndexesUsingBlock:v93];
    uint64_t v14 = v72;
    id v43 = (void *)[v26 mutableCopy];
    id v13 = v36;
    [v43 addIndex:v95[3]];
    id v60 = (void *)[v43 copy];
    id v57 = v43;

    [v36 objectAtIndex:v102];
    id v44 = v58;
    v56 = id v12 = v40;
    uint64_t v64 = [v56 message];
    id v45 = v71;
    id v65 = [v36 objectAtIndex:v102];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v63 = [(CKTranscriptCollectionViewController *)self newChatItemWithIMChatItem:v65 traitCollection:v73];
      [v63 setIsAppearing:1];
      [v12 insertObject:v63 atIndex:v95[3]];
      if ([v64 isFromMe] & 1) != 0 || (objc_msgSend(v64, "isRead")) {
        id v59 = 0;
      }
      else {
        id v59 = v63;
      }
      id v55 = v39;
      id v47 = (void *)[v41 mutableCopy];
      [v47 removeIndex:v102];
      id v54 = v47;
      *uint64_t v62 = (id)[v47 copy];
      id v48 = (void *)[v74 mutableCopy];
      [v48 shiftIndexesStartingAtIndex:v95[3] by:1];
      *id v61 = (id)[v48 copy];
      id v49 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v50 = [v49 isDiffableTranscriptDataSourceEnabled];

      if (v50)
      {
        id v51 = [(CKTranscriptCollectionViewController *)self generateSnapshotForCKChatItems:v12];
        id v52 = [(CKTranscriptCollectionViewController *)self dataSource];
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_2;
        v85[3] = &unk_1E5627628;
        id v86 = v55;
        uint64_t v87 = self;
        id v88 = v63;
        id v89 = v71;
        id v90 = v60;
        double v92 = v72;
        id v91 = v59;
        [v52 applySnapshotUsingReloadData:v51 completion:v85];
      }
      else
      {
        id v53 = (void *)MEMORY[0x1E4F42FF0];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_880;
        v75[3] = &unk_1E5627678;
        id v76 = v71;
        id v77 = self;
        id v78 = v12;
        id v79 = v58;
        id v80 = v60;
        id v81 = v55;
        id v82 = v63;
        id v84 = v72;
        id v83 = v59;
        [v53 performWithoutAnimation:v75];

        id v51 = v76;
      }

      id v39 = v55;
    }
    else
    {
      if (v72) {
        v72[2](v72, 0);
      }
      id v59 = 0;
    }

    _Block_object_dispose(&v94, 8);
    id v46 = v59;
    id v26 = v60;
  }
  else
  {
    id v41 = v27;
    uint64_t v14 = v72;
    if (v72) {
      v72[2](v72, 0);
    }
    id v46 = 0;
    id v13 = v36;
    id v45 = v71;
    id v44 = v25;
  }

LABEL_33:
}

uint64_t __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 > a2) {
    *(void *)(v2 + 24) = v3 + 1;
  }
  return result;
}

void __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setPreviousPluginChatItem:0];
  [*(id *)(a1 + 40) setSnapshotOfPluginBeingReplacedByBreadcrumb:0];
  [*(id *)(a1 + 48) setIsAppearing:0];
  uint64_t v2 = *(void **)(a1 + 56);
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 64), "firstIndex"), 0);
  int v4 = [v2 cellForItemAtIndexPath:v3];

  if (v4)
  {
    unint64_t v5 = [*(id *)(a1 + 40) updateAnimationGroup];
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in applySnapshotUsingReloadData – will call performInsertion:", buf, 0xCu);
      }
    }
    dispatch_group_enter(v5);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_879;
    v10[3] = &unk_1E5621EA8;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v5;
    uint64_t v8 = v5;
    [v4 performInsertion:v10];
  }
  uint64_t v9 = *(void *)(a1 + 80);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 72));
  }
}

void __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_879(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in applySnapshotUsingReloadData – will call performInsertion:", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_880(uint64_t a1)
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_2_881;
  v14[3] = &unk_1E5623170;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  void v14[4] = *(void *)(a1 + 40);
  id v15 = v3;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_3;
  void v6[3] = &unk_1E5627650;
  id v4 = *(id *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 96);
  id v12 = *(id *)(a1 + 88);
  [v2 performBatchUpdates:v14 completion:v6];
}

void __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_2_881(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) associatedChatItems];
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isConsolidatedChatItemsEnabled];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 chatItemController];
    id v7 = [v6 setChatItems:*(void *)(a1 + 40) completion:0];

    id v8 = [v7 inserted];
    id v9 = [v7 removed];
  }
  else
  {
    [v5 setChatItems:*(void *)(a1 + 40)];
    id v10 = *(void **)(a1 + 32);
    id v19 = 0;
    id v20 = 0;
    [v10 _diffAssociatedItemsWithOldAssociatedItems:v2 removedAssociatedIndexes:&v20 insertedAssociatedIndexes:&v19];
    id v9 = v20;
    id v8 = v19;
  }
  id v11 = *(void **)(a1 + 48);
  id v12 = objc_msgSend(v9, "__ck_indexPathItemsInSection:", 1);
  [v11 deleteItemsAtIndexPaths:v12];

  id v13 = *(void **)(a1 + 48);
  uint64_t v14 = objc_msgSend(v8, "__ck_indexPathItemsInSection:", 1);
  [v13 insertItemsAtIndexPaths:v14];

  id v15 = *(void **)(a1 + 48);
  id v16 = objc_msgSend(*(id *)(a1 + 56), "__ck_indexPathItemsInSection:", 0);
  [v15 deleteItemsAtIndexPaths:v16];

  id v17 = *(void **)(a1 + 48);
  id v18 = objc_msgSend(*(id *)(a1 + 64), "__ck_indexPathItemsInSection:", 0);
  [v17 insertItemsAtIndexPaths:v18];

  [*(id *)(a1 + 48) reloadData];
}

void __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setPreviousPluginChatItem:0];
  [*(id *)(a1 + 40) setSnapshotOfPluginBeingReplacedByBreadcrumb:0];
  [*(id *)(a1 + 48) setIsAppearing:0];
  uint64_t v2 = *(void **)(a1 + 56);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 64), "firstIndex"), 0);
  int v4 = [v2 cellForItemAtIndexPath:v3];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) updateAnimationGroup];
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in _handlePluginBreadcrumbingInChatItems – will call performInsertion:", buf, 0xCu);
      }
    }
    dispatch_group_enter(v5);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_882;
    v10[3] = &unk_1E5621EA8;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v5;
    id v8 = v5;
    [v4 performInsertion:v10];
  }
  uint64_t v9 = *(void *)(a1 + 80);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 72));
  }
}

void __122__CKTranscriptCollectionViewController__handlePluginBreadcrumbingInChatItems_withIMChatItems_inserted_removed_completion___block_invoke_882(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _handlePluginBreadcrumbingInChatItems – will call performInsertion:", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_animateChatItemRemoval:(id)a3 removed:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        *(_DWORD *)buf = 138412546;
        id v20 = v7;
        __int16 v21 = 2112;
        uint64_t v22 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "  Animating removal of chatItems at indices: %@, oldchatItems (count): %@", buf, 0x16u);
      }
    }
    id v10 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
    id v11 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v12 = +[CKChatItemSizeCache sharedInstance];
    [v12 invalidateCachedSizeForChatItems:v6 reason:@"transcript_animated_removal"];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __72__CKTranscriptCollectionViewController__animateChatItemRemoval_removed___block_invoke;
    v15[3] = &unk_1E56276A0;
    id v16 = v11;
    id v17 = self;
    id v18 = v10;
    id v13 = v10;
    id v14 = v11;
    [v6 enumerateObjectsAtIndexes:v7 options:0 usingBlock:v15];
  }
}

void __72__CKTranscriptCollectionViewController__animateChatItemRemoval_removed___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  id v8 = [v6 cellForItemAtIndexPath:v7];

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in _animateChatItemRemoval – will call performRemoval:", buf, 0xCu);
      }
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__CKTranscriptCollectionViewController__animateChatItemRemoval_removed___block_invoke_886;
    v12[3] = &unk_1E5621EA8;
    id v11 = *(void **)(a1 + 48);
    v12[4] = *(void *)(a1 + 40);
    id v13 = v11;
    [v8 performRemoval:v12];
  }
}

void __72__CKTranscriptCollectionViewController__animateChatItemRemoval_removed___block_invoke_886(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _animateChatItemRemoval – will call performRemoval:", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_animateChatItemReload:(id)a3 reload:(id)a4 associatedInserted:(id)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v13 count])
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        *(_DWORD *)buf = 138412546;
        id v31 = v13;
        __int16 v32 = 2112;
        __int16 v33 = v16;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "  Animating reload of chatItems at indices: %@, chatItems (count): %@", buf, 0x16u);
      }
    }
    id v17 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
    id v18 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v19 = [v12 objectsAtIndexes:v13];
    id v20 = +[CKChatItemSizeCache sharedInstance];
    [v20 invalidateCachedSizeForChatItems:v19 reason:@"transcript_animated_reload"];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke;
    v23[3] = &unk_1E56276F0;
    id v24 = v18;
    id v25 = self;
    id v26 = v17;
    double v28 = a6;
    int64_t v29 = a7;
    id v27 = v14;
    id v21 = v17;
    id v22 = v18;
    [v12 enumerateObjectsAtIndexes:v13 options:0 usingBlock:v23];
  }
}

void __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  id v7 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v6];
  id v8 = objc_opt_class();
  if ([v8 isEqual:objc_opt_class()])
  {
    uint64_t v9 = objc_opt_class();
    if ([v9 isEqual:objc_opt_class()])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      v71[0] = v6;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      [v10 reloadItemsAtIndexPaths:v11];

      uint64_t v12 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v6];

      id v7 = (void *)v12;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = *(void **)(a1 + 32);
      uint64_t v70 = v6;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
      [v13 reloadItemsAtIndexPaths:v14];

      uint64_t v15 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v6];

      id v7 = (void *)v15;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = *(void **)(a1 + 32);
      id v69 = v6;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
      [v16 reloadItemsAtIndexPaths:v17];

      uint64_t v18 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v6];

      id v7 = (void *)v18;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = *(void **)(a1 + 32);
      id v68 = v6;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
      [v19 reloadItemsAtIndexPaths:v20];

      uint64_t v21 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v6];

      id v7 = (void *)v21;
    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 itemIsReply]) {
      [v7 setSuppressAnimationsForLineUpdates:1];
    }
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        id v63 = v23;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in _animateChatItemReload – will call performReload:", buf, 0xCu);
      }
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_897;
    v55[3] = &unk_1E5626088;
    id v24 = v7;
    uint64_t v25 = *(void *)(a1 + 40);
    id v56 = v24;
    uint64_t v57 = v25;
    id v58 = v5;
    id v26 = v6;
    id v59 = v26;
    uint64_t v60 = *(void *)(a1 + 64);
    uint64_t v61 = *(void *)(a1 + 72);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_2;
    v53[3] = &unk_1E5621EA8;
    id v27 = *(void **)(a1 + 48);
    v53[4] = *(void *)(a1 + 40);
    id v54 = v27;
    [v24 performReload:v55 completion:v53];
    if (![v26 section])
    {
      double v28 = [*(id *)(a1 + 40) chatItems];
      int64_t v29 = objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v26, "item"));

      uint64_t v30 = [v29 visibleAssociatedMessageChatItems];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_898;
      v49[3] = &unk_1E56276C8;
      v49[4] = *(void *)(a1 + 40);
      id v50 = *(id *)(a1 + 56);
      id v51 = *(id *)(a1 + 48);
      id v52 = v24;
      [v30 enumerateObjectsUsingBlock:v49];

      id v31 = [v29 messageHighlightChatItem];
      if (v31)
      {
        __int16 v32 = (void *)MEMORY[0x1E4F28D58];
        __int16 v33 = [*(id *)(a1 + 40) associatedChatItems];
        uint64_t v34 = objc_msgSend(v32, "indexPathForItem:inSection:", objc_msgSend(v33, "indexOfObject:", v31), 1);

        if ((objc_msgSend(*(id *)(a1 + 56), "containsIndex:", objc_msgSend(v34, "row")) & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v35 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v34];
            if (v35)
            {
              id v36 = [*(id *)(a1 + 40) collectionViewLayout];
              [v36 updateAssociatedLayoutAttributesIfNecessary];

              if (IMOSLoggingEnabled())
              {
                uint64_t v37 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  id v38 = *(void **)(a1 + 40);
                  *(_DWORD *)buf = 134217984;
                  id v63 = v38;
                  _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in _animateChatItemReload – will call performReload: on CKAssociatedMessageTranscriptCell", buf, 0xCu);
                }
              }
              dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
              v45[0] = MEMORY[0x1E4F143A8];
              v45[1] = 3221225472;
              v45[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_902;
              v45[3] = &unk_1E5621088;
              v45[4] = *(void *)(a1 + 40);
              uint64_t v35 = v35;
              id v46 = v35;
              id v47 = v31;
              id v48 = v34;
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              id v43[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_2_903;
              v43[3] = &unk_1E5621EA8;
              id v39 = *(void **)(a1 + 48);
              v43[4] = *(void *)(a1 + 40);
              id v44 = v39;
              [v35 performReload:v45 completion:v43];
            }
          }
          else
          {
            uint64_t v35 = IMLogHandleForCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              id v40 = (objc_class *)objc_opt_class();
              id v41 = NSStringFromClass(v40);
              uint64_t v42 = [v29 messageHighlightChatItem];
              *(_DWORD *)buf = 138412802;
              id v63 = v34;
              __int16 v64 = 2112;
              id v65 = v41;
              __int16 v66 = 2112;
              id v67 = v42;
              _os_log_error_impl(&dword_18EF18000, v35, OS_LOG_TYPE_ERROR, "2 Cell for indexPath %@ was of type %@, expected CKAssociatedMessageTranscriptCell. Not reloading. cellChatItem.messageHighlightChatItem: %@", buf, 0x20u);
            }
          }
        }
      }
    }
  }
}

uint64_t __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_897(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);

  return [v3 configureCell:v4 forCKChatItem:v5 atIndexPath:v6 animated:v2 >= 5.0 animationDuration:v8 animationCurve:v7];
}

void __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _animateChatItemReload – will call performReload:", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_898(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) associatedChatItems];
  int v5 = [v4 containsObject:v3];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28D58];
    double v7 = [*(id *)(a1 + 32) associatedChatItems];
    uint64_t v8 = objc_msgSend(v6, "indexPathForItem:inSection:", objc_msgSend(v7, "indexOfObject:", v3), 1);

    if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v8, "row")) & 1) == 0)
    {
      uint64_t v9 = [*(id *)(a1 + 32) cellForAssociatedChatItem:v3];
      if (v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v11 = [v10 isStickerRepositioningEnabled];

        if (v11
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [v3 chatItemIsStickerReposition])
        {
          [*(id *)(a1 + 32) _animateStickerRepositionWithAssociatedChatItem:v3 associatedCell:v9 associatedIndexPath:v8];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v12 = [*(id *)(a1 + 32) collectionViewLayout];
            [v12 updateAssociatedLayoutAttributesIfNecessary];

            if (IMOSLoggingEnabled())
            {
              id v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                uint64_t v14 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 134217984;
                uint64_t v23 = v14;
                _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in _animateChatItemReload – will call performReload: to configureAssociatedCell", buf, 0xCu);
              }
            }
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            uint64_t v15 = *(void **)(a1 + 56);
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_899;
            v18[3] = &unk_1E5621088;
            v18[4] = *(void *)(a1 + 32);
            id v19 = v9;
            id v20 = v3;
            id v21 = v8;
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            void v16[2] = __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_2_900;
            v16[3] = &unk_1E5621EA8;
            v16[4] = *(void *)(a1 + 32);
            id v17 = *(id *)(a1 + 48);
            [v15 performReload:v18 completion:v16];
          }
        }
      }
    }
  }
}

uint64_t __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_899(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureAssociatedCell:*(void *)(a1 + 40) forChatItem:*(void *)(a1 + 48) atIndexPath:*(void *)(a1 + 56)];
}

void __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_2_900(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _animateChatItemReload – will call performReload: to configureAssociatedCell", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_902(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureAssociatedCell:*(void *)(a1 + 40) forChatItem:*(void *)(a1 + 48) atIndexPath:*(void *)(a1 + 56)];
}

void __122__CKTranscriptCollectionViewController__animateChatItemReload_reload_associatedInserted_animationDuration_animationCurve___block_invoke_2_903(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _animateChatItemReload – will call performReload: on CKAssociatedMessageTranscriptCell", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_animateChatItemInsertion:(id)a3 inserted:(id)a4 wantsScrollToBottom:(BOOL)a5 scrollToBottomDuration:(double *)a6
{
  BOOL v6 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v10 count])
  {
    BOOL v33 = v6;
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        if ([(CKTranscriptCollectionViewController *)self isInline]) {
          uint64_t v12 = @"YES";
        }
        else {
          uint64_t v12 = @"NO";
        }
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        id v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        id v47 = v13;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "\t(Inline: %@) Animating insertion of chatItems at indices: %@, chatItems (count): %@", buf, 0x20u);
      }
    }
    uint64_t v14 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
    uint64_t v15 = [(CKTranscriptCollectionViewController *)self collectionView];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v47 = __Block_byref_object_copy__34;
    id v48 = __Block_byref_object_dispose__34;
    id v49 = 0;
    id v49 = [MEMORY[0x1E4F1CA48] array];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    id v43[2] = __118__CKTranscriptCollectionViewController__animateChatItemInsertion_inserted_wantsScrollToBottom_scrollToBottomDuration___block_invoke;
    v43[3] = &unk_1E5622268;
    id v16 = v15;
    id v44 = v16;
    id v45 = buf;
    [v9 enumerateObjectsAtIndexes:v10 options:0 usingBlock:v43];
    id v17 = [*(id *)(*(void *)&buf[8] + 40) indexesOfObjectsPassingTest:&__block_literal_global_906];
    if (![v17 count])
    {
      uint64_t v21 = 0;
      double v20 = 0.0;
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_15;
    }
    uint64_t v18 = [v17 lastIndex];
    id v19 = [*(id *)(*(void *)&buf[8] + 40) objectAtIndex:v18];
    double v20 = 0.0;
    if (![v19 isReply] || (objc_msgSend(v19, "isFromMe") & 1) != 0)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

LABEL_15:
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      CFTimeInterval v42 = 0.0;
      CFTimeInterval v42 = CACurrentMediaTime();
      uint64_t v23 = *(void **)(*(void *)&buf[8] + 40);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __118__CKTranscriptCollectionViewController__animateChatItemInsertion_inserted_wantsScrollToBottom_scrollToBottomDuration___block_invoke_3;
      v35[3] = &unk_1E5627738;
      uint64_t v37 = v41;
      uint64_t v38 = v21;
      double v39 = v20;
      uint64_t v40 = v22;
      v35[4] = self;
      id v24 = v14;
      id v36 = v24;
      [v23 enumerateObjectsUsingBlock:v35];

      _Block_object_dispose(v41, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_16;
    }
    uint64_t v21 = [v19 insertionAnimationType];
    [v19 insertionDurationForInsertionType:v21];
    double v20 = v25;
    if ((unint64_t)[v17 count] < 2)
    {
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v33) {
        goto LABEL_13;
      }
      double v29 = 0.0;
      if (v21 == 2) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v22 = [v17 firstIndex];
      id v26 = [*(id *)(*(void *)&buf[8] + 40) objectAtIndex:v22];
      int v27 = [v26 isReplyContextPreview];
      uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      if (v27) {
        uint64_t v28 = v22;
      }
      uint64_t v32 = v28;

      if (!v33 || v21 == 2)
      {
        uint64_t v22 = v32;
        goto LABEL_13;
      }
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v29 = 0.0;
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v30 = +[CKUIBehavior sharedBehaviors];
        [v30 fadeInReplyPreviewAnimationDuration];
        double v29 = v31;
      }
    }
    *a6 = v20 + v29;
    goto LABEL_13;
  }
LABEL_16:
}

void __118__CKTranscriptCollectionViewController__animateChatItemInsertion_inserted_wantsScrollToBottom_scrollToBottomDuration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  id v7 = [v4 cellForItemAtIndexPath:v5];

  BOOL v6 = v7;
  if (v7)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
    BOOL v6 = v7;
  }
}

uint64_t __118__CKTranscriptCollectionViewController__animateChatItemInsertion_inserted_wantsScrollToBottom_scrollToBottomDuration___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __118__CKTranscriptCollectionViewController__animateChatItemInsertion_inserted_wantsScrollToBottom_scrollToBottomDuration___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 setInsertionType:*(void *)(a1 + 56)];
  [v5 setInsertionDuration:*(double *)(a1 + 64)];
  [v5 setInsertionBeginTime:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (*(void *)(a1 + 72) != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v5 setInsertingWithReplyPreview:1];
    [v5 setInsertingBeforeReplyPreview:*(void *)(a1 + 72) > a3];
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in _animateChatItemInsertion – will call performInsertion:", buf, 0xCu);
    }
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __118__CKTranscriptCollectionViewController__animateChatItemInsertion_inserted_wantsScrollToBottom_scrollToBottomDuration___block_invoke_907;
  v9[3] = &unk_1E5621EA8;
  uint64_t v8 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v5 performInsertion:v9];
}

void __118__CKTranscriptCollectionViewController__animateChatItemInsertion_inserted_wantsScrollToBottom_scrollToBottomDuration___block_invoke_907(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _animateChatItemInsertion – will call performInsertion:", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_animateAssociatedChatItemWithIndices:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
    uint64_t v6 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v7 = [(CKTranscriptCollectionViewController *)self delegate];
    uint64_t v8 = [v7 currentlyFocusedChatItemForTapbackInTranscriptCollectionViewController:self];

    id v9 = [v8 tapbacksChatItem];
    id v10 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__CKTranscriptCollectionViewController__animateAssociatedChatItemWithIndices___block_invoke;
    v14[3] = &unk_1E56276A0;
    id v15 = v6;
    id v16 = v5;
    id v17 = v9;
    id v11 = v9;
    id v12 = v5;
    id v13 = v6;
    [v10 enumerateObjectsAtIndexes:v4 options:0 usingBlock:v14];
  }
}

void __78__CKTranscriptCollectionViewController__animateAssociatedChatItemWithIndices___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:1];
  uint64_t v8 = [v6 cellForItemAtIndexPath:v7];

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = a3;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Entering updateAnimationGroup: in _animateAssociatedChatItemWithIndices at index: %lu", buf, 0xCu);
      }
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __78__CKTranscriptCollectionViewController__animateAssociatedChatItemWithIndices___block_invoke_908;
    double v20 = &unk_1E5624A88;
    uint64_t v22 = a3;
    id v21 = *(id *)(a1 + 40);
    id v10 = _Block_copy(&v17);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = objc_msgSend(v5, "IMChatItem", v17, v18, v19, v20);
      id v12 = [v11 guid];
      id v13 = [*(id *)(a1 + 48) IMChatItem];
      uint64_t v14 = [v13 guid];
      int v15 = [v12 isEqual:v14];

      if (v15 && IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v24 = a3;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Skipping insertion animation for index: %lu", buf, 0xCu);
        }
      }
      [v8 performInsertion:v10 animated:v15 ^ 1u];
    }
    else
    {
      objc_msgSend(v8, "performInsertion:", v10, v17, v18, v19, v20);
    }
  }
}

void __78__CKTranscriptCollectionViewController__animateAssociatedChatItemWithIndices___block_invoke_908(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Leaving updateAnimationGroup: in _animateAssociatedChatItemWithIndices at index: %lu", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_animateStickerRepositionWithAssociatedChatItem:(id)a3 associatedCell:(id)a4 associatedIndexPath:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 associatedItemView];
  id v12 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
  v40[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  +[CKChatItem unloadSizesOfChatItems:v13];

  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v39 = self;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in _animateStickerRepositionWithAssociatedChatItem", buf, 0xCu);
    }
  }
  dispatch_group_enter(v12);
  char v15 = [v8 currentStickerRepositionIsLocalReposition];
  [v8 clearStickerRepositionLocalState];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke;
  aBlock[3] = &unk_1E5627760;
  void aBlock[4] = self;
  id v16 = v9;
  id v31 = v16;
  id v17 = v11;
  id v32 = v17;
  id v18 = v8;
  id v33 = v18;
  id v19 = v10;
  id v34 = v19;
  char v36 = v15;
  char v37 = 0;
  double v20 = v12;
  uint64_t v35 = v20;
  id v21 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v17 image];
    v21[2](v21, v22);
  }
  else
  {
    id v23 = objc_alloc(MEMORY[0x1E4F42A58]);
    [v17 bounds];
    id v26 = objc_msgSend(v23, "initWithSize:", v24, v25);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke_914;
    v28[3] = &unk_1E5620DE8;
    id v29 = v17;
    int v27 = [v26 imageWithActions:v28];

    v21[2](v21, v27);
    uint64_t v22 = v29;
  }
}

void __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = objc_alloc_init(CKBalloonImageView);
  [(CKBalloonImageView *)v4 setContentMode:1];
  [(CKBalloonImageView *)v4 setImage:v3];
  uint64_t v5 = [*(id *)(a1 + 32) view];
  [v5 addSubview:v4];

  uint64_t v6 = *(void **)(a1 + 40);
  [*(id *)(a1 + 48) center];
  double v8 = v7;
  double v10 = v9;
  id v11 = [*(id *)(a1 + 32) view];
  objc_msgSend(v6, "convertPoint:toView:", v11, v8, v10);
  -[CKBalloonImageView setCenter:](v4, "setCenter:");

  [*(id *)(a1 + 48) bounds];
  -[CKBalloonImageView setBounds:](v4, "setBounds:");
  memset(&v31, 0, sizeof(v31));
  id v12 = [*(id *)(a1 + 48) layer];
  id v13 = v12;
  if (v12) {
    [v12 transform];
  }
  else {
    memset(&v29, 0, sizeof(v29));
  }
  CATransform3DGetAffineTransform(&transform, &v29);
  CGAffineTransformDecompose(&v31, &transform);

  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeRotation(&v28, v31.rotation);
  CGAffineTransform m = v28;
  CATransform3DMakeAffineTransform(&v27, &m);
  uint64_t v14 = [(CKBalloonImageView *)v4 layer];
  CATransform3D v26 = v27;
  [v14 setTransform:&v26];

  [*(id *)(a1 + 40) setHidden:1];
  [*(id *)(a1 + 48) setHidden:1];
  [*(id *)(a1 + 56) refreshMediaObjectForStickerRepositioning];
  char v15 = [*(id *)(a1 + 32) collectionViewLayout];
  [v15 updateAssociatedLayoutAttributesIfNecessary];

  [*(id *)(a1 + 32) configureAssociatedCell:*(void *)(a1 + 40) forChatItem:*(void *)(a1 + 56) atIndexPath:*(void *)(a1 + 64)];
  [*(id *)(a1 + 40) setNeedsLayout];
  if (*(unsigned char *)(a1 + 80) || *(unsigned char *)(a1 + 81))
  {
    [*(id *)(a1 + 40) setHidden:0];
    [*(id *)(a1 + 48) setHidden:0];
    [(CKBalloonImageView *)v4 removeFromSuperview];
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        LODWORD(m.a) = 134217984;
        *(void *)((char *)&m.a + 4) = v17;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _animateStickerRepositionWithAssociatedChatItem - isLocalReposition || isWatchOS", (uint8_t *)&m, 0xCu);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke_911;
    v20[3] = &unk_1E5623170;
    id v21 = v4;
    id v22 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 32);
    id v23 = v18;
    uint64_t v24 = v19;
    id v25 = *(id *)(a1 + 72);
    [(UIView *)v21 ck_performHideAnimated:1 completion:v20];
  }
}

void __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke_911(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  [*(id *)(a1 + 48) center];
  double v4 = v3;
  double v6 = v5;
  double v7 = [*(id *)(a1 + 56) view];
  objc_msgSend(v2, "convertPoint:toView:", v7, v4, v6);
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");

  [*(id *)(a1 + 48) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  memset(&v27, 0, sizeof(v27));
  double v8 = [*(id *)(a1 + 48) layer];
  double v9 = v8;
  if (v8) {
    [v8 transform];
  }
  else {
    memset(&v25, 0, sizeof(v25));
  }
  CATransform3DGetAffineTransform(&transform, &v25);
  CGAffineTransformDecompose(&v27, &transform);

  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeRotation(&v24, v27.rotation);
  CGAffineTransform m = v24;
  CATransform3DMakeAffineTransform(&v23, &m);
  double v10 = [*(id *)(a1 + 32) layer];
  CATransform3D v21 = v23;
  [v10 setTransform:&v21];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke_2;
  v15[3] = &unk_1E5623170;
  id v11 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void **)(a1 + 64);
  id v18 = v12;
  uint64_t v19 = v13;
  id v20 = v14;
  objc_msgSend(v11, "ck_performRevealAnimated:completion:", 1, v15);
}

void __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 40) setHidden:0];
  [*(id *)(a1 + 48) removeFromSuperview];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 56);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in _animateStickerRepositionWithAssociatedChatItem - ck_performRevealAnimated completion", (uint8_t *)&v4, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __123__CKTranscriptCollectionViewController__animateStickerRepositionWithAssociatedChatItem_associatedCell_associatedIndexPath___block_invoke_914(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [v1 bounds];

  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

- (id)_sanitizeInsertedIndices:(id)a3 inChatItems:(id)a4 withIMChatItems:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (__CFString *)v8;
  id v12 = v11;
  if ([(__CFString *)v11 count])
  {
    unint64_t v13 = [(__CFString *)v11 firstIndex];
    id v12 = v11;
    if (v13 > [v9 count])
    {
      uint64_t v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        if ([(CKTranscriptCollectionViewController *)self isInline]) {
          CATransform3D v21 = @"YES";
        }
        else {
          CATransform3D v21 = @"NO";
        }
        id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        int v23 = 138412802;
        CGAffineTransform v24 = v21;
        __int16 v25 = 2112;
        CATransform3D v26 = v11;
        __int16 v27 = 2112;
        CGAffineTransform v28 = v22;
        _os_log_error_impl(&dword_18EF18000, v14, OS_LOG_TYPE_ERROR, "(Inline: %@) Attempted to insert at indices: %@ into chatItems (count): %@", (uint8_t *)&v23, 0x20u);
      }
      char v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController _sanitizeInsertedIndices:inChatItems:withIMChatItems:](self, v15);
      }

      id v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController _sanitizeInsertedIndices:inChatItems:withIMChatItems:](v10, v16);
      }

      uint64_t v17 = [v9 count];
      uint64_t v18 = [(__CFString *)v11 lastIndex];
      objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v17, v18 - v17 + 1);
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412290;
          CGAffineTransform v24 = v12;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "\tRevised indices for inserting: %@", (uint8_t *)&v23, 0xCu);
        }
      }
    }
  }

  return v12;
}

- (void)_identifyIndicesNeedingCustomAnimationsForIMChatItems:(id)a3 inserted:(id)a4 removed:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    id v25 = 0;
    id v26 = 0;
    [(CKTranscriptCollectionViewController *)self _indicesOfTranscriptPluginChatItemRemoveAndInsertedWithoutFading:v8 inserted:v9 removed:v10 outInsertIndices:&v26 outRemoveIndices:&v25];
    id v11 = v26;
    id v12 = v25;
    if ([v12 count] && IMOSLoggingEnabled())
    {
      unint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        CGAffineTransform v28 = v14;
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "The indices to remove WITHOUT animation are (count: %@): %@", buf, 0x16u);
      }
    }
    char v15 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
    [v15 setIndicesOfChatItemsToBeRemovedWithoutFading:v12];

    if ([v11 count] && IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        CGAffineTransform v28 = v17;
        __int16 v29 = 2112;
        id v30 = v11;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "The indices to insert WITHOUT animation are (count: %@): %@", buf, 0x16u);
      }
    }
    uint64_t v18 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
    [v18 setIndicesOfChatItemsToBeInsertedWithoutFading:v11];

    id v24 = 0;
    [(CKTranscriptCollectionViewController *)self _indicesOfReplyChatItemsToInsertWithoutFading:v8 inserted:v9 outInsertIndices:&v24];
    id v19 = v24;
    if ([v19 count] && IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        if ([(CKTranscriptCollectionViewController *)self isInline]) {
          CATransform3D v21 = @"YES";
        }
        else {
          CATransform3D v21 = @"NO";
        }
        id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
        *(_DWORD *)buf = 138412802;
        CGAffineTransform v28 = v21;
        __int16 v29 = 2112;
        id v30 = v22;
        __int16 v31 = 2112;
        id v32 = v19;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "(Inline: %@) The indices of reply items to insert with custom animation are (count: %@): %@", buf, 0x20u);
      }
    }
    int v23 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
    [v23 setIndicesOfReplyChatItemsToBeInserted:v19];
  }
}

- (id)indexPathForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4
{
  return [(CKTranscriptCollectionViewController *)self indexPathForMessageGUID:a3 messagePartIndex:a4 useAssociatedSection:0];
}

- (id)indexPathForAssociatedMessageGUID:(id)a3 messagePartIndex:(int64_t)a4
{
  return [(CKTranscriptCollectionViewController *)self indexPathForMessageGUID:a3 messagePartIndex:a4 useAssociatedSection:1];
}

- (id)indexPathForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4 useAssociatedSection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5) {
    [(CKTranscriptCollectionViewController *)self associatedChatItems];
  }
  else {
  id v9 = [(CKTranscriptCollectionViewController *)self chatItems];
  }
  id v10 = v9;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = objc_msgSend(v9, "__ck_indexesOfPartsOfMessageWithGUID:", v8);
    uint64_t v12 = [v11 firstIndex];
  }
  else
  {
    uint64_t v12 = objc_msgSend(v9, "__ck_indexOfPartOfMessageGUID:withMessagePartIndex:", v8, a4);
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:v5];
  }

  return v13;
}

- (id)indexPathForChatItemGUID:(id)a3
{
  return [(CKTranscriptCollectionViewController *)self indexPathForChatItemGUID:a3 useAssociatedSection:0];
}

- (id)indexPathForAssociatedChatItemGUID:(id)a3
{
  return [(CKTranscriptCollectionViewController *)self indexPathForChatItemGUID:a3 useAssociatedSection:1];
}

- (id)indexPathForChatItemGUID:(id)a3 useAssociatedSection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(CKTranscriptCollectionViewController *)self associatedChatItems];
  }
  else {
  double v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  unint64_t v13 = __86__CKTranscriptCollectionViewController_indexPathForChatItemGUID_useAssociatedSection___block_invoke;
  uint64_t v14 = &unk_1E5622268;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v17;
  [v7 enumerateObjectsUsingBlock:&v11];
  id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v18[3], v4, v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);

  return v9;
}

void __86__CKTranscriptCollectionViewController_indexPathForChatItemGUID_useAssociatedSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v7 = [a2 IMChatItem];
  id v8 = [v7 guid];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)updateTranscriptScrollIntentForSendAnimationContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received request to update the transcriptScrollIntent for the sendAnimationContext: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v6 = [v4 messages];
  double v7 = objc_msgSend(v6, "__imArrayByFilteringWithBlock:", &__block_literal_global_919_1);
  id v8 = [v7 firstObject];
  BOOL v9 = v8 == 0;

  id v10 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v11 = v10;
  if (v9) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 6;
  }
  [v10 setTranscriptScrollIntent:v12];

  unint64_t v13 = +[CKScrollViewAnimationProperties systemDefaultScrollAnimation];
  [(CKTranscriptCollectionViewController *)self enforceTranscriptScrollIntentWithAnimationProperties:v13];
}

BOOL __92__CKTranscriptCollectionViewController_updateTranscriptScrollIntentForSendAnimationContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleType] == 2;
}

- (int64_t)_computeDesiredScrollIntentForInsertedUnreadChatItem:(id)a3 insertedLocalUnsentChatItem:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v9 = [v8 transcriptScrollIntent];

  if (v9 != 6 && v9)
  {
    unint64_t v12 = v9;
    if (!v7) {
      goto LABEL_20;
    }
  }
  else
  {
    if (!v7) {
      goto LABEL_20;
    }
    id v10 = [v7 messageItem];
    uint64_t v11 = [v10 scheduleType];

    if (v11 == 2) {
      unint64_t v12 = 6;
    }
    else {
      unint64_t v12 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = [WeakRetained transcriptCollectionViewControllerShouldScrollToBottomForLocalSentMessage:self];

  if (v14)
  {
    id v15 = [v7 messageItem];
    uint64_t v16 = [v15 scheduleType];

    if (v16 == 2) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = CKDebugNameForCKTranscriptScrollIntent(v9);
        int v21 = 138412546;
        id v22 = v18;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Computed new scrollIntent %@ for newly inserted unsent chatItem: %@.", (uint8_t *)&v21, 0x16u);
      }
LABEL_19:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = CKDebugNameForCKTranscriptScrollIntent(v12);
      int v21 = 138412290;
      id v22 = v19;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Short-circuiting to not scroll to %@ because of a reply transcript being up.", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

- (void)scrollToCurrentTimeAnimated:(BOOL)a3 withDuration:(double)a4 animationCurve:(int64_t)a5 withCompletion:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v11 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v11 setTranscriptScrollIntent:0];

  unint64_t v12 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
  if (IMOSLoggingEnabled())
  {
    unint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v23 = self;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in scrollToCurrentTimeAnimated", buf, 0xCu);
    }
  }
  dispatch_group_enter(v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke;
  v16[3] = &unk_1E56277D0;
  v16[4] = self;
  uint64_t v17 = v12;
  BOOL v21 = a3;
  id v18 = v10;
  int64_t v19 = a5;
  double v20 = a4;
  char v14 = v12;
  id v15 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) collectionView];
  uint64_t v3 = [v2 transcriptScrollIntent];

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v5;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in scrollToCurrentTimeAnimated – transcriptScrollIntent != CKTranscriptScrollIntentCurrentTime", buf, 0xCu);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v6 = [*(id *)(a1 + 32) collectionView];
  uint64_t v7 = [v6 isScrollEnabled];

  if ((v7 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v11;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in scrollToCurrentTimeAnimated – !isScrollEnabled", buf, 0xCu);
      }
      goto LABEL_12;
    }
LABEL_13:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    return;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v8 = *(void *)(a1 + 56) << 16;
    uint64_t v9 = (void *)MEMORY[0x1E4F42FF0];
    double v10 = *(double *)(a1 + 64);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke_920;
    v18[3] = &unk_1E5620C40;
    uint64_t v19 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke_2;
    v15[3] = &unk_1E56277A8;
    void v15[4] = v19;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    [v9 animateWithDuration:v8 delay:v18 options:v15 animations:v10 completion:0.0];
  }
  else
  {
    unint64_t v12 = +[CKScrollViewAnimationProperties unanimated];
    [*(id *)(a1 + 32) enforceTranscriptScrollIntentWithAnimationProperties:v12];
    if (IMOSLoggingEnabled())
    {
      unint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v14;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in scrollToCurrentTimeAnimated – enforceTranscriptScrollIntentWithAnimationProperties unanimated", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke_920(uint64_t a1)
{
  id v2 = +[CKScrollViewAnimationProperties inheritedAnimation];
  [*(id *)(a1 + 32) enforceTranscriptScrollIntentWithAnimationProperties:v2];
}

void __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in scrollToCurrentTimeAnimated – enforceTranscriptScrollIntentWithAnimationProperties completion", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke_921;
  block[3] = &unk_1E5620F48;
  id v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __111__CKTranscriptCollectionViewController_scrollToCurrentTimeAnimated_withDuration_animationCurve_withCompletion___block_invoke_921(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scrollToBottomAnimated:(BOOL)a3 withDuration:(double)a4 animationCurve:(int64_t)a5 insertedUnreadMessage:(id)a6 insertedLocalUnsentChatItem:(id)a7 withCompletion:(id)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v17 setTranscriptScrollIntent:6];
  id v18 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v32 = self;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in scrollToBottomAnimated", buf, 0xCu);
    }
  }
  dispatch_group_enter(v18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__CKTranscriptCollectionViewController_scrollToBottomAnimated_withDuration_animationCurve_insertedUnreadMessage_insertedLocalUnsentChatItem_withCompletion___block_invoke;
  block[3] = &unk_1E56277F8;
  id v24 = v17;
  uint64_t v25 = self;
  id v26 = v18;
  id v27 = v16;
  BOOL v30 = a3;
  double v28 = a4;
  int64_t v29 = a5;
  double v20 = v18;
  id v21 = v16;
  id v22 = v17;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __156__CKTranscriptCollectionViewController_scrollToBottomAnimated_withDuration_animationCurve_insertedUnreadMessage_insertedLocalUnsentChatItem_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) transcriptScrollIntent] == 6)
  {
    id v2 = [*(id *)(a1 + 40) delegate];
    [v2 transcriptCollectionViewControllerWillScrollToBottom:*(void *)(a1 + 40)];

    uint64_t v3 = [*(id *)(a1 + 40) collectionView];
    int v4 = [v3 isScrollEnabled];

    if (v4)
    {
      [*(id *)(a1 + 32) layoutIfNeeded];
      objc_msgSend(*(id *)(a1 + 32), "__ck_bottomOffset");
      double v6 = v5;
      double v8 = v7;
      [*(id *)(a1 + 32) contentOffset];
      if (v10 != v6 || v9 != v8)
      {
        if (*(unsigned char *)(a1 + 80))
        {
          uint64_t v11 = +[CKScrollViewAnimationProperties animatedWithDuration:*(void *)(a1 + 72) animationCurve:*(double *)(a1 + 64)];
          objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animationProperties:", v11, v6, v8);
          if (IMOSLoggingEnabled())
          {
            unint64_t v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              uint64_t v13 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 134217984;
              uint64_t v24 = v13;
              _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in scrollToBottomAnimated - content offset change timer", buf, 0xCu);
            }
          }
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          dispatch_time_t v14 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __156__CKTranscriptCollectionViewController_scrollToBottomAnimated_withDuration_animationCurve_insertedUnreadMessage_insertedLocalUnsentChatItem_withCompletion___block_invoke_922;
          block[3] = &unk_1E5622BA8;
          id v15 = *(void **)(a1 + 48);
          void block[4] = *(void *)(a1 + 40);
          id v21 = v15;
          id v22 = *(id *)(a1 + 56);
          dispatch_after(v14, MEMORY[0x1E4F14428], block);

          goto LABEL_17;
        }
        objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", v6, v8);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_17:
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = v19;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in scrollToBottomAnimated - without changing content offset", buf, 0xCu);
      }
    }
    goto LABEL_21;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v17;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in scrollToBottomAnimated – transcriptScrollIntent != CKTranscriptScrollIntentBelowFutureMessages", buf, 0xCu);
    }
  }
LABEL_21:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __156__CKTranscriptCollectionViewController_scrollToBottomAnimated_withDuration_animationCurve_insertedUnreadMessage_insertedLocalUnsentChatItem_withCompletion___block_invoke_922(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in scrollToBottomAnimated - content offset change timer", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)scrollToTopOfLastBubbleCellWithAnimationProperties:(id)a3
{
  id v4 = a3;
  if ([(CKTranscriptCollectionView *)self->_collectionView isScrollEnabled])
  {
    int v5 = [(CKTranscriptCollectionViewController *)self indexPathOfLastBubble];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      uint64_t v7 = [(CKTranscriptCollectionViewController *)self collectionView];
      [(CKTranscriptCollectionViewController *)self topScrollPositionForIndexPath:v5];
      objc_msgSend(v7, "setContentOffset:animationProperties:", v4);
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)indexPathOfLastBubble
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__34;
  double v10 = __Block_byref_object_dispose__34;
  id v11 = 0;
  id v2 = [(CKTranscriptCollectionViewController *)self chatItems];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__CKTranscriptCollectionViewController_indexPathOfLastBubble__block_invoke;
  v5[3] = &unk_1E5623C50;
  v5[4] = &v6;
  [v2 enumerateObjectsWithOptions:2 usingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__CKTranscriptCollectionViewController_indexPathOfLastBubble__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

- (CGPoint)topScrollPositionForIndexPath:(id)a3
{
  id v4 = a3;
  int v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  objc_msgSend(v5, "__ck_offsetForTopOfCellAtIndexPath:hidingCellAtIndexPath:", v4, 0);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)playEffectsIfNecessaryWithInsertedUnreadMessage:(id)a3 insertedLocalUnsentChatItem:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (v19)
  {
    BOOL v7 = [(CKTranscriptCollectionViewController *)self _allowsEffectAutoPlayback];
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v7 = 0;
    if (v6)
    {
LABEL_3:
      double v8 = [(CKTranscriptCollectionViewController *)self delegate];
      if ([v8 transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:self])
      {
        double v9 = [v6 message];
        double v10 = [v9 expressiveSendStyleID];
        if (v10) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = [(CKTranscriptCollectionViewController *)self _allowsEffectAutoPlayback];
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      if (v7) {
        goto LABEL_13;
      }
LABEL_8:
      id v12 = 0;
      goto LABEL_21;
    }
  }
  BOOL v11 = 0;
  if (!v7) {
    goto LABEL_8;
  }
LABEL_13:
  uint64_t v13 = [v19 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_time_t v14 = [v13 message];
    id v15 = [v14 expressiveSendStyleID];
    if (+[CKImpactEffectManager identifierIsAnimatedImpactEffect:v15])
    {
      id v12 = v19;
      id v16 = [(CKTranscriptCollectionViewController *)self chatItems];
      uint64_t v17 = [v16 indexOfObject:v12];

      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v17];
        [(CKTranscriptCollectionViewController *)self setHiddenBalloonViews:v18];
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

LABEL_21:
  [(CKTranscriptCollectionViewController *)self playImpactEffectIfNecessaryAutoplayingOutgoingEffect:v11 autoplayingIncomingEffect:v7 impactEffectChatItem:v12];
  [(CKTranscriptCollectionViewController *)self playFullscreenEffectIfNecessaryAutoplayingOutgoingEffect:v11 autoplayingIncomingEffect:v7 insertedUnreadMessage:v19 insertedLocalUnsentChatItem:v6];
}

- (void)playImpactEffectIfNecessaryAutoplayingOutgoingEffect:(BOOL)a3 autoplayingIncomingEffect:(BOOL)a4 impactEffectChatItem:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = v8;
  if (v6 || v5)
  {
    if (v8)
    {
      double v10 = [(CKTranscriptCollectionViewController *)self presentedViewController];

      if (!v10)
      {
        BOOL v11 = [v9 IMChatItem];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v11 message];
          uint64_t v13 = [v9 message];
          dispatch_time_t v14 = [v13 expressiveSendStyleID];
          BOOL v15 = +[CKImpactEffectManager identifierShouldPlayInWindow:v14];

          if (!v15)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __140__CKTranscriptCollectionViewController_playImpactEffectIfNecessaryAutoplayingOutgoingEffect_autoplayingIncomingEffect_impactEffectChatItem___block_invoke;
            block[3] = &unk_1E5620C40;
            void block[4] = self;
            dispatch_async(MEMORY[0x1E4F14428], block);
          }
          id v16 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
          v20[0] = v12;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
          [v16 animateMessages:v17];

          id v18 = [(CKTranscriptCollectionViewController *)self chat];
          [v18 markChatItemAsPlayedExpressiveSend:v11];
        }
      }
    }
  }
}

uint64_t __140__CKTranscriptCollectionViewController_playImpactEffectIfNecessaryAutoplayingOutgoingEffect_autoplayingIncomingEffect_impactEffectChatItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHiddenBalloonViews:0];
}

- (void)playFullscreenEffectIfNecessaryAutoplayingOutgoingEffect:(BOOL)a3 autoplayingIncomingEffect:(BOOL)a4 insertedUnreadMessage:(id)a5 insertedLocalUnsentChatItem:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v8)
  {
    id v12 = self;
    id v13 = v11;
LABEL_9:
    [(CKTranscriptCollectionViewController *)v12 startFullscreenEffectIfNeededForChatItem:v13];
    goto LABEL_10;
  }
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      dispatch_time_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v15 = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Calling startFullscreenEffectIfNeededForChatItem for incomingEffect", v15, 2u);
      }
    }
    id v12 = self;
    id v13 = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (id)newChatItemsWithNotifications:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__CKTranscriptCollectionViewController_newChatItemsWithNotifications___block_invoke;
  v4[3] = &unk_1E5627820;
  void v4[4] = self;
  objc_msgSend(a3, "__imArrayByApplyingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __70__CKTranscriptCollectionViewController_newChatItemsWithNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)[*(id *)(a1 + 32) newChatItemWithNotification:a2];

  return v2;
}

- (id)newChatItemWithNotification:(id)a3
{
  id v4 = a3;
  [(CKTranscriptCollectionViewController *)self _fullMaxWidth];
  [(CKTranscriptCollectionViewController *)self balloonMaxWidth];
  BOOL v5 = +[CKChatItem chatItemWithNotification:balloonMaxWidth:fullMaxWidth:](CKChatItem, "chatItemWithNotification:balloonMaxWidth:fullMaxWidth:", v4);

  return v5;
}

- (id)newChatItemsWithIMChatItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  BOOL v6 = [(CKTranscriptCollectionViewController *)self delegate];
  BOOL v7 = [v6 traitCollectionForTranscriptCollectionViewController:self];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    unint64_t v12 = 0x1E4F28000uLL;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v19 = [*(id *)(v12 + 2816) currentHandler];
          id v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v16);
          [v19 handleFailureInMethod:a2, self, @"CKTranscriptCollectionViewController.m", 9480, @"Detected chat item with invalid type. Expected %@ to be an instance of %@.", v14, v17 object file lineNumber description];

          unint64_t v12 = 0x1E4F28000;
        }
        id v15 = [(CKTranscriptCollectionViewController *)self newChatItemWithIMChatItem:v14 traitCollection:v7];
        if (v15) {
          [v5 addObject:v15];
        }

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)newChatItemWithIMChatItem:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CKTranscriptCollectionViewController *)self _fullMaxWidth];
    double v9 = v8;
    [(CKTranscriptCollectionViewController *)self balloonMaxWidth];
    uint64_t v11 = +[CKChatItem chatItemWithIMChatItem:v6 balloonMaxWidth:v7 fullMaxWidth:[(CKTranscriptCollectionViewController *)self isInline] transcriptTraitCollection:v10 overlayLayout:v9];
    unint64_t v12 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
    [v11 setTranscriptIdentifier:v12];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_diffAssociatedItemsWithOldAssociatedItems:(id)a3 removedAssociatedIndexes:(id *)a4 insertedAssociatedIndexes:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
  double v10 = (void *)v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    if (v10) {
      goto LABEL_3;
    }
  }
  double v10 = [MEMORY[0x1E4F1CA48] array];
LABEL_3:
  uint64_t v11 = [v10 differenceFromArray:v8 withOptions:0 usingEquivalenceTest:&__block_literal_global_933_1];
  IMIndexesFromOrderedCollectionDifference();
  id v12 = 0;
  id v13 = 0;
  uint64_t v14 = v13;
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v12;
  }
}

uint64_t __134__CKTranscriptCollectionViewController__diffAssociatedItemsWithOldAssociatedItems_removedAssociatedIndexes_insertedAssociatedIndexes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:");
}

- (void)setChatItems:(id)a3 removedAssociatedIndexes:(id *)a4 insertedAssociatedIndexes:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v10 = [v9 isConsolidatedChatItemsEnabled];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    id v12 = (void *)[v11 copy];

    [(CKTranscriptCollectionViewController *)self setChatItems:v8];
    id v15 = 0;
    [(CKTranscriptCollectionViewController *)self _diffAssociatedItemsWithOldAssociatedItems:v12 removedAssociatedIndexes:a4 insertedAssociatedIndexes:&v15];
    id v13 = v15;
    if ([v13 count])
    {
      uint64_t v14 = [(CKTranscriptCollectionViewController *)self delegate];
      [v14 transcriptCollectionViewControllerDidInsertAssociatedChatItem:self];
    }
    if (a5) {
      *a5 = v13;
    }
  }
}

- (void)setChatItems:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  BOOL v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v6 = [v5 isConsolidatedChatItemsEnabled];

  if ((v6 & 1) == 0)
  {
    if ([(CKTranscriptCollectionViewController *)self isSettingChatItems])
    {
      id v7 = IMLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[CKTranscriptCollectionViewController setChatItems:]();
      }
    }
    [(CKTranscriptCollectionViewController *)self setSettingChatItems:1];
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = NSNumber;
        char v10 = [(CKTranscriptCollectionViewController *)self chatItems];
        uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v4, "count"));
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Setting chatItems, existing count: %@, new count: %@", buf, 0x16u);
      }
    }
    if (self->_chatItems == v4) {
      goto LABEL_21;
    }
    id v13 = (void *)[(NSArray *)v4 copy];
    objc_storeStrong((id *)&self->_chatItems, v13);
    uint64_t v14 = [(CKTranscriptCollectionViewController *)self chat];
    if (!CKIsRunningUnitTests())
    {
      uint64_t v15 = [v14 lastFinishedMessageID];
      id v16 = [v14 lastFinishedMessageDate];
      objc_msgSend(v14, "__ck_updateWatermarkToMessageID:date:", v15, v16);
    }
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    id v18 = [(CKTranscriptCollectionViewController *)self speakerTransferGUID];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v36 = 0;
    char v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __53__CKTranscriptCollectionViewController_setChatItems___block_invoke;
    v28[3] = &unk_1E5627868;
    id v19 = v18;
    uint64_t v33 = buf;
    id v34 = &v40;
    uint64_t v35 = &v36;
    id v29 = v19;
    BOOL v30 = self;
    id v20 = v17;
    id v31 = v20;
    id v21 = v13;
    id v32 = v21;
    [v21 enumerateObjectsUsingBlock:v28];
    [(CKTranscriptCollectionViewController *)self setAssociatedChatItems:v20];
    if (*(void *)(*(void *)&buf[8] + 24) == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = v41[3];
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = v37[3];
        *(void *)(*(void *)&buf[8] + 24) = v23;
        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v24 = v19;
          id v19 = 0;
LABEL_20:

          [(CKTranscriptCollectionViewController *)self setSpeakerTransferGUID:v19];
          id v27 = [(CKTranscriptCollectionViewController *)self delegate];
          [v27 transcriptCollectionViewControllerDidSetChatItems:self];

          _Block_object_dispose(&v36, 8);
          _Block_object_dispose(&v40, 8);
          _Block_object_dispose(buf, 8);

LABEL_21:
          [(CKTranscriptCollectionViewController *)self setSettingChatItems:0];
          goto LABEL_22;
        }
      }
      else
      {
        *(void *)(*(void *)&buf[8] + 24) = v22;
      }
    }
    -[NSArray objectAtIndex:](self->_chatItems, "objectAtIndex:");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v24;
      uint64_t v25 = [v24 mediaObject];
      uint64_t v26 = [v25 transferGUID];

      id v19 = (id)v26;
    }
    goto LABEL_20;
  }
LABEL_22:
}

void __53__CKTranscriptCollectionViewController_setChatItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 mediaObject];
    char v8 = [v7 shouldSuppressPreview];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = *(void **)(a1 + 32);
      char v10 = [v6 mediaObject];
      uint64_t v11 = [v10 transferGUID];
      LODWORD(v9) = [v9 isEqualToString:v11];

      if (v9) {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
      }
      if (([v6 isFromMe] & 1) == 0)
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
          && ([v6 isPlayed] & 1) == 0)
        {
          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a3;
        }
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a3;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    id v12 = [*(id *)(a1 + 40) conversation];
    id v13 = [v12 chat];
    id v6 = [v13 guid];

    uint64_t v14 = [*(id *)(a1 + 40) conversation];
    uint64_t v15 = [v14 recipientStrings];

    id v16 = [*(id *)(a1 + 40) conversation];
    uint64_t v17 = [v16 isBusinessConversation];
    id v18 = [*(id *)(a1 + 40) transcriptIdentifier];
    [v5 configureWithConversationID:v6 recipients:v15 isBusiness:v17 context:v18];
  }
LABEL_13:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v5;
    id v20 = v19;
    if (*(void *)(a1 + 48))
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v21 = objc_msgSend(v19, "visibleAssociatedMessageChatItems", 0);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v51;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v51 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(a1 + 48) addObject:*(void *)(*((void *)&v50 + 1) + 8 * v25++)];
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v23);
      }

      uint64_t v26 = [v20 messageHighlightChatItem];

      if (v26)
      {
        id v27 = *(void **)(a1 + 48);
        double v28 = [v20 messageHighlightChatItem];
        [v27 addObject:v28];
      }
    }
    if (!a3) {
      goto LABEL_40;
    }
    id v29 = [v20 visibleAssociatedMessageChatItems];
    uint64_t v30 = [v29 count];

    if (!v30) {
      goto LABEL_40;
    }
    id v31 = [*(id *)(a1 + 56) objectAtIndex:a3 - 1];
    id v32 = [v20 IMChatItem];
    int v33 = [v32 contiguousType];

    id v34 = [v31 IMChatItem];
    int v35 = [v34 contiguousType];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v33 & 0xFE) != 2)
    {
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    id v36 = v31;
    char v37 = [v36 visibleAssociatedMessageChatItems];
    uint64_t v38 = [v37 count];

    if (v38)
    {
      uint64_t v39 = +[CKUIBehavior sharedBehaviors];
      [v39 messageAcknowledgmentTranscriptBalloonRelativePosition];
      double v41 = v40;

      [v36 size];
      double v43 = v41 + v42;
      [v20 size];
      BOOL v45 = v43 < v44 - v41;
    }
    else
    {
      BOOL v45 = 0;
    }
    [v20 size];
    double v47 = v46;
    [v36 size];
    if (v45 || v47 < v48)
    {
      if (v35 == 2)
      {
        [v36 setContiguousTypeOverride:3];
        BOOL v49 = 0;
        goto LABEL_37;
      }
      if (v35 == 1)
      {
        BOOL v49 = v33 == 2;
        [v36 setContiguousTypeOverride:0];
LABEL_37:
        [v20 setContiguousTypeOverride:v49];
      }
    }

    goto LABEL_39;
  }
LABEL_41:
}

- (void)loadEarlierMessagesForConversation
{
  id v2 = [(CKTranscriptCollectionViewController *)self conversation];
  [v2 loadMoreMessages];
}

- (void)fetchEarlierMessagesForConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self conversation];
  [v5 fetchMoreMessages:v4];
}

- (void)loadRecentMessagesForConversation
{
  id v2 = [(CKTranscriptCollectionViewController *)self conversation];
  [v2 loadMoreMessagesAfterLastMessage];
}

- (void)fetchRecentMessagesForConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self conversation];
  [v5 fetchMoreMessagesAfterLastMessage:v4];
}

- (void)loadEarlierMessages
{
  [(CKTranscriptCollectionViewController *)self setIsLoadingMoreMessages:1];
  id v3 = IMLogHandleForCategory();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "historyLoading", "", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke;
  v8[3] = &unk_1E56278E0;
  v8[4] = self;
  uint64_t v9 = v6;
  os_signpost_id_t v10 = v4;
  id v7 = v6;
  [(CKTranscriptCollectionViewController *)self fetchEarlierMessagesForConversation:v8];
}

void __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) collectionView];
  id v5 = [*(id *)(a1 + 32) collectionViewLayout];
  [v4 contentOffset];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  [v4 contentSize];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = *(id *)(a1 + 40);
  uint64_t v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 48);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "updateTranscript", "", buf, 2u);
  }

  uint64_t v17 = *(void **)(a1 + 32);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke_934;
  v36[3] = &unk_1E5627890;
  id v37 = v4;
  id v39 = v3;
  id v18 = *(id *)(a1 + 40);
  id v20 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  id v38 = v18;
  uint64_t v40 = v19;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke_935;
  v26[3] = &unk_1E56278B8;
  uint64_t v31 = v7;
  uint64_t v32 = v9;
  uint64_t v33 = v11;
  uint64_t v34 = v13;
  id v27 = v5;
  id v28 = v37;
  uint64_t v29 = *(void *)(a1 + 32);
  id v21 = v20;
  uint64_t v22 = *(void *)(a1 + 48);
  id v30 = v21;
  uint64_t v35 = v22;
  id v23 = v37;
  id v24 = v5;
  id v25 = v3;
  [v17 updateTranscript:v36 animated:0 completion:v26];
}

void __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke_934(uint64_t a1)
{
  [*(id *)(a1 + 32) beginDisablingTranscriptDynamicsForReason:@"HistoryLoading"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(id *)(a1 + 40);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v3, OS_SIGNPOST_INTERVAL_END, v4, "updateTranscript", "", v5, 2u);
  }
}

void __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke_935(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareLayout];
  double v2 = *(double *)(a1 + 64);
  double v3 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) collectionViewContentSize];
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", v2, v3 + v4 - *(double *)(a1 + 88));
  [*(id *)(a1 + 48) setIsLoadingMoreMessages:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke_2;
  block[3] = &unk_1E5620E38;
  id v8 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 96);
  id v9 = v5;
  uint64_t v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__CKTranscriptCollectionViewController_loadEarlierMessages__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endDisablingTranscriptDynamicsForReason:@"HistoryLoading"];
  double v2 = *(id *)(a1 + 40);
  double v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v3, OS_SIGNPOST_INTERVAL_END, v4, "historyLoading", "", v5, 2u);
  }
}

- (void)loadRecentMessages
{
  [(CKTranscriptCollectionViewController *)self setIsLoadingMoreMessages:1];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__CKTranscriptCollectionViewController_loadRecentMessages__block_invoke;
  v3[3] = &unk_1E5626FA0;
  v3[4] = self;
  [(CKTranscriptCollectionViewController *)self fetchRecentMessagesForConversation:v3];
}

void __58__CKTranscriptCollectionViewController_loadRecentMessages__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CKTranscriptCollectionViewController_loadRecentMessages__block_invoke_2;
  v7[3] = &unk_1E5620F48;
  id v8 = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CKTranscriptCollectionViewController_loadRecentMessages__block_invoke_3;
  v5[3] = &unk_1E5620C40;
  id v6 = *(id *)(a1 + 32);
  id v4 = v3;
  [v6 updateTranscript:v7 animated:0 completion:v5];
}

uint64_t __58__CKTranscriptCollectionViewController_loadRecentMessages__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__CKTranscriptCollectionViewController_loadRecentMessages__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsLoadingMoreMessages:0];
}

- (void)_loadMessagesIfNeededWithTargetContentOffset:(CGPoint)a3 forKeyboardNavigation:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (-[CKTranscriptCollectionViewController _isHistoryLoadingNeededForDirection:withTargetContentOffset:forKeyboardNavigation:](self, "_isHistoryLoadingNeededForDirection:withTargetContentOffset:forKeyboardNavigation:", 0, a4))
  {
    [(CKTranscriptCollectionViewController *)self loadEarlierMessages];
  }
  if (-[CKTranscriptCollectionViewController _isHistoryLoadingNeededForDirection:withTargetContentOffset:forKeyboardNavigation:](self, "_isHistoryLoadingNeededForDirection:withTargetContentOffset:forKeyboardNavigation:", 1, v4, x, y))
  {
    [(CKTranscriptCollectionViewController *)self loadRecentMessages];
  }
}

- (BOOL)_isHistoryLoadingNeededForDirection:(int64_t)a3 withTargetContentOffset:(CGPoint)a4 forKeyboardNavigation:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([(CKTranscriptCollectionViewController *)self isLoadingMoreMessages]) {
    goto LABEL_5;
  }
  id v9 = [(CKTranscriptCollectionViewController *)self chat];
  char v10 = [v9 isHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B910]];

  if (v10) {
    goto LABEL_5;
  }
  uint64_t v11 = +[CKUIBehavior sharedBehaviors];
  int v12 = [v11 showsLoadMoreItem];

  if (!v12
    || ([(CKTranscriptCollectionViewController *)self __CurrentTestName],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 length],
        v13,
        v14))
  {
LABEL_5:
    LOBYTE(v15) = 0;
  }
  else if (-[CKTranscriptCollectionViewController isLoadMoreSpinnerVisibleForDirection:](self, "isLoadMoreSpinnerVisibleForDirection:", a3)|| (BOOL v15 = -[CKTranscriptCollectionViewController isLoadMoreSpinnerAboutToBeVisibleForDirection:withTargetContentOffset:](self, "isLoadMoreSpinnerAboutToBeVisibleForDirection:withTargetContentOffset:", a3, x, y)))
  {
    LOBYTE(v15) = 1;
  }
  return v15;
}

- (void)loadMessagesIfNeededSkipValidation
{
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  -[CKTranscriptCollectionViewController _loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:](self, "_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:", 1, v5, v7);
}

- (id)loadMoreItemIndexPathForDirection:(int64_t)a3
{
  double v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  double v5 = v4;
  if (a3 == 1)
  {
    double v6 = [v4 lastObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = 0;
      goto LABEL_10;
    }
    uint64_t v8 = [v5 count] - 1;
    goto LABEL_7;
  }
  if (a3)
  {
    id v9 = 0;
    goto LABEL_11;
  }
  double v6 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v8 = 0;
  id v9 = 0;
  if (isKindOfClass)
  {
LABEL_7:
    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:0];
  }
LABEL_10:

LABEL_11:

  return v9;
}

- (BOOL)isLoadMoreSpinnerVisibleForDirection:(int64_t)a3
{
  if (![(CKViewController *)self appeared]) {
    return 0;
  }
  double v5 = [(CKTranscriptCollectionViewController *)self loadMoreItemIndexPathForDirection:a3];
  if (v5)
  {
    double v6 = [(CKTranscriptCollectionViewController *)self collectionView];
    double v7 = [v6 cellForItemAtIndexPath:v5];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isLoadMoreSpinnerAboutToBeVisibleForDirection:(int64_t)a3 withTargetContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double v7 = [(CKTranscriptCollectionViewController *)self loadMoreItemIndexPathForDirection:a4.x];
  if (v7)
  {
    BOOL v8 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
    id v9 = [(CKTranscriptCollectionViewController *)self collectionView];
    [v9 frame];
    double v11 = v10;

    int v12 = [v8 layoutAttributesForItemAtIndexPath:v7];
    [v12 frame];
    if (a3 == 1)
    {
      if (y + v11 >= CGRectGetMinY(*(CGRect *)&v13) - v11)
      {
LABEL_5:
        BOOL v17 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    else if (!a3 && y <= v11 + CGRectGetMaxY(*(CGRect *)&v13))
    {
      goto LABEL_5;
    }
    BOOL v17 = 0;
    goto LABEL_9;
  }
  BOOL v17 = 0;
LABEL_10:

  return v17;
}

- (id)lastMessagePartChatItem
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__34;
  double v10 = __Block_byref_object_dispose__34;
  id v11 = 0;
  double v2 = [(CKTranscriptCollectionViewController *)self chatItems];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CKTranscriptCollectionViewController_lastMessagePartChatItem__block_invoke;
  v5[3] = &unk_1E5623C50;
  void v5[4] = &v6;
  [v2 enumerateObjectsWithOptions:2 usingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__CKTranscriptCollectionViewController_lastMessagePartChatItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)indexPathForBalloonView:(id)a3
{
  id v4 = a3;
  double v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v15 = 0;
  os_signpost_id_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__34;
  uint64_t v19 = __Block_byref_object_dispose__34;
  id v20 = 0;
  uint64_t v6 = [v5 indexPathsForVisibleItems];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CKTranscriptCollectionViewController_indexPathForBalloonView___block_invoke;
  v11[3] = &unk_1E56272B8;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  uint64_t v14 = &v15;
  [v6 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __64__CKTranscriptCollectionViewController_indexPathForBalloonView___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (objc_opt_respondsToSelector())
  {
    double v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v4 balloonView];

    if (v5 == v6) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
}

- (id)messagePartForBalloonView:(id)a3
{
  id v4 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:a3];
  double v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)balloonPluginForViewController:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
          id v12 = [v10 extensibleViewControllerForContext:v11];

          if (v12 == v4)
          {
            uint64_t v15 = [MEMORY[0x1E4F6BC18] sharedInstance];
            os_signpost_id_t v16 = [v10 IMChatItem];
            uint64_t v17 = [v16 type];
            id v18 = [v15 balloonPluginForBundleID:v17];

            id v14 = v18;
            goto LABEL_17;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKTranscriptCollectionViewController could not find balloon plugin corresponding to viewController %@", buf, 0xCu);
    }
  }
  id v14 = 0;
LABEL_17:

  return v14;
}

- (id)balloonViewForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 cellForItemAtIndexPath:v4];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 balloonView];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)balloonViewForChatItemGUID:(id)a3 getChatItem:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__CKTranscriptCollectionViewController_balloonViewForChatItemGUID_getChatItem___block_invoke;
  v17[3] = &unk_1E5627908;
  id v8 = v6;
  id v18 = v8;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v17];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [(CKTranscriptCollectionViewController *)self chatItems];
    id v12 = [v11 objectAtIndexedSubscript:v9];

    id v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:0];
    id v14 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v15 = [v14 cellForItemAtIndexPath:v13];

    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = [v15 balloonView];
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

uint64_t __79__CKTranscriptCollectionViewController_balloonViewForChatItemGUID_getChatItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 IMChatItem];
  uint64_t v7 = [v6 guid];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) isEqualToString:v7];
    *a4 = v8;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)balloonViewForChatItem:(id)a3
{
  id v4 = [a3 IMChatItem];
  double v5 = [v4 guid];
  id v6 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItemGUID:v5 getChatItem:0];

  return v6;
}

- (id)cellForChatItem:(id)a3
{
  id v4 = a3;
  double v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
    uint64_t v7 = [v8 cellForItemAtIndexPath:v9];
  }

  return v7;
}

- (id)chatItemForCell:(id)a3
{
  id v4 = a3;
  double v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 indexPathForCell:v4];

  if ([v6 section]) {
    [(CKTranscriptCollectionViewController *)self associatedChatItems];
  }
  else {
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  }
  unint64_t v8 = [v6 item];
  if ((v8 & 0x8000000000000000) != 0 || (unint64_t v9 = v8, v8 >= [v7 count]))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [v7 objectAtIndex:v9];
  }

  return v10;
}

- (id)chatItemForGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 IMChatItem];
        id v11 = [v10 guid];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)associatedChatItemForGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 IMChatItem];
        id v11 = [v10 guid];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)cellForAssociatedChatItem:(id)a3
{
  id v4 = a3;
  double v5 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = [(CKTranscriptCollectionViewController *)self collectionView];
    unint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:1];
    uint64_t v7 = [v8 cellForItemAtIndexPath:v9];
  }

  return v7;
}

- (void)updateTargetAlphaForVisibleChatItems
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [(CKTranscriptCollectionViewController *)self chatItemForCell:v9];
        id v11 = [(CKTranscriptCollectionViewController *)self delegate];
        [v11 transcriptCollectionViewController:self targetAlphaForChatItem:v10];
        double v13 = v12;

        if (v13 != -1.0)
        {
          if (objc_opt_respondsToSelector())
          {
            long long v14 = [v9 balloonView];
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_12;
            }
            long long v14 = [v9 imageView];
          }
          long long v15 = v14;
          [v14 setAlpha:v13];
        }
LABEL_12:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)selectChatItem:(id)a3
{
  id v12 = a3;
  id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v5 = [v4 indexOfObject:v12];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v5 inSection:0];
    [v6 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];

    unint64_t v8 = [(CKTranscriptCollectionViewController *)self selectionManager];
    unint64_t v9 = [v12 IMChatItem];
    id v10 = [v9 guid];
    id v11 = +[CKBalloonSelectionState balloonSelectionState:0];
    [v8 addSelectedMessageGuid:v10 selectionState:v11];
  }
}

- (void)updateLastAddressedHandleID:(id)a3 lastAddressedSIMID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CKTranscriptCollectionViewController *)self conversation];
  unint64_t v9 = [v8 chat];
  [v9 setLastAddressedHandleID:v6];

  id v10 = [(CKTranscriptCollectionViewController *)self conversation];
  id v11 = [v10 chat];
  [v11 setLastAddressedSIMID:v7];

  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      double v13 = [(CKTranscriptCollectionViewController *)self conversation];
      long long v14 = [v13 chat];
      long long v15 = [v14 guid];
      int v16 = 138412290;
      long long v17 = v15;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "We just updated the last addressed handle and sim id for chat %@ so refreshing service for sending.", (uint8_t *)&v16, 0xCu);
    }
  }
  [(CKConversation *)self->_conversation refreshServiceForSending];
}

- (void)touchUpInsideNotifyAnywayButton:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self conversation];
  id v6 = [v5 chat];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = [v6 guid];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "User selected notify anyway button in chat %@", (uint8_t *)&buf, 0xCu);
    }
  }
  unint64_t v9 = [(CKTranscriptCollectionViewController *)self chatItems];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__34;
  long long v23 = __Block_byref_object_dispose__34;
  id v24 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__CKTranscriptCollectionViewController_touchUpInsideNotifyAnywayButton___block_invoke;
  v17[3] = &unk_1E5623C50;
  void v17[4] = &buf;
  [v9 enumerateObjectsWithOptions:2 usingBlock:v17];
  id v10 = *(void **)(*((void *)&buf + 1) + 40);
  if (v10)
  {
    id v11 = [v10 IMChatItem];
    [v6 markChatItemAsNotifyRecipient:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = *(id *)(*((void *)&buf + 1) + 40);
      double v13 = [v12 message];
      if (v13)
      {
        long long v14 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
        long long v19 = v13;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
        [v14 animateMessages:v15 withEffectIdentifier:@"com.apple.MobileSMS.expressivesend.loud" beginAnimationFromTranscriptPresentedState:1];
      }
    }
  }
  else
  {
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = [v6 guid];
      -[CKTranscriptCollectionViewController touchUpInsideNotifyAnywayButton:](v16, (uint64_t)v18);
    }
  }

  _Block_object_dispose(&buf, 8);
}

void __72__CKTranscriptCollectionViewController_touchUpInsideNotifyAnywayButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  unint64_t v8 = [v7 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    id v10 = [v9 message];
    if ([v10 isFromMe])
    {
      if (([v10 wasDeliveredQuietly] & 1) == 0 && IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v10 guid];
          int v13 = 138412290;
          long long v14 = v12;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Sending a notify recipient command for a message which had not received a delivered quietly receipt yet. Message: %@", (uint8_t *)&v13, 0xCu);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)touchUpInsideCellFailureButton:(id)a3
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v160 = 0;
  v161 = &v160;
  uint64_t v162 = 0x3032000000;
  v163 = __Block_byref_object_copy__34;
  v164 = __Block_byref_object_dispose__34;
  id v165 = 0;
  id v6 = [v5 indexPathsForVisibleItems];
  v156[0] = MEMORY[0x1E4F143A8];
  v156[1] = 3221225472;
  v156[2] = __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke;
  v156[3] = &unk_1E56272B8;
  id v130 = v5;
  id v157 = v130;
  id v135 = v4;
  id v158 = v135;
  v159 = &v160;
  [v6 enumerateObjectsUsingBlock:v156];

  v136 = [(CKTranscriptCollectionViewController *)self conversation];
  if ([(id)v161[5] section]) {
    [(CKTranscriptCollectionViewController *)self associatedChatItems];
  }
  else {
  id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  }
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend((id)v161[5], "item"));
  id v137 = (id)objc_claimAutoreleasedReturnValue();

  v139 = [v137 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v8 = [v139 message];
  }
  else
  {
    unint64_t v8 = 0;
  }
  id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 stewieEnabled];

  if (!v10) {
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v136 chat],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isStewieEmergencyChat],
        v11,
        !v12))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v136 chat];
      int v19 = [v18 isStewieRoadsideChat];

      if (v19)
      {
        uint64_t v20 = [v139 stewieConversationID];
        uint64_t v21 = [MEMORY[0x1E4F6BC48] sharedInstance];
        uint64_t v22 = [v21 mostRecentlyUsedConversationForRoadside];

        long long v23 = [MEMORY[0x1E4F6BC48] sharedInstance];
        v134 = [v23 mostRecentlyUsedRoadsideChatIdentifier];

        if (v20 != v22)
        {
LABEL_128:

          goto LABEL_129;
        }
        v138 = [MEMORY[0x1E4F6BC48] sharedInstance];
        if (![(__CFString *)v138 isStewieRoadsideActive])
        {
LABEL_127:

          goto LABEL_128;
        }
        id v24 = [(CKTranscriptCollectionViewController *)self conversation];
        uint64_t v25 = [v24 chat];
        uint64_t v26 = [v25 chatIdentifier];
        int v27 = [v26 isEqualToString:v134];

        if (!v27) {
          goto LABEL_129;
        }
      }
    }
LABEL_18:
    id v28 = [(CKTranscriptCollectionViewController *)self conversation];
    uint64_t v29 = [v28 chat];
    v134 = [v29 lastAddressedSIMID];

    id v30 = [(CKTranscriptCollectionViewController *)self conversation];
    uint64_t v31 = [v30 chat];
    uint64_t v32 = [v31 lastAddressedHandleID];

    if (v32 && [(__CFString *)v32 length])
    {
      v138 = v32;
    }
    else
    {
      uint64_t v33 = [(CKTranscriptCollectionViewController *)self conversation];
      uint64_t v34 = [v33 chat];
      uint64_t v35 = [v34 account];
      v138 = [v35 strippedLogin];

      id v36 = [(CKTranscriptCollectionViewController *)self conversation];
      id v37 = [v36 chat];
      [v37 setLastAddressedHandleID:v138];

      if (IMOSLoggingEnabled())
      {
        id v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v167 = v138;
          _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "No last addressed handle or simId on chat, using handle from account %@", buf, 0xCu);
        }
      }
    }
    int v121 = objc_msgSend(v8, "__ck_isiMessage");
    if ([v8 scheduleType] == 2 && (unint64_t v39 = objc_msgSend(v8, "scheduleState"), v39 <= 5)) {
      unsigned int v123 = (0x36u >> v39) & 1;
    }
    else {
      unsigned int v123 = 0;
    }
    uint64_t v40 = [v8 error];
    uint64_t v41 = [v40 code];
    BOOL v122 = v41 == 43;

    if ([v137 canSendAsTextMessage]
      && [MEMORY[0x1E4F6BDC0] smsEnabled])
    {
      double v42 = [(CKTranscriptCollectionViewController *)self conversation];
      int v43 = [v42 isBusinessConversation];

      int v131 = v43 ^ 1;
    }
    else
    {
      int v131 = 0;
    }
    int IsEmail = IMStringIsEmail();
    double v44 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v45 = [v44 isCarrierPigeonEnabled];

    if (v45)
    {
      double v46 = [MEMORY[0x1E4F6BC48] sharedInstance];
      if (![v46 isSatelliteConnectionActive])
      {
        int v124 = 0;
        goto LABEL_41;
      }
      double v47 = [(CKTranscriptCollectionViewController *)self conversation];
      double v48 = [v47 chat];
      BOOL v49 = [v48 account];
      long long v50 = [v49 service];
      long long v51 = [MEMORY[0x1E4F6BDC0] satelliteSMSService];
      BOOL v52 = v50 == v51;

      if (v52
        && [v137 canSendAsTextMessageOverSatellite]
        && [MEMORY[0x1E4F6BDC0] smsEnabled])
      {
        double v46 = [(CKTranscriptCollectionViewController *)self conversation];
        int v124 = [v46 isBusinessConversation] ^ 1;
LABEL_41:

LABEL_42:
        if (IMOSLoggingEnabled())
        {
          long long v53 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            id v54 = @"NO";
            if (v124) {
              id v54 = @"YES";
            }
            *(_DWORD *)long long buf = 138412290;
            uint64_t v167 = v54;
            _os_log_impl(&dword_18EF18000, v53, OS_LOG_TYPE_INFO, "Send as text over satellite :%@", buf, 0xCu);
          }
        }
        if (IMSharedHelperDeviceHasMultipleSubscriptions()
          && ([v134 length] || -[__CFString length](v138, "length")))
        {
          uint64_t v55 = [MEMORY[0x1E4F6E668] sharedInstance];
          id v56 = [v55 ctSubscriptionInfo];
          uint64_t v57 = objc_msgSend(v56, "__im_switchSubscriptionContextFromPhoneNumber:simID:", v138, v134);

          if (IMOSLoggingEnabled())
          {
            id v58 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412802;
              uint64_t v167 = v138;
              __int16 v168 = 2112;
              v169 = v134;
              __int16 v170 = 2112;
              id v171 = v57;
              _os_log_impl(&dword_18EF18000, v58, OS_LOG_TYPE_INFO, "Last addressed handle: %@ last simID %@. New context to switch to for resend: %@.", buf, 0x20u);
            }
          }
          id v59 = [v57 labelID];
          if (![v59 length]) {
            goto LABEL_58;
          }
          if ([v59 isEqualToString:v134]) {
            goto LABEL_58;
          }
          uint64_t v60 = [v57 phoneNumber];
          uint64_t v61 = IMNormalizePhoneNumber();
          uint64_t v62 = IMNormalizePhoneNumber();
          char v63 = [v61 isEqualToString:v62];

          if (v63)
          {
LABEL_58:
            id v133 = 0;
            id v128 = 0;
            v129 = 0;
          }
          else
          {
            id v128 = v59;
            v129 = [v57 phoneNumber];
            id v93 = NSString;
            uint64_t v94 = CKFrameworkBundle();
            double v95 = [v94 localizedStringForKey:@"TRY_AGAIN_WITH_SIM" value:&stru_1EDE4CA38 table:@"ChatKit"];
            uint64_t v96 = [v57 label];
            uint64_t v97 = objc_msgSend(v93, "stringWithFormat:", v95, v96);

            id v98 = [MEMORY[0x1E4F42738] sharedApplication];
            BOOL v99 = [v98 userInterfaceLayoutDirection] == 1;

            if (v99) {
              id v100 = @"\u200F";
            }
            else {
              id v100 = @"\u200E";
            }
            id v101 = [(__CFString *)v100 stringByAppendingString:v97];

            id v133 = v101;
          }
        }
        else
        {
          id v133 = 0;
          id v128 = 0;
          v129 = 0;
        }
        if (v41 == 43)
        {
          if (((v131 ^ 1 | IsEmail) & 1) != 0 || [v136 isToEmailAddress])
          {
            if (IMOSLoggingEnabled())
            {
              __int16 v64 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_18EF18000, v64, OS_LOG_TYPE_INFO, "Hawking: Can't downgrade to SMS, showing non-cellular blackhole message.", buf, 2u);
              }
            }
            [(CKTranscriptCollectionViewController *)self presentHawkingPromptForChatItem:v139];
LABEL_126:

            goto LABEL_127;
          }
          id v80 = CKFrameworkBundle();
          double v127 = [v80 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_RESEND_AS_SMS" value:&stru_1EDE4CA38 table:@"ChatKit"];

          id v78 = CKFrameworkBundle();
          v132 = [v78 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_MESSAGE_LEARN_MORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
          double v125 = 0;
          uint64_t v74 = 0;
          uint64_t v77 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_84;
        }
        id v65 = [v136 chat];
        int v66 = [v65 canSend];

        if (v123)
        {
          id v67 = [v8 time];
          id v68 = [MEMORY[0x1E4F1C9C8] now];
          uint64_t v69 = [v67 compare:v68];

          if (v69 == -1) {
            char v70 = 0;
          }
          else {
            char v70 = v66;
          }
          if ((v70 & 1) == 0) {
            goto LABEL_74;
          }
        }
        else if (!v66)
        {
LABEL_74:
          int v71 = 0;
          double v127 = 0;
LABEL_77:
          id v73 = CKFrameworkBundle();
          double v125 = [v73 localizedStringForKey:@"Tap-to-Radar" value:&stru_1EDE4CA38 table:@"ChatKit"];

          if (v131)
          {
            v132 = [v136 fallbackSendString];
            uint64_t v74 = 1;
          }
          else
          {
            v132 = 0;
            uint64_t v74 = 0x7FFFFFFFFFFFFFFFLL;
          }
          id v75 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          int v76 = [v75 isCarrierPigeonEnabled];

          if ((v71 | v76 & v124 ^ 1))
          {
            uint64_t v77 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_85;
          }
          id v78 = CKFrameworkBundle();
          uint64_t v79 = [v78 localizedStringForKey:@"OFFER_TO_SEND_VIA_SATELLITE_SMS" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];

          uint64_t v77 = 1;
          v132 = (void *)v79;
LABEL_84:

LABEL_85:
          id v81 = +[CKUIBehavior sharedBehaviors];
          [v81 isSizeConstrained];

          if (v41 == 43)
          {
            id v82 = [MEMORY[0x1E4F6E890] sharedInstance];
            [v82 trackSpamEvent:9];

            id v83 = CKFrameworkBundle();
            id v84 = [v83 localizedStringForKey:@"HAWKING_FAILURE_ACTION_SHEET_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

            id v85 = [(CKTranscriptCollectionViewController *)self hawkingFailurePromptMessageForHandle:v138];
LABEL_103:
            uint64_t v102 = +[CKAlertController alertControllerWithTitle:v84 message:v85 preferredStyle:0];
            if (v127)
            {
              v152[0] = MEMORY[0x1E4F143A8];
              v152[1] = 3221225472;
              v152[2] = __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_991;
              v152[3] = &unk_1E5622890;
              BOOL v155 = v122;
              id v153 = v8;
              v154 = self;
              unint64_t v103 = +[CKAlertAction actionWithTitle:v127 style:0 handler:v152];
              [v102 addAction:v103];
            }
            if (v132)
            {
              v147[0] = MEMORY[0x1E4F143A8];
              v147[1] = 3221225472;
              v147[2] = __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_992;
              v147[3] = &unk_1E5627930;
              uint64_t v150 = v74;
              id v148 = v8;
              double v149 = self;
              uint64_t v151 = v77;
              CGSize v104 = +[CKAlertAction actionWithTitle:v132 style:0 handler:v147];
              [v102 addAction:v104];
            }
            int HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
            if (v133) {
              int v106 = HasMultipleSubscriptions;
            }
            else {
              int v106 = 0;
            }
            if (v106 == 1)
            {
              if (IMOSLoggingEnabled())
              {
                v107 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v167 = v129;
                  _os_log_impl(&dword_18EF18000, v107, OS_LOG_TYPE_INFO, "Resending message with %@", buf, 0xCu);
                }
              }
              v143[0] = MEMORY[0x1E4F143A8];
              v143[1] = 3221225472;
              v143[2] = __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_999;
              v143[3] = &unk_1E5621878;
              v143[4] = self;
              BOOL v144 = v129;
              id v145 = v128;
              id v146 = v8;
              id v108 = +[CKAlertAction actionWithTitle:v133 style:0 handler:v143];
              [v102 addAction:v108];
            }
            if (!CKIsRunningInMacCatalyst())
            {
              if (v125)
              {
                v109 = [MEMORY[0x1E4F6C360] sharedInstance];
                int v110 = [v109 isInternalInstall];

                if (v110)
                {
                  v140[0] = MEMORY[0x1E4F143A8];
                  v140[1] = 3221225472;
                  v140[2] = __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_2;
                  v140[3] = &unk_1E56218C8;
                  id v141 = v8;
                  uint64_t v142 = self;
                  uint64_t v111 = +[CKAlertAction actionWithTitle:v125 style:0 handler:v140];
                  [v102 addAction:v111];
                }
              }
            }
            v112 = [v102 actions];
            BOOL v113 = [v112 count] == 0;

            if (v113) {
              [v102 setPreferredStyle:1];
            }
            v114 = [v102 actions];
            if ([v114 count])
            {
              char v115 = CKFrameworkBundle();
              [v115 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
            }
            else
            {
              char v115 = CKFrameworkBundle();
              [v115 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
            double v116 = };
            double v117 = +[CKAlertAction actionWithTitle:v116 style:1 handler:0];
            [v102 addAction:v117];

            double v118 = [v102 popoverPresentationController];
            [v135 frame];
            objc_msgSend(v118, "setSourceRect:");

            double v119 = [v102 popoverPresentationController];
            double v120 = [v135 superview];
            [v119 setSourceView:v120];

            [(CKTranscriptCollectionViewController *)self presentViewController:v102 animated:1 completion:0];
            goto LABEL_126;
          }
          if (v121)
          {
            if (v123
              && ([v8 time],
                  id v86 = objc_claimAutoreleasedReturnValue(),
                  [MEMORY[0x1E4F1C9C8] now],
                  uint64_t v87 = objc_claimAutoreleasedReturnValue(),
                  BOOL v88 = [v86 compare:v87] == 1,
                  v87,
                  v86,
                  v88))
            {
              if (v127)
              {
                id v89 = [v136 chat];
                int v90 = [v89 allParticipantsBlocked];

                if (v90)
                {
                  if (CKIsRunningInMacCatalyst())
                  {
                    id v91 = CKFrameworkBundle();
                    [v91 localizedStringForKey:@"SCHEDULED_MESSAGE_FAILURE_DESCRIPTION_BLOCKED_SCHEDULE_AGAIN_MAC" value:&stru_1EDE4CA38 table:@"ChatKit"];
                  }
                  else
                  {
                    id v91 = CKFrameworkBundle();
                    [v91 localizedStringForKey:@"SCHEDULED_MESSAGE_FAILURE_DESCRIPTION_BLOCKED_SCHEDULE_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];
                  }
                }
                else if (CKIsRunningInMacCatalyst())
                {
                  id v91 = CKFrameworkBundle();
                  [v91 localizedStringForKey:@"SCHEDULED_MESSAGE_FAILURE_DESCRIPTION_SCHEDULE_AGAIN_MAC" value:&stru_1EDE4CA38 table:@"ChatKit"];
                }
                else
                {
                  id v91 = CKFrameworkBundle();
                  [v91 localizedStringForKey:@"SCHEDULED_MESSAGE_FAILURE_DESCRIPTION_SCHEDULE_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];
                }
                uint64_t v92 = LABEL_133:;
                goto LABEL_102;
              }
              id v91 = CKFrameworkBundle();
              uint64_t v92 = [v91 localizedStringForKey:@"SCHEDULED_MESSAGE_FAILURE_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
            }
            else
            {
              id v91 = CKFrameworkBundle();
              uint64_t v92 = [v91 localizedStringForKey:@"MADRID_FAILURE_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
            }
LABEL_102:
            id v84 = (void *)v92;

            id v85 = 0;
            goto LABEL_103;
          }
          if (CKIsRunningInMacCatalyst())
          {
            id v91 = CKFrameworkBundle();
            [v91 localizedStringForKey:@"FULL_FAILURE_DESCRIPTION_MAC" value:&stru_1EDE4CA38 table:@"ChatKit"];
          }
          else
          {
            id v91 = CKFrameworkBundle();
            [v91 localizedStringForKey:@"FULL_FAILURE_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
          }
          goto LABEL_133;
        }
        id v72 = CKFrameworkBundle();
        double v127 = [v72 localizedStringForKey:@"TRY_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];

        int v71 = 1;
        goto LABEL_77;
      }
    }
    int v124 = 0;
    goto LABEL_42;
  }
  uint64_t v13 = [v139 stewieConversationID];
  long long v14 = [MEMORY[0x1E4F6BC48] sharedInstance];
  uint64_t v15 = [v14 mostRecentlyUsedConversationForEmergency];

  if (v13 == v15)
  {
    int v16 = [MEMORY[0x1E4F6BC48] sharedInstance];
    char v17 = [v16 isStewieEmergencyActive];

    if (v17) {
      goto LABEL_18;
    }
  }
LABEL_129:

  _Block_object_dispose(&v160, 8);
}

void __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (objc_opt_respondsToSelector())
  {
    unint64_t v8 = [v7 failureButton];
    id v9 = *(void **)(a1 + 40);

    if (v8 == v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_991(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isLocatingMessage])
  {
    id v4 = [*(id *)(a1 + 40) conversation];
    uint64_t v5 = [v4 chat];
    int v6 = [v5 canSendCurrentLocationMessage];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) conversation];
      unint64_t v8 = [v7 chat];
      [v8 sendCurrentLocationMessage];
    }
  }
  else if ([*(id *)(a1 + 32) isFromMe])
  {
    int v9 = *(unsigned __int8 *)(a1 + 48);
    int v10 = IMOSLoggingEnabled();
    if (v9)
    {
      if (v10)
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v21 = 138412290;
          uint64_t v22 = v12;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Hawking: Original message blackholed, sending message as SMS. %@", (uint8_t *)&v21, 0xCu);
        }
      }
      uint64_t v13 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v13 trackSpamEvent:10];

      [*(id *)(a1 + 40) _downgradeMessage:*(void *)(a1 + 32) andDowngradeChat:1];
    }
    else
    {
      if (v10)
      {
        int v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v21 = 138412290;
          uint64_t v22 = v17;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Resending message as iMessage. %@", (uint8_t *)&v21, 0xCu);
        }
      }
      uint64_t v18 = [*(id *)(*(void *)(a1 + 40) + 1056) chat];
      int v19 = [v18 isStewieChat];

      uint64_t v20 = *(void **)(a1 + 40);
      if (v19) {
        [v20 _resendFailedMessages];
      }
      else {
        [v20 _resendMessage:*(void *)(a1 + 32)];
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v21 = 138412290;
      uint64_t v22 = v15;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "This message wasn't from me, why are we trying to re-send it? %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

void __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_992(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      unint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "Resending message as SMS. %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      uint64_t v10 = *(void *)(a1 + 32);
      _CKLog();
    }
    objc_msgSend(*(id *)(a1 + 40), "_downgradeMessage:", *(void *)(a1 + 32), v10);
  }
  else if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "Hawking: Sending user to Hawking KB article", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    int v6 = [MEMORY[0x1E4F42738] sharedApplication];
    id v7 = [MEMORY[0x1E4F6EA38] internationalSpamFilterLearnMoreURL];
    [v6 openURL:v7 withCompletionHandler:0];
  }
  if (*(void *)(a1 + 56) == 1) {
    [*(id *)(a1 + 40) _resendMessageUsingCurrentService:*(void *)(a1 + 32)];
  }
}

uint64_t __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_999(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLastAddressedHandleID:*(void *)(a1 + 40) lastAddressedSIMID:*(void *)(a1 + 48)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 _resendMessage:v3];
}

void __71__CKTranscriptCollectionViewController_touchUpInsideCellFailureButton___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) conversation];
  double v2 = [v3 chat];
  +[CKTapToRadar launchTapToRadarForFailedMessage:v1 inChat:v2];
}

- (id)_indexPathOfCellContainingStampButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__34;
  int v19 = __Block_byref_object_dispose__34;
  id v20 = 0;
  int v6 = [v5 indexPathsForVisibleItems];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__CKTranscriptCollectionViewController__indexPathOfCellContainingStampButton___block_invoke;
  v11[3] = &unk_1E56272B8;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  long long v14 = &v15;
  [v6 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __78__CKTranscriptCollectionViewController__indexPathOfCellContainingStampButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 stampButton];
    if (v8 == *(void **)(a1 + 40))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)touchUpInsideCellStampButton:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMessagesNotificationExtension())
  {
    uint64_t v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController touchUpInsideCellStampButton:]();
    }
  }
  else
  {
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self _indexPathOfCellContainingStampButton:v4];
    if (v5)
    {
      int v6 = [(CKTranscriptCollectionViewController *)self chatItems];
      id v7 = objc_msgSend(v6, "objectAtIndex:", -[NSObject item](v5, "item"));

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CKTranscriptCollectionViewController *)self _handleTapOnMessageRetractionChatItem:v7];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CKTranscriptCollectionViewController *)self _handleTapOnParticipantChangeChatItem:v7];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CKTranscriptCollectionViewController *)self _handleTapOnGroupActionChatItem:v7];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CKTranscriptCollectionViewController *)self _handleTapOnGroupTitleChangeChatItem:v7];
        }
      }
      else
      {
        id v8 = IMLogHandleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[CKTranscriptCollectionViewController touchUpInsideCellStampButton:]();
        }
      }
    }
    else
    {
      id v7 = IMLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController touchUpInsideCellStampButton:]();
      }
    }
  }
}

- (void)touchUpInsideCellStatusButton:(id)a3
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  if (CKIsRunningInMessagesNotificationExtension())
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "touchUpInsideCellStatusButton inside an extension, early returning", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self collectionView];
    *(void *)long long buf = 0;
    int v106 = buf;
    uint64_t v107 = 0x3032000000;
    id v108 = __Block_byref_object_copy__34;
    v109 = __Block_byref_object_dispose__34;
    id v110 = 0;
    int v6 = [v5 indexPathsForVisibleItems];
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __70__CKTranscriptCollectionViewController_touchUpInsideCellStatusButton___block_invoke;
    v101[3] = &unk_1E56272B8;
    id v90 = v5;
    id v102 = v90;
    id v7 = v92;
    id v103 = v7;
    CGSize v104 = buf;
    [v6 enumerateObjectsUsingBlock:v101];

    id v8 = [(CKTranscriptCollectionViewController *)self chatItems];
    id v91 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(*((id *)v106 + 5), "item"));

    id v9 = v91;
    if (*((void *)v106 + 5))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v89 = v91;
        switch([v89 buttonType])
        {
          case 1:
            uint64_t v10 = objc_opt_class();
            uint64_t v11 = [*((id *)v106 + 5) item];
            id v12 = [(CKTranscriptCollectionViewController *)self chatItems];
            id v13 = [(CKTranscriptCollectionViewController *)self _previousChatItemOfType:v10 beforeIndex:v11 inChatItems:v12];

            v99[0] = MEMORY[0x1E4F143A8];
            v99[1] = 3221225472;
            v99[2] = __70__CKTranscriptCollectionViewController_touchUpInsideCellStatusButton___block_invoke_2;
            v99[3] = &unk_1E5620AF8;
            v99[4] = self;
            long long v14 = v13;
            id v100 = v14;
            [(CKTranscriptCollectionViewController *)self updateTranscript:v99 animated:1 completion:0];

            goto LABEL_118;
          case 2:
            id v30 = +[CKAppAudioController sharedInstance];
            uint64_t v31 = [v30 audioController];

            if (v31)
            {
              [v31 stop];
            }
            uint64_t v32 = [(CKTranscriptCollectionViewController *)self chatItems];
            uint64_t v33 = objc_msgSend(v32, "__ck_indexesOfUnplayedAudioMessages");
            uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v33, "count"));
            v97[0] = MEMORY[0x1E4F143A8];
            v97[1] = 3221225472;
            v97[2] = __70__CKTranscriptCollectionViewController_touchUpInsideCellStatusButton___block_invoke_3;
            v97[3] = &unk_1E56271F8;
            id v35 = v34;
            id v98 = v35;
            [v32 enumerateObjectsAtIndexes:v33 options:0 usingBlock:v97];
            id v36 = [CKAudioController alloc];
            id v37 = [(CKTranscriptCollectionViewController *)self conversation];
            long long v14 = [(CKAudioController *)v36 initWithMediaObjects:v35 conversation:v37];

            [(CKAudioController *)v14 setDelegate:self];
            id v38 = +[CKAppAudioController sharedInstance];
            [v38 setAudioController:v14];

            uint64_t v39 = CKAudioPlaybackSpeakerEnabled();
            [(CKAudioController *)v14 setShouldUseSpeaker:v39];
            double v40 = 1.0;
            if (v39) {
              double v40 = 0.0;
            }
            [(CKAudioController *)v14 playAfterDelay:v40];

            goto LABEL_118;
          case 3:
            uint64_t v17 = [(CKTranscriptCollectionViewController *)self delegate];
            char v18 = objc_opt_respondsToSelector();

            if ((v18 & 1) == 0) {
              break;
            }
            uint64_t v19 = objc_opt_class();
            uint64_t v20 = [*((id *)v106 + 5) item];
            int v21 = [(CKTranscriptCollectionViewController *)self chatItems];
            long long v14 = [(CKTranscriptCollectionViewController *)self _previousChatItemOfType:v19 beforeIndex:v20 inChatItems:v21];

            uint64_t v22 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:v14];
            if (v22)
            {
              uint64_t v23 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v22];
            }
            else
            {
              uint64_t v23 = 0;
            }
            uint64_t v87 = [(CKTranscriptCollectionViewController *)self delegate];
            [v87 transcriptCollectionViewController:self didTapAttributionButtonForChatItem:v89 parentIndexPath:v23 sender:v7];

            goto LABEL_118;
          case 4:
            uint64_t v41 = [(CKTranscriptCollectionViewController *)self delegate];
            char v42 = objc_opt_respondsToSelector();

            if ((v42 & 1) == 0) {
              break;
            }
            long long v14 = [(CKTranscriptCollectionViewController *)self delegate];
            [(CKAudioController *)v14 transcriptCollectionViewController:self didTapPluginStatusButtonForChatItem:v89];
            goto LABEL_118;
          case 5:
            int v43 = [MEMORY[0x1E4F6E890] sharedInstance];
            [v43 trackEvent:*MEMORY[0x1E4F6DBF8]];

            long long v14 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
            if ([(CKAudioController *)v14 isAnimating]) {
              goto LABEL_118;
            }
            double v44 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
            int v45 = [v44 currentEffect];
            BOOL v46 = v45 == 0;

            if (!v46) {
              break;
            }
            uint64_t v47 = [*((id *)v106 + 5) item];
            uint64_t v48 = v47 - 1;
            if (v47 < 1) {
              goto LABEL_111;
            }
            BOOL v49 = 0;
            do
            {
              long long v50 = [(CKTranscriptCollectionViewController *)self chatItems];
              long long v14 = [v50 objectAtIndex:v48];

              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              v48 -= (isKindOfClass & 1) == 0;
              BOOL v49 = v14;
            }
            while (!(isKindOfClass & 1 | (v48 < 0)));
            if (isKindOfClass)
            {
              BOOL v52 = [(CKAudioController *)v14 IMChatItem];
              long long v53 = [v52 message];

              id v54 = [v53 text];
              LODWORD(v52) = objc_msgSend(v54, "ck_containsIMTextEffect");
              if ((v52 & [(CKTranscriptCollectionViewController *)self textEffectIsCandidateBalloonViewChecksForChatItem:v14]) == 1)
              {
                uint64_t v55 = [(CKAudioController *)v14 IMChatItem];
                id v56 = [v55 guid];

                uint64_t v57 = [[CKTextEffectCoordinatorContinuationState alloc] initWithTextViewIdentifier:v56 locationInAttributedText:0 ignoreTextViewEligibilityCheck:1];
                id v58 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
                [v58 resetAndContinueFromState:v57];

                id v59 = [NSString stringWithFormat:@"Replay button tapped for identifier %@", v56];
                uint64_t v60 = [(CKTranscriptCollectionViewController *)self transcriptTextEffectCoordinator];
                [v60 updateWithReason:v59];
              }
              uint64_t v61 = [v53 expressiveSendStyleID];
              if ([v61 containsString:*MEMORY[0x1E4F6D4D8]])
              {
                uint64_t v62 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
                char v63 = [(CKAudioController *)v14 message];
                v116[0] = v63;
                __int16 v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:1];
                [v62 animateMessages:v64];
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  BOOL v88 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v114 = 136315138;
                    char v115 = "-[CKTranscriptCollectionViewController touchUpInsideCellStatusButton:]";
                    _os_log_impl(&dword_18EF18000, v88, OS_LOG_TYPE_INFO, "%s - Triggering FSM from replay action", v114, 0xCu);
                  }
                }
                uint64_t v62 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
                char v63 = [(CKTranscriptCollectionViewController *)self textInputMode];
                __int16 v64 = [v63 primaryLanguage];
                [v62 startFullscreenEffectForChatItem:v14 language:v64];
              }
            }
            goto LABEL_118;
          case 6:
            if ([(CKTranscriptCollectionViewController *)self isEditing]) {
              break;
            }
            id v24 = [(CKTranscriptCollectionViewController *)self delegate];
            char v25 = objc_opt_respondsToSelector();

            if ((v25 & 1) == 0) {
              break;
            }
            long long v14 = [(CKTranscriptCollectionViewController *)self delegate];
            [(CKAudioController *)v14 transcriptCollectionViewController:self didTapReplyCountStatusButtonForChatItem:v89];
            goto LABEL_118;
          case 7:
            long long v95 = 0u;
            long long v96 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v65 = [(CKTranscriptCollectionViewController *)self chat];
            long long v14 = [v65 participants];

            uint64_t v66 = [(CKAudioController *)v14 countByEnumeratingWithState:&v93 objects:v111 count:16];
            if (!v66) {
              goto LABEL_118;
            }
            char v67 = 0;
            uint64_t v68 = *(void *)v94;
            uint64_t v69 = MEMORY[0x1E4F1CBF0];
            do
            {
              for (uint64_t i = 0; i != v66; ++i)
              {
                if (*(void *)v94 != v68) {
                  objc_enumerationMutation(v14);
                }
                int v71 = (void *)MEMORY[0x1E4F6E6D8];
                id v72 = [*(id *)(*((void *)&v93 + 1) + 8 * i) cnContactWithKeys:v69];
                LOBYTE(v71) = [v71 isCNContactAKnownContact:v72];

                v67 |= v71;
              }
              uint64_t v66 = [(CKAudioController *)v14 countByEnumeratingWithState:&v93 objects:v111 count:16];
            }
            while (v66);

            if ((v67 & 1) == 0) {
              break;
            }
            uint64_t v73 = [*((id *)v106 + 5) item];
            uint64_t v74 = v73 - 1;
            if (v73 < 1)
            {
LABEL_111:
              long long v14 = 0;
            }
            else
            {
              id v75 = 0;
              do
              {
                int v76 = [(CKTranscriptCollectionViewController *)self chatItems];
                long long v14 = [v76 objectAtIndex:v74];

                objc_opt_class();
                char v77 = objc_opt_isKindOfClass();
                v74 -= (v77 & 1) == 0;
                id v75 = v14;
              }
              while (!(v77 & 1 | (v74 < 0)));
              if (v77)
              {
                id v78 = [v89 IMChatItem];
                if ([v78 syndicationStatus] == 1)
                {
                  uint64_t v79 = [(CKAudioController *)v14 IMChatItem];
                  id v80 = [v79 guid];

                  id v81 = [(CKAudioController *)v14 IMChatItem];
                  uint64_t v82 = [v81 messagePartRange];
                  uint64_t v84 = v83;

                  id v85 = [(CKTranscriptCollectionViewController *)self chat];
                  objc_msgSend(v85, "sendSyndicationAction:forMessagePartGUID:syndicatedMessagePartRange:", 32, v80, v82, v84);
                }
              }
            }
            goto LABEL_118;
          case 8:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_94;
            }
            int v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "User selected \"Not Edited\" status item, prompting to resend edit", v114, 2u);
            }
            goto LABEL_93;
          case 9:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_94;
            }
            int v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "User selected \"Delivered - Not Edited\" status item, prompting to resend edit", v114, 2u);
            }
            goto LABEL_93;
          case 10:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_94;
            }
            int v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "User selected \"Delivered Quietly - Not Edited\" status item, prompting to resend edit", v114, 2u);
            }
            goto LABEL_93;
          case 11:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_94;
            }
            int v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "User selected \"Read - Not Edited\" status item, prompting to resend edit", v114, 2u);
            }
LABEL_93:

LABEL_94:
            [(CKTranscriptCollectionViewController *)self _handleFailedEditStatusButtonTappedForIndexPath:*((void *)v106 + 5)];
            break;
          case 12:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Edited\" status item, showing edit history", v114, 2u);
            }
            goto LABEL_102;
          case 13:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Delivered - Edited\" status item, showing edit history", v114, 2u);
            }
            goto LABEL_102;
          case 14:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Delivered Quietly - Edited\" status item, showing edit history", v114, 2u);
            }
            goto LABEL_102;
          case 15:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Read - Edited\" status item, showing edit history", v114, 2u);
            }
            goto LABEL_102;
          case 16:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Hide Edits\" status item, hiding edit history", v114, 2u);
            }
            goto LABEL_102;
          case 17:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Delivered - Hide Edits\" status item, hiding edit history", v114, 2u);
            }
            goto LABEL_102;
          case 18:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Delivered Quietly - Hide Edits\" status item, hiding edit history", v114, 2u);
            }
            goto LABEL_102;
          case 19:
            if (!IMOSLoggingEnabled()) {
              goto LABEL_103;
            }
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v114 = 0;
              _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User selected \"Read - Hide Edits\" status item, hiding edit history", v114, 2u);
            }
LABEL_102:

LABEL_103:
            [(CKTranscriptCollectionViewController *)self _handleEditHistoryButtonTappedForIndexPath:*((void *)v106 + 5)];
            break;
          case 20:
            uint64_t v26 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
            int v27 = [v26 isCarrierPigeonEnabled];

            if (!v27) {
              break;
            }
            if (IMOSLoggingEnabled())
            {
              id v28 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v114 = 0;
                _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "User selected \"Send Via Satellite \" status item, trying to send message now", v114, 2u);
              }
            }
            [(CKTranscriptCollectionViewController *)self _handleSendViaSatelliteButtonTappedForIndexPath:*((void *)v106 + 5)];
            long long v14 = [MEMORY[0x1E4F6E890] sharedInstance];
            uint64_t v112 = *MEMORY[0x1E4F6DD68];
            BOOL v113 = &unk_1EDF165E0;
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
            [(CKAudioController *)v14 trackEvent:*MEMORY[0x1E4F6DBA8] withDictionary:v29];

LABEL_118:
            break;
          case 22:
            if (IMOSLoggingEnabled())
            {
              id v86 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v114 = 0;
                _os_log_impl(&dword_18EF18000, v86, OS_LOG_TYPE_INFO, "User selected \"Not Cancelled\" status item, prompting to retry cancellation", v114, 2u);
              }
            }
            [(CKTranscriptCollectionViewController *)self _handleFailedCancelStatusButtonTappedForIndexPath:*((void *)v106 + 5)];
            break;
          default:
            break;
        }

        id v9 = v91;
      }
    }

    _Block_object_dispose(buf, 8);
  }
}

void __70__CKTranscriptCollectionViewController_touchUpInsideCellStatusButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 statusButton];
    id v9 = *(void **)(a1 + 40);

    if (v8 == v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void __70__CKTranscriptCollectionViewController_touchUpInsideCellStatusButton___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) chat];
  double v2 = [*(id *)(a1 + 40) IMChatItem];
  [v3 markChatItemAsSaved:v2];
}

void __70__CKTranscriptCollectionViewController_touchUpInsideCellStatusButton___block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 mediaObject];
  [v2 addObject:v3];
}

- (void)_handleEditHistoryButtonTappedForIndexPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 item];
  id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v8 = [(CKTranscriptCollectionViewController *)self _previousChatItemOfType:v5 beforeIndex:v6 inChatItems:v7];

  id v9 = [v8 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v11 = [v10 guid];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "User selected show edit history button for chatItemGUID: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    id v13 = [(CKTranscriptCollectionViewController *)self chat];
    int v14 = [v13 isShowingEditHistoryForChatItemGUID:v11];
    int v15 = IMOSLoggingEnabled();
    if (v14)
    {
      if (v15)
      {
        int v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          uint64_t v19 = v11;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Requested end showing edit history for chatItemGUID: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      [v13 endShowingEditHistoryForChatItemGUID:v11];
    }
    else
    {
      if (v15)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          uint64_t v19 = v11;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Requested begin showing edit history for chatItemGUID: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      [v13 beginShowingEditHistoryForChatItemGUID:v11];
    }
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController _handleEditHistoryButtonTappedForIndexPath:]();
    }
  }
}

- (void)_handleFailedEditStatusButtonTappedForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 item];
  id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v8 = [(CKTranscriptCollectionViewController *)self _previousChatItemOfType:v5 beforeIndex:v6 inChatItems:v7];

  id v9 = [v8 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v11 = [(CKTranscriptCollectionViewController *)self conversation];
    id v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v13 = [v12 isScheduledMessagesCoreEnabled];

    if (v13 && [v10 scheduleType] == 2)
    {
      if ([v10 scheduleState] == 2)
      {
        if (IMOSLoggingEnabled())
        {
          int v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Message is a scheduled message, presenting a resend confirmation alert to the user", buf, 2u);
          }
        }
        [(CKTranscriptCollectionViewController *)self _presentEditedScheduledMessageResendConfirmationAlertForMessage:v10];
      }
      goto LABEL_28;
    }
    char v15 = [v10 canEditMessageText];
    char v16 = [v11 supportsMessageEditing];
    int v17 = IMOSLoggingEnabled();
    if (v15)
    {
      if (v16)
      {
        if (v17)
        {
          int v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v22 = 0;
            _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Message is still editable, presenting a resend confirmation alert to the user", v22, 2u);
          }
        }
        [(CKTranscriptCollectionViewController *)self _presentEditedMessageResendConfirmationAlertForMessage:v10];
        goto LABEL_28;
      }
      if (!v17) {
        goto LABEL_27;
      }
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_26;
      }
      *(_WORD *)uint64_t v23 = 0;
      uint64_t v20 = "Cannot resend edit to message. Conversation no longer supports editing. Presenting an explanatory alert to the user";
      int v21 = v23;
    }
    else
    {
      if (!v17)
      {
LABEL_27:
        [(CKTranscriptCollectionViewController *)self _presentMessageCanNoLongerBeEditedAlert];
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_26:

        goto LABEL_27;
      }
      __int16 v24 = 0;
      uint64_t v20 = "Cannot resend edit to message. Message is no longer editable, presenting an explanatory alert to the user";
      int v21 = (uint8_t *)&v24;
    }
    _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, v20, v21, 2u);
    goto LABEL_26;
  }
  id v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CKTranscriptCollectionViewController _handleEditHistoryButtonTappedForIndexPath:]();
  }
LABEL_29:
}

- (void)_handleFailedCancelStatusButtonTappedForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 item];
  id v7 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v8 = [(CKTranscriptCollectionViewController *)self _previousChatItemOfType:v5 beforeIndex:v6 inChatItems:v7];

  id v9 = [v8 IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 scheduleType] == 2 && [v10 scheduleState] == 2)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v13 = 0;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Message is still scheduled, presenting a resend confirmtion alert to the user.", v13, 2u);
        }
      }
      [(CKTranscriptCollectionViewController *)self _presentCancelledScheduledMessageConfirmationAlertForMessage:v10];
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController _handleFailedCancelStatusButtonTappedForIndexPath:]();
      }
    }
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController _handleEditHistoryButtonTappedForIndexPath:]();
    }
  }
}

- (void)_handleSendViaSatelliteButtonTappedForIndexPath:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__CKTranscriptCollectionViewController__handleSendViaSatelliteButtonTappedForIndexPath___block_invoke;
  v3[3] = &unk_1E5620C40;
  v3[4] = self;
  [(CKTranscriptCollectionViewController *)self updateTranscript:v3 animated:0 completion:&__block_literal_global_1020];
}

uint64_t __88__CKTranscriptCollectionViewController__handleSendViaSatelliteButtonTappedForIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1056) sendPendingSatelliteMessages];
}

- (void)_presentMessageCanNoLongerBeEditedAlert
{
  id v3 = CKFrameworkBundle();
  id v10 = [v3 localizedStringForKey:@"MESSAGE_NOT_EDITED_AND_NO_LONGER_EDITABLE_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v4 = CKFrameworkBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"MESSAGE_NOT_EDITED_AND_NO_LONGER_EDITABLE_ALERT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  uint64_t v6 = +[CKAlertController alertControllerWithTitle:v10 message:v5 preferredStyle:1];
  id v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"CONTINUE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v9 = +[CKAlertAction actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];
  [(CKTranscriptCollectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_presentEditedMessageResendConfirmationAlertForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"MESSAGE_NOT_EDITED_RETRY_EDIT_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"MESSAGE_NOT_EDITED_RETRY_EDIT_ALERT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v9 = +[CKAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:CKIsRunningInMacCatalyst() != 0];
  id v10 = CKFrameworkBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"TRY_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id location = 0;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__CKTranscriptCollectionViewController__presentEditedMessageResendConfirmationAlertForMessage___block_invoke;
  v17[3] = &unk_1E5627958;
  objc_copyWeak(&v19, &location);
  id v12 = v4;
  id v18 = v12;
  int v13 = +[CKAlertAction actionWithTitle:v11 style:0 handler:v17];
  [v9 addAction:v13];
  int v14 = CKFrameworkBundle();
  char v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];

  char v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];
  [v9 addAction:v16];
  [(CKTranscriptCollectionViewController *)self presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __95__CKTranscriptCollectionViewController__presentEditedMessageResendConfirmationAlertForMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resendEditedMessageForChatItem:*(void *)(a1 + 32)];
}

- (void)_resendEditedMessageForChatItem:(id)a3
{
  id v4 = a3;
  id v7 = [v4 messageItem];
  uint64_t v5 = [v4 index];

  uint64_t v6 = [(CKTranscriptCollectionViewController *)self conversation];
  [v6 resendEditedMessageItem:v7 forPartIndex:v5];
}

- (void)_handleTapOnGroupActionChatItem:(id)a3
{
  id v4 = a3;
  if ([v4 failed])
  {
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v4];
    uint64_t v6 = [v4 errorText];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __72__CKTranscriptCollectionViewController__handleTapOnGroupActionChatItem___block_invoke;
    uint64_t v11 = &unk_1E56218C8;
    id v12 = v4;
    int v13 = self;
    id v7 = [(CKTranscriptCollectionViewController *)self _buildRetryAlertWithMessage:v6 sourceView:v5 tryAgainAction:&v8];

    -[CKTranscriptCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, v8, v9, v10, v11);
  }
}

void __72__CKTranscriptCollectionViewController__handleTapOnGroupActionChatItem___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) fileTransferGUIDs];
  id v4 = [v2 firstObject];

  id v3 = [*(id *)(a1 + 40) chat];
  [v3 sendGroupPhotoUpdate:v4];
}

- (void)_handleTapOnParticipantChangeChatItem:(id)a3
{
  id v4 = a3;
  if ([v4 failed])
  {
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v4];
    uint64_t v6 = [v4 errorText];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __78__CKTranscriptCollectionViewController__handleTapOnParticipantChangeChatItem___block_invoke;
    uint64_t v11 = &unk_1E56218C8;
    id v12 = v4;
    int v13 = self;
    id v7 = [(CKTranscriptCollectionViewController *)self _buildRetryAlertWithMessage:v6 sourceView:v5 tryAgainAction:&v8];

    -[CKTranscriptCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, v8, v9, v10, v11);
  }
}

void __78__CKTranscriptCollectionViewController__handleTapOnParticipantChangeChatItem___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) handle];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) changeType];
    if (v3 == 1)
    {
      id v4 = [*(id *)(a1 + 40) conversation];
      uint64_t v5 = [*(id *)(a1 + 32) handle];
      id v7 = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
      [v4 removeRecipientHandles:v6];
    }
    else
    {
      if (v3) {
        return;
      }
      id v4 = [*(id *)(a1 + 40) conversation];
      uint64_t v5 = [*(id *)(a1 + 32) handle];
      v8[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v4 addRecipientHandles:v6];
    }
  }
}

- (void)_handleTapOnGroupTitleChangeChatItem:(id)a3
{
  id v4 = a3;
  if ([v4 failed])
  {
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v4];
    uint64_t v6 = [v4 errorText];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __77__CKTranscriptCollectionViewController__handleTapOnGroupTitleChangeChatItem___block_invoke;
    uint64_t v11 = &unk_1E56218C8;
    id v12 = self;
    id v13 = v4;
    id v7 = [(CKTranscriptCollectionViewController *)self _buildRetryAlertWithMessage:v6 sourceView:v5 tryAgainAction:&v8];

    -[CKTranscriptCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, v8, v9, v10, v11, v12);
  }
}

void __77__CKTranscriptCollectionViewController__handleTapOnGroupTitleChangeChatItem___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) chat];
  double v2 = [*(id *)(a1 + 40) title];
  [v3 setDisplayName:v2];
}

- (id)_buildRetryAlertWithMessage:(id)a3 sourceView:(id)a4 tryAgainAction:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CKAlertController alertControllerWithTitle:0 message:v9 preferredStyle:CKIsRunningInMacCatalyst() != 0];

  uint64_t v11 = CKFrameworkBundle();
  id v12 = [v11 localizedStringForKey:@"TRY_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v13 = +[CKAlertAction actionWithTitle:v12 style:0 handler:v7];

  int v14 = CKFrameworkBundle();
  char v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  char v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];

  [v10 addAction:v16];
  [v10 addAction:v13];
  int v17 = [v10 popoverPresentationController];
  [v17 setSourceView:v8];

  [v8 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  uint64_t v26 = [v10 popoverPresentationController];
  objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

  return v10;
}

- (void)_handleTapOnMessageRetractionChatItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 IMChatItem];
  if ([v5 isFailedRetraction])
  {
    uint64_t v6 = [(CKTranscriptCollectionViewController *)self conversation];
    char v7 = [v5 canRetryFailedRetraction];
    char v8 = [v6 supportsMessageEditing];
    int v9 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v8)
      {
        if (v9)
        {
          id v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)char v15 = 0;
            _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Message is still editable, presenting a resend confirmation alert to the user", v15, 2u);
          }
        }
        [(CKTranscriptCollectionViewController *)self _presentRetractedMessageResendConfirmationAlertForIMChatItem:v5];
        goto LABEL_22;
      }
      if (v9)
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)char v16 = 0;
          id v13 = "Cannot resend edit to message. Conversation no longer supports editing. Presenting an explanatory alert to the user";
          int v14 = v16;
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    else if (v9)
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = 0;
        id v13 = "Cannot resend edit to message. Message does not support retrying retraction, presenting an explanatory alert to the user";
        int v14 = (uint8_t *)&v17;
LABEL_19:
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, v13, v14, 2u);
      }
LABEL_20:
    }
    [(CKTranscriptCollectionViewController *)self _presentMessageCanNoLongerBeRetractedAlert];
LABEL_22:

    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "User selected a message retraction chat item that is not a failed retraction, ignoring selection", buf, 2u);
    }
  }
LABEL_23:
}

- (void)_presentMessageCanNoLongerBeRetractedAlert
{
  id v3 = CKFrameworkBundle();
  id v10 = [v3 localizedStringForKey:@"MESSAGE_NOT_RETRACTED_AND_NO_LONGER_RETRACTABLE_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v4 = CKFrameworkBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"MESSAGE_NOT_RETRACTED_AND_NO_LONGER_RETRACTABLE_ALERT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  uint64_t v6 = +[CKAlertController alertControllerWithTitle:v10 message:v5 preferredStyle:1];
  char v7 = CKFrameworkBundle();
  char v8 = [v7 localizedStringForKey:@"CONTINUE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  int v9 = +[CKAlertAction actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];
  [(CKTranscriptCollectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_presentRetractedMessageResendConfirmationAlertForIMChatItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"MESSAGE_NOT_RETRACTED_RETRY_RETRACTION_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  char v7 = CKFrameworkBundle();
  char v8 = [v7 localizedStringForKey:@"MESSAGE_NOT_RETRACTED_RETRY_RETRACTION_ALERT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  int v9 = +[CKAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:CKIsRunningInMacCatalyst() != 0];
  id v10 = CKFrameworkBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"TRY_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id location = 0;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__CKTranscriptCollectionViewController__presentRetractedMessageResendConfirmationAlertForIMChatItem___block_invoke;
  v17[3] = &unk_1E5627958;
  objc_copyWeak(&v19, &location);
  id v12 = v4;
  id v18 = v12;
  id v13 = +[CKAlertAction actionWithTitle:v11 style:0 handler:v17];
  [v9 addAction:v13];
  int v14 = CKFrameworkBundle();
  char v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];

  char v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];
  [v9 addAction:v16];
  [(CKTranscriptCollectionViewController *)self presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __101__CKTranscriptCollectionViewController__presentRetractedMessageResendConfirmationAlertForIMChatItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resendMessageRetractionForChatItem:*(void *)(a1 + 32)];
}

- (void)_resendMessageRetractionForChatItem:(id)a3
{
  id v4 = a3;
  id v7 = [v4 messageItem];
  uint64_t v5 = [v4 partIndex];

  uint64_t v6 = [(CKTranscriptCollectionViewController *)self conversation];
  [v6 resendEditedMessageItem:v7 forPartIndex:v5];
}

- (void)_presentEditedScheduledMessageResendConfirmationAlertForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"SCHEDULED_MESSAGE_NOT_EDITED_RETRY_EDIT_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v7 = CKFrameworkBundle();
  char v8 = [v7 localizedStringForKey:@"SCHEDULED_MESSAGE_NOT_EDITED_RETRY_EDIT_ALERT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  int v9 = +[CKAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:CKIsRunningInMacCatalyst() != 0];
  id v10 = CKFrameworkBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"TRY_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id location = 0;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104__CKTranscriptCollectionViewController__presentEditedScheduledMessageResendConfirmationAlertForMessage___block_invoke;
  v17[3] = &unk_1E5627958;
  objc_copyWeak(&v19, &location);
  id v12 = v4;
  id v18 = v12;
  id v13 = +[CKAlertAction actionWithTitle:v11 style:0 handler:v17];
  [v9 addAction:v13];
  int v14 = CKFrameworkBundle();
  char v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];

  char v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];
  [v9 addAction:v16];
  [(CKTranscriptCollectionViewController *)self presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __104__CKTranscriptCollectionViewController__presentEditedScheduledMessageResendConfirmationAlertForMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resendEditedScheduledMessageForChatItem:*(void *)(a1 + 32)];
}

- (void)_resendEditedScheduledMessageForChatItem:(id)a3
{
  id v4 = a3;
  id v10 = [v4 messageItem];
  uint64_t v5 = [v4 index];

  uint64_t v6 = [v10 historyForMessagePart:v5];
  id v7 = [v6 lastObject];
  char v8 = [v7 messagePartText];

  int v9 = [(CKTranscriptCollectionViewController *)self chat];
  [v9 editScheduledMessageItem:v10 atPartIndex:v5 withNewPartText:v8];
}

- (void)_presentCancelledScheduledMessageConfirmationAlertForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"SCHEDULED_MESSAGE_NOT_RETRACTED_RETRY_RETRACTION_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v7 = CKFrameworkBundle();
  char v8 = [v7 localizedStringForKey:@"SCHEDULED_MESSAGE_NOT_RETRACTED_RETRY_RETRACTION_ALERT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  int v9 = +[CKAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:CKIsRunningInMacCatalyst() != 0];
  id v10 = CKFrameworkBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"TRY_AGAIN" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id location = 0;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__CKTranscriptCollectionViewController__presentCancelledScheduledMessageConfirmationAlertForMessage___block_invoke;
  v17[3] = &unk_1E5627958;
  objc_copyWeak(&v19, &location);
  id v12 = v4;
  id v18 = v12;
  id v13 = +[CKAlertAction actionWithTitle:v11 style:0 handler:v17];
  [v9 addAction:v13];
  int v14 = CKFrameworkBundle();
  char v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];

  char v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];
  [v9 addAction:v16];
  [(CKTranscriptCollectionViewController *)self presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __101__CKTranscriptCollectionViewController__presentCancelledScheduledMessageConfirmationAlertForMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reattemptMessageCancellationForChatItem:*(void *)(a1 + 32)];
}

- (void)_reattemptMessageCancellationForChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self chat];
  [v5 retractMessagePart:v4];
}

- (void)_handleCommSafetyMessageSomeoneStatusButtonTappedForIndexPath:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F6E710];
  id v5 = a3;
  uint64_t v6 = [v4 sharedInstance];
  [v6 logPrivatizedUIInteractionEvent:1];

  id v7 = [(CKTranscriptCollectionViewController *)self delegate];
  [v7 transcriptCollectionViewController:self showMessageSomeoneForItemWithIndexPath:v5];
}

- (void)_handleCommSafetySensitiveReceiveStatusButtonTappedForIndexPath:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F6E710];
  id v6 = a3;
  id v5 = [v4 sharedInstance];
  [v5 logPrivatizedUIInteractionEvent:0];

  [(CKTranscriptCollectionViewController *)self presentUserInterventionScreenForIndexPath:v6 shouldTargetAssociatedItems:0];
}

- (void)touchUpInsideCellSpeakerButton:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__34;
  double v20 = __Block_byref_object_dispose__34;
  id v21 = 0;
  id v6 = [v5 indexPathsForVisibleItems];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CKTranscriptCollectionViewController_touchUpInsideCellSpeakerButton___block_invoke;
  v12[3] = &unk_1E56272B8;
  id v7 = v5;
  id v13 = v7;
  id v8 = v4;
  id v14 = v8;
  char v15 = &v16;
  [v6 enumerateObjectsUsingBlock:v12];

  if (v17[5])
  {
    uint64_t v9 = CKAudioPlaybackSpeakerEnabled() ^ 1;
    CKSetAudioPlaybackSpeakerEnabled();
    id v10 = +[CKAppAudioController sharedInstance];
    uint64_t v11 = [v10 audioController];
    [v11 setShouldUseSpeaker:v9];
  }
  _Block_object_dispose(&v16, 8);
}

void __71__CKTranscriptCollectionViewController_touchUpInsideCellSpeakerButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 speakerButton];
    uint64_t v9 = *(void **)(a1 + 40);

    if (v8 == v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)touchUpInsideCellReportSpamButton:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  uint64_t v41 = 0;
  char v42 = &v41;
  uint64_t v43 = 0x3032000000;
  double v44 = __Block_byref_object_copy__34;
  int v45 = __Block_byref_object_dispose__34;
  id v46 = 0;
  id v6 = [v5 indexPathsForVisibleItems];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __74__CKTranscriptCollectionViewController_touchUpInsideCellReportSpamButton___block_invoke;
  v37[3] = &unk_1E56272B8;
  id v7 = v5;
  id v38 = v7;
  id v8 = v4;
  id v39 = v8;
  double v40 = &v41;
  [v6 enumerateObjectsUsingBlock:v37];

  if (v42[5])
  {
    if (CKIsRunningInMessagesNotificationExtension())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Touching up inside a messages spam extension", buf, 2u);
        }
      }
    }
    else
    {
      id v10 = [v7 cellForItemAtIndexPath:v42[5]];
      if ([v10 showReportSMSSpam])
      {
        uint64_t v11 = [(CKTranscriptCollectionViewController *)self delegate];
        [v11 transcriptCollectionViewControllerDisplaySMSSpamReporting:self];
      }
      else
      {
        uint64_t v11 = [v10 reportSpamButton];
        uint64_t v33 = [(CKTranscriptCollectionViewController *)self reportJunkAlertControllerTitle];
        id v12 = +[CKAlertController alertControllerWithTitle:v33 message:0 preferredStyle:0];
        id v13 = CKFrameworkBundle();
        id v14 = [v13 localizedStringForKey:@"REPORT_SPAM_ALERT_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __74__CKTranscriptCollectionViewController_touchUpInsideCellReportSpamButton___block_invoke_1065;
        v35[3] = &unk_1E5621178;
        v35[4] = self;
        char v15 = +[CKAlertAction actionWithTitle:v14 style:2 handler:v35];
        [v12 addAction:v15];

        uint64_t v16 = CKFrameworkBundle();
        __int16 v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __74__CKTranscriptCollectionViewController_touchUpInsideCellReportSpamButton___block_invoke_1066;
        v34[3] = &unk_1E5621178;
        v34[4] = self;
        uint64_t v18 = +[CKAlertAction actionWithTitle:v17 style:1 handler:v34];
        [v12 addAction:v18];

        id v19 = [v12 popoverPresentationController];
        [v19 setPermittedArrowDirections:3];

        double v20 = [v12 popoverPresentationController];
        id v21 = [(CKTranscriptCollectionViewController *)self view];
        [v11 frame];
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        id v30 = [v11 superview];
        objc_msgSend(v21, "convertRect:fromView:", v30, v23, v25, v27, v29);
        objc_msgSend(v20, "setSourceRect:");

        uint64_t v31 = [v12 popoverPresentationController];
        uint64_t v32 = [(CKTranscriptCollectionViewController *)self view];
        [v31 setSourceView:v32];

        [(CKTranscriptCollectionViewController *)self presentViewController:v12 animated:1 completion:0];
      }
    }
  }

  _Block_object_dispose(&v41, 8);
}

void __74__CKTranscriptCollectionViewController_touchUpInsideCellReportSpamButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:");
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 reportSpamButton];
    uint64_t v9 = *(void **)(a1 + 40);

    if (v8 == v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void __74__CKTranscriptCollectionViewController_touchUpInsideCellReportSpamButton___block_invoke_1065(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "User requested to send report of junk message.", v5, 2u);
    }
  }
  [*(id *)(a1 + 32) reportJunkAlertControllerActionHandler];
}

void __74__CKTranscriptCollectionViewController_touchUpInsideCellReportSpamButton___block_invoke_1066(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) chat];
  double v2 = [v8 account];
  id v3 = [v2 service];
  if ([v3 supportsCapability:*MEMORY[0x1E4F6E0E8]])
  {
    id v4 = (void *)MEMORY[0x1E4F6BC20];
    id v5 = [*(id *)(a1 + 32) chat];
    id v6 = [v5 lastFinishedMessageItem];
    id v7 = [*(id *)(a1 + 32) chat];
    LODWORD(v4) = objc_msgSend(v4, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v6, objc_msgSend(v7, "chatStyle"));

    if (!v4) {
      return;
    }
    id v8 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v8 trackEvent:*MEMORY[0x1E4F6D7D8] withDictionary:&unk_1EDF17AF0];
  }
  else
  {
  }
}

- (void)reportJunkAlertControllerActionHandler
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CKTranscriptCollectionViewController *)self conversation];
  int v4 = [v3 shouldPresentSpamReasonPicker];

  if (v4)
  {
    id v5 = [CKReportSpamReasonContoller alloc];
    id v6 = [(CKTranscriptCollectionViewController *)self conversation];
    v31[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __78__CKTranscriptCollectionViewController_reportJunkAlertControllerActionHandler__block_invoke;
    v28[3] = &unk_1E5620C40;
    void v28[4] = self;
    id v8 = [(CKReportSpamReasonContoller *)v5 initWithConversations:v7 didReportBlock:v28];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v8];
    [v9 setModalPresentationStyle:2];
    [(CKTranscriptCollectionViewController *)self presentViewController:v9 animated:1 completion:0];

    return;
  }
  id v10 = [(CKTranscriptCollectionViewController *)self chat];
  uint64_t v11 = [v10 _messageToReportJunk];

  id v12 = (void *)MEMORY[0x1E4F6BDC0];
  id v13 = [v11 service];
  id v14 = [v12 serviceWithInternalName:v13];

  char v15 = [(CKTranscriptCollectionViewController *)self conversation];
  int v16 = [v15 isChatBot];

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Conversation is with a chatbot, starting to report chatbot as spam...", buf, 2u);
      }
    }
    uint64_t v18 = [(CKTranscriptCollectionViewController *)self chat];
    [v18 reportLazuliSpam:0 isBot:1];
LABEL_16:

    int v20 = 1;
    goto LABEL_17;
  }
  id v19 = [MEMORY[0x1E4F6BDC0] rcsService];

  if (v14 == v19)
  {
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Conversation is for an RCS message, starting to report as spam...", buf, 2u);
      }
    }
    uint64_t v18 = [(CKTranscriptCollectionViewController *)self chat];
    [v18 reportLazuliSpam:0 isBot:0];
    goto LABEL_16;
  }
  int v20 = 0;
LABEL_17:
  if ([v14 supportsCapability:*MEMORY[0x1E4F6E0E8]])
  {
    double v22 = (void *)MEMORY[0x1E4F6BC20];
    double v23 = [(CKTranscriptCollectionViewController *)self chat];
    uint64_t v24 = objc_msgSend(v22, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v11, objc_msgSend(v23, "chatStyle"));

    if (((v24 ^ 1 | v16) & 1) == 0)
    {
      double v25 = [(CKTranscriptCollectionViewController *)self chat];
      [v25 reportJunkToCarrier];

      int v20 = 1;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    double v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      int v30 = v20;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Did report conversation as spam: %{BOOL}d", buf, 8u);
    }
  }
  double v27 = [(CKTranscriptCollectionViewController *)self chat];
  objc_msgSend(v27, "markAsSpam:isJunkReportedToCarrier:", +[CKUtilities messageJunkStatus](CKUtilities, "messageJunkStatus"), v24);

  im_dispatch_after();
}

uint64_t __78__CKTranscriptCollectionViewController_reportJunkAlertControllerActionHandler__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__CKTranscriptCollectionViewController_reportJunkAlertControllerActionHandler__block_invoke_2;
  v3[3] = &unk_1E5620C40;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __78__CKTranscriptCollectionViewController_reportJunkAlertControllerActionHandler__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transcriptCollectionViewControllerReportSpamButtonTapped:*(void *)(a1 + 32)];
}

void __78__CKTranscriptCollectionViewController_reportJunkAlertControllerActionHandler__block_invoke_1077(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transcriptCollectionViewControllerReportSpamButtonTapped:*(void *)(a1 + 32)];
}

- (id)reportJunkAlertControllerTitle
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v4 = [(CKTranscriptCollectionViewController *)self chat];
  int v5 = [v4 isChatBot];

  id v6 = [(CKTranscriptCollectionViewController *)self chat];
  id v7 = [v6 account];
  id v8 = [v7 service];
  if ([v8 supportsCapability:*MEMORY[0x1E4F6E0E8]])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6BC20];
    id v10 = [(CKTranscriptCollectionViewController *)self chat];
    uint64_t v11 = [v10 lastFinishedMessageItem];
    id v12 = [(CKTranscriptCollectionViewController *)self chat];
    char v13 = objc_msgSend(v9, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v11, objc_msgSend(v12, "chatStyle")) | v5;

    if ((v13 & 1) == 0)
    {
      int v5 = 0;
      goto LABEL_8;
    }
  }
  else
  {

    if (!v5) {
      goto LABEL_8;
    }
  }
  id v14 = (void *)MEMORY[0x1E4F6E660];
  char v15 = [(CKTranscriptCollectionViewController *)self chat];
  int v16 = [v15 lastFinishedMessageItem];
  __int16 v17 = [v16 destinationCallerID];
  uint64_t v18 = [v14 carrierNameForPhoneNumber:v17];

  int v5 = v18 != 0;
  if (v18) {
    [v3 addObject:v18];
  }

LABEL_8:
  id v19 = CKFrameworkBundle();
  int v20 = [v19 localizedStringForKey:@"APPLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v3 addObject:v20];

  id v21 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v3];
  if (v5)
  {
    double v22 = NSString;
    double v23 = CKFrameworkBundle();
    uint64_t v24 = [v23 localizedStringForKey:@"REPORT_JUNK_CONVERSATION_ALERT_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v25 = objc_msgSend(v22, "stringWithFormat:", v24, v21);

    double v26 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v27 = [v26 userInterfaceLayoutDirection];

    if (v27 == 1) {
      double v28 = @"\u200F";
    }
    else {
      double v28 = @"\u200E";
    }
    uint64_t v29 = [(__CFString *)v28 stringByAppendingString:v25];
  }
  else
  {
    double v25 = CKFrameworkBundle();
    uint64_t v29 = [v25 localizedStringForKey:@"REPORT_JUNK_APPLE_CONVERSATION_ALERT_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  int v30 = (void *)v29;

  return v30;
}

- (void)_messageParents
{
  id v2 = [MEMORY[0x1E4F6BC88] sharedInstance];
  [v2 getOpenChatURLWith:&__block_literal_global_1092];
}

void __55__CKTranscriptCollectionViewController__messageParents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F42738];
  id v3 = a2;
  id v4 = [v2 sharedApplication];
  [v4 openURL:v3 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)_showMoreHelp
{
  id v15 = +[CKCommSafetyHelper waysToGetHelpURL];
  id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  id v4 = [MEMORY[0x1E4F46710] nonPersistentDataStore];
  [v3 setWebsiteDataStore:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F466F0]);
  id v6 = objc_msgSend(v5, "initWithFrame:configuration:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = objc_alloc(MEMORY[0x1E4F290D0]);
  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
  uint64_t v9 = (void *)[v7 initWithURL:v8];

  id v10 = (id)[v6 loadRequest:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  [v11 setView:v6];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__dismissMoreHelpView_];
  char v13 = [v11 navigationItem];
  [v13 setRightBarButtonItem:v12];

  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v11];
  [v14 setModalPresentationStyle:2];
  [(CKTranscriptCollectionViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)_dismissMoreHelpView:(id)a3
{
}

void __53__CKTranscriptCollectionViewController__blockHandle___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F6E620] sharedBlockList];
  id v3 = [*(id *)(a1 + 32) ID];
  [v2 blockAddress:v3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CKTranscriptCollectionViewController__blockHandle___block_invoke_2;
  block[3] = &unk_1E5620C40;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__CKTranscriptCollectionViewController__blockHandle___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__CKTranscriptCollectionViewController__blockHandle___block_invoke_3;
  v3[3] = &unk_1E5620C40;
  v3[4] = v1;
  return [v1 updateTranscript:v3 animated:0 completion:0];
}

uint64_t __53__CKTranscriptCollectionViewController__blockHandle___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceReloadChatItems];
}

- (void)_showLeaveConversationFromView:(id)a3
{
  id v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"LEAVE_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v6 = +[CKAlertController alertControllerWithTitle:0 message:0 preferredStyle:CKIsRunningInMacCatalyst() != 0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CKTranscriptCollectionViewController__showLeaveConversationFromView___block_invoke;
  v11[3] = &unk_1E5621178;
  void v11[4] = self;
  id v7 = +[CKAlertAction actionWithTitle:v5 style:2 handler:v11];
  [v6 addAction:v7];

  id v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v10 = +[CKAlertAction actionWithTitle:v9 style:1 handler:0];
  [v6 addAction:v10];

  [(CKTranscriptCollectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __71__CKTranscriptCollectionViewController__showLeaveConversationFromView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  id v3 = [v2 chat];
  [v3 leave];

  id v4 = [*(id *)(a1 + 32) conversation];
  id v5 = [v4 chat];
  int v6 = [v5 hasRecipientsFollowingLocation];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F42728];
    id v8 = CKFrameworkBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"STOP_SHARING_ON_DELETE_OR_LEAVE_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v10 = [v7 alertControllerWithTitle:0 message:v9 preferredStyle:1];

    id v11 = CKFrameworkBundle();
    id v12 = [v11 localizedStringForKey:@"YES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __71__CKTranscriptCollectionViewController__showLeaveConversationFromView___block_invoke_2;
    v20[3] = &unk_1E5621178;
    void v20[4] = *(void *)(a1 + 32);
    char v13 = +[CKAlertAction actionWithTitle:v12 style:0 handler:v20];
    [v10 addAction:v13];

    id v14 = CKFrameworkBundle();
    id v15 = [v14 localizedStringForKey:@"NO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    int v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];
    [v10 addAction:v16];

    [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
  }
  __int16 v17 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__CKTranscriptCollectionViewController__showLeaveConversationFromView___block_invoke_3;
  v19[3] = &unk_1E5620C40;
  void v19[4] = v17;
  return [v17 updateTranscript:v19 animated:0 completion:0];
}

void __71__CKTranscriptCollectionViewController__showLeaveConversationFromView___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  uint64_t v1 = [v2 chat];
  [v1 stopSharingLocation];
}

uint64_t __71__CKTranscriptCollectionViewController__showLeaveConversationFromView___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceReloadChatItems];
}

- (void)_showBlockContactSelectionAlertFromView:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = IMSharedUtilitiesFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"BLOCK_CONTACT_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"CommSafetyLocalizable"];
  int v6 = +[CKAlertController alertControllerWithTitle:v5 message:0 preferredStyle:CKIsRunningInMacCatalyst() != 0];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = [(CKTranscriptCollectionViewController *)self conversation];
  id v8 = [v7 recipients];

  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  id v10 = &off_1E561D000;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v15 = [v14 name];
        int v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          [v14 defaultIMHandle];
          uint64_t v18 = v12;
          id v19 = v6;
          int v20 = self;
          v22 = id v21 = v10;
          id v17 = [v22 displayID];

          id v10 = v21;
          self = v20;
          int v6 = v19;
          uint64_t v12 = v18;
        }

        double v23 = v10[68];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __80__CKTranscriptCollectionViewController__showBlockContactSelectionAlertFromView___block_invoke;
        v30[3] = &unk_1E56218C8;
        void v30[4] = self;
        v30[5] = v14;
        uint64_t v24 = [v23 actionWithTitle:v17 style:2 handler:v30];
        [v6 addAction:v24];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  double v25 = v10[68];
  double v26 = CKFrameworkBundle();
  uint64_t v27 = [v26 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v28 = [v25 actionWithTitle:v27 style:1 handler:0];
  [v6 addAction:v28];

  [(CKTranscriptCollectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __80__CKTranscriptCollectionViewController__showBlockContactSelectionAlertFromView___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) defaultIMHandle];
  [v1 _blockHandle:v2];
}

- (void)addContentAnimationPauseReasons:(int64_t)a3
{
  int64_t contentAnimationPauseReasons = self->_contentAnimationPauseReasons;
  self->_int64_t contentAnimationPauseReasons = contentAnimationPauseReasons | a3;
  if (contentAnimationPauseReasons) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 0;
  }
  if (!v4) {
    [(CKTranscriptCollectionViewController *)self updateAnimationPaused];
  }
}

- (void)removeContentAnimationPauseReasons:(int64_t)a3
{
  int64_t contentAnimationPauseReasons = self->_contentAnimationPauseReasons;
  int64_t v4 = contentAnimationPauseReasons & ~a3;
  self->_int64_t contentAnimationPauseReasons = v4;
  if (contentAnimationPauseReasons) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    [(CKTranscriptCollectionViewController *)self updateAnimationPaused];
  }
}

- (void)updateAnimationPaused
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  int64_t v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v9, "setAnimationPauseReasons:", -[CKTranscriptCollectionViewController contentAnimationPauseReasons](self, "contentAnimationPauseReasons"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)cullCellSubviews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  int64_t v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector())
        {
          long long v10 = [v9 balloonView];
          [(CKTranscriptCollectionViewController *)self convertedBoundsToCullFromView:v10];
          objc_msgSend(v10, "cullSubviewsWithVisibleBounds:");
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (CGRect)convertedBoundsToCullFromView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v5 bounds];
  objc_msgSend(v5, "convertRect:toView:", v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_releaseActiveBalloonControllers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          double v10 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
          double v11 = [v9 extensibleViewControllerForContext:v10];

          double v12 = [v11 parentViewController];
          double v13 = v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14 || v12 == self)
          {
            double v16 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
            [v9 releaseBalloonControllerIfNeededForContext:v16];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)repromptLastBlackholeFailureIfNotPrompted
{
  id v3 = [(CKTranscriptCollectionViewController *)self lastMessagePartChatItem];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 IMChatItem];
    if ([(CKTranscriptCollectionViewController *)self shouldPresentHawkingPromptForChatItem:v5])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Hawking: Found blackholed message that hasn't been prompted", v7, 2u);
        }
      }
      [(CKTranscriptCollectionViewController *)self presentHawkingPromptForChatItem:v5];
    }
  }
}

- (BOOL)shouldPresentHawkingPromptForChatItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 message];
    uint64_t v6 = [(CKTranscriptCollectionViewController *)self presentedViewController];
    if (v6)
    {
    }
    else
    {
      double v8 = [(CKTranscriptCollectionViewController *)self __CurrentTestName];

      if (!v8)
      {
        int v10 = [v5 isFromMe];
        double v11 = [v5 error];
        uint64_t v12 = [v11 code];

        int v13 = objc_msgSend(v5, "__ck_isiMessage");
        if (v10)
        {
          if (v12 == 43)
          {
            if (v13)
            {
              BOOL v14 = [(CKTranscriptCollectionViewController *)self conversation];
              double v15 = [v14 chat];
              double v16 = [v15 valueForChatProperty:*MEMORY[0x1E4F6BE40]];

              if (!v16
                || ([v5 time],
                    long long v17 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v18 = [v16 compare:v17],
                    v17,
                    v16,
                    v18 == -1))
              {
                BOOL v7 = 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
    BOOL v7 = 0;
LABEL_7:

    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)presentHawkingPromptForChatItem:(id)a3
{
  id v24 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = v24;
  if (isKindOfClass)
  {
    uint64_t v6 = [v24 message];
    BOOL v7 = [(CKTranscriptCollectionViewController *)self conversation];
    double v8 = [v7 recipient];
    id v9 = [v8 IDSCanonicalAddress];
    int v10 = MEMORY[0x192FBA710]();

    double v11 = [(CKTranscriptCollectionViewController *)self conversation];
    uint64_t v12 = [v11 chat];
    int v13 = [v12 lastAddressedHandleID];

    BOOL v14 = MEMORY[0x192FBA710](v13);
    int IsEmail = IMStringIsEmail();
    if (objc_msgSend(v6, "__ck_isiMessage")
      && [MEMORY[0x1E4F6BDC0] smsEnabled]
      && ([(CKTranscriptCollectionViewController *)self conversation],
          double v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isBusinessConversation],
          v16,
          ((v17 | IsEmail) & 1) == 0))
    {
      double v23 = [(CKTranscriptCollectionViewController *)self conversation];
      uint64_t v18 = [v23 isToEmailAddress] ^ 1;
    }
    else
    {
      uint64_t v18 = 0;
    }
    long long v19 = [(CKTranscriptCollectionViewController *)self makeHawkingPromptForMessage:v6 toRecipient:v10 fromSender:v14 withSMSOption:v18];
    [(CKTranscriptCollectionViewController *)self presentViewController:v19 animated:1 completion:0];
    long long v20 = [(CKTranscriptCollectionViewController *)self conversation];
    id v21 = [v20 chat];
    uint64_t v22 = [v6 time];
    [v21 setValue:v22 forChatProperty:*MEMORY[0x1E4F6BE40]];

    uint64_t v5 = v24;
  }
}

- (id)makeHawkingPromptForMessage:(id)a3 toRecipient:(id)a4 fromSender:(id)a5 withSMSOption:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v43 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v48 = v10;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Hawking: Showing non-cellular blackhole prompt for message (%@)", buf, 0xCu);
    }
  }
  if (IMStringIsEmail())
  {
    int v13 = NSString;
    BOOL v14 = CKFrameworkBundle();
    double v15 = [v14 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_TITLE_%@" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v16 = objc_msgSend(v13, "stringWithFormat:", v15, v11);

    int v17 = [MEMORY[0x1E4F42738] sharedApplication];
    LODWORD(v14) = [v17 userInterfaceLayoutDirection] == 1;

    if (v14) {
      uint64_t v18 = @"\u200F";
    }
    else {
      uint64_t v18 = @"\u200E";
    }
    long long v19 = [(__CFString *)v18 stringByAppendingString:v16];
  }
  else
  {
    double v16 = IMFormattedDisplayStringForNumber();
    long long v20 = NSString;
    id v21 = CKFrameworkBundle();
    uint64_t v22 = [v21 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_TITLE_%@" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v23 = objc_msgSend(v20, "stringWithFormat:", v22, v16);

    id v24 = [MEMORY[0x1E4F42738] sharedApplication];
    LODWORD(v21) = [v24 userInterfaceLayoutDirection] == 1;

    if (v21) {
      double v25 = @"\u200F";
    }
    else {
      double v25 = @"\u200E";
    }
    long long v19 = [(__CFString *)v25 stringByAppendingString:v23];
  }
  double v26 = [(CKTranscriptCollectionViewController *)self hawkingFailurePromptMessageForHandle:v43];
  uint64_t v27 = +[CKAlertController alertControllerWithTitle:v19 message:v26 preferredStyle:1];

  double v28 = CKFrameworkBundle();
  uint64_t v29 = [v28 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_RESEND_AS_SMS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __105__CKTranscriptCollectionViewController_makeHawkingPromptForMessage_toRecipient_fromSender_withSMSOption___block_invoke;
  void v44[3] = &unk_1E56218C8;
  id v30 = v10;
  id v45 = v30;
  id v46 = self;
  long long v31 = +[CKAlertAction actionWithTitle:v29 style:0 handler:v44];

  long long v32 = CKFrameworkBundle();
  long long v33 = [v32 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_MESSAGE_LEARN_MORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  long long v34 = +[CKAlertAction actionWithTitle:v33 style:0 handler:&__block_literal_global_1131_0];

  id v35 = CKFrameworkBundle();
  uint64_t v36 = v35;
  if (v6)
  {
    id v37 = [v35 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v38 = +[CKAlertAction actionWithTitle:v37 style:0 handler:0];

    [v27 addAction:v31];
    [v27 setPreferredAction:v31];
  }
  else
  {
    id v39 = [v35 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v38 = +[CKAlertAction actionWithTitle:v39 style:0 handler:0];
  }
  [v27 addAction:v34];
  [v27 addAction:v38];
  double v40 = [v27 preferredAction];
  BOOL v41 = v40 == 0;

  if (v41) {
    [v27 setPreferredAction:v38];
  }

  return v27;
}

void __105__CKTranscriptCollectionViewController_makeHawkingPromptForMessage_toRecipient_fromSender_withSMSOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Hawking: Original message blackholed, sending message as SMS. %@", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v6 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v6 trackSpamEvent:10];

  [*(id *)(a1 + 40) _downgradeMessage:*(void *)(a1 + 32) andDowngradeChat:1];
}

void __105__CKTranscriptCollectionViewController_makeHawkingPromptForMessage_toRecipient_fromSender_withSMSOption___block_invoke_1129(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Hawking: Sending user to Hawking KB article", v6, 2u);
    }
  }
  id v4 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v5 = [MEMORY[0x1E4F6EA38] internationalSpamFilterLearnMoreURL];
  [v4 openURL:v5 withCompletionHandler:0];
}

- (id)hawkingFailurePromptMessageForHandle:(id)a3
{
  id v3 = a3;
  id v4 = MEMORY[0x192FBA710]();
  int IsEmail = IMStringIsEmail();

  if (IsEmail)
  {
    BOOL v6 = NSString;
    int v7 = CKFrameworkBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_MESSAGE_EMAIL_ADDRESS_%@" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v8, v4);

    id v10 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v11 = [v10 userInterfaceLayoutDirection];

    if (v11 == 1) {
      uint64_t v12 = @"\u200F";
    }
    else {
      uint64_t v12 = @"\u200E";
    }
    int v13 = [(__CFString *)v12 stringByAppendingString:v9];
  }
  else
  {
    uint64_t v9 = IMFormattedDisplayStringForNumber();
    BOOL v14 = NSString;
    double v15 = CKFrameworkBundle();
    double v16 = [v15 localizedStringForKey:@"HAWKING_FAILURE_PROMPT_MESSAGE_PHONE_NUMBER_%@" value:&stru_1EDE4CA38 table:@"ChatKit"];
    int v17 = objc_msgSend(v14, "stringWithFormat:", v16, v9);

    uint64_t v18 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v19 = [v18 userInterfaceLayoutDirection];

    if (v19 == 1) {
      long long v20 = @"\u200F";
    }
    else {
      long long v20 = @"\u200E";
    }
    int v13 = [(__CFString *)v20 stringByAppendingString:v17];
  }

  return v13;
}

- (void)_replayLastImpactEffectIfNotFromMe
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKTranscriptCollectionViewController *)self presentedViewController];
  if (!v3)
  {
    id v4 = [(CKTranscriptCollectionViewController *)self __CurrentTestName];

    if (v4 || IMSharedHelperIsOlderDevice() && CKIsRunningInMessagesNotificationExtension()) {
      return;
    }
    uint64_t v5 = [(CKTranscriptCollectionViewController *)self collectionView];
    BOOL v6 = [(CKTranscriptCollectionViewController *)self lastMessagePartChatItem];
    if (v6)
    {
      int v7 = [(CKTranscriptCollectionViewController *)self cellForChatItem:v6];
      uint64_t v8 = v7;
      if (v7)
      {
        [v7 frame];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        int v17 = [v8 superview];
        objc_msgSend(v5, "convertRect:fromView:", v17, v10, v12, v14, v16);
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;

        [v5 contentOffset];
        CGFloat v27 = v26;
        [v5 frame];
        CGFloat v29 = v28;
        [v5 frame];
        v66.size.CGFloat height = v30;
        v66.origin.double x = 0.0;
        v65.origin.double x = v19;
        v65.origin.double y = v21;
        v65.size.CGFloat width = v23;
        v65.size.CGFloat height = v25;
        v66.origin.double y = v27;
        v66.size.CGFloat width = v29;
        if (CGRectIntersectsRect(v65, v66))
        {
          long long v31 = [(CKTranscriptCollectionViewController *)self chatItems];
          long long v32 = [v31 lastObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {

            goto LABEL_31;
          }
          long long v34 = [v6 IMChatItem];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v35 = [v34 message];
            int v36 = [v35 isFromMe];
            if (CKIsRunningInCarousel())
            {
              BOOL v37 = 0;
            }
            else
            {
              id v38 = [v35 timeExpressiveSendPlayed];
              BOOL v37 = v38 != 0;
            }
            if ((v36 | v37) == 1
              && (-[CKTranscriptCollectionViewController playedLastImpactEffectForTransitionFromComposing](self, "playedLastImpactEffectForTransitionFromComposing")|| !-[CKTranscriptCollectionViewController transitionedFromComposing](self, "transitionedFromComposing")|| (-[CKTranscriptCollectionViewController delegate](self, "delegate"), id v39 = objc_claimAutoreleasedReturnValue(), v40 = [v39 transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:self], v39, !v40)))
            {
              if (IMOSLoggingEnabled())
              {
                id v43 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  BOOL v46 = [(CKTranscriptCollectionViewController *)self playedLastImpactEffectForTransitionFromComposing];
                  BOOL v45 = [(CKTranscriptCollectionViewController *)self transitionedFromComposing];
                  double v44 = [(CKTranscriptCollectionViewController *)self delegate];
                  *(_DWORD *)long long buf = 67110144;
                  int v54 = v36;
                  __int16 v55 = 1024;
                  BOOL v56 = v37;
                  __int16 v57 = 1024;
                  BOOL v58 = v46;
                  __int16 v59 = 1024;
                  BOOL v60 = v45;
                  __int16 v61 = 1024;
                  int v62 = [v44 transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:self];
                  _os_log_impl(&dword_18EF18000, v43, OS_LOG_TYPE_INFO, "Not starting FSM. messageIsFromMe: %d - effectHasBeenPlayed: %d - playedLastImpactForTransitionFromComposing: %d - transitionedFromComposing: %d - playbackAllowed: %d", buf, 0x20u);
                }
              }
            }
            else
            {
              if (v36) {
                [(CKTranscriptCollectionViewController *)self setPlayedLastImpactEffectForTransitionFromComposing:1];
              }
              BOOL v41 = [v35 expressiveSendStyleID];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __74__CKTranscriptCollectionViewController__replayLastImpactEffectIfNotFromMe__block_invoke;
              block[3] = &unk_1E5623170;
              id v48 = v41;
              uint64_t v49 = self;
              id v50 = v35;
              id v51 = v34;
              id v52 = v6;
              id v42 = v41;
              dispatch_async(MEMORY[0x1E4F14428], block);
            }
          }
        }
      }
    }
LABEL_31:

    return;
  }
}

uint64_t __74__CKTranscriptCollectionViewController__replayLastImpactEffectIfNotFromMe__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (+[CKImpactEffectManager identifierIsAnimatedImpactEffect:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) setHiddenBalloonViews:0];
    id v2 = [*(id *)(a1 + 40) impactEffectManager];
    v9[0] = *(void *)(a1 + 48);
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v2 animateMessages:v3];

    id v4 = [*(id *)(a1 + 40) chat];
    [v4 markChatItemAsPlayedExpressiveSend:*(void *)(a1 + 56)];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[CKTranscriptCollectionViewController _replayLastImpactEffectIfNotFromMe]_block_invoke";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s - Replaying last effect", (uint8_t *)&v7, 0xCu);
    }
  }
  return [*(id *)(a1 + 40) startFullscreenEffectIfNeededForChatItem:*(void *)(a1 + 64)];
}

- (void)_downgradeMessage:(id)a3
{
}

- (void)_downgradeMessage:(id)a3 andDowngradeChat:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    if (objc_msgSend(v6, "__ck_isSMS"))
    {
      [(CKTranscriptCollectionViewController *)self _resendMessage:v7];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(29);
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          id v9 = [v7 guid];
          double v10 = [(CKTranscriptCollectionViewController *)self conversation];
          *(_DWORD *)long long buf = 138412546;
          id v19 = v9;
          __int16 v20 = 2112;
          CGFloat v21 = v10;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Manually downgrading message with GUID {%@} -- conversation:%@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_CKShouldLogExternal())
        {
          double v11 = [v7 guid];
          [(CKTranscriptCollectionViewController *)self conversation];
          v15 = double v14 = v11;
          _CKLogExternal();
        }
      }
      double v12 = [(CKConversation *)self->_conversation chat];
      [v12 downgradeMessage:v7 manualDowngrade:1 downgradeChat:v4];

      double v13 = objc_msgSend(v7, "__ck_downgradedMessage");

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      uint8_t v16[2] = __75__CKTranscriptCollectionViewController__downgradeMessage_andDowngradeChat___block_invoke;
      v16[3] = &unk_1E5620AF8;
      v16[4] = self;
      id v17 = v13;
      id v7 = v13;
      [(CKTranscriptCollectionViewController *)self updateTranscript:v16 animated:0 completion:0];
    }
  }
}

void __75__CKTranscriptCollectionViewController__downgradeMessage_andDowngradeChat___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 1056);
  id v3 = [MEMORY[0x1E4F6BDB8] smsService];
  [v2 sendMessage:v1 onService:v3 newComposition:0];
}

- (void)_resendMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "Resending message %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __55__CKTranscriptCollectionViewController__resendMessage___block_invoke;
    v9[3] = &unk_1E5620AF8;
    id v10 = v4;
    double v11 = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__CKTranscriptCollectionViewController__resendMessage___block_invoke_2;
    void v6[3] = &unk_1E5620AF8;
    id v7 = v10;
    uint64_t v8 = self;
    [(CKTranscriptCollectionViewController *)self updateTranscript:v9 animated:0 completion:v6];
  }
}

void __55__CKTranscriptCollectionViewController__resendMessage___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__ck_service");

  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(id **)(v5 + 8);
  id v6 = v3[132];
  if (v2) {
    [v3 _serviceForResendingMessage:v4];
  }
  else {
  id v7 = [v3[132] sendingService];
  }
  [v6 retryMessage:v4 onService:v7];
}

void __55__CKTranscriptCollectionViewController__resendMessage___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = [v2 code];

  if (v3 == 43)
  {
    id v5 = [*(id *)(a1 + 40) conversation];
    uint64_t v4 = [v5 chat];
    [v4 refreshServiceForSending];
  }
}

- (id)_serviceForResendingMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "__ck_service");
  id v5 = [MEMORY[0x1E4F6BDB8] satelliteSMSService];
  if (v4 == v5)
  {
    id v6 = [MEMORY[0x1E4F6BC48] sharedInstance];
    char v7 = [v6 isSatelliteConnectionActive];

    if ((v7 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          id v9 = [v3 guid];
          int v12 = 138412290;
          id v13 = v9;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Resending %@ as SMS, was satellite but satellite unavailable", (uint8_t *)&v12, 0xCu);
        }
      }
      uint64_t v10 = [MEMORY[0x1E4F6BDB8] smsService];

      uint64_t v4 = (void *)v10;
    }
  }
  else
  {
  }

  return v4;
}

- (void)_resendMessageUsingCurrentService:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "Resending message using current service %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __74__CKTranscriptCollectionViewController__resendMessageUsingCurrentService___block_invoke;
    v9[3] = &unk_1E5620AF8;
    void v9[4] = self;
    id v10 = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__CKTranscriptCollectionViewController__resendMessageUsingCurrentService___block_invoke_2;
    void v6[3] = &unk_1E5620AF8;
    id v7 = v10;
    uint64_t v8 = self;
    [(CKTranscriptCollectionViewController *)self updateTranscript:v9 animated:0 completion:v6];
  }
}

void __74__CKTranscriptCollectionViewController__resendMessageUsingCurrentService___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 1056);
  id v3 = [v2 sendingService];
  [v2 retryMessage:v1 onService:v3];
}

void __74__CKTranscriptCollectionViewController__resendMessageUsingCurrentService___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = [v2 code];

  if (v3 == 43)
  {
    id v5 = [*(id *)(a1 + 40) conversation];
    id v4 = [v5 chat];
    [v4 refreshServiceForSending];
  }
}

- (void)_resendFailedMessages
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKTranscriptCollectionViewController *)self chat];
  int v4 = [v3 isStewieEmergencyChat];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
    uint64_t v6 = [v5 mostRecentlyUsedConversationForEmergency];
LABEL_5:
    uint64_t v9 = v6;

    id v10 = [(CKTranscriptCollectionViewController *)self chatItems];
    double v11 = objc_msgSend(v10, "__ck_failedMessagesForChatItemsWithConversationID:", v9);

    if ([v11 count])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __61__CKTranscriptCollectionViewController__resendFailedMessages__block_invoke;
      v18[3] = &unk_1E5620AF8;
      id v19 = v11;
      __int16 v20 = self;
      [(CKTranscriptCollectionViewController *)self updateTranscript:v18 animated:0 completion:&__block_literal_global_1161_0];
    }
    return;
  }
  id v7 = [(CKTranscriptCollectionViewController *)self chat];
  int v8 = [v7 isStewieRoadsideChat];

  if (v8)
  {
    id v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
    uint64_t v6 = [v5 mostRecentlyUsedConversationForRoadside];
    goto LABEL_5;
  }
  long long v21 = xmmword_1E5627998;
  long long v22 = *(_OWORD *)off_1E56279A8;
  id v12 = NSString;
  uint64_t v13 = IMFileLocationTrimFileName();
  uint64_t v14 = [NSString stringWithFormat:@"_resendFailedMessages: Unsupported service"];
  double v15 = [v12 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "-[CKTranscriptCollectionViewController _resendFailedMessages]", v13, 11669, v14];

  double v16 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v16)
  {
    v16(v15);
  }
  else if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      double v24 = v15;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
}

void __61__CKTranscriptCollectionViewController__resendFailedMessages__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(27);
          id v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v16 = v6;
            _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "Resending Stewie message %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          uint64_t v10 = v6;
          _CKLog();
        }
        int v8 = *(void **)(*(void *)(a1 + 40) + 1056);
        uint64_t v9 = objc_msgSend(v8, "sendingService", v10);
        [v8 retryMessage:v6 onService:v9];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v3);
  }
}

- (void)transferRestored:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  uint64_t v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v7 = objc_msgSend(v6, "__ck_indexOfTransfer:", v5);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = [v4 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v4 object];
      long long v11 = [(CKTranscriptCollectionViewController *)self chatItems];
      int v12 = [v11 containsObject:v10];

      if (v12) {
        [(CKTranscriptCollectionViewController *)self reloadData];
      }
    }
  }
  else
  {
    long long v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      long long v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v18 = v5;
        __int16 v19 = 2112;
        __int16 v20 = v13;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_DEBUG, "Transfer %@ restored. Reload indexes %@.", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      double v15 = v5;
      uint64_t v16 = v13;
      _CKLog();
    }
    objc_msgSend(v6, "__ck_unloadSizesAtIndexes:", v13, v15, v16);
    [(CKTranscriptCollectionViewController *)self reloadData];
  }
}

- (id)stateDictionaryForDiagnosticsRequest
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __76__CKTranscriptCollectionViewController_stateDictionaryForDiagnosticsRequest__block_invoke;
  uint64_t v16 = &unk_1E56255D8;
  id v17 = v3;
  id v5 = v3;
  [v4 enumerateObjectsWithOptions:2 usingBlock:&v13];

  [(CKTranscriptCollectionViewController *)self _logVisibleChatItems];
  v18[0] = @"debugDescription";
  uint64_t v6 = [(CKTranscriptCollectionViewController *)self debugDescription];
  v19[0] = v6;
  v19[1] = v5;
  v18[1] = @"bottomChatItems";
  v18[2] = @"chat";
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self chat];
  uint64_t v8 = [v7 stateDictionaryForDiagnosticsRequest];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = @"nil";
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  v19[2] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  return v11;
}

void __76__CKTranscriptCollectionViewController_stateDictionaryForDiagnosticsRequest__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 IMChatItem];
  id v4 = [v3 guid];

  if ((unint64_t)[*(id *)(a1 + 32) count] <= 0x31)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = NSString;
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)v8;
    uint64_t v10 = @"nil";
    if (v4) {
      uint64_t v10 = v4;
    }
    long long v11 = [v6 stringWithFormat:@"%@: %@", v8, v10];
    [v5 addObject:v11];
  }
}

- (void)_logVisibleChatItems
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v3 = [v2 isInternalInstall];

  if (v3)
  {
    if ([(CKTranscriptCollectionViewController *)self isViewLoaded])
    {
      id v4 = [(CKTranscriptCollectionViewController *)self view];
      id v5 = [v4 window];

      if (v5)
      {
        id v90 = [MEMORY[0x1E4F1CA48] array];
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        uint64_t v6 = [(CKTranscriptCollectionViewController *)self collectionView];
        uint64_t v7 = [v6 indexPathsForVisibleItems];

        uint64_t v8 = [v7 countByEnumeratingWithState:&v100 objects:v108 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v101;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v101 != v9) {
                objc_enumerationMutation(v7);
              }
              long long v11 = *(void **)(*((void *)&v100 + 1) + 8 * i);
              if ([v11 item] < 0
                || (unint64_t v12 = [v11 item],
                    [(CKTranscriptCollectionViewController *)self chatItems],
                    uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                    LOBYTE(v12) = v12 < [v13 count],
                    v13,
                    (v12 & 1) == 0))
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v18 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "index path out of bounds. Continuing", buf, 2u);
                  }
                }
              }
              else
              {
                uint64_t v14 = [(CKTranscriptCollectionViewController *)self chatItems];
                double v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v11, "item"));

                uint64_t v16 = [v15 IMChatItem];
                objc_opt_class();
                int isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & [(id)objc_opt_class() instancesRespondToSelector:sel_message]) == 1)objc_msgSend(v90, "addObject:", v15); {
              }
                }
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v100 objects:v108 count:16];
          }
          while (v8);
        }

        [v90 sortUsingComparator:&__block_literal_global_1185];
        id v89 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        if ([v90 count])
        {
          unint64_t v19 = 0;
          do
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            id v85 = [v90 objectAtIndex:v19];
            uint64_t v21 = [(CKTranscriptCollectionViewController *)self collectionView];
            long long v22 = [v21 visibleCells];
            uint64_t v87 = [v22 objectAtIndex:v19];

            CGFloat v23 = [v85 IMChatItem];
            double v24 = [v23 message];

            if ([v24 isFromMe]) {
              uint64_t v25 = @"\t\t\t\t\t\t\t\t\t\t";
            }
            else {
              uint64_t v25 = &stru_1EDE4CA38;
            }
            double v26 = [v24 text];
            CGFloat v27 = [v26 string];

            if ((unint64_t)[v27 length] <= 2)
            {
              id v28 = v27;
            }
            else
            {
              objc_msgSend(v27, "substringWithRange:", 0, 3);
              id v28 = (id)objc_claimAutoreleasedReturnValue();
            }
            [v89 appendString:@"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n"];
            [v20 appendString:@"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n"];
            CGFloat v29 = [NSString stringWithFormat:@"%@id: %lld   message: %@\n", v25, objc_msgSend(v24, "messageID"), v24];
            [v89 appendString:v29];

            CGFloat v30 = [NSString stringWithFormat:@"%@id: %lld   message: %@\n", v25, objc_msgSend(v24, "messageID"), v24];
            [v20 appendString:v30];

            long long v31 = NSString;
            long long v32 = [v24 fileTransferGUIDs];
            long long v33 = [v31 stringWithFormat:@"%@fileTransferGUIDs: %@\n", v25, v32];
            [v89 appendString:v33];

            long long v34 = NSString;
            id v35 = [v24 fileTransferGUIDs];
            int v36 = [v34 stringWithFormat:@"%@fileTransferGUIDs: %@\n", v25, v35];
            [v20 appendString:v36];

            BOOL v37 = [NSString stringWithFormat:@"%@associated cell: %p\n", v25, v87];
            [v89 appendString:v37];

            id v38 = [NSString stringWithFormat:@"%@associated cell: %p\n", v25, v87];
            [v20 appendString:v38];

            id v39 = [NSString stringWithFormat:@"%@redacted text: %@\n", v25, v28];
            [v89 appendString:v39];

            int v40 = [NSString stringWithFormat:@"%@redacted text: %@\n", v25, v28];
            [v20 appendString:v40];

            BOOL v41 = NSString;
            id v42 = [v24 text];
            id v43 = [v42 string];
            double v44 = [v41 stringWithFormat:@"%@Text CharacterCount: %tu\n", v25, objc_msgSend(v43, "length")];
            [v89 appendString:v44];

            BOOL v45 = NSString;
            BOOL v46 = [v24 text];
            uint64_t v47 = [v46 string];
            id v48 = [v45 stringWithFormat:@"%@Text CharacterCount: %tu\n", v25, objc_msgSend(v47, "length")];
            [v20 appendString:v48];

            uint64_t v49 = [NSString stringWithFormat:@"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n\n\n"];
            [v89 appendString:v49];

            id v50 = [NSString stringWithFormat:@"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n\n\n"];
            [v20 appendString:v50];

            if (IMOSLoggingEnabled())
            {
              id v51 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                id v107 = v20;
                _os_log_impl(&dword_18EF18000, v51, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
              }
            }
            ++v19;
          }
          while (v19 < [v90 count]);
        }
        id v52 = [(CKTranscriptCollectionViewController *)self view];
        id v86 = [v52 recursiveDescription];

        id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        int v54 = [MEMORY[0x1E4F42738] sharedApplication];
        __int16 v55 = [v54 windows];

        uint64_t v56 = [v55 countByEnumeratingWithState:&v96 objects:v105 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v97;
          do
          {
            for (uint64_t j = 0; j != v56; ++j)
            {
              if (*(void *)v97 != v57) {
                objc_enumerationMutation(v55);
              }
              __int16 v59 = *(void **)(*((void *)&v96 + 1) + 8 * j);
              BOOL v60 = NSString;
              __int16 v61 = [v59 recursiveDescription];
              int v62 = [v60 stringWithFormat:@"Showing hierarchy for window   %@\n%@", v59, v61];

              [v53 addObject:v62];
            }
            uint64_t v56 = [v55 countByEnumeratingWithState:&v96 objects:v105 count:16];
          }
          while (v56);
        }

        uint64_t v63 = [MEMORY[0x1E4F42D40] currentFirstResponder];
        __int16 v64 = [(CKTranscriptCollectionViewController *)self parentViewController];
        BOOL v65 = v64 == v63;

        if (v65)
        {
          CGRect v66 = [(CKTranscriptCollectionViewController *)self parentViewController];
          id v88 = [v66 inputAccessoryView];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v88 = v63;
          }
          else {
            id v88 = 0;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && IMOSLoggingEnabled())
        {
          char v67 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            uint64_t v68 = [v88 delegate];
            *(_DWORD *)long long buf = 138412290;
            id v107 = v68;
            _os_log_impl(&dword_18EF18000, v67, OS_LOG_TYPE_INFO, "inputAccessory's delegate  %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v69 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
          }
        }
        if (IMOSLoggingEnabled())
        {
          char v70 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            id v71 = [MEMORY[0x1E4F1C9C8] date];
            *(_DWORD *)long long buf = 138412290;
            id v107 = v71;
            _os_log_impl(&dword_18EF18000, v70, OS_LOG_TYPE_INFO, "Timestamp\t\t%@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          id v72 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v107 = v63;
            _os_log_impl(&dword_18EF18000, v72, OS_LOG_TYPE_INFO, "Current Responder\t\t%@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v73 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v107 = v88;
            _os_log_impl(&dword_18EF18000, v73, OS_LOG_TYPE_INFO, "inputAccessory\t\t%@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v74 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            id v75 = [(CKTranscriptCollectionViewController *)self chatItems];
            *(_DWORD *)long long buf = 138412290;
            id v107 = v75;
            _os_log_impl(&dword_18EF18000, v74, OS_LOG_TYPE_INFO, "All chatitems\t\t%@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          int v76 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v107 = v89;
            _os_log_impl(&dword_18EF18000, v76, OS_LOG_TYPE_INFO, "Visible GUIDS\t\t%@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          char v77 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v107 = v86;
            _os_log_impl(&dword_18EF18000, v77, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v78 = v53;
        uint64_t v79 = [v78 countByEnumeratingWithState:&v92 objects:v104 count:16];
        if (v79)
        {
          uint64_t v80 = *(void *)v93;
          do
          {
            for (uint64_t k = 0; k != v79; ++k)
            {
              if (*(void *)v93 != v80) {
                objc_enumerationMutation(v78);
              }
              uint64_t v82 = *(void **)(*((void *)&v92 + 1) + 8 * k);
              if (IMOSLoggingEnabled())
              {
                uint64_t v83 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v107 = v82;
                  _os_log_impl(&dword_18EF18000, v83, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
                }
              }
            }
            uint64_t v79 = [v78 countByEnumeratingWithState:&v92 objects:v104 count:16];
          }
          while (v79);
        }

        if (IMOSLoggingEnabled())
        {
          uint64_t v84 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
          }
        }
      }
    }
  }
}

BOOL __60__CKTranscriptCollectionViewController__logVisibleChatItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 message];
  uint64_t v6 = [v5 messageID];
  uint64_t v7 = [v4 message];

  BOOL v8 = v6 > [v7 messageID];
  return v8;
}

- (void)previewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v7 = [v4 object];
  BOOL v8 = v7;
  if (isKindOfClass)
  {
    uint64_t v9 = [v7 transfer];
    uint64_t v10 = [(CKTranscriptCollectionViewController *)self chatItems];
    long long v11 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    uint64_t v12 = objc_msgSend(v10, "__ck_indexOfTransfer:", v9);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = objc_msgSend(v11, "__ck_indexOfTransfer:", v9);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      uint64_t v14 = v13;
      double v15 = [v11 objectAtIndex:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        id v17 = [v9 guid];
        CGFloat v23 = v16;
        LODWORD(v16) = [v16 containsTransferGUID:v17];

        if (v16)
        {
          if (![v8 cachedValidPreviewExists])
          {
            long long v22 = IMLogHandleForCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[CKTranscriptCollectionViewController previewDidChange:](v9, v22);
            }

            goto LABEL_17;
          }
          uint64_t v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v14 inSection:1];
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      else
      {
        uint64_t v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v14 inSection:1];
      }
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 inSection:0];
    }
    [(CKTranscriptCollectionViewController *)self unloadCachedSizeAndReloadChatItemAtIndexPath:v18];

    goto LABEL_17;
  }
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if (v19)
  {
    BOOL v8 = [v4 object];
    id v20 = [(CKTranscriptCollectionViewController *)self chatItems];
    int v21 = [v20 containsObject:v8];

    if (v21) {
      [(CKTranscriptCollectionViewController *)self reloadData];
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 transferGUID];
    if ([v5 length])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v8 = [(CKTranscriptCollectionViewController *)self chatItems];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __84__CKTranscriptCollectionViewController__adaptiveImageGlyphWasGeneratedNotification___block_invoke;
      v29[3] = &unk_1E56276A0;
      id v9 = v5;
      id v30 = v9;
      id v10 = v6;
      id v31 = v10;
      id v11 = v7;
      id v32 = v11;
      [v8 enumerateObjectsUsingBlock:v29];
      uint64_t v12 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __84__CKTranscriptCollectionViewController__adaptiveImageGlyphWasGeneratedNotification___block_invoke_2;
      v25[3] = &unk_1E5622908;
      id v26 = v9;
      id v13 = v10;
      id v27 = v13;
      id v14 = v11;
      id v28 = v14;
      [v12 enumerateObjectsUsingBlock:v25];
      if ([v13 count])
      {
        double v15 = (void *)[v13 copy];
        +[CKChatItem unloadSizesOfChatItems:v15];
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v22;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v22 != v19) {
              objc_enumerationMutation(v16);
            }
            -[CKTranscriptCollectionViewController unloadCachedSizeAndReloadChatItemAtIndexPath:](self, "unloadCachedSizeAndReloadChatItemAtIndexPath:", *(void *)(*((void *)&v21 + 1) + 8 * v20++), (void)v21);
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
        }
        while (v18);
      }
    }
  }
}

void __84__CKTranscriptCollectionViewController__adaptiveImageGlyphWasGeneratedNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v10;
  if (isKindOfClass)
  {
    id v7 = v10;
    BOOL v8 = [v7 transferGUIDsInMessagePartText];
    if ([v8 containsObject:*(void *)(a1 + 32)])
    {
      [*(id *)(a1 + 40) addObject:v7];
      id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
      [*(id *)(a1 + 48) addObject:v9];
      [v7 unloadTranscriptText];
    }
    id v6 = v10;
  }
}

void __84__CKTranscriptCollectionViewController__adaptiveImageGlyphWasGeneratedNotification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 acknowledgments];
    id v7 = (void *)v6;
    BOOL v8 = (void *)MEMORY[0x1E4F1CBF0];
    if (v6) {
      BOOL v8 = (void *)v6;
    }
    id v9 = v8;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v5 messageAcknowledgmentChatItem];
    id v7 = (void *)v10;
    if (!v10)
    {
      id v11 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_9;
    }
    v25[0] = v10;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
LABEL_8:
    id v11 = v9;
LABEL_9:

    goto LABEL_11;
  }
  id v11 = 0;
LABEL_11:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  id v14 = v12;
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "fileTransferGUIDs", (void)v20);
        char v19 = [v18 containsObject:*(void *)(a1 + 32)];

        if (v19)
        {

          [*(id *)(a1 + 40) addObject:v5];
          id v14 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:1];
          [*(id *)(a1 + 48) addObject:v14];
          goto LABEL_21;
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    id v14 = v12;
  }
LABEL_21:
}

- (void)snapshotDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"CKSnapshotChangedMessageGUIDKey"];

  uint64_t v6 = [(CKTranscriptCollectionViewController *)self chatItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CKTranscriptCollectionViewController_snapshotDidChange___block_invoke;
  v10[3] = &unk_1E5627908;
  id v7 = v5;
  id v11 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v10];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:0];
    [(CKTranscriptCollectionViewController *)self unloadCachedSizeAndReloadChatItemAtIndexPath:v9];
  }
}

uint64_t __58__CKTranscriptCollectionViewController_snapshotDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 message];
    id v5 = [v4 guid];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)locationStringDidChange:(id)a3
{
  id v8 = [a3 object];
  id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v5 = [v8 transfer];
  uint64_t v6 = objc_msgSend(v4, "__ck_indexOfTransfer:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v6];
    objc_msgSend(v4, "__ck_unloadSizesAtIndexes:", v7);
    objc_msgSend(v4, "__ck_unloadTranscriptTextAtIndexes:", v7);
    [(CKTranscriptCollectionViewController *)self reloadData];
  }
}

- (void)unloadCachedSizeAndReloadChatItemAtIndexPath:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self fullscreenEffectManager];
  uint64_t v6 = [v5 currentEffect];
  if (v6)
  {

LABEL_9:
    goto LABEL_10;
  }
  id v7 = [(CKTranscriptCollectionViewController *)self impactEffectManager];
  char v8 = [v7 isAnimating];

  if ((v8 & 1) == 0)
  {
    id v5 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v4, "item"));
    if ([v4 section])
    {
      if ([v4 section] == 1)
      {
        uint64_t v10 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
        objc_msgSend(v10, "__ck_unloadSizesAtIndexes:", v9);

        v36[0] = v4;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
        [v5 reloadItemsAtIndexPaths:v11];

        [(CKTranscriptCollectionViewController *)self reloadData];
      }
    }
    else
    {
      id v12 = [(CKTranscriptCollectionViewController *)self collectionView];
      uint64_t v13 = [(CKTranscriptCollectionViewController *)self collectionViewLayout];
      [v12 contentOffset];
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      [v12 contentSize];
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      long long v22 = [(CKTranscriptCollectionViewController *)self chatItems];
      objc_msgSend(v22, "__ck_unloadSizesAtIndexes:", v9);

      long long v23 = [v12 indexPathsForVisibleItems];
      uint64_t v24 = [v23 containsObject:v4];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __85__CKTranscriptCollectionViewController_unloadCachedSizeAndReloadChatItemAtIndexPath___block_invoke;
      v27[3] = &unk_1E56279C8;
      char v35 = v24;
      id v28 = v13;
      uint64_t v31 = v15;
      uint64_t v32 = v17;
      uint64_t v33 = v19;
      uint64_t v34 = v21;
      id v29 = v4;
      id v30 = v12;
      id v25 = v12;
      id v26 = v13;
      [(CKTranscriptCollectionViewController *)self reloadChatItemsAtIndexes:v9 animated:v24 completion:v27];
    }
    goto LABEL_9;
  }
LABEL_10:
}

void __85__CKTranscriptCollectionViewController_unloadCachedSizeAndReloadChatItemAtIndexPath___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 88))
  {
    [*(id *)(a1 + 32) prepareLayout];
    id v6 = [*(id *)(a1 + 32) layoutAttributesForItemAtIndexPath:*(void *)(a1 + 40)];
    [v6 frame];
    CGFloat MaxY = CGRectGetMaxY(v8);
    double v3 = *(double *)(a1 + 64);
    if (MaxY < v3)
    {
      double v4 = *(double *)(a1 + 56);
      [*(id *)(a1 + 32) collectionViewContentSize];
      objc_msgSend(*(id *)(a1 + 48), "setContentOffset:animated:", 0, v4, v3 + v5 - *(double *)(a1 + 80));
    }
  }
}

- (void)transferUpdated:(id)a3
{
  id v21 = [a3 object];
  double v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v5 = objc_msgSend(v4, "__ck_indexOfTransfer:", v21);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(CKTranscriptCollectionViewController *)self associatedChatItems];
    uint64_t v7 = objc_msgSend(v6, "__ck_indexOfTransfer:", v21);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      CGRect v8 = 0;
    }
    else
    {
      CGRect v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:1];
    }

    if (!v8) {
      goto LABEL_27;
    }
LABEL_8:
    id v9 = [v21 error];
    uint64_t v10 = v9;
    if (!v9)
    {
      if (![v21 isFileDataReady]) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    id v11 = [v9 domain];
    if ([v11 isEqualToString:@"IMFileTransferErrorDomain"])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 25)
      {
        uint64_t v13 = CKFrameworkBundle();
        uint64_t v14 = v13;
        uint64_t v15 = @"ERR_TRANSFER_EXPIRED_TITLE";
        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v14 = [v10 domain];
    if (![v14 isEqualToString:@"IMFileTransferErrorDomain"])
    {
      uint64_t v17 = 0;
      goto LABEL_20;
    }
    uint64_t v16 = [v10 code];

    if (v16 != 26)
    {
      uint64_t v17 = 0;
      goto LABEL_22;
    }
    uint64_t v13 = CKFrameworkBundle();
    uint64_t v14 = v13;
    uint64_t v15 = @"ERR_TRANSFER_NO_NETWORK_TITLE";
LABEL_18:
    uint64_t v17 = [v13 localizedStringForKey:v15 value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_20:

LABEL_22:
    uint64_t v18 = CKFrameworkBundle();
    uint64_t v19 = [v18 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v20 = CKCreateAlertControllerWithError(0, v17, 0, v19, 0);
    if (v20) {
      [(CKTranscriptCollectionViewController *)self presentViewController:v20 animated:1 completion:0];
    }

    [v21 isFileDataReady];
LABEL_25:
    [(CKTranscriptCollectionViewController *)self unloadCachedSizeAndReloadChatItemAtIndexPath:v8];
LABEL_26:

    goto LABEL_27;
  }
  CGRect v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v5 inSection:0];
  if (v8) {
    goto LABEL_8;
  }
LABEL_27:
}

- (void)_forceReloadChatItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Force reloading all chat items", buf, 2u);
    }
  }
  double v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        CGRect v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 unloadTranscriptText];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
            }
          }
        }
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  +[CKChatItem unloadSizesOfChatItems:v3];
  [(CKTranscriptCollectionViewController *)self reloadData];
}

- (void)addressBookChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CKTranscriptCollectionViewController_addressBookChanged___block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__CKTranscriptCollectionViewController_addressBookChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceReloadChatItems];
}

- (void)_conversationListFinishedMerging:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self conversation];
  uint64_t v6 = +[CKConversationList sharedConversationList];
  uint64_t v7 = [v5 chat];
  CGRect v8 = [v7 guid];
  id v9 = [v6 conversationForExistingChatWithGUID:v8];

  if (v9)
  {
    if (v5 != v9)
    {
      [(CKTranscriptCollectionViewController *)self setConversation:v9];
      if (IMOSLoggingEnabled())
      {
        long long v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v14 = v9;
          __int16 v15 = 2112;
          uint64_t v16 = v5;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Conversation list performed re-merge, updating transcript conversation to %@ from %@", buf, 0x16u);
        }
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__CKTranscriptCollectionViewController__conversationListFinishedMerging___block_invoke;
      block[3] = &unk_1E5620C40;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else if (v5 && IMOSLoggingEnabled())
  {
    long long v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = v5;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKTranscriptCollectionViewController attempted to replace conversation after re-merge, but couldn't find a new conversation to replace %@", buf, 0xCu);
    }
  }
}

uint64_t __73__CKTranscriptCollectionViewController__conversationListFinishedMerging___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceReloadChatItems];
}

- (void)printTranscript
{
  double v3 = [MEMORY[0x1E4F934A8] printInfo];
  [v3 setOutputType:0];
  id v4 = [(CKTranscriptCollectionViewController *)self conversation];
  char v5 = [v4 hasDisplayName];
  uint64_t v6 = [(CKTranscriptCollectionViewController *)self conversation];
  uint64_t v7 = v6;
  if (v5) {
    [v6 displayName];
  }
  else {
  CGRect v8 = [v6 name];
  }

  [v3 setJobName:v8];
  id v9 = [CKTranscriptPrintPageRenderer alloc];
  long long v10 = [(CKTranscriptCollectionViewController *)self printableViewController];
  long long v11 = [(CKTranscriptPrintPageRenderer *)v9 initWithTranscriptCollectionViewController:v10];

  long long v12 = [MEMORY[0x1E4F934B0] sharedPrintController];
  [v12 setPrintInfo:v3];
  [v12 setPrintPageRenderer:v11];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__CKTranscriptCollectionViewController_printTranscript__block_invoke;
  v13[3] = &unk_1E56279F0;
  void v13[4] = self;
  [v12 presentAnimated:1 completionHandler:v13];
}

void __55__CKTranscriptCollectionViewController_printTranscript__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = @"NO";
      if (a3) {
        long long v11 = @"YES";
      }
      else {
        long long v11 = @"NO";
      }
      if (v8) {
        long long v10 = @"YES";
      }
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "UIPrintInteractionController completed: [%@], error: [%@]", (uint8_t *)&v13, 0x16u);
    }
  }
  long long v12 = +[CKPrintController sharedInstance];
  [v12 clearAvatarCache];

  [*(id *)(a1 + 32) reloadData];
}

- (id)printableViewController
{
  double v3 = +[CKPrintController sharedInstance];
  [v3 setPrinting:1];

  id v4 = [CKPrintTranscriptCollectionViewController alloc];
  char v5 = [(CKTranscriptCollectionViewController *)self conversation];
  [(CKTranscriptCollectionViewController *)self balloonMaxWidth];
  double v7 = v6;
  [(CKTranscriptCollectionViewController *)self marginInsets];
  long long v12 = -[CKPrintTranscriptCollectionViewController initWithConversation:delegate:balloonMaxWidth:marginInsets:](v4, "initWithConversation:delegate:balloonMaxWidth:marginInsets:", v5, 0, v7, v8, v9, v10, v11);

  int v13 = +[CKUIBehavior sharedBehaviors];
  -[CKTranscriptCollectionViewController setShouldLoadDefaultConversationViewingMessageCountOnAppear:](v12, "setShouldLoadDefaultConversationViewingMessageCountOnAppear:", [v13 shouldLoadInitialViewingMessageCount]);

  [(CKPrintTranscriptCollectionViewController *)v12 updateUIContents];
  uint64_t v14 = +[CKPrintController sharedInstance];
  [v14 setPrinting:0];

  return v12;
}

- (void)installedAppsChanged:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v42;
    uint64_t v8 = *MEMORY[0x1E4F6CC10];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v11 = [v10 bundleIdentifier];
          char v12 = [v11 isEqualToString:v8];

          v6 |= v12 ^ 1;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v5);

    if (v6)
    {
      [(CKTranscriptCollectionViewController *)self _releaseActiveBalloonControllers];
      [(CKTranscriptCollectionViewController *)self reloadData];
      int v13 = objc_opt_new();
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v14 = [(CKTranscriptCollectionViewController *)self chatItems];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v13 addObject:v18];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
        }
        while (v15);
      }

      +[CKChatItem unloadSizesOfChatItems:v13];
      uint64_t v19 = +[CKChatItemSizeCache sharedInstance];
      [v19 invalidateCachedSizeForGUIDPrefix:@"bp:" reason:@"installedAppsChanged"];

      uint64_t v20 = [(CKTranscriptCollectionViewController *)self conversation];
      id v21 = [v20 chat];
      long long v22 = [v21 guid];

      long long v23 = [v20 recipientStrings];
      uint64_t v24 = [v20 isBusinessConversation];
      id v25 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v26 = v13;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v45 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v33;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v33 != v28) {
              objc_enumerationMutation(v26);
            }
            [*(id *)(*((void *)&v32 + 1) + 8 * k) configureWithConversationID:v22 recipients:v23 isBusiness:v24 context:v25];
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v45 count:16];
        }
        while (v27);
      }

      goto LABEL_33;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Not reloading transcript due to installedAppsChanged:, no relevant plugins loaded in transcript", buf, 2u);
    }
  }
LABEL_33:
}

- (void)multiwayCallStateChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  +[CKChatItem unloadSizesOfChatItems:v4];
  [(CKTranscriptCollectionViewController *)self reloadData];
}

- (void)chatItemsDidChange:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v4 = IMLogHandleForCategory();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  uint64_t v6 = v4;
  uint64_t v7 = v6;
  os_signpost_id_t spid = v5;
  unint64_t v34 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "chatItemsDidChange_ChatKit", "", buf, 2u);
  }

  uint64_t v8 = [(CKTranscriptCollectionViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(CKTranscriptCollectionViewController *)self delegate];
    [v10 transcriptCollectionViewControllerWillUpdateTranscriptChatItems:self];
  }
  long long v11 = [v37 userInfo];
  long long v36 = [v11 objectForKey:*MEMORY[0x1E4F6B8E0]];
  long long v35 = [v11 objectForKey:*MEMORY[0x1E4F6B908]];
  long long v12 = [v11 objectForKey:*MEMORY[0x1E4F6B900]];
  long long v13 = [v11 objectForKey:*MEMORY[0x1E4F6B8F8]];
  long long v14 = [v11 objectForKey:*MEMORY[0x1E4F6B8F0]];
  uint64_t v15 = [v11 objectForKey:*MEMORY[0x1E4F6B8E8]];
  uint64_t v16 = [(CKTranscriptCollectionViewController *)self chatItems];
  unint64_t v17 = [v16 count];
  LODWORD(v17) = v17 < [v14 count];

  if (v17)
  {
    uint64_t v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(CKTranscriptCollectionViewController *)self chatItemsDidChange:v18];
    }

    uint64_t v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController chatItemsDidChange:]();
    }

    id v20 = [(CKTranscriptCollectionViewController *)self newChatItemsWithIMChatItems:v14];
    id v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v22 = [v21 isConsolidatedChatItemsEnabled];

    if (v22)
    {
      long long v23 = [(CKTranscriptCollectionViewController *)self chatItemController];
      [v23 setChatItemsUsingReloadDataWithoutAnimation:v20];
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self setChatItems:v20];
    }
  }
  uint64_t v24 = _Block_copy(self->_transcriptUpdateCompletion);
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = _Block_copy(v24);
      *(_DWORD *)long long buf = 134217984;
      long long v39 = v26;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "ChatItemsDidChange – will consume completion handler: %p", buf, 0xCu);
    }
  }
  [(CKTranscriptCollectionViewController *)self setTranscriptUpdateCompletion:0];
  LOBYTE(v32) = 1;
  [(CKTranscriptCollectionViewController *)self updateTranscriptChatItems:v15 inserted:v36 removed:v35 reload:v12 regenerate:v13 animated:[(CKTranscriptCollectionViewController *)self isTranscriptUpdateAnimated] checkFiltered:v32 completion:v24];
  uint64_t v27 = [(CKTranscriptCollectionViewController *)self delegate];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    id v29 = [(CKTranscriptCollectionViewController *)self delegate];
    [v29 transcriptCollectionViewControllerDidUpdateTranscriptChatItems:self];
  }
  id v30 = v7;
  id v31 = v30;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v31, OS_SIGNPOST_INTERVAL_END, spid, "chatItemsDidChange_ChatKit", "", buf, 2u);
  }
}

- (void)connectivityChanged:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    os_signpost_id_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "connectivityChanged", v7, 2u);
    }
  }
  uint64_t v6 = [(CKTranscriptCollectionViewController *)self chat];
  [v6 refreshServiceForSending];
}

- (void)_tearDownLiveBubbles
{
  double v3 = [(CKTranscriptCollectionViewController *)self chatItems];
  id v4 = (void *)[v3 copy];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__CKTranscriptCollectionViewController__tearDownLiveBubbles__block_invoke;
  v5[3] = &unk_1E56255D8;
  void v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __60__CKTranscriptCollectionViewController__tearDownLiveBubbles__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = [v7 IMChatItem];
    int v4 = [v3 isDataSourceInitialized];

    if (v4)
    {
      os_signpost_id_t v5 = [*(id *)(a1 + 32) transcriptIdentifier];
      uint64_t v6 = [v7 balloonControllerForContext:v5];

      if (objc_opt_respondsToSelector()) {
        [v6 pluginContentViewWillDisappear];
      }
    }
  }
}

- (void)_refreshLocationsForRecipientsIfNecessary
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v4 = [v3 applicationState];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = [(CKTranscriptCollectionViewController *)self conversation];
    id v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "recipientCount"));

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v14 = [v13 sender];
            [v7 addObject:v14];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * v19);
          id v21 = objc_msgSend(MEMORY[0x1E4F6BCB8], "sharedInstance", (void)v24);
          int v22 = [(CKTranscriptCollectionViewController *)self conversation];
          long long v23 = [v22 chat];
          [v21 refreshLocationForHandle:v20 inChat:v23];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }
  }
}

- (void)reconfigureVisibleSpeakerButtonCells
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(v3, "indexPathsForVisibleItems", 0);
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
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = [v3 cellForItemAtIndexPath:v9];
        [(CKTranscriptCollectionViewController *)self configureSpeakerButtonCell:v10 forItemAtIndexPath:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)configureSpeakerButtonCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "item"));

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v13;
      id v10 = v8;
      [v9 setSpeakerHidden:1];
      [v9 setSpeakerEnabled:CKAudioPlaybackSpeakerEnabled()];
      uint64_t v11 = [v10 hasMessageAcknowledgment];

      [v9 setAdjustSpeakerForAcknowledgment:v11];
      long long v12 = [v9 speakerButton];

      [v12 addTarget:self action:sel_touchUpInsideCellSpeakerButton_ forControlEvents:64];
    }
  }
}

- (id)collectionViewLayout
{
  id v2 = [(CKTranscriptCollectionViewController *)self collectionView];
  double v3 = [v2 collectionViewLayout];

  return v3;
}

- (BOOL)wantsDrawerLayout
{
  return [(CKTranscriptCollectionViewController *)self isEditing] ^ 1;
}

- (void)setShouldUseOpaqueMask:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_shouldUseOpaqueMask != a3)
  {
    BOOL v3 = a3;
    self->_shouldUseOpaqueMasuint64_t k = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [(CKTranscriptCollectionViewController *)self collectionView];
    uint64_t v5 = [v4 visibleCells];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v11 = [v10 balloonView];
            [v11 setCanUseOpaqueMask:v3];
            [v11 prepareForDisplayIfNeeded];
            [v10 setNeedsLayout];
            [v10 layoutIfNeeded];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)verticallyScrollTranscriptByAmount:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)verticallyScrollTranscriptByAmount:(double)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = (void (**)(void))a6;
  uint64_t v11 = [(CKTranscriptCollectionViewController *)self collectionView];
  char v12 = [v11 isScrollEnabled];

  if ((v12 & 1) == 0)
  {
    long long v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCollectionViewController verticallyScrollTranscriptByAmount:animated:duration:completion:]();
    }
  }
  long long v14 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v14 contentOffset];
  double v16 = v15;
  double v18 = v17 + a3;
  if (v7)
  {
    uint64_t v19 = [(CKTranscriptCollectionViewController *)self collectionView];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = [(CKTranscriptCollectionViewController *)self updateAnimationGroup];
      if (IMOSLoggingEnabled())
      {
        int v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          long long v36 = self;
          _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "%p enter updateAnimationGroup: in verticallyScrollTranscriptByAmount", buf, 0xCu);
        }
      }
      dispatch_group_enter(v21);
      long long v23 = [(CKTranscriptCollectionViewController *)self collectionView];
      long long v24 = [(CKTranscriptCollectionViewController *)self collectionView];
      [v24 _contentOffsetAnimationDuration];
      double v26 = v25;

      [v23 beginDisablingTranscriptDynamicsForReason:@"ProgramaticScroll"];
      [v23 _setContentOffsetAnimationDuration:a5];
      objc_msgSend(v23, "setContentOffset:animated:", 1, v16, v18);
      [v23 _setContentOffsetAnimationDuration:v26];
      dispatch_time_t v27 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __104__CKTranscriptCollectionViewController_verticallyScrollTranscriptByAmount_animated_duration_completion___block_invoke;
      v30[3] = &unk_1E5622F40;
      id v31 = v23;
      uint64_t v32 = self;
      long long v33 = v21;
      uint64_t v34 = v10;
      long long v28 = v21;
      id v29 = v23;
      dispatch_after(v27, MEMORY[0x1E4F14428], v30);
    }
  }
  else
  {
    objc_msgSend(v14, "setContentOffset:", v15, v18);
    if (v10) {
      v10[2](v10);
    }
  }
}

uint64_t __104__CKTranscriptCollectionViewController_verticallyScrollTranscriptByAmount_animated_duration_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) endDisablingTranscriptDynamicsForReason:@"ProgramaticScroll"];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%p leave updateAnimationGroup: in verticallyScrollTranscriptByAmount", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deselectAllBalloons
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKTranscriptCollectionViewController *)self selectionManager];
  [v3 removeAllSelectedMessageGuids];

  uint64_t v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        id v10 = v9;
        if (v9) {
          [v9 setSelected:0 withSelectionState:0];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)selectionManager:(id)a3 didAddChatItem:(id)a4 selectionState:(id)a5
{
  id v7 = a5;
  id v9 = [a4 IMChatItem];
  uint64_t v8 = [v9 guid];
  [(CKTranscriptCollectionViewController *)self _selectChatItemGuid:v8 selectionState:v7];
}

- (void)selectionManager:(id)a3 didRemoveChatItem:(id)a4
{
  objc_msgSend(a4, "IMChatItem", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v6 guid];
  [(CKTranscriptCollectionViewController *)self _deselectChatItemGuid:v5];
}

- (id)_chatItemForGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKTranscriptCollectionViewController *)self chatItems];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "IMChatItem", (void)v14);
        long long v11 = [v10 guid];
        char v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)selectRangeWithIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self selectionManager];
  id v6 = [v5 trackedGuid];

  if (v6)
  {
    uint64_t v7 = [v5 trackedGuid];
    uint64_t v8 = [(CKTranscriptCollectionViewController *)self _chatItemForGUID:v7];
    id v9 = [v5 selectedStateForGuid:v7];
    long long v44 = (void *)v8;
    uint64_t v10 = [(CKTranscriptCollectionViewController *)self balloonViewForChatItem:v8];
    long long v11 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v10];
    char v12 = [(CKTranscriptCollectionViewController *)self chatItems];
    uint64_t v13 = [v11 item];
    uint64_t v14 = [v4 item];
    if (v13 >= v14) {
      unint64_t v15 = v14;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v16 = [v11 item];
    uint64_t v17 = [v4 item];
    id v18 = v4;
    if (v16 <= v17) {
      unint64_t v19 = v17;
    }
    else {
      unint64_t v19 = v16;
    }
    [v5 removeAllSelectedMessageGuids];
    BOOL v45 = v18;
    long long v42 = v11;
    long long v43 = (void *)v10;
    unint64_t v41 = v15;
    if (v15 <= v19)
    {
      uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v34 = v15;
      do
      {
        long long v35 = [v12 objectAtIndex:v34];
        long long v36 = [v35 IMChatItem];
        uint64_t v37 = [v36 guid];

        uint64_t v20 = v34;
        if (([v37 isEqualToString:v7] & 1) == 0)
        {
          long long v38 = +[CKBalloonSelectionState balloonSelectionState:](CKBalloonSelectionState, "balloonSelectionState:", [v9 style]);
          [v5 addSelectedMessageGuid:v37 selectionState:v38];

          uint64_t v20 = v33;
        }

        ++v34;
        uint64_t v33 = v20;
      }
      while (v34 <= v19);
    }
    else
    {
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 style] == 1)
    {
      long long v39 = [v43 updateTextSelectionState:v9 forTextSelectionArea:v20 == v41];
      [v5 trackSelectedGuid:v7 selectionState:v39];
    }
    else
    {
      [v5 trackSelectedGuid:v7 selectionState:v9];
    }
    id v4 = v45;
  }
  else
  {
    uint64_t v7 = [(CKTranscriptCollectionViewController *)self selectedItems];
    unint64_t v21 = [v7 firstIndex];
    uint64_t v22 = [v7 lastIndex];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v23 = v22, v22 == 0x7FFFFFFFFFFFFFFFLL))
    {
      [v5 removeAllSelectedMessageGuids];
      uint64_t v40 = IMLogHandleForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[CKTranscriptCollectionViewController selectRangeWithIndexPath:]();
      }
    }
    else
    {
      id v24 = v4;
      unint64_t v25 = [v4 item];
      if (v25 > v23)
      {
        unint64_t v26 = v25;
      }
      else
      {
        unint64_t v21 = v25;
        unint64_t v26 = v23;
      }
      [v5 removeAllSelectedMessageGuids];
      dispatch_time_t v27 = [(CKTranscriptCollectionViewController *)self chatItems];
      if (v21 <= v26)
      {
        unint64_t v28 = v26 + 1;
        do
        {
          if (v21 >= [v27 count]) {
            break;
          }
          id v29 = [v27 objectAtIndex:v21];
          long long v30 = [v29 IMChatItem];
          id v31 = [v30 guid];

          uint64_t v32 = +[CKBalloonSelectionState balloonSelectionState:0];
          [v5 addSelectedMessageGuid:v31 selectionState:v32];

          ++v21;
        }
        while (v28 != v21);
      }

      id v4 = v24;
    }
  }
}

- (BOOL)_selectedChatItemsHaveMultipleSenders:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  id v4 = 0;
  if (v3)
  {
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          id v9 = [v8 sender];
          if (v4)
          {
            uint64_t v10 = [v4 ID];
            long long v11 = [v9 ID];
            char v12 = [v10 isEqualToString:v11];

            if ((v12 & 1) == 0)
            {

              LOBYTE(v3) = 1;
              goto LABEL_14;
            }
          }

          id v4 = v9;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v3;
}

- (void)_addAttachmentsToProvidersArray:(id)a3 forChatItems:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__CKTranscriptCollectionViewController__addAttachmentsToProvidersArray_forChatItems___block_invoke;
  v7[3] = &unk_1E56255D8;
  id v8 = v5;
  id v6 = v5;
  [a4 enumerateObjectsUsingBlock:v7];
}

void __85__CKTranscriptCollectionViewController__addAttachmentsToProvidersArray_forChatItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 mediaObject];
    id v5 = [v4 pasteboardItemProvider];
    [*(id *)(a1 + 32) addObject:v5];
LABEL_6:

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v6 = [v4 transcriptIdentifier];
    id v5 = [v4 pluginDisplayContainerForContext:v6];

    uint64_t v7 = [v5 pluginPayload];
    id v8 = [v7 pluginBundleID];
    char v9 = [v8 isEqualToString:*MEMORY[0x1E4F6CC10]];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [v5 pasteboardItemProvider];
      [*(id *)(a1 + 32) addObject:v10];
    }
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_msgSend(v3, "aggregateChatItems", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v4);
        }
        long long v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) mediaObject];
        long long v16 = [v15 pasteboardItemProvider];
        [*(id *)(a1 + 32) addObject:v16];
      }
      uint64_t v12 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
LABEL_7:

LABEL_8:
}

- (id)_itemProviderForSelectedChatItemsWithMultipleSenders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__34;
  void v27[4] = __Block_byref_object_dispose__34;
  id v28 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self selectionManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__CKTranscriptCollectionViewController__itemProviderForSelectedChatItemsWithMultipleSenders___block_invoke;
  v17[3] = &unk_1E5627A18;
  unint64_t v21 = &v23;
  uint64_t v22 = v27;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  id v10 = v4;
  id v20 = v10;
  [v10 enumerateObjectsUsingBlock:v17];
  if (*((unsigned char *)v24 + 24))
  {
    uint64_t v11 = off_1E561D350;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v16 = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Based on the content of the message, we do not need to serialize the copied item as an attributed string. Using plain string serialization only.", v16, 2u);
      }
    }
    uint64_t v11 = off_1E561DF00;
  }
  uint64_t v13 = (void *)[objc_alloc(*v11) initWithAttributedString:v8];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v13];
  [v5 addObject:v14];
  [(CKTranscriptCollectionViewController *)self _addAttachmentsToProvidersArray:v5 forChatItems:v10];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v27, 8);

  return v5;
}

void __93__CKTranscriptCollectionViewController__itemProviderForSelectedChatItemsWithMultipleSenders___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v40 = a3;
    id v6 = v5;
    uint64_t v7 = [v6 sender];
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v8
      || ([v8 ID],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v7 ID],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v9 isEqualToString:v10],
          v10,
          v9,
          (v11 & 1) == 0))
    {
      uint64_t v12 = NSString;
      uint64_t v13 = CKFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"COPY_SENDER_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      long long v15 = [v7 fullName];
      long long v16 = objc_msgSend(v12, "stringWithFormat:", v14, v15);

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        long long v17 = *(void **)(a1 + 32);
        id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\r"];
        [v17 appendAttributedString:v18];
      }
      id v19 = *(void **)(a1 + 32);
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16];
      [v19 appendAttributedString:v20];

      unint64_t v21 = *(void **)(a1 + 32);
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\r"];
      [v21 appendAttributedString:v22];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v7);
    uint64_t v23 = [v6 IMChatItem];
    id v24 = [v23 guid];

    uint64_t v25 = CKFrameworkBundle();
    char v26 = [v25 localizedStringForKey:@"COPY_CONTENT_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    dispatch_time_t v27 = [*(id *)(a1 + 40) selectedStateForGuid:v24];
    uint64_t v28 = [v27 textSelectionRange];
    long long v30 = objc_msgSend(v6, "rtfDocumentItemsWithFormatString:selectedTextRange:", v26, v28, v29);

    if (v30)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v42;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v31);
            }
            [*(id *)(a1 + 32) appendAttributedString:*(void *)(*((void *)&v41 + 1) + 8 * v34++)];
          }
          while (v32 != v34);
          uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v32);
      }
    }
    if ([*(id *)(a1 + 48) count] - 1 > v40)
    {
      long long v35 = *(void **)(a1 + 32);
      long long v36 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\r"];
      [v35 appendAttributedString:v36];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      long long v38 = (objc_class *)objc_opt_class();
      long long v39 = NSStringFromClass(v38);
      *(_DWORD *)long long buf = 138412290;
      BOOL v46 = v39;
      _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "Skipped pasteboard items of type: %@", buf, 0xCu);
    }
  }
}

- (id)_itemProviderForSelectedChatItemsWithSingleSender:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v7 = [(CKTranscriptCollectionViewController *)self selectionManager];
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__CKTranscriptCollectionViewController__itemProviderForSelectedChatItemsWithSingleSender___block_invoke;
  v24[3] = &unk_1E5627A40;
  uint64_t v28 = &v29;
  id v8 = v7;
  id v25 = v8;
  id v9 = v6;
  id v26 = v9;
  id v10 = v4;
  id v27 = v10;
  [v10 enumerateObjectsUsingBlock:v24];
  char v11 = objc_msgSend(v9, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v12 = [v11 length];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__CKTranscriptCollectionViewController__itemProviderForSelectedChatItemsWithSingleSender___block_invoke_1264;
  v19[3] = &unk_1E5625DC0;
  void v19[4] = &v20;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v19);
  if (*((unsigned char *)v21 + 24))
  {
    *((unsigned char *)v30 + 24) = 1;
LABEL_4:
    uint64_t v13 = off_1E561D350;
    goto LABEL_5;
  }
  if (*((unsigned char *)v30 + 24)) {
    goto LABEL_4;
  }
  if (IMOSLoggingEnabled())
  {
    long long v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Based on the content of the message, we do not need to serialize the copied item as an attributed string. Using plain string serialization only.", v18, 2u);
    }
  }
  uint64_t v13 = off_1E561DF00;
LABEL_5:
  uint64_t v14 = (void *)[objc_alloc(*v13) initWithAttributedString:v11];
  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v14];
  [v5 addObject:v15];
  [(CKTranscriptCollectionViewController *)self _addAttachmentsToProvidersArray:v5 forChatItems:v10];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v29, 8);

  return v5;
}

void __90__CKTranscriptCollectionViewController__itemProviderForSelectedChatItemsWithSingleSender___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [v6 IMChatItem];
    id v8 = [v7 guid];

    id v9 = [*(id *)(a1 + 32) selectedStateForGuid:v8];
    uint64_t v10 = [v9 textSelectionRange];
    uint64_t v12 = objc_msgSend(v6, "rtfDocumentItemsWithFormatString:selectedTextRange:", 0, v10, v11);

    if (v12)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v23;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(void *)(*((void *)&v22 + 1) + 8 * v16++), (void)v22);
          }
          while (v14 != v16);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v14);
      }
    }
    if (objc_msgSend(*(id *)(a1 + 48), "count", (void)v22) - 1 > a3)
    {
      long long v17 = *(void **)(a1 + 40);
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\r"];
      [v17 appendAttributedString:v18];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (objc_class *)objc_opt_class();
      unint64_t v21 = NSStringFromClass(v20);
      *(_DWORD *)long long buf = 138412290;
      id v27 = v21;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Skipped pasteboard items of type: %@", buf, 0xCu);
    }
  }
}

uint64_t __90__CKTranscriptCollectionViewController__itemProviderForSelectedChatItemsWithSingleSender___block_invoke_1264(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_searchForSelectedBalloonHack
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(CKTranscriptCollectionViewController *)self chatItems];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = -[CKTranscriptCollectionViewController balloonViewForChatItem:](self, "balloonViewForChatItem:", v8, (void)v17);
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = [v9 textView];
            uint64_t v11 = [v10 selectedRange];
            if (v12)
            {
              id v13 = +[CKBalloonSelectionState balloonSelectionState:textSelectionRange:](CKBalloonSelectionState, "balloonSelectionState:textSelectionRange:", 1, v11, v12);
              uint64_t v14 = [(CKTranscriptCollectionViewController *)self selectionManager];
              uint64_t v15 = [v8 IMChatItem];
              uint64_t v16 = [v15 guid];
              [v14 trackSelectedGuid:v16 selectionState:v13];

              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)copySelectedChatItemsToPasteboard
{
  [(CKTranscriptCollectionViewController *)self _searchForSelectedBalloonHack];
  id v3 = [(CKTranscriptCollectionViewController *)self selectedChatItems];
  if ([v3 count])
  {
    [(CKTranscriptCollectionViewController *)self copyChatItemsToPasteboard:v3];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "SelectedChatItems unexpectedly has zero selected items", v5, 2u);
    }
  }
}

- (void)copyChatItemsToPasteboard:(id)a3
{
  id v4 = a3;
  if ([(CKTranscriptCollectionViewController *)self _selectedChatItemsHaveMultipleSenders:v4])
  {
    [(CKTranscriptCollectionViewController *)self _itemProviderForSelectedChatItemsWithMultipleSenders:v4];
  }
  else
  {
    [(CKTranscriptCollectionViewController *)self _itemProviderForSelectedChatItemsWithSingleSender:v4];
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [MEMORY[0x1E4F42C50] generalPasteboard];
  [v5 setItemProviders:v6];
}

- (void)selectSingleBalloonView:(id)a3
{
  id v13 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:a3];
  id v4 = [(CKTranscriptCollectionViewController *)self chatItems];
  unint64_t v5 = [v13 item];
  if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = v5;
    if (v5 < [v4 count])
    {
      uint64_t v7 = [v4 objectAtIndex:v6];
      id v8 = [v7 IMChatItem];
      id v9 = [v8 guid];

      uint64_t v10 = [(CKTranscriptCollectionViewController *)self selectionManager];
      [v10 removeAllSelectedMessageGuids];

      uint64_t v11 = [(CKTranscriptCollectionViewController *)self selectionManager];
      uint64_t v12 = +[CKBalloonSelectionState balloonSelectionState:0];
      [v11 addSelectedMessageGuid:v9 selectionState:v12];
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldAllowSwipeForItemAtIndexPath:(id)a4
{
  unint64_t v5 = [(CKTranscriptCollectionViewController *)self chatItemAtIndexPath:a4];
  unint64_t v6 = [(CKTranscriptCollectionViewController *)self conversation];
  char v7 = [v6 canReplyToChatItem:v5];

  return v7;
}

- (void)transcriptCollectionViewNeedsScrollIntentEnforced:(id)a3 withAnimationProperties:(id)a4
{
}

- (id)transcriptCollectionView:(id)a3 preferredIndexPathForAssociatedItemAtPoint:(CGPoint)a4
{
  unint64_t v5 = objc_msgSend(a3, "hitTest:withEvent:", 0, a4.x, a4.y);
  unint64_t v6 = objc_msgSend(v5, "ck_superBalloonView");
  char v7 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:v6];

  return v7;
}

- (void)collectionView:(id)a3 didRecognizePanGestureWithPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v61 = a3;
  [v61 contentSize];
  double v7 = v6;
  [v61 bounds];
  id v8 = v61;
  if (v7 >= v9)
  {
    uint64_t v10 = [v61 window];
    objc_msgSend(v10, "convertPoint:fromView:", v61, x, y);
    double v12 = v11;

    id v13 = [v61 window];
    [v13 bounds];
    double v15 = v14;

    [v61 contentOffset];
    double v17 = v16;
    long long v18 = +[CKUIBehavior sharedBehaviors];
    [v18 balloonSelectionScrollThresholdTop];
    double v20 = v19;

    unint64_t v21 = +[CKUIBehavior sharedBehaviors];
    [v21 balloonSelectionScrollThresholdBottom];
    double v23 = v22;

    long long v24 = +[CKUIBehavior sharedBehaviors];
    [v24 balloonSelectionMaxScrollSpeed];
    double v26 = v25;

    if (v12 < v20)
    {
      id v27 = +[CKUIBehavior sharedBehaviors];
      [v27 balloonSelectionLoadMoreSpinnerHeight];
      double v29 = v28;

      id v8 = v61;
      if (v17 <= -v29) {
        goto LABEL_30;
      }
      if (v26 >= v20 - v12) {
        double v30 = v20 - v12;
      }
      else {
        double v30 = v26;
      }
      uint64_t v31 = [(CKTranscriptCollectionViewController *)self chatItems];
      if (v30 >= 0.0)
      {
        double v32 = 0.0;
        uint64_t v33 = 1;
        do
        {
          uint64_t v34 = objc_msgSend(v61, "indexPathForItemAtPoint:", x, v59 - v32);
          unint64_t v35 = [v34 item];
          if ((v35 & 0x8000000000000000) == 0)
          {
            unint64_t v36 = v35;
            if (v35 < [v31 count])
            {
              uint64_t v37 = [v31 objectAtIndex:v36];
              long long v38 = [v37 IMChatItem];
              long long v39 = [v38 guid];

              unint64_t v40 = [(CKTranscriptCollectionViewController *)self selectionManager];
              char v41 = [v40 isMessageGuidSelected:v39];

              if ((v41 & 1) == 0)
              {
                long long v42 = [(CKTranscriptCollectionViewController *)self selectionManager];
                long long v43 = +[CKBalloonSelectionState balloonSelectionState:1];
                [v42 addSelectedMessageGuid:v39 selectionState:v43];
              }
            }
          }

          double v32 = (double)v33++;
        }
        while (v30 >= v32);
      }
      double v44 = -v30;
      goto LABEL_29;
    }
    id v8 = v61;
    if (v12 > v15 - v23)
    {
      [v61 frame];
      id v8 = v61;
      if (v17 < v7 - v45)
      {
        if (v26 >= v23 - (v15 - v12)) {
          double v44 = v23 - (v15 - v12);
        }
        else {
          double v44 = v26;
        }
        uint64_t v31 = [(CKTranscriptCollectionViewController *)self chatItems];
        if (v44 >= 0.0)
        {
          double v46 = 0.0;
          uint64_t v47 = 1;
          do
          {
            uint64_t v48 = objc_msgSend(v61, "indexPathForItemAtPoint:", x, v60 + v46);
            unint64_t v49 = [v48 item];
            if ((v49 & 0x8000000000000000) == 0)
            {
              unint64_t v50 = v49;
              if (v49 < [v31 count])
              {
                id v51 = [v31 objectAtIndex:v50];
                id v52 = [v51 IMChatItem];
                id v53 = [v52 guid];

                int v54 = [(CKTranscriptCollectionViewController *)self selectionManager];
                char v55 = [v54 isMessageGuidSelected:v53];

                if ((v55 & 1) == 0)
                {
                  uint64_t v56 = [(CKTranscriptCollectionViewController *)self selectionManager];
                  uint64_t v57 = +[CKBalloonSelectionState balloonSelectionState:1];
                  [v56 addSelectedMessageGuid:v53 selectionState:v57];
                }
              }
            }

            double v46 = (double)v47++;
          }
          while (v44 >= v46);
        }
LABEL_29:
        [(CKTranscriptCollectionViewController *)self verticallyScrollTranscriptByAmount:1 animated:0 completion:v44];

        id v8 = v61;
      }
    }
  }
LABEL_30:
}

- (void)_trackPhotoStackEvent:(id)a3 forStackBalloonView:(id)a4 transcriptOrientation:(char)a5
{
  v35[6] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    uint64_t v5 = a5;
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = [v8 currentAssetReference];
    double v11 = [v10 asset];
    uint64_t v12 = [v11 mediaType];
    id v13 = [v8 dataSourceManager];

    double v14 = [v13 mediaObjectDataSource];

    double v15 = [v14 mediaObjects];
    uint64_t v16 = [v15 count];

    double v30 = v10;
    double v32 = v11;
    if (v14)
    {
      objc_msgSend(v14, "indexPathForAssetReference:", v10, v10, v11);
      uint64_t v17 = v33;
    }
    else
    {
      uint64_t v17 = 0;
    }
    long long v18 = [(CKTranscriptCollectionViewController *)self conversation];
    double v19 = [v18 recipients];
    uint64_t v20 = [v19 count];

    uint64_t v21 = *MEMORY[0x1E4F6D9F8];
    v35[0] = v9;
    uint64_t v22 = *MEMORY[0x1E4F6DA00];
    v34[0] = v21;
    v34[1] = v22;
    double v23 = [NSNumber numberWithInteger:v17];
    v35[1] = v23;
    v34[2] = *MEMORY[0x1E4F6DA08];
    long long v24 = [NSNumber numberWithInteger:v12];
    v35[2] = v24;
    v34[3] = *MEMORY[0x1E4F6DA10];
    double v25 = [NSNumber numberWithUnsignedInteger:v16];
    v35[3] = v25;
    v34[4] = *MEMORY[0x1E4F6DA38];
    double v26 = [NSNumber numberWithChar:v5];
    v35[4] = v26;
    void v34[5] = *MEMORY[0x1E4F6DA18];
    id v27 = [NSNumber numberWithInteger:v20];
    void v35[5] = v27;
    double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:6];

    double v29 = [MEMORY[0x1E4F6E890] sharedInstance];

    [v29 trackEvent:*MEMORY[0x1E4F6D9E0] withDictionary:v28];
  }
}

- (id)_logChatItems:(id)a3 withUpdates:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[CKTranscriptCollectionViewController _loggingRangeForUpdates:chatItemsCount:](self, "_loggingRangeForUpdates:chatItemsCount:", v6, [v7 count]);
  uint64_t v10 = v9;

  double v11 = objc_msgSend(v7, "subarrayWithRange:", v8, v10);

  uint64_t v12 = [(CKTranscriptCollectionViewController *)self _logChatItems:v11 withIndex:v8];

  return v12;
}

- (id)_logLatestChatItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self _loggingRangeForLatestChatItems:v4];
  id v7 = objc_msgSend(v4, "subarrayWithRange:", v5, v6);

  uint64_t v8 = [(CKTranscriptCollectionViewController *)self _logChatItems:v7 withIndex:v5];

  return v8;
}

- (id)_logChatItems:(id)a3 withIndex:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setDateStyle:1];
  double v29 = v6;
  [v6 setTimeStyle:1];
  id v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = NSString;
  uint64_t v9 = [(CKTranscriptCollectionViewController *)self chat];
  uint64_t v10 = [v9 guid];
  uint64_t v11 = [v8 stringWithFormat:@"chat: %@\n", v10];

  double v28 = (void *)v11;
  [v7 appendString:v11];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v5;
  uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v31 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v16 = [v15 itemIsFromMe];
        uint64_t v17 = @" ";
        if (v16) {
          uint64_t v17 = @"\t";
        }
        long long v18 = NSString;
        double v19 = v17;
        uint64_t v20 = (objc_class *)objc_opt_class();
        uint64_t v21 = NSStringFromClass(v20);
        uint64_t v22 = [v15 IMChatItem];
        double v23 = [v22 guid];
        long long v24 = [v18 stringWithFormat:@"\t%3lu:%@<%@ : %@> ", a4 + i, v19, v21, v23];

        [v7 appendString:v24];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v25 = [v15 date];
          double v26 = [v29 stringFromDate:v25];

          [v7 appendString:v26];
        }
        [v7 appendString:@"\n"];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      a4 += i;
    }
    while (v13);
  }

  return v7;
}

- (_NSRange)_loggingRangeForUpdates:(id)a3 chatItemsCount:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v27;
    unint64_t v10 = a4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [v12 lastIndex];
        unint64_t v14 = [v12 count] + v13;
        if (v14 >= a4) {
          unint64_t v14 = a4;
        }
        if (v8 <= v14) {
          int64_t v8 = v14;
        }
        unint64_t v15 = [v12 firstIndex];
        if (v10 >= v15) {
          unint64_t v10 = v15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
    unint64_t v10 = a4;
  }
  uint64_t v16 = v8 - v10;
  int64_t v17 = a4 - 1;
  if (a4 - 1 >= v8 - 10) {
    int64_t v18 = v8 - 10;
  }
  else {
    int64_t v18 = a4 - 1;
  }
  if (v16 == 10) {
    int64_t v18 = v10;
  }
  uint64_t v19 = (v8 - 10) & ~((v8 - 10) >> 63);
  if (v8 >= v17) {
    int64_t v17 = v8;
  }
  else {
    uint64_t v19 = v10;
  }
  if (v16 <= 9) {
    NSUInteger v20 = v19;
  }
  else {
    NSUInteger v20 = v18;
  }
  if (v16 <= 9) {
    int64_t v21 = v17;
  }
  else {
    int64_t v21 = v8;
  }
  unint64_t v22 = (v21 - v20) & ~((uint64_t)(v21 - v20) >> 63);
  if (v22 >= 0xA) {
    uint64_t v23 = 10;
  }
  else {
    uint64_t v23 = v22;
  }

  NSUInteger v24 = v20;
  NSUInteger v25 = v23;
  result.length = v25;
  result.id location = v24;
  return result;
}

- (_NSRange)_loggingRangeForLatestChatItems:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  uint64_t v5 = [v3 count];

  if (v4 >= 0xB) {
    NSUInteger v6 = v5 - 11;
  }
  else {
    NSUInteger v6 = 0;
  }
  if (v4 >= 0xB) {
    NSUInteger v7 = 10;
  }
  else {
    NSUInteger v7 = v5;
  }
  result.length = v7;
  result.id location = v6;
  return result;
}

- (void)chatItemControllerDidSetChatItems
{
  id v6 = [(CKTranscriptCollectionViewController *)self chat];
  if (!CKIsRunningUnitTests())
  {
    uint64_t v3 = [v6 lastFinishedMessageID];
    unint64_t v4 = [v6 lastFinishedMessageDate];
    objc_msgSend(v6, "__ck_updateWatermarkToMessageID:date:", v3, v4);
  }
  uint64_t v5 = [(CKTranscriptCollectionViewController *)self delegate];
  [v5 transcriptCollectionViewControllerDidSetChatItems:self];
}

- (void)chatItemControllerDidInsertAssociatedChatItems
{
  id v3 = [(CKTranscriptCollectionViewController *)self delegate];
  [v3 transcriptCollectionViewControllerDidInsertAssociatedChatItem:self];
}

- (void)chatItemControllerDidChangeAssociatedChatItemsWithChatItemDiff:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self delegate];
  [v5 transcriptCollectionViewControllerDidChangeAssociatedChatItem:self chatItemDiff:v4];
}

- (void)configurePluginChatItemForChatItemControllerWithChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self conversation];
  id v6 = [v5 chat];
  id v12 = [v6 guid];

  NSUInteger v7 = [(CKTranscriptCollectionViewController *)self conversation];
  int64_t v8 = [v7 recipientStrings];

  uint64_t v9 = [(CKTranscriptCollectionViewController *)self conversation];
  uint64_t v10 = [v9 isBusinessConversation];
  uint64_t v11 = [(CKTranscriptCollectionViewController *)self transcriptIdentifier];
  [v4 configureWithConversationID:v12 recipients:v8 isBusiness:v10 context:v11];
}

- (CKTranscriptLayoutMessageEditingContext)messageEditingContext
{
  return self->_messageEditingContext;
}

- (void)setMessageEditingContext:(id)a3
{
}

- (UIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void)setInputContextHistory:(id)a3
{
}

- (void)setGenerativeContextHistory:(id)a3
{
}

- (NSString)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setAssociatedChatItems:(id)a3
{
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (double)balloonMaxWidth
{
  return self->_balloonMaxWidth;
}

- (void)setBalloonMaxWidth:(double)a3
{
  self->_balloonMaxWidth = a3;
}

- (CKTranscriptCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTranscriptCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKGradientReferenceView)gradientReferenceView
{
  return self->_gradientReferenceView;
}

- (void)setGradientReferenceView:(id)a3
{
}

- (OS_dispatch_group)updateAnimationGroup
{
  return self->_updateAnimationGroup;
}

- (void)setUpdateAnimationGroup:(id)a3
{
}

- (NSIndexSet)hiddenItems
{
  return self->_hiddenItems;
}

- (NSIndexSet)hiddenAssociatedItems
{
  return self->_hiddenAssociatedItems;
}

- (NSIndexSet)hiddenAssociatedItemsForMessageEditing
{
  return self->_hiddenAssociatedItemsForMessageEditing;
}

- (NSIndexSet)hiddenBalloonViews
{
  return self->_hiddenBalloonViews;
}

- (NSString)poppedBalloonGUIDHiddenUntilNextChatItemUpdate
{
  return self->_poppedBalloonGUIDHiddenUntilNextChatItemUpdate;
}

- (BOOL)shouldLoadDefaultConversationViewingMessageCountOnAppear
{
  return self->_shouldLoadDefaultConversationViewingMessageCountOnAppear;
}

- (void)setShouldLoadDefaultConversationViewingMessageCountOnAppear:(BOOL)a3
{
  self->_shouldLoadDefaultConversationViewingMessageCountOnAppear = a3;
}

- (CKImpactEffectManager)impactEffectManager
{
  return self->_impactEffectManager;
}

- (void)setImpactEffectManager:(id)a3
{
}

- (void)setFullscreenEffectManager:(id)a3
{
}

- (BOOL)transitionedFromComposing
{
  return self->_transitionedFromComposing;
}

- (BOOL)transitioningFromComposing
{
  return self->_transitioningFromComposing;
}

- (BOOL)isTranscriptUpdateAnimated
{
  return self->_transcriptUpdateAnimated;
}

- (void)setTranscriptUpdateAnimated:(BOOL)a3
{
  self->_transcriptUpdateAnimated = a3;
}

- (BOOL)allowsPluginPlayback
{
  return self->_allowsPluginPlayback;
}

- (void)setAllowsPluginPlayback:(BOOL)a3
{
  self->_allowsPluginPlaybacuint64_t k = a3;
}

- (double)pluginPlaybackDelay
{
  return self->_pluginPlaybackDelay;
}

- (void)setPluginPlaybackDelay:(double)a3
{
  self->_pluginPlaybackDeladouble y = a3;
}

- (NSString)__CurrentTestName
{
  return self->___CurrentTestName;
}

- (void)__setCurrentTestName:(id)a3
{
}

- (int64_t)contentAnimationPauseReasons
{
  return self->_contentAnimationPauseReasons;
}

- (void)setContentAnimationPauseReasons:(int64_t)a3
{
  self->_int64_t contentAnimationPauseReasons = a3;
}

- (UIDragInteractionDelegate)dragInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragInteractionDelegate);

  return (UIDragInteractionDelegate *)WeakRetained;
}

- (void)setDragInteractionDelegate:(id)a3
{
}

- (UITapGestureRecognizer)loggingTapGestureRecognizer
{
  return self->_loggingTapGestureRecognizer;
}

- (void)setLoggingTapGestureRecognizer:(id)a3
{
}

- (CKTranscriptTextEffectsState)textEffectsState
{
  return self->_textEffectsState;
}

- (void)setTextEffectsState:(id)a3
{
}

- (_TtC7ChatKit23CKTextEffectCoordinator)transcriptTextEffectCoordinator
{
  return self->_transcriptTextEffectCoordinator;
}

- (void)setTranscriptTextEffectCoordinator:(id)a3
{
}

- (CGSize)collectionViewSize
{
  double width = self->_collectionViewSize.width;
  double height = self->_collectionViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCollectionViewSize:(CGSize)a3
{
  self->_collectionViewSize = a3;
}

- (double)lastViewWidthUsedToLayoutChatItems
{
  return self->_lastViewWidthUsedToLayoutChatItems;
}

- (void)setLastViewWidthUsedToLayoutChatItems:(double)a3
{
  self->_lastViewWidthUsedToLayoutChatItems = a3;
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (void)setTranscriptIdentifier:(id)a3
{
}

- (CKTranscriptCompositor)compositor
{
  return self->_compositor;
}

- (void)setCompositor:(id)a3
{
}

- (BOOL)isSettingChatItems
{
  return self->_settingChatItems;
}

- (void)setSettingChatItems:(BOOL)a3
{
  self->_settingChatItems = a3;
}

- (BOOL)audioControllerWasPlayingBeforeScrub
{
  return self->_audioControllerWasPlayingBeforeScrub;
}

- (void)setAudioControllerWasPlayingBeforeScrub:(BOOL)a3
{
  self->_audioControllerWasPlayingBeforeScrub = a3;
}

- (void)setPluginSnapshots:(id)a3
{
}

- (CKPluginPlaybackManager)pluginPlaybackManager
{
  return self->_pluginPlaybackManager;
}

- (void)setPluginPlaybackManager:(id)a3
{
}

- (BOOL)isPerformingRegenerateOrReloadOnlyUpdate
{
  return self->_isPerformingRegenerateOrReloadOnlyUpdate;
}

- (void)setIsPerformingRegenerateOrReloadOnlyUpdate:(BOOL)a3
{
  self->_isPerformingRegenerateOrReloadOnlyUpdate = a3;
}

- (CGPoint)peekSampleTranslation
{
  double x = self->_peekSampleTranslation.x;
  double y = self->_peekSampleTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPeekSampleTranslation:(CGPoint)a3
{
  self->_peekSampleTranslation = a3;
}

- (BOOL)isPeeking
{
  return self->_peeking;
}

- (void)setPeeking:(BOOL)a3
{
  self->_peeking = a3;
}

- (BOOL)isLoadingMoreMessages
{
  return self->_isLoadingMoreMessages;
}

- (void)setIsLoadingMoreMessages:(BOOL)a3
{
  self->_isLoadingMoreMessages = a3;
}

- (NSString)speakerTransferGUID
{
  return self->_speakerTransferGUID;
}

- (void)setSpeakerTransferGUID:(id)a3
{
}

- (BOOL)sizedFullTranscript
{
  return self->_sizedFullTranscript;
}

- (void)setSizedFullTranscript:(BOOL)a3
{
  self->_sizedFullTranscript = a3;
}

- (BOOL)shouldUseOpaqueMask
{
  return self->_shouldUseOpaqueMask;
}

- (CKFullscreenEffectView)topEffectView
{
  return self->_topEffectView;
}

- (void)setTopEffectView:(id)a3
{
}

- (void)setCurrentEffectDecorationViews:(id)a3
{
}

- (void)setStickerGUIDsHiddenDuringStickerAddAnimation:(id)a3
{
}

- (BOOL)filterAllButFirstMessage
{
  return self->_filterAllButFirstMessage;
}

- (void)setFilterAllButFirstMessage:(BOOL)a3
{
  self->_filterAllButFirstMessage = a3;
}

- (BOOL)playedLastImpactEffectForTransitionFromComposing
{
  return self->_playedLastImpactEffectForTransitionFromComposing;
}

- (void)setPlayedLastImpactEffectForTransitionFromComposing:(BOOL)a3
{
  self->_playedLastImpactEffectForTransitionFromComposing = a3;
}

- (UIView)snapshotOfPluginBeingReplacedByBreadcrumb
{
  return self->_snapshotOfPluginBeingReplacedByBreadcrumb;
}

- (void)setSnapshotOfPluginBeingReplacedByBreadcrumb:(id)a3
{
}

- (NSValue)presentedChatItemScrollOffset
{
  return self->_presentedChatItemScrollOffset;
}

- (void)setPresentedChatItemScrollOffset:(id)a3
{
}

- (BOOL)isPresentingChatItemForKeyboard
{
  return self->_isPresentingChatItemForKeyboard;
}

- (void)setIsPresentingChatItemForKeyboard:(BOOL)a3
{
  self->_isPresentingChatItemForKeyboard = a3;
}

- (NSDictionary)cachedEmojiResponses
{
  return self->_cachedEmojiResponses;
}

- (void)setCachedEmojiResponses:(id)a3
{
}

- (void)setBalloonEmphasisManager:(id)a3
{
}

- (NSString)mostRecentlyTouchedPlugin
{
  return self->_mostRecentlyTouchedPlugin;
}

- (void)setMostRecentlyTouchedPlugin:(id)a3
{
}

- (id)transcriptUpdateCompletion
{
  return self->_transcriptUpdateCompletion;
}

- (void)setTranscriptUpdateCompletion:(id)a3
{
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
}

- (CKChatItemController)chatItemController
{
  return self->_chatItemController;
}

- (void)setChatItemController:(id)a3
{
}

- (NSSet)hiddenChatItemGUIDs
{
  return self->_hiddenChatItemGUIDs;
}

- (void)setHiddenChatItemGUIDs:(id)a3
{
}

- (NSSet)chatItemGUIDsOfHiddenTapbackPiles
{
  return self->_chatItemGUIDsOfHiddenTapbackPiles;
}

- (void)setChatItemGUIDsOfHiddenTapbackPiles:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (CKTranscriptBalloonSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (NSDate)transcriptBecameVisibleTimestamp
{
  return self->_transcriptBecameVisibleTimestamp;
}

- (void)setTranscriptBecameVisibleTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptBecameVisibleTimestamp, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_chatItemGUIDsOfHiddenTapbackPiles, 0);
  objc_storeStrong((id *)&self->_hiddenChatItemGUIDs, 0);
  objc_storeStrong((id *)&self->_chatItemController, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong(&self->_transcriptUpdateCompletion, 0);
  objc_storeStrong((id *)&self->_mostRecentlyTouchedPlugin, 0);
  objc_storeStrong((id *)&self->_balloonEmphasisManager, 0);
  objc_storeStrong((id *)&self->_cachedEmojiResponses, 0);
  objc_storeStrong((id *)&self->_presentedChatItemScrollOffset, 0);
  objc_storeStrong((id *)&self->_snapshotOfPluginBeingReplacedByBreadcrumb, 0);
  objc_storeStrong((id *)&self->_stickerGUIDsHiddenDuringStickerAddAnimation, 0);
  objc_storeStrong((id *)&self->_currentEffectDecorationViews, 0);
  objc_storeStrong((id *)&self->_topEffectView, 0);
  objc_storeStrong((id *)&self->_speakerTransferGUID, 0);
  objc_storeStrong((id *)&self->_pluginPlaybackManager, 0);
  objc_storeStrong((id *)&self->_pluginSnapshots, 0);
  objc_storeStrong((id *)&self->_compositor, 0);
  objc_storeStrong((id *)&self->_transcriptIdentifier, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_transcriptTextEffectCoordinator, 0);
  objc_storeStrong((id *)&self->_textEffectsState, 0);
  objc_storeStrong((id *)&self->_loggingTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_dragInteractionDelegate);
  objc_storeStrong((id *)&self->___CurrentTestName, 0);
  objc_storeStrong((id *)&self->_fullscreenEffectManager, 0);
  objc_storeStrong((id *)&self->_impactEffectManager, 0);
  objc_storeStrong((id *)&self->_poppedBalloonGUIDHiddenUntilNextChatItemUpdate, 0);
  objc_storeStrong((id *)&self->_hiddenBalloonViews, 0);
  objc_storeStrong((id *)&self->_hiddenAssociatedItemsForMessageEditing, 0);
  objc_storeStrong((id *)&self->_hiddenAssociatedItems, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_updateAnimationGroup, 0);
  objc_storeStrong((id *)&self->_gradientReferenceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_associatedChatItems, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_generativeContextHistory, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_messageEditingContext, 0);
  objc_storeStrong((id *)&self->_chatItems, 0);

  objc_storeStrong((id *)&self->_itemIndexPathToHighlight, 0);
}

- (void)presentUserInterventionScreenForIndexPath:(id)a3 shouldTargetAssociatedItems:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  NSUInteger v7 = +[CKCommSafetyReceiveContext contextWithIndexPath:v6 shouldTargetAssociatedMessages:v4];
  int64_t v8 = CKCommSafetyReceiveContextDictionary(v7);
  BOOL v9 = [(CKTranscriptCollectionViewController *)self isReportingEnabled];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v10 = (void *)getUSUIInterventionViewControllerClass_softClass_0;
  uint64_t v18 = getUSUIInterventionViewControllerClass_softClass_0;
  if (!getUSUIInterventionViewControllerClass_softClass_0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getUSUIInterventionViewControllerClass_block_invoke_0;
    v14[3] = &unk_1E5620B90;
    void v14[4] = &v15;
    __getUSUIInterventionViewControllerClass_block_invoke_0((uint64_t)v14);
    uint64_t v10 = (void *)v16[3];
  }
  if (v9) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v10;
  _Block_object_dispose(&v15, 8);
  uint64_t v13 = [v12 viewControllerWithWorkflow:0 contextDictionary:v8 options:v11];
  [v13 setInterventionDelegate:self];
  [(CKTranscriptCollectionViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)didTapCommSafetyAttributionItemWithIndexPath:(id)a3 sender:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(CKTranscriptCollectionViewController *)self _supportsStickersSensitiveContentContextMenu])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      BOOL v9 = [(CKTranscriptCollectionViewController *)self hasCommSafetyNotViewableAssociatedItems:v6];
      uint64_t v10 = CKFrameworkBundle();
      uint64_t v11 = [v10 localizedStringForKey:@"SAFETY_MENU_CONTENT_KIND_STICKERS" value:&stru_1EDE4CA38 table:@"ChatKit"];

      id SCUIMoreHelpContextMenuClass = getSCUIMoreHelpContextMenuClass();
      v18[0] = @"CKSensitiveContentIndexPathKey";
      v18[1] = @"SCUIMoreHelpContextMenuShowContentNameKey";
      v19[0] = v6;
      v19[1] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      unint64_t v14 = objc_msgSend(SCUIMoreHelpContextMenuClass, "menuWithDelegate:contextDictionary:additionalOptions:", self, v13, -[CKTranscriptCollectionViewController _moreHelpMenuOptions:](self, "_moreHelpMenuOptions:", v9));

      [v8 popCommSafetyMenu:v14];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F6E6D0] sharedManager];
    uint64_t v16 = [v15 enablementGroup];

    if (v16 == 2)
    {
      uint64_t v17 = [(CKTranscriptCollectionViewController *)self delegate];
      [v17 transcriptCollectionViewController:self viewedCommSafetyAssociatedItemsWithIndexPath:v6];
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self presentUserInterventionScreenForIndexPath:v6 shouldTargetAssociatedItems:1];
    }
  }
}

- (BOOL)_supportsStickersSensitiveContentContextMenu
{
  return objc_opt_respondsToSelector() & 1;
}

- (int64_t)_moreHelpMenuOptions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self conversation];
  id v6 = [v5 recipients];
  unint64_t v7 = [v6 count];

  id v8 = [(CKTranscriptCollectionViewController *)self conversation];
  BOOL v9 = [v8 recipients];
  unint64_t v10 = [v9 count];

  BOOL v11 = [(CKTranscriptCollectionViewController *)self isReportingEnabled];
  uint64_t v12 = 96;
  if (!v11) {
    uint64_t v12 = 0;
  }
  if (v3) {
    int64_t v13 = v12 | 0x80;
  }
  else {
    int64_t v13 = v12;
  }
  unint64_t v14 = [(CKTranscriptCollectionViewController *)self chat];
  int v15 = [v14 isBusinessChat];

  uint64_t v16 = 1;
  if (v7 > 1) {
    uint64_t v16 = 2;
  }
  int64_t v17 = v13 | v16;
  if (v10 > 2) {
    v17 |= 4uLL;
  }
  if (v15) {
    return v13;
  }
  else {
    return v17;
  }
}

- (void)presentMoreHelpMenu
{
  BOOL v3 = [MEMORY[0x1E4F6E710] sharedInstance];
  [v3 logPrivatizedUIInteractionEvent:2];

  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2050000000;
  BOOL v4 = (void *)getSCUIMoreHelpMenuClass_softClass;
  uint64_t v11 = getSCUIMoreHelpMenuClass_softClass;
  if (!getSCUIMoreHelpMenuClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getSCUIMoreHelpMenuClass_block_invoke;
    v7[3] = &unk_1E5620B90;
    void v7[4] = &v8;
    __getSCUIMoreHelpMenuClass_block_invoke((uint64_t)v7);
    BOOL v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  id v6 = objc_msgSend(v5, "menuWithOptions:", -[CKTranscriptCollectionViewController _moreHelpMenuOptions:](self, "_moreHelpMenuOptions:", 0));
  [v6 setMenuDelegate:self];
  [(CKTranscriptCollectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (BOOL)canInteractWithObscuredItem
{
  return 1;
}

- (void)didConfirmForInterventionViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contextDictionary];
  id v6 = +[CKCommSafetyReceiveContext contextKey];
  id v13 = [v5 objectForKey:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v7 = v13;
  }
  else {
    unint64_t v7 = 0;
  }
  id v8 = v7;
  [(CKTranscriptCollectionViewController *)self _dismissInterventionController:v4];

  BOOL v9 = [v8 indexPath];

  if (v9)
  {
    int v10 = [v8 shouldTargetAssociatedMessages];
    uint64_t v11 = [(CKTranscriptCollectionViewController *)self delegate];
    uint64_t v12 = [v8 indexPath];
    if (v10) {
      [v11 transcriptCollectionViewController:self viewedCommSafetyAssociatedItemsWithIndexPath:v12];
    }
    else {
      [v11 transcriptCollectionViewController:self viewedCommSafetyItemWithIndexPath:v12];
    }
  }
}

- (void)evidenceToReportWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKeyedSubscript:@"CKSensitiveContentIndexPathKey"];
  [(CKTranscriptCollectionViewController *)self evidenceToReportWithIndexPath:v7 completionHandler:v6];
}

- (void)evidenceToReportWithContext:(id)a3 balloonView:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  if (a4)
  {
    a4 = [(CKTranscriptCollectionViewController *)self indexPathForBalloonView:a4];
  }
  [(CKTranscriptCollectionViewController *)self evidenceToReportWithIndexPath:a4 completionHandler:v7];
}

- (void)evidenceToReportWithIndexPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(CKTranscriptCollectionViewController *)self selectedMediaObjectForCommSafetyReport:v6];
  BOOL v9 = [(CKTranscriptCollectionViewController *)self mediaObjectsForCommSafetyReport:v8];
  if ([v9 count])
  {
    int v10 = [MEMORY[0x1E4F6BD10] me];
    uint64_t v11 = [v10 bestIMHandle];

    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2050000000;
    uint64_t v12 = (void *)getSCUIReportEvidenceClass_softClass;
    uint64_t v25 = getSCUIReportEvidenceClass_softClass;
    if (!getSCUIReportEvidenceClass_softClass)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __getSCUIReportEvidenceClass_block_invoke;
      v21[3] = &unk_1E5620B90;
      void v21[4] = &v22;
      __getSCUIReportEvidenceClass_block_invoke((uint64_t)v21);
      uint64_t v12 = (void *)v23[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v22, 8);
    id v14 = [v13 alloc];
    char v15 = objc_opt_respondsToSelector();
    id v16 = v14;
    int64_t v17 = [(CKTranscriptCollectionViewController *)self conversation];
    uint64_t v18 = [v17 chat];
    if (v15) {
      uint64_t v19 = [v16 initWithVictimHandle:v11 media:v9 selectedMediaObject:v8 chat:v18];
    }
    else {
      uint64_t v19 = [v16 initWithVictimHandle:v11 sensitiveContentMedia:v9 chat:v18];
    }
    NSUInteger v20 = (void *)v19;

    v7[2](v7, v20, 0);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
  }
}

- (void)_enumerateMediaObjectsForReportUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionViewController *)self chatItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__CKTranscriptCollectionViewController_UserSafety___enumerateMediaObjectsForReportUsingBlock___block_invoke;
  v7[3] = &unk_1E56294F8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v7];
}

void __94__CKTranscriptCollectionViewController_UserSafety___enumerateMediaObjectsForReportUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = [v10 IMChatItem];
  if ([v7 supportsCommunicationSafety])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = *(void *)(a1 + 32);
        BOOL v9 = [v10 mediaObject];
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v8 + 16))(v8, v9, a3, a4);
      }
    }
  }
}

- (void)_dismissInterventionController:(id)a3
{
}

- (void)didAskForMoreHelp:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E710], "sharedInstance", a3);
  [v4 logPrivatizedUIInteractionEvent:4];

  [(CKTranscriptCollectionViewController *)self _showMoreHelp];
}

- (void)didShowContent:(id)a3
{
  id v11 = a3;
  char v4 = objc_opt_respondsToSelector();
  id v5 = v11;
  if (v4)
  {
    id v6 = [v11 performSelector:sel_contextDictionary];
    id v7 = [v6 objectForKeyedSubscript:@"CKSensitiveContentIndexPathKey"];
    uint64_t v8 = [MEMORY[0x1E4F6E6D0] sharedManager];
    uint64_t v9 = [v8 enablementGroup];

    if (v9 == 2)
    {
      id v10 = [(CKTranscriptCollectionViewController *)self delegate];
      [v10 transcriptCollectionViewController:self viewedCommSafetyAssociatedItemsWithIndexPath:v7];
    }
    else
    {
      [(CKTranscriptCollectionViewController *)self presentUserInterventionScreenForIndexPath:v7 shouldTargetAssociatedItems:1];
    }

    id v5 = v11;
  }
}

- (void)didBlockContact:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F6E710], "sharedInstance", a3);
  [v4 logPrivatizedUIInteractionEvent:6];

  id v5 = [(CKTranscriptCollectionViewController *)self conversation];
  id v6 = [v5 recipients];
  id v8 = [v6 firstObject];

  id v7 = [v8 defaultIMHandle];
  [(CKTranscriptCollectionViewController *)self _blockHandle:v7];
}

- (void)didBlockContacts:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F6E710], "sharedInstance", a3);
  [v4 logPrivatizedUIInteractionEvent:6];

  id v5 = [(CKTranscriptCollectionViewController *)self view];
  [(CKTranscriptCollectionViewController *)self _showBlockContactSelectionAlertFromView:v5];
}

- (void)didLeaveConversation:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F6E710], "sharedInstance", a3);
  [v4 logPrivatizedUIInteractionEvent:5];

  id v5 = [(CKTranscriptCollectionViewController *)self view];
  [(CKTranscriptCollectionViewController *)self _showLeaveConversationFromView:v5];
}

- (void)initiateSmartEmojiResponsesUpdateWithChatItems:(id)a3
{
  sub_18F4DD028();
  unint64_t v4 = sub_18F7B99C0();
  id v5 = self;
  sub_18F4DC138(v4);

  swift_bridgeObjectRelease();
}

- (void)prewarmTapbackPickerImages
{
  uint64_t v2 = qword_1E922BB10;
  BOOL v3 = self;
  if (v2 != -1)
  {
    unint64_t v4 = v3;
    swift_once();
    BOOL v3 = v4;
  }
  if (qword_1E922BB20 != -1)
  {
    id v5 = v3;
    swift_once();
    BOOL v3 = v5;
  }
}

- (void)updateScrollIntentWithTrigger:(id)a3 activeKeyboardAppearanceAnimationProperties:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = self;
  sub_18F4F85F4(a3, a4);
  swift_unknownObjectRelease();
}

- (BOOL)pointIntersectsRepositionEnabledSticker:(CGPoint)a3 chatItem:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = self;
  uint64_t v9 = (CKTranscriptCollectionViewController *)a4;
  id v10 = self;
  id v11 = objc_msgSend(v8, sel_sharedFeatureFlags);
  LODWORD(v8) = objc_msgSend(v11, sel_isStickerRepositioningEnabled);

  if (v8)
  {
    id v12 = [(CKTranscriptCollectionViewController *)v9 visibleRepositionEnabledStickers];
    sub_18EF3528C(0, (unint64_t *)&unk_1E923A070);
    unint64_t v13 = sub_18F7B99C0();

    id v14 = v10;
    char v15 = sub_18F5061B4(v13, v14, x, y);

    swift_bridgeObjectRelease();
    uint64_t v9 = v14;
  }
  else
  {
    char v15 = 0;
  }

  return v15 & 1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  sub_18F7B6410();
  uint64_t v9 = sub_18F7B99C0();
  id v10 = (UICollectionView *)a3;
  id v11 = self;
  id v12 = (void *)CKTranscriptCollectionViewController.collectionView(_:contextMenuConfigurationForItemsAt:point:)(v10, (Swift::OpaquePointer)v9, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  swift_bridgeObjectRelease();

  return v12;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  return sub_18F505DBC(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, char *))sub_18F50671C);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  return sub_18F505DBC(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, char *))sub_18F5068C4);
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_18F50765C((uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (id)_collectionView:(id)a3 accessoriesForContextMenuWithConfiguration:(id)a4 layoutAnchor:(id *)a5
{
  id v7 = self;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = sub_18F5077C0((uint64_t)a4);

  if (v10)
  {
    sub_18EF3528C(0, &qword_1E923A0E8);
    id v11 = (void *)sub_18F7B99A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_collectionView:(id)a3 styleForContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)sub_18F507958((uint64_t)a4);

  return v9;
}

- (void)configureTranscriptCell:(id)a3 hidden:(BOOL)a4
{
  id v7 = a3;
  id v8 = self;
  sub_18F66CA68(a3, a4);
}

- (void)setChatItemHidden:(BOOL)a3 forChatItemGUID:(id)a4
{
  uint64_t v6 = sub_18F7B97E0();
  unint64_t v8 = v7;
  id v9 = self;
  sub_18F66C368(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)beginEmphasisWithMessageGUID:(id)a3
{
  sub_18F7B97E0();
  unint64_t v4 = self;
  sub_18F6EFA20();

  swift_bridgeObjectRelease();
}

- (void)updateEmphasis
{
  uint64_t v2 = self;
  sub_18F6EFF4C();
}

- (void)updateBalloonEmphasisIfNeededWithCell:(id)a3 chatItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_18F6F1298(v6, v7);
}

- (id)selectedMediaObjectForCommSafetyReport:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E922ABE0);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_18F7B63E0();
    uint64_t v8 = sub_18F7B6410();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_18F7B6410();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  uint64_t v10 = self;
  CKTranscriptCollectionViewController.selectedMediaObjectForCommSafetyReport(selectedIndexPath:)((uint64_t)v7);
  id v12 = v11;

  sub_18F4ADE30((uint64_t)v7);

  return v12;
}

- (id)mediaObjectsForCommSafetyReport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CKTranscriptCollectionViewController.mediaObjectsForCommSafetyReport(selectedMediaObject:)();

  sub_18EF3528C(0, (unint64_t *)&qword_1E922C270);
  sub_18F73C6F4();
  uint64_t v6 = (void *)sub_18F7B9BC0();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)hasCommSafetyNotViewableAssociatedItems:(id)a3
{
  uint64_t v4 = sub_18F7B6410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  uint64_t v8 = self;
  unsigned __int8 v9 = CKTranscriptCollectionViewController.hasCommSafetyNotViewableAssociatedItems(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (void)deleteChatItems:(uint64_t)a3 sender:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__CKTranscriptCollectionViewController_deleteChatItems_sender___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 136315394;
  uint64_t v5 = "-[CKTranscriptCollectionViewController deleteChatItems:sender:]_block_invoke";
  __int16 v6 = 2048;
  uint64_t v7 = [a1 count];
  OUTLINED_FUNCTION_8(&dword_18EF18000, a2, v3, "%s requesting deletion of %lu guids", (uint8_t *)&v4);
}

- (void)updateTranscriptScrollIntentForUserScrollToContentOffset:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EF18000, v0, v1, "User unexpectedly scrolled the transcript during an active throw animation. This should not be possible.", v2, v3, v4, v5, v6);
}

- (void)updateTranscriptScrollIntentForUserScrollToContentOffset:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EF18000, v0, v1, "User unexpectedly scrolled the main transcript while the inline reply overlay was presented.", v2, v3, v4, v5, v6);
}

- (void)scrollViewDidEndDragging:willDecelerate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Dragging has ended, but scroll intent is still dragging, updating scroll intent based on current contentOffset, instead of targetContentOffset.", v2, v3, v4, v5, v6);
}

- (void)collectionView:cellForItemAtIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)_addChatItemsToInputContextHistory:(void *)a3 signalingResponseContextChangeIfNeeded:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 IMChatItem];
  uint64_t v8 = [v7 guid];
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_error_impl(&dword_18EF18000, a4, OS_LOG_TYPE_ERROR, "Could not determine sender identifier for chat item %@, not adding to input context history.", a1, 0xCu);
}

- (void)quickActionButtonWasTapped:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)quickActionButtonWasTapped:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "quickSaveButtonWasTapped: Chat item can't be quicked saved: %@", v2, v3, v4, v5, v6);
}

- (void)_showAutoDonationAlert:forAppName:bundleID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_8(&dword_18EF18000, v1, (uint64_t)v1, "Not showing SWY alert. AppName: %@ BundleID: %@", v2);
}

- (void)_quickActionSaveButtonWasTapped:atIndexPath:chatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "quickSaveButtonWasTapped: Didn't find media objects in organic chat item", v2, v3, v4, v5, v6);
}

- (void)_saveMediaObjects:withMomentShareURL:sender:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "quickSaveButtonWasTapped: Fail to shave momentShareURL.", v2, v3, v4, v5, v6);
}

- (void)_saveMediaObjects:withMomentShareURL:sender:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Sender cannot handle this media object(s)", v2, v3, v4, v5, v6);
}

- (void)tuConversationBalloonJoinButtonTapped:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EF18000, v0, v1, "Received invalid type of balloonView", v2, v3, v4, v5, v6);
}

- (void)didTapUnavailableMomentShareBalloonView:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "No moment share URL for chat item: %@", v2, v3, v4, v5, v6);
}

void __80__CKTranscriptCollectionViewController_didTapUnavailableMomentShareBalloonView___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_8(&dword_18EF18000, a3, (uint64_t)a3, "Failed to open moment share URL: %@, error: %@", (uint8_t *)&v4);
}

- (void)effectManager:didStartEffect:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Invalid balloon size, skipping creating graphics context.!", v2, v3, v4, v5, v6);
}

- (void)configureCell:(uint64_t)a3 forCKChatItem:atIndexPath:animated:animationDuration:animationCurve:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint8_t v6 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v6);
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v7 = 138412290;
  uint64_t v8 = v5;
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, a2, a3, "Configuring a CKTranscriptStatusCell with an invalid chat item of type: %@", (uint8_t *)&v7);
  if (a1) {
}
  }

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v4, (uint64_t)v4, "  chatItems (count): %@", v5);
}

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "  regenerate: %@", v2, v3, v4, v5, v6);
}

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "  reload: %@", v2, v3, v4, v5, v6);
}

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "  removed: %@", v2, v3, v4, v5, v6);
}

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "  inserted: %@", v2, v3, v4, v5, v6);
}

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.6()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v4, (uint64_t)v4, "  imChatItems (count): %@", v5);
}

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.7()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v4, (uint64_t)v4, "  collectionView: %@ items", v5);
}

- (void)updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "  Exception: %@", v2, v3, v4, v5, v6);
}

- (void)updateTranscriptChatItems:(uint64_t)a3 inserted:(uint64_t)a4 removed:(uint64_t)a5 reload:(uint64_t)a6 regenerate:(uint64_t)a7 animated:(uint64_t)a8 completion:.cold.9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateTranscriptChatItems:inserted:removed:reload:regenerate:animated:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "\t>> Detected a discrepancy between the imChatItems in the update, and the ones associated with the model", v2, v3, v4, v5, v6);
}

void __72__CKTranscriptCollectionViewController__itemGUIDsForItems_inIMChatItem___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 count];
  int v7 = 134218240;
  uint64_t v8 = a2;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_8(&dword_18EF18000, a3, v6, "Called _itemGUIDsForItems with invalid index: %tu chatItems.count: %tu", (uint8_t *)&v7);
}

- (void)_updateCollectionViewForChatItems:oldChatItems:inserted:removed:associatedInserted:associatedRemoved:animationDuration:animationCurve:completion:.cold.1()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_8(&dword_18EF18000, v7, v5, "newChatItems (count): %@, items:\n %@", v6);
}

- (void)_updateCollectionViewForChatItems:oldChatItems:inserted:removed:associatedInserted:associatedRemoved:animationDuration:animationCurve:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "inserted: %@", v2, v3, v4, v5, v6);
}

- (void)_updateCollectionViewForChatItems:oldChatItems:inserted:removed:associatedInserted:associatedRemoved:animationDuration:animationCurve:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "removed: %@", v2, v3, v4, v5, v6);
}

- (void)_updateCollectionViewForChatItems:oldChatItems:inserted:removed:associatedInserted:associatedRemoved:animationDuration:animationCurve:completion:.cold.4()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_8(&dword_18EF18000, v7, v5, "oldChatItems (count): %@, items:\n %@", v6);
}

- (void)_updateCollectionViewForChatItems:(void *)a1 oldChatItems:(uint64_t)a2 inserted:removed:associatedInserted:associatedRemoved:animationDuration:animationCurve:completion:.cold.5(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9_0((uint64_t)a1, a2, 5.7779e-34);
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v3, (uint64_t)v3, "collectionView: %@ items", v4);
}

- (void)_updateCollectionViewForChatItems:(uint64_t)a3 oldChatItems:inserted:removed:associatedInserted:associatedRemoved:animationDuration:animationCurve:completion:.cold.6(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_8(&dword_18EF18000, v6, v4, "  chat: %@, exception: %@", v5);
}

- (void)_updateCollectionViewForChatItems:oldChatItems:inserted:removed:associatedInserted:associatedRemoved:animationDuration:animationCurve:completion:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Failed trying to perform batch updates on collectionView", v2, v3, v4, v5, v6);
}

- (void)_sanitizeInsertedIndices:(void *)a1 inChatItems:(NSObject *)a2 withIMChatItems:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, a2, v4, "\timChatItems (count): %@", v5);
}

- (void)_sanitizeInsertedIndices:(void *)a1 inChatItems:(NSObject *)a2 withIMChatItems:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a1 collectionView];
  uint64_t v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "numberOfItemsInSection:", 0));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, a2, v6, "\tcollectionView: %@ items", v7);
}

- (void)setChatItems:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EF18000, v0, v1, "Attempted to recursively call setChatItems while setChatItems is already in progress. Recursive calls to setChatItems are not permitted.", v2, v3, v4, v5, v6);
}

- (void)touchUpInsideNotifyAnywayButton:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9_0((uint64_t)a1, a2, 5.7779e-34);
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v3, (uint64_t)v3, "Could not find chat item to notify in chat %@", v4);
}

- (void)touchUpInsideCellStampButton:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Could not find index path for stamp button", v2, v3, v4, v5, v6);
}

- (void)touchUpInsideCellStampButton:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Chat item found is not a CKStampButtonChatItem", v2, v3, v4, v5, v6);
}

- (void)touchUpInsideCellStampButton:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "touchUpInsideCellStampButton inside an extension, ignoring touch", v2, v3, v4, v5, v6);
}

- (void)_handleEditHistoryButtonTappedForIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Chat item is not a message chat item: %@", v2, v3, v4, v5, v6);
}

- (void)_handleFailedCancelStatusButtonTappedForIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Scheduled Message Marked as Sent should not show cancel status", v2, v3, v4, v5, v6);
}

- (void)previewDidChange:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 guid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, a2, v4, "Preview not found for transferGUID: %@. Skipping reload.", v5);
}

- (void)chatItemsDidChange:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Going to try to recover by regenerating chatItems from oldItems", v2, v3, v4, v5, v6);
}

- (void)chatItemsDidChange:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a1 isInline]) {
    uint8_t v6 = @"YES";
  }
  else {
    uint8_t v6 = @"NO";
  }
  int v7 = NSNumber;
  uint64_t v8 = [a1 chatItems];
  __int16 v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  uint64_t v11 = [a1 chat];
  id v12 = [a1 chat];
  unint64_t v13 = [v12 guid];
  int v14 = 138413314;
  char v15 = v6;
  __int16 v16 = 2112;
  int64_t v17 = v9;
  __int16 v18 = 2112;
  uint64_t v19 = v10;
  __int16 v20 = 2112;
  int64_t v21 = v11;
  __int16 v22 = 2112;
  uint64_t v23 = v13;
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "(Inline: %@) Invalid self.chatItems.count: %@, compared to oldItems.count: %@ for chat: %@, guid: %@", (uint8_t *)&v14, 0x34u);
}

- (void)verticallyScrollTranscriptByAmount:animated:duration:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Collection view scrolling is disabled", v2, v3, v4, v5, v6);
}

- (void)selectRangeWithIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "expecting at least one selected item!", v2, v3, v4, v5, v6);
}

@end