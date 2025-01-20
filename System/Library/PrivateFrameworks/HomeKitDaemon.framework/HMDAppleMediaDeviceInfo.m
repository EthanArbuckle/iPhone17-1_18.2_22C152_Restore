@interface HMDAppleMediaDeviceInfo
- (HMDAppleMediaDeviceInfo)init;
- (HMDAppleMediaDeviceInfo)initWithDeviceID:(id)a3 mediaRouteID:(id)a4 deviceCapabilities:(id)a5;
- (HMDAppleMediaDeviceInfo)initWithPayload:(id)a3;
- (HMDDeviceCapabilities)capabilities;
- (NSString)deviceID;
- (NSUUID)mediaRouteUUID;
- (NSUUID)modelID;
- (id)asPayload;
- (id)attributeDescriptions;
- (void)setModelID:(id)a3;
@end

@implementation HMDAppleMediaDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_mediaRouteUUID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (HMDDeviceCapabilities)capabilities
{
  return self->_capabilities;
}

- (NSUUID)mediaRouteUUID
{
  return self->_mediaRouteUUID;
}

- (void)setModelID:(id)a3
{
}

- (NSUUID)modelID
{
  return self->_modelID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAppleMediaDeviceInfo *)self deviceID];
  v5 = (void *)[v3 initWithName:@"Device ID" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDAppleMediaDeviceInfo *)self modelID];
  v8 = (void *)[v6 initWithName:@"Model ID" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDAppleMediaDeviceInfo *)self mediaRouteUUID];
  v11 = (void *)[v9 initWithName:@"Media Route" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDAppleMediaDeviceInfo *)self capabilities];
  v14 = (void *)[v12 initWithName:@"Capabilities" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

- (id)asPayload
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDAppleMediaDeviceInfo *)self deviceID];

  if (v4)
  {
    v5 = [(HMDAppleMediaDeviceInfo *)self deviceID];
    [v3 setObject:v5 forKey:@"HMDAM.u"];
  }
  id v6 = [(HMDAppleMediaDeviceInfo *)self mediaRouteUUID];

  if (v6)
  {
    v7 = [(HMDAppleMediaDeviceInfo *)self mediaRouteUUID];
    v8 = [v7 UUIDString];
    [v3 setObject:v8 forKey:@"HMDAM.r"];
  }
  id v9 = [(HMDAppleMediaDeviceInfo *)self capabilities];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F08910];
    v11 = [(HMDAppleMediaDeviceInfo *)self capabilities];
    id v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

    if (v12) {
      [v3 setObject:v12 forKey:@"HMDAM.c"];
    }
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (HMDAppleMediaDeviceInfo)init
{
  id v3 = (id)_mediaRouteIdentifier;
  if (v3)
  {
    v4 = v3;
    id v5 = (id)uniqueDeviceId;
    id v6 = +[HMDAppleAccountManager sharedManager];
    v7 = [v6 device];
    v8 = [v7 capabilities];
    id v9 = [(HMDAppleMediaDeviceInfo *)self initWithDeviceID:v5 mediaRouteID:v4 deviceCapabilities:v8];

    return v9;
  }
  else
  {
    v11 = (HMDAppleMediaDeviceInfo *)_HMFPreconditionFailure();
    return [(HMDAppleMediaDeviceInfo *)v11 initWithPayload:v13];
  }
}

- (HMDAppleMediaDeviceInfo)initWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"HMDAM.c"];
  if (v5)
  {
    id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
  }
  else
  {
    id v6 = 0;
  }
  v7 = [v4 objectForKey:@"HMDAM.u"];
  v8 = [v4 objectForKey:@"HMDAM.r"];

  id v9 = [(HMDAppleMediaDeviceInfo *)self initWithDeviceID:v7 mediaRouteID:v8 deviceCapabilities:v6];
  return v9;
}

- (HMDAppleMediaDeviceInfo)initWithDeviceID:(id)a3 mediaRouteID:(id)a4 deviceCapabilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDAppleMediaDeviceInfo;
  SEL v12 = [(HMDAppleMediaDeviceInfo *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deviceID, a3);
    uint64_t v14 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSString:", v10);
    mediaRouteUUID = v13->_mediaRouteUUID;
    v13->_mediaRouteUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_capabilities, a5);
  }

  return v13;
}

@end