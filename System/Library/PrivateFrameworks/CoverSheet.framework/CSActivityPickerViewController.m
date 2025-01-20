@interface CSActivityPickerViewController
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (CSActivityPickerViewControllerDelegate)delegate;
- (CSActivityPickerViewControllerParentContainer)parentContainer;
- (CSDismissableModalViewController)modalPresenter;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationTransition;
- (int64_t)presentationType;
- (void)_dismissWithRepresentedActivity:(id)a3 transitionCoordinator:(id)a4;
- (void)_presentFromView:(id)a3 representedActivity:(id)a4 transitionCoordinator:(id)a5;
- (void)addGrabberView:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)dismiss;
- (void)handleTap:(id)a3;
- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (void)resetScrollForStaticPresentation;
- (void)setDelegate:(id)a3;
- (void)setModalPresenter:(id)a3;
- (void)setParentContainer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSActivityPickerViewController

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)CSActivityPickerViewController;
  [(CSCoverSheetViewControllerBase *)&v17 viewDidLoad];
  v3 = [(CSActivityPickerViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v3 bounds];
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v5;

  [(UIView *)self->_contentView setClipsToBounds:1];
  [v3 addSubview:self->_contentView];
  [(UIView *)self->_contentView setAutoresizingMask:18];
  v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_handleTap_];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v7;

  [(UIView *)self->_contentView addGestureRecognizer:self->_tapGesture];
  v9 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:20 options:2 initialWeighting:0.0];
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v9;

  v11 = self->_backgroundMaterialView;
  [v3 bounds];
  -[MTMaterialView setFrame:](v11, "setFrame:");
  [(UIView *)self->_contentView addSubview:self->_backgroundMaterialView];
  [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
  v12 = (FCUIActivityPickerViewController *)objc_alloc_init(MEMORY[0x1E4F62280]);
  activityPickerViewController = self->_activityPickerViewController;
  self->_activityPickerViewController = v12;

  v14 = [(CSActivityPickerViewController *)self traitCollection];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 == 1) {
    [(FCUIActivityPickerViewController *)self->_activityPickerViewController setFooterPinnedToBottom:0];
  }
  [(CSActivityPickerViewController *)self bs_addChildViewController:self->_activityPickerViewController withSuperview:self->_contentView];
  v16 = [(FCUIActivityPickerViewController *)self->_activityPickerViewController view];
  [v3 bounds];
  objc_msgSend(v16, "setFrame:");
  [v16 setAlpha:0.0];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  if (self->_activityPickerViewController == a3)
  {
    uint64_t v6 = CCUIDefaultExpandedContentModuleWidth();
    MEMORY[0x1F4102E10](v6);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CSActivityPickerViewController;
    [(CSActivityPickerViewController *)&v7 sizeForChildContentContainer:a4.width withParentContainerSize:a4.height];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSActivityPickerViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  if (!CGAffineTransformIsIdentity(&v9))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__CSActivityPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E6ADA6B8;
    v8[4] = self;
    *(double *)&v8[5] = width;
    *(double *)&v8[6] = height;
    [v7 animateAlongsideTransition:v8 completion:0];
  }
}

