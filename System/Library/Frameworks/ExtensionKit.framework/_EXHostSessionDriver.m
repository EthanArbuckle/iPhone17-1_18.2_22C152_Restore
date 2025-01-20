@interface _EXHostSessionDriver
- (BOOL)active;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableArray)deactivatingSessions;
- (OS_dispatch_source)deactivateSessionTimer;
- (_EXHostConfiguration)retryProcessConfiguration;
- (_EXHostSessionDriver)initWithHostViewController:(id)a3;
- (_EXHostViewControllerProtocol)hostViewController;
- (_EXHostViewControllerSession)activeSession;
- (_EXHostViewControllerSession)session;
- (_EXHostViewControllerSessionConfiguration)retrySessionConfiguration;
- (id)extensionProcess;
- (id)hostSessionHostView:(id)a3;
- (id)makeXPCConnectionWithError:(id *)a3;
- (void)addShieldView;
- (void)dealloc;
- (void)hostSessionDidInvalidate:(id)a3;
- (void)hostSessionDidPrepareForHosting:(id)a3;
- (void)hostSessionViewControllerReady:(id)a3;
- (void)invalidateDeactivatingSessions;
- (void)notifyHostViewControllerDidEndHosting:(id)a3;
- (void)notifyHostViewControllerWillDeactivate:(id)a3;
- (void)removeShieldView;
- (void)resume;
- (void)scheduleInvalidations;
- (void)setActive:(BOOL)a3;
- (void)setActiveSession:(id)a3;
- (void)setDeactivateSessionTimer:(id)a3;
- (void)setDeactivatingSessions:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setRetryProcessConfiguration:(id)a3;
- (void)setRetrySessionConfiguration:(id)a3;
- (void)setSession:(id)a3;
- (void)startSessionWithProcessConfiguration:(id)a3 configuration:(id)a4;
@end

@implementation _EXHostSessionDriver

- (_EXHostSessionDriver)initWithHostViewController:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EXHostSessionDriver;
  id v5 = [(_EXHostSessionDriver *)&v15 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v6;

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    v9 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v5 + 6), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v10 = *((void *)v5 + 6);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51___EXHostSessionDriver_initWithHostViewController___block_invoke;
    v12[3] = &unk_2642584E0;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_resume(*((dispatch_object_t *)v5 + 6));
    objc_storeWeak((id *)v5 + 8, v4);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return (_EXHostSessionDriver *)v5;
}

- (void)dealloc
{
}

- (void)resume
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = self->_session;
  if (v3)
  {
    uint64_t v6 = v3;
    if (![(_EXHostViewControllerSession *)v3 detached])
    {
      id v4 = [(_EXHostViewControllerSession *)v6 configuration];
      char v5 = [v4 beginHostingImmediately];

      if ((v5 & 1) == 0) {
        [(_EXHostViewControllerSession *)v6 resume];
      }
    }
  }
  self->_active = 1;

  MEMORY[0x270F9A758]();
}

