@interface MRURoutingHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRURoutingHeaderView)initWithReuseIdentifier:(id)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)title;
- (UIEdgeInsets)contentEdgeInsets;
- (UILabel)titleLabel;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setSeparatorView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisualStyling;
@end

@implementation MRURoutingHeaderView

- (MRURoutingHeaderView)initWithReuseIdentifier:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MRURoutingHeaderView;
  v3 = [(MRURoutingHeaderView *)&v14 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(MRURoutingHeaderView *)v3 setTintColor:v4];

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    [(UILabel *)v3->_titleLabel setNumberOfLines:2];
    v7 = [(MRURoutingHeaderView *)v3 contentView];
    [v7 addSubview:v3->_titleLabel];

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v8;

    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v3->_separatorView setBackgroundColor:v10];

    v11 = [(MRURoutingHeaderView *)v3 contentView];
    [v11 addSubview:v3->_separatorView];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRURoutingHeaderView *)v3 updateContentSizeCategory];
  }
  return v3;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)MRURoutingHeaderView;
  [(MRURoutingHeaderView *)&v24 layoutSubviews];
  v3 = [(MRURoutingHeaderView *)self contentView];
  [v3 bounds];
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  CGFloat v7 = v6 + left;
  CGFloat v9 = v8 + top;
  CGFloat v11 = v10 - (left + self->_contentEdgeInsets.right);
  CGFloat v13 = v12 - (top + self->_contentEdgeInsets.bottom);

  objc_super v14 = [(MRURoutingHeaderView *)self traitCollection];
  [v14 displayScale];

  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  CGRectGetMinX(v25);
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  CGRectGetMaxY(v26);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  CGRectGetWidth(v27);
  [(MRURoutingHeaderView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  UIRectInset();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(UILabel *)self->_titleLabel font];
  [v23 descender];
  UIRoundToViewScale();

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v20, v22);
  MRUSizeCeilToViewScale(self);
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  CGRectGetMinX(v28);
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  CGRectGetMaxY(v29);
  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.width = v20;
  v30.size.height = v22;
  CGRectGetWidth(v30);
  [(MRURoutingHeaderView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = 16.0 * 2.0 + 10.0 + 1.0;
  CGFloat v6 = a3.width - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right);
  CGFloat v7 = a3.height - v5;
  double v8 = [(UILabel *)self->_titleLabel font];
  [v8 descender];
  UIRoundToViewScale();
  double v10 = v9;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, v7);
  MRUSizeCeilToViewScale(self);
  double v12 = v5 + v10 + v11;
  double v13 = width;
  result.height = v12;
  result.CGFloat width = v13;
  return result;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  [(MRURoutingHeaderView *)self setNeedsLayout];
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets.double top = 0.0;
  self->_contentEdgeInsets.double left = a3.left;
  self->_contentEdgeInsets.bottom = 0.0;
  self->_contentEdgeInsets.right = a3.right;
  [(MRURoutingHeaderView *)self setNeedsLayout];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    CGFloat v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRURoutingHeaderView *)self updateVisualStyling];
    id v5 = v7;
  }
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:1 toView:self->_titleLabel];
  stylingProvider = self->_stylingProvider;
  separatorView = self->_separatorView;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:4 toView:separatorView];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingHeaderFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setFont:v3];
}

- (NSString)title
{
  return self->_title;
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

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end