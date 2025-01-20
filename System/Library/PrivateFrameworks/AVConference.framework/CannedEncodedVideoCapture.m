@interface CannedEncodedVideoCapture
- (AVAssetReader)assetReader;
- (AVAssetReaderOutputMetadataAdaptor)metadataAdaptor;
- (AVAssetReaderTrackOutput)readerMetadataTrackOutput;
- (AVAssetReaderTrackOutput)readerVideoTrackOutput;
- (AVAssetTrack)metadataTrack;
- (AVAssetTrack)videoTrack;
- (AVURLAsset)compressedFileAsset;
- (CannedEncodedVideoCapture)initWithPath:(id)a3;
- (NSString)movieURLString;
- (VideoScaler)videoScaler;
- (__CVBuffer)createPixelBufferForFrameIndex:(int)a3;
- (double)allFrameRate;
- (int)allFrameCount;
- (int)finalizeVideoCapture;
- (int)frameCount;
- (int)height;
- (int)initialize;
- (int)initializeAssetReader;
- (int)loadCannedMediaAssets;
- (int)loadMetadataTrackFromList:(id)a3 error:(id)a4;
- (int)loadVideoTrackFromList:(id)a3 error:(id)a4;
- (int)setWidth:(int)a3 height:(int)a4;
- (int)width;
- (void)attachMetadataToPixelBuffer:(__CVBuffer *)a3;
- (void)dealloc;
- (void)finalizeVideoCapture;
- (void)getFrameRate:(double *)a3 frameCount:(int *)a4;
- (void)initialize;
- (void)initializeAssetReader;
- (void)loadCannedMediaAssets;
- (void)setAllFrameCount:(int)a3;
- (void)setAllFrameRate:(double)a3;
- (void)setAssetReader:(id)a3;
- (void)setCompressedFileAsset:(id)a3;
- (void)setFrameCount:(int)a3;
- (void)setHeight:(int)a3;
- (void)setMetadataAdaptor:(id)a3;
- (void)setMetadataTrack:(id)a3;
- (void)setMovieURLString:(id)a3;
- (void)setReaderMetadataTrackOutput:(id)a3;
- (void)setReaderVideoTrackOutput:(id)a3;
- (void)setVideoScaler:(id)a3;
- (void)setVideoTrack:(id)a3;
- (void)setWidth:(int)a3;
@end

@implementation CannedEncodedVideoCapture

- (CannedEncodedVideoCapture)initWithPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CannedEncodedVideoCapture;
  v4 = [(CannedEncodedVideoCapture *)&v7 init];
  v5 = v4;
  if (v4)
  {
    pthread_mutex_init(&v4->_inputMutex, 0);
    pthread_mutex_init(&v5->_attributeMutex, 0);
    v5->_frameCount = 0;
    v5->_movieURLString = (NSString *)a3;
    v5->_videoScaler = objc_alloc_init(VideoScaler);
    if ([(CannedEncodedVideoCapture *)v5 initialize])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedEncodedVideoCapture initWithPath:]();
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_inputMutex);
  pthread_mutex_destroy(&self->_attributeMutex);

  metadataTrack = self->_metadataTrack;
  if (metadataTrack) {

  }
  metadataAdaptor = self->_metadataAdaptor;
  if (metadataAdaptor) {

  }
  readerMetadataTrackOutput = self->_readerMetadataTrackOutput;
  if (readerMetadataTrackOutput) {

  }
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool) {
    CFRelease(pixelBufferPool);
  }
  rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
  if (rotatedPixelBufferPool) {
    CFRelease(rotatedPixelBufferPool);
  }
  v8.receiver = self;
  v8.super_class = (Class)CannedEncodedVideoCapture;
  [(CannedEncodedVideoCapture *)&v8 dealloc];
}

- (int)loadVideoTrackFromList:(id)a3 error:(id)a4
{
  if (a4)
  {
    int v6 = -2142633963;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture loadVideoTrackFromList:error:]();
      }
    }
  }
  else if ([a3 count])
  {
    -[CannedEncodedVideoCapture setVideoTrack:](self, "setVideoTrack:", [a3 firstObject]);
    if (self->_videoTrack)
    {
      return 0;
    }
    else
    {
      int v6 = -2142633933;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[CannedEncodedVideoCapture loadVideoTrackFromList:error:]();
          return -2142633933;
        }
      }
    }
  }
  else
  {
    int v6 = -2142633963;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture loadVideoTrackFromList:error:]();
      }
    }
  }
  return v6;
}

