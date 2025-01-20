@interface LBFBiomeManager
- (BMSource)biomeSource;
- (BMStream)biomeStream;
- (BOOL)enumerateData:(id)a3 endDate:(id)a4 reversed:(BOOL)a5 shouldContinue:(id)a6;
- (BOOL)writeData:(id)a3;
- (id)init:(id)a3;
- (id)readData:(id)a3 endDate:(id)a4;
- (void)setBiomeSource:(id)a3;
@end

@implementation LBFBiomeManager

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LBFBiomeManager;
  v6 = [(LBFBiomeManager *)&v9 init];
  if (v6)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_biomeStream, a3);
    biomeSource = v6->_biomeSource;
    v6->_biomeSource = 0;
  }
  return v6;
}

- (BOOL)writeData:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25455B134;
  block[3] = &unk_2653ADD08;
  block[4] = self;
  if (onceTokenBiomeSource != -1) {
    dispatch_once(&onceTokenBiomeSource, block);
  }
  id v5 = self->_biomeSource;
  objc_sync_enter(v5);
  objc_msgSend_sendEvent_(self->_biomeSource, v6, (uint64_t)v4, v7, v8);
  objc_sync_exit(v5);

  return 1;
}

- (id)readData:(id)a3 endDate:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)LBFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = v8;
    objc_msgSend_timeIntervalSince1970(v6, v10, v11, v12, v13);
    uint64_t v15 = v14;
    objc_msgSend_timeIntervalSince1970(v7, v16, v17, v18, v19);
    *(_DWORD *)buf = 134218240;
    uint64_t v47 = v15;
    __int16 v48 = 2048;
    uint64_t v49 = v20;
    _os_log_impl(&dword_254547000, v9, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);
  }
  id v21 = objc_alloc(MEMORY[0x263F2A8B0]);
  started = objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v21, v22, (uint64_t)v6, (uint64_t)v7, -1, -1, 0);
  v27 = objc_msgSend_publisherWithOptions_(self->_biomeStream, v24, (uint64_t)started, v25, v26);
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = sub_25455B3E8;
  v44[3] = &unk_2653ADD30;
  id v45 = v28;
  uint64_t v39 = MEMORY[0x263EF8330];
  uint64_t v40 = 3221225472;
  v41 = sub_25455B4A4;
  v42 = &unk_2653ADD58;
  id v43 = v45;
  id v29 = v45;
  id v32 = (id)objc_msgSend_sinkWithCompletion_receiveInput_(v27, v30, (uint64_t)v44, (uint64_t)&v39, v31);
  id v33 = objc_alloc(MEMORY[0x263EFF8C0]);
  v37 = objc_msgSend_initWithArray_(v33, v34, (uint64_t)v29, v35, v36, v39, v40, v41, v42);

  return v37;
}

- (BOOL)enumerateData:(id)a3 endDate:(id)a4 reversed:(BOOL)a5 shouldContinue:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  uint64_t v11 = (objc_class *)MEMORY[0x263F2A8B0];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 alloc];
  started = objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v14, v15, (uint64_t)v13, (uint64_t)v12, -1, -1, v6);

  uint64_t v20 = objc_msgSend_publisherWithOptions_(self->_biomeStream, v17, (uint64_t)started, v18, v19);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_25455B68C;
  v26[3] = &unk_2653ADDA0;
  id v27 = v10;
  id v21 = v10;
  id v24 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v20, v22, (uint64_t)&unk_2703DD278, (uint64_t)v26, v23);

  return 1;
}

- (BMStream)biomeStream
{
  return self->_biomeStream;
}

- (BMSource)biomeSource
{
  return self->_biomeSource;
}

- (void)setBiomeSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSource, 0);
  objc_storeStrong((id *)&self->_biomeStream, 0);
}

@end