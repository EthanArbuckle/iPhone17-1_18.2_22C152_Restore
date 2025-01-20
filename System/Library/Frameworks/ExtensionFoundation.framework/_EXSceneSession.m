@interface _EXSceneSession
- (BOOL)hasSwiftUIContent;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSString)role;
- (NSUUID)identifier;
- (NSXPCConnection)sceneXPCConnection;
- (NSXPCConnection)sessionXPCConnection;
- (NSXPCListener)sceneConnectionListener;
- (NSXPCListenerEndpoint)hostEndpoint;
- (_EXExtension)extension;
- (_EXScene)scene;
- (_EXSceneConfiguration)configuration;
- (_EXSceneSession)initWithExtension:(id)a3;
- (id)makeConfigurationWithParameters:(id)a3;
- (id)makeConnectionResponse;
- (id)makeSceneWithError:(id *)a3;
- (id)makeXPCConnectionWithError:(id *)a3;
- (unint64_t)signpost;
- (void)connectSceneSessionWithRequest:(id)a3 reply:(id)a4;
- (void)connectToScene:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneConnectionListener:(id)a3;
- (void)setSceneXPCConnection:(id)a3;
- (void)setSessionXPCConnection:(id)a3;
@end

@implementation _EXSceneSession

- (_EXSceneSession)initWithExtension:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXSceneSession;
  v5 = [(_EXSceneSession *)&v10 init];
  if (v5)
  {
    v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_EXSceneSession initWithExtension:]();
    }

    objc_storeWeak((id *)&v5->_extension, v4);
    uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
    sceneConnectionListener = v5->_sceneConnectionListener;
    v5->_sceneConnectionListener = (NSXPCListener *)v7;

    [(NSXPCListener *)v5->_sceneConnectionListener setDelegate:v5];
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_191F29000, v1, OS_LOG_TYPE_DEBUG, "%@ deallocated with identifier: '%{public}@'", v2, 0x16u);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (NSXPCListener *)a3;
  v8 = _EXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_EXSceneSession listener:shouldAcceptNewConnection:](v6, v8);
  }

  sceneConnectionListener = self->_sceneConnectionListener;
  if (sceneConnectionListener == v7
    && ([(_EXSceneSession *)self setSceneXPCConnection:v6],
        (objc_opt_respondsToSelector() & 1) != 0)
    && [(_EXScene *)self->_scene shouldAcceptConnection:v6])
  {
    objc_super v10 = _EXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_EXSceneSession listener:shouldAcceptNewConnection:]();
    }

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionXPCConnection);

  if (!WeakRetained)
  {
    id v6 = _EXSignpostLog();
    uint64_t v7 = +[_EXRunningExtension sharedInstance];
    if ([v7 signpost])
    {
      BOOL v8 = os_signpost_enabled(v6);

      if (!v8)
      {
LABEL_8:

        [v4 setExportedObject:self];
        BOOL v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2E5618];
        [v4 setExportedInterface:v11];

        v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2EF9D0];
        [v4 setRemoteObjectInterface:v12];

        [v4 _setQueue:MEMORY[0x1E4F14428]];
        objc_initWeak(buf, self);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __45___EXSceneSession_shouldAcceptXPCConnection___block_invoke;
        v14[3] = &unk_1E573D058;
        objc_copyWeak(&v15, buf);
        [v4 setInvalidationHandler:v14];
        [(_EXSceneSession *)self setSessionXPCConnection:v4];
        [v4 activate];
        objc_destroyWeak(&v15);
        objc_destroyWeak(buf);
        goto LABEL_9;
      }
      uint64_t v7 = v6;
      v9 = +[_EXRunningExtension sharedInstance];
      os_signpost_id_t v10 = [v9 signpost];

      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_191F29000, v7, OS_SIGNPOST_EVENT, v10, "extensionkit-lifecycle", "-[EXSceneSession shouldAcceptXPCConnection:]", (uint8_t *)buf, 2u);
      }
    }

    goto LABEL_8;
  }
LABEL_9:

  return WeakRetained == 0;
}

