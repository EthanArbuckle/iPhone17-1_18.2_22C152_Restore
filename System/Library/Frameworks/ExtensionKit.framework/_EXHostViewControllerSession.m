@interface _EXHostViewControllerSession
+ (void)sessionWithProcess:(id)a3 configuration:(id)a4 completion:(id)a5;
+ (void)sessionWithProcessConfiguration:(id)a3 configuration:(id)a4 completion:(id)a5;
- ($80EAFF0CD8238926FA3B8E6E6D99B750)activity;
- (APExtensionSubjectMonitorRegistry)subjectMonitorRegistry;
- (APSubjectMonitorSubscription)subjectMonitorSubscription;
- (BOOL)detached;
- (BOOL)isLocked;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)requiresFBSceneHosting;
- (NSError)error;
- (NSUUID)uuid;
- (NSXPCConnection)sceneSessionConnection;
- (NSXPCListener)hostListener;
- (NSXPCListenerEndpoint)remoteViewControllerEndpoint;
- (OS_dispatch_queue)internalQueue;
- (UIView)hostView;
- (UIViewController)sceneViewController;
- (_EXExtensionProcessHandle)extensionProcess;
- (_EXHostConfiguration)processConfiguration;
- (_EXHostViewControllerSession)initWithProcessConfiguration:(id)a3 configuration:(id)a4;
- (_EXHostViewControllerSession)initWithProcessConfiguration:(id)a3 configuration:(id)a4 detached:(BOOL)a5;
- (_EXHostViewControllerSessionConfiguration)configuration;
- (_EXHostViewControllerSessionDelegate)delegate;
- (_EXRemoteViewController)remoteViewController;
- (_UIRemoteSheet)remoteSheet;
- (_UISceneHostingController)hostingController;
- (id)_makeXPCConnectionWithError:(id *)a3;
- (id)invalidationHandler;
- (id)makeXPCConnectionWithError:(id *)a3;
- (id)readyBlock;
- (unint64_t)maxState;
- (unint64_t)signpost;
- (unint64_t)state;
- (void)_internalQueue_prepareToHost;
- (void)_invalidateSession;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)clientIsReady;
- (void)dealloc;
- (void)invalidate;
- (void)makeSceneHostViewController;
- (void)processDidInvalidate:(id)a3;
- (void)requestRemoteViewController;
- (void)resume;
- (void)resumeWithReadyNotification:(id)a3;
- (void)setActivity:(id *)a3;
- (void)setDelegate:(id)a3;
- (void)setDetached:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setExtensionProcess:(id)a3;
- (void)setHostListener:(id)a3;
- (void)setHostView:(id)a3;
- (void)setHostingController:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMaxState:(unint64_t)a3;
- (void)setReadyBlock:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRemoteViewControllerEndpoint:(id)a3;
- (void)setSceneSessionConnection:(id)a3;
- (void)setSceneViewController:(id)a3;
- (void)setSignpost:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setSubjectMonitorRegistry:(id)a3;
- (void)setSubjectMonitorSubscription:(id)a3;
@end

@implementation _EXHostViewControllerSession

+ (void)sessionWithProcess:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 configuration];
  [a1 sessionWithProcessConfiguration:v10 configuration:v9 completion:v8];
}

+ (void)sessionWithProcessConfiguration:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[_EXHostViewControllerSession alloc] initWithProcessConfiguration:v9 configuration:v8 detached:1];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke;
  v13[3] = &unk_264258418;
  v14 = v10;
  id v15 = v7;
  id v11 = v7;
  v12 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

- (_EXHostViewControllerSession)initWithProcessConfiguration:(id)a3 configuration:(id)a4
{
  return [(_EXHostViewControllerSession *)self initWithProcessConfiguration:a3 configuration:a4 detached:0];
}

