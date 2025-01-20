@interface CKMessageEditingViewController
- (BOOL)animatingIn;
- (BOOL)animatingOut;
- (BOOL)becomeFirstResponder;
- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3;
- (BOOL)isInitialLoad;
- (BOOL)messageEditingViewBalloonHasTail;
- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4;
- (BOOL)wantsBackingTranscriptToIgnoreContentOffsetChanges;
- (CGRect)editedMessageAchorPosition;
- (CKConversation)conversation;
- (CKMentionsController)mentionsController;
- (CKMessageEditingView)messageEditingView;
- (CKMessageEditingViewController)initWithTransitionContext:(id)a3 conversation:(id)a4;
- (CKMessageEditingViewControllerInteractionDelegate)interactionDelegate;
- (CKTranscriptOverlayTransitionContext)transitionContext;
- (CKTranscriptOverlayTransitionDelegate)transcriptOverlayTransitionDelegate;
- (NSDictionary)proofreadingInfo;
- (UIEdgeInsets)messageEditingViewDismissAnimationContentInsets;
- (UIView)balloonViewForAlignment;
- (UIVisualEffectView)transcriptOverlayView;
- (_TtC7ChatKit23CKTextEffectCoordinator)textEffectsCoordinator;
- (char)messageEditingColor;
- (double)entryViewOffset;
- (double)messageEditingViewDismissAnimationBalloonMaxWidth;
- (double)viewHeightForEditedMessageAnchorPosition;
- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4;
- (id)textEffectCoordinator:(id)a3 textViewForTextViewIdentifier:(id)a4;
- (id)visibleTextViewIdentifiersFor:(id)a3;
- (void)_animateIn;
- (void)_animateOutWithState:(int64_t)a3;
- (void)_applyProofreadingIfNecessary;
- (void)_informDelegateOfUpdatedBalloonViewFrame;
- (void)_requestDismissal;
- (void)configureForInitialAppearance;
- (void)dismissAndRejectChanges;
- (void)dismissIfNoChanges;
- (void)messageEditingView:(id)a3 didChangeTextAnimationInRange:(_NSRange)a4;
- (void)messageEditingViewConfirmButtonSelected:(id)a3;
- (void)messageEditingViewDidUpdateBalloonViewContent:(id)a3;
- (void)messageEditingViewRejectButtonSelected:(id)a3;
- (void)messageEditingViewWritingToolsDidEnd:(id)a3;
- (void)messageEditingViewWritingToolsWillBegin:(id)a3;
- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3;
- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3;
- (void)setAnimatingIn:(BOOL)a3;
- (void)setAnimatingOut:(BOOL)a3;
- (void)setConversation:(id)a3;
- (void)setEditedMessageAchorPosition:(CGRect)a3;
- (void)setEntryViewOffset:(double)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setMentionsController:(id)a3;
- (void)setMessageEditingView:(id)a3;
- (void)setProofreadingInfo:(id)a3;
- (void)setTextEffectsCoordinator:(id)a3;
- (void)setTranscriptOverlayTransitionDelegate:(id)a3;
- (void)setTranscriptOverlayView:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setViewHeightForEditedMessageAnchorPosition:(double)a3;
- (void)transcriptContentInsetsDidChange;
- (void)transcriptOverlayTapGestureRecognized:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKMessageEditingViewController

- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3
{
  id v4 = [(CKMessageEditingViewController *)self messageEditingView];
  [v4 modifySelectedTextByTogglingTextEffectType:a3];
}

- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3
{
  id v4 = [(CKMessageEditingViewController *)self messageEditingView];
  [v4 modifySelectedTextByTogglingTextStyle:a3];
}

