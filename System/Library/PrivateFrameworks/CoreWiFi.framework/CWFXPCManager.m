@interface CWFXPCManager
- (CWFPrivateMACManager)privateMACManager;
- (CWFXPCManager)init;
- (CWFXPCManager)initWithServiceTypes:(id)a3;
- (CWFXPCManagerDelegate)delegate;
- (NSSet)supportedRequestTypes;
- (id)endpointWithServiceType:(int64_t)a3;
- (id)localXPCClientWithServiceType:(int64_t)a3;
- (id)registeredActivities;
- (id)registeredEventIDs;
- (void)XPCListener:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5;
- (void)XPCListener:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5;
- (void)XPCListener:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5;
- (void)XPCListener:(id)a3 invalidatedXPCConnection:(id)a4;
- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5;
- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5;
- (void)XPCRequestProxy:(id)a3 invalidatedXPCConnection:(id)a4;
- (void)XPCRequestProxy:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5;
- (void)__updateProcessMonitorConfiguration;
- (void)invalidate;
- (void)resume;
- (void)sendXPCEvent:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSupportedRequestTypes:(id)a3;
- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5;
- (void)suspend;
@end

@implementation CWFXPCManager

- (void)XPCRequestProxy:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F4123C;
  block[3] = &unk_1E60BC128;
  id v13 = v7;
  id v14 = v8;
  block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(mutexQueue, block);
}

- (id)registeredActivities
{
  v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4);
  mutexQueue = self->_mutexQueue;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = sub_1B4F4E6F0;
  v18 = &unk_1E60BB9F0;
  v19 = self;
  id v20 = v6;
  id v8 = v6;
  dispatch_sync(mutexQueue, &v15);
  id v13 = objc_msgSend_copy(v8, v9, v10, v11, v12, v15, v16, v17, v18, v19);

  return v13;
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
}

- (void)XPCRequestProxy:(id)a3 invalidatedXPCConnection:(id)a4
{
  id v12 = a4;
  v9 = objc_msgSend_delegate(self, v5, v6, v7, v8);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_XPCManager_invalidatedXPCConnection_(v9, v10, (uint64_t)self, (uint64_t)v12, v11);
  }
}

- (CWFXPCManagerDelegate)delegate
{
  return (CWFXPCManagerDelegate *)objc_getProperty(self, a2, 48, 1);
}

- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v13 = objc_msgSend_delegate(self, v9, v10, v11, v12);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_4;
  }
  v18 = objc_msgSend_supportedRequestTypes(self, v14, v15, v16, v17);
  v19 = NSNumber;
  uint64_t v24 = objc_msgSend_type(v8, v20, v21, v22, v23);
  v28 = objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
  int v32 = objc_msgSend_containsObject_(v18, v29, (uint64_t)v28, v30, v31);

  if (v32)
  {
    objc_msgSend_XPCManager_XPCConnection_receivedXPCRequest_(v13, v33, (uint64_t)self, (uint64_t)v7, (uint64_t)v8);
  }
  else
  {
LABEL_4:
    v34 = CWFGetOSLog();
    if (v34)
    {
      v35 = CWFGetOSLog();
    }
    else
    {
      v35 = MEMORY[0x1E4F14500];
      id v36 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = objc_msgSend_type(v8, v37, v38, v39, v40);
      v58 = sub_1B4F43CD0(v41, v42, v43, v44, v45);
      _os_log_send_and_compose_impl();
    }
    v50 = objc_msgSend_response(v8, v46, v47, v48, v49);

    if (v50)
    {
      objc_msgSend_response(v8, v51, v52, v53, v54);
      v55 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v56, *MEMORY[0x1E4F28798], 45, 0);
      ((void (**)(void, void *, void))v55)[2](v55, v57, 0);
    }
  }
}

- (NSSet)supportedRequestTypes
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)XPCListener:(id)a3 invalidatedXPCConnection:(id)a4
{
  objc_msgSend_XPCManager_invalidatedXPCConnection_(self->_XPCRequestProxy, a2, (uint64_t)self, (uint64_t)a4, v4);
}

- (CWFXPCManager)initWithServiceTypes:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CWFXPCManager;
  v5 = [(CWFXPCManager *)&v54 init];
  if (v5)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v46 = CWFGetOSLog();
      if (v46)
      {
        p_super = CWFGetOSLog();
      }
      else
      {
        p_super = MEMORY[0x1E4F14500];
        id v47 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = 0;
        _os_log_send_and_compose_impl();
      }
LABEL_24:

