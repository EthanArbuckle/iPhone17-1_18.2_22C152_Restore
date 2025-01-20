@interface GDXPCInternalBiomeService
- (BOOL)viewDumpStateWithError:(id *)a3;
- (BOOL)viewSetEnabledWithName:(id)a3 enabled:(BOOL)a4 error:(id *)a5;
- (BOOL)viewStopWithError:(id *)a3;
- (BOOL)viewValidateWithError:(id *)a3;
- (GDXPCInternalBiomeService)init;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)viewClearAllDataWithViewQuery:(id)a3 error:(id *)a4;
- (id)viewRunUpdateWithViewQuery:(id)a3 forceRebuild:(BOOL)a4 priorityOverride:(id)a5 error:(id *)a6;
- (id)viewValidateWithViewQuery:(id)a3 applyFixes:(BOOL)a4 verbose:(int64_t)a5 error:(id *)a6;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCInternalBiomeService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)viewValidateWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E708F4;
  v23 = sub_1B2E70904;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewValidate called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7090C;
  v17[3] = &unk_1E60140A0;
  v17[4] = &v19;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E709D8;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_viewValidateWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

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

- (BOOL)viewDumpStateWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E708F4;
  v23 = sub_1B2E70904;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewDumpState called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E70BFC;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E70CE0;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_viewDumpStateWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

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

- (id)viewValidateWithViewQuery:(id)a3 applyFixes:(BOOL)a4 verbose:(int64_t)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_1B2E708F4;
  v33 = sub_1B2E70904;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1B2E708F4;
  uint64_t v27 = sub_1B2E70904;
  id v28 = 0;
  uint64_t v11 = GDXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v11, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewRunUpdate called", buf, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E70F68;
  v21[3] = &unk_1E6014050;
  v21[4] = &v23;
  v21[5] = &v29;
  v15 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E71054;
  v20[3] = &unk_1E6013FC0;
  v20[4] = &v29;
  v20[5] = &v23;
  objc_msgSend_viewValidateWithViewQuery_applyFixes_verbose_completion_(v15, v16, (uint64_t)v10, v8, a5, v20);

  v17 = (void *)v30[5];
  if (a6 && !v17)
  {
    *a6 = (id) v24[5];
    v17 = (void *)v30[5];
  }
  id v18 = v17;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v18;
}

- (BOOL)viewSetEnabledWithName:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1B2E708F4;
  id v28 = sub_1B2E70904;
  id v29 = 0;
  v9 = GDXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl(&dword_1B2996000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewSetEnabled called [name=%@].", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E71354;
  v20[3] = &unk_1E6013DA0;
  id v10 = v8;
  id v21 = v10;
  v22 = &v24;
  uint64_t v23 = &v30;
  uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v20, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E71448;
  v19[3] = &unk_1E6014078;
  v19[4] = &v30;
  v19[5] = &v24;
  objc_msgSend_viewSetEnabledWithName_enabled_completion_(v14, v15, (uint64_t)v10, v6, (uint64_t)v19);

  int v16 = *((unsigned __int8 *)v31 + 24);
  if (a5 && !*((unsigned char *)v31 + 24))
  {
    *a5 = (id) v25[5];
    int v16 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v17;
}

- (id)viewClearAllDataWithViewQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_1B2E708F4;
  uint64_t v30 = sub_1B2E70904;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B2E708F4;
  uint64_t v24 = sub_1B2E70904;
  id v25 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewClearAllData called.", buf, 2u);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewClearAllData called.", buf, 2u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E716EC;
  v18[3] = &unk_1E6014050;
  v18[4] = &v20;
  v18[5] = &v26;
  uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E717D8;
  v17[3] = &unk_1E6013DC8;
  v17[4] = &v26;
  void v17[5] = &v20;
  objc_msgSend_viewClearAllDataWithViewQuery_completion_(v11, v12, (uint64_t)v6, (uint64_t)v17, v13);

  uint64_t v14 = (void *)v27[5];
  if (a4 && !v14)
  {
    *a4 = (id) v21[5];
    uint64_t v14 = (void *)v27[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);

  return v15;
}

- (BOOL)viewStopWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E708F4;
  uint64_t v23 = sub_1B2E70904;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewStop called", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E71A64;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E71B48;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_viewStopWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

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

- (id)viewRunUpdateWithViewQuery:(id)a3 forceRebuild:(BOOL)a4 priorityOverride:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  char v33 = sub_1B2E708F4;
  id v34 = sub_1B2E70904;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1B2E708F4;
  char v28 = sub_1B2E70904;
  id v29 = 0;
  uint64_t v12 = GDXPCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v12, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewRunUpdate called", buf, 2u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E71DDC;
  v22[3] = &unk_1E6014050;
  v22[4] = &v24;
  v22[5] = &v30;
  int v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E71EC8;
  v21[3] = &unk_1E6013DC8;
  v21[4] = &v30;
  v21[5] = &v24;
  objc_msgSend_viewRunUpdateWithViewQuery_forceRebuild_priorityOverride_completion_(v16, v17, (uint64_t)v10, v8, (uint64_t)v11, v21);

  id v18 = (void *)v31[5];
  if (a6 && !v18)
  {
    *a6 = (id) v25[5];
    id v18 = (void *)v31[5];
  }
  id v19 = v18;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);

  return v19;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_locked_establishConnection(v5, v6, v7, v8, v9);
  int v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5->_connection, v10, (uint64_t)v4, v11, v12);
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCInternalBiomeService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.InternalBiome", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1F10, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E7213C;
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
  v6.super_class = (Class)GDXPCInternalBiomeService;
  [(GDXPCInternalBiomeService *)&v6 dealloc];
}

- (GDXPCInternalBiomeService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCInternalBiomeService;
  v5 = [(GDXPCInternalBiomeService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B27098, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end