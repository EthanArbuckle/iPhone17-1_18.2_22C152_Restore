@interface CKNotificationChatController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowedByScreenTime;
- (BOOL)becomeFirstResponder;
- (BOOL)constrainToPresentingVCBounds;
- (BOOL)forceWindowedPresentation;
- (BOOL)inputAccessoryViewControllerEnabled;
- (BOOL)isSafeToMarkAsRead;
- (BOOL)messageEntryShouldHideCaret:(id)a3;
- (BOOL)messageEntryView:(id)a3 shouldInsertMediaObjects:(id)a4;
- (BOOL)messageEntryViewShouldBeginEditing:(id)a3;
- (BOOL)messageEntryViewShouldVerticallyInsetForPresentedAppCard:(id)a3;
- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4;
- (BOOL)pluginButtonsEnabled;
- (BOOL)preserveModalPresentationStyle;
- (BOOL)shouldAllowReplyFromLockScreen;
- (BOOL)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:(id)a3;
- (BOOL)shouldShowEntryView;
- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3;
- (BOOL)wantsReplyButton;
- (BOOL)wantsWindowedPresentation;
- (CGRect)effectiveVisibleRectOfCollectionViewForTranscriptCollectionViewController:(id)a3;
- (CGRect)lastKnownKeyboardFrame;
- (CGSize)messageEntryViewMaxShelfPluginViewSize:(id)a3;
- (CKFullScreenBalloonViewController)notificationFullScreenBalloonController;
- (CKMentionsController)mentionsController;
- (CKMessageEntryView)entryView;
- (CKMessageEntryViewController)entryViewController;
- (CKNotificationChatController)initWithConversation:(id)a3 entryViewTraitCollection:(id)a4;
- (CKRaiseGesture)raiseGesture;
- (CKScheduledUpdater)typingUpdater;
- (Class)lockoutViewControllerClass;
- (NSDate)notificationViewWillAppearDate;
- (NSExtensionContext)urlOpenContext;
- (NSTimer)notificationViewDismissalTimer;
- (STLockoutViewController)lockoutViewController;
- (double)_maxEntryViewHeight;
- (double)balloonMaxWidth;
- (id)inputAccessoryView;
- (id)inputAccessoryViewController;
- (id)inputContextHistoryForMessageEntryView:(id)a3;
- (id)launchURLForInputMode:(id)a3;
- (id)messageEntryViewActiveSendMenuPresentation:(id)a3;
- (id)progressBar;
- (int64_t)messageEntryViewHighLightInputButton:(id)a3;
- (void)__raiseGestureRecognized:(id)a3;
- (void)_allowedByScreenTimeChanged:(id)a3;
- (void)_dismissFullScreenBubbleViewControllerAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 completion:(id)a5;
- (void)_handleKeyboardDidChangeFrameNotification:(id)a3;
- (void)_handleStickerTextInputPayload:(id)a3;
- (void)_insertUIStickerAsAdaptiveImageGlyph:(id)a3;
- (void)_launchMessagesForInputMode:(id)a3;
- (void)_messageReceivedInCurrentTranscript:(id)a3;
- (void)_openMessagesForChat:(id)a3;
- (void)_saveDraftForCurrentComposition;
- (void)_setConversationDeferredSetup;
- (void)_setEntryViewFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)_setupShouldShowReplyFromLockScreen;
- (void)_updateEntryViewFrameIfNeeded:(BOOL)a3;
- (void)backgroundViewTapGestureRecognized:(id)a3;
- (void)dealloc;
- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4;
- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)fullScreenBalloonViewController:(id)a3 willAppearAnimated:(BOOL)a4;
- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3;
- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3;
- (void)handlePayload:(id)a3 withPayloadId:(id)a4;
- (void)insertUIStickerAsAdaptiveImageGlyph:(id)a3;
- (void)isSafeToMarkAsRead;
- (void)launchAppFromExtensionWith:(id)a3;
- (void)messageEntryView:(id)a3 didLongPressPlusButton:(id)a4;
- (void)messageEntryView:(id)a3 didMoveToWindow:(id)a4;
- (void)messageEntryView:(id)a3 didSelectPlusButton:(id)a4;
- (void)messageEntryViewBrowserButtonHit:(id)a3;
- (void)messageEntryViewDidBeginEditingNotAlreadyActive:(id)a3;
- (void)messageEntryViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5;
- (void)messageEntryViewHandwritingButtonHit:(id)a3;
- (void)messageEntryViewPhotoButtonHit:(id)a3;
- (void)messageEntryViewPlusButtonHit:(id)a3;
- (void)messageEntryViewRecordingDidChange:(id)a3;
- (void)messageEntryViewSafeAreaInsetsDidChange:(id)a3;
- (void)messageEntryViewSendButtonHit:(id)a3;
- (void)messageEntryViewWantsGenerativePlaygroundPluginPresented:(id)a3 presentationStyle:(unint64_t)a4;
- (void)raiseGestureRecognized:(id)a3;
- (void)registerForTextInputPayloadHandling;
- (void)sendComposition:(id)a3;
- (void)setAllowedByScreenTime:(BOOL)a3;
- (void)setConversation:(id)a3;
- (void)setEntryView:(id)a3;
- (void)setEntryViewController:(id)a3;
- (void)setLastKnownKeyboardFrame:(CGRect)a3;
- (void)setLocalUserIsComposing:(BOOL)a3 withPluginBundleID:(id)a4 typingIndicatorData:(id)a5;
- (void)setLockoutViewController:(id)a3;
- (void)setMentionsController:(id)a3;
- (void)setNotificationFullScreenBalloonController:(id)a3;
- (void)setNotificationViewDismissalTimer:(id)a3;
- (void)setNotificationViewWillAppearDate:(id)a3;
- (void)setRaiseGesture:(id)a3;
- (void)setSendingMessage:(BOOL)a3;
- (void)setShouldAllowReplyFromLockScreen:(BOOL)a3;
- (void)setTypingUpdater:(id)a3;
- (void)setUrlOpenContext:(id)a3;
- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 didRequestReaderViewControllerForChatItem:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 longPressedForItemWithIndexPath:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4;
- (void)unregisterForTextInputPayloadHandling;
- (void)updateRaiseGesture;
- (void)updateTyping;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviewsForTranscriptCollectionViewController:(id)a3;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKNotificationChatController

- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "showFullScreenAcknowledgmentPickerForChatItem", buf, 2u);
    }
  }
  v6 = [(CKCoreChatController *)self chat];
  [v6 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B930]];
  [(CKScrollViewController *)self beginHoldingScrollGeometryUpdatesForReason:@"FullscreenBalloonMenuVisible"];
  v7 = [(CKNotificationChatController *)self notificationFullScreenBalloonController];

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Dismissing fullscreen balloon", v18, 2u);
      }
    }
    [(CKNotificationChatController *)self _dismissFullScreenBubbleViewControllerAnimated:1 withSendAnimation:0 completion:0];
  }
  v9 = [(CKCoreChatController *)self _fullScreenBalloonViewControllerWithChatItem:v4];
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Created fullscreen balloon", v17, 2u);
    }
  }
  [(CKNotificationChatController *)self addChildViewController:v9];
  v11 = [(CKNotificationChatController *)self view];
  v12 = [v9 view];
  [v11 addSubview:v12];

  v13 = [v9 view];
  v14 = [(CKCoreChatController *)self collectionView];
  [v14 frame];
  objc_msgSend(v13, "setFrame:");

  [v9 didMoveToParentViewController:self];
  [(CKNotificationChatController *)self setNotificationFullScreenBalloonController:v9];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Setup fullscreen balloon", v16, 2u);
    }
  }
}