- (int)loadMetadataTrackFromList:(id)a3 error:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (a4)
  {
    int v9 = -2142633963;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture loadMetadataTrackFromList:error:]();
      }
    }
  }
  else
  {
    if ([a3 count])
    {
      -[CannedEncodedVideoCapture setMetadataTrack:](self, "setMetadataTrack:", [a3 firstObject]);
      metadataTrack = self->_metadataTrack;
      if (metadataTrack)
      {
        -[CannedEncodedVideoCapture setReaderMetadataTrackOutput:](self, "setReaderMetadataTrackOutput:", [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:metadataTrack outputSettings:0]);
        -[CannedEncodedVideoCapture setMetadataAdaptor:](self, "setMetadataAdaptor:", [MEMORY[0x1E4F16390] assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:self->_readerMetadataTrackOutput]);
        [(AVAssetReader *)self->_assetReader addOutput:self->_readerMetadataTrackOutput];
      }
    }
    int v9 = 0;
  }
  [v7 drain];
  return v9;
}

- (int)finalizeVideoCapture
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)"v024"];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
  -[CannedEncodedVideoCapture setReaderVideoTrackOutput:](self, "setReaderVideoTrackOutput:", [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:self->_videoTrack outputSettings:v4]);
  if (self->_readerVideoTrackOutput)
  {
    -[AVAssetReader addOutput:](self->_assetReader, "addOutput:");
    if ([(AVAssetReader *)self->_assetReader startReading])
    {
      int v6 = 0;
    }
    else
    {
      int v6 = -2142633980;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedEncodedVideoCapture finalizeVideoCapture]();
        }
      }
    }
  }
  else
  {
    int v6 = -2142633933;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[CannedEncodedVideoCapture finalizeVideoCapture]();
        int v6 = -2142633933;
      }
    }
  }
  [v3 drain];
  return v6;
}

- (int)loadCannedMediaAssets
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  if (v3)
  {
    v4 = v3;
    compressedFileAsset = self->_compressedFileAsset;
    uint64_t v6 = *MEMORY[0x1E4F15C18];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke;
    v9[3] = &unk_1E6DB9010;
    v9[5] = v4;
    v9[6] = &v10;
    v9[4] = self;
    [(AVURLAsset *)compressedFileAsset loadTracksWithMediaType:v6 completionHandler:v9];
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v4);
    int v7 = *((_DWORD *)v11 + 6);
  }
  else
  {
    int v7 = -2142633933;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture loadCannedMediaAssets]();
      }
    }
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

intptr_t __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) loadVideoTrackFromList:a2 error:a3];
  uint64_t v4 = *(void *)(a1 + 48);
  if ((*(_DWORD *)(*(void *)(v4 + 8) + 24) & 0x80000000) != 0)
  {
    int v9 = *(NSObject **)(a1 + 40);
    return dispatch_semaphore_signal(v9);
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F15BE0];
    v10[0] = MEMORY[0x1E4F143A8];
    long long v6 = *(_OWORD *)(a1 + 32);
    int v7 = *(void **)(*(void *)(a1 + 32) + 8);
    v10[1] = 3221225472;
    v10[2] = __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke_2;
    v10[3] = &unk_1E6DB9010;
    uint64_t v12 = v4;
    long long v11 = v6;
    return [v7 loadTracksWithMediaType:v5 completionHandler:v10];
  }
}

intptr_t __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) loadMetadataTrackFromList:a2 error:a3];
  if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) & 0x80000000) == 0) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) finalizeVideoCapture];
  }
  uint64_t v4 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v4);
}

