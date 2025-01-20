@interface HMSetupAccessoryPayload
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)requiresMatterCustomCommissioningFlow;
- (BOOL)supportsBTLE;
- (BOOL)supportsIP;
- (BOOL)supportsWAC;
- (HMAccessoryCategory)category;
- (HMCHIPAccessorySetupPayload)chipAccessorySetupPayload;
- (HMSetupAccessoryPayload)initWithCoder:(id)a3;
- (HMSetupAccessoryPayload)initWithHAPSetupCode:(id)a3;
- (HMSetupAccessoryPayload)initWithHAPSetupPayloadURL:(id)a3 error:(id *)a4;
- (HMSetupAccessoryPayload)initWithSetupCode:(id)a3 communicationProtocol:(int64_t)a4;
- (NSArray)attributeDescriptions;
- (NSNumber)categoryNumber;
- (NSNumber)threadIdentifier;
- (NSString)accessoryName;
- (NSString)description;
- (NSString)productNumber;
- (NSString)setupCode;
- (NSString)setupID;
- (NSString)shortDescription;
- (NSURL)setupPayloadURL;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)communicationProtocol;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryNumber:(id)a3;
- (void)setChipAccessorySetupPayload:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setProductNumber:(id)a3;
- (void)setSetupID:(id)a3;
- (void)setSetupPayloadURL:(id)a3;
- (void)setSupportsBTLE:(BOOL)a3;
- (void)setSupportsIP:(BOOL)a3;
- (void)setSupportsWAC:(BOOL)a3;
- (void)setThreadIdentifier:(id)a3;
@end

@implementation HMSetupAccessoryPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipAccessorySetupPayload, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_categoryNumber, 0);
  objc_storeStrong((id *)&self->_setupID, 0);
  objc_storeStrong((id *)&self->_setupPayloadURL, 0);

  objc_storeStrong((id *)&self->_setupCode, 0);
}

- (void)setChipAccessorySetupPayload:(id)a3
{
}

- (HMCHIPAccessorySetupPayload)chipAccessorySetupPayload
{
  return self->_chipAccessorySetupPayload;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSNumber)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setSupportsBTLE:(BOOL)a3
{
  self->_supportsBTLE = a3;
}

- (BOOL)supportsBTLE
{
  return self->_supportsBTLE;
}

- (void)setSupportsWAC:(BOOL)a3
{
  self->_supportsWAC = a3;
}

- (BOOL)supportsWAC
{
  return self->_supportsWAC;
}

- (void)setSupportsIP:(BOOL)a3
{
  self->_supportsIP = a3;
}

- (BOOL)supportsIP
{
  return self->_supportsIP;
}

- (void)setProductNumber:(id)a3
{
}

- (NSString)productNumber
{
  return self->_productNumber;
}

- (void)setCategoryNumber:(id)a3
{
}

- (NSNumber)categoryNumber
{
  return self->_categoryNumber;
}

- (void)setSetupID:(id)a3
{
}

- (NSString)setupID
{
  return self->_setupID;
}

- (void)setSetupPayloadURL:(id)a3
{
}

