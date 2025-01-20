@interface MediaControlsRoundButton
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isLabelHidden;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)assetFrame;
- (CGSize)assetSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUAsset)asset;
- (MRUAssetView)assetView;
- (MRUVisualStylingProvider)stylingProvider;
- (MediaControlsRoundButton)initWithFrame:(CGRect)a3;
- (NSString)glyphState;
- (NSString)title;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (UILabel)titleLabel;
- (int64_t)axis;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAsset:(id)a3;
- (void)setAssetSize:(CGSize)a3;
- (void)setAssetView:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGlyphState:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setLabelHidden:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateAssetVisualStyling;
- (void)updateContentSizeCategory;
- (void)updateLabelVisualStyling;
- (void)visualStylingProviderDidChange:(id)a3;
@end

@implementation MediaControlsRoundButton

- (CGRect)assetFrame
{
  uint64_t v3 = [(MediaControlsRoundButton *)self contentVerticalAlignment];
  [(MediaControlsRoundButton *)self bounds];
  if (v3) {
    UIRectCenteredXInRect();
  }
  else {
    UIRectCenteredIntegralRect();
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
  if (a3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  [(UILabel *)self->_titleLabel setTextAlignment:v4];

  [(MediaControlsRoundButton *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)MediaControlsRoundButton;
  [(MediaControlsRoundButton *)&v29 layoutSubviews];
  [(MediaControlsRoundButton *)self bounds];
  [(MediaControlsRoundButton *)self assetFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[MRUAssetView setFrame:](self->_assetView, "setFrame:");
  int64_t axis = self->_axis;
  if (axis == 1)
  {
    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    CGRectGetMaxX(v32);
    UIRectInset();
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](*p_titleLabel, "sizeThatFits:", v25, v27);
    v33.origin.x = v22;
    v33.origin.y = v24;
    v33.size.width = v26;
    v33.size.height = v28;
    CGRectGetMinX(v33);
    UIRectCenteredYInRect();
  }
  else
  {
    if (axis) {
      return;
    }
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    CGRectGetMaxY(v30);
    UIRectInset();
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](*p_titleLabel, "sizeThatFits:", v16, v18);
    v31.origin.x = v13;
    v31.origin.y = v15;
    v31.size.width = v17;
    v31.size.height = v19;
    CGRectGetMinY(v31);
    UIRectCenteredXInRect();
  }
  -[UILabel setFrame:](*p_titleLabel, "setFrame:");
}

- (MediaControlsRoundButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsRoundButton;
  double v7 = -[MediaControlsRoundButton initWithFrame:](&v17, sel_initWithFrame_);
  if (v7)
  {
    CGFloat v8 = objc_alloc_init(MRUAssetView);
    assetView = v7->_assetView;
    v7->_assetView = v8;

    [(MRUAssetView *)v7->_assetView setUserInteractionEnabled:0];
    CGFloat v10 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:-1 scale:27.0];
    [(MRUAssetView *)v7->_assetView setImageSymbolConfiguration:v10];

    [(MediaControlsRoundButton *)v7 addSubview:v7->_assetView];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v11;

    [(UILabel *)v7->_titleLabel setNumberOfLines:3];
    [(UILabel *)v7->_titleLabel setTextAlignment:1];
    LODWORD(v13) = 1051931443;
    [(UILabel *)v7->_titleLabel _setHyphenationFactor:v13];
    double v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v7->_titleLabel setTextColor:v14];

    [(MediaControlsRoundButton *)v7 addSubview:v7->_titleLabel];
    CGFloat v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v7 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MediaControlsRoundButton *)v7 updateContentSizeCategory];
    [(MediaControlsRoundButton *)v7 updateAssetVisualStyling];
    [(MediaControlsRoundButton *)v7 updateLabelVisualStyling];
  }
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(MediaControlsRoundButton *)self assetFrame];
  double v8 = v6;
  double v9 = v7;
  int64_t axis = self->_axis;
  if (axis == 1)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - (v6 + 8.0), height - v7);
    double v8 = v8 + MRUSizeCeilToViewScale(self);
    if (v9 < v13) {
      double v9 = v13;
    }
  }
  else if (!axis)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v6, height - (v7 + 8.0));
    double v11 = MRUSizeCeilToViewScale(self);
    if (v11 >= v8) {
      double v8 = v11;
    }
    double v9 = v9 + v12;
  }
  if (v8 >= width) {
    double v14 = width;
  }
  else {
    double v14 = v8;
  }
  if (v9 >= height) {
    double v15 = height;
  }
  else {
    double v15 = v9;
  }
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
  id v5 = a3;
  [(MRUAssetView *)self->_assetView setAsset:v5];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];
  [(MediaControlsRoundButton *)self setAccessibilityLabel:v5];

  [(MediaControlsRoundButton *)self setNeedsLayout];
}

