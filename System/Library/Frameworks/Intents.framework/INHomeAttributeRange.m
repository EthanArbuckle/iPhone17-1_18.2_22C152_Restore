@interface INHomeAttributeRange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INHomeAttributeRange)initWithCoder:(id)a3;
- (INHomeAttributeRange)initWithRange:(double)a3 upperValue:(double)a4;
- (double)lowerValue;
- (double)upperValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeAttributeRange

- (double)upperValue
{
  return self->_upperValue;
}

- (double)lowerValue
{
  return self->_lowerValue;
}

- (void)encodeWithCoder:(id)a3
{
  double lowerValue = self->_lowerValue;
  id v5 = a3;
  [v5 encodeDouble:@"lowerValue" forKey:lowerValue];
  [v5 encodeDouble:@"upperValue" forKey:self->_upperValue];
}

- (INHomeAttributeRange)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"lowerValue"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"upperValue"];
  double v8 = v7;

  return [(INHomeAttributeRange *)self initWithRange:v6 upperValue:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_lowerValue == v4[1] && self->_upperValue == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_upperValue ^ (unint64_t)self->_lowerValue;
}

- (INHomeAttributeRange)initWithRange:(double)a3 upperValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)INHomeAttributeRange;
  result = [(INHomeAttributeRange *)&v7 init];
  if (result)
  {
    result->_double lowerValue = a3;
    result->_upperValue = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end