- (CKMessageEditingViewController)initWithTransitionContext:(id)a3 conversation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEditingViewController;
  v9 = [(CKMessageEditingViewController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_isInitialLoad = 1;
    objc_storeStrong((id *)&v9->_transitionContext, a3);
    CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v10->_editedMessageAchorPosition.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v10->_editedMessageAchorPosition.size = v11;
    objc_storeStrong((id *)&v10->_conversation, a4);
    v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v13 = [v12 isExpressiveTextEnabled];

    if (v13)
    {
      if (!+[CKTextEffectCoordinator messageEditingTextEffectCoordinationDisabled])
      {
        v14 = [[CKTextEffectCoordinatorConfiguration alloc] initWithLogIdentifier:@"message_editing" timeAfterLastAnimationInSeconds:3.5];
        v15 = [[_TtC7ChatKit23CKTextEffectCoordinator alloc] initWithConfiguration:v14];
        textEffectsCoordinator = v10->_textEffectsCoordinator;
        v10->_textEffectsCoordinator = v15;

        [(CKTextEffectCoordinator *)v10->_textEffectsCoordinator setDelegate:v10];
      }
    }
  }

  return v10;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)CKMessageEditingViewController;
  [(CKMessageEditingViewController *)&v28 viewDidLoad];
  v3 = [(CKMessageEditingViewController *)self view];
  [v3 setBackgroundColor:0];

  id v4 = objc_alloc(MEMORY[0x1E4F43028]);
  v5 = [(CKMessageEditingViewController *)self view];
  [v5 bounds];
  v6 = objc_msgSend(v4, "initWithFrame:");

  id v7 = [(CKMessageEditingViewController *)self view];
  [v7 insertSubview:v6 atIndex:0];

  [(CKMessageEditingViewController *)self setTranscriptOverlayView:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_transcriptOverlayTapGestureRecognized_];
  [v6 addGestureRecognizer:v8];
  v9 = [[CKMessageEditingView alloc] initWithMessageEditingViewDelegate:self];
  [(CKMessageEditingView *)v9 setMessageEditingViewDelegate:self];
  v10 = [v6 contentView];
  [v10 addSubview:v9];

  [(CKMessageEditingViewController *)self setMessageEditingView:v9];
  CGSize v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 isExpressiveTextEnabled];

  if (v12)
  {
    int v13 = [(CKMessageEditingViewController *)self conversation];
    v14 = [v13 chat];
    uint64_t v15 = [v14 supportsCapabilities:0x100000];

    v16 = [(CKMessageEditingViewController *)self messageEditingView];
    v17 = [v16 messageEditingBalloonView];
    objc_super v18 = [v17 messageEditingBalloonTextView];
    [v18 setExpressiveTextEnabled:v15];
  }
  v19 = [CKMentionsController alloc];
  v20 = [(CKMessageEditingViewController *)self messageEditingView];
  v21 = [v20 messageEditingBalloonView];
  v22 = [v21 messageEditingBalloonTextView];
  v23 = [(CKMessageEditingViewController *)self conversation];
  v24 = [(CKMentionsController *)v19 initWithEntryTextView:v22 conversation:v23];
  [(CKMessageEditingViewController *)self setMentionsController:v24];

  v25 = [(CKMessageEditingViewController *)self mentionsController];
  [v25 deferredSetup];

  v26 = [(CKMessageEditingViewController *)self view];
  [v26 setNeedsLayout];

  v27 = [(CKMessageEditingViewController *)self view];
  [v27 layoutIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v60.receiver = self;
  v60.super_class = (Class)CKMessageEditingViewController;
  [(CKMessageEditingViewController *)&v60 viewDidLayoutSubviews];
  v3 = [(CKMessageEditingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int v12 = [(CKMessageEditingViewController *)self messageEditingView];
  [v12 frame];
  CGFloat v57 = v14;
  CGFloat v58 = v13;
  CGFloat v55 = v16;
  CGFloat v56 = v15;

  v17 = [(CKMessageEditingViewController *)self transcriptOverlayView];
  objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

  if ([(CKMessageEditingViewController *)self isInitialLoad])
  {
    [(CKMessageEditingViewController *)self configureForInitialAppearance];
    [(CKMessageEditingViewController *)self setIsInitialLoad:0];
    dispatch_time_t v18 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CKMessageEditingViewController_viewDidLayoutSubviews__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_after(v18, MEMORY[0x1E4F14428], block);
  }
  BOOL IsEmpty = CGRectIsEmpty(self->_editedMessageAchorPosition);
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if (!IsEmpty)
  {
    CGFloat x = self->_editedMessageAchorPosition.origin.x;
    CGFloat y = self->_editedMessageAchorPosition.origin.y;
    CGFloat width = self->_editedMessageAchorPosition.size.width;
    CGFloat height = self->_editedMessageAchorPosition.size.height;
  }
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  v24 = +[CKUIBehavior sharedBehaviors];
  [v24 messageEditingKeyboardToBalloonPreferredPadding];
  double v53 = v25;

  v26 = +[CKUIBehavior sharedBehaviors];
  [v26 messageEditingKeyboardToBalloonMinimumPadding];
  double v28 = v27;

  v29 = [(CKMessageEditingViewController *)self interactionDelegate];
  [v29 transcriptContentInsetsForMessageEditingViewController:self];
  double v31 = v30;
  double v33 = v32;

  v34 = +[CKUIBehavior sharedBehaviors];
  [v34 messageEditingBalloonToNavBarMinimumPadding];
  double v36 = v35;

  v61.origin.CGFloat x = v5;
  v61.origin.CGFloat y = v7;
  v61.size.CGFloat width = v9;
  v61.size.CGFloat height = v11;
  double v37 = v36 + v31 + CGRectGetMinY(v61);
  v62.origin.CGFloat x = v5;
  v62.origin.CGFloat y = v7;
  v62.size.CGFloat width = v9;
  v62.size.CGFloat height = v11;
  CGFloat v38 = CGRectGetMaxY(v62) - v33;
  double v39 = v38 - v53;
  double v40 = v38 - v28;
  v41 = [(CKMessageEditingViewController *)self messageEditingView];
  objc_msgSend(v41, "sizeThatFits:", v9, v11);
  double v43 = v42;

  double MaxY = CGRectGetMaxY(v54);
  if (v39 < MaxY) {
    double MaxY = v39;
  }
  double v45 = MaxY - v43;
  if (v45 >= v37) {
    double v46 = v45;
  }
  else {
    double v46 = v37;
  }
  double v47 = v43 + v46;
  if (v43 + v46 >= v40) {
    double v47 = v40;
  }
  double v48 = v47 - v46;
  v49 = [(CKMessageEditingViewController *)self messageEditingView];
  objc_msgSend(v49, "setFrame:", v5, v46, v9, v48);

  v50 = [(CKMessageEditingViewController *)self messageEditingView];
  [v50 frame];
  v64.origin.CGFloat y = v57;
  v64.origin.CGFloat x = v58;
  v64.size.CGFloat height = v55;
  v64.size.CGFloat width = v56;
  if (CGRectEqualToRect(v63, v64))
  {
  }
  else
  {
    v51 = [(CKMessageEditingViewController *)self messageEditingView];
    int v52 = [v51 firstLayoutPassCompleted];

    if (v52) {
      [(CKMessageEditingViewController *)self _informDelegateOfUpdatedBalloonViewFrame];
    }
  }
}

void __55__CKMessageEditingViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textEffectsCoordinator];
  [v2 setPaused:0 includingAnimators:1];

  id v3 = [*(id *)(a1 + 32) textEffectsCoordinator];
  [v3 updateWithReason:@"resuming coordinator because CKMessageEditingViewController did finish initialLoad"];
}

