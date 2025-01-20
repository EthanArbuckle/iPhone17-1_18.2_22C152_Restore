@interface CDStackedImagesComplicationImageView
- (BOOL)_hasMultipartImages;
- (BOOL)_hasShadowViews;
- (BOOL)_shouldIgnoreTwoPieceImage;
- (BOOL)hasMonochromeImage;
- (BOOL)legibilityEnabled;
- (BOOL)usesLegibility;
- (CDStackedImagesComplicationImageView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKImageProvider)imageProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (UIColor)color;
- (UIColor)contentColor;
- (UIColor)foregroundColor;
- (UIColor)overrideColor;
- (UIColor)shadowColor;
- (double)multicolorAlpha;
- (double)shadowBlur;
- (int64_t)_backgroundFilterStyle;
- (int64_t)_foregroundFilterStyle;
- (void)_enumerateImageViewsWithBlock:(id)a3;
- (void)_enumerateMultipartImageViewsWithBlock:(id)a3;
- (void)_loadImageViewsIfNecessary;
- (void)_updateAlpha;
- (void)_updateColors;
- (void)_updateImageSubviewsMaxSize;
- (void)_updateImages;
- (void)_updateShadow;
- (void)_updateShadowViewImages;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setMulticolorAlpha:(double)a3;
- (void)setOverrideColor:(id)a3;
- (void)setShadowBlur:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setUsesLegibility:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CDStackedImagesComplicationImageView

- (CDStackedImagesComplicationImageView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CDStackedImagesComplicationImageView;
  v3 = -[CDStackedImagesComplicationImageView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263EFD1F0] sharedRenderingContext];
    uint64_t v5 = [v4 device];
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    v3->_shadowBlur = *(double *)MEMORY[0x263F320F0];
    uint64_t v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:*MEMORY[0x263F320E8]];
    shadowColor = v3->_shadowColor;
    v3->_shadowColor = (UIColor *)v7;

    uint64_t v9 = [MEMORY[0x263F825C8] whiteColor];
    foregroundColor = v3->_foregroundColor;
    v3->_foregroundColor = (UIColor *)v9;

    [(CDStackedImagesComplicationImageView *)v3 _updateAlpha];
  }
  return v3;
}

- (void)_enumerateMultipartImageViewsWithBlock:(id)a3
{
  v4 = (void (**)(id, CLKUIColoringImageView *))((char *)a3 + 16);
  uint64_t v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_backgroundImageView);
  (*v4)(v6, (CLKUIColoringImageView *)self->_foregroundAccentImageView);
}

- (void)_enumerateImageViewsWithBlock:(id)a3
{
  v4 = (void (**)(id, CLKUIColoringImageView *))a3;
  [(CDStackedImagesComplicationImageView *)self _enumerateMultipartImageViewsWithBlock:v4];
  v4[2](v4, self->_monochromeImageView);
  v4[2](v4, (CLKUIColoringImageView *)self->_layerMaskImageView);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)CDStackedImagesComplicationImageView;
  [(CDStackedImagesComplicationImageView *)&v10 layoutSubviews];
  [(CDStackedImagesComplicationImageView *)self bounds];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__CDStackedImagesComplicationImageView_layoutSubviews__block_invoke;
  v9[3] = &unk_2644A5460;
  v9[5] = v3;
  v9[6] = v4;
  v9[7] = v5;
  v9[8] = v6;
  v9[4] = self;
  [(CDStackedImagesComplicationImageView *)self _enumerateImageViewsWithBlock:v9];
  if ([(CDStackedImagesComplicationImageView *)self _hasShadowViews])
  {
    double v7 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
    -[UIImageView sizeThatFits:](self->_monochromeShadowView, "sizeThatFits:", *MEMORY[0x263F001B0], v8);
    CLKRectCenteredIntegralRectForDevice();
    -[UIImageView setFrame:](self->_monochromeShadowView, "setFrame:");
    -[UIImageView sizeThatFits:](self->_multipartShadowView, "sizeThatFits:", v7, v8);
    CLKRectCenteredIntegralRectForDevice();
    -[UIImageView setFrame:](self->_multipartShadowView, "setFrame:");
  }
}

