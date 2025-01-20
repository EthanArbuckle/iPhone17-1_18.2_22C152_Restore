@interface CKFullScreenBalloonViewControllerPhone
- (BOOL)animatedBalloonViewFrameUpdates;
- (BOOL)animationsDisabledForTesting;
- (BOOL)hasSetInitialBalloonViewFrame;
- (BOOL)hideBalloonView;
- (BOOL)shouldPresentAsTapbackKeyboardInput;
- (CAShapeLayer)replyButtonBorderLayer;
- (CAShapeLayer)replyButtonMaskLayer;
- (CAShapeLayer)tintViewMaskLayer;
- (CGRect)messageHightlightButtonBalloonViewFrame:(id)a3;
- (CGRect)messageHightlightButtonReplyButtonFrame:(id)a3;
- (CGRect)preferredTapbackLayoutFrame;
- (CGRect)votingViewTargetFrame;
- (CKFullScreenBalloonViewControllerPhone)initWithChatItem:(id)a3 interfaceActions:(id)a4 displayConfiguration:(id)a5 delegate:(id)a6;
- (CKLivePhotoBalloonView)livePhotoBalloonView;
- (CKMessageHighlightButton)highlightButton;
- (CKTapbackPickerBalloonParentView)pickerBalloonParentView;
- (CKTapbackPickerViewController)tapbackPickerViewController;
- (NSArray)interfaceActions;
- (NSArray)mirrorStickerCells;
- (NSArray)mirrorStickerViews;
- (NSArray)parentStickerCells;
- (NSArray)parentStickerChatItems;
- (UIView)balloonView;
- (UIView)replyButtonView;
- (UIVisualEffectView)replyButtonEffectView;
- (_TtC7ChatKit24CKTapbackAttributionView)attributionView;
- (char)messageHightlightButtonTranscriptOrientation:(id)a3;
- (double)_balloonOffsetFromTranscriptParentBalloon;
- (double)balloonMinimumTopOffset:(CGRect)a3;
- (double)balloonYOffsetFromTranscript;
- (double)maximumAllowedBalloonOriginY;
- (double)minimumAllowedBalloonOriginY:(CGRect)a3;
- (double)pickerBalloonParentViewY;
- (double)replyButtonHeightFromBalloon;
- (double)replyButtonVerticalOffset;
- (id)_parentStickerChatItemGUIDToMirrorStickerViewDictionary;
- (id)contextualCKChatItemsForTapbackPickerViewController:(id)a3;
- (id)generateDuplicateBalloonViewForChatItem:(id)a3;
- (id)shouldShowStickerSuggestionsFor:(void *)a3;
- (id)smartEmojiResponses:(id)a3 chatItem:(id)a4;
- (id)tapbackPickerBalloonParentViewTapbackBackingBalloon:(id)a3;
- (id)tapbackPickerBalloonParentViewTapbackPileView:(id)a3;
- (id)tapbackPickerBalloonParentViewTapbackTintableMessageBalloon:(id)a3;
- (id)textInputContextIdentifier:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_presentAccessoryViews;
- (void)_presentOverlayBalloonView;
- (void)_presentStickersIfNeeded;
- (void)_presentTapbackAttributionIfNeeded;
- (void)_presentTapbackPickerIfNeeded;
- (void)_revealTintAnimated:(BOOL)a3;
- (void)_scrollTranscriptToBalloonView:(double)a3 completion:(id)a4;
- (void)_stickerDetailViewControllerCloseButtonPressed:(id)a3;
- (void)_updateBoundsCenterFrameForMirrorAssociatedItemView:(id)a3 parentStickerChatItem:(id)a4;
- (void)_updateKeyboardSnapshotIfNeeded;
- (void)addHighlightButtonIfNeeded;
- (void)beginDismissal;
- (void)dealloc;
- (void)disableAnimationsForTesting;
- (void)initializeTapbackPicker;
- (void)insertSticker:(id)a3;
- (void)keyCommandSelectTapback:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4;
- (void)loadLivePhotoBalloonViewIfNeeded;
- (void)messageHightlightButtonDidFinishAnimating:(id)a3;
- (void)messageHightlightButtonWasClicked:(id)a3;
- (void)performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 withCompletion:(id)a5;
- (void)performInitialAnimations;
- (void)presentStickerDetailControllerWithStickers:(id)a3;
- (void)sendTouchBarTapback:(int64_t)a3;
- (void)setAnimatedBalloonViewFrameUpdates:(BOOL)a3;
- (void)setAnimationsDisabledForTesting:(BOOL)a3;
- (void)setAttributionView:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setBalloonYOffsetFromTranscript:(double)a3;
- (void)setHasSetInitialBalloonViewFrame:(BOOL)a3;
- (void)setHideBalloonView:(BOOL)a3;
- (void)setHighlightButton:(id)a3;
- (void)setInterfaceActions:(id)a3;
- (void)setLivePhotoBalloonView:(id)a3;
- (void)setMirrorStickerCells:(id)a3;
- (void)setMirrorStickerViews:(id)a3;
- (void)setParentStickerCells:(id)a3;
- (void)setParentStickerChatItems:(id)a3;
- (void)setPickerBalloonParentView:(id)a3;
- (void)setReplyButtonBorderLayer:(id)a3;
- (void)setReplyButtonEffectView:(id)a3;
- (void)setReplyButtonMaskLayer:(id)a3;
- (void)setReplyButtonView:(id)a3;
- (void)setStickerVisibility:(BOOL)a3 forStickerChatItemGUID:(id)a4;
- (void)setTapbackPickerViewController:(id)a3;
- (void)setTintViewMaskLayer:(id)a3;
- (void)setupReplyButton;
- (void)showAllStickers;
- (void)showTapbackPicker;
- (void)stickerDetailViewController:(id)a3 deletedStickerWithTransferGUID:(id)a4;
- (void)stickerDetailViewController:(id)a3 didRequestSaveSticker:(id)a4;
- (void)stickerDetailViewController:(id)a3 selectedStickerPackWithAdamID:(id)a4;
- (void)tapbackAttributionView:(id)a3 didTapToSaveSticker:(id)a4;
- (void)tapbackPickerBalloonParentView:(id)a3 didInsertTapback:(id)a4;
- (void)tapbackPickerBalloonParentView:(id)a3 requestedPresentPlugin:(id)a4 payloadID:(id)a5;
- (void)tapbackPickerBalloonParentViewRequestedAppCardDismiss:(id)a3;
- (void)tapbackPickerBalloonParentViewRequestedShowEmojiKeyboard:(id)a3;
- (void)tapbackPickerBalloonParentViewReturningToSuggestionPicker:(id)a3;
- (void)tapbackPickerViewController:(id)a3 didDeselectTapback:(id)a4;
- (void)tapbackPickerViewController:(id)a3 didSelectTapback:(id)a4;
- (void)updateBalloonViewFrame;
- (void)updateReplyButtonColor;
- (void)updateReplyButtonSizeAndLocation:(CGRect)a3 layoutRelativeToHighlightButton:(BOOL)a4;
- (void)updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:(CGRect)a3;
- (void)updateStickersAnimated:(BOOL)a3;
- (void)updateTintViewAlpha;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CKFullScreenBalloonViewControllerPhone

- (void)loadLivePhotoBalloonViewIfNeeded
{
  if (UIAccessibilityIsReduceMotionEnabled()) {
    return;
  }
  v3 = [(CKFullScreenBalloonViewController *)self chatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return;
  }
  id v23 = [(CKFullScreenBalloonViewController *)self chatItem];
  v5 = [v23 mediaObject];
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  if (v6)
  {
    v7 = [v23 mediaObject];
    if ([v7 isIrisAsset])
    {

      if (v7)
      {
        v8 = [(CKFullScreenBalloonViewController *)self chatItem];
        objc_opt_class();
        char v9 = objc_opt_isKindOfClass();

        v10 = [(CKFullScreenBalloonViewController *)self supplementaryLayoutContext];
        objc_opt_class();
        objc_opt_isKindOfClass();

        id v11 = objc_alloc((Class)objc_opt_class());
        v12 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
        objc_msgSend(v12, "ck_identityTransformFrame");
        v13 = objc_msgSend(v11, "initWithFrame:");

        v14 = [(CKFullScreenBalloonViewController *)self chatItem];
        [v13 configureForMessagePart:v14];

        [v13 setCanUseOpaqueMask:0];
        v15 = [v13 livePhotoView];
        [v15 setDelegate:self];

        [v13 setAlpha:0.0];
        [v13 setNeedsPrepareForDisplay];
        [v13 prepareForDisplayIfNeeded];
        [v13 setNeedsLayout];
        [v13 layoutIfNeeded];
        [(CKFullScreenBalloonViewControllerPhone *)self setLivePhotoBalloonView:v13];
        v16 = [(CKFullScreenBalloonViewControllerPhone *)self view];
        v17 = [(CKFullScreenBalloonViewControllerPhone *)self livePhotoBalloonView];
        [v16 addSubview:v17];

        if (v9)
        {
          v18 = [(CKFullScreenBalloonViewController *)self chatItem];
          v19 = [v18 layoutRecipe];
          [v19 rotation];
          double v21 = v20;

          if (v21 != 0.0)
          {
            memset(&v26, 0, sizeof(v26));
            long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
            *(_OWORD *)&v25.a = *MEMORY[0x1E4F1DAB8];
            *(_OWORD *)&v25.c = v22;
            *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
            CGAffineTransformRotate(&v26, &v25, v21 * 3.14159265 / 180.0);
            CGAffineTransform v24 = v26;
            [v13 setTransform:&v24];
          }
        }
        [v13 setUserInteractionEnabled:0];
      }
      return;
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
      [v7 removeFromSuperview];
      CKBalloonViewReuse(v7);
      [(CKFullScreenBalloonViewControllerPhone *)self setBalloonView:0];
    }
  }
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI]) {
    [MEMORY[0x1E4F42B08] setKeyboardAlpha:1.0];
  }
  v8.receiver = self;
  v8.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  [(CKFullScreenBalloonViewController *)&v8 dealloc];
}

