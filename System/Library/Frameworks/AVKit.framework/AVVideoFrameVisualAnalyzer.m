@interface AVVideoFrameVisualAnalyzer
+ (BOOL)analysis:(id)a3 containsVideoFrameAnalysisType:(unint64_t)a4;
- (AVPlayerController)playerController;
- (AVPlayerLayer)playerLayer;
- (AVVideoFrameVisualAnalyzer)initWithPlayerController:(id)a3 playerLayer:(id)a4;
- (AVVideoFrameVisualAnalyzerDelegate)delegate;
- (BOOL)_canStartAnalysis;
- (BOOL)actuallyEnabled;
- (BOOL)enabled;
- (VKCImageAnalyzer)imageAnalyzer;
- (id)_imageAnalysisQueue;
- (unint64_t)videoFrameAnalysisTypes;
- (void)_resetAnalysis;
- (void)_updateActualEnabledStateIfNeeded;
- (void)_updateAnalysisIfNeeded;
- (void)_updateObserversIfNeeded;
- (void)dealloc;
- (void)setActuallyEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setVideoFrameAnalysisTypes:(unint64_t)a3;
@end

@implementation AVVideoFrameVisualAnalyzer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_lastAnalysis, 0);
  objc_storeStrong((id *)&self->_timeObservingTimer, 0);

  objc_storeStrong((id *)&self->_playerObservationController, 0);
}

- (BOOL)actuallyEnabled
{
  return self->_actuallyEnabled;
}

- (void)setVideoFrameAnalysisTypes:(unint64_t)a3
{
  self->_videoFrameAnalysisTypes = a3;
}

