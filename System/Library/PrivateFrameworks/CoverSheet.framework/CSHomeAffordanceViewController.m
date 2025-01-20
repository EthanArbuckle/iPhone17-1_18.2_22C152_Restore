@interface CSHomeAffordanceViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isHomeAffordanceInteractionEnabled;
- (CGPoint)homeAffordanceOffset;
- (CGRect)_homeAffordanceRestingFrame;
- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3;
- (CSCoverSheetContextProviding)coverSheetContext;
- (CSHomeAffordanceView)homeAffordanceView;
- (CSHomeAffordanceViewController)initWithCoverSheetContext:(id)a3;
- (CSHomeAffordanceViewControllerDelegate)delegate;
- (double)homeAffordanceScale;
- (id)_addWrapperViewWithOrientation:(int64_t)a3;
- (void)_handleSuppressAnimationForPointerGesture:(id)a3;
- (void)_layoutHomeAffordance;
- (void)_updateHomeAffordanceInteraction;
- (void)aggregateAppearance:(id)a3;
- (void)homeAffordanceInteractionDidFailToRecognizeDoubleTap:(id)a3;
- (void)homeAffordanceInteractionDidRecognizeDoubleTap:(id)a3;
- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeAffordanceInteractionEnabled:(BOOL)a3;
- (void)setHomeAffordanceOffset:(CGPoint)a3;
- (void)setHomeAffordanceOffset:(CGPoint)a3 scale:(double)a4;
- (void)setHomeAffordanceScale:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSHomeAffordanceViewController

