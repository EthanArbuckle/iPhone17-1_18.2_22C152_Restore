@interface AXTouchAccommodationsViewController
- (BOOL)_canShowWhileLocked;
- (CGPath)_drawFullCircleWithRadius:(double)a3;
- (id)_createLayerAtPoint:(CGPoint)a3;
- (id)_createProgressLayerWithColor:(id)a3 withFilterName:(id)a4 forHoldDuration:(BOOL)a5;
- (id)_createTransformLayerForHoldDuration:(BOOL)a3;
- (void)removeAllHandTouchMarkers;
- (void)resetProgressTrackOfHandTouchMarkerAtPoints:(id)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)updateLocationOfHandTouchMarkerAtPoints:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXTouchAccommodationsViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)AXTouchAccommodationsViewController;
  [(AXTouchAccommodationsViewController *)&v9 viewDidLoad];
  id v3 = objc_alloc((Class)UIView);
  v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v5 = objc_msgSend(v3, "initWithFrame:");
  [(AXTouchAccommodationsViewController *)self setView:v5];

  v6 = [(AXTouchAccommodationsViewController *)self view];
  [v6 setUserInteractionEnabled:0];

  v7 = (SBSSystemApertureLayoutMonitor *)objc_alloc_init((Class)SBSSystemApertureLayoutMonitor);
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v7;

  [(SBSSystemApertureLayoutMonitor *)self->_layoutMonitor addObserver:self];
  self->_foreheadRect.origin = 0u;
  self->_foreheadRect.size = 0u;
}

