@interface HAPMetadataConstraints
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToMetadataConstraints:(id)a3;
- (HAPMetadataConstraints)initWithCoder:(id)a3;
- (NSArray)validValues;
- (NSNumber)maxLength;
- (NSNumber)maximumValue;
- (NSNumber)minLength;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxLength:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinLength:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setValidValues:(id)a3;
@end

@implementation HAPMetadataConstraints

- (void)setMaxLength:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);

  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (void)setStepValue:(id)a3
{
}

- (void)setMinimumValue:(id)a3
{
}

- (void)setMaximumValue:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [(HAPMetadataConstraints *)self minimumValue];
  uint64_t v4 = [v3 hash];
  v5 = [(HAPMetadataConstraints *)self maximumValue];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HAPMetadataConstraints *)self stepValue];
  uint64_t v8 = [v7 hash];
  v9 = [(HAPMetadataConstraints *)self minLength];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(HAPMetadataConstraints *)self maxLength];
  uint64_t v12 = [v11 hash];
  v13 = [(HAPMetadataConstraints *)self validValues];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqualToMetadataConstraints:(id)a3
{
  uint64_t v4 = (HAPMetadataConstraints *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    v5 = [(HAPMetadataConstraints *)self minimumValue];
    uint64_t v6 = [(HAPMetadataConstraints *)v4 minimumValue];
    char v7 = numbersAreNotEqualNilSafe(v5, v6);

    if (v7) {
      goto LABEL_8;
    }
    uint64_t v8 = [(HAPMetadataConstraints *)self maximumValue];
    v9 = [(HAPMetadataConstraints *)v4 maximumValue];
    char v10 = numbersAreNotEqualNilSafe(v8, v9);

    if (v10) {
      goto LABEL_8;
    }
    v11 = [(HAPMetadataConstraints *)self stepValue];
    uint64_t v12 = [(HAPMetadataConstraints *)v4 stepValue];
    char v13 = numbersAreNotEqualNilSafe(v11, v12);

    if (v13) {
      goto LABEL_8;
    }
    unint64_t v14 = [(HAPMetadataConstraints *)self minLength];
    v15 = [(HAPMetadataConstraints *)v4 minLength];
    char v16 = numbersAreNotEqualNilSafe(v14, v15);

    if ((v16 & 1) != 0
      || ([(HAPMetadataConstraints *)self maxLength],
          v17 = objc_claimAutoreleasedReturnValue(),
          [(HAPMetadataConstraints *)v4 maxLength],
          v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = numbersAreNotEqualNilSafe(v17, v18),
          v18,
          v17,
          (v19 & 1) != 0))
    {
LABEL_8:
      char v20 = 0;
    }
    else
    {
      uint64_t v22 = [(HAPMetadataConstraints *)self validValues];
      uint64_t v23 = [(HAPMetadataConstraints *)v4 validValues];
      if (v22 | v23) {
        char v20 = [(id)v22 isEqualToArray:v23];
      }
      else {
        char v20 = 1;
      }
    }
  }

  return v20;
}

