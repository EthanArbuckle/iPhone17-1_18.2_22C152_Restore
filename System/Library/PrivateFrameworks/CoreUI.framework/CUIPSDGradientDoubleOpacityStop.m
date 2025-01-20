@interface CUIPSDGradientDoubleOpacityStop
+ (id)doubleOpacityStopWithLocation:(double)a3 leadInOpacity:(double)a4 leadOutOpacity:(double)a5;
+ (void)initialize;
- (BOOL)isDoubleStop;
- (CUIPSDGradientDoubleOpacityStop)initWithCoder:(id)a3;
- (CUIPSDGradientDoubleOpacityStop)initWithLocation:(double)a3 leadInOpacity:(double)a4 leadOutOpacity:(double)a5;
- (double)leadOutOpacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CUIPSDGradientDoubleOpacityStop

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (id)doubleOpacityStopWithLocation:(double)a3 leadInOpacity:(double)a4 leadOutOpacity:(double)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithLocation:a3 leadInOpacity:a4 leadOutOpacity:a5];
  return v5;
}

- (CUIPSDGradientDoubleOpacityStop)initWithLocation:(double)a3 leadInOpacity:(double)a4 leadOutOpacity:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  result = [(CUIPSDGradientOpacityStop *)&v7 initWithLocation:a3 opacity:a4];
  if (result) {
    result->leadOutOpacity = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  id result = [(CUIPSDGradientOpacityStop *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 3) = *(void *)&self->leadOutOpacity;
  }
  return result;
}

- (CUIPSDGradientDoubleOpacityStop)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  v4 = -[CUIPSDGradientOpacityStop initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      [a3 decodeDoubleForKey:@"CUIPSDGradientDoubleOpacityStopOpacity"];
    }
    else
    {
      double v7 = 0.0;
      [a3 decodeValueOfObjCType:"d" at:&v7 size:8];
      double v5 = v7;
    }
    v4->leadOutOpacity = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  -[CUIPSDGradientOpacityStop encodeWithCoder:](&v7, sel_encodeWithCoder_);
  double leadOutOpacity = self->leadOutOpacity;
  double v6 = leadOutOpacity;
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientDoubleOpacityStop version](CUIPSDGradientDoubleOpacityStop, "version"), @"CUIPSDGradientDoubleOpacityStopVersion");
    [a3 encodeDouble:@"CUIPSDGradientDoubleOpacityStopOpacity" forKey:leadOutOpacity];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:&v6];
  }
}

- (double)leadOutOpacity
{
  return self->leadOutOpacity;
}

- (BOOL)isDoubleStop
{
  return 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  return +[NSString stringWithFormat:@"%@ lead-out opacity: %f", [(CUIPSDGradientOpacityStop *)&v3 description], *(void *)&self->leadOutOpacity];
}

@end