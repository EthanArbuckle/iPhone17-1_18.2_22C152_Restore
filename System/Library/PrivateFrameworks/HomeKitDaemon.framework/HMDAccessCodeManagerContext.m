@interface HMDAccessCodeManagerContext
+ (id)logCategory;
- (BOOL)hasHomeOnboardedForAccessCodes;
- (BOOL)isCurrentDeviceOwnerController;
- (BOOL)isCurrentDeviceOwnerUser;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isCurrentDeviceResidentCapable;
- (BOOL)isCurrentDeviceWatch;
- (BOOL)isDemoDataMockerEnabled;
- (BOOL)isFeatureEnabled;
- (BOOL)isHomeAppForegrounded;
- (BOOL)isResidentSupported;
- (BOOL)primaryResidentSupportsAccessCodes;
- (HMDAccessCodeDemoDataMocker)demoDataMocker;
- (HMDAccessCodeManagerContext)initWithHome:(id)a3 workQueue:(id)a4;
- (HMDAccessCodeManagerContext)initWithHome:(id)a3 workQueue:(id)a4 UUID:(id)a5;
- (HMDBulletinBoard)bulletinBoard;
- (HMDDevice)residentCommunicationHandlerPreferredDevice;
- (HMDHome)home;
- (HMDHomeAdministratorHandler)administratorHandler;
- (HMDHomeWalletKeyManager)walletKeyManager;
- (HMDRemoteMessageForwarder)remoteMessageForwarder;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)UUIDsOfAccessoriesSupportingAccessCodes;
- (NSArray)UUIDsOfHAPAccessoriesSupportingAccessCodes;
- (NSArray)UUIDsOfMatterAccessoriesSupportingAccessCodes;
- (NSArray)accessoriesSupportingAccessCodes;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (double)accessoryReadWriteRetryTimeInterval;
- (double)dataCleanUpCheckTimerInterval;
- (double)removedUserAccessCodeTimeToLive;
- (double)residentDataSyncVerificationRetryTimeInterval;
- (id)_performMockedReadRequests:(id)a3;
- (id)_performMockedWriteRequests:(id)a3;
- (id)generateAccessCodeValueFromConstraints:(id)a3 accessoryAccessCodes:(id)a4 homeAccessCodes:(id)a5;
- (id)hapAccessoryWithUUID:(id)a3;
- (id)performReadRequests:(id)a3 withRetries:(int64_t)a4 timeInterval:(double)a5 loggingObject:(id)a6;
- (id)performWriteRequests:(id)a3 withRetries:(int64_t)a4 timeInterval:(double)a5 loggingObject:(id)a6;
- (id)userForMessage:(id)a3;
- (id)userWithUUID:(id)a3;
- (id)uuidsOfAccessoriesSupportingAccessCodesForUser:(id)a3;
- (int64_t)accessoryReadWriteRetries;
- (int64_t)residentDataSyncVerificationRetries;
- (void)configureWithMessageDispatcher:(id)a3;
- (void)redispatchToResidentMessage:(id)a3;
@end

@implementation HMDAccessCodeManagerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoDataMocker, 0);
  objc_storeStrong((id *)&self->_remoteMessageForwarder, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDAccessCodeDemoDataMocker)demoDataMocker
{
  return (HMDAccessCodeDemoDataMocker *)objc_getProperty(self, a2, 56, 1);
}

- (HMDRemoteMessageForwarder)remoteMessageForwarder
{
  return (HMDRemoteMessageForwarder *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)generateAccessCodeValueFromConstraints:(id)a3 accessoryAccessCodes:(id)a4 homeAccessCodes:(id)a5
{
  return (id)[MEMORY[0x263F0DEC0] generateAccessCodeValueFromConstraints:a3 accessoryAccessCodes:a4 homeAccessCodes:a5];
}

- (id)hapAccessoryWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessCodeManagerContext *)self home];
  v6 = [v5 hapAccessories];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__HMDAccessCodeManagerContext_hapAccessoryWithUUID___block_invoke;
  v10[3] = &unk_264A28A10;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __52__HMDAccessCodeManagerContext_hapAccessoryWithUUID___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 uuid];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

