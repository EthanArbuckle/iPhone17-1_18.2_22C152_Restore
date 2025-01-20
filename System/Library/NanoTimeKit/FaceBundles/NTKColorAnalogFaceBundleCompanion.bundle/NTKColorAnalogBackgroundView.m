@interface NTKColorAnalogBackgroundView
- (NTKColorAnalogBackgroundView)initWithFrame:(CGRect)a3 device:(id)a4;
- (void)applyColor:(id)a3;
- (void)applyStyle:(unint64_t)a3;
- (void)applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5 withPrimaryColor:(id)a6 boostedColor:(id)a7;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)updateLayerVisibilityForStyles:(id)a3;
@end

@implementation NTKColorAnalogBackgroundView

- (NTKColorAnalogBackgroundView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v67.receiver = self;
  v67.super_class = (Class)NTKColorAnalogBackgroundView;
  v11 = -[NTKColorAnalogBackgroundView initWithFrame:](&v67, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (!v11) {
    goto LABEL_12;
  }
  double v62 = width;
  double v63 = height;
  objc_storeStrong((id *)&v11->_device, a4);
  id v64 = v10;
  id v13 = v10;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15788);
  id WeakRetained = objc_loadWeakRetained(&qword_15790);
  if (WeakRetained)
  {
    v15 = WeakRetained;
    id v16 = objc_loadWeakRetained(&qword_15790);
    if (v16 == v13)
    {
      id v17 = [v13 version];
      uint64_t v18 = qword_15798;

      if (v17 == (id)v18) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v19 = objc_storeWeak(&qword_15790, v13);
  qword_15798 = (uint64_t)[v13 version];

  sub_5E24(v20, (uint64_t)v13);
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15788);
  uint64_t v21 = qword_15770;
  uint64_t v65 = qword_15778;

  uint64_t v22 = +[NSNull null];
  v68[0] = @"opacity";
  v68[1] = @"affineTransform";
  v69[0] = v22;
  v69[1] = v22;
  v68[2] = @"transform";
  v68[3] = @"position";
  v69[2] = v22;
  v69[3] = v22;
  v68[4] = @"bounds";
  v68[5] = @"backgroundColor";
  v69[4] = v22;
  v69[5] = v22;
  v68[6] = @"contentsMultiplyColor";
  v68[7] = @"borderColor";
  v69[6] = v22;
  v69[7] = v22;
  v68[8] = @"borderWidth";
  v61 = (void *)v22;
  v69[8] = v22;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:9];
  v24 = [(NTKColorAnalogBackgroundView *)v12 layer];
  [(NTKColorAnalogBackgroundView *)v12 bounds];
  double MidX = CGRectGetMidX(v70);
  [(NTKColorAnalogBackgroundView *)v12 bounds];
  double MidY = CGRectGetMidY(v71);
  double v27 = CGPointZero.y;
  +[NTKAnalogUtilities dialSizeForDevice:v13];
  double v29 = v28;
  double v31 = v30;
  uint64_t v32 = +[CALayer layer];
  tickContainerLayer = v12->_tickContainerLayer;
  v12->_tickContainerLayer = (CALayer *)v32;

  -[CALayer setBounds:](v12->_tickContainerLayer, "setBounds:", CGPointZero.x, v27, v29, v31);
  -[CALayer setPosition:](v12->_tickContainerLayer, "setPosition:", MidX, MidY);
  v34 = (void *)v23;
  [(CALayer *)v12->_tickContainerLayer setActions:v23];
  [v24 addSublayer:v12->_tickContainerLayer];
  v35 = +[NSMutableArray array];
  for (uint64_t i = 0; i != 60; ++i)
  {
    v37 = +[CALayer layer];
    objc_msgSend(v37, "setAnchorPoint:", 0.5, 0.5);
    [v37 setActions:v34];
    id v38 = +[UIColor whiteColor];
    objc_msgSend(v37, "setBackgroundColor:", objc_msgSend(v38, "CGColor"));

    double v39 = *(double *)&v65;
    if (i != 5 * ((858993460 * (unint64_t)i) >> 32)) {
      double v39 = *(double *)&v21;
    }
    double v40 = v39 * 0.5;
    objc_msgSend(v37, "setBounds:", CGPointZero.x, v27);
    [v37 setCornerRadius:v40];
    [v37 setCornerCurve:kCACornerCurveCircular];
    [v37 bounds];
    [(CALayer *)v12->_tickContainerLayer bounds];
    __sincos_stret((double)i * 0.104719755 + -1.57079633);
    CLKRoundForDevice();
    double v42 = v41;
    [(CALayer *)v12->_tickContainerLayer bounds];
    CLKRoundForDevice();
    objc_msgSend(v37, "setPosition:", v42, v43);
    CGAffineTransformMakeRotation(&v66, (double)i * 0.104719755 + 3.14159265);
    [v37 setAffineTransform:&v66];
    [v35 addObject:v37];
    [(CALayer *)v12->_tickContainerLayer addSublayer:v37];
  }
  v44 = (NSArray *)[v35 copy];
  tickLayers = v12->_tickLayers;
  v12->_tickLayers = v44;

  uint64_t v46 = +[CALayer layer];
  circleLayer = v12->_circleLayer;
  v12->_circleLayer = (CALayer *)v46;

  v48 = v12->_circleLayer;
  +[NTKAnalogUtilities dialSizeForDevice:v13];
  -[CALayer setBounds:](v48, "setBounds:", CGPointZero.x, v27, v49, v50);
  v51 = v12->_circleLayer;
  id v52 = +[UIColor whiteColor];
  -[CALayer setBackgroundColor:](v51, "setBackgroundColor:", [v52 CGColor]);

  v53 = v12->_circleLayer;
  [(CALayer *)v53 bounds];
  [(CALayer *)v53 setCornerRadius:v54 * 0.5];
  -[CALayer setPosition:](v12->_circleLayer, "setPosition:", MidX, MidY);
  [(CALayer *)v12->_circleLayer setActions:v34];
  [v24 addSublayer:v12->_circleLayer];
  uint64_t v55 = +[CALayer layer];
  fullscreenLayer = v12->_fullscreenLayer;
  v12->_fullscreenLayer = (CALayer *)v55;

  -[CALayer setBounds:](v12->_fullscreenLayer, "setBounds:", CGPointZero.x, v27, v62, v63);
  v57 = v12->_fullscreenLayer;
  id v58 = +[UIColor whiteColor];
  -[CALayer setBackgroundColor:](v57, "setBackgroundColor:", [v58 CGColor]);

  v59 = v12->_fullscreenLayer;
  [v13 screenCornerRadius];
  -[CALayer setCornerRadius:](v59, "setCornerRadius:");
  [(CALayer *)v12->_fullscreenLayer setCornerCurve:kCACornerCurveContinuous];
  -[CALayer setPosition:](v12->_fullscreenLayer, "setPosition:", MidX, MidY);
  [(CALayer *)v12->_fullscreenLayer setActions:v34];
  [v24 addSublayer:v12->_fullscreenLayer];
  [(NTKColorAnalogBackgroundView *)v12 setUserInteractionEnabled:0];

  id v10 = v64;
LABEL_12:

  return v12;
}