void __54__CDStackedImagesComplicationImageView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v4 = a2;
  objc_msgSend(v4, "sizeThatFits:", v2, v3);
  CLKRectCenteredIntegralRectForDevice();
  objc_msgSend(v4, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v17 = 0;
  v18 = (float64x2_t *)&v17;
  uint64_t v19 = 0x3010000000;
  v20 = &unk_21E42A871;
  long long v21 = *MEMORY[0x263F001B0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__CDStackedImagesComplicationImageView_sizeThatFits___block_invoke;
  v15[3] = &unk_2644A5488;
  CGSize v16 = a3;
  v15[4] = &v17;
  [(CDStackedImagesComplicationImageView *)self _enumerateMultipartImageViewsWithBlock:v15];
  -[CLKUIColoringImageView sizeThatFits:](self->_monochromeImageView, "sizeThatFits:", width, height);
  v7.f64[1] = v6;
  v18[2] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v7, v18[2]), (int8x16_t)v7, (int8x16_t)v18[2]);
  -[_CDComplicationImageViewProviderImageView sizeThatFits:](self->_layerMaskImageView, "sizeThatFits:", width, height);
  objc_super v10 = v18;
  if (v18[2].f64[0] >= v8) {
    double v11 = v18[2].f64[0];
  }
  else {
    double v11 = v8;
  }
  if (v18[2].f64[1] >= v9) {
    double v12 = v18[2].f64[1];
  }
  else {
    double v12 = v9;
  }
  v18[2].f64[0] = v11;
  v10[2].f64[1] = v12;
  _Block_object_dispose(&v17, 8);
  double v13 = v11;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

float64x2_t __53__CDStackedImagesComplicationImageView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v3 = *(float64x2_t **)(*(void *)(a1 + 32) + 8);
  v5.f64[1] = v4;
  float64x2_t result = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, v3[2]), (int8x16_t)v5, (int8x16_t)v3[2]);
  v3[2] = result;
  return result;
}

- (void)_updateImageSubviewsMaxSize
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3010000000;
  v9[3] = &unk_21E42A871;
  long long v10 = *MEMORY[0x263F001B0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke;
  v8[3] = &unk_2644A54B0;
  v8[4] = v9;
  [(CDStackedImagesComplicationImageView *)self _enumerateMultipartImageViewsWithBlock:v8];
  [(CLKImageProvider *)self->_imageProvider maxSize];
  CLKFloorForDevice();
  double v4 = v3;
  CLKFloorForDevice();
  double v6 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke_2;
  v7[3] = &__block_descriptor_48_e21_v16__0__UIImageView_8l;
  *(double *)&v7[4] = v4;
  *(double *)&v7[5] = v5;
  [(CDStackedImagesComplicationImageView *)self _enumerateMultipartImageViewsWithBlock:v7];
  -[CLKUIColoringImageView setMaxSize:](self->_monochromeImageView, "setMaxSize:", v4, v6);
  -[_CDComplicationImageViewProviderImageView setMaxSize:](self->_layerMaskImageView, "setMaxSize:", v4, v6);
  _Block_object_dispose(v9, 8);
}

float64x2_t __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 image];
  [v4 size];
  float64_t v10 = v6;
  float64_t v11 = v5;

  [v3 sizeToFit];
  float64x2_t v7 = *(float64x2_t **)(*(void *)(a1 + 32) + 8);
  v8.f64[0] = v11;
  v8.f64[1] = v10;
  float64x2_t result = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v7[2]), (int8x16_t)v8, (int8x16_t)v7[2]);
  v7[2] = result;
  return result;
}

void __67__CDStackedImagesComplicationImageView__updateImageSubviewsMaxSize__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "setMaxSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  }
}

