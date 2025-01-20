@interface GDXPCViewService
- (BOOL)performUpdateForViewNames:(id)a3 includeDependencies:(BOOL)a4 error:(id *)a5;
- (BOOL)performUpdateForViewNames:(id)a3 useCase:(id)a4 includeDependencies:(BOOL)a5 error:(id *)a6;
- (BOOL)reportSQLiteErrorForViewName:(id)a3 sqliteErrorCode:(int64_t)a4 useCase:(id)a5 error:(id *)a6;
- (BOOL)reportUnknownErrorForViewName:(id)a3 useCase:(id)a4 error:(id *)a5;
- (GDXPCViewService)init;
- (id)accessInfoForViewName:(id)a3 useCase:(id)a4 error:(id *)a5;
- (id)accessTokenForFeaturesWithIsSandboxed:(BOOL)a3 useCase:(id)a4 error:(id *)a5;
- (id)accessTokenForViewName:(id)a3 isSandboxed:(BOOL)a4 useCase:(id)a5 error:(id *)a6;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCViewService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)reportSQLiteErrorForViewName:(id)a3 sqliteErrorCode:(int64_t)a4 useCase:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1B2E7E82C;
  v27 = sub_1B2E7E83C;
  id v28 = 0;
  v12 = GDXPCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v10;
    __int16 v35 = 2048;
    int64_t v36 = a4;
    _os_log_impl(&dword_1B2996000, v12, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: reportSQLiteErrorForViewName called (viewName=%@) (code=%lld).", buf, 0x16u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E7E844;
  v22[3] = &unk_1E60140A0;
  v22[4] = &v23;
  v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E7E910;
  v21[3] = &unk_1E6014078;
  v21[4] = &v29;
  v21[5] = &v23;
  objc_msgSend_reportSQLiteErrorForViewName_sqliteErrorCode_useCase_completion_(v16, v17, (uint64_t)v10, a4, (uint64_t)v11, v21);

  int v18 = *((unsigned __int8 *)v30 + 24);
  if (a6 && !*((unsigned char *)v30 + 24))
  {
    *a6 = (id) v24[5];
    int v18 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v19 = v18 != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (BOOL)reportUnknownErrorForViewName:(id)a3 useCase:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1B2E7E82C;
  uint64_t v25 = sub_1B2E7E83C;
  id v26 = 0;
  id v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v8;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: reportUnknownErrorForViewName called (viewName=%@).", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E7EB98;
  v20[3] = &unk_1E60140A0;
  v20[4] = &v21;
  uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v20, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E7EC64;
  v19[3] = &unk_1E6014078;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend_reportUnknownErrorForViewName_useCase_completion_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v19);

  int v16 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v16 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v17 = v16 != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (id)accessTokenForFeaturesWithIsSandboxed:(BOOL)a3 useCase:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  char v30 = sub_1B2E7E82C;
  uint64_t v31 = sub_1B2E7E83C;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1B2E7E82C;
  uint64_t v25 = sub_1B2E7E83C;
  id v26 = 0;
  id v9 = GDXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B2996000, v9, OS_LOG_TYPE_DEBUG, "GDXPCViewService: accessTokenForFeaturesWithIsSandboxed called.", buf, 2u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E7EEE0;
  v19[3] = &unk_1E60140A0;
  v19[4] = &v21;
  uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E7EFAC;
  v18[3] = &unk_1E60140C8;
  v18[4] = &v27;
  v18[5] = &v21;
  objc_msgSend_accessTokenForFeaturesWithIsSandboxed_useCase_completion_(v13, v14, v6, (uint64_t)v8, (uint64_t)v18);

  uint64_t v15 = (void *)v28[5];
  if (a5 && !v15)
  {
    *a5 = (id) v22[5];
    uint64_t v15 = (void *)v28[5];
  }
  id v16 = v15;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v16;
}

- (id)accessInfoForViewName:(id)a3 useCase:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  char v30 = sub_1B2E7E82C;
  uint64_t v31 = sub_1B2E7E83C;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1B2E7E82C;
  uint64_t v25 = sub_1B2E7E83C;
  id v26 = 0;
  id v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: accessInfoForViewName called (viewName=%@) useCase: %@", buf, 0x16u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E7F2E0;
  v20[3] = &unk_1E60140A0;
  v20[4] = &v21;
  uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v20, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E7F3AC;
  v19[3] = &unk_1E60140F0;
  v19[4] = &v27;
  void v19[5] = &v21;
  objc_msgSend_accessInfoForViewName_useCase_completion_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v19);

  id v16 = (void *)v28[5];
  if (a5 && !v16)
  {
    *a5 = (id) v22[5];
    id v16 = (void *)v28[5];
  }
  id v17 = v16;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v17;
}

- (id)accessTokenForViewName:(id)a3 isSandboxed:(BOOL)a4 useCase:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1B2E7E82C;
  uint64_t v33 = sub_1B2E7E83C;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1B2E7E82C;
  uint64_t v27 = sub_1B2E7E83C;
  id v28 = 0;
  uint64_t v12 = GDXPCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v10;
    _os_log_impl(&dword_1B2996000, v12, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: accessTokenForViewName called (viewName=%@).", buf, 0xCu);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E7F6E0;
  v22[3] = &unk_1E60140A0;
  v22[4] = &v23;
  id v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E7F7AC;
  v21[3] = &unk_1E60140C8;
  v21[4] = &v29;
  v21[5] = &v23;
  objc_msgSend_accessTokenForViewName_isSandboxed_useCase_completion_(v16, v17, (uint64_t)v10, v8, (uint64_t)v11, v21);

  int v18 = (void *)v30[5];
  if (a6 && !v18)
  {
    *a6 = (id) v24[5];
    int v18 = (void *)v30[5];
  }
  id v19 = v18;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v19;
}

- (BOOL)performUpdateForViewNames:(id)a3 useCase:(id)a4 includeDependencies:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1B2E7E82C;
  id v28 = sub_1B2E7E83C;
  id v29 = 0;
  uint64_t v12 = GDXPCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v12, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: runUpdateWithViewName called.", buf, 2u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E7FA74;
  v22[3] = &unk_1E6014050;
  v22[4] = &v24;
  void v22[5] = &v30;
  id v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E7FB58;
  v21[3] = &unk_1E6014078;
  v21[4] = &v30;
  v21[5] = &v24;
  objc_msgSend_performUpdateForViewNames_useCase_includeDependencies_completion_(v16, v17, (uint64_t)v10, (uint64_t)v11, v7, v21);

  int v18 = *((unsigned __int8 *)v31 + 24);
  if (a6 && !*((unsigned char *)v31 + 24))
  {
    *a6 = (id) v25[5];
    int v18 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v19 = v18 != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (BOOL)performUpdateForViewNames:(id)a3 includeDependencies:(BOOL)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel_performUpdateForViewNames_useCase_includeDependencies_error_, a3, *MEMORY[0x1E4F4FB00], a4);
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCViewService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.View", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1FD0, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E7FD7C;
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
  v6.super_class = (Class)GDXPCViewService;
  [(GDXPCViewService *)&v6 dealloc];
}

- (GDXPCViewService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCViewService;
  v5 = [(GDXPCViewService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B272D8, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end