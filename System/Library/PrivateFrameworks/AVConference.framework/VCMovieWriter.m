@interface VCMovieWriter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- (BOOL)finishWritingInvoked;
- (BOOL)shouldAppendSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5;
- (BOOL)shouldFinishWritingSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5;
- (NSString)transactionID;
- (NSURL)outputURL;
- (VCMovieWriter)initWithOutputURL:(id)a3 transactionID:(id)a4 videoCodec:(unsigned int)a5 keyFrameIntervalDuration:(double)a6;
- (VCSandboxedURL)directoryURL;
- (id)addAudioTrackForLocalAudio:(BOOL)a3;
- (id)addStillImageMetadataTrackWithTransactionID:(id)a3;
- (id)addVideoTrackWithWidth:(int)a3 height:(int)a4;
- (id)setupAssetWriterWithWidth:(int)a3 height:(int)a4 transactionID:(id)a5;
- (id)setupAudioAssetWriterWithTransactionID:(id)a3;
- (id)setupLivePhotoAssetWithTransactionID:(id)a3;
- (unsigned)endRTPTimeStamp;
- (unsigned)startRTPTimeStamp;
- (unsigned)writerMode;
- (void)appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 mediaType:(unsigned __int8)a4;
- (void)appendMetaData;
- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraStatus:(unsigned __int8)a4 mediaType:(unsigned __int8)a5;
- (void)cleanupAssetWriter;
- (void)completeWriting;
- (void)dealloc;
- (void)finishWritingWithHandler:(id)a3;
- (void)processSampleQueue:(opaqueCMBufferQueue *)a3 input:(id)a4 lastPresentationTime:(id *)a5;
- (void)setDirectoryURL:(id)a3;
- (void)setEndRTPTimeStamp:(unsigned int)a3;
- (void)setEndRTPTimestampWithTimestamp:(unsigned int)a3;
- (void)setMovieFragmentInterval:(id *)a3;
- (void)setOutputURL:(id)a3;
- (void)setStartRTPTimeStamp:(unsigned int)a3;
- (void)setStillImageTime:(id *)a3;
- (void)setupInput:(id)a3 queue:(opaqueCMBufferQueue *)a4 dispatchGroup:(id)a5 lastPresentationTime:(id *)a6;
- (void)setupInputs;
- (void)setupVisibleRect:(CGRect)a3 withCaptureHeight:(int)a4;
- (void)setupWriterWithMode:(unsigned __int8)a3;
- (void)startWritingAtTime:(id *)a3;
@end

@implementation VCMovieWriter

- (VCMovieWriter)initWithOutputURL:(id)a3 transactionID:(id)a4 videoCodec:(unsigned int)a5 keyFrameIntervalDuration:(double)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)VCMovieWriter;
  v10 = [(VCObject *)&v21 init];
  if (v10)
  {
    *((void *)v10 + 43) = [a3 copy];
    *((void *)v10 + 21) = [a4 copy];
    uint64_t v11 = MEMORY[0x1E4F1F9F8];
    long long v12 = *MEMORY[0x1E4F1F9F8];
    *((_OWORD *)v10 + 11) = *MEMORY[0x1E4F1F9F8];
    uint64_t v13 = *(void *)(v11 + 16);
    *((void *)v10 + 24) = v13;
    *(_OWORD *)(v10 + 200) = v12;
    *((void *)v10 + 27) = v13;
    *((_OWORD *)v10 + 14) = v12;
    *((void *)v10 + 30) = v13;
    *((_OWORD *)v10 + 17) = v12;
    long long v20 = v12;
    *((void *)v10 + 36) = v13;
    v10[352] = 2;
    *((_DWORD *)v10 + 89) = 0;
    *((_DWORD *)v10 + 90) = 0;
    *((_DWORD *)v10 + 111) = 0;
    *(_OWORD *)(v10 + 248) = v12;
    *((void *)v10 + 33) = v13;
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CallbacksForSampleBuffersSortedByOutputPTS = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    CMBufferQueueCreate(v14, 0, CallbacksForSampleBuffersSortedByOutputPTS, (CMBufferQueueRef *)v10 + 46);
    v16 = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    CMBufferQueueCreate(v14, 0, v16, (CMBufferQueueRef *)v10 + 47);
    v17 = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    CMBufferQueueCreate(v14, 0, v17, (CMBufferQueueRef *)v10 + 48);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    *((void *)v10 + 49) = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMovieWriter.serializationQueue", 0, CustomRootQueue);
    *((_DWORD *)v10 + 110) = a5;
    *((double *)v10 + 57) = a6;
    *((void *)v10 + 61) = v13;
    *(_OWORD *)(v10 + 472) = v20;
  }
  return (VCMovieWriter *)v10;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];

  [(VCMovieWriter *)self cleanupAssetWriter];
  videoQueue = self->_videoQueue;
  if (videoQueue) {
    CFRelease(videoQueue);
  }
  localAudioQueue = self->_localAudioQueue;
  if (localAudioQueue) {
    CFRelease(localAudioQueue);
  }
  remoteAudioQueue = self->_remoteAudioQueue;
  if (remoteAudioQueue) {
    CFRelease(remoteAudioQueue);
  }
  _Block_release(self->_completionHandler);
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v7 = self->_transferSession;
    if (v7)
    {
      CFRelease(v7);
      self->_transferSession = 0;
    }
  }
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
  }
  serializationQueue = self->_serializationQueue;
  if (serializationQueue)
  {
    dispatch_release(serializationQueue);
    self->_serializationQueue = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)VCMovieWriter;
  [(VCObject *)&v10 dealloc];
}

- (void)setupWriterWithMode:(unsigned __int8)a3
{
  self->_writerMode = a3;
}

