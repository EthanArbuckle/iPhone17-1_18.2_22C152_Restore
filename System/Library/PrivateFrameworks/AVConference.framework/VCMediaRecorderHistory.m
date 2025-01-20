@interface VCMediaRecorderHistory
+ (BOOL)isRecordingOnlyMediaType:(unsigned __int8)a3;
+ (id)fileNameForMediaType:(unsigned __int8)a3 dateString:(id)a4;
+ (int)rewriteMovieMetadataWithURL:(id)a3 transactionID:(id)a4;
+ (unsigned)mediaTypeFromWriterMode:(unsigned __int8)a3;
+ (unsigned)writerModeFromMediaType:(unsigned __int8)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)setUpStillImageWithContext:(SEL)a3 visibleRect:(id)a4 cameraStatusBit:(CGRect *)a5 imageType:(char *)a6;
- (BOOL)setUpAudioBuffers;
- (BOOL)setUpDelegateQueue:(id)a3;
- (BOOL)setUpVideoBuffers;
- (VCMediaRecorderHistory)initWithDelegateQueue:(id)a3;
- (id)_getActiveWriters;
- (id)fileExtensionForMediaType:(unsigned __int8)a3;
- (id)fileURLWithDirectoryURL:(id)a3 transactionID:(id)a4 type:(unsigned __int8)a5;
- (id)handleCopyRequestWithTransactionID:(id)a3 sourceURL:(id)a4 errorCode:(int *)a5;
- (id)writeToFileWithTimestamp:(unsigned int)a3 transactionID:(id)a4 directoryURL:(id)a5 imageType:(int)a6;
- (id)writeToLivePhotoToFileWithFrame:(__CVBuffer *)a3 transactionID:(id)a4 directoryURL:(id)a5 imageType:(int)a6 cameraStatusBits:(unsigned __int8)a7;
- (int)imageType;
- (int)videoCodec;
- (unsigned)_mediaTypeForBuffer:(id)a3;
- (void)appendSampleWithWriter:(id)a3 buffer:(id)a4 sample:(opaqueCMSampleBuffer *)a5 mediaType:(unsigned __int8)a6;
- (void)cancelRequestWithTransactionID:(id)a3;
- (void)cleanupTransferSession;
- (void)dealloc;
- (void)dispatchedFinishWritingAllRequests;
- (void)dispatchedStartRecordingWithContext:(id)a3 fileURL:(id)a4 completionHandler:(id)a5;
- (void)endRecording:(id)a3 timestamp:(unsigned int)a4 completionHandler:(id)a5;
- (void)flushHistoryBuffers;
- (void)handlePendingRequestSuccessWithSourceURL:(id)a3;
- (void)handlePendingRequestWithError:(id)a3;
- (void)handlePendingRequestsWithSourceURL:(id)a3 error:(id)a4;
- (void)handleSinglePendingRequestWithTransactionID:(id)a3 sourceURL:(id)a4;
- (void)historyBuffer:(id)a3 didDequeueSample:(opaqueCMSampleBuffer *)a4 timestamp:(unsigned int)a5;
- (void)invokeStartCompletionHandler:(id)a3 withErrorCode:(int)a4 ontoRecordingQueue:(BOOL)a5;
- (void)registerDirectoryWithURL:(id)a3;
- (void)setCompletionHandler:(id)a3 forTransactionID:(id)a4;
- (void)setFrameRate:(float)a3;
- (void)setImageType:(int)a3;
- (void)setUpAudioBuffers;
- (void)setUpCaptureFormatForWriter:(id)a3 atTimestamp:(unsigned int)a4;
- (void)setUpVideoBuffers;
- (void)setUpWriterWithContext:(id)a3 fileURL:(id)a4 stillImageTime:(id *)a5 visibleRect:(CGRect)a6 cameraStatusBit:(unsigned __int8)a7;
- (void)setVideoCodec:(int)a3;
- (void)setupResizingSessionsWithVisibleRect:(CGRect)a3 cameraStatusBit:(unsigned __int8)a4;
- (void)startRecordingWithContext:(id)a3 completionHandler:(id)a4;
- (void)stopProcessingTransactionID:(id)a3;
- (void)takeLivePhotoWithContext:(id)a3 completionHandler:(id)a4;
- (void)takePhotoWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation VCMediaRecorderHistory

- (BOOL)setUpDelegateQueue:(id)a3
{
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
    self->_delegateQueue = (OS_dispatch_queue *)a3;
LABEL_4:
    LOBYTE(v7) = 1;
    return v7;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v6 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorderHistory.delegateQueue", 0, CustomRootQueue);
  self->_delegateQueue = v6;
  if (v6) {
    goto LABEL_4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    -[VCMediaRecorderHistory setUpDelegateQueue:]();
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpAudioBuffers
{
  if (VCDefaults_GetManagedBoolValueForKey(@"enableLocalVideoRecording", 0)) {
    uint64_t v3 = 45;
  }
  else {
    uint64_t v3 = 75;
  }
  v4 = [[VCMediaRecorderHistoryBuffer alloc] initWithDelegate:self bufferLength:v3];
  self->_localAudioBuffer = v4;
  if (v4)
  {
    v5 = [[VCMediaRecorderHistoryBuffer alloc] initWithDelegate:self bufferLength:v3];
    self->_remoteAudioBuffer = v5;
    if (v5)
    {
      SampleBufferAllocator = VCAudioBufferList_CreateSampleBufferAllocator();
      self->_audioSampleBufferAllocator = SampleBufferAllocator;
      if (SampleBufferAllocator)
      {
        LOBYTE(v7) = 1;
        return v7;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v7) {
          return v7;
        }
        -[VCMediaRecorderHistory setUpAudioBuffers]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      -[VCMediaRecorderHistory setUpAudioBuffers]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    -[VCMediaRecorderHistory setUpAudioBuffers]();
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpVideoBuffers
{
  self->_frameBuffer = 0;
  uint64_t v3 = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
  self->_transferSession = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      -[VCMediaRecorderHistory setUpVideoBuffers]();
    }
    goto LABEL_16;
  }
  BOOL v4 = +[VCHardwareSettings retainPixelBufferForMediaRecordingEnabled];
  self->_retainPixelBufferEnabled = v4;
  if (!v4)
  {
    v6 = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
    self->_copyTransferSession = v6;
    if (!v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCMediaRecorderHistory setUpVideoBuffers]();
      }
      goto LABEL_16;
    }
LABEL_8:
    LOBYTE(v5) = 1;
    return v5;
  }
  VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)"com.apple.AVConference.VCMediaRecorderHistory.frameAllocator", &self->_frameAllocator);
  if (self->_frameAllocator) {
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    -[VCMediaRecorderHistory setUpVideoBuffers]();
  }
LABEL_16:
  LOBYTE(v5) = 0;
  return v5;
}

- (VCMediaRecorderHistory)initWithDelegateQueue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaRecorderHistory;
  BOOL v4 = [(VCMediaRecorderHistory *)&v7 init];
  if (!v4) {
    goto LABEL_10;
  }
  if (!+[VCHardwareSettings isMediaRecordingSupported])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistory initWithDelegateQueue:]();
      }
    }
    goto LABEL_10;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  *((void *)v4 + 1) = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorderHistory.recordingQueue", 0, CustomRootQueue);
  if (![v4 setUpDelegateQueue:a3]
    || (*((void *)v4 + 4) = objc_alloc_init(MEMORY[0x1E4F1CA60]),
        *((void *)v4 + 10) = objc_alloc_init(MEMORY[0x1E4F1CA60]),
        *((void *)v4 + 11) = objc_alloc_init(MEMORY[0x1E4F1CA60]),
        ![v4 setUpAudioBuffers])
    || ![v4 setUpVideoBuffers])
  {
LABEL_10:

    return 0;
  }
  *((void *)v4 + 7) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *((_WORD *)v4 + 80) = 257;
  *(void *)(v4 + 284) = 0x8000000000;
  return (VCMediaRecorderHistory *)v4;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  if (recordingQueue) {
    dispatch_release(recordingQueue);
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }

  self->_pendingRequests = 0;
  self->_masterTransactionID = 0;
  [(VCMediaRecorderHistory *)self cleanupTransferSession];
  targetScreenAttributes = self->_targetScreenAttributes;
  if (targetScreenAttributes) {
    CFRelease(targetScreenAttributes);
  }
  audioSampleBufferAllocator = self->_audioSampleBufferAllocator;
  if (audioSampleBufferAllocator) {
    CFRelease(audioSampleBufferAllocator);
  }
  figFormat = self->_localFormat.figFormat;
  if (figFormat) {
    CFRelease(figFormat);
  }
  uint64_t v8 = self->_remoteFormat.figFormat;
  if (v8) {
    CFRelease(v8);
  }
  frameAllocator = self->_frameAllocator;
  if (frameAllocator)
  {
    CFRelease(frameAllocator);
    self->_frameAllocator = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)VCMediaRecorderHistory;
  [(VCMediaRecorderHistory *)&v10 dealloc];
}

uint64_t __VCMediaRecorderHistory_AddAudioSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v1 = 16;
  if (!*(unsigned char *)(a1 + 52)) {
    uint64_t v1 = 72;
  }
  VCMediaRecorderHistoryBuffer_UpdateBufferWithSample(*(void *)(*(void *)(a1 + 32) + v1), *(const void **)(a1 + 40), *(_DWORD *)(a1 + 48));

  return FigSampleBufferRelease();
}

