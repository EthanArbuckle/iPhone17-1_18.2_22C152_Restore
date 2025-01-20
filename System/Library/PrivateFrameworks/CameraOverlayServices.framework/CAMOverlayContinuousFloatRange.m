@interface CAMOverlayContinuousFloatRange
+ (BOOL)supportsSecureCoding;
- (BOOL)containsValue:(id)a3;
- (BOOL)isDiscrete;
- (BOOL)isEqualToRange:(id)a3;
- (BOOL)isFloatingPoint;
- (BOOL)isValueExpectedType:(id)a3;
- (CAMOverlayContinuousFloatRange)initWithCoder:(id)a3;
- (CAMOverlayContinuousFloatRange)initWithMinimum:(double)a3 maximum:(double)a4;
- (NSString)description;
- (double)maximum;
- (double)minimum;
- (double)valueClosestToValue:(double)a3;
- (unint64_t)rangeType;
- (unint64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMOverlayContinuousFloatRange

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; min: %.3f; max: %.3f>",
    v5,
    self,
    *(void *)&self->_minimum,
  v6 = *(void *)&self->_maximum);

  return (NSString *)v6;
}

- (CAMOverlayContinuousFloatRange)initWithMinimum:(double)a3 maximum:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMOverlayContinuousFloatRange;
  v6 = [(CAMOverlayContinuousFloatRange *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_minimum = fmin(a3, a4);
    v6->_maximum = fmax(a3, a4);
    v8 = v6;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayContinuousFloatRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAMOverlayContinuousFloatRange;
  v5 = [(CAMOverlayContinuousFloatRange *)&v17 init];
  if (v5)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"%@.%@", v8, @"minimum"];
    [v4 decodeDoubleForKey:v9];
    v5->_minimum = v10;

    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v11 stringWithFormat:@"%@.%@", v13, @"maximum"];
    [v4 decodeDoubleForKey:v14];
    v5->_maximum = v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(CAMOverlayContinuousFloatRange *)self minimum];
  double v6 = v5;
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  double v10 = [v7 stringWithFormat:@"%@.%@", v9, @"minimum"];
  [v4 encodeDouble:v10 forKey:v6];

  [(CAMOverlayContinuousFloatRange *)self maximum];
  double v12 = v11;
  v13 = NSString;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  double v15 = [v13 stringWithFormat:@"%@.%@", v16, @"maximum"];
  [v4 encodeDouble:v15 forKey:v12];
}

- (unint64_t)rangeType
{
  return 1;
}

- (unint64_t)valueType
{
  return 0;
}

- (BOOL)isFloatingPoint
{
  return 1;
}

- (BOOL)isDiscrete
{
  return 0;
}

- (BOOL)isEqualToRange:(id)a3
{
  id v4 = (CAMOverlayContinuousFloatRange *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      BOOL v12 = 1;
    }
    else
    {
      double v5 = v4;
      [(CAMOverlayContinuousFloatRange *)v5 minimum];
      double v7 = v6;
      [(CAMOverlayContinuousFloatRange *)self minimum];
      if (v7 == v8)
      {
        [(CAMOverlayContinuousFloatRange *)v5 maximum];
        double v10 = v9;
        [(CAMOverlayContinuousFloatRange *)self maximum];
        BOOL v12 = v10 == v11;
      }
      else
      {
        BOOL v12 = 0;
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)containsValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 doubleValue], double v6 = v5, -[CAMOverlayContinuousFloatRange minimum](self, "minimum"), v6 >= v7))
  {
    [(CAMOverlayContinuousFloatRange *)self maximum];
    BOOL v8 = v6 <= v9;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isValueExpectedType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)valueClosestToValue:(double)a3
{
  [(CAMOverlayContinuousFloatRange *)self minimum];
  double v6 = v5;
  [(CAMOverlayContinuousFloatRange *)self maximum];
  return fmax(v6, fmin(v7, a3));
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end