- (void)applyColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  id v6 = [v5 CGColor];
  [(CALayer *)self->_circleLayer setBackgroundColor:v6];
  [(CALayer *)self->_fullscreenLayer setBackgroundColor:v6];
  tickLayers = self->_tickLayers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_54E4;
  v8[3] = &unk_103F0;
  v8[4] = v6;
  [(NSArray *)tickLayers enumerateObjectsUsingBlock:v8];
}

- (void)applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5 withPrimaryColor:(id)a6 boostedColor:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  *(float *)&double v17 = fabs(a3 + -0.5) * -2.0 + 1.0;
  [v16 _solveForInput:v17];
  CGFloat v19 = v18 * 0.025 + 1.0;

  uint64_t v20 = NTKInterpolateBetweenColors();

  id v21 = v20;
  id v22 = [v21 CGColor];
  circleLayer = self->_circleLayer;
  CGAffineTransformMakeScale(&v32, v19, v19);
  [(CALayer *)circleLayer setAffineTransform:&v32];
  [(CALayer *)self->_circleLayer setBackgroundColor:v22];
  [(CALayer *)self->_fullscreenLayer setBackgroundColor:v22];
  NSUInteger v24 = [(NSArray *)self->_tickLayers count];
  tickLayers = self->_tickLayers;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_56F4;
  v28[3] = &unk_10418;
  unsigned int v31 = llround((double)(uint64_t)(v24 + 1) * a3);
  id v29 = v12;
  id v30 = v13;
  id v26 = v13;
  id v27 = v12;
  [(NSArray *)tickLayers enumerateObjectsUsingBlock:v28];
}

