@interface _HMMediaProfile
+ (BOOL)supportsSecureCoding;
- (HMMediaSession)mediaSession;
- (NSString)routeUID;
- (_HMMediaProfile)initWithCoder:(id)a3;
- (_HMMediaProfileDelegate)delegate;
- (unint64_t)capability;
- (void)__configureWithContext:(id)a3 accessory:(id)a4;
- (void)_notifyDelegateOfUpdatedMediaSession:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleRuntimeStateUpdate:(id)a3;
- (void)setCapability:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaSession:(id)a3;
- (void)setRouteUID:(id)a3;
@end

@implementation _HMMediaProfile

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeUID, 0);

  objc_storeStrong((id *)&self->_mediaSession, 0);
}

- (void)setDelegate:(id)a3
{
}

- (_HMMediaProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMMediaProfileDelegate *)WeakRetained;
}

- (void)handleRuntimeStateUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HMMediaProfile;
  id v4 = a3;
  [(_HMAccessoryProfile *)&v6 handleRuntimeStateUpdate:v4];
  v5 = [(_HMMediaProfile *)self mediaSession];
  [v5 updateMediaState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (_HMMediaProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HMMediaProfile;
  v5 = [(_HMAccessoryProfile *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMP.route-uid"];
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMP.sessionUUID"];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMP.session"];
    mediaSession = v5->_mediaSession;
    v5->_mediaSession = (HMMediaSession *)v10;

    v12 = v5->_mediaSession;
    if (v12)
    {
      [(HMMediaSession *)v12 setUuid:v9];
    }
    else
    {
      v13 = [[HMMediaSession alloc] initWithUUID:v9 routeUID:0 playbackState:0 shuffleState:0 repeatState:0 mediaUniqueIdentifier:0 sleepWakeState:0];
      v14 = v5->_mediaSession;
      v5->_mediaSession = v13;
    }
    if ([v4 containsValueForKey:@"HMMP.capabilities"]) {
      uint64_t v15 = [v4 decodeIntegerForKey:@"HMMP.capabilities"];
    }
    else {
      uint64_t v15 = 0;
    }
    v5->_capability = v15;
  }
  return v5;
}

- (void)setCapability:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_capability = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)capability
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t capability = self->_capability;
  os_unfair_lock_unlock(p_lock);
  return capability;
}

- (void)setRouteUID:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  routeUID = self->_routeUID;
  self->_routeUID = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)routeUID
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_routeUID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_notifyDelegateOfUpdatedMediaSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_HMAccessoryProfile *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56___HMMediaProfile__notifyDelegateOfUpdatedMediaSession___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      objc_super v17 = "-[_HMMediaProfile _notifyDelegateOfUpdatedMediaSession:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)setMediaSession:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaSession, a3);
    [(_HMMediaProfile *)self _notifyDelegateOfUpdatedMediaSession:v5];
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (HMMediaSession)mediaSession
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mediaSession;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", buf, 0x16u);
  }
  v14.receiver = v9;
  v14.super_class = (Class)_HMMediaProfile;
  [(_HMAccessoryProfile *)&v14 __configureWithContext:v6 accessory:v7];
  v12 = [(_HMMediaProfile *)v9 mediaSession];
  id v13 = [(_HMAccessoryProfile *)v9 messageTargetUUID];
  [v12 configure:v6 messageTargetUUID:v13];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end