- (CKFullScreenBalloonViewControllerPhone)initWithChatItem:(id)a3 interfaceActions:(id)a4 displayConfiguration:(id)a5 delegate:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Creating fullscreen balloon for chatItem = %@", (uint8_t *)&v18, 0xCu);
    }
  }
  v15 = [(CKFullScreenBalloonViewController *)self initWithChatItem:v10 displayConfiguration:v12 delegate:v13];
  v16 = v15;
  if (v15) {
    [(CKFullScreenBalloonViewControllerPhone *)v15 setInterfaceActions:v11];
  }

  return v16;
}

- (void)performInitialAnimations
{
  uint64_t v3 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  [v3 setUserInteractionEnabled:0];

  [(CKFullScreenBalloonViewControllerPhone *)self _updateKeyboardSnapshotIfNeeded];
  v4 = [(CKFullScreenBalloonViewController *)self tintView];
  [v4 setAlpha:0.0];

  [(CKFullScreenBalloonViewControllerPhone *)self _balloonOffsetFromTranscriptParentBalloon];
  double v6 = v5;
  -[CKFullScreenBalloonViewControllerPhone setBalloonYOffsetFromTranscript:](self, "setBalloonYOffsetFromTranscript:");
  if (v6 == 0.0)
  {
    [(CKFullScreenBalloonViewControllerPhone *)self _revealTintAnimated:1];
    [(CKFullScreenBalloonViewControllerPhone *)self _presentAccessoryViews];
    [(CKFullScreenBalloonViewController *)self setFollowsParentBalloonView:1];
    v7 = [(CKFullScreenBalloonViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v11 = [(CKFullScreenBalloonViewController *)self delegate];
      [v11 fullScreenBalloonViewControllerDidCompleteInitialAnimation:self];
    }
  }
  else
  {
    char v9 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
    int v10 = [v9 shouldPresentTintViewBeforeScrolling];

    if (v10) {
      [(CKFullScreenBalloonViewControllerPhone *)self _revealTintAnimated:1];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__CKFullScreenBalloonViewControllerPhone_performInitialAnimations__block_invoke;
    v12[3] = &unk_1E5620C40;
    v12[4] = self;
    [(CKFullScreenBalloonViewControllerPhone *)self _scrollTranscriptToBalloonView:v12 completion:v6];
  }
}

void __66__CKFullScreenBalloonViewControllerPhone_performInitialAnimations__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) displayConfiguration];
  char v3 = [v2 shouldPresentTintViewBeforeScrolling];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 32) _revealTintAnimated:1];
  }
  [*(id *)(a1 + 32) _presentAccessoryViews];
  [*(id *)(a1 + 32) setFollowsParentBalloonView:1];
  v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 fullScreenBalloonViewControllerDidCompleteInitialAnimation:*(void *)(a1 + 32)];
  }
}

- (void)_scrollTranscriptToBalloonView:(double)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  v7 = [(CKFullScreenBalloonViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      char v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = [NSNumber numberWithDouble:a3];
        *(_DWORD *)buf = 138412290;
        int v18 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "verticallyScrollTranscriptByAmount: %@", buf, 0xCu);
      }
    }
    id v11 = [(CKFullScreenBalloonViewController *)self delegate];
    id v12 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
    [v12 scrollDuration];
    double v14 = v13;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__CKFullScreenBalloonViewControllerPhone__scrollTranscriptToBalloonView_completion___block_invoke;
    v15[3] = &unk_1E5620F48;
    v16 = v6;
    [v11 fullScreenBalloonViewController:self verticallyScrollTranscriptByAmount:1 animated:v15 duration:a3 completion:v14];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

uint64_t __84__CKFullScreenBalloonViewControllerPhone__scrollTranscriptToBalloonView_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentAccessoryViews
{
  [(CKFullScreenBalloonViewControllerPhone *)self _presentTapbackAttributionIfNeeded];
  [(CKFullScreenBalloonViewControllerPhone *)self _presentOverlayBalloonView];
  [(CKFullScreenBalloonViewControllerPhone *)self _presentTapbackPickerIfNeeded];

  [(CKFullScreenBalloonViewControllerPhone *)self _presentStickersIfNeeded];
}

- (void)_presentTapbackAttributionIfNeeded
{
  if ([(CKFullScreenBalloonViewController *)self shouldShowTapbackAttribution])
  {
    id v3 = [(CKFullScreenBalloonViewControllerPhone *)self attributionView];
    [v3 present];
  }
}

- (void)_presentOverlayBalloonView
{
  id v3 = [(CKFullScreenBalloonViewControllerPhone *)self livePhotoBalloonView];

  if (v3)
  {
    v4 = [(CKFullScreenBalloonViewControllerPhone *)self livePhotoBalloonView];
    [v4 setAlpha:1.0];

    id v7 = [(CKFullScreenBalloonViewControllerPhone *)self livePhotoBalloonView];
    char v5 = [v7 livePhotoView];
    [v5 startPlaybackWithStyle:1];
  }
  else
  {
    id v6 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
    [v6 setAlpha:1.0];

    id v7 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
    [v7 setHidden:0];
  }
}

- (void)_presentTapbackPickerIfNeeded
{
  if ([(CKFullScreenBalloonViewController *)self shouldShowTapbackPicker])
  {
    [(CKFullScreenBalloonViewControllerPhone *)self showTapbackPicker];
  }
}

- (void)_presentStickersIfNeeded
{
  id v3 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  int v4 = [v3 shouldShowStickers];

  if (v4)
  {
    [(CKFullScreenBalloonViewControllerPhone *)self updateStickersAnimated:1];
  }
}

- (double)_balloonOffsetFromTranscriptParentBalloon
{
  id v3 = [(CKFullScreenBalloonViewController *)self delegate];
  int v4 = [(CKFullScreenBalloonViewController *)self chatItem];
  [v3 fullScreenBalloonViewController:self balloonFrameForChatItem:v4];
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  objc_msgSend(v13, "ck_identityTransformFrame");
  CGFloat v15 = v14;
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  BOOL v22 = CGRectEqualToRect(v24, v25);
  double result = v8 - v17;
  if (v22) {
    return 0.0;
  }
  return result;
}

- (void)_updateKeyboardSnapshotIfNeeded
{
  id v3 = [(CKFullScreenBalloonViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(CKFullScreenBalloonViewController *)self delegate];
    CGFloat v6 = [(CKFullScreenBalloonViewController *)self chatItem];
    int v7 = [v5 shouldDismissKeyboardWhenShowingFullScreenAcknowledgmentPickerForBalloonChatItem:v6];
  }
  else
  {
    int v7 = 0;
  }
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI]
    && ((IMIsRunningInMessagesExtension() | v7) & 1) == 0)
  {
    id v8 = [(CKFullScreenBalloonViewController *)self delegate];
    [v8 fullScreenBalloonViewControllerRequestShowKeyboardSnapshot:self];
  }
}

- (void)_revealTintAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  uint64_t v6 = [v5 type];

  if (v6 == 1)
  {
    if (v3)
    {
      int v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E18]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 853.41, 69.3804, 0.0, 0.0);
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F43008]) initWithDuration:v7 timingParameters:0.0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke;
      v13[3] = &unk_1E5620C40;
      v13[4] = self;
      [v8 addAnimations:v13];
      [v8 startAnimation];
    }
    else
    {
      [(CKFullScreenBalloonViewControllerPhone *)self updateTintViewAlpha];
    }
  }
  else
  {
    double v9 = 0.0;
    if (v3)
    {
      CGFloat v10 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
      [v10 tintRevealDuration];
      double v9 = v11;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke_2;
    v12[3] = &unk_1E5620C40;
    v12[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:2 delay:v12 options:0 animations:v9 completion:0.0];
  }
}

uint64_t __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTintViewAlpha];
}

uint64_t __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTintViewAlpha];
}

- (void)updateStickersAnimated:(BOOL)a3
{
  double v5 = [(CKFullScreenBalloonViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
    int v8 = [v7 shouldShowStickers];

    if (v8)
    {
      double v9 = [(CKFullScreenBalloonViewControllerPhone *)self mirrorStickerCells];
      CGFloat v10 = (void *)[v9 mutableCopy];
      double v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [MEMORY[0x1E4F1CA48] array];
      }
      v29 = v12;

      double v13 = [(CKFullScreenBalloonViewControllerPhone *)self mirrorStickerViews];
      double v14 = (void *)[v13 mutableCopy];
      CGFloat v15 = v14;
      if (v14)
      {
        id v16 = v14;
      }
      else
      {
        id v16 = [MEMORY[0x1E4F1CA48] array];
      }
      double v17 = v16;

      double v18 = [(CKFullScreenBalloonViewControllerPhone *)self _parentStickerChatItemGUIDToMirrorStickerViewDictionary];
      CGFloat v19 = [(CKFullScreenBalloonViewController *)self delegate];
      id v38 = 0;
      id v37 = 0;
      double v20 = [(CKFullScreenBalloonViewController *)self chatItem];
      CGFloat v21 = [v20 IMChatItem];
      BOOL v22 = [v21 guid];
      [v19 associatedStickerCells:&v38 stickerChatItems:&v37 chatItemGUID:v22];
      id v23 = v38;
      id v24 = v37;

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __65__CKFullScreenBalloonViewControllerPhone_updateStickersAnimated___block_invoke;
      v30[3] = &unk_1E562B4B8;
      id v31 = v24;
      id v32 = v18;
      v33 = self;
      id v34 = v29;
      id v35 = v17;
      BOOL v36 = a3;
      id v25 = v17;
      id v26 = v29;
      id v27 = v18;
      id v28 = v24;
      [v23 enumerateObjectsUsingBlock:v30];
      [(CKFullScreenBalloonViewControllerPhone *)self setParentStickerCells:v23];
      [(CKFullScreenBalloonViewControllerPhone *)self setParentStickerChatItems:v28];
      [(CKFullScreenBalloonViewControllerPhone *)self setMirrorStickerCells:v26];
      [(CKFullScreenBalloonViewControllerPhone *)self setMirrorStickerViews:v25];
    }
  }
}

