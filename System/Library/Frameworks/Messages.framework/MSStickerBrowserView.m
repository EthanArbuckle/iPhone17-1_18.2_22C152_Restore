@interface MSStickerBrowserView
- (BOOL)isAnimating;
- (BOOL)isRestoringContentOffset;
- (CGPoint)contentOffset;
- (CGPoint)restoredContentOffset;
- (CGSize)browserSizeToRestoreFrom;
- (MSStickerBrowserView)initWithCoder:(id)a3;
- (MSStickerBrowserView)initWithFrame:(CGRect)frame;
- (MSStickerBrowserView)initWithFrame:(CGRect)frame stickerSize:(MSStickerSize)stickerSize;
- (MSStickerBrowserViewDisplayDelegate)displayDelegate;
- (MSStickerBrowserViewLayoutSpec)layoutSpec;
- (MSStickerSize)stickerSize;
- (NSDictionary)stateRestorationInfo;
- (NSMutableArray)cellsToAnimate;
- (NSMutableDictionary)stickerCache;
- (NSOperationQueue)stickerCacheQueue;
- (NSTimer)animationTimer;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (UIEdgeInsets)contentInset;
- (id)_stickerAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)dataSource;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)currentlyAnimatingIndex;
- (void)_reloadStickersAtIndexes:(id)a3;
- (void)_startAnimating;
- (void)_stopAnimating;
- (void)_updateCollectionViewSpecIfNeeded;
- (void)animateNextCell;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureStickerView;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidateFlowLayout;
- (void)layoutSubviews;
- (void)prepareForSnapshotting;
- (void)reloadData;
- (void)restoreFromState:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationTimer:(id)a3;
- (void)setBrowserSizeToRestoreFrom:(CGSize)a3;
- (void)setCellsToAnimate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentInset:(UIEdgeInsets)contentInset;
- (void)setContentOffset:(CGPoint)contentOffset;
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;
- (void)setCurrentlyAnimatingIndex:(unint64_t)a3;
- (void)setDataSource:(id)dataSource;
- (void)setDisplayDelegate:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setIsRestoringContentOffset:(BOOL)a3;
- (void)setLayoutSpec:(id)a3;
- (void)setRestoredContentOffset:(CGPoint)a3;
- (void)setStickerCache:(id)a3;
- (void)setStickerCacheQueue:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation MSStickerBrowserView

- (MSStickerBrowserView)initWithFrame:(CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserView;
  v3 = -[MSStickerBrowserView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_stickerSize = 1;
    [(MSStickerBrowserView *)v3 configureStickerView];
  }
  return v4;
}