- (void)setupVisibleRect:(CGRect)a3 withCaptureHeight:(int)a4
{
  if (self->_transferSession || (p_bufferPool = &self->_bufferPool, self->_bufferPool))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter setupVisibleRect:withCaptureHeight:]();
      }
    }
  }
  else
  {
    self->_double visibleWidth = a3.size.width * (double)a4 / a3.size.height;
    self->_double visibleHeight = (double)a4;
    self->_double visibleWidth = (double)(int)((int)self->_visibleWidth & 0xFFFFFFFC);
    self->_double visibleHeight = (double)(int)((int)self->_visibleHeight & 0xFFFFFFFC);
    self->_transferSession = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
    double visibleWidth = self->_visibleWidth;
    double visibleHeight = self->_visibleHeight;
    VCMediaRecorderUtil_SetupBufferPool(@"AVConference:MovieWriter", p_bufferPool, visibleWidth, visibleHeight);
  }
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraStatus:(unsigned __int8)a4 mediaType:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (CMBufferQueueContainsEndOfData(self->_videoQueue))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.4();
      }
    }
  }
  else
  {
    if (self->_assetWriter || VCMediaWriterUtil_IsAudioOnly(self->_writerMode)) {
      goto LABEL_10;
    }
    if (VCDefaults_GetManagedBoolValueForKey(@"enableLocalVideoRecording", 0))
    {
      double visibleWidth = self->_visibleWidth;
      if (visibleWidth == 0.0 || (double Height = self->_visibleHeight, Height == 0.0))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        self->_double visibleWidth = (double)CVPixelBufferGetWidth(ImageBuffer);
        long long v12 = CMSampleBufferGetImageBuffer(a3);
        double Height = (double)CVPixelBufferGetHeight(v12);
        self->_double visibleHeight = Height;
        double visibleWidth = self->_visibleWidth;
      }
      -[VCMovieWriter setupVisibleRect:withCaptureHeight:](self, "setupVisibleRect:withCaptureHeight:", (int)Height, 0.0, 0.0, visibleWidth);
      CMSampleBufferGetPresentationTimeStamp(&v29, a3);
      [(VCMovieWriter *)self setStillImageTime:&v29];
    }
    if (![(VCMovieWriter *)self setupAssetWriterWithWidth:(int)self->_visibleWidth height:(int)self->_visibleHeight transactionID:self->_transactionID])
    {
LABEL_10:
      uint64_t v13 = CMSampleBufferGetImageBuffer(a3);
      memset(&v28, 170, sizeof(v28));
      CMSampleBufferGetPresentationTimeStamp(&v28, a3);
      size_t Width = CVPixelBufferGetWidth(v13);
      size_t v15 = CVPixelBufferGetHeight(v13);
      ResizeFrame = VCMediaRecorderUtil_CreateResizeFrame(v13, self->_transferSession, self->_bufferPool);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        v19 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            CMTime time = v28;
            Float64 Seconds = CMTimeGetSeconds(&time);
            size_t v21 = CVPixelBufferGetWidth(ResizeFrame);
            size_t v22 = CVPixelBufferGetHeight(ResizeFrame);
            LODWORD(time.value) = 136317442;
            *(CMTimeValue *)((char *)&time.value + 4) = v17;
            LOWORD(time.flags) = 2080;
            *(void *)((char *)&time.flags + 2) = "-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
            HIWORD(time.epoch) = 1024;
            int v31 = 173;
            __int16 v32 = 1024;
            int v33 = v6;
            __int16 v34 = 1024;
            int v35 = v5;
            __int16 v36 = 2048;
            size_t v37 = Width;
            __int16 v38 = 2048;
            size_t v39 = v15;
            __int16 v40 = 2048;
            Float64 v41 = Seconds;
            __int16 v42 = 2048;
            size_t v43 = v21;
            __int16 v44 = 2048;
            size_t v45 = v22;
            _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cameraStatus=0x%02x, type=%d, originalWidth=%lu, originalHeight=%lu, presentationTime=%f, width=%lu, height=%lu", (uint8_t *)&time, 0x5Au);
            if (!ResizeFrame)
            {
LABEL_24:
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]();
                }
              }
              return;
            }
            goto LABEL_17;
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          CMTime time = v28;
          Float64 v25 = CMTimeGetSeconds(&time);
          size_t v26 = CVPixelBufferGetWidth(ResizeFrame);
          size_t v27 = CVPixelBufferGetHeight(ResizeFrame);
          LODWORD(time.value) = 136317442;
          *(CMTimeValue *)((char *)&time.value + 4) = v17;
          LOWORD(time.flags) = 2080;
          *(void *)((char *)&time.flags + 2) = "-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
          HIWORD(time.epoch) = 1024;
          int v31 = 173;
          __int16 v32 = 1024;
          int v33 = v6;
          __int16 v34 = 1024;
          int v35 = v5;
          __int16 v36 = 2048;
          size_t v37 = Width;
          __int16 v38 = 2048;
          size_t v39 = v15;
          __int16 v40 = 2048;
          Float64 v41 = v25;
          __int16 v42 = 2048;
          size_t v43 = v26;
          __int16 v44 = 2048;
          size_t v45 = v27;
          _os_log_debug_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEBUG, " [%s] %s:%d cameraStatus=0x%02x, type=%d, originalWidth=%lu, originalHeight=%lu, presentationTime=%f, width=%lu, height=%lu", (uint8_t *)&time, 0x5Au);
          if (!ResizeFrame) {
            goto LABEL_24;
          }
          goto LABEL_17;
        }
      }
      if (!ResizeFrame) {
        goto LABEL_24;
      }
LABEL_17:
      CMTime time = v28;
      CMSampleBufferRef SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(ResizeFrame, (long long *)&time.value);
      OSStatus v24 = CMBufferQueueEnqueue(self->_videoQueue, SampleBufferWithPixelBuffer);
      FigSampleBufferRelease();
      if (v24)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]();
          }
        }
      }
      CVPixelBufferRelease(ResizeFrame);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]();
      }
    }
  }
}

- (void)appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 mediaType:(unsigned __int8)a4
{
  if (a4 == 1)
  {
    int v6 = &OBJC_IVAR___VCMovieWriter__localAudioQueue;
  }
  else
  {
    if (a4 != 2) {
      goto LABEL_10;
    }
    int v6 = &OBJC_IVAR___VCMovieWriter__remoteAudioQueue;
  }
  uint64_t v7 = *v6;
  v8 = *(Class *)((char *)&self->super.super.isa + v7);
  if (v8)
  {
    if (CMBufferQueueContainsEndOfData(*(CMBufferQueueRef *)((char *)&self->super.super.isa + v7)))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMovieWriter appendAudioSampleBuffer:mediaType:]();
        }
      }
    }
    else
    {
      if (!self->_assetWriter && VCMediaWriterUtil_IsAudioOnly(self->_writerMode)) {
        [(VCMovieWriter *)self setupAudioAssetWriterWithTransactionID:self->_transactionID];
      }
      if (CMBufferQueueEnqueue(v8, a3))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMovieWriter appendAudioSampleBuffer:mediaType:]();
          }
        }
      }
    }
    return;
  }
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMovieWriter appendAudioSampleBuffer:mediaType:]();
    }
  }
}

- (void)setEndRTPTimestampWithTimestamp:(unsigned int)a3
{
  self->_endRTPTimeStamp = a3;
  self->_isEndRTPTimestampSet = 1;
}

