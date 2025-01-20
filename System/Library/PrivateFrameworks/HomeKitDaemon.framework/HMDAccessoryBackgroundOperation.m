@interface HMDAccessoryBackgroundOperation
+ (id)logCategory;
+ (id)predicate;
- (BOOL)isAccessoryOperation;
- (HMDAccessoryBackgroundOperation)initWithAccessory:(id)a3 userData:(id)a4;
- (HMDAccessoryBackgroundOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5 userData:(id)a6;
- (NSString)accessoryIdentifier;
- (NSUUID)accessoryUUID;
- (NSUUID)homeUUID;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (unint64_t)accessoryOperationStatus;
@end

@implementation HMDAccessoryBackgroundOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v17[3] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryBackgroundOperation;
  v3 = [(HMDBackgroundOperation *)&v16 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  v6 = (void *)[v4 initWithName:@"accessoryUUID" value:v5];
  v17[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDAccessoryBackgroundOperation *)self accessoryIdentifier];
  v9 = (void *)[v7 initWithName:@"accessoryIdentifier" value:v8];
  v17[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDAccessoryBackgroundOperation *)self homeUUID];
  v12 = (void *)[v10 initWithName:@"homeUUID" value:v11];
  v17[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v14 = [v3 arrayByAddingObjectsFromArray:v13];

  return v14;
}

- (NSUUID)homeUUID
{
  v2 = [(HMDBackgroundOperation *)self userData];
  v3 = [v2 objectForKeyedSubscript:@"homeUUID"];

  if (v3)
  {
    return (NSUUID *)v3;
  }
  else
  {
    v5 = (HMDAccessoryBackgroundOperation *)_HMFPreconditionFailure();
    return (NSUUID *)[(HMDAccessoryBackgroundOperation *)v5 accessoryIdentifier];
  }
}

- (NSString)accessoryIdentifier
{
  v2 = [(HMDBackgroundOperation *)self userData];
  v3 = [v2 objectForKeyedSubscript:@"accessoryIdentifier"];

  if (v3)
  {
    return (NSString *)v3;
  }
  else
  {
    v5 = (HMDAccessoryBackgroundOperation *)_HMFPreconditionFailure();
    return (NSString *)[(HMDAccessoryBackgroundOperation *)v5 accessoryUUID];
  }
}

- (NSUUID)accessoryUUID
{
  v2 = [(HMDBackgroundOperation *)self userData];
  v3 = [v2 objectForKeyedSubscript:@"accessoryUUIDWhenPaired"];

  if (v3)
  {
    return (NSUUID *)v3;
  }
  else
  {
    v5 = (HMDAccessoryBackgroundOperation *)_HMFPreconditionFailure();
    return (NSUUID *)[(HMDAccessoryBackgroundOperation *)v5 isAccessoryOperation];
  }
}

- (BOOL)isAccessoryOperation
{
  return 1;
}

- (unint64_t)accessoryOperationStatus
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = [(HMDAccessoryBackgroundOperation *)self accessoryIdentifier];
  v5 = [(HMDBackgroundOperation *)self userData];
  SEL v6 = [v5 objectForKeyedSubscript:@"homeUUID"];

  id v7 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  v8 = objc_opt_class();
  v9 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  id v10 = [(HMDBackgroundOperation *)self homeManager];
  v11 = [v8 findAccessoryUsing:v9 homeManager:v10];

  id v12 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  id v15 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v16 = v15;
  }
  else {
    objc_super v16 = 0;
  }
  id v17 = v16;

  id v18 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (!v20 && !v14 && !v17) {
    goto LABEL_13;
  }
  if (v14)
  {
    v31 = [v14 publicKey];
    if (!v31)
    {
LABEL_13:
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = v6;
        id v50 = v17;
        v25 = v24 = v4;
        [v18 shortDescription];
        id v26 = v20;
        id v27 = v14;
        v29 = v28 = v7;
        *(_DWORD *)buf = 138543618;
        v53 = v25;
        __int16 v54 = 2112;
        v55 = v29;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@We will need a valid instance of HAP/AirPlay/Matter : [%@]", buf, 0x16u);

        id v7 = v28;
        id v14 = v27;
        id v20 = v26;

        id v4 = v24;
        SEL v6 = v48;
        id v17 = v50;
      }

      unint64_t v30 = 0;
      goto LABEL_31;
    }
    v2 = v31;
    if (!v20)
    {

      goto LABEL_24;
    }
  }
  else if (!v20)
  {
    goto LABEL_24;
  }
  v32 = [v20 publicKey];

  if (v14) {
  if (!v32)
  }
    goto LABEL_13;