- (_EXHostViewControllerSession)initWithProcessConfiguration:(id)a3 configuration:(id)a4 detached:(BOOL)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_EXHostViewControllerSession;
  id v10 = [(_EXHostViewControllerSession *)&v28 init];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    v13 = _EXSignpostLog();
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v10->_uuid);
    if (v14)
    {
      id v15 = v13;
      v16 = v15;
      if (v14 != -1 && os_signpost_enabled(v15))
      {
        v17 = v10->_uuid;
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "extensionkit-lifecycle", "ID: %@", buf, 0xCu);
      }
    }
    v10->_signpost = v14;
    uint64_t v18 = [v8 copy];
    processConfiguration = v10->_processConfiguration;
    v10->_processConfiguration = (_EXHostConfiguration *)v18;

    uint64_t v20 = [v9 copy];
    configuration = v10->_configuration;
    v10->_configuration = (_EXHostViewControllerSessionConfiguration *)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("_EXHostSession", v22);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v23;

    v10->_state = 0;
    v25 = [v8 extensionIdentity];
    if ([v25 requiresSceneHosting])
    {
      v10->_requiresFBSceneHosting = 1;
    }
    else
    {
      v26 = [v8 extensionIdentity];
      v10->_requiresFBSceneHosting = [v26 requiresFBSceneHosting];
    }
    v10->_detached = a5;
    v10->_isLocked = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sceneSessionConnection invalidate];
  if (self->_signpost)
  {
    v3 = _EXSignpostLog();
    v4 = v3;
    if (self->_signpost && os_signpost_enabled(v3))
    {
      v5 = v4;
      v6 = v5;
      os_signpost_id_t signpost = self->_signpost;
      if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v6, OS_SIGNPOST_INTERVAL_END, signpost, "extensionkit-lifecycle", "dealloc", buf, 2u);
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_EXHostViewControllerSession;
  [(_EXHostViewControllerSession *)&v8 dealloc];
}

- (void)setRemoteViewController:(id)a3
{
  v4 = (_EXRemoteViewController *)a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v4;
}

- (void)setSceneViewController:(id)a3
{
  v4 = (UIViewController *)a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v4;
}

- (_UIRemoteSheet)remoteSheet
{
  hostingController = self->_hostingController;
  if (hostingController)
  {
    v3 = hostingController;
  }
  else
  {
    v3 = [(_EXHostViewControllerSession *)self remoteViewController];
  }

  return v3;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  v3 = [(_EXHostViewControllerSession *)self _makeXPCConnectionWithError:a3];
  if (!v3) {
    v3 = objc_opt_new();
  }

  return v3;
}

- (id)_makeXPCConnectionWithError:(id *)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_requiresFBSceneHosting)
  {
    if (a3)
    {
      v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = *MEMORY[0x263F04DA8];
      uint64_t v22 = *MEMORY[0x263F07F80];
      v23[0] = @"XPC connection is not available for extension points that require scene hosting.";
      id v7 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      objc_super v8 = [v5 errorWithDomain:v6 code:6 userInfo:v7];
      id v9 = 0;
LABEL_4:
      *a3 = v8;

      goto LABEL_15;
    }
    id v9 = 0;
    goto LABEL_15;
  }
  if (self->_state - 2 > 2)
  {
    id v10 = _EXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_EXHostViewControllerSession _makeXPCConnectionWithError:]();
    }
    goto LABEL_11;
  }
  id v10 = [(_EXHostViewControllerSession *)self remoteViewControllerEndpoint];
  if (!v10)
  {
    v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_EXHostViewControllerSession _makeXPCConnectionWithError:]();
    }

    if (a3)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F04DA8];
      uint64_t v20 = *MEMORY[0x263F07F80];
      v21 = @"Remote view controller XPC connection endpoint is nil, the extension probably exited.";
      id v15 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      *a3 = [v13 errorWithDomain:v14 code:6 userInfo:v15];
    }
LABEL_11:
    id v9 = 0;
    goto LABEL_12;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v10];
LABEL_12:

  if (a3 && !v9 && !*a3)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F04DA8];
    uint64_t v18 = *MEMORY[0x263F07F80];
    v19 = @"Attempt to make XPC connection on session in unsupported state.";
    id v7 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    objc_super v8 = [v16 errorWithDomain:v17 code:6 userInfo:v7];
    goto LABEL_4;
  }
