@interface DBIconView
+ (BOOL)_iconLabelsRequireBackground;
+ (BOOL)allowsLabelAccessoryView;
+ (BOOL)supportsCursorInteraction;
+ (BOOL)supportsDragInteraction;
+ (BOOL)supportsPreviewInteraction;
+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3;
+ (DBEnvironmentConfiguration)environmentConfiguration;
+ (UIEdgeInsets)minimumInterIconSpacing;
+ (double)_labelHeight;
+ (double)maximumIconViewHeightForIconImageSize:(CGSize)a3;
+ (id)defaultIconLocation;
+ (id)focusColorForTraitCollection:(id)a3;
+ (id)focusTextColorForTraitCollection:(id)a3;
+ (id)labelFontForTraitCollection:(id)a3;
+ (id)textColorForTraitCollection:(id)a3;
+ (void)_updateCharacteristicsWithTraitCollection:(id)a3;
+ (void)setEnvironmentConfiguration:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)shadowHidden;
- (CGRect)_frameForLabelHighlight;
- (DBIconDropShadowProvider)dropShadowProvider;
- (DBIconLabelBackdropView)labelLegibilityView;
- (DBIconView)initWithConfigurationOptions:(unint64_t)a3 listLayoutProvider:(id)a4;
- (UIView)dropShadowView;
- (double)_labelBaselineOffsetFromImage;
- (id)labelFont;
- (unint64_t)accessibilityTraits;
- (void)_configureIconImageView:(id)a3;
- (void)_refreshDropShadowWithIconImage:(id)a3;
- (void)_updateLabel;
- (void)_updateLabelAnimated:(BOOL)a3;
- (void)_wallpaperChanged:(id)a3;
- (void)configureLabelImageParametersBuilder:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDropShadowProvider:(id)a3;
- (void)setDropShadowView:(id)a3;
- (void)setLabelHidden:(BOOL)a3;
- (void)setLabelLegibilityView:(id)a3;
- (void)setShadowHidden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBIconView

- (DBIconView)initWithConfigurationOptions:(unint64_t)a3 listLayoutProvider:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)DBIconView;
  v4 = [(DBIconView *)&v13 initWithConfigurationOptions:a3 listLayoutProvider:a4];
  if (v4)
  {
    v5 = [(id)objc_opt_class() environmentConfiguration];
    v6 = [v5 wallpaperPreferences];

    v7 = [DBIconLabelBackdropView alloc];
    v8 = [v6 currentWallpaper];
    uint64_t v9 = [(DBIconLabelBackdropView *)v7 initWithWallpaper:v8];
    labelLegibilityView = v4->_labelLegibilityView;
    v4->_labelLegibilityView = (DBIconLabelBackdropView *)v9;

    [(DBIconView *)v4 addSubview:v4->_labelLegibilityView];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v4 selector:sel__wallpaperChanged_ name:*MEMORY[0x263F31418] object:0];
  }
  return v4;
}

+ (void)setEnvironmentConfiguration:(id)a3
{
}

+ (DBEnvironmentConfiguration)environmentConfiguration
{
  return (DBEnvironmentConfiguration *)(id)__environmentConfiguration;
}

+ (double)maximumIconViewHeightForIconImageSize:(CGSize)a3
{
  double height = a3.height;
  objc_msgSend(a1, "minimumInterIconSpacing", a3.width);
  double v7 = height + v5 * 0.5 + v6 * 0.5;
  [a1 _labelHeight];
  return v8 + v7;
}

+ (id)defaultIconLocation
{
  return (id)*MEMORY[0x263F79320];
}

+ (BOOL)allowsLabelAccessoryView
{
  return 0;
}

+ (UIEdgeInsets)minimumInterIconSpacing
{
  double v2 = 5.0;
  double v3 = 5.0;
  double v4 = 5.0;
  double v5 = 5.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)a3
{
  CGFloat v4 = a3.width + 28.0 + -8.0;
  [a1 minimumInterIconSpacing];
  double v7 = v4 - (v5 * 0.5 + v6 * 0.5);
  [a1 _labelHeight];
  double v9 = v8;
  double v10 = v7;
  result.double height = v9;
  result.width = v10;
  return result;
}

+ (double)_labelHeight
{
  return 20.0;
}

+ (BOOL)supportsDragInteraction
{
  return 0;
}

+ (BOOL)supportsPreviewInteraction
{
  return 0;
}

+ (BOOL)supportsCursorInteraction
{
  return 0;
}