- (CSHomeAffordanceViewController)initWithCoverSheetContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSHomeAffordanceViewController;
  v6 = [(CSCoverSheetViewControllerBase *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetContext, a3);
    v7->_homeAffordanceScale = 1.0;
    uint64_t v8 = [MEMORY[0x1E4FA5F28] rootSettings];
    settings = v7->_settings;
    v7->_settings = (SBFHomeGrabberSettings *)v8;
  }
  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CSHomeAffordanceViewController;
  [(CSCoverSheetViewControllerBase *)&v11 viewDidLoad];
  v3 = [(CSHomeAffordanceViewController *)self view];
  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  counterRotationView = self->_counterRotationView;
  self->_counterRotationView = v4;

  [v3 addSubview:self->_counterRotationView];
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  rotationWrapperViews = self->_rotationWrapperViews;
  self->_rotationWrapperViews = v6;

  uint64_t v8 = [(CSHomeAffordanceViewController *)self _addWrapperViewWithOrientation:self->_orientation];
  v9 = [[CSHomeAffordanceView alloc] initWithCoverSheetContext:self->_coverSheetContext];
  homeAffordanceView = self->_homeAffordanceView;
  self->_homeAffordanceView = v9;

  [v8 addSubview:self->_homeAffordanceView];
  [(CSHomeAffordanceViewController *)self _updateHomeAffordanceInteraction];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)CSHomeAffordanceViewController;
  [(CSCoverSheetViewControllerBase *)&v29 viewDidLayoutSubviews];
  v3 = [(CSHomeAffordanceViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_counterRotationView, "setFrame:", v5, v7, v9, v11);
  [(UIView *)self->_counterRotationView bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = self->_rotationWrapperViews;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v24++), "setFrame:", v13, v15, v17, v19, (void)v25);
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v22);
  }

  [(CSHomeAffordanceViewController *)self _layoutHomeAffordance];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CSHomeAffordanceViewController;
  [(CSCoverSheetViewControllerBase *)&v8 viewDidAppear:a3];
  if (!self->_suppressAnimationForPointerGestureRecognizer)
  {
    double v4 = (UIHoverGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:self action:sel__handleSuppressAnimationForPointerGesture_];
    suppressAnimationForPointerGestureRecognizer = self->_suppressAnimationForPointerGestureRecognizer;
    self->_suppressAnimationForPointerGestureRecognizer = v4;
  }
  double v6 = [(CSHomeAffordanceViewController *)self view];
  double v7 = [v6 window];
  [v7 addGestureRecognizer:self->_suppressAnimationForPointerGestureRecognizer];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSHomeAffordanceViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidDisappear:a3];
  double v4 = [(CSHomeAffordanceViewController *)self view];
  double v5 = [v4 window];
  [v5 removeGestureRecognizer:self->_suppressAnimationForPointerGestureRecognizer];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)CSHomeAffordanceViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v47, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_super v8 = SBFWindowForViewControllerTransition();
  uint64_t v9 = [v8 _toWindowOrientation];

  int v10 = [v7 isAnimated];
  id v11 = [(NSMutableArray *)self->_rotationWrapperViews firstObject];
  if (v10)
  {
    double v12 = [(CSHomeAffordanceViewController *)self _addWrapperViewWithOrientation:v9];
    [v12 setAlpha:0.0];
    double v13 = objc_opt_new();
    double v14 = objc_opt_new();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v42[3] = &unk_1E6ADA7C0;
    id v15 = v13;
    id v43 = v15;
    id v16 = v14;
    id v44 = v16;
    v45 = self;
    id v17 = v12;
    id v46 = v17;
    double v18 = (void *)MEMORY[0x1D9487300](v42);
    double v19 = [(SBFHomeGrabberSettings *)self->_settings rotationFadeOutAnimationSettings];
    v20 = [v19 BSAnimationSettings];

    uint64_t v21 = (void *)MEMORY[0x1E4F4F898];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v40[3] = &unk_1E6AD87F8;
    id v41 = v11;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
    v35[3] = &unk_1E6ADA7E8;
    v35[4] = self;
    id v36 = v17;
    id v37 = v41;
    id v38 = v15;
    id v22 = v18;
    id v39 = v22;
    id v28 = v15;
    id v23 = v41;
    id v11 = v17;
    [v21 animateWithSettings:v20 actions:v40 completion:v35];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
    v34[3] = &unk_1E6ADA810;
    v34[4] = self;
    v34[5] = v9;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6;
    v31[3] = &unk_1E6ADA838;
    id v32 = v16;
    id v33 = v22;
    id v24 = v22;
    id v25 = v16;
    [v7 animateAlongsideTransition:v34 completion:v31];
  }
  else
  {
    counterRotationView = self->_counterRotationView;
    SBFTransformFromOrientationToOrientation();
    [(UIView *)counterRotationView setTransform:v30];
    SBFTransformFromOrientationToOrientation();
    [v11 setTransform:v29];
  }

  long long v27 = [(CSHomeAffordanceViewController *)self view];
  [v27 setNeedsLayout];
}

void __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasBeenSignalled]
    && [*(id *)(a1 + 40) hasBeenSignalled])
  {
    v2 = [*(id *)(*(void *)(a1 + 48) + 1056) firstObject];
    v3 = *(void **)(a1 + 56);

    if (v2 == v3)
    {
      double v4 = [*(id *)(*(void *)(a1 + 48) + 1072) rotationFadeInAnimationSettings];
      double v5 = [v4 BSAnimationSettings];

      objc_super v6 = (void *)MEMORY[0x1E4F4F898];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
      v7[3] = &unk_1E6AD87F8;
      id v8 = *(id *)(a1 + 56);
      [v6 animateWithSettings:v5 actions:v7];
    }
  }
}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1056) firstObject];
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 1120)];
    double v4 = [*(id *)(a1 + 32) view];
    [v4 setNeedsLayout];
  }
  [*(id *)(*(void *)(a1 + 32) + 1056) removeObject:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) signal];
  double v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v5();
}

void __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1048);
  SBFTransformFromOrientationToOrientation();
  [v2 setTransform:&v5];
  v3 = [*(id *)(a1 + 32) view];
  [v3 setNeedsLayout];

  double v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) signal];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained isEqual:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xF7 | v8;
  }
}

