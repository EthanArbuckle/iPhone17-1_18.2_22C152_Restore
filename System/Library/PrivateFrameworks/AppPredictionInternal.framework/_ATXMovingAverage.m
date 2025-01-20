@interface _ATXMovingAverage
+ (BOOL)supportsSecureCoding;
- (_ATXMovingAverage)initWithAlpha:(double)a3;
- (_ATXMovingAverage)initWithCoder:(id)a3;
- (double)movingAverage;
- (double)movingError;
- (id)description;
- (void)addElement:(double)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ATXMovingAverage

- (_ATXMovingAverage)initWithAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_ATXMovingAverage;
  result = [(_ATXMovingAverage *)&v5 init];
  if (result)
  {
    result->_alpha = a3;
    result->_count = 0;
  }
  return result;
}

- (double)movingAverage
{
  return self->_movingAverage;
}

- (double)movingError
{
  return self->_movingError;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = [NSNumber numberWithDouble:self->_movingAverage];
  objc_super v5 = [NSNumber numberWithDouble:self->_movingError];
  v6 = [v3 stringWithFormat:@"(avg = %@, error = %@)", v4, v5];

  return v6;
}

- (_ATXMovingAverage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ATXMovingAverage;
  objc_super v5 = [(_ATXMovingAverage *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"avgError"];
    v5->_movingError = v6;
    [v4 decodeDoubleForKey:@"avgDuration"];
    v5->_movingAverage = v7;
    [v4 decodeDoubleForKey:@"alpha"];
    v5->_alpha = v8;
    v5->_count = [v4 decodeIntegerForKey:@"count"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double movingAverage = self->_movingAverage;
  id v5 = a3;
  [v5 encodeDouble:@"avgDuration" forKey:movingAverage];
  [v5 encodeDouble:@"avgError" forKey:self->_movingError];
  [v5 encodeDouble:@"alpha" forKey:self->_alpha];
  [v5 encodeInteger:self->_count forKey:@"count"];
}

- (void)addElement:(double)a3
{
  int64_t count = self->_count;
  if (count)
  {
    double alpha = self->_alpha;
    double v5 = (1.0 - alpha) * self->_movingAverage + alpha * a3;
    self->_double movingAverage = v5;
    double v6 = vabdd_f64(a3, v5);
    if (count != 1) {
      double v6 = (1.0 - alpha) * self->_movingError + alpha * v6;
    }
    self->_movingError = v6;
  }
  else
  {
    self->_double movingAverage = a3;
    self->_movingError = 0.0;
  }
  self->_int64_t count = count + 1;
}

@end