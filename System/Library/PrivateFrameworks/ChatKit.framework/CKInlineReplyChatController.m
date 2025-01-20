@interface CKInlineReplyChatController
+ (Class)_gradientReferenceViewClass;
+ (Class)transcriptControllerClass;
- (BOOL)allowsLoadingIndicatorPresentation;
- (BOOL)animatingIn;
- (BOOL)animatingOut;
- (BOOL)becomeFirstResponder;
- (BOOL)hasCompletedAnimationIn;
- (BOOL)isInitialLoad;
- (BOOL)isInitialSizing;
- (BOOL)isInline;
- (BOOL)isModal;
- (BOOL)isUnanimated;
- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4;
- (BOOL)shouldListParticipantsInTitle;
- (BOOL)shouldReloadInsetsForFloatingKeyboard;
- (BOOL)showNavbarKeyline;
- (BOOL)throwAnimationUsesAnimatedReloadForMessages:(id)a3;
- (BOOL)wantsBackingTranscriptToIgnoreContentOffsetChanges;
- (CGRect)_initialFrameForCollectionView;
- (CGRect)_initialFrameForGradientReferenceView;
- (CGRect)gradientFrameWithInsets:(UIEdgeInsets)a3;
- (CGSize)contentSizeForPinning;
- (CKChatController)parentChatController;
- (CKInlineReplyChatController)initWithConversation:(id)a3 threadIdentifier:(id)a4 threadOriginator:(id)a5 transitionContext:(id)a6 originatorMessageSummaryInfo:(id)a7 parentChatController:(id)a8;
- (CKInlineReplyInteractionDelegate)interactionDelegate;
- (CKInlineReplyTransparentBlurBackgroundView)blurParentView;
- (CKTranscriptOverlayTransitionContext)transitionContext;
- (CKTranscriptOverlayTransitionDelegate)transcriptOverlayTransitionDelegate;
- (IMMessageItem)threadOriginator;
- (NSDictionary)originatorMessageSummaryInfo;
- (NSString)threadIdentifier;
- (UIEdgeInsets)_contentInsetForSendAnimation;
- (UIEdgeInsets)calculateTranscriptMarginInsets;
- (UIEdgeInsets)calculateTranscriptSafeAreaInsets;
- (UIEdgeInsets)navigationBarInsetsWithoutPalette;
- (UIEdgeInsets)transcriptContentInsetsForMessageEditingViewController:(id)a3;
- (UINavigationBarAppearance)navBarAppearance;
- (UIVisualEffectView)blurView;
- (double)accessoryViewHeight;
- (double)throwAnimationFinalFrameOffset:(id)a3;
- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4;
- (double)visibleInputViewHeight;
- (id)_defaultTranscriptNavBarAppearance;
- (id)_imMessageForIMMessageItem:(id)a3;
- (id)_navigationBarAppearanceWithKeyline:(BOOL)a3;
- (id)_visibleGUIDs;
- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3;
- (id)contextualChatItemsForTapbackPicker;
- (id)inputAccessoryView;
- (id)inputController;
- (id)inputViewController;
- (id)parentViewControllerForPluginViewControllerInMessageEntryView:(id)a3;
- (int64_t)targetFirstResponder;
- (void)_animateIn:(BOOL)a3;
- (void)_animateOut;
- (void)_animateOutWithCompletion:(id)a3;
- (void)_didSendCompositionInConversation:(id)a3;
- (void)_doneButtonPressed;
- (void)_requestDismissal;
- (void)_setInitialScrollPositionIfNecessary;
- (void)addOrRemoveEntryViewIfNeeded;
- (void)appCardDidChangeEntryViewAlignmentHeight:(double)a3 animated:(BOOL)a4;
- (void)applyInitialContextToCollectionViewIfNeeded;
- (void)collectMetricsForSending:(id)a3;
- (void)dismissController;
- (void)dismissControllerWithCompletion:(id)a3;
- (void)messageEntryView:(id)a3 didMoveToWindow:(id)a4;
- (void)messageEntryViewDidBeginEditingNotAlreadyActive:(id)a3;
- (void)messageEntryViewSendLaterPluginInfoUpdated:(id)a3;
- (void)reloadEntryViewIfNeeded;
- (void)reloadInputViews;
- (void)sendMessage:(id)a3 forConversation:(id)a4 newComposition:(BOOL)a5;
- (void)sendMessage:(id)a3 forConversation:(id)a4 onService:(id)a5 newComposition:(BOOL)a6;
- (void)setAnimatingIn:(BOOL)a3;
- (void)setAnimatingOut:(BOOL)a3;
- (void)setBlurParentView:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setHasCompletedAnimationIn:(BOOL)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setIsInitialSizing:(BOOL)a3;
- (void)setIsShowingPreview:(BOOL)a3;
- (void)setNavBarAppearance:(id)a3;
- (void)setParentChatController:(id)a3;
- (void)setShouldReloadInsetsForFloatingKeyboard:(BOOL)a3;
- (void)setShowNavbarKeyline:(BOOL)a3;
- (void)setTargetFirstResponder:(int64_t)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setThreadOriginator:(id)a3;
- (void)setTranscriptOverlayTransitionDelegate:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setUpEntryViewLayoutConstraintsIfNecessary;
- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)tapGestureRecognized:(id)a3;
- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4;
- (void)transcriptCollectionViewController:(id)a3 didScroll:(CGPoint)a4;
- (void)transcriptCollectionViewControllerDidSetChatItems:(id)a3;
- (void)transcriptCollectionViewControllerRestingStateDidChange:(id)a3;
- (void)updateActiveEntryViewPositioningGuide;
- (void)updateScrollGeometryForReason:(id)a3 withDuration:(double)a4 animationCurve:(int64_t)a5;
- (void)updateScrollGeometryWithoutAnimationForReason:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation CKInlineReplyChatController

+ (Class)transcriptControllerClass
{
  return (Class)objc_opt_class();
}

- (CKInlineReplyChatController)initWithConversation:(id)a3 threadIdentifier:(id)a4 threadOriginator:(id)a5 transitionContext:(id)a6 originatorMessageSummaryInfo:(id)a7 parentChatController:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CKInlineReplyChatController;
  v19 = [(CKChatController *)&v22 initWithConversation:a3];
  v20 = v19;
  if (v19)
  {
    [(CKInlineReplyChatController *)v19 setParentChatController:v18];
    [(CKInlineReplyChatController *)v20 setIsInitialLoad:1];
    [(CKInlineReplyChatController *)v20 setIsInitialSizing:1];
    [(CKInlineReplyChatController *)v20 setThreadOriginator:v15];
    [(CKInlineReplyChatController *)v20 setThreadIdentifier:v14];
    [(CKInlineReplyChatController *)v20 setTransitionContext:v16];
    [(CKScrollViewController *)v20 setEnableContentPinning:1];
    v20->_showNavbarKeyline = 1;
    objc_storeStrong((id *)&v20->_originatorMessageSummaryInfo, a7);
  }

  return v20;
}

