@interface CLEEDRequestHelper
+ (int64_t)validateServerCertificateChallenge:(id)a3;
- (CLEEDRequestDelegate)helperDelegate;
- (CLEEDRequestHelper)initWithDelegate:(id)a3 andQueue:(id)a4;
- (NSXPCConnection)fConnection;
- (OS_dispatch_queue)fClientQueue;
- (void)cleanup;
- (void)dealloc;
- (void)fetchAllPendingRequestsWithCompletion:(id)a3;
- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3;
- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3;
- (void)fetchMitigationsWithCompletion:(id)a3;
- (void)handleInterruption;
- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4;
- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5;
- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5;
- (void)notifyHelperInvalidation;
- (void)notifyMitigationNeeded:(id)a3;
- (void)notifyNewRequestAvailable;
- (void)setFConnection:(id)a3;
- (void)setHelperDelegate:(id)a3;
- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4;
@end

@implementation CLEEDRequestHelper

- (CLEEDRequestHelper)initWithDelegate:(id)a3 andQueue:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v7 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v45 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
    __int16 v46 = 2114;
    v47 = (const char *)a3;
    __int16 v48 = 2114;
    id v49 = a4;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[Delegate:%{public}@,Queue:%{public}@]", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v38 = 136446722;
    v39 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
    __int16 v40 = 2114;
    v41 = (const char *)a3;
    __int16 v42 = 2114;
    id v43 = a4;
    v26 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
  }
  v37.receiver = self;
  v37.super_class = (Class)CLEEDRequestHelper;
  v8 = [(CLEEDRequestHelper *)&v37 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_helperDelegate, a3);
    objc_storeWeak((id *)&v9->_fClientQueue, a4);
    v10 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.eedhelper" options:0];
    v9->_fConnection = v10;
    if (v10)
    {
      [(NSXPCConnection *)v10 _setQueue:objc_loadWeak((id *)&v9->_fClientQueue)];
      v11 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE040FD8];
      v30 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE0296B0];
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
      [v11 setClasses:v19 forSelector:sel_fetchAllPendingRequestsWithCompletion_ argumentIndex:0 ofReply:1];
      [v11 setClasses:v19 forSelector:sel_mediaUploadList_forRequestID_completion_ argumentIndex:0 ofReply:0];
      [v11 setClasses:v19 forSelector:sel_fetchMitigationsWithCompletion_ argumentIndex:0 ofReply:1];
      [v30 setClasses:v19 forSelector:sel_notifyMitigationNeeded_ argumentIndex:0 ofReply:0];
      [(NSXPCConnection *)v9->_fConnection setExportedInterface:v30];
      [(NSXPCConnection *)v9->_fConnection setExportedObject:v9];
      [(NSXPCConnection *)v9->_fConnection setRemoteObjectInterface:v11];
      objc_initWeak(&location, v9);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_190719B64;
      v34[3] = &unk_1E56971B8;
      objc_copyWeak(&v35, &location);
      [(NSXPCConnection *)v9->_fConnection setInvalidationHandler:v34];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = sub_190719D70;
      v32[3] = &unk_1E56971B8;
      objc_copyWeak(&v33, &location);
      [(NSXPCConnection *)v9->_fConnection setInterruptionHandler:v32];
      [(NSXPCConnection *)v9->_fConnection activate];
      v20 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v21 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_INFO, "#EED2FWK,%{public}s, Finished setting-up connection parameters to EEDHelperService", buf, 0xCu);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        int v38 = 136446210;
        v39 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
        v20 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
      }
      fConnection = v9->_fConnection;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_190719F38;
      v31[3] = &unk_1E5697048;
      v31[4] = v9;
      objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v31), "connectToEEDHelper");
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v23 = *((void *)v20 + 192);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        _os_log_impl(&dword_1906B8000, v23, OS_LOG_TYPE_INFO, "#EED2FWK,%{public}s, connected to EEDHelperService", buf, 0xCu);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        int v38 = 136446210;
        v39 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        v28 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
      }
      objc_destroyWeak(&v33);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    else
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v24 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        __int16 v46 = 2082;
        v47 = "com.apple.locationd.eedhelper";
        _os_log_impl(&dword_1906B8000, v24, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, connection initialization failure to %{public}s", buf, 0x16u);
      }
      if (sub_1906CB57C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        int v38 = 136446466;
        v39 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        __int16 v40 = 2082;
        v41 = "com.apple.locationd.eedhelper";
        v29 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v29);
        if (v29 != (char *)buf) {
          free(v29);
        }
      }

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v3 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[CLEEDRequestHelper dealloc]";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v6 = 136446210;
    v7 = "-[CLEEDRequestHelper dealloc]";
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper dealloc]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLEEDRequestHelper *)self cleanup];
  v5.receiver = self;
  v5.super_class = (Class)CLEEDRequestHelper;
  [(CLEEDRequestHelper *)&v5 dealloc];
}

