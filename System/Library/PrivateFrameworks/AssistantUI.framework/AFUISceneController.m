@interface AFUISceneController
- (AFUISceneControllerDelegate)delegate;
- (NSString)description;
- (id)_currentConfiguration;
- (void)_recordSceneCreateBegin;
- (void)_recordSceneCreateEnd;
- (void)cancelSceneLoadingTimeOut;
- (void)dealloc;
- (void)invalidateSceneForReason:(unint64_t)a3 explanation:(id)a4;
- (void)requestSceneViewWithConfiguration:(id)a3 completionBlock:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneLoadingTimeOutDidOccur;
- (void)setDelegate:(id)a3;
- (void)startSceneLoadingTimeOutTimerWithDuration:(double)a3;
- (void)transaction:(id)a3 didLaunchProcess:(id)a4;
- (void)updateSceneViewWithConfiguration:(id)a3;
@end

@implementation AFUISceneController

- (NSString)description
{
  v3 = NSString;
  createTransaction = self->_createTransaction;
  v5 = [(FBScene *)self->_scene identifier];
  v6 = [v3 stringWithFormat:@"AFUISceneController(%p): <Transaction: %@\nScene (sceneID: %@, sceneState: %zd) (%@)>", self, createTransaction, v5, -[FBScene contentState](self->_scene, "contentState"), self->_scene];

  return (NSString *)v6;
}

- (void)dealloc
{
  [(AFUISceneController *)self cancelSceneLoadingTimeOut];
  [(AFUISceneController *)self invalidateSceneForReason:2 explanation:@"#sceneHosting Invalidating scene because [AFUISceneController dealloc]"];
  v3.receiver = self;
  v3.super_class = (Class)AFUISceneController;
  [(AFUISceneController *)&v3 dealloc];
}

- (void)requestSceneViewWithConfiguration:(id)a3 completionBlock:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"AFUISceneController.m", 60, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  if (self->_createTransaction)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"AFUISceneController.m", 62, @"#sceneHosting Request is not allowed when we already have a scene or in flight request : scene=%@ createTransaction=%@", self->_scene, self->_createTransaction object file lineNumber description];
  }
  scene = self->_scene;
  v10 = (os_log_t *)MEMORY[0x263F28348];
  if (!scene) {
    goto LABEL_13;
  }
  v11 = [(FBScene *)scene settings];
  v12 = [v11 displayIdentity];
  v13 = [v7 sceneParameters];
  v14 = [v13 settings];
  v15 = [v14 displayIdentity];
  char v16 = [v12 isEqual:v15];

  if ((v16 & 1) == 0)
  {
    id v17 = [NSString alloc];
    v18 = [(FBScene *)self->_scene settings];
    v19 = [v18 displayIdentity];
    v20 = [v7 sceneParameters];
    v21 = [v20 settings];
    v22 = [v21 displayIdentity];
    v23 = (void *)[v17 initWithFormat:@"#sceneHosting Invalidating scene because displayIdentity changed from \"%@\" to \"%@\" for _scene:%@", v19, v22, 0];

    v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
      __int16 v55 = 2112;
      v56 = v23;
      _os_log_impl(&dword_223099000, v24, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    [(AFUISceneController *)self invalidateSceneForReason:3 explanation:v23];
  }
  v25 = self->_scene;
  if (v25)
  {
    v26 = [(FBScene *)v25 identifier];
    v27 = *v10;
    if (!os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315650;
    v54 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
    __int16 v55 = 2112;
    v56 = v26;
    __int16 v57 = 2112;
    id v58 = v7;
    v28 = "%s #sceneHosting Starting scene update for %@ with configuration %@";
  }
  else
  {
LABEL_13:
    v29 = NSString;
    v30 = [MEMORY[0x263F08C38] UUID];
    v31 = [v30 UUIDString];
    v26 = [v29 stringWithFormat:@"SiriHostedScene-%@-%@", @"com.apple.siri", v31];

    v27 = *v10;
    if (!os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315650;
    v54 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
    __int16 v55 = 2112;
    v56 = v26;
    __int16 v57 = 2112;
    id v58 = v7;
    v28 = "%s #sceneHosting Starting scene request for %@ with configuration %@";
  }
  _os_log_impl(&dword_223099000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x20u);
LABEL_16:
  [(AFUISceneController *)self _recordSceneCreateBegin];
  self->_sceneForeground = [v7 foreground];
  if ([v7 cancelSceneLoadingAfterTimeout])
  {
    [v7 sceneLoadingTimeOutDuration];
    -[AFUISceneController startSceneLoadingTimeOutTimerWithDuration:](self, "startSceneLoadingTimeOutTimerWithDuration:");
  }
  id v32 = objc_alloc(MEMORY[0x263F3F428]);
  v33 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.siri"];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke;
  v51[3] = &unk_264692570;
  id v34 = v7;
  id v52 = v34;
  v35 = (FBApplicationUpdateScenesTransaction *)[v32 initWithProcessIdentity:v33 executionContextProvider:v51];
  createTransaction = self->_createTransaction;
  self->_createTransaction = v35;

  v37 = [MEMORY[0x263F3F7C8] identityForIdentifier:v26 workspaceIdentifier:@"com.apple.siri"];
  v38 = self->_createTransaction;
  v39 = [v34 sceneParameters];
  [(FBApplicationUpdateScenesTransaction *)v38 updateSceneWithIdentity:v37 parameters:v39 transitionContext:0];

  v40 = self;
  v41 = self->_createTransaction;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2;
  v47[3] = &unk_264692598;
  id v42 = v26;
  id v48 = v42;
  v49 = v40;
  id v43 = v8;
  id v50 = v43;
  [(FBApplicationUpdateScenesTransaction *)v41 setCompletionBlock:v47];
  [(FBApplicationUpdateScenesTransaction *)self->_createTransaction setWaitsForSceneCommits:0];
  [(FBApplicationUpdateScenesTransaction *)self->_createTransaction addObserver:v40];
  [(FBApplicationUpdateScenesTransaction *)self->_createTransaction begin];
  v44 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
    _os_log_impl(&dword_223099000, v44, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting started FBApplicationUpdateScenesTransaction transaction", buf, 0xCu);
  }
}

id __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F3F448]);
  objc_msgSend(v2, "setLaunchIntent:", objc_msgSend(*(id *)(a1 + 32), "launchIntent"));

  return v2;
}

