@interface FigCameraViewfinderLocal
+ (id)cameraViewfinder;
+ (void)initialize;
- (BOOL)photoThumbnailQualitySpecified;
- (FigCameraViewfinderLocal)init;
- (float)photoThumbnailQuality;
- (int)photoThumbnailMaxDimension;
- (void)_updateActiveViewfinderSession:(int)a3 sessionStatus:;
- (void)captureSession:(int64_t)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6;
- (void)captureSessionDidFinishMovieRecording:(int64_t)a3;
- (void)captureSessionDidReconfigureWhileRunning:(id)a3;
- (void)captureSessionDidStart:(id)a3;
- (void)captureSessionDidStartMovieRecording:(int64_t)a3;
- (void)captureSessionDidStop:(int64_t)a3;
- (void)captureSessionWillStart:(id)a3;
- (void)dealloc;
- (void)startWithOptions:(id)a3;
- (void)stop;
@end

@implementation FigCameraViewfinderLocal

- (void)captureSessionWillStart:(id)a3
{
  if ([a3 containsVideoSource])
  {
    objc_sync_enter(self);
    activeViewfinderSession = self->_activeViewfinderSession;
    if (activeViewfinderSession
      && (uint64_t v6 = [(FigCameraViewfinderSessionLocal *)activeViewfinderSession identifier],
          v6 > [a3 identifier]))
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [[FigCameraViewfinderSessionLocal alloc] _initWithOwningViewfinder:self captureSessionProxy:a3 delegateStorage:self->super._delegateStorage];
      -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, v7, 1);
    }
    objc_sync_exit(self);
  }
}

- (void)captureSessionDidStart:(id)a3
{
  if ([a3 containsVideoSource])
  {
    objc_sync_enter(self);
    int64_t v5 = [(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession identifier];
    uint64_t v6 = [a3 identifier];
    activeViewfinderSession = self->_activeViewfinderSession;
    if (v5 == v6)
    {
      delegateStorage = self->super._delegateStorage;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__FigCameraViewfinderLocal_captureSessionDidStart___block_invoke;
      v11[3] = &unk_1E5C27120;
      v11[4] = self;
      v11[5] = activeViewfinderSession;
      [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v11];
    }
    else if (!activeViewfinderSession {
           || (uint64_t v9 = [(FigCameraViewfinderSessionLocal *)activeViewfinderSession identifier],
    }
               v9 <= [a3 identifier]))
    {
      id v10 = [[FigCameraViewfinderSessionLocal alloc] _initWithOwningViewfinder:self captureSessionProxy:a3 delegateStorage:self->super._delegateStorage];
      -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, v10, 2);
      goto LABEL_8;
    }
    id v10 = 0;
LABEL_8:
    objc_sync_exit(self);
  }
}

- (void)_updateActiveViewfinderSession:(int)a3 sessionStatus:
{
  if (a1)
  {
    int64_t v5 = *(void **)(a1 + 40);
    if (v5 != a2)
    {
      if (v5)
      {
        *(void *)(a1 + 40) = 0;
        [v5 _captureSessionDidStop];
        id v7 = *(void **)(a1 + 8);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke;
        v11[3] = &unk_1E5C27120;
        v11[4] = a1;
        v11[5] = v5;
        [v7 invokeDelegateCallbackWithBlock:v11];
      }
      if (a2)
      {
        *(void *)(a1 + 40) = a2;
        v8 = *(void **)(a1 + 8);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke_2;
        v9[3] = &unk_1E5C27148;
        v9[4] = a1;
        v9[5] = a2;
        int v10 = a3;
        [v8 invokeDelegateCallbackWithBlock:v9];
      }
    }
  }
}

+ (id)cameraViewfinder
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (FigCameraViewfinderLocal)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderLocal;
  return [(FigCameraViewfinder *)&v3 init];
}

uint64_t __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setDelegateActiveViewfinderSession:*(void *)(a1 + 40)];
  int v3 = *(_DWORD *)(a1 + 48);
  if (v3 == 2)
  {
    id v7 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    return [v7 cameraViewfinder:v8 viewfinderSessionDidBegin:v9];
  }
  else if (v3 == 1)
  {
    v4 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v4 cameraViewfinder:v5 viewfinderSessionWillBegin:v6];
  }
  return result;
}

