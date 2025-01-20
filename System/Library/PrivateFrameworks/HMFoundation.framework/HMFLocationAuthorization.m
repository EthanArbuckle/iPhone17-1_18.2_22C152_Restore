@interface HMFLocationAuthorization
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)logCategory;
+ (id)sharedAuthorization;
- (BOOL)isAuthorized;
- (BOOL)isMonitoring;
- (CLLocationManager)internal;
- (HMFLocationAuthorization)init;
- (HMFLocationAuthorization)initWithBundle:(id)a3;
- (HMFLocationAuthorization)initWithBundleIdentifier:(id)a3;
- (HMFLocationAuthorization)initWithScheduler:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (OS_dispatch_queue)queue;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (int)status;
- (void)_mark;
- (void)_requestAuthorization:(int64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)locationOperationCompleted;
- (void)mark;
- (void)registerObserver:(id)a3;
- (void)requestAuthorization:(int64_t)a3 completionHandler:(id)a4;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HMFLocationAuthorization

- (HMFLocationAuthorization)initWithBundle:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure(@"bundle");
  }
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)HMFLocationAuthorization;
  v6 = [(HMFLocationAuthorization *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 bundlePath];
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v7;

    __HMFLocationAuthorizationInitialize(v6);
  }

  return v6;
}

+ (id)logCategory
{
  if (qword_1EB4EEA38 != -1) {
    dispatch_once(&qword_1EB4EEA38, &__block_literal_global_66);
  }
  v2 = (void *)qword_1EB4EEA40;
  return v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"isAuthorized";
  v7[1] = @"authorized";
  v7[2] = @"isMonitoring";
  v7[3] = @"monitoring";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v7 count:4];
  LOBYTE(v3) = [v5 containsObject:v4];

  return v3 ^ 1;
}

void __54__HMFLocationAuthorization_locationOperationCompleted__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) unregisterFromKVO];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;
}

void __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[6] unregisterFromKVO];
    id v2 = v3[6];
    v3[6] = 0;

    WeakRetained = v3;
  }
}

- (void)registerObserver:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x19F3A87A0]();
    v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = HMFGetLogIdentifier(v6);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Registering location authorization observer: %@", buf, 0x16u);
    }
    v9 = [[HMFObjectObserver alloc] initWithObservedObject:v4];
    p_lock = &v6->_lock.lock;
    os_unfair_lock_lock_with_options();
    if (([(NSMutableSet *)v6->_observers containsObject:v9] & 1) == 0)
    {
      objc_initWeak(&location, v6);
      objc_initWeak(&from, v9);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __45__HMFLocationAuthorization_registerObserver___block_invoke;
      v17[3] = &unk_1E5957B10;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      [(HMFObjectObserver *)v9 setDeallocationBlock:v17];
      [(NSMutableSet *)v6->_observers addObject:v9];
      v11 = v6;
      if (!v11->_state)
      {
        context = (void *)MEMORY[0x19F3A87A0]();
        v12 = v11;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier(v12);
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v14;
          _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting to monitor location authorization", buf, 0xCu);
        }
        v12->_state = 1;
        if (CoreLocationLibraryCore())
        {
          queue = v12->_queue;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = ____HMFLocationAuthorizationStartMonitoring_block_invoke;
          v23 = &unk_1E5957698;
          v24 = v12;
          dispatch_async(queue, buf);
        }
      }

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

void __45__HMFLocationAuthorization_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v7 = (char *)WeakRetained;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = HMFGetLogIdentifier(v7);
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Observer deallocated, stopping monitoring for observer: %@", buf, 0x16u);
    }
    objc_super v10 = (os_unfair_lock_s *)(v7 + 8);
    os_unfair_lock_lock_with_options();
    [*((id *)v7 + 5) removeObject:v5];
    if (objc_msgSend(*((id *)v7 + 5), "hmf_isEmpty"))
    {
      v11 = *((void *)v7 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__HMFLocationAuthorization_registerObserver___block_invoke_54;
      block[3] = &unk_1E59576C0;
      objc_copyWeak(&v13, v2);
      dispatch_async(v11, block);
      objc_destroyWeak(&v13);
    }
    os_unfair_lock_unlock(v10);
  }
}

