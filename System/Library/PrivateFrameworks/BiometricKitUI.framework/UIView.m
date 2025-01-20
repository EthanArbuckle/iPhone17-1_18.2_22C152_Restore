@interface UIView
+ (void)bkui_animateWithDuration:(uint64_t)a3 delay:(uint64_t)a4 options:(void *)a5 animations:(void *)a6 completion:;
+ (void)bkui_animateWithDuration:(void *)a3 animations:;
+ (void)bkui_animateWithDuration:(void *)a3 animations:(void *)a4 completion:;
@end

@implementation UIView

+ (void)bkui_animateWithDuration:(void *)a3 animations:
{
  id v5 = a3;
  uint64_t v4 = self;
  +[UIView bkui_animateWithDuration:animations:completion:](a1, v4, v5, 0);
}

+ (void)bkui_animateWithDuration:(void *)a3 animations:(void *)a4 completion:
{
  id v6 = a3;
  id v7 = a4;
  self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_animations_completion___block_invoke;
  aBlock[3] = &unk_1E6EA2B70;
  double v15 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v10 = (void (**)(void))_Block_copy(aBlock);
  if (MGGetProductType() == 1060988941
    || MGGetProductType() == 3585085679
    || MGGetProductType() == 689804742
    || MGGetProductType() == 2309863438)
  {
    v11 = (void *)MEMORY[0x1E4F42FF0];
    CAFrameRateRange v16 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v11, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2293761, v10, *(double *)&v16.minimum, *(double *)&v16.maximum, *(double *)&v16.preferred);
  }
  else
  {
    v10[2](v10);
  }
}

uint64_t __74__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_animations_completion___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42FF0] animateWithDuration:*(void *)(a1 + 32) animations:*(void *)(a1 + 40) completion:*(double *)(a1 + 48)];
}

+ (void)bkui_animateWithDuration:(uint64_t)a3 delay:(uint64_t)a4 options:(void *)a5 animations:(void *)a6 completion:
{
  id v10 = a5;
  id v11 = a6;
  self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_delay_options_animations_completion___block_invoke;
  aBlock[3] = &unk_1E6EA2B98;
  double v19 = a1;
  double v20 = a2;
  uint64_t v21 = a4;
  id v12 = v10;
  id v17 = v12;
  id v13 = v11;
  id v18 = v13;
  id v14 = (void (**)(void))_Block_copy(aBlock);
  if (MGGetProductType() == 1060988941
    || MGGetProductType() == 3585085679
    || MGGetProductType() == 689804742
    || MGGetProductType() == 2309863438)
  {
    double v15 = (void *)MEMORY[0x1E4F42FF0];
    CAFrameRateRange v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v15, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2293761, v14, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);
  }
  else
  {
    v14[2](v14);
  }
}

uint64_t __88__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_delay_options_animations_completion___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42FF0] animateWithDuration:*(void *)(a1 + 64) delay:*(void *)(a1 + 32) options:*(void *)(a1 + 40) animations:*(double *)(a1 + 48) completion:*(double *)(a1 + 56)];
}

@end