void __65__CKFullScreenBalloonViewControllerPhone_updateStickersAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  char v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  int v7 = *(void **)(a1 + 40);
  int v8 = [v6 IMChatItem];
  double v9 = [v8 guid];
  CGFloat v10 = [v7 objectForKey:v9];

  if (!v10)
  {
    double v11 = [CKStickerTranscriptCell alloc];
    id v12 = -[CKStickerTranscriptCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKStickerTranscriptCell *)v12 configureForChatItem:v6 context:0 animated:0 animationDuration:3 animationCurve:0.0];
    double v13 = [(CKAssociatedMessageTranscriptCell *)v12 associatedItemView];
    double v14 = [*(id *)(a1 + 48) view];
    [v14 addSubview:v13];

    [(CKStickerTranscriptCell *)v12 updateAnimationTimerObserving];
    CGFloat v15 = [v5 associatedItemView];
    id v16 = v15;
    if (v15)
    {
      [v15 transform];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
    }
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    [v13 setTransform:v17];

    [*(id *)(a1 + 48) _updateBoundsCenterFrameForMirrorAssociatedItemView:v13 parentStickerChatItem:v6];
    [*(id *)(a1 + 56) addObject:v12];
    [*(id *)(a1 + 64) addObject:v13];
    objc_msgSend(v13, "ck_performRevealAnimated:completion:", *(unsigned __int8 *)(a1 + 72), 0);
  }
}

- (void)showAllStickers
{
  BOOL v3 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  int v4 = [v3 shouldShowStickers];

  if (v4)
  {
    id v5 = [(CKFullScreenBalloonViewControllerPhone *)self mirrorStickerViews];
    [v5 enumerateObjectsUsingBlock:&__block_literal_global_229];
  }
}

uint64_t __57__CKFullScreenBalloonViewControllerPhone_showAllStickers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:1.0];
}

- (void)setStickerVisibility:(BOOL)a3 forStickerChatItemGUID:(id)a4
{
  id v5 = a4;
  id v7 = [(CKFullScreenBalloonViewControllerPhone *)self _parentStickerChatItemGUIDToMirrorStickerViewDictionary];
  char v6 = [v7 valueForKey:v5];

  objc_msgSend(v6, "ck_performHideAnimated:completion:", 0, 0);
}

- (id)_parentStickerChatItemGUIDToMirrorStickerViewDictionary
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
  int v4 = [(CKFullScreenBalloonViewControllerPhone *)self parentStickerChatItems];
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  char v6 = [(CKFullScreenBalloonViewControllerPhone *)self parentStickerChatItems];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __97__CKFullScreenBalloonViewControllerPhone__parentStickerChatItemGUIDToMirrorStickerViewDictionary__block_invoke;
  double v13 = &unk_1E562B500;
  double v14 = self;
  id v15 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:&v10];

  int v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __97__CKFullScreenBalloonViewControllerPhone__parentStickerChatItemGUIDToMirrorStickerViewDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 mirrorStickerViews];
  id v11 = [v7 objectAtIndex:a3];

  int v8 = *(void **)(a1 + 40);
  double v9 = [v6 IMChatItem];

  uint64_t v10 = [v9 guid];
  [v8 setObject:v11 forKey:v10];
}

- (void)_updateBoundsCenterFrameForMirrorAssociatedItemView:(id)a3 parentStickerChatItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CKFullScreenBalloonViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(CKFullScreenBalloonViewController *)self delegate];
    [v10 fullScreenBalloonViewController:self stickerBoundsForChatItem:v7];
    objc_msgSend(v6, "setBounds:");
  }
  id v11 = [(CKFullScreenBalloonViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    double v13 = [(CKFullScreenBalloonViewController *)self delegate];
    [v13 fullScreenBalloonViewController:self stickerCenterForChatItem:v7];
    objc_msgSend(v6, "setCenter:");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v6;
    id v15 = [v14 internalView];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    if (v14) {
      [v14 transform];
    }
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v23 = *MEMORY[0x1E4F1DAB8];
    long long v24 = v17;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    objc_msgSend(v14, "setTransform:", &v23, v25, v17, v23);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    if (v15) {
      [v15 transform];
    }
    long long v20 = v19;
    long long v21 = v18;
    long long v22 = v16;
    [v15 setTransform:&v20];
    [v14 bounds];
    objc_msgSend(v15, "setFrame:");
    long long v20 = v26;
    long long v21 = v27;
    long long v22 = v28;
    [v14 setTransform:&v20];
    long long v20 = v23;
    long long v21 = v24;
    long long v22 = v25;
    [v15 setTransform:&v20];
  }
}

- (void)presentStickerDetailControllerWithStickers:(id)a3
{
  id v4 = a3;
  char v9 = [[CKStickerDetailViewController alloc] initWithStickerChatItems:v4];

  [(CKStickerDetailViewController *)v9 setDelegate:self];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v9];
  if (CKIsRunningInMacCatalyst()) {
    uint64_t v6 = 7;
  }
  else {
    uint64_t v6 = 6;
  }
  [v5 setModalPresentationStyle:v6];
  id v7 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  int v8 = [v5 popoverPresentationController];
  [v8 setSourceView:v7];

  [(CKFullScreenBalloonViewControllerPhone *)self presentViewController:v5 animated:1 completion:0];
}

- (void)viewDidLoad
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  [(CKFullScreenBalloonViewController *)&v13 viewDidLoad];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
  id v4 = [(CKFullScreenBalloonViewController *)self chatItem];
  id v5 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  if (!v5)
  {
    id v5 = [(CKFullScreenBalloonViewControllerPhone *)self generateDuplicateBalloonViewForChatItem:v4];
    [v5 setAlpha:0.0];
    [(CKFullScreenBalloonViewControllerPhone *)self setBalloonView:v5];
  }
  uint64_t v6 = [(CKFullScreenBalloonViewControllerPhone *)self view];
  [v6 addSubview:v5];

  if ([(CKFullScreenBalloonViewControllerPhone *)self hideBalloonView])
  {
    id v7 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
    [v7 removeFromSuperview];
  }
  else
  {
    [(CKFullScreenBalloonViewControllerPhone *)self loadLivePhotoBalloonViewIfNeeded];
  }
  if ([(CKFullScreenBalloonViewController *)self shouldShowTapbackAttribution])
  {
    int v8 = [[_TtC7ChatKit24CKTapbackAttributionView alloc] initWithMessagePartChatItem:v4];
    [(CKTapbackAttributionView *)v8 setDelegate:self];
    [(CKFullScreenBalloonViewControllerPhone *)self setAttributionView:v8];
    char v9 = [(CKFullScreenBalloonViewControllerPhone *)self view];
    uint64_t v10 = [(CKFullScreenBalloonViewControllerPhone *)self attributionView];
    [v9 addSubview:v10];
  }
  if ([(CKFullScreenBalloonViewController *)self shouldShowTapbackPicker]) {
    [(CKFullScreenBalloonViewControllerPhone *)self initializeTapbackPicker];
  }
  self->_shouldLayoutViews = 1;
  v14[0] = objc_opt_class();
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v12 = (id)[(CKFullScreenBalloonViewControllerPhone *)self registerForTraitChanges:v11 withHandler:&__block_literal_global_117_2];
}

void __53__CKFullScreenBalloonViewControllerPhone_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 updateTintViewAlpha];
  [v2 updateReplyButtonColor];
}

- (CGRect)preferredTapbackLayoutFrame
{
  id v2 = [(CKFullScreenBalloonViewControllerPhone *)self view];
  BOOL v3 = [v2 safeAreaLayoutGuide];
  [v3 layoutFrame];
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
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)votingViewTargetFrame
{
  BOOL v3 = [(CKFullScreenBalloonViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(CKFullScreenBalloonViewController *)self delegate];
    [v5 systemMinimumLayoutMarginsForFullScreenBalloonViewController:self];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *(double *)(MEMORY[0x1E4F424F0] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  }
  double v10 = [(CKFullScreenBalloonViewControllerPhone *)self view];
  uint64_t v11 = [v10 effectiveUserInterfaceLayoutDirection];
  if (v11) {
    double v12 = v9;
  }
  else {
    double v12 = v7;
  }
  if (v11) {
    double v9 = v7;
  }

  [(CKFullScreenBalloonViewControllerPhone *)self preferredTapbackLayoutFrame];
  double y = v26.origin.y;
  double v14 = CGRectGetWidth(v26) - (v12 + v9);
  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 attributionViewMaxWidth];

  long long v16 = +[CKUIBehavior sharedBehaviors];
  [v16 attributionViewMinPadding];
  double v18 = v17;

  long long v19 = +[CKUIBehavior sharedBehaviors];
  [v19 attributionViewHeight];
  double v21 = v20;

  if (v18 >= y) {
    double v22 = v18;
  }
  else {
    double v22 = y;
  }
  double v23 = v12;
  double v24 = v14;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.double y = v22;
  result.origin.x = v23;
  return result;
}

