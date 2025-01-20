@interface ARRemoteTechnique
- (ARRemoteTechnique)initWithListenerEndpoint:(id)a3;
- (ARRemoteTechnique)initWithServerConnection:(id)a3;
- (ARRemoteTechnique)initWithServiceName:(id)a3;
- (ARServerConnection)serverConnection;
- (BOOL)isActive;
- (double)requiredTimeInterval;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (id)serviceProxy;
- (int64_t)captureBehavior;
- (int64_t)numberOfActiveConnections;
- (unint64_t)requiredSensorDataTypes;
- (void)dealloc;
- (void)prepare:(BOOL)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)serverConnectionInterrupted:(id)a3;
- (void)serverConnectionInvalidated:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)techniqueDidFailWithError:(id)a3;
- (void)techniqueDidOutputResultData:(id)a3 timestamp:(double)a4 context:(id)a5;
@end

@implementation ARRemoteTechnique

- (ARRemoteTechnique)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [[ARServerConnection alloc] initWithListenerEndpoint:v4];

  v6 = [(ARRemoteTechnique *)self initWithServerConnection:v5];
  return v6;
}

- (ARRemoteTechnique)initWithServerConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARRemoteTechnique;
  v6 = [(ARTechnique *)&v14 init];
  v7 = v6;
  if (v6)
  {
    p_serverConnection = (id *)&v6->_serverConnection;
    objc_storeStrong((id *)&v6->_serverConnection, a3);
    [*p_serverConnection setDelegate:v7];
    v9 = ARRemoteTechniqueClientInterfaceWithProtocol((uint64_t)&unk_1F126B5E0);
    [*p_serverConnection setExportedInterface:v9];

    [*p_serverConnection setExportedObject:v7];
    v10 = ARRemoteTechniqueServiceInterfaceWithProtocol((uint64_t)&unk_1F127E590);
    [*p_serverConnection setRemoteObjectInterface:v10];

    uint64_t v11 = objc_opt_new();
    inflightContexts = v7->_inflightContexts;
    v7->_inflightContexts = (NSMutableArray *)v11;

    v7->_inflightContextsLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (ARRemoteTechnique)initWithServiceName:(id)a3
{
  id v4 = a3;
  id v5 = [[ARServerConnection alloc] initWithServiceName:v4];

  v6 = [(ARRemoteTechnique *)self initWithServerConnection:v5];
  return v6;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogTechnique_4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)ARRemoteTechnique;
  [(ARRemoteTechnique *)&v6 dealloc];
}

- (id)serviceProxy
{
  serverConnection = self->_serverConnection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__ARRemoteTechnique_serviceProxy__block_invoke;
  v5[3] = &unk_1E6185C00;
  v5[4] = self;
  v3 = [(ARServerConnection *)serverConnection synchronousRemoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __33__ARRemoteTechnique_serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ARLogTechnique_4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v10, 0x20u);
  }
  v8 = objc_opt_new();
  if (ARInternalOSBuild())
  {
    [v8 setObject:@"Error communicating with XPC proxy. Potential ApprovedListing Issue." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v8 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  __int16 v9 = ARErrorWithCodeAndUserInfo(501, v8);
  [*(id *)(a1 + 32) techniqueDidFailWithError:v9];
}

- (BOOL)isActive
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__ARRemoteTechnique_isActive__block_invoke;
  v4[3] = &unk_1E6186CD8;
  v4[4] = &v5;
  [v2 isActiveWithReply:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __29__ARRemoteTechnique_isActive__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ARRemoteTechnique *)self serviceProxy];
  [v4 setActive:v3];
}

- (int64_t)captureBehavior
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ARRemoteTechnique_captureBehavior__block_invoke;
  v5[3] = &unk_1E6186D00;
  v5[4] = &v6;
  [v2 captureBehaviorWithReply:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ARRemoteTechnique_captureBehavior__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)numberOfActiveConnections
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__ARRemoteTechnique_numberOfActiveConnections__block_invoke;
  v5[3] = &unk_1E6186D00;
  v5[4] = &v6;
  [v2 numberOfActiveConnectionsWithReply:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__ARRemoteTechnique_numberOfActiveConnections__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)prepare:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ARRemoteTechnique *)self serviceProxy];
  [v4 prepare:v3];
}