- (id)makeConfigurationWithParameters:(id)a3
{
  id v3 = a3;
  id v4 = [[_EXSceneConfiguration alloc] initWithParameters:v3];

  return v4;
}

- (id)makeSceneWithError:(id *)a3
{
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_EXSceneSession makeSceneWithError:]0();
  }

  uint64_t v5 = [(_EXSceneSession *)self configuration];
  id v6 = [(_EXSceneSession *)self extension];
  [v6 prepareForSceneConnectionWithConfiguration:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXSceneSession makeSceneWithError:].cold.9((uint64_t)v5, v9);
    }
    goto LABEL_33;
  }
  BOOL v7 = class_conformsToProtocol((Class)[v5 sceneClass], (Protocol *)&unk_1EE2E8270);
  BOOL v8 = _EXDefaultLog();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[_EXSceneSession makeSceneWithError:].cold.8(v5);
    }
    goto LABEL_33;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_EXSceneSession makeSceneWithError:].cold.7(v5);
  }

  id v10 = objc_alloc_init((Class)[v5 sceneClass]);
  BOOL v11 = _EXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_EXSceneSession makeSceneWithError:].cold.6();
  }

  if (!v10)
  {
    v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXSceneSession makeSceneWithError:](v5);
    }
    goto LABEL_33;
  }
  if (([v10 conformsToProtocol:&unk_1EE2E8270] & 1) == 0)
  {
    uint64_t v5 = _EXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_EXSceneSession makeSceneWithError:].cold.5();
    }

    __break(1u);
LABEL_31:
    v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXSceneSession makeSceneWithError:](v5);
    }
LABEL_33:

    __break(1u);
    return result;
  }
  if ([v5 sceneDelegateClass] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_EXSceneSession makeSceneWithError:].cold.4(v5);
    }

    id v13 = objc_alloc_init((Class)[v5 sceneDelegateClass]);
    v14 = _EXDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[_EXSceneSession makeSceneWithError:]();
    }

    if (v13)
    {
      [v10 setDelegate:v13];

      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_19:

  return v10;
}

- (void)connectToScene:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [(_EXSceneSession *)self scene];
    char v6 = objc_opt_respondsToSelector();

    id v4 = v8;
    if (v6)
    {
      BOOL v7 = [(_EXSceneSession *)self scene];
      [v7 connectToSession:self];

      id v4 = v8;
    }
  }
}

- (id)makeConnectionResponse
{
  id v3 = objc_alloc_init(_EXSceneSessionConnectionResponse);
  id v4 = [(_EXSceneSession *)self sceneConnectionListener];
  uint64_t v5 = [v4 endpoint];
  [(_EXSceneSessionConnectionResponse *)v3 setSceneEndpoint:v5];

  return v3;
}

- (void)connectSceneSessionWithRequest:(id)a3 reply:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [v6 identifier];
  identifier = self->_identifier;
  self->_identifier = v8;

  id v10 = _EXSignpostLog();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self->_identifier);
  if (v11)
  {
    v12 = v10;
    id v13 = v12;
    if (v11 != -1 && os_signpost_enabled(v12))
    {
      v14 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v58 = v14;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "extensionkit-lifecycle", "ID: %@", buf, 0xCu);
    }
  }
  self->_signpost = v11;
  id v15 = _EXSignpostLog();
  v16 = +[_EXRunningExtension sharedInstance];
  if (![v16 signpost]) {
    goto LABEL_11;
  }
  BOOL v17 = os_signpost_enabled(v15);

  if (v17)
  {
    v16 = v15;
    v18 = +[_EXRunningExtension sharedInstance];
    os_signpost_id_t v19 = [v18 signpost];

    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v20 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v58 = v20;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v16, OS_SIGNPOST_EVENT, v19, "extensionkit-lifecycle", "Begin session: %@", buf, 0xCu);
    }