void __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F3F4F0] sharedInstance];
  v5 = [v4 sceneWithIdentifier:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 32);
    if (v7)
    {
      id v8 = v7;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_3;
      v24[3] = &unk_2646917C0;
      id v25 = v8;
      id v9 = v8;
      [v5 updateUISettingsWithBlock:v24];
      uint64_t v10 = *(void *)(a1 + 40);
      v11 = *(void **)(v10 + 32);
      *(void *)(v10 + 32) = 0;

      uint64_t v6 = *(void *)(a1 + 40);
    }
    v14 = *(void **)(v6 + 8);
    v12 = (id *)(v6 + 8);
    v13 = v14;
    if (v14)
    {
      if (v13 != v5)
      {
        v15 = [MEMORY[0x263F08690] currentHandler];
        char v16 = [NSString stringWithUTF8String:"-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]_block_invoke_2"];
        [v15 handleFailureInFunction:v16, @"AFUISceneController.m", 107, @"#sceneHosting scene mismatch : old=%@ new=%@", *(void *)(*(void *)(a1 + 40) + 8), v5 file lineNumber description];
      }
    }
    else
    {
      objc_storeStrong(v12, v5);
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "addObserver:");
    }
    [*(id *)(a1 + 40) _recordSceneCreateEnd];
  }
  [*(id *)(a1 + 40) cancelSceneLoadingTimeOut];
  id v17 = *(id *)(*(void *)(a1 + 40) + 16);
  uint64_t v18 = *(void *)(a1 + 40);
  v19 = *(void **)(v18 + 16);
  *(void *)(v18 + 16) = 0;

  v20 = *MEMORY[0x263F28348];
  v21 = *MEMORY[0x263F28348];
  if (a2)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]_block_invoke";
      _os_log_impl(&dword_223099000, v20, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting FBApplicationUpdateScenesTransaction succeeded", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2_cold_1(v20, v17);
  }
  uint64_t v22 = *(void *)(a1 + 48);
  v23 = [v17 error];
  (*(void (**)(uint64_t, void *, void *))(v22 + 16))(v22, v5, v23);
}

uint64_t __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configureMutableSceneSettings:a2];
}

- (void)updateSceneViewWithConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (os_log_t *)MEMORY[0x263F28348];
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    scene = self->_scene;
    *(_DWORD *)buf = 136315650;
    v14 = "-[AFUISceneController updateSceneViewWithConfiguration:]";
    __int16 v15 = 2112;
    char v16 = scene;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting updating scene (%@) with configuration %@", buf, 0x20u);
  }
  self->_sceneForeground = [v5 foreground];
  id v9 = self->_scene;
  if (v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__AFUISceneController_updateSceneViewWithConfiguration___block_invoke;
    v11[3] = &unk_2646917C0;
    id v12 = v5;
    [(FBScene *)v9 updateUISettingsWithBlock:v11];
  }
  else if ([(FBApplicationUpdateScenesTransaction *)self->_createTransaction isRunning])
  {
    objc_storeStrong((id *)&self->_pendingConfigurationToApply, a3);
  }
  else
  {
    uint64_t v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      -[AFUISceneController updateSceneViewWithConfiguration:](v10);
    }
  }
}

uint64_t __56__AFUISceneController_updateSceneViewWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configureMutableSceneSettings:a2];
}

- (void)sceneLoadingTimeOutDidOccur
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[AFUISceneController sceneLoadingTimeOutDidOccur]";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s #sceneHosting Reached timeout, cancelling scene loading", (uint8_t *)&v1, 0xCu);
}

- (void)startSceneLoadingTimeOutTimerWithDuration:(double)a3
{
}

