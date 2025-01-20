@interface MRUMediaControlsModuleMoreButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUMediaControlsModuleBadge)badge;
- (MRUMediaControlsModuleMoreButton)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)title;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (double)contentScale;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)layout;
- (unint64_t)count;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setBadge:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setCount:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisualStyling;
- (void)visualStylingProviderDidChange:(id)a3;
@end

@implementation MRUMediaControlsModuleMoreButton

- (MRUMediaControlsModuleMoreButton)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MRUMediaControlsModuleMoreButton;
  v3 = -[MRUMediaControlsModuleMoreButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F5AE08] controlCenterDarkMaterial];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v4;

    [(UIView *)v3->_backgroundView setUserInteractionEnabled:0];
    [(MRUMediaControlsModuleMoreButton *)v3 addSubview:v3->_backgroundView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    v7 = +[MRUAssetsProvider controlOtherSpeakers];
    uint64_t v8 = [v6 initWithImage:v7];
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v8;

    [(UIImageView *)v3->_imageView setContentMode:4];
    [(UIImageView *)v3->_imageView setUserInteractionEnabled:0];
    [(MRUMediaControlsModuleMoreButton *)v3 addSubview:v3->_imageView];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:2];
    [(UILabel *)v3->_titleLabel setUserInteractionEnabled:0];
    [(MRUMediaControlsModuleMoreButton *)v3 addSubview:v3->_titleLabel];
    v12 = objc_alloc_init(MRUMediaControlsModuleBadge);
    badge = v3->_badge;
    v3->_badge = v12;

    [(MRUMediaControlsModuleBadge *)v3->_badge setUserInteractionEnabled:0];
    [(MRUMediaControlsModuleMoreButton *)v3 addSubview:v3->_badge];
    v3->_contentScale = 1.0;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(MRUMediaControlsModuleMoreButton *)v3 addInteraction:v14];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUMediaControlsModuleMoreButton *)v3 updateContentSizeCategory];
  }
  return v3;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)MRUMediaControlsModuleMoreButton;
  [(MRUMediaControlsModuleMoreButton *)&v36 layoutSubviews];
  [(MRUMediaControlsModuleMoreButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MRUMediaControlsModuleMoreButton *)self traitCollection];
  [v11 displayScale];

  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:CGRectGetHeight(v37) * 0.5];
  UIRectInset();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[MRUMediaControlsModuleBadge sizeThatFits:](self->_badge, "sizeThatFits:", v16, v18);
  v38.origin.x = v13;
  v38.origin.y = v15;
  v38.size.width = v17;
  v38.size.height = v19;
  CGRectGetMaxX(v38);
  UIRectCenteredYInRect();
  UIRectIntegralWithScale();
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [(MRUMediaControlsModuleMoreButton *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUMediaControlsModuleBadge setFrame:](self->_badge, "setFrame:");
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  CGRectGetWidth(v39);
  UIRectInset();
  CGRectGetMinX(v40);
  UIRectCenteredYInRect();
  UIRectRoundToScale();
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  [(MRUMediaControlsModuleMoreButton *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  v41.origin.x = v29;
  v41.origin.y = v31;
  v41.size.width = v33;
  v41.size.height = v35;
  CGRectGetWidth(v41);
  UIRectInset();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = MRUCGSizeMultiply(44.0, 16.0, self->_contentScale);
  double v8 = v7;
  double v9 = height - v7;
  -[MRUMediaControlsModuleBadge sizeThatFits:](self->_badge, "sizeThatFits:", width - v6, height - v7);
  double v11 = v10;
  double v13 = v6 + v12 * 2.0;
  uint64_t v14 = -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v6 - v12 * 2.0, v9);
  double v16 = v15;
  double v18 = v13 + v17;
  int64_t layout = self->_layout;
  if (layout != 7 && layout != 9)
  {
    double v21 = MEMORY[0x1B3E725A0](v14) * 3.0;
    if (v18 < v21) {
      double v18 = v21;
    }
  }
  if (v11 >= v16) {
    double v22 = v11;
  }
  else {
    double v22 = v16;
  }
  double v23 = v8 + v22;
  if (v18 >= width) {
    double v24 = width;
  }
  else {
    double v24 = v18;
  }
  result.double height = v23;
  result.double width = v24;
  return result;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  [(MRUMediaControlsModuleMoreButton *)self setNeedsLayout];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUMediaControlsModuleMoreButton *)self updateVisualStyling];
    id v5 = v7;
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    [(MRUMediaControlsModuleMoreButton *)self setNeedsLayout];
  }
}

- (unint64_t)count
{
  return [(MRUMediaControlsModuleBadge *)self->_badge count];
}

- (void)setCount:(unint64_t)a3
{
  [(MRUMediaControlsModuleBadge *)self->_badge setCount:a3];

  [(MRUMediaControlsModuleMoreButton *)self setNeedsLayout];
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUMediaControlsModuleMoreButton *)self updateContentSizeCategory];
  }
}

- (void)visualStylingProviderDidChange:(id)a3
{
  [(MRUMediaControlsModuleMoreButton *)self updateVisualStyling];

  [(MRUMediaControlsModuleMoreButton *)self setNeedsLayout];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(MRUMediaControlsModuleMoreButton *)self bounds];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  double v6 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v5];
  double v7 = (void *)MEMORY[0x1E4FB1AE0];
  double v8 = (void *)MEMORY[0x1E4FB14C0];
  [(MRUMediaControlsModuleMoreButton *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(UIView *)self->_backgroundView _continuousCornerRadius];
  double v18 = objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v17);
  CGFloat v19 = [v7 shapeWithPath:v18];

  double v20 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v19];

  return v20;
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_imageView];
  stylingProvider = self->_stylingProvider;
  titleLabel = self->_titleLabel;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:0 toView:titleLabel];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_controlCenterMoreButtonTitleFontWithScale:", self->_contentScale);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setFont:v4];
  double v3 = [MEMORY[0x1E4FB1830] configurationWithFont:v4 scale:3];
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v3];
}

- (NSString)title
{
  return self->_title;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (MRUMediaControlsModuleBadge)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end