- (unint64_t)videoFrameAnalysisTypes
{
  return self->_videoFrameAnalysisTypes;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setDelegate:(id)a3
{
}

- (AVVideoFrameVisualAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVVideoFrameVisualAnalyzerDelegate *)WeakRetained;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setImageAnalyzer:(id)a3
{
}

- (VKCImageAnalyzer)imageAnalyzer
{
  imageAnalyzer = self->_imageAnalyzer;
  if (!imageAnalyzer)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v4 = (void *)getVKCImageAnalyzerClass_softClass_4448;
    uint64_t v15 = getVKCImageAnalyzerClass_softClass_4448;
    if (!getVKCImageAnalyzerClass_softClass_4448)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getVKCImageAnalyzerClass_block_invoke_4449;
      v11[3] = &unk_1E5FC42C0;
      v11[4] = &v12;
      __getVKCImageAnalyzerClass_block_invoke_4449((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = v4;
    _Block_object_dispose(&v12, 8);
    v6 = (VKCImageAnalyzer *)objc_alloc_init(v5);
    v7 = self->_imageAnalyzer;
    self->_imageAnalyzer = v6;

    v8 = self->_imageAnalyzer;
    v9 = -[AVVideoFrameVisualAnalyzer _imageAnalysisQueue](self);
    [(VKCImageAnalyzer *)v8 setCallbackQueue:v9];

    imageAnalyzer = self->_imageAnalyzer;
  }

  return imageAnalyzer;
}

- (id)_imageAnalysisQueue
{
  if (a1)
  {
    if (_imageAnalysisQueue_once != -1) {
      dispatch_once(&_imageAnalysisQueue_once, &__block_literal_global_37);
    }
    a1 = (id)_imageAnalysisQueue_videoFrameAnalysisQueue;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __49__AVVideoFrameVisualAnalyzer__imageAnalysisQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.avkit.videoframe-analysis", attr);
  v2 = (void *)_imageAnalysisQueue_videoFrameAnalysisQueue;
  _imageAnalysisQueue_videoFrameAnalysisQueue = (uint64_t)v1;
}

- (void)setActuallyEnabled:(BOOL)a3
{
  if (self->_actuallyEnabled != a3)
  {
    self->_actuallyEnabled = a3;
    if (!a3)
    {
      [(VKCImageAnalyzer *)self->_imageAnalyzer cancelAllRequests];
      -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)self);
    }
    -[AVVideoFrameVisualAnalyzer _updateObserversIfNeeded]((id *)&self->super.isa);
  }
}

- (void)_resetAnalysis
{
  if (a1)
  {
    uint64_t v2 = MEMORY[0x1E4F1F9F8];
    *(void *)(a1 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v2;
    *(void *)(a1 + 56) = *(void *)(v2 + 16);
    if (*(_DWORD *)(a1 + 16))
    {
      v3 = [(id)a1 imageAnalyzer];
      [v3 cancelRequestID:*(unsigned int *)(a1 + 16)];

      *(_DWORD *)(a1 + 16) = 0;
    }
    [*(id *)(a1 + 32) invalidate];
    if (*(void *)(a1 + 64))
    {
      v4 = [(id)a1 delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        v6 = [(id)a1 delegate];
        [v6 videoFrameVisualAnalyzerDidFinishAnalyzingVideoFrame:a1 withAnalysis:0];
      }
    }
    v7 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;
  }
}

- (void)_updateObserversIfNeeded
{
  if (a1)
  {
    id v12 = [a1 playerController];
    int v2 = [a1 enabled];
    int v3 = [a1 actuallyEnabled];
    id v4 = a1[1];
    if (!v4)
    {
      char v5 = [[AVObservationController alloc] initWithOwner:a1];
      id v6 = a1[1];
      a1[1] = v5;

      id v4 = a1[1];
    }
    [v4 stopAllObservation];
    v7 = v12;
    if (v2 && v12)
    {
      id v8 = (id)[a1[1] startObserving:v12 keyPath:@"currentAssetIfReady" includeInitialValue:0 observationHandler:&__block_literal_global_4458];
      v7 = v12;
    }
    if (v7 && ((v3 ^ 1) & 1) == 0)
    {
      id v9 = (id)[a1[1] startObserving:v12 keyPath:@"activeRate" includeInitialValue:1 observationHandler:&__block_literal_global_14];
      [a1[1] startObservingNotificationForName:@"AVPlayerControllerCurrentTimeJumpedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_17];
      id v10 = (id)[a1[1] startObserving:v12 keyPath:@"player.currentItem.videoComposition" includeInitialValue:1 observationHandler:&__block_literal_global_22];
      id v11 = (id)[a1[1] startObserving:v12 keyPath:@"preferredTransform" includeInitialValue:1 observationHandler:&__block_literal_global_27_4462];
      v7 = v12;
    }
  }
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_5(uint64_t a1, uint64_t a2)
{
}

- (void)_updateAnalysisIfNeeded
{
  if (a1)
  {
    id v8 = [(id)a1 playerController];
    -[AVVideoFrameVisualAnalyzer _resetAnalysis](a1);
    [v8 activeRate];
    int v2 = v8;
    if (v3 == 0.0)
    {
      [v8 currentTime];
      *(void *)(a1 + 24) = v4;
      if (-[AVVideoFrameVisualAnalyzer _canStartAnalysis](a1))
      {
        if (-[AVVideoFrameVisualAnalyzer _canStartAnalysis](a1))
        {
          [*(id *)(a1 + 32) invalidate];
          objc_initWeak(&location, (id)a1);
          char v5 = (void *)MEMORY[0x1E4F1CB00];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __62__AVVideoFrameVisualAnalyzer__setupTimeObservingTimerIfNeeded__block_invoke;
          v9[3] = &unk_1E5FC4480;
          objc_copyWeak(&v10, &location);
          uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v9 block:0.25];
          v7 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v6;

          objc_destroyWeak(&v10);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        [*(id *)(a1 + 80) cancelAllRequests];
        -[AVVideoFrameVisualAnalyzer _resetAnalysis](a1);
      }
      int v2 = v8;
    }
  }
}

- (BOOL)_canStartAnalysis
{
  int v2 = [(id)a1 playerController];
  char v3 = [(id)a1 actuallyEnabled];
  if (*(_DWORD *)(a1 + 16))
  {
    BOOL v4 = 1;
  }
  else
  {
    [v2 activeRate];
    BOOL v4 = v5 != 0.0;
  }
  int v6 = *(_DWORD *)(a1 + 52);
  CMTime v17 = *(CMTime *)(a1 + 40);
  BOOL v7 = CMTimeGetSeconds(&v17) != *(double *)(a1 + 24) && *(void *)(a1 + 64) == 0;
  id v8 = [(id)a1 playerController];
  id v9 = [v8 currentAssetIfReady];
  char v10 = [v9 hasProtectedContent];

  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    char v12 = 0;
  }
  else {
    char v12 = v3;
  }
  char v13 = v12 ^ 1 | v10 | v4;
  BOOL v14 = (v6 & 1) == 0 && v7;
  BOOL v15 = (v13 & 1) == 0 && v14;

  return v15;
}

uint64_t __62__AVVideoFrameVisualAnalyzer__setupTimeObservingTimerIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = (id *)WeakRetained;
  if (WeakRetained)
  {
    val = (id *)WeakRetained;
    uint64_t WeakRetained = -[AVVideoFrameVisualAnalyzer _canStartAnalysis](WeakRetained);
    int v2 = val;
    if (WeakRetained)
    {
      [val[10] cancelAllRequests];
      -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)val);
      char v3 = [val playerController];
      BOOL v4 = [v3 activePlayer];

      double v5 = [v4 currentItem];
      int v6 = v5;
      long long v26 = 0uLL;
      uint64_t v27 = 0;
      if (v5) {
        [v5 currentTime];
      }
      long long v32 = 0u;
      long long v33 = 0u;
      *(_OWORD *)id location = 0u;
      id v7 = val[11];
      if (v7)
      {
        [v7 preferredTransform];
        id v7 = val[11];
      }
      id v8 = [v7 player];
      id v9 = [v8 currentItem];
      char v10 = [v9 videoComposition];

      if (v10)
      {
        uint64_t v11 = 0;
      }
      else
      {
        long long v28 = *(_OWORD *)location;
        long long v29 = v32;
        long long v30 = v33;
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x2020000000;
        char v12 = (uint64_t (*)(long long *))getvk_imageOrientationFromTransformSymbolLoc_ptr;
        v37 = getvk_imageOrientationFromTransformSymbolLoc_ptr;
        if (!getvk_imageOrientationFromTransformSymbolLoc_ptr)
        {
          *(void *)&long long block = MEMORY[0x1E4F143A8];
          *((void *)&block + 1) = 3221225472;
          *(void *)&long long v21 = __getvk_imageOrientationFromTransformSymbolLoc_block_invoke;
          *((void *)&v21 + 1) = &unk_1E5FC42C0;
          *(void *)&long long v22 = &v34;
          char v13 = (void *)VisionKitCoreLibrary();
          v35[3] = (uint64_t)dlsym(v13, "vk_imageOrientationFromTransform");
          getvk_imageOrientationFromTransformSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(v22 + 8) + 24);
          char v12 = (uint64_t (*)(long long *))v35[3];
        }
        _Block_object_dispose(&v34, 8);
        if (!v12)
        {
          dlerror();
          CMTime v17 = (_Unwind_Exception *)abort_report_np();
          _Block_object_dispose(&v34, 8);
          _Unwind_Resume(v17);
        }
        long long block = v28;
        long long v21 = v29;
        long long v22 = v30;
        uint64_t v11 = v12(&block);
      }

      BOOL v14 = [val playerLayer];
      objc_initWeak(location, val);
      BOOL v15 = -[AVVideoFrameVisualAnalyzer _imageAnalysisQueue](val);
      *(void *)&long long block = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3221225472;
      *(void *)&long long v21 = __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke;
      *((void *)&v21 + 1) = &unk_1E5FC2490;
      objc_copyWeak((id *)&v22 + 1, location);
      long long v24 = v26;
      uint64_t v25 = v27;
      *(void *)&long long v22 = v14;
      uint64_t v23 = v11;
      id v16 = v14;
      dispatch_async(v15, &block);

      objc_destroyWeak((id *)&v22 + 1);
      objc_destroyWeak(location);

      int v2 = val;
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

void __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  uint64_t WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = [*(id *)(a1 + 32) copyDisplayedPixelBuffer];
    if (v4)
    {
      double v5 = (__CVBuffer *)v4;
      long long v6 = *(_OWORD *)(a1 + 56);
      *((void *)WeakRetained + 7) = *(void *)(a1 + 72);
      *(_OWORD *)(WeakRetained + 40) = v6;
      uint64_t v14 = 0;
      BOOL v15 = &v14;
      uint64_t v16 = 0x2050000000;
      id v7 = (void *)getVKCImageAnalyzerRequestClass_softClass;
      uint64_t v17 = getVKCImageAnalyzerRequestClass_softClass;
      if (!getVKCImageAnalyzerRequestClass_softClass)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __getVKCImageAnalyzerRequestClass_block_invoke;
        v13[3] = &unk_1E5FC42C0;
        v13[4] = &v14;
        __getVKCImageAnalyzerRequestClass_block_invoke((uint64_t)v13);
        id v7 = (void *)v15[3];
      }
      id v8 = v7;
      _Block_object_dispose(&v14, 8);
      id v9 = (void *)[[v8 alloc] initWithCVPixelBuffer:v5 orientation:*(void *)(a1 + 48) requestType:(8 * *((void *)WeakRetained + 14)) & 0x20 | (*((void *)WeakRetained + 14) >> 1) & 1 | (16 * ((*((void *)WeakRetained + 14) >> 3) & 1)) | (*((void *)WeakRetained + 14) >> 2) & 4];
      [v9 setImageSource:2];
      CVPixelBufferRelease(v5);
      char v10 = [WeakRetained imageAnalyzer];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_2;
      v11[3] = &unk_1E5FC2468;
      objc_copyWeak(&v12, v2);
      *((_DWORD *)WeakRetained + 4) = [v10 processRequest:v9 progressHandler:0 completionHandler:v11];

      objc_destroyWeak(&v12);
    }
  }
}

