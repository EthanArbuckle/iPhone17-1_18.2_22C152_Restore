@interface BMAccessServiceListener
- (BMAccessServiceListener)initWithDomain:(unint64_t)a3 queue:(id)a4 delegate:(id)a5;
- (BMAccessServiceListener)initWithMachServiceName:(id)a3 domain:(unint64_t)a4 queue:(id)a5 accessServer:(id)a6 fileServer:(id)a7;
- (BMAccessServiceListener)initWithMachServiceName:(id)a3 domain:(unint64_t)a4 queue:(id)a5 accessServer:(id)a6 fileServer:(id)a7 delegate:(id)a8;
- (BOOL)_acceptConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)validateConnection:(id)a3 error:(id *)a4;
- (NSXPCListenerEndpoint)endpoint;
- (id)endpointForCoreDuetUseCases;
- (id)initLegacyWithQueue:(id)a3;
- (id)uniqueEndpointForAppScopedServicesActingOnBehalfOfClientWithAccessControlPolicy:(id)a3;
- (unint64_t)domain;
- (void)activate;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)replyToInvocation:(id)a3 withError:(id)a4;
@end

@implementation BMAccessServiceListener

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v21 = 0;
  BOOL v9 = [(BMAccessServiceListener *)self validateConnection:v7 error:&v21];
  id v10 = v21;
  if (v9)
  {
    [v8 selector];
    if (objc_opt_respondsToSelector())
    {
      fileServer = self->_fileServer;
LABEL_9:
      [v8 invokeWithTarget:fileServer];
      goto LABEL_13;
    }
    [v8 selector];
    if (objc_opt_respondsToSelector())
    {
      fileServer = self->_accessServer;
      goto LABEL_9;
    }
    v13 = __biome_log_for_category(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BMAccessServiceListener connection:handleInvocation:isReply:]((uint64_t)v7, v8, v13);
    }

    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v15 = NSString;
    v16 = NSStringFromSelector((SEL)[v8 selector]);
    v17 = [v15 stringWithFormat:@"Failed to route request -%@", v16];
    v23 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v19 = [v14 errorWithDomain:@"BMAccessErrorDomain" code:6 userInfo:v18];

    [(BMAccessServiceListener *)self replyToInvocation:v8 withError:v19];
    [v7 invalidate];
    id v10 = (id)v19;
  }
  else
  {
    v12 = __biome_log_for_category(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v20 = NSStringFromSelector((SEL)[v8 selector]);
      *(_DWORD *)buf = 138412802;
      v25 = v20;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_fault_impl(&dword_1B30A0000, v12, OS_LOG_TYPE_FAULT, "Request -%@ from %@ failed validation with error %@", buf, 0x20u);
    }
    [(BMAccessServiceListener *)self replyToInvocation:v8 withError:v10];
    [v7 invalidate];
  }
LABEL_13:
}

