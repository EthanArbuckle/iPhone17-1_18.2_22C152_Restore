@interface HKPopulationNormsClassificationCollectionView
- (CGSize)intrinsicContentSize;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKPopulationNormsClassificationCollectionView

- (CGSize)intrinsicContentSize
{
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v4 = [(HKPopulationNormsClassificationCollectionView *)self dataSource];
  v5 = [v4 collectionView:self cellForItemAtIndexPath:v3];

  if (v5)
  {
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", 1.79769313e308, 28.0);
    double v7 = v6;
  }
  else
  {
    double v7 = 28.0;
  }
  double v8 = *MEMORY[0x1E4FB30D8];

  double v9 = v8;
  double v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKPopulationNormsClassificationCollectionView;
  [(HKPopulationNormsClassificationCollectionView *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(HKPopulationNormsClassificationCollectionView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      double v9 = [(HKPopulationNormsClassificationCollectionView *)self collectionViewLayout];
      [v9 invalidateLayout];

      [(HKPopulationNormsClassificationCollectionView *)self invalidateIntrinsicContentSize];
    }
  }
}

@end