- (NSURL)setupPayloadURL
{
  return self->_setupPayloadURL;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = HMStringFromAccessoryCommunicationProtocol([(HMSetupAccessoryPayload *)self communicationProtocol]);
  v6 = (void *)[v4 initWithName:@"Communication Protocol" value:v5];
  [v3 addObject:v6];

  v7 = [(HMSetupAccessoryPayload *)self setupCode];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"Setup Code" value:@"<not nil>"];
    [v3 addObject:v8];
  }
  v9 = [(HMSetupAccessoryPayload *)self setupPayloadURL];

  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"Setup Payload URL" value:@"<not nil>"];
    [v3 addObject:v10];
  }
  v11 = [(HMSetupAccessoryPayload *)self setupID];

  if (v11)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"Setup ID" value:@"<not nil>"];
    [v3 addObject:v12];
  }
  v13 = [(HMSetupAccessoryPayload *)self categoryNumber];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
    v15 = [(HMSetupAccessoryPayload *)self categoryNumber];
    v16 = (void *)[v14 initWithName:@"Category Number" value:v15];
    [v3 addObject:v16];
  }
  v17 = [(HMSetupAccessoryPayload *)self productNumber];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
    v19 = [(HMSetupAccessoryPayload *)self productNumber];
    v20 = (void *)[v18 initWithName:@"Product Number" value:v19];
    [v3 addObject:v20];
  }
  if ([(HMSetupAccessoryPayload *)self supportsIP])
  {
    id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryPayload *)self supportsIP];
    v22 = HMFBooleanToString();
    v23 = (void *)[v21 initWithName:@"Supports IP" value:v22];
    [v3 addObject:v23];
  }
  if ([(HMSetupAccessoryPayload *)self supportsWAC])
  {
    id v24 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryPayload *)self supportsWAC];
    v25 = HMFBooleanToString();
    v26 = (void *)[v24 initWithName:@"Supports WAC" value:v25];
    [v3 addObject:v26];
  }
  if ([(HMSetupAccessoryPayload *)self supportsBTLE])
  {
    id v27 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryPayload *)self supportsBTLE];
    v28 = HMFBooleanToString();
    v29 = (void *)[v27 initWithName:@"Supports BTLE" value:v28];
    [v3 addObject:v29];
  }
  if ([(HMSetupAccessoryPayload *)self isPaired])
  {
    id v30 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMSetupAccessoryPayload *)self isPaired];
    v31 = HMFBooleanToString();
    v32 = (void *)[v30 initWithName:@"Is Paired" value:v31];
    [v3 addObject:v32];
  }
  v33 = [(HMSetupAccessoryPayload *)self threadIdentifier];

  if (v33)
  {
    id v34 = objc_alloc(MEMORY[0x1E4F653F8]);
    v35 = [(HMSetupAccessoryPayload *)self threadIdentifier];
    v36 = (void *)[v34 initWithName:@"Thread Identifier" value:v35];
    [v3 addObject:v36];
  }
  v37 = [(HMSetupAccessoryPayload *)self chipAccessorySetupPayload];

  if (v37)
  {
    id v38 = objc_alloc(MEMORY[0x1E4F653F8]);
    v39 = [(HMSetupAccessoryPayload *)self chipAccessorySetupPayload];
    v40 = (void *)[v38 initWithName:@"CHIP Setup Payload" value:v39];
    [v3 addObject:v40];
  }
  v41 = (void *)[v3 copy];

  return (NSArray *)v41;
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

