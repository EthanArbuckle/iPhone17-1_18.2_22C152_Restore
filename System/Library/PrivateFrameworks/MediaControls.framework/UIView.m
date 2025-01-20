@interface UIView
@end

@implementation UIView

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v3 = *(void *)(a1 + 32);

  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966084, v3, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v3 = *(void *)(a1 + 32);

  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966083, v3, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v3 = *(void *)(a1 + 32);

  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966084, v3, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end