@interface _HMCameraSnapshotControl
+ (id)logCategory;
- (HMCameraSnapshot)mostRecentSnapshot;
- (_HMCameraSnapshotControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 mostRecentSnapshot:(id)a5;
- (_HMCameraSnapshotControlDelegate)delegate;
- (void)__configureWithContext:(id)a3;
- (void)_fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4;
- (void)_handleCreateSnapshotWithBulletinContext:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_handleMostRecentSnapshot:(id)a3;
- (void)_handleMostRecentSnapshotUpdatedMessage:(id)a3;
- (void)_handleSnapshot:(id)a3 error:(id)a4 isMostRecent:(BOOL)a5;
- (void)_notifyDelegateOfDidTakeSnapshot:(id)a3 error:(id)a4;
- (void)_notifyDelegateOfMostRecentSnapshotUpdated;
- (void)_takeSnapshot;
- (void)fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4;
- (void)mergeNewSnapshotControl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMostRecentSnapshot:(id)a3;
- (void)takeSnapshot;
@end

@implementation _HMCameraSnapshotControl

- (_HMCameraSnapshotControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 mostRecentSnapshot:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_HMCameraSnapshotControl;
  v9 = [(_HMCameraControl *)&v12 initWithCameraProfile:a3 profileUniqueIdentifier:a4];
  v10 = v9;
  if (v8 && v9) {
    [(_HMCameraSnapshotControl *)v9 _handleMostRecentSnapshot:v8];
  }

  return v10;
}

- (void)__configureWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HMCameraSnapshotControl;
  [(_HMCameraControl *)&v14 __configureWithContext:v4];
  v5 = [(_HMCameraSnapshotControl *)self mostRecentSnapshot];

  if (v5)
  {
    v6 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [(_HMCameraSnapshotControl *)v7 mostRecentSnapshot];
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing with most recent snapshot: %@", buf, 0x16u);
    }
    v11 = [(_HMCameraSnapshotControl *)v7 mostRecentSnapshot];
    [v11 setContext:v4];
  }
  objc_super v12 = [(_HMCameraControl *)self context];
  v13 = [v12 messageDispatcher];
  [v13 registerForMessage:@"HMCameraSnapshotMostRecentSnapshotUpdatedMessage" receiver:self selector:sel__handleMostRecentSnapshotUpdatedMessage_];
}

- (HMCameraSnapshot)mostRecentSnapshot
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mostRecentSnapshot;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1) {
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global_6098);
  }
  v2 = (void *)logCategory__hmf_once_v21;

  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mostRecentSnapshot, 0);
}

- (void)_handleSnapshot:(id)a3 error:(id)a4 isMostRecent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    objc_super v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v29 = 138543618;
      v30 = v13;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Received error handling snapshot: %@", (uint8_t *)&v29, 0x16u);
    }
    [(_HMCameraSnapshotControl *)v11 _notifyDelegateOfDidTakeSnapshot:0 error:v9];
  }
  else
  {
    objc_super v14 = objc_msgSend(v8, "hmf_numberForKey:", @"kSlotIdentifierKey");
    v15 = objc_msgSend(v8, "hmf_dateForKey:", @"kSnapshotCaptureDate");
    v16 = objc_msgSend(v8, "hmf_numberForKey:", @"kSourceAspectRatioKey");
    if (v5
      && ([(_HMCameraSnapshotControl *)self mostRecentSnapshot],
          __int16 v17 = objc_claimAutoreleasedReturnValue(),
          [v17 slotIdentifier],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = HMFEqualObjects(),
          v18,
          v17,
          v19))
    {
      v20 = (void *)MEMORY[0x19F3A64A0]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Most recent snapshot is already equal", (uint8_t *)&v29, 0xCu);
      }
    }
    else
    {
      v24 = [HMCameraSnapshot alloc];
      v25 = [(_HMCameraControl *)self profileUniqueIdentifier];
      [v16 doubleValue];
      v26 = -[HMCameraSnapshot initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:](v24, "initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:", v25, v14, v15);

      v27 = [(_HMCameraControl *)self context];
      [(HMCameraSource *)v26 setContext:v27];

      [(_HMCameraSnapshotControl *)self setMostRecentSnapshot:v26];
      if (v5)
      {
        [(_HMCameraSnapshotControl *)self _notifyDelegateOfMostRecentSnapshotUpdated];
      }
      else
      {
        v28 = [(_HMCameraSnapshotControl *)self mostRecentSnapshot];
        [(_HMCameraSnapshotControl *)self _notifyDelegateOfDidTakeSnapshot:v28 error:0];
      }
    }
  }
}

