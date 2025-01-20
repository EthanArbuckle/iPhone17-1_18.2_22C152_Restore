@interface __HMFLocationAuthorizationRequest
+ (id)logCategory;
- (__HMFLocationAuthorizationRequest)initWithAuthorization:(id)a3;
- (__HMFLocationAuthorizationRequest)initWithTimeout:(double)a3;
- (__HMFLocationAuthorizationRequest)initWithType:(int64_t)a3;
- (__HMFLocationAuthorizationRequest)initWithType:(int64_t)a3 authorization:(id)a4;
- (int64_t)type;
- (void)dealloc;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)unregisterFromKVO;
@end

@implementation __HMFLocationAuthorizationRequest

+ (id)logCategory
{
  if (_MergedGlobals_3_5 != -1) {
    dispatch_once(&_MergedGlobals_3_5, &__block_literal_global_20);
  }
  v2 = (void *)qword_1EB4EEAA0;
  return v2;
}

- (void)dealloc
{
  [(__HMFLocationAuthorizationRequest *)self unregisterFromKVO];
  v3.receiver = self;
  v3.super_class = (Class)__HMFLocationAuthorizationRequest;
  [(__HMFLocationManagerOperation *)&v3 dealloc];
}

- (void)unregisterFromKVO
{
  v5.receiver = self;
  v5.super_class = (Class)__HMFLocationAuthorizationRequest;
  [(__HMFLocationManagerOperation *)&v5 unregisterFromKVO];
  os_unfair_lock_lock_with_options();
  if (self->_registeredForKVO)
  {
    self->_registeredForKVO = 0;
    os_unfair_lock_unlock(&self->_lock);
    objc_super v3 = [(__HMFLocationManagerOperation *)self authorization];
    v4 = NSStringFromSelector(sel_isAuthorized);
    [v3 removeObserver:self forKeyPath:v4 context:HMFLocationAuthorizationRequestAuthorizedContext];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)main
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(__HMFLocationManagerOperation *)self authorization];
  v4 = NSStringFromSelector(sel_isAuthorized);
  [v3 addObserver:self forKeyPath:v4 options:0 context:HMFLocationAuthorizationRequestAuthorizedContext];

  os_unfair_lock_lock_with_options();
  self->_registeredForKVO = 1;
  os_unfair_lock_unlock(&self->_lock);
  objc_super v5 = [(__HMFLocationManagerOperation *)self authorization];
  int v6 = [v5 status];

  if (__HMFLocationAuthorizationHandleAuthorizationStatus(self, v6))
  {
    v7 = [(__HMFLocationManagerOperation *)self manager];
    v8 = (void *)MEMORY[0x19F3A87A0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier(v9);
        int v20 = 138543362;
        v21 = v12;
        _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Requesting authorization", (uint8_t *)&v20, 0xCu);
      }
      int64_t type = v9->_type;
      if (type == 2)
      {
        [v7 requestWhenInUseAuthorization];
      }
      else if (type == 1)
      {
        [v7 requestAlwaysAuthorization];
      }
      v9->_requested = 1;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier(v9);
        int v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing internal location manager", (uint8_t *)&v20, 0xCu);
      }
      v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Unexpected internal state."];
      [(HMFOperation *)v9 cancelWithError:v19];
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x19F3A87A0]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = HMFGetLogIdentifier(v15);
      int v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_19D57B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unable to request authorization", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (__HMFLocationAuthorizationRequest)initWithType:(int64_t)a3 authorization:(id)a4
{
  id v6 = a4;
  if (!v6) {
    _HMFPreconditionFailure(@"authorization");
  }
  v7 = v6;
  v11.receiver = self;
  v11.super_class = (Class)__HMFLocationAuthorizationRequest;
  v8 = [(__HMFLocationManagerOperation *)&v11 initWithAuthorization:v6];
  v9 = v8;
  if (v8) {
    v8->_int64_t type = a3;
  }

  return v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if ((void *)HMFLocationAuthorizationRequestAuthorizedContext == a6)
  {
    if ([(HMFOperation *)self isExecuting])
    {
      id v11 = [(__HMFLocationManagerOperation *)self authorization];
      if (v11 == v10)
      {
        v12 = [(HMFOperation *)self underlyingQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __84____HMFLocationAuthorizationRequest_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E5957730;
        block[4] = self;
        id v16 = v10;
        id v13 = v10;
        dispatch_async(v12, block);
      }
      else
      {
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)__HMFLocationAuthorizationRequest;
    [(__HMFLocationManagerOperation *)&v14 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (__HMFLocationAuthorizationRequest)initWithTimeout:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)__HMFLocationAuthorizationRequest;
  result = [(__HMFLocationManagerOperation *)&v4 initWithTimeout:a3];
  if (result) {
    result->_int64_t type = 2;
  }
  return result;
}

- (__HMFLocationAuthorizationRequest)initWithAuthorization:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)__HMFLocationAuthorizationRequest;
  result = [(__HMFLocationManagerOperation *)&v4 initWithAuthorization:a3];
  if (result) {
    result->_int64_t type = 2;
  }
  return result;
}

- (__HMFLocationAuthorizationRequest)initWithType:(int64_t)a3
{
  objc_super v5 = +[HMFLocationAuthorization sharedAuthorization];
  id v6 = [(__HMFLocationAuthorizationRequest *)self initWithType:a3 authorization:v5];

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

@end