- (void)resetProgressTrackOfHandTouchMarkerAtPoints:(id)a3
{
  id v24 = a3;
  -[AXTouchAccommodationsViewController updateLocationOfHandTouchMarkerAtPoints:](self, "updateLocationOfHandTouchMarkerAtPoints:");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = [(CATransformLayer *)self->_transformLayer sublayers];
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v11 = [v10 name];
        unsigned int v12 = [v11 isEqualToString:@"tapAssistanceProgressTrack"];

        if (v12)
        {
          id v13 = v10;

          v7 = v13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  [v7 removeFromSuperlayer];
  v14 = +[AXSettings sharedInstance];
  v15 = (char *)[v14 touchAccommodationsTapActivationMethod];

  if (v15 == (unsigned char *)&dword_0 + 2)
  {
    v16 = +[AXSettings sharedInstance];
    [v16 touchAccommodationsTapActivationTimeout];
    double v18 = v17;

    if (v18 <= 0.289999992)
    {
      v19 = +[UIColor clearColor];
      v21 = self;
      v22 = v19;
      uint64_t v20 = 0;
    }
    else
    {
      v19 = +[UIColor whiteColor];
      uint64_t v20 = kCAFilterNormalBlendMode;
      v21 = self;
      v22 = v19;
    }
    v23 = [(AXTouchAccommodationsViewController *)v21 _createProgressLayerWithColor:v22 withFilterName:v20 forHoldDuration:0];

    [v23 setName:@"tapAssistanceProgressTrack"];
    [(CATransformLayer *)self->_transformLayer addSublayer:v23];
  }
}

- (void)updateLocationOfHandTouchMarkerAtPoints:(id)a3
{
  id v47 = a3;
  v4 = [(AXTouchAccommodationsViewController *)self view];
  id v5 = [v4 layer];
  id v6 = [v5 sublayers];
  v7 = [v6 count];
  uint64_t v8 = [v47 count];

  id v9 = [v47 count];
  v10 = [(AXTouchAccommodationsViewController *)self view];
  v11 = [v10 layer];
  unsigned int v12 = [v11 sublayers];
  id v13 = [v12 count];

  if (v9 < v13)
  {
    int64_t v14 = v7 - v8;
    if (v7 - v8 >= 1)
    {
      do
      {
        v15 = [(AXTouchAccommodationsViewController *)self view];
        v16 = [v15 layer];
        double v17 = [v16 sublayers];
        double v18 = [v17 lastObject];
        [v18 removeFromSuperlayer];

        --v14;
      }
      while (v14);
    }
  }
  if ([v47 count])
  {
    unint64_t v19 = 0;
    do
    {
      uint64_t v20 = [(AXTouchAccommodationsViewController *)self view];
      v21 = [v20 layer];
      v22 = [v21 sublayers];
      id v23 = [v22 count];

      if ((unint64_t)v23 <= v19)
      {
        v36 = [(AXTouchAccommodationsViewController *)self view];
        v37 = [v36 layer];
        v38 = [v47 objectAtIndex:v19];
        [v38 CGPointValue];
        v39 = -[AXTouchAccommodationsViewController _createLayerAtPoint:](self, "_createLayerAtPoint:");
        [v37 addSublayer:v39];
      }
      else
      {
        +[CATransaction setDisableActions:1];
        +[CATransaction begin];
        if (AXDeviceHasJindo())
        {
          id v24 = [v47 objectAtIndex:v19];
          [v24 CGPointValue];
          double v26 = v25;
          double v28 = v27;

          v29 = +[AXUIDisplayManager sharedDisplayManager];
          v30 = (int *)[v29 activeInterfaceOrientation];

          if (v30 == (int *)((char *)&dword_0 + 3))
          {
            double v45 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height;
            if (v45 > v26 + -50.0) {
              double v26 = v45 + 50.0 + 5.0;
            }
          }
          else if (v30 == &dword_4)
          {
            v31 = [(AXTouchAccommodationsViewController *)self view];
            [v31 frame];
            double v33 = v32 - (self->_foreheadRect.origin.y + self->_foreheadRect.size.height);

            if (v26 + 50.0 > v33)
            {
              v34 = [(AXTouchAccommodationsViewController *)self view];
              [v34 frame];
              double v26 = v35 - (self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 50.0 + 5.0);
            }
          }
          else
          {
            double v46 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height;
            if (v46 > v28 + -50.0) {
              double v28 = v46 + 50.0 + 5.0;
            }
          }
          v40 = [(AXTouchAccommodationsViewController *)self view];
          v41 = [v40 layer];
          v42 = [v41 sublayers];
          v43 = [v42 objectAtIndex:v19];
          objc_msgSend(v43, "setPosition:", v26, v28);
        }
        else
        {
          v40 = [(AXTouchAccommodationsViewController *)self view];
          v41 = [v40 layer];
          v42 = [v41 sublayers];
          v43 = [v42 objectAtIndex:v19];
          v44 = [v47 objectAtIndex:v19];
          [v44 CGPointValue];
          objc_msgSend(v43, "setPosition:");
        }
        +[CATransaction commit];
        +[CATransaction setDisableActions:0];
      }
      ++v19;
    }
    while ((unint64_t)[v47 count] > v19);
  }
}

- (id)_createLayerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  id v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 touchAccommodationsHoldDurationEnabled];

  if (v7)
  {
    uint64_t v8 = self;
    uint64_t v9 = 1;
LABEL_5:
    unsigned int v12 = [(AXTouchAccommodationsViewController *)v8 _createTransformLayerForHoldDuration:v9];
    transformLayer = self->_transformLayer;
    self->_transformLayer = v12;

    goto LABEL_6;
  }
  v10 = +[AXSettings sharedInstance];
  id v11 = [v10 touchAccommodationsTapActivationMethod];

  if (v11)
  {
    uint64_t v8 = self;
    uint64_t v9 = 0;
    goto LABEL_5;
  }