- (NSNumber)maxLength
{
  return self->_maxLength;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (NSNumber)minLength
{
  return self->_minLength;
}

- (void)setValidValues:(id)a3
{
}

- (void)setMinLength:(id)a3
{
}

- (HAPMetadataConstraints)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAPMetadataConstraints;
  v5 = [(HAPMetadataConstraints *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMinV"];
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMaxV"];
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSV"];
    stepValue = v5->_stepValue;
    v5->_stepValue = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMinL"];
    minLength = v5->_minLength;
    v5->_minLength = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMaxL"];
    maxLength = v5->_maxLength;
    v5->_maxLength = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"CVV"];
    validValues = v5->_validValues;
    v5->_validValues = (NSArray *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadataConstraints *)self minimumValue];
  [v4 encodeObject:v5 forKey:@"CMinV"];

  uint64_t v6 = [(HAPMetadataConstraints *)self maximumValue];
  [v4 encodeObject:v6 forKey:@"CMaxV"];

  char v7 = [(HAPMetadataConstraints *)self stepValue];
  [v4 encodeObject:v7 forKey:@"CSV"];

  uint64_t v8 = [(HAPMetadataConstraints *)self minLength];
  [v4 encodeObject:v8 forKey:@"CMinL"];

  v9 = [(HAPMetadataConstraints *)self maxLength];
  [v4 encodeObject:v9 forKey:@"CMaxL"];

  id v10 = [(HAPMetadataConstraints *)self validValues];
  [v4 encodeObject:v10 forKey:@"CVV"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(HAPMetadataConstraints *)self minimumValue];
    uint64_t v7 = [v6 copyWithZone:a3];
    uint64_t v8 = (void *)v5[1];
    v5[1] = v7;

    v9 = [(HAPMetadataConstraints *)self maximumValue];
    uint64_t v10 = [v9 copyWithZone:a3];
    v11 = (void *)v5[2];
    v5[2] = v10;

    uint64_t v12 = [(HAPMetadataConstraints *)self stepValue];
    uint64_t v13 = [v12 copyWithZone:a3];
    uint64_t v14 = (void *)v5[3];
    v5[3] = v13;

    v15 = [(HAPMetadataConstraints *)self minLength];
    uint64_t v16 = [v15 copyWithZone:a3];
    v17 = (void *)v5[4];
    v5[4] = v16;

    v18 = [(HAPMetadataConstraints *)self maxLength];
    uint64_t v19 = [v18 copyWithZone:a3];
    char v20 = (void *)v5[5];
    v5[5] = v19;

    v21 = [(HAPMetadataConstraints *)self validValues];
    uint64_t v22 = [v21 copyWithZone:a3];
    uint64_t v23 = (void *)v5[6];
    v5[6] = v22;
  }
  return v5;
}

- (id)description
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"[ Constraints:"];
  id v4 = [(HAPMetadataConstraints *)self minimumValue];

  if (v4)
  {
    v5 = [(HAPMetadataConstraints *)self minimumValue];
    [v5 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", @" ", @"Min: ", v6];

    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = [(HAPMetadataConstraints *)self maximumValue];

  if (v8)
  {
    ++v7;
    if (v4) {
      v9 = @", ";
    }
    else {
      v9 = @" ";
    }
    uint64_t v10 = [(HAPMetadataConstraints *)self maximumValue];
    [v10 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", v9, @"Max: ", v11];
  }
  uint64_t v12 = [(HAPMetadataConstraints *)self stepValue];

  if (v12)
  {
    int v13 = v7 + 1;
    if (v7) {
      uint64_t v14 = @", ";
    }
    else {
      uint64_t v14 = @" ";
    }
    v15 = [(HAPMetadataConstraints *)self stepValue];
    [v15 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", v14, @"Step: ", v16];

    int v7 = v13;
  }
  v17 = [(HAPMetadataConstraints *)self minLength];

  if (v17)
  {
    int v18 = v7 + 1;
    if (v7) {
      uint64_t v19 = @", ";
    }
    else {
      uint64_t v19 = @" ";
    }
    char v20 = [(HAPMetadataConstraints *)self minLength];
    [v3 appendFormat:@"%@%@%u", v19, @"Min length: ", objc_msgSend(v20, "unsignedIntValue")];

    int v7 = v18;
  }
  v21 = [(HAPMetadataConstraints *)self maxLength];

  if (v21)
  {
    if (v7) {
      uint64_t v22 = @", ";
    }
    else {
      uint64_t v22 = @" ";
    }
    uint64_t v23 = [(HAPMetadataConstraints *)self maxLength];
    [v3 appendFormat:@"%@%@%u", v22, @"Max length: ", objc_msgSend(v23, "unsignedIntValue")];

    int v7 = 1;
  }
  v24 = [(HAPMetadataConstraints *)self validValues];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    if (v7) {
      v26 = @", ";
    }
    else {
      v26 = @" ";
    }
    [v3 appendFormat:@"%@%@", v26, @"Valid Values: "];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v27 = [(HAPMetadataConstraints *)self validValues];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(v27);
          }
          [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v33 + 1) + 8 * i)];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v29);
    }
  }
  [v3 appendString:@" ]"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end