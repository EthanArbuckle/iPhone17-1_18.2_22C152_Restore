@interface CalLocationAuthorization
+ (BOOL)preciseLocationAuthorizedForBundle:(id)a3;
+ (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3;
+ (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3 bundle:(id)a4;
+ (id)_cachedInstanceForBundleID:(id)a3 bundle:(id)a4;
+ (id)_keyForBundleID:(id)a3 bundle:(id)a4;
+ (id)authorizationForBundleIdentifier:(id)a3 bundle:(id)a4 createIfNecessary:(BOOL)a5;
+ (id)locationAuthorizationAsyncCallersQueue;
+ (id)logHandle;
+ (int)authorizationStatusForBundle:(id)a3;
+ (int)authorizationStatusForBundleIdentifier:(id)a3;
+ (int)authorizationStatusForBundleIdentifier:(id)a3 bundle:(id)a4;
+ (unint64_t)locationPrecisionForBundleIdentifier:(id)a3;
+ (unint64_t)locationPrecisionForBundleIdentifier:(id)a3 bundle:(id)a4;
+ (unint64_t)ttlLocationStatus;
+ (void)authorizationStatusForBundle:(id)a3 completion:(id)a4;
+ (void)authorizationStatusForBundleIdentifier:(id)a3 bundle:(id)a4 completion:(id)a5;
+ (void)authorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4;
+ (void)initializeQueueAndInstancesIfNeeded;
+ (void)preciseLocationAuthorizedForBundle:(id)a3 completion:(id)a4;
+ (void)preciseLocationAuthorizedForBundleIdentifier:(id)a3 bundle:(id)a4 completion:(id)a5;
+ (void)preciseLocationAuthorizedForBundleIdentifier:(id)a3 completion:(id)a4;
+ (void)ttlLocationStatusWithCompletion:(id)a3;
- (CalLocationAuthorization)initWithBundleID:(id)a3 bundle:(id)a4 queue:(id)a5;
- (id)authorizationStatus;
- (unint64_t)waitForPrecision;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)waitForPrecision;
@end

@implementation CalLocationAuthorization

+ (id)logHandle
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)logHandle_logHandle;

  return v2;
}

uint64_t __37__CalLocationAuthorization_logHandle__block_invoke()
{
  logHandle_logHandle = (uint64_t)os_log_create("CalendarFoundation", "CalLocationAuthorization");

  return MEMORY[0x1F41817F8]();
}

+ (id)locationAuthorizationAsyncCallersQueue
{
  if (locationAuthorizationAsyncCallersQueue_onceToken != -1) {
    dispatch_once(&locationAuthorizationAsyncCallersQueue_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)locationAuthorizationAsyncCallersQueue_queue;

  return v2;
}

void __66__CalLocationAuthorization_locationAuthorizationAsyncCallersQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.CalendarFoundation.CalLocationAuthorization.AsyncCallers", v2);
  v1 = (void *)locationAuthorizationAsyncCallersQueue_queue;
  locationAuthorizationAsyncCallersQueue_queue = (uint64_t)v0;
}

+ (void)authorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4
{
}

+ (void)authorizationStatusForBundle:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 bundleIdentifier];
  [a1 authorizationStatusForBundleIdentifier:v8 bundle:v7 completion:v6];
}

+ (void)authorizationStatusForBundleIdentifier:(id)a3 bundle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = [a1 _cachedInstanceForBundleID:v8 bundle:v9];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 authorizationStatus];
    uint64_t v14 = [v13 status];

    v10[2](v10, v14);
  }
  else
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __85__CalLocationAuthorization_authorizationStatusForBundleIdentifier_bundle_completion___block_invoke;
    v20 = &unk_1E56CD7C0;
    id v24 = a1;
    id v21 = v8;
    id v22 = v9;
    v23 = v10;
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v17);
    v16 = objc_msgSend(a1, "locationAuthorizationAsyncCallersQueue", v17, v18, v19, v20);
    dispatch_async(v16, v15);
  }
}

