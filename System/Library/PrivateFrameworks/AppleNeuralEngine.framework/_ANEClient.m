@interface _ANEClient
+ (_ANEClient)new;
+ (id)sharedConnection;
+ (id)sharedPrivateConnection;
+ (void)initialize;
- (BOOL)allowRestrictedAccess;
- (BOOL)beginRealTimeTask;
- (BOOL)compileModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6;
- (BOOL)compiledModelExistsFor:(id)a3;
- (BOOL)compiledModelExistsMatchingHash:(id)a3;
- (BOOL)doBuffersReadyWithModel:(id)a3 inputBuffers:(id)a4 options:(id)a5 qos:(unsigned int)a6 error:(id *)a7;
- (BOOL)doEnqueueSetsWithModel:(id)a3 outputSet:(id)a4 options:(id)a5 qos:(unsigned int)a6 error:(id *)a7;
- (BOOL)doEvaluateDirectWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 error:(id *)a7;
- (BOOL)doLoadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6;
- (BOOL)doLoadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 error:(id *)a7;
- (BOOL)doPrepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 error:(id *)a7;
- (BOOL)doUnloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6;
- (BOOL)echo:(id)a3;
- (BOOL)endRealTimeTask;
- (BOOL)evaluateRealTimeWithModel:(id)a3 options:(id)a4 request:(id)a5 error:(id *)a6;
- (BOOL)isRootDaemon;
- (BOOL)isVirtualClient;
- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6;
- (NSArray)priorityQ;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)connectionsUsedForLoadingModels;
- (_ANEClient)init;
- (_ANEClient)initWithRestrictedAccessAllowed:(BOOL)a3;
- (_ANEDaemonConnection)conn;
- (_ANEDaemonConnection)fastConn;
- (_ANEVirtualClient)virtualClient;
- (id)connectionForLoadingModel:(id)a3 options:(id)a4;
- (id)connectionUsedForLoadingModel:(id)a3;
- (id)fastConnWithoutLock;
- (void)beginRealTimeTask;
- (void)dealloc;
- (void)endRealTimeTask;
- (void)purgeCompiledModel:(id)a3;
- (void)purgeCompiledModelMatchingHash:(id)a3;
- (void)reportEvaluateFailure:(id)a3 failureReason:(unsigned int)a4 qIdx:(unint64_t)a5;
- (void)unmapIOSurfacesWithModel:(id)a3 request:(id)a4;
@end

@implementation _ANEClient

- (BOOL)doLoadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    v15 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doLoadModel:options:qos:error:](v15, a2);
    }
LABEL_6:
    LOBYTE(a6) = 0;
    goto LABEL_19;
  }
  v13 = [(_ANEClient *)self virtualClient];

  if (v13)
  {
    v14 = [(_ANEClient *)self virtualClient];
    LOBYTE(a6) = [v14 loadModel:v11 options:v12 qos:v7 error:a6];

    goto LABEL_19;
  }
  BOOL v16 = +[_ANEDeviceInfo isVirtualMachine];
  v17 = (void *)gLogger_1;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doLoadModel:options:qos:error:](v17, a2);
      if (!a6) {
        goto LABEL_19;
      }
    }
    else if (!a6)
    {
      goto LABEL_19;
    }
    v18 = NSStringFromSelector(a2);
    *a6 = +[_ANEErrors hostTooOld:v18];

    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    -[_ANEClient doLoadModel:options:qos:error:]();
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  id v42 = 0;
  objc_msgSend(v11, "string_id");
  kdebug_trace();
  unint64_t v19 = +[_ANEQoSMapper queueIndexForQoS:v7];
  v20 = [(_ANEClient *)self priorityQ];
  v21 = [v20 objectAtIndexedSubscript:v19];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __44___ANEClient_doLoadModel_options_qos_error___block_invoke;
  v29 = &unk_1E6C1C668;
  id v30 = v12;
  id v22 = v11;
  id v31 = v22;
  v32 = self;
  int v36 = v7;
  v33 = &v37;
  v34 = &v43;
  SEL v35 = a2;
  dispatch_sync(v21, &v26);

  objc_msgSend(v22, "string_id", v26, v27, v28, v29);
  [v22 programHandle];
  kdebug_trace();
  int v23 = *((unsigned __int8 *)v44 + 24);
  if (a6 && !*((unsigned char *)v44 + 24))
  {
    v24 = (void *)v38[5];
    if (v24)
    {
      *a6 = v24;
      int v23 = *((unsigned __int8 *)v44 + 24);
    }
    else
    {
      int v23 = 0;
    }
  }
  LOBYTE(a6) = v23 != 0;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
LABEL_19:

  return (char)a6;
}

- (_ANEVirtualClient)virtualClient
{
  return self->_virtualClient;
}

- (NSArray)priorityQ
{
  return self->_priorityQ;
}

- (id)connectionForLoadingModel:(id)a3 options:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->_isRootDaemon)
  {
    uint64_t v45 = 0;
    char v46 = (id *)&v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__2;
    v49 = __Block_byref_object_dispose__2;
    id v50 = 0;
    v9 = [v7 getUUID];
    os_unfair_lock_lock(&self->_lock);
    v10 = [(_ANEClient *)self connectionsUsedForLoadingModels];
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    v40 = __48___ANEClient_connectionForLoadingModel_options___block_invoke;
    v41 = &unk_1E6C1C4D8;
    id v11 = v9;
    uint64_t v43 = self;
    v44 = &v45;
    id v42 = v11;
    [v10 enumerateKeysAndObjectsUsingBlock:&v38];

    if (!v46[5])
    {
      id v12 = [v8 objectForKeyedSubscript:kANEFModelTypeKey[0]];
      int v13 = [v12 isEqualToString:kANEFModelPreCompiledValue[0]];

      if (v13) {
        [(_ANEClient *)self fastConnWithoutLock];
      }
      else {
      BOOL v16 = [(_ANEClient *)self conn];
      }
      objc_storeStrong(v46 + 5, v16);

      v17 = v46;
      id v18 = v46[5];
      if (v18)
      {
        id v19 = v18;
        id v20 = v17[5];
        v17[5] = v19;
      }
      else
      {
        uint64_t v21 = [(_ANEClient *)self conn];
        id v20 = v46[5];
        v46[5] = (id)v21;
      }

      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v46[5], v38, v39, v40, v41);
      int v23 = [(_ANEClient *)self connections];
      v24 = [v23 objectForKeyedSubscript:v22];
      BOOL v25 = v24 == 0;

      if (v25)
      {
        id v26 = v46[5];
        uint64_t v27 = [(_ANEClient *)self connections];
        [v27 setObject:v26 forKeyedSubscript:v22];
      }
      v28 = [(_ANEClient *)self connectionsUsedForLoadingModels];
      v29 = [v28 objectForKeyedSubscript:v22];

      if (!v29)
      {
        v29 = [MEMORY[0x1E4F1CA80] set];
        id v30 = [(_ANEClient *)self connectionsUsedForLoadingModels];
        [v30 setObject:v29 forKeyedSubscript:v22];
      }
      [v29 addObject:v11];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v31 = v46[5];
    id v32 = [(_ANEClient *)self conn];
    LODWORD(v31) = v31 == v32;

    v33 = (id)gLogger_1;
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
    if (v31)
    {
      if (v34)
      {
        int v36 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v52 = v36;
        __int16 v53 = 2112;
        id v54 = v11;
        _os_log_impl(&dword_1DB8AB000, v33, OS_LOG_TYPE_INFO, "%@: Using default connection for loading modelUUID=%@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      SEL v35 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v52 = v35;
      __int16 v53 = 2112;
      id v54 = v11;
      _os_log_impl(&dword_1DB8AB000, v33, OS_LOG_TYPE_INFO, "%@: Using fast connection for loading modelUUID=%@", buf, 0x16u);
    }
    id v15 = v46[5];

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v14 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
      -[_ANEClient connectionForLoadingModel:options:](v14, a2);
    }
    id v15 = [(_ANEClient *)self conn];
  }

  return v15;
}

