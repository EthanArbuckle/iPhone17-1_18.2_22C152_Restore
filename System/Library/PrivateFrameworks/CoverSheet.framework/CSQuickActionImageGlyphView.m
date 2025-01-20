@interface CSQuickActionImageGlyphView
- (BOOL)isSelected;
- (CSQuickActionImageGlyphView)initWithSystemImageName:(id)a3 selectedSystemImageName:(id)a4 symbolScaleValue:(double)a5 buttonDiameter:(double)a6;
- (CSQuickActionImageGlyphView)initWithSystemImageName:(id)a3 selectedSystemImageName:(id)a4 symbolScaleValue:(double)a5 buttonDiameter:(double)a6 symbolOnColor:(id)a7;
- (id)_systemImageWithName:(id)a3;
- (id)_systemImageWithName:(id)a3 configuration:(id)a4;
- (int64_t)appearance;
- (void)_updateImageAppearance;
- (void)_updateTint;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAppearance:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CSQuickActionImageGlyphView

- (CSQuickActionImageGlyphView)initWithSystemImageName:(id)a3 selectedSystemImageName:(id)a4 symbolScaleValue:(double)a5 buttonDiameter:(double)a6
{
  return [(CSQuickActionImageGlyphView *)self initWithSystemImageName:a3 selectedSystemImageName:a4 symbolScaleValue:0 buttonDiameter:a5 symbolOnColor:a6];
}

- (CSQuickActionImageGlyphView)initWithSystemImageName:(id)a3 selectedSystemImageName:(id)a4 symbolScaleValue:(double)a5 buttonDiameter:(double)a6 symbolOnColor:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CSQuickActionImageGlyphView;
  v16 = -[CSQuickActionImageGlyphView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v17 = v16;
  if (v16)
  {
    [(CSQuickActionImageGlyphView *)v16 setOpaque:0];
    [(CSQuickActionImageGlyphView *)v17 setContentMode:1];
    objc_storeStrong((id *)&v17->_imageName, a3);
    objc_storeStrong((id *)&v17->_selectedImageName, a4);
    uint64_t v18 = [(CSQuickActionImageGlyphView *)v17 _systemImageWithName:v13];
    image = v17->_image;
    v17->_image = (UIImage *)v18;

    uint64_t v20 = [(CSQuickActionImageGlyphView *)v17 _systemImageWithName:v14];
    selectedImage = v17->_selectedImage;
    v17->_selectedImage = (UIImage *)v20;

    [(CSQuickActionImageGlyphView *)v17 _updateImageAppearance];
    v17->_symbolScaleValue = a5;
    v17->_buttonDiameter = a6;
    objc_storeStrong((id *)&v17->_onColor, a7);
    v22 = (SBMiscellaneousDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B8]);
    miscellaneousSettings = v17->_miscellaneousSettings;
    v17->_miscellaneousSettings = v22;
  }
  return v17;
}

- (void)dealloc
{
  [(BSDefaultObserver *)self->_defaultsObserverToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSQuickActionImageGlyphView;
  [(CSQuickActionImageGlyphView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSQuickActionImageGlyphView;
  [(CSQuickActionImageGlyphView *)&v4 layoutSubviews];
  objc_super v3 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:3 scale:self->_buttonDiameter * self->_symbolScaleValue];
  [(CSQuickActionImageGlyphView *)self setPreferredSymbolConfiguration:v3];
}

- (void)_updateTint
{
  onColor = self->_onColor;
  if (onColor)
  {
    objc_super v4 = onColor;
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4F428B8] darkTextColor];
  }
  v10 = v4;
  if ([(CSQuickActionImageGlyphView *)self isSelected])
  {
    v5 = v10;
  }
  else
  {
    v5 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  v6 = v5;
  if (!self->_selected)
  {
    int64_t appearance = self->_appearance;
    if (appearance == 2)
    {
      double v8 = 0.25;
    }
    else
    {
      if (appearance != 1) {
        goto LABEL_13;
      }
      double v8 = 0.5;
    }
    uint64_t v9 = [(UIColor *)v5 colorWithAlphaComponent:v8];

    v6 = (void *)v9;
  }
LABEL_13:
  [(CSQuickActionImageGlyphView *)self setTintColor:v6];
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3
    || ([(CSQuickActionImageGlyphView *)self image],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_selected = a3;
    [(CSQuickActionImageGlyphView *)self _updateImageAppearance];
  }
}

- (void)setAppearance:(int64_t)a3
{
  if (self->_appearance != a3)
  {
    self->_int64_t appearance = a3;
    [(CSQuickActionImageGlyphView *)self _updateImageAppearance];
  }
}

- (void)_updateImageAppearance
{
  if (!self->_selected || (image = self->_selectedImage) == 0) {
    image = self->_image;
  }
  [(CSQuickActionImageGlyphView *)self setImage:image];

  [(CSQuickActionImageGlyphView *)self _updateTint];
}

- (id)_systemImageWithName:(id)a3
{
  id v4 = a3;
  v5 = [(CSQuickActionImageGlyphView *)self preferredSymbolConfiguration];
  v6 = [(CSQuickActionImageGlyphView *)self _systemImageWithName:v4 configuration:v5];

  return v6;
}

- (id)_systemImageWithName:(id)a3 configuration:(id)a4
{
  id v4 = [MEMORY[0x1E4F42A80] systemImageNamed:a3 withConfiguration:a4];
  v5 = [v4 _imageThatSuppressesAccessibilityHairlineThickening];

  return v5;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsObserverToken, 0);
  objc_storeStrong((id *)&self->_miscellaneousSettings, 0);
  objc_storeStrong((id *)&self->_onColor, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_selectedImageName, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end