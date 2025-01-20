@interface NTKSquallBezelView
- (BOOL)animating;
- (BOOL)blurred;
- (CGRect)_insetBounds;
- (CLKDevice)device;
- (NSString)dimmedColorKey;
- (NSString)highlightedColorKey;
- (NTKSquallBezelView)initWithDevice:(id)a3 progressProvider:(id)a4;
- (NTKSquallColorPalette)colorPalette;
- (double)_reducedCornerRadius;
- (double)progress;
- (double)tritiumFraction;
- (id)_compositeBezelImagesA:(id)a3 andB:(id)a4 dialFraction:(double)a5;
- (id)_dimmedColor;
- (id)_highlightColor;
- (id)_renderBezelTemplateForSize:(CGSize)a3 highlighted:(BOOL)a4 tritium:(BOOL)a5;
- (id)_tritiumDimmedColor;
- (id)_tritiumHighlightColor;
- (int64_t)updateFrequency;
- (unint64_t)_calculateCrossingStrokeForDialFraction:(double)a3 bezelBounds:(CGRect)a4 screenSize:(CGSize)a5 cornerRadius:(double)a6 length:(double)a7 point1:(CGPoint *)a8 point2:(CGPoint *)a9 auxPoint:(CGPoint *)a10;
- (void)_compositeBezelImageA:(id)a3 clippingPath:(id)a4 context:(CGContext *)a5;
- (void)_compositeBezelImageB:(id)a3 clippingPath:(id)a4 context:(CGContext *)a5;
- (void)_compositeBezelImagesA:(id)a3 andB:(id)a4 clippingPath:(id)a5 context:(CGContext *)a6;
- (void)_refreshTemplateImages;
- (void)_renderBezelTemplateForSize:(CGSize)a3 highlighted:(BOOL)a4 tritium:(BOOL)a5 rendererContext:(id)a6;
- (void)_startBezelTimer;
- (void)_stopBezelTimer;
- (void)_updateImage;
- (void)applyColorPalette:(id)a3;
- (void)bezelProgressUpdated;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setBlurred:(BOOL)a3;
- (void)setColorKeysDimmed:(id)a3 highlighted:(id)a4;
- (void)setColorPalette:(id)a3;
- (void)setDimmedColorKey:(id)a3;
- (void)setHighlightedColorKey:(id)a3;
- (void)setProgress:(double)a3;
- (void)setTritiumFraction:(double)a3;
- (void)setUpdateFrequency:(int64_t)a3;
@end

@implementation NTKSquallBezelView

- (NTKSquallBezelView)initWithDevice:(id)a3 progressProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKSquallBezelView;
  v9 = [(NTKSquallBezelView *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_provider, a4);
    v10->_dimmedColorKey = (NSString *)@"bezelDimmed";
    v10->_highlightedColorKey = (NSString *)@"bezelHighlighted";
    id v11 = objc_alloc((Class)UIImageView);
    [(NTKSquallBezelView *)v10 bounds];
    v12 = (UIImageView *)objc_msgSend(v11, "initWithFrame:");
    bezelImageView = v10->_bezelImageView;
    v10->_bezelImageView = v12;

    id v14 = objc_alloc((Class)UIImageView);
    [(NTKSquallBezelView *)v10 bounds];
    v15 = (UIImageView *)objc_msgSend(v14, "initWithFrame:");
    tritiumImageView = v10->_tritiumImageView;
    v10->_tritiumImageView = v15;

    v10->_updateFrequency = 3;
    v17 = (CLKUIBezierPathStepperProvider *)objc_alloc_init((Class)CLKUIBezierPathStepperProvider);
    pathStepper = v10->_pathStepper;
    v10->_pathStepper = v17;

    [(NTKSquallBezelView *)v10 addSubview:v10->_bezelImageView];
    [(NTKSquallBezelView *)v10 addSubview:v10->_tritiumImageView];
    [(UIImageView *)v10->_tritiumImageView setAlpha:0.0];
  }

  return v10;
}