LABEL_11:
  }
  v21 = _EXSignpostLog();
  if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v21))
  {
    v22 = v21;
    os_signpost_id_t v23 = [(_EXSceneSession *)self signpost];
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v22, OS_SIGNPOST_EVENT, v23, "extensionkit-lifecycle", "-[EXSceneSession shouldAcceptXPCConnection:]", buf, 2u);
    }
  }
  v24 = [v6 parameters];
  v25 = [(_EXSceneSession *)self makeConfigurationWithParameters:v24];
  configuration = self->_configuration;
  self->_configuration = v25;

  v27 = [v6 hostEndpoint];
  hostEndpoint = self->_hostEndpoint;
  self->_hostEndpoint = v27;

  v29 = [(_EXSceneSession *)self extension];
  [v29 prepareForSceneConnectionWithConfiguration:self->_configuration];

  v30 = +[_EXSceneSessionManager sharedInstance];
  [v30 addSession:self];

  v31 = _EXSignpostLog();
  if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v31))
  {
    v32 = v31;
    os_signpost_id_t v33 = [(_EXSceneSession *)self signpost];
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v32, OS_SIGNPOST_EVENT, v33, "extensionkit-lifecycle", "PRE: -[EXSceneSession makeSceneWithError:]", buf, 2u);
    }
  }
  id v56 = 0;
  v34 = [(_EXSceneSession *)self makeSceneWithError:&v56];
  id v35 = v56;
  v36 = _EXSignpostLog();
  if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v36))
  {
    v37 = v36;
    os_signpost_id_t v38 = [(_EXSceneSession *)self signpost];
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v37, OS_SIGNPOST_EVENT, v38, "extensionkit-lifecycle", "POST: -[EXSceneSession makeSceneWithError:]", buf, 2u);
    }
  }
  if (v34)
  {
    [(_EXSceneSession *)self setScene:v34];
    v39 = _EXSignpostLog();
    if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v39))
    {
      v40 = v39;
      os_signpost_id_t v41 = [(_EXSceneSession *)self signpost];
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191F29000, v40, OS_SIGNPOST_EVENT, v41, "extensionkit-lifecycle", "PRE: -[EXSceneSession connectToScene:]", buf, 2u);
      }
    }
    [(_EXSceneSession *)self connectToScene:v34];
    v42 = _EXSignpostLog();
    if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v42))
    {
      v43 = v42;
      os_signpost_id_t v44 = [(_EXSceneSession *)self signpost];
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191F29000, v43, OS_SIGNPOST_EVENT, v44, "extensionkit-lifecycle", "POST: -[EXSceneSession connectToScene:]", buf, 2u);
      }
    }
    [(NSXPCListener *)self->_sceneConnectionListener resume];
    v45 = [(_EXSceneSession *)self makeConnectionResponse];
    v46 = _EXSignpostLog();
    if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v46))
    {
      v47 = v46;
      os_signpost_id_t v48 = [(_EXSceneSession *)self signpost];
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191F29000, v47, OS_SIGNPOST_EVENT, v48, "extensionkit-lifecycle", "Initialized", buf, 2u);
      }
    }
    v7[2](v7, v45, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v7)[2](v7, 0, v35);
    v49 = _EXSignpostLog();
    if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v49))
    {
      v50 = v49;
      os_signpost_id_t v51 = [(_EXSceneSession *)self signpost];
      if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191F29000, v50, OS_SIGNPOST_EVENT, v51, "extensionkit-lifecycle", "Failure", buf, 2u);
      }
    }
    p_sessionXPCConnection = &self->_sessionXPCConnection;
    objc_copyWeak((id *)buf, (id *)p_sessionXPCConnection);
    id WeakRetained = objc_loadWeakRetained((id *)p_sessionXPCConnection);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __56___EXSceneSession_connectSceneSessionWithRequest_reply___block_invoke;
    v54[3] = &unk_1E573D058;
    objc_copyWeak(&v55, (id *)buf);
    [WeakRetained addBarrierBlock:v54];

    objc_destroyWeak(&v55);
    objc_destroyWeak((id *)buf);
  }
}

