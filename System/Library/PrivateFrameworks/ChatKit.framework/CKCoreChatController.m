@interface CKCoreChatController
+ (Class)_gradientReferenceViewClass;
+ (Class)transcriptControllerClass;
- (BOOL)_controllerEligibleForSetConversation;
- (BOOL)_conversationHasReplyEnabled;
- (BOOL)_haveUpdateAlready:(id)a3 forContact:(id)a4;
- (BOOL)_isRunningPPT;
- (BOOL)_shouldAllowReply;
- (BOOL)_shouldAllowReplyFromLockScreen;
- (BOOL)accountCanCreateNickname;
- (BOOL)chatSupportsStickerTapbacks;
- (BOOL)conversationAllowedByScreenTime;
- (BOOL)disableAnimationsUnderTest;
- (BOOL)fullScreenBalloonViewControllerShouldEnableStickerTapbacks:(id)a3;
- (BOOL)fullScreenBalloonViewControllerShouldShowHightlightButton:(id)a3 forChatItem:(id)a4;
- (BOOL)ignoreLastBalloonVisibleInMarkAsReadCheck;
- (BOOL)initialLayoutComplete;
- (BOOL)isFullScreenBalloonViewOnScreen;
- (BOOL)isInline;
- (BOOL)isSafeToMarkAsRead;
- (BOOL)isSendingMessage;
- (BOOL)isShowingLockoutView;
- (BOOL)itemProviderDisablesTouches;
- (BOOL)needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet;
- (BOOL)saveContact:(id)a3 shouldUpdate:(BOOL)a4;
- (BOOL)shareWasCreated;
- (BOOL)shouldDismissAfterSend;
- (BOOL)shouldDisplayTextEntry;
- (BOOL)shouldIgnoreKeyboardAnimationDuration;
- (BOOL)shouldListParticipantsInTitle;
- (BOOL)shouldShowFullScreenAcknowledgmentPickerForChatItem:(id)a3;
- (BOOL)shouldShowTapbackAttributionForChatItem:(id)a3;
- (BOOL)shouldShowTapbackAttributionForFullScreenBalloonViewController:(id)a3;
- (BOOL)shouldShowTapbackPickerForChatItem:(id)a3;
- (BOOL)shouldShowTapbackPickerForFullScreenBalloonViewController:(id)a3;
- (BOOL)shouldUpdateScrollPositionForKeyboardScreenFrameChanges;
- (BOOL)shouldUseInitialViewSize;
- (BOOL)showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:(id)a3;
- (BOOL)showingInStandAloneWindow;
- (BOOL)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 shouldSelectChatItem:(id)a5;
- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitPayload:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7;
- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitSticker:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7;
- (BOOL)transcriptCollectionViewController:(id)a3 shouldCleanupFullscreenEffectUI:(id)a4;
- (BOOL)transcriptCollectionViewController:(id)a3 shouldSetupFullscreenEffectUI:(id)a4;
- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldLayoutFullscreenEffects:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldScrollToBottomForLocalSentMessage:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldShouldScrollToTopForStatusBarTap:(id)a3;
- (BOOL)transitionedFromComposing;
- (BOOL)userInitiatedTranscriptPush;
- (BOOL)viewIsVisible;
- (BOOL)wantsReplyButton;
- (CGPoint)contentOffsetForIndexPath:(id)a3 viewToAlignWith:(id)a4 allowOverScroll:(BOOL)a5;
- (CGPoint)contentOffsetForIndexPath:(id)a3 viewToAlignWith:(id)a4 allowOverScroll:(BOOL)a5 scrollPosition:(unint64_t)a6;
- (CGRect)_initialFrameForCollectionView;
- (CGRect)_initialFrameForGradientReferenceView;
- (CGRect)fullScreenBalloonViewController:(id)a3 balloonFrameForChatItem:(id)a4;
- (CGRect)fullScreenBalloonViewControllerSafeAreaLayoutFrame:(id)a3;
- (CGRect)gradientFrameWithInsets:(UIEdgeInsets)a3;
- (CGSize)initialViewSize;
- (CKChatInputController)inputController;
- (CKConversation)conversation;
- (CKCoreChatController)initWithConversation:(id)a3;
- (CKCoreChatControllerDelegate)delegate;
- (CKCoreTranscriptControllerProtocol)collectionViewController;
- (CKFullScreenBalloonViewController)fullScreenBalloonViewController;
- (CKMacToolbarController)macToolbarController;
- (CKScheduledUpdater)refreshServiceForSendingUpdater;
- (CKTranscriptCollectionView)collectionView;
- (IMChat)chat;
- (IMHandleStatusObserverAssertion)handleStatusAssertion;
- (NSCountedSet)activePinningInputViewReasons;
- (NSTimer)satelliteFetchTimer;
- (STLockoutViewController)lockoutViewController;
- (UIEdgeInsets)calculateTranscriptMarginInsets;
- (UIEdgeInsets)calculateTranscriptSafeAreaInsets;
- (UIProgressView)progressBar;
- (UIView)satelliteUnavailableLabel;
- (double)_maxEntryViewHeight;
- (double)balloonMaxWidth;
- (double)gradientBottomPlaceholderHeight;
- (double)sendProgress;
- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4;
- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3;
- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3 displayConfiguration:(id)a4;
- (id)_handleIDsForCurrentConversation;
- (id)_nicknameBannerUpdatesAndStyle:(unint64_t *)a3;
- (id)_retrieveNicknameBannerUpdatesIfNeeded:(unint64_t *)a3;
- (id)_threadChatItemForReplyCountChatItem:(id)a3 chatItems:(id)a4;
- (id)associatedTapbackPileViewForFullScreenBalloonViewController:(id)a3;
- (id)balloonViewForChatItem:(id)a3;
- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3;
- (id)contextualChatItemsForTapbackPicker;
- (id)createMutableContact:(id)a3 withNicknameUpdate:(id)a4 updateType:(unint64_t)a5 addHandleToContact:(BOOL)a6;
- (id)currentlyFocusedChatItemForTapbackInTranscriptCollectionViewController:(id)a3;
- (id)firstUnreadMessageItemGUIDForTranscriptCollectionViewController:(id)a3;
- (id)fullScreenBalloonViewController:(id)a3 balloonViewForChatItem:(id)a4;
- (id)fullScreenBalloonViewController:(id)a3 duplicatedViewForChatItem:(id)a4;
- (id)fullScreenBalloonViewControllerSmartEmojiResponses:(id)a3;
- (id)indexPathForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4;
- (id)insertItemsEmojiTapbacksCallBack;
- (id)lazyCreatedActivePinningInputViewReasons;
- (id)removeItemsEmojiTapbacksCallBack;
- (id)scrollView;
- (id)selectedChatItems;
- (id)textInputContextIdentifier;
- (id)textInputContextIdentifierForFullScreenBalloonViewController:(id)a3;
- (id)toolbarItemForIdentifier:(id)a3;
- (id)transcriptCollectionViewControllerAdditionalFullscreenEffectViews:(id)a3;
- (id)transcriptCollectionViewControllerOuterEffectPresentingView:(id)a3;
- (id)viewToInsertTranscriptCollectionViewBelow;
- (int64_t)acknowledgmentToSend;
- (int64_t)transcriptCollectionViewControllerWantsCurrentDesiredIntent:(id)a3;
- (unint64_t)sendProgressSendCount;
- (unint64_t)sendProgressTotalCount;
- (void)_cancelSatelliteFetch;
- (void)_chatRegistryDidReloadNotification:(id)a3;
- (void)_chatsRemergedNotification:(id)a3;
- (void)_conversationListFinishedMerging:(id)a3;
- (void)_deregisterSendProgressDelegate;
- (void)_didSendCompositionInConversation:(id)a3;
- (void)_dismissFullScreenBubbleViewControllerAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 completion:(id)a5;
- (void)_displayNameUpdatedNotification:(id)a3;
- (void)_displaySatelliteStatusItemIfNeeded;
- (void)_downgradeStateChangedNotification:(id)a3;
- (void)_handleShowInlineReplyForItemWithIndexPath:(id)a3 replyTransitionProperties:(id)a4;
- (void)_handleStatusChangedNotification:(id)a3;
- (void)_handleStatusInvitationReceivedNotification:(id)a3;
- (void)_handleStatusStateChangedNotification:(id)a3;
- (void)_handleTapEventForBalloonView:(id)a3 atIndexPath:(id)a4;
- (void)_increaseContrastDidChangeNotification:(id)a3;
- (void)_inviteToViewStatusesIfNeeded;
- (void)_localeDidChangeNotification:(id)a3;
- (void)_markAsReadIfNecessary;
- (void)_messageSomeonePressed;
- (void)_performResume;
- (void)_preferredServiceChangedNotification:(id)a3;
- (void)_reassignConversationWithDeferredReload:(BOOL)a3;
- (void)_refreshServiceForSending;
- (void)_refreshServiceForSendingForSatelliteStateChange;
- (void)_registerCommSafetyReceivedEventForTransfer:(id)a3 messageGUID:(id)a4;
- (void)_registerSendProgressDelegate;
- (void)_removeExistingCollectionViewController;
- (void)_satelliteStateChangedNotification:(id)a3;
- (void)_serviceSwitchNotification:(id)a3;
- (void)_setTranscriptCustomScrollAnimationFromAnimationProperties:(id)a3;
- (void)_startSatelliteFetchIfNecessary;
- (void)_statusDaemonDisconnectedNotification:(id)a3;
- (void)_updateForNewPreferredService;
- (void)_updateGradientReferenceViewForContentInset:(UIEdgeInsets)a3 withAnimationProperties:(id)a4;
- (void)_updateTitleAnimated:(BOOL)a3;
- (void)_willSendComposition:(id)a3 inConversation:(id)a4;
- (void)beginPinningInputViewsForReason:(id)a3;
- (void)chat:(id)a3 progressDidChange:(float)a4 sendingMessages:(id)a5 sendCount:(unint64_t)a6 totalCount:(unint64_t)a7 finished:(BOOL)a8;
- (void)configureWithToolbarController:(id)a3;
- (void)contentInsetDidChangeWithAnimationProperties:(id)a3;
- (void)contentInsetWillChange:(UIEdgeInsets)a3 withAnimationProperties:(id)a4;
- (void)copyChatItem:(id)a3;
- (void)dealloc;
- (void)deleteChatItem:(id)a3;
- (void)endPinningInputViewsForReason:(id)a3;
- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4;
- (void)fullScreenBalloonViewController:(id)a3 didDeselectTapback:(id)a4;
- (void)fullScreenBalloonViewController:(id)a3 didSelectTapback:(id)a4;
- (void)fullScreenBalloonViewController:(id)a3 requestedPresentPlugin:(id)a4 withPayloadID:(id)a5;
- (void)fullScreenBalloonViewController:(id)a3 sendMessageHighlight:(BOOL)a4 forChatItem:(id)a5;
- (void)fullScreenBalloonViewController:(id)a3 updateTapbackPileAppearanceAsHidden:(BOOL)a4;
- (void)fullScreenBalloonViewController:(id)a3 updateTranscriptBalloonViewAppearanceAsHidden:(BOOL)a4;
- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3;
- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3;
- (void)fullScreenBalloonViewControllerMessageHighlightButtonDidFinishAnimating:(id)a3;
- (void)fullScreenBalloonViewControllerRequestedAppCardDismiss:(id)a3;
- (void)handleContentSizeCategoryDidChangeNotification:(id)a3;
- (void)invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:(id)a3;
- (void)keyboardWillHideViaGesture;
- (void)loadView;
- (void)parentControllerDidBecomeActive;
- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4;
- (void)preferredSendingServiceChanged;
- (void)prepareForSuspend;
- (void)presentMacToolbarController;
- (void)providerWillBeRemovedFromToolbarController:(id)a3;
- (void)refreshServiceForSending;
- (void)registerNotifications;
- (void)scrollToHighlightedMessageScrollContext:(id)a3;
- (void)sendStickerTapback:(id)a3 mediaObject:(id)a4 parentMessagePartChatItem:(id)a5;
- (void)sendTapback:(id)a3 chatItem:(id)a4 isRemoval:(BOOL)a5;
- (void)setAcknowledgmentToSend:(int64_t)a3;
- (void)setActivePinningInputViewReasons:(id)a3;
- (void)setCollectionViewController:(id)a3;
- (void)setConversation:(id)a3;
- (void)setConversation:(id)a3 forceReload:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDisableAnimationsUnderTest:(BOOL)a3;
- (void)setFullScreenBalloonViewController:(id)a3;
- (void)setHandleStatusAssertion:(id)a3;
- (void)setIgnoreLastBalloonVisibleInMarkAsReadCheck:(BOOL)a3;
- (void)setInitialLayoutComplete:(BOOL)a3;
- (void)setInitialViewSize:(CGSize)a3;
- (void)setInputController:(id)a3;
- (void)setInsertItemsEmojiTapbacksCallBack:(id)a3;
- (void)setIsShowingLockoutView:(BOOL)a3;
- (void)setLockoutViewController:(id)a3;
- (void)setMacToolbarController:(id)a3;
- (void)setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:(BOOL)a3;
- (void)setProgressBar:(id)a3;
- (void)setRefreshServiceForSendingUpdater:(id)a3;
- (void)setRemoveItemsEmojiTapbacksCallBack:(id)a3;
- (void)setSatelliteFetchTimer:(id)a3;
- (void)setSatelliteUnavailableLabel:(id)a3;
- (void)setSendProgress:(double)a3;
- (void)setSendProgressSendCount:(unint64_t)a3;
- (void)setSendProgressTotalCount:(unint64_t)a3;
- (void)setSendingMessage:(BOOL)a3;
- (void)setShareWasCreated:(BOOL)a3;
- (void)setShowingInStandAloneWindow:(BOOL)a3;
- (void)setTransitionedFromComposing:(BOOL)a3;
- (void)setUserInitiatedTranscriptPush:(BOOL)a3;
- (void)setViewIsVisible:(BOOL)a3;
- (void)setupScrollingForKeyboardInteraction;
- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3;
- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3 displayConfiguration:(id)a4;
- (void)showFullScreenTapbackKeyboardInputForChatItem:(id)a3;
- (void)showInlineReplyControllerForChatItem:(id)a3 presentKeyboard:(BOOL)a4;
- (void)significantTimeChange;
- (void)systemApplicationDidResume;
- (void)systemApplicationWillEnterForeground;
- (void)traitCollectionDidChange:(id)a3;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 doubleTappedItemAtIndexPath:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 longPressedForItemWithIndexPath:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 selectedItemAtIndexPath:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 showInlineReplyForItemWithIndexPath:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 showInlineReplyForItemWithIndexPath:(id)a5 withReplyTransitionProperties:(id)a6;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4;
- (void)transcriptCollectionViewController:(id)a3 didInsertChatItems:(id)a4 associatedChatItems:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 didRemoveChatItems:(id)a4 associatedChatItems:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 requestDeleteJunkConversation:(id)a4;
- (void)transcriptCollectionViewController:(id)a3 requestRecoverJunkConversation:(id)a4;
- (void)transcriptCollectionViewController:(id)a3 shouldScrollToHighlightedMessage:(id)a4;
- (void)transcriptCollectionViewController:(id)a3 viewedCommSafetyAssociatedItemsWithIndexPath:(id)a4;
- (void)transcriptCollectionViewController:(id)a3 viewedCommSafetyItemWithIndexPath:(id)a4;
- (void)transcriptCollectionViewController:(id)a3 willDeleteChatItems:(id)a4;
- (void)transcriptCollectionViewControllerDidChangeAssociatedChatItem:(id)a3 chatItemDiff:(id)a4;
- (void)transcriptCollectionViewControllerDidInset:(id)a3;
- (void)transcriptCollectionViewControllerDidSetChatItems:(id)a3;
- (void)transcriptCollectionViewControllerReportSpamButtonTapped:(id)a3;
- (void)transcriptCollectionViewControllerWillDisplayLastBalloon:(id)a3;
- (void)updateContact:(id)a3 withHandle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidAppearDeferredSetup;
- (void)viewDidLayoutSubviews;
- (void)viewDidLayoutSubviewsForTranscriptCollectionViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKCoreChatController

- (id)_nicknameBannerUpdatesAndStyle:(unint64_t *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v31 = [MEMORY[0x1E4F6BD50] sharedInstance];
  v3 = [(CKCoreChatController *)self conversation];
  v4 = [v3 recipients];

  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v32 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (!v32)
  {
    unint64_t v33 = 0;
    goto LABEL_40;
  }
  unint64_t v33 = 0;
  uint64_t v30 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v32; ++i)
    {
      if (*(void *)v37 != v30) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v7 = [v6 defaultIMHandle];
      v8 = [v6 defaultIMHandle];
      v34 = [v8 ID];

      v9 = [v6 defaultIMHandle];
      id v35 = 0;
      unint64_t v10 = [v31 nicknameUpdateForHandle:v9 nicknameIfAvailable:&v35];
      id v11 = v35;

      if (IMOSLoggingEnabled())
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v41 = (unint64_t)v34;
          __int16 v42 = 2048;
          unint64_t v43 = v10;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "handle ID %@ has nickname state %lu", buf, 0x16u);
        }
      }
      if (v10)
      {
        v13 = objc_opt_new();
        [v13 setHandle:v7];
        [v13 setUpdateType:v10];
        if (v11) {
          [v13 setNickname:v11];
        }
        v14 = [MEMORY[0x1E4F6E6D8] keysForNicknameHandling];
        v15 = [v7 cnContactWithKeys:v14];

        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v13 setContact:v15];
          }
        }
        v16 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v16 userInterfaceIdiom])
        {
          v17 = [MEMORY[0x1E4F42948] currentDevice];
          BOOL v18 = [v17 userInterfaceIdiom] == 1;
        }
        else
        {
          BOOL v18 = 1;
        }

        BOOL v19 = (v10 & 2) == 0 && v18;
        if (!v19
          && ![(CKCoreChatController *)self _haveUpdateAlready:v29 forContact:v15])
        {
          [v29 addObject:v13];
        }
        if (v33)
        {
          unint64_t v20 = [v29 count];
          uint64_t v21 = v33;
          if (v20 > 1) {
            uint64_t v21 = 4;
          }
          goto LABEL_34;
        }
        v22 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v23 = [v22 isNameAndPhotoC3Enabled];

        unint64_t v33 = v10 & 2;
        if ((v23 & v18 & 1) == 0)
        {
          uint64_t v21 = 2;
          if ((~(_BYTE)v10 & 6) == 0) {
            uint64_t v21 = 3;
          }
          if ((v10 & 2) == 0) {
            uint64_t v21 = (v10 >> 2) & 1;
          }
LABEL_34:
          unint64_t v33 = v21;
        }
      }
    }
    uint64_t v32 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  }
  while (v32);