uint64_t __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(__CVBuffer **)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 84);
  int v5 = *(_DWORD *)(a1 + 80);
  long long v24 = *(_OWORD *)(a1 + 56);
  uint64_t v25 = *(void *)(a1 + 72);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    objc_super v7 = *MEMORY[0x1E4F47A50];
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "_VCMediaRecorderHistory_UpdateVideoBuffer";
        *(_WORD *)&buf[22] = 1024;
        int v30 = 1173;
        __int16 v31 = 1024;
        LODWORD(v32) = v5;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating video buffer for timestamp %d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_3();
    }
  }
  if (*(unsigned char *)(v2 + 280))
  {
    SampleBufferWithPixelBuffer = (void *)FigSampleBufferRetain();
LABEL_10:
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (FigCFDictionarySetInt32())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_2();
        }
      }
    }
    else
    {
      CMSetAttachments(SampleBufferWithPixelBuffer, Mutable, 0);
      VCMediaRecorderHistoryBuffer_UpdateBufferWithSample(*(void *)(v2 + 64), SampleBufferWithPixelBuffer, v5);
      if (*(unsigned char *)(v2 + 161))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
        if (*(unsigned char *)(v2 + 160))
        {
          long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
          long long v27 = *MEMORY[0x1E4F1DB28];
          long long v28 = v11;
          ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)SampleBufferWithPixelBuffer);
          VideoUtil_GetVisibleRect(ImageBuffer, (double *)&v27);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v35[0] = 0;
            v13 = [(id)v2 _getActiveWriters]
                ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v2, "_getActiveWriters"), "description"), "UTF8String"): "<nil>";
            asprintf(v35, "%s", v13);
            if (v35[0])
            {
              __lasts = 0;
              v14 = strtok_r(v35[0], "\n", &__lasts);
              do
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v15 = VRTraceErrorLogLevelToCSTR();
                  v16 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316162;
                    *(void *)&buf[4] = v15;
                    *(_WORD *)&buf[12] = 2080;
                    *(void *)&buf[14] = "_VCMediaRecorderHistory_SetUpWritersWithFirstFrame";
                    *(_WORD *)&buf[22] = 1024;
                    int v30 = 1280;
                    __int16 v31 = 2080;
                    v32 = "_getActiveWriters";
                    __int16 v33 = 2080;
                    v34 = v14;
                    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                  }
                }
                v14 = strtok_r(0, "\n", &__lasts);
              }
              while (v14);
              free(v35[0]);
            }
          }
          long long v37 = 0u;
          long long v38 = 0u;
          *(_OWORD *)v35 = 0u;
          long long v36 = 0u;
          v17 = (void *)[(id)v2 _getActiveWriters];
          uint64_t v18 = [v17 countByEnumeratingWithState:v35 objects:buf count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v36 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = *(void **)&v35[1][8 * i];
                if (v22 != *(void **)(v2 + 40)) {
                  VCMediaWriterUtil_SetUpWriterWithCaptureFormat(v22, v4, *(_DWORD *)(v2 + 156), *(_DWORD *)(v2 + 152), *(unsigned __int8 *)(v2 + 160), *(double *)&v27, *((double *)&v27 + 1), *(double *)&v28, *((double *)&v28 + 1));
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:v35 objects:buf count:16];
            }
            while (v19);
          }
        }
        *(unsigned char *)(v2 + 161) = 0;
      }
    }
    FigSampleBufferRelease();
    if (Mutable) {
      CFRelease(Mutable);
    }
    goto LABEL_36;
  }
  _VCMediaRecorderHistory_SetVisibleRect(v2, v3);
  *(_OWORD *)buf = v24;
  *(void *)&buf[16] = v25;
  SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(v3, (long long *)buf);
  if (SampleBufferWithPixelBuffer) {
    goto LABEL_10;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_1();
    }
  }
  FigSampleBufferRelease();
LABEL_36:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  return FigSampleBufferRelease();
}

- (void)setFrameRate:(float)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCMediaRecorderHistory_setFrameRate___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  float v5 = a3;
  dispatch_async(recordingQueue, block);
}

VCMediaRecorderHistoryBuffer *__39__VCMediaRecorderHistory_setFrameRate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];

  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double v4 = *(float *)(a1 + 40);
      int v6 = 136315906;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      v9 = "-[VCMediaRecorderHistory setFrameRate:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 356;
      __int16 v12 = 2048;
      double v13 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frameRate=%f", (uint8_t *)&v6, 0x26u);
    }
  }
  result = [[VCMediaRecorderHistoryBuffer alloc] initWithDelegate:*(void *)(a1 + 32) bufferLength:(int)(float)((float)(*(float *)(a1 + 40) * 3.0) * 0.5)];
  *(void *)(*(void *)(a1 + 32) + 64) = result;
  return result;
}

- (void)takePhotoWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]");
  if (a3)
  {
    recordingQueue = self->_recordingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke;
    block[3] = &unk_1E6DB4F88;
    block[4] = a3;
    void block[5] = self;
    block[6] = a4;
    __int16 v8 = block;
LABEL_3:
    dispatch_async(recordingQueue, v8);
    return;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v9 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]";
        __int16 v19 = 1024;
        int v20 = 368;
        __int16 v21 = 2112;
        v22 = v9;
        __int16 v23 = 2048;
        long long v24 = self;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid request context passed", buf, 0x30u);
        if (!a4) {
          return;
        }
        goto LABEL_16;
      }
    }
LABEL_15:
    if (a4) {
      goto LABEL_16;
    }
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_15;
  }
  VRTraceErrorLogLevelToCSTR();
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  -[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]();
  if (a4)
  {
LABEL_16:
    recordingQueue = self->_recordingQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6DB4FD8;
    v12[4] = self;
    v12[5] = a4;
    int v13 = -7;
    __int16 v8 = v12;
    goto LABEL_3;
  }
}

void __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "writeToFileWithTimestamp:transactionID:directoryURL:imageType:", objc_msgSend(*(id *)(a1 + 32), "timestamp"), objc_msgSend(*(id *)(a1 + 32), "transactionID"), objc_msgSend(*(id *)(a1 + 32), "deserializeDirectoryURL"), *(unsigned int *)(*(void *)(a1 + 40) + 164));
  if (v2) {
    int v3 = 6;
  }
  else {
    int v3 = 3;
  }
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if (v3 > (int)VRTraceGetErrorLogLevelForModule()) {
      goto LABEL_13;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!v2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_cold_1();
      }
      goto LABEL_24;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v5;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 377;
      __int16 v26 = 1024;
      LODWORD(v27) = 1;
      __int16 v8 = " [%s] %s:%d photo writing to file success=%{BOOL}d";
      v9 = v6;
      uint32_t v10 = 34;
LABEL_18:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
LABEL_19:
    uint64_t v15 = 0;
    goto LABEL_25;
  }
  if (objc_opt_respondsToSelector()) {
    double v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
  }
  else {
    double v4 = &stru_1F3D3E450;
  }
  if (v3 <= (int)VRTraceGetErrorLogLevelForModule())
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    int v13 = *MEMORY[0x1E4F47A50];
    if (!v2)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 377;
        __int16 v26 = 2112;
        long long v27 = v4;
        __int16 v28 = 2048;
        uint64_t v29 = v16;
        __int16 v30 = 1024;
        int v31 = 0;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) photo writing to file success=%{BOOL}d", buf, 0x36u);
      }
      goto LABEL_24;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 377;
      __int16 v26 = 2112;
      long long v27 = v4;
      __int16 v28 = 2048;
      uint64_t v29 = v14;
      __int16 v30 = 1024;
      int v31 = 1;
      __int16 v8 = " [%s] %s:%d %@(%p) photo writing to file success=%{BOOL}d";
      v9 = v12;
      uint32_t v10 = 54;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
LABEL_13:
  if (v2) {
    goto LABEL_19;
  }
LABEL_24:
  uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:-1 userInfo:0];
LABEL_25:
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17)
  {
    uint64_t v18 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_20;
    block[3] = &unk_1E6DB4F60;
    void block[5] = v15;
    block[6] = v17;
    block[4] = v2;
    dispatch_async(v18, block);
  }
}

uint64_t __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_20(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_3;
  block[3] = &unk_1E6DB4FB0;
  block[4] = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 48);
  dispatch_async(v1, block);
}

uint64_t __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:*(int *)(a1 + 40) userInfo:0];
  int v3 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v1 + 16);

  return v3(v1, 0, 0, v2);
}

- (void)takeLivePhotoWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]");
  if (a3)
  {
    recordingQueue = self->_recordingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke;
    block[3] = &unk_1E6DB4F88;
    block[4] = a3;
    void block[5] = self;
    block[6] = a4;
    __int16 v8 = block;
LABEL_3:
    dispatch_async(recordingQueue, v8);
    return;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v9 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]";
        __int16 v19 = 1024;
        int v20 = 404;
        __int16 v21 = 2112;
        __int16 v22 = v9;
        __int16 v23 = 2048;
        __int16 v24 = self;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid request context passed", buf, 0x30u);
        if (!a4) {
          return;
        }
        goto LABEL_16;
      }
    }
LABEL_15:
    if (a4) {
      goto LABEL_16;
    }
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_15;
  }
  VRTraceErrorLogLevelToCSTR();
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  -[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]();
  if (a4)
  {
LABEL_16:
    recordingQueue = self->_recordingQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6DB4FD8;
    v12[4] = self;
    v12[5] = a4;
    int v13 = -7;
    __int16 v8 = v12;
    goto LABEL_3;
  }
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) transactionID];
  uint64_t v3 = [*(id *)(a1 + 32) deserializeDirectoryURL];
  uint64_t v4 = [*(id *)(a1 + 40) fileURLWithDirectoryURL:v3 transactionID:v2 type:3];
  if (!v3) {
    [*(id *)(a1 + 40) registerDirectoryWithURL:v4];
  }
  [*(id *)(a1 + 40) setCompletionHandler:*(void *)(a1 + 48) forTransactionID:v2];
  long long v28 = 0u;
  long long v29 = 0u;
  unsigned __int8 v27 = 0;
  memset(v26, 170, sizeof(v26));
  uint64_t v5 = *(unsigned int **)(a1 + 40);
  if (v5)
  {
    [v5 setUpStillImageWithContext:*(void *)(a1 + 32) visibleRect:&v28 cameraStatusBit:&v27 imageType:v5[41]];
    if (v26[12])
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(v6 + 48);
      if (*(void *)(v6 + 40))
      {
        if (!v7)
        {
          if (objc_opt_class() == *(void *)(a1 + 40))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_3();
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              __int16 v8 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
            }
            else {
              __int16 v8 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              __int16 v17 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                uint64_t v23 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 136316418;
                *(void *)&uint8_t buf[4] = v16;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]_block_invoke";
                *(_WORD *)&buf[22] = 1024;
                int v31 = 423;
                __int16 v32 = 2112;
                __int16 v33 = v8;
                __int16 v34 = 2048;
                uint64_t v35 = v23;
                __int16 v36 = 2112;
                long long v37 = v2;
                _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) masterTransactionID is nil while writer is not nil, this shouldn't be happening, but setting %@ to be masterTransactionID", buf, 0x3Au);
              }
            }
          }
          *(void *)(*(void *)(a1 + 40) + 48) = [v2 copy];
          uint64_t v6 = *(void *)(a1 + 40);
        }
        [*(id *)(v6 + 56) addObject:v2];
        [*(id *)(*(void *)(a1 + 40) + 40) setDirectoryURL:v3];
      }
      else
      {
        if (v7)
        {
          if (objc_opt_class() == *(void *)(a1 + 40))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_2();
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v15 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
            }
            else {
              uint64_t v15 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v18 = VRTraceErrorLogLevelToCSTR();
              __int16 v19 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 136316162;
                *(void *)&uint8_t buf[4] = v18;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]_block_invoke";
                *(_WORD *)&buf[22] = 1024;
                int v31 = 431;
                __int16 v32 = 2112;
                __int16 v33 = v15;
                __int16 v34 = 2048;
                uint64_t v35 = v24;
                _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) masterTransactionID is not nil, this shouldn't be happening", buf, 0x30u);
              }
            }
          }
        }
        *(void *)(*(void *)(a1 + 40) + 48) = [v2 copy];
        uint64_t v21 = *(void *)(a1 + 32);
        int v20 = *(void **)(a1 + 40);
        *(_OWORD *)buf = *(_OWORD *)v26;
        *(void *)&buf[16] = *(void *)&v26[16];
        objc_msgSend(v20, "setUpWriterWithContext:fileURL:stillImageTime:visibleRect:cameraStatusBit:", v21, v4, buf, v27, v28, v29);
      }
      return;
    }
  }
  else
  {
    memset(v26, 0, sizeof(v26));
  }
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v9 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        int v31 = 442;
        __int16 v32 = 2112;
        __int16 v33 = v9;
        __int16 v34 = 2048;
        uint64_t v35 = v22;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) still image time is not valid", buf, 0x30u);
      }
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:-2 userInfo:0];
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    uint64_t v14 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_21;
    v25[3] = &unk_1E6DB5000;
    v25[4] = v12;
    v25[5] = v13;
    dispatch_async(v14, v25);
  }
}

