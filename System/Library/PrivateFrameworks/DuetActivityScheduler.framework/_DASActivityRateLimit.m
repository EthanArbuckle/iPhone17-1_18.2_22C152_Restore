@interface _DASActivityRateLimit
+ (BOOL)supportsSecureCoding;
+ (id)rateLimitWithMaximum:(unint64_t)a3 perWindow:(double)a4;
- (BOOL)isEqual:(id)a3;
- (_DASActivityRateLimit)initWithCoder:(id)a3;
- (_DASActivityRateLimit)initWithMaximum:(unint64_t)a3 perWindow:(double)a4;
- (double)window;
- (id)description;
- (unint64_t)maximum;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximum:(unint64_t)a3;
- (void)setWindow:(double)a3;
@end

@implementation _DASActivityRateLimit

+ (id)rateLimitWithMaximum:(unint64_t)a3 perWindow:(double)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMaximum:a3 perWindow:a4];

  return v4;
}

- (_DASActivityRateLimit)initWithMaximum:(unint64_t)a3 perWindow:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_DASActivityRateLimit;
  result = [(_DASActivityRateLimit *)&v7 init];
  if (result)
  {
    result->_maximum = a3;
    result->_window = a4;
  }
  return result;
}

- (double)window
{
  return self->_window;
}

- (unint64_t)maximum
{
  return self->_maximum;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<Limit: %llu per %lfs>", self->_maximum, *(void *)&self->_window);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_DASActivityRateLimit *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t maximum = self->_maximum;
      if (maximum == [(_DASActivityRateLimit *)v5 maximum])
      {
        double window = self->_window;
        [(_DASActivityRateLimit *)v5 window];
        BOOL v9 = window == v8;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t maximum = self->_maximum;
  id v6 = a3;
  objc_super v7 = [v4 numberWithUnsignedInteger:maximum];
  [v6 encodeObject:v7 forKey:@"maximum"];

  id v8 = [NSNumber numberWithDouble:self->_window];
  [v6 encodeObject:v8 forKey:@"window"];
}

- (_DASActivityRateLimit)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DASActivityRateLimit;
  v5 = [(_DASActivityRateLimit *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximum"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"window"];
    id v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      v5->_unint64_t maximum = [v6 unsignedIntValue];
      [v8 doubleValue];
      v5->_double window = v10;
      v11 = v5;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setMaximum:(unint64_t)a3
{
  self->_unint64_t maximum = a3;
}

- (void)setWindow:(double)a3
{
  self->_double window = a3;
}

@end