- (void)_updateColors
{
  if ([(CDStackedImagesComplicationImageView *)self _hasMultipartImages]
    || self->_multicolorAlpha != 1.0)
  {
    double v13 = self->_color;
  }
  else
  {
    id v3 = [(CLKImageProvider *)self->_imageProvider tintColor];
    color = v3;
    if (!v3) {
      color = self->_color;
    }
    double v13 = color;
  }
  double v5 = self->_foregroundColor;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(CLKImageProvider *)self->_imageProvider secondaryTintColor];
    float64x2_t v7 = (void *)v6;
    if (v6) {
      float64x2_t v8 = (void *)v6;
    }
    else {
      float64x2_t v8 = v5;
    }
    double v9 = v8;

    double v5 = v9;
  }
  [(CLKUIColoringImageView *)self->_foregroundImageView setColor:v5];
  backgroundImageView = self->_backgroundImageView;
  float64_t v11 = [(CLKImageProvider *)self->_imageProvider tintColor];
  double v12 = v11;
  if (!v11) {
    double v12 = self->_color;
  }
  [(CLKUIColoringImageView *)backgroundImageView setColor:v12];

  [(CLKUIColoringImageView *)self->_monochromeImageView setColor:v13];
}

- (void)_updateShadowViewImages
{
  self->_isShadowImagesStale = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (void *)MEMORY[0x263F08D40];
    -[CLKUIColoringImageView sizeThatFits:](self->_monochromeImageView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    objc_msgSend(v3, "valueWithCGSize:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    double v4 = CLKUIShadowImageFromView();
    [(UIImageView *)self->_monochromeShadowView setImage:v4];
  }
  else
  {
    double v4 = [(CLKUIColoringImageView *)self->_monochromeImageView image];
    double v5 = CLKUIShadowImage();
    [(UIImageView *)self->_monochromeShadowView setImage:v5];

    id v7 = 0;
  }

  uint64_t v6 = CLKUIShadowImage();
  [(UIImageView *)self->_multipartShadowView setImage:v6];
}

- (void)_updateImages
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CLKUIColoringImageView *)self->_monochromeImageView setImageProvider:self->_imageProvider];
    [(CLKUIColoringImageView *)self->_foregroundImageView setImageProvider:self->_imageProvider];
    [(CLKUIColoringImageView *)self->_backgroundImageView setImageProvider:self->_imageProvider];
  }
  else
  {
    if (![(CDStackedImagesComplicationImageView *)self _shouldIgnoreTwoPieceImage])
    {
      foregroundImageView = self->_foregroundImageView;
      double v4 = [(CLKImageProvider *)self->_imageProvider twoPieceImageForeground];
      [(CLKUIColoringImageView *)foregroundImageView setImage:v4];

      backgroundImageView = self->_backgroundImageView;
      uint64_t v6 = [(CLKImageProvider *)self->_imageProvider twoPieceImageBackground];
      [(CLKUIColoringImageView *)backgroundImageView setImage:v6];
    }
    monochromeImageView = self->_monochromeImageView;
    float64x2_t v8 = [(CLKImageProvider *)self->_imageProvider onePieceImage];
    [(CLKUIColoringImageView *)monochromeImageView setImage:v8];

    foregroundAccentImageView = self->_foregroundAccentImageView;
    float64_t v10 = [(CLKImageProvider *)self->_imageProvider foregroundAccentImage];
    [(UIImageView *)foregroundAccentImageView setImage:v10];

    layerMaskImageView = self->_layerMaskImageView;
    double v12 = [(CLKImageProvider *)self->_imageProvider onePieceImage];
    [(_CDComplicationImageViewProviderImageView *)layerMaskImageView setImage:v12];
  }
  if ([(CDStackedImagesComplicationImageView *)self _hasShadowViews])
  {
    if ([(CDStackedImagesComplicationImageView *)self _hasMultipartImages])
    {
      uint64_t v22 = 0;
      v23 = (CGRect *)&v22;
      uint64_t v24 = 0x4010000000;
      v25 = &unk_21E42A871;
      long long v13 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      long long v26 = *MEMORY[0x263F001A8];
      long long v27 = v13;
      uint64_t v18 = 0;
      uint64_t v19 = (CGFloat *)&v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __53__CDStackedImagesComplicationImageView__updateImages__block_invoke;
      v17[3] = &unk_2644A54F8;
      v17[4] = &v18;
      v17[5] = &v22;
      [(CDStackedImagesComplicationImageView *)self _enumerateMultipartImageViewsWithBlock:v17];
      if (CGRectIsEmpty(v23[1]))
      {
        double v14 = 0;
      }
      else
      {
        UIGraphicsBeginImageContextWithOptions(v23[1].size, 0, v19[3]);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __53__CDStackedImagesComplicationImageView__updateImages__block_invoke_2;
        v16[3] = &unk_2644A54F8;
        v16[4] = &v22;
        v16[5] = &v18;
        [(CDStackedImagesComplicationImageView *)self _enumerateMultipartImageViewsWithBlock:v16];
        UIGraphicsGetImageFromCurrentImageContext();
        double v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
      }
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
    }
    else
    {
      double v14 = 0;
    }
    multipartShadowViewSource = self->_multipartShadowViewSource;
    self->_multipartShadowViewSource = v14;

    if (self->_isUsingLegibility) {
      [(CDStackedImagesComplicationImageView *)self _updateShadowViewImages];
    }
    else {
      self->_isShadowImagesStale = 1;
    }
    [(CDStackedImagesComplicationImageView *)self setNeedsLayout];
  }
}

