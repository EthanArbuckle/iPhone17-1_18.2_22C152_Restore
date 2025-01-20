@interface _HDValueRange
- (BOOL)contains:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMaximumInclusive;
- (BOOL)isMinimumInclusive;
- (_HDValueRange)initWithMinimum:(double)a3 maximum:(double)a4 isMinimumInclusive:(BOOL)a5 isMaximumInclusive:(BOOL)a6;
- (double)maximum;
- (double)minimum;
- (void)setIsMaximumInclusive:(BOOL)a3;
- (void)setIsMinimumInclusive:(BOOL)a3;
- (void)setMaximum:(double)a3;
- (void)setMinimum:(double)a3;
@end

@implementation _HDValueRange

- (_HDValueRange)initWithMinimum:(double)a3 maximum:(double)a4 isMinimumInclusive:(BOOL)a5 isMaximumInclusive:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_HDValueRange;
  result = [(_HDValueRange *)&v11 init];
  if (result)
  {
    result->_minimum = a3;
    result->_maximum = a4;
    result->_isMinimumInclusive = a5;
    result->_isMaximumInclusive = a6;
  }
  return result;
}

- (BOOL)contains:(double)a3
{
  double minimum = self->_minimum;
  if (self->_isMinimumInclusive)
  {
    if (minimum > a3) {
      return 0;
    }
  }
  else if (minimum >= a3)
  {
    return 0;
  }
  double maximum = self->_maximum;
  if (self->_isMaximumInclusive) {
    return maximum >= a3;
  }
  else {
    return maximum > a3;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HDValueRange *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else if ([(_HDValueRange *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    double minimum = self->_minimum;
    [(_HDValueRange *)v5 minimum];
    if (minimum == v7
      && (double maximum = self->_maximum, [(_HDValueRange *)v5 maximum], maximum == v9)
      && (BOOL isMinimumInclusive = self->_isMinimumInclusive,
          isMinimumInclusive == [(_HDValueRange *)v5 isMinimumInclusive]))
    {
      BOOL isMaximumInclusive = self->_isMaximumInclusive;
      BOOL v12 = isMaximumInclusive == [(_HDValueRange *)v5 isMaximumInclusive];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (double)minimum
{
  return self->_minimum;
}

- (void)setMinimum:(double)a3
{
  self->_double minimum = a3;
}

- (double)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(double)a3
{
  self->_double maximum = a3;
}

- (BOOL)isMinimumInclusive
{
  return self->_isMinimumInclusive;
}

- (void)setIsMinimumInclusive:(BOOL)a3
{
  self->_BOOL isMinimumInclusive = a3;
}

- (BOOL)isMaximumInclusive
{
  return self->_isMaximumInclusive;
}

- (void)setIsMaximumInclusive:(BOOL)a3
{
  self->_BOOL isMaximumInclusive = a3;
}

@end