- (int)initializeAssetReader
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:self->_movieURLString];
  id v5 = objc_alloc(MEMORY[0x1E4F166C8]);
  uint64_t v22 = *MEMORY[0x1E4F16148];
  v23[0] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = objc_msgSend(v5, "initWithURL:options:", v4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
  if (v6)
  {
    int v7 = (void *)v6;
    [(CannedEncodedVideoCapture *)self setCompressedFileAsset:v6];

    compressedFileAsset = self->_compressedFileAsset;
    if (compressedFileAsset)
    {
      uint64_t v15 = 0;
      -[CannedEncodedVideoCapture setAssetReader:](self, "setAssetReader:", [MEMORY[0x1E4F16378] assetReaderWithAsset:compressedFileAsset error:&v15]);
      if (v15)
      {
        int v13 = -2142633963;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[CannedEncodedVideoCapture initializeAssetReader].cold.4();
          }
        }
      }
      else
      {
        assetReader = self->_assetReader;
        int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (assetReader)
        {
          if (ErrorLogLevelForModule >= 7)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            uint64_t v12 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v17 = v11;
              __int16 v18 = 2080;
              v19 = "-[CannedEncodedVideoCapture initializeAssetReader]";
              __int16 v20 = 1024;
              int v21 = 243;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Enabling AVAssetReader preparesMediaDataForRealTimeConsumption", buf, 0x1Cu);
            }
          }
          [(AVAssetReader *)[(CannedEncodedVideoCapture *)self assetReader] setPreparesMediaDataForRealTimeConsumption:1];
          int v13 = [(CannedEncodedVideoCapture *)self loadCannedMediaAssets];
        }
        else
        {
          int v13 = -2142633933;
          if (ErrorLogLevelForModule >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[CannedEncodedVideoCapture initializeAssetReader]();
            }
          }
        }
      }
    }
    else
    {
      int v13 = -2142633933;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedEncodedVideoCapture initializeAssetReader]();
        }
      }
    }
  }
  else
  {
    int v13 = -2142633947;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture initializeAssetReader]();
      }
    }
  }
  [v3 drain];
  return v13;
}

- (int)initialize
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = [(CannedEncodedVideoCapture *)self initializeAssetReader];
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture initialize]();
      }
    }
  }
  else
  {
    pthread_mutex_lock(&self->_inputMutex);
    [(AVAssetTrack *)self->_videoTrack nominalFrameRate];
    self->_double allFrameRate = v4;
    videoTrack = self->_videoTrack;
    if (videoTrack) {
      [(AVAssetTrack *)videoTrack timeRange];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    CMTime time = *(CMTime *)&v15[1];
    double Seconds = CMTimeGetSeconds(&time);
    [(AVAssetTrack *)self->_videoTrack nominalFrameRate];
    self->_int allFrameCount = (int)(Seconds * v7 + 0.5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double allFrameRate = self->_allFrameRate;
        *(_DWORD *)buf = 136315906;
        uint64_t v18 = v8;
        __int16 v19 = 2080;
        __int16 v20 = "-[CannedEncodedVideoCapture initialize]";
        __int16 v21 = 1024;
        int v22 = 266;
        __int16 v23 = 2048;
        double v24 = allFrameRate;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frame rate is %f", buf, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int allFrameCount = self->_allFrameCount;
        *(_DWORD *)buf = 136315906;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        __int16 v20 = "-[CannedEncodedVideoCapture initialize]";
        __int16 v21 = 1024;
        int v22 = 267;
        __int16 v23 = 1024;
        LODWORD(v24) = allFrameCount;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video contains %d frames", buf, 0x22u);
      }
    }
    pthread_mutex_unlock(&self->_inputMutex);
    objc_msgSend(+[VCCannedAVSync sharedCannedAVSync](VCCannedAVSync, "sharedCannedAVSync"), "addStreamWithCount:rate:", self->_allFrameCount, self->_allFrameRate);
  }
  return v3;
}

- (int)setWidth:(int)a3 height:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_attributeMutex = &self->_attributeMutex;
  pthread_mutex_lock(&self->_attributeMutex);
  self->_width = v5;
  self->_height = v4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316162;
      uint64_t v18 = v8;
      __int16 v19 = 2080;
      __int16 v20 = "-[CannedEncodedVideoCapture setWidth:height:]";
      __int16 v21 = 1024;
      int v22 = 285;
      __int16 v23 = 1024;
      int v24 = v5;
      __int16 v25 = 1024;
      int v26 = v4;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting width: %d height: %d", (uint8_t *)&v17, 0x28u);
    }
  }
  p_pixelBufferPool = (CFTypeRef *)&self->_pixelBufferPool;
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    CFRelease(pixelBufferPool);
    CFTypeRef *p_pixelBufferPool = 0;
  }
  rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
  p_rotatedPixelBufferPool = &self->_rotatedPixelBufferPool;
  uint64_t v12 = rotatedPixelBufferPool;
  if (rotatedPixelBufferPool)
  {
    CFRelease(v12);
    *p_rotatedPixelBufferPool = 0;
  }
  if (+[CannedVideoCapture createPixelBufferPool:p_pixelBufferPool withWidth:v5 height:v4])
  {
    int v15 = -2142633980;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture setWidth:height:]();
      }
    }
  }
  else
  {
    int v15 = +[CannedVideoCapture createPixelBufferPool:p_rotatedPixelBufferPool withWidth:v4 height:v5];
    if (v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedEncodedVideoCapture setWidth:height:]();
        }
      }
      int v15 = -2142633980;
      if (*p_pixelBufferPool)
      {
        CFRelease(*p_pixelBufferPool);
        CFTypeRef *p_pixelBufferPool = 0;
      }
    }
  }
  pthread_mutex_unlock(p_attributeMutex);
  return v15;
}

