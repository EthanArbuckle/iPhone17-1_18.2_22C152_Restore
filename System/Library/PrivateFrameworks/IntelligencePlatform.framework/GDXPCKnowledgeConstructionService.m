@interface GDXPCKnowledgeConstructionService
- (BOOL)checkInWithError:(id *)a3;
- (BOOL)runFastpassPipelineWithReason:(unint64_t)a3 error:(id *)a4;
- (BOOL)runFullPipelineWithReason:(unint64_t)a3 error:(id *)a4;
- (BOOL)stopPipelineWithError:(id *)a3;
- (GDXPCKnowledgeConstructionService)init;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCKnowledgeConstructionService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)checkInWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7B5C8;
  v23 = sub_1B2E7B5D8;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: checkIn called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7B5E0;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7B6C4;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_checkInWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);
  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v14;
}

- (BOOL)stopPipelineWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7B5C8;
  v23 = sub_1B2E7B5D8;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: stopPipeline called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7B8E8;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7B9CC;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_stopPipelineWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);
  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v14;
}

- (BOOL)runFastpassPipelineWithReason:(unint64_t)a3 error:(id *)a4
{
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1B2E7B5C8;
  id v24 = sub_1B2E7B5D8;
  id v25 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: runFullPipeline called.", buf, 2u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E7BC00;
  v18[3] = &unk_1E6014050;
  v18[4] = &v20;
  v18[5] = &v26;
  uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7BCE4;
  v17[3] = &unk_1E6014078;
  v17[4] = &v26;
  v17[5] = &v20;
  objc_msgSend_runFastpassPipelineWithReason_completion_(v11, v12, a3, (uint64_t)v17, v13);

  int v14 = *((unsigned __int8 *)v27 + 24);
  if (a4 && !*((unsigned char *)v27 + 24))
  {
    *a4 = (id) v21[5];
    int v14 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (BOOL)runFullPipelineWithReason:(unint64_t)a3 error:(id *)a4
{
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1B2E7B5C8;
  id v24 = sub_1B2E7B5D8;
  id v25 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: runFullPipeline called.", buf, 2u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E7BF18;
  v18[3] = &unk_1E6014050;
  v18[4] = &v20;
  v18[5] = &v26;
  uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7BFFC;
  v17[3] = &unk_1E6014078;
  v17[4] = &v26;
  v17[5] = &v20;
  objc_msgSend_runFullPipelineWithReason_completion_(v11, v12, a3, (uint64_t)v17, v13);

  int v14 = *((unsigned __int8 *)v27 + 24);
  if (a4 && !*((unsigned char *)v27 + 24))
  {
    *a4 = (id) v21[5];
    int v14 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_locked_establishConnection(v5, v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5->_connection, v10, (uint64_t)v4, v11, v12);
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCKnowledgeConstructionService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.KnowledgeConstruction", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1F70, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E7C208;
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
  v6.super_class = (Class)GDXPCKnowledgeConstructionService;
  [(GDXPCKnowledgeConstructionService *)&v6 dealloc];
}

- (GDXPCKnowledgeConstructionService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCKnowledgeConstructionService;
  v5 = [(GDXPCKnowledgeConstructionService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B271B8, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end