void __85__CSActivityPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sizeForChildContentContainer:withParentContainerSize:", *(void *)(*(void *)(a1 + 32) + 1080), *(double *)(a1 + 40), *(double *)(a1 + 48));
  BSRectWithSize();
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "view", 0);
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  id v11 = [*(id *)(*(void *)(a1 + 32) + 1080) view];
  [v11 layoutIfNeeded];
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  double v8 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentContainer);
  if (a4)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F433A0]);
    [v10 _setDuration:0.81151];
    if (objc_opt_respondsToSelector())
    {
      id v11 = [WeakRetained activityPickerViewControllerTransitionContainerView:self];
    }
    else
    {
      id v11 = 0;
    }
    [v10 _setContainerView:v11];
    a4 = objc_alloc_init(_CSActivityPickerAnimator);
    [v10 _setAnimator:a4];
  }
  else
  {
    id v10 = 0;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v13 = [v12 activityPickerViewControllerPresentingView:self];
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
    if (!v6)
    {
LABEL_9:
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [v12 activityPickerViewControllerRepresentedActivityForDismissal:self];
LABEL_14:
        uint64_t v15 = (void *)v14;
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [v12 activityPickerViewControllerRepresentedActivityForPresentation:self];
    goto LABEL_14;
  }
LABEL_15:
  uint64_t v15 = 0;
LABEL_16:
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke;
  v26[3] = &unk_1E6ADA6E0;
  BOOL v31 = v6;
  id v16 = v13;
  id v27 = v16;
  v28 = self;
  id v17 = v15;
  id v29 = v17;
  id v18 = v10;
  id v30 = v18;
  uint64_t v19 = MEMORY[0x1D9487300](v26);
  v20 = (void *)v19;
  if (v18)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2;
    block[3] = &unk_1E6ADA730;
    id v22 = v18;
    id v24 = v20;
    v25 = v8;
    id v23 = a4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v19 + 16))(v19, 0);
    v8[2](v8);
  }
}

void __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      goto LABEL_6;
    }
    id v10 = v3;
    double v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    double v7 = [*(id *)(a1 + 56) _transitionCoordinator];
    [v5 _presentFromView:v4 representedActivity:v6 transitionCoordinator:v7];
  }
  else
  {
    id v10 = v3;
    double v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    double v7 = [*(id *)(a1 + 56) _transitionCoordinator];
    [v8 _dismissWithRepresentedActivity:v9 transitionCoordinator:v7];
  }

  id v3 = v10;
LABEL_6:
}

void __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _transitionCoordinator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3;
  v4[3] = &unk_1E6ADA708;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v2 animateAlongsideTransition:v3 completion:v4];

  [*(id *)(a1 + 40) animateTransition:*(void *)(a1 + 32)];
}

uint64_t __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresenter);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__CSActivityPickerViewController_dismiss__block_invoke;
    v6[3] = &unk_1E6AD87F8;
    id v7 = WeakRetained;
    [v7 dismissContentViewController:self animated:1 completion:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSActivityPickerViewController;
    [(CSCoverSheetViewControllerBase *)&v5 dismiss];
  }
}

uint64_t __41__CSActivityPickerViewController_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

- (void)aggregateAppearance:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CSActivityPickerViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v11 aggregateAppearance:v3];
  uint64_t v4 = objc_opt_new();
  objc_super v5 = objc_msgSend(v4, "priority:", 40, v11.receiver, v11.super_class);
  uint64_t v6 = [v5 fakeStatusBar:1];
  id v7 = [v6 fakeStatusBarLevel:&unk_1F306BF50];
  [v3 addComponent:v7];

  double v8 = +[CSComponent homeAffordance];
  uint64_t v9 = [v8 priority:40];
  id v10 = [v9 hidden:1];
  [v3 addComponent:v10];
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSActivityPickerViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "setScrollingStrategy:", 3, v4.receiver, v4.super_class);
  [v3 setIdleTimerMode:1];
  [v3 setIdleTimerDuration:9];
  [v3 setIdleWarnMode:2];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSActivityPickerViewController;
  if ([(CSCoverSheetViewControllerBase *)&v7 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    goto LABEL_7;
  }
  if (([v4 type] | 2) == 0x1B
    && ([(CSActivityPickerViewController *)self bs_isDisappearingOrDisappeared] & 1) == 0)
  {
    [(CSActivityPickerViewController *)self dismiss];
LABEL_7:
    char v5 = [v4 isConsumable];
    goto LABEL_8;
  }
  char v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 type] == 27 || objc_msgSend(v3, "type") == 25;

  return v4;
}

- (int64_t)presentationStyle
{
  return 2;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationTransition
{
  return 1;
}

- (int64_t)presentationPriority
{
  return 500;
}

- (void)addGrabberView:(id)a3
{
  id v7 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    p_grabberView = &self->_grabberView;
    if ((BSEqualObjects() & 1) == 0)
    {
      [(UIView *)*p_grabberView removeFromSuperview];
      objc_storeStrong((id *)&self->_grabberView, a3);
      [(CSActivityPickerViewController *)self loadViewIfNeeded];
      uint64_t v6 = *p_grabberView;
      [(UIView *)self->_contentView bounds];
      -[UIView setFrame:](v6, "setFrame:");
      [(UIView *)*p_grabberView setAutoresizingMask:18];
      [(UIView *)self->_contentView addSubview:*p_grabberView];
    }
  }
}

