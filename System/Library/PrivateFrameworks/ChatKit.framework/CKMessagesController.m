@interface CKMessagesController
- ($5E9189851FD2AFACF3F6099594984659)columnResizeParams;
- (BOOL)_changeFilterModeIfNeeded;
- (BOOL)_hasCurrentConversations;
- (BOOL)_isApplyingJunkFilter;
- (BOOL)_isMessageFilteringEnabled;
- (BOOL)_isSendingNewComposeMessage;
- (BOOL)_isShowingExpandedAppViewController;
- (BOOL)_isShowingFullscreenController;
- (BOOL)_isShowingModalChatController;
- (BOOL)_isTimedOutForState:(id)a3;
- (BOOL)_shouldShowInboxView;
- (BOOL)_shouldShowSMSRelayPrompt;
- (BOOL)_shouldShowSMSRelayPromptOnLaunch;
- (BOOL)_spamFilteringEnabled;
- (BOOL)_splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition:(id)a3;
- (BOOL)_wantsThreeColumnLayout;
- (BOOL)anyConversationsExistFor:(id)a3;
- (BOOL)areSelectedConversationsBlocked;
- (BOOL)becomeFirstResponder;
- (BOOL)composeChatControllerCanEditRecipients;
- (BOOL)currentCompositionHasContent;
- (BOOL)daemonIsConnected;
- (BOOL)forceOrientation;
- (BOOL)hasBusinessRecipientWithRecipientIDs:(id)a3;
- (BOOL)hasDetailsNavigationController;
- (BOOL)hasRecentlyDeletedFilterSelected;
- (BOOL)hasUnreadFilteredConversationsIgnoringMessages:(id)a3;
- (BOOL)inboxViewController:(id)a3 shouldShowFilterMode:(unint64_t)a4;
- (BOOL)isAnimatingMessageSend;
- (BOOL)isComposingMessage;
- (BOOL)isDetailsNavigationControllerDetached;
- (BOOL)isDownTimeActiveForCurrentChat;
- (BOOL)isInitialLoad;
- (BOOL)isOscarModal;
- (BOOL)isShowingChatController;
- (BOOL)isShowingChatControllerWithUnsentText;
- (BOOL)isShowingComposeChatController;
- (BOOL)isShowingConversationListController;
- (BOOL)isShowingInboxViewController;
- (BOOL)isShowingSelectionView;
- (BOOL)isTopVCChatNavigationController;
- (BOOL)onboardingControllerIsActive;
- (BOOL)resumeToConversation:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldClearSecondaryItemsFromToolbarController:(id)a3;
- (BOOL)shouldPresentOnboarding;
- (BOOL)shouldRestoreToConversationListForState:(id)a3;
- (BOOL)shouldShowMakoIMessageAlert;
- (BOOL)shouldUseMinimumSafeAreas;
- (BOOL)showUnreadConversationsWithLastConversation:(id)a3 ignoringMessages:(id)a4;
- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5;
- (CKAlertController)currentSMSRelayPinAlert;
- (CKAlertUtilities)alertUtilities;
- (CKBrowserViewControllerProtocol)prewarmedCameraBrowser;
- (CKConversation)currentConversation;
- (CKConversationListControllerProtocol)conversationListController;
- (CKCoreChatController)chatController;
- (CKCoreChatController)composeChatController;
- (CKDetailsNavigationController)detailsNavigationController;
- (CKInboxModel)inboxModel;
- (CKInteractionNotificationView)dismissOnInteractionView;
- (CKMacToolbarController)macToolbarController;
- (CKMessagesController)init;
- (CKMessagesController)initWithStyle:(int64_t)a3;
- (CKMessagesControllerDelegate)messagesControllerDelegate;
- (CKOnboardingController)onboardingController;
- (CKSelectionViewController)selectionViewController;
- (CKSendMenuPresentation)sendMenuPresentation;
- (NSArray)windowToConversationListConstraints;
- (NSMutableArray)pendingSMSRelayPINPrompts;
- (NSSet)alertSuppressionContexts;
- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3;
- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3;
- (UINavigationController)chatNavigationController;
- (UINavigationController)composeChatNavigationController;
- (UINavigationController)conversationListNavigationController;
- (UIViewController)inboxViewController;
- (UIViewController)statusBarStyleViewController;
- (double)_calculateConversationListColumnWidth;
- (double)_macConvertLegacySidebarWidthToModernWidth:(double)a3;
- (double)_sanitizeProposedConversationListWidth:(double)a3;
- (double)_splitViewController:(id)a3 constrainPrimaryColumnWidthForResizeWidth:(double)a4;
- (id)_fetchMeContactWithError:(id *)a3;
- (id)_newCameraBrowser;
- (id)_recentlyDeletedDisclosureText;
- (id)_sharedBalloonPluginManager;
- (id)_sourceViewForFluidTransitionWithConversation:(id)a3;
- (id)_unreadCountStringForFilterMode:(unint64_t)a3;
- (id)baseViewControllersForConversationListNavigationController;
- (id)childViewControllerForStatusBarHidden;
- (id)conversationList;
- (id)conversationListControllerIfInitialized;
- (id)conversationMatchingGUID:(id)a3;
- (id)currentlyShownConversation;
- (id)deferredHandleURLBlock;
- (id)dragControllerTranscriptDelegate;
- (id)firstConversationExactlyMatchingDisplayName:(id)a3;
- (id)inboxItemForFilterMode:(unint64_t)a3 localizedTitle:(id)a4 andSystemImage:(id)a5;
- (id)inboxItemForFilterMode:(unint64_t)a3 title:(id)a4 andSystemImage:(id)a5;
- (id)initAsOscarModal;
- (id)junkModalMessagesController;
- (id)navigationBarBackdropLayerGroupNameForChatController:(id)a3;
- (id)newInboxModel;
- (id)newInputSnapshotView;
- (id)nonConversationListControllersInNavigationStack;
- (id)onboardingControllerCreatingIfNecessary;
- (id)preferredFocusEnvironments;
- (id)presentingViewControllerForOnboardingController:(id)a3;
- (id)secondaryTextForSelectionViewController:(id)a3;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (int64_t)unreadCountForCurrentFilterModeForChatController:(id)a3;
- (unint64_t)currentConversationListFilterMode;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)selectedCountForSelectionViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)__updateAlertSuppressionContext;
- (void)_appStateChange:(id)a3;
- (void)_appStateDidResumeFromInactive:(id)a3;
- (void)_chatRegistryDidLoad:(id)a3;
- (void)_checkChatControllerLeaksForExistingController:(id)a3 newController:(id)a4;
- (void)_checkPushToTranscriptTimingWithStartTime:(double)a3;
- (void)_conversationFilteringStateChangedNotification:(id)a3;
- (void)_conversationLeft:(id)a3;
- (void)_conversationListFinishedMerging:(id)a3;
- (void)_handleInitialLoad;
- (void)_hideConversationListForIPadPPTTest;
- (void)_installTickerIfNeeded;
- (void)_junkConversationsRecovered:(id)a3;
- (void)_keyCommandChangeConversation:(BOOL)a3;
- (void)_pinVerificationShouldDismiss:(id)a3;
- (void)_populateChatNavigationControllerWithSelection;
- (void)_presentAppStoreWithLaunchURL:(id)a3 fromSourceApplication:(id)a4;
- (void)_setEntryViewHidden:(BOOL)a3;
- (void)_setIsShowingNoSelectionUI:(BOOL)a3;
- (void)_showChatControllerLeakAlertUI:(id)a3;
- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8 animated:(BOOL)a9 sendMessageHandler:(id)a10;
- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8 animated:(BOOL)a9 simID:(id)a10 sendMessageHandler:(id)a11;
- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8 startAudioRecording:(BOOL)a9 animated:(BOOL)a10 simID:(id)a11 sendMessageHandler:(id)a12;
- (void)_showNextSMSRelayPINPrompt;
- (void)_showSMSRelayPromptIfNeeded;
- (void)_showSMSRelayPromptOnLaunchIfNeeded;
- (void)_smsRelayPINReceived:(id)a3;
- (void)_splitViewController:(id)a3 willBeginResizingColumn:(int64_t)a4;
- (void)_unreadCountDidChange:(id)a3;
- (void)_updateAlertSuppressionContext;
- (void)_updateConversationListWidth;
- (void)_updateInboxWidth;
- (void)_updateSelectionViewWithCount:(int64_t)a3;
- (void)applicationWillResume:(id)a3;
- (void)cancelAndDestroyComposition;
- (void)cancelNewMessageCompositionAnimated:(BOOL)a3;
- (void)catalystFilterModeSelected:(unint64_t)a3;
- (void)catalystFiltersNavigationBackButtonTapped:(id)a3;
- (void)changeFilterMode:(unint64_t)a3;
- (void)chatController:(id)a3 didDetachDetailsNavigationController:(id)a4;
- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4;
- (void)chatController:(id)a3 didReportSpamForConversation:(id)a4;
- (void)chatController:(id)a3 didSendCompositionInConversation:(id)a4;
- (void)chatController:(id)a3 forwardComposition:(id)a4;
- (void)chatController:(id)a3 requestDeleteJunkConversation:(id)a4;
- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4;
- (void)chatController:(id)a3 requestRecoverJunkConversation:(id)a4;
- (void)chatController:(id)a3 shouldComposeAudioMessageWithRecipientAddresses:(id)a4;
- (void)chatController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4;
- (void)chatController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4 composition:(id)a5;
- (void)chatController:(id)a3 shouldComposeVideoMessageWithRecipientAddresses:(id)a4;
- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5;
- (void)chatControllerDidChangeDeferringSystemNavigationPopGestureForPlusButton:(id)a3;
- (void)chatControllerDidReselectConversation:(id)a3;
- (void)checkForRCSAndCarrierAlerts;
- (void)cleanUpBizNavBarForConversation:(id)a3;
- (void)composeChatController:(id)a3 didSelectNewConversation:(id)a4;
- (void)composeChatControllerDidCancelComposition:(id)a3;
- (void)conversationListControllerTappedDeleteNewMessage:(id)a3;
- (void)conversationListControllerWillDismissSearchResultsController;
- (void)conversationListControllerWillPresentSearchResultsController;
- (void)conversationListDidBeginMultipleSelectionWithInitialSelectedCount:(int64_t)a3;
- (void)conversationListFailedToSelectShownConversation;
- (void)conversationListIsDeletingConversations:(id)a3;
- (void)conversationListUpdatedSelectedIndexPathCount:(int64_t)a3;
- (void)conversationListWillBeginEditing:(BOOL)a3;
- (void)dealloc;
- (void)deleteAllButtonPressedOnSelectionViewController:(id)a3;
- (void)deleteButtonPressedOnSelectionViewController:(id)a3;
- (void)deleteConversation:(id)a3;
- (void)didBeginInstallingAppWithBundleIdentifier:(id)a3;
- (void)didDismissSendMenu:(id)a3 usingPresentationContext:(id)a4;
- (void)didFinishCheckingMissingCarrierSetting;
- (void)didReceiveMemoryWarning;
- (void)didSelectFilterFromViewMenu:(id)a3;
- (void)dismiss;
- (void)dismissAndReopenDetailsNavigationController;
- (void)dismissChatControllerIfVisibleAnimated:(BOOL)a3;
- (void)dismissDetailsControllerAnimated:(BOOL)a3;
- (void)dismissDetailsNavigationController;
- (void)dismissDetailsViewAndShowConversationList;
- (void)dismissKeyboardIfVisible;
- (void)dismissPhotosGridIfNeeded;
- (void)escButtonPressed:(id)a3;
- (void)executeDeferredHandleURLBlock;
- (void)executeDeferredTasks;
- (void)focusStateDidChange;
- (void)inboxViewController:(id)a3 didSelectFilterMode:(unint64_t)a4;
- (void)initialize;
- (void)keyCommandCompose:(id)a3;
- (void)keyCommandDeleteConversation:(id)a3;
- (void)keyCommandFind:(id)a3;
- (void)keyCommandNextConversation:(id)a3;
- (void)keyCommandOpenConversationInNewWindow:(id)a3;
- (void)keyCommandPreviousConversation:(id)a3;
- (void)keyCommandSelectFirstActiveConversation;
- (void)keyCommandSelectPinnedConversation:(id)a3;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)notifyThatKeepMessagesSettingWasResetIfNeededWithCompletion:(id)a3;
- (void)onboardingControllerDidFinish:(id)a3;
- (void)parentControllerDidBecomeActive;
- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4;
- (void)performJunkRecoveryForJunkModalMessagesController:(id)a3;
- (void)performResumeDeferredSetup;
- (void)performSearchForQuery:(id)a3;
- (void)performVisibleAppPluginIconPrefetch:(id)a3;
- (void)persistColumnWidths:(id)a3;
- (void)popToConversationListIfNecessaryAnimated:(BOOL)a3;
- (void)prepareForResume;
- (void)prepareForSuspend;
- (void)presentCKAlertController:(id)a3;
- (void)presentDetailsNavigationController:(id)a3;
- (void)presentDetailsViewControllerAnimated:(BOOL)a3;
- (void)presentFocusStatusAuthorizationAlertIfNecessary;
- (void)presentOnboardingViewController:(id)a3;
- (void)presentOnboardingViewControllerIfNeeded;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)recoverButtonPressedOnSelectionViewController:(id)a3;
- (void)requestDismissKeyboardSnapshotForSendMenu;
- (void)requestShowKeyboardSnapshotForSendMenu;
- (void)screenTimeOKPressedForChatController:(id)a3;
- (void)selectionViewControllerSelectedCompose;
- (void)setAlertUtilities:(id)a3;
- (void)setChatController:(id)a3;
- (void)setChatNavigationController:(id)a3;
- (void)setColumnResizeParams:(id *)a3;
- (void)setComposeChatController:(id)a3;
- (void)setComposeChatNavigationController:(id)a3;
- (void)setConversationListController:(id)a3;
- (void)setConversationListNavigationController:(id)a3;
- (void)setCurrentConversation:(id)a3;
- (void)setCurrentConversation:(id)a3 keepAllCurrentlyLoadedMessages:(BOOL)a4;
- (void)setCurrentSMSRelayPinAlert:(id)a3;
- (void)setDeferredHandleURLBlock:(id)a3;
- (void)setDetailsNavigationController:(id)a3;
- (void)setDismissOnInteractionView:(id)a3;
- (void)setForceOrientation:(BOOL)a3;
- (void)setInboxModel:(id)a3;
- (void)setInboxViewController:(id)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setMacToolbarController:(id)a3;
- (void)setMessagesControllerDelegate:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)setOscarModal:(BOOL)a3;
- (void)setPendingSMSRelayPINPrompts:(id)a3;
- (void)setPrewarmedCameraBrowser:(id)a3;
- (void)setSelectionViewController:(id)a3;
- (void)setSendMenuPresentation:(id)a3;
- (void)setStatusBarStyleViewController:(id)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setWindowToConversationListConstraints:(id)a3;
- (void)setupBizNavBarForConversation:(id)a3;
- (void)setupCKDismissOnInteractionView;
- (void)showBusinessChatNotSupportedAlert;
- (void)showConversation:(id)a3 animate:(BOOL)a4;
- (void)showConversation:(id)a3 animate:(BOOL)a4 forceToTranscript:(BOOL)a5 keepAllCurrentlyLoadedMessages:(BOOL)a6;
- (void)showConversation:(id)a3 animate:(BOOL)a4 forceToTranscript:(BOOL)a5 keepAllCurrentlyLoadedMessages:(BOOL)a6 userInitiated:(BOOL)a7;
- (void)showConversation:(id)a3 animate:(BOOL)a4 keepAllCurrentlyLoadedMessages:(BOOL)a5;
- (void)showConversation:(id)a3 animate:(BOOL)a4 userInitiated:(BOOL)a5;
- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 animate:(BOOL)a5;
- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 withInlineReplyOverlay:(BOOL)a5 animate:(BOOL)a6;
- (void)showConversationInNewWindow:(id)a3;
- (void)showConversationList;
- (void)showConversationListWithAnimation:(BOOL)a3;
- (void)showConversationListWithAnimation:(BOOL)a3 didDismissController:(BOOL *)a4;
- (void)showDebugMenu;
- (void)showInboxViewControllerAnimated:(BOOL)a3;
- (void)showLockdownAlertForBusinessChat;
- (void)showMakoIMessageAlert;
- (void)showNewMessageCompositionPanel;
- (void)showNewMessageCompositionPanelAppendingToExistingDraft:(id)a3 animated:(BOOL)a4;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 chatID:(id)a4 composition:(id)a5 appendToExistingDraft:(BOOL)a6 suggestedReplies:(id)a7 animated:(BOOL)a8 bizIntent:(id)a9 launchPluginWithBundleID:(id)a10 pluginLaunchPayload:(id)a11 startAudioRecording:(BOOL)a12 simID:(id)a13 sendMessageHandler:(id)a14;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 animated:(BOOL)a5;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 animated:(BOOL)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 appendToExistingDraft:(BOOL)a5 suggestedReplies:(id)a6 animated:(BOOL)a7 bizIntent:(id)a8 launchPluginWithBundleID:(id)a9 pluginLaunchPayload:(id)a10 sendMessageHandler:(id)a11;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 appendToExistingDraft:(BOOL)a5 suggestedReplies:(id)a6 animated:(BOOL)a7 bizIntent:(id)a8 launchPluginWithBundleID:(id)a9 pluginLaunchPayload:(id)a10 simID:(id)a11 sendMessageHandler:(id)a12;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 chatID:(id)a5 animated:(BOOL)a6;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 bizIntent:(id)a7 launchPluginWithBundleID:(id)a8 pluginLaunchPayload:(id)a9 sendMessageHandler:(id)a10;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 bizIntent:(id)a7 launchPluginWithBundleID:(id)a8 pluginLaunchPayload:(id)a9 simID:(id)a10 sendMessageHandler:(id)a11;
- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 sendMessageHandler:(id)a7;
- (void)showStoreForURL:(id)a3 fromSourceApplication:(id)a4;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4;
- (void)splitViewControllerDidCollapse:(id)a3;
- (void)splitViewControllerDidExpand:(id)a3;
- (void)stopForcingOrientation;
- (void)tearDownCKDismissOnInteractionView;
- (void)toggleSensitiveUI;
- (void)updateColumnWidths;
- (void)updateCompositionInEntryViewWithComposition:(id)a3;
- (void)updateInboxAndConversationList;
- (void)updateInterfaceOrientationsAnimated:(BOOL)a3;
- (void)updateSupportedInterfaceOrientations:(unint64_t)a3;
- (void)updatedFilterMode:(unint64_t)a3 previousFilterMode:(unint64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKMessagesController

- (id)childViewControllerForStatusBarHidden
{
  if ([(CKMessagesController *)self isCollapsed]) {
    [(CKMessagesController *)self conversationListNavigationController];
  }
  else {
  v3 = [(CKMessagesController *)self chatNavigationController];
  }

  return v3;
}

- (UINavigationController)conversationListNavigationController
{
  conversationListNavigationController = self->_conversationListNavigationController;
  if (!conversationListNavigationController)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = (objc_class *)[v4 conversationListNavigationControllerClass];

    v6 = +[CKUIBehavior sharedBehaviors];
    uint64_t v7 = [v6 navigationBarClass];

    if (CKIsRunningInMacCatalyst()) {
      uint64_t v8 = objc_opt_class();
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = (UINavigationController *)[[v5 alloc] initWithNavigationBarClass:v7 toolbarClass:v8];
    v10 = self->_conversationListNavigationController;
    self->_conversationListNavigationController = v9;

    v11 = [(UINavigationController *)self->_conversationListNavigationController navigationBar];
    v12 = +[CKUIBehavior sharedBehaviors];
    v13 = [v12 theme];
    objc_msgSend(v11, "setBarStyle:", objc_msgSend(v13, "navBarStyle"));

    v14 = [(UINavigationController *)self->_conversationListNavigationController navigationBar];
    [v14 setTranslucent:1];

    v15 = [(UINavigationController *)self->_conversationListNavigationController navigationBar];
    [v15 setPrefersLargeTitles:CKIsRunningInMacCatalyst() == 0];

    [(UINavigationController *)self->_conversationListNavigationController _setClipUnderlapWhileTransitioning:1];
    [(UINavigationController *)self->_conversationListNavigationController setDelegate:self];
    [(CKMessagesController *)self updateInboxAndConversationList];
    conversationListNavigationController = self->_conversationListNavigationController;
  }

  return conversationListNavigationController;
}

- (void)_checkChatControllerLeaksForExistingController:(id)a3 newController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  uint64_t v8 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v8 isInternalInstall])
  {
    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v10 = [v9 BOOLForKey:@"checkForChatControllerLeaks"];

    if (v10)
    {
      objc_storeWeak(&location, v6);
      if (v6)
      {
        if (v6 != v7)
        {
          dispatch_time_t v11 = dispatch_time(0, 3000000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __85__CKMessagesController__checkChatControllerLeaksForExistingController_newController___block_invoke;
          block[3] = &unk_1E5622AB8;
          objc_copyWeak(&v13, &location);
          block[4] = self;
          dispatch_after(v11, MEMORY[0x1E4F14428], block);
          objc_destroyWeak(&v13);
        }
      }
    }
  }
  else
  {
  }
  objc_destroyWeak(&location);
}

- (void)performResumeDeferredSetup
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "performResumeDeferredSetup", buf, 2u);
    }
  }
  [(CKMessagesController *)self checkForRCSAndCarrierAlerts];
  id v4 = (id)[MEMORY[0x1E4F6E6D0] sharedManager];
  if (CKIsRunningInMessages()) {
    CKPrewarmResumeDeferredSetup();
  }
  v5 = [(CKMessagesController *)self chatController];
  [v5 performResumeDeferredSetup];

  id v6 = [(CKMessagesController *)self composeChatController];
  [v6 performResumeDeferredSetup];

  id v7 = [(CKMessagesController *)self conversationListController];
  [v7 performResumeDeferredSetup];

  if (CKDeviceSupportsPerseus())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [(CKMessagesController *)self conversationList];
    v9 = [v8 conversations];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      int v11 = 0;
      uint64_t v12 = *(void *)v20;
LABEL_10:
      uint64_t v13 = 0;
      if (v11 <= 50) {
        int v14 = 50;
      }
      else {
        int v14 = v11;
      }
      uint64_t v15 = (v14 - v11);
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        if ((unint64_t)[v16 recipientCount] >= 2) {
          id v17 = (id)[v16 orderedContactsForAvatarView];
        }
        if (([v16 hasDisplayName] & 1) == 0) {
          id v18 = (id)[v16 name];
        }
        if (v15 == v13) {
          break;
        }
        if (v10 == ++v13)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
          v11 += v13;
          if (v10) {
            goto LABEL_10;
          }
          break;
        }
      }
    }
  }
}

- (id)conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (void)dismissPhotosGridIfNeeded
{
  v3 = [(CKMessagesController *)self conversationListNavigationController];
  id v4 = [v3 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(CKMessagesController *)self conversationListNavigationController];
LABEL_5:
    uint64_t v10 = v6;
    id v24 = [v6 visibleViewController];
    goto LABEL_6;
  }
  id v7 = [(CKMessagesController *)self chatNavigationController];
  uint64_t v8 = [v7 visibleViewController];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    id v6 = [(CKMessagesController *)self chatNavigationController];
    goto LABEL_5;
  }
  int v11 = [(CKMessagesController *)self conversationListNavigationController];
  uint64_t v12 = [v11 visibleViewController];
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  if (v13)
  {
    int v14 = [(CKMessagesController *)self conversationListNavigationController];
  }
  else
  {
    uint64_t v15 = [(CKMessagesController *)self chatNavigationController];
    v16 = [v15 visibleViewController];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) == 0) {
      return;
    }
    int v14 = [(CKMessagesController *)self chatNavigationController];
  }
  id v18 = v14;
  uint64_t v10 = [v14 visibleViewController];

  long long v19 = [v10 presentingViewController];
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  if (v20)
  {
    long long v21 = [v10 presentingViewController];
    long long v22 = [v21 topViewController];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      id v24 = [v21 topViewController];
      [v10 dismissViewControllerAnimated:0 completion:0];
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }
LABEL_6:

  if (v24)
  {
    [v24 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)loadView
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v23 loadView];
  v3 = +[CKUIBehavior sharedBehaviors];
  id v4 = [v3 theme];
  v5 = [v4 messagesControllerBackgroundColor];

  if (v5)
  {
    id v6 = [(CKMessagesController *)self view];
    [v6 setBackgroundColor:v5];
  }
  id v7 = [(CKMessagesController *)self chatNavigationController];
  uint64_t v8 = [v7 viewControllers];
  uint64_t v9 = [v8 count];

  if (!v9) {
    [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];
  }
  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    uint64_t v10 = +[CKUIBehavior sharedBehaviors];
    [v10 minConversationListWidth];
    -[CKMessagesController setMinimumSupplementaryColumnWidth:](self, "setMinimumSupplementaryColumnWidth:");

    if (CKIsRunningInMacCatalyst())
    {
      int v11 = [(CKMessagesController *)self view];
      [v11 setOpaque:0];

      uint64_t v12 = 1;
      [(CKMessagesController *)self setPrimaryBackgroundStyle:1];
      uint64_t v13 = 4;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v12 = 3;
      uint64_t v13 = 2;
    }
    [(CKMessagesController *)self setPreferredDisplayMode:v13];
    [(CKMessagesController *)self setPreferredSplitBehavior:v12];
    [(CKMessagesController *)self setDisplayModeButtonVisibility:v14];
    long long v21 = [(CKMessagesController *)self conversationListNavigationController];
    [(CKMessagesController *)self setViewController:v21 forColumn:1];

    long long v22 = [(CKMessagesController *)self chatNavigationController];
    [(CKMessagesController *)self setViewController:v22 forColumn:2];
  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      uint64_t v15 = [(CKMessagesController *)self view];
      [v15 setOpaque:0];

      [(CKMessagesController *)self setPrimaryBackgroundStyle:1];
    }
    BOOL v16 = [(CKMessagesController *)self isOscarModal];
    uint64_t v17 = [(CKMessagesController *)self conversationListNavigationController];
    id v18 = (void *)v17;
    if (v16)
    {
      v25[0] = v17;
      long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [(CKMessagesController *)self setViewControllers:v19];
    }
    else
    {
      v24[0] = v17;
      long long v19 = [(CKMessagesController *)self chatNavigationController];
      v24[1] = v19;
      char v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      [(CKMessagesController *)self setViewControllers:v20];
    }
    [(CKMessagesController *)self setPreferredDisplayMode:2];
  }
  [(CKMessagesController *)self updateInboxAndConversationList];
  [(CKMessagesController *)self setDelegate:self];
}

uint64_t __76__CKMessagesController_navigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isCollapsed];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 chatNavigationController];
    v5 = [v4 viewControllers];
    uint64_t v6 = [v5 count];

    id v7 = [*(id *)(a1 + 32) viewControllers];
    uint64_t v8 = [*(id *)(a1 + 32) chatNavigationController];
    int v9 = [v7 containsObject:v8];

    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v18[0] = 67109376;
        v18[1] = v6 != 0;
        __int16 v19 = 1024;
        int v20 = v9;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "removing stale transcript: chatNavigationControllerHadViewControllers: %{BOOL}d, isChatNavigationControllerChildViewController: %{BOOL}d", (uint8_t *)v18, 0xEu);
      }
    }
    BOOL v11 = v6 != 0;
    uint64_t v12 = [*(id *)(a1 + 32) chatNavigationController];
    [v12 setViewControllers:MEMORY[0x1E4F1CBF0]];

    if ((v11 & v9) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Updating viewControllers because chatNav is in the stack but has no child viewControllers", (uint8_t *)v18, 2u);
        }
      }
      [*(id *)(a1 + 32) updateInboxAndConversationList];
    }
  }
  else
  {
    [v3 _populateChatNavigationControllerWithSelection];
  }
  uint64_t v15 = *(void **)(a1 + 32);
  uint64_t v14 = (id *)(a1 + 32);
  BOOL v16 = [v15 chatController];
  [v16 setDelegate:0];

  [*v14 setChatController:0];
  return [*v14 setCurrentConversation:0];
}

- (void)updateInboxAndConversationList
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "updateInboxAndConversationList", (uint8_t *)&v24, 2u);
    }
  }
  id v4 = [(CKMessagesController *)self baseViewControllersForConversationListNavigationController];
  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    if ([(CKMessagesController *)self _shouldShowInboxView])
    {
      v5 = [(CKMessagesController *)self inboxViewController];
      uint64_t v6 = [v5 navigationItem];
      id v7 = CKFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"FILTERS_BACK_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v6 setBackButtonTitle:v8];

      [(CKMessagesController *)self setPresentsWithGesture:CKIsRunningInMacCatalyst() == 0];
      int v9 = [(CKMessagesController *)self inboxViewController];
      [(CKMessagesController *)self setViewController:v9 forColumn:0];

      uint64_t v10 = [(CKMessagesController *)self inboxViewController];
      BOOL v11 = [v10 navigationController];
      uint64_t v12 = [v11 navigationBar];
      [v12 setPrefersLargeTitles:1];

      uint64_t v13 = [(CKMessagesController *)self navigationItem];
      [v13 setLargeTitleDisplayMode:1];
    }
    else
    {
      [(CKMessagesController *)self setInboxViewController:0];
      [(CKMessagesController *)self setPresentsWithGesture:0];
      [(CKMessagesController *)self setViewController:0 forColumn:0];
    }
    if (CKWantsInboxVisible()) {
      [(CKMessagesController *)self showColumn:0];
    }
    else {
      [(CKMessagesController *)self hideColumn:0];
    }
  }
  uint64_t v14 = [(CKMessagesController *)self chatNavigationController];
  uint64_t v15 = [v14 viewControllers];
  if ([v15 count])
  {
    BOOL v16 = [(CKMessagesController *)self conversationListNavigationController];
    uint64_t v17 = [v16 viewControllers];
    id v18 = [(CKMessagesController *)self chatNavigationController];
    int v19 = [v17 containsObject:v18];

    if (!v19) {
      goto LABEL_21;
    }
    if (IMOSLoggingEnabled())
    {
      int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [(CKMessagesController *)self chatNavigationController];
        int v24 = 138412546;
        uint64_t v25 = v21;
        __int16 v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "updateInboxAndConversationList, adding chatNavigationController: %@ to updatedConversationListNavStack: %@", (uint8_t *)&v24, 0x16u);
      }
    }
    uint64_t v14 = [(CKMessagesController *)self chatNavigationController];
    [v4 addObject:v14];
  }
  else
  {
  }
LABEL_21:
  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      uint64_t v25 = v4;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "updateInboxAndConversationList, setting conversationListNavigationController viewControllers to: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  objc_super v23 = [(CKMessagesController *)self conversationListNavigationController];
  [v23 setViewControllers:v4];
}

