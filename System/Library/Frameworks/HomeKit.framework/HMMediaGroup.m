@interface HMMediaGroup
+ (BOOL)supportsSecureCoding;
+ (id)groupsWithProtoBufferData:(id)a3;
+ (id)logCategory;
+ (id)protoBufferDataWithGroups:(id)a3;
+ (id)shortDescription;
- (BOOL)isDefaultName;
- (BOOL)isEqual:(id)a3;
- (HMMediaGroup)initWithCoder:(id)a3;
- (HMMediaGroup)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 destinationIdentifiers:(id)a7 associatedGroupIdentifier:(id)a8;
- (HMMediaGroup)initWithProtoBufferData:(id)a3;
- (NSArray)attributeDescriptions;
- (NSArray)destinationIdentifiers;
- (NSArray)destinationUniqueIdentifiersInternal;
- (NSString)description;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)associatedGroupIdentifier;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (id)encodeToProtoBufferData;
- (id)initClassWithProtoBufferData:(id)a3;
- (id)logIdentifier;
- (id)mediaSystemData;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeToProtoBufferDataWithEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedGroupIdentifier:(id)a3;
- (void)setDefaultName:(BOOL)a3;
- (void)setDestinationUniqueIdentifiersInternal:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HMMediaGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationUniqueIdentifiersInternal, 0);
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDestinationUniqueIdentifiersInternal:(id)a3
{
}

- (NSArray)destinationUniqueIdentifiersInternal
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
}

- (NSUUID)associatedGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDefaultName:(BOOL)a3
{
  self->_defaultName = a3;
}

- (BOOL)isDefaultName
{
  return self->_defaultName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)encodeToProtoBufferData
{
  v3 = objc_alloc_init(HMMediaGroupProtoMediaGroupData);
  [(HMMediaGroup *)self encodeToProtoBufferDataWithEvent:v3];
  v4 = [(HMMediaGroupProtoMediaGroupData *)v3 data];

  return v4;
}

- (void)encodeToProtoBufferDataWithEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMMediaGroup *)self identifier];
  v6 = [v5 UUIDString];
  [v4 setIdentifier:v6];

  v7 = [(HMMediaGroup *)self parentIdentifier];
  v8 = [v7 UUIDString];
  [v4 setParentIdentifier:v8];

  v9 = [(HMMediaGroup *)self name];
  [v4 setName:v9];

  objc_msgSend(v4, "setIsDefaultName:", -[HMMediaGroup isDefaultName](self, "isDefaultName"));
  v10 = [(HMMediaGroup *)self destinationIdentifiers];
  v11 = (void *)[v10 mutableCopy];
  [v4 setDestinationIdentifiers:v11];

  id v13 = [(HMMediaGroup *)self associatedGroupIdentifier];
  v12 = [v13 UUIDString];
  [v4 setAssociatedGroupIdentifier:v12];
}

- (HMMediaGroup)initWithProtoBufferData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMMediaGroupProtoMediaGroupData alloc] initWithData:v4];
  v6 = v5;
  if (v5)
  {
    if ([(HMMediaGroupProtoMediaGroupData *)v5 hasGroupRole]
      && ([(HMMediaGroupProtoMediaGroupData *)v6 groupRole],
          v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 hasMediaSystem],
          v7,
          v8))
    {
      v9 = [[HMMediaSystemData alloc] initWithProtoBufferData:v4];
    }
    else
    {
      v9 = (HMMediaSystemData *)[(HMMediaGroup *)self initClassWithProtoBufferData:v4];
      self = &v9->super;
    }
    p_super = &v9->super;
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to decode event data: %@", (uint8_t *)&v15, 0x20u);
    }
    p_super = 0;
  }

  return p_super;
}

- (id)initClassWithProtoBufferData:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMMediaGroupProtoMediaGroupData alloc] initWithData:v4];
  v6 = v5;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v38 = v14;
      __int16 v39 = 2112;
      uint64_t v40 = objc_opt_class();
      __int16 v41 = 2112;
      v42 = 0;
      int v15 = "%{public}@[%@] Failed to decode event data: %@";
LABEL_10:
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x20u);
    }
