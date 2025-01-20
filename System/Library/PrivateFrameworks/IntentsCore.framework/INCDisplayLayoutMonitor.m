@interface INCDisplayLayoutMonitor
+ (void)initialize;
- (BOOL)alive;
- (BOOL)hasRenderServerAccess;
- (BOOL)lock_alive;
- (BOOL)platformSupportsMultipleDisplays;
- (BOOL)shouldObserveMultipleDisplays;
- (FBSDisplayLayoutMonitor)singleDisplayLayoutMonitor;
- (FBSDisplayMonitor)displayMonitor;
- (INCDisplayLayoutMonitor)init;
- (NSMutableDictionary)layoutMonitorsByIdentity;
- (id)lock_currentDisplayLayouts;
- (id)lock_layoutMonitorsByIdentity;
- (id)transitionHandler;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)executeBlockWithLock:(id)a3;
- (void)lock_invalidate;
- (void)lock_resume;
- (void)lock_startLayoutMonitorForDisplay:(id)a3;
- (void)setAlive:(BOOL)a3;
- (void)setLayoutMonitorsByIdentity:(id)a3;
- (void)setTransitionHandler:(id)a3;
@end

@implementation INCDisplayLayoutMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong(&self->_transitionHandler, 0);
  objc_storeStrong((id *)&self->_layoutMonitorsByIdentity, 0);
}

- (FBSDisplayLayoutMonitor)singleDisplayLayoutMonitor
{
  return self->_singleDisplayLayoutMonitor;
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setAlive:(BOOL)a3
{
  self->_alive = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setTransitionHandler:(id)a3
{
}

- (id)transitionHandler
{
  return self->_transitionHandler;
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__INCDisplayLayoutMonitor_displayMonitor_willDisconnectIdentity___block_invoke;
  v7[3] = &unk_1E62BB2D0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(INCDisplayLayoutMonitor *)self executeBlockWithLock:v7];
}

void __65__INCDisplayLayoutMonitor_displayMonitor_willDisconnectIdentity___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layoutMonitorsByIdentity];
  id v4 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v4) {
    [v4 invalidate];
  }
  v3 = [*(id *)(a1 + 32) layoutMonitorsByIdentity];
  [v3 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
}

- (void)executeBlockWithLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)lock_layoutMonitorsByIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(INCDisplayLayoutMonitor *)self layoutMonitorsByIdentity];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)lock_alive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(INCDisplayLayoutMonitor *)v2 alive];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLayoutMonitorsByIdentity:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  layoutMonitorsByIdentity = self->_layoutMonitorsByIdentity;
  self->_layoutMonitorsByIdentity = v4;
}

- (NSMutableDictionary)layoutMonitorsByIdentity
{
  os_unfair_lock_assert_owner(&self->_lock);
  layoutMonitorsByIdentity = self->_layoutMonitorsByIdentity;
  return layoutMonitorsByIdentity;
}

- (BOOL)alive
{
  return self->_alive;
}

- (void)lock_startLayoutMonitorForDisplay:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isMainDisplay])
  {
    uint64_t v5 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
LABEL_10:
    id v8 = (void *)v5;
    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (![v4 isExternal])
  {
    if ([v4 isCarDisplay])
    {
      CarPlayServicesLibrary();
      uint64_t v5 = [MEMORY[0x1E4F62958] configurationForCarDisplayMonitor];
    }
    else
    {
      if (![v4 isCarInstrumentsDisplay]) {
        goto LABEL_12;
      }
      CarPlayServicesLibrary();
      uint64_t v5 = [MEMORY[0x1E4F62958] configurationForCarInstrumentsDisplayMonitor];
    }
    goto LABEL_10;
  }
  id v6 = (void *)MEMORY[0x1E4F62958];
  v7 = SBSCreateLayoutServiceEndpointForExternalDisplay();
  id v8 = [v6 configurationWithEndpoint:v7];

  if (v8)
  {
LABEL_11:
    [v8 setNeedsUserInteractivePriority:1];
    objc_initWeak((id *)location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke;
    v16[3] = &unk_1E62BB1E8;
    objc_copyWeak(&v18, (id *)location);
    id v9 = v4;
    id v17 = v9;
    [v8 setTransitionHandler:v16];
    v10 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke_2;
    v13[3] = &unk_1E62BB210;
    v13[4] = self;
    id v14 = v9;
    id v11 = v10;
    id v15 = v11;
    [(INCDisplayLayoutMonitor *)self executeBlockWithLock:v13];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);

    goto LABEL_14;
  }
LABEL_12:
  v12 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[INCDisplayLayoutMonitor lock_startLayoutMonitorForDisplay:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_error_impl(&dword_1BC57D000, v12, OS_LOG_TYPE_ERROR, "%s Unable to start layout monitoring for display because there wasn't a suitable configuration available: %@", location, 0x16u);
  }
LABEL_14:
}

void __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = [WeakRetained transitionHandler];

  if (v7 && v10)
  {
    id v11 = [WeakRetained transitionHandler];
    ((void (**)(void, id, void, id, id))v11)[2](v11, v12, *(void *)(a1 + 32), v7, v8);
  }
}

void __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layoutMonitorsByIdentity];
  id v5 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v5) {
    [v5 invalidate];
  }
  v3 = [*(id *)(a1 + 32) layoutMonitorsByIdentity];
  [v3 removeObjectForKey:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) layoutMonitorsByIdentity];
  [v4 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
}

