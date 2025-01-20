@interface HKAudiogramSensitivityPointClampingRange
+ (BOOL)_validateLowerBound:(id)a3 upperBound:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)clampingRangeWithLowerBound:(id)a3 upperBound:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClampedRange:(id)a3;
- (HKAudiogramSensitivityPointClampingRange)initWithCoder:(id)a3;
- (HKQuantity)lowerBound;
- (HKQuantity)upperBound;
- (id)_initWithLowerBound:(id)a3 upperBound:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAudiogramSensitivityPointClampingRange

- (id)_initWithLowerBound:(id)a3 upperBound:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKAudiogramSensitivityPointClampingRange;
  v9 = [(HKAudiogramSensitivityPointClampingRange *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lowerBound, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)clampingRangeWithLowerBound:(id)a3 upperBound:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a1 _validateLowerBound:v8 upperBound:v9 error:a5])
  {
    v10 = _HKDecibleQuantity(v8);
    v11 = _HKDecibleQuantity(v9);
    id v12 = [[HKAudiogramSensitivityPointClampingRange alloc] _initWithLowerBound:v10 upperBound:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)_validateLowerBound:(id)a3 upperBound:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = (void *)v8;
  if (!(v7 | v8))
  {
    v10 = [NSString stringWithFormat:@"Clamped range must have some bound."];
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = v10;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v13 = [v11 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v12];

    id v14 = v13;
    if (!v14)
    {
LABEL_11:

      BOOL v15 = 0;
      goto LABEL_12;
    }
    if (a5)
    {
LABEL_4:
      id v14 = v14;
      *a5 = v14;
      goto LABEL_11;
    }
LABEL_10:
    _HKLogDroppedError(v14);
    goto LABEL_11;
  }
  BOOL v15 = 1;
  if (v7)
  {
    if (v8)
    {
      [(id)v7 doubleValue];
      double v17 = v16;
      [v9 doubleValue];
      if (v17 > v18)
      {
        v10 = [NSString stringWithFormat:@"Lower bound for clamped range must be less than upper bound."];
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        v24 = v10;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        v21 = [v19 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v20];

        id v14 = v21;
        if (!v14) {
          goto LABEL_11;
        }
        if (a5) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKAudiogramSensitivityPointClampingRange *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(HKAudiogramSensitivityPointClampingRange *)self isEqualToClampedRange:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToClampedRange:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(HKAudiogramSensitivityPointClampingRange *)self lowerBound];
  unint64_t v7 = [v5 lowerBound];
  if (v6 != v7)
  {
    uint64_t v8 = [v5 lowerBound];
    if (!v8)
    {
      char v18 = 0;
      goto LABEL_14;
    }
    v3 = (void *)v8;
    id v9 = [(HKAudiogramSensitivityPointClampingRange *)self lowerBound];
    v10 = [v5 lowerBound];
    if (![v9 isEqual:v10])
    {
      char v18 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v20 = v10;
    v22 = v9;
  }
  v11 = [(HKAudiogramSensitivityPointClampingRange *)self upperBound];
  uint64_t v12 = [v5 upperBound];
  if (v11 == (void *)v12)
  {

    char v18 = 1;
  }
  else
  {
    v13 = (void *)v12;
    uint64_t v14 = [v5 upperBound];
    if (v14)
    {
      BOOL v15 = (void *)v14;
      double v16 = [(HKAudiogramSensitivityPointClampingRange *)self upperBound];
      double v17 = [v5 upperBound];
      char v18 = [v16 isEqual:v17];
    }
    else
    {

      char v18 = 0;
    }
  }
  v10 = v21;
  id v9 = v23;
  if (v6 != v7) {
    goto LABEL_13;
  }
LABEL_14:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(HKAudiogramSensitivityPointClampingRange *)self lowerBound];

  if (v4)
  {
    id v5 = [(HKAudiogramSensitivityPointClampingRange *)self lowerBound];
    [v8 encodeObject:v5 forKey:@"LowerBoundKey"];
  }
  BOOL v6 = [(HKAudiogramSensitivityPointClampingRange *)self upperBound];

  if (v6)
  {
    unint64_t v7 = [(HKAudiogramSensitivityPointClampingRange *)self upperBound];
    [v8 encodeObject:v7 forKey:@"UpperBoundKey"];
  }
}

- (HKAudiogramSensitivityPointClampingRange)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LowerBoundKey"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpperBoundKey"];

  unint64_t v7 = [(HKAudiogramSensitivityPointClampingRange *)self _initWithLowerBound:v5 upperBound:v6];
  return v7;
}

- (HKQuantity)lowerBound
{
  return self->_lowerBound;
}

- (HKQuantity)upperBound
{
  return self->_upperBound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBound, 0);

  objc_storeStrong((id *)&self->_lowerBound, 0);
}

@end