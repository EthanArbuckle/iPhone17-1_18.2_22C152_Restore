@interface HMMediaDestinationControllerData
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMMediaDestinationControllerData)initWithCoder:(id)a3;
- (HMMediaDestinationControllerData)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 destinationIdentifier:(id)a5 supportedOptions:(unint64_t)a6 availableDestinationIdentifiers:(id)a7;
- (HMMediaDestinationControllerData)initWithProtoBufferData:(id)a3;
- (NSArray)attributeDescriptions;
- (NSArray)availableDestinationIdentifiers;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)destinationIdentifier;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (id)encodeToProtoBufferData;
- (id)logIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)supportedOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableDestinationIdentifiers:(id)a3;
- (void)setDestinationIdentifier:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
@end

@implementation HMMediaDestinationControllerData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDestinationIdentifiers, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setAvailableDestinationIdentifiers:(id)a3
{
}

- (NSArray)availableDestinationIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_supportedOptions = a3;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setDestinationIdentifier:(id)a3
{
}

- (NSUUID)destinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMMediaDestinationControllerData)initWithProtoBufferData:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMMediaGroupProtoMediaDestinationControllerData alloc] initWithData:v4];
  v6 = v5;
  if (!v5)
  {
    v16 = (void *)MEMORY[0x19F3A64A0]();
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v45 = 138543618;
      v46 = v18;
      __int16 v47 = 2112;
      uint64_t v48 = objc_opt_class();
      v19 = "%{public}@[%@] Error deserializing ProtoBuffer data";
      v20 = v17;
      uint32_t v21 = 22;
LABEL_11:
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v45, v21);
    }
LABEL_12:

    v22 = 0;
    goto LABEL_36;
  }
  if (![(HMMediaGroupProtoMediaDestinationControllerData *)v5 hasIdentifier])
  {
    v16 = (void *)MEMORY[0x19F3A64A0]();
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v45 = 138543874;
      v46 = v18;
      __int16 v47 = 2112;
      uint64_t v48 = objc_opt_class();
      __int16 v49 = 2112;
      v50 = v6;
      v19 = "%{public}@[%@] missing field=identifier from data=%@";
      v20 = v17;
      uint32_t v21 = 32;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  v8 = [(HMMediaGroupProtoMediaDestinationControllerData *)v6 identifier];
  v9 = (void *)[v7 initWithUUIDString:v8];

  if ([(HMMediaGroupProtoMediaDestinationControllerData *)v6 hasParentIdentifier])
  {
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    v11 = [(HMMediaGroupProtoMediaDestinationControllerData *)v6 parentIdentifier];
    v12 = (void *)[v10 initWithUUIDString:v11];

    if ([(HMMediaGroupProtoMediaDestinationControllerData *)v6 hasDestinationIdentifier])
    {
      v13 = [(HMMediaGroupProtoMediaDestinationControllerData *)v6 destinationIdentifier];
      char v14 = [v13 isEqual:@"00000000-0000-0000-0000-000000000000"];

      if (v14)
      {
        v15 = 0;
      }
      else
      {
        id v29 = objc_alloc(MEMORY[0x1E4F29128]);
        v30 = [(HMMediaGroupProtoMediaDestinationControllerData *)v6 destinationIdentifier];
        v15 = (void *)[v29 initWithUUIDString:v30];
      }
      v31 = [(HMMediaGroupProtoMediaDestinationControllerData *)v6 availableDestinations];

      if (v31)
      {
        v32 = [(HMMediaGroupProtoMediaDestinationControllerData *)v6 availableDestinations];
        v33 = objc_msgSend(v32, "na_map:", &__block_literal_global_80);

        if ([v33 count] == 1)
        {
          v34 = [v33 firstObject];
          v35 = [v34 UUIDString];
          int v36 = [v35 isEqualToString:@"00000000-0000-0000-0000-000000000000"];

          if (v36)
          {

            v33 = (void *)MEMORY[0x1E4F1CBF0];
          }
        }
        if ([(HMMediaGroupProtoMediaDestinationControllerData *)v6 hasSupportedOptions])
        {
          uint64_t v37 = [(HMMediaGroupProtoMediaDestinationControllerData *)v6 supportedOptions];
        }
        else
        {
          v41 = (void *)MEMORY[0x19F3A64A0]();
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = HMFGetLogIdentifier();
            int v45 = 138543874;
            v46 = v43;
            __int16 v47 = 2112;
            uint64_t v48 = objc_opt_class();
            __int16 v49 = 2112;
            v50 = v6;
            _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=supportedOptions from data=%@", (uint8_t *)&v45, 0x20u);
          }
          uint64_t v37 = 0;
        }
        self = [(HMMediaDestinationControllerData *)self initWithIdentifier:v9 parentIdentifier:v12 destinationIdentifier:v15 supportedOptions:v37 availableDestinationIdentifiers:v33];

        v22 = self;
      }
      else
      {
        v38 = (void *)MEMORY[0x19F3A64A0]();
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = HMFGetLogIdentifier();
          int v45 = 138543874;
          v46 = v40;
          __int16 v47 = 2112;
          uint64_t v48 = objc_opt_class();
          __int16 v49 = 2112;
          v50 = v6;
          _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=availableDestinations from data=%@", (uint8_t *)&v45, 0x20u);
        }
        v22 = 0;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x19F3A64A0]();
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        int v45 = 138543874;
        v46 = v28;
        __int16 v47 = 2112;
        uint64_t v48 = objc_opt_class();
        __int16 v49 = 2112;
        v50 = v6;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=destinationIdentifier from data=%@", (uint8_t *)&v45, 0x20u);
      }
      v22 = 0;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x19F3A64A0]();
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      int v45 = 138543874;
      v46 = v25;
      __int16 v47 = 2112;
      uint64_t v48 = objc_opt_class();
      __int16 v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=parentIdentifier from data=%@", (uint8_t *)&v45, 0x20u);
    }
    v22 = 0;
  }

