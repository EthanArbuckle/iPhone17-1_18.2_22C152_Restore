@interface _HMTelevisionProfile
- (BOOL)isMediaSourceDisplayOrderModifiable;
- (BOOL)mediaSourceDisplayOrderModifiable;
- (NSArray)mediaSourceDisplayOrder;
- (_HMTelevisionProfile)initWithTelevisionService:(id)a3 linkedServices:(id)a4;
- (_HMTelevisionProfileDelegate)delegate;
- (id)messageDestination;
- (id)messageTargetUUID;
- (void)_handleSourceDisplayOrderUpdated:(id)a3;
- (void)_notifyDelegateOfUpdatedSourceDisplayOrder:(id)a3;
- (void)_registerNotificationHandlers;
- (void)setDelegate:(id)a3;
- (void)setMediaSourceDisplayOrder:(id)a3;
- (void)updateMediaSourceDisplayOrder:(id)a3 completionHandler:(id)a4;
@end

@implementation _HMTelevisionProfile

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, 0);
}

- (void)setDelegate:(id)a3
{
}

- (_HMTelevisionProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMTelevisionProfileDelegate *)WeakRetained;
}

- (BOOL)mediaSourceDisplayOrderModifiable
{
  return *(&self->_mediaSourceDisplayOrderModifiable + 4);
}

- (void)_handleSourceDisplayOrderUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(_HMAccessoryProfile *)self context];
  id v12 = [v5 pendingRequests];

  v6 = [v4 identifier];
  v7 = [v12 removeCompletionBlockForIdentifier:v6];

  v8 = [v4 arrayForKey:@"source-display-order"];

  v9 = [(_HMTelevisionProfile *)self mediaSourceDisplayOrder];
  [(_HMTelevisionProfile *)self setMediaSourceDisplayOrder:v8];
  if (v7)
  {
    v10 = [(_HMAccessoryProfile *)self context];
    v11 = [v10 delegateCaller];
    [v11 callCompletion:v7 error:0];
  }
  else if ((HMFEqualObjects() & 1) == 0)
  {
    [(_HMTelevisionProfile *)self _notifyDelegateOfUpdatedSourceDisplayOrder:v8];
  }
}

- (void)_notifyDelegateOfUpdatedSourceDisplayOrder:(id)a3
{
  id v4 = [(_HMTelevisionProfile *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(_HMTelevisionProfile *)self delegate];
    v7 = [(_HMAccessoryProfile *)self context];
    v8 = [v7 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67___HMTelevisionProfile__notifyDelegateOfUpdatedSourceDisplayOrder___block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v6;
    id v12 = self;
    id v9 = v6;
    [v8 invokeBlock:v10];
  }
}

- (void)updateMediaSourceDisplayOrder:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(_HMAccessoryProfile *)self context];
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTelevisionProfile updateMediaSourceDisplayOrder:completionHandler:]", @"completionHandler"];
    v22 = (void *)MEMORY[0x19F3A64A0]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      __int16 v33 = 2112;
      v34 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v9 = (void *)v8;
  if (!v8)
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      __int16 v33 = 2080;
      v34 = "-[_HMTelevisionProfile updateMediaSourceDisplayOrder:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 12;
    goto LABEL_11;
  }
  if (![v6 count])
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Zero entries in mediaSourceDisplayOrder", buf, 0xCu);
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 3;
LABEL_11:
    v20 = [v15 hmErrorWithCode:v16];
    v7[2](v7, v20);

    goto LABEL_12;
  }
  v10 = [v9 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke;
  block[3] = &unk_1E5944360;
  block[4] = self;
  v30 = v7;
  id v28 = v6;
  id v29 = v9;
  dispatch_async(v10, block);

LABEL_12:
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(_HMTelevisionProfile *)self messageTargetUUID];
  char v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (id)messageTargetUUID
{
  v2 = [(_HMAccessoryProfile *)self accessory];
  id v3 = [v2 uuid];

  return v3;
}

- (BOOL)isMediaSourceDisplayOrderModifiable
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_mediaSourceDisplayOrderModifiable + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setMediaSourceDisplayOrder:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  mediaSourceDisplayOrder = self->_mediaSourceDisplayOrder;
  self->_mediaSourceDisplayOrder = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)mediaSourceDisplayOrder
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_mediaSourceDisplayOrder copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)_registerNotificationHandlers
{
  id v3 = [(_HMAccessoryProfile *)self context];
  id v4 = [v3 messageDispatcher];

  [v4 registerForMessage:@"HMTP.sdoUpdated" receiver:self selector:sel__handleSourceDisplayOrderUpdated_];
}

- (_HMTelevisionProfile)initWithTelevisionService:(id)a3 linkedServices:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a4;
  id v9 = [v6 uniqueIdentifier];
  v10 = objc_msgSend(v7, "hm_deriveUUIDFromBaseUUID:", v9);

  id v11 = [v8 arrayByAddingObject:v6];

  v16.receiver = self;
  v16.super_class = (Class)_HMTelevisionProfile;
  id v12 = [(_HMAccessoryProfile *)&v16 initWithUUID:v10 services:v11];
  if (v12)
  {
    uint64_t v13 = [v6 mediaSourceDisplayOrder];
    mediaSourceDisplayOrder = v12->_mediaSourceDisplayOrder;
    v12->_mediaSourceDisplayOrder = (NSArray *)v13;

    *(&v12->_mediaSourceDisplayOrderModifiable + 4) = [v6 mediaSourceDisplayOrderModifiable];
  }

  return v12;
}

@end