- (BOOL)shouldAppendSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 > 2)
    {
      if ((self->_startTime.flags & 1) == 0)
      {
        CMTime time = (CMTime)self->_stillImageTime;
        double Seconds = CMTimeGetSeconds(&time);
        CMSampleBufferGetPresentationTimeStamp(&v17, a3);
        if (Seconds - CMTimeGetSeconds(&v17) <= 1.0)
        {
LABEL_10:
          LOBYTE(IsMediaExpected) = 1;
          return IsMediaExpected;
        }
      }
      CMSampleBufferGetPresentationTimeStamp(&v16, a3);
      double v11 = CMTimeGetSeconds(&v16);
      CMTime time = (CMTime)self->_startTime;
      LOBYTE(IsMediaExpected) = v11 - CMTimeGetSeconds(&time) < 3.0;
    }
    else
    {
      unsigned int mediaState = self->_mediaState;
      if (mediaState - 1 < 2)
      {
        if (self->_isEndRTPTimestampSet && self->_endRTPTimeStamp < a4)
        {
LABEL_20:
          LOBYTE(IsMediaExpected) = 0;
          return IsMediaExpected;
        }
        goto LABEL_10;
      }
      if (mediaState) {
        goto LABEL_20;
      }
      unsigned int startRTPTimeStamp = self->_startRTPTimeStamp;
      BOOL v13 = a4 - startRTPTimeStamp < 0x7FFFFFFF && a4 < startRTPTimeStamp;
      if (a4 <= startRTPTimeStamp && !v13) {
        goto LABEL_20;
      }
      LOBYTE(IsMediaExpected) = 1;
      self->_unsigned int mediaState = 1;
    }
  }
  return IsMediaExpected;
}

- (BOOL)shouldFinishWritingSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 <= 2)
    {
      if (self->_mediaState == 1 && self->_isEndRTPTimestampSet)
      {
        unsigned int endRTPTimeStamp = self->_endRTPTimeStamp;
        BOOL v10 = a4 >= endRTPTimeStamp;
        unsigned int v11 = a4 - endRTPTimeStamp;
        if (v11 != 0 && v10) {
          goto LABEL_38;
        }
        if (!v10 && v11 < 0x7FFFFFFF) {
          goto LABEL_38;
        }
      }
      goto LABEL_28;
    }
    if (!a3) {
      goto LABEL_28;
    }
    if (CMBufferQueueContainsEndOfData(self->_videoQueue))
    {
      if ((VCMovieWriter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_28;
        }
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        LOBYTE(IsMediaExpected) = 0;
        if (!v19) {
          return IsMediaExpected;
        }
        LODWORD(startTime.value) = 136315650;
        *(CMTimeValue *)((char *)&startTime.value + 4) = v17;
        LOWORD(startTime.flags) = 2080;
        *(void *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
        HIWORD(startTime.epoch) = 1024;
        int v40 = 266;
        long long v20 = " [%s] %s:%d finishWritingWithHandler was executed, return NO";
        size_t v21 = v18;
        uint32_t v22 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          BOOL v13 = (__CFString *)[(VCMovieWriter *)self performSelector:sel_logPrefix];
        }
        else {
          BOOL v13 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_28;
        }
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        OSStatus v24 = *MEMORY[0x1E4F47A50];
        BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        LOBYTE(IsMediaExpected) = 0;
        if (!v25) {
          return IsMediaExpected;
        }
        LODWORD(startTime.value) = 136316162;
        *(CMTimeValue *)((char *)&startTime.value + 4) = v23;
        LOWORD(startTime.flags) = 2080;
        *(void *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
        HIWORD(startTime.epoch) = 1024;
        int v40 = 266;
        __int16 v41 = 2112;
        Float64 v42 = *(double *)&v13;
        __int16 v43 = 2048;
        Float64 v44 = *(double *)&self;
        long long v20 = " [%s] %s:%d %@(%p) finishWritingWithHandler was executed, return NO";
        size_t v21 = v24;
        uint32_t v22 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&startTime, v22);
      goto LABEL_28;
    }
    CMSampleBufferGetPresentationTimeStamp(&time, a3);
    double Seconds = CMTimeGetSeconds(&time);
    p_CMTime startTime = &self->_startTime;
    CMTime startTime = (CMTime)self->_startTime;
    if (Seconds - CMTimeGetSeconds(&startTime) <= 3.0)
    {
LABEL_28:
      LOBYTE(IsMediaExpected) = 0;
      return IsMediaExpected;
    }
    if ((VCMovieWriter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_38;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      size_t v27 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      CMTime startTime = (CMTime)self->_stillImageTime;
      Float64 v28 = CMTimeGetSeconds(&startTime);
      *(_OWORD *)&startTime.value = *(_OWORD *)&p_startTime->value;
      startTime.epoch = self->_startTime.epoch;
      Float64 v29 = CMTimeGetSeconds(&startTime);
      LODWORD(startTime.value) = 136316162;
      *(CMTimeValue *)((char *)&startTime.value + 4) = v26;
      LOWORD(startTime.flags) = 2080;
      *(void *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
      HIWORD(startTime.epoch) = 1024;
      int v40 = 270;
      __int16 v41 = 2048;
      Float64 v42 = v28;
      __int16 v43 = 2048;
      Float64 v44 = v29;
      v30 = " [%s] %s:%d PresentationTime=%f, startTime=%f";
      int v31 = v27;
      uint32_t v32 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        CMTime v16 = (__CFString *)[(VCMovieWriter *)self performSelector:sel_logPrefix];
      }
      else {
        CMTime v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_38;
      }
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      __int16 v34 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      CMTime startTime = (CMTime)self->_stillImageTime;
      Float64 v35 = CMTimeGetSeconds(&startTime);
      *(_OWORD *)&startTime.value = *(_OWORD *)&p_startTime->value;
      startTime.epoch = self->_startTime.epoch;
      Float64 v36 = CMTimeGetSeconds(&startTime);
      LODWORD(startTime.value) = 136316674;
      *(CMTimeValue *)((char *)&startTime.value + 4) = v33;
      LOWORD(startTime.flags) = 2080;
      *(void *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
      HIWORD(startTime.epoch) = 1024;
      int v40 = 270;
      __int16 v41 = 2112;
      Float64 v42 = *(double *)&v16;
      __int16 v43 = 2048;
      Float64 v44 = *(double *)&self;
      __int16 v45 = 2048;
      Float64 v46 = v35;
      __int16 v47 = 2048;
      Float64 v48 = v36;
      v30 = " [%s] %s:%d %@(%p) PresentationTime=%f, startTime=%f";
      int v31 = v34;
      uint32_t v32 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&startTime, v32);
LABEL_38:
    LOBYTE(IsMediaExpected) = 1;
  }
  return IsMediaExpected;
}

- (void)setStillImageTime:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_stillImageTime = &self->_stillImageTime;
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.epoch = var3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      $95D729B680665BEAEFA1D6FCA8238556 v8 = *p_stillImageTime;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v8);
      LODWORD(v8.value) = 136315906;
      *(int64_t *)((char *)&v8.value + 4) = v5;
      LOWORD(v8.flags) = 2080;
      *(void *)((char *)&v8.flags + 2) = "-[VCMovieWriter setStillImageTime:]";
      HIWORD(v8.epoch) = 1024;
      int v9 = 279;
      __int16 v10 = 2048;
      Float64 v11 = Seconds;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _stillImageTime=%f", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)finishWritingWithHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self->_finishWritingInvoked = 1;
  AVAssetWriterStatus v5 = [(AVAssetWriter *)self->_assetWriter status];
  if ((VCMovieWriter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      $95D729B680665BEAEFA1D6FCA8238556 v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)OSStatus v24 = 136315906;
        *(void *)&v24[4] = v7;
        *(_WORD *)&v24[12] = 2080;
        *(void *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 285;
        WORD2(v25) = 2048;
        *(void *)((char *)&v25 + 6) = v5;
        int v9 = " [%s] %s:%d _assetWriter.status=%ld";
        __int16 v10 = v8;
        uint32_t v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v24, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v6 = (__CFString *)[(VCMovieWriter *)self performSelector:sel_logPrefix];
    }
    else {
      int v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      BOOL v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)OSStatus v24 = 136316418;
        *(void *)&v24[4] = v12;
        *(_WORD *)&v24[12] = 2080;
        *(void *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 285;
        WORD2(v25) = 2112;
        *(void *)((char *)&v25 + 6) = v6;
        HIWORD(v25) = 2048;
        uint64_t v26 = self;
        *(_WORD *)size_t v27 = 2048;
        *(void *)&v27[2] = v5;
        int v9 = " [%s] %s:%d %@(%p) _assetWriter.status=%ld";
        __int16 v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_11;
      }
    }
  }
  if (v5 != AVAssetWriterStatusWriting)
  {
    if (!a3) {
      return;
    }
    size_t v15 = [(AVAssetWriter *)self->_assetWriter error];
    if ((VCMovieWriter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_26;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)OSStatus v24 = 136316162;
      *(void *)&v24[4] = v17;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 298;
      WORD2(v25) = 2048;
      *(void *)((char *)&v25 + 6) = v5;
      HIWORD(v25) = 2112;
      uint64_t v26 = (VCMovieWriter *)v15;
      BOOL v19 = " [%s] %s:%d Invalid assetWriter status=%ld, error=%@";
      long long v20 = v18;
      uint32_t v21 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        CMTime v16 = (__CFString *)[(VCMovieWriter *)self performSelector:sel_logPrefix];
      }
      else {
        CMTime v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v22 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v23 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_26:
        if (v15)
        {
LABEL_28:
          (*((void (**)(id, void, NSError *))a3 + 2))(a3, 0, v15);
          return;
        }
LABEL_27:
        size_t v15 = (NSError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"VCMovieWriter", -1, 0, *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]);
        goto LABEL_28;
      }
      *(_DWORD *)OSStatus v24 = 136316674;
      *(void *)&v24[4] = v22;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 298;
      WORD2(v25) = 2112;
      *(void *)((char *)&v25 + 6) = v16;
      HIWORD(v25) = 2048;
      uint64_t v26 = self;
      *(_WORD *)size_t v27 = 2048;
      *(void *)&v27[2] = v5;
      *(_WORD *)&v27[10] = 2112;
      *(void *)&v27[12] = v15;
      BOOL v19 = " [%s] %s:%d %@(%p) Invalid assetWriter status=%ld, error=%@";
      long long v20 = v23;
      uint32_t v21 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v19, v24, v21);
    if (v15) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  self->_unsigned int mediaState = 2;
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = _Block_copy(a3);
  if (completionHandler) {
    _Block_release(completionHandler);
  }
  CMBufferQueueMarkEndOfData(self->_videoQueue);
  CMBufferQueueMarkEndOfData(self->_localAudioQueue);
  CMBufferQueueMarkEndOfData(self->_remoteAudioQueue);
}

