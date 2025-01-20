@interface NTKMargaritaBackgroundView
+ (id)rotationSwatchImageForDevice:(id)a3 withColors:(id)a4 rotation:(int64_t)a5;
+ (id)stripeCountSwatchImageForDevice:(id)a3 withColors:(id)a4;
- (BOOL)compactCircular;
- (CGSize)_stripeContainerSizeForStyle:(unint64_t)a3 rotation:(double)a4;
- (CGSize)_stripeSizeForStripeCount:(unint64_t)a3;
- (CGVector)_stripeOriginOffsetForStripeCount:(unint64_t)a3;
- (NTKMargaritaBackgroundView)initWithDevice:(id)a3;
- (double)_stripeContainerCornerRadiusForStyle:(unint64_t)a3;
- (id)_maskLayerWithFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (id)_maskLayerWithStyle:(unint64_t)a3;
- (id)_stripeContainerCornerCurveForStyle:(unint64_t)a3;
- (int64_t)rotation;
- (unint64_t)stripeCount;
- (unint64_t)style;
- (void)_applyColors:(id)a3;
- (void)_applyStripeSize:(CGSize)a3 originOffset:(CGVector)a4;
- (void)_layoutStripes;
- (void)_layoutStripesForStripeCount:(unint64_t)a3;
- (void)_recreateStripeLayers;
- (void)applyTransitionFraction:(double)a3 fromRotation:(int64_t)a4 toRotation:(int64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromStripeCount:(unint64_t)a4 toStripeCount:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)applyTransitionFractionToCompactCircular:(double)a3;
- (void)layoutSubviews;
- (void)setCompactCircular:(BOOL)a3;
- (void)setRotation:(int64_t)a3;
- (void)setStripeColor:(id)a3 atIndex:(int64_t)a4;
- (void)setStripeCount:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKMargaritaBackgroundView

- (NTKMargaritaBackgroundView)initWithDevice:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NTKMargaritaBackgroundView;
  v6 = [(NTKMargaritaBackgroundView *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = +[NTKMargaritaFace totalStripeCount];
    uint64_t v9 = +[NSMutableArray arrayWithCapacity:v8];
    stripeColors = v7->_stripeColors;
    v7->_stripeColors = (NSMutableArray *)v9;

    if (v8 >= 1)
    {
      do
      {
        v11 = v7->_stripeColors;
        v12 = +[UIColor whiteColor];
        [(NSMutableArray *)v11 addObject:v12];

        --v8;
      }
      while (v8);
    }
    uint64_t v13 = +[CALayer layer];
    stripeContainerLayer = v7->_stripeContainerLayer;
    v7->_stripeContainerLayer = (CALayer *)v13;

    [(CALayer *)v7->_stripeContainerLayer setMasksToBounds:1];
    v15 = v7->_stripeContainerLayer;
    v16 = sub_6E24();
    [(CALayer *)v15 setActions:v16];

    v17 = [(NTKMargaritaBackgroundView *)v7 layer];
    [v17 addSublayer:v7->_stripeContainerLayer];

    v18 = [(NTKMargaritaBackgroundView *)v7 layer];
    [v18 setCornerCurve:kCACornerCurveContinuous];

    v19 = [(NTKMargaritaBackgroundView *)v7 layer];
    [v5 screenCornerRadius];
    objc_msgSend(v19, "setCornerRadius:");

    v20 = [(NTKMargaritaBackgroundView *)v7 layer];
    [v20 setMasksToBounds:1];

    v21 = [(NTKMargaritaBackgroundView *)v7 layer];
    v22 = sub_6E24();
    [v21 setActions:v22];

    [(NTKMargaritaBackgroundView *)v7 _recreateStripeLayers];
    v23 = v7;
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMargaritaBackgroundView;
  [(NTKMargaritaBackgroundView *)&v3 layoutSubviews];
  [(NTKMargaritaBackgroundView *)self bounds];
  CLKRectGetCenter();
  -[CALayer setPosition:](self->_stripeContainerLayer, "setPosition:");
}

+ (id)stripeCountSwatchImageForDevice:(id)a3 withColors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[NTKMargaritaBackgroundView alloc] initWithDevice:v6];
  [(NTKMargaritaBackgroundView *)v7 _applyColors:v5];

  [(NTKMargaritaBackgroundView *)v7 setStyle:0];
  [v6 screenBounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[NTKMargaritaBackgroundView setFrame:](v7, "setFrame:", v9, v11, v13, v15);
  id v16 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:", v9, v11, v13, v15);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_703C;
  v20[3] = &unk_105A8;
  v21 = v7;
  v17 = v7;
  v18 = [v16 imageWithActions:v20];

  return v18;
}

