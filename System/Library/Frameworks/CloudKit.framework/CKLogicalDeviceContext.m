@interface CKLogicalDeviceContext
+ (id)defaultContext;
+ (id)deviceContextForTestDeviceReferenceProtocol:(id)a3;
- (BOOL)useLiveServer;
- (CKLogicalDeviceScopedDaemonProxy)deviceScopedDaemonProxy;
- (CKLogicalDeviceScopedStateManager)deviceScopedStateManager;
- (CKTestDeviceProtocol)testDeviceProtocol;
- (CKTestDeviceReferenceProtocol)testDeviceReferenceProtocol;
- (CKThrottleManager)throttleManager;
- (CKXPCConnection)connection;
- (id)_initWithTestDeviceReferenceProtocol:(id)a3 useLiveServer:(BOOL)a4;
- (id)deviceScopedPushTopic:(id)a3;
- (int64_t)pushBehavior;
@end

@implementation CKLogicalDeviceContext

- (CKTestDeviceReferenceProtocol)testDeviceReferenceProtocol
{
  return self->_testDeviceReferenceProtocol;
}

+ (id)defaultContext
{
  if (qword_1EB279F00 != -1) {
    dispatch_once(&qword_1EB279F00, &unk_1ED7EF558);
  }
  v2 = (void *)qword_1EB279F08;

  return v2;
}

+ (id)deviceContextForTestDeviceReferenceProtocol:(id)a3
{
  id v8 = a3;
  if (v8 && __sTestOverridesAvailable)
  {
    id v9 = sub_18B072904();
    v13 = objc_msgSend_sharedManager(v9, v10, v11, v12);
    v17 = objc_msgSend_serverReferenceProtocol(v8, v14, v15, v16);
    v20 = objc_msgSend_existingServerProtocolForReferenceProtocol_(v13, v18, (uint64_t)v17, v19);

    if (!v20)
    {
      v43 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v21, v22, v23);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, (uint64_t)a1, @"CKLogicalDeviceContext.m", 50, @"Unexpectedly nil test server from reference %@", v8);
    }
    id v24 = a1;
    objc_sync_enter(v24);
    uint64_t v28 = objc_msgSend_deviceID(v8, v25, v26, v27);
    v29 = (void *)v28;
    v30 = @"NO_DEVICE_ID";
    if (v28) {
      v30 = (__CFString *)v28;
    }
    v31 = v30;

    v34 = objc_msgSend_testDeviceContextForDeviceID_(v20, v32, (uint64_t)v31, v33);
    if (!v34)
    {
      v35 = [CKLogicalDeviceContext alloc];
      uint64_t v39 = objc_msgSend_useLiveServer(v20, v36, v37, v38);
      v34 = objc_msgSend__initWithTestDeviceReferenceProtocol_useLiveServer_(v35, v40, (uint64_t)v8, v39);
      objc_msgSend_setTestDeviceContext_forDeviceID_(v20, v41, (uint64_t)v34, (uint64_t)v31);
    }

    objc_sync_exit(v24);
  }
  else
  {
    v34 = objc_msgSend_defaultContext(CKLogicalDeviceContext, v5, v6, v7);
  }

  return v34;
}

- (id)_initWithTestDeviceReferenceProtocol:(id)a3 useLiveServer:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKLogicalDeviceContext;
  id v8 = [(CKLogicalDeviceContext *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_testDeviceReferenceProtocol, a3);
    v9->_useLiveServer = a4;
  }

  return v9;
}

- (CKXPCConnection)connection
{
  return (CKXPCConnection *)objc_msgSend_sharedXPCConnection(CKXPCConnection, a2, v2, v3);
}

- (CKLogicalDeviceScopedDaemonProxy)deviceScopedDaemonProxy
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  deviceScopedDaemonProxy = v2->_deviceScopedDaemonProxy;
  if (!deviceScopedDaemonProxy)
  {
    v4 = [CKLogicalDeviceScopedDaemonProxy alloc];
    uint64_t v7 = objc_msgSend_initWithDeviceContext_(v4, v5, (uint64_t)v2, v6);
    id v8 = v2->_deviceScopedDaemonProxy;
    v2->_deviceScopedDaemonProxy = (CKLogicalDeviceScopedDaemonProxy *)v7;

    deviceScopedDaemonProxy = v2->_deviceScopedDaemonProxy;
  }
  id v9 = deviceScopedDaemonProxy;
  objc_sync_exit(v2);

  return v9;
}

- (CKLogicalDeviceScopedStateManager)deviceScopedStateManager
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  deviceScopedStateManager = v2->_deviceScopedStateManager;
  if (!deviceScopedStateManager)
  {
    v4 = [CKLogicalDeviceScopedStateManager alloc];
    uint64_t v7 = objc_msgSend_initWithDeviceContext_(v4, v5, (uint64_t)v2, v6);
    id v8 = v2->_deviceScopedStateManager;
    v2->_deviceScopedStateManager = (CKLogicalDeviceScopedStateManager *)v7;

    deviceScopedStateManager = v2->_deviceScopedStateManager;
  }
  id v9 = deviceScopedStateManager;
  objc_sync_exit(v2);

  return v9;
}

