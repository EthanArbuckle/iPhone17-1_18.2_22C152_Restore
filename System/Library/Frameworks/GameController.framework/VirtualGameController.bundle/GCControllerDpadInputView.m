@interface GCControllerDpadInputView
- (GCControllerDpadInputView)initWithCoder:(id)a3;
- (GCControllerDpadInputView)initWithFrame:(CGRect)a3;
- (id)createDpadButton:(CGPoint)a3 backingMask:(id)a4 fillMask:(id)a5;
- (uint64_t)valueChangedHandler;
- (void)encodeWithCoder:(id)a3;
- (void)initButtons;
- (void)processTouch:(id)a3;
- (void)setHighlight:(id)a3 highlight:(BOOL)a4;
- (void)setThumbstickPos:(CGPoint)a3 center:(CGPoint)a4;
- (void)setValueChangedHandler:(void *)a1;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation GCControllerDpadInputView

- (GCControllerDpadInputView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCControllerDpadInputView;
  v3 = -[GCControllerDpadInputView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(GCControllerDpadInputView *)v3 initButtons];
    [(GCControllerDpadInputView *)v4 setUserInteractionEnabled:1];
  }
  return v4;
}

- (GCControllerDpadInputView)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GCControllerDpadInputView;
  v5 = [(GCControllerDpadInputView *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_touchArea"];
    touchArea = v5->_touchArea;
    v5->_touchArea = (UIView *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_up"];
    up = v5->_up;
    v5->_up = (UIVisualEffectView *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_down"];
    down = v5->_down;
    v5->_down = (UIVisualEffectView *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_left"];
    left = v5->_left;
    v5->_left = (UIVisualEffectView *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_right"];
    right = v5->_right;
    v5->_right = (UIVisualEffectView *)v14;

    [(GCControllerDpadInputView *)v5 setUserInteractionEnabled:1];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCControllerDpadInputView;
  id v4 = a3;
  [(GCControllerDpadInputView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_touchArea, @"_touchArea", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_up forKey:@"_up"];
  [v4 encodeObject:self->_down forKey:@"_down"];
  [v4 encodeObject:self->_left forKey:@"_left"];
  [v4 encodeObject:self->_right forKey:@"_right"];
}

- (id)createDpadButton:(CGPoint)a3 backingMask:(id)a4 fillMask:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = GCVirtualControllerBlurEffectView();
  id v11 = [objc_alloc((Class)UIImageView) initWithImage:v9];
  [v10 setMaskView:v11];

  [v9 size];
  double v13 = v12;
  [v9 size];
  double v15 = v14;

  objc_msgSend(v10, "setFrame:", x, y, v13, v15);
  v16 = GCVirtualControllerSaturationVibrancyEffectView();
  [v10 frame];
  double v18 = v17;
  [v10 frame];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v18);
  [v16 setTag:1];
  id v19 = objc_alloc((Class)UIView);
  [v10 frame];
  id v20 = objc_msgSend(v19, "initWithFrame:");
  v21 = GCVirtualControllerVibrancyOverlayBackgroundColor();
  [v20 setBackgroundColor:v21];

  id v22 = [objc_alloc((Class)UIImageView) initWithImage:v8];
  [v20 setMaskView:v22];

  [v10 frame];
  double v24 = v23 * 0.5;
  [v10 frame];
  objc_msgSend(v20, "setCenter:", v24, v25 * 0.5);
  v26 = [v16 contentView];
  [v26 addSubview:v20];

  v27 = GCVirtualControllerAdditiveVibrancyEffectView();
  [v10 frame];
  double v29 = v28;
  [v10 frame];
  objc_msgSend(v27, "setFrame:", 0.0, 0.0, v29);
  [v27 setHidden:1];
  [v27 setTag:2];
  id v30 = objc_alloc((Class)UIView);
  [v10 frame];
  id v31 = objc_msgSend(v30, "initWithFrame:");
  v32 = GCVirtualControllerVibrancyOverlayBackgroundColor();
  [v31 setBackgroundColor:v32];

  id v33 = [objc_alloc((Class)UIImageView) initWithImage:v8];
  [v31 setMaskView:v33];

  [v10 frame];
  double v35 = v34 * 0.5;
  [v10 frame];
  objc_msgSend(v31, "setCenter:", v35, v36 * 0.5);
  v37 = [v27 contentView];
  [v37 addSubview:v31];

  v38 = [v10 contentView];
  [v38 addSubview:v16];

  v39 = [v10 contentView];
  [v39 addSubview:v27];

  return v10;
}

- (void)initButtons
{
  VirtualControllerBundle();
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[UIImage imageNamed:@"dpad_backing_mask" inBundle:v61 withConfiguration:0];
  id v4 = [v3 CGImage];
  [v3 scale];
  objc_super v5 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v4, 1);
  id v6 = v3;
  id v7 = [v6 CGImage];
  [v6 scale];
  id v8 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v7, 2);
  id v9 = v6;
  id v10 = [v9 CGImage];
  [v9 scale];
  id v11 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v10, 3);
  id v12 = +[UIImage imageNamed:@"dpad_fill_mask" inBundle:v61 withConfiguration:0];
  id v13 = [v12 CGImage];
  [v12 scale];
  double v14 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v13, 1);
  id v15 = v12;
  id v16 = [v15 CGImage];
  [v15 scale];
  double v17 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v16, 2);
  id v18 = v15;
  id v19 = [v18 CGImage];
  [v18 scale];
  id v20 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v19, 3);
  [v9 size];
  float v22 = v21 + 11.0 + v21 + 11.0;
  [(GCControllerDpadInputView *)self frame];
  double v23 = v22;
  double v25 = (v24 - v23) * 0.5;
  [(GCControllerDpadInputView *)self frame];
  v27 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v25, (v26 - v23) * 0.5, v23, v23);
  touchArea = self->_touchArea;
  self->_touchArea = v27;

  [(UIView *)self->_touchArea setHidden:1];
  [(GCControllerDpadInputView *)self addSubview:self->_touchArea];
  [(GCControllerDpadInputView *)self frame];
  double v30 = v29;
  [v9 size];
  double v32 = v31 * -0.5 + v30 * 0.5;
  [(GCControllerDpadInputView *)self frame];
  double v34 = v33;
  [v9 size];
  -[GCControllerDpadInputView createDpadButton:backingMask:fillMask:](self, "createDpadButton:backingMask:fillMask:", v9, v18, v32, -11.0 - (v35 - v34 * 0.5));
  double v36 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  up = self->_up;
  self->_up = v36;

  [(GCControllerDpadInputView *)self addSubview:self->_up];
  [(GCControllerDpadInputView *)self frame];
  double v39 = v38;
  [v5 size];
  double v41 = v40 * -0.5 + v39 * 0.5;
  [(GCControllerDpadInputView *)self frame];
  -[GCControllerDpadInputView createDpadButton:backingMask:fillMask:](self, "createDpadButton:backingMask:fillMask:", v5, v14, v41, v42 * 0.5 + 11.0);
  v43 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  down = self->_down;
  self->_down = v43;

  [(GCControllerDpadInputView *)self addSubview:self->_down];
  [(GCControllerDpadInputView *)self frame];
  double v46 = v45;
  [v8 size];
  double v48 = -11.0 - (v47 - v46 * 0.5);
  [(GCControllerDpadInputView *)self frame];
  double v50 = v49;
  [v8 size];
  -[GCControllerDpadInputView createDpadButton:backingMask:fillMask:](self, "createDpadButton:backingMask:fillMask:", v8, v17, v48, v51 * -0.5 + v50 * 0.5);
  v52 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  left = self->_left;
  self->_left = v52;

  [(GCControllerDpadInputView *)self addSubview:self->_left];
  [(GCControllerDpadInputView *)self frame];
  double v55 = v54 * 0.5 + 11.0;
  [(GCControllerDpadInputView *)self frame];
  double v57 = v56;
  [v8 size];
  -[GCControllerDpadInputView createDpadButton:backingMask:fillMask:](self, "createDpadButton:backingMask:fillMask:", v11, v20, v55, v58 * -0.5 + v57 * 0.5);
  v59 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  right = self->_right;
  self->_right = v59;

  [(GCControllerDpadInputView *)self addSubview:self->_right];
}

