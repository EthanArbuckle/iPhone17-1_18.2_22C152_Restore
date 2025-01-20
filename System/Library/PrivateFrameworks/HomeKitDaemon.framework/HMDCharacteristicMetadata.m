@interface HMDCharacteristicMetadata
+ (BOOL)supportsSecureCoding;
+ (HMDCharacteristicMetadata)characteristicMetadataWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDCharacteristicMetadata)init;
- (HMDCharacteristicMetadata)initWithCoder:(id)a3;
- (HMDCharacteristicMetadata)initWithMinimumValue:(id)a3 maximumValue:(id)a4 stepValue:(id)a5 maxLength:(id)a6 validValues:(id)a7 format:(id)a8 units:(id)a9 manufacturerDescription:(id)a10;
- (NSArray)validValues;
- (NSNumber)maxLength;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSString)description;
- (NSString)format;
- (NSString)manufacturerDescription;
- (NSString)units;
- (id)_descriptionDetails;
- (id)dictionaryRepresentation;
- (id)dumpState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCharacteristicMetadata

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

- (NSArray)validValues
{
  return self->_validValues;
}

- (NSString)manufacturerDescription
{
  return self->_manufacturerDescription;
}

- (NSString)units
{
  return self->_units;
}

- (NSString)format
{
  return self->_format;
}

- (NSNumber)maxLength
{
  return self->_maxLength;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCharacteristicMetadata *)self minimumValue];
  [v4 encodeObject:v5 forKey:@"metadataMinimumValue"];

  v6 = [(HMDCharacteristicMetadata *)self maximumValue];
  [v4 encodeObject:v6 forKey:@"metadataMaximumValue"];

  v7 = [(HMDCharacteristicMetadata *)self stepValue];
  [v4 encodeObject:v7 forKey:@"metadataStepValue"];

  v8 = [(HMDCharacteristicMetadata *)self maxLength];
  [v4 encodeObject:v8 forKey:@"metadataMaxLength"];

  v9 = [(HMDCharacteristicMetadata *)self format];
  [v4 encodeObject:v9 forKey:@"metadataFormat"];

  v10 = [(HMDCharacteristicMetadata *)self units];
  [v4 encodeObject:v10 forKey:@"metadataUnits"];

  v11 = [(HMDCharacteristicMetadata *)self manufacturerDescription];
  [v4 encodeObject:v11 forKey:@"metadataUserDescription"];

  id v12 = [(HMDCharacteristicMetadata *)self validValues];
  [v4 encodeObject:v12 forKey:@"metadataValidValues"];
}

- (HMDCharacteristicMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataMinimumValue"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataMaximumValue"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataStepValue"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataMaxLength"];
  v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"metadataValidValues"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataFormat"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataUnits"];
  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataUserDescription"];

  v13 = [(HMDCharacteristicMetadata *)self initWithMinimumValue:v5 maximumValue:v6 stepValue:v7 maxLength:v8 validValues:v9 format:v10 units:v11 manufacturerDescription:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCharacteristicMetadata *)a3;
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
    v6 = v5;
    v7 = v6;
    if (!v6) {
      goto LABEL_14;
    }
    v8 = [(HMDCharacteristicMetadata *)v6 minimumValue];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_14;
    }
    v10 = [(HMDCharacteristicMetadata *)v7 maximumValue];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_14;
    }
    id v12 = [(HMDCharacteristicMetadata *)v7 stepValue];
    int v13 = HMFEqualObjects();

    if (!v13) {
      goto LABEL_14;
    }
    v14 = [(HMDCharacteristicMetadata *)v7 maxLength];
    int v15 = HMFEqualObjects();

    if (!v15) {
      goto LABEL_14;
    }
    v16 = [(HMDCharacteristicMetadata *)v7 format];
    int v17 = HMFEqualObjects();

    if (!v17) {
      goto LABEL_14;
    }
    v18 = [(HMDCharacteristicMetadata *)v7 units];
    int v19 = HMFEqualObjects();

    if (!v19) {
      goto LABEL_14;
    }
    v20 = [(HMDCharacteristicMetadata *)v7 manufacturerDescription];
    int v21 = HMFEqualObjects();

    if (v21)
    {
      v22 = [(HMDCharacteristicMetadata *)v7 validValues];
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
  v3 = [(HMDCharacteristicMetadata *)self minimumValue];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDCharacteristicMetadata *)self maximumValue];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDCharacteristicMetadata *)self stepValue];
  uint64_t v8 = [v7 hash];

  int v9 = [(HMDCharacteristicMetadata *)self maxLength];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  int v11 = [(HMDCharacteristicMetadata *)self format];
  uint64_t v12 = [v11 hash];

  int v13 = [(HMDCharacteristicMetadata *)self units];
  uint64_t v14 = v12 ^ [v13 hash];

  int v15 = [(HMDCharacteristicMetadata *)self manufacturerDescription];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];

  int v17 = [(HMDCharacteristicMetadata *)self validValues];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:8];
  [v3 setObject:self->_minimumValue forKeyedSubscript:@"metadataMinimumValue"];
  [v3 setObject:self->_maximumValue forKeyedSubscript:@"metadataMaximumValue"];
  [v3 setObject:self->_stepValue forKeyedSubscript:@"metadataStepValue"];
  [v3 setObject:self->_maxLength forKeyedSubscript:@"metadataMaxLength"];
  [v3 setObject:self->_validValues forKeyedSubscript:@"metadataValidValues"];
  [v3 setObject:self->_manufacturerDescription forKeyedSubscript:@"metadataUserDescription"];
  [v3 setObject:self->_format forKeyedSubscript:@"metadataFormat"];
  [v3 setObject:self->_units forKeyedSubscript:@"metadataUnits"];
  return v3;
}