- (void)layoutSubviews
{
  double v3 = sub_4B74(self->_device);
  double v5 = v4;
  [(NTKSquallBezelView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = v3 + v5 * 0.5;
  [(CLKDevice *)self->_device screenCornerRadius];
  self->_reducedCornerRadius = v15 - v14;
  self->_insetBounds.origin.x = v14 + v7;
  self->_insetBounds.origin.y = v14 + v9;
  self->_insetBounds.size.width = v11 + v14 * -2.0;
  self->_insetBounds.size.height = v13 + v14 * -2.0;
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  v16 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  bezelPath = self->_bezelPath;
  self->_bezelPath = v16;

  [(CLKUIBezierPathStepperProvider *)self->_pathStepper setPath:self->_bezelPath];
  [(NTKSquallBezelView *)self bounds];
  -[UIImageView setFrame:](self->_bezelImageView, "setFrame:");
  [(NTKSquallBezelView *)self bounds];
  -[UIImageView setFrame:](self->_tritiumImageView, "setFrame:");

  [(NTKSquallBezelView *)self _refreshTemplateImages];
}

- (CGRect)_insetBounds
{
  double x = self->_insetBounds.origin.x;
  double y = self->_insetBounds.origin.y;
  double width = self->_insetBounds.size.width;
  double height = self->_insetBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_reducedCornerRadius
{
  return self->_reducedCornerRadius;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3)
    {
      [(NTKSquallBezelView *)self _startBezelTimer];
      self->_blurred = 0;
      id v4 = [(UIImageView *)self->_bezelImageView layer];
      [v4 setFilters:0];
    }
    else
    {
      [(NTKSquallBezelView *)self _stopBezelTimer];
    }
  }
}

- (void)setBlurred:(BOOL)a3
{
  BOOL v3 = a3;
  if ((!self->_animating || !a3) && self->_blurred != a3)
  {
    self->_blurred = a3;
    id v4 = [(UIImageView *)self->_bezelImageView layer];
    id v7 = v4;
    if (v3)
    {
      double v5 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
      [v5 setName:@"gaussianBlurSquallBezel"];
      [v5 setValue:&off_C960 forKey:@"inputRadius"];
      double v8 = v5;
      double v6 = +[NSArray arrayWithObjects:&v8 count:1];
      [v7 setFilters:v6];
    }
    else
    {
      [v4 setFilters:0];
    }
  }
}

- (BOOL)blurred
{
  return self->_blurred;
}

- (void)_startBezelTimer
{
  if (!self->_bezelTimerToken)
  {
    objc_initWeak(&location, self);
    BOOL v3 = +[CLKClockTimer sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_4FE0;
    v6[3] = &unk_C3F0;
    objc_copyWeak(&v7, &location);
    id v4 = [v3 startUpdatesWithUpdateFrequency:3 withHandler:v6 identificationLog:&stru_C490];
    bezelTimerToken = self->_bezelTimerToken;
    self->_bezelTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_stopBezelTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_bezelTimerToken)
  {
    BOOL v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_bezelTimerToken];

    bezelTimerToken = self->_bezelTimerToken;
    self->_bezelTimerToken = 0;
  }
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    [(NTKSquallBezelView *)self _updateImage];
  }
}

- (void)bezelProgressUpdated
{
  [(NTKSquallProgressProviding *)self->_provider bezelProgress];

  -[NTKSquallBezelView setProgress:](self, "setProgress:");
}

- (void)_refreshTemplateImages
{
  dimmedImage = self->_dimmedImage;
  self->_dimmedImage = 0;

  highlightedImage = self->_highlightedImage;
  self->_highlightedImage = 0;

  tritiumImage = self->_tritiumImage;
  self->_tritiumImage = 0;

  [(NTKSquallBezelView *)self _updateImage];
}

- (void)_updateImage
{
  [(NTKSquallBezelView *)self bounds];
  double v5 = v3;
  double v6 = v4;
  if (!self->_dimmedImage)
  {
    -[NTKSquallBezelView _renderBezelTemplateForSize:highlighted:tritium:](self, "_renderBezelTemplateForSize:highlighted:tritium:", 0, 0, v3, v4);
    id v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    dimmedImage = self->_dimmedImage;
    self->_dimmedImage = v7;
  }
  if (!self->_highlightedImage)
  {
    -[NTKSquallBezelView _renderBezelTemplateForSize:highlighted:tritium:](self, "_renderBezelTemplateForSize:highlighted:tritium:", 1, 0, v5, v6);
    double v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    highlightedImage = self->_highlightedImage;
    self->_highlightedImage = v9;
  }
  if (!self->_tritiumImage)
  {
    -[NTKSquallBezelView _renderBezelTemplateForSize:highlighted:tritium:](self, "_renderBezelTemplateForSize:highlighted:tritium:", 0, 1, v5, v6);
    double v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    tritiumImage = self->_tritiumImage;
    self->_tritiumImage = v11;
  }
  double v13 = [(NTKSquallBezelView *)self _compositeBezelImagesA:self->_dimmedImage andB:self->_highlightedImage dialFraction:self->_progress];
  [(UIImageView *)self->_bezelImageView setImage:v13];

  double v14 = self->_tritiumImage;
  tritiumImageView = self->_tritiumImageView;

  [(UIImageView *)tritiumImageView setImage:v14];
}

