@interface GDXPCGraphSimulationService
- (BOOL)mockTripleEntityTaggingWithContactId:(id)a3 inferredRelationshipLabel:(id)a4 error:(id *)a5;
- (GDXPCGraphSimulationService)init;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCGraphSimulationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)mockTripleEntityTaggingWithContactId:(id)a3 inferredRelationshipLabel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1B2E6F9F8;
  v30 = sub_1B2E6FA08;
  id v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCGraphSimulationService: mock triples for entity tagging called.", buf, 2u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E6FA10;
  v20[3] = &unk_1E6014050;
  v20[4] = &v26;
  v20[5] = &v22;
  v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v20, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E6FAF4;
  v19[3] = &unk_1E6014078;
  v19[4] = &v22;
  v19[5] = &v26;
  objc_msgSend_mockTripleEntityTaggingWithContactId_inferredRelationshipLabel_completion_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v19);

  int v16 = *((unsigned __int8 *)v23 + 24);
  if (a5 && !*((unsigned char *)v23 + 24))
  {
    *a5 = (id) v27[5];
    int v16 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v17 = v16 != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCGraphSimulationService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.KGSimulation", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1ED0, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E6FD00;
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
  v6.super_class = (Class)GDXPCGraphSimulationService;
  [(GDXPCGraphSimulationService *)&v6 dealloc];
}

- (GDXPCGraphSimulationService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCGraphSimulationService;
  v5 = [(GDXPCGraphSimulationService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B26FD8, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end