@interface HMDBackgroundOperation
+ (NSPredicate)predicate;
+ (id)logCategory;
- (BOOL)finished;
- (BOOL)hasDependency:(id)a3;
- (BOOL)isAlreadyScheduled;
- (BOOL)isDeferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isReadyToRun;
- (BOOL)mainWithError:(id *)a3;
- (BOOL)runOperation:(id)a3;
- (HMDBackgroundOperation)initWithUUID:(id)a3 userData:(id)a4 backGroundOpsManager:(id)a5 scheduledDate:(id)a6 expirationDate:(id)a7 dataSource:(id)a8 dependentOperations:(id)a9;
- (HMDBackgroundOperation)initWithUserData:(id)a3;
- (HMDBackgroundOperation)initWithUserData:(id)a3 dataSource:(id)a4 backGroundOpsManager:(id)a5;
- (HMDBackgroundOperationDataSource)dataSource;
- (HMDBackgroundOperationManager)bgOpsManager;
- (HMDHomeManager)homeManager;
- (NSDate)deferralDate;
- (NSDate)expirationDate;
- (NSDate)scheduledDate;
- (NSDictionary)userData;
- (NSMutableSet)dependencies;
- (NSOperationQueue)queue;
- (NSUUID)operationUUID;
- (id)AllDependencies;
- (id)attributeDescriptions;
- (id)dumpState;
- (id)logIdentifier;
- (int64_t)failureCount;
- (int64_t)qualityOfService;
- (void)addDependency:(id)a3;
- (void)deferWithFailureCount:(int64_t)a3;
- (void)markOperationFinished;
- (void)removeDependency:(id)a3;
- (void)setBgOpsManager:(id)a3;
- (void)setDeferralDate:(id)a3;
- (void)setFailureCount:(int64_t)a3;
- (void)setFinished:(BOOL)a3;
- (void)setHomeManager:(id)a3;
- (void)setIsExpired:(BOOL)a3;
- (void)setIsReadyToRun:(BOOL)a3;
- (void)setScheduled:(BOOL)a3;
@end

@implementation HMDBackgroundOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_bgOpsManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong((id *)&self->_deferralDate, 0);
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (HMDBackgroundOperationDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (BOOL)isAlreadyScheduled
{
  return self->_scheduled;
}

- (void)setIsExpired:(BOOL)a3
{
  self->_isExpired = a3;
}

- (void)setIsReadyToRun:(BOOL)a3
{
  self->_isReadyToRun = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSDate)scheduledDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)userData
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (NSMutableSet)dependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBgOpsManager:(id)a3
{
}

- (HMDBackgroundOperationManager)bgOpsManager
{
  return self->_bgOpsManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (id)dumpState
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMDBackgroundOperation *)self operationUUID];
  v6 = [(HMDBackgroundOperation *)self scheduledDate];
  v7 = [(HMDBackgroundOperation *)self expirationDate];
  v8 = [(HMDBackgroundOperation *)self deferralDate];
  [(HMDBackgroundOperation *)self isExpired];
  v9 = HMFBooleanToString();
  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDBackgroundOperation failureCount](self, "failureCount"));
  v11 = [(HMDBackgroundOperation *)self userData];
  v12 = [(HMDBackgroundOperation *)self dependencies];
  v13 = [v3 stringWithFormat:@"name: %@, id: %@, scheduledDate: %@ expirationDate: %@, deferralDate: %@, expired: %@, failureCount:%@, userData: %@, dependencies: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (id)attributeDescriptions
{
  v26[7] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v25 = [(HMDBackgroundOperation *)self operationUUID];
  v24 = (void *)[v3 initWithName:@"UUID" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v23 = [(HMDBackgroundOperation *)self expirationDate];
  v22 = (void *)[v4 initWithName:@"expirationDate" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v21 = [(HMDBackgroundOperation *)self deferralDate];
  v6 = (void *)[v5 initWithName:@"deferralDate" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDBackgroundOperation failureCount](self, "failureCount"));
  v9 = (void *)[v7 initWithName:@"failureCount" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDBackgroundOperation *)self isExpired];
  v11 = HMFBooleanToString();
  v12 = (void *)[v10 initWithName:@"expired" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = [(HMDBackgroundOperation *)self dependencies];
  v15 = (void *)[v13 initWithName:@"dependencies" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDBackgroundOperation *)self isAlreadyScheduled];
  v17 = HMFBooleanToString();
  v18 = (void *)[v16 initWithName:@"scheduled" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:7];

  return v19;
}

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)AllDependencies
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableSet *)self->_dependencies copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasDependency:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(HMDBackgroundOperation *)self dependencies];
  char v7 = [v6 containsObject:v4];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)removeDependency:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDBackgroundOperation *)self dependencies];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v6 = [(HMDBackgroundOperation *)self dependencies];
    [v6 addObject:v7];

    os_unfair_lock_unlock(p_lock);
    id v4 = v7;
  }
}

