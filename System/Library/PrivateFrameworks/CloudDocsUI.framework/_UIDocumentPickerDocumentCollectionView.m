@interface _UIDocumentPickerDocumentCollectionView
- (CGPoint)_updatedContentOffsetForOffset:(CGPoint)a3 avoidNegativeContentOffset:(BOOL)a4;
- (double)contentSizeAdjustment;
- (void)_performWhileAvoidingNegativeContentOffset:(id)a3;
- (void)setAdjustedContentSize:(CGSize)a3 withFrameSize:(CGSize)a4;
- (void)setBounds:(CGRect)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentSizeAdjustment:(double)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _UIDocumentPickerDocumentCollectionView

- (void)_performWhileAvoidingNegativeContentOffset:(id)a3
{
  BOOL avoidNegativeContentOffset = self->_avoidNegativeContentOffset;
  self->_BOOL avoidNegativeContentOffset = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL avoidNegativeContentOffset = avoidNegativeContentOffset;
}

- (void)setAdjustedContentSize:(CGSize)a3 withFrameSize:(CGSize)a4
{
  double height = a4.height;
  double v5 = a3.height;
  double width = a3.width;
  [(_UIDocumentPickerDocumentCollectionView *)self contentSizeAdjustment];
  double v9 = height + v8;
  if (v5 >= v9) {
    double v10 = v5;
  }
  else {
    double v10 = v9;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerDocumentCollectionView;
  -[_UIDocumentPickerDocumentCollectionView setContentSize:](&v11, sel_setContentSize_, width, v10);
}

- (void)setFrame:(CGRect)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52___UIDocumentPickerDocumentCollectionView_setFrame___block_invoke;
  v3[3] = &unk_26492D4B0;
  v3[4] = self;
  CGRect v4 = a3;
  [(_UIDocumentPickerDocumentCollectionView *)self _performWhileAvoidingNegativeContentOffset:v3];
}

- (void)setBounds:(CGRect)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53___UIDocumentPickerDocumentCollectionView_setBounds___block_invoke;
  v3[3] = &unk_26492D4B0;
  v3[4] = self;
  CGRect v4 = a3;
  [(_UIDocumentPickerDocumentCollectionView *)self _performWhileAvoidingNegativeContentOffset:v3];
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UIDocumentPickerDocumentCollectionView *)self frame];

  [(_UIDocumentPickerDocumentCollectionView *)self setAdjustedContentSize:width withFrameSize:height];
}

- (CGPoint)_updatedContentOffsetForOffset:(CGPoint)a3 avoidNegativeContentOffset:(BOOL)a4
{
  double y = a3.y;
  CGFloat x = a3.x;
  if (a4)
  {
    [(_UIDocumentPickerDocumentCollectionView *)self contentOffset];
    double v7 = fmin(v6, 0.0);
    if (v7 >= y) {
      double y = v7;
    }
  }
  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.CGFloat x = v8;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  -[_UIDocumentPickerDocumentCollectionView _updatedContentOffsetForOffset:avoidNegativeContentOffset:](self, "_updatedContentOffsetForOffset:avoidNegativeContentOffset:", self->_avoidNegativeContentOffset, a3.x, a3.y);
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerDocumentCollectionView;
  -[_UIDocumentPickerDocumentCollectionView setContentOffset:](&v4, sel_setContentOffset_);
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