LABEL_36:
  return v22;
}

id __60__HMMediaDestinationControllerData_initWithProtoBufferData___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)encodeToProtoBufferData
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(HMMediaGroupProtoMediaDestinationControllerData);
  id v4 = [(HMMediaDestinationControllerData *)self identifier];
  v5 = [v4 UUIDString];
  [(HMMediaGroupProtoMediaDestinationControllerData *)v3 setIdentifier:v5];

  v6 = [(HMMediaDestinationControllerData *)self parentIdentifier];
  id v7 = [v6 UUIDString];
  [(HMMediaGroupProtoMediaDestinationControllerData *)v3 setParentIdentifier:v7];

  v8 = [(HMMediaDestinationControllerData *)self destinationIdentifier];
  uint64_t v9 = [v8 UUIDString];
  id v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"00000000-0000-0000-0000-000000000000";
  }
  [(HMMediaGroupProtoMediaDestinationControllerData *)v3 setDestinationIdentifier:v11];

  [(HMMediaGroupProtoMediaDestinationControllerData *)v3 setSupportedOptions:[(HMMediaDestinationControllerData *)self supportedOptions]];
  v12 = [(HMMediaDestinationControllerData *)self availableDestinationIdentifiers];
  v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_77);
  char v14 = (void *)[v13 mutableCopy];
  [(HMMediaGroupProtoMediaDestinationControllerData *)v3 setAvailableDestinations:v14];

  v15 = [(HMMediaGroupProtoMediaDestinationControllerData *)v3 availableDestinations];
  if ([v15 count])
  {
    v16 = [(HMMediaGroupProtoMediaDestinationControllerData *)v3 availableDestinations];
    [(HMMediaGroupProtoMediaDestinationControllerData *)v3 setAvailableDestinations:v16];
  }
  else
  {
    v20[0] = @"00000000-0000-0000-0000-000000000000";
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v17 = (void *)[v16 mutableCopy];
    [(HMMediaGroupProtoMediaDestinationControllerData *)v3 setAvailableDestinations:v17];
  }
  v18 = [(HMMediaGroupProtoMediaDestinationControllerData *)v3 data];

  return v18;
}