- (id)setupLivePhotoAssetWithTransactionID:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F165A0]);
  int v6 = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter setupLivePhotoAssetWithTransactionID:]();
      }
    }
    goto LABEL_11;
  }
  [v5 setKey:@"com.apple.quicktime.content.identifier"];
  [v6 setKeySpace:@"mdta"];
  [v6 setValue:a3];
  uint64_t v7 = *MEMORY[0x1E4F1F078];
  [v6 setDataType:*MEMORY[0x1E4F1F078]];
  id v8 = objc_alloc_init(MEMORY[0x1E4F165A0]);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter setupLivePhotoAssetWithTransactionID:]();
      }
    }
LABEL_11:
    __int16 v10 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMovieWriter" code:-2 userInfo:0];
    int v9 = 0;
    goto LABEL_4;
  }
  int v9 = v8;
  [v8 setKey:*MEMORY[0x1E4F15E90]];
  [v9 setKeySpace:*MEMORY[0x1E4F15DF8]];
  [v9 setValue:@"FaceTime"];
  [v9 setDataType:v7];
  v12[0] = v6;
  v12[1] = v9;
  -[AVAssetWriter setMetadata:](self->_assetWriter, "setMetadata:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2]);
  __int16 v10 = 0;
LABEL_4:

  return v10;
}

- (id)addAudioTrackForLocalAudio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  int v21 = 0;
  uint64_t v20 = 0;
  int v17 = 6619138;
  uint64_t v5 = *MEMORY[0x1E4F15228];
  v15[0] = *MEMORY[0x1E4F151E0];
  v15[1] = v5;
  v16[0] = &unk_1F3DC6048;
  v16[1] = &unk_1F3DC6060;
  v16[2] = &unk_1F3DC8B70;
  uint64_t v6 = *MEMORY[0x1E4F15198];
  v15[2] = *MEMORY[0x1E4F15270];
  v15[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v17 length:32];
  v15[4] = *MEMORY[0x1E4F151C0];
  v16[3] = v7;
  v16[4] = &unk_1F3DC6078;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  id v9 = objc_alloc(MEMORY[0x1E4F163C0]);
  __int16 v10 = (objc_class *)[v9 initWithMediaType:*MEMORY[0x1E4F15BA8] outputSettings:v8];
  if (v10)
  {
    uint32_t v11 = v10;
    [(objc_class *)v10 setExpectsMediaDataInRealTime:1];
    [(AVAssetWriter *)self->_assetWriter addInput:v11];
    if (v3)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 312;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 320;
    }
    *(Class *)((char *)&self->super.super.isa + v13) = v11;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter addAudioTrackForLocalAudio:]();
      }
    }
    return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMovieWriter" code:-2 userInfo:0];
  }
  return v12;
}