void __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_3;
  block[3] = &unk_1E5FC42E8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __54__AVVideoFrameVisualAnalyzer__startVideoFrameAnalysis__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = *(void **)(a1 + 32);
  int v2 = *(void **)(a1 + 40);
  id v4 = v3;
  id v5 = v2;
  id v6 = v5;
  if (WeakRetained)
  {
    *((_DWORD *)WeakRetained + 4) = 0;
    if (v5)
    {
      id v7 = [WeakRetained delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [WeakRetained delegate];
        [v9 videoFrameVisualAnalyzerFailedAnalyzingVideoFrame:WeakRetained withError:v6];
      }
      -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)WeakRetained);
    }
    else if (v4)
    {
      unint64_t v10 = *((void *)WeakRetained + 14);
      if (([v4 hasResultsForAnalysisTypes:(8 * (int)v10) & 0x20 | (v10 >> 1) & 1 | (16 * ((v10 >> 3) & 1)) | (v10 >> 2) & 4] & 1) != 0|| (v10 & 4) != 0)
      {
        id v11 = [WeakRetained delegate];
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          char v13 = [WeakRetained delegate];
          [v13 videoFrameVisualAnalyzerDidFinishAnalyzingVideoFrame:WeakRetained withAnalysis:v4];
        }
        objc_storeStrong((id *)WeakRetained + 8, v3);
      }
    }
  }
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2)
{
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __54__AVVideoFrameVisualAnalyzer__updateObserversIfNeeded__block_invoke(uint64_t a1, void *a2)
{
}

- (void)_updateActualEnabledStateIfNeeded
{
  if (a1)
  {
    int v2 = [a1 playerController];
    id v6 = [v2 currentAssetIfReady];

    unsigned int v3 = [a1 enabled];
    if (v6) {
      unsigned int v4 = v3;
    }
    else {
      unsigned int v4 = 0;
    }
    if (a1[12]) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    [a1 setActuallyEnabled:v5];
  }
}

- (void)setPlayerController:(id)a3
{
  uint64_t v5 = (AVPlayerController *)a3;
  p_playerController = &self->_playerController;
  if (self->_playerController != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_playerController, a3);
    -[AVVideoFrameVisualAnalyzer _updateObserversIfNeeded]((id *)&self->super.isa);
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_playerController, v5);
}