- (void)cleanup
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(CLEEDRequestHelper *)self helperDelegate]) {
    [(CLEEDRequestHelper *)self setHelperDelegate:0];
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v3 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      int v6 = "-[CLEEDRequestHelper cleanup]";
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper cleanup]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [(NSXPCConnection *)[(CLEEDRequestHelper *)self fConnection] invalidate];
  }
}

- (void)handleInterruption
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v3 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = "-[CLEEDRequestHelper handleInterruption]";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v7 = 136446210;
    v8 = "-[CLEEDRequestHelper handleInterruption]";
    objc_super v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper handleInterruption]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  v4 = [(CLEEDRequestHelper *)self fConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19071A558;
  v6[3] = &unk_1E5697048;
  v6[4] = self;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](v4, "remoteObjectProxyWithErrorHandler:", v6), "connectToEEDHelper");
}

- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  int v7 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    uint64_t v10 = "-[CLEEDRequestHelper handleRemoteProxyError:forProcessIdentifier:]";
    __int16 v11 = 1026;
    int v12 = a4;
    __int16 v13 = 2114;
    uint64_t v14 = [a3 localizedDescription];
    __int16 v15 = 2114;
    uint64_t v16 = [a3 localizedFailureReason];
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s[pid:%{public}d]: %{public}@ %{public}@\n", buf, 0x26u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [a3 localizedDescription];
    [a3 localizedFailureReason];
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDRequestHelper handleRemoteProxyError:forProcessIdentifier:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  [(CLEEDRequestHelper *)self cleanup];
}

- (void)notifyHelperInvalidation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(CLEEDRequestHelper *)self helperDelegate])
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v3 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      int v6 = "-[CLEEDRequestHelper notifyHelperInvalidation]";
      __int16 v7 = 2114;
      v8 = self;
      __int16 v9 = 2114;
      uint64_t v10 = [(CLEEDRequestHelper *)self helperDelegate];
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s [self:%{public}@, helperDelegate:%{public}@]", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      [(CLEEDRequestHelper *)self helperDelegate];
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper notifyHelperInvalidation]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [(CLEEDRequestDelegate *)[(CLEEDRequestHelper *)self helperDelegate] notifyHelperInvalidation];
    [(CLEEDRequestHelper *)self setHelperDelegate:0];
  }
}

- (void)notifyNewRequestAvailable
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(CLEEDRequestHelper *)self helperDelegate])
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v3 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      int v6 = "-[CLEEDRequestHelper notifyNewRequestAvailable]";
      __int16 v7 = 2114;
      v8 = self;
      __int16 v9 = 2114;
      uint64_t v10 = [(CLEEDRequestHelper *)self helperDelegate];
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s [self:%{public}@, helperDelegate:%{public}@]", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      [(CLEEDRequestHelper *)self helperDelegate];
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper notifyNewRequestAvailable]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [(CLEEDRequestDelegate *)[(CLEEDRequestHelper *)self helperDelegate] notifyNewRequestAvailable];
  }
}

- (void)notifyMitigationNeeded:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(CLEEDRequestHelper *)self helperDelegate])
  {
    [(CLEEDRequestHelper *)self helperDelegate];
    if (objc_opt_respondsToSelector())
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      objc_super v5 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v8 = "-[CLEEDRequestHelper notifyMitigationNeeded:]";
        __int16 v9 = 2114;
        uint64_t v10 = self;
        __int16 v11 = 2114;
        int v12 = [(CLEEDRequestHelper *)self helperDelegate];
        __int16 v13 = 2114;
        id v14 = a3;
        _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s [self:%{public}@, helperDelegate:%{public}@, mitigation:%{public}@]", buf, 0x2Au);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        [(CLEEDRequestHelper *)self helperDelegate];
        int v6 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper notifyMitigationNeeded:]", "CoreLocation: %s\n", v6);
        if (v6 != (char *)buf) {
          free(v6);
        }
      }
      [(CLEEDRequestDelegate *)[(CLEEDRequestHelper *)self helperDelegate] notifyMitigationNeeded:a3];
    }
  }
}

- (void)fetchAllPendingRequestsWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v19 = "-[CLEEDRequestHelper fetchAllPendingRequestsWithCompletion:]";
    __int16 v20 = 2114;
    id v21 = a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v14 = 136446466;
    uint64_t v15 = "-[CLEEDRequestHelper fetchAllPendingRequestsWithCompletion:]";
    __int16 v16 = 2114;
    id v17 = a3;
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchAllPendingRequestsWithCompletion:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    int v6 = [(CLEEDRequestHelper *)self fConnection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19071B134;
    v11[3] = &unk_1E56971E0;
    v11[4] = self;
    v11[5] = a3;
    id v7 = [(NSXPCConnection *)v6 remoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19071B1A4;
    v10[3] = &unk_1E5697208;
    v10[4] = self;
    v10[5] = a3;
    [v7 fetchAllPendingRequestsWithCompletion:v10];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F28568];
    __int16 v13 = @"Connection reset, caller needs to re-initialize";
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, objc_msgSend(v8, "initWithDomain:code:userInfo:", @"com.apple.CoreLocation.CLEEDHelperService", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v19 = "-[CLEEDRequestHelper fetchCurrentMediaUploadRequestWithCompletion:]";
    __int16 v20 = 2114;
    id v21 = a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v14 = 136446466;
    uint64_t v15 = "-[CLEEDRequestHelper fetchCurrentMediaUploadRequestWithCompletion:]";
    __int16 v16 = 2114;
    id v17 = a3;
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchCurrentMediaUploadRequestWithCompletion:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    int v6 = [(CLEEDRequestHelper *)self fConnection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19071B6B8;
    v11[3] = &unk_1E56971E0;
    v11[4] = self;
    v11[5] = a3;
    id v7 = [(NSXPCConnection *)v6 remoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19071B728;
    v10[3] = &unk_1E5697230;
    v10[4] = self;
    v10[5] = a3;
    [v7 fetchCurrentMediaUploadRequestWithCompletion:v10];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F28568];
    __int16 v13 = @"Connection reset, caller needs to re-initialize";
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, objc_msgSend(v8, "initWithDomain:code:userInfo:", @"com.apple.CoreLocation.CLEEDHelperService", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v19 = "-[CLEEDRequestHelper fetchCurrentStreamingRequestWithCompletion:]";
    __int16 v20 = 2114;
    id v21 = a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v14 = 136446466;
    uint64_t v15 = "-[CLEEDRequestHelper fetchCurrentStreamingRequestWithCompletion:]";
    __int16 v16 = 2114;
    id v17 = a3;
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchCurrentStreamingRequestWithCompletion:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    int v6 = [(CLEEDRequestHelper *)self fConnection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19071BC44;
    v11[3] = &unk_1E56971E0;
    v11[4] = self;
    v11[5] = a3;
    id v7 = [(NSXPCConnection *)v6 remoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19071BCB4;
    v10[3] = &unk_1E5697258;
    v10[4] = self;
    v10[5] = a3;
    [v7 fetchCurrentStreamingRequestWithCompletion:v10];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F28568];
    __int16 v13 = @"Connection reset, caller needs to re-initialize";
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, objc_msgSend(v8, "initWithDomain:code:userInfo:", @"com.apple.CoreLocation.CLEEDHelperService", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

- (void)fetchMitigationsWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v19 = "-[CLEEDRequestHelper fetchMitigationsWithCompletion:]";
    __int16 v20 = 2114;
    id v21 = a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v14 = 136446466;
    uint64_t v15 = "-[CLEEDRequestHelper fetchMitigationsWithCompletion:]";
    __int16 v16 = 2114;
    id v17 = a3;
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchMitigationsWithCompletion:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    int v6 = [(CLEEDRequestHelper *)self fConnection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19071C1C8;
    v11[3] = &unk_1E56971E0;
    v11[4] = self;
    v11[5] = a3;
    id v7 = [(NSXPCConnection *)v6 remoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19071C238;
    v10[3] = &unk_1E5697280;
    v10[4] = self;
    v10[5] = a3;
    [v7 fetchMitigationsWithCompletion:v10];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F28568];
    __int16 v13 = @"Connection reset, caller needs to re-initialize";
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, objc_msgSend(v8, "initWithDomain:code:userInfo:", @"com.apple.CoreLocation.CLEEDHelperService", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
}

- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  __int16 v9 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "-[CLEEDRequestHelper mediaUploadList:forRequestID:completion:]";
    __int16 v28 = 2114;
    id v29 = a3;
    __int16 v30 = 2114;
    id v31 = a4;
    __int16 v32 = 2114;
    id v33 = a5;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[mediaUploadList:%{public}@,requestID:%{public}@,completion:%{public}@]", buf, 0x2Au);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v18 = 136446978;
    uint64_t v19 = "-[CLEEDRequestHelper mediaUploadList:forRequestID:completion:]";
    __int16 v20 = 2114;
    id v21 = a3;
    __int16 v22 = 2114;
    id v23 = a4;
    __int16 v24 = 2114;
    id v25 = a5;
    __int16 v13 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper mediaUploadList:forRequestID:completion:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    uint64_t v10 = [(CLEEDRequestHelper *)self fConnection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_19071C780;
    v15[3] = &unk_1E56971E0;
    v15[4] = self;
    v15[5] = a5;
    id v11 = [(NSXPCConnection *)v10 remoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19071C7EC;
    v14[3] = &unk_1E56971E0;
    v14[4] = self;
    v14[5] = a5;
    [v11 mediaUploadList:a3 forRequestID:a4 completion:v14];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28568];
    id v17 = @"Connection reset, caller needs to re-initialize";
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(v12, "initWithDomain:code:userInfo:", @"com.apple.CoreLocation.CLEEDHelperService", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
  }
}

- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  id v7 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v23 = "-[CLEEDRequestHelper streamingSessionEndedForRequestID:completion:]";
    __int16 v24 = 2114;
    id v25 = a3;
    __int16 v26 = 2114;
    id v27 = a4;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[request:%{public}@,completion:%{public}@]", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v16 = 136446722;
    id v17 = "-[CLEEDRequestHelper streamingSessionEndedForRequestID:completion:]";
    __int16 v18 = 2114;
    id v19 = a3;
    __int16 v20 = 2114;
    id v21 = a4;
    id v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper streamingSessionEndedForRequestID:completion:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    id v8 = [(CLEEDRequestHelper *)self fConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19071CCF4;
    v13[3] = &unk_1E56971E0;
    v13[4] = self;
    v13[5] = a4;
    id v9 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19071CD60;
    v12[3] = &unk_1E56971E0;
    v12[4] = self;
    v12[5] = a4;
    [v9 streamingSessionEndedForRequestID:a3 completion:v12];
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F28568];
    uint64_t v15 = @"Connection reset, caller needs to re-initialize";
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(v10, "initWithDomain:code:userInfo:", @"com.apple.CoreLocation.CLEEDHelperService", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5
{
  BOOL v7 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  id v9 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v27 = "-[CLEEDRequestHelper handleResponse:forRequest:completion:]";
    __int16 v28 = 1026;
    BOOL v29 = v7;
    __int16 v30 = 2114;
    id v31 = a4;
    __int16 v32 = 2114;
    id v33 = a5;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[response:%{public}u,ID:%{public}@,completion:%{public}@]", buf, 0x26u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v18 = 136446978;
    id v19 = "-[CLEEDRequestHelper handleResponse:forRequest:completion:]";
    __int16 v20 = 1026;
    BOOL v21 = v7;
    __int16 v22 = 2114;
    id v23 = a4;
    __int16 v24 = 2114;
    id v25 = a5;
    __int16 v13 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequestHelper handleResponse:forRequest:completion:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  if ([(CLEEDRequestHelper *)self fConnection])
  {
    id v10 = [(CLEEDRequestHelper *)self fConnection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_19071D29C;
    v15[3] = &unk_1E56971E0;
    v15[4] = self;
    v15[5] = a5;
    id v11 = [(NSXPCConnection *)v10 remoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19071D30C;
    v14[3] = &unk_1E56972A8;
    v14[4] = self;
    v14[5] = a5;
    [v11 handleResponse:v7 forRequest:a4 completion:v14];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28568];
    id v17 = @"Connection reset, caller needs to re-initialize";
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, objc_msgSend(v12, "initWithDomain:code:userInfo:", @"com.apple.CoreLocation.CLEEDHelperService", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
  }
}

+ (int64_t)validateServerCertificateChallenge:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x192FCF260](a1, a2);
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    id v33 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    __int16 v34 = 2113;
    uint64_t v35 = (uint64_t)a3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, Challenge:%{private}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v26 = 136446467;
    id v27 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    __int16 v28 = 2113;
    uint64_t v29 = (uint64_t)a3;
    id v23 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
  int v6 = objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "authenticationMethod");
  if ([v6 isEqualToString:*MEMORY[0x1E4F28988]])
  {
    CFErrorRef error = 0;
    BOOL v7 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "serverTrust");
    if (SecTrustEvaluateWithError(v7, &error))
    {
      CFArrayRef v8 = SecTrustCopyCertificateChain(v7);
      if (v8)
      {
        CFArrayRef v9 = v8;
        uint64_t v10 = [(__CFArray *)v8 lastObject];
        SecTrustStoreForDomain();
        if (SecTrustStoreContains())
        {
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          id v11 = qword_1E929F600;
          if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            id v33 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
            _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, Root is system trusted, proceed with default handling", buf, 0xCu);
          }
          if (!sub_1906CB57C(115, 2)) {
            goto LABEL_24;
          }
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          int v26 = 136446210;
          id v27 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
          id v12 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v12);
          if (v12 == (char *)buf) {
            goto LABEL_24;
          }
          goto LABEL_68;
        }
        Boolean v24 = 0;
        int v19 = sub_190716DAC(@"EEDOverrideServerChallenge", @"com.apple.locationd", &v24);
        if (v24 && v19)
        {
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          __int16 v20 = qword_1E929F600;
          if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446723;
            id v33 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
            __int16 v34 = 2113;
            uint64_t v35 = v10;
            __int16 v36 = 2113;
            CFArrayRef v37 = v9;
            _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, Root:%{private}@ is not system trusted, but EEDOverrideServerChallenge set, overriding. Chain:%{private}@", buf, 0x20u);
          }
          if (!sub_1906CB57C(115, 2)) {
            goto LABEL_24;
          }
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          int v26 = 136446723;
          id v27 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
          __int16 v28 = 2113;
          uint64_t v29 = v10;
          __int16 v30 = 2113;
          CFArrayRef v31 = v9;
          id v12 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v12);
          if (v12 == (char *)buf) {
            goto LABEL_24;
          }
          goto LABEL_68;
        }
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        BOOL v21 = qword_1E929F600;
        if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446723;
          id v33 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
          __int16 v34 = 2113;
          uint64_t v35 = v10;
          __int16 v36 = 2113;
          CFArrayRef v37 = v9;
          _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, Root:%{private}@ is not system trusted, not contained in SecurityTrustStore with system domain. Chain:%{private}@", buf, 0x20u);
        }
        if (!sub_1906CB57C(115, 0)) {
          goto LABEL_59;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        int v26 = 136446723;
        id v27 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
        __int16 v28 = 2113;
        uint64_t v29 = v10;
        __int16 v30 = 2113;
        CFArrayRef v31 = v9;
        int v18 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v18);
        if (v18 == (char *)buf)
        {
LABEL_59:
          int64_t v15 = 2;
          goto LABEL_60;
        }
LABEL_42:
        free(v18);
        goto LABEL_59;
      }
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      id v17 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        id v33 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
        _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, SecTrustCopyCertificateChain failed", buf, 0xCu);
      }
      if (!sub_1906CB57C(115, 0)) {
        goto LABEL_59;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int v26 = 136446210;
      id v27 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    }
    else
    {
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v16 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        id v33 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
        __int16 v34 = 2114;
        uint64_t v35 = (uint64_t)error;
        _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, SecTrustEvaluateWithError returned error:%{public}@", buf, 0x16u);
      }
      if (!sub_1906CB57C(115, 0)) {
        goto LABEL_59;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int v26 = 136446466;
      id v27 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)error;
    }
    int v18 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v18);
    if (v18 == (char *)buf) {
      goto LABEL_59;
    }
    goto LABEL_42;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  __int16 v13 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "authenticationMethod");
    *(_DWORD *)buf = 136446466;
    id v33 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    __int16 v34 = 2114;
    uint64_t v35 = v14;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_INFO, "#EED2FWK,%{public}s, Unsupported authenticationMethod:%{public}@, proceed with default handling", buf, 0x16u);
  }
  if (!sub_1906CB57C(115, 2)) {
    goto LABEL_24;
  }
  bzero(buf, 0x65CuLL);
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  int v26 = 136446466;
  id v27 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
  __int16 v28 = 2114;
  uint64_t v29 = objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "authenticationMethod");
  id v12 = (char *)_os_log_send_and_compose_impl();
  sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v12);
  if (v12 == (char *)buf) {
    goto LABEL_24;
  }
LABEL_68:
  free(v12);
LABEL_24:
  int64_t v15 = 1;
LABEL_60:
  return v15;
}

- (CLEEDRequestDelegate)helperDelegate
{
  return (CLEEDRequestDelegate *)objc_loadWeak((id *)&self->_helperDelegate);
}

- (void)setHelperDelegate:(id)a3
{
}

- (NSXPCConnection)fConnection
{
  return self->_fConnection;
}

- (void)setFConnection:(id)a3
{
}

- (OS_dispatch_queue)fClientQueue
{
  return (OS_dispatch_queue *)objc_loadWeak((id *)&self->_fClientQueue);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fClientQueue);

  objc_destroyWeak((id *)&self->_helperDelegate);
}

@end