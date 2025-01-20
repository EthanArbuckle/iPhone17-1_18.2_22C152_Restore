@interface ETColorWheelView
+ (CGColor)pickerBorderColor;
+ (double)colorWheelWidth;
+ (double)pickerDiameter;
+ (double)pickerWidth;
- (BOOL)pickerShouldDismissClockwise;
- (ETColorWheelView)initWithFrame:(CGRect)a3;
- (UIColor)selectedColor;
- (double)colorWheelDismissalRotation;
- (double)colorWheelRadius;
- (double)gradientWidth;
- (double)pickerDiameter;
- (id)pickerViewHighlightedColor;
- (void)addPickerCircleForPaletteCircle:(id)a3;
- (void)animatePickerToOriginalPosition;
- (void)beganTouches:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)finishedTouches;
- (void)hideColorWheelPickingColor:(BOOL)a3;
- (void)hideDoneButton;
- (void)hideDoneButtonAnimated;
- (void)showColorWheelFromPaletteCircle:(id)a3 rotation:(double)a4;
- (void)showDoneButtonAnimated;
@end

@implementation ETColorWheelView

+ (double)colorWheelWidth
{
  if (SetupSpecValuesIfNeeded_onceToken_0 != -1) {
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
  }
  return 49.5;
}

+ (double)pickerDiameter
{
  if (SetupSpecValuesIfNeeded_onceToken_0 != -1) {
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
  }
  return 45.5;
}

+ (double)pickerWidth
{
  return 1.0;
}

+ (CGColor)pickerBorderColor
{
  id v2 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
  v3 = (CGColor *)[v2 CGColor];

  return v3;
}

- (ETColorWheelView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ETColorWheelView;
  v3 = -[ETColorWheelView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (SetupSpecValuesIfNeeded_onceToken_0 != -1) {
      dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
    }
    [(ETColorWheelView *)v3 bounds];
    v8 = -[ETColorGradientView initWithFrame:]([ETColorGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
    gradientView = v3->_gradientView;
    v3->_gradientView = v8;

    [(ETColorWheelView *)v3 addSubview:v3->_gradientView];
    [(ETColorWheelView *)v3 colorWheelRadius];
    [(ETColorWheelView *)v3 gradientWidth];
    UIRectCenteredIntegralRect();
    -[DTSColorWheel createDoneButtonWithFrame:](v3, "createDoneButtonWithFrame:");
    v10 = [(DTSColorWheel *)v3 doneButton];
    v11 = [v10 titleLabel];
    v12 = [MEMORY[0x263F1C658] systemFontOfSize:13.5];
    [v11 setFont:v12];

    [(ETColorWheelView *)v3 setHidden:1];
    [(ETColorWheelView *)v3 hideDoneButton];
  }
  return v3;
}

- (id)pickerViewHighlightedColor
{
  id v2 = (void *)MEMORY[0x263F1C550];
  double originalRotation = self->_originalRotation;
  [(DTSColorWheel *)self pickerRotation];
  double v5 = HueFromRadians(originalRotation - v4);

  return (id)[v2 colorWithHue:v5 saturation:1.0 brightness:1.0 alpha:1.0];
}

- (double)colorWheelRadius
{
  return 77.0;
}

- (double)gradientWidth
{
  return 49.5;
}

- (double)pickerDiameter
{
  return 45.5;
}

- (void)hideDoneButton
{
  id v2 = [(DTSColorWheel *)self doneButton];
  [v2 setAlpha:0.0];
  CGAffineTransformMakeScale(&v3, 0.7, 0.7);
  [v2 setTransform:&v3];
}

- (void)showColorWheelFromPaletteCircle:(id)a3 rotation:(double)a4
{
  double v17 = 0.0;
  id v6 = a3;
  double v7 = [v6 backgroundColor];
  [v7 getHue:&v17 saturation:0 brightness:0 alpha:0];

  [(DTSColorWheel *)self setHueRotation:RadiansFromHue(v17)];
  [(DTSColorWheel *)self hueRotation];
  double v9 = v8 + a4;
  self->_double originalRotation = v9;
  CGAffineTransformMakeRotation(&v16, v9);
  gradientView = self->_gradientView;
  CGAffineTransform v15 = v16;
  [(ETColorGradientView *)gradientView setTransform:&v15];
  [(ETColorWheelView *)self setHidden:0];
  [(ETColorWheelView *)self addPickerCircleForPaletteCircle:v6];

  [(ETColorWheelView *)self showDoneButtonAnimated];
  v11 = self->_gradientView;
  [(DTSColorWheel *)self hueRotation];
  [(ETColorGradientView *)v11 prepareToAnimateColorWheelWithRotation:-v12];
  v13 = self->_gradientView;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__ETColorWheelView_showColorWheelFromPaletteCircle_rotation___block_invoke;
  v14[3] = &unk_264DEC6D0;
  v14[4] = self;
  [(ETColorGradientView *)v13 revealColorWheelWithCompletion:v14];
}

uint64_t __61__ETColorWheelView_showColorWheelFromPaletteCircle_rotation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeFirstResponder];
}

