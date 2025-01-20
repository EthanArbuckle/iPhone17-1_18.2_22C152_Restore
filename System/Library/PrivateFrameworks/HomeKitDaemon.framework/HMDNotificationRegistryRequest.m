@interface HMDNotificationRegistryRequest
- (BOOL)enable;
- (HMDNotificationRegistryRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5;
- (HMDUser)user;
- (NSString)deviceIdsDestination;
- (id)attributeDescriptions;
- (int64_t)retryCount;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation HMDNotificationRegistryRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_deviceIdsDestination, 0);
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (HMDUser)user
{
  return (HMDUser *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)deviceIdsDestination
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)enable
{
  return self->_enable;
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDNotificationRegistryRequest *)self enable];
  v5 = HMFBooleanToString();
  v6 = (void *)[v4 initWithName:@"Enable" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDNotificationRegistryRequest *)self user];
  v9 = [v8 shortDescription];
  v10 = (void *)[v7 initWithName:@"User" value:v9];
  [v3 addObject:v10];

  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDNotificationRegistryRequest *)self deviceIdsDestination];
  v13 = (void *)[v11 initWithName:@"Device IDS Destination" value:v12];
  [v3 addObject:v13];

  if ([(HMDNotificationRegistryRequest *)self retryCount] >= 1)
  {
    id v14 = objc_alloc(MEMORY[0x263F424F8]);
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNotificationRegistryRequest retryCount](self, "retryCount"));
    v16 = (void *)[v14 initWithName:@"Retry Count" value:v15];
    [v3 addObject:v16];
  }
  v17 = (void *)[v3 copy];

  return v17;
}

- (HMDNotificationRegistryRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDNotificationRegistryRequest;
  id v11 = [(HMDNotificationRegistryRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_enable = a3;
    objc_storeStrong((id *)&v11->_user, a4);
    uint64_t v13 = [v10 copy];
    deviceIdsDestination = v12->_deviceIdsDestination;
    v12->_deviceIdsDestination = (NSString *)v13;
  }
  return v12;
}

@end