- (NSArray)UUIDsOfMatterAccessoriesSupportingAccessCodes
{
  v2 = [(HMDAccessCodeManagerContext *)self accessoriesSupportingAccessCodes];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_60);

  return (NSArray *)v3;
}

id __76__HMDAccessCodeManagerContext_UUIDsOfMatterAccessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsCHIP])
  {
    uint64_t v3 = [v2 uuid];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)UUIDsOfHAPAccessoriesSupportingAccessCodes
{
  id v2 = [(HMDAccessCodeManagerContext *)self accessoriesSupportingAccessCodes];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_58);

  return (NSArray *)v3;
}

id __73__HMDAccessCodeManagerContext_UUIDsOfHAPAccessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsCHIP])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 uuid];
  }

  return v3;
}

- (id)uuidsOfAccessoriesSupportingAccessCodesForUser:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessCodeManagerContext *)self home];
  v6 = [v5 hapAccessories];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__HMDAccessCodeManagerContext_uuidsOfAccessoriesSupportingAccessCodesForUser___block_invoke;
  v10[3] = &unk_264A14B40;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_map:", v10);

  return v8;
}

id __78__HMDAccessCodeManagerContext_uuidsOfAccessoriesSupportingAccessCodesForUser___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 supportsAccessCodesForUser:*(void *)(a1 + 32)])
  {
    id v4 = [v3 uuid];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)UUIDsOfAccessoriesSupportingAccessCodes
{
  id v2 = [(HMDAccessCodeManagerContext *)self accessoriesSupportingAccessCodes];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_56);

  return (NSArray *)v3;
}

uint64_t __70__HMDAccessCodeManagerContext_UUIDsOfAccessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (NSArray)accessoriesSupportingAccessCodes
{
  id v2 = [(HMDAccessCodeManagerContext *)self home];
  id v3 = [v2 hapAccessories];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_3705);

  return (NSArray *)v4;
}

uint64_t __63__HMDAccessCodeManagerContext_accessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCode];
}

- (id)userWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessCodeManagerContext *)self home];
  v6 = [v5 users];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__HMDAccessCodeManagerContext_userWithUUID___block_invoke;
  v10[3] = &unk_264A2DB60;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __44__HMDAccessCodeManagerContext_userWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uuid];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

- (id)userForMessage:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessCodeManagerContext *)self home];
  v6 = [v4 userForHome:v5];

  return v6;
}

- (void)redispatchToResidentMessage:(id)a3
{
  id v4 = a3;
  id v7 = [(HMDAccessCodeManagerContext *)self home];
  v5 = [(HMDAccessCodeManagerContext *)self UUID];
  v6 = [(HMDAccessCodeManagerContext *)self workQueue];
  [v7 redispatchToResidentMessage:v4 target:v5 responseQueue:v6];
}

- (id)_performMockedReadRequests:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessCodeManagerContext *)self demoDataMocker];
  v6 = [v5 handleReadRequests:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x263F58190] futureWithResult:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to mock data for write requests: %@", (uint8_t *)&v15, 0x16u);
    }
    v12 = (void *)MEMORY[0x263F58190];
    v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    id v7 = [v12 futureWithError:v13];
  }
  return v7;
}

- (id)performReadRequests:(id)a3 withRetries:(int64_t)a4 timeInterval:(double)a5 loggingObject:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if ([(HMDAccessCodeManagerContext *)self isDemoDataMockerEnabled])
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Demo Data Mocker is enabled, not reading from real accessory.", (uint8_t *)&v19, 0xCu);
    }
    v16 = [(HMDAccessCodeManagerContext *)v13 _performMockedReadRequests:v10];
  }
  else
  {
    __int16 v17 = [(HMDAccessCodeManagerContext *)self home];
    v16 = [v17 performReadRequests:v10 withRetries:a4 timeInterval:v11 loggingObject:a5];
  }
  return v16;
}

