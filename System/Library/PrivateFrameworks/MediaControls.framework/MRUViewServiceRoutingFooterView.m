@interface MRUViewServiceRoutingFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUViewServiceRoutingFooterView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UIButton)button;
- (UIView)separatorView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)setSeparatorView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisualStyling;
@end

@implementation MRUViewServiceRoutingFooterView

- (MRUViewServiceRoutingFooterView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MRUViewServiceRoutingFooterView;
  v3 = -[MRUViewServiceRoutingFooterView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    separatorView = v3->_separatorView;
    v3->_separatorView = (UIView *)v5;

    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v3->_separatorView setBackgroundColor:v7];

    [(MRUViewServiceRoutingFooterView *)v3 addSubview:v3->_separatorView];
    uint64_t v8 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v8;

    v10 = [(UIButton *)v3->_button titleLabel];
    [v10 setNumberOfLines:2];

    v11 = [(UIButton *)v3->_button titleLabel];
    [v11 setTextAlignment:1];

    -[UIButton setTitleEdgeInsets:](v3->_button, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
    v12 = v3->_button;
    v13 = +[MRUStringsProvider controlOtherSpeakers];
    [(UIButton *)v12 setTitle:v13 forState:0];

    [(MRUViewServiceRoutingFooterView *)v3 addSubview:v3->_button];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(MRUViewServiceRoutingFooterView *)v3 addInteraction:v14];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUViewServiceRoutingFooterView *)v3 updateContentSizeCategory];
  }
  return v3;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)MRUViewServiceRoutingFooterView;
  [(MRUViewServiceRoutingFooterView *)&v16 layoutSubviews];
  [(MRUViewServiceRoutingFooterView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(MRUViewServiceRoutingFooterView *)self traitCollection];
  [v11 displayScale];
  double v13 = 1.0 / v12;

  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double MinX = CGRectGetMinX(v17);
  [(MRUViewServiceRoutingFooterView *)self bounds];
  double MinY = CGRectGetMinY(v18);
  [(MRUViewServiceRoutingFooterView *)self bounds];
  -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, MinY, CGRectGetWidth(v19), v13);
  UIRectInset();
  -[UIButton setFrame:](self->_button, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v6 = [(MRUViewServiceRoutingFooterView *)self traitCollection];
  [v6 displayScale];
  double v8 = 1.0 / v7;

  double v9 = v8 + 15.0 + 15.0;
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", width, height - v9);
  double v11 = v9 + v10;
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUViewServiceRoutingFooterView *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  CGFloat v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  id v5 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v4];
  CGFloat v6 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v5 shape:0];

  return v6;
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:4 toView:self->_separatorView];
  id v3 = [(MRUVisualStylingProvider *)self->_stylingProvider colorForStyle:0];
  [(UIButton *)self->_button setTintColor:v3];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_titleFont");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(UIButton *)self->_button titleLabel];
  [v3 setFont:v4];
}

- (UIButton)button
{
  return self->_button;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end