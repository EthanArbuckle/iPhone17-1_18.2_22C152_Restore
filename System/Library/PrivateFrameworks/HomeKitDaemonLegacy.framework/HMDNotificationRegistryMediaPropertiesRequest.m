@interface HMDNotificationRegistryMediaPropertiesRequest
- (HMDNotificationRegistryMediaPropertiesRequest)initWithEnable:(BOOL)a3 userID:(id)a4 mediaProfileUUID:(id)a5;
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
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)mediaProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (id)attributeDescriptions
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  v3 = [(HMDNotificationRegistryRequest *)&v15 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDNotificationRegistryMediaPropertiesRequest *)self mediaProfileUUID];
  v6 = (void *)[v4 initWithName:@"Media Profile UUID" value:v5];
  v16[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDNotificationRegistryMediaPropertiesRequest *)self mediaProperties];
  v9 = [v8 allObjects];
  v10 = [v9 componentsJoinedByString:@","];
  v11 = (void *)[v7 initWithName:@"Media Properties" value:v10];
  v16[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v13 = [v3 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (HMDNotificationRegistryMediaPropertiesRequest)initWithEnable:(BOOL)a3 userID:(id)a4 mediaProfileUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMDCHIPAccessoryDataSource *)_HMFPreconditionFailure();
    [(HMDCHIPAccessoryDataSource *)v17 .cxx_destruct];
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDNotificationRegistryMediaPropertiesRequest;
  v11 = [(HMDNotificationRegistryRequest *)&v19 initWithEnable:v6 userID:v8];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    mediaProfileUUID = v11->_mediaProfileUUID;
    v11->_mediaProfileUUID = (NSUUID *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    mediaProperties = v11->_mediaProperties;
    v11->_mediaProperties = (NSMutableSet *)v14;
  }
  return v11;
}

@end