uint64_t __51__FigCameraViewfinderLocal_captureSessionDidStart___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cameraViewfinder:*(void *)(a1 + 32) viewfinderSessionDidBegin:*(void *)(a1 + 40)];
}

- (void)startWithOptions:(id)a3
{
  self->_options = (NSDictionary *)[a3 copy];
  objc_msgSend(+[FigCaptureSessionObservatory sharedObservatory](FigCaptureSessionObservatory, "sharedObservatory"), "registerObserver:", self);
  self->_observing = 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderLocal;
  [(FigCameraViewfinder *)&v3 dealloc];
}

- (void)stop
{
  if (self->_observing)
  {
    self->_observing = 0;
    objc_msgSend(+[FigCaptureSessionObservatory sharedObservatory](FigCaptureSessionObservatory, "sharedObservatory"), "unregisterObserver:", self);
    objc_sync_enter(self);
    -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, 0, 0);
    objc_sync_exit(self);
  }
}

- (void)captureSessionDidReconfigureWhileRunning:(id)a3
{
  objc_sync_enter(self);
  int64_t v5 = [(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession identifier];
  if (v5 == [a3 identifier])
  {
    if (([a3 containsVideoSource] & 1) == 0)
    {
      -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, 0, 0);
      id v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    int64_t v6 = [(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession identifier];
    uint64_t v7 = [a3 identifier];
    int v8 = [a3 containsVideoSource];
    if (v6 <= v7) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (v9 == 1)
    {
      id v10 = [[FigCameraViewfinderSessionLocal alloc] _initWithOwningViewfinder:self captureSessionProxy:a3 delegateStorage:self->super._delegateStorage];
      -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, v10, 2);
      goto LABEL_10;
    }
  }
  id v10 = 0;
LABEL_10:
  objc_sync_exit(self);
}

- (void)captureSessionDidStop:(int64_t)a3
{
  objc_sync_enter(self);
  if ([(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession identifier] == a3) {
    -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, 0, 0);
  }
  objc_sync_exit(self);
}

- (void)captureSession:(int64_t)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6
{
  if (a3)
  {
    uint64_t v8 = *(void *)&a4;
    objc_sync_enter(self);
    if ([(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession identifier] == a3)
    {
      activeViewfinderSession = self->_activeViewfinderSession;
      long long v12 = *(_OWORD *)&a6->var0;
      int64_t var3 = a6->var3;
      [(FigCameraViewfinderSessionLocal *)activeViewfinderSession _captureSessionDidCapturePhotoWithStatus:v8 thumbnailData:a5 timestamp:&v12];
    }
    objc_sync_exit(self);
  }
}

- (int)photoThumbnailMaxDimension
{
  id v2 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"PhotoThumbnailMaxDimension"];
  return [v2 intValue];
}

- (BOOL)photoThumbnailQualitySpecified
{
  return [(NSDictionary *)self->_options objectForKeyedSubscript:@"PhotoThumbnailQuality"] != 0;
}

- (float)photoThumbnailQuality
{
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", @"PhotoThumbnailQuality"), "floatValue");
  float v3 = 0.0;
  if (result < 0.0 || (float v3 = 1.0, result > 1.0))
  {
    if ((photoThumbnailQuality_haveWarnedAboutOutOfRangeValues & 1) == 0) {
      photoThumbnailQuality_haveWarnedAboutOutOfRangeValues = 1;
    }
    return v3;
  }
  return result;
}

- (void)captureSessionDidStartMovieRecording:(int64_t)a3
{
  objc_sync_enter(self);
  if ([(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession identifier] == a3) {
    [(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession _captureSessionDidStartMovieRecording];
  }
  objc_sync_exit(self);
}

- (void)captureSessionDidFinishMovieRecording:(int64_t)a3
{
  objc_sync_enter(self);
  if ([(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession identifier] == a3) {
    [(FigCameraViewfinderSessionLocal *)self->_activeViewfinderSession _captureSessionDidFinishMovieRecording];
  }
  objc_sync_exit(self);
}

uint64_t __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) setDelegateActiveViewfinderSession:0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [a2 cameraViewfinder:v4 viewfinderSessionDidEnd:v5];
}

@end