- (id)performWriteRequests:(id)a3 withRetries:(int64_t)a4 timeInterval:(double)a5 loggingObject:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if ([(HMDAccessCodeManagerContext *)self isDemoDataMockerEnabled])
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Demo Data Mocker is enabled, not writing to real accessory.", (uint8_t *)&v19, 0xCu);
    }
    v16 = [(HMDAccessCodeManagerContext *)v13 _performMockedWriteRequests:v10];
  }
  else
  {
    __int16 v17 = [(HMDAccessCodeManagerContext *)self home];
    v16 = [v17 performWriteRequests:v10 withRetries:a4 timeInterval:v11 loggingObject:a5];
  }
  return v16;
}

- (id)_performMockedWriteRequests:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessCodeManagerContext *)self demoDataMocker];
  v6 = [v5 handleWriteRequests:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x263F58190] futureWithResult:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to mock data for write requests: %@", (uint8_t *)&v15, 0x16u);
    }
    v12 = (void *)MEMORY[0x263F58190];
    v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    id v7 = [v12 futureWithError:v13];
  }
  return v7;
}

- (HMDDevice)residentCommunicationHandlerPreferredDevice
{
  id v2 = [(HMDAccessCodeManagerContext *)self home];
  uint64_t v3 = [v2 homeManager];
  id v4 = [v3 messageDispatcher];
  v5 = [v4 residentCommunicationHandlerForHome:v2];

  v6 = [v5 preferredDevice];

  return (HMDDevice *)v6;
}

- (BOOL)hasHomeOnboardedForAccessCodes
{
  id v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 hasOnboardedForAccessCode];

  return v3;
}

- (BOOL)isHomeAppForegrounded
{
  id v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 hasCharacteristicNotificationRegistrations];

  return v3;
}

- (BOOL)isResidentSupported
{
  id v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 isResidentSupported];

  return v3;
}

- (BOOL)isCurrentDeviceWatch
{
  return 0;
}

- (BOOL)isCurrentDeviceOwnerController
{
  BOOL v2 = [(HMDAccessCodeManagerContext *)self isCurrentDeviceOwnerUser];
  if (v2)
  {
    if (isiOSDevice())
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = isMac();
    }
  }
  return v2;
}

- (BOOL)isCurrentDeviceOwnerUser
{
  BOOL v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 currentUser];
  char v4 = [v3 isOwner];

  return v4;
}

- (BOOL)isCurrentDeviceResidentCapable
{
  BOOL v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 isResidentCapable];

  return v3;
}

- (double)residentDataSyncVerificationRetryTimeInterval
{
  BOOL v2 = [MEMORY[0x263F42608] sharedPreferences];
  char v3 = [v2 preferenceForKey:@"HMDAccessCodeManagerResidentDataSyncVerificationRetryTimeInterval"];
  char v4 = [v3 numberValue];
  double v5 = (double)[v4 integerValue];

  return v5;
}

