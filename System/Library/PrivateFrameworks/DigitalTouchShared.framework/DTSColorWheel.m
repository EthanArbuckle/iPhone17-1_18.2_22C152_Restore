@interface DTSColorWheel
- (DTSColorWheelDelegate)delegate;
- (UIButton)doneButton;
- (UIView)pickerCircle;
- (double)colorWheelRadius;
- (double)gradientWidth;
- (double)hueRotation;
- (double)pickerDiameter;
- (double)pickerRotation;
- (id)pickerViewHighlightedColor;
- (void)beganTouches:(id)a3;
- (void)createDoneButtonWithFrame:(CGRect)a3;
- (void)finishedTouches;
- (void)setColorWheelRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setGradientWidth:(double)a3;
- (void)setHueRotation:(double)a3;
- (void)setPickerCircle:(id)a3;
- (void)setPickerDiameter:(double)a3;
- (void)setPickerRotation:(double)a3;
- (void)updatePickerPositionForPoint:(CGPoint)a3;
@end

@implementation DTSColorWheel

- (void)beganTouches:(id)a3
{
  id v4 = [a3 anyObject];
  [v4 locationInView:self];
  -[DTSColorWheel updatePickerPositionForPoint:](self, "updatePickerPositionForPoint:");
}

- (void)finishedTouches
{
  id v2 = [(DTSColorWheel *)self pickerCircle];
  RoundViewOriginToViewScale(v2);
}

- (void)createDoneButtonWithFrame:(CGRect)a3
{
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C488]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"COLOR_PICKER_DONE_TEXT" value:&stru_26EE9C2B0 table:@"DigitalTouchShared-Localizable"];

  [v7 setTitle:v5 forState:0];
  v6 = [MEMORY[0x263F1C550] whiteColor];
  [v7 setTitleColor:v6 forState:0];

  [v7 addTarget:self action:sel_doneButtonTapped_ forControlEvents:64];
  [(DTSColorWheel *)self addSubview:v7];
  [(DTSColorWheel *)self setDoneButton:v7];
}

- (void)updatePickerPositionForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(DTSColorWheel *)self bounds];
  CGFloat v6 = v25.origin.x;
  CGFloat v7 = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double v10 = CGRectGetWidth(v25) * 0.5;
  v26.origin.double x = v6;
  v26.origin.double y = v7;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v26) * 0.5;
  double v12 = x - v10;
  double v13 = y - v11;
  double v14 = hypot(v12, v13);
  if (v14 != 0.0)
  {
    double v15 = v14;
    [(DTSColorWheel *)self colorWheelRadius];
    double v17 = v16;
    [(DTSColorWheel *)self gradientWidth];
    double v19 = (v17 + v18 * -0.5) / v15;
    long double v20 = v12 * v19;
    long double v21 = v13 * v19;
    id v23 = [(DTSColorWheel *)self pickerCircle];
    [(DTSColorWheel *)self setPickerRotation:(double)atan2(v21, v20)];
    v22 = [(DTSColorWheel *)self pickerViewHighlightedColor];
    [v23 setBackgroundColor:v22];

    objc_msgSend(v23, "setCenter:", (double)(v10 + v20), (double)(v11 + v21));
  }
}

- (id)pickerViewHighlightedColor
{
  return 0;
}

- (DTSColorWheelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DTSColorWheelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)colorWheelRadius
{
  return self->_colorWheelRadius;
}

- (void)setColorWheelRadius:(double)a3
{
  self->_colorWheelRadius = a3;
}

- (double)gradientWidth
{
  return self->_gradientWidth;
}

- (void)setGradientWidth:(double)a3
{
  self->_gradientWidth = a3;
}

- (double)pickerDiameter
{
  return self->_pickerDiameter;
}

- (void)setPickerDiameter:(double)a3
{
  self->_pickerDiameter = a3;
}

- (double)hueRotation
{
  return self->_hueRotation;
}

- (void)setHueRotation:(double)a3
{
  self->_hueRotation = a3;
}

- (double)pickerRotation
{
  return self->_pickerRotation;
}

- (void)setPickerRotation:(double)a3
{
  self->_pickerRotation = a3;
}

- (UIView)pickerCircle
{
  return self->_pickerCircle;
}

- (void)setPickerCircle:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_pickerCircle, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end