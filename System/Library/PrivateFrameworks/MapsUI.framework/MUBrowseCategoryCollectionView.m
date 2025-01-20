@interface MUBrowseCategoryCollectionView
- (void)layoutSubviews;
@end

@implementation MUBrowseCategoryCollectionView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUBrowseCategoryCollectionView;
  [(MUBrowseCategoryCollectionView *)&v3 layoutSubviews];
  [(MUBrowseCategoryCollectionView *)self invalidateIntrinsicContentSize];
}

@end