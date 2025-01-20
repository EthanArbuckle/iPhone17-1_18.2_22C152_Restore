@interface MRUMediaSuggestionsView
- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3;
- (BOOL)supportsHorizontalLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUMediaSuggestionsView)initWithFrame:(CGRect)a3;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)collectionViewLayout;
- (UIEdgeInsets)contentEdgeInsets;
- (double)contentScale;
- (double)itemHeightForItemWidth:(double)a3;
- (double)itemWidthForWidth:(double)a3;
- (int64_t)layout;
- (int64_t)numberOfColumns;
- (int64_t)numberOfRows;
- (void)layoutSubviews;
- (void)setCollectionView:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setContentScale:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayout:(int64_t)a3;
- (void)setSupportsHorizontalLayout:(BOOL)a3;
- (void)updateCollectionViewLayout;
@end

@implementation MRUMediaSuggestionsView

- (MRUMediaSuggestionsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)MRUMediaSuggestionsView;
  v7 = -[MRUMediaSuggestionsView initWithFrame:](&v13, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(MRUMediaSuggestionsView *)v7 updateCollectionViewLayout];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v8->_collectionViewLayout, x, y, width, height);
    collectionView = v8->_collectionView;
    v8->_collectionView = (UICollectionView *)v9;

    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v8->_collectionView setBackgroundColor:v11];

    [(UICollectionView *)v8->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v8->_collectionView setShowsHorizontalScrollIndicator:0];
    v8->_contentScale = 1.0;
    [(MRUMediaSuggestionsView *)v8 addSubview:v8->_collectionView];
  }
  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUMediaSuggestionsView;
  [(MRUMediaSuggestionsView *)&v3 layoutSubviews];
  [(MRUMediaSuggestionsView *)self bounds];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[MRUMediaSuggestionsView itemWidthForWidth:](self, "itemWidthForWidth:", a3.width, a3.height);
  -[MRUMediaSuggestionsView itemHeightForItemWidth:](self, "itemHeightForItemWidth:");
  double top = self->_contentEdgeInsets.top;
  double v7 = top + v6 * (double)[(MRUMediaSuggestionsView *)self numberOfRows];
  double v8 = width;
  result.double height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MRUMediaSuggestionsView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MRUMediaSuggestionsView;
  -[MRUMediaSuggestionsView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  [(MRUMediaSuggestionsView *)self bounds];
  if (v13 != v9 || v12 != v11) {
    [(MRUMediaSuggestionsView *)self updateCollectionViewLayout];
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(MRUMediaSuggestionsView *)self updateCollectionViewLayout];
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    [(MRUMediaSuggestionsView *)self updateCollectionViewLayout];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUMediaSuggestionsView *)self updateCollectionViewLayout];
  }
}

- (void)updateCollectionViewLayout
{
  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    int64_t v22 = [(MRUMediaSuggestionsView *)self numberOfColumns];
    [(MRUMediaSuggestionsView *)self bounds];
    [(MRUMediaSuggestionsView *)self itemWidthForWidth:CGRectGetWidth(v40)];
    -[MRUMediaSuggestionsView itemHeightForItemWidth:](self, "itemHeightForItemWidth:");
    double v24 = v23;
    v25 = (void *)MEMORY[0x1E4FB1338];
    v26 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v27 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
    uint64_t v28 = [v25 sizeWithWidthDimension:v26 heightDimension:v27];

    v37 = (void *)v28;
    double v10 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v28];
    v29 = (void *)MEMORY[0x1E4FB1338];
    v30 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v31 = [MEMORY[0x1E4FB1308] absoluteDimension:v24];
    v14 = [v29 sizeWithWidthDimension:v30 heightDimension:v31];

    objc_super v15 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v14 subitem:v10 count:v22];
    v32 = [MEMORY[0x1E4FB1340] fixedSpacing:10.0];
    [v15 setInterItemSpacing:v32];

    v16 = [MEMORY[0x1E4FB1330] sectionWithGroup:v15];
    objc_msgSend(v16, "setContentInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right);
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1588]);
    [v17 setScrollDirection:0];
    v33 = (UICollectionViewCompositionalLayout *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSection:v16 configuration:v17];
    uint64_t v18 = 0;
    collectionViewLayout = self->_collectionViewLayout;
    self->_collectionViewLayout = v33;
    uint64_t v20 = 1;
  }
  else
  {
    int64_t v3 = [(MRUMediaSuggestionsView *)self numberOfRows];
    [(MRUMediaSuggestionsView *)self bounds];
    [(MRUMediaSuggestionsView *)self itemWidthForWidth:CGRectGetWidth(v39)];
    double v5 = v4;
    double v6 = (void *)MEMORY[0x1E4FB1338];
    double v7 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    double v8 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
    uint64_t v9 = [v6 sizeWithWidthDimension:v7 heightDimension:v8];

    v37 = (void *)v9;
    double v10 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v9];
    double v11 = (void *)MEMORY[0x1E4FB1338];
    double v12 = [MEMORY[0x1E4FB1308] absoluteDimension:v5];
    double v13 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
    v14 = [v11 sizeWithWidthDimension:v12 heightDimension:v13];

    objc_super v15 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v14 subitem:v10 count:v3];
    v16 = [MEMORY[0x1E4FB1330] sectionWithGroup:v15];
    [v16 setInterGroupSpacing:10.0];
    objc_msgSend(v16, "setContentInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, 0.0, self->_contentEdgeInsets.right);
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1588]);
    uint64_t v18 = 1;
    [v17 setScrollDirection:1];
    v19 = (UICollectionViewCompositionalLayout *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSection:v16 configuration:v17];
    uint64_t v20 = 0;
    collectionViewLayout = self->_collectionViewLayout;
    self->_collectionViewLayout = v19;
  }

  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:v20];
  [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:v18];

  [(UICollectionView *)self->_collectionView setCollectionViewLayout:self->_collectionViewLayout];
  double v34 = *MEMORY[0x1E4F1DAD8];
  double v35 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  collectionView = self->_collectionView;

  -[UICollectionView setContentOffset:](collectionView, "setContentOffset:", v34, v35);
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (double)itemWidthForWidth:(double)a3
{
  MRUMediaSuggestionsVisibleItemCount(self->_layout);
  int64_t layout = self->_layout;
  if (layout)
  {
    if (layout != 1) {
      return result;
    }
    double v6 = [(MRUMediaSuggestionsView *)self traitCollection];
    [v6 displayScale];
    UIRoundToScale();

    MRUMediaSuggestionsMaxItemWidthCompact();
  }
  else if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    [(MRUMediaSuggestionsView *)self numberOfColumns];
  }
  double v7 = [(MRUMediaSuggestionsView *)self traitCollection];
  [v7 displayScale];
  UIRoundToScale();
  double v9 = v8;

  return v9;
}

- (double)itemHeightForItemWidth:(double)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_suggestionsTitleFont");
  [v4 lineHeight];

  double v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_suggestionsSubtitleFont");
  [v5 lineHeight];

  double v6 = [(MRUMediaSuggestionsView *)self traitCollection];
  [v6 displayScale];
  UIRoundToScale();
  double v8 = v7;

  return v8;
}

- (int64_t)numberOfRows
{
  if (self->_layout) {
    return 1;
  }
  if (MRUIsSmallScreenWithScale(self->_contentScale)) {
    return 1;
  }
  return 2;
}

- (int64_t)numberOfColumns
{
  if (MRUIsSmallScreenWithScale(self->_contentScale)) {
    return 2;
  }
  else {
    return 3;
  }
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  self->_supportsHorizontalLayout = a3;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end