LABEL_40:

  if (a3) {
    *a3 = v33;
  }
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v41 = v33;
      __int16 v42 = 2112;
      unint64_t v43 = (unint64_t)v29;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Returning style %lu for nicknames %@", buf, 0x16u);
    }
  }

  return v29;
}

- (id)createMutableContact:(id)a3 withNicknameUpdate:(id)a4 updateType:(unint64_t)a5 addHandleToContact:(BOOL)a6
{
  BOOL v6 = a6;
  char v7 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v39 = self;
  BOOL v41 = v6;
  if (v10) {
    id v12 = (id)[v10 mutableCopy];
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  }
  v13 = v12;
  v14 = [v11 nickname];
  v15 = v14;
  if ((v7 & 2) != 0)
  {
    v16 = [v14 firstName];
    [v13 setGivenName:v16];

    v17 = [v15 lastName];
    [v13 setFamilyName:v17];
  }
  if ((v7 & 4) != 0)
  {
    BOOL v18 = [v15 avatar];
    uint64_t v40 = [v18 imageData];

    if (v40)
    {
      objc_msgSend(v13, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v13 setThumbnailImageData:0];
      [v13 setImageData:v40];
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v43 = v15;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "CKCoreChatController_Nicknames: Trying to update contact avatar with nil image from nickname %@", buf, 0xCu);
      }
    }
    unint64_t v20 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v21 = [v20 isNameAndPhotoC3Enabled];

    v22 = (void *)v40;
    if (!v21) {
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      id v23 = objc_alloc(MEMORY[0x1E4F1BAE0]);
      v24 = [v15 wallpaper];
      v25 = [v24 filePath];
      v26 = [v15 wallpaper];
      v27 = [v26 wallpaperData];
      v28 = [v15 wallpaper];
      id v29 = objc_msgSend(v23, "initWithIdentifier:posterArchiveData:contentIsSensitive:", v25, v27, objc_msgSend(v28, "contentIsSensitive"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        id v29 = 0;
        goto LABEL_20;
      }
      id v30 = objc_alloc(MEMORY[0x1E4F1BAE0]);
      v24 = [v15 wallpaper];
      v25 = [v24 wallpaperData];
      id v29 = (void *)[v30 initWithPosterArchiveData:v25];
    }

LABEL_20:
    v31 = [v15 wallpaper];
    uint64_t v32 = [v31 metadata];

    if (v32)
    {
      uint64_t v33 = [v29 wallpaperIncludingIMWallpaperMetadata:v32];

      id v29 = (void *)v33;
    }
    if (v29)
    {
      [v13 setWallpaper:v29];
    }
    else if (IMOSLoggingEnabled())
    {
      v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v43 = v15;
        _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Trying to update contact wallpaper with nil wallpaper from nickname %@", buf, 0xCu);
      }
    }
    v22 = (void *)v40;
LABEL_29:
  }
  if (v41)
  {
    id v35 = [v15 handle];
    BOOL v36 = [v35 length] == 0;

    if (!v36)
    {
      long long v37 = [v15 handle];
      [(CKCoreChatController *)v39 updateContact:v13 withHandle:v37];
    }
  }

  return v13;
}

- (BOOL)saveContact:(id)a3 shouldUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    char v7 = [v6 getContactStore];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
    v9 = v8;
    if (v4) {
      [v8 updateContact:v5];
    }
    else {
      [v8 addContact:v5 toContainerWithIdentifier:0];
    }
    id v15 = 0;
    char v10 = [v7 executeSaveRequest:v9 error:&v15];
    id v11 = v15;
    if (v11) {
      char v12 = 0;
    }
    else {
      char v12 = v10;
    }
    if ((v12 & 1) == 0 && IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKCoreChatController_Nicknames: error saving contact: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_haveUpdateAlready:(id)a3 forContact:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        char v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) contact];
        v13 = [v12 identifier];
        v14 = [v6 identifier];
        char v15 = [v13 isEqualToString:v14];

        v9 |= v15;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (id)_retrieveNicknameBannerUpdatesIfNeeded:(unint64_t *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isPriusEnabled];

  BOOL v7 = [(CKViewController *)self appearing];
  if (!v6)
  {
    if (!v7 && ![(CKViewController *)self appeared]) {
      goto LABEL_21;
    }
    uint64_t v8 = [(CKCoreChatController *)self conversation];
    if (![v8 isBusinessConversation])
    {
      uint64_t v10 = [(CKCoreChatController *)self chat];
      if (([v10 isSMS] & 1) == 0
        && !CKIsRunningForDevelopmentOnSimulator()
        && ![(CKCoreChatController *)self _isRunningPPT]
        && ![(CKCoreChatController *)self isInline]
        && !+[CKApplicationState isResizing])
      {
        char v13 = IMIsRunningInScreenshotTesting_IsolatedTranscriptUI();

        if (v13) {
          goto LABEL_21;
        }
        goto LABEL_26;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v7 && ![(CKViewController *)self appeared]) {
    goto LABEL_21;
  }
  uint64_t v8 = [(CKCoreChatController *)self chat];
  if (![v8 supportsCapabilities:8]
    || CKIsRunningForDevelopmentOnSimulator()
    || [(CKCoreChatController *)self _isRunningPPT]
    || [(CKCoreChatController *)self isInline]
    || +[CKApplicationState isResizing])
  {
    goto LABEL_20;
  }
  char v9 = IMIsRunningInScreenshotTesting_IsolatedTranscriptUI();

  if (v9) {
    goto LABEL_21;
  }
LABEL_26:
  v14 = +[CKUIBehavior sharedBehaviors];
  int v15 = [v14 areBannersSupported];

  if (!v15) {
    goto LABEL_21;
  }
  if (![MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]) {
    goto LABEL_33;
  }
  uint64_t v8 = IMSharedDowntimeController();
  if ([v8 isDowntimeLimited]) {
    goto LABEL_20;
  }
  v16 = [(CKCoreChatController *)self conversation];
  long long v17 = [v16 chat];
  if (!v17)
  {

    goto LABEL_33;
  }
  long long v18 = [(CKCoreChatController *)self conversation];
  long long v19 = [v18 chat];
  int v20 = [v19 allowedByScreenTime];

  if (!v20)
  {
LABEL_21:
    id v11 = 0;
    goto LABEL_22;
  }
LABEL_33:
  unint64_t v44 = 0;
  if (IMOSLoggingEnabled())
  {
    int v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Checking nickname banner state", buf, 2u);
    }
  }
  id v22 = [(CKCoreChatController *)self _nicknameBannerUpdatesAndStyle:&v44];
  id v23 = [MEMORY[0x1E4F6E820] sharedInstance];
  if ([(CKCoreChatController *)self accountCanCreateNickname])
  {
    if ([v23 wasSharingEverEnabled])
    {
      if (![(CKCoreChatController *)self _alwaysShowNicknameBanners]
        && ([v23 sharingEnabled] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            BOOL v25 = [(CKCoreChatController *)self _alwaysShowNicknameBanners];
            int v26 = [v23 sharingEnabled];
            v27 = @"NO";
            if (v25) {
              v28 = @"YES";
            }
            else {
              v28 = @"NO";
            }
            if (v26) {
              v27 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            unint64_t v47 = (unint64_t)v28;
            __int16 v48 = 2112;
            v49 = v27;
            _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Not showing banner. Always show nickname banners: %@ is sharing enabled: %@", buf, 0x16u);
          }
LABEL_55:

          goto LABEL_56;
        }
        goto LABEL_56;
      }
    }
    else
    {
      unint64_t v44 = 6;
      if (IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int v32 = [v23 wasSharingEverEnabled];
          uint64_t v33 = @"NO";
          if (v32) {
            uint64_t v33 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          unint64_t v47 = (unint64_t)v33;
          _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "Showing outgoing share banner. Was sharing ever enabled: %@", buf, 0xCu);
        }
      }
    }
    int v34 = objc_msgSend(v23, "sharingEnabled", v44);
    if (v44) {
      int v35 = 0;
    }
    else {
      int v35 = v34;
    }
    if (v35 == 1)
    {
      BOOL v36 = [MEMORY[0x1E4F6BD50] sharedInstance];
      long long v37 = [(CKCoreChatController *)self chat];
      int v38 = [v36 shouldOfferNicknameSharingForChat:v37];

      if (v38)
      {
        if (IMOSLoggingEnabled())
        {
          long long v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v47 = v44;
            _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Should offer nickname sharing. Banner style set to %lu", buf, 0xCu);
          }
        }
        unint64_t v44 = 5;
        uint64_t v40 = objc_alloc_init(CKNicknameUpdate);
        BOOL v41 = [MEMORY[0x1E4F6BD50] sharedInstance];
        __int16 v42 = [v41 personalNickname];
        [(CKNicknameUpdate *)v40 setNickname:v42];

        uint64_t v45 = v40;
        uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];

        id v22 = (id)v43;
      }
    }
    if (a3) {
      *a3 = v44;
    }
    id v22 = v22;
    id v11 = v22;
    goto LABEL_76;
  }
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v29 = IMSharedHelperNickNameEnabled();
      id v30 = @"NO";
      if (v29) {
        id v30 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v47 = (unint64_t)v30;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Not showing banner. Nickname feature enabled: %@", buf, 0xCu);
    }
    goto LABEL_55;
  }
LABEL_56:
  id v11 = 0;
LABEL_76:

LABEL_22:

  return v11;
}

- (BOOL)accountCanCreateNickname
{
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isAllowMultiplePhoneNumbersSNaPEnabled];

  int v4 = IMSharedHelperNickNameEnabled();
  if (v3)
  {
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F6BD50] sharedInstance];
      LOBYTE(v6) = [v5 iCloudSignedInToUseNicknames];
LABEL_9:

      return v6;
    }
  }
  else if (v4)
  {
    id v5 = [MEMORY[0x1E4F6BD50] sharedInstance];
    if ([v5 iCloudSignedInToUseNicknames]) {
      int v6 = [MEMORY[0x1E4F6BD50] multiplePhoneNumbersTiedToAppleID] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
    goto LABEL_9;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (void)updateContact:(id)a3 withHandle:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v5 && [v6 length])
  {
    if ([v7 _appearsToBeEmail])
    {
      uint64_t v8 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:*MEMORY[0x1E4F1B6F8] value:v7];
      char v9 = [v5 emailAddresses];

      if (!v9)
      {
        v15[0] = v8;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
        [v5 setEmailAddresses:v10];
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v10 = [v5 emailAddresses];
      id v11 = [v10 arrayByAddingObject:v8];
      [v5 setEmailAddresses:v11];
LABEL_11:

      goto LABEL_12;
    }
    if ([v7 _appearsToBePhoneNumber])
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v7];
      uint64_t v10 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:*MEMORY[0x1E4F1B728] value:v8];
      char v12 = [v5 phoneNumbers];

      if (v12)
      {
        id v11 = [v5 phoneNumbers];
        char v13 = [v11 arrayByAddingObject:v10];
        [v5 setPhoneNumbers:v13];
      }
      else
      {
        v14 = v10;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
        [v5 setPhoneNumbers:v11];
      }
      goto LABEL_11;
    }
  }
LABEL_13:
}

- (BOOL)_isRunningPPT
{
  return [(id)*MEMORY[0x1E4F43630] isRunningTest];
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 removeListener:self];

  int v4 = [(CKConversation *)self->_conversation chat];
  id v5 = [v4 sendProgressDelegate];

  if (v5 == self) {
    [v4 setSendProgressDelegate:0];
  }
  id v6 = [(CKCoreChatController *)self collectionViewController];
  [v6 setDelegate:0];

  BOOL v7 = [(CKCoreChatController *)self refreshServiceForSendingUpdater];
  [v7 invalidate];

  [(CKConversation *)self->_conversation willBecomeInactive];
  v8.receiver = self;
  v8.super_class = (Class)CKCoreChatController;
  [(CKCoreChatController *)&v8 dealloc];
}

- (CKCoreChatController)initWithConversation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKCoreChatController;
  id v5 = [(CKScrollViewController *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_initialViewSize = (CGSize)*MEMORY[0x1E4F1DB30];
    BOOL v7 = [[CKScheduledUpdater alloc] initWithTarget:v5 action:sel__refreshServiceForSending];
    [(CKCoreChatController *)v6 setRefreshServiceForSendingUpdater:v7];
    [(CKCoreChatController *)v6 setConversation:v4];
    [(CKCoreChatController *)v6 registerNotifications];
    [(CKCoreChatController *)v6 _updateTitleAnimated:0];
    [(CKCoreChatController *)v6 _updateNavigationButtons];
    objc_super v8 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v8 addListener:v6];
  }
  return v6;
}

+ (Class)_gradientReferenceViewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  [(CKCoreChatController *)self _initialFrameForGradientReferenceView];
  id v13 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_gradientReferenceViewClass")), "initWithFrame:", v3, v4, v5, v6);
  [(CKCoreChatController *)self setView:v13];
  BOOL v7 = [(CKCoreChatController *)self view];
  [v7 setAutoresizingMask:18];

  objc_super v8 = [(CKCoreChatController *)self view];
  char v9 = +[CKUIBehavior sharedBehaviors];
  objc_super v10 = [v9 theme];
  id v11 = [v10 transcriptBackgroundColor];
  [v8 setBackgroundColor:v11];

  char v12 = [(CKCoreChatController *)self view];
  [v12 setLayoutMarginsFollowReadableWidth:1];

  [(CKCoreChatController *)self setAutomaticallyAdjustsScrollViewInsets:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CKCoreChatController;
  [(CKCoreChatController *)&v4 viewDidLoad];
  if ([(CKCoreChatController *)self _controllerEligibleForSetConversation])
  {
    double v3 = [(CKCoreChatController *)self conversation];
    [(CKCoreChatController *)self setConversation:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKCoreChatController;
  [(CKViewController *)&v8 viewWillAppear:a3];
  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v4 = [(CKCoreChatController *)self macToolbarController];
    if (v4)
    {
      double v5 = (void *)v4;
      int v6 = [(CKCoreChatController *)self conformsToProtocol:&unk_1EDF48CA0];

      if (v6)
      {
        BOOL v7 = [(CKCoreChatController *)self macToolbarController];
        [v7 setSecondaryItemProvider:self];
      }
    }
  }
  [(CKCoreChatController *)self _registerSendProgressDelegate];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKCoreChatController;
  [(CKViewController *)&v4 viewDidAppear:a3];
  [(CKCoreChatController *)self setViewIsVisible:1];
}

- (void)viewDidAppearDeferredSetup
{
  v6.receiver = self;
  v6.super_class = (Class)CKCoreChatController;
  [(CKViewController *)&v6 viewDidAppearDeferredSetup];
  if (CKIsRunningInMessages()) {
    CKPrewarmPluginBalloonCacheIfNeeded();
  }
  double v3 = +[CKPreviewDispatchCache genmojiPreviewCache];
  [v3 resume];

  objc_super v4 = +[CKPreviewDispatchCache transcriptPreviewCache];
  [v4 resume];

  double v5 = +[CKPreviewDispatchCache snapshotCache];
  [v5 resume];

  [(CKCoreChatController *)self _markAsReadIfNecessary];
  [(CKCoreChatController *)self _inviteToViewStatusesIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKCoreChatController;
  -[CKViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  [(CKCoreChatController *)self setHandleStatusAssertion:0];
  double v5 = +[CKUIBehavior sharedBehaviors];
  if (![v5 useMacToolbar]) {
    goto LABEL_5;
  }
  uint64_t v6 = [(CKCoreChatController *)self macToolbarController];
  if (!v6) {
    goto LABEL_5;
  }
  BOOL v7 = (void *)v6;
  int v8 = [(CKCoreChatController *)self conformsToProtocol:&unk_1EDF48CA0];

  if (v8)
  {
    double v5 = [(CKCoreChatController *)self macToolbarController];
    [v5 removeItemProvider:self];
LABEL_5:
  }
  [(CKCoreChatController *)self _deregisterSendProgressDelegate];
  char v9 = [(CKCoreChatController *)self fullScreenBalloonViewController];

  if (v9)
  {
    objc_super v10 = [(CKCoreChatController *)self fullScreenBalloonViewController];
    id v11 = [v10 displayConfiguration];
    char v12 = [v11 shouldShowStickers];

    if ((v12 & 1) == 0) {
      [(CKCoreChatController *)self _dismissFullScreenBubbleViewControllerAnimated:v3 withSendAnimation:0 completion:0];
    }
  }
  [(CKCoreChatController *)self setViewIsVisible:0];
  id v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isCarrierPigeonEnabled];

  if (v14) {
    [(CKCoreChatController *)self _cancelSatelliteFetch];
  }
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CKCoreChatController;
  [(CKCoreChatController *)&v9 viewDidLayoutSubviews];
  if (![(CKCoreChatController *)self initialLayoutComplete])
  {
    if ([(CKCoreChatController *)self _controllerEligibleForSetConversation])
    {
      [(CKCoreChatController *)self setInitialLayoutComplete:1];
      BOOL v3 = [(CKCoreChatController *)self conversation];
      [(CKCoreChatController *)self setConversation:v3];

      objc_super v4 = [(CKCoreChatController *)self collectionView];
      double v5 = (void *)MEMORY[0x1E4F42FF0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __45__CKCoreChatController_viewDidLayoutSubviews__block_invoke;
      v7[3] = &unk_1E5620C40;
      id v8 = v4;
      id v6 = v4;
      [v5 performWithoutAnimation:v7];
    }
  }
}

void __45__CKCoreChatController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id v2 = +[CKScrollViewAnimationProperties unanimated];
  [*(id *)(a1 + 32) enforceTranscriptScrollIntentWithAnimationProperties:v2];
}

- (BOOL)_controllerEligibleForSetConversation
{
  return 1;
}

- (void)parentControllerDidBecomeActive
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "MarkAsRead - parentControllerDidBecomeActive", v4, 2u);
    }
  }
  [(CKCoreChatController *)self _markAsReadIfNecessary];
}

- (void)systemApplicationWillEnterForeground
{
  v4.receiver = self;
  v4.super_class = (Class)CKCoreChatController;
  [(CKViewController *)&v4 systemApplicationWillEnterForeground];
  BOOL v3 = [(CKCoreChatController *)self collectionViewController];
  [v3 systemApplicationWillEnterForeground];
}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKCoreChatController;
  -[CKViewController parentControllerDidResume:animating:](&v8, sel_parentControllerDidResume_animating_);
  BOOL v7 = [(CKCoreChatController *)self collectionViewController];
  [v7 parentControllerDidResume:v5 animating:v4];

  [(CKCoreChatController *)self _performResume];
}

