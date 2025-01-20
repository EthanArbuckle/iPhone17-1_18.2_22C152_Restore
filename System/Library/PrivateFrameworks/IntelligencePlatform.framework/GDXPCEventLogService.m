@interface GDXPCEventLogService
- (BOOL)logEndWithId:(int64_t)a3 timestamp:(id)a4 dependencies:(id)a5 payloadType:(id)a6 payloadVariant:(id)a7 payload:(id)a8 error:(id *)a9;
- (BOOL)logInstantWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 dependencies:(id)a7 payloadType:(id)a8 payloadVariant:(id)a9 payload:(id)a10 error:(id *)a11;
- (BOOL)logStartWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 error:(id *)a7;
- (GDXPCEventLogService)init;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCEventLogService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)logInstantWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 dependencies:(id)a7 payloadType:(id)a8 payloadVariant:(id)a9 payload:(id)a10 error:(id *)a11
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1B2E6E5B4;
  v39 = sub_1B2E6E5C4;
  id v40 = 0;
  v22 = GDXPCLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v22, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: logInstantWithId called.", buf, 2u);
  }

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1B2E6E5CC;
  v33[3] = &unk_1E60140A0;
  v33[4] = &v35;
  v26 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v23, (uint64_t)v33, v24, v25);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1B2E6E698;
  v32[3] = &unk_1E6013CD0;
  v32[4] = &v35;
  objc_msgSend_logInstantWithId_timestamp_name_parent_dependencies_payloadType_payloadVariant_payload_completion_(v26, v27, a3, (uint64_t)v16, (uint64_t)v17, a6, v18, v19, v20, v21, v32);

  if (a11 && (v28 = (void *)v36[5]) != 0)
  {
    BOOL v29 = 0;
    *a11 = v28;
  }
  else
  {
    BOOL v29 = 1;
  }
  _Block_object_dispose(&v35, 8);

  return v29;
}

- (BOOL)logEndWithId:(int64_t)a3 timestamp:(id)a4 dependencies:(id)a5 payloadType:(id)a6 payloadVariant:(id)a7 payload:(id)a8 error:(id *)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_1B2E6E5B4;
  v36 = sub_1B2E6E5C4;
  id v37 = 0;
  id v20 = GDXPCLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v20, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: logEndWithId called.", buf, 2u);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1B2E6E8E8;
  v30[3] = &unk_1E60140A0;
  v30[4] = &v32;
  uint64_t v24 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v21, (uint64_t)v30, v22, v23);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1B2E6E9B4;
  v29[3] = &unk_1E6013CD0;
  v29[4] = &v32;
  objc_msgSend_logEndWithId_timestamp_dependencies_payloadType_payloadVariant_payload_completion_(v24, v25, a3, (uint64_t)v15, (uint64_t)v16, v17, v18, v19, v29);

  if (a9 && (v26 = (void *)v33[5]) != 0)
  {
    BOOL v27 = 0;
    *a9 = v26;
  }
  else
  {
    BOOL v27 = 1;
  }
  _Block_object_dispose(&v32, 8);

  return v27;
}

- (BOOL)logStartWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v26 = 0;
  BOOL v27 = &v26;
  uint64_t v28 = 0x3032000000;
  BOOL v29 = sub_1B2E6E5B4;
  v30 = sub_1B2E6E5C4;
  id v31 = 0;
  v14 = GDXPCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v14, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: logStartWithId called.", buf, 2u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B2E6EBC8;
  v24[3] = &unk_1E60140A0;
  v24[4] = &v26;
  id v18 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v24, v16, v17);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1B2E6EC94;
  v23[3] = &unk_1E6013CD0;
  v23[4] = &v26;
  objc_msgSend_logStartWithId_timestamp_name_parent_completion_(v18, v19, a3, (uint64_t)v12, (uint64_t)v13, a6, v23);

  if (a7 && (id v20 = (void *)v27[5]) != 0)
  {
    BOOL v21 = 0;
    *a7 = v20;
  }
  else
  {
    BOOL v21 = 1;
  }
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_locked_establishConnection(v5, v6, v7, v8, v9);
  id v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5->_connection, v10, (uint64_t)v4, v11, v12);
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCEventLogService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.EventLog", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1E90, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E6EE94;
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
  v6.super_class = (Class)GDXPCEventLogService;
  [(GDXPCEventLogService *)&v6 dealloc];
}

- (GDXPCEventLogService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCEventLogService;
  v5 = [(GDXPCEventLogService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B26F18, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end