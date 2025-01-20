@interface HKHorizontalFlowLayout
+ (double)snapToBoundariesDecelerationRate;
- (BOOL)snapsToItemBoundaries;
- (BOOL)snapsToItemCenters;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (HKHorizontalFlowLayout)init;
- (double)leadingInset;
- (double)trailingInset;
- (void)setLeadingInset:(double)a3;
- (void)setSnapsToItemBoundaries:(BOOL)a3;
- (void)setSnapsToItemCenters:(BOOL)a3;
- (void)setTrailingInset:(double)a3;
@end

@implementation HKHorizontalFlowLayout

- (HKHorizontalFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKHorizontalFlowLayout;
  v2 = [(UICollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UICollectionViewFlowLayout *)v2 setScrollDirection:1];
    -[UICollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", 0.0, 8.0, 0.0, 8.0);
    [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:8.0];
  }
  return v3;
}

+ (double)snapToBoundariesDecelerationRate
{
  return 0.9;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x = a4.x;
  v31.receiver = self;
  v31.super_class = (Class)HKHorizontalFlowLayout;
  -[HKHorizontalFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v31, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  double v7 = v6;
  double v9 = v8;
  if (*(_WORD *)&self->_snapsToItemBoundaries)
  {
    v10 = [(HKHorizontalFlowLayout *)self collectionView];
    v11 = [v10 dataSource];
    v12 = [v10 delegate];
    if (objc_opt_respondsToSelector())
    {
      [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
      double v14 = v13;
      [v10 frame];
      double v16 = v15 + v15;
      if ([v10 numberOfSections] >= 1)
      {
        uint64_t v17 = 0;
        double v18 = 0.0;
        do
        {
          uint64_t v19 = [v11 collectionView:v10 numberOfItemsInSection:v17];
          if (v19 >= 1)
          {
            uint64_t v20 = v19;
            uint64_t v21 = 0;
            while (1)
            {
              v22 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 inSection:v17];
              [v12 collectionView:v10 layout:self sizeForItemAtIndexPath:v22];
              double v16 = v23;

              double v24 = v18 + v16;
              if (v7 > v18 && v7 < v24) {
                break;
              }
              double v18 = v18 + v14 + v16;
              if (v20 == ++v21) {
                goto LABEL_18;
              }
            }
            if (x > 0.0 || x >= 0.0 && v7 - v18 >= v16 * 0.5) {
              double v7 = v14 + v24;
            }
            else {
              double v7 = v18;
            }
          }
LABEL_18:
          ++v17;
        }
        while (v17 < [v10 numberOfSections]);
      }
      if (self->_snapsToItemCenters)
      {
        [v10 frame];
        double v7 = v7 + (v26 - v16) * -0.5;
        [v10 contentInset];
        if (v7 < -v27)
        {
          [v10 contentInset];
          double v7 = -v28;
        }
      }
    }
  }
  double v29 = v7;
  double v30 = v9;
  result.y = v30;
  result.double x = v29;
  return result;
}

- (double)leadingInset
{
  [(UICollectionViewFlowLayout *)self sectionInset];
  return v2;
}

- (void)setLeadingInset:(double)a3
{
  [(UICollectionViewFlowLayout *)self sectionInset];
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:");
}

- (double)trailingInset
{
  [(UICollectionViewFlowLayout *)self sectionInset];
  return v2;
}

- (void)setTrailingInset:(double)a3
{
  [(UICollectionViewFlowLayout *)self sectionInset];
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:");
}

- (BOOL)snapsToItemBoundaries
{
  return self->_snapsToItemBoundaries;
}

- (void)setSnapsToItemBoundaries:(BOOL)a3
{
  self->_snapsToItemBoundaries = a3;
}

- (BOOL)snapsToItemCenters
{
  return self->_snapsToItemCenters;
}

- (void)setSnapsToItemCenters:(BOOL)a3
{
  self->_snapsToItemCenters = a3;
}

@end