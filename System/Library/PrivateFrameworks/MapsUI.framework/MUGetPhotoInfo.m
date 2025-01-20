@interface MUGetPhotoInfo
@end

@implementation MUGetPhotoInfo

uint64_t ___MUGetPhotoInfo_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F646D0] defaultPhotoOptionsWithAllowSmaller:1];
  uint64_t v1 = _MergedGlobals_1;
  _MergedGlobals_1 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end