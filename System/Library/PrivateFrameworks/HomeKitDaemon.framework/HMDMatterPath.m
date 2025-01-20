@interface HMDMatterPath
+ (BOOL)supportsSecureCoding;
+ (HMDMatterPath)PathWithAttributeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
+ (HMDMatterPath)PathWithCommandID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
+ (HMDMatterPath)PathWithEventID:(id)a3 endpointID:(id)a4 clusterID:(id)a5;
+ (HMDMatterPath)PathWithMTRPath:(id)a3;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (HMDAccessory)accessory;
- (HMDMatterPath)initWithCoder:(id)a3;
- (HMDMatterPath)initWithPathModel:(id)a3 accessory:(id)a4;
- (HMDMatterPath)initWithUUID:(id)a3 mtrPath:(id)a4;
- (MTRAttributePath)attributePath;
- (MTRClusterPath)clusterPath;
- (MTRCommandPath)commandPath;
- (MTREventPath)eventPath;
- (NSNumber)attributeID;
- (NSNumber)clusterID;
- (NSNumber)commandID;
- (NSNumber)endpointID;
- (NSNumber)eventID;
- (NSString)description;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
- (id)mtrPath;
- (id)path;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)populateModelObject:(id)a3;
- (void)setAccessory:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDMatterPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPath, 0);
  objc_storeStrong((id *)&self->_commandPath, 0);
  objc_storeStrong((id *)&self->_attributePath, 0);
  objc_storeStrong((id *)&self->_clusterPath, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MTREventPath)eventPath
{
  return self->_eventPath;
}

- (MTRCommandPath)commandPath
{
  return self->_commandPath;
}

- (MTRAttributePath)attributePath
{
  return self->_attributePath;
}

- (MTRClusterPath)clusterPath
{
  return self->_clusterPath;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
}

- (id)modelObjectWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(HMDBackingStoreModelObject *)[HMDMatterPathModel alloc] initWithObjectChangeType:a3 uuid:v8 parentUUID:v7];

  return v9;
}

- (id)shortDescription
{
  v3 = [(HMDMatterPath *)self accessory];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [v3 identifier];
  id v7 = [(HMDMatterPath *)self path];
  id v8 = [v4 stringWithFormat:@"%@ %@ %@", v5, v6, v7];

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HMDMatterPath *)self uuid];
  v6 = [(HMDMatterPath *)self accessory];
  id v7 = [v6 identifier];
  id v8 = [(HMDMatterPath *)self path];
  v9 = [v3 stringWithFormat:@"%@ %@/%@ %@", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(HMDMatterPath *)self uuid];
  v6 = [(HMDMatterPath *)self mtrPath];
  id v7 = (void *)[v4 initWithUUID:v5 mtrPath:v6];

  return v7;
}

- (void)populateModelObject:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v11;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  v6 = [(HMDMatterPath *)self endpointID];
  [v5 setEndpointID:v6];

  id v7 = [(HMDMatterPath *)self clusterID];
  [v5 setClusterID:v7];

  id v8 = [(HMDMatterPath *)self attributeID];
  [v5 setAttributeID:v8];

  v9 = [(HMDMatterPath *)self commandID];
  [v5 setCommandID:v9];

  v10 = [(HMDMatterPath *)self eventID];
  [v5 setEventID:v10];
}

- (HMDMatterPath)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDMatterPathEndpointIDKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDMatterPathClusterIDKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDMatterPathAttributeIDKey"];
  if (v7)
  {
    id v8 = [MEMORY[0x263F10C50] attributePathWithEndpointID:v5 clusterID:v6 attributeID:v7];
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDMatterPathCommandIDKey"];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F10D90] commandPathWithEndpointID:v5 clusterID:v6 commandID:v9];

    id v8 = (void *)v10;
  }
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDMatterPathEventIDKey"];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F10EA0] eventPathWithEndpointID:v5 clusterID:v6 eventID:v11];

    id v8 = (void *)v12;
  }
  v13 = +[HMDMatterPath PathWithMTRPath:v8];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMatterPath *)self endpointID];
  [v4 encodeObject:v5 forKey:@"HMDMatterPathEndpointIDKey"];

  v6 = [(HMDMatterPath *)self clusterID];
  [v4 encodeObject:v6 forKey:@"HMDMatterPathClusterIDKey"];

  id v7 = [(HMDMatterPath *)self attributeID];
  [v4 encodeObject:v7 forKey:@"HMDMatterPathAttributeIDKey"];

  id v8 = [(HMDMatterPath *)self commandID];
  [v4 encodeObject:v8 forKey:@"HMDMatterPathCommandIDKey"];

  id v9 = [(HMDMatterPath *)self eventID];
  [v4 encodeObject:v9 forKey:@"HMDMatterPathEventIDKey"];
}