- (void)_allowedByScreenTimeChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 object];
    uint64_t v8 = [v7 allowedByScreenTime];
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = @"NO";
        if (v8) {
          v10 = @"YES";
        }
        int v11 = 138412546;
        v12 = v7;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "chat: %@ allowedByScreenTime state changed to: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    [(CKNotificationChatController *)self setAllowedByScreenTime:v8];
  }
}

- (double)balloonMaxWidth
{
  v3 = [(CKNotificationChatController *)self view];
  [v3 frame];
  double v5 = v4;

  [(CKNotificationChatController *)self systemMinimumLayoutMargins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(CKNotificationChatController *)self view];
  uint64_t v15 = [v14 effectiveUserInterfaceLayoutDirection];
  if (v15) {
    double v16 = v13;
  }
  else {
    double v16 = v9;
  }
  if (!v15) {
    double v9 = v13;
  }

  v17 = [(CKCoreChatController *)self chat];
  int v18 = [v17 isStewieChat];

  v19 = [(CKCoreChatController *)self conversation];
  v20 = [v19 sendingService];
  uint64_t v21 = v18 | objc_msgSend(v20, "__ck_isiMessageLite");

  v22 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v22, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", -[CKNotificationChatController pluginButtonsEnabled](self, "pluginButtonsEnabled"), CKShowCharacterCountEnabled(v21) != 0, 0, v21, v5, v7, v16, v11, v9);
  double v24 = v23;

  return v24;
}

- (void)_setConversationDeferredSetup
{
  v6.receiver = self;
  v6.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v6 _setConversationDeferredSetup];
  if (+[CKRaiseGesture isRaiseGestureSupported])
  {
    v3 = [[CKRaiseGesture alloc] initWithTarget:self action:sel_raiseGestureRecognized_];
    [(CKNotificationChatController *)self setRaiseGesture:v3];
    [(CKNotificationChatController *)self updateRaiseGesture];
  }
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_backgroundViewTapGestureRecognized_];
  double v5 = [(CKCoreChatController *)self collectionView];
  [v5 addGestureRecognizer:v4];
}

- (void)sendComposition:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CKCoreChatController *)self isSendingMessage])
  {
    objc_super v6 = [(CKCoreChatController *)self conversation];
    [v6 resetCaches];
    if ([v4 hasContent])
    {
      double v7 = [v6 recipients];
      int v8 = [v6 canSendToRecipients:v7 alertIfUnable:1];

      if (v8)
      {
        id v32 = 0;
        char v9 = [v6 canSendComposition:v4 error:&v32];
        id v10 = v32;
        double v11 = v10;
        if (v9)
        {
          double v12 = [MEMORY[0x1E4F42B08] activeKeyboard];
          [v12 removeAutocorrectPrompt];

          [(CKNotificationChatController *)self setSendingMessage:1];
          double v13 = [v6 messageWithComposition:v4];
          [v6 setUnsentComposition:0];
          [v6 sendMessage:v13 newComposition:0];
          v14 = [(CKNotificationChatController *)self entryView];
          uint64_t v15 = [v14 composition];
          int v16 = [v15 isEqual:v4];

          if (v16)
          {
            v17 = [(CKNotificationChatController *)self entryView];
            [v17 setComposition:0];
          }
          [(CKNotificationChatController *)self setSendingMessage:0];
          int v18 = [v4 expressiveSendStyleID];
          BOOL v19 = +[CKImpactEffectManager identifierIsAnimatedImpactEffect:v18];

          if (v19)
          {
            v20 = [(CKCoreChatController *)self collectionViewController];
            uint64_t v21 = [v20 impactEffectManager];
            v34[0] = v13;
            v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
            [v21 animateMessages:v22];
          }
          double v23 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          int v24 = [v23 isExpressiveTextEnabled];

          if (!v24) {
            goto LABEL_21;
          }
          v25 = [(CKNotificationChatController *)self entryView];
          v26 = [v25 contentView];
          v27 = [v26 textView];

          [v27 hideTextEffectsPickerIfNeededAndResetTypingAttributes];
        }
        else
        {
          if (!v10)
          {
LABEL_22:

            goto LABEL_23;
          }
          v28 = CKFrameworkBundle();
          double v13 = [v28 localizedStringForKey:@"CANNOT_SEND_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

          v29 = CKFrameworkBundle();
          v27 = [v29 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];

          v30 = CKCreateAlertControllerWithError(v11, v13, 0, v27, 0);
          if (v30)
          {
            v31 = [(CKCoreChatController *)self delegate];
            [v30 presentFromViewController:v31 animated:1 completion:0];
          }
        }

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      [(CKNotificationChatController *)self messageEntryViewDidChange:0 isTextChange:1 isShelfChange:0];
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Tried sending a message with another send in flight", buf, 2u);
    }
  }
LABEL_24:
}

- (void)backgroundViewTapGestureRecognized:(id)a3
{
  id v4 = [(CKCoreChatController *)self delegate];
  [v4 transcriptBackgroundTapped:self];
}

- (void)messageEntryViewRecordingDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(CKCoreChatController *)self collectionViewController];
  [v5 stopPlayingAudio];

  objc_super v6 = [(CKNotificationChatController *)self typingUpdater];
  [v6 setNeedsUpdate];

  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "messageEntryViewRecordingDidChange: ", v8, 2u);
    }
  }
}

- (BOOL)shouldShowEntryView
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL v18 = [(CKNotificationChatController *)self shouldAllowReplyFromLockScreen];
      id v4 = [(CKCoreChatController *)self conversation];
      if ([v4 hasLeftGroupChat]) {
        double v5 = @"YES";
      }
      else {
        double v5 = @"NO";
      }
      objc_super v6 = [(CKCoreChatController *)self conversation];
      if ([v6 isReadOnlyChat]) {
        double v7 = @"YES";
      }
      else {
        double v7 = @"NO";
      }
      int v8 = [(CKCoreChatController *)self conversation];
      int v9 = [v8 isBusinessChatDisabled];
      BOOL v10 = [(CKCoreChatController *)self shouldDisplayTextEntry];
      if (v9) {
        double v11 = @"YES";
      }
      else {
        double v11 = @"NO";
      }
      *(_DWORD *)buf = 67110146;
      BOOL v20 = v18;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2112;
      int v24 = v7;
      __int16 v25 = 2112;
      v26 = v11;
      __int16 v27 = 1024;
      BOOL v28 = v10;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "allow reply: %d has left: %@, read only: %@, isBusinessChatDisabled: %@, should display text entry: %d", buf, 0x2Cu);
    }
  }
  if (![(CKNotificationChatController *)self shouldAllowReplyFromLockScreen]) {
    return 0;
  }
  double v12 = [(CKCoreChatController *)self conversation];
  if ([v12 hasLeftGroupChat])
  {
    char v13 = 0;
  }
  else
  {
    v14 = [(CKCoreChatController *)self conversation];
    if (([v14 isReadOnlyChat] & 1) != 0
      || ![(CKCoreChatController *)self shouldDisplayTextEntry])
    {
      char v13 = 0;
    }
    else
    {
      uint64_t v15 = [(CKCoreChatController *)self conversation];
      char v16 = [v15 isBusinessChatDisabled];

      char v13 = v16 ^ 1;
    }
  }
  return v13;
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    double v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "chatItemTapped balloonView = %@, chatItem = %@", (uint8_t *)&v28, 0x16u);
    }
  }
  double v12 = objc_opt_class();
  if ([v12 isEqual:objc_opt_class()])
  {
    id v13 = v10;
    v14 = [v13 bundleIdentifier];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F6CC10]];

    if (!v15)
    {
LABEL_28:

      goto LABEL_29;
    }
    char v16 = [v13 IMChatItem];
    v17 = v16;
    if (v16)
    {
      BOOL v18 = [v16 dataSource];

      if (v18)
      {
        BOOL v19 = [v17 dataSource];
        BOOL v20 = [v19 URLToOpenOnTapAction];
        __int16 v21 = [v17 dataSource];
        v22 = v21;
        if (v20) {
          [v21 URLToOpenOnTapAction];
        }
        else {
        int v24 = [v21 url];
        }

        if (v24)
        {
          __int16 v25 = [(CKNotificationChatController *)self urlOpenContext];
          [v25 openURL:v24 completionHandler:&__block_literal_global_228];
        }
        else if (IMOSLoggingEnabled())
        {
          v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            __int16 v27 = [v17 dataSource];
            int v28 = 138412290;
            id v29 = v27;
            _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "URLToOpenOnTapAction was nil %@", (uint8_t *)&v28, 0xCu);
          }
        }

        goto LABEL_27;
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "dataSource was nil", (uint8_t *)&v28, 2u);
        }
