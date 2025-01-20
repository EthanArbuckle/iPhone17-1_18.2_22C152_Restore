@interface SWCollaborationCoordinator
+ (SWCollaborationCoordinator)sharedCoordinator;
- (BOOL)applicationIsReadyForActions;
- (NSCache)actionCache;
- (NSMutableArray)cachedUUIDs;
- (SWCollaborationCoordinator)init;
- (id)actionHandler;
- (void)_cacheAction:(id)a3;
- (void)_sendActionToApp:(id)a3;
- (void)_sendStartCollaborationAction:(id)a3;
- (void)_sendUndeliveredActionsIfNecessary;
- (void)_sendUpdateCollaborationParticipantsAction:(id)a3;
- (void)applicationHasFinishedLaunching;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)processIncomingAction:(id)a3;
- (void)processIncomingActions:(id)a3;
- (void)setActionCache:(id)a3;
- (void)setActionHandler:(id)actionHandler;
- (void)setApplicationIsReadyForActions:(BOOL)a3;
- (void)setCachedUUIDs:(id)a3;
@end

@implementation SWCollaborationCoordinator

- (void)applicationHasFinishedLaunching
{
}

- (void)setApplicationIsReadyForActions:(BOOL)a3
{
  if (self->_applicationIsReadyForActions != a3)
  {
    self->_applicationIsReadyForActions = a3;
    [(SWCollaborationCoordinator *)self _sendUndeliveredActionsIfNecessary];
  }
}

- (void)_sendUndeliveredActionsIfNecessary
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SWCollaborationCoordinator *)self actionHandler];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(SWCollaborationCoordinator *)self cachedUUIDs];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      BOOL v7 = [(SWCollaborationCoordinator *)self applicationIsReadyForActions];
      v8 = SWFrameworkLogHandle();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          v10 = [(SWCollaborationCoordinator *)self cachedUUIDs];
          *(_DWORD *)buf = 136315394;
          v26 = "-[SWCollaborationCoordinator _sendUndeliveredActionsIfNecessary]";
          __int16 v27 = 2048;
          uint64_t v28 = [v10 count];
          _os_log_impl(&dword_18C0DE000, v8, OS_LOG_TYPE_DEFAULT, "%s: We have %lu undelivered actions, and an action handler. Sending them now.", buf, 0x16u);
        }
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v11 = [(SWCollaborationCoordinator *)self cachedUUIDs];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
              v17 = [(SWCollaborationCoordinator *)self actionCache];
              v18 = [v17 objectForKey:v16];

              v19 = [(SWCollaborationCoordinator *)self actionCache];
              [v19 removeObjectForKey:v16];

              if (v18) {
                [(SWCollaborationCoordinator *)self _sendActionToApp:v18];
              }

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v13);
        }

        v8 = [MEMORY[0x1E4F1CA48] array];
        [(SWCollaborationCoordinator *)self setCachedUUIDs:v8];
      }
      else if (v9)
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[SWCollaborationCoordinator _sendUndeliveredActionsIfNecessary]";
        _os_log_impl(&dword_18C0DE000, v8, OS_LOG_TYPE_DEFAULT, "%s: We have undelivered actions, and an action handler, but applicationIsReadyForActions=NO so the app must not have yet finished launching.", buf, 0xCu);
      }
    }
  }
}

- (id)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return WeakRetained;
}

+ (SWCollaborationCoordinator)sharedCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SWCollaborationCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_onceToken != -1) {
    dispatch_once(&sharedCoordinator_onceToken, block);
  }
  v2 = (void *)sharedCoordinator_shared;

  return (SWCollaborationCoordinator *)v2;
}

uint64_t __47__SWCollaborationCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  sharedCoordinator_shared = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (SWCollaborationCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationCoordinator;
  v2 = [(SWCollaborationCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    actionCache = v2->_actionCache;
    v2->_actionCache = v3;

    [(NSCache *)v2->_actionCache setCountLimit:10];
    [(NSCache *)v2->_actionCache setDelegate:v2];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    cachedUUIDs = v2->_cachedUUIDs;
    v2->_cachedUUIDs = (NSMutableArray *)v5;

    v2->_applicationIsReadyForActions = 0;
  }
  return v2;
}

- (void)setActionHandler:(id)actionHandler
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = actionHandler;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  if (WeakRetained != v4)
  {
    uint64_t v6 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      objc_super v8 = "-[SWCollaborationCoordinator setActionHandler:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_18C0DE000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_storeWeak((id *)&self->_actionHandler, v4);
    [(SWCollaborationCoordinator *)self _sendUndeliveredActionsIfNecessary];
  }
}