- (BOOL)isAuthorized
{
  return [(HMFLocationAuthorization *)self status] - 3 < 2;
}

- (int)status
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_state)
  {
    int status = self->_status;
  }
  else
  {
    v5 = self;
    if (CoreLocationLibraryCore())
    {
      if (v5->_bundleIdentifier)
      {
        int v6 = [getCLLocationManagerClass() authorizationStatusForBundleIdentifier:v5->_bundleIdentifier];
      }
      else
      {
        bundlePath = v5->_bundlePath;
        id CLLocationManagerClass = getCLLocationManagerClass();
        if (bundlePath) {
          int v6 = [CLLocationManagerClass authorizationStatusForBundlePath:v5->_bundlePath];
        }
        else {
          int v6 = [CLLocationManagerClass authorizationStatus];
        }
      }
      int status = v6;
    }
    else
    {
      int status = 0;
    }

    v5->_int status = status;
  }
  os_unfair_lock_unlock(&p_lock->lock);
  return status;
}

- (BOOL)isMonitoring
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state == 2;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (CLLocationManager)internal
{
  return (CLLocationManager *)objc_getProperty(self, a2, 88, 1);
}

uint64_t __32__HMFLocationAuthorization_mark__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mark];
}

+ (id)sharedAuthorization
{
  if (_MergedGlobals_3_0 != -1) {
    dispatch_once(&_MergedGlobals_3_0, &__block_literal_global_10);
  }
  id v2 = (void *)qword_1EB4EEA30;
  return v2;
}

uint64_t __39__HMFLocationAuthorization_logCategory__block_invoke()
{
  qword_1EB4EEA40 = HMFCreateOSLogHandle(@"Location.Authorization", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

uint64_t __67__HMFLocationAuthorization_requestAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestAuthorization:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

void __45__HMFLocationAuthorization_registerObserver___block_invoke_54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    __HMFLocationAuthorizationStopMonitoring(WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint32_t v5 = [v4 authorizationStatus];
  int v6 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier(v7);
    int v22 = 138543618;
    v23 = v9;
    __int16 v24 = 1024;
    LODWORD(v25) = v5;
    _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification of authorization status changing to %d", (uint8_t *)&v22, 0x12u);
  }
  objc_super v10 = v7;
  v11 = (os_unfair_lock_s *)v10;
  if (v10)
  {
    [(HMFLocationAuthorization *)v10 willChangeValueForKey:@"isAuthorized"];
    unsigned int v12 = v5 - 3;
    os_unfair_lock_lock_with_options();
    uint32_t os_unfair_lock_opaque = v11[6]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque != v5) {
      v11[6]._uint32_t os_unfair_lock_opaque = v5;
    }
    int v14 = (v12 < 2) ^ (os_unfair_lock_opaque - 3 < 2);
    uint64_t v15 = *(void *)&v11[8]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v11 + 2);
    [(os_unfair_lock_s *)v11 didChangeValueForKey:@"isAuthorized"];
    if (v15 == 1) {
      __HMFLocationAuthorizationUpdateState(v11, 2);
    }
    if (v14)
    {
      __int16 v16 = (void *)MEMORY[0x19F3A87A0]();
      v17 = v11;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = HMFGetLogIdentifier(v17);
        v20 = HMFBooleanToString(v12 < 2);
        int v22 = 138543618;
        v23 = v19;
        __int16 v24 = 2112;
        uint64_t v25 = v20;
        _os_log_impl(&dword_19D57B000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Posting authorization updated notification with isAuthorized: %@", (uint8_t *)&v22, 0x16u);
      }
      v21 = +[HMFNotificationCenter defaultCenter];
      [v21 postNotificationName:@"HMFLocationAuthorizationUpdatedNotification" object:v17];
    }
  }
}