LABEL_14:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "imChatItem was nil", (uint8_t *)&v28, 2u);
      }
      goto LABEL_14;
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:
}

- (void)viewDidLayoutSubviewsForTranscriptCollectionViewController:(id)a3
{
  id v4 = [(CKNotificationChatController *)self notificationFullScreenBalloonController];

  if (v4)
  {
    id v5 = [(CKNotificationChatController *)self notificationFullScreenBalloonController];
    [v5 updateBalloonViewFrame];
  }
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 longPressedForItemWithIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    double v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "longPressedForItemWithIndexPath", buf, 2u);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v12 transcriptCollectionViewController:v8 balloonView:v9 longPressedForItemWithIndexPath:v10];
}

- (BOOL)inputAccessoryViewControllerEnabled
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = CKInputAccessoryViewControllerEnabled();
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "input accessory view enabled: %d", (uint8_t *)v4, 8u);
    }
  }
  return CKInputAccessoryViewControllerEnabled() != 0;
}

void __68__CKNotificationChatController__messageReceivedInCurrentTranscript___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  if (a2 == 5)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(48);
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [*(id *)(a1 + 32) guid];
        if (v5)
        {
          id v10 = [v5 userInfo];
        }
        else
        {
          id v10 = &stru_1EDE4CA38;
        }
        *(_DWORD *)buf = 138412546;
        id v14 = v9;
        __int16 v15 = 2112;
        char v16 = v10;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Error playing alert for guid [%@]: [%@]", buf, 0x16u);
        if (v5) {
      }
        }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      double v11 = [*(id *)(a1 + 32) guid];
      if (v5)
      {
        objc_super v12 = [v5 userInfo];
        _CKLogExternal();
      }
      else
      {
        _CKLogExternal();
      }
    }
  }
}

- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewControllerHandleDismissTap:", buf, 2u);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__CKNotificationChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  uint64_t v6 = _Block_copy(aBlock);
  double v7 = [(CKNotificationChatController *)self notificationFullScreenBalloonController];
  [v7 performCancelAnimationWithCompletion:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F6B9A8];
  double v7 = [(CKCoreChatController *)self conversation];
  id v8 = [v7 chat];
  [v5 removeObserver:self name:v6 object:v8];

  v12.receiver = self;
  v12.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v12 viewWillDisappear:v3];
  [(CKNotificationChatController *)self updateRaiseGesture];
  [(CKNotificationChatController *)self unregisterForTextInputPayloadHandling];
  id v9 = [(CKNotificationChatController *)self notificationFullScreenBalloonController];

  if (v9) {
    [(CKNotificationChatController *)self _dismissFullScreenBubbleViewControllerAnimated:1 withSendAnimation:0 completion:0];
  }
  [(NSTimer *)self->_notificationViewDismissalTimer invalidate];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "viewWillDisappear: ", v11, 2u);
    }
  }
}

- (void)updateRaiseGesture
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKCoreChatController *)self collectionViewController];
  if ([(CKViewController *)self appeared])
  {
    if ([v3 canRaiseToListen]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v3 canRaiseToTalk];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if ([(CKViewController *)self appeared]) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      int v7 = [v3 canRaiseToListen];
      int v8 = [v3 canRaiseToTalk];
      if (v7) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      *(_DWORD *)objc_super v12 = 138412802;
      if (v8) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      *(void *)&v12[4] = v6;
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      char v16 = v10;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Updating raise gesture, appeared %@, canRaiseToListen %@, canRaiseToTalk %@", v12, 0x20u);
    }
  }
  double v11 = [(CKNotificationChatController *)self raiseGesture];
  [v11 setEnabled:v4];
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  if (self->_allowedByScreenTime != a3)
  {
    self->_allowedByScreenTime = a3;
    if (a3)
    {
      uint64_t v4 = [(CKNotificationChatController *)self lockoutViewController];
      id v5 = [v4 view];
      [v5 removeFromSuperview];

      [(CKNotificationChatController *)self setLockoutViewController:0];
      [(CKNotificationChatController *)self becomeFirstResponder];
      [(CKNotificationChatController *)self reloadInputViews];
    }
    else
    {
      uint64_t v6 = [(CKCoreChatController *)self collectionView];
      [v6 resignFirstResponder];

      int v7 = [(CKCoreChatController *)self conversation];
      int v8 = [v7 chat];
      id v18 = [v8 conversationContext];

      id v9 = [(CKNotificationChatController *)self lockoutViewControllerClass];
      if (v18)
      {
        id v10 = [(CKCoreChatController *)self conversation];
        double v11 = [v10 contactNameByHandle];
        objc_super v12 = [(objc_class *)v9 lockoutViewControllerWithConversationContext:v18 bundleIdentifier:@"com.apple.MobileSMS" contactStore:0 applicationName:0 contactNameByHandle:v11];
        [(CKNotificationChatController *)self setLockoutViewController:v12];
      }
      else
      {
        id v10 = [(CKCoreChatController *)self _handleIDsForCurrentConversation];
        double v11 = [(CKCoreChatController *)self conversation];
        objc_super v12 = [v11 contactNameByHandle];
        __int16 v13 = [(objc_class *)v9 lockoutViewControllerWithBundleIdentifier:@"com.apple.MobileSMS" contactsHandles:v10 contactNameByHandle:v12];
        [(CKNotificationChatController *)self setLockoutViewController:v13];
      }
      id v14 = [(CKNotificationChatController *)self lockoutViewController];
      __int16 v15 = [v14 view];

      char v16 = [(CKNotificationChatController *)self view];
      [v16 addSubview:v15];

      uint64_t v17 = [(CKNotificationChatController *)self view];
      [v17 bounds];
      objc_msgSend(v15, "setFrame:");

      [v15 setAutoresizingMask:18];
    }
  }
}

- (id)inputContextHistoryForMessageEntryView:(id)a3
{
  uint64_t v4 = [(CKCoreChatController *)self conversation];
  if ([v4 isKnownSender])
  {
    id v5 = [(CKCoreChatController *)self collectionViewController];
    uint64_t v6 = [v5 inputContextHistory];
  }
  else
  {
    int v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Not providing input context history because conversation is with an unknown sender.", v9, 2u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (void)registerForTextInputPayloadHandling
{
  v5[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F42F20] sharedInstance];
  v5[0] = @"com.apple.messages.currentLocation";
  v5[1] = @"com.apple.messages.stageSticker";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v3 setSupportedPayloadIds:v4];

  [v3 setPayloadDelegate:self];
}

- (void)unregisterForTextInputPayloadHandling
{
  id v2 = [MEMORY[0x1E4F42F20] sharedInstance];
  [v2 setPayloadDelegate:0];
  [v2 setSupportedPayloadIds:MEMORY[0x1E4F1CBF0]];
}

