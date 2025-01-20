@interface FigCaptionRendererCALayerOutput
@end

@implementation FigCaptionRendererCALayerOutput

uint64_t __FigCaptionRendererCALayerOutput_Finalize_block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 32) removeFromSuperlayer];

  v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

@end