- (id)_descriptionDetails
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:6];
  uint64_t v4 = [(HMDCharacteristicMetadata *)self format];

  if (v4)
  {
    v5 = NSString;
    uint64_t v6 = [(HMDCharacteristicMetadata *)self format];
    v7 = [v5 stringWithFormat:@"Format: %@", v6];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(HMDCharacteristicMetadata *)self units];

  if (v8)
  {
    int v9 = NSString;
    uint64_t v10 = [(HMDCharacteristicMetadata *)self units];
    int v11 = [v9 stringWithFormat:@"Units: %@", v10];
    [v3 addObject:v11];
  }
  uint64_t v12 = [(HMDCharacteristicMetadata *)self minimumValue];

  if (v12)
  {
    int v13 = NSString;
    uint64_t v14 = [(HMDCharacteristicMetadata *)self minimumValue];
    int v15 = [v13 stringWithFormat:@"MinValue: %@", v14];
    [v3 addObject:v15];
  }
  uint64_t v16 = [(HMDCharacteristicMetadata *)self maximumValue];

  if (v16)
  {
    int v17 = NSString;
    unint64_t v18 = [(HMDCharacteristicMetadata *)self maximumValue];
    int v19 = [v17 stringWithFormat:@"MaxValue: %@", v18];
    [v3 addObject:v19];
  }
  v20 = [(HMDCharacteristicMetadata *)self stepValue];

  if (v20)
  {
    int v21 = NSString;
    v22 = [(HMDCharacteristicMetadata *)self stepValue];
    char v23 = [v21 stringWithFormat:@"StepValue: %@", v22];
    [v3 addObject:v23];
  }
  v24 = [(HMDCharacteristicMetadata *)self maxLength];

  if (v24)
  {
    v25 = NSString;
    v26 = [(HMDCharacteristicMetadata *)self maxLength];
    v27 = [v25 stringWithFormat:@"Max length: %@", v26];
    [v3 addObject:v27];
  }
  v28 = [(HMDCharacteristicMetadata *)self manufacturerDescription];

  if (v28)
  {
    v29 = NSString;
    v30 = [(HMDCharacteristicMetadata *)self manufacturerDescription];
    v31 = [v29 stringWithFormat:@"Manufacturer Description: %@", v30];
    [v3 addObject:v31];
  }
  v32 = [(HMDCharacteristicMetadata *)self validValues];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    v34 = [NSString stringWithFormat:@"Valid Values: "];
    [v3 addObject:v34];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v35 = [(HMDCharacteristicMetadata *)self validValues];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [NSString stringWithFormat:@"%@, ", *(void *)(*((void *)&v43 + 1) + 8 * i)];
          [v3 addObject:v40];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v37);
    }
  }
  v41 = [v3 componentsJoinedByString:@", "];

  return v41;
}

- (id)dumpState
{
  v2 = NSDictionary;
  v3 = [(HMDCharacteristicMetadata *)self _descriptionDetails];
  uint64_t v4 = [v2 dictionaryWithObject:v3 forKey:*MEMORY[0x263F41FA8]];

  return v4;
}

- (NSString)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"[%@"];
  uint64_t v4 = [(HMDCharacteristicMetadata *)self _descriptionDetails];
  [v3 appendString:v4];

  [v3 appendString:@" ]"];
  return (NSString *)v3;
}

- (HMDCharacteristicMetadata)initWithMinimumValue:(id)a3 maximumValue:(id)a4 stepValue:(id)a5 maxLength:(id)a6 validValues:(id)a7 format:(id)a8 units:(id)a9 manufacturerDescription:(id)a10
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDCharacteristicMetadata;
  int v21 = [(HMDCharacteristicMetadata *)&v34 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_minimumValue, a3);
    objc_storeStrong((id *)&v22->_maximumValue, a4);
    objc_storeStrong((id *)&v22->_stepValue, a5);
    objc_storeStrong((id *)&v22->_maxLength, a6);
    objc_storeStrong((id *)&v22->_validValues, a7);
    uint64_t v23 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v18, v30, v31, v32, v33);
    format = v22->_format;
    v22->_format = (NSString *)v23;

    uint64_t v25 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v19);
    units = v22->_units;
    v22->_units = (NSString *)v25;

    uint64_t v27 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v20);
    manufacturerDescription = v22->_manufacturerDescription;
    v22->_manufacturerDescription = (NSString *)v27;
  }
  return v22;
}

- (HMDCharacteristicMetadata)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HMDCharacteristicMetadata)characteristicMetadataWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_numberForKey:", @"metadataMinimumValue");
  uint64_t v6 = objc_msgSend(v4, "hmf_numberForKey:", @"metadataMaximumValue");
  id v7 = objc_msgSend(v4, "hmf_numberForKey:", @"metadataStepValue");
  uint64_t v8 = objc_msgSend(v4, "hmf_numberForKey:", @"metadataMaxLength");
  int v9 = objc_msgSend(v4, "hmf_arrayForKey:", @"metadataValidValues");
  uint64_t v10 = objc_msgSend(v4, "hmf_stringForKey:", @"metadataUserDescription");
  int v11 = objc_msgSend(v4, "hmf_stringForKey:", @"metadataFormat");
  uint64_t v12 = objc_msgSend(v4, "hmf_stringForKey:", @"metadataUnits");

  if (v10 || v11 || v12 || ([v5 doubleValue], double v14 = v13, objc_msgSend(v6, "doubleValue"), v14 < v15)) {
    uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithMinimumValue:v5 maximumValue:v6 stepValue:v7 maxLength:v8 validValues:v9 format:v11 units:v12 manufacturerDescription:v10];
  }
  else {
    uint64_t v16 = 0;
  }

  return (HMDCharacteristicMetadata *)v16;
}

@end