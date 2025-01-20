@interface HMDNotificationRegistryMediaPropertiesRequest
- (HMDNotificationRegistryMediaPropertiesRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 mediaProfileUUID:(id)a6;
- (NSMutableSet)mediaProperties;
- (NSUUID)mediaProfileUUID;
- (id)attributeDescriptions;
- (void)setMediaProperties:(id)a3;
@end

@implementation HMDNotificationRegistryMediaPropertiesRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProperties, 0);
  objc_storeStrong((id *)&self->_mediaProfileUUID, 0);
}

- (void)setMediaProperties:(id)a3
{
}

- (NSMutableSet)mediaProperties
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)mediaProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v16[2] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  v3 = [(HMDNotificationRegistryRequest *)&v15 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDNotificationRegistryMediaPropertiesRequest *)self mediaProfileUUID];
  v6 = (void *)[v4 initWithName:@"Media Profile UUID" value:v5];
  v16[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDNotificationRegistryMediaPropertiesRequest *)self mediaProperties];
  v9 = [v8 allObjects];
  v10 = [v9 componentsJoinedByString:@","];
  v11 = (void *)[v7 initWithName:@"Media Properties" value:v10];
  v16[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v13 = [v3 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (HMDNotificationRegistryMediaPropertiesRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 mediaProfileUUID:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v13 = v12;
  if (!v12)
  {
LABEL_9:
    v20 = (HMDNotificationRegistryActionSetRequest *)_HMFPreconditionFailure();
    [(HMDNotificationRegistryActionSetRequest *)v20 .cxx_destruct];
    return result;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  v14 = [(HMDNotificationRegistryRequest *)&v22 initWithEnable:v8 user:v10 deviceIdsDestination:v11];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    mediaProfileUUID = v14->_mediaProfileUUID;
    v14->_mediaProfileUUID = (NSUUID *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    mediaProperties = v14->_mediaProperties;
    v14->_mediaProperties = (NSMutableSet *)v17;
  }
  return v14;
}

@end