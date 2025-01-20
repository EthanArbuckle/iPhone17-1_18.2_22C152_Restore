@interface HAPMetadataCharacteristicValue
+ (id)initWithDictionary:(id)a3;
- (HAPMetadataCharacteristicValue)initWithMinLength:(id)a3 maxLength:(id)a4;
- (HAPMetadataCharacteristicValue)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5 validValues:(id)a6;
- (NSArray)validValues;
- (NSNumber)maxLength;
- (NSNumber)maxValue;
- (NSNumber)minLength;
- (NSNumber)minValue;
- (NSNumber)stepValue;
- (id)description;
- (id)generateDictionary;
- (void)dump;
- (void)setMaxLength:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinLength:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setStepValue:(id)a3;
@end

@implementation HAPMetadataCharacteristicValue

- (NSNumber)minLength
{
  return self->_minLength;
}

- (NSNumber)maxLength
{
  return self->_maxLength;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);

  objc_storeStrong((id *)&self->_minValue, 0);
}

- (void)setMaxLength:(id)a3
{
}

- (void)setMinLength:(id)a3
{
}

- (void)setStepValue:(id)a3
{
}

- (void)setMaxValue:(id)a3
{
}

- (void)setMinValue:(id)a3
{
}

- (void)dump
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = [(HAPMetadataCharacteristicValue *)self description];
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"ValueMetadata"];
  v4 = [(HAPMetadataCharacteristicValue *)self minLength];

  if (v4)
  {
    v5 = [(HAPMetadataCharacteristicValue *)self minLength];
    [v3 appendFormat:@"  minLength:%@", v5];
  }
  v6 = [(HAPMetadataCharacteristicValue *)self maxLength];

  if (v6)
  {
    int v7 = [(HAPMetadataCharacteristicValue *)self maxLength];
    [v3 appendFormat:@"  maxLength:%@", v7];
  }
  v8 = [(HAPMetadataCharacteristicValue *)self minValue];

  if (v8)
  {
    __int16 v9 = [(HAPMetadataCharacteristicValue *)self minValue];
    [v3 appendFormat:@"  minValue:%@", v9];
  }
  v10 = [(HAPMetadataCharacteristicValue *)self maxValue];

  if (v10)
  {
    uint64_t v11 = [(HAPMetadataCharacteristicValue *)self maxValue];
    [v3 appendFormat:@"  maxValue:%@", v11];
  }
  v12 = [(HAPMetadataCharacteristicValue *)self stepValue];

  if (v12)
  {
    v13 = [(HAPMetadataCharacteristicValue *)self stepValue];
    [v3 appendFormat:@"  stepValue:%@", v13];
  }
  v14 = [(HAPMetadataCharacteristicValue *)self validValues];

  if (v14)
  {
    v15 = [(HAPMetadataCharacteristicValue *)self validValues];
    [v3 appendFormat:@"  validValues:%@", v15];
  }

  return v3;
}

- (id)generateDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HAPMetadataCharacteristicValue *)self minLength];

  if (v4)
  {
    v5 = [(HAPMetadataCharacteristicValue *)self minLength];
    [v3 setObject:v5 forKeyedSubscript:@"MinLength"];
  }
  v6 = [(HAPMetadataCharacteristicValue *)self maxLength];

  if (v6)
  {
    int v7 = [(HAPMetadataCharacteristicValue *)self maxLength];
    [v3 setObject:v7 forKeyedSubscript:@"MaxLength"];
  }
  v8 = [(HAPMetadataCharacteristicValue *)self minValue];

  if (v8)
  {
    __int16 v9 = [(HAPMetadataCharacteristicValue *)self minValue];
    [v3 setObject:v9 forKeyedSubscript:@"MinValue"];
  }
  v10 = [(HAPMetadataCharacteristicValue *)self maxValue];

  if (v10)
  {
    uint64_t v11 = [(HAPMetadataCharacteristicValue *)self maxValue];
    [v3 setObject:v11 forKeyedSubscript:@"MaxValue"];
  }
  v12 = [(HAPMetadataCharacteristicValue *)self stepValue];

  if (v12)
  {
    v13 = [(HAPMetadataCharacteristicValue *)self stepValue];
    [v3 setObject:v13 forKeyedSubscript:@"StepValue"];
  }
  v14 = [(HAPMetadataCharacteristicValue *)self validValues];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = [(HAPMetadataCharacteristicValue *)self validValues];
    [v3 setObject:v16 forKeyedSubscript:@"ValidValues"];
  }

  return v3;
}

- (HAPMetadataCharacteristicValue)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5 validValues:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11 || v12 || v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)HAPMetadataCharacteristicValue;
    v16 = [(HAPMetadataCharacteristicValue *)&v19 init];
    uint64_t v15 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_minValue, a3);
      objc_storeStrong((id *)&v15->_maxValue, a4);
      objc_storeStrong((id *)&v15->_stepValue, a5);
      v17 = (NSArray *)v14;
      self = (HAPMetadataCharacteristicValue *)v15->_validValues;
      v15->_validValues = v17;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (HAPMetadataCharacteristicValue)initWithMinLength:(id)a3 maxLength:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)HAPMetadataCharacteristicValue;
    __int16 v9 = [(HAPMetadataCharacteristicValue *)&v13 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_minLength, a3);
      id v11 = (NSNumber *)(id)v8;
      self = (HAPMetadataCharacteristicValue *)v10->_maxLength;
      v10->_maxLength = v11;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "hmf_numberForKey:", @"MinLength");
  uint64_t v5 = objc_msgSend(v3, "hmf_numberForKey:", @"MaxLength");
  if (v4 | v5) {
    v6 = [[HAPMetadataCharacteristicValue alloc] initWithMinLength:v4 maxLength:v5];
  }
  else {
    v6 = 0;
  }
  unint64_t v7 = objc_msgSend(v3, "hmf_numberForKey:", @"MinValue");
  unint64_t v8 = objc_msgSend(v3, "hmf_numberForKey:", @"MaxValue");
  __int16 v9 = objc_msgSend(v3, "hmf_numberForKey:", @"StepValue");
  v10 = objc_msgSend(v3, "hmf_arrayForKey:", @"ValidValues");
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      context = (void *)MEMORY[0x1D944E080]();
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        objc_msgSend(v3, "hmf_stringForKey:", @"ShortUUID");
        *(_DWORD *)buf = 138544898;
        v18 = v15;
        v20 = __int16 v19 = 2112;
        id v12 = (void *)v20;
        __int16 v21 = 2112;
        uint64_t v22 = v4;
        __int16 v23 = 2112;
        uint64_t v24 = v5;
        __int16 v25 = 2112;
        v26 = v7;
        __int16 v27 = 2112;
        uint64_t v28 = v5;
        __int16 v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);
      }
    }
    objc_super v13 = [[HAPMetadataCharacteristicValue alloc] initWithMinValue:v7 maxValue:v8 stepValue:v9 validValues:v10];

    v6 = v13;
  }

  return v6;
}

@end