- (UINavigationController)chatNavigationController
{
  if (!self->_chatNavigationController)
  {
    v3 = +[CKUIBehavior sharedBehaviors];
    id v4 = (objc_class *)[v3 conversationListNavigationControllerClass];

    id v5 = [v4 alloc];
    uint64_t v6 = +[CKUIBehavior sharedBehaviors];
    id v7 = (UINavigationController *)objc_msgSend(v5, "initWithNavigationBarClass:toolbarClass:", objc_msgSend(v6, "navigationBarClass"), 0);
    chatNavigationController = self->_chatNavigationController;
    self->_chatNavigationController = v7;

    [(UINavigationController *)self->_chatNavigationController setDelegate:self];
    int v9 = +[CKUIBehavior sharedBehaviors];
    LODWORD(v6) = [v9 useMacToolbar];

    if (v6)
    {
      [(UINavigationController *)self->_chatNavigationController setNavigationBarHidden:1];
    }
    else
    {
      uint64_t v10 = +[CKUIBehavior sharedBehaviors];
      BOOL v11 = [v10 theme];
      uint64_t v12 = [v11 navBarStyle];
      uint64_t v13 = [(UINavigationController *)self->_chatNavigationController navigationBar];
      [v13 setBarStyle:v12];

      uint64_t v14 = +[CKUIBehavior sharedBehaviors];
      uint64_t v15 = [v14 shouldUseTranslucentBars];
      BOOL v16 = [(UINavigationController *)self->_chatNavigationController navigationBar];
      [v16 setTranslucent:v15];

      uint64_t v17 = +[CKUIBehavior sharedBehaviors];
      id v18 = [(CKMessagesController *)self conversationListNavigationController];
      [v17 setupNavBarAppearanceWithNavigationController:v18];
    }
  }
  int v19 = self->_chatNavigationController;

  return v19;
}

- (id)baseViewControllersForConversationListNavigationController
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if (![(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    if ([(CKMessagesController *)self _shouldShowInboxView])
    {
      id v4 = [(CKMessagesController *)self inboxViewController];

      if (v4)
      {
        id v5 = [(CKMessagesController *)self inboxViewController];
        [v3 addObject:v5];
      }
    }
  }
  uint64_t v6 = [(CKMessagesController *)self conversationListController];
  [v6 updateNavigationItems];

  id v7 = [(CKMessagesController *)self conversationListController];
  [v3 addObject:v7];

  return v3;
}

- (CKConversationListControllerProtocol)conversationListController
{
  conversationListController = self->_conversationListController;
  if (!conversationListController)
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    uint64_t v5 = [v4 conversationListControllerClass];

    if (IMIsOscarEnabled()
      && [(CKMessagesController *)self isOscarModal]
      && v5 == objc_opt_class())
    {
      uint64_t v6 = [[CKConversationListCollectionViewController alloc] initForOscarModal];
    }
    else
    {
      uint64_t v6 = (CKConversationListControllerProtocol *)objc_opt_new();
    }
    id v7 = self->_conversationListController;
    self->_conversationListController = v6;

    [(CKConversationListControllerProtocol *)self->_conversationListController setDelegate:self];
    conversationListController = self->_conversationListController;
  }

  return conversationListController;
}

- (void)viewDidLayoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v52 viewDidLayoutSubviews];
  [(CKMessagesController *)self _handleInitialLoad];
  [(CKSendMenuPresentation *)self->_sendMenuPresentation layout];
  v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 useMacToolbar];

  if (v4)
  {
    uint64_t v5 = [(CKMessagesController *)self view];
    uint64_t v6 = [v5 window];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    uint64_t v13 = +[CKUIBehavior sharedBehaviors];
    [v13 macAppKitToolbarHeight];
    double v15 = v14;

    BOOL v16 = [(CKMessagesController *)self macToolbarController];
    objc_msgSend(v16, "updateWithFrame:", v8, v10, v12, v15);

    if ([(CKMessagesController *)self _wantsThreeColumnLayout])
    {
      [(CKMessagesController *)self supplementaryColumnWidth];
      double v18 = v17;
      if ([(CKMessagesController *)self displayMode] == 4)
      {
        [(CKMessagesController *)self primaryColumnWidth];
        double v18 = v18 + v19;
      }
    }
    else
    {
      [(CKMessagesController *)self primaryColumnWidth];
      double v18 = v20;
    }
    uint64_t v21 = [(CKMessagesController *)self view];
    int v22 = [v21 _shouldReverseLayoutDirection];

    if (v22)
    {
      objc_super v23 = [(CKMessagesController *)self view];
      [v23 frame];
      double v25 = v24 - v18;
      __int16 v26 = [(CKMessagesController *)self macToolbarController];
      [v26 setSplitViewDividerXPosition:v25];
    }
    else
    {
      objc_super v23 = [(CKMessagesController *)self macToolbarController];
      [v23 setSplitViewDividerXPosition:v18];
    }
  }
  if ([(CKMessagesController *)self _wantsThreeColumnLayout]
    && [(CKMessagesController *)self splitBehavior] == 3
    && [(CKMessagesController *)self displayMode] != 2)
  {
    v27 = [(CKMessagesController *)self chatController];
    uint64_t v28 = [v27 presentedViewController];
    v29 = [v28 presentedViewController];
    v30 = [v29 childViewControllers];
    uint64_t v31 = [v30 count];

    if (v31)
    {
      v32 = [(CKMessagesController *)self chatController];
      v33 = [v32 presentedViewController];
      v34 = [v33 presentedViewController];
      v35 = [v34 childViewControllers];
      v36 = [v35 objectAtIndex:0];

      if (v36) {
        goto LABEL_17;
      }
    }
    v36 = [(CKMessagesController *)self chatController];
    if (v36
      || ([(CKMessagesController *)self composeChatController],
          (v36 = objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_17:
      v37 = +[CKUIBehavior sharedBehaviors];
      char v38 = [v37 entryViewFollowsKeyboardLayoutGuide];

      if ((v38 & 1) == 0)
      {
        v39 = [v36 entryView];
        [v39 frame];
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        v46 = [(CKMessagesController *)self chatNavigationController];
        v47 = [v46 view];
        [v47 frame];
        double v49 = v48;

        objc_msgSend(v39, "setFrame:", v49, v41, v43, v45);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v50 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_18EF18000, v50, OS_LOG_TYPE_INFO, "Could not find a chatController to pull entryView from", v51, 2u);
        }
      }
      v36 = 0;
    }
  }
}

- (void)_handleInitialLoad
{
  if ([(CKMessagesController *)self isInitialLoad])
  {
    [(CKMessagesController *)self setIsInitialLoad:0];
    v3 = [(CKMessagesController *)self onboardingControllerCreatingIfNecessary];
    char v4 = [v3 shouldPresentOnboarding];

    if ((v4 & 1) == 0)
    {
      [(CKMessagesController *)self setOnboardingController:0];
      [(CKMessagesController *)self executeDeferredTasks];
    }
  }
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (BOOL)shouldPresentOnboarding
{
  v3 = [(CKMessagesController *)self onboardingController];

  if (v3)
  {
    char v4 = [(CKMessagesController *)self onboardingController];
    char v5 = [v4 shouldPresentOnboarding];

    return v5;
  }
  else
  {
    double v7 = [(CKMessagesController *)self onboardingControllerCreatingIfNecessary];
    char v8 = [v7 shouldPresentOnboarding];

    [(CKMessagesController *)self setOnboardingController:0];
    return v8;
  }
}

- (CKOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (id)onboardingControllerCreatingIfNecessary
{
  onboardingController = self->_onboardingController;
  if (!onboardingController)
  {
    char v4 = objc_alloc_init(CKOnboardingController);
    char v5 = self->_onboardingController;
    self->_onboardingController = v4;

    [(CKOnboardingController *)self->_onboardingController setDelegate:self];
    onboardingController = self->_onboardingController;
  }

  return onboardingController;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void)setCurrentConversation:(id)a3
{
}

- (void)setChatController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v4 = (CKCoreChatController *)a3;
  char v5 = v4;
  chatController = self->_chatController;
  if (chatController) {
    BOOL v7 = chatController == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    char v8 = [(CKMessagesController *)self chatNavigationController];
    double v9 = [v8 viewControllers];
    int v10 = [v9 containsObject:self->_chatController];

    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        double v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          double v12 = self->_chatController;
          int v17 = 138412290;
          double v18 = v12;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKMessagesController: Old chatController (%@) is still in chatNavigationController.viewControllers", (uint8_t *)&v17, 0xCu);
        }
      }
    }
  }
  p_chatController = &self->_chatController;
  [(CKMessagesController *)self _checkChatControllerLeaksForExistingController:self->_chatController newController:v5];
  double v14 = self->_chatController;
  *p_chatController = v5;
  double v15 = v5;

  BOOL v16 = +[CKLinkIntentsManager sharedManager];
  [v16 registerChatController:v15];
}

- (id)presentingViewControllerForOnboardingController:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKMessagesController *)self onboardingController];

  if (v5 == v4)
  {
    BOOL v7 = self;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
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

- (void)presentFocusStatusAuthorizationAlertIfNecessary
{
  if ([(CKMessagesController *)self onboardingControllerIsActive])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v3 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v8 = 0;
    id v4 = "Not presenting focus status authorization alert, onboarding controller is active";
    id v5 = (uint8_t *)&v8;
LABEL_12:
    _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
LABEL_13:

    return;
  }
  if (([MEMORY[0x1E4F6E730] supportsFocus] & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v3 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v4 = "Not presenting focus status authorization alert as it is not supported";
    id v5 = buf;
    goto LABEL_12;
  }
  id v6 = +[CKFocusStatusAuthorizationManager sharedInstance];
  [v6 presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:self];
}

- (BOOL)onboardingControllerIsActive
{
  int v2 = [(CKMessagesController *)self onboardingController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)executeDeferredTasks
{
  [(CKMessagesController *)self executeDeferredHandleURLBlock];
  id location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__CKMessagesController_executeDeferredTasks__block_invoke;
  v3[3] = &unk_1E56215C8;
  objc_copyWeak(&v4, &location);
  [(CKMessagesController *)self notifyThatKeepMessagesSettingWasResetIfNeededWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)executeDeferredHandleURLBlock
{
  deferredHandleURLBlock = (void (**)(id, SEL))self->_deferredHandleURLBlock;
  if (deferredHandleURLBlock)
  {
    deferredHandleURLBlock[2](deferredHandleURLBlock, a2);
    id v4 = self->_deferredHandleURLBlock;
    self->_deferredHandleURLBlock = 0;
  }
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  id v4 = [(CKMessagesController *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(CKMessagesController *)self chatController];
    BOOL v7 = [v6 navbarCanvasViewController];
    [v7 updateAvatarPickerDelegate];
  }
  id v8 = [(CKMessagesController *)self inboxModel];
  [v8 setIsCollapsed:1];
}

- (CKInboxModel)inboxModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxModel);

  return (CKInboxModel *)WeakRetained;
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(CKMessagesController *)self chatController];
  id v4 = [v3 conversation];
  id v5 = [v4 chat];

  if (v5 && ![v5 allowedToShowConversation])
  {
    BOOL v8 = 0;
  }
  else
  {
    chatNavigationController = self->_chatNavigationController;
    if (chatNavigationController)
    {
      unsigned __int8 v7 = [(UINavigationController *)chatNavigationController becomeFirstResponder];
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CKMessagesController;
      unsigned __int8 v7 = [(CKMessagesController *)&v10 becomeFirstResponder];
    }
    BOOL v8 = v7;
  }

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[CKMessagesController viewDidAppear:]";
      __int16 v22 = 2112;
      objc_super v23 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    unsigned __int8 v7 = @"NO";
    if (v3) {
      unsigned __int8 v7 = @"YES";
    }
    int v17 = "-[CKMessagesController viewDidAppear:]";
    double v18 = v7;
    _CKLog();
  }
  v19.receiver = self;
  v19.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewDidAppear:](&v19, sel_viewDidAppear_, v3, v17, v18);
  [(CKMessagesController *)self _installTickerIfNeeded];
  if ([(CKMessagesController *)self isOscarModal])
  {
    [(CKMessagesController *)self showConversationListWithAnimation:0];
    [(CKMessagesController *)self changeFilterMode:9];
  }
  else if (![(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    BOOL v8 = [(CKMessagesController *)self isCollapsed];
    int v9 = [(CKMessagesController *)self chatNavigationController];
    objc_super v10 = [v9 childViewControllers];
    uint64_t v11 = [v10 firstObject];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    if (((v8 & isKindOfClass ^ 1 | [(CKMessagesController *)self isComposingMessage]) & 1) == 0) {
      [(CKMessagesController *)self showConversationListWithAnimation:1];
    }
  }
  [(CKMessagesController *)self _updateAlertSuppressionContext];
  kdebug_trace();
  uint64_t v13 = IMClientTelemetryLogHandle();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ClientLaunchToViewAppears", " enableTelemetry=YES ", buf, 2u);
  }

  if (CKIsRunningInMacCatalyst() && [(CKMessagesController *)self daemonIsConnected])
  {
    double v14 = +[CKConversationList sharedConversationList];
    char v15 = [v14 hasActiveConversations];

    if ((v15 & 1) == 0)
    {
      BOOL v16 = [(CKMessagesController *)self conversationListController];
      [v16 composeButtonClicked:self];
    }
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v8 = (__CFString *)a3;
  int v9 = (__CFString *)a4;
  if (IMOSLoggingEnabled())
  {
    objc_super v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = @"NO";
      *(_DWORD *)buf = 138412802;
      double v49 = v8;
      __int16 v50 = 2112;
      if (v5) {
        uint64_t v11 = @"YES";
      }
      v51 = v9;
      __int16 v52 = 2112;
      v53 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Navigation controller: %@ didShowViewController: %@ animated: %@", buf, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    double v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(__CFString *)v8 topViewController];
      *(_DWORD *)buf = 138412290;
      double v49 = v13;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Navigation controller top view controller: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    double v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      char v15 = [(CKMessagesController *)self conversationListNavigationController];
      BOOL v16 = [(CKMessagesController *)self conversationListNavigationController];
      int v17 = [v16 viewControllers];
      *(_DWORD *)buf = 138412546;
      double v49 = v15;
      __int16 v50 = 2112;
      v51 = v17;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Conv list nav controller %@ VCs: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    double v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_super v19 = [(CKMessagesController *)self chatNavigationController];
      double v20 = [(CKMessagesController *)self chatNavigationController];
      uint64_t v21 = [v20 viewControllers];
      *(_DWORD *)buf = 138412546;
      double v49 = v19;
      __int16 v50 = 2112;
      v51 = v21;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Chat nav controller %@ VCs: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_super v23 = [(CKMessagesController *)self chatController];
      uint64_t v24 = [(CKMessagesController *)self chatController];
      double v25 = [v24 conversation];
      __int16 v26 = [(CKMessagesController *)self chatController];
      v27 = [v26 parentViewController];
      *(_DWORD *)buf = 138412802;
      double v49 = v23;
      __int16 v50 = 2112;
      v51 = v25;
      __int16 v52 = 2112;
      v53 = v27;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Chat controller: %@, conv: %@,  parent: %@", buf, 0x20u);
    }
  }
  uint64_t v28 = [(CKMessagesController *)self conversationListNavigationController];

  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    v29 = [(CKMessagesController *)self conversationListController];
    BOOL v30 = v29 == v9;
  }
  else
  {
    BOOL v30 = 0;
  }
  if (v28 != v8 && !v30)
  {
    uint64_t v31 = [(CKMessagesController *)self composeChatController];
    BOOL v32 = v31 == v9;

    if (v32
      && [(id)__CurrentTestName rangeOfString:@"ShowNewCompose"] != 0x7FFFFFFFFFFFFFFFLL
      && ![(CKMessagesController *)self isCollapsed])
    {
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v33 postNotificationName:@"PPTDidShowNewComposeEvent" object:0 userInfo:0];
    }
    goto LABEL_52;
  }
  if (IMOSLoggingEnabled())
  {
    v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      BOOL v35 = [(CKMessagesController *)self isCollapsed];
      BOOL v36 = [(CKMessagesController *)self isShowingChatController];
      v37 = @"NO";
      if (v35) {
        char v38 = @"YES";
      }
      else {
        char v38 = @"NO";
      }
      if (v36) {
        v37 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      double v49 = v38;
      __int16 v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Split controller collapsed: %@ showingChatController: %@", buf, 0x16u);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__CKMessagesController_navigationController_didShowViewController_animated___block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  v39 = (void (**)(void))_Block_copy(aBlock);
  double v40 = [(CKMessagesController *)self conversationListController];
  if (v40 != v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_46;
    }
  }
  if (![(CKMessagesController *)self isCollapsed]) {
    goto LABEL_46;
  }
  BOOL v41 = [(CKMessagesController *)self isShowingChatController];

  if (!v41)
  {
    double v40 = [(CKMessagesController *)self chatController];
    [(__CFString *)v40 forciblyUnloadChatInputController];
    v39[2](v39);
LABEL_46:
  }
  [(__CFString *)v8 __ck_callDelegateBlocks];
  [(CKMessagesController *)self _updateAlertSuppressionContext];
  double v42 = [(CKMessagesController *)self chatNavigationController];
  BOOL v43 = v42 == v9;

  if (v43)
  {
    double v44 = [(CKMessagesController *)self conversationListController];
    double v45 = [(__CFString *)v8 viewControllers];
    char v46 = [v45 containsObject:v44];

    if ((v46 & 1) == 0) {
      [(CKMessagesController *)self updateInboxAndConversationList];
    }
  }
LABEL_52:
  self->hasBegunShowingConversationList = 0;
}

- (void)_updateAlertSuppressionContext
{
  if ((IMSupportsUserNotifications() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Requested deferred update of alert suppression contexts", v4, 2u);
      }
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___updateAlertSuppressionContext object:0];
    [(CKMessagesController *)self performSelector:sel___updateAlertSuppressionContext withObject:0 afterDelay:0.2];
  }
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessagesController;
  unint64_t v3 = [(CKMessagesController *)&v7 preferredScreenEdgesDeferringSystemGestures];
  id v4 = [(CKMessagesController *)self chatController];
  BOOL v5 = v4;
  if (v4) {
    v3 |= [v4 preferredScreenEdgesDeferringSystemGestures];
  }

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (CKIsRunningInMacCatalyst())
  {
    v23.receiver = self;
    v23.super_class = (Class)CKMessagesController;
    return [(CKMessagesController *)&v23 supportedInterfaceOrientations];
  }
  if (!self->_forceOrientation || (uint64_t supportedInterfaceOrientations = self->_supportedInterfaceOrientations) == 0)
  {
    BOOL v5 = [(CKMessagesController *)self chatController];
    char v6 = [v5 isHandwritingLandscape];

    if (v6) {
      return 2;
    }
    objc_super v7 = [(CKMessagesController *)self chatController];
    BOOL v8 = [v7 conversation];
    if ([v8 isStewieConversation])
    {
      int v9 = [MEMORY[0x1E4F6BC48] sharedInstance];
      char v10 = [v9 isStewieActive];

      if (v10) {
        return 2;
      }
    }
    else
    {
    }
    uint64_t v11 = [(CKMessagesController *)self presentedViewController];
    if (v11
      && (double v12 = (void *)v11,
          [(CKMessagesController *)self presentedViewController],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v13,
          v12,
          (isKindOfClass & 1) == 0))
    {
      char v15 = [(CKMessagesController *)self presentedViewController];
      uint64_t supportedInterfaceOrientations = [v15 supportedInterfaceOrientations];
    }
    else
    {
      v22.receiver = self;
      v22.super_class = (Class)CKMessagesController;
      uint64_t supportedInterfaceOrientations = [(CKMessagesController *)&v22 supportedInterfaceOrientations];
    }
    if (!CKIsRunningInMacCatalyst())
    {
      BOOL v16 = [MEMORY[0x1E4F42D90] mainScreen];
      [v16 _referenceBounds];
      if (v17 <= 320.0)
      {
        double v18 = [(CKMessagesController *)self viewIfLoaded];
        objc_super v19 = [v18 window];
        [v19 safeAreaInsets];
        double v21 = v20;

        if (v21 > 0.0) {
          return supportedInterfaceOrientations & 0xFFFFFFFFFFFFFFE7;
        }
      }
      else
      {
      }
    }
  }
  return supportedInterfaceOrientations;
}

- (CKCoreChatController)chatController
{
  return self->_chatController;
}

- (BOOL)isShowingChatController
{
  int v2 = [(CKMessagesController *)self chatController];
  unint64_t v3 = [v2 viewIfLoaded];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)focusStateDidChange
{
  if ([(CKMessagesController *)self isShowingInboxViewController]
    && ![(CKMessagesController *)self _shouldShowInboxView])
  {
    [(CKMessagesController *)self showConversationListWithAnimation:1];
  }

  [(CKMessagesController *)self updateInboxAndConversationList];
}

- (BOOL)isShowingInboxViewController
{
  int v2 = [(CKMessagesController *)self inboxViewController];
  unint64_t v3 = [v2 viewIfLoaded];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (UIViewController)inboxViewController
{
  if (!self->_inboxViewController && [(CKMessagesController *)self _shouldShowInboxView])
  {
    unint64_t v3 = [CKInboxViewController alloc];
    id v4 = [(CKMessagesController *)self conversationListController];
    BOOL v5 = [(CKInboxViewController *)v3 initWithConversationListController:v4];

    [(UIViewController *)v5 setDelegate:self];
    inboxViewController = self->_inboxViewController;
    self->_inboxViewController = v5;
  }
  objc_super v7 = self->_inboxViewController;

  return v7;
}

- (void)_installTickerIfNeeded
{
  unint64_t v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v6 = [v5 BOOLForKey:@"showTickerHUD"];

    if (v6)
    {
      objc_super v7 = [(CKMessagesController *)self view];
      BOOL v8 = [v7 window];
      id v12 = [v8 windowScene];

      if (v12)
      {
        int v9 = +[CKDebugTicker sharedTicker];
        char v10 = [(CKMessagesController *)self view];
        uint64_t v11 = [v10 window];
        [v9 installUIWithWindowScene:v12 parentWindow:v11];
      }
    }
  }
}

- (BOOL)_wantsThreeColumnLayout
{
  if ([(CKMessagesController *)self isOscarModal]) {
    return 0;
  }
  unint64_t v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 wantsUniversalThreeColumn];

  return v4;
}

- (BOOL)isOscarModal
{
  return self->_oscarModal;
}

- (BOOL)_shouldShowInboxView
{
  return CKShouldShowInboxView() != 0;
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v2 viewWillLayoutSubviews];
}

- (double)_calculateConversationListColumnWidth
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v2 = CKNonFlatDeviceOrientation();
  unint64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 conversationListWidthForInterfaceOrientation:v2];
  double v5 = v4;

  int v6 = [MEMORY[0x1E4F42D90] mainScreen];
  int v7 = objc_msgSend(v6, "__ck_isFullscreen");

  BOOL v8 = +[CKUIBehavior sharedBehaviors];
  [v8 minConversationListWidth];
  double v10 = v9;

  if (v7) {
    double v11 = v5;
  }
  else {
    double v11 = v10;
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [NSNumber numberWithInteger:v2];
      int v15 = 134219010;
      double v16 = v11;
      __int16 v17 = 2112;
      double v18 = v13;
      __int16 v19 = 2048;
      double v20 = v5;
      __int16 v21 = 1024;
      int v22 = v7;
      __int16 v23 = 2048;
      double v24 = v10;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "_calculateConversationListColumnWidth columnWidth: %f, orientation: %@, widthForCurrentOrientation: %f, isFullScreen: %{BOOL}d, minConversationListWidth: %f", (uint8_t *)&v15, 0x30u);
    }
  }
  return v11;
}

- (double)_sanitizeProposedConversationListWidth:(double)a3
{
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 minConversationListWidth];
  double v6 = v5;

  if (v6 <= a3) {
    double v6 = a3;
  }
  int v7 = +[CKUIBehavior sharedBehaviors];
  [v7 maxConversationListWidth];
  double v9 = v8;

  if (v6 < v9) {
    double v9 = v6;
  }
  if (CKIsRunningInMacCatalyst())
  {
    double v10 = +[CKUIBehavior sharedBehaviors];
    [v10 snapToMinConversationListWidth];
    if (v9 < v11)
    {
      id v12 = +[CKUIBehavior sharedBehaviors];
      [v12 minConversationListWidth];
      double v9 = v13;
    }
  }
  return v9;
}

- (void)viewDidLoad
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v17 viewDidLoad];
  [(CKMessagesController *)self setNeedsFocusUpdate];
  BOOL v3 = [(CKMessagesController *)self _wantsThreeColumnLayout];
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 minConversationListWidth];
  if (v3)
  {
    -[CKMessagesController setMinimumSupplementaryColumnWidth:](self, "setMinimumSupplementaryColumnWidth:");

    double v5 = +[CKUIBehavior sharedBehaviors];
    [v5 maxConversationListWidth];
    -[CKMessagesController setMaximumSupplementaryColumnWidth:](self, "setMaximumSupplementaryColumnWidth:");
  }
  else
  {
    -[CKMessagesController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:");

    double v5 = +[CKUIBehavior sharedBehaviors];
    [v5 maxConversationListWidth];
    -[CKMessagesController setMaximumPrimaryColumnWidth:](self, "setMaximumPrimaryColumnWidth:");
  }

  [(CKMessagesController *)self updateColumnWidths];
  double v6 = +[CKMenuBarManager sharedInstance];
  int v7 = [v6 allKeyboardShortcutKeyCommands];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[CKMessagesController addKeyCommand:](self, "addKeyCommand:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)updateColumnWidths
{
  [(CKMessagesController *)self _updateInboxWidth];

  [(CKMessagesController *)self _updateConversationListWidth];
}

- (void)_updateInboxWidth
{
  [(CKMessagesController *)self preferredPrimaryColumnWidth];
  double v4 = v3;
  if ([(CKMessagesController *)self isViewLoaded])
  {
    if (CKIsRunningInMacCatalyst())
    {
      double v5 = CKGetInboxPersistedWidth(0.0);
      if (v5 != 0.0) {
        double v4 = v5;
      }
    }
  }

  [(CKMessagesController *)self _setPreferredPrimaryColumnWidth:v4];
}

- (void)_updateConversationListWidth
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(CKMessagesController *)self preferredPrimaryColumnWidth];
  double v4 = v3;
  if ([(CKMessagesController *)self isViewLoaded])
  {
    if (CKIsRunningInMacCatalyst())
    {
      double v5 = CKGetConversationListPersistedWidth(0.0);
      double v6 = v5;
      if (v5 == 0.0)
      {
        if (CKGetLegacyAppMigratedSidebarPersistedWidth(0.0) == 0.0)
        {
          int v7 = +[CKUIBehavior sharedBehaviors];
          [v7 defaultConversationListWidth];
          double v6 = v8;
        }
        else
        {
          -[CKMessagesController _macConvertLegacySidebarWidthToModernWidth:](self, "_macConvertLegacySidebarWidthToModernWidth:");
          double v6 = v10;
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v14 = 134217984;
          double v15 = v5;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "lastPersistedWidth: %f", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      [(CKMessagesController *)self _calculateConversationListColumnWidth];
      double v6 = v9;
    }
    [(CKMessagesController *)self _sanitizeProposedConversationListWidth:v6];
    double v4 = v12;
  }
  if (IMOSLoggingEnabled())
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 134217984;
      double v15 = v4;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "setting conversationListWidth: %f", (uint8_t *)&v14, 0xCu);
    }
  }
  [(CKMessagesController *)self _setPreferredPrimaryColumnWidth:v4];
}

- (CKAlertUtilities)alertUtilities
{
  return self->_alertUtilities;
}

- (void)setAlertUtilities:(id)a3
{
}

- (void)didFinishCheckingMissingCarrierSetting
{
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(CKMessagesController *)self dismissPhotosGridIfNeeded];
  uint64_t v11 = +[CKUIBehavior sharedBehaviors];
  if ([v11 shouldSuppressRotationInNewCompose])
  {

LABEL_7:
    if ([(CKMessagesController *)self _hasCurrentConversations])
    {
      double v20 = [(CKMessagesController *)self selectionViewController];
      __int16 v21 = [v20 view];
      int v22 = [v21 window];

      if (!v22)
      {
        __int16 v23 = [(CKMessagesController *)self conversationListController];
        [v23 setEditing:0];

        goto LABEL_10;
      }
    }
LABEL_13:
    BOOL v24 = 1;
    goto LABEL_14;
  }
  BOOL v12 = [(CKMessagesController *)self isComposingMessage];

  if (!v12) {
    goto LABEL_7;
  }
  if (![(CKMessagesController *)self isInitialLoad])
  {
    long long v13 = [(CKMessagesController *)self composeChatController];
    int v14 = [v13 proposedRecipients];
    v34 = [v14 arrayByApplyingSelector:sel_rawAddress];

    v33 = [v13 composition];
    double v15 = +[CKUIBehavior sharedBehaviors];
    uint64_t v16 = objc_msgSend(objc_alloc((Class)objc_msgSend(v15, "composeChatControllerClass")), "initWithRecipientAddresses:composition:bizIntent:", v34, v33, 0);

    BOOL v32 = v16;
    [v16 setDelegate:self];
    objc_super v17 = [[CKNavigationController alloc] initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
    v38[0] = v13;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [(CKNavigationController *)v17 setViewControllers:v18];

    uint64_t v19 = +[CKUIBehavior sharedBehaviors];
    LODWORD(v16) = [v19 useMacToolbar];

    if (v16)
    {
      [(CKNavigationController *)v17 setNavigationBarHidden:1];
    }
    else
    {
      uint64_t v25 = [(CKNavigationController *)v17 navigationBar];
      __int16 v26 = +[CKUIBehavior sharedBehaviors];
      v27 = [v26 theme];
      objc_msgSend(v25, "setBarStyle:", objc_msgSend(v27, "navBarStyle"));
    }
    [(CKMessagesController *)self cancelAndDestroyComposition];
    [(CKMessagesController *)self setComposeChatController:v32];
    [(CKMessagesController *)self setComposeChatNavigationController:v17];
    id location = 0;
    uint64_t v28 = [(CKMessagesController *)self composeChatController];
    objc_initWeak(&location, v28);

    v29 = [(CKMessagesController *)self composeChatController];
    [v29 beginPinningInputViewsForReason:@"SplitViewFromExpandedToCollapsedTransition"];

    BOOL v30 = [(CKMessagesController *)self composeChatNavigationController];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke;
    v35[3] = &unk_1E56215C8;
    objc_copyWeak(&v36, &location);
    [(CKMessagesController *)self presentViewController:v30 animated:0 completion:v35];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

    goto LABEL_13;
  }
LABEL_10:
  BOOL v24 = 0;
LABEL_14:

  return v24;
}

