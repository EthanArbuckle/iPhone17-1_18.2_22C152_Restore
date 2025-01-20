@interface HMCharacteristicMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMCharacteristicMetadata)init;
- (HMCharacteristicMetadata)initWithCoder:(id)a3;
- (NSArray)validValues;
- (NSNumber)maxLength;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSString)description;
- (NSString)format;
- (NSString)manufacturerDescription;
- (NSString)units;
- (NSUUID)uniqueIdentifier;
- (unint64_t)hash;
- (void)setFormat:(id)a3;
- (void)setManufacturerDescription:(id)a3;
- (void)setMaxLength:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setUnits:(id)a3;
- (void)setValidValues:(id)a3;
@end

@implementation HMCharacteristicMetadata

- (HMCharacteristicMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMCharacteristicMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataMinimumValue"];
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataMaximumValue"];
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataStepValue"];
    stepValue = v5->_stepValue;
    v5->_stepValue = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataMaxLength"];
    maxLength = v5->_maxLength;
    v5->_maxLength = (NSNumber *)v12;

    uint64_t v14 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"metadataFormat");
    format = v5->_format;
    v5->_format = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"metadataUnits");
    units = v5->_units;
    v5->_units = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"metadataUserDescription");
    manufacturerDescription = v5->_manufacturerDescription;
    v5->_manufacturerDescription = (NSString *)v18;

    uint64_t v20 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"metadataValidValues"];
    validValues = v5->_validValues;
    v5->_validValues = (NSArray *)v20;
  }
  return v5;
}

- (HMCharacteristicMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCharacteristicMetadata;
  return [(HMCharacteristicMetadata *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"[%@"];
  id v4 = [(HMCharacteristicMetadata *)self format];

  if (v4)
  {
    v5 = [(HMCharacteristicMetadata *)self format];
    [v3 appendFormat:@"%@%@%@", @" ", @"Format: ", v5];

    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  v7 = [(HMCharacteristicMetadata *)self units];

  if (v7)
  {
    ++v6;
    if (v4) {
      uint64_t v8 = @", ";
    }
    else {
      uint64_t v8 = @" ";
    }
    v9 = [(HMCharacteristicMetadata *)self units];
    [v3 appendFormat:@"%@%@%@", v8, @"Units: ", v9];
  }
  uint64_t v10 = [(HMCharacteristicMetadata *)self minimumValue];

  if (v10)
  {
    int v11 = v6 + 1;
    if (v6) {
      uint64_t v12 = @", ";
    }
    else {
      uint64_t v12 = @" ";
    }
    v13 = [(HMCharacteristicMetadata *)self minimumValue];
    [v13 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", v12, @"Min: ", v14];

    int v6 = v11;
  }
  v15 = [(HMCharacteristicMetadata *)self maximumValue];

  if (v15)
  {
    int v16 = v6 + 1;
    if (v6) {
      v17 = @", ";
    }
    else {
      v17 = @" ";
    }
    uint64_t v18 = [(HMCharacteristicMetadata *)self maximumValue];
    [v18 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", v17, @"Max: ", v19];

    int v6 = v16;
  }
  uint64_t v20 = [(HMCharacteristicMetadata *)self stepValue];

  if (v20)
  {
    int v21 = v6 + 1;
    if (v6) {
      v22 = @", ";
    }
    else {
      v22 = @" ";
    }
    v23 = [(HMCharacteristicMetadata *)self stepValue];
    [v23 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", v22, @"Step: ", v24];

    int v6 = v21;
  }
  v25 = [(HMCharacteristicMetadata *)self maxLength];

  if (v25)
  {
    int v26 = v6 + 1;
    if (v6) {
      v27 = @", ";
    }
    else {
      v27 = @" ";
    }
    v28 = [(HMCharacteristicMetadata *)self maxLength];
    [v3 appendFormat:@"%@%@%u", v27, @"Max length: ", objc_msgSend(v28, "unsignedIntValue")];

    int v6 = v26;
  }
  v29 = [(HMCharacteristicMetadata *)self manufacturerDescription];

  if (v29)
  {
    if (v6) {
      v30 = @", ";
    }
    else {
      v30 = @" ";
    }
    v31 = [(HMCharacteristicMetadata *)self manufacturerDescription];
    [v3 appendFormat:@"%@%@%@", v30, @"Manufacturer Description: ", v31];

    int v6 = 1;
  }
  v32 = [(HMCharacteristicMetadata *)self validValues];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    if (v6) {
      v34 = @", ";
    }
    else {
      v34 = @" ";
    }
    [v3 appendFormat:@"%@%@", v34, @"Valid Values: "];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v35 = [(HMCharacteristicMetadata *)self validValues];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(v35);
          }
          [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v41 + 1) + 8 * i)];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v37);
    }
  }
  [v3 appendString:@" ]"];

  return (NSString *)v3;
}

