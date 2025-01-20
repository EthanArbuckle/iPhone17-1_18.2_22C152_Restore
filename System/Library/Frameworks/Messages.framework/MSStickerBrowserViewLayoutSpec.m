@interface MSStickerBrowserViewLayoutSpec
+ (MSStickerBrowserViewLayoutSpec)specWithSizeClass:(int64_t)a3 interfaceOrientation:(int64_t)a4;
- (CGSize)itemSize;
- (MSStickerBrowserViewLayoutSpec)initWithSize:(int64_t)a3 interfaceOrientation:(int64_t)a4;
- (UIEdgeInsets)sectionInset;
- (double)minimumInteritemSpacing;
- (int64_t)interfaceOrientation;
- (int64_t)stickerSize;
@end

@implementation MSStickerBrowserViewLayoutSpec

+ (MSStickerBrowserViewLayoutSpec)specWithSizeClass:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 _referenceBounds];

  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSize:a3 interfaceOrientation:a4];

  return (MSStickerBrowserViewLayoutSpec *)v7;
}

- (MSStickerBrowserViewLayoutSpec)initWithSize:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSStickerBrowserViewLayoutSpec;
  result = [(MSStickerBrowserViewLayoutSpec *)&v7 init];
  if (result)
  {
    result->_stickerSize = a3;
    result->_interfaceOrientation = a4;
  }
  return result;
}

- (double)minimumInteritemSpacing
{
  return 16.0;
}

- (UIEdgeInsets)sectionInset
{
  double v2 = 8.0;
  double v3 = 16.0;
  double v4 = 8.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)stickerSize
{
  return self->_stickerSize;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end