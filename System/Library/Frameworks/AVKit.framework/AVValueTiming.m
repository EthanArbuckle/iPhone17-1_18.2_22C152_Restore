@interface AVValueTiming
+ (AVValueTiming)allocWithZone:(_NSZone *)a3;
+ (AVValueTiming)valueTimingWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5;
+ (BOOL)supportsSecureCoding;
+ (double)currentTimeStamp;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_timing;
- (AVValueTiming)initWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5;
- (AVValueTiming)initWithCoder:(id)a3;
- (AVValueTiming)initWithValueTiming:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToValueTiming:(id)a3;
- (Class)classForCoder;
- (double)anchorTimeStamp;
- (double)anchorValue;
- (double)currentValue;
- (double)rate;
- (double)timeStampForValue:(double)a3;
- (double)valueForTimeStamp:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVValueTiming

- (double)rate
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v4);
  return NAN;
}

- (double)anchorTimeStamp
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v4);
  return NAN;
}

- (double)anchorValue
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v4);
  return NAN;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_timing
{
  [(AVValueTiming *)self anchorValue];
  double v4 = v3;
  [(AVValueTiming *)self anchorTimeStamp];
  double v6 = v5;
  [(AVValueTiming *)self rate];
  double v8 = 0.0;
  if (v7 != 0.0)
  {
    double v4 = v6 - v4 / v7;
    double v8 = v7;
  }
  double v9 = v4;
  result.var1 = v8;
  result.var0 = v9;
  return result;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AVValueTiming *)self anchorValue];
  objc_msgSend(v4, "encodeDouble:forKey:", @"value");
  [(AVValueTiming *)self anchorTimeStamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"time stamp");
  [(AVValueTiming *)self rate];
  objc_msgSend(v4, "encodeDouble:forKey:", @"rate");
}

- (AVValueTiming)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"value"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"time stamp"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"rate"];
  double v10 = v9;

  return [(AVValueTiming *)self initWithAnchorValue:v6 anchorTimeStamp:v8 rate:v10];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[AVMutableValueTiming allocWithZone:a3];

  return [(AVValueTiming *)v4 initWithValueTiming:self];
}

+ (AVValueTiming)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (AVValueTiming *)+[AVValueTiming allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___AVValueTiming;
    return (AVValueTiming *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[AVValueTiming allocWithZone:a3];

  return [(AVValueTiming *)v4 initWithValueTiming:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AVValueTiming *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AVValueTiming *)self isEqualToValueTiming:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  [(AVValueTiming *)self _timing];
  return vcvtd_n_u64_f64(v2, 0x1EuLL) ^ vcvtd_n_u64_f64(v3, 8uLL);
}

- (AVValueTiming)initWithValueTiming:(id)a3
{
  id v4 = a3;
  [v4 anchorValue];
  double v6 = v5;
  [v4 anchorTimeStamp];
  double v8 = v7;
  [v4 rate];
  double v10 = v9;

  return [(AVValueTiming *)self initWithAnchorValue:v6 anchorTimeStamp:v8 rate:v10];
}

- (AVValueTiming)initWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5
{
  double v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  double v8 = NSStringFromSelector(a2);
  double v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  [v6 raise:v7, @"*** initialization method -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!", v8, v10 format];

  return 0;
}

- (BOOL)isEqualToValueTiming:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(AVValueTiming *)self _timing];
    double v6 = v5;
    double v8 = v7;
    [v4 _timing];
    BOOL v10 = v6 == v9;
    if (v8 != v11) {
      BOOL v10 = 0;
    }
    BOOL v12 = v10;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (double)timeStampForValue:(double)a3
{
  [(AVValueTiming *)self _timing];
  BOOL v5 = v4 == 0.0;
  double v7 = v6 + a3 / v4;
  double result = 0.0 / (a3 - v6);
  if (!v5) {
    return v7;
  }
  return result;
}

- (double)valueForTimeStamp:(double)a3
{
  [(AVValueTiming *)self _timing];
  if (v5 != 0.0) {
    return v5 * (a3 - result);
  }
  return result;
}

- (double)currentValue
{
  [(id)objc_opt_class() currentTimeStamp];

  -[AVValueTiming valueForTimeStamp:](self, "valueForTimeStamp:");
  return result;
}

+ (AVValueTiming)valueTimingWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5
{
  double v5 = (void *)[objc_alloc((Class)a1) initWithAnchorValue:a3 anchorTimeStamp:a4 rate:a5];

  return (AVValueTiming *)v5;
}

+ (double)currentTimeStamp
{
  double v2 = [MEMORY[0x1E4F28F80] processInfo];
  [v2 systemUptime];
  double v4 = v3;

  return v4;
}

@end