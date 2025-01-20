@interface UIViewController
@end

@implementation UIViewController

uint64_t __61__UIViewController_FMFModal__fmf_presentModalViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fmf_afterPresentAnimation:", *(void *)(a1 + 40));
}

void __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = [*(id *)(a1 + 32) view];
  objc_msgSend(v11, "setFrame:", v4, v6 + v10, v8, v10);

  objc_msgSend(*(id *)(a1 + 40), "fmf_dimmingViewForViewController:", *(void *)(a1 + 32));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 setAlpha:0.0];
}

uint64_t __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke_2(uint64_t a1)
{
  v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_2188D1000, v2, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: fmf_dismissModalViewController completed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "fmf_afterDismissAnimation:", *(void *)(a1 + 40));
}

@end