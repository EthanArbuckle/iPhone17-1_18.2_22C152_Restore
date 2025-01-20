@interface AXSiriShortcutsManager
+ (AXSiriShortcutsManager)sharedManager;
+ (id)shortcutsManagerForSource:(unint64_t)a3;
- (AXSiriShortcutsManager)initWithSource:(unint64_t)a3;
- (NSArray)shortcuts;
- (VCVoiceShortcutClient)shortcutClient;
- (id)registerShortcutsDidChangeBlock:(id)a3;
- (id)shortcutForIdentifier:(id)a3;
- (unint64_t)source;
- (void)_loadShortcuts;
- (void)_queue_loadShortcuts;
- (void)observableResultDidChange:(id)a3;
- (void)performShortcut:(id)a3;
- (void)setShortcutClient:(id)a3;
- (void)unregisterShortcutsDidChangeBlock:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation AXSiriShortcutsManager

+ (id)shortcutsManagerForSource:(unint64_t)a3
{
  if (shortcutsManagerForSource__onceToken != -1) {
    dispatch_once(&shortcutsManagerForSource__onceToken, &__block_literal_global_44);
  }
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(id)shortcutsManagerForSource__ShortcutManagers objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = [[AXSiriShortcutsManager alloc] initWithSource:a3];
    [(id)shortcutsManagerForSource__ShortcutManagers setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

uint64_t __52__AXSiriShortcutsManager_shortcutsManagerForSource___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = shortcutsManagerForSource__ShortcutManagers;
  shortcutsManagerForSource__ShortcutManagers = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (AXSiriShortcutsManager)sharedManager
{
  return (AXSiriShortcutsManager *)[a1 shortcutsManagerForSource:0];
}

- (AXSiriShortcutsManager)initWithSource:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AXSiriShortcutsManager;
  v4 = [(AXSiriShortcutsManager *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_source = a3;
    dispatch_queue_t v6 = dispatch_queue_create("AXSiriShortcutsUpdateQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    updateBlocks = v5->_updateBlocks;
    v5->_updateBlocks = (NSMutableDictionary *)v8;

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v10 = (void *)getVCVoiceShortcutClientClass_softClass;
    uint64_t v24 = getVCVoiceShortcutClientClass_softClass;
    if (!getVCVoiceShortcutClientClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getVCVoiceShortcutClientClass_block_invoke;
      location[3] = &unk_1E5585E30;
      location[4] = &v21;
      __getVCVoiceShortcutClientClass_block_invoke((uint64_t)location);
      v10 = (void *)v22[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v21, 8);
    v12 = [v11 standardClient];
    [(AXSiriShortcutsManager *)v5 setShortcutClient:v12];

    [(AXSiriShortcutsManager *)v5 _loadShortcuts];
    if (MKBDeviceFormattedForContentProtection())
    {
      objc_initWeak(location, v5);
      v13 = (const char *)*MEMORY[0x1E4F78160];
      v14 = MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __41__AXSiriShortcutsManager_initWithSource___block_invoke;
      v17[3] = &unk_1E55889D0;
      objc_copyWeak(&v18, location);
      notify_register_dispatch(v13, &v5->_contentProtectionNotifyToken, v14, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
    }
  }
  return v5;
}

void __41__AXSiriShortcutsManager_initWithSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_18D308000, v2, OS_LOG_TYPE_DEFAULT, "Auth state changed so reloading siri shortcuts", v3, 2u);
    }

    [WeakRetained _loadShortcuts];
  }
}

- (NSArray)shortcuts
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__AXSiriShortcutsManager_shortcuts__block_invoke;
  v6[3] = &unk_1E5586520;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (void *)v8[5];
  if (!v3)
  {
    v8[5] = MEMORY[0x1E4F1CBF0];

    v3 = (void *)v8[5];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __35__AXSiriShortcutsManager_shortcuts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)observableResultDidChange:(id)a3
{
  uint64_t v4 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_INFO, "shortcuts did change!", v5, 2u);
  }

  [(AXSiriShortcutsManager *)self _loadShortcuts];
}

- (id)registerShortcutsDidChangeBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  v5 = [MEMORY[0x1E4F29128] UUID];
  id v18 = [v5 UUIDString];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AXSiriShortcutsManager_registerShortcutsDidChangeBlock___block_invoke;
  block[3] = &unk_1E55889F8;
  id v11 = v4;
  id v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_async(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __58__AXSiriShortcutsManager_registerShortcutsDidChangeBlock___block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v2 = _Block_copy(v3);
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v2 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)unregisterShortcutsDidChangeBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__AXSiriShortcutsManager_unregisterShortcutsDidChangeBlock___block_invoke;
    v7[3] = &unk_1E5586470;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __60__AXSiriShortcutsManager_unregisterShortcutsDidChangeBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)shortcutForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AXSiriShortcutsManager *)self shortcuts];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__AXSiriShortcutsManager_shortcutForIdentifier___block_invoke;
  v17[3] = &unk_1E5588A20;
  id v6 = v4;
  id v18 = v6;
  id v7 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v17);
  id v8 = [v7 firstObject];

  if (v8)
  {
    uint64_t v9 = v8;
  }
  else
  {
    v10 = [(AXSiriShortcutsManager *)self shortcutClient];
    id v16 = 0;
    id v11 = [v10 accessibilityWorkflowForIdentifier:v6 error:&v16];
    id v12 = v16;

    if (v12)
    {
      uint64_t v13 = AXLogSiriShortcuts();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(AXSiriShortcutsManager *)(uint64_t)v6 shortcutForIdentifier:v13];
      }
      uint64_t v9 = 0;
    }
    else
    {
      v14 = [AXSiriShortcut alloc];
      uint64_t v13 = [v11 value];
      uint64_t v9 = [(AXSiriShortcut *)v14 initWithAccessibilityWorkflow:v13];
    }
  }

  return v9;
}

uint64_t __48__AXSiriShortcutsManager_shortcutForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (void)_loadShortcuts
{
  id v3 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "reloading shortcuts", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AXSiriShortcutsManager__loadShortcuts__block_invoke;
  block[3] = &unk_1E5585F48;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__AXSiriShortcutsManager__loadShortcuts__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadShortcuts");
}

- (void)_queue_loadShortcuts
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Could not fetch siri shortcuts: %@", (uint8_t *)&v2, 0xCu);
}

AXSiriShortcut *__46__AXSiriShortcutsManager__queue_loadShortcuts__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[AXSiriShortcut alloc] initWithAccessibilityWorkflow:v2];

  return v3;
}

uint64_t __46__AXSiriShortcutsManager__queue_loadShortcuts__block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performShortcut:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];

  if (v5)
  {
    id v6 = +[AXBackBoardServer server];
    int v7 = [v6 isRestrictedForAAC];

    if (v7)
    {
      id v8 = AXLogSiriShortcuts();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "Could not perform shortcut during Assessment Mode.", (uint8_t *)v14, 2u);
      }

      uint64_t v9 = GAXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_18D308000, v9, OS_LOG_TYPE_DEFAULT, "Guided Access blocking attempt to perform shortcut during Assessment Mode.", (uint8_t *)v14, 2u);
      }
    }
    else
    {
      uint64_t v15 = 0;
      id v16 = &v15;
      uint64_t v17 = 0x2050000000;
      v10 = (void *)getWFAccessibilityWorkflowRunnerClientClass_softClass;
      uint64_t v18 = getWFAccessibilityWorkflowRunnerClientClass_softClass;
      if (!getWFAccessibilityWorkflowRunnerClientClass_softClass)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __getWFAccessibilityWorkflowRunnerClientClass_block_invoke;
        v14[3] = &unk_1E5585E30;
        v14[4] = &v15;
        __getWFAccessibilityWorkflowRunnerClientClass_block_invoke((uint64_t)v14);
        v10 = (void *)v16[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v15, 8);
      id v12 = [v11 alloc];
      uint64_t v13 = [v4 identifier];
      uint64_t v9 = [v12 initWithWorkflowIdentifier:v13];

      [v9 setDelegate:self];
      [v9 start];
    }
  }
  else
  {
    uint64_t v9 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXSiriShortcutsManager performShortcut:]((uint64_t)v4, v9);
    }
  }
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_INFO, "did start workflow: %@, with progress: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = NSStringFromBOOL();
    int v13 = 138413058;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_INFO, "did finish running workflow: %@, with output: %@, error: %@, cancelled: %@", (uint8_t *)&v13, 0x2Au);
  }
}

- (unint64_t)source
{
  return self->_source;
}

- (VCVoiceShortcutClient)shortcutClient
{
  return self->_shortcutClient;
}

- (void)setShortcutClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutClient, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_observedWorkflows, 0);
  objc_storeStrong((id *)&self->_cachedShortcuts, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)shortcutForIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18D308000, log, OS_LOG_TYPE_ERROR, "Could not fetch siri shortcut with identifier: %@. %@", (uint8_t *)&v3, 0x16u);
}

- (void)performShortcut:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Could not perform short cut no identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end