- (NSMutableDictionary)connectionsUsedForLoadingModels
{
  return self->_connectionsUsedForLoadingModels;
}

- (id)fastConnWithoutLock
{
  fastConn = self->_fastConn;
  if (!fastConn)
  {
    if ([(_ANEClient *)self allowRestrictedAccess]) {
      +[_ANEDaemonConnection daemonConnectionRestricted];
    }
    else {
    v5 = +[_ANEDaemonConnection daemonConnection];
    }
    v6 = self->_fastConn;
    self->_fastConn = v5;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33___ANEClient_fastConnWithoutLock__block_invoke;
    v11[3] = &__block_descriptor_40_e5_v8__0l;
    v11[4] = a2;
    id v7 = [(_ANEDaemonConnection *)self->_fastConn daemonConnection];
    [v7 setInterruptionHandler:v11];

    v10[2] = __33___ANEClient_fastConnWithoutLock__block_invoke_10;
    v10[3] = &__block_descriptor_40_e5_v8__0l;
    v10[4] = a2;
    id v8 = [(_ANEDaemonConnection *)self->_fastConn daemonConnection];
    [v8 setInvalidationHandler:v10];

    fastConn = self->_fastConn;
  }
  return fastConn;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (_ANEDaemonConnection)conn
{
  return self->_conn;
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedConnection_client;
  return v2;
}

+ (id)sharedPrivateConnection
{
  if (sharedPrivateConnection_onceToken != -1) {
    dispatch_once(&sharedPrivateConnection_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedPrivateConnection_client;
  return v2;
}

+ (void)initialize
{
  uint64_t v2 = +[_ANELog framework];
  v3 = (void *)gLogger_1;
  gLogger_1 = v2;

  v4 = (void *)MEMORY[0x1E0193890]();
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(2);
  [v5 setObject:v6 atIndexedSubscript:0];

  dispatch_semaphore_t v7 = dispatch_semaphore_create(2);
  [v5 setObject:v7 atIndexedSubscript:1];

  dispatch_semaphore_t v8 = dispatch_semaphore_create(2);
  [v5 setObject:v8 atIndexedSubscript:2];

  dispatch_semaphore_t v9 = dispatch_semaphore_create(2);
  [v5 setObject:v9 atIndexedSubscript:3];

  dispatch_semaphore_t v10 = dispatch_semaphore_create(2);
  [v5 setObject:v10 atIndexedSubscript:4];

  dispatch_semaphore_t v11 = dispatch_semaphore_create(2);
  [v5 setObject:v11 atIndexedSubscript:5];

  dispatch_semaphore_t v12 = dispatch_semaphore_create(2);
  [v5 setObject:v12 atIndexedSubscript:6];

  dispatch_semaphore_t v13 = dispatch_semaphore_create(2);
  [v5 setObject:v13 atIndexedSubscript:7];

  uint64_t v14 = [v5 copy];
  id v15 = (void *)gSema;
  gSema = v14;
}

+ (_ANEClient)new
{
  return 0;
}

- (_ANEClient)init
{
  return 0;
}

- (_ANEClient)initWithRestrictedAccessAllowed:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)_ANEClient;
  v5 = [(_ANEClient *)&v23 init];
  dispatch_semaphore_t v6 = v5;
  if (v5)
  {
    v5->_allowRestrictedAccess = a3;
    uint64_t v7 = +[_ANEVirtualClient sharedConnection];
    virtualClient = v6->_virtualClient;
    v6->_virtualClient = (_ANEVirtualClient *)v7;

    if (!v6->_virtualClient)
    {
      dispatch_semaphore_t v9 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
        -[_ANEClient initWithRestrictedAccessAllowed:](v9);
      }
    }
    if (a3) {
      +[_ANEDaemonConnection daemonConnectionRestricted];
    }
    else {
    uint64_t v10 = +[_ANEDaemonConnection daemonConnection];
    }
    conn = v6->_conn;
    v6->_conn = (_ANEDaemonConnection *)v10;

    v6->_isRootDaemon = 1;
    uint64_t v12 = +[_ANEQoSMapper dispatchQueueArrayByMappingPrioritiesWithTag:@"com.apple.anef"];
    priorityQ = v6->_priorityQ;
    v6->_priorityQ = (NSArray *)v12;

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke;
    v22[3] = &__block_descriptor_40_e5_v8__0l;
    v22[4] = a2;
    uint64_t v14 = [(_ANEDaemonConnection *)v6->_conn daemonConnection];
    [v14 setInterruptionHandler:v22];

    v21[2] = __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6;
    v21[3] = &__block_descriptor_40_e5_v8__0l;
    v21[4] = a2;
    id v15 = [(_ANEDaemonConnection *)v6->_conn daemonConnection];
    [v15 setInvalidationHandler:v21];

    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    connectionsUsedForLoadingModels = v6->_connectionsUsedForLoadingModels;
    v6->_connectionsUsedForLoadingModels = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    connections = v6->_connections;
    v6->_connections = (NSMutableDictionary *)v18;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(_ANEClient *)self conn];
  v4 = [v3 daemonConnection];
  [v4 invalidate];

  v5 = [(_ANEClient *)self fastConn];
  dispatch_semaphore_t v6 = [v5 daemonConnection];
  [v6 invalidate];

  v7.receiver = self;
  v7.super_class = (Class)_ANEClient;
  [(_ANEClient *)&v7 dealloc];
}

