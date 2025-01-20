@interface CKComposeChatController
- (BOOL)_chatShowsAccountRegistrationFailureBanner;
- (BOOL)_isAllowlistedBusinessRecipient;
- (BOOL)_isBusinessConversation;
- (BOOL)_isNewBusinessConversation;
- (BOOL)_shouldRestoreDraftState;
- (BOOL)_shouldSetToFieldAsFirstResponder;
- (BOOL)_shouldValidatePayloadBeforeSendingPayload:(id)a3;
- (BOOL)_showOrHideNicknameBannerIfNeeded;
- (BOOL)_wantsCatchUpAffordance;
- (BOOL)allowsLoadingIndicatorPresentation;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canShowBusinessOnboarding;
- (BOOL)entryViewRequiresCollectionView;
- (BOOL)hasFailedRecipients;
- (BOOL)hasUnreachableEmergencyRecipient;
- (BOOL)ignoreEmailsWhenSending;
- (BOOL)ignoreKeyboardNotifications;
- (BOOL)isComposingRecipient;
- (BOOL)isSafeToMarkAsRead;
- (BOOL)isSendingComposition;
- (BOOL)itemProviderDisablesTouches;
- (BOOL)newComposeCancelled;
- (BOOL)prefersBottomDividerHidden;
- (BOOL)recipientSelectionIsGroup:(id)a3;
- (BOOL)recipientsListChanged;
- (BOOL)reloadEntryViewForStagedPluginMessage;
- (BOOL)reparentToolbarItem:(id)a3;
- (BOOL)sendingViaCardUI;
- (BOOL)shouldForceToSMSForConversation:(id)a3 forRecipient:(id)a4;
- (BOOL)shouldListParticipantsInTitle;
- (BOOL)shouldPresentBlockingDowntimeViewController;
- (BOOL)shouldShowComposeCancelItem;
- (BOOL)shouldShowEntryView;
- (BOOL)shouldUseMacRecipientsView;
- (BOOL)shouldUseNavigationBarCanvasView;
- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldForceOpaqueMask:(id)a3;
- (CKBusinessInfoView)businessInfoView;
- (CKComposeChatController)initWithRecipientAddresses:(id)a3 composition:(id)a4 bizIntent:(id)a5;
- (CKComposeChatController)initWithRecipientAddresses:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 simID:(id)a7;
- (CKComposeNavbarManager)navbarManager;
- (CKComposeRecipientSelectionController)composeRecipientSelectionController;
- (CKComposition)prepopulatedComposition;
- (CKTranscriptMultilineLabelCell)blackholeAlertView;
- (IMHandle)businessHandle;
- (NSArray)prepopulatedRecipients;
- (NSArray)proposedRecipients;
- (NSDictionary)bizIntent;
- (NSString)lastAddressedHandle;
- (NSString)lastAddressedSIMID;
- (NSString)overrideTitle;
- (NSString)prepopulatedSIMID;
- (NSString)serviceId;
- (NSString)suggestedRepliesData;
- (NSString)unatomizedRecipientText;
- (UIBarButtonItem)composeCancelItem;
- (UIEdgeInsets)macToolbarInsets;
- (UIEdgeInsets)recipientSelectionAdditionalSearchListInsets;
- (UIEdgeInsets)virtualToolbarContentInsets;
- (UINavigationController)catalystComposeNavigationController;
- (UIView)recipientSelectionHeaderDecorationView;
- (UIView)virtualToolbarItem;
- (double)_entryViewTopInsetPadding;
- (double)topInsetPadding;
- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3;
- (id)_anisetteData;
- (id)_updateSendingIdentity;
- (id)chatForIMHandle:(id)a3;
- (id)deferredSendAnimationBlock;
- (id)handleForRecipientNormalizedAddress:(id)a3;
- (id)inputAccessoryView;
- (id)inputAccessoryViewController;
- (id)outgoingComposeViewForSendAnimation;
- (id)preferredFocusEnvironments;
- (id)selectedRecipientsForSuggestionsController:(id)a3;
- (id)textViewOnscreenWithEntryView;
- (id)toolbarItemForIdentifier:(id)a3;
- (id)virtualView;
- (int64_t)preferredStatusBarStyle;
- (int64_t)recipientSelectionUserInterfaceStyleOverride;
- (void)_configureTitleView;
- (void)_determineSpamFilterHandshakeStateForAccount:(id)a3;
- (void)_invalidateBlackholeAlertView;
- (void)_passKitUIDismissed:(id)a3;
- (void)_prepareForSendFromCardIfNecessaryAndSend:(id)a3;
- (void)_processBizIntentIfNeeded;
- (void)_reloadMentionsData;
- (void)_saveDraftState;
- (void)_setConversationDeferredSetup;
- (void)_triggerRecipientFinalization;
- (void)_updateBizNavbarIfNecessary;
- (void)_updateBlackholeAlertView;
- (void)_updateBusinessInfoIfNecessary;
- (void)_updateNavigationButtons;
- (void)_updateNavigationUI;
- (void)_updateSendLaterCompositionIfNecessary;
- (void)_updateTitleAnimated:(BOOL)a3;
- (void)addBizIntentToConversation:(id)a3;
- (void)businessInfoView:(id)a3 infoButtonTapped:(id)a4;
- (void)cancelCompose;
- (void)configureWithToolbarController:(id)a3;
- (void)conversationLeft;
- (void)dealloc;
- (void)didFinishShowingBusinessOnboarding;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleAddressBookChange:(id)a3;
- (void)handleCancelAction:(id)a3;
- (void)invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)layoutBusinessInfoViewIfNecessary;
- (void)messageEntryViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5;
- (void)messageEntryViewSendButtonHit:(id)a3;
- (void)messageEntryViewSendButtonHitWhileDisabled:(id)a3;
- (void)navbarManagerIsAnimatingNavbarTransition:(id)a3;
- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4;
- (void)prepareForSuspend;
- (void)prepareToDismissForSecondInstance;
- (void)providerWillBeRemovedFromToolbarController:(id)a3;
- (void)recipientSelectionController:(id)a3 didFinishAvailaiblityLookupForRecipient:(id)a4;
- (void)recipientSelectionController:(id)a3 didSelectConversation:(id)a4 isiMessagable:(BOOL)a5;
- (void)recipientSelectionController:(id)a3 textDidChange:(id)a4;
- (void)recipientSelectionControllerDidBecomeFirstResponder:(id)a3;
- (void)recipientSelectionControllerDidChangeSize:(id)a3;
- (void)recipientSelectionControllerDidPushABViewController:(id)a3;
- (void)recipientSelectionControllerReturnPressed:(id)a3;
- (void)recipientSelectionControllerSearchListDidShowOrHide:(id)a3;
- (void)recipientSelectionControllerShouldResignFirstResponder:(id)a3;
- (void)recipientSelectionControllerTabPressed:(id)a3;
- (void)reloadEntryViewIfNeeded;
- (void)restoreInputAfterSearchPresentation;
- (void)sendAnimationManagerWillStartAnimation:(id)a3 context:(id)a4;
- (void)sendComposition:(id)a3;
- (void)setBizIntent:(id)a3;
- (void)setBlackholeAlertStatusQueue:(uint64_t)a1;
- (void)setBlackholeAlertView:(id)a3;
- (void)setBusinessHandle:(id)a3;
- (void)setBusinessInfoView:(id)a3;
- (void)setBusinessInfoViewInfoIfNecessary;
- (void)setCatalystComposeNavigationController:(id)a3;
- (void)setComposeCancelItem:(id)a3;
- (void)setComposeRecipientSelectionController:(id)a3;
- (void)setDeferredSendAnimationBlock:(id)a3;
- (void)setIgnoreEmailsWhenSending:(BOOL)a3;
- (void)setIgnoreKeyboardNotifications:(BOOL)a3;
- (void)setLastAddressedHandle:(id)a3;
- (void)setLastAddressedSIMID:(id)a3;
- (void)setNavbarManager:(id)a3;
- (void)setNewComposeCancelled:(BOOL)a3;
- (void)setOverrideTitle:(id)a3;
- (void)setPrepopulatedComposition:(id)a3;
- (void)setPrepopulatedRecipients:(id)a3;
- (void)setPrepopulatedSIMID:(id)a3;
- (void)setRecipientsListChanged:(BOOL)a3;
- (void)setSendingComposition:(BOOL)a3;
- (void)setSendingViaCardUI:(BOOL)a3;
- (void)setServiceId:(id)a3;
- (void)setSuggestedRepliesData:(id)a3;
- (void)setVirtualToolbarItem:(id)a3;
- (void)showConversation:(id)a3 animate:(BOOL)a4;
- (void)stageSuggestedReplies;
- (void)suggestionsController:(id)a3 didDeselectRecipient:(id)a4;
- (void)suggestionsController:(id)a3 didSelectRecipient:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CKComposeChatController

- (void)dealloc
{
  v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 shouldSuppressRotationInNewCompose];

  if (v4) {
    [(CKChatController *)self endHoldingAutorotationForKey:@"CKAutorotationHoldNewCompose"];
  }
  v5 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v5 stopCheckingRecipientAvailabilityAndRemoveAllTimers];

  v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v6 invalidateOutstandingIDStatusRequests];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v8 dealloc];
}

- (CKComposeChatController)initWithRecipientAddresses:(id)a3 composition:(id)a4 bizIntent:(id)a5
{
  return [(CKComposeChatController *)self initWithRecipientAddresses:a3 composition:a4 chatIdentifier:0 bizIntent:a5 simID:0];
}

- (CKComposeChatController)initWithRecipientAddresses:(id)a3 composition:(id)a4 chatIdentifier:(id)a5 bizIntent:(id)a6 simID:(id)a7
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[CKConversation newPendingConversation];
  v77.receiver = self;
  v77.super_class = (Class)CKComposeChatController;
  v18 = [(CKChatController *)&v77 initWithConversation:v17];

  if (v18)
  {
    if (v12 && [v12 count])
    {
      v63 = v16;
      id v64 = v15;
      id v66 = v14;
      v67 = v18;
      id v65 = v13;
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v20 = v12;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v73 objects:v80 count:16];
      v68 = v19;
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = 0;
        uint64_t v24 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v74 != v24) {
              objc_enumerationMutation(v20);
            }
            v26 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            if (CKIsValidAddress(v26))
            {
              v27 = +[CKRecipientGenerator sharedRecipientGenerator];
              v28 = [v27 recipientWithAddress:v26];

              if (v28)
              {
                if (!v23)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v29 = v28;
                    v30 = [v29 handle];
                    int v31 = [v30 isBusiness];

                    if (v31)
                    {
                      uint64_t v23 = [v29 handle];
                    }
                    else
                    {
                      uint64_t v23 = 0;
                    }
                    v19 = v68;
                  }
                  else
                  {
                    uint64_t v23 = 0;
                  }
                }
                [v19 addObject:v28];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v73 objects:v80 count:16];
        }
        while (v22);
      }
      else
      {
        uint64_t v23 = 0;
      }

      [(CKComposeChatController *)v67 setRecipientsListChanged:0];
      v32 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      id v14 = v66;
      v33 = [v32 existingChatWithChatIdentifier:v66];

      if (v33)
      {
        v34 = v68;
        if ([v33 isGroupChat])
        {
          v61 = v33;
          id v62 = v12;
          id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v36 = v20;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v69 objects:v79 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v70 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v69 + 1) + 8 * j);
                id v42 = objc_alloc(MEMORY[0x1E4F6BCD8]);
                v43 = [MEMORY[0x1E4F6BBD8] sharedInstance];
                v44 = objc_msgSend(v43, "__ck_bestAccountForAddresses:", v36);
                v45 = (void *)[v42 initWithAccount:v44 ID:v41 alreadyCanonical:1];

                [v35 addObject:v45];
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v69 objects:v79 count:16];
            }
            while (v38);
          }

          v46 = [CKIMGroupComposeRecipient alloc];
          v47 = [v61 guid];
          v48 = [v61 displayName];
          v49 = [(CKIMGroupComposeRecipient *)v46 initWithGUID:v47 displayString:v48 detailsString:0 handles:v35 lastMessageDate:0 searchTerm:0 matchingRecipient:0];

          v50 = (void *)MEMORY[0x1E4F1CA48];
          v78 = v49;
          v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
          v34 = [v50 arrayWithArray:v51];

          v33 = v61;
          id v12 = v62;
          id v14 = v66;
        }
      }
      else
      {
        v34 = v68;
      }
      v18 = v67;
      v52 = (void *)v23;
      [(CKComposeChatController *)v67 setBusinessHandle:v23];
      [(CKComposeChatController *)v67 setPrepopulatedRecipients:v34];
      id v15 = v64;
      id v13 = v65;
      id v16 = v63;
      if (v63)
      {
        uint64_t v53 = [v63 copy];
        prepopulatedSIMID = v67->_prepopulatedSIMID;
        v67->_prepopulatedSIMID = (NSString *)v53;
      }
    }
    [(CKComposeChatController *)v18 setPrepopulatedComposition:v13];
    if (!CKIsRunningInMessagesViewService() || !CKIsRunningInMacCatalyst())
    {
      v55 = [CKComposeNavbarManager alloc];
      v56 = [(CKComposeChatController *)v18 businessHandle];
      id v57 = [(CKComposeNavbarManager *)v55 initForBusinessChat:v56 != 0];

      [v57 setCanvasViewControllerDelegate:v18];
      [v57 setDelegate:v18];
      [(CKComposeChatController *)v18 setNavbarManager:v57];
      [(CKComposeChatController *)v18 _configureTitleView];
    }
    [(CKComposeChatController *)v18 setBizIntent:v15];
    v58 = +[CKUIBehavior sharedBehaviors];
    int v59 = [v58 shouldSuppressRotationInNewCompose];

    if (v59) {
      [(CKChatController *)v18 beginHoldingAutorotationForKey:@"CKAutorotationHoldNewCompose"];
    }
  }

  return v18;
}