- (unint64_t)hash
{
  v2 = [(HMDMatterPath *)self path];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)path
{
  unint64_t v3 = [(HMDMatterPath *)self attributeID];

  if (v3)
  {
    id v4 = NSString;
    id v5 = [(HMDMatterPath *)self endpointID];
    v6 = [(HMDMatterPath *)self clusterID];
    id v7 = [(HMDMatterPath *)self attributeID];
    [v4 stringWithFormat:@"EP/CL/ATTR: %@/%@/%@", v5, v6, v7];
    v13 = LABEL_7:;

    goto LABEL_8;
  }
  id v8 = [(HMDMatterPath *)self commandID];

  if (v8)
  {
    id v9 = NSString;
    id v5 = [(HMDMatterPath *)self endpointID];
    v6 = [(HMDMatterPath *)self clusterID];
    id v7 = [(HMDMatterPath *)self commandID];
    [v9 stringWithFormat:@"EP/CL/CMD: %@/%@/%@", v5, v6, v7];
    goto LABEL_7;
  }
  uint64_t v10 = [(HMDMatterPath *)self eventID];

  id v11 = NSString;
  id v5 = [(HMDMatterPath *)self endpointID];
  uint64_t v12 = [(HMDMatterPath *)self clusterID];
  v6 = (void *)v12;
  if (v10)
  {
    id v7 = [(HMDMatterPath *)self eventID];
    [v11 stringWithFormat:@"EP/CL/EVE: %@/%@/%@", v5, v6, v7];
    goto LABEL_7;
  }
  v13 = [v11 stringWithFormat:@"EP/CL: %@/%@", v5, v12];
LABEL_8:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDMatterPath *)a3;
  if (self == v4)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    id v7 = v6;
    if (!v6) {
      goto LABEL_11;
    }
    id v8 = [(HMDMatterPath *)v6 endpointID];
    id v9 = [(HMDMatterPath *)self endpointID];
    int v10 = HMFEqualObjects();

    if (!v10) {
      goto LABEL_11;
    }
    id v11 = [(HMDMatterPath *)v7 clusterID];
    uint64_t v12 = [(HMDMatterPath *)self clusterID];
    int v13 = HMFEqualObjects();

    if (!v13) {
      goto LABEL_11;
    }
    v14 = [(HMDMatterPath *)v7 attributeID];
    v15 = [(HMDMatterPath *)self attributeID];
    int v16 = HMFEqualObjects();

    if (!v16) {
      goto LABEL_11;
    }
    v17 = [(HMDMatterPath *)v7 commandID];
    v18 = [(HMDMatterPath *)self commandID];
    int v19 = HMFEqualObjects();

    if (v19)
    {
      v20 = [(HMDMatterPath *)v7 eventID];
      v21 = [(HMDMatterPath *)self eventID];
      char v22 = HMFEqualObjects();
    }
    else
    {
LABEL_11:
      char v22 = 0;
    }
  }
  return v22;
}

- (NSNumber)eventID
{
  v2 = [(HMDMatterPath *)self eventPath];
  unint64_t v3 = [v2 event];

  return (NSNumber *)v3;
}

- (NSNumber)commandID
{
  v2 = [(HMDMatterPath *)self commandPath];
  unint64_t v3 = [v2 command];

  return (NSNumber *)v3;
}

- (NSNumber)attributeID
{
  v2 = [(HMDMatterPath *)self attributePath];
  unint64_t v3 = [v2 attribute];

  return (NSNumber *)v3;
}

- (NSNumber)clusterID
{
  v2 = [(HMDMatterPath *)self mtrPath];
  unint64_t v3 = [v2 cluster];

  return (NSNumber *)v3;
}

- (NSNumber)endpointID
{
  v2 = [(HMDMatterPath *)self mtrPath];
  unint64_t v3 = [v2 endpoint];

  return (NSNumber *)v3;
}