- (void)dealloc
{
  __HMFLocationAuthorizationStopMonitoring(self);
  v3.receiver = self;
  v3.super_class = (Class)HMFLocationAuthorization;
  [(HMFLocationAuthorization *)&v3 dealloc];
}

void __33__HMFLocationAuthorization__mark__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained locationOperationCompleted];
}

- (void)locationOperationCompleted
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x19F3A87A0](self, a2);
  id v4 = self;
  uint32_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = HMFGetLogIdentifier(v4);
    *(_DWORD *)buf = 138543362;
    objc_super v10 = v6;
    _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@completing location authorization mark", buf, 0xCu);
  }
  uint64_t v7 = [(HMFLocationAuthorization *)v4 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMFLocationAuthorization_locationOperationCompleted__block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = v4;
  dispatch_async(v7, block);
}

- (void)requestAuthorization:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMFLocationAuthorization *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMFLocationAuthorization_requestAuthorization_completionHandler___block_invoke;
  block[3] = &unk_1E5957B60;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 48));
    uint32_t v5 = v4;
    if (v4) {
      [v4 error];
    }
    else {
    id v6 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke_2;
    block[3] = &unk_1E59576C0;
    objc_copyWeak(&v9, v2);
    dispatch_async(v7, block);

    objc_destroyWeak(&v9);
  }
}

- (void)_mark
{
  objc_super v3 = [(HMFLocationAuthorization *)self queue];
  dispatch_assert_queue_V2(v3);

  if (!self->_operation)
  {
    id v4 = [(__HMFLocationManagerOperation *)[__HMFLocationAuthorizationMarkOperation alloc] initWithAuthorization:self];
    operation = self->_operation;
    self->_operation = v4;

    [(HMFOperation *)self->_operation setQualityOfService:17];
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __33__HMFLocationAuthorization__mark__block_invoke;
    id v10 = &unk_1E59576C0;
    objc_copyWeak(&v11, &location);
    [(__HMFLocationAuthorizationMarkOperation *)self->_operation setCompletionBlock:&v7];
    id v6 = -[HMFScheduler performOperation:](self->_scheduler, "performOperation:", self->_operation, v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_requestAuthorization:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(HMFLocationAuthorization *)self queue];
  dispatch_assert_queue_V2(v7);

  if (CoreLocationLibraryCore())
  {
    if (self->_request)
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:9 reason:@"Location authorization in progress"];
      if (v8)
      {
        id v9 = (void *)MEMORY[0x19F3A87A0]();
        id v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = HMFGetLogIdentifier(v10);
          *(_DWORD *)buf = 138543618;
          v28 = v12;
          __int16 v29 = 2112;
          v30 = v8;
          _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to request authorization with error: %@", buf, 0x16u);
        }
        if (v6) {
          v6[2](v6, v8);
        }
      }
    }
    else
    {
      v17 = [[__HMFLocationAuthorizationRequest alloc] initWithType:a3 authorization:self];
      [(HMFOperation *)v17 setQualityOfService:17];
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v17);
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke;
      int v22 = &unk_1E5957B88;
      objc_copyWeak(&v24, (id *)buf);
      v23 = v6;
      objc_copyWeak(&v25, &location);
      [(__HMFLocationAuthorizationRequest *)v17 setCompletionBlock:&v19];
      objc_storeStrong((id *)&self->_request, v17);
      id v18 = -[HMFScheduler performOperation:](self->_scheduler, "performOperation:", v17, v19, v20, v21, v22);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      uint64_t v8 = 0;
    }
    goto LABEL_13;
  }
  id v13 = (void *)MEMORY[0x19F3A87A0]();
  int v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = HMFGetLogIdentifier(v14);
    *(_DWORD *)buf = 138543362;
    v28 = v16;
    _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Location support not available, unable to request authorization", buf, 0xCu);
  }
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5 reason:@"CoreLocation not available"];
    v6[2](v6, v8);