- (_ANEDaemonConnection)fastConn
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(_ANEClient *)self fastConnWithoutLock];
  os_unfair_lock_unlock(p_lock);
  dispatch_semaphore_t v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = v6;
    dispatch_semaphore_t v8 = NSStringFromSelector(a2);
    int v10 = 138412290;
    dispatch_semaphore_t v11 = v8;
    _os_log_impl(&dword_1DB8AB000, v7, OS_LOG_TYPE_INFO, "%@: Using fast connection", (uint8_t *)&v10, 0xCu);
  }
  return (_ANEDaemonConnection *)v5;
}

- (id)connectionUsedForLoadingModel:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v5 = [v4 getUUID];
  os_unfair_lock_lock(&self->_lock);
  dispatch_semaphore_t v6 = [(_ANEClient *)self connectionsUsedForLoadingModels];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___ANEClient_connectionUsedForLoadingModel___block_invoke;
  v10[3] = &unk_1E6C1C4D8;
  id v7 = v5;
  uint64_t v12 = self;
  dispatch_semaphore_t v13 = &v14;
  id v11 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  os_unfair_lock_unlock(&self->_lock);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)compileModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    id v15 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient compileModel:options:qos:error:](v15, a2);
    }
    goto LABEL_11;
  }
  dispatch_semaphore_t v13 = [(_ANEClient *)self virtualClient];

  if (v13)
  {
    uint64_t v14 = [(_ANEClient *)self virtualClient];
    LOBYTE(a6) = [v14 compileModel:v11 options:v12 qos:v7 error:a6];

    goto LABEL_20;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    uint64_t v16 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient compileModel:options:qos:error:](v16, a2);
    }
    if (a6)
    {
      v17 = NSStringFromSelector(a2);
      *a6 = +[_ANEErrors hostTooOld:v17];

LABEL_11:
      LOBYTE(a6) = 0;
    }
  }
  else
  {
    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    uint64_t v35 = 0;
    int v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__2;
    uint64_t v39 = __Block_byref_object_dispose__2;
    id v40 = 0;
    objc_msgSend(v11, "string_id");
    kdebug_trace();
    uint64_t v18 = [(_ANEClient *)self priorityQ];
    id v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v7));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45___ANEClient_compileModel_options_qos_error___block_invoke;
    block[3] = &unk_1E6C1C528;
    id v20 = v11;
    id v31 = &v35;
    id v28 = v20;
    v29 = self;
    int v34 = v7;
    id v30 = v12;
    id v32 = &v41;
    SEL v33 = a2;
    dispatch_sync(v19, block);

    uint64_t v21 = (id)gLogger_1;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      int v23 = [v20 perfStatsMask];
      *(_DWORD *)buf = 138412546;
      id v46 = v22;
      __int16 v47 = 1024;
      int v48 = v23;
      _os_log_impl(&dword_1DB8AB000, v21, OS_LOG_TYPE_INFO, "%@: Model stats mask: %d", buf, 0x12u);
    }
    objc_msgSend(v20, "string_id");
    [v20 perfStatsMask];
    kdebug_trace();
    int v24 = *((unsigned __int8 *)v42 + 24);
    if (a6 && !*((unsigned char *)v42 + 24))
    {
      BOOL v25 = (void *)v36[5];
      if (v25)
      {
        *a6 = v25;
        int v24 = *((unsigned __int8 *)v42 + 24);
      }
      else
      {
        int v24 = 0;
      }
    }
    LOBYTE(a6) = v24 != 0;

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
  }
LABEL_20:

  return (char)a6;
}

- (BOOL)doUnloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v12 = a4;
  dispatch_semaphore_t v13 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v13;
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v52 = v11;
    _os_log_impl(&dword_1DB8AB000, v14, OS_LOG_TYPE_INFO, "%@: START model[%p]=%@", buf, 0x20u);
  }
  if (!v11)
  {
    uint64_t v18 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doUnloadModel:options:qos:error:](v18, a2);
    }
    goto LABEL_13;
  }
  uint64_t v16 = [(_ANEClient *)self virtualClient];

  if (v16)
  {
    v17 = [(_ANEClient *)self virtualClient];
    LOBYTE(a6) = [v17 unloadModel:v11 options:v12 qos:v7 error:a6];

    goto LABEL_25;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    id v19 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doUnloadModel:options:qos:error:](v19, a2);
    }
    if (a6)
    {
      id v20 = NSStringFromSelector(a2);
      *a6 = +[_ANEErrors hostTooOld:v20];

LABEL_13:
      LOBYTE(a6) = 0;
    }
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__2;
    __int16 v53 = __Block_byref_object_dispose__2;
    id v54 = 0;
    objc_msgSend(v11, "string_id");
    kdebug_trace();
    uint64_t v21 = [(_ANEClient *)self connectionUsedForLoadingModel:v11];
    if (!v21)
    {
      id v22 = (id)gLogger_1;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = NSStringFromSelector(a2);
        -[_ANEClient doUnloadModel:options:qos:error:](v23, (uint64_t)v11, (uint64_t)v50);
      }

      uint64_t v21 = [(_ANEClient *)self conn];
    }
    unint64_t v24 = +[_ANEQoSMapper queueIndexForQoS:v7];
    BOOL v25 = [(_ANEClient *)self priorityQ];
    id v26 = [v25 objectAtIndexedSubscript:v24];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46___ANEClient_doUnloadModel_options_qos_error___block_invoke;
    block[3] = &unk_1E6C1C578;
    id v27 = v21;
    id v33 = v27;
    id v28 = v11;
    int v34 = v28;
    int v39 = v7;
    id v35 = v12;
    int v36 = &v40;
    uint64_t v37 = buf;
    SEL v38 = a2;
    dispatch_sync(v26, block);

    [v28 resetOnUnload];
    objc_msgSend(v28, "string_id");
    kdebug_trace();
    if (a6)
    {
      if (!*((unsigned char *)v41 + 24))
      {
        v29 = *(void **)(*(void *)&buf[8] + 40);
        if (v29) {
          *a6 = v29;
        }
      }
    }
    a6 = (id *)(id)gLogger_1;
    if (os_log_type_enabled((os_log_t)a6, OS_LOG_TYPE_INFO))
    {
      id v30 = NSStringFromSelector(a2);
      *(_DWORD *)char v44 = 138412802;
      uint64_t v45 = v30;
      __int16 v46 = 2048;
      __int16 v47 = v28;
      __int16 v48 = 2112;
      uint64_t v49 = v28;
      _os_log_impl(&dword_1DB8AB000, (os_log_t)a6, OS_LOG_TYPE_INFO, "%@: END model[%p]=%@", v44, 0x20u);
    }
    LOBYTE(a6) = *((unsigned char *)v41 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v40, 8);
  }
