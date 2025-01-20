@interface CWFXPCListener
- (BOOL)__allowXPCConnection:(id)a3 serviceType:(int64_t)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CWFXPCListener)init;
- (CWFXPCListener)initWithServiceType:(int64_t)a3;
- (CWFXPCListenerDelegate)delegate;
- (NSXPCListener)XPCListener;
- (id)XPCConnections;
- (id)localXPCClient;
- (id)registeredActivities;
- (id)registeredEventIDs;
- (int64_t)serviceType;
- (void)XPCConnection:(id)a3 canceledXPCRequestsWithUUID:(id)a4;
- (void)XPCConnection:(id)a3 receivedXPCRequest:(id)a4;
- (void)XPCConnection:(id)a3 updatedRegisteredEventIDs:(id)a4;
- (void)invalidate;
- (void)resume;
- (void)sendXPCEvent:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation CWFXPCListener

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F41460;
  block[3] = &unk_1E60BC128;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mutexQueue, block);
}

- (BOOL)__allowXPCConnection:(id)a3 serviceType:(int64_t)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v92 = 0;
  if (objc_msgSend_containsObject_(self->_bootArgs, v7, @"corewifi_api_enforcement_disable=1", v8, v9))
  {
    v14 = CWFGetOSLog();
    if (v14)
    {
      v15 = CWFGetOSLog();
    }
    else
    {
      v15 = MEMORY[0x1E4F14500];
      id v41 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v46 = objc_msgSend_processIdentifier(v6, v42, v43, v44, v45);
      v47 = sub_1B4F4B704(a4);
      int v93 = 67109378;
      *(_DWORD *)v94 = v46;
      *(_WORD *)&v94[4] = 2114;
      *(void *)&v94[6] = v47;
LABEL_27:
      char v49 = 1;
      _os_log_send_and_compose_impl();

      goto LABEL_44;
    }
LABEL_28:
    char v49 = 1;
    goto LABEL_44;
  }
  if (!objc_msgSend_processIdentifier(v6, v10, v11, v12, v13))
  {
    v48 = CWFGetOSLog();
    if (v48)
    {
      v15 = CWFGetOSLog();
    }
    else
    {
      v15 = MEMORY[0x1E4F14500];
      id v50 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v47 = sub_1B4F4B704(self->_serviceType);
      int v93 = 138543362;
      *(void *)v94 = v47;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  v15 = sub_1B4F476C8(a4, (char *)&v92, v16, v17, v18);
  if (!objc_msgSend_count(v15, v19, v20, v21, v22))
  {
    char v49 = 0;
    goto LABEL_44;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v15 = v15;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v23, (uint64_t)&v88, (uint64_t)v95, 16);
  if (v24)
  {
    uint64_t v28 = v24;
    uint64_t v29 = *(void *)v89;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v89 != v29) {
          objc_enumerationMutation(v15);
        }
        v31 = objc_msgSend_valueForEntitlement_(v6, v25, *(void *)(*((void *)&v88 + 1) + 8 * i), v26, v27);
        char v36 = objc_msgSend_BOOLValue(v31, v32, v33, v34, v35);

        if (v36)
        {
          char v49 = 1;
          v40 = v15;
          goto LABEL_43;
        }
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v25, (uint64_t)&v88, (uint64_t)v95, 16);
      if (v28) {
        continue;
      }
      break;
    }
  }

  int v37 = v92;
  uint64_t v38 = CWFGetOSLog();
  v39 = (void *)v38;
  if (v37)
  {
    if (v38)
    {
      v40 = CWFGetOSLog();
    }
    else
    {
      v40 = MEMORY[0x1E4F14500];
      id v51 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      int v60 = objc_msgSend_processIdentifier(v6, v52, v53, v54, v55);
      if (v6) {
        objc_msgSend_auditToken(v6, v56, v57, v58, v59);
      }
      v66 = sub_1B4F50F2C();
      v71 = objc_msgSend_lastPathComponent(v66, v67, v68, v69, v70);
      v72 = sub_1B4F4B704(a4);
      v76 = objc_msgSend_componentsJoinedByString_(v15, v73, @",", v74, v75);
      int v93 = 67109890;
      *(_DWORD *)v94 = v60;
      *(_WORD *)&v94[4] = 2114;
      *(void *)&v94[6] = v71;
      *(_WORD *)&v94[14] = 2114;
      *(void *)&v94[16] = v72;
      *(_WORD *)&v94[24] = 2114;
      *(void *)&v94[26] = v76;
      _os_log_send_and_compose_impl();

LABEL_41:
    }
  }
  else
  {
    if (v38)
    {
      v40 = CWFGetOSLog();
    }
    else
    {
      v40 = MEMORY[0x1E4F14500];
      id v61 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      if (v6) {
        objc_msgSend_auditToken(v6, v62, v63, v64, v65);
      }
      v77 = sub_1B4F50F2C();
      v71 = objc_msgSend_lastPathComponent(v77, v78, v79, v80, v81);
      v72 = sub_1B4F4B704(a4);
      v85 = objc_msgSend_componentsJoinedByString_(v15, v82, @",", v83, v84);
      int v93 = 138543874;
      *(void *)v94 = v71;
      *(_WORD *)&v94[8] = 2114;
      *(void *)&v94[10] = v72;
      *(_WORD *)&v94[18] = 2114;
      *(void *)&v94[20] = v85;
      _os_log_send_and_compose_impl();

      goto LABEL_41;
    }
  }
  char v49 = 0;