- (BOOL)validateConnection:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v6 = (BMProcess *)a3;
  id v7 = [(BMProcess *)v6 bm_remoteUseCase];
  if (v7)
  {
    id v8 = -[NSXPCConnection bm_accessControlPolicy](v6);

    if (v8)
    {
      BOOL v9 = -[NSXPCConnection bm_accessControlPolicy](v6);
      id v10 = [v9 useCase];
      char v11 = [v7 isEqual:v10];

      if ((v11 & 1) == 0)
      {
        if (a4)
        {
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = *MEMORY[0x1E4F28568];
          __int16 v28 = @"Use case already set";
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          uint64_t v19 = v23;
          uint64_t v20 = 5;
          goto LABEL_15;
        }
        goto LABEL_17;
      }
      v12 = -[NSXPCConnection bm_accessControlPolicy](v6);
      v13 = [v12 useCase];

      if (!v13)
      {
        if (a4)
        {
          v14 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          __int16 v26 = @"Connection missing use-case";
          v15 = (void *)MEMORY[0x1E4F1C9E8];
          v16 = &v26;
          v17 = &v25;
LABEL_9:
          v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
          uint64_t v19 = v14;
          uint64_t v20 = 1;
LABEL_15:
          *a4 = [v19 errorWithDomain:@"BMAccessErrorDomain" code:v20 userInfo:v18];

          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    else
    {
      if (!+[BMAccessControlPolicy allowsConfiguringConnection:v6 forUseCase:v7 inDomain:self->_domain error:a4])
      {
LABEL_16:
        LOBYTE(a4) = 0;
        goto LABEL_17;
      }
      id v21 = -[NSXPCConnection bm_process](v6);
      uint64_t v22 = +[BMAccessControlPolicy policyForProcess:connectionFlags:useCase:](BMAccessControlPolicy, "policyForProcess:connectionFlags:useCase:", v21, -[NSXPCConnection bm_connectionFlags](v6), v7);

      -[NSXPCConnection setBm_accessControlPolicy:](v6, v22);
    }
    LOBYTE(a4) = 1;
    goto LABEL_17;
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Connection missing use-case";
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = (__CFString **)v30;
    v17 = &v29;
    goto LABEL_9;
  }
LABEL_17:

  return (char)a4;
}

- (BOOL)_acceptConnection:(id)a3
{
  uint64_t v4 = _acceptConnection__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&_acceptConnection__onceToken, &__block_literal_global_1);
  }
  [v5 setDelegate:self];
  [v5 setExportedInterface:_acceptConnection__interface];
  [v5 setExportedObject:self];
  [v5 _setQueue:self->_queue];
  [v5 activate];

  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (BMProcess *)a4;
  id v8 = (void *)MEMORY[0x1B3EB5880]();
  BOOL v9 = +[BMProcess processWithXPCConnection:v7];
  id v10 = __biome_log_for_category(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = [v9 executableName];
    int v22 = 138543618;
    v23 = v11;
    __int16 v24 = 1024;
    int v25 = [v9 pid];
    _os_log_impl(&dword_1B30A0000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", (uint8_t *)&v22, 0x12u);
  }
  if ([v9 processType] != 4 && objc_msgSend(v9, "processType") != 5)
  {
    if (([v6 isEqual:self->_coreDuetListener] & 1) == 0)
    {
      v14 = +[BMAccessControlPolicy policyForProcess:v9 connectionFlags:0 useCase:@"__na__"];
      -[NSXPCConnection setBm_connectionFlags:](v7, 0);
      v13 = 0;
      if ([v14 allowsConnectionToAccessServiceWithDomain:self->_domain])
      {
LABEL_21:
        v12 = __biome_log_for_category(6);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[BMAccessServiceListener listener:shouldAcceptNewConnection:]();
        }
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    v13 = +[BMAccessControlPolicy policyForProcess:v9 connectionFlags:2 useCase:@"__coreduet__"];
    -[NSXPCConnection setBm_accessControlPolicy:](v7, v13);
    -[NSXPCConnection setBm_connectionFlags:](v7, 2);
    char v17 = [v13 allowsConnectionToAccessServiceWithDomain:self->_domain];
    v18 = __biome_log_for_category(6);
    v12 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.5();
      }
      v14 = v13;
      goto LABEL_23;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.6();
    }
LABEL_14:

LABEL_27:
    BOOL v19 = 0;
    goto LABEL_28;
  }
  v12 = [(NSMapTable *)self->_clientSpecificListeners objectForKey:v6];
  v13 = [v12 process];
  if (!+[BMAccessControlPolicy process:v9 canActOnBehalfOfProcess:v13])
  {
    v16 = __biome_log_for_category(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.4(v9, v13, v16);
    }

    goto LABEL_14;
  }
  v14 = +[BMAccessControlPolicy policyForProcess:v9 connectionFlags:1 onBehalfOfProcessWithAccessControlPolicy:v12];
  -[NSXPCConnection setBm_accessControlPolicy:](v7, v14);
  -[NSXPCConnection setBm_connectionFlags:](v7, 1);

  if (([v14 allowsConnectionToAccessServiceWithDomain:self->_domain] & 1) == 0)
  {
LABEL_24:
    uint64_t v20 = __biome_log_for_category(6);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[BMAccessServiceListener listener:shouldAcceptNewConnection:]();
    }

    goto LABEL_27;
  }
  if (!v13) {
    goto LABEL_21;
  }
  v15 = __biome_log_for_category(6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BMAccessServiceListener listener:shouldAcceptNewConnection:](v9, v13);
  }

  v12 = v13;
LABEL_23:

  BOOL v19 = [(BMAccessServiceListener *)self _acceptConnection:v7];
  v13 = v14;
LABEL_28:

  return v19;
}

- (id)uniqueEndpointForAppScopedServicesActingOnBehalfOfClientWithAccessControlPolicy:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 process];
  uint64_t v6 = [v5 processType];

  if (v6)
  {
    id v7 = [v4 process];
    int v22 = [v7 identifier];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = self->_clientSpecificListeners;
    uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v21 = v4;
      id v11 = 0;
      uint64_t v12 = *(void *)v24;
LABEL_4:
      uint64_t v13 = 0;
      v14 = v11;
      while (1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v23 + 1) + 8 * v13);

        v15 = [(NSMapTable *)self->_clientSpecificListeners objectForKey:v11];
        v16 = [v15 process];
        char v17 = [v16 identifier];
        char v18 = [v17 isEqual:v22];

        if (v18) {
          break;
        }
        ++v13;
        v14 = v11;
        if (v10 == v13)
        {
          uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v10) {
            goto LABEL_4;
          }

          id v4 = v21;
          goto LABEL_11;
        }
      }

      id v4 = v21;
      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_11:
    }
    +[BMXPCListener anonymousListenerWithQueue:](BMXPCListener, "anonymousListenerWithQueue:", self->_queue, v21);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v11 setDelegate:self];
    [v11 activate];
