@interface TIGaussianErrorGenerator
- (CGPoint)globalBias;
- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4;
- (CGPoint)randomPointInDistribution;
- (CGPoint)randomPointWithStandardDeviationX:(float)a3 Y:(float)a4;
- (CGPoint)randomTargetForSpaceBarRect:(CGRect)a3;
- (TIGaussianErrorGenerator)initWithAttributes:(id)a3;
- (void)reset;
- (void)updateGlobalBias;
@end

@implementation TIGaussianErrorGenerator

- (TIGaussianErrorGenerator)initWithAttributes:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TIGaussianErrorGenerator;
  v5 = [(TIErrorGenerator *)&v24 initWithAttributes:v4];
  v6 = v5;
  if (v5)
  {
    v5->_perTouchStdevX = 0.0;
    v5->_perTouchStdevY = 0.0;
    v5->_globalStdevX = 0.0;
    v5->_globalStdevY = 0.0;
    v7 = [v4 valueForKey:@"GAUSSIAN_ERROR_STDDEV_X"];

    if (v7)
    {
      v8 = [v4 objectForKey:@"GAUSSIAN_ERROR_STDDEV_X"];
      [v8 floatValue];
      v6->_perTouchStdevX = v9;
    }
    v10 = [v4 valueForKey:@"GAUSSIAN_ERROR_STDDEV_Y"];

    if (v10)
    {
      v11 = [v4 objectForKey:@"GAUSSIAN_ERROR_STDDEV_Y"];
      [v11 floatValue];
      v6->_perTouchStdevY = v12;
    }
    v13 = [v4 valueForKey:@"SKEW_STDDEV_X"];

    if (v13)
    {
      v14 = [v4 valueForKey:@"SKEW_STDDEV_X"];
      [v14 floatValue];
      v6->_globalStdevX = v15;
    }
    v16 = [v4 valueForKey:@"SKEW_STDDEV_Y"];

    if (v16)
    {
      v17 = [v4 valueForKey:@"SKEW_STDDEV_Y"];
      [v17 floatValue];
      v6->_globalStdevY = v18;
    }
    v19 = [v4 valueForKey:@"SCALE_ERROR_UNITS_TO_POINTS"];

    if (v19)
    {
      v20 = [v4 valueForKey:@"SCALE_ERROR_UNITS_TO_POINTS"];
      [v20 floatValue];
      float v22 = v21;
    }
    else
    {
      float v22 = 6.4173;
    }
    v6->_perTouchStdevX = v22 * v6->_perTouchStdevX;
    v6->_perTouchStdevY = v22 * v6->_perTouchStdevY;
    v6->_globalStdevX = v22 * v6->_globalStdevX;
    v6->_globalStdevY = v22 * v6->_globalStdevY;
  }
  [(TIGaussianErrorGenerator *)v6 reset];

  return v6;
}

- (CGPoint)randomPointWithStandardDeviationX:(float)a3 Y:(float)a4
{
  do
  {
    [(TIErrorGenerator *)self uniformRandomNumber];
    float v8 = v7 * 2.0 + -1.0;
    [(TIErrorGenerator *)self uniformRandomNumber];
    float v10 = v9 * 2.0 + -1.0;
    float v11 = (float)(v10 * v10) + (float)(v8 * v8);
  }
  while (v11 > 1.0);
  float v12 = sqrtf((float)(logf((float)(v10 * v10) + (float)(v8 * v8)) * -2.0) / v11);
  double v13 = (float)((float)(v12 * v8) * a3);
  double v14 = (float)((float)(v12 * v10) * a4);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)randomPointInDistribution
{
  *(float *)&double v2 = self->_perTouchStdevX;
  *(float *)&double v3 = self->_perTouchStdevY;
  [(TIGaussianErrorGenerator *)self randomPointWithStandardDeviationX:v2 Y:v3];
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)updateGlobalBias
{
  *(float *)&double v2 = self->_globalStdevX;
  *(float *)&double v3 = self->_globalStdevY;
  if (*(float *)&v2 != 0.0 || *(float *)&v3 != 0.0)
  {
    *(float *)&double v2 = *(float *)&v2 * 0.2;
    *(float *)&double v3 = *(float *)&v3 * 0.2;
    [(TIGaussianErrorGenerator *)self randomPointWithStandardDeviationX:v2 Y:v3];
    double v6 = v5;
    double x = self->_globalBias.x;
    double y = self->_globalBias.y;
    double v10 = v9 + x;
    float globalStdevX = self->_globalStdevX;
    float v12 = 1.0;
    if (globalStdevX > 0.0)
    {
      float v13 = (x * x - v10 * v10) / (float)(globalStdevX * (float)(globalStdevX + globalStdevX));
      float v12 = expf(v13);
    }
    double v14 = v6 + y;
    float globalStdevY = self->_globalStdevY;
    if (globalStdevY > 0.0)
    {
      float v16 = (y * y - v14 * v14) / (float)(globalStdevY * (float)(globalStdevY + globalStdevY));
      float v12 = v12 * expf(v16);
    }
    if (v12 > 1.0) {
      float v12 = 1.0;
    }
    [(TIErrorGenerator *)self uniformRandomNumber];
    *(float *)&double v17 = v17;
    if (v12 > *(float *)&v17)
    {
      self->_globalBias.double x = v10;
      self->_globalBias.double y = v14;
    }
  }
}

- (CGPoint)randomTargetForSpaceBarRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)TIGaussianErrorGenerator;
  -[TIErrorGenerator persistentBiasForSpaceBarRect:](&v17, "persistentBiasForSpaceBarRect:");
  double v9 = v8;
  double v11 = v10;
  if ((char *)[(TIErrorGenerator *)self spaceHorizontalErrorMode] == (char *)&def_3B118 + 1)
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v12 = CGRectGetHeight(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGFloat v13 = CGRectGetWidth(v20) - v12;
    [(TIErrorGenerator *)self uniformRandomNumber];
    double v9 = v9 + v13 * -0.5 + v14 * v13;
  }
  double v15 = v9;
  double v16 = v11;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (CGPoint)globalBias
{
  CGFloat x = self->_globalBias.x;
  CGFloat y = self->_globalBias.y;
  [(TIGaussianErrorGenerator *)self updateGlobalBias];
  double v4 = x;
  double v5 = y;
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  *(float *)&double v10 = self->_perTouchStdevX;
  *(float *)&double v11 = self->_perTouchStdevY;
  [(TIGaussianErrorGenerator *)self randomPointWithStandardDeviationX:v10 Y:v11];
  double v13 = v12;
  double v15 = v14;
  if ([v9 isEqualToString:@" "]
    && (char *)[(TIErrorGenerator *)self spaceHorizontalErrorMode] == (char *)&def_3B118 + 1)
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v16 = CGRectGetHeight(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    double v17 = CGRectGetWidth(v23);
    [(TIErrorGenerator *)self uniformRandomNumber];
    double v13 = v13 + (v17 - v16) * -0.5 + v18 * (v17 - v16);
  }

  double v19 = v13;
  double v20 = v15;
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (void)reset
{
  v7.receiver = self;
  v7.super_class = (Class)TIGaussianErrorGenerator;
  [(TIErrorGenerator *)&v7 reset];
  *(float *)&double v3 = self->_globalStdevX;
  *(float *)&double v4 = self->_globalStdevY;
  [(TIGaussianErrorGenerator *)self randomPointWithStandardDeviationX:v3 Y:v4];
  self->_globalBias.CGFloat x = v5;
  self->_globalBias.CGFloat y = v6;
}

@end