+ (id)rotationSwatchImageForDevice:(id)a3 withColors:(id)a4 rotation:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [[NTKMargaritaBackgroundView alloc] initWithDevice:v8];

  double v10 = v9->_stripeContainerLayer;
  +[NTKEditOption sizeForSwatchStyle:0];
  double v12 = v11;
  double v14 = v13;
  [(CALayer *)v10 setCornerRadius:0.0];
  -[CALayer setFrame:](v10, "setFrame:", 0.0, 0.0, v12, v14);
  CGAffineTransformMakeRotation(&v22, (double)a5 * 3.14159265 / 180.0);
  [(CALayer *)v10 setAffineTransform:&v22];
  [(NTKMargaritaBackgroundView *)v9 _applyColors:v7];

  double v15 = +[CALayer layer];
  [v15 setMasksToBounds:1];
  [v15 setCornerRadius:v12 * 0.5];
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v12, v14);
  [v15 addSublayer:v10];
  id v16 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:", 0.0, 0.0, v12, v14);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_72C4;
  v20[3] = &unk_105A8;
  id v21 = v15;
  id v17 = v15;
  v18 = [v16 imageWithActions:v20];

  return v18;
}

- (void)_applyColors:(id)a3
{
  id v7 = a3;
  v4 = (char *)[v7 count];
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      id v6 = [v7 objectAtIndexedSubscript:i];
      [(NTKMargaritaBackgroundView *)self setStripeColor:v6 atIndex:i];
    }
  }
  [(NTKMargaritaBackgroundView *)self setStripeCount:v4];
}

- (void)_recreateStripeLayers
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v3 = [(CALayer *)self->_stripeContainerLayer sublayers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v8) removeFromSuperlayer];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  stripeLayers = self->_stripeLayers;
  self->_stripeLayers = 0;

  double v10 = +[NSMutableArray array];
  stripeColors = self->_stripeColors;
  double v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_7564;
  v18 = &unk_106A0;
  v19 = self;
  double v12 = v10;
  v20 = v12;
  [(NSMutableArray *)stripeColors enumerateObjectsUsingBlock:&v15];
  double v13 = self->_stripeLayers;
  self->_stripeLayers = v12;
  double v14 = v12;

  [(NTKMargaritaBackgroundView *)self _layoutStripes];
}

- (void)_layoutStripes
{
  if (self->_stripeCount) {
    [(NTKMargaritaBackgroundView *)self _layoutStripesForStripeCount:"_layoutStripesForStripeCount:"];
  }
}

- (void)_layoutStripesForStripeCount:(unint64_t)a3
{
  -[NTKMargaritaBackgroundView _stripeSizeForStripeCount:](self, "_stripeSizeForStripeCount:");
  double v6 = v5;
  double v8 = v7;
  [(NTKMargaritaBackgroundView *)self _stripeOriginOffsetForStripeCount:a3];

  -[NTKMargaritaBackgroundView _applyStripeSize:originOffset:](self, "_applyStripeSize:originOffset:", v6, v8, v9, v10);
}

- (void)_applyStripeSize:(CGSize)a3 originOffset:(CGVector)a4
{
  stripeLayers = self->_stripeLayers;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7730;
  v5[3] = &unk_106C0;
  CGVector v6 = a4;
  CGSize v7 = a3;
  [(NSArray *)stripeLayers enumerateObjectsUsingBlock:v5];
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[NTKMargaritaBackgroundView _stripeContainerSizeForStyle:rotation:](self, "_stripeContainerSizeForStyle:rotation:", self->_displayRotation);
  -[CALayer setBounds:](self->_stripeContainerLayer, "setBounds:", 0.0, 0.0, v5, v6);
  [(NTKMargaritaBackgroundView *)self _layoutStripes];
  id v8 = [(NTKMargaritaBackgroundView *)self _maskLayerWithStyle:a3];
  CGSize v7 = [(NTKMargaritaBackgroundView *)self layer];
  [v7 setMask:v8];
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  -[NTKMargaritaBackgroundView _stripeContainerSizeForStyle:rotation:](self, "_stripeContainerSizeForStyle:rotation:", self->_displayRotation);
  [(NTKMargaritaBackgroundView *)self _stripeContainerSizeForStyle:a5 rotation:self->_displayRotation];
  CLKInterpolateBetweenSizes();
  -[CALayer setBounds:](self->_stripeContainerLayer, "setBounds:", 0.0, 0.0, v9, v10);
  [(CALayer *)self->_stripeContainerLayer setNeedsDisplay];
  [(NTKMargaritaBackgroundView *)self _layoutStripes];
  id v12 = [(NTKMargaritaBackgroundView *)self _maskLayerWithFraction:a4 fromStyle:a5 toStyle:a3];
  double v11 = [(NTKMargaritaBackgroundView *)self layer];
  [v11 setMask:v12];
}

