@interface GCControllerThumbstickInputView
- (BOOL)actsAsTouchpad;
- (GCControllerThumbstickInputView)init;
- (GCControllerThumbstickInputView)initWithCoder:(id)a3;
- (uint64_t)valueChangedHandler;
- (void)encodeWithCoder:(id)a3;
- (void)initButtons;
- (void)processTouch:(id)a3;
- (void)setActsAsTouchpad:(BOOL)a3;
- (void)setThumbstickPos:(CGPoint)a3 center:(CGPoint)a4;
- (void)setValueChangedHandler:(void *)a1;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation GCControllerThumbstickInputView

- (GCControllerThumbstickInputView)init
{
  v5.receiver = self;
  v5.super_class = (Class)GCControllerThumbstickInputView;
  v2 = -[GCControllerThumbstickInputView initWithFrame:](&v5, "initWithFrame:", 0.0, 0.0, 150.0, 150.0);
  v3 = v2;
  if (v2)
  {
    [(GCControllerThumbstickInputView *)v2 initButtons];
    [(GCControllerThumbstickInputView *)v3 setUserInteractionEnabled:1];
  }
  return v3;
}

- (GCControllerThumbstickInputView)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCControllerThumbstickInputView;
  objc_super v5 = [(GCControllerThumbstickInputView *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"background"];
    background = v5->_background;
    v5->_background = (UIVisualEffectView *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"touchTarget"];
    touchTarget = v5->_touchTarget;
    v5->_touchTarget = (UIVisualEffectView *)v8;

    [(GCControllerThumbstickInputView *)v5 setUserInteractionEnabled:1];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCControllerThumbstickInputView;
  id v4 = a3;
  [(GCControllerThumbstickInputView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_background, @"background", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_touchTarget forKey:@"touchTarget"];
}

- (BOOL)actsAsTouchpad
{
  return [(UIVisualEffectView *)self->_touchTarget isHidden];
}

- (void)setActsAsTouchpad:(BOOL)a3
{
}

- (void)processTouch:(id)a3
{
  [a3 locationInView:self->_background];
  double v5 = v4;
  double v7 = v6;
  background = self->_background;
  [(UIVisualEffectView *)background center];
  double v10 = v9;
  double v12 = v11;
  v13 = [(UIVisualEffectView *)self->_background superview];
  -[UIVisualEffectView convertPoint:fromView:](background, "convertPoint:fromView:", v13, v10, v12);
  double v15 = v14;
  double v17 = v16;

  if ([(UIVisualEffectView *)self->_touchTarget isHidden])
  {
    p_touchPrevPos = &self->_touchPrevPos;
    valueChangedHandler = (void (**)(__n128, __n128))self->_valueChangedHandler;
    if (valueChangedHandler)
    {
      v18.n128_f64[0] = (v5 - p_touchPrevPos->x) / 50.0;
      v18.n128_f32[0] = v18.n128_f64[0];
      v18.n128_f32[0] = v18.n128_f32[0] + v18.n128_f32[0];
      v19.n128_f64[0] = (v7 - self->_touchPrevPos.y) / -50.0;
      v19.n128_f32[0] = v19.n128_f64[0];
      v19.n128_f32[0] = v19.n128_f32[0] + v19.n128_f32[0];
      if (sqrtf((float)(v19.n128_f32[0] * v19.n128_f32[0]) + (float)(v18.n128_f32[0] * v18.n128_f32[0])) < 0.1)
      {
        v19.n128_f32[0] = 0.0;
        v18.n128_f32[0] = 0.0;
      }
      valueChangedHandler[2](v18, v19);
    }
    p_touchPrevPos->x = v5;
    self->_touchPrevPos.y = v7;
  }
  else
  {
    double v22 = v15 + v5 - self->_touchStartPos.x;
    double v23 = v17 + v7 - self->_touchStartPos.y;
    double v24 = v22 - v15;
    double v25 = v23 - v17;
    float v26 = v25 * v25 + v24 * v24;
    float v27 = sqrtf(v26);
    if (v27 > 50.0)
    {
      double v28 = (float)(50.0 / v27);
      double v29 = v24 * v28;
      double v30 = v25 * v28;
      double v22 = v15 + v29;
      double v23 = v17 + v30;
    }
    -[GCControllerThumbstickInputView setThumbstickPos:center:](self, "setThumbstickPos:center:", v22, v23, v15, v17);
  }
}

- (uint64_t)valueChangedHandler
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v10 = a3;
  if ([v10 count] == (char *)&dword_0 + 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);

    if (!WeakRetained)
    {
      double v6 = [v10 anyObject];
      objc_storeWeak((id *)&self->_currentTouch, v6);
      [v6 locationInView:self->_background];
      self->_touchStartPos.x = v7;
      self->_touchStartPos.y = v8;
      self->_touchPrevPos = self->_touchStartPos;
      self->_prevThumbstickMagnitude = 0.0;
      double v9 = +[GCControllerViewFeedback sharedInstance];
      [v9 buttonDown];

      [(GCControllerThumbstickInputView *)self processTouch:v6];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  BOOL v5 = [v9 count] == (char *)&dword_0 + 1;
  double v6 = v9;
  if (v5)
  {
    id v7 = [v9 anyObject];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);

    if (WeakRetained == v7) {
      [(GCControllerThumbstickInputView *)self processTouch:v7];
    }

    double v6 = v9;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v20 = a3;
  BOOL v5 = [v20 count] == (char *)&dword_0 + 1;
  double v6 = v20;
  if (v5)
  {
    id v7 = [v20 anyObject];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);

    if (WeakRetained == v7)
    {
      objc_storeWeak((id *)&self->_currentTouch, 0);
      id v9 = +[GCControllerViewFeedback sharedInstance];
      [v9 buttonUp];

      background = self->_background;
      [(UIVisualEffectView *)background center];
      double v12 = v11;
      double v14 = v13;
      double v15 = [(UIVisualEffectView *)self->_background superview];
      -[UIVisualEffectView convertPoint:fromView:](background, "convertPoint:fromView:", v15, v12, v14);
      double v17 = v16;
      double v19 = v18;

      -[GCControllerThumbstickInputView setThumbstickPos:center:](self, "setThumbstickPos:center:", v17, v19, v17, v19);
    }

    double v6 = v20;
  }
}