uint64_t __85__CalLocationAuthorization_authorizationStatusForBundleIdentifier_bundle_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 56) authorizationStatusForBundleIdentifier:*(void *)(a1 + 32) bundle:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

+ (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return [a1 authorizationStatusForBundleIdentifier:a3 bundle:0];
}

+ (int)authorizationStatusForBundle:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  LODWORD(a1) = [a1 authorizationStatusForBundleIdentifier:v5 bundle:v4];

  return (int)a1;
}

+ (int)authorizationStatusForBundleIdentifier:(id)a3 bundle:(id)a4
{
  id v4 = [a1 authorizationForBundleIdentifier:a3 bundle:a4 createIfNecessary:1];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 authorizationStatus];
    int v7 = [v6 status];
  }
  else
  {
    int v7 = 2;
  }

  return v7;
}

+ (unint64_t)locationPrecisionForBundleIdentifier:(id)a3
{
  return [a1 locationPrecisionForBundleIdentifier:a3 bundle:0];
}

+ (unint64_t)locationPrecisionForBundleIdentifier:(id)a3 bundle:(id)a4
{
  id v4 = [a1 authorizationForBundleIdentifier:a3 bundle:a4 createIfNecessary:0];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 authorizationStatus];
    unint64_t v7 = [v6 precision];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (void)preciseLocationAuthorizedForBundleIdentifier:(id)a3 completion:(id)a4
{
}

+ (void)preciseLocationAuthorizedForBundle:(id)a3 completion:(id)a4
{
}

+ (void)preciseLocationAuthorizedForBundleIdentifier:(id)a3 bundle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke;
  v20[3] = &unk_1E56CD7C0;
  id v24 = a1;
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v10;
  id v23 = v13;
  uint64_t v14 = (void (**)(void))MEMORY[0x192FD8850](v20);
  dispatch_block_t v15 = [a1 _cachedInstanceForBundleID:v11 bundle:v12];
  if (v15)
  {
    v14[2](v14);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke_2;
    block[3] = &unk_1E56CD7E8;
    v19 = v14;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    uint64_t v17 = [a1 locationAuthorizationAsyncCallersQueue];
    dispatch_async(v17, v16);
  }
}

uint64_t __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 56) preciseLocationAuthorizedForBundleIdentifier:*(void *)(a1 + 32) bundle:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3
{
  return [a1 preciseLocationAuthorizedForBundleIdentifier:a3 bundle:0];
}

+ (BOOL)preciseLocationAuthorizedForBundle:(id)a3
{
  return [a1 preciseLocationAuthorizedForBundleIdentifier:0 bundle:a3];
}

+ (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3 bundle:(id)a4
{
  id v4 = [a1 authorizationForBundleIdentifier:a3 bundle:a4 createIfNecessary:1];
  BOOL v5 = [v4 waitForPrecision] == 2;

  return v5;
}

+ (void)initializeQueueAndInstancesIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (initializeQueueAndInstancesIfNeeded_onceToken != -1) {
    dispatch_once(&initializeQueueAndInstancesIfNeeded_onceToken, block);
  }
}

void __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke(uint64_t a1)
{
  if (+[CalEntitlementsVerifier currentProcessHasBooleanEntitlement:@"com.apple.locationd.effective_bundle"])
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CalendarFoundation.CalLocationAuthorization.Request", v2);
    id v4 = (void *)locationAuthorizationQueue;
    locationAuthorizationQueue = (uint64_t)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    id v6 = (void *)idInstances;
    idInstances = v5;

    bundleInstances = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    unint64_t v7 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke_cold_1(v7);
    }
  }
}

+ (id)_keyForBundleID:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v7;
  if (!v7)
  {
    id v8 = [v6 bundlePath];
    if (!v8)
    {
      id v9 = [v6 bundleURL];
      id v8 = [v9 absoluteString];
    }
  }

  return v8;
}