- (void)setCurrentConversation:(id)a3 keepAllCurrentlyLoadedMessages:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v7 = (CKConversation *)a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      currentConversation = self->_currentConversation;
      int v17 = 138412546;
      double v18 = v7;
      __int16 v19 = 2112;
      double v20 = currentConversation;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "setCurrentConversation: %@   old: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  p_currentConversation = &self->_currentConversation;
  uint64_t v11 = self->_currentConversation;
  if (v11 != v7)
  {
    if ([(CKConversation *)v11 hasLoadedFromSpotlight]) {
      [(CKConversation *)*p_currentConversation reloadIfNeeded];
    }
    BOOL v12 = +[CKCurrentConversationsManager sharedInstance];
    [v12 removeConversation:*p_currentConversation];

    objc_storeStrong((id *)p_currentConversation, a3);
    if (v7)
    {
      long long v13 = +[CKCurrentConversationsManager sharedInstance];
      [v13 addConversation:v7];
    }
    int v14 = [(CKMessagesController *)self messagesControllerDelegate];
    [v14 messagesController:self didUpdateCurrentConversation:v7];
  }
  double v15 = +[CKCurrentConversationsManager sharedInstance];
  [v15 loadHistoryForConversation:*p_currentConversation keepAllCurrentlyLoadedMessages:v4];

  [(CKConversation *)*p_currentConversation resortMessagesIfNecessary];
  [(CKMessagesController *)self _setIsShowingNoSelectionUI:v7 == 0];
  if (v7)
  {
    [(CKConversation *)v7 updateUserActivity];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    [v16 setUserActivityForChat:0 orHandles:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v6 = @"NO";
      if (v3) {
        double v6 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      BOOL v12 = "-[CKMessagesController viewWillAppear:]";
      __int16 v13 = 2112;
      int v14 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    int v7 = @"NO";
    if (v3) {
      int v7 = @"YES";
    }
    id v8 = "-[CKMessagesController viewWillAppear:]";
    id v9 = v7;
    _CKLog();
  }
  [(CKMessagesController *)self _setIsShowingNoSelectionUI:[(CKMessagesController *)self _hasCurrentConversations] ^ 1];
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v10 viewWillAppear:v3];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  id v9 = (CKCoreChatController *)a4;
  if (IMOSLoggingEnabled())
  {
    objc_super v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = @"NO";
      int v27 = 138412802;
      uint64_t v28 = v8;
      __int16 v29 = 2112;
      if (v5) {
        uint64_t v11 = @"YES";
      }
      BOOL v30 = v9;
      __int16 v31 = 2112;
      BOOL v32 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Navigation controller: %@ willShowViewController: %@ animated: %@", (uint8_t *)&v27, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      chatController = self->_chatController;
      int v14 = [(CKCoreChatController *)chatController _shouldLoadInputAccessoryViewsOnAppearance];
      uint64_t v15 = @"NO";
      int v27 = 136315650;
      uint64_t v28 = "-[CKMessagesController navigationController:willShowViewController:animated:]";
      __int16 v29 = 2112;
      BOOL v30 = chatController;
      if (v14) {
        uint64_t v15 = @"YES";
      }
      __int16 v31 = 2112;
      BOOL v32 = v15;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "%s (chatController) %@ _shouldLoadInputAccessoryViewsOnAppearance: %@", (uint8_t *)&v27, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      composeChatController = self->_composeChatController;
      int v18 = [(CKCoreChatController *)composeChatController _shouldLoadInputAccessoryViewsOnAppearance];
      __int16 v19 = @"NO";
      int v27 = 136315650;
      uint64_t v28 = "-[CKMessagesController navigationController:willShowViewController:animated:]";
      __int16 v29 = 2112;
      BOOL v30 = composeChatController;
      if (v18) {
        __int16 v19 = @"YES";
      }
      __int16 v31 = 2112;
      BOOL v32 = v19;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "%s (composeChatController) %@ _shouldLoadInputAccessoryViewsOnAppearance: %@", (uint8_t *)&v27, 0x20u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->timeViewDidBeginAppearing = v20;
    self->hasBegunShowingConversationList = 1;
  }
  if (!CKIsRunningInMacCatalyst())
  {
    if ([(CKMessagesController *)self isCollapsed])
    {
      uint64_t v21 = [(CKMessagesController *)self currentConversation];
      if ([v21 isBusinessConversation])
      {
        int v22 = [(CKMessagesController *)self conversationListController];
        BOOL v23 = v22 != v9;
      }
      else
      {
        BOOL v23 = 0;
      }

      BOOL v24 = [(CKMessagesController *)self conversationListNavigationController];
      uint64_t v25 = [v24 navigationBar];
      [v25 setAccessibilityIgnoresInvertColors:v23];
    }
    else
    {
      BOOL v24 = [(CKMessagesController *)self chatNavigationController];
      uint64_t v25 = [v24 navigationBar];
      __int16 v26 = [(CKMessagesController *)self currentConversation];
      objc_msgSend(v25, "setAccessibilityIgnoresInvertColors:", objc_msgSend(v26, "isBusinessConversation"));
    }
  }
}

- (BOOL)_hasCurrentConversations
{
  BOOL v3 = +[CKCurrentConversationsManager sharedInstance];
  BOOL v4 = [v3 currentConversations];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    double v6 = [(CKMessagesController *)self currentConversation];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (CKConversation)currentConversation
{
  return self->_currentConversation;
}

- (void)_populateChatNavigationControllerWithSelection
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKMessagesController *)self isCollapsed];
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v11[0] = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "CKMessagesController: was asked to show the selection view controller but we're collapsed so this shouldn't happen in the first place.", (uint8_t *)v11, 2u);
      }
    }
  }
  else
  {
    if (v4)
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v11[0] = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "multi-select: Populating chatNavigationController with selectionViewController", (uint8_t *)v11, 2u);
      }
    }
    int v7 = [(CKMessagesController *)self chatNavigationController];
    id v8 = [(CKMessagesController *)self selectionViewController];
    v12[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 setViewControllers:v9];

    objc_super v10 = [(CKMessagesController *)self macToolbarController];
    [v10 reloadToolbarItems];
  }
}

- (void)_setIsShowingNoSelectionUI:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = +[CKUIBehavior sharedBehaviors];
  if (![v32 usesUncollapsedSplitview])
  {
    double v6 = v32;
LABEL_5:

    return;
  }
  BOOL v5 = [(CKMessagesController *)self isCollapsed];

  if (v5) {
    return;
  }
  int v7 = [(CKMessagesController *)self selectionViewController];
  id v8 = v7;
  if (v3)
  {
    if (v7)
    {
      id v9 = [(CKMessagesController *)self chatNavigationController];
      objc_super v10 = [v9 topViewController];
      uint64_t v11 = [(CKMessagesController *)self selectionViewController];

      if (v10 != v11)
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = [(CKMessagesController *)self selectionViewController];
            int v14 = [(CKMessagesController *)self chatNavigationController];
            uint64_t v15 = [v14 viewControllers];
            *(_DWORD *)buf = 138412546;
            id v35 = v13;
            __int16 v36 = 2112;
            v37 = v15;
            _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "No selection, setting chat navigation controller view controllers to selectVC: %@, VCs before: %@", buf, 0x16u);
          }
        }
        [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v17 = [(CKMessagesController *)self chatNavigationController];
            int v18 = [v17 viewControllers];
            *(_DWORD *)buf = 138412290;
            id v35 = v18;
            _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "chatNavigationController (_setIsShowingNoSelectionUI) children:%@", buf, 0xCu);
          }
        }
        __int16 v19 = [MEMORY[0x1E4F43058] keyWindow];
        double v20 = [v19 firstResponder];
        [v20 resignFirstResponder];

        uint64_t v21 = [(CKMessagesController *)self chatController];
        [v21 reloadInputViews];
      }
    }
    return;
  }

  if (v8) {
    [(CKMessagesController *)self setSelectionViewController:0];
  }
  int v22 = [(CKMessagesController *)self chatController];
  if (v22)
  {
    BOOL v23 = [(CKMessagesController *)self chatNavigationController];
    BOOL v24 = [v23 viewControllers];
    uint64_t v25 = [(CKMessagesController *)self chatController];
    char v26 = [v24 containsObject:v25];

    if ((v26 & 1) == 0)
    {
      int v27 = [(CKMessagesController *)self chatNavigationController];
      uint64_t v28 = (void *)MEMORY[0x1E4F1C978];
      __int16 v29 = [(CKMessagesController *)self chatController];
      BOOL v30 = objc_msgSend(v28, "arrayWithObjects:", v29, 0);
      [v27 setViewControllers:v30];

      __int16 v31 = [(CKMessagesController *)self chatController];
      [v31 becomeFirstResponder];

      id v33 = [(CKMessagesController *)self chatController];
      [v33 reloadInputViews];
      double v6 = v33;
      goto LABEL_5;
    }
  }
}

- (CKSelectionViewController)selectionViewController
{
  selectionViewController = self->_selectionViewController;
  if (!selectionViewController)
  {
    int v4 = objc_alloc_init(CKSelectionViewController);
    BOOL v5 = self->_selectionViewController;
    self->_selectionViewController = v4;

    [(CKSelectionViewController *)self->_selectionViewController setDelegate:self];
    selectionViewController = self->_selectionViewController;
  }

  return selectionViewController;
}

- (CKMacToolbarController)macToolbarController
{
  return self->_macToolbarController;
}

- (void)setMessagesControllerDelegate:(id)a3
{
}

- (CKMessagesController)init
{
  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    v7.receiver = self;
    v7.super_class = (Class)CKMessagesController;
    BOOL v3 = [(CKMessagesController *)&v7 initWithStyle:2];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKMessagesController;
    BOOL v3 = [(CKMessagesController *)&v6 init];
  }
  int v4 = v3;
  if (v3) {
    [(CKMessagesController *)v3 initialize];
  }
  [(CKMessagesController *)v4 setOscarModal:0];
  return v4;
}

- (void)setOscarModal:(BOOL)a3
{
  self->_oscarModal = a3;
}

- (void)initialize
{
  [(CKMessagesController *)self setDefinesPresentationContext:1];
  self->_isInitialLoad = 1;
  self->_attachmentPreviewQosClass = 17;
  BOOL v3 = [MEMORY[0x1E4F6E788] sharedManager];
  [v3 addDelegate:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__conversationLeft_ name:@"CKConversationListConversationLeftNotification" object:0];
  [v5 addObserver:self selector:sel__conversationListFinishedMerging_ name:@"CKConversationListFinishedMergingChatsNotification" object:0];
  [v5 addObserver:self selector:sel__chatRegistryDidLoad_ name:*MEMORY[0x1E4F6BA20] object:0];
  [v5 addObserver:self selector:sel__appStateChange_ name:*MEMORY[0x1E4F43660] object:0];
  [v5 addObserver:self selector:sel__appStateChange_ name:*MEMORY[0x1E4F43708] object:0];
  [v5 addObserver:self selector:sel__appStateChange_ name:*MEMORY[0x1E4F43668] object:0];
  [v5 addObserver:self selector:sel__appStateDidResumeFromInactive_ name:@"__kCKApplicationStateResumeFromInActiveNotification" object:0];
  [v5 addObserver:self selector:sel__conversationFilteringStateChangedNotification_ name:CKMessageFilteringChangedNotification[0] object:0];
  [v5 addObserver:self selector:sel_performVisibleAppPluginIconPrefetch_ name:@"CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification" object:0];
  [v5 addObserver:self selector:sel_performVisibleAppPluginIconPrefetch_ name:@"com.apple.messages.CKPluginPrewarmForLaunchCompleteNotification" object:0];
  [v5 addObserver:self selector:sel__unreadCountDidChange_ name:*MEMORY[0x1E4F6BA90] object:0];
  [v5 addObserver:self selector:sel__junkConversationsRecovered_ name:@"CKConversationListDidRecoverJunkConversationsNotification" object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleSIMSubcriptionUpdateNotification, (CFStringRef)*MEMORY[0x1E4F6DF78], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)parentControllerDidBecomeActive
{
  BOOL v3 = [(CKMessagesController *)self chatController];
  [v3 parentControllerDidBecomeActive];

  id v4 = [(CKMessagesController *)self composeChatController];
  [v4 parentControllerDidBecomeActive];
}

- (BOOL)isComposingMessage
{
  id v5 = [(CKMessagesController *)self composeChatController];

  if (v5)
  {
    objc_super v6 = [(CKMessagesController *)self chatNavigationController];
    objc_super v7 = [(CKMessagesController *)self composeChatNavigationController];
    if (v7)
    {
      objc_super v2 = [(CKMessagesController *)self presentedViewController];
      uint64_t v8 = [(CKMessagesController *)self composeChatNavigationController];
      if (v2 == (void *)v8)
      {

        goto LABEL_11;
      }
      BOOL v3 = (void *)v8;
    }
    objc_super v10 = [v6 topViewController];
    uint64_t v11 = [(CKMessagesController *)self composeChatController];

    if (v7)
    {
    }
    if (v10 != v11)
    {
      LOBYTE(v9) = 0;
LABEL_12:

      return v9;
    }
LABEL_11:
    BOOL v12 = [(CKMessagesController *)self composeChatController];
    int v9 = [v12 isSendingMessage] ^ 1;

    goto LABEL_12;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (CKCoreChatController)composeChatController
{
  return self->_composeChatController;
}

- (void)performVisibleAppPluginIconPrefetch:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CKMessagesController_performVisibleAppPluginIconPrefetch___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

- (void)_appStateChange:(id)a3
{
  objc_super v7 = [a3 name];
  if (([v7 isEqualToString:*MEMORY[0x1E4F43668]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F43708]] & 1) != 0)
  {
    unsigned int v4 = 25;
    id v5 = v7;
LABEL_4:
    self->_attachmentPreviewQosClass = v4;
    goto LABEL_5;
  }
  int v6 = [v7 isEqualToString:*MEMORY[0x1E4F43660]];
  id v5 = v7;
  if (v6)
  {
    unsigned int v4 = 9;
    goto LABEL_4;
  }
LABEL_5:
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CKCoreChatController *)self->_chatController setDelegate:0];
  [(CKCoreChatController *)self->_composeChatController setDelegate:0];
  [(UINavigationController *)self->_conversationListNavigationController setDelegate:0];
  [(CKConversationListControllerProtocol *)self->_conversationListController setDelegate:0];
  [(CKInteractionNotificationView *)self->_dismissOnInteractionView setDelegate:0];
  [(UINavigationController *)self->_chatNavigationController setDelegate:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F6DF78], 0);
  v5.receiver = self;
  v5.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v5 dealloc];
}

- (id)initAsOscarModal
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessagesController;
  objc_super v2 = [(CKMessagesController *)&v5 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(CKMessagesController *)v2 initialize];
    [(CKMessagesController *)v3 setOscarModal:1];
  }
  return v3;
}

- (CKMessagesController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesController;
  BOOL v3 = [(CKMessagesController *)&v6 initWithStyle:a3];
  unsigned int v4 = v3;
  if (v3) {
    [(CKMessagesController *)v3 initialize];
  }
  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = [(CKMessagesController *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v12 = [(CKMessagesController *)self chatController];
    [v12 dismissTipIfPresented];
  }
  v13.receiver = self;
  v13.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v13 presentViewController:v8 animated:v6 completion:v9];
}

- (id)conversationListControllerIfInitialized
{
  return self->_conversationListController;
}

- (void)conversationListControllerTappedDeleteNewMessage:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [(CKMessagesController *)self composeChatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v6 = [(CKMessagesController *)self composeChatController];
    [v6 cancelCompose];
  }
  else
  {
    [(CKMessagesController *)self composeChatControllerDidCancelComposition:0];
    [v7 reloadData];
  }
}

- (BOOL)daemonIsConnected
{
  objc_super v2 = [MEMORY[0x1E4F6BC98] sharedInstance];
  char v3 = [v2 isConnected];

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = @"NO";
      if (v3) {
        BOOL v6 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      BOOL v12 = "-[CKMessagesController viewWillDisappear:]";
      __int16 v13 = 2112;
      int v14 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    id v8 = "-[CKMessagesController viewWillDisappear:]";
    id v9 = v7;
    _CKLog();
  }
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3, v8, v9);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = @"NO";
      if (v3) {
        BOOL v6 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      BOOL v12 = "-[CKMessagesController viewDidDisappear:]";
      __int16 v13 = 2112;
      int v14 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    id v8 = "-[CKMessagesController viewDidDisappear:]";
    id v9 = v7;
    _CKLog();
  }
  [(CKMessagesController *)self _updateAlertSuppressionContext];
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v10 viewDidDisappear:v3];
}

- (BOOL)shouldAutorotate
{
  if ([(CKMessagesController *)self isCollapsed]) {
    [(CKMessagesController *)self conversationListNavigationController];
  }
  else {
  BOOL v3 = [(CKMessagesController *)self chatNavigationController];
  }
  char v4 = [v3 shouldAutorotate];

  return v4;
}

- (void)didReceiveMemoryWarning
{
  BOOL v3 = +[CKCurrentConversationsManager sharedInstance];
  [v3 pruneCache];

  v4.receiver = self;
  v4.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v4 didReceiveMemoryWarning];
}

- (void)checkForRCSAndCarrierAlerts
{
  if ([(CKMessagesController *)self onboardingControllerIsActive])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Not presenting RCS/Carrier alerts, onboarding controller is active", buf, 2u);
      }
    }
  }
  else if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__CKMessagesController_checkForRCSAndCarrierAlerts__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __51__CKMessagesController_checkForRCSAndCarrierAlerts__block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  BOOL v3 = objc_alloc_init(CKAlertUtilities);
  [v2 setAlertUtilities:v3];

  objc_super v4 = [*(id *)(a1 + 32) alertUtilities];
  [v4 setDelegate:*(void *)(a1 + 32)];

  objc_super v5 = [*(id *)(a1 + 32) alertUtilities];
  [v5 checkFirstTimeRCS];

  id v6 = [*(id *)(a1 + 32) alertUtilities];
  [v6 checkMissingCarrierSetting];
}

void __60__CKMessagesController_performVisibleAppPluginIconPrefetch___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v2 = +[CKUIBehavior sharedBehaviors];
  unint64_t v3 = [v2 appIconPrefetchLimit];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = objc_msgSend(*(id *)(a1 + 32), "_sharedBalloonPluginManager", 0);
  objc_super v5 = [v4 visibleDrawerPlugins];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    uint64_t v11 = v8 + 1;
    v8 += v7;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      if (v11 + v10 > v3) {
        break;
      }
      BOOL v12 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      __int16 v13 = [*(id *)(a1 + 32) traitCollection];
      objc_msgSend(v12, "__ck_prefetchBrowserImageForInterfaceStyle:", objc_msgSend(v13, "userInterfaceStyle"));

      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)dismissKeyboardIfVisible
{
  unint64_t v3 = [(CKMessagesController *)self chatController];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CKMessagesController *)self composeChatController];
  }
  id v10 = v5;

  uint64_t v6 = [v10 entryView];
  uint64_t v7 = [v6 contentView];
  uint64_t v8 = [v7 activeView];
  int v9 = [v8 isFirstResponder];

  if (v9) {
    [v10 dismissKeyboard];
  }
}

- (void)performSearchForQuery:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  [(CKMessagesController *)self showConversationListWithAnimation:1 didDismissController:&v13];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CKMessagesController_performSearchForQuery___block_invoke;
  aBlock[3] = &unk_1E5620AF8;
  aBlock[4] = self;
  id v5 = v4;
  id v12 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = v6;
  if (v13)
  {
    dispatch_time_t v8 = dispatch_time(0, 250000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__CKMessagesController_performSearchForQuery___block_invoke_205;
    v9[3] = &unk_1E5620F48;
    id v10 = v7;
    dispatch_after(v8, MEMORY[0x1E4F14428], v9);
  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
}

void __46__CKMessagesController_performSearchForQuery___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) conversationListController];
  unint64_t v3 = [v2 navigationController];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) conversationListController];
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__CKMessagesController_performSearchForQuery___block_invoke_2;
    v8[3] = &unk_1E5620C40;
    id v9 = v5;
    [v4 performSearch:v9 completion:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) conversationListController];
    [v7 setDeferredSearchQuery:v6];
  }
}

void __46__CKMessagesController_performSearchForQuery___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Performed search with query:%@", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __46__CKMessagesController_performSearchForQuery___block_invoke_205(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareForSuspend
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "prepareForSuspend", v12, 2u);
    }
  }
  [(CKMessagesController *)self setStatusBarStyleViewController:0];
  int v4 = [(CKMessagesController *)self inboxViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(CKMessagesController *)self inboxViewController];
    [v6 prepareForSuspend];
  }
  id v7 = [(CKMessagesController *)self onboardingController];
  [v7 prepareForSuspend];

  [(CKMessagesController *)self setOnboardingController:0];
  dispatch_time_t v8 = [(CKMessagesController *)self conversationListController];
  [v8 prepareForSuspend];

  id v9 = [(CKMessagesController *)self chatController];
  [v9 prepareForSuspend];

  id v10 = [(CKMessagesController *)self composeChatController];
  [v10 prepareForSuspend];

  [(CKMessagesController *)self teardownCamera];
  if (!CKIsRunningInMacCatalyst())
  {
    uint64_t v11 = [(CKMessagesController *)self _sharedBalloonPluginManager];
    [v11 invalidateAllActivePluginsSkippingCameraApp:1];
  }
}

- (void)prepareForResume
{
  uint64_t v3 = [(CKMessagesController *)self inboxViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(CKMessagesController *)self inboxViewController];
    [v5 prepareForResume];
  }
  uint64_t v6 = [(CKMessagesController *)self conversationListController];
  [v6 prepareForResume];

  id v7 = [(CKMessagesController *)self chatController];
  [v7 prepareForResume];

  dispatch_time_t v8 = [(CKMessagesController *)self composeChatController];
  [v8 prepareForResume];

  if (!CKIsRunningInMacCatalyst())
  {
    [(CKMessagesController *)self presentOnboardingViewControllerIfNeeded];
  }
}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(CKMessagesController *)self chatController];
  [v7 parentControllerDidResume:v5 animating:v4];

  id v8 = [(CKMessagesController *)self composeChatController];
  [v8 parentControllerDidResume:v5 animating:v4];
}

- (void)setDeferredHandleURLBlock:(id)a3
{
  id v7 = (void (**)(void))a3;
  BOOL v4 = [(CKMessagesController *)self onboardingController];

  if ([(CKMessagesController *)self isInitialLoad] || v4)
  {
    uint64_t v6 = (void *)[v7 copy];

    id deferredHandleURLBlock = self->_deferredHandleURLBlock;
    self->_id deferredHandleURLBlock = v6;
  }
  else
  {
    v7[2]();
    id deferredHandleURLBlock = v7;
  }
}

- (BOOL)_shouldShowSMSRelayPromptOnLaunch
{
  if (CKSMSRelaySettingsConfirmed()) {
    return 0;
  }

  return [(CKMessagesController *)self _shouldShowSMSRelayPrompt];
}

- (BOOL)_shouldShowSMSRelayPrompt
{
  uint64_t v3 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  BOOL v4 = [MEMORY[0x1E4F6BDC0] smsService];
  BOOL v5 = [v3 activeAccountsForService:v4];
  uint64_t v6 = [v5 firstObject];

  if (!v6) {
    goto LABEL_7;
  }
  if (([v6 isSMSRelayCapable] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CKMessagesController__shouldShowSMSRelayPrompt__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    if (_shouldShowSMSRelayPrompt_onceToken != -1) {
      dispatch_once(&_shouldShowSMSRelayPrompt_onceToken, block);
    }
  }
  if ([v6 isSMSRelayCapable] && (objc_msgSend(v6, "allowsSMSRelay") & 1) == 0) {
    BOOL v7 = [v6 registrationStatus] == 5 || objc_msgSend(v6, "registrationStatus") == 0;
  }
  else {
LABEL_7:
  }
    BOOL v7 = 0;

  return v7;
}

void __49__CKMessagesController__shouldShowSMSRelayPrompt__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F6BBB8];
  BOOL v4 = [MEMORY[0x1E4F6BDC0] smsService];
  [v5 addObserver:v2 selector:sel__showSMSRelayPromptIfNeeded name:v3 object:v4];
}

- (void)_showSMSRelayPromptOnLaunchIfNeeded
{
  if ([(CKMessagesController *)self _shouldShowSMSRelayPromptOnLaunch])
  {
    [(CKMessagesController *)self _showSMSRelayPromptIfNeeded];
  }
}

- (void)_showSMSRelayPromptIfNeeded
{
  BOOL v3 = [(CKMessagesController *)self _shouldShowSMSRelayPrompt];
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Show SMS Relay Prompt", buf, 2u);
      }
    }
    CKSetSMSRelaySettingsConfirmed(1);
    uint64_t v6 = CKFrameworkBundle();
    BOOL v7 = [v6 localizedStringForKey:@"SMS_RELAY_ALERT_TITLE_MAC" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v8 = CKFrameworkBundle();
    id v9 = [v8 localizedStringForKey:@"SMS_RELAY_ALERT_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v10 = +[CKAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    uint64_t v11 = CKFrameworkBundle();
    id v12 = [v11 localizedStringForKey:@"SMS_RELAY_TURN_ON" value:&stru_1EDE4CA38 table:@"ChatKit"];
    char v13 = +[CKAlertAction actionWithTitle:v12 style:0 handler:&__block_literal_global_265];

    long long v14 = CKFrameworkBundle();
    long long v15 = [v14 localizedStringForKey:@"SMS_RELAY_NOT_NOW" value:&stru_1EDE4CA38 table:@"ChatKit"];
    long long v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];

    [v10 addAction:v16];
    [v10 addAction:v13];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__CKMessagesController__showSMSRelayPromptIfNeeded__block_invoke_2;
    v19[3] = &unk_1E5620AF8;
    id v20 = v10;
    uint64_t v21 = self;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
  else if (v4)
  {
    int v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "NOT showing SMS Relay Prompt", buf, 2u);
    }
  }
}

void __51__CKMessagesController__showSMSRelayPromptIfNeeded__block_invoke()
{
  v0 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  v1 = [MEMORY[0x1E4F6BDC0] smsService];
  uint64_t v2 = [v0 activeAccountsForService:v1];
  id v3 = [v2 firstObject];

  [v3 enrollSelfDeviceInSMSRelay];
}

uint64_t __51__CKMessagesController__showSMSRelayPromptIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentFromViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_showNextSMSRelayPINPrompt
{
  id v3 = [(CKMessagesController *)self pendingSMSRelayPINPrompts];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(CKMessagesController *)self pendingSMSRelayPINPrompts];
    uint64_t v6 = [v5 firstObject];

    BOOL v7 = [(CKMessagesController *)self pendingSMSRelayPINPrompts];
    [v7 removeObject:v6];

    id v8 = [(CKMessagesController *)self pendingSMSRelayPINPrompts];
    uint64_t v9 = [v8 count];

    if (!v9) {
      [(CKMessagesController *)self setPendingSMSRelayPINPrompts:0];
    }
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    char v13 = __50__CKMessagesController__showNextSMSRelayPINPrompt__block_invoke;
    long long v14 = &unk_1E5620AF8;
    long long v15 = self;
    id v16 = v6;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], &v11);
    [(CKMessagesController *)self _showNextSMSRelayPINPrompt];
  }
}

uint64_t __50__CKMessagesController__showNextSMSRelayPINPrompt__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentSMSRelayPinAlert:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 presentFromViewController:v3 animated:1 completion:0];
}

- (void)_smsRelayPINReceived:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKMessagesController *)self _shouldShowSMSRelayPrompt])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v4;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received notification for SMS Relay PIN %@", buf, 0xCu);
      }
    }
    uint64_t v6 = [v4 userInfo];
    BOOL v7 = [v6 objectForKey:@"pinCode"];

    id v8 = [v4 userInfo];
    uint64_t v9 = [v8 objectForKey:@"phoneNumber"];

    if (v7 && v9)
    {
      id v10 = NSString;
      uint64_t v11 = CKFrameworkBundle();
      uint64_t v12 = [v11 localizedStringForKey:@"SMS_RELAY_PIN_PROMPT_MAC" value:&stru_1EDE4CA38 table:@"ChatKit"];
      char v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9, v7);

      long long v14 = [MEMORY[0x1E4F42738] sharedApplication];
      LODWORD(v12) = [v14 userInterfaceLayoutDirection] == 1;

      if (v12) {
        long long v15 = @"\u200F";
      }
      else {
        long long v15 = @"\u200E";
      }
      id v16 = [(__CFString *)v15 stringByAppendingString:v13];

      id v17 = CKFrameworkBundle();
      int v18 = [v17 localizedStringForKey:@"SMS_RELAY_WAITING" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v19 = +[CKAlertController alertControllerWithTitle:v16 message:v18 preferredStyle:1];

      id v20 = CKFrameworkBundle();
      uint64_t v21 = [v20 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
      int v22 = +[CKAlertAction actionWithTitle:v21 style:1 handler:0];

      [v19 addAction:v22];
      BOOL v23 = [(CKMessagesController *)self pendingSMSRelayPINPrompts];
      LODWORD(v20) = v23 == 0;

      if (v20)
      {
        id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(CKMessagesController *)self setPendingSMSRelayPINPrompts:v24];
      }
      uint64_t v25 = [(CKMessagesController *)self pendingSMSRelayPINPrompts];
      [v25 addObject:v19];

      [(CKMessagesController *)self _showNextSMSRelayPINPrompt];
    }
  }
}

- (void)_pinVerificationShouldDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"wasCancelled"];
  int v7 = [v6 BOOLValue];

  id v8 = [v4 userInfo];

  uint64_t v9 = [v8 objectForKey:@"responseFromDevice"];
  LODWORD(v6) = [v9 BOOLValue];

  if (!v6) {
    goto LABEL_5;
  }
  id v10 = [(CKMessagesController *)self currentSMSRelayPinAlert];

  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (v7)
  {
LABEL_5:
    [(CKMessagesController *)self setPendingSMSRelayPINPrompts:0];
    uint64_t v11 = [(CKMessagesController *)self presentedViewController];

    if (v11)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_2;
      v25[3] = &unk_1E5620C40;
      v25[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v25);
    }
    uint64_t v12 = CKFrameworkBundle();
    char v13 = [v12 localizedStringForKey:@"SMS_RELAY_CANCELLED_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    long long v14 = CKFrameworkBundle();
    long long v15 = [v14 localizedStringForKey:@"SMS_RELAY_CANCELLED_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v16 = +[CKAlertController alertControllerWithTitle:v13 message:v15 preferredStyle:1];

    id v17 = CKFrameworkBundle();
    int v18 = [v17 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v19 = +[CKAlertAction actionWithTitle:v18 style:1 handler:0];

    [v16 addAction:v19];
    id v20 = [v16 preferredAction];

    if (!v20) {
      [v16 setPreferredAction:v19];
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_3;
    v22[3] = &unk_1E5620AF8;
    id v23 = v16;
    id v24 = self;
    id v21 = v16;
    dispatch_async(MEMORY[0x1E4F14428], v22);
  }
}

uint64_t __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentSMSRelayPinAlert];
  [v2 dismissViewControllerAnimated:1 completion:0];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setCurrentSMSRelayPinAlert:0];
}

uint64_t __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentFromViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)preferredFocusEnvironments
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CKMessagesController *)self isComposingMessage]
    && ([(CKMessagesController *)self composeChatController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = [(CKMessagesController *)self composeChatController];
  }
  else
  {
    uint64_t v6 = [(CKMessagesController *)self chatController];

    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v5 = [(CKMessagesController *)self chatController];
  }
  int v7 = (void *)v5;
  [v3 addObject:v5];

LABEL_7:
  id v8 = [(CKMessagesController *)self conversationListController];

  if (v8)
  {
    uint64_t v9 = [(CKMessagesController *)self conversationListController];
    [v3 addObject:v9];
  }

  return v3;
}

- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 shouldDismissAfterSend])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__CKMessagesController_chatController_willSendComposition_inConversation___block_invoke;
      v10[3] = &unk_1E5620C40;
      v10[4] = self;
      [(CKMessagesController *)self dismissViewControllerAnimated:1 completion:v10];
    }
    [(CKMessagesController *)self setupBizNavBarForConversation:v8];
  }
  uint64_t v9 = [(CKMessagesController *)self conversationListController];
  [v9 compositionSent];
}