void __53__CDStackedImagesComplicationImageView__updateImages__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  double v5 = [v4 image];
  [v5 scale];
  double v7 = v6;

  if (v3 >= v7) {
    double v8 = v3;
  }
  else {
    double v8 = v7;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
  float64_t v10 = [v4 image];
  [v10 size];
  double v12 = v11;

  if (v9 < v12) {
    double v9 = v12;
  }
  double v13 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56);
  double v14 = [v4 image];

  [v14 size];
  double v16 = v15;

  if (v13 >= v16) {
    double v17 = v13;
  }
  else {
    double v17 = v16;
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v18 + 32) = *MEMORY[0x263F00148];
  *(double *)(v18 + 48) = v9;
  *(double *)(v18 + 56) = v17;
}

void __53__CDStackedImagesComplicationImageView__updateImages__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 image];
  [v4 size];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  UIRectCenteredIntegralRectScale();
  [v4 drawInRect:v3];
}

- (void)_updateAlpha
{
  double v3 = 0.0;
  if ([(CDStackedImagesComplicationImageView *)self _hasMultipartImages])
  {
    [(CDStackedImagesComplicationImageView *)self multicolorAlpha];
    double v3 = v4;
  }
  [(CLKUIColoringImageView *)self->_monochromeImageView setAlpha:1.0 - v3];
  [(UIImageView *)self->_monochromeShadowView setAlpha:1.0 - v3];
  [(UIImageView *)self->_multipartShadowView setAlpha:v3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__CDStackedImagesComplicationImageView__updateAlpha__block_invoke;
  v5[3] = &__block_descriptor_40_e21_v16__0__UIImageView_8l;
  *(double *)&v5[4] = v3;
  [(CDStackedImagesComplicationImageView *)self _enumerateMultipartImageViewsWithBlock:v5];
}

uint64_t __52__CDStackedImagesComplicationImageView__updateAlpha__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

- (void)_updateShadow
{
  if (self->_isUsingLegibility)
  {
    if ([(CDStackedImagesComplicationImageView *)self _hasShadowViews])
    {
      [(UIImageView *)self->_multipartShadowView setHidden:0];
      [(UIImageView *)self->_monochromeShadowView setHidden:0];
    }
    else
    {
      double v4 = (UIImageView *)objc_opt_new();
      multipartShadowView = self->_multipartShadowView;
      self->_multipartShadowView = v4;

      double v6 = (UIImageView *)objc_opt_new();
      monochromeShadowView = self->_monochromeShadowView;
      self->_monochromeShadowView = v6;

      [(CDStackedImagesComplicationImageView *)self addSubview:self->_multipartShadowView];
      [(CDStackedImagesComplicationImageView *)self addSubview:self->_monochromeShadowView];
      [(CDStackedImagesComplicationImageView *)self sendSubviewToBack:self->_multipartShadowView];
      [(CDStackedImagesComplicationImageView *)self sendSubviewToBack:self->_monochromeShadowView];
      [(CDStackedImagesComplicationImageView *)self _updateImages];
      [(CDStackedImagesComplicationImageView *)self _updateShadowViewImages];
    }
    [(CDStackedImagesComplicationImageView *)self setClipsToBounds:0];
  }
  else
  {
    [(UIImageView *)self->_multipartShadowView setHidden:1];
    double v3 = self->_monochromeShadowView;
    [(UIImageView *)v3 setHidden:1];
  }
}

- (BOOL)_hasMultipartImages
{
  BOOL v3 = [(CDStackedImagesComplicationImageView *)self _shouldIgnoreTwoPieceImage];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [(CLKImageProvider *)self->_imageProvider isTwoPiece];
  }
  else {
    char v4 = 0;
  }
  double v5 = [(CLKImageProvider *)self->_imageProvider twoPieceImageBackground];
  if (v5)
  {
    double v6 = [(CLKImageProvider *)self->_imageProvider twoPieceImageForeground];

    if (v6) {
      char v4 = 1;
    }
  }

  if (!v3 && (v4 & 1) != 0) {
    return 1;
  }
  double v8 = [(CLKImageProvider *)self->_imageProvider foregroundAccentImage];
  BOOL v7 = v8 != 0;

  return v7;
}