- (void)setThumbstickPos:(CGPoint)a3 center:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  -[UIVisualEffectView setCenter:](self->_touchTarget, "setCenter:");
  float v10 = (v7 - x) / 50.0;
  v13.n128_f64[0] = (v6 - y) / -50.0;
  float v11 = v13.n128_f64[0];
  float v12 = sqrtf((float)(v11 * v11) + (float)(v10 * v10));
  v13.n128_u32[0] = LODWORD(self->_prevThumbstickMagnitude);
  if (v13.n128_f32[0] < 0.99 && v12 >= 0.99)
  {
    double v14 = +[GCControllerViewFeedback sharedInstance];
    [v14 thumbstickLimit];

    v13.n128_u32[0] = LODWORD(self->_prevThumbstickMagnitude);
  }
  if (v13.n128_f32[0] >= 0.1 && v12 < 0.1)
  {
    double v15 = +[GCControllerViewFeedback sharedInstance];
    [v15 thumbstickLimit];
  }
  v9.n128_u64[0] = 0;
  if (v12 >= 0.1) {
    float v16 = v12;
  }
  else {
    float v16 = 0.0;
  }
  self->_prevThumbstickMagnitude = v16;
  id valueChangedHandler = self->_valueChangedHandler;
  if (valueChangedHandler)
  {
    if (v12 >= 0.1) {
      v13.n128_f32[0] = v10;
    }
    else {
      v13.n128_f32[0] = 0.0;
    }
    if (v12 >= 0.1) {
      v9.n128_f32[0] = v11;
    }
    double v18 = (void (*)(__n128, __n128))*((void *)valueChangedHandler + 2);
    v18(v13, v9);
  }
}

- (void)initButtons
{
  GCVirtualControllerBlurEffectView();
  v3 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  background = self->_background;
  self->_background = v3;

  [(GCControllerThumbstickInputView *)self frame];
  -[UIVisualEffectView setFrame:](self->_background, "setFrame:");
  [(UIVisualEffectView *)self->_background frame];
  double v6 = v5 * 0.5;
  double v7 = [(UIVisualEffectView *)self->_background layer];
  [v7 setCornerRadius:v6];

  CGFloat v8 = [(UIVisualEffectView *)self->_background layer];
  [v8 setMasksToBounds:1];

  [(GCControllerThumbstickInputView *)self addSubview:self->_background];
  [(GCControllerThumbstickInputView *)self frame];
  double v10 = v9;
  [(GCControllerThumbstickInputView *)self frame];
  double v12 = v11;
  GCVirtualControllerSaturationVibrancyEffectView();
  __n128 v13 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  touchTarget = self->_touchTarget;
  self->_touchTarget = v13;

  -[UIVisualEffectView setFrame:](self->_touchTarget, "setFrame:", v10, v12, 50.0, 50.0);
  double v15 = self->_background;
  [(UIVisualEffectView *)v15 center];
  double v17 = v16;
  double v19 = v18;
  id v20 = [(UIVisualEffectView *)self->_background superview];
  -[UIVisualEffectView convertPoint:fromView:](v15, "convertPoint:fromView:", v20, v17, v19);
  -[UIVisualEffectView setCenter:](self->_touchTarget, "setCenter:");

  v21 = [(UIVisualEffectView *)self->_touchTarget layer];
  [v21 setMasksToBounds:1];

  [(UIVisualEffectView *)self->_touchTarget setHidden:0];
  id v29 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v10, v12, 50.0, 50.0);
  double v22 = GCVirtualControllerVibrancyOverlayBackgroundColor();
  [v29 setBackgroundColor:v22];

  [(UIVisualEffectView *)self->_touchTarget frame];
  double v24 = v23 * 0.5;
  double v25 = [v29 layer];
  [v25 setCornerRadius:v24];

  float v26 = [v29 layer];
  [v26 setMasksToBounds:1];

  float v27 = [(UIVisualEffectView *)self->_touchTarget contentView];
  [v27 addSubview:v29];

  double v28 = [(UIVisualEffectView *)self->_background contentView];
  [v28 addSubview:self->_touchTarget];
}

- (void)setValueChangedHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueChangedHandler, 0);
  objc_destroyWeak((id *)&self->_currentTouch);
  objc_storeStrong((id *)&self->_touchTarget, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

@end