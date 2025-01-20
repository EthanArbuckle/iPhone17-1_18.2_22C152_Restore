@interface CKFullScreenBalloonViewController
- (BOOL)beganDismissing;
- (BOOL)constrainToPresentingVCBounds;
- (BOOL)followsParentBalloonView;
- (BOOL)forceWindowedPresentation;
- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasInsertedCatalystEmoji;
- (BOOL)hasPerformedInitialAnimations;
- (BOOL)preserveModalPresentationStyle;
- (BOOL)shouldAutorotate;
- (BOOL)shouldShowTapbackAttribution;
- (BOOL)shouldShowTapbackPicker;
- (BOOL)useForcedOrientation;
- (BOOL)wantsWindowedPresentation;
- (BOOL)willPresentInlineReplies;
- (CGRect)preservedBoundsInBalloonWindowAtAppearance;
- (CKFullScreenBalloonViewController)initWithChatItem:(id)a3 delegate:(id)a4;
- (CKFullScreenBalloonViewController)initWithChatItem:(id)a3 displayConfiguration:(id)a4 delegate:(id)a5;
- (CKFullScreenBalloonViewControllerDelegate)delegate;
- (CKFullScreenBalloonViewDisplayConfiguration)displayConfiguration;
- (CKMessagePartChatItem)chatItem;
- (CKMessagePartChatItem)supplementaryLayoutChatItem;
- (UIButton)replyButton;
- (UIGestureRecognizer)tapRecognizer;
- (UIView)keyboardSnapshotView;
- (UIView)tintView;
- (char)forcedOrientation;
- (id)supplementaryLayoutContext;
- (id)viewToAlignWith;
- (void)_performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 duration:(double)a5 withCompletion:(id)a6;
- (void)addTapRecognizerWithTarget:(id)a3 action:(SEL)a4;
- (void)beginDismissal;
- (void)dealloc;
- (void)dismissImmediatelyWithNoAnimations;
- (void)hideTint:(BOOL)a3 duration:(double)a4;
- (void)performCancelAnimationWithCompletion:(id)a3;
- (void)performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 withCompletion:(id)a5;
- (void)performSendAndCloseAnimationWithCompletion:(id)a3;
- (void)removeTapRecognizer;
- (void)replyButtonPressed:(id)a3;
- (void)setBeganDismissing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFollowsParentBalloonView:(BOOL)a3;
- (void)setForcedOrientation:(char)a3;
- (void)setHasInsertedCatalystEmoji:(BOOL)a3;
- (void)setHasPerformedInitialAnimations:(BOOL)a3;
- (void)setKeyboardSnapshotView:(id)a3;
- (void)setPreserveModalPresentationStyle:(BOOL)a3;
- (void)setPreservedBoundsInBalloonWindowAtAppearance:(CGRect)a3;
- (void)setReplyButton:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)setUseForcedOrientation:(BOOL)a3;
- (void)setWantsWindowedPresentation:(BOOL)a3;
- (void)setWillPresentInlineReplies:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewToAlignWith;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CKFullScreenBalloonViewController

- (CKFullScreenBalloonViewController)initWithChatItem:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[CKFullScreenBalloonViewDisplayConfiguration tapbackPickerContext];
  v9 = [(CKFullScreenBalloonViewController *)self initWithChatItem:v7 displayConfiguration:v8 delegate:v6];

  return v9;
}

- (CKFullScreenBalloonViewController)initWithChatItem:(id)a3 displayConfiguration:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKFullScreenBalloonViewController;
  v12 = [(CKFullScreenBalloonViewController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_chatItem, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_displayConfiguration, a4);
  }

  return v13;
}