- (void)startSessionWithProcessConfiguration:(id)a3 configuration:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v8 && v6 | v7)
  {
    v10 = _EXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:].cold.5();
    }
  }
  v11 = _EXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:].cold.4();
  }

  retryProcessConfiguration = self->_retryProcessConfiguration;
  self->_retryProcessConfiguration = 0;

  retrySessionConfiguration = self->_retrySessionConfiguration;
  self->_retrySessionConfiguration = 0;

  p_session = &self->_session;
  session = self->_session;
  v16 = session;
  v17 = v16;
  p_activeSession = (id *)&self->_activeSession;
  if (!self->_activeSession)
  {
    unint64_t v37 = v7;
    int v19 = v9;
    unint64_t v20 = v6;
    v21 = [(_EXHostViewControllerSession *)v16 extensionProcess];
    v22 = [v21 extensionIdentity];
    if ([v22 requiresUIKitSceneHosting]
      && ([(_EXHostViewControllerSession *)v17 sceneViewController],
          (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      unint64_t v6 = v20;
      int v9 = v19;
      unint64_t v7 = v37;
    }
    else
    {
      v24 = [(_EXHostViewControllerSession *)v17 remoteViewController];

      unint64_t v6 = v20;
      int v9 = v19;
      unint64_t v7 = v37;
      if (!v24) {
        goto LABEL_21;
      }
    }
    objc_storeStrong((id *)&self->_activeSession, session);
  }
LABEL_21:
  if (v17)
  {
    if ([(_EXHostViewControllerSession *)v17 state] >= 2) {
      [(_EXHostSessionDriver *)self notifyHostViewControllerWillDeactivate:v17];
    }
    [(_EXHostViewControllerSession *)v17 setDelegate:0];
    if (v17 != *p_activeSession)
    {
      v25 = _EXDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]((uint64_t)v17, v25, v26);
      }

      [(_EXHostViewControllerSession *)v17 invalidate];
    }
  }
  if (v9)
  {
    v27 = [[_EXHostViewControllerSession alloc] initWithProcessConfiguration:v6 configuration:v7];
    [(_EXHostViewControllerSession *)v27 setDelegate:self];
    objc_storeStrong((id *)&self->_session, v27);
    [(_EXHostViewControllerSession *)v27 setDetached:1];
    v28 = [(_EXHostSessionDriver *)self hostViewController];
    [v28 setSession:self->_session];

    [(_EXHostViewControllerSession *)self->_session setDetached:0];
    v29 = [(_EXHostViewControllerSession *)self->_session configuration];
    int v30 = [v29 beginHostingImmediately];

    if (v30)
    {
      v31 = _EXDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unint64_t v39 = v7;
        _os_log_impl(&dword_2156DD000, v31, OS_LOG_TYPE_DEFAULT, "Client has requested immediate hosting for configuration: %{public}@", buf, 0xCu);
      }

      goto LABEL_42;
    }
    if (self->_active) {
LABEL_42:
    }
      [(_EXHostViewControllerSession *)*p_session resume];
  }
  else
  {
    v32 = _EXDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]();
    }

    [(_EXHostViewControllerSession *)*p_session invalidate];
    id v33 = *p_activeSession;
    if (*p_activeSession != *p_session)
    {
      v34 = _EXDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]();
      }

      [*p_activeSession invalidate];
      id v33 = *p_activeSession;
    }
    if (v33)
    {
      -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:](self, "notifyHostViewControllerDidEndHosting:");
      activeSession = self->_activeSession;
    }
    else
    {
      activeSession = 0;
    }
    self->_activeSession = 0;

    v36 = self->_session;
    self->_session = 0;

    v27 = [(_EXHostSessionDriver *)self hostViewController];
    [(_EXHostViewControllerSession *)v27 embedViewController:0];
  }
}

- (_EXHostViewControllerSession)session
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  session = self->_session;

  return session;
}