void __74__CKMessagesController_chatController_willSendComposition_inConversation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelAndDestroyComposition];
  id v2 = [*(id *)(a1 + 32) chatController];
  [v2 endHoldingScrollGeometryUpdatesForReason:@"TransitionFromForwarding"];
}

- (void)chatController:(id)a3 didSendCompositionInConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 shouldDismissAfterSend])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __72__CKMessagesController_chatController_didSendCompositionInConversation___block_invoke;
      v9[3] = &unk_1E5620C40;
      void v9[4] = self;
      [(CKMessagesController *)self dismissViewControllerAnimated:1 completion:v9];
    }
    else
    {
      [(CKMessagesController *)self showConversation:v7 animate:1];
    }
  }
  id v8 = [(CKMessagesController *)self conversationListController];
  [v8 updateConversationListForMessageSentToConversation:v7];
}

void __72__CKMessagesController_chatController_didSendCompositionInConversation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelAndDestroyComposition];
  id v2 = [*(id *)(a1 + 32) chatController];
  [v2 endHoldingScrollGeometryUpdatesForReason:@"TransitionFromForwarding"];
}

- (void)chatController:(id)a3 didReportSpamForConversation:(id)a4
{
  id v5 = a4;
  [(CKMessagesController *)self showConversationListWithAnimation:1];
  id v6 = +[CKCurrentConversationsManager sharedInstance];
  [v6 purgeConversation:v5];

  [(CKMessagesController *)self deleteConversation:v5];
  id v7 = [(CKMessagesController *)self conversationListController];
  [v7 updateConversationList];

  if (!CKIsForceUnknownFilteringEnabled()
    || ([MEMORY[0x1E4F6E730] IMDeviceRegionIsEligibleToBeForcedIntoFilteringUnknownSender] & 1) == 0)
  {
    BOOL v8 = [(CKMessagesController *)self _isMessageFilteringEnabled];
    BOOL IsModified = CKMessageFilteringIsModified();
    if (v8)
    {
      if (!IsModified && CKMessageForceFilteringIsExpected()) {
        CKSetMessageFilteringSettingsConfirmed(1);
      }
    }
    else if (!IsModified && CKMessageForceFilteringIsExpected())
    {
      CKSetMessageFilteringSettingsConfirmed(1);
      id v10 = (void *)MEMORY[0x1E4F42728];
      uint64_t v11 = CKFrameworkBundle();
      uint64_t v12 = [v11 localizedStringForKey:@"MESSAGE_FILTERING_PROMPT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      char v13 = CKFrameworkBundle();
      long long v14 = [v13 localizedStringForKey:@"MESSAGE_FILTERING_PROMPT_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      long long v15 = [v10 alertControllerWithTitle:v12 message:v14 preferredStyle:1];

      id v16 = CKFrameworkBundle();
      id v17 = [v16 localizedStringForKey:@"MESSAGE_FILTERING_TURN_ON" value:&stru_1EDE4CA38 table:@"ChatKit"];
      int v18 = +[CKAlertAction actionWithTitle:v17 style:0 handler:&__block_literal_global_282];
      [v15 addAction:v18];

      uint64_t v19 = CKFrameworkBundle();
      id v20 = [v19 localizedStringForKey:@"MESSAGE_FILTERING_NOT_NOW" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v21 = +[CKAlertAction actionWithTitle:v20 style:0 handler:&__block_literal_global_287_3];
      [v15 addAction:v21];

      [(CKMessagesController *)self presentViewController:v15 animated:1 completion:0];
    }
  }
  if (![(CKMessagesController *)self isCollapsed])
  {
    id v22 = [(CKMessagesController *)self conversationListController];
    [v22 selectDefaultConversationAnimated:1];
  }
}

void __68__CKMessagesController_chatController_didReportSpamForConversation___block_invoke()
{
}

- (void)chatController:(id)a3 requestDeleteJunkConversation:(id)a4
{
  id v5 = a4;
  id v7 = +[CKConversationList sharedConversationList];
  [v7 deleteConversation:v5];

  id v6 = [(CKMessagesController *)self conversationListController];
  [v6 userDeletedJunkConversationFromTranscript];
}

- (void)chatController:(id)a3 requestRecoverJunkConversation:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[CKConversationList sharedConversationList];
  v9[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [v6 recoverJunkMessagesInConversations:v7];
  BOOL v8 = [(CKMessagesController *)self conversationListController];
  [v8 userRecoveredJunkConversationFromTranscript];
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  [(CKMessagesController *)self systemMinimumLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(CKMessagesController *)self view];
  uint64_t v13 = [v12 effectiveUserInterfaceLayoutDirection];

  if (v13) {
    double v14 = v11;
  }
  else {
    double v14 = v7;
  }
  if (v13) {
    double v15 = v7;
  }
  else {
    double v15 = v11;
  }
  double v16 = v5;
  double v17 = v9;
  result.right = v15;
  result.bottom = v17;
  result.left = v14;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  uint64_t v3 = [(CKMessagesController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)chatController:(id)a3 forwardComposition:(id)a4
{
  id v15 = a4;
  if ([(CKMessagesController *)self isCollapsed])
  {
    double v5 = [(CKComposeChatController *)[CKShareSheetChatController alloc] initWithRecipientAddresses:0 composition:v15 bizIntent:0];
    [(CKCoreChatController *)v5 setDelegate:self];
    [(CKChatController *)v5 setSendMenuDelegate:self];
    double v6 = [[CKNavigationController alloc] initWithRootViewController:v5];
    double v7 = +[CKUIBehavior sharedBehaviors];
    int v8 = [v7 useMacToolbar];

    if (v8)
    {
      [(CKNavigationController *)v6 setNavigationBarHidden:1];
    }
    else
    {
      double v9 = [(CKNavigationController *)v6 navigationBar];
      double v10 = +[CKUIBehavior sharedBehaviors];
      double v11 = [v10 theme];
      objc_msgSend(v9, "setBarStyle:", objc_msgSend(v11, "navBarStyle"));
    }
    [(CKMessagesController *)self setComposeChatNavigationController:v6];
    [(CKMessagesController *)self setComposeChatController:v5];
    double v12 = [(CKMessagesController *)self chatController];
    [v12 beginHoldingScrollGeometryUpdatesForReason:@"TransitionFromForwarding"];

    double v13 = [(CKMessagesController *)self composeChatNavigationController];
    [(CKMessagesController *)self presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    [(CKMessagesController *)self showNewMessageCompositionPanelAppendingToExistingDraft:v15 animated:1];
  }
  double v14 = [(CKMessagesController *)self conversationListController];
  [v14 updateConversationList];
}

- (void)chatController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4
{
}

- (void)chatController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4 composition:(id)a5
{
}

- (void)chatController:(id)a3 shouldComposeAudioMessageWithRecipientAddresses:(id)a4
{
  LOBYTE(v4) = 1;
  [(CKMessagesController *)self showNewMessageCompositionPanelWithRecipients:a4 chatID:0 composition:0 appendToExistingDraft:0 suggestedReplies:0 animated:1 bizIntent:0 launchPluginWithBundleID:0 pluginLaunchPayload:0 startAudioRecording:v4 simID:0 sendMessageHandler:0];
}

- (void)chatController:(id)a3 shouldComposeVideoMessageWithRecipientAddresses:(id)a4
{
}

- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CKSendMenuPresentation *)self->_sendMenuPresentation sendMenuViewController];
  double v9 = [v8 view];
  double v10 = [v9 window];

  if (!v10)
  {
    double v11 = self;
    if ([(CKMessagesController *)v11 isComposingMessage])
    {
      double v12 = [(CKMessagesController *)v11 composeChatController];
    }
    else
    {
      double v13 = v11;
      if (![v6 isModal])
      {
LABEL_8:
        double v14 = (CKSendMenuPresentation *)[v7 newSendMenuPresentationWithPresentingViewController:v13 delegate:v11];
        sendMenuPresentation = self->_sendMenuPresentation;
        self->_sendMenuPresentation = v14;

        double v16 = self->_sendMenuPresentation;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __62__CKMessagesController_chatController_requestPresentSendMenu___block_invoke;
        v17[3] = &unk_1E5620C40;
        id v18 = v7;
        [(CKSendMenuPresentation *)v16 beginPresentationWithCompletion:v17];

        goto LABEL_9;
      }
      double v12 = (CKMessagesController *)v6;
    }
    double v13 = v12;

    goto LABEL_8;
  }
  [(CKSendMenuPresentation *)self->_sendMenuPresentation rePresentSendMenu];
  [v7 didFinishPresentTransition];
LABEL_9:
}

uint64_t __62__CKMessagesController_chatController_requestPresentSendMenu___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFinishPresentTransition];
}

- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4
{
  [(CKSendMenuPresentation *)self->_sendMenuPresentation removeSendMenuFromViewHierarchy];
  sendMenuPresentation = self->_sendMenuPresentation;
  self->_sendMenuPresentation = 0;
}

- (void)chatControllerDidChangeDeferringSystemNavigationPopGestureForPlusButton:(id)a3
{
  uint64_t v4 = [a3 isDeferringSystemNavigationPopGestureForPlusButton] ^ 1;
  double v5 = [(CKMessagesController *)self chatNavigationController];
  id v6 = [v5 interactivePopGestureRecognizer];
  [v6 setDelaysTouchesBegan:v4];

  id v7 = [(CKMessagesController *)self conversationListNavigationController];
  int v8 = [v7 interactivePopGestureRecognizer];
  [v8 setDelaysTouchesBegan:v4];

  [(CKMessagesController *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
}

- (id)navigationBarBackdropLayerGroupNameForChatController:(id)a3
{
  uint64_t v4 = [(CKMessagesController *)self composeChatNavigationController];

  if (v4)
  {
    double v5 = [(CKMessagesController *)self composeChatNavigationController];
  }
  else
  {
    if ([(CKMessagesController *)self isCollapsed]) {
      [(CKMessagesController *)self conversationListNavigationController];
    }
    else {
    double v5 = [(CKMessagesController *)self chatNavigationController];
    }
  }
  id v6 = v5;
  id v7 = [v5 navigationBar];
  int v8 = [v7 _backdropViewLayerGroupName];

  return v8;
}

- (int64_t)unreadCountForCurrentFilterModeForChatController:(id)a3
{
  uint64_t v4 = [(CKMessagesController *)self conversationList];
  double v5 = [(CKMessagesController *)self conversationListController];
  int64_t v6 = objc_msgSend(v4, "unreadCountForFilterMode:", objc_msgSend(v5, "filterMode"));

  return v6;
}

- (BOOL)hasRecentlyDeletedFilterSelected
{
  id v2 = [(CKMessagesController *)self conversationListController];
  BOOL v3 = [v2 filterMode] == 7;

  return v3;
}

- (void)didSelectFilterFromViewMenu:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 propertyList];

  if (v4)
  {
    double v5 = [v6 propertyList];
    -[CKMessagesController catalystFilterModeSelected:](self, "catalystFilterModeSelected:", (int)[v5 intValue]);
  }
}

- (void)catalystFilterModeSelected:(unint64_t)a3
{
  [(CKMessagesController *)self inboxViewController:0 didSelectFilterMode:a3];
  uint64_t v4 = [(CKMessagesController *)self macToolbarController];
  [v4 reloadToolbarItems];

  id v5 = [(CKMessagesController *)self conversationListController];
  [v5 dismissCatalystSearch];
}

- (unint64_t)currentConversationListFilterMode
{
  id v2 = [(CKMessagesController *)self conversationListController];
  unint64_t v3 = [v2 filterMode];

  return v3;
}

- (BOOL)_isApplyingJunkFilter
{
  return [(CKMessagesController *)self currentConversationListFilterMode] == 9;
}

- (void)updateSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_uint64_t supportedInterfaceOrientations = a3;
  self->_forceOrientation = 1;
  [(CKMessagesController *)self updateInterfaceOrientationsAnimated:0];
}

- (void)stopForcingOrientation
{
  self->_uint64_t supportedInterfaceOrientations = 30;
  self->_forceOrientation = 0;
  [(CKMessagesController *)self updateInterfaceOrientationsAnimated:1];
}

- (void)updateInterfaceOrientationsAnimated:(BOOL)a3
{
  if (a3)
  {
    [(CKMessagesController *)self _setNeedsUpdateOfSupportedInterfaceOrientations];
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__CKMessagesController_updateInterfaceOrientationsAnimated___block_invoke;
    v5[3] = &unk_1E5620C40;
    v5[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v5];
  }
}

uint64_t __60__CKMessagesController_updateInterfaceOrientationsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (BOOL)shouldClearSecondaryItemsFromToolbarController:(id)a3
{
  if ([(CKMessagesController *)self _isApplyingJunkFilter]) {
    return 1;
  }

  return [(CKMessagesController *)self isShowingSelectionView];
}

- (void)splitViewControllerDidExpand:(id)a3
{
  uint64_t v4 = [(CKMessagesController *)self inboxModel];
  [v4 setIsCollapsed:0];

  id v5 = [(CKMessagesController *)self chatNavigationController];
  id v6 = [v5 viewControllers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];
  }
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  [(CKMessagesController *)self dismissPhotosGridIfNeeded];
  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    id v6 = [(CKMessagesController *)self chatNavigationController];
    uint64_t v7 = [v6 topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && ![(CKMessagesController *)self isComposingMessage]) {
      return 1;
    }
  }
  return a4;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  return a4;
}

void __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke_2;
  block[3] = &unk_1E56215C8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endPinningInputViewsForReason:@"SplitViewFromExpandedToCollapsedTransition"];
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CKMessagesController *)self dismissPhotosGridIfNeeded];
  int v8 = [(CKMessagesController *)self conversationListNavigationController];
  double v9 = [v8 navigationBar];
  [v9 setDarkEffectStyle:0];

  [(CKMessagesController *)self popToConversationListIfNecessaryAnimated:1];
  double v10 = +[CKUIBehavior sharedBehaviors];
  if ([v10 shouldSuppressRotationInNewCompose])
  {
  }
  else
  {
    BOOL v11 = [(CKMessagesController *)self isComposingMessage];

    if (v11)
    {
      double v12 = [(CKMessagesController *)self composeChatController];
      double v13 = [v12 proposedRecipients];
      double v14 = [v13 arrayByApplyingSelector:sel_rawAddress];

      id v15 = [v12 composition];
      [(CKMessagesController *)self cancelAndDestroyComposition];
      [(CKMessagesController *)self showNewMessageCompositionPanelWithRecipients:v14 composition:v15 animated:0];
      location[0] = 0;
      double v16 = [(CKMessagesController *)self composeChatController];
      objc_initWeak(location, v16);

      id WeakRetained = objc_loadWeakRetained(location);
      [WeakRetained beginPinningInputViewsForReason:@"SplitViewFromCollapsedToExpandedTransition"];

      uint64_t v42 = MEMORY[0x1E4F143A8];
      uint64_t v43 = 3221225472;
      double v44 = __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke;
      double v45 = &unk_1E5623328;
      char v46 = self;
      objc_copyWeak(&v47, location);
      [(CKMessagesController *)self dismissViewControllerAnimated:0 completion:&v42];
      id v18 = [(CKMessagesController *)self chatNavigationController];
      objc_destroyWeak(&v47);
      objc_destroyWeak(location);

      goto LABEL_26;
    }
  }
  id v19 = [(CKMessagesController *)self conversationListNavigationController];
  if (v19 == v7)
  {
    id v20 = [(CKMessagesController *)self conversationListNavigationController];
    id v21 = [v20 viewControllers];
    unint64_t v22 = [v21 count];

    if (v22 <= 2)
    {
      id v23 = [(CKMessagesController *)self chatNavigationController];
      id v24 = [v23 parentViewController];
      if (v24)
      {
      }
      else
      {
        uint64_t v25 = [(CKMessagesController *)self conversationListNavigationController];
        char v26 = [v25 viewControllers];
        id v27 = [(CKMessagesController *)self chatNavigationController];
        uint64_t v28 = [v26 indexOfObjectIdenticalTo:v27];

        if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_23;
        }
        __int16 v29 = [(CKMessagesController *)self viewIfLoaded];
        id v23 = [v29 window];

        BOOL v30 = [(CKMessagesController *)self chatNavigationController];
        __int16 v31 = [v30 viewIfLoaded];

        id v32 = [(CKMessagesController *)self conversationListNavigationController];
        id v33 = [v32 viewIfLoaded];

        if (v23)
        {
          v34 = [v31 window];
          if (v34 == v23)
          {
            id v35 = [v33 window];

            if (v35 == v23)
            {
              __int16 v36 = [v31 superview];
              v37 = [v36 superview];
              uint64_t v38 = [v37 superview];

              if (v38 == v33)
              {
                if (IMOSLoggingEnabled())
                {
                  v39 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                  {
                    LOWORD(location[0]) = 0;
                    _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "ChatNavigationController's view is in the view hirearchy, but chatNaviationController is not in the VC hirearchy! Unexpected state, attempting to fix", (uint8_t *)location, 2u);
                  }
                }
                [v31 removeFromSuperview];
              }
            }
          }
          else
          {
          }
        }
      }
    }
  }
  else
  {
  }
LABEL_23:
  double v40 = [(CKMessagesController *)self chatController];

  if (!v40) {
    [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];
  }
  id v18 = [(CKMessagesController *)self chatNavigationController];
LABEL_26:

  return v18;
}

void __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setComposeChatNavigationController:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2;
  block[3] = &unk_1E56215C8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v3);
}

void __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endPinningInputViewsForReason:@"SplitViewFromCollapsedToExpandedTransition"];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKMessagesController;
  [(CKMessagesController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
  id v5 = +[CKUIBehavior sharedBehaviors];
  if (([v5 shouldSuppressRotationInNewCompose] & 1) == 0)
  {
    id v6 = +[CKUIBehavior sharedBehaviors];
    if ([v6 usesUncollapsedSplitview])
    {
      BOOL v7 = [(CKMessagesController *)self isComposingMessage];

      if (!v7) {
        return;
      }
      id v5 = +[CKAdaptivePresentationController sharedInstance];
      [v5 dismissViewControllerAnimated:0 completion:0];
    }
    else
    {
    }
  }
}

- (BOOL)_splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition:(id)a3
{
  return ![(CKMessagesController *)self isComposingMessage];
}

- (double)_splitViewController:(id)a3 constrainPrimaryColumnWidthForResizeWidth:(double)a4
{
  if (CKIsRunningInMacCatalyst())
  {
    long long v40 = 0uLL;
    uint64_t v41 = 0;
    [(CKMessagesController *)self columnResizeParams];
    [(CKMessagesController *)self primaryColumnWidth];
    double v7 = v6;
    objc_super v8 = +[CKUIBehavior sharedBehaviors];
    [v8 minConversationListWidth];
    double v10 = v9;
    BOOL v11 = v7 == v9;

    [(CKMessagesController *)self primaryColumnWidth];
    double v13 = v12;
    double v14 = +[CKUIBehavior sharedBehaviors];
    [v14 snapToMinConversationListWidth];
    double v16 = v15;
    int v17 = v13 == v15;

    if (!v11 && (BYTE1(v41) == v17 ? (BOOL v18 = v41 == a4 >= 0.0) : (BOOL v18 = 0), v18)) {
      double v19 = *(double *)&v40 + vabdd_f64(a4, *((double *)&v40 + 1));
    }
    else {
      double v19 = vabdd_f64(a4, *((double *)&v40 + 1));
    }
    *(double *)&long long v40 = v19;
    id v20 = +[CKUIBehavior sharedBehaviors];
    [v20 conversationListDragDistanceThreshold];
    double v22 = v21;

    if (v7 == v10)
    {
      id v23 = +[CKUIBehavior sharedBehaviors];
      if (v22 < *(double *)&v40 && a4 >= 0.0) {
        goto LABEL_12;
      }
    }
    else
    {
      if (v13 != v16)
      {
        if (a4 >= 0.0
          || v22 >= *(double *)&v40
          || (+[CKUIBehavior sharedBehaviors],
              __int16 v31 = objc_claimAutoreleasedReturnValue(),
              [v31 snapToMinConversationListWidth],
              double v33 = v32,
              v31,
              v33 <= a4))
        {
          __int16 v36 = +[CKUIBehavior sharedBehaviors];
          [v36 snapToMinConversationListWidth];
          double v30 = v37;

          if (v30 <= a4) {
            double v30 = a4;
          }
          goto LABEL_26;
        }
        v34 = +[CKUIBehavior sharedBehaviors];
        id v23 = v34;
        goto LABEL_24;
      }
      char v26 = +[CKUIBehavior sharedBehaviors];
      id v23 = v26;
      if (a4 >= 0.0)
      {
        [v26 snapToMinConversationListWidth];
        double v28 = v27;

        BOOL v29 = v28 <= a4;
        double v30 = a4;
        if (v29)
        {
LABEL_26:
          *((double *)&v40 + 1) = a4;
          LOBYTE(v41) = a4 >= 0.0;
          BYTE1(v41) = v17;
          BYTE2(v41) = v11;
          long long v38 = v40;
          uint64_t v39 = v41;
          [(CKMessagesController *)self setColumnResizeParams:&v38];
          return v30;
        }
        id v24 = +[CKUIBehavior sharedBehaviors];
        id v23 = v24;
        goto LABEL_13;
      }
      if (v22 >= *(double *)&v40)
      {
LABEL_12:
        id v24 = v23;
LABEL_13:
        [v24 snapToMinConversationListWidth];
LABEL_25:
        double v30 = v25;

        goto LABEL_26;
      }
    }
    v34 = v23;
LABEL_24:
    [v34 minConversationListWidth];
    goto LABEL_25;
  }
  return a4;
}

- (void)_splitViewController:(id)a3 willBeginResizingColumn:(int64_t)a4
{
  id v5 = [(CKMessagesController *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(CKMessagesController *)self chatController];
    [v7 chatControllerWillBeginResizing];
  }
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    BOOL v6 = [(CKMessagesController *)self isCollapsed];
    if (!a4 && !v6)
    {
      CKSetInboxVisibility(1);
      [(CKMessagesController *)self dismissKeyboardIfVisible];
    }
  }
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    BOOL v6 = [(CKMessagesController *)self isCollapsed];
    if (!a4 && !v6)
    {
      CKSetInboxVisibility(0);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (__CurrentTestName) {
    [v7 animateAlongsideTransition:&__block_literal_global_309_1 completion:&__block_literal_global_311_1];
  }
  if (!CKIsRunningInMacCatalyst()) {
    [(CKMessagesController *)self updateColumnWidths];
  }
}

void __75__CKMessagesController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PPTDidTransitionToSize" object:0];
}

- (void)setComposeChatController:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (CKCoreChatController *)a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      composeChatController = self->_composeChatController;
      int v8 = 138412546;
      double v9 = composeChatController;
      __int16 v10 = 2112;
      BOOL v11 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "updating composeChatController from: %@ to: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  id v7 = self->_composeChatController;
  self->_composeChatController = v4;
}

- (void)setComposeChatNavigationController:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (UINavigationController *)a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      composeChatNavigationController = self->_composeChatNavigationController;
      int v8 = 138412546;
      double v9 = composeChatNavigationController;
      __int16 v10 = 2112;
      BOOL v11 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "updating composeChatNavigationController from: %@ to: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  id v7 = self->_composeChatNavigationController;
  self->_composeChatNavigationController = v4;
}

- (void)dismissChatControllerIfVisibleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKMessagesController *)self isComposingMessage])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__CKMessagesController_dismissChatControllerIfVisibleAnimated___block_invoke;
    v5[3] = &unk_1E5620C40;
    v5[4] = self;
    [(CKMessagesController *)self dismissViewControllerAnimated:v3 completion:v5];
  }
  else
  {
    [(CKMessagesController *)self popToConversationListIfNecessaryAnimated:v3];
  }
}

uint64_t __63__CKMessagesController_dismissChatControllerIfVisibleAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAndDestroyComposition];
}

- (void)popToConversationListIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKMessagesController *)self conversationListNavigationController];
  BOOL v6 = [v5 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  int v8 = [(CKMessagesController *)self conversationListNavigationController];
  double v9 = [v8 visibleViewController];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (isKindOfClass & 1) != 0 || (v10)
  {
    [(CKMessagesController *)self updateInboxAndConversationList];
    id v13 = [(CKMessagesController *)self conversationListNavigationController];
    BOOL v11 = [(CKMessagesController *)self conversationListController];
    id v12 = (id)[v13 popToViewController:v11 animated:v3];
  }
}

- (void)escButtonPressed:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKMessagesController *)self chatController];
  BOOL v6 = [(CKMessagesController *)self conversationListController];
  [v6 dismissCatalystSearch];
  id v7 = [v6 collectionView];
  int v8 = [v7 indexPathsForSelectedItems];
  unint64_t v9 = [v8 count];

  if (IMOSLoggingEnabled())
  {
    char v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = @"NO";
      if (v9 < 2) {
        BOOL v11 = @"YES";
      }
      int v13 = 138412290;
      double v14 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "esc button pressed. will pass onto chat controller: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v9 >= 2) {
    id v12 = v6;
  }
  else {
    id v12 = v5;
  }
  [v12 escButtonPressed:v4];
}

- (void)keyCommandOpenConversationInNewWindow:(id)a3
{
  id v4 = [(CKMessagesController *)self currentConversation];
  [(CKMessagesController *)self showConversationInNewWindow:v4];
}

- (void)keyCommandNextConversation:(id)a3
{
}

- (void)keyCommandPreviousConversation:(id)a3
{
}

- (void)_keyCommandChangeConversation:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CKMessagesController *)self isCollapsed])
  {
    id v5 = [(CKMessagesController *)self conversationListController];
    [v5 selectNextSequentialConversation:v3];
  }
}

- (void)keyCommandSelectPinnedConversation:(id)a3
{
  id v7 = a3;
  if (![(CKMessagesController *)self isCollapsed])
  {
    id v4 = [v7 input];
    uint64_t v5 = [v4 integerValue];

    BOOL v6 = [(CKMessagesController *)self conversationListController];
    [v6 selectPinnedConversationForItem:v5];
  }
}

- (void)keyCommandSelectFirstActiveConversation
{
  if (![(CKMessagesController *)self isCollapsed])
  {
    id v3 = [(CKMessagesController *)self conversationListController];
    [v3 selectFirstActiveConversation];
  }
}

- (void)keyCommandDeleteConversation:(id)a3
{
  id v3 = [(CKMessagesController *)self conversationListController];
  [v3 recoverableDeleteSelectedConversations];
}

- (void)keyCommandFind:(id)a3
{
  id v3 = [(CKMessagesController *)self conversationListController];
  id v4 = v3;
  if (v3)
  {
    int v8 = v3;
    char v5 = [v3 isEditing];
    id v4 = v8;
    if ((v5 & 1) == 0)
    {
      BOOL v6 = [v8 searchController];
      id v7 = [v6 searchBar];
      [v7 becomeFirstResponder];

      id v4 = v8;
    }
  }
}

- (void)keyCommandCompose:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessagesController *)self conversationListController];
  [v5 composeButtonClicked:v4];
}

- (void)showDebugMenu
{
  id v2 = [(CKMessagesController *)self view];
  id v3 = [v2 window];
  id v4 = [v3 windowScene];
  id v5 = [v4 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 showDebugMenu];
  }
}

void __85__CKMessagesController__checkChatControllerLeaksForExistingController_newController___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __85__CKMessagesController__checkChatControllerLeaksForExistingController_newController___block_invoke_cold_1(v2, v4);
    }

    id v5 = *(void **)(a1 + 32);
    id v6 = objc_loadWeakRetained(v2);
    [v5 _showChatControllerLeakAlertUI:v6];
  }
}

- (void)_showChatControllerLeakAlertUI:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 conversation];
  int v6 = [v5 hasDisplayName];

  id v7 = [v4 conversation];
  int v8 = v7;
  if (v6) {
    [v7 displayName];
  }
  else {
  unint64_t v9 = [v7 name];
  }

  char v10 = [NSString stringWithFormat:@"%@", v4];
  BOOL v11 = [NSString stringWithFormat:@"Chat controller %@ leaked in conversation %@. Please take a memory dump and file a radar!", v4, v9];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
  uint64_t v25 = *MEMORY[0x1E4FB06F8];
  int v13 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
  v26[0] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  uint64_t v15 = [v11 rangeOfString:v10];
  objc_msgSend(v12, "addAttributes:range:", v14, v15, v16);
  uint64_t v17 = [v11 rangeOfString:v9];
  objc_msgSend(v12, "addAttributes:range:", v14, v17, v18);
  double v19 = [MEMORY[0x1E4F42728] alertControllerWithTitle:@"Chat Controller Leak Detected!" message:0 preferredStyle:1];
  [v19 _setAttributedMessage:v12];
  id v20 = +[CKAlertAction actionWithTitle:@"OK 😭" style:1 handler:&__block_literal_global_335_0];
  [v19 addAction:v20];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__CKMessagesController__showChatControllerLeakAlertUI___block_invoke_2;
  v23[3] = &unk_1E5621178;
  id v24 = v10;
  id v21 = v10;
  double v22 = +[CKAlertAction actionWithTitle:@"File a Radar" style:0 handler:v23];
  [v19 addAction:v22];

  [(CKMessagesController *)self presentViewController:v19 animated:1 completion:0];
}

uint64_t __55__CKMessagesController__showChatControllerLeakAlertUI___block_invoke_2(uint64_t a1)
{
  return +[CKTapToRadar launchTapToRadarForChatControllerLeak:*(void *)(a1 + 32)];
}

