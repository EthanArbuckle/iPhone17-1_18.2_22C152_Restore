@interface CUIPSDGradientStop
+ (void)initialize;
- (BOOL)isColorStop;
- (BOOL)isDoubleStop;
- (BOOL)isOpacityStop;
- (CUIPSDGradientStop)initWithCoder:(id)a3;
- (CUIPSDGradientStop)initWithLocation:(double)a3;
- (double)location;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(double)a3;
@end

@implementation CUIPSDGradientStop

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (CUIPSDGradientStop)initWithLocation:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradientStop;
  v5 = [(CUIPSDGradientStop *)&v10 init];
  v6 = v5;
  if (v5)
  {
    double v7 = 0.0;
    if (fabs(a3) >= 0.00001)
    {
      double v7 = a3;
      if (fabs(a3 + -1.0) < 0.00001) {
        double v7 = 1.0;
      }
    }
    v5->location = v7;
    if (v7 < 0.0 || v7 > 1.0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v5 file:@"CUIPSDGradientEvaluator.m" lineNumber:46 description:@"Location for CUIPSDGradientStop must be in the closed unit interval."];
    }
  }
  return v6;
}

- (CUIPSDGradientStop)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDGradientStop;
  v4 = [(CUIPSDGradientStop *)&v8 init];
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      [a3 decodeDoubleForKey:@"CUIPSDGradientStopLocation"];
    }
    else
    {
      double v7 = 0.0;
      [a3 decodeValueOfObjCType:"d" at:&v7 size:8];
      double v5 = v7;
    }
    v4->location = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double location = self->location;
  double v5 = location;
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientStop version](CUIPSDGradientStop, "version"), @"CUIPSDGradientStopVersion");
    [a3 encodeDouble:@"CUIPSDGradientStopLocation" forKey:location];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:&v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result) {
    *((void *)result + 1) = *(void *)&self->location;
  }
  return result;
}

- (double)location
{
  return self->location;
}

- (void)setLocation:(double)a3
{
  self->double location = a3;
}

- (BOOL)isDoubleStop
{
  return 0;
}

- (BOOL)isColorStop
{
  return 0;
}

- (BOOL)isOpacityStop
{
  return 0;
}

@end