@interface CKDLogicalDeviceScopedClientProxy
- (BOOL)hasBeenThrottled;
- (BOOL)processIsAttached;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDLogicalDeviceScopedClientProxy)initWithClientConnection:(id)a3 deviceContext:(id)a4;
- (CKDXPCConnection)clientConnection;
- (CKXPCLogicalDeviceScopedClient)logicalDeviceScopedClientProxyCreator;
- (id)CKPropertiesDescription;
- (id)description;
- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4;
- (id)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6;
- (int)pid;
- (void)_getLogicalDeviceScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4;
- (void)addThrottle:(id)a3;
- (void)getLogicalDeviceScopedClientProxySynchronous:(BOOL)a3 errorHandler:(id)a4 clientProxyHandler:(id)a5;
- (void)resetThrottles;
- (void)setClientConnection:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setHasBeenThrottled:(BOOL)a3;
- (void)setLogicalDeviceScopedClientProxyCreator:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation CKDLogicalDeviceScopedClientProxy

- (id)CKPropertiesDescription
{
  v3 = objc_msgSend_deviceContext(self, a2, v2);
  v6 = objc_msgSend_testDeviceReference(v3, v4, v5);

  if (v6)
  {
    objc_msgSend_stringWithFormat_(NSString, v7, @"testDevice=%@", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = @"defaultDevice";
  }

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDLogicalDeviceScopedClientProxy *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKDLogicalDeviceScopedClientProxy)initWithClientConnection:(id)a3 deviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKDLogicalDeviceScopedClientProxy;
  v8 = [(CKDLogicalDeviceScopedClientProxy *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clientConnection, v6);
    objc_storeStrong((id *)&v9->_deviceContext, a4);
    v12 = objc_msgSend_xpcConnection(v6, v10, v11);
    v9->_pid = objc_msgSend_processIdentifier(v12, v13, v14);
  }
  return v9;
}

- (BOOL)processIsAttached
{
  uint64_t v3 = objc_msgSend_pid(self, a2, v2);
  return MEMORY[0x1F40D6408](v3);
}

- (void)getLogicalDeviceScopedClientProxySynchronous:(BOOL)a3 errorHandler:(id)a4 clientProxyHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4F01540;
  v13[3] = &unk_1E64F0AC0;
  BOOL v16 = v6;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  objc_msgSend__getLogicalDeviceScopedClientProxyCreatorSynchronous_completionHandler_(self, v12, v6, v13);
}

- (void)_getLogicalDeviceScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, void *, void))a4;
  id v9 = objc_msgSend_logicalDeviceScopedClientProxyCreator(self, v7, v8);

  if (v9)
  {
    v12 = objc_msgSend_logicalDeviceScopedClientProxyCreator(self, v10, v11);
    v6[2](v6, v12, 0);
  }
  else
  {
    v13 = objc_msgSend_clientConnection(self, v10, v11);
    BOOL v16 = objc_msgSend_deviceContext(self, v14, v15);
    v19 = objc_msgSend_testDeviceReference(v16, v17, v18);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1C4F0172C;
    v21[3] = &unk_1E64F5B38;
    v21[4] = self;
    v22 = v6;
    objc_msgSend_getLogicalDeviceScopedClientProxyCreatorForTestDeviceReference_synchronous_completionHandler_(v13, v20, (uint64_t)v19, v4, v21);
  }
}

- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1C4F01D70;
  v39 = sub_1C4F01D80;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_1C4F01D70;
  v33 = sub_1C4F01D80;
  id v34 = 0;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v8 = (void *)MEMORY[0x1C8789E70]();
  voucher_copy_without_importance();
  voucher_adopt();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1C4F01D88;
  v26[3] = &unk_1E64F06A8;
  v28 = &v35;
  v27 = v7;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4F01DE8;
  v21[3] = &unk_1E64F5B60;
  id v9 = v6;
  id v22 = v9;
  v24 = &v29;
  v25 = &v35;
  id v10 = v27;
  v23 = v10;
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v11, 1, v26, v21);

  dispatch_time_t v12 = dispatch_time(0, 150000000000);
  if (dispatch_group_wait(v10, v12))
  {
    uint64_t v14 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 1000, @"Daemon timed out waiting for adopter process to open file %@", v9);
    uint64_t v15 = (void *)v36[5];
    v36[5] = v14;

    if (a4)
    {
LABEL_3:
      id v16 = 0;
      *a4 = (id) v36[5];
      goto LABEL_10;
    }
  }
  else
  {
    v17 = (void *)v30[5];
    if (v17)
    {
      id v16 = v17;
      goto LABEL_10;
    }
    if (!v36[5])
    {
      uint64_t v18 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 1000, @"Adopter failed to open file %@", v9);
      v19 = (void *)v36[5];
      v36[5] = v18;
    }
    if (a4) {
      goto LABEL_3;
    }
  }
  id v16 = 0;
LABEL_10:

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v16;
}

- (id)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_1C4F01D70;
  v47 = sub_1C4F01D80;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = sub_1C4F01D70;
  v41 = sub_1C4F01D80;
  id v42 = 0;
  uint64_t v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  dispatch_time_t v12 = (void *)MEMORY[0x1C8789E70]();
  voucher_copy_without_importance();
  voucher_adopt();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4F02278;
  v34[3] = &unk_1E64F06A8;
  v36 = &v43;
  uint64_t v35 = v11;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = sub_1C4F022D8;
  v27 = &unk_1E64F5B88;
  id v13 = v10;
  unint64_t v32 = a4;
  unint64_t v33 = a5;
  id v28 = v13;
  v30 = &v37;
  uint64_t v31 = &v43;
  uint64_t v14 = v35;
  uint64_t v29 = v14;
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v15, 1, v34, &v24);

  dispatch_time_t v16 = dispatch_time(0, 150000000000);
  if (dispatch_group_wait(v14, v16))
  {
    uint64_t v18 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 1000, @"Daemon timed out waiting for adopter to read bytes for %@", v13, v24, v25, v26, v27);
    v19 = (void *)v44[5];
    v44[5] = v18;

    id v20 = 0;
    if (a6) {
      *a6 = (id) v44[5];
    }
  }
  else
  {
    if (!v38[5])
    {
      if (!v44[5])
      {
        uint64_t v21 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 1000, @"Adopter failed to read bytes for %@", v13, v24, v25, v26, v27);
        id v22 = (void *)v44[5];
        v44[5] = v21;
      }
      if (a6) {
        *a6 = (id) v44[5];
      }
    }
    id v20 = (id)v38[5];
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v20;
}

- (void)resetThrottles
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_INFO, "Resetting throttles in %@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v4, 1, &unk_1F2043F70, &unk_1F2043F90);
}

- (void)addThrottle:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4F025D0;
  v7[3] = &unk_1E64F5BD0;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_getLogicalDeviceScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v6, 1, &unk_1F2043FB0, v7);
}

- (BOOL)hasBeenThrottled
{
  return self->_hasBeenThrottled;
}

- (void)setHasBeenThrottled:(BOOL)a3
{
  self->_hasBeenThrottled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (CKDXPCConnection)clientConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  return (CKDXPCConnection *)WeakRetained;
}

- (void)setClientConnection:(id)a3
{
}

- (CKXPCLogicalDeviceScopedClient)logicalDeviceScopedClientProxyCreator
{
  return self->_logicalDeviceScopedClientProxyCreator;
}

- (void)setLogicalDeviceScopedClientProxyCreator:(id)a3
{
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxyCreator, 0);
  objc_destroyWeak((id *)&self->_clientConnection);
}

@end