- (MSStickerBrowserView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserView;
  v3 = [(MSStickerBrowserView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_stickerSize = 1;
    [(MSStickerBrowserView *)v3 configureStickerView];
  }
  return v4;
}

- (MSStickerBrowserView)initWithFrame:(CGRect)frame stickerSize:(MSStickerSize)stickerSize
{
  v8.receiver = self;
  v8.super_class = (Class)MSStickerBrowserView;
  v5 = -[MSStickerBrowserView initWithFrame:](&v8, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  objc_super v6 = v5;
  if (v5)
  {
    v5->_stickerSize = stickerSize;
    [(MSStickerBrowserView *)v5 configureStickerView];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(MSStickerBrowserView *)self animationTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MSStickerBrowserView;
  [(MSStickerBrowserView *)&v4 dealloc];
}

- (void)setDataSource:(id)dataSource
{
  id obj = dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(MSStickerBrowserView *)self reloadData];
    v5 = obj;
  }
}

- (CGPoint)contentOffset
{
  v2 = [(MSStickerBrowserView *)self collectionView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setContentOffset:(CGPoint)contentOffset
{
  double y = contentOffset.y;
  double x = contentOffset.x;
  id v5 = [(MSStickerBrowserView *)self collectionView];
  objc_msgSend(v5, "setContentOffset:", x, y);
}

- (UIEdgeInsets)contentInset
{
  v2 = [(MSStickerBrowserView *)self collectionView];
  [v2 contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
  double right = contentInset.right;
  double bottom = contentInset.bottom;
  double left = contentInset.left;
  double top = contentInset.top;
  id v7 = [(MSStickerBrowserView *)self collectionView];
  objc_msgSend(v7, "setContentInset:", top, left, bottom, right);
}

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated
{
  BOOL v4 = animated;
  double y = contentOffset.y;
  double x = contentOffset.x;
  id v7 = [(MSStickerBrowserView *)self collectionView];
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);
}

- (void)configureStickerView
{
  [(MSStickerBrowserView *)self setBackgroundColor:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F42890]);
  [v10 setScrollDirection:0];
  [(MSStickerBrowserView *)self setFlowLayout:v10];
  id v3 = objc_alloc(MEMORY[0x1E4F42858]);
  [(MSStickerBrowserView *)self bounds];
  BOOL v4 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v10);
  [v4 setShowsVerticalScrollIndicator:1];
  if (+[_MSPresentationState isRunningInCameraContext]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [v4 setIndicatorStyle:v5];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setDataSource:self];
  [v4 setDelegate:self];
  [v4 setPrefetchingEnabled:1];
  [v4 setPrefetchDataSource:self];
  [v4 setAlwaysBounceVertical:1];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"_kMSStickerCollectionViewCellReuseIdentifier"];
  double v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setBackgroundColor:v6];

  [(MSStickerBrowserView *)self setCollectionView:v4];
  [(MSStickerBrowserView *)self addSubview:v4];
  [(MSStickerBrowserView *)self _updateCollectionViewSpecIfNeeded];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  [(MSStickerBrowserView *)self setCellsToAnimate:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(MSStickerBrowserView *)self setStickerCache:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v9 setQualityOfService:25];
  [v9 setSuspended:1];
  [v9 setUnderlyingQueue:MEMORY[0x1E4F14428]];
  [(MSStickerBrowserView *)self setStickerCacheQueue:v9];
}

- (void)animateNextCell
{
  id v3 = [(MSStickerBrowserView *)self cellsToAnimate];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = [(MSStickerBrowserView *)self currentlyAnimatingIndex];
    unint64_t v6 = v5 + 1;
    id v7 = [(MSStickerBrowserView *)self cellsToAnimate];
    unint64_t v8 = [v7 count];

    if (v5 + 1 < v8)
    {
      id v9 = [(MSStickerBrowserView *)self cellsToAnimate];
      id v10 = [v9 objectAtIndex:v6];

      double v11 = [v10 stickerView];
      int v12 = [v11 isPeeled];

      if (v12) {
        unint64_t v6 = v5 + 2;
      }
    }
    double v13 = [(MSStickerBrowserView *)self cellsToAnimate];
    unint64_t v14 = [v13 count];

    if (v6 >= v14) {
      unint64_t v6 = 0;
    }
    v15 = [(MSStickerBrowserView *)self cellsToAnimate];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      unint64_t v17 = 0;
      uint64_t v18 = *MEMORY[0x1E4F1C4B0];
      do
      {
        v19 = [(MSStickerBrowserView *)self cellsToAnimate];
        v20 = [v19 objectAtIndex:v17];

        if (v6 == v17)
        {
          v21 = [v20 stickerView];
          [v21 animationDuration];
          double v23 = v22;

          double v24 = v23 + v23;
          if (v23 >= 0.5) {
            double v24 = v23;
          }
          v25 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel_animateNextCell selector:0 userInfo:0 repeats:v24];
          v26 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
          [v26 addTimer:v25 forMode:v18];

          [(MSStickerBrowserView *)self setAnimationTimer:v25];
        }
        [v20 setAnimating:v6 == v17];

        ++v17;
        v27 = [(MSStickerBrowserView *)self cellsToAnimate];
        unint64_t v28 = [v27 count];
      }
      while (v17 < v28);
    }
    [(MSStickerBrowserView *)self setCurrentlyAnimatingIndex:v6];
  }
  else
  {
    v29 = [(MSStickerBrowserView *)self animationTimer];
    [v29 invalidate];

    [(MSStickerBrowserView *)self setAnimationTimer:0];
  }
}

