@interface HKRatioValue
+ (BOOL)supportsSecureCoding;
+ (id)ratioValueWithNumerator:(id)a3 andDenominator:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKCodedQuantity)denominator;
- (HKCodedQuantity)numerator;
- (HKRatioValue)init;
- (HKRatioValue)initWithCoder:(id)a3;
- (id)_initWithNumerator:(id)a3 denominator:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKRatioValue

- (HKRatioValue)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)ratioValueWithNumerator:(id)a3 andDenominator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithNumerator:v7 denominator:v6];

  return v8;
}

- (id)_initWithNumerator:(id)a3 denominator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKRatioValue;
  v8 = [(HKRatioValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    numerator = v8->_numerator;
    v8->_numerator = (HKCodedQuantity *)v9;

    uint64_t v11 = [v7 copy];
    denominator = v8->_denominator;
    v8->_denominator = (HKCodedQuantity *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(HKRatioValue *)self numerator];
  id v7 = [(HKRatioValue *)self denominator];
  v8 = [v3 stringWithFormat:@"<%@:%p numerator = %@, denominator = %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKRatioValue *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(HKRatioValue *)self numerator];
      uint64_t v7 = [(HKRatioValue *)v5 numerator];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HKRatioValue *)v5 numerator];
        if (!v9) {
          goto LABEL_14;
        }
        v10 = (void *)v9;
        uint64_t v11 = [(HKRatioValue *)self numerator];
        v12 = [(HKRatioValue *)v5 numerator];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      id v6 = [(HKRatioValue *)self denominator];
      uint64_t v15 = [(HKRatioValue *)v5 denominator];
      if (v6 == (void *)v15)
      {

LABEL_17:
        BOOL v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      uint64_t v16 = [(HKRatioValue *)v5 denominator];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [(HKRatioValue *)self denominator];
        v19 = [(HKRatioValue *)v5 denominator];
        char v20 = [v18 isEqual:v19];

        if (v20) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRatioValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKRatioValue;
  v5 = [(HKRatioValue *)&v12 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NumeratorKey"];
  numerator = v5->_numerator;
  v5->_numerator = (HKCodedQuantity *)v6;

  if (!v5->_numerator) {
    goto LABEL_5;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DenominatorKey"];
  denominator = v5->_denominator;
  v5->_denominator = (HKCodedQuantity *)v8;

  if (v5->_denominator) {
LABEL_4:
  }
    v10 = v5;
  else {
LABEL_5:
  }
    v10 = 0;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  numerator = self->_numerator;
  id v5 = a3;
  [v5 encodeObject:numerator forKey:@"NumeratorKey"];
  [v5 encodeObject:self->_denominator forKey:@"DenominatorKey"];
}

- (HKCodedQuantity)numerator
{
  return self->_numerator;
}

- (HKCodedQuantity)denominator
{
  return self->_denominator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denominator, 0);

  objc_storeStrong((id *)&self->_numerator, 0);
}

@end