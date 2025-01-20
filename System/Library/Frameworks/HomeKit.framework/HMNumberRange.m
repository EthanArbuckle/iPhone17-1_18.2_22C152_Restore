@interface HMNumberRange
+ (HMNumberRange)numberRangeWithMaxValue:(NSNumber *)maxValue;
+ (HMNumberRange)numberRangeWithMinValue:(NSNumber *)minValue;
+ (HMNumberRange)numberRangeWithMinValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue;
- (BOOL)isEqual:(id)a3;
- (HMNumberRange)initWithMinValue:(id)a3 maxValue:(id)a4;
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (id)description;
- (unint64_t)hash;
@end

@implementation HMNumberRange

+ (HMNumberRange)numberRangeWithMaxValue:(NSNumber *)maxValue
{
  v3 = maxValue;
  v4 = [[HMNumberRange alloc] initWithMinValue:0 maxValue:v3];

  return v4;
}

+ (HMNumberRange)numberRangeWithMinValue:(NSNumber *)minValue
{
  v3 = minValue;
  v4 = [[HMNumberRange alloc] initWithMinValue:v3 maxValue:0];

  return v4;
}

- (HMNumberRange)initWithMinValue:(id)a3 maxValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMNumberRange;
  v9 = [(HMNumberRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_minValue, a3);
    objc_storeStrong((id *)&v10->_maxValue, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxValue, 0);

  objc_storeStrong((id *)&self->_minValue, 0);
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMNumberRange *)self minValue];
  v5 = [(HMNumberRange *)self maxValue];
  v6 = [v3 stringWithFormat:@"<HMNumberRange: min: %@, max: %@>", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMNumberRange *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMNumberRange *)self minValue];
      id v7 = [(HMNumberRange *)v5 minValue];
      int v8 = HMFEqualObjects();

      if (v8)
      {
        v9 = [(HMNumberRange *)self maxValue];
        v10 = [(HMNumberRange *)v5 maxValue];
        char v11 = HMFEqualObjects();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(HMNumberRange *)self minValue];
  uint64_t v4 = [v3 hash];
  v5 = [(HMNumberRange *)self maxValue];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (HMNumberRange)numberRangeWithMinValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue
{
  v5 = maxValue;
  unint64_t v6 = minValue;
  id v7 = [[HMNumberRange alloc] initWithMinValue:v6 maxValue:v5];

  return v7;
}

@end