LABEL_43:

LABEL_44:
  if (v92) {
    BOOL v86 = v49;
  }
  else {
    BOOL v86 = 1;
  }

  return v86;
}

- (void)XPCConnection:(id)a3 receivedXPCRequest:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_delegate(self, v7, v8, v9, v10);
  uint64_t v16 = v11;
  if (v11)
  {
    objc_msgSend_XPCListener_XPCConnection_receivedXPCRequest_(v11, v12, (uint64_t)self, (uint64_t)v25, (uint64_t)v6);
  }
  else
  {
    uint64_t v17 = objc_msgSend_response(v6, v12, v13, v14, v15);

    if (v17)
    {
      objc_msgSend_response(v6, v18, v19, v20, v21);
      uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v23, *MEMORY[0x1E4F28798], 45, 0);
      ((void (**)(void, void *, void))v22)[2](v22, v24, 0);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend___allowXPCConnection_serviceType_(self, v8, (uint64_t)v7, self->_serviceType, v9))
  {
    uint64_t v10 = [CWFXPCConnection alloc];
    uint64_t v12 = objc_msgSend_initWithServiceType_XPCConnection_bootArgs_(v10, v11, self->_serviceType, (uint64_t)v7, (uint64_t)self->_bootArgs);
    uint64_t v16 = v12;
    BOOL v17 = v12 != 0;
    if (v12)
    {
      objc_msgSend_setDelegate_(v12, v13, (uint64_t)self, v14, v15);
      objc_msgSend_setExportedInterface_(v7, v18, (uint64_t)self->_requestXPCInterface, v19, v20);
      objc_msgSend_setRemoteObjectInterface_(v7, v21, (uint64_t)self->_eventXPCInterface, v22, v23);
      objc_msgSend_setExportedObject_(v7, v24, (uint64_t)v16, v25, v26);
      objc_initWeak(&location, v16);
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = sub_1B4F485F8;
      v92[3] = &unk_1E60BD340;
      objc_copyWeak(&v93, &location);
      v92[4] = self;
      objc_msgSend_setInvalidationHandler_(v16, v27, (uint64_t)v92, v28, v29);
      v30 = CWFGetOSLog();
      if (v30)
      {
        v31 = CWFGetOSLog();
      }
      else
      {
        v31 = MEMORY[0x1E4F14500];
        id v32 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        BOOL v87 = v17;
        id v88 = v6;
        long long v89 = objc_msgSend_processName(v16, v33, v34, v35, v36);
        int v41 = objc_msgSend_processIdentifier(v7, v37, v38, v39, v40);
        int v46 = objc_msgSend_effectiveUserIdentifier(v7, v42, v43, v44, v45);
        int v51 = objc_msgSend_effectiveGroupIdentifier(v7, v47, v48, v49, v50);
        v56 = objc_msgSend_UUID(v16, v52, v53, v54, v55);
        id v61 = objc_msgSend_UUIDString(v56, v57, v58, v59, v60);
        uint64_t v65 = objc_msgSend_substringToIndex_(v61, v62, 5, v63, v64);
        int v95 = 138544386;
        uint64_t v96 = v89;
        __int16 v97 = 1024;
        int v98 = v41;
        __int16 v99 = 1024;
        int v100 = v46;
        __int16 v101 = 1024;
        int v102 = v51;
        __int16 v103 = 2114;
        v104 = v65;
        _os_log_send_and_compose_impl();

        id v6 = v88;
        BOOL v17 = v87;
      }
      objc_msgSend_resume(v16, v66, v67, v68, v69);
      mutexQueue = self->_mutexQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B4F344C0;
      block[3] = &unk_1E60BB9F0;
      block[4] = self;
      id v71 = v16;
      id v91 = v71;
      dispatch_async(mutexQueue, block);
      v76 = objc_msgSend_delegate(self, v72, v73, v74, v75);
      objc_msgSend_XPCListener_addedXPCConnection_(v76, v77, (uint64_t)self, (uint64_t)v71, v78);

      objc_destroyWeak(&v93);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v80 = CWFGetOSLog();
      if (v80)
      {
        uint64_t v81 = CWFGetOSLog();
      }
      else
      {
        uint64_t v81 = MEMORY[0x1E4F14500];
        id v82 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        int v95 = 67109120;
        LODWORD(v96) = objc_msgSend_processIdentifier(v7, v83, v84, v85, v86);
        _os_log_send_and_compose_impl();
      }
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (CWFXPCListenerDelegate)delegate
{
  return (CWFXPCListenerDelegate *)objc_getProperty(self, a2, 56, 1);
}

- (id)registeredActivities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C9C;
  uint64_t v10 = sub_1B4F51BFC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4F4E820;
  v5[3] = &unk_1E60BC6B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CWFXPCListener)initWithServiceType:(int64_t)a3
{
  v45.receiver = self;
  v45.super_class = (Class)CWFXPCListener;
  v4 = [(CWFXPCListener *)&v45 init];
  v5 = v4;
  uint64_t v6 = 0;
  if ((unint64_t)(a3 - 8) < 0xFFFFFFFFFFFFFFF9) {
    goto LABEL_9;
  }
  if (!v4) {
    goto LABEL_9;
  }
  v4->_serviceType = a3;
  uint64_t v6 = sub_1B4F4B704(a3);
  if (!v6) {
    goto LABEL_9;
  }
  objc_msgSend_stringWithFormat_(NSString, v7, @"com.apple.corewifi.XPC-listener-mutex.%@", v8, v9, v6);
  id v10 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13, v14);
  uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
  mutexQueue = v5->_mutexQueue;
  v5->_mutexQueue = (OS_dispatch_queue *)v17;

  if (!v5->_mutexQueue) {
    goto LABEL_9;
  }
  uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  mutableXPCConnections = v5->_mutableXPCConnections;
  v5->_mutableXPCConnections = v19;

  if (!v5->_mutableXPCConnections) {
    goto LABEL_9;
  }
  uint64_t v21 = CWFBootArgs();
  bootArgs = v5->_bootArgs;
  v5->_bootArgs = (NSArray *)v21;

  id v23 = objc_alloc(MEMORY[0x1E4F29290]);
  uint64_t v27 = objc_msgSend_initWithMachServiceName_(v23, v24, (uint64_t)v6, v25, v26);
  XPCListener = v5->_XPCListener;
  v5->_XPCListener = (NSXPCListener *)v27;

  id v32 = v5->_XPCListener;
  if (!v32) {
    goto LABEL_9;
  }
  objc_msgSend_setDelegate_(v32, v29, (uint64_t)v5, v30, v31);
  uint64_t v36 = sub_1B4F4B75C(a3, (const char *)1, v33, v34, v35);
  requestXPCInterface = v5->_requestXPCInterface;
  v5->_requestXPCInterface = (NSXPCInterface *)v36;

  if (!v5->_requestXPCInterface
    || (sub_1B4F4B8E0(a3, v38, v39, v40, v41),
        uint64_t v42 = objc_claimAutoreleasedReturnValue(),
        eventXPCInterface = v5->_eventXPCInterface,
        v5->_eventXPCInterface = (NSXPCInterface *)v42,
        eventXPCInterface,
        !v5->_eventXPCInterface))
  {
LABEL_9:

    v5 = 0;
  }

  return v5;
}

