@interface HMDNotificationRegistryCharacteristicsRequest
- (HMDNotificationRegistryCharacteristicsRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 accessoryUUID:(id)a6;
- (NSMutableDictionary)characteristicChangeThresholds;
- (NSMutableSet)characteristicInstanceIDs;
- (NSUUID)accessoryUUID;
- (id)attributeDescriptions;
@end

@implementation HMDNotificationRegistryCharacteristicsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicChangeThresholds, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceIDs, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSMutableDictionary)characteristicChangeThresholds
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableSet)characteristicInstanceIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v19[3] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  v3 = [(HMDNotificationRegistryRequest *)&v18 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v17 = [(HMDNotificationRegistryCharacteristicsRequest *)self accessoryUUID];
  v5 = (void *)[v4 initWithName:@"Accessory UUID" value:v17];
  v19[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDNotificationRegistryCharacteristicsRequest *)self characteristicInstanceIDs];
  v8 = [v7 allObjects];
  v9 = [v8 componentsJoinedByString:@","];
  v10 = (void *)[v6 initWithName:@"Characteristic IIDs" value:v9];
  v19[1] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDNotificationRegistryCharacteristicsRequest *)self characteristicChangeThresholds];
  v13 = (void *)[v11 initWithName:@"Change Threshold" value:v12];
  v19[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  v15 = [v3 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (HMDNotificationRegistryCharacteristicsRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 accessoryUUID:(id)a6
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
    v22 = (HMDNotificationRegistryMediaPropertiesRequest *)_HMFPreconditionFailure();
    [(HMDNotificationRegistryMediaPropertiesRequest *)v22 .cxx_destruct];
    return result;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDNotificationRegistryCharacteristicsRequest;
  v14 = [(HMDNotificationRegistryRequest *)&v24 initWithEnable:v8 user:v10 deviceIdsDestination:v11];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    accessoryUUID = v14->_accessoryUUID;
    v14->_accessoryUUID = (NSUUID *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    characteristicInstanceIDs = v14->_characteristicInstanceIDs;
    v14->_characteristicInstanceIDs = (NSMutableSet *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    characteristicChangeThresholds = v14->_characteristicChangeThresholds;
    v14->_characteristicChangeThresholds = (NSMutableDictionary *)v19;
  }
  return v14;
}

@end