- (NSString)role
{
  return [(_EXSceneConfiguration *)self->_configuration role];
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  id v3 = [(_EXSceneSession *)self hostEndpoint];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)invalidate
{
  id v3 = _EXSignpostLog();
  if ([(_EXSceneSession *)self signpost] && os_signpost_enabled(v3))
  {
    id v4 = v3;
    unint64_t v5 = [(_EXSceneSession *)self signpost];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)id v8 = 0;
        _os_signpost_emit_with_name_impl(&dword_191F29000, v4, OS_SIGNPOST_EVENT, v6, "extensionkit-lifecycle", "invalidate", v8, 2u);
      }
    }
  }
  [(NSXPCListener *)self->_sceneConnectionListener invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionXPCConnection);
  [WeakRetained invalidate];
}

- (_EXSceneConfiguration)configuration
{
  return (_EXSceneConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (_EXScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (NSXPCListener)sceneConnectionListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSceneConnectionListener:(id)a3
{
}

- (NSXPCConnection)sessionXPCConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionXPCConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setSessionXPCConnection:(id)a3
{
}

- (NSXPCConnection)sceneXPCConnection
{
  return self->_sceneXPCConnection;
}

- (void)setSceneXPCConnection:(id)a3
{
}

- (_EXExtension)extension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extension);

  return (_EXExtension *)WeakRetained;
}

- (NSXPCListenerEndpoint)hostEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)hasSwiftUIContent
{
  return self->_hasSwiftUIContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostEndpoint, 0);
  objc_destroyWeak((id *)&self->_extension);
  objc_storeStrong((id *)&self->_sceneXPCConnection, 0);
  objc_destroyWeak((id *)&self->_sessionXPCConnection);
  objc_storeStrong((id *)&self->_sceneConnectionListener, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithExtension:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "%{public}@ allocated", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "XPC interface successfully configured for session %{public}@, accepting connection.", v2, v3, v4, v5, v6);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_debug_impl(&dword_191F29000, a2, OS_LOG_TYPE_DEBUG, "Session connection request from '%d': Received ", (uint8_t *)v3, 8u);
}

- (void)makeSceneWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = NSStringFromClass((Class)[a1 sceneClass]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_1(&dword_191F29000, v2, v3, "%s - %s:%d: Failed to create scene of class '%{public}@'", v4, v5, v6, v7, 2u);
}

- (void)makeSceneWithError:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = NSStringFromClass((Class)[a1 sceneDelegateClass]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_1(&dword_191F29000, v2, v3, "%s - %s:%d: Failed to create UI scene delegate of class '%{public}@'", v4, v5, v6, v7, 2u);
}

- (void)makeSceneWithError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "UI scene delegate is: %{public}@", v2, v3, v4, v5, v6);
}

- (void)makeSceneWithError:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = NSStringFromClass((Class)[a1 sceneDelegateClass]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_191F29000, v2, v3, "Making UI scene delegate of class '%{public}@'", v4, v5, v6, v7, v8);
}

- (void)makeSceneWithError:.cold.5()
{
  uint64_t v0 = NSStringFromProtocol((Protocol *)&unk_1EE2E8270);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
}

- (void)makeSceneWithError:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Scene is: %{public}@", v2, v3, v4, v5, v6);
}

- (void)makeSceneWithError:(void *)a1 .cold.7(void *a1)
{
  uint64_t v1 = NSStringFromClass((Class)[a1 sceneClass]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_191F29000, v2, v3, "Making scene of class '%{public}@'", v4, v5, v6, v7, v8);
}

- (void)makeSceneWithError:(void *)a1 .cold.8(void *a1)
{
  [a1 sceneClass];
  uint64_t v1 = NSStringFromProtocol((Protocol *)&unk_1EE2E8270);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
}

- (void)makeSceneWithError:(uint64_t)a1 .cold.9(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v8[0] = 136316162;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  v8[6] = 125;
  __int16 v9 = 2114;
  id v10 = v4;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  _os_log_fault_impl(&dword_191F29000, a2, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unexpected configuration class '%{public}@' expected '%{public}@'", (uint8_t *)v8, 0x30u);
}

- (void)makeSceneWithError:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Preparing for connection scene session extension: %{public}@", v2, v3, v4, v5, v6);
}

@end