LABEL_25:

  return (char)a6;
}

- (BOOL)compiledModelExistsFor:(id)a3
{
  id v5 = a3;
  dispatch_semaphore_t v6 = [(_ANEClient *)self virtualClient];

  if (v6)
  {
    uint64_t v7 = [(_ANEClient *)self virtualClient];
    char v8 = [v7 compiledModelExistsFor:v5];
  }
  else if (+[_ANEDeviceInfo isVirtualMachine])
  {
    dispatch_semaphore_t v9 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient compiledModelExistsFor:](v9, a2);
    }
    char v8 = 0;
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E0193890]();
    id v11 = (void *)gLogger_1;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
        -[_ANEClient compiledModelExistsFor:]();
      }
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__2;
      v26[4] = __Block_byref_object_dispose__2;
      id v27 = 0;
      objc_msgSend(v5, "string_id");
      kdebug_trace();
      id v12 = [(_ANEClient *)self fastConn];
      dispatch_semaphore_t v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [(_ANEClient *)self conn];
      }
      id v15 = v14;

      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __37___ANEClient_compiledModelExistsFor___block_invoke;
      uint64_t v21 = &unk_1E6C1C5A0;
      SEL v25 = a2;
      id v16 = v5;
      id v22 = v16;
      int v23 = &v28;
      unint64_t v24 = v26;
      [v15 compiledModelExistsFor:v16 withReply:&v18];
      objc_msgSend(v16, "string_id", v18, v19, v20, v21);
      kdebug_trace();
      char v8 = *((unsigned char *)v29 + 24) != 0;

      _Block_object_dispose(v26, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
        -[_ANEClient compiledModelExistsFor:](v11, a2);
      }
      char v8 = 0;
    }
  }

  return v8;
}

- (void)purgeCompiledModel:(id)a3
{
  id v5 = a3;
  dispatch_semaphore_t v6 = [(_ANEClient *)self virtualClient];

  if (v6)
  {
    uint64_t v7 = [(_ANEClient *)self virtualClient];
    [v7 purgeCompiledModel:v5];
  }
  else if (+[_ANEDeviceInfo isVirtualMachine])
  {
    char v8 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient purgeCompiledModel:](v8, a2);
    }
  }
  else
  {
    dispatch_semaphore_t v9 = (void *)gLogger_1;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
        -[_ANEClient purgeCompiledModel:]();
      }
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      char v23 = 0;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__2;
      v20[4] = __Block_byref_object_dispose__2;
      id v21 = 0;
      objc_msgSend(v5, "string_id");
      kdebug_trace();
      int v10 = [(_ANEClient *)self conn];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __33___ANEClient_purgeCompiledModel___block_invoke;
      id v15 = &unk_1E6C1C5C8;
      v17 = v22;
      uint64_t v18 = v20;
      SEL v19 = a2;
      id v11 = v5;
      id v16 = v11;
      [v10 purgeCompiledModel:v11 withReply:&v12];

      objc_msgSend(v11, "string_id", v12, v13, v14, v15);
      kdebug_trace();

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(v22, 8);
    }
    else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient purgeCompiledModel:](v9, a2);
    }
  }
}

- (BOOL)compiledModelExistsMatchingHash:(id)a3
{
  id v5 = a3;
  dispatch_semaphore_t v6 = [(_ANEClient *)self virtualClient];

  if (v6)
  {
    uint64_t v7 = [(_ANEClient *)self virtualClient];
    char v8 = [v7 compiledModelExistsMatchingHash:v5];

    goto LABEL_16;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    dispatch_semaphore_t v9 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient compiledModelExistsMatchingHash:](v9, a2);
    }
LABEL_13:
    char v8 = 0;
    goto LABEL_16;
  }
  int v10 = (void *)gLogger_1;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient compiledModelExistsMatchingHash:](v10, a2);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    -[_ANEClient compiledModelExistsMatchingHash:]();
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  id v18 = 0;
  kdebug_trace();
  id v11 = [(_ANEClient *)self fastConn];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(_ANEClient *)self conn];
  }
  id v14 = v13;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46___ANEClient_compiledModelExistsMatchingHash___block_invoke;
  v16[3] = &unk_1E6C1C5F0;
  v16[4] = &v19;
  v16[5] = v17;
  v16[6] = a2;
  [v14 compiledModelExistsMatchingHash:v5 withReply:v16];
  kdebug_trace();
  char v8 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
LABEL_16:

  return v8;
}

- (void)purgeCompiledModelMatchingHash:(id)a3
{
  id v5 = a3;
  dispatch_semaphore_t v6 = [(_ANEClient *)self virtualClient];

  if (v6)
  {
    uint64_t v7 = [(_ANEClient *)self virtualClient];
    [v7 purgeCompiledModelMatchingHash:v5];
  }
  else if (+[_ANEDeviceInfo isVirtualMachine])
  {
    char v8 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient purgeCompiledModelMatchingHash:](v8, a2);
    }
  }
  else
  {
    dispatch_semaphore_t v9 = (void *)gLogger_1;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
        -[_ANEClient purgeCompiledModelMatchingHash:]();
      }
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      char v15 = 0;
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x3032000000;
      v12[3] = __Block_byref_object_copy__2;
      v12[4] = __Block_byref_object_dispose__2;
      id v13 = 0;
      kdebug_trace();
      int v10 = [(_ANEClient *)self conn];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45___ANEClient_purgeCompiledModelMatchingHash___block_invoke;
      v11[3] = &unk_1E6C1C5F0;
      v11[4] = v14;
      void v11[5] = v12;
      v11[6] = a2;
      [v10 purgeCompiledModelMatchingHash:v5 withReply:v11];

      kdebug_trace();
      _Block_object_dispose(v12, 8);

      _Block_object_dispose(v14, 8);
    }
    else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient purgeCompiledModelMatchingHash:](v9, a2);
    }
  }
}

- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(_ANEClient *)self virtualClient];

  if (v12 || +[_ANEDeviceInfo isVirtualMachine])
  {
    char v13 = 1;
    goto LABEL_4;
  }
  if (!v10)
  {
    id v18 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:](v18);
    }
    goto LABEL_17;
  }
  if (!v11)
  {
    uint64_t v19 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:](v19);
    }
LABEL_17:
    char v13 = 0;
    goto LABEL_4;
  }
  char v15 = [v10 mapper];
  id v16 = (void *)gLogger_1;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.5();
    }
    objc_msgSend(v10, "string_id");
    kdebug_trace();
    char v13 = [v15 mapIOSurfacesWithModel:v10 request:v11 cacheInference:v7 error:a6];
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.4(v17);
    }
    objc_msgSend(v10, "string_id");
    kdebug_trace();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:](v16);
    }
    char v13 = 0;
  }

LABEL_4:
  return v13;
}

- (void)unmapIOSurfacesWithModel:(id)a3 request:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_semaphore_t v9 = [(_ANEClient *)self virtualClient];

  if (v9)
  {
    id v10 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
LABEL_3:
    }
      -[_ANEClient unmapIOSurfacesWithModel:request:](v10);
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine])
    {
      id v10 = (void *)gLogger_1;
      if (!os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_3;
    }
    if (v7)
    {
      if (v8)
      {
        id v11 = [v7 mapper];
        uint64_t v12 = (void *)gLogger_1;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
            -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.5();
          }
          objc_msgSend(v7, "string_id");
          kdebug_trace();
          id v20 = 0;
          int v13 = [v11 unmapIOSurfacesWithModel:v7 request:v8 error:&v20];
          id v14 = v20;
          char v15 = (void *)gLogger_1;
          if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
          {
            id v18 = v15;
            uint64_t v19 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            char v22 = v19;
            __int16 v23 = 1024;
            int v24 = v13;
            __int16 v25 = 2112;
            id v26 = v14;
            _os_log_debug_impl(&dword_1DB8AB000, v18, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", buf, 0x1Cu);
          }
          objc_msgSend(v7, "string_id");
          kdebug_trace();
        }
        else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
        {
          -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:](v12);
        }
      }
      else
      {
        v17 = (void *)gLogger_1;
        if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
          -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:](v17);
        }
      }
    }
    else
    {
      id v16 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
        -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:](v16);
      }
    }
  }
LABEL_22:
}

- (BOOL)beginRealTimeTask
{
  id v4 = [(_ANEClient *)self virtualClient];

  if (v4)
  {
    id v5 = [(_ANEClient *)self virtualClient];
    char v6 = [v5 beginRealTimeTask];

    return v6;
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine])
    {
      id v8 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
        [(_ANEClient *)v8 beginRealTimeTask];
      }
      return 0;
    }
    else
    {
      uint64_t v12 = 0;
      int v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      id v10 = [(_ANEClient *)self conn];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __31___ANEClient_beginRealTimeTask__block_invoke;
      v11[3] = &unk_1E6C1C618;
      v11[4] = &v12;
      void v11[5] = a2;
      [v10 beginRealTimeTaskWithReply:v11];

      BOOL v9 = *((unsigned char *)v13 + 24) != 0;
      _Block_object_dispose(&v12, 8);
    }
    return v9;
  }
}

- (BOOL)endRealTimeTask
{
  id v4 = [(_ANEClient *)self virtualClient];

  if (v4)
  {
    id v5 = [(_ANEClient *)self virtualClient];
    char v6 = [v5 endRealTimeTask];

    return v6;
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine])
    {
      id v8 = (void *)gLogger_1;
      if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
        [(_ANEClient *)v8 endRealTimeTask];
      }
      return 0;
    }
    else
    {
      uint64_t v12 = 0;
      int v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      id v10 = [(_ANEClient *)self conn];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __29___ANEClient_endRealTimeTask__block_invoke;
      v11[3] = &unk_1E6C1C618;
      v11[4] = &v12;
      void v11[5] = a2;
      [v10 endRealTimeTaskWithReply:v11];

      BOOL v9 = *((unsigned char *)v13 + 24) != 0;
      _Block_object_dispose(&v12, 8);
    }
    return v9;
  }
}

- (BOOL)doLoadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v13)
  {
    id v18 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doLoadModelNewInstance:options:modelInstParams:qos:error:](v18, a2);
      if (!a7) {
        goto LABEL_22;
      }
    }
    else if (!a7)
    {
      goto LABEL_22;
    }
    uint64_t v19 = NSStringFromSelector(a2);
    id v20 = +[_ANEErrors invalidModelInstanceErrorForMethod:v19];
LABEL_11:
    *a7 = v20;

    LOBYTE(a7) = 0;
    goto LABEL_22;
  }
  id v16 = [(_ANEClient *)self virtualClient];

  if (v16)
  {
    v17 = [(_ANEClient *)self virtualClient];
    LOBYTE(a7) = [v17 loadModelNewInstance:v13 options:v14 modelInstParams:v15 qos:v8 error:a7];

    goto LABEL_22;
  }
  BOOL v21 = +[_ANEDeviceInfo isVirtualMachine];
  char v22 = (void *)gLogger_1;
  if (v21)
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doLoadModelNewInstance:options:modelInstParams:qos:error:](v22, a2);
      if (!a7) {
        goto LABEL_22;
      }
    }
    else if (!a7)
    {
      goto LABEL_22;
    }
    uint64_t v19 = NSStringFromSelector(a2);
    id v20 = +[_ANEErrors hostTooOld:v19];
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    -[_ANEClient doLoadModelNewInstance:options:modelInstParams:qos:error:]();
  }
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v38 = 0;
  int v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__2;
  uint64_t v42 = __Block_byref_object_dispose__2;
  id v43 = 0;
  unint64_t v23 = +[_ANEQoSMapper queueIndexForQoS:v8];
  int v24 = [(_ANEClient *)self priorityQ];
  __int16 v25 = [v24 objectAtIndexedSubscript:v23];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke;
  v29[3] = &unk_1E6C1C690;
  id v30 = v14;
  int v34 = &v38;
  SEL v36 = a2;
  id v31 = v15;
  id v32 = self;
  int v37 = v8;
  id v33 = v13;
  id v35 = &v44;
  dispatch_sync(v25, v29);

  int v26 = *((unsigned __int8 *)v45 + 24);
  if (a7 && !*((unsigned char *)v45 + 24))
  {
    uint64_t v27 = (void *)v39[5];
    if (v27)
    {
      *a7 = v27;
      int v26 = *((unsigned __int8 *)v45 + 24);
    }
    else
    {
      int v26 = 0;
    }
  }
  LOBYTE(a7) = v26 != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
