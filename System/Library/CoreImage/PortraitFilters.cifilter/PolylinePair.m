@interface PolylinePair
- (CGPath)boundsPath;
- (CGPoint)axisV;
- (CGPoint)normVbottom;
- (CGPoint)normVtop;
- (CGRect)xyBoundsRect;
- (Polyline)bottom;
- (Polyline)top;
- (PolylinePair)initWithMaxsize:(float)a3 segmentDelta:(float)a4 andAxis:(CGPoint)a5;
- (double)s0;
- (double)s1;
- (id)createTopBottomRegion;
- (int)npoints;
- (void)accomodatePoint:(CGPoint)a3;
- (void)bridgeGapsLinear;
- (void)constructBezierWithToleranceTop:(float)a3 bottom:(float)a4;
- (void)dealloc;
- (void)expandWithToleranceTop:(float)a3 bottom:(float)a4;
- (void)extrapolateAndJoinTopAndBottom;
- (void)setAxisV:(CGPoint)a3;
- (void)setNormVbottom:(CGPoint)a3;
- (void)setNormVtop:(CGPoint)a3;
- (void)setS0:(double)a3;
- (void)setS1:(double)a3;
@end

@implementation PolylinePair

- (PolylinePair)initWithMaxsize:(float)a3 segmentDelta:(float)a4 andAxis:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  v19.receiver = self;
  v19.super_class = (Class)PolylinePair;
  v9 = [(PolylinePair *)&v19 init];
  v10 = [Polyline alloc];
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a4;
  v9->_top = -[Polyline initWithMaxsize:segmentDelta:andAxis:](v10, "initWithMaxsize:segmentDelta:andAxis:", v11, v12, x, y);
  v13 = [Polyline alloc];
  *(float *)&double v14 = a3;
  *(float *)&double v15 = a4;
  v9->_bottom = -[Polyline initWithMaxsize:segmentDelta:andAxis:](v13, "initWithMaxsize:segmentDelta:andAxis:", v14, v15, x, y);
  [(Polyline *)v9->_top normV];
  v9->normVtop.double x = v16;
  v9->normVtop.double y = v17;
  v9->normVbottom.double x = -v16;
  v9->normVbottom.double y = -v17;
  -[Polyline setNormV:](v9->_bottom, "setNormV:");
  v9->sdelta = a4;
  return v9;
}

- (void)dealloc
{
  CGPathRelease(self->boundsPath);
  v3.receiver = self;
  v3.super_class = (Class)PolylinePair;
  [(PolylinePair *)&v3 dealloc];
}

- (CGRect)xyBoundsRect
{
  [(Polyline *)self->_top xyBoundsRect];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(Polyline *)self->_bottom xyBoundsRect];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;

  return CGRectUnion(*(CGRect *)&v19, *(CGRect *)&v12);
}

- (void)accomodatePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[Polyline accomodatePoint:]([(PolylinePair *)self top], "accomodatePoint:", a3.x, a3.y);
  -[Polyline accomodatePoint:]([(PolylinePair *)self bottom], "accomodatePoint:", x, y);
  [[(PolylinePair *)self top] s0];
  double v7 = v6;
  [[(PolylinePair *)self bottom] s0];
  if (v7 < v8) {
    double v8 = v7;
  }
  self->s0 = v8;
  [[(PolylinePair *)self top] s1];
  double v10 = v9;
  [[(PolylinePair *)self bottom] s1];
  if (v10 >= v11) {
    double v11 = v10;
  }
  self->s1 = v11;
}

- (int)npoints
{
  return 1;
}

- (void)bridgeGapsLinear
{
}

