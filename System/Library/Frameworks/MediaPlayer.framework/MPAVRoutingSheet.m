@interface MPAVRoutingSheet
- (BOOL)mirroringOnly;
- (CGRect)_cancelButtonFrame;
- (CGRect)_controlsViewFrame;
- (CGRect)_routingViewFrame;
- (CGSize)_maxRoutingViewSize;
- (MPAVRoutingSheet)initWithAVItemType:(int64_t)a3;
- (MPAVRoutingSheet)initWithFrame:(CGRect)a3;
- (int64_t)avItemType;
- (void)_animateControls:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_updateDismissButtonText;
- (void)_updateRoutingSheetFrame;
- (void)dealloc;
- (void)dismiss;
- (void)layoutSubviews;
- (void)routingViewControllerDidUpdateContents:(id)a3;
- (void)setAVItemType:(int64_t)a3;
- (void)setMirroringOnly:(BOOL)a3;
- (void)showInView:(id)a3 withCompletionHandler:(id)a4;
- (void)tintColorDidChange;
@end

@implementation MPAVRoutingSheet

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_dismissControlsViewButton, 0);
  objc_storeStrong((id *)&self->_dismissBackgroundButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_presentationWindow, 0);
}

- (BOOL)mirroringOnly
{
  return self->_mirroringOnly;
}

- (CGSize)_maxRoutingViewSize
{
  [(MPAVRoutingSheet *)self bounds];
  double v2 = rint(v6.size.width + -16.0);
  double v3 = rint(CGRectGetHeight(v6) * 0.666666667);
  double v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGRect)_controlsViewFrame
{
  [(MPAVRoutingSheet *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MPAVRoutingSheet *)self _maxRoutingViewSize];
  double v12 = v11 + 8.0;
  [(MPAVRoutingSheet *)self _cancelButtonFrame];
  double v14 = v12 + v13;
  [(MPAVRoutingSheet *)self safeAreaInsets];
  double v16 = v6 + v10 - v14 + -8.0 - v15;
  double v17 = v4;
  double v18 = v8;
  double v19 = v14;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (CGRect)_cancelButtonFrame
{
  [(MPAVRoutingSheet *)self _maxRoutingViewSize];
  double v4 = v3 + 8.0;
  [(MPAVRoutingSheet *)self _maxRoutingViewSize];
  double v6 = v5;
  [(MPAVRoutingViewController *)self->_routingViewController _normalCellHeight];
  double v8 = v7;
  double v9 = 8.0;
  double v10 = v4;
  double v11 = v6;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_routingViewFrame
{
  [(MPAVRoutingSheet *)self _maxRoutingViewSize];
  double v4 = v3;
  double v6 = v5;
  [(MPAVRoutingViewController *)self->_routingViewController preferredContentSize];
  if (v7 < v6) {
    double v6 = v7;
  }
  [(MPAVRoutingSheet *)self _cancelButtonFrame];
  double v8 = CGRectGetMinY(v12) + -8.0 - v6;
  double v9 = 8.0;
  double v10 = v4;
  double v11 = v6;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (void)_updateDismissButtonText
{
  double v3 = [(MPAVRoutingViewController *)self->_routingViewController _routingController];
  int v4 = [v3 wirelessDisplayRouteIsPicked];

  double v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  double v6 = v5;
  if (v4) {
    double v7 = @"DONE";
  }
  else {
    double v7 = @"CANCEL";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_1EE680640 table:@"MediaPlayer"];

  [(UIButton *)self->_cancelButton setTitle:v8 forState:0];
}

- (void)_updateRoutingSheetFrame
{
  [(UIWindow *)self->_presentationWindow bounds];

  -[MPAVRoutingSheet setFrame:](self, "setFrame:");
}

- (void)_animateControls:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(MPAVRoutingSheet *)self layoutIfNeeded];
  [(MPAVRoutingSheet *)self _controlsViewFrame];
  double v10 = v7;
  double v11 = v8;
  uint64_t v13 = v12;
  double v14 = v9;
  double v15 = v8 + v9 + 8.0;
  if (v4) {
    double v16 = 0.0;
  }
  else {
    double v16 = 0.5;
  }
  if (v4) {
    double v8 = v8 + v9 + 8.0;
  }
  -[UIView setFrame:](self->_controlsView, "setFrame:", v7, v8);
  [(UIView *)self->_backgroundView setAlpha:v16];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__MPAVRoutingSheet__animateControls_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E57F79F8;
  v17[4] = self;
  BOOL v18 = v4;
  *(double *)&v17[5] = v10;
  *(double *)&v17[6] = v11;
  v17[7] = v13;
  *(double *)&v17[8] = v14;
  *(double *)&v17[9] = v10;
  *(double *)&v17[10] = v15;
  v17[11] = v13;
  *(double *)&v17[12] = v14;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v17 completion:v6];
}

