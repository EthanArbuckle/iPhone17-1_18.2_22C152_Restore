@interface NTKActivityDialSegment
- (CALayer)arcLayer;
- (CALayer)tickLayer;
- (CGRect)_computeArcFrame;
- (NTKActivityDialSegment)initWithHourIndex:(int64_t)a3 LayoutConstants:(id *)a4 dialRadius:(double)a5 device:(id)a6;
- (NTKFaceColorScheme)colorScheme;
- (double)alpha;
- (double)tickRotation;
- (double)tickScale;
- (id)_createArcImageWithFrame:(CGRect)a3 insetAngle:(double)a4;
- (void)_updateTransform;
- (void)setAlpha:(double)a3;
- (void)setArcLayer:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setTickLayer:(id)a3;
- (void)setTickRotation:(double)a3;
- (void)setTickScale:(double)a3;
@end

@implementation NTKActivityDialSegment

- (NTKActivityDialSegment)initWithHourIndex:(int64_t)a3 LayoutConstants:(id *)a4 dialRadius:(double)a5 device:(id)a6
{
  id v11 = a6;
  v49.receiver = self;
  v49.super_class = (Class)NTKActivityDialSegment;
  v12 = [(NTKActivityDialSegment *)&v49 init];
  v13 = v12;
  if (v12)
  {
    double var1 = a4->var1;
    double var0 = a4->var0;
    double v14 = a4->var0;
    v12->_dialCenter.double x = a5;
    v12->_dialCenter.y = a5;
    double v16 = v14 * 0.5;
    v12->_double midRadius = a5 - v16;
    v12->_outerRadius = a5;
    v12->_innerRadius = a5 - v16 - v16;
    double v17 = 6.28318531 / (double)a4->var2;
    double v18 = v17 * (double)a3;
    v12->_tickRotation = v18;
    v12->_startAngle = v18 + -1.57079633;
    v12->_endAngle = v17 + v18 + -1.57079633;
    [(NTKActivityDialSegment *)v12 _computeArcFrame];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double x = v13->_dialCenter.x;
    double midRadius = v13->_midRadius;
    __double2 v29 = __sincos_stret(v13->_tickRotation + -1.57079633);
    double v30 = x + midRadius * v29.__cosval;
    CGFloat v31 = v13->_dialCenter.y + midRadius * v29.__sinval;
    float v32 = var1 * 0.5 / v13->_outerRadius;
    v33 = -[NTKActivityDialSegment _createArcImageWithFrame:insetAngle:](v13, "_createArcImageWithFrame:insetAngle:", v20, v22, v24, v26, asinf(v32));
    uint64_t v34 = objc_opt_new();
    tickLayer = v13->_tickLayer;
    v13->_tickLayer = (CALayer *)v34;

    v36 = +[NSNull null];
    v37 = v13->_tickLayer;
    id v38 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v37, "setBackgroundColor:", [v38 CGColor]);

    v39 = v13->_tickLayer;
    v52[0] = @"transform";
    v52[1] = @"contentsMultiplyColor";
    v53[0] = v36;
    v53[1] = v36;
    v40 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
    [(CALayer *)v39 setActions:v40];

    -[CALayer setBounds:](v13->_tickLayer, "setBounds:", CGPointZero.x, CGPointZero.y, var1, var0);
    -[CALayer setPosition:](v13->_tickLayer, "setPosition:", v30, v31);
    v13->_tickScale = 1.0;
    uint64_t v41 = objc_opt_new();
    arcLayer = v13->_arcLayer;
    v13->_arcLayer = (CALayer *)v41;

    v43 = v13->_arcLayer;
    CFStringRef v50 = @"contentsMultiplyColor";
    v51 = v36;
    v44 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    [(CALayer *)v43 setActions:v44];

    v45 = v13->_arcLayer;
    id v46 = v33;
    -[CALayer setContents:](v45, "setContents:", [v46 CGImage]);
    -[CALayer setFrame:](v13->_arcLayer, "setFrame:", v20, v22, v24, v26);
    [(NTKActivityDialSegment *)v13 _updateTransform];
    objc_storeStrong((id *)&v13->_device, a6);
  }
  return v13;
}