- (void)toggleSensitiveUI
{
  char v3 = IMGetDomainBoolForKey();
  id v4 = [MEMORY[0x1E4F42728] alertControllerWithTitle:@"End Messages?" message:@"Messages needs to be restarted for sensitiveUI changes to take effect." preferredStyle:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CKMessagesController_toggleSensitiveUI__block_invoke;
  v7[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  char v8 = v3;
  id v5 = +[CKAlertAction actionWithTitle:@"End Messages" style:2 handler:v7];
  [v4 addAction:v5];

  int v6 = +[CKAlertAction actionWithTitle:@"Cancel" style:1 handler:&__block_literal_global_359_1];
  [v4 addAction:v6];

  [(CKMessagesController *)self presentViewController:v4 animated:1 completion:&__block_literal_global_361_1];
}

void __41__CKMessagesController_toggleSensitiveUI__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  IMSetDomainBoolForKey();
  exit(0);
}

- (BOOL)_isShowingFullscreenController
{
  id v2 = [(CKMessagesController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_isShowingModalChatController
{
  BOOL v3 = [(CKMessagesController *)self presentedViewController];
  id v4 = [(CKMessagesController *)self composeChatNavigationController];
  if (v3 == v4)
  {
    int v6 = [(CKMessagesController *)self composeChatNavigationController];
    id v7 = [v6 topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return [(CKMessagesController *)self _isShowingFullscreenController] & isKindOfClass;
}

- (BOOL)_isShowingExpandedAppViewController
{
  id v2 = [(CKMessagesController *)self chatNavigationController];
  BOOL v3 = [v2 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSSet)alertSuppressionContexts
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  BOOL v4 = [(CKMessagesController *)self _isShowingModalChatController];
  BOOL v5 = [(CKMessagesController *)self _isShowingFullscreenController];
  BOOL v6 = [(CKMessagesController *)self _isShowingExpandedAppViewController];
  id v7 = [(CKMessagesController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v5 && !v4 && !v6 && (isKindOfClass & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_29;
    }
    unint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412802;
      double v27 = @"YES";
      __int16 v28 = 2112;
      BOOL v29 = @"NO";
      __int16 v30 = 2112;
      __int16 v31 = @"NO";
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Not adding suppression contexts: isShowingFullscreenController (%@), modalChatControllerIsVisible (%@), isShowingExpandedAppViewController (%@)", (uint8_t *)&v26, 0x20u);
    }
LABEL_27:

    goto LABEL_29;
  }
  BOOL v10 = [(CKMessagesController *)self isShowingConversationListController];
  BOOL v11 = [(CKMessagesController *)self presentedViewController];

  char v12 = [(CKMessagesController *)self isEditing];
  if (v10 && !v11 && (v12 & 1) == 0)
  {
    int v13 = [(CKMessagesController *)self conversationListController];
    double v14 = +[CKConversationList conversationListAlertSuppressionContextForFilterMode:](CKConversationList, "conversationListAlertSuppressionContextForFilterMode:", [v13 filterMode]);

    [(__CFString *)v3 addObject:v14];
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412290;
        double v27 = v3;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Adding alert suppression contexts for conversation list: %@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  BOOL v16 = [(CKMessagesController *)self isShowingChatController];
  if ((v16 | [(CKMessagesController *)self isComposingMessage] | v6) != 1)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_29;
    }
    unint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Not adding alert suppression contexts for conversation: chat controller is not being shown for this scene", (uint8_t *)&v26, 2u);
    }
    goto LABEL_27;
  }
  uint64_t v17 = [(CKMessagesController *)self currentConversation];
  BOOL v18 = v17 == 0;

  double v19 = [(CKMessagesController *)self conversationList];
  id v20 = [v19 pendingConversation];

  if (v20) {
    BOOL v21 = 0;
  }
  else {
    BOOL v21 = v18;
  }
  if (v21)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_29;
    }
    unint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Not adding alert suppression contexts for conversation: no conversation is currently presented for this scene", (uint8_t *)&v26, 2u);
    }
    goto LABEL_27;
  }
  double v22 = [(CKMessagesController *)self currentConversation];
  id v23 = +[CKAlertSuppressionContextHelper alertSuppressionContextsForVisibleChatControllerWithConversation:v22];

  [(__CFString *)v3 addObjectsFromArray:v23];
LABEL_29:
  id v24 = (void *)[(__CFString *)v3 copy];

  return (NSSet *)v24;
}

- (void)__updateAlertSuppressionContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CKMessagesController___updateAlertSuppressionContext__block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__CKMessagesController___updateAlertSuppressionContext__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) alertSuppressionContexts];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 138412290;
      BOOL v4 = v1;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Updating alert suppression contexts with SpringBoard: %@", (uint8_t *)&v3, 0xCu);
    }
  }
  SBSSetAlertSuppressionContexts();
}

- (void)setupBizNavBarForConversation:(id)a3
{
  id v8 = a3;
  if ([(CKMessagesController *)self isCollapsed]
    && [v8 isBusinessConversation])
  {
    BOOL v4 = [(CKMessagesController *)self conversationListController];
    uint64_t v5 = [v4 navigationController];
    BOOL v6 = [v5 navigationBar];
    id v7 = [v8 chat];
    [v6 enableBranding:1 forBusinessChat:v7];
  }
}

- (void)cleanUpBizNavBarForConversation:(id)a3
{
  id v8 = a3;
  if ([(CKMessagesController *)self isCollapsed])
  {
    BOOL v4 = [(CKMessagesController *)self conversationListController];
    uint64_t v5 = [v4 navigationController];
    BOOL v6 = [v5 navigationBar];
    id v7 = [v8 chat];
    [v6 enableBranding:0 forBusinessChat:v7];
  }
}

- (void)_conversationLeft:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "++++ ChatKit Internal Consistency Error ++++", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = (id)objc_opt_class();
        BOOL v10 = [v4 object];
        BOOL v11 = objc_opt_class();
        *(_DWORD *)buf = 136315650;
        __int16 v36 = "-[CKMessagesController _conversationLeft:]";
        __int16 v37 = 2112;
        id v38 = v9;
        __int16 v39 = 2112;
        long long v40 = v11;
        id v12 = v11;
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      uint64_t v13 = objc_opt_class();
      double v14 = [v4 object];
      uint64_t v33 = v13;
      uint64_t v34 = objc_opt_class();
      __int16 v31 = "-[CKMessagesController _conversationLeft:]";
      _CKLog();
    }
    if (_CKShouldLog()) {
      _CKLogBacktrace();
    }
  }
  objc_msgSend(v4, "object", v31, v33, v34);
  uint64_t v15 = (char *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = [v4 userInfo];
  uint64_t v17 = [v16 objectForKey:@"CKConversationListWasPendingKey"];
  int v18 = [v17 BOOLValue];

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    double v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v36 = v15;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_DEBUG, "Conversation left: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v32 = v15;
    _CKLog();
  }
  id v20 = [(CKMessagesController *)self conversationList];
  char v21 = [v20 remergingConversations];

  if (v21)
  {
    if (IMOSLoggingEnabled())
    {
      double v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Not acting on conversationLeft:, remerge in process", buf, 2u);
      }
    }
  }
  else if (v18)
  {
    id v23 = [(CKMessagesController *)self composeChatController];

    if (v23)
    {
      id v24 = [(CKMessagesController *)self composeChatController];
      [v24 conversationLeft];
    }
  }
  else
  {
    uint64_t v25 = [(CKMessagesController *)self chatController];
    int v26 = [v25 conversation];
    int v27 = [v26 isEqual:v15];

    if (v27)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v36 = "-[CKMessagesController _conversationLeft:]";
          _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "%s popping to conversation list", buf, 0xCu);
        }
      }
      [(CKMessagesController *)self showConversationListWithAnimation:1];
      BOOL v29 = [(CKMessagesController *)self chatController];
      [v29 setDelegate:0];

      [(CKMessagesController *)self setChatController:0];
      [(CKMessagesController *)self setCurrentConversation:0];
      id v30 = objc_alloc_init(MEMORY[0x1E4FA69B8]);
      [v30 deleteSnapshotsForApplicationIdentifier:@"com.apple.MobileSMS"];
      [v30 invalidate];
    }
  }
}

- (void)_conversationListFinishedMerging:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKMessagesController *)self currentConversation];
  BOOL v6 = [(CKMessagesController *)self conversationList];
  id v7 = [v5 chat];
  id v8 = [v7 guid];
  id v9 = [v6 conversationForExistingChatWithGUID:v8];

  if (v9)
  {
    if (v5 != v9)
    {
      [(CKMessagesController *)self setCurrentConversation:v9];
      if (IMOSLoggingEnabled())
      {
        BOOL v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412546;
          id v12 = v9;
          __int16 v13 = 2112;
          double v14 = v5;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Conversation list performed re-merge, updating current conversation to %@ from %@", (uint8_t *)&v11, 0x16u);
        }
LABEL_11:
      }
    }
  }
  else if (v5 && IMOSLoggingEnabled())
  {
    BOOL v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "CKMessagesController attempted to replace conversation after re-merge, but couldn't find a new conversation to replace %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_11;
  }
}

- (void)_chatRegistryDidLoad:(id)a3
{
  id v4 = +[CKCurrentConversationsManager sharedInstance];
  [v4 pruneCache];

  uint64_t v5 = [(CKMessagesController *)self _hasCurrentConversations] ^ 1;

  [(CKMessagesController *)self _setIsShowingNoSelectionUI:v5];
}

- (void)applicationWillResume:(id)a3
{
  if (CKIsRunningInMacCatalyst())
  {
    id v4 = [(CKMessagesController *)self chatController];
    [v4 _markAsReadIfNecessary];
  }
}

- (void)_appStateDidResumeFromInactive:(id)a3
{
  [(CKMessagesController *)self presentFocusStatusAuthorizationAlertIfNecessary];
  id v3 = [MEMORY[0x1E4F6E788] sharedManager];
  [v3 updateFocusStateForCurrentFocusFilterActionAsync];
}

- (id)nonConversationListControllersInNavigationStack
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(CKMessagesController *)self conversationListNavigationController];
  uint64_t v5 = [v4 viewControllers];

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
        BOOL v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [(CKMessagesController *)self inboxViewController];
        if (v10 == (void *)v11)
        {
        }
        else
        {
          id v12 = (void *)v11;
          __int16 v13 = [(CKMessagesController *)self conversationListControllerIfInitialized];

          if (v10 != v13) {
            [v3 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)showInboxViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKMessagesController *)self _shouldShowInboxView])
  {
    [(CKMessagesController *)self updateInboxAndConversationList];
    if ([(CKMessagesController *)self _wantsThreeColumnLayout])
    {
      [(CKMessagesController *)self showColumn:0];
LABEL_10:
      [(CKMessagesController *)self dismissKeyboardIfVisible];
      return;
    }
    uint64_t v6 = [(CKMessagesController *)self inboxViewController];

    if (v6)
    {
      uint64_t v7 = [(CKMessagesController *)self conversationListNavigationController];
      uint64_t v8 = [(CKMessagesController *)self inboxViewController];
      id v9 = (id)[v7 popToViewController:v8 animated:v3];

      goto LABEL_10;
    }
    BOOL v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKMessagesController showInboxViewControllerAnimated:](self);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Attempted to pop the inbox view when the inbox view should not be available. No change to conversationListNavigationController", v11, 2u);
    }
  }
}

- (void)changeFilterMode:(unint64_t)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CKMessagesController changeFilterMode:]();
  }

  uint64_t v6 = [(CKMessagesController *)self conversationList];
  [v6 releaseWasKnownSenderHold];

  uint64_t v7 = [(CKMessagesController *)self conversationList];
  [v7 updateConversationsWasKnownSender];

  uint64_t v8 = [(CKMessagesController *)self conversationList];
  [v8 clearHoldInUnreadFilter];

  id v9 = [(CKMessagesController *)self conversationListController];
  uint64_t v10 = [v9 filterMode];

  uint64_t v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CKMessagesController changeFilterMode:](v10, a3);
  }

  id v12 = [(CKMessagesController *)self conversationListController];
  [v12 setFilterMode:a3];

  __int16 v13 = [(CKMessagesController *)self conversationListController];
  double v14 = [v13 contentScrollView];
  objc_msgSend(v14, "__ck_scrollToTop:", 0);

  long long v15 = [(CKMessagesController *)self conversationListController];
  [v15 updateConversationList];

  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    if (!CKIsRunningInMacCatalyst()) {
      [(CKMessagesController *)self hideColumn:0];
    }
    [(CKMessagesController *)self showColumn:1];
  }
  else
  {
    long long v16 = [(CKMessagesController *)self inboxViewController];
    long long v17 = [v16 navigationController];
    long long v18 = [(CKMessagesController *)self conversationListController];
    [v17 pushViewController:v18 animated:1];
  }
  unint64_t v19 = [MEMORY[0x1E4F6E938] conversationFilterModeForMessageFilter:a3];
  uint64_t v20 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v21 = *MEMORY[0x1E4F6D868];
  v25[0] = @"ChoseFilter";
  v24[0] = @"actionType";
  v24[1] = @"filterType";
  double v22 = CKConversationListFilterModeStringValue(v19);
  void v24[2] = @"fromView";
  v25[1] = v22;
  void v25[2] = @"InboxView";
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v20 trackEvent:v21 withDictionary:v23];
}

- (id)inboxItemForFilterMode:(unint64_t)a3 title:(id)a4 andSystemImage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = CKFrameworkBundle();
  uint64_t v11 = [v10 localizedStringForKey:v9 value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v12 = [(CKMessagesController *)self inboxItemForFilterMode:a3 localizedTitle:v11 andSystemImage:v8];

  return v12;
}

- (id)inboxItemForFilterMode:(unint64_t)a3 localizedTitle:(id)a4 andSystemImage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(CKMessagesController *)self _unreadCountStringForFilterMode:a3];
  id v11 = objc_alloc(MEMORY[0x1E4F77E80]);
  id v12 = [NSNumber numberWithUnsignedInteger:a3];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__CKMessagesController_inboxItemForFilterMode_localizedTitle_andSystemImage___block_invoke;
  v15[3] = &unk_1E5622950;
  v15[4] = self;
  v15[5] = a3;
  __int16 v13 = (void *)[v11 initWithTitle:v9 subtitle:0 systemImage:v8 accessoryText:v10 filterMode:v12 action:v15];

  return v13;
}

uint64_t __77__CKMessagesController_inboxItemForFilterMode_localizedTitle_andSystemImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeFilterMode:*(void *)(a1 + 40)];
}

- (id)newInboxModel
{
  v59[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(CKMessagesController *)self inboxItemForFilterMode:1 title:@"ALL_MESSAGES" andSystemImage:@"message.and.message"];
  [v3 addObject:v4];
  v53 = self;
  if ([(CKMessagesController *)self _isMessageFilteringEnabled])
  {
    uint64_t v5 = [(CKMessagesController *)self inboxItemForFilterMode:2 title:@"KNOWN_SENDERS" andSystemImage:@"person.crop.circle"];
    v59[0] = v5;
    uint64_t v6 = [(CKMessagesController *)v53 inboxItemForFilterMode:3 title:@"UNKNOWN_SENDERS" andSystemImage:@"person.crop.circle.badge.questionmark"];
    v59[1] = v6;
    uint64_t v7 = [(CKMessagesController *)v53 inboxItemForFilterMode:8 title:@"UNREAD_MESSAGES" andSystemImage:@"message.badge"];
    v59[2] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
    [v3 addObjectsFromArray:v8];
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = objc_alloc(MEMORY[0x1E4F77E90]);
  id v11 = (void *)[v3 copy];
  id v12 = (void *)[v10 initWithHeader:0 footer:0 items:v11];

  [v9 addObject:v12];
  __int16 v13 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"spamFiltrationExtensionName");
  if ([v13 length])
  {
    double v48 = v12;
    double v49 = v9;
    __int16 v50 = v4;
    id v51 = v3;
    double v14 = NSString;
    long long v15 = CKFrameworkBundle();
    long long v16 = [v15 localizedStringForKey:@"FILTERED_BY_APP_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v47 = v13;
    long long v17 = objc_msgSend(v14, "stringWithFormat:", v16, v13);

    long long v18 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v19 = [v18 userInterfaceLayoutDirection];

    if (v19 == 1) {
      uint64_t v20 = @"\u200F";
    }
    else {
      uint64_t v20 = @"\u200E";
    }
    char v46 = [(__CFString *)v20 stringByAppendingString:v17];

    BOOL v21 = CKIsBlackholeEnabled();
    double v22 = CKFrameworkBundle();
    id v23 = v22;
    if (v21) {
      id v24 = @"JUNK_BLACKHOLE_SENDER_TITLE";
    }
    else {
      id v24 = @"JUNK_SENDER_TITLE";
    }
    double v45 = [v22 localizedStringForKey:v24 value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v25 = (void *)[MEMORY[0x1E4F1CA48] init];
    int v26 = (void *)[v25 alloc];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
    uint64_t v27 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(obj);
          }
          __int16 v31 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v32 = [v31 filterMode];
          uint64_t v33 = IMSharedUtilitiesFrameworkBundle();
          uint64_t v34 = [v31 folderName];
          id v35 = [v33 localizedStringForKey:v34 value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
          __int16 v36 = [v31 iconName];
          __int16 v37 = [(CKMessagesController *)v53 inboxItemForFilterMode:v32 title:v35 andSystemImage:v36];
          [v26 addObject:v37];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v28);
    }

    id v38 = [(CKMessagesController *)v53 inboxItemForFilterMode:6 title:v45 andSystemImage:@"xmark.bin"];
    [v26 addObject:v38];

    id v39 = objc_alloc(MEMORY[0x1E4F77E90]);
    long long v40 = (void *)[v26 copy];
    uint64_t v41 = (void *)[v39 initWithHeader:v46 footer:0 items:v40];

    id v9 = v49;
    [v49 addObject:v41];

    id v4 = v50;
    id v3 = v51;
    __int16 v13 = v47;
    id v12 = v48;
  }
  if (CKIsBlackholeEnabled()) {
    uint64_t v42 = &__block_literal_global_449_1;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F77E88]) initWithSections:v9 footerAction:v42];
  objc_msgSend(v43, "setIsCollapsed:", -[CKMessagesController isCollapsed](v53, "isCollapsed"));
  [v43 setLogInboxViewedMetric:&__block_literal_global_461_1];

  return v43;
}

void __37__CKMessagesController_newInboxModel__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"prefs:root=MESSAGES&path=JUNK_CONVERSATIONS_BUTTON"];
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v2 withOptions:0];

  v1 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v1 trackEvent:*MEMORY[0x1E4F6D868] withDictionary:&unk_1EDF17C08];
}

void __37__CKMessagesController_newInboxModel__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v0 trackEvent:*MEMORY[0x1E4F6D868] withDictionary:&unk_1EDF17C30];
}

- (id)_unreadCountStringForFilterMode:(unint64_t)a3
{
  id v4 = [(CKMessagesController *)self conversationList];
  uint64_t v5 = [v4 unreadCountForFilterMode:a3];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
  uint64_t v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "__ck_localizedString");
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = &stru_1EDE4CA38;
  }

  return v8;
}

- (void)persistColumnWidths:(id)a3
{
  if (CKIsRunningInMacCatalyst())
  {
    [(CKMessagesController *)self primaryColumnWidth];
    -[CKMessagesController _sanitizeProposedConversationListWidth:](self, "_sanitizeProposedConversationListWidth:");
    CKSetConversationListPersistedWidth(v4);
  }
}

- (double)_macConvertLegacySidebarWidthToModernWidth:(double)a3
{
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 defaultConversationListWidth];
  double v6 = v5;

  if (!CKIsRunningInMacCatalyst()) {
    return v6;
  }
  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  [v7 legacyMacAppSnapToMinConversationListWidth];
  double v9 = v8;

  id v10 = +[CKUIBehavior sharedBehaviors];
  id v11 = v10;
  if (v9 > a3)
  {
    [v10 minConversationListWidth];
LABEL_10:
    double v6 = v12;
    goto LABEL_11;
  }
  [v10 legacyMacAppSnapToMinConversationListWidth];
  double v14 = v13;

  id v11 = +[CKUIBehavior sharedBehaviors];
  [v11 snapToMinConversationListWidth];
  double v6 = v15;
  if (v14 != a3)
  {
    if (v15 >= a3)
    {
    }
    else
    {
      long long v16 = +[CKUIBehavior sharedBehaviors];
      [v16 maxConversationListWidth];
      double v18 = v17;

      if (v18 > a3) {
        return a3;
      }
    }
    id v11 = +[CKUIBehavior sharedBehaviors];
    [v11 maxConversationListWidth];
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (void)conversationListControllerWillPresentSearchResultsController
{
  if (CKIsRunningInMacCatalyst())
  {
    [(CKMessagesController *)self persistColumnWidths:self];
    id v3 = +[CKUIBehavior sharedBehaviors];
    [v3 defaultConversationListWidth];
    -[CKMessagesController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:");
  }
}

- (void)conversationListControllerWillDismissSearchResultsController
{
  id v3 = [(CKMessagesController *)self conversationListController];
  int v4 = [v3 isSearchActive];

  if (v4)
  {
    double v5 = [(CKMessagesController *)self chatController];

    if (v5)
    {
      uint64_t v6 = [(CKMessagesController *)self chatController];
    }
    else
    {
      uint64_t v7 = [(CKMessagesController *)self composeChatController];

      if (!v7)
      {
LABEL_7:
        [v7 restoreInputAfterSearchPresentation];

        goto LABEL_8;
      }
      uint64_t v6 = [(CKMessagesController *)self composeChatController];
    }
    uint64_t v7 = (void *)v6;
    goto LABEL_7;
  }
LABEL_8:
  if (CKIsRunningInMacCatalyst())
  {
    double v8 = +[CKUIBehavior sharedBehaviors];
    [v8 minConversationListWidth];
    -[CKMessagesController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:");

    [(CKMessagesController *)self updateColumnWidths];
  }
}

- (void)conversationListUpdatedSelectedIndexPathCount:(int64_t)a3
{
  id v5 = [(CKMessagesController *)self conversationListController];
  if (a3 == 1
    && ![(CKMessagesController *)self hasRecentlyDeletedFilterSelected]
    && CKIsRunningInMacCatalyst())
  {
    [v5 _performMultiSelectCleanUp];
  }
  else
  {
    [(CKMessagesController *)self _updateSelectionViewWithCount:a3];
  }
}

- (void)updatedFilterMode:(unint64_t)a3 previousFilterMode:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = CKConversationListFilterModeStringValue(a3);
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "[Filter Mode] Filter mode was updated to: %@. selection view controller needs update if presented", (uint8_t *)&v9, 0xCu);
    }
  }
  double v8 = [(CKMessagesController *)self selectionViewController];
  [v8 _setNeedsUpdateContentUnavailableConfiguration];
}

- (void)_updateSelectionViewWithCount:(int64_t)a3
{
  id v3 = [(CKMessagesController *)self selectionViewController];
  [v3 _setNeedsUpdateContentUnavailableConfiguration];
}

- (id)_recentlyDeletedDisclosureText
{
  id v2 = [(CKMessagesController *)self conversationListController];
  id v3 = [v2 _recentlyDeletedDisclosureLabelText];

  return v3;
}

- (void)conversationListDidBeginMultipleSelectionWithInitialSelectedCount:(int64_t)a3
{
  [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];

  [(CKMessagesController *)self _updateSelectionViewWithCount:a3];
}

- (id)currentlyShownConversation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKMessagesController *)self junkModalMessagesController];
  int v4 = v3;
  if (v3)
  {
    id v5 = [v3 currentlyShownConversation];
    goto LABEL_21;
  }
  BOOL v6 = [(CKMessagesController *)self isCollapsed];
  if (!v6)
  {
    if ([(CKMessagesController *)self isShowingSelectionView])
    {
      double v8 = 0;
LABEL_19:
      id v5 = 0;
      goto LABEL_20;
    }
    double v8 = [(CKMessagesController *)self chatNavigationController];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__76;
    *(void *)&long long v20 = __Block_byref_object_dispose__76;
    *((void *)&v20 + 1) = 0;
    id v5 = [v8 viewControllers];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__CKMessagesController_currentlyShownConversation__block_invoke;
    v17[3] = &unk_1E562C5C8;
    void v17[4] = buf;
    [v5 enumerateObjectsUsingBlock:v17];

    uint64_t v9 = *(void *)(*(void *)&buf[8] + 40);
    if (v9)
    {
      id v5 = [*(id *)(*(void *)&buf[8] + 40) conversation];
    }
    _Block_object_dispose(buf, 8);

    if (v9) {
      goto LABEL_20;
    }
LABEL_12:
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [(CKMessagesController *)self viewControllers];
        if (v6) {
          double v12 = @"YES";
        }
        else {
          double v12 = @"NO";
        }
        double v13 = [v8 viewControllers];
        double v14 = [(CKMessagesController *)self conversationListNavigationController];
        double v15 = [v14 viewControllers];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v19 = v13;
        LOWORD(v20) = 2112;
        *(void *)((char *)&v20 + 2) = v15;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "CKMessagesController warning: Was not able to determine the currently shown conversation in the current viewControllers configuration: %@, isCollapsed: %@, chatNavigation.viewControllers: %@, conversationNavigation.viewControllers: %@", buf, 0x2Au);
      }
    }
    goto LABEL_19;
  }
  if (![(CKMessagesController *)self isTopVCChatNavigationController])
  {
    double v8 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = [(CKMessagesController *)self chatController];
  id v5 = [v7 conversation];

  double v8 = 0;
LABEL_20:

LABEL_21:

  return v5;
}

void __50__CKMessagesController_currentlyShownConversation__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)catalystFiltersNavigationBackButtonTapped:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Filter Mode] Catalyst back button tapped. Transitioning to No Junk", v6, 2u);
    }
  }
  [(CKMessagesController *)self catalystFilterModeSelected:1];
}

- (void)_conversationFilteringStateChangedNotification:(id)a3
{
  id v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [(CKMessagesController *)self conversationListNavigationController];
  [v4 setupNavBarAppearanceWithNavigationController:v5];

  [(CKMessagesController *)self updateInboxAndConversationList];
}

- (void)screenTimeOKPressedForChatController:(id)a3
{
  [(CKMessagesController *)self setCurrentConversation:0];
  id v4 = [(CKMessagesController *)self conversationListController];
  [v4 updateConversationSelection];

  [(CKMessagesController *)self showConversationListWithAnimation:1];
}

- (void)conversationListFailedToSelectShownConversation
{
  if ([(CKMessagesController *)self _isCollapsed])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v3 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    __int16 v7 = 0;
    id v4 = "Failed to select shown conversation called but shouldn't be showing conversaiton list + chat controller at the same time.";
    id v5 = (uint8_t *)&v7;
LABEL_9:
    _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
LABEL_10:

    return;
  }
  if ([(CKMessagesController *)self _isSendingNewComposeMessage])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v3 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    __int16 v6 = 0;
    id v4 = "Maintaining current conversation selection during New Compose transition.";
    id v5 = (uint8_t *)&v6;
    goto LABEL_9;
  }

  [(CKMessagesController *)self updateForNoConversationSelected];
}

- (BOOL)_isSendingNewComposeMessage
{
  id v2 = [(CKMessagesController *)self composeChatController];
  char v3 = [v2 isSendingMessage];

  return v3;
}

- (void)chatController:(id)a3 didDetachDetailsNavigationController:(id)a4
{
  [(CKMessagesController *)self setDetailsNavigationController:a4];
  id v5 = [(CKMessagesController *)self detailsNavigationController];
  [v5 setIsDetached:1];

  [(CKMessagesController *)self tearDownCKDismissOnInteractionView];
}

- (BOOL)hasDetailsNavigationController
{
  id v2 = [(CKMessagesController *)self detailsNavigationController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUseMinimumSafeAreas
{
  id v2 = [(CKMessagesController *)self view];
  char v3 = [v2 _usesMinimumSafeAreas];

  return v3;
}

- (BOOL)isDetailsNavigationControllerDetached
{
  id v2 = [(CKMessagesController *)self detailsNavigationController];
  char v3 = [v2 isDetached];

  return v3;
}

- (void)presentDetailsNavigationController:(id)a3
{
  id v6 = a3;
  id v4 = [(CKMessagesController *)self detailsNavigationController];

  id v5 = v6;
  if (v4 != v6)
  {
    [(CKMessagesController *)self setDetailsNavigationController:v6];
    id v5 = v6;
  }
}

- (void)presentDetailsViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKMessagesController *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(CKMessagesController *)self chatController];
    [v7 presentDetailsViewControllerAnimated:v3];
  }
}

- (void)dismissDetailsControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKMessagesController *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(CKMessagesController *)self chatController];
    [v7 dismissDetailsControllerAnimated:v3];
  }
}

- (void)dismissDetailsNavigationController
{
  BOOL v3 = [(CKMessagesController *)self detailsNavigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [(CKMessagesController *)self setDetailsNavigationController:0];

  [(CKMessagesController *)self tearDownCKDismissOnInteractionView];
}

- (void)dismissDetailsViewAndShowConversationList
{
  BOOL v3 = [(CKMessagesController *)self detailsNavigationController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CKMessagesController_dismissDetailsViewAndShowConversationList__block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __65__CKMessagesController_dismissDetailsViewAndShowConversationList__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDetailsNavigationController:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 showConversationListWithAnimation:1];
}

- (void)showConversationList
{
}

- (void)dismissAndReopenDetailsNavigationController
{
  BOOL v3 = [(CKMessagesController *)self detailsNavigationController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__CKMessagesController_dismissAndReopenDetailsNavigationController__block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __67__CKMessagesController_dismissAndReopenDetailsNavigationController__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDetailsNavigationController:0];
  id v2 = [*(id *)(a1 + 32) chatController];
  [v2 presentDetailsViewController];
}

- (void)setupCKDismissOnInteractionView
{
  BOOL v3 = [CKInteractionNotificationView alloc];
  id v4 = [(CKMessagesController *)self view];
  [v4 bounds];
  id v5 = -[CKInteractionNotificationView initWithFrame:](v3, "initWithFrame:");
  [(CKMessagesController *)self setDismissOnInteractionView:v5];

  id v6 = [(CKMessagesController *)self dismissOnInteractionView];
  [v6 setDelegate:self];

  id v7 = [(CKMessagesController *)self dismissOnInteractionView];
  [v7 setAutoresizingMask:18];

  id v9 = [(CKMessagesController *)self view];
  double v8 = [(CKMessagesController *)self dismissOnInteractionView];
  [v9 addSubview:v8];
}

- (void)tearDownCKDismissOnInteractionView
{
  BOOL v3 = [(CKMessagesController *)self dismissOnInteractionView];
  [v3 removeFromSuperview];

  [(CKMessagesController *)self setDismissOnInteractionView:0];
}

void __44__CKMessagesController_executeDeferredTasks__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentFocusStatusAuthorizationAlertIfNecessary];

  id v3 = objc_loadWeakRetained(v1);
  [v3 checkForRCSAndCarrierAlerts];
}

- (id)_sharedBalloonPluginManager
{
  return +[CKBalloonPluginManager sharedInstance];
}

- (void)showNewMessageCompositionPanel
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 animated:(BOOL)a5
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 chatID:(id)a5 animated:(BOOL)a6
{
  LOBYTE(v6) = 0;
  [(CKMessagesController *)self showNewMessageCompositionPanelWithRecipients:a3 chatID:a5 composition:a4 appendToExistingDraft:0 suggestedReplies:0 animated:a6 bizIntent:0 launchPluginWithBundleID:0 pluginLaunchPayload:0 startAudioRecording:v6 simID:0 sendMessageHandler:0];
}

