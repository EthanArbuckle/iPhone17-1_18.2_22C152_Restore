@interface CFXEffectBrowserContentPresenterViewController
- (CFXEffectBrowserContentPresenterViewControllerDelegate)delegate;
- (CGSize)expandedAppViewControllerSizeForEffectBrowserViewController:(id)a3;
- (double)CFX_alwaysExpandedAppHeight;
- (id)CFX_constraintsForAlwaysExpandedAppView:(id)a3 containerView:(id)a4;
- (void)configureEffectBrowserContentPresentationForOrientation:(int64_t)a3;
- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)loadView;
- (void)setDelegate:(id)a3;
@end

@implementation CFXEffectBrowserContentPresenterViewController

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(CFXEffectBrowserContentPresenterViewController *)self setView:v3];
}

- (void)configureEffectBrowserContentPresentationForOrientation:(int64_t)a3
{
  v5 = [(CFXEffectBrowserContentPresenterViewController *)self parentViewController];
  v6 = [v5 view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16)
  {
    v17 = [(CFXEffectBrowserContentPresenterViewController *)self view];
    objc_msgSend(v17, "setFrame:", v8, v10, v12, v14);
  }
  else
  {
    v36.origin.x = v8;
    v36.origin.y = v10;
    v36.size.width = v12;
    v36.size.height = v14;
    double Width = CGRectGetWidth(v36);
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    double Height = CGRectGetHeight(v37);
    switch(a3)
    {
      case 1:
        double v20 = 0.0;
        break;
      case 3:
        double v20 = 1.57079633;
        break;
      case 4:
        double v20 = -1.57079633;
        break;
      default:
        double v20 = 3.14159265;
        if (a3 != 2) {
          double v20 = 0.0;
        }
        break;
    }
    CGAffineTransformMakeRotation(&v35, -v20);
    v21 = [(CFXEffectBrowserContentPresenterViewController *)self view];
    CGAffineTransform v34 = v35;
    [v21 setTransform:&v34];

    if (Width >= Height) {
      double v22 = Height;
    }
    else {
      double v22 = Width;
    }
    if (Width < Height) {
      double Width = Height;
    }
    v23 = [(CFXEffectBrowserContentPresenterViewController *)self view];
    objc_msgSend(v23, "setBounds:", 0.0, 0.0, v22, Width);

    v24 = [v5 view];
    [v24 frame];
    objc_msgSend(v5, "jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:", a3, 0.0, 0.0, v22, Width, v25, v26, v27, v28);
    double v30 = v29;
    double v32 = v31;
    v33 = [(CFXEffectBrowserContentPresenterViewController *)self view];
    objc_msgSend(v33, "setCenter:", v30, v32);
  }
}

- (CGSize)expandedAppViewControllerSizeForEffectBrowserViewController:(id)a3
{
  [(CFXEffectBrowserContentPresenterViewController *)self CFX_alwaysExpandedAppHeight];
  double v4 = v3;
  double v5 = 375.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)CFX_alwaysExpandedAppHeight
{
  double v3 = +[JFXOrientationMonitor keyWindow];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  double Width = CGRectGetWidth(v23);
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  double Height = CGRectGetHeight(v24);
  if (Width < Height) {
    double Width = Height;
  }
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  double v14 = CGRectGetWidth(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  double v15 = CGRectGetHeight(v26);
  if (v14 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v14;
  }
  v17 = [(CFXEffectBrowserContentPresenterViewController *)self delegate];
  objc_msgSend(v17, "effectBrowserViewController:screenTopBarHeightForWindowBounds:orientation:", self, 4, 0.0, 0.0, Width, v16);
  double v19 = v18;

  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = Width;
  v27.size.height = v16;
  double v20 = CGRectGetHeight(v27);
  double v21 = 112.0;
  if (v19 > 0.0) {
    double v21 = v19 + 36.0;
  }
  return v20 - v21;
}

- (id)CFX_constraintsForAlwaysExpandedAppView:(id)a3 containerView:(id)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 leftAnchor];
  CGFloat v9 = [v6 leftAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9 constant:36.0];

  CGFloat v11 = [v7 bottomAnchor];
  double v12 = [v6 bottomAnchor];

  double v13 = [v11 constraintEqualToAnchor:v12 constant:-36.0];

  double v14 = [v7 widthAnchor];
  double v15 = [v14 constraintEqualToConstant:375.0];

  [(CFXEffectBrowserContentPresenterViewController *)self CFX_alwaysExpandedAppHeight];
  double v17 = v16;
  double v18 = [v7 heightAnchor];

  double v19 = [v18 constraintEqualToConstant:v17];

  v22[0] = v10;
  v22[1] = v13;
  v22[2] = v15;
  v22[3] = v19;
  double v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];

  return v20;
}

- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  [(CFXEffectBrowserContentPresenterViewController *)self addChildViewController:v9];
  CGFloat v11 = [(CFXEffectBrowserContentPresenterViewController *)self view];
  double v12 = [v9 view];
  [v11 addSubview:v12];

  double v13 = [v9 view];
  double v14 = 0.0;
  [v13 setAlpha:0.0];

  double v15 = [v9 view];
  double v16 = [(CFXEffectBrowserContentPresenterViewController *)self view];
  double v17 = [(CFXEffectBrowserContentPresenterViewController *)self CFX_constraintsForAlwaysExpandedAppView:v15 containerView:v16];

  double v18 = [v9 view];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  [MEMORY[0x263F08938] activateConstraints:v17];
  [v9 didMoveToParentViewController:self];
  if (v7) {
    double v14 = 0.4;
  }
  double v19 = (void *)MEMORY[0x263F1CB78];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke;
  v25[3] = &unk_264C09FA8;
  id v26 = v9;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke_2;
  v23[3] = &unk_264C0AA48;
  id v24 = v10;
  id v20 = v10;
  id v21 = v9;
  id v22 = (id)[v19 runningPropertyAnimatorWithDuration:0 delay:v25 options:v23 animations:v14 completion:0.0];
}

void __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v8 = a4;
  id v9 = a6;
  if (v7) {
    double v10 = 0.4;
  }
  else {
    double v10 = 0.0;
  }
  CGFloat v11 = (void *)MEMORY[0x263F1CB78];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke;
  v18[3] = &unk_264C09FA8;
  id v19 = v8;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke_2;
  v15[3] = &unk_264C0AA70;
  id v16 = v19;
  id v17 = v9;
  id v12 = v9;
  id v13 = v19;
  id v14 = (id)[v11 runningPropertyAnimatorWithDuration:0 delay:v18 options:v15 animations:v10 completion:0.0];
}

void __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) jfxRemoveFromParentViewController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (CFXEffectBrowserContentPresenterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXEffectBrowserContentPresenterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end