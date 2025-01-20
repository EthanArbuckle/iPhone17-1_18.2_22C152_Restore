@interface HMDDonationHandler
+ (id)logCategory;
+ (id)sharedDonationHandler;
- (HMDDonationHandler)init;
- (OS_dispatch_queue)workQueue;
- (id)_init;
- (void)_donateActionSet:(id)a3 withMessage:(id)a4;
- (void)_donateIntent:(id)a3 withActionSet:(id)a4;
- (void)_removeIntentForActionSet:(id)a3;
- (void)donateActionSet:(id)a3 withMessage:(id)a4;
- (void)removeIntentForActionSet:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDDonationHandler

- (void).cxx_destruct
{
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_removeIntentForActionSet:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 uuid];
  v6 = +[HMDHomeManager deriveIntentGroupIdentifierFromBaseUUID:v5];

  BOOL v7 = isWatch();
  v8 = (id *)MEMORY[0x263F0D238];
  if (!v7) {
    v8 = (id *)MEMORY[0x263F0C7A8];
  }
  v9 = (void *)MEMORY[0x263F02AD8];
  id v10 = *v8;
  v11 = [v9 defaultSearchableIndex];
  v12 = [v6 UUIDString];
  v17[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__HMDDonationHandler__removeIntentForActionSet___block_invoke;
  v15[3] = &unk_264A2F370;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v11 deleteInteractionsWithGroupIdentifiers:v13 bundleID:v10 protectionClass:0 completionHandler:v15];
}

void __48__HMDDonationHandler__removeIntentForActionSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  BOOL v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [*(id *)(a1 + 40) name];
      id v10 = [*(id *)(a1 + 40) home];
      v11 = [v10 name];
      int v16 = 138544130;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2112;
      id v23 = v3;
      v12 = "%{public}@Failed to remove intents for Action Set \"%@\" in Home \"%@\" with error - %@";
      v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 42;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [*(id *)(a1 + 40) name];
    id v10 = [*(id *)(a1 + 40) home];
    v11 = [v10 name];
    int v16 = 138543874;
    v17 = v8;
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    v21 = v11;
    v12 = "%{public}@Successfully remove home intent(s) for Action Set \"%@\" in Home \"%@\" to Siri Actions";
    v13 = v7;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 32;
    goto LABEL_6;
  }
}

- (void)_donateIntent:(id)a3 withActionSet:(id)a4
{
  id v6 = a3;
  BOOL v7 = (objc_class *)MEMORY[0x263F0FBD8];
  id v8 = a4;
  v9 = (void *)[[v7 alloc] initWithIntent:v6 response:0];
  id v10 = [v8 uuid];

  v11 = +[HMDHomeManager deriveIntentGroupIdentifierFromBaseUUID:v10];

  v12 = [v11 UUIDString];
  [v9 setGroupIdentifier:v12];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__HMDDonationHandler__donateIntent_withActionSet___block_invoke;
  v14[3] = &unk_264A2F370;
  id v15 = v6;
  int v16 = self;
  id v13 = v6;
  [v9 donateInteractionWithCompletion:v14];
}

void __50__HMDDonationHandler__donateIntent_withActionSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) contents];
  id v5 = [v4 firstObject];

  id v6 = [v5 filter];
  BOOL v7 = [v6 scene];

  id v8 = [v5 filter];
  v9 = [v8 home];

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v14 = HMFGetLogIdentifier();
      int v17 = 138544130;
      __int16 v18 = v14;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      __int16 v21 = 2112;
      __int16 v22 = v9;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to donate home intent of Action Set \"%@\" in Home \"%@\" with error - %@", (uint8_t *)&v17, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    int v16 = *(void **)(a1 + 32);
    int v17 = 138544130;
    __int16 v18 = v15;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully donate home intent(s) of Action Set \"%@\" in Home \"%@\" to Siri Actions - intent: %@", (uint8_t *)&v17, 0x2Au);
  }
}

- (void)_donateActionSet:(id)a3 withMessage:(id)a4
{
  v68[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 actions];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    uint64_t v42 = MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      v46 = [v6 name];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v45;
      __int16 v63 = 2112;
      v64 = v46;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@There is no action in Action Set: %@", buf, 0x16u);

LABEL_14:
    }
LABEL_15:

    v47 = (void *)v42;
