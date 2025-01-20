@interface HMDAppleAccessoryPairingControllerDataSource
- (HAPPairingIdentity)hh1ControllerIdentity;
- (HMDAppleAccessoryPairingControllerDataSource)initWithContext:(id)a3;
- (HMDBulletinBoard)bulletinBoard;
- (NSArray)inProgressPairingAccessories;
- (NSNotificationCenter)notificationCenter;
- (id)deviceForIdentifier:(id)a3;
- (id)timerWithInterval:(double)a3 options:(unint64_t)a4;
- (void)deletePairingAccessoryState:(id)a3;
- (void)updatePairingAccessoryState:(id)a3;
@end

@implementation HMDAppleAccessoryPairingControllerDataSource

- (id)deviceForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[HMDAccountRegistry sharedRegistry];
  v5 = [v4 deviceForIdentifier:v3];

  return v5;
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)+[HMDBulletinBoard sharedBulletinBoard];
}

- (void)deletePairingAccessoryState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__HMDAppleAccessoryPairingControllerDataSource_deletePairingAccessoryState___block_invoke;
  v6[3] = &unk_264A255E0;
  id v7 = v4;
  id v5 = v4;
  [(HMCContextProvider *)self unsafeSynchronousBlock:v6];
}

void __76__HMDAppleAccessoryPairingControllerDataSource_deletePairingAccessoryState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 homeManager];
  id v4 = [v3 homeManager];
  id v5 = [v4 pairingAppleAccessories];
  v6 = (void *)[v5 mutableCopy];

  __removeHomeState(v6, *(void **)(a1 + 32));
  [v7 setPairingAppleAccessories:v6];
  [v3 save];
}

- (void)updatePairingAccessoryState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__HMDAppleAccessoryPairingControllerDataSource_updatePairingAccessoryState___block_invoke;
  v6[3] = &unk_264A255E0;
  id v7 = v4;
  id v5 = v4;
  [(HMCContextProvider *)self unsafeSynchronousBlock:v6];
}

void __76__HMDAppleAccessoryPairingControllerDataSource_updatePairingAccessoryState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = [v3 homeManager];
  id v4 = [v11 pairingAppleAccessories];
  id v5 = (void *)[v4 mutableCopy];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
  }
  v8 = v7;

  v9 = [*(id *)(a1 + 32) accessory];
  v10 = [v9 uuid];
  __removeHomeState(v8, v10);

  [v8 addObject:*(void *)(a1 + 32)];
  [v11 setPairingAppleAccessories:v8];
  [v3 save];
}

- (id)timerWithInterval:(double)a3 options:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:12 options:a3];
  return v4;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

- (HAPPairingIdentity)hh1ControllerIdentity
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F35AD0] systemStore];
  id v11 = 0;
  id v4 = [v3 getOrCreateLocalPairingIdentity:&v11];
  id v5 = v11;

  if (!v4)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get controller identity for pairing controller: %@", buf, 0x16u);
    }
  }

  return (HAPPairingIdentity *)v4;
}

- (NSArray)inProgressPairingAccessories
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__193455;
  v9 = __Block_byref_object_dispose__193456;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__HMDAppleAccessoryPairingControllerDataSource_inProgressPairingAccessories__block_invoke;
  v4[3] = &unk_264A255B8;
  v4[4] = &v5;
  [(HMCContextProvider *)self unsafeSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __76__HMDAppleAccessoryPairingControllerDataSource_inProgressPairingAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 homeManager];
  uint64_t v3 = [v6 pairingAppleAccessories];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (HMDAppleAccessoryPairingControllerDataSource)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDAppleAccessoryPairingControllerDataSource;
  return [(HMCContextProvider *)&v4 initWithContext:a3];
}

@end