- (void)showDoneButtonAnimated
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__ETColorWheelView_showDoneButtonAnimated__block_invoke;
  v2[3] = &unk_264DEC6D0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.2];
}

void __42__ETColorWheelView_showDoneButtonAnimated__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) doneButton];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
  [v1 setAlpha:1.0];
}

- (void)hideDoneButtonAnimated
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__ETColorWheelView_hideDoneButtonAnimated__block_invoke;
  v2[3] = &unk_264DEC6D0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.2];
}

uint64_t __42__ETColorWheelView_hideDoneButtonAnimated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideDoneButton];
}

- (void)addPickerCircleForPaletteCircle:(id)a3
{
  id v4 = a3;
  [(ETColorWheelView *)self pickerDiameter];
  double v6 = v5;
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, v6, v6);
  double v7 = [v21 layer];
  [v7 setCornerRadius:v6 * 0.5];

  double v8 = [v21 layer];
  id v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));

  v10 = [v21 layer];
  [v10 setBorderWidth:1.0];

  [(DTSColorWheel *)self setPickerCircle:v21];
  [(ETColorWheelView *)self addSubview:v21];
  [v4 center];
  double v12 = v11;
  double v14 = v13;
  CGAffineTransform v15 = [v4 superview];

  -[ETColorWheelView convertPoint:fromView:](self, "convertPoint:fromView:", v15, v12, v14);
  double v17 = v16;
  double v19 = v18;

  -[DTSColorWheel updatePickerPositionForPoint:](self, "updatePickerPositionForPoint:", v17, v19);
  RoundViewOriginToViewScale(v21);
  [(DTSColorWheel *)self pickerRotation];
  self->_originalPickerRotation = v20;
}

- (void)beganTouches:(id)a3
{
  self->_handlingTouches = 1;
  v3.receiver = self;
  v3.super_class = (Class)ETColorWheelView;
  [(DTSColorWheel *)&v3 beganTouches:a3];
}

- (void)finishedTouches
{
  v3.receiver = self;
  v3.super_class = (Class)ETColorWheelView;
  [(DTSColorWheel *)&v3 finishedTouches];
  self->_handlingTouches = 0;
}

- (BOOL)pickerShouldDismissClockwise
{
  for (double i = self->_originalPickerRotation; i < 0.0; double i = i + 6.28318531)
    ;
  double v4 = fmod(i, 6.28318531);
  if (i <= 6.28318531) {
    double v4 = i;
  }
  double v5 = 6.28318531 - v4;
  [(DTSColorWheel *)self pickerRotation];
  for (double j = v6 + v5; j < 0.0; double j = j + 6.28318531)
    ;
  double v8 = fmod(j, 6.28318531);
  if (j <= 6.28318531) {
    double v8 = j;
  }
  return v8 > 3.14159265;
}

- (double)colorWheelDismissalRotation
{
  double originalPickerRotation = self->_originalPickerRotation;
  [(DTSColorWheel *)self pickerRotation];
  double v5 = originalPickerRotation - v4;
  BOOL v6 = [(ETColorWheelView *)self pickerShouldDismissClockwise];
  if (v6 && v5 < 0.0)
  {
    do
      double v5 = v5 + 6.28318531;
    while (v5 < 0.0);
  }
  else
  {
    char v7 = v5 <= 0.0 || v6;
    if ((v7 & 1) == 0)
    {
      if (v5 < 0.0)
      {
        do
          double v5 = v5 + 6.28318531;
        while (v5 < 0.0);
      }
      else
      {
        return fmod(v5, 6.28318531) + -6.28318531;
      }
    }
  }
  return v5;
}