- (id)_maskLayerWithStyle:(unint64_t)a3
{
  return [(NTKMargaritaBackgroundView *)self _maskLayerWithFraction:a3 fromStyle:a3 toStyle:1.0];
}

- (id)_maskLayerWithFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  [(CLKDevice *)self->_device screenBounds];
  [(NTKMargaritaBackgroundView *)self _stripeContainerSizeForStyle:2 rotation:0.0];
  CLKInterpolateBetweenRects();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[NTKMargaritaBackgroundView _stripeContainerCornerRadiusForStyle:](self, "_stripeContainerCornerRadiusForStyle:", a4, *(void *)&a3);
  [(NTKMargaritaBackgroundView *)self _stripeContainerCornerRadiusForStyle:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v18 = v17;
  v19 = +[CAShapeLayer layer];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v18);
  id v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPath:", objc_msgSend(v20, "CGPath"));

  return v19;
}

- (void)setRotation:(int64_t)a3
{
  self->_rotation = a3;
  double v4 = (double)a3;
  self->_displayRotation = (double)a3;
  stripeContainerLayer = self->_stripeContainerLayer;
  CGAffineTransformMakeRotation(&v8, (double)a3 * 3.14159265 / 180.0);
  [(CALayer *)stripeContainerLayer setAffineTransform:&v8];
  [(NTKMargaritaBackgroundView *)self _stripeContainerSizeForStyle:self->_style rotation:v4];
  -[CALayer setBounds:](self->_stripeContainerLayer, "setBounds:", 0.0, 0.0, v6, v7);
  [(NTKMargaritaBackgroundView *)self _layoutStripes];
}

- (void)applyTransitionFraction:(double)a3 fromRotation:(int64_t)a4 toRotation:(int64_t)a5
{
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  self->_displayRotation = v6;
  stripeContainerLayer = self->_stripeContainerLayer;
  CGAffineTransformMakeRotation(&v11, v6 * 3.14159265 / 180.0);
  [(CALayer *)stripeContainerLayer setAffineTransform:&v11];
  [(NTKMargaritaBackgroundView *)self _stripeContainerSizeForStyle:self->_style rotation:v7];
  -[CALayer setBounds:](self->_stripeContainerLayer, "setBounds:", 0.0, 0.0, v9, v10);
  [(NTKMargaritaBackgroundView *)self _layoutStripes];
}

- (void)setStripeCount:(unint64_t)a3
{
  self->_stripeCount = a3;
  [(NTKMargaritaBackgroundView *)self _recreateStripeLayers];
}

- (void)applyTransitionFraction:(double)a3 fromStripeCount:(unint64_t)a4 toStripeCount:(unint64_t)a5
{
  -[NTKMargaritaBackgroundView _stripeSizeForStripeCount:](self, "_stripeSizeForStripeCount:");
  [(NTKMargaritaBackgroundView *)self _stripeSizeForStripeCount:a5];
  CLKInterpolateBetweenSizes();
  double v9 = v8;
  double v11 = v10;
  [(NTKMargaritaBackgroundView *)self _stripeOriginOffsetForStripeCount:a4];
  [(NTKMargaritaBackgroundView *)self _stripeOriginOffsetForStripeCount:a5];
  CLKInterpolateBetweenVectors();

  -[NTKMargaritaBackgroundView _applyStripeSize:originOffset:](self, "_applyStripeSize:originOffset:", v9, v11, v12, v13);
}

