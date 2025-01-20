@interface HKWorkoutZonesSample
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)zonesSampleWithType:(id)a3 zones:(id)a4 device:(id)a5 metadata:(id)a6;
- (BOOL)_validateFirstZone:(id)a3 error:(id *)a4;
- (BOOL)_validateLastZone:(id)a3 error:(id *)a4;
- (BOOL)_validateMiddleZones:(id)a3 previousEndQuantity:(id)a4 error:(id *)a5;
- (BOOL)_validateStartAndEnd:(id)a3 end:(id)a4 error:(id *)a5;
- (BOOL)_validateUnit:(id)a3 error:(id *)a4;
- (BOOL)isEquivalent:(id)a3;
- (HKWorkoutZonesSample)initWithCoder:(id)a3;
- (NSArray)zones;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (void)_setZones:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutZonesSample

+ (id)zonesSampleWithType:(id)a3 zones:(id)a4 device:(id)a5 metadata:(id)a6
{
  id v10 = a4;
  v11 = (void *)MEMORY[0x1E4F1C9C8];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [v11 date];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;
  [v15 timeIntervalSinceReferenceDate];
  double v19 = v18;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__HKWorkoutZonesSample_zonesSampleWithType_zones_device_metadata___block_invoke;
  v23[3] = &unk_1E58C0170;
  id v24 = v10;
  id v20 = v10;
  v21 = (void *)[a1 _newSampleWithType:v14 startDate:v13 endDate:v12 device:v23 metadata:v17 config:v19];

  return v21;
}

void __66__HKWorkoutZonesSample_zonesSampleWithType_zones_device_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  zones = self->_zones;
  v7 = [(HKSample *)self startDate];
  v8 = [(HKObject *)self device];
  v9 = [v3 stringWithFormat:@"<%@:%p zones=%@, startDate=%@, device=%@>", v5, self, zones, v7, v8];

  return v9;
}

- (void)_setZones:(id)a3
{
  self->_zones = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v10.receiver = self;
    v10.super_class = (Class)HKWorkoutZonesSample;
    if (![(HKSample *)&v10 isEquivalent:v5]) {
      goto LABEL_7;
    }
    zones = self->_zones;
    v7 = (NSArray *)v5[12];
    if (zones == v7)
    {
      char v8 = 1;
      goto LABEL_9;
    }
    if (v7) {
      char v8 = -[NSArray isEqualToArray:](zones, "isEqualToArray:");
    }
    else {
LABEL_7:
    }
      char v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  char v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutZonesSample;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_zones, @"Zones", v5.receiver, v5.super_class);
}

