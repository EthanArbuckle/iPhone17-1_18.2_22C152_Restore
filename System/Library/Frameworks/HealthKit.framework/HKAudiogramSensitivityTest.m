@interface HKAudiogramSensitivityTest
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateConductionType:(int64_t)a3 side:(int64_t)a4 error:(id *)a5;
+ (BOOL)validateSensitivity:(id)a3 error:(id *)a4;
+ (BOOL)validateUnitForSensitivity:(id)a3;
+ (id)_rangeViolationMin:(id)a3 max:(id)a4 value:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)masked;
- (HKAudiogramSensitivityPointClampingRange)clampingRange;
- (HKAudiogramSensitivityTest)initWithCoder:(id)a3;
- (HKAudiogramSensitivityTest)initWithSensitivity:(id)a3 type:(int64_t)a4 masked:(BOOL)a5 side:(int64_t)a6 clampingRange:(id)a7 error:(id *)a8;
- (HKQuantity)clampedSensitivity;
- (HKQuantity)sensitivity;
- (id)_initWithSensitivity:(id)a3 type:(int64_t)a4 masked:(BOOL)a5 side:(int64_t)a6 clampingRange:(id)a7;
- (id)description;
- (int64_t)side;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAudiogramSensitivityTest

- (id)_initWithSensitivity:(id)a3 type:(int64_t)a4 masked:(BOOL)a5 side:(int64_t)a6 clampingRange:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HKAudiogramSensitivityTest;
  v14 = [(HKAudiogramSensitivityTest *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    sensitivity = v14->_sensitivity;
    v14->_sensitivity = (HKQuantity *)v15;

    v14->_masked = a5;
    v14->_type = a4;
    v14->_side = a6;
    uint64_t v17 = [v13 copy];
    clampingRange = v14->_clampingRange;
    v14->_clampingRange = (HKAudiogramSensitivityPointClampingRange *)v17;
  }
  return v14;
}

- (HKAudiogramSensitivityTest)initWithSensitivity:(id)a3 type:(int64_t)a4 masked:(BOOL)a5 side:(int64_t)a6 clampingRange:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a7;
  if (+[HKAudiogramSensitivityTest validateUnitForSensitivity:](HKAudiogramSensitivityTest, "validateUnitForSensitivity:", v14)&& +[HKAudiogramSensitivityTest validateSensitivity:error:](HKAudiogramSensitivityTest, "validateSensitivity:error:", v14, a8)&& +[HKAudiogramSensitivityTest validateConductionType:a4 side:a6 error:a8])
  {
    v16 = [[HKAudiogramSensitivityTest alloc] _initWithSensitivity:v14 type:a4 masked:v11 side:a6 clampingRange:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  sensitivity = self->_sensitivity;
  if (self->_type)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", self->_type);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = @"Air";
  }
  BOOL masked = self->_masked;
  int64_t side = self->_side;
  if (side)
  {
    if (side == 1)
    {
      v10 = @"Right";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", self->_side);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = @"Left";
  }
  BOOL v11 = [v3 stringWithFormat:@"<%@:%p sensitivity=%@, type=%@, masked=%d, side=%@, clampingRange=%@>", v5, self, sensitivity, v7, masked, v10, self->_clampingRange];

  return v11;
}

+ (BOOL)validateUnitForSensitivity:(id)a3
{
  id v3 = a3;
  v4 = +[HKUnit decibelHearingLevelUnit];
  char v5 = [v3 isCompatibleWithUnit:v4];

  if ((v5 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Sensitivity must be a decibel unit"];
  }
  return v5;
}

+ (BOOL)validateSensitivity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[HKUnit decibelHearingLevelUnit];
  v8 = +[HKQuantity quantityWithUnit:v7 doubleValue:-20.0];

  v9 = +[HKUnit decibelHearingLevelUnit];
  v10 = +[HKQuantity quantityWithUnit:v9 doubleValue:160.0];

  if ([v6 compare:v8] == -1)
  {
    id v11 = [a1 _rangeViolationMin:v8 max:v10 value:v6];
    if (!v11) {
      goto LABEL_9;
    }
    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  if ([v6 compare:v10] != 1)
  {
    BOOL v12 = 1;
    goto LABEL_11;
  }
  id v11 = [a1 _rangeViolationMin:v8 max:v10 value:v6];
  if (v11)
  {
    if (a4)
    {
LABEL_5:
      id v11 = v11;
      *a4 = v11;
      goto LABEL_9;
    }
LABEL_8:
    _HKLogDroppedError(v11);
  }
LABEL_9:

  BOOL v12 = 0;
LABEL_11:

  return v12;
}

+ (BOOL)validateConductionType:(int64_t)a3 side:(int64_t)a4 error:(id *)a5
{
  if (a3)
  {
    v7 = @"Conduction type must be a valid type";
  }
  else
  {
    if ((unint64_t)a4 < 2) {
      return 1;
    }
    v7 = @"Test side must be a valid side";
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, v7, v5, v6);
  return 0;
}

+ (id)_rangeViolationMin:(id)a3 max:(id)a4 value:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v7 = NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 _unit];
  [v8 doubleValueForUnit:v11];
  uint64_t v13 = v12;

  id v14 = [v10 _unit];
  id v15 = [v14 unitString];
  v16 = [v10 _unit];
  [v10 doubleValueForUnit:v16];
  uint64_t v18 = v17;
  v19 = [v9 _unit];
  [v9 doubleValueForUnit:v19];
  uint64_t v21 = v20;

  v22 = [v10 _unit];

  v23 = [v22 unitString];
  v24 = [v7 stringWithFormat:@"Value %lg %@ is outside the range %lg - %lg %@", v13, v15, v18, v21, v23];

  v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  v30[0] = v24;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  v27 = [v25 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v26];

  return v27;
}

