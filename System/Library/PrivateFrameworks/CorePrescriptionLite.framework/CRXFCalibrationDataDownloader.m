@interface CRXFCalibrationDataDownloader
- (CRXFCalibrationDataDownloader)initWithServer:(unint64_t)a3 serverVersion:(id)a4 timeout:(double)a5;
- (double)timeout;
- (unint64_t)addDownloadWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)downloadCalibrationDataForACCPayload:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)downloadCalibrationDataForASAKey:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)fetchUserInfoWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)finishDownloadWithID:(unint64_t)a3 data:(id)a4 error:(id)a5;
@end

@implementation CRXFCalibrationDataDownloader

- (CRXFCalibrationDataDownloader)initWithServer:(unint64_t)a3 serverVersion:(id)a4 timeout:(double)a5
{
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CRXFCalibrationDataDownloader;
  v9 = [(CRXFCalibrationDataDownloader *)&v25 init];
  if (!v9) {
    goto LABEL_10;
  }
  os_log_t v10 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
  log = v9->_log;
  v9->_log = (OS_os_log *)v10;

  v9->_timeout = a5;
  uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  downloads = v9->_downloads;
  v9->_downloads = (NSMutableDictionary *)v12;

  v14 = [[CRXFServiceConnection alloc] initWithServiceName:@"com.apple.CorePrescription.CalibrationDataFetcher" protocol:&unk_26FED3060];
  connection = v9->_connection;
  v9->_connection = v14;

  v9->_nextDownloadID = 0;
  v16 = [MEMORY[0x263EFF9A0] dictionary];
  v17 = v16;
  if (a3 == 1)
  {
    v18 = &unk_26FECDE88;
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    v18 = &unk_26FECDEA0;
LABEL_6:
    [v16 setObject:v18 forKeyedSubscript:@"environment"];
  }
  if (v8)
  {
    v19 = (void *)[v8 copy];
    [v17 setObject:v19 forKeyedSubscript:@"version"];
  }
  uint64_t v20 = [NSDictionary dictionaryWithDictionary:v17];
  fetchOptions = v9->_fetchOptions;
  v9->_fetchOptions = (NSDictionary *)v20;

  uint64_t v22 = +[CRXUNetworkReachability sharedInstance];
  networkReachability = v9->_networkReachability;
  v9->_networkReachability = (CRXUNetworkReachability *)v22;

LABEL_10:
  return v9;
}

- (void)dealloc
{
  [(CRXFServiceConnection *)self->_connection forceInvalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRXFCalibrationDataDownloader;
  [(CRXFCalibrationDataDownloader *)&v3 dealloc];
}

- (double)timeout
{
  return self->_timeout;
}

- (void)downloadCalibrationDataForACCPayload:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = +[CRXUDispatchQueue main];
  }
  if ([(CRXUNetworkReachability *)self->_networkReachability isConnected])
  {
    id v11 = +[CRXFAppClipCodeTranscoder sharedInstance];
    uint64_t v12 = [v11 derivePayloadWithSoftwareBitsZeroedFromPayload:v8];
    if (v12)
    {
      unint64_t v13 = [(CRXFCalibrationDataDownloader *)self addDownloadWithCompletionQueue:v9 completion:v10];
      kdebug_trace();
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:]();
      }
      v14 = [(CRXFServiceConnection *)self->_connection activate];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_119;
      v32[3] = &unk_2652E18D8;
      v32[4] = self;
      v32[5] = v13;
      objc_super v25 = v14;
      v15 = [v14 remoteObjectProxyWithErrorHandler:v32];
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v17 = NSNumber;
        v18 = log;
        v19 = [v17 numberWithUnsignedInteger:v13];
        *(_DWORD *)buf = 136315650;
        v40 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:]";
        __int16 v41 = 1024;
        int v42 = 338;
        __int16 v43 = 2114;
        v44 = v19;
        _os_log_impl(&dword_24C484000, v18, OS_LOG_TYPE_INFO, "%s @%d: Starting XPC call for downloadID %{public}@", buf, 0x1Cu);
      }
      fetchOptions = self->_fetchOptions;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_122;
      v26[3] = &unk_2652E1928;
      v26[4] = self;
      unint64_t v31 = v13;
      id v27 = v8;
      id v28 = v11;
      id v29 = v12;
      id v30 = v15;
      id v21 = v15;
      [v21 fetchAccessoryDataByACC:v29 options:fetchOptions withReply:v26];

      id v22 = v25;
    }
    else
    {
      v24 = objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 32, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 315, MEMORY[0x263EFFA78]);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_2;
      v33[3] = &unk_2652E18B0;
      id v34 = v24;
      id v35 = v10;
      id v22 = v24;
      [v9 dispatchAsync:v33];
    }
  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 23, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 303, MEMORY[0x263EFFA78]);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke;
    v36[3] = &unk_2652E18B0;
    id v37 = v23;
    id v38 = v10;
    id v11 = v23;
    [v9 dispatchAsync:v36];

    uint64_t v12 = v38;
  }
}

uint64_t __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0.0);
}

