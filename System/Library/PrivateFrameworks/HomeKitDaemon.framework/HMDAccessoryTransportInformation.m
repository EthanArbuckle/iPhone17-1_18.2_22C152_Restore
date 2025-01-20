@interface HMDAccessoryTransportInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isReachable;
- (HAPAccessory)hapAccessory;
- (HMDAccessoryTransportInformation)initWithCoder:(id)a3;
- (HMDAccessoryTransportInformation)initWithServerIdentifier:(id)a3 instanceID:(id)a4 linkType:(int64_t)a5;
- (NSDate)reachableLastChangedTime;
- (NSDictionary)transportInfoDictionary;
- (NSNumber)instanceID;
- (NSString)protocolVersion;
- (NSString)serverIdentifier;
- (id)attributeDescriptions;
- (id)report;
- (int64_t)linkType;
- (void)encodeWithCoder:(id)a3;
- (void)setHapAccessory:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setReachable:(BOOL)a3;
@end

@implementation HMDAccessoryTransportInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_reachableLastChangedTime, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_hapAccessory, 0);
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAccessoryTransportInformation *)self serverIdentifier];
  v5 = (void *)[v3 initWithName:@"Server ID" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDAccessoryTransportInformation *)self instanceID];
  v8 = (void *)[v6 initWithName:@"Instance ID" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryTransportInformation *)self linkType];
  v10 = HAPLinkTypeDescription();
  v11 = (void *)[v9 initWithName:@"Link Type" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryTransportInformation *)self isReachable];
  v13 = HMFBooleanToString();
  v14 = (void *)[v12 initWithName:@"Reachable" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(HMDAccessoryTransportInformation *)self serverIdentifier];
  [v6 encodeObject:v4 forKey:@"HM.serverIdentifier"];

  v5 = [(HMDAccessoryTransportInformation *)self instanceID];
  [v6 encodeObject:v5 forKey:@"HM.instanceID"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[HMDAccessoryTransportInformation linkType](self, "linkType"), @"linkType");
}

- (HMDAccessoryTransportInformation)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.serverIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.instanceID"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"linkType"];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      v13 = HAPLinkTypeDescription();
      int v17 = 138544130;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot decode from serverIdentifier: %@ instanceID: %@ linkType: %@", (uint8_t *)&v17, 0x2Au);
    }
    v15 = 0;
  }
  else
  {
    v14 = [(HMDAccessoryTransportInformation *)self initWithServerIdentifier:v5 instanceID:v6 linkType:v7];
    v15 = v14;
  }

  return v15;
}

- (id)report
{
  id v3 = [(HMDAccessoryTransportInformation *)self hapAccessory];
  id v4 = [v3 server];

  [(HMDAccessoryTransportInformation *)self linkType];
  HAPLinkTypeDescription();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v6)
  {

    v5 = @"Thread";
  }
  BOOL v8 = [HMDAccessoryTransportReachabilityReport alloc];
  uint64_t v9 = [v6 hasAdvertisement];
  [v6 communicationProtocol];
  v10 = HAPCommunicationProtocolDescription();
  v11 = [(HMDAccessoryTransportInformation *)self protocolVersion];
  BOOL v12 = [(HMDAccessoryTransportInformation *)self isReachable];
  v13 = [(HMDAccessoryTransportInformation *)self reachableLastChangedTime];
  v14 = [v6 reachabilityChangedReason];
  v15 = [(HMDAccessoryTransportReachabilityReport *)v8 initWithLinkType:v5 hasAdvertisement:v9 protocol:v10 protocolVersion:v11 reachable:v12 reachableLastChangedTime:v13 reason:v14];

  return v15;
}

- (NSDictionary)transportInfoDictionary
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"HM.serverIdentifier";
  id v3 = [(HMDAccessoryTransportInformation *)self serverIdentifier];
  v9[0] = v3;
  v8[1] = @"HM.instanceID";
  id v4 = [(HMDAccessoryTransportInformation *)self instanceID];
  v9[1] = v4;
  v8[2] = @"linkType";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessoryTransportInformation linkType](self, "linkType"));
  v9[2] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSDate)reachableLastChangedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_reachableLastChangedTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReachable:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reachable = a3;
  id v6 = [MEMORY[0x263EFF910] now];
  reachableLastChangedTime = self->_reachableLastChangedTime;
  self->_reachableLastChangedTime = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isReachable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setProtocolVersion:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  protocolVersion = self->_protocolVersion;
  self->_protocolVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)protocolVersion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_protocolVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHapAccessory:(id)a3
{
  id v4 = (HAPAccessory *)a3;
  os_unfair_lock_lock_with_options();
  hapAccessory = self->_hapAccessory;
  self->_hapAccessory = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HAPAccessory)hapAccessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_hapAccessory;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDAccessoryTransportInformation)initWithServerIdentifier:(id)a3 instanceID:(id)a4 linkType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!a5)
  {
LABEL_9:
    int v17 = (void *)_HMFPreconditionFailure();
    return (HMDAccessoryTransportInformation *)+[HMDAccessoryTransportInformation supportsSecureCoding];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDAccessoryTransportInformation;
  v11 = [(HMDAccessoryTransportInformation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    serverIdentifier = v11->_serverIdentifier;
    v11->_serverIdentifier = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    instanceID = v11->_instanceID;
    v11->_instanceID = (NSNumber *)v14;

    v11->_linkType = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end