- (id)addVideoTrackWithWidth:(int)a3 height:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v35[5] = *MEMORY[0x1E4F143B8];
  if (VCDefaults_GetManagedBoolValueForKey(@"enableLocalVideoRecording", 0)) {
    uint64_t v7 = &unk_1F3DC60A8;
  }
  else {
    uint64_t v7 = &unk_1F3DC6090;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = *MEMORY[0x1E4F162D0];
  unsigned int codec = self->_codec;
  v34[0] = *MEMORY[0x1E4F16278];
  v34[1] = v9;
  uint32_t v11 = (uint64_t *)MEMORY[0x1E4F162C8];
  if (codec != 1635148593) {
    uint32_t v11 = (uint64_t *)MEMORY[0x1E4F452D0];
  }
  uint64_t v12 = *v11;
  v35[0] = &unk_1F3DC60C0;
  v35[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F161D8];
  v35[2] = v7;
  uint64_t v14 = *MEMORY[0x1E4F162A8];
  v34[2] = v13;
  v34[3] = v14;
  uint64_t v15 = [NSNumber numberWithInt:(int)(self->_keyFrameIntervalDuration * 30.0)];
  v34[4] = *MEMORY[0x1E4F161C0];
  v35[3] = v15;
  v35[4] = MEMORY[0x1E4F1CC28];
  objc_msgSend(v8, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v35, v34, 5));
  uint64_t v16 = *MEMORY[0x1E4F16248];
  uint64_t v17 = *MEMORY[0x1E4F162E0];
  v32[0] = *MEMORY[0x1E4F16240];
  v32[1] = v17;
  uint64_t v18 = *MEMORY[0x1E4F162F0];
  v33[0] = v16;
  v33[1] = v18;
  v32[2] = *MEMORY[0x1E4F16308];
  v33[2] = *MEMORY[0x1E4F16310];
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  uint64_t v20 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v21 = *MEMORY[0x1E4F16220];
  uint64_t v22 = (void *)MEMORY[0x1E4F16230];
  if (self->_codec == 1635148593) {
    uint64_t v22 = (void *)MEMORY[0x1E4F16210];
  }
  v31[0] = *v22;
  v31[1] = objc_msgSend(NSNumber, "numberWithInt:", v5, v21, *MEMORY[0x1E4F16300]);
  v30[2] = *MEMORY[0x1E4F162A0];
  uint64_t v23 = [NSNumber numberWithInt:v4];
  uint64_t v24 = *MEMORY[0x1E4F16268];
  v31[2] = v23;
  v31[3] = v8;
  uint64_t v25 = *MEMORY[0x1E4F16258];
  v30[3] = v24;
  v30[4] = v25;
  v31[4] = v19;
  uint64_t v26 = objc_msgSend(v20, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v31, v30, 5));
  id v27 = objc_alloc(MEMORY[0x1E4F163C0]);
  uint64_t v28 = (AVAssetWriterInput *)[v27 initWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v26];
  self->_videoInput = v28;
  if (v28)
  {
    [(AVAssetWriterInput *)v28 setExpectsMediaDataInRealTime:1];
    [(AVAssetWriter *)self->_assetWriter addInput:self->_videoInput];
    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter addVideoTrackWithWidth:height:]();
      }
    }
    return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMovieWriter" code:-2 userInfo:0];
  }
}

- (id)addStillImageMetadataTrackWithTransactionID:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  uint64_t v4 = *MEMORY[0x1E4F1F0F8];
  v15[0] = *MEMORY[0x1E4F1F108];
  v15[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1F048];
  v16[0] = *MEMORY[0x1E4F218A0];
  v16[1] = v5;
  v17[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  CFArrayRef v6 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v6, &formatDescriptionOut);
  if (!formatDescriptionOut)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter addStillImageMetadataTrackWithTransactionID:]();
      }
    }
    goto LABEL_14;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F163C0]);
  uint64_t v8 = (void *)[v7 initWithMediaType:*MEMORY[0x1E4F15BE0] outputSettings:0 sourceFormatHint:formatDescriptionOut];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter addStillImageMetadataTrackWithTransactionID:]();
      }
    }
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  self->_metadataInput = (AVAssetWriterInput *)v8;
  __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F163D0]) initWithAssetWriterInput:self->_metadataInput];
  if (v10)
  {
    uint32_t v11 = v10;
    self->_adapter = (AVAssetWriterInputMetadataAdaptor *)v10;
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", [v11 assetWriterInput]);
    uint64_t v12 = 0;
    self->_hasStillImageMetadataTrack = 1;
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMovieWriter addStillImageMetadataTrackWithTransactionID:]();
    }
  }
LABEL_15:
  uint64_t v12 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMovieWriter" code:-2 userInfo:0];
  uint32_t v11 = 0;
LABEL_5:

  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return v12;
}

- (id)setupAssetWriterWithWidth:(int)a3 height:(int)a4 transactionID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v24 = v9;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:]";
      __int16 v27 = 1024;
      int v28 = 454;
      __int16 v29 = 1024;
      *(_DWORD *)v30 = v7;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v6;
      *(_WORD *)int v31 = 2112;
      *(void *)&v31[2] = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, transactionID=%@", buf, 0x32u);
    }
  }
  id v22 = 0;
  if (v7 && v6)
  {
    uint64_t v11 = MEMORY[0x1E4F1F9F8];
    long long v12 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_lastVideoPresentationTime.value = *MEMORY[0x1E4F1F9F8];
    int64_t v13 = *(void *)(v11 + 16);
    self->_lastVideoPresentationTime.int64_t epoch = v13;
    *(_OWORD *)&self->_lastLocalAudioPresentationTime.value = v12;
    self->_lastLocalAudioPresentationTime.int64_t epoch = v13;
    *(_OWORD *)&self->_lastRemoteAudioPresentationTime.value = v12;
    self->_lastRemoteAudioPresentationTime.int64_t epoch = v13;
    id v14 = objc_alloc(MEMORY[0x1E4F163B8]);
    self->_assetWriter = (AVAssetWriter *)[v14 initWithURL:self->_outputURL fileType:*MEMORY[0x1E4F15AB0] error:&v22];
    if (v22)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.7();
        }
      }
    }
    else
    {
      id v22 = [(VCMovieWriter *)self setupLivePhotoAssetWithTransactionID:a5];
      if (v22)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.6();
          }
        }
      }
      else
      {
        id v22 = [(VCMovieWriter *)self addVideoTrackWithWidth:v7 height:v6];
        if (v22)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.5();
            }
          }
        }
        else if (VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode) {
               && (id v22 = [(VCMovieWriter *)self addAudioTrackForLocalAudio:1]) != 0)
        }
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.4();
            }
          }
        }
        else if (VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode) {
               && (id v22 = [(VCMovieWriter *)self addAudioTrackForLocalAudio:0]) != 0)
        }
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:]();
            }
          }
        }
        else
        {
          id v22 = [(VCMovieWriter *)self addStillImageMetadataTrackWithTransactionID:a5];
          if (v22)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:]();
              }
            }
          }
          else
          {
            if (self->_movieFragmentInterval.flags)
            {
              long long v20 = *(_OWORD *)&self->_movieFragmentInterval.value;
              int64_t epoch = self->_movieFragmentInterval.epoch;
              [(AVAssetWriter *)self->_assetWriter setMovieFragmentInterval:&v20];
            }
            if (![(AVAssetWriter *)self->_assetWriter startWriting]
              && (int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v15 = VRTraceErrorLogLevelToCSTR();
              uint64_t v16 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                AVAssetWriterStatus v18 = [(AVAssetWriter *)self->_assetWriter status];
                uint64_t v19 = [(AVAssetWriter *)self->_assetWriter error];
                *(_DWORD *)buf = 136316418;
                uint64_t v24 = v15;
                __int16 v25 = 2080;
                uint64_t v26 = "-[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:]";
                __int16 v27 = 1024;
                int v28 = 489;
                __int16 v29 = 2112;
                *(void *)v30 = a5;
                *(_WORD *)&v30[8] = 2048;
                *(void *)int v31 = v18;
                *(_WORD *)&v31[8] = 2112;
                uint32_t v32 = v19;
                _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d assetWriter startWriting failed, transactionID=%@, status=%ld, error=%@", buf, 0x3Au);
              }
            }
            [(VCMovieWriter *)self setupInputs];
          }
        }
      }
    }
    if (v22)
    {
      [(VCMovieWriter *)self cleanupAssetWriter];
      return v22;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:]();
      }
    }
    return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMovieWriter" code:-3 userInfo:0];
  }
}

