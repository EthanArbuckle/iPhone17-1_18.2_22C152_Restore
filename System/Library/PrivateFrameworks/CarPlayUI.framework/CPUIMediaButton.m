@interface CPUIMediaButton
- (BOOL)canShowHighlight;
- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused;
- (BOOL)showBezelInTouch;
- (BOOL)showHighlight;
- (CGSize)intrinsicContentSize;
- (CPUIMediaButton)initWithFrame:(CGRect)a3;
- (NSUUID)identifier;
- (double)focusLayerCornerRadius;
- (id)_buttonBackGroundColorTouch;
- (id)colorForKnobFocusLayer;
- (id)colorForKnobFocusLayerSelected;
- (id)colorForTouchFocusLayer;
- (id)colorForTouchFocusLayerSelected;
- (void)layoutSubviews;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setShowBezelInTouch:(BOOL)a3;
- (void)setShowHighlight:(BOOL)a3;
- (void)updateButtonOpacityForKnobUnfocused;
@end

@implementation CPUIMediaButton

- (CPUIMediaButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPUIMediaButton;
  v3 = -[CPUIMediaButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CPUIMediaButton *)v3 titleLabel];
    v6 = [MEMORY[0x263F81708] systemFontOfSize:16.0 weight:*MEMORY[0x263F81838]];
    [v5 setFont:v6];

    [(CPUIMediaButton *)v4 setShowsTouchWhenHighlighted:0];
    [(CPUIMediaButton *)v4 setAdjustsImageWhenDisabled:0];
    [(CPUIMediaButton *)v4 setAdjustsImageWhenHighlighted:0];
  }
  return v4;
}

- (BOOL)canShowHighlight
{
  v2 = [(CPUIMediaButton *)self traitCollection];
  char v3 = CPUITraitCollectionSupportsFocus(v2);

  return v3;
}

- (void)setShowBezelInTouch:(BOOL)a3
{
  if (self->_showBezelInTouch != a3)
  {
    self->_showBezelInTouch = a3;
    [(CPUIMediaButton *)self _updateButtonStyle];
  }
}

- (void)setShowHighlight:(BOOL)a3
{
  if (self->_showHighlight != a3)
  {
    self->_showHighlight = a3;
    [(CPUIMediaButton *)self _updateButtonStyle];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CPUIMediaButton *)self isHidden] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CPUIMediaButton;
    [(CPUIMediaButton *)&v6 setHidden:v3];
    if ([(CPUIMediaButton *)self isFocused])
    {
      if (v3)
      {
        v5 = [(CPUIMediaButton *)self superview];
        [v5 setNeedsFocusUpdate];
      }
    }
  }
}

- (id)_buttonBackGroundColorTouch
{
  return (id)[MEMORY[0x263F825C8] _carSystemPrimaryColor];
}

