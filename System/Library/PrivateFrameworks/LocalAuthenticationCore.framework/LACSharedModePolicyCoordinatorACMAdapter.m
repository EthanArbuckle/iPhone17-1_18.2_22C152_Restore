@interface LACSharedModePolicyCoordinatorACMAdapter
- (LACSharedModePolicyCoordinatorACMAdapter)initWithReplyQueue:(id)a3 storageRequestFactory:(id)a4 storage:(id)a5;
- (void)updatePolicyEvaluationWithTraits:(int64_t)a3 completion:(id)a4;
@end

@implementation LACSharedModePolicyCoordinatorACMAdapter

void __88__LACSharedModePolicyCoordinatorACMAdapter_updatePolicyEvaluationWithTraits_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LACLogSharedMode();
  os_log_type_t v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = NSStringFromLACSharedModePolicyTraits(*(void *)(a1 + 48));
    int v8 = 138543874;
    id v9 = WeakRetained;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_254F14000, v4, v5, "%{public}@ did set traits = [%{public}@] err=%{public}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePolicyEvaluationWithTraits:(int64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = LACLogSharedMode();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromLACSharedModePolicyTraits(a3);
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will set traits = [%{public}@]", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v9 = [(LACSharedModePolicyCoordinatorACMStorageRequestFactory *)self->_requestFactory requestWithPolicyTraits:a3];
  storage = self->_storage;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__LACSharedModePolicyCoordinatorACMAdapter_updatePolicyEvaluationWithTraits_completion___block_invoke;
  v12[3] = &unk_2653B6310;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = (id)a3;
  id v11 = v6;
  id v13 = v11;
  [(LACSharedModePolicyCoordinatorACMStorage *)storage performRequest:v9 completion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestFactory, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

- (LACSharedModePolicyCoordinatorACMAdapter)initWithReplyQueue:(id)a3 storageRequestFactory:(id)a4 storage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACSharedModePolicyCoordinatorACMAdapter;
  __int16 v12 = [(LACSharedModePolicyCoordinatorACMAdapter *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replyQueue, a3);
    objc_storeStrong((id *)&v13->_requestFactory, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
  }

  return v13;
}

@end