- (void)_performResume
{
  [(CKCoreChatController *)self _registerSendProgressDelegate];
  [(CKCoreChatController *)self _markAsReadIfNecessary];
  BOOL v3 = [(CKCoreChatController *)self collectionViewController];
  [v3 prepareForResume];

  [(CKCoreChatController *)self refreshServiceForSending];
}

- (void)prepareForSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)CKCoreChatController;
  [(CKViewController *)&v3 prepareForSuspend];
  [(CKCoreChatController *)self _deregisterSendProgressDelegate];
}

+ (Class)transcriptControllerClass
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  objc_super v3 = [v2 transcriptCollectionViewControllerClass];

  return (Class)v3;
}

- (CKTranscriptCollectionView)collectionView
{
  id v2 = [(CKCoreChatController *)self collectionViewController];
  objc_super v3 = [v2 collectionView];

  return (CKTranscriptCollectionView *)v3;
}

- (BOOL)shouldDismissAfterSend
{
  return !CKIsRunningInMessages() && CKIsRunningInMessagesTranscriptExtension() == 0;
}

- (BOOL)shouldDisplayTextEntry
{
  objc_super v3 = [(CKCoreChatController *)self conversation];
  if (v3)
  {
    BOOL v4 = [(CKCoreChatController *)self conversation];
    char v5 = [v4 hasReplyEnabled];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (IMChat)chat
{
  id v2 = [(CKCoreChatController *)self conversation];
  objc_super v3 = [v2 chat];

  return (IMChat *)v3;
}

- (double)balloonMaxWidth
{
  return 0.0;
}

- (double)gradientBottomPlaceholderHeight
{
  return 0.0;
}

- (id)_handleIDsForCurrentConversation
{
  id v2 = [(CKCoreChatController *)self conversation];
  objc_super v3 = [v2 recipients];
  BOOL v4 = objc_msgSend(v3, "__imArrayByApplyingBlock:", &__block_literal_global_216_0);

  return v4;
}

id __56__CKCoreChatController__handleIDsForCurrentConversation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 defaultIMHandle];
  objc_super v3 = [v2 ID];

  return v3;
}

- (BOOL)_conversationHasReplyEnabled
{
  objc_super v3 = [(CKCoreChatController *)self conversation];
  if (v3)
  {
    BOOL v4 = [(CKCoreChatController *)self conversation];
    char v5 = [v4 hasReplyEnabled];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_shouldAllowReply
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL v4 = [(CKCoreChatController *)self _shouldAllowReplyFromLockScreen];
      char v5 = [(CKCoreChatController *)self conversation];
      v9[0] = 67109376;
      v9[1] = v4;
      __int16 v10 = 1024;
      int v11 = [v5 hasLeftGroupChat];
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "allow reply: %d has left: %d", (uint8_t *)v9, 0xEu);
    }
  }
  if (![(CKCoreChatController *)self _shouldAllowReplyFromLockScreen]) {
    return 0;
  }
  id v6 = [(CKCoreChatController *)self conversation];
  BOOL v7 = ([v6 hasLeftGroupChat] & 1) == 0
    && [(CKCoreChatController *)self _conversationHasReplyEnabled];

  return v7;
}

- (BOOL)_shouldAllowReplyFromLockScreen
{
  CFPreferencesSynchronize(@"com.apple.mobilephone", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"LockScreenMessaging", @"com.apple.mobilephone", &keyExistsAndHasValidFormat);
  int v4 = keyExistsAndHasValidFormat;
  char v5 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  int v6 = [v5 isUnderFirstDataProtectionLock];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Under first unlock. Not allowing lock screen messaging", v9, 2u);
      }
    }
    return ![(CKCoreChatController *)self _deviceIsPasscodeLocked];
  }
  BOOL result = 1;
  if (v4 && !AppBooleanValue) {
    return ![(CKCoreChatController *)self _deviceIsPasscodeLocked];
  }
  return result;
}

- (BOOL)conversationAllowedByScreenTime
{
  if (![MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]) {
    return 1;
  }
  objc_super v3 = [(CKCoreChatController *)self conversation];
  int v4 = [v3 chat];
  char v5 = [v4 allowedToShowConversationSync];

  return v5;
}

- (BOOL)shouldUseInitialViewSize
{
  int32x2_t v2 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x3EE4F8B580000000uLL), vabdq_f64((float64x2_t)self->_initialViewSize, *MEMORY[0x1E4F1DB30]))));
  return (v2.i8[0] | v2.i8[4]) & 1;
}

- (CGRect)_initialFrameForCollectionView
{
  if ([(CKCoreChatController *)self shouldUseInitialViewSize])
  {
    CGFloat width = self->_initialViewSize.width;
    CGFloat height = self->_initialViewSize.height;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    BOOL v7 = [(CKCoreChatController *)self view];
    [v7 bounds];
    double v5 = v8;
    double v6 = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = v5;
  double v13 = v6;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_initialFrameForGradientReferenceView
{
  if ([(CKCoreChatController *)self shouldUseInitialViewSize])
  {
    CGFloat width = self->_initialViewSize.width;
    CGFloat height = self->_initialViewSize.height;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 bounds];
    double v6 = v8;
    double v5 = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = v6;
  double v13 = v5;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setConversation:(id)a3
{
}

- (void)setConversation:(id)a3 forceReload:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (CKConversation *)a3;
  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(rect.origin.y) = 138412290;
      *(void *)((char *)&rect.origin.y + 4) = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "setting conversation: %@", (uint8_t *)&rect.origin.y, 0xCu);
    }
  }
  p_conversation = (id *)&self->_conversation;
  if (self->_conversation != v7)
  {
    if (IMOSLoggingEnabled())
    {
      double v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = *p_conversation;
        LODWORD(rect.origin.y) = 138412290;
        *(void *)((char *)&rect.origin.y + 4) = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "old conversation becoming inactive %@", (uint8_t *)&rect.origin.y, 0xCu);
      }
    }
    objc_storeStrong((id *)&self->_conversation, a3);
    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = *p_conversation;
        LODWORD(rect.origin.y) = 138412290;
        *(void *)((char *)&rect.origin.y + 4) = v13;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "new conversation becoming active %@", (uint8_t *)&rect.origin.y, 0xCu);
      }
    }
    [*p_conversation didBecomeActive];
    double v14 = [*p_conversation acquireHandleStatusObservationAssertion];
    [(CKCoreChatController *)self setHandleStatusAssertion:v14];

    [(CKCoreChatController *)self _deregisterSendProgressDelegate];
    [(CKCoreChatController *)self refreshServiceForSending];
  }
  char v15 = [(CKCoreChatController *)self isViewLoaded];
  int v16 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v16)
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LODWORD(rect.origin.y) = 136315138;
        *(void *)((char *)&rect.origin.y + 4) = "-[CKCoreChatController setConversation:forceReload:]";
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Initial layout is complete, proceeding with %s", (uint8_t *)&rect.origin.y, 0xCu);
      }
    }
    if (v7)
    {
      long long v18 = [(CKConversation *)v7 chat];
      if (v18)
      {
        BOOL v19 = [(CKCoreChatController *)self conversationAllowedByScreenTime];

        int v20 = [(CKCoreChatController *)self satelliteUnavailableLabel];
        [v20 removeFromSuperview];

        [(CKCoreChatController *)self setSatelliteUnavailableLabel:0];
        if (v19)
        {
          int v21 = [(CKCoreChatController *)self collectionViewController];
          id v22 = [v21 conversation];
          id v23 = [(CKCoreChatController *)self conversation];
          if (v22 != v23) {
            BOOL v4 = 1;
          }

          if (v4)
          {
            [(CKCoreChatController *)self _removeExistingCollectionViewController];
            [(CKCoreChatController *)self calculateTranscriptMarginInsets];
            double v25 = v24;
            double v27 = v26;
            double v29 = v28;
            double v31 = v30;
            [(CKCoreChatController *)self balloonMaxWidth];
            double v33 = v32;
            [(CKCoreChatController *)self _initialFrameForCollectionView];
            rect.origin.x = v34;
            double v36 = v35;
            double v38 = v37;
            double v40 = v39;
            if (IMOSLoggingEnabled())
            {
              BOOL v41 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                v62.origin.x = rect.origin.x;
                v62.origin.y = v36;
                v62.size.CGFloat width = v38;
                v62.size.CGFloat height = v40;
                __int16 v42 = NSStringFromCGRect(v62);
                LODWORD(rect.origin.y) = 138412290;
                *(void *)((char *)&rect.origin.y + 4) = v42;
                _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "Collection view's initialFrame is: %@", (uint8_t *)&rect.origin.y, 0xCu);
              }
            }
            id v43 = objc_alloc((Class)[(id)objc_opt_class() transcriptControllerClass]);
            unint64_t v44 = [(CKCoreChatController *)self conversation];
            uint64_t v45 = objc_msgSend(v43, "initWithConversation:delegate:balloonMaxWidth:marginInsets:collectionViewSize:", v44, self, v33, v25, v27, v29, v31, v38, v40);

            [(CKCoreChatController *)self setCollectionViewController:v45];
            objc_msgSend(v45, "setTransitionedFromComposing:", -[CKCoreChatController transitionedFromComposing](self, "transitionedFromComposing"));
            [v45 setDelegate:self];
            objc_msgSend(v45, "__setCurrentTestName:", __CurrentTestName);
            v46 = [(CKCoreChatController *)self gradientReferenceView];
            [v45 setGradientReferenceView:v46];

            [(CKCoreChatController *)self addChildViewController:v45];
            unint64_t v47 = [v45 collectionView];
            objc_msgSend(v47, "setFrame:", rect.origin.x, v36, v38, v40);
            [v47 setAutoresizingMask:18];
            __int16 v48 = [(CKCoreChatController *)self delegate];
            [v48 initialSafeAreaInsetsForChatController:self];
            objc_msgSend(v47, "setInitialSafeAreaInsets:");

            v49 = [(CKCoreChatController *)self view];
            uint64_t v50 = [(CKCoreChatController *)self viewToInsertTranscriptCollectionViewBelow];
            if (v50) {
              [v49 insertSubview:v47 belowSubview:v50];
            }
            else {
              [v49 addSubview:v47];
            }
            [(CKCoreChatController *)self applyInitialContextToCollectionViewIfNeeded];
            [v45 reloadData];
            v53 = [(CKCoreChatController *)self gradientReferenceView];
            [v47 contentInset];
            -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:");
            objc_msgSend(v53, "setGradientFrame:");

            v54 = [v45 collectionView];
            v55 = [v54 collectionViewLayout];
            [v55 prepareLayout];

            [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"ChangeConversation"];
            [v45 didMoveToParentViewController:self];
            [(CKCoreChatController *)self _registerSendProgressDelegate];
            [(CKCoreChatController *)self _updateTitleAnimated:0];
            [(CKCoreChatController *)self _updateNavigationButtons];
            [(CKCoreChatController *)self registerNotificationsForConversation:v7];
            -[CKCoreChatController setInitialViewSize:](self, "setInitialViewSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
          }
          goto LABEL_47;
        }
      }
      else
      {
        v52 = [(CKCoreChatController *)self satelliteUnavailableLabel];
        [v52 removeFromSuperview];

        [(CKCoreChatController *)self setSatelliteUnavailableLabel:0];
      }
      if (![(CKConversation *)v7 isPending])
      {
LABEL_47:
        [(CKCoreChatController *)self _setConversationDeferredSetup];
        if ([(CKCoreChatController *)self needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet])
        {
          [(CKCoreChatController *)self setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:0];
          [(CKCoreChatController *)self endPinningInputViewsForReason:@"SwitchingActiveConversations"];
        }
        goto LABEL_49;
      }
    }
    else
    {
      v56 = [(CKCoreChatController *)self satelliteUnavailableLabel];
      [v56 removeFromSuperview];

      [(CKCoreChatController *)self setSatelliteUnavailableLabel:0];
      if (![0 isPending])
      {
        v59 = IMLogHandleForCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          -[CKCoreChatController setConversation:forceReload:]();
        }

        goto LABEL_47;
      }
    }
    [(CKCoreChatController *)self _removeExistingCollectionViewController];
    v57 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v58 = [v57 isCarrierPigeonEnabled];

    if (v58) {
      [(CKCoreChatController *)self _displaySatelliteStatusItemIfNeeded];
    }
    goto LABEL_47;
  }
  if (v16)
  {
    v51 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      LODWORD(rect.origin.y) = 136315138;
      *(void *)((char *)&rect.origin.y + 4) = "-[CKCoreChatController setConversation:forceReload:]";
      _os_log_impl(&dword_18EF18000, v51, OS_LOG_TYPE_INFO, "View is not loaded, bailing from %s", (uint8_t *)&rect.origin.y, 0xCu);
    }
  }
LABEL_49:
}

- (void)_displaySatelliteStatusItemIfNeeded
{
  objc_super v3 = [(CKCoreChatController *)self conversation];
  BOOL v4 = [v3 handles];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    int v7 = 0;
  }
  else
  {
    double v6 = [MEMORY[0x1E4F6BC48] sharedInstance];
    int v7 = [v6 isSatelliteConnectionActive];
  }
  double v8 = [MEMORY[0x1E4F6BC48] sharedInstance];
  if ([v8 isSatelliteConnectionActive])
  {
    double v9 = [(CKCoreChatController *)self conversation];
    double v10 = [v9 recipients];
    if ([v10 count])
    {
      id v11 = [(CKCoreChatController *)self conversation];
      int v12 = [v11 isSatelliteSendingService] ^ 1;
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  if ((v7 | v12) == 1)
  {
    id v13 = [(CKCoreChatController *)self satelliteUnavailableLabel];

    if (!v13)
    {
      [(CKCoreChatController *)self _initialFrameForCollectionView];
      double v45 = v14;
      double v16 = v15;
      double v18 = v17;
      v46 = objc_alloc_init(CKTranscriptLabelCell);
      BOOL v19 = [(CKCoreChatController *)self conversation];
      int v20 = [v19 sendingService];
      int v21 = [MEMORY[0x1E4F6BDC0] iMessageService];
      if (v20 == v21)
      {
        BOOL v25 = 1;
      }
      else
      {
        id v22 = [(CKCoreChatController *)self conversation];
        id v23 = [v22 sendingService];
        double v24 = [MEMORY[0x1E4F6BDC0] iMessageLiteService];
        BOOL v25 = v23 == v24;
      }
      id v26 = +[CKUnavailableSatelliteForServiceChatItem newComposeTranscriptTextForiMessage:v25 isGroupChat:v5 > 1];
      [(CKTranscriptLabelCell *)v46 setAttributedText:v26];
      [(CKCoreChatController *)self calculateTranscriptMarginInsets];
      double v28 = v27;
      double v29 = v18 + v27 * -2.0;
      double v30 = +[CKUIBehavior sharedBehaviors];
      objc_msgSend(v26, "boundingRectWithSize:options:context:", 1, 0, v29, 1.79769313e308);
      double v32 = v31;
      [v30 smallTranscriptSpace];
      double v34 = v33;
      [v30 transcriptBoldTextAlignmentInsets];
      double v36 = v35;
      double v38 = v37;
      double v39 = [(CKCoreChatController *)self view];
      [v39 safeAreaInsets];
      double v41 = v40;
      [(CKScrollViewController *)self topInsetPadding];
      double v43 = v41 + v42;

      -[CKTranscriptLabelCell setFrame:](v46, "setFrame:", v45 + v28, v16 + v43, v29, v32 - v36 + v34 + v32 - v38);
      [(CKCoreChatController *)self setSatelliteUnavailableLabel:v46];
      unint64_t v44 = [(CKCoreChatController *)self view];
      [v44 addSubview:v46];
    }
  }
}

- (UIEdgeInsets)calculateTranscriptMarginInsets
{
  objc_super v3 = +[CKUIBehavior sharedBehaviors];
  if ([v3 forceMinTranscriptMarginInsets])
  {
    BOOL v4 = +[CKUIBehavior sharedBehaviors];
    [v4 minTranscriptMarginInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [(CKCoreChatController *)self systemMinimumLayoutMargins];
    double v6 = v13;
    double v12 = v14;
    double v10 = v15;
    double v17 = v16;
    BOOL v4 = [(CKCoreChatController *)self view];
    uint64_t v18 = [v4 effectiveUserInterfaceLayoutDirection];
    if (v18) {
      double v8 = v17;
    }
    else {
      double v8 = v12;
    }
    if (!v18) {
      double v12 = v17;
    }
  }

  if (*(double *)(MEMORY[0x1E4F437F8] + 8) == v8
    && *MEMORY[0x1E4F437F8] == v6
    && *(double *)(MEMORY[0x1E4F437F8] + 24) == v12
    && *(double *)(MEMORY[0x1E4F437F8] + 16) == v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v23 = objc_loadWeakRetained((id *)&self->_delegate);
      [v23 initialSystemMinimumLayoutMarginsForChatController:self];
      double v6 = v24;
      double v8 = v25;
      double v10 = v26;
      double v12 = v27;
    }
  }
  double v28 = v6;
  double v29 = v8;
  double v30 = v10;
  double v31 = v12;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (id)viewToInsertTranscriptCollectionViewBelow
{
  if (![(CKCoreChatController *)self isShowingLockoutView]
    || ([(CKCoreChatController *)self lockoutViewController],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        [v3 view],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    BOOL v4 = +[CKUIBehavior sharedBehaviors];
    if (![v4 useMacToolbar]) {
      goto LABEL_7;
    }
    BOOL v5 = [(CKCoreChatController *)self showingInStandAloneWindow];

    if (!v5)
    {
LABEL_8:
      BOOL v4 = 0;
      goto LABEL_9;
    }
    double v6 = [(CKCoreChatController *)self macToolbarController];
    BOOL v4 = [v6 view];

    if (!v4
      || ([(CKCoreChatController *)self view],
          double v7 = objc_claimAutoreleasedReturnValue(),
          [v7 subviews],
          double v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 containsObject:v4],
          v8,
          v7,
          (v9 & 1) == 0))
    {
LABEL_7:

      goto LABEL_8;
    }
  }
LABEL_9:

  return v4;
}

- (UIEdgeInsets)calculateTranscriptSafeAreaInsets
{
  int32x2_t v2 = [(CKCoreChatController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_removeExistingCollectionViewController
{
  double v3 = [(CKCoreChatController *)self collectionViewController];

  if (v3)
  {
    id v5 = [(CKCoreChatController *)self collectionViewController];
    [v5 willMoveToParentViewController:0];
    double v4 = [v5 collectionView];
    [v4 removeFromSuperview];

    [v5 removeFromParentViewController];
  }
}

- (void)setCollectionViewController:(id)a3
{
  id v5 = (CKCoreTranscriptControllerProtocol *)a3;
  if (self->_collectionViewController != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_collectionViewController, a3);
    id v5 = v6;
  }
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5
{
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [(CKCoreChatController *)self collectionViewController];
    double v7 = [v6 transcriptIdentifier];
    double v8 = [v10 contentViewControllerForContext:v7];

    if (v8)
    {
      double v9 = [(CKCoreChatController *)self navigationController];
      [v9 pushViewController:v8 animated:1];
    }
  }
}

- (void)_handleTapEventForBalloonView:(id)a3 atIndexPath:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v9 = [(CKCoreChatController *)self collectionViewController];
  id v10 = v9;
  if (isKindOfClass)
  {
    double v11 = [v9 associatedChatItems];

    unint64_t v12 = [v7 item];
    if (v12 < [v11 count])
    {
      double v13 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "item"));
      double v14 = [(CKCoreChatController *)self collectionViewController];
      double v15 = [v14 chatItems];
      double v16 = [v13 associatedChatItemGUID];
      uint64_t v17 = [v13 associatedMessageRange];
      uint64_t v19 = objc_msgSend(v15, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v16, v17, v18);

      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v20 = [(CKCoreChatController *)self collectionViewController];
        int v21 = [v20 chatItems];
        id v22 = [v21 objectAtIndex:v19];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = [MEMORY[0x1E4F28D58] indexPathForItem:v19 inSection:0];
          [(CKCoreChatController *)self showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:v23];
        }
      }
LABEL_28:

      goto LABEL_29;
    }
    if (IMOSLoggingEnabled())
    {
      double v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v28 = 134218240;
        uint64_t v29 = [v7 item];
        __int16 v30 = 2048;
        uint64_t v31 = [v11 count];
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Attempted to present ack menu for associated chat item out of idx range. idx %lu count %lu", (uint8_t *)&v28, 0x16u);
      }
LABEL_18:
    }
  }
  else
  {
    double v11 = [v9 chatItems];

    unint64_t v24 = [v7 item];
    if (v24 >= [v11 count])
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_29;
      }
      double v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v28 = 134218240;
        uint64_t v29 = [v7 item];
        __int16 v30 = 2048;
        uint64_t v31 = [v11 count];
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Attempted to present ack menu for chat item out of idx range. idx %lu count %lu", (uint8_t *)&v28, 0x16u);
      }
      goto LABEL_18;
    }
    double v13 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "item"));
    if (([v13 isCommSafetySensitive] & 1) == 0)
    {
      if (![v13 isEditedMessageHistory])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v13;
          if ([v27 isReplyContextPreview]) {
            [(CKCoreChatController *)self showInlineReplyControllerForChatItem:v27 presentKeyboard:0];
          }
          else {
            [(CKCoreChatController *)self showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:v7];
          }
        }
        goto LABEL_28;
      }
      if (IMOSLoggingEnabled())
      {
        double v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Ignoring tap action for edited message history balloon", (uint8_t *)&v28, 2u);
        }
      }
    }
  }