- (BOOL)_hasShadowViews
{
  return self->_multipartShadowView || self->_monochromeShadowView != 0;
}

- (void)_loadImageViewsIfNecessary
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    int v4 = [(CLKImageProvider *)self->_imageProvider isTwoPiece];
  }
  else {
    int v4 = 0;
  }
  double v5 = [(CLKImageProvider *)self->_imageProvider twoPieceImageBackground];

  double v6 = [(CLKImageProvider *)self->_imageProvider twoPieceImageForeground];
  if (v6) {
    int v7 = 1;
  }
  else {
    int v7 = v4;
  }

  double v8 = [(CLKImageProvider *)self->_imageProvider onePieceImage];
  BOOL v9 = v8 != 0;

  backgroundImageView = self->_backgroundImageView;
  if (v5) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v4 == 0;
  }
  if (v11)
  {
    uint64_t v14 = 1;
  }
  else
  {
    if (!backgroundImageView)
    {
      double v12 = (CLKUIColoringImageView *)objc_opt_new();
      double v13 = self->_backgroundImageView;
      self->_backgroundImageView = v12;

      [(CDStackedImagesComplicationImageView *)self addSubview:self->_backgroundImageView];
      backgroundImageView = self->_backgroundImageView;
    }
    uint64_t v14 = 0;
  }
  [(CLKUIColoringImageView *)backgroundImageView setHidden:v14];
  char v15 = isKindOfClass | v9;
  foregroundImageView = self->_foregroundImageView;
  if (v7)
  {
    if (!foregroundImageView)
    {
      double v17 = (CLKUIColoringImageView *)objc_opt_new();
      uint64_t v18 = self->_foregroundImageView;
      self->_foregroundImageView = v17;

      [(CDStackedImagesComplicationImageView *)self addSubview:self->_foregroundImageView];
      foregroundImageView = self->_foregroundImageView;
    }
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  [(CLKUIColoringImageView *)foregroundImageView setHidden:v19];
  if ((v15 & 1) == 0) {
    goto LABEL_24;
  }
  if ([(CLKImageProvider *)self->_imageProvider useOnePieceAsLayerMask])
  {
    if (!self->_layerMaskImageView)
    {
      uint64_t v20 = (_CDComplicationImageViewProviderImageView *)objc_opt_new();
      layerMaskImageView = self->_layerMaskImageView;
      self->_layerMaskImageView = v20;

      [(CDStackedImagesComplicationImageView *)self addSubview:self->_layerMaskImageView];
    }
LABEL_24:
    monochromeImageView = self->_monochromeImageView;
    uint64_t v23 = 1;
    goto LABEL_28;
  }
  monochromeImageView = self->_monochromeImageView;
  if (!monochromeImageView)
  {
    uint64_t v24 = (CLKUIColoringImageView *)objc_opt_new();
    v25 = self->_monochromeImageView;
    self->_monochromeImageView = v24;

    [(CDStackedImagesComplicationImageView *)self addSubview:self->_monochromeImageView];
    monochromeImageView = self->_monochromeImageView;
  }
  uint64_t v23 = 0;
LABEL_28:
  [(CLKUIColoringImageView *)monochromeImageView setHidden:v23];
  long long v26 = [(CLKImageProvider *)self->_imageProvider foregroundAccentImage];

  foregroundAccentImageView = self->_foregroundAccentImageView;
  if (v26)
  {
    if (!foregroundAccentImageView)
    {
      v28 = (UIImageView *)objc_opt_new();
      v29 = self->_foregroundAccentImageView;
      self->_foregroundAccentImageView = v28;

      [(CDStackedImagesComplicationImageView *)self addSubview:self->_foregroundAccentImageView];
    }
  }
  else
  {
    [(UIImageView *)foregroundAccentImageView removeFromSuperview];
    v30 = self->_foregroundAccentImageView;
    self->_foregroundAccentImageView = 0;
  }
  [(CLKUIColoringImageView *)self->_backgroundImageView setSymbolImageType:3];
  v31 = self->_foregroundImageView;
  [(CLKUIColoringImageView *)v31 setSymbolImageType:2];
}

