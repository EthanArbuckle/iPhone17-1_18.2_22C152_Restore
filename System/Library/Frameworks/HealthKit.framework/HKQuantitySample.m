@interface HKQuantitySample
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate device:(HKDevice *)device metadata:(NSDictionary *)metadata;
+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata;
+ (id)_quantitySamplesEnforcingDurationWithType:(id)a3 quantity:(id)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8;
+ (id)_unfrozenQuantitySampleWithQuantityType:(id)a3 quantity:(id)a4 startDate:(id)a5 device:(id)a6;
- (BOOL)_frozen;
- (BOOL)_shouldNotifyOnInsert;
- (HDCodableQuantitySample)codableQuantitySample;
- (HKQuantity)quantity;
- (HKQuantitySample)initWithCoder:(id)a3;
- (NSInteger)count;
- (id)_init;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)_valueDescription;
- (id)asJSONObject;
- (int64_t)_compareFreezeStateWithSample:(id)a3;
- (void)_setCodableQuantitySample:(id)a3;
- (void)_setCount:(int64_t)a3;
- (void)_setFreezing;
- (void)_setFrozen:(BOOL)a3;
- (void)_setQuantity:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKQuantitySample

+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  v13 = quantityType;
  v14 = quantity;
  v15 = startDate;
  v16 = endDate;
  v17 = device;
  v18 = metadata;
  v19 = [(HKObjectType *)v13 dataObjectClass];
  if (v15)
  {
    [(NSDate *)v15 timeIntervalSinceReferenceDate];
    double v21 = v20;
    if (v16)
    {
LABEL_3:
      [(NSDate *)v16 timeIntervalSinceReferenceDate];
      double v23 = v22;
      goto LABEL_6;
    }
  }
  else
  {
    double v21 = 2.22507386e-308;
    if (v16) {
      goto LABEL_3;
    }
  }
  double v23 = 2.22507386e-308;
LABEL_6:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__HKQuantitySample_quantitySampleWithType_quantity_startDate_endDate_device_metadata___block_invoke;
  v27[3] = &unk_1E58C5F88;
  v28 = v14;
  v24 = v14;
  v25 = (void *)[(objc_class *)v19 _newSampleWithType:v13 startDate:v17 endDate:v18 device:v27 metadata:v21 config:v23];

  return (HKQuantitySample *)v25;
}

void __86__HKQuantitySample_quantitySampleWithType_quantity_startDate_endDate_device_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableQuantitySample, 0);

  objc_storeStrong((id *)&self->_quantity, 0);
}

+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (HKQuantitySample *)[a1 quantitySampleWithType:quantityType quantity:quantity startDate:startDate endDate:endDate device:0 metadata:0];
}

- (void)_setQuantity:(id)a3
{
  self->_quantity = (HKQuantity *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySample;
  [(HKSample *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_quantity forKey:@"Quantity"];
  [v4 encodeInteger:self->_count forKey:@"Count"];
  if (!self->_freezeState) {
    [v4 encodeBool:1 forKey:@"Unfrozen"];
  }
}

- (id)_valueDescription
{
  return [(HKQuantity *)self->_quantity description];
}

+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  return (HKQuantitySample *)[a1 quantitySampleWithType:quantityType quantity:quantity startDate:startDate endDate:endDate device:0 metadata:metadata];
}

- (id)asJSONObject
{
  v11.receiver = self;
  v11.super_class = (Class)HKQuantitySample;
  v3 = [(HKSample *)&v11 asJSONObject];
  id v4 = [(HKQuantitySample *)self quantityType];
  objc_super v5 = [v4 canonicalUnit];

  v6 = [v5 description];
  [v3 setObject:v6 forKeyedSubscript:@"unit"];

  v7 = NSNumber;
  v8 = [(HKQuantitySample *)self quantity];
  [v8 doubleValueForUnit:v5];
  v9 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"quantity"];

  return v3;
}

