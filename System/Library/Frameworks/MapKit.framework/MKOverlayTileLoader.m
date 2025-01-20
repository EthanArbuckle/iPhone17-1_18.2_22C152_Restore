@interface MKOverlayTileLoader
@end

@implementation MKOverlayTileLoader

uint64_t ___MKOverlayTileLoader_block_invoke()
{
  uint64_t v0 = VKRasterTileOverlayTileLoader();
  v1 = (void *)qword_1E9154318;
  qword_1E9154318 = v0;

  v2 = (void *)qword_1E9154318;
  uint64_t v3 = objc_opt_class();

  return [v2 registerTileLoader:v3];
}

@end