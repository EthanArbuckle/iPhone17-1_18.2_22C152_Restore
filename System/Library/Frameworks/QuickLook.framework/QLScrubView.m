@interface QLScrubView
+ (double)defaultWidth;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGRect)_thumbnailFrameForPageAtIndex:(int64_t)a3;
- (QLScrubView)init;
- (QLScrubViewDataSource)dataSource;
- (QLScrubViewDelegate)delegate;
- (double)bottomOffset;
- (double)topOffset;
- (void)_handleSwipAtLocation:(CGPoint)a3;
- (void)_hidePageLabel;
- (void)_notifyPageChanged;
- (void)_removeThumbviews;
- (void)_showPageLabel;
- (void)_updatePageLabelPosition;
- (void)_updateSelectedThumbnailView;
- (void)layoutSubviews;
- (void)longTapReceived:(id)a3;
- (void)panReceived:(id)a3;
- (void)reloadThumbnails;
- (void)selectPageNumber:(int64_t)a3;
- (void)setBottomOffset:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTopOffset:(double)a3;
- (void)tapReceived:(id)a3;
@end

@implementation QLScrubView

- (QLScrubView)init
{
  v25[1] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)QLScrubView;
  v2 = [(QLScrubView *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] clearColor];
    [(QLScrubView *)v2 setBackgroundColor:v3];

    v4 = [MEMORY[0x263F824D8] effectWithStyle:1200];
    v5 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v4];
    [(QLScrubView *)v2 addSubview:v5];
    [(QLScrubView *)v2 sendSubviewToBack:v5];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = (void *)MEMORY[0x263F08938];
    v24 = @"visualEffectView";
    v25[0] = v5;
    v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v8 = [v6 constraintsWithVisualFormat:@"V:|[visualEffectView]|" options:0 metrics:0 views:v7];
    [(QLScrubView *)v2 addConstraints:v8];

    v9 = (void *)MEMORY[0x263F08938];
    v22 = @"visualEffectView";
    v23 = v5;
    v10 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v11 = [v9 constraintsWithVisualFormat:@"H:|[visualEffectView]|" options:0 metrics:0 views:v10];
    [(QLScrubView *)v2 addConstraints:v11];

    uint64_t v12 = objc_opt_new();
    thumbViews = v2->_thumbViews;
    v2->_thumbViews = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    visibleThumbIndexes = v2->_visibleThumbIndexes;
    v2->_visibleThumbIndexes = (NSMutableArray *)v14;

    v2->_selectedPage = -1;
    v16 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:v2 action:sel_panReceived_];
    [v16 setDelegate:v2];
    [(QLScrubView *)v2 addGestureRecognizer:v16];
    v17 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v2 action:sel_tapReceived_];
    [v17 setDelegate:v2];
    [(QLScrubView *)v2 addGestureRecognizer:v17];
    v18 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:v2 action:sel_longTapReceived_];
    [v18 setDelegate:v2];
    [(QLScrubView *)v2 addGestureRecognizer:v18];
    [(QLScrubView *)v2 setDeliversTouchesForGesturesToSuperview:0];
    v19 = v2;
  }
  return v2;
}

- (void)_removeThumbviews
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_thumbViews;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = -[NSMutableDictionary objectForKey:](self->_thumbViews, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 removeFromSuperview];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_visibleThumbIndexes removeAllObjects];
}

- (void)reloadThumbnails
{
  [(QLScrubView *)self _removeThumbviews];
  self->_needsThumbLayout = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_pageCount = [WeakRetained numberOfPagesInScrubView:self];

  [(QLScrubView *)self layoutSubviews];
}

- (void)selectPageNumber:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0 && self->_pageCount > a3)
  {
    self->_selectedPage = a3;
    [(QLScrubView *)self _updateSelectedThumbnailView];
  }
}

- (void)_notifyPageChanged
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 scrubView:self didSelectPageAtIndex:self->_selectedPage];
  }
}

