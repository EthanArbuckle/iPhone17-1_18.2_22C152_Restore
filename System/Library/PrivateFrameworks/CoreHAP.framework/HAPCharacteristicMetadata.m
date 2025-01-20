@interface HAPCharacteristicMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToCharacteristicMetadata:(id)a3;
- (HAPCharacteristicMetadata)initWithCoder:(id)a3;
- (HAPCharacteristicMetadata)initWithConstraints:(id)a3 description:(id)a4 format:(id)a5 units:(id)a6;
- (HAPMetadataConstraints)constraints;
- (NSString)format;
- (NSString)manufacturerDescription;
- (NSString)units;
- (id)_generateValidConstraints:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setFormat:(id)a3;
- (void)setManufacturerDescription:(id)a3;
- (void)setUnits:(id)a3;
@end

@implementation HAPCharacteristicMetadata

- (HAPCharacteristicMetadata)initWithConstraints:(id)a3 description:(id)a4 format:(id)a5 units:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v10 || v11 || v12 || v13)
  {
    id v16 = v10;
    uint64_t v17 = [v16 maxLength];
    if (!v17) {
      goto LABEL_14;
    }
    v18 = (void *)v17;
    [v16 maxLength];
    v19 = id v34 = v11;
    v33 = v14;
    unsigned int v20 = [v19 unsignedIntValue];

    id v11 = v34;
    BOOL v21 = v20 >= 0x101;
    v14 = v33;
    if (v21)
    {
      v22 = (void *)MEMORY[0x1D944E080]();
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v24;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@### Value of maxLength exceeds maximum allowed value", buf, 0xCu);

        id v11 = v34;
      }

      v25 = (void *)MEMORY[0x1D944E080]();
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v27;
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize metadata because of invalid arguments", buf, 0xCu);

        id v11 = v34;
      }

      v15 = 0;
      v14 = v33;
    }
    else
    {
LABEL_14:

      v35.receiver = self;
      v35.super_class = (Class)HAPCharacteristicMetadata;
      v28 = [(HAPCharacteristicMetadata *)&v35 init];
      v29 = v28;
      if (v28)
      {
        objc_storeStrong((id *)&v28->_manufacturerDescription, a4);
        objc_storeStrong((id *)&v29->_format, a5);
        objc_storeStrong((id *)&v29->_units, a6);
        uint64_t v30 = [(HAPCharacteristicMetadata *)v29 _generateValidConstraints:v16];
        constraints = v29->_constraints;
        v29->_constraints = (HAPMetadataConstraints *)v30;
      }
      self = v29;
      v15 = self;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_generateValidConstraints:(id)a3
{
  v4 = (HAPMetadataConstraints *)a3;
  v5 = [(HAPCharacteristicMetadata *)self format];
  int v6 = [v5 isEqualToString:@"string"];

  v7 = v4;
  if (v6)
  {
    v7 = v4;
    if (!v4) {
      v7 = objc_alloc_init(HAPMetadataConstraints);
    }
    v8 = [(HAPMetadataConstraints *)v7 maxLength];

    if (!v8)
    {
      v9 = [NSNumber numberWithUnsignedInteger:64];
      [(HAPMetadataConstraints *)v7 setMaxLength:v9];
    }
  }
  id v10 = [(HAPMetadataConstraints *)v7 minimumValue];
  if (v10) {
    goto LABEL_11;
  }
  id v10 = [(HAPMetadataConstraints *)v7 maximumValue];
  if (v10
    || ([(HAPMetadataConstraints *)v7 stepValue], (id v10 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(HAPMetadataConstraints *)v7 minLength], (id v10 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(HAPMetadataConstraints *)v7 maxLength], (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_11:

LABEL_12:
    id v11 = v7;
    goto LABEL_13;
  }
  id v13 = [(HAPMetadataConstraints *)v7 validValues];
  uint64_t v14 = [v13 count];

  if (v14) {
    goto LABEL_12;
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(HAPCharacteristicMetadata *)self constraints];
  uint64_t v4 = [v3 hash];
  v5 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HAPCharacteristicMetadata *)self format];
  uint64_t v8 = [v7 hash];
  v9 = [(HAPCharacteristicMetadata *)self units];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqualToCharacteristicMetadata:(id)a3
{
  uint64_t v4 = (HAPCharacteristicMetadata *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v5 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
    uint64_t v6 = [(HAPCharacteristicMetadata *)v4 manufacturerDescription];
    if (v5 | v6)
    {
      v7 = (void *)v6;
      int v8 = [(id)v5 isEqualToString:v6];

      if (!v8) {
        goto LABEL_11;
      }
    }
    uint64_t v10 = [(HAPCharacteristicMetadata *)self format];
    uint64_t v11 = [(HAPCharacteristicMetadata *)v4 format];
    if (v10 | v11)
    {
      id v12 = (void *)v11;
      int v13 = [(id)v10 isEqualToString:v11];

      if (!v13) {
        goto LABEL_11;
      }
    }
    uint64_t v14 = [(HAPCharacteristicMetadata *)self units];
    uint64_t v15 = [(HAPCharacteristicMetadata *)v4 units];
    if (!(v14 | v15)
      || (id v16 = (void *)v15,
          int v17 = [(id)v14 isEqualToString:v15],
          v16,
          (id)v14,
          v17))
    {
      v18 = [(HAPCharacteristicMetadata *)self constraints];
      uint64_t v19 = [(HAPCharacteristicMetadata *)v4 constraints];
      if (v18 == (void *)v19)
      {
        char v9 = 1;
        unsigned int v20 = v18;
      }
      else
      {
        unsigned int v20 = (void *)v19;
        BOOL v21 = [(HAPCharacteristicMetadata *)self constraints];
        v22 = [(HAPCharacteristicMetadata *)v4 constraints];
        char v9 = [v21 isEqualToMetadataConstraints:v22];
      }
    }
    else
    {
LABEL_11:
      char v9 = 0;
    }
  }

  return v9;
}

- (HAPMetadataConstraints)constraints
{
  return self->_constraints;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)units
{
  return self->_units;
}

- (NSString)manufacturerDescription
{
  return self->_manufacturerDescription;
}

- (void)setUnits:(id)a3
{
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_manufacturerDescription, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

- (void)setFormat:(id)a3
{
}

- (void)setManufacturerDescription:(id)a3
{
}

- (HAPCharacteristicMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicMetadata;
  uint64_t v5 = [(HAPCharacteristicMetadata *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MC"];
    constraints = v5->_constraints;
    v5->_constraints = (HAPMetadataConstraints *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MD"];
    manufacturerDescription = v5->_manufacturerDescription;
    v5->_manufacturerDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MF"];
    format = v5->_format;
    v5->_format = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MU"];
    units = v5->_units;
    v5->_units = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPCharacteristicMetadata *)self constraints];
  [v4 encodeObject:v5 forKey:@"MC"];

  uint64_t v6 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
  [v4 encodeObject:v6 forKey:@"MD"];

  v7 = [(HAPCharacteristicMetadata *)self format];
  [v4 encodeObject:v7 forKey:@"MF"];

  id v8 = [(HAPCharacteristicMetadata *)self units];
  [v4 encodeObject:v8 forKey:@"MU"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(HAPCharacteristicMetadata *)self constraints];
    uint64_t v7 = [v6 copyWithZone:a3];
    id v8 = (void *)v5[1];
    v5[1] = v7;

    char v9 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
    uint64_t v10 = [v9 copyWithZone:a3];
    uint64_t v11 = (void *)v5[2];
    v5[2] = v10;

    uint64_t v12 = [(HAPCharacteristicMetadata *)self format];
    uint64_t v13 = [v12 copyWithZone:a3];
    uint64_t v14 = (void *)v5[3];
    v5[3] = v13;

    objc_super v15 = [(HAPCharacteristicMetadata *)self units];
    uint64_t v16 = [v15 copyWithZone:a3];
    int v17 = (void *)v5[4];
    v5[4] = v16;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)HAPCharacteristicMetadata;
  id v4 = [(HMFObject *)&v10 description];
  [v3 appendFormat:@"%@  ", v4];

  uint64_t v5 = [(HAPCharacteristicMetadata *)self constraints];
  [v3 appendFormat:@"Constraints: %@  ", v5];

  uint64_t v6 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
  [v3 appendFormat:@"Description: %@  ", v6];

  uint64_t v7 = [(HAPCharacteristicMetadata *)self format];
  [v3 appendFormat:@"Format: %@  ", v7];

  id v8 = [(HAPCharacteristicMetadata *)self units];
  [v3 appendFormat:@"Units: %@  ", v8];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end