- (id)setupAudioAssetWriterWithTransactionID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  long long v6 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_lastVideoPresentationTime.value = *MEMORY[0x1E4F1F9F8];
  int64_t v7 = *(void *)(v5 + 16);
  self->_lastVideoPresentationTime.int64_t epoch = v7;
  *(_OWORD *)&self->_lastLocalAudioPresentationTime.value = v6;
  self->_lastLocalAudioPresentationTime.int64_t epoch = v7;
  *(_OWORD *)&self->_lastRemoteAudioPresentationTime.value = v6;
  self->_lastRemoteAudioPresentationTime.int64_t epoch = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F163B8]);
  self->_assetWriter = (AVAssetWriter *)[v8 initWithURL:self->_outputURL fileType:*MEMORY[0x1E4F15AB0] error:&v16];
  if (v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter setupAudioAssetWriterWithTransactionID:]();
      }
    }
  }
  else if (VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode) {
         && (id v16 = [(VCMovieWriter *)self addAudioTrackForLocalAudio:1]) != 0)
  }
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter setupAudioAssetWriterWithTransactionID:]();
      }
    }
  }
  else if (VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode) {
         && (id v16 = [(VCMovieWriter *)self addAudioTrackForLocalAudio:0]) != 0)
  }
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMovieWriter setupAudioAssetWriterWithTransactionID:]();
      }
    }
  }
  else
  {
    if (self->_movieFragmentInterval.flags)
    {
      long long v14 = *(_OWORD *)&self->_movieFragmentInterval.value;
      int64_t epoch = self->_movieFragmentInterval.epoch;
      [(AVAssetWriter *)self->_assetWriter setMovieFragmentInterval:&v14];
    }
    if (![(AVAssetWriter *)self->_assetWriter startWriting]
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        AVAssetWriterStatus v12 = [(AVAssetWriter *)self->_assetWriter status];
        int64_t v13 = [(AVAssetWriter *)self->_assetWriter error];
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = v9;
        __int16 v19 = 2080;
        long long v20 = "-[VCMovieWriter setupAudioAssetWriterWithTransactionID:]";
        __int16 v21 = 1024;
        int v22 = 522;
        __int16 v23 = 2112;
        id v24 = a3;
        __int16 v25 = 2048;
        AVAssetWriterStatus v26 = v12;
        __int16 v27 = 2112;
        int v28 = v13;
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d assetWriter startWriting failed, transactionID=%@, status=%ld, error=%@", buf, 0x3Au);
      }
    }
    [(VCMovieWriter *)self setupInputs];
  }
  if (!v16) {
    return 0;
  }
  [(VCMovieWriter *)self cleanupAssetWriter];
  return v16;
}

- (void)cleanupAssetWriter
{
  adapter = self->_adapter;
  if (adapter)
  {
    CFRelease(adapter);
    self->_adapter = 0;
  }
  metadataInput = self->_metadataInput;
  if (metadataInput)
  {
    CFRelease(metadataInput);
    self->_metadataInput = 0;
  }
  localAudioInput = self->_localAudioInput;
  if (localAudioInput)
  {
    CFRelease(localAudioInput);
    self->_localAudioInput = 0;
  }
  remoteAudioInput = self->_remoteAudioInput;
  if (remoteAudioInput)
  {
    CFRelease(remoteAudioInput);
    self->_remoteAudioInput = 0;
  }
  videoInput = self->_videoInput;
  if (videoInput)
  {
    CFRelease(videoInput);
    self->_videoInput = 0;
  }
  assetWriter = self->_assetWriter;
  if (assetWriter)
  {
    CFRelease(assetWriter);
    self->_assetWriter = 0;
  }
}

- (void)setupInput:(id)a3 queue:(opaqueCMBufferQueue *)a4 dispatchGroup:(id)a5 lastPresentationTime:(id *)a6
{
  v12[9] = *MEMORY[0x1E4F143B8];
  dispatch_group_enter((dispatch_group_t)a5);
  serializationQueue = self->_serializationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__VCMovieWriter_setupInput_queue_dispatchGroup_lastPresentationTime___block_invoke;
  void v12[3] = &unk_1E6DB7340;
  v12[4] = self;
  v12[5] = a3;
  v12[7] = a4;
  v12[8] = a6;
  v12[6] = a5;
  [a3 requestMediaDataWhenReadyOnQueue:serializationQueue usingBlock:v12];
}

void __69__VCMovieWriter_setupInput_queue_dispatchGroup_lastPresentationTime___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (CMBufferQueueIsAtEndOfData(*(CMBufferQueueRef *)(a1 + 56)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      BOOL v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v2;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCMovieWriter setupInput:queue:dispatchGroup:lastPresentationTime:]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 548;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMovieWriter, finished writing", (uint8_t *)&v8, 0x1Cu);
      }
    }
    [*(id *)(a1 + 40) markAsFinished];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    [v4 processSampleQueue:v6 input:v5 lastPresentationTime:v7];
  }
}

