@interface CKXPCConnection
+ (CKXPCConnection)sharedXPCConnection;
+ (NSXPCInterface)CKXPCClientToDaemonMuxerInterface;
+ (NSXPCInterface)CKXPCDaemonToClientMuxerInterface;
- (CKProcessScopedDaemonProxy)processScopedDaemonProxy;
- (id)initInternal;
- (int)processIdentifier;
- (void)activate;
- (void)dealloc;
- (void)getContainerScopedDaemonProxyCreatorForContainerSetupInfo:(id)a3 exportedProxy:(id)a4 synchronous:(BOOL)a5 completionHandler:(id)a6;
- (void)getDaemonTestServerManagerProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4;
- (void)getLogicalDeviceScopedClientProxyCreatorForTestDeviceReferenceProtocol:(id)a3 completionHandler:(id)a4;
- (void)getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5;
- (void)getProcessScopedClientProxyCreatorWithCompletionHandler:(id)a3;
- (void)getProcessScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4;
- (void)invalidate:(id)a3;
@end

@implementation CKXPCConnection

+ (CKXPCConnection)sharedXPCConnection
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_18B1A9790;
  v4[3] = &unk_1E5465580;
  v4[4] = a2;
  v4[5] = a1;
  if (qword_1EB279F60 != -1) {
    dispatch_once(&qword_1EB279F60, v4);
  }
  v2 = (void *)qword_1EB279F68;

  return (CKXPCConnection *)v2;
}

- (id)initInternal
{
  v9.receiver = self;
  v9.super_class = (Class)CKXPCConnection;
  v2 = [(CKXPCConnection *)&v9 init];
  if (v2)
  {
    v3 = [CKProcessScopedDaemonProxy alloc];
    uint64_t v6 = objc_msgSend_initWithConnection_(v3, v4, (uint64_t)v2, v5);
    processScopedDaemonProxy = v2->_processScopedDaemonProxy;
    v2->_processScopedDaemonProxy = (CKProcessScopedDaemonProxy *)v6;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (v2) {
    invalidationCompletionHandlers = v2->_invalidationCompletionHandlers;
  }
  else {
    invalidationCompletionHandlers = 0;
  }
  v4 = invalidationCompletionHandlers;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v9, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v2);
  v10.receiver = v2;
  v10.super_class = (Class)CKXPCConnection;
  [(CKXPCConnection *)&v10 dealloc];
}

- (int)processIdentifier
{
  v2 = sub_18B1A9A20(self, 0);
  int v6 = objc_msgSend_processIdentifier(v2, v3, v4, v5);

  return v6;
}

- (void)getProcessScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B1A9BC0;
  aBlock[3] = &unk_1E54610D8;
  id v7 = v6;
  id v16 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  objc_super v9 = sub_18B1A9BD8(self, v4, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B1A9D3C;
  v13[3] = &unk_1E5461BF8;
  id v14 = v7;
  id v10 = v7;
  objc_msgSend_getProcessScopedDaemonProxyCreatorWithCompletionHandler_(v9, v11, (uint64_t)v13, v12);
}

- (void)getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B1A9E90;
  aBlock[3] = &unk_1E54610D8;
  id v9 = v8;
  id v18 = v9;
  id v10 = a3;
  long long v11 = _Block_copy(aBlock);
  uint64_t v12 = sub_18B1A9BD8(self, v5, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B1A9EA8;
  v15[3] = &unk_1E5466218;
  id v16 = v9;
  id v13 = v9;
  objc_msgSend_getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol_completionHandler_(v12, v14, (uint64_t)v10, (uint64_t)v15);
}

- (void)getContainerScopedDaemonProxyCreatorForContainerSetupInfo:(id)a3 exportedProxy:(id)a4 synchronous:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B1A9FB4;
  aBlock[3] = &unk_1E54610D8;
  id v18 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  id v14 = _Block_copy(aBlock);
  v15 = sub_18B1A9BD8(self, v6, v14);
  objc_msgSend_getContainerScopedDaemonProxyCreatorForSetupInfo_containerScopedClientProxy_completionHandler_(v15, v16, (uint64_t)v13, (uint64_t)v12, v11);
}

- (void)getDaemonTestServerManagerProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if (!__sTestOverridesAvailable)
  {
    v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, @"CKXPCConnection.m", 95, @"Test hooks aren't supported in this process");
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B1AA14C;
  aBlock[3] = &unk_1E54610D8;
  id v11 = v10;
  id v22 = v11;
  id v12 = _Block_copy(aBlock);
  id v13 = sub_18B1A9BD8(self, v4, v12);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B1AA164;
  v19[3] = &unk_1E5466240;
  id v20 = v11;
  id v14 = v11;
  objc_msgSend_getDaemonTestServerManagerProxyCreatorWithCompletionHandler_(v13, v15, (uint64_t)v19, v16);
}

- (void)getLogicalDeviceScopedClientProxyCreatorForTestDeviceReferenceProtocol:(id)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, id))a4;
  uint64_t v8 = objc_msgSend_deviceContextForTestDeviceReferenceProtocol_(CKLogicalDeviceContext, v6, (uint64_t)a3, v7);
  objc_msgSend_deviceScopedStateManager(v8, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v12);
}

- (void)getProcessScopedClientProxyCreatorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_sharedManager(CKProcessScopedStateManager, v5, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v4, v8);
}

- (void)activate
{
  id v2 = sub_18B1AA280(self);
}

- (void)invalidate:(id)a3
{
  id v4 = a3;
  char v19 = 0;
  id v8 = sub_18B1A9A20(self, &v19);
  if (v19)
  {
    if (v4)
    {
      uint64_t v9 = self;
      objc_sync_enter(v9);
      if (!v9 || (invalidationCompletionHandlers = v9->_invalidationCompletionHandlers) == 0)
      {
        id v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12);
        sub_18B1AAB2C((uint64_t)v9, v14);

        if (v9) {
          invalidationCompletionHandlers = v9->_invalidationCompletionHandlers;
        }
        else {
          invalidationCompletionHandlers = 0;
        }
      }
      v15 = invalidationCompletionHandlers;
      uint64_t v16 = _Block_copy(v4);
      objc_msgSend_addObject_(v15, v17, (uint64_t)v16, v18);

      objc_sync_exit(v9);
    }
    objc_msgSend_invalidate(v8, v5, v6, v7);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

+ (NSXPCInterface)CKXPCClientToDaemonMuxerInterface
{
  if (qword_1EB279F78 != -1) {
    dispatch_once(&qword_1EB279F78, &unk_1ED7F00F8);
  }
  id v2 = (void *)qword_1EB279F70;

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)CKXPCDaemonToClientMuxerInterface
{
  if (qword_1EB279F88 != -1) {
    dispatch_once(&qword_1EB279F88, &unk_1ED7F08B8);
  }
  id v2 = (void *)qword_1EB279F80;

  return (NSXPCInterface *)v2;
}

- (CKProcessScopedDaemonProxy)processScopedDaemonProxy
{
  return self->_processScopedDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_processScopedDaemonProxy, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end