- (void)handlePayload:(id)a3 withPayloadId:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"com.apple.messages.currentLocation"])
    {
      CKSendCurrentLocation(self);
    }
    else if ([v8 isEqualToString:@"com.apple.messages.stageSticker"])
    {
      [(CKNotificationChatController *)self _handleStickerTextInputPayload:v6];
    }
    else if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        double v11 = v8;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Unhandled text input payload ID: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)_handleStickerTextInputPayload:(id)a3
{
  uint64_t v4 = _UIStickerCreateStickerFromTextInputPayload();
  id v5 = [v4 representations];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_msgSend(v4, "_ck_plainStringEmojiText");
    if ([v7 length])
    {
      int v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Handling received sticker payload as plain string system emoji text", buf, 2u);
      }

      id v9 = [(CKNotificationChatController *)self entryView];
      int v10 = [v9 contentView];
      double v11 = [v10 textView];

      [v11 insertText:v7];
LABEL_16:

      goto LABEL_17;
    }
    BOOL v19 = [(CKCoreChatController *)self conversation];
    int v20 = [v19 supportsInlineAdaptiveImageGlyphs];

    int v21 = objc_msgSend(v4, "_ck_shouldInsertInCompositionAsAdaptiveImageGlyph");
    v22 = IMLogHandleForCategory();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if (!v20 || !v21)
    {
      if (v23)
      {
        *(_WORD *)__int16 v25 = 0;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Received sticker payload cannot be inserted as an adaptive image glyph, launching messages app", v25, 2u);
      }

      int v24 = [(CKCoreChatController *)self conversation];
      double v11 = [v24 chat];

      [(CKNotificationChatController *)self _openMessagesForChat:v11];
      goto LABEL_16;
    }
    if (v23)
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Handling received sticker payload as an adaptive image glyph", v26, 2u);
    }

    [(CKNotificationChatController *)self insertUIStickerAsAdaptiveImageGlyph:v4];
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKNotificationChatController(TextInputPayloadsInternal) _handleStickerTextInputPayload:](v7, v12, v13, v14, v15, v16, v17, v18);
    }
  }
LABEL_17:
}

- (void)insertUIStickerAsAdaptiveImageGlyph:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __95__CKNotificationChatController_TextInputPayloadsInternal__insertUIStickerAsAdaptiveImageGlyph___block_invoke;
    void v5[3] = &unk_1E5624AF0;
    v5[4] = self;
    objc_msgSend(v4, "stk_renderBakedInRepIfNecessaryWithCompletion:", v5);
  }
  else
  {
    [(CKNotificationChatController *)self _insertUIStickerAsAdaptiveImageGlyph:v4];
  }
}

void __95__CKNotificationChatController_TextInputPayloadsInternal__insertUIStickerAsAdaptiveImageGlyph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__CKNotificationChatController_TextInputPayloadsInternal__insertUIStickerAsAdaptiveImageGlyph___block_invoke_2;
  void v5[3] = &unk_1E5620AF8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __95__CKNotificationChatController_TextInputPayloadsInternal__insertUIStickerAsAdaptiveImageGlyph___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertUIStickerAsAdaptiveImageGlyph:*(void *)(a1 + 40)];
}

- (void)_insertUIStickerAsAdaptiveImageGlyph:(id)a3
{
  id v4 = a3;
  id v5 = _UIStickerCreateAdaptiveImageGlyphFromSticker();
  if (v5)
  {
    id v6 = [(CKNotificationChatController *)self entryView];
    id v7 = [v6 contentView];
    int v8 = [v7 textView];

    id v9 = [v8 existingMediaObjectMatchingAdaptiveImageGlyph:v5];
    if (!v9)
    {
      int v10 = (void *)[objc_alloc(MEMORY[0x1E4F6EA58]) initWithUISticker:v4 adaptiveImageGlyph:v5];
      double v11 = +[CKMediaObjectManager sharedInstance];
      uint64_t v12 = [v11 mediaObjectWithSticker:v10 stickerUserInfo:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v12;
      }
      else
      {
        int v20 = IMLogHandleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CKNotificationChatController(TextInputPayloadsInternal) _insertUIStickerAsAdaptiveImageGlyph:](v20, v21, v22, v23, v24, v25, v26, v27);
        }

        id v9 = 0;
      }
    }
    [v8 insertAdaptiveImageGlyph:v5 withMediaObject:v9];
  }
  else
  {
    int v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKNotificationChatController(TextInputPayloadsInternal) _insertUIStickerAsAdaptiveImageGlyph:](v8, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (CKNotificationChatController)initWithConversation:(id)a3 entryViewTraitCollection:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v62 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v7 startTimingForKey:@"longlook-init"];
  v63.receiver = self;
  v63.super_class = (Class)CKNotificationChatController;
  int v8 = [(CKCoreChatController *)&v63 initWithConversation:v6];
  id v9 = v8;
  if (v8)
  {
    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v8->_lastKnownKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v8->_lastKnownKeyboardFrame.size = v10;
    -[CKNotificationChatController setAllowedByScreenTime:](v8, "setAllowedByScreenTime:", [v6 isBlockedByCommunicationLimits] ^ 1);
    v61 = [[CKScheduledUpdater alloc] initWithTarget:v9 action:sel_updateTyping];
    [(CKNotificationChatController *)v9 setTypingUpdater:v61];
    double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v9 selector:sel__raiseToListenSettingChanged_ name:CKPreferenceRaiseToListenDidChangeNotification object:0];

    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = [(CKCoreChatController *)v9 conversation];
    uint64_t v14 = [v13 chat];
    [v12 addObserver:v9 selector:sel__messageReceivedInCurrentTranscript_ name:*MEMORY[0x1E4F6B9A8] object:v14];

    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = [(CKCoreChatController *)v9 conversation];
    uint64_t v17 = [v16 chat];
    [v15 addObserver:v9 selector:sel__allowedByScreenTimeChanged_ name:*MEMORY[0x1E4F6B888] object:v17];

    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel__handleKeyboardDidChangeFrameNotification_ name:*MEMORY[0x1E4F43AB8] object:0];

    uint64_t v19 = [v6 lastAddressedHandle];
    int v20 = [v6 lastAddressedSIMID];
    BOOL AddressedHandle = CKShowSubjectEnabledForLastAddressedHandle(v19, v20);

    uint64_t v22 = [v6 chat];
    int v23 = [v22 isStewieChat];

    [(CKNotificationChatController *)v9 systemMinimumLayoutMargins];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    uint64_t v32 = [(CKNotificationChatController *)v9 view];
    uint64_t v33 = [v32 effectiveUserInterfaceLayoutDirection];
    if (v33) {
      double v34 = v31;
    }
    else {
      double v34 = v27;
    }
    if (!v33) {
      double v27 = v31;
    }

    v35 = [(CKNotificationChatController *)v9 view];
    [v35 bounds];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    v44 = [(CKNotificationChatController *)v9 traitCollection];
    v45 = [MEMORY[0x1E4F43058] keyWindow];
    v46 = [v45 windowScene];
    int v47 = [v46 _enhancedWindowingEnabled];

    if (v47)
    {
      id v48 = v62;

      v44 = v48;
    }
    v49 = [v6 chat];
    char v50 = [v49 supportsCapabilities:0x8000];

    BYTE3(v60) = v50 ^ 1;
    BYTE2(v60) = 0;
    BYTE1(v60) = v23;
    LOBYTE(v60) = v23;
    v51 = -[CKMessageEntryView initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:]([CKMessageEntryView alloc], "initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", 0, 1, AddressedHandle & ~v23, [(CKNotificationChatController *)v9 pluginButtonsEnabled], CKShowCharacterCountEnabled(v23) != 0, v44, v37, v39, v41, v43, v25, v34, v29, v27, v60);
    v52 = [CKMentionsController alloc];
    v53 = [(CKMessageEntryView *)v51 contentView];
    v54 = [v53 textView];
    v55 = [(CKCoreChatController *)v9 conversation];
    v56 = [(CKMentionsController *)v52 initWithEntryTextView:v54 conversation:v55];
    [(CKNotificationChatController *)v9 setMentionsController:v56];

    [(CKMessageEntryView *)v51 setAutoresizingMask:2];
    [(CKMessageEntryView *)v51 setDelegate:v9];
    [(CKMessageEntryView *)v51 setInputDelegate:v9];
    v57 = [(CKCoreChatController *)v9 conversation];
    [(CKMessageEntryView *)v51 setConversation:v57];

    [(CKMessageEntryView *)v51 setSendingMessage:[(CKCoreChatController *)v9 isSendingMessage]];
    [(CKMessageEntryView *)v51 layoutIfNeeded];
    [(CKNotificationChatController *)v9 setEntryView:v51];
    [(CKNotificationChatController *)v9 _updateEntryViewFrameIfNeeded:0];
    [(CKNotificationChatController *)v9 _setupShouldShowReplyFromLockScreen];
  }
  [v7 stopTimingForKey:@"longlook-init"];
  if (IMOSLoggingEnabled())
  {
    v58 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v65 = v7;
      __int16 v66 = 2112;
      id v67 = v6;
      _os_log_impl(&dword_18EF18000, v58, OS_LOG_TYPE_INFO, "Initialized long look notification chatController: %@, with conversation: %@", buf, 0x16u);
    }
  }
  return v9;
}

