@interface LPAnimatedImageTranscoder
+ (id)encodeQueue;
- (LPAnimatedImageTranscoder)initWithAnimatedImage:(id)a3;
- (void)_transcodeWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)encodeNextFrame;
- (void)encodeUntilNotReadyForMoreMediaData;
- (void)failed;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeReadyForDataObserverIfNeeded;
- (void)transcodeWithCompletionHandler:(id)a3;
@end

@implementation LPAnimatedImageTranscoder

- (LPAnimatedImageTranscoder)initWithAnimatedImage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPAnimatedImageTranscoder;
  v6 = [(LPAnimatedImageTranscoder *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceImage, a3);
    v7->_loggingID = ++initWithAnimatedImage__nextLoggingID;
    v8 = v7;
  }

  return v7;
}

+ (id)encodeQueue
{
  if (encodeQueue_onceToken != -1) {
    dispatch_once(&encodeQueue_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)encodeQueue_encodeQueue;

  return v2;
}

void __40__LPAnimatedImageTranscoder_encodeQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.LinkPresentation.AnimatedImageTranscoder", v2);
  v1 = (void *)encodeQueue_encodeQueue;
  encodeQueue_encodeQueue = (uint64_t)v0;
}

- (void)transcodeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[LPAnimatedImageTranscoder encodeQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__LPAnimatedImageTranscoder_transcodeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5B05068;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__LPAnimatedImageTranscoder_transcodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transcodeWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_transcodeWithCompletionHandler:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = _Block_copy(a3);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  CFDataRef v6 = [(LPImage *)self->_sourceImage data];
  self->_imageSource = CGImageSourceCreateWithData(v6, MEMORY[0x1E4F1CC08]);

  self->_unint64_t frameCount = CGImageSourceGetCount(self->_imageSource);
  v7 = (id)LPLogChannelTranscoding();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    unint64_t frameCount = self->_frameCount;
    objc_super v10 = [(LPImage *)self->_sourceImage data];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = loggingID;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = frameCount;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = [v10 length];
    _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: beginning transcoding for image (frameCount=%zu, size=%zd)", buf, 0x1Cu);
  }
  if (self->_frameCount > 1)
  {
    CFDictionaryRef v18 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, 0, 0);
    v19 = (void *)MEMORY[0x1E4F1CB10];
    v20 = NSTemporaryDirectory();
    v21 = [MEMORY[0x1E4F29128] UUID];
    v22 = [v21 UUIDString];
    v23 = [v20 stringByAppendingPathComponent:v22];
    v24 = [v23 stringByAppendingPathExtension:@"mp4"];
    v25 = [v19 fileURLWithPath:v24];
    outputURL = self->_outputURL;
    self->_outputURL = v25;

    v27 = [(__CFDictionary *)v18 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    unint64_t v28 = [v27 unsignedLongValue];

    v29 = [(__CFDictionary *)v18 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    unint64_t v30 = [v29 unsignedLongValue];

    if (v28 && v30)
    {
      id v31 = objc_alloc(MEMORY[0x1E4F163B8]);
      v32 = (AVAssetWriter *)[v31 initWithURL:self->_outputURL fileType:*MEMORY[0x1E4F15AA8] error:0];
      writer = self->_writer;
      self->_writer = v32;

      double v34 = delayTimeFromImageProperties(v18);
      uint64_t v35 = *MEMORY[0x1E4F16220];
      v70[0] = *MEMORY[0x1E4F16228];
      uint64_t v36 = *MEMORY[0x1E4F16300];
      v69[0] = v35;
      v69[1] = v36;
      v37 = [NSNumber numberWithDouble:(double)v28];
      double v38 = (double)v30;
      v70[1] = v37;
      v69[2] = *MEMORY[0x1E4F162A0];
      v39 = [NSNumber numberWithDouble:(double)v30];
      v70[2] = v39;
      v69[3] = *MEMORY[0x1E4F16268];
      uint64_t v67 = *MEMORY[0x1E4F161D8];
      v40 = [NSNumber numberWithDouble:(double)v28 * v38 * 32.0 * (1.0 / v34) * 0.0175];
      v68 = v40;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v70[3] = v41;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:4];

      v43 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v42];
      input = self->_input;
      self->_input = v43;

      uint64_t v45 = *MEMORY[0x1E4F24CA0];
      v65[0] = *MEMORY[0x1E4F24D70];
      v65[1] = v45;
      v66[0] = &unk_1EF712858;
      v66[1] = MEMORY[0x1E4F1CC38];
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
      v47 = [MEMORY[0x1E4F163D8] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:self->_input sourcePixelBufferAttributes:v46];
      adaptor = self->_adaptor;
      self->_adaptor = v47;

      [(AVAssetWriter *)self->_writer addInput:self->_input];
      if ([(AVAssetWriter *)self->_writer startWriting])
      {
        v49 = self->_writer;
        *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
        *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        [(AVAssetWriter *)v49 startSessionAtSourceTime:buf];
        v50 = [(AVAssetWriterInputPixelBufferAdaptor *)self->_adaptor assetWriterInput];
        [v50 addObserver:self forKeyPath:@"readyForMoreMediaData" options:5 context:readyForDataKVOContext];

        self->_hasReadyForDataObserver = 1;
        [(LPAnimatedImageTranscoder *)self encodeUntilNotReadyForMoreMediaData];
      }
      else
      {
        v58 = LPLogChannelTranscoding();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          -[LPAnimatedImageTranscoder _transcodeWithCompletionHandler:]((uint64_t)self, v58, v59, v60, v61, v62, v63, v64);
        }
        [(LPAnimatedImageTranscoder *)self failed];
      }
    }
    else
    {
      v51 = LPLogChannelTranscoding();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        -[LPAnimatedImageTranscoder _transcodeWithCompletionHandler:]((uint64_t)self, v51, v52, v53, v54, v55, v56, v57);
      }
      [(LPAnimatedImageTranscoder *)self failed];
    }
  }
  else
  {
    v11 = LPLogChannelTranscoding();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LPAnimatedImageTranscoder _transcodeWithCompletionHandler:]((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
    }
    [(LPAnimatedImageTranscoder *)self failed];
  }
}

