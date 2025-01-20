@interface CWFXPCClient
- (BOOL)allowRequestType:(int64_t)a3;
- (BOOL)beginActivity:(id)a3 requestParameters:(id)a4 error:(id *)a5;
- (BOOL)invalidated;
- (BOOL)startMonitoringEvent:(id)a3 requestParameters:(id)a4 error:(id *)a5;
- (CWFXPCClient)init;
- (CWFXPCClient)initWithServiceType:(int64_t)a3;
- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4;
- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4 remoteXPCProxyConnection:(id)a5;
- (CWFXPCClient)initWithServiceType:(int64_t)a3 remoteXPCProxyConnection:(id)a4;
- (CWFXPCProxyConnection)localXPCProxyConnection;
- (CWFXPCProxyConnection)remoteXPCProxyConnection;
- (OS_dispatch_queue)targetQueue;
- (id)eventHandlerWithEventID:(id)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (int64_t)serviceType;
- (void)__acknowledgeEventWithUUID:(id)a3;
- (void)__beginActivity:(id)a3 requestParameters:(id)a4 reply:(id)a5;
- (void)__receivedEvent:(id)a3;
- (void)__startMonitoringEvent:(id)a3 requestParameters:(id)a4 reply:(id)a5;
- (void)clearAllEventHandlers;
- (void)dealloc;
- (void)endActivity:(id)a3 requestParameters:(id)a4;
- (void)endAllActivities:(id)a3;
- (void)invalidate;
- (void)receivedAcknowledgedXPCEvent:(id)a3 reply:(id)a4;
- (void)receivedXPCEvent:(id)a3;
- (void)resume;
- (void)setEventHandler:(id)a3 eventID:(id)a4;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRemoteXPCProxyConnection:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)stopMonitoringAllEvents:(id)a3;
- (void)stopMonitoringEvent:(id)a3 requestParameters:(id)a4;
- (void)suspend;
@end

@implementation CWFXPCClient