- (BOOL)isValid
{
  unint64_t v3 = [(HMDMatterPath *)self endpointID];
  if (v3)
  {
    id v4 = [(HMDMatterPath *)self clusterID];
    if (v4)
    {
      id v5 = [(HMDMatterPath *)self attributeID];
      if (v5)
      {
        BOOL v6 = 1;
      }
      else
      {
        id v7 = [(HMDMatterPath *)self commandID];
        if (v7)
        {
          BOOL v6 = 1;
        }
        else
        {
          id v8 = [(HMDMatterPath *)self eventID];
          BOOL v6 = v8 != 0;
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)mtrPath
{
  unint64_t v3 = [(HMDMatterPath *)self attributePath];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    BOOL v6 = [(HMDMatterPath *)self commandPath];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(HMDMatterPath *)self eventPath];
    }
    id v5 = v8;
  }
  return v5;
}

- (HMDMatterPath)initWithPathModel:(id)a3 accessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endpointID];

  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  id v9 = [v6 clusterID];

  if (!v9)
  {
LABEL_17:
    _HMFPreconditionFailure();
LABEL_18:
    v27 = (HMDMatterPath *)_HMFPreconditionFailure();
    return [(HMDMatterPath *)v27 initWithUUID:v29 mtrPath:v30];
  }
  id v10 = v7;
  char v11 = [v10 conformsToProtocol:&unk_26E4FFCC0];

  if (!v10 || (v11 & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v12 = [v6 attributeID];

  if (v12)
  {
    int v13 = (void *)MEMORY[0x263F10C50];
    v14 = [v6 endpointID];
    v15 = [v6 clusterID];
    int v16 = [v6 attributeID];
    uint64_t v17 = [v13 attributePathWithEndpointID:v14 clusterID:v15 attributeID:v16];
  }
  else
  {
    v18 = [v6 commandID];

    if (v18)
    {
      int v19 = (void *)MEMORY[0x263F10D90];
      v14 = [v6 endpointID];
      v15 = [v6 clusterID];
      int v16 = [v6 commandID];
      uint64_t v17 = [v19 commandPathWithEndpointID:v14 clusterID:v15 commandID:v16];
    }
    else
    {
      v20 = [v6 eventID];

      if (!v20)
      {
        v26 = (void *)MEMORY[0x263F10D30];
        v14 = [v6 endpointID];
        v15 = [v6 clusterID];
        char v22 = [v26 clusterPathWithEndpointID:v14 clusterID:v15];
        goto LABEL_12;
      }
      v21 = (void *)MEMORY[0x263F10EA0];
      v14 = [v6 endpointID];
      v15 = [v6 clusterID];
      int v16 = [v6 eventID];
      uint64_t v17 = [v21 eventPathWithEndpointID:v14 clusterID:v15 eventID:v16];
    }
  }
  char v22 = (void *)v17;

LABEL_12:
  v23 = [v6 uuid];
  v24 = [(HMDMatterPath *)self initWithUUID:v23 mtrPath:v22];

  if (v24) {
    objc_storeWeak((id *)&v24->_accessory, v10);
  }

  return v24;
}

- (HMDMatterPath)initWithUUID:(id)a3 mtrPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  id v9 = v8;
  id v10 = [v8 endpoint];

  if (!v10)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  char v11 = [v9 cluster];

  if (!v11)
  {
LABEL_18:
    v27 = (void *)_HMFPreconditionFailure();
    return (HMDMatterPath *)+[HMDMatterPath logCategory];
  }
  v29.receiver = self;
  v29.super_class = (Class)HMDMatterPath;
  uint64_t v12 = [(HMDMatterPath *)&v29 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    id v14 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    int v16 = v15;

    attributePath = v13->_attributePath;
    v13->_attributePath = v16;

    id v18 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    v20 = v19;

    commandPath = v13->_commandPath;
    v13->_commandPath = v20;

    id v22 = v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    v24 = v23;

    eventPath = v13->_eventPath;
    v13->_eventPath = v24;
  }
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_153334 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_153334, &__block_literal_global_153335);
  }
  v2 = (void *)logCategory__hmf_once_v7_153336;
  return v2;
}

void __28__HMDMatterPath_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_153336;
  logCategory__hmf_once_v7_153336 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HMDMatterPath)PathWithEventID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v5 = [MEMORY[0x263F10EA0] eventPathWithEndpointID:a4 clusterID:a5 eventID:a3];
  id v6 = +[HMDMatterPath PathWithMTRPath:v5];

  return (HMDMatterPath *)v6;
}

+ (HMDMatterPath)PathWithCommandID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v5 = [MEMORY[0x263F10D90] commandPathWithEndpointID:a4 clusterID:a5 commandID:a3];
  id v6 = +[HMDMatterPath PathWithMTRPath:v5];

  return (HMDMatterPath *)v6;
}

+ (HMDMatterPath)PathWithAttributeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v5 = [MEMORY[0x263F10C50] attributePathWithEndpointID:a4 clusterID:a5 attributeID:a3];
  id v6 = +[HMDMatterPath PathWithMTRPath:v5];

  return (HMDMatterPath *)v6;
}

+ (HMDMatterPath)PathWithMTRPath:(id)a3
{
  id v3 = a3;
  id v4 = [HMDMatterPath alloc];
  id v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = [(HMDMatterPath *)v4 initWithUUID:v5 mtrPath:v3];

  return v6;
}

@end