LABEL_29:
}

- (void)_handleShowInlineReplyForItemWithIndexPath:(id)a3 replyTransitionProperties:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(CKCoreChatController *)self collectionViewController];
  double v8 = [v7 chatItems];

  unint64_t v9 = [v13 item];
  if (v9 < [v8 count])
  {
    id v10 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v13, "item"));
    double v11 = +[CKUIBehavior sharedBehaviors];
    uint64_t v12 = [v11 replyShouldShowKeyboard];

    [(CKCoreChatController *)self showInlineReplyControllerForChatItem:v10 presentKeyboard:v12 replyTransitionProperties:v6];
  }
}

- (void)viewDidLayoutSubviewsForTranscriptCollectionViewController:(id)a3
{
  double v4 = [(CKCoreChatController *)self fullScreenBalloonViewController];

  if (v4)
  {
    id v5 = [(CKCoreChatController *)self fullScreenBalloonViewController];
    [v5 updateBalloonViewFrame];
  }
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 doubleTappedItemAtIndexPath:(id)a5
{
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 longPressedForItemWithIndexPath:(id)a5
{
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 selectedItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(CKCoreChatController *)self collectionViewController];
  [v7 highlightItemAtIndexPathWhenDisplayed:v6 autoDismiss:0];
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 showInlineReplyForItemWithIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[CKInlineReplyTransitionProperties defaultProperties];
  [(CKCoreChatController *)self transcriptCollectionViewController:v10 balloonView:v9 showInlineReplyForItemWithIndexPath:v8 withReplyTransitionProperties:v11];
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 showInlineReplyForItemWithIndexPath:(id)a5 withReplyTransitionProperties:(id)a6
{
}

- (int64_t)transcriptCollectionViewControllerWantsCurrentDesiredIntent:(id)a3
{
  return 0;
}

- (void)transcriptCollectionViewControllerDidInset:(id)a3
{
  id v4 = a3;
  id v6 = [(CKCoreChatController *)self gradientReferenceView];
  id v5 = [v4 collectionView];

  [v5 contentInset];
  -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:");
  objc_msgSend(v6, "setGradientFrame:");
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 shouldSelectChatItem:(id)a5
{
  return 0;
}

- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3
{
  return 0;
}

- (void)transcriptCollectionViewControllerDidSetChatItems:(id)a3
{
  if ([(CKViewController *)self deferredAppeared])
  {
    [(CKCoreChatController *)self _inviteToViewStatusesIfNeeded];
  }
}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  id v14 = [(CKCoreChatController *)self gradientReferenceView];
  id v5 = [(CKCoreChatController *)self collectionView];
  [v5 contentInset];
  -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [v14 gradientFrame];
  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.CGFloat width = v11;
  v17.size.CGFloat height = v13;
  if (!CGRectEqualToRect(v16, v17))
  {
    objc_msgSend(v14, "setGradientFrame:", v7, v9, v11, v13);
    [v14 layoutGradientViewsIfNeeded];
  }
}

- (BOOL)transcriptCollectionViewControllerShouldShouldScrollToTopForStatusBarTap:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldScrollToBottomForLocalSentMessage:(id)a3
{
  return 1;
}

- (void)transcriptCollectionViewController:(id)a3 shouldScrollToHighlightedMessage:(id)a4
{
}

- (void)transcriptCollectionViewControllerReportSpamButtonTapped:(id)a3
{
  id v5 = [(CKCoreChatController *)self delegate];
  id v4 = [(CKCoreChatController *)self conversation];
  [v5 chatController:self didReportSpamForConversation:v4];
}

- (void)transcriptCollectionViewControllerWillDisplayLastBalloon:(id)a3
{
  [(CKCoreChatController *)self setIgnoreLastBalloonVisibleInMarkAsReadCheck:1];
  [(CKCoreChatController *)self _markAsReadIfNecessary];

  [(CKCoreChatController *)self setIgnoreLastBalloonVisibleInMarkAsReadCheck:0];
}

- (void)transcriptCollectionViewControllerDidChangeAssociatedChatItem:(id)a3 chatItemDiff:(id)a4
{
  id v5 = objc_msgSend(a4, "inserted", a3);
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(CKCoreChatController *)self _markAsReadIfNecessary];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKCoreChatController;
  id v4 = a3;
  [(CKCoreChatController *)&v5 traitCollectionDidChange:v4];
  -[CKCoreChatController invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:](self, "invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:", v4, v5.receiver, v5.super_class);
}

- (void)invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKCoreChatController *)self traitCollection];
  int v6 = objc_msgSend(v5, "ck_chatItemLayoutNeedsInvalidationForPreviousTraitCollection:", v4);

  if (v6)
  {
    id v18 = [(CKCoreChatController *)self collectionViewController];
    [v18 balloonMaxWidth];
    double v8 = v7;
    [v18 marginInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGRect v17 = [(CKCoreChatController *)self traitCollection];
    objc_msgSend(v18, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v17, v8, v10, v12, v14, v16);
  }
}

- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4
{
  return 1.0;
}

- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldSetupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldLayoutFullscreenEffects:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldCleanupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (id)transcriptCollectionViewControllerAdditionalFullscreenEffectViews:(id)a3
{
  return 0;
}

- (id)transcriptCollectionViewControllerOuterEffectPresentingView:(id)a3
{
  double v3 = [a3 view];
  id v4 = [v3 window];

  return v4;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitPayload:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitSticker:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (void)transcriptCollectionViewController:(id)a3 viewedCommSafetyItemWithIndexPath:(id)a4
{
  *(void *)&v40[5] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v35 = a4;
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = [(CKCoreChatController *)self conversation];
      double v8 = [v7 chat];
      *(_DWORD *)buf = 138412290;
      *(void *)double v40 = v8;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "User signified view sensitive photo for chat %@", buf, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend(v35, "item", v33);
  if (v9 < 0)
  {
    unint64_t v15 = 0;
  }
  else
  {
    while (1)
    {
      double v10 = [(CKCoreChatController *)self collectionViewController];
      double v11 = [v10 chatItems];
      double v12 = [v11 objectAtIndex:v9];

      double v13 = [v12 IMChatItem];
      if ([v13 supportsCommunicationSafety])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)double v40 = v13;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "This chat item is not IMMessagePartChatItem: %@", buf, 0xCu);
        }
      }
      if (v9-- <= 0)
      {
        unint64_t v15 = 0;
        uint64_t v9 = -1;
        goto LABEL_16;
      }
    }
    double v16 = [v13 messageItem];
    CGRect v17 = [v16 message];

    id v18 = [v17 fileTransferGUIDs];
    unint64_t v15 = [v18 count];
  }
LABEL_16:
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((v9 & 0x8000000000000000) == 0 && v15)
  {
    unint64_t v19 = 0;
    do
    {
      int v20 = [(CKCoreChatController *)self collectionViewController];
      int v21 = [v20 chatItems];
      id v22 = [v21 objectAtIndex:v9];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
        unint64_t v24 = [MEMORY[0x1E4F6BCC8] sharedInstance];
        double v25 = [v23 transferGUID];
        double v26 = [v24 transferForGUID:v25];

        if ([v26 commSafetySensitive] == 1)
        {
          id v27 = [v23 IMChatItem];
          [v36 addObject:v27];

          int v28 = [v23 message];
          uint64_t v29 = [v28 guid];
          [(CKCoreChatController *)self _registerCommSafetyReceivedEventForTransfer:v26 messageGUID:v29];
        }
        ++v19;
      }

      BOOL v30 = v9-- != 0;
    }
    while (v30 && v19 < v15);
  }
  if ([v36 count])
  {
    uint64_t v31 = [(CKCoreChatController *)self collectionViewController];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __93__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyItemWithIndexPath___block_invoke;
    v37[3] = &unk_1E5620AF8;
    v37[4] = self;
    id v38 = v36;
    [v31 updateTranscript:v37 animated:1 completion:0];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v40[0] = v15;
      LOWORD(v40[1]) = 1024;
      *(_DWORD *)((char *)&v40[1] + 2) = v9;
      _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Did not find chatItems to refresh. totalTransferCount: %d, indexForSensitiveAttachment: %d", buf, 0xEu);
    }
  }
}

void __93__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyItemWithIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) chat];
  [v2 updateCommSafety:2 forChatItems:*(void *)(a1 + 40)];
}

- (void)transcriptCollectionViewController:(id)a3 viewedCommSafetyAssociatedItemsWithIndexPath:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v29 = a4;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [(CKCoreChatController *)self conversation];
      double v7 = [v6 chat];
      *(_DWORD *)buf = 138412290;
      double v43 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "User signified view multiple sensitive associated items for chat %@", buf, 0xCu);
    }
  }
  uint64_t v31 = objc_msgSend(v29, "item", v27);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v31 < 0)
  {
    BOOL v30 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v9 = [(CKCoreChatController *)self collectionViewController];
      double v10 = [v9 chatItems];
      uint64_t v32 = [v10 objectAtIndex:v31];

      BOOL v30 = [v32 IMChatItem];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (IMOSLoggingEnabled())
      {
        double v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          double v43 = v30;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "This chat item is not IMMessagePartChatItem: %@", buf, 0xCu);
        }
      }
      if (v31-- <= 0)
      {
        BOOL v30 = 0;
        LODWORD(v31) = -1;
        goto LABEL_30;
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    double v12 = [v32 visibleAssociatedMessageChatItems];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v12);
          }
          double v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v16 isCommSafetySensitiveNotViewable])
          {
            CGRect v17 = [v16 commSafetyTransferGUID];
            if (v17)
            {
              id v18 = [MEMORY[0x1E4F6BCC8] sharedInstance];
              unint64_t v19 = [v16 commSafetyTransferGUID];
              int v20 = [v18 transferForGUID:v19];
            }
            else
            {
              int v20 = 0;
            }

            int v21 = [v16 IMChatItem];
            [v8 addObject:v21];

            if (v20)
            {
              id v22 = [v16 commSafetyMessageGUID];
              BOOL v23 = v22 == 0;

              if (!v23)
              {
                unint64_t v24 = [v16 commSafetyMessageGUID];
                [(CKCoreChatController *)self _registerCommSafetyReceivedEventForTransfer:v20 messageGUID:v24];
              }
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v13);
    }
  }
LABEL_30:
  if ([v8 count] || v30)
  {
    double v26 = [(CKCoreChatController *)self collectionViewController];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __104__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyAssociatedItemsWithIndexPath___block_invoke;
    v34[3] = &unk_1E5620AA8;
    v34[4] = self;
    id v35 = v8;
    id v36 = v30;
    [v26 updateTranscript:v34 animated:1 completion:0];
  }
  else if (IMOSLoggingEnabled())
  {
    double v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v31;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Did not find associated chatItems to refresh. indexForSensitiveAttachment: %d", buf, 8u);
    }
  }
}

void __104__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyAssociatedItemsWithIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) chat];
  [v2 updateCommSafety:2 forChatItems:*(void *)(a1 + 40) parentChatItem:*(void *)(a1 + 48)];
}

- (void)_registerCommSafetyReceivedEventForTransfer:(id)a3 messageGUID:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 localURL];
  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F6BC80]);
    double v11 = [v6 guid];
    double v12 = (void *)[v10 initWithIdentifier:v11 imageData:v9];

    uint64_t v13 = (void *)MEMORY[0x1E4F6BC78];
    uint64_t v14 = [(CKCoreChatController *)self chat];
    v16[0] = v12;
    unint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v13 registerEvent:1 eventType:0 messageGUID:v7 chat:v14 forImages:v15];
  }
}

- (void)_messageSomeonePressed
{
  id v2 = [MEMORY[0x1E4F6BC88] sharedInstance];
  [v2 getOpenChatURLWith:&__block_literal_global_251_0];
}

void __46__CKCoreChatController__messageSomeonePressed__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F42738];
  id v3 = a2;
  id v4 = [v2 sharedApplication];
  [v4 openURL:v3 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)sendStickerTapback:(id)a3 mediaObject:(id)a4 parentMessagePartChatItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
      double v11 = +[CKStickerTapbackCommSafetySendContext contextWithStickerTapback:v8 mediaObject:v9 parentMessagePartChatItem:v10];
      double v12 = [v9 transfer];
      uint64_t v13 = [v12 fileURL];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __81__CKCoreChatController_sendStickerTapback_mediaObject_parentMessagePartChatItem___block_invoke;
      v14[3] = &unk_1E5625140;
      id v15 = v8;
      double v16 = self;
      id v17 = v10;
      [(CKCoreChatController *)self presentCommSafetyInterventionIfNecessaryForFileURL:v13 withSendContext:v11 completion:v14];
    }
    else
    {
      double v11 = IMLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CKCoreChatController sendStickerTapback:mediaObject:parentMessagePartChatItem:]();
      }
    }
  }
  else
  {
    double v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CKChatController(CKChatController_Stickers) sendSticker:withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:]();
    }
  }
}

void __81__CKCoreChatController_sendStickerTapback_mediaObject_parentMessagePartChatItem___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Sticker Tapback was sensitive, deferring send for intervention: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _dismissFullScreenBubbleViewControllerAnimated:1 withSendAnimation:0 completion:0];
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) chat];
    [v5 sendTapback:*(void *)(a1 + 32) forChatItem:*(void *)(a1 + 48)];
  }
}

- (CGRect)gradientFrameWithInsets:(UIEdgeInsets)a3
{
  double bottom = a3.bottom;
  [(CKCoreChatController *)self gradientBottomPlaceholderHeight];
  double v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
  unint64_t v8 = [v7 userInterfaceIdiom];

  id v9 = [(CKCoreChatController *)self view];
  id v10 = v9;
  if (v8 > 1)
  {
    [v9 frame];
    double v13 = v14;
  }
  else
  {
    [v9 bounds];
    double v13 = fmax(v11, v12);
  }

  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = [(CKCoreChatController *)self view];
  [v16 bounds];
  double v18 = v17;

  double v19 = v15 + 0.0;
  double v20 = v13 - (v6 + 0.0);
  int v21 = [(CKCoreChatController *)self collectionViewController];
  id v22 = [v21 collectionView];

  BOOL v23 = [(CKCoreChatController *)self view];
  [v23 frame];
  double v25 = v24 - (bottom + v20);

  double v26 = v20 - (bottom + -44.0);
  objc_msgSend(v22, "__ck_contentSize");
  double v28 = v26 - v27;
  if (v26 <= v27) {
    double v28 = 0.0;
  }
  double v29 = v25 - v28;

  double v30 = v19;
  double v31 = v29;
  double v32 = v18;
  double v33 = v20;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)transcriptCollectionViewController:(id)a3 requestDeleteJunkConversation:(id)a4
{
  id v5 = a4;
  id v6 = [(CKCoreChatController *)self delegate];
  [v6 chatController:self requestDeleteJunkConversation:v5];
}

- (void)transcriptCollectionViewController:(id)a3 requestRecoverJunkConversation:(id)a4
{
  id v5 = a4;
  id v6 = [(CKCoreChatController *)self delegate];
  [v6 chatController:self requestRecoverJunkConversation:v5];
}

- (void)transcriptCollectionViewController:(id)a3 didInsertChatItems:(id)a4 associatedChatItems:(id)a5
{
  id v6 = [(CKCoreChatController *)self insertItemsEmojiTapbacksCallBack];

  if (v6)
  {
    uint64_t v7 = [(CKCoreChatController *)self insertItemsEmojiTapbacksCallBack];
    v7[2]();

    [(CKCoreChatController *)self setInsertItemsEmojiTapbacksCallBack:0];
  }
}