- (CWFXPCListener)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFXPCListener init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)resume
{
  objc_msgSend_resume(self->_XPCListener, a2, v2, v3, v4);
}

- (void)suspend
{
  objc_msgSend_suspend(self->_XPCListener, a2, v2, v3, v4);
}

- (void)invalidate
{
  objc_msgSend_invalidate(self->_XPCListener, a2, v2, v3, v4);
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5000734;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)XPCConnections
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C9C;
  id v10 = sub_1B4F51BFC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B5000954;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)registeredEventIDs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C9C;
  id v10 = sub_1B4F51BFC;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B5000AA0;
  v5[3] = &unk_1E60BC6B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)localXPCClient
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = [CWFXPCConnection alloc];
  v5 = objc_msgSend_initWithServiceType_XPCConnection_bootArgs_(v3, v4, self->_serviceType, 0, (uint64_t)self->_bootArgs);
  if (v5)
  {
    uint64_t v6 = [CWFXPCClient alloc];
    int64_t serviceType = self->_serviceType;
    uint64_t v12 = objc_msgSend_localXPCProxyConnection(v5, v8, v9, v10, v11);
    uint64_t v15 = objc_msgSend_initWithServiceType_remoteXPCProxyConnection_(v6, v13, serviceType, (uint64_t)v12, v14);

    if (v15)
    {
      uint64_t v20 = objc_msgSend_localXPCProxyConnection(v15, v16, v17, v18, v19);
      objc_msgSend_setRemoteXPCProxyConnection_(v5, v21, (uint64_t)v20, v22, v23);

      objc_msgSend_setDelegate_(v5, v24, (uint64_t)self, v25, v26);
      objc_initWeak(&location, v5);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = sub_1B5000F4C;
      v68[3] = &unk_1E60BD340;
      objc_copyWeak(&v69, &location);
      v68[4] = self;
      objc_msgSend_setInvalidationHandler_(v5, v27, (uint64_t)v68, v28, v29);
      uint64_t v30 = CWFGetOSLog();
      if (v30)
      {
        uint64_t v31 = CWFGetOSLog();
      }
      else
      {
        uint64_t v31 = MEMORY[0x1E4F14500];
        id v32 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v37 = objc_msgSend_processName(v5, v33, v34, v35, v36);
        uint64_t v42 = objc_msgSend_UUID(v5, v38, v39, v40, v41);
        v47 = objc_msgSend_UUIDString(v42, v43, v44, v45, v46);
        int v51 = objc_msgSend_substringToIndex_(v47, v48, 5, v49, v50);
        int v71 = 138543618;
        v72 = v37;
        __int16 v73 = 2114;
        uint64_t v74 = v51;
        _os_log_send_and_compose_impl();
      }
      objc_msgSend_resume(v5, v52, v53, v54, v55);
      mutexQueue = self->_mutexQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B5001060;
      block[3] = &unk_1E60BB9F0;
      block[4] = self;
      id v57 = v5;
      id v67 = v57;
      dispatch_async(mutexQueue, block);

      objc_destroyWeak(&v69);
      objc_destroyWeak(&location);
      v62 = objc_msgSend_delegate(self, v58, v59, v60, v61);
      objc_msgSend_XPCListener_addedXPCConnection_(v62, v63, (uint64_t)self, (uint64_t)v57, v64);
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)XPCConnection:(id)a3 canceledXPCRequestsWithUUID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_delegate(self, v7, v8, v9, v10);
  uint64_t v13 = v11;
  if (v11) {
    objc_msgSend_XPCListener_XPCConnection_canceledXPCRequestsWithUUID_(v11, v12, (uint64_t)self, (uint64_t)v14, (uint64_t)v6);
  }
}

- (void)XPCConnection:(id)a3 updatedRegisteredEventIDs:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_delegate(self, v7, v8, v9, v10);
  uint64_t v13 = v11;
  if (v11) {
    objc_msgSend_XPCListener_XPCConnection_updatedRegisteredEventIDs_(v11, v12, (uint64_t)self, (uint64_t)v14, (uint64_t)v6);
  }
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSXPCListener)XPCListener
{
  return self->_XPCListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_bootArgs, 0);
  objc_storeStrong((id *)&self->_eventXPCInterface, 0);
  objc_storeStrong((id *)&self->_requestXPCInterface, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
  objc_storeStrong((id *)&self->_mutableXPCConnections, 0);
  objc_storeStrong((id *)&self->_XPCListener, 0);
}

@end