- (void)processSampleQueue:(opaqueCMBufferQueue *)a3 input:(id)a4 lastPresentationTime:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([a4 isReadyForMoreMediaData])
  {
    do
    {
      uint64_t v9 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(a3);
      if (!v9) {
        break;
      }
      __int16 v10 = v9;
      memset(&v24, 170, sizeof(v24));
      CMSampleBufferGetPresentationTimeStamp(&v24, v9);
      char flags = v24.flags;
      if (!self->_writingStarted && (v24.flags & 1) != 0)
      {
        CMTime time1 = v24;
        [(VCMovieWriter *)self startWritingAtTime:&time1];
        *(CMTime *)a5 = v24;
        char flags = v24.flags;
      }
      if ((flags & 1) != 0 && (time1 = (CMTime)*a5, CMTime time2 = v24, CMTimeCompare(&time1, &time2) < 0))
      {
        int v15 = [a4 appendSampleBuffer:v10];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          id v16 = *MEMORY[0x1E4F47A50];
          uint64_t v17 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              long long v20 = [(AVAssetWriter *)self->_assetWriter error];
              CMTime time1 = v24;
              Float64 Seconds = CMTimeGetSeconds(&time1);
              LODWORD(time1.value) = 136316418;
              *(CMTimeValue *)((char *)&time1.value + 4) = v22;
              LOWORD(time1.flags) = 2080;
              *(void *)((char *)&time1.flags + 2) = "-[VCMovieWriter processSampleQueue:input:lastPresentationTime:]";
              HIWORD(time1.epoch) = 1024;
              int v26 = 566;
              __int16 v27 = 1024;
              int v28 = v15;
              __int16 v29 = 2112;
              v30 = v20;
              __int16 v31 = 2048;
              Float64 v32 = Seconds;
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMovieWriter, append success(%d) error(%@) for sampleTime(%f)", (uint8_t *)&time1, 0x36u);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            __int16 v21 = [(AVAssetWriter *)self->_assetWriter error];
            CMTime time1 = v24;
            Float64 v19 = CMTimeGetSeconds(&time1);
            LODWORD(time1.value) = 136316418;
            *(CMTimeValue *)((char *)&time1.value + 4) = v22;
            LOWORD(time1.flags) = 2080;
            *(void *)((char *)&time1.flags + 2) = "-[VCMovieWriter processSampleQueue:input:lastPresentationTime:]";
            HIWORD(time1.epoch) = 1024;
            int v26 = 566;
            __int16 v27 = 1024;
            int v28 = v15;
            __int16 v29 = 2112;
            v30 = v21;
            __int16 v31 = 2048;
            Float64 v32 = v19;
            _os_log_debug_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCMovieWriter, append success(%d) error(%@) for sampleTime(%f)", (uint8_t *)&time1, 0x36u);
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          LODWORD(time1.value) = 136315650;
          *(CMTimeValue *)((char *)&time1.value + 4) = v13;
          LOWORD(time1.flags) = 2080;
          *(void *)((char *)&time1.flags + 2) = "-[VCMovieWriter processSampleQueue:input:lastPresentationTime:]";
          HIWORD(time1.epoch) = 1024;
          int v26 = 568;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d current time older than last frame", (uint8_t *)&time1, 0x1Cu);
        }
      }
      CFRelease(v10);
      *(CMTime *)a5 = v24;
    }
    while (([a4 isReadyForMoreMediaData] & 1) != 0);
  }
}

- (void)appendMetaData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a2 + 296) error]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 296), "error"), "description"), "UTF8String");
  }
  int v8 = 136315906;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  OUTLINED_FUNCTION_8();
  int v11 = 606;
  __int16 v12 = v6;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d appendTimeMetadataGroup failed %s", (uint8_t *)&v8, 0x26u);
}

- (void)startWritingAtTime:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_writingStarted = 1;
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.int64_t epoch = var3;
  assetWriter = self->_assetWriter;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  [(AVAssetWriter *)assetWriter startSessionAtSourceTime:&v10];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v10);
      LODWORD(v10.var0) = 136315906;
      *(int64_t *)((char *)&v10.var0 + 4) = v7;
      LOWORD(v10.var2) = 2080;
      *(void *)((char *)&v10.var2 + 2) = "-[VCMovieWriter startWritingAtTime:]";
      HIWORD(v10.var3) = 1024;
      int v11 = 615;
      __int16 v12 = 2048;
      Float64 v13 = Seconds;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMovieWriter, started writing at %f", (uint8_t *)&v10, 0x26u);
    }
  }
  if (self->_hasStillImageMetadataTrack) {
    [(VCMovieWriter *)self appendMetaData];
  }
}

- (void)completeWriting
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  AVAssetWriterStatus v3 = [(AVAssetWriter *)self->_assetWriter status];
  if (v3 == AVAssetWriterStatusCompleted) {
    int v4 = 7;
  }
  else {
    int v4 = 3;
  }
  if ((VCMovieWriter *)objc_opt_class() == self)
  {
    if (v4 > (int)VRTraceGetErrorLogLevelForModule()) {
      goto LABEL_13;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    int v8 = *MEMORY[0x1E4F47A50];
    if (v3 == AVAssetWriterStatusCompleted)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        assetWriter = self->_assetWriter;
        outputURL = self->_outputURL;
        *(_DWORD *)v30 = 136316418;
        *(void *)&v30[4] = v6;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCMovieWriter completeWriting]";
        __int16 v31 = 1024;
        int v32 = 625;
        __int16 v33 = 2112;
        __int16 v34 = assetWriter;
        __int16 v35 = 2112;
        Float64 v36 = (VCMovieWriter *)outputURL;
        __int16 v37 = 2048;
        uint64_t v38 = 2;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d assetWriter=%@ completed url=%@ with status=%ld", v30, 0x3Au);
      }
      goto LABEL_18;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    int v28 = self->_assetWriter;
    __int16 v29 = self->_outputURL;
    *(_DWORD *)v30 = 136316418;
    *(void *)&v30[4] = v6;
    *(_WORD *)&v30[12] = 2080;
    *(void *)&v30[14] = "-[VCMovieWriter completeWriting]";
    __int16 v31 = 1024;
    int v32 = 625;
    __int16 v33 = 2112;
    __int16 v34 = v28;
    __int16 v35 = 2112;
    Float64 v36 = (VCMovieWriter *)v29;
    __int16 v37 = 2048;
    uint64_t v38 = v3;
    Float64 v19 = " [%s] %s:%d assetWriter=%@ completed url=%@ with status=%ld";
    long long v20 = v7;
    uint32_t v21 = 58;