- (void)dealloc
{
  id v3 = [(CKNotificationChatController *)self typingUpdater];
  [v3 invalidate];

  [(CKNotificationChatController *)self setTypingUpdater:0];
  v4.receiver = self;
  v4.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v4 dealloc];
}

- (id)launchURLForInputMode:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v6 = [(CKCoreChatController *)self conversation];
  id v7 = [v6 chat];
  int v8 = [(CKNotificationChatController *)self entryView];
  id v9 = [v8 composition];
  CGSize v10 = [v9 text];
  double v11 = [v10 string];
  uint64_t v12 = [v5 messagesURLWithChat:v7 orHandles:0 withMessageText:v11];

  if ([v4 length])
  {
    uint64_t v13 = [MEMORY[0x1E4F29088] componentsWithURL:v12 resolvingAgainstBaseURL:0];
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v15 = [v13 queryItems];
    uint64_t v16 = [v14 arrayWithArray:v15];

    uint64_t v17 = [MEMORY[0x1E4F290C8] queryItemWithName:@"inputmode" value:v4];
    [v16 addObject:v17];

    [v13 setQueryItems:v16];
    uint64_t v18 = [v13 URL];

    uint64_t v12 = (void *)v18;
  }

  return v12;
}

- (BOOL)wantsWindowedPresentation
{
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (BOOL)forceWindowedPresentation
{
  return 0;
}

- (BOOL)messageEntryViewShouldVerticallyInsetForPresentedAppCard:(id)a3
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSExtensionContext)urlOpenContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_urlOpenContext);

  return (NSExtensionContext *)WeakRetained;
}

- (id)inputAccessoryViewController
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(CKNotificationChatController *)self shouldShowEntryView]
    && [(CKNotificationChatController *)self inputAccessoryViewControllerEnabled])
  {
    id v3 = [(CKNotificationChatController *)self entryViewController];
  }
  else
  {
    id v3 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "input accessory view controller: %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return v3;
}

- (id)inputAccessoryView
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(CKNotificationChatController *)self shouldShowEntryView]
    && ![(CKNotificationChatController *)self inputAccessoryViewControllerEnabled])
  {
    id v3 = [(CKNotificationChatController *)self entryView];
  }
  else
  {
    id v3 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "input accessory view: %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return v3;
}

- (void)setSendingMessage:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController setSendingMessage:](&v6, sel_setSendingMessage_);
  id v5 = [(CKNotificationChatController *)self entryView];
  [v5 setSendingMessage:v3];
}

- (void)setEntryView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [[CKMessageEntryViewController alloc] initWithEntryView:v4];
    [(CKNotificationChatController *)self setEntryViewController:v5];
  }
  else
  {
    [(CKNotificationChatController *)self setEntryViewController:0];
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(CKNotificationChatController *)self entryViewController];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Setting the entry view: entryview = %@, entryViewController = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  BOOL v8 = [(CKNotificationChatController *)self inputAccessoryViewControllerEnabled];
  id v9 = [(CKNotificationChatController *)self entryViewController];
  [v9 setInputAccessoryViewControllerEnabled:v8];
}

- (CKMessageEntryView)entryView
{
  id v2 = [(CKNotificationChatController *)self entryViewController];
  BOOL v3 = [v2 entryView];

  return (CKMessageEntryView *)v3;
}

- (void)_handleKeyboardDidChangeFrameNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F43AF0]];

  id v5 = v6;
  if (v6)
  {
    [v6 CGRectValue];
    -[CKNotificationChatController setLastKnownKeyboardFrame:](self, "setLastKnownKeyboardFrame:");
    id v5 = v6;
  }
}

- (double)_maxEntryViewHeight
{
  BOOL v3 = [(CKNotificationChatController *)self entryView];
  id v4 = [v3 composition];
  int v5 = [v4 hasContent];

  double height = 0.0;
  if (v5)
  {
    if (_maxEntryViewHeight__pred_BKHIDServicesGetNonFlatDeviceOrientationBackBoardServices != -1) {
      dispatch_once(&_maxEntryViewHeight__pred_BKHIDServicesGetNonFlatDeviceOrientationBackBoardServices, &__block_literal_global_126_1);
    }
    uint64_t NonFlatDeviceOrientation = _maxEntryViewHeight__BKHIDServicesGetNonFlatDeviceOrientation();
    BOOL v8 = [MEMORY[0x1E4F43058] keyWindow];
    id v9 = [v8 windowScene];
    int v10 = [v9 _enhancedWindowingEnabled];

    if (v10)
    {
      double height = self->_lastKnownKeyboardFrame.size.height;
    }
    else
    {
      [MEMORY[0x1E4F42B08] sizeForInterfaceOrientation:NonFlatDeviceOrientation ignoreInputView:1];
      double height = v11;
    }
  }
  [v3 placeholderHeight];
  double v13 = v12;
  uint64_t v14 = +[CKUIBehavior sharedBehaviors];
  uint64_t v15 = [v14 entryViewlayoutMetrics];

  [v15 defaultEntryContentViewHeight];
  double v17 = v16;
  [v15 entryViewContentInsets];
  double v19 = v17 - v18;
  [v15 entryViewContentInsets];
  double v21 = v19 - v20;
  uint64_t v22 = [(CKNotificationChatController *)self entryView];
  int v23 = [v22 window];
  [v23 bounds];
  double v25 = v24;
  double v27 = v26;

  objc_msgSend(v3, "sizeThatFits:", v25, 1.79769313e308);
  double v29 = v13 + v21;
  if (v28 < v13 + v21) {
    double v29 = v28;
  }
  double v30 = height + v29;
  if (v30 >= v27) {
    double v30 = v27;
  }
  double v31 = v30 - height;

  return v31;
}

void *__51__CKNotificationChatController__maxEntryViewHeight__block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("BKHIDServicesGetNonFlatDeviceOrientation", @"BackBoardServices");
  _maxEntryViewHeight__BKHIDServicesGetuint64_t NonFlatDeviceOrientation = result;
  return result;
}

- (void)_updateEntryViewFrameIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CKNotificationChatController *)self entryView];
  id v20 = [v5 window];

  id v6 = v20;
  if (v20)
  {
    [v20 bounds];
    double v8 = v7;
    [(CKNotificationChatController *)self _maxEntryViewHeight];
    double v10 = v9;
    double v11 = [(CKNotificationChatController *)self entryView];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;

    id v6 = v20;
    if (v13 != v8 || v15 != v10)
    {
      double v17 = *MEMORY[0x1E4F1DB28];
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v19 = [(CKCoreChatController *)self collectionViewController];
      [v19 scrollTranscriptToEntryViewInsertionTimeWithAnimation:0];

      -[CKNotificationChatController _setEntryViewFrame:animated:](self, "_setEntryViewFrame:animated:", v3, v17, v18, v8, v10);
      id v6 = v20;
    }
  }
}