- (BOOL)isHomeAffordanceInteractionEnabled
{
  return [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction isEnabled];
}

- (void)setHomeAffordanceInteractionEnabled:(BOOL)a3
{
}

- (void)setHomeAffordanceOffset:(CGPoint)a3
{
  if (self->_homeAffordanceOffset.x != a3.x || self->_homeAffordanceOffset.y != a3.y)
  {
    self->_homeAffordanceOffset = a3;
    [(CSHomeAffordanceViewController *)self _layoutHomeAffordance];
  }
}

- (void)setHomeAffordanceScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_homeAffordanceScale = a3;
    [(CSHomeAffordanceViewController *)self _layoutHomeAffordance];
  }
}

- (void)setHomeAffordanceOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_homeAffordanceOffset.x == a3.x && self->_homeAffordanceOffset.y == a3.y)
  {
    p_homeAffordanceScale = &self->_homeAffordanceScale;
    if (BSFloatEqualToFloat()) {
      return;
    }
  }
  else
  {
    self->_homeAffordanceOffset = a3;
    p_homeAffordanceScale = &self->_homeAffordanceScale;
    if (BSFloatEqualToFloat()) {
      goto LABEL_9;
    }
  }
  double *p_homeAffordanceScale = a4;
LABEL_9:

  [(CSHomeAffordanceViewController *)self _layoutHomeAffordance];
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)_layoutHomeAffordance
{
  [(CSHomeAffordanceViewController *)self _homeAffordanceRestingFrame];
  double v4 = v3;
  double v6 = v5;
  UIRectGetCenter();
  double v8 = v7;
  double v10 = v9;
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(CSHomeAffordanceViewController *)self homeAffordanceOffset];
  -[CSHomeAffordanceView setCenter:](self->_homeAffordanceView, "setCenter:", v8 + v13, v10 + v14);
  -[CSHomeAffordanceView setBounds:](self->_homeAffordanceView, "setBounds:", v11, v12, v4, v6);
  [(CSHomeAffordanceViewController *)self homeAffordanceScale];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  if (BSFloatIsOne())
  {
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v19 = *MEMORY[0x1E4F1DAB8];
    long long v20 = v15;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    id v16 = [(CSHomeAffordanceView *)self->_homeAffordanceView superview];
    [v16 bounds];
    UIRectGetCenter();

    SBFTransformForScalingAboutPointInSuperview();
  }
  homeAffordanceView = self->_homeAffordanceView;
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  [(CSHomeAffordanceView *)homeAffordanceView setTransform:v18];
  [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction setNeedsUpdate];
}

- (CGRect)_homeAffordanceRestingFrame
{
  double v3 = [(CSHomeAffordanceView *)self->_homeAffordanceView superview];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(CSHomeAffordanceViewController *)self traitCollection];
  [v6 displayScale];

  [(CSHomeAffordanceView *)self->_homeAffordanceView suggestedSizeForContentWidth:v5];
  [(CSHomeAffordanceView *)self->_homeAffordanceView suggestedEdgeSpacing];
  BSRectRoundForScale();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_addWrapperViewWithOrientation:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(NSMutableArray *)self->_rotationWrapperViews insertObject:v4 atIndex:0];
  SBFTransformFromOrientationToOrientation();
  [v4 setTransform:&v6];
  [(UIView *)self->_counterRotationView addSubview:v4];

  return v4;
}

