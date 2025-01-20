@interface MXMetricManager
+ (BOOL)extendLaunchMeasurementForTaskID:(MXLaunchTaskID)taskID error:(NSError *)error;
+ (BOOL)finishExtendedLaunchMeasurementForTaskID:(MXLaunchTaskID)taskID error:(NSError *)error;
+ (MXMetricManager)sharedManager;
+ (os_log_t)makeLogHandleWithCategory:(NSString *)category;
- (BOOL)_cachedPayloadAvailable;
- (BOOL)checkedDiagnostics;
- (BOOL)checkedMetrics;
- (MXMetricManager)init;
- (NSArray)pastDiagnosticPayloads;
- (NSArray)pastPayloads;
- (NSHashTable)subscribers;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)iVarQueue;
- (OS_os_log)managerLogHandle;
- (id)_createXPCConnection;
- (id)mergeDiagnosticsAtLocation:(id)a3;
- (int)metricToken;
- (void)_checkAndDeliverDiagnosticReports;
- (void)_checkAndDeliverMetricReports;
- (void)addSubscriber:(id)subscriber;
- (void)dealloc;
- (void)deliverDiagnosticPayload:(id)a3;
- (void)deliverMetricPayload:(id)a3;
- (void)removeSubscriber:(id)subscriber;
- (void)setCheckedDiagnostics:(BOOL)a3;
- (void)setCheckedMetrics:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setIVarQueue:(id)a3;
- (void)setManagerLogHandle:(id)a3;
- (void)setMetricToken:(int)a3;
- (void)setPastDiagnosticPayloads:(id)a3;
- (void)setPastPayloads:(id)a3;
- (void)setSubscribers:(id)a3;
@end

@implementation MXMetricManager

uint64_t __32__MXMetricManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

+ (MXMetricManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MXMetricManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;

  return (MXMetricManager *)v2;
}

- (void)addSubscriber:(id)subscriber
{
  id v4 = subscriber;
  iVarQueue = self->_iVarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__MXMetricManager_addSubscriber___block_invoke;
  v7[3] = &unk_2647ED2C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(iVarQueue, v7);
}

- (void)_checkAndDeliverMetricReports
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E81000, v0, v1, "Connected - calling retrieve metrics", v2, v3, v4, v5, v6);
}

- (void)setCheckedMetrics:(BOOL)a3
{
  self->_checkedMetrics = a3;
}

- (BOOL)checkedMetrics
{
  return self->_checkedMetrics;
}

- (void)_checkAndDeliverDiagnosticReports
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E81000, v0, v1, "Connected - calling retrieve diagnostics", v2, v3, v4, v5, v6);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_os_log)managerLogHandle
{
  return self->_managerLogHandle;
}

void __33__MXMetricManager_addSubscriber___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) subscribers];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) subscribers];
    uint64_t v5 = [v4 count];

    uint8_t v6 = [*(id *)(a1 + 32) subscribers];
    [v6 addObject:*(void *)(a1 + 40)];

    if (v5)
    {
      if (objc_opt_respondsToSelector())
      {
        v7 = [*(id *)(a1 + 32) pastPayloads];
        uint64_t v8 = [v7 count];

        if (v8)
        {
          v9 = *(void **)(a1 + 40);
          v10 = [*(id *)(a1 + 32) pastPayloads];
          [v9 didReceiveMetricPayloads:v10];
        }
      }
      if (objc_opt_respondsToSelector())
      {
        v11 = [*(id *)(a1 + 32) pastDiagnosticPayloads];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          v13 = *(void **)(a1 + 40);
          id v15 = [*(id *)(a1 + 32) pastDiagnosticPayloads];
          [v13 didReceiveDiagnosticPayloads:v15];
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) _checkAndDeliverDiagnosticReports];
      v14 = *(void **)(a1 + 32);
      [v14 _checkAndDeliverMetricReports];
    }
  }
}

- (NSHashTable)subscribers
{
  return self->_subscribers;
}

- (void)setCheckedDiagnostics:(BOOL)a3
{
  self->_checkedDiagnostics = a3;
}

- (BOOL)checkedDiagnostics
{
  return self->_checkedDiagnostics;
}

