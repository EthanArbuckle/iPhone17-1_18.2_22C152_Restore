@interface CKQLPreviewController
- (BOOL)canCurrentPreviewItemQuickSave;
- (BOOL)controllerWasDismissed;
- (BOOL)currentPreviewItemIsSaved;
- (BOOL)fullScreenBalloonViewControllerPickerViewUsesBottomTail:(id)a3;
- (BOOL)fullScreenBalloonViewControllerShouldEnableStickerTapbacks:(id)a3;
- (BOOL)fullScreenBalloonViewControllerShouldShowHightlightButton:(id)a3 forChatItem:(id)a4;
- (BOOL)fullScreenBalloonViewControllerShouldShowReplyButton:(id)a3;
- (BOOL)shouldShowTapbackAttributionForFullScreenBalloonViewController:(id)a3;
- (BOOL)shouldShowTapbackPickerForFullScreenBalloonViewController:(id)a3;
- (BOOL)suppressRefetchingCurrentHighQualityImage;
- (CGRect)fullScreenBalloonViewController:(id)a3 balloonFrameForChatItem:(id)a4;
- (CGRect)fullScreenBalloonViewControllerSafeAreaLayoutFrame:(id)a3;
- (CGRect)tapbackButtonFrameForFullScreenBalloonViewController:(id)a3;
- (CGSize)preferredContentSize;
- (CKChatItem)chatItem;
- (CKQLPreviewController)init;
- (CKQLPreviewControllerDelegate)chatControllerPreviewDelegate;
- (UIBarButtonItem)tapbackButton;
- (char)fullScreenBalloonViewControllerAnchorVertialOrientation:(id)a3 withBalloonFrame:(CGRect)a4;
- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3;
- (id)currentChatItem;
- (id)currentPreviewItem;
- (id)fullScreenBalloonViewController:(id)a3 balloonViewForChatItem:(id)a4;
- (id)previewActions;
- (id)replyButton;
- (id)textInputContextIdentifierForFullScreenBalloonViewController:(id)a3;
- (void)_dismissFullScreenBubbleViewController:(id)a3 animated:(BOOL)a4 withSendAnimation:(BOOL)a5 completion:(id)a6;
- (void)_sendTapback:(id)a3 targetChatItem:(id)a4 isRemoval:(BOOL)a5;
- (void)currentPreviewItemDidChange;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)fullScreenBalloonViewController:(id)a3 didDeselectTapback:(id)a4;
- (void)fullScreenBalloonViewController:(id)a3 didSelectTapback:(id)a4;
- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)photoLibraryPersistedSyndicatedAssetSetDidChange;
- (void)replyTapped:(id)a3;
- (void)saveTapped:(id)a3;
- (void)setChatControllerPreviewDelegate:(id)a3;
- (void)setChatItem:(id)a3;
- (void)setControllerWasDismissed:(BOOL)a3;
- (void)setCurrentPreviewItemIsSaved:(BOOL)a3;
- (void)setSuppressRefetchingCurrentHighQualityImage:(BOOL)a3;
- (void)setTapbackButton:(id)a3;
- (void)tapbackTapped:(id)a3;
- (void)updateBarButtonItems;
- (void)updateCurrentPreviewItemIsSaved:(BOOL)a3 valueDidChange:(BOOL *)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKQLPreviewController

- (CKQLPreviewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKQLPreviewController;
  v2 = [(CKQLPreviewController *)&v5 init];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(QLPreviewController *)v2 setPresentationStyle:1];
    [(CKQLPreviewController *)v2 updateBarButtonItems];
    [(CKQLPreviewController *)v2 addObserver:v2 forKeyPath:@"currentPreviewItemIndex" options:3 context:0];
    v3 = [MEMORY[0x1E4F6BD68] sharedInstance];
    [v3 registerPhotoLibraryPersistenceManagerListener:v2];
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"currentPreviewItemIndex"])
  {
    v13 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
    uint64_t v14 = [v13 integerValue];

    v15 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
    uint64_t v16 = [v15 integerValue];

    if (v14 != v16) {
      [(CKQLPreviewController *)self currentPreviewItemDidChange];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKQLPreviewController;
    [(CKQLPreviewController *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)CKQLPreviewController;
  [(QLPreviewController *)&v7 loadView];
  v3 = [(CKQLPreviewController *)self navigationController];
  v4 = [v3 navigationBar];
  objc_super v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 theme];
  objc_msgSend(v4, "setBarStyle:", objc_msgSend(v6, "navBarStyle"));
}

- (void)viewDidAppear:(BOOL)a3
{
  v27.receiver = self;
  v27.super_class = (Class)CKQLPreviewController;
  [(QLPreviewController *)&v27 viewDidAppear:a3];
  v4 = [(CKQLPreviewController *)self presentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    objc_super v7 = [v6 invisibleInkEffectControllerForPreviewController:self];

    v8 = [v7 borrowEffectView];
    v9 = [(CKQLPreviewController *)self view];
    [v9 addSubview:v8];

    [v7 setSuspended:1];
    [v8 bounds];
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(CKQLPreviewController *)self view];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    CGFloat v19 = fmin(v16 / v11, v18 / v13);
    CGAffineTransformMakeScale(&v26, v19, v19);
    [v8 setTransform:&v26];
    objc_msgSend(v8, "setCenter:", v16 * 0.5, v18 * 0.5);
  }
  if ([(CKQLPreviewController *)self controllerWasDismissed])
  {
    v20 = [(QLPreviewController *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
      [v22 previewControllerDidCancelDismiss:self];
    }
    [(CKQLPreviewController *)self setControllerWasDismissed:0];
  }
  v23 = [(QLPreviewController *)self delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    v25 = [(QLPreviewController *)self delegate];
    [v25 previewController:self didTransitionToState:1];
  }
  [(CKQLPreviewController *)self updateBarButtonItems];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController viewWillDisappear:](&v8, sel_viewWillDisappear_);
  if (!a3 && [(CKQLPreviewController *)self isBeingDismissed])
  {
    objc_super v5 = [(QLPreviewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      objc_super v7 = [(QLPreviewController *)self delegate];
      [v7 previewController:self willTransitionToState:3];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKQLPreviewController;
  [(QLPreviewController *)&v7 viewDidDisappear:a3];
  if ([(CKQLPreviewController *)self isBeingDismissed])
  {
    v4 = [(QLPreviewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(QLPreviewController *)self delegate];
      [v6 previewController:self didTransitionToState:3];
    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(CKQLPreviewController *)self setControllerWasDismissed:1];
  objc_super v7 = [(CKQLPreviewController *)self presentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    double v10 = [v9 invisibleInkEffectControllerForPreviewController:self];

    [v10 updateBorrowedEffectViewSnapshot];
  }
  v11.receiver = self;
  v11.super_class = (Class)CKQLPreviewController;
  [(CKQLPreviewController *)&v11 dismissViewControllerAnimated:v4 completion:v6];
}

- (void)saveTapped:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CKQLPreviewController *)self currentPreviewItem];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v17 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Attempting to save preview item: %@", buf, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = v5;
    if ([v7 canPerformQuickAction])
    {
      double v15 = v7;
      objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      v9 = CKMomentShareURLForMediaObjects(v8);

      uint64_t v14 = v7;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      objc_super v11 = +[CKUtilities quickSaveConfirmationAlertForMediaObjects:v10 momentShareURL:v9 popoverSource:v4 metricsSource:*MEMORY[0x1E4F6DB70] cancelHandler:0 preSaveHandler:0 postSaveHandler:0];

      double v12 = [v11 popoverPresentationController];
      [v12 setBarButtonItem:v4];

      if (v11) {
        [(CKQLPreviewController *)self presentViewController:v11 animated:1 completion:0];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      double v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v17 = v7;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Couldn't save preview item because it wasn't quick save-able. previewItem: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_super v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKQLPreviewController saveTapped:]((uint64_t)v5, v7);
    }
  }
}