- (double)minimumAllowedBalloonOriginY:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(CKFullScreenBalloonViewController *)self shouldShowTapbackAttribution])
  {
    [(CKFullScreenBalloonViewControllerPhone *)self votingViewTargetFrame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
  }
  else
  {
    CGFloat v8 = *MEMORY[0x1E4F1DB28];
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  [(CKFullScreenBalloonViewControllerPhone *)self preferredTapbackLayoutFrame];
  double MinY = CGRectGetMinY(v22);
  v23.origin.double x = v8;
  v23.origin.double y = v10;
  v23.size.double width = v12;
  v23.size.double height = v14;
  double MaxY = CGRectGetMaxY(v23);
  BOOL v17 = [(CKFullScreenBalloonViewController *)self shouldShowTapbackPicker];
  double v18 = 0.0;
  if (v17) {
    -[CKFullScreenBalloonViewControllerPhone balloonMinimumTopOffset:](self, "balloonMinimumTopOffset:", x, y, width, height);
  }
  if (MaxY >= MinY) {
    double v19 = MaxY;
  }
  else {
    double v19 = MinY;
  }
  return v19 + v18;
}

- (double)maximumAllowedBalloonOriginY
{
  BOOL v3 = [(CKFullScreenBalloonViewController *)self delegate];
  [v3 fullScreenBalloonViewControllerSafeAreaLayoutFrame:self];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  uint64_t v12 = v5;
  uint64_t v13 = v7;
  uint64_t v14 = v9;
  uint64_t v15 = v11;

  return CGRectGetMaxY(*(CGRect *)&v12);
}

- (void)viewDidLayoutSubviews
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v92.receiver = self;
  v92.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  [(CKFullScreenBalloonViewControllerPhone *)&v92 viewDidLayoutSubviews];
  if (self->_shouldLayoutViews)
  {
    BOOL v3 = [(CKFullScreenBalloonViewController *)self delegate];
    uint64_t v4 = [(CKFullScreenBalloonViewController *)self chatItem];
    [v3 fullScreenBalloonViewController:self balloonFrameForChatItem:v4];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    uint64_t v13 = [(CKFullScreenBalloonViewController *)self supplementaryLayoutContext];
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();

    if (v4)
    {
      if (self->_hasSetInitialBalloonViewFrame)
      {
        uint64_t v14 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
        [v14 frame];
        double v6 = v15;
        double v8 = v16;
        double v10 = v17;
        double v12 = v18;
      }
      double v19 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
      double v20 = (double *)MEMORY[0x1E4F1DB28];
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      if (CKMainScreenScale_once_91 != -1) {
        dispatch_once(&CKMainScreenScale_once_91, &__block_literal_global_476_1);
      }
      double v23 = *(double *)&CKMainScreenScale_sMainScreenScale_91;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_91 == 0.0) {
        double v23 = 1.0;
      }
      objc_msgSend(v19, "setCenter:", 1.0 / v23 * (v6 * v23 + floor((v10 * v23 - v21 * v23) * 0.5)), 1.0 / v23 * (v8 * v23 + floor((v12 * v23 - v22 * v23) * 0.5)));

      double v24 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
      double v25 = *v20;
      double v26 = v20[1];
      objc_msgSend(v24, "setBounds:", *v20, v26, v10, v12);

      long long v27 = [(CKFullScreenBalloonViewControllerPhone *)self livePhotoBalloonView];
      if (CKMainScreenScale_once_91 != -1) {
        dispatch_once(&CKMainScreenScale_once_91, &__block_literal_global_476_1);
      }
      double v28 = *(double *)&CKMainScreenScale_sMainScreenScale_91;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_91 == 0.0) {
        double v28 = 1.0;
      }
      objc_msgSend(v27, "setCenter:", 1.0 / v28 * (v6 * v28 + floor((v10 * v28 - v21 * v28) * 0.5)), 1.0 / v28 * (v8 * v28 + floor((v12 * v28 - v22 * v28) * 0.5)));

      v29 = [(CKFullScreenBalloonViewControllerPhone *)self livePhotoBalloonView];
      objc_msgSend(v29, "setBounds:", v25, v26, v10, v12);

      v30 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
      [v30 frame];
      double v6 = v31;
      double v8 = v32;
      double v10 = v33;
      double v12 = v34;
    }
    id v35 = [(CKFullScreenBalloonViewControllerPhone *)self view];
    BOOL v36 = [v35 safeAreaLayoutGuide];
    [v36 layoutFrame];
    uint64_t v88 = v38;
    uint64_t v90 = v37;
    uint64_t v84 = v40;
    uint64_t v86 = v39;

    v96.origin.double x = v6;
    v96.origin.double y = v8;
    v96.size.double width = v10;
    v96.size.double height = v12;
    double MaxY = CGRectGetMaxY(v96);
    [(CKFullScreenBalloonViewControllerPhone *)self maximumAllowedBalloonOriginY];
    if (MaxY > v42)
    {
      [(CKFullScreenBalloonViewControllerPhone *)self maximumAllowedBalloonOriginY];
      double v8 = v43 - v12;
    }
    -[CKFullScreenBalloonViewControllerPhone minimumAllowedBalloonOriginY:](self, "minimumAllowedBalloonOriginY:", v6, v8, v10, v12, v84, v86, v88, v90);
    if (v8 < v44) {
      double v8 = v44;
    }
    [(CKFullScreenBalloonViewControllerPhone *)self votingViewTargetFrame];
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v53 = [(CKFullScreenBalloonViewControllerPhone *)self attributionView];
    objc_msgSend(v53, "setFrame:", v46, v48, v50, v52);

    if (self->_hasSetInitialBalloonViewFrame)
    {
      v54 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
      [v54 frame];
      double v6 = v55;
      double v8 = v56;
      double v10 = v57;
      double v12 = v58;
    }
    else
    {
      self->_hasSetInitialBalloonViewFrame = 1;
      v59 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
      int v60 = [v59 shouldAvoidAppCardAtInitialPresentation];

      if (v60)
      {
        v61 = [(CKFullScreenBalloonViewController *)self delegate];
        char v62 = objc_opt_respondsToSelector();

        double v63 = 0.0;
        if (v62)
        {
          v64 = [(CKFullScreenBalloonViewController *)self delegate];
          [v64 _expectedAppCardAndEntryViewHeight];
          double v63 = v65;

          if (IMOSLoggingEnabled())
          {
            v66 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              v67 = [NSNumber numberWithDouble:v63];
              *(_DWORD *)buf = 138412290;
              v94 = v67;
              _os_log_impl(&dword_18EF18000, v66, OS_LOG_TYPE_INFO, "appCardAndEntryViewHeight: %@", buf, 0xCu);
            }
          }
        }
        v97.origin.double y = v89;
        v97.origin.double x = v91;
        v97.size.double height = v85;
        v97.size.double width = v87;
        double MinY = CGRectGetMinY(v97);
        v98.origin.double x = v6;
        v98.origin.double y = v8;
        v98.size.double width = v10;
        v98.size.double height = v12;
        if (CGRectGetMinY(v98) < MinY + 16.0) {
          double v8 = MinY + 16.0;
        }
        v69 = [(CKFullScreenBalloonViewControllerPhone *)self view];
        [v69 frame];
        double v70 = CGRectGetMaxY(v99);

        v100.origin.double x = v6;
        v100.origin.double y = v8;
        v100.size.double width = v10;
        v100.size.double height = v12;
        if (CGRectGetMaxY(v100) > v70 - v63) {
          double v8 = v70 - v63 - v12;
        }
      }
    }
    v71 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
    objc_msgSend(v71, "setFrame:", v6, v8, v10, v12);

    v72 = [(CKFullScreenBalloonViewControllerPhone *)self livePhotoBalloonView];
    objc_msgSend(v72, "setFrame:", v6, v8, v10, v12);

    v73 = [(CKFullScreenBalloonViewControllerPhone *)self highlightButton];

    if (v73)
    {
      v74 = [(CKFullScreenBalloonViewControllerPhone *)self highlightButton];
      [v74 calculateFrameRelativeToBalloonViewFrame];
      double v76 = v75;
      double v78 = v77;
      double v80 = v79;
      double v82 = v81;
      v83 = [(CKFullScreenBalloonViewControllerPhone *)self highlightButton];
      objc_msgSend(v83, "setFrame:", v76, v78, v80, v82);
    }
  }
}

- (void)updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CKFullScreenBalloonViewController *)self replyButton];

  if (v8)
  {
    double v9 = [(CKFullScreenBalloonViewControllerPhone *)self highlightButton];
    BOOL v10 = v9 != 0;

    -[CKFullScreenBalloonViewControllerPhone updateReplyButtonSizeAndLocation:layoutRelativeToHighlightButton:](self, "updateReplyButtonSizeAndLocation:layoutRelativeToHighlightButton:", v10, x, y, width, height);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = [(CKFullScreenBalloonViewControllerPhone *)self view];
  BOOL v3 = [v2 window];

  if (v3)
  {
    uint64_t v4 = [v3 windowScene];
    char v5 = [v4 interfaceOrientation];

    unint64_t v6 = 1 << v5;
  }
  else
  {
    unint64_t v6 = 30;
  }

  return v6;
}