+ (Class)_gradientReferenceViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isModal
{
  v2 = [(CKInlineReplyChatController *)self transitionContext];
  char v3 = [v2 wantsModalPresentation];

  return v3;
}

- (BOOL)isUnanimated
{
  v2 = [(CKInlineReplyChatController *)self transitionContext];
  char v3 = [v2 wantsUnanimatedPresentation];

  return v3;
}

- (BOOL)isInline
{
  return 1;
}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (void)_doneButtonPressed
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    [(CKChatController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)dismissController
{
}

- (void)dismissControllerWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke;
    v8[3] = &unk_1E5620F48;
    v5 = &v9;
    id v9 = v4;
    [(CKChatController *)self dismissViewControllerAnimated:1 completion:v8];
LABEL_5:

    goto LABEL_6;
  }
  if (![(CKInlineReplyChatController *)self animatingOut])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke_2;
    v6[3] = &unk_1E5622358;
    v5 = &v7;
    id v7 = v4;
    [(CKInlineReplyChatController *)self _animateOutWithCompletion:v6];
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (double)accessoryViewHeight
{
  v2 = [(CKChatController *)self entryView];
  char v3 = v2;
  if (v2)
  {
    [v2 frame];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)updateScrollGeometryWithoutAnimationForReason:(id)a3
{
  id v4 = a3;
  double v5 = [(CKChatController *)self entryView];
  [v5 frame];
  [(CKScrollViewController *)self setContentPinningThreshold:CGRectGetHeight(v7)];

  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  [(CKScrollViewController *)&v6 updateScrollGeometryWithoutAnimationForReason:v4];
}

- (void)updateScrollGeometryForReason:(id)a3 withDuration:(double)a4 animationCurve:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(CKChatController *)self entryView];
  [v9 frame];
  [(CKScrollViewController *)self setContentPinningThreshold:CGRectGetHeight(v11)];

  v10.receiver = self;
  v10.super_class = (Class)CKInlineReplyChatController;
  [(CKScrollViewController *)&v10 updateScrollGeometryForReason:v8 withDuration:a5 animationCurve:a4];
}

- (CGSize)contentSizeForPinning
{
  v2 = [(CKChatController *)self collectionView];
  char v3 = [v2 collectionViewLayout];
  [v3 collectionViewContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIEdgeInsets)navigationBarInsetsWithoutPalette
{
  v2 = [(CKInlineReplyChatController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;

  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v8;
  return result;
}

- (CGRect)gradientFrameWithInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v25.receiver = self;
    v25.super_class = (Class)CKInlineReplyChatController;
    -[CKCoreChatController gradientFrameWithInsets:](&v25, sel_gradientFrameWithInsets_, top, left, bottom, right);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    id v16 = [(CKInlineReplyChatController *)self interactionDelegate];
    objc_msgSend(v16, "inlineReplyController:gradientFrameWithInsets:", self, top, left, bottom, right);
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
  }
  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)inputAccessoryView
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKInlineReplyChatController;
    double v3 = [(CKChatController *)&v5 inputAccessoryView];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)inputViewController
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKInlineReplyChatController;
    double v3 = [(CKChatController *)&v5 inputViewController];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (void)reloadInputViews
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v4.receiver = self;
    v4.super_class = (Class)CKInlineReplyChatController;
    [(CKInlineReplyChatController *)&v4 reloadInputViews];
  }
  else
  {
    id v3 = [(CKInlineReplyChatController *)self interactionDelegate];
    [v3 inlineReplyControllerRequestsReloadInputViews:self];
  }
}

- (id)inputController
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v6.receiver = self;
    v6.super_class = (Class)CKInlineReplyChatController;
    id v3 = [(CKCoreChatController *)&v6 inputController];
  }
  else
  {
    objc_super v4 = [(CKInlineReplyChatController *)self interactionDelegate];
    id v3 = [v4 inlineReplyControllerChatInputController:self];
  }

  return v3;
}

- (void)reloadEntryViewIfNeeded
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v3.receiver = self;
    v3.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v3 reloadEntryViewIfNeeded];
  }
}

- (void)addOrRemoveEntryViewIfNeeded
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v3.receiver = self;
    v3.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v3 addOrRemoveEntryViewIfNeeded];
  }
}

- (void)setUpEntryViewLayoutConstraintsIfNecessary
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v3.receiver = self;
    v3.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v3 setUpEntryViewLayoutConstraintsIfNecessary];
  }
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3 = [(CKInlineReplyChatController *)self interactionDelegate];
  if (v3 && (objc_super v4 = (void *)v3, v5 = [(CKInlineReplyChatController *)self isModal], v4, !v5))
  {
    double v7 = [(CKInlineReplyChatController *)self interactionDelegate];
    char v8 = [v7 inlineReplyControllerBecomeFirstResponder:self];

    return v8;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKInlineReplyChatController;
    return [(CKChatController *)&v9 becomeFirstResponder];
  }
}

- (void)setTargetFirstResponder:(int64_t)a3
{
  uint64_t v5 = [(CKInlineReplyChatController *)self interactionDelegate];
  if (v5 && (v6 = (void *)v5, BOOL v7 = [(CKInlineReplyChatController *)self isModal], v6, !v7))
  {
    id v8 = [(CKInlineReplyChatController *)self interactionDelegate];
    [v8 inlineReplyController:self setTargetFirstResponder:a3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v9 setTargetFirstResponder:a3];
  }
}

- (int64_t)targetFirstResponder
{
  uint64_t v3 = [(CKInlineReplyChatController *)self interactionDelegate];
  if (v3 && (objc_super v4 = (void *)v3, v5 = [(CKInlineReplyChatController *)self isModal], v4, !v5))
  {
    BOOL v7 = [(CKInlineReplyChatController *)self interactionDelegate];
    int64_t v8 = [v7 inlineReplyControllerTargetFirstResponder:self];

    return v8;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKInlineReplyChatController;
    return [(CKChatController *)&v9 targetFirstResponder];
  }
}

- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4
{
  uint64_t v7 = [(CKInlineReplyChatController *)self interactionDelegate];
  if (v7 && (v8 = (void *)v7, BOOL v9 = [(CKInlineReplyChatController *)self isModal], v8, !v9))
  {
    double v11 = [(CKInlineReplyChatController *)self interactionDelegate];
    char v12 = [v11 inlineReplyController:self containerWidth:a3 offset:a4];

    return v12;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKInlineReplyChatController;
    return [(CKChatController *)&v13 messageEntryViewWidth:a3 andOffset:a4];
  }
}

