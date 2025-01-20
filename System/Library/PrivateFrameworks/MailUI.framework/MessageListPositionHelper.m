@interface MessageListPositionHelper
- (BOOL)userIsScrolling;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGRect)_visibleRectInMessageList;
- (EMCollectionItemID)firstVisibleItemID;
- (MessageListPositionHelper)initWithCollectionView:(id)a3 dataSource:(id)a4;
- (NSArray)actuallyVisibleItemIDs;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (double)firstVisibleCellOrigin;
- (double)startingContentOffset;
- (id)_firstVisibleIndexPathForCollectionView:(id)a3;
- (id)_sortedIndexPathsForVisibleItemsInCollectionView:(id)a3;
- (int64_t)firstVisibleIndex;
- (void)_calculateStartingPositionForCollectionView:(id)a3 dataSource:(id)a4;
- (void)recalculateFirstVisibleIndex;
- (void)reset;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFirstVisibleCellOrigin:(double)a3;
- (void)setFirstVisibleIndex:(int64_t)a3;
- (void)setFirstVisibleItemID:(id)a3;
- (void)setStartingContentOffset:(double)a3;
- (void)setUserIsScrolling:(BOOL)a3;
@end

@implementation MessageListPositionHelper

- (void)setFirstVisibleItemID:(id)a3
{
}

- (void)reset
{
}

- (MessageListPositionHelper)initWithCollectionView:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MessageListPositionHelper;
  v9 = [(MessageListPositionHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collectionView, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    [(MessageListPositionHelper *)v10 _calculateStartingPositionForCollectionView:v7 dataSource:v8];
  }

  return v10;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(MessageListPositionHelper *)self userIsScrolling])
  {
    v6 = [(MessageListPositionHelper *)self firstVisibleItemID];

    if (v6)
    {
      id v7 = [(MessageListPositionHelper *)self dataSource];
      id v8 = [(MessageListPositionHelper *)self firstVisibleItemID];
      v9 = [v7 indexPathForItemIdentifier:v8];

      if (!v9)
      {
        objc_super v12 = _ef_log_MessageListPositionHelper();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          v13 = "Item no longer present in list. Not adjusting content offset.";
          v14 = v12;
          uint32_t v15 = 2;
          goto LABEL_10;
        }
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v10 = [v9 item];
      int64_t v11 = [(MessageListPositionHelper *)self firstVisibleIndex];
      if (v10 == v11)
      {
        objc_super v12 = _ef_log_MessageListPositionHelper();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v31 = 134217984;
          uint64_t v32 = v10;
          v13 = "First visible index (%ld) unchanged. Not adjusting content offset.";
          v14 = v12;
          uint32_t v15 = 12;
LABEL_10:
          _os_log_impl(&dword_1DDCDB000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v31, v15);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      uint64_t v16 = v11;
      v17 = [(MessageListPositionHelper *)self collectionView];
      objc_super v12 = v17;
      if (v16 > 2)
      {
        v23 = [v17 cellForItemAtIndexPath:v9];
        [v23 frame];
        double v25 = v24;

        [(MessageListPositionHelper *)self firstVisibleCellOrigin];
        double v27 = v25 - v26;
        [(MessageListPositionHelper *)self startingContentOffset];
        double y = v28 + v27;
        v19 = _ef_log_MessageListPositionHelper();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 134219010;
          uint64_t v32 = v10;
          __int16 v33 = 2114;
          v34 = v9;
          __int16 v35 = 2048;
          double v36 = v25;
          __int16 v37 = 2048;
          double v38 = v27;
          __int16 v39 = 2048;
          double v40 = y;
          v20 = "targetContentOffsetForProposedContentOffset - index:%ld indexPath:%{public}@ cellOrigin:%f cellDelta:%f offset:%f";
          v21 = v19;
          uint32_t v22 = 52;
          goto LABEL_17;
        }
      }
      else
      {
        if (v10 <= v16) {
          goto LABEL_19;
        }
        [v17 adjustedContentInset];
        double y = -v18;
        v19 = _ef_log_MessageListPositionHelper();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 134217984;
          uint64_t v32 = v10;
          v20 = "Pinning to top - new first visible index %ld";
          v21 = v19;
          uint32_t v22 = 12;
LABEL_17:
          _os_log_impl(&dword_1DDCDB000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v31, v22);
        }
      }

      CGFloat x = 0.0;
      goto LABEL_19;
    }
    [(MessageListPositionHelper *)self recalculateFirstVisibleIndex];
  }
LABEL_20:
  double v29 = x;
  double v30 = y;
  result.double y = v30;
  result.CGFloat x = v29;
  return result;
}

- (BOOL)userIsScrolling
{
  return self->_userIsScrolling;
}