- (BOOL)becomeFirstResponder
{
  v2 = [(CKMessageEditingViewController *)self messageEditingView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (void)configureForInitialAppearance
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = [a2 visibleChatItemToFrameMap];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "Anchor chat item %@ has no frame in the visible chat item map for inital layout. Map: %@", (uint8_t *)&v6, 0x16u);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEditingViewController;
  [(CKMessageEditingViewController *)&v5 viewDidAppear:a3];
  [(CKMessageEditingViewController *)self _animateIn];
  double v4 = [(CKMessageEditingViewController *)self mentionsController];
  [v4 checkForMentions];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKMessageEditingViewController;
  -[CKMessageEditingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(CKMessageEditingViewController *)self editedMessageAchorPosition];
  if (!CGRectIsEmpty(v18) && ![(CKMessageEditingViewController *)self isInitialLoad])
  {
    [(CKMessageEditingViewController *)self viewHeightForEditedMessageAnchorPosition];
    if (vabdd_f64(v8, height) > 2.22044605e-16)
    {
      id location = 0;
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      aBlock[3] = &unk_1E5625EE8;
      objc_copyWeak(v15, &location);
      v15[1] = *(id *)&height;
      double v9 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v10 = v9;
      if (v7)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v11[3] = &unk_1E5628760;
        int v12 = v9;
        objc_copyWeak(&v13, &location);
        [v7 animateAlongsideTransition:v11 completion:0];
        objc_destroyWeak(&v13);
      }
      else
      {
        v9[2](v9);
      }

      objc_destroyWeak(v15);
      objc_destroyWeak(&location);
    }
  }
}

