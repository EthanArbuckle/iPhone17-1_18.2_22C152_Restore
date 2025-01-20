@interface HMDHomeInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isAccepted;
- (BOOL)isDeclined;
- (BOOL)isExpired;
- (BOOL)isPending;
- (BOOL)refreshDisplayName;
- (HMDHome)home;
- (HMDHomeInvitation)initWithCoder:(id)a3;
- (HMDHomeInvitation)initWithCoder:(id)a3 invitationData:(id)a4;
- (HMDHomeInvitation)initWithInvitationData:(id)a3 forHome:(id)a4;
- (HMFTimer)timer;
- (HMHomeInvitationData)invitationData;
- (NSArray)operations;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (id)describeWithFormat;
- (id)expirationHandler;
- (id)resolutionHandler;
- (int64_t)invitationState;
- (void)_clearTimer;
- (void)_configureTimer;
- (void)_resolve:(BOOL)a3;
- (void)accept;
- (void)decline;
- (void)encodeWithCoder:(id)a3;
- (void)expire;
- (void)setClientQueue:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setExpirationHandler:(id)a3;
- (void)setHome:(id)a3;
- (void)setInvitationData:(id)a3;
- (void)setInvitationState:(int64_t)a3;
- (void)setOperations:(id)a3;
- (void)setResolutionHandler:(id)a3;
- (void)setTimer:(id)a3;
- (void)updateInvitationState:(int64_t)a3;
- (void)updateTimer:(unint64_t)a3 clientQueue:(id)a4;
@end

@implementation HMDHomeInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong(&self->_resolutionHandler, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (void)setOperations:(id)a3
{
}

- (NSArray)operations
{
  return self->_operations;
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setExpirationHandler:(id)a3
{
}

- (id)expirationHandler
{
  return self->_expirationHandler;
}

- (void)setResolutionHandler:(id)a3
{
}

- (id)resolutionHandler
{
  return self->_resolutionHandler;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setInvitationData:(id)a3
{
}

- (HMHomeInvitationData)invitationData
{
  return self->_invitationData;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setInvitationState:(int64_t)a3
{
  self->_invitationState = a3;
}

- (id)describeWithFormat
{
  v3 = NSString;
  v4 = [(HMDHomeInvitation *)self identifier];
  v5 = [v4 UUIDString];
  v6 = [(HMDHomeInvitation *)self startDate];
  v7 = [(HMDHomeInvitation *)self endDate];
  v8 = objc_msgSend(MEMORY[0x1E4F2E818], "homeInvitationStateDescription:", -[HMDHomeInvitation invitationState](self, "invitationState"));
  v9 = [(HMDHomeInvitation *)self home];
  v10 = [v9 name];
  v11 = [v3 stringWithFormat:@"(IV), identifier = %@, startDate = %@, endDate = %@, state = %@, home = %@  ", v5, v6, v7, v8, v10];

  return v11;
}

- (void)_resolve:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(HMDHomeInvitation *)self isPending])
  {
    if (v3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 4;
    }
    [(HMDHomeInvitation *)self updateInvitationState:v5];
    v6 = [(HMDHomeInvitation *)self clientQueue];

    if (v6)
    {
      objc_initWeak((id *)location, self);
      v7 = [(HMDHomeInvitation *)self clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__HMDHomeInvitation__resolve___block_invoke;
      block[3] = &unk_1E6A13588;
      objc_copyWeak(&v13, (id *)location);
      BOOL v14 = v3;
      block[4] = self;
      dispatch_async(v7, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v8 = (void *)MEMORY[0x1D9452090]();
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = HMFGetLogIdentifier();
        v11 = [(HMDHomeInvitation *)self identifier];
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v10;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Not calling invitation (%@) resolution handler, no client queue set", location, 0x16u);
      }
      [(HMDHomeInvitation *)self _clearTimer];
    }
  }
}

void __30__HMDHomeInvitation__resolve___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    BOOL v3 = [WeakRetained resolutionHandler];

    id WeakRetained = v5;
    if (v3)
    {
      v4 = [v5 resolutionHandler];
      v4[2](v4, *(unsigned __int8 *)(a1 + 48));

      [*(id *)(a1 + 32) _clearTimer];
      id WeakRetained = v5;
    }
  }
}

- (void)_clearTimer
{
  BOOL v3 = [(HMDHomeInvitation *)self timer];

  if (v3)
  {
    v4 = [(HMDHomeInvitation *)self timer];
    [v4 suspend];

    [(HMDHomeInvitation *)self setTimer:0];
  }
  [(HMDHomeInvitation *)self setClientQueue:0];
  [(HMDHomeInvitation *)self setResolutionHandler:0];
  [(HMDHomeInvitation *)self setExpirationHandler:0];
}