LABEL_22:

  return (char)a7;
}

- (BOOL)doPrepareChainingWithModel:(id)a3 options:(id)a4 chainingReq:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v13)
  {
    id v18 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doPrepareChainingWithModel:options:chainingReq:qos:error:](v18, a2);
    }
    goto LABEL_12;
  }
  id v16 = [(_ANEClient *)self virtualClient];

  if (v16)
  {
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doPrepareChainingWithModel:options:chainingReq:qos:error:].cold.4(v17, a2);
    }
    goto LABEL_12;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    uint64_t v19 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doPrepareChainingWithModel:options:chainingReq:qos:error:](v19, a2);
    }
    if (a7)
    {
      id v20 = NSStringFromSelector(a2);
      *a7 = +[_ANEErrors hostTooOld:v20];

LABEL_12:
      LOBYTE(a7) = 0;
    }
  }
  else
  {
    objc_msgSend(v13, "string_id");
    kdebug_trace();
    uint64_t v46 = 0;
    char v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    char v49 = [v15 validate];
    if (*((unsigned char *)v47 + 24))
    {
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x3032000000;
      id v43 = __Block_byref_object_copy__2;
      uint64_t v44 = __Block_byref_object_dispose__2;
      id v45 = 0;
      char v22 = [(_ANEClient *)self connectionUsedForLoadingModel:v13];
      if (!v22)
      {
        unint64_t v23 = (id)gLogger_1;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v24 = NSStringFromSelector(a2);
          -[_ANEClient doUnloadModel:options:qos:error:](v24, (uint64_t)v13, (uint64_t)v50);
        }

        char v22 = [(_ANEClient *)self conn];
      }
      unint64_t v25 = +[_ANEQoSMapper queueIndexForQoS:v8];
      int v26 = [(_ANEClient *)self priorityQ];
      uint64_t v27 = [v26 objectAtIndexedSubscript:v25];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke;
      block[3] = &unk_1E6C1C6B8;
      id v28 = v22;
      id v32 = v28;
      id v33 = v13;
      id v34 = v14;
      int v39 = v8;
      id v35 = v15;
      SEL v36 = &v46;
      int v37 = &v40;
      SEL v38 = a2;
      dispatch_sync(v27, block);

      kdebug_trace();
      int v29 = *((unsigned __int8 *)v47 + 24);
      if (a7 && !*((unsigned char *)v47 + 24))
      {
        id v30 = (void *)v41[5];
        if (v30)
        {
          *a7 = v30;
          int v29 = *((unsigned __int8 *)v47 + 24);
        }
        else
        {
          int v29 = 0;
        }
      }
      LOBYTE(a7) = v29 != 0;

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      LOBYTE(a7) = 0;
    }
    _Block_object_dispose(&v46, 8);
  }

  return (char)a7;
}

- (BOOL)doEnqueueSetsWithModel:(id)a3 outputSet:(id)a4 options:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [(_ANEClient *)self virtualClient];

  if (v16)
  {
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:](v17);
    }
    goto LABEL_4;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    id v20 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:](v20);
      if (!a7) {
        goto LABEL_4;
      }
    }
    else if (!a7)
    {
LABEL_4:
      LOBYTE(v18) = 0;
      goto LABEL_5;
    }
    BOOL v21 = NSStringFromSelector(a2);
    *a7 = +[_ANEErrors hostTooOld:v21];

    goto LABEL_4;
  }
  objc_msgSend(v13, "string_id");
  kdebug_trace();
  unint64_t v22 = +[_ANEQoSMapper queueIndexForQoS:v8];
  unint64_t v23 = [(id)gSema objectAtIndexedSubscript:v22];
  dispatch_time_t v24 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v23, v24))
  {
    if (a7)
    {
      unint64_t v25 = NSStringFromSelector(a2);
      *a7 = +[_ANEErrors timeoutErrorForMethod:v25];
    }
    objc_msgSend(v13, "string_id");
    kdebug_trace();
    LOBYTE(v18) = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:]();
    }
    int v26 = [v13 program];
    id v28 = 0;
    int v18 = [v26 processOutputSet:v14 model:v13 options:v15 error:&v28];
    id v27 = v28;
    dispatch_semaphore_signal(v23);
    kdebug_trace();
    if (a7 && !v18 && v27) {
      *a7 = v27;
    }
  }
LABEL_5:

  return v18;
}

- (BOOL)doBuffersReadyWithModel:(id)a3 inputBuffers:(id)a4 options:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [(_ANEClient *)self virtualClient];

  if (v16)
  {
    v17 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:](v17);
    }
    goto LABEL_4;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    id v20 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:](v20);
      if (!a7) {
        goto LABEL_4;
      }
    }
    else if (!a7)
    {
LABEL_4:
      LOBYTE(v18) = 0;
      goto LABEL_5;
    }
    BOOL v21 = NSStringFromSelector(a2);
    *a7 = +[_ANEErrors hostTooOld:v21];

    goto LABEL_4;
  }
  objc_msgSend(v13, "string_id");
  kdebug_trace();
  unint64_t v22 = +[_ANEQoSMapper queueIndexForQoS:v8];
  unint64_t v23 = [(id)gSema objectAtIndexedSubscript:v22];
  dispatch_time_t v24 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v23, v24))
  {
    if (a7)
    {
      unint64_t v25 = NSStringFromSelector(a2);
      *a7 = +[_ANEErrors timeoutErrorForMethod:v25];
    }
    objc_msgSend(v13, "string_id");
    kdebug_trace();
    LOBYTE(v18) = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
      -[_ANEClient doBuffersReadyWithModel:inputBuffers:options:qos:error:]();
    }
    int v26 = [v13 program];
    id v28 = 0;
    int v18 = [v26 processInputBuffers:v14 model:v13 options:v15 error:&v28];
    id v27 = v28;
    dispatch_semaphore_signal(v23);
    kdebug_trace();
    if (a7 && !v18 && v27) {
      *a7 = v27;
    }
  }