+ (id)_unfrozenQuantitySampleWithQuantityType:(id)a3 quantity:(id)a4 startDate:(id)a5 device:(id)a6
{
  id v9 = a4;
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  [v13 minimumAllowedDuration];
  v14 = objc_msgSend(v10, "dateWithTimeInterval:sinceDate:", v12);
  v15 = (void *)[v13 dataObjectClass];
  [v12 timeIntervalSinceReferenceDate];
  double v17 = v16;

  [v14 timeIntervalSinceReferenceDate];
  double v19 = v18;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__HKQuantitySample__unfrozenQuantitySampleWithQuantityType_quantity_startDate_device___block_invoke;
  v23[3] = &unk_1E58C5F88;
  id v24 = v9;
  id v20 = v9;
  double v21 = (void *)[v15 _newSampleWithType:v13 startDate:v11 endDate:0 device:v23 metadata:v17 config:v19];

  return v21;
}

void __86__HKQuantitySample__unfrozenQuantitySampleWithQuantityType_quantity_startDate_device___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 12, *(id *)(a1 + 32));
  v3 = a2;
  v3[13] = 0;
}

+ (BOOL)_isConcreteObjectClass
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKQuantitySample;
  id result = [(HKSample *)&v3 _init];
  if (result)
  {
    *((void *)result + 14) = 1;
    *((void *)result + 13) = 2;
  }
  return result;
}