- (void)dealloc
{
  if ((objc_msgSend_invalidated(self, a2, v2, v3, v4) & 1) == 0)
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v6, *MEMORY[0x1E4F1C3B8], @"'invalidate' must be called before dealloc", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)CWFXPCClient;
  [(CWFXPCClient *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteXPCProxyConnection, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
  objc_storeStrong((id *)&self->_mutableEventAckMap, 0);
  objc_storeStrong((id *)&self->_mutableEventCallbackMap, 0);
  objc_storeStrong((id *)&self->_mutableActivityMap, 0);
  objc_storeStrong((id *)&self->_mutableEventIDMap, 0);
  objc_storeStrong((id *)&self->_mutex, 0);
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3 remoteXPCProxyConnection:(id)a4
{
  return (CWFXPCClient *)MEMORY[0x1F4181798](self, sel_initWithServiceType_endpoint_remoteXPCProxyConnection_, a3, 0, a4);
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3
{
  return (CWFXPCClient *)objc_msgSend_initWithServiceType_remoteXPCProxyConnection_(self, a2, a3, 0, v3);
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (objc_msgSend_invalidated(obj, v2, v3, v4, v5))
  {
    objc_sync_exit(obj);
  }
  else
  {
    objc_msgSend_setInvalidated_(obj, v6, 1, v7, v8);
    objc_sync_exit(obj);

    mutex = obj->_mutex;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F36294;
    block[3] = &unk_1E60BB768;
    block[4] = obj;
    dispatch_sync(mutex, block);
    objc_msgSend_setInterruptionHandler_(obj, v10, 0, v11, v12);
    XPCConnection = obj->_XPCConnection;
    if (XPCConnection)
    {
      objc_msgSend_invalidate(XPCConnection, (const char *)obj, v13, v14, v15);
    }
    else
    {
      v21 = objc_msgSend_remoteXPCProxyConnection(obj, (const char *)obj, v13, v14, v15);
      objc_msgSend_invalidate(v21, v22, v23, v24, v25);
    }
    v26 = objc_msgSend_targetQueue(obj, v17, v18, v19, v20);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4F486D0;
    v28[3] = &unk_1E60BB768;
    v28[4] = obj;
    dispatch_async(v26, v28);
  }
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void)__receivedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_1B5002D10;
  v34 = sub_1B5002D3C;
  id v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  mutex = self->_mutex;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_1B4F4254C;
  v21 = &unk_1E60BD390;
  id v6 = v4;
  id v22 = v6;
  uint64_t v23 = self;
  uint64_t v24 = &v26;
  uint64_t v25 = &v30;
  dispatch_sync(mutex, &v18);
  if (*((unsigned char *)v27 + 24))
  {
    uint64_t v11 = v31[5];
    if (v11)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
    else
    {
      uint64_t v12 = objc_msgSend_acknowledge(v6, v7, v8, v9, v10, v18, v19, v20, v21);

      if (v12)
      {
        objc_msgSend_acknowledge(v6, v13, v14, v15, v16);
        v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v17[2]();
      }
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)receivedXPCEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CWFEvent);
  uint64_t v10 = objc_msgSend_type(v4, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_interfaceName(v4, v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v16, v10, (uint64_t)v15, v17);
  objc_msgSend_setEventID_(v5, v19, (uint64_t)v18, v20, v21);

  uint64_t v26 = objc_msgSend_timestamp(v4, v22, v23, v24, v25);
  objc_msgSend_setTimestamp_(v5, v27, (uint64_t)v26, v28, v29);

  v34 = objc_msgSend_info(v4, v30, v31, v32, v33);

  objc_msgSend_setInfo_(v5, v35, (uint64_t)v34, v36, v37);
  v42 = objc_msgSend_targetQueue(self, v38, v39, v40, v41);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1B4F39B04;
  v44[3] = &unk_1E60BB9F0;
  v44[4] = self;
  v45 = v5;
  v43 = v5;
  dispatch_async(v42, v44);
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4 remoteXPCProxyConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v97.receiver = self;
  v97.super_class = (Class)CWFXPCClient;
  uint64_t v10 = [(CWFXPCClient *)&v97 init];
  uint64_t v15 = v10;
  uint64_t v16 = 0;
  if ((unint64_t)(a3 - 8) < 0xFFFFFFFFFFFFFFF9 || !v10) {
    goto LABEL_20;
  }
  v10->_serviceType = a3;
  uint64_t v17 = NSString;
  uint64_t v18 = sub_1B4F4B704(a3);
  objc_msgSend_stringWithFormat_(v17, v19, @"com.apple.corewifi.client-mutex.%@", v20, v21, v18);
  id v22 = objc_claimAutoreleasedReturnValue();
  v27 = (const char *)objc_msgSend_UTF8String(v22, v23, v24, v25, v26);
  uint64_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
  mutex = v15->_mutex;
  v15->_mutex = (OS_dispatch_queue *)v29;

  if (!v15->_mutex) {
    goto LABEL_19;
  }
  uint64_t v31 = NSString;
  uint64_t v32 = sub_1B4F4B704(v15->_serviceType);
  objc_msgSend_stringWithFormat_(v31, v33, @"com.apple.corewifi.client-event.%@", v34, v35, v32);
  id v36 = objc_claimAutoreleasedReturnValue();
  uint64_t v41 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39, v40);
  v42 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v43 = dispatch_queue_create(v41, v42);
  targetQueue = v15->_targetQueue;
  v15->_targetQueue = (OS_dispatch_queue *)v43;

  if (!v15->_targetQueue) {
    goto LABEL_19;
  }
  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  mutableEventIDMap = v15->_mutableEventIDMap;
  v15->_mutableEventIDMap = v45;

  if (!v15->_mutableEventIDMap) {
    goto LABEL_19;
  }
  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  mutableEventCallbackMap = v15->_mutableEventCallbackMap;
  v15->_mutableEventCallbackMap = v47;

  if (!v15->_mutableEventCallbackMap) {
    goto LABEL_19;
  }
  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  mutableEventAckMap = v15->_mutableEventAckMap;
  v15->_mutableEventAckMap = v49;

  if (!v15->_mutableEventAckMap
    || (v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]),
        mutableActivityMap = v15->_mutableActivityMap,
        v15->_mutableActivityMap = v51,
        mutableActivityMap,
        !v15->_mutableActivityMap))
  {
LABEL_19:
    uint64_t v16 = 0;
    goto LABEL_20;
  }
  if (!v9)
  {
    if (v8)
    {
      id v56 = objc_alloc(MEMORY[0x1E4F29268]);
      uint64_t v60 = objc_msgSend_initWithListenerEndpoint_(v56, v57, (uint64_t)v8, v58, v59);
      XPCConnection = v15->_XPCConnection;
      v15->_XPCConnection = (NSXPCConnection *)v60;

      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = sub_1B4F4B704(v15->_serviceType);
      if (!v16) {
        goto LABEL_20;
      }
      id v62 = objc_alloc(MEMORY[0x1E4F29268]);
      uint64_t v65 = objc_msgSend_initWithMachServiceName_options_(v62, v63, (uint64_t)v16, 4096, v64);
      v66 = v15->_XPCConnection;
      v15->_XPCConnection = (NSXPCConnection *)v65;
    }
    if (v15->_XPCConnection)
    {
      uint64_t v67 = sub_1B4F4B75C(v15->_serviceType, 0, v12, v13, v14);
      if (v67)
      {
        v54 = (void *)v67;
        objc_msgSend_setRemoteObjectInterface_(v15->_XPCConnection, v11, v67, v13, v14);
        v72 = sub_1B4F4B8E0(v15->_serviceType, v68, v69, v70, v71);
        objc_msgSend_setExportedInterface_(v15->_XPCConnection, v73, (uint64_t)v72, v74, v75);

        objc_msgSend_setExportedObject_(v15->_XPCConnection, v76, (uint64_t)v15, v77, v78);
        v79 = v15;
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = sub_1B500128C;
        v95[3] = &unk_1E60BB768;
        v80 = v79;
        v96 = v80;
        objc_msgSend_setInterruptionHandler_(v15->_XPCConnection, v81, (uint64_t)v95, v82, v83);
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = sub_1B4F390D4;
        v92[3] = &unk_1E60BB9F0;
        v93 = v80;
        v94 = v93;
        v84 = v15->_XPCConnection;
        remoteXPCProxyConnection = v93;
        objc_msgSend_setInvalidationHandler_(v84, v85, (uint64_t)v92, v86, v87);

        uint64_t v15 = remoteXPCProxyConnection;
        goto LABEL_18;
      }
    }
LABEL_20:
    objc_msgSend_invalidate(v15->_XPCConnection, v11, v12, v13, v14);
    objc_msgSend_setInvalidated_(v15, v89, 1, v90, v91);
    v54 = 0;
    remoteXPCProxyConnection = v15;
    uint64_t v15 = 0;
    goto LABEL_18;
  }
  v53 = (CWFXPCProxyConnection *)v9;
  v54 = 0;
  uint64_t v16 = 0;
  remoteXPCProxyConnection = (CWFXPCClient *)v15->_remoteXPCProxyConnection;
  v15->_remoteXPCProxyConnection = v53;
LABEL_18:

  return v15;
}

