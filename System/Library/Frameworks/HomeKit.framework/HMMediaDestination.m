@interface HMMediaDestination
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)payloadForNullDestination;
+ (id)logCategory;
+ (id)payloadForDestination:(id)a3 options:(unint64_t)a4;
+ (id)shortDescription;
- (BOOL)containsHomeTheaterSupportedOptions;
- (BOOL)containsMediaSystemSupportedOptions;
- (BOOL)containsSupportedOptions:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMMediaDestination)initWithCoder:(id)a3;
- (HMMediaDestination)initWithProtoBufferData:(id)a3;
- (HMMediaDestination)initWithUniqueIdentifier:(id)a3 parentIdentifier:(id)a4 supportedOptions:(unint64_t)a5;
- (HMMediaDestination)initWithUniqueIdentifier:(id)a3 parentIdentifier:(id)a4 supportedOptions:(unint64_t)a5 audioGroupIdentifier:(id)a6;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)identifier;
- (NSString)shortDescription;
- (NSUUID)audioGroupIdentifier;
- (NSUUID)parentIdentifier;
- (NSUUID)uniqueIdentifier;
- (id)attributeDescriptionForAudioGroupIdentifier;
- (id)encodeToProtoBufferData;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)supportedOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioGroupIdentifier:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
@end

@implementation HMMediaDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setAudioGroupIdentifier:(id)a3
{
}

- (NSUUID)audioGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_supportedOptions = a3;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMMediaDestination)initWithProtoBufferData:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMMediaGroupProtoMediaDestination alloc] initWithData:v4];
  v6 = v5;
  if (v5)
  {
    if ([(HMMediaGroupProtoMediaDestination *)v5 hasIdentifier])
    {
      id v7 = objc_alloc(MEMORY[0x1E4F29128]);
      v8 = [(HMMediaGroupProtoMediaDestination *)v6 identifier];
      v9 = (void *)[v7 initWithUUIDString:v8];

      if (![(HMMediaGroupProtoMediaDestination *)v6 hasParentIdentifier])
      {
        v24 = (void *)MEMORY[0x19F3A64A0]();
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          int v34 = 138543618;
          v35 = v26;
          __int16 v36 = 2112;
          v37 = v6;
          _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@missing field=parentIdentifier from data=%@", (uint8_t *)&v34, 0x16u);
        }
        v23 = 0;
        goto LABEL_26;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F29128]);
      v11 = [(HMMediaGroupProtoMediaDestination *)v6 parentIdentifier];
      v12 = (void *)[v10 initWithUUIDString:v11];

      if ([(HMMediaGroupProtoMediaDestination *)v6 hasSupportedOptions])
      {
        uint64_t v13 = [(HMMediaGroupProtoMediaDestination *)v6 supportedOptions];
        if ([(HMMediaGroupProtoMediaDestination *)v6 hasAudioGroupIdentifier])
        {
          v14 = [(HMMediaGroupProtoMediaDestination *)v6 audioGroupIdentifier];
          char v15 = [v14 isEqual:@"00000000-0000-0000-0000-000000000000"];

          if (v15)
          {
            v16 = 0;
          }
          else
          {
            id v31 = objc_alloc(MEMORY[0x1E4F29128]);
            v32 = [(HMMediaGroupProtoMediaDestination *)v6 audioGroupIdentifier];
            v16 = (void *)[v31 initWithUUIDString:v32];
          }
          self = [(HMMediaDestination *)self initWithUniqueIdentifier:v9 parentIdentifier:v12 supportedOptions:v13 audioGroupIdentifier:v16];

          v23 = self;
          goto LABEL_25;
        }
        v27 = (void *)MEMORY[0x19F3A64A0]();
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = HMFGetLogIdentifier();
          int v34 = 138543618;
          v35 = v29;
          __int16 v36 = 2112;
          v37 = v6;
          v30 = "%{public}@missing field=audioGroupIdentifier from data=%@";
          goto LABEL_21;
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x19F3A64A0]();
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = HMFGetLogIdentifier();
          int v34 = 138543618;
          v35 = v29;
          __int16 v36 = 2112;
          v37 = v6;
          v30 = "%{public}@missing field=supportedOptions from data=%@";
LABEL_21:
          _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v34, 0x16u);
        }
      }

      v23 = 0;
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      int v34 = 138543618;
      v35 = v19;
      __int16 v36 = 2112;
      v37 = v6;
      v20 = "%{public}@missing field=identifier from data=%@";
      v21 = v18;
      uint32_t v22 = 22;
      goto LABEL_12;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      int v34 = 138543362;
      v35 = v19;
      v20 = "%{public}@Error deserializing ProtoBuffer data";
      v21 = v18;
      uint32_t v22 = 12;
