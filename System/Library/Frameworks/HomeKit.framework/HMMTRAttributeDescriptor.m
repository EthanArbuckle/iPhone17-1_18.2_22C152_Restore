@interface HMMTRAttributeDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMMTRAttributeDescriptor)initWithCoder:(id)a3;
- (HMMTRAttributeDescriptor)initWithMTRDevice:(id)a3 attributePaths:(id)a4;
- (HMMTRAttributeDescriptor)initWithMTRDevice:(id)a3 controllerID:(id)a4 attributePaths:(id)a5;
- (HMMTRAttributeDescriptor)initWithMTRDeviceNodeID:(id)a3 controllerID:(id)a4 attributePaths:(id)a5;
- (NSNumber)nodeID;
- (NSSet)attributePaths;
- (NSString)controllerID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMMTRAttributeDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerID, 0);
  objc_storeStrong((id *)&self->_attributePaths, 0);

  objc_storeStrong((id *)&self->_nodeID, 0);
}

- (NSString)controllerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)attributePaths
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (HMMTRAttributeDescriptor)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMTRAD.nodeID"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"HMMTRAD.attributePaths"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMTRAD.controllerID"];
  v8 = (void *)v7;
  if (!v5)
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v13 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v13;
    v14 = "%{public}@Could not initialize due to nil node id after decoding";
LABEL_11:
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0xCu);

    goto LABEL_12;
  }
  if (!v6)
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v13 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v13;
    v14 = "%{public}@Could not initialize due to nil attribute paths after decoding";
    goto LABEL_11;
  }
  if (!v7)
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v13;
      v14 = "%{public}@Could not initialize due to nil controller id after decoding";
      goto LABEL_11;
    }
LABEL_12:

    v10 = 0;
    goto LABEL_13;
  }
  v9 = [(HMMTRAttributeDescriptor *)self initWithMTRDeviceNodeID:v5 controllerID:v7 attributePaths:v6];
  v10 = v9;
LABEL_13:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRAttributeDescriptor *)self nodeID];
  [v4 encodeObject:v5 forKey:@"HMMTRAD.nodeID"];

  v6 = [(HMMTRAttributeDescriptor *)self attributePaths];
  uint64_t v7 = [v6 allObjects];
  [v4 encodeObject:v7 forKey:@"HMMTRAD.attributePaths"];

  id v8 = [(HMMTRAttributeDescriptor *)self controllerID];
  [v4 encodeObject:v8 forKey:@"HMMTRAD.controllerID"];
}

- (unint64_t)hash
{
  v3 = [(HMMTRAttributeDescriptor *)self nodeID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMMTRAttributeDescriptor *)self attributePaths];
  unint64_t v6 = [v5 count] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMMTRAttributeDescriptor *)a3;
  if (self == v4)
  {
    char v14 = 1;
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
    unint64_t v6 = v5;
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [(HMMTRAttributeDescriptor *)v6 nodeID];
      v9 = [(HMMTRAttributeDescriptor *)self nodeID];
      if ([v8 isEqualToNumber:v9])
      {
        v10 = [(HMMTRAttributeDescriptor *)v7 attributePaths];
        v11 = [(HMMTRAttributeDescriptor *)self attributePaths];
        if ([v10 isEqualToSet:v11])
        {
          v12 = [(HMMTRAttributeDescriptor *)v7 controllerID];
          v13 = [(HMMTRAttributeDescriptor *)self controllerID];
          char v14 = [v12 isEqualToString:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

- (HMMTRAttributeDescriptor)initWithMTRDeviceNodeID:(id)a3 controllerID:(id)a4 attributePaths:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRAttributeDescriptor;
  v11 = [(HMMTRAttributeDescriptor *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    nodeID = v11->_nodeID;
    v11->_nodeID = (NSNumber *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    attributePaths = v11->_attributePaths;
    v11->_attributePaths = (NSSet *)v14;

    uint64_t v16 = [v9 copy];
    controllerID = v11->_controllerID;
    v11->_controllerID = (NSString *)v16;
  }
  return v11;
}

- (HMMTRAttributeDescriptor)initWithMTRDevice:(id)a3 controllerID:(id)a4 attributePaths:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 nodeID];
  v11 = [(HMMTRAttributeDescriptor *)self initWithMTRDeviceNodeID:v10 controllerID:v9 attributePaths:v8];

  return v11;
}

- (HMMTRAttributeDescriptor)initWithMTRDevice:(id)a3 attributePaths:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 nodeID];
  id v8 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_zeroUUID");
  id v9 = [v8 UUIDString];
  id v10 = [(HMMTRAttributeDescriptor *)self initWithMTRDeviceNodeID:v7 controllerID:v9 attributePaths:v6];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end