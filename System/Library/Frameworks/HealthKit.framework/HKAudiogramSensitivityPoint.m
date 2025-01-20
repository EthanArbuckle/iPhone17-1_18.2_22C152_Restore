@interface HKAudiogramSensitivityPoint
+ (BOOL)_validateAirConductionTests:(id)a3 error:(id *)a4;
+ (BOOL)_validateUnitForFrequency:(id)a3;
+ (BOOL)_validateUnitForSensitivity:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validFrequency:(id)a3 error:(id *)a4;
+ (BOOL)validSensitivity:(id)a3 error:(id *)a4;
+ (HKAudiogramSensitivityPoint)sensitivityPointWithFrequency:(HKQuantity *)frequency leftEarSensitivity:(HKQuantity *)leftEarSensitivity rightEarSensitivity:(HKQuantity *)rightEarSensitivity error:(NSError *)error;
+ (HKAudiogramSensitivityPoint)sensitivityPointWithFrequency:(id)a3 tests:(id)a4 error:(id *)a5;
+ (id)_createTestsFromLeftEarSensitivity:(id)a3 rightEarSensitivity:(id)a4 leftEarClampingRange:(id)a5 rightEarClampingRange:(id)a6 error:(id *)a7;
+ (id)_incompatibleUnit:(id)a3 incompatibleWith:(id)a4;
+ (id)_rangeViolationMin:(id)a3 max:(id)a4 value:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSensitivityPoint:(id)a3;
- (HKAudiogramSensitivityPoint)initWithCoder:(id)a3;
- (HKAudiogramSensitivityPoint)initWithFrequency:(id)a3 leftEarSensitivity:(id)a4 rightEarSensitivity:(id)a5;
- (HKAudiogramSensitivityPoint)initWithFrequency:(id)a3 tests:(id)a4;
- (HKQuantity)frequency;
- (HKQuantity)leftEarSensitivity;
- (HKQuantity)rightEarSensitivity;
- (NSArray)tests;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAudiogramSensitivityPoint

- (HKAudiogramSensitivityPoint)initWithFrequency:(id)a3 leftEarSensitivity:(id)a4 rightEarSensitivity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKAudiogramSensitivityPoint;
  v12 = [(HKAudiogramSensitivityPoint *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_frequency, a3);
    objc_storeStrong((id *)&v13->_leftEarSensitivity, a4);
    objc_storeStrong((id *)&v13->_rightEarSensitivity, a5);
    id v18 = 0;
    v14 = +[HKAudiogramSensitivityPoint _createTestsFromLeftEarSensitivity:v10 rightEarSensitivity:v11 leftEarClampingRange:0 rightEarClampingRange:0 error:&v18];
    id v15 = v18;
    if (v14)
    {
      objc_storeStrong((id *)&v13->_tests, v14);
    }
    else
    {
      _HKInitializeLogging();
      v16 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
        -[HKAudiogramSensitivityPoint initWithFrequency:leftEarSensitivity:rightEarSensitivity:]((uint64_t)v15, v16);
      }
    }
  }
  return v13;
}

- (HKAudiogramSensitivityPoint)initWithFrequency:(id)a3 tests:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HKAudiogramSensitivityPoint;
  id v9 = [(HKAudiogramSensitivityPoint *)&v42 init];
  id v10 = v9;
  if (v9)
  {
    id v33 = v7;
    objc_storeStrong((id *)&v9->_frequency, a3);
    objc_storeStrong((id *)&v10->_tests, a4);
    id v11 = objc_msgSend(v8, "hk_filter:", &__block_literal_global_134);
    v12 = objc_msgSend(v11, "hk_filter:", &__block_literal_global_6_1);
    v13 = objc_msgSend(v11, "hk_filter:", &__block_literal_global_8_1);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_super v19 = *(void **)(*((void *)&v38 + 1) + 8 * v18);
        int v20 = [v19 masked];
        uint64_t v21 = [v19 sensitivity];
        leftEarSensitivity = v10->_leftEarSensitivity;
        v10->_leftEarSensitivity = (HKQuantity *)v21;

        if (!v20) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v13;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
LABEL_12:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v34 + 1) + 8 * v27);
        int v29 = [v28 masked];
        uint64_t v30 = [v28 sensitivity];
        rightEarSensitivity = v10->_rightEarSensitivity;
        v10->_rightEarSensitivity = (HKQuantity *)v30;

        if (!v29) {
          break;
        }
        if (v25 == ++v27)
        {
          uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v25) {
            goto LABEL_12;
          }
          break;
        }
      }
    }

    id v7 = v33;
  }

  return v10;
}