uint64_t __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_3;
  block[3] = &unk_1E6DB4FB0;
  block[4] = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 48);
  dispatch_async(v1, block);
}

uint64_t __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:*(int *)(a1 + 40) userInfo:0];
  int v3 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v1 + 16);

  return v3(v1, 0, 0, v2);
}

+ (unsigned)mediaTypeFromWriterMode:(unsigned __int8)a3
{
  unsigned int v3 = (a3 - 1);
  if (v3 >= 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaRecorderHistory mediaTypeFromWriterMode:]();
      }
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    return 0x5040203u >> (8 * v3);
  }
  return v4;
}

+ (unsigned)writerModeFromMediaType:(unsigned __int8)a3
{
  unsigned int v3 = (a3 - 2);
  if (v3 >= 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaRecorderHistory writerModeFromMediaType:](v6, a3);
      }
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    return 0x4030102u >> (8 * v3);
  }
  return v4;
}

+ (BOOL)isRecordingOnlyMediaType:(unsigned __int8)a3
{
  return (a3 < 6u) & (0x34u >> a3);
}

- (void)setUpCaptureFormatForWriter:(id)a3 atTimestamp:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  uint64_t v7 = [(VCMediaRecorderHistoryBuffer *)self->_frameBuffer getClosestSampleForTimestamp:v4];
  if (v7)
  {
    __int16 v8 = v7;
    unsigned __int8 valuePtr = 0;
    CFNumberRef v9 = (const __CFNumber *)CMGetAttachment(v7, @"bCameraStatusBits", 0);
    CFNumberGetValue(v9, kCFNumberSInt8Type, &valuePtr);
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v12 = *MEMORY[0x1E4F1DB28];
    long long v13 = v10;
    ImageBuffer = CMSampleBufferGetImageBuffer(v8);
    VideoUtil_GetVisibleRect(ImageBuffer, (double *)&v12);
    VCMediaWriterUtil_SetUpWriterWithCaptureFormat(a3, valuePtr, self->_captureWidth, self->_captureHeight, self->_resize, *(double *)&v12, *((double *)&v12 + 1), *(double *)&v13, *((double *)&v13 + 1));
  }
}

- (void)invokeStartCompletionHandler:(id)a3 withErrorCode:(int)a4 ontoRecordingQueue:(BOOL)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    __int16 v8 = __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke;
    CFNumberRef v9 = &unk_1E6DB4FD8;
    int v12 = a4;
    long long v10 = self;
    id v11 = a3;
    recordingQueue = self->_recordingQueue;
    if (a5)
    {
      dispatch_assert_queue_not_V2(recordingQueue);
      dispatch_async((dispatch_queue_t)self->_recordingQueue, v7);
    }
    else
    {
      dispatch_assert_queue_V2(recordingQueue);
      v8((uint64_t)v7);
    }
  }
}

void __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke(uint64_t a1)
{
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(int *)(a1 + 48);
  if (v2) {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:v2 userInfo:0];
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke_2;
  block[3] = &unk_1E6DB5000;
  uint64_t v5 = *(void *)(a1 + 40);
  block[4] = v3;
  void block[5] = v5;
  dispatch_async(v4, block);
}

uint64_t __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dispatchedStartRecordingWithContext:(id)a3 fileURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  uint64_t v9 = [a3 timestamp];
  uint64_t v10 = [a3 transactionID];
  uint64_t v11 = +[VCMediaRecorderHistory writerModeFromMediaType:](VCMediaRecorderHistory, "writerModeFromMediaType:", [a3 mediaType]);
  if ([(NSMutableDictionary *)self->_writers objectForKeyedSubscript:v10])
  {
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaRecorderHistory dispatchedStartRecordingWithContext:fileURL:completionHandler:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        __int16 v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v16;
          __int16 v24 = 2080;
          uint64_t v25 = "-[VCMediaRecorderHistory dispatchedStartRecordingWithContext:fileURL:completionHandler:]";
          __int16 v26 = 1024;
          int v27 = 559;
          __int16 v28 = 2112;
          long long v29 = v15;
          __int16 v30 = 2048;
          int v31 = self;
          __int16 v32 = 2112;
          uint64_t v33 = v10;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) writer for transactionID=%@ exists", buf, 0x3Au);
        }
      }
    }
    uint64_t v14 = 4294967292;
  }
  else
  {
    int v12 = (void *)VCMediaWriterUtil_NewWriter((uint64_t)a4, v10, +[VideoUtil videoCodecForPayload:self->_videoCodec], 1.0);
    if (v12)
    {
      uint64_t v13 = v12;
      objc_msgSend(v12, "setDirectoryURL:", objc_msgSend(a3, "deserializeDirectoryURL"));
      if (a3)
      {
        [a3 movieFragmentInterval];
      }
      else
      {
        long long v20 = 0uLL;
        uint64_t v21 = 0;
      }
      long long v18 = v20;
      uint64_t v19 = v21;
      [v13 setMovieFragmentInterval:&v18];
      [v13 setupWriterWithMode:v11];
      [v13 setStartRTPTimeStamp:v9];
      [(VCMediaRecorderHistory *)self setUpCaptureFormatForWriter:v13 atTimestamp:v9];
      [(NSMutableDictionary *)self->_writers setObject:v13 forKeyedSubscript:v10];

      [(NSMutableArray *)self->_pendingRequests addObject:v10];
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = 4294967293;
    }
  }
  [(VCMediaRecorderHistory *)self invokeStartCompletionHandler:a5 withErrorCode:v14 ontoRecordingQueue:0];
}

- (void)startRecordingWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaRecorderHistory startRecordingWithContext:completionHandler:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        __int16 v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          uint64_t v23 = "-[VCMediaRecorderHistory startRecordingWithContext:completionHandler:]";
          __int16 v24 = 1024;
          int v25 = 584;
          __int16 v26 = 2112;
          *(void *)int v27 = v13;
          *(_WORD *)&v27[8] = 2048;
          *(void *)&v27[10] = self;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid request context passed", buf, 0x30u);
        }
      }
    }
    uint64_t v15 = 4294967289;
    goto LABEL_22;
  }
  uint64_t v7 = [a3 mediaType];
  if (!+[VCMediaRecorderHistory isRecordingOnlyMediaType:v7])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistory startRecordingWithContext:completionHandler:](v14, v7);
      }
    }
    uint64_t v15 = 4294967290;
LABEL_22:
    [(VCMediaRecorderHistory *)self invokeStartCompletionHandler:a4 withErrorCode:v15 ontoRecordingQueue:1];
    return;
  }
  int v8 = [a3 timestamp];
  uint64_t v9 = [a3 transactionID];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v10;
      __int16 v22 = 2080;
      uint64_t v23 = "-[VCMediaRecorderHistory startRecordingWithContext:completionHandler:]";
      __int16 v24 = 1024;
      int v25 = 590;
      __int16 v26 = 1024;
      *(_DWORD *)int v27 = v8;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = VCMediaRecorderUtil_DescriptionForMediaType(v7);
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timestamp=%d, mediaType=%@", buf, 0x2Cu);
    }
  }
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VCMediaRecorderHistory_startRecordingWithContext_completionHandler___block_invoke;
  block[3] = &unk_1E6DB5028;
  block[4] = a3;
  void block[5] = self;
  char v19 = v7;
  block[6] = v9;
  void block[7] = a4;
  dispatch_async(recordingQueue, block);
}

uint64_t __70__VCMediaRecorderHistory_startRecordingWithContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) deserializeDirectoryURL];
  uint64_t v3 = [*(id *)(a1 + 40) fileURLWithDirectoryURL:v2 transactionID:*(void *)(a1 + 48) type:*(unsigned __int8 *)(a1 + 64)];
  if (!v2) {
    [*(id *)(a1 + 40) registerDirectoryWithURL:v3];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);

  return [v4 dispatchedStartRecordingWithContext:v5 fileURL:v3 completionHandler:v6];
}

- (void)endRecording:(id)a3 timestamp:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCMediaRecorderHistory endRecording:timestamp:completionHandler:]";
      __int16 v18 = 1024;
      int v19 = 613;
      __int16 v20 = 1024;
      unsigned int v21 = a4;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timestamp=%d", buf, 0x22u);
    }
  }
  recordingQueue = self->_recordingQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke;
  v12[3] = &unk_1E6DB5050;
  v12[4] = self;
  v12[5] = a3;
  void v12[6] = a5;
  unsigned int v13 = a4;
  dispatch_async(recordingQueue, v12);
  [(VCMediaRecorderHistory *)self stopProcessingTransactionID:a3];
}