- (void)beginDismissal
{
  v3.receiver = self;
  v3.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  [(CKFullScreenBalloonViewController *)&v3 beginDismissal];
  [(CKFullScreenBalloonViewControllerPhone *)self closeEmojiPicker];
}

- (void)updateBalloonViewFrame
{
  if ([(CKFullScreenBalloonViewController *)self followsParentBalloonView])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    objc_super v3 = (void (**)(void))_Block_copy(aBlock);
    if ([(CKFullScreenBalloonViewControllerPhone *)self animatedBalloonViewFrameUpdates])
    {
      [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v3 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      v3[2](v3);
    }
  }
}

void __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke(uint64_t a1)
{
  v27.receiver = *(id *)(a1 + 32);
  v27.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  objc_msgSendSuper2(&v27, sel_updateBalloonViewFrame);
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 chatItem];
  [v2 fullScreenBalloonViewController:v3 balloonFrameForChatItem:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [*(id *)(a1 + 32) balloonView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  uint64_t v14 = [*(id *)(a1 + 32) livePhotoBalloonView];
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  objc_msgSend(*(id *)(a1 + 32), "updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:", v6, v8, v10, v12);
  double v15 = [*(id *)(a1 + 32) parentStickerChatItems];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke_2;
  v26[3] = &unk_1E562B548;
  v26[4] = *(void *)(a1 + 32);
  [v15 enumerateObjectsUsingBlock:v26];

  double v16 = [*(id *)(a1 + 32) pickerBalloonParentView];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  [*(id *)(a1 + 32) pickerBalloonParentViewY];
  double v24 = v23;
  double v25 = [*(id *)(a1 + 32) pickerBalloonParentView];
  objc_msgSend(v25, "setFrame:", v18, v24, v20, v22);
}

void __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 mirrorStickerViews];
  id v8 = [v7 objectAtIndex:a3];

  [*(id *)(a1 + 32) _updateBoundsCenterFrameForMirrorAssociatedItemView:v8 parentStickerChatItem:v6];
}

- (void)performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = [(CKFullScreenBalloonViewControllerPhone *)self view];
  double v10 = [v9 superview];
  if (v10)
  {

LABEL_4:
    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        if (v6) {
          uint64_t v13 = @"YES";
        }
        else {
          uint64_t v13 = @"NO";
        }
        uint64_t v14 = _Block_copy(v8);
        *(_DWORD *)buf = 138412802;
        id v35 = v13;
        __int16 v36 = 1024;
        BOOL v37 = v5;
        __int16 v38 = 2112;
        uint64_t v39 = v14;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "performClosingAnimationsAnimated: %@, WithSendAnimation: %d, withCompletion:%@", buf, 0x1Cu);
      }
    }
    self->_shouldLayoutViews = 0;
    double v15 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
    objc_msgSend(v15, "ck_identityTransformFrame");

    [(CKFullScreenBalloonViewControllerPhone *)self balloonYOffsetFromTranscript];
    double v16 = [(CKFullScreenBalloonViewControllerPhone *)self attributionView];
    [v16 dismiss];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    double v17 = (void (**)(void))_Block_copy(aBlock);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_2;
    v31[3] = &unk_1E5622330;
    v31[4] = self;
    id v32 = v8;
    double v18 = (void (**)(void))_Block_copy(v31);
    if (v6
      && ![(CKFullScreenBalloonViewControllerPhone *)self animationsDisabledForTesting])
    {
      double v19 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
      [v19 tintDismissDuration];
      double v21 = v20;

      double v22 = [(CKFullScreenBalloonViewControllerPhone *)self pickerBalloonParentView];
      [v22 dismiss];

      double v23 = [(CKFullScreenBalloonViewControllerPhone *)self highlightButton];

      if (v23)
      {
        double v24 = [(CKFullScreenBalloonViewControllerPhone *)self highlightButton];
        [v24 performHideAnimationWithDuration:v18 completion:v21];

        double v18 = 0;
      }
      double v25 = (void *)MEMORY[0x1E4F42FF0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_3;
      v29[3] = &unk_1E5620F48;
      v30 = v17;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_4;
      v27[3] = &unk_1E5622358;
      double v18 = v18;
      id v28 = v18;
      [v25 animateWithDuration:0 delay:v29 options:v27 animations:v21 completion:0.0];
    }
    else
    {
      v17[2](v17);
      v18[2](v18);
    }

    goto LABEL_18;
  }
  int v11 = CKIsRunningInMessagesNotificationExtension();

  if (v11) {
    goto LABEL_4;
  }
  if (IMOSLoggingEnabled())
  {
    double v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "not performing closingAnimations: view is currently not presented", buf, 2u);
    }
  }
LABEL_18:
}

void __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tintView];
  [v2 setAlpha:0.0];

  objc_super v3 = [*(id *)(a1 + 32) replyButton];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) replyButton];
    [v4 setAlpha:0.0];
  }
}

uint64_t __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setInterfaceActions:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 fullScreenBalloonViewControllerDidDisappear:*(void *)(a1 + 32)];
  }
  BOOL v5 = [*(id *)(a1 + 32) balloonView];
  [v5 setAlpha:0.0];

  BOOL v6 = [*(id *)(a1 + 32) balloonView];
  [v6 setHidden:1];

  double v7 = [*(id *)(a1 + 32) replyButton];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) replyButton];
    [v8 setHidden:1];
  }
  double v9 = [*(id *)(a1 + 32) balloonView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v11 = [*(id *)(a1 + 32) balloonView];
    [v11 removeFromSuperview];
    CKBalloonViewReuse(v11);
    [*(id *)(a1 + 32) setBalloonView:0];
  }
  double v12 = [*(id *)(a1 + 32) highlightButton];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) highlightButton];
    [v13 setHidden:1];
  }
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    uint64_t v14 = [*(id *)(a1 + 32) delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      double v16 = [*(id *)(a1 + 32) delegate];
      [v16 fullScreenBalloonViewControllerRequestDismissKeyboardSnapshot:*(void *)(a1 + 32)];
    }
  }
  double v17 = [*(id *)(a1 + 32) delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    double v19 = [*(id *)(a1 + 32) delegate];
    [v19 fullScreenBalloonViewController:*(void *)(a1 + 32) updateTapbackPileAppearanceAsHidden:0];
  }
  double v20 = [*(id *)(a1 + 32) delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    double v22 = [*(id *)(a1 + 32) delegate];
    [v22 fullScreenBalloonViewController:*(void *)(a1 + 32) updateTranscriptBalloonViewAppearanceAsHidden:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v24 = *(uint64_t (**)(void))(result + 16);
    return v24();
  }
  return result;
}

uint64_t __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateTintViewAlpha
{
  char v3 = [(CKFullScreenBalloonViewControllerPhone *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  BOOL v5 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  id v9 = v5;
  if (v4 == 2) {
    [v5 darkModeTintAlpha];
  }
  else {
    [v5 tintAlpha];
  }
  double v7 = v6;
  id v8 = [(CKFullScreenBalloonViewController *)self tintView];
  [v8 setAlpha:v7];
}

- (void)keyboardWillShow:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F43AF0]];
  [v5 CGRectValue];
  double v7 = v6;

  id v8 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v7 - v16 + -24.0;
  if (v17 < v12)
  {
    double v18 = v12 + v17 - v12;
    -[CKFullScreenBalloonViewControllerPhone minimumAllowedBalloonOriginY:](self, "minimumAllowedBalloonOriginY:", v10, v12, v14, v16);
    if (v19 >= v18) {
      double v18 = v19;
    }
    double v20 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
    objc_msgSend(v20, "setFrame:", v10, v18, v14, v16);

    char v21 = [(CKFullScreenBalloonViewControllerPhone *)self pickerBalloonParentView];
    [v21 frame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    [(CKFullScreenBalloonViewControllerPhone *)self pickerBalloonParentViewY];
    double v29 = v28;
    v30 = [(CKFullScreenBalloonViewControllerPhone *)self pickerBalloonParentView];
    objc_msgSend(v30, "setFrame:", v23, v29, v25, v27);

    double v31 = [(CKFullScreenBalloonViewController *)self delegate];
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      double v33 = v18 - v12;
      double v34 = [(CKFullScreenBalloonViewController *)self delegate];
      id v38 = [v34 collectionView];

      [v38 contentOffset];
      double v36 = v35;
      [v38 contentOffset];
      objc_msgSend(v38, "setContentOffset:", v36, v37 - v33);
    }
  }
}

- (void)tapbackAttributionView:(id)a3 didTapToSaveSticker:(id)a4
{
  id v8 = a4;
  BOOL v5 = [(CKFullScreenBalloonViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(CKFullScreenBalloonViewController *)self delegate];
    [v7 fullScreenBalloonViewController:self didTapToSaveSticker:v8];
  }
}