- (void)attachMetadataToPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVAssetReaderOutputMetadataAdaptor *)self->_metadataAdaptor nextTimedMetadataGroup];
  uint64_t v5 = (void *)MEMORY[0x1E4F16558];
  uint64_t v6 = [(AVTimedMetadataGroup *)v4 items];
  float v7 = (void *)[v5 metadataItemsFromArray:v6 filteredByIdentifier:*MEMORY[0x1E4F1F138]];
  uint64_t v8 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "value"));
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v10);
  }
  VCVideoUtil_AttachMetadata((const __CFArray *)v8, a3);
}

- (__CVBuffer)createPixelBufferForFrameIndex:(int)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  int v24 = 0;
  int frameCount = self->_frameCount;
  if (frameCount > a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:].cold.5();
      }
    }
    if ([(CannedEncodedVideoCapture *)self initializeAssetReader])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:].cold.4();
        }
      }
      goto LABEL_30;
    }
    int frameCount = 0;
    self->_int frameCount = 0;
  }
  if (frameCount >= a3)
  {
LABEL_19:
    long long v15 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_readerVideoTrackOutput copyNextSampleBuffer];
    if (v15) {
      goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]();
      }
    }
    self->_int frameCount = 0;
    if ([(CannedEncodedVideoCapture *)self initializeAssetReader])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]();
        }
      }
    }
    else
    {
LABEL_24:
      ++self->_frameCount;
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v15);
      if (ImageBuffer)
      {
        CVImageBufferRef v17 = ImageBuffer;
        pthread_mutex_lock(&self->_attributeMutex);
        LODWORD(v17) = [(VideoScaler *)self->_videoScaler convertAndScalePixelBuffer:v17 toWidth:self->_width toHeight:self->_height withPixelFormat:*(unsigned int *)"v024" usingPixelBufferPool:self->_pixelBufferPool andStoreTo:&v24];
        pthread_mutex_unlock(&self->_attributeMutex);
        if (v17)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]();
            }
          }
        }
        else if (self->_metadataAdaptor)
        {
          [(CannedEncodedVideoCapture *)self attachMetadataToPixelBuffer:v24];
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        int v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v26 = v21;
          __int16 v27 = 2080;
          v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
          __int16 v29 = 1024;
          int v30 = 380;
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error: copyNextSampleBuffer failed", buf, 0x1Cu);
        }
      }
      if (v15) {
        CFRelease(v15);
      }
    }
  }
  else
  {
    uint64_t v8 = (unsigned char *)MEMORY[0x1E4F47A40];
    uint64_t v9 = (os_log_t *)MEMORY[0x1E4F47A50];
    *(void *)&long long v6 = 136315650;
    long long v23 = v6;
    while (1)
    {
      uint64_t v10 = (const void *)[(AVAssetReaderTrackOutput *)self->_readerVideoTrackOutput copyNextSampleBuffer];
      if (!v10) {
        break;
      }
      CFRelease(v10);
      ++self->_frameCount;
      metadataAdaptor = self->_metadataAdaptor;
      if (metadataAdaptor
        && ![(AVAssetReaderOutputMetadataAdaptor *)metadataAdaptor nextTimedMetadataGroup]
        && (int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *v9;
        long long v14 = *v9;
        if (*v8)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            uint64_t v26 = v12;
            __int16 v27 = 2080;
            v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
            __int16 v29 = 1024;
            int v30 = 365;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d empty metadataGroup while skipping frames", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v23;
          uint64_t v26 = v12;
          __int16 v27 = 2080;
          v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
          __int16 v29 = 1024;
          int v30 = 365;
          _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d empty metadataGroup while skipping frames", buf, 0x1Cu);
        }
      }
      if (self->_frameCount >= a3) {
        goto LABEL_19;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v23;
        uint64_t v26 = v19;
        __int16 v27 = 2080;
        v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
        __int16 v29 = 1024;
        int v30 = 355;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error: copyNextSampleBuffer returned NULL (while skipping frames)", buf, 0x1Cu);
      }
    }
  }
