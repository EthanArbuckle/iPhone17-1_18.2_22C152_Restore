@interface HDCloudSyncContextSyncManager
- (HDCloudSyncContextSyncManager)initWithProfile:(id)a3;
- (id)pull:(id)a3;
- (id)push:(id)a3;
@end

@implementation HDCloudSyncContextSyncManager

- (HDCloudSyncContextSyncManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncContextSyncManager;
  v5 = [(HDCloudSyncContextSyncManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)push:(id)a3
{
  id v4 = a3;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [WeakRetained database];
  objc_super v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v27 = 0;
  v10 = [v7 takeAccessibilityAssertionWithOwnerIdentifier:v9 timeout:&v27 error:300.0];
  id v11 = v27;

  id v12 = [[HDCloudSyncContext alloc] initForPurpose:2 options:0 reason:28 xpcActivity:0];
  v13 = [HDCloudSyncContextSyncPushTask alloc];
  id v14 = objc_loadWeakRetained((id *)p_profile);
  v15 = [v14 cloudSyncManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __38__HDCloudSyncContextSyncManager_push___block_invoke;
  v24[3] = &unk_1E62FA310;
  id v25 = v10;
  id v26 = v4;
  id v16 = v4;
  id v17 = v10;
  v18 = [(HDCloudSyncManagerPipelineTask *)v13 initWithManager:v15 context:v12 accessibilityAssertion:v17 completion:v24];

  id v19 = objc_loadWeakRetained((id *)p_profile);
  v20 = [v19 daemon];
  v21 = [v20 cloudSyncCoordinator];
  [v21 addManagerTask:v18];

  v22 = [(HDCloudSyncManagerTask *)v18 progress];

  return v22;
}

void __38__HDCloudSyncContextSyncManager_push___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)pull:(id)a3
{
  id v4 = a3;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [WeakRetained database];
  objc_super v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v27 = 0;
  v10 = [v7 takeAccessibilityAssertionWithOwnerIdentifier:v9 timeout:&v27 error:300.0];
  id v11 = v27;

  id v12 = [[HDCloudSyncContext alloc] initForPurpose:3 options:64 reason:28 xpcActivity:0];
  v13 = [HDCloudSyncContextSyncPullTask alloc];
  id v14 = objc_loadWeakRetained((id *)p_profile);
  v15 = [v14 cloudSyncManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __38__HDCloudSyncContextSyncManager_pull___block_invoke;
  v24[3] = &unk_1E62FA310;
  id v25 = v10;
  id v26 = v4;
  id v16 = v4;
  id v17 = v10;
  v18 = [(HDCloudSyncManagerPipelineTask *)v13 initWithManager:v15 context:v12 accessibilityAssertion:v17 completion:v24];

  id v19 = objc_loadWeakRetained((id *)p_profile);
  v20 = [v19 daemon];
  v21 = [v20 cloudSyncCoordinator];
  [v21 addManagerTask:v18];

  v22 = [(HDCloudSyncManagerTask *)v18 progress];

  return v22;
}

void __38__HDCloudSyncContextSyncManager_pull___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

@end