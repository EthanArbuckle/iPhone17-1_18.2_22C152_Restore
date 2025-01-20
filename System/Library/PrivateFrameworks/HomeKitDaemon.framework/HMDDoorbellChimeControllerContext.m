@interface HMDDoorbellChimeControllerContext
- (BOOL)accessorySupportsCoordinationFreeDoorbellChime:(id)a3;
- (BOOL)isCurrentDevicePrimaryResident;
- (HMDCharacteristicsAvailabilityListener)listener;
- (HMDDoorbellBulletinUtilities)doorbellBulletinUtilities;
- (HMDDoorbellChimeControllerContext)initWithWorkQueue:(id)a3 accessory:(id)a4;
- (HMDHAPAccessory)accessory;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)currentAccessoryUUID;
- (OS_dispatch_queue)workQueue;
- (double)doorbellChimeMaximumAnnounceDelay;
- (id)fetchDoorbellDelay;
- (void)setAccessory:(id)a3;
@end

@implementation HMDDoorbellChimeControllerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doorbellBulletinUtilities, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (HMDDoorbellBulletinUtilities)doorbellBulletinUtilities
{
  return (HMDDoorbellBulletinUtilities *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCharacteristicsAvailabilityListener)listener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (BOOL)accessorySupportsCoordinationFreeDoorbellChime:(id)a3
{
  return [a3 supportsCoordinationFreeDoorbellChime];
}

- (NSUUID)currentAccessoryUUID
{
  v2 = [(HMDDoorbellChimeControllerContext *)self accessory];
  v3 = [v2 home];
  v4 = [v3 accessories];
  v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_146_141985);
  v6 = [v5 uuid];

  return (NSUUID *)v6;
}

uint64_t __57__HMDDoorbellChimeControllerContext_currentAccessoryUUID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentAccessory];
}

- (id)fetchDoorbellDelay
{
  return (id)[MEMORY[0x263F58190] futureWithResult:&unk_26E471D40];
}

- (double)doorbellChimeMaximumAnnounceDelay
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"doorbellChimeMaximumAnnounceDelay"];
  v4 = [v3 numberValue];

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  v2 = [(HMDDoorbellChimeControllerContext *)self accessory];
  v3 = [v2 home];
  char v4 = [v3 isCurrentDeviceConfirmedPrimaryResident];

  return v4;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return +[HMDMetricsManager sharedLogEventSubmitter];
}

- (HMDDoorbellChimeControllerContext)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v7) {
    goto LABEL_7;
  }
  v9 = v8;
  v19.receiver = self;
  v19.super_class = (Class)HMDDoorbellChimeControllerContext;
  v10 = [(HMDDoorbellChimeControllerContext *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_accessory, v9);
    objc_storeStrong((id *)&v11->_workQueue, a3);
    v12 = objc_alloc_init(HMDDoorbellBulletinUtilities);
    doorbellBulletinUtilities = v11->_doorbellBulletinUtilities;
    v11->_doorbellBulletinUtilities = v12;

    uint64_t v20 = *MEMORY[0x263F0D6C0];
    v14 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0C208]];
    v21[0] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

    v16 = [[HMDCharacteristicsAvailabilityListener alloc] initWithAccessory:v9 workQueue:v7 interestedCharacteristicTypesByServiceType:v15];
    listener = v11->_listener;
    v11->_listener = v16;
  }
  return v11;
}

@end