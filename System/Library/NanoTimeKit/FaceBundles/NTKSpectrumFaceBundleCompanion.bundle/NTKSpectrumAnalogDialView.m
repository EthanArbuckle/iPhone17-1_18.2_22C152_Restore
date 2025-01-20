@interface NTKSpectrumAnalogDialView
+ (id)_disabledLayerActions;
- (NTKSpectrumAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5;
- (id)_instantaneousAnimationForKeyPath:(id)a3 value:(id)a4;
- (void)_toggleRasterization:(BOOL)a3;
- (void)cleanupAfterEdit;
- (void)fillDialTransitionWithFraction:(double)a3 bezelTextWidthRadians:(double)a4;
- (void)layoutSubviews;
- (void)prepareForEdit;
- (void)showAllTicksInDial;
- (void)transitInvisibleTicksAlphaWithBezelTextWidthInRadius:(double)a3 invisbleTicksAlpha:(double)a4;
- (void)transitTicksWithInitialBezelTextWidthInRadius:(double)a3 finalBezelTextWidthInRadius:(double)a4 fraction:(double)a5;
@end

@implementation NTKSpectrumAnalogDialView

- (NTKSpectrumAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v53.receiver = self;
  v53.super_class = (Class)NTKSpectrumAnalogDialView;
  v11 = -[NTKSpectrumAnalogDialView initWithFrame:](&v53, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    [(NTKSpectrumAnalogDialView *)v12 setOpaque:0];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    sub_38B8(v12->_device, &v49);
    v13 = [(NTKSpectrumAnalogDialView *)v12 layer];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = v18 * 0.5;
    double v23 = v20 * 0.5;
    v24 = [(id)objc_opt_class() _disabledLayerActions];
    uint64_t v25 = objc_opt_new();
    ticksLayer = v12->_ticksLayer;
    v12->_ticksLayer = (CALayer *)v25;

    -[CALayer setPosition:](v12->_ticksLayer, "setPosition:", v22, v23);
    -[CALayer setBounds:](v12->_ticksLayer, "setBounds:", v15, v17, v19, v21);
    [(CALayer *)v12->_ticksLayer setActions:v24];
    v45 = v13;
    [v13 addSublayer:v12->_ticksLayer];
    v27 = +[NSMutableArray array];
    v28 = +[UIColor grayColor];
    v29 = +[UIColor whiteColor];
    int v30 = 0;
    long long v31 = v51;
    double v47 = *(double *)&v51 * 0.5;
    double v48 = *((double *)&v51 + 1);
    long long v32 = v49;
    double v46 = *(double *)&v49;
    long long v33 = v50;
    double v34 = *((double *)&v49 + 1) * 0.5;
    do
    {
      unsigned int v35 = (unsigned __int16)v30 % 0xAu;
      v36 = objc_opt_new();
      v37 = v36;
      if (v35) {
        double v38 = *((double *)&v33 + 1);
      }
      else {
        double v38 = v46;
      }
      if (v35) {
        double v39 = *(double *)&v31;
      }
      else {
        double v39 = *((double *)&v32 + 1);
      }
      if (v35) {
        double v40 = v48;
      }
      else {
        double v40 = *(double *)&v33;
      }
      if (v35) {
        double v41 = v47;
      }
      else {
        double v41 = v34;
      }
      if (v35) {
        v42 = v28;
      }
      else {
        v42 = v29;
      }
      objc_msgSend(v36, "setBounds:", 0.0, 0.0, v38, v39);
      [v37 setCornerRadius:v40];
      objc_msgSend(v37, "setPosition:", v22, v41);
      [v37 setActions:v24];
      objc_msgSend(v37, "setBackgroundColor:", objc_msgSend(v42, "CGColor"));
      [(CALayer *)v12->_ticksLayer addSublayer:v37];
      [(NSArray *)v27 addObject:v37];

      ++v30;
    }
    while (v30 != 120);
    allTicks = v12->_allTicks;
    v12->_allTicks = v27;

    *(void *)&v12->_tickPadding = v52;
    [(NTKSpectrumAnalogDialView *)v12 _toggleRasterization:1];
  }
  return v12;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)NTKSpectrumAnalogDialView;
  [(NTKSpectrumAnalogDialView *)&v22 layoutSubviews];
  [(NTKSpectrumAnalogDialView *)self bounds];
  double v4 = v3;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  sub_38B8(self->_device, v19);
  uint64_t v5 = 0;
  double v6 = (*((double *)v19 + 1) - *(double *)&v20) * 0.5;
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v15 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  do
  {
    v7 = -[NSArray objectAtIndexedSubscript:](self->_allTicks, "objectAtIndexedSubscript:", v5, v13, v14, v15);
    *(_OWORD *)&v18.a = v15;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tdouble x = v13;
    double tickPadding = self->_tickPadding;
    *(_OWORD *)&v17.a = v15;
    *(_OWORD *)&v17.c = v14;
    *(_OWORD *)&v17.tdouble x = v13;
    CGAffineTransformTranslate(&v18, &v17, 0.0, tickPadding);
    [v7 size];
    CGFloat v10 = v4 * 0.5 + v9 * -0.5 - self->_tickPadding;
    CGAffineTransform v16 = v18;
    CGAffineTransformTranslate(&v17, &v16, 0.0, v10);
    CGAffineTransform v18 = v17;
    CLKDegreesToRadians();
    CGAffineTransform v16 = v18;
    CGAffineTransformRotate(&v17, &v16, v11);
    CGAffineTransform v18 = v17;
    CGAffineTransform v16 = v17;
    CGAffineTransformTranslate(&v17, &v16, 0.0, -v10);
    CGAffineTransform v18 = v17;
    HIDWORD(v12) = -858993459 * v5;
    LODWORD(v12) = HIDWORD(v12);
    if ((v12 >> 1) >= 0x1999999A)
    {
      CGAffineTransform v16 = v18;
      CGAffineTransformTranslate(&v17, &v16, 0.0, v6);
      CGAffineTransform v18 = v17;
    }
    CGAffineTransform v17 = v18;
    [v7 setAffineTransform:&v17];

    ++v5;
  }
  while (v5 != 120);
}