- (double)focusLayerCornerRadius
{
  return 7.0;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CPUIMediaButton;
  [(CPUIMediaButton *)&v36 layoutSubviews];
  BOOL v3 = [(CPUIMediaButton *)self canShowHighlight];
  if ([(CPUIMediaButton *)self showHighlight]) {
    int v4 = 1;
  }
  else {
    int v4 = [(CPUIMediaButton *)self isHighlighted];
  }
  int v5 = [(CPUIMediaButton *)self isFocused];
  int v6 = [(CPUIMediaButton *)self isSelected];
  v7 = [MEMORY[0x263F825C8] clearColor];
  if ([(CPUIMediaButton *)self isHighlighted]) {
    [MEMORY[0x263F825C8] _carSystemFocusPrimaryColor];
  }
  else {
  objc_super v8 = [(CPUIMediaButton *)self tintColorForUnhighlightedTextLabel];
  }
  v9 = [(CPUIMediaButton *)self layer];
  if (!v3 && ![(CPUIMediaButton *)self showBezelInTouch]) {
    goto LABEL_15;
  }
  focusColorLayer = self->_focusColorLayer;
  if (!focusColorLayer)
  {
    v11 = [MEMORY[0x263F157E8] layer];
    v12 = self->_focusColorLayer;
    self->_focusColorLayer = v11;

    [(CALayer *)self->_focusColorLayer setCornerCurve:*MEMORY[0x263F15A20]];
    [(CPUIMediaButton *)self focusLayerCornerRadius];
    -[CALayer setCornerRadius:](self->_focusColorLayer, "setCornerRadius:");
    focusColorLayer = self->_focusColorLayer;
  }
  [v9 addSublayer:focusColorLayer];
  v13 = self->_focusColorLayer;
  [(CPUIMediaButton *)self bounds];
  -[CALayer setFrame:](v13, "setFrame:");
  LODWORD(v14) = 1.0;
  [(CALayer *)self->_focusColorLayer setOpacity:v14];
  if (!v3)
  {
LABEL_15:
    if (v6)
    {
      v18 = [(CPUIMediaButton *)self colorForTouchContentSelected];
      if ([(CPUIMediaButton *)self showBezelInTouch])
      {
        uint64_t v19 = [(CPUIMediaButton *)self colorForTouchFocusLayerSelected];
LABEL_20:
        v15 = (void *)v19;

        int v20 = 0;
        BOOL v21 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      [(CPUIMediaButton *)self updateButtonOpacityForKnobUnfocused];
      v18 = [(CPUIMediaButton *)self colorForKnobFocusLayer];
      if ([(CPUIMediaButton *)self showBezelInTouch])
      {
        uint64_t v19 = [(CPUIMediaButton *)self colorForTouchFocusLayer];
        goto LABEL_20;
      }
    }
    int v20 = 0;
    BOOL v21 = 0;
    v15 = v7;
    goto LABEL_35;
  }
  v15 = [(CPUIMediaButton *)self colorForKnobFocusLayer];

  if (!v6)
  {
    if ((v5 & 1) == 0) {
      [(CPUIMediaButton *)self updateButtonOpacityForKnobUnfocused];
    }
    v18 = [(CPUIMediaButton *)self colorForKnobFocusLayer];
    int v17 = 0;
    if (v5) {
      goto LABEL_33;
    }
    goto LABEL_25;
  }
  if (v5)
  {
    uint64_t v16 = [(CPUIMediaButton *)self colorForKnobFocusLayerSelected];

    int v17 = 1;
  }
  else
  {
    if ([(CPUIMediaButton *)self shouldUpdateButtonOpacityForKnobUnfocused])
    {
      [(CPUIMediaButton *)self updateButtonOpacityForKnobUnfocused];
      int v17 = 0;
      goto LABEL_32;
    }
    uint64_t v16 = [(CPUIMediaButton *)self colorForKnobFocusLayerSelected];

    int v17 = 0;
  }
  v15 = (void *)v16;
LABEL_32:
  v18 = [(CPUIMediaButton *)self colorForKnobContentSelected];
  if (v5)
  {
LABEL_33:
    uint64_t v23 = [(CPUIMediaButton *)self colorForKnobFocused];

    BOOL v21 = v17 != 0;
    int v20 = 1;
    goto LABEL_34;
  }
LABEL_25:
  BOOL v21 = v17 != 0;
  if (!v4)
  {
    int v20 = 0;
    goto LABEL_35;
  }
  LODWORD(v22) = 1.0;
  [(CALayer *)self->_focusColorLayer setOpacity:v22];
  uint64_t v23 = [(CPUIMediaButton *)self colorForKnobFocused];

  int v20 = 0;
LABEL_34:
  v15 = (void *)v23;
LABEL_35:
  v24 = self->_focusColorLayer;
  id v25 = v15;
  -[CALayer setBackgroundColor:](v24, "setBackgroundColor:", [v25 CGColor]);
  v26 = [(CPUIMediaButton *)self titleLabel];
  v27 = [v26 layer];

  v28 = [(CPUIMediaButton *)self imageView];
  v29 = [v28 layer];

  v30 = [(CPUIMediaButton *)self imageView];
  [v30 setTintColor:v18];

  [(CPUIMediaButton *)self setTitleColor:v8 forState:0];
  v31 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B90]];
  uint64_t v32 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D98]];
  v33 = (void *)v32;
  if (v21) {
    v34 = v31;
  }
  else {
    v34 = (void *)v32;
  }
  [v29 setCompositingFilter:v34];
  if (v20) {
    v35 = v31;
  }
  else {
    v35 = v33;
  }
  [v27 setCompositingFilter:v35];
  [v9 addSublayer:v29];
  [v9 addSublayer:v27];
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(CPUIMediaButton *)self titleLabel];
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v5 = v4 + 12.0;
  int v6 = [(CPUIMediaButton *)self titleLabel];
  v7 = [v6 font];
  [v7 lineHeight];
  double v9 = v8;

  double v10 = v5;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)colorForTouchFocusLayer
{
  return (id)[MEMORY[0x263F825C8] _carSystemPrimaryColor];
}

- (id)colorForTouchFocusLayerSelected
{
  return (id)[MEMORY[0x263F825C8] _carSystemPrimaryColor];
}

- (void)updateButtonOpacityForKnobUnfocused
{
  BOOL v3 = [(CPUIMediaButton *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == 1;

  focusColorLayer = self->_focusColorLayer;
  LODWORD(v6) = dword_227B013F0[v4];
  [(CALayer *)focusColorLayer setOpacity:v6];
}

- (id)colorForKnobFocusLayer
{
  if ([(CPUIMediaButton *)self isFocused]) {
    [MEMORY[0x263F825C8] _carSystemFocusPrimaryColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] labelColor];
  }
  return v2;
}

- (id)colorForKnobFocusLayerSelected
{
  return (id)[MEMORY[0x263F825C8] _carSystemPrimaryColor];
}

- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused
{
  return 1;
}

- (BOOL)showBezelInTouch
{
  return self->_showBezelInTouch;
}

- (BOOL)showHighlight
{
  return self->_showHighlight;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_focusColorLayer, 0);
}

@end