LABEL_15:

  return v9;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(_EXHostViewControllerSession *)self extensionProcess];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F251E0]);
    objc_super v8 = [(_EXHostViewControllerSession *)self extensionProcess];
    id v9 = [v8 extensionIdentity];
    id v10 = [(_EXHostViewControllerSession *)self extensionProcess];
    uint64_t v11 = v10;
    if (v10) {
      [v10 auditToken];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    v12 = (void *)[v7 initWithExtensionIdentity:v9 auditToken:v17];

    if ([v5 containsObject:v12])
    {
      int v13 = [v12 isEffectivelyLocked];
      uint64_t v14 = _EXDefaultLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15) {
          -[_EXHostViewControllerSession appProtectionSubjectsChanged:forSubscription:](self);
        }

        self->_isLocked = 1;
        v16 = [(_EXHostViewControllerSession *)self delegate];
        [v16 addShieldView];
      }
      else
      {
        if (v15) {
          -[_EXHostViewControllerSession appProtectionSubjectsChanged:forSubscription:](self);
        }

        self->_isLocked = 0;
        v16 = [(_EXHostViewControllerSession *)self delegate];
        [v16 removeShieldView];
      }
    }
  }
}

- (void)setState:(unint64_t)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t state = self->_state;
  if (state == a3) {
    return;
  }
  if (state == 5)
  {
    uint64_t v6 = _EXDefaultLog();
    id v7 = v6;
    if (a3 != 1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v74 = self;
        __int16 v75 = 2048;
        unint64_t v76 = a3;
        _os_log_impl(&dword_2156DD000, v7, OS_LOG_TYPE_DEFAULT, "Attempted transition of invalidated session %{public}@ to state %lu", buf, 0x16u);
      }

      return;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_EXHostViewControllerSession setState:]();
    }

    __break(1u);
    goto LABEL_69;
  }
  self->_unint64_t state = a3;
  if (a3 == 5)
  {
    objc_super v8 = _EXSignpostLog();
    id v9 = v8;
    if (self->_signpost && os_signpost_enabled(v8))
    {
      id v10 = v9;
      uint64_t v11 = v10;
      os_signpost_id_t signpost = self->_signpost;
      if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v11, OS_SIGNPOST_EVENT, signpost, "extensionkit-lifecycle", "_EXHostSessionStateInvalidated", buf, 2u);
      }
    }
    [(APSubjectMonitorSubscription *)self->_subjectMonitorSubscription invalidate];
    subjectMonitorSubscription = self->_subjectMonitorSubscription;
    self->_subjectMonitorSubscription = 0;

    [(APExtensionSubjectMonitorRegistry *)self->_subjectMonitorRegistry invalidate];
    subjectMonitorRegistry = self->_subjectMonitorRegistry;
    self->_subjectMonitorRegistry = 0;

    self->_isLocked = 0;
    [(_EXExtensionProcessHandle *)self->_extensionProcess removeObserver:self];
    [(NSXPCListener *)self->_hostListener invalidate];
    [(NSXPCConnection *)self->_sceneSessionConnection invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained hostSessionDidInvalidate:self];

    v16 = (void (**)(void))_Block_copy(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v16) {
      v16[2](v16);
    }
    hostListener = self->_hostListener;
    self->_hostListener = 0;

    sceneSessionConnection = self->_sceneSessionConnection;
    self->_sceneSessionConnection = 0;

    extensionProcess = self->_extensionProcess;
    self->_extensionProcess = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
    remoteViewController = self->_remoteViewController;
    self->_remoteViewController = 0;

    remoteViewControllerEndpoint = self->_remoteViewControllerEndpoint;
    self->_remoteViewControllerEndpoint = 0;

    sceneViewController = self->_sceneViewController;
    self->_sceneViewController = 0;

    hostingController = self->_hostingController;
    self->_hostingController = 0;

    v25 = _EXSignpostLog();
    v26 = v25;
    if (self->_signpost && os_signpost_enabled(v25))
    {
      v27 = v26;
      objc_super v28 = v27;
      os_signpost_id_t v29 = self->_signpost;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v28, OS_SIGNPOST_INTERVAL_END, v29, "extensionkit-lifecycle", "invalidated", buf, 2u);
      }
    }
    self->_os_signpost_id_t signpost = 0;
    os_activity_scope_leave(&self->_activity.state);
    goto LABEL_23;
  }
  self->_maxState = a3;
  if (a3 != 1 || state)
  {
    if (a3 != 2 || state != 1)
    {
      if (a3 == 3 && state == 2)
      {
        v46 = _EXSignpostLog();
        v16 = (void (**)(void))v46;
        if (self->_signpost && os_signpost_enabled(v46))
        {
          v47 = v16;
          v48 = v47;
          os_signpost_id_t v49 = self->_signpost;
          if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_2156DD000, v48, OS_SIGNPOST_EVENT, v49, "extensionkit-lifecycle", "_EXHostSessionStateViewControllerRequested", buf, 2u);
          }
        }
      }
      else
      {
        if (a3 != 4 || state != 3)
        {
LABEL_69:
          v70 = _EXDefaultLog();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
            -[_EXHostViewControllerSession setState:]();
          }

          __break(1u);
          return;
        }
        id v50 = objc_alloc(MEMORY[0x263F251E0]);
        v51 = [(_EXHostViewControllerSession *)self extensionProcess];
        v52 = [v51 extensionIdentity];
        v53 = [(_EXHostViewControllerSession *)self extensionProcess];
        v54 = v53;
        if (v53) {
          [v53 auditToken];
        }
        else {
          memset(v71, 0, sizeof(v71));
        }
        v16 = (void (**)(void))[v50 initWithExtensionIdentity:v52 auditToken:v71];

        v55 = (APExtensionSubjectMonitorRegistry *)[objc_alloc(MEMORY[0x263F251E8]) initWithExtensionSubject:v16];
        v56 = self->_subjectMonitorRegistry;
        self->_subjectMonitorRegistry = v55;

        v57 = [(APExtensionSubjectMonitorRegistry *)self->_subjectMonitorRegistry addMonitor:self];
        v58 = self->_subjectMonitorSubscription;
        self->_subjectMonitorSubscription = v57;

        [(APExtensionSubjectMonitorRegistry *)self->_subjectMonitorRegistry resume];
        self->_isLocked = [v16 isEffectivelyLocked];
        v59 = _EXSignpostLog();
        v60 = v59;
        if (self->_signpost && os_signpost_enabled(v59))
        {
          v61 = v60;
          v62 = v61;
          os_signpost_id_t v63 = self->_signpost;
          if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_2156DD000, v62, OS_SIGNPOST_EVENT, v63, "extensionkit-lifecycle", "_EXHostSessionStateViewControllerReady", buf, 2u);
          }
        }
        id v64 = objc_loadWeakRetained((id *)&self->_delegate);
        [v64 hostSessionViewControllerReady:self];

        readyBlock = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_readyBlock;
        if (readyBlock)
        {
          readyBlock[2](readyBlock, v65, v66, v67);
          id v69 = self->_readyBlock;
          self->_readyBlock = 0;
        }
      }