- (void)_handleSuppressAnimationForPointerGesture:(id)a3
{
  id v10 = a3;
  if ((unint64_t)([v10 state] - 6) > 0xFFFFFFFFFFFFFFFCLL)
  {
    BOOL v9 = 0;
  }
  else
  {
    id v4 = [(CSHomeAffordanceViewController *)self view];
    [v10 locationInView:v4];
    CGFloat v6 = v5;
    CGFloat v8 = v7;

    [(CSHomeAffordanceView *)self->_homeAffordanceView extendedFrameForPointerAnimationSuppression];
    v12.x = v6;
    v12.y = v8;
    BOOL v9 = CGRectContainsPoint(v13, v12);
  }
  if (self->_suppressAnimationForPointer != v9)
  {
    self->_suppressAnimationForPointer = v9;
    [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  }
}

- (void)_updateHomeAffordanceInteraction
{
  double v3 = [(CSCoverSheetContextProviding *)self->_coverSheetContext assistantController];
  int v4 = [v3 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  homeAffordanceInteraction = self->_homeAffordanceInteraction;
  if (v4)
  {
    if (!homeAffordanceInteraction)
    {
      CGFloat v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext homeAffordanceInteractionProvider];
      double v7 = (SBFHomeAffordanceInteraction *)[v6 newHomeAffordanceInteraction];
      CGFloat v8 = self->_homeAffordanceInteraction;
      self->_homeAffordanceInteraction = v7;

      [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction setDelegate:self];
      homeAffordanceView = self->_homeAffordanceView;
      id v10 = self->_homeAffordanceInteraction;
      [(CSHomeAffordanceView *)homeAffordanceView addInteraction:v10];
    }
  }
  else if (homeAffordanceInteraction)
  {
    -[CSHomeAffordanceView removeInteraction:](self->_homeAffordanceView, "removeInteraction:");
    double v11 = self->_homeAffordanceInteraction;
    self->_homeAffordanceInteraction = 0;
  }
}

- (void)aggregateAppearance:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSHomeAffordanceViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v7 aggregateAppearance:v3];
  int v4 = objc_opt_new();
  double v5 = objc_msgSend(v4, "priority:", 10, v7.receiver, v7.super_class);
  CGFloat v6 = [v5 suppressTeachableMomentsAnimation:BSSettingFlagIfYes()];
  [v3 addComponent:v6];
}

- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3
{
  [(CSHomeAffordanceView *)self->_homeAffordanceView bounds];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = WeakRetained;
  char delegateRespondsTo = (char)self->_delegateRespondsTo;
  if (delegateRespondsTo) {
    [WeakRetained homeAffordanceViewControllerDidRecognizeSingleTap:self];
  }
  BOOL v8 = (delegateRespondsTo & 8) != 0;
  homeAffordanceView = self->_homeAffordanceView;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__CSHomeAffordanceViewController_homeAffordanceInteractionDidRecognizeSingleTap___block_invoke;
  v11[3] = &unk_1E6ADA860;
  BOOL v14 = v8;
  id v10 = v6;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  [(CSHomeAffordanceView *)homeAffordanceView performHintAnimationWithCompletionHandler:v11];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

void __81__CSHomeAffordanceViewController_homeAffordanceInteractionDidRecognizeSingleTap___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    double v3 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [v3 homeAffordanceViewController:WeakRetained didCompleteHomeAffordanceHintAnimation:a2];
  }
}

- (void)homeAffordanceInteractionDidRecognizeDoubleTap:(id)a3
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained homeAffordanceViewControllerDidRecognizeDoubleTap:self];
  }
}

- (void)homeAffordanceInteractionDidFailToRecognizeDoubleTap:(id)a3
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained homeAffordanceViewControllerDidFailToRecognizeDoubleTap:self];
  }
}

- (CSHomeAffordanceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSHomeAffordanceViewControllerDelegate *)WeakRetained;
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (CSHomeAffordanceView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (CGPoint)homeAffordanceOffset
{
  double x = self->_homeAffordanceOffset.x;
  double y = self->_homeAffordanceOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)homeAffordanceScale
{
  return self->_homeAffordanceScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_coverSheetContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_suppressAnimationForPointerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rotationWrapperViews, 0);

  objc_storeStrong((id *)&self->_counterRotationView, 0);
}

@end