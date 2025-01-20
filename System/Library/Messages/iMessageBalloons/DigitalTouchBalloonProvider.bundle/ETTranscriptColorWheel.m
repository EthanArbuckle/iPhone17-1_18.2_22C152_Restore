@interface ETTranscriptColorWheel
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPresented;
- (ETTranscriptColorWheel)initWithFrame:(CGRect)a3;
- (double)_doneViewDiameter;
- (id)pickerViewHighlightedColor;
- (void)_setPickerPositionInGradientWheel;
- (void)beganTouches:(id)a3;
- (void)createDoneButtonWithFrame:(CGRect)a3;
- (void)dismissAnimatedWithDuration:(double)a3 completion:(id)a4;
- (void)doneButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)presentAnimatedWithDuration:(double)a3 completion:(id)a4;
- (void)setHueForPaletteCircle:(id)a3;
- (void)setPresented:(BOOL)a3;
@end

@implementation ETTranscriptColorWheel

- (ETTranscriptColorWheel)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ETTranscriptColorWheel;
  v3 = -[ETTranscriptColorWheel initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(ETTranscriptColorWheel *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    gradientImageView = v3->_gradientImageView;
    v3->_gradientImageView = v9;

    v11 = v3->_gradientImageView;
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = +[UIImage imageNamed:@"color-wheel-gradient" inBundle:v12];
    [(UIImageView *)v11 setImage:v13];

    [(ETTranscriptColorWheel *)v3 addSubview:v3->_gradientImageView];
    id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [v14 setUserInteractionEnabled:0];
    v15 = [v14 layer];
    id v16 = +[UIColor blackColor];
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    v17 = [v14 layer];
    [v17 setBorderWidth:2.0];

    [(ETTranscriptColorWheel *)v3 addSubview:v14];
    [(ETTranscriptColorWheel *)v3 setPickerCircle:v14];
    -[ETTranscriptColorWheel createDoneButtonWithFrame:](v3, "createDoneButtonWithFrame:", CGRectZero.origin.x, y, width, height);
    [(ETTranscriptColorWheel *)v3 setAlpha:0.0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)ETTranscriptColorWheel;
  [(ETTranscriptColorWheel *)&v27 layoutSubviews];
  [(ETTranscriptColorWheel *)self frame];
  UIRoundToViewScale();
  -[ETTranscriptColorWheel setColorWheelRadius:](self, "setColorWheelRadius:");
  UIRoundToViewScale();
  -[ETTranscriptColorWheel setGradientWidth:](self, "setGradientWidth:");
  UIRoundToViewScale();
  -[ETTranscriptColorWheel setPickerDiameter:](self, "setPickerDiameter:");
  [(ETTranscriptColorWheel *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = v7 * 0.5;
  double v12 = v9 * 0.5;
  [(ETTranscriptColorWheel *)self colorWheelRadius];
  -[UIImageView setFrame:](self->_gradientImageView, "setFrame:", 0.0, 0.0, v13 + v13, v13 + v13);
  -[UIImageView setCenter:](self->_gradientImageView, "setCenter:", v11, v12);
  [(UIView *)self->_doneView bounds];
  double Width = CGRectGetWidth(v28);
  doneView = self->_doneView;
  v29.origin.x = v4;
  v29.origin.double y = v6;
  v29.size.double width = v8;
  v29.size.double height = v10;
  double MidX = CGRectGetMidX(v29);
  v30.origin.x = v4;
  v30.origin.double y = v6;
  v30.size.double width = v8;
  v30.size.double height = v10;
  -[UIView setCenter:](doneView, "setCenter:", MidX, CGRectGetMidY(v30));
  v17 = [(UIView *)self->_doneView layer];
  [v17 setCornerRadius:Width * 0.5];

  v18 = [(ETTranscriptColorWheel *)self doneButton];
  float v19 = Width * 0.17;
  double v20 = fmax(roundf(v19), 18.0);
  v21 = [v18 titleLabel];
  v22 = +[UIFont systemFontOfSize:v20];
  [v21 setFont:v22];

  [v18 sizeToFit];
  [(UIView *)self->_doneView center];
  objc_msgSend(v18, "setCenter:");
  [(ETTranscriptColorWheel *)self pickerDiameter];
  double v24 = v23;
  v25 = [(ETTranscriptColorWheel *)self pickerCircle];
  objc_msgSend(v25, "setSize:", v24, v24);
  v26 = [v25 layer];
  [v26 setCornerRadius:v24 * 0.5];

  [(ETTranscriptColorWheel *)self _setPickerPositionInGradientWheel];
}

- (void)setHueForPaletteCircle:(id)a3
{
  uint64_t v5 = 0;
  CGFloat v4 = [a3 backgroundColor];
  [v4 getHue:&v5 saturation:0 brightness:0 alpha:0];

  RadiansFromHue();
  -[ETTranscriptColorWheel setHueRotation:](self, "setHueRotation:");
}

- (void)_setPickerPositionInGradientWheel
{
  [(ETTranscriptColorWheel *)self bounds];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v17);
  [(ETTranscriptColorWheel *)self colorWheelRadius];
  double v10 = v9;
  [(ETTranscriptColorWheel *)self gradientWidth];
  double v12 = v10 + v11 * -0.5;
  [(ETTranscriptColorWheel *)self hueRotation];
  __double2 v14 = __sincos_stret(v13);

  -[ETTranscriptColorWheel updatePickerPositionForPoint:](self, "updatePickerPositionForPoint:", MidX + v12 * v14.__cosval, MidY - v12 * v14.__sinval);
}

- (double)_doneViewDiameter
{
  [(ETTranscriptColorWheel *)self colorWheelRadius];
  double v4 = v3;
  [(ETTranscriptColorWheel *)self gradientWidth];
  return v4 - v5 + -2.0 + v4 - v5 + -2.0;
}

- (void)presentAnimatedWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeScale(&v25, 0.8, 0.8);
  gradientImageView = self->_gradientImageView;
  CGAffineTransform v24 = v25;
  [(UIImageView *)gradientImageView setTransform:&v24];
  [(UIImageView *)self->_gradientImageView setAlpha:0.0];
  CGFloat v8 = [(ETTranscriptColorWheel *)self pickerCircle];
  [v8 setAlpha:0.0];

  double v9 = [(ETTranscriptColorWheel *)self pickerCircle];
  CGAffineTransform v24 = v25;
  [v9 setTransform:&v24];

  double v10 = [(ETTranscriptColorWheel *)self doneButton];
  [v10 setAlpha:0.0];
  [(ETTranscriptColorWheel *)self _doneViewDiameter];
  double v12 = v11;
  -[UIView setSize:](self->_doneView, "setSize:", v11, v11);
  doneView = self->_doneView;
  __double2 v14 = +[UIColor blackColor];
  [(UIView *)doneView setBackgroundColor:v14];

  [(ETTranscriptColorWheel *)self colorWheelRadius];
  CGRect v16 = self->_doneView;
  CGAffineTransformMakeScale(&v23, (v15 + v15) * 0.8 / v12, (v15 + v15) * 0.8 / v12);
  [(UIView *)v16 setTransform:&v23];
  self->_presented = 1;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_109EC;
  v21[3] = &unk_248A8;
  v21[4] = self;
  id v22 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10AF4;
  v19[3] = &unk_248F8;
  id v20 = v6;
  id v17 = v6;
  id v18 = v10;
  +[UIView animateWithDuration:v21 animations:v19 completion:a3];
}

- (void)dismissAnimatedWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = [(ETTranscriptColorWheel *)self doneButton];
  [(ETTranscriptColorWheel *)self colorWheelRadius];
  double v9 = v8 + v8;
  [(ETTranscriptColorWheel *)self _doneViewDiameter];
  self->_presented = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10C60;
  v15[3] = &unk_24B00;
  id v16 = v7;
  id v17 = self;
  double v18 = v9 * 0.8 / v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10D68;
  v13[3] = &unk_24B28;
  v13[4] = self;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  +[UIView animateWithDuration:v15 animations:v13 completion:a3];
}