LABEL_11:

    v16 = 0;
    goto LABEL_29;
  }
  if (![(HMMediaGroupProtoMediaGroupData *)v5 hasIdentifier])
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v38 = v14;
      __int16 v39 = 2112;
      uint64_t v40 = objc_opt_class();
      __int16 v41 = 2112;
      v42 = v6;
      int v15 = "%{public}@[%@] Missing field=identifier from data=%@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  int v8 = [(HMMediaGroupProtoMediaGroupData *)v6 identifier];
  v9 = (void *)[v7 initWithUUIDString:v8];

  if ([(HMMediaGroupProtoMediaGroupData *)v6 hasName])
  {
    v10 = [(HMMediaGroupProtoMediaGroupData *)v6 name];
    if ([(HMMediaGroupProtoMediaGroupData *)v6 hasIsDefaultName]) {
      uint64_t v11 = [(HMMediaGroupProtoMediaGroupData *)v6 isDefaultName];
    }
    else {
      uint64_t v11 = 0;
    }
    if ([(HMMediaGroupProtoMediaGroupData *)v6 hasParentIdentifier])
    {
      id v20 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v21 = [(HMMediaGroupProtoMediaGroupData *)v6 parentIdentifier];
      v22 = (void *)[v20 initWithUUIDString:v21];

      v23 = [(HMMediaGroupProtoMediaGroupData *)v6 destinationIdentifiers];
      if (v23)
      {
        v24 = [(HMMediaGroupProtoMediaGroupData *)v6 destinationIdentifiers];
      }
      else
      {
        v24 = (void *)MEMORY[0x1E4F1CBF0];
      }

      v28 = objc_msgSend(v24, "na_map:", &__block_literal_global_84_38438);
      if ([(HMMediaGroupProtoMediaGroupData *)v6 hasAssociatedGroupIdentifier])
      {
        id v29 = objc_alloc(MEMORY[0x1E4F29128]);
        [(HMMediaGroupProtoMediaGroupData *)v6 associatedGroupIdentifier];
        v36 = v9;
        v30 = v22;
        uint64_t v31 = v11;
        v33 = v32 = v10;
        v34 = (void *)[v29 initWithUUIDString:v33];

        v10 = v32;
        uint64_t v11 = v31;
        v22 = v30;
        v9 = v36;
      }
      else
      {
        v34 = 0;
      }
      self = [(HMMediaGroup *)self initWithIdentifier:v9 parentIdentifier:v22 name:v10 defaultName:v11 destinationIdentifiers:v28 associatedGroupIdentifier:v34];

      v16 = self;
    }
    else
    {
      v25 = (void *)MEMORY[0x19F3A64A0]();
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v38 = v27;
        __int16 v39 = 2112;
        uint64_t v40 = objc_opt_class();
        __int16 v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing field=parentIdentifier from data=%@", buf, 0x20u);
      }
      v16 = 0;
    }
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v38 = v19;
      __int16 v39 = 2112;
      uint64_t v40 = objc_opt_class();
      __int16 v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing field=name from data=%@", buf, 0x20u);
    }
    v16 = 0;
  }

LABEL_29:
  return v16;
}

id __45__HMMediaGroup_initClassWithProtoBufferData___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMMediaGroup *)self identifier];
  [v4 encodeObject:v5 forKey:@"HMMediaGroupIdentifierCodingKey"];

  v6 = [(HMMediaGroup *)self parentIdentifier];
  [v4 encodeObject:v6 forKey:@"HMMediaGroupParentIdentifierCodingKey"];

  id v7 = [(HMMediaGroup *)self name];
  [v4 encodeObject:v7 forKey:@"HMMediaGroupNameCodingKey"];

  int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMMediaGroup isDefaultName](self, "isDefaultName"));
  [v4 encodeObject:v8 forKey:@"HMMediaGroupDefaultNameCodingKey"];

  v9 = [(HMMediaGroup *)self destinationIdentifiers];
  [v4 encodeObject:v9 forKey:@"HMMediaGroupDestinationIdentifiersCodingKey"];

  id v10 = [(HMMediaGroup *)self associatedGroupIdentifier];
  [v4 encodeObject:v10 forKey:@"HMMediaGroupAssociatedGroupIdentifierCodingKey"];
}

- (HMMediaGroup)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaGroupIdentifierCodingKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaGroupParentIdentifierCodingKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaGroupNameCodingKey"];
  int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaGroupDefaultNameCodingKey"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v11 = [v9 setWithArray:v10];
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"HMMediaGroupDestinationIdentifiersCodingKey"];

  id v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_75);
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaGroupAssociatedGroupIdentifierCodingKey"];
  if (!v6)
  {
    id v20 = self;
    int v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = objc_opt_class();
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to decode parent identifier", buf, 0x16u);
    }
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    self = v20;
  }
  uint64_t v18 = -[HMMediaGroup initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:](self, "initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:", v5, v6, v7, [v8 BOOLValue], v13, v14);

  return v18;
}