- (void)prepareForSuspend
{
  v4.receiver = self;
  v4.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v4 prepareForSuspend];
  v3 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v3 invalidateOutstandingIDStatusRequests];
}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  -[CKCoreChatController parentControllerDidResume:animating:](&v8, sel_parentControllerDidResume_animating_);
  v7 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v7 parentControllerDidResume:v5 animating:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v8 viewWillAppear:a3];
  [(CKChatController *)self setFrozenEntryViewHeightDuringDismissAnimation:0];
  [(CKComposeChatController *)self _updateBusinessInfoIfNecessary];
  [(CKComposeChatController *)self _updateNavigationUI];
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v4 = +[CKUIBehavior sharedBehaviors];
    char v5 = [v4 useMacToolbar];

    if ((v5 & 1) == 0)
    {
      v6 = [(CKComposeChatController *)self catalystComposeNavigationController];
      [v6 setNavigationBarHidden:1 animated:0];
    }
  }
  v7 = +[CKBalloonPluginManager sharedInstance];
  [v7 invalidatePhotosViewController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v16 viewWillDisappear:a3];
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v4 = +[CKUIBehavior sharedBehaviors];
    char v5 = [v4 useMacToolbar];

    if ((v5 & 1) == 0)
    {
      v6 = [(CKComposeChatController *)self catalystComposeNavigationController];
      [v6 setNavigationBarHidden:0 animated:0];
    }
  }
  v7 = NSNumber;
  [(CKChatController *)self _maxEntryViewHeight];
  objc_super v8 = objc_msgSend(v7, "numberWithDouble:");
  [(CKChatController *)self setFrozenEntryViewHeightDuringDismissAnimation:v8];

  id location = 0;
  objc_initWeak(&location, self);
  v9 = [(CKComposeChatController *)self transitionCoordinator];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __45__CKComposeChatController_viewWillDisappear___block_invoke;
  id v13 = &unk_1E5628AA0;
  objc_copyWeak(&v14, &location);
  [v9 notifyWhenInteractionChangesUsingBlock:&v10];

  [(CKComposeChatController *)self resignFirstResponder];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __45__CKComposeChatController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setFrozenEntryViewHeightDuringDismissAnimation:0];
    [WeakRetained updateEntryViewHeightIncludingAppStrip:1 animated:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v6 viewDidDisappear:a3];
  BOOL v4 = [(CKComposeChatController *)self navbarManager];
  char v5 = [v4 customStatusBackgroundView];
  [v5 removeFromSuperview];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v22 viewDidLoad];
  v3 = [(CKComposeChatController *)self navbarManager];
  BOOL v4 = [v3 cancelButton];
  [v4 addTarget:self action:sel_cancelButtonTapped forEvents:64];

  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_handleAddressBookChange_ name:*MEMORY[0x1E4F6CA50] object:0];

  if (CKIsRunningInMacCatalyst())
  {
    objc_super v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 useMacToolbar];

    objc_super v8 = [(CKComposeChatController *)self navigationController];
    v9 = v8;
    if (v7)
    {
      [v8 setNavigationBarHidden:1];
    }
    else
    {
      [(CKComposeChatController *)self setCatalystComposeNavigationController:v8];

      uint64_t v10 = [(CKComposeChatController *)self catalystComposeNavigationController];
      uint64_t v11 = [v10 navigationBar];
      [v11 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      v9 = [(CKComposeChatController *)self catalystComposeNavigationController];
      v18 = [v9 navigationBar];
      v19 = +[CKUIBehavior sharedBehaviors];
      [v19 marzNavigationBarHeight];
      objc_msgSend(v18, "setFrame:", v13, v15, v17, v20);
    }
  }
  if (CKIsRunningInMessagesViewService())
  {
    uint64_t v21 = [MEMORY[0x1E4F6E668] sharedInstance];
    [v21 resetCacheSubscriptionInfo];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v3 viewWillLayoutSubviews];
  [(CKComposeChatController *)self _updateBlackholeAlertView];
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(CKCoreChatController *)self initialLayoutComplete];
  v28.receiver = self;
  v28.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v28 viewDidLayoutSubviews];
  [(CKComposeChatController *)self _updateBusinessInfoIfNecessary];
  [(CKComposeChatController *)self layoutBusinessInfoViewIfNecessary];
  BOOL v4 = [(CKComposeChatController *)self blackholeAlertView];

  if (v4)
  {
    char v5 = [(CKComposeChatController *)self view];
    [v5 bounds];
    double Width = CGRectGetWidth(v29);

    int v7 = [(CKComposeChatController *)self blackholeAlertView];
    uint64_t v8 = [v7 label];
    v9 = [(id)v8 attributedText];
    +[CKBlackholeChatItem sizeThatFits:text:](CKBlackholeChatItem, "sizeThatFits:text:", v9, Width, 1.79769313e308);
    double v11 = v10;

    double v12 = *MEMORY[0x1E4F1DB28];
    [(CKScrollViewController *)self navigationBarInsets];
    double v14 = v13;
    double v15 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v15 collapsedHeight];
    double v17 = v14 + v16;

    v18 = +[CKUIBehavior sharedBehaviors];
    [v18 topTranscriptSpace];
    double v20 = v17 + v19;

    uint64_t v21 = [(CKComposeChatController *)self composeRecipientSelectionController];
    objc_super v22 = [v21 fromFieldContainerView];
    LOBYTE(v8) = [v22 isHidden];

    if ((v8 & 1) == 0)
    {
      uint64_t v23 = [(CKComposeChatController *)self composeRecipientSelectionController];
      uint64_t v24 = [v23 fromFieldContainerView];
      [v24 frame];
      double v20 = v20 + v25;
    }
    v26 = [(CKComposeChatController *)self blackholeAlertView];
    objc_msgSend(v26, "setFrame:", v12, v20, Width, v11);
  }
  if (!v3)
  {
    if ([(CKComposeChatController *)self _shouldSetToFieldAsFirstResponder]) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = 1;
    }
    [(CKChatController *)self setTargetFirstResponder:v27];
    [(CKComposeChatController *)self reloadInputViews];
    [(CKComposeChatController *)self becomeFirstResponder];
  }
}

- (void)viewLayoutMarginsDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)CKComposeChatController;
  [(CKComposeChatController *)&v12 viewLayoutMarginsDidChange];
  [(CKComposeChatController *)self systemMinimumLayoutMargins];
  if (v6 != *(double *)(MEMORY[0x1E4F424F0] + 8)
    || v3 != *MEMORY[0x1E4F424F0]
    || v5 != *(double *)(MEMORY[0x1E4F424F0] + 24)
    || v4 != *(double *)(MEMORY[0x1E4F424F0] + 16))
  {
    double v10 = [(CKComposeChatController *)self navbarManager];
    double v11 = [v10 contentView];
    [v11 setNeedsLayout];
  }
}

- (id)preferredFocusEnvironments
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
  double v5 = [v4 toField];
  double v6 = [v5 textView];

  if (v6)
  {
    int v7 = [(CKComposeChatController *)self composeRecipientSelectionController];
    uint64_t v8 = [v7 toField];
    v9 = [v8 textView];
    [v3 addObject:v9];
  }
  double v10 = [(CKChatController *)self entryView];
  double v11 = [v10 contentView];
  objc_super v12 = [v11 textView];

  if (v12)
  {
    double v13 = [(CKChatController *)self entryView];
    double v14 = [v13 contentView];
    double v15 = [v14 textView];
    [v3 addObject:v15];
  }

  return v3;
}

- (void)setPrepopulatedComposition:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v5 = (CKComposition *)a3;
  if (IMOSLoggingEnabled())
  {
    double v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = @"YES";
      if (!v5) {
        int v7 = @"NO";
      }
      int v10 = 138412290;
      double v11 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Call made to pre-populate the composition. hasNonNilComposition={%@}", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v5)
  {
    uint64_t v8 = [(CKChatController *)self entryView];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      if (self->_prepopulatedComposition != v5) {
        objc_storeStrong((id *)&self->_prepopulatedComposition, a3);
      }
    }
    else
    {
      [(CKChatController *)self setComposition:v5];
    }
  }
}

- (void)setPrepopulatedRecipients:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v4 = (NSArray *)a3;
  double v5 = [(CKComposeChatController *)self composeRecipientSelectionController];

  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = v4;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Call made to pre-populate recipients (adding): %@", (uint8_t *)&v11, 0xCu);
      }
    }
    prepopulatedRecipients = [(CKComposeChatController *)self composeRecipientSelectionController];
    [prepopulatedRecipients addRecipients:v4];
    goto LABEL_13;
  }
  if (v6)
  {
    BOOL v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = v4;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Call made to pre-populate recipients (not yet ready): %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (self->_prepopulatedRecipients != v4)
  {
    int v10 = v4;
    prepopulatedRecipients = self->_prepopulatedRecipients;
    self->_prepopulatedRecipients = v10;
LABEL_13:
  }
}

- (void)setSuggestedRepliesData:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedRepliesData, a3);
  id v4 = [(CKCoreChatController *)self conversation];
  [v4 setChatBot:MEMORY[0x1E4F1CC38]];
}

- (void)setServiceId:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceId, a3);
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Got valid serviceId. Setting conversation as chatbot", v8, 2u);
      }
    }
    int v7 = [(CKCoreChatController *)self conversation];
    [v7 setChatBot:MEMORY[0x1E4F1CC38]];
  }
}

- (NSArray)proposedRecipients
{
  double v3 = [(CKComposeChatController *)self composeRecipientSelectionController];

  if (v3)
  {
    id v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
    id v5 = [v4 expandedRecipients];
  }
  else
  {
    id v5 = self->_prepopulatedRecipients;
  }

  return v5;
}

- (NSString)unatomizedRecipientText
{
  v2 = [(CKComposeChatController *)self composeRecipientSelectionController];
  double v3 = [v2 toField];
  id v4 = [v3 text];

  return (NSString *)v4;
}

- (void)conversationLeft
{
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "conversationLeft", v8, 2u);
    }
  }
  id v4 = [(CKChatController *)self composition];
  id v5 = +[CKConversationList sharedConversationList];
  int v6 = [v5 pendingConversationCreatingIfNecessary];
  [(CKChatController *)self setConversation:v6];

  if (![(CKCoreChatController *)self isSendingMessage])
  {
    int v7 = [(CKChatController *)self entryView];
    [v7 setComposition:v4];
  }
}

- (void)_setConversationDeferredSetup
{
  v41.receiver = self;
  v41.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v41 _setConversationDeferredSetup];
  double v3 = [(CKComposeChatController *)self composeRecipientSelectionController];

  if (v3) {
    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Creating composeRecipientSelection controller during _setConversationDeferredSetup", buf, 2u);
    }
  }
  id v5 = [CKComposeRecipientSelectionController alloc];
  int v6 = [(CKCoreChatController *)self conversation];
  int v7 = [(CKRecipientSelectionController *)v5 initWithConversation:v6];

  [(CKRecipientSelectionController *)v7 setDelegate:self];
  [(CKComposeChatController *)self setComposeRecipientSelectionController:v7];
  uint64_t v8 = [(CKComposeChatController *)self composeRecipientSelectionController];
  uint64_t v9 = [v8 view];
  int v10 = [(CKComposeChatController *)self view];
  [v10 bounds];
  objc_msgSend((id)v9, "setFrame:");

  int v11 = +[CKUIBehavior sharedBehaviors];
  LOBYTE(v9) = [v11 useMacToolbar];

  if (v9)
  {
    uint64_t v12 = [(CKChatController *)self macToolbarController];
    [v12 updateVirtualViewForProvider:self];
  }
  else
  {
    if ([(CKComposeChatController *)self _isBusinessConversation]) {
      goto LABEL_11;
    }
    [(CKComposeChatController *)self addChildViewController:v7];
    uint64_t v13 = [(CKComposeChatController *)self view];
    double v14 = [(CKComposeChatController *)self composeRecipientSelectionController];
    double v15 = [v14 view];
    [v13 addSubview:v15];

    uint64_t v12 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v12 didMoveToParentViewController:self];
  }

LABEL_11:
  double v16 = [(CKCoreChatController *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [(CKCoreChatController *)self delegate];
    uint64_t v19 = [v18 composeChatControllerCanEditRecipients];

    double v20 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v20 setEditable:v19];

    if (CKIsRunningInMessagesViewService())
    {
      if (v19)
      {
        if (CKIsScreenLocked()) {
          SBSRequestPasscodeUnlockUI();
        }
      }
      else
      {
        [(CKChatController *)self setTargetFirstResponder:1];
      }
    }
  }
  [(CKChatController *)self _updateEntryViewFrameIfNeeded:0];
  uint64_t v21 = [(CKComposeChatController *)self prepopulatedRecipients];

  if (v21)
  {
    objc_super v22 = [(CKComposeChatController *)self composeRecipientSelectionController];
    uint64_t v23 = [(CKComposeChatController *)self prepopulatedRecipients];
    [v22 addRecipients:v23];

    uint64_t v24 = [(CKComposeChatController *)self prepopulatedSIMID];
    double v25 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v25 setSimID:v24];
  }
  v26 = [(CKComposeChatController *)self prepopulatedComposition];

  if (v26)
  {
    uint64_t v27 = [(CKChatController *)self entryView];
    objc_super v28 = [v27 composition];
    int v29 = [v28 hasContent];

    v30 = [(CKChatController *)self entryView];
    int v31 = v30;
    if (v29)
    {
      v32 = [v30 composition];

      v33 = [v32 compositionByAppendingComposition:self->_prepopulatedComposition];
      v34 = [(CKChatController *)self entryView];
      [v34 setComposition:v33];

      int v31 = v32;
    }
    else
    {
      v33 = [(CKComposeChatController *)self prepopulatedComposition];
      [v31 setComposition:v33];
    }
  }
  [(CKComposeChatController *)self setPrepopulatedRecipients:0];
  [(CKComposeChatController *)self setPrepopulatedComposition:0];

LABEL_25:
  id v35 = +[CKUIBehavior sharedBehaviors];
  char v36 = [v35 useMacToolbar];

  if ((v36 & 1) == 0)
  {
    uint64_t v37 = [(CKComposeChatController *)self view];
    uint64_t v38 = [(CKComposeChatController *)self composeRecipientSelectionController];
    uint64_t v39 = [v38 view];
    [v37 bringSubviewToFront:v39];
  }
  [(CKComposeChatController *)self _updateBusinessInfoIfNecessary];
  [(CKComposeChatController *)self _updateSendLaterCompositionIfNecessary];
}

void __56__CKComposeChatController__setConversationDeferredSetup__block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    id v4 = [*(id *)(a1 + 32) composeRecipientSelectionController];
    [v4 setEditable:0];

    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 composeChatControllerDidCancelComposition:*(void *)(a1 + 32)];
  }
}

