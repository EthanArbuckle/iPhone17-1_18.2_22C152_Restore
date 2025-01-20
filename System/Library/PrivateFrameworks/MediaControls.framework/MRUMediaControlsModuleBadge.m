@interface MRUMediaControlsModuleBadge
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUMediaControlsModuleBadge)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UILabel)label;
- (unint64_t)count;
- (void)layoutSubviews;
- (void)setCount:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisualStyling;
@end

@implementation MRUMediaControlsModuleBadge

- (MRUMediaControlsModuleBadge)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRUMediaControlsModuleBadge;
  v3 = -[MRUMediaControlsModuleBadge initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(MRUMediaControlsModuleBadge *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v5;

    [(UILabel *)v3->_label setNumberOfLines:1];
    [(UILabel *)v3->_label setTextAlignment:1];
    [(MRUMediaControlsModuleBadge *)v3 addSubview:v3->_label];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUMediaControlsModuleBadge *)v3 updateContentSizeCategory];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MRUMediaControlsModuleBadge;
  [(MRUMediaControlsModuleBadge *)&v13 layoutSubviews];
  [(MRUMediaControlsModuleBadge *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UILabel setFrame:](self->_label, "setFrame:");
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  double Height = CGRectGetHeight(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  double Width = CGRectGetWidth(v15);
  if (Height < Width) {
    double Width = Height;
  }
  [(MRUMediaControlsModuleBadge *)self _setContinuousCornerRadius:Width * 0.5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  if (v3 < v4) {
    double v3 = v4;
  }
  double v5 = v3 + 8.0;
  double v6 = v4 + 8.0;
  result.height = v6;
  result.width = v5;
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
    [(MRUMediaControlsModuleBadge *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (void)setCount:(unint64_t)a3
{
  double v4 = (void *)MEMORY[0x1E4F28EE0];
  double v5 = [NSNumber numberWithUnsignedInteger:a3];
  double v6 = [v4 localizedStringFromNumber:v5 numberStyle:0];
  [(UILabel *)self->_label setText:v6];

  [(MRUMediaControlsModuleBadge *)self setNeedsLayout];
}

- (void)updateVisualStyling
{
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_controlCenterMoreButtonBadgeFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_label setFont:v3];
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (unint64_t)count
{
  return self->_count;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end