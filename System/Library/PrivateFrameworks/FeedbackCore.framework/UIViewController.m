@interface UIViewController
@end

@implementation UIViewController

void __40__UIViewController_Spinner__hideSpinner__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  v3 = [v2 topViewController];
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    v5 = +[FBKLog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "Hiding toolbar activity indicator", v9, 2u);
    }

    v6 = [*(id *)(a1 + 32) view];
    [v6 setUserInteractionEnabled:1];

    if ([*(id *)(a1 + 32) newFeedbackButtonState]
      || ([*(id *)(a1 + 32) leftToolbarItem],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      [*(id *)(a1 + 32) showToolbarWithStatus:&stru_26DDF6A30 animated:1];
    }
    else
    {
      v8 = [*(id *)(a1 + 32) navigationController];
      [v8 setToolbarHidden:1 animated:1];
    }
  }
}

uint64_t __122__UIViewController_Spinner__showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v1 = (void *)showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__leftSpacing;
  showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__leftSpacing = v0;

  showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__rightSpacing = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];

  return MEMORY[0x270F9A758]();
}

void __122__UIViewController_Spinner__showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  v3 = [v2 topViewController];
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    [v5 setToolbarHidden:0 animated:*(unsigned __int8 *)(a1 + 40)];
  }
}

@end