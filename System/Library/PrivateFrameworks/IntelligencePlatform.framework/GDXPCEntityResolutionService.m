@interface GDXPCEntityResolutionService
- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4;
- (GDXPCEntityResolutionService)init;
- (id)generateMentionsForQuery:(id)a3 error:(id *)a4;
- (id)submitCollectionQuery:(id)a3 withError:(id *)a4;
- (id)submitQuery:(id)a3 withError:(id *)a4;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCEntityResolutionService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    *(void *)v26 = 0;
    v27 = v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_1B2E6D2B4;
    v30 = sub_1B2E6D2C4;
    id v31 = 0;
    v7 = GDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: generateMentionsForQuery called.", buf, 2u);
    }

    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1B2E6D2B4;
    v24 = sub_1B2E6D2C4;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B2E6D2CC;
    v19[3] = &unk_1E60140A0;
    v19[4] = buf;
    v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v19, v9, v10);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B2E6D398;
    v18[3] = &unk_1E6013C88;
    v18[4] = v26;
    v18[5] = buf;
    objc_msgSend_generateMentionsForQuery_withCompletion_(v11, v12, (uint64_t)v6, (uint64_t)v18, v13);

    v14 = (void *)*((void *)v27 + 5);
    if (a4 && !v14)
    {
      *a4 = *((id *)v21 + 5);
      v14 = (void *)*((void *)v27 + 5);
    }
    id v15 = v14;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v26, 8);
  }
  else
  {
    v16 = GDXPCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1B2996000, v16, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v26, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

- (id)submitCollectionQuery:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    *(void *)v26 = 0;
    v27 = v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_1B2E6D2B4;
    v30 = sub_1B2E6D2C4;
    id v31 = 0;
    v7 = GDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: submitCollectionQuery called.", buf, 2u);
    }

    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1B2E6D2B4;
    v24 = sub_1B2E6D2C4;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B2E6D6C8;
    v19[3] = &unk_1E60140A0;
    v19[4] = buf;
    v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v19, v9, v10);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B2E6D794;
    v18[3] = &unk_1E6013C60;
    v18[4] = v26;
    v18[5] = buf;
    objc_msgSend_submitCollectionQuery_withCompletion_(v11, v12, (uint64_t)v6, (uint64_t)v18, v13);

    v14 = (void *)*((void *)v27 + 5);
    if (a4 && !v14)
    {
      *a4 = *((id *)v21 + 5);
      v14 = (void *)*((void *)v27 + 5);
    }
    id v15 = v14;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v26, 8);
  }
  else
  {
    v16 = GDXPCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1B2996000, v16, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v26, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

- (id)submitQuery:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    *(void *)v26 = 0;
    v27 = v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_1B2E6D2B4;
    v30 = sub_1B2E6D2C4;
    id v31 = 0;
    v7 = GDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: submitQuery called.", buf, 2u);
    }

    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1B2E6D2B4;
    v24 = sub_1B2E6D2C4;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B2E6DAC4;
    v19[3] = &unk_1E60140A0;
    v19[4] = buf;
    v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v19, v9, v10);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B2E6DB90;
    v18[3] = &unk_1E6013D78;
    v18[4] = v26;
    v18[5] = buf;
    objc_msgSend_submitQuery_withCompletion_(v11, v12, (uint64_t)v6, (uint64_t)v18, v13);

    v14 = (void *)*((void *)v27 + 5);
    if (a4 && !v14)
    {
      *a4 = *((id *)v21 + 5);
      v14 = (void *)*((void *)v27 + 5);
    }
    id v15 = v14;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v26, 8);
  }
  else
  {
    v16 = GDXPCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1B2996000, v16, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v26, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v7 = GDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: warmup called.", buf, 2u);
    }

    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1B2E6D2B4;
    v24 = sub_1B2E6D2C4;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B2E6DE7C;
    v19[3] = &unk_1E60140A0;
    v19[4] = buf;
    v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v19, v9, v10);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B2E6DF48;
    v18[3] = &unk_1E6014078;
    v18[4] = &v26;
    v18[5] = buf;
    objc_msgSend_warmupForMode_withCompletion_(v11, v12, a3, (uint64_t)v18, v13);

    int v14 = *((unsigned __int8 *)v27 + 24);
    if (a4 && !*((unsigned char *)v27 + 24))
    {
      *a4 = *((id *)v21 + 5);
      int v14 = *((unsigned __int8 *)v27 + 24);
    }
    BOOL v15 = v14 != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v16 = GDXPCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v16, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", buf, 2u);
    }

    return 0;
  }
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCEntityResolutionService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.EntityResolution", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1E70, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E6E154;
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
  v6.super_class = (Class)GDXPCEntityResolutionService;
  [(GDXPCEntityResolutionService *)&v6 dealloc];
}

- (GDXPCEntityResolutionService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCEntityResolutionService;
  v5 = [(GDXPCEntityResolutionService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B26EB8, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end