+ (BOOL)_iconLabelsRequireBackground
{
  double v2 = [a1 environmentConfiguration];
  double v3 = [v2 wallpaperPreferences];
  CGFloat v4 = [v3 currentWallpaper];
  double v5 = [v4 traits];
  char v6 = [v5 iconLabelsRequireBackground];

  return v6;
}

- (CGRect)_frameForLabelHighlight
{
  v19.receiver = self;
  v19.super_class = (Class)DBIconView;
  [(DBIconView *)&v19 _frameForLabelHighlight];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(DBIconView *)self iconContentScale];
  double v11 = DBIconImageInfoForScale();
  objc_msgSend((id)objc_opt_class(), "maxLabelSizeForIconImageSize:", v11, v12);
  double Width = v13;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.double height = v10;
  if (Width >= CGRectGetWidth(v20))
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.double height = v10;
    double Width = CGRectGetWidth(v21);
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = Width;
  double v18 = v10;
  result.size.double height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)labelFont
{
  double v3 = objc_opt_class();
  CGFloat v4 = [(DBIconView *)self traitCollection];
  double v5 = [v3 labelFontForTraitCollection:v4];

  return v5;
}

- (void)setLabelHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DBIconView;
  -[DBIconView setLabelHidden:](&v6, sel_setLabelHidden_);
  double v5 = [(DBIconView *)self labelLegibilityView];
  [v5 setHidden:v3];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  [(DBIconView *)self _updateLabel];
  objc_super v6 = [v5 nextFocusedView];

  if (v6 == self)
  {
    id v7 = [(DBIconView *)self superview];
    [v7 bringSubviewToFront:self];
  }
}

- (void)configureLabelImageParametersBuilder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DBIconView;
  [(DBIconView *)&v37 configureLabelImageParametersBuilder:v4];
  id v5 = [(DBIconView *)self location];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F79320]];

  if (v6) {
    objc_msgSend(v4, "setTextInsets:", 2.0, 4.0, 2.0, 4.0);
  }
  id v7 = objc_opt_class();
  CGFloat v8 = [(DBIconView *)self traitCollection];
  double v9 = [v7 labelFontForTraitCollection:v8];
  [v4 setFont:v9];

  CGFloat v10 = objc_opt_class();
  double v11 = [(DBIconView *)self traitCollection];
  double v12 = [v10 textColorForTraitCollection:v11];
  [v4 setTextColor:v12];

  uint64_t v13 = [(DBIconView *)self isFocused];
  char v14 = [(id)objc_opt_class() _iconLabelsRequireBackground];
  if (v13)
  {
    if ((v14 & 1) == 0)
    {
      double v15 = objc_opt_class();
      double v16 = [(DBIconView *)self traitCollection];
      double v17 = [v15 focusColorForTraitCollection:v16];
      [v4 setFocusHighlightColor:v17];
    }
    double v18 = objc_opt_class();
    objc_super v19 = [(DBIconView *)self traitCollection];
    CGRect v20 = [v18 focusTextColorForTraitCollection:v19];
    [v4 setTextColor:v20];
  }
  CGRect v21 = [(DBIconView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v21 scale];
    objc_msgSend(v4, "setScale:");
  }
  v22 = [(id)objc_opt_class() environmentConfiguration];
  v23 = [v22 wallpaperPreferences];
  v24 = [v23 currentWallpaper];
  v25 = [(DBIconView *)self labelLegibilityView];
  [v25 setWallpaper:v24];

  v26 = [(DBIconView *)self labelLegibilityView];
  [v26 setHighlighted:v13];

  [(DBIconView *)self _frameForLabelHighlight];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [(DBIconView *)self labelLegibilityView];
  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

  v36 = [(DBIconView *)self iconImageSnapshot];
  [(DBIconView *)self _refreshDropShadowWithIconImage:v36];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)DBIconView;
  [(DBIconView *)&v3 prepareForReuse];
  [(DBIconView *)self _updateLabel];
  [(DBIconView *)self _refreshDropShadowWithIconImage:0];
}

- (double)_labelBaselineOffsetFromImage
{
  return 18.0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DBIconView;
  [(DBIconView *)&v7 traitCollectionDidChange:a3];
  id v4 = objc_opt_class();
  id v5 = [(DBIconView *)self traitCollection];
  [v4 _updateCharacteristicsWithTraitCollection:v5];

  int v6 = [(DBIconView *)self iconImageSnapshot];
  [(DBIconView *)self _refreshDropShadowWithIconImage:v6];

  [(DBIconView *)self _updateLabel];
}

- (void)_updateLabel
{
}

- (void)_updateLabelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F82DA0] _currentTraitCollection];
  int v6 = [(DBIconView *)self traitCollection];
  [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v6];

  v7.receiver = self;
  v7.super_class = (Class)DBIconView;
  [(DBIconView *)&v7 _updateLabelAnimated:v3];
  [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v5];
}