void __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke(uint64_t a1)
{
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    [*(id *)(a1 + 32) setCompletionHandler:*(void *)(a1 + 48) forTransactionID:*(void *)(a1 + 40)];
    uint64_t v4 = *(unsigned int *)(a1 + 56);
    [v3 setEndRTPTimestampWithTimestamp:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:-5 userInfo:0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_cold_1();
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_27;
      block[3] = &unk_1E6DB5000;
      block[4] = v5;
      void block[5] = v6;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (id)_getActiveWriters
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = v3;
  if (self->_writer) {
    objc_msgSend(v3, "addObject:");
  }
  objc_msgSend(v4, "addObjectsFromArray:", -[NSMutableDictionary allValues](self->_writers, "allValues"));
  return v4;
}

- (void)historyBuffer:(id)a3 didDequeueSample:(opaqueCMSampleBuffer *)a4 timestamp:(unsigned int)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = *(void *)&a5;
    uint64_t v9 = -[VCMediaRecorderHistory _mediaTypeForBuffer:](self, "_mediaTypeForBuffer:");
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        uint64_t v11 = [(VCMediaRecorderHistory *)self _getActiveWriters]
            ? (const char *)objc_msgSend((id)objc_msgSend(-[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters"), "description"), "UTF8String"): "<nil>";
        asprintf(&__str, "%s", v11);
        if (__str)
        {
          __lasts = 0;
          __int16 v18 = strtok_r(__str, "\n", &__lasts);
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v19 = VRTraceErrorLogLevelToCSTR();
              __int16 v20 = *MEMORY[0x1E4F47A50];
              unsigned int v21 = *MEMORY[0x1E4F47A50];
              if (*MEMORY[0x1E4F47A40])
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v40 = v19;
                  __int16 v41 = 2080;
                  v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                  __int16 v43 = 1024;
                  int v44 = 651;
                  __int16 v45 = 2080;
                  v46 = "_getActiveWriters";
                  __int16 v47 = 2080;
                  v48 = (VCMediaRecorderHistory *)v18;
                  _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v40 = v19;
                __int16 v41 = 2080;
                v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                __int16 v43 = 1024;
                int v44 = 651;
                __int16 v45 = 2080;
                v46 = "_getActiveWriters";
                __int16 v47 = 2080;
                v48 = (VCMediaRecorderHistory *)v18;
                _os_log_debug_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            __int16 v18 = strtok_r(0, "\n", &__lasts);
          }
          while (v18);
          goto LABEL_33;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        int v12 = (const char *)[(__CFString *)v10 UTF8String];
        unsigned int v13 = [(VCMediaRecorderHistory *)self _getActiveWriters]
            ? (const char *)objc_msgSend((id)objc_msgSend(-[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters"), "description"), "UTF8String"): "<nil>";
        asprintf(&__str, "%s(%p) %s", v12, self, v13);
        if (__str)
        {
          __lasts = 0;
          uint64_t v14 = strtok_r(__str, "\n", &__lasts);
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v15 = VRTraceErrorLogLevelToCSTR();
              __int16 v16 = *MEMORY[0x1E4F47A50];
              __int16 v17 = *MEMORY[0x1E4F47A50];
              if (*MEMORY[0x1E4F47A40])
              {
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v40 = v15;
                  __int16 v41 = 2080;
                  v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                  __int16 v43 = 1024;
                  int v44 = 651;
                  __int16 v45 = 2080;
                  v46 = "_getActiveWriters";
                  __int16 v47 = 2080;
                  v48 = (VCMediaRecorderHistory *)v14;
                  _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v40 = v15;
                __int16 v41 = 2080;
                v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                __int16 v43 = 1024;
                int v44 = 651;
                __int16 v45 = 2080;
                v46 = "_getActiveWriters";
                __int16 v47 = 2080;
                v48 = (VCMediaRecorderHistory *)v14;
                _os_log_debug_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            uint64_t v14 = strtok_r(0, "\n", &__lasts);
          }
          while (v14);
LABEL_33:
          free(__str);
        }
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = [(VCMediaRecorderHistory *)self _getActiveWriters];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          int v27 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (self->_localAudioBuffer == a3
            && [*(id *)(*((void *)&v35 + 1) + 8 * i) shouldFinishWritingSampleBuffer:a4 RTPtimeStamp:v6 mediaType:v9])
          {
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __67__VCMediaRecorderHistory_historyBuffer_didDequeueSample_timestamp___block_invoke;
            v31[3] = &unk_1E6DB5078;
            v31[4] = self;
            [v27 finishWritingWithHandler:v31];
          }
          else if ([v27 shouldAppendSampleBuffer:a4 RTPtimeStamp:v6 mediaType:v9])
          {
            [(VCMediaRecorderHistory *)self appendSampleWithWriter:v27 buffer:a3 sample:a4 mediaType:v9];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v34 count:16];
      }
      while (v24);
    }
    return;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v28 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      __int16 v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v40 = v29;
        __int16 v41 = 2080;
        v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
        __int16 v43 = 1024;
        int v44 = 647;
        __int16 v45 = 2112;
        v46 = (const char *)v28;
        __int16 v47 = 2048;
        v48 = self;
        _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) sample is NULL", buf, 0x30u);
      }
    }
  }
}

uint64_t __67__VCMediaRecorderHistory_historyBuffer_didDequeueSample_timestamp___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handlePendingRequestsWithSourceURL:a2 error:a3];
}

- (void)dispatchedFinishWritingAllRequests
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  id v3 = [(VCMediaRecorderHistory *)self _getActiveWriters];
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      uint64_t v5 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v5);
      if (__str)
      {
        __lasts = 0;
        int v12 = strtok_r(__str, "\n", &__lasts);
        unsigned int v13 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            uint64_t v15 = *v13;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v30 = v14;
              __int16 v31 = 2080;
              __int16 v32 = "-[VCMediaRecorderHistory dispatchedFinishWritingAllRequests]";
              __int16 v33 = 1024;
              int v34 = 669;
              __int16 v35 = 2080;
              long long v36 = "_getActiveWriters";
              __int16 v37 = 2080;
              long long v38 = v12;
              _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          int v12 = strtok_r(0, "\n", &__lasts);
        }
        while (v12);
        goto LABEL_26;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      uint64_t v6 = (const char *)[(__CFString *)v4 UTF8String];
      uint64_t v7 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v6, self, v7);
      if (__str)
      {
        __lasts = 0;
        int v8 = strtok_r(__str, "\n", &__lasts);
        uint64_t v9 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            uint64_t v11 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v30 = v10;
              __int16 v31 = 2080;
              __int16 v32 = "-[VCMediaRecorderHistory dispatchedFinishWritingAllRequests]";
              __int16 v33 = 1024;
              int v34 = 669;
              __int16 v35 = 2080;
              long long v36 = "_getActiveWriters";
              __int16 v37 = 2080;
              long long v38 = v8;
              _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          int v8 = strtok_r(0, "\n", &__lasts);
        }
        while (v8);
LABEL_26:
        free(__str);
      }
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = [v3 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v3);
        }
        __int16 v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __60__VCMediaRecorderHistory_dispatchedFinishWritingAllRequests__block_invoke;
        v21[3] = &unk_1E6DB5078;
        v21[4] = self;
        [v20 finishWritingWithHandler:v21];
      }
      uint64_t v17 = [v3 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v17);
  }
}

uint64_t __60__VCMediaRecorderHistory_dispatchedFinishWritingAllRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handlePendingRequestsWithSourceURL:a2 error:a3];
}

void __VCMediaRecorderHistory_StopProcessingAllRequests_block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) dispatchedFinishWritingAllRequests];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        uint64_t v14 = "VCMediaRecorderHistory_StopProcessingAllRequests_block_invoke";
        __int16 v15 = 1024;
        int v16 = 685;
        uint64_t v5 = " [%s] %s:%d Flushing all requests.";
        uint64_t v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 136316162;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        uint64_t v14 = "VCMediaRecorderHistory_StopProcessingAllRequests_block_invoke";
        __int16 v15 = 1024;
        int v16 = 685;
        __int16 v17 = 2112;
        uint64_t v18 = v2;
        __int16 v19 = 2048;
        uint64_t v20 = v10;
        uint64_t v5 = " [%s] %s:%d %@(%p) Flushing all requests.";
        uint64_t v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
}

void __VCMediaRecorderHistory_ClearHistoryBuffer_block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) flushHistoryBuffers];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 80) count];
        int v13 = 136315906;
        uint64_t v14 = v3;
        __int16 v15 = 2080;
        int v16 = "VCMediaRecorderHistory_ClearHistoryBuffer_block_invoke";
        __int16 v17 = 1024;
        int v18 = 696;
        __int16 v19 = 2048;
        uint64_t v20 = v5;
        uint64_t v6 = " [%s] %s:%d completionHandlerCount=%lu";
        uint32_t v7 = v4;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = [*(id *)(v11 + 80) count];
        int v13 = 136316418;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        int v16 = "VCMediaRecorderHistory_ClearHistoryBuffer_block_invoke";
        __int16 v17 = 1024;
        int v18 = 696;
        __int16 v19 = 2112;
        uint64_t v20 = (uint64_t)v2;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        __int16 v23 = 2048;
        uint64_t v24 = v12;
        uint64_t v6 = " [%s] %s:%d %@(%p) completionHandlerCount=%lu";
        uint32_t v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)stopProcessingTransactionID:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCMediaRecorderHistory_stopProcessingTransactionID___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(recordingQueue, block);
}

void __54__VCMediaRecorderHistory_stopProcessingTransactionID___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) flushHistoryBuffers];
  uint64_t v2 = (__CFString *)[*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (([(__CFString *)v2 finishWritingInvoked] & 1) == 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__VCMediaRecorderHistory_stopProcessingTransactionID___block_invoke_2;
    v14[3] = &unk_1E6DB5078;
    v14[4] = *(void *)(a1 + 32);
    [(__CFString *)v2 finishWritingWithHandler:v14];
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 80) count];
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v4;
        __int16 v17 = 2080;
        int v18 = "-[VCMediaRecorderHistory stopProcessingTransactionID:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 714;
        __int16 v21 = 2112;
        uint64_t v22 = v2;
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        uint32_t v7 = " [%s] %s:%d writer=%@ completionHandlerCount=%lu";
        uint32_t v8 = v5;
        uint32_t v9 = 48;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = [*(id *)(v12 + 80) count];
        *(_DWORD *)buf = 136316674;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        int v18 = "-[VCMediaRecorderHistory stopProcessingTransactionID:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 714;
        __int16 v21 = 2112;
        uint64_t v22 = v3;
        __int16 v23 = 2048;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        long long v26 = v2;
        __int16 v27 = 2048;
        uint64_t v28 = v13;
        uint32_t v7 = " [%s] %s:%d %@(%p) writer=%@ completionHandlerCount=%lu";
        uint32_t v8 = v11;
        uint32_t v9 = 68;
        goto LABEL_13;
      }
    }
  }
}

