@interface FMSlidingPaneViewController
- (BOOL)didHideToolbar;
- (BOOL)isPaneShowing;
- (CGSize)_normalizeSize:(CGSize)a3;
- (CGSize)_preferredSizeForPaneState:(id)a3;
- (FMFuture)currentFuture;
- (FMSlidingPaneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FMSlidingPaneViewControllerDelegate)delegate;
- (NSMutableArray)actionFutures;
- (SlidingPaneViewState)paneState;
- (UIEdgeInsets)paneContentInsets;
- (UIEdgeInsets)paneInsets;
- (UIView)paneView;
- (UIViewController)paneViewController;
- (UIVisualEffect)paneVisualEffect;
- (double)animationDuration;
- (double)animationInitialVelocity;
- (double)animationSpringDamping;
- (id)_metricsFromEdgeInsets:(UIEdgeInsets)a3;
- (id)newActionFuture;
- (id)traitCollectionForChildViewController:(id)a3;
- (unint64_t)animationOptions;
- (void)_createPaneContentConstraintsForState:(id)a3;
- (void)_createPaneViewForState:(id)a3;
- (void)_crossDissolveOldPaneState:(id)a3 newPaneState:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_dismissPaneState:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_paneFrameChanged:(CGRect)a3;
- (void)_presentPaneState:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5 completion:(id)a6;
- (void)_removeChildViewControllerForState:(id)a3;
- (void)awakeFromNib;
- (void)commonConfiguration;
- (void)completeFuture:(id)a3;
- (void)didDismissPane:(id)a3 animated:(BOOL)a4;
- (void)didPresentPane:(id)a3 inRect:(CGRect)a4 animated:(BOOL)a5;
- (void)dismiss:(id)a3;
- (void)dismissPaneViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)paneSizeChanged:(CGRect)a3 forViewController:(id)a4;
- (void)presentPaneViewController:(id)a3 fromEdge:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentPaneViewController:(id)a3 fromEdge:(unint64_t)a4 withPercent:(double)a5 completion:(id)a6;
- (void)setActionFutures:(id)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationInitialVelocity:(double)a3;
- (void)setAnimationOptions:(unint64_t)a3;
- (void)setAnimationSpringDamping:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidHideToolbar:(BOOL)a3;
- (void)setPaneContentInsets:(UIEdgeInsets)a3;
- (void)setPaneInsets:(UIEdgeInsets)a3;
- (void)setPaneState:(id)a3;
- (void)setPaneVisualEffect:(id)a3;
- (void)setPresentingConstraintConstant:(double)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissPane:(id)a3 animated:(BOOL)a4;
- (void)willPresentPane:(id)a3 inRect:(CGRect)a4 animated:(BOOL)a5;
@end

@implementation FMSlidingPaneViewController

- (FMSlidingPaneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FMSlidingPaneViewController;
  v4 = [(FMViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(FMSlidingPaneViewController *)v4 commonConfiguration];
  }
  return v5;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)FMSlidingPaneViewController;
  [(FMViewController *)&v3 awakeFromNib];
  [(FMSlidingPaneViewController *)self commonConfiguration];
}

- (void)commonConfiguration
{
  double v3 = *MEMORY[0x263F1D1C0];
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  -[FMSlidingPaneViewController setPaneInsets:](self, "setPaneInsets:", *MEMORY[0x263F1D1C0], v4, v5, v6);
  -[FMSlidingPaneViewController setPaneContentInsets:](self, "setPaneContentInsets:", v3, v4, v5, v6);
  [(FMSlidingPaneViewController *)self setAnimationDuration:0.200000003];
  [(FMSlidingPaneViewController *)self setAnimationSpringDamping:1.0];
  [(FMSlidingPaneViewController *)self setAnimationInitialVelocity:0.0];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(FMSlidingPaneViewController *)self setActionFutures:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMSlidingPaneViewController;
  [(FMViewController *)&v4 viewWillAppear:a3];
  [(FMSlidingPaneViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
}

- (id)traitCollectionForChildViewController:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMSlidingPaneViewController;
  double v5 = [(FMSlidingPaneViewController *)&v19 traitCollection];
  uint64_t v6 = [(FMSlidingPaneViewController *)self paneState];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [(FMSlidingPaneViewController *)self paneState];
    id v9 = [v8 paneViewController];

    if (v9 == v4)
    {
      v10 = [(FMSlidingPaneViewController *)self paneState];
      uint64_t v11 = [v10 edge];

      switch(v11)
      {
        case 1:
        case 4:
          v12 = [MEMORY[0x263F1CB00] traitCollectionWithVerticalSizeClass:1];
          v13 = (void *)MEMORY[0x263F1CB00];
          v21[0] = v5;
          v21[1] = v12;
          v14 = (void *)MEMORY[0x263EFF8C0];
          v15 = v21;
          goto LABEL_6;
        case 2:
        case 8:
          v12 = [MEMORY[0x263F1CB00] traitCollectionWithHorizontalSizeClass:1];
          v13 = (void *)MEMORY[0x263F1CB00];
          v20[0] = v5;
          v20[1] = v12;
          v14 = (void *)MEMORY[0x263EFF8C0];
          v15 = v20;
LABEL_6:
          v16 = [v14 arrayWithObjects:v15 count:2];
          uint64_t v17 = [v13 traitCollectionWithTraitsFromCollections:v16];

          double v5 = (void *)v17;
          break;
        default:
          v12 = LogCategory_Unspecified();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[FMSlidingPaneViewController traitCollectionForChildViewController:](self);
          }
          break;
      }
    }
  }

  return v5;
}

- (UIView)paneView
{
  v2 = [(FMSlidingPaneViewController *)self paneState];
  double v3 = [v2 paneView];

  return (UIView *)v3;
}

- (UIViewController)paneViewController
{
  v2 = [(FMSlidingPaneViewController *)self paneState];
  double v3 = [v2 paneViewController];

  return (UIViewController *)v3;
}

- (UIVisualEffect)paneVisualEffect
{
  paneVisualEffect = self->_paneVisualEffect;
  if (!paneVisualEffect)
  {
    id v4 = [MEMORY[0x263F1C480] effectWithStyle:0];
    double v5 = self->_paneVisualEffect;
    self->_paneVisualEffect = v4;

    paneVisualEffect = self->_paneVisualEffect;
  }
  return paneVisualEffect;
}