BOOL __55__HKAudiogramSensitivityPoint_initWithFrequency_tests___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 0;
}

BOOL __55__HKAudiogramSensitivityPoint_initWithFrequency_tests___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 side] == 0;
}

BOOL __55__HKAudiogramSensitivityPoint_initWithFrequency_tests___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 side] == 1;
}

+ (HKAudiogramSensitivityPoint)sensitivityPointWithFrequency:(id)a3 tests:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([a1 _validateUnitForFrequency:v8]
    && +[HKAudiogramSensitivityPoint validFrequency:v8 error:a5])
  {
    if ([v9 count])
    {
      if (+[HKAudiogramSensitivityPoint _validateAirConductionTests:v9 error:a5])
      {
        id v10 = [[HKAudiogramSensitivityPoint alloc] initWithFrequency:v8 tests:v9];
        goto LABEL_12;
      }
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"There must be at least one test conducted"];
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = v11;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v14 = [v12 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v13];

      id v15 = v14;
      uint64_t v16 = v15;
      if (v15)
      {
        if (a5) {
          *a5 = v15;
        }
        else {
          _HKLogDroppedError(v15);
        }
      }
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

+ (HKAudiogramSensitivityPoint)sensitivityPointWithFrequency:(HKQuantity *)frequency leftEarSensitivity:(HKQuantity *)leftEarSensitivity rightEarSensitivity:(HKQuantity *)rightEarSensitivity error:(NSError *)error
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = frequency;
  id v11 = leftEarSensitivity;
  v12 = rightEarSensitivity;
  if ([a1 _validateUnitForFrequency:v10]
    && [a1 _validateUnitForSensitivity:v11]
    && [a1 _validateUnitForSensitivity:v12]
    && +[HKAudiogramSensitivityPoint validFrequency:error:](HKAudiogramSensitivityPoint, "validFrequency:error:", v10, error)&& +[HKAudiogramSensitivityPoint validSensitivity:error:](HKAudiogramSensitivityPoint, "validSensitivity:error:", v11, error)&& +[HKAudiogramSensitivityPoint validSensitivity:v12 error:error])
  {
    int v13 = HKProgramSDKAtLeast();
    if (v12 || v11 || !v13)
    {
      int v20 = +[HKAudiogramSensitivityPoint _createTestsFromLeftEarSensitivity:v11 rightEarSensitivity:v12 leftEarClampingRange:0 rightEarClampingRange:0 error:error];
      if (v20) {
        uint64_t v21 = [[HKAudiogramSensitivityPoint alloc] initWithFrequency:v10 tests:v20];
      }
      else {
        uint64_t v21 = 0;
      }

      goto LABEL_20;
    }
    id v14 = [NSString stringWithFormat:@"At least one sensitivity (left or right) must be set"];
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v16];

    id v18 = v17;
    objc_super v19 = v18;
    if (v18)
    {
      if (error) {
        *error = (NSError *)v18;
      }
      else {
        _HKLogDroppedError(v18);
      }
    }
  }
  uint64_t v21 = 0;
LABEL_20:

  return v21;
}

+ (id)_incompatibleUnit:(id)a3 incompatibleWith:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = NSString;
  id v6 = a4;
  id v7 = [a3 unitString];
  id v8 = [v6 unitString];

  id v9 = [v5 stringWithFormat:@"Unit '%@' is not compatible with unit '%@'", v7, v8];

  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  v15[0] = v9;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12 = [v10 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v11];

  return v12;
}

+ (id)_rangeViolationMin:(id)a3 max:(id)a4 value:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 _unit];
  [v8 doubleValueForUnit:v11];
  uint64_t v13 = v12;

  uint64_t v14 = [v10 _unit];
  id v15 = [v14 unitString];
  uint64_t v16 = [v10 _unit];
  [v10 doubleValueForUnit:v16];
  uint64_t v18 = v17;
  objc_super v19 = [v9 _unit];
  [v9 doubleValueForUnit:v19];
  uint64_t v21 = v20;

  v22 = [v10 _unit];

  uint64_t v23 = [v22 unitString];
  uint64_t v24 = [v7 stringWithFormat:@"Value %lg %@ is outside the range %lg - %lg %@", v13, v15, v18, v21, v23];

  uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  v30[0] = v24;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v27 = [v25 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v26];

  return v27;
}