- (void)transcriptCollectionViewController:(id)a3 didRemoveChatItems:(id)a4 associatedChatItems:(id)a5
{
  id v6 = [(CKCoreChatController *)self removeItemsEmojiTapbacksCallBack];

  if (v6)
  {
    uint64_t v7 = [(CKCoreChatController *)self removeItemsEmojiTapbacksCallBack];
    v7[2]();

    [(CKCoreChatController *)self setRemoveItemsEmojiTapbacksCallBack:0];
  }
}

- (void)_updateForNewPreferredService
{
}

- (void)refreshServiceForSending
{
  id v2 = [(CKCoreChatController *)self refreshServiceForSendingUpdater];
  [v2 setNeedsUpdate];
}

- (void)_refreshServiceForSending
{
  id v2 = [(CKCoreChatController *)self conversation];
  [v2 refreshServiceForSending];
}

- (void)_willSendComposition:(id)a3 inConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKCoreChatController *)self delegate];
  [v8 chatController:self willSendComposition:v7 inConversation:v6];
}

- (void)_didSendCompositionInConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKCoreChatController *)self delegate];
  [v5 chatController:self didSendCompositionInConversation:v4];
}

- (void)_inviteToViewStatusesIfNeeded
{
  id v3 = [(CKCoreChatController *)self chat];
  if (v3)
  {
    if (CKIsRunningInMessages())
    {
      if (CKIsRunningForDevelopmentOnSimulator())
      {
        if (IMOSLoggingEnabled())
        {
          id v4 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            __int16 v9 = 0;
            id v5 = "Not sharing focus status in simulator";
            id v6 = (uint8_t *)&v9;
LABEL_18:
            _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else if ([(id)*MEMORY[0x1E4F43630] isRunningTest])
      {
        if (IMOSLoggingEnabled())
        {
          id v4 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            __int16 v8 = 0;
            id v5 = "Not sharing focus status during PPT";
            id v6 = (uint8_t *)&v8;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
      else
      {
        if (![(CKCoreChatController *)self isInline])
        {
          [v3 autoInviteToViewAvailabilityIfNeeded];
          [v3 autoInviteToViewOffGridModeIfNeeded];
          goto LABEL_20;
        }
        if (IMOSLoggingEnabled())
        {
          id v4 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            __int16 v7 = 0;
            id v5 = "Not sharing focus status from inline reply transcript";
            id v6 = (uint8_t *)&v7;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        id v5 = "Not sharing focus status from non messages process";
        id v6 = (uint8_t *)&v10;
        goto LABEL_18;
      }
LABEL_19:
    }
  }
LABEL_20:
}

- (BOOL)isSafeToMarkAsRead
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKCoreChatController *)self view];
  id v4 = [v3 window];

  BOOL v5 = +[CKApplicationState isWindowForegroundActive:v4]|| CKIsRunningInMessagesNotificationExtension() != 0;
  BOOL v28 = v5;
  if ([(CKCoreChatController *)self ignoreLastBalloonVisibleInMarkAsReadCheck])
  {
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v6 isCatchUpEnabled])
  {

LABEL_7:
    LODWORD(v7) = 1;
    goto LABEL_23;
  }
  __int16 v8 = [(CKCoreChatController *)self chat];
  if ([v8 chatStyle] == 45)
  {
    int v9 = CKIsRunningInMessagesTranscriptExtension();

    if (!v9) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  __int16 v10 = [(CKCoreChatController *)self collectionView];
  double v11 = objc_msgSend(v10, "__ck_indexPathForLastItem");
  uint64_t v12 = [v11 row];

  [v10 visibleCells];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v13 countByEnumeratingWithState:&v29 objects:v43 count:16];
  if (v7)
  {
    uint64_t v14 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v13);
        }
        double v16 = [v10 indexPathForCell:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        BOOL v17 = [v16 row] == v12;

        if (v17)
        {
          LODWORD(v7) = 1;
          goto LABEL_22;
        }
      }
      uint64_t v7 = [v13 countByEnumeratingWithState:&v29 objects:v43 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_22:

LABEL_23:
  if ([(CKViewController *)self appearing] || [(CKViewController *)self appeared]) {
    BOOL v18 = v28 & v7;
  }
  else {
    BOOL v18 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    double v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      if (v18) {
        double v20 = @"YES";
      }
      else {
        double v20 = @"NO";
      }
      BOOL v21 = [(CKViewController *)self appearing];
      BOOL v22 = [(CKViewController *)self appeared];
      if (v21) {
        BOOL v23 = @"YES";
      }
      else {
        BOOL v23 = @"NO";
      }
      *(_DWORD *)buf = 138413314;
      if (v22) {
        double v24 = @"YES";
      }
      else {
        double v24 = @"NO";
      }
      double v34 = v20;
      __int16 v35 = 2112;
      if (v28) {
        double v25 = @"YES";
      }
      else {
        double v25 = @"NO";
      }
      id v36 = v23;
      if (v7) {
        double v26 = @"YES";
      }
      else {
        double v26 = @"NO";
      }
      __int16 v37 = 2112;
      long long v38 = v24;
      __int16 v39 = 2112;
      long long v40 = v25;
      __int16 v41 = 2112;
      double v42 = v26;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "MarkAsRead - isSafe %@ appearing %@ appeared %@ isActive %@ lastBalloonIsVisible %@", buf, 0x34u);
    }
  }
  return v18;
}

- (void)_markAsReadIfNecessary
{
  if ([(CKCoreChatController *)self isSafeToMarkAsRead])
  {
    id v3 = [(CKCoreChatController *)self conversation];
    [v3 markAllMessagesAsRead];

    id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v5 = [v4 isCarrierPigeonEnabled];

    if (v5)
    {
      [(CKCoreChatController *)self _startSatelliteFetchIfNecessary];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "MarkAsRead - Not safe to mark as read, bailing", v7, 2u);
    }
  }
}

- (void)_startSatelliteFetchIfNecessary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKCoreChatController *)self satelliteFetchTimer];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F6BC48] sharedInstance];
    int v5 = [v4 isSatelliteConnectionActive];

    if (v5)
    {
      id v6 = [(CKCoreChatController *)self conversation];
      uint64_t v7 = [v6 chat];
      uint64_t v8 = [v7 pendingIncomingSatelliteMessageCount];

      if (v8)
      {
        int v9 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
        __int16 v10 = [v9 objectForKey:@"satellite-fetch-delay-interval"];
        objc_opt_class();
        double v11 = 3.0;
        if (objc_opt_isKindOfClass())
        {
          [v10 doubleValue];
          double v11 = v12;
        }
        id location = 0;
        objc_initWeak(&location, self);
        id v13 = (void *)MEMORY[0x1E4F1CB00];
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        BOOL v18 = __55__CKCoreChatController__startSatelliteFetchIfNecessary__block_invoke;
        double v19 = &unk_1E5629740;
        objc_copyWeak(&v20, &location);
        uint64_t v14 = [v13 scheduledTimerWithTimeInterval:0 repeats:&v16 block:v11];
        -[CKCoreChatController setSatelliteFetchTimer:](self, "setSatelliteFetchTimer:", v14, v16, v17, v18, v19);

        if (IMOSLoggingEnabled())
        {
          double v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double v23 = v11;
            _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Queued satellite fetch with %f second delay", buf, 0xCu);
          }
        }
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __55__CKCoreChatController__startSatelliteFetchIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained conversation];
  [v1 fetchIncomingPendingMessagesOverSatellite];

  [WeakRetained setSatelliteFetchTimer:0];
}

- (void)_cancelSatelliteFetch
{
  id v3 = [(CKCoreChatController *)self satelliteFetchTimer];

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Canceling satellite fetch", v6, 2u);
      }
    }
    int v5 = [(CKCoreChatController *)self satelliteFetchTimer];
    [v5 invalidate];

    [(CKCoreChatController *)self setSatelliteFetchTimer:0];
  }
}

- (id)scrollView
{
  if (IMEnableModernTranscript())
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(CKCoreChatController *)self collectionViewController];
    id v3 = [v4 collectionView];
  }

  return v3;
}

- (void)contentInsetWillChange:(UIEdgeInsets)a3 withAnimationProperties:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  -[CKCoreChatController _updateGradientReferenceViewForContentInset:withAnimationProperties:](self, "_updateGradientReferenceViewForContentInset:withAnimationProperties:", v9, top, left, bottom, right);
  [(CKCoreChatController *)self _setTranscriptCustomScrollAnimationFromAnimationProperties:v9];
}

- (void)_updateGradientReferenceViewForContentInset:(UIEdgeInsets)a3 withAnimationProperties:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  __int16 v10 = [(CKCoreChatController *)self gradientReferenceView];
  -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:", top, left, bottom, right);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v10 gradientFrame];
  v27.origin.x = v12;
  v27.origin.y = v14;
  v27.size.CGFloat width = v16;
  v27.size.CGFloat height = v18;
  if (!CGRectEqualToRect(v26, v27))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__CKCoreChatController__updateGradientReferenceViewForContentInset_withAnimationProperties___block_invoke;
    aBlock[3] = &unk_1E5621968;
    id v21 = v10;
    CGFloat v22 = v12;
    CGFloat v23 = v14;
    CGFloat v24 = v16;
    CGFloat v25 = v18;
    double v19 = _Block_copy(aBlock);
    [v9 performAnimationBlock:v19];
  }
}

uint64_t __92__CKCoreChatController__updateGradientReferenceViewForContentInset_withAnimationProperties___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setGradientFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutGradientViewsIfNeeded];
}

- (void)_setTranscriptCustomScrollAnimationFromAnimationProperties:(id)a3
{
  id v6 = a3;
  if ([v6 animationType] == 1)
  {
    id v4 = [v6 caBasicAnimation];
  }
  else
  {
    id v4 = 0;
  }
  int v5 = [(CKCoreChatController *)self collectionView];
  [v5 setTranscriptCustomScrollAnimation:v4];
}

- (void)contentInsetDidChangeWithAnimationProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(CKCoreChatController *)self collectionView];
  [v5 enforceTranscriptScrollIntentWithAnimationProperties:v4];

  [v5 setTranscriptCustomScrollAnimation:0];
}

- (BOOL)shouldIgnoreKeyboardAnimationDuration
{
  return ![(CKCoreChatController *)self viewIsVisible];
}

- (void)keyboardWillHideViaGesture
{
  id v2 = [(CKCoreChatController *)self collectionViewController];
  id v3 = [v2 collectionView];

  id v4 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CKCoreChatController_keyboardWillHideViaGesture__block_invoke;
  v6[3] = &unk_1E5620C40;
  id v7 = v3;
  id v5 = v3;
  [v4 performWithoutAnimation:v6];
}

void __50__CKCoreChatController_keyboardWillHideViaGesture__block_invoke(uint64_t a1)
{
  id v2 = +[CKScrollViewAnimationProperties unanimated];
  [*(id *)(a1 + 32) enforceTranscriptScrollIntentWithAnimationProperties:v2];
}

- (void)setupScrollingForKeyboardInteraction
{
  id v3 = [(CKCoreChatController *)self collectionViewController];
  id v4 = [v3 collectionView];
  [v4 contentSize];
  double v6 = v5;

  id v7 = [(CKCoreChatController *)self collectionViewController];
  [v7 setScrollAnchor:v6];
}

- (void)_updateTitleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKCoreChatController *)self conversation];
  if ([v5 hasDisplayName]) {
    [v5 displayName];
  }
  else {
    objc_msgSend(v5, "displayNameForMediaObjects:subject:shouldListParticipants:", 0, 0, -[CKCoreChatController shouldListParticipantsInTitle](self, "shouldListParticipantsInTitle"));
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(CKCoreChatController *)self _setTitle:v7 animated:v3];
  double v6 = [(CKCoreChatController *)self navigationItem];
  [v6 setBackButtonTitle:v7];
}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (void)_registerSendProgressDelegate
{
  id v3 = [(CKConversation *)self->_conversation chat];
  [v3 setSendProgressDelegate:self];
}

- (void)_deregisterSendProgressDelegate
{
  id v3 = [(CKConversation *)self->_conversation chat];
  id v4 = [v3 sendProgressDelegate];

  if (v4 == self)
  {
    double v5 = [(CKConversation *)self->_conversation chat];
    [v5 setSendProgressDelegate:0];
  }
  [(UIProgressView *)self->_progressBar removeFromSuperview];
  [(CKCoreChatController *)self setProgressBar:0];
  self->_sendProgress = 0.0;
  self->_sendProgressSendCount = 0;
  self->_sendProgressTotalCount = 0;

  [(CKCoreChatController *)self _updateTitleAnimated:0];
}

- (void)chat:(id)a3 progressDidChange:(float)a4 sendingMessages:(id)a5 sendCount:(unint64_t)a6 totalCount:(unint64_t)a7 finished:(BOOL)a8
{
  BOOL v8 = a8;
  double v13 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3, a5);
  if ([v13 BOOLForKey:@"ShouldHideProgressBar"])
  {
    self->_sendProgressSendCount = a6;
    self->_sendProgressTotalCount = a7;
    if (self->_sendProgressSendCount != a6) {
      [(CKCoreChatController *)self _updateTitleAnimated:1];
    }
    if (v8)
    {
      self->_sendProgressSendCount = 0;
      self->_sendProgressTotalCount = 0;
      [(CKCoreChatController *)self _updateTitleAnimated:1];
    }
    id v14 = 0;
  }
  else
  {
    double v15 = a4;
    if (a4 <= 0.0)
    {
      id v14 = 0;
    }
    else
    {
      id v14 = [(CKCoreChatController *)self progressBar];
      CGFloat v16 = [(CKCoreChatController *)self conversation];
      uint64_t v17 = [v16 sendButtonColor];

      CGFloat v18 = +[CKUIBehavior sharedBehaviors];
      double v19 = [v18 theme];
      id v20 = [v19 sendButtonColorForColorType:v17];
      [v14 setTintColor:v20];

      id v21 = +[CKUIBehavior sharedBehaviors];
      CGFloat v22 = [v21 theme];
      CGFloat v23 = [v22 progressBarTrackTintColor];
      [v14 setTrackTintColor:v23];

      [v14 setAlpha:1.0];
    }
    double v24 = vabdd_f64(v15, self->_sendProgress) * 0.25;
    float v25 = v24;
    if (self->_sendProgressSendCount == a6 && self->_sendProgressTotalCount == a7)
    {
      *(float *)&double v24 = a4;
      [v14 setProgress:0 animated:v24];
      int v26 = 0;
    }
    else
    {
      *(float *)&double v24 = a4;
      [v14 _setProgressAnimated:196612 duration:v24 delay:v25 options:0.0];
      int v26 = 1;
    }
    self->_sendProgress = v15;
    self->_sendProgressSendCount = a6;
    self->_sendProgressTotalCount = a7;
    if (v8)
    {
      BOOL v27 = 0;
    }
    else
    {
      BOOL v28 = +[CKUIBehavior sharedBehaviors];
      [v28 sendProgressTitleTransitionProgressThreshold];
      BOOL v27 = v29 < v15 && a4 < 1.0;
    }
    if ((v26 | v27) == 1) {
      [(CKCoreChatController *)self _updateTitleAnimated:1];
    }
    if (v8)
    {
      self->_sendProgress = 0.0;
      self->_sendProgressSendCount = 0;
      self->_sendProgressTotalCount = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke;
      aBlock[3] = &unk_1E5620C40;
      id v30 = v14;
      id v37 = v30;
      long long v31 = (void (**)(void))_Block_copy(aBlock);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_2;
      v33[3] = &unk_1E5621EA8;
      id v14 = v30;
      id v34 = v14;
      __int16 v35 = self;
      long long v32 = (void (**)(void *, uint64_t))_Block_copy(v33);
      if ([(CKCoreChatController *)self disableAnimationsUnderTest])
      {
        v31[2](v31);
        v32[2](v32, 1);
      }
      else
      {
        [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v31 options:v32 animations:0.3 completion:v25];
      }
    }
  }
}

uint64_t __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgress:0 animated:0.0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_3;
  block[3] = &unk_1E5620C40;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTitleAnimated:1];
}

- (UIProgressView)progressBar
{
  if (!self->_progressBar && !CKIsRunningInMessagesViewService())
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    unsigned int v4 = [v3 showsProgressInNavigationBar];

    double v5 = (UIProgressView *)[objc_alloc(MEMORY[0x1E4F42D28]) initWithProgressViewStyle:v4];
    progressBar = self->_progressBar;
    self->_progressBar = v5;
  }
  [(UIProgressView *)self->_progressBar setAlpha:0.0];
  id v7 = self->_progressBar;

  return v7;
}

- (void)registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__preferredServiceChangedNotification_ name:@"CKConversationPreferredServiceChangedNotification" object:0];
  [v3 addObserver:self selector:sel__downgradeStateChangedNotification_ name:*MEMORY[0x1E4F6B8A0] object:0];
  [v3 addObserver:self selector:sel__serviceSwitchNotification_ name:*MEMORY[0x1E4F6BA88] object:0];
  [v3 addObserver:self selector:sel__satelliteStateChangedNotification_ name:*MEMORY[0x1E4F6BAA8] object:0];
  [v3 addObserver:self selector:sel__displayNameUpdatedNotification_ name:*MEMORY[0x1E4F6B898] object:0];
  [v3 addObserver:self selector:sel__handleStatusChangedNotification_ name:*MEMORY[0x1E4F6BB10] object:0];
  [v3 addObserver:self selector:sel__handleStatusInvitationReceivedNotification_ name:*MEMORY[0x1E4F6BB20] object:0];
  [v3 addObserver:self selector:sel__handleStatusStateChangedNotification_ name:*MEMORY[0x1E4F6BB28] object:0];
  [v3 addObserver:self selector:sel__statusDaemonDisconnectedNotification_ name:*MEMORY[0x1E4F6BB18] object:0];
  [v3 addObserver:self selector:sel__transferFinishedNotification_ name:@"CKFileTransferFinishedNotification" object:0];
  [v3 addObserver:self selector:sel__localeDidChangeNotification_ name:*MEMORY[0x1E4F1C370] object:0];
  [v3 addObserver:self selector:sel_handleContentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4F43788] object:0];
  [v3 addObserver:self selector:sel__increaseContrastDidChangeNotification_ name:*MEMORY[0x1E4F43418] object:0];
  [v3 addObserver:self selector:sel__transferRestoredNotification_ name:@"CKFileTransferRestoredNotification" object:0];
  [v3 addObserver:self selector:sel__handleAddressBookChangedNotification_ name:*MEMORY[0x1E4F6CA50] object:0];
  [v3 addObserver:self selector:sel__conversationListFinishedMerging_ name:@"CKConversationListFinishedMergingChatsNotification" object:0];
  [v3 addObserver:self selector:sel__refreshActiveChat_ name:*MEMORY[0x1E4F6B828] object:0];
  [v3 addObserver:self selector:sel__refreshActiveChat_ name:*MEMORY[0x1E4F6B820] object:0];
  [v3 addObserver:self selector:sel__chatRegistryDidReloadNotification_ name:*MEMORY[0x1E4F6BA20] object:0];
  [v3 addObserver:self selector:sel__chatsRemergedNotification_ name:*MEMORY[0x1E4F6BA48] object:0];
  [v3 addObserver:self selector:sel__handleStatusChangedNotification_ name:*MEMORY[0x1E4F6D490] object:0];
  [v3 addObserver:self selector:sel__handleStatusInvitationReceivedNotification_ name:*MEMORY[0x1E4F6D4A0] object:0];
  [v3 addObserver:self selector:sel__handleStatusStateChangedNotification_ name:*MEMORY[0x1E4F6D4A8] object:0];
  [v3 addObserver:self selector:sel__statusDaemonDisconnectedNotification_ name:*MEMORY[0x1E4F6D498] object:0];
}

