@interface MKDynamicTileOverlayRenderer
@end

@implementation MKDynamicTileOverlayRenderer

uint64_t __42___MKDynamicTileOverlayRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setAlpha:*(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2)];
}

@end