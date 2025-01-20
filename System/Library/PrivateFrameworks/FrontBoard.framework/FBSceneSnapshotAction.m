@interface FBSceneSnapshotAction
- (FBSceneSnapshotAction)initWithScene:(id)a3 requests:(id)a4 expirationInterval:(double)a5 responseHandler:(id)a6;
- (NSString)sceneID;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FBSceneSnapshotAction

- (FBSceneSnapshotAction)initWithScene:(id)a3 requests:(id)a4 expirationInterval:(double)a5 responseHandler:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a4;
  id v11 = a6;
  uint64_t v12 = [v10 identifier];
  v13 = NSString;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v42 = (void *)v12;
  v16 = [v13 stringWithFormat:@"<%@: %p; %@>", v15, self, v12];

  v17 = FBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v16;
    _os_log_impl(&dword_1A62FC000, v17, OS_LOG_TYPE_DEFAULT, "Created: %{public}@", buf, 0xCu);
  }

  v18 = [v10 clientHandle];
  v19 = [v18 processHandle];
  uint64_t v20 = [v19 pid];

  v21 = 0;
  v22 = &off_1A6386000;
  if ([v10 isValid] && (int)v20 >= 1)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F96318]);
    v24 = NSString;
    v41 = [v10 identifier];
    v25 = [v24 stringWithFormat:@"FBSceneSnapshotAction:%@", v41];
    v26 = [MEMORY[0x1E4F96478] targetWithPid:v20];
    [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"SceneSnapshotAction"];
    v27 = self;
    v28 = v16;
    v30 = id v29 = v11;
    v51[0] = v30;
    v31 = [MEMORY[0x1E4F96368] invalidateAfterInterval:a5];
    v51[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    v21 = (void *)[v23 initWithExplanation:v25 target:v26 attributes:v32];

    v22 = &off_1A6386000;
    id v11 = v29;
    v16 = v28;
    self = v27;

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke;
    v49[3] = &unk_1E5C498B0;
    id v50 = v16;
    [v21 setInvalidationHandler:v49];
  }
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = *((void *)v22 + 108);
  v45[2] = __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_13;
  v45[3] = &unk_1E5C4B6D8;
  id v33 = v16;
  id v46 = v33;
  id v34 = v21;
  id v47 = v34;
  id v35 = v11;
  id v48 = v35;
  v44.receiver = self;
  v44.super_class = (Class)FBSceneSnapshotAction;
  v36 = [(FBSSceneSnapshotAction *)&v44 initWithRequests:v43 expirationInterval:v45 responseHandler:a5];
  if (v36)
  {
    v37 = [v10 identifier];
    uint64_t v38 = [v37 copy];
    sceneID = v36->_sceneID;
    v36->_sceneID = (NSString *)v38;

    objc_storeStrong((id *)&v36->_assertion, v21);
    objc_storeStrong((id *)&v36->_description, v16);
    [v34 acquireWithError:0];
  }

  return v36;
}

void __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = FBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
    __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_cold_1(a1, v4, v5);
  }
  }
}

void __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];
  v5 = FBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v4)
    {
      v7 = [v4 succinctDescription];
    }
    else
    {
      v7 = @"success";
    }
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1A62FC000, v5, OS_LOG_TYPE_DEFAULT, "Got response for %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    if (v4) { {
  }
    }
    }
  [*(id *)(a1 + 40) invalidate];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) { {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FBSceneSnapshotAction;
  [(FBSceneSnapshotAction *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = FBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 138543362;
    v7 = description;
    _os_log_impl(&dword_1A62FC000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating: %{public}@", buf, 0xCu);
  }

  [(RBSAssertion *)self->_assertion invalidate];
  v5.receiver = self;
  v5.super_class = (Class)FBSceneSnapshotAction;
  [(FBSSceneSnapshotAction *)&v5 invalidate];
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneID, 0);
}

void __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = [a2 succinctDescription];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "Assertion invalidated for %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end