void __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  int v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditedMessageAchorPosition:", v2, v3, v4, v5);

  double v8 = *(double *)(a1 + 40);
  id v9 = objc_loadWeakRetained(v6);
  [v9 setViewHeightForEditedMessageAnchorPosition:v8];

  id v11 = objc_loadWeakRetained(v6);
  uint64_t v10 = [v11 view];
  [v10 setNeedsLayout];
}

void __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v2 = [WeakRetained view];
  [v2 layoutIfNeeded];
}

- (void)dismissAndRejectChanges
{
  if (![(CKMessageEditingViewController *)self animatingOut])
  {
    [(CKMessageEditingViewController *)self _animateOutWithState:4];
  }
}

- (void)dismissIfNoChanges
{
  double v3 = [(CKMessageEditingViewController *)self messageEditingView];
  double v4 = [v3 currentComposition];

  double v5 = [(CKMessageEditingViewController *)self messageEditingView];
  int v6 = [v5 originalComposition];

  LODWORD(v5) = [v4 isPlainTextEqual:v6];
  int v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Message content is unchanged, dismissing edit view controller", buf, 2u);
      }
    }
    [(CKMessageEditingViewController *)self _animateOutWithState:4];
  }
  else if (v7)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Message content is changed, not dismissing edit view controller", v10, 2u);
    }
  }
}

- (void)_animateIn
{
  [(CKMessageEditingViewController *)self setAnimatingIn:1];
  double v3 = [(CKMessageEditingViewController *)self transcriptOverlayView];

  if (v3)
  {
    double v4 = +[CKUIBehavior sharedBehaviors];
    [v4 messageEditingAnimateInDuration];
    double v6 = v5;

    int v7 = +[CKUIBehavior sharedBehaviors];
    [v7 messageEditingAnimateInDamping];
    double v9 = v8;

    uint64_t v10 = [(CKMessageEditingViewController *)self transcriptOverlayTransitionDelegate];
    [(id)v10 transcriptOverlayViewControllerWillAnimateIn:self];

    id v11 = [(CKMessageEditingViewController *)self splitViewController];
    LOBYTE(v10) = [v11 isCollapsed];
    int v12 = [(CKMessageEditingViewController *)self splitViewController];
    id v13 = v12;
    if (v10) {
      [v12 masterViewController];
    }
    else {
    double v14 = [v12 detailViewController];
    }

    double v15 = [v14 navigationBar];
    [v15 setNeedsLayout];

    double v16 = [v14 navigationBar];
    [v16 layoutIfNeeded];

    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__CKMessageEditingViewController__animateIn__block_invoke;
    aBlock[3] = &unk_1E5622A18;
    BOOL v22 = IsReduceMotionEnabled;
    void aBlock[4] = self;
    CGRect v18 = _Block_copy(aBlock);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__CKMessageEditingViewController__animateIn__block_invoke_2;
    v20[3] = &unk_1E5620BF0;
    v20[4] = self;
    v19 = _Block_copy(v20);
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v18 usingSpringWithDamping:v19 initialSpringVelocity:v6 options:0.0 animations:v9 completion:0.0];
  }
}

