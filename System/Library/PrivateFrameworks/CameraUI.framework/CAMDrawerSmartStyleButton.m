@interface CAMDrawerSmartStyleButton
- (BOOL)isOn;
- (BOOL)isResetButtonVisibleWhenExpanded;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldUseSlash;
- (BOOL)showDisabled;
- (CAMDrawerSmartStyleButton)initWithLayoutStyle:(int64_t)a3;
- (CAMDrawerSmartStyleResetButton)resetButton;
- (CEKSmartStyle)smartStyle;
- (CGPoint)_normalizedStyleValue;
- (CUShutterButton)shutterButton;
- (id)accessibilityIdentifier;
- (id)imageForAXHUD;
- (id)imageForCurrentState;
- (id)imageNameForCurrentState;
- (int64_t)controlType;
- (void)_setNormalizedStyleValue:(CGPoint)a3;
- (void)_updateResetButtonVisibilityAnimated:(BOOL)a3;
- (void)_updateShutterButtonVisibilityAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setOn:(BOOL)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setResetButtonVisibleWhenExpanded:(BOOL)a3;
- (void)setResetButtonVisibleWhenExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowDisabled:(BOOL)a3;
- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setSmartStyle:(id)a3;
- (void)setSmartStyle:(id)a3 animated:(BOOL)a4;
@end

@implementation CAMDrawerSmartStyleButton

- (CAMDrawerSmartStyleButton)initWithLayoutStyle:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CAMDrawerSmartStyleButton;
  v4 = [(CAMControlDrawerButton *)&v20 initWithLayoutStyle:sel_initWithLayoutStyle_];
  if (v4)
  {
    v5 = [(CAMControlDrawerButton *)[CAMDrawerSmartStyleResetButton alloc] initWithLayoutStyle:a3];
    resetButton = v4->_resetButton;
    v4->_resetButton = v5;

    [(CAMControlDrawerButton *)v4->_resetButton setOrientation:[(CAMControlDrawerButton *)v4 orientation]];
    v7 = [(CAMControlDrawerButton *)v4->_resetButton _backgroundView];
    [v7 setAlpha:0.85];

    [(CAMDrawerSmartStyleButton *)v4 _updateResetButtonVisibilityAnimated:0];
    +[CAMControlDrawerButton buttonSize];
    double v9 = v8;
    uint64_t v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    double v10 = CAMPixelWidthForView(v4);
    CAMShutterButtonSpecMake((double *)&v17, v9, 3.0 - v10, 0.0, 0.0, 2.0);
    v15[0] = v17;
    v15[1] = v18;
    uint64_t v16 = v19;
    uint64_t v11 = +[CUShutterButton shutterButtonWithSpec:v15];
    shutterButton = v4->_shutterButton;
    v4->_shutterButton = (CUShutterButton *)v11;

    [(CAMDrawerSmartStyleButton *)v4 _updateShutterButtonVisibilityAnimated:0];
    [(CAMDrawerSmartStyleButton *)v4 insertSubview:v4->_shutterButton atIndex:0];
    [(CAMDrawerSmartStyleButton *)v4 insertSubview:v4->_resetButton atIndex:0];
    v13 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)CAMDrawerSmartStyleButton;
  [(CAMControlDrawerCustomButton *)&v31 layoutSubviews];
  [(CAMDrawerSmartStyleButton *)self bounds];
  UIRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  v7 = [(CAMDrawerSmartStyleButton *)self shutterButton];
  [v7 intrinsicContentSize];
  CEKRectWithSize();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  uint64_t v16 = [(CAMDrawerSmartStyleButton *)self resetButton];
  [v16 intrinsicContentSize];
  CEKRectWithSize();
  double v29 = v18;
  double v30 = v17;
  double v20 = v19;
  double v28 = v21;

  double v22 = v4;
  if ([(CAMControlDrawerCustomButton *)self isExpanded])
  {
    [(CAMControlDrawerCustomButton *)self expansionInsets];
    double v22 = v4 + v23;
    double v4 = v4 + v20 + 18.0;
  }
  v24 = [(CAMDrawerSmartStyleButton *)self shutterButton];
  objc_msgSend(v24, "setCenter:", v22, v6);

  v25 = [(CAMDrawerSmartStyleButton *)self shutterButton];
  objc_msgSend(v25, "setBounds:", v9, v11, v13, v15);

  v26 = [(CAMDrawerSmartStyleButton *)self resetButton];
  objc_msgSend(v26, "setCenter:", v4, v6);

  v27 = [(CAMDrawerSmartStyleButton *)self resetButton];
  objc_msgSend(v27, "setBounds:", v30, v29, v20, v28);

  [(CAMDrawerSmartStyleButton *)self _updateResetButtonVisibilityAnimated:0];
  [(CAMDrawerSmartStyleButton *)self _updateShutterButtonVisibilityAnimated:0];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)CAMDrawerSmartStyleButton;
  if (-[CAMControlDrawerCustomButton pointInside:withEvent:](&v12, sel_pointInside_withEvent_, a4)) {
    return 1;
  }
  if ([(CAMControlDrawerCustomButton *)self isExpanded])
  {
    if ([(CAMDrawerSmartStyleButton *)self isResetButtonVisibleWhenExpanded])
    {
      double v8 = [(CAMDrawerSmartStyleButton *)self resetButton];
      [v8 frame];
      v13.CGFloat x = x;
      v13.CGFloat y = y;
      BOOL v9 = CGRectContainsPoint(v15, v13);

      if (v9) {
        return 1;
      }
    }
  }
  if (![(CAMControlDrawerCustomButton *)self isExpanded]) {
    return 0;
  }
  double v10 = [(CAMDrawerSmartStyleButton *)self shutterButton];
  [v10 frame];
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  BOOL v7 = CGRectContainsPoint(v16, v14);

  return v7;
}

