@interface HMUserActionPredictionController
+ (id)logCategory;
- (HMUserActionPredictionController)initWithHomeIdentifier:(id)a3 predictionProvider:(id)a4;
- (HMUserActionPredictionControllerDelegate)delegate;
- (HMUserActionPredictionProvider)predictionProvider;
- (NSUUID)homeIdentifier;
- (_HMContext)context;
- (id)predictions;
- (void)didUpdatePredictions:(id)a3 forHomeWithIdentifier:(id)a4;
- (void)fetchPredictionsWithCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMUserActionPredictionController

uint64_t __67__HMUserActionPredictionController_fetchPredictionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callCompletion:*(void *)(a1 + 40) array:a2];
}

- (void)fetchPredictionsWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUserActionPredictionController fetchPredictionsWithCompletion:]", @"completion"];
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  v5 = (void (**)(void, void))v4;
  v6 = [(HMUserActionPredictionController *)self context];

  if (v6)
  {
    v7 = [(HMUserActionPredictionController *)self context];
    v8 = [v7 delegateCaller];

    v9 = [(HMUserActionPredictionController *)self predictionProvider];
    v10 = [(HMUserActionPredictionController *)self homeIdentifier];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__HMUserActionPredictionController_fetchPredictionsWithCompletion___block_invoke;
    v22[3] = &unk_1E593EEB0;
    id v23 = v8;
    v24 = v5;
    id v11 = v8;
    [v9 fetchPredictionsForHomeWithIdentifier:v10 completion:v22];
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@fetchPredictionsWithCompletion is missing a context", buf, 0xCu);
    }
    v5[2](v5, MEMORY[0x1E4F1CBF0]);
  }
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
  if (!v5 || WeakRetained)
  {
    if (v5 || !WeakRetained) {
      return;
    }
    id v8 = [(HMUserActionPredictionController *)self predictionProvider];
    v7 = [(HMUserActionPredictionController *)self homeIdentifier];
    [v8 removeSubscriber:self forHomeIdentifier:v7];
  }
  else
  {
    id v8 = [(HMUserActionPredictionController *)self predictionProvider];
    v7 = [(HMUserActionPredictionController *)self homeIdentifier];
    [v8 addSubscriber:self forHomeIdentifier:v7];
  }
}

- (HMUserActionPredictionProvider)predictionProvider
{
  return (HMUserActionPredictionProvider *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)homeIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContext:(id)a3
{
}

- (HMUserActionPredictionController)initWithHomeIdentifier:(id)a3 predictionProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v8 = v7;
  if (!v7)
  {
LABEL_7:
    v13 = (HMUserActionPredictionController *)_HMFPreconditionFailure();
    [(HMUserActionPredictionController *)v13 configureWithContext:v15];
    return result;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMUserActionPredictionController;
  v9 = [(HMUserActionPredictionController *)&v16 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
    homeIdentifier = v9->_homeIdentifier;
    v9->_homeIdentifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_predictionProvider, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_predictionProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didUpdatePredictions:(id)a3 forHomeWithIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMUserActionPredictionController *)self homeIdentifier];
  int v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if (v9)
  {
    uint64_t v10 = [(HMUserActionPredictionController *)self delegate];
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      SEL v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v26 = v14;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate: %@ of updated user action predictions: %@ for home with identifier: %@", buf, 0x2Au);
    }
    if (objc_opt_respondsToSelector())
    {
      id v15 = [(HMUserActionPredictionController *)v12 context];
      objc_super v16 = [v15 delegateCaller];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __79__HMUserActionPredictionController_didUpdatePredictions_forHomeWithIdentifier___block_invoke;
      v21[3] = &unk_1E5945650;
      id v22 = v10;
      id v23 = v12;
      id v24 = v6;
      [v16 invokeBlock:v21];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not notifying of updated user action predictions: %@ for home with identifier: %@ due to wrong home", buf, 0x20u);
    }
  }
}

uint64_t __79__HMUserActionPredictionController_didUpdatePredictions_forHomeWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userActionPredictionController:*(void *)(a1 + 40) didUpdatePredictions:*(void *)(a1 + 48)];
}

- (id)predictions
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMUserActionPredictionControllerDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HMUserActionPredictionControllerDelegate *)WeakRetained;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1) {
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_9932);
  }
  v2 = (void *)logCategory__hmf_once_v7;

  return v2;
}

uint64_t __47__HMUserActionPredictionController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7;
  logCategory__hmf_once_id v7 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end