- (void)stickerDetailViewController:(id)a3 selectedStickerPackWithAdamID:(id)a4
{
  id v5 = a4;
  char v6 = [(CKFullScreenBalloonViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_selectedStickerPackWithAdamID___block_invoke;
    v8[3] = &unk_1E5620AF8;
    v8[4] = self;
    id v9 = v5;
    [(CKFullScreenBalloonViewControllerPhone *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

void __100__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_selectedStickerPackWithAdamID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fullScreenBalloonViewController:*(void *)(a1 + 32) stickerPackTappedWithAdamID:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 fullScreenBalloonViewControllerHandleDismissTap:*(void *)(a1 + 32)];
}

- (void)stickerDetailViewController:(id)a3 deletedStickerWithTransferGUID:(id)a4
{
  id v5 = a4;
  char v6 = [(CKFullScreenBalloonViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __101__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_deletedStickerWithTransferGUID___block_invoke;
    v8[3] = &unk_1E5620AF8;
    v8[4] = self;
    id v9 = v5;
    [(CKFullScreenBalloonViewControllerPhone *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

void __101__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_deletedStickerWithTransferGUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fullScreenBalloonViewController:*(void *)(a1 + 32) deleteStickerWithTransferGUID:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 fullScreenBalloonViewControllerHandleDismissTap:*(void *)(a1 + 32)];
}

- (void)stickerDetailViewController:(id)a3 didRequestSaveSticker:(id)a4
{
  id v5 = a4;
  char v6 = [(CKFullScreenBalloonViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __92__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_didRequestSaveSticker___block_invoke;
    v8[3] = &unk_1E5620AF8;
    v8[4] = self;
    id v9 = v5;
    [(CKFullScreenBalloonViewControllerPhone *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

void __92__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_didRequestSaveSticker___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fullScreenBalloonViewController:*(void *)(a1 + 32) didRequestSaveSticker:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 fullScreenBalloonViewControllerHandleDismissTap:*(void *)(a1 + 32)];
}

- (void)_stickerDetailViewControllerCloseButtonPressed:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__CKFullScreenBalloonViewControllerPhone__stickerDetailViewControllerCloseButtonPressed___block_invoke;
  v3[3] = &unk_1E5620C40;
  v3[4] = self;
  [(CKFullScreenBalloonViewControllerPhone *)self dismissViewControllerAnimated:1 completion:v3];
}

void __89__CKFullScreenBalloonViewControllerPhone__stickerDetailViewControllerCloseButtonPressed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fullScreenBalloonViewControllerHandleDismissTap:*(void *)(a1 + 32)];
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  id v5 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  [v5 setAlpha:1.0];

  char v6 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  [v6 setHidden:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke;
  v8[3] = &unk_1E5620C40;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke_2;
  v7[3] = &unk_1E5620BF0;
  v7[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v8 options:v7 animations:0.2 completion:0.0];
}

void __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) livePhotoBalloonView];
  [v1 setAlpha:0.0];
}

uint64_t __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) livePhotoBalloonView];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);

  return [v3 setLivePhotoBalloonView:0];
}

- (void)disableAnimationsForTesting
{
}

- (BOOL)shouldPresentAsTapbackKeyboardInput
{
  id v2 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  char v3 = [v2 shouldPresentAsTapbackKeyboardInput];

  return v3;
}

- (void)setupReplyButton
{
  id v34 = [MEMORY[0x1E4F39C88] layer];
  [(CKFullScreenBalloonViewControllerPhone *)self setReplyButtonBorderLayer:v34];
  char v3 = +[CKUIBehavior sharedBehaviors];
  [v3 replyButtonBorderWidth];
  objc_msgSend(v34, "setLineWidth:");

  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v4 theme];
  char v6 = [v5 replyButtonBorderColor];
  objc_msgSend(v34, "setStrokeColor:", objc_msgSend(v6, "cgColor"));

  [v34 setFillColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB68])];
  char v7 = [MEMORY[0x1E4F39C88] layer];
  [(CKFullScreenBalloonViewControllerPhone *)self setReplyButtonMaskLayer:v7];
  id v8 = (void *)MEMORY[0x1E4F427D8];
  id v9 = +[CKUIBehavior sharedBehaviors];
  [v9 replyButtonBackgroundBlurRadius];
  double v10 = objc_msgSend(v8, "effectWithBlurRadius:");

  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v10];
  [(CKFullScreenBalloonViewControllerPhone *)self setReplyButtonEffectView:v11];
  double v12 = +[CKUIBehavior sharedBehaviors];
  double v13 = [v12 theme];
  double v14 = [v13 replyButtonColor];
  [v11 setBackgroundColor:v14];

  id v15 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(CKFullScreenBalloonViewControllerPhone *)self setReplyButtonView:v15];
  [v15 addSubview:v11];
  [v15 setUserInteractionEnabled:0];
  double v16 = [v15 layer];
  [v16 setMask:v7];

  double v17 = [v15 layer];
  [v17 addSublayer:v34];

  double v18 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  [(CKFullScreenBalloonViewController *)self setReplyButton:v18];
  [v18 setAutoresizingMask:5];
  double v19 = +[CKUIBehavior sharedBehaviors];
  [v19 replyButtonEdgeInsets];
  objc_msgSend(v18, "setContentEdgeInsets:");

  [v18 addTarget:self action:sel_replyButtonPressed_ forControlEvents:64];
  [v18 addSubview:v15];
  double v20 = [v18 layer];
  [v20 setContentsScale:0.0];

  if (IMEnableInlineReplyGlyph())
  {
    char v21 = [MEMORY[0x1E4F42A80] systemImageNamed:@"arrowshape.turn.up.backward.fill"];
    [v18 setImage:v21 forState:0];
    double v22 = [v18 imageView];
    [v18 bringSubviewToFront:v22];

    double v23 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v18 setTintColor:v23];
  }
  else
  {
    double v24 = [v18 titleLabel];
    double v25 = +[CKUIBehavior sharedBehaviors];
    double v26 = [v25 replyButtonFont];
    [v24 setFont:v26];

    double v27 = [v18 titleLabel];
    [v27 setAdjustsFontForContentSizeCategory:1];

    double v28 = CKFrameworkBundle();
    double v29 = [v28 localizedStringForKey:@"INLINE_REPLY_ORB_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v18 setTitle:v29 forState:0];

    char v21 = +[CKUIBehavior sharedBehaviors];
    double v23 = [v21 theme];
    v30 = [v23 replyButtonTextColor];
    [v18 setTitleColor:v30 forState:0];
  }
  double v31 = [MEMORY[0x1E4F39C88] layer];
  [(CKFullScreenBalloonViewControllerPhone *)self setTintViewMaskLayer:v31];
  char v32 = [(CKFullScreenBalloonViewController *)self tintView];
  double v33 = [v32 layer];
  [v33 setMask:v31];
}

- (void)updateReplyButtonSizeAndLocation:(CGRect)a3 layoutRelativeToHighlightButton:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  double v10 = [(CKFullScreenBalloonViewController *)self replyButton];

  if (!v10) {
    return;
  }
  double v11 = [(CKFullScreenBalloonViewController *)self replyButton];
  [v11 sizeToFit];

  double v12 = [(CKFullScreenBalloonViewController *)self replyButton];
  [v12 frame];
  double v81 = v14;
  double v82 = v13;

  id v15 = [(CKFullScreenBalloonViewController *)self replyButton];
  [v15 bounds];
  double v79 = v17;
  double v80 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = [(CKFullScreenBalloonViewController *)self tintView];
  [v22 frame];
  double v24 = v23;
  double v26 = v25;

  if (v19 <= 0.0 || v21 <= 0.0)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    double v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      int v83 = 134218240;
      double v84 = v19;
      __int16 v85 = 2048;
      double v86 = v21;
      _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "Invalid reply button size, CGFloat width = %f, height = %f", (uint8_t *)&v83, 0x16u);
    }