- (void)replyTapped:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CKQLPreviewController *)self currentPreviewItem];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      double v12 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Attempting reply to item: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    objc_super v8 = [(QLPreviewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      double v10 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
      [v10 replyButtonTappedForMediaObject:v7 previewController:self];
    }
  }
}

- (void)tapbackTapped:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CKQLPreviewController *)self currentPreviewItem];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Showing tapback menu for: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    objc_super v8 = [(QLPreviewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
    {
      int v11 = v7;
      goto LABEL_10;
    }
    double v10 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    int v11 = [v10 chatItemForMediaObject:v7 previewController:self];

    if (v11)
    {
      double v12 = [[CKFullScreenBalloonViewControllerQuicklook alloc] initWithChatItem:v11 delegate:self];
      [(CKFullScreenBalloonViewControllerQuicklook *)v12 setModalPresentationStyle:5];
      [(CKFullScreenBalloonViewController *)v12 setUseForcedOrientation:1];
      [(CKFullScreenBalloonViewController *)v12 setForcedOrientation:1];
      [(CKQLPreviewController *)self presentViewController:v12 animated:0 completion:0];

LABEL_10:
    }
  }
}

- (BOOL)canCurrentPreviewItemQuickSave
{
  v2 = [(CKQLPreviewController *)self currentPreviewItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 canPerformQuickAction];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)updateBarButtonItems
{
  char v3 = [(CKQLPreviewController *)self currentPreviewItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  [(QLPreviewController *)self setAdditionalLeftBarButtonItems:MEMORY[0x1E4F1CBF0]];
  if (isKindOfClass)
  {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    [(QLPreviewController *)self setAdditionalRightBarButtonItems:v5];
    return;
  }
  id v23 = (id)objc_opt_new();
  id v6 = [(QLPreviewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || ([(CKQLPreviewController *)self ckQLPreviewControllerDelegate],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 shouldHideInteractionOptions],
        v8,
        !v9))
  {
    int v11 = [(CKQLPreviewController *)self currentPreviewItem];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      int v13 = [(CKQLPreviewController *)self currentPreviewItem];
      uint64_t v14 = [v13 transferGUID];

      uint64_t v15 = [MEMORY[0x1E4F6BCC8] sharedInstance];
      double v16 = [v15 transferForGUID:v14];

      if (+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForFileTransfer:v16])
      {
        uint64_t v17 = MEMORY[0x1E4F1CBF0];
        [(QLPreviewController *)self setAdditionalLeftBarButtonItems:MEMORY[0x1E4F1CBF0]];
        [(QLPreviewController *)self setAdditionalRightBarButtonItems:v17];

LABEL_20:
        goto LABEL_21;
      }
    }
    uint64_t v14 = [(CKQLPreviewController *)self currentChatItem];
    if ([v14 canSendTapbacks])
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F427C0], "ck_tapbackItemWithChatItem:target:action:", v14, self, sel_tapbackTapped_);
      [v18 setTarget:self];
      [v18 setAction:sel_tapbackTapped_];
      [(CKQLPreviewController *)self setTapbackButton:v18];
      [v23 addObject:v18];
    }
    CGFloat v19 = [(CKQLPreviewController *)self replyButton];
    [v23 addObject:v19];

    if ([(CKQLPreviewController *)self canCurrentPreviewItemQuickSave])
    {
      if ([(CKQLPreviewController *)self currentPreviewItemIsSaved]) {
        v20 = @"square.and.arrow.down.fill";
      }
      else {
        v20 = @"square.and.arrow.down";
      }
      char v21 = [MEMORY[0x1E4F42A80] systemImageNamed:v20];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithImage:v21 style:0 target:self action:sel_saveTapped_];
      [v23 addObject:v22];
    }
    [(QLPreviewController *)self setAdditionalRightBarButtonItems:v23];
    goto LABEL_20;
  }
  uint64_t v10 = MEMORY[0x1E4F1CBF0];
  [(QLPreviewController *)self setAdditionalLeftBarButtonItems:MEMORY[0x1E4F1CBF0]];
  [(QLPreviewController *)self setAdditionalRightBarButtonItems:v10];
