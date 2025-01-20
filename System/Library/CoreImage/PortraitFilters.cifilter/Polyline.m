@interface Polyline
- (BOOL)liesAbovePointX:(float)a3 Y:(float)a4;
- (BOOL)liesBelowPointX:(float)a3 Y:(float)a4;
- (CGPath)boundsPath;
- (CGPoint)axisV;
- (CGPoint)normV;
- (CGPoint)xyFromS2:(float)a3;
- (CGPoint)xyFromS:(double)a3;
- (CGRect)xyBoundsRect;
- (Polyline)initWithMaxsize:(float)a3 segmentDelta:(float)a4 andAxis:(CGPoint)a5;
- (double)s0;
- (double)s1;
- (double)seglength;
- (float)yy;
- (unsigned)nsegs;
- (void)accomodatePoint:(CGPoint)a3;
- (void)bridgeGapsLinear;
- (void)bridgeGapsMinimum;
- (void)constructBezierWithToleranceOutside:(float)a3 andInside:(float)a4;
- (void)dealloc;
- (void)lengthenStart:(float)a3 end:(float)a4;
- (void)printBounds;
- (void)printPoints;
- (void)printRect;
- (void)setAxisV:(CGPoint)a3;
- (void)setNormV:(CGPoint)a3;
- (void)setNsegs:(unsigned int)a3;
- (void)setS0:(double)a3;
- (void)setS1:(double)a3;
- (void)setSeglength:(double)a3;
- (void)setXyBoundsRect:(CGRect)a3;
@end

@implementation Polyline

- (Polyline)initWithMaxsize:(float)a3 segmentDelta:(float)a4 andAxis:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  v17.receiver = self;
  v17.super_class = (Class)Polyline;
  v9 = [(Polyline *)&v17 init];
  v10 = v9;
  v9->maxsize = a3;
  v9->sdelta = a4;
  double v11 = ceil((float)(a3 / a4) + 0.001);
  if (v11 < 1.0) {
    double v11 = 1.0;
  }
  v9->nsegs = v11;
  v9->yyData = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:4 * v9->nsegs];
  float v12 = sqrt(y * y + x * x);
  double v13 = v12;
  double v14 = 0.0;
  double v15 = 0.0;
  if (v13 >= 0.01)
  {
    double v14 = x / v13;
    double v15 = y / v13;
  }
  v10->axisV.double x = v14;
  v10->axisV.double y = v15;
  v10->normV.double x = -v15;
  v10->normV.double y = v14;
  v10->s0 = v10->maxsize;
  v10->s1 = 0.0;
  v10->ymadouble x = 0.0;
  v10->xmadouble x = 0.0;
  v10->ymin = a3;
  v10->xmin = a3;
  return v10;
}

- (void)dealloc
{
  boundsPath = self->boundsPath;
  if (boundsPath) {
    CGPathRelease(boundsPath);
  }

  self->yyData = 0;
  v4.receiver = self;
  v4.super_class = (Class)Polyline;
  [(Polyline *)&v4 dealloc];
}

- (float)yy
{
  return (float *)[(NSMutableData *)self->yyData mutableBytes];
}

- (void)accomodatePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  float v6 = a3.y * self->axisV.y + a3.x * self->axisV.x;
  float v7 = a3.y * self->normV.y + x * self->normV.x;
  if (v6 <= 0.0) {
    float v6 = 0.0;
  }
  double sdelta = self->sdelta;
  int v9 = (int)(v6 / sdelta + 0.001);
  unsigned int v10 = self->nsegs - 1;
  BOOL v11 = (int)v10 < v9;
  if (v10 >= v9) {
    unsigned int v10 = (int)(v6 / sdelta + 0.001);
  }
  if (v11) {
    int v12 = v10;
  }
  else {
    int v12 = (int)(v6 / sdelta + 0.001);
  }
  double v13 = sdelta * (double)v12;
  double v14 = [(Polyline *)self yy];
  float v15 = v14[v12];
  if (v15 == 0.0) {
    float v15 = v7;
  }
  if (v15 <= v7) {
    float v15 = v7;
  }
  v14[v12] = v15;
  if (v13 < self->s0) {
    self->s0 = v13;
  }
  if (v13 > self->s1) {
    self->s1 = v13;
  }
  float xmin = self->xmin;
  if (x < xmin)
  {
    float xmin = x;
    self->float xmin = xmin;
  }
  xmadouble x = self->xmax;
  if (x > xmax)
  {
    xmadouble x = x;
    self->xmadouble x = xmax;
  }
  float ymin = self->ymin;
  if (y < ymin)
  {
    float ymin = y;
    self->float ymin = ymin;
  }
  ymadouble x = self->ymax;
  if (y > ymax)
  {
    ymadouble x = y;
    self->ymadouble x = ymax;
  }
  self->xyBoundsRect.origin.double x = xmin;
  self->xyBoundsRect.origin.double y = ymin;
  self->xyBoundsRect.size.width = (float)(xmax - xmin);
  self->xyBoundsRect.size.height = (float)(ymax - ymin);
}

