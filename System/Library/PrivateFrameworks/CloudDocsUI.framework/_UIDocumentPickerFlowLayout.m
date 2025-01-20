@interface _UIDocumentPickerFlowLayout
- (BOOL)canBeEdited;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (double)contentSizeAdjustment;
- (int64_t)cellStyle;
- (void)setCellStyle:(int64_t)a3;
- (void)setContentSizeAdjustment:(double)a3;
@end

@implementation _UIDocumentPickerFlowLayout

- (CGSize)collectionViewContentSize
{
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerFlowLayout;
  [(UICollectionViewFlowLayout *)&v14 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(_UIDocumentPickerFlowLayout *)self collectionView];
  [v7 bounds];
  double v9 = v8;
  [(_UIDocumentPickerFlowLayout *)self contentSizeAdjustment];
  double v11 = fmax(v6, v10 + v9);

  double v12 = v4;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)canBeEdited
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(UICollectionViewFlowLayout *)self scrollDirection];
  double v9 = [(_UIDocumentPickerFlowLayout *)self collectionView];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  if (!v8 && v11 != width || v8 == 1 && v13 != height) {
    return 1;
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIDocumentPickerFlowLayout;
  return -[UICollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](&v15, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
}

- (int64_t)cellStyle
{
  return self->cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->cellStyle = a3;
}

- (double)contentSizeAdjustment
{
  return self->_contentSizeAdjustment;
}

- (void)setContentSizeAdjustment:(double)a3
{
  self->_contentSizeAdjustment = a3;
}

@end