void __44__CKMessageEditingViewController__animateIn__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    double v2 = [*(id *)(a1 + 32) messageEditingView];
    [v2 setAlpha:1.0];
  }
  double v3 = [*(id *)(a1 + 32) messageEditingView];
  [v3 setMessageEditingViewState:2];

  double v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = [v4 theme];
  double v6 = [v5 messageEditingTranscriptOverlayBackgroundEffects];
  int v7 = [*(id *)(a1 + 32) transcriptOverlayView];
  [v7 setBackgroundEffects:v6];

  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [v8 theme];
  uint64_t v10 = [v9 messageEditingTranscriptOverlayBackgroundColor];
  id v11 = [*(id *)(a1 + 32) transcriptOverlayView];
  [v11 setBackgroundColor:v10];

  int v12 = [*(id *)(a1 + 32) transcriptOverlayTransitionDelegate];
  [v12 transcriptOverlayViewControllerIsAnimatingIn:*(void *)(a1 + 32)];

  id v13 = [*(id *)(a1 + 32) interactionDelegate];
  [v13 messageEditingViewControllerIsAnimatingIn:*(void *)(a1 + 32)];

  double v14 = [*(id *)(a1 + 32) messageEditingView];
  [v14 setNeedsLayout];

  id v15 = [*(id *)(a1 + 32) messageEditingView];
  [v15 layoutIfNeeded];
}

uint64_t __44__CKMessageEditingViewController__animateIn__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatingIn:0];
  double v2 = [*(id *)(a1 + 32) transcriptOverlayTransitionDelegate];
  [v2 transcriptOverlayViewControllerDidAnimateIn:*(void *)(a1 + 32)];

  double v3 = *(void **)(a1 + 32);

  return [v3 _applyProofreadingIfNecessary];
}

- (void)_animateOutWithState:(int64_t)a3
{
  double v5 = [(CKMessageEditingViewController *)self interactionDelegate];
  [v5 messageEditingViewControllerWillAnimateOut:self];

  [(CKMessageEditingViewController *)self setAnimatingOut:1];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  uint64_t v7 = *MEMORY[0x1E4F1DB28];
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  id v11 = [(CKMessageEditingViewController *)self transitionContext];
  int v12 = v11;
  if (!IsReduceMotionEnabled)
  {
    id v13 = [v11 anchorChatItemGUID];
    if ([v13 length])
    {
      double v14 = [(CKMessageEditingViewController *)self transcriptOverlayTransitionDelegate];
      id v15 = [v14 updatedFrameMapForTranscriptOverlayViewController:self];

      double v16 = [v15 objectForKeyedSubscript:v13];
      objc_super v17 = v16;
      if (v16)
      {
        [v16 CGRectValue];
        uint64_t v7 = v18;
        uint64_t v8 = v19;
        uint64_t v9 = v20;
        uint64_t v10 = v21;
      }
      else
      {
        BOOL v22 = IMLogHandleForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          [(CKMessageEditingViewController *)(uint64_t)v13 _animateOutWithState:v22];
        }
      }
    }
    else
    {
      id v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CKMessageEditingViewController _animateOutWithState:]((uint64_t)v12, v15);
      }
    }
  }
  if (a3 == 4)
  {
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Edit rejected, resetting balloon to original text", buf, 2u);
      }
    }
    v24 = [(CKMessageEditingViewController *)self messageEditingView];
    [v24 resetMessageToOriginalContent];
  }
  double v25 = +[CKUIBehavior sharedBehaviors];
  [v25 messageEditingAnimateOutDuration];
  double v27 = v26;

  double v28 = +[CKUIBehavior sharedBehaviors];
  [v28 messageEditingAnimateOutDamping];
  double v30 = v29;

  double v31 = [(CKMessageEditingViewController *)self transcriptOverlayTransitionDelegate];
  [v31 transcriptOverlayViewControllerWillAnimateOut:self];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CKMessageEditingViewController__animateOutWithState___block_invoke;
  aBlock[3] = &unk_1E5628788;
  void aBlock[4] = self;
  BOOL v37 = IsReduceMotionEnabled;
  void aBlock[5] = v7;
  aBlock[6] = v8;
  aBlock[7] = v9;
  aBlock[8] = v10;
  aBlock[9] = a3;
  double v32 = _Block_copy(aBlock);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __55__CKMessageEditingViewController__animateOutWithState___block_invoke_2;
  v34[3] = &unk_1E56287B0;
  BOOL v35 = IsReduceMotionEnabled;
  v34[4] = self;
  double v33 = _Block_copy(v34);
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v32 usingSpringWithDamping:v33 initialSpringVelocity:v27 options:0.0 animations:v30 completion:0.0];
  if (!IsReduceMotionEnabled) {
    [(CKMessageEditingViewController *)self performSelector:sel__requestDismissal withObject:0 afterDelay:v27];
  }
}