- (BOOL)liesAbovePointX:(float)a3 Y:(float)a4
{
  return 1;
}

- (BOOL)liesBelowPointX:(float)a3 Y:(float)a4
{
  return 1;
}

- (void)printPoints
{
  puts("\nPolyline points");
  unsigned int v3 = (self->s0 / self->sdelta);
  objc_super v4 = [(Polyline *)self yy];
  printf("list001 = { {%f,%f}", self->sdelta * (double)v3, v4[v3]);
  double sdelta = self->sdelta;
  for (double i = self->s0 + sdelta; i <= self->s1 + 0.001; double i = i + sdelta)
  {
    printf(",{%f,%f}", sdelta * (double)(i / sdelta), v4[(i / sdelta)]);
    double sdelta = self->sdelta;
  }

  printf(" };\n Show[ g01 = Graphics[{ Line[list001], Hue[.4], AbsolutePointSize[5], Map[Point, list001]}]] ");
}

- (void)printBounds
{
  puts("\nPolyline bounds");
  printf("s  %f , %f, x and y {%f,%f },{%f, %f} ", self->s0, self->s1, self->xmin, self->xmax, self->ymin, self->ymax);

  putchar(10);
}

- (void)printRect
{
  float x = self->xyBoundsRect.origin.x;
  float y = self->xyBoundsRect.origin.y;
  double v4 = x;
  float v5 = self->xyBoundsRect.size.width + x;
  double v6 = y;
  float v7 = self->xyBoundsRect.size.height + y;
  puts("\n bounds Rect (polyline printRect)");
  printf("Line[{{%f,%f},{%f,%f},{%f,%f},{%f,%f},{%f,%f}}] ", v4, v6, v5, v6, v5, v7, v4, v7, v4, v6);

  putchar(10);
}

- (void)bridgeGapsLinear
{
  unsigned int v3 = [(Polyline *)self yy];
  double s1 = self->s1;
  float v5 = self->s0 + 0.0000999999975;
  double v6 = v5;
  if (s1 >= v5)
  {
    double sdelta = self->sdelta;
    unsigned int nsegs = self->nsegs;
    do
    {
      signed int v9 = (v6 / sdelta + 0.0000999999975);
      if (nsegs > v9)
      {
        if (v3[v9] == 0.0)
        {
          unsigned int v10 = &v3[v9 + 1];
          char v11 = 1;
          int v12 = (v6 / sdelta + 0.0000999999975);
          while (1)
          {
            if (sdelta * (double)v12 > s1)
            {
              char v13 = v11;
              goto LABEL_12;
            }
            if (nsegs <= ++v12) {
              break;
            }
            char v11 = 0;
            char v13 = 0;
            float v14 = *v10++;
            if (v14 != 0.0) {
              goto LABEL_12;
            }
          }
          int v12 = nsegs;
        }
        else
        {
          char v13 = 1;
          int v12 = (v6 / sdelta + 0.0000999999975);
LABEL_12:
          if (v13) {
            goto LABEL_19;
          }
        }
        unsigned int v15 = v12 - v9;
        v16 = &v3[v9];
        if (*v16 == 0.0)
        {
          uint64_t v17 = 0;
          float v18 = v3[v9 - 1];
          float v20 = v3[v12] - v18;
          do
          {
            v21 = &v16[v17++];
            float v19 = 1.0 / (double)(v15 + 1);
            float *v21 = v18 + (float)((float)(v19 * (float)v17) * v20);
          }
          while (v21[1] == 0.0);
        }
        float v5 = v6 + (double)v15 * sdelta;
      }
LABEL_19:
      float v5 = sdelta + v5;
      double v6 = v5;
    }
    while (s1 >= v5);
  }
}

