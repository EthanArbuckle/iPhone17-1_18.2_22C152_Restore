@interface MTSDeviceSetupRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldScanNetworks;
- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6;
- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 rootPublicKey:(id)a7 nodeID:(id)a8;
- (MTDeviceSetupRequestSwiftWrapper)wrappedRequest;
- (MTRSetupPayload)setupPayload;
- (MTSDeviceSetupRequest)initWithCoder:(id)a3;
- (MTSDeviceSetupRequest)initWithDictionaryRepresentation:(id)a3;
- (MTSDeviceSetupRequest)initWithEcosystemName:(id)a3 homeNames:(id)a4 blockedDevicePairings:(id)a5;
- (MTSDeviceSetupRequest)initWithSerializedRequest:(id)a3;
- (MTSDeviceSetupRequest)initWithWrappedRequest:(id)a3;
- (MTSDeviceSetupTopology)topology;
- (NSDictionary)dictionaryRepresentation;
- (NSString)ecosystemName;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSDeviceSetupRequest

- (void).cxx_destruct
{
}

- (MTDeviceSetupRequestSwiftWrapper)wrappedRequest
{
  return (MTDeviceSetupRequestSwiftWrapper *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  v5 = [v6 serializedAsData];
  [v4 encodeObject:v5 forKey:@"MTSDSR.wrappedRequest"];
}

- (MTSDeviceSetupRequest)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDSR.wrappedRequest"];
  if (v5)
  {
    id v6 = [(MTSDeviceSetupRequest *)self initWithSerializedRequest:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x245697870]();
    id v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [0 length];
      _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not deserialize from wrappedRequestData: %ld", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)debugDescription
{
  v2 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  v3 = [v2 debugDescription];

  return v3;
}

- (id)description
{
  v2 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  v3 = [v2 description];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(MTSDeviceSetupRequest *)self wrappedRequest];
    v8 = [v6 wrappedRequest];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 rootPublicKey:(id)a7 nodeID:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  char v21 = [v20 shouldShowDeviceWithUUID:v19 vendorID:v18 productID:v17 serialNumber:v16 rootPublicKey:v15 nodeID:v14];

  return v21;
}

- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  char v15 = [v14 shouldShowDeviceWithUUID:v13 vendorID:v12 productID:v11 serialNumber:v10 rootPublicKey:0 nodeID:0];

  return v15;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = 0;
  unint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v11];
  id v4 = v11;
  if (v3)
  {
    id v12 = @"MTSDSR";
    id v13 = v3;
    v5 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x245697870]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      char v15 = v9;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_2450FD000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize device setup request %@: %@", buf, 0x20u);
    }
    v5 = (void *)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v5;
}

- (MTRSetupPayload)setupPayload
{
  v2 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  unint64_t v3 = [v2 setupPayload];

  return (MTRSetupPayload *)v3;
}

- (BOOL)shouldScanNetworks
{
  v2 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  char v3 = [v2 shouldScanNetworks];

  return v3;
}

- (NSString)ecosystemName
{
  v2 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  char v3 = [v2 ecosystemName];

  return (NSString *)v3;
}

- (MTSDeviceSetupTopology)topology
{
  v2 = [(MTSDeviceSetupRequest *)self wrappedRequest];
  char v3 = [v2 topology];

  return (MTSDeviceSetupTopology *)v3;
}

- (MTSDeviceSetupRequest)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTSDeviceSetupRequest *)self init];
  objc_msgSend(v4, "hmf_dataForKey:", @"MTSDSR");
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v18 = 0;
    v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v18];
    id v8 = v18;

    if (v7)
    {
      char v9 = v7;
    }
    else
    {
      id v14 = (void *)MEMORY[0x245697870]();
      char v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v16;
        __int16 v21 = 2112;
        v22 = v6;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_2450FD000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device setup request from dictionary representation; failed to deserialize data %@: %@",
          buf,
          0x20u);
      }
    }

    id v13 = v7;
  }
  else
  {
    id v10 = (void *)MEMORY[0x245697870]();
    v7 = v5;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      v22 = @"MTSDSR";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_2450FD000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device setup request from dictionary representation; missing %@ key in dictionary: %@",
        buf,
        0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

- (MTSDeviceSetupRequest)initWithEcosystemName:(id)a3 homeNames:(id)a4 blockedDevicePairings:(id)a5
{
  id v6 = +[MTDeviceSetupRequestFactory makeRequestWithEcosystemName:a3 homes:a4 blockedDevicePairings:a5];
  v7 = [(MTSDeviceSetupRequest *)self initWithWrappedRequest:v6];

  return v7;
}

- (MTSDeviceSetupRequest)initWithSerializedRequest:(id)a3
{
  id v4 = +[MTDeviceSetupRequestFactory makeRequestFrom:a3];
  if (v4)
  {
    self = [(MTSDeviceSetupRequest *)self initWithWrappedRequest:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MTSDeviceSetupRequest)initWithWrappedRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSDeviceSetupRequest;
  id v6 = [(MTSDeviceSetupRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedRequest, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end