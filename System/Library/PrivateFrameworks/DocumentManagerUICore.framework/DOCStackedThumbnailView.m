@interface DOCStackedThumbnailView
- (CGSize)intrinsicContentSize;
- (CGSize)topThumbnailSize;
- (DOCStackedThumbnailView)initWithTopThumbnailSize:(CGSize)a3;
- (NSArray)URLs;
- (NSArray)nodes;
- (NSArray)thumbnailImageViews;
- (void)createThumbnailViewsWithCount:(unint64_t)a3 createViewForIndex:(id)a4;
- (void)layoutSubviews;
- (void)setNodes:(id)a3;
- (void)setThumbnailImageViews:(id)a3;
- (void)setTopThumbnailSize:(CGSize)a3;
- (void)setURLs:(id)a3;
- (void)updateNodes;
- (void)updateURLs;
@end

@implementation DOCStackedThumbnailView

- (DOCStackedThumbnailView)initWithTopThumbnailSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)DOCStackedThumbnailView;
  v5 = -[DOCStackedThumbnailView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_topThumbnailSize.CGFloat width = width;
    v5->_topThumbnailSize.CGFloat height = height;
    [(DOCStackedThumbnailView *)v5 setClipsToBounds:1];
  }
  return v6;
}

- (void)setTopThumbnailSize:(CGSize)a3
{
  if (self->_topThumbnailSize.width != a3.width || self->_topThumbnailSize.height != a3.height)
  {
    self->_topThumbnailSize = a3;
    [(DOCStackedThumbnailView *)self updateNodes];
    [(DOCStackedThumbnailView *)self updateURLs];
  }
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
  [(DOCStackedThumbnailView *)self updateNodes];
}

- (void)updateNodes
{
  if (self->_nodes)
  {
    [(DOCStackedThumbnailView *)self topThumbnailSize];
    if (v4 != *MEMORY[0x263F001B0] || v3 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      v6 = self->_nodes;
      NSUInteger v7 = [(NSArray *)self->_nodes count];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __38__DOCStackedThumbnailView_updateNodes__block_invoke;
      v9[3] = &unk_264674880;
      v9[4] = self;
      v10 = v6;
      objc_super v8 = v6;
      [(DOCStackedThumbnailView *)self createThumbnailViewsWithCount:v7 createViewForIndex:v9];
    }
  }
}

