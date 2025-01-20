@interface CCUIRoundButton
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isDynamicLayoutEnabled;
- (BOOL)isDynamicLayoutUnbounded;
- (BOOL)useAlternateBackground;
- (BOOL)useAutomaticSymbolColors;
- (BOOL)useIndependentAlpha;
- (CCUICAPackageDescription)glyphPackageDescription;
- (CCUICAPackageView)glyphPackageView;
- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4;
- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5;
- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6;
- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5;
- (CCUIRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4;
- (CCUIRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)glyphState;
- (UIColor)highlightColor;
- (UIColor)highlightTintColor;
- (UIImage)glyphImage;
- (UIImageView)glyphImageView;
- (UIImageView)selectedGlyphView;
- (UIView)alternateSelectedStateBackgroundView;
- (UIView)glyphPackageContainerView;
- (UIView)normalStateBackgroundView;
- (UIView)selectedStateBackgroundView;
- (double)_cornerRadius;
- (double)glyphScale;
- (id)_initWithHighlightColor:(id)a3 useLightStyle:(BOOL)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_deactivateReachability:(id)a3;
- (void)_primaryActionPerformed:(id)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setNeedsStateChangeUpdate;
- (void)_updateForStateChange;
- (void)_updateForStateChangeIfNecessary;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProvider:(id)a3 didChangeWithOutgoingVisualStylingProvider:(id)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAlternateSelectedStateBackgroundView:(id)a3;
- (void)setDynamicLayoutEnabled:(BOOL)a3;
- (void)setDynamicLayoutUnbounded:(BOOL)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphImageView:(id)a3;
- (void)setGlyphPackageContainerView:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setGlyphPackageView:(id)a3;
- (void)setGlyphScale:(double)a3;
- (void)setGlyphState:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightTintColor:(id)a3;
- (void)setNormalStateBackgroundView:(id)a3;
- (void)setSelectedGlyphView:(id)a3;
- (void)setSelectedStateBackgroundView:(id)a3;
- (void)setUseAlternateBackground:(BOOL)a3;
- (void)setUseAutomaticSymbolColors:(BOOL)a3;
- (void)setUseIndependentAlpha:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation CCUIRoundButton

- (id)_initWithHighlightColor:(id)a3 useLightStyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CCUIRoundButton;
  v7 = -[CCUIRoundButton initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_glyphScale = 1.0;
    uint64_t v9 = [v6 copy];
    highlightColor = v8->_highlightColor;
    v8->_highlightColor = (UIColor *)v9;

    if (v4) {
      +[CCUIControlCenterMaterialView _tertiaryView];
    }
    else {
    v11 = +[CCUIControlCenterMaterialView controlCenterDarkMaterial];
    }
    objc_storeStrong((id *)&v8->_normalStateBackgroundView, v11);

    normalStateBackgroundView = v8->_normalStateBackgroundView;
    [(CCUIRoundButton *)v8 bounds];
    -[UIView setFrame:](normalStateBackgroundView, "setFrame:");
    [(UIView *)v8->_normalStateBackgroundView setAutoresizingMask:18];
    [(UIView *)v8->_normalStateBackgroundView setUserInteractionEnabled:0];
    [(CCUIRoundButton *)v8 addSubview:v8->_normalStateBackgroundView];
    id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(CCUIRoundButton *)v8 bounds];
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
    selectedStateBackgroundView = v8->_selectedStateBackgroundView;
    v8->_selectedStateBackgroundView = (UIView *)v14;

    [(UIView *)v8->_selectedStateBackgroundView setAutoresizingMask:18];
    [(UIView *)v8->_selectedStateBackgroundView setBackgroundColor:v8->_highlightColor];
    [(UIView *)v8->_selectedStateBackgroundView setUserInteractionEnabled:0];
    [(CCUIRoundButton *)v8 addSubview:v8->_selectedStateBackgroundView];
    uint64_t v16 = +[CCUIControlCenterMaterialView _lightFillView];
    alternateSelectedStateBackgroundView = v8->_alternateSelectedStateBackgroundView;
    v8->_alternateSelectedStateBackgroundView = (UIView *)v16;

    v18 = v8->_alternateSelectedStateBackgroundView;
    [(CCUIRoundButton *)v8 bounds];
    -[UIView setFrame:](v18, "setFrame:");
    [(UIView *)v8->_alternateSelectedStateBackgroundView setAutoresizingMask:18];
    [(UIView *)v8->_alternateSelectedStateBackgroundView setUserInteractionEnabled:0];
    [(UIView *)v8->_alternateSelectedStateBackgroundView setAlpha:0.0];
    [(CCUIRoundButton *)v8 addSubview:v8->_alternateSelectedStateBackgroundView];
    [(CCUIRoundButton *)v8 addTarget:v8 action:sel__primaryActionPerformed_ forControlEvents:0x2000];
    [(CCUIRoundButton *)v8 addTarget:v8 action:sel__deactivateReachability_ forControlEvents:64];
    [(CCUIRoundButton *)v8 addObserver:v8 forKeyPath:@"enabled" options:0 context:0];
    [(CCUIRoundButton *)v8 addObserver:v8 forKeyPath:@"highlighted" options:0 context:0];
    [(CCUIRoundButton *)v8 addObserver:v8 forKeyPath:@"selected" options:0 context:0];
    [(CCUIRoundButton *)v8 addObserver:v8 forKeyPath:@"glyphState" options:0 context:0];
    [(CCUIRoundButton *)v8 addObserver:v8 forKeyPath:@"useAlternateBackground" options:0 context:0];
    v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    if (v20 == 1)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v8];
      [(CCUIRoundButton *)v8 addInteraction:v21];
    }
  }

  return v8;
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  return [(CCUIRoundButton *)self initWithGlyphImage:a3 highlightColor:a4 useLightStyle:0];
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  return [(CCUIRoundButton *)self initWithGlyphImage:a3 highlightColor:a4 highlightTintColor:0 useLightStyle:a5];
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5
{
  return [(CCUIRoundButton *)self initWithGlyphImage:a3 highlightColor:a4 highlightTintColor:a5 useLightStyle:0];
}

