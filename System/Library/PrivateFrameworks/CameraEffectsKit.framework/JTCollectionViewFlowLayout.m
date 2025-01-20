@interface JTCollectionViewFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
@end

@implementation JTCollectionViewFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UICollectionViewFlowLayout *)self sectionHeadersPinToVisibleBounds]
    || [(UICollectionViewFlowLayout *)self sectionFootersPinToVisibleBounds])
  {
    v13.receiver = self;
    v13.super_class = (Class)JTCollectionViewFlowLayout;
    if (-[UICollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](&v13, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height))
    {
      return 1;
    }
  }
  v9 = [(JTCollectionViewFlowLayout *)self collectionView];
  [v9 bounds];
  BOOL v8 = height != v11 || width != v10;

  return v8;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JTCollectionViewFlowLayout;
  v3 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setInvalidateFlowLayoutDelegateMetrics:1];
  }
  return v3;
}

@end