LABEL_21:
}

- (id)replyButton
{
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  id v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = [v4 replyImage];
  id v6 = (void *)[v3 initWithImage:v5 style:0 target:self action:sel_replyTapped_];

  char v7 = [(CKQLPreviewController *)self currentPreviewItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    int v9 = [(QLPreviewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      int v11 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
      uint64_t v12 = [v11 shouldShowReplyButtonForMediaObject:v8 previewController:self];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v6 setEnabled:v12];

  return v6;
}

- (id)currentChatItem
{
  id v3 = [(CKQLPreviewController *)self currentPreviewItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [(QLPreviewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      char v7 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
      id v8 = [v7 chatItemForMediaObject:v4 previewController:self];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CGSize)preferredContentSize
{
  id v3 = [(CKQLPreviewController *)self navigationController];

  if (v3)
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKQLPreviewController;
    [(CKQLPreviewController *)&v6 preferredContentSize];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)updateCurrentPreviewItemIsSaved:(BOOL)a3 valueDidChange:(BOOL *)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  char v7 = [(CKQLPreviewController *)self currentPreviewItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    int v9 = [v8 syndicationIdentifier];
    if (v9)
    {
      char v10 = [MEMORY[0x1E4F6BD68] sharedInstance];
      int v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
      BOOL v12 = [v10 cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:v11 shouldFetchAndNotifyAsNeeded:v5 didStartFetch:0] != 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          BOOL v15 = [(CKQLPreviewController *)self currentPreviewItemIsSaved];
          double v16 = @"NO";
          if (v15) {
            double v16 = @"YES";
          }
          int v17 = 138412546;
          uint64_t v18 = v16;
          __int16 v19 = 2112;
          id v20 = v8;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Not able to derive save state on current preview item because syndicationIdentifier was nil for mediaObject. Keeping previous save state (%@). mediaObject: %@", (uint8_t *)&v17, 0x16u);
        }
      }
      BOOL v12 = [(CKQLPreviewController *)self currentPreviewItemIsSaved];
    }

    if (v12 != [(CKQLPreviewController *)self currentPreviewItemIsSaved]) {
      goto LABEL_20;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "currentPreviewItem was not a CKMediaObject. defaulting currentPreviewItemIsSaved to NO", (uint8_t *)&v17, 2u);
      }
    }
    if ([(CKQLPreviewController *)self currentPreviewItemIsSaved])
    {
      BOOL v12 = 0;
LABEL_20:
      if (a4) {
        *a4 = 1;
      }
      [(CKQLPreviewController *)self setCurrentPreviewItemIsSaved:v12];
    }
  }
}

- (void)currentPreviewItemDidChange
{
  [(CKQLPreviewController *)self updateCurrentPreviewItemIsSaved:1 valueDidChange:0];

  [(CKQLPreviewController *)self updateBarButtonItems];
}

- (id)currentPreviewItem
{
  v13.receiver = self;
  v13.super_class = (Class)CKQLPreviewController;
  id v3 = [(QLPreviewController *)&v13 currentPreviewItem];
  if (!v3)
  {
    uint64_t v5 = [(QLPreviewController *)self currentPreviewItemIndex];
    if (v5 < 1
      || (uint64_t v6 = v5,
          [(QLPreviewController *)self dataSource],
          char v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 numberOfPreviewItemsInPreviewController:self],
          v7,
          v6 >= v8))
    {
      if (IMOSLoggingEnabled())
      {
        int v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)BOOL v12 = 0;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKQLPreviewController was asked for currentPreviewItem before there were any", v12, 2u);
        }
      }
    }
    else
    {
      int v9 = [(QLPreviewController *)self dataSource];
      id v10 = (id)[v9 previewController:self previewItemAtIndex:v6];
    }
  }

  return v3;
}

