@interface SFPopoverPresentationDelegate
@end

@implementation SFPopoverPresentationDelegate

uint64_t __55___SFPopoverPresentationDelegate_updatePopoverPosition__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  v11 = *(void **)(a1 + 32);
  id v12 = a2;
  objc_msgSend(v11, "setSourceRect:", a3, a4, a5, a6);
  [*(id *)(a1 + 32) setSourceView:v12];

  v13 = *(void **)(a1 + 32);

  return [v13 setBarButtonItem:0];
}

uint64_t __55___SFPopoverPresentationDelegate_updatePopoverPosition__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBarButtonItem:a2];
}

id __99___SFPopoverPresentationDelegate_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke(uint64_t a1, id a2, double a3, double a4, double a5, double a6)
{
  v7 = *(double **)(a1 + 32);
  double *v7 = a3;
  v7[1] = a4;
  v7[2] = a5;
  v7[3] = a6;
  id result = a2;
  **(void **)(a1 + 40) = result;
  return result;
}

void __99___SFPopoverPresentationDelegate_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(a1 + 32) presentedViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];
  }
}

@end