LABEL_14:
    -[NSMapTable setObject:forKey:](self->_clientSpecificListeners, "setObject:forKey:", v4, v11, v21);
    BOOL v19 = [v11 endpoint];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (id)initLegacyWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = [[BMAccessServer alloc] initWithListener:self];
  uint64_t v6 = +[BMPaths biomeDirectoryForDomain:0];
  id v7 = [[BMFileServer alloc] initWithDirectory:v6];
  id v8 = [(BMAccessServiceListener *)self initWithMachServiceName:@"com.apple.biome.PublicStreamAccessService" domain:0 queue:v4 accessServer:v5 fileServer:v7 delegate:0];

  return v8;
}

- (BMAccessServiceListener)initWithMachServiceName:(id)a3 domain:(unint64_t)a4 queue:(id)a5 accessServer:(id)a6 fileServer:(id)a7
{
  return [(BMAccessServiceListener *)self initWithMachServiceName:a3 domain:a4 queue:a5 accessServer:a6 fileServer:a7 delegate:0];
}

- (BMAccessServiceListener)initWithDomain:(unint64_t)a3 queue:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [[BMAccessServer alloc] initWithListener:self];
  id v11 = +[BMPaths biomeDirectoryForDomain:a3];
  uint64_t v12 = [[BMFileServer alloc] initWithDirectory:v11];
  if (a3)
  {
    if (a3 != 1)
    {
      v14 = 0;
      goto LABEL_7;
    }
    uint64_t v13 = &BMMachServiceNameSystemAccessService;
  }
  else
  {
    uint64_t v13 = &BMMachServiceNameUserAccessService;
  }
  v14 = *v13;
LABEL_7:
  v15 = [(BMAccessServiceListener *)self initWithMachServiceName:v14 domain:a3 queue:v9 accessServer:v10 fileServer:v12 delegate:v8];

  return v15;
}

- (BMAccessServiceListener)initWithMachServiceName:(id)a3 domain:(unint64_t)a4 queue:(id)a5 accessServer:(id)a6 fileServer:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)BMAccessServiceListener;
  BOOL v19 = [(BMAccessServiceListener *)&v31 init];
  if (v19)
  {
    uint64_t v20 = __biome_log_for_category(6);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_1B30A0000, v20, OS_LOG_TYPE_DEFAULT, "Starting BMAccessServiceListener", v30, 2u);
    }

    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create_with_target_V2("com.apple.biome.AccessService", v21, v15);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v22;

    if (v14)
    {
      long long v24 = [[BMXPCListener alloc] initWithMachServiceName:v14 queue:v15];
    }
    else
    {
      long long v24 = +[BMXPCListener anonymousListenerWithQueue:v15];
    }
    listener = v19->_listener;
    v19->_listener = v24;

    [(BMXPCListener *)v19->_listener setDelegate:v19];
    v19->_domain = a4;
    [v16 setDelegate:v18];
    objc_storeStrong((id *)&v19->_accessServer, a6);
    objc_storeStrong((id *)&v19->_fileServer, a7);
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:4];
    clientSpecificListeners = v19->_clientSpecificListeners;
    v19->_clientSpecificListeners = (NSMapTable *)v26;

    uint64_t v28 = __biome_log_for_category(6);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_1B30A0000, v28, OS_LOG_TYPE_DEFAULT, "Started BMAccessServiceListener", v30, 2u);
    }
  }
  return v19;
}

- (void)activate
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(BMXPCListener *)self->_listener endpoint];
}

- (void)dealloc
{
  v3 = __biome_log_for_category(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B30A0000, v3, OS_LOG_TYPE_DEFAULT, "Stopping BMAccessService", buf, 2u);
  }

  [(BMXPCListener *)self->_listener invalidate];
  v4.receiver = self;
  v4.super_class = (Class)BMAccessServiceListener;
  [(BMAccessServiceListener *)&v4 dealloc];
}

void __45__BMAccessServiceListener__acceptConnection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B4C078];
  v1 = (void *)_acceptConnection__interface;
  _acceptConnection__interface = v0;

  v2 = (void *)_acceptConnection__interface;
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_requestBiomeEndpoint_reply_ argumentIndex:0 ofReply:1];
}

