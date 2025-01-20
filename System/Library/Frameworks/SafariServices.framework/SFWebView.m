@interface SFWebView
@end

@implementation SFWebView

uint64_t __28___SFWebView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1800), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __41___SFWebView_setPlaceholderImage_offset___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1800) setAlpha:0.0];
}

void __41___SFWebView_setPlaceholderImage_offset___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 1800) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 1800);
    *(void *)(v3 + 1800) = 0;
  }
}

void __41___SFWebView_setPlaceholderImage_offset___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPlaceholderImage:0];
}

uint64_t __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1792);

  return [v3 setAlpha:1.0];
}

uint64_t __77___SFWebView_presentDialogView_withAdditionalAnimations_forDialogController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1792) didAppear];
}

uint64_t __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setAlpha:0.0];
}

uint64_t __77___SFWebView_dismissDialogView_withAdditionalAnimations_forDialogController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

@end