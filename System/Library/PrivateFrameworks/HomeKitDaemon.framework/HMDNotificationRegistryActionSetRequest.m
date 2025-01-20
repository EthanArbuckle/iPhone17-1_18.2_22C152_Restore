@interface HMDNotificationRegistryActionSetRequest
- (HMDNotificationRegistryActionSetRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 actionSetUUID:(id)a6;
- (NSUUID)actionSetUUID;
- (id)attributeDescriptions;
@end

@implementation HMDNotificationRegistryActionSetRequest

- (void).cxx_destruct
{
}

- (NSUUID)actionSetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HMDNotificationRegistryActionSetRequest;
  v3 = [(HMDNotificationRegistryRequest *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDNotificationRegistryActionSetRequest *)self actionSetUUID];
  v6 = (void *)[v4 initWithName:@"ActionSet UUID" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMDNotificationRegistryActionSetRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 actionSetUUID:(id)a6
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
    v18 = (HMDThreadAccessoryInfo *)_HMFPreconditionFailure();
    [(HMDThreadAccessoryInfo *)v18 .cxx_destruct];
    return result;
  }
  v20.receiver = self;
  v20.super_class = (Class)HMDNotificationRegistryActionSetRequest;
  v14 = [(HMDNotificationRegistryRequest *)&v20 initWithEnable:v8 user:v10 deviceIdsDestination:v11];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    actionSetUUID = v14->_actionSetUUID;
    v14->_actionSetUUID = (NSUUID *)v15;
  }
  return v14;
}

@end