LABEL_23:

      return;
    }
    v40 = _EXSignpostLog();
    v41 = v40;
    if (self->_signpost && os_signpost_enabled(v40))
    {
      v42 = v41;
      v43 = v42;
      os_signpost_id_t v44 = self->_signpost;
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v43, OS_SIGNPOST_EVENT, v44, "extensionkit-lifecycle", "_EXHostSessionStatePrepared", buf, 2u);
      }
    }
    id v45 = objc_loadWeakRetained((id *)&self->_delegate);
    [v45 hostSessionDidPrepareForHosting:self];

    if (self->_requiresFBSceneHosting) {
      [(_EXHostViewControllerSession *)self makeSceneHostViewController];
    }
    else {
      [(_EXHostViewControllerSession *)self requestRemoteViewController];
    }
  }
  else
  {
    v30 = _EXSignpostLog();
    uint64_t v31 = v30;
    if (self->_signpost && os_signpost_enabled(v30))
    {
      v32 = v31;
      v33 = v32;
      os_signpost_id_t v34 = self->_signpost;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v33, OS_SIGNPOST_EVENT, v34, "extensionkit-lifecycle", "_EXHostSessionStatePreparing", buf, 2u);
      }
    }
    v35 = (OS_os_activity *)_os_activity_create(&dword_2156DD000, "View session", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    self->_activity.state.opaque[0] = 0;
    osActivity = self->_activity.osActivity;
    self->_activity.state.opaque[1] = 0;
    self->_activity.osActivity = v35;

    os_activity_scope_enter((os_activity_t)self->_activity.osActivity, &self->_activity.state);
    v37 = [(_EXHostViewControllerSessionConfiguration *)self->_configuration invalidationHandler];
    id v38 = self->_invalidationHandler;
    self->_id invalidationHandler = v37;

    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41___EXHostViewControllerSession_setState___block_invoke;
    block[3] = &unk_264258440;
    block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

- (void)resume
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315906;
  v4 = "_processConfiguration.extensionIdentity";
  __int16 v5 = 2080;
  uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/HostViewController/EXHostViewControllerSession.m";
  __int16 v7 = 1024;
  int v8 = 431;
  __int16 v9 = 2114;
  uint64_t v10 = v2;
  _os_log_fault_impl(&dword_2156DD000, a2, OS_LOG_TYPE_FAULT, "%s - %s:%d: extension is nil for configuration: %{public}@", (uint8_t *)&v3, 0x26u);
}