- (void)setPaneVisualEffect:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_paneVisualEffect, a3);
  double v5 = [(FMSlidingPaneViewController *)self paneState];

  if (v5)
  {
    uint64_t v6 = [(FMSlidingPaneViewController *)self paneState];
    id v7 = [v6 visualEffectView];

    v8 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v14];
    [v7 frame];
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(v8, "setAutoresizingMask:", objc_msgSend(v7, "autoresizingMask"));
    id v9 = [(FMSlidingPaneViewController *)self paneState];
    [v9 setVisualEffectView:v8];

    [v7 removeFromSuperview];
    v10 = [(FMSlidingPaneViewController *)self paneState];
    uint64_t v11 = [v10 paneView];
    [v11 addSubview:v8];

    v12 = [(FMSlidingPaneViewController *)self paneState];
    v13 = [v12 paneView];
    [v13 sendSubviewToBack:v8];
  }
}

- (void)presentPaneViewController:(id)a3 fromEdge:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v12 = [(FMSlidingPaneViewController *)self paneState];
  objc_initWeak(&location, self);
  v13 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v37 = v10;
    __int16 v38 = 2048;
    unint64_t v39 = a4;
    __int16 v40 = 1024;
    BOOL v41 = v7;
    _os_log_impl(&dword_218714000, v13, OS_LOG_TYPE_DEFAULT, "presentPaneViewController: %@ fromEdge:%ld animated:%d completed:", buf, 0x1Cu);
  }

  id v14 = [v10 view];
  v15 = [(FMSlidingPaneViewController *)self navigationController];
  if (v15)
  {
    v16 = [(FMSlidingPaneViewController *)self navigationController];
    char v17 = [v16 isToolbarHidden];

    if ((v17 & 1) == 0)
    {
      [(FMSlidingPaneViewController *)self setDidHideToolbar:1];
      v18 = [(FMSlidingPaneViewController *)self navigationController];
      [v18 setToolbarHidden:1 animated:v7];
    }
  }
  objc_super v19 = [[SlidingPaneViewState alloc] initWithViewController:v10 edge:a4];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke;
  v29[3] = &unk_2643351D0;
  objc_copyWeak(&v33, &location);
  v20 = v19;
  v30 = v20;
  id v21 = v12;
  id v31 = v21;
  id v22 = v11;
  id v32 = v22;
  BOOL v34 = v7;
  v23 = (void (**)(void))MEMORY[0x21D470BC0](v29);
  v24 = [(FMSlidingPaneViewController *)self currentFuture];
  if (v24)
  {
    v25 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218714000, v25, OS_LOG_TYPE_DEFAULT, "Deferring presenting until previous action is complete", buf, 2u);
    }

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke_80;
    v27[3] = &unk_2643351F8;
    v28 = v23;
    id v26 = (id)[v24 addCompletionBlock:v27];
  }
  else
  {
    v23[2](v23);
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setPaneState:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = [WeakRetained paneState];
  if (v2) {
    [WeakRetained _crossDissolveOldPaneState:v2 newPaneState:v3 animated:1 completion:*(void *)(a1 + 48)];
  }
  else {
    [WeakRetained _presentPaneState:v3 animated:*(unsigned __int8 *)(a1 + 64) interactive:0 completion:*(void *)(a1 + 48)];
  }
}

uint64_t __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentPaneViewController:(id)a3 fromEdge:(unint64_t)a4 withPercent:(double)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (void (**)(void))a6;
  v12 = [(FMSlidingPaneViewController *)self paneState];
  v13 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v50 = 138412802;
    id v51 = v10;
    __int16 v52 = 2048;
    unint64_t v53 = a4;
    __int16 v54 = 2048;
    double v55 = a5;
    _os_log_impl(&dword_218714000, v13, OS_LOG_TYPE_DEFAULT, "presentPaneViewController: %@ fromEdge:%ld withPercent:%f completion:", (uint8_t *)&v50, 0x20u);
  }

  id v14 = [v10 view];
  uint64_t v15 = [(FMSlidingPaneViewController *)self navigationController];
  if (v15)
  {
    v16 = (void *)v15;
    char v17 = [(FMSlidingPaneViewController *)self navigationController];
    char v18 = [v17 isToolbarHidden];

    if ((v18 & 1) == 0)
    {
      [(FMSlidingPaneViewController *)self setDidHideToolbar:1];
      objc_super v19 = [(FMSlidingPaneViewController *)self navigationController];
      [v19 setToolbarHidden:1 animated:1];
    }
  }
  v20 = [(FMSlidingPaneViewController *)self currentFuture];

  if (v20)
  {
    id v21 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[FMSlidingPaneViewController presentPaneViewController:fromEdge:withPercent:completion:]();
    }
  }
  id v22 = [v12 paneViewController];
  char v23 = [v22 isEqual:v10];

  if ((v23 & 1) == 0)
  {
    v24 = [[SlidingPaneViewState alloc] initWithViewController:v10 edge:a4];
    [(FMSlidingPaneViewController *)self setPaneState:v24];

    v25 = [(FMSlidingPaneViewController *)self paneState];
    if (v12) {
      [(FMSlidingPaneViewController *)self _crossDissolveOldPaneState:v12 newPaneState:v25 animated:0 completion:v11];
    }
    else {
      [(FMSlidingPaneViewController *)self _presentPaneState:v25 animated:0 interactive:1 completion:v11];
    }
  }
  id v26 = [(FMSlidingPaneViewController *)self paneState];
  [(FMSlidingPaneViewController *)self _preferredSizeForPaneState:v26];
  double v28 = v27;
  double v30 = v29;

  id v31 = [(FMSlidingPaneViewController *)self paneState];
  uint64_t v32 = [v31 edge];

  switch(v32)
  {
    case 1:
      double v33 = -((v30 + 2.0) * (1.0 - a5));
      goto LABEL_21;
    case 2:
      double v33 = -((v28 + 2.0) * (1.0 - a5));
      goto LABEL_23;
    case 4:
      double v33 = (1.0 - a5) * (v30 + 2.0);
LABEL_21:
      BOOL v34 = [(FMSlidingPaneViewController *)self paneState];
      v35 = [v34 paneVerticalPositionConstraint];
      goto LABEL_24;
    case 8:
      double v33 = (1.0 - a5) * (v28 + 2.0);
LABEL_23:
      BOOL v34 = [(FMSlidingPaneViewController *)self paneState];
      v35 = [v34 paneHorizontalPositionConstraint];
LABEL_24:
      v36 = v35;
      [v35 setConstant:v33];

      break;
    default:
      BOOL v34 = LogCategory_Unspecified();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[FMSlidingPaneViewController traitCollectionForChildViewController:](self);
      }
      break;
  }

  if (a5 >= 1.0)
  {
    id v37 = [(FMSlidingPaneViewController *)self view];
    [v37 frame];
    double v39 = v38;
    __int16 v40 = [(FMSlidingPaneViewController *)self paneState];
    BOOL v41 = [v40 paneView];
    [v41 bounds];
    double v43 = v39 - v42;
    v44 = [(FMSlidingPaneViewController *)self paneState];
    v45 = [v44 paneView];
    [v45 bounds];
    double v47 = v46;

    v48 = [(FMSlidingPaneViewController *)self paneState];
    v49 = [v48 paneViewController];
    -[FMSlidingPaneViewController didPresentPane:inRect:animated:](self, "didPresentPane:inRect:animated:", v49, 0, 0.0, v43, v47, v30);

    if (v11) {
      v11[2](v11);
    }
  }
}