LABEL_5:

  return v18;
}

- (BOOL)evaluateRealTimeWithModel:(id)a3 options:(id)a4 request:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(a6) = [(_ANEClient *)self doEvaluateDirectWithModel:v12 options:v11 request:v10 qos:+[_ANEQoSMapper aneRealTimeTaskQoS] error:a6];

  return (char)a6;
}

- (void)reportEvaluateFailure:(id)a3 failureReason:(unsigned int)a4 qIdx:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  v27[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [(_ANEClient *)self connectionUsedForLoadingModel:v8];
  if (v9)
  {
    id v10 = [v8 modelURL];
    if (v10) {
      [v8 modelURL];
    }
    else {
    id v11 = [v8 sourceURL];
    }
    unint64_t v25 = &stru_1F35E5710;
    BOOL v12 = +[_ANEStrings trimmedModelPath:v11 trimmedPath:&v25];
    id v13 = v25;

    v27[0] = v13;
    v26[0] = @"modelURL";
    v26[1] = @"privacy_score";
    id v14 = [NSNumber numberWithBool:v12];
    v27[1] = v14;
    v26[2] = @"programHandle";
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "programHandle"));
    v27[2] = v15;
    v26[3] = @"failureReason";
    id v16 = [NSNumber numberWithUnsignedInt:v6];
    v27[3] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

    int v18 = [(_ANEClient *)self priorityQ];
    uint64_t v19 = [v18 objectAtIndexedSubscript:a5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55___ANEClient_reportEvaluateFailure_failureReason_qIdx___block_invoke;
    block[3] = &unk_1E6C1C6E0;
    id v22 = v9;
    unint64_t v23 = @"modelInference";
    id v24 = v17;
    id v20 = v17;
    dispatch_sync(v19, block);
  }
  else if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
  {
    -[_ANEClient reportEvaluateFailure:failureReason:qIdx:]();
  }
}

- (BOOL)doEvaluateDirectWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v13)
  {
    uint64_t v19 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient mapIOSurfacesWithModel:request:cacheInference:error:](v19);
    }
    goto LABEL_6;
  }
  id v16 = [(_ANEClient *)self virtualClient];

  if (v16)
  {
    v17 = [(_ANEClient *)self virtualClient];
    LOBYTE(v18) = [v17 evaluateWithModel:v13 options:v14 request:v15 qos:v8 error:a7];

    goto LABEL_7;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    BOOL v21 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    {
      -[_ANEClient doEnqueueSetsWithModel:outputSet:options:qos:error:](v21);
      if (!a7) {
        goto LABEL_6;
      }
    }
    else if (!a7)
    {
LABEL_6:
      LOBYTE(v18) = 0;
      goto LABEL_7;
    }
    id v22 = NSStringFromSelector(a2);
    *a7 = +[_ANEErrors hostTooOld:v22];

    goto LABEL_6;
  }
  unint64_t v54 = +[_ANEQoSMapper queueIndexForQoS:v8];
  id v23 = v13;
  id v24 = v15;
  if (kdebug_is_enabled())
  {
    v52 = [v24 inputArray];
    uint64_t v46 = v23;
    SEL aSelector = (SEL)[v52 count];
    id v45 = v24;
    if (aSelector)
    {
      unint64_t v25 = [v52 objectAtIndexedSubscript:0];
      IOSurfaceGetID((IOSurfaceRef)[v25 ioSurface]);

      if (aSelector != (SEL)1)
      {
        int v26 = [v52 objectAtIndexedSubscript:1];
        IOSurfaceGetID((IOSurfaceRef)[v26 ioSurface]);

        if ((unint64_t)aSelector >= 3)
        {
          id v27 = [v52 objectAtIndexedSubscript:2];
          IOSurfaceGetID((IOSurfaceRef)[v27 ioSurface]);

          if (aSelector != (SEL)3)
          {
            id v35 = [v52 objectAtIndexedSubscript:3];
            IOSurfaceGetID((IOSurfaceRef)[v35 ioSurface]);
          }
        }
      }
    }
    id v23 = v46;
    objc_msgSend(v46, "string_id");
    kdebug_trace();

    id v24 = v45;
  }
  aSelectora = a2;

  id v28 = v23;
  id v29 = v24;
  if (kdebug_is_enabled())
  {
    id v30 = [v29 outputArray];
    unint64_t v31 = [v30 count];
    id v51 = v29;
    __int16 v53 = v28;
    char v47 = v30;
    if (v31)
    {
      id v32 = [v30 objectAtIndexedSubscript:0];
      IOSurfaceGetID((IOSurfaceRef)[v32 ioSurface]);

      if (v31 != 1)
      {
        id v33 = [v30 objectAtIndexedSubscript:1];
        IOSurfaceGetID((IOSurfaceRef)[v33 ioSurface]);

        if (v31 >= 3)
        {
          id v34 = [v30 objectAtIndexedSubscript:2];
          IOSurfaceGetID((IOSurfaceRef)[v34 ioSurface]);

          if (v31 != 3)
          {
            SEL v36 = [v30 objectAtIndexedSubscript:3];
            IOSurfaceGetID((IOSurfaceRef)[v36 ioSurface]);
          }
        }
      }
    }
    id v28 = v53;
    objc_msgSend(v53, "string_id");
    kdebug_trace();

    id v29 = v51;
  }

  unint64_t v37 = v54;
  [(id)gSema objectAtIndexedSubscript:v54];
  int v39 = v38 = v29;
  dispatch_time_t v40 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v39, v40))
  {
    if (a7)
    {
      uint64_t v41 = NSStringFromSelector(aSelectora);
      unint64_t v37 = v54;
      *a7 = +[_ANEErrors timeoutErrorForMethod:v41];
    }
    [(_ANEClient *)self reportEvaluateFailure:v28 failureReason:15 qIdx:v37];
    id v42 = v28;
    if (kdebug_is_enabled())
    {
      objc_msgSend(v42, "string_id");
      kdebug_trace();
    }

    LOBYTE(v18) = 0;
  }
  else
  {
    [v28 program];
    unsigned int v56 = 0;
    id v55 = 0;
    aSelectorb = (char *)objc_claimAutoreleasedReturnValue();
    int v18 = objc_msgSend(aSelectorb, "processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:", v38, v28, v8, v54, objc_msgSend(v28, "string_id"), v14, &v56, &v55);
    id v43 = v55;
    dispatch_semaphore_signal(v39);
    if (a7 && !v18 && v43)
    {
      *a7 = v43;
      [(_ANEClient *)self reportEvaluateFailure:v28 failureReason:v56 qIdx:v54];
    }
    id v44 = v28;
    if (kdebug_is_enabled())
    {
      objc_msgSend(v44, "string_id");
      kdebug_trace();
    }
  }
