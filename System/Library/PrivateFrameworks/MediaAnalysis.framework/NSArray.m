@interface NSArray
@end

@implementation NSArray

uint64_t __60__NSArray_PHAssetResource__vcp_smallMovieDerivativeResource__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 103) {
    uint64_t v3 = objc_msgSend(v2, "vcp_isMovie");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end