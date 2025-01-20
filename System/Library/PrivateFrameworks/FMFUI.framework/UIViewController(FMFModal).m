@interface UIViewController(FMFModal)
- (id)fmf_dimmingViewForViewController:()FMFModal;
- (void)fmf_afterDismissAnimation:()FMFModal;
- (void)fmf_afterPresentAnimation:()FMFModal;
- (void)fmf_dismissModalViewController:()FMFModal;
- (void)fmf_presentModalViewController:()FMFModal;
@end

@implementation UIViewController(FMFModal)

- (void)fmf_presentModalViewController:()FMFModal
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  v6 = [a1 view];
  [v6 bounds];
  v7 = objc_msgSend(v5, "initWithFrame:");

  v8 = [MEMORY[0x263F1C550] blackColor];
  [v7 setBackgroundColor:v8];

  [v7 setAutoresizingMask:18];
  [v7 setAlpha:0.0];
  [v7 setTag:1111];
  v9 = [a1 view];
  [v9 addSubview:v7];

  v10 = [a1 view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = [v4 view];
  objc_msgSend(v17, "setFrame:", v12, v16, v14, v16);

  v18 = [a1 view];
  v19 = [v4 view];
  [v18 addSubview:v19];

  [a1 addChildViewController:v4];
  v20 = (void *)MEMORY[0x263F1CB60];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __61__UIViewController_FMFModal__fmf_presentModalViewController___block_invoke;
  v22[3] = &unk_2643439B8;
  v22[4] = a1;
  id v23 = v4;
  id v21 = v4;
  [v20 animateWithDuration:v22 animations:0.3];
}

- (void)fmf_dismissModalViewController:()FMFModal
{
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: fmf_dismissModalViewController", buf, 2u);
  }

  [v4 willMoveToParentViewController:0];
  v6 = (void *)MEMORY[0x263F1CB60];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke;
  v10[3] = &unk_2643439B8;
  id v11 = v4;
  uint64_t v12 = a1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke_2;
  v8[3] = &unk_264343BD0;
  v8[4] = a1;
  id v9 = v11;
  id v7 = v11;
  [v6 animateWithDuration:v10 animations:v8 completion:0.3];
}

- (id)fmf_dimmingViewForViewController:()FMFModal
{
  v3 = [a3 parentViewController];
  id v4 = [v3 view];
  id v5 = [v4 viewWithTag:1111];

  return v5;
}

- (void)fmf_afterPresentAnimation:()FMFModal
{
  id v4 = a3;
  id v5 = [a1 view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v4 view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  objc_msgSend(a1, "fmf_dimmingViewForViewController:", v4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 setAlpha:0.5];
  [v4 didMoveToParentViewController:a1];
}

- (void)fmf_afterDismissAnimation:()FMFModal
{
  id v4 = a3;
  objc_msgSend(a1, "fmf_dimmingViewForViewController:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 removeFromSuperview];
  [v4 removeFromParentViewController];
  id v5 = [v4 view];

  [v5 removeFromSuperview];
}

@end