- (void)setIsShowingPreview:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController setIsShowingPreview:](&v6, sel_setIsShowingPreview_);
  BOOL v5 = [(CKInlineReplyChatController *)self interactionDelegate];
  [v5 inlineReplyController:self setIsShowingPreview:v3];
}

- (void)messageEntryViewSendLaterPluginInfoUpdated:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKInlineReplyChatController *)self threadOriginator];
  uint64_t v6 = [v5 scheduleType];

  if (v6 == 2) {
    [(CKInlineReplyChatController *)self dismissController];
  }
  v7.receiver = self;
  v7.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v7 messageEntryViewSendLaterPluginInfoUpdated:v4];
}

- (void)messageEntryViewDidBeginEditingNotAlreadyActive:(id)a3
{
  id v4 = a3;
  if ([(CKInlineReplyChatController *)self isModal])
  {
    uint64_t v6 = self;
    BOOL v5 = (objc_super *)&v6;
LABEL_7:
    v5->super_class = (Class)CKInlineReplyChatController;
    -[objc_super messageEntryViewDidBeginEditingNotAlreadyActive:](v5, sel_messageEntryViewDidBeginEditingNotAlreadyActive_, v4, v6);
    goto LABEL_8;
  }
  if ([(CKInlineReplyChatController *)self targetFirstResponder] == 1) {
    [(CKInlineReplyChatController *)self setTargetFirstResponder:0];
  }
  if (![(CKInlineReplyChatController *)self animatingIn])
  {
    v7.receiver = self;
    BOOL v5 = &v7;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateActiveEntryViewPositioningGuide
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v4.receiver = self;
    v4.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v4 updateActiveEntryViewPositioningGuide];
  }
  BOOL v3 = [(CKInlineReplyChatController *)self interactionDelegate];
  [v3 updateActiveEntryViewPositioningGuideForInlineReplyController:self];
}

- (void)messageEntryView:(id)a3 didMoveToWindow:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CKInlineReplyChatController;
  id v6 = a4;
  id v7 = a3;
  [(CKChatController *)&v9 messageEntryView:v7 didMoveToWindow:v6];
  int64_t v8 = [(CKInlineReplyChatController *)self interactionDelegate];
  [v8 inlineReplyController:self messageEntryView:v7 didMoveToWindow:v6];
}

- (UIEdgeInsets)transcriptContentInsetsForMessageEditingViewController:(id)a3
{
  id v4 = a3;
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v23.receiver = self;
    v23.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v23 transcriptContentInsetsForMessageEditingViewController:v4];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    objc_super v13 = [(CKInlineReplyChatController *)self interactionDelegate];
    [v13 parentTranscriptContentInsetsForInlineReplyController:self];
    double v6 = v14;
    double v8 = v15;
    double v12 = v16;
    v22.receiver = self;
    v22.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v22 transcriptContentInsetsForMessageEditingViewController:v4];
    double v10 = v17;
  }
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  result.double right = v21;
  result.double bottom = v20;
  result.double left = v19;
  result.double top = v18;
  return result;
}

- (void)appCardDidChangeEntryViewAlignmentHeight:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController appCardDidChangeEntryViewAlignmentHeight:animated:](&v8, sel_appCardDidChangeEntryViewAlignmentHeight_animated_);
  double v7 = [(CKInlineReplyChatController *)self interactionDelegate];
  [v7 inlineReplyController:self appCardDidChangeEntryViewAlignmentHeight:v4 animated:a3];
}

- (double)visibleInputViewHeight
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    v7.receiver = self;
    v7.super_class = (Class)CKInlineReplyChatController;
    [(CKChatController *)&v7 visibleInputViewHeight];
  }
  else
  {
    BOOL v4 = [(CKInlineReplyChatController *)self interactionDelegate];
    [v4 visibleInputViewHeightForInlineReplyController:self];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (UIEdgeInsets)_contentInsetForSendAnimation
{
  v18.receiver = self;
  v18.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v18 _contentInsetForSendAnimation];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CKChatController *)self collectionView];
  [v11 contentInset];
  double v13 = v4 + v12 - v4;

  double v14 = v13;
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.double top = v14;
  return result;
}

- (double)throwAnimationFinalFrameOffset:(id)a3
{
  double v3 = [(CKInlineReplyChatController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  return v5;
}

- (id)contextualChatItemsForTapbackPicker
{
  v2 = [(CKInlineReplyChatController *)self parentChatController];
  double v3 = [v2 collectionViewController];
  double v4 = [v3 chatItems];

  return v4;
}

- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3
{
  double v3 = [(CKInlineReplyChatController *)self parentChatController];
  double v4 = [v3 collectionViewController];
  double v5 = [v4 chatItems];

  return v5;
}

- (void)sendMessage:(id)a3 forConversation:(id)a4 onService:(id)a5 newComposition:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (IMOSLoggingEnabled())
  {
    double v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = [(CKInlineReplyChatController *)self threadIdentifier];
      int v18 = 136315394;
      double v19 = "-[CKInlineReplyChatController sendMessage:forConversation:onService:newComposition:]";
      __int16 v20 = 2112;
      double v21 = v14;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%s Sending reply with thread identifier %@", (uint8_t *)&v18, 0x16u);
    }
  }
  double v15 = [(CKInlineReplyChatController *)self threadIdentifier];
  [v10 setThreadIdentifier:v15];

  double v16 = [(CKInlineReplyChatController *)self threadOriginator];
  double v17 = [(CKInlineReplyChatController *)self _imMessageForIMMessageItem:v16];

  [v10 setThreadOriginator:v17];
  [v11 sendMessage:v10 onService:v12 newComposition:v6];
  [(CKInlineReplyChatController *)self collectMetricsForSending:v10];
}

- (void)sendMessage:(id)a3 forConversation:(id)a4 newComposition:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(CKInlineReplyChatController *)self threadIdentifier];
      int v15 = 136315394;
      double v16 = "-[CKInlineReplyChatController sendMessage:forConversation:newComposition:]";
      __int16 v17 = 2112;
      int v18 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%s Sending reply with thread identifier %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v12 = [(CKInlineReplyChatController *)self threadIdentifier];
  [v8 setThreadIdentifier:v12];

  double v13 = [(CKInlineReplyChatController *)self threadOriginator];
  double v14 = [(CKInlineReplyChatController *)self _imMessageForIMMessageItem:v13];

  [v8 setThreadOriginator:v14];
  [v9 sendMessage:v8 newComposition:v5];
  [(CKInlineReplyChatController *)self collectMetricsForSending:v8];
}

