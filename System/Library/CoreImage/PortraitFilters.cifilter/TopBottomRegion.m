@interface TopBottomRegion
- ($D9ACD5A945031E604089763E4FBE0988)boundsRect;
- (BOOL)containsPointX:(float)a3 Y:(float)a4;
- (BOOL)isempty;
- (TopBottomRegion)initWithSegments:(int)a3 boundsRect:(CGRect)a4;
- (float)bottom;
- (float)length;
- (float)top;
- (float)xmax;
- (float)xmin;
- (void)adjustForX:(float)a3 Y:(float)a4;
- (void)dealloc;
- (void)lowerBottomBy:(float)a3;
- (void)printSummary;
- (void)raiseTopBy:(float)a3;
- (void)setIsempty:(BOOL)a3;
- (void)setLength:(float)a3;
- (void)setXmax:(float)a3;
- (void)setXmin:(float)a3;
- (void)smoothWithSize:(int)a3;
@end

@implementation TopBottomRegion

- (TopBottomRegion)initWithSegments:(int)a3 boundsRect:(CGRect)a4
{
  double width = a4.size.width;
  double x = a4.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)TopBottomRegion;
  v7 = [(TopBottomRegion *)&v15 init];
  v7->int nsegs = a3;
  float v8 = x;
  float v9 = x + width;
  v7->float xmin = v8;
  v7->xmadouble x = v9;
  v7->topData = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:4 * v7->nsegs];
  v7->bottomData = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:4 * v7->nsegs];
  v7->seglength = 1.0;
  int nsegs = v7->nsegs;
  float v11 = 1.0;
  if (nsegs >= 1)
  {
    float xmin = v7->xmin;
    xmadouble x = v7->xmax;
    if (xmax > xmin)
    {
      float v11 = (float)(xmax - xmin) / (float)nsegs;
      v7->seglength = v11;
    }
  }
  v7->ss = v11;
  v7->isempty = 1;
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TopBottomRegion;
  [(TopBottomRegion *)&v3 dealloc];
}

- (float)top
{
  return (float *)[(NSMutableData *)self->topData mutableBytes];
}

- (float)bottom
{
  return (float *)[(NSMutableData *)self->topData mutableBytes];
}

- (void)smoothWithSize:(int)a3
{
  v18 = objc_alloc_init(Rgon);
  v4 = [(TopBottomRegion *)self top];
  v5 = [(TopBottomRegion *)self bottom];
  float v8 = v5;
  int xdatamin = self->xdatamin;
  LODWORD(xdatamax) = self->xdatamax;
  if (xdatamin <= (int)xdatamax)
  {
    uint64_t v11 = xdatamin;
    do
    {
      *(float *)&double v7 = v8[v11];
      *(float *)&double v6 = (float)(int)v11;
      [(Rgon *)v18 AdjustForPointX:v6 Y:v7];
      *(float *)&double v12 = v4[v11];
      *(float *)&double v13 = (float)(int)v11;
      v5 = (float *)[(Rgon *)v18 AdjustForPointX:v13 Y:v12];
      xdatamadouble x = self->xdatamax;
    }
    while (v11++ < xdatamax);
    int xdatamin = self->xdatamin;
  }
  objc_super v15 = v18;
  if (xdatamin < (int)xdatamax)
  {
    uint64_t v16 = xdatamin;
    do
    {
      float v17 = (float)(v8[v16] + v4[v16]) * 0.5;
      *(float *)&double v6 = (float)(int)v16;
      *(float *)&double v7 = v17;
      v5 = (float *)[(Rgon *)v15 containsPointX:v6 Y:v7];
      if (v5)
      {
        objc_super v15 = v18;
        do
        {
          float v17 = v17 + 1.0;
          *(float *)&double v6 = (float)(int)v16;
          *(float *)&double v7 = v17;
          v5 = (float *)[(Rgon *)v15 containsPointX:v6 Y:v7];
          objc_super v15 = v18;
        }
        while (v5);
      }
      else
      {
        objc_super v15 = v18;
      }
      v4[v16++] = v17;
    }
    while (v16 < self->xdatamax);
  }

  _objc_release_x1(v5, v15);
}