- (void)processIncomingActions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SWCollaborationCoordinator *)self processIncomingAction:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)processIncomingAction:(id)a3
{
  id v5 = a3;
  id v4 = [(SWCollaborationCoordinator *)self actionHandler];

  if (v4) {
    [(SWCollaborationCoordinator *)self _sendActionToApp:v5];
  }
  else {
    [(SWCollaborationCoordinator *)self _cacheAction:v5];
  }
}

- (void)_sendActionToApp:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SWCollaborationCoordinator *)self _sendStartCollaborationAction:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SWCollaborationCoordinator *)self _sendUpdateCollaborationParticipantsAction:v4];
    }
  }
}

- (void)_sendStartCollaborationAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SWCollaborationCoordinator *)self actionHandler];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl(&dword_18C0DE000, v7, OS_LOG_TYPE_DEFAULT, "_sendStartCollaborationAction: invoking the action handler", v10, 2u);
    }

    uint64_t v8 = [(SWCollaborationCoordinator *)self actionHandler];
    [v8 collaborationCoordinator:self handleStartCollaborationAction:v4];
LABEL_8:

    goto LABEL_9;
  }
  long long v9 = [(SWCollaborationCoordinator *)self actionHandler];

  if (v9)
  {
    uint64_t v8 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SWCollaborationCoordinator _sendStartCollaborationAction:](v4);
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_sendUpdateCollaborationParticipantsAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SWCollaborationCoordinator *)self actionHandler];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke;
    v9[3] = &unk_1E54D85F0;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else
  {
    uint64_t v7 = [(SWCollaborationCoordinator *)self actionHandler];

    if (v7)
    {
      uint64_t v8 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SWCollaborationCoordinator _sendUpdateCollaborationParticipantsAction:](v4);
      }
    }
  }
}

void __73__SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke(uint64_t a1)
{
  v2 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18C0DE000, v2, OS_LOG_TYPE_DEFAULT, "_sendUpdateCollaborationParticipantsAction: invoking the action handler", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) actionHandler];
  [v3 collaborationCoordinator:*(void *)(a1 + 32) handleUpdateCollaborationParticipantsAction:*(void *)(a1 + 40)];
}

- (void)_cacheAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 uuid];
    int v11 = 136315650;
    long long v12 = "-[SWCollaborationCoordinator _cacheAction:]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_18C0DE000, v5, OS_LOG_TYPE_DEFAULT, "[%s] action: %@ uuid: %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v7 = [(SWCollaborationCoordinator *)self actionCache];
  uint64_t v8 = [v4 uuid];
  [v7 setObject:v4 forKey:v8];

  long long v9 = [(SWCollaborationCoordinator *)self cachedUUIDs];
  id v10 = [v4 uuid];
  [v9 addObject:v10];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SWCollaborationCoordinator *)self actionCache];
  if (v8 == v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = v7;
      int v11 = [(SWCollaborationCoordinator *)self cachedUUIDs];
      long long v12 = [v10 uuid];
      [v11 removeObject:v12];

      __int16 v13 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v10 uuid];
        int v15 = 138412546;
        id v16 = v10;
        __int16 v17 = 2112;
        v18 = v14;
        _os_log_impl(&dword_18C0DE000, v13, OS_LOG_TYPE_DEFAULT, "We're evicting a cached action not yet sent to app, which means this action will be dropped. action: %@ uuid: %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
  }
}

- (NSCache)actionCache
{
  return self->_actionCache;
}

- (void)setActionCache:(id)a3
{
}

- (NSMutableArray)cachedUUIDs
{
  return self->_cachedUUIDs;
}

- (void)setCachedUUIDs:(id)a3
{
}

- (BOOL)applicationIsReadyForActions
{
  return self->_applicationIsReadyForActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUUIDs, 0);
  objc_storeStrong((id *)&self->_actionCache, 0);

  objc_destroyWeak((id *)&self->_actionHandler);
}

void __74___SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke(uint64_t a1)
{
  v2 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18C0DE000, v2, OS_LOG_TYPE_DEFAULT, "_sendUpdateCollaborationParticipantsAction: invoking the action handler", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) actionHandler];
  [v3 handleUpdateCollaborationParticipantsAction:*(void *)(a1 + 40)];
}

- (void)_sendStartCollaborationAction:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 uuid];
  OUTLINED_FUNCTION_0_0(&dword_18C0DE000, v2, v3, "SWCollaborationCoordinator's actionHandler doesn't implement handleStartCollaborationAction. Dropping action: %@", v4, v5, v6, v7, 2u);
}

- (void)_sendUpdateCollaborationParticipantsAction:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 uuid];
  OUTLINED_FUNCTION_0_0(&dword_18C0DE000, v2, v3, "SWCollaborationCoordinator's actionHandler doesn't implement handleUpdateCollaborationParticipantsAction. Dropping action: %@", v4, v5, v6, v7, 2u);
}

@end