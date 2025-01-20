@interface HMMatterAttributeEvent
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
+ (id)new;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMMatterAttributeEvent)initWithAttributeID:(id)a3 clusterID:(id)a4 endpointID:(id)a5 accessory:(id)a6 triggerValue:(id)a7;
- (HMMatterAttributeEvent)initWithCoder:(id)a3;
- (HMMatterAttributeEvent)initWithDict:(id)a3 attributeID:(id)a4 clusterID:(id)a5 endpointID:(id)a6 accessory:(id)a7 triggerValue:(id)a8;
- (NSCopying)triggerValue;
- (NSNumber)attributeID;
- (NSNumber)clusterID;
- (NSNumber)endpointID;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_updateFromDictionary:(id)a3;
- (void)setTriggerValue:(id)a3;
@end

@implementation HMMatterAttributeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_attributeID, 0);

  objc_storeStrong((id *)&self->_triggerValue, 0);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (NSNumber)endpointID
{
  return self->_endpointID;
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (NSNumber)attributeID
{
  return self->_attributeID;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HMMutableMatterAttributeEvent alloc];
  v5 = [(HMMatterAttributeEvent *)self attributeID];
  v6 = [(HMMatterAttributeEvent *)self clusterID];
  v7 = [(HMMatterAttributeEvent *)self endpointID];
  v8 = [(HMMatterAttributeEvent *)self accessory];
  v9 = [(HMMatterAttributeEvent *)self triggerValue];
  v10 = [(HMMatterAttributeEvent *)v4 initWithAttributeID:v5 clusterID:v6 endpointID:v7 accessory:v8 triggerValue:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"HMAttributeValueKey"];
  v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
  v10 = objc_msgSend(v6, "hmf_numberForKey:", @"HMAttributeIDKey");
  v11 = objc_msgSend(v6, "hmf_numberForKey:", @"HMClusterIDKey");
  uint64_t v12 = objc_msgSend(v6, "hmf_numberForKey:", @"HMEndpointIDKey");
  v13 = (void *)v12;
  if (v9 && v10 && v11 && v12)
  {
    v14 = [v7 accessoryWithUUID:v9];
    if (v14)
    {
      v15 = [[HMMatterAttributeEvent alloc] initWithDict:v6 attributeID:v10 clusterID:v11 endpointID:v13 accessory:v14 triggerValue:v8];
    }
    else
    {
      context = (void *)MEMORY[0x19F3A64A0]();
      id v21 = a1;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = v25 = v8;
        *(_DWORD *)buf = 138543874;
        v29 = v23;
        __int16 v30 = 2112;
        uint64_t v31 = objc_opt_class();
        __int16 v32 = 2112;
        v33 = v9;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, failed to resolve accessory %@", buf, 0x20u);

        v8 = v25;
      }

      v15 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = a1;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      contexta = v7;
      v20 = v19 = v8;
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      __int16 v30 = 2112;
      uint64_t v31 = objc_opt_class();
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing accessory/attribute/cluster/endpoint ids", buf, 0x16u);

      v8 = v19;
      id v7 = contexta;
    }

    v15 = 0;
  }

  return v15;
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HMMatterAttributeEvent alloc];
  v5 = [(HMMatterAttributeEvent *)self attributeID];
  id v6 = [(HMMatterAttributeEvent *)self clusterID];
  id v7 = [(HMMatterAttributeEvent *)self endpointID];
  v8 = [(HMMatterAttributeEvent *)self accessory];
  v9 = [(HMMatterAttributeEvent *)self triggerValue];
  v10 = [(HMMatterAttributeEvent *)v4 initWithAttributeID:v5 clusterID:v6 endpointID:v7 accessory:v8 triggerValue:v9];

  return v10;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMMatterAttributeEvent;
  BOOL v5 = [(HMEvent *)&v14 mergeFromNewObject:v4];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [(HMMatterAttributeEvent *)self triggerValue];
    v10 = [v8 triggerValue];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [v8 triggerValue];
      [(HMMatterAttributeEvent *)self setTriggerValue:v12];

      BOOL v5 = 1;
    }
  }

  return v5;
}

