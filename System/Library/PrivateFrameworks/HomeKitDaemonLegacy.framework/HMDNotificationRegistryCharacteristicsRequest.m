@interface HMDNotificationRegistryCharacteristicsRequest
- (HMDNotificationRegistryCharacteristicsRequest)initWithEnable:(BOOL)a3 userID:(id)a4 accessoryUUID:(id)a5;
- (NSMutableSet)characteristicInstanceIDs;
- (NSUUID)accessoryUUID;
- (id)attributeDescriptions;
@end

@implementation HMDNotificationRegistryCharacteristicsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicInstanceIDs, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSMutableSet)characteristicInstanceIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (id)attributeDescriptions
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  v3 = [(HMDNotificationRegistryRequest *)&v15 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDNotificationRegistryCharacteristicsRequest *)self accessoryUUID];
  v6 = (void *)[v4 initWithName:@"Accessory UUID" value:v5];
  v16[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDNotificationRegistryCharacteristicsRequest *)self characteristicInstanceIDs];
  v9 = [v8 allObjects];
  v10 = [v9 componentsJoinedByString:@","];
  v11 = (void *)[v7 initWithName:@"Characteristic IIDs" value:v10];
  v16[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v13 = [v3 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (HMDNotificationRegistryCharacteristicsRequest)initWithEnable:(BOOL)a3 userID:(id)a4 accessoryUUID:(id)a5
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
    v17 = (HMDNotificationRegistryMediaPropertiesRequest *)_HMFPreconditionFailure();
    [(HMDNotificationRegistryMediaPropertiesRequest *)v17 .cxx_destruct];
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  v11 = [(HMDNotificationRegistryRequest *)&v19 initWithEnable:v6 userID:v8];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    accessoryUUID = v11->_accessoryUUID;
    v11->_accessoryUUID = (NSUUID *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    characteristicInstanceIDs = v11->_characteristicInstanceIDs;
    v11->_characteristicInstanceIDs = (NSMutableSet *)v14;
  }
  return v11;
}

@end