- (void)setSession:(id)a3
{
  char v5 = (_EXHostViewControllerSession *)a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t v6 = _EXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_EXHostSessionDriver setSession:].cold.5();
  }

  p_session = &self->_session;
  session = self->_session;
  if (session == v5)
  {
    _EXDefaultLog();
    int v9 = (_EXHostViewControllerSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEBUG)) {
      -[_EXHostSessionDriver setSession:]();
    }
  }
  else
  {
    int v9 = session;
    retryProcessConfiguration = self->_retryProcessConfiguration;
    self->_retryProcessConfiguration = 0;

    retrySessionConfiguration = self->_retrySessionConfiguration;
    self->_retrySessionConfiguration = 0;

    if (v9)
    {
      if ([(_EXHostViewControllerSession *)v9 state] >= 2) {
        [(_EXHostSessionDriver *)self notifyHostViewControllerWillDeactivate:v5];
      }
      [(_EXHostViewControllerSession *)v9 setDelegate:0];
      if (v9 != self->_activeSession && ![(_EXHostViewControllerSession *)v9 detached])
      {
        v12 = _EXDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[_EXHostSessionDriver setSession:].cold.4();
        }

        [(_EXHostViewControllerSession *)v9 invalidate];
      }
    }
    id v13 = *p_session;
    *p_session = 0;

    if (v5)
    {
      v14 = [(_EXHostViewControllerSession *)v5 extensionProcess];
      objc_super v15 = [v14 extensionIdentity];
      if ([v15 requiresUIKitSceneHosting])
      {
        v16 = [(_EXHostViewControllerSession *)v5 sceneViewController];
        if (v16)
        {

LABEL_19:
          objc_storeStrong((id *)&self->_session, a3);
          [(_EXHostSessionDriver *)self hostSessionViewControllerReady:v5];
          goto LABEL_35;
        }
      }
      v17 = [(_EXHostViewControllerSession *)v5 remoteViewController];

      if (v17) {
        goto LABEL_19;
      }
      [(_EXHostSessionDriver *)self notifyHostViewControllerDidEndHosting:v5];
    }
    if (![(_EXHostViewControllerSession *)v9 detached])
    {
      v18 = _EXDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_EXHostSessionDriver setSession:]();
      }

      [(_EXHostViewControllerSession *)v9 invalidate];
    }
    p_activeSession = &self->_activeSession;
    activeSession = self->_activeSession;
    v21 = v9;
    if (activeSession != v9)
    {
      if (![(_EXHostViewControllerSession *)activeSession detached])
      {
        v22 = _EXDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          [(_EXHostSessionDriver *)(uint64_t *)&self->_activeSession setSession:v23];
        }

        [(_EXHostViewControllerSession *)*p_activeSession invalidate];
      }
      v21 = *p_activeSession;
    }
    if (v21)
    {
      -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:](self, "notifyHostViewControllerDidEndHosting:");
      v24 = self->_activeSession;
    }
    else
    {
      v24 = 0;
    }
    self->_activeSession = 0;

    v25 = [(_EXHostSessionDriver *)self hostViewController];
    [v25 embedViewController:0];
  }
LABEL_35:
}

- (void)scheduleInvalidations
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2156DD000, log, OS_LOG_TYPE_DEBUG, "Scheduling inactive session invalidation", v1, 2u);
}

- (void)invalidateDeactivatingSessions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  dispatch_source_set_timer((dispatch_source_t)self->_deactivateSessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v10 = self;
  v3 = self->_deactivatingSessions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 detached] & 1) == 0)
        {
          int v9 = _EXDefaultLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446466;
            v16 = "-[_EXHostSessionDriver invalidateDeactivatingSessions]";
            __int16 v17 = 2114;
            v18 = v8;
          }

          [v8 invalidate];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)v10->_deactivatingSessions removeAllObjects];
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  session = self->_session;
  if (session)
  {
    uint64_t v5 = [(_EXHostViewControllerSession *)session _makeXPCConnectionWithError:a3];
  }
  else if (a3)
  {
    uint64_t v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_EXHostSessionDriver makeXPCConnectionWithError:](v6);
    }

    id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F04DA8] code:6 userInfo:MEMORY[0x263EFFA78]];
    uint64_t v5 = 0;
    *a3 = v7;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)extensionProcess
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = [(_EXHostSessionDriver *)self session];
  uint64_t v4 = [v3 extensionProcess];

  if (v4) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F04DD0]) initWithInternalExtensionProcess:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)hostSessionDidPrepareForHosting:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(_EXHostSessionDriver *)self session];

  if (v5 == v4)
  {
    p_hostViewController = &self->_hostViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    BOOL v8 = [WeakRetained delegate];
    id v9 = objc_loadWeakRetained((id *)p_hostViewController);
    v10 = [v9 placeholderView];

    long long v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_EXHostSessionDriver hostSessionDidPrepareForHosting:]();
    }

    if (objc_opt_respondsToSelector()) {
      [v8 hostViewControllerDidActivate:WeakRetained];
    }
    if (objc_opt_respondsToSelector()) {
      [v10 hostViewControllerDidActivate:WeakRetained];
    }
    long long v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_EXHostSessionDriver hostSessionDidPrepareForHosting:]();
    }

    long long v13 = [v4 configuration];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
      {
LABEL_14:

        return;
      }
      long long v13 = [v4 configuration];
      [v8 hostViewController:WeakRetained didPrepareToHost:v13];
    }

    goto LABEL_14;
  }
  objc_super v15 = _EXDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    -[_EXHostSessionDriver hostSessionDidPrepareForHosting:]();
  }

  __break(1u);
}