- (void)extrapolateAndJoinTopAndBottom
{
  top = self->_top;
  [(Polyline *)top s0];
  -[Polyline xyFromS:](top, "xyFromS:");
  double v5 = v4;
  double v7 = v6;
  double v8 = self->_top;
  [(Polyline *)v8 s0];
  [(Polyline *)v8 xyFromS:v9 + self->sdelta];
  double v11 = v10;
  double v13 = v12;
  bottom = self->_bottom;
  [(Polyline *)bottom s0];
  -[Polyline xyFromS:](bottom, "xyFromS:");
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = self->_bottom;
  [(Polyline *)v19 s0];
  [(Polyline *)v19 xyFromS:v20 + self->sdelta];
  double v23 = (v13 - v7) / (v11 - v5);
  if (v11 - v5 == 0.0) {
    double v23 = 0.0;
  }
  double v24 = (v22 - v18) / (v21 - v16);
  if (vabdd_f64(v24, v23) >= 0.01)
  {
    double v25 = (v7 - v18 + v24 * v16 - v23 * v5) / (v24 - v23);
    double v7 = v7 - v23 * (v5 - v25);
  }
  else
  {
    double v25 = v5 - self->sdelta;
  }
  -[Polyline accomodatePoint:]([(PolylinePair *)self top], "accomodatePoint:", v25, v7);
  -[Polyline accomodatePoint:]([(PolylinePair *)self bottom], "accomodatePoint:", v25, v7);
  v26 = self->_top;
  [(Polyline *)v26 s1];
  -[Polyline xyFromS:](v26, "xyFromS:");
  double v28 = v27;
  double v30 = v29;
  v31 = self->_top;
  [(Polyline *)v31 s1];
  [(Polyline *)v31 xyFromS:v32 - self->sdelta];
  double v34 = v33;
  double v36 = v35;
  v37 = self->_bottom;
  [(Polyline *)v37 s1];
  -[Polyline xyFromS:](v37, "xyFromS:");
  double v39 = v38;
  double v41 = v40;
  v42 = self->_bottom;
  [(Polyline *)v42 s1];
  [(Polyline *)v42 xyFromS:v43 - self->sdelta];
  double v46 = (v36 - v30) / (v34 - v28);
  if (v34 - v28 == 0.0) {
    double v46 = 0.0;
  }
  double v47 = (v45 - v41) / (v44 - v39);
  if (vabdd_f64(v47, v46) >= 0.01)
  {
    double v48 = (v30 - v41 + v47 * v39 - v46 * v28) / (v47 - v46);
    double v30 = v30 - v46 * (v28 - v48);
  }
  else
  {
    double v48 = v28 + self->sdelta;
  }
  double v49 = v48 + 0.00100000005;
  -[Polyline accomodatePoint:]([(PolylinePair *)self top], "accomodatePoint:", v48 + 0.00100000005, v30);
  v50 = [(PolylinePair *)self bottom];

  -[Polyline accomodatePoint:](v50, "accomodatePoint:", v49, v30);
}

- (void)constructBezierWithToleranceTop:(float)a3 bottom:(float)a4
{
  Mutable = CGPathCreateMutable();
  [(Polyline *)self->_top xyFromS:self->s0 + 0.00100000005];
  double v8 = a3;
  CGPathMoveToPoint(Mutable, 0, v9 + self->normVtop.x * a3, v10 + self->normVtop.y * a3);
  double sdelta = self->sdelta;
  double s1 = self->s1;
  float v13 = self->s0 + sdelta + 0.00100000005;
  double v14 = v13;
  while (s1 + sdelta * 0.5 + 0.00100000005 >= v14)
  {
    [(Polyline *)self->_top xyFromS:v14];
    CGPathAddLineToPoint(Mutable, 0, v15 + self->normVtop.x * v8, v16 + self->normVtop.y * v8);
    double sdelta = self->sdelta;
    float v17 = v14 + sdelta;
    double v14 = v17;
    double s1 = self->s1;
  }
  double v18 = s1 + 0.00100000005;
  [(Polyline *)self->_bottom xyFromS:s1 + 0.00100000005];
  double v19 = a4;
  CGPathAddLineToPoint(Mutable, 0, v20 + self->normVbottom.x * a4, v21 + self->normVbottom.y * a4);
  for (float i = v18; ; float i = v23 - self->sdelta)
  {
    double v23 = i;
    if (self->s0 > i) {
      break;
    }
    [(Polyline *)self->_bottom xyFromS:v23];
    CGPathAddLineToPoint(Mutable, 0, v24 + self->normVbottom.x * v19, v25 + self->normVbottom.y * v19);
  }
  CGPathCloseSubpath(Mutable);
  boundsPath = self->boundsPath;
  if (boundsPath) {
    CGPathRelease(boundsPath);
  }
  self->boundsPath = CGPathCreateCopy(Mutable);

  CGPathRelease(Mutable);
}