- (int64_t)controlType
{
  return 11;
}

- (id)imageNameForCurrentState
{
  BOOL v2 = [(CAMControlDrawerCustomButton *)self isExpanded];
  double v3 = @"chevron.left";
  if (!v2) {
    double v3 = 0;
  }
  double v4 = v3;
  return v4;
}

- (id)imageForCurrentState
{
  if ([(CAMControlDrawerCustomButton *)self isExpanded])
  {
    v10.receiver = self;
    v10.super_class = (Class)CAMDrawerSmartStyleButton;
    double v3 = [(CAMControlDrawerButton *)&v10 imageForCurrentState];
  }
  else
  {
    [(CAMDrawerSmartStyleButton *)self _normalizedStyleValue];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    double v8 = [MEMORY[0x263F825C8] whiteColor];
    double v3 = +[CAMSmartStyleStatusIndicator gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:](CAMSmartStyleStatusIndicator, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v8, 24.0, 24.0, 5.0, 1.0, 3.0, 1.33333333, 4.33333333, v5, v7);
  }
  return v3;
}

- (id)imageForAXHUD
{
  BOOL v2 = [MEMORY[0x263F825C8] whiteColor];
  double v3 = +[CAMSmartStyleStatusIndicator gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:](CAMSmartStyleStatusIndicator, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v2, 48.0, 48.0, 10.0, 2.0, 6.0, 2.66666667, 8.66666667, 0x3FE0000000000000, 0x3FE0000000000000);

  return v3;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlDrawerButton *)self updateImage];
  }
}

- (void)setSmartStyle:(id)a3
{
}

- (void)setSmartStyle:(id)a3 animated:(BOOL)a4
{
  id v9 = a3;
  if ((-[CEKSmartStyle isEqualToSmartStyle:](self->_smartStyle, "isEqualToSmartStyle:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_smartStyle, a3);
    [v9 colorBias];
    double v7 = v6;
    [v9 toneBias];
    -[CAMDrawerSmartStyleButton _setNormalizedStyleValue:](self, "_setNormalizedStyleValue:", v7, v8);
  }
}

- (void)setShowDisabled:(BOOL)a3
{
}

- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    [(CAMControlDrawerButton *)self updateImageAnimated:a4];
  }
}

- (void)_setNormalizedStyleValue:(CGPoint)a3
{
  if (self->__normalizedStyleValue.x != a3.x || self->__normalizedStyleValue.y != a3.y)
  {
    self->__normalizedStyleValue = a3;
    [(CAMControlDrawerButton *)self updateImage];
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return @"SmartStyleButton";
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CAMDrawerSmartStyleButton;
  -[CAMControlDrawerButton setOrientation:animated:](&v8, sel_setOrientation_animated_);
  double v7 = [(CAMDrawerSmartStyleButton *)self resetButton];
  [v7 setOrientation:a3 animated:v4];
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CAMControlDrawerCustomButton *)self isExpanded] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerSmartStyleButton;
    [(CAMControlDrawerCustomButton *)&v7 setExpanded:v5 animated:v4];
    [(CAMDrawerSmartStyleButton *)self _updateResetButtonVisibilityAnimated:v4];
    [(CAMDrawerSmartStyleButton *)self _updateShutterButtonVisibilityAnimated:v4];
    [(CAMControlDrawerButton *)self updateImageAnimated:v4];
  }
}

- (void)setResetButtonVisibleWhenExpanded:(BOOL)a3
{
}

- (void)setResetButtonVisibleWhenExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_resetButtonVisibleWhenExpanded != a3)
  {
    self->_resetButtonVisibleWhenExpanded = a3;
    [(CAMDrawerSmartStyleButton *)self _updateResetButtonVisibilityAnimated:a4];
  }
}

- (void)_updateResetButtonVisibilityAnimated:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 0.25;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__CAMDrawerSmartStyleButton__updateResetButtonVisibilityAnimated___block_invoke;
  v4[3] = &unk_263FA0208;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:v4 animations:v3];
}

void __66__CAMDrawerSmartStyleButton__updateResetButtonVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if ([*(id *)(a1 + 32) isExpanded])
  {
    if ([*(id *)(a1 + 32) isResetButtonVisibleWhenExpanded]) {
      double v2 = 1.0;
    }
    else {
      double v2 = 0.0;
    }
  }
  id v3 = [*(id *)(a1 + 32) resetButton];
  [v3 setAlpha:v2];
}

- (void)_updateShutterButtonVisibilityAnimated:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 0.25;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__CAMDrawerSmartStyleButton__updateShutterButtonVisibilityAnimated___block_invoke;
  v4[3] = &unk_263FA0208;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:v4 animations:v3];
}

void __68__CAMDrawerSmartStyleButton__updateShutterButtonVisibilityAnimated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExpanded]) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) shutterButton];
  [v3 setAlpha:v2];
}

- (BOOL)isOn
{
  return self->_on;
}

- (CEKSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (CAMDrawerSmartStyleResetButton)resetButton
{
  return self->_resetButton;
}

- (BOOL)isResetButtonVisibleWhenExpanded
{
  return self->_resetButtonVisibleWhenExpanded;
}

- (CGPoint)_normalizedStyleValue
{
  double x = self->__normalizedStyleValue.x;
  double y = self->__normalizedStyleValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_smartStyle, 0);
}

@end