- (BOOL)allowRequestType:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_serviceType(self, a2, a3, v3, v4);
  uint64_t v12 = sub_1B4F4BA0C(v7, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v14, v15);
  int v20 = objc_msgSend_containsObject_(v12, v17, (uint64_t)v16, v18, v19);

  if (v20)
  {
    uint64_t v21 = self;
    objc_sync_enter(v21);
    uint64_t v26 = objc_msgSend_remoteObjectInterface(v21->_XPCConnection, v22, v23, v24, v25);
    sub_1B4F4BB38(a3, v26);

    objc_sync_exit(v21);
  }
  return v20;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v13 = objc_msgSend_remoteXPCProxyConnection(self, v5, v6, v7, v8);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_remoteXPCProxyConnection(self, v9, v10, v11, v12);
    uint64_t v18 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v4, v16, v17);
  }
  else
  {
    uint64_t v18 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCConnection, v9, (uint64_t)v4, v11, v12);
  }

  return v18;
}

- (CWFXPCProxyConnection)remoteXPCProxyConnection
{
  return self->_remoteXPCProxyConnection;
}

- (void)resume
{
  objc_msgSend_resume(self->_XPCConnection, a2, v2, v3, v4);
}

- (CWFXPCClient)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFXPCClient init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4
{
  return (CWFXPCClient *)MEMORY[0x1F4181798](self, sel_initWithServiceType_endpoint_remoteXPCProxyConnection_, a3, a4, 0);
}

