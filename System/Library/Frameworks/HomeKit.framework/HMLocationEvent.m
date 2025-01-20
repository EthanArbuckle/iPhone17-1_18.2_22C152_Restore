@interface HMLocationEvent
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
- (BOOL)mergeFromNewObject:(id)a3;
- (CLRegion)region;
- (HMFLocationAuthorization)authorization;
- (HMLocationEvent)initWithCoder:(id)a3;
- (HMLocationEvent)initWithDict:(id)a3 region:(id)a4;
- (HMLocationEvent)initWithRegion:(CLRegion *)region;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)locationAuthorization;
- (void)__configureWithContext:(id)a3 eventTrigger:(id)a4;
- (void)_handleLocationAuthorizationUpdatedNotification:(id)a3;
- (void)_retrieveLocationEvent;
- (void)_unconfigure;
- (void)_updateFromDictionary:(id)a3;
- (void)setLocationAuthorization:(int64_t)a3;
- (void)setRegion:(id)a3;
- (void)updateRegion:(CLRegion *)region completionHandler:(void *)completion;
@end

@implementation HMLocationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (HMFLocationAuthorization)authorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 64, 1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HMMutableLocationEvent alloc];
  v5 = [(HMLocationEvent *)self region];
  v6 = [(HMLocationEvent *)v4 initWithRegion:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "hm_regionFromDataForKey:", @"kLocationEventRegionKey");
  v6 = [[HMLocationEvent alloc] initWithDict:v4 region:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMLocationEvent alloc];
  v5 = [(HMLocationEvent *)self region];
  v6 = [(HMLocationEvent *)v4 initWithRegion:v5];

  return v6;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMLocationEvent;
  LOBYTE(v5) = [(HMEvent *)&v15 mergeFromNewObject:v4];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [(HMLocationEvent *)self region];
    v10 = [v8 region];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      v12 = [v8 region];
      [(HMLocationEvent *)self setRegion:v12];

      v13 = [(HMLocationEvent *)self region];
      int v5 = HMFEqualObjects() ^ 1;
    }
  }

  return v5;
}

- (HMLocationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMLocationEvent;
  int v5 = [(HMEvent *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.locationEventRegion"];
    _initLocationEventWithRegion(v5, v6);
  }
  return v5;
}

- (void)_handleLocationAuthorizationUpdatedNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HMEvent *)self context];
  if (v5)
  {
    id v6 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    char v9 = [v8 isAuthorized];
    v10 = [v5 queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__HMLocationEvent__handleLocationAuthorizationUpdatedNotification___block_invoke;
    v15[3] = &unk_1E59413F8;
    char v16 = v9;
    v15[4] = self;
    dispatch_async(v10, v15);
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      __int16 v19 = 2080;
      v20 = "-[HMLocationEvent _handleLocationAuthorizationUpdatedNotification:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __67__HMLocationEvent__handleLocationAuthorizationUpdatedNotification___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  if ([*(id *)(a1 + 32) locationAuthorization] != v3)
  {
    [*(id *)(a1 + 32) setLocationAuthorization:v3];
    id v4 = *(void **)(a1 + 32);
    if (v2)
    {
      [v4 _retrieveLocationEvent];
    }
    else
    {
      [v4 setRegion:0];
      id v5 = [*(id *)(a1 + 32) eventTrigger];
      [v5 setLastFireDate:0];
    }
  }
}

- (void)_updateFromDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMLocationEvent;
  [(HMEvent *)&v13 _updateFromDictionary:v4];
  id v5 = objc_msgSend(v4, "hmf_dataForKey:", @"kLocationEventRegionKey");
  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v12];
    id v7 = v12;
    if (v6)
    {
      [(HMLocationEvent *)self setRegion:v6];
    }
    else
    {
      id v8 = (void *)MEMORY[0x19F3A64A0]();
      char v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        objc_super v15 = v11;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from encoded data: %@", buf, 0x16u);
      }
    }
  }
}

- (id)_serializeForAdd
{
  v9.receiver = self;
  v9.super_class = (Class)HMLocationEvent;
  uint64_t v3 = [(HMEvent *)&v9 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(HMLocationEvent *)self region];
  id v6 = encodeRootObject(v5);
  [v4 setObject:v6 forKeyedSubscript:@"kLocationEventRegionKey"];

  id v7 = (void *)[v4 copy];

  return v7;
}

- (void)_retrieveLocationEvent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMEvent *)self context];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v5 = objc_alloc(MEMORY[0x1E4F65488]);
    id v6 = [(HMEvent *)self uuid];
    id v7 = (void *)[v5 initWithTarget:v6];
    id v8 = (void *)[v4 initWithName:@"kRetrieveLocationEventRequestKey" destination:v7 payload:0];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__HMLocationEvent__retrieveLocationEvent__block_invoke;
    v14[3] = &unk_1E5943FA0;
    v14[4] = self;
    [v8 setResponseHandler:v14];
    objc_super v9 = [v3 messageDispatcher];
    [v9 sendMessage:v8];
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    char v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2080;
      uint64_t v18 = "-[HMLocationEvent _retrieveLocationEvent]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __41__HMLocationEvent__retrieveLocationEvent__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend(v4, "hm_regionFromDataForKey:", @"kLocationEventRegionKey");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setRegion:v8];
  id v5 = [*(id *)(a1 + 32) eventTrigger];
  id v6 = objc_msgSend(v4, "hmf_dateForKey:", @"kTriggerLastFireDateKey");

  [v5 setLastFireDate:v6];
  id v7 = [v5 home];
  [v7 _notifyDelegateOfTriggerUpdated:v5];
}