- (NSString)dimmedColorKey
{
  return self->_dimmedColorKey;
}

- (NSString)highlightedColorKey
{
  return self->_highlightedColorKey;
}

- (void)setDimmedColorKey:(id)a3
{
  if ((NTKEqualStrings() & 1) == 0)
  {
    self->_dimmedColorKedouble y = (NSString *)a3;
    [(NTKSquallBezelView *)self _refreshTemplateImages];
  }
}

- (void)setHighlightedColorKey:(id)a3
{
  if ((NTKEqualStrings() & 1) == 0)
  {
    self->_highlightedColorKedouble y = (NSString *)a3;
    [(NTKSquallBezelView *)self _refreshTemplateImages];
  }
}

- (void)setColorKeysDimmed:(id)a3 highlighted:(id)a4
{
  id v7 = (NSString *)a3;
  double v6 = (NSString *)a4;
  if (!NTKEqualStrings() || (NTKEqualStrings() & 1) == 0)
  {
    self->_dimmedColorKedouble y = v7;
    self->_highlightedColorKedouble y = v6;
    [(NTKSquallBezelView *)self _refreshTemplateImages];
  }
}

- (id)_highlightColor
{
  if (self->_colorPalette) {
    [(NTKSquallColorPalette *)self->_colorPalette valueForKey:self->_highlightedColorKey];
  }
  else {
  v2 = +[UIColor systemOrangeColor];
  }

  return v2;
}

- (id)_dimmedColor
{
  if (self->_colorPalette) {
    [(NTKSquallColorPalette *)self->_colorPalette valueForKey:self->_dimmedColorKey];
  }
  else {
  v2 = +[UIColor systemBlueColor];
  }

  return v2;
}

- (id)_tritiumHighlightColor
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = self->_colorPalette;
    double v4 = [(NTKSquallColorPalette *)v3 tritiumPalette];
    double v5 = [v4 valueForKey:self->_highlightedColorKey];
  }
  else
  {
    double v5 = +[UIColor systemOrangeColor];
  }

  return v5;
}

- (id)_tritiumDimmedColor
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = self->_colorPalette;
    double v4 = [(NTKSquallColorPalette *)v3 tritiumPalette];
    double v5 = [v4 valueForKey:self->_dimmedColorKey];
  }
  else
  {
    double v5 = +[UIColor systemOrangeColor];
  }

  return v5;
}

- (void)applyColorPalette:(id)a3
{
  self->_colorPalette = (NTKSquallColorPalette *)a3;
  [(NTKSquallBezelView *)self _refreshTemplateImages];
}

- (double)tritiumFraction
{
  return self->_tritiumFraction;
}

- (void)setTritiumFraction:(double)a3
{
  if (self->_tritiumFraction != a3)
  {
    self->_tritiumFraction = a3;
    [(UIImageView *)self->_tritiumImageView setAlpha:a3];
    bezelImageView = self->_bezelImageView;
    [(UIImageView *)bezelImageView setAlpha:1.0 - a3];
  }
}

- (id)_renderBezelTemplateForSize:(CGSize)a3 highlighted:(BOOL)a4 tritium:(BOOL)a5
{
  double height = a3.height;
  double width = a3.width;
  double v10 = +[UIGraphicsImageRendererFormat preferredFormat];
  [v10 setOpaque:0];
  id v11 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v10, width, height);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_58A0;
  v14[3] = &unk_C4B8;
  v14[4] = self;
  *(double *)&v14[5] = width;
  *(double *)&v14[6] = height;
  BOOL v15 = a4;
  BOOL v16 = a5;
  double v12 = [v11 imageWithActions:v14];

  return v12;
}

