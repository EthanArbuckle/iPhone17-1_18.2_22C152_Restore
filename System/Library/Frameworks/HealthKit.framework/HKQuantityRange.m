@interface HKQuantityRange
+ (BOOL)areRangesDisjoint:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)ATTDEuglycemicRangeWithUnit:(id)a3;
+ (id)ATTDGlycemicRangesWithUnit:(id)a3;
+ (id)ATTDHyperglycemicRangeWithUnit:(id)a3;
+ (id)ATTDLevel1HypoglycemicRangeWithUnit:(id)a3;
+ (id)ATTDLevel2HypoglycemicRangeWithUnit:(id)a3;
+ (id)exclusiveRangeWithMinimum:(id)a3 maximum:(id)a4;
+ (id)inclusiveRangeWithMinimum:(id)a3 maximum:(id)a4;
- (BOOL)containsQuantity:(id)a3;
- (BOOL)intersectsRange:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuantityRange:(id)a3 withAccuracy:(id)a4;
- (BOOL)isMaximumInclusive;
- (BOOL)isMinimumInclusive;
- (HKQuantity)maximum;
- (HKQuantity)minimum;
- (HKQuantityRange)initWithCoder:(id)a3;
- (HKQuantityRange)initWithMinimum:(id)a3 maximum:(id)a4 isMinimumInclusive:(BOOL)a5 isMaximumInclusive:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsMaximumInclusive:(BOOL)a3;
- (void)setIsMinimumInclusive:(BOOL)a3;
- (void)setMaximum:(id)a3;
- (void)setMinimum:(id)a3;
@end

@implementation HKQuantityRange

- (HKQuantityRange)initWithMinimum:(id)a3 maximum:(id)a4 isMinimumInclusive:(BOOL)a5 isMaximumInclusive:(BOOL)a6
{
  id v12 = a3;
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKQuantityRange;
  v14 = [(HKQuantityRange *)&v17 init];
  if (v14)
  {
    if (objc_msgSend(v13, "hk_isLessThanQuantity:", v12))
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:v14 file:@"HKQuantityRange.m" lineNumber:26 description:@"Quantity range maximum must be >= minimum"];
    }
    objc_storeStrong((id *)&v14->_minimum, a3);
    objc_storeStrong((id *)&v14->_maximum, a4);
    v14->_isMinimumInclusive = a5;
    v14->_isMaximumInclusive = a6;
  }

  return v14;
}

+ (id)inclusiveRangeWithMinimum:(id)a3 maximum:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithMinimum:v7 maximum:v6 isMinimumInclusive:1 isMaximumInclusive:1];

  return v8;
}

+ (id)exclusiveRangeWithMinimum:(id)a3 maximum:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithMinimum:v7 maximum:v6 isMinimumInclusive:0 isMaximumInclusive:0];

  return v8;
}

- (BOOL)containsQuantity:(id)a3
{
  id v4 = a3;
  v5 = v4;
  minimum = self->_minimum;
  if (self->_isMinimumInclusive)
  {
    if (objc_msgSend(v4, "hk_isLessThanQuantity:", minimum))
    {
LABEL_3:
      LOBYTE(v7) = 0;
      goto LABEL_8;
    }
  }
  else if (!objc_msgSend(v4, "hk_isGreaterThanQuantity:", minimum))
  {
    goto LABEL_3;
  }
  maximum = self->_maximum;
  if (self->_isMaximumInclusive) {
    int v7 = objc_msgSend(v5, "hk_isGreaterThanQuantity:", maximum) ^ 1;
  }
  else {
    LOBYTE(v7) = objc_msgSend(v5, "hk_isLessThanQuantity:", maximum);
  }
LABEL_8:

  return v7;
}

- (BOOL)intersectsRange:(id)a3
{
  id v4 = a3;
  minimum = self->_minimum;
  id v6 = [v4 maximum];
  uint64_t v7 = [(HKQuantity *)minimum compare:v6];

  if (v7 == 1) {
    goto LABEL_10;
  }
  if (v7)
  {
    maximum = self->_maximum;
    v10 = [v4 minimum];
    uint64_t v11 = [(HKQuantity *)maximum compare:v10];

    if (v11 != -1)
    {
      if (v11)
      {
        BOOL v12 = 1;
        goto LABEL_11;
      }
      if (self->_isMaximumInclusive)
      {
        char v8 = [v4 isMinimumInclusive];
        goto LABEL_9;
      }
    }
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  if (!self->_isMinimumInclusive) {
    goto LABEL_10;
  }
  char v8 = [v4 isMaximumInclusive];
LABEL_9:
  BOOL v12 = v8;
LABEL_11:

  return v12;
}

+ (BOOL)areRangesDisjoint:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    v5 = [v3 sortedArrayUsingComparator:&__block_literal_global_69];
    id v6 = [v5 objectAtIndexedSubscript:0];
    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v7 = 1;
      while (1)
      {
        char v8 = [v5 objectAtIndexedSubscript:v7];
        if ([v8 intersectsRange:v6]) {
          break;
        }

        ++v7;
        id v6 = v8;
        if (v7 >= [v5 count])
        {
          BOOL v4 = 1;
          id v6 = v8;
          goto LABEL_10;
        }
      }

      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = 1;
    }