+ (id)_cachedInstanceForBundleID:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 initializeQueueAndInstancesIfNeeded];
  id v8 = &idInstances;
  if (v6) {
    id v8 = &bundleInstances;
  }
  id v9 = (id)*v8;
  id v10 = [a1 _keyForBundleID:v7 bundle:v6];

  os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
  if (v10)
  {
    id v11 = [v9 objectForKeyedSubscript:v10];
  }
  else
  {
    id v11 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);

  return v11;
}

+ (id)authorizationForBundleIdentifier:(id)a3 bundle:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    [a1 initializeQueueAndInstancesIfNeeded];
    if (!locationAuthorizationQueue)
    {
      id v11 = 0;
      goto LABEL_19;
    }
    id v12 = &idInstances;
    if (v9) {
      id v12 = &bundleInstances;
    }
    id v10 = (id)*v12;
    id v13 = [a1 _keyForBundleID:v8 bundle:v9];
    uint64_t v24 = 0;
    v25 = (id *)&v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
    if (v13)
    {
      uint64_t v14 = [v10 objectForKeyedSubscript:v13];
    }
    else
    {
      uint64_t v14 = 0;
    }
    objc_storeStrong(v25 + 5, v14);
    if (v13) {

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);
    id v15 = v25[5];
    if (!v15 && v5)
    {
      dispatch_block_t v16 = locationAuthorizationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__CalLocationAuthorization_authorizationForBundleIdentifier_bundle_createIfNecessary___block_invoke;
      block[3] = &unk_1E56CD830;
      id v19 = v13;
      id v23 = &v24;
      v20 = v10;
      id v21 = (id)v8;
      id v22 = (id)v9;
      dispatch_sync(v16, block);

      id v15 = v25[5];
    }
    id v11 = v15;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v10 = [a1 logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[CalLocationAuthorization authorizationForBundleIdentifier:bundle:createIfNecessary:](v10);
    }
    id v11 = 0;
  }

LABEL_19:

  return v11;
}

void __86__CalLocationAuthorization_authorizationForBundleIdentifier_bundle_createIfNecessary___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
    uint64_t v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    BOOL v5 = [CalLocationAuthorization alloc];
    uint64_t v6 = [(CalLocationAuthorization *)v5 initWithBundleID:*(void *)(a1 + 48) bundle:*(void *)(a1 + 56) queue:locationAuthorizationQueue];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(a1 + 32))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
      [*(id *)(a1 + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
      os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);
    }
  }
}

- (CalLocationAuthorization)initWithBundleID:(id)a3 bundle:(id)a4 queue:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(v10);
  v29.receiver = self;
  v29.super_class = (Class)CalLocationAuthorization;
  id v11 = [(CalLocationAuthorization *)&v29 init];
  id v12 = v11;
  if (v11)
  {
    if (v9) {
      id v13 = v9;
    }
    else {
      id v13 = v8;
    }
    objc_storeStrong(&v11->_bundleOrBundleIdentifier, v13);
    dispatch_group_t v14 = dispatch_group_create();
    initializationGroup = v12->_initializationGroup;
    v12->_initializationGroup = (OS_dispatch_group *)v14;

    dispatch_block_t v16 = (void *)MEMORY[0x1E4F1E600];
    if (v9)
    {
      uint64_t v17 = [v9 bundlePath];
      uint64_t v18 = [v16 authorizationStatusForBundlePath:v17];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1E600] authorizationStatusForBundleIdentifier:v8];
    }
    if ((int)v18 >= 3) {
      dispatch_group_enter((dispatch_group_t)v12->_initializationGroup);
    }
    id v19 = [[CalLocationAuthorizationStatus alloc] initWithStatus:v18 precision:(int)v18 < 3];
    status = v12->_status;
    v12->_status = v19;

    id v21 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = v8;
      __int16 v32 = 1024;
      int v33 = v18;
      _os_log_impl(&dword_190D88000, v21, OS_LOG_TYPE_DEFAULT, "Got initial location auth status for %{public}@ = %d", buf, 0x12u);
    }

    v12->_initializedTimestamp = CalApproximateContinuousTime();
    id v22 = objc_alloc(MEMORY[0x1E4F1E600]);
    id v23 = v22;
    if (v9)
    {
      uint64_t v24 = [v9 bundlePath];
      uint64_t v25 = [v23 initWithEffectiveBundlePath:v24 delegate:v12 onQueue:v10];
      locationManager = v12->_locationManager;
      v12->_locationManager = (CLLocationManager *)v25;
    }
    else
    {
      uint64_t v27 = [v22 initWithEffectiveBundleIdentifier:v8 delegate:v12 onQueue:v10];
      uint64_t v24 = v12->_locationManager;
      v12->_locationManager = (CLLocationManager *)v27;
    }
  }
  return v12;
}