- (void)reloadData
{
  [(MSStickerBrowserView *)self setLayoutSpec:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_dataSource);
    self->_stickerSize = [v5 stickerSize];
  }
  [(MSStickerBrowserView *)self _updateCollectionViewSpecIfNeeded];
  id v6 = [(MSStickerBrowserView *)self stickerCache];
  [v6 removeAllObjects];
}

- (void)_reloadStickersAtIndexes:(id)a3
{
  char v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__MSStickerBrowserView__reloadStickersAtIndexes___block_invoke;
  v10[3] = &unk_1E6E98AC8;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:v10];

  unint64_t v8 = [(MSStickerBrowserView *)self stickerCache];
  [v8 removeObjectsForKeys:v7];

  id v9 = [(MSStickerBrowserView *)self collectionView];
  [v9 reloadItemsAtIndexPaths:v7];
}

void __49__MSStickerBrowserView__reloadStickersAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:0];
  [v2 addObject:v3];
}

- (id)_stickerAtIndexPath:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_dataSource);
    unint64_t v8 = objc_msgSend(v7, "stickerBrowserView:stickerAtIndex:", self, objc_msgSend(v4, "item"));
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)layoutSubviews
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)MSStickerBrowserView;
  [(MSStickerBrowserView *)&v40 layoutSubviews];
  id v3 = [(MSStickerBrowserView *)self window];
  id v4 = [v3 rootViewController];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = objc_msgSend(v4, "childViewControllers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    CGFloat v9 = *MEMORY[0x1E4F1DB28];
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v14 conformsToProtocol:&unk_1F40764B0])
        {
          [v14 initialFrameBeforeAppearance];
          double x = v43.origin.x;
          double y = v43.origin.y;
          double width = v43.size.width;
          double height = v43.size.height;
          v44.origin.double x = v9;
          v44.origin.double y = v10;
          v44.size.double width = v11;
          v44.size.double height = v12;
          if (!CGRectEqualToRect(v43, v44))
          {
            v19 = [v14 view];
            -[MSStickerBrowserView convertRect:fromView:](self, "convertRect:fromView:", v19, x, y, width, height);
            double v21 = v20;
            double v23 = v22;
            double v25 = v24;
            double v27 = v26;

            unint64_t v28 = [(MSStickerBrowserView *)self collectionView];
            objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v5 = [(MSStickerBrowserView *)self collectionView];
  [(MSStickerBrowserView *)self bounds];
  objc_msgSend(v5, "setFrame:");
LABEL_12:

  [(MSStickerBrowserView *)self _updateCollectionViewSpecIfNeeded];
  if ([(MSStickerBrowserView *)self isRestoringContentOffset])
  {
    [(MSStickerBrowserView *)self browserSizeToRestoreFrom];
    double v30 = v29;
    double v32 = v31;
    [(MSStickerBrowserView *)self bounds];
    if (v30 == v34 && v32 == v33)
    {
      v35 = [(MSStickerBrowserView *)self collectionView];
      [(MSStickerBrowserView *)self restoredContentOffset];
      objc_msgSend(v35, "setContentOffset:");
    }
    [(MSStickerBrowserView *)self setIsRestoringContentOffset:0];
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)MSStickerBrowserView;
  [(MSStickerBrowserView *)&v5 didMoveToWindow];
  id v3 = [(MSStickerBrowserView *)self window];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__MSStickerBrowserView_didMoveToWindow__block_invoke;
    block[3] = &unk_1E6E987F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __39__MSStickerBrowserView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAnimating];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_dataSource);
  int64_t v9 = [v8 numberOfStickersInStickerBrowserView:self];

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v4 = [a3 dequeueReusableCellWithReuseIdentifier:@"_kMSStickerCollectionViewCellReuseIdentifier" forIndexPath:a4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  id v8 = [(MSStickerBrowserView *)self stickerCache];
  int64_t v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    int64_t v9 = [(MSStickerBrowserView *)self _stickerAtIndexPath:v7];
  }
  [v14 setSticker:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_displayDelegate);
    uint64_t v12 = [v11 stickerBrowserView:self shouldDrawBorderAroundSticker:v9];

    [v14 showCellBorder:v12];
  }
  if ([(MSStickerBrowserView *)self isAnimating])
  {
    double v13 = [v14 stickerView];
    [v13 setAnimating:1];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "stickerView", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setAnimating:0];
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(MSStickerBrowserView *)self stickerCacheQueue];
  [v6 setSuspended:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v11 = [(MSStickerBrowserView *)self _stickerAtIndexPath:v10];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke;
        aBlock[3] = &unk_1E6E987F0;
        id v12 = v11;
        id v24 = v12;
        double v13 = _Block_copy(aBlock);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke_2;
        v21[3] = &unk_1E6E987F0;
        id v22 = v12;
        id v14 = v12;
        v15 = _Block_copy(v21);
        uint64_t v16 = [(MSStickerBrowserView *)self stickerCache];
        [v16 setObject:v14 forKey:v10];

        unint64_t v17 = [(MSStickerBrowserView *)self stickerCacheQueue];
        [v17 addOperationWithBlock:v13];

        uint64_t v18 = [(MSStickerBrowserView *)self stickerCacheQueue];
        [v18 addOperationWithBlock:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
}

uint64_t __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateImageData];
}