LABEL_30:
  [v5 drain];
  return v24;
}

- (void)getFrameRate:(double *)a3 frameCount:(int *)a4
{
  p_inputMutex = &self->_inputMutex;
  pthread_mutex_lock(&self->_inputMutex);
  if (a3) {
    *a3 = self->_allFrameRate;
  }
  if (a4) {
    *a4 = self->_allFrameCount;
  }

  pthread_mutex_unlock(p_inputMutex);
}

- (AVURLAsset)compressedFileAsset
{
  return self->_compressedFileAsset;
}

- (void)setCompressedFileAsset:(id)a3
{
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
}

- (AVAssetTrack)videoTrack
{
  return self->_videoTrack;
}

- (void)setVideoTrack:(id)a3
{
}

- (AVAssetTrack)metadataTrack
{
  return self->_metadataTrack;
}

- (void)setMetadataTrack:(id)a3
{
}

- (AVAssetReaderTrackOutput)readerVideoTrackOutput
{
  return self->_readerVideoTrackOutput;
}

- (void)setReaderVideoTrackOutput:(id)a3
{
}

- (AVAssetReaderTrackOutput)readerMetadataTrackOutput
{
  return self->_readerMetadataTrackOutput;
}

- (void)setReaderMetadataTrackOutput:(id)a3
{
}

- (AVAssetReaderOutputMetadataAdaptor)metadataAdaptor
{
  return self->_metadataAdaptor;
}

- (void)setMetadataAdaptor:(id)a3
{
}

- (NSString)movieURLString
{
  return self->_movieURLString;
}

- (void)setMovieURLString:(id)a3
{
}

- (VideoScaler)videoScaler
{
  return self->_videoScaler;
}

- (void)setVideoScaler:(id)a3
{
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)allFrameCount
{
  return self->_allFrameCount;
}

- (void)setAllFrameCount:(int)a3
{
  self->_int allFrameCount = a3;
}

- (double)allFrameRate
{
  return self->_allFrameRate;
}

- (void)setAllFrameRate:(double)a3
{
  self->_double allFrameRate = a3;
}

- (int)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int)a3
{
  self->_int frameCount = a3;
}

- (void)initWithPath:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d failed!", v2, v3, v4, v5, v6);
}

- (void)loadVideoTrackFromList:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No video tracks available.", v2, v3, v4, v5, v6);
}

- (void)loadVideoTrackFromList:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Instantiation of AVAssetTrack failed.", v2, v3, v4, v5, v6);
}

- (void)loadVideoTrackFromList:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load video tracks error=%@");
}

- (void)loadMetadataTrackFromList:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load metadata tracks error=%@");
}

- (void)finalizeVideoCapture
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d assetReader couldn't start reading", v2, v3, v4, v5, v6);
}

- (void)loadCannedMediaAssets
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the semaphore", v2, v3, v4, v5, v6);
}

- (void)initializeAssetReader
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVAssetReader error with asset error=%@");
}

- (void)initialize
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize AssetReader", v2, v3, v4, v5, v6);
}

- (void)setWidth:height:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[CannedEncodedVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Rotated PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedEncodedVideoCapture setWidth:height:]" >> 16, 308);
}

- (void)setWidth:height:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[CannedEncodedVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedEncodedVideoCapture setWidth:height:]" >> 16, 297);
}

- (void)createPixelBufferForFrameIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d failed to rescale pixel buffer", v2, v3, v4, v5, v6);
}

- (void)createPixelBufferForFrameIndex:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize AssetReader", v2, v3, v4, v5, v6);
}

- (void)createPixelBufferForFrameIndex:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d error: copyNextSampleBuffer returned NULL", v2, v3, v4, v5, v6);
}

- (void)createPixelBufferForFrameIndex:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize AssetReader", v2, v3, v4, v5, v6);
}

- (void)createPixelBufferForFrameIndex:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d requested frameIndex smaller than previously decoded frame index, rewind the video to the beginning", v2, v3, v4, v5, v6);
}

@end