- (MXMetricManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)MXMetricManager;
  id v2 = [(MXMetricManager *)&v25 init];
  if (v2)
  {
    char v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.metrickit.manager.queue", v3);
    uint64_t v5 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v4;

    os_log_t v6 = os_log_create("com.apple.metrickit.metricmanager", "");
    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v6;

    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v9 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v8;

    id v10 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    v11 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v10;

    id v12 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    v13 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v12;

    *((_WORD *)v2 + 4) = 0;
    uint64_t v14 = [v2 _createXPCConnection];
    id v15 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v14;

    v16 = (void *)*((void *)v2 + 6);
    if (v16)
    {
      v17 = [v16 remoteObjectProxy];
      [v17 registerClient];

      [*((id *)v2 + 6) invalidate];
      v18 = (void *)*((void *)v2 + 6);
      *((void *)v2 + 6) = 0;
    }
    objc_initWeak(&location, v2);
    v19 = *((void *)v2 + 4);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __23__MXMetricManager_init__block_invoke;
    handler[3] = &unk_2647ED278;
    id v22 = v2;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch("com.apple.metrickit.data", (int *)v2 + 3, v19, handler);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }
  return (MXMetricManager *)v2;
}

- (id)_createXPCConnection
{
  connection = self->_connection;
  if (connection)
  {
    char v3 = connection;
  }
  else
  {
    char v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.metrickit.xpc" options:4096];
    if (v3)
    {
      uint64_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DB0BE60];
      [(NSXPCConnection *)v3 setRemoteObjectInterface:v5];

      os_log_t v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DB0AEA0];
      [(NSXPCConnection *)v3 setExportedInterface:v6];

      v7 = (void *)MEMORY[0x263EFFA08];
      uint64_t v8 = objc_opt_class();
      v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      id v10 = (void *)MEMORY[0x263EFFA08];
      uint64_t v11 = objc_opt_class();
      id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v13 = [(NSXPCConnection *)v3 exportedInterface];
      [v13 setClasses:v9 forSelector:sel_deliverMetricPayload_ argumentIndex:0 ofReply:0];

      uint64_t v14 = [(NSXPCConnection *)v3 exportedInterface];
      [v14 setClasses:v12 forSelector:sel_deliverDiagnosticPayload_ argumentIndex:0 ofReply:0];

      [(NSXPCConnection *)v3 setExportedObject:self];
      [(NSXPCConnection *)v3 resume];
    }
  }

  return v3;
}

void __23__MXMetricManager_init__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerLogHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __23__MXMetricManager_init__block_invoke_cold_1();
  }

  char v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setCheckedMetrics:0];

  id v5 = objc_loadWeakRetained(v3);
  [v5 setCheckedDiagnostics:0];

  id v6 = objc_loadWeakRetained(v3);
  [v6 _checkAndDeliverDiagnosticReports];

  id v7 = objc_loadWeakRetained(v3);
  [v7 _checkAndDeliverMetricReports];
}

- (void)dealloc
{
  notify_cancel(self->_metricToken);
  v3.receiver = self;
  v3.super_class = (Class)MXMetricManager;
  [(MXMetricManager *)&v3 dealloc];
}

+ (os_log_t)makeLogHandleWithCategory:(NSString *)category
{
  os_log_t v3 = os_log_create("com.apple.metrickit.log", [(NSString *)category UTF8String]);

  return v3;
}

- (void)removeSubscriber:(id)subscriber
{
  id v4 = subscriber;
  iVarQueue = self->_iVarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__MXMetricManager_removeSubscriber___block_invoke;
  v7[3] = &unk_2647ED2C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(iVarQueue, v7);
}

void __36__MXMetricManager_removeSubscriber___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) subscribers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