- (void)_configureTimer
{
  BOOL v3 = [(HMDHomeInvitation *)self endDate];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 <= 3.0)
  {
    [(HMDHomeInvitation *)self expire];
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v6];
    [(HMDHomeInvitation *)self setTimer:v7];

    v8 = [(HMDHomeInvitation *)self timer];
    [v8 setDelegate:self];

    id v9 = [(HMDHomeInvitation *)self timer];
    [v9 resume];
  }
}

- (void)expire
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(HMDHomeInvitation *)self isPending])
  {
    [(HMDHomeInvitation *)self updateInvitationState:6];
    BOOL v3 = [(HMDHomeInvitation *)self clientQueue];

    if (v3)
    {
      objc_initWeak((id *)location, self);
      v4 = [(HMDHomeInvitation *)self clientQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __27__HMDHomeInvitation_expire__block_invoke;
      v9[3] = &unk_1E6A16CE0;
      objc_copyWeak(&v10, (id *)location);
      v9[4] = self;
      dispatch_async(v4, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)location);
    }
    else
    {
      double v5 = (void *)MEMORY[0x1D9452090]();
      double v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = HMFGetLogIdentifier();
        v8 = [(HMDHomeInvitation *)self identifier];
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v7;
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Not calling invitation (%@) expiration handler, no client queue set", location, 0x16u);
      }
      [(HMDHomeInvitation *)self _clearTimer];
    }
  }
}

void __27__HMDHomeInvitation_expire__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained expirationHandler],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    double v5 = (void *)MEMORY[0x1D9452090]();
    double v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = HMFGetLogIdentifier();
      v8 = [*(id *)(a1 + 32) identifier];
      int v14 = 138543618;
      v15 = v7;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Calling invitation (%@) expiration handler", (uint8_t *)&v14, 0x16u);
    }
    id v9 = [v3 expirationHandler];
    v9[2]();
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 32) identifier];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Not calling invitation (%@) expiration handler, not set", (uint8_t *)&v14, 0x16u);
    }
  }
  [*(id *)(a1 + 32) _clearTimer];
}

- (void)decline
{
}

- (void)accept
{
}

- (void)updateTimer:(unint64_t)a3 clientQueue:(id)a4
{
  id v6 = a4;
  id v9 = [(HMDHomeInvitation *)self resolutionHandler];
  v7 = [(HMDHomeInvitation *)self expirationHandler];
  [(HMDHomeInvitation *)self _clearTimer];
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)a3];
  [(HMDHomeInvitation *)self setEndDate:v8];

  [(HMDHomeInvitation *)self _configureTimer];
  [(HMDHomeInvitation *)self setClientQueue:v6];

  [(HMDHomeInvitation *)self setResolutionHandler:v9];
  [(HMDHomeInvitation *)self setExpirationHandler:v7];
}

- (void)updateInvitationState:(int64_t)a3
{
  id v4 = [(HMDHomeInvitation *)self invitationData];
  [v4 setInvitationState:a3];
}

- (BOOL)isDeclined
{
  return [(HMDHomeInvitation *)self invitationState] == 4;
}

- (BOOL)isAccepted
{
  return [(HMDHomeInvitation *)self invitationState] == 3
      || [(HMDHomeInvitation *)self invitationState] == 5;
}

- (BOOL)isPending
{
  return [(HMDHomeInvitation *)self invitationState] == 2
      || [(HMDHomeInvitation *)self invitationState] == 5;
}

- (BOOL)isExpired
{
  return [(HMDHomeInvitation *)self invitationState] == 6;
}

- (int64_t)invitationState
{
  v2 = [(HMDHomeInvitation *)self invitationData];
  int64_t v3 = [v2 invitationState];

  return v3;
}

- (void)setEndDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeInvitation *)self invitationData];
  [v5 setEndDate:v4];
}

- (NSDate)endDate
{
  v2 = [(HMDHomeInvitation *)self invitationData];
  int64_t v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (NSDate)startDate
{
  v2 = [(HMDHomeInvitation *)self invitationData];
  int64_t v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (NSUUID)identifier
{
  v2 = [(HMDHomeInvitation *)self invitationData];
  int64_t v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeInvitation *)self home];
  [v4 encodeConditionalObject:v5 forKey:@"home"];

  id v6 = [(HMDHomeInvitation *)self invitationData];
  [v4 encodeObject:v6 forKey:@"HM.invitationData"];
}

- (HMDHomeInvitation)initWithCoder:(id)a3 invitationData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"home"];

  id v9 = [(HMDHomeInvitation *)self initWithInvitationData:v6 forHome:v8];
  return v9;
}

- (HMDHomeInvitation)initWithCoder:(id)a3
{
  return [(HMDHomeInvitation *)self initWithCoder:a3 invitationData:0];
}

- (BOOL)refreshDisplayName
{
  return 0;
}

- (HMDHomeInvitation)initWithInvitationData:(id)a3 forHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeInvitation;
  id v9 = [(HMDHomeInvitation *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_invitationData, a3);
    objc_storeWeak((id *)&v10->_home, v8);
    [(HMDHomeInvitation *)v10 _configureTimer];
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end