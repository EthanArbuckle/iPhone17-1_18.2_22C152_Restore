@interface HDSyncRequester
- (HDProfile)profile;
- (HDSyncRequester)init;
- (HDSyncRequester)initWithProfile:(id)a3;
- (id)unitTesting_willRequestSyncsHandler;
- (void)requestSyncsWithReason:(id)a3;
- (void)requestSyncsWithReason:(id)a3 options:(unint64_t)a4;
- (void)setUnitTesting_willRequestSyncsHandler:(id)a3;
@end

@implementation HDSyncRequester

- (HDSyncRequester)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSyncRequester)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSyncRequester;
  v5 = [(HDSyncRequester *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (void)requestSyncsWithReason:(id)a3
{
}

- (void)requestSyncsWithReason:(id)a3 options:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v7;
    *(_DWORD *)v24 = 138543618;
    *(void *)&v24[4] = objc_opt_class();
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting syncs for '%{public}@'", v24, 0x16u);
  }
  v9 = _Block_copy(self->_unitTesting_willRequestSyncsHandler);
  v10 = v9;
  if (v9) {
    (*((void (**)(void *, id, unint64_t))v9 + 2))(v9, v6, a4);
  }
  if ((a4 & 1) == 0)
  {
    id v11 = v6;
    id v12 = objc_alloc_init(MEMORY[0x1E4F2B5A0]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v14 = [WeakRetained cloudSyncManager];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithStateSyncRequest:v12];
    *(void *)v24 = MEMORY[0x1E4F143A8];
    *(void *)&v24[8] = 3221225472;
    *(void *)&v24[16] = __47__HDSyncRequester__requestStateSyncWithReason___block_invoke;
    v25 = &unk_1E62F5D48;
    v26 = self;
    id v16 = v11;
    id v27 = v16;
    [v14 syncWithRequest:v15 reason:v16 completion:v24];
  }
  id v17 = v6;
  id v18 = objc_loadWeakRetained((id *)&self->_profile);
  v19 = [v18 daemon];
  v20 = [v19 behavior];
  int v21 = [v20 supportsNanoSync];

  if (v21)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_profile);
    v23 = [v22 nanoSyncManager];
    *(void *)v24 = MEMORY[0x1E4F143A8];
    *(void *)&v24[8] = 3221225472;
    *(void *)&v24[16] = __46__HDSyncRequester__requestNanoSyncWithReason___block_invoke;
    v25 = &unk_1E62F5D48;
    v26 = self;
    id v27 = v17;
    [v23 syncHealthDataWithOptions:0 reason:v27 completion:v24];
  }
}

void __47__HDSyncRequester__requestStateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  v7 = *MEMORY[0x1E4F29FA8];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    objc_super v8 = v6;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request failure for reason '%{public}@': %{public}@", (uint8_t *)&v13, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v6;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 40);
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request success for reason '%{public}@'", (uint8_t *)&v13, 0x16u);
LABEL_4:
  }
LABEL_6:
}

void __46__HDSyncRequester__requestNanoSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  v7 = *MEMORY[0x1E4F29FA8];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    objc_super v8 = v6;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] NanoSync failure for reason '%{public}@': %{public}@", (uint8_t *)&v13, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v6;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 40);
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync success for reason '%{public}@'", (uint8_t *)&v13, 0x16u);
LABEL_4:
  }
LABEL_6:
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (id)unitTesting_willRequestSyncsHandler
{
  return self->_unitTesting_willRequestSyncsHandler;
}

- (void)setUnitTesting_willRequestSyncsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_willRequestSyncsHandler, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end