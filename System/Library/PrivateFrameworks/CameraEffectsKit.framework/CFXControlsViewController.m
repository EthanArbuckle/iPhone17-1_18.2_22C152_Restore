@interface CFXControlsViewController
- (BOOL)usesInternalCaptureSession;
- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController;
- (CGPoint)effectsPickerCenter;
- (NSLayoutConstraint)controlsContainerViewHeightConstraint;
- (NSLayoutConstraint)controlsContainerViewLeadingConstraint;
- (NSLayoutConstraint)controlsContainerViewTopConstraint;
- (NSLayoutConstraint)controlsContainerViewTrailingConstraint;
- (NSLayoutConstraint)controlsContainerViewWidthConstraint;
- (UIView)controlsContainerView;
- (UIView)effectsBrowser;
- (UIView)effectsPickerDrawer;
- (id)effectsPickerSnapshot;
- (void)setControlsContainerView:(id)a3;
- (void)setControlsContainerViewHeightConstraint:(id)a3;
- (void)setControlsContainerViewLeadingConstraint:(id)a3;
- (void)setControlsContainerViewTopConstraint:(id)a3;
- (void)setControlsContainerViewTrailingConstraint:(id)a3;
- (void)setControlsContainerViewWidthConstraint:(id)a3;
- (void)setEffectBrowserContentPresenterViewController:(id)a3;
- (void)setEffectsBrowser:(id)a3;
- (void)setEffectsPickerDrawer:(id)a3;
- (void)setUsesInternalCaptureSession:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CFXControlsViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CFXControlsViewController;
  [(CFXControlsViewController *)&v8 viewDidLoad];
  v3 = [(CFXControlsViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    v6 = [(CFXControlsViewController *)self effectBrowserContentPresenterViewController];

    if (v6)
    {
      v7 = [(CFXControlsViewController *)self effectBrowserContentPresenterViewController];
      [(UIViewController *)self jfxAddChildViewController:v7];
    }
  }
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v3 = a3;
  v28[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = (UIView *)a3;
  p_effectsPickerDrawer = &self->_effectsPickerDrawer;
  effectsPickerDrawer = self->_effectsPickerDrawer;
  if (effectsPickerDrawer != v5)
  {
    if (effectsPickerDrawer) {
      [(UIView *)effectsPickerDrawer removeFromSuperview];
    }
    if (v5)
    {
      [(CFXControlsViewController *)self loadViewIfNeeded];
      objc_super v8 = [(CFXControlsViewController *)self controlsContainerView];
      [v8 addSubview:v5];

      [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      v20 = (void *)MEMORY[0x263F08938];
      v26 = [(UIView *)v5 leadingAnchor];
      v27 = [(CFXControlsViewController *)self controlsContainerView];
      v25 = [v27 leadingAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v28[0] = v24;
      v22 = [(UIView *)v5 trailingAnchor];
      v23 = [(CFXControlsViewController *)self controlsContainerView];
      v21 = [v23 trailingAnchor];
      v19 = [v22 constraintEqualToAnchor:v21];
      v28[1] = v19;
      v17 = [(UIView *)v5 topAnchor];
      v18 = [(CFXControlsViewController *)self controlsContainerView];
      v9 = [v18 topAnchor];
      v10 = [v17 constraintEqualToAnchor:v9];
      v28[2] = v10;
      v11 = [(UIView *)v5 bottomAnchor];
      v12 = [(CFXControlsViewController *)self controlsContainerView];
      v13 = [v12 bottomAnchor];
      v14 = [v11 constraintEqualToAnchor:v13];
      v28[3] = v14;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
      v16 = id v15 = v3;
      [v20 activateConstraints:v16];

      id v3 = v15;
    }
    objc_storeStrong((id *)p_effectsPickerDrawer, v3);
  }
}

- (id)effectsPickerSnapshot
{
  id v3 = [(CFXControlsViewController *)self effectsBrowser];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CFXControlsViewController *)self view];
  v13 = objc_msgSend(v12, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v5, v7, v9, v11, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));

  return v13;
}

- (CGPoint)effectsPickerCenter
{
  v2 = [(CFXControlsViewController *)self effectsBrowser];
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController
{
  double v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (!v4 && !self->_effectBrowserContentPresenterViewController)
  {
    double v5 = (CFXEffectBrowserContentPresenterViewController *)objc_opt_new();
    effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
    self->_effectBrowserContentPresenterViewController = v5;
  }
  double v7 = self->_effectBrowserContentPresenterViewController;
  return v7;
}

- (UIView)controlsContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlsContainerView);
  return (UIView *)WeakRetained;
}

- (void)setControlsContainerView:(id)a3
{
}

- (UIView)effectsPickerDrawer
{
  return self->_effectsPickerDrawer;
}

- (UIView)effectsBrowser
{
  return self->_effectsBrowser;
}

- (void)setEffectsBrowser:(id)a3
{
}

- (BOOL)usesInternalCaptureSession
{
  return self->_usesInternalCaptureSession;
}

- (void)setUsesInternalCaptureSession:(BOOL)a3
{
  self->_usesInternalCaptureSession = a3;
}

- (NSLayoutConstraint)controlsContainerViewHeightConstraint
{
  return self->_controlsContainerViewHeightConstraint;
}

- (void)setControlsContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)controlsContainerViewWidthConstraint
{
  return self->_controlsContainerViewWidthConstraint;
}

- (void)setControlsContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)controlsContainerViewTrailingConstraint
{
  return self->_controlsContainerViewTrailingConstraint;
}

- (void)setControlsContainerViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)controlsContainerViewLeadingConstraint
{
  return self->_controlsContainerViewLeadingConstraint;
}

- (void)setControlsContainerViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)controlsContainerViewTopConstraint
{
  return self->_controlsContainerViewTopConstraint;
}

- (void)setControlsContainerViewTopConstraint:(id)a3
{
}

- (void)setEffectBrowserContentPresenterViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_controlsContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_effectsBrowser, 0);
  objc_storeStrong((id *)&self->_effectsPickerDrawer, 0);
  objc_destroyWeak((id *)&self->_controlsContainerView);
}

@end