- (int64_t)residentDataSyncVerificationRetries
{
  BOOL v2 = [MEMORY[0x263F42608] sharedPreferences];
  char v3 = [v2 preferenceForKey:@"HMDAccessCodeManagerResidentDataSyncVerificationRetries"];
  char v4 = [v3 numberValue];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (double)dataCleanUpCheckTimerInterval
{
  BOOL v2 = [MEMORY[0x263F42608] sharedPreferences];
  char v3 = [v2 preferenceForKey:@"HMDAccessCodeManagerDataCleanUpCheckTimerInterval"];
  char v4 = [v3 numberValue];
  double v5 = (double)[v4 integerValue];

  return v5;
}

- (double)removedUserAccessCodeTimeToLive
{
  BOOL v2 = [MEMORY[0x263F42608] sharedPreferences];
  char v3 = [v2 preferenceForKey:@"HMDAccessCodeManagerRemovedUserAccessCodeTimeToLive"];
  char v4 = [v3 numberValue];
  double v5 = (double)[v4 integerValue];

  return v5;
}

- (double)accessoryReadWriteRetryTimeInterval
{
  BOOL v2 = [MEMORY[0x263F42608] sharedPreferences];
  char v3 = [v2 preferenceForKey:@"HMDAccessCodeManagerAccessoryReadWriteRetryTimeIntervalHH2"];
  char v4 = [v3 numberValue];
  double v5 = (double)[v4 integerValue];

  return v5;
}

- (int64_t)accessoryReadWriteRetries
{
  BOOL v2 = [MEMORY[0x263F42608] sharedPreferences];
  char v3 = [v2 preferenceForKey:@"HMDAccessCodeManagerAccessoryReadWriteRetriesHH2"];
  char v4 = [v3 numberValue];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (BOOL)isDemoDataMockerEnabled
{
  BOOL v2 = [MEMORY[0x263F42608] sharedPreferences];
  char v3 = [v2 preferenceForKey:@"accessCodeDemoDataMockerEnabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)primaryResidentSupportsAccessCodes
{
  BOOL v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 residentDeviceManager];
  char v4 = [v3 primaryResidentDevice];
  int64_t v5 = [v4 capabilities];
  char v6 = [v5 supportsAccessCodes];

  return v6;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  BOOL v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 isCurrentDeviceConfirmedPrimaryResident];

  return v3;
}

- (HMDHomeAdministratorHandler)administratorHandler
{
  BOOL v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 administratorHandler];

  return (HMDHomeAdministratorHandler *)v3;
}

- (HMDHomeWalletKeyManager)walletKeyManager
{
  BOOL v2 = [(HMDAccessCodeManagerContext *)self home];
  char v3 = [v2 walletKeyManager];

  return (HMDHomeWalletKeyManager *)v3;
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)+[HMDBulletinBoard sharedBulletinBoard];
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

- (BOOL)isFeatureEnabled
{
  return 1;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_messageDispatcher, a3);
  id v5 = a3;
  id v6 = [(HMDAccessCodeManagerContext *)self remoteMessageForwarder];
  [v6 configureWithMessageDispatcher:v5];
}

- (HMDAccessCodeManagerContext)initWithHome:(id)a3 workQueue:(id)a4 UUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  id v11 = v10;
  if (!v10)
  {
LABEL_9:
    uint64_t v19 = (HMDAccessCodeManagerContext *)_HMFPreconditionFailure();
    return [(HMDAccessCodeManagerContext *)v19 initWithHome:v21 workQueue:v22];
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDAccessCodeManagerContext;
  v12 = [(HMDAccessCodeManagerContext *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_home, v8);
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v13->_UUID, a5);
    v14 = objc_alloc_init(HMDAccessCodeDemoDataMocker);
    demoDataMocker = v13->_demoDataMocker;
    v13->_demoDataMocker = v14;

    v16 = [[HMDRemoteMessageForwarder alloc] initWithHome:v8 UUID:v11 workQueue:v9];
    remoteMessageForwarder = v13->_remoteMessageForwarder;
    v13->_remoteMessageForwarder = v16;

    [MEMORY[0x263F42520] blessWithImplicitContext:v13->_workQueue];
  }

  return v13;
}

- (HMDAccessCodeManagerContext)initWithHome:(id)a3 workQueue:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0DEC0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 uuid];
  id v10 = [v6 accessCodeManagerUUIDFromHomeUUID:v9];

  id v11 = [(HMDAccessCodeManagerContext *)self initWithHome:v8 workQueue:v7 UUID:v10];
  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1) {
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_63_3753);
  }
  BOOL v2 = (void *)logCategory__hmf_once_v5;
  return v2;
}

void __42__HMDAccessCodeManagerContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5;
  logCategory__hmf_once_id v5 = v0;
}

@end