- (void)doneButtonTapped:(id)a3
{
}

- (void)hideColorWheelPickingColor:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(DTSColorWheel *)self pickerCircle];
  BOOL v6 = v5;
  if (v3)
  {
    char v7 = [v5 backgroundColor];
  }
  else
  {
    char v7 = 0;
  }
  [(ETColorWheelView *)self resignFirstResponder];
  double v8 = [(DTSColorWheel *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(DTSColorWheel *)self delegate];
    [v10 colorWheel:self willPickColor:v7];
  }
  gradientView = self->_gradientView;
  [(DTSColorWheel *)self hueRotation];
  [(ETColorGradientView *)gradientView prepareToAnimateColorWheelWithRotation:-v12];
  [(ETColorWheelView *)self hideDoneButtonAnimated];
  [(ETColorWheelView *)self animatePickerToOriginalPosition];
  double v13 = self->_gradientView;
  [(ETColorWheelView *)self colorWheelDismissalRotation];
  double v15 = v14;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__ETColorWheelView_hideColorWheelPickingColor___block_invoke;
  v18[3] = &unk_264DEC760;
  v18[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  [(ETColorGradientView *)v13 hideColorWheelWithRotation:v18 completion:v15];
}

void __47__ETColorWheelView_hideColorWheelPickingColor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  long long v2 = [*(id *)(a1 + 40) layer];
  [v2 removeAllAnimations];

  [*(id *)(a1 + 40) removeFromSuperview];
  BOOL v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 colorWheel:*(void *)(a1 + 32) didPickColor:*(void *)(a1 + 48)];
  }
}

- (void)animatePickerToOriginalPosition
{
  [(ETColorWheelView *)self bounds];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  CGFloat MidX = CGRectGetMidX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v27);
  [(ETColorWheelView *)self colorWheelRadius];
  double v10 = v9;
  [(ETColorWheelView *)self colorWheelRadius];
  CGFloat v12 = v10 + v11 * -0.5;
  Mutable = CGPathCreateMutable();
  BOOL v14 = [(ETColorWheelView *)self pickerShouldDismissClockwise];
  [(DTSColorWheel *)self pickerRotation];
  CGPathAddArc(Mutable, 0, MidX, MidY, v12, v15, self->_originalPickerRotation, !v14);
  id v16 = [(DTSColorWheel *)self pickerCircle];
  id v17 = [MEMORY[0x263F157D8] animationWithKeyPath:@"position"];
  double v18 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v17 setTimingFunction:v18];

  [v17 setDuration:0.275];
  [v17 setPath:Mutable];
  [v17 setFillMode:*MEMORY[0x263F15AB0]];
  [v17 setRemovedOnCompletion:0];
  id v19 = [v16 layer];
  [v19 addAnimation:v17 forKey:@"position"];

  CFRelease(Mutable);
  id v20 = (void *)MEMORY[0x263F1CB60];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke;
  v24[3] = &unk_264DEC6D0;
  id v25 = v16;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke_2;
  v22[3] = &unk_264DEC800;
  id v23 = v25;
  id v21 = v25;
  [v20 animateWithDuration:v24 animations:v22 completion:0.275];
}

void __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke(uint64_t a1)
{
  +[ETPaletteCircleView selectionMarkerDiameter];
  double v3 = v2;
  +[ETColorWheelView pickerDiameter];
  char v4 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v8, v3 / v5, v3 / v5);
  [v4 setTransform:&v8];
  BOOL v6 = *(void **)(a1 + 32);
  char v7 = +[ETPaletteCircleView selectionMarkerColor];
  [v6 setBackgroundColor:v7];
}

void __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setBorderWidth:0.0];
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedColor, 0);

  objc_storeStrong((id *)&self->_gradientView, 0);
}

@end