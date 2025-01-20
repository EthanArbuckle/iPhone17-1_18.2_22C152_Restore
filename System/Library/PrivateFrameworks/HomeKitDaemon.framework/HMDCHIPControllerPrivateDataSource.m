@interface HMDCHIPControllerPrivateDataSource
+ (id)logCategory;
- (BOOL)removeValueForKey:(id)a3 completion:(id)a4;
- (BOOL)setKeyValuePairs:(id)a3 completion:(id)a4;
- (BOOL)setValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (HMDCHIPControllerPrivateDataSource)initWithHome:(id)a3 nodeID:(id)a4;
- (HMDHome)home;
- (NSNumber)controllerNodeID;
- (id)allKeyValuePairs;
- (id)logIdentifier;
- (id)valueForKey:(id)a3;
- (void)setControllerNodeID:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HMDCHIPControllerPrivateDataSource

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controllerNodeID);
  objc_destroyWeak((id *)&self->_home);
}

- (void)setControllerNodeID:(id)a3
{
}

- (NSNumber)controllerNodeID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controllerNodeID);
  return (NSNumber *)WeakRetained;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v3 = [(HMDCHIPControllerPrivateDataSource *)self home];
  v4 = NSString;
  v5 = [v3 logIdentifier];
  v6 = [v3 fabric];
  v7 = [v6 fabricID];
  v8 = [(HMDCHIPControllerPrivateDataSource *)self controllerNodeID];
  v9 = [v4 stringWithFormat:@"%@/%@/%@", v5, v7, v8];

  return v9;
}

- (BOOL)setKeyValuePairs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDCHIPControllerPrivateDataSource *)self home];
  v9 = [v8 controllerPrivateStorage];
  [v9 setSDKKeyValuePairs:v7];

  v10 = (void (**)(void *, void))_Block_copy(v6);
  if (v10) {
    v10[2](v10, 0);
  }

  return 1;
}

- (id)allKeyValuePairs
{
  v2 = [(HMDCHIPControllerPrivateDataSource *)self home];
  v3 = [v2 controllerPrivateStorage];
  v4 = [v3 allSDKKeyValuePairs];

  return v4;
}

- (BOOL)removeValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDCHIPControllerPrivateDataSource *)self home];
  v9 = [v8 controllerPrivateStorage];
  [v9 removeValueForSDKKey:v7];

  v10 = (void (**)(void *, void))_Block_copy(v6);
  if (v10) {
    v10[2](v10, 0);
  }

  return 1;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(HMDCHIPControllerPrivateDataSource *)self home];
  v12 = [v11 controllerPrivateStorage];
  [v12 setValue:v10 forSDKKey:v9];

  v13 = (void (**)(void *, void))_Block_copy(v8);
  if (v13) {
    v13[2](v13, 0);
  }

  return 1;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCHIPControllerPrivateDataSource *)self home];
  id v6 = [v5 controllerPrivateStorage];
  id v7 = [v6 valueForSDKKey:v4];

  return v7;
}

- (HMDCHIPControllerPrivateDataSource)initWithHome:(id)a3 nodeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v7;
    v14.receiver = self;
    v14.super_class = (Class)HMDCHIPControllerPrivateDataSource;
    id v9 = [(HMDCHIPControllerPrivateDataSource *)&v14 init];
    id v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_home, v6);
      objc_storeWeak((id *)&v10->_controllerNodeID, v8);
    }

    return v10;
  }
  else
  {
    v12 = (void *)_HMFPreconditionFailure();
    return (HMDCHIPControllerPrivateDataSource *)+[HMDCHIPControllerPrivateDataSource logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_170129 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_170129, &__block_literal_global_170130);
  }
  v2 = (void *)logCategory__hmf_once_v4_170131;
  return v2;
}

void __49__HMDCHIPControllerPrivateDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_170131;
  logCategory__hmf_once_v4_170131 = v0;
}

@end