- (void)_setEntryViewFrame:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CKNotificationChatController__setEntryViewFrame_animated___block_invoke;
  aBlock[3] = &unk_1E5621968;
  aBlock[4] = self;
  CGRect v11 = a3;
  int v5 = _Block_copy(aBlock);
  id v6 = v5;
  if (v4)
  {
    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 resizeMessageEntryViewAnimationDuration];
    double v9 = v8;

    [MEMORY[0x1E4F42FF0] animateWithDuration:2 delay:v6 options:0 animations:v9 completion:0.0];
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

void __60__CKNotificationChatController__setEntryViewFrame_animated___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) entryView];
  [v6 frame];
  if (v3 != *(double *)(a1 + 56) || v2 != *(double *)(a1 + 64))
  {
    objc_msgSend(v6, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    [v6 layoutIfNeeded];
    int v5 = [v6 superview];
    [v5 layoutIfNeeded];
  }
}

- (void)setConversation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v3 setConversation:a3];
}

- (BOOL)pluginButtonsEnabled
{
  double v2 = [(CKCoreChatController *)self chat];
  char v3 = [v2 isStewieChat];

  return v3 ^ 1;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)CKNotificationChatController;
  [(CKNotificationChatController *)&v10 becomeFirstResponder];
  char v3 = [(CKNotificationChatController *)self entryView];
  BOOL v4 = [v3 contentView];
  int v5 = [v4 activeView];
  int v6 = [v5 becomeFirstResponder];

  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = @"NO";
      if (v6) {
        double v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      double v12 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Entry View became FR with success %@", buf, 0xCu);
    }
  }
  return v6;
}

- (void)setLocalUserIsComposing:(BOOL)a3 withPluginBundleID:(id)a4 typingIndicatorData:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  double v9 = [(CKCoreChatController *)self conversation];
  objc_super v10 = v9;
  if (v6) {
    [v9 setLocalUserIsComposing:v11 typingIndicatorIcon:v8];
  }
  else {
    [v9 setLocalUserIsComposing:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "viewWillAppear: ", buf, 2u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v14 viewWillAppear:v3];
  BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
  notificationViewWillAppearDate = self->_notificationViewWillAppearDate;
  self->_notificationViewWillAppearDate = v6;

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v8 = (void *)MEMORY[0x1E4F1CB00];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CKNotificationChatController_viewWillAppear___block_invoke;
  v11[3] = &unk_1E5629740;
  objc_copyWeak(&v12, (id *)buf);
  double v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:v11 block:3600.0];
  notificationViewDismissalTimer = self->_notificationViewDismissalTimer;
  self->_notificationViewDismissalTimer = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __47__CKNotificationChatController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __47__CKNotificationChatController_viewWillAppear___block_invoke_cold_1(v2);
  }

  BOOL v3 = [WeakRetained delegate];
  [v3 notificationChatControllerRequestDismissNotificationContentExtension:WeakRetained];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v6 viewDidAppear:a3];
  [(CKNotificationChatController *)self updateRaiseGesture];
  [(CKNotificationChatController *)self registerForTextInputPayloadHandling];
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "viewDidAppear: ", v5, 2u);
    }
  }
}

- (BOOL)isSafeToMarkAsRead
{
  v8.receiver = self;
  v8.super_class = (Class)CKNotificationChatController;
  if (![(CKCoreChatController *)&v8 isSafeToMarkAsRead]) {
    return 0;
  }
  notificationViewWillAppearDate = self->_notificationViewWillAppearDate;
  BOOL v4 = notificationViewWillAppearDate == 0;
  if (notificationViewWillAppearDate)
  {
    [(NSDate *)notificationViewWillAppearDate timeIntervalSinceNow];
    if (v5 >= -3600.0) {
      return 1;
    }
    objc_super v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CKNotificationChatController isSafeToMarkAsRead](v6);
    }
  }
  else
  {
    objc_super v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CKNotificationChatController isSafeToMarkAsRead](v6);
    }
  }

  return v4;
}

- (void)viewLayoutMarginsDidChange
{
  v19.receiver = self;
  v19.super_class = (Class)CKNotificationChatController;
  [(CKNotificationChatController *)&v19 viewLayoutMarginsDidChange];
  [(CKNotificationChatController *)self balloonMaxWidth];
  double v4 = v3;
  [(CKNotificationChatController *)self systemMinimumLayoutMargins];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(CKNotificationChatController *)self view];
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

  double v16 = [(CKCoreChatController *)self collectionViewController];
  double v17 = [(CKNotificationChatController *)self traitCollection];
  objc_msgSend(v16, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v17, v4, v6, v15, v10, v8);

  double v18 = [v16 viewIfLoaded];
  [v18 setNeedsLayout];
}

- (void)_setupShouldShowReplyFromLockScreen
{
  CFPreferencesSynchronize(@"com.apple.mobilephone", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"LockScreenMessaging", @"com.apple.mobilephone", &keyExistsAndHasValidFormat);
  int v4 = keyExistsAndHasValidFormat;
  double v5 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  int v6 = [v5 isUnderFirstDataProtectionLock];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Under first unlock. Not allowing lock screen messaging", v9, 2u);
      }
    }
    goto LABEL_8;
  }
  uint64_t v8 = 1;
  if (v4 && !AppBooleanValue) {
LABEL_8:
  }
    uint64_t v8 = [(CKNotificationChatController *)self _deviceIsPasscodeLocked] ^ 1;
  [(CKNotificationChatController *)self setShouldAllowReplyFromLockScreen:v8];
}

- (void)_messageReceivedInCurrentTranscript:(id)a3
{
  id v3 = a3;
  int v4 = [v3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4F6BA98]];

  int v6 = [CKEntity alloc];
  double v7 = [v5 sender];
  uint64_t v8 = [(CKEntity *)v6 initWithIMHandle:v7];

  double v9 = (void *)[objc_alloc(MEMORY[0x1E4FAF5E8]) initWithType:3];
  double v10 = [(CKEntity *)v8 textToneIdentifier];
  double v11 = (void *)*MEMORY[0x1E4FAF638];
  if ([v10 isEqualToString:*MEMORY[0x1E4FAF638]]) {
    double v12 = v11;
  }
  else {
    double v12 = 0;
  }
  id v13 = v12;

  uint64_t v14 = [(CKEntity *)v8 textVibrationIdentifier];
  double v15 = (void *)*MEMORY[0x1E4FAF640];
  if ([v14 isEqualToString:*MEMORY[0x1E4FAF640]]) {
    double v16 = v15;
  }
  else {
    double v16 = 0;
  }
  id v17 = v16;

  [v9 setVibrationIdentifier:v17];
  [v9 setToneIdentifier:v13];
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = __Block_byref_object_copy__66;
  double v27 = __Block_byref_object_dispose__66;
  id v28 = 0;
  id v28 = [MEMORY[0x1E4FAF5E0] alertWithConfiguration:v9];
  double v18 = (void *)v24[5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__CKNotificationChatController__messageReceivedInCurrentTranscript___block_invoke;
  v20[3] = &unk_1E562B490;
  uint64_t v22 = &v23;
  id v19 = v5;
  id v21 = v19;
  [v18 playWithCompletionHandler:v20];

  _Block_object_dispose(&v23, 8);
}

- (id)progressBar
{
  return 0;
}

- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3
{
  return 1;
}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  id v5 = [(CKCoreChatController *)self delegate];
  [v5 notificationChatControllerSizeUpdated:self];
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 didRequestReaderViewControllerForChatItem:(id)a5
{
  int v6 = [(CKCoreChatController *)self conversation];
  id v7 = [v6 chat];

  [(CKNotificationChatController *)self _openMessagesForChat:v7];
}

- (CGRect)effectiveVisibleRectOfCollectionViewForTranscriptCollectionViewController:(id)a3
{
  id v3 = [(CKCoreChatController *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 adjustedContentInset];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)messageEntryViewActiveSendMenuPresentation:(id)a3
{
  return 0;
}

- (void)messageEntryViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  double v18 = [v17 composition];
  if (([v18 isAudioComposition] & 1) == 0)
  {
    double v6 = [v18 mediaObjects];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = [*(id *)(*((void *)&v20 + 1) + 8 * v9) transfer];
          int v11 = [v10 isAdaptiveImageGlyph];
          double v12 = IMLogHandleForCategory();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
          if (v11)
          {
            if (v13)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Not launching app for inserted media object that is an adaptive image glyph.", buf, 2u);
            }
          }
          else
          {
            if (v13)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Launching app for inserted media object.", buf, 2u);
            }

            double v14 = [(CKCoreChatController *)self conversation];
            double v12 = [v14 chat];

            [(CKNotificationChatController *)self _openMessagesForChat:v12];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  double v15 = [(CKNotificationChatController *)self typingUpdater];
  [v15 setNeedsUpdate];

  [(CKNotificationChatController *)self _updateEntryViewFrameIfNeeded:0];
  if (IMOSLoggingEnabled())
  {
    double v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "messageEntryViewDidChange:isTextChange:isShelfChange:", buf, 2u);
    }
  }
}

- (void)_openMessagesForChat:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKNotificationChatController *)self _saveDraftForCurrentComposition];
  double v5 = (void *)MEMORY[0x1E4F1CB10];
  double v6 = [v4 chatIdentifier];

  uint64_t v7 = objc_msgSend(v5, "__im_URLForChatIdentifier:entryBody:", v6, 0);

  uint64_t v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v14 = v7;
    _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Launching messages with chat URL: %@", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F42738] sharedApplication];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__CKNotificationChatController__openMessagesForChat___block_invoke;
  v11[3] = &unk_1E5620BF0;
  id v12 = v7;
  id v10 = v7;
  [v9 openURL:v10 withCompletionHandler:v11];
}

void __53__CKNotificationChatController__openMessagesForChat___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__CKNotificationChatController__openMessagesForChat___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }

    id v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"sms://"];
    int v11 = [MEMORY[0x1E4F42738] sharedApplication];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__CKNotificationChatController__openMessagesForChat___block_invoke_190;
    v13[3] = &unk_1E5620BF0;
    id v14 = v10;
    id v12 = v10;
    [v11 openURL:v12 withCompletionHandler:v13];
  }
}

void __53__CKNotificationChatController__openMessagesForChat___block_invoke_190(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__CKNotificationChatController__openMessagesForChat___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)messageEntryViewShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)messageEntryViewDidBeginEditingNotAlreadyActive:(id)a3
{
  id v3 = [(CKCoreChatController *)self collectionViewController];
  [v3 scrollTranscriptToEntryViewInsertionTimeWithAnimation:1];
}

- (void)_saveDraftForCurrentComposition
{
  id v8 = +[CKDraftManager sharedInstance];
  id v3 = [(CKCoreChatController *)self conversation];
  uint64_t v4 = [(CKNotificationChatController *)self entryView];
  uint64_t v5 = [v4 composition];
  if ([v5 hasContent])
  {
    [v3 setUnsentComposition:v5];
    [v8 saveCompositionAndFlushCache:1];
    uint64_t v6 = [v4 contentView];
    uint64_t v7 = [v6 textView];
    [v7 checkForMentions];
  }
  else
  {
    [v3 setUnsentComposition:0];
    [v8 saveCompositionAndFlushCache:1];
  }
}

- (BOOL)messageEntryView:(id)a3 shouldInsertMediaObjects:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKCoreChatController *)self conversation];
  uint64_t v9 = [v7 composition];

  id v10 = [v9 compositionByAppendingMediaObjects:v6];

  LOBYTE(v6) = [v8 canSendComposition:v10 error:0];
  return (char)v6;
}

- (void)messageEntryViewSendButtonHit:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__CKNotificationChatController_messageEntryViewSendButtonHit___block_invoke;
  v3[3] = &unk_1E5622818;
  v3[4] = self;
  [a3 compositionWithAcceptedAutocorrection:v3];
}

uint64_t __62__CKNotificationChatController_messageEntryViewSendButtonHit___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendComposition:a2];
}

- (void)messageEntryViewPlusButtonHit:(id)a3
{
  id v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Plus button hit", v4, 2u);
  }
}

- (CGSize)messageEntryViewMaxShelfPluginViewSize:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v4;
  result.width = v3;
  return result;
}

- (Class)lockoutViewControllerClass
{
  double v2 = (void *)CKSTLockoutViewControllerClass;
  if (!CKSTLockoutViewControllerClass)
  {
    double v2 = (void *)MEMORY[0x192FBA860](@"STLockoutViewController", @"ScreenTimeUI");
    CKSTLockoutViewControllerClass = (uint64_t)v2;
  }

  return (Class)v2;
}

- (void)messageEntryViewSafeAreaInsetsDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CKNotificationChatController_messageEntryViewSafeAreaInsetsDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__CKNotificationChatController_messageEntryViewSafeAreaInsetsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEntryViewFrameIfNeeded:0];
}

- (void)messageEntryView:(id)a3 didMoveToWindow:(id)a4
{
}

- (void)messageEntryViewWantsGenerativePlaygroundPluginPresented:(id)a3 presentationStyle:(unint64_t)a4
{
  double v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CKNotificationChatController messageEntryViewWantsGenerativePlaygroundPluginPresented:presentationStyle:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)_launchMessagesForInputMode:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Launching Messages with InputMode=%{public}@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [(CKNotificationChatController *)self urlOpenContext];
  uint64_t v7 = [(CKNotificationChatController *)self launchURLForInputMode:v4];
  [v6 openURL:v7 completionHandler:&__block_literal_global_200];
}

void __60__CKNotificationChatController__launchMessagesForInputMode___block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  double v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "_launchMessagesForInputMode returned %{BOOL}d", (uint8_t *)v4, 8u);
  }
}

- (void)messageEntryView:(id)a3 didSelectPlusButton:(id)a4
{
}

- (void)messageEntryView:(id)a3 didLongPressPlusButton:(id)a4
{
}

- (void)launchAppFromExtensionWith:(id)a3
{
}

- (BOOL)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:(id)a3
{
  return 1;
}

- (int64_t)messageEntryViewHighLightInputButton:(id)a3
{
  return 0;
}

- (void)messageEntryViewPhotoButtonHit:(id)a3
{
}

- (void)messageEntryViewBrowserButtonHit:(id)a3
{
}

- (void)messageEntryViewHandwritingButtonHit:(id)a3
{
}

- (BOOL)messageEntryShouldHideCaret:(id)a3
{
  return 0;
}

- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4
{
  uint64_t v6 = [(CKNotificationChatController *)self entryView];
  uint64_t v7 = [v6 window];

  if (v7)
  {
    [v7 bounds];
    *(void *)a3 = v8;
    *a4 = 0.0;
  }

  return v7 != 0;
}

- (void)updateTyping
{
  id v7 = [(CKNotificationChatController *)self entryView];
  int v3 = [v7 isRecording];
  id v4 = [(CKCoreChatController *)self conversation];
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 setLocalUserIsRecording:1];
  }
  else
  {
    uint64_t v6 = [v7 composition];
    objc_msgSend(v5, "setLocalUserIsTyping:", objc_msgSend(v6, "hasContent"));
  }
}