- (void)dismissPaneViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_initWeak(&location, self);
  BOOL v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v21 = v4;
    _os_log_impl(&dword_218714000, v7, OS_LOG_TYPE_DEFAULT, "dismissPaneViewControllerAnimated:%d completion:", buf, 8u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke;
  v15[3] = &unk_264335220;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  v15[4] = self;
  id v16 = v8;
  BOOL v18 = v4;
  id v9 = (void (**)(void))MEMORY[0x21D470BC0](v15);
  id v10 = [(FMSlidingPaneViewController *)self currentFuture];
  if (v10)
  {
    id v11 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218714000, v11, OS_LOG_TYPE_DEFAULT, "Deferring dismissing until previous action is complete", buf, 2u);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke_82;
    v13[3] = &unk_2643351F8;
    id v14 = v9;
    id v12 = (id)[v10 addCompletionBlock:v13];
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained paneState];

  if (v2)
  {
    double v3 = [WeakRetained paneState];
    BOOL v4 = [v3 paneViewController];

    if (v4)
    {
      double v5 = [*(id *)(a1 + 32) paneState];
      [WeakRetained _dismissPaneState:v5 animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];

      if ([WeakRetained didHideToolbar])
      {
        id v6 = [WeakRetained navigationController];
        [v6 setToolbarHidden:0 animated:*(unsigned __int8 *)(a1 + 56)];

        [WeakRetained setDidHideToolbar:0];
      }
      [WeakRetained setPaneState:0];
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPresentingConstraintConstant:(double)a3
{
  double v5 = [(FMSlidingPaneViewController *)self paneState];
  uint64_t v6 = [v5 edge];

  switch(v6)
  {
    case 1:
      a3 = -a3;
      goto LABEL_3;
    case 2:
      a3 = -a3;
      goto LABEL_5;
    case 4:
LABEL_3:
      uint64_t v7 = [(FMSlidingPaneViewController *)self paneState];
      id v8 = [v7 paneVerticalPositionConstraint];
      goto LABEL_6;
    case 8:
LABEL_5:
      uint64_t v7 = [(FMSlidingPaneViewController *)self paneState];
      id v8 = [v7 paneHorizontalPositionConstraint];
LABEL_6:
      id v9 = v8;
      [v8 setConstant:a3];

      break;
    default:
      uint64_t v7 = LogCategory_Unspecified();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[FMSlidingPaneViewController traitCollectionForChildViewController:](self);
      }
      break;
  }

  id v10 = [(FMSlidingPaneViewController *)self paneState];
  id v11 = [v10 paneView];
  [v11 layoutIfNeeded];
}

- (void)willPresentPane:(id)a3 inRect:(CGRect)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = [(FMSlidingPaneViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v13 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22.origin.double x = x;
      v22.origin.double y = y;
      v22.size.double width = width;
      v22.size.double height = height;
      id v14 = NSStringFromCGRect(v22);
      int v15 = 138412802;
      id v16 = v11;
      __int16 v17 = 2112;
      BOOL v18 = v14;
      __int16 v19 = 1024;
      BOOL v20 = v5;
      _os_log_impl(&dword_218714000, v13, OS_LOG_TYPE_DEFAULT, "Calling willPresentPane: %@ inRect: %@ animated:%d", (uint8_t *)&v15, 0x1Cu);
    }
    objc_msgSend(v12, "slidingPaneViewController:willPresentPane:inRect:animated:", self, v11, v5, x, y, width, height);
  }
}

- (void)didPresentPane:(id)a3 inRect:(CGRect)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = [(FMSlidingPaneViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v13 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22.origin.double x = x;
      v22.origin.double y = y;
      v22.size.double width = width;
      v22.size.double height = height;
      id v14 = NSStringFromCGRect(v22);
      int v15 = 138412802;
      id v16 = v11;
      __int16 v17 = 2112;
      BOOL v18 = v14;
      __int16 v19 = 1024;
      BOOL v20 = v5;
      _os_log_impl(&dword_218714000, v13, OS_LOG_TYPE_DEFAULT, "Calling didPresentPane: %@ inRect: %@ animated:%d", (uint8_t *)&v15, 0x1Cu);
    }
    objc_msgSend(v12, "slidingPaneViewController:didPresentPane:inRect:animated:", self, v11, v5, x, y, width, height);
  }
}

- (void)willDismissPane:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(FMSlidingPaneViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 1024;
      BOOL v12 = v4;
      _os_log_impl(&dword_218714000, v8, OS_LOG_TYPE_DEFAULT, "Calling willDismissPane: %@ animated:%d", (uint8_t *)&v9, 0x12u);
    }

    [v7 slidingPaneViewController:self willDismissPane:v6 animated:v4];
  }
}

- (void)didDismissPane:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(FMSlidingPaneViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 1024;
      BOOL v12 = v4;
      _os_log_impl(&dword_218714000, v8, OS_LOG_TYPE_DEFAULT, "Calling didDismissPane: %@ animated:%d", (uint8_t *)&v9, 0x12u);
    }

    [v7 slidingPaneViewController:self didDismissPane:v6 animated:v4];
  }
}