- (BOOL)_shouldIgnoreTwoPieceImage
{
  p_filterProvider = &self->_filterProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_filterProvider);
  char v7 = [v6 viewShouldIgnoreTwoPieceImage:self];

  return v7;
}

- (BOOL)hasMonochromeImage
{
  double v2 = [(CLKUIColoringImageView *)self->_monochromeImageView image];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setColor:(id)a3
{
  char v5 = (UIColor *)a3;
  p_color = &self->_color;
  if (self->_color != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_color, a3);
    p_color = (UIColor **)[(CDStackedImagesComplicationImageView *)self _updateColors];
    char v5 = v7;
  }
  MEMORY[0x270F9A758](p_color, v5);
}

- (void)setForegroundColor:(id)a3
{
  char v5 = (UIColor *)a3;
  p_foregroundColor = &self->_foregroundColor;
  if (self->_foregroundColor != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_foregroundColor, a3);
    p_foregroundColor = (UIColor **)[(CDStackedImagesComplicationImageView *)self _updateColors];
    char v5 = v7;
  }
  MEMORY[0x270F9A758](p_foregroundColor, v5);
}

- (void)setImageProvider:(id)a3
{
  char v5 = (CLKImageProvider *)a3;
  p_imageProvider = &self->_imageProvider;
  if (self->_imageProvider != v5)
  {
    float64_t v10 = v5;
    objc_storeStrong((id *)p_imageProvider, a3);
    [(CDStackedImagesComplicationImageView *)self _enumerateImageViewsWithBlock:&__block_literal_global_3];
    [(CDStackedImagesComplicationImageView *)self _loadImageViewsIfNecessary];
    [(CDStackedImagesComplicationImageView *)self _updateAlpha];
    [(CDStackedImagesComplicationImageView *)self _updateImages];
    [(CDStackedImagesComplicationImageView *)self _updateColors];
    [(CDStackedImagesComplicationImageView *)self _updateShadow];
    if ([(CLKImageProvider *)v10 isForegroundAccentImageTinted])
    {
      char v7 = [(CLKUIColoringImageView *)self->_foregroundImageView layer];
      double v8 = [v7 filters];
      BOOL v9 = [(UIImageView *)self->_foregroundAccentImageView layer];
      [v9 setFilters:v8];
    }
    else
    {
      char v7 = [(UIImageView *)self->_foregroundAccentImageView layer];
      [v7 setFilters:0];
    }

    if (self->_isUsingLegibility) {
      [(CDStackedImagesComplicationImageView *)self _updateShadowViewImages];
    }
    else {
      self->_isShadowImagesStale = 1;
    }
    [(CDStackedImagesComplicationImageView *)self _updateImageSubviewsMaxSize];
    p_imageProvider = (CLKImageProvider **)[(CDStackedImagesComplicationImageView *)self sizeToFit];
    char v5 = v10;
  }
  MEMORY[0x270F9A758](p_imageProvider, v5);
}