- (id)authorizationStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_status;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 authorizationStatus];
  uint64_t v6 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id bundleOrBundleIdentifier = self->_bundleOrBundleIdentifier;
    *(_DWORD *)buf = 138543618;
    double v27 = *(double *)&bundleOrBundleIdentifier;
    __int16 v28 = 1024;
    int v29 = v5;
    _os_log_impl(&dword_190D88000, v6, OS_LOG_TYPE_DEFAULT, "Got updated location auth status for %{public}@ = %d", buf, 0x12u);
  }

  int v8 = [v4 _limitsPrecision];
  BOOL v9 = 1;
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  id v11 = [[CalLocationAuthorizationStatus alloc] initWithStatus:v5 precision:v10];
  os_unfair_lock_lock(&self->_lock);
  unint64_t v12 = [(CalLocationAuthorizationStatus *)self->_status precision];
  if ([(CalLocationAuthorizationStatus *)self->_status status] == v5) {
    BOOL v9 = [(CalLocationAuthorizationStatus *)self->_status precision] != v10;
  }
  objc_storeStrong((id *)&self->_status, v11);
  if (!self->_firstCallbackReceivedTimestamp)
  {
    self->_firstCallbackReceivedTimestamp = CalApproximateContinuousTime();
    uint64_t v13 = CalApproximateContinuousTime();
    double v14 = CalContinuousIntervalToNSTimeInterval(v13 - self->_initializedTimestamp);
    if (v14 <= 20.0) {
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
    }
    else {
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    }
    dispatch_block_t v16 = +[CalLocationAuthorization logHandle];
    if (os_log_type_enabled(v16, v15))
    {
      *(_DWORD *)buf = 134217984;
      double v27 = v14;
      _os_log_impl(&dword_190D88000, v16, v15, "It took %f seconds for CLLocationManager to deliver its first callback", buf, 0xCu);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    if (!v9) {
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_group_leave((dispatch_group_t)self->_initializationGroup);
    if (!v9) {
      goto LABEL_25;
    }
  }
  if (locationManagerDidChangeAuthorization__onceToken != -1) {
    dispatch_once(&locationManagerDidChangeAuthorization__onceToken, &__block_literal_global_37);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = @"CalLocationAuthorizationBundleIdentifierKey";
  }
  else {
    uint64_t v17 = @"CalLocationAuthorizationBundleKey";
  }
  id v18 = self->_bundleOrBundleIdentifier;
  uint64_t v24 = v17;
  id v25 = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v20 = locationManagerDidChangeAuthorization__notificationQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__CalLocationAuthorization_locationManagerDidChangeAuthorization___block_invoke_2;
  v22[3] = &unk_1E56CD858;
  v22[4] = self;
  id v23 = v19;
  id v21 = v19;
  dispatch_async(v20, v22);

LABEL_25:
}

void __66__CalLocationAuthorization_locationManagerDidChangeAuthorization___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.CalendarFoundation.CalLocationAuthorization.Notification", v2);
  v1 = (void *)locationManagerDidChangeAuthorization__notificationQueue;
  locationManagerDidChangeAuthorization__notificationQueue = (uint64_t)v0;
}