- (void)hostSessionViewControllerReady:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(_EXHostSessionDriver *)self session];

  if (v5 != v4)
  {
    long long v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.6();
    }
    goto LABEL_32;
  }
  uint64_t v6 = [(_EXHostSessionDriver *)self session];
  id v7 = [v6 extensionProcess];
  BOOL v8 = [v7 extensionIdentity];
  int v9 = [v8 requiresUIKitSceneHosting];

  if (v9)
  {
    v10 = [v4 sceneViewController];

    if (!v10)
    {
      long long v11 = _EXDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[_EXHostSessionDriver hostSessionViewControllerReady:]();
      }
LABEL_32:

      __break(1u);
      return;
    }
  }
  else
  {
    long long v12 = [v4 remoteViewController];

    if (!v12)
    {
      long long v11 = _EXDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.5();
      }
      goto LABEL_32;
    }
  }
  long long v13 = _EXDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_EXHostSessionDriver hostSessionViewControllerReady:].cold.4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_super v15 = [WeakRetained delegate];
  p_activeSession = &self->_activeSession;
  if (self->_activeSession)
  {
    if ([v4 maxState] == 4)
    {
      __int16 v17 = _EXDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[_EXHostSessionDriver hostSessionViewControllerReady:]();
      }

      v18 = [(_EXHostViewControllerSession *)*p_activeSession configuration];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        v18 = [(_EXHostViewControllerSession *)*p_activeSession configuration];
        uint64_t v20 = [(_EXHostViewControllerSession *)*p_activeSession error];
        [v15 hostViewController:WeakRetained didEndHosting:v18 error:v20];

LABEL_16:
      }
    }
    [(NSMutableArray *)self->_deactivatingSessions addObject:self->_activeSession];
    [(_EXHostSessionDriver *)self scheduleInvalidations];
    activeSession = self->_activeSession;
    self->_activeSession = 0;
  }
  v22 = _EXDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[_EXHostSessionDriver hostSessionViewControllerReady:]();
  }

  uint64_t v23 = [v4 configuration];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    uint64_t v23 = [v4 configuration];
    [v15 hostViewController:WeakRetained didBeginHosting:v23];
LABEL_23:
  }
  v25 = [(_EXHostSessionDriver *)self session];
  uint64_t v26 = [v25 extensionProcess];
  v27 = [v26 extensionIdentity];
  int v28 = [v27 requiresUIKitSceneHosting];

  v29 = [(_EXHostSessionDriver *)self hostViewController];
  if (v28) {
    [v4 sceneViewController];
  }
  else {
  int v30 = [v4 remoteViewController];
  }
  [v29 embedViewController:v30];
}

- (void)notifyHostViewControllerWillDeactivate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  p_hostViewController = &self->_hostViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  id v7 = [WeakRetained delegate];
  id v8 = objc_loadWeakRetained((id *)p_hostViewController);
  int v9 = [v8 placeholderView];

  v10 = _EXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_EXHostSessionDriver notifyHostViewControllerWillDeactivate:]();
  }

  if (objc_opt_respondsToSelector())
  {
    long long v11 = [v4 error];
    [v7 hostViewControllerWillDeactivate:WeakRetained error:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v12 = [v4 error];
    [v9 hostViewControllerWillDeactivate:WeakRetained error:v12];
  }
}

- (void)notifyHostViewControllerDidEndHosting:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  uint64_t v6 = [WeakRetained delegate];
  if ([v4 maxState] == 4)
  {
    id v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:]();
    }

    id v8 = [v4 configuration];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v8 = [v4 configuration];
      v10 = [v4 error];
      [v6 hostViewController:WeakRetained didEndHosting:v8 error:v10];
