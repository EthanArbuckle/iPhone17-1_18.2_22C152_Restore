@interface MRUOutputDeviceAssetView
- (BSUIEmojiLabelView)titleLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUAssetView)assetView;
- (MRUOutputDeviceAsset)asset;
- (MRUOutputDeviceAssetView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)glyphState;
- (NSString)title;
- (void)layoutSubviews;
- (void)setAsset:(id)a3;
- (void)setAssetView:(id)a3;
- (void)setGlyphState:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisibility;
- (void)updateVisualStyling;
@end

@implementation MRUOutputDeviceAssetView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 54.0;
  double v7 = 54.0 + 8.0;
  v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeTitleFont");
  [v8 lineHeight];
  double v10 = v9;

  if ([(MRUOutputDeviceAsset *)self->_asset type])
  {
    -[BSUIEmojiLabelView sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height - v7);
    double v11 = MRUSizeCeilToViewScale(self);
    if (v11 >= 54.0) {
      double v6 = v11;
    }
  }
  double v12 = v7 + v10 + v10;
  if (v6 >= width) {
    double v13 = width;
  }
  else {
    double v13 = v6;
  }
  if (v12 >= height) {
    double v12 = height;
  }
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (MRUOutputDeviceAssetView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MRUOutputDeviceAssetView;
  v3 = -[MRUOutputDeviceAssetView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUAssetView);
    assetView = v3->_assetView;
    v3->_assetView = v4;

    [(MRUAssetView *)v3->_assetView setPackageScale:1.25];
    double v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:1 scale:44.0];
    [(MRUAssetView *)v3->_assetView setImageSymbolConfiguration:v6];

    [(MRUAssetView *)v3->_assetView setUserInteractionEnabled:0];
    [(MRUAssetView *)v3->_assetView controlCenterApplyPrimaryContentShadow];
    [(MRUOutputDeviceAssetView *)v3 addSubview:v3->_assetView];
    double v7 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E4F4F8B0]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    [(BSUIEmojiLabelView *)v3->_titleLabel setTextAlignment:1];
    [(BSUIEmojiLabelView *)v3->_titleLabel setNumberOfLines:2];
    [(BSUIEmojiLabelView *)v3->_titleLabel controlCenterApplyPrimaryContentShadow];
    [(MRUOutputDeviceAssetView *)v3 addSubview:v3->_titleLabel];
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUOutputDeviceAssetView *)v3 updateContentSizeCategory];
    [(MRUOutputDeviceAssetView *)v3 updateVisibility];
  }
  return v3;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)MRUOutputDeviceAssetView;
  [(MRUOutputDeviceAssetView *)&v23 layoutSubviews];
  [(MRUOutputDeviceAssetView *)self bounds];
  UIRectCenteredXInRect();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (![(MRUOutputDeviceAsset *)self->_asset type])
  {
    UIRectCenteredRect();
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  -[MRUAssetView setFrame:](self->_assetView, "setFrame:", v4, v6, v8, v10);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.double width = v8;
  v24.size.double height = v10;
  CGRectGetMaxY(v24);
  UIRectInset();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  -[BSUIEmojiLabelView sizeThatFits:](self->_titleLabel, "sizeThatFits:", v19, v21);
  MRUSizeCeilToViewScale(self);
  v25.origin.x = v16;
  v25.origin.y = v18;
  v25.size.double width = v20;
  v25.size.double height = v22;
  CGRectGetMinY(v25);
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.double width = v20;
  v26.size.double height = v22;
  CGRectGetWidth(v26);
  UIRectCenteredXInRect();
  -[BSUIEmojiLabelView setFrame:](self->_titleLabel, "setFrame:");
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
  id v5 = a3;
  [(MRUAssetView *)self->_assetView setAsset:v5];

  [(MRUOutputDeviceAssetView *)self updateVisibility];

  [(MRUOutputDeviceAssetView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(BSUIEmojiLabelView *)self->_titleLabel setText:v5];

  [(MRUOutputDeviceAssetView *)self setNeedsLayout];
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
    [(MRUOutputDeviceAssetView *)self updateVisualStyling];
  }
}

- (void)updateVisualStyling
{
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeTitleFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(BSUIEmojiLabelView *)self->_titleLabel setFont:v3];
}

- (void)updateVisibility
{
  int64_t v3 = [(MRUOutputDeviceAsset *)self->_asset type];
  double v4 = 1.0;
  if (!v3) {
    double v4 = 0.0;
  }
  titleLabel = self->_titleLabel;

  [(BSUIEmojiLabelView *)titleLabel setAlpha:v4];
}

- (MRUOutputDeviceAsset)asset
{
  return self->_asset;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BSUIEmojiLabelView)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (MRUAssetView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end