- (BOOL)_shouldSetToFieldAsFirstResponder
{
  double v3 = [(CKComposeChatController *)self composeRecipientSelectionController];
  if ([v3 isEditable])
  {
    id v4 = [(CKComposeChatController *)self proposedRecipients];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_updateSendingIdentity
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKCoreChatController *)self conversation];
  id v4 = [v3 sendingService];

  BOOL v5 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  int v6 = objc_msgSend(v5, "__ck_defaultAccountForService:", v4);

  int v7 = [(CKComposeChatController *)self composeRecipientSelectionController];
  uint64_t v8 = [v7 selectedLastAddressedOrDefaultHandle];

  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      uint64_t v30 = (uint64_t)v8;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "_updateSendingIdentity selectedLastAddressedHandle: %@", (uint8_t *)&v29, 0xCu);
    }
  }
  if ([(CKComposeChatController *)self _deviceHasMultipleActiveSubscriptions])
  {
    int v10 = [(CKComposeChatController *)self composeRecipientSelectionController];
    int v11 = [v10 selectedSubscriptionContext];
    uint64_t v12 = [v11 labelID];

    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v29 = 138412290;
        uint64_t v30 = (uint64_t)v12;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Sending composition with simID: %@", (uint8_t *)&v29, 0xCu);
      }
    }
    [(CKComposeChatController *)self setLastAddressedSIMID:v12];
    if (v8 && (IMStringIsEmail() & 1) != 0
      || ([v6 serviceName],
          double v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 isEqualToString:*MEMORY[0x1E4F6E1B0]],
          v14,
          (v15 & 1) != 0))
    {
      double v16 = [(CKComposeChatController *)self composeRecipientSelectionController];
      int v17 = [v16 hasiMessageableContext];

      if (v17)
      {
        [(CKComposeChatController *)self setLastAddressedHandle:v8];
        v18 = [MEMORY[0x1E4F6BBD8] sharedInstance];
        uint64_t v19 = [(CKComposeChatController *)self lastAddressedHandle];
        double v20 = [(CKComposeChatController *)self lastAddressedSIMID];
        uint64_t v21 = [v18 iMessageAccountForLastAddressedHandle:v19 simID:v20];

        if (IMOSLoggingEnabled())
        {
          objc_super v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            id v23 = [(CKComposeChatController *)self lastAddressedHandle];
            uint64_t v24 = [(CKComposeChatController *)self lastAddressedSIMID];
            int v29 = 138412802;
            uint64_t v30 = (uint64_t)v8;
            __int16 v31 = 2112;
            id v32 = v23;
            __int16 v33 = 2112;
            v34 = v24;
            _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Selected last addressed handle is iMessage capable %@ and at least one context is iMessage-capable, so pick the account corresponding to last addressed handle %@ and simID %@", (uint8_t *)&v29, 0x20u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          double v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            int v29 = 138412290;
            uint64_t v30 = v21;
            _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Account picked %@", (uint8_t *)&v29, 0xCu);
          }
        }
        int v6 = (void *)v21;
      }
    }
    else
    {
      [(CKComposeChatController *)self setLastAddressedHandle:v8];
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = [(CKComposeChatController *)self lastAddressedHandle];
          int v29 = 138412290;
          uint64_t v30 = (uint64_t)v27;
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Sending SMS composition with last addressed handle %@", (uint8_t *)&v29, 0xCu);
        }
      }
    }
  }

  return v6;
}

- (void)sendComposition:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  int v59 = self;
  id v4 = [(CKCoreChatController *)self conversation];
  uint64_t v5 = [v4 recipientCount];

  if (v5)
  {
    int v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v6 stopCheckingRecipientAvailabilityAndRemoveAllTimers];

    int v7 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v7 setSearchResultsHidden:1];

    uint64_t v8 = [(CKComposeChatController *)self _updateSendingIdentity];
    if (!v8)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Cannot send composition to conversation with no account.", buf, 2u);
        }
      }
      goto LABEL_50;
    }
    uint64_t v9 = [(CKComposeChatController *)self composeRecipientSelectionController];
    id v57 = [v9 selectedSubscriptionContext];

    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(CKComposeChatController *)self lastAddressedHandle];
        id v12 = [(CKComposeChatController *)self lastAddressedSIMID];
        uint64_t v13 = [(CKCoreChatController *)self conversation];
        *(_DWORD *)buf = 138413314;
        long long v73 = v8;
        __int16 v74 = 2112;
        id v75 = v11;
        __int16 v76 = 2112;
        id v77 = v12;
        __int16 v78 = 2112;
        v79 = v57;
        __int16 v80 = 2112;
        uint64_t v81 = v13;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Sending composition with account: %@ lastAddressedHandle: %@ lastAddressedSIMID: %@ subscription: %@ conversation: %@", buf, 0x34u);
      }
    }
    BOOL v14 = [(CKComposeChatController *)self ignoreEmailsWhenSending];
    char v15 = [(CKCoreChatController *)self conversation];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v17 = [(CKCoreChatController *)self conversation];
      char v18 = [v17 pendingChat];
    }
    else
    {
      char v18 = 0;
    }
    objc_super v22 = [(CKComposeChatController *)self composeRecipientSelectionController];
    id v23 = [v22 gameCenterPickerBlock];

    if ((v23 != 0 || v14) | v18 & 1
      || ([(CKCoreChatController *)self conversation],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          [v24 chat],
          double v25 = objc_claimAutoreleasedReturnValue(),
          BOOL v26 = v25 == 0,
          v25,
          v24,
          v26))
    {
      objc_super v28 = [(CKComposeChatController *)v59 composeRecipientSelectionController];
      int v29 = [v28 expandedRecipients];

      uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v29, "count"));
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v31 = v29;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:v71 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v68 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v35 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            if ([v35 kind] != 5 || v23 == 0)
            {
              uint64_t v37 = [v35 rawAddress];
              uint64_t v38 = IMStripFormattingFromAddress();

              if (v38 && (!v14 || (IMStringIsEmail() & 1) == 0))
              {
                uint64_t v39 = [v8 imHandleWithID:v38 alreadyCanonical:0];
                if (v39) {
                  [v30 addObject:v39];
                }
              }
            }
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:v71 count:16];
        }
        while (v32);
      }
      BOOL v40 = v23 != 0;

      BOOL v27 = [v30 count] != 0;
      objc_super v41 = +[CKConversationList sharedConversationList];
      id v42 = [(CKComposeChatController *)v59 lastAddressedHandle];
      v43 = [(CKComposeChatController *)v59 lastAddressedSIMID];
      LOBYTE(v56) = 1;
      v44 = [v41 conversationForHandles:v30 displayName:0 lastAddressedHandle:v42 lastAddressedSIMID:v43 joinedChatsOnly:1 findMatchingNamedGroups:0 create:v56];

      [(CKChatController *)v59 setConversation:v44];
      v45 = [(CKCoreChatController *)v59 delegate];
      [v45 composeChatController:v59 didSelectNewConversation:v44];

      if (v40)
      {
        v46 = [(CKCoreChatController *)v59 conversation];
        BOOL v47 = v46 == 0;

        v48 = v59;
        if (v47) {
          goto LABEL_48;
        }
        goto LABEL_43;
      }
    }
    else
    {
      BOOL v27 = 1;
    }
    v48 = v59;
LABEL_43:
    v49 = [(CKCoreChatController *)v48 inputController];
    [v49 requestPhotoBrowserToPrepareForDraftClearingPhotoShelfViewController:0];

    if ([(CKChatController *)v59 showSendAlertIfNecessaryForComposition:v58])
    {
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CKComposeChatController_sendComposition___block_invoke;
    aBlock[3] = &unk_1E5627180;
    id v63 = v58;
    id v64 = v59;
    BOOL v66 = v27;
    id v65 = v8;
    v50 = _Block_copy(aBlock);
    v51 = v50;
    if (v14)
    {
      v52 = [(CKCoreChatController *)v59 conversation];
      [v52 refreshServiceForSending];

      dispatch_time_t v53 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__CKComposeChatController_sendComposition___block_invoke_197;
      block[3] = &unk_1E5622330;
      block[4] = v59;
      id v61 = v51;
      dispatch_after(v53, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(void *))v50 + 2))(v50);
    }

LABEL_48:
    v54 = +[CKDraftManager sharedInstance];
    [v54 setDraftForPendingConversation:0 withRecipients:0];

    v55 = +[CKDraftManager sharedInstance];
    [v55 saveCompositionAndFlushCache:0];

    goto LABEL_49;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      double v20 = [(CKCoreChatController *)self conversation];
      *(_DWORD *)buf = 138412290;
      long long v73 = v20;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Cannot send composition to conversation with no recipients: %@", buf, 0xCu);
    }
  }
LABEL_51:
}

void __43__CKComposeChatController_sendComposition___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__CKComposeChatController_sendComposition___block_invoke_2;
  aBlock[3] = &unk_1E5620AF8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = v2;
  uint64_t v9 = v3;
  id v4 = _Block_copy(aBlock);
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 40) _determineSpamFilterHandshakeStateForAccount:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _prepareForSendFromCardIfNecessaryAndSend:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Can not send the message because we have no valid handles to send to.", v6, 2u);
    }
  }
}

void __43__CKComposeChatController_sendComposition___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) shelfPluginPayload];
  if ([*(id *)(a1 + 32) compositionIsCollaboration])
  {
    if ([*(id *)(a1 + 40) shareWasCreated])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      v22.receiver = *(id *)(a1 + 40);
      v22.super_class = (Class)CKComposeChatController;
      objc_msgSendSuper2(&v22, sel_sendComposition_, v3);
      [*(id *)(a1 + 40) setShareWasCreated:0];
    }
    else
    {
      [*(id *)(a1 + 40) enableSendButtonSpinner];
      uint64_t v14 = *(void *)(a1 + 32);
      v21.receiver = *(id *)(a1 + 40);
      v21.super_class = (Class)CKComposeChatController;
      objc_msgSendSuper2(&v21, sel_sendCompositionForCollaboration_collaborationType_completion_, v14, [v2 payloadCollaborationType], 0);
    }
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
    if ([v2 sendAsCopy])
    {
      uint64_t v5 = [v2 sendAsCopyURL];

      if (v5)
      {
        int v6 = [v2 sendAsCopyURL];
        [v2 setUrl:v6];

        int v7 = [CKComposition alloc];
        id v8 = [*(id *)(a1 + 32) text];
        uint64_t v9 = [*(id *)(a1 + 32) subject];
        int v10 = [*(id *)(a1 + 32) bizIntent];
        id v11 = [*(id *)(a1 + 32) shelfMediaObject];
        id v12 = [*(id *)(a1 + 32) proofreadingInfo];
        uint64_t v13 = [(CKComposition *)v7 initWithText:v8 subject:v9 shelfPluginPayload:v2 bizIntent:v10 shelfMediaObject:v11 proofreadingInfo:v12];

        id v4 = (id)v13;
      }
    }
    v20.receiver = *(id *)(a1 + 40);
    v20.super_class = (Class)CKComposeChatController;
    objc_msgSendSuper2(&v20, sel_sendComposition_, v4);
  }
  char v15 = *(void **)(a1 + 40);
  double v16 = [v15 conversation];
  [v15 addBizIntentToConversation:v16];

  [*(id *)(a1 + 40) setSendingComposition:1];
  int v17 = [*(id *)(a1 + 40) businessInfoView];
  char v18 = [v17 superview];

  if (v18)
  {
    uint64_t v19 = [*(id *)(a1 + 40) businessInfoView];
    [v19 removeFromSuperview];
  }
}

void __43__CKComposeChatController_sendComposition___block_invoke_197(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  uint64_t v3 = [v2 chat];
  id v4 = [v3 account];
  uint64_t v5 = [v4 service];

  int v6 = [MEMORY[0x1E4F6BDC0] iMessageService];

  int v7 = IMOSLoggingEnabled();
  if (v5 == v6)
  {
    if (v7)
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Cache hit after removing emails from conversation, send now", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Waiting for registration check before sending", v11, 2u);
      }
    }
    dispatch_time_t v9 = dispatch_time(0, 4000000000);
    dispatch_after(v9, MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)_determineSpamFilterHandshakeStateForAccount:(id)a3
{
  id v18 = a3;
  if ([MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled])
  {
    id v4 = [(CKCoreChatController *)self conversation];
    uint64_t v5 = [v4 chat];
    char v6 = [v5 repliedToChat];

    int v7 = [(CKCoreChatController *)self conversation];
    id v8 = [v7 chat];
    char v9 = [v8 receivedResponseForChat];

    if ((v6 & 1) == 0 && (v9 & 1) == 0)
    {
      int v10 = [v18 serviceName];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6E1A0]];

      if (v11)
      {
        id v12 = [(CKCoreChatController *)self conversation];
        uint64_t v13 = [v12 chat];
        uint64_t v14 = [v13 participants];
        char v15 = objc_msgSend(v14, "__imArrayByApplyingBlock:", &__block_literal_global_143);

        [MEMORY[0x1E4F6EA38] participantsAreiMessagable:v15 completionBlock:&__block_literal_global_204_0];
      }
      else
      {
        double v16 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v16 trackSpamEvent:1];

        char v15 = [(CKCoreChatController *)self conversation];
        int v17 = [v15 chat];
        [v17 setValue:&unk_1EDF16778 forChatProperty:*MEMORY[0x1E4F6BE50]];
      }
    }
  }
}

id __72__CKComposeChatController__determineSpamFilterHandshakeStateForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ID];
  uint64_t v3 = IMChatCanonicalIDSIDsForAddress();

  return v3;
}

void __72__CKComposeChatController__determineSpamFilterHandshakeStateForAccount___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v2 trackSpamEvent:1];
  }
}

- (void)_prepareForSendFromCardIfNecessaryAndSend:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(CKChatController *)self dismissEffectPickerAnimated:1];
  uint64_t v5 = [(CKChatController *)self _currentPresentationController];
  if ([(CKCoreChatController *)self shouldDismissAfterSend]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "Not sending in a sheet, sending normally!", buf, 2u);
      }
    }
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Preparing to transition from sheet->fullscreen", buf, 2u);
      }
    }
    int v7 = [(CKCoreChatController *)self collectionViewController];
    [v7 setTransitioningFromComposing:1];

    [(CKComposeChatController *)self setSendingViaCardUI:1];
    id v8 = v5;
    char v9 = +[CKUIBehavior sharedBehaviors];
    [v9 sendAnimationDuration];
    double v11 = v10;

    id v12 = [v8 containerView];
    _UISheetMinimumTopInset();
    double v14 = v13;

    char v15 = [(CKChatController *)self collectionView];
    [v15 beginDisablingTranscriptDynamicsForReason:@"NewComposeTransition"];
    double v16 = [(CKChatController *)self collectionView];
    [v16 contentOffset];
    double v18 = v17;
    double v20 = v19;

    objc_super v21 = [v8 containerView];
    [v21 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    uint64_t v30 = [(CKChatController *)self collectionView];
    [v30 setAutoresizingMask:0];

    id v31 = [(CKChatController *)self collectionView];
    objc_msgSend(v31, "setFrame:", v23, v25 - v14, v27, v29);

    uint64_t v32 = [(CKChatController *)self collectionView];
    objc_msgSend(v32, "setContentOffset:", v18, v20 - v14);

    uint64_t v33 = [(CKChatController *)self collectionView];
    [v33 layoutIfNeeded];

    v34 = (void *)MEMORY[0x1E4F42FF0];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke;
    v45[3] = &unk_1E5620AF8;
    id v35 = v8;
    id v46 = v35;
    BOOL v47 = self;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_2;
    v43[3] = &unk_1E5620BF0;
    id v36 = v15;
    id v44 = v36;
    [v34 animateWithDuration:v45 animations:v43 completion:v11];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_3;
    v42[3] = &unk_1E5620C40;
    v42[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v42 animations:v11 * 0.5];
    uint64_t v37 = [(CKCoreChatController *)self delegate];
    uint64_t v38 = [v37 composeChatControllerShouldShowBackButtonViewDuringSendAnimation:self];

    uint64_t v39 = [(CKComposeChatController *)self navbarManager];
    BOOL v40 = [(CKCoreChatController *)self conversation];
    [v39 commitTransitionAnimationWithConversation:v40 shouldShowBackButtonView:v38];

    if (v4) {
      v4[2](v4);
    }
  }
}

