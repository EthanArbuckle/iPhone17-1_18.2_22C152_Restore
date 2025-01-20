@interface CKWeakObjectCallbackProxy
- (BOOL)hadObject;
- (CKWeakObjectCallbackProxy)initWithWeakObject:(id)a3 callbackProtocol:(id)a4;
- (Protocol)callbackProtocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)weakObject;
- (void)forwardInvocation:(id)a3;
- (void)setWeakObject:(id)a3;
@end

@implementation CKWeakObjectCallbackProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_msgSend_callbackProtocol(self, a2, (uint64_t)a3, v3);
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);

  if (MethodDescription.name)
  {
    v9 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], v7, (uint64_t)MethodDescription.types, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6, v7);
  objc_msgSend_callbackProtocol(self, v8, v9, v10);
  v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v15 = (const char *)objc_msgSend_selector(v4, v12, v13, v14);
  SEL name = protocol_getMethodDescription(v11, v15, 1, 1).name;

  if (name)
  {
    v23 = objc_msgSend_weakObject(self, v17, v18, v19);
    if (v23)
    {
      objc_msgSend_setTarget_(v4, v20, (uint64_t)v23, v22);
      objc_msgSend_invoke(v4, v24, v25, v26);
    }
    else
    {
      int v27 = objc_msgSend_hadObject(self, v20, v21, v22);
      v31 = (const char *)objc_msgSend_selector(v4, v28, v29, v30);
      uint64_t v32 = NSStringFromSelector(v31);
      v34 = (void *)v32;
      if (v27) {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1000, @"Weak object went nil before proxy could forward %@ to it.", v32);
      }
      else {
      v35 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1000, @"Proxy never had a real target for %@", v32);
      }

      v39 = objc_msgSend_callbackProtocol(self, v36, v37, v38);
      objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v40, (uint64_t)v35, (uint64_t)v39);
    }
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)CKWeakObjectCallbackProxy;
    [(CKWeakObjectCallbackProxy *)&v41 forwardInvocation:v4];
  }
}

- (Protocol)callbackProtocol
{
  return self->_callbackProtocol;
}

- (id)weakObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObject);

  return WeakRetained;
}

- (CKWeakObjectCallbackProxy)initWithWeakObject:(id)a3 callbackProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_init(self, v8, v9, v10);
  v12 = (CKWeakObjectCallbackProxy *)v11;
  if (v11)
  {
    *(unsigned char *)(v11 + 8) = v6 != 0;
    objc_storeWeak((id *)(v11 + 16), v6);
    objc_storeStrong((id *)&v12->_callbackProtocol, a4);
  }

  return v12;
}

- (void)setWeakObject:(id)a3
{
}

- (BOOL)hadObject
{
  return self->_hadObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackProtocol, 0);

  objc_destroyWeak(&self->_weakObject);
}

@end