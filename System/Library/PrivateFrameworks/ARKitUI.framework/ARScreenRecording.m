@interface ARScreenRecording
- (ARScreenRecording)init;
- (BOOL)saveInPhotosLibrary;
- (RPScreenRecorder)recorder;
- (void)removeTemporaryOutputFile;
- (void)screenRecorderDidChangeAvailability:(id)a3;
- (void)setRecorder:(id)a3;
- (void)setSaveInPhotosLibrary:(BOOL)a3;
- (void)startRecordingWithHandler:(id)a3;
- (void)stopRecordingWithHandler:(id)a3;
- (void)video:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5;
@end

@implementation ARScreenRecording

- (ARScreenRecording)init
{
  v7.receiver = self;
  v7.super_class = (Class)ARScreenRecording;
  v2 = [(ARScreenRecording *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_saveInPhotosLibrary = 0;
    v2->_startRecordingRequested = 0;
    v4 = [MEMORY[0x263F16978] sharedRecorder];
    [(ARScreenRecording *)v3 setRecorder:v4];

    v5 = [(ARScreenRecording *)v3 recorder];
    [v5 setDelegate:v3];
  }
  return v3;
}

- (void)startRecordingWithHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(ARScreenRecording *)self recorder];
  int v6 = [v5 isRecording];

  if (v6) {
    goto LABEL_5;
  }
  objc_super v7 = [(ARScreenRecording *)self recorder];
  int v8 = [v7 isAvailable];

  if ((v8 & 1) == 0)
  {
    self->_startRecordingRequested = 1;
LABEL_5:
    v4[2](v4, 0);
    goto LABEL_6;
  }
  v9 = [(ARScreenRecording *)self recorder];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__ARScreenRecording_startRecordingWithHandler___block_invoke;
  v10[3] = &unk_264000A98;
  v11 = v4;
  [v9 startRecordingWithHandler:v10];

LABEL_6:
}

uint64_t __47__ARScreenRecording_startRecordingWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if ([(ARScreenRecording *)self saveInPhotosLibrary])
  {
    v5 = NSURL;
    int v6 = NSTemporaryDirectory();
    objc_super v7 = [v6 stringByAppendingString:@"/screenRecording.mov"];
    int v8 = [v5 fileURLWithPath:v7];
    temporaryOutputURL = self->temporaryOutputURL;
    self->temporaryOutputURL = v8;

    [(ARScreenRecording *)self removeTemporaryOutputFile];
    v10 = [(ARScreenRecording *)self recorder];
    v11 = self->temporaryOutputURL;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __46__ARScreenRecording_stopRecordingWithHandler___block_invoke;
    v18[3] = &unk_264000AC0;
    v18[4] = self;
    id v19 = v4;
    id v12 = v4;
    [v10 stopRecordingWithOutputURL:v11 completionHandler:v18];

    v13 = v19;
  }
  else
  {
    v14 = [(ARScreenRecording *)self recorder];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__ARScreenRecording_stopRecordingWithHandler___block_invoke_2;
    v16[3] = &unk_264000A98;
    id v17 = v4;
    id v15 = v4;
    [v14 stopCaptureWithHandler:v16];

    v13 = v17;
  }
}

void __46__ARScreenRecording_stopRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 16) path];
    UISaveVideoAtPathToSavedPhotosAlbum(v4, *(id *)(a1 + 32), sel_video_didFinishSavingWithError_contextInfo_, 0);

    id v3 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

uint64_t __46__ARScreenRecording_stopRecordingWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)video:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    objc_super v7 = _ARLogGeneral_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v10 = 138543874;
      v11 = v9;
      __int16 v12 = 2048;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_20B202000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to save screen recording: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  [(ARScreenRecording *)self removeTemporaryOutputFile];
}

- (void)removeTemporaryOutputFile
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(NSURL *)self->temporaryOutputURL path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    [v6 removeItemAtURL:self->temporaryOutputURL error:0];
  }
}

- (void)screenRecorderDidChangeAvailability:(id)a3
{
  id v5 = [(ARScreenRecording *)self recorder];
  if ([v5 isAvailable])
  {
    BOOL startRecordingRequested = self->_startRecordingRequested;

    if (!startRecordingRequested) {
      return;
    }
    self->_BOOL startRecordingRequested = 0;
    id v5 = [(ARScreenRecording *)self recorder];
    [v5 startRecordingWithHandler:&__block_literal_global_4];
  }
}

void __57__ARScreenRecording_screenRecorderDidChangeAvailability___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = _ARLogGeneral_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_ERROR, "ARScreenRecording: Failed to start screen recording: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)saveInPhotosLibrary
{
  return self->_saveInPhotosLibrary;
}

- (void)setSaveInPhotosLibrary:(BOOL)a3
{
  self->_saveInPhotosLibrary = a3;
}

- (RPScreenRecorder)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recorder, 0);

  objc_storeStrong((id *)&self->temporaryOutputURL, 0);
}

@end