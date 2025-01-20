@interface HMDNotificationRegistryRequest
- (BOOL)enable;
- (HMDNotificationRegistryRequest)initWithEnable:(BOOL)a3 userID:(id)a4;
- (NSString)userID;
- (id)attributeDescriptions;
- (int64_t)retryCount;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation HMDNotificationRegistryRequest

- (void).cxx_destruct
{
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)enable
{
  return self->_enable;
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDNotificationRegistryRequest *)self enable];
  v5 = HMFBooleanToString();
  v6 = (void *)[v4 initWithName:@"Enable" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDNotificationRegistryRequest *)self userID];
  v9 = (void *)[v7 initWithName:@"User ID" value:v8];
  [v3 addObject:v9];

  if ([(HMDNotificationRegistryRequest *)self retryCount] >= 1)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNotificationRegistryRequest retryCount](self, "retryCount"));
    v12 = (void *)[v10 initWithName:@"Retry Count" value:v11];
    [v3 addObject:v12];
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (HMDNotificationRegistryRequest)initWithEnable:(BOOL)a3 userID:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNotificationRegistryRequest;
  id v7 = [(HMDNotificationRegistryRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_enable = a3;
    uint64_t v9 = [v6 copy];
    userID = v8->_userID;
    v8->_userID = (NSString *)v9;
  }
  return v8;
}

@end