LABEL_30:
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v19, v30, v21);
    goto LABEL_24;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = (__CFString *)[(VCMovieWriter *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v5 = &stru_1F3D3E450;
  }
  if (v4 > (int)VRTraceGetErrorLogLevelForModule())
  {
LABEL_13:
    if (v3 == AVAssetWriterStatusCompleted)
    {
LABEL_18:
      id completionHandler = (void (**)(id, NSURL *, void))self->_completionHandler;
      if (completionHandler) {
        completionHandler[2](completionHandler, self->_outputURL, 0);
      }
      VCMediaRecorderUtil_PrintMediaURL((uint64_t)self->_outputURL, 7);
      return;
    }
    goto LABEL_24;
  }
  uint64_t v11 = VRTraceErrorLogLevelToCSTR();
  __int16 v12 = *MEMORY[0x1E4F47A50];
  Float64 v13 = *MEMORY[0x1E4F47A50];
  if (v3 == AVAssetWriterStatusCompleted)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = self->_assetWriter;
      int v15 = self->_outputURL;
      *(_DWORD *)v30 = 136316930;
      *(void *)&v30[4] = v11;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCMovieWriter completeWriting]";
      __int16 v31 = 1024;
      int v32 = 625;
      __int16 v33 = 2112;
      __int16 v34 = v5;
      __int16 v35 = 2048;
      Float64 v36 = self;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v14;
      __int16 v39 = 2112;
      int v40 = v15;
      __int16 v41 = 2048;
      uint64_t v42 = 2;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@(%p) assetWriter=%@ completed url=%@ with status=%ld", v30, 0x4Eu);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = self->_assetWriter;
    uint64_t v18 = self->_outputURL;
    *(_DWORD *)v30 = 136316930;
    *(void *)&v30[4] = v11;
    *(_WORD *)&v30[12] = 2080;
    *(void *)&v30[14] = "-[VCMovieWriter completeWriting]";
    __int16 v31 = 1024;
    int v32 = 625;
    __int16 v33 = 2112;
    __int16 v34 = v5;
    __int16 v35 = 2048;
    Float64 v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v17;
    __int16 v39 = 2112;
    int v40 = v18;
    __int16 v41 = 2048;
    uint64_t v42 = v3;
    Float64 v19 = " [%s] %s:%d %@(%p) assetWriter=%@ completed url=%@ with status=%ld";
    long long v20 = v12;
    uint32_t v21 = 78;
    goto LABEL_30;
  }
LABEL_24:
  if (self->_completionHandler)
  {
    uint64_t v22 = [(AVAssetWriter *)self->_assetWriter error];
    if (!v22) {
      uint64_t v22 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMovieWriter" code:-1 userInfo:0];
    }
    (*((void (**)(id, void, NSError *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))self->_completionHandler
     + 2))(self->_completionHandler, 0, v22, v23, v24, v25, v26, v27, *(void *)v30, *(void *)&v30[8]);
  }
}

- (void)setupInputs
{
  v5[5] = *MEMORY[0x1E4F143B8];
  AVAssetWriterStatus v3 = dispatch_group_create();
  if (!VCMediaWriterUtil_IsAudioOnly(self->_writerMode)) {
    [(VCMovieWriter *)self setupInput:self->_videoInput queue:self->_videoQueue dispatchGroup:v3 lastPresentationTime:&self->_lastVideoPresentationTime];
  }
  if (VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode)) {
    [(VCMovieWriter *)self setupInput:self->_localAudioInput queue:self->_localAudioQueue dispatchGroup:v3 lastPresentationTime:&self->_lastLocalAudioPresentationTime];
  }
  if (VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode)) {
    [(VCMovieWriter *)self setupInput:self->_remoteAudioInput queue:self->_remoteAudioQueue dispatchGroup:v3 lastPresentationTime:&self->_lastRemoteAudioPresentationTime];
  }
  serializationQueue = self->_serializationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__VCMovieWriter_setupInputs__block_invoke;
  v5[3] = &unk_1E6DB3DC8;
  v5[4] = self;
  dispatch_group_notify(v3, serializationQueue, v5);
  dispatch_release(v3);
}

uint64_t __28__VCMovieWriter_setupInputs__block_invoke(uint64_t a1)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 296);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__VCMovieWriter_setupInputs__block_invoke_2;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = v1;
  return [v2 finishWritingWithCompletionHandler:v4];
}

uint64_t __28__VCMovieWriter_setupInputs__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeWriting];
}

- (unsigned)startRTPTimeStamp
{
  return self->_startRTPTimeStamp;
}

- (void)setStartRTPTimeStamp:(unsigned int)a3
{
  self->_unsigned int startRTPTimeStamp = a3;
}

- (unsigned)endRTPTimeStamp
{
  return self->_endRTPTimeStamp;
}

- (void)setEndRTPTimeStamp:(unsigned int)a3
{
  self->_unsigned int endRTPTimeStamp = a3;
}

- (unsigned)writerMode
{
  return self->_writerMode;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (BOOL)finishWritingInvoked
{
  return self->_finishWritingInvoked;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 472);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_movieFragmentInterval.value = *(_OWORD *)&a3->var0;
  self->_movieFragmentInterval.int64_t epoch = var3;
}

- (VCSandboxedURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (void)setupVisibleRect:withCaptureHeight:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d transferSession or Bufferpool is not NULL", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d pixelBuf is NULL after resizing", v2, v3, v4, v5, v6);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d appending video error is %d", v2, *(const char **)v3, (unint64_t)"-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]" >> 16, 180);
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupAssetWriterWithWidth:height:transactionID: returned error=%@");
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBufferQueueContainsEndOfData(_videoQueue) returned true", v2, v3, v4, v5, v6);
}

- (void)appendAudioSampleBuffer:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audioQueue is NULL", v2, v3, v4, v5, v6);
}

- (void)appendAudioSampleBuffer:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMovieWriter appendAudioSampleBuffer:mediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d appending audio error is %d", v2, *(const char **)v3, (unint64_t)"-[VCMovieWriter appendAudioSampleBuffer:mediaType:]" >> 16, 211);
}

- (void)appendAudioSampleBuffer:mediaType:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBufferQueueContainsEndOfData(audioQueue) returned true", v2, v3, v4, v5, v6);
}

- (void)setupLivePhotoAssetWithTransactionID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate live photo metadata", v2, v3, v4, v5, v6);
}

- (void)setupLivePhotoAssetWithTransactionID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate live photo metadata keyword", v2, v3, v4, v5, v6);
}

- (void)addAudioTrackForLocalAudio:.cold.1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio track. isLocalAudio=%d", v2, v3, v4, 350);
}

- (void)addVideoTrackWithWidth:height:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video writer input", v2, v3, v4, v5, v6);
}

- (void)addStillImageMetadataTrackWithTransactionID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the metadata description, transactionID=%@");
}

- (void)addStillImageMetadataTrackWithTransactionID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the metadata input, transactionID=%@");
}

- (void)addStillImageMetadataTrackWithTransactionID:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the adapter, transactionID=%@");
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot set up asset writer with zero dimensions", v2, v3, v4, v5, v6);
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the still image metadata track", v2, v3, v4, v5, v6);
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the remote audio track", v2, v3, v4, v5, v6);
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the local audio track", v2, v3, v4, v5, v6);
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the local video track", v2, v3, v4, v5, v6);
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add live photo asset", v2, v3, v4, v5, v6);
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.7()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _assetWriter init failed. error=%@", v2);
}

- (void)setupAudioAssetWriterWithTransactionID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the remote audio track", v2, v3, v4, v5, v6);
}

- (void)setupAudioAssetWriterWithTransactionID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the local audio track", v2, v3, v4, v5, v6);
}

- (void)setupAudioAssetWriterWithTransactionID:.cold.3()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _assetWriter init failed. error=%@", v2);
}

@end