LABEL_23:

    return;
  }
  double v75 = v26;
  double v76 = v24;
  if (v4)
  {
    double v27 = +[CKUIBehavior sharedBehaviors];
    [v27 replyButtonRelativePosition];
    double v29 = v28;

    v30 = [(CKFullScreenBalloonViewController *)self chatItem];
    int v31 = [v30 transcriptOrientation];

    CGFloat v32 = x;
    CGFloat v33 = y;
    CGFloat v34 = width;
    CGFloat v35 = height;
    if (v31) {
      double v36 = v29 + CGRectGetMaxX(*(CGRect *)&v32) - v82;
    }
    else {
      double v36 = CGRectGetMinX(*(CGRect *)&v32) - v29;
    }
    v92.origin.CGFloat x = x;
    v92.origin.CGFloat y = y;
    v92.size.CGFloat width = width;
    v92.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v92);
    double v57 = [(CKFullScreenBalloonViewControllerPhone *)self traitCollection];
    [v57 displayScale];
    double v78 = round((MaxY + v21 * -0.5) * v58) / v58;
  }
  else
  {
    [(CKFullScreenBalloonViewControllerPhone *)self replyButtonVerticalOffset];
    double v77 = v38;
    v89.origin.CGFloat x = x;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat width = width;
    v89.size.CGFloat height = height;
    double v74 = CGRectGetMaxY(v89);
    uint64_t v39 = +[CKUIBehavior sharedBehaviors];
    [v39 replyButtonHorizontalOriginOffsetPercent];
    double v41 = v40;
    double v42 = [(CKFullScreenBalloonViewControllerPhone *)self traitCollection];
    [v42 displayScale];
    double v44 = v43;

    double v45 = [(CKFullScreenBalloonViewController *)self chatItem];
    LODWORD(v42) = [v45 transcriptOrientation] == 2;

    double v46 = [(CKFullScreenBalloonViewControllerPhone *)self view];
    double v47 = v46;
    double v78 = v74 - v77;
    double v48 = round(v19 * v41 * v44) / v44;
    if (v42)
    {
      [v46 layoutMargins];
      double v50 = v49;

      v90.origin.CGFloat x = x;
      v90.origin.CGFloat y = y;
      v90.size.CGFloat width = width;
      v90.size.CGFloat height = height;
      double v36 = fmax(v50, v48 + CGRectGetMinX(v90) - v19);
    }
    else
    {
      [v46 frame];
      double v52 = v51;
      v53 = [(CKFullScreenBalloonViewControllerPhone *)self view];
      [v53 layoutMargins];
      double v55 = v52 - v54 - v19;

      v91.origin.CGFloat x = x;
      v91.origin.CGFloat y = y;
      v91.size.CGFloat width = width;
      v91.size.CGFloat height = height;
      double v36 = fmin(v55, CGRectGetMaxX(v91) - v48);
    }
  }
  double v59 = fmin(v19, v21) * 0.5;
  if (v59 <= 0.0)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    double v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      int v83 = 134217984;
      double v84 = v59;
      _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "Invalid corner width for reply button, CGFloat width = %f", (uint8_t *)&v83, 0xCu);
    }
    goto LABEL_23;
  }
  int v60 = [(CKFullScreenBalloonViewController *)self replyButton];
  objc_msgSend(v60, "setFrame:", v36, v78, v82, v81);

  v61 = [(CKFullScreenBalloonViewControllerPhone *)self replyButtonEffectView];
  objc_msgSend(v61, "setFrame:", v80, v79, v19, v21);

  Mutable = CGPathCreateMutable();
  v93.origin.CGFloat x = v80;
  v93.origin.CGFloat y = v79;
  v93.size.CGFloat width = v19;
  v93.size.CGFloat height = v21;
  CGPathAddRoundedRect(Mutable, 0, v93, v59, v59);
  double v63 = [(CKFullScreenBalloonViewControllerPhone *)self replyButtonBorderLayer];
  [v63 setPath:Mutable];

  CGPathRelease(Mutable);
  v64 = CGPathCreateMutable();
  v94.origin.CGFloat y = v79;
  v94.origin.CGFloat x = v80;
  v94.size.CGFloat width = v19;
  v94.size.CGFloat height = v21;
  CGPathAddRoundedRect(v64, 0, v94, v59, v59);
  double v65 = [(CKFullScreenBalloonViewControllerPhone *)self replyButtonMaskLayer];
  [v65 setPath:v64];

  CGPathRelease(v64);
  v66 = CGPathCreateMutable();
  v95.origin.CGFloat y = v78;
  v95.origin.CGFloat x = v36;
  v95.size.CGFloat height = v81;
  v95.size.CGFloat width = v82;
  CGRect v96 = CGRectOffset(v95, -v76, -v75);
  CGFloat v67 = v96.origin.x;
  CGFloat v68 = v96.origin.y;
  CGFloat v69 = v96.size.width;
  CGFloat v70 = v96.size.height;
  v71 = [(CKFullScreenBalloonViewController *)self tintView];
  [v71 bounds];
  CGPathAddRect(v66, 0, v97);

  v98.origin.CGFloat x = v67;
  v98.origin.CGFloat y = v68;
  v98.size.CGFloat width = v69;
  v98.size.CGFloat height = v70;
  CGPathAddRoundedRect(v66, 0, v98, v59, v59);
  v72 = [(CKFullScreenBalloonViewControllerPhone *)self tintViewMaskLayer];
  [v72 setPath:v66];

  v73 = [(CKFullScreenBalloonViewControllerPhone *)self tintViewMaskLayer];
  [v73 setFillRule:*MEMORY[0x1E4F39FB8]];

  CGPathRelease(v66);
}

- (void)updateReplyButtonColor
{
  char v3 = [(CKFullScreenBalloonViewController *)self replyButton];

  if (v3)
  {
    BOOL v4 = [(CKFullScreenBalloonViewControllerPhone *)self replyButtonEffectView];
    id v5 = +[CKUIBehavior sharedBehaviors];
    char v6 = [v5 theme];
    char v7 = [v6 replyButtonColor];
    [v4 setBackgroundColor:v7];

    id v11 = [(CKFullScreenBalloonViewControllerPhone *)self replyButtonBorderLayer];
    id v8 = +[CKUIBehavior sharedBehaviors];
    id v9 = [v8 theme];
    double v10 = [v9 replyButtonBorderColor];
    objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v10, "cgColor"));
  }
}

- (double)replyButtonVerticalOffset
{
  char v3 = [(CKFullScreenBalloonViewController *)self replyButton];

  if (!v3) {
    return 0.0;
  }
  BOOL v4 = [(CKFullScreenBalloonViewController *)self replyButton];
  [v4 sizeToFit];

  id v5 = [(CKFullScreenBalloonViewController *)self replyButton];
  [v5 bounds];
  double v7 = v6;
  id v8 = +[CKUIBehavior sharedBehaviors];
  [v8 replyButtonVerticalOriginOffsetPercent];
  double v10 = v7 * v9;
  id v11 = [(CKFullScreenBalloonViewControllerPhone *)self traitCollection];
  [v11 displayScale];
  double v13 = round(v10 * v12) / v12;

  return v13;
}

- (double)replyButtonHeightFromBalloon
{
  char v3 = [(CKFullScreenBalloonViewController *)self replyButton];

  if (!v3) {
    return 0.0;
  }
  [(CKFullScreenBalloonViewControllerPhone *)self replyButtonVerticalOffset];
  double v5 = v4;
  double v6 = [(CKFullScreenBalloonViewController *)self replyButton];
  [v6 bounds];
  double v8 = v7 - v5;

  return v8;
}

- (void)messageHightlightButtonWasClicked:(id)a3
{
  uint64_t v4 = [a3 isHighlighted];
  double v5 = [(CKFullScreenBalloonViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(CKFullScreenBalloonViewController *)self delegate];
    double v7 = [(CKFullScreenBalloonViewController *)self chatItem];
    [v8 fullScreenBalloonViewController:self sendMessageHighlight:v4 forChatItem:v7];
  }
}

- (void)messageHightlightButtonDidFinishAnimating:(id)a3
{
  [a3 removeFromSuperview];
  uint64_t v4 = [(CKFullScreenBalloonViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKFullScreenBalloonViewController *)self delegate];
    [v6 fullScreenBalloonViewControllerMessageHighlightButtonDidFinishAnimating:self];
  }
}

