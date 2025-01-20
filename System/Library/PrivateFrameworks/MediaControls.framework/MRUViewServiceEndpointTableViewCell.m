@interface MRUViewServiceEndpointTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUNowPlayingCellContentView)cellContentView;
- (MRUViewServiceEndpointTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MRUVisualStylingProvider)stylingProvider;
- (UIEdgeInsets)contentEdgeInsets;
- (UIView)separatorView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisualStyling;
@end

@implementation MRUViewServiceEndpointTableViewCell

- (MRUViewServiceEndpointTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  v4 = [(MRUViewServiceEndpointTableViewCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(MRUViewServiceEndpointTableViewCell *)v4 setBackgroundColor:v5];

    v6 = objc_alloc_init(MRUNowPlayingCellContentView);
    cellContentView = v4->_cellContentView;
    v4->_cellContentView = v6;

    v8 = [(MRUNowPlayingCellContentView *)v4->_cellContentView artworkView];
    [v8 setStyle:0];

    v9 = [(MRUNowPlayingCellContentView *)v4->_cellContentView headerView];
    [v9 setLayout:3];

    v10 = [(MRUNowPlayingCellContentView *)v4->_cellContentView headerView];
    v11 = [v10 labelView];
    [v11 setLayout:1];

    v12 = [(MRUViewServiceEndpointTableViewCell *)v4 contentView];
    [v12 addSubview:v4->_cellContentView];

    id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    separatorView = v4->_separatorView;
    v4->_separatorView = (UIView *)v14;

    v16 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v4->_separatorView setBackgroundColor:v16];

    v17 = [(MRUViewServiceEndpointTableViewCell *)v4 contentView];
    [v17 addSubview:v4->_separatorView];

    id v18 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(MRUViewServiceEndpointTableViewCell *)v4 setSelectedBackgroundView:v18];

    v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    v20 = [(MRUViewServiceEndpointTableViewCell *)v4 selectedBackgroundView];
    [v20 setBackgroundColor:v19];

    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    v22 = [(MRUViewServiceEndpointTableViewCell *)v4 contentView];
    [v22 addInteraction:v21];
  }
  return v4;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  [(MRUViewServiceEndpointTableViewCell *)&v21 layoutSubviews];
  v3 = [(MRUViewServiceEndpointTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[MRUNowPlayingCellContentView setFrame:](self->_cellContentView, "setFrame:", v5 + self->_contentEdgeInsets.left, v7 + self->_contentEdgeInsets.top, v9 - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), v11 - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
  [(MRUNowPlayingCellContentView *)self->_cellContentView textInset];
  UIRectInset();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v20 = [(MRUViewServiceEndpointTableViewCell *)self traitCollection];
  [v20 displayScale];

  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  CGRectGetMinX(v22);
  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  CGRectGetMaxY(v23);
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  CGRectGetWidth(v24);
  [(MRUViewServiceEndpointTableViewCell *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[MRUNowPlayingCellContentView sizeThatFits:](self->_cellContentView, "sizeThatFits:", a3.width, a3.height);
  double v6 = v5 + self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  [(MRUViewServiceEndpointTableViewCell *)&v5 prepareForReuse];
  v3 = [(MRUViewServiceEndpointTableViewCell *)self cellContentView];
  double v4 = [v3 artworkView];
  [v4 prepareForReuse];
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    [(MRUViewServiceEndpointTableViewCell *)self setNeedsLayout];
  }
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  -[MRUViewServiceEndpointTableViewCell _setShouldHaveFullLengthBottomSeparator:](&v5, sel__setShouldHaveFullLengthBottomSeparator_);
  [(UIView *)self->_separatorView setHidden:v3];
}

- (void)setStylingProvider:(id)a3
{
  objc_super v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  double v7 = v5;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUViewServiceEndpointTableViewCell *)self updateVisualStyling];
    [(MRUNowPlayingCellContentView *)self->_cellContentView setStylingProvider:v7];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4FB1D48]);
  double v6 = [(MRUViewServiceEndpointTableViewCell *)self contentView];
  double v7 = (void *)[v5 initWithView:v6];

  double v8 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v7];
  [v8 setPrefersScaledContent:0];
  double v9 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:0];

  return v9;
}

- (void)updateVisualStyling
{
}

- (MRUNowPlayingCellContentView)cellContentView
{
  return self->_cellContentView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
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

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_cellContentView, 0);
}

@end