+ (BOOL)validFrequency:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKUnit hertzUnit];
  char v8 = [v6 isCompatibleWithUnit:v7];

  if (v8)
  {
    id v9 = +[HKUnit hertzUnit];
    id v10 = +[HKQuantity quantityWithUnit:v9 doubleValue:0.0];

    id v11 = +[HKUnit hertzUnit];
    uint64_t v12 = +[HKQuantity quantityWithUnit:v11 doubleValue:30000.0];

    if ([v6 compare:v10] != -1 && objc_msgSend(v6, "compare:", v12) != 1)
    {
      BOOL v16 = 1;
      goto LABEL_11;
    }
    uint64_t v13 = [a1 _rangeViolationMin:v10 max:v12 value:v6];
  }
  else
  {
    id v10 = [v6 _unit];
    uint64_t v12 = +[HKUnit hertzUnit];
    uint64_t v13 = [a1 _incompatibleUnit:v10 incompatibleWith:v12];
  }
  id v14 = v13;
  id v15 = v14;
  if (v14)
  {
    if (a4)
    {
      id v15 = v14;
      *a4 = v15;
    }
    else
    {
      _HKLogDroppedError(v14);
    }
  }

  BOOL v16 = 0;
LABEL_11:

  return v16;
}

+ (BOOL)validSensitivity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = +[HKUnit decibelHearingLevelUnit];
    char v8 = [v6 isCompatibleWithUnit:v7];

    if (v8)
    {
      id v9 = +[HKUnit decibelHearingLevelUnit];
      id v10 = +[HKQuantity quantityWithUnit:v9 doubleValue:-20.0];

      id v11 = +[HKUnit decibelHearingLevelUnit];
      uint64_t v12 = +[HKQuantity quantityWithUnit:v11 doubleValue:160.0];

      if ([v6 compare:v10] != -1 && objc_msgSend(v6, "compare:", v12) != 1)
      {
        BOOL v14 = 1;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v13 = [a1 _rangeViolationMin:v10 max:v12 value:v6];
    }
    else
    {
      id v10 = [v6 _unit];
      uint64_t v12 = +[HKUnit decibelHearingLevelUnit];
      uint64_t v13 = [a1 _incompatibleUnit:v10 incompatibleWith:v12];
    }
    id v15 = v13;
    id v16 = v15;
    if (v15)
    {
      if (a4)
      {
        id v16 = v15;
        *a4 = v16;
      }
      else
      {
        _HKLogDroppedError(v15);
      }
    }

    BOOL v14 = 0;
    goto LABEL_13;
  }
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

+ (BOOL)_validateUnitForSensitivity:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 _unit];
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = (void *)v6;
  char v8 = +[HKUnit decibelHearingLevelUnit];
  char v9 = [v5 isCompatibleWithUnit:v8];

  if (v9)
  {
LABEL_4:
    BOOL v10 = 1;
  }
  else
  {
LABEL_5:
    id v11 = [v5 _unit];
    uint64_t v12 = +[HKUnit decibelHearingLevelUnit];
    uint64_t v13 = [a1 _incompatibleUnit:v11 incompatibleWith:v12];

    BOOL v14 = (void *)MEMORY[0x1E4F1CA00];
    id v15 = [v13 localizedDescription];
    [v14 raise:@"_HKObjectValidationFailureException", @"%@", v15 format];

    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_validateUnitForFrequency:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Frequency is missing for sensitivity point."];
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = v13;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v18 = [v16 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v17];

    objc_super v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = [v18 localizedDescription];
    [v19 raise:@"_HKObjectValidationFailureException", @"%@", v20 format];

    goto LABEL_7;
  }
  uint64_t v6 = [v4 _unit];
  if (!v6
    || (id v7 = (void *)v6,
        +[HKUnit hertzUnit],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v5 isCompatibleWithUnit:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    id v11 = [v5 _unit];
    uint64_t v12 = +[HKUnit hertzUnit];
    uint64_t v13 = [a1 _incompatibleUnit:v11 incompatibleWith:v12];

    BOOL v14 = (void *)MEMORY[0x1E4F1CA00];
    id v15 = [v13 localizedDescription];
    [v14 raise:@"_HKObjectValidationFailureException", @"%@", v15 format];

LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

+ (BOOL)_validateAirConductionTests:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a3, "hk_filter:", &__block_literal_global_34_0);
  if ([v5 count])
  {
    if ((unint64_t)[v5 count] >= 3)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Sensitivity Point cannot contain more than 2 tests"];
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = v6;
      char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      char v9 = [v7 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v8];

      id v10 = v9;
      id v11 = v10;
      if (v10)
      {
        if (a4)
        {
          id v11 = v10;
          *a4 = v11;
          uint64_t v12 = v11;
          goto LABEL_17;
        }
        _HKLogDroppedError(v10);
      }
      uint64_t v12 = v11;
      goto LABEL_17;
    }
    uint64_t v6 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_39_1);
    uint64_t v12 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_41_0);
    if ((unint64_t)[v6 count] <= 1 && (unint64_t)objc_msgSend(v12, "count") < 2)
    {
      BOOL v13 = 1;
LABEL_18:

      goto LABEL_19;
    }
    id v11 = [NSString stringWithFormat:@"Sensitivity point cannot contain more than 1 test per ear"];
    BOOL v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    id v21 = v11;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v16 = [v14 errorWithDomain:@"com.apple.healthkit" code:3 userInfo:v15];

    id v17 = v16;
    uint64_t v18 = v17;
    if (v17)
    {
      if (a4) {
        *a4 = v17;
      }
      else {
        _HKLogDroppedError(v17);
      }
    }