- (CCUIRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v12 = [(CCUIRoundButton *)self _initWithHighlightColor:a4 useLightStyle:v6];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    highlightTintColor = v12->_highlightTintColor;
    v12->_highlightTintColor = (UIColor *)v13;

    uint64_t v15 = [v10 imageWithRenderingMode:2];
    glyphImage = v12->_glyphImage;
    v12->_glyphImage = (UIImage *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12->_glyphImage];
    glyphImageView = v12->_glyphImageView;
    v12->_glyphImageView = (UIImageView *)v17;

    [(UIImageView *)v12->_glyphImageView setTintAdjustmentMode:1];
    [(CCUIRoundButton *)v12 addSubview:v12->_glyphImageView];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12->_glyphImage];
    selectedGlyphView = v12->_selectedGlyphView;
    v12->_selectedGlyphView = (UIImageView *)v19;

    [(UIImageView *)v12->_selectedGlyphView setTintAdjustmentMode:1];
    [(CCUIRoundButton *)v12 addSubview:v12->_selectedGlyphView];
    v21 = (void *)MEMORY[0x1E4FB1EB0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __86__CCUIRoundButton_initWithGlyphImage_highlightColor_highlightTintColor_useLightStyle___block_invoke;
    v23[3] = &unk_1E6AD41E8;
    v24 = v12;
    [v21 performWithoutAnimation:v23];
  }
  return v12;
}

uint64_t __86__CCUIRoundButton_initWithGlyphImage_highlightColor_highlightTintColor_useLightStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForStateChange];
}

- (CCUIRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  return [(CCUIRoundButton *)self initWithGlyphPackageDescription:a3 highlightColor:a4 useLightStyle:0];
}

- (CCUIRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(CCUIRoundButton *)self _initWithHighlightColor:a4 useLightStyle:v5];
  id v10 = v9;
  if (v9)
  {
    [(CCUIRoundButton *)v9 setGlyphPackageDescription:v8];
    id v11 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__CCUIRoundButton_initWithGlyphPackageDescription_highlightColor_useLightStyle___block_invoke;
    v13[3] = &unk_1E6AD41E8;
    uint64_t v14 = v10;
    [v11 performWithoutAnimation:v13];
  }
  return v10;
}

