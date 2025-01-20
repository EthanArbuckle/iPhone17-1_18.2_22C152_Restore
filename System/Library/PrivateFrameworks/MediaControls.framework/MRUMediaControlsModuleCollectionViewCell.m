@interface MRUMediaControlsModuleCollectionViewCell
- (CCUIModuleContentMetrics)contentMetrics;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUMediaControlsModuleBackgroundView)materialView;
- (MRUMediaControlsModuleCollectionViewCell)initWithFrame:(CGRect)a3;
- (MRUNowPlayingCellContentView)cellContentView;
- (UIEdgeInsets)contentEdgeInsets;
- (UIView)highlightView;
- (UIView)transformView;
- (double)contentScale;
- (double)cornerRadius;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaterialView:(id)a3;
- (void)setTransformView:(id)a3;
- (void)setTransitionTransform:(CGAffineTransform *)a3 isVisible:(BOOL)a4;
- (void)updateVisibility;
@end

@implementation MRUMediaControlsModuleCollectionViewCell

- (MRUMediaControlsModuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)MRUMediaControlsModuleCollectionViewCell;
  v7 = -[MRUMediaControlsModuleCollectionViewCell initWithFrame:](&v26, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    transformView = v7->_transformView;
    v7->_transformView = (UIView *)v8;

    [(UIView *)v7->_transformView setClipsToBounds:1];
    v10 = [(MRUMediaControlsModuleCollectionViewCell *)v7 contentView];
    [v10 addSubview:v7->_transformView];

    v11 = -[MRUMediaControlsModuleBackgroundView initWithFrame:]([MRUMediaControlsModuleBackgroundView alloc], "initWithFrame:", x, y, width, height);
    materialView = v7->_materialView;
    v7->_materialView = v11;

    [(MRUMediaControlsModuleBackgroundView *)v7->_materialView setLayout:1];
    [(UIView *)v7->_transformView addSubview:v7->_materialView];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    highlightView = v7->_highlightView;
    v7->_highlightView = (UIView *)v13;

    v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v7->_highlightView setBackgroundColor:v15];

    [(UIView *)v7->_highlightView setHidden:1];
    [(UIView *)v7->_transformView addSubview:v7->_highlightView];
    v16 = -[MRUNowPlayingCellContentView initWithFrame:]([MRUNowPlayingCellContentView alloc], "initWithFrame:", x, y, width, height);
    cellContentView = v7->_cellContentView;
    v7->_cellContentView = v16;

    v18 = [(MRUNowPlayingCellContentView *)v7->_cellContentView artworkView];
    [v18 setStyle:11];

    v19 = [(MRUNowPlayingCellContentView *)v7->_cellContentView headerView];
    [v19 setLayout:3];

    v20 = [(MRUNowPlayingCellContentView *)v7->_cellContentView headerView];
    v21 = [v20 labelView];
    [v21 setLayout:5];

    v22 = [(MRUNowPlayingCellContentView *)v7->_cellContentView artworkView];
    [v22 addObserver:v7];

    [(UIView *)v7->_transformView addSubview:v7->_cellContentView];
    v7->_contentScale = 1.0;
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v7];
    v24 = [(MRUMediaControlsModuleCollectionViewCell *)v7 contentView];
    [v24 addInteraction:v23];

    [(MRUMediaControlsModuleCollectionViewCell *)v7 updateVisibility];
  }
  return v7;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MRUMediaControlsModuleCollectionViewCell;
  [(MRUMediaControlsModuleCollectionViewCell *)&v9 layoutSubviews];
  v3 = [(MRUMediaControlsModuleCollectionViewCell *)self contentView];
  [v3 bounds];
  -[UIView setBounds:](self->_transformView, "setBounds:");

  v4 = [(MRUMediaControlsModuleCollectionViewCell *)self contentView];
  [v4 bounds];
  UIRectGetCenter();
  -[UIView setCenter:](self->_transformView, "setCenter:");

  [(UIView *)self->_transformView bounds];
  -[MRUMediaControlsModuleBackgroundView setFrame:](self->_materialView, "setFrame:");
  [(UIView *)self->_transformView bounds];
  -[UIView setFrame:](self->_highlightView, "setFrame:");
  [(UIView *)self->_transformView bounds];
  -[MRUNowPlayingCellContentView setFrame:](self->_cellContentView, "setFrame:", v5 + self->_contentEdgeInsets.left, v6 + self->_contentEdgeInsets.top, v7 - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), v8 - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = MEMORY[0x1B3E725A0](self, a2, (__n128)a3, *(__n128 *)&a3.height);
  double v5 = width;
  result.double height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)MRUMediaControlsModuleCollectionViewCell;
  [(MRUMediaControlsModuleCollectionViewCell *)&v8 prepareForReuse];
  v3 = [(MRUMediaControlsModuleCollectionViewCell *)self cellContentView];
  double v4 = [v3 artworkView];
  [v4 prepareForReuse];

  double v5 = [(MRUMediaControlsModuleCollectionViewCell *)self materialView];
  [v5 prepareForReuse];

  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v6;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(MRUMediaControlsModuleCollectionViewCell *)self setTransitionTransform:v7 isVisible:1];
  [(MRUMediaControlsModuleCollectionViewCell *)self updateVisibility];
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRUMediaControlsModuleBackgroundView setContentEdgeInsets:](self->_materialView, "setContentEdgeInsets:");
    [(MRUMediaControlsModuleCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[UIView _setContinuousCornerRadius:](self->_transformView, "_setContinuousCornerRadius:");
  }
}

- (void)setContentMetrics:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_contentMetrics, a3);
  if (v6) {
    [v6 symbolScaleFactor];
  }
  else {
    double v5 = 1.0;
  }
  [(MRUMediaControlsModuleCollectionViewCell *)self setContentScale:v5];
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    id v4 = [(MRUMediaControlsModuleCollectionViewCell *)self cellContentView];
    [v4 setContentScale:a3];
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setTransitionTransform:(CGAffineTransform *)a3 isVisible:(BOOL)a4
{
  BOOL v4 = a4;
  long long v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  [(UIView *)self->_transformView setTransform:v7];
  [(UIView *)self->_transformView setAlpha:(double)v4];
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  [(MRUMediaControlsModuleBackgroundView *)self->_materialView setBackdropImage:a4];

  [(MRUMediaControlsModuleCollectionViewCell *)self updateVisibility];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  long long v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self->_transformView parameters:v5];
  double v7 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v6];
  [v7 setPrefersScaledContent:0];
  objc_super v8 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v7 shape:0];

  return v8;
}

- (void)updateVisibility
{
  id v6 = [(MRUNowPlayingCellContentView *)self->_cellContentView artworkView];
  v3 = [(MRUNowPlayingCellContentView *)self->_cellContentView headerView];
  BOOL v4 = [v3 labelView];

  id v5 = [v6 artworkImage];
  [v4 setShowDevice:v5 != 0];
}

- (MRUNowPlayingCellContentView)cellContentView
{
  return self->_cellContentView;
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

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUMediaControlsModuleBackgroundView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (UIView)transformView
{
  return self->_transformView;
}

- (void)setTransformView:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);

  objc_storeStrong((id *)&self->_cellContentView, 0);
}

@end