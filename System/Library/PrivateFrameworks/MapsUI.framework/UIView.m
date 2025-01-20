@interface UIView
@end

@implementation UIView

uint64_t __101__UIView_MUXCrossPlatformOperations___mapsui_performImageLoadingTransitionWithAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __88__UIView_MUXCrossPlatformOperations___mapsui_animateWithDuration_animations_completion___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:*(double *)(a1 + 40)];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v2 setAnimationTimingFunction:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v4 = (void *)MEMORY[0x1E4F39CF8];
  return [v4 commit];
}

@end