@interface AVTMinimumContentSizeCollectionViewLayout
- (CGSize)collectionViewContentSize;
- (CGSize)minimumContentSize;
- (void)setMinimumContentSize:(CGSize)a3;
@end

@implementation AVTMinimumContentSizeCollectionViewLayout

- (CGSize)collectionViewContentSize
{
  v24.receiver = self;
  v24.super_class = (Class)AVTMinimumContentSizeCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v24 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;
  [(AVTMinimumContentSizeCollectionViewLayout *)self minimumContentSize];
  double v8 = v7;
  [(AVTMinimumContentSizeCollectionViewLayout *)self minimumContentSize];
  double v10 = v9;
  v11 = [(AVTMinimumContentSizeCollectionViewLayout *)self collectionView];
  uint64_t v12 = [v11 contentInsetAdjustmentBehavior];

  if (v12 != 2)
  {
    v13 = [(AVTMinimumContentSizeCollectionViewLayout *)self collectionView];
    [v13 adjustedContentInset];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    double v8 = v8 - (v17 + v21);
    double v10 = v10 - (v15 + v19);
  }
  if (v4 >= v8) {
    double v22 = v4;
  }
  else {
    double v22 = v8;
  }
  if (v6 >= v10) {
    double v23 = v6;
  }
  else {
    double v23 = v10;
  }
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)minimumContentSize
{
  double width = self->_minimumContentSize.width;
  double height = self->_minimumContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumContentSize:(CGSize)a3
{
  self->_minimumContentSize = a3;
}

@end