- (void)bridgeGapsMinimum
{
  unsigned int v3 = [(Polyline *)self yy];
  double sdelta = self->sdelta;
  double s1 = self->s1;
  float v6 = self->s0 + sdelta;
  for (double i = v6; s1 > i; double i = v13)
  {
    signed int v8 = (i / sdelta);
    if (v3[v8] == 0.0)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (v8 - 1);
      char v11 = &v3[v9 + 1];
      do
      {
        *(v11 - 1) = v3[v10];
        float v12 = *v11++;
      }
      while (v12 == 0.0);
    }
    float v13 = sdelta + i;
  }
}

- (CGPoint)xyFromS:(double)a3
{
  float v5 = [(Polyline *)self yy];
  double v6 = 0.0;
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  double sdelta = self->sdelta;
  unsigned int v8 = (v6 / sdelta);
  if (self->nsegs - 1 < v8) {
    unsigned int v8 = self->nsegs - 1;
  }
  float v9 = sdelta * (double)v8;
  float64x2_t v10 = vaddq_f64(vmulq_n_f64((float64x2_t)self->normV, v5[v8]), vmulq_n_f64((float64x2_t)self->axisV, v9));
  double v11 = v10.f64[1];
  result.float x = v10.f64[0];
  result.float y = v11;
  return result;
}

- (CGPoint)xyFromS2:(float)a3
{
  float v5 = [(Polyline *)self yy];
  double sdelta = self->sdelta;
  unsigned int v7 = (a3 / sdelta);
  if (self->nsegs - 1 < v7) {
    unsigned int v7 = self->nsegs - 1;
  }
  float v8 = sdelta * (double)v7;
  float v9 = self->axisV.x * v8;
  float y = self->normV.y;
  float v11 = v5[v7] - v9;
  double v12 = v9;
  double v13 = (float)(v11 / y);
  result.float y = v13;
  result.float x = v12;
  return result;
}

- (void)lengthenStart:(float)a3 end:(float)a4
{
  [(Polyline *)self xyFromS:self->s0];
  double v7 = v6;
  double v9 = v8;
  [(Polyline *)self xyFromS:self->s0 + self->sdelta];
  double v11 = v7 - v10;
  double v13 = v9 - v12;
  float v14 = sqrt(v13 * v13 + v11 * v11);
  double v15 = v14;
  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  if (v15 >= 0.01)
  {
    double v17 = v11 / v15;
    double v18 = v13 / v15;
  }
  double v19 = a3;
  double v20 = v18 * a3;
  double v21 = v7 + v17 * a3;
  -[Polyline accomodatePoint:](self, "accomodatePoint:", v21, v9 + v20);
  [(Polyline *)self setS0:v21];
  [(Polyline *)self xyFromS:self->s1 - self->sdelta];
  double v23 = v22;
  double v25 = v24;
  [(Polyline *)self xyFromS:self->s1];
  double v28 = v26 - v23;
  double v29 = v27 - v25;
  float v30 = sqrt(v29 * v29 + v28 * v28);
  double v31 = v30;
  BOOL v32 = v30 < 0.01;
  double v33 = 0.0;
  if (!v32)
  {
    double v16 = v28 / v31;
    double v33 = v29 / v31;
  }
  double v34 = v26 + v16 * v19;
  -[Polyline accomodatePoint:](self, "accomodatePoint:", v34, v27 + v33 * v19);
  float v35 = v34;
  [(Polyline *)self setS1:self->sdelta * (double)(int)(v35 / self->sdelta + 0.001)];

  [(Polyline *)self bridgeGapsLinear];
}