- (unint64_t)hash
{
  v3 = [(HMSetupAccessoryPayload *)self setupCode];
  uint64_t v4 = [v3 hash];

  v5 = [(HMSetupAccessoryPayload *)self setupID];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMSetupAccessoryPayload *)self threadIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMSetupAccessoryPayload *)a3;
  if (self == v4)
  {
    char v31 = 1;
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
    uint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMSetupAccessoryPayload *)self setupCode];
      unint64_t v8 = [(HMSetupAccessoryPayload *)v6 setupCode];
      if (![v7 isEqualToString:v8]) {
        goto LABEL_18;
      }
      int64_t v9 = [(HMSetupAccessoryPayload *)self communicationProtocol];
      if (v9 != [(HMSetupAccessoryPayload *)v6 communicationProtocol]) {
        goto LABEL_18;
      }
      v10 = [(HMSetupAccessoryPayload *)self setupPayloadURL];
      v11 = [(HMSetupAccessoryPayload *)v6 setupPayloadURL];
      int v12 = HMFEqualObjects();

      if (!v12) {
        goto LABEL_18;
      }
      v13 = [(HMSetupAccessoryPayload *)self setupID];
      id v14 = [(HMSetupAccessoryPayload *)v6 setupID];
      int v15 = HMFEqualObjects();

      if (!v15) {
        goto LABEL_18;
      }
      v16 = [(HMSetupAccessoryPayload *)self categoryNumber];
      v17 = [(HMSetupAccessoryPayload *)v6 categoryNumber];
      int v18 = HMFEqualObjects();

      if (!v18) {
        goto LABEL_18;
      }
      v19 = [(HMSetupAccessoryPayload *)self productNumber];
      v20 = [(HMSetupAccessoryPayload *)v6 productNumber];
      int v21 = HMFEqualObjects();

      if (!v21) {
        goto LABEL_18;
      }
      BOOL v22 = [(HMSetupAccessoryPayload *)self supportsIP];
      if (v22 != [(HMSetupAccessoryPayload *)v6 supportsIP]) {
        goto LABEL_18;
      }
      BOOL v23 = [(HMSetupAccessoryPayload *)self supportsWAC];
      if (v23 != [(HMSetupAccessoryPayload *)v6 supportsWAC]) {
        goto LABEL_18;
      }
      BOOL v24 = [(HMSetupAccessoryPayload *)self supportsBTLE];
      if (v24 != [(HMSetupAccessoryPayload *)v6 supportsBTLE]) {
        goto LABEL_18;
      }
      BOOL v25 = [(HMSetupAccessoryPayload *)self isPaired];
      if (v25 != [(HMSetupAccessoryPayload *)v6 isPaired]) {
        goto LABEL_18;
      }
      v26 = [(HMSetupAccessoryPayload *)self threadIdentifier];
      id v27 = [(HMSetupAccessoryPayload *)v6 threadIdentifier];
      int v28 = HMFEqualObjects();

      if (v28)
      {
        v29 = [(HMSetupAccessoryPayload *)self chipAccessorySetupPayload];
        id v30 = [(HMSetupAccessoryPayload *)v6 chipAccessorySetupPayload];
        char v31 = HMFEqualObjects();
      }
      else
      {
LABEL_18:
        char v31 = 0;
      }
    }
    else
    {
      char v31 = 0;
    }
  }
  return v31;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[HMMutableSetupAccessoryPayload allocWithZone:a3];
  v5 = [(HMSetupAccessoryPayload *)self setupCode];
  uint64_t v6 = [(HMSetupAccessoryPayload *)v4 initWithSetupCode:v5 communicationProtocol:[(HMSetupAccessoryPayload *)self communicationProtocol]];

  v7 = [(HMSetupAccessoryPayload *)self setupPayloadURL];
  [(HMSetupAccessoryPayload *)v6 setSetupPayloadURL:v7];

  unint64_t v8 = [(HMSetupAccessoryPayload *)self setupID];
  [(HMSetupAccessoryPayload *)v6 setSetupID:v8];

  int64_t v9 = [(HMSetupAccessoryPayload *)self categoryNumber];
  [(HMSetupAccessoryPayload *)v6 setCategoryNumber:v9];

  v10 = [(HMSetupAccessoryPayload *)self productNumber];
  [(HMSetupAccessoryPayload *)v6 setProductNumber:v10];

  [(HMSetupAccessoryPayload *)v6 setSupportsIP:[(HMSetupAccessoryPayload *)self supportsIP]];
  [(HMSetupAccessoryPayload *)v6 setSupportsWAC:[(HMSetupAccessoryPayload *)self supportsWAC]];
  [(HMSetupAccessoryPayload *)v6 setSupportsBTLE:[(HMSetupAccessoryPayload *)self supportsBTLE]];
  [(HMSetupAccessoryPayload *)v6 setPaired:[(HMSetupAccessoryPayload *)self isPaired]];
  v11 = [(HMSetupAccessoryPayload *)self threadIdentifier];
  [(HMSetupAccessoryPayload *)v6 setThreadIdentifier:v11];

  int v12 = [(HMSetupAccessoryPayload *)self chipAccessorySetupPayload];
  [(HMSetupAccessoryPayload *)v6 setChipAccessorySetupPayload:v12];

  return v6;
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

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMSetupAccessoryPayload *)self setupCode];
  [v4 encodeObject:v5 forKey:@"setupCode"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSetupAccessoryPayload communicationProtocol](self, "communicationProtocol"), @"communicationProtocol");
  uint64_t v6 = [(HMSetupAccessoryPayload *)self setupPayloadURL];
  [v4 encodeObject:v6 forKey:@"setupPayload"];

  v7 = [(HMSetupAccessoryPayload *)self setupID];
  [v4 encodeObject:v7 forKey:@"setupID"];

  unint64_t v8 = [(HMSetupAccessoryPayload *)self categoryNumber];
  [v4 encodeObject:v8 forKey:@"categoryNumber"];

  int64_t v9 = [(HMSetupAccessoryPayload *)self productNumber];
  [v4 encodeObject:v9 forKey:@"productNumber"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload supportsIP](self, "supportsIP"), @"supportsIP");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload supportsWAC](self, "supportsWAC"), @"supportsWAC");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload supportsBTLE](self, "supportsBTLE"), @"supportsBTLE");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload isPaired](self, "isPaired"), @"isPaired");
  v10 = [(HMSetupAccessoryPayload *)self threadIdentifier];
  [v4 encodeObject:v10 forKey:@"threadIdentifier"];

  id v11 = [(HMSetupAccessoryPayload *)self chipAccessorySetupPayload];
  [v4 encodeObject:v11 forKey:@"chipAccessorySetupPayload"];
}

