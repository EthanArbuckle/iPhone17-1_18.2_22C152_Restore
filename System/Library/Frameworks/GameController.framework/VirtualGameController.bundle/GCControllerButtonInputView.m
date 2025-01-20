@interface GCControllerButtonInputView
- (GCControllerButtonInputView)initWithCoder:(id)a3;
- (GCControllerButtonInputView)initWithFrame:(CGRect)a3;
- (GCControllerButtonInputView)initWithText:(id)a3;
- (UIBezierPath)customImage;
- (uint64_t)valueChangedHandler;
- (void)encodeWithCoder:(id)a3;
- (void)initUI;
- (void)setCustomImage:(id)a3;
- (void)setText;
- (void)setValueChangedHandler:(void *)a1;
- (void)setupActions;
- (void)triggerButtonWithValue:(float)a3;
@end

@implementation GCControllerButtonInputView

- (GCControllerButtonInputView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)GCControllerButtonInputView;
  v7 = -[GCControllerButtonInputView initWithFrame:](&v10, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    [(GCControllerButtonInputView *)v7 initUI];
    [(GCControllerButtonInputView *)v8 setupActions];
    v8->_innerFrame.origin.CGFloat x = x;
    v8->_innerFrame.origin.CGFloat y = y;
    v8->_innerFrame.size.CGFloat width = width;
    v8->_innerFrame.size.CGFloat height = height;
  }
  return v8;
}

- (GCControllerButtonInputView)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCControllerButtonInputView;
  v6 = -[GCControllerButtonInputView initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 60.0, 60.0);
  v7 = (GCControllerButtonInputView *)v6;
  if (v6)
  {
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = 0;
    *(int64x2_t *)(v6 + 24) = vdupq_n_s64(0x4049000000000000uLL);
    [v6 initUI];
    objc_storeStrong((id *)&v7->_text, a3);
    [(GCControllerButtonInputView *)v7 setText];
    [(GCControllerButtonInputView *)v7 setupActions];
  }

  return v7;
}