void __57__CDStackedImagesComplicationImageView_setImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v2, "setMaxSize:", 1.79769313e308, 1.79769313e308);
  }
}

- (void)setMulticolorAlpha:(double)a3
{
  if (self->_multicolorAlpha != a3)
  {
    self->_multicolorAlpha = a3;
    [(CDStackedImagesComplicationImageView *)self _updateAlpha];
    [(CDStackedImagesComplicationImageView *)self _updateColors];
  }
}

- (UIColor)contentColor
{
  return 0;
}

- (UIColor)overrideColor
{
  overrideColor = self->_overrideColor;
  if (overrideColor)
  {
    BOOL v3 = overrideColor;
  }
  else
  {
    BOOL v3 = [(CLKImageProvider *)self->_imageProvider tintColor];
  }
  return v3;
}

- (BOOL)usesLegibility
{
  return self->_isUsingLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  if (self->_isUsingLegibility != a3)
  {
    self->_isUsingLegibility = a3;
    [(CDStackedImagesComplicationImageView *)self _updateShadow];
    if (self->_isShadowImagesStale)
    {
      [(CDStackedImagesComplicationImageView *)self _updateShadowViewImages];
    }
  }
}

- (double)shadowBlur
{
  return self->_shadowBlur;
}

- (void)setShadowBlur:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_shadowBlur = a3;
    if (self->_isUsingLegibility)
    {
      [(CDStackedImagesComplicationImageView *)self _updateShadowViewImages];
    }
    else
    {
      self->_isShadowImagesStale = 1;
    }
  }
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_shadowColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowColor, a3);
    if (self->_isUsingLegibility) {
      [(CDStackedImagesComplicationImageView *)self _updateShadowViewImages];
    }
    else {
      self->_isShadowImagesStale = 1;
    }
  }
}

- (BOOL)legibilityEnabled
{
  return self->_isUsingLegibility;
}

- (int64_t)_backgroundFilterStyle
{
  return 0;
}