uint64_t __59__MPAVRoutingSheet__animateControls_withCompletionHandler___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 440);
  double v3 = (double *)(a1 + 72);
  BOOL v4 = (double *)(a1 + 80);
  double v5 = (double *)(a1 + 88);
  if (*(unsigned char *)(a1 + 104)) {
    id v6 = (double *)(a1 + 64);
  }
  else {
    id v6 = (double *)(a1 + 96);
  }
  if (*(unsigned char *)(a1 + 104))
  {
    double v5 = (double *)(a1 + 56);
    BOOL v4 = (double *)(a1 + 48);
    double v3 = (double *)(a1 + 40);
  }
  objc_msgSend(v2, "setFrame:", *v3, *v4, *v5, *v6);
  double v7 = *(void **)(*(void *)(a1 + 32) + 416);
  double v8 = 0.5;
  if (!*(unsigned char *)(a1 + 104)) {
    double v8 = 0.0;
  }

  return [v7 setAlpha:v8];
}

- (void)routingViewControllerDidUpdateContents:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__MPAVRoutingSheet_routingViewControllerDidUpdateContents___block_invoke;
  v3[3] = &unk_1E57F9EA8;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v3 completion:0];
}

uint64_t __59__MPAVRoutingSheet_routingViewControllerDidUpdateContents___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _routingViewFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [*(id *)(*(void *)(a1 + 32) + 456) view];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  double v11 = *(void **)(a1 + 32);

  return [v11 _updateDismissButtonText];
}

- (void)dismiss
{
  double v3 = [(MPAVRoutingSheet *)self superview];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __27__MPAVRoutingSheet_dismiss__block_invoke;
    v4[3] = &unk_1E57F9B98;
    v4[4] = self;
    [(MPAVRoutingSheet *)self _animateControls:0 withCompletionHandler:v4];
  }
}

uint64_t __27__MPAVRoutingSheet_dismiss__block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    [*(id *)(*(void *)(v2 + 32) + 408) setHidden:1];
    uint64_t v3 = *(void *)(v2 + 32);
    double v4 = *(void **)(v3 + 408);
    *(void *)(v3 + 408) = 0;

    CGRect result = *(void *)(*(void *)(v2 + 32) + 464);
    if (result)
    {
      double v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

- (void)showInView:(id)a3 withCompletionHandler:(id)a4
{
  double v5 = objc_msgSend(a4, "copy", a3);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v5;

  double v7 = [_MPAVRoutingSheetSecureWindow alloc];
  double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 bounds];
  double v9 = -[_MPAVRoutingSheetSecureWindow initWithFrame:](v7, "initWithFrame:");
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = v9;

  [(UIWindow *)self->_presentationWindow setWindowLevel:*MEMORY[0x1E4FB3108]];
  double v11 = self->_presentationWindow;
  uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIWindow *)v11 setBackgroundColor:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  [v13 setView:self];
  [(MPAVRoutingSheet *)self _updateRoutingSheetFrame];
  [(UIWindow *)self->_presentationWindow setRootViewController:v13];
  [(UIWindow *)self->_presentationWindow makeKeyAndVisible];
  [(MPAVRoutingSheet *)self _animateControls:1 withCompletionHandler:0];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingSheet;
  [(MPAVRoutingSheet *)&v4 tintColorDidChange];
  uint64_t v3 = [(MPAVRoutingSheet *)self tintColor];
  [(UIButton *)self->_cancelButton setTitleColor:v3 forState:0];
  [(MPAVRoutingViewController *)self->_routingViewController _setTableCellsContentColor:v3];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingSheet;
  [(MPAVRoutingSheet *)&v4 layoutSubviews];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__MPAVRoutingSheet_layoutSubviews__block_invoke;
  v3[3] = &unk_1E57F9EA8;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __34__MPAVRoutingSheet_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrame:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setFrame:", v3, v5, v7, v9);
  double v10 = [*(id *)(*(void *)(a1 + 32) + 456) view];
  [v10 setAutoresizingMask:0];

  double v11 = [*(id *)(*(void *)(a1 + 32) + 456) view];
  [*(id *)(a1 + 32) _routingViewFrame];
  objc_msgSend(v11, "setFrame:");

  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = (void *)v12[56];
  [v12 _cancelButtonFrame];
  objc_msgSend(v13, "setFrame:");
  [*(id *)(a1 + 32) _controlsViewFrame];
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "setFrame:");
  BOOL v18 = *(void **)(*(void *)(a1 + 32) + 432);

  return objc_msgSend(v18, "setFrame:", 0.0, 0.0, v15, v17);
}

- (void)setMirroringOnly:(BOOL)a3
{
  self->_mirroringOnly = a3;
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(MPAVRoutingViewController *)self->_routingViewController setMirroringStyle:v3];
}

- (void)setAVItemType:(int64_t)a3
{
}

- (int64_t)avItemType
{
  return [(MPAVRoutingViewController *)self->_routingViewController avItemType];
}

- (void)dealloc
{
  [(MPAVRoutingSheet *)self dismiss];
  [(MPAVRoutingViewController *)self->_routingViewController viewDidDisappear:0];
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingSheet;
  [(MPAVRoutingSheet *)&v3 dealloc];
}