+ (BOOL)extendLaunchMeasurementForTaskID:(MXLaunchTaskID)taskID error:(NSError *)error
{
  int started = alm_will_start_extended_launch_task();
  id v6 = 0;
  uint64_t v7 = 1;
  switch(started)
  {
    case 0:
      goto LABEL_11;
    case 1:
      uint64_t v7 = 0;
      goto LABEL_7;
    case 2:
      goto LABEL_7;
    case 3:
      uint64_t v7 = 2;
      goto LABEL_7;
    case 4:
      uint64_t v7 = 3;
      goto LABEL_7;
    case 5:
      uint64_t v7 = 4;
      goto LABEL_7;
    case 6:
      uint64_t v7 = 5;
LABEL_7:
      id v6 = [MEMORY[0x263F087E8] errorWithMXErrorCode:v7];
      break;
    default:
      break;
  }
  if (error)
  {
    id v6 = v6;
    LOBYTE(v7) = 0;
    *error = v6;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_11:

  return v7;
}

+ (BOOL)finishExtendedLaunchMeasurementForTaskID:(MXLaunchTaskID)taskID error:(NSError *)error
{
  int v5 = alm_did_finish_extended_launch_task();
  id v6 = 0;
  uint64_t v7 = 1;
  switch(v5)
  {
    case 0:
      goto LABEL_11;
    case 1:
      uint64_t v7 = 0;
      goto LABEL_7;
    case 2:
      goto LABEL_7;
    case 3:
      uint64_t v7 = 2;
      goto LABEL_7;
    case 4:
      uint64_t v7 = 3;
      goto LABEL_7;
    case 5:
      uint64_t v7 = 4;
      goto LABEL_7;
    case 6:
      uint64_t v7 = 5;
LABEL_7:
      id v6 = [MEMORY[0x263F087E8] errorWithMXErrorCode:v7];
      break;
    default:
      break;
  }
  if (error)
  {
    id v6 = v6;
    LOBYTE(v7) = 0;
    *error = v6;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_11:

  return v7;
}

- (BOOL)_cachedPayloadAvailable
{
  return 0;
}

- (id)mergeDiagnosticsAtLocation:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v69 = 0;
  v62 = v5;
  v63 = v4;
  id v8 = [v5 contentsOfDirectoryAtPath:v4 error:&v69];
  id v9 = v69;
  v59 = v7;
  if (v9)
  {
    uint64_t v10 = (uint64_t)v9;
    obj = [(MXMetricManager *)self managerLogHandle];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      [(MXMetricManager *)(uint64_t)v63 mergeDiagnosticsAtLocation:obj];
    }
    goto LABEL_4;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obj = v8;
  uint64_t v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16, 0, v8);
  if (!v14)
  {
LABEL_4:
    uint64_t v11 = 0;
    id v12 = 0;
    v13 = v58;
    goto LABEL_37;
  }
  uint64_t v15 = v14;
  v55 = self;
  v56 = v6;
  uint64_t v11 = 0;
  id v12 = 0;
  uint64_t v16 = *(void *)v66;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v66 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v65 + 1) + 8 * i);
      v19 = [v63 stringByAppendingPathComponent:v18];
      v20 = [v62 contentsAtPath:v19];

      v21 = (void *)MEMORY[0x263F08928];
      uint64_t v22 = objc_opt_class();
      id v64 = 0;
      id v23 = [v21 unarchivedObjectOfClass:v22 fromData:v20 error:&v64];
      id v24 = v64;
      objc_super v25 = v24;
      if (v23) {
        BOOL v26 = v24 == 0;
      }
      else {
        BOOL v26 = 0;
      }
      if (!v26)
      {
        if (!v24) {
          goto LABEL_34;
        }
        v27 = [(MXMetricManager *)v55 managerLogHandle];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v71 = v18;
          __int16 v72 = 2112;
          v73 = v25;
          _os_log_error_impl(&dword_226E81000, v27, OS_LOG_TYPE_ERROR, "Error while reading Diagnostic Report :%@ with error: %@", buf, 0x16u);
        }
        goto LABEL_32;
      }
      v28 = [v23 hangDiagnostics];

      if (v28)
      {
        v29 = [v23 hangDiagnostics];
        [v56 addObjectsFromArray:v29];
      }
      v30 = [v23 cpuExceptionDiagnostics];

      if (v30)
      {
        v31 = [v23 cpuExceptionDiagnostics];
        [v58 addObjectsFromArray:v31];
      }
      v32 = [v23 diskWriteExceptionDiagnostics];

      if (v32)
      {
        v33 = [v23 diskWriteExceptionDiagnostics];
        [v59 addObjectsFromArray:v33];
      }
      v34 = [v23 crashDiagnostics];

      if (v34)
      {
        v35 = [v23 crashDiagnostics];
        [v60 addObjectsFromArray:v35];
      }
      v36 = [v23 appLaunchDiagnostics];

      if (v36)
      {
        v37 = [v23 appLaunchDiagnostics];
        [v57 addObjectsFromArray:v37];
      }
      v38 = [v23 timeStampBegin];
      v39 = v38;
      if (v12)
      {
        uint64_t v40 = [v38 earlierDate:v12];

        id v12 = (void *)v40;
      }
      else
      {
        id v12 = v38;
      }
      v41 = [v23 timeStampEnd];
      v27 = v41;
      if (v11)
      {
        uint64_t v42 = [v41 laterDate:v11];

        uint64_t v11 = (void *)v42;
LABEL_32:

        goto LABEL_34;
      }
      uint64_t v11 = v41;