LABEL_6:
  if (self->_foreheadRect.origin.y + self->_foreheadRect.size.height > y + -50.0 && AXDeviceHasJindo())
  {
    int64_t v14 = self->_transformLayer;
    double v15 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 50.0 + 5.0;
    double v16 = x;
  }
  else
  {
    int64_t v14 = self->_transformLayer;
    double v16 = x;
    double v15 = y;
  }
  -[CATransformLayer setPosition:](v14, "setPosition:", v16, v15);
  double v17 = +[AXSettings sharedInstance];
  unsigned int v18 = [v17 touchAccommodationsHoldDurationEnabled];

  unint64_t v19 = +[AXSettings sharedInstance];
  uint64_t v20 = v19;
  if (v18)
  {
    [v19 touchAccommodationsHoldDuration];
    double v22 = v21;

    if (v22 <= 0.289999992)
    {
      id v23 = +[UIColor clearColor];
      double v25 = self;
      double v26 = v23;
      uint64_t v24 = 0;
    }
    else
    {
      id v23 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
      uint64_t v24 = kCAFilterMaximum;
      double v25 = self;
      double v26 = v23;
    }
    double v35 = [(AXTouchAccommodationsViewController *)v25 _createProgressLayerWithColor:v26 withFilterName:v24 forHoldDuration:1];

    CFStringRef v36 = @"holdDurationProgressTrack";
LABEL_21:
    [v35 setName:v36];
    [(CATransformLayer *)self->_transformLayer addSublayer:v35];

    goto LABEL_22;
  }
  id v27 = [v19 touchAccommodationsTapActivationMethod];

  if (v27)
  {
    double v28 = +[AXSettings sharedInstance];
    [v28 touchAccommodationsTapActivationTimeout];
    double v30 = v29;

    if (v30 <= 0.289999992)
    {
      v31 = +[UIColor clearColor];
      double v33 = self;
      v34 = v31;
      uint64_t v32 = 0;
    }
    else
    {
      v31 = +[UIColor whiteColor];
      uint64_t v32 = kCAFilterNormalBlendMode;
      double v33 = self;
      v34 = v31;
    }
    double v35 = [(AXTouchAccommodationsViewController *)v33 _createProgressLayerWithColor:v34 withFilterName:v32 forHoldDuration:0];

    CFStringRef v36 = @"tapAssistanceProgressTrack";
    goto LABEL_21;
  }
LABEL_22:
  v37 = self->_transformLayer;

  return v37;
}

- (id)_createTransformLayerForHoldDuration:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[CATransformLayer layer];
  id v6 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v6, "setPath:", -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 50.0));
  [v6 setName:@"shapeLayerDisc"];
  id v7 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v7, "setPath:", -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 5.0));
  [v7 setName:@"shapeLayerDot"];
  id v8 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v8, "setPath:", -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 45.0));
  id v9 = +[UIColor clearColor];
  objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

  [v8 setLineWidth:2.5];
  [v8 setName:@"shapeLayerEmptyTrack"];
  v10 = +[AXSettings sharedInstance];
  id v11 = v10;
  if (v3)
  {
    [v10 touchAccommodationsHoldDuration];
    double v13 = v12;

    if (v13 <= 0.289999992)
    {
      id v14 = 0;
      double v15 = 0.0;
      double v16 = 0.0;
    }
    else
    {
      id v14 = +[CAFilter filterWithType:kCAFilterPlusD];
      double v15 = 0.25;
      double v16 = 0.300000012;
    }
    double v21 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:v15];
    id v19 = v14;
    double v20 = v16;
  }
  else
  {
    [v10 touchAccommodationsTapActivationTimeout];
    double v18 = v17;

    if (v18 <= 0.289999992)
    {
      double v21 = +[UIColor clearColor];
      id v14 = 0;
      id v19 = 0;
      double v16 = 0.0;
      double v20 = 0.0;
    }
    else
    {
      id v19 = +[CAFilter filterWithType:kCAFilterPlusD];
      double v20 = 0.5;
      double v21 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
      id v14 = 0;
      double v16 = 0.300000012;
    }
  }
  id v22 = v21;
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

  id v23 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:v20];
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v23, "CGColor"));

  [v6 setCompositingFilter:v19];
  id v24 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:v16];
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v24, "CGColor"));

  [v7 setCompositingFilter:v19];
  [v8 setCompositingFilter:v14];
  [v5 addSublayer:v6];
  [v5 addSublayer:v7];
  [v5 addSublayer:v8];

  return v5;
}