- (void)dealloc
{
  [(CKFullScreenBalloonViewController *)self removeTapRecognizer];
  v3.receiver = self;
  v3.super_class = (Class)CKFullScreenBalloonViewController;
  [(CKFullScreenBalloonViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)CKFullScreenBalloonViewController;
  [(CKFullScreenBalloonViewController *)&v19 viewDidLoad];
  objc_super v3 = [(CKFullScreenBalloonViewController *)self view];
  [v3 setLayoutMarginsFollowReadableWidth:1];

  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  v5 = [(CKFullScreenBalloonViewController *)self view];
  [v5 bounds];
  id v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");

  [(UIView *)v6 setAutoresizingMask:18];
  id v7 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  v8 = [v7 tintViewBackgroundColor];
  [(UIView *)v6 setBackgroundColor:v8];

  [(UIView *)v6 setAlpha:0.0];
  tintView = self->_tintView;
  self->_tintView = v6;
  id v10 = v6;

  id v11 = [(CKFullScreenBalloonViewController *)self view];
  [v11 addSubview:v10];

  v12 = [(CKFullScreenBalloonViewController *)self chatItem];
  v13 = [(CKFullScreenBalloonViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    objc_super v15 = [(CKFullScreenBalloonViewController *)self delegate];
    int v16 = [v15 fullScreenBalloonViewControllerShouldShowReplyButton:self];

    if (v16)
    {
      v17 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
      int v18 = [v17 shouldShowReplyButton];

      if (v18)
      {
        if ([v12 canInlineReply]) {
          [(CKFullScreenBalloonViewController *)self setupReplyButton];
        }
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKFullScreenBalloonViewController;
  -[CKViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  v5 = [(CKFullScreenBalloonViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKFullScreenBalloonViewController *)self delegate];
    [v7 fullScreenBalloonViewController:self willAppearAnimated:v3];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKFullScreenBalloonViewController;
  -[CKViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  [(CKFullScreenBalloonViewController *)self addTapRecognizerWithTarget:self action:sel_dismissTapGestureRecognized_];
  v5 = [(CKFullScreenBalloonViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKFullScreenBalloonViewController *)self delegate];
    [v7 fullScreenBalloonViewController:self didAppearAnimated:v3];
  }
  if (![(CKFullScreenBalloonViewController *)self hasPerformedInitialAnimations])
  {
    [(CKFullScreenBalloonViewController *)self performInitialAnimations];
    [(CKFullScreenBalloonViewController *)self setHasPerformedInitialAnimations:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKFullScreenBalloonViewController;
  [(CKViewController *)&v4 viewDidDisappear:a3];
  [(CKFullScreenBalloonViewController *)self removeTapRecognizer];
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CKFullScreenBalloonViewController;
  [(CKFullScreenBalloonViewController *)&v2 viewWillLayoutSubviews];
}

- (BOOL)wantsWindowedPresentation
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 fullScreenBalloonWantsWindowedPresentation];
  self->_wantsWindowedPresentation = v4;

  return v4;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 1;
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (BOOL)forceWindowedPresentation
{
  objc_super v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 fullScreenBalloonForceWindowedPresentation];

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (void)replyButtonPressed:(id)a3
{
  [(CKFullScreenBalloonViewController *)self setWillPresentInlineReplies:1];
  [(CKFullScreenBalloonViewController *)self performCancelAnimationWithCompletion:0];
  char v4 = [(CKFullScreenBalloonViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(CKFullScreenBalloonViewController *)self delegate];
    char v6 = [(CKFullScreenBalloonViewController *)self chatItem];
    [v7 fullScreenBalloonViewController:self replyButtonPressedForChatItem:v6];
  }
}

- (id)viewToAlignWith
{
  objc_super v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[CKFullScreenBalloonViewController viewToAlignWith](v2);
  }

  return 0;
}

- (void)performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 withCompletion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)_performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 duration:(double)a5 withCompletion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  [(CKFullScreenBalloonViewController *)self removeTapRecognizer];
  id v11 = [(CKFullScreenBalloonViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(CKFullScreenBalloonViewController *)self delegate];
    [v13 fullScreenBalloonViewController:self willDisappearWithSendAnimation:v7 duration:a5];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__CKFullScreenBalloonViewController__performClosingAnimationsAnimated_withSendAnimation_duration_withCompletion___block_invoke;
  v15[3] = &unk_1E5620F48;
  id v16 = v10;
  id v14 = v10;
  [(CKFullScreenBalloonViewController *)self performClosingAnimationsAnimated:v8 withSendAnimation:v7 withCompletion:v15];
}

uint64_t __113__CKFullScreenBalloonViewController__performClosingAnimationsAnimated_withSendAnimation_duration_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performSendAndCloseAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  [v5 scrollDuration];
  -[CKFullScreenBalloonViewController _performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:](self, "_performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:", 1, 1, v4);
}

- (void)performCancelAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  [v5 scrollDuration];
  -[CKFullScreenBalloonViewController _performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:](self, "_performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:", 1, 0, v4);
}

- (void)dismissImmediatelyWithNoAnimations
{
  id v3 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  [v3 scrollDuration];
  -[CKFullScreenBalloonViewController _performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:](self, "_performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:", 0, 0, 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  return 1;
}

- (void)addTapRecognizerWithTarget:(id)a3 action:(SEL)a4
{
  char v6 = (objc_class *)MEMORY[0x1E4F42EC8];
  id v7 = a3;
  BOOL v8 = (UIGestureRecognizer *)[[v6 alloc] initWithTarget:v7 action:a4];

  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v8;

  [(UIGestureRecognizer *)self->_tapRecognizer setDelegate:self];
  [(UIGestureRecognizer *)self->_tapRecognizer setEnabled:1];
  [(UIGestureRecognizer *)self->_tapRecognizer setDelaysTouchesBegan:1];
  [(UIGestureRecognizer *)self->_tapRecognizer setDelaysTouchesEnded:1];
  [(UIGestureRecognizer *)self->_tapRecognizer setRequiresExclusiveTouchType:0];
  id v10 = [(CKFullScreenBalloonViewController *)self tintView];
  [v10 addGestureRecognizer:self->_tapRecognizer];
}

- (void)removeTapRecognizer
{
  if (self->_tapRecognizer)
  {
    id v3 = [(CKFullScreenBalloonViewController *)self view];
    [v3 removeGestureRecognizer:self->_tapRecognizer];

    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = 0;
  }
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)hideTint:(BOOL)a3 duration:(double)a4
{
  if (!a3) {
    a4 = 0.0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CKFullScreenBalloonViewController_hideTint_duration___block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v4 options:0 animations:a4 completion:0.0];
}

void __55__CKFullScreenBalloonViewController_hideTint_duration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tintView];
  [v1 setAlpha:0.0];
}

- (BOOL)shouldShowTapbackAttribution
{
  id v3 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  char v4 = [v3 shouldHideTapbackAttributionAndPicker];

  if (v4) {
    return 0;
  }
  char v6 = [(CKFullScreenBalloonViewController *)self delegate];
  char v7 = [v6 shouldShowTapbackAttributionForFullScreenBalloonViewController:self];

  return v7;
}

- (BOOL)shouldShowTapbackPicker
{
  id v3 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  char v4 = [v3 shouldHideTapbackAttributionAndPicker];

  if (v4) {
    return 0;
  }
  char v6 = [(CKFullScreenBalloonViewController *)self delegate];
  char v7 = [v6 shouldShowTapbackPickerForFullScreenBalloonViewController:self];

  return v7;
}

- (void)beginDismissal
{
  if (![(CKFullScreenBalloonViewController *)self beganDismissing])
  {
    id v3 = [(CKFullScreenBalloonViewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      [(CKFullScreenBalloonViewController *)self setBeganDismissing:1];
      id v5 = [(CKFullScreenBalloonViewController *)self delegate];
      [v5 fullScreenBalloonViewControllerHandleDismissTap:self];
    }
  }
}

- (CKMessagePartChatItem)supplementaryLayoutChatItem
{
  objc_super v2 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  id v3 = [v2 supplementaryLayoutChatItem];

  return (CKMessagePartChatItem *)v3;
}

- (id)supplementaryLayoutContext
{
  objc_super v2 = [(CKFullScreenBalloonViewController *)self displayConfiguration];
  id v3 = [v2 supplementaryLayoutContext];

  return v3;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

- (CKFullScreenBalloonViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKFullScreenBalloonViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (char)forcedOrientation
{
  return self->_forcedOrientation;
}

- (void)setForcedOrientation:(char)a3
{
  self->_forcedOrientation = a3;
}

- (BOOL)useForcedOrientation
{
  return self->_useForcedOrientation;
}

- (void)setUseForcedOrientation:(BOOL)a3
{
  self->_useForcedOrientation = a3;
}

- (UIGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (BOOL)hasPerformedInitialAnimations
{
  return self->_hasPerformedInitialAnimations;
}

- (void)setHasPerformedInitialAnimations:(BOOL)a3
{
  self->_hasPerformedInitialAnimations = a3;
}

- (UIButton)replyButton
{
  return self->_replyButton;
}

- (void)setReplyButton:(id)a3
{
}

- (UIView)tintView
{
  return self->_tintView;
}

- (UIView)keyboardSnapshotView
{
  return self->_keyboardSnapshotView;
}

- (void)setKeyboardSnapshotView:(id)a3
{
}

- (CKFullScreenBalloonViewDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (BOOL)followsParentBalloonView
{
  return self->_followsParentBalloonView;
}

- (void)setFollowsParentBalloonView:(BOOL)a3
{
  self->_followsParentBalloonView = a3;
}

- (BOOL)willPresentInlineReplies
{
  return self->_willPresentInlineReplies;
}

- (void)setWillPresentInlineReplies:(BOOL)a3
{
  self->_willPresentInlineReplies = a3;
}

- (BOOL)hasInsertedCatalystEmoji
{
  return self->_hasInsertedCatalystEmoji;
}

- (void)setHasInsertedCatalystEmoji:(BOOL)a3
{
  self->_hasInsertedCatalystEmoji = a3;
}

- (BOOL)beganDismissing
{
  return self->_beganDismissing;
}

- (void)setBeganDismissing:(BOOL)a3
{
  self->_beganDismissing = a3;
}

- (CGRect)preservedBoundsInBalloonWindowAtAppearance
{
  double x = self->_preservedBoundsInBalloonWindowAtAppearance.origin.x;
  double y = self->_preservedBoundsInBalloonWindowAtAppearance.origin.y;
  double width = self->_preservedBoundsInBalloonWindowAtAppearance.size.width;
  double height = self->_preservedBoundsInBalloonWindowAtAppearance.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreservedBoundsInBalloonWindowAtAppearance:(CGRect)a3
{
  self->_preservedBoundsInBalloonWindowAtAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshotView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_replyButton, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_chatItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewToAlignWith
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Did not override viewToAlignWith - this is an implementation error.", v1, 2u);
}

@end