LABEL_12:
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v34, v22);
    }
  }

  v23 = 0;
LABEL_27:

  return v23;
}

- (id)encodeToProtoBufferData
{
  v3 = objc_alloc_init(HMMediaGroupProtoMediaDestination);
  id v4 = [(HMMediaDestination *)self uniqueIdentifier];
  v5 = [v4 UUIDString];
  [(HMMediaGroupProtoMediaDestination *)v3 setIdentifier:v5];

  v6 = [(HMMediaDestination *)self parentIdentifier];
  id v7 = [v6 UUIDString];
  [(HMMediaGroupProtoMediaDestination *)v3 setParentIdentifier:v7];

  [(HMMediaGroupProtoMediaDestination *)v3 setSupportedOptions:[(HMMediaDestination *)self supportedOptions]];
  v8 = [(HMMediaDestination *)self audioGroupIdentifier];
  if (v8)
  {
    v9 = [(HMMediaDestination *)self audioGroupIdentifier];
    id v10 = [v9 UUIDString];
    [(HMMediaGroupProtoMediaDestination *)v3 setAudioGroupIdentifier:v10];
  }
  else
  {
    [(HMMediaGroupProtoMediaDestination *)v3 setAudioGroupIdentifier:@"00000000-0000-0000-0000-000000000000"];
  }

  v11 = [(HMMediaGroupProtoMediaDestination *)v3 data];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMMediaDestination *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"HMMediaDestinationIdentifierCodingKey"];

  v6 = [(HMMediaDestination *)self parentIdentifier];
  [v4 encodeObject:v6 forKey:@"HMMediaDestinationParentIdentifierCodingKey"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMMediaDestination supportedOptions](self, "supportedOptions"));
  [v4 encodeObject:v7 forKey:@"HMMediaDestinationSupportedOptionsNumberCodingKey"];

  id v8 = [(HMMediaDestination *)self audioGroupIdentifier];
  [v4 encodeObject:v8 forKey:@"HMMediaDestinationAudioGroupIdentifierCodingKey"];
}

- (HMMediaDestination)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationIdentifierCodingKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationParentIdentifierCodingKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationAudioGroupIdentifierCodingKey"];
  if ([v4 containsValueForKey:@"HMMediaDestinationSupportedOptionsCodingKey"])
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Using legacy encoding to get supported options", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v12 = [v4 decodeIntegerForKey:@"HMMediaDestinationSupportedOptionsCodingKey"];
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationSupportedOptionsNumberCodingKey"];
  uint64_t v12 = [v13 unsignedIntegerValue];

  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
  v14 = (void *)MEMORY[0x19F3A64A0]();
  char v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    int v26 = 138543362;
    v27 = v17;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Using legacy encoding to get identifier", (uint8_t *)&v26, 0xCu);
  }
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationIdentifierCodingKey"];
  uint64_t v19 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v18];

  v5 = (void *)v19;
LABEL_11:
  if (!v6)
  {
    v20 = (void *)MEMORY[0x19F3A64A0]();
    v21 = self;
    uint32_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@No parent identifier given - user is in a legacy state", (uint8_t *)&v26, 0xCu);
    }
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  }
  v24 = [(HMMediaDestination *)self initWithUniqueIdentifier:v5 parentIdentifier:v6 supportedOptions:v12 audioGroupIdentifier:v7];

  return v24;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (unint64_t)hash
{
  v2 = [(HMMediaDestination *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMediaDestination *)a3;
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
    v6 = v5;
    if (v6)
    {
      id v7 = [(HMMediaDestination *)self uniqueIdentifier];
      id v8 = [(HMMediaDestination *)v6 uniqueIdentifier];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        v9 = [(HMMediaDestination *)self parentIdentifier];
        id v10 = [(HMMediaDestination *)v6 parentIdentifier];
        if (objc_msgSend(v9, "hmf_isEqualToUUID:", v10)
          && (unint64_t v11 = [(HMMediaDestination *)self supportedOptions],
              v11 == [(HMMediaDestination *)v6 supportedOptions]))
        {
          uint64_t v12 = [(HMMediaDestination *)self audioGroupIdentifier];
          uint64_t v13 = [(HMMediaDestination *)v6 audioGroupIdentifier];
          char v14 = HMFEqualObjects();
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

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableMediaDestination alloc];
  v5 = [(HMMediaDestination *)self uniqueIdentifier];
  v6 = [(HMMediaDestination *)self parentIdentifier];
  unint64_t v7 = [(HMMediaDestination *)self supportedOptions];
  id v8 = [(HMMediaDestination *)self audioGroupIdentifier];
  v9 = [(HMMediaDestination *)v4 initWithUniqueIdentifier:v5 parentIdentifier:v6 supportedOptions:v7 audioGroupIdentifier:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1) {
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_5520);
  }
  v2 = (void *)logCategory__hmf_once_v4;

  return v2;
}

uint64_t __33__HMMediaDestination_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4;
  logCategory__hmf_once_id v4 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSDictionary)payloadForNullDestination
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"HMMediaDestinationIdentifierPayloadKey";
  v5[0] = @"00000000-0000-0000-0000-000000000000";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