- (void)raiseTopBy:(float)a3
{
  v5 = [(TopBottomRegion *)self top];
  xdatamadouble x = self->xdatamax;
  uint64_t xdatamin = self->xdatamin;
  if ((int)xdatamin <= xdatamax)
  {
    float v8 = &v5[xdatamin];
    int v9 = xdatamax - xdatamin + 1;
    do
    {
      *float v8 = *v8 + a3;
      ++v8;
      --v9;
    }
    while (v9);
  }
}

- (void)lowerBottomBy:(float)a3
{
  v5 = [(TopBottomRegion *)self bottom];
  xdatamadouble x = self->xdatamax;
  uint64_t xdatamin = self->xdatamin;
  if ((int)xdatamin <= xdatamax)
  {
    float v8 = &v5[xdatamin];
    int v9 = xdatamax - xdatamin + 1;
    do
    {
      float v10 = *v8 - a3;
      if (v10 < 0.0) {
        float v10 = 0.0;
      }
      *v8++ = v10;
      --v9;
    }
    while (v9);
  }
}

- (BOOL)containsPointX:(float)a3 Y:(float)a4
{
  double v7 = [(TopBottomRegion *)self top];
  float v8 = [(TopBottomRegion *)self bottom];
  int v9 = (int)(float)((float)(a3 - self->xmin) / self->seglength);
  return v8[v9] < a4 && v7[v9] > a4;
}

- (void)adjustForX:(float)a3 Y:(float)a4
{
  int v6 = (int)(float)((float)(a3 - self->xmin) / self->seglength);
  double v7 = [(TopBottomRegion *)self top];
  float v8 = [(TopBottomRegion *)self bottom];
  if ([(TopBottomRegion *)self isempty])
  {
    uint64_t nsegs = self->nsegs;
    if ((int)nsegs >= 1)
    {
      do
      {
        *v8++ = a4;
        *v7++ = a4;
        --nsegs;
      }
      while (nsegs);
    }
    self->uint64_t xdatamin = v6;
    self->xdatamadouble x = v6;
    [(TopBottomRegion *)self setIsempty:0];
  }
  else
  {
    if (v7[v6] < a4) {
      v7[v6] = a4;
    }
    if (v8[v6] > a4) {
      v8[v6] = a4;
    }
    if (self->xdatamin > v6) {
      self->uint64_t xdatamin = v6;
    }
    if (self->xdatamax < v6) {
      self->xdatamadouble x = v6;
    }
  }
}

- ($D9ACD5A945031E604089763E4FBE0988)boundsRect
{
  objc_super v3 = [(TopBottomRegion *)self top];
  v4 = [(TopBottomRegion *)self bottom];
  double xmin = self->xmin;
  xmadouble x = self->xmax;
  double v7 = v4[self->xdatamin];
  double v8 = v3[self->xdatamax];
  result.var1.y = v8;
  result.var1.double x = xmax;
  result.var0.y = v7;
  result.var0.double x = xmin;
  return result;
}

- (void)printSummary
{
  objc_super v3 = [(TopBottomRegion *)self top];
  v4 = [(TopBottomRegion *)self bottom];
  puts("topbottom region summary");
  printf("xmin, xmax, ymin, ymax {%f, %f}, {%f, %f} \n", self->xmin, self->xmax, v4[self->xdatamin], v3[self->xdatamax]);
}

- (float)xmin
{
  return self->xmin;
}

- (void)setXmin:(float)a3
{
  self->double xmin = a3;
}

- (float)xmax
{
  return self->xmax;
}

- (void)setXmax:(float)a3
{
  self->xmadouble x = a3;
}

- (float)length
{
  return self->length;
}

- (void)setLength:(float)a3
{
  self->length = a3;
}

- (BOOL)isempty
{
  return self->isempty;
}

- (void)setIsempty:(BOOL)a3
{
  self->isempty = a3;
}

@end