uint64_t __54__VCMediaRecorderHistory_stopProcessingTransactionID___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handlePendingRequestsWithSourceURL:a2 error:a3];
}

- (void)cancelRequestWithTransactionID:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(recordingQueue, block);
}

uint64_t __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (__CFString *)[*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCMediaRecorderHistory cancelRequestWithTransactionID:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 721;
        __int16 v20 = 2112;
        __int16 v21 = v2;
        uint64_t v6 = " [%s] %s:%d currentWriter=%@";
        uint32_t v7 = v5;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCMediaRecorderHistory cancelRequestWithTransactionID:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 721;
        __int16 v20 = 2112;
        __int16 v21 = v3;
        __int16 v22 = 2048;
        uint64_t v23 = v11;
        __int16 v24 = 2112;
        __int16 v25 = v2;
        uint64_t v6 = " [%s] %s:%d %@(%p) currentWriter=%@";
        uint32_t v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke_35;
  v13[3] = &unk_1E6DB5078;
  v13[4] = *(void *)(a1 + 40);
  return [(__CFString *)v2 finishWritingWithHandler:v13];
}

void __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke_35(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint32_t v8 = "-[VCMediaRecorderHistory cancelRequestWithTransactionID:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 723;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d , %@", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (int)imageType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VCMediaRecorderHistory_imageType__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(recordingQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__VCMediaRecorderHistory_imageType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 164);
  return result;
}

- (void)setImageType:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCMediaRecorderHistory_setImageType___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_sync(recordingQueue, block);
}

void __39__VCMediaRecorderHistory_setImageType___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 164);
      int v5 = *(_DWORD *)(a1 + 40);
      int v6 = 136316162;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      int v9 = "-[VCMediaRecorderHistory setImageType:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 738;
      __int16 v12 = 1024;
      int v13 = v4;
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting image type from %d to %d", (uint8_t *)&v6, 0x28u);
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 164) = *(_DWORD *)(a1 + 40);
}

- (int)videoCodec
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 128;
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCMediaRecorderHistory_videoCodec__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(recordingQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__VCMediaRecorderHistory_videoCodec__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 288);
  return result;
}

- (void)setVideoCodec:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCMediaRecorderHistory_setVideoCodec___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_sync(recordingQueue, block);
}

void __40__VCMediaRecorderHistory_setVideoCodec___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 288);
      int v5 = *(_DWORD *)(a1 + 40);
      int v6 = 136316162;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      int v9 = "-[VCMediaRecorderHistory setVideoCodec:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 753;
      __int16 v12 = 1024;
      int v13 = v4;
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting video codec from %d to %d", (uint8_t *)&v6, 0x28u);
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 288) = *(_DWORD *)(a1 + 40);
}

- (id)writeToFileWithTimestamp:(unsigned int)a3 transactionID:(id)a4 directoryURL:(id)a5 imageType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v9 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]();
    }
  }
  int v11 = [(VCMediaRecorderHistoryBuffer *)self->_frameBuffer getClosestSampleForTimestamp:v9];
  ImageBuffer = CMSampleBufferGetImageBuffer(v11);
  int v13 = CVPixelBufferRetain(ImageBuffer);
  unsigned __int8 valuePtr = 0;
  CFNumberRef v14 = (const __CFNumber *)CMGetAttachment(v11, @"bCameraStatusBits", 0);
  CFNumberGetValue(v14, kCFNumberSInt8Type, &valuePtr);
  id v15 = +[VideoUtil convertPixelBuffer:v13 toImageType:v6 withAssetIdentifier:0 cameraStatusBits:valuePtr allowTimeMetaData:0];
  CVPixelBufferRelease(v13);
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]();
      }
    }
    return 0;
  }
  id v16 = [(VCMediaRecorderHistory *)self fileURLWithDirectoryURL:a5 transactionID:a4 type:1];
  if (([v15 writeToURL:v16 atomically:1] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          int v19 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        }
        else {
          int v19 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = v17;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]";
        __int16 v26 = 1024;
        int v27 = 784;
        __int16 v28 = 2080;
        uint64_t v29 = v19;
        __int16 v30 = 1024;
        int v31 = v9;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d write to file failed url is nil for transationID %s, timestamp %d", buf, 0x2Cu);
      }
    }
    return 0;
  }
  return v16;
}

- (id)writeToLivePhotoToFileWithFrame:(__CVBuffer *)a3 transactionID:(id)a4 directoryURL:(id)a5 imageType:(int)a6 cameraStatusBits:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  double Width = (double)CVPixelBufferGetWidth(a3);
  double Height = (double)CVPixelBufferGetHeight(a3);
  BOOL v15 = self->_bufferPoolResolution.width == Width && self->_bufferPoolResolution.height == Height;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL resize = self->_resize;
      int v32 = 136316162;
      uint64_t v33 = v16;
      __int16 v34 = 2080;
      __int16 v35 = "-[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]";
      __int16 v36 = 1024;
      int v37 = 804;
      __int16 v38 = 1024;
      *(_DWORD *)uint64_t v39 = resize;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v15;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _resize=%d framesMatchLivePhotoResolution=%d", (uint8_t *)&v32, 0x28u);
    }
  }
  char v19 = !self->_resize || v15;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v19)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136316162;
        uint64_t v33 = v21;
        __int16 v34 = 2080;
        __int16 v35 = "-[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]";
        __int16 v36 = 1024;
        int v37 = 810;
        __int16 v38 = 2048;
        *(double *)uint64_t v39 = Width;
        *(_WORD *)&v39[8] = 2048;
        double v40 = Height;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping Live Photo crop for input frame (%fx%f)", (uint8_t *)&v32, 0x30u);
      }
    }
    ResizeFrame = CVBufferRetain(a3);
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      __int16 v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v26 = self->_bufferPoolResolution.width;
        CGFloat v27 = self->_bufferPoolResolution.height;
        int v32 = 136316674;
        uint64_t v33 = v24;
        __int16 v34 = 2080;
        __int16 v35 = "-[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]";
        __int16 v36 = 1024;
        int v37 = 806;
        __int16 v38 = 2048;
        *(double *)uint64_t v39 = Width;
        *(_WORD *)&v39[8] = 2048;
        double v40 = Height;
        __int16 v41 = 2048;
        CGFloat v42 = v26;
        __int16 v43 = 2048;
        CGFloat v44 = v27;
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cropping input frame (%fx%f) to Live Photo resolution (%fx%f)", (uint8_t *)&v32, 0x44u);
      }
    }
    ResizeFrame = VCMediaRecorderUtil_CreateResizeFrame(a3, self->_transferSession, self->_bufferPool);
    if (!ResizeFrame)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]();
        }
      }
      return 0;
    }
  }
  id v28 = +[VideoUtil convertPixelBuffer:ResizeFrame toImageType:v8 withAssetIdentifier:a4 cameraStatusBits:v7 allowTimeMetaData:0];
  id v29 = [(VCMediaRecorderHistory *)self fileURLWithDirectoryURL:a5 transactionID:a4 type:1];
  char v30 = [v28 writeToURL:v29 atomically:1];
  CVPixelBufferRelease(ResizeFrame);
  if ((v30 & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]();
      }
    }
    return 0;
  }
  return v29;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)setUpStillImageWithContext:(SEL)a3 visibleRect:(id)a4 cameraStatusBit:(CGRect *)a5 imageType:(char *)a6
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  uint64_t v13 = [a4 timestamp];
  uint64_t v14 = [a4 transactionID];
  BOOL v15 = [(VCMediaRecorderHistoryBuffer *)self->_frameBuffer getClosestSampleForTimestamp:v13];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t v16 = [(NSMutableDictionary *)self->_completionHandlers objectForKeyedSubscript:v14];
  if (v15)
  {
    uint64_t v17 = (void *)FigSampleBufferRetain();
    CFNumberRef v18 = (const __CFNumber *)CMGetAttachment(v17, @"bCameraStatusBits", 0);
    CFNumberGetValue(v18, kCFNumberSInt8Type, a6);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v17);
    CVBufferRetain(ImageBuffer);
    VideoUtil_GetVisibleRect(ImageBuffer, &a5->origin.x);
    if (self->_resize) {
      -[VCMediaRecorderHistory setupResizingSessionsWithVisibleRect:cameraStatusBit:](self, "setupResizingSessionsWithVisibleRect:cameraStatusBit:", *a6, a5->origin.x, a5->origin.y, a5->size.width, a5->size.height);
    }
    id v20 = -[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:](self, "writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:", ImageBuffer, v14, [a4 deserializeDirectoryURL], v7, *a6);
    CVBufferRelease(ImageBuffer);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 136316162;
        *(CMTimeValue *)((char *)&buf.value + 4) = v21;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "-[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStat"
                                              "usBit:imageType:]";
        HIWORD(buf.epoch) = 1024;
        int v31 = 858;
        __int16 v32 = 1024;
        BOOL v33 = v20 != 0;
        __int16 v34 = 2112;
        id v35 = v20;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d write to file %d stillImageURL:%@", (uint8_t *)&buf, 0x2Cu);
      }
    }
    if (v20)
    {
      CMSampleBufferGetPresentationTimeStamp(&buf, (CMSampleBufferRef)v17);
      *(CMTime *)retstr = buf;
      FigSampleBufferRelease();
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(NSMutableDictionary *)self->_stillImageURLs setObject:v20 forKeyedSubscript:v14];
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:-1 userInfo:0];
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke;
      block[3] = &unk_1E6DB5000;
      block[4] = v26;
      void block[5] = v16;
      dispatch_async(delegateQueue, block);
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigSampleBufferRelease();
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:]();
      }
    }
    uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:-2 userInfo:0];
    __int16 v25 = self->_delegateQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke_36;
    v28[3] = &unk_1E6DB5000;
    v28[4] = v24;
    v28[5] = v16;
    dispatch_async(v25, v28);
  }
  return result;
}