- (void)_renderBezelTemplateForSize:(CGSize)a3 highlighted:(BOOL)a4 tritium:(BOOL)a5 rendererContext:(id)a6
{
  BOOL v6 = a5;
  double height = a3.height;
  double width = a3.width;
  id v11 = (CGContext *)[a6 CGContext];
  sub_4B74(self->_device);
  double v13 = v12;
  CGContextSetBlendMode(v11, kCGBlendModeNormal);
  if (v6)
  {
    if (a4) {
      [(NTKSquallBezelView *)self _tritiumHighlightColor];
    }
    else {
      [(NTKSquallBezelView *)self _tritiumDimmedColor];
    }
  }
  else if (a4)
  {
    [(NTKSquallBezelView *)self _highlightColor];
  }
  else
  {
    [(NTKSquallBezelView *)self _dimmedColor];
  uint64_t v14 = };
  BOOL v15 = (void *)v14;
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.double width = width;
  v20.size.double height = height;
  CGContextClearRect(v11, v20);
  BOOL v16 = +[CAShapeLayer layer];
  objc_msgSend(v16, "setPath:", -[UIBezierPath CGPath](self->_bezelPath, "CGPath"));
  [v16 setFillRule:kCAFillRuleEvenOdd];
  [v16 setLineWidth:v13];
  id v18 = v15;
  objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v18, "CGColor"));
  id v17 = +[UIColor clearColor];
  objc_msgSend(v16, "setFillColor:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(v16, "setBounds:", 0.0, 0.0, width, height);
  [v16 renderInContext:v11];
}

- (id)_compositeBezelImagesA:(id)a3 andB:(id)a4 dialFraction:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = sub_4B74(self->_device);
  double v12 = v11;
  [(CLKDevice *)self->_device screenBounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(NTKSquallBezelView *)self _adjustDialFraction:a5];
  double v22 = v21;
  if (a5 >= 1.0)
  {
    v23 = 0;
    goto LABEL_12;
  }
  v23 = +[UIBezierPath bezierPath];
  double v42 = 0.0;
  double v43 = 0.0;
  v41[0] = 0.0;
  v41[1] = 0.0;
  double v39 = 0.0;
  double v40 = 0.0;
  objc_msgSend(v23, "moveToPoint:", v18 * 0.5, v12 + 5.0);
  double v24 = 0.0;
  objc_msgSend(v23, "addLineToPoint:", v18 * 0.5, 0.0);
  unint64_t v25 = -[NTKSquallBezelView _calculateCrossingStrokeForDialFraction:bezelBounds:screenSize:cornerRadius:length:point1:point2:auxPoint:](self, "_calculateCrossingStrokeForDialFraction:bezelBounds:screenSize:cornerRadius:length:point1:point2:auxPoint:", &v42, v41, &v39, v22, self->_insetBounds.origin.x, self->_insetBounds.origin.y, self->_insetBounds.size.width, self->_insetBounds.size.height, v18, v20, self->_reducedCornerRadius, v12 + 10.0);
  switch(v25)
  {
    case 3uLL:
      objc_msgSend(v23, "addLineToPoint:", v18, 0.0);
      objc_msgSend(v23, "addLineToPoint:", v18, v20);
LABEL_9:
      double v26 = v20;
      goto LABEL_10;
    case 2uLL:
      objc_msgSend(v23, "addLineToPoint:", v18, 0.0);
      double v24 = v18;
      goto LABEL_9;
    case 1uLL:
      double v26 = 0.0;
      double v24 = v18;
LABEL_10:
      objc_msgSend(v23, "addLineToPoint:", v24, v26);
      break;
  }
  _addToPath(v23, v14, v16, v18, v20, v39, v40, v42, v43, v41[0]);
  [v23 closePath];
LABEL_12:
  [v8 size];
  id v29 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v27, v28);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_5E44;
  v35[3] = &unk_C4E0;
  v35[4] = self;
  id v36 = v8;
  id v37 = v9;
  id v38 = v23;
  id v30 = v23;
  id v31 = v9;
  id v32 = v8;
  v33 = [v29 imageWithActions:v35];

  return v33;
}

- (void)_compositeBezelImagesA:(id)a3 andB:(id)a4 clippingPath:(id)a5 context:(CGContext *)a6
{
  id v10 = a5;
  id v11 = a4;
  [(NTKSquallBezelView *)self _compositeBezelImageA:a3 clippingPath:v10 context:a6];
  [(NTKSquallBezelView *)self _compositeBezelImageB:v11 clippingPath:v10 context:a6];
}

