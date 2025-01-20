@interface CALayer
@end

@implementation CALayer

void __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.5];
  [*(id *)(a1 + 32) setOpacity:0.0];
  v2 = (void *)MEMORY[0x263F158F8];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke_2;
  v3[3] = &unk_26538E168;
  id v4 = *(id *)(a1 + 32);
  [v2 setCompletionBlock:v3];
  [MEMORY[0x263F158F8] commit];
}

void __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  itk_dispatchMainAfterDelay();
}

uint64_t __55__CALayer_ITKUtilities__itk_autoFadeOutShapePointLayer__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

@end