- (void)updateRegion:(CLRegion *)region completionHandler:(void *)completion
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = region;
  id v7 = completion;
  uint64_t v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v30 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMLocationEvent updateRegion:completionHandler:]", @"completion"];
    v31 = (void *)MEMORY[0x19F3A64A0]();
    v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v34;
      __int16 v44 = 2112;
      v45 = (const char *)v30;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    objc_exception_throw(v35);
  }
  objc_super v9 = (void *)v8;
  if (v8)
  {
    if ((HMIsValidRegion(v6) & 1) == 0)
    {
      v36 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v37 = *MEMORY[0x1E4F1C3C8];
      v38 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:3];
      id v39 = [v36 exceptionWithName:v37 reason:v38 userInfo:0];

      objc_exception_throw(v39);
    }
    v10 = [(HMEvent *)self eventTrigger];
    char v11 = v10;
    if (!v10 || ([v10 home], id v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
      uint64_t v19 = [v9 delegateCaller];
      v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v19 callCompletion:v7 error:v20];

LABEL_11:
      goto LABEL_19;
    }
    objc_super v13 = [(HMLocationEvent *)self region];
    int v14 = [v13 isEqual:v6];

    if (v14)
    {
      objc_super v15 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v18;
        __int16 v44 = 2112;
        v45 = (const char *)v6;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Region is already %@", buf, 0x16u);
      }
      uint64_t v19 = [v9 delegateCaller];
      [v19 callCompletion:v7 error:0];
      goto LABEL_11;
    }
    uint64_t v25 = encodeRootObject(v6);
    v26 = (void *)v25;
    if (v25)
    {
      v40 = @"kLocationEventRegionKey";
      uint64_t v41 = v25;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      [(HMEvent *)self _updateEventWithPayload:v27 completionHandler:v7];
    }
    else
    {
      v28 = [v9 delegateCaller];
      v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v28 callCompletion:v7 error:v29];
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v24;
      __int16 v44 = 2080;
      v45 = "-[HMLocationEvent updateRegion:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v11);
  }
LABEL_19:
}

- (void)setRegion:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_locationAuthorization == 2) {
    id v4 = 0;
  }
  else {
    id v4 = (CLRegion *)v6;
  }
  region = self->_region;
  self->_region = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (CLRegion)region
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_region;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)__configureWithContext:(id)a3 eventTrigger:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMLocationEvent;
  [(HMEvent *)&v18 __configureWithContext:a3 eventTrigger:v6];
  if (a3)
  {
    id v7 = [v6 home];
    uint64_t v8 = [v7 homeManager];
    objc_super v9 = [v8 configuration];
    v10 = [v9 locationAuthorization];

    if (v10)
    {
      char v11 = self;
      id v12 = v10;
      objc_super v13 = v11->_authorization;
      if (v13 != v12)
      {
        objc_storeStrong((id *)&v11->_authorization, v10);
        int v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v15 = *MEMORY[0x1E4F64EF0];
        [v14 addObserver:v11 selector:sel__handleLocationAuthorizationUpdatedNotification_ name:*MEMORY[0x1E4F64EF0] object:v12];

        [(HMFLocationAuthorization *)v12 registerObserver:v11];
        if (v13)
        {
          [(HMFLocationAuthorization *)v13 unregisterObserver:v11];
          __int16 v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v16 removeObserver:v11 name:v15 object:v13];
        }
      }
    }
    else
    {
      id v12 = self->_authorization;
    }
    if (([(HMFLocationAuthorization *)v12 isAuthorized] & 1) == 0)
    {
      [(HMLocationEvent *)self setLocationAuthorization:2];
      [(HMLocationEvent *)self setRegion:0];
      __int16 v17 = [v6 lastFireDate];

      if (v17) {
        [v6 setLastFireDate:0];
      }
    }
  }
}

- (void)_unconfigure
{
  v3.receiver = self;
  v3.super_class = (Class)HMLocationEvent;
  [(HMEvent *)&v3 _unconfigure];
  [(HMFLocationAuthorization *)self->_authorization unregisterObserver:self];
}

- (HMLocationEvent)initWithRegion:(CLRegion *)region
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = region;
  if ((HMIsValidRegion(v4) & 1) == 0)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    char v11 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:3];
    id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }
  objc_super v13 = @"kEventUUIDKey";
  id v5 = [MEMORY[0x1E4F29128] UUID];
  v14[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v7 = [(HMLocationEvent *)self initWithDict:v6 region:v4];

  return v7;
}

- (HMLocationEvent)initWithDict:(id)a3 region:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMLocationEvent;
  id v7 = [(HMEvent *)&v10 initWithDict:a3];
  uint64_t v8 = v7;
  if (v7) {
    _initLocationEventWithRegion(v7, v6);
  }

  return v8;
}

@end