- (void)setGlyphState:(id)a3
{
  objc_storeStrong((id *)&self->_glyphState, a3);
  id v5 = a3;
  [(MRUAssetView *)self->_assetView setGlyphState:v5];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  double v7 = v5;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUAssetView *)self->_assetView setStylingProvider:v7];
    [(MediaControlsRoundButton *)self updateLabelVisualStyling];
  }
}

- (void)setLabelHidden:(BOOL)a3
{
  self->_labelHidden = a3;
  [(MediaControlsRoundButton *)self updateLabelVisualStyling];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsRoundButton;
  [(MediaControlsRoundButton *)&v4 setHighlighted:a3];
  [(MediaControlsRoundButton *)self updateAssetVisualStyling];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsRoundButton;
  [(MediaControlsRoundButton *)&v4 setSelected:a3];
  [(MediaControlsRoundButton *)self updateAssetVisualStyling];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsRoundButton;
  [(MediaControlsRoundButton *)&v4 setEnabled:a3];
  [(MediaControlsRoundButton *)self updateLabelVisualStyling];
  [(MediaControlsRoundButton *)self updateAssetVisualStyling];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MediaControlsRoundButton *)self assetFrame];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRoundButton;
  return (*MEMORY[0x1E4FB2540] | [(MediaControlsRoundButton *)&v3 accessibilityTraits]) & ~*MEMORY[0x1E4FB2578];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 numberOfTapsRequired];

  if (v6 != 1)
  {
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)visualStylingProviderDidChange:(id)a3
{
  [(MediaControlsRoundButton *)self updateAssetVisualStyling];

  [(MediaControlsRoundButton *)self updateLabelVisualStyling];
}

- (void)updateAssetVisualStyling
{
  if ([(MediaControlsRoundButton *)self isEnabled])
  {
    if ([(MediaControlsRoundButton *)self isHighlighted]) {
      double v3 = 0.2;
    }
    else {
      double v3 = 1.0;
    }
    [(MRUAssetView *)self->_assetView setAlpha:v3];
  }
  else
  {
    [(MRUAssetView *)self->_assetView setAlpha:0.5];
  }
  if (!self->_stylingProvider)
  {
    if ([(MediaControlsRoundButton *)self isSelected]) {
      [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    else {
    id v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    [(MRUAssetView *)self->_assetView setTintColor:v4];
  }
}

- (void)updateLabelVisualStyling
{
  if (self->_labelHidden)
  {
    titleLabel = self->_titleLabel;
    double v4 = 0.0;
LABEL_13:
    [(UILabel *)titleLabel setAlpha:v4];
    return;
  }
  if (!self->_stylingProvider) {
    goto LABEL_9;
  }
  char v5 = [(MediaControlsRoundButton *)self isEnabled];
  stylingProvider = self->_stylingProvider;
  if ((v5 & 1) == 0)
  {
    [(MRUVisualStylingProvider *)stylingProvider applyStyle:0 toView:self->_titleLabel];
    titleLabel = self->_titleLabel;
    goto LABEL_12;
  }
  if (!stylingProvider)
  {
LABEL_9:
    char v8 = [(MediaControlsRoundButton *)self isEnabled];
    titleLabel = self->_titleLabel;
    if (v8)
    {
      double v4 = 1.0;
      goto LABEL_13;
    }
LABEL_12:
    double v4 = 0.5;
    goto LABEL_13;
  }
  BOOL v7 = self->_titleLabel;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:0 toView:v7];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeButtonTitleFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setFont:v3];
}

- (MRUAsset)asset
{
  return self->_asset;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (NSString)title
{
  return self->_title;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
}

- (int64_t)axis
{
  return self->_axis;
}

- (CGSize)assetSize
{
  double width = self->_assetSize.width;
  double height = self->_assetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAssetSize:(CGSize)a3
{
  self->_assetSize = a3;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (MRUAssetView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end