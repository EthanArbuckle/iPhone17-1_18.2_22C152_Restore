@interface MTRDiagnosticLogsDownloader
- (BDXTransferServerDelegate)getBridge;
- (DiagnosticLogsDownloaderBridge)bridge;
- (MTRDiagnosticLogsDownloader)init;
- (MTRDownloads)downloads;
- (void)abortDownloadsForController:(id)a3;
- (void)dealloc;
- (void)downloadLogFromNodeWithID:(id)a3 controller:(id)a4 type:(int64_t)a5 timeout:(double)a6 queue:(id)a7 completion:(id)a8;
- (void)handleBDXTransferSessionBeginForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 completion:(id)a6 abortHandler:(id)a7;
- (void)handleBDXTransferSessionDataForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 data:(id)a6 completion:(id)a7;
- (void)handleBDXTransferSessionEndForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 error:(id)a6;
- (void)setDownloads:(id)a3;
@end

@implementation MTRDiagnosticLogsDownloader

- (MTRDiagnosticLogsDownloader)init
{
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 384);
  v7.receiver = self;
  v7.super_class = (Class)MTRDiagnosticLogsDownloader;
  v3 = [(MTRDiagnosticLogsDownloader *)&v7 init];
  if (v3)
  {
    v4 = objc_alloc_init(MTRDownloads);
    downloads = v3->_downloads;
    v3->_downloads = v4;

    operator new();
  }
  return 0;
}

- (void)dealloc
{
  bridge = self->_bridge;
  if (bridge)
  {
    (*((void (**)(DiagnosticLogsDownloaderBridge *, SEL))bridge->var0 + 1))(bridge, a2);
    self->_bridge = 0;
  }
  downloads = self->_downloads;
  self->_downloads = 0;

  v5.receiver = self;
  v5.super_class = (Class)MTRDiagnosticLogsDownloader;
  [(MTRDiagnosticLogsDownloader *)&v5 dealloc];
}

- (BDXTransferServerDelegate)getBridge
{
  return (BDXTransferServerDelegate *)self->_bridge;
}

- (void)downloadLogFromNodeWithID:(id)a3 controller:(id)a4 type:(int64_t)a5 timeout:(double)a6 queue:(id)a7 completion:(id)a8
{
  id v55 = a3;
  id v14 = a4;
  v15 = a7;
  id v16 = a8;
  v54 = v16;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 418);
  if (a6 <= 0.0)
  {
    unsigned int v18 = 0;
  }
  else if (a6 <= 65535.0)
  {
    unsigned int v18 = (int)a6;
  }
  else
  {
    v17 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "Warning: timeout is too large. It will be truncated to UINT16_MAX.", buf, 2u);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
    unsigned int v18 = 0xFFFF;
  }
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = sub_2447A6AA8;
  v65[3] = &unk_265194DD8;
  id v19 = v14;
  id v66 = v19;
  v67 = self;
  __int16 v68 = v18;
  v56 = (void *)MEMORY[0x2456969D0](v65);
  v20 = NSNumber;
  uint64_t v23 = objc_msgSend_fabricIndex(v19, v21, v22);
  v25 = objc_msgSend_numberWithUnsignedChar_(v20, v24, v23);
  v26 = v55;
  v28 = objc_msgSend_add_fabricIndex_nodeID_queue_completion_done_(self->_downloads, v27, a5, v25, v55, v15, v16, v56);
  v29 = v28;
  if (v28)
  {
    id v51 = v14;
    v53 = v15;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = sub_2447A6CE0;
    v61[3] = &unk_265194E28;
    id v30 = v28;
    id v62 = v30;
    v52 = (void *)MEMORY[0x2456969D0](v61);
    v32 = objc_msgSend_deviceWithNodeID_controller_(MTRDevice, v31, (uint64_t)v55, v19, v51);
    v33 = [MTRClusterDiagnosticLogs alloc];
    v35 = objc_msgSend_initWithDevice_endpointID_queue_(v33, v34, (uint64_t)v32, &unk_26F9C8608, v15);
    v36 = objc_alloc_init(MTRDiagnosticLogsClusterRetrieveLogsRequestParams);
    v38 = objc_msgSend_numberWithInteger_(NSNumber, v37, a5);
    objc_msgSend_setIntent_(v36, v39, (uint64_t)v38);

    objc_msgSend_setRequestedProtocol_(v36, v40, (uint64_t)&unk_26F9C85F0);
    v43 = objc_msgSend_fileDesignator(v30, v41, v42);
    objc_msgSend_setTransferFileDesignator_(v36, v44, (uint64_t)v43);

    uint64_t LogsRequestWithParams_expectedValues_expectedValueInterval_completion = objc_msgSend_retrieveLogsRequestWithParams_expectedValues_expectedValueInterval_completion_(v35, v45, (uint64_t)v36, 0, 0, v52);
    if (v18)
    {
      memset(buf, 0, sizeof(buf));
      uint64_t v60 = 0;
      sub_2447A6CF0(LogsRequestWithParams_expectedValues_expectedValueInterval_completion, v30, v18);
      if (*(_DWORD *)buf)
      {
        long long v57 = *(_OWORD *)buf;
        uint64_t v58 = v60;
        v47 = sub_244B26908((uint64_t)MTRError, &v57);
        objc_msgSend_failure_(v30, v48, (uint64_t)v47);
      }
    }
    v49 = &v62;

    v50 = v54;
    v26 = v55;
    v15 = v53;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2447A6C58;
    block[3] = &unk_265194E00;
    v49 = &v64;
    v50 = v54;
    id v64 = v54;
    dispatch_async(v15, block);
  }
}

