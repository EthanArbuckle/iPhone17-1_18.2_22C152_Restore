@interface MPAVClippingTableView
- (MPAVClippingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (NSMutableDictionary)sectionBackgroundViews;
- (UIView)footerBackgroundView;
- (UIView)headerBackgroundView;
- (id)_createBackgroundView;
- (id)backgroundViewForSection:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setFooterBackgroundView:(id)a3;
- (void)setHeaderBackgroundView:(id)a3;
- (void)setSectionBackgroundViews:(id)a3;
@end

@implementation MPAVClippingTableView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionBackgroundViews, 0);
  objc_storeStrong((id *)&self->_footerBackgroundView, 0);

  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
}

- (void)setSectionBackgroundViews:(id)a3
{
}

- (NSMutableDictionary)sectionBackgroundViews
{
  return self->_sectionBackgroundViews;
}

- (void)setFooterBackgroundView:(id)a3
{
}

- (UIView)footerBackgroundView
{
  return self->_footerBackgroundView;
}

- (void)setHeaderBackgroundView:(id)a3
{
}

- (UIView)headerBackgroundView
{
  return self->_headerBackgroundView;
}

- (id)_createBackgroundView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setBackgroundColor:v4];

  [v3 setAlpha:0.1];
  [v3 _setDrawsAsBackdropOverlayWithBlendMode:1];
  [v3 setUserInteractionEnabled:0];
  [(MPAVClippingTableView *)self insertSubview:v3 atIndex:0];

  return v3;
}

- (id)backgroundViewForSection:(unint64_t)a3
{
  sectionBackgroundViews = self->_sectionBackgroundViews;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v7 = [(NSMutableDictionary *)sectionBackgroundViews objectForKeyedSubscript:v6];

  if (!v7)
  {
    v7 = [(MPAVClippingTableView *)self _createBackgroundView];
    v8 = self->_sectionBackgroundViews;
    v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)MPAVClippingTableView;
  [(MPAVClippingTableView *)&v23 layoutSubviews];
  [(MPAVClippingTableView *)self contentOffset];
  double v4 = v3;
  [(MPAVClippingTableView *)self contentSize];
  double v6 = v5;
  [(MPAVClippingTableView *)self bounds];
  double Width = CGRectGetWidth(v24);
  if (v4 >= 0.0)
  {
    headerBackgroundView = self->_headerBackgroundView;
    double v10 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v8 = fabs(v4) + 200.0;
    headerBackgroundView = self->_headerBackgroundView;
    double v10 = v4 + -200.0;
  }
  -[UIView setFrame:](headerBackgroundView, "setFrame:", 0.0, v10, Width, v8);
  [(MPAVClippingTableView *)self bounds];
  double v11 = CGRectGetWidth(v25);
  [(MPAVClippingTableView *)self frame];
  -[UIView setFrame:](self->_footerBackgroundView, "setFrame:", 0.0, v6, v11, v4 + CGRectGetHeight(v26) - v6 + 200.0);
  v12 = [MEMORY[0x1E4F28E60] indexSet];
  v13 = [(MPAVClippingTableView *)self indexPathsForVisibleRows];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __39__MPAVClippingTableView_layoutSubviews__block_invoke;
  v20[3] = &unk_1E57F3150;
  id v14 = v12;
  id v21 = v14;
  v22 = self;
  [v13 enumerateObjectsUsingBlock:v20];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__MPAVClippingTableView_layoutSubviews__block_invoke_2;
  v19[3] = &unk_1E57F6610;
  v19[4] = self;
  [v14 enumerateIndexesUsingBlock:v19];
  sectionBackgroundViews = self->_sectionBackgroundViews;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__MPAVClippingTableView_layoutSubviews__block_invoke_3;
  v17[3] = &unk_1E57F3178;
  id v18 = v14;
  id v16 = v14;
  [(NSMutableDictionary *)sectionBackgroundViews enumerateKeysAndObjectsUsingBlock:v17];
}

void __39__MPAVClippingTableView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "addIndex:", objc_msgSend(v4, "section"));
  rect_8 = objc_msgSend(*(id *)(a1 + 40), "headerViewForSection:", objc_msgSend(v4, "section"));
  double v5 = [*(id *)(a1 + 40) cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [rect_8 frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v5 frame];
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    CGFloat rect = v26.origin.x;
    double MinY = CGRectGetMinY(v26);
    v27.origin.x = v7;
    v27.origin.CGFloat y = v9;
    v27.size.CGFloat width = v11;
    v27.size.CGFloat height = v13;
    if (MinY >= CGRectGetMaxY(v27))
    {
      double v19 = *MEMORY[0x1E4FB2848];
      double v20 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v21 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v22 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    else
    {
      v28.origin.x = v7;
      v28.origin.CGFloat y = v9;
      v28.size.CGFloat width = v11;
      v28.size.CGFloat height = v13;
      double MaxY = CGRectGetMaxY(v28);
      v29.origin.x = rect;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      double v19 = MaxY - CGRectGetMinY(v29);
      double v20 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
    }
    objc_msgSend(v5, "setClippingInsets:", v19, v20, v21, v22, *(void *)&rect);
  }
}

void __39__MPAVClippingTableView_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) headerViewForSection:a2];
  [v4 frame];
  double MaxY = CGRectGetMaxY(v11);

  [*(id *)(a1 + 32) rectForSection:a2];
  double x = v12.origin.x;
  double width = v12.size.width;
  CGFloat v8 = v12.size.height - (MaxY - CGRectGetMinY(v12));
  id v9 = [*(id *)(a1 + 32) backgroundViewForSection:a2];
  objc_msgSend(v9, "setFrame:", x, MaxY, width, v8);
}

void __39__MPAVClippingTableView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "containsIndex:", objc_msgSend(a2, "integerValue")) ^ 1);
}

- (MPAVClippingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MPAVClippingTableView;
  id v4 = -[MPAVClippingTableView initWithFrame:style:](&v12, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionBackgroundViews = v4->_sectionBackgroundViews;
    v4->_sectionBackgroundViews = v5;

    uint64_t v7 = [(MPAVClippingTableView *)v4 _createBackgroundView];
    headerBackgroundView = v4->_headerBackgroundView;
    v4->_headerBackgroundView = (UIView *)v7;

    uint64_t v9 = [(MPAVClippingTableView *)v4 _createBackgroundView];
    footerBackgroundView = v4->_footerBackgroundView;
    v4->_footerBackgroundView = (UIView *)v9;

    [(MPAVClippingTableView *)v4 setSeparatorStyle:0];
  }
  return v4;
}

@end