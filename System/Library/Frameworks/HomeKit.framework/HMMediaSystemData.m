@interface HMMediaSystemData
+ (BOOL)supportsSecureCoding;
+ (NSString)codingKey;
+ (NSString)defaultGroupName;
+ (NSString)roomNameSentinel;
+ (NSUUID)unknownDestinationSentinel;
- (BOOL)hasRoleIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMMediaSystemData)initWithCoder:(id)a3;
- (HMMediaSystemData)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 associatedGroupIdentifier:(id)a7 leftDestinationIdentifier:(id)a8 rightDestinationIdentifier:(id)a9;
- (HMMediaSystemData)initWithProtoBufferData:(id)a3;
- (NSUUID)leftDestinationIdentifier;
- (NSUUID)rightDestinationIdentifier;
- (id)attributeDescriptions;
- (id)destinationUniqueIdentifiers;
- (id)encodeToProtoBufferData;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLeftDestinationIdentifier:(id)a3;
- (void)setRightDestinationIdentifier:(id)a3;
@end

@implementation HMMediaSystemData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDestinationIdentifier, 0);

  objc_storeStrong((id *)&self->_leftDestinationIdentifier, 0);
}

- (void)setRightDestinationIdentifier:(id)a3
{
}

- (NSUUID)rightDestinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLeftDestinationIdentifier:(id)a3
{
}

- (NSUUID)leftDestinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMMediaGroup *)self identifier];
  [v4 encodeObject:v5 forKey:@"HMMediaSystemDataIdentifierCodingKey"];

  v6 = [(HMMediaGroup *)self parentIdentifier];
  [v4 encodeObject:v6 forKey:@"HMMediaSystemDataParentIdentifierCodingKey"];

  v7 = [(HMMediaGroup *)self name];
  [v4 encodeObject:v7 forKey:@"HMMediaSystemDataNameCodingKey"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMMediaGroup isDefaultName](self, "isDefaultName"));
  [v4 encodeObject:v8 forKey:@"HMMediaSystemDataDefaultNameCodingKey"];

  v9 = [(HMMediaGroup *)self associatedGroupIdentifier];
  [v4 encodeObject:v9 forKey:@"HMMediaSystemDataAssociatedGroupIdentifierCodingKey"];

  v10 = [(HMMediaSystemData *)self leftDestinationIdentifier];
  [v4 encodeObject:v10 forKey:@"HMMediaSystemDataLeftDestinationIdentifierCodingKey"];

  id v11 = [(HMMediaSystemData *)self rightDestinationIdentifier];
  [v4 encodeObject:v11 forKey:@"HMMediaSystemDataRightDestinationIdentifierCodingKey"];
}

- (HMMediaSystemData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSystemDataIdentifierCodingKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSystemDataParentIdentifierCodingKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSystemDataNameCodingKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSystemDataDefaultNameCodingKey"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSystemDataAssociatedGroupIdentifierCodingKey"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSystemDataLeftDestinationIdentifierCodingKey"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSystemDataRightDestinationIdentifierCodingKey"];

  v12 = -[HMMediaSystemData initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:](self, "initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:", v5, v6, v7, [v8 BOOLValue], v9, v10, v11);
  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableMediaSystemData alloc];
  v5 = [(HMMediaGroup *)self identifier];
  v6 = [(HMMediaGroup *)self parentIdentifier];
  v7 = [(HMMediaGroup *)self name];
  BOOL v8 = [(HMMediaGroup *)self isDefaultName];
  v9 = [(HMMediaGroup *)self associatedGroupIdentifier];
  v10 = [(HMMediaSystemData *)self leftDestinationIdentifier];
  id v11 = [(HMMediaSystemData *)self rightDestinationIdentifier];
  v12 = [(HMMediaSystemData *)v4 initWithIdentifier:v5 parentIdentifier:v6 name:v7 defaultName:v8 associatedGroupIdentifier:v9 leftDestinationIdentifier:v10 rightDestinationIdentifier:v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSUUID)unknownDestinationSentinel
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];

  return (NSUUID *)v2;
}

+ (NSString)defaultGroupName
{
  v2 = +[HMLocalization sharedManager];
  v3 = [v2 getLocalizedString:@"STEREO_PAIR"];

  return (NSString *)v3;
}

+ (NSString)roomNameSentinel
{
  return (NSString *)@"HMMediaSystemDataRoomNameSentinel";
}