LABEL_16:
    goto LABEL_17;
  }
  if (!+[HMDDeviceCapabilities supportsIntentDonation])
  {
    uint64_t v42 = MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v45;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@HomePod is not eligible for intent donation", buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  unint64_t v10 = [v7 source];
  id v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  id v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10 != 5)
  {
    if (v14)
    {
      v48 = HMFGetLogIdentifier();
      if (v10 > 9) {
        v49 = @"Unknown";
      }
      else {
        v49 = off_264A1BC48[v10];
      }
      v57 = v49;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v48;
      __int16 v63 = 2112;
      v64 = v57;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@The trigger source \"%@\" is not supported for donation in HomeKit. HomeKit intent donation only supports First Party App.", buf, 0x16u);
    }
    v47 = v11;
    goto LABEL_16;
  }
  if (v14)
  {
    id v15 = HMFGetLogIdentifier();
    int v16 = @"FirstParty";
    int v17 = [v7 clientIdentifier];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v15;
    __int16 v63 = 2112;
    v64 = @"FirstParty";
    __int16 v65 = 2112;
    v66 = v17;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@The trigger source is: \"%@\" (bundleID: %@)", buf, 0x20u);
  }
  id v60 = v7;

  id v18 = v6;
  __int16 v19 = [v18 spiClientIdentifier];
  v58 = [v18 home];
  v59 = [v58 spiClientIdentifier];
  id v20 = objc_alloc(MEMORY[0x263F0FFA0]);
  v61 = v12;
  __int16 v21 = v19;
  __int16 v22 = [v19 UUIDString];
  __int16 v23 = [v18 name];

  id v24 = (void *)[v20 initWithIdentifier:v22 string:v23];
  id v25 = objc_alloc(MEMORY[0x263F0FFA0]);
  v26 = [v59 UUIDString];
  v27 = [v58 name];
  v28 = (void *)[v25 initWithIdentifier:v26 string:v27];

  id v29 = objc_alloc(MEMORY[0x263F0FB70]);
  v30 = [v21 UUIDString];
  *(void *)buf = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
  v32 = (void *)[v29 initWithEntityIdentifiers:v31 home:v28 scene:v24 homeZone:0 group:0 room:0 accessory:0 service:0 entityType:5 serviceType:0 subServiceType:0];

  v33 = (void *)[objc_alloc(MEMORY[0x263F0FB60]) initWithType:1 BOOLValue:1];
  id v34 = objc_alloc(MEMORY[0x263F0FB68]);
  v68[0] = v33;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:1];
  v36 = (void *)[v34 initWithFilter:v32 actions:v35];

  id v37 = objc_alloc(MEMORY[0x263F0FA10]);
  v67 = v36;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
  v39 = (void *)[v37 initWithContents:v38];

  BOOL v40 = isWatch();
  v41 = (void *)MEMORY[0x263F0D238];
  if (!v40) {
    v41 = (void *)MEMORY[0x263F0C7A8];
  }
  [v39 _setLaunchId:*v41];
  [v39 _setExtensionBundleId:@"com.apple.HomeKit.HomeKitIntentExtension"];

  if (v39)
  {
    [(HMDDonationHandler *)v61 _donateIntent:v39 withActionSet:v18];
  }
  else
  {
    v50 = (void *)MEMORY[0x230FBD990]();
    v51 = v61;
    v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = HMFGetLogIdentifier();
      v54 = [v18 name];
      v55 = [v18 home];
      v56 = [v55 name];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v53;
      __int16 v63 = 2112;
      v64 = v54;
      __int16 v65 = 2112;
      v66 = v56;
      _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the intent of Action Set \"%@\" in Home \"%@\"", buf, 0x20u);
    }
  }

  id v7 = v60;
LABEL_17:
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDDonationHandler;
  v2 = [(HMDDonationHandler *)&v8 init];
  if (v2)
  {
    id v3 = (const char *)HMFDispatchQueueName();
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create(v3, v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)removeIntentForActionSet:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(HMDDonationHandler *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDDonationHandler_removeIntentForActionSet___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__HMDDonationHandler_removeIntentForActionSet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeIntentForActionSet:*(void *)(a1 + 40)];
}

- (void)donateActionSet:(id)a3 withMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDDonationHandler *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HMDDonationHandler_donateActionSet_withMessage___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __50__HMDDonationHandler_donateActionSet_withMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _donateActionSet:*(void *)(a1 + 40) withMessage:*(void *)(a1 + 48)];
}

- (HMDDonationHandler)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  dispatch_queue_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_210720 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_210720, &__block_literal_global_17_210721);
  }
  v2 = (void *)logCategory__hmf_once_v10_210722;
  return v2;
}

void __33__HMDDonationHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_210722;
  logCategory__hmf_once_v10_210722 = v0;
}

+ (id)sharedDonationHandler
{
  if (sharedDonationHandler_onceToken != -1) {
    dispatch_once(&sharedDonationHandler_onceToken, &__block_literal_global_210727);
  }
  v2 = (void *)sharedDonationHandler_donationHandler;
  return v2;
}

void __43__HMDDonationHandler_sharedDonationHandler__block_invoke()
{
  id v0 = [[HMDDonationHandler alloc] _init];
  v1 = (void *)sharedDonationHandler_donationHandler;
  sharedDonationHandler_donationHandler = (uint64_t)v0;
}

@end