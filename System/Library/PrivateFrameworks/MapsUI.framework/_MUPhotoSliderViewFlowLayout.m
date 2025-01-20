@interface _MUPhotoSliderViewFlowLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
@end

@implementation _MUPhotoSliderViewFlowLayout

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v5 = [(_MUPhotoSliderViewFlowLayout *)self collectionView];
  [v5 bounds];
  BOOL v8 = height != v7 || width != v6;

  return v8;
}

@end