- (void)preferredSendingServiceChanged
{
}

- (void)_preferredServiceChangedNotification:(id)a3
{
  id v8 = [a3 object];
  unsigned int v4 = [(CKCoreChatController *)self conversation];
  if ([v4 isEqual:v8]) {
    [(CKCoreChatController *)self preferredSendingServiceChanged];
  }
  double v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isCarrierPigeonEnabled];

  if (v6)
  {
    id v7 = [(CKCoreChatController *)self chat];
    [v7 _reloadChatItemsForServiceChange];
  }
}

- (void)_downgradeStateChangedNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Refreshing service for sending due downgrade state change", v9, 2u);
    }
  }
  int v6 = [(CKCoreChatController *)self conversation];
  id v7 = [v6 chat];
  id v8 = [v4 object];

  if (v7 == v8) {
    [(CKCoreChatController *)self refreshServiceForSending];
  }
}

- (void)_serviceSwitchNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Refreshing service for sending due to service switch request", v9, 2u);
    }
  }
  int v6 = [(CKCoreChatController *)self conversation];
  id v7 = [v6 chat];
  id v8 = [v4 object];

  if (v7 == v8) {
    [(CKCoreChatController *)self refreshServiceForSending];
  }
}

- (void)_satelliteStateChangedNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received satellite state change.", v6, 2u);
    }
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__refreshServiceForSendingForSatelliteStateChange object:0];
  [(CKCoreChatController *)self performSelector:sel__refreshServiceForSendingForSatelliteStateChange withObject:0 afterDelay:3.0];
}

- (void)_refreshServiceForSendingForSatelliteStateChange
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Refreshing service for sending due to satellite state change", v5, 2u);
    }
  }
  [(CKCoreChatController *)self refreshServiceForSending];
  id v4 = [(CKCoreChatController *)self chat];
  [v4 _reloadChatItemsForSatelliteStateChangeIfRequired:@"Satellite status changed"];
}

- (void)_displayNameUpdatedNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(CKCoreChatController *)self chat];
  int v5 = [v6 isEqual:v4];

  if (v5) {
    [(CKCoreChatController *)self _updateTitleAnimated:1];
  }
}

- (void)setHandleStatusAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (IMHandleStatusObserverAssertion *)a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      handleStatusAssertion = self->_handleStatusAssertion;
      int v9 = 134218240;
      __int16 v10 = v4;
      __int16 v11 = 2048;
      CGFloat v12 = handleStatusAssertion;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Setting handle observer %p and invalidating old observer %p if necessary", (uint8_t *)&v9, 0x16u);
    }
  }
  id v7 = self->_handleStatusAssertion;
  if (v7 != v4) {
    [(IMHandleStatusObserverAssertion *)v7 invalidate];
  }
  id v8 = self->_handleStatusAssertion;
  self->_handleStatusAssertion = v4;
}

- (void)_statusDaemonDisconnectedNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 name];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F6BB10]];

  if (v6)
  {
    id v7 = @"Availability";
  }
  else
  {
    id v8 = [v4 name];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F6D490]];

    if (v9) {
      id v7 = @"Off grid";
    }
    else {
      id v7 = 0;
    }
  }
  __int16 v10 = [(CKCoreChatController *)self chat];
  if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = v7;
        __int16 v15 = 2112;
        CGFloat v16 = v10;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "%@ daemon was disconnected while there was an active chat controller. Requesting that we continue observing availability for chat %@", (uint8_t *)&v13, 0x16u);
      }
    }
    CGFloat v12 = [v10 beginObservingHandleStatuses];
    [(CKCoreChatController *)self setHandleStatusAssertion:v12];
  }
}

- (void)_handleStatusChangedNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  char v6 = [(CKCoreChatController *)self chat];
  id v7 = [v4 name];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F6BB10]];

  if (v8)
  {
    int v9 = @"Availability";
  }
  else
  {
    __int16 v10 = [v4 name];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6D490]];

    if (v11) {
      int v9 = @"Off grid";
    }
    else {
      int v9 = 0;
    }
  }
  int v12 = [v5 isPersonalStatusSubscription];
  int v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = [v5 subscriptionIdentifier];
        CGFloat v16 = [v6 guid];
        int v22 = 138412546;
        CGFloat v23 = v15;
        __int16 v24 = 2112;
        float v25 = v16;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Personal status subscription %@ changed while there was an active chat controller displaying chat %@. Taking no action.", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        CGFloat v18 = [v5 subscriptionIdentifier];
        double v19 = [v5 ownerHandles];
        id v20 = [v6 guid];
        int v22 = 138413314;
        CGFloat v23 = v9;
        __int16 v24 = 2112;
        float v25 = v18;
        __int16 v26 = 2112;
        BOOL v27 = v19;
        __int16 v28 = 2112;
        double v29 = v20;
        __int16 v30 = 2112;
        long long v31 = v9;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "%@ changed for subscription %@ owned by %@ while there was an active chat controller displaying chat %@. Re-observing all relevant %@ status for chat.", (uint8_t *)&v22, 0x34u);
      }
    }
    id v21 = [v6 beginObservingHandleStatuses];
    [(CKCoreChatController *)self setHandleStatusAssertion:v21];
  }
}

- (void)_handleStatusInvitationReceivedNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  char v6 = [(CKCoreChatController *)self chat];
  id v7 = [v4 name];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F6BB10]];

  if (v8)
  {
    int v9 = @"Availability";
  }
  else
  {
    __int16 v10 = [v4 name];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6D490]];

    if (v11) {
      int v9 = @"Off grid";
    }
    else {
      int v9 = 0;
    }
  }
  int v12 = [v5 isPersonalStatusSubscription];
  int v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = [v5 subscriptionIdentifier];
        CGFloat v16 = [v6 guid];
        int v22 = 138412802;
        CGFloat v23 = v9;
        __int16 v24 = 2112;
        float v25 = v15;
        __int16 v26 = 2112;
        BOOL v27 = v16;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%@ invitation received for personal status subscription %@ while there was an active chat controller displaying chat %@. Taking no action.", (uint8_t *)&v22, 0x20u);
      }
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        CGFloat v18 = [v5 subscriptionIdentifier];
        double v19 = [v5 ownerHandles];
        id v20 = [v6 guid];
        int v22 = 138413314;
        CGFloat v23 = v9;
        __int16 v24 = 2112;
        float v25 = v18;
        __int16 v26 = 2112;
        BOOL v27 = v19;
        __int16 v28 = 2112;
        double v29 = v20;
        __int16 v30 = 2112;
        long long v31 = v9;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "%@ invitation received for subscription %@ owned by %@ while there was an active chat controller displaying chat: %@. Re-observing all relevant %@ for chat", (uint8_t *)&v22, 0x34u);
      }
    }
    id v21 = [v6 beginObservingHandleStatuses];
    [(CKCoreChatController *)self setHandleStatusAssertion:v21];
  }
}

- (void)_handleStatusStateChangedNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  char v6 = [(CKCoreChatController *)self chat];
  id v7 = [v4 name];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F6BB10]];

  if (v8)
  {
    int v9 = @"Availability";
  }
  else
  {
    __int16 v10 = [v4 name];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6D490]];

    if (v11) {
      int v9 = @"Off grid";
    }
    else {
      int v9 = 0;
    }
  }
  int v12 = [v5 isPersonalStatusSubscription];
  int v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = [v5 subscriptionIdentifier];
        CGFloat v16 = [v6 guid];
        int v22 = 138412802;
        CGFloat v23 = v9;
        __int16 v24 = 2112;
        float v25 = v15;
        __int16 v26 = 2112;
        BOOL v27 = v16;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%@ state changed for personal status subscription %@ while there was an active chat controller displaying chat %@. Taking no action.", (uint8_t *)&v22, 0x20u);
      }
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        CGFloat v18 = [v5 subscriptionIdentifier];
        double v19 = [v5 ownerHandles];
        int v22 = 138413314;
        CGFloat v23 = v9;
        __int16 v24 = 2112;
        float v25 = v18;
        __int16 v26 = 2112;
        BOOL v27 = v19;
        __int16 v28 = 2112;
        double v29 = v6;
        __int16 v30 = 2112;
        long long v31 = v9;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "%@ state changed for subscription %@ owned by %@ while there was an active chat controller displaying chat. Re-observing all relevant %@ status for chat: %@", (uint8_t *)&v22, 0x34u);
      }
    }
    id v20 = [v6 beginObservingHandleStatuses];
    [(CKCoreChatController *)self setHandleStatusAssertion:v20];

    id v21 = [v4 name];
    LODWORD(v20) = [v21 isEqualToString:*MEMORY[0x1E4F6D4A8]];

    if (v20) {
      [v6 refreshServiceForSending];
    }
  }
}

- (void)_localeDidChangeNotification:(id)a3
{
  id v4 = [(CKCoreChatController *)self conversation];
  [(CKCoreChatController *)self setConversation:v4 forceReload:1];
}

- (void)_chatRegistryDidReloadNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_chatRegistryDidReloadNotification", v9, 2u);
    }
  }
  char v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6BA18]];
  uint64_t v8 = [v7 BOOLValue];

  [(CKCoreChatController *)self _reassignConversationWithDeferredReload:v8];
}

- (void)_chatsRemergedNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_chatsRemergedNotification", v6, 2u);
    }
  }
  [(CKCoreChatController *)self _reassignConversationWithDeferredReload:1];
}

- (void)_reassignConversationWithDeferredReload:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v10 = v3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_reassignConversationWithDeferredReload: %{BOOL}d", buf, 8u);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CKCoreChatController__reassignConversationWithDeferredReload___block_invoke;
  aBlock[3] = &unk_1E5620C40;
  void aBlock[4] = self;
  char v6 = _Block_copy(aBlock);
  id v7 = v6;
  if (v3) {
    im_dispatch_after();
  }
  else {
    (*((void (**)(void *))v6 + 2))(v6);
  }
}

void __64__CKCoreChatController__reassignConversationWithDeferredReload___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 32) conversation];
  id v4 = [*v2 conversation];
  int v5 = [v4 chat];

  if (!v5)
  {
    id v10 = 0;
    goto LABEL_8;
  }
  BOOL v6 = [v5 chatStyle] == 43;
  id v7 = +[CKConversationList sharedConversationList];
  if (v6)
  {
    uint64_t v8 = [v5 groupID];
    uint64_t v9 = [v7 conversationForExistingChatWithGroupID:v8];
  }
  else
  {
    uint64_t v11 = [v5 guid];
    id v10 = [v7 conversationForExistingChatWithGUID:v11];

    if (v10) {
      goto LABEL_8;
    }
    id v7 = +[CKConversationList sharedConversationList];
    uint64_t v8 = [v5 personCentricID];
    uint64_t v9 = [v7 conversationForExistingChatWithPersonCentricID:v8];
  }
  id v10 = (id)v9;

LABEL_8:
  int v12 = [*(id *)(a1 + 32) conversation];
  objc_msgSend(v10, "setLoadedMessageCount:", objc_msgSend(v12, "limitToLoad"));

  [v10 loadAllMessages];
  if (v10) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v5 == 0;
  }
  if (v13)
  {
    id v10 = v3;
    id v14 = +[CKConversationList sharedConversationList];
    [v14 setPendingConversation:v10];
  }
  [*(id *)(a1 + 32) setConversation:v10 forceReload:1];
  if (IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v10;
      __int16 v18 = 2112;
      double v19 = v3;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "conversationToSet: %@, oldConversation: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)handleContentSizeCategoryDidChangeNotification:(id)a3
{
  [(CKCoreChatController *)self _dismissFullScreenBubbleViewControllerAnimated:1 withSendAnimation:0 completion:0];
  id v4 = [(CKCoreChatController *)self conversation];
  [(CKCoreChatController *)self setConversation:v4 forceReload:1];
}

- (void)_increaseContrastDidChangeNotification:(id)a3
{
  id v4 = [(CKCoreChatController *)self conversation];
  [(CKCoreChatController *)self setConversation:v4 forceReload:1];
}

- (void)_conversationListFinishedMerging:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CKCoreChatController *)self conversation];
  BOOL v6 = +[CKConversationList sharedConversationList];
  id v7 = [v5 chat];
  uint64_t v8 = [v7 guid];
  uint64_t v9 = [v6 conversationForExistingChatWithGUID:v8];

  if (v9)
  {
    if (v5 != v9)
    {
      [(CKCoreChatController *)self setConversation:v9 forceReload:1];
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412546;
          int v12 = v9;
          __int16 v13 = 2112;
          id v14 = v5;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Conversation list performed re-merge, updating transcript conversation to %@ from %@", (uint8_t *)&v11, 0x16u);
        }
LABEL_11:
      }
    }
  }
  else if (v5 && IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "CKCoreChatController attempted to replace conversation after re-merge, but couldn't find a new conversation to replace %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_11;
  }
}

- (void)significantTimeChange
{
  BOOL v3 = [(CKCoreChatController *)self navigationController];
  id v4 = [v3 visibleViewController];

  if (v4 == self)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__CKCoreChatController_significantTimeChange__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __45__CKCoreChatController_significantTimeChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  [*(id *)(a1 + 32) setConversation:v2 forceReload:1];
}

- (id)indexPathForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CKCoreChatController *)self collectionViewController];
  uint64_t v8 = [v7 indexPathForMessageGUID:v6 messagePartIndex:a4];

  return v8;
}

- (CGPoint)contentOffsetForIndexPath:(id)a3 viewToAlignWith:(id)a4 allowOverScroll:(BOOL)a5
{
  [(CKCoreChatController *)self contentOffsetForIndexPath:a3 viewToAlignWith:a4 allowOverScroll:a5 scrollPosition:2];
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)contentOffsetForIndexPath:(id)a3 viewToAlignWith:(id)a4 allowOverScroll:(BOOL)a5 scrollPosition:(unint64_t)a6
{
  char v6 = a6;
  id v10 = a3;
  id v11 = a4;
  int v12 = [(CKCoreChatController *)self collectionViewController];
  [v12 sizeFullTranscriptIfNecessary];
  __int16 v13 = [(CKCoreChatController *)self collectionView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v13 contentInset];
  double v23 = v22;
  double v25 = v15 + v24;
  double v90 = v19 - (v24 + v26);
  double v91 = v17 + v22;
  double v28 = v21 - (v22 + v27);
  double v29 = [v13 layoutAttributesForItemAtIndexPath:v10];
  [v29 frame];
  CGFloat v34 = v30;
  CGFloat v35 = v31;
  CGFloat v36 = v32;
  CGFloat v37 = v33;
  if (v11)
  {
    double v88 = v15;
    long long v38 = [(CKCoreChatController *)self collectionViewController];
    __int16 v39 = [v38 chatItemAtIndexPath:v10];

    long long v40 = [(CKCoreChatController *)self collectionViewController];
    __int16 v41 = [v40 balloonViewForChatItem:v39];

    CGFloat v42 = v28;
    if (v41)
    {
      objc_opt_class();
      CGFloat v43 = v25;
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v41, "ck_identityTransformFrameInView:", v13);
        CGFloat v34 = v44;
        CGFloat v35 = v45;
        CGFloat v36 = v46;
        CGFloat v37 = v47;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v53 = [v13 coordinateSpace];
          [v41 currentAssetFrameInCoordinateSpace:v53];
          CGFloat v34 = v54;
          CGFloat v35 = v55;
          CGFloat v36 = v56;
          CGFloat v37 = v57;
        }
      }
    }
    else
    {
      CGFloat v43 = v25;
    }
    v95.origin.x = v34;
    v95.origin.y = v35;
    v95.size.CGFloat width = v36;
    v95.size.CGFloat height = v37;
    double MinY = CGRectGetMinY(v95);
    [v11 frame];
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
    v67 = [v11 superview];
    objc_msgSend(v13, "convertRect:fromView:", v67, v60, v62, v64, v66);
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    CGFloat v73 = v72;
    CGFloat v75 = v74;

    v96.origin.x = v69;
    v96.origin.y = v71;
    v96.size.CGFloat width = v73;
    v96.size.CGFloat height = v75;
    double v76 = CGRectGetMinY(v96);
    double v25 = v43;
    v97.origin.x = v43;
    v97.size.CGFloat width = v90;
    v97.origin.y = v91;
    double v28 = v42;
    v97.size.CGFloat height = v42;
    double v52 = MinY - (v76 - CGRectGetMinY(v97)) - v23;

    double v15 = v88;
  }
  else if (v6)
  {
    double v52 = CGRectGetMinY(*(CGRect *)&v30) + v23 * -1.2;
  }
  else
  {
    v93.origin.x = v25;
    v93.size.CGFloat width = v90;
    v93.origin.y = v91;
    v93.size.CGFloat height = v28;
    double v89 = v15;
    double v48 = v28;
    double v49 = v25;
    CGFloat v50 = CGRectGetHeight(v93) * -0.5;
    v94.origin.x = v34;
    v94.origin.y = v35;
    v94.size.CGFloat width = v36;
    v94.size.CGFloat height = v37;
    CGFloat v51 = CGRectGetMidY(v94) + v50;
    double v25 = v49;
    double v28 = v48;
    double v15 = v89;
    double v52 = v51 - v23;
  }
  v77 = [v12 chatItems];
  v78 = [v77 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v79 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    v80 = [v13 layoutAttributesForItemAtIndexPath:v79];
    [v80 frame];
    double MaxY = CGRectGetMaxY(v98);
    if (MaxY > v52) {
      double v52 = MaxY - v23;
    }
  }
  if (!a5)
  {
    v82 = [v13 collectionViewLayout];
    [v82 collectionViewContentSize];
    double v84 = v83;
    v99.origin.x = v25;
    v99.size.CGFloat width = v90;
    v99.origin.y = v91;
    v99.size.CGFloat height = v28;
    double v85 = v84 - CGRectGetHeight(v99) - v23;
    if (v52 <= v85) {
      double v85 = v52;
    }
    if (v52 >= -v23) {
      double v52 = v85;
    }
    else {
      double v52 = -v23;
    }
  }
  double v86 = v15;
  double v87 = v52;
  result.y = v87;
  result.x = v86;
  return result;
}