- (GCControllerButtonInputView)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GCControllerButtonInputView;
  id v5 = [(GCControllerButtonInputView *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"background"];
    background = v5->_background;
    v5->_background = (UIVisualEffectView *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saturationVibrancyEffectView"];
    saturationVibrancyEffectView = v5->_saturationVibrancyEffectView;
    v5->_saturationVibrancyEffectView = (UIVisualEffectView *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additiveVibrancyEffectView"];
    additiveVibrancyEffectView = v5->_additiveVibrancyEffectView;
    v5->_additiveVibrancyEffectView = (UIVisualEffectView *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"button"];
    button = v5->_button;
    v5->_button = (UIButton *)v12;

    [(GCControllerButtonInputView *)v5 setupActions];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCControllerButtonInputView;
  id v4 = a3;
  [(GCControllerButtonInputView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_background, @"background", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_saturationVibrancyEffectView forKey:@"saturationVibrancyEffectView"];
  [v4 encodeObject:self->_additiveVibrancyEffectView forKey:@"additiveVibrancyEffectView"];
  [v4 encodeObject:self->_button forKey:@"button"];
}

- (void)initUI
{
  v3 = +[UIColor clearColor];
  [(GCControllerButtonInputView *)self setBackgroundColor:v3];

  [(GCControllerButtonInputView *)self frame];
  double v5 = v4 * 0.5;
  [(GCControllerButtonInputView *)self frame];
  double v7 = v6 * 0.5;
  uint64_t v8 = +[UIButton buttonWithType:0];
  button = self->_button;
  self->_button = v8;

  -[UIButton setFrame:](self->_button, "setFrame:", self->_innerFrame.origin.x, self->_innerFrame.origin.y, self->_innerFrame.size.width, self->_innerFrame.size.height);
  -[UIButton setCenter:](self->_button, "setCenter:", v5, v7);
  [(GCControllerButtonInputView *)self addSubview:self->_button];
  GCVirtualControllerBlurEffectView();
  uint64_t v10 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  background = self->_background;
  self->_background = v10;

  [(UIVisualEffectView *)self->_background setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GCControllerButtonInputView *)self frame];
  -[UIVisualEffectView setFrame:](self->_background, "setFrame:");
  [(UIVisualEffectView *)self->_background frame];
  double v13 = v12 * 0.5;
  v14 = [(UIVisualEffectView *)self->_background layer];
  [v14 setCornerRadius:v13];

  objc_super v15 = [(UIVisualEffectView *)self->_background layer];
  [v15 setMasksToBounds:1];

  [(UIVisualEffectView *)self->_background setUserInteractionEnabled:0];
  [(GCControllerButtonInputView *)self addSubview:self->_background];
  GCVirtualControllerSaturationVibrancyEffectView();
  v16 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  saturationVibrancyEffectView = self->_saturationVibrancyEffectView;
  self->_saturationVibrancyEffectView = v16;

  -[UIVisualEffectView setFrame:](self->_saturationVibrancyEffectView, "setFrame:", self->_innerFrame.origin.x, self->_innerFrame.origin.y, self->_innerFrame.size.width, self->_innerFrame.size.height);
  -[UIVisualEffectView setCenter:](self->_saturationVibrancyEffectView, "setCenter:", v5, v7);
  [(UIVisualEffectView *)self->_saturationVibrancyEffectView setUserInteractionEnabled:0];
  v18 = [(UIVisualEffectView *)self->_saturationVibrancyEffectView layer];
  [v18 setMasksToBounds:1];

  [(UIVisualEffectView *)self->_saturationVibrancyEffectView frame];
  double v20 = v19 * 0.5;
  v21 = [(UIVisualEffectView *)self->_saturationVibrancyEffectView contentView];
  v22 = [v21 layer];
  [v22 setCornerRadius:v20];

  LODWORD(v20) = GCVirtualControllerVibrancyOverlayOpacity();
  v23 = [(UIVisualEffectView *)self->_saturationVibrancyEffectView contentView];
  v24 = [v23 layer];
  LODWORD(v25) = LODWORD(v20);
  [v24 setOpacity:v25];

  v26 = [(UIVisualEffectView *)self->_saturationVibrancyEffectView contentView];
  v27 = [v26 layer];
  [v27 setMasksToBounds:1];

  GCVirtualControllerAdditiveVibrancyEffectView();
  v28 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  additiveVibrancyEffectView = self->_additiveVibrancyEffectView;
  self->_additiveVibrancyEffectView = v28;

  -[UIVisualEffectView setFrame:](self->_additiveVibrancyEffectView, "setFrame:", self->_innerFrame.origin.x, self->_innerFrame.origin.y, self->_innerFrame.size.width, self->_innerFrame.size.height);
  -[UIVisualEffectView setCenter:](self->_additiveVibrancyEffectView, "setCenter:", v5, v7);
  [(UIVisualEffectView *)self->_additiveVibrancyEffectView setUserInteractionEnabled:0];
  v30 = [(UIVisualEffectView *)self->_additiveVibrancyEffectView layer];
  [v30 setMasksToBounds:1];

  [(UIVisualEffectView *)self->_additiveVibrancyEffectView setHidden:1];
  [(UIVisualEffectView *)self->_additiveVibrancyEffectView frame];
  double v32 = v31 * 0.5;
  v33 = [(UIVisualEffectView *)self->_additiveVibrancyEffectView contentView];
  v34 = [v33 layer];
  [v34 setCornerRadius:v32];

  LODWORD(v32) = GCVirtualControllerVibrancyOverlayOpacity();
  v35 = [(UIVisualEffectView *)self->_additiveVibrancyEffectView contentView];
  v36 = [v35 layer];
  LODWORD(v37) = LODWORD(v32);
  [v36 setOpacity:v37];

  v38 = [(UIVisualEffectView *)self->_additiveVibrancyEffectView contentView];
  v39 = [v38 layer];
  [v39 setMasksToBounds:1];

  v40 = [(UIVisualEffectView *)self->_background contentView];
  [v40 addSubview:self->_saturationVibrancyEffectView];

  id v41 = [(UIVisualEffectView *)self->_background contentView];
  [v41 addSubview:self->_additiveVibrancyEffectView];
}

- (void)setupActions
{
  button = self->_button;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __43__GCControllerButtonInputView_setupActions__block_invoke;
  v8[3] = &unk_105B8;
  v8[4] = self;
  double v4 = +[UIAction actionWithHandler:v8];
  [(UIButton *)button addAction:v4 forControlEvents:1];

  double v5 = self->_button;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __43__GCControllerButtonInputView_setupActions__block_invoke_2;
  v7[3] = &unk_105B8;
  v7[4] = self;
  double v6 = +[UIAction actionWithHandler:v7];
  [(UIButton *)v5 addAction:v6 forControlEvents:192];
}

id __43__GCControllerButtonInputView_setupActions__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 48) setHidden:1];
  v2 = +[GCControllerViewFeedback sharedInstance];
  [v2 buttonDown];

  v3 = *(void **)(a1 + 32);
  LODWORD(v4) = 1.0;

  return [v3 triggerButtonWithValue:v4];
}