- (NSString)format
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_format;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)minimumValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_minimumValue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)maximumValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_maximumValue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)stepValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_stepValue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)manufacturerDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_manufacturerDescription;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)units
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_units;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)validValues
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_validValues;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)maxLength
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_maxLength;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_manufacturerDescription, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);

  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMCharacteristicMetadata *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    int v6 = v5;
    v7 = v6;
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v8 = [(HMCharacteristicMetadata *)v6 minimumValue];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = [(HMCharacteristicMetadata *)v7 maximumValue];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v12 = [(HMCharacteristicMetadata *)v7 stepValue];
    int v13 = HMFEqualObjects();

    if (!v13) {
      goto LABEL_14;
    }
    uint64_t v14 = [(HMCharacteristicMetadata *)v7 maxLength];
    int v15 = HMFEqualObjects();

    if (!v15) {
      goto LABEL_14;
    }
    int v16 = [(HMCharacteristicMetadata *)v7 format];
    int v17 = HMFEqualObjects();

    if (!v17) {
      goto LABEL_14;
    }
    uint64_t v18 = [(HMCharacteristicMetadata *)v7 units];
    int v19 = HMFEqualObjects();

    if (!v19) {
      goto LABEL_14;
    }
    uint64_t v20 = [(HMCharacteristicMetadata *)v7 manufacturerDescription];
    int v21 = HMFEqualObjects();

    if (v21)
    {
      v22 = [(HMCharacteristicMetadata *)v7 validValues];
      char v23 = HMFEqualObjects();
    }
    else
    {
LABEL_14:
      char v23 = 0;
    }
  }
  return v23;
}

- (unint64_t)hash
{
  objc_super v3 = [(HMCharacteristicMetadata *)self minimumValue];
  uint64_t v4 = [v3 hash];

  v5 = [(HMCharacteristicMetadata *)self maximumValue];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMCharacteristicMetadata *)self stepValue];
  uint64_t v8 = [v7 hash];

  int v9 = [(HMCharacteristicMetadata *)self maxLength];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  int v11 = [(HMCharacteristicMetadata *)self format];
  uint64_t v12 = [v11 hash];

  int v13 = [(HMCharacteristicMetadata *)self units];
  uint64_t v14 = v12 ^ [v13 hash];

  int v15 = [(HMCharacteristicMetadata *)self manufacturerDescription];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];

  int v17 = [(HMCharacteristicMetadata *)self validValues];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (NSUUID)uniqueIdentifier
{
  return 0;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(HMCharacteristicMetadata *)self minimumValue];
    v7 = [v5 minimumValue];
    char v8 = HMFEqualObjects();
    char v9 = v8 ^ 1;

    if ((v8 & 1) == 0)
    {
      uint64_t v10 = [v5 minimumValue];
      [(HMCharacteristicMetadata *)self setMinimumValue:v10];
    }
    int v11 = [(HMCharacteristicMetadata *)self maximumValue];
    uint64_t v12 = [v5 maximumValue];
    char v13 = HMFEqualObjects();

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = [v5 maximumValue];
      [(HMCharacteristicMetadata *)self setMaximumValue:v14];

      char v9 = 1;
    }
    int v15 = [(HMCharacteristicMetadata *)self stepValue];
    uint64_t v16 = [v5 stepValue];
    char v17 = HMFEqualObjects();

    if ((v17 & 1) == 0)
    {
      unint64_t v18 = [v5 stepValue];
      [(HMCharacteristicMetadata *)self setStepValue:v18];

      char v9 = 1;
    }
    int v19 = [(HMCharacteristicMetadata *)self maxLength];
    uint64_t v20 = [v5 maxLength];
    char v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      v22 = [v5 maxLength];
      [(HMCharacteristicMetadata *)self setMaxLength:v22];

      char v9 = 1;
    }
    char v23 = [(HMCharacteristicMetadata *)self format];
    uint64_t v24 = [v5 format];
    char v25 = HMFEqualObjects();

    if ((v25 & 1) == 0)
    {
      int v26 = [v5 format];
      [(HMCharacteristicMetadata *)self setFormat:v26];

      char v9 = 1;
    }
    v27 = [(HMCharacteristicMetadata *)self units];
    v28 = [v5 units];
    char v29 = HMFEqualObjects();

    if ((v29 & 1) == 0)
    {
      v30 = [v5 units];
      [(HMCharacteristicMetadata *)self setUnits:v30];

      char v9 = 1;
    }
    v31 = [(HMCharacteristicMetadata *)self manufacturerDescription];
    v32 = [v5 manufacturerDescription];
    char v33 = HMFEqualObjects();

    if ((v33 & 1) == 0)
    {
      v34 = [v5 manufacturerDescription];
      [(HMCharacteristicMetadata *)self setManufacturerDescription:v34];

      char v9 = 1;
    }
    v35 = [(HMCharacteristicMetadata *)self validValues];
    uint64_t v36 = [v5 validValues];
    char v37 = HMFEqualObjects();

    if ((v37 & 1) == 0)
    {
      uint64_t v38 = [v5 validValues];
      [(HMCharacteristicMetadata *)self setValidValues:v38];

      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)setValidValues:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  validValues = self->_validValues;
  self->_validValues = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setManufacturerDescription:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerDescription = self->_manufacturerDescription;
  self->_manufacturerDescription = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUnits:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  units = self->_units;
  self->_units = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFormat:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  format = self->_format;
  self->_format = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaxLength:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  maxLength = self->_maxLength;
  self->_maxLength = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setStepValue:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  stepValue = self->_stepValue;
  self->_stepValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaximumValue:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  maximumValue = self->_maximumValue;
  self->_maximumValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMinimumValue:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  minimumValue = self->_minimumValue;
  self->_minimumValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

@end