LABEL_13:

LABEL_14:
    }
  }
  else
  {
    long long v11 = [v4 error];

    if (v11)
    {
      long long v12 = _EXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[_EXHostSessionDriver notifyHostViewControllerDidEndHosting:]();
      }

      id v8 = [v4 configuration];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v8 = [v4 configuration];
        v10 = [v4 error];
        [v6 hostViewController:WeakRetained didFailToHost:v8 error:v10];
        goto LABEL_13;
      }
    }
  }
}

- (void)hostSessionDidInvalidate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(_EXHostSessionDriver *)self session];

  if (v5 == v4)
  {
    [(_EXHostSessionDriver *)self setSession:0];
    [(_EXHostSessionDriver *)self notifyHostViewControllerWillDeactivate:v4];
    [(_EXHostSessionDriver *)self notifyHostViewControllerDidEndHosting:v4];
    uint64_t v6 = [(_EXHostSessionDriver *)self hostViewController];
    [v6 embedViewController:0];

    id v7 = [v4 configuration];
    int v8 = [v7 retryOnHostingFailure];

    if (v8)
    {
      char v9 = [v4 processConfiguration];
      retryProcessConfiguration = self->_retryProcessConfiguration;
      self->_retryProcessConfiguration = v9;

      long long v11 = [v4 configuration];
      retrySessionConfiguration = self->_retrySessionConfiguration;
      self->_retrySessionConfiguration = v11;
    }
    else
    {
      char v13 = self->_retryProcessConfiguration;
      self->_retryProcessConfiguration = 0;

      retrySessionConfiguration = self->_retrySessionConfiguration;
      self->_retrySessionConfiguration = 0;
    }

    if (self->_retryProcessConfiguration)
    {
      if (self->_retrySessionConfiguration)
      {
        objc_initWeak(&location, self);
        char v14 = [MEMORY[0x263F04DB8] sharedInstance];
        [v14 defaultRetryFailedSessionDelay];
        dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49___EXHostSessionDriver_hostSessionDidInvalidate___block_invoke;
        block[3] = &unk_264258638;
        objc_copyWeak(&v20, &location);
        block[4] = self;
        __int16 v17 = (void *)MEMORY[0x263EF83A0];
        dispatch_after(v16, MEMORY[0x263EF83A0], block);

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    v18 = _EXDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[_EXHostSessionDriver hostSessionDidInvalidate:]();
    }

    __break(1u);
  }
}

- (id)hostSessionHostView:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(_EXHostSessionDriver *)self session];

  if (v5 == v4)
  {
    uint64_t v6 = [(_EXHostSessionDriver *)self hostViewController];
    id v7 = [v6 view];

    return v7;
  }
  else
  {
    char v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXHostSessionDriver hostSessionHostView:]();
    }

    __break(1u);
  }
  return result;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  uint64_t v6 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    char v7 = [v6 shouldAcceptXPCConnection:v4];
  }
  else
  {
    int v8 = _EXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_EXHostSessionDriver shouldAcceptXPCConnection:]();
    }

    char v7 = 0;
  }

  return v7;
}

- (void)addShieldView
{
  id v2 = [(_EXHostSessionDriver *)self hostViewController];
  [v2 addShieldView];
}

- (void)removeShieldView
{
  id v2 = [(_EXHostSessionDriver *)self hostViewController];
  [v2 removeShieldView];
}