uint64_t __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0.0);
}

void __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_119(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
    __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_119_cold_1();
  }
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  [*(id *)(a1 + 32) finishDownloadWithID:*(void *)(a1 + 40) data:0 error:v3];
}

void __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_122(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  kdebug_trace();
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSNumber;
    uint64_t v12 = *(void *)(a1 + 72);
    unint64_t v13 = v10;
    v14 = [v11 numberWithUnsignedInteger:v12];
    *(_DWORD *)buf = 136315906;
    unint64_t v31 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:]_block_invoke";
    __int16 v32 = 1024;
    int v33 = 347;
    __int16 v34 = 2114;
    id v35 = v14;
    __int16 v36 = 2114;
    id v37 = v9;
    _os_log_impl(&dword_24C484000, v13, OS_LOG_TYPE_INFO, "%s @%d: XPC call completed for downloadID %{public}@ with error %{public}@", buf, 0x26u);
  }
  if (!v9)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
    v15 = [[CRXFCalibrationData alloc] initWithACCPayload:*(void *)(a1 + 40) leftCalibrationData:v7 rightCalibrationData:v8];
    v23 = *(void **)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 72);
    objc_super v25 = v15;
    id v26 = 0;
LABEL_10:
    [v23 finishDownloadWithID:v24 data:v25 error:v26];
    goto LABEL_11;
  }
  v15 = [*(id *)(a1 + 48) derivePayloadWithLensTypeZeroed:*(void *)(a1 + 56) ifLensTypeIs:2];
  uint64_t v16 = *(void *)(a1 + 32);
  if (!v15)
  {
    [*(id *)(v16 + 32) invalidate];
    v23 = *(void **)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 72);
    objc_super v25 = 0;
    id v26 = v9;
    goto LABEL_10;
  }
  v17 = *(NSObject **)(v16 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v31 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:]_block_invoke";
    __int16 v32 = 1024;
    int v33 = 364;
    _os_log_impl(&dword_24C484000, v17, OS_LOG_TYPE_INFO, "%s @%d: Download failed with lens type Developer; retrying with lens type Demo",
      buf,
      0x12u);
  }
  v18 = *(void **)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(v19 + 48);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_124;
  v27[3] = &unk_2652E1900;
  v27[4] = v19;
  id v21 = *(id *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 72);
  id v28 = v21;
  uint64_t v29 = v22;
  [v18 fetchAccessoryDataByACC:v15 options:v20 withReply:v27];

LABEL_11:
}

void __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_124(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = [[CRXFCalibrationData alloc] initWithACCPayload:*(void *)(a1 + 40) leftCalibrationData:v10 rightCalibrationData:v7];
  }
  [*(id *)(a1 + 32) finishDownloadWithID:*(void *)(a1 + 48) data:v9 error:v8];
}

- (void)downloadCalibrationDataForASAKey:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = +[CRXUDispatchQueue main];
  }
  if ([(CRXUNetworkReachability *)self->_networkReachability isConnected])
  {
    unint64_t v11 = [(CRXFCalibrationDataDownloader *)self addDownloadWithCompletionQueue:v9 completion:v10];
    kdebug_trace();
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      -[CRXFCalibrationDataDownloader downloadCalibrationDataForASAKey:completionQueue:completion:]();
    }
    id v12 = [(CRXFServiceConnection *)self->_connection activate];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_126;
    v21[3] = &unk_2652E18D8;
    v21[4] = self;
    v21[5] = v11;
    unint64_t v13 = [v12 remoteObjectProxyWithErrorHandler:v21];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v15 = NSNumber;
      uint64_t v16 = log;
      v17 = [v15 numberWithUnsignedInteger:v11];
      *(_DWORD *)buf = 136315650;
      id v26 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForASAKey:completionQueue:completion:]";
      __int16 v27 = 1024;
      int v28 = 422;
      __int16 v29 = 2114;
      id v30 = v17;
      _os_log_impl(&dword_24C484000, v16, OS_LOG_TYPE_INFO, "%s @%d: Starting XPC call for downloadID %{public}@", buf, 0x1Cu);
    }
    fetchOptions = self->_fetchOptions;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_127;
    v20[3] = &unk_2652E1950;
    v20[4] = self;
    v20[5] = v11;
    [v13 fetchAccessoryDataByFullKey:v8 options:fetchOptions withReply:v20];
  }
  else
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 23, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 400, MEMORY[0x263EFFA78]);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke;
    v22[3] = &unk_2652E18B0;
    id v23 = v19;
    id v24 = v10;
    id v12 = v19;
    [v9 dispatchAsync:v22];
  }
}

uint64_t __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0.0);
}

void __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
    __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_126_cold_1();
  }
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  [*(id *)(a1 + 32) finishDownloadWithID:*(void *)(a1 + 40) data:0 error:v3];
}

