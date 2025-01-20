@interface MTCurrentProduct
@end

@implementation MTCurrentProduct

void ___MTCurrentProduct_block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  if (v0) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  v2 = (void *)_MTCurrentProduct___currentProduct;
  _MTCurrentProduct___currentProduct = v1;
}

@end