- (HMMatterAttributeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMMatterAttributeEvent;
  BOOL v5 = [(HMEvent *)&v18 initWithCoder:v4];
  if (v5)
  {
    id v6 = allowedCharValueTypes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"HMAttributeValueCodingKey"];
    triggerValue = v5->_triggerValue;
    v5->_triggerValue = (NSCopying *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAttributeIDCodingKey"];
    attributeID = v5->_attributeID;
    v5->_attributeID = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMClusterIDCodingKey"];
    clusterID = v5->_clusterID;
    v5->_clusterID = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMEndpointIDCodingKey"];
    endpointID = v5->_endpointID;
    v5->_endpointID = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    accessory = v5->_accessory;
    v5->_accessory = (HMAccessory *)v15;
  }
  return v5;
}

- (void)_updateFromDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMMatterAttributeEvent;
  id v4 = a3;
  [(HMEvent *)&v6 _updateFromDictionary:v4];
  BOOL v5 = objc_msgSend(v4, "objectForKeyedSubscript:", @"HMAttributeValueKey", v6.receiver, v6.super_class);

  [(HMMatterAttributeEvent *)self setTriggerValue:v5];
}

- (id)_serializeForAdd
{
  v14.receiver = self;
  v14.super_class = (Class)HMMatterAttributeEvent;
  uint64_t v3 = [(HMEvent *)&v14 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(HMMatterAttributeEvent *)self accessory];
  objc_super v6 = [v5 uuid];
  [v4 setObject:v6 forKeyedSubscript:@"kAccessoryUUID"];

  uint64_t v7 = [(HMMatterAttributeEvent *)self attributeID];
  [v4 setObject:v7 forKeyedSubscript:@"HMAttributeIDKey"];

  id v8 = [(HMMatterAttributeEvent *)self clusterID];
  [v4 setObject:v8 forKeyedSubscript:@"HMClusterIDKey"];

  uint64_t v9 = [(HMMatterAttributeEvent *)self endpointID];
  [v4 setObject:v9 forKeyedSubscript:@"HMEndpointIDKey"];

  v10 = [(HMMatterAttributeEvent *)self triggerValue];

  if (v10)
  {
    uint64_t v11 = [(HMMatterAttributeEvent *)self triggerValue];
    [v4 setObject:v11 forKeyedSubscript:@"HMAttributeValueKey"];
  }
  uint64_t v12 = (void *)[v4 copy];

  return v12;
}

- (void)setTriggerValue:(id)a3
{
  id v4 = (NSCopying *)a3;
  os_unfair_lock_lock_with_options();
  triggerValue = self->_triggerValue;
  self->_triggerValue = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSCopying)triggerValue
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_triggerValue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMMatterAttributeEvent)initWithAttributeID:(id)a3 clusterID:(id)a4 endpointID:(id)a5 accessory:(id)a6 triggerValue:(id)a7
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22 = @"kEventUUIDKey";
  uint64_t v12 = (void *)MEMORY[0x1E4F29128];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  objc_super v18 = [v12 UUID];
  v23[0] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  v20 = [(HMMatterAttributeEvent *)self initWithDict:v19 attributeID:v17 clusterID:v16 endpointID:v15 accessory:v14 triggerValue:v13];

  return v20;
}

- (HMMatterAttributeEvent)initWithDict:(id)a3 attributeID:(id)a4 clusterID:(id)a5 endpointID:(id)a6 accessory:(id)a7 triggerValue:(id)a8
{
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMMatterAttributeEvent;
  objc_super v18 = [(HMEvent *)&v25 initWithDict:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_attributeID, a4);
    objc_storeStrong((id *)&v19->_clusterID, a5);
    objc_storeStrong((id *)&v19->_endpointID, a6);
    objc_storeStrong((id *)&v19->_accessory, a7);
    uint64_t v20 = objc_msgSend(v17, "copy", v23, v24);
    triggerValue = v19->_triggerValue;
    v19->_triggerValue = (NSCopying *)v20;
  }
  return v19;
}

@end