- (void)_didSendCompositionInConversation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v5 _didSendCompositionInConversation:a3];
  double v4 = [(CKInlineReplyChatController *)self interactionDelegate];
  [v4 inlineReplyControllerDidSendComposition:self];
}

- (void)collectMetricsForSending:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(CKInlineReplyChatController *)self originatorMessageSummaryInfo];
  double v4 = objc_msgSend(v3, "__im_associatedMessageContentType");
  [v4 integerValue];

  objc_super v5 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v6 = *MEMORY[0x1E4F6D8B8];
  id v9 = @"originatorType";
  double v7 = IMMetricsValueForAssociatedMessageContentType();
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 trackEvent:v6 withDictionary:v8];
}

- (BOOL)throwAnimationUsesAnimatedReloadForMessages:(id)a3
{
  return 0;
}

- (void)tapGestureRecognized:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v4 tapGestureRecognized:a3];
  [(CKInlineReplyChatController *)self dismissController];
}

- (id)_defaultTranscriptNavBarAppearance
{
  v2 = [(CKInlineReplyChatController *)self navigationController];
  double v3 = [v2 navigationBar];
  objc_super v4 = [v3 standardAppearance];
  objc_super v5 = (void *)[v4 copy];

  [v5 configureWithTransparentBackground];

  return v5;
}

- (id)_navigationBarAppearanceWithKeyline:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(CKInlineReplyChatController *)self _defaultTranscriptNavBarAppearance];
  objc_super v5 = v4;
  if (v3) {
    [v4 configureWithDefaultShadow];
  }
  else {
    [v4 configureWithoutShadow];
  }

  return v5;
}

- (void)setShowNavbarKeyline:(BOOL)a3
{
  if (self->_showNavbarKeyline != a3)
  {
    BOOL v3 = a3;
    self->_showNavbarKeyline = a3;
    if (![(CKInlineReplyChatController *)self animatingIn])
    {
      id v7 = [(CKInlineReplyChatController *)self _navigationBarAppearanceWithKeyline:v3];
      if ([(CKInlineReplyChatController *)self isModal])
      {
        objc_super v5 = [(CKInlineReplyChatController *)self navigationItem];
      }
      else
      {
        uint64_t v6 = [(CKInlineReplyChatController *)self parentViewController];
        objc_super v5 = [v6 navigationItem];
      }
      [v5 setStandardAppearance:v7];
      [v5 setScrollEdgeAppearance:v7];
    }
  }
}

- (void)viewDidLoad
{
  BOOL v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "viewDidLoad", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v17 viewDidLoad];
  objc_super v4 = [(CKInlineReplyChatController *)self view];
  [v4 setBackgroundColor:0];

  objc_super v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 replyTranscriptBackgroundDoesSupportTransparentBlurVisualEffect];

  id v7 = IMLogHandleForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Using UIVisualEffectView for backgroudn blur", buf, 2u);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F43028]);
    id v10 = [(CKInlineReplyChatController *)self view];
    [v10 bounds];
    id v11 = (CKInlineReplyTransparentBlurBackgroundView *)objc_msgSend(v9, "initWithFrame:");

    id v12 = [(CKInlineReplyChatController *)self view];
    [v12 insertSubview:v11 atIndex:0];

    [(CKInlineReplyChatController *)self setBlurView:v11];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Using CKInlineReplyTransparentBlurBackgroundView for background blur", buf, 2u);
    }

    double v13 = [CKInlineReplyTransparentBlurBackgroundView alloc];
    double v14 = [(CKInlineReplyChatController *)self view];
    [v14 bounds];
    id v11 = -[CKInlineReplyTransparentBlurBackgroundView initWithFrame:](v13, "initWithFrame:");

    [(CKInlineReplyTransparentBlurBackgroundView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    int v15 = [(CKInlineReplyChatController *)self view];
    [v15 insertSubview:v11 atIndex:0];

    double v16 = [(CKInlineReplyChatController *)self view];
    [(UIView *)v11 __ck_makeEdgesEqualTo:v16];

    [(CKInlineReplyChatController *)self setBlurParentView:v11];
  }
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v14 viewDidLayoutSubviews];
  BOOL v3 = [(CKInlineReplyChatController *)self blurView];

  if (v3)
  {
    objc_super v4 = [(CKInlineReplyChatController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    double v13 = [(CKInlineReplyChatController *)self blurView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "viewIsAppearing", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)CKInlineReplyChatController;
  [(CKInlineReplyChatController *)&v24 viewIsAppearing:v3];
  BOOL v6 = [(CKInlineReplyChatController *)self isInitialLoad];
  double v7 = IMLogHandleForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Performing initialLoad", buf, 2u);
    }

    double v9 = [(CKInlineReplyChatController *)self interactionDelegate];
    [v9 inlineReplyControllerIsAppearing:self];

    BOOL v10 = [(CKInlineReplyChatController *)self isModal];
    BOOL v11 = [(CKInlineReplyChatController *)self isUnanimated];
    BOOL v12 = v11;
    if (v10 || v11)
    {
      double v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        BOOL v26 = v10;
        __int16 v27 = 2048;
        BOOL v28 = v12;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Calling _animateIn during initialLoad due to isModal: %ld isUnanimated:%ld", buf, 0x16u);
      }

      [(CKInlineReplyChatController *)self _animateIn:1];
      objc_super v17 = [(CKInlineReplyChatController *)self traitCollection];
      uint64_t v18 = [v17 userInterfaceStyle];

      uint64_t v19 = [(CKChatController *)self entryView];
      __int16 v20 = v19;
      if (v18 == 2) {
        uint64_t v21 = 7;
      }
      else {
        uint64_t v21 = 8;
      }
      [v19 setStyle:v21];

      uint64_t v22 = [(CKChatController *)self navbarCanvasViewController];
      [v22 setNavBarContext:2];

      [(CKInlineReplyChatController *)self setTargetFirstResponder:1];
      [(CKInlineReplyChatController *)self becomeFirstResponder];
    }
    else
    {
      double v13 = [(CKInlineReplyChatController *)self inlineCollectionViewController];
      [v13 setAnimatingIn:1];

      objc_super v14 = [(CKChatController *)self navbarCanvasViewController];
      [v14 setNavBarContext:1];

      if (UIAccessibilityIsReduceMotionEnabled())
      {
        int v15 = [(CKChatController *)self collectionView];
        [v15 setAlpha:0.0];
      }
      else
      {
        int v15 = [(CKInlineReplyChatController *)self transcriptOverlayTransitionDelegate];
        objc_super v23 = [(CKInlineReplyChatController *)self _visibleGUIDs];
        [v15 transcriptOverlayViewController:self visibleGUIDsDidChange:v23];
      }
      if ([(CKInlineReplyChatController *)self shouldReloadInsetsForFloatingKeyboard])
      {
        [(CKScrollViewController *)self inputAccessoryViewFrameUpdatedForFloatingKeyboard];
      }
    }
    [(CKInlineReplyChatController *)self setIsInitialLoad:0];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "viewIsAppearing, but initialLoad has already been completed", buf, 2u);
    }
  }
}