uint64_t __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)setupResizingSessionsWithVisibleRect:(CGRect)a3 cameraStatusBit:(unsigned __int8)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  p_bufferPool = &self->_bufferPool;
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
    self->_bufferPoolResolution = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  double v12 = VCMediaWriterUtil_CalculateImageSizeWithVisibleRect(a4, self->_captureWidth, self->_captureHeight, x, y, width, height);
  CGFloat v14 = v13;
  if (VCMediaRecorderUtil_SetupBufferPool(@"AVConference:MediaRecorderResize", p_bufferPool, v12, v13))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistory setupResizingSessionsWithVisibleRect:cameraStatusBit:]();
      }
    }
  }
  self->_bufferPoolResolution.double width = v12;
  self->_bufferPoolResolution.double height = v14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136317186;
      uint64_t v18 = v15;
      __int16 v19 = 2080;
      id v20 = "-[VCMediaRecorderHistory setupResizingSessionsWithVisibleRect:cameraStatusBit:]";
      __int16 v21 = 1024;
      int v22 = 893;
      __int16 v23 = 2048;
      double v24 = v12;
      __int16 v25 = 2048;
      CGFloat v26 = v14;
      __int16 v27 = 2048;
      double v28 = x;
      __int16 v29 = 2048;
      double v30 = y;
      __int16 v31 = 2048;
      double v32 = width;
      __int16 v33 = 2048;
      double v34 = height;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaRecorderHistory visible Width is %f, height %f rect (%f,%f) (%fx%f)", (uint8_t *)&v17, 0x58u);
    }
  }
}

- (void)setUpWriterWithContext:(id)a3 fileURL:(id)a4 stillImageTime:(id *)a5 visibleRect:(CGRect)a6 cameraStatusBit:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  void block[6] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  uint64_t v16 = [a3 transactionID];
  uint64_t v17 = [(NSMutableDictionary *)self->_completionHandlers objectForKeyedSubscript:v16];
  uint64_t v18 = (VCMovieWriterProtocol *)VCMediaWriterUtil_NewWriter((uint64_t)a4, v16, +[VideoUtil videoCodecForPayload:self->_videoCodec], 30.0);
  self->_writer = v18;
  if (v18)
  {
    -[VCMovieWriterProtocol setDirectoryURL:](self->_writer, "setDirectoryURL:", [a3 deserializeDirectoryURL]);
    if (a3)
    {
      [a3 movieFragmentInterval];
    }
    else
    {
      long long v27 = 0uLL;
      uint64_t v28 = 0;
    }
    writer = self->_writer;
    long long v25 = v27;
    uint64_t v26 = v28;
    [(VCMovieWriterProtocol *)writer setMovieFragmentInterval:&v25];
    VCMediaWriterUtil_SetUpWriterWithCaptureFormat(self->_writer, v7, self->_captureWidth, self->_captureHeight, self->_resize, x, y, width, height);
    [(VCMovieWriterProtocol *)self->_writer setupWriterWithMode:1];
    int v22 = self->_writer;
    long long v23 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    [(VCMovieWriterProtocol *)v22 setStillImageTime:&v23];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:-3 userInfo:0];
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__VCMediaRecorderHistory_setUpWriterWithContext_fileURL_stillImageTime_visibleRect_cameraStatusBit___block_invoke;
    block[3] = &unk_1E6DB5000;
    block[4] = v19;
    void block[5] = v17;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __100__VCMediaRecorderHistory_setUpWriterWithContext_fileURL_stillImageTime_visibleRect_cameraStatusBit___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (id)fileExtensionForMediaType:(unsigned __int8)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  if ((v3 - 2) < 4) {
    return @"MOV";
  }
  if (v3 != 1) {
    return 0;
  }
  if (self->_imageType) {
    return @"heic";
  }
  return @"JPG";
}

+ (id)fileNameForMediaType:(unsigned __int8)a3 dateString:(id)a4
{
  if (a3 == 5) {
    return (id)[NSString stringWithFormat:@"moments_%@-audio", a4, v5];
  }
  else {
    return (id)[NSString stringWithFormat:@"%s_recording_%@", VCMediaRecorderUtil_FilePrefixForMediaType(a3), a4];
  }
}

- (id)fileURLWithDirectoryURL:(id)a3 transactionID:(id)a4 type:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  v37[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a3)
  {
    __int16 v10 = (void *)MEMORY[0x1E4F1CB10];
    v37[0] = NSTemporaryDirectory();
    v37[1] = @"avconference";
    id v9 = (id)objc_msgSend(v10, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v37, 2));
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v12 setDateFormat:@"MM_dd_HH_mm_ss"];
  objc_msgSend(v12, "setLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", @"en_US_POSIX"));
  uint64_t v13 = [v12 stringFromDate:v11];

  id v14 = [(VCMediaRecorderHistory *)self fileExtensionForMediaType:v5];
  if (!a3)
  {
    id v9 = (id)[v9 URLByAppendingPathComponent:a4];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "URLByStandardizingPath"), "path"), "UTF8String");
    VCDiskUtils_CreateDirectory();
  }
  uint64_t v15 = (__CFString *)objc_msgSend((id)objc_msgSend(v9, "URLByAppendingPathComponent:", +[VCMediaRecorderHistory fileNameForMediaType:dateString:](VCMediaRecorderHistory, "fileNameForMediaType:dateString:", v5, v13)), "URLByAppendingPathExtension:", v14);
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136315906;
        uint64_t v26 = v17;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCMediaRecorderHistory fileURLWithDirectoryURL:transactionID:type:]";
        __int16 v29 = 1024;
        int v30 = 978;
        __int16 v31 = 2112;
        double v32 = v15;
        uint64_t v19 = " [%s] %s:%d filePath=%@";
        id v20 = v18;
        uint32_t v21 = 38;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      long long v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136316418;
        uint64_t v26 = v22;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCMediaRecorderHistory fileURLWithDirectoryURL:transactionID:type:]";
        __int16 v29 = 1024;
        int v30 = 978;
        __int16 v31 = 2112;
        double v32 = v16;
        __int16 v33 = 2048;
        double v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = v15;
        uint64_t v19 = " [%s] %s:%d %@(%p) filePath=%@";
        id v20 = v23;
        uint32_t v21 = 58;
        goto LABEL_15;
      }
    }
  }
  return v15;
}

+ (int)rewriteMovieMetadataWithURL:(id)a3 transactionID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      uint64_t v18 = v6;
      __int16 v19 = 2080;
      id v20 = "+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]";
      __int16 v21 = 1024;
      int v22 = 986;
      __int16 v23 = 2112;
      id v24 = a4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d for %@", (uint8_t *)&v17, 0x26u);
    }
  }
  MetaDataArrayWithIndentifier = (const void *)VCMediaWriterUtil_GetMetaDataArrayWithIndentifier((uint64_t)a4);
  DeepCopdouble y = (const __CFArray *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MetaDataArrayWithIndentifier, 1uLL);
  ValueAtIndedouble x = (const __CFDictionary *)CFArrayGetValueAtIndex(DeepCopy, 0);
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F33070]);
  CFArrayGetValueAtIndex(Value, 0);
  FigCFDictionarySetValue();
  id v12 = (void *)FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray();
  int v13 = FigRewriteMetadata();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316418;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      id v20 = "+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]";
      __int16 v21 = 1024;
      int v22 = 994;
      __int16 v23 = 2112;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = a4;
      __int16 v27 = 2112;
      id v28 = a3;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d rewriteMovieMetadata %@ for transactionID %@ with URL %@", (uint8_t *)&v17, 0x3Au);
    }
  }
  if (DeepCopy) {
    CFRelease(DeepCopy);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]();
      }
    }
  }
  return v13;
}

- (id)handleCopyRequestWithTransactionID:(id)a3 sourceURL:(id)a4 errorCode:(int *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  CGFloat v42 = 0;
  if (objc_msgSend((id)-[VCMovieWriterProtocol transactionID](self->_writer, "transactionID"), "isEqualToString:", a3))
  {
    *a5 = -7;
    if ((VCMediaRecorderHistory *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        id v20 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
      }
      else {
        id v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      double v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      uint64_t v33 = [(VCMovieWriterProtocol *)self->_writer transactionID];
      *(_DWORD *)CMTime buf = 136316674;
      uint64_t v44 = v31;
      __int16 v45 = 2080;
      v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
      __int16 v47 = 1024;
      int v48 = 1021;
      __int16 v49 = 2112;
      id v50 = v20;
      __int16 v51 = 2048;
      uint64_t v52 = (uint64_t)self;
      __int16 v53 = 2112;
      id v54 = a3;
      __int16 v55 = 2112;
      uint64_t v56 = v33;
      __int16 v27 = " [%s] %s:%d %@(%p) Redundant copy - proposed transactionID=%@ matches main writer transactionID=%@";
LABEL_61:
      id v28 = v32;
      uint32_t v36 = 68;
      goto LABEL_62;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    uint64_t v26 = [(VCMovieWriterProtocol *)self->_writer transactionID];
    *(_DWORD *)CMTime buf = 136316162;
    uint64_t v44 = v24;
    __int16 v45 = 2080;
    v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
    __int16 v47 = 1024;
    int v48 = 1021;
    __int16 v49 = 2112;
    id v50 = a3;
    __int16 v51 = 2112;
    uint64_t v52 = v26;
    __int16 v27 = " [%s] %s:%d Redundant copy - proposed transactionID=%@ matches main writer transactionID=%@";
    id v28 = v25;
    goto LABEL_49;
  }
  uint64_t v9 = +[VCMediaRecorderHistory mediaTypeFromWriterMode:[(VCMovieWriterProtocol *)self->_writer writerMode]];
  if (!v9)
  {
    *a5 = -10;
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      __int16 v35 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 136316162;
        uint64_t v44 = v34;
        __int16 v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        __int16 v47 = 1024;
        int v48 = 1024;
        __int16 v49 = 2112;
        id v50 = v21;
        __int16 v51 = 2048;
        uint64_t v52 = (uint64_t)self;
        __int16 v27 = " [%s] %s:%d %@(%p) Failed to retrieve valid mediaType from writerMode";
        id v28 = v35;
LABEL_49:
        uint32_t v36 = 48;
LABEL_62:
        _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v27, buf, v36);
      }
    }
    return 0;
  }
  id v10 = [(VCMediaRecorderHistory *)self fileURLWithDirectoryURL:[(VCMovieWriterProtocol *)self->_writer directoryURL] transactionID:a3 type:v9];
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136316162;
        uint64_t v44 = v12;
        __int16 v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        __int16 v47 = 1024;
        int v48 = 1028;
        __int16 v49 = 2112;
        id v50 = a3;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)a4;
        uint64_t v14 = " [%s] %s:%d copying live photo for transactionID=%@, sourceURL=%@";
        uint64_t v15 = v13;
        uint32_t v16 = 48;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136316674;
        uint64_t v44 = v17;
        __int16 v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        __int16 v47 = 1024;
        int v48 = 1028;
        __int16 v49 = 2112;
        id v50 = v11;
        __int16 v51 = 2048;
        uint64_t v52 = (uint64_t)self;
        __int16 v53 = 2112;
        id v54 = a3;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)a4;
        uint64_t v14 = " [%s] %s:%d %@(%p) copying live photo for transactionID=%@, sourceURL=%@";
        uint64_t v15 = v18;
        uint32_t v16 = 68;
        goto LABEL_13;
      }
    }
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtURL:toURL:error:", a4, v10, &v42) & 1) == 0)
  {
    *a5 = -8;
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        int v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:](v29, &v42, v30);
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      int v22 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
    }
    else {
      int v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      __int16 v38 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 136316418;
        uint64_t v44 = v37;
        __int16 v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        __int16 v47 = 1024;
        int v48 = 1030;
        __int16 v49 = 2112;
        id v50 = v22;
        __int16 v51 = 2048;
        uint64_t v52 = (uint64_t)self;
        __int16 v53 = 2112;
        id v54 = v42;
        __int16 v27 = " [%s] %s:%d %@(%p) copying file failed with error=%@";
        id v28 = v38;
        uint32_t v36 = 58;
        goto LABEL_62;
      }
    }
    return 0;
  }
  if (+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:v10 transactionID:a3])
  {
    *a5 = -9;
    if (v10)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", v10, &v42)&& !v42)
      {
        return 0;
      }
      if ((VCMediaRecorderHistory *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v23 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v23 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return 0;
        }
        uint64_t v41 = VRTraceErrorLogLevelToCSTR();
        double v32 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_DWORD *)CMTime buf = 136316674;
        uint64_t v44 = v41;
        __int16 v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        __int16 v47 = 1024;
        int v48 = 1040;
        __int16 v49 = 2112;
        id v50 = v23;
        __int16 v51 = 2048;
        uint64_t v52 = (uint64_t)self;
        __int16 v53 = 2112;
        id v54 = v10;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v42;
        __int16 v27 = " [%s] %s:%d %@(%p) Failed to remove destinationURL=%@ error=%@";
        goto LABEL_61;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      double v40 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)CMTime buf = 136316162;
      uint64_t v44 = v39;
      __int16 v45 = 2080;
      v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
      __int16 v47 = 1024;
      int v48 = 1040;
      __int16 v49 = 2112;
      id v50 = v10;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v42;
      __int16 v27 = " [%s] %s:%d Failed to remove destinationURL=%@ error=%@";
      id v28 = v40;
      goto LABEL_49;
    }
  }
  return v10;
}

