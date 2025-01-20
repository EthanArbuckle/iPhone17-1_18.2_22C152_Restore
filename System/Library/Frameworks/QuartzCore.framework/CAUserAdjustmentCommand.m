@interface CAUserAdjustmentCommand
- (BOOL)transformWhitePointByXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5;
- (CAUserAdjustment)userAdjustment;
- (CAUserAdjustmentCommand)initWithUserAdjustment:(id)a3 autoLuminanceBoost:(float)a4;
- (double)maxLuminanceScale;
- (double)maxXDelta;
- (double)maxYDelta;
- (double)minLuminanceScale;
- (double)minXDelta;
- (double)minYDelta;
- (void)dealloc;
@end

@implementation CAUserAdjustmentCommand

- (CAUserAdjustment)userAdjustment
{
  return self->_userAdjustment;
}

- (double)maxLuminanceScale
{
  return self->_maxLuminanceScale;
}

- (double)minLuminanceScale
{
  return self->_minLuminanceScale;
}

- (double)maxYDelta
{
  return self->_maxYDelta;
}

- (double)minYDelta
{
  return self->_minYDelta;
}

- (double)maxXDelta
{
  return self->_maxXDelta;
}

- (double)minXDelta
{
  return self->_minXDelta;
}

- (BOOL)transformWhitePointByXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5
{
  [(CAUserAdjustment *)self->_userAdjustment xDelta];
  double v10 = v9 + a3;
  if (v10 >= self->_minXDelta + -0.000001
    && v10 <= self->_maxXDelta + 0.000001
    && ([(CAUserAdjustment *)self->_userAdjustment yDelta], double v12 = v11 + a4, v12 >= self->_minYDelta + -0.000001)
    && v12 <= self->_maxYDelta + 0.000001
    && ([(CAUserAdjustment *)self->_userAdjustment luminanceScale],
        double v14 = v13 * a5,
        v14 <= self->_maxLuminanceScale + 0.000001))
  {
    v15 = [[CAUserAdjustment alloc] initWithXDelta:v10 yDelta:v12 luminanceScale:v14];
    if (v15)
    {
      v16 = v15;

      self->_userAdjustment = v16;
      LOBYTE(v15) = 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return (char)v15;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAUserAdjustmentCommand;
  [(CAUserAdjustmentCommand *)&v3 dealloc];
}

- (CAUserAdjustmentCommand)initWithUserAdjustment:(id)a3 autoLuminanceBoost:(float)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CAUserAdjustmentCommand;
  v6 = [(CAUserAdjustmentCommand *)&v11 init];
  v7 = (CAUserAdjustmentCommand *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_1849983C0;
    *(_OWORD *)(v6 + 24) = xmmword_1849983C0;
    *((void *)v6 + 5) = 0x3FED70A3D70A3D71;
    float v8 = 1.128 / a4;
    if ((float)(1.128 / a4) > 1.08) {
      float v8 = 1.08;
    }
    *((double *)v6 + 6) = v8;
    if (a3) {
      double v9 = (CAUserAdjustment *)a3;
    }
    else {
      double v9 = [[CAUserAdjustment alloc] initWithXDelta:0.0 yDelta:0.0 luminanceScale:1.0];
    }
    v7->_userAdjustment = v9;
  }
  return v7;
}

@end