+ (NSString)codingKey
{
  return (NSString *)@"HMMediaSystemDataCodingKey";
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)HMMediaSystemData;
  return [(HMMediaGroup *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMediaSystemData *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMMediaSystemData;
    if ([(HMMediaGroup *)&v14 isEqual:v4])
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      if (v7)
      {
        BOOL v8 = [(HMMediaSystemData *)self rightDestinationIdentifier];
        v9 = [(HMMediaSystemData *)v7 rightDestinationIdentifier];
        if (objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
        {
          v10 = [(HMMediaSystemData *)self leftDestinationIdentifier];
          id v11 = [(HMMediaSystemData *)v7 leftDestinationIdentifier];
          char v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HMMediaSystemData;
  objc_super v3 = [(HMMediaGroup *)&v13 attributeDescriptions];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMMediaSystemData *)self leftDestinationIdentifier];
  v7 = (void *)[v5 initWithName:@"leftDestinationIdentifier" value:v6];
  v14[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMMediaSystemData *)self rightDestinationIdentifier];
  v10 = (void *)[v8 initWithName:@"rightDestinationIdentifier" value:v9];
  v14[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v4 addObjectsFromArray:v11];

  return v4;
}

- (id)encodeToProtoBufferData
{
  objc_super v3 = [HMMediaGroupProtoMediaGroupData alloc];
  v16.receiver = self;
  v16.super_class = (Class)HMMediaSystemData;
  id v4 = [(HMMediaGroup *)&v16 encodeToProtoBufferData];
  id v5 = [(HMMediaGroupProtoMediaGroupData *)v3 initWithData:v4];

  v6 = objc_alloc_init(HMMediaGroupProtoMediaGroupRole);
  v7 = objc_alloc_init(HMMediaGroupProtoMediaSystemRoles);
  [(HMMediaGroupProtoMediaGroupRole *)v6 setMediaSystem:v7];

  id v8 = [(HMMediaSystemData *)self rightDestinationIdentifier];
  v9 = [v8 UUIDString];
  v10 = [(HMMediaGroupProtoMediaGroupRole *)v6 mediaSystem];
  [v10 setRightDestinationIdentifier:v9];

  id v11 = [(HMMediaSystemData *)self leftDestinationIdentifier];
  char v12 = [v11 UUIDString];
  objc_super v13 = [(HMMediaGroupProtoMediaGroupRole *)v6 mediaSystem];
  [v13 setLeftDestinationIdentifier:v12];

  [(HMMediaGroupProtoMediaGroupData *)v5 setGroupRole:v6];
  objc_super v14 = [(HMMediaGroupProtoMediaGroupData *)v5 data];

  return v14;
}

- (HMMediaSystemData)initWithProtoBufferData:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HMMediaSystemData;
  id v5 = [(HMMediaGroup *)&v37 initClassWithProtoBufferData:v4];
  if (!v5)
  {
LABEL_21:
    v24 = v5;
    goto LABEL_22;
  }
  v6 = [[HMMediaGroupProtoMediaGroupData alloc] initWithData:v4];
  v7 = v6;
  if (!v6)
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = v5;
    v20 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    __int16 v40 = 2112;
    v41 = 0;
    v22 = "%{public}@Failed to decode event data: %@";
LABEL_11:
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
LABEL_12:

    goto LABEL_13;
  }
  if (![(HMMediaGroupProtoMediaGroupData *)v6 hasGroupRole])
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v23 = v5;
    v20 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    __int16 v40 = 2112;
    v41 = v7;
    v22 = "%{public}@Missing field=groupRole from data=%@";
    goto LABEL_11;
  }
  id v8 = [(HMMediaGroupProtoMediaGroupData *)v7 groupRole];
  char v9 = [v8 hasMediaSystem];

  if (v9)
  {
    v10 = [(HMMediaGroupProtoMediaGroupData *)v7 groupRole];
    id v11 = [v10 mediaSystem];
    int v12 = [v11 hasRightDestinationIdentifier];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F29128]);
      objc_super v14 = [(HMMediaGroupProtoMediaGroupData *)v7 groupRole];
      v15 = [v14 mediaSystem];
      objc_super v16 = [v15 rightDestinationIdentifier];
      v17 = (void *)[v13 initWithUUIDString:v16];
    }
    else
    {
      v17 = 0;
    }
    objc_storeStrong(v5 + 8, v17);
    v27 = [(HMMediaGroupProtoMediaGroupData *)v7 groupRole];
    v28 = [v27 mediaSystem];
    int v29 = [v28 hasLeftDestinationIdentifier];

    if (v29)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F29128]);
      v31 = [(HMMediaGroupProtoMediaGroupData *)v7 groupRole];
      v32 = [v31 mediaSystem];
      v33 = [v32 leftDestinationIdentifier];
      uint64_t v34 = [v30 initWithUUIDString:v33];
    }
    else
    {
      uint64_t v34 = 0;
    }
    id v35 = v5[7];
    v5[7] = (id)v34;

    goto LABEL_21;
  }
  v18 = (void *)MEMORY[0x19F3A64A0]();
  v25 = v5;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    v26 = [(HMMediaGroupProtoMediaGroupData *)v7 groupRole];
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    __int16 v40 = 2112;
    v41 = v26;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing field=mediaSystem from role=%@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

  v24 = 0;
LABEL_22:

  return v24;
}

- (BOOL)hasRoleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSystemData *)self rightDestinationIdentifier];
  if (objc_msgSend(v5, "hmf_isEqualToUUID:", v4))
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(HMMediaSystemData *)self leftDestinationIdentifier];
    char v6 = objc_msgSend(v7, "hmf_isEqualToUUID:", v4);
  }
  return v6;
}

- (id)destinationUniqueIdentifiers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HMMediaSystemData *)self leftDestinationIdentifier];
  v7[0] = v3;
  id v4 = [(HMMediaSystemData *)self rightDestinationIdentifier];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (HMMediaSystemData)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 associatedGroupIdentifier:(id)a7 leftDestinationIdentifier:(id)a8 rightDestinationIdentifier:(id)a9
{
  BOOL v11 = a6;
  id v16 = a8;
  id v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)HMMediaSystemData;
  v18 = [(HMMediaGroup *)&v21 initWithIdentifier:a3 parentIdentifier:a4 name:a5 defaultName:v11 destinationIdentifiers:MEMORY[0x1E4F1CBF0] associatedGroupIdentifier:a7];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_leftDestinationIdentifier, a8);
    objc_storeStrong((id *)&v19->_rightDestinationIdentifier, a9);
  }

  return v19;
}

@end