- (MPAVRoutingSheet)initWithFrame:(CGRect)a3
{
  return -[MPAVRoutingSheet initWithAVItemType:](self, "initWithAVItemType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MPAVRoutingSheet)initWithAVItemType:(int64_t)a3
{
  v49.receiver = self;
  v49.super_class = (Class)MPAVRoutingSheet;
  double v4 = -[MPAVRoutingSheet initWithFrame:](&v49, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    controlsView = v4->_controlsView;
    v4->_controlsView = v5;

    double v7 = v4->_controlsView;
    double v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v7 setBackgroundColor:v8];

    double v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v9;

    double v11 = v4->_backgroundView;
    uint64_t v12 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v11 setBackgroundColor:v12];

    [(UIView *)v4->_backgroundView setAlpha:0.0];
    [(MPAVRoutingSheet *)v4 addSubview:v4->_backgroundView];
    uint64_t v13 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    dismissBackgroundButton = v4->_dismissBackgroundButton;
    v4->_dismissBackgroundButton = (UIButton *)v13;

    double v15 = v4->_dismissBackgroundButton;
    double v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIButton *)v15 setBackgroundColor:v16];

    [(UIButton *)v4->_dismissBackgroundButton addTarget:v4 action:sel__cancelButtonAction_ forControlEvents:64];
    [(MPAVRoutingSheet *)v4 addSubview:v4->_dismissBackgroundButton];
    uint64_t v17 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    dismissControlsViewButton = v4->_dismissControlsViewButton;
    v4->_dismissControlsViewButton = (UIButton *)v17;

    double v19 = v4->_dismissControlsViewButton;
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIButton *)v19 setBackgroundColor:v20];

    [(UIButton *)v4->_dismissControlsViewButton addTarget:v4 action:sel__cancelButtonAction_ forControlEvents:64];
    [(UIView *)v4->_controlsView addSubview:v4->_dismissControlsViewButton];
    v21 = objc_alloc_init(MPAVOutputDeviceRoutingDataSource);
    v22 = [MPAVRoutingController alloc];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [(MPAVRoutingController *)v22 initWithDataSource:v21 name:v24];

    v26 = [[MPAVRoutingViewController alloc] initWithStyle:0 routingController:v25];
    routingViewController = v4->_routingViewController;
    v4->_routingViewController = v26;

    [(MPAVRoutingViewController *)v4->_routingViewController viewDidAppear:0];
    [(MPAVRoutingViewController *)v4->_routingViewController setDelegate:v4];
    v28 = [(MPAVRoutingViewController *)v4->_routingViewController view];
    v29 = [v28 layer];
    [v29 setCornerRadius:10.0];

    v30 = [(MPAVRoutingViewController *)v4->_routingViewController view];
    v31 = [v30 layer];
    [v31 setMasksToBounds:1];

    v32 = [(MPAVRoutingViewController *)v4->_routingViewController _tableView];
    [v32 _setSeparatorBackdropOverlayBlendMode:1];

    v33 = v4->_controlsView;
    v34 = [(MPAVRoutingViewController *)v4->_routingViewController view];
    [(UIView *)v33 addSubview:v34];

    v35 = [MEMORY[0x1E4FB1618] systemBlueColor];
    if (dyld_program_sdk_at_least())
    {
      uint64_t v36 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      cancelButton = v4->_cancelButton;
      v4->_cancelButton = (UIButton *)v36;
    }
    else
    {
      uint64_t v38 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
      v39 = v4->_cancelButton;
      v4->_cancelButton = (UIButton *)v38;

      v40 = v4->_cancelButton;
      cancelButton = [v35 colorWithAlphaComponent:0.2];
      [(UIButton *)v40 setTitleColor:cancelButton forState:1];
    }

    v41 = v4->_cancelButton;
    v42 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)v41 setBackgroundColor:v42];

    [(UIButton *)v4->_cancelButton setTitleColor:v35 forState:0];
    [(UIButton *)v4->_cancelButton addTarget:v4 action:sel__cancelButtonAction_ forControlEvents:64];
    [(UIView *)v4->_controlsView _setVisualAltitude:*MEMORY[0x1E4FB3320] * 1.5];
    v43 = [(UIButton *)v4->_cancelButton titleLabel];
    v44 = [MEMORY[0x1E4FB1798] boldSystemFontOfSize:19.0];
    [v43 setFont:v44];

    v45 = [(UIButton *)v4->_cancelButton layer];
    [v45 setCornerRadius:10.0];

    v46 = [(UIButton *)v4->_cancelButton layer];
    [v46 setMasksToBounds:1];

    [(UIView *)v4->_controlsView addSubview:v4->_cancelButton];
    [(MPAVRoutingSheet *)v4 addSubview:v4->_controlsView];
    v47 = [MEMORY[0x1E4FB1618] clearColor];
    [(MPAVRoutingSheet *)v4 setBackgroundColor:v47];

    [(MPAVRoutingSheet *)v4 setAVItemType:a3];
    [(MPAVRoutingSheet *)v4 _updateDismissButtonText];
  }
  return v4;
}

@end