- (void)scrollToHighlightedMessageScrollContext:(id)a3
{
  id v4 = a3;
  double v5 = [(CKCoreChatController *)self collectionView];
  char v6 = [v4 messageGUID];
  uint64_t v7 = [v4 messagePartIndex];
  uint64_t v8 = [v4 viewToAlignWith];
  uint64_t v9 = [v4 allowOverScroll];
  uint64_t v10 = [v4 scrollPosition];

  id v11 = [(CKCoreChatController *)self indexPathForMessageGUID:v6 messagePartIndex:v7];
  if (v11)
  {
    [(CKCoreChatController *)self contentOffsetForIndexPath:v11 viewToAlignWith:v8 allowOverScroll:v9 scrollPosition:v10];
    double v13 = v12;
    double v15 = v14;
    [v5 beginDisablingTranscriptDynamicsForReason:@"ScrollToMessage"];
    objc_msgSend(v5, "setContentOffset:animated:", 0, v13, v15);
    [v5 endDisablingTranscriptDynamicsForReason:@"ScrollToMessage"];
  }
  else
  {
    double v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CKCoreChatController scrollToHighlightedMessageScrollContext:]();
    }
  }
}

- (id)textInputContextIdentifier
{
  id v2 = [(CKCoreChatController *)self conversation];
  BOOL v3 = [v2 deviceIndependentID];
  id v4 = CKTextInputIdentifier();

  return v4;
}

- (BOOL)isFullScreenBalloonViewOnScreen
{
  id v2 = [(CKCoreChatController *)self fullScreenBalloonViewController];
  BOOL v3 = [v2 view];
  id v4 = [v3 superview];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldUpdateScrollPositionForKeyboardScreenFrameChanges
{
  BOOL v2 = [(CKCoreChatController *)self isFullScreenBalloonViewOnScreen];
  if (v2)
  {
    BOOL v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Ignoring keyboard frame change because full screen balloon view is visible", v5, 2u);
    }
  }
  return !v2;
}

- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CKFullScreenBalloonViewDisplayConfiguration tapbackPickerContext];
  char v6 = [(CKCoreChatController *)self _fullScreenBalloonViewControllerWithChatItem:v4 displayConfiguration:v5];

  return v6;
}

- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3 displayConfiguration:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "fullScreenBalloonViewControllerWithChatItem, chatItem = %@", (uint8_t *)&v19, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(CKCoreChatController *)self collectionViewController];
    uint64_t v10 = [v9 balloonViewForChatItem:v6];

    id v11 = v10;
    [v7 setSupplementaryLayoutChatItem:v6];
    uint64_t v12 = [v11 currentAssetChatItem];
    double v13 = [v11 currentAssetRegionOfInterest];
    double v14 = [v13 placeholderViewFactory];

    if (v14)
    {
      double v15 = [v13 imageViewSpec];
      [v7 setSupplementaryLayoutContext:v15];
    }
    id v6 = (id)v12;
  }
  double v16 = (objc_class *)objc_opt_class();
  if (CKIsRunningInMessagesTranscriptExtension()) {
    double v16 = (objc_class *)objc_opt_class();
  }
  double v17 = (void *)[[v16 alloc] initWithChatItem:v6 interfaceActions:0 displayConfiguration:v7 delegate:self];

  return v17;
}

- (BOOL)showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath, indexPath: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (v4)
  {
    id v6 = [(CKCoreChatController *)self collectionViewController];
    id v7 = [v6 chatItems];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));

    BOOL v9 = [(CKCoreChatController *)self shouldShowFullScreenAcknowledgmentPickerForChatItem:v8];
    if (v9) {
      [(CKCoreChatController *)self showFullScreenAcknowledgmentPickerForChatItem:v8];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 IMChatItem];
      id v7 = [v6 guid];
      int v9 = 136315394;
      uint64_t v10 = "-[CKCoreChatController showFullScreenAcknowledgmentPickerForChatItem:]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s, chatItem.guid: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = +[CKFullScreenBalloonViewDisplayConfiguration tapbackPickerContext];
  [(CKCoreChatController *)self showFullScreenAcknowledgmentPickerForChatItem:v4 displayConfiguration:v8];
}

- (void)showFullScreenTapbackKeyboardInputForChatItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 IMChatItem];
      id v7 = [v6 guid];
      int v9 = 136315394;
      uint64_t v10 = "-[CKCoreChatController showFullScreenTapbackKeyboardInputForChatItem:]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s, chatItem.guid: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = +[CKFullScreenBalloonViewDisplayConfiguration tapbackKeyboardInputContext];
  [(CKCoreChatController *)self showFullScreenAcknowledgmentPickerForChatItem:v4 displayConfiguration:v8];
}

- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3 displayConfiguration:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [v6 IMChatItem];
      uint64_t v10 = [v9 guid];
      *(_DWORD *)buf = 136315394;
      double v29 = "-[CKCoreChatController showFullScreenAcknowledgmentPickerForChatItem:displayConfiguration:]";
      __int16 v30 = 2112;
      double v31 = v10;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "%s, chatItem.guid: %@", buf, 0x16u);
    }
  }
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  double v22 = __91__CKCoreChatController_showFullScreenAcknowledgmentPickerForChatItem_displayConfiguration___block_invoke;
  double v23 = &unk_1E5622A90;
  objc_copyWeak(&v26, &location);
  id v11 = v6;
  id v24 = v11;
  id v12 = v7;
  id v25 = v12;
  uint64_t v13 = (void (**)(void))_Block_copy(&v20);
  double v14 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", v20, v21, v22, v23);
  int v15 = [v14 isExpressiveTextEnabled];

  if (v15)
  {
    double v16 = [(CKCoreChatController *)self collectionViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13[2](v13);

      goto LABEL_15;
    }
    if (IMOSLoggingEnabled())
    {
      double v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        double v18 = [v11 IMChatItem];
        int v19 = [v18 guid];
        *(_DWORD *)buf = 138412290;
        double v29 = v19;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Presening fullScreenBalloonViewController: no textEffects cancellation in progress, chatItem.guid: %@", buf, 0xCu);
      }
    }
    [v16 prepareTextEffectsForModalPresentation];
  }
  v13[2](v13);
LABEL_15:

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __91__CKCoreChatController_showFullScreenAcknowledgmentPickerForChatItem_displayConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CGFloat v42 = [WeakRetained chat];

  [v42 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B930]];
  id v4 = objc_loadWeakRetained(v2);
  [v4 beginHoldingScrollGeometryUpdatesForReason:@"FullscreenBalloonMenuVisible"];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 _fullScreenBalloonViewControllerWithChatItem:*(void *)(a1 + 32) displayConfiguration:*(void *)(a1 + 40)];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) IMChatItem];
      int v9 = [v8 guid];
      *(_DWORD *)buf = 138412290;
      double v44 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController will be presented, chatItem.guid: %@", buf, 0xCu);
    }
  }
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v10 view];
  id v12 = [v11 window];
  id v13 = objc_loadWeakRetained(v2);
  double v14 = [v13 view];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = objc_loadWeakRetained(v2);
  id v24 = [v23 view];
  objc_msgSend(v12, "convertRect:fromView:", v24, v16, v18, v20, v22);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  double v33 = [v6 view];
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  id v34 = objc_loadWeakRetained(v2);
  CGFloat v35 = [v34 view];
  CGFloat v36 = [v35 window];
  CGFloat v37 = [v6 view];
  [v36 addSubview:v37];

  id v38 = objc_loadWeakRetained(v2);
  [v38 setFullScreenBalloonViewController:v6];

  if (IMOSLoggingEnabled())
  {
    __int16 v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      long long v40 = [*(id *)(a1 + 32) IMChatItem];
      __int16 v41 = [v40 guid];
      *(_DWORD *)buf = 138412290;
      double v44 = v41;
      _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "_fullScreenBalloonViewController has been set, chatItem.guid: %@", buf, 0xCu);
    }
  }
}

- (BOOL)shouldShowTapbackAttributionForFullScreenBalloonViewController:(id)a3
{
  id v4 = [a3 chatItem];
  LOBYTE(self) = [(CKCoreChatController *)self shouldShowTapbackAttributionForChatItem:v4];

  return (char)self;
}

- (BOOL)shouldShowTapbackPickerForFullScreenBalloonViewController:(id)a3
{
  id v4 = [a3 chatItem];
  LOBYTE(self) = [(CKCoreChatController *)self shouldShowTapbackPickerForChatItem:v4];

  return (char)self;
}

- (id)contextualChatItemsForTapbackPicker
{
  BOOL v2 = [(CKCoreChatController *)self collectionViewController];
  BOOL v3 = [v2 chatItems];

  return v3;
}

- (BOOL)shouldShowFullScreenAcknowledgmentPickerForChatItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CKCoreChatController *)self isFullScreenBalloonViewOnScreen])
  {
    id v7 = [(CKCoreChatController *)self balloonViewForChatItem:v4];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 canPresentTapbackPicker])
      {
        BOOL v9 = [(CKCoreChatController *)self shouldShowTapbackPickerForChatItem:v4];
        int v6 = v9 | [(CKCoreChatController *)self shouldShowTapbackAttributionForChatItem:v4];
LABEL_19:

        goto LABEL_20;
      }
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "[Tapbacks] BalloonView does not allow presenting tapback picker", (uint8_t *)&v14, 2u);
        }
LABEL_17:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v4 IMChatItem];
        id v12 = [v11 guid];
        int v14 = 138412290;
        double v15 = v12;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "[Tapbacks] BalloonView for chatItem: %@ not found", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_17;
    }
    LOBYTE(v6) = 0;
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Tapbacks] Should not present fullScreenBalloonViewController - a fullScreenBalloonViewController is already presented", (uint8_t *)&v14, 2u);
    }
  }
  LOBYTE(v6) = 0;
LABEL_20:

  return v6;
}

- (BOOL)shouldShowTapbackAttributionForChatItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        int v6 = "not showing tapback attribution: not message part chatItem";
        id v7 = (uint8_t *)&v10;
LABEL_10:
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      }
LABEL_11:
    }
LABEL_12:
    BOOL v4 = 0;
    goto LABEL_13;
  }
  if (([v3 hasVisibleAssociatedMessageItems] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v9 = 0;
        int v6 = "not showing tapback attribution: no visible tapbacks";
        id v7 = (uint8_t *)&v9;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v4 = 1;
LABEL_13:

  return v4;
}

- (BOOL)shouldShowTapbackPickerForChatItem:(id)a3
{
  id v4 = a3;
  if ([(CKCoreChatController *)self _shouldAllowReplyFromLockScreen])
  {
    id v5 = [(CKCoreChatController *)self conversation];
    int v6 = [v5 isBusinessChatDisabled];

    if (v6)
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          __int16 v21 = 0;
          uint64_t v8 = "not showing tapback picker: business chat disabled";
          __int16 v9 = (uint8_t *)&v21;
LABEL_9:
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      id v12 = [(CKCoreChatController *)self conversation];
      id v13 = [v12 chat];
      char v14 = [v13 supportsCapabilities:0x40000];

      if ((v14 & 1) == 0)
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_11;
        }
        id v7 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_10;
        }
        __int16 v20 = 0;
        uint64_t v8 = "not showing tapback picker: missing tapbacks chat capability";
        __int16 v9 = (uint8_t *)&v20;
        goto LABEL_9;
      }
      double v15 = [(CKCoreChatController *)self conversation];
      uint64_t v16 = [v15 chat];
      char v17 = [v16 canSend];

      if ((v17 & 1) == 0)
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_11;
        }
        id v7 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_10;
        }
        __int16 v19 = 0;
        uint64_t v8 = "not showing tapback picker: cannot send to chat";
        __int16 v9 = (uint8_t *)&v19;
        goto LABEL_9;
      }
      if ([v4 canSendTapbacks])
      {
        BOOL v10 = 1;
        goto LABEL_12;
      }
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_10;
        }
        __int16 v18 = 0;
        uint64_t v8 = "not showing tapback picker: chatItem can't send tapbacks";
        __int16 v9 = (uint8_t *)&v18;
        goto LABEL_9;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "not showing tapback picker: replies not allowed lock screen";
      __int16 v9 = buf;
      goto LABEL_9;
    }
LABEL_10:
  }
LABEL_11:
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (void)_dismissFullScreenBubbleViewControllerAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (IMOSLoggingEnabled())
  {
    __int16 v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated", buf, 2u);
    }
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  __int16 v19 = __100__CKCoreChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke;
  __int16 v20 = &unk_1E5622330;
  __int16 v21 = self;
  id v10 = v8;
  id v22 = v10;
  id v11 = (void (**)(void))_Block_copy(&v17);
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if (v6) {
        id v13 = @"YES";
      }
      else {
        id v13 = @"NO";
      }
      char v14 = _Block_copy(v10);
      *(_DWORD *)buf = 138412802;
      id v24 = v13;
      __int16 v25 = 1024;
      BOOL v26 = v5;
      __int16 v27 = 2112;
      double v28 = v14;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated %@:WithSendAnimation: %d, completion %@", buf, 0x1Cu);
    }
  }
  double v15 = [(CKCoreChatController *)self fullScreenBalloonViewController];
  uint64_t v16 = v15;
  if (v6)
  {
    if (v5) {
      [v15 performSendAndCloseAnimationWithCompletion:v11];
    }
    else {
      [v15 performCancelAnimationWithCompletion:v11];
    }
  }
  else
  {
    [v15 dismissImmediatelyWithNoAnimations];

    v11[2](v11);
  }
}

void __100__CKCoreChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) fullScreenBalloonViewController];
  id v3 = [v2 presentingViewController];

  id v4 = [*(id *)(a1 + 32) fullScreenBalloonViewController];
  BOOL v5 = v4;
  if (v3)
  {
    [v4 dismissViewControllerAnimated:0 completion:0];
  }
  else
  {
    [v4 willMoveToParentViewController:0];

    BOOL v6 = [*(id *)(a1 + 32) fullScreenBalloonViewController];
    id v7 = [v6 view];
    [v7 removeFromSuperview];

    id v8 = [*(id *)(a1 + 32) fullScreenBalloonViewController];
    [v8 removeFromParentViewController];

    BOOL v5 = [*(id *)(a1 + 32) fullScreenBalloonViewController];
    [v5 didMoveToParentViewController:0];
  }

  [*(id *)(a1 + 32) setFullScreenBalloonViewController:0];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "_fullScreenBalloonViewController has been dismissed and set to nil", v11, 2u);
    }
  }
}

- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = [(CKCoreChatController *)self collectionViewController];
  id v7 = [v5 chatItem];
  id v19 = [v6 balloonViewForChatItem:v7];

  [v19 prepareForAcknowledgementDisplay];
  id v8 = [v19 window];
  uint64_t v9 = [(CKCoreChatController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = [(CKCoreChatController *)self view];
  objc_msgSend(v8, "convertRect:fromView:", v18, v11, v13, v15, v17);
  objc_msgSend(v5, "setPreservedBoundsInBalloonWindowAtAppearance:");
}

- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3
{
  id v4 = a3;
  id v9 = [(CKCoreChatController *)self chat];
  [v9 endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B930]];
  [(CKScrollViewController *)self endHoldingScrollGeometryUpdatesForReason:@"FullscreenBalloonMenuVisible"];
  id v5 = [(CKCoreChatController *)self collectionViewController];
  BOOL v6 = [v4 chatItem];
  id v7 = [v5 balloonViewForChatItem:v6];

  [v7 prepareForAcknowledgementDismissal];
  id v8 = [v4 view];

  [v8 removeFromSuperview];
}

- (id)fullScreenBalloonViewController:(id)a3 balloonViewForChatItem:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKCoreChatController *)self balloonViewForChatItem:v7];
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = [v7 IMChatItem];
      double v11 = [v10 guid];
      int v13 = 138412546;
      double v14 = v8;
      __int16 v15 = 2112;
      double v16 = v11;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Found balloonView: %@, for chatItem: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v8;
}

- (id)balloonViewForChatItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKCoreChatController *)self collectionViewController];
  id v6 = [v4 IMChatItem];

  id v7 = [v6 guid];
  id v8 = [v5 chatItemForGUID:v7];

  id v9 = [(CKCoreChatController *)self collectionViewController];
  double v10 = [v9 balloonViewForChatItem:v8];

  return v10;
}

- (CGRect)fullScreenBalloonViewController:(id)a3 balloonFrameForChatItem:(id)a4
{
  id v5 = [(CKCoreChatController *)self fullScreenBalloonViewController:a3 balloonViewForChatItem:a4];
  if (v5)
  {
    id v6 = [(CKCoreChatController *)self view];
    [v5 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    __int16 v15 = [v5 superview];
    objc_msgSend(v6, "convertRect:fromView:", v15, v8, v10, v12, v14);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB28];
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3
{
}

- (BOOL)wantsReplyButton
{
  if ([(CKCoreChatController *)self isInline]) {
    return 0;
  }
  id v4 = [(CKCoreChatController *)self chat];
  char v5 = [v4 canSendInlineReply];

  return v5;
}

- (CGRect)fullScreenBalloonViewControllerSafeAreaLayoutFrame:(id)a3
{
  id v3 = [(CKCoreChatController *)self view];
  id v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)fullScreenBalloonViewController:(id)a3 duplicatedViewForChatItem:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [(CKCoreChatController *)self collectionViewController];
    double v7 = [v6 balloonViewForChatItem:v5];

    uint64_t v8 = [v7 currentAssetSnapshot];
LABEL_5:
    double v9 = (void *)v8;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [(CKCoreChatController *)self balloonViewForChatItem:v5];
    uint64_t v8 = [v7 snapshotCurrentView];
    goto LABEL_5;
  }
  double v9 = CKBalloonViewForClass((objc_class *)[v5 balloonViewClass]);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  [v9 configureForMessagePart:v5];
  if ((isKindOfClass & 1) == 0) {
    [v9 setInvisibleInkEffectEnabled:0];
  }
  [v9 setCanUseOpaqueMask:0];
  if (objc_opt_respondsToSelector())
  {
    double v11 = [(CKCoreChatController *)self view];
    [v9 setGradientReferenceView:v11];
  }
  [v9 setNeedsPrepareForDisplay];
  [v9 prepareForDisplayIfNeeded];
  [v5 size];
  double v13 = v12;
  double v15 = v14;
  int v16 = [v5 itemIsReplyContextPreview];
  double v17 = +[CKUIBehavior sharedBehaviors];
  double v18 = v17;
  if (v16)
  {
    [v17 replyBalloonMaskSizeWithTailShape:1 isMultiline:0];
    [v9 setWantsSkinnyMask:v13 < v19];

    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 textReplyPreviewBalloonMinHeight];
  }
  else
  {
    [v17 balloonMaskSizeWithTailShape:1 isMultiline:0];
    [v9 setWantsSkinnyMask:v13 < v21];

    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 textBalloonMinHeight];
  }
  [v9 setWantsMultilineMask:v15 > v20];