- (void)processTouch:(id)a3
{
  [a3 locationInView:self->_touchArea];
  double v5 = v4;
  double v7 = v6;
  touchArea = self->_touchArea;
  [(UIView *)touchArea center];
  double v10 = v9;
  double v12 = v11;
  id v13 = [(UIView *)self->_touchArea superview];
  -[UIView convertPoint:fromView:](touchArea, "convertPoint:fromView:", v13, v10, v12);
  double v37 = v14;
  double v16 = v15;

  [(UIView *)self->_touchArea frame];
  double v18 = v17 / 3.0;
  [(UIView *)self->_touchArea frame];
  double v20 = v19 / 3.0;
  [(UIView *)self->_touchArea frame];
  double v22 = v21;
  [(UIView *)self->_touchArea frame];
  double v24 = v23;
  [(UIView *)self->_touchArea frame];
  double v26 = v25 - v18;
  [(UIView *)self->_touchArea frame];
  double v28 = v27 - v20;
  if (v5 >= v22) {
    double v29 = v5;
  }
  else {
    double v29 = v22;
  }
  if (v7 >= v24) {
    double v30 = v7;
  }
  else {
    double v30 = v24;
  }
  if (v29 > v26) {
    double v29 = v26;
  }
  if (v30 <= v28) {
    double v28 = v30;
  }
  float v31 = v29;
  float v32 = v18;
  double v33 = (float)(floorf(v31 / v32) * v32);
  float v34 = v28;
  float v35 = v20;
  double v36 = (float)(floorf(v34 / v35) * v35);

  -[GCControllerDpadInputView setThumbstickPos:center:](self, "setThumbstickPos:center:", v33 + v18 * 0.5, v36 + v20 * 0.5, v37, v16);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  if ([v8 count] == (char *)&dword_0 + 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);

    if (!WeakRetained)
    {
      double v6 = [v8 anyObject];
      objc_storeWeak((id *)&self->_currentTouch, v6);
      double v7 = +[GCControllerViewFeedback sharedInstance];
      [v7 buttonDown];

      [(GCControllerDpadInputView *)self processTouch:v6];
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
      [(GCControllerDpadInputView *)self processTouch:v7];
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

      touchArea = self->_touchArea;
      [(UIView *)touchArea center];
      double v12 = v11;
      double v14 = v13;
      double v15 = [(UIView *)self->_touchArea superview];
      -[UIView convertPoint:fromView:](touchArea, "convertPoint:fromView:", v15, v12, v14);
      double v17 = v16;
      double v19 = v18;

      -[GCControllerDpadInputView setThumbstickPos:center:](self, "setThumbstickPos:center:", v17, v19, v17, v19);
    }

    double v6 = v20;
  }
}