- (void)_notifyDelegateOfDidTakeSnapshot:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HMCameraSnapshotControl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(_HMCameraControl *)self context];
    v10 = [v9 delegateCaller];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67___HMCameraSnapshotControl__notifyDelegateOfDidTakeSnapshot_error___block_invoke;
    v11[3] = &unk_1E5944F20;
    id v12 = v8;
    v13 = self;
    id v14 = v6;
    id v15 = v7;
    [v10 invokeBlock:v11];
  }
}

- (_HMCameraSnapshotControlDelegate)delegate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (_HMCameraSnapshotControlDelegate *)WeakRetained;
}

- (void)takeSnapshot
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(_HMCameraControl *)self context];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40___HMCameraSnapshotControl_takeSnapshot__block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = self;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v12 = v9;
      __int16 v13 = 2080;
      id v14 = "-[_HMCameraSnapshotControl takeSnapshot]";
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)_takeSnapshot
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(_HMCameraControl *)self context];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    BOOL v5 = [v4 UUIDString];

    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    id v8 = [(_HMCameraControl *)self profileUniqueIdentifier];
    id v9 = (void *)[v7 initWithTarget:v8];
    v26 = @"kCameraSessionID";
    v27 = v5;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v11 = (void *)[v6 initWithName:@"HMCameraSnapshotTakeSnapshotMessage" destination:v9 payload:v10];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __41___HMCameraSnapshotControl__takeSnapshot__block_invoke;
    v22[3] = &unk_1E5943088;
    objc_copyWeak(&v24, &location);
    id v12 = v5;
    id v23 = v12;
    __int16 v13 = (void *)MEMORY[0x19F3A64A0]([v11 setResponseHandler:v22]);
    id v14 = self;
    HMFGetOSLogHandle();
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v29 = v16;
      __int16 v30 = 2112;
      __int16 v31 = (const char *)v12;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending take snapshot message with session ID: %@", buf, 0x16u);
    }
    __int16 v17 = [v3 messageDispatcher];
    [v17 sendMessage:v11];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    int v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v29 = v21;
      __int16 v30 = 2080;
      __int16 v31 = "-[_HMCameraSnapshotControl _takeSnapshot]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)_handleMostRecentSnapshotUpdatedMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 messagePayload];
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Received most recent snapshot updated message payload: %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [v4 messagePayload];
  [(_HMCameraSnapshotControl *)v6 _handleMostRecentSnapshot:v10];
}

- (void)_handleCreateSnapshotWithBulletinContext:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = (HMCameraSnapshot *)a5;
  if (v8)
  {
    v10 = [(_HMCameraControl *)self context];
    int v11 = [v10 delegateCaller];
    id v12 = [v8 hmPublicError];
    [v11 callCompletion:v9 error:v12 snapshot:0];
  }
  else
  {
    v10 = objc_msgSend(v19, "hmf_numberForKey:", @"kSlotIdentifierKey");
    int v11 = objc_msgSend(v19, "hmf_dateForKey:", @"kSnapshotCaptureDate");
    id v12 = objc_msgSend(v19, "hmf_numberForKey:", @"kSourceAspectRatioKey");
    __int16 v13 = [HMCameraSnapshot alloc];
    id v14 = [(_HMCameraControl *)self profileUniqueIdentifier];
    [v12 doubleValue];
    uint64_t v15 = -[HMCameraSnapshot initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:](v13, "initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:", v14, v10, v11);

    v16 = [(_HMCameraControl *)self context];
    [(HMCameraSource *)v15 setContext:v16];

    __int16 v17 = [(_HMCameraControl *)self context];
    v18 = [v17 delegateCaller];
    [v18 callCompletion:v9 error:0 snapshot:v15];

    id v9 = v15;
  }
}