- (void)_handleSwipAtLocation:(CGPoint)a3
{
  int64_t pageCount = self->_pageCount;
  if (pageCount)
  {
    int64_t v5 = (uint64_t)((a3.y - self->_thumbOrigin) / ((self->_thumbEnd - self->_thumbOrigin) / (double)pageCount));
    if ((v5 & 0x8000000000000000) == 0 && pageCount > v5 && self->_selectedPage != v5)
    {
      self->_selectedPage = v5;
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__notifyPageChanged object:0];
      [(QLScrubView *)self performSelector:sel__notifyPageChanged withObject:0 afterDelay:0.2];
      [(QLScrubView *)self _updateSelectedThumbnailView];
      [(QLScrubView *)self _updatePageLabelPosition];
    }
  }
}

- (void)panReceived:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1) {
    [(QLScrubView *)self _showPageLabel];
  }
  [v4 locationInView:self];
  -[QLScrubView _handleSwipAtLocation:](self, "_handleSwipAtLocation:");
  uint64_t v5 = [v4 state];

  if (v5 == 3)
  {
    [(QLScrubView *)self _hidePageLabel];
  }
}

- (void)tapReceived:(id)a3
{
  [a3 locationInView:self];

  -[QLScrubView _handleSwipAtLocation:](self, "_handleSwipAtLocation:");
}

- (void)longTapReceived:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1) {
    [(QLScrubView *)self _showPageLabel];
  }
  [v4 locationInView:self];
  -[QLScrubView _handleSwipAtLocation:](self, "_handleSwipAtLocation:");
  uint64_t v5 = [v4 state];

  if (v5 == 3)
  {
    [(QLScrubView *)self _hidePageLabel];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  objc_msgSend(a4, "view", a3);
  uint64_t v5 = (QLScrubView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == self;

  return (char)self;
}

+ (double)defaultWidth
{
  return 61.0;
}

- (void)setFrame:(CGRect)a3
{
  self->_needsThumbLayout = 1;
  v3.receiver = self;
  v3.super_class = (Class)QLScrubView;
  -[QLScrubView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)_thumbnailFrameForPageAtIndex:(int64_t)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_visibleThumbIndexes count];
  if (v5 < 1)
  {
LABEL_6:
    uint64_t v7 = -1;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      v8 = [(NSMutableArray *)self->_visibleThumbIndexes objectAtIndex:v7];
      int64_t v9 = [v8 integerValue];

      if (v9 == a3) {
        break;
      }
      if (v9 > a3)
      {
        int v14 = v7;
        if (v7) {
          int v14 = 1;
        }
        unsigned int v15 = v7 - v14;
        v16 = [(NSMutableArray *)self->_visibleThumbIndexes objectAtIndex:(v7 - v14)];
        uint64_t v17 = [v16 integerValue];

        if (v7 != v15)
        {
          double thumbHeight = self->_thumbHeight;
          double v11 = self->_thumbOrigin
              + (double)v15 * (thumbHeight + 8.0)
              + floor((self->_thumbOrigin+ (double)v7 * (thumbHeight + 8.0)- (self->_thumbOrigin+ (double)v15 * (thumbHeight + 8.0)))* (double)(a3 - v17)/ (double)(v9 - v17));
          goto LABEL_8;
        }
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_6;
      }
    }
  }
  double thumbHeight = self->_thumbHeight;
  double v11 = self->_thumbOrigin + (double)v7 * (thumbHeight + 8.0);
LABEL_8:
  double v12 = 32.0;
  double v13 = 17.0;
  result.size.height = thumbHeight;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v13;
  return result;
}

- (void)_showPageLabel
{
  if (!self->_pageNumberLabel)
  {
    objc_super v3 = objc_alloc_init(QLPageNumberView);
    pageNumberLabel = self->_pageNumberLabel;
    self->_pageNumberLabel = v3;
  }
  [(QLScrubView *)self _updatePageLabelPosition];
  [(QLScrubView *)self addSubview:self->_pageNumberLabel];
  uint64_t v5 = self->_pageNumberLabel;

  [(QLScrubView *)self bringSubviewToFront:v5];
}