uint64_t __59__HMMediaDestinationControllerData_encodeToProtoBufferData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMMediaDestinationControllerData *)self identifier];
  [v4 encodeObject:v5 forKey:@"HMMediaDestinationControllerIdentifierCodingKey"];

  v6 = [(HMMediaDestinationControllerData *)self parentIdentifier];
  [v4 encodeObject:v6 forKey:@"HMMediaDestinationControllerParentIdentifierCodingKey"];

  id v7 = [(HMMediaDestinationControllerData *)self destinationIdentifier];
  [v4 encodeObject:v7 forKey:@"HMMediaDestinationControllerDestinationIdentifierCodingKey"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMMediaDestinationControllerData supportedOptions](self, "supportedOptions"));
  [v4 encodeObject:v8 forKey:@"HMMediaDestinationControllerSupportedOptionsCodingKey"];

  id v9 = [(HMMediaDestinationControllerData *)self availableDestinationIdentifiers];
  [v4 encodeObject:v9 forKey:@"HMMediaDestinationControllerAvailableDestinationIdentifiersCodingKey"];
}

- (HMMediaDestinationControllerData)initWithCoder:(id)a3
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationControllerIdentifierCodingKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationControllerParentIdentifierCodingKey"];
  uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationControllerDestinationIdentifierCodingKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaDestinationControllerSupportedOptionsCodingKey"];
  uint64_t v41 = [v7 unsignedIntegerValue];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  id v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"HMMediaDestinationControllerAvailableDestinationIdentifiersCodingKey"];

  if (!v11)
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v40 = self;
    v13 = self;
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v15;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Using legacy encoding to get available destination identifiers", buf, 0xCu);
    }
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    v18 = [v16 setWithArray:v17];
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"HMMediaDestinationControllerAvailableDestinationsCodingKey"];

    v11 = objc_msgSend(v19, "na_map:", &__block_literal_global_73_23672);

    self = v40;
    if (!v11)
    {
      v20 = (void *)MEMORY[0x19F3A64A0]();
      uint32_t v21 = v13;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v44 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Using legacy homed encoding to get available destination identifiers", buf, 0xCu);
      }
      v24 = (void *)MEMORY[0x1E4F1CAD0];
      v49[0] = objc_opt_class();
      v49[1] = objc_opt_class();
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      v26 = [v24 setWithArray:v25];
      v11 = [v4 decodeObjectOfClasses:v26 forKey:@"HMDMediaDestinationControllerAvailableDestinationIdentifiersCodingKey"];

      self = v40;
      if (!v11)
      {
        v27 = (void *)MEMORY[0x19F3A64A0]();
        v28 = v21;
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v44 = v30;
          _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not get encoded available destination identifiers", buf, 0xCu);

          self = v40;
        }

        v11 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  if (v5 && v6)
  {
    v31 = (void *)v42;
    v32 = [(HMMediaDestinationControllerData *)self initWithIdentifier:v5 parentIdentifier:v6 destinationIdentifier:v42 supportedOptions:v41 availableDestinationIdentifiers:v11];
    v33 = v32;
  }
  else
  {
    uint64_t v34 = MEMORY[0x19F3A64A0]();
    v35 = self;
    int v36 = (void *)v34;
    v32 = v35;
    uint64_t v37 = HMFGetOSLogHandle();
    v31 = (void *)v42;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v44 = v38;
      __int16 v45 = 2112;
      v46 = v5;
      __int16 v47 = 2112;
      uint64_t v48 = v6;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data with identifier: %@ parent identifier: %@", buf, 0x20u);
    }
    v33 = 0;
  }

  return v33;
}