- (void)_notifyDelegateOfMostRecentSnapshotUpdated
{
  v3 = [(_HMCameraSnapshotControl *)self delegate];
  if ([v3 conformsToProtocol:&unk_1EEF4A718]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (objc_opt_respondsToSelector())
  {
    id v6 = [(_HMCameraControl *)self context];
    id v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70___HMCameraSnapshotControl__notifyDelegateOfMostRecentSnapshotUpdated__block_invoke;
    v8[3] = &unk_1E5945628;
    id v9 = v5;
    v10 = self;
    [v7 invokeBlock:v8];
  }
}

- (void)_handleMostRecentSnapshot:(id)a3
{
}

- (void)_fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HMCameraControl *)self context];
  if (!v7)
  {
    uint64_t v35 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMCameraSnapshotControl _fetchCameraSnapshotForBulletinContext:completionHandler:]", @"completion"];
    v36 = (void *)MEMORY[0x19F3A64A0]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v39;
      __int16 v50 = 2112;
      v51 = (const char *)v35;
      _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v35 userInfo:0];
    objc_exception_throw(v40);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    v10 = objc_msgSend(v6, "hmf_stringForKey:", @"kCameraSessionID");
    int v11 = objc_msgSend(v6, "hmf_stringForKey:", @"kSnapshotFilePath");
    uint64_t v12 = objc_msgSend(v6, "hmf_dateForKey:", @"kSnapshotCaptureDate");
    __int16 v13 = (void *)v12;
    if (v10 && v11 && v12)
    {
      v43 = v9;
      v41 = v7;
      id v14 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v42 = v6;
      id v15 = objc_alloc(MEMORY[0x1E4F65488]);
      v16 = [(_HMCameraControl *)self profileUniqueIdentifier];
      __int16 v17 = (void *)[v15 initWithTarget:v16];
      v46[0] = @"kCameraSessionID";
      v46[1] = @"kSnapshotFilePath";
      v47[0] = v10;
      v47[1] = v11;
      v46[2] = @"kSnapshotCaptureDate";
      v47[2] = v13;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
      id v19 = v14;
      id v7 = v41;
      v20 = (void *)[v19 initWithName:@"HMCameraSnapshotCreateSnapshotFromBulletinContextMessage" destination:v17 payload:v18];

      id v6 = v42;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __85___HMCameraSnapshotControl__fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke;
      v44[3] = &unk_1E5944EF0;
      v44[4] = self;
      id v45 = v41;
      v21 = (void *)MEMORY[0x19F3A64A0]([v20 setResponseHandler:v44]);
      v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v24;
        __int16 v50 = 2112;
        v51 = (const char *)v42;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending create snapshot message for bulletin context: %@", buf, 0x16u);
      }
      v25 = [v43 messageDispatcher];
      [v25 sendMessage:v20];

      id v9 = v43;
    }
    else
    {
      __int16 v30 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v31 = self;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v33;
        __int16 v50 = 2112;
        v51 = (const char *)v6;
        _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch camera snapshot for bulletin context: %@", buf, 0x16u);
      }
      v20 = [v9 delegateCaller];
      v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v20 callCompletion:v7 error:v34 snapshot:0];
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x19F3A64A0]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v29;
      __int16 v50 = 2080;
      v51 = "-[_HMCameraSnapshotControl _fetchCameraSnapshotForBulletinContext:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)mergeNewSnapshotControl:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 mostRecentSnapshot];
  id v6 = [(_HMCameraSnapshotControl *)self mostRecentSnapshot];
  id v7 = [v6 slotIdentifier];
  uint64_t v8 = [v5 slotIdentifier];
  char v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    int v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v13;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating most recent snapshot to %@", buf, 0x16u);
    }
    id v14 = [(_HMCameraControl *)v11 context];
    [v5 setContext:v14];

    [(_HMCameraSnapshotControl *)v11 setMostRecentSnapshot:v5];
    id v15 = [(_HMCameraControl *)v11 context];
    v16 = [v15 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52___HMCameraSnapshotControl_mergeNewSnapshotControl___block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = v11;
    dispatch_async(v16, block);
  }
}

- (void)fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HMCameraControl *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMCameraSnapshotControl fetchCameraSnapshotForBulletinContext:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  char v9 = v8;
  if (v8)
  {
    v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84___HMCameraSnapshotControl_fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    int v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2080;
      v28 = "-[_HMCameraSnapshotControl fetchCameraSnapshotForBulletinContext:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
  }
}

- (void)setMostRecentSnapshot:(id)a3
{
  id v4 = (HMCameraSnapshot *)a3;
  os_unfair_lock_lock_with_options();
  mostRecentSnapshot = self->_mostRecentSnapshot;
  self->_mostRecentSnapshot = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

@end