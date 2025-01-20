@interface RTFamiliarityIndexResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)dateInterval;
- (RTFamiliarityIndexResult)initWithCoder:(id)a3;
- (RTFamiliarityIndexResult)initWithDateInterval:(id)a3 familiarityIndex:(double)a4;
- (double)familiarityIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTFamiliarityIndexResult

- (RTFamiliarityIndexResult)initWithDateInterval:(id)a3 familiarityIndex:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTFamiliarityIndexResult;
  v8 = [(RTFamiliarityIndexResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_familiarityIndex = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeDouble:@"familiarityIndex" forKey:self->_familiarityIndex];
}

- (RTFamiliarityIndexResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTFamiliarityIndexResult;
  id v5 = [(RTFamiliarityIndexResult *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    [v4 decodeDoubleForKey:@"familiarityIndex"];
    v5->_familiarityIndex = v8;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RTFamiliarityIndexResult alloc];
  dateInterval = self->_dateInterval;
  double familiarityIndex = self->_familiarityIndex;
  return [(RTFamiliarityIndexResult *)v4 initWithDateInterval:dateInterval familiarityIndex:familiarityIndex];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTFamiliarityIndexResult *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    id v7 = [(RTFamiliarityIndexResult *)self dateInterval];
    double v8 = [(RTFamiliarityIndexResult *)v6 dateInterval];
    if ([v7 isEqualToDateInterval:v8])
    {
      [(RTFamiliarityIndexResult *)self familiarityIndex];
      double v10 = v9;
      [(RTFamiliarityIndexResult *)v6 familiarityIndex];
      BOOL v12 = v10 == v11;
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

- (id)description
{
  v3 = NSString;
  id v4 = [(RTFamiliarityIndexResult *)self dateInterval];
  [(RTFamiliarityIndexResult *)self familiarityIndex];
  uint64_t v6 = [v3 stringWithFormat:@"dateInterval, %@, index, %.2f", v4, v5];

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)familiarityIndex
{
  return self->_familiarityIndex;
}

- (void).cxx_destruct
{
}

@end