LABEL_34:
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  }
  while (v15);
  id v6 = v56;
  v13 = v58;
  id v7 = v59;
LABEL_37:

  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v7 count])
  {
    v44 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
    [v43 setObject:v44 forKey:@"diskWriteExceptionDiagnostics"];
  }
  if ([v6 count])
  {
    v45 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
    [v43 setObject:v45 forKey:@"hangDiagnostics"];
  }
  if ([v13 count])
  {
    v46 = [MEMORY[0x263EFF8C0] arrayWithArray:v13];
    [v43 setObject:v46 forKey:@"cpuExceptionDiagnostics"];
  }
  if ([v60 count])
  {
    v47 = [MEMORY[0x263EFF8C0] arrayWithArray:v60];
    [v43 setObject:v47 forKey:@"crashDiagnostics"];
  }
  if ([v57 count])
  {
    v48 = [MEMORY[0x263EFF8C0] arrayWithArray:v57];
    [v43 setObject:v48 forKey:@"appLaunchDiagnostics"];
  }
  v49 = [MXDiagnosticPayload alloc];
  v50 = (void *)[v43 copy];
  v51 = [(MXDiagnosticPayload *)v49 initWithTimeStampBegin:v12 withTimeStampEnd:v11 withDiagnostics:v50];

  return v51;
}

- (void)deliverMetricPayload:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    int v5 = [(MXMetricManager *)self managerLogHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_226E81000, v5, OS_LOG_TYPE_DEFAULT, "Delivering metric reports: %@", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = [(MXMetricManager *)self pastPayloads];
    [v6 addObjectsFromArray:v7];

    [v6 addObjectsFromArray:v4];
    id v8 = (void *)[v6 copy];
    [(MXMetricManager *)self setPastPayloads:v8];

    iVarQueue = self->_iVarQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__MXMetricManager_deliverMetricPayload___block_invoke;
    v10[3] = &unk_2647ED2C0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(iVarQueue, v10);
  }
}

void __40__MXMetricManager_deliverMetricPayload___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "subscribers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 didReceiveMetricPayloads:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)deliverDiagnosticPayload:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(MXMetricManager *)self managerLogHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_226E81000, v5, OS_LOG_TYPE_DEFAULT, "Delivering diagnostic reports: %@", buf, 0xCu);
    }

    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = [(MXMetricManager *)self pastDiagnosticPayloads];
    [v6 addObjectsFromArray:v7];

    [v6 addObjectsFromArray:v4];
    long long v8 = (void *)[v6 copy];
    [(MXMetricManager *)self setPastDiagnosticPayloads:v8];

    iVarQueue = self->_iVarQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__MXMetricManager_deliverDiagnosticPayload___block_invoke;
    v10[3] = &unk_2647ED2C0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(iVarQueue, v10);
  }
}

void __44__MXMetricManager_deliverDiagnosticPayload___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "subscribers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 didReceiveDiagnosticPayloads:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSArray)pastPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPastPayloads:(id)a3
{
}

- (NSArray)pastDiagnosticPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPastDiagnosticPayloads:(id)a3
{
}

- (OS_dispatch_queue)iVarQueue
{
  return self->_iVarQueue;
}

- (void)setIVarQueue:(id)a3
{
}

- (void)setManagerLogHandle:(id)a3
{
}

- (int)metricToken
{
  return self->_metricToken;
}

- (void)setMetricToken:(int)a3
{
  self->_metricToken = a3;
}

- (void)setSubscribers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_managerLogHandle, 0);
  objc_storeStrong((id *)&self->_iVarQueue, 0);
  objc_storeStrong((id *)&self->_pastDiagnosticPayloads, 0);

  objc_storeStrong((id *)&self->_pastPayloads, 0);
}

void __23__MXMetricManager_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E81000, v0, v1, "Calling check & deliver", v2, v3, v4, v5, v6);
}

- (void)mergeDiagnosticsAtLocation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_226E81000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve contents of directory %@ data on disk: %@", (uint8_t *)&v3, 0x16u);
}

@end