- (HKWorkoutZonesSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutZonesSample;
  objc_super v5 = [(HKSample *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    char v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Zones"];
    zones = v5->_zones;
    v5->_zones = (NSArray *)v9;
  }
  return v5;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HKWorkoutZonesSample;
  id v4 = -[HKSample _validateWithConfiguration:](&v22, sel__validateWithConfiguration_, a3.var0, a3.var1);
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    NSUInteger v7 = [(NSArray *)self->_zones count];
    if (v7)
    {
      NSUInteger v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      NSUInteger v11 = v7 - 1;
      while (1)
      {
        objc_super v12 = (void *)v10;
        id v13 = [(NSArray *)self->_zones objectAtIndexedSubscript:v9];
        if (v9)
        {
          if (v11 == v9)
          {
            id v20 = 0;
            BOOL v14 = [(HKWorkoutZonesSample *)self _validateLastZone:v13 error:&v20];
            v15 = v20;
          }
          else
          {
            double v19 = 0;
            BOOL v14 = [(HKWorkoutZonesSample *)self _validateMiddleZones:v13 previousEndQuantity:v10 error:&v19];
            v15 = v19;
          }
        }
        else
        {
          v21 = 0;
          BOOL v14 = [(HKWorkoutZonesSample *)self _validateFirstZone:v13 error:&v21];
          v15 = v21;
        }
        id v16 = v15;
        double v17 = v16;
        if (!v14) {
          break;
        }
        uint64_t v10 = [v13 endQuantity];

        if (v8 == ++v9)
        {
          id v6 = 0;
          objc_super v12 = (void *)v10;
          goto LABEL_15;
        }
      }
      id v6 = v16;

LABEL_15:
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_validateFirstZone:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSUInteger v7 = [v6 endQuantity];
  BOOL v8 = [(HKWorkoutZonesSample *)self _validateUnit:v7 error:a4];

  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = [v6 startQuantity];

  if (!v9)
  {
LABEL_5:
    LOBYTE(v14) = 1;
    goto LABEL_7;
  }
  uint64_t v10 = [v6 startQuantity];
  BOOL v11 = [(HKWorkoutZonesSample *)self _validateUnit:v10 error:a4];

  if (!v11)
  {
LABEL_6:
    LOBYTE(v14) = 0;
    goto LABEL_7;
  }
  objc_super v12 = [v6 startQuantity];
  id v13 = [v6 endQuantity];
  BOOL v14 = [(HKWorkoutZonesSample *)self _validateStartAndEnd:v12 end:v13 error:a4];

  if (v14) {
    goto LABEL_5;
  }
LABEL_7:

  return v14;
}

- (BOOL)_validateLastZone:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSUInteger v7 = [v6 startQuantity];
  BOOL v8 = [(HKWorkoutZonesSample *)self _validateUnit:v7 error:a4];

  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = [v6 endQuantity];

  if (!v9)
  {
LABEL_5:
    LOBYTE(v14) = 1;
    goto LABEL_7;
  }
  uint64_t v10 = [v6 endQuantity];
  BOOL v11 = [(HKWorkoutZonesSample *)self _validateUnit:v10 error:a4];

  if (!v11)
  {
LABEL_6:
    LOBYTE(v14) = 0;
    goto LABEL_7;
  }
  objc_super v12 = [v6 startQuantity];
  id v13 = [v6 endQuantity];
  BOOL v14 = [(HKWorkoutZonesSample *)self _validateStartAndEnd:v12 end:v13 error:a4];

  if (v14) {
    goto LABEL_5;
  }
LABEL_7:

  return v14;
}

- (BOOL)_validateMiddleZones:(id)a3 previousEndQuantity:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 startQuantity];
  if (!v11
    || (objc_super v12 = (void *)v11,
        [v9 endQuantity],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        !v13))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"zone", objc_opt_class(), a2, @"Quantity must not be nil");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v20 = v19 == 0;
    if (v19)
    {
      if (!a5)
      {
LABEL_14:
        _HKLogDroppedError(v19);
        BOOL v20 = 0;
        goto LABEL_15;
      }
LABEL_9:
      id v19 = v19;
      BOOL v20 = 0;
      *a5 = v19;
      BOOL v14 = v19;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v14 = v19;
    goto LABEL_16;
  }
  BOOL v14 = [v9 startQuantity];
  if (![(HKWorkoutZonesSample *)self _validateUnit:v14 error:a5])
  {
    BOOL v20 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v15 = [v9 endQuantity];
  BOOL v16 = [(HKWorkoutZonesSample *)self _validateUnit:v15 error:a5];

  if (v16)
  {
    double v17 = [v9 startQuantity];
    char v18 = [v17 isEqual:v10];

    if (v18)
    {
      BOOL v14 = [v9 startQuantity];
      id v19 = [v9 endQuantity];
      BOOL v20 = [(HKWorkoutZonesSample *)self _validateStartAndEnd:v14 end:v19 error:a5];
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"zone", objc_opt_class(), a2, @"Zone start quantity must match previous zone end quantity");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v20 = v19 == 0;
    if (v19)
    {
      if (!a5) {
        goto LABEL_14;
      }
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)_validateUnit:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = [(HKSample *)self sampleType];
  id v9 = +[HKWorkoutZonesType heartRateType];
  if ([v8 isEqual:v9]) {
    +[HKUnit unitFromString:@"count/min"];
  }
  else {
  id v10 = +[HKUnit wattUnit];
  }

  char v11 = [v7 isCompatibleWithUnit:v10];
  if (v11)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"quantity", objc_opt_class(), a2, @"Quantity has incorrect units");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v14 = v13;
    BOOL v12 = v13 == 0;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError(v13);
      }
    }
  }
  return v12;
}

- (BOOL)_validateStartAndEnd:(id)a3 end:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 compare:v9] == 1 || !objc_msgSend(v8, "compare:", v9))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"start", objc_opt_class(), a2, @"Start quantity must be greater than end quantity");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v12 = v11;
    BOOL v10 = v11 == 0;
    if (v11)
    {
      if (a5) {
        *a5 = v11;
      }
      else {
        _HKLogDroppedError(v11);
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (NSArray)zones
{
  return self->_zones;
}

- (void).cxx_destruct
{
}

@end