void __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setWantsFullScreen:", objc_msgSend(*(id *)(a1 + 32), "_wantsFullScreen") ^ 1);
  id v2 = [*(id *)(a1 + 32) containerView];
  [v2 layoutIfNeeded];

  uint64_t v3 = [*(id *)(a1 + 32) containerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [*(id *)(a1 + 40) collectionView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

uint64_t __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endDisablingTranscriptDynamicsForReason:@"NewComposeTransition"];
}

void __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) composeRecipientSelectionController];
  id v2 = [v1 view];

  [v2 setAlpha:0.0];
}

- (void)invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:(id)a3
{
  id v4 = a3;
  double v5 = [(CKComposeChatController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v19 = [(CKCoreChatController *)self collectionViewController];
    [v19 balloonMaxWidth];
    double v9 = v8;
    [v19 marginInsets];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [(CKComposeChatController *)self traitCollection];
    objc_msgSend(v19, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v18, v9, v11, v13, v15, v17);
  }
}

- (void)addBizIntentToConversation:(id)a3
{
  id v4 = a3;
  double v5 = [(CKComposeChatController *)self bizIntent];

  if (v5)
  {
    [(CKComposeChatController *)self _processBizIntentIfNeeded];
    uint64_t v6 = [(CKComposeChatController *)self bizIntent];
    uint64_t v7 = [v4 chat];
    [v7 setBizIntent:v6];

    [(CKComposeChatController *)self setBizIntent:0];
  }
}

- (void)_processBizIntentIfNeeded
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKComposeChatController *)self bizIntent];
  if (v3)
  {
    BOOL v4 = [(CKComposeChatController *)self _isAllowlistedBusinessRecipient];

    if (v4)
    {
      double v5 = [(CKComposeChatController *)self bizIntent];
      uint64_t v6 = [v5 objectForKeyedSubscript:@"biz-intent-id"];
      uint64_t v7 = [v6 dataUsingEncoding:4];

      if (v7)
      {
        id v44 = 0;
        double v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v44];
        id v9 = v44;
        double v10 = (void *)[v8 mutableCopy];

        if (v9)
        {
          if (IMOSLoggingEnabled())
          {
            double v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              double v12 = [(CKComposeChatController *)self bizIntent];
              *(_DWORD *)buf = 138412546;
              v48 = v12;
              __int16 v49 = 2112;
              id v50 = v9;
              _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Fail to decode JSON bizIntent biz-intent-id [%@] due to error [%@]", buf, 0x16u);
            }
          }
        }
        else
        {
          double v15 = [v10 objectForKeyedSubscript:@"authBag"];
          double v16 = [v15 dataUsingEncoding:4];

          if (v16)
          {
            id v43 = 0;
            double v17 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v16 options:0 error:&v43];
            id v9 = v43;
            double v18 = (void *)[v17 mutableCopy];

            if (v9)
            {
              if (IMOSLoggingEnabled())
              {
                id v19 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  double v20 = [(CKComposeChatController *)self bizIntent];
                  objc_super v21 = [v20 objectForKeyedSubscript:@"authBag"];
                  *(_DWORD *)buf = 138412546;
                  v48 = v21;
                  __int16 v49 = 2112;
                  id v50 = v9;
                  _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Fail to decode JSON bizIntent authBag [%@] due to error [%@]", buf, 0x16u);
                }
              }
            }
            else
            {
              double v23 = [(CKComposeChatController *)self _anisetteData];
              double v24 = v23;
              if (v23)
              {
                double v25 = [v23 oneTimePassword];
                [v18 setObject:v25 forKeyedSubscript:@"X-Apple-I-MD"];
              }
              id v42 = 0;
              BOOL v40 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v18 options:0 error:&v42];
              id v26 = v42;
              if (v26)
              {
                id v9 = v26;
                if (IMOSLoggingEnabled())
                {
                  double v27 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v48 = v18;
                    __int16 v49 = 2112;
                    id v50 = v9;
                    _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Fail to serialize processed authBag [%@] due to error [%@]", buf, 0x16u);
                  }
                }
              }
              else
              {
                uint64_t v39 = (void *)[[NSString alloc] initWithData:v40 encoding:4];
                [v10 setObject:v39 forKeyedSubscript:@"authBag"];
                id v41 = 0;
                uint64_t v38 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:&v41];
                id v9 = v41;
                if (v9)
                {
                  if (IMOSLoggingEnabled())
                  {
                    double v28 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v48 = v10;
                      __int16 v49 = 2112;
                      id v50 = v9;
                      _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Fail to serialize processed biz-intent-id [%@] due to error [%@]", buf, 0x16u);
                    }
                  }
                }
                else
                {
                  uint64_t v37 = (void *)[[NSString alloc] initWithData:v38 encoding:4];
                  v45[0] = @"biz-group-id";
                  double v29 = [(CKComposeChatController *)self bizIntent];
                  uint64_t v30 = [v29 objectForKeyedSubscript:@"biz-group-id"];
                  v45[1] = @"biz-intent-id";
                  v46[0] = v30;
                  v46[1] = v37;
                  id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

                  id v31 = [(CKComposeChatController *)self bizIntent];
                  uint64_t v32 = [v31 objectForKeyedSubscript:@"biz-greeting-txt"];

                  if (v32)
                  {
                    uint64_t v33 = (void *)[v36 mutableCopy];
                    v34 = [(CKComposeChatController *)self bizIntent];
                    id v35 = [v34 objectForKeyedSubscript:@"biz-greeting-txt"];
                    [v33 setObject:v35 forKeyedSubscript:@"biz-greeting-txt"];
                  }
                  else
                  {
                    uint64_t v33 = v36;
                  }
                  [(CKComposeChatController *)self setBizIntent:v33];
                }
              }
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              double v22 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v10;
                _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Fail to decode authBag from biz-intent-id [%@]", buf, 0xCu);
              }
            }
            id v9 = 0;
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        double v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          double v14 = [(CKComposeChatController *)self bizIntent];
          *(_DWORD *)buf = 138412290;
          v48 = v14;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Fail to decode biz-intent-id from [%@]", buf, 0xCu);
        }
      }
    }
  }
}

- (BOOL)_isAllowlistedBusinessRecipient
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKComposeChatController *)self prepopulatedRecipients];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v5 = [(CKComposeChatController *)self prepopulatedRecipients];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v10 = [v9 address];
          double v11 = [v9 handle];
          int v12 = [v11 isBusiness];

          if (v12)
          {
            double v13 = IMSharedHelperBusinessAllowlist();
            char v14 = [v13 containsObject:v10];

            if (v14)
            {

              LOBYTE(v6) = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)_anisetteData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (objc_class *)MEMORY[0x192FBA860](@"AKAnisetteProvisioningController", @"AuthKit");
  if (v2)
  {
    id v3 = objc_alloc_init(v2);
    id v9 = 0;
    uint64_t v4 = [v3 anisetteDataWithError:&v9];
    id v5 = v9;
    if (v5 && IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "CKComposeChatController: Failed fetching anisette data with error [%@]", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "CKComposeChatController: Failed linking Accounts - AKAnisetteProvisioningController", buf, 2u);
      }
    }
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)stageSuggestedReplies
{
  id v3 = [(CKComposeChatController *)self suggestedRepliesData];

  if (!v3) {
    return;
  }
  uint64_t v4 = [(CKCoreChatController *)self conversation];
  id v5 = [v4 chat];

  if (!v5)
  {
    id v17 = [(CKComposeChatController *)self _updateSendingIdentity];
    uint64_t v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
    uint64_t v7 = [v6 expandedRecipients];

    if ([v7 count] != 1)
    {

      goto LABEL_11;
    }
    double v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = [v8 rawAddress];
    double v10 = IMStripFormattingFromAddress();

    if (v10)
    {
      id v11 = [v17 imHandleWithID:v10 alreadyCanonical:0];
      uint64_t v12 = +[CKPendingConversation pendingConversationForHandle:v11];
      [(CKChatController *)self setConversation:v12];
      double v13 = [(CKCoreChatController *)self delegate];
      [v13 composeChatController:self didSelectNewConversation:v12];
    }
  }
  char v14 = [(CKCoreChatController *)self conversation];
  id v17 = [v14 chat];

  double v15 = v17;
  if (v17)
  {
    long long v16 = [(CKComposeChatController *)self suggestedRepliesData];
    [v17 setSuggestedRepliesData:v16];

    [v17 reloadChatItemsForSuggestedRepliesChange];
    [(CKComposeChatController *)self setSuggestedRepliesData:0];
LABEL_11:
    double v15 = v17;
  }
}

- (id)outgoingComposeViewForSendAnimation
{
  id v2 = [(CKComposeChatController *)self composeRecipientSelectionController];
  id v3 = [v2 toFieldContainerView];

  return v3;
}

- (BOOL)isSafeToMarkAsRead
{
  v7.receiver = self;
  v7.super_class = (Class)CKComposeChatController;
  unsigned int v3 = [(CKChatController *)&v7 isSafeToMarkAsRead];
  uint64_t v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
  int v5 = v3 & [v4 isSearchResultsHidden];

  return v5;
}

- (double)topInsetPadding
{
  unsigned int v3 = [(CKComposeChatController *)self composeRecipientSelectionController];

  double v4 = 0.0;
  if (![(CKChatController *)self isAnimatingMessageSend]
    && v3
    && !CKIsRunningInMacCatalyst())
  {
    int v5 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v5 collapsedHeight];
    double v7 = v6;

    double v8 = [(CKComposeChatController *)self composeRecipientSelectionController];
    [v8 fromFieldHeight];
    double v4 = v7 + v9;
  }
  return v4;
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = a3;
  if (![(CKComposeChatController *)self ignoreKeyboardNotifications])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKComposeChatController;
    [(CKChatController *)&v5 keyboardWillHide:v4];
  }
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  if (![(CKComposeChatController *)self ignoreKeyboardNotifications])
  {
    v6.receiver = self;
    v6.super_class = (Class)CKComposeChatController;
    [(CKChatController *)&v6 keyboardWillShow:v4];
    objc_super v5 = [(CKChatController *)self entryView];
    [v5 setNeedsLayout];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(CKCoreChatController *)self inputController];
  [v7 setPreventResignFirstResponder:1];

  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v8 dismissViewControllerAnimated:v4 completion:v6];
}

- (UIEdgeInsets)macToolbarInsets
{
  unsigned int v3 = (double *)MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  double v7 = +[CKUIBehavior sharedBehaviors];
  int v8 = [v7 useMacToolbar];

  if (v8)
  {
    [(CKChatController *)self preferredMacToolbarHeight];
    double v10 = v9;
    id v11 = +[CKUIBehavior sharedBehaviors];
    [v11 macAppKitToolbarHeight];
    if (v10 > v12)
    {
      [(CKChatController *)self preferredMacToolbarHeight];
      double v15 = v16;
    }
    else
    {
      double v13 = +[CKUIBehavior sharedBehaviors];
      [v13 macAppKitToolbarHeight];
      double v15 = v14;
    }
  }
  else
  {
    double v15 = *v3;
  }
  double v17 = v15;
  double v18 = v4;
  double v19 = v5;
  double v20 = v6;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)_updateTitleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CKComposeChatController *)self sendingViaCardUI]
    && !CKIsRunningInMacCatalyst())
  {
    if (self->_overrideTitle
      && ([(CKComposeChatController *)self navbarManager],
          double v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v20 = [(CKComposeChatController *)self navbarManager];
      [v20 updateTitle:self->_overrideTitle animated:0];
    }
    else
    {
      double v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
      double v7 = [v6 expandedRecipients];

      int v8 = [(CKChatController *)self entryView];
      double v9 = [v8 composition];

      double v10 = [v9 mediaObjects];
      id v11 = [v9 subject];
      double v12 = [v11 string];

      if (![v7 count]) {
        goto LABEL_9;
      }
      double v13 = [(CKCoreChatController *)self conversation];
      double v14 = [(CKCoreChatController *)self conversation];
      double v15 = [v14 sendingService];
      id v20 = [v13 _headerTitleForPendingMediaObjects:v10 subject:v12 onService:v15];

      if (!v20)
      {
LABEL_9:
        double v16 = CKFrameworkBundle();
        id v20 = [v16 localizedStringForKey:@"NEW_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      double v17 = [(CKComposeChatController *)self navbarManager];

      if (v17)
      {
        double v18 = [(CKComposeChatController *)self navbarManager];
        [v18 updateTitle:v20 animated:v3];
      }
      else
      {
        double v19 = [(CKComposeChatController *)self navigationItem];
        double v18 = v19;
        if (v3) {
          [v19 _setTitle:v20 animated:1 matchBarButtonItemAnimationDuration:1];
        }
        else {
          [v19 setTitle:v20];
        }
      }
    }
  }
}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (BOOL)transcriptCollectionViewControllerShouldForceOpaqueMask:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3
{
  return 0;
}

- (BOOL)shouldUseMacRecipientsView
{
  return 0;
}

- (void)_configureTitleView
{
  v23[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKComposeChatController *)self navbarManager];
  double v4 = [v3 contentView];

  if (v4)
  {
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v6 = v5;
    double v7 = objc_opt_new();
    [v7 setHideTrailingBarButtons:1];
    [v7 setHideStandardTitle:1];
    [v7 setHideLeadingBarButtons:1];
    [v7 setHideBackButton:1];
    [v7 setHeight:v6];
    [v7 addSubview:v4];
    int v8 = [(CKComposeChatController *)self navigationItem];
    [v8 setTitleView:v7];

    double v17 = (void *)MEMORY[0x1E4F28DC8];
    double v22 = [v4 leadingAnchor];
    uint64_t v21 = [v7 leadingAnchor];
    id v20 = [v22 constraintEqualToAnchor:v21];
    v23[0] = v20;
    double v19 = [v4 trailingAnchor];
    double v18 = [v7 trailingAnchor];
    double v9 = [v19 constraintEqualToAnchor:v18];
    v23[1] = v9;
    double v10 = [v4 topAnchor];
    id v11 = [v7 topAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11];
    v23[2] = v12;
    double v13 = [v4 bottomAnchor];
    double v14 = [v7 bottomAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    v23[3] = v15;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v17 activateConstraints:v16];
  }
}

- (BOOL)shouldUseNavigationBarCanvasView
{
  return 0;
}

- (void)navbarManagerIsAnimatingNavbarTransition:(id)a3
{
  double v4 = [(CKComposeChatController *)self navigationItem];
  double v5 = [v4 titleView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [(CKComposeChatController *)self navigationItem];
    id v16 = [v6 titleView];
  }
  else
  {
    id v16 = 0;
  }

  double v7 = [(CKComposeChatController *)self navbarManager];
  int v8 = [v7 contentView];

  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [v16 setHeight:v9];
  double v10 = [(CKComposeChatController *)self navigationController];
  id v11 = [v10 navigationBar];
  double v12 = [v11 superview];
  [v12 setNeedsLayout];

  double v13 = [(CKComposeChatController *)self navigationController];
  double v14 = [v13 navigationBar];
  double v15 = [v14 superview];
  [v15 layoutIfNeeded];
}

- (BOOL)shouldShowComposeCancelItem
{
  return CKIsRunningInMacCatalyst() == 0;
}

- (void)_updateNavigationButtons
{
  if ([(CKComposeChatController *)self shouldShowComposeCancelItem])
  {
    id v4 = [(CKComposeChatController *)self composeCancelItem];
    objc_msgSend(v4, "setEnabled:", -[CKCoreChatController isSendingMessage](self, "isSendingMessage") ^ 1);
    BOOL v3 = [(CKComposeChatController *)self navigationItem];
    [v3 setRightBarButtonItem:v4];
  }
}

- (UIBarButtonItem)composeCancelItem
{
  composeCancelItem = self->_composeCancelItem;
  if (!composeCancelItem)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F427C0]);
    double v5 = CKFrameworkBundle();
    double v6 = [v5 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 style:1 target:self action:sel_cancelButtonTapped];
    int v8 = self->_composeCancelItem;
    self->_composeCancelItem = v7;

    composeCancelItem = self->_composeCancelItem;
  }

  return composeCancelItem;
}