id __43__GCControllerButtonInputView_setupActions__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setHidden:1];
  [*(id *)(*(void *)(a1 + 32) + 48) setHidden:0];
  v2 = +[GCControllerViewFeedback sharedInstance];
  [v2 buttonUp];

  v3 = *(void **)(a1 + 32);

  return [v3 triggerButtonWithValue:0.0];
}

- (void)triggerButtonWithValue:(float)a3
{
  if (self)
  {
    id v4 = self->_valueChangedHandler;
    if (v4)
    {
      id v5 = v4;
      (*((void (**)(float))v4 + 2))(a3);
    }
  }
}

- (uint64_t)valueChangedHandler
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void)setText
{
  v3 = +[UIFont systemFontOfSize:32.0 weight:UIFontWeightMedium];
  id v4 = [v3 fontDescriptor];
  id v5 = [v4 fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded];

  double v6 = +[UIFont fontWithDescriptor:v5 size:32.0];
  NSAttributedStringKey v21 = NSFontAttributeName;
  v22 = v6;
  double v7 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  UIGraphicsBeginImageContextWithOptions(self->_innerFrame.size, 0, 0.0);
  [(NSString *)self->_text sizeWithAttributes:v7];
  v9.f64[1] = v8;
  __asm { FMOV            V1.2D, #0.5 }
  [(NSString *)self->_text drawAtPoint:v7 withAttributes:vaddq_f64((float64x2_t)self->_innerFrame.origin, vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64(vsubq_f64((float64x2_t)self->_innerFrame.size, v9), _Q1))))];
  objc_super v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  AlphaMaskImage = GCVirtualControllerCreateAlphaMaskImage(v15, 1);
  v17 = [(UIVisualEffectView *)self->_saturationVibrancyEffectView contentView];
  v18 = [v17 layer];
  [v18 setContents:AlphaMaskImage];

  double v19 = [(UIVisualEffectView *)self->_additiveVibrancyEffectView contentView];
  double v20 = [v19 layer];
  [v20 setContents:AlphaMaskImage];

  CGImageRelease(AlphaMaskImage);
}