- (void)suspend
{
  objc_msgSend_suspend(self->_XPCConnection, a2, v2, v3, v4);
}

- (void)__beginActivity:(id)a3 requestParameters:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_allowRequestType_(self, v11, 171, v12, v13))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B5001B1C;
    v26[3] = &unk_1E60BCE48;
    id v15 = v10;
    id v27 = v15;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v26, v17, v18);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B5001B34;
    v22[3] = &unk_1E60BD368;
    v22[4] = self;
    id v23 = v8;
    id v24 = v9;
    id v25 = v15;
    objc_msgSend_beginActivity_requestParams_reply_(v19, v20, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22);
  }
  else if (v10)
  {
    uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v14, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *))v10 + 2))(v10, v21);
  }
}

- (BOOL)beginActivity:(id)a3 requestParameters:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1B4F51CAC;
  uint64_t v34 = sub_1B4F51C04;
  id v35 = 0;
  if (objc_msgSend_allowRequestType_(self, v10, 171, v11, v12))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B5001EB4;
    v29[3] = &unk_1E60BCD38;
    v29[4] = &v30;
    uint64_t v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v29, v14, v15);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B5001EC4;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v30;
    objc_msgSend_beginActivity_requestParams_reply_(v16, v17, (uint64_t)v8, (uint64_t)v9, (uint64_t)v28);

    mutex = self->_mutex;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B5001ED4;
    block[3] = &unk_1E60BB950;
    id v25 = v8;
    uint64_t v26 = self;
    id v27 = v9;
    dispatch_sync(mutex, block);

    uint64_t v19 = v25;
  }
  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v19 = (void *)v31[5];
    v31[5] = v23;
  }

  int v20 = (void *)v31[5];
  if (a5 && v20)
  {
    *a5 = v20;
    int v20 = (void *)v31[5];
  }
  BOOL v21 = v20 == 0;
  _Block_object_dispose(&v30, 8);

  return v21;
}

- (void)endActivity:(id)a3 requestParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self, v8, 172, v9, v10))
  {
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)&unk_1F0DA4010, v12, v13);
    uint64_t v19 = objc_msgSend_UUID(v6, v15, v16, v17, v18);
    objc_msgSend_endActivityWithUUID_requestParams_reply_(v14, v20, (uint64_t)v19, (uint64_t)v7, (uint64_t)&unk_1F0DA3250);

    mutex = self->_mutex;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B500203C;
    v22[3] = &unk_1E60BB9F0;
    id v23 = v6;
    id v24 = self;
    dispatch_sync(mutex, v22);
  }
}