- (CGRect)messageHightlightButtonBalloonViewFrame:(id)a3
{
  char v3 = [(CKFullScreenBalloonViewControllerPhone *)self balloonView];
  objc_msgSend(v3, "ck_identityTransformFrame");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)messageHightlightButtonReplyButtonFrame:(id)a3
{
  double v4 = [(CKFullScreenBalloonViewController *)self replyButton];
  if (v4)
  {
    double v5 = [(CKFullScreenBalloonViewController *)self replyButton];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (char)messageHightlightButtonTranscriptOrientation:(id)a3
{
  char v3 = [(CKFullScreenBalloonViewController *)self chatItem];
  char v4 = [v3 transcriptOrientation];

  return v4;
}

- (void)addHighlightButtonIfNeeded
{
  char v3 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  int v4 = [v3 shouldShowHighlightButton];

  if (v4)
  {
    double v5 = [(CKFullScreenBalloonViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v12 = [(CKFullScreenBalloonViewController *)self chatItem];
      double v7 = [(CKFullScreenBalloonViewController *)self delegate];
      int v8 = [v7 fullScreenBalloonViewControllerShouldShowHightlightButton:self forChatItem:v12];

      if (v8)
      {
        double v9 = -[CKMessageHighlightButton initWithInitialState:]([CKMessageHighlightButton alloc], "initWithInitialState:", [v12 syndicationType] != 0);
        [(CKMessageHighlightButton *)v9 setDelegate:self];
        double v10 = [(CKFullScreenBalloonViewControllerPhone *)self view];
        [v10 addSubview:v9];

        double v11 = [(CKFullScreenBalloonViewControllerPhone *)self view];
        [v11 bringSubviewToFront:v9];

        [(CKFullScreenBalloonViewControllerPhone *)self setHighlightButton:v9];
      }
    }
  }
}

- (CKTapbackPickerBalloonParentView)pickerBalloonParentView
{
  return self->_pickerBalloonParentView;
}

- (void)setPickerBalloonParentView:(id)a3
{
}

- (CKTapbackPickerViewController)tapbackPickerViewController
{
  return self->_tapbackPickerViewController;
}

- (void)setTapbackPickerViewController:(id)a3
{
}

- (_TtC7ChatKit24CKTapbackAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
}

- (UIView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (NSArray)interfaceActions
{
  return self->_interfaceActions;
}

- (void)setInterfaceActions:(id)a3
{
}

- (CKLivePhotoBalloonView)livePhotoBalloonView
{
  return self->_livePhotoBalloonView;
}

- (void)setLivePhotoBalloonView:(id)a3
{
}

- (UIVisualEffectView)replyButtonEffectView
{
  return self->_replyButtonEffectView;
}

- (void)setReplyButtonEffectView:(id)a3
{
}

- (CAShapeLayer)replyButtonBorderLayer
{
  return self->_replyButtonBorderLayer;
}

- (void)setReplyButtonBorderLayer:(id)a3
{
}

- (CAShapeLayer)replyButtonMaskLayer
{
  return self->_replyButtonMaskLayer;
}

- (void)setReplyButtonMaskLayer:(id)a3
{
}

- (CAShapeLayer)tintViewMaskLayer
{
  return self->_tintViewMaskLayer;
}

- (void)setTintViewMaskLayer:(id)a3
{
}

- (UIView)replyButtonView
{
  return self->_replyButtonView;
}

- (void)setReplyButtonView:(id)a3
{
}

- (double)balloonYOffsetFromTranscript
{
  return self->_balloonYOffsetFromTranscript;
}

- (void)setBalloonYOffsetFromTranscript:(double)a3
{
  self->_balloonYOffsetFromTranscript = a3;
}

- (BOOL)animationsDisabledForTesting
{
  return self->_animationsDisabledForTesting;
}

- (void)setAnimationsDisabledForTesting:(BOOL)a3
{
  self->_animationsDisabledForTesting = a3;
}

- (CKMessageHighlightButton)highlightButton
{
  return self->_highlightButton;
}

- (void)setHighlightButton:(id)a3
{
}

- (BOOL)hideBalloonView
{
  return self->_hideBalloonView;
}

- (void)setHideBalloonView:(BOOL)a3
{
  self->_hideBalloonView = a3;
}

- (BOOL)hasSetInitialBalloonViewFrame
{
  return self->_hasSetInitialBalloonViewFrame;
}

- (void)setHasSetInitialBalloonViewFrame:(BOOL)a3
{
  self->_hasSetInitialBalloonViewFrame = a3;
}

- (BOOL)animatedBalloonViewFrameUpdates
{
  return self->_animatedBalloonViewFrameUpdates;
}

- (void)setAnimatedBalloonViewFrameUpdates:(BOOL)a3
{
  self->_animatedBalloonViewFrameUpdates = a3;
}

- (NSArray)parentStickerCells
{
  return self->_parentStickerCells;
}

- (void)setParentStickerCells:(id)a3
{
}

- (NSArray)parentStickerChatItems
{
  return self->_parentStickerChatItems;
}

- (void)setParentStickerChatItems:(id)a3
{
}

- (NSArray)mirrorStickerCells
{
  return self->_mirrorStickerCells;
}

- (void)setMirrorStickerCells:(id)a3
{
}

- (NSArray)mirrorStickerViews
{
  return self->_mirrorStickerViews;
}

- (void)setMirrorStickerViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorStickerViews, 0);
  objc_storeStrong((id *)&self->_mirrorStickerCells, 0);
  objc_storeStrong((id *)&self->_parentStickerChatItems, 0);
  objc_storeStrong((id *)&self->_parentStickerCells, 0);
  objc_storeStrong((id *)&self->_highlightButton, 0);
  objc_storeStrong((id *)&self->_replyButtonView, 0);
  objc_storeStrong((id *)&self->_tintViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_replyButtonMaskLayer, 0);
  objc_storeStrong((id *)&self->_replyButtonBorderLayer, 0);
  objc_storeStrong((id *)&self->_replyButtonEffectView, 0);
  objc_storeStrong((id *)&self->_livePhotoBalloonView, 0);
  objc_storeStrong((id *)&self->_interfaceActions, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_tapbackPickerViewController, 0);

  objc_storeStrong((id *)&self->_pickerBalloonParentView, 0);
}

- (void)initializeTapbackPicker
{
  id v2 = self;
  sub_18F6236EC();
}

- (void)showTapbackPicker
{
  id v2 = self;
  sub_18F623A2C();
}

- (double)pickerBalloonParentViewY
{
  id v2 = self;
  sub_18F6243AC();
  double v4 = v3;

  return v4;
}

- (void)insertSticker:(id)a3
{
  id v5 = a3;
  char v6 = self;
  sub_18F62452C(a3);
}

- (void)sendTouchBarTapback:(int64_t)a3
{
  double v4 = self;
  sub_18F6247C8(a3);
}

- (double)balloonMinimumTopOffset:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  double v8 = sub_18F624EBC(x, y, width, height);

  return v8;
}

- (id)generateDuplicateBalloonViewForChatItem:(id)a3
{
  id v5 = a3;
  char v6 = self;
  id v7 = sub_18F62514C(a3);

  return v7;
}

- (void)tapbackPickerViewController:(id)a3 didSelectTapback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_18F628B2C((uint64_t)v7, (SEL *)&selRef_fullScreenBalloonViewController_didSelectTapback_, "didSelectTapback: during double-tap");
}

- (void)tapbackPickerViewController:(id)a3 didDeselectTapback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_18F628B2C((uint64_t)v7, (SEL *)&selRef_fullScreenBalloonViewController_didDeselectTapback_, "didDeselectTapback: during double-tap");
}

- (id)contextualCKChatItemsForTapbackPickerViewController:(id)a3
{
  double v4 = (CKFullScreenBalloonViewControllerPhone *)a3;
  id v5 = self;
  id v6 = [(CKFullScreenBalloonViewController *)v5 delegate];
  if (v6)
  {
    id v7 = (CKFullScreenBalloonViewControllerPhone *)[(CKFullScreenBalloonViewControllerDelegate *)v6 contextualChatItemsForFullScreenBalloonViewController:v5];
    swift_unknownObjectRelease();
    sub_18F4DD028();
    sub_18F7B99C0();

    double v4 = v5;
    id v5 = v7;
  }

  sub_18F4DD028();
  double v8 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)smartEmojiResponses:(id)a3 chatItem:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  double v9 = [(CKFullScreenBalloonViewController *)v7 delegate];
  if (v9)
  {
    double v10 = v9;
    if ([(CKFullScreenBalloonViewControllerDelegate *)v9 respondsToSelector:sel_fullScreenBalloonViewControllerSmartEmojiResponses_])
    {
      double v11 = (CKFullScreenBalloonViewControllerPhone *)[(CKFullScreenBalloonViewControllerDelegate *)v10 fullScreenBalloonViewControllerSmartEmojiResponses:v7];
      sub_18F7B99C0();

      swift_unknownObjectRelease();
      id v7 = v11;
      goto LABEL_6;
    }
    swift_unknownObjectRelease();
  }

LABEL_6:
  id v12 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v12;
}

- (void)tapbackPickerBalloonParentView:(id)a3 didInsertTapback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CKFullScreenBalloonViewControllerPhone.tapbackPickerBalloonParentView(_:didInsertTapback:)((uint64_t)v6, (uint64_t)v7);
}

- (id)shouldShowStickerSuggestionsFor:(void *)a3
{
  id v4 = a3;
  id v5 = a1;
  id v6 = objc_msgSend(v5, sel_delegate);
  if (v6)
  {
    id v7 = v6;
    if (objc_msgSend(v6, sel_respondsToSelector_, sel_fullScreenBalloonViewControllerShouldEnableStickerTapbacks_))
    {
      id v8 = objc_msgSend(v7, sel_fullScreenBalloonViewControllerShouldEnableStickerTapbacks_, v5);

      swift_unknownObjectRelease();
      return v8;
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  return 0;
}

- (id)textInputContextIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(CKFullScreenBalloonViewController *)v5 delegate];
  if (v6)
  {
    id v7 = v6;
    if ([(CKFullScreenBalloonViewControllerDelegate *)v6 respondsToSelector:sel_textInputContextIdentifierForFullScreenBalloonViewController_])
    {
      id v8 = [(CKFullScreenBalloonViewControllerDelegate *)v7 textInputContextIdentifierForFullScreenBalloonViewController:v5];
      if (v8)
      {
        double v9 = v8;
        sub_18F7B97E0();

        swift_unknownObjectRelease();
        double v10 = (void *)sub_18F7B97A0();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  double v10 = 0;
LABEL_8:

  return v10;
}

- (void)tapbackPickerBalloonParentView:(id)a3 requestedPresentPlugin:(id)a4 payloadID:(id)a5
{
  if (a4) {
    uint64_t v7 = sub_18F7B9660();
  }
  else {
    uint64_t v7 = 0;
  }
  sub_18F7B97E0();
  id v8 = a3;
  double v13 = self;
  double v9 = [(CKFullScreenBalloonViewController *)v13 delegate];
  if (v9)
  {
    double v10 = v9;
    if ([(CKFullScreenBalloonViewControllerDelegate *)v9 respondsToSelector:sel_fullScreenBalloonViewController_requestedPresentPlugin_withPayloadID_])
    {
      if (v7) {
        double v11 = (void *)sub_18F7B9640();
      }
      else {
        double v11 = 0;
      }
      id v12 = (void *)sub_18F7B97A0();
      [(CKFullScreenBalloonViewControllerDelegate *)v10 fullScreenBalloonViewController:v13 requestedPresentPlugin:v11 withPayloadID:v12];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

      goto LABEL_13;
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_13:
}

- (void)tapbackPickerBalloonParentViewRequestedAppCardDismiss:(id)a3
{
}

- (void)tapbackPickerBalloonParentViewRequestedShowEmojiKeyboard:(id)a3
{
}

- (void)tapbackPickerBalloonParentViewReturningToSuggestionPicker:(id)a3
{
}

- (id)tapbackPickerBalloonParentViewTapbackPileView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = _sSo38CKFullScreenBalloonViewControllerPhoneC7ChatKitE013tapbackPickerc6Parentd11TapbackPileD0yAC023AggregateAcknowledgmentcD0CSgAC0ljckD0CF_0();

  return v6;
}

- (id)tapbackPickerBalloonParentViewTapbackBackingBalloon:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = _sSo38CKFullScreenBalloonViewControllerPhoneC7ChatKitE013tapbackPickerc6Parentd14TapbackBackingC0ySo6UIViewCSgAC0ljckD0CF_0();

  return v6;
}

- (id)tapbackPickerBalloonParentViewTapbackTintableMessageBalloon:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = CKFullScreenBalloonViewControllerPhone.tapbackPickerBalloonParentViewTapbackTintableMessageBalloon(_:)((uint64_t)v4);

  return v6;
}

- (void)keyCommandSelectTapback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18F62721C(v4);
}

@end