uint64_t __80__CCUIRoundButton_initWithGlyphPackageDescription_highlightColor_useLightStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForStateChange];
}

- (void)dealloc
{
  [(CCUIRoundButton *)self removeObserver:self forKeyPath:@"enabled"];
  [(CCUIRoundButton *)self removeObserver:self forKeyPath:@"highlighted"];
  [(CCUIRoundButton *)self removeObserver:self forKeyPath:@"selected"];
  [(CCUIRoundButton *)self removeObserver:self forKeyPath:@"glyphState"];
  [(CCUIRoundButton *)self removeObserver:self forKeyPath:@"useAlternateBackground"];
  v3.receiver = self;
  v3.super_class = (Class)CCUIRoundButton;
  [(CCUIRoundButton *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CCUIRoundButton;
  [(CCUIRoundButton *)&v20 layoutSubviews];
  [(CCUIRoundButton *)self glyphScale];
  memset(&v19, 0, sizeof(v19));
  if (fabs(v3 + -1.0) >= 2.22044605e-16)
  {
    CGAffineTransformMakeScale(&v19, v3, v3);
  }
  else
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v19.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v19.c = v4;
    *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  glyphPackageContainerView = self->_glyphPackageContainerView;
  CGAffineTransform v18 = v19;
  [(UIView *)glyphPackageContainerView setTransform:&v18];
  [(UIImage *)self->_glyphImage size];
  BOOL v6 = [(CCUIRoundButton *)self traitCollection];
  [v6 displayScale];
  uint64_t v8 = v7;

  BSRectWithSize();
  [(CCUIRoundButton *)self bounds];
  uint64_t v17 = v8;
  UIRectCenteredIntegralRectScale();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(UIImageView *)self->_glyphImageView setFrame:v17];
  -[UIImageView setFrame:](self->_selectedGlyphView, "setFrame:", v10, v12, v14, v16);
  [(CCUIRoundButton *)self _cornerRadius];
  -[CCUIRoundButton _setCornerRadius:](self, "_setCornerRadius:");
  [(CCUIRoundButton *)self _updateForStateChangeIfNecessary];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (_CCUIRoundButtonSize_onceToken != -1) {
    dispatch_once(&_CCUIRoundButtonSize_onceToken, &__block_literal_global_0);
  }
  if (self->_dynamicLayoutEnabled) {
    UIRoundToScale();
  }
  else {
    double v4 = *(double *)&_CCUIRoundButtonSize_size;
  }
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[CCUIRoundButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setGlyphImage:(id)a3
{
  if (self->_glyphImage != a3)
  {
    double v4 = [a3 imageWithRenderingMode:2];
    glyphImage = self->_glyphImage;
    self->_glyphImage = v4;

    [(UIImageView *)self->_glyphImageView setImage:self->_glyphImage];
    [(UIImageView *)self->_selectedGlyphView setImage:self->_glyphImage];
    [(CCUIRoundButton *)self setNeedsLayout];
  }
}

- (void)setUseAlternateBackground:(BOOL)a3
{
  if (self->_useAlternateBackground != a3)
  {
    self->_useAlternateBackground = a3;
    [(CCUIRoundButton *)self setNeedsLayout];
  }
}

- (void)setHighlightColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_highlightColor != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    [(UIView *)self->_selectedStateBackgroundView setBackgroundColor:self->_highlightColor];
    double v5 = v6;
  }
}

- (void)setGlyphPackageDescription:(id)a3
{
  double v5 = (CCUICAPackageDescription *)a3;
  if (self->_glyphPackageDescription != v5)
  {
    objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
    glyphPackageView = self->_glyphPackageView;
    if (self->_glyphPackageDescription)
    {
      if (!glyphPackageView)
      {
        if (!self->_glyphPackageContainerView)
        {
          uint64_t v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
          glyphPackageContainerView = self->_glyphPackageContainerView;
          self->_glyphPackageContainerView = v7;

          [(UIView *)self->_glyphPackageContainerView setClipsToBounds:1];
          [(UIView *)self->_glyphPackageContainerView setUserInteractionEnabled:0];
          [(UIView *)self->_glyphPackageContainerView setAutoresizingMask:18];
          [(CCUIRoundButton *)self addSubview:self->_glyphPackageContainerView];
        }
        double v9 = objc_alloc_init(CCUICAPackageView);
        double v10 = self->_glyphPackageView;
        self->_glyphPackageView = v9;

        [(CCUICAPackageView *)self->_glyphPackageView setAutoresizingMask:18];
        [(UIView *)self->_glyphPackageContainerView addSubview:self->_glyphPackageView];
        double v11 = self->_glyphPackageContainerView;
        [(UIView *)v11 frame];
        -[UIView setBounds:](v11, "setBounds:");
        glyphPackageView = self->_glyphPackageView;
      }
      [(CCUICAPackageView *)glyphPackageView setPackageDescription:v5];
      if ([(CCUIRoundButton *)self _shouldReverseLayoutDirection]
        && [(CCUICAPackageDescription *)v5 flipsForRightToLeftLayoutDirection])
      {
        double v12 = self->_glyphPackageView;
        CGAffineTransformMakeScale(&v15, -1.0, 1.0);
        [(CCUICAPackageView *)v12 setTransform:&v15];
      }
    }
    else if (glyphPackageView)
    {
      [(CCUICAPackageView *)glyphPackageView removeFromSuperview];
      double v13 = self->_glyphPackageView;
      self->_glyphPackageView = 0;

      [(UIView *)self->_glyphPackageContainerView removeFromSuperview];
      double v14 = self->_glyphPackageContainerView;
      self->_glyphPackageContainerView = 0;
    }
  }
}

- (void)setGlyphScale:(double)a3
{
  if (self->_glyphScale != a3)
  {
    self->_glyphScale = a3;
    [(CCUIRoundButton *)self setNeedsLayout];
  }
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIRoundButton;
  [(CCUIRoundButton *)&v6 didMoveToWindow];
  double v3 = [(CCUIRoundButton *)self window];

  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUIRoundButton;
    double v4 = [(CCUIRoundButton *)&v5 visualStylingProviderForCategory:1];
    [(CCUIRoundButton *)self setVisualStylingProvider:v4 forCategory:1];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  uint64_t v8 = (CCUIRoundButton *)a4;
  if (v8 == self
    && (([v9 isEqualToString:@"selected"] & 1) != 0
     || ([v9 isEqualToString:@"enabled"] & 1) != 0
     || ([v9 isEqualToString:@"highlighted"] & 1) != 0
     || ([v9 isEqualToString:@"glyphImage"] & 1) != 0
     || ([v9 isEqualToString:@"glyphState"] & 1) != 0
     || ([v9 isEqualToString:@"useAlternateBackground"] & 1) != 0
     || ([v9 isEqualToString:@"useIndependentAlpha"] & 1) != 0
     || [v9 isEqualToString:@"useAutomaticSymbolColors"]))
  {
    [(CCUIRoundButton *)v8 _setNeedsStateChangeUpdate];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  if ([(CCUIRoundButton *)v4 _isInAWindow])
  {
    id v5 = [(CCUIRoundButton *)v4 window];
    BOOL v6 = (void *)CCUILogUserInterface;
    if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      uint64_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v14 = 138543874;
      CGAffineTransform v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v4;
      __int16 v18 = 2114;
      CGAffineTransform v19 = v5;
      _os_log_impl(&dword_1D834A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Control Center is about to call -[UITargetedPreview initWithView:], view = %{public}@, window = %{public}@", (uint8_t *)&v14, 0x20u);
    }
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v4];
    double v11 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v10];
    double v12 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v11 shape:0];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    id v4 = visualStylingProvider;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUIRoundButton;
    id v4 = [(CCUIRoundButton *)&v6 visualStylingProviderForCategory:a3];
  }
  return v4;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F301EEE8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  int v14 = (MTVisualStylingProvider *)a3;
  objc_super v6 = [(CCUIRoundButton *)self requiredVisualStyleCategories];
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  int v8 = [v6 containsObject:v7];

  id v9 = v14;
  if (v8)
  {
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider != v14)
    {
      double v11 = v14;
      double v12 = self->_visualStylingProvider;
      self->_visualStylingProvider = v11;
      double v13 = visualStylingProvider;

      [(CCUIRoundButton *)self _visualStylingProvider:v11 didChangeWithOutgoingVisualStylingProvider:v13];
      id v9 = v14;
    }
  }
}