- (BOOL)_shouldNotifyOnInsert
{
  return self->_freezeState == 2;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v27.receiver = self;
  v27.super_class = (Class)HKQuantitySample;
  objc_super v5 = -[HKSample _validateWithConfiguration:](&v27, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    goto LABEL_16;
  }
  v8 = [(HKQuantity *)self->_quantity _unit];
  id v9 = [(HKQuantitySample *)self quantityType];
  char v10 = [v9 isCompatibleWithUnit:v8];

  if (v10)
  {
    id v11 = +[HKUnit appleEffortScoreUnit];
    int v12 = [v8 isEqual:v11];

    if (v12)
    {
      [(HKQuantity *)self->_quantity _value];
      double v14 = v13;
      if (v13 < 0.0 || v13 > 10.0)
      {
        double v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = objc_opt_class();
        objc_msgSend(v16, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v17, a2, @"%@ %@ requires a value between 0 and 10. Invalid value: %f"", objc_opt_class(), v8, *(void *)&v14);
LABEL_14:
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    if (self->_count <= 0)
    {
      double v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = objc_opt_class();
      objc_msgSend(v23, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v24, a2, @"%@ %@ requires a count > 0"", objc_opt_class(), self, v26);
      goto LABEL_14;
    }
    id v7 = 0;
  }
  else
  {
    double v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    double v21 = [(HKQuantitySample *)self quantityType];
    double v22 = [v21 dimension];
    objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v19, a2, @"%@ %@ requires unit of type %@. Incompatible unit: %@"", v20, self, v22, v8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

LABEL_16:

  return v7;
}

+ (id)_quantitySamplesEnforcingDurationWithType:(id)a3 quantity:(id)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  [v17 timeIntervalSinceDate:v16];
  double v21 = v20;
  if ([v14 isMaximumDurationRestricted])
  {
    [v14 maximumAllowedDuration];
    if (v21 > v22)
    {
      _HKInitializeLogging();
      double v23 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        id v57 = v17;
        _os_log_fault_impl(&dword_19C023000, v23, OS_LOG_TYPE_FAULT, "Data duration is longer than allowed for type %@, start date %@, end date %@", buf, 0x20u);
      }
      uint64_t v24 = [v14 aggregationStyle];
      if ((unint64_t)(v24 - 1) >= 3)
      {
        if (v24)
        {
          v25 = 0;
        }
        else
        {
          v30 = [v15 _unit];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          id v57 = 0;
          [v15 doubleValueForUnit:v30];
          id v57 = v31;
          double v32 = *(double *)(*(void *)&buf[8] + 24) / v21;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke;
          aBlock[3] = &unk_1E58C5FB0;
          v52 = buf;
          double v53 = v32;
          id v47 = v17;
          id v48 = v30;
          id v54 = a1;
          id v49 = v14;
          id v50 = v18;
          id v51 = v19;
          id v33 = v30;
          v25 = _Block_copy(aBlock);

          _Block_object_dispose(buf, 8);
        }
      }
      else
      {
        uint64_t v37 = MEMORY[0x1E4F143A8];
        uint64_t v38 = 3221225472;
        v39 = __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke_2;
        v40 = &unk_1E58C5FD8;
        id v45 = a1;
        id v41 = v14;
        id v42 = v15;
        id v43 = v18;
        id v44 = v19;
        v25 = _Block_copy(&v37);
      }
      uint64_t v29 = objc_msgSend(a1, "_enumerateValidIntervalsWithStartDate:endDate:sampleType:block:", v16, v17, v14, v25, v37, v38, v39, v40);
      goto LABEL_17;
    }
  }
  if (![v14 isMinimumDurationRestricted]
    || ([v14 minimumAllowedDuration], v21 >= v26))
  {
    v25 = [a1 quantitySampleWithType:v14 quantity:v15 startDate:v16 endDate:v17 device:v18 metadata:v19];
    v55 = v25;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
LABEL_17:
    v28 = (void *)v29;

    goto LABEL_18;
  }
  _HKInitializeLogging();
  objc_super v27 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
  {
    v35 = v27;
    [v14 minimumAllowedDuration];
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    id v57 = v17;
    __int16 v58 = 2048;
    uint64_t v59 = v36;
    _os_log_fault_impl(&dword_19C023000, v35, OS_LOG_TYPE_FAULT, "Not creating any samples because data duration is shorter than allowed for type %@, start date %@, end date %@. Minimum allowed duration for this type is %f", buf, 0x2Au);
  }
  v28 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_18:

  return v28;
}

id __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (objc_msgSend(v6, "hk_isBeforeDate:", *(void *)(a1 + 32)))
  {
    double v8 = *(double *)(a1 + 80);
    [v6 timeIntervalSinceDate:v5];
    double v7 = v8 * v9;
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24)
                                                                - v7;
  }
  char v10 = +[HKQuantity quantityWithUnit:*(void *)(a1 + 40) doubleValue:v7];
  id v11 = [*(id *)(a1 + 88) quantitySampleWithType:*(void *)(a1 + 48) quantity:v10 startDate:v5 endDate:v6 device:*(void *)(a1 + 56) metadata:*(void *)(a1 + 64)];

  return v11;
}

uint64_t __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 64) quantitySampleWithType:*(void *)(a1 + 32) quantity:*(void *)(a1 + 40) startDate:a2 endDate:a3 device:*(void *)(a1 + 48) metadata:*(void *)(a1 + 56)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantitySample)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKQuantitySample;
  id v5 = [(HKSample *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Quantity"];
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v6;

    unint64_t v8 = [v4 decodeIntegerForKey:@"Count"];
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    v5->_count = v9;
    int v10 = [v4 decodeBoolForKey:@"Unfrozen"];
    uint64_t v11 = 2;
    if (v10) {
      uint64_t v11 = 0;
    }
    v5->_freezeState = v11;
  }

  return v5;
}

- (BOOL)_frozen
{
  return self->_freezeState != 0;
}

- (void)_setFrozen:(BOOL)a3
{
  int64_t v3 = 2;
  if (!a3) {
    int64_t v3 = 0;
  }
  self->_freezeState = v3;
}

- (void)_setFreezing
{
  self->_freezeState = 1;
}

- (void)_setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)_compareFreezeStateWithSample:(id)a3
{
  int64_t freezeState = self->_freezeState;
  int64_t v4 = *((void *)a3 + 13);
  BOOL v5 = freezeState < v4;
  int64_t v6 = freezeState > v4;
  if (v5) {
    return -1;
  }
  else {
    return v6;
  }
}

- (NSInteger)count
{
  return self->_count;
}

- (HDCodableQuantitySample)codableQuantitySample
{
  return self->_codableQuantitySample;
}

- (void)_setCodableQuantitySample:(id)a3
{
}

@end