- (void)_presentFromView:(id)a3 representedActivity:(id)a4 transitionCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(_UIPortalView *)self->_presentingPortalView removeFromSuperview];
  objc_super v11 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke;
  v37 = &unk_1E6AD88C0;
  v38 = self;
  id v12 = v8;
  id v39 = v12;
  [v11 performWithoutAnimation:&v34];
  [(UIView *)self->_contentView bounds];
  -[CSActivityPickerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", self->_activityPickerViewController, v13, v14);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_2;
  v26 = &unk_1E6AD8D20;
  uint64_t v30 = v15;
  uint64_t v31 = v16;
  uint64_t v32 = v17;
  uint64_t v33 = v18;
  id v27 = self;
  id v28 = v9;
  id v19 = v10;
  id v29 = v19;
  id v20 = v9;
  uint64_t v21 = MEMORY[0x1D9487300](&v23);
  id v22 = (void *)v21;
  if (v19) {
    objc_msgSend(v19, "animateAlongsideTransition:completion:", v21, 0, 0, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36,
  }
      v37,
      v38);
  else {
    (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
  }
}

void __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1080) view];
  [v2 setAlpha:1.0];

  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F43298]) initWithSourceView:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(v4 + 1064);
  *(void *)(v4 + 1064) = v3;

  uint64_t v6 = (void *)(*(void *)(a1 + 32) + 1096);
  id v7 = [*(id *)(a1 + 40) superview];
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v7, "convertRect:toView:", *(void *)(*(void *)(a1 + 32) + 1048));
  *uint64_t v6 = v8;
  v6[1] = v9;
  v6[2] = v10;
  v6[3] = v11;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "setFrame:", *(double *)(*(void *)(a1 + 32) + 1096), *(double *)(*(void *)(a1 + 32) + 1104), *(double *)(*(void *)(a1 + 32) + 1112), *(double *)(*(void *)(a1 + 32) + 1120));
  [*(id *)(*(void *)(a1 + 32) + 1064) setHidesSourceView:1];
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = *(void **)(v12 + 1048);
  uint64_t v14 = *(void *)(v12 + 1064);
  id v15 = [*(id *)(v12 + 1080) view];
  [v13 insertSubview:v14 belowSubview:v15];
}

uint64_t __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1080) view];
  [v2 setHidden:0];

  uint64_t v3 = *(void *)(a1 + 32);
  objc_msgSend(*(id *)(v3 + 1080), "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", *(void *)(a1 + 40), 1, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(v3 + 1096), *(double *)(v3 + 1104), *(double *)(v3 + 1112), *(double *)(v3 + 1120));
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "convertRect:fromView:", 0);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  UIDistanceBetweenRects();
  double v25 = round(v20 / 100.0);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "setFrame:", v13, v15, v17, v19);
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.double width = v9;
  v28.size.double height = v11;
  double Height = CGRectGetHeight(v28);
  CGFloat v22 = CGRectGetHeight(*(CGRect *)(*(void *)(a1 + 32) + 1096));
  uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 1064);
  CGAffineTransformMakeScale(&v27, Height / v22, Height / v22);
  [v23 setTransform:&v27];
  [*(id *)(*(void *)(a1 + 32) + 1056) setWeighting:1.0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_3;
  v26[3] = &unk_1E6AD87F8;
  void v26[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:34 delay:v26 options:0 mass:v25 * 0.135251667 + 0.135251667 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:38.0 completion:0.0];
}

uint64_t __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1064) setAlpha:0.0];
}