- (HMSetupAccessoryPayload)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupCode"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"communicationProtocol"];
  if (v5)
  {
    v7 = [(HMSetupAccessoryPayload *)self initWithSetupCode:v5 communicationProtocol:v6];
    unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupPayload"];
    [(HMSetupAccessoryPayload *)v7 setSetupPayloadURL:v8];

    int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupID"];
    [(HMSetupAccessoryPayload *)v7 setSetupID:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryNumber"];
    [(HMSetupAccessoryPayload *)v7 setCategoryNumber:v10];

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productNumber"];
    [(HMSetupAccessoryPayload *)v7 setProductNumber:v11];

    -[HMSetupAccessoryPayload setSupportsIP:](v7, "setSupportsIP:", [v4 decodeBoolForKey:@"supportsIP"]);
    -[HMSetupAccessoryPayload setSupportsWAC:](v7, "setSupportsWAC:", [v4 decodeBoolForKey:@"supportsWAC"]);
    -[HMSetupAccessoryPayload setSupportsBTLE:](v7, "setSupportsBTLE:", [v4 decodeBoolForKey:@"supportsBTLE"]);
    -[HMSetupAccessoryPayload setPaired:](v7, "setPaired:", [v4 decodeBoolForKey:@"isPaired"]);
    int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
    [(HMSetupAccessoryPayload *)v7 setThreadIdentifier:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chipAccessorySetupPayload"];
    [(HMSetupAccessoryPayload *)v7 setChipAccessorySetupPayload:v13];

    id v14 = v7;
  }
  else
  {
    int v15 = (void *)MEMORY[0x19F3A64A0](v6);
    v7 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from setupCode: %@", (uint8_t *)&v19, 0x16u);
    }
    id v14 = 0;
  }

  return v14;
}

- (BOOL)requiresMatterCustomCommissioningFlow
{
  v2 = [(HMSetupAccessoryPayload *)self chipAccessorySetupPayload];
  char v3 = [v2 requiresCustomFlow];

  return v3;
}

- (HMAccessoryCategory)category
{
  char v3 = +[HMHAPMetadata getSharedInstance];
  id v4 = [(HMSetupAccessoryPayload *)self categoryNumber];
  v5 = [v3 categoryForIdentifier:v4];

  return (HMAccessoryCategory *)v5;
}

- (HMSetupAccessoryPayload)initWithSetupCode:(id)a3 communicationProtocol:(int64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    int v12 = (HMSetupAccessoryPayload *)_HMFPreconditionFailure();
    return [(HMSetupAccessoryPayload *)v12 initWithSetupCode:v14];
  }
  v7 = v6;
  v15.receiver = self;
  v15.super_class = (Class)HMSetupAccessoryPayload;
  unint64_t v8 = [(HMSetupAccessoryPayload *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    setupCode = v8->_setupCode;
    v8->_setupCode = (NSString *)v9;

    v8->_communicationProtocol = a4;
  }

  return v8;
}