- (void)cancelCompose
{
  [(CKComposeChatController *)self setNewComposeCancelled:1];
  BOOL v3 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v3 stopCheckingRecipientAvailabilityAndRemoveAllTimers];

  id v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v4 setSearchResultsHidden:1];

  [(CKChatController *)self setTargetFirstResponder:0];
  uint64_t v5 = [(CKChatController *)self splitViewController];
  if (!v5
    || (double v6 = (void *)v5,
        [(CKChatController *)self splitViewController],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isCollapsed],
        v7,
        v6,
        v8))
  {
    [(CKChatController *)self dismissKeyboard];
    [(CKComposeChatController *)self reloadInputViews];
  }
  double v9 = [(CKCoreChatController *)self inputController];
  [v9 requestPhotoBrowserToUnstageAllImages];

  id v10 = [(CKCoreChatController *)self delegate];
  [v10 composeChatControllerDidCancelComposition:self];
}

- (BOOL)shouldShowEntryView
{
  v10.receiver = self;
  v10.super_class = (Class)CKComposeChatController;
  if ([(CKChatController *)&v10 shouldShowEntryView])
  {
    if (![(CKComposeChatController *)self newComposeCancelled])
    {
      double v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
      char v7 = [v6 isSearchResultsHidden];

      if (v7)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      int v3 = IMOSLoggingEnabled();
      if (!v3) {
        return v3;
      }
      id v4 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      *(_WORD *)double v9 = 0;
      uint64_t v5 = "Not showing entry view because recipient search results are visible";
      goto LABEL_9;
    }
    int v3 = IMOSLoggingEnabled();
    if (v3)
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v9 = 0;
        uint64_t v5 = "Not showing entry view because new compose is cancelled";
LABEL_9:
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, v5, v9, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    int v3 = IMOSLoggingEnabled();
    if (v3)
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v9 = 0;
        uint64_t v5 = "Not showing entry view because super.shouldShowEntryView is false";
        goto LABEL_9;
      }
LABEL_10:

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)entryViewRequiresCollectionView
{
  return 0;
}

- (id)inputAccessoryViewController
{
  if (CKInputAccessoryViewControllerEnabled()
    && [(CKComposeChatController *)self shouldShowEntryView])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKComposeChatController;
    int v3 = [(CKChatController *)&v5 inputAccessoryViewController];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (id)inputAccessoryView
{
  if (CKInputAccessoryViewControllerEnabled()
    || ![(CKComposeChatController *)self shouldShowEntryView])
  {
    int v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKComposeChatController;
    int v3 = [(CKChatController *)&v5 inputAccessoryView];
  }

  return v3;
}

- (double)_entryViewTopInsetPadding
{
  int v3 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v3 collapsedHeight];
  double v5 = v4;

  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    double v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
    char v7 = [v6 fromFieldContainerView];
    char v8 = [v7 isHidden];

    if ((v8 & 1) == 0)
    {
      double v9 = [(CKComposeChatController *)self composeRecipientSelectionController];
      objc_super v10 = [v9 fromFieldContainerView];
      [v10 frame];
      double v12 = v11;

      return v5 + v12 + 2.0;
    }
  }
  return v5;
}

- (void)reloadEntryViewIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      double v13 = "-[CKComposeChatController reloadEntryViewIfNeeded]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", buf, 0xCu);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v11 reloadEntryViewIfNeeded];
  double v4 = [CKMentionsController alloc];
  double v5 = [(CKChatController *)self entryView];
  double v6 = [v5 contentView];
  char v7 = [v6 textView];
  char v8 = [(CKCoreChatController *)self conversation];
  double v9 = [(CKMentionsController *)v4 initWithEntryTextView:v7 conversation:v8];
  [(CKChatController *)self setMentionsController:v9];

  [(CKComposeChatController *)self _reloadMentionsData];
  objc_super v10 = [(CKChatController *)self entryView];
  if (v10)
  {
    objc_msgSend(v10, "setComposingRecipient:", -[CKComposeChatController isComposingRecipient](self, "isComposingRecipient"));
    objc_msgSend(v10, "setFailedRecipients:", -[CKComposeChatController hasFailedRecipients](self, "hasFailedRecipients"));
    objc_msgSend(v10, "setUnreachableEmergencyRecipient:", -[CKComposeChatController hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient"));
  }
}

- (BOOL)reloadEntryViewForStagedPluginMessage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = [(CKChatController *)self entryView];
  double v4 = [v3 composition];
  double v5 = [v4 shelfPluginPayload];
  double v6 = [v5 pluginBundleID];

  if (![v6 length]) {
    goto LABEL_12;
  }
  char v7 = IMBalloonExtensionIDWithSuffix();
  if (([v6 isEqualToString:v7] & 1) == 0)
  {

    goto LABEL_12;
  }
  BOOL v8 = [(CKComposeChatController *)self recipientsListChanged];

  if (!v8)
  {
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    double v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [(CKComposeChatController *)self recipientsListChanged];
      objc_super v11 = "NO";
      if (v10) {
        objc_super v11 = "YES";
      }
      int v14 = 136315138;
      double v15 = v11;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Triggering an entry view reload since Check-in Message is staged in new compose, recipientsListChanged, %s", (uint8_t *)&v14, 0xCu);
    }
  }
  [(CKComposeChatController *)self setRecipientsListChanged:0];
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (BOOL)_shouldValidatePayloadBeforeSendingPayload:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 requiresValidation];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)messageEntryViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v9 messageEntryViewDidChange:a3 isTextChange:a4 isShelfChange:a5];
  [(CKComposeChatController *)self _updateTitleAnimated:1];
  double v6 = [(CKChatController *)self _currentPresentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v8 = [(CKChatController *)self composition];
    -[CKComposeChatController setModalInPresentation:](self, "setModalInPresentation:", [v8 hasContent]);
  }
}

- (void)messageEntryViewSendButtonHit:(id)a3
{
  id v4 = a3;
  double v5 = [(CKChatController *)self effectPickerWindow];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        char v7 = "Effect picker window is not nil. Return.";
LABEL_9:
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else if ([(CKCoreChatController *)self isSendingMessage])
  {
    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        char v7 = "isSendingMessage. Return.";
        goto LABEL_9;
      }
LABEL_10:
    }
  }
  else
  {
    BOOL v8 = [(CKComposeChatController *)self composeRecipientSelectionController];
    char v9 = [v8 allowedByScreenTime];

    if (v9)
    {
      BOOL v10 = +[CKAdaptivePresentationController sharedInstance];
      [v10 dismissViewControllerAnimated:1 completion:0];

      objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:self selector:sel__passKitUIDismissed_ name:@"CKPluginExtensionStateObserverPassKitUIDismissed" object:0];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke;
      v13[3] = &unk_1E5622818;
      v13[4] = self;
      [v4 compositionWithAcceptedAutocorrection:v13];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Handle is not allowed by the screentime policy. Return.", buf, 2u);
        }
      }
      [(CKChatController *)self showScreenTimeShieldIfNeeded];
    }
  }
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 shelfPluginPayload];
  int v5 = [*(id *)(a1 + 32) _shouldValidatePayloadBeforeSendingPayload:v4];
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "shouldValidatePayload", buf, 2u);
      }
    }
    id v8 = v4;
    char v9 = +[CKBalloonPluginManager sharedInstance];
    BOOL v10 = [v8 pluginBundleID];
    id v11 = [v9 viewControllerForPluginIdentifier:v10];

    BOOL v12 = [v3 text];
    double v13 = [v12 string];

    int v14 = [v13 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F6C110] withString:&stru_1EDE4CA38];
    double v15 = [v14 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F6C130] withString:&stru_1EDE4CA38];

    [*(id *)(a1 + 32) _triggerRecipientFinalization];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [*(id *)(a1 + 32) conversation];
      double v17 = [v16 senderIdentifier];
      [v11 setSender:v17];
    }
    if (objc_opt_respondsToSelector())
    {
      double v18 = [*(id *)(a1 + 32) conversation];
      double v19 = [v18 recipientStrings];

      [v11 setRecipients:v19];
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_269;
    v30[3] = &unk_1E5628AF0;
    uint64_t v20 = *(void *)(a1 + 32);
    id v31 = v3;
    uint64_t v32 = v20;
    id v33 = v8;
    id v21 = v3;
    id v22 = v8;
    [v11 validatePayloadForSending:v22 associatedText:v15 completionHandler:v30];
  }
  else
  {
    if (v6)
    {
      double v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Should not validate payload", buf, 2u);
      }
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [*(id *)(a1 + 32) setTimingCollectionSendGelato:v24];

    double v25 = [*(id *)(a1 + 32) timingCollectionSendGelato];
    [v25 startTimingForKey:@"sendGelato"];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_281;
    aBlock[3] = &unk_1E5620AF8;
    void aBlock[4] = *(void *)(a1 + 32);
    id v29 = v3;
    id v11 = v3;
    id v26 = _Block_copy(aBlock);
    double v27 = [*(id *)(a1 + 32) composeRecipientSelectionController];
    [v27 atomizeAndInvokeBlock:v26];
  }
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_269(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    char v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "In validatePayloadForSending.", buf, 2u);
    }
  }
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_270;
    block[3] = &unk_1E5620AA8;
    id v19 = v7;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v20 = v10;
    uint64_t v21 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          double v13 = [*(id *)(a1 + 48) pluginBundleID];
          uint64_t v14 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          double v23 = v13;
          __int16 v24 = 2112;
          uint64_t v25 = v14;
          __int16 v26 = 2112;
          id v27 = v8;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Payload validation from plugin %@ for payload (%@) failed. reason %@", buf, 0x20u);
        }
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_274;
      v16[3] = &unk_1E5620AF8;
      v16[4] = *(void *)(a1 + 40);
      id v17 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v16);
    }
    if (CKIsRunningInMessagesViewService())
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2_275;
      v15[3] = &unk_1E5620C40;
      v15[4] = *(void *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_270(id *a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2;
  aBlock[3] = &unk_1E5620AA8;
  id v13 = a1[4];
  id v2 = a1[5];
  id v3 = a1[6];
  id v14 = v2;
  id v15 = v3;
  id v4 = _Block_copy(aBlock);
  int v5 = +[CKPluginExtensionStateObserver sharedInstance];
  char v6 = [v5 passKitUIPresented];

  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Calling setDeferredSendAnimationBlock.", (uint8_t *)&v11, 2u);
      }
    }
    [a1[6] setDeferredSendAnimationBlock:v4];
  }
  else
  {
    if (v7)
    {
      char v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "passKitUIPresented is not presented.", (uint8_t *)&v11, 2u);
      }
    }
    id v10 = [a1[6] composeRecipientSelectionController];
    [v10 atomizeAndInvokeBlock:v4];
  }
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_3;
  v5[3] = &unk_1E56237D8;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  +[CKComposition compositionWithShelfPluginPayload:v2 completionHandler:v5];
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) compositionByAppendingComposition:v5];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v9 = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Calling sendComposition with composition after validating payload", v9, 2u);
    }
  }
  [*(id *)(a1 + 40) sendCompositionIfAllowed:v7];
}

uint64_t __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_274(uint64_t a1)
{
  return [*(id *)(a1 + 32) showPayloadValidationAlertWithDescription:*(void *)(a1 + 40)];
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2_275(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entryView];
  v1 = [v2 sendButton];
  [v1 setEnabled:1];
}

uint64_t __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_281(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendCompositionIfAllowed:*(void *)(a1 + 40)];
}

- (void)_passKitUIDismissed:(id)a3
{
  uint64_t v4 = [(CKComposeChatController *)self deferredSendAnimationBlock];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = +[CKPluginExtensionStateObserver sharedInstance];
    char v7 = [v6 passKitUIPresented];

    if ((v7 & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:@"CKPluginExtensionStateObserverPassKitUIDismissed" object:0];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__CKComposeChatController__passKitUIDismissed___block_invoke;
      block[3] = &unk_1E5620C40;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __47__CKComposeChatController__passKitUIDismissed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) composeRecipientSelectionController];
  id v3 = [*(id *)(a1 + 32) deferredSendAnimationBlock];
  [v2 atomizeAndInvokeBlock:v3];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setDeferredSendAnimationBlock:0];
}

- (void)messageEntryViewSendButtonHitWhileDisabled:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v8 messageEntryViewSendButtonHitWhileDisabled:a3];
  uint64_t v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
  int v5 = [v4 toFieldIsFirstResponder];

  if (v5)
  {
    id v6 = [(CKChatController *)self entryView];
    char v7 = [v6 contentView];
    [v7 makeActive];
  }
}