- (void)setPlayerLayer:(id)a3
{
  uint64_t v5 = (AVPlayerLayer *)a3;
  p_playerLayer = &self->_playerLayer;
  if (self->_playerLayer != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_playerLayer, a3);
    -[AVVideoFrameVisualAnalyzer _updateActualEnabledStateIfNeeded](self);
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_playerLayer, v5);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVVideoFrameVisualAnalyzer _updateObserversIfNeeded]((id *)&self->super.isa);
    -[AVVideoFrameVisualAnalyzer _updateActualEnabledStateIfNeeded](self);
  }
}

- (void)dealloc
{
  [(AVObservationController *)self->_playerObservationController stopAllObservation];
  [(VKCImageAnalyzer *)self->_imageAnalyzer cancelAllRequests];
  -[AVVideoFrameVisualAnalyzer _resetAnalysis]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)AVVideoFrameVisualAnalyzer;
  [(AVVideoFrameVisualAnalyzer *)&v3 dealloc];
}

- (AVVideoFrameVisualAnalyzer)initWithPlayerController:(id)a3 playerLayer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v13.receiver = self;
    v13.super_class = (Class)AVVideoFrameVisualAnalyzer;
    id v9 = [(AVVideoFrameVisualAnalyzer *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_playerController, a3);
      objc_storeStrong(p_isa + 12, a4);
    }
    self = p_isa;
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)analysis:(id)a3 containsVideoFrameAnalysisType:(unint64_t)a4
{
  return [a3 hasResultsForAnalysisTypes:(8 * (int)a4) & 0x20 | (a4 >> 1) & 1 | (16 * ((a4 >> 3) & 1)) | (a4 >> 2) & 4];
}

@end