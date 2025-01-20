@interface ADRansacLineResult
- (ADRansacLineResult)initWithSlope:(float)a3 intercept:(float)a4;
- (float)intercept;
- (float)slope;
- (void)setIntercept:(float)a3;
- (void)setSlope:(float)a3;
@end

@implementation ADRansacLineResult

- (void)setIntercept:(float)a3
{
  self->_intercept = a3;
}

- (float)intercept
{
  return self->_intercept;
}

- (void)setSlope:(float)a3
{
  self->_slope = a3;
}

- (float)slope
{
  return self->_slope;
}

- (ADRansacLineResult)initWithSlope:(float)a3 intercept:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ADRansacLineResult;
  result = [(ADRansacLineResult *)&v7 init];
  if (result)
  {
    result->_slope = a3;
    result->_intercept = a4;
  }
  return result;
}

@end