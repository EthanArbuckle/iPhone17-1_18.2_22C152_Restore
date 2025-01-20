@interface HKValueHistogramSegment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKQuantityRange)quantityRange;
- (HKValueHistogramSegment)initWithCoder:(id)a3;
- (HKValueHistogramSegment)initWithQuantityRange:(id)a3 count:(int64_t)a4;
- (id)description;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKValueHistogramSegment

- (HKValueHistogramSegment)initWithQuantityRange:(id)a3 count:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKValueHistogramSegment;
  v8 = [(HKValueHistogramSegment *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_quantityRange, a3);
    v9->_count = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKValueHistogramSegment *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if ([(HKValueHistogramSegment *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    quantityRange = self->_quantityRange;
    id v7 = [(HKValueHistogramSegment *)v5 quantityRange];
    if ([(HKQuantityRange *)quantityRange isEqual:v7])
    {
      int64_t count = self->_count;
      BOOL v9 = count == [(HKValueHistogramSegment *)v5 count];
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

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p range=%@ count=%ld>", objc_opt_class(), self, self->_quantityRange, self->_count];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogramSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantityRange"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"count"];

  id v7 = [(HKValueHistogramSegment *)self initWithQuantityRange:v5 count:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  quantityRange = self->_quantityRange;
  id v5 = a3;
  [v5 encodeObject:quantityRange forKey:@"quantityRange"];
  [v5 encodeInteger:self->_count forKey:@"count"];
}

- (HKQuantityRange)quantityRange
{
  return self->_quantityRange;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end