- (id)previewActions
{
  id v3 = [(QLPreviewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    uint64_t v6 = [v5 previewActionsForPreviewController:self];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)photoLibraryPersistedSyndicatedAssetSetDidChange
{
  char v3 = 0;
  [(CKQLPreviewController *)self updateCurrentPreviewItemIsSaved:0 valueDidChange:&v3];
  if (v3) {
    [(CKQLPreviewController *)self updateBarButtonItems];
  }
}

- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3
{
  char v4 = [(QLPreviewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    uint64_t v6 = [v5 contextualCKChatItemsForPreviewController:self];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (CGRect)tapbackButtonFrameForFullScreenBalloonViewController:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(QLPreviewController *)self frameForAdditionalButtonWithActionName:sel_tapbackTapped_];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)fullScreenBalloonViewControllerPickerViewUsesBottomTail:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(CKQLPreviewController *)self tapbackButtonFrameForFullScreenBalloonViewController:a3];
  double y = v22.origin.y;
  if (CGRectIsEmpty(v22))
  {
    double v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CKQLPreviewController fullScreenBalloonViewControllerPickerViewUsesBottomTail:](v5);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v6 = [(CKQLPreviewController *)self childViewControllers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      double v5 = v11;

      if (v5)
      {
        BOOL v12 = [v5 navigationBar];
        [v12 frame];
        double MaxY = CGRectGetMaxY(v23);

        if (y < MaxY)
        {
          BOOL v14 = 0;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_12:

      double v5 = 0;
    }
  }
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (id)fullScreenBalloonViewController:(id)a3 balloonViewForChatItem:(id)a4
{
  return 0;
}

- (CGRect)fullScreenBalloonViewController:(id)a3 balloonFrameForChatItem:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    [(QLPreviewController *)self frameForAdditionalButtonWithActionName:sel_tapbackTapped_];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.double y = v6;
  result.origin.x = v5;
  return result;
}

- (char)fullScreenBalloonViewControllerAnchorVertialOrientation:(id)a3 withBalloonFrame:(CGRect)a4
{
  double y = a4.origin.y;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a4)) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = [(CKQLPreviewController *)self childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      BOOL v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v13 = v12;

    if (v13)
    {
      BOOL v14 = [v13 navigationBar];
      [v14 frame];
      double MaxY = CGRectGetMaxY(v23);

      if (y < MaxY)
      {
        char v6 = 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_11:

    id v13 = 0;
  }
  char v6 = 0;
LABEL_16:

  return v6;
}

- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3
{
}

- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  if (a7) {
    (*((void (**)(id, double, double))a7 + 2))(a7, a4, a6);
  }
}

- (BOOL)fullScreenBalloonViewControllerShouldShowReplyButton:(id)a3
{
  return 0;
}

- (CGRect)fullScreenBalloonViewControllerSafeAreaLayoutFrame:(id)a3
{
  char v3 = [(CKQLPreviewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)fullScreenBalloonViewControllerShouldShowHightlightButton:(id)a3 forChatItem:(id)a4
{
  return 0;
}

- (void)fullScreenBalloonViewController:(id)a3 didSelectTapback:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  double v7 = [v8 chatItem];
  [(CKQLPreviewController *)self _sendTapback:v6 targetChatItem:v7 isRemoval:0];

  [v8 beginDismissal];
}

- (void)fullScreenBalloonViewController:(id)a3 didDeselectTapback:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  double v7 = [v8 chatItem];
  [(CKQLPreviewController *)self _sendTapback:v6 targetChatItem:v7 isRemoval:1];

  [v8 beginDismissal];
}

- (void)_sendTapback:(id)a3 targetChatItem:(id)a4 isRemoval:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  double v9 = [(QLPreviewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    [v11 previewController:self sendTapback:v12 targetChatItem:v8 isRemoval:v5];
  }
}

- (BOOL)shouldShowTapbackAttributionForFullScreenBalloonViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(QLPreviewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    id v8 = [v4 chatItem];
    char v9 = [v7 previewController:self shouldShowTapbackAttributionForChatItem:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)shouldShowTapbackPickerForFullScreenBalloonViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(QLPreviewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    id v8 = [v4 chatItem];
    char v9 = [v7 previewController:self shouldShowTapbackPickerForChatItem:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)fullScreenBalloonViewControllerShouldEnableStickerTapbacks:(id)a3
{
  id v4 = [(QLPreviewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  char v6 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
  char v7 = [v6 previewControllerShouldEnableStickerTapbacks:self];

  return v7;
}

- (id)textInputContextIdentifierForFullScreenBalloonViewController:(id)a3
{
  id v4 = [(QLPreviewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CKQLPreviewController *)self ckQLPreviewControllerDelegate];
    char v7 = [v6 textInputContextIdentifierForPreviewController:self];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_dismissFullScreenBubbleViewController:(id)a3 animated:(BOOL)a4 withSendAnimation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated", buf, 2u);
    }
  }
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __102__CKQLPreviewController__dismissFullScreenBubbleViewController_animated_withSendAnimation_completion___block_invoke;
  uint64_t v21 = &unk_1E5622330;
  uint64_t v22 = self;
  id v13 = v11;
  id v23 = v13;
  double v14 = (void (**)(void))_Block_copy(&v18);
  if (IMOSLoggingEnabled())
  {
    double v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v8) {
        long long v16 = @"YES";
      }
      else {
        long long v16 = @"NO";
      }
      long long v17 = _Block_copy(v13);
      *(_DWORD *)buf = 138412802;
      v25 = v16;
      __int16 v26 = 1024;
      BOOL v27 = v7;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated %@:WithSendAnimation: %d, completion %@", buf, 0x1Cu);
    }
  }
  if (CKIsRunningInMessagesTranscriptExtension())
  {
    v14[2](v14);
  }
  else if (v8)
  {
    if (v7) {
      objc_msgSend(v10, "performSendAndCloseAnimationWithCompletion:", v14, v18, v19, v20, v21, v22);
    }
    else {
      objc_msgSend(v10, "performCancelAnimationWithCompletion:", v14, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    objc_msgSend(v10, "dismissImmediatelyWithNoAnimations", v18, v19, v20, v21, v22);
    v14[2](v14);
  }
}

uint64_t __102__CKQLPreviewController__dismissFullScreenBubbleViewController_animated_withSendAnimation_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  char v5 = [(CKQLPreviewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (CKChatItem)chatItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chatItem);

  return (CKChatItem *)WeakRetained;
}

- (void)setChatItem:(id)a3
{
}

- (CKQLPreviewControllerDelegate)chatControllerPreviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chatControllerPreviewDelegate);

  return (CKQLPreviewControllerDelegate *)WeakRetained;
}

- (void)setChatControllerPreviewDelegate:(id)a3
{
}

- (BOOL)controllerWasDismissed
{
  return self->_controllerWasDismissed;
}

- (void)setControllerWasDismissed:(BOOL)a3
{
  self->_controllerWasDismissed = a3;
}

- (BOOL)suppressRefetchingCurrentHighQualityImage
{
  return self->_suppressRefetchingCurrentHighQualityImage;
}

- (void)setSuppressRefetchingCurrentHighQualityImage:(BOOL)a3
{
  self->_suppressRefetchingCurrentHighQualityImage = a3;
}

- (UIBarButtonItem)tapbackButton
{
  return self->_tapbackButton;
}

- (void)setTapbackButton:(id)a3
{
}

- (BOOL)currentPreviewItemIsSaved
{
  return self->_currentPreviewItemIsSaved;
}

- (void)setCurrentPreviewItemIsSaved:(BOOL)a3
{
  self->_currentPreviewItemIsSaved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapbackButton, 0);
  objc_destroyWeak((id *)&self->_chatControllerPreviewDelegate);

  objc_destroyWeak((id *)&self->_chatItem);
}

- (void)saveTapped:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Couldn't save preview item because it wasn't a CKMediaObject. previewItem: %@", (uint8_t *)&v2, 0xCu);
}

- (void)fullScreenBalloonViewControllerPickerViewUsesBottomTail:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "No tapback button frame found. Unexpected state for tapback picker presentation", v1, 2u);
}

@end