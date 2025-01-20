@interface SKRange
+ (BOOL)supportsSecureCoding;
+ (SKRange)rangeWithConstantValue:(CGFloat)value;
+ (SKRange)rangeWithLowerLimit:(CGFloat)lower;
+ (SKRange)rangeWithLowerLimit:(CGFloat)lower upperLimit:(CGFloat)upper;
+ (SKRange)rangeWithNoLimits;
+ (SKRange)rangeWithUpperLimit:(CGFloat)upper;
+ (SKRange)rangeWithValue:(CGFloat)value variance:(CGFloat)variance;
- (BOOL)isEqualToRange:(id)a3;
- (CGFloat)lowerLimit;
- (CGFloat)upperLimit;
- (SKRange)init;
- (SKRange)initWithCoder:(id)a3;
- (SKRange)initWithLowerLimit:(CGFloat)lower upperLimit:(CGFloat)upper;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLowerLimit:(CGFloat)lowerLimit;
- (void)setUpperLimit:(CGFloat)upperLimit;
@end

@implementation SKRange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRange)init
{
  return [(SKRange *)self initWithLowerLimit:-1.79769313e308 upperLimit:1.79769313e308];
}

- (SKRange)initWithLowerLimit:(CGFloat)lower upperLimit:(CGFloat)upper
{
  v9.receiver = self;
  v9.super_class = (Class)SKRange;
  v6 = [(SKRange *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(SKRange *)v6 setLowerLimit:lower];
    [(SKRange *)v7 setUpperLimit:upper];
  }
  return v7;
}

- (SKRange)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"_lowerLimit"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"_upperLimit"];
  v8 = [(SKRange *)self initWithLowerLimit:v6 upperLimit:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(SKRange *)self lowerLimit];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_lowerLimit");
  [(SKRange *)self upperLimit];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_upperLimit");
}

+ (SKRange)rangeWithLowerLimit:(CGFloat)lower upperLimit:(CGFloat)upper
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLowerLimit:lower upperLimit:upper];

  return (SKRange *)v4;
}

+ (SKRange)rangeWithNoLimits
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLowerLimit:-1.79769313e308 upperLimit:1.79769313e308];

  return (SKRange *)v2;
}

+ (SKRange)rangeWithLowerLimit:(CGFloat)lower
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLowerLimit:lower upperLimit:1.79769313e308];

  return (SKRange *)v3;
}

+ (SKRange)rangeWithUpperLimit:(CGFloat)upper
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLowerLimit:-1.79769313e308 upperLimit:upper];

  return (SKRange *)v3;
}

+ (SKRange)rangeWithConstantValue:(CGFloat)value
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLowerLimit:value upperLimit:value];

  return (SKRange *)v3;
}

+ (SKRange)rangeWithValue:(CGFloat)value variance:(CGFloat)variance
{
  double v4 = fabs(variance);
  double v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLowerLimit:value - v4 upperLimit:v4 + value];

  return (SKRange *)v5;
}

- (id)description
{
  [(SKRange *)self lowerLimit];
  if (v3 == 1.79769313e308)
  {
    double v4 = @"inf";
  }
  else
  {
    [(SKRange *)self lowerLimit];
    if (v5 == -1.79769313e308)
    {
      double v4 = @"-inf";
    }
    else
    {
      double v6 = NSString;
      [(SKRange *)self lowerLimit];
      double v4 = [v6 stringWithFormat:@"%.2f", v7];
    }
  }
  [(SKRange *)self upperLimit];
  if (v8 == 1.79769313e308)
  {
    objc_super v9 = @"inf";
  }
  else
  {
    [(SKRange *)self upperLimit];
    if (v10 == -1.79769313e308)
    {
      objc_super v9 = @"-inf";
    }
    else
    {
      v11 = NSString;
      [(SKRange *)self upperLimit];
      objc_super v9 = [v11 stringWithFormat:@"%.2f", v12];
    }
  }
  v13 = [NSString stringWithFormat:@"<SKRange> lowerLimit:%@ upperLimit:%@", v4, v9];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(SKRange *)self lowerLimit];
  double v5 = v4;
  [(SKRange *)self upperLimit];
  +[SKRange rangeWithLowerLimit:v5 upperLimit:v6];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqualToRange:(id)a3
{
  return 1;
}

- (CGFloat)lowerLimit
{
  return self->_lowerLimit;
}

- (void)setLowerLimit:(CGFloat)lowerLimit
{
  self->_lowerLimit = lowerLimit;
}

- (CGFloat)upperLimit
{
  return self->_upperLimit;
}

- (void)setUpperLimit:(CGFloat)upperLimit
{
  self->_upperLimit = upperLimit;
}

@end