LABEL_13:
  }
}

- (void)mark
{
  objc_super v3 = [(HMFLocationAuthorization *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMFLocationAuthorization_mark__block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)queue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_queue;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

uint64_t __47__HMFLocationAuthorization_sharedAuthorization__block_invoke()
{
  qword_1EB4EEA30 = objc_alloc_init(HMFLocationAuthorization);
  return MEMORY[0x1F41817F8]();
}

- (HMFLocationAuthorization)init
{
  v5.receiver = self;
  v5.super_class = (Class)HMFLocationAuthorization;
  id v2 = [(HMFLocationAuthorization *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    __HMFLocationAuthorizationInitialize(v2);
  }
  return v3;
}

- (HMFLocationAuthorization)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure(@"bundleIdentifier");
  }
  objc_super v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)HMFLocationAuthorization;
  id v6 = [(HMFLocationAuthorization *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    __HMFLocationAuthorizationInitialize(v6);
  }

  return v6;
}

- (HMFLocationAuthorization)initWithScheduler:(id)a3
{
  id v5 = a3;
  if (!v5) {
    _HMFPreconditionFailure(@"scheduler");
  }
  id v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)HMFLocationAuthorization;
  uint64_t v7 = [(HMFLocationAuthorization *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    __HMFLocationAuthorizationInitialize(v7);
    objc_storeStrong((id *)&v8->_scheduler, a3);
  }

  return v8;
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [HMFAttributeDescription alloc];
  id v5 = [NSNumber numberWithInteger:self->_state];
  id v6 = [(HMFAttributeDescription *)v4 initWithName:@"State" value:v5];
  v12[0] = v6;
  uint64_t v7 = [HMFAttributeDescription alloc];
  uint64_t v8 = [NSNumber numberWithInt:self->_status];
  id v9 = [(HMFAttributeDescription *)v7 initWithName:@"Status" value:v8];
  v12[1] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  os_unfair_lock_unlock(&p_lock->lock);
  return v10;
}

- (void)setQueue:(id)a3
{
  id obj = a3;
  os_unfair_lock_lock_with_options();
  if (self->_state >= 1)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot set queue once the location authorization has started." userInfo:0];
    objc_exception_throw(v5);
  }
  id v4 = obj;
  if (!obj)
  {
    id v4 = __HMFLocationAuthorizationCreateQueue(&self->super.super);
  }
  objc_storeStrong((id *)&self->_queue, v4);
  if (!obj) {

  }
  os_unfair_lock_unlock(&self->_lock.lock);
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier(v6);
      *(_DWORD *)buf = 138543618;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unregistering location authorization observer: %@", buf, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    observers = v6->_observers;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__HMFLocationAuthorization_unregisterObserver___block_invoke;
    v20[3] = &unk_1E5957B38;
    id v21 = v4;
    [(NSMutableSet *)observers objectsPassingTest:v20];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          [(NSMutableSet *)v6->_observers removeObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v11);
    }

    if ([(NSMutableSet *)v6->_observers hmf_isEmpty])
    {
      queue = v6->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__HMFLocationAuthorization_unregisterObserver___block_invoke_2;
      block[3] = &unk_1E5957698;
      void block[4] = v6;
      dispatch_async(queue, block);
    }

    os_unfair_lock_unlock(&v6->_lock.lock);
  }
}

BOOL __47__HMFLocationAuthorization_unregisterObserver___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 observedObject];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __47__HMFLocationAuthorization_unregisterObserver___block_invoke_2(uint64_t a1)
{
}

- (id)logIdentifier
{
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier || (bundleIdentifier = self->_bundlePath) != 0)
  {
    objc_super v3 = bundleIdentifier;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28F80] processInfo];
    objc_super v3 = [v5 processName];
  }
  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)bundlePath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

@end