- (void)cancelSceneLoadingTimeOut
{
}

- (void)invalidateSceneForReason:(unint64_t)a3 explanation:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  self->_invalidationReason = a3;
  id v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = +[AFUISceneConfiguration stringForInvalidationReason:a3];
    *(_DWORD *)buf = 136315650;
    v26 = "-[AFUISceneController invalidateSceneForReason:explanation:]";
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp #sceneHosting %@: %@", buf, 0x20u);
  }
  createTransaction = self->_createTransaction;
  if (createTransaction)
  {
    [(FBApplicationUpdateScenesTransaction *)createTransaction failWithReason:@"deactivating"];
    if (self->_createTransaction)
    {
      v24 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFUISceneController.m", 169, @"#sceneHosting createTransaction should be gone by now ; %@",
        self->_createTransaction);
    }
  }
  scene = self->_scene;
  if (scene)
  {
    v13 = [MEMORY[0x263F3F4F0] sharedInstance];
    v14 = [(FBScene *)self->_scene identifier];
    __int16 v15 = [v13 sceneWithIdentifier:v14];

    if (scene == v15)
    {
      uint64_t v16 = [(AFUISceneController *)self delegate];
      if (v16)
      {
        __int16 v17 = (void *)v16;
        id v18 = [(AFUISceneController *)self delegate];
        char v19 = objc_opt_respondsToSelector();

        if (v19)
        {
          v20 = [(AFUISceneController *)self delegate];
          [v20 sceneController:self willInvalidateScene:self->_scene forReason:self->_invalidationReason];
        }
      }
      v21 = [MEMORY[0x263F3F4F0] sharedInstance];
      uint64_t v22 = [(FBScene *)self->_scene identifier];
      [v21 destroyScene:v22 withTransitionContext:0];
    }
  }
  [(BKSProcessAssertion *)self->_backgroundRunningAssertion invalidate];
  backgroundRunningAssertion = self->_backgroundRunningAssertion;
  self->_backgroundRunningAssertion = 0;
}

- (id)_currentConfiguration
{
  id v2 = [(AFUISceneController *)self delegate];
  uint64_t v3 = [v2 sceneConfigurationForDelegate];

  return v3;
}

- (void)_recordSceneCreateBegin
{
}

- (void)_recordSceneCreateEnd
{
}

- (void)sceneContentStateDidChange:(id)a3
{
  v4 = (FBScene *)a3;
  if (self->_scene == v4)
  {
    uint64_t v6 = v4;
    id v5 = [(AFUISceneController *)self delegate];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v5 sceneController:self sceneContentStateDidChange:v6];
    }

    v4 = v6;
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (FBScene *)a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[AFUISceneController sceneDidInvalidate:]";
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting scene: %@", (uint8_t *)&v8, 0x16u);
  }
  if (self->_scene == v4)
  {
    [(FBScene *)v4 removeObserver:self];
    scene = self->_scene;
    self->_scene = 0;

    id v7 = [(AFUISceneController *)self delegate];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 sceneController:self sceneWasInvalidated:v4 forReason:self->_invalidationReason];
    }
    self->_invalidationReason = 0;
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v7 = (FBScene *)a3;
  if (self->_scene == v7)
  {
    v11 = v7;
    int v8 = [(FBScene *)v7 uiClientSettings];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(FBScene *)v11 uiClientSettings];
    }
    else
    {
      id v9 = 0;
    }

    __int16 v10 = [(AFUISceneController *)self delegate];
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v10 sceneController:self sceneDidUpdateClientSettings:v9];
    }

    id v7 = v11;
  }
}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  if (!self->_sceneForeground)
  {
    id v5 = (objc_class *)MEMORY[0x263F28180];
    id v6 = a4;
    id v7 = [v5 alloc];
    uint64_t v8 = [v6 pid];

    self->_backgroundRunningAssertion = (BKSProcessAssertion *)[v7 initWithPID:v8 flags:13 reason:7 name:@"siri prewarming" withHandler:&__block_literal_global_4];
    MEMORY[0x270F9A758]();
  }
}

void __52__AFUISceneController_transaction_didLaunchProcess___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[AFUISceneController transaction:didLaunchProcess:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = a2;
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting prewarming assertion acquired %{BOOL}i", (uint8_t *)&v4, 0x12u);
  }
}

- (AFUISceneControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISceneControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingConfigurationToApply, 0);
  objc_storeStrong((id *)&self->_backgroundRunningAssertion, 0);
  objc_storeStrong((id *)&self->_createTransaction, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

void __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = [a2 error];
  id v5 = [v4 localizedDescription];
  int v6 = 136315394;
  int v7 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]_block_invoke_2";
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_223099000, v3, OS_LOG_TYPE_ERROR, "%s #sceneHosting FBApplicationUpdateScenesTransaction failed with error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)updateSceneViewWithConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[AFUISceneController updateSceneViewWithConfiguration:]";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s #sceneHosting went to update scene, but no scene exists and no transaction is running. Nothing to update", (uint8_t *)&v1, 0xCu);
}

@end