- (void)applyInitialContextToCollectionViewIfNeeded
{
  if (!UIAccessibilityIsReduceMotionEnabled() && ![(CKInlineReplyChatController *)self isUnanimated])
  {
    id v7 = [(CKInlineReplyChatController *)self transitionContext];
    BOOL v3 = [(CKInlineReplyChatController *)self inlineCollectionViewController];
    objc_super v4 = [v7 visibleChatItemToFrameMap];
    [v3 setCollectionViewCurrentFramesForNextLayout:v4];
    double v5 = [(CKInlineReplyChatController *)self transitionContext];
    BOOL v6 = [v5 replyTransitionProperties];
    [v3 setTransitionProperties:v6];
  }
}

- (UIEdgeInsets)calculateTranscriptMarginInsets
{
  v24.receiver = self;
  v24.super_class = (Class)CKInlineReplyChatController;
  [(CKCoreChatController *)&v24 calculateTranscriptMarginInsets];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  double v11 = *MEMORY[0x1E4F437F8];
  if (*(double *)(MEMORY[0x1E4F437F8] + 8) == v7
    && v11 == v6
    && *(double *)(MEMORY[0x1E4F437F8] + 24) == v4
    && *(double *)(MEMORY[0x1E4F437F8] + 16) == v3)
  {
    int v15 = [(CKInlineReplyChatController *)self transitionContext];
    [v15 transcriptMarginInsets];
    double v6 = v16;
    double v8 = v17;
    double v9 = v18;
    double v10 = v19;
  }
  double v20 = v6;
  double v21 = v8;
  double v22 = v9;
  double v23 = v10;
  result.double right = v23;
  result.double bottom = v22;
  result.double left = v21;
  result.double top = v20;
  return result;
}

- (UIEdgeInsets)calculateTranscriptSafeAreaInsets
{
  v24.receiver = self;
  v24.super_class = (Class)CKInlineReplyChatController;
  [(CKCoreChatController *)&v24 calculateTranscriptSafeAreaInsets];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  double v11 = *MEMORY[0x1E4F437F8];
  if (*(double *)(MEMORY[0x1E4F437F8] + 8) == v7
    && v11 == v6
    && *(double *)(MEMORY[0x1E4F437F8] + 24) == v4
    && *(double *)(MEMORY[0x1E4F437F8] + 16) == v3)
  {
    int v15 = [(CKInlineReplyChatController *)self transitionContext];
    [v15 transcriptSafeAreaInsets];
    double v6 = v16;
    double v8 = v17;
    double v9 = v18;
    double v10 = v19;
  }
  double v20 = v6;
  double v21 = v8;
  double v22 = v9;
  double v23 = v10;
  result.double right = v23;
  result.double bottom = v22;
  result.double left = v21;
  result.double top = v20;
  return result;
}

- (CGRect)_initialFrameForCollectionView
{
  double v3 = [(CKInlineReplyChatController *)self transitionContext];
  [v3 parentCollectionViewFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(CKInlineReplyChatController *)self calculateTranscriptSafeAreaInsets];
  double v11 = v10;
  double v12 = v9 - v10;

  double v13 = v5;
  double v14 = v11;
  double v15 = v7;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_initialFrameForGradientReferenceView
{
  v2 = [(CKInlineReplyChatController *)self transitionContext];
  [v2 parentCollectionViewFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "viewDidAppear", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v6 viewDidAppear:v3];
  if (![(CKInlineReplyChatController *)self isModal]) {
    [(CKInlineReplyChatController *)self _animateIn:0];
  }
}

- (void)transcriptCollectionViewControllerDidSetChatItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v6 transcriptCollectionViewControllerDidSetChatItems:a3];
  double v4 = [(CKInlineReplyChatController *)self transcriptOverlayTransitionDelegate];
  double v5 = [(CKInlineReplyChatController *)self _visibleGUIDs];
  [v4 transcriptOverlayViewController:self visibleGUIDsDidChange:v5];
}

- (void)transcriptCollectionViewControllerRestingStateDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKInlineReplyChatController;
  [(CKCoreChatController *)&v8 transcriptCollectionViewControllerRestingStateDidChange:v4];
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    if ([(CKInlineReplyChatController *)self animatingOut])
    {
      double v5 = [v4 collectionView];
      objc_super v6 = [v5 collectionViewLayout];
      int v7 = [v6 isResting];

      if (v7)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
        [(CKInlineReplyChatController *)self _requestDismissal];
      }
    }
  }
}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v21.receiver = self;
  v21.super_class = (Class)CKInlineReplyChatController;
  -[CKCoreChatController transcriptCollectionViewController:collectionViewContentSizeDidChange:](&v21, sel_transcriptCollectionViewController_collectionViewContentSizeDidChange_, a3);
  int v7 = [(CKInlineReplyChatController *)self view];
  objc_super v8 = [(CKChatController *)self collectionView];
  [v7 setCollectionView:v8];

  double v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isOOPKeyboardEnabled];

  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 transcriptScrollToBottomDuration];
  double v13 = v12;

  [(CKInlineReplyChatController *)self updateScrollGeometryForReason:@"InlineReplyContentCentering" withDuration:0 animationCurve:v13];
  BOOL v14 = width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (!v14 && [(CKInlineReplyChatController *)self isInitialSizing])
  {
    if (v10)
    {
      double v15 = [(CKChatController *)self collectionView];
      [v15 endHoldingContentOffsetUpdatesForReason:@"InlineReplyChatController"];
    }
    double v16 = [(CKInlineReplyChatController *)self transitionContext];
    int v17 = [v16 presentWithKeyboard];

    if (v17)
    {
      double v18 = [(CKInlineReplyChatController *)self transitionContext];
      int v19 = [v18 wantsModalPresentation];

      if (!v19)
      {
        [(CKChatController *)self showKeyboardForReply];
        if (v10) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      [(CKInlineReplyChatController *)self setTargetFirstResponder:1];
    }
    if (v10)
    {
LABEL_13:
      [(CKInlineReplyChatController *)self _setInitialScrollPositionIfNecessary];
      [(CKInlineReplyChatController *)self setIsInitialSizing:0];
      goto LABEL_14;
    }
LABEL_12:
    double v20 = [(CKChatController *)self collectionView];
    [v20 endHoldingContentOffsetUpdatesForReason:@"InlineReplyChatController"];

    goto LABEL_13;
  }
LABEL_14:
}