- (CGRect)_computeArcFrame
{
  double x = self->_dialCenter.x;
  double outerRadius = self->_outerRadius;
  __double2 v5 = __sincos_stret(self->_startAngle);
  double v6 = x + outerRadius * v5.__cosval;
  double y = self->_dialCenter.y;
  double v8 = y + outerRadius * v5.__sinval;
  __double2 v9 = __sincos_stret(self->_endAngle);
  double v10 = x + outerRadius * v9.__cosval;
  double v11 = y + outerRadius * v9.__sinval;
  double innerRadius = self->_innerRadius;
  double v13 = x + innerRadius * v5.__cosval;
  double v14 = y + innerRadius * v5.__sinval;
  double v15 = x + innerRadius * v9.__cosval;
  double v16 = y + innerRadius * v9.__sinval;
  if (v14 >= v16) {
    double v17 = y + innerRadius * v9.__sinval;
  }
  else {
    double v17 = y + innerRadius * v5.__sinval;
  }
  if (v14 < v16) {
    double v14 = v16;
  }
  if (v13 >= v15) {
    double v18 = v15;
  }
  else {
    double v18 = v13;
  }
  if (v13 < v15) {
    double v13 = v15;
  }
  if (v10 < v18) {
    double v18 = x + outerRadius * v9.__cosval;
  }
  if (v6 < v18) {
    double v18 = x + outerRadius * v5.__cosval;
  }
  double v19 = floor(v18);
  if (v11 >= v17) {
    double v20 = v17;
  }
  else {
    double v20 = y + outerRadius * v9.__sinval;
  }
  if (v8 < v20) {
    double v20 = y + outerRadius * v5.__sinval;
  }
  double v21 = floor(v20);
  if (v10 < v13) {
    double v10 = v13;
  }
  if (v6 >= v10) {
    double v10 = x + outerRadius * v5.__cosval;
  }
  double v22 = ceil(v10);
  if (v11 < v14) {
    double v11 = v14;
  }
  if (v8 >= v11) {
    double v11 = y + outerRadius * v5.__sinval;
  }
  double v23 = v22 - v19;
  double v24 = ceil(v11) - v21;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.double y = v21;
  result.origin.double x = v19;
  return result;
}

- (id)_createArcImageWithFrame:(CGRect)a3 insetAngle:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v8 = self->_dialCenter.x - a3.origin.x;
  CGFloat v9 = self->_dialCenter.y - a3.origin.y;
  id v10 = objc_alloc_init((Class)UIBezierPath);
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v9, self->_outerRadius, self->_startAngle + a4, self->_endAngle - a4);
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v8, v9, self->_innerRadius, self->_endAngle - a4, self->_startAngle + a4);
  [v10 closePath];
  v16.CGFloat width = width;
  v16.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v17.origin.double x = 0.0;
  v17.origin.double y = 0.0;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v17);
  v12 = +[UIColor whiteColor];
  [v12 setFill];

  [v10 fill];
  double v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

- (void)setColorScheme:(id)a3
{
  CGFloat v9 = (NTKFaceColorScheme *)a3;
  if (self->_colorScheme != v9)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    arcLayer = self->_arcLayer;
    id v6 = [(NTKFaceColorScheme *)v9 shiftedBackgroundColor];
    -[CALayer setContentsMultiplyColor:](arcLayer, "setContentsMultiplyColor:", [v6 CGColor]);

    tickLayer = self->_tickLayer;
    id v8 = [(NTKFaceColorScheme *)v9 activityTickColor];
    -[CALayer setBackgroundColor:](tickLayer, "setBackgroundColor:", [v8 CGColor]);
  }
}

- (void)setAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_double alpha = a3;
    *(float *)&double v5 = a3;
    [(CALayer *)self->_tickLayer setOpacity:v5];
    arcLayer = self->_arcLayer;
    double alpha = self->_alpha;
    *(float *)&double alpha = alpha;
    [(CALayer *)arcLayer setOpacity:alpha];
  }
}

- (void)setTickScale:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_tickScale = a3;
    [(NTKActivityDialSegment *)self _updateTransform];
  }
}

- (void)_updateTransform
{
  tickLayer = self->_tickLayer;
  CATransform3DMakeScale(&a, self->_tickScale, 1.0, 1.0);
  CATransform3DMakeRotation(&v4, self->_tickRotation, 0.0, 0.0, 1.0);
  CATransform3DConcat(&v6, &a, &v4);
  [(CALayer *)tickLayer setTransform:&v6];
}

- (double)alpha
{
  return self->_alpha;
}

- (NTKFaceColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (CALayer)arcLayer
{
  return self->_arcLayer;
}

- (void)setArcLayer:(id)a3
{
}

- (CALayer)tickLayer
{
  return self->_tickLayer;
}

- (void)setTickLayer:(id)a3
{
}

- (double)tickRotation
{
  return self->_tickRotation;
}

- (void)setTickRotation:(double)a3
{
  self->_tickRotation = a3;
}

- (double)tickScale
{
  return self->_tickScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickLayer, 0);
  objc_storeStrong((id *)&self->_arcLayer, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end