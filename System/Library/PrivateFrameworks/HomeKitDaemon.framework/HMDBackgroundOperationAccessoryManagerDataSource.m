@interface HMDBackgroundOperationAccessoryManagerDataSource
+ (id)name;
- (HMDBackgroundOperationAccessoryManagerDataSource)initWithOperationManager:(id)a3 notificationCenter:(id)a4;
- (id)values;
- (void)_handleAccessoryIsReachable:(id)a3;
- (void)dealloc;
@end

@implementation HMDBackgroundOperationAccessoryManagerDataSource

- (void)_handleAccessoryIsReachable:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v7 shortDescription];
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory became reachable: %@.", (uint8_t *)&v13, 0x16u);
  }
  [(HMDBackgroundOperationManagerDataSource *)v9 notifyDataSourceChanged];
}

- (id)values
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = [(HMDBackgroundOperationManagerDataSource *)self owner];
  v3 = [v2 homeManager];
  id v4 = [v3 pairedAccessories];

  v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __58__HMDBackgroundOperationAccessoryManagerDataSource_values__block_invoke;
  v12 = &unk_264A21538;
  id v13 = v5;
  id v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);
  v14 = @"visibleAccessories";
  v15[0] = v6;
  id v7 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, v9, v10, v11, v12);

  return v7;
}

void __58__HMDBackgroundOperationAccessoryManagerDataSource_values__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isReachable])
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [v5 uuid];
    [v3 addObject:v4];
  }
}

- (void)dealloc
{
  v3 = [(HMDBackgroundOperationManagerDataSource *)self notificationCenter];
  [v3 removeObserver:self name:@"HMDAccessoryIsReachableNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)HMDBackgroundOperationAccessoryManagerDataSource;
  [(HMDBackgroundOperationAccessoryManagerDataSource *)&v4 dealloc];
}

- (HMDBackgroundOperationAccessoryManagerDataSource)initWithOperationManager:(id)a3 notificationCenter:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundOperationAccessoryManagerDataSource;
  id v7 = [(HMDBackgroundOperationManagerDataSource *)&v9 initWithOperationManager:a3 notificationCenter:v6];
  if (v7) {
    [v6 addObserver:v7 selector:sel__handleAccessoryIsReachable_ name:@"HMDAccessoryIsReachableNotification" object:0];
  }

  return v7;
}

+ (id)name
{
  return @"accessoryManager";
}

@end