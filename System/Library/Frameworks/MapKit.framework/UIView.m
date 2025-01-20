@interface UIView
@end

@implementation UIView

uint64_t __104__UIView_MKCrossPlatformOperations___maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setTranslatesAutoresizingMaskIntoConstraints:0];
}

uint64_t __87__UIView_MKCrossPlatformOperations___mapkit_animateWithDuration_animations_completion___block_invoke(uint64_t a1)
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

uint64_t __103__UIView_MKCrossPlatformOperations___mapkit_animateFromCurrentStateWithDuration_animations_completion___block_invoke(uint64_t a1)
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