- (BOOL)isDeferred
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_deferralDate)
  {
    id v4 = [(HMDBackgroundOperation *)self dataSource];
    [v4 timeIntervalSinceNowToDate:self->_deferralDate];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setDeferralDate:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  deferralDate = self->_deferralDate;
  self->_deferralDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)deferralDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_deferralDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)deferWithFailureCount:(int64_t)a3
{
  uint64_t v4 = a3 - 1;
  if (a3 - 1 >= (unint64_t)[&unk_26E474260 count]) {
    uint64_t v4 = [&unk_26E474260 count] - 1;
  }
  id v7 = [&unk_26E474260 objectAtIndexedSubscript:v4];
  double v5 = [(HMDBackgroundOperation *)self dataSource];
  [v7 doubleValue];
  BOOL v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  [(HMDBackgroundOperation *)self setDeferralDate:v6];
}

- (BOOL)isReadyToRun
{
  if ([(HMDBackgroundOperation *)self isExpired]
    || [(HMDBackgroundOperation *)self finished]
    || [(HMDBackgroundOperation *)self isDeferred])
  {
    return 0;
  }
  else
  {
    return ![(HMDBackgroundOperation *)self isAlreadyScheduled];
  }
}

- (BOOL)isExpired
{
  id v3 = [(HMDBackgroundOperation *)self dataSource];
  uint64_t v4 = [(HMDBackgroundOperation *)self expirationDate];
  [v3 timeIntervalSinceNowToDate:v4];
  BOOL v6 = v5 < 0.0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_10;
  }
  id v7 = [(HMDBackgroundOperation *)self operationUUID];
  v8 = [v6 operationUUID];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_10;
  }
  id v10 = [(HMDBackgroundOperation *)self userData];
  v11 = [v6 userData];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_10;
  }
  id v13 = [(HMDBackgroundOperation *)self scheduledDate];
  v14 = [v6 scheduledDate];
  int v15 = HMFEqualObjects();

  if (!v15) {
    goto LABEL_10;
  }
  id v16 = [(HMDBackgroundOperation *)self expirationDate];
  v17 = [v6 expirationDate];
  int v18 = HMFEqualObjects();

  if (v18)
  {
    v19 = [(HMDBackgroundOperation *)self AllDependencies];
    v20 = [v6 AllDependencies];
    char v21 = HMFEqualObjects();
  }
  else
  {
LABEL_10:
    char v21 = 0;
  }

  return v21;
}

- (void)markOperationFinished
{
}

