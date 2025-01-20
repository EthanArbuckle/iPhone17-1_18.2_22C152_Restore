@interface GDXPCAssetRegistryService
- (GDXPCAssetRegistryService)init;
- (id)assetEntryResultDataForAssetId:(id)a3 inDomainId:(id)a4 remoteOptionsData:(id)a5 error:(id *)a6;
- (id)overrideAssetEntryForAssetId:(id)a3 inDomainId:(id)a4 overrideAssetEntryParametersData:(id)a5 error:(id *)a6;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCAssetRegistryService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)overrideAssetEntryForAssetId:(id)a3 inDomainId:(id)a4 overrideAssetEntryParametersData:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1B2E6B150;
  v35 = sub_1B2E6B160;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E6B150;
  v29 = sub_1B2E6B160;
  id v30 = 0;
  v13 = GDXPCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCAssetRegistryService: overrideAssetEntryForAssetId called.", buf, 2u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1B2E6B168;
  v23[3] = &unk_1E60140A0;
  v23[4] = &v25;
  v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E6B234;
  v22[3] = &unk_1E6013E40;
  v22[4] = &v31;
  v22[5] = &v25;
  objc_msgSend_overrideAssetEntryForAssetId_inDomainId_overrideAssetEntryParametersData_completion_(v17, v18, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v22);

  v19 = (void *)v32[5];
  if (a6 && !v19)
  {
    *a6 = (id) v26[5];
    v19 = (void *)v32[5];
  }
  id v20 = v19;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);

  return v20;
}

- (id)assetEntryResultDataForAssetId:(id)a3 inDomainId:(id)a4 remoteOptionsData:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1B2E6B150;
  v35 = sub_1B2E6B160;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E6B150;
  v29 = sub_1B2E6B160;
  id v30 = 0;
  v13 = GDXPCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCAssetRegistryService: assetEntryDataForAssetId called.", buf, 2u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1B2E6B534;
  v23[3] = &unk_1E60140A0;
  v23[4] = &v25;
  v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E6B600;
  v22[3] = &unk_1E6013E40;
  v22[4] = &v31;
  v22[5] = &v25;
  objc_msgSend_assetEntryResultDataForAssetId_inDomainId_remoteOptionsData_completion_(v17, v18, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v22);

  v19 = (void *)v32[5];
  if (a6 && !v19)
  {
    *a6 = (id) v26[5];
    v19 = (void *)v32[5];
  }
  id v20 = v19;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);

  return v20;
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCAssetRegistryService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.AssetRegistry", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1E30, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E6B874;
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
  v6.super_class = (Class)GDXPCAssetRegistryService;
  [(GDXPCAssetRegistryService *)&v6 dealloc];
}

- (GDXPCAssetRegistryService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCAssetRegistryService;
  v5 = [(GDXPCAssetRegistryService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B26DF8, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end