- (void)_updatePageLabelPosition
{
  pageNumberLabel = self->_pageNumberLabel;
  if (pageNumberLabel)
  {
    [(QLPageNumberView *)pageNumberLabel setPageCount:self->_pageCount];
    [(QLPageNumberView *)self->_pageNumberLabel setPageNumber:self->_selectedPage + 1];
    [(QLPageNumberView *)self->_pageNumberLabel sizeToFit];
    thumbViews = self->_thumbViews;
    uint64_t v5 = [NSNumber numberWithInteger:self->_selectedPage];
    id v14 = [(NSMutableDictionary *)thumbViews objectForKey:v5];

    [v14 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(QLPageNumberView *)self->_pageNumberLabel frame];
    -[QLPageNumberView setFrame:](self->_pageNumberLabel, "setFrame:", v7 - v12 + -10.0, v9 + floor((v11 - v13) * 0.5 + 2.0));
  }
}

- (void)_hidePageLabel
{
}

- (void)layoutSubviews
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  if (self->_needsThumbLayout)
  {
    if (self->_pageCount)
    {
      [(QLScrubView *)self bounds];
      if (v3 != 0.0)
      {
        self->_needsThumbLayout = 0;
        [(QLScrubView *)self _removeThumbviews];
        [(QLScrubView *)self bounds];
        double v5 = v4;
        [(QLScrubView *)self topOffset];
        double v7 = v5 - v6;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        [WeakRetained scrubView:self pageSizeAtIndex:0];
        double v10 = v9;
        double v12 = v11;

        double v13 = floor(v12 * 32.0 / v10);
        self->_double thumbHeight = v13;
        double v14 = v13 + 8.0;
        double v15 = (v7 + -36.0) / v14 + 1.0;
        if ((uint64_t)v15)
        {
          if (self->_pageCount >= (uint64_t)v15) {
            int64_t pageCount = (uint64_t)v15;
          }
          else {
            int64_t pageCount = self->_pageCount;
          }
          double v17 = (double)pageCount * v14 + -8.0;
          [(QLScrubView *)self topOffset];
          double v19 = v18 + floor((v7 - v17) * 0.5);
          self->_thumbOrigin = v19;
          self->_thumbEnd = v17 + v19;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          v20 = self->_thumbViews;
          uint64_t v21 = [(NSMutableDictionary *)v20 countByEnumeratingWithState:&v67 objects:v72 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v68;
            double v24 = *MEMORY[0x263F001A8];
            double v25 = *(double *)(MEMORY[0x263F001A8] + 8);
            double v26 = *(double *)(MEMORY[0x263F001A8] + 16);
            double v27 = *(double *)(MEMORY[0x263F001A8] + 24);
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v68 != v23) {
                  objc_enumerationMutation(v20);
                }
                v29 = [(NSMutableDictionary *)self->_thumbViews objectForKey:*(void *)(*((void *)&v67 + 1) + 8 * i)];
                [v29 setAlwaysVisible:0];
                objc_msgSend(v29, "setFrame:", v24, v25, v26, v27);
                objc_msgSend(v29, "setUnselectedFrame:", v24, v25, v26, v27);
              }
              uint64_t v22 = [(NSMutableDictionary *)v20 countByEnumeratingWithState:&v67 objects:v72 count:16];
            }
            while (v22);
          }

          [(NSMutableArray *)self->_visibleThumbIndexes removeAllObjects];
          if (pageCount >= 1)
          {
            for (uint64_t j = 0; j != pageCount; ++j)
            {
              int64_t v31 = self->_pageCount;
              if (pageCount - 1 == j) {
                uint64_t v32 = v31 - 1;
              }
              else {
                uint64_t v32 = (v31 / pageCount + v31) * j / pageCount;
              }
              visibleThumbIndexes = self->_visibleThumbIndexes;
              v34 = [NSNumber numberWithInteger:v32];
              [(NSMutableArray *)visibleThumbIndexes addObject:v34];
            }
          }
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          v35 = self->_visibleThumbIndexes;
          uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v63 objects:v71 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v64;
            double v39 = *(double *)(MEMORY[0x263F001A8] + 8);
            double v58 = *MEMORY[0x263F001A8];
            double v40 = *(double *)(MEMORY[0x263F001A8] + 16);
            double v41 = *(double *)(MEMORY[0x263F001A8] + 24);
            v57 = v60;
            do
            {
              for (uint64_t k = 0; k != v37; ++k)
              {
                if (*(void *)v64 != v38) {
                  objc_enumerationMutation(v35);
                }
                v43 = *(void **)(*((void *)&v63 + 1) + 8 * k);
                uint64_t v44 = objc_msgSend(v43, "integerValue", v57);
                v45 = [(NSMutableDictionary *)self->_thumbViews objectForKey:v43];
                if (!v45)
                {
                  v45 = -[QLThumbnailView initWithFrame:]([QLThumbnailView alloc], "initWithFrame:", v58, v39, v40, v41);
                  [(QLThumbnailView *)v45 setPageNumber:v44];
                  [(NSMutableDictionary *)self->_thumbViews setObject:v45 forKey:v43];
                }
                v46 = [(QLThumbnailView *)v45 image];

                if (!v46)
                {
                  id v47 = objc_loadWeakRetained((id *)&self->_dataSource);
                  double thumbHeight = self->_thumbHeight;
                  v59[0] = MEMORY[0x263EF8330];
                  v59[1] = 3221225472;
                  v60[0] = __29__QLScrubView_layoutSubviews__block_invoke;
                  v60[1] = &unk_2642F5BB8;
                  v61 = v45;
                  uint64_t v62 = v44;
                  objc_msgSend(v47, "scrubView:thumbnailForPage:size:withCompletionBlock:", self, v44, v59, 32.0, thumbHeight);
                }
                [(QLScrubView *)self _thumbnailFrameForPageAtIndex:v44];
                double v50 = v49;
                double v52 = v51;
                double v54 = v53;
                double v56 = v55;
                -[QLThumbnailView setUnselectedFrame:](v45, "setUnselectedFrame:");
                if (v44 == self->_selectedPage)
                {
                  v74.origin.x = v50;
                  v74.origin.y = v52;
                  v74.size.width = v54;
                  v74.size.height = v56;
                  CGRect v75 = CGRectInset(v74, -8.0, -8.0);
                  -[QLThumbnailView setFrame:](v45, "setFrame:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height);
                  objc_storeStrong((id *)&self->_selectedThumbnailView, v45);
                }
                else
                {
                  -[QLThumbnailView setFrame:](v45, "setFrame:", v50, v52, v54, v56);
                }
                [(QLThumbnailView *)v45 setAlwaysVisible:1];
                [(QLScrubView *)self addSubview:v45];
                [(QLScrubView *)self bringSubviewToFront:v45];
              }
              uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v63 objects:v71 count:16];
            }
            while (v37);
          }

          if (self->_selectedThumbnailView) {
            -[QLScrubView bringSubviewToFront:](self, "bringSubviewToFront:");
          }
        }
      }
    }
  }
}