- (void)showNewMessageCompositionPanelAppendingToExistingDraft:(id)a3 animated:(BOOL)a4
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 sendMessageHandler:(id)a7
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 animated:(BOOL)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 bizIntent:(id)a7 launchPluginWithBundleID:(id)a8 pluginLaunchPayload:(id)a9 sendMessageHandler:(id)a10
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 appendToExistingDraft:(BOOL)a5 suggestedReplies:(id)a6 animated:(BOOL)a7 bizIntent:(id)a8 launchPluginWithBundleID:(id)a9 pluginLaunchPayload:(id)a10 sendMessageHandler:(id)a11
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 bizIntent:(id)a7 launchPluginWithBundleID:(id)a8 pluginLaunchPayload:(id)a9 simID:(id)a10 sendMessageHandler:(id)a11
{
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 appendToExistingDraft:(BOOL)a5 suggestedReplies:(id)a6 animated:(BOOL)a7 bizIntent:(id)a8 launchPluginWithBundleID:(id)a9 pluginLaunchPayload:(id)a10 simID:(id)a11 sendMessageHandler:(id)a12
{
  LOBYTE(v12) = 0;
  [(CKMessagesController *)self showNewMessageCompositionPanelWithRecipients:a3 chatID:0 composition:a4 appendToExistingDraft:a5 suggestedReplies:a6 animated:a7 bizIntent:a8 launchPluginWithBundleID:a9 pluginLaunchPayload:a10 startAudioRecording:v12 simID:a11 sendMessageHandler:a12];
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 chatID:(id)a4 composition:(id)a5 appendToExistingDraft:(BOOL)a6 suggestedReplies:(id)a7 animated:(BOOL)a8 bizIntent:(id)a9 launchPluginWithBundleID:(id)a10 pluginLaunchPayload:(id)a11 startAudioRecording:(BOOL)a12 simID:(id)a13 sendMessageHandler:(id)a14
{
  BOOL v34 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v37 = a4;
  id v19 = a5;
  id v36 = a7;
  id v38 = a9;
  id v39 = a10;
  id v20 = a11;
  id v21 = a13;
  id v22 = a14;
  kdebug_trace();
  if ([(CKMessagesController *)self shouldShowMakoIMessageAlert])
  {
    [(CKMessagesController *)self showMakoIMessageAlert];
  }
  else if (([MEMORY[0x1E4F6BDC0] smsEnabled] & 1) != 0 || CKiMessageSupported())
  {
    id v23 = v18;
    if (v18 && v19)
    {
      id v24 = v37;
      id v25 = v19;
    }
    else
    {
      int v26 = +[CKDraftManager sharedInstance];
      uint64_t v27 = v26;
      if (v23) {
        uint64_t v28 = 0;
      }
      else {
        uint64_t v28 = &v41;
      }
      if (!v23) {
        id v41 = 0;
      }
      id v40 = 0;
      uint64_t v29 = [v26 draftForPendingConversationWithRecipients:v28 chatIdentifier:&v40];
      if (!v23) {
        id v23 = v41;
      }
      id v24 = v40;

      if (v34 && v29)
      {
        id v30 = [v29 compositionByAppendingComposition:v19];
      }
      else
      {
        if (v19) {
          __int16 v31 = v19;
        }
        else {
          __int16 v31 = v29;
        }
        id v30 = v31;
      }
      id v25 = v30;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v18;
        _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Showing new compose with recipients %@", buf, 0xCu);
      }
    }
    BYTE1(v33) = a8;
    LOBYTE(v33) = a12;
    -[CKMessagesController _showNewComposeWithRecipients:composition:chatIdentifier:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:animated:simID:sendMessageHandler:](self, "_showNewComposeWithRecipients:composition:chatIdentifier:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:animated:simID:sendMessageHandler:", v23, v25, v24, v38, v39, v20, v33, v21, v22);
  }
}

- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8 animated:(BOOL)a9 sendMessageHandler:(id)a10
{
  LOBYTE(v10) = a9;
  [(CKMessagesController *)self _showNewComposeWithRecipients:a3 composition:a4 chatIdentifier:a5 bizIntent:a6 launchPluginWithBundleID:a7 pluginLaunchPayload:a8 animated:v10 simID:0 sendMessageHandler:a10];
}

- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8 animated:(BOOL)a9 simID:(id)a10 sendMessageHandler:(id)a11
{
}

- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8 startAudioRecording:(BOOL)a9 animated:(BOOL)a10 simID:(id)a11 sendMessageHandler:(id)a12
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v67 = a8;
  id v23 = a11;
  id v24 = +[CKUIBehavior sharedBehaviors];
  id v25 = objc_alloc((Class)[v24 composeChatControllerClass]);
  int v26 = v25;
  v64 = v23;
  v65 = v20;
  if (v21)
  {
    uint64_t v27 = (void *)[v25 initWithRecipientAddresses:v18 composition:v19 chatIdentifier:v20 bizIntent:v21 simID:v23];
  }
  else
  {
    uint64_t v28 = [v19 bizIntent];
    uint64_t v27 = (void *)[v26 initWithRecipientAddresses:v18 composition:v19 chatIdentifier:v20 bizIntent:v28 simID:v23];
  }
  [v27 setSendMenuDelegate:self];
  BOOL v29 = [(CKMessagesController *)self isComposingMessage];
  if (v29)
  {
    id v30 = [(CKMessagesController *)self composeChatController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v32 = [(CKMessagesController *)self composeChatController];
      uint64_t v33 = [v32 proposedRecipients];
      BOOL v34 = [v33 composeRecipientHandles];

      id v35 = [v27 proposedRecipients];
      id v36 = [v35 composeRecipientHandles];

      if (([v34 equivalentToRecipients:v36] & 1) == 0) {
        [(CKMessagesController *)self cancelAndDestroyComposition];
      }
    }
  }
  id v37 = [v27 conversation];
  [(CKMessagesController *)self setCurrentConversation:v37];
  id v38 = +[CKConversationList sharedConversationList];
  [v38 setPendingConversation:v37];

  id v39 = +[CKAdaptivePresentationController sharedInstance];
  [v39 dismissViewControllerAnimated:1 completion:0];

  id v40 = +[CKUIBehavior sharedBehaviors];
  int v41 = [v40 shouldDismissSideMountedPanel];

  if (v41)
  {
    uint64_t v42 = [(CKMessagesController *)self chatController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v42 dismissViewControllerAnimated:1 completion:0];
    }
  }
  v66 = v19;
  if (v29)
  {
    [(CKMessagesController *)self setComposeChatNavigationController:0];
    id v43 = [(CKMessagesController *)self modalViewController];

    if (v43) {
      [(CKMessagesController *)self dismissModalViewControllerWithTransition:9];
    }
  }
  BOOL v44 = [(CKMessagesController *)self isCollapsed];
  [v27 setDelegate:self];
  [(CKMessagesController *)self setComposeChatController:v27];
  if (v22) {
    [v27 setupStateForLaunchPluginWithBundleID:v22 pluginPayload:v67];
  }
  if (a9) {
    [v27 setupStateForLaunchAudio];
  }
  if (v44)
  {
    id v63 = v22;
    id v45 = v21;
    id v46 = v18;
    [(CKMessagesController *)self showConversationListWithAnimation:0];
    id v47 = [[CKNavigationController alloc] initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
    v69[0] = v27;
    double v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
    [(CKNavigationController *)v47 setViewControllers:v48];

    double v49 = +[CKUIBehavior sharedBehaviors];
    int v50 = [v49 useMacToolbar];

    if (v50)
    {
      [(CKMessagesController *)self dismissDetailsNavigationController];
      [(CKNavigationController *)v47 setNavigationBarHidden:1];
    }
    else
    {
      v53 = [(CKNavigationController *)v47 navigationBar];
      long long v54 = +[CKUIBehavior sharedBehaviors];
      long long v55 = [v54 theme];
      objc_msgSend(v53, "setBarStyle:", objc_msgSend(v55, "navBarStyle"));
    }
    id v18 = v46;
    [(CKMessagesController *)self setComposeChatNavigationController:v47];
    long long v56 = [(CKMessagesController *)self composeChatNavigationController];
    [(CKMessagesController *)self presentViewController:v56 animated:a10 completion:&__block_literal_global_476_2];

    id v21 = v45;
    id v22 = v63;
  }
  else
  {
    id v51 = [(CKMessagesController *)self chatNavigationController];
    v68 = v27;
    __int16 v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    [v51 setViewControllers:v52];

    if (!CKIsRunningInMacCatalyst()
      && [(CKMessagesController *)self _wantsThreeColumnLayout])
    {
      [(CKMessagesController *)self hideColumn:0];
    }
  }
  long long v57 = [(CKMessagesController *)self chatController];
  [v57 setDelegate:0];

  [(CKMessagesController *)self setChatController:0];
  v58 = +[CKUIBehavior sharedBehaviors];
  int v59 = [v58 useMacToolbar];

  if (v59)
  {
    if ([v27 conformsToProtocol:&unk_1EDF48CA0])
    {
      v60 = [(CKMessagesController *)self macToolbarController];
      [v27 configureWithToolbarController:v60];
    }
    [(CKMessagesController *)self dismissDetailsNavigationController];
  }
  v61 = [(CKMessagesController *)self conversationListController];
  [v61 updateConversationList];

  [(CKMessagesController *)self _updateAlertSuppressionContext];
  v62 = [(CKMessagesController *)self messagesControllerDelegate];
  [v62 didShowNewComposeInMessagesController:self];
}

void __190__CKMessagesController__showNewComposeWithRecipients_composition_chatIdentifier_bizIntent_launchPluginWithBundleID_pluginLaunchPayload_startAudioRecording_animated_simID_sendMessageHandler___block_invoke()
{
  if ([(id)__CurrentTestName rangeOfString:@"ShowNewCompose"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v0 postNotificationName:@"PPTDidShowNewComposeEvent" object:0 userInfo:0];
  }
}

- (void)cancelNewMessageCompositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKMessagesController *)self isComposingMessage])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__CKMessagesController_cancelNewMessageCompositionAnimated___block_invoke;
    v5[3] = &unk_1E5620C40;
    v5[4] = self;
    [(CKMessagesController *)self dismissViewControllerAnimated:v3 completion:v5];
  }
}

uint64_t __60__CKMessagesController_cancelNewMessageCompositionAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAndDestroyComposition];
}

- (BOOL)composeChatControllerCanEditRecipients
{
  return 1;
}

- (void)composeChatControllerDidCancelComposition:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke;
    BOOL v29 = &unk_1E5620C40;
    id v30 = self;
    id v5 = &v26;
LABEL_7:
    -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_13;
  }
  uint64_t v6 = [(CKMessagesController *)self presentedViewController];
  id v7 = [v4 navigationController];
  int v8 = [v6 isEqual:v7];

  id v9 = [(CKMessagesController *)self currentConversation];
  uint64_t v10 = [(CKMessagesController *)self conversationList];
  uint64_t v11 = [v10 pendingConversation];

  if (v9 == v11) {
    [(CKMessagesController *)self setCurrentConversation:0];
  }
  uint64_t v12 = [(CKMessagesController *)self conversationList];
  [v12 unpendConversation];

  double v13 = +[CKDraftManager sharedInstance];
  double v14 = [(CKMessagesController *)self conversationList];
  double v15 = [v14 pendingConversation];
  long long v16 = [v15 unsentComposition];
  [v13 clearDraftForComposition:v16];

  if (v8)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke_2;
    id v24 = &unk_1E5620C40;
    id v25 = self;
    id v5 = &v21;
    goto LABEL_7;
  }
  if ([(CKMessagesController *)self hasRecentlyDeletedFilterSelected]
    || (+[CKConversationList sharedConversationList],
        double v17 = objc_claimAutoreleasedReturnValue(),
        [v17 conversations],
        id v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 count],
        v18,
        v17,
        !v19))
  {
    [(CKMessagesController *)self _setIsShowingNoSelectionUI:1];
    id v20 = [(CKMessagesController *)self conversationListController];
    [v20 removePendingConversationCell];
  }
  else
  {
    id v20 = [(CKMessagesController *)self conversationListController];
    [v20 selectDefaultConversationAnimated:1 removingPendingConversationCell:1];
  }

LABEL_13:
}

void __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelAndDestroyComposition];
  id v2 = [*(id *)(a1 + 32) chatController];
  [v2 endHoldingScrollGeometryUpdatesForReason:@"TransitionFromForwarding"];
}

uint64_t __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAndDestroyComposition];
}

- (void)cancelAndDestroyComposition
{
  if ([(CKMessagesController *)self isCollapsed])
  {
    BOOL v3 = [(CKMessagesController *)self composeChatController];
    [v3 setDelegate:0];
  }
  if ([(CKMessagesController *)self isComposingMessage])
  {
    id v4 = [(CKMessagesController *)self composeChatController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v6 = [(CKMessagesController *)self composeChatController];
      [v6 cancelCompose];
    }
  }
  [(CKMessagesController *)self setComposeChatController:0];
  id v7 = +[CKDraftManager sharedInstance];
  int v8 = [(CKMessagesController *)self composeChatController];
  id v9 = [v8 conversation];
  uint64_t v10 = [v9 unsentComposition];
  [v7 clearDraftForComposition:v10];

  uint64_t v11 = [(CKMessagesController *)self conversationList];
  [v11 unpendConversation];

  [(CKMessagesController *)self setComposeChatNavigationController:0];
}

- (void)composeChatController:(id)a3 didSelectNewConversation:(id)a4
{
  id v6 = a4;
  id v5 = [(CKMessagesController *)self conversationList];
  [v5 setPendingConversation:v6];

  if (![(CKMessagesController *)self isDetailsNavigationControllerDetached]) {
    [(CKMessagesController *)self dismissDetailsNavigationController];
  }
  [(CKMessagesController *)self setCurrentConversation:v6];
  [(CKMessagesController *)self _updateAlertSuppressionContext];
}

- (BOOL)hasBusinessRecipientWithRecipientIDs:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (MEMORY[0x192FBA6A0](*(void *)(*((void *)&v8 + 1) + 8 * i)))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_checkPushToTranscriptTimingWithStartTime:(double)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 objectForKey:@"PushToTranscriptTailspinLogging"];

  if (v6 && [v6 BOOLValue])
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    long long v8 = [v7 objectForKey:@"PushToTranscriptTailspinLoggingInterval"];

    if (v8)
    {
      [v8 floatValue];
      double v10 = v9;
    }
    else
    {
      double v10 = 1.0;
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v12 = v11;
    if (v11 - a3 > v10)
    {
      uint64_t v13 = dispatch_get_global_queue(2, 0);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke;
      v19[3] = &unk_1E5622950;
      *(double *)&v19[5] = v12;
      void v19[4] = self;
      dispatch_async(v13, v19);

      double v14 = [NSString stringWithFormat:@"Dumping tailspin log (this may take up to a minute)..."];
      double v15 = +[CKAlertController alertControllerWithTitle:@"Push to transcript took too long" message:v14 preferredStyle:1];

      long long v16 = CKFrameworkBundle();
      double v17 = [v16 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v18 = +[CKAlertAction actionWithTitle:v17 style:0 handler:0];
      [v15 addAction:v18];

      [v15 presentFromViewController:self animated:1 completion:0];
    }
  }
}

void __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/Messages/PushToTranscriptTailspin%f.tailspin", *(void *)(a1 + 40));
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 createFileAtPath:v2 contents:0 attributes:0];

  uint64_t v5 = 0;
  if (!v4) {
    goto LABEL_24;
  }
  uint64_t v5 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v2];
  if (!v5) {
    goto LABEL_25;
  }
  if (__tailspin_dump_output_sync_once != -1) {
    dispatch_once(&__tailspin_dump_output_sync_once, &__block_literal_global_1377_1);
  }
  if (__tailspin_dump_output_sync___tailspin_dump_output_sync
    && (int v6 = ((uint64_t (*)(uint64_t))__tailspin_dump_output_sync___tailspin_dump_output_sync)([v5 fileDescriptor]),
        [v5 closeFile],
        v6))
  {
LABEL_25:
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(34);
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v15 = v2;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "Pushing to transcript took longer than expected, logged tailspin dump to %@ ", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
LABEL_20:
    }
      _CKLog();
  }
  else
  {
LABEL_24:
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(34);
      long long v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v15 = v2;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "Pushing to transcript took longer than expected, failed to push tailspin dump to logfile at %@ ", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      goto LABEL_20;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke_552;
  block[3] = &unk_1E5620AF8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v2;
  uint64_t v13 = v9;
  id v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke_552(uint64_t a1)
{
  id v5 = +[CKAlertController alertControllerWithTitle:@"Tailspin log dumped here:" message:*(void *)(a1 + 32) preferredStyle:1];
  id v2 = CKFrameworkBundle();
  id v3 = [v2 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  int v4 = +[CKAlertAction actionWithTitle:v3 style:0 handler:0];
  [v5 addAction:v4];

  [v5 presentFromViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)showConversation:(id)a3 animate:(BOOL)a4 forceToTranscript:(BOOL)a5 keepAllCurrentlyLoadedMessages:(BOOL)a6
{
}

- (void)showConversation:(id)a3 animate:(BOOL)a4 forceToTranscript:(BOOL)a5 keepAllCurrentlyLoadedMessages:(BOOL)a6 userInitiated:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v221 = a4;
  uint64_t v248 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (self->hasBegunShowingConversationList)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v12 - self->timeViewDidBeginAppearing < 0.5)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Bailing early because the conversation list is still in the process of being shown.", buf, 2u);
        }
      }
      goto LABEL_168;
    }
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v15 = v14;
  if (_messagesControllerTelemetryLogHandle_onceToken != -1) {
    dispatch_once(&_messagesControllerTelemetryLogHandle_onceToken, &__block_literal_global_1383_0);
  }
  BOOL v214 = v7;
  uint64_t v16 = (id)_messagesControllerTelemetryLogHandle_telemetryLogHandle;
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PushTranscript", " enableTelemetry=YES ", buf, 2u);
  }
  v217 = v16;

  kdebug_trace();
  double v17 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKPushTranscriptTimingKey"];
  [v17 startTimingForKey:@"showConversation:animate:"];

  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      currentConversation = self->_currentConversation;
      id v20 = @"NO";
      *(_DWORD *)buf = 138413314;
      if (v9) {
        uint64_t v21 = @"YES";
      }
      else {
        uint64_t v21 = @"NO";
      }
      *(void *)&uint8_t buf[4] = v11;
      if (v8) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      v241 = currentConversation;
      __int16 v240 = 2112;
      if (v221) {
        id v20 = @"YES";
      }
      __int16 v242 = 2112;
      v243 = v21;
      __int16 v244 = 2112;
      v245 = v22;
      __int16 v246 = 2112;
      v247 = v20;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "showConversation: %@ (_currentConversation = %@), forceToTranscript: %@, keepAllCurrentlyLoadedMessages: %@, animate: %@", buf, 0x34u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = [v11 isPinned];
      id v25 = @"NO";
      if (v24) {
        id v25 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "> Beginning Flow to present conversation with pinned={%@}", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [MEMORY[0x1E4F6E6D0] sharedManager];
      int v28 = [v27 isFeatureEnabled];
      BOOL v29 = @"NO";
      if (v28) {
        BOOL v29 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "  CommSafety Enabled?: %@", buf, 0xCu);
    }
  }
  v218 = [(CKMessagesController *)self conversationListController];
  if ([v11 hasUnreadMessages])
  {
    id v30 = [(CKMessagesController *)self conversationListNavigationController];
    __int16 v31 = [v30 topViewController];
    BOOL v32 = v31 == v218;

    if (v32)
    {
      uint64_t v33 = [(CKMessagesController *)self conversationListController];
      [v33 conversationWillBeMarkedRead:v11];
    }
  }
  BOOL v34 = [(CKMessagesController *)self chatNavigationController];
  v219 = [v34 topViewController];

  id v35 = [(CKMessagesController *)self chatController];
  if (v35)
  {
    id v36 = [(CKMessagesController *)self chatController];
    if (v36 == v219)
    {
      id v38 = [(CKMessagesController *)self chatController];
      id v39 = [v38 conversation];
      id v40 = [v39 groupID];
      int v41 = [v11 groupID];
      int v42 = [v40 isEqual:v41];

      int v37 = v42 ^ 1;
    }
    else
    {
      int v37 = 1;
    }
  }
  else
  {
    int v37 = 1;
  }

  if (IMOSLoggingEnabled())
  {
    id v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      BOOL v44 = @"NO";
      if (v37) {
        BOOL v44 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v44;
      _os_log_impl(&dword_18EF18000, v43, OS_LOG_TYPE_INFO, "showConversation, shouldRestoreConversation: %@", buf, 0xCu);
    }
  }
  if (v37)
  {
    id v45 = [v11 chat];
    [v45 watermarkInForScrutinyMode];

    if (IMOSLoggingEnabled())
    {
      id v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = [v11 chat];
        id v48 = [v47 guid];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_INFO, "Incremented load attempt count for chat GUID %@", buf, 0xCu);
      }
    }
    double v49 = [v11 chat];
    int v50 = [v49 isInScrutinyMode];

    if (v50 && IMOSLoggingEnabled())
    {
      id v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        __int16 v52 = [v11 chat];
        id v53 = [v52 guid];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v53;
        _os_log_impl(&dword_18EF18000, v51, OS_LOG_TYPE_INFO, "We are in scrutiny mode for chat GUID %@", buf, 0xCu);
      }
    }
    [(CKMessagesController *)self setCurrentConversation:v11 keepAllCurrentlyLoadedMessages:v8];
    long long v54 = [(CKMessagesController *)self junkModalMessagesController];
    v213 = v54;
    if (v54)
    {
      id v55 = [v54 chatController];
    }
    else
    {
      long long v56 = [(CKMessagesController *)self composeChatController];
      if (v56) {
        [(CKMessagesController *)self composeChatController];
      }
      else {
      id v55 = [(CKMessagesController *)self chatController];
      }
    }
    v220 = [v55 entryView];
    if (v55)
    {
      long long v57 = [v220 contentView];
      int v211 = [v57 isActive];
    }
    else
    {
      int v211 = 0;
    }
    [v220 beginDeferringEntryFieldCollapsedStateChanges];
    objc_msgSend(v55, "beginPinningInputViewsForReason:");
    [v55 dismissViewControllerAnimated:0 completion:0];
    if (v55)
    {
      v58 = [(CKMessagesController *)self macToolbarController];
      [v58 setSecondaryItemProvider:0];
    }
    int v59 = +[CKBalloonPluginManager sharedInstanceIfInitialized];
    [v59 invalidateAllActivePlugins];

    if ([v11 isBusinessConversation])
    {
      v60 = +[CKUIBehavior sharedBehaviors];
      v61 = objc_msgSend(objc_alloc((Class)objc_msgSend(v60, "businessChatControllerClass")), "initWithConversation:", v11);
    }
    else
    {
      v62 = [(CKMessagesController *)self chatNavigationController];
      id v63 = [v62 view];
      [v63 bounds];
      double v65 = v64;
      double v67 = v66;

      v68 = +[CKUIBehavior sharedBehaviors];
      v61 = objc_msgSend(objc_alloc((Class)objc_msgSend(v68, "chatControllerClass")), "initWithConversation:", v11);

      objc_msgSend(v61, "setInitialViewSize:", v65, v67);
    }
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    [v61 setTransitionedFromComposing:isKindOfClass & 1];
    [v55 prepareToDismissForSecondInstance];
    [v61 setDelegate:self];
    [v61 setSendMenuDelegate:self];
    if (v214) {
      [v61 setUserInitiatedTranscriptPush:1];
    }
    [(CKMessagesController *)self setChatController:v61];
    [v61 beginPinningInputViewsForReason:@"SwitchingActiveConversations"];
    [v61 setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:1];
    [v61 beginPinningInputViewsForReason:@"NewComposeToChatTransition"];
    [v55 endPinningInputViewsForReason:@"NewComposeToChatTransition"];
    [(CKMessagesController *)self setupBizNavBarForConversation:v11];
    v69 = [(CKMessagesController *)self chatController];
    BOOL v70 = [(CKMessagesController *)self isCollapsed];
    if (v70 && ![(CKMessagesController *)self isTopVCChatNavigationController])
    {
      v71 = [(CKMessagesController *)self presentedViewController];
      if (v71)
      {
        v72 = [(CKMessagesController *)self presentedViewController];
        v73 = [(CKMessagesController *)self composeChatNavigationController];
        BOOL v74 = v72 == v73;

        if (v74)
        {
          id v215 = v61;
          v75 = [(CKMessagesController *)self composeChatController];
          v76 = [v75 collectionViewController];
          v77 = [v76 collectionView];
          [v77 contentOffset];
          double v79 = v78;
          double v81 = v80;

          v82 = [(CKMessagesController *)self composeChatController];
          v83 = [v82 collectionViewController];
          v84 = [v83 collectionView];
          [v84 contentInset];
          double v86 = v85;
          double v88 = v87;
          double v90 = v89;
          double v92 = v91;

          objc_msgSend(v215, "primeTranscriptWithInitialOffset:inset:", v79, v81, v86, v88, v90, v92);
          v93 = [v215 conversation];
          v94 = [v93 chat];

          [v94 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B978]];
          [v215 beginHoldingScrollGeometryUpdatesForReason:@"TransitionFromNewCompose"];
        }
      }
    }
    v95 = (void *)MEMORY[0x1E4F42FF8];
    v234[0] = MEMORY[0x1E4F143A8];
    v234[1] = 3221225472;
    v234[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke;
    v234[3] = &unk_1E5620AF8;
    v234[4] = self;
    id v216 = v69;
    id v235 = v216;
    [v95 _performWithoutDeferringTransitions:v234];
    v96 = +[CKUIBehavior sharedBehaviors];
    int v97 = [v96 useMacToolbar];

    if (v97)
    {
      v98 = [(CKMessagesController *)self chatController];
      if ([v98 conformsToProtocol:&unk_1EDF48CA0])
      {
        v99 = [(CKMessagesController *)self macToolbarController];
        [v98 configureWithToolbarController:v99];
      }
    }
    [(CKMessagesController *)self _setIsShowingNoSelectionUI:v11 == 0];
    v100 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v101 = [v100 isFluidTransitioningEnabled];

    if (v101)
    {
      if (v70)
      {
        if ([v11 isPinned])
        {
          v102 = [(CKMessagesController *)self _sourceViewForFluidTransitionWithConversation:v11];
          BOOL v103 = v102 == 0;

          if (!v103)
          {
            *(void *)buf = 0;
            objc_initWeak((id *)buf, self);
            id location = 0;
            objc_initWeak(&location, v11);
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2;
            aBlock[3] = &unk_1E562C5F0;
            objc_copyWeak(&v231, (id *)buf);
            objc_copyWeak(&v232, &location);
            v208 = _Block_copy(aBlock);
            v209 = [MEMORY[0x1E4F43398] zoomWithSourceViewProvider:v208];
            v104 = objc_opt_new();
            v105 = [(CKMessagesController *)self traitCollection];
            [v105 displayCornerRadius];

            v106 = [(CKMessagesController *)self chatNavigationController];
            v107 = [v106 view];
            [v107 bounds];

            UIRectCenteredRect();
            objc_msgSend(v104, "setFrameOfSourceInDestination:");
            [v209 _setOptions:v104];
            v108 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
            v109 = [(CKMessagesController *)self chatNavigationController];
            v110 = [v109 view];
            [v110 setBackgroundColor:v108];

            v111 = [(CKMessagesController *)self chatNavigationController];
            [v111 _setPreferredTransition:v209];

            id WeakRetained = objc_loadWeakRetained((id *)buf);
            v113 = [WeakRetained conversationListController];

            v114 = [v113 itemIdentifierForConversation:v11 inSection:2];
            v115 = [v113 dataSource];
            v116 = [v115 indexPathForItemIdentifier:v114];

            v117 = [v113 collectionView];
            [v117 deselectItemAtIndexPath:v116 animated:0];

            objc_destroyWeak(&v232);
            objc_destroyWeak(&v231);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
            goto LABEL_92;
          }
        }
      }
      v118 = [(CKMessagesController *)self chatNavigationController];
      [v118 _setPreferredTransition:0];
    }
    if (!v70)
    {
LABEL_93:
      int v119 = 0;
      int v210 = 1;
      goto LABEL_94;
    }
LABEL_92:
    if ([(CKMessagesController *)self isTopVCChatNavigationController]) {
      goto LABEL_93;
    }
    v180 = [(CKMessagesController *)self presentedViewController];
    if (!v180) {
      goto LABEL_151;
    }
    v181 = [(CKMessagesController *)self presentedViewController];
    v182 = [(CKMessagesController *)self composeChatNavigationController];
    BOOL v183 = v181 == v182;

    if (v183)
    {
      v198 = [(CKMessagesController *)self composeChatController];
      v199 = [(CKMessagesController *)self chatController];
      int v119 = [v198 isSendingMessage];
      v224[0] = MEMORY[0x1E4F143A8];
      v224[1] = 3221225472;
      v224[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_580;
      v224[3] = &unk_1E5628498;
      char v229 = v119;
      id v200 = v199;
      id v225 = v200;
      v226 = self;
      id v201 = v198;
      id v227 = v201;
      id v228 = v61;
      [(CKMessagesController *)self dismissViewControllerAnimated:0 completion:v224];

      int v210 = 0;
      BOOL v221 = 0;
    }
    else
    {
LABEL_151:
      int v119 = 0;
      int v210 = 1;
    }
    if (IMOSLoggingEnabled())
    {
      v202 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
      {
        id v203 = [(CKMessagesController *)self chatNavigationController];
        if (v221) {
          v204 = @"YES";
        }
        else {
          v204 = @"NO";
        }
        v205 = [(CKMessagesController *)self chatNavigationController];
        v206 = [v205 viewControllers];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v203;
        __int16 v240 = 2112;
        v241 = v204;
        __int16 v242 = 2112;
        v243 = v206;
        _os_log_impl(&dword_18EF18000, v202, OS_LOG_TYPE_INFO, "Pushing to detail view controller: %@ animate: %@ with view controllers: %@", buf, 0x20u);
      }
    }
    if ([(CKMessagesController *)self _wantsThreeColumnLayout])
    {
      if (v221)
      {
        [(CKMessagesController *)self showColumn:2];
LABEL_182:
        BOOL v221 = 1;
        goto LABEL_94;
      }
      v223[0] = MEMORY[0x1E4F143A8];
      v223[1] = 3221225472;
      v223[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_581;
      v223[3] = &unk_1E5620C40;
      v223[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v223];
    }
    else
    {
      if (v221)
      {
        v207 = [(CKMessagesController *)self chatNavigationController];
        [(CKMessagesController *)self showDetailViewController:v207 sender:self];

        goto LABEL_182;
      }
      v222[0] = MEMORY[0x1E4F143A8];
      v222[1] = 3221225472;
      v222[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_582;
      v222[3] = &unk_1E5620C40;
      v222[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v222];
    }
    BOOL v221 = 0;
LABEL_94:
    v120 = [(CKMessagesController *)self chatController];
    v121 = [(CKMessagesController *)self composeChatController];
    v122 = v121;
    if (v121)
    {
      [v121 systemMinimumLayoutMargins];
      double v124 = v123;
      double v126 = v125;
      double v128 = v127;
      double v130 = v129;
      v131 = [v122 view];
      uint64_t v132 = [v131 effectiveUserInterfaceLayoutDirection];
      if (v132) {
        double v133 = v130;
      }
      else {
        double v133 = v126;
      }
      if (!v132) {
        double v126 = v130;
      }

      v134 = [v120 view];
      objc_msgSend(v134, "setLayoutMargins:", v124, v133, v128, v126);

      [v122 setIgnoreKeyboardNotifications:v220 != 0];
    }
    [v55 keyboardFrame];
    double v136 = v135;
    double v138 = v137;
    double v140 = v139;
    double v142 = v141;
    if (v119)
    {
      v143 = [(CKMessagesController *)self chatController];
      [v143 beginHoldingScrollGeometryUpdatesForReason:@"TransitionFromNewCompose"];

      v144 = [v120 entryView];
      v145 = [v220 sendLaterPluginInfo];
      [v144 setSendLaterPluginInfo:v145 animated:0];

      if (!v211)
      {
LABEL_116:
        [v220 endDeferringEntryFieldCollapsedStateChanges];
        [v55 forciblyUnloadChatInputController];
        if (v119)
        {
          v151 = [(CKMessagesController *)self chatController];
          objc_msgSend(v151, "cleanupPostComposeTransitionWithKBFrame:", v136, v138, v140, v142);

          v152 = [(CKMessagesController *)self chatController];
          [v152 endHoldingScrollGeometryUpdatesForReason:@"TransitionFromNewCompose"];
        }
        if (v210) {
          [v61 endPinningInputViewsForReason:@"NewComposeToChatTransition"];
        }

        BOOL v221 = v221;
        goto LABEL_121;
      }
      id v146 = v220;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v147 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CKMessagesController showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedM"
                               "essages:userInitiated:]";
          _os_log_impl(&dword_18EF18000, v147, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", buf, 0xCu);
        }
      }
      [v120 reloadEntryViewIfNeeded];
      if (v220)
      {
        v148 = [v120 entryView];
        objc_msgSend(v148, "setEntryFieldCollapsed:animated:", objc_msgSend(v220, "entryFieldCollapsed"), 0);
      }
      if ((v211 & 1) == 0) {
        goto LABEL_116;
      }
      id v146 = [v120 entryView];
    }
    if (!(v119 & 1 | (((isKindOfClass | IMSharedHelperDeviceIsiPad()) & 1) == 0))
      && [v120 isFirstResponder])
    {
      [v120 resignFirstResponder];
    }
    v149 = [v146 contentView];
    v150 = [v149 activeView];
    [v150 becomeFirstResponder];

    goto LABEL_116;
  }
LABEL_121:
  v153 = [(CKMessagesController *)self composeChatController];

  if (v153)
  {
    v154 = [(CKMessagesController *)self composeChatController];
    [v154 setDelegate:0];

    [(CKMessagesController *)self setComposeChatController:0];
    [(CKMessagesController *)self setComposeChatNavigationController:0];
  }
  v155 = +[CKAdaptivePresentationController sharedInstance];
  v156 = [v155 presentedViewController];
  objc_opt_class();
  char v157 = objc_opt_isKindOfClass();

  if (v157)
  {
    v158 = [(CKMessagesController *)self chatController];
    [v158 _dismissFullScreenBubbleViewControllerAnimated:v221 withSendAnimation:0 completion:0];
  }
  else
  {
    v158 = +[CKAdaptivePresentationController sharedInstance];
    [v158 dismissViewControllerAnimated:1 completion:0];
  }

  v159 = [(CKMessagesController *)self chatNavigationController];
  v160 = [v159 presentedViewController];

  if (v160)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v161 = [(CKMessagesController *)self onboardingController];
      BOOL v162 = v161 == 0;

      if (v162)
      {
        id v163 = v160;
        v164 = [v163 presentedViewController];

        if (v164)
        {
          v165 = v163;
          do
          {
            id v166 = [v165 presentedViewController];

            v167 = [v166 presentedViewController];

            v165 = v166;
          }
          while (v167);
          if (v166 != v163)
          {
            do
            {
              [v166 dismissViewControllerAnimated:0 completion:0];
              uint64_t v168 = [v166 presentingViewController];

              id v166 = (id)v168;
            }
            while ((id)v168 != v163);
          }
        }
        [v163 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
  if ([(CKMessagesController *)self _wantsThreeColumnLayout]
    && ![(CKMessagesController *)self isCollapsed]
    && !CKIsRunningInMacCatalyst())
  {
    [(CKMessagesController *)self hideColumn:0];
  }
  v169 = [(CKMessagesController *)self detailsNavigationController];

  if (v169)
  {
    v170 = [(CKMessagesController *)self chatController];
    objc_opt_class();
    char v171 = objc_opt_isKindOfClass();

    if (v171)
    {
      v172 = [(CKMessagesController *)self chatController];
      v173 = [CKDetailsControllerAdapter alloc];
      v174 = [v172 conversation];
      v175 = [(CKDetailsControllerAdapter *)v173 initWithConversation:v174 delegate:v172];

      v176 = [(CKDetailsControllerAdapter *)v175 detailsController];
      if (v176)
      {
        v177 = [(CKDetailsControllerAdapter *)v175 detailsController];
        v238 = v177;
        id v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v238 count:1];
      }
      else
      {
        id v178 = (id)MEMORY[0x1E4F1CBF0];
      }

      v184 = [(CKMessagesController *)self detailsNavigationController];
      [v184 setViewControllers:v178 animated:0];

      v185 = [(CKMessagesController *)self detailsNavigationController];
      [v185 setDetailsAdapter:v175];
    }
    else if (IMOSLoggingEnabled())
    {
      v179 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v179, OS_LOG_TYPE_INFO, "chatController is not class CKChatController.", buf, 2u);
      }
    }
  }
  [(CKMessagesController *)self _updateAlertSuppressionContext];
  v186 = v217;
  if (os_signpost_enabled(v186))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v186, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PushTranscript", " enableTelemetry=YES ", buf, 2u);
  }

  v187 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKPushTranscriptTimingKey"];
  [v187 stopTimingForKey:@"showConversation:animate:"];

  kdebug_trace();
  [(CKMessagesController *)self _checkPushToTranscriptTimingWithStartTime:v15];
  if (![(CKMessagesController *)self _changeFilterModeIfNeeded])
  {
    if (IMOSLoggingEnabled())
    {
      v188 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v188, OS_LOG_TYPE_INFO, "[Filter Mode] Not transitioning between filter modes.", buf, 2u);
      }
    }
    v189 = [(CKMessagesController *)self messagesControllerDelegate];
    [v189 messagesController:self didShowConversation:v11];
  }
  v190 = [v11 chat];
  BOOL v191 = [v190 isFiltered] == 2;

  if (v191)
  {
    v192 = [v11 chat];
    int v193 = [v192 isSMS];

    v194 = [MEMORY[0x1E4F6E890] sharedInstance];
    v195 = v194;
    if (v193)
    {
      v236 = &unk_1EDF16E50;
      v196 = [NSNumber numberWithBool:IMIsOscarEnabled()];
      v237 = v196;
      v197 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v237 forKeys:&v236 count:1];
      [v195 trackiMessageJunkEvent:4 withDictionary:v197];
    }
    else
    {
      [v194 trackiMessageJunkEvent:5];
    }
  }