- (double)_cornerRadius
{
  [(CCUIRoundButton *)self bounds];
  double Width = CGRectGetWidth(v6);
  [(CCUIRoundButton *)self bounds];
  double Height = CGRectGetHeight(v7);
  if (Width < Height) {
    double Height = Width;
  }
  return Height * 0.5;
}

- (void)_setCornerRadius:(double)a3
{
  -[UIView _setCornerRadius:](self->_normalStateBackgroundView, "_setCornerRadius:");
  [(UIView *)self->_selectedStateBackgroundView _setCornerRadius:a3];
  alternateSelectedStateBackgroundView = self->_alternateSelectedStateBackgroundView;
  [(UIView *)alternateSelectedStateBackgroundView _setCornerRadius:a3];
}

- (void)_primaryActionPerformed:(id)a3
{
}

- (void)_deactivateReachability:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 _deactivateReachability];
}

- (void)_setNeedsStateChangeUpdate
{
  self->_isStateValid = 0;
  [(CCUIRoundButton *)self setNeedsLayout];
}

- (void)_updateForStateChange
{
  self->_isStateValid = 1;
  id v3 = [(CCUIRoundButton *)self window];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__CCUIRoundButton__updateForStateChange__block_invoke;
  v4[3] = &unk_1E6AD41E8;
  v4[4] = self;
  +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:v3 actions:v4];
}

