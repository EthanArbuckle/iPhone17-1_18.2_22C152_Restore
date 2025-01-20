@interface HMBCloudDatabaseConfiguration
- (BOOL)isManateeContainer;
- (CKContainerID)containerID;
- (CKOperationConfiguration)defaultOperationConfiguration;
- (HMBCloudDatabaseConfiguration)initWithContainerID:(id)a3;
- (NSString)sourceApplicationBundleIdentifier;
- (OS_dispatch_queue)operationQueue;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)subscriptionPushRegistrationAction;
- (void)setDefaultOperationConfiguration:(id)a3;
- (void)setManateeContainer:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setSubscriptionPushRegistrationAction:(int64_t)a3;
@end

@implementation HMBCloudDatabaseConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_defaultOperationConfiguration, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)operationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubscriptionPushRegistrationAction:(int64_t)a3
{
  self->_subscriptionPushRegistrationAction = a3;
}

- (int64_t)subscriptionPushRegistrationAction
{
  return self->_subscriptionPushRegistrationAction;
}

- (void)setDefaultOperationConfiguration:(id)a3
{
}

- (CKOperationConfiguration)defaultOperationConfiguration
{
  return (CKOperationConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManateeContainer:(BOOL)a3
{
  self->_manateeContainer = a3;
}

- (BOOL)isManateeContainer
{
  return self->_manateeContainer;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSString)sourceApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CKContainerID)containerID
{
  return (CKContainerID *)objc_getProperty(self, a2, 16, 1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HMBMutableCloudDatabaseConfiguration alloc];
  v5 = [(HMBCloudDatabaseConfiguration *)self containerID];
  v6 = [(HMBCloudDatabaseConfiguration *)v4 initWithContainerID:v5];

  v7 = [(HMBCloudDatabaseConfiguration *)self sourceApplicationBundleIdentifier];
  [(HMBCloudDatabaseConfiguration *)v6 setSourceApplicationBundleIdentifier:v7];

  [(HMBCloudDatabaseConfiguration *)v6 setManateeContainer:[(HMBCloudDatabaseConfiguration *)self isManateeContainer]];
  v8 = [(HMBCloudDatabaseConfiguration *)self defaultOperationConfiguration];
  [(HMBCloudDatabaseConfiguration *)v6 setDefaultOperationConfiguration:v8];

  [(HMBCloudDatabaseConfiguration *)v6 setSubscriptionPushRegistrationAction:[(HMBCloudDatabaseConfiguration *)self subscriptionPushRegistrationAction]];
  v9 = [(HMBCloudDatabaseConfiguration *)self operationQueue];
  [(HMBCloudDatabaseConfiguration *)v6 setOperationQueue:v9];

  return v6;
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMBCloudDatabaseConfiguration *)self containerID];
  v21 = (void *)[v3 initWithName:@"Container ID" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMBCloudDatabaseConfiguration *)self sourceApplicationBundleIdentifier];
  v5 = (void *)[v4 initWithName:@"Bundle ID" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMBCloudDatabaseConfiguration *)self isManateeContainer];
  v7 = HMFBooleanToString();
  v8 = (void *)[v6 initWithName:@"Manatee Container" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMBCloudDatabaseConfiguration *)self defaultOperationConfiguration];
  v11 = (void *)[v9 initWithName:@"Default Operation Configuration" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HMBCloudDatabaseConfiguration subscriptionPushRegistrationAction](self, "subscriptionPushRegistrationAction"));
  v14 = (void *)[v12 initWithName:@"Subscription Push Registration Action" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  v16 = [(HMBCloudDatabaseConfiguration *)self operationQueue];
  v17 = (void *)[v15 initWithName:@"Operations Queue" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];

  return v18;
}

- (HMBCloudDatabaseConfiguration)initWithContainerID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)HMBCloudDatabaseConfiguration;
    id v6 = [(HMBCloudDatabaseConfiguration *)&v17 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      containerID = v6->_containerID;
      v6->_containerID = (CKContainerID *)v7;

      sourceApplicationBundleIdentifier = v6->_sourceApplicationBundleIdentifier;
      v6->_sourceApplicationBundleIdentifier = (NSString *)@"com.apple.willowd";

      v6->_subscriptionPushRegistrationAction = 0;
      uint64_t v10 = dispatch_get_global_queue(21, 0);
      operationQueue = v6->_operationQueue;
      v6->_operationQueue = (OS_dispatch_queue *)v10;

      id v12 = (CKOperationConfiguration *)objc_alloc_init(MEMORY[0x1E4F1A208]);
      defaultOperationConfiguration = v6->_defaultOperationConfiguration;
      v6->_defaultOperationConfiguration = v12;

      [(CKOperationConfiguration *)v6->_defaultOperationConfiguration setQualityOfService:17];
    }

    return v6;
  }
  else
  {
    id v15 = (HMBProcessingModelResult *)_HMFPreconditionFailure();
    [(HMBProcessingModelResult *)v15 .cxx_destruct];
  }
  return result;
}

@end