void __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_127(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  unint64_t v11 = a4;
  uint64_t v12 = a5;
  kdebug_trace();
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  if (!(v11 | v12))
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 6, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 434, MEMORY[0x263EFFA78]);
  }
  unint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = NSNumber;
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = v13;
    v17 = [v14 numberWithUnsignedInteger:v15];
    int v19 = 136315906;
    uint64_t v20 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForASAKey:completionQueue:completion:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 438;
    __int16 v23 = 2114;
    id v24 = v17;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    _os_log_impl(&dword_24C484000, v16, OS_LOG_TYPE_INFO, "%s @%d: XPC call completed for downloadID %{public}@ with error %{public}@", (uint8_t *)&v19, 0x26u);
  }
  if (v12) {
    v18 = 0;
  }
  else {
    v18 = [[CRXFCalibrationData alloc] initWithACCPayload:v11 leftCalibrationData:v9 rightCalibrationData:v10];
  }
  [*(id *)(a1 + 32) finishDownloadWithID:*(void *)(a1 + 40) data:v18 error:v12];
}

- (void)fetchUserInfoWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[CRXUDispatchQueue main];
  }
  id v8 = [[CRXFFetchUserInfoRequest alloc] initWithTimeout:v6 completionQueue:v7 completion:self->_timeout];
  id v9 = [(CRXFServiceConnection *)self->_connection activate];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke;
  v18[3] = &unk_2652E19A0;
  v18[4] = self;
  id v10 = v6;
  id v19 = v10;
  unint64_t v11 = v8;
  uint64_t v20 = v11;
  uint64_t v12 = [v9 remoteObjectProxyWithErrorHandler:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_2;
  v15[3] = &unk_2652E19F0;
  v15[4] = self;
  id v16 = v10;
  v17 = v11;
  unint64_t v13 = v11;
  id v14 = v10;
  [v12 fetchUserInfoWithReply:v15];
}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
    __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_cold_1();
  }
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_130;
  v6[3] = &unk_2652E1978;
  v4 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = v3;
  id v5 = v3;
  [v4 dispatchAsync:v6];
}

uint64_t __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_130(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithUserInfo:0 error:*(void *)(a1 + 40)];
}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_3;
  v14[3] = &unk_2652E19C8;
  id v15 = v9;
  id v16 = v7;
  id v17 = v8;
  id v10 = *(void **)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  [v10 dispatchAsync:v14];
}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [[CRXFUserInfo alloc] initWithUserID:*(void *)(a1 + 40) firstName:*(void *)(a1 + 48)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v4 = v3;
  [*(id *)(a1 + 56) finishWithUserInfo:v3 error:v2];
}

- (unint64_t)addDownloadWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[CRXFCalibrationDataDownload alloc] initWithTimeout:v6 completionQueue:v7 completion:self->_timeout];
  id v9 = self->_downloads;
  objc_sync_enter(v9);
  unint64_t v10 = self->_nextDownloadID + 1;
  self->_nextDownloadID = v10;
  downloads = self->_downloads;
  id v12 = [NSNumber numberWithUnsignedInteger:v10];
  [(NSMutableDictionary *)downloads setObject:v8 forKeyedSubscript:v12];

  objc_sync_exit(v9);
  return v10;
}

- (void)finishDownloadWithID:(unint64_t)a3 data:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = self->_downloads;
  objc_sync_enter(v10);
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  id v12 = [(NSMutableDictionary *)self->_downloads objectForKeyedSubscript:v11];
  [(NSMutableDictionary *)self->_downloads removeObjectForKey:v11];

  objc_sync_exit(v10);
  if (v12)
  {
    [v12 finishWithData:v8 error:v9];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[CRXFCalibrationDataDownloader finishDownloadWithID:data:error:](log, v12);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)downloadCalibrationDataForACCPayload:completionQueue:completion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136315907;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v2[7] = 327;
  v2[9] = 2113;
  id v3 = @"com.apple.CorePrescription.CalibrationDataFetcher";
  __int16 v4 = 2113;
  uint64_t v5 = v0;
  _os_log_debug_impl(&dword_24C484000, v1, OS_LOG_TYPE_DEBUG, "%s @%d: Downloading calibration for service: %{private}@, ACC: %{private}@", (uint8_t *)v2, 0x26u);
}

void __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_119_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24C484000, v0, v1, "%s @%d: remote proxy error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)downloadCalibrationDataForASAKey:completionQueue:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 411;
  _os_log_debug_impl(&dword_24C484000, v0, OS_LOG_TYPE_DEBUG, "%s @%d: Downloading calibration for ASA Key", (uint8_t *)v1, 0x12u);
}

void __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_126_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24C484000, v0, v1, "%s @%d: remote proxy error: %{public}@", v2, v3, v4, v5, 2u);
}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24C484000, v0, v1, "%s @%d: remote proxy error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)finishDownloadWithID:(void *)a1 data:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 roundtripTime];
  uint64_t v4 = +[CRXUFormatters timeIntervalAsString:](CRXUFormatters, "timeIntervalAsString:");
  v5[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_24C484000, v3, OS_LOG_TYPE_DEBUG, "%s @%d: XPC call roundtrip time: %{public}@", (uint8_t *)v5, 0x1Cu);
}

@end