- (void)setHighlight:(id)a3 highlight:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = [v5 contentView];
  id v10 = [v6 viewWithTag:1];

  id v7 = [v5 contentView];

  id v8 = [v7 viewWithTag:2];

  unsigned int v9 = [v10 isHidden];
  if (!v4)
  {
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ((v9 & 1) == 0)
  {
LABEL_5:
    [v10 setHidden:v4];
    [v8 setHidden:v4 ^ 1];
  }
LABEL_6:
}

- (void)setThumbstickPos:(CGPoint)a3 center:(CGPoint)a4
{
  double y = a4.y;
  double v5 = a3.y;
  CGFloat v7 = a3.x - a4.x;
  [(UIView *)self->_touchArea frame];
  *(float *)&CGFloat v7 = v7 / (v8 / 3.0);
  [(UIView *)self->_touchArea frame];
  float v10 = (v5 - y) / (v9 / 3.0);
  float v11 = floor(*(float *)&v7 + 0.5);
  float v12 = floor(0.5 - v10);
  [(GCControllerDpadInputView *)self setHighlight:self->_up highlight:v12 > 0.0];
  [(GCControllerDpadInputView *)self setHighlight:self->_down highlight:v12 < 0.0];
  [(GCControllerDpadInputView *)self setHighlight:self->_left highlight:v11 < 0.0];
  [(GCControllerDpadInputView *)self setHighlight:self->_right highlight:v11 > 0.0];
  id valueChangedHandler = self->_valueChangedHandler;
  if (valueChangedHandler)
  {
    double v16 = (void (*)(__n128, __n128))*((void *)valueChangedHandler + 2);
    v13.n128_f32[0] = v11;
    v14.n128_f32[0] = v12;
    v16(v13, v14);
  }
}

- (uint64_t)valueChangedHandler
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void)setValueChangedHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueChangedHandler, 0);
  objc_destroyWeak((id *)&self->_currentTouch);
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
  objc_storeStrong((id *)&self->_down, 0);
  objc_storeStrong((id *)&self->_up, 0);

  objc_storeStrong((id *)&self->_touchArea, 0);
}

@end