uint64_t __65__MSStickerBrowserView_collectionView_prefetchItemsAtIndexPaths___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateThumbnail];
}

- (void)_updateCollectionViewSpecIfNeeded
{
  id v3 = [(MSStickerBrowserView *)self window];
  id v4 = [v3 windowScene];
  uint64_t v5 = [v4 interfaceOrientation];

  uint64_t v6 = [(MSStickerBrowserView *)self layoutSpec];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [(MSStickerBrowserView *)self layoutSpec],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 interfaceOrientation],
        v8,
        v7,
        v9 != v5))
  {
    [(MSStickerBrowserView *)self setLayoutSpec:0];
    uint64_t v10 = +[MSStickerBrowserViewLayoutSpec specWithSizeClass:[(MSStickerBrowserView *)self stickerSize] interfaceOrientation:v5];
    [(MSStickerBrowserView *)self setLayoutSpec:v10];

    id v11 = [(MSStickerBrowserView *)self flowLayout];
    id v12 = [(MSStickerBrowserView *)self layoutSpec];
    [v12 minimumInteritemSpacing];
    objc_msgSend(v11, "setMinimumInteritemSpacing:");
    [v12 itemSize];
    objc_msgSend(v11, "setItemSize:");
    [v12 minimumLineSpacing];
    objc_msgSend(v11, "setMinimumLineSpacing:");
    [v12 sectionInset];
    objc_msgSend(v11, "setSectionInset:");
  }
  collectionView = self->_collectionView;

  [(UICollectionView *)collectionView reloadData];
}

- (void)prepareForSnapshotting
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(MSStickerBrowserView *)self collectionView];
  [v3 setShowsVerticalScrollIndicator:0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(MSStickerBrowserView *)self collectionView];
  uint64_t v5 = [v4 visibleCells];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) stickerView];
        [v10 prepareForSnapshotting];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserView;
  -[MSStickerBrowserView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  uint64_t v5 = [(MSStickerBrowserView *)self collectionView];
  [v5 setUserInteractionEnabled:v3];
  [v5 setScrollEnabled:v3];
  if (!v3)
  {
    [v5 contentOffset];
    objc_msgSend(v5, "setContentOffset:animated:", 0);
  }
}