- (void)paneSizeChanged:(CGRect)a3 forViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = [(FMSlidingPaneViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    __int16 v11 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18.origin.double x = x;
      v18.origin.double y = y;
      v18.size.double width = width;
      v18.size.double height = height;
      BOOL v12 = NSStringFromCGRect(v18);
      int v13 = 138412546;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_218714000, v11, OS_LOG_TYPE_DEFAULT, "Calling paneSizeChanged: %@ forViewController: %@", (uint8_t *)&v13, 0x16u);
    }
    objc_msgSend(v10, "slidingPaneViewController:paneSizeChanged:forViewController:", self, v9, x, y, width, height);
  }
}

- (void)dismiss:(id)a3
{
}

- (void)_paneFrameChanged:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(FMSlidingPaneViewController *)self paneState];
  int v9 = [v8 shouldNotifyOfPaneSizeChanges];

  if (v9)
  {
    id v11 = [(FMSlidingPaneViewController *)self paneState];
    id v10 = [v11 paneViewController];
    -[FMSlidingPaneViewController paneSizeChanged:forViewController:](self, "paneSizeChanged:forViewController:", v10, x, y, width, height);
  }
}

- (CGSize)_normalizeSize:(CGSize)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v3 = ceil(a3.width);
  double v4 = ceil(a3.height);
  if (a3.width != v3 || a3.height != v4)
  {
    CGFloat height = a3.height;
    CGFloat width = a3.width;
    id v8 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15.CGFloat width = width;
      v15.CGFloat height = height;
      int v9 = NSStringFromCGSize(v15);
      int v12 = 138412290;
      int v13 = v9;
      _os_log_impl(&dword_218714000, v8, OS_LOG_TYPE_DEFAULT, "Un-normalized size: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  double v10 = v3;
  double v11 = v4;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (id)_metricsFromEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [NSNumber numberWithDouble:top];
  [v7 setObject:v8 forKeyedSubscript:@"top"];

  int v9 = [NSNumber numberWithDouble:left];
  [v7 setObject:v9 forKeyedSubscript:@"left"];

  double v10 = [NSNumber numberWithDouble:bottom];
  [v7 setObject:v10 forKeyedSubscript:@"bottom"];

  double v11 = [NSNumber numberWithDouble:right];
  [v7 setObject:v11 forKeyedSubscript:@"right"];

  return v7;
}

- (CGSize)_preferredSizeForPaneState:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = [v3 paneViewController];
  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;

  if (v6 == 0.0 && v8 == 0.0)
  {
    int v9 = [v3 paneViewController];
    double v10 = [v9 view];
    LODWORD(v11) = 1112014848;
    LODWORD(v12) = 1112014848;
    objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8), v11, v12);
    double v6 = v13;
    double v8 = v14;

    if (v6 == 0.0 || v8 == 0.0)
    {
      CGSize v15 = LogCategory_Unspecified();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v27.CGFloat width = v6;
        v27.CGFloat height = v8;
        CGRect v18 = NSStringFromCGSize(v27);
        __int16 v19 = [v3 paneViewController];
        BOOL v20 = [v19 view];
        uint64_t v21 = [v20 constraints];
        int v22 = 138412546;
        char v23 = v18;
        __int16 v24 = 2112;
        v25 = v21;
        _os_log_error_impl(&dword_218714000, v15, OS_LOG_TYPE_ERROR, "Bad systemLayoutSize: %@ from constraints: %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }

  double v16 = v6;
  double v17 = v8;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)_createPaneViewForState:(id)a3
{
  id v4 = a3;
  [(FMSlidingPaneViewController *)self _preferredSizeForPaneState:v4];
  double v6 = v5;
  double v8 = v7;
  int v9 = [(FMSlidingPaneViewController *)self _paneParentView];
  switch([v4 edge])
  {
    case 1:
    case 4:
      double v10 = [ISPaneFrameView alloc];
      [v9 bounds];
      double v12 = v8;
      goto LABEL_4;
    case 2:
    case 8:
      double v10 = [ISPaneFrameView alloc];
      [v9 bounds];
      double v11 = v6;
LABEL_4:
      double v13 = -[ISPaneFrameView initWithFrame:](v10, "initWithFrame:", 0.0, 0.0, v11, v12);
      [v4 setPaneView:v13];

      double v14 = [v4 paneView];
      [v14 setOwningViewController:self];
      CGSize v15 = [MEMORY[0x263F1C550] clearColor];
      [v14 setBackgroundColor:v15];

      double v16 = _NSDictionaryOfVariableBindings(&cfstr_Paneview.isa, v14, 0);
      [(FMSlidingPaneViewController *)self paneInsets];
      double v17 = -[FMSlidingPaneViewController _metricsFromEdgeInsets:](self, "_metricsFromEdgeInsets:");
      CGRect v18 = (void *)[v17 mutableCopy];

      __int16 v19 = [NSNumber numberWithDouble:v6];
      [v18 setObject:v19 forKeyedSubscript:@"preferredWidth"];

      BOOL v20 = [NSNumber numberWithDouble:v8];
      [v18 setObject:v20 forKeyedSubscript:@"preferredHeight"];

      uint64_t v21 = [v4 paneView];
      [v9 addSubview:v21];

      int v22 = [v4 paneView];
      [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

      char v23 = [v4 paneViewController];
      __int16 v24 = [v23 view];
      [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

      switch([v4 edge])
      {
        case 1:
          v25 = (void *)MEMORY[0x263F08938];
          double v26 = 1.0;
          CGSize v27 = v14;
          uint64_t v28 = 3;
          double v29 = v9;
          uint64_t v30 = 3;
          goto LABEL_12;
        case 2:
          id v31 = (void *)MEMORY[0x263F08938];
          double v32 = 1.0;
          double v33 = v14;
          uint64_t v34 = 1;
          v35 = v9;
          uint64_t v36 = 1;
          goto LABEL_14;
        case 4:
          v25 = (void *)MEMORY[0x263F08938];
          double v26 = 1.0;
          CGSize v27 = v14;
          uint64_t v28 = 4;
          double v29 = v9;
          uint64_t v30 = 4;
LABEL_12:
          double v38 = [v25 constraintWithItem:v27 attribute:v28 relatedBy:0 toItem:v29 attribute:v30 multiplier:v26 constant:0.0];
          [v4 setPaneVerticalPositionConstraint:v38];

          double v39 = [v4 paneVerticalPositionConstraint];
          [v39 setIdentifier:@"paneVerticalPositionConstant"];

          __int16 v40 = [v4 paneVerticalPositionConstraint];
          [v9 addConstraint:v40];

          BOOL v41 = (void *)MEMORY[0x263F08938];
          double v42 = @"H:|-left-[paneView]-right-|";
          goto LABEL_15;
        case 8:
          id v31 = (void *)MEMORY[0x263F08938];
          double v32 = 1.0;
          double v33 = v14;
          uint64_t v34 = 2;
          v35 = v9;
          uint64_t v36 = 2;
LABEL_14:
          double v43 = [v31 constraintWithItem:v33 attribute:v34 relatedBy:0 toItem:v35 attribute:v36 multiplier:v32 constant:0.0];
          [v4 setPaneHorizontalPositionConstraint:v43];

          v44 = [v4 paneHorizontalPositionConstraint];
          [v44 setIdentifier:@"paneHorizontalPositionConstraint"];

          v45 = [v4 paneHorizontalPositionConstraint];
          [v9 addConstraint:v45];

          BOOL v41 = (void *)MEMORY[0x263F08938];
          double v42 = @"V:|-top-[paneView]-bottom-|";
LABEL_15:
          id v37 = [v41 constraintsWithVisualFormat:v42 options:0 metrics:v18 views:v16];
          [v9 addConstraints:v37];
          break;
        default:
          id v37 = LogCategory_Unspecified();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[FMSlidingPaneViewController _createPaneViewForState:](v4);
          }
          break;
      }

      id v46 = objc_alloc(MEMORY[0x263F1CB98]);
      double v47 = [(FMSlidingPaneViewController *)self paneVisualEffect];
      v48 = (void *)[v46 initWithEffect:v47];
      [v4 setVisualEffectView:v48];

      v49 = [v4 paneView];
      [v49 bounds];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      v58 = [v4 visualEffectView];
      objc_msgSend(v58, "setFrame:", v51, v53, v55, v57);

      v59 = [v4 visualEffectView];
      [v59 setAutoresizingMask:18];

      v60 = [v4 paneView];
      v61 = [v4 visualEffectView];
      [v60 addSubview:v61];

      v62 = [v4 paneView];
      v63 = [v4 visualEffectView];
      [v62 sendSubviewToBack:v63];

      v64 = [v4 paneView];
      [v64 layoutIfNeeded];

      break;
    default:
      double v14 = LogCategory_Unspecified();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[FMSlidingPaneViewController _createPaneViewForState:](v4);
      }
      break;
  }
}

- (void)_createPaneContentConstraintsForState:(id)a3
{
  id v4 = [a3 paneViewController];
  id firstValue = [v4 view];

  double v5 = [(FMSlidingPaneViewController *)self _paneParentView];
  double v6 = _NSDictionaryOfVariableBindings(&cfstr_Contentview.isa, firstValue, 0);
  [(FMSlidingPaneViewController *)self paneContentInsets];
  double v7 = -[FMSlidingPaneViewController _metricsFromEdgeInsets:](self, "_metricsFromEdgeInsets:");
  double v8 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-top-[contentView]-bottom-|" options:0 metrics:v7 views:v6];
  [v5 addConstraints:v8];
  int v9 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-left-[contentView]-right-|" options:0 metrics:v7 views:v6];

  [v5 addConstraints:v9];
  [v5 setNeedsUpdateConstraints];
}

- (void)_removeChildViewControllerForState:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 paneViewController];
  [v4 willMoveToParentViewController:0];

  double v5 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v3 paneViewController];
    int v10 = 138412290;
    double v11 = v6;
    _os_log_impl(&dword_218714000, v5, OS_LOG_TYPE_DEFAULT, "_removeChildViewControllerForState: %@", (uint8_t *)&v10, 0xCu);
  }
  double v7 = [v3 paneViewController];
  double v8 = [v7 view];
  [v8 removeFromSuperview];

  int v9 = [v3 paneViewController];
  [v9 removeFromParentViewController];
}