- (void)handleSinglePendingRequestWithTransactionID:(id)a3 sourceURL:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  int v44 = 0;
  uint64_t v7 = [(NSMutableDictionary *)self->_completionHandlers objectForKeyedSubscript:a3];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = a4;
    if (![(NSMutableDictionary *)self->_writers objectForKeyedSubscript:a3]) {
      id v9 = [(VCMediaRecorderHistory *)self handleCopyRequestWithTransactionID:a3 sourceURL:a4 errorCode:&v44];
    }
    id v10 = (VCMediaRecorderHistory *)objc_opt_class();
    if (v9)
    {
      if (v10 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_16;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        uint64_t v14 = [(NSMutableDictionary *)self->_writers objectForKeyedSubscript:a3];
        *(_DWORD *)CMTime buf = 136316418;
        uint64_t v46 = v12;
        __int16 v47 = 2080;
        int v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
        __int16 v49 = 1024;
        int v50 = 1062;
        __int16 v51 = 2112;
        id v52 = v9;
        __int16 v53 = 2112;
        id v54 = a3;
        __int16 v55 = 2112;
        uint64_t v56 = v14;
        uint64_t v15 = " [%s] %s:%d destinationURL=%@ transactionID=%@ writer=%@";
        uint32_t v16 = v13;
        uint32_t v17 = 58;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v11 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_16;
        }
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        uint64_t v20 = [(NSMutableDictionary *)self->_writers objectForKeyedSubscript:a3];
        *(_DWORD *)CMTime buf = 136316930;
        uint64_t v46 = v18;
        __int16 v47 = 2080;
        int v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
        __int16 v49 = 1024;
        int v50 = 1062;
        __int16 v51 = 2112;
        id v52 = v11;
        __int16 v53 = 2048;
        id v54 = self;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v9;
        __int16 v57 = 2112;
        id v58 = a3;
        __int16 v59 = 2112;
        uint64_t v60 = v20;
        uint64_t v15 = " [%s] %s:%d %@(%p) destinationURL=%@ transactionID=%@ writer=%@";
        uint32_t v16 = v19;
        uint32_t v17 = 78;
      }
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_16:
      uint64_t v21 = [(NSMutableDictionary *)self->_stillImageURLs objectForKeyedSubscript:a3];
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke;
      block[3] = &unk_1E6DB4F60;
      void block[5] = v9;
      void block[6] = v8;
      block[4] = v21;
      __int16 v23 = block;
LABEL_17:
      dispatch_async(delegateQueue, v23);
      goto LABEL_18;
    }
    if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v31 = VRTraceErrorLogLevelToCSTR(),
            double v32 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_41:
        if (v44) {
          int v40 = v44;
        }
        else {
          int v40 = -7;
        }
        int v44 = v40;
        uint64_t v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderHistory" code:v40 userInfo:0];
        delegateQueue = self->_delegateQueue;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke_2;
        v42[3] = &unk_1E6DB5000;
        v42[4] = v41;
        v42[5] = v8;
        __int16 v23 = v42;
        goto LABEL_17;
      }
      *(_DWORD *)CMTime buf = 136316162;
      uint64_t v46 = v31;
      __int16 v47 = 2080;
      int v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
      __int16 v49 = 1024;
      int v50 = 1061;
      __int16 v51 = 2112;
      id v52 = a4;
      __int16 v53 = 2112;
      id v54 = a3;
      uint64_t v33 = " [%s] %s:%d Failed to obtain a valid destinationURL for sourceURL=%@ transactionID=%@";
      uint64_t v34 = v32;
      uint32_t v35 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v25 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v25 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_41;
      }
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      uint64_t v39 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_41;
      }
      *(_DWORD *)CMTime buf = 136316674;
      uint64_t v46 = v38;
      __int16 v47 = 2080;
      int v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
      __int16 v49 = 1024;
      int v50 = 1061;
      __int16 v51 = 2112;
      id v52 = v25;
      __int16 v53 = 2048;
      id v54 = self;
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)a4;
      __int16 v57 = 2112;
      id v58 = a3;
      uint64_t v33 = " [%s] %s:%d %@(%p) Failed to obtain a valid destinationURL for sourceURL=%@ transactionID=%@";
      uint64_t v34 = v39;
      uint32_t v35 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_41;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_18;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)CMTime buf = 136315906;
    uint64_t v46 = v26;
    __int16 v47 = 2080;
    int v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
    __int16 v49 = 1024;
    int v50 = 1052;
    __int16 v51 = 2112;
    id v52 = a3;
    id v28 = " [%s] %s:%d handler for transactionID=%@ not found";
    uint64_t v29 = v27;
    uint32_t v30 = 38;
    goto LABEL_37;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v24 = (__CFString *)[(VCMediaRecorderHistory *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v24 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    uint64_t v37 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136316418;
      uint64_t v46 = v36;
      __int16 v47 = 2080;
      int v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
      __int16 v49 = 1024;
      int v50 = 1052;
      __int16 v51 = 2112;
      id v52 = v24;
      __int16 v53 = 2048;
      id v54 = self;
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)a3;
      id v28 = " [%s] %s:%d %@(%p) handler for transactionID=%@ not found";
      uint64_t v29 = v37;
      uint32_t v30 = 58;
LABEL_37:
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
    }
  }
LABEL_18:
  if (a3)
  {
    [(NSMutableDictionary *)self->_completionHandlers setObject:0 forKeyedSubscript:a3];
    [(NSMutableDictionary *)self->_stillImageURLs setObject:0 forKeyedSubscript:a3];
  }
}

uint64_t __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)handlePendingRequestWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  pendingRequests = self->_pendingRequests;
  uint64_t v6 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(pendingRequests);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)self->_completionHandlers objectForKeyedSubscript:v10];
        if (v11)
        {
          delegateQueue = self->_delegateQueue;
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __56__VCMediaRecorderHistory_handlePendingRequestWithError___block_invoke;
          v13[3] = &unk_1E6DB5000;
          v13[4] = a3;
          void v13[5] = v11;
          dispatch_async(delegateQueue, v13);
        }
        if (v10)
        {
          [(NSMutableDictionary *)self->_completionHandlers setObject:0 forKeyedSubscript:v10];
          [(NSMutableDictionary *)self->_stillImageURLs setObject:0 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v7);
  }
}

uint64_t __56__VCMediaRecorderHistory_handlePendingRequestWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)handlePendingRequestSuccessWithSourceURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  pendingRequests = self->_pendingRequests;
  uint64_t v6 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(pendingRequests);
        }
        [(VCMediaRecorderHistory *)self handleSinglePendingRequestWithTransactionID:*(void *)(*((void *)&v11 + 1) + 8 * i) sourceURL:a3];
      }
      uint64_t v7 = [(NSMutableArray *)pendingRequests countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (void)handlePendingRequestsWithSourceURL:(id)a3 error:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  recordingQueue = self->_recordingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = a4;
  v5[5] = self;
  v5[6] = a3;
  dispatch_async(recordingQueue, v5);
}

