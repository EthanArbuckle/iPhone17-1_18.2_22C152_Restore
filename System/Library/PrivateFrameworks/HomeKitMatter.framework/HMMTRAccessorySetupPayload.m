@interface HMMTRAccessorySetupPayload
+ (BOOL)isValidSetupPayloadURLScheme:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)hasShortDiscriminator;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresCustomFlow;
- (BOOL)supportsBLE;
- (BOOL)supportsIP;
- (BOOL)supportsSoftAP;
- (HMMTRAccessorySetupPayload)initWithCHIPSetupPayload:(id)a3;
- (HMMTRAccessorySetupPayload)initWithCHIPSetupPayload:(id)a3 setupPayloadString:(id)a4;
- (HMMTRAccessorySetupPayload)initWithCoder:(id)a3;
- (HMMTRAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4;
- (HMMTRAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4 isShortDiscriminator:(BOOL)a5;
- (HMMTRAccessorySetupPayload)initWithSetupCodeString:(id)a3;
- (HMMTRAccessorySetupPayload)initWithSetupPayloadString:(id)a3;
- (NSNumber)discriminator;
- (NSNumber)productID;
- (NSNumber)setupCode;
- (NSNumber)vendorID;
- (NSString)serialNumber;
- (NSString)setupID;
- (NSString)setupPayloadString;
- (id)attributeDescriptions;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasShortDiscriminator:(BOOL)a3;
- (void)setProductID:(id)a3;
- (void)setRequiresCustomFlow:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSetupPayloadString:(id)a3;
- (void)setSupportsBLE:(BOOL)a3;
- (void)setSupportsIP:(BOOL)a3;
- (void)setSupportsSoftAP:(BOOL)a3;
- (void)setVendorID:(id)a3;
@end

@implementation HMMTRAccessorySetupPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayloadString, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
}

- (void)setSetupPayloadString:(id)a3
{
}

- (NSString)setupPayloadString
{
  return self->_setupPayloadString;
}

- (void)setSupportsBLE:(BOOL)a3
{
  self->_supportsBLE = a3;
}

- (BOOL)supportsBLE
{
  return self->_supportsBLE;
}

- (void)setSupportsSoftAP:(BOOL)a3
{
  self->_supportsSoftAP = a3;
}

- (BOOL)supportsSoftAP
{
  return self->_supportsSoftAP;
}

- (void)setSupportsIP:(BOOL)a3
{
  self->_supportsIP = a3;
}

- (BOOL)supportsIP
{
  return self->_supportsIP;
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

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMMTRAccessorySetupPayload *)self discriminator];
  v6 = (void *)[v4 initWithName:@"Discriminator" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMMTRAccessorySetupPayload *)self hasShortDiscriminator];
  v8 = HMFBooleanToString();
  v9 = (void *)[v7 initWithName:@"Has Short Discriminator" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMMTRAccessorySetupPayload *)self setupCode];
  v12 = (void *)[v10 initWithName:@"Setup Code" value:v11];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = [(HMMTRAccessorySetupPayload *)self setupID];
  v15 = (void *)[v13 initWithName:@"Setup ID" value:v14];
  [v3 addObject:v15];

  v16 = [(HMMTRAccessorySetupPayload *)self vendorID];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F424F8]);
    v18 = [(HMMTRAccessorySetupPayload *)self vendorID];
    v19 = (void *)[v17 initWithName:@"Vendor ID" value:v18];
    [v3 addObject:v19];
  }
  v20 = [(HMMTRAccessorySetupPayload *)self productID];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x263F424F8]);
    v22 = [(HMMTRAccessorySetupPayload *)self productID];
    v23 = (void *)[v21 initWithName:@"Product ID" value:v22];
    [v3 addObject:v23];
  }
  v24 = [(HMMTRAccessorySetupPayload *)self serialNumber];

  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x263F424F8]);
    v26 = [(HMMTRAccessorySetupPayload *)self serialNumber];
    v27 = (void *)[v25 initWithName:@"Serial Number" value:v26];
    [v3 addObject:v27];
  }
  v28 = [(HMMTRAccessorySetupPayload *)self setupPayloadString];

  if (v28)
  {
    id v29 = objc_alloc(MEMORY[0x263F424F8]);
    v30 = [(HMMTRAccessorySetupPayload *)self setupPayloadString];
    v31 = (void *)[v29 initWithName:@"Raw Setup Payload" value:v30];
    [v3 addObject:v31];
  }
  if ([(HMMTRAccessorySetupPayload *)self requiresCustomFlow])
  {
    id v32 = objc_alloc(MEMORY[0x263F424F8]);
    [(HMMTRAccessorySetupPayload *)self requiresCustomFlow];
    v33 = HMFBooleanToString();
    v34 = (void *)[v32 initWithName:@"Requires Custom Flow" value:v33];
    [v3 addObject:v34];
  }
  v35 = (void *)[v3 copy];

  return v35;
}