- (void)_compositeBezelImageA:(id)a3 clippingPath:(id)a4 context:(CGContext *)a5
{
  id v6 = a3;
  [v6 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGContextSetBlendMode(a5, kCGBlendModeNormal);
  CGContextSaveGState(a5);
  v13.b = 0.0;
  v13.c = 0.0;
  v13.a = 1.0;
  *(_OWORD *)&v13.d = xmmword_9770;
  v13.tdouble y = v10;
  CGContextConcatCTM(a5, &v13);
  id v11 = v6;
  double v12 = (CGImage *)[v11 CGImage];

  v14.origin.double x = 0.0;
  v14.origin.double y = 0.0;
  v14.size.double width = v8;
  v14.size.double height = v10;
  CGContextDrawImage(a5, v14, v12);
  CGContextRestoreGState(a5);
}

- (void)_compositeBezelImageB:(id)a3 clippingPath:(id)a4 context:(CGContext *)a5
{
  id v8 = a4;
  id v9 = a3;
  [v9 size];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGContextBeginPath(a5);
  id v14 = v8;
  double v15 = (const CGPath *)[v14 CGPath];

  CGContextAddPath(a5, v15);
  CGContextClosePath(a5);
  CGContextClip(a5);
  CGContextSetAlpha(a5, 1.0 - self->_tritiumFraction);
  CGContextSaveGState(a5);
  v18.b = 0.0;
  v18.c = 0.0;
  v18.a = 1.0;
  *(_OWORD *)&v18.d = xmmword_9770;
  v18.tdouble y = v13;
  CGContextConcatCTM(a5, &v18);
  id v16 = v9;
  double v17 = (CGImage *)[v16 CGImage];

  v19.origin.double x = 0.0;
  v19.origin.double y = 0.0;
  v19.size.double width = v11;
  v19.size.double height = v13;
  CGContextDrawImage(a5, v19, v17);
  CGContextRestoreGState(a5);
  CGContextSetAlpha(a5, 1.0);
}

- (unint64_t)_calculateCrossingStrokeForDialFraction:(double)a3 bezelBounds:(CGRect)a4 screenSize:(CGSize)a5 cornerRadius:(double)a6 length:(double)a7 point1:(CGPoint *)a8 point2:(CGPoint *)a9 auxPoint:(CGPoint *)a10
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v38 = a5.width;
  uint64_t v20 = 0;
  if (a3 >= 0.25)
  {
    double v21 = a3;
    do
    {
      uint64_t v20 = ((int)v20 + 1) & 3;
      double v21 = v21 + -0.25;
    }
    while (v21 >= 0.25);
  }
  else
  {
    double v21 = a3;
  }
  double MidX = CGRectGetMidX(a4);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  CGFloat MinY = CGRectGetMinY(v43);
  if (v20) {
    double v22 = height * 0.5 - a6;
  }
  else {
    double v22 = width * 0.5 - a6;
  }
  if (v20) {
    double v23 = width * 0.5 - a6;
  }
  else {
    double v23 = height * 0.5 - a6;
  }
  double v41 = 0.0;
  double v42 = 0.0;
  double v39 = 0.0;
  double v40 = 0.0;
  -[CLKUIBezierPathStepperProvider pointAtOffset:outPoint:outTangent:](self->_pathStepper, "pointAtOffset:outPoint:outTangent:", &v41, &v39, a3, *(void *)&MinY);
  double v24 = v40 * 0.5 * a7;
  double v25 = v39 * -0.5 * a7;
  double v26 = v41;
  double v27 = v42;
  CGFloat v28 = v25 + v42;
  a8->CGFloat x = v41 + v24;
  a8->CGFloat y = v28;
  a9->CGFloat x = v26 - v24;
  a9->CGFloat y = v27 - v25;
  if (a10)
  {
    double v29 = a6 * 1.57079633 + v22;
    if (v21 * 4.0 >= v22 / (v23 + v29))
    {
      double v32 = v29 / (v23 + v29);
      double v30 = v22 + MidX + a6 + a7 * 0.5;
      double v31 = 0.0;
      if (v21 * 4.0 < v32) {
        double v31 = v36 + a7 * -0.5;
      }
    }
    else
    {
      double v30 = NAN;
      double v31 = NAN;
    }
    a10->CGFloat x = _rotateToQuadrant(v20, v30, v31, v38);
    a10->CGFloat y = v33;
  }
  return v20;
}

- (CLKDevice)device
{
  return self->_device;
}

- (int64_t)updateFrequency
{
  return self->_updateFrequency;
}

- (void)setUpdateFrequency:(int64_t)a3
{
  self->_updateFrequencCGFloat y = a3;
}

- (NTKSquallColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (void)setColorPalette:(id)a3
{
  self->_colorPalette = (NTKSquallColorPalette *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bezelTimerToken, 0);
  objc_storeStrong((id *)&self->_tritiumImageView, 0);
  objc_storeStrong((id *)&self->_bezelImageView, 0);
  objc_storeStrong((id *)&self->_tritiumImage, 0);
  objc_storeStrong((id *)&self->_dimmedImage, 0);
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_pathStepper, 0);
  objc_storeStrong((id *)&self->_bezelPath, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end