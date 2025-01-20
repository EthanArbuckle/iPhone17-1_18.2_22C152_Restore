@interface GDXPCSysdiagnoseService
- (GDXPCSysdiagnoseService)init;
- (id)diagnosticsWithError:(id *)a3;
- (id)entityRelevanceRankingSupplementalDiagnosticsWithError:(id *)a3;
- (id)entityResolutionSupplementalDiagnosticsWithError:(id *)a3;
- (id)entityTaggingSupplementalDiagnosticsWithError:(id *)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)viewsSupplementalDiagnosticsWithError:(id *)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCSysdiagnoseService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)viewsSupplementalDiagnosticsWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E7D16C;
  v29 = sub_1B2E7D17C;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7D16C;
  v23 = sub_1B2E7D17C;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService: Views supplemental diagnostics called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7D184;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7D270;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_viewsSupplementalDiagnosticsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)entityResolutionSupplementalDiagnosticsWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E7D16C;
  v29 = sub_1B2E7D17C;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7D16C;
  v23 = sub_1B2E7D17C;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService: EntityResolution supplemental diagnostics called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7D530;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7D61C;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_entityResolutionSupplementalDiagnosticsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)entityRelevanceRankingSupplementalDiagnosticsWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E7D16C;
  v29 = sub_1B2E7D17C;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7D16C;
  v23 = sub_1B2E7D17C;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService: EntityRelevanceRanking supplemental diagnostics called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7D8DC;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7D9C8;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_entityRelevanceRankingSupplementalDiagnosticsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)entityTaggingSupplementalDiagnosticsWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E7D16C;
  v29 = sub_1B2E7D17C;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7D16C;
  v23 = sub_1B2E7D17C;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService: EntityTagging supplemental diagnostics called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7DC88;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7DD74;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_entityTaggingSupplementalDiagnosticsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)diagnosticsWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E7D16C;
  v29 = sub_1B2E7D17C;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7D16C;
  v23 = sub_1B2E7D17C;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService: diagnostics called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7E034;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7E120;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_diagnosticsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.Sysdiagnose", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1FB0, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E7E394;
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
  v6.super_class = (Class)GDXPCSysdiagnoseService;
  [(GDXPCSysdiagnoseService *)&v6 dealloc];
}

- (GDXPCSysdiagnoseService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCSysdiagnoseService;
  v5 = [(GDXPCSysdiagnoseService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B27278, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end