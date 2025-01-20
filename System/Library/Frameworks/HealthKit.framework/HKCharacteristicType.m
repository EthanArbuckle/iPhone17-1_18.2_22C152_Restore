@interface HKCharacteristicType
- (BOOL)_validateCharacteristic:(id)a3 error:(id *)a4;
- (HKCharacteristicType)initWithIdentifier:(id)a3;
- (id)_canoncialUnit;
- (id)_relatedCategoryType;
- (id)_relatedQuantityType;
- (id)_relatedSampleForInsertionWithCharacteristicValue:(id)a3;
@end

@implementation HKCharacteristicType

- (id)_canoncialUnit
{
  int64_t v2 = [(HKObjectType *)self code];
  if ((unint64_t)(v2 - 84) < 2)
  {
    v3 = @"kg";
    goto LABEL_7;
  }
  if ((unint64_t)(v2 - 175) < 2)
  {
    v3 = @"d";
LABEL_7:
    v4 = +[HKUnit unitFromString:v3];
    goto LABEL_8;
  }
  if (v2 == 86)
  {
    v3 = @"m";
    goto LABEL_7;
  }
  v4 = 0;
LABEL_8:

  return v4;
}

- (HKCharacteristicType)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[HKObjectType characteristicTypeForIdentifier:v4];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid %@ identifier \"%@\"", objc_opt_class(), v4 format];
  }

  return v5;
}

- (BOOL)_validateCharacteristic:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(HKObjectType *)self code];
    if (v8 > 174)
    {
      if ((unint64_t)(v8 - 175) < 2)
      {
        v10 = @"d";
        goto LABEL_15;
      }
      if (v8 == 218)
      {
        v12 = (HKCharacteristicType *)v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          char v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid cardio fitness medications use type %@, expected parameter of class %@", v12, objc_opt_class());
          goto LABEL_16;
        }
        unint64_t v28 = [(HKCharacteristicType *)v12 unsignedIntegerValue];
        if (v28 < 4)
        {
          BOOL v11 = 1;
          goto LABEL_34;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid %@: %d", @"_HKDataTypeCardioFitnessMedicationsUse", v28);
LABEL_47:
        BOOL v11 = 0;
        goto LABEL_34;
      }
      if (v8 != 177)
      {
LABEL_39:
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"self", objc_opt_class(), a2, @"Unhandled data type code %ld", -[HKObjectType code](self, "code"));
        v29 = (HKCharacteristicType *)(id)objc_claimAutoreleasedReturnValue();
        v12 = v29;
        if (v29)
        {
          if (a4) {
            *a4 = v29;
          }
          else {
            _HKLogDroppedError(v29);
          }
        }

        goto LABEL_47;
      }
    }
    else
    {
      char v9 = v8 - 66;
      if ((unint64_t)(v8 - 66) <= 0x25)
      {
        if (((1 << v9) & 0x2000400001) != 0) {
          goto LABEL_22;
        }
        if (((1 << v9) & 0xC0000) != 0)
        {
          v10 = @"kg";
LABEL_15:
          v12 = +[HKUnit unitFromString:v10];
          char v13 = _HDValidatePositiveQuantityValue(self, v7, v12, a4);
LABEL_16:
          BOOL v11 = v13;
LABEL_34:

          goto LABEL_35;
        }
        if (v8 == 86)
        {
          v10 = @"m";
          goto LABEL_15;
        }
      }
      if (v8 != 64)
      {
        if (v8 == 65)
        {
          v12 = self;
          id v14 = v7;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v14 calendar];
            v16 = [v15 calendarIdentifier];
            char v17 = [v16 isEqualToString:*MEMORY[0x1E4F1C318]];

            if ((v17 & 1) == 0)
            {
              v18 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v19 = objc_opt_class();
              uint64_t v20 = [(HKObjectType *)v12 identifier];
              v21 = (void *)v20;
              v22 = @"Invalid value %@ for %@: date components must specify a Gregorian calendar";
LABEL_27:
              objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", @"value", v19, sel__validateCharacteristic_error_, v22, v14, v20, v30);
              goto LABEL_28;
            }
            goto LABEL_24;
          }
          goto LABEL_25;
        }
        goto LABEL_39;
      }
    }
LABEL_22:
    v12 = self;
    id v14 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!HKCharacteristicTypeAcceptsValue(-[HKObjectType code](v12, "code"), [v14 integerValue]))
      {
        v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = [(HKObjectType *)v12 identifier];
        v21 = (void *)v20;
        v22 = @"Invalid value %@ for %@";
        goto LABEL_27;
      }
LABEL_24:
      BOOL v11 = 1;
LABEL_33:

      goto LABEL_34;
    }
LABEL_25:
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = objc_opt_class();
    v21 = [(HKObjectType *)v12 identifier];
    objc_msgSend(v23, "hk_errorForInvalidArgument:class:selector:format:", @"value", v24, sel__validateCharacteristic_error_, @"Invalid value %@ for %@: expected parameter of class %@", v14, v21, objc_opt_class());
LABEL_28:
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = v25;
    if (v25)
    {
      if (a4)
      {
        id v26 = v25;
        *a4 = v26;
      }
      else
      {
        _HKLogDroppedError(v25);
      }
    }

    BOOL v11 = 0;
    goto LABEL_33;
  }
  BOOL v11 = 1;
LABEL_35:

  return v11;
}

- (id)_relatedQuantityType
{
  int64_t v2 = [(HKObjectType *)self code];
  if ((unint64_t)(v2 - 84) > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = +[HKObjectType quantityTypeForIdentifier:*off_1E58C8598[v2 - 84]];
  }

  return v3;
}

- (id)_relatedCategoryType
{
  int64_t v2 = [(HKObjectType *)self code];
  if (v2 == 177)
  {
    uint64_t v3 = 190;
    goto LABEL_5;
  }
  if (v2 == 103)
  {
    uint64_t v3 = 112;
LABEL_5:
    id v4 = +[HKObjectType dataTypeWithCode:v3];
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (id)_relatedSampleForInsertionWithCharacteristicValue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [(HKCharacteristicType *)self _relatedQuantityType];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"HKCharacteristicType+HKAdditions.m", 122, @"Invalid parameter not satisfying: %@", @"[characteristic isKindOfClass:[HKQuantity class]]" object file lineNumber description];
      }
      id v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = +[HKQuantitySample quantitySampleWithType:v6 quantity:v5 startDate:v7 endDate:v7];
    }
    else
    {
      id v7 = [(HKCharacteristicType *)self _relatedCategoryType];
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:a2, self, @"HKCharacteristicType+HKAdditions.m", 133, @"Invalid parameter not satisfying: %@", @"[characteristic isKindOfClass:[NSNumber class]]" object file lineNumber description];
        }
        char v9 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v8 = +[HKCategorySample categorySampleWithType:value:startDate:endDate:](HKCategorySample, "categorySampleWithType:value:startDate:endDate:", v7, [v5 longValue], v9, v9);
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end