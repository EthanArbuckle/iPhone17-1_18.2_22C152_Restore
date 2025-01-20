@interface UIViewController
@end

@implementation UIViewController

uint64_t __121__UIViewController_CFXAdditions__counterRotationViewForSnapshot_atCenterPoint_toWindowOrientation_fromWindowOrientation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  CGAffineTransformMakeRotation(&v5, *(CGFloat *)(a1 + 112));
  v2 = *(void **)(a1 + 40);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setZRotation:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48) * 0.5;
  double v3 = *(double *)(a1 + 56) * 0.5;
  CGAffineTransform v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setCenter:", v2, v3);
}

void __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_3;
    v9[3] = &unk_264C09FA8;
    id v10 = *(id *)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_4;
    v6[3] = &unk_264C0AA70;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    +[JTAnimation performAnimation:v9 duration:v6 completion:0.25];
  }
  else
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

uint64_t __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end