- (int64_t)_foregroundFilterStyle
{
  return 2;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  char v7 = objc_msgSend(WeakRetained, "filtersForView:style:fraction:", self, -[CDStackedImagesComplicationImageView _backgroundFilterStyle](self, "_backgroundFilterStyle"), a3);

  if (v7)
  {
    double v8 = [(CLKUIColoringImageView *)self->_backgroundImageView layer];
    [v8 setFilters:v7];

    BOOL v9 = [(CLKUIColoringImageView *)self->_monochromeImageView layer];
    [v9 setFilters:v7];

    if (isKindOfClass)
    {
      float64_t v10 = [(CLKUIColoringImageView *)self->_foregroundImageView layer];
      [v10 setFilters:v7];
    }
    if ([(CLKImageProvider *)self->_imageProvider useOnePieceAsLayerMask])
    {
      id v11 = objc_loadWeakRetained((id *)&self->_filterProvider);
      double v12 = [v11 colorForView:self accented:0];

      id v13 = objc_loadWeakRetained((id *)&self->_filterProvider);
      uint64_t v14 = [v13 colorForView:self accented:1];

      char v15 = _CDLayerMaskColorizationFilter(v12, v14);
      v24[0] = v15;
      double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      double v17 = [(_CDComplicationImageViewProviderImageView *)self->_layerMaskImageView layer];
      [v17 setFilters:v16];
    }
  }
  if ((isKindOfClass & 1) == 0)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_filterProvider);
    uint64_t v19 = objc_msgSend(v18, "filtersForView:style:fraction:", self, -[CDStackedImagesComplicationImageView _foregroundFilterStyle](self, "_foregroundFilterStyle"), a3);

    if (v19)
    {
      uint64_t v20 = [(CLKUIColoringImageView *)self->_foregroundImageView layer];
      [v20 setFilters:v19];

      LODWORD(v20) = [(CLKImageProvider *)self->_imageProvider isForegroundAccentImageTinted];
      uint64_t v21 = [(UIImageView *)self->_foregroundAccentImageView layer];
      uint64_t v22 = v21;
      if (v20) {
        uint64_t v23 = v19;
      }
      else {
        uint64_t v23 = 0;
      }
      [v21 setFilters:v23];
    }
  }
}

- (void)updateMonochromeColor
{
  v22[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  id v5 = objc_msgSend(WeakRetained, "filtersForView:style:", self, -[CDStackedImagesComplicationImageView _backgroundFilterStyle](self, "_backgroundFilterStyle"));

  if (v5)
  {
    id v6 = [(CLKUIColoringImageView *)self->_backgroundImageView layer];
    [v6 setFilters:v5];

    char v7 = [(CLKUIColoringImageView *)self->_monochromeImageView layer];
    [v7 setFilters:v5];

    if (isKindOfClass)
    {
      double v8 = [(CLKUIColoringImageView *)self->_foregroundImageView layer];
      [v8 setFilters:v5];
    }
    if ([(CLKImageProvider *)self->_imageProvider useOnePieceAsLayerMask])
    {
      id v9 = objc_loadWeakRetained((id *)&self->_filterProvider);
      float64_t v10 = [v9 colorForView:self accented:0];

      id v11 = objc_loadWeakRetained((id *)&self->_filterProvider);
      double v12 = [v11 colorForView:self accented:1];

      id v13 = _CDLayerMaskColorizationFilter(v10, v12);
      v22[0] = v13;
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      char v15 = [(_CDComplicationImageViewProviderImageView *)self->_layerMaskImageView layer];
      [v15 setFilters:v14];
    }
  }
  if ((isKindOfClass & 1) == 0)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_filterProvider);
    double v17 = objc_msgSend(v16, "filtersForView:style:", self, -[CDStackedImagesComplicationImageView _foregroundFilterStyle](self, "_foregroundFilterStyle"));

    if (v17)
    {
      id v18 = [(CLKUIColoringImageView *)self->_foregroundImageView layer];
      [v18 setFilters:v17];

      LODWORD(v18) = [(CLKImageProvider *)self->_imageProvider isForegroundAccentImageTinted];
      uint64_t v19 = [(UIImageView *)self->_foregroundAccentImageView layer];
      uint64_t v20 = v19;
      if (v18) {
        uint64_t v21 = v17;
      }
      else {
        uint64_t v21 = 0;
      }
      [v19 setFilters:v21];
    }
  }
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setOverrideColor:(id)a3
{
}

- (double)multicolorAlpha
{
  return self->_multicolorAlpha;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_layerMaskImageView, 0);
  objc_storeStrong((id *)&self->_multipartShadowViewSource, 0);
  objc_storeStrong((id *)&self->_multipartShadowView, 0);
  objc_storeStrong((id *)&self->_monochromeShadowView, 0);
  objc_storeStrong((id *)&self->_monochromeImageView, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end