+ (id)payloadForDestination:(id)a3 options:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = v6;
  if ((a4 & 2) != 0)
  {
    id v10 = v6;
    if ([v10 conformsToProtocol:&unk_1EEF36690]) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = 0;
    }
    id v12 = v11;

    if (!v12)
    {
      uint64_t v19 = MEMORY[0x19F3A64A0]();
      id v20 = a1;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint32_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2112;
        id v29 = v10;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert to internal destination for destination: %@", buf, 0x16u);
      }
      v18 = (void *)v19;
      goto LABEL_15;
    }
    id v8 = [v12 audioDestinationParentIdentifier];

    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [v6 audioDestinationIdentifier];
    if (v8)
    {
LABEL_3:
      v24 = @"HMMediaDestinationIdentifierPayloadKey";
      v25 = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

      goto LABEL_16;
    }
  }
  uint64_t v13 = MEMORY[0x19F3A64A0]();
  id v14 = a1;
  char v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = HMFGetLogIdentifier();
    v17 = HMMediaDestinationControllerUpateOptionsAsString(a4);
    *(_DWORD *)buf = 138543874;
    v27 = v16;
    __int16 v28 = 2112;
    id v29 = v17;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination identifier with options: %@ destination: %@", buf, 0x20u);
  }
  v18 = (void *)v13;
LABEL_15:
  v9 = 0;
LABEL_16:

  return v9;
}

- (id)attributeDescriptionForAudioGroupIdentifier
{
  v2 = [(HMMediaDestination *)self audioGroupIdentifier];
  unint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 UUIDString];
  }
  else
  {
    id v4 = @"Not Set";
  }

  return v4;
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMMediaDestination *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v7 = [(HMMediaDestination *)self parentIdentifier];
  id v8 = (void *)[v6 initWithName:@"parentIdentifier" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v10 = HMMediaDestinationSupportOptionsAsString([(HMMediaDestination *)self supportedOptions]);
  unint64_t v11 = (void *)[v9 initWithName:@"supportOptions" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v13 = [(HMMediaDestination *)self attributeDescriptionForAudioGroupIdentifier];
  id v14 = (void *)[v12 initWithName:@"audioGroupIdentifier" value:v13];
  v17[3] = v14;
  char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return (NSArray *)v15;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (BOOL)containsMediaSystemSupportedOptions
{
  if ([(HMMediaDestination *)self containsSupportedOptions:16]
    || [(HMMediaDestination *)self containsSupportedOptions:32])
  {
    return 1;
  }

  return [(HMMediaDestination *)self containsSupportedOptions:128];
}

- (BOOL)containsHomeTheaterSupportedOptions
{
  if ([(HMMediaDestination *)self containsSupportedOptions:1]
    || [(HMMediaDestination *)self containsSupportedOptions:4])
  {
    return 1;
  }

  return [(HMMediaDestination *)self containsSupportedOptions:64];
}

- (BOOL)containsSupportedOptions:(unint64_t)a3
{
  return (a3 & ~[(HMMediaDestination *)self supportedOptions]) == 0;
}

- (NSString)identifier
{
  v2 = [(HMMediaDestination *)self uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (HMMediaDestination)initWithUniqueIdentifier:(id)a3 parentIdentifier:(id)a4 supportedOptions:(unint64_t)a5 audioGroupIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v12)
  {
LABEL_7:
    v18 = (HMMediaDestination *)_HMFPreconditionFailure();
    return [(HMMediaDestination *)v18 initWithUniqueIdentifier:v20 parentIdentifier:v21 supportedOptions:v22];
  }
  id v14 = v13;
  v23.receiver = self;
  v23.super_class = (Class)HMMediaDestination;
  char v15 = [(HMMediaDestination *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v16->_parentIdentifier, a4);
    v16->_supportedOptions = a5;
    objc_storeStrong((id *)&v16->_audioGroupIdentifier, a6);
  }

  return v16;
}

- (HMMediaDestination)initWithUniqueIdentifier:(id)a3 parentIdentifier:(id)a4 supportedOptions:(unint64_t)a5
{
  return [(HMMediaDestination *)self initWithUniqueIdentifier:a3 parentIdentifier:a4 supportedOptions:a5 audioGroupIdentifier:0];
}

@end