- (void)setCustomImage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v6 = [(GCControllerButtonInputView *)self customImage];
    unsigned __int8 v7 = [v6 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_customImage, a3);
      float64_t v8 = [_GCControllerShapeView alloc];
      [(UIButton *)self->_button frame];
      float64x2_t v9 = -[_GCControllerShapeView initWithFrame:](v8, "initWithFrame:");
      memset(&v57, 0, sizeof(v57));
      double width = self->_innerFrame.size.width;
      [v5 bounds];
      CGFloat v11 = -self->_innerFrame.size.height;
      CGFloat v13 = width / v12;
      [v5 bounds];
      CGAffineTransformMakeScale(&v57, v13, v11 / v14);
      memset(&v56, 0, sizeof(v56));
      CGAffineTransformMakeTranslation(&v56, self->_innerFrame.size.width * 0.5, self->_innerFrame.size.height * 0.5);
      CGAffineTransform t1 = v57;
      memset(&v55, 0, sizeof(v55));
      CGAffineTransform v53 = v56;
      CGAffineTransformConcat(&v55, &t1, &v53);
      CGAffineTransform t1 = v55;
      [v5 applyTransform:&t1];
      id v15 = v5;
      id v16 = [v15 CGPath];
      v17 = [(_GCControllerShapeView *)v9 shapeLayer];
      [v17 setPath:v16];

      unsigned int v18 = [v15 usesEvenOddFillRule];
      double v19 = &kCAFillRuleEvenOdd;
      if (!v18) {
        double v19 = &kCAFillRuleNonZero;
      }
      CAShapeLayerFillRule v20 = *v19;
      NSAttributedStringKey v21 = [(_GCControllerShapeView *)v9 shapeLayer];
      [v21 setFillRule:v20];

      [v15 lineWidth];
      double v23 = v22;
      v24 = [(_GCControllerShapeView *)v9 shapeLayer];
      [v24 setLineWidth:v23];

      if ([v15 lineCapStyle])
      {
        unsigned int v25 = [v15 lineCapStyle];
        v26 = &kCALineCapRound;
        if (v25 != 1) {
          v26 = &kCALineCapSquare;
        }
      }
      else
      {
        v26 = &kCALineCapButt;
      }
      CAShapeLayerLineCap v28 = *v26;
      v29 = [(_GCControllerShapeView *)v9 shapeLayer];
      [v29 setLineCap:v28];

      if ([v15 lineJoinStyle])
      {
        unsigned int v30 = [v15 lineJoinStyle];
        double v31 = &kCALineJoinRound;
        if (v30 != 1) {
          double v31 = &kCALineJoinBevel;
        }
      }
      else
      {
        double v31 = &kCALineJoinMiter;
      }
      CAShapeLayerLineJoin v32 = *v31;
      v33 = [(_GCControllerShapeView *)v9 shapeLayer];
      [v33 setLineJoin:v32];

      [v15 miterLimit];
      double v35 = v34;
      v36 = [(_GCControllerShapeView *)v9 shapeLayer];
      [v36 setMiterLimit:v35];

      t1.double a = 0.0;
      v53.double a = 0.0;
      [v15 getLineDash:0 count:&t1 phase:&v53];
      if (*(void *)&t1.a)
      {
        double v37 = (double *)malloc_type_malloc(8 * *(void *)&t1.a, 0x100004000313F17uLL);
        [v15 getLineDash:v37 count:0 phase:0];
        id v38 = objc_alloc((Class)NSMutableArray);
        id v39 = [v38 initWithCapacity:*(void *)&t1.a];
        if (*(uint64_t *)&t1.a >= 1)
        {
          uint64_t v40 = 0;
          do
          {
            id v41 = +[NSNumber numberWithDouble:v37[v40]];
            [v39 addObject:v41];

            ++v40;
          }
          while (*(uint64_t *)&t1.a > v40);
        }
        free(v37);
        double a = v53.a;
        v43 = [(_GCControllerShapeView *)v9 shapeLayer];
        [v43 setLineDashPhase:a];

        id v44 = [v39 copy];
        v45 = [(_GCControllerShapeView *)v9 shapeLayer];
        [v45 setLineDashPattern:v44];
      }
      UIGraphicsBeginImageContextWithOptions(self->_innerFrame.size, 0, 0.0);
      v46 = [(_GCControllerShapeView *)v9 shapeLayer];
      [v46 renderInContext:UIGraphicsGetCurrentContext()];

      v47 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      AlphaMaskImage = GCVirtualControllerCreateAlphaMaskImage(v47, 0);
      v49 = [(UIVisualEffectView *)self->_saturationVibrancyEffectView contentView];
      v50 = [v49 layer];
      [v50 setContents:AlphaMaskImage];

      v51 = [(UIVisualEffectView *)self->_additiveVibrancyEffectView contentView];
      v52 = [v51 layer];
      [v52 setContents:AlphaMaskImage];

      CGImageRelease(AlphaMaskImage);
    }
  }
  else
  {
    customImage = self->_customImage;
    if (customImage)
    {
      self->_customImage = 0;

      [(GCControllerButtonInputView *)self setText];
    }
  }
}

- (UIBezierPath)customImage
{
  return self->_customImage;
}

- (void)setValueChangedHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 88);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueChangedHandler, 0);
  objc_storeStrong((id *)&self->_customImage, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_additiveVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_saturationVibrancyEffectView, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

@end