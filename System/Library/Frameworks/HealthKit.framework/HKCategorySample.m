@interface HKCategorySample
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate device:(HKDevice *)device metadata:(NSDictionary *)metadata;
+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata;
+ (id)_categorySamplesSplittingDurationWithType:(id)a3 value:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8;
- (BOOL)isEquivalent:(id)a3;
- (HKCategorySample)init;
- (HKCategorySample)initWithCoder:(id)a3;
- (NSInteger)value;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)_valueDescription;
- (void)_setValue:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCategorySample

+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  v14 = type;
  v15 = startDate;
  v16 = endDate;
  v17 = device;
  v18 = metadata;
  if (v15)
  {
    [(NSDate *)v15 timeIntervalSinceReferenceDate];
    double v20 = v19;
    if (v16)
    {
LABEL_3:
      [(NSDate *)v16 timeIntervalSinceReferenceDate];
      double v22 = v21;
      goto LABEL_6;
    }
  }
  else
  {
    double v20 = 2.22507386e-308;
    if (v16) {
      goto LABEL_3;
    }
  }
  double v22 = 2.22507386e-308;
LABEL_6:
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__HKCategorySample_categorySampleWithType_value_startDate_endDate_device_metadata___block_invoke;
  v25[3] = &__block_descriptor_40_e26_v16__0__HKCategorySample_8l;
  v25[4] = value;
  v23 = (void *)[a1 _newSampleWithType:v14 startDate:v17 endDate:v18 device:v25 metadata:v20 config:v22];

  return (HKCategorySample *)v23;
}

uint64_t __83__HKCategorySample_categorySampleWithType_value_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setValue:*(void *)(a1 + 32)];
}

- (void)_setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSInteger)value
{
  v3 = [(HKCategorySample *)self categoryType];
  NSInteger v4 = [v3 _categoryValueForValue:self->_value];

  return v4;
}

- (id)_valueDescription
{
  v2 = [NSNumber numberWithInteger:self->_value];
  v3 = [v2 description];

  return v3;
}

- (HKCategorySample)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  return (HKCategorySample *)[a1 categorySampleWithType:type value:value startDate:startDate endDate:endDate device:0 metadata:metadata];
}

+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (HKCategorySample *)[a1 categorySampleWithType:type value:value startDate:startDate endDate:endDate device:0 metadata:0];
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v19.receiver = self;
  v19.super_class = (Class)HKCategorySample;
  v5 = -[HKSample _validateWithConfiguration:](&v19, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(HKCategorySample *)self categoryType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v10 = [(HKCategorySample *)self categoryType];
      if ([v10 _acceptsValue:self->_value])
      {
        id v7 = 0;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = objc_opt_class();
        int64_t value = self->_value;
        v17 = [(HKCategorySample *)self categoryType];
        objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v15, a2, @"Value %ld is not compatible with type %@"", value, v17);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = objc_opt_class();
      v13 = [(HKCategorySample *)self categoryType];
      objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v12, a2, @"Data type %@ must be of type %@"", v13, objc_opt_class());
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

+ (id)_categorySamplesSplittingDurationWithType:(id)a3 value:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 isMaximumDurationRestricted]
    && ([v16 timeIntervalSinceDate:v15],
        double v20 = v19,
        [v14 maximumAllowedDuration],
        v20 > v21))
  {
    _HKInitializeLogging();
    double v22 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v14;
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_fault_impl(&dword_19C023000, v22, OS_LOG_TYPE_FAULT, "Data duration is longer than allowed for type %@, start date %@, end date %@", buf, 0x20u);
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __102__HKCategorySample__categorySamplesSplittingDurationWithType_value_startDate_endDate_device_metadata___block_invoke;
    v26[3] = &unk_1E58C8B80;
    id v30 = a1;
    id v27 = v14;
    int64_t v31 = a4;
    id v28 = v17;
    id v29 = v18;
    v23 = [a1 _enumerateValidIntervalsWithStartDate:v15 endDate:v16 sampleType:v27 block:v26];

    v24 = v27;
  }
  else
  {
    v24 = [a1 categorySampleWithType:v14 value:a4 startDate:v15 endDate:v16 device:v17 metadata:v18];
    v32 = v24;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  }

  return v23;
}

uint64_t __102__HKCategorySample__categorySamplesSplittingDurationWithType_value_startDate_endDate_device_metadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 56) categorySampleWithType:*(void *)(a1 + 32) value:*(void *)(a1 + 64) startDate:a2 endDate:a3 device:*(void *)(a1 + 40) metadata:*(void *)(a1 + 48)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCategorySample)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKCategorySample;
  v5 = [(HKSample *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"value"];
    id v7 = [(HKCategorySample *)v5 categoryType];
    char v8 = [v7 _acceptsValue:v6];

    if ((v8 & 1) == 0)
    {
      BOOL v9 = +[_HKBehavior isAppleInternalInstall];
      _HKInitializeLogging();
      v10 = (void *)HKLogDefault;
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
          [(HKCategorySample *)v10 initWithCoder:v6];
        }
      }
      else if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        uint64_t v12 = [(HKCategorySample *)v5 categoryType];
        *(_DWORD *)buf = 138412290;
        id v17 = v12;
        _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "Invalid value received for %@, setting value to 0", buf, 0xCu);
      }
      v13 = [(HKCategorySample *)v5 categoryType];
      uint64_t v6 = [v13 _defaultValue];
    }
    v5->_int64_t value = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKCategorySample;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_value, @"value", v5.receiver, v5.super_class);
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
    objc_super v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)HKCategorySample;
    if ([(HKSample *)&v8 isEquivalent:v5]) {
      BOOL v6 = self->_value == v5[12];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v5 = a1;
  BOOL v6 = [a2 categoryType];
  int v7 = 134218242;
  uint64_t v8 = a3;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_19C023000, v5, OS_LOG_TYPE_ERROR, "Invalid value %ld received for %@, setting value to 0", (uint8_t *)&v7, 0x16u);
}

@end