LABEL_168:
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) chatNavigationController];
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 setViewControllers:v3];
}

NSObject *__112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      int v4 = [WeakRetained _sourceViewForFluidTransitionWithConversation:v3];
      id v5 = v4;
      if (v4)
      {
        id v5 = v4;
        int v6 = v5;
      }
      else
      {
        BOOL v7 = IMLogHandleForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_3();
        }

        int v6 = 0;
      }
    }
    else
    {
      id v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_2();
      }
      int v6 = 0;
    }
  }
  else
  {
    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_1();
    }
    int v6 = 0;
  }

  return v6;
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_580(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = *(void **)(a1 + 40);
    if (v3)
    {
      int v4 = [v2 chatNavigationController];
      v12[0] = *(void *)(a1 + 32);
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v4 setViewControllers:v5];

      int v6 = [*(id *)(a1 + 32) entryView];
      BOOL v7 = [v6 contentView];
      BOOL v8 = [v7 activeView];
      [v8 becomeFirstResponder];
    }
    else
    {
      [v2 _populateChatNavigationControllerWithSelection];
    }
  }
  [*(id *)(a1 + 48) setDelegate:0];
  [*(id *)(a1 + 40) setComposeChatController:0];
  [*(id *)(a1 + 40) setComposeChatNavigationController:0];
  BOOL v9 = +[CKConversationList sharedConversationList];
  [v9 unpendConversation];

  id v10 = [*(id *)(a1 + 32) conversation];
  id v11 = [v10 chat];

  [v11 endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B978]];
  [*(id *)(a1 + 32) endHoldingScrollGeometryUpdatesForReason:@"TransitionFromNewCompose"];
  [*(id *)(a1 + 56) endPinningInputViewsForReason:@"NewComposeToChatTransition"];
}

uint64_t __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_581(uint64_t a1)
{
  return [*(id *)(a1 + 32) showColumn:2];
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_582(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 chatNavigationController];
  [v2 showDetailViewController:v3 sender:*(void *)(a1 + 32)];
}

- (id)_sourceViewForFluidTransitionWithConversation:(id)a3
{
  id v4 = a3;
  if (([v4 isPinned] & 1) == 0)
  {
    BOOL v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.6();
    }
    goto LABEL_7;
  }
  id v5 = [(CKMessagesController *)self conversationListController];
  int v6 = [v5 presentedViewController];

  if (v6)
  {
    BOOL v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.5();
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  BOOL v7 = [(CKMessagesController *)self conversationListController];
  id v10 = [v7 itemIdentifierForConversation:v4 inSection:2];
  id v11 = [v7 dataSource];
  double v12 = [v11 indexPathForItemIdentifier:v10];

  if (!v12)
  {
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CKMessagesController _sourceViewForFluidTransitionWithConversation:]();
    }
    BOOL v8 = 0;
    goto LABEL_29;
  }
  uint64_t v13 = [v7 collectionView];
  double v14 = [v13 cellForItemAtIndexPath:v12];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v15 = [v14 pinnedConversationView];
      uint64_t v16 = [v15 avatarView];
      BOOL v8 = v16;
      if (v16)
      {
        id v17 = v16;
      }
      else
      {
        id v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[CKMessagesController _sourceViewForFluidTransitionWithConversation:]();
        }
      }
      goto LABEL_28;
    }
    double v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.4((uint64_t)v14, v15);
    }
  }
  else
  {
    double v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CKMessagesController _sourceViewForFluidTransitionWithConversation:]();
    }
  }
  BOOL v8 = 0;
LABEL_28:

LABEL_29:
LABEL_8:

  return v8;
}

- (BOOL)_changeFilterModeIfNeeded
{
  if ([(CKMessagesController *)self isCollapsed])
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v22 = 0;
        id v4 = "[Filter Mode] Not updating filterMode. collapsed";
        id v5 = (uint8_t *)&v22;
LABEL_9:
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    return 0;
  }
  unint64_t v6 = [(CKMessagesController *)self currentConversationListFilterMode];
  if (v6 <= 1)
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v4 = "[Filter Mode] Not updating filterMode. Current filter mode is none or no junk";
        id v5 = buf;
        goto LABEL_9;
      }
LABEL_10:
    }
    return 0;
  }
  unint64_t v8 = v6;
  BOOL v9 = [(CKMessagesController *)self chatController];
  id v10 = [v9 conversation];

  if (v10)
  {
    id v11 = +[CKConversationList sharedConversationList];
    int v12 = [v11 conversation:v10 includedInFilterMode:v8];

    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        double v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "[Filter Mode] Not updating filterMode. Current conversation exists in current filterMode", v19, 2u);
        }
      }
    }
    else
    {
      if (v13)
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v18 = 0;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "[Filter Mode] Updating filterMode", v18, 2u);
        }
      }
      [(CKMessagesController *)self inboxViewController:0 didSelectFilterMode:1];
    }
    char v7 = v12 ^ 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "[Filter Mode] Not updating filterMode. No conversation in chatController", v20, 2u);
      }
    }
    char v7 = 0;
  }

  return v7;
}

- (id)junkModalMessagesController
{
  id v2 = [(CKMessagesController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    if ([v3 isOscarModal]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isDownTimeActiveForCurrentChat
{
  id v2 = [(CKMessagesController *)self chatController];
  id v3 = [v2 conversation];
  id v4 = [v3 chat];

  if (v4) {
    int v5 = [v4 allowedToShowConversation] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)showConversationInNewWindow:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]
    || (int v4 = [MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled], v3)
    && v4
    && ([v3 chat],
        int v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 allowedByScreenTime],
        v5,
        v6))
  {
    char v7 = [MEMORY[0x1E4F42738] sharedApplication];
    unint64_t v8 = [v3 activityForNewScene];
    [v7 requestSceneSessionActivation:0 userActivity:v8 options:0 errorHandler:&__block_literal_global_596_1];
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Not showing conversation in new window since conversation is blocked by ScreenTime: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

void __52__CKMessagesController_showConversationInNewWindow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "error requesting scene: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)showConversation:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  sendMenuPresentation = self->_sendMenuPresentation;
  if (sendMenuPresentation)
  {
    [(CKSendMenuPresentation *)sendMenuPresentation dismissAnimated:0 completion:0];
    char v7 = self->_sendMenuPresentation;
    self->_sendMenuPresentation = 0;
  }
  [(CKMessagesController *)self showConversation:v8 animate:v4 keepAllCurrentlyLoadedMessages:0];
}

- (void)showConversation:(id)a3 animate:(BOOL)a4 userInitiated:(BOOL)a5
{
}

- (void)showConversation:(id)a3 animate:(BOOL)a4 keepAllCurrentlyLoadedMessages:(BOOL)a5
{
}

- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 animate:(BOOL)a5
{
}

- (void)chatControllerDidReselectConversation:(id)a3
{
  id v3 = [(CKMessagesController *)self chatController];
  [v3 dismissInlineReplyIfNeededAndScrollToBottom];
}

- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 withInlineReplyOverlay:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v19 = a4;
  id v10 = a3;
  id v11 = +[CKConversationList sharedConversationList];
  uint64_t v12 = [v11 conversationForExistingChatWithGUID:v10];

  if (v12)
  {
    [(CKMessagesController *)self showConversation:v12 animate:v6 keepAllCurrentlyLoadedMessages:1];
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F6E868]) initWithEncodedMessagePartGUID:v19];
    double v14 = v13;
    if (v13)
    {
      double v15 = [v13 messageGUID];
      uint64_t v16 = [v12 ensureMessageWithGUIDIsLoaded:v15];

      if (!v16)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      if (!v19) {
        goto LABEL_11;
      }
      uint64_t v16 = [v12 ensureMessageWithGUIDIsLoaded:v19];
      if (!v16) {
        goto LABEL_11;
      }
    }
    id v17 = [(CKMessagesController *)self chatController];
    id v18 = v17;
    if (v14) {
      objc_msgSend(v17, "scrollToMessage:atSpecificMessagePartIndex:highlight:withInlineReplyOverlay:", v16, objc_msgSend(v14, "partNumber"), 1, v7);
    }
    else {
      [v17 scrollToMessage:v16 highlight:1 withInlineReplyOverlay:v7];
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)resumeToConversation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 groupID];
      BOOL v7 = [(CKConversation *)self->_currentConversation groupID];
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "resumeToConversation: toConvo: %@ currentConversation: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  if (v4)
  {
    id v8 = [v4 groupID];
    char v9 = [v8 isEqualToString:@"-1"];
    if ((v9 & 1) == 0)
    {
      [MEMORY[0x1E4F42FF0] disableAnimation];
      [(CKMessagesController *)self showConversation:v4 animate:0 forceToTranscript:0 keepAllCurrentlyLoadedMessages:0];
      [MEMORY[0x1E4F42FF0] enableAnimation];
    }

    char v10 = v9 ^ 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKMessagesController - resumeToConversation: attempted to resume to nil conversation!", (uint8_t *)&v13, 2u);
      }
    }
    char v10 = 0;
  }

  return v10;
}

- (void)deleteConversation:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[CKConversationList sharedConversationList];
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  BOOL v7 = [MEMORY[0x1E4F1C9C8] now];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CKMessagesController_deleteConversation___block_invoke;
  v8[3] = &unk_1E5620C40;
  void v8[4] = self;
  [v5 recoverableDeleteForConversations:v6 deleteDate:v7 synchronousQuery:0 completionHandler:v8];
}

void __43__CKMessagesController_deleteConversation___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) conversationList];
  [v1 updateRecoverableConversationList];
}

- (id)firstConversationExactlyMatchingDisplayName:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6BC40];
  id v4 = a3;
  id v5 = [v3 sharedRegistry];
  id v6 = [v5 existingChatWithDisplayName:v4];

  BOOL v7 = +[CKConversationList sharedConversationList];
  id v8 = [v7 conversationForExistingChat:v6];

  return v8;
}

- (id)conversationMatchingGUID:(id)a3
{
  id v3 = a3;
  id v4 = +[CKConversationList sharedConversationList];
  id v5 = [v4 conversationForExistingChatWithGUID:v3];

  return v5;
}

- (void)showConversationListWithAnimation:(BOOL)a3
{
}

- (void)showConversationListWithAnimation:(BOOL)a3 didDismissController:(BOOL *)a4
{
  BOOL v5 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(CKMessagesController *)self navigationController];
  id v8 = [v7 topViewController];
  char v9 = [(CKMessagesController *)self conversationListController];
  char v10 = [v8 isEqual:v9];

  if (a4 && (v10 & 1) == 0) {
    *a4 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "dismissing fullscreen balloon view because conversation list is being shown", buf, 2u);
    }
  }
  uint64_t v12 = [(CKMessagesController *)self chatController];
  [v12 _dismissFullScreenBubbleViewControllerAnimated:v5 withSendAnimation:0 completion:0];

  if ([(CKMessagesController *)self isCollapsed])
  {
    sendMenuPresentation = self->_sendMenuPresentation;
    if (sendMenuPresentation)
    {
      [(CKSendMenuPresentation *)sendMenuPresentation dismissAnimated:0 completion:0];
      id v14 = self->_sendMenuPresentation;
      self->_sendMenuPresentation = 0;
    }
    if (!v5)
    {
      __int16 v15 = [(CKMessagesController *)self chatNavigationController];
      if (IMOSLoggingEnabled())
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [v15 viewControllers];
          *(_DWORD *)buf = 138412290;
          id v38 = v17;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Clearing chatController and chatNavigationController view controllers, chatNavigationController VCs before: %@", buf, 0xCu);
        }
      }
      id v18 = [(CKMessagesController *)self chatController];
      [v18 setDelegate:0];

      [(CKMessagesController *)self setChatController:0];
      [(CKMessagesController *)self setCurrentConversation:0];
      [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [v15 viewControllers];
          *(_DWORD *)buf = 138412290;
          id v38 = v20;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "chatNavigationController (showConversationListWithAnimation:) children:%@", buf, 0xCu);
        }
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke;
    aBlock[3] = &unk_1E5622A18;
    BOOL v36 = v5;
    void aBlock[4] = self;
    uint64_t v21 = (void (**)(void))_Block_copy(aBlock);
    __int16 v22 = [(CKMessagesController *)self presentedViewController];

    if (v22)
    {
      id v23 = [(CKMessagesController *)self presentedViewController];
      int v24 = [(CKMessagesController *)self composeChatNavigationController];
      BOOL v25 = v23 == v24;

      if (v25)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_601;
        v34[3] = &unk_1E5620C40;
        v34[4] = self;
        [(CKMessagesController *)self dismissViewControllerAnimated:0 completion:v34];
      }
      else
      {
        uint64_t v26 = [(CKMessagesController *)self presentedViewController];
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          int v28 = [(CKMessagesController *)self onboardingController];
          if (v28)
          {
          }
          else
          {
            BOOL v29 = [(CKMessagesController *)self presentedViewController];
            objc_opt_class();
            char v30 = objc_opt_isKindOfClass();

            if ((v30 & 1) == 0)
            {
              __int16 v31 = [(CKMessagesController *)self presentedViewController];
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_2;
              v32[3] = &unk_1E5620F48;
              uint64_t v33 = v21;
              [v31 dismissViewControllerAnimated:0 completion:v32];

              goto LABEL_28;
            }
          }
        }
      }
    }
    v21[2](v21);
LABEL_28:
  }
}

void __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 40)) {
        id v3 = @"YES";
      }
      else {
        id v3 = @"NO";
      }
      int v6 = 138412290;
      BOOL v7 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Popping conversationListNavigationController to root animated: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [*(id *)(a1 + 32) updateInboxAndConversationList];
  if ([*(id *)(a1 + 32) _wantsThreeColumnLayout])
  {
    if (!CKIsRunningInMacCatalyst()) {
      [*(id *)(a1 + 32) hideColumn:0];
    }
    [*(id *)(a1 + 32) showColumn:1];
  }
  else
  {
    [*(id *)(a1 + 32) dismissChatControllerIfVisibleAnimated:*(unsigned __int8 *)(a1 + 40)];
  }
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v4 currentConversation];
  [v4 cleanUpBizNavBarForConversation:v5];
}

uint64_t __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_601(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAndDestroyComposition];
}

uint64_t __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isTimedOutForState:(id)a3
{
  id v3 = [a3 date];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    [v7 resumeToConversationListTimeInterval];
    BOOL v9 = v6 > v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldRestoreToConversationListForState:(id)a3
{
  id v4 = a3;
  if ([(CKMessagesController *)self _isTimedOutForState:v4])
  {
    if (IMOSLoggingEnabled())
    {
      double v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = 0;
        double v6 = "Should restore to conversation list because time suspended exceeded timeOut period. Returning YES";
        BOOL v7 = (uint8_t *)&v34;
LABEL_15:
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (![(CKMessagesController *)self isCollapsed])
  {
    if (IMOSLoggingEnabled())
    {
      double v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v33 = 0;
        double v6 = "Should restore to conversation list because we're expanded. Returning YES.";
        BOOL v7 = v33;
        goto LABEL_15;
      }
LABEL_16:
    }
LABEL_17:
    BOOL v9 = 1;
    goto LABEL_18;
  }
  if (![v4 showingInbox])
  {
    id v11 = [v4 unreadLastMessages];
    uint64_t v12 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v12 unreadFilteredConversationCountIgnoringMessages:v11];

    if (v13 >= 2)
    {
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int16 v31 = 0;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Should restore to conversation list because multiple conversations are newly unread. Returning YES", v31, 2u);
        }
      }
      BOOL v9 = 1;
      goto LABEL_44;
    }
    if (v13 != 1)
    {
      if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v28 = 0;
          _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Should not restore to conversation list because there are no new unread conversations", v28, 2u);
        }
      }
      BOOL v9 = 0;
      goto LABEL_44;
    }
    __int16 v15 = [v4 groupID];
    uint64_t v16 = +[CKConversationList sharedConversationList];
    uint64_t v17 = [v16 conversationForExistingChatWithChatIdentifier:v15];
    id v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      uint64_t v21 = +[CKConversationList sharedConversationList];
      id v19 = [v21 conversationForExistingChatWithGroupID:v15];
    }
    __int16 v22 = +[CKConversationList sharedConversationList];
    id v23 = [v22 firstUnreadFilteredConversationIgnoringMessages:v11];

    int v24 = IMOSLoggingEnabled();
    BOOL v9 = v19 != v23;
    if (v19 == v23)
    {
      if (v24)
      {
        BOOL v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)char v30 = 0;
          uint64_t v26 = "Should not return to conversation list because last conversation is the newly unread conversation. Returning NO";
          uint64_t v27 = v30;
          goto LABEL_41;
        }
LABEL_42:
      }
    }
    else if (v24)
    {
      BOOL v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        __int16 v29 = 0;
        uint64_t v26 = "Should return to conversation list because there is a newly unread conversation. Returning YES";
        uint64_t v27 = (uint8_t *)&v29;
LABEL_41:
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, v26, v27, 2u);
        goto LABEL_42;
      }
      goto LABEL_42;
    }

LABEL_44:
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Should not restore to conversation list because should restore to inbox. Returning NO", buf, 2u);
    }
  }
  BOOL v9 = 0;
LABEL_18:

  return v9;
}

- (void)_hideConversationListForIPadPPTTest
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKMessagesController *)self chatController];
  [v3 setDelegate:0];

  [(CKMessagesController *)self setChatController:0];
  [(CKMessagesController *)self setCurrentConversation:0];
  [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = [(CKMessagesController *)self chatNavigationController];
      double v6 = [v5 viewControllers];
      *(_DWORD *)buf = 138412290;
      __int16 v15 = v6;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "chatNavigationController (_hideConversationListForIPadPPTTest) children:%@", buf, 0xCu);
    }
  }
  BOOL v7 = [(CKMessagesController *)self presentedViewController];
  if (!v7) {
    goto LABEL_7;
  }
  double v8 = [(CKMessagesController *)self presentedViewController];
  BOOL v9 = [(CKMessagesController *)self composeChatNavigationController];
  BOOL v10 = v8 == v9;

  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__CKMessagesController__hideConversationListForIPadPPTTest__block_invoke;
    v13[3] = &unk_1E5620C40;
    v13[4] = self;
    [(CKMessagesController *)self dismissViewControllerAnimated:0 completion:v13];
  }
  else
  {
LABEL_7:
    [(CKMessagesController *)self dismissViewControllerAnimated:0 completion:0];
  }
  id v11 = [(CKMessagesController *)self conversationListNavigationController];
  id v12 = (id)[v11 popToRootViewControllerAnimated:0];
}

uint64_t __59__CKMessagesController__hideConversationListForIPadPPTTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAndDestroyComposition];
}

- (void)conversationListWillBeginEditing:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CKMessagesController *)self view];
    [v4 endEditing:1];
  }
  else
  {
    [(CKMessagesController *)self becomeFirstResponder];
  }
}

- (void)conversationListIsDeletingConversations:(id)a3
{
  id v3 = a3;
  id v4 = +[CKCurrentConversationsManager sharedInstance];
  [v4 purgeConversations:v3];
}

- (BOOL)isShowingSelectionView
{
  if ([(CKMessagesController *)self isCollapsed])
  {
    id v3 = [(CKMessagesController *)self conversationListNavigationController];
    id v4 = [v3 topViewController];
    double v5 = [(CKMessagesController *)self conversationListController];

    if (v4 == v5) {
      return 0;
    }
    double v6 = [(CKMessagesController *)self chatNavigationController];
    BOOL v7 = [v6 viewControllers];
    double v8 = [(CKMessagesController *)self selectionViewController];
    char v9 = [v7 containsObject:v8];
  }
  else
  {
    double v6 = [(CKMessagesController *)self chatNavigationController];
    BOOL v7 = [v6 topViewController];
    double v8 = [(CKMessagesController *)self selectionViewController];
    char v9 = v7 == v8;
  }

  return v9;
}

- (BOOL)isAnimatingMessageSend
{
  if ([(CKMessagesController *)self isCollapsed])
  {
    if ([(CKMessagesController *)self isCollapsed])
    {
      id v3 = [(CKMessagesController *)self presentedViewController];
      id v4 = [(CKMessagesController *)self composeChatNavigationController];

      if (v3 == v4)
      {
        uint64_t v5 = [(CKMessagesController *)self composeChatController];
LABEL_8:
        char v9 = (void *)v5;
        goto LABEL_9;
      }
    }
  }
  else
  {
    double v6 = [(CKMessagesController *)self chatNavigationController];
    BOOL v7 = [v6 topViewController];
    double v8 = [(CKMessagesController *)self chatController];

    if (v7 == v8)
    {
      uint64_t v5 = [(CKMessagesController *)self chatController];
      goto LABEL_8;
    }
  }
  char v9 = 0;
LABEL_9:
  char v10 = [v9 isAnimatingMessageSend];

  return v10;
}

- (BOOL)currentCompositionHasContent
{
  if (![(CKMessagesController *)self isComposingMessage]) {
    return 0;
  }
  id v3 = [(CKMessagesController *)self composeChatController];
  id v4 = [v3 proposedRecipients];
  uint64_t v5 = [v4 count];
  double v6 = [v3 composition];
  char v7 = [v6 hasContent];
  double v8 = [v3 unatomizedRecipientText];
  uint64_t v9 = [v8 length];

  if (v5) {
    char v10 = 1;
  }
  else {
    char v10 = v7;
  }
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

- (BOOL)isTopVCChatNavigationController
{
  id v2 = self;
  id v3 = [(CKMessagesController *)self conversationListNavigationController];
  id v4 = [v3 topViewController];
  uint64_t v5 = [(CKMessagesController *)v2 chatNavigationController];
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (BOOL)isShowingConversationListController
{
  id v2 = [(CKMessagesController *)self conversationListControllerIfInitialized];
  id v3 = [v2 viewIfLoaded];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isShowingComposeChatController
{
  id v3 = [(CKMessagesController *)self composeChatController];

  if (!v3) {
    return 0;
  }
  if ([(CKMessagesController *)self isCollapsed])
  {
    id v4 = [(CKMessagesController *)self presentedViewController];
    BOOL v5 = [(CKMessagesController *)self composeChatNavigationController];
    BOOL v6 = v4 == v5;
  }
  else
  {
    id v4 = [(CKMessagesController *)self chatNavigationController];
    BOOL v5 = [v4 viewControllers];
    char v7 = [v5 firstObject];
    double v8 = [(CKMessagesController *)self composeChatController];
    BOOL v6 = v7 == v8;
  }
  return v6;
}

- (BOOL)hasUnreadFilteredConversationsIgnoringMessages:(id)a3
{
  id v3 = a3;
  id v4 = +[CKConversationList sharedConversationList];
  uint64_t v5 = [v4 unreadFilteredConversationCountIgnoringMessages:v3];

  return v5 > 0;
}

- (BOOL)showUnreadConversationsWithLastConversation:(id)a3 ignoringMessages:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(CKMessagesController *)self isCollapsed])
  {
    if (IMOSLoggingEnabled())
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "showing conversation list", buf, 2u);
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__CKMessagesController_showUnreadConversationsWithLastConversation_ignoringMessages___block_invoke;
    v15[3] = &unk_1E5620C40;
    v15[4] = self;
    [MEMORY[0x1E4F42FF8] _performWithoutDeferringTransitions:v15];
    LOBYTE(v9) = 1;
  }
  else
  {
    char v10 = +[CKConversationList sharedConversationList];
    id v11 = [v10 firstUnreadFilteredConversationIgnoringMessages:v7];

    BOOL v9 = 0;
    if (v6 && v11 == v6) {
      BOOL v9 = [(CKMessagesController *)self resumeToConversation:v6];
    }
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = @"NO";
        *(_DWORD *)buf = 138412802;
        if (v9) {
          uint64_t v13 = @"YES";
        }
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "didShow: %@ unread conversations with last conversation: %@ firstUnreadConversation: %@", buf, 0x20u);
      }
    }
  }

  return v9;
}

uint64_t __85__CKMessagesController_showUnreadConversationsWithLastConversation_ignoringMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showConversationListWithAnimation:0];
}

- (void)_unreadCountDidChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (CKIsRunningInMacCatalyst())
  {
    id v21 = [MEMORY[0x1E4F42738] sharedApplication];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    id v6 = [v5 cachedChats];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v11, "unreadMessageCount", v21))
          {
            uint64_t v27 = @"CKSBActionUserInfoKeyChatGUID";
            id v12 = [v11 guid];
            int v28 = v12;
            uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];

            id v14 = objc_alloc(MEMORY[0x1E4F427A0]);
            __int16 v15 = [v11 localizedUnreadShortcutTitle];
            uint64_t v16 = (void *)[v14 initWithType:@"com.apple.mobilesms.conversation" localizedTitle:v15 localizedSubtitle:0 icon:0 userInfo:v13];

            [v4 addObject:v16];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v8);
    }

    [v21 setShortcutItems:v4];
  }
  else
  {
    uint64_t v17 = [(CKMessagesController *)self inboxModel];
    __int16 v18 = [v17 itemsMap];

    if (v18)
    {
      id v19 = [(CKMessagesController *)self inboxModel];
      __int16 v20 = [v19 itemsMap];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __46__CKMessagesController__unreadCountDidChange___block_invoke;
      v22[3] = &unk_1E562C618;
      void v22[4] = self;
      [v20 enumerateKeysAndObjectsUsingBlock:v22];
    }
  }
}

void __46__CKMessagesController__unreadCountDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  unint64_t v5 = [a2 unsignedIntegerValue];
  if (v5 <= 9)
  {
    id v6 = [*(id *)(a1 + 32) _unreadCountStringForFilterMode:v5];
    [v7 updateAccessory:v6];
  }
}

