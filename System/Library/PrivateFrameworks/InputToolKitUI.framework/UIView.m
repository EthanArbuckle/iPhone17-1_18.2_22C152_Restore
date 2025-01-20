@interface UIView
@end

@implementation UIView

uint64_t __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setItk_alpha:", v1);
}

uint64_t __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned __int8 *)(a1 + 40)];
}

void __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.5];
  [*(id *)(a1 + 32) setOpacity:0.0];
  v2 = (void *)MEMORY[0x263F158F8];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_2;
  v3[3] = &unk_26538E168;
  id v4 = *(id *)(a1 + 32);
  [v2 setCompletionBlock:v3];
  [MEMORY[0x263F158F8] commit];
}

void __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  itk_dispatchMainAfterDelay();
}

uint64_t __66__UIView_ITKUtilities__itk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

uint64_t __71__UIView_ITKUtilities__itk_renderImageFromViewBackingStoreWithSubrect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  ITKMultiplyPointScalar();
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

@end