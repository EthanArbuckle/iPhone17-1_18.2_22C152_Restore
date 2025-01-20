@interface GDXPCCoordinationService
- (BOOL)graphUpdatedWithSource:(id)a3 error:(id *)a4;
- (BOOL)migrateViewDatabasesWithError:(id *)a3;
- (BOOL)sourceUpdatedWithSourceType:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5;
- (BOOL)streamUpdatedWithStreamName:(id)a3 isDelete:(BOOL)a4 error:(id *)a5;
- (BOOL)streamsChangedWithUpdated:(id)a3 deletes:(id)a4 error:(id *)a5;
- (GDXPCCoordinationService)init;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCCoordinationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)migrateViewDatabasesWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E6BC88;
  v23 = sub_1B2E6BC98;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: migrateViewDatabases called", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E6BCA0;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  v17[5] = &v25;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E6BD84;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_migrateViewDatabasesWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

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

- (BOOL)streamsChangedWithUpdated:(id)a3 deletes:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1B2E6BC88;
  v35 = sub_1B2E6BC98;
  id v36 = 0;
  v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_count(v8, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_count(v9, v16, v17, v18, v19);
    *(_DWORD *)buf = 134218240;
    uint64_t v42 = v15;
    __int16 v43 = 2048;
    uint64_t v44 = v20;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: streamsChanged called with %tu updated and %tu deletes", buf, 0x16u);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1B2E6C03C;
  v30[3] = &unk_1E6014050;
  v30[4] = &v31;
  v30[5] = &v37;
  id v24 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v21, (uint64_t)v30, v22, v23);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1B2E6C120;
  v29[3] = &unk_1E6014078;
  v29[4] = &v37;
  v29[5] = &v31;
  objc_msgSend_streamsChangedWithUpdated_deletes_completion_(v24, v25, (uint64_t)v8, (uint64_t)v9, (uint64_t)v29);

  int v26 = *((unsigned __int8 *)v38 + 24);
  if (a5 && !*((unsigned char *)v38 + 24))
  {
    *a5 = (id) v32[5];
    int v26 = *((unsigned __int8 *)v38 + 24);
  }
  BOOL v27 = v26 != 0;
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v27;
}

- (BOOL)streamUpdatedWithStreamName:(id)a3 isDelete:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_1B2E6BC88;
  uint64_t v33 = sub_1B2E6BC98;
  id v34 = 0;
  id v9 = GDXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_numberWithBool_(NSNumber, v10, v6, v11, v12);
    *(_DWORD *)buf = 138412546;
    id v40 = v8;
    __int16 v41 = 2112;
    uint64_t v42 = v13;
    _os_log_impl(&dword_1B2996000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: streamUpdatedWithStreamName called. %@ %@", buf, 0x16u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B2E6C3EC;
  v24[3] = &unk_1E6013C28;
  id v14 = v8;
  BOOL v28 = v6;
  id v25 = v14;
  int v26 = &v29;
  BOOL v27 = &v35;
  uint64_t v18 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v24, v16, v17);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1B2E6C50C;
  v23[3] = &unk_1E6014078;
  v23[4] = &v35;
  v23[5] = &v29;
  objc_msgSend_streamUpdatedWithStreamName_isDelete_completion_(v18, v19, (uint64_t)v14, v6, (uint64_t)v23);

  int v20 = *((unsigned __int8 *)v36 + 24);
  if (a5 && !*((unsigned char *)v36 + 24))
  {
    *a5 = (id) v30[5];
    int v20 = *((unsigned __int8 *)v36 + 24);
  }
  BOOL v21 = v20 != 0;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

- (BOOL)sourceUpdatedWithSourceType:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1B2E6BC88;
  uint64_t v31 = sub_1B2E6BC98;
  id v32 = 0;
  v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: sourceUpdatedWithError called. %@ %@", buf, 0x16u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E6C7D4;
  v22[3] = &unk_1E6013E18;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  id v25 = &v27;
  int v26 = &v33;
  uint64_t v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E6C8D0;
  v21[3] = &unk_1E6014078;
  v21[4] = &v33;
  v21[5] = &v27;
  objc_msgSend_sourceUpdatedWithSourceType_sourceIdentifier_completion_(v16, v17, (uint64_t)v11, (uint64_t)v12, (uint64_t)v21);

  int v18 = *((unsigned __int8 *)v34 + 24);
  if (a5 && !*((unsigned char *)v34 + 24))
  {
    *a5 = (id) v28[5];
    int v18 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v19 = v18 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (BOOL)graphUpdatedWithSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1B2E6BC88;
  id v24 = sub_1B2E6BC98;
  id v25 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: graphUpdatedWithError called.", buf, 2u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E6CB0C;
  v18[3] = &unk_1E6014050;
  v18[4] = &v20;
  v18[5] = &v26;
  id v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E6CBF0;
  v17[3] = &unk_1E6014078;
  v17[4] = &v26;
  v17[5] = &v20;
  objc_msgSend_graphUpdatedWithSource_completion_(v11, v12, (uint64_t)v6, (uint64_t)v17, v13);

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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCCoordinationService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.Coordination", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1E50, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E6CDFC;
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
  v6.super_class = (Class)GDXPCCoordinationService;
  [(GDXPCCoordinationService *)&v6 dealloc];
}

- (GDXPCCoordinationService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCCoordinationService;
  v5 = [(GDXPCCoordinationService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B26E58, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end