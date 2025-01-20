@interface CKOperationCallbackProxy
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CKOperationCallbackProxy)initWithOperation:(id)a3 callbackProtocol:(id)a4;
- (CKOperationCallbackProxyEndpoint)endpoint;
- (Class)cls;
- (NSHashTable)connections;
- (NSXPCListener)listener;
- (void)activate;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)invalidate;
@end

@implementation CKOperationCallbackProxy

- (CKOperationCallbackProxy)initWithOperation:(id)a3 callbackProtocol:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKOperationCallbackProxy;
  v7 = [(CKWeakObjectCallbackProxy *)&v16 initWithWeakObject:v6 callbackProtocol:a4];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    Class cls = v7->_cls;
    v7->_Class cls = (Class)v8;

    uint64_t v13 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v10, v11, v12);
    connections = v7->_connections;
    v7->_connections = (NSHashTable *)v13;
  }
  return v7;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKOperationCallbackProxy;
  [(CKOperationCallbackProxy *)&v5 dealloc];
}

- (NSXPCListener)listener
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_listener;
  objc_sync_exit(v2);

  return v3;
}

- (CKOperationCallbackProxyEndpoint)endpoint
{
  objc_super v5 = objc_msgSend_listener(self, a2, v2, v3);
  if (v5)
  {
    id v6 = [CKOperationCallbackProxyEndpoint alloc];
    uint64_t v10 = objc_msgSend_cls(self, v7, v8, v9);
    v14 = objc_msgSend_callbackProtocol(self, v11, v12, v13);
    v18 = objc_msgSend_endpoint(v5, v15, v16, v17);
    v20 = objc_msgSend_initWithClass_protocol_endpoint_(v6, v19, v10, (uint64_t)v14, v18);
  }
  else
  {
    v20 = 0;
  }

  return (CKOperationCallbackProxyEndpoint *)v20;
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_listener)
  {
    uint64_t v6 = objc_msgSend_anonymousListener(MEMORY[0x1E4F29290], v3, v4, v5);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    objc_msgSend_setDelegate_(v2->_listener, v8, (uint64_t)v2, v9);
  }
  objc_sync_exit(v2);

  objc_msgSend_listener(v2, v10, v11, v12);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activate(v16, v13, v14, v15);
}

- (void)invalidate
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_listener(self, a2, v2, v3);
  objc_msgSend_invalidate(v5, v6, v7, v8);

  uint64_t v12 = objc_msgSend_connections(self, v9, v10, v11);
  objc_sync_enter(v12);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = objc_msgSend_connections(self, v13, v14, v15, 0);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v21)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_invalidate(*(void **)(*((void *)&v24 + 1) + 8 * v23++), v18, v19, v20);
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v21);
  }

  objc_sync_exit(v12);
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6, v7);
  objc_msgSend_callbackProtocol(self, v8, v9, v10);
  uint64_t v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (const char *)objc_msgSend_selector(v4, v12, v13, v14);
  SEL name = protocol_getMethodDescription(v11, v15, 1, 1).name;

  if (name)
  {
    uint64_t v20 = objc_msgSend_weakObject(self, v17, v18, v19);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18B0448F8;
    aBlock[3] = &unk_1E5461A48;
    id v21 = v20;
    id v83 = v21;
    id v22 = v4;
    id v84 = v22;
    v85 = self;
    uint64_t v23 = _Block_copy(aBlock);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = sub_18B044B24;
    v78[3] = &unk_1E5461A70;
    long long v24 = (id *)v21;
    v79 = v24;
    id v25 = v23;
    id v81 = v25;
    id v26 = v22;
    id v80 = v26;
    long long v27 = _Block_copy(v78);
    v31 = v27;
    if (v24)
    {
      id v75 = v25;
      v76 = v27;
      v32 = objc_msgSend_methodSignature(v26, v28, v29, v30);
      if ((unint64_t)objc_msgSend_numberOfArguments(v32, v33, v34, v35) >= 3)
      {
        unint64_t v39 = 2;
        do
        {
          id v40 = v32;
          if (*(unsigned char *)objc_msgSend_getArgumentTypeAtIndex_(v40, v41, v39, v42) == 64)
          {
            id v77 = 0;
            objc_msgSend_getArgument_atIndex_(v26, v43, (uint64_t)&v77, v39);
            id v46 = v77;
            v50 = objc_msgSend_configuration(v24, v47, v48, v49);
            v54 = objc_msgSend_container(v50, v51, v52, v53);
            v58 = objc_msgSend_containerID(v54, v55, v56, v57);
            objc_msgSend_CKAssignToContainerWithID_(v46, v59, (uint64_t)v58, v60);
          }
          ++v39;
        }
        while (v39 < objc_msgSend_numberOfArguments(v40, v43, v44, v45));
      }
      if (__sTestOverridesAvailable)
      {
        v61 = objc_msgSend_unitTestOverrides(v24, v36, v37, v38);
        v64 = objc_msgSend_objectForKeyedSubscript_(v61, v62, @"CancelOnProgressCallback", v63);
        int v68 = objc_msgSend_BOOLValue(v64, v65, v66, v67);

        if (v68) {
          objc_msgSend_cancel(v24, v36, v37, v38);
        }
      }
      if (__ROR8__(objc_msgSend_qualityOfService(v24, v36, v37, v38) - 9, 3) >= 4uLL)
      {
        id v69 = v24[60];
        uint64_t v70 = dispatch_block_create_with_voucher();
      }
      else
      {
        id v69 = v24[60];
        uint64_t v70 = dispatch_block_create_with_voucher_and_qos_class();
      }
      v31 = (void *)v70;
      id v25 = v75;

      v74 = objc_msgSend_callbackQueue(v24, v71, v72, v73);
      ck_call_or_dispatch_async_if_not_key(v74, kCKOperationCallbackQueueName, v31);
    }
    else
    {
      v32 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v28, @"CKInternalErrorDomain", 1000, @"Weak operation went nil before proxy could forward invocation to it");
      (*((void (**)(id, void *))v25 + 2))(v25, v32);
    }
  }
  else
  {
    v86.receiver = self;
    v86.super_class = (Class)CKOperationCallbackProxy;
    [(CKWeakObjectCallbackProxy *)&v86 forwardInvocation:v4];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_endpoint(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_interface(v11, v12, v13, v14);
  objc_msgSend_setExportedInterface_(v7, v16, (uint64_t)v15, v17);

  objc_msgSend_setExportedObject_(v7, v18, (uint64_t)self, v19);
  uint64_t v23 = objc_msgSend_weakObject(self, v20, v21, v22);
  long long v27 = v23;
  if (v23)
  {
    v28 = objc_msgSend_callbackQueue(v23, v24, v25, v26);
    objc_msgSend__setQueue_(v7, v29, (uint64_t)v28, v30);
  }
  v31 = objc_msgSend_connections(self, v24, v25, v26);
  objc_sync_enter(v31);
  uint64_t v35 = objc_msgSend_connections(self, v32, v33, v34);
  objc_msgSend_addObject_(v35, v36, (uint64_t)v7, v37);

  objc_sync_exit(v31);
  objc_msgSend_resume(v7, v38, v39, v40);

  return 1;
}

- (Class)cls
{
  return self->_cls;
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_cls, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end