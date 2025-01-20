@interface HMDSSource
+ (id)logCategory;
- (HMDSSource)init;
- (HMDSSource)initWithHomeManager:(id)a3;
- (HMHomeManager)homeManager;
- (NAFuture)apiCallFuture;
- (NAFuture)didUpdateHomesFuture;
- (NSString)name;
- (id)contextFactory;
- (void)_flatMapWithAssertion:(id)a3;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setApiCallFuture:(id)a3;
- (void)setContextFactory:(id)a3;
- (void)setDidUpdateHomesFuture:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation HMDSSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiCallFuture, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong(&self->_contextFactory, 0);

  objc_storeStrong((id *)&self->_didUpdateHomesFuture, 0);
}

- (void)setApiCallFuture:(id)a3
{
}

- (NAFuture)apiCallFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 40, 1);
}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContextFactory:(id)a3
{
}

- (id)contextFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDidUpdateHomesFuture:(id)a3
{
}

- (NAFuture)didUpdateHomesFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 16, 1);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@did update homes for DigitalSeparation", (uint8_t *)&v10, 0xCu);
  }
  v9 = [(HMDSSource *)v6 didUpdateHomesFuture];
  [v9 finishWithNoResult];
}

- (void)_flatMapWithAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDSSource *)self apiCallFuture];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  int v10 = sub_5B38;
  v11 = &unk_C6C0;
  v12 = self;
  id v6 = v4;
  id v13 = v6;
  v7 = [v5 flatMap:&v8];
  -[HMDSSource setApiCallFuture:](self, "setApiCallFuture:", v7, v8, v9, v10, v11, v12);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%{public}@Stopping sharing with participant: %@", buf, 0x16u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5E2C;
  v15[3] = &unk_C670;
  v15[4] = v10;
  id v16 = v6;
  id v17 = v8;
  id v13 = v8;
  id v14 = v6;
  [(HMDSSource *)v10 _flatMapWithAssertion:v15];
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%{public}@Stopping sharing resource: %@", buf, 0x16u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6238;
  v15[3] = &unk_C670;
  v15[4] = v10;
  id v16 = v6;
  id v17 = v8;
  id v13 = v8;
  id v14 = v6;
  [(HMDSSource *)v10 _flatMapWithAssertion:v15];
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping all sharing", buf, 0xCu);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6604;
  v11[3] = &unk_C580;
  v11[4] = v7;
  id v12 = v5;
  id v10 = v5;
  [(HMDSSource *)v7 _flatMapWithAssertion:v11];
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v17 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching shared resources", buf, 0xCu);
  }
  id v10 = [(HMDSSource *)v7 homeManager];
  v11 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_6B38;
  v14[3] = &unk_C5A8;
  v14[4] = v7;
  id v15 = v5;
  id v12 = v5;
  id v13 = [v10 _refreshBeforeDate:v11 completionHandler:v14];
}

- (NSString)name
{
  return (NSString *)DSSourceNameHomeSharing;
}

- (HMDSSource)init
{
  v3 = +[HMMutableHomeManagerConfiguration defaultPrivateConfiguration];
  [v3 setOptions:11];
  [v3 setAdaptive:1];
  [v3 setCachePolicy:0];
  id v4 = [objc_alloc((Class)HMHomeManager) initWithConfiguration:v3];
  v5 = [(HMDSSource *)self initWithHomeManager:v4];

  return v5;
}

- (HMDSSource)initWithHomeManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDSSource;
  id v6 = [(HMDSSource *)&v19 init];
  if (v6)
  {
    id v7 = (NAFuture *)objc_alloc_init((Class)NAFuture);
    didUpdateHomesFuture = v6->_didUpdateHomesFuture;
    v6->_didUpdateHomesFuture = v7;

    id v9 = objc_alloc_init((Class)NAFuture);
    id v10 = v6->_didUpdateHomesFuture;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_73C0;
    v17[3] = &unk_C4F0;
    id v11 = v9;
    id v18 = v11;
    id v12 = [(NAFuture *)v10 addCompletionBlock:v17];
    apiCallFuture = v6->_apiCallFuture;
    v6->_apiCallFuture = (NAFuture *)v11;
    id v14 = v11;

    objc_storeStrong((id *)&v6->_homeManager, a3);
    [(HMHomeManager *)v6->_homeManager setDelegate:v6];
    id contextFactory = v6->_contextFactory;
    v6->_id contextFactory = &stru_C530;
  }
  return v6;
}

+ (id)logCategory
{
  if (qword_11DC8 != -1) {
    dispatch_once(&qword_11DC8, &stru_C6E0);
  }
  v2 = (void *)qword_11DD0;

  return v2;
}

@end