uint64_t __40__CCUIRoundButton__updateForStateChange__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__CCUIRoundButton__updateForStateChange__block_invoke_2;
  v2[3] = &unk_1E6AD41E8;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.25];
}

void __40__CCUIRoundButton__updateForStateChange__block_invoke_2(uint64_t a1)
{
  double v2 = 1.0;
  if ([*(id *)(a1 + 32) isEnabled]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.2;
  }
  if ([*(id *)(a1 + 32) isHighlighted]) {
    double v2 = 0.75;
  }
  int v4 = [*(id *)(a1 + 32) isSelected];
  id v5 = *(id **)(a1 + 32);
  if (v4)
  {
    [v5[65] setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 536) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 528) setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:v3];
    [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:0.0];
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(void *)(v6 + 512)) {
      goto LABEL_17;
    }
    if ([*(id *)(v6 + 456) isAutomaticallyUpdatingView:*(void *)(v6 + 552)]) {
      [*(id *)(a1 + 32) _updateVisualStylingOfView:*(void *)(*(void *)(a1 + 32) + 552) style:0 visualStylingProvider:0 outgoingProvider:*(void *)(*(void *)(a1 + 32) + 456)];
    }
    goto LABEL_10;
  }
  int v7 = [v5 useAlternateBackground];
  [*(id *)(*(void *)(a1 + 32) + 520) setAlpha:1.0];
  int v8 = *(void **)(*(void *)(a1 + 32) + 536);
  if (v7)
  {
    [v8 setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 528) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:v3];
    [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:v3];
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 512))
    {
      if ([*(id *)(v9 + 456) isAutomaticallyUpdatingView:*(void *)(v9 + 552)]) {
        [*(id *)(a1 + 32) _updateVisualStylingOfView:*(void *)(*(void *)(a1 + 32) + 552) style:0 visualStylingProvider:0 outgoingProvider:*(void *)(*(void *)(a1 + 32) + 456)];
      }
LABEL_10:
      [*(id *)(*(void *)(a1 + 32) + 552) setTintColor:*(void *)(*(void *)(a1 + 32) + 512)];
    }
  }
  else
  {
    [v8 setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 528) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:v3];
  }
