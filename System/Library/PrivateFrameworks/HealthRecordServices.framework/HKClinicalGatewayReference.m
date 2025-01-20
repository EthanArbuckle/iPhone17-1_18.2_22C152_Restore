@interface HKClinicalGatewayReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalGatewayReference)init;
- (HKClinicalGatewayReference)initWithCoder:(id)a3;
- (HKClinicalGatewayReference)initWithGatewayID:(id)a3 gatewayBatchID:(id)a4 minCompatibleAPIVersion:(int64_t)a5 FHIRVersion:(id)a6;
- (HKFHIRVersion)FHIRVersion;
- (NSString)gatewayBatchID;
- (NSString)gatewayID;
- (int64_t)minCompatibleAPIVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalGatewayReference

- (HKClinicalGatewayReference)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalGatewayReference)initWithGatewayID:(id)a3 gatewayBatchID:(id)a4 minCompatibleAPIVersion:(int64_t)a5 FHIRVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKClinicalGatewayReference;
  v13 = [(HKClinicalGatewayReference *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    gatewayID = v13->_gatewayID;
    v13->_gatewayID = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    gatewayBatchID = v13->_gatewayBatchID;
    v13->_gatewayBatchID = (NSString *)v16;

    v13->_minCompatibleAPIVersion = a5;
    uint64_t v18 = [v12 copy];
    FHIRVersion = v13->_FHIRVersion;
    v13->_FHIRVersion = (HKFHIRVersion *)v18;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKClinicalGatewayReference *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_30:

      goto LABEL_31;
    }
    gatewayID = self->_gatewayID;
    id v10 = [(HKClinicalGatewayReference *)v8 gatewayID];
    if (gatewayID != v10)
    {
      uint64_t v11 = [(HKClinicalGatewayReference *)v8 gatewayID];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_29;
      }
      uint64_t v4 = (void *)v11;
      id v12 = self->_gatewayID;
      v13 = [(HKClinicalGatewayReference *)v8 gatewayID];
      if (![(NSString *)v12 isEqualToString:v13])
      {
        char v14 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v35 = v13;
    }
    gatewayBatchID = self->_gatewayBatchID;
    uint64_t v16 = [(HKClinicalGatewayReference *)v8 gatewayBatchID];
    if (gatewayBatchID == v16)
    {
      int64_t minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
      if (minCompatibleAPIVersion == [(HKClinicalGatewayReference *)v8 minCompatibleAPIVersion])goto LABEL_16; {
    }
      }
    else
    {
      uint64_t v17 = [(HKClinicalGatewayReference *)v8 gatewayBatchID];
      if (v17)
      {
        v3 = (void *)v17;
        uint64_t v18 = self->_gatewayBatchID;
        uint64_t v19 = [(HKClinicalGatewayReference *)v8 gatewayBatchID];
        v20 = v18;
        objc_super v21 = (void *)v19;
        if (![(NSString *)v20 isEqualToString:v19])
        {

          char v14 = 0;
          BOOL v30 = gatewayID == v10;
          goto LABEL_34;
        }
        v33 = v21;
        int64_t v22 = self->_minCompatibleAPIVersion;
        if (v22 != [(HKClinicalGatewayReference *)v8 minCompatibleAPIVersion])
        {
          char v14 = 0;
          v13 = v35;
LABEL_26:

LABEL_27:
          if (gatewayID != v10) {
            goto LABEL_28;
          }
LABEL_29:

          goto LABEL_30;
        }
LABEL_16:
        v34 = v4;
        FHIRVersion = self->_FHIRVersion;
        uint64_t v25 = [(HKClinicalGatewayReference *)v8 FHIRVersion];
        if (FHIRVersion == (HKFHIRVersion *)v25)
        {

          char v14 = 1;
        }
        else
        {
          v26 = (void *)v25;
          uint64_t v27 = [(HKClinicalGatewayReference *)v8 FHIRVersion];
          if (v27)
          {
            v28 = (void *)v27;
            v29 = self->_FHIRVersion;
            v32 = [(HKClinicalGatewayReference *)v8 FHIRVersion];
            char v14 = [(HKFHIRVersion *)v29 isEqual:v32];

            if (gatewayBatchID == v16)
            {
            }
            else
            {
            }
            BOOL v30 = gatewayID == v10;
            uint64_t v4 = v34;
LABEL_34:
            v13 = v35;
            if (v30) {
              goto LABEL_29;
            }
            goto LABEL_28;
          }

          char v14 = 0;
        }
        BOOL v30 = gatewayBatchID == v16;
        uint64_t v4 = v34;
        v13 = v35;
        if (v30) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
    char v14 = 0;
    v13 = v35;
    goto LABEL_27;
  }
  char v14 = 1;
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_gatewayID hash];
  NSUInteger v4 = [(NSString *)self->_gatewayBatchID hash] ^ v3;
  int64_t minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
  return v4 ^ minCompatibleAPIVersion ^ [(HKFHIRVersion *)self->_FHIRVersion hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  gatewayID = self->_gatewayID;
  id v5 = a3;
  [v5 encodeObject:gatewayID forKey:@"gatewayID"];
  [v5 encodeObject:self->_gatewayBatchID forKey:@"gatewayBatchID"];
  [v5 encodeInteger:self->_minCompatibleAPIVersion forKey:@"minCompatibleAPIVersion"];
  [v5 encodeObject:self->_FHIRVersion forKey:@"FHIRVersion"];
}

- (HKClinicalGatewayReference)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gatewayID"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gatewayBatchID"];
    if (v6 && ([v4 containsValueForKey:@"minCompatibleAPIVersion"] & 1) != 0)
    {
      uint64_t v7 = [v4 decodeIntegerForKey:@"minCompatibleAPIVersion"];
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRVersion"];
      if (v8)
      {
        self = [(HKClinicalGatewayReference *)self initWithGatewayID:v5 gatewayBatchID:v6 minCompatibleAPIVersion:v7 FHIRVersion:v8];
        v9 = self;
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v9 = 0;
      }
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (NSString)gatewayID
{
  return self->_gatewayID;
}

- (NSString)gatewayBatchID
{
  return self->_gatewayBatchID;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayBatchID, 0);
  objc_storeStrong((id *)&self->_gatewayID, 0);

  objc_storeStrong((id *)&self->_FHIRVersion, 0);
}

@end