- (void)_configureIconImageView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBIconView;
  [(DBIconView *)&v5 _configureIconImageView:a3];
  id v4 = [(DBIconView *)self iconImageSnapshot];
  [(DBIconView *)self _refreshDropShadowWithIconImage:v4];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)DBIconView;
  [(DBIconView *)&v19 layoutSubviews];
  BOOL v3 = [(DBIconView *)self dropShadowView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    objc_super v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(DBIconView *)self setDropShadowView:v5];

    int v6 = [(DBIconView *)self dropShadowView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    objc_super v7 = [(DBIconView *)self dropShadowView];
    [(DBIconView *)self insertSubview:v7 atIndex:0];

    CGFloat v8 = [(DBIconView *)self dropShadowView];
    objc_msgSend(v8, "setHidden:", -[DBIconView shadowHidden](self, "shadowHidden"));

    double v9 = [(DBIconView *)self iconImageSnapshot];
    [(DBIconView *)self _refreshDropShadowWithIconImage:v9];
  }
  [(DBIconView *)self _frameForLabelHighlight];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(DBIconView *)self labelLegibilityView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
}

- (void)_refreshDropShadowWithIconImage:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(DBIconView *)self dropShadowProvider];

  if (!v5)
  {
    int v6 = objc_alloc_init(DBIconDropShadowProvider);
    [(DBIconView *)self setDropShadowProvider:v6];
  }
  objc_super v7 = [(DBIconView *)self dropShadowProvider];
  id v8 = [v7 iconImage];

  if (v8 != v4)
  {
    double v9 = [(DBIconView *)self dropShadowProvider];
    [v9 setIconImage:v4];
  }
  double v10 = [(DBIconView *)self traitCollection];
  if ([(id)objc_opt_class() _iconLabelsRequireBackground])
  {
    double v11 = (void *)MEMORY[0x263F82DA0];
    v21[0] = v10;
    double v12 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
    v21[1] = v12;
    double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    uint64_t v14 = [v11 traitCollectionWithTraitsFromCollections:v13];

    double v10 = (void *)v14;
  }
  objc_initWeak(&location, self);
  double v15 = [(DBIconView *)self dropShadowProvider];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__DBIconView__refreshDropShadowWithIconImage___block_invoke;
  v17[3] = &unk_2649B5AD8;
  objc_copyWeak(&v19, &location);
  id v16 = v4;
  id v18 = v16;
  [v15 imageForTraitCollection:v10 completion:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __46__DBIconView__refreshDropShadowWithIconImage___block_invoke(uint64_t a1, CGImageRef image)
{
  CGImageRetain(image);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__DBIconView__refreshDropShadowWithIconImage___block_invoke_2;
  aBlock[3] = &unk_2649B5AB0;
  objc_copyWeak(v7, (id *)(a1 + 40));
  v7[1] = image;
  id v6 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if (pthread_main_np() == 1) {
    v4[2](v4);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }

  objc_destroyWeak(v7);
}

void __46__DBIconView__refreshDropShadowWithIconImage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v29 = WeakRetained;
    size_t Width = CGImageGetWidth(*(CGImageRef *)(a1 + 48));
    size_t Height = CGImageGetHeight(*(CGImageRef *)(a1 + 48));
    [*(id *)(a1 + 32) scale];
    if (v5 > 0.0)
    {
      [*(id *)(a1 + 32) scale];
      double v7 = (double)Width / v6;
      [*(id *)(a1 + 32) scale];
      double v9 = (double)Height / v8;
      [v29 bounds];
      double v11 = (v7 - v10) * -0.5;
      double v12 = [v29 dropShadowView];
      objc_msgSend(v12, "setFrame:", v11, -8.0, v7, v9);

      double v13 = [v29 dropShadowView];
      uint64_t v14 = [v13 layer];
      double v15 = [v14 contents];

      id v16 = [v29 dropShadowView];
      double v17 = [v16 layer];
      [v17 setContents:*(void *)(a1 + 48)];

      if (!v15)
      {
        id v18 = [v29 dropShadowView];
        id v19 = [v18 layer];
        [v19 setOpacity:0.0];

        CGRect v20 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        CGRect v21 = [NSNumber numberWithFloat:0.0];
        [v20 setFromValue:v21];

        LODWORD(v22) = 1.0;
        v23 = [NSNumber numberWithFloat:v22];
        [v20 setToValue:v23];

        [v20 setDuration:0.25];
        v24 = [v29 dropShadowView];
        v25 = [v24 layer];
        [v25 addAnimation:v20 forKey:@"opacity"];

        v26 = [v29 dropShadowView];
        double v27 = [v26 layer];
        LODWORD(v28) = 1.0;
        [v27 setOpacity:v28];
      }
    }
    CGImageRelease(*(CGImageRef *)(a1 + 48));
    id WeakRetained = v29;
  }
}

