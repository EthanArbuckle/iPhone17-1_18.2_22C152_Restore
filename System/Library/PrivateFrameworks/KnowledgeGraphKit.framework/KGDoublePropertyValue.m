@interface KGDoublePropertyValue
- (BOOL)isEqual:(id)a3;
- (KGDoublePropertyValue)initWithValue:(double)a3;
- (double)value;
- (id)kgPropertyValue;
- (unint64_t)dataType;
- (unint64_t)hash;
@end

@implementation KGDoublePropertyValue

- (double)value
{
  return self->_value;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithDouble:self->_value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double value = self->_value;
    [v4 value];
    BOOL v7 = vabdd_f64(value, v6) <= 2.22044605e-16;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)kgPropertyValue
{
  return (id)[NSNumber numberWithDouble:self->_value];
}

- (unint64_t)dataType
{
  return 2;
}

- (KGDoublePropertyValue)initWithValue:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KGDoublePropertyValue;
  result = [(KGPropertyValue *)&v5 initForSubclasses];
  if (result) {
    result->_double value = a3;
  }
  return result;
}

@end