LABEL_10:
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

uint64_t __37__HKQuantityRange_areRangesDisjoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 minimum];
  id v6 = [v4 minimum];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)isEqualToQuantityRange:(id)a3 withAccuracy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HKQuantity *)self->_minimum isEqualToQuantity:v6[2] withAccuracy:v7]
    && [(HKQuantity *)self->_maximum isEqualToQuantity:v6[3] withAccuracy:v7]
    && self->_isMinimumInclusive == *((unsigned __int8 *)v6 + 8)
    && self->_isMaximumInclusive == *((unsigned __int8 *)v6 + 9);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKQuantityRange *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else if ([(HKQuantityRange *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    minimum = self->_minimum;
    id v7 = [(HKQuantityRange *)v5 minimum];
    if ([(HKQuantity *)minimum isEqual:v7])
    {
      maximum = self->_maximum;
      v9 = [(HKQuantityRange *)v5 maximum];
      if ([(HKQuantity *)maximum isEqual:v9]
        && (BOOL isMinimumInclusive = self->_isMinimumInclusive,
            isMinimumInclusive == [(HKQuantityRange *)v5 isMinimumInclusive]))
      {
        BOOL isMaximumInclusive = self->_isMaximumInclusive;
        BOOL v12 = isMaximumInclusive == [(HKQuantityRange *)v5 isMaximumInclusive];
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
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HKQuantityRange alloc];
  minimum = self->_minimum;
  maximum = self->_maximum;
  BOOL isMinimumInclusive = self->_isMinimumInclusive;
  BOOL isMaximumInclusive = self->_isMaximumInclusive;

  return [(HKQuantityRange *)v4 initWithMinimum:minimum maximum:maximum isMinimumInclusive:isMinimumInclusive isMaximumInclusive:isMaximumInclusive];
}

- (id)description
{
  v2 = @"[";
  if (!self->_isMinimumInclusive) {
    v2 = CFSTR("(");
  }
  if (self->_isMaximumInclusive) {
    id v3 = @"]";
  }
  else {
    id v3 = @"");
  }
  return (id)[NSString stringWithFormat:@"%@%@, %@%@", v2, self->_minimum, self->_maximum, v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantityRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimum"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximum"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isMinimumInclusive"];
  uint64_t v8 = [v4 decodeBoolForKey:@"isMaximumInclusive"];

  v9 = [(HKQuantityRange *)self initWithMinimum:v5 maximum:v6 isMinimumInclusive:v7 isMaximumInclusive:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  minimum = self->_minimum;
  id v5 = a3;
  [v5 encodeObject:minimum forKey:@"minimum"];
  [v5 encodeObject:self->_maximum forKey:@"maximum"];
  [v5 encodeBool:self->_isMinimumInclusive forKey:@"isMinimumInclusive"];
  [v5 encodeBool:self->_isMaximumInclusive forKey:@"isMaximumInclusive"];
}

- (HKQuantity)minimum
{
  return self->_minimum;
}

- (void)setMinimum:(id)a3
{
}

- (HKQuantity)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximum, 0);

  objc_storeStrong((id *)&self->_minimum, 0);
}

+ (id)ATTDLevel2HypoglycemicRangeWithUnit:(id)a3
{
  id v4 = a3;
  id v5 = +[HKUnit _milligramsPerDeciliterUnit];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [HKQuantityRange alloc];
    uint64_t v8 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
    double v9 = 54.0;
LABEL_5:
    BOOL v12 = +[HKQuantity quantityWithUnit:v4 doubleValue:v9];
    id v13 = [(HKQuantityRange *)v7 initWithMinimum:v8 maximum:v12 isMinimumInclusive:1 isMaximumInclusive:0];

    goto LABEL_7;
  }
  v10 = +[HKUnit _millimolesBloodGlucosePerLiterUnit];
  int v11 = [v4 isEqual:v10];

  if (v11)
  {
    uint64_t v7 = [HKQuantityRange alloc];
    uint64_t v8 = +[HKQuantity quantityWithUnit:v4 doubleValue:0.0];
    double v9 = 3.0;
    goto LABEL_5;
  }
  v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3C8];
  v16 = [v4 unitString];
  [v14 raise:v15, @"Unsupported unit for standard glucose range: %@", v16 format];

  uint64_t v8 = +[HKUnit _milligramsPerDeciliterUnit];
  id v13 = [a1 ATTDLevel2HypoglycemicRangeWithUnit:v8];
LABEL_7:

  return v13;
}

