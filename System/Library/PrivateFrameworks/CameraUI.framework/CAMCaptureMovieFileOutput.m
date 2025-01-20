@interface CAMCaptureMovieFileOutput
- (AVCaptureFileOutputRecordingDelegate)wrappedDelegate;
- (CAMCaptureEngine)_captureEngine;
- (CAMCaptureMovieFileOutput)initWithEngine:(id)a3;
- (NSDictionary)currentUserInfo;
- (NSDictionary)userInfo;
- (NSDictionary)userInfoForNextCapture;
- (NSMutableArray)_removeOnCompletionSettingsIDs;
- (NSMutableDictionary)_userInfoBySettingsID;
- (OS_dispatch_queue)_userInfoQueue;
- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6;
- (void)captureOutput:(id)a3 didPauseRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5;
- (void)captureOutput:(id)a3 didResumeRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5;
- (void)captureOutput:(id)a3 didStartRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5;
- (void)handleNotification:(id)a3 payload:(id)a4;
- (void)setCurrentUserInfo:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoForNextCapture:(id)a3;
- (void)setWrappedDelegate:(id)a3;
- (void)startRecordingToOutputFileURL:(id)a3 recordingDelegate:(id)a4;
- (void)stopRecording;
@end

@implementation CAMCaptureMovieFileOutput

- (CAMCaptureMovieFileOutput)initWithEngine:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMCaptureMovieFileOutput;
  v5 = [(AVCaptureMovieFileOutput *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__captureEngine, v4);
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.camera.movie-file-output.user-info", v7);
    userInfoQueue = v6->__userInfoQueue;
    v6->__userInfoQueue = (OS_dispatch_queue *)v8;

    v10 = v6->__userInfoQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__CAMCaptureMovieFileOutput_initWithEngine___block_invoke;
    block[3] = &unk_263FA0208;
    v11 = v6;
    v15 = v11;
    dispatch_sync(v10, block);
    v12 = v11;
  }
  return v6;
}

uint64_t __44__CAMCaptureMovieFileOutput_initWithEngine___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 64);
  *(void *)(v6 + 64) = v5;
  return MEMORY[0x270F9A758](v5, v7);
}

- (void)startRecordingToOutputFileURL:(id)a3 recordingDelegate:(id)a4
{
  id v6 = a3;
  [(CAMCaptureMovieFileOutput *)self setWrappedDelegate:a4];
  v7.receiver = self;
  v7.super_class = (Class)CAMCaptureMovieFileOutput;
  [(AVCaptureMovieFileOutput *)&v7 startRecordingToOutputFileURL:v6 recordingDelegate:self];
}

- (void)stopRecording
{
  v4.receiver = self;
  v4.super_class = (Class)CAMCaptureMovieFileOutput;
  [(AVCaptureMovieFileOutput *)&v4 stopRecording];
  uint64_t v3 = [(CAMCaptureMovieFileOutput *)self _captureEngine];
  [v3 stopRecording];
}

- (NSDictionary)userInfo
{
  uint64_t v7 = 0;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  uint64_t v3 = [(CAMCaptureMovieFileOutput *)self _userInfoQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__CAMCaptureMovieFileOutput_userInfo__block_invoke;
  v6[3] = &unk_263FA35E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __37__CAMCaptureMovieFileOutput_userInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentUserInfo];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)[v4 copy];
    uint64_t v7 = [(CAMCaptureMovieFileOutput *)self _userInfoQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__CAMCaptureMovieFileOutput_setUserInfo___block_invoke;
    block[3] = &unk_263FA0CD0;
    void block[4] = self;
    id v10 = v5;
    id v11 = v6;
    id v8 = v6;
    dispatch_sync(v7, block);
  }
}

uint64_t __41__CAMCaptureMovieFileOutput_setUserInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentUserInfo:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setUserInfoForNextCapture:v3];
}

