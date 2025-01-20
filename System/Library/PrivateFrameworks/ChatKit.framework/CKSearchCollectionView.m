@interface CKSearchCollectionView
- (BOOL)_ck_isEditing;
- (BOOL)lockContentOffset;
- (BOOL)suppressDatasourceUpdates;
- (UIEdgeInsets)marginInsets;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4;
- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5;
- (unint64_t)mode;
- (void)_ck_setEditing:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDataSource:(id)a3;
- (void)setLockContentOffset:(BOOL)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setMode:(unint64_t)a3;
- (void)setSuppressDatasourceUpdates:(BOOL)a3;
@end

@implementation CKSearchCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKSearchCollectionView;
  v5 = [(CKSearchCollectionView *)&v7 dequeueReusableCellWithReuseIdentifier:a3 forIndexPath:a4];
  if (objc_opt_respondsToSelector())
  {
    [(CKSearchCollectionView *)self marginInsets];
    objc_msgSend(v5, "setMarginInsets:");
  }

  return v5;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CKSearchCollectionView;
  v6 = [(CKSearchCollectionView *)&v12 dequeueReusableSupplementaryViewOfKind:a3 withReuseIdentifier:a4 forIndexPath:a5];
  if (objc_opt_respondsToSelector())
  {
    [(CKSearchCollectionView *)self marginInsets];
    objc_msgSend(v6, "setMarginInsets:");
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    id v7 = v6;
    objc_msgSend((id)objc_opt_class(), "desiredZPositionForMode:", -[CKSearchCollectionView mode](self, "mode"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    id v7 = v6;
    [(id)objc_opt_class() desiredZPosition];
  }
  double v9 = v8;
  v10 = [v7 layer];

  [v10 setZPosition:v9];
LABEL_8:

  return v6;
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  if (![(CKSearchCollectionView *)self suppressDatasourceUpdates])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKSearchCollectionView;
    [(CKSearchCollectionView *)&v5 setDataSource:v4];
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(CKSearchCollectionView *)self lockContentOffset])
  {
    [(CKSearchCollectionView *)self contentOffset];
    if (x != v7 || y != v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)CKSearchCollectionView;
      -[CKSearchCollectionView setContentOffset:](&v9, sel_setContentOffset_, x, y);
    }
  }
}

- (void)_ck_setEditing:(BOOL)a3
{
  if (self->__ck_editing != a3)
  {
    self->__ck_editing = a3;
    if (!a3)
    {
      id v4 = [(CKSearchCollectionView *)self indexPathsForSelectedItems];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __41__CKSearchCollectionView__ck_setEditing___block_invoke;
      v5[3] = &unk_1E5628DE0;
      v5[4] = self;
      [v4 enumerateObjectsUsingBlock:v5];
    }
  }
}

uint64_t __41__CKSearchCollectionView__ck_setEditing___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:a2 animated:0];
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

- (BOOL)suppressDatasourceUpdates
{
  return self->_suppressDatasourceUpdates;
}

- (void)setSuppressDatasourceUpdates:(BOOL)a3
{
  self->_suppressDatasourceUpdates = a3;
}

- (BOOL)lockContentOffset
{
  return self->_lockContentOffset;
}

- (void)setLockContentOffset:(BOOL)a3
{
  self->_lockContentOffset = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

@end