DOCThumbnailFittingImageView *__38__DOCStackedThumbnailView_updateNodes__block_invoke(uint64_t a1, unint64_t a2)
{
  double v4 = (double)a2 * 4.0;
  [*(id *)(a1 + 32) topThumbnailSize];
  double v6 = v5 - v4;
  [*(id *)(a1 + 32) topThumbnailSize];
  double v8 = v7 - v4;
  v9 = [DOCThumbnailFittingImageView alloc];
  v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v11 = -[DOCThumbnailFittingImageView initWithSize:node:](v9, "initWithSize:node:", v10, v6, v8);

  [(DOCThumbnailFittingImageView *)v11 _setContinuousCornerRadius:4.0];
  [(DOCThumbnailFittingImageView *)v11 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
  return v11;
}

- (void)setURLs:(id)a3
{
  objc_storeStrong((id *)&self->_URLs, a3);
  [(DOCStackedThumbnailView *)self updateURLs];
}

- (void)updateURLs
{
  URLs = self->_URLs;
  if (URLs && [(NSArray *)URLs count])
  {
    [(DOCStackedThumbnailView *)self topThumbnailSize];
    if (v5 != *MEMORY[0x263F001B0] || v4 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      double v7 = self->_URLs;
      [(DOCStackedThumbnailView *)self topThumbnailSize];
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      NSUInteger v12 = [(NSArray *)self->_URLs count];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __37__DOCStackedThumbnailView_updateURLs__block_invoke;
      v14[3] = &unk_2646748A8;
      uint64_t v16 = v9;
      uint64_t v17 = v11;
      v15 = v7;
      v13 = v7;
      [(DOCStackedThumbnailView *)self createThumbnailViewsWithCount:v12 createViewForIndex:v14];
    }
  }
}

id __37__DOCStackedThumbnailView_updateURLs__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  double v4 = DOCNewThumbnailFittingImageView(v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

  [v4 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
  return v4;
}

- (void)createThumbnailViewsWithCount:(unint64_t)a3 createViewForIndex:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v7 = (void (**)(id, void))a4;
  if (!a3)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"DOCStackedThumbnailView.m" lineNumber:255 description:@"Must have at least one thumbnail"];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  if (a3 >= 2) {
    a3 = 2;
  }
  *((void *)&v17 + 1) = 0;
  long long v18 = 0uLL;
  uint64_t v8 = [(DOCStackedThumbnailView *)self thumbnailImageViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  if (a3)
  {
    uint64_t v14 = 0;
    do
    {
      v15 = v7[2](v7, v14);
      [v13 addObject:v15];
      [(DOCStackedThumbnailView *)self insertSubview:v15 atIndex:0];

      ++v14;
    }
    while (a3 != v14);
  }
  [(DOCStackedThumbnailView *)self setThumbnailImageViews:v13];
  [(DOCStackedThumbnailView *)self setNeedsLayout];
  [(DOCStackedThumbnailView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)DOCStackedThumbnailView;
  [(DOCStackedThumbnailView *)&v5 layoutSubviews];
  double v3 = [(DOCStackedThumbnailView *)self thumbnailImageViews];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__DOCStackedThumbnailView_layoutSubviews__block_invoke;
  v4[3] = &unk_2646748D0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __41__DOCStackedThumbnailView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CGFloat v5 = *MEMORY[0x263F00148];
  CGFloat v6 = *(double *)(MEMORY[0x263F00148] + 8);
  id v21 = a2;
  [v21 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 32) frame];
  double Width = CGRectGetWidth(v23);
  v24.origin.x = v5;
  v24.origin.y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  double v12 = (Width - CGRectGetWidth(v24)) * 0.5;
  v13 = *(void **)(a1 + 32);
  if (a3)
  {
    uint64_t v14 = [v13 thumbnailImageViews];
    v15 = [v14 objectAtIndexedSubscript:a3 - 1];

    [v15 frame];
    double v17 = v16 + -4.0;
    [*(id *)(a1 + 32) topThumbnailSize];
    [v21 setFittingSize:v17];
    [v15 frame];
    double v19 = v18 + -2.0;
  }
  else
  {
    [v13 frame];
    double Height = CGRectGetHeight(v25);
    v26.origin.x = v12;
    v26.origin.y = v6;
    v26.size.CGFloat width = v8;
    v26.size.CGFloat height = v10;
    double v19 = Height - CGRectGetHeight(v26);
  }
  objc_msgSend(v21, "setFrame:", v12, v19, v8, v10);
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(DOCStackedThumbnailView *)self thumbnailImageViews];
  double v4 = [v3 firstObject];

  [v4 intrinsicContentSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(DOCStackedThumbnailView *)self nodes];

  if (v9)
  {
    double v10 = [(DOCStackedThumbnailView *)self nodes];
  }
  else
  {
    uint64_t v11 = [(DOCStackedThumbnailView *)self URLs];

    if (!v11)
    {
      double v15 = 0.0;
      goto LABEL_8;
    }
    double v10 = [(DOCStackedThumbnailView *)self URLs];
  }
  double v12 = v10;
  unint64_t v13 = [v10 count] - 1;

  uint64_t v14 = 2;
  if (v13 < 2) {
    uint64_t v14 = v13;
  }
  double v15 = (double)(unint64_t)(2 * v14);
LABEL_8:
  double v16 = v8 + v15;

  double v17 = v6;
  double v18 = v16;
  result.CGFloat height = v18;
  result.CGFloat width = v17;
  return result;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (CGSize)topThumbnailSize
{
  double width = self->_topThumbnailSize.width;
  double height = self->_topThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)thumbnailImageViews
{
  return self->_thumbnailImageViews;
}

- (void)setThumbnailImageViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageViews, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end