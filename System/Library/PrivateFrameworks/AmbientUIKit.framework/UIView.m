@interface UIView
@end

@implementation UIView

uint64_t __94__UIView_AmbientUI__amui_applyRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = [v2 filters];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  v5 = [v3 arrayByAddingObjectsFromArray:a1[5]];
  [v2 setFilters:v5];

  uint64_t result = a1[6];
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

uint64_t __94__UIView_AmbientUI__amui_clearRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 32) mutableArrayValueForKeyPath:@"filters"];
    [v2 removeObject:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 65))
  {
    v3 = [*(id *)(a1 + 32) mutableArrayValueForKeyPath:@"filters"];
    [v3 removeObject:*(void *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

@end