@interface HKMCRecentBasalBodyTemperature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMCRecentBasalBodyTemperature)initWithCoder:(id)a3;
- (HKMCRecentBasalBodyTemperature)initWithMostRecent:(id)a3 upperQuantile:(id)a4 median:(id)a5 lowerQuantile:(id)a6;
- (HKQuantity)lowerQuantile;
- (HKQuantity)median;
- (HKQuantity)mostRecent;
- (HKQuantity)upperQuantile;
- (NSString)shortDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCRecentBasalBodyTemperature

- (HKMCRecentBasalBodyTemperature)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MostRecent"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpperQuantile"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Median"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LowerQuantile"];

  v9 = [(HKMCRecentBasalBodyTemperature *)self initWithMostRecent:v5 upperQuantile:v6 median:v7 lowerQuantile:v8];
  return v9;
}

- (HKMCRecentBasalBodyTemperature)initWithMostRecent:(id)a3 upperQuantile:(id)a4 median:(id)a5 lowerQuantile:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKMCRecentBasalBodyTemperature;
  v15 = [(HKMCRecentBasalBodyTemperature *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mostRecent, a3);
    objc_storeStrong((id *)&v16->_upperQuantile, a4);
    objc_storeStrong((id *)&v16->_median, a5);
    objc_storeStrong((id *)&v16->_lowerQuantile, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  mostRecent = self->_mostRecent;
  id v5 = a3;
  [v5 encodeObject:mostRecent forKey:@"MostRecent"];
  [v5 encodeObject:self->_upperQuantile forKey:@"UpperQuantile"];
  [v5 encodeObject:self->_median forKey:@"Median"];
  [v5 encodeObject:self->_lowerQuantile forKey:@"LowerQuantile"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKMCRecentBasalBodyTemperature *)self shortDescription];
  v6 = [v3 stringWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (NSString)shortDescription
{
  v3 = [MEMORY[0x263F0A830] degreeCelsiusUnit];
  uint64_t v4 = NSString;
  [(HKQuantity *)self->_mostRecent doubleValueForUnit:v3];
  uint64_t v6 = v5;
  [(HKQuantity *)self->_lowerQuantile doubleValueForUnit:v3];
  uint64_t v8 = v7;
  [(HKQuantity *)self->_median doubleValueForUnit:v3];
  uint64_t v10 = v9;
  [(HKQuantity *)self->_upperQuantile doubleValueForUnit:v3];
  id v12 = [v4 stringWithFormat:@"last:%.2f [%.2f, %.2f, %.2f] %@", v6, v8, v10, v11, v3];

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMCRecentBasalBodyTemperature *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      mostRecent = self->_mostRecent;
      uint64_t v7 = v5->_mostRecent;
      if (mostRecent != v7 && (!v7 || !-[HKQuantity isEqual:](mostRecent, "isEqual:"))) {
        goto LABEL_17;
      }
      upperQuantile = self->_upperQuantile;
      uint64_t v9 = v5->_upperQuantile;
      if (upperQuantile != v9 && (!v9 || !-[HKQuantity isEqual:](upperQuantile, "isEqual:"))) {
        goto LABEL_17;
      }
      median = self->_median;
      uint64_t v11 = v5->_median;
      if (median != v11 && (!v11 || !-[HKQuantity isEqual:](median, "isEqual:"))) {
        goto LABEL_17;
      }
      lowerQuantile = self->_lowerQuantile;
      id v13 = v5->_lowerQuantile;
      if (lowerQuantile == v13)
      {
        char v14 = 1;
        goto LABEL_18;
      }
      if (v13) {
        char v14 = -[HKQuantity isEqual:](lowerQuantile, "isEqual:");
      }
      else {
LABEL_17:
      }
        char v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
    char v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKQuantity *)self->_mostRecent hash];
  uint64_t v4 = [(HKQuantity *)self->_upperQuantile hash] ^ v3;
  uint64_t v5 = [(HKQuantity *)self->_median hash];
  return v4 ^ v5 ^ [(HKQuantity *)self->_lowerQuantile hash];
}

- (HKQuantity)mostRecent
{
  return self->_mostRecent;
}

- (HKQuantity)upperQuantile
{
  return self->_upperQuantile;
}

- (HKQuantity)median
{
  return self->_median;
}

- (HKQuantity)lowerQuantile
{
  return self->_lowerQuantile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerQuantile, 0);
  objc_storeStrong((id *)&self->_median, 0);
  objc_storeStrong((id *)&self->_upperQuantile, 0);
  objc_storeStrong((id *)&self->_mostRecent, 0);
}

@end