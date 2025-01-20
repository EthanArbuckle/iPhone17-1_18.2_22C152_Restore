@interface __HMFLocationManagerOperation
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)logCategory;
+ (void)initialize;
- (BOOL)isReady;
- (CLLocationManager)manager;
- (HMFLocationAuthorization)authorization;
- (__HMFLocationManagerOperation)initWithAuthorization:(id)a3;
- (__HMFLocationManagerOperation)initWithTimeout:(double)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)unregisterFromKVO;
@end

@implementation __HMFLocationManagerOperation

- (void)dealloc
{
  [(__HMFLocationManagerOperation *)self unregisterFromKVO];
  v3.receiver = self;
  v3.super_class = (Class)__HMFLocationManagerOperation;
  [(__HMFLocationManagerOperation *)&v3 dealloc];
}

- (void)unregisterFromKVO
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_registeredForKVO)
  {
    self->_registeredForKVO = 0;
    os_unfair_lock_unlock(p_lock);
    authorization = self->_authorization;
    NSStringFromSelector(sel_isMonitoring);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(HMFLocationAuthorization *)authorization removeObserver:self forKeyPath:v5 context:HMFLocationManagerOperationMonitoringContext];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)HMFLocationManagerOperationMonitoringContext == a6)
  {
    id v13 = [(__HMFLocationManagerOperation *)self authorization];
    if (v13 == v11)
    {
      if ([v11 isMonitoring])
      {
        v14 = (void *)MEMORY[0x19F3A87A0]();
        v15 = self;
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = HMFGetLogIdentifier(v15);
          *(_DWORD *)buf = 138543362;
          v24 = v17;
          _os_log_impl(&dword_19D57B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Marking as ready", buf, 0xCu);
        }
        v18 = NSStringFromSelector(sel_isReady);
        [(__HMFLocationManagerOperation *)v15 willChangeValueForKey:v18];

        os_unfair_lock_lock_with_options();
        v15->_ready = 1;
        uint64_t v19 = [v11 internal];
        manager = v15->_manager;
        v15->_manager = (CLLocationManager *)v19;

        os_unfair_lock_unlock(&v15->_lock);
        v21 = NSStringFromSelector(sel_isReady);
        [(__HMFLocationManagerOperation *)v15 didChangeValueForKey:v21];
      }
    }
    else
    {
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)__HMFLocationManagerOperation;
    [(__HMFLocationManagerOperation *)&v22 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (HMFLocationAuthorization)authorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 328, 1);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"ready"] & 1) != 0
    || (NSStringFromSelector(sel_isReady),
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqualToString:v5],
        v5,
        (v6 & 1) != 0))
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS_____HMFLocationManagerOperation;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

- (BOOL)isReady
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL ready = self->_ready;
  os_unfair_lock_unlock(p_lock);
  if (!ready) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)__HMFLocationManagerOperation;
  return [(__HMFLocationManagerOperation *)&v6 isReady];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (__HMFLocationManagerOperation)initWithAuthorization:(id)a3
{
  id v5 = a3;
  if (!v5) {
    _HMFPreconditionFailure(@"authorization");
  }
  objc_super v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)__HMFLocationManagerOperation;
  unsigned __int8 v7 = [(HMFOperation *)&v10 initWithTimeout:0.0];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_authorization, a3);
    __HMFLocationManagerOperationStartMonitoring(v8);
  }

  return v8;
}

+ (void)initialize
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v2 = (void *)getCLLocationManagerClass_softClass_0;
  uint64_t v8 = getCLLocationManagerClass_softClass_0;
  if (!getCLLocationManagerClass_softClass_0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getCLLocationManagerClass_block_invoke_0;
    v4[3] = &unk_1E5957BB0;
    v4[4] = &v5;
    __getCLLocationManagerClass_block_invoke_0((uint64_t)v4);
    v2 = (void *)v6[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v5, 8);
}

- (CLLocationManager)manager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_manager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (__HMFLocationManagerOperation)initWithTimeout:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)__HMFLocationManagerOperation;
  id v3 = [(HMFOperation *)&v7 initWithTimeout:a3];
  if (v3)
  {
    uint64_t v4 = +[HMFLocationAuthorization sharedAuthorization];
    authorization = v3->_authorization;
    v3->_authorization = (HMFLocationAuthorization *)v4;

    __HMFLocationManagerOperationStartMonitoring(v3);
  }
  return v3;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_17 != -1) {
    dispatch_once(&_MergedGlobals_3_17, &__block_literal_global_47);
  }
  v2 = (void *)qword_1EB4EEBD0;
  return v2;
}

@end