- (id)textViewOnscreenWithEntryView
{
  id v2 = [(CKComposeChatController *)self composeRecipientSelectionController];
  id v3 = [v2 toField];
  uint64_t v4 = [v3 textView];

  return v4;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKChatController *)self funCameraViewController];
  if (v3)
  {
    uint64_t v4 = [(CKChatController *)self funCameraViewController];
    int v5 = [v4 isDismissing] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  if ([(CKChatController *)self targetFirstResponder] == 2)
  {
    id v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
    char v7 = [v6 toField];
    int v8 = [v7 becomeFirstResponder];

    if (IMOSLoggingEnabled())
    {
      char v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = @"NO";
        if (v8) {
          id v10 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        double v18 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "ToField tried to become first responder with success %@", buf, 0xCu);
      }
    }
    if (v8) {
      return 1;
    }
    v16.receiver = self;
    id v14 = &v16;
  }
  else
  {
    BOOL v12 = [(CKComposeChatController *)self presentedViewController];
    if (v12) {
      char v13 = v5;
    }
    else {
      char v13 = 0;
    }

    if (v13) {
      return 0;
    }
    id v15 = self;
    id v14 = (objc_super *)&v15;
  }
  v14->super_class = (Class)CKComposeChatController;
  return [(objc_super *)v14 becomeFirstResponder];
}

- (void)restoreInputAfterSearchPresentation
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  if ([v3 isEntryViewInputAccessory])
  {
  }
  else
  {
    int64_t v4 = [(CKChatController *)self targetFirstResponder];

    if (!v4)
    {
      int v5 = [(CKComposeChatController *)self proposedRecipients];
      uint64_t v6 = [v5 count];

      if (v6) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      [(CKChatController *)self setTargetFirstResponder:v7];
    }
  }

  [(CKComposeChatController *)self becomeFirstResponder];
}

- (void)sendAnimationManagerWillStartAnimation:(id)a3 context:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v13 sendAnimationManagerWillStartAnimation:a3 context:v6];
  if (![(CKComposeChatController *)self sendingViaCardUI]
    && !CKIsRunningInMacCatalyst())
  {
    uint64_t v7 = [v6 impactIdentifier];

    if (!v7)
    {
      int v8 = [(CKCoreChatController *)self delegate];
      uint64_t v9 = [v8 composeChatControllerShouldShowBackButtonViewDuringSendAnimation:self];

      id v10 = [(CKComposeChatController *)self navbarManager];
      __int16 v11 = [(CKCoreChatController *)self conversation];
      [v10 commitTransitionAnimationWithConversation:v11 shouldShowBackButtonView:v9];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __74__CKComposeChatController_sendAnimationManagerWillStartAnimation_context___block_invoke;
      v12[3] = &unk_1E5620C40;
      v12[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v12 animations:0.2];
    }
  }
}

void __74__CKComposeChatController_sendAnimationManagerWillStartAnimation_context___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) composeRecipientSelectionController];
  id v2 = [v1 view];

  [v2 frame];
  objc_msgSend(v2, "setFrame:", v4.origin.x, -CGRectGetHeight(v4), v4.size.width, v4.size.height);
}

- (void)recipientSelectionController:(id)a3 didSelectConversation:(id)a4 isiMessagable:(BOOL)a5
{
  BOOL v55 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v70 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "recipientSelectionController didSelectConversation: %@", buf, 0xCu);
    }
  }
  [(CKComposeChatController *)self setRecipientsListChanged:1];
  if (![(CKComposeChatController *)self newComposeCancelled])
  {
    uint64_t v9 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
    [v9 startTimingForKey:@"didSelectConversation"];

    id v10 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
    [v10 startTimingForKey:@"composeDelegateWork"];

    id v58 = [(CKCoreChatController *)self delegate];
    id v57 = [(CKCoreChatController *)self collectionViewController];
    if (v57)
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __92__CKComposeChatController_recipientSelectionController_didSelectConversation_isiMessagable___block_invoke;
      v64[3] = &unk_1E5620AA8;
      id v65 = v58;
      BOOL v66 = self;
      id v67 = v7;
      [v57 updateTranscript:v64 animated:0 completion:0];
    }
    else
    {
      [v58 composeChatController:self didSelectNewConversation:v7];
    }
    __int16 v11 = [(CKComposeChatController *)self navbarManager];
    [v11 updateContentsForConversation:v7];

    BOOL v12 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
    [v12 stopTimingForKey:@"composeDelegateWork"];

    [(CKChatController *)self setConversation:v7 forceReload:1];
    objc_super v13 = [(CKCoreChatController *)self collectionViewController];
    [v13 sizeFullTranscriptIfNecessary];

    id v14 = [v59 expandedRecipients];
    BOOL v56 = [(CKComposeChatController *)self hasUnreachableEmergencyRecipient];
    if (v56)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v61;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v61 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            id v20 = [v19 rawAddress];
            int IsEmergencyPhoneNumber = IMStringIsEmergencyPhoneNumber();

            if (IsEmergencyPhoneNumber)
            {
              id v22 = CKFrameworkBundle();
              dispatch_time_t v53 = [v22 localizedStringForKey:@"CANNOT_SEND_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

              double v23 = [v19 rawAddress];
              __int16 v24 = IMNormalizedPhoneNumberForPhoneNumber();
              int v25 = [v23 isEqualToIgnoringCase:v24];

              __int16 v26 = CKFrameworkBundle();
              id v27 = v26;
              if (v25) {
                uint64_t v28 = @"ERR_911_EMERGENCY_UNAVAILABLE_WITHOUT_SMS";
              }
              else {
                uint64_t v28 = @"ERR_EMERGENCY_UNAVAILABLE_WITHOUT_SMS";
              }
              id v29 = [v26 localizedStringForKey:v28 value:&stru_1EDE4CA38 table:@"ChatKit"];

              uint64_t v30 = +[CKAlertController alertControllerWithTitle:v53 message:v29 preferredStyle:1];
              id v31 = CKFrameworkBundle();
              uint64_t v32 = [v31 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
              id v33 = +[CKAlertAction actionWithTitle:v32 style:1 handler:0];

              [v30 addAction:v33];
              [v30 presentFromViewController:self animated:1 completion:0];

              goto LABEL_23;
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_23:
    }
    v34 = [(CKCoreChatController *)self conversation];
    id v35 = [v34 chat];
    BOOL v36 = [v35 chatStyle] == 45;

    if (v36 && [v14 count] == 1)
    {
      uint64_t v37 = [v14 objectAtIndex:0];
      v52 = [v37 rawAddress];

      uint64_t v38 = [MEMORY[0x1E4F6BBD8] sharedInstance];
      uint64_t v39 = [v38 activeIMessageAccount];

      BOOL v40 = [(CKCoreChatController *)self conversation];
      v54 = [v14 objectAtIndex:0];
      BOOL v41 = [(CKComposeChatController *)self shouldForceToSMSForConversation:v40 forRecipient:v54];
      if (v41 && !v55)
      {
        id v42 = [MEMORY[0x1E4F6BBD8] sharedInstance];
        id v43 = [MEMORY[0x1E4F6BDB8] smsService];
        id v44 = [v42 accountsForService:v43];
        uint64_t v45 = [v44 firstObject];

        uint64_t v39 = (void *)v45;
      }
      if (v41 || v55)
      {
        id v46 = [v39 imHandleWithID:v52];
        BOOL v47 = [(CKCoreChatController *)self conversation];

        v48 = [v47 chat];
        [v48 setRecipient:v46];
      }
      else
      {
        BOOL v47 = v40;
      }
    }
    __int16 v49 = [(CKChatController *)self entryView];
    objc_msgSend(v49, "setFailedRecipients:", -[CKComposeChatController hasFailedRecipients](self, "hasFailedRecipients"));

    id v50 = [(CKChatController *)self entryView];
    [v50 setUnreachableEmergencyRecipient:v56];

    uint64_t v51 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
    [v51 stopTimingForKey:@"didSelectConversation"];

    [(CKComposeChatController *)self _invalidateBlackholeAlertView];
  }
  [(CKComposeChatController *)self stageSuggestedReplies];
}

uint64_t __92__CKComposeChatController_recipientSelectionController_didSelectConversation_isiMessagable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) composeChatController:*(void *)(a1 + 40) didSelectNewConversation:*(void *)(a1 + 48)];
}

- (void)recipientSelectionControllerShouldResignFirstResponder:(id)a3
{
  id v4 = [(CKChatController *)self entryView];
  id v3 = [v4 contentView];
  [v3 makeActive];
}

- (BOOL)shouldForceToSMSForConversation:(id)a3 forRecipient:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CKComposeChatController *)self handleForRecipientNormalizedAddress:v7];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [v6 chat];

  if (v9)
  {
    id v10 = [v6 chat];
    uint64_t v9 = [v10 lastFinishedMessageItem];

    __int16 v11 = [v9 handle];
    BOOL v12 = [v8 ID];
    if (!v9 || !v11 || ([v11 isEqualToString:v12] & 1) != 0)
    {

LABEL_7:
      LOBYTE(v9) = 0;
      goto LABEL_8;
    }
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412546;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        double v18 = v12;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Should force conversation to SMS because lastHandleID:%@ != newHandleID:%@", (uint8_t *)&v15, 0x16u);
      }
    }
    LOBYTE(v9) = 1;
  }
LABEL_8:

  return (char)v9;
}

- (id)handleForRecipientNormalizedAddress:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6BBD8];
  id v4 = a3;
  int v5 = [v3 sharedInstance];
  id v6 = objc_msgSend(v5, "__ck_bestAccountForAddresses:", 0);
  id v7 = [v4 normalizedAddress];

  int v8 = IMStripFormattingFromAddress();
  uint64_t v9 = [v6 imHandleWithID:v8 alreadyCanonical:0];

  return v9;
}

- (id)chatForIMHandle:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6BC40];
  id v4 = a3;
  int v5 = [v3 sharedRegistry];
  id v6 = [v5 existingChatForIMHandle:v4 allowRetargeting:0 fixChatHandle:0];

  return v6;
}

- (void)recipientSelectionControllerDidBecomeFirstResponder:(id)a3
{
  id v4 = [(CKChatController *)self entryView];
  -[CKChatController updateAppStripVisibility:animated:](self, "updateAppStripVisibility:animated:", [v4 shouldShowAppStrip], 1);
}

- (void)recipientSelectionControllerDidChangeSize:(id)a3
{
}

- (BOOL)recipientSelectionIsGroup:(id)a3
{
  id v4 = a3;
  int v5 = [(CKComposeChatController *)self prepopulatedRecipients];
  if ((unint64_t)[v5 count] > 1)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [v4 recipients];
    BOOL v7 = (unint64_t)[v6 count] > 1;
  }
  return v7;
}

- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3
{
  [(CKChatController *)self visibleInputViewHeight];
  double v5 = v4;
  id v6 = [(CKChatController *)self entryView];
  BOOL v7 = [v6 window];
  if (v7)
  {
    int v8 = [(CKChatController *)self entryView];
    uint64_t v9 = [v8 heightConstraint];
    [v9 constant];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }

  return v5 + v11;
}

- (void)recipientSelectionControllerReturnPressed:(id)a3
{
  id v4 = [(CKChatController *)self entryView];
  id v3 = [v4 contentView];
  [v3 makeActive];
}

- (void)recipientSelectionControllerTabPressed:(id)a3
{
  [(CKChatController *)self setTargetFirstResponder:1];

  [(CKComposeChatController *)self becomeFirstResponder];
}

- (void)recipientSelectionControllerSearchListDidShowOrHide:(id)a3
{
  id v4 = [(CKCoreChatController *)self collectionViewController];
  double v5 = [v4 collectionView];
  id v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
  objc_msgSend(v5, "setScrollsToTop:", objc_msgSend(v6, "isSearchResultsHidden"));

  BOOL v7 = [(CKComposeChatController *)self firstResponder];
  [v7 reloadInputViews];

  if (__CurrentTestName)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"PPTSearchListDidShowOrHideNotification" object:self userInfo:0];
  }
}

- (void)recipientSelectionController:(id)a3 textDidChange:(id)a4
{
  id v5 = [(CKChatController *)self entryView];
  objc_msgSend(v5, "setComposingRecipient:", -[CKComposeChatController isComposingRecipient](self, "isComposingRecipient"));
}

- (void)recipientSelectionControllerDidPushABViewController:(id)a3
{
}

- (UIView)recipientSelectionHeaderDecorationView
{
  return 0;
}

- (int64_t)recipientSelectionUserInterfaceStyleOverride
{
  return 0;
}

- (UIEdgeInsets)recipientSelectionAdditionalSearchListInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)recipientSelectionController:(id)a3 didFinishAvailaiblityLookupForRecipient:(id)a4
{
  id v5 = [(CKChatController *)self entryView];
  objc_msgSend(v5, "setFailedRecipients:", -[CKComposeChatController hasFailedRecipients](self, "hasFailedRecipients"));
}

- (BOOL)isComposingRecipient
{
  double v2 = [(CKComposeChatController *)self composeRecipientSelectionController];
  if (!v2)
  {
    if (IMOSLoggingEnabled())
    {
      double v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Has nil CKRecipientSelectionController. isComposingRecipient=false. Will return early.", v6, 2u);
      }
    }
    if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]) {
      [0 allowedByScreenTime];
    }
    goto LABEL_11;
  }
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]
    && ![v2 allowedByScreenTime])
  {
LABEL_11:
    LOBYTE(v3) = 0;
    goto LABEL_12;
  }
  int v3 = [v2 finishedComposingRecipients] ^ 1;
LABEL_12:

  return v3;
}

- (BOOL)hasUnreachableEmergencyRecipient
{
  double v2 = [(CKComposeChatController *)self composeRecipientSelectionController];
  int v3 = v2;
  if (v2) {
    char v4 = [v2 hasUnreachableEmergencyRecipient];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)hasFailedRecipients
{
  double v2 = [(CKComposeChatController *)self composeRecipientSelectionController];
  int v3 = v2;
  if (v2) {
    char v4 = [v2 hasFailediMessageRecipients];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)showConversation:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKCoreChatController *)self delegate];
  [v7 showConversation:v6 animate:v4];
}

- (void)_saveDraftState
{
  if ([(CKComposeChatController *)self newComposeCancelled]
    || [(CKChatController *)self isAnimatingMessageSend])
  {
    id v11 = +[CKDraftManager sharedInstance];
    [v11 clearDraftForPendingConversation];
  }
  else
  {
    int v3 = [(CKCoreChatController *)self inputController];
    [v3 requestPhotoBrowserToPrepareForDraft];

    BOOL v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
    id v5 = [v4 proposedRecipients];
    id v11 = [v5 composeRecipientAddresses];

    id v6 = +[CKDraftManager sharedInstance];
    id v7 = [(CKChatController *)self entryView];
    id v8 = [v7 composition];
    uint64_t v9 = [(CKCoreChatController *)self conversation];
    double v10 = [v9 groupID];
    [v6 setDraftForPendingConversation:v8 withRecipients:v11 chatIdentifier:v10];
  }
}