- (void)_dismissWithRepresentedActivity:(id)a3 transitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self->_presentingPortalView;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke;
  v21[3] = &unk_1E6ADA780;
  v21[4] = self;
  id v9 = v6;
  id v22 = v9;
  id v10 = v7;
  id v23 = v10;
  CGFloat v11 = v8;
  uint64_t v24 = v11;
  double v12 = (void (**)(void, void))MEMORY[0x1D9487300](v21);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_3;
  double v18 = &unk_1E6AD99F0;
  double v13 = v11;
  double v19 = v13;
  double v20 = self;
  double v14 = (void (**)(void, void))MEMORY[0x1D9487300](&v15);
  if (v10)
  {
    objc_msgSend(v10, "animateAlongsideTransition:completion:", v12, v14, v15, v16, v17, v18);
  }
  else
  {
    v12[2](v12, 0);
    v14[2](v14, 0);
  }
}

void __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", *(void *)(a1 + 40), 1, *(void *)(a1 + 48), *(double *)(*(void *)(a1 + 32) + 1096), *(double *)(*(void *)(a1 + 32) + 1104), *(double *)(*(void *)(a1 + 32) + 1112), *(double *)(*(void *)(a1 + 32) + 1120));
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  id v10 = [*(id *)(*(void *)(a1 + 32) + 1080) view];
  [v10 setAlpha:0.0];

  CGFloat v11 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_2;
  v15[3] = &unk_1E6ADA758;
  v15[4] = *(void *)(a1 + 32);
  uint64_t v17 = v3;
  uint64_t v18 = v5;
  uint64_t v19 = v7;
  uint64_t v20 = v9;
  id v16 = *(id *)(a1 + 56);
  [v11 performWithoutAnimation:v15];
  double v12 = *(void **)(a1 + 56);
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v14[0] = *MEMORY[0x1E4F1DAB8];
  v14[1] = v13;
  v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v12 setTransform:v14];
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(*(void *)(a1 + 32) + 1096), *(double *)(*(void *)(a1 + 32) + 1104), *(double *)(*(void *)(a1 + 32) + 1112), *(double *)(*(void *)(a1 + 32) + 1120));
  [*(id *)(a1 + 56) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1056) setWeighting:0.0];
}

uint64_t __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  objc_msgSend(v2, "convertRect:fromView:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  int IsValid = CGFloatIsValid();
  int v12 = CGFloatIsValid();
  int v13 = CGFloatIsValid();
  char v14 = CGFloatIsValid();
  if (IsValid) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = v15 || v13 == 0;
  if (!v16 && (v14 & 1) != 0) {
    goto LABEL_14;
  }
  if (IsValid)
  {
    if (v12) {
      goto LABEL_11;
    }
LABEL_18:
    double v10 = *(double *)(a1 + 72);
    if (v14)
    {
LABEL_12:
      if (v13) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  double v8 = *(double *)(a1 + 64);
  if ((v12 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_11:
  if (v14) {
    goto LABEL_12;
  }
LABEL_19:
  double v6 = *(double *)(a1 + 56);
  if ((v13 & 1) == 0)
  {
LABEL_13:
    uint64_t v17 = [*(id *)(a1 + 32) view];
    [v17 size];
    double v4 = (v18 - v8) * 0.5;
  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v4, v6, v8, v10);
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 1048);

  return [v20 bringSubviewToFront:v19];
}

void __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 == *(void **)(*(void *)(a1 + 40) + 1064))
  {
    [v2 removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 40);
    double v4 = *(void **)(v3 + 1064);
    *(void *)(v3 + 1064) = 0;
  }
}

- (void)resetScrollForStaticPresentation
{
}

- (void)handleTap:(id)a3
{
  if (self->_tapGesture == a3) {
    [(CSActivityPickerViewController *)self dismiss];
  }
}

- (CSActivityPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSActivityPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSActivityPickerViewControllerParentContainer)parentContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentContainer);

  return (CSActivityPickerViewControllerParentContainer *)WeakRetained;
}

- (void)setParentContainer:(id)a3
{
}

- (CSDismissableModalViewController)modalPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresenter);

  return (CSDismissableModalViewController *)WeakRetained;
}

- (void)setModalPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_modalPresenter);
  objc_destroyWeak((id *)&self->_parentContainer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_activityPickerViewController, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_presentingPortalView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end