- (id)_instantaneousAnimationForKeyPath:(id)a3 value:(id)a4
{
  id v4 = a4;
  uint64_t v5 = +[CABasicAnimation animationWithKeyPath:@"instanceDelay"];
  [v5 setFromValue:v4];
  [v5 setToValue:v4];

  [v5 setBeginTime:0.00000011920929];
  [v5 setDuration:0.00001];
  [v5 setFillMode:kCAFillModeForwards];

  return v5;
}

- (void)prepareForEdit
{
}

- (void)cleanupAfterEdit
{
}

- (void)fillDialTransitionWithFraction:(double)a3 bezelTextWidthRadians:(double)a4
{
  unint64_t v6 = (unint64_t)((double)[(NSArray *)self->_allTicks count] * a3);
  allTicks = self->_allTicks;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3DBC;
  v8[3] = &unk_104B0;
  v8[4] = self;
  *(double *)&v8[5] = a4;
  v8[6] = v6;
  [(NSArray *)allTicks enumerateObjectsUsingBlock:v8];
}

- (void)showAllTicksInDial
{
}

- (void)transitTicksWithInitialBezelTextWidthInRadius:(double)a3 finalBezelTextWidthInRadius:(double)a4 fraction:(double)a5
{
  allTicks = self->_allTicks;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3EE0;
  v6[3] = &unk_104D8;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  *(double *)&v6[6] = a4;
  *(double *)&v6[7] = a5;
  [(NSArray *)allTicks enumerateObjectsUsingBlock:v6];
}

- (void)transitInvisibleTicksAlphaWithBezelTextWidthInRadius:(double)a3 invisbleTicksAlpha:(double)a4
{
  allTicks = self->_allTicks;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4008;
  v5[3] = &unk_104B0;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  *(double *)&v5[6] = a4;
  [(NSArray *)allTicks enumerateObjectsUsingBlock:v5];
}

+ (id)_disabledLayerActions
{
  if (qword_16DA8 != -1) {
    dispatch_once(&qword_16DA8, &stru_10518);
  }
  v2 = (void *)qword_16DA0;

  return v2;
}

- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5
{
  if (a3 >= 61) {
    [(NSArray *)self->_allTicks count];
  }
  CLKDegreesToRadians();
  BOOL v8 = v7 < a4 * 0.5;
  double result = 1.0;
  if (v8) {
    return a5;
  }
  return result;
}

- (void)_toggleRasterization:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NTKSpectrumAnalogDialView *)self layer];
  id v6 = v5;
  if (v3)
  {
    [v5 setShouldRasterize:1];
    [(CLKDevice *)self->_device screenScale];
    objc_msgSend(v6, "setRasterizationScale:");
  }
  else
  {
    [v5 setShouldRasterize:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTicks, 0);
  objc_storeStrong((id *)&self->_ticksLayer, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end