LABEL_17:
  if (([*(id *)(a1 + 32) useIndependentAlpha] & 1) == 0) {
    [*(id *)(a1 + 32) setAlpha:v2];
  }
  [*(id *)(*(void *)(a1 + 32) + 568) setAlpha:v3];
  double v10 = *(void **)(a1 + 32);
  double v11 = (void *)v10[71];
  double v12 = [v10 glyphState];
  [v11 setStateName:v12];

  double v13 = [*(id *)(*(void *)(a1 + 32) + 552) image];
  LODWORD(v12) = [v13 isSymbolImage];

  int v14 = [*(id *)(a1 + 32) useAutomaticSymbolColors];
  if (v12 && v14)
  {
    int v15 = [*(id *)(a1 + 32) useAlternateBackground];
    __int16 v16 = *(void **)(*(void *)(a1 + 32) + 552);
    if (v15) {
      [MEMORY[0x1E4FB1618] darkGrayColor];
    }
    else {
    id v17 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    [v16 setTintColor:v17];
  }
}

- (void)_updateForStateChangeIfNecessary
{
  if (!self->_isStateValid) {
    [(CCUIRoundButton *)self _updateForStateChange];
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4 andObserverBlock:&__block_literal_global_51];
  }
}

id __91__CCUIRoundButton__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 alpha];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__CCUIRoundButton__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  aBlock[4] = v3;
  int v4 = _Block_copy(aBlock);
  return v4;
}

uint64_t __91__CCUIRoundButton__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

- (void)_visualStylingProvider:(id)a3 didChangeWithOutgoingVisualStylingProvider:(id)a4
{
  glyphImageView = self->_glyphImageView;
  id v7 = a4;
  id v8 = a3;
  [(CCUIRoundButton *)self _updateVisualStylingOfView:glyphImageView style:0 visualStylingProvider:v8 outgoingProvider:v7];
  [(CCUIRoundButton *)self _updateVisualStylingOfView:self->_selectedGlyphView style:0 visualStylingProvider:v8 outgoingProvider:v7];
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (void)setGlyphState:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)useAlternateBackground
{
  return self->_useAlternateBackground;
}

- (BOOL)useIndependentAlpha
{
  return self->_useIndependentAlpha;
}

- (void)setUseIndependentAlpha:(BOOL)a3
{
  self->_useIndependentAlpha = a3;
}

- (BOOL)useAutomaticSymbolColors
{
  return self->_useAutomaticSymbolColors;
}

- (void)setUseAutomaticSymbolColors:(BOOL)a3
{
  self->_useAutomaticSymbolColors = a3;
}

- (BOOL)isDynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  self->_dynamicLayoutEnabled = a3;
}

- (BOOL)isDynamicLayoutUnbounded
{
  return self->_dynamicLayoutUnbounded;
}

- (void)setDynamicLayoutUnbounded:(BOOL)a3
{
  self->_dynamicLayoutUnbounded = a3;
}

- (UIColor)highlightTintColor
{
  return self->_highlightTintColor;
}

- (void)setHighlightTintColor:(id)a3
{
}

- (UIView)normalStateBackgroundView
{
  return self->_normalStateBackgroundView;
}

- (void)setNormalStateBackgroundView:(id)a3
{
}

- (UIView)selectedStateBackgroundView
{
  return self->_selectedStateBackgroundView;
}

- (void)setSelectedStateBackgroundView:(id)a3
{
}

- (UIView)alternateSelectedStateBackgroundView
{
  return self->_alternateSelectedStateBackgroundView;
}

- (void)setAlternateSelectedStateBackgroundView:(id)a3
{
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
}

- (UIImageView)selectedGlyphView
{
  return self->_selectedGlyphView;
}

- (void)setSelectedGlyphView:(id)a3
{
}

- (UIView)glyphPackageContainerView
{
  return self->_glyphPackageContainerView;
}

- (void)setGlyphPackageContainerView:(id)a3
{
}

- (CCUICAPackageView)glyphPackageView
{
  return self->_glyphPackageView;
}

- (void)setGlyphPackageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphPackageView, 0);
  objc_storeStrong((id *)&self->_glyphPackageContainerView, 0);
  objc_storeStrong((id *)&self->_selectedGlyphView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_alternateSelectedStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectedStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_normalStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_highlightTintColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end