- (void)transcriptCollectionViewController:(id)a3 didScroll:(CGPoint)a4
{
  double y = a4.y;
  objc_super v6 = +[CKUIBehavior sharedBehaviors];
  [v6 topTranscriptSpace];
  BOOL v8 = y > v7;

  [(CKInlineReplyChatController *)self setShowNavbarKeyline:v8];
}

- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double result = 1.0;
  if (isKindOfClass) {
    return 0.5;
  }
  return result;
}

- (void)_animateIn:(BOOL)a3
{
  double v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Performing _animateIn", buf, 2u);
  }

  if ([(CKInlineReplyChatController *)self hasCompletedAnimationIn]
    || [(CKInlineReplyChatController *)self animatingOut])
  {
    objc_super v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "> Call made to perform _animateIn:, but we've already done this. Will not re-perform _animateIn:", buf, 2u);
    }
    goto LABEL_22;
  }
  [(CKInlineReplyChatController *)self setAnimatingIn:1];
  double v7 = [(CKInlineReplyChatController *)self blurView];
  if (v7)
  {

LABEL_10:
    double v9 = +[CKUIBehavior sharedBehaviors];
    [v9 replyTranscriptBackgroundBlurAnimationTime];
    double v11 = v10;

    double v12 = [(CKInlineReplyChatController *)self transcriptOverlayTransitionDelegate];
    [v12 transcriptOverlayViewControllerWillAnimateIn:self];

    double v13 = [(CKChatController *)self navbarCanvasViewController];
    BOOL v14 = [v13 backButtonView];
    [v14 setAlpha:0.0];

    double v15 = [(CKChatController *)self navbarCanvasViewController];
    double v16 = [v15 unifiedCallButton];
    [v16 setAlpha:0.0];

    if (![(CKInlineReplyChatController *)self isModal])
    {
      v40.receiver = self;
      v40.super_class = (Class)CKInlineReplyChatController;
      int v17 = [(CKChatController *)&v40 _defaultTranscriptNavBarAppearance];
      double v18 = [(CKInlineReplyChatController *)self parentViewController];
      int v19 = [v18 navigationItem];
      [v19 setStandardAppearance:v17];

      double v20 = [(CKInlineReplyChatController *)self parentViewController];
      objc_super v21 = [v20 navigationItem];
      [v21 setScrollEdgeAppearance:v17];
    }
    if ([(CKInlineReplyChatController *)self isModal])
    {
      double v22 = [(CKInlineReplyChatController *)self navigationController];
    }
    else
    {
      double v23 = [(CKChatController *)self splitViewController];
      char v24 = [v23 isCollapsed];
      objc_super v25 = [(CKChatController *)self splitViewController];
      BOOL v26 = v25;
      if (v24) {
        [v25 masterViewController];
      }
      else {
      double v22 = [v25 detailViewController];
      }
    }
    __int16 v27 = [v22 navigationBar];
    [v27 setNeedsLayout];

    BOOL v28 = [v22 navigationBar];
    [v28 layoutIfNeeded];

    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__CKInlineReplyChatController__animateIn___block_invoke;
    aBlock[3] = &unk_1E5623DE8;
    BOOL v39 = IsReduceMotionEnabled;
    aBlock[4] = self;
    objc_super v6 = v22;
    v38 = v6;
    v30 = (void (**)(void))_Block_copy(aBlock);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __42__CKInlineReplyChatController__animateIn___block_invoke_2;
    v36[3] = &unk_1E5620C40;
    v36[4] = self;
    v31 = (void (**)(void))_Block_copy(v36);
    v32 = v31;
    if (a3)
    {
      v30[2](v30);
      v32[2](v32);
    }
    else
    {
      v33 = (void *)MEMORY[0x1E4F42FF0];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __42__CKInlineReplyChatController__animateIn___block_invoke_183;
      v34[3] = &unk_1E5622358;
      v35 = v31;
      [v33 animateWithDuration:v30 animations:v34 completion:v11];
    }
    goto LABEL_22;
  }
  BOOL v8 = [(CKInlineReplyChatController *)self blurParentView];

  if (v8) {
    goto LABEL_10;
  }
  objc_super v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CKInlineReplyChatController _animateIn:](v6);
  }
LABEL_22:
}

void __42__CKInlineReplyChatController__animateIn___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) collectionView];
    [v2 setAlpha:1.0];
  }
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 replyTranscriptBackgroundDoesSupportTransparentBlurVisualEffect];

  if (v4)
  {
    double v5 = +[CKUIBehavior sharedBehaviors];
    objc_super v6 = [v5 theme];
    double v7 = [v6 replyTranscriptBlurBackgroundEffects];
    BOOL v8 = [*(id *)(a1 + 32) blurView];
    [v8 setBackgroundEffects:v7];

    double v9 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v9 theme];
    double v11 = [v10 replyTranscriptBlurBackgroundColor];
    double v12 = [*(id *)(a1 + 32) blurView];
    [v12 setBackgroundColor:v11];

    double v13 = [*(id *)(a1 + 32) blurView];
    [v13 _setGroupName:@"inlineReplyVisualEffectViewGroup"];
  }
  else
  {
    double v13 = [*(id *)(a1 + 32) blurParentView];
    [v13 animateIn];
  }

  objc_msgSend(*(id *)(a1 + 32), "_navigationBarAppearanceWithKeyline:", objc_msgSend(*(id *)(a1 + 32), "showNavbarKeyline"));
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  char v14 = [*(id *)(a1 + 32) isModal];
  double v15 = *(void **)(a1 + 32);
  if (v14)
  {
    double v16 = [v15 navigationItem];
  }
  else
  {
    int v17 = [v15 parentViewController];
    double v16 = [v17 navigationItem];
  }
  [v16 setStandardAppearance:v21];
  [v16 setScrollEdgeAppearance:v21];
  double v18 = [*(id *)(a1 + 40) navigationBar];
  [v18 setNeedsLayout];

  int v19 = [*(id *)(a1 + 40) navigationBar];
  [v19 layoutIfNeeded];

  double v20 = [*(id *)(a1 + 32) transcriptOverlayTransitionDelegate];
  [v20 transcriptOverlayViewControllerIsAnimatingIn:*(void *)(a1 + 32)];
}

void __42__CKInlineReplyChatController__animateIn___block_invoke_2(uint64_t a1)
{
  v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Finished performing _animateIn", v5, 2u);
  }

  [*(id *)(a1 + 32) setAnimatingIn:0];
  [*(id *)(a1 + 32) setHasCompletedAnimationIn:1];
  BOOL v3 = [*(id *)(a1 + 32) inlineCollectionViewController];
  [v3 setAnimatingIn:0];

  int v4 = [*(id *)(a1 + 32) transcriptOverlayTransitionDelegate];
  [v4 transcriptOverlayViewControllerDidAnimateIn:*(void *)(a1 + 32)];
}