- (NSDictionary)stateRestorationInfo
{
  v19[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MSStickerBrowserView *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  v18[0] = @"x-offset";
  uint64_t v8 = [NSNumber numberWithDouble:v5];
  v19[0] = v8;
  v18[1] = @"y-offset";
  uint64_t v9 = [NSNumber numberWithDouble:v7];
  v19[1] = v9;
  v18[2] = @"x-size";
  uint64_t v10 = NSNumber;
  [(MSStickerBrowserView *)self bounds];
  long long v12 = [v10 numberWithDouble:v11];
  v19[2] = v12;
  v18[3] = @"y-size";
  long long v13 = NSNumber;
  [(MSStickerBrowserView *)self bounds];
  v15 = [v13 numberWithDouble:v14];
  v19[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

  return (NSDictionary *)v16;
}

- (void)restoreFromState:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"x-offset"];
  [v5 floatValue];
  double v7 = v6;
  uint64_t v8 = [v4 objectForKeyedSubscript:@"y-offset"];
  [v8 floatValue];
  -[MSStickerBrowserView setRestoredContentOffset:](self, "setRestoredContentOffset:", v7, v9);

  uint64_t v10 = [v4 objectForKeyedSubscript:@"x-size"];
  [v10 floatValue];
  double v12 = v11;
  long long v13 = [v4 objectForKeyedSubscript:@"y-size"];

  [v13 floatValue];
  -[MSStickerBrowserView setBrowserSizeToRestoreFrom:](self, "setBrowserSizeToRestoreFrom:", v12, v14);

  [(MSStickerBrowserView *)self setIsRestoringContentOffset:1];
}

- (void)invalidateFlowLayout
{
  id v2 = [(MSStickerBrowserView *)self flowLayout];
  [v2 invalidateLayout];
}

- (void)_startAnimating
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MSStickerBrowserView *)self setAnimating:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = [(MSStickerBrowserView *)self collectionView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAnimating:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_stopAnimating
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MSStickerBrowserView *)self setAnimating:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = [(MSStickerBrowserView *)self collectionView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAnimating:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (MSStickerSize)stickerSize
{
  return self->_stickerSize;
}

- (id)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return WeakRetained;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (MSStickerBrowserViewLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (void)setLayoutSpec:(id)a3
{
}

- (NSMutableArray)cellsToAnimate
{
  return self->_cellsToAnimate;
}

- (void)setCellsToAnimate:(id)a3
{
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
}

- (unint64_t)currentlyAnimatingIndex
{
  return self->_currentlyAnimatingIndex;
}

- (void)setCurrentlyAnimatingIndex:(unint64_t)a3
{
  self->_currentlyAnimatingIndedouble x = a3;
}

- (CGPoint)restoredContentOffset
{
  double x = self->_restoredContentOffset.x;
  double y = self->_restoredContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRestoredContentOffset:(CGPoint)a3
{
  self->_restoredContentOffset = a3;
}

- (CGSize)browserSizeToRestoreFrom
{
  double width = self->_browserSizeToRestoreFrom.width;
  double height = self->_browserSizeToRestoreFrom.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBrowserSizeToRestoreFrom:(CGSize)a3
{
  self->_browserSizeToRestoreFrom = a3;
}

- (BOOL)isRestoringContentOffset
{
  return self->_isRestoringContentOffset;
}

- (void)setIsRestoringContentOffset:(BOOL)a3
{
  self->_isRestoringContentOffset = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSMutableDictionary)stickerCache
{
  return self->_stickerCache;
}

- (void)setStickerCache:(id)a3
{
}

- (NSOperationQueue)stickerCacheQueue
{
  return self->_stickerCacheQueue;
}

- (void)setStickerCacheQueue:(id)a3
{
}

- (MSStickerBrowserViewDisplayDelegate)displayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);

  return (MSStickerBrowserViewDisplayDelegate *)WeakRetained;
}

- (void)setDisplayDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayDelegate);
  objc_storeStrong((id *)&self->_stickerCacheQueue, 0);
  objc_storeStrong((id *)&self->_stickerCache, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_cellsToAnimate, 0);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end