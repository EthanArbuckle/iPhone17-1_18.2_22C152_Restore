@interface CKDOperationCallbackProxy
- (CKDOperationCallbackProxy)init;
- (CKDOperationCallbackProxy)initWithEndpoint:(id)a3;
- (CKOperationCallbackProxyEndpoint)endpoint;
- (NSXPCConnection)connection;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (int64_t)state;
- (void)activate;
- (void)addBarrierBlock:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation CKDOperationCallbackProxy

- (CKDOperationCallbackProxy)init
{
  return (CKDOperationCallbackProxy *)objc_msgSend_initWithEndpoint_(self, a2, 0);
}

- (CKDOperationCallbackProxy)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDOperationCallbackProxy;
  v6 = [(CKDOperationCallbackProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endpoint, a3);
  }

  return v7;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CKDOperationCallbackProxy;
  [(CKDOperationCallbackProxy *)&v4 dealloc];
}

- (Protocol)protocol
{
  objc_super v4 = objc_msgSend_endpoint(self, a2, v2);

  if (v4)
  {
    v7 = objc_msgSend_endpoint(self, v5, v6);
    v10 = objc_msgSend_interface(v7, v8, v9);
    v13 = objc_msgSend_protocol(v10, v11, v12);
  }
  else
  {
    v13 = &unk_1F20EA2B0;
  }
  return (Protocol *)v13;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_msgSend_protocol(self, a2, (uint64_t)a3);
  id v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);

  if (!MethodDescription.name
    || (objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], v7, (uint64_t)MethodDescription.types),
        (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)CKDOperationCallbackProxy;
    v8 = [(CKDOperationCallbackProxy *)&v10 methodSignatureForSelector:a3];
  }
  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6);
  uint64_t v9 = objc_msgSend_endpoint(self, v7, v8);

  if (v9)
  {
    uint64_t v12 = self;
    objc_sync_enter(v12);
    uint64_t v15 = objc_msgSend_state(v12, v13, v14);
    if (v15)
    {
      if (v15 == 1)
      {
        voucher_copy_without_importance();
        voucher_adopt();
        v28 = objc_msgSend_connection(v12, v26, v27);
        uint64_t v33 = MEMORY[0x1E4F143A8];
        uint64_t v34 = 3221225472;
        v35 = sub_1C4F35CD4;
        v36 = &unk_1E64F0680;
        id v29 = v4;
        id v37 = v29;
        v38 = v12;
        v31 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v28, v30, (uint64_t)&v33);
        objc_msgSend_forwardInvocation_(v31, v32, (uint64_t)v29, v33, v34, v35, v36);

        goto LABEL_10;
      }
      if (v15 != 2)
      {
LABEL_10:
        objc_sync_exit(v12);
        goto LABEL_11;
      }
      v17 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 1000, @"Not forwarding invocation, proxy has been invalidated");
      v20 = objc_msgSend_protocol(v12, v18, v19);
      objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v21, (uint64_t)v17, v20);
    }
    else
    {
      v17 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 1000, @"Not forwarding invocation, proxy has not been activated");
      v20 = objc_msgSend_protocol(v12, v23, v24);
      objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v25, (uint64_t)v17, v20);
    }

    goto LABEL_10;
  }
  objc_msgSend_protocol(self, v10, v11);
  uint64_t v12 = (CKDOperationCallbackProxy *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v22, 0, v12);
LABEL_11:
}

- (void)activate
{
  id v4 = objc_msgSend_endpoint(self, a2, v2);

  if (v4)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!objc_msgSend_state(obj, v5, v6))
    {
      id v7 = objc_alloc(MEMORY[0x1E4F29268]);
      objc_super v10 = objc_msgSend_endpoint(obj, v8, v9);
      v13 = objc_msgSend_endpoint(v10, v11, v12);
      uint64_t v15 = objc_msgSend_initWithListenerEndpoint_(v7, v14, (uint64_t)v13);
      objc_msgSend_setConnection_(obj, v16, (uint64_t)v15);

      uint64_t v19 = objc_msgSend_endpoint(obj, v17, v18);
      v22 = objc_msgSend_interface(v19, v20, v21);
      v25 = objc_msgSend_connection(obj, v23, v24);
      objc_msgSend_setRemoteObjectInterface_(v25, v26, (uint64_t)v22);

      id v29 = objc_msgSend_connection(obj, v27, v28);
      objc_msgSend_activate(v29, v30, v31);

      objc_msgSend_setState_(obj, v32, 1);
    }
    objc_sync_exit(obj);
  }
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (objc_msgSend_state(obj, v2, v3) == 1)
  {
    uint64_t v6 = objc_msgSend_connection(obj, v4, v5);
    objc_msgSend_invalidate(v6, v7, v8);

    objc_msgSend_setConnection_(obj, v9, 0);
    objc_msgSend_setState_(obj, v10, 2);
  }
  objc_sync_exit(obj);
}

- (void)addBarrierBlock:(id)a3
{
  uint64_t v12 = (void (**)(void))a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_state(v4, v5, v6);
  if (!v7)
  {
LABEL_4:
    v12[2]();
    goto LABEL_6;
  }
  if (v7 != 1)
  {
    if (v7 != 2) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  objc_super v10 = objc_msgSend_connection(v4, v8, v9);
  objc_msgSend_addBarrierBlock_(v10, v11, (uint64_t)v12);

LABEL_6:
  objc_sync_exit(v4);
}

- (CKOperationCallbackProxyEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end