- (void)_wallpaperChanged:(id)a3
{
  id v4 = objc_opt_class();
  double v5 = [(DBIconView *)self traitCollection];
  [v4 _updateCharacteristicsWithTraitCollection:v5];

  double v6 = [(DBIconView *)self iconImageSnapshot];
  [(DBIconView *)self _refreshDropShadowWithIconImage:v6];

  [(DBIconView *)self _updateLabel];
  id v10 = [(id)objc_opt_class() environmentConfiguration];
  double v7 = [v10 wallpaperPreferences];
  double v8 = [v7 currentWallpaper];
  double v9 = [(DBIconView *)self labelLegibilityView];
  [v9 setWallpaper:v8];
}

+ (id)textColorForTraitCollection:(id)a3
{
  if (textColorForTraitCollection__onceToken != -1) {
    dispatch_once(&textColorForTraitCollection__onceToken, &__block_literal_global_20);
  }
  BOOL v3 = (void *)textColorForTraitCollection____textColor;
  return v3;
}

uint64_t __42__DBIconView_textColorForTraitCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F825C8] labelColor];
  uint64_t v1 = textColorForTraitCollection____textColor;
  textColorForTraitCollection____textColor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)focusTextColorForTraitCollection:(id)a3
{
  if (focusTextColorForTraitCollection__onceToken != -1) {
    dispatch_once(&focusTextColorForTraitCollection__onceToken, &__block_literal_global_166_0);
  }
  BOOL v3 = (void *)focusTextColorForTraitCollection____focusTextColor;
  return v3;
}

uint64_t __47__DBIconView_focusTextColorForTraitCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  uint64_t v1 = focusTextColorForTraitCollection____focusTextColor;
  focusTextColorForTraitCollection____focusTextColor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)focusColorForTraitCollection:(id)a3
{
  if (focusColorForTraitCollection__onceToken != -1) {
    dispatch_once(&focusColorForTraitCollection__onceToken, &__block_literal_global_168);
  }
  BOOL v3 = (void *)focusColorForTraitCollection____focusColor;
  return v3;
}

uint64_t __43__DBIconView_focusColorForTraitCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F825C8] _carSystemFocusColor];
  uint64_t v1 = focusColorForTraitCollection____focusColor;
  focusColorForTraitCollection____focusColor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)labelFontForTraitCollection:(id)a3
{
  id v4 = (void *)_labelFont;
  if (!_labelFont)
  {
    [a1 _updateCharacteristicsWithTraitCollection:a3];
    id v4 = (void *)_labelFont;
  }
  return v4;
}

+ (void)_updateCharacteristicsWithTraitCollection:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83588] compatibleWithTraitCollection:a3];
  uint64_t v12 = *MEMORY[0x263F81850];
  id v4 = [NSNumber numberWithDouble:*MEMORY[0x263F81838]];
  v13[0] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v10 = *MEMORY[0x263F817A0];
  double v11 = v5;
  double v6 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  double v7 = [v3 fontDescriptorByAddingAttributes:v6];

  uint64_t v8 = [MEMORY[0x263F81708] fontWithDescriptor:v7 size:0.0];
  double v9 = (void *)_labelFont;
  _labelFont = v8;
}

- (void)setShadowHidden:(BOOL)a3
{
  if (self->_shadowHidden != a3)
  {
    self->_shadowHidden = a3;
    id v4 = [(DBIconView *)self dropShadowView];
    [v4 setHidden:self->_shadowHidden];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DBIconView;
  return *MEMORY[0x263F83260] | [(DBIconView *)&v3 accessibilityTraits];
}

- (BOOL)shadowHidden
{
  return self->_shadowHidden;
}

- (DBIconDropShadowProvider)dropShadowProvider
{
  return self->_dropShadowProvider;
}

- (void)setDropShadowProvider:(id)a3
{
}

- (UIView)dropShadowView
{
  return self->_dropShadowView;
}

- (void)setDropShadowView:(id)a3
{
}

- (DBIconLabelBackdropView)labelLegibilityView
{
  return self->_labelLegibilityView;
}

- (void)setLabelLegibilityView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLegibilityView, 0);
  objc_storeStrong((id *)&self->_dropShadowView, 0);
  objc_storeStrong((id *)&self->_dropShadowProvider, 0);
}

@end