void __29__QLScrubView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  QLRunInMainThread();
}

uint64_t __29__QLScrubView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) pageNumber];
  if (result == *(void *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setImage:v4];
  }
  return result;
}

- (void)_updateSelectedThumbnailView
{
  int64_t selectedPage = self->_selectedPage;
  if ((selectedPage & 0x8000000000000000) == 0
    && (selectedPage != [(QLThumbnailView *)self->_selectedThumbnailView pageNumber]
     || !self->_selectedThumbnailView))
  {
    uint64_t v4 = [NSNumber numberWithInteger:self->_selectedPage];
    BOOL v5 = [(QLThumbnailView *)self->_selectedThumbnailView alwaysVisible];
    selectedThumbnailView = self->_selectedThumbnailView;
    if (v5)
    {
      [(QLThumbnailView *)selectedThumbnailView unselectedFrame];
      -[QLThumbnailView setFrame:](self->_selectedThumbnailView, "setFrame:");
    }
    else
    {
      [(QLThumbnailView *)selectedThumbnailView removeFromSuperview];
    }
    double v7 = [(NSMutableDictionary *)self->_thumbViews objectForKey:v4];
    double v8 = self->_selectedThumbnailView;
    self->_selectedThumbnailView = v7;

    double v9 = self->_selectedThumbnailView;
    if (v9)
    {
      [(QLThumbnailView *)v9 unselectedFrame];
      double x = v29.origin.x;
      double y = v29.origin.y;
      double width = v29.size.width;
      double height = v29.size.height;
      if (CGRectEqualToRect(v29, *MEMORY[0x263F001A8]))
      {
        [(QLScrubView *)self _thumbnailFrameForPageAtIndex:self->_selectedPage];
        double x = v14;
        double y = v15;
        double width = v16;
        double height = v17;
        -[QLThumbnailView setUnselectedFrame:](self->_selectedThumbnailView, "setUnselectedFrame:");
      }
    }
    else
    {
      [(QLScrubView *)self _thumbnailFrameForPageAtIndex:self->_selectedPage];
      double x = v18;
      double y = v19;
      double width = v20;
      double height = v21;
      uint64_t v22 = -[QLThumbnailView initWithFrame:]([QLThumbnailView alloc], "initWithFrame:", v18, v19, v20, v21);
      uint64_t v23 = self->_selectedThumbnailView;
      self->_selectedThumbnailView = v22;

      [(QLThumbnailView *)self->_selectedThumbnailView setPageNumber:self->_selectedPage];
      -[QLThumbnailView setUnselectedFrame:](self->_selectedThumbnailView, "setUnselectedFrame:", x, y, width, height);
      [(NSMutableDictionary *)self->_thumbViews setObject:self->_selectedThumbnailView forKey:v4];
    }
    double v24 = [(QLThumbnailView *)self->_selectedThumbnailView image];

    if (!v24)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      int64_t v26 = self->_selectedPage;
      double thumbHeight = self->_thumbHeight;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __43__QLScrubView__updateSelectedThumbnailView__block_invoke;
      v28[3] = &unk_2642F5BE0;
      v28[4] = self;
      objc_msgSend(WeakRetained, "scrubView:thumbnailForPage:size:withCompletionBlock:", self, v26, v28, 32.0, thumbHeight);
    }
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    CGRect v31 = CGRectInset(v30, -8.0, -8.0);
    -[QLThumbnailView setFrame:](self->_selectedThumbnailView, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    [(QLScrubView *)self addSubview:self->_selectedThumbnailView];
    [(QLScrubView *)self bringSubviewToFront:self->_selectedThumbnailView];
  }
}

void __43__QLScrubView__updateSelectedThumbnailView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  QLRunInMainThread();
}

uint64_t __43__QLScrubView__updateSelectedThumbnailView__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 472) pageNumber];
  uint64_t v3 = *(void *)(a1 + 32);
  if (result == *(void *)(v3 + 448))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    BOOL v5 = *(void **)(v3 + 472);
    return [v5 setImage:v4];
  }
  return result;
}

- (QLScrubViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (QLScrubViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (QLScrubViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (QLScrubViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (double)bottomOffset
{
  return self->_bottomOffset;
}

- (void)setBottomOffset:(double)a3
{
  self->_bottomOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pageNumberLabel, 0);
  objc_storeStrong((id *)&self->_selectedThumbnailView, 0);
  objc_storeStrong((id *)&self->_visibleThumbIndexes, 0);

  objc_storeStrong((id *)&self->_thumbViews, 0);
}

@end