- (void)applyStyle:(unint64_t)a3
{
  self->_style = a3;
  fullscreenLayer = self->_fullscreenLayer;
  if (a3 == 2) {
    *(float *)&double v3 = 1.0;
  }
  else {
    *(float *)&double v3 = 0.0;
  }
  [(CALayer *)fullscreenLayer setOpacity:v3];
  if (a3 == 1) {
    *(float *)&double v7 = 1.0;
  }
  else {
    *(float *)&double v7 = 0.0;
  }
  [(CALayer *)self->_circleLayer setOpacity:v7];
  if (a3) {
    *(float *)&double v8 = 0.0;
  }
  else {
    *(float *)&double v8 = 1.0;
  }
  [(CALayer *)self->_tickContainerLayer setOpacity:v8];
  v9 = +[NSNumber numberWithUnsignedInteger:a3];
  v11 = v9;
  id v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [(NTKColorAnalogBackgroundView *)self updateLayerVisibilityForStyles:v10];
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  fullscreenLayer = self->_fullscreenLayer;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v9 = v9;
  [(CALayer *)fullscreenLayer setOpacity:v9];
  circleLayer = self->_circleLayer;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v11 = v11;
  [(CALayer *)circleLayer setOpacity:v11];
  tickContainerLayer = self->_tickContainerLayer;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v13 = v13;
  [(CALayer *)tickContainerLayer setOpacity:v13];
  id v14 = +[NSNumber numberWithUnsignedInteger:a4];
  v17[0] = v14;
  id v15 = +[NSNumber numberWithUnsignedInteger:a5];
  v17[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v17 count:2];
  [(NTKColorAnalogBackgroundView *)self updateLayerVisibilityForStyles:v16];
}

- (void)updateLayerVisibilityForStyles:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
    char v9 = 1;
    char v10 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v12 = (char *)[*(id *)(*((void *)&v13 + 1) + 8 * i) integerValue];
        if (v12 != (unsigned char *)&dword_0 + 2)
        {
          if (v12 != (unsigned char *)&dword_0 + 1)
          {
            if (v12) {
              continue;
            }
            char v10 = 0;
          }
          char v9 = 0;
        }
        char v8 = 0;
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v6) {
        goto LABEL_16;
      }
    }
  }
  char v8 = 1;
  char v9 = 1;
  char v10 = 1;
LABEL_16:
  [(CALayer *)self->_tickContainerLayer setHidden:v10 & 1];
  [(CALayer *)self->_circleLayer setHidden:v9 & 1];
  [(CALayer *)self->_fullscreenLayer setHidden:v8 & 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fullscreenLayer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_tickLayers, 0);

  objc_storeStrong((id *)&self->_tickContainerLayer, 0);
}

@end