- (id)processData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  if ([v4 conformsToProtocol:&unk_1F12629E8])
  {
    uint64_t v5 = [(ARRemoteTechnique *)self serviceProxy];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __33__ARRemoteTechnique_processData___block_invoke;
    v15[3] = &unk_1E6186D28;
    v15[4] = &v16;
    [v5 processData:v4 reply:v15];
  }
  else
  {
    uint64_t v6 = _ARLogTechnique_4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v23 = v8;
      __int16 v24 = 2048;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v9;
      id v10 = v9;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Data (%@) is not ARDaemonSecureCodingCompliant!", buf, 0x20u);
    }
    uint64_t v11 = v17;
    id v12 = v4;
    uint64_t v5 = (void *)v11[5];
    v11[5] = (uint64_t)v12;
  }

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __33__ARRemoteTechnique_processData___block_invoke(uint64_t a1, void *a2)
{
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  p_inflightContextsLock = &self->_inflightContextsLock;
  id v7 = a4;
  os_unfair_lock_lock(p_inflightContextsLock);
  [(NSMutableArray *)self->_inflightContexts addObject:v7];
  os_unfair_lock_unlock(p_inflightContextsLock);
  id v8 = [(ARRemoteTechnique *)self serviceProxy];
  [v8 requestResultDataAtTimestamp:v7 context:a3];
}

- (unint64_t)requiredSensorDataTypes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ARRemoteTechnique_requiredSensorDataTypes__block_invoke;
  v5[3] = &unk_1E6186D50;
  v5[4] = &v6;
  [v2 requiredSensorDataTypesWithReply:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__ARRemoteTechnique_requiredSensorDataTypes__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (double)requiredTimeInterval
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ARRemoteTechnique_requiredTimeInterval__block_invoke;
  v5[3] = &unk_1E6186D78;
  v5[4] = &v6;
  [v2 requiredTimeIntervalWithReply:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__ARRemoteTechnique_requiredTimeInterval__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)resultDataClasses
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__ARRemoteTechnique_resultDataClasses__block_invoke;
  v5[3] = &unk_1E6186DC0;
  v5[4] = &v6;
  [v2 resultDataClassesWithReply:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__ARRemoteTechnique_resultDataClasses__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "ar_map:", &__block_literal_global_145);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

Class __38__ARRemoteTechnique_resultDataClasses__block_invoke_2(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (void)techniqueDidFailWithError:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(ARTechnique *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(ARTechnique *)self delegate];
    [v6 technique:self didFailWithError:v7];
  }
}

- (void)techniqueDidOutputResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v8 = a5;
  p_inflightContextsLock = &self->_inflightContextsLock;
  os_unfair_lock_lock(&self->_inflightContextsLock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = self->_inflightContexts;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "imageData", p_inflightContextsLock);
        [v15 timestamp];
        double v17 = v16;
        uint64_t v18 = [v8 imageData];
        [v18 timestamp];
        double v20 = v19;

        if (v17 == v20)
        {
          id v22 = v14;

          if (v22)
          {
            [(NSMutableArray *)self->_inflightContexts removeObject:v22];
            int v21 = 1;
          }
          else
          {
            int v21 = 0;
          }
          goto LABEL_13;
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  int v21 = 0;
  id v22 = 0;
LABEL_13:
  os_unfair_lock_unlock(p_inflightContextsLock);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v21 && (isKindOfClass & 1) != 0) {
    [v8 mergeResultsOfContext:v22 resultFilterBlock:&__block_literal_global_151];
  }
  __int16 v24 = [(ARTechnique *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    __int16 v26 = [(ARTechnique *)self delegate];
    [v26 technique:self didOutputResultData:v28 timestamp:v8 context:a4];
  }
}

uint64_t __68__ARRemoteTechnique_techniqueDidOutputResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F12629E8] ^ 1;
}

- (void)serverConnectionInterrupted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _ARLogTechnique_4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    __int16 v14 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Server connection interrupted", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock(&self->_inflightContextsLock);
  [(NSMutableArray *)self->_inflightContexts removeAllObjects];
  os_unfair_lock_unlock(&self->_inflightContextsLock);
  id v7 = objc_opt_new();
  if (ARInternalOSBuild()) {
    [v7 setObject:@"Server Connection Interrupted" forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  id v8 = ARKitCoreBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Restart the session." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F285A0]];

  uint64_t v10 = ARErrorWithCodeAndUserInfo(501, v7);
  [(ARRemoteTechnique *)self techniqueDidFailWithError:v10];
}

- (void)serverConnectionInvalidated:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _ARLogTechnique_4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    int v7 = 138543618;
    id v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Server connection invalidated", (uint8_t *)&v7, 0x16u);
  }
  os_unfair_lock_lock(&self->_inflightContextsLock);
  [(NSMutableArray *)self->_inflightContexts removeAllObjects];
  os_unfair_lock_unlock(&self->_inflightContextsLock);
}

- (ARServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_inflightContexts, 0);
}

@end