- (void)_presentPaneState:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v11 = a3;
  uint64_t v12 = (void (**)(void))a6;
  objc_initWeak(&location, self);
  double v13 = self;
  id v14 = [(FMSlidingPaneViewController *)v13 newActionFuture];
  if (!v11)
  {
    v78 = [MEMORY[0x263F08690] currentHandler];
    [v78 handleFailureInMethod:a2, v13, @"FMSlidingPaneViewController.m", 571, @"Invalid parameter not satisfying: %@", @"paneState != nil" object file lineNumber description];
  }
  CGSize v15 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = [v11 paneViewController];
    *(_DWORD *)buf = 138412802;
    v89 = v16;
    __int16 v90 = 1024;
    BOOL v91 = v8;
    __int16 v92 = 1024;
    BOOL v93 = v7;
    _os_log_impl(&dword_218714000, v15, OS_LOG_TYPE_DEFAULT, "_presentPaneState: %@ animated:%d interactive:%d completion:", buf, 0x18u);
  }
  double v17 = [v11 paneView];
  BOOL v18 = v17 == 0;

  if (v18) {
    [(FMSlidingPaneViewController *)v13 _createPaneViewForState:v11];
  }
  [(FMSlidingPaneViewController *)v13 _preferredSizeForPaneState:v11];
  double v20 = v19;
  double v22 = v21;
  char v23 = [v11 paneView];
  [v23 layoutIfNeeded];

  __int16 v24 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [v11 paneViewController];
    *(_DWORD *)buf = 138412290;
    v89 = v25;
    _os_log_impl(&dword_218714000, v24, OS_LOG_TYPE_DEFAULT, "addChildViewController: %@", buf, 0xCu);
  }
  double v26 = [v11 paneViewController];
  [(FMSlidingPaneViewController *)v13 addChildViewController:v26];

  CGSize v27 = [v11 paneView];
  [v27 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  uint64_t v36 = [v11 paneViewController];
  id v37 = [v36 view];
  objc_msgSend(v37, "setFrame:", v29, v31, v33, v35);

  double v38 = [v11 paneView];
  double v39 = [v11 paneViewController];
  __int16 v40 = [v39 view];
  [v38 addSubview:v40];

  [(FMSlidingPaneViewController *)v13 _createPaneContentConstraintsForState:v11];
  BOOL v41 = [v11 paneViewController];
  [v41 didMoveToParentViewController:v13];

  switch([v11 edge])
  {
    case 1:
      double v42 = [v11 paneVerticalPositionConstraint];
      [v42 setConstant:2.0 - v22];
      break;
    case 2:
      double v42 = [v11 paneHorizontalPositionConstraint];
      [v42 setConstant:2.0 - v20];
      break;
    case 4:
      double v42 = [v11 paneVerticalPositionConstraint];
      [v42 setConstant:v22 + 2.0];
      break;
    case 8:
      double v42 = [v11 paneHorizontalPositionConstraint];
      [v42 setConstant:v20 + 2.0];
      break;
    default:
      double v42 = LogCategory_FMSlidingPaneViewController();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[FMSlidingPaneViewController _presentPaneState:animated:interactive:completion:]((uint64_t)buf, [v11 edge], v42);
      }
      break;
  }

  double v43 = [v11 paneView];
  [v43 layoutIfNeeded];

  [(FMSlidingPaneViewController *)v13 _preferredSizeForPaneState:v11];
  v45 = v44;
  id v46 = [(FMSlidingPaneViewController *)v13 view];
  [v46 frame];
  double v48 = v47;
  v49 = [v11 paneView];
  [v49 bounds];
  double v51 = v50;
  double v52 = [v11 paneView];
  [v52 bounds];
  double v54 = v53;

  double v55 = [v11 paneViewController];
  double v56 = v48 - v51;
  -[FMSlidingPaneViewController willPresentPane:inRect:animated:](v13, "willPresentPane:inRect:animated:", v55, v8, 0.0, v56, *(double *)&v54, *(double *)&v45);

  [v11 setShouldNotifyOfPaneSizeChanges:1];
  double v57 = [(FMSlidingPaneViewController *)v13 view];
  [v57 layoutIfNeeded];

  switch([v11 edge])
  {
    case 1:
      [(FMSlidingPaneViewController *)v13 paneInsets];
      double v59 = v58;
      v60 = [v11 paneVerticalPositionConstraint];
      [v60 setConstant:v59];
      break;
    case 2:
      [(FMSlidingPaneViewController *)v13 paneInsets];
      double v62 = v61;
      v60 = [v11 paneHorizontalPositionConstraint];
      [v60 setConstant:v62];
      break;
    case 4:
      [(FMSlidingPaneViewController *)v13 paneInsets];
      double v64 = v63;
      v60 = [v11 paneVerticalPositionConstraint];
      [v60 setConstant:-v64];
      break;
    case 8:
      [(FMSlidingPaneViewController *)v13 paneInsets];
      double v66 = v65;
      v60 = [v11 paneHorizontalPositionConstraint];
      [v60 setConstant:-v66];
      break;
    default:
      v60 = LogCategory_FMSlidingPaneViewController();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        -[FMSlidingPaneViewController _presentPaneState:animated:interactive:completion:]((uint64_t)v87, [v11 edge], v60);
      }
      break;
  }

  if (v8)
  {
    v67 = (void *)MEMORY[0x263F1CB60];
    [(FMSlidingPaneViewController *)v13 animationDuration];
    double v69 = v68;
    [(FMSlidingPaneViewController *)v13 animationSpringDamping];
    double v71 = v70;
    [(FMSlidingPaneViewController *)v13 animationInitialVelocity];
    double v73 = v72;
    uint64_t v74 = [(FMSlidingPaneViewController *)v13 animationOptions];
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke;
    v84[3] = &unk_264335110;
    id v85 = v11;
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke_2;
    v79[3] = &unk_264335248;
    objc_copyWeak(v82, &location);
    v79[4] = v13;
    id v80 = v14;
    v82[1] = 0;
    v82[2] = *(id *)&v56;
    v82[3] = v54;
    v82[4] = v45;
    BOOL v83 = v8;
    v81 = v12;
    [v67 animateWithDuration:v74 | 4 delay:v84 usingSpringWithDamping:v79 initialSpringVelocity:v69 options:0.0 animations:v71 completion:v73];

    objc_destroyWeak(v82);
  }
  else
  {
    v75 = [v11 paneView];
    [v75 layoutIfNeeded];

    [(FMSlidingPaneViewController *)v13 completeFuture:v14];
    if (!v7)
    {
      v76 = [(FMSlidingPaneViewController *)v13 paneState];
      v77 = [v76 paneViewController];
      -[FMSlidingPaneViewController didPresentPane:inRect:animated:](v13, "didPresentPane:inRect:animated:", v77, 0, 0.0, v56, *(double *)&v54, *(double *)&v45);

      if (v12) {
        v12[2](v12);
      }
    }
  }

  objc_destroyWeak(&location);
}