- (void)_calculateStartingPositionForCollectionView:(id)a3 dataSource:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageListPositionHelper *)self _firstVisibleIndexPathForCollectionView:v6];
  if (v8)
  {
    v9 = [v7 itemIdentifierForIndexPath:v8];
    [(MessageListPositionHelper *)self setFirstVisibleItemID:v9];

    -[MessageListPositionHelper setFirstVisibleIndex:](self, "setFirstVisibleIndex:", [v8 item]);
    [v6 contentOffset];
    [(MessageListPositionHelper *)self setStartingContentOffset:v10];
    int64_t v11 = [v6 cellForItemAtIndexPath:v8];
    [v11 frame];
    [(MessageListPositionHelper *)self setFirstVisibleCellOrigin:v12];
  }
  v13 = _ef_log_MessageListPositionHelper();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(MessageListPositionHelper *)self firstVisibleItemID];
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    double v18 = v14;
    __int16 v19 = 2048;
    int64_t v20 = [(MessageListPositionHelper *)self firstVisibleIndex];
    _os_log_impl(&dword_1DDCDB000, v13, OS_LOG_TYPE_INFO, "Updating starting position for first visible indexpath:%{public}@ itemID:%{public}@ index:%ld", (uint8_t *)&v15, 0x20u);
  }
}

- (EMCollectionItemID)firstVisibleItemID
{
  return self->_firstVisibleItemID;
}

- (int64_t)firstVisibleIndex
{
  return self->_firstVisibleIndex;
}

- (id)_firstVisibleIndexPathForCollectionView:(id)a3
{
  v3 = [(MessageListPositionHelper *)self _sortedIndexPathsForVisibleItemsInCollectionView:a3];
  v4 = [v3 firstObject];

  return v4;
}

- (id)_sortedIndexPathsForVisibleItemsInCollectionView:(id)a3
{
  return (id)objc_msgSend(a3, "mui_sortedIndexPathsForVisibleItems");
}

uint64_t ___ef_log_MessageListPositionHelper_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MessageListPositionHelper");
  uint64_t v1 = _ef_log_MessageListPositionHelper_log;
  _ef_log_MessageListPositionHelper_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)setStartingContentOffset:(double)a3
{
  self->_startingContentOffset = a3;
}

- (void)setFirstVisibleIndex:(int64_t)a3
{
  self->_firstVisibleIndeCGFloat x = a3;
}

- (void)setFirstVisibleCellOrigin:(double)a3
{
  self->_firstVisibleCellOrigin = a3;
}

- (void)recalculateFirstVisibleIndex
{
  id v4 = [(MessageListPositionHelper *)self collectionView];
  v3 = [(MessageListPositionHelper *)self dataSource];
  [(MessageListPositionHelper *)self _calculateStartingPositionForCollectionView:v4 dataSource:v3];
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setUserIsScrolling:(BOOL)a3
{
  if (self->_userIsScrolling != a3)
  {
    self->_userIsScrolling = a3;
    if (!a3) {
      [(MessageListPositionHelper *)self recalculateFirstVisibleIndex];
    }
  }
}

- (NSArray)actuallyVisibleItemIDs
{
  [(MessageListPositionHelper *)self _visibleRectInMessageList];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  int64_t v11 = [(MessageListPositionHelper *)self collectionView];
  double v12 = [(MessageListPositionHelper *)self _sortedIndexPathsForVisibleItemsInCollectionView:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__MessageListPositionHelper_actuallyVisibleItemIDs__block_invoke;
  v15[3] = &unk_1E6D11C70;
  v15[4] = self;
  v15[5] = v4;
  v15[6] = v6;
  v15[7] = v8;
  v15[8] = v10;
  v13 = objc_msgSend(v12, "ef_compactMap:", v15);

  return (NSArray *)v13;
}

id __51__MessageListPositionHelper_actuallyVisibleItemIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) collectionView];
  uint64_t v5 = [v4 cellForItemAtIndexPath:v3];

  [v5 frame];
  CGFloat MidX = CGRectGetMidX(v12);
  [v5 frame];
  v11.double y = CGRectGetMidY(v13);
  v11.CGFloat x = MidX;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 40), v11))
  {
    uint64_t v7 = [*(id *)(a1 + 32) dataSource];
    uint64_t v8 = [v7 itemIdentifierForIndexPath:v3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (CGRect)_visibleRectInMessageList
{
  id v3 = [(MessageListPositionHelper *)self collectionView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  CGRect v12 = [(MessageListPositionHelper *)self collectionView];
  [v12 contentOffset];
  double v14 = v13;

  int v15 = [(MessageListPositionHelper *)self collectionView];
  [v15 adjustedContentInset];
  double v17 = v16;
  double v19 = v18;

  double v20 = v14 + v17;
  v26.origin.CGFloat x = v5;
  v26.origin.double y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGFloat v21 = CGRectGetHeight(v26) - v17 - v19;
  v27.origin.CGFloat x = v5;
  v27.origin.double y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  double Width = CGRectGetWidth(v27);
  double v23 = 0.0;
  double v24 = v20;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = Width;
  result.origin.double y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (double)startingContentOffset
{
  return self->_startingContentOffset;
}

- (double)firstVisibleCellOrigin
{
  return self->_firstVisibleCellOrigin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstVisibleItemID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end