LABEL_17:
    BOOL v13 = 0;
    goto LABEL_18;
  }
  BOOL v13 = 1;
LABEL_19:

  return v13;
}

BOOL __65__HKAudiogramSensitivityPoint__validateAirConductionTests_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 0;
}

BOOL __65__HKAudiogramSensitivityPoint__validateAirConductionTests_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 side] == 0;
}

BOOL __65__HKAudiogramSensitivityPoint__validateAirConductionTests_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 side] == 1;
}

+ (id)_createTestsFromLeftEarSensitivity:(id)a3 rightEarSensitivity:(id)a4 leftEarClampingRange:(id)a5 rightEarClampingRange:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v11)
  {
    id v16 = 0;
    if (!v12)
    {
LABEL_8:
      id v17 = (HKAudiogramSensitivityTest *)v15;
      goto LABEL_10;
    }
LABEL_6:
    id v17 = [[HKAudiogramSensitivityTest alloc] initWithSensitivity:v12 type:0 masked:0 side:1 clampingRange:v14 error:a7];
    if (!v17) {
      goto LABEL_10;
    }
    [v15 addObject:v17];

    goto LABEL_8;
  }
  id v16 = [[HKAudiogramSensitivityTest alloc] initWithSensitivity:v11 type:0 masked:0 side:0 clampingRange:v13 error:a7];
  if (v16)
  {
    [v15 addObject:v16];
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v17 = 0;
LABEL_10:

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p frequency=%@, tests=%@>", v5, self, self->_frequency, self->_tests];

  return v6;
}

- (HKQuantity)frequency
{
  return self->_frequency;
}

- (HKQuantity)leftEarSensitivity
{
  return self->_leftEarSensitivity;
}

- (HKQuantity)rightEarSensitivity
{
  return self->_rightEarSensitivity;
}