id __30__HMMediaGroup_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (unint64_t)hash
{
  v2 = [(HMMediaGroup *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMediaGroup *)a3;
  if (self == v4)
  {
    char v18 = 1;
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
    if (v6
      && ((id v7 = objc_opt_class(), ([v7 isEqual:objc_opt_class()] & 1) == 0)
       && (int v8 = objc_opt_class(), ![v8 isEqual:objc_opt_class()])
       || (v9 = objc_opt_class(), ([v9 isEqual:objc_opt_class()] & 1) != 0)
       || (id v10 = objc_opt_class(), [v10 isEqual:objc_opt_class()])))
    {
      uint64_t v11 = [(HMMediaGroup *)self identifier];
      v12 = [(HMMediaGroup *)v6 identifier];
      if (objc_msgSend(v11, "hmf_isEqualToUUID:", v12))
      {
        id v13 = [(HMMediaGroup *)self parentIdentifier];
        v14 = [(HMMediaGroup *)v6 parentIdentifier];
        if (objc_msgSend(v13, "hmf_isEqualToUUID:", v14))
        {
          int v15 = [(HMMediaGroup *)self name];
          v16 = [(HMMediaGroup *)v6 name];
          if ([v15 isEqualToString:v16]
            && (BOOL v17 = [(HMMediaGroup *)self isDefaultName],
                v17 == [(HMMediaGroup *)v6 isDefaultName]))
          {
            __int16 v19 = (void *)MEMORY[0x1E4F1CAD0];
            v28 = [(HMMediaGroup *)self destinationIdentifiers];
            id v20 = objc_msgSend(v19, "setWithArray:");
            v26 = (void *)MEMORY[0x1E4F1CAD0];
            v25 = [(HMMediaGroup *)v6 destinationIdentifiers];
            objc_msgSend(v26, "setWithArray:");
            uint64_t v24 = v27 = v20;
            if (objc_msgSend(v20, "isEqual:"))
            {
              __int16 v23 = [(HMMediaGroup *)self associatedGroupIdentifier];
              uint64_t v21 = [(HMMediaGroup *)v6 associatedGroupIdentifier];
              char v18 = HMFEqualObjects();
            }
            else
            {
              char v18 = 0;
            }
          }
          else
          {
            char v18 = 0;
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  return v18;
}

+ (id)protoBufferDataWithGroups:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_81);
}

uint64_t __42__HMMediaGroup_protoBufferDataWithGroups___block_invoke(uint64_t a1, void *a2)
{
  return [a2 encodeToProtoBufferData];
}

+ (id)groupsWithProtoBufferData:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_78);
}

HMMediaGroup *__42__HMMediaGroup_groupsWithProtoBufferData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [[HMMediaGroup alloc] initWithProtoBufferData:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_38471 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_38471, &__block_literal_global_55_38472);
  }
  id v2 = (void *)logCategory__hmf_once_v2_38473;

  return v2;
}

uint64_t __27__HMMediaGroup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_38473;
  logCategory__hmf_once_v2_38473 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableMediaGroup alloc];
  v5 = [(HMMediaGroup *)self identifier];
  v6 = [(HMMediaGroup *)self parentIdentifier];
  id v7 = [(HMMediaGroup *)self name];
  BOOL v8 = [(HMMediaGroup *)self isDefaultName];
  v9 = [(HMMediaGroup *)self destinationUniqueIdentifiers];
  id v10 = [(HMMediaGroup *)self associatedGroupIdentifier];
  uint64_t v11 = [(HMMediaGroup *)v4 initWithIdentifier:v5 parentIdentifier:v6 name:v7 defaultName:v8 destinationIdentifiers:v9 associatedGroupIdentifier:v10];

  return v11;
}

- (NSArray)attributeDescriptions
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMMediaGroup *)self identifier];
  uint64_t v21 = (void *)[v3 initWithName:@"identifier" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v20 = [(HMMediaGroup *)self parentIdentifier];
  v5 = (void *)[v4 initWithName:@"parentIdentifier" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v7 = [(HMMediaGroup *)self name];
  BOOL v8 = (void *)[v6 initWithName:@"name" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMMediaGroup *)self isDefaultName];
  id v10 = HMFBooleanToString();
  uint64_t v11 = (void *)[v9 initWithName:@"isDefaultName" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v13 = [(HMMediaGroup *)self destinationUniqueIdentifiers];
  v14 = (void *)[v12 initWithName:@"destinationIdentifiers" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  v16 = [(HMMediaGroup *)self associatedGroupIdentifier];
  BOOL v17 = (void *)[v15 initWithName:@"associatedGroupIdentifier" value:v16];
  v23[5] = v17;
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];

  return (NSArray *)v18;
}

- (NSString)shortDescription
{
  id v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)logIdentifier
{
  id v2 = [(HMMediaGroup *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)mediaSystemData
{
  id v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSArray)destinationIdentifiers
{
  id v2 = [(HMMediaGroup *)self destinationUniqueIdentifiers];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_38497);

  return (NSArray *)v3;
}

uint64_t __38__HMMediaGroup_destinationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (HMMediaGroup)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 destinationIdentifiers:(id)a7 associatedGroupIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    __int16 v23 = (HMHomeManager *)_HMFPreconditionFailure();
    return (HMMediaGroup *)[(HMHomeManager *)v23 accessorySettingsDataSource:v25 transformHomeUUID:v26 mediaSystemUUID:v27 toClientHomeIdentifier:v28 clientMediaSystemIdentifier:v29];
  }
  id obj = a8;
  __int16 v19 = v18;
  v32.receiver = self;
  v32.super_class = (Class)HMMediaGroup;
  id v20 = [(HMMediaGroup *)&v32 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_parentIdentifier, a4);
    objc_storeStrong((id *)&v21->_name, a5);
    v21->_defaultName = a6;
    objc_storeStrong((id *)&v21->_destinationUniqueIdentifiersInternal, a7);
    objc_storeStrong((id *)&v21->_associatedGroupIdentifier, obj);
  }

  return v21;
}

@end