- (id)_createProgressLayerWithColor:(id)a3 withFilterName:(id)a4 forHoldDuration:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v10, "setPosition:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(v10, "setPath:", -[AXTouchAccommodationsViewController _drawFullCircleWithRadius:](self, "_drawFullCircleWithRadius:", 45.0));
  +[CATransaction begin];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_68A4;
  v25[3] = &unk_10510;
  BOOL v26 = v5;
  v25[4] = self;
  +[CATransaction setCompletionBlock:v25];
  id v11 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  double v12 = +[AXSettings sharedInstance];
  double v13 = v12;
  if (v5)
  {
    [v12 touchAccommodationsHoldDuration];
    double v15 = v14 + -0.100000001;
  }
  else
  {
    unsigned int v16 = [v12 touchAccommodationsHoldDurationEnabled];

    double v13 = +[AXSettings sharedInstance];
    [v13 touchAccommodationsTapActivationTimeout];
    if (!v16) {
      double v15 = v15 + -0.100000001;
    }
  }
  [v11 setDuration:v15];

  double v17 = +[NSNumber numberWithInt:0];
  [v11 setFromValue:v17];

  double v18 = +[NSNumber numberWithInt:1];
  [v11 setToValue:v18];

  [v10 addAnimation:v11 forKey:@"drawCircleAnimation"];
  +[CATransaction commit];
  id v19 = v9;
  id v20 = [v19 CGColor];

  [v10 setStrokeColor:v20];
  id v21 = +[UIColor clearColor];
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v21, "CGColor"));

  if (v8)
  {
    id v22 = +[CAFilter filterWithType:v8];
    [v10 setCompositingFilter:v22];
  }
  else
  {
    [v10 setCompositingFilter:0];
  }
  [v10 setLineWidth:2.5];
  id v23 = +[UIScreen mainScreen];
  [v23 scale];
  objc_msgSend(v10, "setContentsScale:");

  return v10;
}

- (CGPath)_drawFullCircleWithRadius:(double)a3
{
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, CGPointZero.x, CGPointZero.y, a3, -1.57079633, 4.71238898);
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = (CGPath *)[v3 CGPath];

  return v4;
}

- (void)removeAllHandTouchMarkers
{
  id v4 = [(AXTouchAccommodationsViewController *)self view];
  v2 = [v4 layer];
  id v3 = [v2 sublayers];
  [v3 makeObjectsPerformSelector:"removeFromSuperlayer"];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v24 = a3;
  if ([v24 count] == (char *)&dword_0 + 1)
  {
    p_foreheadRect = &self->_foreheadRect;
    BOOL v5 = [v24 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    p_foreheadRect->origin.CGFloat x = v6;
    p_foreheadRect->origin.double y = v7;
    p_foreheadRect->size.width = v8;
    p_foreheadRect->size.height = v9;
  }
  else
  {
    if ([v24 count] != (char *)&dword_0 + 2) {
      goto LABEL_6;
    }
    id v10 = &self->_foreheadRect;
    BOOL v5 = [v24 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    id v19 = [v24 objectAtIndexedSubscript:1];
    [v19 CGRectValue];
    v27.origin.CGFloat x = v20;
    v27.origin.double y = v21;
    v27.size.width = v22;
    v27.size.height = v23;
    v26.origin.CGFloat x = v12;
    v26.origin.double y = v14;
    v26.size.width = v16;
    v26.size.height = v18;
    CGRect *v10 = CGRectUnion(v26, v27);
  }
LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMonitor, 0);

  objc_storeStrong((id *)&self->_transformLayer, 0);
}

@end