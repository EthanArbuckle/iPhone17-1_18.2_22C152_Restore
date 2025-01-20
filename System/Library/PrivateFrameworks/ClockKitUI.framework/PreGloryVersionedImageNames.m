@interface PreGloryVersionedImageNames
@end

@implementation PreGloryVersionedImageNames

uint64_t ___PreGloryVersionedImageNames_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2A6AA58];
  uint64_t v1 = _PreGloryVersionedImageNames___preGloryVersionedImages;
  _PreGloryVersionedImageNames___preGloryVersionedImages = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end