void __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3) {
    objc_msgSend(v2, "handlePendingRequestWithError:");
  }
  else {
    [v2 handlePendingRequestSuccessWithSourceURL:a1[6]];
  }
  uint64_t v4 = [*(id *)(a1[5] + 80) objectForKeyedSubscript:*(void *)(a1[5] + 48)];
  uint64_t v5 = [*(id *)(a1[5] + 88) objectForKeyedSubscript:*(void *)(a1[5] + 48)];
  if (v4)
  {
    uint64_t v6 = *(NSObject **)(a1[5] + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke_2;
    block[3] = &unk_1E6DB50A0;
    uint64_t v7 = a1[6];
    block[4] = v5;
    void block[5] = v7;
    void block[6] = a1[4];
    void block[7] = v4;
    dispatch_async(v6, block);
  }
  uint64_t v8 = a1[5];
  if (*(void *)(v8 + 48))
  {
    objc_msgSend(*(id *)(v8 + 80), "setObject:forKeyedSubscript:", 0);
    [*(id *)(a1[5] + 88) setObject:0 forKeyedSubscript:*(void *)(a1[5] + 48)];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    id v9 = (void *)a1[5];
    uint64_t v10 = (void *)v9[5];
    if (v10)
    {
      long long v11 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
      id v9 = (void *)a1[5];
    }
    else
    {
      long long v11 = "<nil>";
    }
    long long v12 = (void *)v9[4];
    if (v12)
    {
      long long v13 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
      id v9 = (void *)a1[5];
    }
    else
    {
      long long v13 = "<nil>";
    }
    long long v14 = (void *)v9[7];
    uint64_t v15 = v14 ? (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "writer=%s writers=%s pendingRequests=%s", v11, v13, v15);
    if (__str)
    {
      __lasts = 0;
      long long v16 = strtok_r(__str, "\n", &__lasts);
      long long v17 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          uint64_t v19 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 136316162;
            uint64_t v24 = v18;
            __int16 v25 = 2080;
            uint64_t v26 = "-[VCMediaRecorderHistory handlePendingRequestsWithSourceURL:error:]_block_invoke";
            __int16 v27 = 1024;
            int v28 = 1126;
            __int16 v29 = 2080;
            uint32_t v30 = "";
            __int16 v31 = 2080;
            double v32 = v16;
            _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        long long v16 = strtok_r(0, "\n", &__lasts);
      }
      while (v16);
      free(__str);
    }
  }
  [*(id *)(a1[5] + 32) removeAllObjects];
  [*(id *)(a1[5] + 56) removeAllObjects];

  *(void *)(a1[5] + 40) = 0;
  *(void *)(a1[5] + 48) = 0;
}

uint64_t __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)flushHistoryBuffers
{
  uint64_t v2 = 0;
  int v3 = 0;
  v9[3] = *MEMORY[0x1E4F143B8];
  localAudioBuffer = self->_localAudioBuffer;
  remoteAudioBuffer = self->_remoteAudioBuffer;
  v9[0] = self->_frameBuffer;
  v9[1] = localAudioBuffer;
  v9[2] = remoteAudioBuffer;
  do
  {
    int v6 = VCMediaRecorderHistoryBuffer_DequeueOneFrame(v9[v2]) | v3;
    BOOL v7 = v2 == 2;
    BOOL v8 = v2 != 2;
    if (v2 == 2) {
      uint64_t v2 = 0;
    }
    else {
      ++v2;
    }
    int v3 = v8 & v6;
  }
  while (!v7 || (v6 & 1) != 0);
}

- (unsigned)_mediaTypeForBuffer:(id)a3
{
  if (self->_frameBuffer == a3) {
    return 3;
  }
  if (self->_localAudioBuffer == a3) {
    return 1;
  }
  return 2 * (self->_remoteAudioBuffer == a3);
}

- (void)appendSampleWithWriter:(id)a3 buffer:(id)a4 sample:(opaqueCMSampleBuffer *)a5 mediaType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_frameBuffer == a4)
  {
    unsigned __int8 valuePtr = 0;
    if (a5)
    {
      CFNumberRef v9 = (const __CFNumber *)CMGetAttachment(a5, @"bCameraStatusBits", 0);
      CFNumberGetValue(v9, kCFNumberSInt8Type, &valuePtr);
      uint64_t v10 = valuePtr;
    }
    else
    {
      uint64_t v10 = 0;
    }
    [a3 appendVideoSampleBuffer:a5 cameraStatus:v10 mediaType:v6];
  }
  else
  {
    [a3 appendAudioSampleBuffer:a5 mediaType:a6];
  }
}

- (void)registerDirectoryWithURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)[a3 URLByDeletingLastPathComponent];
  uint64_t v4 = (void *)[v3 URLByDeletingLastPathComponent];
  int v5 = FigSandboxRegisterDirectoryURL();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  BOOL v7 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    CFNumberRef v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      }
      else {
        uint64_t v10 = "<nil>";
      }
      int v15 = 136316162;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCMediaRecorderHistory registerDirectoryWithURL:]";
      __int16 v19 = 1024;
      int v20 = 1309;
      __int16 v21 = 1024;
      int v22 = v5;
      __int16 v23 = 2080;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigSandboxRegisterDirectoryURL returned %d for %s", (uint8_t *)&v15, 0x2Cu);
    }
  }
  int v11 = FigSandboxRegisterDirectoryURL();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    long long v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        long long v14 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      }
      else {
        long long v14 = "<nil>";
      }
      int v15 = 136316162;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCMediaRecorderHistory registerDirectoryWithURL:]";
      __int16 v19 = 1024;
      int v20 = 1311;
      __int16 v21 = 1024;
      int v22 = v11;
      __int16 v23 = 2080;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigSandboxRegisterDirectoryURL returned %d for %s", (uint8_t *)&v15, 0x2Cu);
    }
  }
}

- (void)setCompletionHandler:(id)a3 forTransactionID:(id)a4
{
  uint64_t v6 = _Block_copy(a3);
  [(NSMutableDictionary *)self->_completionHandlers setObject:v6 forKeyedSubscript:a4];

  _Block_release(v6);
}

- (void)cleanupTransferSession
{
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    uint64_t v4 = self->_transferSession;
    if (v4)
    {
      CFRelease(v4);
      self->_transferSession = 0;
    }
  }
  copyTransferSession = self->_copyTransferSession;
  if (copyTransferSession)
  {
    VTPixelTransferSessionInvalidate(copyTransferSession);
    uint64_t v6 = self->_copyTransferSession;
    if (v6)
    {
      CFRelease(v6);
      self->_copyTransferSession = 0;
    }
  }
  CVPixelBufferPoolRelease(self->_bufferPool);
  self->_bufferPool = 0;
  self->_bufferPoolResolution = (CGSize)*MEMORY[0x1E4F1DB30];
  CVPixelBufferPoolRelease(self->_copyPool);
  self->_copyPool = 0;
}

- (void)setUpDelegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate delegateQueue=%@.");
}

- (void)setUpAudioBuffers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio sample buffer allocator.", v2, v3, v4, v5, v6);
}

- (void)setUpVideoBuffers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate copy transfer session for copy pixel buffer path.", v2, v3, v4, v5, v6);
}

- (void)initWithDelegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to initialize media recorder history on an unsupported device.", v2, v3, v4, v5, v6);
}

void __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d , createSampleBufferWithPixelBuffer failed", v2, v3, v4, v5, v6);
}

void __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VCMediaRecorderHistory_UpdateVideoBuffer";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d , set camerabit for attachments failed for sampleBuffer with timestamp %d", v2, *(const char **)v3, (unint64_t)"_VCMediaRecorderHistory_UpdateVideoBuffer" >> 16, v4);
}

void __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "_VCMediaRecorderHistory_UpdateVideoBuffer";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Updating video buffer for timestamp %d", v1, 0x22u);
}

- (void)takePhotoWithContext:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid request context passed", v2, v3, v4, v5, v6);
}

void __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_cold_1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
  OUTLINED_FUNCTION_3();
  int v4 = 377;
  __int16 v5 = v0;
  int v6 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d photo writing to file success=%{BOOL}d", v2, 0x22u);
}

- (void)takeLivePhotoWithContext:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid request context passed", v2, v3, v4, v5, v6);
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d still image time is not valid", v2, v3, v4, v5, v6);
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d masterTransactionID is not nil, this shouldn't be happening", v2, v3, v4, v5, v6);
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d masterTransactionID is nil while writer is not nil, this shouldn't be happening, but setting %@ to be masterTransactionID");
}

+ (void)mediaTypeFromWriterMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaRecorderHistory mediaTypeFromWriterMode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Passed unexpected writerMode=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaRecorderHistory mediaTypeFromWriterMode:]" >> 16, v4);
}

+ (void)writerModeFromMediaType:(uint64_t)a1 .cold.1(uint64_t a1, unsigned __int8 a2)
{
  VCMediaRecorderUtil_DescriptionForMediaType(a2);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Passed unexpected mediaType=%@", v4, v5, v6, v7, v8);
}

- (void)dispatchedStartRecordingWithContext:fileURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d writer for transactionID=%@ exists");
}

- (void)startRecordingWithContext:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid request context passed", v2, v3, v4, v5, v6);
}

- (void)startRecordingWithContext:(uint64_t)a1 completionHandler:(unsigned __int8)a2 .cold.2(uint64_t a1, unsigned __int8 a2)
{
  VCMediaRecorderUtil_DescriptionForMediaType(a2);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Invalid mediaType=%@ passed in! Only Audio / Video mode is supported!", v4, v5, v6, v7, v8);
}

void __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d current writer doesn't exist", v2, v3, v4, v5, v6);
}

- (void)historyBuffer:didDequeueSample:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sample is NULL", v2, v3, v4, v5, v6);
}

- (void)writeToFileWithTimestamp:transactionID:directoryURL:imageType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the data for timestamp %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]" >> 16, v4);
}

- (void)writeToFileWithTimestamp:transactionID:directoryURL:imageType:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Write to file timestamp %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]" >> 16, v4);
}

- (void)writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to write fileURL=%@");
}

- (void)writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d resizedFrame is NULL after resizing", v2, v3, v4, v5, v6);
}

- (void)setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d can not find such frame for timestamp %d in buffer", v2, *(const char **)v3, (unint64_t)"-[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:]" >> 16, v4);
}

- (void)setupResizingSessionsWithVisibleRect:cameraStatusBit:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d , VCMediaRecorderUtil_SetupBufferPool for resizing failed", v2, v3, v4, v5, v6);
}

+ (void)rewriteMovieMetadataWithURL:transactionID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigRewriteMetadata failed with err=%d", v2, *(const char **)v3, (unint64_t)"+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]" >> 16, v4);
}

- (void)handleCopyRequestWithTransactionID:sourceURL:errorCode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve valid mediaType from writerMode", v2, v3, v4, v5, v6);
}

- (void)handleCopyRequestWithTransactionID:(uint64_t)a1 sourceURL:(void *)a2 errorCode:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&unsigned char v3[14] = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 1030;
  WORD2(v4) = 2112;
  *(void *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, (uint64_t)a2, a3, " [%s] %s:%d copying file failed with error=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v4, *MEMORY[0x1E4F143B8]);
}

@end