uint64_t __42__CKInlineReplyChatController__animateIn___block_invoke_183(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_animateOutWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Performing _animateOut", buf, 2u);
  }

  objc_super v6 = [(CKInlineReplyChatController *)self view];
  [v6 setUserInteractionEnabled:0];

  [(CKInlineReplyChatController *)self setAnimatingOut:1];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  BOOL v8 = [(CKInlineReplyChatController *)self inlineCollectionViewController];
  [v8 setAnimatingOut:1];
  double v9 = [(CKChatController *)self entryView];
  double v10 = [(CKInlineReplyChatController *)self traitCollection];
  [v9 setEntryViewTraitCollection:v10 resetStyle:1];

  double v11 = [(CKChatController *)self collectionView];
  [v11 beginHoldingContentOffsetUpdatesForReason:@"InlineReplyChatController"];

  [(CKScrollViewController *)self beginHoldingScrollGeometryUpdatesForReason:@"InlineReplyAnimateOut"];
  if (!IsReduceMotionEnabled)
  {
    double v12 = [(CKChatController *)self _visibleChatItemsToScreenFrameMap];
    double v13 = [(CKInlineReplyChatController *)self transcriptOverlayTransitionDelegate];
    char v14 = [v13 updatedFrameMapForTranscriptOverlayViewController:self];

    [v8 setCollectionViewTargetFrames:v14];
    [v8 setCollectionViewCurrentFramesForNextLayout:v12];
    [v8 performCollectionViewReloadForAnimateOut];
  }
  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 replyTranscriptBackgroundBlurAnimationTime];
  double v17 = v16;

  double v18 = [(CKInlineReplyChatController *)self transcriptOverlayTransitionDelegate];
  [v18 transcriptOverlayViewControllerWillAnimateOut:self];

  int v19 = [(CKChatController *)self collectionView];
  [v19 setIgnoresReloadDataRequests:1];

  double v20 = (void *)MEMORY[0x1E4F42FF0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke;
  v25[3] = &unk_1E5622A18;
  v25[4] = self;
  BOOL v26 = IsReduceMotionEnabled;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke_2;
  v22[3] = &unk_1E5623E10;
  BOOL v24 = IsReduceMotionEnabled;
  v22[4] = self;
  id v21 = v4;
  id v23 = v21;
  [v20 animateWithDuration:v25 animations:v22 completion:v17];
  if (!IsReduceMotionEnabled) {
    [(CKInlineReplyChatController *)self performSelector:sel__requestDismissal withObject:0 afterDelay:1.5];
  }
}

void __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke(uint64_t a1)
{
  v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 replyTranscriptBackgroundDoesSupportTransparentBlurVisualEffect];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    double v5 = [v4 blurView];
    [v5 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];

    objc_super v6 = [*(id *)(a1 + 32) blurView];
    [v6 setBackgroundColor:0];
  }
  else
  {
    objc_super v6 = [v4 blurParentView];
    [v6 animateOut];
  }

  if (*(unsigned char *)(a1 + 40))
  {
    double v7 = [*(id *)(a1 + 32) collectionView];
    [v7 setAlpha:0.0];
  }
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)CKInlineReplyChatController;
  BOOL v8 = objc_msgSendSuper2(&v20, sel__defaultTranscriptNavBarAppearance);
  double v9 = [*(id *)(a1 + 32) parentViewController];
  double v10 = [v9 navigationItem];
  [v10 setStandardAppearance:v8];

  uint64_t v11 = [*(id *)(a1 + 32) parentViewController];
  double v12 = [(id)v11 navigationItem];
  [v12 setScrollEdgeAppearance:v8];

  double v13 = [*(id *)(a1 + 32) splitViewController];
  LOBYTE(v11) = [v13 isCollapsed];
  char v14 = [*(id *)(a1 + 32) splitViewController];
  double v15 = v14;
  if (v11) {
    [v14 masterViewController];
  }
  else {
  double v16 = [v14 detailViewController];
  }

  double v17 = [v16 navigationBar];
  [v17 setNeedsLayout];

  double v18 = [v16 navigationBar];
  [v18 layoutIfNeeded];

  int v19 = [*(id *)(a1 + 32) transcriptOverlayTransitionDelegate];
  [v19 transcriptOverlayViewControllerIsAnimatingOut:*(void *)(a1 + 32)];
}

void __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _requestDismissal];
  }
  v2 = [*(id *)(a1 + 32) collectionView];
  [v2 endHoldingContentOffsetUpdatesForReason:@"InlineReplyChatController"];

  if (*(void *)(a1 + 40))
  {
    int v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Calling completion on _animateOut", v4, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_animateOut
{
}

- (void)_setInitialScrollPositionIfNecessary
{
  int v3 = [(CKInlineReplyChatController *)self transitionContext];
  id v68 = [v3 anchorChatItemGUID];

  id v4 = [(CKCoreChatController *)self collectionViewController];
  double v5 = [v4 chatItemForGUID:v68];

  if (UIAccessibilityIsReduceMotionEnabled()
    || ([(CKInlineReplyChatController *)self transitionContext],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 presentWithKeyboard],
        v6,
        v7))
  {
    BOOL v8 = [(CKCoreChatController *)self collectionViewController];
    [v8 scrollTranscriptToEntryViewInsertionTimeWithAnimation:0];
LABEL_4:

    goto LABEL_5;
  }
  if (v5)
  {
    double v9 = *MEMORY[0x1E4F437F8];
    double v10 = [(CKInlineReplyChatController *)self view];
    [v10 safeAreaInsets];
    double v12 = v11;

    double v13 = [(CKChatController *)self collectionView];
    [v13 frame];
    CGFloat v14 = CGRectGetHeight(v70) - (v9 + v12);

    BOOL v8 = [(CKChatController *)self collectionView];
    double v15 = [v8 collectionViewLayout];
    [v15 collectionViewContentSize];
    double v17 = v16;

    double v18 = [(CKCoreChatController *)self collectionViewController];
    int v19 = v18;
    if (v17 >= v14)
    {
      objc_super v20 = [v18 chatItems];
      uint64_t v21 = [v20 indexOfObject:v5];

      int v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v21 inSection:0];
      double v22 = [(CKChatController *)self collectionView];
      id v23 = [v22 collectionViewLayout];
      BOOL v24 = [v23 layoutAttributesForItemAtIndexPath:v19];

      CGFloat v25 = v24[44];
      CGFloat v26 = v24[45];
      CGFloat v27 = v24[46];
      CGFloat v28 = v24[47];
      [v8 bounds];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      [v8 contentInset];
      double v66 = v37;
      double v67 = v30;
      CGFloat v39 = v30 + v38;
      CGFloat v40 = v32 + v37;
      CGFloat v42 = v34 - (v38 + v41);
      CGFloat v44 = v36 - (v37 + v43);
      v71.origin.x = v25;
      v71.origin.double y = v26;
      v71.size.double width = v27;
      v71.size.double height = v28;
      double MidY = CGRectGetMidY(v71);
      v72.origin.x = v39;
      v72.origin.double y = v40;
      v72.size.double width = v42;
      v72.size.double height = v44;
      double v46 = MidY + CGRectGetHeight(v72) * -0.5;
      v47 = [(CKCoreChatController *)self collectionViewController];
      v48 = [v47 chatItems];
      v49 = [v48 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v50 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
        v51 = [v8 layoutAttributesForItemAtIndexPath:v50];
        [v51 frame];
        CGFloat v53 = v52;
        CGFloat v55 = v54;
        CGFloat v57 = v56;
        CGFloat v59 = v58;

        v73.origin.x = v53;
        v73.origin.double y = v55;
        v73.size.double width = v57;
        v73.size.double height = v59;
        double MaxY = CGRectGetMaxY(v73);
        if (v46 < MaxY) {
          double v46 = MaxY;
        }
      }
      v61 = [(CKChatController *)self collectionView];
      objc_msgSend(v61, "__ck_bottomOffset");
      double v63 = v62;

      if (v63 >= v46 - v66) {
        double v64 = v46 - v66;
      }
      else {
        double v64 = v63;
      }
      if (v64 <= -v66) {
        double v65 = -v66;
      }
      else {
        double v65 = v64;
      }
      objc_msgSend(v8, "setContentOffset:animated:", 0, v67, v65);
    }
    else
    {
      [v18 scrollTranscriptToEntryViewInsertionTimeWithAnimation:0];
    }

    goto LABEL_4;
  }
