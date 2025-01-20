@interface AXRActionsCollectionView
- (CGSize)intrinsicContentSize;
- (void)setContentSize:(CGSize)a3;
@end

@implementation AXRActionsCollectionView

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXRActionsCollectionView;
  -[AXRActionsCollectionView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  [(AXRActionsCollectionView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  [(AXRActionsCollectionView *)self layoutIfNeeded];
  double v3 = *MEMORY[0x263F1D7C8];
  [(AXRActionsCollectionView *)self contentSize];
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

@end