@interface GDXPCKnosisService
- (BOOL)iteratingExecuteKGQ:(id)a3 error:(id *)a4 block:(id)a5;
- (GDXPCKnosisService)init;
- (id)executeIntent:(id)a3 error:(id *)a4;
- (id)executeKGQ:(id)a3 error:(id *)a4;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCKnosisService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)executeIntent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E7A158;
  v29 = sub_1B2E7A168;
  id v30 = 0;
  v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: executeIntent called.", buf, 2u);
  }

  *(void *)buf = 0;
  v20 = buf;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E7A158;
  v23 = sub_1B2E7A168;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E7A170;
  v18[3] = &unk_1E60140A0;
  v18[4] = buf;
  v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7A23C;
  v17[3] = &unk_1E6013F40;
  v17[4] = &v25;
  v17[5] = buf;
  objc_msgSend_executeIntent_withCompletion_(v11, v12, (uint64_t)v6, (uint64_t)v17, v13);

  v14 = (void *)v26[5];
  if (a4 && !v14)
  {
    *a4 = *((id *)v20 + 5);
    v14 = (void *)v26[5];
  }
  id v15 = v14;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v25, 8);

  return v15;
}

- (BOOL)iteratingExecuteKGQ:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v38 = a5;
  v8 = GDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v8, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: iteratingExecuteKGQ called.", buf, 2u);
  }
  oslog = v8;

  *(void *)buf = 0;
  v73 = buf;
  uint64_t v74 = 0x3032000000;
  v75 = sub_1B2E7A158;
  v76 = sub_1B2E7A168;
  id v77 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 1;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_1B2E7A158;
  v66 = sub_1B2E7A168;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_1B2E7A158;
  v60 = sub_1B2E7A168;
  id v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_1B2E7A744;
  v47[3] = &unk_1E6013EF0;
  v47[4] = buf;
  v47[5] = &v52;
  v47[6] = &v48;
  v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v47, v10, v11);
  while (*((unsigned char *)v69 + 24))
  {
    if (*((unsigned char *)v53 + 24)) {
      break;
    }
    if (*((void *)v73 + 5)) {
      break;
    }
    v17 = NSNumber;
    uint64_t v18 = objc_msgSend_longValue((void *)v63[5], v12, v13, v14, v15);
    uint64_t v23 = objc_msgSend_longValue((void *)v57[5], v19, v20, v21, v22);
    uint64_t v27 = objc_msgSend_numberWithLong_(v17, v24, v23 + v18, v25, v26);
    objc_msgSend_setOffset_(v7, v28, (uint64_t)v27, v29, v30);

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1B2E7A838;
    v39[3] = &unk_1E6013F18;
    v41 = buf;
    v42 = &v52;
    v43 = &v48;
    v44 = &v68;
    v45 = &v62;
    v46 = &v56;
    id v40 = v38;
    objc_msgSend_executeKGQ_withCompletion_(v16, v31, (uint64_t)v7, (uint64_t)v39, v32);
  }
  int v33 = *((unsigned __int8 *)v49 + 24);
  if (*((unsigned char *)v49 + 24))
  {
    if (a4) {
      *a4 = *((id *)v73 + 5);
    }
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = *((void *)v73 + 5);
      *(_DWORD *)v78 = 138412290;
      uint64_t v79 = v35;
      _os_log_error_impl(&dword_1B2996000, oslog, OS_LOG_TYPE_ERROR, "GDXPCKnosisService: error during iteratingExecuteKGQ call: %@", v78, 0xCu);
    }
  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(buf, 8);

  return v33 == 0;
}

- (id)executeKGQ:(id)a3 error:(id *)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: executeKgqQuery called.", buf, 2u);
  }

  if (a4) {
    *a4 = 0;
  }
  *(void *)buf = 0;
  uint64_t v74 = buf;
  uint64_t v75 = 0x3032000000;
  v76 = sub_1B2E7A158;
  id v77 = sub_1B2E7A168;
  v78 = &stru_1F0AE2ED0;
  uint64_t v67 = 0;
  uint64_t v68 = &v67;
  uint64_t v69 = 0x3032000000;
  uint64_t v70 = sub_1B2E7A158;
  char v71 = sub_1B2E7A168;
  v72 = &stru_1F0AE2ED0;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  uint64_t v64 = sub_1B2E7A158;
  v65 = sub_1B2E7A168;
  id v66 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  uint64_t v56 = 0;
  v12 = objc_msgSend_limit(v6, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_integerValue(v12, v13, v14, v15, v16);

  uint64_t v56 = v17;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = sub_1B2E7A158;
  v53 = sub_1B2E7A168;
  id v54 = 0;
  uint64_t v22 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21);
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  id v40 = sub_1B2E7ADB0;
  v41 = &unk_1E6013EC8;
  v43 = &v67;
  v44 = buf;
  v45 = &v57;
  v46 = &v49;
  v47 = &v61;
  id v23 = v22;
  id v42 = v23;
  uint64_t v48 = v55;
  if (objc_msgSend_iteratingExecuteKGQ_error_block_(self, v24, (uint64_t)v6, (uint64_t)a4, (uint64_t)&v38))
  {
    uint64_t v25 = [GDKnosisResult alloc];
    uint64_t v26 = *((void *)v74 + 5);
    uint64_t v27 = v68[5];
    uint64_t v28 = v58[3];
    uint64_t v29 = v62[5];
    id v7 = objc_msgSend_limit(v6, v30, v31, v32, v33);
    hasMoreAnswers_debug = objc_msgSend_initWithQuery_kgq_status_answers_errorMessage_limit_offset_hasMoreAnswers_debug_(v25, v34, v26, v27, v28, v23, v29, v7, &unk_1F0B107C0, 0, v50[5], v38, v39, v40, v41);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v37 = *a4;
      }
      else {
        id v37 = 0;
      }
      *(_DWORD *)uint64_t v79 = 138412290;
      id v80 = v37;
      _os_log_error_impl(&dword_1B2996000, v7, OS_LOG_TYPE_ERROR, "GDXPCKnosisService: error during ExecuteKGQ call: %@", v79, 0xCu);
    }
    hasMoreAnswers_debug = 0;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(buf, 8);

  return hasMoreAnswers_debug;
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
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.Knosis", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1F50, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E7B1B4;
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
  v6.super_class = (Class)GDXPCKnosisService;
  [(GDXPCKnosisService *)&v6 dealloc];
}

- (GDXPCKnosisService)init
{
  v9.receiver = self;
  v9.super_class = (Class)GDXPCKnosisService;
  v5 = [(GDXPCKnosisService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B27158, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;
  }
  return v5;
}

@end