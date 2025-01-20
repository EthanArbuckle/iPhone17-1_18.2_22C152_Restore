@interface HKMetadataValueRange
- (BOOL)isEqual:(id)a3;
- (HKMetadataValueRange)initWithMinValue:(id)a3 maxValue:(id)a4;
- (id)maxValue;
- (id)minValue;
- (unint64_t)hash;
@end

@implementation HKMetadataValueRange

- (HKMetadataValueRange)initWithMinValue:(id)a3 maxValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMetadataValueRange;
  v9 = [(HKMetadataValueRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_minValue, a3);
    objc_storeStrong(&v10->_maxValue, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMetadataValueRange *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if ([(HKMetadataValueRange *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    id minValue = self->_minValue;
    id v7 = [(HKMetadataValueRange *)v5 minValue];
    if ([minValue isEqual:v7])
    {
      id maxValue = self->_maxValue;
      v9 = [(HKMetadataValueRange *)v5 maxValue];
      char v10 = [maxValue isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_minValue hash];
  return [self->_maxValue hash] ^ v3;
}

- (id)minValue
{
  return self->_minValue;
}

- (id)maxValue
{
  return self->_maxValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maxValue, 0);

  objc_storeStrong(&self->_minValue, 0);
}

@end