void __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) paneView];
  [v2 layoutIfNeeded];

  id v3 = [*(id *)(a1 + 32) paneView];
  [v3 exerciseAmbiguityInLayout];

  id v5 = [*(id *)(a1 + 32) paneViewController];
  id v4 = [v5 view];
  [v4 exerciseAmbiguityInLayout];
}

void __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(a1 + 32) completeFuture:*(void *)(a1 + 40)];
  id v3 = [WeakRetained paneState];
  id v4 = [v3 paneViewController];
  objc_msgSend(WeakRetained, "didPresentPane:inRect:animated:", v4, *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

  if (*(void *)(a1 + 48))
  {
    id v5 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_218714000, v5, OS_LOG_TYPE_DEFAULT, "Calling present completion block", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_dismissPaneState:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v9 = a3;
  int v10 = (void (**)(void))a5;
  objc_initWeak(&location, self);
  if (!v9)
  {
    BOOL v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"FMSlidingPaneViewController.m", 677, @"Invalid parameter not satisfying: %@", @"paneState != nil" object file lineNumber description];
  }
  id v11 = [(FMSlidingPaneViewController *)self newActionFuture];
  uint64_t v12 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = [v9 paneViewController];
    *(_DWORD *)buf = 138412546;
    double v53 = v13;
    __int16 v54 = 1024;
    BOOL v55 = v6;
    _os_log_impl(&dword_218714000, v12, OS_LOG_TYPE_DEFAULT, "_dismissPaneState: %@ animated: %d completion:", buf, 0x12u);
  }
  [v9 setShouldNotifyOfPaneSizeChanges:0];
  id v14 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CGSize v15 = [v9 paneViewController];
    *(_DWORD *)buf = 138412546;
    double v53 = v15;
    __int16 v54 = 1024;
    BOOL v55 = v6;
    _os_log_impl(&dword_218714000, v14, OS_LOG_TYPE_DEFAULT, "Calling willDismissPane: %@ animated: %d", buf, 0x12u);
  }
  double v16 = [v9 paneViewController];
  [(FMSlidingPaneViewController *)self willDismissPane:v16 animated:v6];

  switch([v9 edge])
  {
    case 1:
      double v17 = [v9 paneView];
      [v17 bounds];
      double v19 = v18;
      double v20 = [v9 paneVerticalPositionConstraint];
      [v20 setConstant:-(v19 + 2.0)];

      break;
    case 2:
      double v17 = [v9 paneView];
      [v17 bounds];
      double v25 = v24;
      double v26 = [v9 paneHorizontalPositionConstraint];
      [v26 setConstant:-(v25 + 2.0)];

      break;
    case 4:
      double v17 = [v9 paneView];
      [v17 bounds];
      double v22 = v21;
      char v23 = [v9 paneVerticalPositionConstraint];
      [v23 setConstant:v22 + 2.0];

      break;
    case 8:
      double v17 = [v9 paneView];
      [v17 bounds];
      double v28 = v27;
      double v29 = [v9 paneHorizontalPositionConstraint];
      [v29 setConstant:v28 + 2.0];

      break;
    default:
      double v17 = LogCategory_FMSlidingPaneViewController();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[FMSlidingPaneViewController _presentPaneState:animated:interactive:completion:]((uint64_t)buf, [v9 edge], v17);
      }
      break;
  }

  if (v6)
  {
    double v30 = (void *)MEMORY[0x263F1CB60];
    [(FMSlidingPaneViewController *)self animationDuration];
    double v32 = v31;
    [(FMSlidingPaneViewController *)self animationSpringDamping];
    double v34 = v33;
    [(FMSlidingPaneViewController *)self animationInitialVelocity];
    double v36 = v35;
    unint64_t v37 = [(FMSlidingPaneViewController *)self animationOptions];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke;
    v49[3] = &unk_264335110;
    id v38 = v9;
    id v50 = v38;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke_2;
    v42[3] = &unk_264335270;
    objc_copyWeak(&v47, &location);
    id v43 = v38;
    v44 = self;
    BOOL v48 = v6;
    id v46 = v10;
    id v45 = v11;
    [v30 animateWithDuration:v37 | 4 delay:v49 usingSpringWithDamping:v42 initialSpringVelocity:v32 options:0.0 animations:v34 completion:v36];

    objc_destroyWeak(&v47);
  }
  else
  {
    double v39 = [v9 paneView];
    [v39 layoutIfNeeded];

    [(FMSlidingPaneViewController *)self _removeChildViewControllerForState:v9];
    __int16 v40 = [v9 paneViewController];
    [(FMSlidingPaneViewController *)self didDismissPane:v40 animated:0];

    if (v10) {
      v10[2](v10);
    }
    [(FMSlidingPaneViewController *)self completeFuture:v11];
  }

  objc_destroyWeak(&location);
}