- (void)handleNotification:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  id v25 = [v7 objectForKey:@"SettingsID"];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v19 = [(id)v21[5] longLongValue];
  id v8 = [(CAMCaptureMovieFileOutput *)self _userInfoQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke;
  block[3] = &unk_263FA3610;
  id v9 = v6;
  id v14 = v9;
  v15 = self;
  objc_super v16 = v18;
  v17 = &v20;
  dispatch_sync(v8, block);

  v12.receiver = self;
  v12.super_class = (Class)CAMCaptureMovieFileOutput;
  [(AVCaptureMovieFileOutput *)&v12 handleNotification:v9 payload:v7];
  if ([v9 isEqualToString:@"DidStopRecording"])
  {
    id v10 = [(CAMCaptureMovieFileOutput *)self _userInfoQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke_17;
    v11[3] = &unk_263FA2300;
    v11[4] = self;
    v11[5] = &v20;
    dispatch_sync(v10, v11);
  }
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
}

void __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isEqualToString:@"DidStartRecording"])
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfoForNextCapture];
    uint64_t v3 = [*(id *)(a1 + 40) _userInfoBySettingsID];
    id v4 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    [v3 setObject:v2 forKeyedSubscript:v4];

    [*(id *)(a1 + 40) setUserInfoForNextCapture:0];
  }
  id v5 = [*(id *)(a1 + 40) _userInfoBySettingsID];
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v7)
  {
    id v8 = [v5 allKeys];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40) longLongValue];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  objc_super v12 = [v6 objectForKey:v7];
  if (!v12)
  {
    objc_super v12 = [*(id *)(a1 + 40) userInfoForNextCapture];
    if (v12)
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v17 = 134217984;
        uint64_t v18 = v14;
        _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Falling back to userInfoForNextCapture due to missing user info for settingsID %lld", (uint8_t *)&v17, 0xCu);
      }

      v15 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      [v6 setObject:v12 forKeyedSubscript:v15];

      id v16 = v12;
      [*(id *)(a1 + 40) setUserInfoForNextCapture:0];
    }
  }
  [*(id *)(a1 + 40) setCurrentUserInfo:v12];
}

void __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke_17(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _removeOnCompletionSettingsIDs];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v3 = v2;
    objc_msgSend(v2, "addObject:");
    uint64_t v2 = v3;
  }
}

- (void)captureOutput:(id)a3 didStartRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(CAMCaptureMovieFileOutput *)self wrappedDelegate];
  objc_super v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didStartRecordingToOutputFileAtURL: url=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  [v11 captureOutput:v10 didStartRecordingToOutputFileAtURL:v8 fromConnections:v9];
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(CAMCaptureMovieFileOutput *)self wrappedDelegate];
  uint64_t v15 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didFinishRecordingToOutputFileAtURL: url=%{public}@, error=%{public}@", buf, 0x16u);
  }

  [v14 captureOutput:v13 didFinishRecordingToOutputFileAtURL:v10 fromConnections:v12 error:v11];
  [(CAMCaptureMovieFileOutput *)self setWrappedDelegate:0];
  id v16 = [(CAMCaptureMovieFileOutput *)self _userInfoQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__CAMCaptureMovieFileOutput_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(v16, block);
}

void __101__CAMCaptureMovieFileOutput_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _removeOnCompletionSettingsIDs];
  uint64_t v2 = [v4 firstObject];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _userInfoBySettingsID];
    [v3 removeObjectForKey:v2];
  }
  [v4 removeObject:v2];
}

- (void)captureOutput:(id)a3 didPauseRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didPauseRecordingToOutputFileAtURL: url=%{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)captureOutput:(id)a3 didResumeRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didResumeRecordingToOutputFileAtURL: url=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  id v12 = [(CAMCaptureMovieFileOutput *)self wrappedDelegate];
  [v12 captureOutput:v10 didResumeRecordingToOutputFileAtURL:v8 fromConnections:v9];
}

- (CAMCaptureEngine)_captureEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
  return (CAMCaptureEngine *)WeakRetained;
}

- (OS_dispatch_queue)_userInfoQueue
{
  return self->__userInfoQueue;
}

- (NSMutableDictionary)_userInfoBySettingsID
{
  return self->__userInfoBySettingsID;
}

- (NSMutableArray)_removeOnCompletionSettingsIDs
{
  return self->__removeOnCompletionSettingsIDs;
}

- (NSDictionary)currentUserInfo
{
  return self->_currentUserInfo;
}

- (void)setCurrentUserInfo:(id)a3
{
}

- (NSDictionary)userInfoForNextCapture
{
  return self->_userInfoForNextCapture;
}

- (void)setUserInfoForNextCapture:(id)a3
{
}

- (AVCaptureFileOutputRecordingDelegate)wrappedDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  return (AVCaptureFileOutputRecordingDelegate *)WeakRetained;
}

- (void)setWrappedDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wrappedDelegate);
  objc_storeStrong((id *)&self->_userInfoForNextCapture, 0);
  objc_storeStrong((id *)&self->_currentUserInfo, 0);
  objc_storeStrong((id *)&self->__removeOnCompletionSettingsIDs, 0);
  objc_storeStrong((id *)&self->__userInfoBySettingsID, 0);
  objc_storeStrong((id *)&self->__userInfoQueue, 0);
  objc_destroyWeak((id *)&self->__captureEngine);
}

@end