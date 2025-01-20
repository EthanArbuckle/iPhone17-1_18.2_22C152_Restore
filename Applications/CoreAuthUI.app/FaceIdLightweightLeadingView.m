@interface FaceIdLightweightLeadingView
- (CGColor)_tintColorForState:(int64_t)a3;
- (FaceIdLightweightLeadingView)init;
- (FaceIdLightweightLeadingView)initWithInitialState:(int64_t)a3;
- (double)_opacityForState:(int64_t)a3;
- (id)_animationForState:(int64_t)a3 propertyName:(id)a4;
- (int64_t)state;
- (void)_setState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setup;
- (void)_updateOpacityForState:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateTintColorForState:(int64_t)a3 animated:(BOOL)a4;
- (void)setState:(int64_t)a3;
@end

@implementation FaceIdLightweightLeadingView

- (FaceIdLightweightLeadingView)init
{
  return [(FaceIdLightweightLeadingView *)self initWithInitialState:0];
}

- (FaceIdLightweightLeadingView)initWithInitialState:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FaceIdLightweightLeadingView;
  v4 = -[FaceIdLightweightLeadingView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = (LACUIFaceIDSpinnerView *)[objc_alloc((Class)LACUIFaceIDSpinnerView) initWithInitialState:3];
    faceIDSpinnerView = v4->_faceIDSpinnerView;
    v4->_faceIDSpinnerView = v5;

    v4->_state = a3;
    v7 = [(LACUIFaceIDSpinnerView *)v4->_faceIDSpinnerView faceLayer];
    v4->_defaultContentsMultiplyColor = (CGColor *)[v7 contentsMultiplyColor];

    [(FaceIdLightweightLeadingView *)v4 _setup];
  }
  return v4;
}

- (void)_setup
{
  [(FaceIdLightweightLeadingView *)self addSubview:self->_faceIDSpinnerView];
  [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(FaceIdLightweightLeadingView *)self _setState:self->_state animated:0];
  v15 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView leadingAnchor];
  v14 = [(FaceIdLightweightLeadingView *)self leadingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v16[0] = v13;
  v3 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView trailingAnchor];
  v4 = [(FaceIdLightweightLeadingView *)self trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v16[1] = v5;
  v6 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView topAnchor];
  v7 = [(FaceIdLightweightLeadingView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v16[2] = v8;
  objc_super v9 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView bottomAnchor];
  v10 = [(FaceIdLightweightLeadingView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v16[3] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[FaceIdLightweightLeadingView _setState:animated:](self, "_setState:animated:");
  }
}

- (void)_setState:(int64_t)a3 animated:(BOOL)a4
{
  +[CATransaction begin];
  [(FaceIdLightweightLeadingView *)self _updateOpacityForState:a3 animated:1];
  [(FaceIdLightweightLeadingView *)self _updateTintColorForState:a3 animated:1];

  +[CATransaction commit];
}

- (void)_updateOpacityForState:(int64_t)a3 animated:(BOOL)a4
{
  -[FaceIdLightweightLeadingView _opacityForState:](self, "_opacityForState:");
  float v8 = v7;
  objc_super v9 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
  [v9 opacity];
  float v11 = v10;

  if (v11 != v8)
  {
    if (a4)
    {
      id v20 = [(FaceIdLightweightLeadingView *)self _animationForState:a3 propertyName:@"opacity"];
      v12 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      [v12 opacity];
      v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v20 setFromValue:v13];

      *(float *)&double v14 = v8;
      v15 = +[NSNumber numberWithFloat:v14];
      [v20 setToValue:v15];

      v16 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      *(float *)&double v17 = v8;
      [v16 setOpacity:v17];

      v18 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      [v18 addAnimation:v20 forKey:@"opacity"];
    }
    else
    {
      id v20 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      *(float *)&double v19 = v8;
      [v20 setOpacity:v19];
    }
  }
}

- (void)_updateTintColorForState:(int64_t)a3 animated:(BOOL)a4
{
  double v7 = -[FaceIdLightweightLeadingView _tintColorForState:](self, "_tintColorForState:");
  float v8 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
  BOOL v9 = CGColorEqualToColor(v7, (CGColorRef)[v8 contentsMultiplyColor]);

  if (!v9)
  {
    if (a4)
    {
      id v13 = [(FaceIdLightweightLeadingView *)self _animationForState:a3 propertyName:@"contentsMultiplyColor"];
      float v10 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      [v13 setFromValue:[v10 contentsMultiplyColor]];

      [v13 setToValue:v7];
      float v11 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      [v11 setContentsMultiplyColor:v7];

      v12 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      [v12 addAnimation:v13 forKey:@"contentsMultiplyColor"];
    }
    else
    {
      id v13 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView faceLayer];
      [v13 setContentsMultiplyColor:v7];
    }
  }
}

- (double)_opacityForState:(int64_t)a3
{
  double result = 0.4;
  if (a3 == 1) {
    double result = 1.0;
  }
  if (a3 == 2) {
    return 0.2;
  }
  return result;
}

- (CGColor)_tintColorForState:(int64_t)a3
{
  if (!a3 || a3 == 2) {
    return (CGColor *)*((void *)self + 3);
  }
  if (a3 == 1)
  {
    v3 = +[UIColor systemGreenColor];
    v4 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    id v5 = [v3 resolvedColorWithTraitCollection:v4];
    v6 = (CGColor *)[v5 CGColor];

    return v6;
  }
  return self;
}

- (id)_animationForState:(int64_t)a3 propertyName:(id)a4
{
  v4 = +[CABasicAnimation animationWithKeyPath:a4];
  [v4 setDuration:0.25];

  return v4;
}

- (void).cxx_destruct
{
}

@end