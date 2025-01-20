@interface MSStickerBrowserViewLayoutSpecSmall
- (CGSize)itemSize;
@end

@implementation MSStickerBrowserViewLayoutSpecSmall

- (CGSize)itemSize
{
  int64_t v2 = [(MSStickerBrowserViewLayoutSpec *)self stickerSize];
  double v3 = 85.0;
  if (!v2) {
    double v3 = 60.0;
  }
  if (v2 == 2) {
    double v3 = 136.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end