- (BOOL)_shouldRestoreDraftState
{
  int v3 = [(CKChatController *)self composition];
  if ([v3 hasContent])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    id v5 = [(CKComposeChatController *)self prepopulatedComposition];
    int v4 = [v5 hasContent] ^ 1;
  }
  return v4;
}

- (void)prepareToDismissForSecondInstance
{
  int v3 = [(CKChatController *)self effectPickerViewController];

  if (v3) {
    [(CKChatController *)self requestDismissKeyboardSnapshotForEffectPickerIfNeeded];
  }
  v4.receiver = self;
  v4.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v4 prepareToDismissForSecondInstance];
}

- (BOOL)_chatShowsAccountRegistrationFailureBanner
{
  return 0;
}

- (BOOL)_showOrHideNicknameBannerIfNeeded
{
  return 0;
}

- (BOOL)_wantsCatchUpAffordance
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(CKComposeChatController *)self composeRecipientSelectionController];
  id v8 = [v7 toField];
  int v9 = [v8 isFirstResponder];

  if (v9)
  {
    double v10 = [(CKComposeChatController *)self composeRecipientSelectionController];
    id v11 = [v10 toField];
    unsigned __int8 v12 = [v11 canPerformAction:a3 withSender:v6];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CKComposeChatController;
    unsigned __int8 v12 = [(CKChatController *)&v14 canPerformAction:a3 withSender:v6];
  }

  return v12;
}

- (int64_t)preferredStatusBarStyle
{
  if ([(CKComposeChatController *)self _isBusinessConversation])
  {
    int v3 = +[CKUIBehavior sharedBehaviors];
    objc_super v4 = [v3 theme];
    id v5 = [(CKComposeChatController *)self businessHandle];
    int64_t v6 = [v4 statusBarStyleForBusinessHandle:v5];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKComposeChatController;
    return [(CKChatController *)&v8 preferredStatusBarStyle];
  }
}

- (void)_updateNavigationUI
{
  v13.receiver = self;
  v13.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v13 _updateNavigationUI];
  int v3 = [(CKComposeChatController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  id v5 = [v4 standardAppearance];
  int64_t v6 = (void *)[v5 copy];

  id v7 = +[CKUIBehavior sharedBehaviors];
  objc_super v8 = [v7 theme];
  int v9 = [(CKComposeChatController *)self businessHandle];
  double v10 = [v8 primaryBrandColorForBusinessHandle:v9];
  [v6 setBackgroundColor:v10];

  id v11 = [(CKComposeChatController *)self navigationItem];
  [v11 setScrollEdgeAppearance:v6];

  unsigned __int8 v12 = [(CKComposeChatController *)self navigationItem];
  [v12 setStandardAppearance:v6];

  [(CKComposeChatController *)self _updateBizNavbarIfNecessary];
}

- (void)_reloadMentionsData
{
  id v4 = [(CKChatController *)self entryView];
  double v2 = [v4 contentView];
  int v3 = [v2 textView];
  [v3 reloadMentionsData];
}

- (void)_triggerRecipientFinalization
{
  id v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
  double v2 = [v4 toField];
  int v3 = [v2 textView];
  [v3 resignFirstResponder];
}

- (void)_updateBlackholeAlertView
{
  int v3 = [(CKCoreChatController *)self conversation];
  id v4 = [v3 chat];

  if (v4)
  {
    id v5 = [(CKCoreChatController *)self conversation];
    int64_t v6 = [v5 chat];
    int v7 = [v6 wantsSenderBlackholeWarning];
    if (self)
    {
      unint64_t v8 = 1;
      if (v7) {
        unint64_t v8 = 2;
      }
      self->_unint64_t blackholeAlertStatus = v8;
    }

    if (!self) {
      goto LABEL_12;
    }
  }
  else
  {
    if (self)
    {
      unint64_t blackholeAlertStatus = self->_blackholeAlertStatus;
      if (blackholeAlertStatus) {
        goto LABEL_10;
      }
      self->_unint64_t blackholeAlertStatus = 1;
    }
    uint64_t v39 = [(CKCoreChatController *)self conversation];
    BOOL v40 = [v39 senderIdentifier];

    BOOL v41 = [(CKCoreChatController *)self conversation];
    id v42 = [v41 recipient];
    id v43 = [v42 IDSCanonicalAddress];

    id location = 0;
    objc_initWeak(&location, self);
    if (!self || !self->_blackholeAlertStatusQueue)
    {
      id v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v45 = dispatch_queue_create("CKComposeChatController Blackhole Status", v44);
      -[CKComposeChatController setBlackholeAlertStatusQueue:]((uint64_t)self, v45);
    }
    if (self) {
      blackholeAlertStatusQueue = self->_blackholeAlertStatusQueue;
    }
    else {
      blackholeAlertStatusQueue = 0;
    }
    uint64_t v50 = MEMORY[0x1E4F143A8];
    uint64_t v51 = 3221225472;
    v52 = __52__CKComposeChatController__updateBlackholeAlertView__block_invoke;
    dispatch_time_t v53 = &unk_1E5621290;
    id v54 = v40;
    id v55 = v43;
    id v47 = v43;
    id v48 = v40;
    __int16 v49 = blackholeAlertStatusQueue;
    objc_copyWeak(&v56, &location);
    dispatch_async(v49, &v50);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
    if (!self) {
      goto LABEL_12;
    }
  }
  unint64_t blackholeAlertStatus = self->_blackholeAlertStatus;
LABEL_10:
  if (blackholeAlertStatus != 2
    || ([(CKCoreChatController *)self collectionViewController],
        double v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
LABEL_12:
    id v11 = [(CKComposeChatController *)self blackholeAlertView];
    [v11 removeFromSuperview];

    [(CKComposeChatController *)self setBlackholeAlertView:0];
    return;
  }
  unsigned __int8 v12 = [(CKComposeChatController *)self blackholeAlertView];

  if (!v12)
  {
    objc_super v13 = [CKTranscriptMultilineLabelCell alloc];
    objc_super v14 = -[CKTranscriptLabelCell initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v16 = CKFrameworkBundle();
    __int16 v17 = [v16 localizedStringForKey:@"HAWKING_WARNING_NON_CELLULAR" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v18 = (void *)[v15 initWithString:v17 attributes:0];

    objc_msgSend(v18, "replaceCharactersInRange:withString:", 0, 0, @" ");
    id v19 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    id v20 = +[CKUIBehavior sharedBehaviors];
    uint64_t v21 = [v20 hawkingWarningIcon];

    [v19 setImage:v21];
    [v19 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    id v22 = +[CKUIBehavior sharedBehaviors];
    double v23 = [v22 transcriptBoldFont];
    [v23 pointSize];
    double v25 = v24;

    [v21 size];
    double v27 = v26;
    [v21 size];
    double v29 = v25 * (v27 / v28);
    uint64_t v30 = +[CKUIBehavior sharedBehaviors];
    id v31 = [v30 transcriptBoldFont];
    [v31 capHeight];
    double v33 = (v32 - v25) * 0.5;

    objc_msgSend(v19, "setBounds:", 0.0, v33, v29, v25);
    v34 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v19];
    [v18 insertAttributedString:v34 atIndex:0];

    id v35 = +[CKUIBehavior sharedBehaviors];
    BOOL v36 = [v35 transcriptEmphasizedFontAttributes];

    objc_msgSend(v18, "addAttributes:range:", v36, 0, objc_msgSend(v18, "length"));
    [(CKTranscriptLabelCell *)v14 setAttributedText:v18];
    uint64_t v37 = +[CKUIBehavior sharedBehaviors];
    [v37 stampTranscriptInsets];
    -[CKEditableCollectionViewCell setContentInsets:](v14, "setContentInsets:");

    [(CKTranscriptStampCell *)v14 setOrientation:1];
    [(CKComposeChatController *)self setBlackholeAlertView:v14];
    uint64_t v38 = [(CKComposeChatController *)self view];
    [v38 insertSubview:v14 atIndex:0];
  }
}

- (void)setBlackholeAlertStatusQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 2600), a2);
  }
}

void __52__CKComposeChatController__updateBlackholeAlertView__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F6EA38] shouldShowSMSWarningForSender:*(void *)(a1 + 32) forRecipient:*(void *)(a1 + 40) withConversationHistory:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__CKComposeChatController__updateBlackholeAlertView__block_invoke_2;
  v3[3] = &unk_1E5628B18;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  char v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __52__CKComposeChatController__updateBlackholeAlertView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = 1;
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = 2;
    }
    WeakRetained[324] = v3;
  }
  id v4 = WeakRetained;
  [WeakRetained _updateBlackholeAlertView];
}

- (void)_invalidateBlackholeAlertView
{
  if (self) {
    self->_unint64_t blackholeAlertStatus = 0;
  }
  [(CKComposeChatController *)self _updateBlackholeAlertView];
}

- (void)_updateSendLaterCompositionIfNecessary
{
  uint64_t v3 = [(CKCoreChatController *)self conversation];
  id v4 = [v3 chat];
  char v5 = [v4 supportsCapabilities:0x80000];

  if ((v5 & 1) == 0)
  {
    int64_t v6 = [(CKChatController *)self composition];
    int v7 = [v6 sendLaterPluginInfo];

    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v10 = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Current conversation does not allow send later. Removing sendLaterPluginInfo", v10, 2u);
        }
      }
      int v9 = [(CKChatController *)self entryView];
      [v9 setSendLaterPluginInfo:0 animated:0];
    }
  }
}

- (BOOL)_isBusinessConversation
{
  uint64_t v3 = [(CKComposeChatController *)self businessHandle];
  if (v3)
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(CKCoreChatController *)self conversation];
    char v4 = [v5 isBusinessConversation];
  }
  return v4;
}