- (id)lock_currentDisplayLayouts
{
  if (![(INCDisplayLayoutMonitor *)self lock_alive]) {
    [(INCDisplayLayoutMonitor *)self resume];
  }
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__347;
  id v14 = __Block_byref_object_dispose__348;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(INCDisplayLayoutMonitor *)self shouldObserveMultipleDisplays])
  {
    v3 = [(INCDisplayLayoutMonitor *)self lock_layoutMonitorsByIdentity];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__INCDisplayLayoutMonitor_lock_currentDisplayLayouts__block_invoke;
    v9[3] = &unk_1E62BB1C0;
    v9[4] = &v10;
    [v3 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    id v4 = [(INCDisplayLayoutMonitor *)self singleDisplayLayoutMonitor];
    v3 = [v4 currentLayout];

    id v5 = [v3 displayConfiguration];
    id v6 = [v5 identity];

    if (v3 && v6) {
      [(id)v11[5] setObject:v3 forKey:v6];
    }
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __53__INCDisplayLayoutMonitor_lock_currentDisplayLayouts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 currentLayout];

  if (v6)
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = [v5 currentLayout];
    [v7 setObject:v8 forKey:v9];
  }
}

- (void)lock_invalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__INCDisplayLayoutMonitor_lock_invalidate__block_invoke;
  v2[3] = &unk_1E62BB3E8;
  v2[4] = self;
  [(INCDisplayLayoutMonitor *)self executeBlockWithLock:v2];
}

void __42__INCDisplayLayoutMonitor_lock_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setAlive:0];
  if ([*(id *)(a1 + 32) shouldObserveMultipleDisplays])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v2 = [*(id *)(a1 + 32) layoutMonitorsByIdentity];
    v3 = [v2 allValues];

    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) invalidate];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    id v8 = [*(id *)(a1 + 32) layoutMonitorsByIdentity];
    [v8 removeAllObjects];

    id v9 = [*(id *)(a1 + 32) displayMonitor];
    [v9 removeObserver:*(void *)(a1 + 32)];

    uint64_t v10 = [*(id *)(a1 + 32) displayMonitor];
    [v10 invalidate];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) singleDisplayLayoutMonitor];
    [v11 invalidate];
  }
}

- (void)lock_resume
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__INCDisplayLayoutMonitor_lock_resume__block_invoke;
  v21[3] = &unk_1E62BB3E8;
  v21[4] = self;
  [(INCDisplayLayoutMonitor *)self executeBlockWithLock:v21];
  if ([(INCDisplayLayoutMonitor *)self shouldObserveMultipleDisplays])
  {
    v3 = [(INCDisplayLayoutMonitor *)self displayMonitor];
    [v3 addObserver:self];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = [(INCDisplayLayoutMonitor *)self displayMonitor];
    uint64_t v5 = [v4 connectedIdentities];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          [(INCDisplayLayoutMonitor *)self lock_startLayoutMonitorForDisplay:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    [v5 setNeedsUserInteractivePriority:1];
    objc_initWeak(&location, self);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = __38__INCDisplayLayoutMonitor_lock_resume__block_invoke_2;
    long long v14 = &unk_1E62BB410;
    objc_copyWeak(&v15, &location);
    [v5 setTransitionHandler:&v11];
    objc_msgSend(MEMORY[0x1E4F62940], "monitorWithConfiguration:", v5, v11, v12, v13, v14);
    id v9 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
    singleDisplayLayoutMonitor = self->_singleDisplayLayoutMonitor;
    self->_singleDisplayLayoutMonitor = v9;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

uint64_t __38__INCDisplayLayoutMonitor_lock_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlive:1];
}

void __38__INCDisplayLayoutMonitor_lock_resume__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = [WeakRetained transitionHandler];

  if (v7 && v10)
  {
    uint64_t v11 = [WeakRetained transitionHandler];
    uint64_t v12 = [v7 displayConfiguration];
    long long v13 = [v12 identity];
    ((void (**)(void, id, void *, id, id))v11)[2](v11, v14, v13, v7, v8);
  }
}

- (BOOL)platformSupportsMultipleDisplays
{
  return 1;
}

- (BOOL)hasRenderServerAccess
{
  return sandbox_check() == 0;
}

- (BOOL)shouldObserveMultipleDisplays
{
  BOOL v3 = [(INCDisplayLayoutMonitor *)self hasRenderServerAccess];
  if (v3)
  {
    LOBYTE(v3) = [(INCDisplayLayoutMonitor *)self platformSupportsMultipleDisplays];
  }
  return v3;
}

- (void)dealloc
{
  [(INCDisplayLayoutMonitor *)self lock_invalidate];
  v3.receiver = self;
  v3.super_class = (Class)INCDisplayLayoutMonitor;
  [(INCDisplayLayoutMonitor *)&v3 dealloc];
}

- (INCDisplayLayoutMonitor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)INCDisplayLayoutMonitor;
  v2 = [(INCDisplayLayoutMonitor *)&v12 init];
  objc_super v3 = v2;
  if (v2)
  {
    if ([(INCDisplayLayoutMonitor *)v2 shouldObserveMultipleDisplays])
    {
      uint64_t v4 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x1E4F62970]);
      displayMonitor = v3->_displayMonitor;
      v3->_displayMonitor = v4;
      uint64_t v6 = v4;

      id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      layoutMonitorsByIdentity = v3->_layoutMonitorsByIdentity;
      v3->_layoutMonitorsByIdentity = v7;
    }
    else
    {
      id v9 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "-[INCDisplayLayoutMonitor init]";
        _os_log_fault_impl(&dword_1BC57D000, v9, OS_LOG_TYPE_FAULT, "%s Process is using INCDisplayLayoutMonitor but doesn't have access to the render server — multiple display observing will not work", buf, 0xCu);
      }
    }
    v3->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = v3;
  }

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end