LABEL_5:
}

- (void)_requestDismissal
{
  int v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Executing _requestDismissal", v8, 2u);
  }

  id v4 = [(CKInlineReplyChatController *)self transcriptOverlayTransitionDelegate];
  [v4 transcriptOverlayViewControllerDidAnimateOut:self];

  double v5 = [(CKInlineReplyChatController *)self interactionDelegate];
  objc_super v6 = [(CKChatController *)self entryView];
  int v7 = [v6 contentView];
  objc_msgSend(v5, "inlineReplyControllerRequestsDismissal:presentKeyboard:", self, objc_msgSend(v7, "isActive"));
}

- (id)_imMessageForIMMessageItem:(id)a3
{
  return +[CKUtilities imMessageForIMMessageItem:a3];
}

- (id)_visibleGUIDs
{
  int v3 = [(CKCoreChatController *)self collectionViewController];
  id v4 = [v3 chatItems];
  double v5 = objc_msgSend(v4, "__imArrayByApplyingBlock:", &__block_literal_global_41);

  objc_super v6 = [(CKCoreChatController *)self collectionViewController];
  int v7 = [v6 associatedChatItems];
  BOOL v8 = objc_msgSend(v7, "__imArrayByApplyingBlock:", &__block_literal_global_191);

  double v9 = [v5 arrayByAddingObjectsFromArray:v8];

  return v9;
}

id __44__CKInlineReplyChatController__visibleGUIDs__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 IMChatItem];
  int v3 = [v2 guid];

  return v3;
}

id __44__CKInlineReplyChatController__visibleGUIDs__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 IMChatItem];
  int v3 = [v2 guid];

  return v3;
}

- (id)parentViewControllerForPluginViewControllerInMessageEntryView:(id)a3
{
  if ([(CKInlineReplyChatController *)self isModal])
  {
    id v4 = self;
  }
  else
  {
    id v4 = [(CKInlineReplyChatController *)self parentChatController];
  }

  return v4;
}

- (BOOL)wantsBackingTranscriptToIgnoreContentOffsetChanges
{
  return 0;
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CKInlineReplyChatController;
  [(CKChatController *)&v9 stageAssetArchive:a3 skipShelf:a4 completionHandler:a5];
  objc_super v6 = [(CKChatController *)self deferredPresentationBlock];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 200000000);
    BOOL v8 = [(CKChatController *)self deferredPresentationBlock];
    dispatch_after(v7, MEMORY[0x1E4F14428], v8);

    [(CKChatController *)self setDeferredPresentationBlock:0];
  }
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (IMMessageItem)threadOriginator
{
  return self->_threadOriginator;
}

- (void)setThreadOriginator:(id)a3
{
}

- (CKTranscriptOverlayTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
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

- (BOOL)shouldReloadInsetsForFloatingKeyboard
{
  return self->_shouldReloadInsetsForFloatingKeyboard;
}

- (void)setShouldReloadInsetsForFloatingKeyboard:(BOOL)a3
{
  self->_shouldReloadInsetsForFloatingKeyboard = a3;
}

- (NSDictionary)originatorMessageSummaryInfo
{
  return self->_originatorMessageSummaryInfo;
}

- (CKTranscriptOverlayTransitionDelegate)transcriptOverlayTransitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transcriptOverlayTransitionDelegate);

  return (CKTranscriptOverlayTransitionDelegate *)WeakRetained;
}

- (void)setTranscriptOverlayTransitionDelegate:(id)a3
{
}

- (CKInlineReplyInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CKInlineReplyInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
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

- (BOOL)isInitialSizing
{
  return self->_isInitialSizing;
}

- (void)setIsInitialSizing:(BOOL)a3
{
  self->_isInitialSizing = a3;
}

- (BOOL)hasCompletedAnimationIn
{
  return self->_hasCompletedAnimationIn;
}

- (void)setHasCompletedAnimationIn:(BOOL)a3
{
  self->_hasCompletedAnimationIn = a3;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (CKInlineReplyTransparentBlurBackgroundView)blurParentView
{
  return self->_blurParentView;
}

- (void)setBlurParentView:(id)a3
{
}

- (BOOL)showNavbarKeyline
{
  return self->_showNavbarKeyline;
}

- (UINavigationBarAppearance)navBarAppearance
{
  return self->_navBarAppearance;
}

- (void)setNavBarAppearance:(id)a3
{
}

- (CKChatController)parentChatController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentChatController);

  return (CKChatController *)WeakRetained;
}

- (void)setParentChatController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentChatController);
  objc_storeStrong((id *)&self->_navBarAppearance, 0);
  objc_storeStrong((id *)&self->_blurParentView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_destroyWeak((id *)&self->_transcriptOverlayTransitionDelegate);
  objc_storeStrong((id *)&self->_originatorMessageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);

  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

- (BOOL)allowsLoadingIndicatorPresentation
{
  return 0;
}

- (void)_animateIn:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Not performing _animateIn because blur view is nil", v1, 2u);
}

@end