uint64_t __50__HMMediaDestinationControllerData_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (unint64_t)hash
{
  v2 = [(HMMediaDestinationControllerData *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMediaDestinationControllerData *)a3;
  if (self == v4)
  {
    char v19 = 1;
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
      id v7 = [(HMMediaDestinationControllerData *)self identifier];
      v8 = [(HMMediaDestinationControllerData *)v6 identifier];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        id v9 = [(HMMediaDestinationControllerData *)self parentIdentifier];
        id v10 = [(HMMediaDestinationControllerData *)v6 parentIdentifier];
        if (!objc_msgSend(v9, "hmf_isEqualToUUID:", v10)) {
          goto LABEL_15;
        }
        v11 = [(HMMediaDestinationControllerData *)self destinationIdentifier];
        v12 = [(HMMediaDestinationControllerData *)v6 destinationIdentifier];
        int v13 = HMFEqualObjects();

        if (!v13) {
          goto LABEL_15;
        }
        unint64_t v14 = [(HMMediaDestinationControllerData *)self supportedOptions];
        if (v14 == [(HMMediaDestinationControllerData *)v6 supportedOptions])
        {
          v15 = [(HMMediaDestinationControllerData *)self availableDestinationIdentifiers];
          uint64_t v16 = [v15 count];
          v17 = [(HMMediaDestinationControllerData *)v6 availableDestinationIdentifiers];
          if (v16 == [v17 count])
          {
            v18 = [(HMMediaDestinationControllerData *)self availableDestinationIdentifiers];
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __44__HMMediaDestinationControllerData_isEqual___block_invoke;
            v21[3] = &unk_1E5940578;
            v22 = v6;
            char v19 = objc_msgSend(v18, "na_allObjectsPassTest:", v21);
          }
          else
          {
            char v19 = 0;
          }
        }
        else
        {
LABEL_15:
          char v19 = 0;
        }
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  return v19;
}

uint64_t __44__HMMediaDestinationControllerData_isEqual___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 availableDestinationIdentifiers];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableMediaDestinationControllerData alloc];
  uint64_t v5 = [(HMMediaDestinationControllerData *)self identifier];
  v6 = [(HMMediaDestinationControllerData *)self parentIdentifier];
  id v7 = [(HMMediaDestinationControllerData *)self destinationIdentifier];
  unint64_t v8 = [(HMMediaDestinationControllerData *)self supportedOptions];
  id v9 = [(HMMediaDestinationControllerData *)self availableDestinationIdentifiers];
  id v10 = [(HMMediaDestinationControllerData *)v4 initWithIdentifier:v5 parentIdentifier:v6 destinationIdentifier:v7 supportedOptions:v8 availableDestinationIdentifiers:v9];

  return v10;
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
  if (logCategory__hmf_once_t0_23698 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_23698, &__block_literal_global_23699);
  }
  v2 = (void *)logCategory__hmf_once_v1_23700;

  return v2;
}

uint64_t __47__HMMediaDestinationControllerData_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_23700;
  logCategory__hmf_once_v1_23700 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSArray)attributeDescriptions
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint32_t v21 = [(HMMediaDestinationControllerData *)self identifier];
  id v4 = (void *)[v3 initWithName:@"identifier" value:v21];
  v22[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMMediaDestinationControllerData *)self parentIdentifier];
  id v7 = (void *)[v5 initWithName:@"parentIdentifier" value:v6];
  v22[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v9 = [(HMMediaDestinationControllerData *)self destinationIdentifier];
  id v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"not set";
  }
  v12 = (void *)[v8 initWithName:@"destinationIdentifier" value:v11];
  v22[2] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v14 = HMMediaDestinationControllerSupportOptionsAsString([(HMMediaDestinationControllerData *)self supportedOptions]);
  v15 = (void *)[v13 initWithName:@"supportedOptions" value:v14];
  v22[3] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  v17 = [(HMMediaDestinationControllerData *)self availableDestinationIdentifiers];
  v18 = (void *)[v16 initWithName:@"availableDestinationIdentifiers" value:v17];
  v22[4] = v18;
  char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];

  return (NSArray *)v19;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)logIdentifier
{
  v2 = [(HMMediaDestinationControllerData *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (HMMediaDestinationControllerData)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 destinationIdentifier:(id)a5 supportedOptions:(unint64_t)a6 availableDestinationIdentifiers:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_9:
    uint32_t v21 = (HMHome *)_HMFPreconditionFailure();
    [(HMHome *)v21 unjoinThreadNetworkWithCompletion:v23];
    return result;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMMediaDestinationControllerData;
  v18 = [(HMMediaDestinationControllerData *)&v24 init];
  char v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_parentIdentifier, a4);
    objc_storeStrong((id *)&v19->_destinationIdentifier, a5);
    v19->_supportedOptions = a6;
    objc_storeStrong((id *)&v19->_availableDestinationIdentifiers, a7);
  }

  return v19;
}

@end