@interface AVTCenteringCollectionViewDelegate
- (AVTCenteringCollectionViewDelegate)initWithCollectionView:(id)a3 delegate:(id)a4 environment:(id)a5;
- (AVTUILogger)logger;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGPoint)previousOffset;
- (NSIndexPath)lastHapticOnScrollIndexPath;
- (UICollectionView)collectionView;
- (UICollectionViewDelegate)delegate;
- (UICollectionViewLayoutAttributes)centerItemAttributes;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setLastHapticOnScrollIndexPath:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPreviousOffset:(CGPoint)a3;
@end

@implementation AVTCenteringCollectionViewDelegate

- (AVTCenteringCollectionViewDelegate)initWithCollectionView:(id)a3 delegate:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTCenteringCollectionViewDelegate;
  v12 = [(AVTCenteringCollectionViewDelegate *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collectionView, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    uint64_t v14 = [v11 logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    uint64_t v16 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    lastHapticOnScrollIndexPath = v13->_lastHapticOnScrollIndexPath;
    v13->_lastHapticOnScrollIndexPath = (NSIndexPath *)v16;
  }
  return v13;
}

- (UICollectionViewLayoutAttributes)centerItemAttributes
{
  v3 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  v4 = [(AVTCenteringCollectionViewDelegate *)self lastHapticOnScrollIndexPath];
  v5 = [v3 layoutAttributesForItemAtIndexPath:v4];

  return (UICollectionViewLayoutAttributes *)v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTCenteringCollectionViewDelegate;
  if (-[AVTCenteringCollectionViewDelegate respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTCenteringCollectionViewDelegate;
  v5 = -[AVTCenteringCollectionViewDelegate methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    v6 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    v5 = [v6 methodSignatureForSelector:a3];
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v5 = [(AVTCenteringCollectionViewDelegate *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(AVTCenteringCollectionViewDelegate *)self delegate];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVTCenteringCollectionViewDelegate;
    objc_super v7 = [(AVTCenteringCollectionViewDelegate *)&v9 forwardingTargetForSelector:a3];
  }
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  objc_super v7 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  objc_super v8 = [v7 collectionViewLayout];
  uint64_t v9 = [v6 row];
  id v10 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  v15 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v15 bounds];
  objc_msgSend(v8, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v9, v12, v14, v16, v17);
  double v19 = v18;
  double v21 = v20;

  if (v19 == *MEMORY[0x263F00148] && v21 == *(double *)(MEMORY[0x263F00148] + 8))
  {
    v23 = [(AVTCenteringCollectionViewDelegate *)self logger];
    objc_msgSend(v23, "logCarouselErrorGettingFrameForElementAtIndex:", objc_msgSend(v6, "item"));
  }
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v27, v19, v21);
  objc_msgSend(v27, "setContentOffset:animated:", 1);
  v24 = [(AVTCenteringCollectionViewDelegate *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    v26 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    [v26 collectionView:v27 didSelectItemAtIndexPath:v6];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v15 = a3;
  char v4 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  id v10 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v9, v6, v8);
  [(AVTCenteringCollectionViewDelegate *)self setLastHapticOnScrollIndexPath:v10];

  double v11 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v11 contentOffset];
  -[AVTCenteringCollectionViewDelegate setPreviousOffset:](self, "setPreviousOffset:");

  double v12 = [(AVTCenteringCollectionViewDelegate *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    double v14 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    [v14 scrollViewWillBeginDragging:v15];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v34 = a3;
  char v4 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  id v10 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v9, v6, v8);

  double v11 = [(AVTCenteringCollectionViewDelegate *)self lastHapticOnScrollIndexPath];
  int v12 = [v11 isEqual:v10];

  char v13 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  double v14 = v13;
  if (v12)
  {
    [v13 contentOffset];
    -[AVTCenteringCollectionViewDelegate setPreviousOffset:](self, "setPreviousOffset:");

    id v15 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
    double v17 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    [v17 scrollViewDidScroll:v34];
  }
  else
  {
    double v18 = [v13 collectionViewLayout];
    double v17 = [v18 layoutAttributesForItemAtIndexPath:v10];

    double v19 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
    [v19 bounds];
    double MidX = CGRectGetMidX(v36);

    [v17 center];
    double v22 = v21;
    v23 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
    [v23 contentOffset];
    double v25 = v24;
    [(AVTCenteringCollectionViewDelegate *)self previousOffset];
    double v27 = v26;

    if (v25 <= v27) {
      BOOL v28 = MidX > v22 + 10.0;
    }
    else {
      BOOL v28 = MidX < v22 + -10.0;
    }
    v29 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
    [v29 contentOffset];
    -[AVTCenteringCollectionViewDelegate setPreviousOffset:](self, "setPreviousOffset:");

    if (objc_msgSend(v34, "avtui_isMoving") && !v28)
    {
      v30 = [v17 indexPath];
      [(AVTCenteringCollectionViewDelegate *)self setLastHapticOnScrollIndexPath:v30];
    }
    v31 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      v33 = [(AVTCenteringCollectionViewDelegate *)self delegate];
      [v33 scrollViewDidScroll:v34];
    }
  }

LABEL_13:
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v80 = a3;
  uint64_t v9 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  id v10 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v9, a5->x, a5->y);

  double v11 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  int v12 = [v11 collectionViewLayout];
  uint64_t v13 = [v10 item];
  double v14 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v19 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v19 bounds];
  objc_msgSend(v12, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v13, v16, v18, v20, v21);
  double v23 = v22;
  double v25 = v24;

  double v26 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v26, v23, v25);
  double v28 = v27;
  CGFloat v30 = v29;

  double v31 = fabs(x);
  char v32 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
  [v32 contentOffset];
  unint64_t v34 = COERCE_UNSIGNED_INT64(v28 - v33) >> 63;

  BOOL v36 = v31 > 0.3 && *(void *)&x >> 63 != v34;
  [v80 contentOffset];
  double v38 = v37;
  [v80 contentInset];
  if (v38 > -v39)
  {
    [v80 contentOffset];
    double v41 = v40;
    [v80 contentSize];
    double v43 = v42;
    [v80 bounds];
    double v45 = v43 - v44;
    BOOL v46 = v31 > 1.3 || v36;
    if (v46 && v41 < v45)
    {
      double v48 = a5->x;
      v49 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
      [v49 contentOffset];
      double v51 = v50;

      v52 = (void *)MEMORY[0x263F088C8];
      v53 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
      uint64_t v54 = [v53 numberOfItemsInSection:0] - 1;

      uint64_t v55 = [v10 item];
      uint64_t v56 = v55 - 1;
      if (v48 > v51) {
        uint64_t v56 = v55 + 1;
      }
      if (v54 < v56) {
        uint64_t v56 = v54;
      }
      v57 = [v52 indexPathForItem:v56 & ~(v56 >> 63) inSection:0];

      v58 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
      v59 = [v58 collectionViewLayout];
      uint64_t v60 = [v57 item];
      v61 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
      [v61 bounds];
      double v63 = v62;
      double v65 = v64;
      v66 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
      [v66 bounds];
      objc_msgSend(v59, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v60, v63, v65, v67, v68);
      double v70 = v69;
      double v72 = v71;

      v73 = [(AVTCenteringCollectionViewDelegate *)self collectionView];
      +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v73, v70, v72);
      double v28 = v74;
      CGFloat v30 = v75;

      id v10 = v57;
    }
  }
  v76 = [(AVTCenteringCollectionViewDelegate *)self logger];
  [v76 logCarouselEndsDraggingWithVelocity:v36 willSwitchIndexPathInsteadOfScrollBack:v31 > 1.3 forHighVelocity:x];

  a5->double x = v28;
  a5->double y = v30;
  v77 = [(AVTCenteringCollectionViewDelegate *)self delegate];
  char v78 = objc_opt_respondsToSelector();

  if (v78)
  {
    v79 = [(AVTCenteringCollectionViewDelegate *)self delegate];
    objc_msgSend(v79, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v80, a5, x, y);
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UICollectionViewDelegate *)WeakRetained;
}

- (CGPoint)previousOffset
{
  double x = self->_previousOffset.x;
  double y = self->_previousOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousOffset:(CGPoint)a3
{
  self->_previousOffset = a3;
}

- (NSIndexPath)lastHapticOnScrollIndexPath
{
  return self->_lastHapticOnScrollIndexPath;
}

- (void)setLastHapticOnScrollIndexPath:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_lastHapticOnScrollIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end