- (BOOL)_isNewBusinessConversation
{
  if (![(CKComposeChatController *)self _isBusinessConversation]
    || [(CKComposeChatController *)self isSendingComposition])
  {
    return 0;
  }
  char v4 = [(CKCoreChatController *)self conversation];
  char v5 = [v4 chat];
  if (v5)
  {
    int64_t v6 = [(CKCoreChatController *)self conversation];
    int v7 = [v6 chat];
    BOOL v3 = [v7 messageCount] == 0;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)_updateBusinessInfoIfNecessary
{
  [(CKComposeChatController *)self setBusinessInfoViewInfoIfNecessary];

  [(CKComposeChatController *)self _updateBizNavbarIfNecessary];
}

- (void)_updateBizNavbarIfNecessary
{
  BOOL v3 = [(CKComposeChatController *)self _isBusinessConversation];
  char v4 = [(CKComposeChatController *)self navigationController];
  char v5 = [v4 navigationBar];
  int64_t v6 = [(CKComposeChatController *)self businessHandle];
  if (v3)
  {
    [v5 enableBranding:1 forBusinessHandle:v6];

    int v7 = [(CKComposeChatController *)self navigationController];
    unint64_t v8 = [v7 navigationBar];
    int v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    [v5 enableBranding:0 forBusinessHandle:v6];

    int v7 = [(CKComposeChatController *)self navigationController];
    unint64_t v8 = [v7 navigationBar];
    int v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setAccessibilityIgnoresInvertColors:v10];

  [(CKComposeChatController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)setBusinessInfoViewInfoIfNecessary
{
  if (![(CKComposeChatController *)self _isBusinessConversation]) {
    return;
  }
  BOOL v3 = [(CKCoreChatController *)self conversation];
  char v4 = [v3 isChatBot];

  if (v4) {
    return;
  }
  BOOL v5 = [(CKComposeChatController *)self _isNewBusinessConversation];
  int64_t v6 = [(CKComposeChatController *)self businessInfoView];
  int v7 = v6;
  if (v5)
  {

    if (!v7)
    {
      unint64_t v8 = [[CKBusinessInfoView alloc] initWithLayoutType:0];
      [(CKComposeChatController *)self setBusinessInfoView:v8];

      int v9 = [(CKComposeChatController *)self businessInfoView];
      [v9 setDelegate:self];
    }
    uint64_t v10 = [(CKChatController *)self entryView];

    if (v10)
    {
      id v11 = [(CKComposeChatController *)self view];
      unsigned __int8 v12 = [(CKComposeChatController *)self businessInfoView];
      objc_super v13 = [(CKChatController *)self entryView];
      [v11 insertSubview:v12 belowSubview:v13];
    }
    else
    {
      objc_super v14 = [(CKComposeChatController *)self businessInfoView];
      id v15 = [v14 superview];

      if (v15)
      {
LABEL_14:
        uint64_t v16 = [(CKCoreChatController *)self conversation];
        __int16 v17 = [v16 recipients];
        uint64_t v18 = [v17 count];

        if (!v18) {
          return;
        }
        id v19 = [(CKCoreChatController *)self conversation];
        id v20 = [v19 recipients];
        uint64_t v21 = [v20 objectAtIndexedSubscript:0];
        id v76 = [v21 defaultIMHandle];

        id v22 = [v76 brand];

        if (!v22) {
          goto LABEL_35;
        }
        double v23 = [MEMORY[0x1E4F6C360] sharedInstance];
        if ([v23 isInternalInstall])
        {
          double v24 = [(CKComposeChatController *)self bizIntent];
          double v25 = [v24 objectForKeyedSubscript:@"biz-greeting-txt"];

          if (v25)
          {
            double v26 = [(CKComposeChatController *)self businessInfoView];
            double v27 = [v26 greetingText];
            double v28 = [(CKComposeChatController *)self bizIntent];
            double v29 = [v28 objectForKeyedSubscript:@"biz-greeting-txt"];
            char v30 = [v27 isEqualToString:v29];

            if (v30)
            {
LABEL_32:
              id v58 = [(CKComposeChatController *)self businessInfoView];
              id v59 = [v58 descriptionText];
              long long v60 = [v76 brand];
              long long v61 = [v60 localizedResponseTime];
              char v62 = [v59 isEqualToString:v61];

              if ((v62 & 1) == 0)
              {
                long long v63 = [v76 brand];
                id v64 = [v63 localizedResponseTime];
                id v65 = [(CKComposeChatController *)self businessInfoView];
                [v65 setDescriptionText:v64];
              }
              [(CKComposeChatController *)self layoutBusinessInfoViewIfNecessary];
LABEL_35:
              BOOL v66 = [v76 brand];
              id v67 = [v66 name];
              if (v67)
              {
              }
              else
              {
                long long v68 = [(CKComposeChatController *)self businessInfoView];
                long long v69 = [v68 greetingText];
                id v70 = CKFrameworkBundle();
                uint64_t v71 = [v70 localizedStringForKey:@"BUSINESS_GREETING_DEFAULT_NO_BRAND" value:&stru_1EDE4CA38 table:@"ChatKit"];
                char v72 = [v69 isEqualToString:v71];

                if ((v72 & 1) == 0)
                {
                  long long v73 = CKFrameworkBundle();
                  __int16 v74 = [v73 localizedStringForKey:@"BUSINESS_GREETING_DEFAULT_NO_BRAND" value:&stru_1EDE4CA38 table:@"ChatKit"];
                  id v75 = [(CKComposeChatController *)self businessInfoView];
                  [v75 setGreetingText:v74];

                  [(CKComposeChatController *)self layoutBusinessInfoViewIfNecessary];
                }
              }

              return;
            }
            id v31 = [(CKComposeChatController *)self bizIntent];
            double v32 = [v31 objectForKeyedSubscript:@"biz-greeting-txt"];
            double v33 = [(CKComposeChatController *)self businessInfoView];
            [v33 setGreetingText:v32];

            goto LABEL_30;
          }
        }
        else
        {
        }
        id v31 = [v76 brand];
        uint64_t v34 = [v31 name];
        if (!v34)
        {
LABEL_31:

          goto LABEL_32;
        }
        id v35 = (void *)v34;
        BOOL v36 = [(CKComposeChatController *)self businessInfoView];
        uint64_t v37 = [v36 greetingText];
        uint64_t v38 = NSString;
        uint64_t v39 = CKFrameworkBundle();
        BOOL v40 = [v39 localizedStringForKey:@"BUSINESS_GREETING_DEFAULT_BRAND" value:&stru_1EDE4CA38 table:@"ChatKit"];
        BOOL v41 = [v76 brand];
        id v42 = [v41 name];
        id v43 = objc_msgSend(v38, "stringWithFormat:", v40, v42);

        id v44 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v45 = [v44 userInterfaceLayoutDirection];

        if (v45 == 1) {
          id v46 = @"\u200F";
        }
        else {
          id v46 = @"\u200E";
        }
        id v47 = [(__CFString *)v46 stringByAppendingString:v43];

        char v48 = [v37 isEqualToString:v47];
        if (v48) {
          goto LABEL_32;
        }
        __int16 v49 = NSString;
        uint64_t v50 = CKFrameworkBundle();
        uint64_t v51 = [v50 localizedStringForKey:@"BUSINESS_GREETING_DEFAULT_BRAND" value:&stru_1EDE4CA38 table:@"ChatKit"];
        v52 = [v76 brand];
        dispatch_time_t v53 = [v52 name];
        id v54 = objc_msgSend(v49, "stringWithFormat:", v51, v53);

        id v55 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v56 = [v55 userInterfaceLayoutDirection];

        if (v56 == 1) {
          id v57 = @"\u200F";
        }
        else {
          id v57 = @"\u200E";
        }
        id v31 = [(__CFString *)v57 stringByAppendingString:v54];

        double v32 = [(CKComposeChatController *)self businessInfoView];
        [v32 setGreetingText:v31];
LABEL_30:

        goto LABEL_31;
      }
      id v11 = [(CKComposeChatController *)self view];
      unsigned __int8 v12 = [(CKComposeChatController *)self businessInfoView];
      [v11 addSubview:v12];
    }

    goto LABEL_14;
  }
  [v6 removeFromSuperview];

  [(CKComposeChatController *)self setBusinessInfoView:0];
}

- (void)layoutBusinessInfoViewIfNecessary
{
  BOOL v3 = [(CKComposeChatController *)self businessInfoView];

  if (v3)
  {
    char v4 = [(CKComposeChatController *)self view];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    double v13 = *MEMORY[0x1E4F1DB28];
    objc_super v14 = [(CKComposeChatController *)self composeRecipientSelectionController];
    id v15 = [v14 parentViewController];

    if (v15)
    {
      double v54 = v13;
      uint64_t v16 = [(CKComposeChatController *)self composeRecipientSelectionController];
      __int16 v17 = [v16 toField];
      [v17 frame];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      double v26 = [(CKComposeChatController *)self view];
      double v27 = [(CKComposeChatController *)self composeRecipientSelectionController];
      double v28 = [v27 toField];
      objc_msgSend(v26, "convertRect:fromView:", v28, v19, v21, v23, v25);
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;

      v57.origin.x = v30;
      v57.origin.y = v32;
      v57.size.width = v34;
      v57.size.height = v36;
      double MaxY = CGRectGetMaxY(v57);
      uint64_t v38 = [(CKComposeChatController *)self composeRecipientSelectionController];
      uint64_t v39 = [v38 fromFieldContainerView];

      [v39 frame];
      if (v40 <= 0.0)
      {
        double v13 = v54;
      }
      else
      {
        double v41 = v40;
        id v42 = [(CKComposeChatController *)self composeRecipientSelectionController];
        id v43 = [v42 fromFieldContainerView];
        char v44 = [v43 isHidden];

        double v13 = v54;
        if ((v44 & 1) == 0)
        {
          [v39 frame];
          double MaxY = v41 + v45;
        }
      }
    }
    else
    {
      id v46 = +[CKUIBehavior sharedBehaviors];
      uint64_t v47 = [v46 useMacToolbar];

      if (v47)
      {
        uint64_t v39 = [(CKChatController *)self businessMacToolbarController];
        [v39 view];
      }
      else
      {
        uint64_t v39 = [(CKComposeChatController *)self navigationController];
        [v39 navigationBar];
      char v48 = };
      [v48 frame];
      double MaxY = CGRectGetMaxY(v58);
    }
    v59.origin.x = v6;
    v59.origin.y = v8;
    v59.size.width = v10;
    v59.size.height = v12;
    double Width = CGRectGetWidth(v59);
    uint64_t v50 = [(CKComposeChatController *)self businessInfoView];
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.width = v10;
    v60.size.height = v12;
    objc_msgSend(v50, "sizeThatFits:", CGRectGetWidth(v60), 1.79769313e308);
    double v52 = v51;

    dispatch_time_t v53 = [(CKComposeChatController *)self businessInfoView];
    objc_msgSend(v53, "setFrame:", v13, MaxY, Width, v52);

    id v55 = [(CKComposeChatController *)self businessInfoView];
    [v55 setNeedsLayout];
  }
}

- (void)businessInfoView:(id)a3 infoButtonTapped:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F83AD8], "presenterForPrivacySplashWithIdentifer:", *MEMORY[0x1E4F83B20], a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setPresentingViewController:self];
  [v5 present];
}

- (void)handleCancelAction:(id)a3
{
}

- (void)handleAddressBookChange:(id)a3
{
  id v3 = [(CKComposeChatController *)self view];
  [v3 setNeedsLayout];
}

- (BOOL)shouldPresentBlockingDowntimeViewController
{
  return 1;
}

- (UIView)virtualToolbarItem
{
  if ([(CKComposeChatController *)self _isBusinessConversation]) {
    [(CKChatController *)self businessMacToolbarController];
  }
  else {
  id v3 = [(CKComposeChatController *)self composeRecipientSelectionController];
  }
  char v4 = [v3 view];

  if (v4 && self->_virtualToolbarItem != v4) {
    objc_storeStrong((id *)&self->_virtualToolbarItem, v4);
  }
  id v5 = self->_virtualToolbarItem;

  return v5;
}

- (void)configureWithToolbarController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v7 configureWithToolbarController:a3];
  if ([(CKComposeChatController *)self _isBusinessConversation])
  {
    char v4 = [CKBusinessMacToolbarViewController alloc];
    id v5 = [(CKComposeChatController *)self businessHandle];
    CGFloat v6 = [(CKBusinessMacToolbarViewController *)v4 initWithConversation:v5 showingInStandAloneWindow:[(CKCoreChatController *)self showingInStandAloneWindow]];
    [(CKChatController *)self setBusinessMacToolbarController:v6];
  }
}

- (void)providerWillBeRemovedFromToolbarController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKComposeChatController;
  [(CKChatController *)&v7 providerWillBeRemovedFromToolbarController:a3];
  char v4 = +[CKUIBehavior sharedBehaviors];
  if ([v4 useMacToolbar])
  {
    id v5 = [(CKComposeChatController *)self composeRecipientSelectionController];

    if (!v5) {
      return;
    }
    char v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
    CGFloat v6 = [v4 view];
    [v6 removeFromSuperview];
  }
}

- (BOOL)itemProviderDisablesTouches
{
  return 0;
}

- (BOOL)prefersBottomDividerHidden
{
  [(CKChatController *)self preferredMacToolbarHeight];
  double v3 = v2;
  char v4 = +[CKUIBehavior sharedBehaviors];
  [v4 macAppKitToolbarHeight];
  BOOL v6 = v3 > v5;

  return v6;
}

- (id)toolbarItemForIdentifier:(id)a3
{
  return 0;
}

- (BOOL)reparentToolbarItem:(id)a3
{
  return 0;
}

- (UIEdgeInsets)virtualToolbarContentInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)virtualView
{
  if ([(CKCoreChatController *)self isShowingLockoutView])
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [(CKComposeChatController *)self virtualToolbarItem];
  }

  return v3;
}

- (BOOL)canShowBusinessOnboarding
{
  uint64_t v3 = [(CKComposeChatController *)self businessHandle];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(CKComposeChatController *)self businessHandle];
    char v6 = [v5 isMapKitBusiness];

    if (v6) {
      return 1;
    }
  }
  CGFloat v8 = [(CKCoreChatController *)self conversation];
  char v9 = [v8 isMapKitBusinessConversation];

  return v9;
}

- (void)didFinishShowingBusinessOnboarding
{
  [(CKChatController *)self setTargetFirstResponder:1];

  [(CKComposeChatController *)self becomeFirstResponder];
}

- (void)suggestionsController:(id)a3 didSelectRecipient:(id)a4
{
  id v5 = a4;
  id v6 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v6 addRecipient:v5];
}

- (void)suggestionsController:(id)a3 didDeselectRecipient:(id)a4
{
  id v4 = a4;
  id v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CKComposeChatController suggestionsController:didDeselectRecipient:]((uint64_t)v4, v5);
  }
}

- (id)selectedRecipientsForSuggestionsController:(id)a3
{
  uint64_t v3 = [(CKComposeChatController *)self composeRecipientSelectionController];
  id v4 = [v3 recipients];
  id v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (CKComposeRecipientSelectionController)composeRecipientSelectionController
{
  return self->_composeRecipientSelectionController;
}

- (void)setComposeRecipientSelectionController:(id)a3
{
}

- (NSString)suggestedRepliesData
{
  return self->_suggestedRepliesData;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (void)setOverrideTitle:(id)a3
{
}

- (BOOL)ignoreEmailsWhenSending
{
  return self->_ignoreEmailsWhenSending;
}

- (void)setIgnoreEmailsWhenSending:(BOOL)a3
{
  self->_ignoreEmailsWhenSending = a3;
}

- (BOOL)recipientsListChanged
{
  return self->_recipientsListChanged;
}

- (void)setRecipientsListChanged:(BOOL)a3
{
  self->_recipientsListChanged = a3;
}

- (BOOL)ignoreKeyboardNotifications
{
  return self->_ignoreKeyboardNotifications;
}

- (void)setIgnoreKeyboardNotifications:(BOOL)a3
{
  self->_ignoreKeyboardNotifications = a3;
}

- (NSArray)prepopulatedRecipients
{
  return self->_prepopulatedRecipients;
}

- (CKComposition)prepopulatedComposition
{
  return self->_prepopulatedComposition;
}

- (UINavigationController)catalystComposeNavigationController
{
  return self->_catalystComposeNavigationController;
}

- (void)setCatalystComposeNavigationController:(id)a3
{
}

- (BOOL)newComposeCancelled
{
  return self->_newComposeCancelled;
}

- (void)setNewComposeCancelled:(BOOL)a3
{
  self->_newComposeCancelled = a3;
}

- (BOOL)isSendingComposition
{
  return self->_sendingComposition;
}

- (void)setSendingComposition:(BOOL)a3
{
  self->_sendingComposition = a3;
}

- (void)setComposeCancelItem:(id)a3
{
}

- (CKComposeNavbarManager)navbarManager
{
  return self->_navbarManager;
}

- (void)setNavbarManager:(id)a3
{
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (void)setLastAddressedHandle:(id)a3
{
}

- (NSString)lastAddressedSIMID
{
  return self->_lastAddressedSIMID;
}

- (void)setLastAddressedSIMID:(id)a3
{
}

- (NSString)prepopulatedSIMID
{
  return self->_prepopulatedSIMID;
}

- (void)setPrepopulatedSIMID:(id)a3
{
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
}

- (CKBusinessInfoView)businessInfoView
{
  return self->_businessInfoView;
}

- (void)setBusinessInfoView:(id)a3
{
}

- (IMHandle)businessHandle
{
  return self->_businessHandle;
}

- (void)setBusinessHandle:(id)a3
{
}

- (CKTranscriptMultilineLabelCell)blackholeAlertView
{
  return self->_blackholeAlertView;
}

- (void)setBlackholeAlertView:(id)a3
{
}

- (BOOL)sendingViaCardUI
{
  return self->_sendingViaCardUI;
}

- (void)setSendingViaCardUI:(BOOL)a3
{
  self->_sendingViaCardUI = a3;
}

- (id)deferredSendAnimationBlock
{
  return self->_deferredSendAnimationBlock;
}

- (void)setDeferredSendAnimationBlock:(id)a3
{
}

- (void)setVirtualToolbarItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualToolbarItem, 0);
  objc_storeStrong(&self->_deferredSendAnimationBlock, 0);
  objc_storeStrong((id *)&self->_blackholeAlertStatusQueue, 0);
  objc_storeStrong((id *)&self->_blackholeAlertView, 0);
  objc_storeStrong((id *)&self->_businessHandle, 0);
  objc_storeStrong((id *)&self->_businessInfoView, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_prepopulatedSIMID, 0);
  objc_storeStrong((id *)&self->_lastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_lastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_navbarManager, 0);
  objc_storeStrong((id *)&self->_composeCancelItem, 0);
  objc_storeStrong((id *)&self->_catalystComposeNavigationController, 0);
  objc_storeStrong((id *)&self->_prepopulatedComposition, 0);
  objc_storeStrong((id *)&self->_prepopulatedRecipients, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_suggestedRepliesData, 0);

  objc_storeStrong((id *)&self->_composeRecipientSelectionController, 0);
}

- (BOOL)allowsLoadingIndicatorPresentation
{
  return 0;
}

- (void)suggestionsController:(uint64_t)a1 didDeselectRecipient:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "suggestionsController asked to deselect a recipient: %@", (uint8_t *)&v2, 0xCu);
}

@end