- (void)resumeWithReadyNotification:(id)a3
{
  v4 = _Block_copy(a3);
  id readyBlock = self->_readyBlock;
  self->_id readyBlock = v4;

  [(_EXHostViewControllerSession *)self resume];
}

- (void)invalidate
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);

  [(_EXHostViewControllerSession *)self setState:5];
}

- (void)processDidInvalidate:(id)a3
{
  id v4 = a3;
  __int16 v5 = _EXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_EXHostViewControllerSession processDidInvalidate:](self);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___EXHostViewControllerSession_processDidInvalidate___block_invoke;
  aBlock[3] = &unk_264258468;
  aBlock[4] = self;
  id v6 = v4;
  id v11 = v6;
  __int16 v7 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v7[2](v7);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53___EXHostViewControllerSession_processDidInvalidate___block_invoke_2;
    block[3] = &unk_264258490;
    __int16 v9 = v7;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

- (void)_invalidateSession
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = [a1 extensionProcess];
  __int16 v5 = [a1 uuid];
  int v6 = 138543618;
  __int16 v7 = v4;
  __int16 v8 = 2114;
  __int16 v9 = v5;
  _os_log_debug_impl(&dword_2156DD000, a2, OS_LOG_TYPE_DEBUG, "The extension proceess '%{public}@' providing the UI did invalidate session: '%{public}@'", (uint8_t *)&v6, 0x16u);
}

- (void)_internalQueue_prepareToHost
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_2156DD000, log, OS_LOG_TYPE_FAULT, "Attempt to host remote user interface from non-UI extension point '%{public}@'", buf, 0xCu);
}

- (void)requestRemoteViewController
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2156DD000, v0, OS_LOG_TYPE_DEBUG, "Using legacy view services path", v1, 2u);
}

- (void)makeSceneHostViewController
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = "_requiresFBSceneHosting";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_0();
  int v4 = 754;
  _os_log_fault_impl(&dword_2156DD000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Cannot vend a scene to an extension when the extension point does not require FBScene hosting", (uint8_t *)&v1, 0x1Cu);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  int v6 = (NSXPCListener *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v8 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (self->_hostListener == v6)
  {
    __int16 v9 = [(_EXHostViewControllerSession *)self delegate];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67___EXHostViewControllerSession_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_2642585F0;
    BOOL v15 = &v16;
    id v13 = v9;
    id v14 = v7;
    id v10 = v9;
    dispatch_sync(MEMORY[0x263EF83A0], block);

    BOOL v8 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)clientIsReady
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2156DD000, v0, OS_LOG_TYPE_DEBUG, "UISceneHostingController is ready", v1, 2u);
}