- (void)abortDownloadsForController:(id)a3
{
  id v5 = a3;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 468);
  objc_msgSend_abortDownloadsForController_(self->_downloads, v4, (uint64_t)v5);
}

- (void)handleBDXTransferSessionBeginForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 completion:(id)a6 abortHandler:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, void))a6;
  id v16 = a7;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 479);
  v17 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v12;
    _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "BDX Transfer Session Begin for log download: %@", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    id v23 = v12;
    sub_244CC4DE0(0, 2);
  }
  id v19 = objc_msgSend_get_fabricIndex_nodeID_(self->_downloads, v18, (uint64_t)v12, v13, v14, v23);
  v21 = v19;
  if (v19)
  {
    objc_msgSend_setAbortHandler_(v19, v20, (uint64_t)v16);
    v15[2](v15, 0);
  }
  else
  {
    LODWORD(v24) = 216;
    *((void *)&v24 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDiagnosticLogsDownloader.mm";
    int v25 = 483;
    uint64_t v22 = sub_244B26908((uint64_t)MTRError, &v24);
    ((void (**)(id, void *))v15)[2](v15, v22);
  }
}

- (void)handleBDXTransferSessionDataForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 data:(id)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void))a7;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 495);
  v17 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_DEFAULT, "BDX Transfer Session Data for log download: %@: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    id v23 = v12;
    id v24 = v15;
    sub_244CC4DE0(0, 2);
  }
  id v19 = objc_msgSend_get_fabricIndex_nodeID_(self->_downloads, v18, (uint64_t)v12, v13, v14, v23, v24);
  v21 = v19;
  if (v19)
  {
    id v25 = 0;
    objc_msgSend_writeToFile_error_(v19, v20, (uint64_t)v15, &v25);
    id v22 = v25;
    v16[2](v16, 0);
  }
  else
  {
    LODWORD(v26) = 216;
    *((void *)&v26 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRDiagnosticLogsDownloader.mm";
    int v27 = 499;
    sub_244B26908((uint64_t)MTRError, &v26);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id))v16)[2](v16, v22);
  }
}

- (void)handleBDXTransferSessionEndForFileDesignator:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5 error:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 513);
  id v14 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_DEFAULT, "BDX Transfer Session End for log download: %@: %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    id v20 = v10;
    id v21 = v13;
    sub_244CC4DE0(0, 2);
  }
  id v16 = objc_msgSend_get_fabricIndex_nodeID_(self->_downloads, v15, (uint64_t)v10, v11, v12, v20, v21);
  id v19 = v16;
  if (v16)
  {
    if (v13) {
      objc_msgSend_failure_(v16, v17, (uint64_t)v13);
    }
    else {
      objc_msgSend_success(v16, v17, v18);
    }
  }
}

- (DiagnosticLogsDownloaderBridge)bridge
{
  return self->_bridge;
}

- (MTRDownloads)downloads
{
  return self->_downloads;
}

- (void)setDownloads:(id)a3
{
}

- (void).cxx_destruct
{
}

@end