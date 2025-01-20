@interface HMAddAccessoryRequest
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresOwnershipToken;
- (BOOL)requiresSetupPayloadURL;
- (HMAccessoryCategory)accessoryCategory;
- (HMAccessorySetupPayload)payloadWithOwnershipToken:(HMAccessoryOwnershipToken *)ownershipToken;
- (HMAccessorySetupPayload)payloadWithURL:(NSURL *)setupPayloadURL ownershipToken:(HMAccessoryOwnershipToken *)ownershipToken;
- (HMAddAccessoryRequest)init;
- (HMAddAccessoryRequest)initWithCoder:(id)a3;
- (HMAddAccessoryRequest)initWithIdentifier:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5;
- (HMHome)home;
- (HMSetupAccessoryDescription)accessoryDescription;
- (NSArray)attributeDescriptions;
- (NSString)accessoryName;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)requestIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryDescription:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HMAddAccessoryRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryDescription, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

- (void)setAccessoryDescription:(id)a3
{
}

- (HMSetupAccessoryDescription)accessoryDescription
{
  return self->_accessoryDescription;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (BOOL)requiresOwnershipToken
{
  return self->_requiresOwnershipToken;
}

- (BOOL)requiresSetupPayloadURL
{
  return self->_requiresSetupPayloadURL;
}

- (HMAccessoryCategory)accessoryCategory
{
  return self->_accessoryCategory;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setHome:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)attributeDescriptions
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMAddAccessoryRequest *)self requestIdentifier];
  v19 = (void *)[v3 initWithName:@"ID" value:v20];
  v21[0] = v19;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMAddAccessoryRequest *)self home];
  v6 = [v5 name];
  v7 = (void *)[v4 initWithName:@"Home Name" value:v6];
  v21[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMAddAccessoryRequest *)self accessoryName];
  v10 = (void *)[v8 initWithName:@"Accessory Name" value:v9];
  v21[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v12 = [(HMAddAccessoryRequest *)self accessoryCategory];
  v13 = (void *)[v11 initWithName:@"Accessory Category" value:v12];
  v21[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMAddAccessoryRequest *)self requiresSetupPayloadURL];
  v15 = HMFBooleanToString();
  v16 = (void *)[v14 initWithName:@"Requires Setup Payload URL" value:v15];
  v21[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];

  return (NSArray *)v17;
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
  v2 = [(HMAddAccessoryRequest *)self requestIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAddAccessoryRequest *)a3;
  if (self == v4)
  {
    char v9 = 1;
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
      v7 = [(HMAddAccessoryRequest *)self requestIdentifier];
      id v8 = [(HMAddAccessoryRequest *)v6 requestIdentifier];
      char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMAddAccessoryRequest)initWithIdentifier:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMAddAccessoryRequest;
  id v11 = [(HMAddAccessoryRequest *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v8);
    requestIdentifier = v11->_requestIdentifier;
    v11->_requestIdentifier = (NSUUID *)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v9);
    accessoryName = v11->_accessoryName;
    v11->_accessoryName = (NSString *)v14;

    uint64_t v16 = +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:v10];
    accessoryCategory = v11->_accessoryCategory;
    v11->_accessoryCategory = (HMAccessoryCategory *)v16;

    v18 = v11;
  }

  return v11;
}

- (HMAddAccessoryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMAddAccessoryRequest;
  v5 = [(HMAddAccessoryRequest *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"HMAAR.accessoryName");
    accessoryName = v5->_accessoryName;
    v5->_accessoryName = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", @"HMAAR.identifier");
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v8;

    uint64_t v10 = objc_msgSend(v4, "hm_decodeHMAccessoryCategoryAndCacheForKey:", @"HMAAR.category");
    accessoryCategory = v5->_accessoryCategory;
    v5->_accessoryCategory = (HMAccessoryCategory *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAAR.accessoryDescription"];
    accessoryDescription = v5->_accessoryDescription;
    v5->_accessoryDescription = (HMSetupAccessoryDescription *)v12;

    *(_WORD *)&v5->_requiresSetupPayloadURL = 256;
    uint64_t v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMAccessorySetupPayload)payloadWithURL:(NSURL *)setupPayloadURL ownershipToken:(HMAccessoryOwnershipToken *)ownershipToken
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = setupPayloadURL;
  v7 = ownershipToken;
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2080;
    objc_super v16 = "-[HMAddAccessoryRequest payloadWithURL:ownershipToken:]";
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is not supported", (uint8_t *)&v13, 0x16u);
  }

  return 0;
}

- (HMAccessorySetupPayload)payloadWithOwnershipToken:(HMAccessoryOwnershipToken *)ownershipToken
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = ownershipToken;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2080;
    int v13 = "-[HMAddAccessoryRequest payloadWithOwnershipToken:]";
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@%s is not supported", (uint8_t *)&v10, 0x16u);
  }

  return 0;
}

- (HMAddAccessoryRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMAddAccessoryRequest;
  return [(HMAddAccessoryRequest *)&v3 init];
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

@end