- (HMSetupAccessoryPayload)initWithHAPSetupCode:(id)a3
{
  return [(HMSetupAccessoryPayload *)self initWithSetupCode:a3 communicationProtocol:1];
}

- (HMSetupAccessoryPayload)initWithHAPSetupPayloadURL:(id)a3 error:(id *)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 host];
  unint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 dataUsingEncoding:4];
    unint64_t v10 = [v9 length];
    unint64_t v11 = v10;
    if (v10 <= 0xC)
    {
      int v12 = (void *)MEMORY[0x19F3A64A0]();
      SEL v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v102 = (uint64_t)v14;
        __int16 v103 = 2048;
        uint64_t v104 = v11;
        __int16 v105 = 2048;
        uint64_t v106 = 13;
        __int16 v107 = 2112;
        id v108 = v6;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload length '%lu' is less than minimum length '%lu' for setupPayloadURL '%@'", buf, 0x2Au);
      }
      if (a4)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        id v15 = 0;
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = 0;
        v16 = 0;
      }
      goto LABEL_94;
    }
    MEMORY[0x1F4188790](v10);
    v20 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    [v9 getBytes:v20 length:v11];
    id v100 = 0;
    unint64_t v21 = base36Decode((uint64_t)v20, 9, &v100);
    uint64_t v23 = v22;
    id v96 = v100;
    if (!(v21 | v23))
    {
      int v28 = (void *)MEMORY[0x19F3A64A0]();
      v29 = HMFGetOSLogHandle();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      id v15 = v96;
      if (v30)
      {
        char v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v102 = (uint64_t)v31;
        __int16 v103 = 2112;
        uint64_t v104 = (uint64_t)v9;
        __int16 v105 = 2112;
        uint64_t v106 = (uint64_t)v15;
        _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload base-36 decode failed for payload %@  error %@", buf, 0x20u);
      }
      if (a4)
      {
        id v15 = v15;
        v16 = 0;
        *a4 = v15;
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_94;
    }
    v95 = v9;
    BOOL v24 = self;
    if (((v21 >> 43) & 7) != 0)
    {
      BOOL v25 = (void *)MEMORY[0x19F3A64A0]();
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v102 = (uint64_t)v27;
        __int16 v103 = 1024;
        LODWORD(v104) = (v21 >> 43) & 7;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: Version in the setup payload is not zero - 0x%x", buf, 0x12u);
      }
      id v15 = v96;
      if (a4)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:2004];
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      uint64_t v9 = v95;
      goto LABEL_94;
    }
    v32 = self;
    if ((v21 & 0x18000000000) == 0)
    {
      id v33 = (id)((v21 >> 39) & 0xF);
      id v94 = v33;
      if (v11 >= 0xE)
      {
        id v34 = (uint64_t *)MEMORY[0x19F3A64A0]();
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = HMFGetLogIdentifier();
          v93 = v34;
          v37 = (void *)v36;
          *(_DWORD *)buf = 138543618;
          uint64_t v102 = v36;
          __int16 v103 = 2048;
          uint64_t v104 = v11;
          _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload length larger than specified format - %tu", buf, 0x16u);

          id v34 = v93;
        }

        v32 = v24;
        id v33 = v94;
      }
      if (v33)
      {
        id v38 = (uint64_t *)MEMORY[0x19F3A64A0]();
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = HMFGetLogIdentifier();
          v93 = v38;
          v41 = (void *)v40;
          *(_DWORD *)buf = 138543618;
          uint64_t v102 = v40;
          __int16 v103 = 1024;
          LODWORD(v104) = v94;
          _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: Reserved bits in the setup payload are not zero - 0x%x", buf, 0x12u);

          id v38 = v93;
        }

        v32 = v24;
      }
    }
    uint64_t v91 = objc_msgSend(NSString, "stringWithFormat:", @"%03llu-%02llu-%03llu", (175921861 * (v21 & 0x7FFFFFF)) >> 44, ((v21 & 0x7FFFFFF) - 100000 * (((175921861 * (v21 & 0x7FFFFFF)) >> 32) >> 12)) / 0x3E8, (v21 & 0x7FFFFFF) - 1000 * (((68719477 * (v21 & 0x7FFFFFF)) >> 32) >> 4));
    v42 = -[HMSetupAccessoryPayload initWithSetupCode:communicationProtocol:](v32, "initWithSetupCode:communicationProtocol:");
    v43 = (void *)[(HMSetupAccessoryPayload *)v42 mutableCopy];
    [v43 setSetupPayloadURL:v6];
    v44 = [NSNumber numberWithUnsignedLongLong:(v21 >> 31)];
    [v43 setCategoryNumber:v44];

    if ((v21 & 0x8000000) != 0)
    {
      [v43 setPaired:1];
      if ((v21 & 0x10000000) == 0)
      {
LABEL_34:
        if ((v21 & 0x20000000) == 0) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
    }
    else if ((v21 & 0x10000000) == 0)
    {
      goto LABEL_34;
    }
    [v43 setSupportsIP:1];
    if ((v21 & 0x20000000) == 0)
    {
LABEL_36:
      v92 = v42;
      v93 = &v91;
      if ((v21 & 0x40000000) != 0) {
        [v43 setSupportsWAC:1];
      }
      id v94 = v43;
      v45 = [MEMORY[0x1E4F28E78] stringWithCapacity:4];
      for (uint64_t i = 0; i != 4; ++i)
        objc_msgSend(v45, "appendFormat:", @"%c", v20[i + 9]);
      uint64_t v47 = [v94 setSetupID:v45];
      if ((v21 & 0x8000000000) != 0)
      {
        uint64_t v9 = v95;
        if (v11 <= 0x1E)
        {
          v49 = (void *)MEMORY[0x19F3A64A0](v47);
          v50 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v102 = (uint64_t)v51;
            __int16 v103 = 2112;
            uint64_t v104 = (uint64_t)v6;
            _os_log_impl(&dword_19D1A8000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: too short for new style with extra info '%@'", buf, 0x16u);
          }
          id v15 = v96;
          if (a4) {
            goto LABEL_58;
          }
          goto LABEL_70;
        }
        v57 = v96;
        id v99 = v96;
        unint64_t v58 = base36Decode((uint64_t)(v20 + 9), 22, &v99);
        uint64_t v60 = v59;
        id v61 = v99;

        if (v61)
        {
          v62 = (void *)MEMORY[0x19F3A64A0]();
          v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            uint64_t v102 = (uint64_t)v64;
            __int16 v103 = 2112;
            uint64_t v104 = (uint64_t)v6;
            __int16 v105 = 2112;
            uint64_t v106 = (uint64_t)v61;
            _os_log_impl(&dword_19D1A8000, v63, OS_LOG_TYPE_ERROR, "%{public}@SetupPayload: failed to decode eui64 and product number '%@': %@", buf, 0x20u);
          }
          if (a4)
          {
            id v15 = v61;
            v16 = 0;
            *a4 = v15;
          }
          else
          {
            v16 = 0;
            id v15 = v61;
          }
          goto LABEL_83;
        }
        if ((_WORD)v58)
        {
          v72 = (void *)MEMORY[0x19F3A64A0]();
          v73 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v74 = HMFGetLogIdentifier();
            id v96 = v72;
            v75 = (void *)v74;
            *(_DWORD *)buf = 138543618;
            uint64_t v102 = v74;
            __int16 v103 = 2048;
            uint64_t v104 = (unsigned __int16)v58;
            _os_log_impl(&dword_19D1A8000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: reserved bits of extended QR code not all 0: %llu", buf, 0x16u);

            v72 = v96;
          }
        }
        uint64_t v76 = 0;
        *((void *)&v77 + 1) = v60;
        *(void *)&long long v77 = v58;
        uint64_t v98 = v77 >> 48;
        uint64_t v78 = 7;
        do
        {
          char v79 = *((unsigned char *)&v98 + v76);
          *((unsigned char *)&v98 + v76) = *((unsigned char *)&v98 + v78);
          *((unsigned char *)&v98 + v78) = v79;
          ++v76;
          --v78;
        }
        while (v76 != 4);
        v80 = [NSNumber numberWithUnsignedLongLong:v98];
        [v94 setThreadIdentifier:v80];

        unint64_t v81 = v58 >> 16;
        if ((v21 & 0x10000000000) == 0 && v81)
        {
          v82 = (void *)MEMORY[0x19F3A64A0]();
          v83 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            v84 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v102 = (uint64_t)v84;
            __int16 v103 = 1024;
            LODWORD(v104) = v81;
            _os_log_impl(&dword_19D1A8000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: product number not included, but not all 0: %u", buf, 0x12u);
          }
          id v15 = 0;
          v48 = (void *)v91;
          goto LABEL_92;
        }
        v48 = (void *)v91;
        if ((v21 & 0x10000000000) == 0)
        {
LABEL_91:
          id v15 = 0;
          goto LABEL_92;
        }
      }
      else
      {
        uint64_t v9 = v95;
        if ((v21 & 0x10000000000) == 0)
        {
          v48 = (void *)v91;
          id v15 = v96;
LABEL_92:
          id v85 = v94;
          v16 = (HMSetupAccessoryPayload *)[v94 copy];
          goto LABEL_93;
        }
        if (v11 <= 0x1E)
        {
          v52 = (void *)MEMORY[0x19F3A64A0](v47);
          v53 = HMFGetOSLogHandle();
          BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
          id v15 = v96;
          if (v54)
          {
            v55 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v102 = (uint64_t)v55;
            __int16 v103 = 2112;
            uint64_t v104 = (uint64_t)v6;
            _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: too short for new style with product number '%@'", buf, 0x16u);
          }
          if (a4)
          {
LABEL_58:
            id v56 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
LABEL_59:
            v16 = 0;
            *a4 = v56;
LABEL_83:
            v48 = (void *)v91;
            id v85 = v94;
LABEL_93:

            self = v92;
LABEL_94:

            goto LABEL_95;
          }
LABEL_70:
          v16 = 0;
          goto LABEL_83;
        }
        v65 = v96;
        id v97 = v96;
        unint64_t v66 = base36Decode((uint64_t)(v20 + 13), 18, &v97);
        int v68 = v67;
        id v15 = v97;

        if (v15)
        {
          v69 = (void *)MEMORY[0x19F3A64A0]();
          v70 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            v71 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            uint64_t v102 = (uint64_t)v71;
            __int16 v103 = 2112;
            uint64_t v104 = (uint64_t)v6;
            __int16 v105 = 2112;
            uint64_t v106 = (uint64_t)v15;
            _os_log_impl(&dword_19D1A8000, v70, OS_LOG_TYPE_ERROR, "%{public}@SetupPayload: failed to decode product number '%@': %@", buf, 0x20u);
          }
          if (a4)
          {
            id v56 = v15;
            id v15 = v56;
            goto LABEL_59;
          }
          goto LABEL_70;
        }
        if ((v66 & 0xFFFFFFFFFFFFFFLL) != 0)
        {
          v86 = (void *)MEMORY[0x19F3A64A0]();
          v87 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            v88 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v102 = (uint64_t)v88;
            __int16 v103 = 2048;
            uint64_t v104 = v66 & 0xFFFFFFFFFFFFFFLL;
            _os_log_impl(&dword_19D1A8000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: reserved bits of extended QR code not all 0: %llu", buf, 0x16u);
          }
        }
        unint64_t v81 = HIBYTE(v66) | (v68 << 8);
        v48 = (void *)v91;
      }
      v89 = objc_msgSend(NSString, "stringWithFormat:", @"%08x", v81);
      [v94 setProductNumber:v89];

      goto LABEL_91;
    }
LABEL_35:
    [v43 setSupportsBTLE:1];
    goto LABEL_36;
  }
  v17 = (void *)MEMORY[0x19F3A64A0]();
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v102 = (uint64_t)v19;
    __int16 v103 = 2112;
    uint64_t v104 = (uint64_t)v6;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload URL host is nil in setupPayloadURL '%@'", buf, 0x16u);
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_95:

  return v16;
}

@end