- (void)failed
{
  self->_stopEncoding = 1;
  [(LPAnimatedImageTranscoder *)self removeReadyForDataObserverIfNeeded];
  if (self->_completionHandler)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__LPAnimatedImageTranscoder_failed__block_invoke;
    block[3] = &unk_1E5B04DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __35__LPAnimatedImageTranscoder_failed__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)readyForDataKVOContext == a6)
  {
    uint64_t v13 = +[LPAnimatedImageTranscoder encodeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__LPAnimatedImageTranscoder_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5B04DF0;
    block[4] = self;
    dispatch_async(v13, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)LPAnimatedImageTranscoder;
    [(LPAnimatedImageTranscoder *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __76__LPAnimatedImageTranscoder_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeUntilNotReadyForMoreMediaData];
}

- (void)removeReadyForDataObserverIfNeeded
{
  if (self->_hasReadyForDataObserver)
  {
    v3 = [(AVAssetWriterInputPixelBufferAdaptor *)self->_adaptor assetWriterInput];
    [v3 removeObserver:self forKeyPath:@"readyForMoreMediaData" context:readyForDataKVOContext];
  }
  self->_hasReadyForDataObserver = 0;
}

- (void)encodeUntilNotReadyForMoreMediaData
{
  while (!self->_stopEncoding)
  {
    v3 = [(AVAssetWriterInputPixelBufferAdaptor *)self->_adaptor assetWriterInput];
    int v4 = [v3 isReadyForMoreMediaData];

    if (!v4) {
      break;
    }
    [(LPAnimatedImageTranscoder *)self encodeNextFrame];
  }
}

- (void)encodeNextFrame
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1A35DC000, v0, v1, "LPAnimatedImageTranscoder<%d>: failed, could not append surface for frame %zu", v2, v3);
}

void __44__LPAnimatedImageTranscoder_encodeNextFrame__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 24));
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    int v2 = objc_alloc_init(LPVideoProperties);
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) properties];
    int v4 = [v3 accessibilityText];
    [(LPVisualMediaProperties *)v2 setAccessibilityText:v4];

    unint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "_lp_fileSize");
    if (v5 <= 0xA00000)
    {
      id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(*(void *)(a1 + 32) + 32)];
      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v9 removeItemAtURL:*(void *)(*(void *)(a1 + 32) + 32) error:0];

      id v10 = [[LPVideo alloc] initWithData:v8 MIMEType:@"video/mp4" properties:v2];
      id v11 = LPLogChannelTranscoding();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *(_DWORD *)(*(void *)(a1 + 32) + 92);
        *(_DWORD *)buf = 67109376;
        int v17 = v12;
        __int16 v18 = 2048;
        unint64_t v19 = v5;
        _os_log_impl(&dword_1A35DC000, v11, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: finished transcoding (size=%llu)", buf, 0x12u);
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44__LPAnimatedImageTranscoder_encodeNextFrame__block_invoke_23;
      v14[3] = &unk_1E5B04E18;
      v14[4] = *(void *)(a1 + 32);
      uint64_t v15 = v10;
      uint64_t v13 = v10;
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
    else
    {
      CFDataRef v6 = LPLogChannelTranscoding();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 92);
        *(_DWORD *)buf = 67109376;
        int v17 = v7;
        __int16 v18 = 2048;
        unint64_t v19 = v5;
        _os_log_impl(&dword_1A35DC000, v6, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: failed, output file is too big (size=%llu)", buf, 0x12u);
      }
      [*(id *)(a1 + 32) failed];
    }
  }
}

uint64_t __44__LPAnimatedImageTranscoder_encodeNextFrame__block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = LPLogChannelTranscoding();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    v5[0] = 67109120;
    v5[1] = loggingID;
    _os_log_impl(&dword_1A35DC000, v3, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: explicitly canceled", (uint8_t *)v5, 8u);
  }
  [(LPAnimatedImageTranscoder *)self failed];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_adaptor, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_sourceImage, 0);
}

- (void)_transcodeWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_transcodeWithCompletionHandler:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_transcodeWithCompletionHandler:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end