LABEL_7:

  return v18;
}

- (BOOL)isVirtualClient
{
  uint64_t v2 = [(_ANEClient *)self virtualClient];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)echo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(_ANEClient *)self virtualClient];

  if (v6)
  {
    id v7 = [(_ANEClient *)self virtualClient];
    char v8 = [v7 echo:v5];
  }
  else if (+[_ANEDeviceInfo isVirtualMachine])
  {
    BOOL v9 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      -[_ANEClient echo:](v9, a2);
    }
    char v8 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v10 = [(_ANEClient *)self conn];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __19___ANEClient_echo___block_invoke;
    v12[3] = &unk_1E6C1C618;
    v12[4] = &v13;
    void v12[5] = a2;
    [v10 echo:v5 withReply:v12];

    char v8 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  return v8;
}

- (BOOL)allowRestrictedAccess
{
  return self->_allowRestrictedAccess;
}

- (BOOL)isRootDaemon
{
  return self->_isRootDaemon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionsUsedForLoadingModels, 0);
  objc_storeStrong((id *)&self->_virtualClient, 0);
  objc_storeStrong((id *)&self->_priorityQ, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_fastConn, 0);
}

- (void)initWithRestrictedAccessAllowed:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = (const char *)OUTLINED_FUNCTION_4_2();
  id v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1DB8AB000, v5, v6, "%@: ANEVirtualClient Not available.", v7, v8, v9, v10, v11);
}

- (void)connectionForLoadingModel:(void *)a1 options:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_1DB8AB000, v3, OS_LOG_TYPE_DEBUG, "%@: Non root daemon, using default connection for loading model", v5, 0xCu);
}

- (void)compileModel:(void *)a1 options:(const char *)a2 qos:error:.cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)compileModel:(void *)a1 options:(const char *)a2 qos:error:.cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)doUnloadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)doUnloadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)doUnloadModel:(uint64_t)a3 options:qos:error:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_8((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_1DB8AB000, v5, OS_LOG_TYPE_ERROR, "%@: model=%@ was not loaded by the client.", v4, 0x16u);
}

- (void)compiledModelExistsFor:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)compiledModelExistsFor:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)compiledModelExistsFor:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  id v2 = v1;
  id v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_9_0(&dword_1DB8AB000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);
}

- (void)purgeCompiledModel:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)purgeCompiledModel:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)purgeCompiledModel:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  id v2 = v1;
  id v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_9_0(&dword_1DB8AB000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);
}

- (void)compiledModelExistsMatchingHash:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)compiledModelExistsMatchingHash:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil modelHash", v7, v8, v9, v10, v11);
}

- (void)compiledModelExistsMatchingHash:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  id v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v2, v4, "%@: modelHash=%@", v5);
}

- (void)purgeCompiledModelMatchingHash:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)purgeCompiledModelMatchingHash:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil modelHash", v7, v8, v9, v10, v11);
}

- (void)purgeCompiledModelMatchingHash:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  id v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v2, v4, "%@: modelHash=%@", v5);
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANERequest", v7, v8, v9, v10, v11);
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.3(void *a1)
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEProgramIOSurfacesMapper", v7, v8, v9, v10, v11);
}

- (void)mapIOSurfacesWithModel:(void *)a1 request:cacheInference:error:.cold.4(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_debug_impl(&dword_1DB8AB000, v1, OS_LOG_TYPE_DEBUG, "%@: success=%d", v6, 0x12u);
}

- (void)mapIOSurfacesWithModel:request:cacheInference:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_17_0(&dword_1DB8AB000, v5, v6, "%@: model[%p]=%@", v7, v8, v9, v10, v11);
}

- (void)unmapIOSurfacesWithModel:(void *)a1 request:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: No support in VM", v7, v8, v9, v10, v11);
}

- (void)beginRealTimeTask
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)endRealTimeTask
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)doLoadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)doLoadModel:(void *)a1 options:(const char *)a2 qos:error:.cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)doLoadModel:options:qos:error:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  id v2 = v1;
  id v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_9_0(&dword_1DB8AB000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);
}

- (void)doLoadModelNewInstance:(void *)a1 options:(const char *)a2 modelInstParams:qos:error:.cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)doLoadModelNewInstance:(void *)a1 options:(const char *)a2 modelInstParams:qos:error:.cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)doLoadModelNewInstance:options:modelInstParams:qos:error:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  id v2 = v1;
  id v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_9_0(&dword_1DB8AB000, v4, v5, "%@: model[%p]=%@", v6, v7, v8, v9, v10);
}

- (void)doPrepareChainingWithModel:(void *)a1 options:(const char *)a2 chainingReq:qos:error:.cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: nil _ANEModel", v7, v8, v9, v10, v11);
}

- (void)doPrepareChainingWithModel:(void *)a1 options:(const char *)a2 chainingReq:qos:error:.cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)doPrepareChainingWithModel:(void *)a1 options:(const char *)a2 chainingReq:qos:error:.cold.4(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: does not support virtual client yet", v7, v8, v9, v10, v11);
}

- (void)doEnqueueSetsWithModel:(void *)a1 outputSet:options:qos:error:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

- (void)doEnqueueSetsWithModel:outputSet:options:qos:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = v2;
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_4_2() program];
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v1, v6, "%@: doEnqueueSetsWithModel for program %@ ", v7);
}

- (void)doEnqueueSetsWithModel:(void *)a1 outputSet:options:qos:error:.cold.3(void *a1)
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: does not support virtual client yet", v7, v8, v9, v10, v11);
}

- (void)doBuffersReadyWithModel:inputBuffers:options:qos:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = v2;
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_4_2() program];
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v1, v6, "%@: doBuffersReadyWithModel for program %@ ", v7);
}

- (void)reportEvaluateFailure:failureReason:qIdx:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_6_1(&dword_1DB8AB000, v5, v6, "%@: model=%@ was not loaded by the client.", v7, v8, v9, v10, 2u);
}

- (void)echo:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, v11);
}

@end