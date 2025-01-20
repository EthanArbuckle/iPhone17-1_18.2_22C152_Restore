@interface MRUAssetView
- (MRUAsset)asset;
- (MRUAssetView)initWithFrame:(CGRect)a3;
- (MRUCAPackageView)packageView;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)glyphState;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (UIImageView)imageView;
- (double)packageScale;
- (void)layoutSubviews;
- (void)setAsset:(id)a3;
- (void)setGlyphState:(id)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPackageScale:(double)a3;
- (void)setPackageView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTintColor:(id)a3;
- (void)updateVisualStyling;
@end

@implementation MRUAssetView

- (MRUAssetView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRUAssetView;
  v3 = -[MRUAssetView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUCAPackageView);
    packageView = v3->_packageView;
    v3->_packageView = v4;

    [(MRUAssetView *)v3 addSubview:v3->_packageView];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v6;

    [(UIImageView *)v3->_imageView setContentMode:4];
    [(UIImageView *)v3->_imageView setUserInteractionEnabled:0];
    [(MRUAssetView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUAssetView;
  [(MRUAssetView *)&v3 layoutSubviews];
  [(MRUAssetView *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  UIRectGetCenter();
  -[MRUCAPackageView setCenter:](self->_packageView, "setCenter:");
}

- (void)setAsset:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_asset, a3);
  v5 = [v8 packageAsset];

  if (v5)
  {
    v6 = [v8 packageAsset];
    [(MRUCAPackageView *)self->_packageView setAsset:v6];

    [(UIImageView *)self->_imageView setImage:0];
  }
  else
  {
    [(MRUCAPackageView *)self->_packageView clear];
    v7 = [v8 image];
    [(UIImageView *)self->_imageView setImage:v7];
  }
  [(MRUAssetView *)self setNeedsLayout];
}

- (void)setGlyphState:(id)a3
{
  objc_storeStrong((id *)&self->_glyphState, a3);
  id v5 = a3;
  [(MRUCAPackageView *)self->_packageView setGlyphState:v5];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUAssetView *)self updateVisualStyling];
    id v5 = v7;
  }
}

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v5];
}

- (void)setPackageScale:(double)a3
{
  self->_packageScale = a3;
  -[MRUCAPackageView setScale:](self->_packageView, "setScale:");
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUAssetView;
  id v4 = a3;
  [(MRUAssetView *)&v5 setTintColor:v4];
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v4, v5.receiver, v5.super_class);
  [(MRUCAPackageView *)self->_packageView setTintColor:v4];
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_imageView];
  stylingProvider = self->_stylingProvider;
  packageView = self->_packageView;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:0 toView:packageView];
}

- (MRUAsset)asset
{
  return self->_asset;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (double)packageScale
{
  return self->_packageScale;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end