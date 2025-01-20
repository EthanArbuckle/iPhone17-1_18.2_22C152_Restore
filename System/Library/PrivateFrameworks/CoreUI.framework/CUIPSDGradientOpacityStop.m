@interface CUIPSDGradientOpacityStop
+ (id)opacityStopWithLocation:(double)a3 opacity:(double)a4;
+ (void)initialize;
- (BOOL)isOpacityStop;
- (CUIPSDGradientOpacityStop)initWithCoder:(id)a3;
- (CUIPSDGradientOpacityStop)initWithLocation:(double)a3 opacity:(double)a4;
- (double)opacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CUIPSDGradientOpacityStop

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (id)opacityStopWithLocation:(double)a3 opacity:(double)a4
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithLocation:a3 opacity:a4];
  return v4;
}

- (CUIPSDGradientOpacityStop)initWithLocation:(double)a3 opacity:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientOpacityStop;
  result = [(CUIPSDGradientStop *)&v6 initWithLocation:a3];
  if (result) {
    result->opacity = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDGradientOpacityStop;
  id result = [(CUIPSDGradientStop *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 2) = *(void *)&self->opacity;
  }
  return result;
}

- (CUIPSDGradientOpacityStop)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDGradientOpacityStop;
  id v4 = -[CUIPSDGradientStop initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      [a3 decodeDoubleForKey:@"CUIPSDGradientOpacityStopOpacity"];
    }
    else
    {
      double v7 = 0.0;
      [a3 decodeValueOfObjCType:"d" at:&v7 size:8];
      double v5 = v7;
    }
    v4->opacity = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CUIPSDGradientOpacityStop;
  -[CUIPSDGradientStop encodeWithCoder:](&v7, sel_encodeWithCoder_);
  double opacity = self->opacity;
  double v6 = opacity;
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientOpacityStop version](CUIPSDGradientOpacityStop, "version"), @"CUIPSDGradientOpacityStopVersion");
    [a3 encodeDouble:@"CUIPSDGradientOpacityStopOpacity" forKey:opacity];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:&v6];
  }
}

- (double)opacity
{
  return self->opacity;
}

- (BOOL)isOpacityStop
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientOpacityStop;
  id v3 = [(CUIPSDGradientOpacityStop *)&v6 description];
  [(CUIPSDGradientStop *)self location];
  return +[NSString stringWithFormat:@"%@ - location: %f opacity: %f", v3, v4, *(void *)&self->opacity];
}

@end