- (BOOL)wantsReplyButton
{
  return 0;
}

- (void)raiseGestureRecognized:(id)a3
{
  id v6 = a3;
  id v4 = [(CKCoreChatController *)self conversation];
  char v5 = [v4 isBlockedByCommunicationLimits];

  if ((v5 & 1) == 0) {
    [(CKNotificationChatController *)self __raiseGestureRecognized:v6];
  }
}

- (void)__raiseGestureRecognized:(id)a3
{
  id v10 = a3;
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v5 = [v4 isAudioMessagesEntryViewRecordingEnabled];

  if ((v5 & 1) == 0)
  {
    id v6 = [(CKCoreChatController *)self collectionViewController];
    int v7 = [v6 canRaiseToListen];

    if (v7)
    {
      uint64_t v8 = [(CKCoreChatController *)self collectionViewController];
      [v8 raiseGestureRecognized:v10];
    }
    else if ([v10 isRecognized])
    {
      uint64_t v8 = [(CKNotificationChatController *)self entryView];
      [v8 startRecordingForRaiseGesture];
    }
    else
    {
      uint64_t v9 = [v10 gestureState];
      uint64_t v8 = [(CKNotificationChatController *)self entryView];
      [v8 stopRecordingForRaiseGestureWithFailure:v9 == 2];
    }
  }
}

- (void)_dismissFullScreenBubbleViewControllerAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v6) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      uint64_t v11 = _Block_copy(v8);
      *(_DWORD *)buf = 138412802;
      long long v23 = v10;
      __int16 v24 = 1024;
      BOOL v25 = v5;
      __int16 v26 = 2112;
      double v27 = v11;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated: %@, withSendAnimation: %d, completion %@", buf, 0x1Cu);
    }
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  double v18 = __108__CKNotificationChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke;
  double v19 = &unk_1E5622330;
  long long v20 = self;
  id v21 = v8;
  id v12 = v8;
  BOOL v13 = _Block_copy(&v16);
  id v14 = [(CKNotificationChatController *)self notificationFullScreenBalloonController];
  uint64_t v15 = v14;
  if (v5) {
    [v14 performSendAndCloseAnimationWithCompletion:v13];
  }
  else {
    [v14 performCancelAnimationWithCompletion:v13];
  }
}

uint64_t __108__CKNotificationChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:dismissViewController", v11, 2u);
    }
  }
  int v3 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];
    [v4 willMoveToParentViewController:0];

    BOOL v5 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];
    BOOL v6 = [v5 view];
    [v6 removeFromSuperview];

    int v7 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];
    [v7 didMoveToParentViewController:0];

    [*(id *)(a1 + 32) setNotificationFullScreenBalloonController:0];
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v8 notificationFullScreenBalloonController];
    [v8 removeChildViewController:v9];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setUrlOpenContext:(id)a3
{
}

- (CKFullScreenBalloonViewController)notificationFullScreenBalloonController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationFullScreenBalloonController);

  return (CKFullScreenBalloonViewController *)WeakRetained;
}

- (void)setNotificationFullScreenBalloonController:(id)a3
{
}

- (CKMessageEntryViewController)entryViewController
{
  return self->_entryViewController;
}

- (void)setEntryViewController:(id)a3
{
}

- (CKScheduledUpdater)typingUpdater
{
  return self->_typingUpdater;
}

- (void)setTypingUpdater:(id)a3
{
}

- (CKRaiseGesture)raiseGesture
{
  return self->_raiseGesture;
}

- (void)setRaiseGesture:(id)a3
{
}

- (BOOL)shouldAllowReplyFromLockScreen
{
  return self->_shouldAllowReplyFromLockScreen;
}

- (void)setShouldAllowReplyFromLockScreen:(BOOL)a3
{
  self->_shouldAllowReplyFromLockScreen = a3;
}

- (NSDate)notificationViewWillAppearDate
{
  return self->_notificationViewWillAppearDate;
}

- (void)setNotificationViewWillAppearDate:(id)a3
{
}

- (NSTimer)notificationViewDismissalTimer
{
  return self->_notificationViewDismissalTimer;
}

- (void)setNotificationViewDismissalTimer:(id)a3
{
}

- (CGRect)lastKnownKeyboardFrame
{
  double x = self->_lastKnownKeyboardFrame.origin.x;
  double y = self->_lastKnownKeyboardFrame.origin.y;
  double width = self->_lastKnownKeyboardFrame.size.width;
  double height = self->_lastKnownKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastKnownKeyboardFrame:(CGRect)a3
{
  self->_lastKnownKeyboardFrame = a3;
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
}

- (CKMentionsController)mentionsController
{
  return self->_mentionsController;
}

- (void)setMentionsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_notificationViewDismissalTimer, 0);
  objc_storeStrong((id *)&self->_notificationViewWillAppearDate, 0);
  objc_storeStrong((id *)&self->_raiseGesture, 0);
  objc_storeStrong((id *)&self->_typingUpdater, 0);
  objc_storeStrong((id *)&self->_entryViewController, 0);
  objc_destroyWeak((id *)&self->_notificationFullScreenBalloonController);

  objc_destroyWeak((id *)&self->_urlOpenContext);
}

- (void)fullScreenBalloonViewController:(id)a3 willAppearAnimated:(BOOL)a4
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:willAppearAnimated", v6, 2u);
    }
  }
}

- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:didAppearAnimated", buf, 2u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v8 fullScreenBalloonViewController:v6 didAppearAnimated:v4];
}

- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewControllerDidDisappear", buf, 2u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CKNotificationChatController;
  [(CKCoreChatController *)&v6 fullScreenBalloonViewControllerDidDisappear:v4];
}

void __121__CKNotificationChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];
    [v3 willMoveToParentViewController:0];

    id v4 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];
    BOOL v5 = [v4 view];
    [v5 removeFromSuperview];

    objc_super v6 = [*(id *)(a1 + 32) notificationFullScreenBalloonController];
    [v6 didMoveToParentViewController:0];

    [*(id *)(a1 + 32) setNotificationFullScreenBalloonController:0];
    int v7 = *(void **)(a1 + 32);
    id v8 = [v7 notificationFullScreenBalloonController];
    [v7 removeChildViewController:v8];
  }
}

- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  if (IMOSLoggingEnabled())
  {
    BOOL v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = @"NO";
      *(_DWORD *)uint64_t v16 = 138412802;
      *(void *)&v16[4] = v11;
      if (v8) {
        id v14 = @"YES";
      }
      *(_WORD *)&v16[12] = 2048;
      *(double *)&v16[14] = a4;
      __int16 v17 = 2112;
      double v18 = v14;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController: %@ verticallyScrollTranscriptByAmount: %.2f animated: %@ completion:", v16, 0x20u);
    }
  }
  uint64_t v15 = [(CKCoreChatController *)self collectionViewController];
  [v15 verticallyScrollTranscriptByAmount:v8 animated:v12 completion:a4];
}

void __47__CKNotificationChatController_viewWillAppear___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 3600;
  _os_log_fault_impl(&dword_18EF18000, log, OS_LOG_TYPE_FAULT, "Notification view appeared more than %ld seconds ago. Dismissing notification view.", (uint8_t *)&v1, 0xCu);
}

- (void)isSafeToMarkAsRead
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 3600;
  _os_log_fault_impl(&dword_18EF18000, log, OS_LOG_TYPE_FAULT, "Notification view appeared more than %ld seconds ago. Not allowing message to be marked as read.", (uint8_t *)&v1, 0xCu);
}

void __53__CKNotificationChatController__openMessagesForChat___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)messageEntryViewWantsGenerativePlaygroundPluginPresented:(uint64_t)a3 presentationStyle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end