void __55__CKMessageEditingViewController__animateOutWithState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) transcriptOverlayView];
  [v2 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];

  double v3 = [*(id *)(a1 + 32) transcriptOverlayView];
  [v3 setBackgroundColor:0];

  if (*(unsigned char *)(a1 + 80) || CGRectIsEmpty(*(CGRect *)(a1 + 40)))
  {
    double v4 = [*(id *)(a1 + 32) messageEditingView];
    [v4 setAlpha:0.0];
  }
  else
  {
    double v5 = *(double *)(a1 + 40);
    double v6 = *(double *)(a1 + 48);
    double v7 = *(double *)(a1 + 56);
    double v8 = *(double *)(a1 + 64);
    uint64_t v9 = [*(id *)(a1 + 32) messageEditingView];
    objc_msgSend(v9, "setFrame:", v5, v6, v7, v8);

    uint64_t v10 = *(void *)(a1 + 72);
    id v11 = [*(id *)(a1 + 32) messageEditingView];
    [v11 setMessageEditingViewState:v10];

    int v12 = [*(id *)(a1 + 32) messageEditingView];
    [v12 setNeedsLayout];

    double v4 = [*(id *)(a1 + 32) messageEditingView];
    [v4 layoutIfNeeded];
  }

  id v13 = [*(id *)(a1 + 32) interactionDelegate];
  [v13 messageEditingViewControllerIsAnimatingOut:*(void *)(a1 + 32)];

  id v14 = [*(id *)(a1 + 32) transcriptOverlayTransitionDelegate];
  [v14 transcriptOverlayViewControllerIsAnimatingOut:*(void *)(a1 + 32)];
}

void __55__CKMessageEditingViewController__animateOutWithState___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _requestDismissal];
  }
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:0];

  id v3 = [*(id *)(a1 + 32) interactionDelegate];
  [v3 messageEditingViewControllerDidFinishAnimatingOut:*(void *)(a1 + 32)];
}

- (void)_requestDismissal
{
  id v3 = [(CKMessageEditingViewController *)self transcriptOverlayTransitionDelegate];
  [v3 transcriptOverlayViewControllerDidAnimateOut:self];

  id v4 = [(CKMessageEditingViewController *)self interactionDelegate];
  [v4 messageEditingViewControllerRequestsDismissal:self presentKeyboard:1];
}

- (void)transcriptOverlayTapGestureRecognized:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Transcript overlay tap gesture recognized", v6, 2u);
    }
  }
  [(CKMessageEditingViewController *)self dismissIfNoChanges];
}

- (void)messageEditingViewWritingToolsWillBegin:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v5 = [v4 isExpressiveTextEnabled];

  if (v5)
  {
    textEffectsCoordinator = self->_textEffectsCoordinator;
    if (textEffectsCoordinator)
    {
      [(CKTextEffectCoordinator *)textEffectsCoordinator reset];
      [(CKTextEffectCoordinator *)self->_textEffectsCoordinator setPaused:1 includingAnimators:1];
      double v7 = self->_textEffectsCoordinator;
      [(CKTextEffectCoordinator *)v7 updateWithReason:@"pausing because writing tools will begin"];
    }
  }
}

- (void)messageEditingViewWritingToolsDidEnd:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v5 = [v4 isExpressiveTextEnabled];

  if (v5)
  {
    textEffectsCoordinator = self->_textEffectsCoordinator;
    if (textEffectsCoordinator)
    {
      [(CKTextEffectCoordinator *)textEffectsCoordinator setPaused:0 includingAnimators:0];
      double v7 = self->_textEffectsCoordinator;
      [(CKTextEffectCoordinator *)v7 updateWithReason:@"unpausing because writing tools did end."];
    }
  }
}

- (void)messageEditingViewConfirmButtonSelected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Confirm edit button selected", v15, 2u);
    }
  }
  double v6 = [v4 currentComposition];
  double v7 = [v6 text];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = [v4 originalComposition];
    int v10 = [v6 hasNotBeenEdited:v9];
    if (v10) {
      id v11 = 0;
    }
    else {
      id v11 = v6;
    }
    if (v10) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 3;
    }
    id v13 = v11;
    id v14 = [(CKMessageEditingViewController *)self interactionDelegate];
    [v14 messageEditingViewController:self confirmedEditWithComposition:v13];

    [(CKMessageEditingViewController *)self _animateOutWithState:v12];
  }
  else
  {
    uint64_t v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CKMessageEditingViewController messageEditingViewConfirmButtonSelected:](v9);
    }
  }
}