void __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) paneView];
  [v2 layoutIfNeeded];

  id v3 = [*(id *)(a1 + 32) paneView];
  [v3 exerciseAmbiguityInLayout];

  id v5 = [*(id *)(a1 + 32) paneViewController];
  id v4 = [v5 view];
  [v4 exerciseAmbiguityInLayout];
}

void __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _removeChildViewControllerForState:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) paneViewController];
  [v3 didDismissPane:v4 animated:*(unsigned __int8 *)(a1 + 72)];

  if (*(void *)(a1 + 56))
  {
    id v5 = LogCategory_FMSlidingPaneViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_218714000, v5, OS_LOG_TYPE_DEFAULT, "Calling dismiss completionBlock", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [*(id *)(a1 + 40) completeFuture:*(void *)(a1 + 48)];
}

- (void)_crossDissolveOldPaneState:(id)a3 newPaneState:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  double v13 = (void (**)(void))a6;
  id v14 = self;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    double v61 = [MEMORY[0x263F08690] currentHandler];
    [v61 handleFailureInMethod:a2, v14, @"FMSlidingPaneViewController.m", 747, @"Invalid parameter not satisfying: %@", @"oldPaneState != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  double v62 = [MEMORY[0x263F08690] currentHandler];
  [v62 handleFailureInMethod:a2, v14, @"FMSlidingPaneViewController.m", 748, @"Invalid parameter not satisfying: %@", @"newPaneState != nil" object file lineNumber description];

LABEL_3:
  id v15 = objc_alloc_init(MEMORY[0x263F3BA08]);
  double v16 = [v12 paneView];

  if (!v16) {
    [(FMSlidingPaneViewController *)v14 _createPaneViewForState:v12];
  }
  double v17 = [v11 paneVerticalPositionConstraint];
  [v17 constant];
  double v19 = v18;
  double v20 = [v12 paneVerticalPositionConstraint];
  [v20 setConstant:v19];

  double v21 = [(FMSlidingPaneViewController *)v14 view];
  [v21 updateConstraintsIfNeeded];

  double v22 = [v12 paneView];
  [v22 setHidden:1];

  char v23 = [v12 paneView];
  [v23 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v32 = [v12 paneViewController];
  double v33 = [v32 view];
  objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);

  double v34 = [v12 paneView];
  double v35 = [v12 paneViewController];
  double v36 = [v35 view];
  [v34 addSubview:v36];

  [(FMSlidingPaneViewController *)v14 _createPaneContentConstraintsForState:v12];
  unint64_t v37 = [(FMSlidingPaneViewController *)v14 view];
  [v37 updateConstraintsIfNeeded];

  id v38 = LogCategory_FMSlidingPaneViewController();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    double v39 = [v12 paneViewController];
    *(_DWORD *)buf = 138412290;
    uint64_t v74 = v39;
    _os_log_impl(&dword_218714000, v38, OS_LOG_TYPE_DEFAULT, "addChildViewController: %@", buf, 0xCu);
  }
  __int16 v40 = [v12 paneViewController];
  [(FMSlidingPaneViewController *)v14 addChildViewController:v40];

  BOOL v41 = [v12 paneViewController];
  [v41 didMoveToParentViewController:v14];

  double v42 = [v12 paneView];
  [v42 layoutIfNeeded];

  [(FMSlidingPaneViewController *)v14 _preferredSizeForPaneState:v12];
  double v44 = v43;
  id v45 = [(FMSlidingPaneViewController *)v14 view];
  [v45 frame];
  double v47 = v46 - v44;
  BOOL v48 = [v12 paneView];
  [v48 bounds];
  double v50 = v49;

  [v11 setShouldNotifyOfPaneSizeChanges:0];
  double v51 = [v11 paneViewController];
  if (v7)
  {
    [(FMSlidingPaneViewController *)v14 willDismissPane:v51 animated:1];

    double v52 = [v12 paneViewController];
    -[FMSlidingPaneViewController willPresentPane:inRect:animated:](v14, "willPresentPane:inRect:animated:", v52, 1, 0.0, v47, v50, v44);

    [v12 setShouldNotifyOfPaneSizeChanges:1];
    double v53 = (void *)MEMORY[0x263F1CB60];
    __int16 v54 = [v11 paneView];
    BOOL v55 = [v12 paneView];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __91__FMSlidingPaneViewController__crossDissolveOldPaneState_newPaneState_animated_completion___block_invoke;
    v63[3] = &unk_264335298;
    v63[4] = v14;
    id v64 = v11;
    BOOL v72 = v7;
    id v65 = v12;
    uint64_t v68 = 0;
    double v69 = v47;
    double v70 = v50;
    double v71 = v44;
    id v66 = v15;
    v67 = v13;
    [v53 transitionFromView:v54 toView:v55 duration:5243264 options:v63 completion:0.150000006];
  }
  else
  {
    [(FMSlidingPaneViewController *)v14 willDismissPane:v51 animated:0];

    uint64_t v56 = [v12 paneViewController];
    -[FMSlidingPaneViewController willPresentPane:inRect:animated:](v14, "willPresentPane:inRect:animated:", v56, 0, 0.0, v47, v50, v44);

    double v57 = [v11 paneView];
    [v57 setHidden:1];

    double v58 = [v12 paneView];
    [v58 setHidden:0];

    [(FMSlidingPaneViewController *)v14 _removeChildViewControllerForState:v11];
    double v59 = [v11 paneViewController];
    [(FMSlidingPaneViewController *)v14 didDismissPane:v59 animated:0];

    v60 = [v12 paneViewController];
    -[FMSlidingPaneViewController didPresentPane:inRect:animated:](v14, "didPresentPane:inRect:animated:", v60, 0, 0.0, v47, v50, v44);

    [(FMSlidingPaneViewController *)v14 completeFuture:v15];
    if (v13) {
      v13[2](v13);
    }
  }
}