- (void)_junkConversationsRecovered:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CKMessagesController *)self isOscarModal])
  {
    unint64_t v5 = [(CKMessagesController *)self currentlyShownConversation];
    if (v5)
    {
      id v6 = +[CKConversationList sharedConversationList];
      uint64_t v7 = [v6 primaryFilterModeForConversation:v5];

      if (v7 != 9)
      {
        uint64_t v9 = [(CKMessagesController *)self chatController];
        [v9 updateChatControllerForRecoveredJunkConversation];
        if (CKIsRunningInMacCatalyst())
        {
          if (IMOSLoggingEnabled())
          {
            char v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              LOWORD(v15) = 0;
              _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: Moving back from catalyst filters.", (uint8_t *)&v15, 2u);
            }
          }
          [(CKMessagesController *)self catalystFiltersNavigationBackButtonTapped:0];
        }
        else
        {
          id v11 = [(CKMessagesController *)self junkModalMessagesController];
          if (v11)
          {
            if (IMOSLoggingEnabled())
            {
              id v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                int v15 = 138412290;
                uint64_t v16 = v11;
                _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: Performing junk recovery for junk modal messages controller: %@.", (uint8_t *)&v15, 0xCu);
              }
            }
            [(CKMessagesController *)self performJunkRecoveryForJunkModalMessagesController:v11];
          }
          else if ([(CKMessagesController *)self _shouldShowInboxView])
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                id v14 = CKConversationListFilterModeStringValue(1uLL);
                int v15 = 138412290;
                uint64_t v16 = v14;
                _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "[Filter Mode] _junkConversationsRecovered: Selecting filter mode: %@.", (uint8_t *)&v15, 0xCu);
              }
            }
            [(CKMessagesController *)self inboxViewController:0 didSelectFilterMode:1];
          }
        }
        goto LABEL_32;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_32:

        goto LABEL_33;
      }
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: currently shown conversation is still junk. State not changed.", (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_32;
      }
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: Not showing any conversation. State not changed.", (uint8_t *)&v15, 2u);
      }
    }

    goto LABEL_32;
  }
LABEL_33:
}

- (void)performJunkRecoveryForJunkModalMessagesController:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "performJunkRecoveryForJunkModalMessagesController: %@", buf, 0xCu);
    }
  }
  id v6 = [v4 chatController];
  if ([(CKMessagesController *)self isCollapsed])
  {
    [v6 updateChatControllerForRecoveredJunkConversation];
    uint64_t v7 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke;
    v10[3] = &unk_1E5620AF8;
    v10[4] = self;
    void v10[5] = v6;
    [v6 performAnimatedJunkRecoveryTransition:v10];
  }
  else
  {
    uint64_t v7 = v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke_2;
    v9[3] = &unk_1E5620AF8;
    void v9[4] = self;
    void v9[5] = v6;
    id v8 = v6;
    [(CKMessagesController *)self dismissViewControllerAnimated:1 completion:v9];
  }
}

void __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) conversation];
  [v1 showConversation:v2 animate:0];
}

void __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) conversationListController];
  [v4 updateConversationList];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) conversation];
  [v2 showConversation:v3 animate:1];
}

- (BOOL)isShowingChatControllerWithUnsentText
{
  int v3 = [(CKMessagesController *)self isShowingChatController];
  if (v3)
  {
    uint64_t v4 = [(CKMessagesController *)self chatController];
    unint64_t v5 = [(id)v4 composition];
    char v6 = [v5 hasContent];

    uint64_t v7 = [(CKMessagesController *)self chatController];
    LOBYTE(v4) = [v7 isSendingMessage];

    LOBYTE(v3) = v6 & (v4 ^ 1);
  }
  return v3;
}

- (BOOL)shouldShowMakoIMessageAlert
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMSharedHelperDeviceIsiPad()) {
    int v2 = 1;
  }
  else {
    int v2 = IMSharedHelperDeviceIsiPod();
  }
  BOOL v3 = CKIsBareMakoAccount();
  int v4 = CKRegistrationBypassEnabled();
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      char v6 = @"NO";
      if (v2) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      int v11 = 138413058;
      id v12 = v7;
      if (v3) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      if (!v4) {
        char v6 = @"YES";
      }
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      __int16 v18 = @"YES";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "shouldShowMakoIMessageAlert - isRightDevice: [%@], isMako: [%@], registrationBypassDisabled: [%@], !isSigningInCatalyst: [%@]", (uint8_t *)&v11, 0x2Au);
    }
  }
  if (v3) {
    BOOL v9 = v2;
  }
  else {
    BOOL v9 = 0;
  }
  return !v4 && v9;
}

- (void)showMakoIMessageAlert
{
  BOOL v3 = CKFrameworkBundle();
  int v4 = [v3 localizedStringForKey:@"ADD_EMAIL_ALERT_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];

  unint64_t v5 = CKFrameworkBundle();
  char v6 = [v5 localizedStringForKey:@"SETTINGS" value:&stru_1EDE4CA38 table:@"ChatKit"];

  uint64_t v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"ADD_EMAIL_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  BOOL v9 = +[CKAlertController alertControllerWithTitle:v8 message:v4 preferredStyle:1];

  char v10 = +[CKAlertAction actionWithTitle:v6 style:0 handler:&__block_literal_global_621];
  int v11 = CKFrameworkBundle();
  id v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  __int16 v13 = +[CKAlertAction actionWithTitle:v12 style:1 handler:0];

  [v9 addAction:v10];
  [v9 addAction:v13];
  [v9 presentFromViewController:self animated:1 completion:0];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Mako account: show alert with deep link to settings", v15, 2u);
    }
  }
}

void __45__CKMessagesController_showMakoIMessageAlert__block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)notifyThatKeepMessagesSettingWasResetIfNeededWithCompletion:(id)a3
{
  int v4 = (void (**)(void))a3;
  if (IMShouldDisplayKeepMessagesSetting())
  {
    IMClearDisplayKeepMessagesSetting();
    unint64_t v5 = +[CKUIBehavior sharedBehaviors];
    char v6 = [v5 canPresentOverKeyboard];

    uint64_t v7 = NSString;
    id v8 = CKFrameworkBundle();
    BOOL v9 = [v8 localizedStringForKey:@"RESET_KEEP_MESSAGES_SETTING_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    char v10 = [MEMORY[0x1E4F42948] currentDevice];
    int v11 = [v10 localizedModel];
    id v12 = objc_msgSend(v7, "stringWithFormat:", v9, v11);

    __int16 v13 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v14 = [v13 userInterfaceLayoutDirection];

    if (v14 == 1) {
      __int16 v15 = @"\u200F";
    }
    else {
      __int16 v15 = @"\u200E";
    }
    uint64_t v16 = [(__CFString *)v15 stringByAppendingString:v12];

    __int16 v17 = +[CKAlertController alertControllerWithTitle:v16 message:0 preferredStyle:1];
    __int16 v18 = CKFrameworkBundle();
    uint64_t v19 = [v18 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__CKMessagesController_notifyThatKeepMessagesSettingWasResetIfNeededWithCompletion___block_invoke;
    v21[3] = &unk_1E562A0F8;
    char v23 = v6;
    v21[4] = self;
    uint64_t v22 = v4;
    __int16 v20 = +[CKAlertAction actionWithTitle:v19 style:0 handler:v21];
    [v17 addAction:v20];

    if ((v6 & 1) == 0) {
      [(CKMessagesController *)self becomeFirstResponder];
    }
    [v17 presentFromViewController:self animated:1 completion:0];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __84__CKMessagesController_notifyThatKeepMessagesSettingWasResetIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) becomeFirstResponder];
  }
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)showStoreForURL:(id)a3 fromSourceApplication:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = +[CKAdaptivePresentationController sharedInstance];
  uint64_t v8 = [v7 presentedViewController];
  if (!v8)
  {
LABEL_9:

    goto LABEL_10;
  }
  BOOL v9 = (void *)v8;
  char v10 = +[CKAdaptivePresentationController sharedInstance];
  int v11 = [v10 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    __int16 v13 = +[CKAdaptivePresentationController sharedInstance];
    uint64_t v7 = [v13 presentedViewController];

    uint64_t v14 = [v7 topViewController];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    if (v15)
    {
      uint64_t v16 = [v7 topViewController];
      __int16 v17 = [v16 contentViewController];
      __int16 v18 = [v17 balloonPlugin];
      uint64_t v19 = [v18 identifier];
      int v20 = [v19 isEqualToString:*MEMORY[0x1E4F6CB80]];

      if (v20)
      {
        id v21 = [v16 contentViewController];
        if (objc_opt_respondsToSelector())
        {
          [v21 setStoreLaunchURL:v22 sourceApplication:v6];

          goto LABEL_11;
        }
      }
    }
    goto LABEL_9;
  }
LABEL_10:
  [(CKMessagesController *)self _presentAppStoreWithLaunchURL:v22 fromSourceApplication:v6];
  uint64_t v7 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v7 trackEvent:*MEMORY[0x1E4F6D768]];
LABEL_11:
}

- (void)_presentAppStoreWithLaunchURL:(id)a3 fromSourceApplication:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[CKBalloonPluginManager sharedInstance];
  char v9 = [v8 isAppStoreEnabled];

  if (v9)
  {
    char v10 = [(CKMessagesController *)self currentConversation];
    if ([v10 unreadCount])
    {
    }
    else
    {
      id v18 = [(CKMessagesController *)self currentConversation];

      if (v18)
      {
LABEL_24:
        [(CKMessagesController *)self showConversation:v18 animate:0];
        int v20 = [(CKMessagesController *)self chatController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v22 = [(CKMessagesController *)self chatController];
          [v22 presentAppStoreForURL:v6 fromSourceApplication:v7];
        }
LABEL_26:

        goto LABEL_27;
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v11 = [(CKMessagesController *)self conversationList];
    id v12 = [v11 conversations];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
        if (![v16 unreadCount]) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v13) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v18 = v16;

      if (v18) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_12:
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Asked to launch to app store via open URL, but there are no active conversations. Bailing.", buf, 2u);
      }
    }
    id v18 = 0;
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Asked to launch to app store via open URL, but the app store is not enabled. Bailing.", buf, 2u);
    }
  }
LABEL_27:
}

- (void)dismiss
{
  [(CKMessagesController *)self setStatusBarStyleViewController:0];
  [(CKMessagesController *)self _setEntryViewHidden:0];
  id v3 = +[CKAdaptivePresentationController sharedInstance];
  [v3 dismissViewControllerAnimated:1 completion:&__block_literal_global_633_0];
}

- (void)_setEntryViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CKMessagesController *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(CKMessagesController *)self chatController];
    uint64_t v8 = [v7 entryView];

    if (v3) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
    if (!v3) {
      [v8 setHidden:0];
    }
    char v10 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__CKMessagesController__setEntryViewHidden___block_invoke;
    v15[3] = &unk_1E5622950;
    id v16 = v8;
    double v17 = v9;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __44__CKMessagesController__setEntryViewHidden___block_invoke_2;
    v12[3] = &unk_1E56287B0;
    BOOL v14 = v3;
    id v13 = v16;
    id v11 = v16;
    [v10 animateWithDuration:v15 animations:v12 completion:0.2];
  }
}

uint64_t __44__CKMessagesController__setEntryViewHidden___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __44__CKMessagesController__setEntryViewHidden___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) setHidden:1];
  }
  return result;
}

- (void)didBeginInstallingAppWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[CKAppInstallationWatcher sharedInstance];
  [v4 startListeningForAppBundleIdentifier:v3];
}

- (void)updateCompositionInEntryViewWithComposition:(id)a3
{
  id v4 = a3;
  if ([(CKMessagesController *)self isComposingMessage]) {
    [(CKMessagesController *)self composeChatController];
  }
  else {
  unint64_t v5 = [(CKMessagesController *)self chatController];
  }
  id v8 = [v5 entryView];

  id v6 = [v8 composition];
  id v7 = [v6 compositionByAppendingComposition:v4];

  [v8 setComposition:v7];
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)presentOnboardingViewControllerIfNeeded
{
  id v3 = [(CKMessagesController *)self onboardingControllerCreatingIfNecessary];
  char v4 = [v3 presentOnboardingIfNeeded];

  if ((v4 & 1) == 0)
  {
    [(CKMessagesController *)self setOnboardingController:0];
    [(CKMessagesController *)self executeDeferredTasks];
  }
}

- (void)presentOnboardingViewController:(id)a3
{
  id v3 = [(CKMessagesController *)self onboardingControllerCreatingIfNecessary];
  [v3 presentNicknameSharingSetupFlowWithMemoji:0 forUserInitiatedEdit:0];
}

- (void)onboardingControllerDidFinish:(id)a3
{
  [(CKMessagesController *)self setOnboardingController:0];

  [(CKMessagesController *)self executeDeferredTasks];
}

- (id)_fetchMeContactWithError:(id *)a3
{
  char v4 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  unint64_t v5 = [MEMORY[0x1E4F6E6D8] keysForNicknameHandling];
  id v6 = [v4 fetchMeContactWithKeys:v5 withError:a3];

  return v6;
}

- (void)presentCKAlertController:(id)a3
{
}

- (void)showBusinessChatNotSupportedAlert
{
  id v3 = CKFrameworkBundle();
  char v4 = [v3 localizedStringForKey:@"CANNOT_USE_MESSAGES_FOR_BUSINESS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  unint64_t v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"BUSINESS_CHAT_IS_CURRENTLY_NOT_SUPPORTED" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v10 = +[CKAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  id v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v9 = +[CKAlertAction actionWithTitle:v8 style:0 handler:0];

  [v10 addAction:v9];
  [v10 setPreferredAction:v9];
  [v10 presentFromViewController:self animated:1 completion:0];
}

- (void)showLockdownAlertForBusinessChat
{
  id v3 = IMSharedUtilitiesFrameworkBundle();
  char v4 = [v3 localizedStringForKey:@"LOCKDOWN_BIZ_CHAT_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"IMSharedUtilities-Offramp"];
  unint64_t v5 = IMSharedUtilitiesFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"LOCKDOWN_BIZ_CHAT_ALERT_TEXT" value:&stru_1EDE4CA38 table:@"IMSharedUtilities-Offramp"];
  id v10 = +[CKAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  id v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v9 = +[CKAlertAction actionWithTitle:v8 style:0 handler:0];

  [v10 addAction:v9];
  [v10 setPreferredAction:v9];
  [v10 presentFromViewController:self animated:1 completion:0];
}

- (id)_newCameraBrowser
{
  int v2 = +[CKBalloonPluginManager sharedInstance];
  id v3 = IMBalloonExtensionIDWithSuffix();
  char v4 = [v2 viewControllerForPluginIdentifier:v3 dataSource:0];

  return v4;
}

- (void)inboxViewController:(id)a3 didSelectFilterMode:(unint64_t)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CKMessagesController *)self conversationListController];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = CKConversationListFilterModeStringValue(a4);
      int v47 = 138412546;
      id v48 = v6;
      __int16 v49 = 2112;
      int v50 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "[Filter Mode] inboxViewController: %@ did select filter mode: %@", (uint8_t *)&v47, 0x16u);
    }
  }
  BOOL v10 = [v7 filterMode] == a4;
  [v7 setFilterMode:a4];
  id v11 = [(CKMessagesController *)self conversationListController];
  id v12 = [v11 contentScrollView];
  objc_msgSend(v12, "__ck_scrollToTop:", 0);

  if (!v10)
  {
    id v13 = [(CKMessagesController *)self conversationList];
    [v13 releaseWasKnownSenderHold];

    BOOL v14 = [(CKMessagesController *)self conversationList];
    [v14 updateConversationsWasKnownSender];

    uint64_t v15 = [(CKMessagesController *)self conversationList];
    [v15 clearHoldInUnreadFilter];

    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        double v17 = CKConversationListFilterModeStringValue(a4);
        int v47 = 138412290;
        id v48 = v17;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "[Filter Mode] Filter mode was changed to %@", (uint8_t *)&v47, 0xCu);
      }
    }
    if (a4 != 7 && a4 != 9) {
      [v7 setEditingMode:0];
    }
  }
  if (![(CKMessagesController *)self isCollapsed])
  {
    id v18 = [(CKMessagesController *)self currentlyShownConversation];
    uint64_t v19 = v18;
    if (a4 == 7)
    {
      int v20 = [(CKMessagesController *)self conversationList];
      id v21 = [v20 pendingConversation];

      if (v21)
      {
        id v22 = [(CKMessagesController *)self conversationListController];
        [(CKMessagesController *)self conversationListControllerTappedDeleteNewMessage:v22];
      }
    }
    else if (v18)
    {
      if ([v18 isPending])
      {
        if (IMOSLoggingEnabled())
        {
          long long v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            long long v24 = [(CKMessagesController *)self composeChatController];
            int v47 = 138412290;
            id v48 = v24;
            _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "currentlyShownConversation is pending. Setting view controllers to %@", (uint8_t *)&v47, 0xCu);
          }
        }
        long long v25 = [(CKMessagesController *)self composeChatController];

        if (v25)
        {
          long long v26 = [(CKMessagesController *)self chatNavigationController];
          uint64_t v27 = [(CKMessagesController *)self composeChatController];
          v54[0] = v27;
          int v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
          [v26 setViewControllers:v28];

          goto LABEL_40;
        }
        int v37 = IMLogHandleForCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[CKMessagesController inboxViewController:didSelectFilterMode:]();
        }
      }
      else
      {
        uint64_t v29 = [(CKMessagesController *)self conversationList];
        int v30 = [v29 conversation:v19 includedInFilterMode:a4];

        if (!v30) {
          goto LABEL_40;
        }
        if (IMOSLoggingEnabled())
        {
          __int16 v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            BOOL v32 = [(CKMessagesController *)self chatController];
            int v47 = 138412290;
            id v48 = v32;
            _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "Should show selected conversation. Setting view controllers to %@", (uint8_t *)&v47, 0xCu);
          }
        }
        uint64_t v33 = [(CKMessagesController *)self chatController];

        if (v33)
        {
          __int16 v34 = [(CKMessagesController *)self chatNavigationController];
          id v35 = [(CKMessagesController *)self chatController];
          id v53 = v35;
          BOOL v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          [v34 setViewControllers:v36];

          goto LABEL_40;
        }
        int v37 = IMLogHandleForCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[CKMessagesController inboxViewController:didSelectFilterMode:]();
        }
      }

      goto LABEL_40;
    }
    [(CKMessagesController *)self _populateChatNavigationControllerWithSelection];
LABEL_40:
  }
  if ([(CKMessagesController *)self _wantsThreeColumnLayout])
  {
    [v7 updateConversationList];
    if (!CKIsRunningInMacCatalyst()) {
      [(CKMessagesController *)self hideColumn:0];
    }
    [(CKMessagesController *)self showColumn:1];
  }
  else if (CKIsRunningInMacCatalyst())
  {
    [v7 updateConversationList];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        uint64_t v39 = [v6 navigationController];
        id v40 = [v6 navigationController];
        int v41 = [v40 viewControllers];
        int v47 = 138412802;
        id v48 = v7;
        __int16 v49 = 2112;
        int v50 = v39;
        __int16 v51 = 2112;
        __int16 v52 = v41;
        _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Pushing %@ onto %@. Current hierarchy: %@", (uint8_t *)&v47, 0x20u);
      }
    }
    int v42 = [v6 navigationController];
    id v43 = [v42 viewControllers];
    char v44 = [v43 containsObject:v7];

    if (v44)
    {
      id v45 = IMLogHandleForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[CKMessagesController inboxViewController:didSelectFilterMode:]();
      }
    }
    else
    {
      id v46 = [v6 navigationController];
      [v46 pushViewController:v7 animated:1];
    }
  }
}

- (BOOL)inboxViewController:(id)a3 shouldShowFilterMode:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 9)
  {
    char v8 = IMIsOscarEnabled();
LABEL_8:
    BOOL v7 = v8;
    goto LABEL_9;
  }
  if (a4 != 6)
  {
    BOOL v7 = 1;
    goto LABEL_9;
  }
  if ((IMIsOscarEnabled() & 1) == 0)
  {
    char v8 = [(CKMessagesController *)self _spamFilteringEnabled];
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)_spamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (unint64_t)selectedCountForSelectionViewController:(id)a3
{
  id v3 = [(CKMessagesController *)self conversationListController];
  char v4 = [v3 collectionView];
  unint64_t v5 = [v4 indexPathsForSelectedItems];
  unint64_t v6 = [v5 count];

  return v6;
}

- (BOOL)areSelectedConversationsBlocked
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = [(CKMessagesController *)self conversationListController];
  id v3 = [v2 selectedConversations];
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "chat", (void)v13);
          int v10 = [v9 isDeletingIncomingMessages];

          if (!v10)
          {
            BOOL v11 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_12:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)secondaryTextForSelectionViewController:(id)a3
{
  if ([(CKMessagesController *)self hasRecentlyDeletedFilterSelected])
  {
    id v4 = [(CKMessagesController *)self _recentlyDeletedDisclosureText];
  }
  else if ([(CKMessagesController *)self _isApplyingJunkFilter])
  {
    uint64_t v5 = CKFrameworkBundle();
    id v4 = [v5 localizedStringForKey:@"OSCAR_DISCLOSURE_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)deleteButtonPressedOnSelectionViewController:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKMessagesController *)self conversationListController];
  if ([(CKMessagesController *)self hasRecentlyDeletedFilterSelected])
  {
    [v5 _permanentDeleteSelectedConversations];
  }
  else if ([(CKMessagesController *)self _isApplyingJunkFilter])
  {
    [v5 _permanentDeleteSelectedJunkButtonTapped:0];
  }
  else
  {
    unint64_t v6 = [(CKMessagesController *)self currentConversationListFilterMode];
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        char v8 = CKConversationListFilterModeStringValue(v6);
        int v9 = 138412290;
        int v10 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "CKMessagesController - deleteAllButtonPressedOnSelectionViewController: unsupported filterMode: %@. No action executing.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)deleteAllButtonPressedOnSelectionViewController:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKMessagesController *)self _isApplyingJunkFilter])
  {
    uint64_t v5 = [(CKMessagesController *)self conversationListController];
    [v5 _permanentDeleteAllJunkButtonTapped:0];
  }
  else
  {
    unint64_t v6 = [(CKMessagesController *)self currentConversationListFilterMode];
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        char v8 = CKConversationListFilterModeStringValue(v6);
        int v9 = 138412290;
        int v10 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "CKMessagesController - deleteAllButtonPressedOnSelectionViewController: unsupported filterMode: %@. No action executing.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)recoverButtonPressedOnSelectionViewController:(id)a3
{
  id v3 = [(CKMessagesController *)self conversationListController];
  [v3 _recoverSelectedConversations];
}

- (BOOL)anyConversationsExistFor:(id)a3
{
  id v3 = [(CKMessagesController *)self conversationList];
  id v4 = [v3 conversationsForFilterMode:0];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)selectionViewControllerSelectedCompose
{
  id v2 = [(CKMessagesController *)self conversationListController];
  [v2 composeButtonClicked:0];
}

- (BOOL)_isMessageFilteringEnabled
{
  return CKMessageFilteringEnabled();
}

- (void)didDismissSendMenu:(id)a3 usingPresentationContext:(id)a4
{
}

- (id)newInputSnapshotView
{
  if ([(CKMessagesController *)self isComposingMessage])
  {
    id v3 = [(CKMessagesController *)self composeChatController];
  }
  else
  {
    id v3 = self->_chatController;
  }
  id v4 = v3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    BOOL v5 = (void *)[(CKCoreChatController *)v4 newInputSnapshotView];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)requestDismissKeyboardSnapshotForSendMenu
{
  if ([(CKMessagesController *)self isComposingMessage])
  {
    id v3 = [(CKMessagesController *)self composeChatController];
  }
  else
  {
    id v3 = self->_chatController;
  }
  id v4 = v3;
  if (v3)
  {
    unint64_t v6 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v6;
    if (isKindOfClass)
    {
      [(CKCoreChatController *)v6 requestDismissKeyboardSnapshotForSendMenu];
      id v4 = v6;
    }
  }
}

- (void)requestShowKeyboardSnapshotForSendMenu
{
  if ([(CKMessagesController *)self isComposingMessage])
  {
    id v3 = [(CKMessagesController *)self composeChatController];
  }
  else
  {
    id v3 = self->_chatController;
  }
  id v4 = v3;
  if (v3)
  {
    unint64_t v6 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v6;
    if (isKindOfClass)
    {
      [(CKCoreChatController *)v6 requestShowKeyboardSnapshotForSendMenu];
      id v4 = v6;
    }
  }
}

- (id)deferredHandleURLBlock
{
  return self->_deferredHandleURLBlock;
}

- (CKMessagesControllerDelegate)messagesControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesControllerDelegate);

  return (CKMessagesControllerDelegate *)WeakRetained;
}

- (void)setConversationListController:(id)a3
{
}

- (void)setConversationListNavigationController:(id)a3
{
}

- (void)setChatNavigationController:(id)a3
{
}

- (CKDetailsNavigationController)detailsNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsNavigationController);

  return (CKDetailsNavigationController *)WeakRetained;
}

- (void)setDetailsNavigationController:(id)a3
{
}

- (UINavigationController)composeChatNavigationController
{
  return self->_composeChatNavigationController;
}

- (void)setSelectionViewController:(id)a3
{
}

- (void)setInboxViewController:(id)a3
{
}

- (void)setMacToolbarController:(id)a3
{
}

- (CKSendMenuPresentation)sendMenuPresentation
{
  return self->_sendMenuPresentation;
}

- (void)setSendMenuPresentation:(id)a3
{
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_uint64_t supportedInterfaceOrientations = a3;
}

- (CKBrowserViewControllerProtocol)prewarmedCameraBrowser
{
  return self->_prewarmedCameraBrowser;
}

- (void)setPrewarmedCameraBrowser:(id)a3
{
}

- (void)setInboxModel:(id)a3
{
}

- (CKInteractionNotificationView)dismissOnInteractionView
{
  return self->_dismissOnInteractionView;
}

- (void)setDismissOnInteractionView:(id)a3
{
}

- (UIViewController)statusBarStyleViewController
{
  return self->_statusBarStyleViewController;
}

- (void)setStatusBarStyleViewController:(id)a3
{
}

- (CKAlertController)currentSMSRelayPinAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentSMSRelayPinAlert);

  return (CKAlertController *)WeakRetained;
}

- (void)setCurrentSMSRelayPinAlert:(id)a3
{
}

- (NSMutableArray)pendingSMSRelayPINPrompts
{
  return self->_pendingSMSRelayPINPrompts;
}

- (void)setPendingSMSRelayPINPrompts:(id)a3
{
}

- ($5E9189851FD2AFACF3F6099594984659)columnResizeParams
{
  *($950D5E962FFC93217365F7FF3E242C75 *)retstr = *($950D5E962FFC93217365F7FF3E242C75 *)((char *)self + 1216);
  return self;
}

- (void)setColumnResizeParams:(id *)a3
{
  uint64_t v3 = *(void *)&a3->var2;
  *(_OWORD *)&self->_columnResizeParams.currentDragDistance = *(_OWORD *)&a3->var0;
  *(void *)&self->_columnResizeParams.proposedPreviouslyIncreasing = v3;
}

- (NSArray)windowToConversationListConstraints
{
  return self->_windowToConversationListConstraints;
}

- (void)setWindowToConversationListConstraints:(id)a3
{
}

- (BOOL)forceOrientation
{
  return self->_forceOrientation;
}

- (void)setForceOrientation:(BOOL)a3
{
  self->_forceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowToConversationListConstraints, 0);
  objc_storeStrong((id *)&self->_pendingSMSRelayPINPrompts, 0);
  objc_destroyWeak((id *)&self->_currentSMSRelayPinAlert);
  objc_storeStrong((id *)&self->_statusBarStyleViewController, 0);
  objc_storeStrong((id *)&self->_alertUtilities, 0);
  objc_storeStrong((id *)&self->_dismissOnInteractionView, 0);
  objc_destroyWeak((id *)&self->_inboxModel);
  objc_storeStrong((id *)&self->_prewarmedCameraBrowser, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_sendMenuPresentation, 0);
  objc_storeStrong((id *)&self->_macToolbarController, 0);
  objc_storeStrong((id *)&self->_inboxViewController, 0);
  objc_storeStrong((id *)&self->_selectionViewController, 0);
  objc_storeStrong((id *)&self->_currentConversation, 0);
  objc_storeStrong((id *)&self->_composeChatNavigationController, 0);
  objc_destroyWeak((id *)&self->_detailsNavigationController);
  objc_storeStrong((id *)&self->_chatNavigationController, 0);
  objc_storeStrong((id *)&self->_conversationListNavigationController, 0);
  objc_storeStrong((id *)&self->_composeChatController, 0);
  objc_storeStrong((id *)&self->_chatController, 0);
  objc_storeStrong((id *)&self->_conversationListController, 0);
  objc_destroyWeak((id *)&self->_messagesControllerDelegate);

  objc_storeStrong(&self->_deferredHandleURLBlock, 0);
}

void __85__CKMessagesController__checkChatControllerLeaksForExistingController_newController___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  id v4 = WeakRetained;
  BOOL v5 = [v4 conversation];
  int v6 = 134218242;
  id v7 = WeakRetained;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_fault_impl(&dword_18EF18000, a2, OS_LOG_TYPE_FAULT, "CKChatController leak detected for instance %p conversation %@", (uint8_t *)&v6, 0x16u);
}

- (void)showInboxViewControllerAnimated:(void *)a1 .cold.1(void *a1)
{
  [a1 _shouldShowInboxView];
  [a1 _wantsThreeColumnLayout];
  OUTLINED_FUNCTION_1_1(&dword_18EF18000, v2, v3, "Tried to pop to Inbox view controller, but it doesn't exist. shouldShowInboxView:%@, wantsThreeColumnLayout:%@", v4, v5, v6, v7, 2u);
}

- (void)changeFilterMode:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_1_1(&dword_18EF18000, v4, v5, "[Filter Mode] Current filterMode: %@, new filterMode: %@", v6, v7, v8, v9, 2u);
}

- (void)changeFilterMode:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "[Filter Mode] Changing Filter Mode", v2, v3, v4, v5, v6);
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "weakSelf was unexpectedly nil for zoom transition source view provider", v2, v3, v4, v5, v6);
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "weakConversation was unexpectedly nil for zoom transition source view provider", v2, v3, v4, v5, v6);
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "SourceView was unexpectedly nil for zoom transition", v2, v3, v4, v5, v6);
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Could not find index path for pinned conversation with itemIdentifier: %@", v2, v3, v4, v5, v6);
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Collection view cell for zoom transition was unexpectedly nil for indexPath: %@", v2, v3, v4, v5, v6);
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Avatar view for zoom transition was unexpectedly nil", v2, v3, v4, v5, v6);
}

- (void)_sourceViewForFluidTransitionWithConversation:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Collection view cell for zoom transition was of unexpected type: %@", v5, 0xCu);
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Attempting to perform zoom transition while the conversation list has a presentedViewController.", v2, v3, v4, v5, v6);
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Attempting to perform zoom transition with a non pinned conversation.", v2, v3, v4, v5, v6);
}

- (void)inboxViewController:didSelectFilterMode:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Tried to push %@, but it's already in the nav controller hierarchy. This shouldn't be possible. Dropping.", v2, v3, v4, v5, v6);
}

- (void)inboxViewController:didSelectFilterMode:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "composeChatController is nil when conversation is pending", v2, v3, v4, v5, v6);
}

- (void)inboxViewController:didSelectFilterMode:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "chatController is nil when conversation is selected", v2, v3, v4, v5, v6);
}

@end