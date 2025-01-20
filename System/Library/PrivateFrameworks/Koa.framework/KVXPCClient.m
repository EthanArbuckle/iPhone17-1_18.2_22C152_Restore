@interface KVXPCClient
+ (void)initialize;
- (KVXPCClient)init;
- (KVXPCClient)initWithServiceProtocol:(id)a3 machServiceName:(id)a4 clientId:(id)a5 interruptionCode:(unsigned __int16)a6 invalidationCode:(unsigned __int16)a7;
- (NSString)clientId;
- (NSXPCConnection)connection;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_failureHandlerWithResponse:(unsigned __int16)a3;
- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4;
- (unsigned)failureCode;
- (unsigned)interruptionCode;
- (void)dealloc;
- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4;
- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)setConnection:(id)a3;
- (void)setFailureCode:(unsigned __int16)a3;
@end

@implementation KVXPCClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (unsigned)interruptionCode
{
  return self->_interruptionCode;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setFailureCode:(unsigned __int16)a3
{
  self->_failureCode = a3;
}

- (unsigned)failureCode
{
  return self->_failureCode;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v11 = objc_msgSend__errorHandlerWithCompletion_(self, v7, (uint64_t)v6, v8, v9, v10);
  v17 = objc_msgSend_connection(self, v12, v13, v14, v15, v16);
  v22 = v17;
  if (v4) {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v18, (uint64_t)v11, v19, v20, v21);
  }
  else {
  v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v17, v18, (uint64_t)v11, v19, v20, v21);
  }

  if (v6 && !v23)
  {
    uint64_t v29 = objc_msgSend_failureCode(self, v24, v25, v26, v27, v28);
    v6[2](v6, v29);
  }

  return v23;
}

- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1BC3C0384;
  v13[3] = &unk_1E62ACFE0;
  id v8 = v6;
  id v14 = v8;
  v12 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, 1, (uint64_t)v13, v10, v11);
  if (v12) {
    v7[2](v7, v12, v8);
  }
}

- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, id))a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1BC3C0484;
  v15[3] = &unk_1E62ACFE0;
  id v10 = v8;
  id v16 = v10;
  id v14 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, (uint64_t)v15, v12, v13);
  if (v14) {
    v9[2](v9, v14, v10);
  }
}

- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, id))a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1BC3C0580;
  v15[3] = &unk_1E62ACFE0;
  id v10 = v8;
  id v16 = v10;
  id v14 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, (uint64_t)v15, v12, v13);
  if (v14) {
    v9[2](v9, v14, v10);
  }
}

- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v13 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  uint64_t v12 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, v6, (uint64_t)v13, v10, v11);
  if (v12) {
    v8[2](v8, v12, v13);
  }
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1BC3C0714;
  v8[3] = &unk_1E62ACFB8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = (void *)MEMORY[0x1C186EA80](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_failureHandlerWithResponse:(unsigned __int16)a3
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1BC3C0924;
  v6[3] = &unk_1E62ACF90;
  objc_copyWeak(&v7, &location);
  unsigned __int16 v8 = a3;
  id v4 = (void *)MEMORY[0x1C186EA80](v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v3;
    uint64_t v15 = objc_msgSend_clientId(self, v10, v11, v12, v13, v14);
    *(_DWORD *)buf = 136315394;
    v18 = "-[KVXPCClient dealloc]";
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    _os_log_debug_impl(&dword_1BC3B6000, v9, OS_LOG_TYPE_DEBUG, "%s Invalidating XPC connection for client %@", buf, 0x16u);
  }
  objc_msgSend_invalidate(self->_connection, v4, v5, v6, v7, v8);
  v16.receiver = self;
  v16.super_class = (Class)KVXPCClient;
  [(KVXPCClient *)&v16 dealloc];
}

- (KVXPCClient)initWithServiceProtocol:(id)a3 machServiceName:(id)a4 clientId:(id)a5 interruptionCode:(unsigned __int16)a6 invalidationCode:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = a6;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v61.receiver = self;
  v61.super_class = (Class)KVXPCClient;
  uint64_t v15 = [(KVXPCClient *)&v61 init];
  p_isa = (void **)&v15->super.isa;
  if (v15)
  {
    v15->_failureCode = 0;
    v15->_interruptionCode = v8;
    objc_storeStrong((id *)&v15->_clientId, a5);
    id v17 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v21 = objc_msgSend_initWithMachServiceName_options_(v17, v18, (uint64_t)v13, 0, v19, v20);
    v22 = p_isa[2];
    p_isa[2] = (void *)v21;

    if (!p_isa[2]
      || (objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v23, (uint64_t)v12, v24, v25, v26),
          (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v59 = 0;
      goto LABEL_9;
    }
    v32 = (void *)v27;
    objc_msgSend_setRemoteObjectInterface_(p_isa[2], v28, v27, v29, v30, v31);
    v33 = p_isa[2];
    v38 = objc_msgSend__failureHandlerWithResponse_(p_isa, v34, v8, v35, v36, v37);
    objc_msgSend_setInterruptionHandler_(v33, v39, (uint64_t)v38, v40, v41, v42);

    v43 = p_isa[2];
    v48 = objc_msgSend__failureHandlerWithResponse_(p_isa, v44, v7, v45, v46, v47);
    objc_msgSend_setInvalidationHandler_(v43, v49, (uint64_t)v48, v50, v51, v52);

    v53 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "-[KVXPCClient initWithServiceProtocol:machServiceName:clientId:interruptionCode:invalidationCode:]";
      __int16 v64 = 2112;
      id v65 = v14;
      _os_log_impl(&dword_1BC3B6000, v53, OS_LOG_TYPE_INFO, "%s Client %@ connecting to XPC service", buf, 0x16u);
    }
    objc_msgSend_resume(p_isa[2], v54, v55, v56, v57, v58);
  }
  v59 = p_isa;
LABEL_9:

  return v59;
}

- (KVXPCClient)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (void)initialize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

@end