- (void)replyToInvocation:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v20 = v6;
  id v7 = [v5 methodSignature];
  uint64_t v8 = [v7 numberOfArguments] - 1;

  uint64_t v19 = 0;
  [v5 getArgument:&v19 atIndex:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [MEMORY[0x1E4F29268] currentConnection];
    uint64_t v10 = [v9 exportedInterface];
    id v11 = objc_msgSend(v10, "replyBlockSignatureForSelector:", objc_msgSend(v5, "selector"));

    uint64_t v12 = (void *)MEMORY[0x1E4F1CA38];
    id v13 = v11;
    id v14 = objc_msgSend(v12, "signatureWithObjCTypes:", objc_msgSend(v13, "UTF8String"));
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 numberOfArguments] - 1;
      if (objc_msgSend((id)objc_msgSend(v15, "_classForObjectAtArgumentIndex:", v16), "isSubclassOfClass:", objc_opt_class()))
      {
        id v17 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v15];
        [v17 retainArguments];
        [v17 setTarget:v19];
        [v17 setArgument:&v20 atIndex:v16];
        [v17 invoke];
      }
      else
      {
        id v17 = __biome_log_for_category(6);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[BMAccessServiceListener replyToInvocation:withError:](v5);
        }
      }
    }
    else
    {
      id v17 = __biome_log_for_category(6);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[BMAccessServiceListener replyToInvocation:withError:](v5);
      }
    }

    id v6 = v20;
  }
  else
  {
    id v18 = __biome_log_for_category(6);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BMAccessServiceListener replyToInvocation:withError:](v5);
    }
  }
}

- (id)endpointForCoreDuetUseCases
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  coreDuetListener = self->_coreDuetListener;
  if (!coreDuetListener)
  {
    objc_super v4 = +[BMXPCListener anonymousListenerWithQueue:self->_queue];
    id v5 = self->_coreDuetListener;
    self->_coreDuetListener = v4;

    [(BMXPCListener *)self->_coreDuetListener setDelegate:self];
    [(BMXPCListener *)self->_coreDuetListener activate];
    coreDuetListener = self->_coreDuetListener;
  }
  return [(BMXPCListener *)coreDuetListener endpoint];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDuetListener, 0);
  objc_storeStrong((id *)&self->_clientSpecificListeners, 0);
  objc_storeStrong((id *)&self->_fileServer, 0);
  objc_storeStrong((id *)&self->_accessServer, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  [v1 executableName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x12u);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(void *)a2 .cold.2(void *a1, void *a2)
{
  os_log_type_t v4 = [a1 executableName];
  [a1 pid];
  id v5 = [a2 executableName];
  [a2 pid];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(v6, v7, v8, v9, v10, 0x22u);
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  OUTLINED_FUNCTION_5();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [v2 executableName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B30A0000, v0, OS_LOG_TYPE_ERROR, "Refusing connection from %{public}@(%d), process not properly entitled", v3, 0x12u);
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.4(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 executableName];
  [a1 pid];
  os_log_t v7 = [a2 executableName];
  [a2 pid];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_FAULT, "Process %@(%d) not authorized to act on behalf of process %@(%d)", v8, 0x22u);
}

- (void)listener:shouldAcceptNewConnection:.cold.5()
{
  OUTLINED_FUNCTION_5();
  [v1 executableName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x1Cu);
}

- (void)listener:shouldAcceptNewConnection:.cold.6()
{
  OUTLINED_FUNCTION_5();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [v2 executableName];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0();
  os_log_type_t v4 = @"coreduetd";
  _os_log_error_impl(&dword_1B30A0000, v0, OS_LOG_TYPE_ERROR, "Refusing connection from %{public}@(%d) via %{public}@, process not properly entitled", v3, 0x1Cu);
}

- (void)replyToInvocation:(void *)a1 withError:.cold.1(void *a1)
{
  id v1 = NSStringFromSelector((SEL)[a1 selector]);
  OUTLINED_FUNCTION_0_2(&dword_1B30A0000, v2, v3, "Unable to determine reply block signature for -%@", v4, v5, v6, v7, 2u);
}

- (void)replyToInvocation:(void *)a1 withError:.cold.2(void *a1)
{
  id v1 = NSStringFromSelector((SEL)[a1 selector]);
  OUTLINED_FUNCTION_0_2(&dword_1B30A0000, v2, v3, "Unable to locate error parameter for reply block of -%@", v4, v5, v6, v7, 2u);
}

- (void)replyToInvocation:(void *)a1 withError:.cold.3(void *a1)
{
  id v1 = NSStringFromSelector((SEL)[a1 selector]);
  OUTLINED_FUNCTION_0_2(&dword_1B30A0000, v2, v3, "Unable to locate reply block for -%@", v4, v5, v6, v7, 2u);
}

- (void)connection:(uint64_t)a1 handleInvocation:(void *)a2 isReply:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector((SEL)[a2 selector]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_fault_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_FAULT, "Connection %@ failed to route request -%@", (uint8_t *)&v6, 0x16u);
}

@end