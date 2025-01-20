@interface HMDSyncOperation
+ (id)cancelOperationWithBlock:(id)a3;
+ (id)cloudFetchSyncOperationWithCloudConflict:(BOOL)a3 block:(id)a4;
+ (id)cloudForcePushSyncOperationWithBlock:(id)a3;
+ (id)cloudOperation:(id)a3 withBlock:(id)a4 completion:(id)a5;
+ (id)cloudPushSyncOperationWithBlock:(id)a3;
+ (id)cloudVerifyAccountSyncOperationWithBlock:(id)a3;
+ (id)cloudZoneFetchSyncOperation:(id)a3 cloudConflict:(BOOL)a4 block:(id)a5 completion:(id)a6;
+ (id)cloudZonePushSyncOperation:(id)a3 block:(id)a4;
+ (id)postFetchOperationWithBlock:(id)a3;
+ (id)queryDatabaseOperationWithBlock:(id)a3;
- (HMDSyncOperationOptions)options;
- (HMFTimer)delayTimer;
- (NSArray)operationCompletions;
- (NSString)zoneName;
- (NSUUID)identifier;
- (id)_initWithOptions:(id)a3 syncBlock:(id)a4 completion:(id)a5;
- (id)description;
- (id)operationBlock;
- (unint64_t)operationType;
- (void)removeAllOperationCompletions;
- (void)setDelayTimer:(id)a3;
- (void)setOperationBlock:(id)a3;
- (void)updateOperationCompletionsWithArray:(id)a3;
@end

@implementation HMDSyncOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_operationBlock, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_operationCompletions, 0);
}

- (HMDSyncOperationOptions)options
{
  return self->_options;
}

- (void)setOperationBlock:(id)a3
{
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (void)setDelayTimer:(id)a3
{
}

- (HMFTimer)delayTimer
{
  return self->_delayTimer;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)removeAllOperationCompletions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_operationCompletions removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)updateOperationCompletionsWithArray:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_operationCompletions addObjectsFromArray:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)operationCompletions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_operationCompletions copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)zoneName
{
  v2 = [(HMDSyncOperation *)self options];
  v3 = [v2 zoneName];

  return (NSString *)v3;
}

- (unint64_t)operationType
{
  v2 = [(HMDSyncOperation *)self options];
  unint64_t v3 = [v2 operationType];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(HMDSyncOperation *)self operationType] - 1;
  if (v5 > 8) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E6A0E858[v5];
  }
  v7 = [(HMDSyncOperation *)self options];
  v8 = [(HMDSyncOperation *)self identifier];
  v9 = [v3 stringWithFormat:@"<%@, Operation Type = %@, Options = %@, Identifier = %@>", v4, v6, v7, v8];

  return v9;
}

- (id)_initWithOptions:(id)a3 syncBlock:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDSyncOperation;
  v12 = [(HMDSyncOperation *)&v23 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_options, a3);
    v16 = _Block_copy(v10);
    id operationBlock = v13->_operationBlock;
    v13->_id operationBlock = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    operationCompletions = v13->_operationCompletions;
    v13->_operationCompletions = (NSMutableArray *)v18;

    if (v11)
    {
      v20 = v13->_operationCompletions;
      v21 = _Block_copy(v11);
      [(NSMutableArray *)v20 addObject:v21];
    }
  }

  return v13;
}

+ (id)cloudOperation:(id)a3 withBlock:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HMDSyncOperation alloc] _initWithOptions:v9 syncBlock:v8 completion:v7];

  return v10;
}

+ (id)cloudZoneFetchSyncOperation:(id)a3 cloudConflict:(BOOL)a4 block:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [[HMDSyncOperationOptions alloc] initWithOperationType:6 zoneName:v11 cloudConflict:v7 delayRespected:0];

  id v13 = [[HMDSyncOperation alloc] _initWithOptions:v12 syncBlock:v10 completion:v9];
  return v13;
}

+ (id)cloudZonePushSyncOperation:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[HMDSyncOperationOptions alloc] initWithOperationType:5 zoneName:v6 delayRespected:0];

  id v8 = [[HMDSyncOperation alloc] _initWithOptions:v7 syncBlock:v5 completion:0];
  return v8;
}

+ (id)cloudFetchSyncOperationWithCloudConflict:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [[HMDSyncOperationOptions alloc] initWithOperationType:4 zoneName:@"HomeDataBlobZone" cloudConflict:v4 delayRespected:0];
  id v7 = [[HMDSyncOperation alloc] _initWithOptions:v6 syncBlock:v5 completion:0];

  return v7;
}

+ (id)cloudVerifyAccountSyncOperationWithBlock:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDSyncOperationOptions alloc] initWithOperationType:3 zoneName:@"VerifyZones" cloudConflict:0 delayRespected:0];
  id v5 = [[HMDSyncOperation alloc] _initWithOptions:v4 syncBlock:v3 completion:0];

  return v5;
}

+ (id)cloudForcePushSyncOperationWithBlock:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDSyncOperationOptions alloc] initWithOperationType:2 zoneName:@"HomeDataBlobZone" delayRespected:0];
  id v5 = [[HMDSyncOperation alloc] _initWithOptions:v4 syncBlock:v3 completion:0];

  return v5;
}

+ (id)cloudPushSyncOperationWithBlock:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDSyncOperationOptions alloc] initWithOperationType:1 zoneName:@"HomeDataBlobZone" delayRespected:0];
  id v5 = [[HMDSyncOperation alloc] _initWithOptions:v4 syncBlock:v3 completion:0];

  return v5;
}

+ (id)cancelOperationWithBlock:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDSyncOperationOptions alloc] initWithOperationType:7 zoneName:@"CancelAll" cloudConflict:0 delayRespected:0];
  id v5 = [[HMDSyncOperation alloc] _initWithOptions:v4 syncBlock:v3 completion:0];

  return v5;
}

+ (id)postFetchOperationWithBlock:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDSyncOperationOptions alloc] initWithOperationType:9 zoneName:@"PostFetch" cloudConflict:0 delayRespected:0];
  id v5 = [[HMDSyncOperation alloc] _initWithOptions:v4 syncBlock:v3 completion:0];

  return v5;
}

+ (id)queryDatabaseOperationWithBlock:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDSyncOperationOptions alloc] initWithOperationType:8 zoneName:@"QueryDatabase" cloudConflict:0 delayRespected:0];
  id v5 = [[HMDSyncOperation alloc] _initWithOptions:v4 syncBlock:v3 completion:0];

  return v5;
}

@end