uint64_t __91__FMSlidingPaneViewController__crossDissolveOldPaneState_newPaneState_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeChildViewControllerForState:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) paneViewController];
  [v2 didDismissPane:v3 animated:*(unsigned __int8 *)(a1 + 104)];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 48) paneViewController];
  objc_msgSend(v4, "didPresentPane:inRect:animated:", v5, *(unsigned __int8 *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

  [*(id *)(a1 + 32) completeFuture:*(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    BOOL v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (BOOL)isPaneShowing
{
  uint64_t v2 = [(FMSlidingPaneViewController *)self paneState];
  id v3 = [v2 paneView];
  id v4 = [v3 superview];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)newActionFuture
{
  id v3 = objc_alloc_init(MEMORY[0x263F3BA08]);
  id v4 = [(FMSlidingPaneViewController *)self actionFutures];
  [v4 addObject:v3];

  return v3;
}

- (FMFuture)currentFuture
{
  uint64_t v2 = [(FMSlidingPaneViewController *)self actionFutures];
  id v3 = [v2 lastObject];

  return (FMFuture *)v3;
}

- (void)completeFuture:(id)a3
{
  id v4 = a3;
  [v4 finishWithNoResult];
  id v5 = [(FMSlidingPaneViewController *)self actionFutures];
  [v5 removeObject:v4];
}

- (FMSlidingPaneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FMSlidingPaneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)paneInsets
{
  double top = self->_paneInsets.top;
  double left = self->_paneInsets.left;
  double bottom = self->_paneInsets.bottom;
  double right = self->_paneInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPaneInsets:(UIEdgeInsets)a3
{
  self->_paneInsets = a3;
}

- (UIEdgeInsets)paneContentInsets
{
  double top = self->_paneContentInsets.top;
  double left = self->_paneContentInsets.left;
  double bottom = self->_paneContentInsets.bottom;
  double right = self->_paneContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPaneContentInsets:(UIEdgeInsets)a3
{
  self->_paneContentInsets = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)animationSpringDamping
{
  return self->_animationSpringDamping;
}

- (void)setAnimationSpringDamping:(double)a3
{
  self->_animationSpringDamping = a3;
}

- (double)animationInitialVelocity
{
  return self->_animationInitialVelocity;
}

- (void)setAnimationInitialVelocity:(double)a3
{
  self->_animationInitialVelocitdouble y = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (SlidingPaneViewState)paneState
{
  return self->_paneState;
}

- (void)setPaneState:(id)a3
{
}

- (BOOL)didHideToolbar
{
  return self->_didHideToolbar;
}

- (void)setDidHideToolbar:(BOOL)a3
{
  self->_didHideToolbar = a3;
}

- (NSMutableArray)actionFutures
{
  return self->_actionFutures;
}

- (void)setActionFutures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionFutures, 0);
  objc_storeStrong((id *)&self->_paneState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paneVisualEffect, 0);
}

- (void)traitCollectionForChildViewController:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 paneState];
  [v1 edge];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218714000, v2, v3, "Unknown edge: %lu", v4, v5, v6, v7, v8);
}

- (void)presentPaneViewController:fromEdge:withPercent:completion:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_218714000, v0, v1, "Dismissing pane while previous pane is still presenting: %@", v2);
}

- (void)_createPaneViewForState:(void *)a1 .cold.1(void *a1)
{
  [a1 edge];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218714000, v1, v2, "Unknown edge: %lu", v3, v4, v5, v6, v7);
}

- (void)_presentPaneState:(NSObject *)a3 animated:interactive:completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1(&dword_218714000, a3, (uint64_t)a3, "Unknown edge: %lu", (uint8_t *)a1);
}

@end