- (void)messageEditingViewRejectButtonSelected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Reject edit button selected", v6, 2u);
    }
  }
  [(CKMessageEditingViewController *)self _animateOutWithState:4];
}

- (double)messageEditingViewDismissAnimationBalloonMaxWidth
{
  id v3 = [(CKMessageEditingViewController *)self interactionDelegate];
  [v3 balloonMaxWidthForMessageEditingViewController:self];
  double v5 = v4;

  return v5;
}

- (UIEdgeInsets)messageEditingViewDismissAnimationContentInsets
{
  id v3 = [(CKMessageEditingViewController *)self transitionContext];
  double v4 = [v3 anchorChatItemGUID];

  double v5 = [(CKMessageEditingViewController *)self interactionDelegate];
  [v5 messageEditingViewController:self contentInsetsForChatItemGuid:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (BOOL)messageEditingViewBalloonHasTail
{
  double v2 = self;
  id v3 = [(CKMessageEditingViewController *)self transitionContext];
  double v4 = [v3 anchorChatItemGUID];

  double v5 = [(CKMessageEditingViewController *)v2 interactionDelegate];
  LOBYTE(v2) = [v5 messageEditingViewController:v2 balloonHasTailForChatItemGuid:v4];

  return (char)v2;
}

- (char)messageEditingColor
{
  double v2 = self;
  id v3 = [(CKMessageEditingViewController *)self transitionContext];
  double v4 = [v3 anchorChatItemGUID];

  double v5 = [(CKMessageEditingViewController *)v2 interactionDelegate];
  LOBYTE(v2) = [v5 messageEditingViewController:v2 colorForChatItemGuid:v4];

  return (char)v2;
}

- (void)messageEditingViewDidUpdateBalloonViewContent:(id)a3
{
  double v4 = [(CKMessageEditingViewController *)self view];
  [v4 setNeedsLayout];

  double v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isExpressiveTextEnabled];

  if (v6)
  {
    textEffectsCoordinator = self->_textEffectsCoordinator;
    if (textEffectsCoordinator)
    {
      [(CKTextEffectCoordinator *)textEffectsCoordinator updateWithReason:@"message editing balloon view did update balloon view content"];
    }
  }
}

- (void)messageEditingView:(id)a3 didChangeTextAnimationInRange:(_NSRange)a4
{
  NSUInteger location = a4.location;
  int v6 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3, a4.location, a4.length);
  int v7 = [v6 isExpressiveTextEnabled];

  if (v7 && self->_textEffectsCoordinator)
  {
    double v8 = [[CKTextEffectCoordinatorContinuationState alloc] initWithTextViewIdentifier:@"textView" locationInAttributedText:location ignoreTextViewEligibilityCheck:0];
    [(CKTextEffectCoordinator *)self->_textEffectsCoordinator resetAndContinueFromState:v8];
  }
}

- (void)_informDelegateOfUpdatedBalloonViewFrame
{
  id v4 = [(CKMessageEditingViewController *)self interactionDelegate];
  id v3 = [(CKMessageEditingView *)self->_messageEditingView balloonViewForAlignment];
  [v4 messageEditingViewController:self didUpdateFrameForBalloonView:v3];
}

- (UIView)balloonViewForAlignment
{
  double v2 = [(CKMessageEditingViewController *)self messageEditingView];
  id v3 = [v2 balloonViewForAlignment];

  return (UIView *)v3;
}

- (void)transcriptContentInsetsDidChange
{
  id v3 = [(CKMessageEditingViewController *)self view];
  [v3 setNeedsLayout];

  id v4 = [(CKMessageEditingViewController *)self view];
  [v4 layoutIfNeeded];
}

