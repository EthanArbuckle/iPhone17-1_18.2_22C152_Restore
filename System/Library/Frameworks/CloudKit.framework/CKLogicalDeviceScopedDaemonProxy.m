@interface CKLogicalDeviceScopedDaemonProxy
+ (NSXPCInterface)CKXPCClientToDaemonLogicalDeviceScopedInterface;
+ (NSXPCInterface)CKXPCDaemonToClientLogicalDeviceScopedInterface;
- (BOOL)hasValidLogicalDeviceScopedDaemonProxyCreator;
- (CKLogicalDeviceContext)deviceContext;
- (CKLogicalDeviceScopedDaemonProxy)initWithDeviceContext:(id)a3;
- (CKXPCConnection)connection;
- (CKXPCLogicalDeviceScopedDaemon)logicalDeviceScopedDaemonProxyCreator;
- (NSObject)connectionInterruptedObserver;
- (void)_getLogicalDeviceScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4;
- (void)_getLogicalDeviceScopedDaemonProxySynchronous:(BOOL)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5;
- (void)addClouddThrottle:(id)a3;
- (void)allClouddThrottlesWithCompletionHandler:(id)a3;
- (void)clearAllClouddThrottles;
- (void)dealloc;
- (void)postClouddWalrusUpdateNotification;
- (void)setConnectionInterruptedObserver:(id)a3;
- (void)setHasValidLogicalDeviceScopedDaemonProxyCreator:(BOOL)a3;
- (void)setLogicalDeviceScopedDaemonProxyCreator:(id)a3;
@end

@implementation CKLogicalDeviceScopedDaemonProxy

- (CKLogicalDeviceScopedDaemonProxy)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKLogicalDeviceScopedDaemonProxy;
  v5 = [(CKLogicalDeviceScopedDaemonProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_deviceContext, v4);
  }

  return v6;
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  v9 = objc_msgSend_connectionInterruptedObserver(self, v6, v7, v8);
  objc_msgSend_removeObserver_(v5, v10, (uint64_t)v9, v11);

  v12.receiver = self;
  v12.super_class = (Class)CKLogicalDeviceScopedDaemonProxy;
  [(CKLogicalDeviceScopedDaemonProxy *)&v12 dealloc];
}

- (CKXPCConnection)connection
{
  id v4 = objc_msgSend_deviceContext(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_connection(v4, v5, v6, v7);

  return (CKXPCConnection *)v8;
}

- (void)clearAllClouddThrottles
{
}

- (void)allClouddThrottlesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_18AF14108;
  v10[4] = sub_18AF139A0;
  id v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B146C20;
  v7[3] = &unk_1E54651C0;
  v9 = v10;
  id v5 = v4;
  id v8 = v5;
  objc_msgSend__getLogicalDeviceScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v6, 1, (uint64_t)&unk_1ED7F0798, v7);

  _Block_object_dispose(v10, 8);
}

- (void)addClouddThrottle:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B146D7C;
  v7[3] = &unk_1E54651E8;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend__getLogicalDeviceScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v6, 1, (uint64_t)&unk_1ED7EF758, v7);
}

- (void)postClouddWalrusUpdateNotification
{
}

- (void)_getLogicalDeviceScopedDaemonProxySynchronous:(BOOL)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B146E78;
  v13[3] = &unk_1E5461038;
  BOOL v16 = v6;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  objc_msgSend__getLogicalDeviceScopedDaemonProxyCreatorSynchronous_completionHandler_(self, v12, v6, (uint64_t)v13);
}

- (void)_getLogicalDeviceScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v11 = objc_msgSend_connectionInterruptedObserver(v7, v8, v9, v10);

  if (!v11)
  {
    objc_initWeak(&location, v7);
    id v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
    v19 = objc_msgSend_connection(v7, v16, v17, v18);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_18B1471C4;
    v47[3] = &unk_1E5461060;
    objc_copyWeak(&v48, &location);
    v21 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v15, v20, @"CKXPCConnectionInterrupted", (uint64_t)v19, 0, v47);
    objc_msgSend_setConnectionInterruptedObserver_(v7, v22, (uint64_t)v21, v23);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v7);

  v24 = v7;
  objc_sync_enter(v24);
  if (objc_msgSend_hasValidLogicalDeviceScopedDaemonProxyCreator(v24, v25, v26, v27))
  {
    v31 = objc_msgSend_logicalDeviceScopedDaemonProxyCreator(v24, v28, v29, v30);
  }
  else
  {
    v31 = 0;
  }
  objc_sync_exit(v24);

  if (v31)
  {
    v6[2](v6, v31, 0);
  }
  else
  {
    v35 = objc_msgSend_connection(v24, v32, v33, v34);
    v39 = objc_msgSend_deviceContext(v24, v36, v37, v38);
    v43 = objc_msgSend_testDeviceReferenceProtocol(v39, v40, v41, v42);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_18B1472B4;
    v45[3] = &unk_1E5465210;
    v45[4] = v24;
    v46 = v6;
    objc_msgSend_getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol_synchronous_completionHandler_(v35, v44, (uint64_t)v43, v4, v45);
  }
}

+ (NSXPCInterface)CKXPCClientToDaemonLogicalDeviceScopedInterface
{
  if (qword_1EB279EB8 != -1) {
    dispatch_once(&qword_1EB279EB8, &unk_1ED7EFA78);
  }
  uint64_t v2 = (void *)qword_1EB279EB0;

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)CKXPCDaemonToClientLogicalDeviceScopedInterface
{
  if (qword_1EB279EC8 != -1) {
    dispatch_once(&qword_1EB279EC8, &unk_1ED7EFF18);
  }
  uint64_t v2 = (void *)qword_1EB279EC0;

  return (NSXPCInterface *)v2;
}

- (CKXPCLogicalDeviceScopedDaemon)logicalDeviceScopedDaemonProxyCreator
{
  return self->_logicalDeviceScopedDaemonProxyCreator;
}

- (void)setLogicalDeviceScopedDaemonProxyCreator:(id)a3
{
}

- (BOOL)hasValidLogicalDeviceScopedDaemonProxyCreator
{
  return self->_hasValidLogicalDeviceScopedDaemonProxyCreator;
}

- (void)setHasValidLogicalDeviceScopedDaemonProxyCreator:(BOOL)a3
{
  self->_hasValidLogicalDeviceScopedDaemonProxyCreator = a3;
}

- (NSObject)connectionInterruptedObserver
{
  return self->_connectionInterruptedObserver;
}

- (void)setConnectionInterruptedObserver:(id)a3
{
}

- (CKLogicalDeviceContext)deviceContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceContext);

  return (CKLogicalDeviceContext *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, 0);

  objc_storeStrong((id *)&self->_logicalDeviceScopedDaemonProxyCreator, 0);
}

@end