@interface GDXPCFeedbackService
- (BOOL)logWithFeedbackData:(id)a3 type:(id)a4 variant:(id)a5 eventId:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 error:(id *)a9;
- (GDXPCFeedbackService)init;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCFeedbackService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)logWithFeedbackData:(id)a3 type:(id)a4 variant:(id)a5 eventId:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1B2E6F2D4;
  v35 = sub_1B2E6F2E4;
  id v36 = 0;
  v19 = GDXPCLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v19, OS_LOG_TYPE_DEFAULT, "GDXPCFeedbackService: logWithFeedbackData called.", buf, 2u);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1B2E6F2EC;
  v29[3] = &unk_1E60140A0;
  v29[4] = &v31;
  v23 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v20, (uint64_t)v29, v21, v22);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1B2E6F3B8;
  v28[3] = &unk_1E6013CD0;
  v28[4] = &v31;
  objc_msgSend_logFeedback_ofType_ofVariant_forEvent_withTimestamp_shouldProcessImmediately_completion_(v23, v24, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, a6, v18, v9, v28);

  if (a9 && (v25 = (void *)v32[5]) != 0)
  {
    BOOL v26 = 0;
    *a9 = v25;
  }
  else
  {
    BOOL v26 = 1;
  }
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_locked_establishConnection(v5, v6, v7, v8, v9);
  v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5->_connection, v10, (uint64_t)v4, v11, v12);
  objc_sync_exit(v5);

  return v13;
}

- (void)locked_establishConnection
{
  if (!self->_connection)
  {
    v3 = GDXPCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCFeedbackService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.Feedback", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1EB0, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E6F5B8;
    v22[3] = &unk_1E6014028;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend_setInvalidationHandler_(self->_connection, v15, (uint64_t)v22, v16, v17);
    objc_msgSend_resume(self->_connection, v18, v19, v20, v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)dealloc
{
  objc_msgSend_invalidate(self->_connection, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)GDXPCFeedbackService;
  [(GDXPCFeedbackService *)&v6 dealloc];
}

- (GDXPCFeedbackService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCFeedbackService;
  v5 = [(GDXPCFeedbackService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B26F78, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end