- (void)_applyProofreadingIfNecessary
{
  id v3 = [(CKMessageEditingViewController *)self messageEditingView];
  [v3 applyGrammarCheckingIndication];

  id v4 = [(CKMessageEditingViewController *)self interactionDelegate];
  id v10 = [v4 proofReadingInfoForMessageEditingViewController:self];

  if ([v10 count])
  {
    double v5 = [(CKMessageEditingViewController *)self transitionContext];
    int v6 = [v5 anchorChatItemGUID];

    int v7 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F6B9E8]];
    if ([v6 isEqualToString:v7])
    {
      double v8 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F6B9E0]];
      if ([v8 count])
      {
        double v9 = [(CKMessageEditingViewController *)self messageEditingView];
        [v9 underlineWithProofreadingInfo:v8];
      }
    }
  }
}

- (BOOL)wantsBackingTranscriptToIgnoreContentOffsetChanges
{
  return 1;
}

- (id)visibleTextViewIdentifiersFor:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"textView";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4
{
  return [a4 isEqualToString:@"textView"];
}

- (id)textEffectCoordinator:(id)a3 textViewForTextViewIdentifier:(id)a4
{
  if ([a4 isEqualToString:@"textView"])
  {
    double v5 = [(CKMessageEditingViewController *)self messageEditingView];
    int v6 = [v5 messageEditingBalloonView];
    int v7 = [v6 messageEditingBalloonTextView];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3
{
  return 1;
}

- (CKTranscriptOverlayTransitionDelegate)transcriptOverlayTransitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transcriptOverlayTransitionDelegate);

  return (CKTranscriptOverlayTransitionDelegate *)WeakRetained;
}

- (void)setTranscriptOverlayTransitionDelegate:(id)a3
{
}

- (CKMessageEditingViewControllerInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CKMessageEditingViewControllerInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (double)entryViewOffset
{
  return self->_entryViewOffset;
}

- (void)setEntryViewOffset:(double)a3
{
  self->_entryViewOffset = a3;
}

- (CKTranscriptOverlayTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (BOOL)animatingIn
{
  return self->_animatingIn;
}

- (void)setAnimatingIn:(BOOL)a3
{
  self->_animatingIn = a3;
}

- (BOOL)animatingOut
{
  return self->_animatingOut;
}

- (void)setAnimatingOut:(BOOL)a3
{
  self->_animatingOut = a3;
}

- (UIVisualEffectView)transcriptOverlayView
{
  return self->_transcriptOverlayView;
}

- (void)setTranscriptOverlayView:(id)a3
{
}

- (CKMessageEditingView)messageEditingView
{
  return self->_messageEditingView;
}

- (void)setMessageEditingView:(id)a3
{
}

- (CGRect)editedMessageAchorPosition
{
  double x = self->_editedMessageAchorPosition.origin.x;
  double y = self->_editedMessageAchorPosition.origin.y;
  double width = self->_editedMessageAchorPosition.size.width;
  double height = self->_editedMessageAchorPosition.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEditedMessageAchorPosition:(CGRect)a3
{
  self->_editedMessageAchorPosition = a3;
}

- (double)viewHeightForEditedMessageAnchorPosition
{
  return self->_viewHeightForEditedMessageAnchorPosition;
}

- (void)setViewHeightForEditedMessageAnchorPosition:(double)a3
{
  self->_viewHeightForEditedMessageAnchorPosition = a3;
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
}

- (CKMentionsController)mentionsController
{
  return self->_mentionsController;
}

- (void)setMentionsController:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (_TtC7ChatKit23CKTextEffectCoordinator)textEffectsCoordinator
{
  return self->_textEffectsCoordinator;
}

- (void)setTextEffectsCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEffectsCoordinator, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_storeStrong((id *)&self->_messageEditingView, 0);
  objc_storeStrong((id *)&self->_transcriptOverlayView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);

  objc_destroyWeak((id *)&self->_transcriptOverlayTransitionDelegate);
}

- (void)_animateOutWithState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Anchor chat item not on transition context for animate out animation. Context: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_animateOutWithState:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Anchor chat item %@ has no frame in the visible chat item map for animating out. Map: %@", (uint8_t *)&v3, 0x16u);
}

- (void)messageEditingViewConfirmButtonSelected:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Ignoring attempt to edit message to an empty string.", v1, 2u);
}

@end