- (APExtensionSubjectMonitorRegistry)subjectMonitorRegistry
{
  return (APExtensionSubjectMonitorRegistry *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSubjectMonitorRegistry:(id)a3
{
}

- (APSubjectMonitorSubscription)subjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubjectMonitorSubscription:(id)a3
{
}

- (_UISceneHostingController)hostingController
{
  return (_UISceneHostingController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHostingController:(id)a3
{
}

- (_EXRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (UIViewController)sceneViewController
{
  return self->_sceneViewController;
}

- (_EXHostViewControllerSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_EXHostViewControllerSessionDelegate *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setError:(id)a3
{
}

- (NSXPCConnection)sceneSessionConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSceneSessionConnection:(id)a3
{
}

- (NSXPCListener)hostListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHostListener:(id)a3
{
}

- (UIView)hostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);

  return (UIView *)WeakRetained;
}

- (void)setHostView:(id)a3
{
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (void)setSignpost:(unint64_t)a3
{
  self->_os_signpost_id_t signpost = a3;
}

- (id)readyBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setReadyBlock:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- ($80EAFF0CD8238926FA3B8E6E6D99B750)activity
{
  objc_copyCppObjectAtomic(retstr, &self->_activity, (void (__cdecl *)(void *, const void *))__copy_constructor_8_8_t0w16_s16);
  return result;
}

- (void)setActivity:(id *)a3
{
}

- (unint64_t)maxState
{
  return self->_maxState;
}

- (void)setMaxState:(unint64_t)a3
{
  self->_maxState = a3;
}

- (_EXHostConfiguration)processConfiguration
{
  return self->_processConfiguration;
}

- (_EXHostViewControllerSessionConfiguration)configuration
{
  return self->_configuration;
}

- (_EXExtensionProcessHandle)extensionProcess
{
  return (_EXExtensionProcessHandle *)objc_getProperty(self, a2, 168, 1);
}

- (void)setExtensionProcess:(id)a3
{
}

- (BOOL)detached
{
  return self->_detached;
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (NSXPCListenerEndpoint)remoteViewControllerEndpoint
{
  return self->_remoteViewControllerEndpoint;
}

- (void)setRemoteViewControllerEndpoint:(id)a3
{
}

- (BOOL)requiresFBSceneHosting
{
  return self->_requiresFBSceneHosting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewControllerEndpoint, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_processConfiguration, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_readyBlock, 0);
  objc_destroyWeak((id *)&self->_hostView);
  objc_storeStrong((id *)&self->_hostListener, 0);
  objc_storeStrong((id *)&self->_sceneSessionConnection, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_subjectMonitorSubscription, 0);

  objc_storeStrong((id *)&self->_subjectMonitorRegistry, 0);
}

- (void)_makeXPCConnectionWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2156DD000, v0, OS_LOG_TYPE_ERROR, "Remote session XPC connection endpoint is nil, the extension probably exited.", v1, 2u);
}

- (void)_makeXPCConnectionWithError:.cold.2()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2156DD000, v0, OS_LOG_TYPE_ERROR, "Remote view controller XPC connection endpoint is nil, the extension probably exited.", v1, 2u);
}

- (void)appProtectionSubjectsChanged:(void *)a1 forSubscription:.cold.1(void *a1)
{
  int v1 = [a1 extensionProcess];
  uint64_t v2 = [v1 extensionIdentity];
  __int16 v3 = [v2 bundleIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_2156DD000, v4, v5, "Extension was locked %@:", v6, v7, v8, v9, v10);
}

- (void)appProtectionSubjectsChanged:(void *)a1 forSubscription:.cold.2(void *a1)
{
  int v1 = [a1 extensionProcess];
  uint64_t v2 = [v1 extensionIdentity];
  __int16 v3 = [v2 bundleIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_2156DD000, v4, v5, "Extension was unlocked %@:", v6, v7, v8, v9, v10);
}

- (void)setState:.cold.1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315906;
  __int16 v3 = "state != _EXHostSessionStatePreparing";
  __int16 v4 = 2080;
  OUTLINED_FUNCTION_0();
  int v5 = 423;
  __int16 v6 = 2114;
  uint64_t v7 = v0;
  _os_log_fault_impl(&dword_2156DD000, v1, OS_LOG_TYPE_FAULT, "%s - %s:%d: Attempt to resume invalidated session %{public}@", (uint8_t *)&v2, 0x26u);
}

- (void)setState:.cold.2()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136316162;
  __int16 v4 = "false";
  __int16 v5 = 2080;
  OUTLINED_FUNCTION_0();
  int v6 = 419;
  __int16 v7 = 2048;
  uint64_t v8 = v0;
  __int16 v9 = 2048;
  uint64_t v10 = v1;
  _os_log_fault_impl(&dword_2156DD000, v2, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unhandled state transition %lu -> %lu", (uint8_t *)&v3, 0x30u);
}

- (void)processDidInvalidate:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 extensionProcess];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_2156DD000, v2, v3, "The extension proceess '%{public}@' providing the UI did invalidate", v4, v5, v6, v7, v8);
}

@end