- (CKThrottleManager)throttleManager
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  throttleManager = v2->_throttleManager;
  if (!throttleManager)
  {
    v4 = [CKThrottleManager alloc];
    uint64_t inited = objc_msgSend_initInternal(v4, v5, v6, v7);
    id v9 = v2->_throttleManager;
    v2->_throttleManager = (CKThrottleManager *)inited;

    throttleManager = v2->_throttleManager;
  }
  v10 = throttleManager;
  objc_sync_exit(v2);

  return v10;
}

- (CKTestDeviceProtocol)testDeviceProtocol
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (__sTestOverridesAvailable)
  {
    uint64_t v2 = self;
    objc_sync_enter(v2);
    objc_msgSend_testDeviceReferenceProtocol(v2, v3, v4, v5);
    uint64_t v6 = (CKTestDeviceProtocol *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      testDeviceProtocol = v2->_testDeviceProtocol;
      if (!testDeviceProtocol)
      {
        id v8 = sub_18B072904();
        uint64_t v12 = objc_msgSend_sharedManager(v8, v9, v10, v11);
        uint64_t v16 = objc_msgSend_testDeviceReferenceProtocol(v2, v13, v14, v15);
        v20 = objc_msgSend_serverReferenceProtocol(v16, v17, v18, v19);
        uint64_t v23 = objc_msgSend_existingServerProtocolForReferenceProtocol_(v12, v21, (uint64_t)v20, v22);

        if (!v23)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v41 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v45 = objc_msgSend_testDeviceReferenceProtocol(v2, v42, v43, v44);
            *(_DWORD *)buf = 138412290;
            v49 = v45;
            _os_log_error_impl(&dword_18AF10000, v41, OS_LOG_TYPE_ERROR, "Unexpectedly nil test server from reference %@", buf, 0xCu);
          }
          uint64_t v6 = 0;
          goto LABEL_13;
        }
        uint64_t v27 = objc_msgSend_testDeviceReferenceProtocol(v2, v24, v25, v26);
        v31 = objc_msgSend_deviceID(v27, v28, v29, v30);
        id v47 = 0;
        uint64_t v33 = objc_msgSend_deviceProtocolWithDeviceID_error_(v23, v32, (uint64_t)v31, (uint64_t)&v47);
        id v34 = v47;
        v35 = v2->_testDeviceProtocol;
        v2->_testDeviceProtocol = (CKTestDeviceProtocol *)v33;

        if (!v2->_testDeviceProtocol)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v36 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v46 = objc_msgSend_testDeviceReferenceProtocol(v2, v37, v38, v39);
            *(_DWORD *)buf = 138412546;
            v49 = v46;
            __int16 v50 = 2112;
            id v51 = v34;
            _os_log_error_impl(&dword_18AF10000, v36, OS_LOG_TYPE_ERROR, "Unexpectedly nil test device from reference %@: %@", buf, 0x16u);
          }
        }

        testDeviceProtocol = v2->_testDeviceProtocol;
      }
      uint64_t v6 = testDeviceProtocol;
    }
LABEL_13:
    objc_sync_exit(v2);

    goto LABEL_15;
  }
  uint64_t v6 = 0;
LABEL_15:

  return v6;
}

- (int64_t)pushBehavior
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_testDeviceProtocol(v2, v3, v4, v5);
  uint64_t v10 = v6;
  if (v6) {
    int64_t v11 = objc_msgSend_logicalDeviceContextPushBehavior(v6, v7, v8, v9);
  }
  else {
    int64_t v11 = 1;
  }

  objc_sync_exit(v2);
  return v11;
}

- (id)deviceScopedPushTopic:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_pushBehavior(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_testDeviceReferenceProtocol(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_deviceID(v12, v13, v14, v15);
  v20 = objc_msgSend_testDeviceReferenceProtocol(self, v17, v18, v19);
  id v24 = objc_msgSend_serverReferenceProtocol(v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_dataDirectory(v24, v25, v26, v27);
  v32 = objc_msgSend_path(v28, v29, v30, v31);
  uint64_t v33 = CKPushTopicForPushBehavior(v8, v4, v16, v32);

  return v33;
}

- (BOOL)useLiveServer
{
  return self->_useLiveServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceReferenceProtocol, 0);
  objc_storeStrong((id *)&self->_testDeviceProtocol, 0);
  objc_storeStrong((id *)&self->_throttleManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStateManager, 0);

  objc_storeStrong((id *)&self->_deviceScopedDaemonProxy, 0);
}

@end