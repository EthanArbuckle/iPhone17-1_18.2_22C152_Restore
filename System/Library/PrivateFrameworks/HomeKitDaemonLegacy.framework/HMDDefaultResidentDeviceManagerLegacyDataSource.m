@interface HMDDefaultResidentDeviceManagerLegacyDataSource
- (BOOL)isResidentCapable;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDDefaultResidentDeviceManagerLegacyDataSource)init;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)queue;
- (id)createElectionAddOnWithContext:(id)a3;
- (id)createInitialReachabilityManagerWithUUID:(id)a3;
- (id)createResidentDeviceWithModel:(id)a3;
- (id)logIdentifierForHome:(id)a3;
@end

@implementation HMDDefaultResidentDeviceManagerLegacyDataSource

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)createInitialReachabilityManagerWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomePrimaryResidentInitialReachabilityManager alloc];
  v6 = [(HMDDefaultResidentDeviceManagerLegacyDataSource *)self queue];
  v7 = [(HMDHomePrimaryResidentInitialReachabilityManager *)v5 initWithUUID:v4 workQueue:v6];

  return v7;
}

- (id)createResidentDeviceWithModel:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDResidentDevice alloc] initWithModel:v3];

  return v4;
}

- (id)logIdentifierForHome:(id)a3
{
  id v3 = [a3 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)createElectionAddOnWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDPrimaryElectionCoordinationAddOn alloc] initWithContext:v3];

  return v4;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return +[HMDAppleAccountManager sharedManager];
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x1E4F28EB8] defaultCenter];
}

- (BOOL)isResidentCapable
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 isResidentCapable];

  return v3;
}

- (HMDDefaultResidentDeviceManagerLegacyDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDDefaultResidentDeviceManagerLegacyDataSource;
  v2 = [(HMDDefaultResidentDeviceManagerLegacyDataSource *)&v7 init];
  if (v2)
  {
    char v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("HMDResidentDeviceManagerLegacy", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

@end