LABEL_25:
      p_super = &v5->super;
      v5 = 0;
      goto LABEL_26;
    }
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.XPC-manager-mutex", v6);
    mutexQueue = v5->_mutexQueue;
    v5->_mutexQueue = (OS_dispatch_queue *)v7;

    if (!v5->_mutexQueue) {
      goto LABEL_25;
    }
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableXPCListeners = v5->_mutableXPCListeners;
    v5->_mutableXPCListeners = v9;

    if (!v5->_mutableXPCListeners) {
      goto LABEL_25;
    }
    uint64_t v11 = objc_alloc_init(CWFXPCRequestProxy);
    XPCRequestProxy = v5->_XPCRequestProxy;
    v5->_XPCRequestProxy = v11;

    if (!v5->_XPCRequestProxy) {
      goto LABEL_25;
    }
    if (objc_opt_class())
    {
      uint64_t v17 = objc_msgSend_monitor(MEMORY[0x1E4F96418], v13, v14, v15, v16);
      processMonitor = v5->_processMonitor;
      v5->_processMonitor = (RBSProcessMonitor *)v17;

      if (!v5->_processMonitor) {
        goto LABEL_25;
      }
      v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      processMonitorPIDs = v5->_processMonitorPIDs;
      v5->_processMonitorPIDs = v19;

      if (!v5->_processMonitorPIDs) {
        goto LABEL_25;
      }
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    p_super = v4;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(p_super, v22, (uint64_t)&v49, (uint64_t)v55, 16);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v50;
LABEL_11:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(p_super);
        }
        uint64_t v27 = *(void **)(*((void *)&v49 + 1) + 8 * v26);
        v28 = [CWFXPCListener alloc];
        uint64_t v33 = objc_msgSend_integerValue(v27, v29, v30, v31, v32);
        v37 = objc_msgSend_initWithServiceType_(v28, v34, v33, v35, v36);
        if (!v37) {
          goto LABEL_24;
        }
        uint64_t v41 = v37;
        objc_msgSend_setDelegate_(v37, v38, (uint64_t)v5, v39, v40);
        objc_msgSend_addObject_(v5->_mutableXPCListeners, v42, (uint64_t)v41, v43, v44);

        if (v24 == ++v26)
        {
          uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(p_super, v45, (uint64_t)&v49, (uint64_t)v55, 16);
          if (v24) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
  }
  else
  {
    p_super = 0;
  }
LABEL_26:

  return v5;
}

- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5
{
}

- (CWFXPCManager)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFXPCManager init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
}

- (void)resume
{
  objc_msgSend_setDelegate_(self->_XPCRequestProxy, a2, (uint64_t)self, v2, v3);
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F88670;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  objc_msgSend_startEventMonitoring(self->_XPCRequestProxy, v6, v7, v8, v9);
}

- (void)suspend
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F887E8;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)invalidate
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F88960;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)registeredEventIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  mutexQueue = self->_mutexQueue;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_1B4F88B7C;
  uint64_t v15 = &unk_1E60BB9F0;
  uint64_t v16 = self;
  id v17 = v3;
  id v5 = v3;
  dispatch_sync(mutexQueue, &v12);
  uint64_t v10 = objc_msgSend_copy(v5, v6, v7, v8, v9, v12, v13, v14, v15, v16);

  return v10;
}

- (id)localXPCClientWithServiceType:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1B4F51C3C;
  uint64_t v11 = sub_1B4F51BCC;
  id v12 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F88DA0;
  block[3] = &unk_1E60BC0B0;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)endpointWithServiceType:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1B4F51C3C;
  uint64_t v11 = sub_1B4F51BCC;
  id v12 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F88FD4;
  block[3] = &unk_1E60BC0B0;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (CWFPrivateMACManager)privateMACManager
{
  return (CWFPrivateMACManager *)objc_msgSend_privateMACManager(self->_XPCRequestProxy, a2, v2, v3, v4);
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
}

- (void)__updateProcessMonitorConfiguration
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F891AC;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5
{
  id v51 = a4;
  id v7 = a5;
  objc_msgSend_XPCManager_XPCConnection_updatedRegisteredEventIDs_(self->_XPCRequestProxy, v8, (uint64_t)self, (uint64_t)v51, (uint64_t)v7);
  if ((objc_msgSend_isLocal(v51, v9, v10, v11, v12) & 1) == 0)
  {
    objc_msgSend___updateProcessMonitorConfiguration(self, v13, v14, v15, v16);
    if (objc_msgSend_count(v7, v17, v18, v19, v20))
    {
      if (objc_msgSend_count(v7, v21, v22, v23, v24) == 1 && objc_opt_class())
      {
        v29 = (void *)MEMORY[0x1E4F963F8];
        uint64_t v30 = objc_msgSend_XPCConnection(v51, v25, v26, v27, v28);
        uint64_t v35 = objc_msgSend_processIdentifier(v30, v31, v32, v33, v34);
        uint64_t v39 = objc_msgSend_identifierWithPid_(v29, v36, v35, v37, v38);

        v42 = objc_msgSend_handleForIdentifier_error_(MEMORY[0x1E4F963E8], v40, (uint64_t)v39, 0, v41);
        id v47 = objc_msgSend_currentState(v42, v43, v44, v45, v46);
        objc_msgSend_setProcessState_(v51, v48, (uint64_t)v47, v49, v50);
      }
    }
    else
    {
      objc_msgSend_setProcessState_(v51, v21, 0, v23, v24);
    }
  }
}

- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  uint64_t v12 = objc_msgSend_delegate(self, v8, v9, v10, v11);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_XPCManager_XPCConnection_canceledXPCRequestsWithUUID_(v12, v13, (uint64_t)self, (uint64_t)v14, (uint64_t)v7);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setSupportedRequestTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRequestTypes, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_processMonitorPIDs, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_XPCRequestProxy, 0);
  objc_storeStrong((id *)&self->_mutableXPCListeners, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end