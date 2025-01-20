@interface CKConversationListCollectionView
- (id)_indexPathForInsertionAtPoint:(CGPoint)a3 sourceIndexPath:(id)a4;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3;
@end

@implementation CKConversationListCollectionView

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(CKConversationListCollectionView *)self scrollIndicatorInsets];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKConversationListCollectionView;
    -[CKConversationListCollectionView setScrollIndicatorInsets:](&v15, sel_setScrollIndicatorInsets_, top, left, bottom, right);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(CKConversationListCollectionView *)self contentInset];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKConversationListCollectionView;
    -[CKConversationListCollectionView setContentInset:](&v15, sel_setContentInset_, top, left, bottom, right);
  }
}

- (id)_indexPathForInsertionAtPoint:(CGPoint)a3 sourceIndexPath:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    double v8 = [(CKConversationListCollectionView *)self collectionViewLayout];
    double v9 = objc_msgSend(v8, "_layoutAttributesForItemNearestPosition:maximumDistance:", x, y, 1000.0);

    double v10 = [v9 indexPath];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKConversationListCollectionView;
    double v10 = -[CKConversationListCollectionView _indexPathForInsertionAtPoint:sourceIndexPath:](&v12, sel__indexPathForInsertionAtPoint_sourceIndexPath_, v7, x, y);
  }

  return v10;
}

@end