- (HKQuantity)clampedSensitivity
{
  id v3 = [(HKAudiogramSensitivityTest *)self sensitivity];
  v4 = [(HKAudiogramSensitivityTest *)self clampingRange];
  uint64_t v5 = HKAudiogramClampedSensitivityPointQuantity(v3, v4);

  return (HKQuantity *)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (HKAudiogramSensitivityTest *)a3;
  if (self == v6)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      sensitivity = self->_sensitivity;
      id v9 = [(HKAudiogramSensitivityTest *)v7 sensitivity];
      if (sensitivity != v9)
      {
        uint64_t v10 = [(HKAudiogramSensitivityTest *)v7 sensitivity];
        if (!v10)
        {
          char v12 = 0;
          goto LABEL_21;
        }
        id v3 = (void *)v10;
        id v11 = self->_sensitivity;
        v4 = [(HKAudiogramSensitivityTest *)v7 sensitivity];
        if (![(HKQuantity *)v11 isEqual:v4])
        {
          char v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      int64_t type = self->_type;
      if (type == [(HKAudiogramSensitivityTest *)v7 type])
      {
        BOOL masked = self->_masked;
        if (masked == [(HKAudiogramSensitivityTest *)v7 masked])
        {
          int64_t side = self->_side;
          if (side == [(HKAudiogramSensitivityTest *)v7 side])
          {
            clampingRange = self->_clampingRange;
            uint64_t v17 = [(HKAudiogramSensitivityTest *)v7 clampingRange];
            if (clampingRange == (HKAudiogramSensitivityPointClampingRange *)v17)
            {

              char v12 = 1;
              goto LABEL_19;
            }
            uint64_t v18 = (void *)v17;
            uint64_t v19 = [(HKAudiogramSensitivityTest *)v7 clampingRange];
            if (v19)
            {
              uint64_t v20 = (void *)v19;
              uint64_t v21 = self->_clampingRange;
              v22 = [(HKAudiogramSensitivityTest *)v7 clampingRange];
              char v12 = [(HKAudiogramSensitivityPointClampingRange *)v21 isEqual:v22];

              goto LABEL_19;
            }
          }
        }
      }
      char v12 = 0;
LABEL_19:
      if (sensitivity != v9) {
        goto LABEL_20;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v12 = 0;
  }
LABEL_22:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sensitivity = self->_sensitivity;
  id v5 = a3;
  [v5 encodeObject:sensitivity forKey:@"Sensitivity"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeBool:self->_masked forKey:@"Masked"];
  [v5 encodeInteger:self->_side forKey:@"Side"];
  [v5 encodeObject:self->_clampingRange forKey:@"ClampingRange"];
}

- (HKAudiogramSensitivityTest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sensitivity"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"Type"];
  uint64_t v7 = [v4 decodeBoolForKey:@"Masked"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"Side"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClampingRange"];

  uint64_t v10 = [(HKAudiogramSensitivityTest *)self _initWithSensitivity:v5 type:v6 masked:v7 side:v8 clampingRange:v9];
  return v10;
}

- (HKQuantity)sensitivity
{
  return self->_sensitivity;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)masked
{
  return self->_masked;
}

- (int64_t)side
{
  return self->_side;
}

- (HKAudiogramSensitivityPointClampingRange)clampingRange
{
  return self->_clampingRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clampingRange, 0);

  objc_storeStrong((id *)&self->_sensitivity, 0);
}

@end