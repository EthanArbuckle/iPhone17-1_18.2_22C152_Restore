@interface AVZoomRange
+ (AVZoomRange)zoomRangeWithMinZoomFactor:(double)a3 maxZoomFactor:(double)a4;
- (AVZoomRange)initWithMinZoomFactor:(double)a3 maxZoomFactor:(double)a4;
- (BOOL)containsZoomFactor:(double)a3;
- (BOOL)isEqual:(id)a3;
- (double)maxZoomFactor;
- (double)minZoomFactor;
- (id)description;
@end

@implementation AVZoomRange

+ (AVZoomRange)zoomRangeWithMinZoomFactor:(double)a3 maxZoomFactor:(double)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMinZoomFactor:a3 maxZoomFactor:a4];

  return (AVZoomRange *)v4;
}

- (AVZoomRange)initWithMinZoomFactor:(double)a3 maxZoomFactor:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVZoomRange;
  result = [(AVZoomRange *)&v7 init];
  if (result)
  {
    result->_minZoomFactor = a3;
    result->_maxZoomFactor = a4;
  }
  return result;
}

- (double)minZoomFactor
{
  return self->_minZoomFactor;
}

- (BOOL)containsZoomFactor:(double)a3
{
  return self->_minZoomFactor <= a3 && self->_maxZoomFactor >= a3;
}

- (double)maxZoomFactor
{
  return self->_maxZoomFactor;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %.2f - %.2f>", NSStringFromClass(v4), self, *(void *)&self->_minZoomFactor, *(void *)&self->_maxZoomFactor];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      double minZoomFactor = self->_minZoomFactor;
      [a3 minZoomFactor];
      if (minZoomFactor == v7)
      {
        double maxZoomFactor = self->_maxZoomFactor;
        [a3 maxZoomFactor];
        LOBYTE(v5) = maxZoomFactor == v9;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

@end