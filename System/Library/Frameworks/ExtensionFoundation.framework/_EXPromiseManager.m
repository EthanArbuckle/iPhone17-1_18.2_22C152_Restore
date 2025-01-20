@interface _EXPromiseManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)promises;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (_EXPromiseManager)init;
- (id)resolveObjectOfClasses:(id)a3 forIdentifier:(id)a4 endpoint:(id)a5 error:(id *)a6;
- (void)registerPromise:(id)a3;
- (void)resolveObjectOfClasses:(id)a3 forIdentifier:(id)a4 endpoint:(id)a5 completion:(id)a6;
- (void)resolvePromiseWithIdentifier:(id)a3 reply:(id)a4;
- (void)setListener:(id)a3;
- (void)unregisterPromise:(id)a3;
@end

@implementation _EXPromiseManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

- (_EXPromiseManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_EXPromiseManager;
  v2 = [(_EXPromiseManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    promises = v2->_promises;
    v2->_promises = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (id)resolveObjectOfClasses:(id)a3 forIdentifier:(id)a4 endpoint:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  if (!v11)
  {
    v22 = _EXDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:error:]();
    }
    goto LABEL_19;
  }
  if (!v10)
  {
    v22 = _EXDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:error:]();
    }
    goto LABEL_19;
  }
  v12 = v11;
  if ([v9 containsObject:objc_opt_class()])
  {
    v22 = _EXDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:error:]();
    }
LABEL_19:

    __break(1u);
    return result;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v12];
  v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2E5CD0];
  [v14 setClasses:v9 forSelector:sel_resolvePromiseWithIdentifier_reply_ argumentIndex:0 ofReply:1];
  [v13 setRemoteObjectInterface:v14];
  [v13 resume];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_error___block_invoke;
  v24[3] = &unk_1E573D578;
  v24[4] = &v31;
  v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_error___block_invoke_2;
  v23[3] = &unk_1E573D5A0;
  v23[4] = &v25;
  [v15 resolvePromiseWithIdentifier:v10 reply:v23];
  v16 = v32;
  if (!v26[5] && !v32[5])
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:9 userInfo:MEMORY[0x1E4F1CC08]];
    v18 = (void *)v32[5];
    v32[5] = v17;

    v16 = v32;
  }
  if (a6)
  {
    v19 = (void *)v16[5];
    if (v19) {
      *a6 = v19;
    }
  }
  id v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

- (void)resolveObjectOfClasses:(id)a3 forIdentifier:(id)a4 endpoint:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    if (v10)
    {
      v13 = v12;
      if ([v9 containsObject:objc_opt_class()])
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v11];
        v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2E5CD0];
        [v15 setClasses:v9 forSelector:sel_resolvePromiseWithIdentifier_reply_ argumentIndex:0 ofReply:1];
        [v14 setRemoteObjectInterface:v15];
        [v14 resume];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __78___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_completion___block_invoke;
        v22[3] = &unk_1E573CE00;
        id v16 = v13;
        id v23 = v16;
        uint64_t v17 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v22];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __78___EXPromiseManager_resolveObjectOfClasses_forIdentifier_endpoint_completion___block_invoke_2;
        v20[3] = &unk_1E573D5C8;
        id v21 = v16;
        id v18 = v16;
        [v17 resolvePromiseWithIdentifier:v10 reply:v20];

        return;
      }
      v19 = _EXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:completion:]();
      }
    }
    else
    {
      v19 = _EXDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:completion:]();
      }
    }
  }
  else
  {
    v19 = _EXDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[_EXPromiseManager resolveObjectOfClasses:forIdentifier:endpoint:completion:]();
    }
  }

  __break(1u);
}

- (void)registerPromise:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  v6 = _EXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_EXPromiseManager registerPromise:]();
  }

  v7 = [v4 promiseBlock];
  objc_super v8 = (void *)[v7 copy];

  if (v5)
  {
    if (v8)
    {
      [(NSMapTable *)self->_promises setObject:v4 forKey:v5];

      return;
    }
    id v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXPromiseManager registerPromise:]();
    }
  }
  else
  {
    id v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXPromiseManager registerPromise:]();
    }
  }

  __break(1u);
}

- (void)unregisterPromise:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _EXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_EXPromiseManager unregisterPromise:](v4, v5);
  }

  uint64_t v6 = [v4 identifier];
  if (v6)
  {
    v7 = (void *)v6;
    [(NSMapTable *)self->_promises removeObjectForKey:v6];
  }
  else
  {
    objc_super v8 = _EXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[_EXPromiseManager unregisterPromise:]();
    }

    __break(1u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  v7 = [v5 interfaceWithProtocol:&unk_1EE2E5CD0];
  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)resolvePromiseWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  promises = self->_promises;
  objc_super v8 = (void (**)(id, void *))a4;
  id v9 = [(NSMapTable *)promises objectForKey:v6];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CAD0] set];
    id v14 = 0;
    id v11 = [v9 resolveObjectOfClasses:v10 error:&v14];
    id v12 = v14;

    if (!v11)
    {
      v13 = _EXDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_EXPromiseManager resolvePromiseWithIdentifier:reply:]();
      }
    }
  }
  else
  {
    id v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_EXPromiseManager resolvePromiseWithIdentifier:reply:]();
    }
    id v11 = 0;
  }

  v8[2](v8, v11);
}

- (NSMapTable)promises
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_promises, 0);
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: endpoint is nil", v2, v3, v4, v5, v6);
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: endpoint is nil", v2, v3, v4, v5, v6);
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
}

- (void)resolveObjectOfClasses:forIdentifier:endpoint:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)registerPromise:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
}

- (void)registerPromise:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: promiseBlock is nil", v2, v3, v4, v5, v6);
}

- (void)registerPromise:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
}

- (void)unregisterPromise:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: identifier is nil", v2, v3, v4, v5, v6);
}

- (void)unregisterPromise:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_3();
}

- (void)resolvePromiseWithIdentifier:reply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Failed to resolve, no promise with identifier %{public}@", v2, v3, v4, v5, v6);
}

- (void)resolvePromiseWithIdentifier:reply:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Failed to resolve promise: %{public}@", v2, v3, v4, v5, v6);
}

@end