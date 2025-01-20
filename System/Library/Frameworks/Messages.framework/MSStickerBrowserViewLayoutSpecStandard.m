@interface MSStickerBrowserViewLayoutSpecStandard
- (CGSize)itemSize;
@end

@implementation MSStickerBrowserViewLayoutSpecStandard

- (CGSize)itemSize
{
  int64_t v2 = [(MSStickerBrowserViewLayoutSpec *)self stickerSize];
  double v3 = dbl_1E4AA82D0[v2 == 0];
  if (v2 == 2) {
    double v3 = 163.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end