- (id)description
{
  return (id)MEMORY[0x270F30880](self, a2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (HMMTRAccessorySetupPayload)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPASP.ck.setupCode"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPASP.ck.discriminator"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x2533B64D0]();
    v12 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded setupCode: %@ discriminator: %@ ", (uint8_t *)&v19, 0x20u);
    }
    id v17 = 0;
  }
  else
  {
    v12 = -[HMMTRAccessorySetupPayload initWithSetupCode:discriminator:isShortDiscriminator:](self, "initWithSetupCode:discriminator:isShortDiscriminator:", v5, v6, [v4 decodeBoolForKey:@"CPASP.ck.hasShortDiscriminator"]);
    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPASP.ck.vendorID"];
    [(HMMTRAccessorySetupPayload *)v12 setVendorID:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPASP.ck.productID"];
    [(HMMTRAccessorySetupPayload *)v12 setProductID:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPASP.ck.serialNumber"];
    [(HMMTRAccessorySetupPayload *)v12 setSerialNumber:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPASP.ck.setupPayloadString"];
    [(HMMTRAccessorySetupPayload *)v12 setSetupPayloadString:v16];

    -[HMMTRAccessorySetupPayload setRequiresCustomFlow:](v12, "setRequiresCustomFlow:", [v4 decodeBoolForKey:@"CPASP.ck.requiresCustomFlow"]);
    id v17 = v12;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(HMMTRAccessorySetupPayload *)self setupCode];
  [v10 encodeObject:v4 forKey:@"CPASP.ck.setupCode"];

  v5 = [(HMMTRAccessorySetupPayload *)self discriminator];
  [v10 encodeObject:v5 forKey:@"CPASP.ck.discriminator"];

  objc_msgSend(v10, "encodeBool:forKey:", -[HMMTRAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"), @"CPASP.ck.hasShortDiscriminator");
  uint64_t v6 = [(HMMTRAccessorySetupPayload *)self vendorID];
  [v10 encodeObject:v6 forKey:@"CPASP.ck.vendorID"];

  id v7 = [(HMMTRAccessorySetupPayload *)self productID];
  [v10 encodeObject:v7 forKey:@"CPASP.ck.productID"];

  BOOL v8 = [(HMMTRAccessorySetupPayload *)self serialNumber];
  [v10 encodeObject:v8 forKey:@"CPASP.ck.serialNumber"];

  v9 = [(HMMTRAccessorySetupPayload *)self setupPayloadString];
  [v10 encodeObject:v9 forKey:@"CPASP.ck.setupPayloadString"];

  objc_msgSend(v10, "encodeBool:forKey:", -[HMMTRAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"), @"CPASP.ck.requiresCustomFlow");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMTRMutableAccessorySetupPayload allocWithZone:a3];
  v5 = [(HMMTRAccessorySetupPayload *)self setupCode];
  uint64_t v6 = [(HMMTRAccessorySetupPayload *)self discriminator];
  id v7 = [(HMMTRAccessorySetupPayload *)v4 initWithSetupCode:v5 discriminator:v6 isShortDiscriminator:[(HMMTRAccessorySetupPayload *)self hasShortDiscriminator]];

  BOOL v8 = [(HMMTRAccessorySetupPayload *)self vendorID];
  [(HMMTRAccessorySetupPayload *)v7 setVendorID:v8];

  v9 = [(HMMTRAccessorySetupPayload *)self productID];
  [(HMMTRAccessorySetupPayload *)v7 setProductID:v9];

  id v10 = [(HMMTRAccessorySetupPayload *)self serialNumber];
  [(HMMTRAccessorySetupPayload *)v7 setSerialNumber:v10];

  v11 = [(HMMTRAccessorySetupPayload *)self setupPayloadString];
  [(HMMTRAccessorySetupPayload *)v7 setSetupPayloadString:v11];

  [(HMMTRAccessorySetupPayload *)v7 setRequiresCustomFlow:[(HMMTRAccessorySetupPayload *)self requiresCustomFlow]];
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

+ (BOOL)isValidSetupPayloadURLScheme:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"CH"])
  {
    v5 = (void *)MEMORY[0x2533B64D0]();
    id v6 = a1;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Legacy Matter prefix 'CH' detected, support will be removed in the future.", (uint8_t *)&v11, 0xCu);
    }
    char v9 = 1;
  }
  else
  {
    char v9 = [v4 isEqualToString:@"MT"];
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMMTRAccessorySetupPayload *)self setupCode];
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
    id v7 = [(HMMTRAccessorySetupPayload *)self setupCode];
    BOOL v8 = [v6 setupCode];
    if ([v7 isEqualToNumber:v8])
    {
      char v9 = [(HMMTRAccessorySetupPayload *)self discriminator];
      id v10 = [v6 discriminator];
      if (![v9 isEqualToNumber:v10]) {
        goto LABEL_15;
      }
      int v11 = [(HMMTRAccessorySetupPayload *)self hasShortDiscriminator];
      if (v11 != [v6 hasShortDiscriminator]) {
        goto LABEL_15;
      }
      v12 = [(HMMTRAccessorySetupPayload *)self vendorID];
      uint64_t v13 = [v6 vendorID];
      int v14 = HMFEqualObjects();

      if (!v14) {
        goto LABEL_15;
      }
      v15 = [(HMMTRAccessorySetupPayload *)self productID];
      v16 = [v6 productID];
      int v17 = HMFEqualObjects();

      if (!v17) {
        goto LABEL_15;
      }
      v18 = [(HMMTRAccessorySetupPayload *)self serialNumber];
      int v19 = [v6 serialNumber];
      int v20 = HMFEqualObjects();

      if (!v20) {
        goto LABEL_15;
      }
      __int16 v21 = [(HMMTRAccessorySetupPayload *)self setupPayloadString];
      v22 = [v6 setupPayloadString];
      int v23 = HMFEqualObjects();

      if (v23)
      {
        BOOL v24 = [(HMMTRAccessorySetupPayload *)self requiresCustomFlow];
        int v25 = v24 ^ [v6 requiresCustomFlow] ^ 1;
      }
      else
      {
LABEL_15:
        LOBYTE(v25) = 0;
      }
    }
    else
    {
      LOBYTE(v25) = 0;
    }
  }
  else
  {
    LOBYTE(v25) = 0;
  }

  return v25;
}

- (NSString)setupID
{
  unint64_t v3 = [(HMMTRAccessorySetupPayload *)self setupCode];
  id v4 = [(HMMTRAccessorySetupPayload *)self discriminator];
  v5 = +[HMMTRUtilities setupIDFromSetupCode:v3 discriminator:v4];

  return (NSString *)v5;
}

- (HMMTRAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4 isShortDiscriminator:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  int v11 = v10;
  if (!v10)
  {
LABEL_7:
    v15 = (HMMTRAccessorySetupPayload *)_HMFPreconditionFailure();
    return [(HMMTRAccessorySetupPayload *)v15 initWithSetupCode:v17 discriminator:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMMTRAccessorySetupPayload;
  v12 = [(HMMTRAccessorySetupPayload *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_setupCode, a3);
    objc_storeStrong((id *)&v13->_discriminator, a4);
    v13->_hasShortDiscriminator = a5;
  }

  return v13;
}

- (HMMTRAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4
{
  return [(HMMTRAccessorySetupPayload *)self initWithSetupCode:a3 discriminator:a4 isShortDiscriminator:0];
}

- (HMMTRAccessorySetupPayload)initWithCHIPSetupPayload:(id)a3 setupPayloadString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 setUpPINCode];
  id v9 = [v6 discriminator];
  id v10 = -[HMMTRAccessorySetupPayload initWithSetupCode:discriminator:isShortDiscriminator:](self, "initWithSetupCode:discriminator:isShortDiscriminator:", v8, v9, [v6 hasShortDiscriminator]);

  int v11 = [v6 vendorID];
  [(HMMTRAccessorySetupPayload *)v10 setVendorID:v11];

  v12 = [v6 productID];
  [(HMMTRAccessorySetupPayload *)v10 setProductID:v12];

  uint64_t v13 = [v6 serialNumber];
  [(HMMTRAccessorySetupPayload *)v10 setSerialNumber:v13];

  if (!v7)
  {
    uint64_t v17 = 0;
    id v7 = [v6 qrCodeString:&v17];
  }
  [(HMMTRAccessorySetupPayload *)v10 setSetupPayloadString:v7];
  -[HMMTRAccessorySetupPayload setRequiresCustomFlow:](v10, "setRequiresCustomFlow:", [v6 commissioningFlow] == 2);
  int v14 = [v6 rendezvousInformation];
  v15 = v14;
  if (v14)
  {
    -[HMMTRAccessorySetupPayload setSupportsBLE:](v10, "setSupportsBLE:", ((unint64_t)[v14 unsignedIntegerValue] >> 1) & 1);
    -[HMMTRAccessorySetupPayload setSupportsSoftAP:](v10, "setSupportsSoftAP:", [v15 unsignedIntegerValue] & 1);
    -[HMMTRAccessorySetupPayload setSupportsIP:](v10, "setSupportsIP:", ((unint64_t)[v15 unsignedIntegerValue] >> 2) & 1);
  }

  return v10;
}

- (HMMTRAccessorySetupPayload)initWithCHIPSetupPayload:(id)a3
{
  return [(HMMTRAccessorySetupPayload *)self initWithCHIPSetupPayload:a3 setupPayloadString:0];
}

- (HMMTRAccessorySetupPayload)initWithSetupPayloadString:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F10F40]) initWithBase38Representation:v4];
  id v15 = 0;
  id v7 = [v6 populatePayload:&v15];
  id v8 = v15;
  if (v7)
  {
    id v9 = [(HMMTRAccessorySetupPayload *)self initWithCHIPSetupPayload:v7 setupPayloadString:v5];
    id v10 = v9;
  }
  else
  {
    int v11 = (void *)MEMORY[0x2533B64D0]();
    id v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      objc_super v19 = v5;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse CHIP setup payload from setup payload string %@: %@", buf, 0x20u);
    }
    id v10 = 0;
  }

  return v10;
}

- (HMMTRAccessorySetupPayload)initWithSetupCodeString:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F10EE0]) initWithDecimalStringRepresentation:v4];
  id v15 = 0;
  id v7 = [v6 populatePayload:&v15];
  id v8 = v15;
  if (v7)
  {
    id v9 = [(HMMTRAccessorySetupPayload *)self initWithCHIPSetupPayload:v7 setupPayloadString:v5];
    id v10 = v9;
  }
  else
  {
    int v11 = (void *)MEMORY[0x2533B64D0]();
    id v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      objc_super v19 = v5;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse CHIP setup payload from decimal string %@: %@", buf, 0x20u);
    }
    id v10 = 0;
  }

  return v10;
}

@end