- (void)setStripeColor:(id)a3 atIndex:(int64_t)a4
{
  id v7 = a3;
  -[NSMutableArray setObject:atIndexedSubscript:](self->_stripeColors, "setObject:atIndexedSubscript:");
  if ([(NSArray *)self->_stripeLayers count] > a4)
  {
    double v6 = [(NSArray *)self->_stripeLayers objectAtIndexedSubscript:a4];
    objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));
  }
}

- (void)setCompactCircular:(BOOL)a3
{
  self->_compactCircular = a3;
  if (self->_style >= 2)
  {
    -[NTKMargaritaBackgroundView _stripeContainerSizeForStyle:rotation:](self, "_stripeContainerSizeForStyle:rotation:", self->_displayRotation);
    -[CALayer setBounds:](self->_stripeContainerLayer, "setBounds:", 0.0, 0.0, v4, v5);
    [(NTKMargaritaBackgroundView *)self _layoutStripes];
  }
}

- (void)applyTransitionFractionToCompactCircular:(double)a3
{
  if (self->_style >= 2)
  {
    sub_7F34(self->_device);
    sub_7F34(self->_device);
    CLKInterpolateBetweenFloatsClipped();
    double v5 = v4;
    -[CALayer setBounds:](self->_stripeContainerLayer, "setBounds:", 0.0, 0.0, v5, v5);
    [(CALayer *)self->_stripeContainerLayer setCornerRadius:v5 * 0.5];
    [(NTKMargaritaBackgroundView *)self _layoutStripes];
  }
}

- (CGSize)_stripeSizeForStripeCount:(unint64_t)a3
{
  [(CALayer *)self->_stripeContainerLayer bounds];
  double v5 = v4;
  double v7 = v6 / (double)a3;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGVector)_stripeOriginOffsetForStripeCount:(unint64_t)a3
{
  [(CALayer *)self->_stripeContainerLayer bounds];
  double v5 = v4 / (double)a3;
  double v6 = 0.0;
  result.dy = v5;
  result.dx = v6;
  return result;
}

- (CGSize)_stripeContainerSizeForStyle:(unint64_t)a3 rotation:(double)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL compactCircular = self->_compactCircular;
    double v6 = sub_7F34(self->_device);
    if (compactCircular) {
      double v8 = v6;
    }
    else {
      double v8 = v7;
    }
    if (compactCircular) {
      double height = v6;
    }
    else {
      double height = v7;
    }
  }
  else
  {
    CGFloat v10 = a4 * 3.14159265 / 180.0;
    [(CLKDevice *)self->_device screenBounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [(CLKDevice *)self->_device screenCornerRadius];
    id v20 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v12, v14, v16, v18, v19);
    CGAffineTransformMakeRotation(&v24, v10);
    [v20 applyTransform:&v24];
    id v21 = v20;
    CGRect PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)[v21 CGPath]);
    double height = PathBoundingBox.size.height;
    double v8 = PathBoundingBox.size.height * (PathBoundingBox.size.width / PathBoundingBox.size.height);
  }
  double v22 = v8;
  double v23 = height;
  result.double height = v23;
  result.width = v22;
  return result;
}

- (double)_stripeContainerCornerRadiusForStyle:(unint64_t)a3
{
  if (a3 > 1)
  {
    BOOL compactCircular = self->_compactCircular;
    double v6 = sub_7F34(self->_device);
    if (!compactCircular) {
      double v6 = v7;
    }
    return v6 * 0.5;
  }
  else
  {
    device = self->_device;
    [(CLKDevice *)device screenCornerRadius];
  }
  return result;
}

- (id)_stripeContainerCornerCurveForStyle:(unint64_t)a3
{
  objc_super v3 = (id *)&kCACornerCurveContinuous;
  if (a3 >= 2) {
    objc_super v3 = (id *)&kCACornerCurveCircular;
  }
  return *v3;
}

- (unint64_t)style
{
  return self->_style;
}

- (int64_t)rotation
{
  return self->_rotation;
}

- (unint64_t)stripeCount
{
  return self->_stripeCount;
}

- (BOOL)compactCircular
{
  return self->_compactCircular;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stripeLayers, 0);
  objc_storeStrong((id *)&self->_stripeContainerLayer, 0);
  objc_storeStrong((id *)&self->_stripeColors, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end