- (void)beganTouches:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ETTranscriptColorWheel;
  [(ETTranscriptColorWheel *)&v9 beganTouches:a3];
  double v4 = [(ETTranscriptColorWheel *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ETTranscriptColorWheel *)self delegate];
    double v7 = [(ETTranscriptColorWheel *)self pickerCircle];
    double v8 = [v7 backgroundColor];
    [v6 colorWheel:self pickerColorChanged:v8];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ETTranscriptColorWheel;
    BOOL v5 = [(ETTranscriptColorWheel *)&v7 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = [(ETTranscriptColorWheel *)self pickerCircle];
  id v8 = [v4 backgroundColor];

  BOOL v5 = [(ETTranscriptColorWheel *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(ETTranscriptColorWheel *)self delegate];
    [v7 colorWheel:self didPickColor:v8];
  }
}

- (id)pickerViewHighlightedColor
{
  [(ETTranscriptColorWheel *)self pickerRotation];
  HueFromRadians();

  return +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:");
}

- (void)createDoneButtonWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)ETTranscriptColorWheel;
  -[ETTranscriptColorWheel createDoneButtonWithFrame:](&v14, "createDoneButtonWithFrame:");
  id v8 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
  doneView = self->_doneView;
  self->_doneView = v8;

  double v10 = self->_doneView;
  id v11 = +[UIColor blackColor];
  [(UIView *)v10 setBackgroundColor:v11];

  id v12 = self->_doneView;
  double v13 = [(ETTranscriptColorWheel *)self doneButton];
  [(ETTranscriptColorWheel *)self insertSubview:v12 below:v13];
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneView, 0);

  objc_storeStrong((id *)&self->_gradientImageView, 0);
}

@end