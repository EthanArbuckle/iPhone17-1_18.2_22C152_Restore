@interface HMFKeyValueBlockObserver
+ (id)logCategory;
- (BOOL)__invalidate;
- (HMFKeyValueBlockObserver)init;
- (HMFKeyValueBlockObserver)initWithKeyPath:(id)a3 object:(id)a4;
- (HMFKeyValueBlockObserver)initWithKeyPath:(id)a3 object:(id)a4 options:(unint64_t)a5;
- (NSString)keyPath;
- (id)handler;
- (id)logIdentifier;
- (id)observedObject;
- (unint64_t)options;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHandler:(id)a3;
@end

@implementation HMFKeyValueBlockObserver

- (HMFKeyValueBlockObserver)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFKeyValueBlockObserver)initWithKeyPath:(id)a3 object:(id)a4
{
  return [(HMFKeyValueBlockObserver *)self initWithKeyPath:a3 object:a4 options:0];
}

- (HMFKeyValueBlockObserver)initWithKeyPath:(id)a3 object:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    _HMFPreconditionFailure(@"keyPath");
  }
  if (!v9) {
    _HMFPreconditionFailure(@"object");
  }
  id v10 = v9;
  objc_opt_class();
  int v11 = objc_opt_isKindOfClass() & 1;
  if (v11) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (!v11)
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"The observed object must be an NSObject." userInfo:0];
    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMFKeyValueBlockObserver;
  v14 = [(HMFKeyValueBlockObserver *)&v19 init];
  if (v14)
  {
    uint64_t v15 = [v8 copy];
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v15;

    objc_storeWeak(&v14->_observedObject, v10);
    v14->_options = a5;
    v14->_valid = 1;
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x19F3A87A0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier(v4);
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Deallocating", buf, 0xCu);
  }
  [(HMFKeyValueBlockObserver *)v4 __invalidate];
  v7.receiver = v4;
  v7.super_class = (Class)HMFKeyValueBlockObserver;
  [(HMFKeyValueBlockObserver *)&v7 dealloc];
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x19F3A87A0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier(v4);
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating", (uint8_t *)&v12, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  BOOL v7 = [(HMFKeyValueBlockObserver *)v4 __invalidate];
  os_unfair_lock_unlock(&v4->_lock);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x19F3A87A0]();
    id v9 = v4;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = HMFGetLogIdentifier(v9);
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Invalidated", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)__invalidate
{
  BOOL valid = self->_valid;
  if (self->_valid)
  {
    id handler = self->_handler;
    self->_id handler = 0;

    self->_BOOL valid = 0;
  }
  if (self->_observing)
  {
    self->_observing = 0;
    id WeakRetained = objc_loadWeakRetained(&self->_observedObject);
    [WeakRetained removeObserver:self forKeyPath:self->_keyPath context:HMFKeyValueBlockObserverContext];
  }
  return valid;
}

- (id)handler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x19F3A8A20](self->_handler);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v5 = v4 == 0;
  if (v4 && !self->_valid)
  {
    os_unfair_lock_unlock(&self->_lock);
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot set a handler on an invalidated observer." userInfo:0];
    objc_exception_throw(v21);
  }
  if (self->_handler != v4)
  {
    v6 = (void *)MEMORY[0x19F3A8A20](v4);
    id handler = self->_handler;
    self->_id handler = v6;

    if (v4)
    {
      if (!self->_observing)
      {
        BOOL v8 = 1;
LABEL_8:
        BOOL v9 = v4 != 0;
        self->_observing = v8;
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v8 = 0;
      if (self->_observing) {
        goto LABEL_8;
      }
    }
  }
  BOOL v5 = 0;
  BOOL v9 = 0;
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v10 = [(HMFKeyValueBlockObserver *)self observedObject];
  if (v10)
  {
    if (v9)
    {
      int v11 = (void *)MEMORY[0x19F3A87A0]();
      int v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier(v12);
        int v22 = 138543362;
        v23 = v14;
        _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_INFO, "%{public}@Registering", (uint8_t *)&v22, 0xCu);
      }
      uint64_t v15 = [(HMFKeyValueBlockObserver *)v12 keyPath];
      uint64_t v16 = [(HMFKeyValueBlockObserver *)v12 options];
      [v10 addObserver:v12 forKeyPath:v15 options:v16 context:HMFKeyValueBlockObserverContext];
LABEL_19:

      goto LABEL_20;
    }
    if (v5)
    {
      v17 = (void *)MEMORY[0x19F3A87A0]();
      id v18 = self;
      objc_super v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier(v18);
        int v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_INFO, "%{public}@Unregistering", (uint8_t *)&v22, 0xCu);
      }
      uint64_t v15 = [(HMFKeyValueBlockObserver *)v18 keyPath];
      [v10 removeObserver:v18 forKeyPath:v15 context:HMFKeyValueBlockObserverContext];
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)HMFKeyValueBlockObserverContext == a6)
  {
    id v13 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = HMFGetLogIdentifier(v14);
      *(_DWORD *)buf = 138543618;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Received change: %@", buf, 0x16u);
    }
    if ([v10 isEqualToString:v14->_keyPath])
    {
      uint64_t v17 = [(HMFKeyValueBlockObserver *)v14 handler];
      id v18 = (void *)v17;
      if (v17) {
        (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v11, v12);
      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMFKeyValueBlockObserver;
    [(HMFKeyValueBlockObserver *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

+ (id)logCategory
{
  if (_MergedGlobals_3_19 != -1) {
    dispatch_once(&_MergedGlobals_3_19, &__block_literal_global_50);
  }
  v2 = (void *)qword_1EB4EEBF0;
  return v2;
}

uint64_t __39__HMFKeyValueBlockObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"KVO.observer", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEBF0;
  qword_1EB4EEBF0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)logIdentifier
{
  return self->_keyPath;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)observedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_observedObject);
  return WeakRetained;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observedObject);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end