- (void)endAllActivities:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_allowRequestType_(self, v5, 172, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)&unk_1F0DA40B0, v9, v10);
    objc_msgSend_endAllActivitiesWithRequestParams_reply_(v11, v12, (uint64_t)v4, (uint64_t)&unk_1F0DA40F0, v13);

    mutex = self->_mutex;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B5002164;
    block[3] = &unk_1E60BB768;
    void block[4] = self;
    dispatch_sync(mutex, block);
  }
}

- (void)__startMonitoringEvent:(id)a3 requestParameters:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_allowRequestType_(self, v11, 169, v12, v13))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B5002374;
    v26[3] = &unk_1E60BCE48;
    id v15 = v10;
    id v27 = v15;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v26, v17, v18);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B500238C;
    v22[3] = &unk_1E60BD368;
    void v22[4] = self;
    id v23 = v8;
    id v24 = v9;
    id v25 = v15;
    objc_msgSend_startMonitoringEvent_requestParams_reply_(v19, v20, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22);
  }
  else if (v10)
  {
    BOOL v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v14, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *))v10 + 2))(v10, v21);
  }
}

- (BOOL)startMonitoringEvent:(id)a3 requestParameters:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1B4F51CAC;
  uint64_t v34 = sub_1B4F51C04;
  id v35 = 0;
  if (objc_msgSend_allowRequestType_(self, v10, 169, v11, v12))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B500270C;
    v29[3] = &unk_1E60BCD38;
    v29[4] = &v30;
    uint64_t v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v29, v14, v15);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B500271C;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v30;
    objc_msgSend_startMonitoringEvent_requestParams_reply_(v16, v17, (uint64_t)v8, (uint64_t)v9, (uint64_t)v28);

    mutex = self->_mutex;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B500272C;
    block[3] = &unk_1E60BB950;
    id v25 = v8;
    uint64_t v26 = self;
    id v27 = v9;
    dispatch_sync(mutex, block);

    uint64_t v19 = v25;
  }
  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v19 = (void *)v31[5];
    v31[5] = v23;
  }

  int v20 = (void *)v31[5];
  if (a5 && v20)
  {
    *a5 = v20;
    int v20 = (void *)v31[5];
  }
  BOOL v21 = v20 == 0;
  _Block_object_dispose(&v30, 8);

  return v21;
}

- (void)stopMonitoringEvent:(id)a3 requestParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self, v8, 170, v9, v10))
  {
    uint64_t v14 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)&unk_1F0DA4130, v12, v13);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B5002864;
    v16[3] = &unk_1E60BB9C8;
    v16[4] = self;
    id v17 = v6;
    objc_msgSend_stopMonitoringEvent_requestParams_reply_(v14, v15, (uint64_t)v17, (uint64_t)v7, (uint64_t)v16);
  }
}

- (void)stopMonitoringAllEvents:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_allowRequestType_(self, v5, 170, v6, v7))
  {
    uint64_t v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)&unk_1F0DA4150, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B5002A10;
    v14[3] = &unk_1E60BC9F8;
    v14[4] = self;
    objc_msgSend_stopMonitoringAllEventsWithRequestParams_reply_(v11, v12, (uint64_t)v4, (uint64_t)v14, v13);
  }
}

- (void)setEventHandler:(id)a3 eventID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5002B94;
  block[3] = &unk_1E60BBD20;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(mutex, block);
}

- (id)eventHandlerWithEventID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_1B5002D10;
  id v17 = sub_1B5002D3C;
  id v18 = 0;
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5002D44;
  block[3] = &unk_1E60BC6D8;
  uint64_t v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutex, block);
  id v7 = (void *)MEMORY[0x1BA995F60](v14[5]);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)clearAllEventHandlers
{
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5002E20;
  block[3] = &unk_1E60BB768;
  void block[4] = self;
  dispatch_sync(mutex, block);
}

