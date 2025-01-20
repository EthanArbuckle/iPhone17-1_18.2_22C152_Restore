@interface HMCHIPAccessorySetupPayload
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)hasShortDiscriminator;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresCustomFlow;
- (HMCHIPAccessorySetupPayload)initWithCoder:(id)a3;
- (HMCHIPAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4;
- (NSArray)attributeDescriptions;
- (NSNumber)discriminator;
- (NSNumber)productID;
- (NSNumber)setupCode;
- (NSNumber)vendorID;
- (NSString)description;
- (NSString)serialNumber;
- (NSString)setupPayloadString;
- (NSString)shortDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasShortDiscriminator:(BOOL)a3;
- (void)setProductID:(id)a3;
- (void)setRequiresCustomFlow:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSetupPayloadString:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation HMCHIPAccessorySetupPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_setupPayloadString, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);

  objc_storeStrong((id *)&self->_setupCode, 0);
}

- (void)setRequiresCustomFlow:(BOOL)a3
{
  self->_requiresCustomFlow = a3;
}

- (BOOL)requiresCustomFlow
{
  return self->_requiresCustomFlow;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setSetupPayloadString:(id)a3
{
}

- (NSString)setupPayloadString
{
  return self->_setupPayloadString;
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (void)setHasShortDiscriminator:(BOOL)a3
{
  self->_hasShortDiscriminator = a3;
}

- (BOOL)hasShortDiscriminator
{
  return self->_hasShortDiscriminator;
}

- (NSNumber)setupCode
{
  return self->_setupCode;
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(HMCHIPAccessorySetupPayload *)self hasShortDiscriminator])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMCHIPAccessorySetupPayload *)self hasShortDiscriminator];
    v5 = HMFBooleanToString();
    v6 = (void *)[v4 initWithName:@"Has Short Discriminator" value:v5];
    [v3 addObject:v6];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMCHIPAccessorySetupPayload *)self discriminator];
  v9 = (void *)[v7 initWithName:@"Discriminator" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMCHIPAccessorySetupPayload *)self setupCode];
  v12 = (void *)[v10 initWithName:@"Setup Code" value:v11];
  [v3 addObject:v12];

  v13 = [(HMCHIPAccessorySetupPayload *)self setupPayloadString];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
    v15 = [(HMCHIPAccessorySetupPayload *)self setupPayloadString];
    v16 = (void *)[v14 initWithName:@"Setup Payload String" value:v15];
    [v3 addObject:v16];
  }
  v17 = [(HMCHIPAccessorySetupPayload *)self vendorID];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
    v19 = [(HMCHIPAccessorySetupPayload *)self vendorID];
    v20 = (void *)[v18 initWithName:@"Vendor ID" value:v19];
    [v3 addObject:v20];
  }
  v21 = [(HMCHIPAccessorySetupPayload *)self productID];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F653F8]);
    v23 = [(HMCHIPAccessorySetupPayload *)self productID];
    v24 = (void *)[v22 initWithName:@"Product ID" value:v23];
    [v3 addObject:v24];
  }
  v25 = [(HMCHIPAccessorySetupPayload *)self serialNumber];

  if (v25)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F653F8]);
    v27 = [(HMCHIPAccessorySetupPayload *)self serialNumber];
    v28 = (void *)[v26 initWithName:@"Serial Number" value:v27];
    [v3 addObject:v28];
  }
  if ([(HMCHIPAccessorySetupPayload *)self requiresCustomFlow])
  {
    id v29 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMCHIPAccessorySetupPayload *)self requiresCustomFlow];
    v30 = HMFBooleanToString();
    v31 = (void *)[v29 initWithName:@"Requires Custom Flow" value:v30];
    [v3 addObject:v31];
  }
  v32 = (void *)[v3 copy];

  return (NSArray *)v32;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMCHIPAccessorySetupPayload)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCASP.ck.setupCode"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCASP.ck.discriminator"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = v5;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded setupCode: %@ discriminator: %@ ", (uint8_t *)&v19, 0x20u);
    }
    v17 = 0;
  }
  else
  {
    v12 = [(HMCHIPAccessorySetupPayload *)self initWithSetupCode:v5 discriminator:v6];
    -[HMCHIPAccessorySetupPayload setHasShortDiscriminator:](v12, "setHasShortDiscriminator:", [v4 decodeBoolForKey:@"HMCASP.ck.hasShortDiscriminator"]);
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCASP.ck.setupPayloadString"];
    [(HMCHIPAccessorySetupPayload *)v12 setSetupPayloadString:v13];

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCASP.ck.vendorID"];
    [(HMCHIPAccessorySetupPayload *)v12 setVendorID:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCASP.ck.productID"];
    [(HMCHIPAccessorySetupPayload *)v12 setProductID:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCASP.ck.serialNumber"];
    [(HMCHIPAccessorySetupPayload *)v12 setSerialNumber:v16];

    -[HMCHIPAccessorySetupPayload setRequiresCustomFlow:](v12, "setRequiresCustomFlow:", [v4 decodeBoolForKey:@"HMCASP.ck.requiresCustomFlow"]);
    v17 = v12;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(HMCHIPAccessorySetupPayload *)self setupCode];
  [v10 encodeObject:v4 forKey:@"HMCASP.ck.setupCode"];

  objc_msgSend(v10, "encodeBool:forKey:", -[HMCHIPAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"), @"HMCASP.ck.hasShortDiscriminator");
  v5 = [(HMCHIPAccessorySetupPayload *)self discriminator];
  [v10 encodeObject:v5 forKey:@"HMCASP.ck.discriminator"];

  uint64_t v6 = [(HMCHIPAccessorySetupPayload *)self setupPayloadString];
  [v10 encodeObject:v6 forKey:@"HMCASP.ck.setupPayloadString"];

  id v7 = [(HMCHIPAccessorySetupPayload *)self vendorID];
  [v10 encodeObject:v7 forKey:@"HMCASP.ck.vendorID"];

  BOOL v8 = [(HMCHIPAccessorySetupPayload *)self productID];
  [v10 encodeObject:v8 forKey:@"HMCASP.ck.productID"];

  v9 = [(HMCHIPAccessorySetupPayload *)self serialNumber];
  [v10 encodeObject:v9 forKey:@"HMCASP.ck.serialNumber"];

  objc_msgSend(v10, "encodeBool:forKey:", -[HMCHIPAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"), @"HMCASP.ck.requiresCustomFlow");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableCHIPAccessorySetupPayload allocWithZone:a3];
  v5 = [(HMCHIPAccessorySetupPayload *)self setupCode];
  uint64_t v6 = [(HMCHIPAccessorySetupPayload *)self discriminator];
  id v7 = [(HMCHIPAccessorySetupPayload *)v4 initWithSetupCode:v5 discriminator:v6];

  BOOL v8 = [(HMCHIPAccessorySetupPayload *)self setupPayloadString];
  [(HMCHIPAccessorySetupPayload *)v7 setSetupPayloadString:v8];

  v9 = [(HMCHIPAccessorySetupPayload *)self vendorID];
  [(HMCHIPAccessorySetupPayload *)v7 setVendorID:v9];

  id v10 = [(HMCHIPAccessorySetupPayload *)self productID];
  [(HMCHIPAccessorySetupPayload *)v7 setProductID:v10];

  v11 = [(HMCHIPAccessorySetupPayload *)self serialNumber];
  [(HMCHIPAccessorySetupPayload *)v7 setSerialNumber:v11];

  [(HMCHIPAccessorySetupPayload *)v7 setRequiresCustomFlow:[(HMCHIPAccessorySetupPayload *)self requiresCustomFlow]];
  return v7;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(HMCHIPAccessorySetupPayload *)self setupCode];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMCHIPAccessorySetupPayload *)self setupCode];
    BOOL v8 = [v6 setupCode];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(HMCHIPAccessorySetupPayload *)self discriminator];
      id v10 = [v6 discriminator];
      if (![v9 isEqualToNumber:v10]) {
        goto LABEL_14;
      }
      v11 = [(HMCHIPAccessorySetupPayload *)self setupPayloadString];
      v12 = [v6 setupPayloadString];
      int v13 = HMFEqualObjects();

      if (!v13) {
        goto LABEL_14;
      }
      id v14 = [(HMCHIPAccessorySetupPayload *)self vendorID];
      v15 = [v6 vendorID];
      int v16 = HMFEqualObjects();

      if (!v16) {
        goto LABEL_14;
      }
      v17 = [(HMCHIPAccessorySetupPayload *)self productID];
      id v18 = [v6 productID];
      int v19 = HMFEqualObjects();

      if (!v19) {
        goto LABEL_14;
      }
      v20 = [(HMCHIPAccessorySetupPayload *)self serialNumber];
      __int16 v21 = [v6 serialNumber];
      int v22 = HMFEqualObjects();

      if (v22)
      {
        BOOL v23 = [(HMCHIPAccessorySetupPayload *)self requiresCustomFlow];
        int v24 = v23 ^ [v6 requiresCustomFlow] ^ 1;
      }
      else
      {
LABEL_14:
        LOBYTE(v24) = 0;
      }
    }
    else
    {
      LOBYTE(v24) = 0;
    }
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (HMCHIPAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    int v13 = (HMUserCloudShareRepairInfo *)_HMFPreconditionFailure();
    [(HMUserCloudShareRepairInfo *)v13 .cxx_destruct];
    return result;
  }
  v15.receiver = self;
  v15.super_class = (Class)HMCHIPAccessorySetupPayload;
  id v10 = [(HMCHIPAccessorySetupPayload *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_setupCode, a3);
    objc_storeStrong((id *)&v11->_discriminator, a4);
  }

  return v11;
}

@end