+ (id)ATTDLevel1HypoglycemicRangeWithUnit:(id)a3
{
  id v4 = a3;
  id v5 = +[HKUnit _milligramsPerDeciliterUnit];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [HKQuantityRange alloc];
    uint64_t v8 = +[HKQuantity quantityWithUnit:v4 doubleValue:54.0];
    double v9 = 70.0;
LABEL_5:
    BOOL v12 = +[HKQuantity quantityWithUnit:v4 doubleValue:v9];
    id v13 = [(HKQuantityRange *)v7 initWithMinimum:v8 maximum:v12 isMinimumInclusive:1 isMaximumInclusive:0];

    goto LABEL_7;
  }
  v10 = +[HKUnit _millimolesBloodGlucosePerLiterUnit];
  int v11 = [v4 isEqual:v10];

  if (v11)
  {
    uint64_t v7 = [HKQuantityRange alloc];
    uint64_t v8 = +[HKQuantity quantityWithUnit:v4 doubleValue:3.0];
    double v9 = 3.9;
    goto LABEL_5;
  }
  v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3C8];
  v16 = [v4 unitString];
  [v14 raise:v15, @"Unsupported unit for standard glucose range: %@", v16 format];

  uint64_t v8 = +[HKUnit _milligramsPerDeciliterUnit];
  id v13 = [a1 ATTDLevel1HypoglycemicRangeWithUnit:v8];
LABEL_7:

  return v13;
}

+ (id)ATTDEuglycemicRangeWithUnit:(id)a3
{
  id v4 = a3;
  id v5 = +[HKUnit _milligramsPerDeciliterUnit];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = +[HKQuantity quantityWithUnit:v4 doubleValue:70.0];
    double v8 = 180.0;
LABEL_5:
    int v11 = +[HKQuantity quantityWithUnit:v4 doubleValue:v8];
    BOOL v12 = +[HKQuantityRange inclusiveRangeWithMinimum:v7 maximum:v11];

    goto LABEL_7;
  }
  double v9 = +[HKUnit _millimolesBloodGlucosePerLiterUnit];
  int v10 = [v4 isEqual:v9];

  if (v10)
  {
    uint64_t v7 = +[HKQuantity quantityWithUnit:v4 doubleValue:3.9];
    double v8 = 10.0;
    goto LABEL_5;
  }
  id v13 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v14 = *MEMORY[0x1E4F1C3C8];
  uint64_t v15 = [v4 unitString];
  [v13 raise:v14, @"Unsupported unit for standard glucose range: %@", v15 format];

  uint64_t v7 = +[HKUnit _milligramsPerDeciliterUnit];
  BOOL v12 = [a1 ATTDEuglycemicRangeWithUnit:v7];
LABEL_7:

  return v12;
}

+ (id)ATTDHyperglycemicRangeWithUnit:(id)a3
{
  id v4 = a3;
  id v5 = +[HKUnit _milligramsPerDeciliterUnit];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [HKQuantityRange alloc];
    double v8 = 180.0;
LABEL_5:
    int v11 = +[HKQuantity quantityWithUnit:v4 doubleValue:v8];
    BOOL v12 = +[HKQuantity quantityWithUnit:v4 doubleValue:1.79769313e308];
    id v13 = [(HKQuantityRange *)v7 initWithMinimum:v11 maximum:v12 isMinimumInclusive:0 isMaximumInclusive:1];

    goto LABEL_7;
  }
  double v9 = +[HKUnit _millimolesBloodGlucosePerLiterUnit];
  int v10 = [v4 isEqual:v9];

  if (v10)
  {
    uint64_t v7 = [HKQuantityRange alloc];
    double v8 = 10.0;
    goto LABEL_5;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3C8];
  v16 = [v4 unitString];
  [v14 raise:v15, @"Unsupported unit for standard glucose range: %@", v16 format];

  int v11 = +[HKUnit _milligramsPerDeciliterUnit];
  id v13 = [a1 ATTDHyperglycemicRangeWithUnit:v11];
LABEL_7:

  return v13;
}

+ (id)ATTDGlycemicRangesWithUnit:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 ATTDLevel2HypoglycemicRangeWithUnit:v4];
  v11[0] = v5;
  int v6 = [a1 ATTDLevel1HypoglycemicRangeWithUnit:v4];
  v11[1] = v6;
  uint64_t v7 = [a1 ATTDEuglycemicRangeWithUnit:v4];
  v11[2] = v7;
  double v8 = [a1 ATTDHyperglycemicRangeWithUnit:v4];

  v11[3] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];

  return v9;
}

@end