- (BOOL)runOperation:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDBackgroundOperation *)self finished])
  {
    double v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@The operation is already finished running.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  BOOL v9 = [(HMDBackgroundOperation *)self isDeferred];
  double v5 = (void *)MEMORY[0x230FBD990]();
  if (v9)
  {
    id v6 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = [(HMDBackgroundOperation *)v6 operationUUID];
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Operation [%@] is deferred and should not run.", buf, 0x16u);
    }
LABEL_17:
    BOOL v19 = 0;
    goto LABEL_18;
  }
  id v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  int v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    v17 = [(HMDBackgroundOperation *)v14 operationUUID];
    *(_DWORD *)buf = 138543618;
    v29 = v16;
    __int16 v30 = 2112;
    v31 = v17;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Running Operation : %@", buf, 0x16u);
  }
  [(HMDBackgroundOperation *)v14 setHomeManager:v4];
  id v27 = 0;
  BOOL v18 = [(HMDBackgroundOperation *)v14 mainWithError:&v27];
  id v6 = (HMDBackgroundOperation *)v27;
  if (!v18)
  {
    [(HMDBackgroundOperation *)v14 setScheduled:0];
    [(HMDBackgroundOperation *)v14 setFailureCount:[(HMDBackgroundOperation *)v14 failureCount] + 1];
    v20 = (void *)MEMORY[0x230FBD990]([(HMDBackgroundOperation *)v14 deferWithFailureCount:[(HMDBackgroundOperation *)v14 failureCount]]);
    char v21 = v14;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [(HMDBackgroundOperation *)v21 operationUUID];
      v25 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDBackgroundOperation failureCount](v21, "failureCount"));
      *(_DWORD *)buf = 138544130;
      v29 = v23;
      __int16 v30 = 2112;
      v31 = v24;
      __int16 v32 = 2112;
      v33 = v25;
      __int16 v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Operation [%@] failed [%@] with error : %@", buf, 0x2Au);
    }
    goto LABEL_17;
  }
  [(HMDBackgroundOperation *)v14 markOperationFinished];
LABEL_13:
  BOOL v19 = 1;
LABEL_18:

  return v19;
}

- (int64_t)qualityOfService
{
  return 9;
}

- (HMDBackgroundOperation)initWithUserData:(id)a3 dataSource:(id)a4 backGroundOpsManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dateWithTimeIntervalSinceNow:2592000.0];
  int v12 = [MEMORY[0x263F08C38] UUID];
  id v13 = [v9 currentDate];
  v14 = [(HMDBackgroundOperation *)self initWithUUID:v12 userData:v10 backGroundOpsManager:v8 scheduledDate:v13 expirationDate:v11 dataSource:v9 dependentOperations:0];

  return v14;
}

- (HMDBackgroundOperation)initWithUserData:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(HMDBackgroundOperationDataSource);
  id v6 = +[HMDMainDriver driver];
  id v7 = [v6 homeManager];
  id v8 = [v7 bgOpsManager];
  id v9 = [(HMDBackgroundOperation *)self initWithUserData:v4 dataSource:v5 backGroundOpsManager:v8];

  return v9;
}

- (HMDBackgroundOperation)initWithUUID:(id)a3 userData:(id)a4 backGroundOpsManager:(id)a5 scheduledDate:(id)a6 expirationDate:(id)a7 dataSource:(id)a8 dependentOperations:(id)a9
{
  id v15 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)HMDBackgroundOperation;
  BOOL v19 = [(HMDBackgroundOperation *)&v29 init];
  v20 = v19;
  if (v19)
  {
    v19->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_bgOpsManager, a5);
    uint64_t v21 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSUUID:", v15);
    operationUUID = v20->_operationUUID;
    v20->_operationUUID = (NSUUID *)v21;

    objc_storeStrong((id *)&v20->_userData, a4);
    objc_storeStrong((id *)&v20->_scheduledDate, a6);
    objc_storeStrong((id *)&v20->_expirationDate, a7);
    objc_storeStrong((id *)&v20->_dataSource, a8);
    if (v18)
    {
      v23 = (void *)[v18 mutableCopy];
    }
    else
    {
      v23 = [MEMORY[0x263EFF9C0] set];
    }
    v24 = v23;
    objc_storeStrong((id *)&v20->_dependencies, v23);
  }
  return v20;
}

- (BOOL)mainWithError:(id *)a3
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  double v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_138865 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_138865, &__block_literal_global_138866);
  }
  v2 = (void *)logCategory__hmf_once_v13_138867;
  return v2;
}

void __37__HMDBackgroundOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13_138867;
  logCategory__hmf_once_v13_138867 = v0;
}

+ (NSPredicate)predicate
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end