- (void)constructBezierWithToleranceOutside:(float)a3 andInside:(float)a4
{
  [(Polyline *)self xyFromS:self->s0];
  double v7 = a3;
  CGFloat v8 = self->normV.y * a3;
  double v10 = v9 + self->normV.x * a3;
  double v12 = v11 + v8;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v10, v12);
  double sdelta = self->sdelta;
  double s1 = self->s1;
  float v16 = self->s0 + sdelta;
  double v17 = v16;
  while (s1 + sdelta > v17)
  {
    [(Polyline *)self xyFromS:v17];
    CGPathAddLineToPoint(Mutable, 0, v18 + self->normV.x * v7, v19 + self->normV.y * v7);
    double sdelta = self->sdelta;
    float v20 = v17 + sdelta;
    double v17 = v20;
    double s1 = self->s1;
  }
  [(Polyline *)self xyFromS:s1 + 0.00100000005];
  double v22 = v21;
  double v24 = v23;
  [(Polyline *)self xyFromS:self->s1 - self->sdelta];
  double v26 = v22 - v25;
  double v28 = v24 - v27;
  *(float *)&double v25 = sqrt(v28 * v28 + v26 * v26);
  double v29 = *(float *)&v25;
  double v30 = 0.0;
  double v31 = 0.0;
  if (v29 >= 0.01)
  {
    double v30 = v26 / v29;
    double v31 = v28 / v29;
  }
  float v32 = self->sdelta * 3.0;
  double v33 = (float)-a4;
  CGPathAddQuadCurveToPoint(Mutable, 0, v22 + v30 * v32, v24 + v31 * v32, v22 + self->normV.x * v33, v24 + self->normV.y * v33);
  double s0 = self->s0;
  float v35 = self->s1;
  double v36 = v35;
  double v37 = self->sdelta;
  while (s0 + v37 < v36)
  {
    [(Polyline *)self xyFromS:v36];
    if (v39 != 0.0) {
      CGPathAddLineToPoint(Mutable, 0, v38 + self->normV.x * v33, v39 + self->normV.y * v33);
    }
    double v37 = self->sdelta;
    float v40 = v36 - v37;
    double v36 = v40;
    double s0 = self->s0;
  }
  -[Polyline xyFromS:](self, "xyFromS:");
  double v42 = v41;
  double v44 = v43;
  [(Polyline *)self xyFromS:self->s0 + self->sdelta];
  double v46 = v42 - v45;
  double v48 = v44 - v47;
  *(float *)&double v45 = sqrt(v48 * v48 + v46 * v46);
  double v49 = *(float *)&v45;
  double v50 = 0.0;
  double v51 = 0.0;
  if (v49 >= 0.01)
  {
    double v50 = v46 / v49;
    double v51 = v48 / v49;
  }
  float v52 = self->sdelta * 3.0;
  CGPathAddQuadCurveToPoint(Mutable, 0, v42 + v50 * v52, v44 + v51 * v52, v10, v12);
  CGPathCloseSubpath(Mutable);
  boundsPath = self->boundsPath;
  if (boundsPath) {
    CGPathRelease(boundsPath);
  }
  self->boundsPath = CGPathCreateCopy(Mutable);

  CGPathRelease(Mutable);
}

- (double)s0
{
  return self->s0;
}

- (void)setS0:(double)a3
{
  self->double s0 = a3;
}

- (double)s1
{
  return self->s1;
}

- (void)setS1:(double)a3
{
  self->double s1 = a3;
}

- (double)seglength
{
  return self->seglength;
}

- (void)setSeglength:(double)a3
{
  self->seglength = a3;
}

- (unsigned)nsegs
{
  return self->nsegs;
}

- (void)setNsegs:(unsigned int)a3
{
  self->unsigned int nsegs = a3;
}

- (CGPoint)axisV
{
  objc_copyStruct(v4, &self->axisV, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.float y = v3;
  result.float x = v2;
  return result;
}

- (void)setAxisV:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->axisV, &v3, 16, 1, 0);
}

- (CGPoint)normV
{
  objc_copyStruct(v4, &self->normV, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.float y = v3;
  result.float x = v2;
  return result;
}

- (void)setNormV:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->normV, &v3, 16, 1, 0);
}

- (CGRect)xyBoundsRect
{
  objc_copyStruct(v6, &self->xyBoundsRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.float y = v3;
  result.origin.float x = v2;
  return result;
}

- (void)setXyBoundsRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->xyBoundsRect, &v3, 32, 1, 0);
}

- (CGPath)boundsPath
{
  return self->boundsPath;
}

@end