LABEL_14:

  return v9;
}

- (BOOL)isInline
{
  return 0;
}

- (void)showInlineReplyControllerForChatItem:(id)a3 presentKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[CKInlineReplyTransitionProperties defaultProperties];
  [(CKCoreChatController *)self showInlineReplyControllerForChatItem:v6 presentKeyboard:v4 replyTransitionProperties:v7];
}

- (id)_threadChatItemForReplyCountChatItem:(id)a3 chatItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 IMChatItem];
  if ([v7 itemIsReplyCount]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  double v10 = v9;
  if (v9)
  {
    double v11 = [v9 threadIdentifier];
    double v12 = [v10 replyMessageGUID];
    if ([v11 length] || objc_msgSend(v12, "length"))
    {
      uint64_t v19 = 0;
      double v20 = &v19;
      uint64_t v21 = 0x3032000000;
      double v22 = __Block_byref_object_copy__50;
      double v23 = __Block_byref_object_dispose__50;
      id v24 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __71__CKCoreChatController__threadChatItemForReplyCountChatItem_chatItems___block_invoke;
      v15[3] = &unk_1E56299C0;
      id v16 = v12;
      id v17 = v11;
      double v18 = &v19;
      [v6 enumerateObjectsUsingBlock:v15];
      id v13 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __71__CKCoreChatController__threadChatItemForReplyCountChatItem_chatItems___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 IMChatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v10 = [v7 IMChatItem];
    double v11 = v10;
    if (a1[4])
    {
      uint64_t v12 = [v10 message];
      id v13 = [(id)v12 guid];

      LOBYTE(v12) = [v13 isEqualToString:a1[4]];
      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
      id v18 = 0;
      char v14 = [v10 itemIsThreadOriginatorWithThreadIdentifier:&v18];
      id v15 = v18;
      id v16 = v15;
      if ((v14 & 1) == 0)
      {

        goto LABEL_9;
      }
      int v17 = [v15 isEqualToString:a1[5]];

      if (!v17)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)systemApplicationDidResume
{
  if ([(CKCoreChatController *)self viewIsVisible])
  {
    BOOL v2 = +[CKPreviewDispatchCache genmojiPreviewCache];
    [v2 resume];

    id v3 = +[CKPreviewDispatchCache transcriptPreviewCache];
    [v3 resume];

    id v4 = +[CKPreviewDispatchCache snapshotCache];
    [v4 resume];
  }
}

- (void)configureWithToolbarController:(id)a3
{
  id v6 = a3;
  id v4 = [(CKCoreChatController *)self macToolbarController];

  if (v4 != v6) {
    [(CKCoreChatController *)self setMacToolbarController:v6];
  }
  if ([(CKCoreChatController *)self conformsToProtocol:&unk_1EDF48CA0])
  {
    id v5 = [(CKCoreChatController *)self macToolbarController];
    [v5 setSecondaryItemProvider:self];
  }
}

- (void)providerWillBeRemovedFromToolbarController:(id)a3
{
}

- (BOOL)itemProviderDisablesTouches
{
  return 0;
}

- (id)toolbarItemForIdentifier:(id)a3
{
  return 0;
}

- (void)presentMacToolbarController
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 useMacToolbar];

  if (v4)
  {
    id v5 = [(CKCoreChatController *)self macToolbarController];

    if (v5)
    {
      id v8 = [(CKCoreChatController *)self view];
      id v6 = [(CKCoreChatController *)self macToolbarController];
      id v7 = [v6 view];
      [v8 addSubview:v7];
    }
  }
}

- (id)selectedChatItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)fullScreenBalloonViewControllerShouldShowHightlightButton:(id)a3 forChatItem:(id)a4
{
  return objc_msgSend(a4, "syndicationBehavior", a3) == 1;
}

- (void)fullScreenBalloonViewController:(id)a3 sendMessageHighlight:(BOOL)a4 forChatItem:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v14 = [(CKCoreChatController *)self chat];
  id v8 = [v7 IMChatItem];
  id v9 = [v8 guid];
  uint64_t v10 = [v7 messagePartRange];
  uint64_t v12 = v11;

  if (v5) {
    uint64_t v13 = 4;
  }
  else {
    uint64_t v13 = 8;
  }
  objc_msgSend(v14, "sendSyndicationAction:forMessagePartGUID:syndicatedMessagePartRange:", v13, v9, v10, v12);
}

- (void)fullScreenBalloonViewControllerMessageHighlightButtonDidFinishAnimating:(id)a3
{
}

- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3
{
  id v3 = [(CKCoreChatController *)self collectionViewController];
  int v4 = [v3 chatItems];

  return v4;
}

- (void)copyChatItem:(id)a3
{
  id v5 = a3;
  if [v5 canCopy] && (objc_opt_respondsToSelector())
  {
    id v3 = [MEMORY[0x1E4F42C50] generalPasteboard];
    int v4 = [v5 pasteboardItemProviders];
    [v3 setItemProviders:v4];
  }
}

- (void)deleteChatItem:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 canDelete])
  {
    id v5 = [(CKCoreChatController *)self collectionViewController];
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 deleteSelectedChatItems:v6];
  }
}

- (void)transcriptCollectionViewController:(id)a3 willDeleteChatItems:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F6E6D0] sharedManager];
  int v7 = [v6 isFeatureEnabled];

  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__CKCoreChatController_transcriptCollectionViewController_willDeleteChatItems___block_invoke;
    v8[3] = &unk_1E56255D8;
    v8[4] = self;
    [v5 enumerateObjectsUsingBlock:v8];
  }
}

void __79__CKCoreChatController_transcriptCollectionViewController_willDeleteChatItems___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 supportsCommunicationSafety])
  {
    id v4 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    id v5 = [v3 commSafetyTransferGUID];
    id v6 = [v4 transferForGUID:v5];

    if ([v6 commSafetySensitive] == 2)
    {
      int v7 = [v3 isFromMe];
      id v8 = [v6 localURL];
      id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
      if (v9)
      {
        uint64_t v10 = v7 ^ 1u;
        id v11 = objc_alloc(MEMORY[0x1E4F6BC80]);
        uint64_t v12 = [v3 commSafetyTransferGUID];
        uint64_t v13 = (void *)[v11 initWithIdentifier:v12 imageData:v9];

        id v14 = (void *)MEMORY[0x1E4F6BC78];
        id v15 = [v3 commSafetyMessageGUID];
        id v16 = [*(id *)(a1 + 32) chat];
        v18[0] = v13;
        int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        [v14 registerEvent:v10 eventType:2 messageGUID:v15 chat:v16 forImages:v17];
      }
    }
  }
}

- (id)firstUnreadMessageItemGUIDForTranscriptCollectionViewController:(id)a3
{
  return 0;
}

- (double)_maxEntryViewHeight
{
  return 0.0;
}

- (CKCoreChatControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKCoreChatControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (BOOL)isSendingMessage
{
  return self->_sendingMessage;
}

- (void)setSendingMessage:(BOOL)a3
{
  self->_sendingMessage = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (BOOL)transitionedFromComposing
{
  return self->_transitionedFromComposing;
}

- (void)setTransitionedFromComposing:(BOOL)a3
{
  self->_transitionedFromComposing = a3;
}

- (BOOL)userInitiatedTranscriptPush
{
  return self->_userInitiatedTranscriptPush;
}

- (void)setUserInitiatedTranscriptPush:(BOOL)a3
{
  self->_userInitiatedTranscriptPush = a3;
}

- (BOOL)shareWasCreated
{
  return self->_shareWasCreated;
}

- (void)setShareWasCreated:(BOOL)a3
{
  self->_shareWasCreated = a3;
}

- (CGSize)initialViewSize
{
  double width = self->_initialViewSize.width;
  double height = self->_initialViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInitialViewSize:(CGSize)a3
{
  self->_initialViewSize = a3;
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (void)setShowingInStandAloneWindow:(BOOL)a3
{
  self->_showingInStandAloneWindow = a3;
}

- (CKChatInputController)inputController
{
  return self->_inputController;
}

- (void)setInputController:(id)a3
{
}

- (CKCoreTranscriptControllerProtocol)collectionViewController
{
  return self->_collectionViewController;
}

- (BOOL)initialLayoutComplete
{
  return self->_initialLayoutComplete;
}

- (void)setInitialLayoutComplete:(BOOL)a3
{
  self->_initialLayoutComplete = a3;
}

- (BOOL)ignoreLastBalloonVisibleInMarkAsReadCheck
{
  return self->_ignoreLastBalloonVisibleInMarkAsReadCheck;
}

- (void)setIgnoreLastBalloonVisibleInMarkAsReadCheck:(BOOL)a3
{
  self->_ignoreLastBalloonVisibleInMarkAsReadCheck = a3;
}

- (CKScheduledUpdater)refreshServiceForSendingUpdater
{
  return self->_refreshServiceForSendingUpdater;
}

- (void)setRefreshServiceForSendingUpdater:(id)a3
{
}

- (void)setProgressBar:(id)a3
{
}

- (double)sendProgress
{
  return self->_sendProgress;
}

- (void)setSendProgress:(double)a3
{
  self->_sendProgress = a3;
}

- (unint64_t)sendProgressSendCount
{
  return self->_sendProgressSendCount;
}

- (void)setSendProgressSendCount:(unint64_t)a3
{
  self->_sendProgressSendCount = a3;
}

- (unint64_t)sendProgressTotalCount
{
  return self->_sendProgressTotalCount;
}

- (void)setSendProgressTotalCount:(unint64_t)a3
{
  self->_sendProgressTotalCount = a3;
}

- (CKFullScreenBalloonViewController)fullScreenBalloonViewController
{
  return self->_fullScreenBalloonViewController;
}

- (void)setFullScreenBalloonViewController:(id)a3
{
}

- (int64_t)acknowledgmentToSend
{
  return self->_acknowledgmentToSend;
}

- (void)setAcknowledgmentToSend:(int64_t)a3
{
  self->_acknowledgmentToSend = a3;
}

- (BOOL)disableAnimationsUnderTest
{
  return self->_disableAnimationsUnderTest;
}

- (void)setDisableAnimationsUnderTest:(BOOL)a3
{
  self->_disableAnimationsUnderTest = a3;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
}

- (BOOL)isShowingLockoutView
{
  return self->_isShowingLockoutView;
}

- (void)setIsShowingLockoutView:(BOOL)a3
{
  self->_isShowingLockoutView = a3;
}

- (CKMacToolbarController)macToolbarController
{
  return self->_macToolbarController;
}

- (void)setMacToolbarController:(id)a3
{
}

- (NSTimer)satelliteFetchTimer
{
  return self->_satelliteFetchTimer;
}

- (void)setSatelliteFetchTimer:(id)a3
{
}

- (UIView)satelliteUnavailableLabel
{
  return self->_satelliteUnavailableLabel;
}

- (void)setSatelliteUnavailableLabel:(id)a3
{
}

- (IMHandleStatusObserverAssertion)handleStatusAssertion
{
  return self->_handleStatusAssertion;
}

- (id)insertItemsEmojiTapbacksCallBack
{
  return self->_insertItemsEmojiTapbacksCallBack;
}

- (void)setInsertItemsEmojiTapbacksCallBack:(id)a3
{
}

- (id)removeItemsEmojiTapbacksCallBack
{
  return self->_removeItemsEmojiTapbacksCallBack;
}

- (void)setRemoveItemsEmojiTapbacksCallBack:(id)a3
{
}

- (NSCountedSet)activePinningInputViewReasons
{
  return self->_activePinningInputViewReasons;
}

- (void)setActivePinningInputViewReasons:(id)a3
{
}

- (BOOL)needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet
{
  return self->_needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet;
}

- (void)setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:(BOOL)a3
{
  self->_needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePinningInputViewReasons, 0);
  objc_storeStrong(&self->_removeItemsEmojiTapbacksCallBack, 0);
  objc_storeStrong(&self->_insertItemsEmojiTapbacksCallBack, 0);
  objc_storeStrong((id *)&self->_handleStatusAssertion, 0);
  objc_storeStrong((id *)&self->_satelliteUnavailableLabel, 0);
  objc_storeStrong((id *)&self->_satelliteFetchTimer, 0);
  objc_storeStrong((id *)&self->_macToolbarController, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_fullScreenBalloonViewController, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_refreshServiceForSendingUpdater, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)lazyCreatedActivePinningInputViewReasons
{
  id v3 = [(CKCoreChatController *)self activePinningInputViewReasons];
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    [(CKCoreChatController *)self setActivePinningInputViewReasons:v3];
  }

  return v3;
}

- (void)beginPinningInputViewsForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKCoreChatController *)self lazyCreatedActivePinningInputViewReasons];
  uint64_t v6 = [v5 count];
  [v5 addObject:v4];
  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "We are now pinning input views for multiple reasons: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    if (v7)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Beginning pinning input views for reason %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [(CKCoreChatController *)self _beginPinningInputViews];
    uint64_t v10 = [MEMORY[0x1E4F42C68] sharedInstance];
    [v10 _beginDisablingAnimations];
  }
}

- (void)endPinningInputViewsForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKCoreChatController *)self lazyCreatedActivePinningInputViewReasons];
  if (([v5 containsObject:v4] & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Received request to end pinning input views for reason %@, but we are not currently pinning for that reason.", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_6;
  }
  [v5 removeObject:v4];
  uint64_t v6 = [v5 count];
  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Ending pinning input views for reason %@, but we are still pinning input views for reasons %@", (uint8_t *)&v11, 0x16u);
      }
LABEL_6:
    }
  }
  else
  {
    if (v7)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Ending pinning input views for reason %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [(CKCoreChatController *)self _endPinningInputViews];
    uint64_t v10 = [MEMORY[0x1E4F42C68] sharedInstance];
    [v10 _endDisablingAnimations];
  }
LABEL_16:
}

- (BOOL)chatSupportsStickerTapbacks
{
  BOOL v2 = self;
  id v3 = [(CKCoreChatController *)v2 conversation];
  id v4 = [(CKConversation *)v3 chat];

  if (v4)
  {
    unsigned __int8 v5 = [(CKCoreChatController *)v4 supportsCapabilities:0x10000];

    BOOL v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)sendTapback:(id)a3 chatItem:(id)a4 isRemoval:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_18F60678C(v8, (uint64_t)v9, a5);
}

- (id)currentlyFocusedChatItemForTapbackInTranscriptCollectionViewController:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_18F6069BC(v4);
  int v7 = v6;

  return v7;
}

- (void)fullScreenBalloonViewController:(id)a3 didSelectTapback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_18F60708C(v6, (uint64_t)v7);
}

- (void)fullScreenBalloonViewController:(id)a3 didDeselectTapback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = objc_msgSend(v6, sel_chatItem);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  v13[4] = sub_18F60805C;
  v13[5] = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_18F4C10A8;
  v13[3] = &block_descriptor_3_0;
  int v11 = _Block_copy(v13);
  id v12 = v6;
  swift_release();
  [(CKCoreChatController *)v8 setRemoveItemsEmojiTapbacksCallBack:v11];
  _Block_release(v11);
  [(CKCoreChatController *)v8 sendTapback:v7 chatItem:v9 isRemoval:1];
}

- (void)fullScreenBalloonViewController:(id)a3 requestedPresentPlugin:(id)a4 withPayloadID:(id)a5
{
  id v5 = a5;
  if (a4)
  {
    id v8 = (void *)sub_18F7B9660();
    if (v5)
    {
LABEL_3:
      uint64_t v9 = sub_18F7B97E0();
      id v5 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
LABEL_6:
  id v11 = a3;
  id v12 = self;
  sub_18F607F38(v8, v9, (uint64_t)v5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fullScreenBalloonViewControllerRequestedAppCardDismiss:(id)a3
{
  id v4 = a3;
  id v8 = self;
  id v5 = [(CKCoreChatController *)v8 inputController];
  if (v5)
  {
    id v6 = v5;
    void aBlock[4] = nullsub_1;
    void aBlock[5] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18F4C10A8;
    aBlock[3] = &block_descriptor_42;
    id v7 = _Block_copy(aBlock);
    [(CKChatInputController *)v6 dismissAppCardIfNecessaryAnimated:1 completion:v7];
    _Block_release(v7);
  }
  else
  {
  }
}

- (BOOL)fullScreenBalloonViewControllerShouldEnableStickerTapbacks:(id)a3
{
  return [(CKCoreChatController *)self chatSupportsStickerTapbacks];
}

- (id)associatedTapbackPileViewForFullScreenBalloonViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18F607594(v4);
  id v7 = v6;

  return v7;
}

- (void)fullScreenBalloonViewController:(id)a3 updateTapbackPileAppearanceAsHidden:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_18F6077E8(v6, a4);
}

- (void)fullScreenBalloonViewController:(id)a3 updateTranscriptBalloonViewAppearanceAsHidden:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_18F607C70(v6, a4);
}

- (id)fullScreenBalloonViewControllerSmartEmojiResponses:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = objc_msgSend(v4, sel_chatItem);
  sub_18F6064C8(v6);

  id v7 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)textInputContextIdentifierForFullScreenBalloonViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(CKCoreChatController *)v5 textInputContextIdentifier];
  if (v6)
  {
    id v7 = v6;
    sub_18F7B97E0();

    id v8 = (void *)sub_18F7B97A0();
    swift_bridgeObjectRelease();
  }
  else
  {

    id v8 = 0;
  }

  return v8;
}

- (void)setConversation:forceReload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Attempted to set conversation to nil.", v2, v3, v4, v5, v6);
}

- (void)sendStickerTapback:mediaObject:parentMessagePartChatItem:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to send nil media object", v2, v3, v4, v5, v6);
}

- (void)scrollToHighlightedMessageScrollContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Could not scroll to highlighted message context, index path not found", v2, v3, v4, v5, v6);
}

@end