LABEL_24:
  id v47 = v20;
  v49 = v4;
  id v51 = v17;
  v33 = v7;
  v34 = [v18 home];
  v35 = [v34 uuid];
  int v36 = HMFEqualObjects();

  if (v36
    && ([v18 uuid],
        v37 = objc_claimAutoreleasedReturnValue(),
        char v38 = HMFEqualObjects(),
        v37,
        (v38 & 1) != 0))
  {
    unint64_t v30 = 2;
  }
  else
  {
    v39 = (void *)MEMORY[0x230FBD990]();
    v40 = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = HMFGetLogIdentifier();
      v43 = [v34 uuid];
      [v18 uuid];
      v44 = v46 = v39;
      *(_DWORD *)buf = 138544642;
      v53 = v42;
      __int16 v54 = 2112;
      v55 = v49;
      __int16 v56 = 2112;
      v57 = v6;
      __int16 v58 = 2112;
      v59 = v33;
      __int16 v60 = 2112;
      v61 = v43;
      __int16 v62 = 2112;
      v63 = v44;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Cannot execute accessory operation as the home or accessory UUIDs are different. Expected : [home: %@, accessory: %@], Got : [home: %@, accessory: %@]", buf, 0x3Eu);

      v39 = v46;
    }

    unint64_t v30 = 1;
  }
  id v4 = v49;
  id v7 = v33;

  id v17 = v51;
  id v20 = v47;
LABEL_31:

  return v30;
}

- (HMDAccessoryBackgroundOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5 userData:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v10)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v11)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  id v14 = v13;
  id v15 = [v13 objectForKeyedSubscript:@"accessoryIdentifier"];

  if (v15)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  objc_super v16 = [v14 objectForKeyedSubscript:@"homeUUID"];

  if (v16)
  {
LABEL_17:
    _HMFPreconditionFailure();
LABEL_18:
    _HMFPreconditionFailure();
  }
  id v17 = [v14 objectForKeyedSubscript:@"accessoryUUIDWhenPaired"];

  if (v17) {
    goto LABEL_18;
  }
  if (v12)
  {
    id v18 = (void *)[v14 mutableCopy];
    [v18 setObject:v11 forKeyedSubscript:@"accessoryIdentifier"];
    [v18 setObject:v12 forKeyedSubscript:@"homeUUID"];
    [v18 setObject:v10 forKeyedSubscript:@"accessoryUUIDWhenPaired"];
    v19 = (void *)[v18 copy];
    v26.receiver = self;
    v26.super_class = (Class)HMDAccessoryBackgroundOperation;
    id v20 = [(HMDBackgroundOperation *)&v26 initWithUserData:v19];

    v21 = v20;
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v28 = v24;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create background operation for accessory: %@/%@", buf, 0x20u);
    }
    v21 = 0;
  }

  return v21;
}

- (HMDAccessoryBackgroundOperation)initWithAccessory:(id)a3 userData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = v7;
    v9 = [v6 uuid];
    id v10 = [v6 identifier];
    id v11 = [v6 home];
    id v12 = [v11 uuid];
    id v13 = [(HMDAccessoryBackgroundOperation *)self initWithAccessoryUUID:v9 accessoryIdentifier:v10 homeUUIDWhereAccessoryWasPaired:v12 userData:v8];

    return v13;
  }
  else
  {
    id v15 = (void *)_HMFPreconditionFailure();
    return (HMDAccessoryBackgroundOperation *)+[HMDAccessoryBackgroundOperation logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_238138 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_238138, &__block_literal_global_238139);
  }
  v2 = (void *)logCategory__hmf_once_v7_238140;
  return v2;
}

void __46__HMDAccessoryBackgroundOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_238140;
  logCategory__hmf_once_v7_238140 = v0;
}

+ (id)predicate
{
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = +[HMDBackgroundOperationAccessoryManagerDataSource name];
  id v4 = objc_msgSend(v2, "predicateWithFormat:", @"%K.%K contains %K.%K", v3, @"visibleAccessories", @"userData", @"accessoryUUIDWhenPaired");

  return v4;
}

@end