- (NSArray)tests
{
  return self->_tests;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKAudiogramSensitivityPoint *)a3;
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
    BOOL v6 = [(HKAudiogramSensitivityPoint *)self isEqualToSensitivityPoint:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToSensitivityPoint:(id)a3
{
  id v8 = a3;
  char v9 = [(HKAudiogramSensitivityPoint *)self frequency];
  id v10 = [v8 frequency];
  if (v9 != v10)
  {
    uint64_t v11 = [v8 frequency];
    if (!v11)
    {
      char v12 = 0;
      goto LABEL_40;
    }
    v5 = (void *)v11;
    v3 = [(HKAudiogramSensitivityPoint *)self frequency];
    id v4 = [v8 frequency];
    if (![v3 isEqual:v4])
    {
      char v12 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }
  id v13 = [(HKAudiogramSensitivityPoint *)self leftEarSensitivity];
  id v14 = [v8 leftEarSensitivity];
  if (v13 == v14)
  {
    v43 = v13;
    goto LABEL_11;
  }
  uint64_t v15 = [v8 leftEarSensitivity];
  if (v15)
  {
    uint64_t v45 = v4;
    id v16 = v3;
    id v17 = v5;
    long long v41 = (void *)v15;
    BOOL v6 = [(HKAudiogramSensitivityPoint *)self leftEarSensitivity];
    uint64_t v18 = [v8 leftEarSensitivity];
    if (([v6 isEqual:v18] & 1) == 0)
    {

      char v12 = 0;
      v5 = v17;
      v3 = v16;
      id v4 = v45;
      if (v9 == v10) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    long long v37 = v18;
    v43 = v13;
    v5 = v17;
    v3 = v16;
    id v4 = v45;
LABEL_11:
    uint64_t v19 = [(HKAudiogramSensitivityPoint *)self rightEarSensitivity];
    v44 = [v8 rightEarSensitivity];
    objc_super v42 = (void *)v19;
    long long v40 = v6;
    if ((void *)v19 == v44)
    {
      long long v38 = v3;
      long long v39 = v14;
      v46 = v4;
      [(HKAudiogramSensitivityPoint *)self tests];
    }
    else
    {
      uint64_t v20 = [v8 rightEarSensitivity];
      if (!v20)
      {
        char v12 = 0;
        uint64_t v29 = (void *)v19;
        goto LABEL_26;
      }
      long long v39 = v14;
      long long v36 = (void *)v20;
      id v21 = [(HKAudiogramSensitivityPoint *)self rightEarSensitivity];
      id v14 = [v8 rightEarSensitivity];
      if (([v21 isEqual:v14] & 1) == 0)
      {

        char v12 = 0;
        id v13 = v43;
        id v14 = v39;
        BOOL v31 = v43 == v39;
LABEL_35:
        if (!v31)
        {
        }
        goto LABEL_37;
      }
      v46 = v4;
      long long v38 = v3;
      [(HKAudiogramSensitivityPoint *)self tests];
    uint64_t v22 = };
    uint64_t v23 = [v8 tests];
    char v12 = v22 == (void *)v23;
    if (v22 == (void *)v23)
    {

      uint64_t v29 = v42;
      if (v42 == v44) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v24 = (void *)v23;
      long long v35 = v5;
      uint64_t v25 = [v8 tests];
      if (v25)
      {
        uint64_t v26 = (void *)v25;
        uint64_t v27 = [(HKAudiogramSensitivityPoint *)self tests];
        v28 = [v8 tests];
        char v12 = [v27 isEqualToArray:v28];

        if (v42 == v44)
        {
        }
        else
        {
        }
        id v13 = v43;
        v3 = v38;
        id v14 = v39;
        BOOL v31 = v43 == v39;
        v5 = v35;
        id v4 = v46;
        goto LABEL_35;
      }

      uint64_t v29 = v42;
      if (v42 == v44)
      {
LABEL_31:

        uint64_t v30 = v43;
        v3 = v38;
        id v14 = v39;
        id v4 = v46;
        if (v43 == v39) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }

    v3 = v38;
    id v14 = v39;
    id v4 = v46;
LABEL_26:

    uint64_t v30 = v43;
    if (v43 == v14)
    {
LABEL_28:

      goto LABEL_38;
    }
LABEL_27:

    goto LABEL_28;
  }
  char v12 = 0;
LABEL_37:

LABEL_38:
  if (v9 != v10) {
    goto LABEL_39;
  }
LABEL_40:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKAudiogramSensitivityPoint *)self frequency];
  [v4 encodeObject:v5 forKey:@"FrequencyKey"];

  BOOL v6 = [(HKAudiogramSensitivityPoint *)self leftEarSensitivity];
  [v4 encodeObject:v6 forKey:@"LeftEarSensitivityKey"];

  id v7 = [(HKAudiogramSensitivityPoint *)self rightEarSensitivity];
  [v4 encodeObject:v7 forKey:@"RightEarSensitivityKey"];

  id v8 = [(HKAudiogramSensitivityPoint *)self tests];
  [v4 encodeObject:v8 forKey:@"TestsKey"];
}

- (HKAudiogramSensitivityPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FrequencyKey"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftEarSensitivityKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RightEarSensitivityKey"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftEarClampedRangeKey"];
  char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RightEarClampedRangeKey"];
  id v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"TestsKey"];

  if (v10) {
    goto LABEL_4;
  }
  id v16 = 0;
  uint64_t v11 = +[HKAudiogramSensitivityPoint _createTestsFromLeftEarSensitivity:v6 rightEarSensitivity:v7 leftEarClampingRange:v8 rightEarClampingRange:v9 error:&v16];
  id v12 = v16;
  id v10 = v12;
  if (v11)
  {

    id v10 = (void *)v11;
LABEL_4:
    id v13 = [[HKAudiogramSensitivityPoint alloc] initWithFrequency:v5 tests:v10];
    goto LABEL_5;
  }
  _HKInitializeLogging();
  uint64_t v15 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT)) {
    -[HKAudiogramSensitivityPoint initWithCoder:]((uint64_t)v10, v15);
  }
  id v13 = 0;
LABEL_5:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_rightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_leftEarSensitivity, 0);

  objc_storeStrong((id *)&self->_frequency, 0);
}

- (void)initWithFrequency:(uint64_t)a1 leftEarSensitivity:(NSObject *)a2 rightEarSensitivity:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Unable to create sensitivity point tests with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19C023000, a2, OS_LOG_TYPE_FAULT, "Unable to decode the sensitivity point with error: %@", (uint8_t *)&v2, 0xCu);
}

@end