- (void)expandWithToleranceTop:(float)a3 bottom:(float)a4
{
  top = self->_top;
  [[(PolylinePair *)self top] s0];
  [(Polyline *)top xyFromS:v8 + 0.0000999999975];
  double v9 = a3;
  CGFloat v10 = self->normVtop.y * a3;
  double v12 = v11 + self->normVtop.x * a3;
  -[Polyline accomodatePoint:]([(PolylinePair *)self top], "accomodatePoint:", v12, v13 + v10);
  [[(PolylinePair *)self top] s0];
  *(float *)&double v14 = v14 + self->sdelta + 0.0000999999975;
  double v15 = *(float *)&v14;
  [[(PolylinePair *)self top] s1];
  if (v16 + self->sdelta + -0.0000999999975 > v15)
  {
    do
    {
      [(Polyline *)self->_top xyFromS:v15];
      double sdelta = self->sdelta;
      if (v17 - v12 >= sdelta * 0.1)
      {
        double v12 = v17 + self->normVtop.x * v9;
        -[Polyline accomodatePoint:]([(PolylinePair *)self top], "accomodatePoint:", v12, v18 + self->normVtop.y * v9);
        double sdelta = self->sdelta;
      }
      float v20 = v15 + sdelta;
      double v15 = v20;
      [[(PolylinePair *)self top] s1];
    }
    while (v21 + self->sdelta + -0.0000999999975 > v15);
  }
  float v22 = self->s1 + 0.0000999999975;
  bottom = self->_bottom;
  [(PolylinePair *)self s1];
  -[Polyline xyFromS:](bottom, "xyFromS:");
  double v24 = a4;
  CGFloat v25 = self->normVbottom.y * a4;
  -[Polyline accomodatePoint:]([(PolylinePair *)self bottom], "accomodatePoint:", v26 + self->normVbottom.x * a4, v27 + v25);
  for (double i = v22 - self->sdelta; ; double i = v30 - self->sdelta)
  {
    float v29 = i;
    double v30 = v29;
    [[(PolylinePair *)self bottom] s0];
    if (v31 > v30) {
      break;
    }
    [(Polyline *)self->_bottom xyFromS:v30];
    -[Polyline accomodatePoint:]([(PolylinePair *)self bottom], "accomodatePoint:", v32 + self->normVbottom.x * v24, v33 + self->normVbottom.y * v24);
  }
}

- (id)createTopBottomRegion
{
  [(PolylinePair *)self xyBoundsRect];
  double v7 = -[TopBottomRegion initWithSegments:boundsRect:]([TopBottomRegion alloc], "initWithSegments:boundsRect:", (int)(self->s1 - self->s0), v3, v4, v5, v6);
  [(Polyline *)self->_top xyFromS:self->s0 + 0.00100000005];
  *(float *)&double v8 = v8;
  *(float *)&double v9 = v9;
  [(TopBottomRegion *)v7 adjustForX:v8 Y:v9];
  double sdelta = self->sdelta;
  double s1 = self->s1;
  float v12 = self->s0 + sdelta + 0.00100000005;
  double v13 = v12;
  while (s1 + sdelta * 0.5 + 0.00100000005 >= v13)
  {
    [(Polyline *)self->_top xyFromS:v13];
    *(float *)&double v14 = v14;
    *(float *)&double v15 = v15;
    [(TopBottomRegion *)v7 adjustForX:v14 Y:v15];
    double sdelta = self->sdelta;
    float v16 = v13 + sdelta;
    double v13 = v16;
    double s1 = self->s1;
  }
  double v17 = s1 + 0.00100000005;
  [(Polyline *)self->_bottom xyFromS:s1 + 0.00100000005];
  *(float *)&double v18 = v18;
  *(float *)&double v19 = v19;
  [(TopBottomRegion *)v7 adjustForX:v18 Y:v19];
  for (float i = v17; ; float i = v21 - self->sdelta)
  {
    double v21 = i;
    if (self->s0 > i) {
      break;
    }
    [(Polyline *)self->_bottom xyFromS:v21];
    *(float *)&double v22 = v22;
    *(float *)&double v23 = v23;
    [(TopBottomRegion *)v7 adjustForX:v22 Y:v23];
  }

  return v7;
}

- (CGPoint)normVtop
{
  objc_copyStruct(v4, &self->normVtop, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setNormVtop:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->normVtop, &v3, 16, 1, 0);
}

- (CGPoint)normVbottom
{
  objc_copyStruct(v4, &self->normVbottom, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setNormVbottom:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->normVbottom, &v3, 16, 1, 0);
}

- (CGPoint)axisV
{
  objc_copyStruct(v4, &self->axisV, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setAxisV:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->axisV, &v3, 16, 1, 0);
}

- (CGPath)boundsPath
{
  return self->boundsPath;
}

- (double)s0
{
  return self->s0;
}

- (void)setS0:(double)a3
{
  self->s0 = a3;
}

- (double)s1
{
  return self->s1;
}

- (void)setS1:(double)a3
{
  self->double s1 = a3;
}

- (Polyline)top
{
  return (Polyline *)objc_getProperty(self, a2, 168, 1);
}

- (Polyline)bottom
{
  return (Polyline *)objc_getProperty(self, a2, 176, 1);
}

@end