- (_EXHostViewControllerSession)activeSession
{
  return (_EXHostViewControllerSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveSession:(id)a3
{
}

- (_EXHostConfiguration)retryProcessConfiguration
{
  return (_EXHostConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRetryProcessConfiguration:(id)a3
{
}

- (_EXHostViewControllerSessionConfiguration)retrySessionConfiguration
{
  return (_EXHostViewControllerSessionConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRetrySessionConfiguration:(id)a3
{
}

- (OS_dispatch_source)deactivateSessionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeactivateSessionTimer:(id)a3
{
}

- (NSMutableArray)deactivatingSessions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeactivatingSessions:(id)a3
{
}

- (_EXHostViewControllerProtocol)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (_EXHostViewControllerProtocol *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_deactivatingSessions, 0);
  objc_storeStrong((id *)&self->_deactivateSessionTimer, 0);
  objc_storeStrong((id *)&self->_retrySessionConfiguration, 0);
  objc_storeStrong((id *)&self->_retryProcessConfiguration, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  v3 = "-[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]";
  OUTLINED_FUNCTION_10();
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  v3 = "-[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]";
  OUTLINED_FUNCTION_10();
}

- (void)startSessionWithProcessConfiguration:(uint64_t)a3 configuration:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136446466;
  uint64_t v4 = "-[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_2156DD000, v0, v1, "EXHostViewController: start session with configuration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)startSessionWithProcessConfiguration:configuration:.cold.5()
{
  OUTLINED_FUNCTION_5_1();
  uint8_t v7 = v0;
  OUTLINED_FUNCTION_0();
}

- (void)setSession:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_2156DD000, v0, v1, "EXHostViewController: session to current active session: %@", v2, v3, v4, v5, v6);
}

- (void)setSession:(uint64_t)a3 .cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 136315394;
  uint64_t v5 = "-[_EXHostSessionDriver setSession:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
}

- (void)setSession:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_11();
}

- (void)setSession:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_11();
}

- (void)setSession:.cold.5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_2156DD000, v0, v1, "EXHostViewController: set session : %@", v2, v3, v4, v5, v6);
}

- (void)makeXPCConnectionWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2156DD000, log, OS_LOG_TYPE_ERROR, "Attempt to make XPC connection with nil session", v1, 2u);
}

- (void)hostSessionDidPrepareForHosting:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2156DD000, v0, v1, "EXHostViewController: Will try to call delegate %p 'hostViewController:didPrepareToHost:' for session: %{public}@");
}

- (void)hostSessionDidPrepareForHosting:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2156DD000, v0, v1, "EXHostViewController: Will try to call delegate %p 'hostViewControllerDidActivate:' for session: %{public}@");
}

- (void)hostSessionDidPrepareForHosting:.cold.3()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
}

- (void)hostSessionViewControllerReady:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  uint8_t v7 = v0;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_2156DD000, v1, v2, "%s - %s:%d: Unexpected nil scene view controller", v3, v4, v5, v6, v7);
}

- (void)hostSessionViewControllerReady:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2156DD000, v0, v1, "EXHostViewController: Will try to call delegate %p 'hostViewController:didBeginHosting:' for session: %{public}@");
}

- (void)hostSessionViewControllerReady:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_2(&dword_2156DD000, v0, v1, "EXHostViewController: Will try to call delegate %p 'hostViewController:didEndHosting:error:' for session: %{public}@");
}

- (void)hostSessionViewControllerReady:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_2156DD000, v0, v1, "EXHostViewController: host session view controller ready for session: %{public}@", v2, v3, v4, v5, v6);
}

- (void)hostSessionViewControllerReady:.cold.5()
{
  OUTLINED_FUNCTION_5_1();
  uint8_t v7 = v0;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_2156DD000, v1, v2, "%s - %s:%d: Unexpected nil view controller", v3, v4, v5, v6, v7);
}

- (void)hostSessionViewControllerReady:.cold.6()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
}

- (void)notifyHostViewControllerWillDeactivate:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2156DD000, v0, v1, "EXHostViewController: Will try to call delegate %p 'hostViewControllerWillDeactivate:error:' for session: %{public}@");
}

- (void)notifyHostViewControllerDidEndHosting:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2156DD000, v0, v1, "EXHostViewController: Will try to call delegate %p 'hostViewController:didEndHosting:error:' for session: %{public}@");
}

- (void)notifyHostViewControllerDidEndHosting:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2156DD000, v0, v1, "EXHostViewController: Will try to call delegate %p 'hostViewController:didFailToHost:error:' for session: %{public}@");
}

- (void)hostSessionDidInvalidate:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
}

- (void)hostSessionHostView:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
}

- (void)shouldAcceptXPCConnection:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
}

@end