@interface CSActivityPickerAnimator
@end

@implementation CSActivityPickerAnimator

void __47___CSActivityPickerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47___CSActivityPickerAnimator_animateTransition___block_invoke_2;
  v9[3] = &unk_1E6AD87F8;
  id v10 = *(id *)(a1 + 32);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v9, v6, v7, v8);
}

uint64_t __47___CSActivityPickerAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "__runAlongsideAnimations");
  }
  return result;
}

uint64_t __47___CSActivityPickerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

@end