void __66__CalLocationAuthorization_locationManagerDidChangeAuthorization___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"CalLocationAuthorizationChangedNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (unint64_t)waitForPrecision
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(CalLocationAuthorizationStatus *)self->_status precision];
  if (!v4)
  {
    if (self->_firstCallbackReceivedTimestamp
      || (uint64_t v5 = CalApproximateContinuousTime(),
          double v6 = 60.0 - CalContinuousIntervalToNSTimeInterval(v5 - self->_initializedTimestamp),
          v6 <= 0.0)
      || (dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0)),
          os_unfair_lock_unlock(p_lock),
          dispatch_group_wait((dispatch_group_t)self->_initializationGroup, v7),
          os_unfair_lock_lock(p_lock),
          (unint64_t v4 = [(CalLocationAuthorizationStatus *)self->_status precision]) == 0))
    {
      if (!self->_failedToInitializePrecision)
      {
        self->_failedToInitializePrecision = 1;
        int v8 = +[CalLocationAuthorization logHandle];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          [(CalLocationAuthorization *)(uint64_t)self waitForPrecision];
        }

        BOOL v9 = [[CalABCReporter alloc] initWithType:@"Foundation" subtype:@"Location" context:@"Precision Timeout"];
        [(CalABCReporter *)v9 report];
      }
      unint64_t v4 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (void)ttlLocationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke;
  v12[3] = &unk_1E56CD880;
  id v14 = a1;
  id v5 = v4;
  id v13 = v5;
  double v6 = (void (**)(void))MEMORY[0x192FD8850](v12);
  dispatch_time_t v7 = [a1 _cachedInstanceForBundleID:@"com.apple.mobilecal" bundle:0];
  if (v7)
  {
    v6[2](v6);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E56CD7E8;
    id v11 = v6;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    BOOL v9 = [a1 locationAuthorizationAsyncCallersQueue];
    dispatch_async(v9, v8);
  }
}

uint64_t __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) ttlLocationStatus];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (unint64_t)ttlLocationStatus
{
  if (+[CalLocationAuthorization authorizationStatusForBundleIdentifier:@"com.apple.mobilecal"] < 3)return 1; {
  uint64_t v3 = +[CalLocationBundle bundle];
  }
  int v4 = +[CalLocationAuthorization authorizationStatusForBundle:v3];

  if (v4 != 3) {
    return 3;
  }
  unint64_t v5 = +[CalLocationAuthorization locationPrecisionForBundleIdentifier:@"com.apple.mobilecal"];
  if (v5 == 1) {
    return 2;
  }
  else {
    return 4 * (v5 != 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_initializationGroup, 0);

  objc_storeStrong(&self->_bundleOrBundleIdentifier, 0);
}

void __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  id v2 = @"com.apple.locationd.effective_bundle";
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Need the '%{public}@' entitlement in order to determine if current process has location authorization", (uint8_t *)&v1, 0xCu);
}

+ (void)authorizationForBundleIdentifier:(os_log_t)log bundle:createIfNecessary:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_190D88000, log, OS_LOG_TYPE_FAULT, "Attempted to get location authorization with neither bundle nor bundleID", v1, 2u);
}

- (void)waitForPrecision
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = CalApproximateContinuousTime();
  double v6 = CalContinuousIntervalToNSTimeInterval(v5 - *(void *)(a1 + 48));
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  double v10 = v6;
  _os_log_fault_impl(&dword_190D88000, a2, OS_LOG_TYPE_FAULT, "Timed out waiting on location precision for bundle %@ (initialization was %f seconds ago)", (uint8_t *)&v7, 0x16u);
}

@end