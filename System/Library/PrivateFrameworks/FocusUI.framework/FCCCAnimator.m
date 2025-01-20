@interface FCCCAnimator
@end

@implementation FCCCAnimator

uint64_t __35___FCCCAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "__runAlongsideAnimations");
  }
  return result;
}

uint64_t __35___FCCCAnimator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

@end