- (CWFXPCProxyConnection)localXPCProxyConnection
{
  uint64_t v3 = [CWFXPCProxyConnection alloc];
  id v7 = objc_msgSend_initWithForwardingTarget_(v3, v4, (uint64_t)self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B5002F0C;
  v12[3] = &unk_1E60BB768;
  v12[4] = self;
  objc_msgSend_setInvalidationHandler_(v7, v8, (uint64_t)v12, v9, v10);
  return (CWFXPCProxyConnection *)v7;
}

- (id)remoteObjectProxy
{
  uint64_t v10 = objc_msgSend_remoteXPCProxyConnection(self, a2, v2, v3, v4);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_remoteXPCProxyConnection(self, v6, v7, v8, v9);
    uint64_t v16 = objc_msgSend_remoteObjectProxy(v11, v12, v13, v14, v15);
  }
  else
  {
    uint64_t v16 = objc_msgSend_remoteObjectProxy(self->_XPCConnection, v6, v7, v8, v9);
  }

  return v16;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v13 = objc_msgSend_remoteXPCProxyConnection(self, v5, v6, v7, v8);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_remoteXPCProxyConnection(self, v9, v10, v11, v12);
    id v18 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v4, v16, v17);
  }
  else
  {
    id v18 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self->_XPCConnection, v9, (uint64_t)v4, v11, v12);
  }

  return v18;
}

- (void)__acknowledgeEventWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1B5002D10;
  uint64_t v15 = sub_1B5002D3C;
  id v16 = 0;
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B50032DC;
  block[3] = &unk_1E60BBCA8;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(mutex, block);
  uint64_t v7 = v12[5];
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }

  _Block_object_dispose(&v11, 8);
}

- (void)receivedAcknowledgedXPCEvent:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(CWFEvent);
  uint64_t v13 = objc_msgSend_type(v7, v9, v10, v11, v12);
  id v18 = objc_msgSend_interfaceName(v7, v14, v15, v16, v17);
  BOOL v21 = objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v19, v13, (uint64_t)v18, v20);
  objc_msgSend_setEventID_(v8, v22, (uint64_t)v21, v23, v24);

  dispatch_queue_t v29 = objc_msgSend_timestamp(v7, v25, v26, v27, v28);
  objc_msgSend_setTimestamp_(v8, v30, (uint64_t)v29, v31, v32);

  uint64_t v37 = objc_msgSend_acknowledgementTimeout(v7, v33, v34, v35, v36);
  objc_msgSend_setAcknowledgementTimeout_(v8, v38, v37, v39, v40);
  v45 = objc_msgSend_info(v7, v41, v42, v43, v44);

  objc_msgSend_setInfo_(v8, v46, (uint64_t)v45, v47, v48);
  v53 = objc_msgSend_UUID(v8, v49, v50, v51, v52);
  mutex = self->_mutex;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5003634;
  block[3] = &unk_1E60BBD20;
  void block[4] = self;
  id v55 = v53;
  id v82 = v55;
  id v83 = v6;
  id v56 = v6;
  dispatch_async(mutex, block);
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = sub_1B5003698;
  v79[3] = &unk_1E60BB9F0;
  v79[4] = self;
  id v57 = v55;
  id v80 = v57;
  objc_msgSend_setAcknowledge_(v8, v58, (uint64_t)v79, v59, v60);
  int64_t v65 = objc_msgSend_acknowledgementTimeout(v8, v61, v62, v63, v64);
  dispatch_time_t v66 = dispatch_time(0, v65);
  uint64_t v67 = self->_mutex;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = sub_1B50036A4;
  v77[3] = &unk_1E60BB9F0;
  v77[4] = self;
  id v78 = v57;
  id v68 = v57;
  dispatch_after(v66, v67, v77);
  v73 = objc_msgSend_targetQueue(self, v69, v70, v71, v72);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = sub_1B50036F0;
  v75[3] = &unk_1E60BB9F0;
  v75[4] = self;
  v76 = v8;
  uint64_t v74 = v8;
  dispatch_async(v73, v75);
}

- (void)setTargetQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setRemoteXPCProxyConnection:(id)a3
{
}

@end