@interface JFXVideoWriter
+ (id)JFX_animojiMetadataIdentifier;
+ (id)JFX_faceAnchorMetadataIdentifier;
+ (id)JFX_funcamCameraPositionMetadataIdentifier;
+ (id)JFX_funcamCaptureInterfaceOrientationMetadataIdentifier;
+ (id)META_ARMetadataTrackForAsset:(id)a3;
+ (id)META_JFXARMetadataIdentifier;
+ (id)META_metadataAssetTrackFromAsset:(id)a3 metadataIdentifier:(id)a4;
+ (void)META_metadataForVideo:(id)a3 completion:(id)a4;
- ($2825F4736939C4A6D3AD43837233062D)depthDimensions;
- (BOOL)JFX_setupAudioOutput:(id *)a3;
- (BOOL)JFX_setupAutoExposureMetadataOutput:(id *)a3;
- (BOOL)JFX_setupCompressedDepthOutputWithTransform:(CGAffineTransform *)a3 error:(id *)a4;
- (BOOL)JFX_setupDepthOutputWithTransform:(CGAffineTransform *)a3 error:(id *)a4;
- (BOOL)JFX_setupFaceMetadataOutput:(id *)a3;
- (BOOL)JFX_setupJFXARMetadataTrack:(id *)a3;
- (BOOL)JFX_setupMetadataWriterWithTransform:(CGAffineTransform *)a3 error:(id *)a4;
- (BOOL)JFX_setupVideoOutput:(CGAffineTransform *)a3 error:(id *)a4;
- (BOOL)JFX_setupVideoWriterWithTransform:(CGAffineTransform *)a3 error:(id *)a4;
- (BOOL)JFX_writeSampleBuffer:(opaqueCMSampleBuffer *)a3 assetWriterInput:(id)a4 sampleType:(int)a5 depthAdaptor:(id)a6;
- (BOOL)JFX_writerCanBegin:(id *)a3;
- (BOOL)startWriterWithVideoTransform:(CGAffineTransform *)a3 error:(id *)a4;
- (BOOL)storeDepthDataAsVideoTrack;
- (BOOL)storeFaceMetadata;
- (BOOL)trackOutOfOrderVideoBuffers;
- (BOOL)wroteSessionStartTime;
- (JFXDepthCompressor)depthCompressor;
- (JFXVideoWriter)initWithFolderURL:(id)a3 videoOutputSettings:(id)a4 audioOutputSettings:(id)a5 audioFormatHint:(opaqueCMFormatDescription *)a6;
- (JFXVideoWriterDelegate)delegate;
- (NSData)animojiMetadata;
- (NSDictionary)audioOutputSettings;
- (NSDictionary)depthBGRAPixelBufferAttributes;
- (NSDictionary)videoOutputSettings;
- (NSURL)folderURL;
- (NSURL)metadataURL;
- (NSURL)videoURL;
- (__CVBuffer)JFX_copyDepthBufferAsBGRA:(__CVBuffer *)a3;
- (id)JFX_fileLevelMetadata;
- (int)depthCodecType;
- (unint64_t)signPostID;
- (void)JFX_drainQueuedAudioBufferBeforeSessionStart_noLock;
- (void)JFX_queueAudioBufferBeforeSessionStart:(opaqueCMSampleBuffer *)a3;
- (void)JFX_removeFileAtURL:(id)a3;
- (void)JFX_startSessionAtSourceTime_noLock:(id *)a3;
- (void)JFX_writeAutoExposureMetadata:(opaqueCMSampleBuffer *)a3;
- (void)JFX_writeBuffer:(opaqueCMSampleBuffer *)a3 sampleType:(int)a4;
- (void)JFX_writeBuffer:(opaqueCMSampleBuffer *)a3 sampleType:(int)a4 arMetadata:(id)a5;
- (void)JFX_writeDepthBufferForAVDepthData:(id)a3 withTimingInfo:(id *)a4;
- (void)JFX_writeDepthData:(id)a3 timingInfo:(id *)a4;
- (void)JFX_writeFaceDetectMetadata:(id)a3 pts:(id *)a4;
- (void)JFX_writeFaceMetadata:(id)a3 withTimingInfo:(id *)a4;
- (void)JFX_writeJFXARMetadata:(id)a3 time:(id *)a4;
- (void)finishWritingWithCompletionHandler:(id)a3;
- (void)setAnimojiMetadata:(id)a3;
- (void)setAudioOutputSettings:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepthBGRAPixelBufferAttributes:(id)a3;
- (void)setDepthCodecType:(int)a3;
- (void)setDepthCompressor:(id)a3;
- (void)setDepthDimensions:(id)a3;
- (void)setFolderURL:(id)a3;
- (void)setSignPostID:(unint64_t)a3;
- (void)setStoreDepthDataAsVideoTrack:(BOOL)a3;
- (void)setStoreFaceMetadata:(BOOL)a3;
- (void)setTrackOutOfOrderVideoBuffers:(BOOL)a3;
- (void)setVideoOutputSettings:(id)a3;
- (void)startSessionAtSourceTime:(id *)a3;
- (void)writeAudioBuffer:(opaqueCMSampleBuffer *)a3;
- (void)writeCameraFrameSet:(id)a3;
@end

@implementation JFXVideoWriter

- (void)setStoreDepthDataAsVideoTrack:(BOOL)a3
{
  v10[3] = *MEMORY[0x263EF8340];
  if (a3 && [(JFXVideoWriter *)self depthDimensions])
  {
    if ((unint64_t)[(JFXVideoWriter *)self depthDimensions] >> 32)
    {
      uint64_t v4 = *MEMORY[0x263F04180];
      v10[0] = &unk_26E801A88;
      uint64_t v5 = *MEMORY[0x263F04240];
      v9[0] = v4;
      v9[1] = v5;
      v6 = objc_msgSend(NSNumber, "numberWithInt:", -[JFXVideoWriter depthDimensions](self, "depthDimensions"));
      v10[1] = v6;
      v9[2] = *MEMORY[0x263F04118];
      v7 = objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)-[JFXVideoWriter depthDimensions](self, "depthDimensions") >> 32);
      v10[2] = v7;
      v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
      [(JFXVideoWriter *)self setDepthBGRAPixelBufferAttributes:v8];

      BYTE1(self->_audioBufferQ) = 1;
    }
  }
}

- (NSURL)videoURL
{
  v2 = [(JFXVideoWriter *)self folderURL];
  v3 = [v2 URLByAppendingPathComponent:@"video.mov" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)metadataURL
{
  v2 = [(JFXVideoWriter *)self folderURL];
  v3 = [v2 URLByAppendingPathComponent:@"metadata.mov" isDirectory:0];

  return (NSURL *)v3;
}

- (JFXVideoWriter)initWithFolderURL:(id)a3 videoOutputSettings:(id)a4 audioOutputSettings:(id)a5 audioFormatHint:(opaqueCMFormatDescription *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  char v49 = 0;
  id v14 = objc_alloc_init(MEMORY[0x263F08850]);
  v15 = [v11 path];
  [v14 fileExistsAtPath:v15 isDirectory:&v49];

  v48.receiver = self;
  v48.super_class = (Class)JFXVideoWriter;
  v16 = [(JFXVideoWriter *)&v48 init];
  if (v16)
  {
    if (initWithFolderURL_videoOutputSettings_audioOutputSettings_audioFormatHint__onceToken != -1) {
      dispatch_once(&initWithFolderURL_videoOutputSettings_audioOutputSettings_audioFormatHint__onceToken, &__block_literal_global_43);
    }
    *((void *)v16 + 37) = JFXSignpostIDFromObject(v16);
    id v17 = v12;
    v18 = v17;
    if (v17)
    {
      v47 = a6;
      v19 = (void *)[v17 mutableCopy];
      v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263EFA338]];
      if ([v20 isEqual:*MEMORY[0x263EFA370]])
      {
        id v45 = v13;
        id v46 = v12;
        uint64_t v44 = *MEMORY[0x263EFA3A0];
        v21 = objc_msgSend(v19, "objectForKeyedSubscript:");
        v22 = (void *)[v21 mutableCopy];

        [v22 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263EFA310]];
        uint64_t v23 = *MEMORY[0x263EFA318];
        v24 = [v22 objectForKeyedSubscript:*MEMORY[0x263EFA318]];

        if (v24)
        {
          v25 = [v22 objectForKeyedSubscript:v23];
          [v25 doubleValue];
          double v27 = v26;

          v28 = [NSNumber numberWithDouble:v27 * 1.2];
          [v22 setObject:v28 forKeyedSubscript:v23];
        }
        v29 = [NSDictionary dictionaryWithDictionary:v22];
        [v19 setObject:v29 forKeyedSubscript:v44];

        uint64_t v30 = [NSDictionary dictionaryWithDictionary:v19];

        v18 = (void *)v30;
        id v13 = v45;
        id v12 = v46;
      }

      a6 = v47;
    }
    objc_storeStrong((id *)v16 + 32, a3);
    uint64_t v31 = [v18 copy];
    v32 = (void *)*((void *)v16 + 33);
    *((void *)v16 + 33) = v31;

    uint64_t v33 = [v13 copy];
    v34 = (void *)*((void *)v16 + 34);
    *((void *)v16 + 34) = v33;

    *((void *)v16 + 4) = a6;
    *((void *)v16 + 29) = 0x16800000280;
    *((_WORD *)v16 + 112) = 0;
    v16[120] = 0;
    uint64_t v35 = MEMORY[0x263F010E0];
    long long v36 = *MEMORY[0x263F010E0];
    *(_OWORD *)(v16 + 124) = *MEMORY[0x263F010E0];
    uint64_t v37 = *(void *)(v35 + 16);
    *(void *)(v16 + 140) = v37;
    *(_OWORD *)(v16 + 148) = v36;
    *(void *)(v16 + 164) = v37;
    *(_OWORD *)(v16 + 172) = v36;
    *(void *)(v16 + 188) = v37;
    atomic_store(0, (unsigned __int8 *)v16 + 196);
    atomic_store(0, (unsigned __int8 *)v16 + 197);
    id v38 = objc_alloc_init(MEMORY[0x263F08958]);
    v39 = (void *)*((void *)v16 + 25);
    *((void *)v16 + 25) = v38;

    v16[121] = 0;
    v16[226] = 0;
    id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
    v41 = (void *)*((void *)v16 + 27);
    *((void *)v16 + 27) = v40;

    v42 = [MEMORY[0x263EFFA40] standardUserDefaults];
    s_enableAutoExposureFilter = [v42 BOOLForKey:@"enableAutoExposureFilter"];

    *((_DWORD *)v16 + 57) = 0;
  }

  return (JFXVideoWriter *)v16;
}

void __92__JFXVideoWriter_initWithFolderURL_videoOutputSettings_audioOutputSettings_audioFormatHint___block_invoke()
{
  v0 = (void *)s_streamNames;
  s_streamNames = (uint64_t)&unk_26E801FC8;
}

- (BOOL)startWriterWithVideoTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  kdebug_trace();
  atomic_store(1u, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
  if ([(JFXVideoWriter *)self JFX_writerCanBegin:a4])
  {
    long long v7 = *(_OWORD *)&a3->c;
    long long v18 = *(_OWORD *)&a3->a;
    long long v19 = v7;
    long long v20 = *(_OWORD *)&a3->tx;
    BOOL v8 = [(JFXVideoWriter *)self JFX_setupVideoWriterWithTransform:&v18 error:a4];
    if (v8)
    {
      long long v9 = *(_OWORD *)&a3->c;
      long long v18 = *(_OWORD *)&a3->a;
      long long v19 = v9;
      long long v20 = *(_OWORD *)&a3->tx;
      BOOL v8 = [(JFXVideoWriter *)self JFX_setupMetadataWriterWithTransform:&v18 error:a4];
      if (v8)
      {
        v10 = [(JFXVideoWriter *)self videoURL];
        v21[0] = v10;
        id v11 = [(JFXVideoWriter *)self metadataURL];
        v21[1] = v11;
        id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __54__JFXVideoWriter_startWriterWithVideoTransform_error___block_invoke;
        v17[3] = &unk_264C0C1D8;
        v17[4] = self;
        [v12 enumerateObjectsUsingBlock:v17];

        self->_wroteSessionStartTime = 0;
        atomic_store(0, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 5);
        if ([(AVAssetWriter *)self->_videoAssetWriter startWriting]
          && [(AVAssetWriter *)self->_metadataAssetWriter startWriting])
        {
          finishingLock = self->_finishingLock;
          self->_finishingLock = 0;

          if ([(JFXVideoWriter *)self trackOutOfOrderVideoBuffers])
          {
            id v14 = objc_alloc_init(WriterReorderQ);
            v15 = self->_finishingLock;
            self->_finishingLock = (NSLock *)v14;
          }
          atomic_store(0, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
          kdebug_trace();
          LOBYTE(v8) = 1;
        }
        else
        {
          SetError(a4, @"com.apple.Clips.JFXVideoWriter", 4, @"Could not start writing");
          LOBYTE(v8) = 0;
        }
      }
    }
  }
  else
  {
    kdebug_trace();
    LOBYTE(v8) = 0;
    atomic_store(0, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
  }
  return v8;
}

uint64_t __54__JFXVideoWriter_startWriterWithVideoTransform_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_removeFileAtURL:", a2);
}

- (void)startSessionAtSourceTime:(id *)a3
{
  [*(id *)&self->_preparingWriter lock];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(JFXVideoWriter *)self JFX_startSessionAtSourceTime_noLock:&v5];
  [*(id *)&self->_preparingWriter unlock];
}

- (void)writeCameraFrameSet:(id)a3
{
  id v4 = a3;
  finishingLock = self->_finishingLock;
  v6 = v4;
  if (finishingLock)
  {
    v6 = [(NSLock *)finishingLock getReorderedFrameSet:v4];
  }
  if (v6)
  {
    long long v7 = [v6 colorSampleBuffer];
    BOOL v8 = (opaqueCMSampleBuffer *)[v7 sampleBufferRef];

    long long v9 = [v6 metadataObjectForKey:@"PVFrameSetMetadataARMetadataKey"];
    [(JFXVideoWriter *)self JFX_writeBuffer:v8 sampleType:0 arMetadata:v9];
    memset(&timingInfoOut, 0, sizeof(timingInfoOut));
    if (CMSampleBufferGetSampleTimingInfo(v8, 0, &timingInfoOut))
    {
      v10 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter writeCameraFrameSet:]();
      }
    }
    else
    {
      if ([(JFXVideoWriter *)self storeDepthDataAsVideoTrack])
      {
        id v11 = [v9 arFrame];
        id v12 = [v11 capturedDepthData];
        CMSampleTimingInfo v13 = timingInfoOut;
        [(JFXVideoWriter *)self JFX_writeDepthBufferForAVDepthData:v12 withTimingInfo:&v13];
      }
      if (![(JFXVideoWriter *)self storeFaceMetadata]) {
        goto LABEL_12;
      }
      v10 = [v6 metadataDict];
      CMSampleTimingInfo v13 = timingInfoOut;
      [(JFXVideoWriter *)self JFX_writeFaceMetadata:v10 withTimingInfo:&v13];
    }

LABEL_12:
  }
}

- (void)JFX_writeDepthData:(id)a3 timingInfo:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var2.var0;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  v6[3] = v4;
  int64_t var3 = a4->var2.var3;
  long long v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  [(JFXVideoWriter *)self JFX_writeDepthBufferForAVDepthData:a3 withTimingInfo:v6];
}

- (void)writeAudioBuffer:(opaqueCMSampleBuffer *)a3
{
}

- (void)finishWritingWithCompletionHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v4 = a3;
  finishingLock = self->_finishingLock;
  if (finishingLock)
  {
    v6 = [(NSLock *)finishingLock clearQueuedFrameSet];
    if (v6) {
      [(JFXVideoWriter *)self writeCameraFrameSet:v6];
    }
  }
  kdebug_trace();
  [*(id *)&self->_preparingWriter lock];
  atomic_store(1u, (unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 5);
  BOOL wroteSessionStartTime = self->_wroteSessionStartTime;
  BOOL v8 = JFXLog_DebugWriter();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (wroteSessionStartTime)
  {
    if (v9)
    {
      CMTime lhs = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
      long long v18 = JFXNSStringForCMTime(&lhs);
      CMTime lhs = *(CMTime *)((char *)&self->_sessionStartTime.epoch + 4);
      long long v19 = JFXNSStringForCMTime(&lhs);
      CMTime lhs = *(CMTime *)((char *)&self->_sessionStartTime.epoch + 4);
      CMTime rhs = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
      CMTimeSubtract(&v29, &lhs, &rhs);
      long long v20 = JFXNSStringForCMTime(&v29);
      LODWORD(lhs.value) = 138412802;
      *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v18;
      LOWORD(lhs.flags) = 2112;
      *(void *)((char *)&lhs.flags + 2) = v19;
      HIWORD(lhs.epoch) = 2112;
      v32 = v20;
      _os_log_debug_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEBUG, "Finishing writing with session start time: %@\t\tend time: %@\t duration: %@", (uint8_t *)&lhs, 0x20u);
    }
    dispatch_group_t v10 = dispatch_group_create();
    metadataAssetWriter = self->_metadataAssetWriter;
    v30[0] = self->_videoAssetWriter;
    v30[1] = metadataAssetWriter;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke;
    v25[3] = &unk_264C0C200;
    dispatch_group_t v26 = v10;
    double v27 = self;
    CMSampleTimingInfo v13 = v10;
    [v12 enumerateObjectsUsingBlock:v25];

    id v14 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3;
    block[3] = &unk_264C0A3C8;
    block[4] = self;
    v24 = v4;
    v15 = v4;
    dispatch_group_notify(v13, v14, block);
  }
  else
  {
    if (v9) {
      -[JFXVideoWriter finishWritingWithCompletionHandler:]();
    }

    v16 = dispatch_get_global_queue(21, 0);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_61;
    void v21[3] = &unk_264C0A3F0;
    v22 = v4;
    id v17 = v4;
    dispatch_async(v16, v21);

    CMSampleTimingInfo v13 = v22;
  }

  [*(id *)&self->_preparingWriter unlock];
  kdebug_trace();
}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = 172;
  if (!a3) {
    uint64_t v7 = 148;
  }
  CMTime v14 = *(CMTime *)(v6 + v7);
  CMTime time1 = v14;
  CMTime time2 = *(CMTime *)(v6 + 124);
  int32_t v8 = CMTimeCompare(&time1, &time2);
  CMTime time1 = v14;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  int32_t v9 = CMTimeCompare(&time1, &time2);
  if (v8 >= 1)
  {
    CMTime time1 = v14;
    [v5 endSessionAtSourceTime:&time1];
  }
  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_264C09FA8;
    id v11 = *(id *)(a1 + 32);
    [v5 finishWritingWithCompletionHandler:v10];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v2 = JFXLog_DebugWriter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3_cold_1();
  }

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) status];
  long long v4 = *(void **)(a1 + 32);
  id v5 = [v4 videoURL];
  if (v3 != 2)
  {
    objc_msgSend(v4, "JFX_removeFileAtURL:", v5);

    id v5 = 0;
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) status];
  uint64_t v7 = *(void **)(a1 + 32);
  int32_t v8 = [v7 metadataURL];
  if (v6 != 2)
  {
    objc_msgSend(v7, "JFX_removeFileAtURL:", v8);

    int32_t v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)JFX_setupVideoWriterWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  id v7 = objc_alloc(MEMORY[0x263EFA518]);
  int32_t v8 = [(JFXVideoWriter *)self videoURL];
  uint64_t v9 = *MEMORY[0x263EF9898];
  id v20 = 0;
  dispatch_group_t v10 = (AVAssetWriter *)[v7 initWithURL:v8 fileType:v9 error:&v20];
  id v11 = v20;
  videoAssetWriter = self->_videoAssetWriter;
  self->_videoAssetWriter = v10;

  if (!v11)
  {
    CMTimeMakeWithSeconds(&v19, 2.0, 600);
    CMTime v14 = self->_videoAssetWriter;
    CMTime v18 = v19;
    [(AVAssetWriter *)v14 setMovieFragmentInterval:&v18];
    long long v15 = *(_OWORD *)&a3->c;
    v17[0] = *(_OWORD *)&a3->a;
    v17[1] = v15;
    v17[2] = *(_OWORD *)&a3->tx;
    if ([(JFXVideoWriter *)self JFX_setupVideoOutput:v17 error:a4])
    {
      BOOL v13 = [(JFXVideoWriter *)self JFX_setupAudioOutput:a4];
      goto LABEL_7;
    }
LABEL_6:
    BOOL v13 = 0;
    goto LABEL_7;
  }
  if (!a4) {
    goto LABEL_6;
  }
  BOOL v13 = 0;
  *a4 = v11;
LABEL_7:

  return v13;
}

- (BOOL)JFX_setupMetadataWriterWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  id v7 = objc_alloc(MEMORY[0x263EFA518]);
  int32_t v8 = [(JFXVideoWriter *)self metadataURL];
  uint64_t v9 = *MEMORY[0x263EF9898];
  id v30 = 0;
  dispatch_group_t v10 = (AVAssetWriter *)[v7 initWithURL:v8 fileType:v9 error:&v30];
  id v11 = v30;
  metadataAssetWriter = self->_metadataAssetWriter;
  self->_metadataAssetWriter = v10;

  if (!v11)
  {
    CMTimeMakeWithSeconds(&v29, 2.0, 600);
    CMTime v14 = self->_metadataAssetWriter;
    CMTime v28 = v29;
    [(AVAssetWriter *)v14 setMovieFragmentInterval:&v28];
    long long v15 = [(JFXVideoWriter *)self JFX_fileLevelMetadata];
    [(AVAssetWriter *)self->_metadataAssetWriter setMetadata:v15];
    if ([(JFXVideoWriter *)self storeDepthDataAsVideoTrack])
    {
      if (![(JFXVideoWriter *)self depthCodecType])
      {
        v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
        unsigned int v17 = [v16 integerForKey:@"JFXDepthCodecType"];

        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 1212493921;
        }
        [(JFXVideoWriter *)self setDepthCodecType:v18];
      }
      if ([(JFXVideoWriter *)self depthCodecType] == 1111970369)
      {
        long long v19 = *(_OWORD *)&a3->c;
        long long v25 = *(_OWORD *)&a3->a;
        long long v26 = v19;
        long long v27 = *(_OWORD *)&a3->tx;
        if (![(JFXVideoWriter *)self JFX_setupDepthOutputWithTransform:&v25 error:a4])
        {
          id v20 = JFXLog_DebugWriter();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[JFXVideoWriter JFX_setupMetadataWriterWithTransform:error:]();
          }
          goto LABEL_25;
        }
      }
      else
      {
        long long v21 = *(_OWORD *)&a3->c;
        long long v25 = *(_OWORD *)&a3->a;
        long long v26 = v21;
        long long v27 = *(_OWORD *)&a3->tx;
        if (![(JFXVideoWriter *)self JFX_setupCompressedDepthOutputWithTransform:&v25 error:a4])
        {
          id v20 = JFXLog_DebugWriter();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[JFXVideoWriter JFX_setupMetadataWriterWithTransform:error:]();
          }
          goto LABEL_25;
        }
      }
    }
    if (![(JFXVideoWriter *)self storeFaceMetadata]
      || [(JFXVideoWriter *)self JFX_setupFaceMetadataOutput:a4])
    {
      v22 = +[JFXVideoCameraController sharedInstance];
      uint64_t v23 = [v22 cameraPosition];

      if (v23 != 2 || [(JFXVideoWriter *)self JFX_setupJFXARMetadataTrack:a4])
      {
        BOOL v13 = [(JFXVideoWriter *)self JFX_setupAutoExposureMetadataOutput:a4];
LABEL_27:

        goto LABEL_28;
      }
LABEL_26:
      BOOL v13 = 0;
      goto LABEL_27;
    }
    id v20 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_setupMetadataWriterWithTransform:error:]();
    }
LABEL_25:

    goto LABEL_26;
  }
  BOOL v13 = 0;
  if (a4) {
    *a4 = v11;
  }
LABEL_28:

  return v13;
}

- (BOOL)JFX_setupCompressedDepthOutputWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  id v7 = [[JFXDepthCompressor alloc] initWithDepthCodecType:[(JFXVideoWriter *)self depthCodecType]];
  [(JFXVideoWriter *)self setDepthCompressor:v7];

  int32_t v8 = [(JFXVideoWriter *)self depthCompressor];
  uint64_t v9 = objc_msgSend(v8, "depthOutputSettingsForDepthDimensions:", -[JFXVideoWriter depthDimensions](self, "depthDimensions"));

  dispatch_group_t v10 = [(JFXVideoWriter *)self depthCompressor];
  id v11 = (const void *)objc_msgSend(v10, "depthFormatDescriptionForDepthDimensions:", -[JFXVideoWriter depthDimensions](self, "depthDimensions"));

  id v12 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D48] outputSettings:v9 sourceFormatHint:v11];
  compressedDepthAssetWriterInput = self->_compressedDepthAssetWriterInput;
  self->_compressedDepthAssetWriterInput = v12;

  if (v11) {
    CFRelease(v11);
  }
  [(AVAssetWriterInput *)self->_compressedDepthAssetWriterInput setExpectsMediaDataInRealTime:1];
  long long v14 = *(_OWORD *)&a3->c;
  v19[0] = *(_OWORD *)&a3->a;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&a3->tx;
  [(AVAssetWriterInput *)self->_compressedDepthAssetWriterInput setTransform:v19];
  [(AVAssetWriterInput *)self->_compressedDepthAssetWriterInput setMediaTimeScale:600];
  if ([(AVAssetWriter *)self->_metadataAssetWriter canAddInput:self->_compressedDepthAssetWriterInput])
  {
    [(AVAssetWriter *)self->_metadataAssetWriter addInput:self->_compressedDepthAssetWriterInput];
    long long v15 = [(JFXVideoWriter *)self depthCompressor];
    BOOL v16 = v15 != 0;
  }
  else
  {
    unsigned int v17 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_setupCompressedDepthOutputWithTransform:error:]();
    }

    SetError(a4, @"com.apple.Clips.JFXVideoWriter", 4, @"Could not add compressed depth writerInput to the writer");
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)JFX_setupDepthOutputWithTransform:(CGAffineTransform *)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D48] outputSettings:0];
  depthAssetWriterInput = self->_depthAssetWriterInput;
  self->_depthAssetWriterInput = v7;

  [(AVAssetWriterInput *)self->_depthAssetWriterInput setExpectsMediaDataInRealTime:1];
  long long v9 = *(_OWORD *)&a3->c;
  v17[0] = *(_OWORD *)&a3->a;
  v17[1] = v9;
  v17[2] = *(_OWORD *)&a3->tx;
  [(AVAssetWriterInput *)self->_depthAssetWriterInput setTransform:v17];
  [(AVAssetWriterInput *)self->_depthAssetWriterInput setMediaTimeScale:600];
  dispatch_group_t v10 = (void *)MEMORY[0x263EFA530];
  id v11 = self->_depthAssetWriterInput;
  id v12 = [(JFXVideoWriter *)self depthBGRAPixelBufferAttributes];
  BOOL v13 = [v10 assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v11 sourcePixelBufferAttributes:v12];
  depthAdaptor = self->_depthAdaptor;
  self->_depthAdaptor = v13;

  if (self->_depthAdaptor)
  {
    if ([(AVAssetWriter *)self->_metadataAssetWriter canAddInput:self->_depthAssetWriterInput])
    {
      [(AVAssetWriter *)self->_metadataAssetWriter addInput:self->_depthAssetWriterInput];
      return 1;
    }
    BOOL v16 = @"Could not add depth writerInput to the writer";
  }
  else
  {
    BOOL v16 = @"Could not create depth adaptor";
  }
  SetError(a4, @"com.apple.Clips.JFXVideoWriter", 5, v16);
  return 0;
}

- (BOOL)JFX_setupVideoOutput:(CGAffineTransform *)a3 error:(id *)a4
{
  id v7 = [(JFXVideoWriter *)self videoOutputSettings];

  if (!v7) {
    return 1;
  }
  videoAssetWriter = self->_videoAssetWriter;
  long long v9 = [(JFXVideoWriter *)self videoOutputSettings];
  uint64_t v10 = *MEMORY[0x263EF9D48];
  LOBYTE(videoAssetWriter) = [(AVAssetWriter *)videoAssetWriter canApplyOutputSettings:v9 forMediaType:*MEMORY[0x263EF9D48]];

  if (videoAssetWriter)
  {
    id v11 = (void *)MEMORY[0x263EFA520];
    id v12 = [(JFXVideoWriter *)self videoOutputSettings];
    BOOL v13 = [v11 assetWriterInputWithMediaType:v10 outputSettings:v12];
    videoAssetWriterInput = self->_videoAssetWriterInput;
    self->_videoAssetWriterInput = v13;

    [(AVAssetWriterInput *)self->_videoAssetWriterInput setExpectsMediaDataInRealTime:1];
    long long v15 = *(_OWORD *)&a3->c;
    v18[0] = *(_OWORD *)&a3->a;
    v18[1] = v15;
    v18[2] = *(_OWORD *)&a3->tx;
    [(AVAssetWriterInput *)self->_videoAssetWriterInput setTransform:v18];
    if ([(AVAssetWriter *)self->_videoAssetWriter canAddInput:self->_videoAssetWriterInput])
    {
      [(AVAssetWriter *)self->_videoAssetWriter addInput:self->_videoAssetWriterInput];
      return 1;
    }
    unsigned int v17 = @"Could not add video writerInput to the writer";
  }
  else
  {
    unsigned int v17 = @"Cannot apply videoOutputSettings to writer";
  }
  SetError(a4, @"com.apple.Clips.JFXVideoWriter", 5, v17);
  return 0;
}

- (BOOL)JFX_setupAutoExposureMetadataOutput:(id *)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  if (s_enableAutoExposureFilter)
  {
    v27[0] = *MEMORY[0x263F00FA8];
    id v5 = BrightnessIdentifier();
    v27[1] = *MEMORY[0x263F00F98];
    v28[0] = v5;
    v28[1] = *MEMORY[0x263F00F20];
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v29[0] = v6;
    CFArrayRef v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];

    CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
    OSStatus v8 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x6D656278u, v7, &formatDescriptionOut);
    if (v8 > -12711)
    {
      if (v8 == -12710)
      {
        uint64_t v24 = 0;
        long long v9 = (void *)*MEMORY[0x263EF98B0];
        uint64_t v10 = @"AVF would return AVErrorClientProgrammingError = -11999 with exception dict, but this should never happen";
        id v11 = (id *)&v24;
        id v12 = &v24;
        goto LABEL_12;
      }
      if (!v8) {
        goto LABEL_16;
      }
    }
    else
    {
      if (v8 == -12718)
      {
        uint64_t v23 = 0;
        long long v9 = (void *)*MEMORY[0x263EF98B0];
        uint64_t v10 = @"AVF would return AVErrorClientProgrammingError = -11999 with exception dict, but this should never happen";
        id v11 = (id *)&v23;
        id v12 = &v23;
        goto LABEL_12;
      }
      if (v8 == -12711)
      {
        uint64_t v25 = 0;
        long long v9 = (void *)*MEMORY[0x263EF98B0];
        uint64_t v10 = &stru_26E7CDB50;
        id v11 = (id *)&v25;
        id v12 = &v25;
        uint64_t v13 = -11801;
        goto LABEL_13;
      }
    }
    uint64_t v22 = 0;
    long long v9 = (void *)*MEMORY[0x263EF98B0];
    uint64_t v10 = &stru_26E7CDB50;
    id v11 = (id *)&v22;
    id v12 = &v22;
LABEL_12:
    uint64_t v13 = -11800;
LABEL_13:
    SetError(v12, v9, v13, v10);
    id v15 = *v11;
    if (v15)
    {
      id v16 = v15;
      if (a3)
      {
        id v16 = v15;
        BOOL v14 = 0;
        *a3 = v16;
LABEL_20:

        return v14;
      }
      goto LABEL_19;
    }
LABEL_16:
    unsigned int v17 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D08] outputSettings:0 sourceFormatHint:formatDescriptionOut];
    exposureMetadataAssetWriterInput = self->_exposureMetadataAssetWriterInput;
    self->_exposureMetadataAssetWriterInput = v17;

    [(AVAssetWriterInput *)self->_exposureMetadataAssetWriterInput setMediaTimeScale:600];
    [(AVAssetWriterInput *)self->_exposureMetadataAssetWriterInput setExpectsMediaDataInRealTime:1];
    long long v19 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:self->_exposureMetadataAssetWriterInput];
    exposureMetadataAdaptor = self->_exposureMetadataAdaptor;
    self->_exposureMetadataAdaptor = v19;

    if ([(AVAssetWriter *)self->_metadataAssetWriter canAddInput:self->_exposureMetadataAssetWriterInput])
    {
      [(AVAssetWriter *)self->_metadataAssetWriter addInput:self->_exposureMetadataAssetWriterInput];
      id v16 = 0;
      BOOL v14 = 1;
      goto LABEL_20;
    }
    SetError(a3, @"com.apple.Clips.JFXVideoWriter", 5, @"Could not add exposure metadata input to writer");
    id v16 = 0;
LABEL_19:
    BOOL v14 = 0;
    goto LABEL_20;
  }
  return 1;
}

- (BOOL)JFX_setupFaceMetadataOutput:(id *)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFA790] metadataItem];
  [v5 setIdentifier:*MEMORY[0x263EF9E40]];
  [v5 setDataType:@"com.apple.quicktime.detected-face"];
  id v6 = objc_alloc(MEMORY[0x263EFA740]);
  [v5 setValue:v6];

  id v7 = objc_alloc(MEMORY[0x263EFA8C0]);
  v20[0] = v5;
  OSStatus v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  CMTimeMake(&duration, 20, 600);
  CMTime v17 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTimeRangeMake(&v19, &v17, &duration);
  long long v9 = (void *)[v7 initWithItems:v8 timeRange:&v19];

  uint64_t v10 = (const void *)[v9 copyFormatDescription];
  id v11 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D08] outputSettings:0 sourceFormatHint:v10];
  faceMetadataAssetWriterInput = self->_faceMetadataAssetWriterInput;
  self->_faceMetadataAssetWriterInput = v11;

  [(AVAssetWriterInput *)self->_faceMetadataAssetWriterInput setMediaTimeScale:600];
  [(AVAssetWriterInput *)self->_faceMetadataAssetWriterInput setExpectsMediaDataInRealTime:1];
  uint64_t v13 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:self->_faceMetadataAssetWriterInput];
  faceMetadataAdaptor = self->_faceMetadataAdaptor;
  self->_faceMetadataAdaptor = v13;

  BOOL v15 = [(AVAssetWriter *)self->_metadataAssetWriter canAddInput:self->_faceMetadataAssetWriterInput];
  if (v15)
  {
    [(AVAssetWriter *)self->_metadataAssetWriter addInput:self->_faceMetadataAssetWriterInput];
    if (!v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  SetError(a3, @"com.apple.Clips.JFXVideoWriter", 5, @"Could not add face metadata input to writer");
  if (v10) {
LABEL_5:
  }
    CFRelease(v10);
LABEL_6:

  return v15;
}

- (BOOL)JFX_setupAudioOutput:(id *)a3
{
  id v5 = [(JFXVideoWriter *)self audioOutputSettings];

  if (!v5) {
    return 1;
  }
  videoAssetWriter = self->_videoAssetWriter;
  id v7 = [(JFXVideoWriter *)self audioOutputSettings];
  uint64_t v8 = *MEMORY[0x263EF9CE8];
  LOBYTE(videoAssetWriter) = [(AVAssetWriter *)videoAssetWriter canApplyOutputSettings:v7 forMediaType:*MEMORY[0x263EF9CE8]];

  if (videoAssetWriter)
  {
    audioFormatHint = self->_audioFormatHint;
    uint64_t v10 = (void *)MEMORY[0x263EFA520];
    id v11 = [(JFXVideoWriter *)self audioOutputSettings];
    if (audioFormatHint) {
      [v10 assetWriterInputWithMediaType:v8 outputSettings:v11 sourceFormatHint:self->_audioFormatHint];
    }
    else {
    id v12 = [v10 assetWriterInputWithMediaType:v8 outputSettings:v11];
    }
    audioAssetWriterInput = self->_audioAssetWriterInput;
    self->_audioAssetWriterInput = v12;

    [(AVAssetWriterInput *)self->_audioAssetWriterInput setExpectsMediaDataInRealTime:1];
    if ([(AVAssetWriter *)self->_videoAssetWriter canAddInput:self->_audioAssetWriterInput])
    {
      [(AVAssetWriter *)self->_videoAssetWriter addInput:self->_audioAssetWriterInput];
      return 1;
    }
    uint64_t v13 = @"Count not add audio writer input to writer";
  }
  else
  {
    uint64_t v13 = @"Cannot apply audioOutputSettings to writer";
  }
  SetError(a3, @"com.apple.Clips.JFXVideoWriter", 5, v13);
  return 0;
}

- (BOOL)JFX_setupJFXARMetadataTrack:(id *)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend((id)objc_opt_class(), "META_JFXARMetadataIdentifier");
  id v6 = [MEMORY[0x263EFA790] metadataItem];
  [v6 setIdentifier:v5];
  [v6 setDataType:*MEMORY[0x263F00F48]];
  id v7 = [MEMORY[0x263EFF8F8] data];
  [v6 setValue:v7];

  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&v19.start.value = *MEMORY[0x263F010E0];
  v19.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  CMTimeRangeMake(&v21, &v19.start, &duration);
  id v8 = objc_alloc(MEMORY[0x263EFA8C0]);
  v22[0] = v6;
  long long v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  CMTimeRange v19 = v21;
  uint64_t v10 = (void *)[v8 initWithItems:v9 timeRange:&v19];

  uint64_t v11 = [v10 copyFormatDescription];
  if (v11)
  {
    id v12 = (const void *)v11;
    uint64_t v13 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D08] outputSettings:0 sourceFormatHint:v11];
    JFXARMetadataAssetWriterInput = self->_JFXARMetadataAssetWriterInput;
    self->_JFXARMetadataAssetWriterInput = v13;

    [(AVAssetWriterInput *)self->_JFXARMetadataAssetWriterInput setExpectsMediaDataInRealTime:1];
    BOOL v15 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:self->_JFXARMetadataAssetWriterInput];
    JFXARMetadataMetadataAdaptor = self->_JFXARMetadataMetadataAdaptor;
    self->_JFXARMetadataMetadataAdaptor = v15;

    BOOL v17 = [(AVAssetWriter *)self->_metadataAssetWriter canAddInput:self->_JFXARMetadataAssetWriterInput];
    if (v17) {
      [(AVAssetWriter *)self->_metadataAssetWriter addInput:self->_JFXARMetadataAssetWriterInput];
    }
    else {
      SetError(a3, @"com.apple.Clips.JFXVideoWriter", 5, @"Could not add face metadata input to writer");
    }
    CFRelease(v12);
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (void)JFX_startSessionAtSourceTime_noLock:(id *)a3
{
  if (!self->_wroteSessionStartTime)
  {
    uint64_t v5 = [(JFXVideoWriter *)self audioOutputSettings];
    if (v5 && (v6 = (void *)v5, uint64_t v7 = [(WriterReorderQ *)self->_reorderQ count], v6, !v7))
    {
      id v12 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_startSessionAtSourceTime_noLock:]();
      }
    }
    else
    {
      videoAssetWriter = self->_videoAssetWriter;
      long long v13 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      [(AVAssetWriter *)videoAssetWriter startSessionAtSourceTime:&v13];
      metadataAssetWriter = self->_metadataAssetWriter;
      long long v13 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      [(AVAssetWriter *)metadataAssetWriter startSessionAtSourceTime:&v13];
      self->_BOOL wroteSessionStartTime = 1;
      long long v10 = *(_OWORD *)&a3->var0;
      *(void *)&self->_sessionStartTime.flags = a3->var3;
      *(_OWORD *)(&self->_wroteFirstAudioSample + 3) = v10;
      uint64_t v11 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_startSessionAtSourceTime_noLock:]((uint64_t)a3);
      }

      [(JFXVideoWriter *)self JFX_drainQueuedAudioBufferBeforeSessionStart_noLock];
    }
  }
}

- (void)JFX_writeBuffer:(opaqueCMSampleBuffer *)a3 sampleType:(int)a4
{
}

- (void)JFX_writeBuffer:(opaqueCMSampleBuffer *)a3 sampleType:(int)a4 arMetadata:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a5;
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 4);
  if (v9)
  {
    uint64_t v11 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.8();
    }

    long long v10 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.7();
    }
    goto LABEL_9;
  }
  memset(&v44, 0, sizeof(v44));
  CMSampleBufferGetPresentationTimeStamp(&v44, a3);
  if (v44.flags)
  {
    kdebug_trace();
    [*(id *)&self->_preparingWriter lock];
    unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_sessionMetadataEndTime.epoch + 5);
    if ((v12 & 1) != 0
      || [(AVAssetWriter *)self->_videoAssetWriter status] != AVAssetWriterStatusWriting
      || [(AVAssetWriter *)self->_metadataAssetWriter status] != AVAssetWriterStatusWriting)
    {
      id v16 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v21 = v12 & 1;
        uint64_t v22 = [(id)s_streamNames objectAtIndexedSubscript:v5];
        uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[AVAssetWriter status](self->_videoAssetWriter, "status"));
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[AVAssetWriter status](self->_metadataAssetWriter, "status"));
        *(CMTime *)CMTime time1 = v44;
        uint64_t v25 = JFXNSStringForCMTime((CMTime *)time1);
        *(_DWORD *)CMTime time1 = 138413314;
        *(void *)&time1[4] = v22;
        *(_WORD *)&time1[12] = 1024;
        *(_DWORD *)&time1[14] = v21;
        *(_WORD *)&time1[18] = 2112;
        *(void *)&time1[20] = v23;
        *(_WORD *)&time1[28] = 2112;
        *(void *)&time1[30] = v24;
        __int16 v46 = 2112;
        v47 = v25;
        _os_log_debug_impl(&dword_234C41000, v16, OS_LOG_TYPE_DEBUG, "No Write %@. finishing (%d), video status: %@, metadata status: %@ (%@)", time1, 0x30u);
      }
      BOOL v17 = [(AVAssetWriter *)self->_videoAssetWriter error];

      if (v17)
      {
        uint64_t v18 = JFXLog_DebugWriter();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.6((id *)&self->_videoAssetWriter);
        }
      }
      CMTimeRange v19 = [(AVAssetWriter *)self->_metadataAssetWriter error];

      if (!v19) {
        goto LABEL_47;
      }
      JFXLog_DebugWriter();
      id v20 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.5((id *)&self->_metadataAssetWriter);
      }
      goto LABEL_32;
    }
    long long v13 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = [(id)s_streamNames objectAtIndexedSubscript:v5];
      *(CMTime *)CMTime time1 = v44;
      long long v36 = JFXNSStringForCMTime((CMTime *)time1);
      *(_DWORD *)CMTime time1 = 138412546;
      *(void *)&time1[4] = v35;
      *(_WORD *)&time1[12] = 2112;
      *(void *)&time1[14] = v36;
      _os_log_debug_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEBUG, "Write %@ %@", time1, 0x16u);
    }
    if (self->_wroteSessionStartTime || v5 > 3 || v5 == 1)
    {
      BOOL v14 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = [(id)s_streamNames objectAtIndexedSubscript:v5];
        *(CMTime *)CMTime time1 = v44;
        v42 = JFXNSStringForCMTime((CMTime *)time1);
        *(_OWORD *)CMTime time1 = *(_OWORD *)(&self->_wroteFirstAudioSample + 3);
        *(void *)&time1[16] = *(void *)&self->_sessionStartTime.flags;
        uint64_t v38 = JFXNSStringForCMTime((CMTime *)time1);
        *(_DWORD *)CMTime time1 = 138412802;
        *(void *)&time1[4] = v37;
        *(_WORD *)&time1[12] = 2112;
        *(void *)&time1[14] = v42;
        *(_WORD *)&time1[22] = 2112;
        *(void *)&time1[24] = v38;
        v39 = (void *)v38;
        _os_log_debug_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEBUG, "Skipped write for %@ at time (%@) startTime (%@)", time1, 0x20u);
      }
      if (v5 == 1)
      {
        *(_OWORD *)CMTime time1 = *MEMORY[0x263F010E0];
        *(void *)&time1[16] = *(void *)(MEMORY[0x263F010E0] + 16);
        CMTime time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
        if (!CMTimeCompare((CMTime *)time1, &time2))
        {
          BOOL v15 = JFXLog_DebugWriter();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:]();
          }

          [(JFXVideoWriter *)self JFX_queueAudioBufferBeforeSessionStart:a3];
        }
      }
    }
    else
    {
      long long v26 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:].cold.4((uint64_t)&v44);
      }

      *(CMTime *)CMTime time1 = v44;
      [(JFXVideoWriter *)self JFX_startSessionAtSourceTime_noLock:time1];
      if (!self->_wroteSessionStartTime) {
        goto LABEL_47;
      }
      long long v27 = [(JFXVideoWriter *)self delegate];

      if (v27)
      {
        CMTime v28 = [(JFXVideoWriter *)self delegate];
        [v28 videoWriterWroteFirstFrame:self];
      }
    }
    if (!self->_wroteSessionStartTime
      || (*(CMTime *)CMTime time1 = v44,
          CMTime time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3),
          CMTimeCompare((CMTime *)time1, &time2) < 0))
    {
LABEL_47:
      [*(id *)&self->_preparingWriter unlock];
      kdebug_trace();
      goto LABEL_48;
    }
    if (v5)
    {
      if (v5 == 2)
      {
        id v20 = self->_depthAssetWriterInput;
        if (![(JFXVideoWriter *)self JFX_writeSampleBuffer:a3 assetWriterInput:v20 sampleType:2 depthAdaptor:self->_depthAdaptor])goto LABEL_32; {
        goto LABEL_66;
        }
      }
      uint64_t v29 = 56;
      if (v5 != 3) {
        uint64_t v29 = 24;
      }
    }
    else
    {
      uint64_t v29 = 16;
    }
    id v20 = (AVAssetWriterInput *)*(id *)((char *)&self->super.isa + v29);
    BOOL v30 = [(JFXVideoWriter *)self JFX_writeSampleBuffer:a3 assetWriterInput:v20 sampleType:v5 depthAdaptor:0];
    BOOL v31 = v30;
    if (!v5)
    {
      [(JFXVideoWriter *)self JFX_writeAutoExposureMetadata:a3];
      if (v31)
      {
        uint64_t v33 = JFXLog_DebugWriter();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(CMTime *)CMTime time1 = v44;
          double Seconds = CMTimeGetSeconds((CMTime *)time1);
          *(_OWORD *)CMTime time1 = *(_OWORD *)((char *)&self->_sessionStartTime.epoch + 4);
          *(void *)&time1[16] = *(void *)&self->_sessionVideoEndTime.flags;
          Float64 v41 = CMTimeGetSeconds((CMTime *)time1);
          *(_DWORD *)CMTime time1 = 134217984;
          *(double *)&time1[4] = Seconds - v41;
          _os_log_debug_impl(&dword_234C41000, v33, OS_LOG_TYPE_DEBUG, "Video time difference: %f", time1, 0xCu);
        }

        *(CMTime *)((char *)&self->_sessionStartTime.epoch + 4) = v44;
      }
      if (v8)
      {
        *(CMTime *)CMTime time1 = v44;
        [(JFXVideoWriter *)self JFX_writeJFXARMetadata:v8 time:time1];
      }
      goto LABEL_32;
    }
    if ((v5 & 0xFFFFFFFE) != 2 || !v30)
    {
      if (v5 == 1 && !self->_wroteFirstAudioSample)
      {
        self->_wroteFirstAudioSample = 1;
        v32 = JFXLog_DebugWriter();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[JFXVideoWriter JFX_writeBuffer:sampleType:arMetadata:]((uint64_t)&v44);
        }
      }
      goto LABEL_32;
    }
LABEL_66:
    *(CMTime *)((char *)&self->_sessionVideoEndTime.epoch + 4) = v44;
LABEL_32:

    goto LABEL_47;
  }
  long long v10 = JFXLog_DebugWriter();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[WriterReorderQ getReorderedFrameSet:].cold.5();
  }
LABEL_9:

LABEL_48:
}

- (void)JFX_writeDepthBufferForAVDepthData:(id)a3 withTimingInfo:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if ((a4->var1.var2 & 1) == 0)
  {
    id v8 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:]();
    }
    goto LABEL_52;
  }
  if (v6)
  {
    int v9 = [(JFXVideoWriter *)self depthCodecType];
    long long v10 = JFXVideoWriterIntervalSignpostCategory();
    os_signpost_id_t v11 = [(JFXVideoWriter *)self signPostID];
    unint64_t v12 = v11 - 1;
    if (v9 == 1111970369)
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(formatDescription[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "encode_uncompressed_depth", (const char *)&unk_234D6C482, (uint8_t *)formatDescription, 2u);
      }

      id v13 = v7;
      if ([v13 depthDataType] != 1717855600)
      {
        uint64_t v14 = [v13 depthDataByConvertingToDepthDataType:1717855600];

        id v13 = (id)v14;
      }
      id v8 = v13;
      uint64_t v15 = [v8 depthDataMap];
      if (v15)
      {
        id v16 = [(JFXVideoWriter *)self JFX_copyDepthBufferAsBGRA:v15];
        if (v16)
        {
          BOOL v17 = v16;
          formatDescription[0] = 0;
          CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v16, formatDescription);
          if (formatDescription[0])
          {
            CMSampleBufferRef sampleBufferOut = 0;
            CMSampleBufferCreateReadyWithImageBuffer(v18, v17, formatDescription[0], (const CMSampleTimingInfo *)a4, &sampleBufferOut);
            if (sampleBufferOut)
            {
              CMTimeRange v19 = JFXVideoWriterIntervalSignpostCategory();
              unint64_t v20 = [(JFXVideoWriter *)self signPostID];
              if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                os_signpost_id_t v21 = v20;
                if (os_signpost_enabled(v19))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_234C41000, v19, OS_SIGNPOST_INTERVAL_END, v21, "encode_uncompressed_depth", (const char *)&unk_234D6C482, buf, 2u);
                }
              }

              uint64_t v22 = JFXVideoWriterIntervalSignpostCategory();
              unint64_t v23 = [(JFXVideoWriter *)self signPostID];
              if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                os_signpost_id_t v24 = v23;
                if (os_signpost_enabled(v22))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_234C41000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "write_uncompressed_depth", (const char *)&unk_234D6C482, buf, 2u);
                }
              }

              [(JFXVideoWriter *)self JFX_writeBuffer:sampleBufferOut sampleType:2];
              uint64_t v25 = JFXVideoWriterIntervalSignpostCategory();
              unint64_t v26 = [(JFXVideoWriter *)self signPostID];
              if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                os_signpost_id_t v27 = v26;
                if (os_signpost_enabled(v25))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_234C41000, v25, OS_SIGNPOST_INTERVAL_END, v27, "write_uncompressed_depth", (const char *)&unk_234D6C482, buf, 2u);
                }
              }

              CFRelease(sampleBufferOut);
              CVPixelBufferRelease(v17);
              CFRelease(formatDescription[0]);
              goto LABEL_52;
            }
            CVPixelBufferRelease(v17);
            CFRelease(formatDescription[0]);
          }
        }
      }
      v39 = JFXVideoWriterIntervalSignpostCategory();
      unint64_t v45 = [(JFXVideoWriter *)self signPostID];
      if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || (os_signpost_id_t v41 = v45, !os_signpost_enabled(v39)))
      {
LABEL_51:

        goto LABEL_52;
      }
      LOWORD(formatDescription[0]) = 0;
      v42 = "encode_uncompressed_depth";
    }
    else
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(formatDescription[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "encode_compressed_depth", (const char *)&unk_234D6C482, (uint8_t *)formatDescription, 2u);
      }

      CMTime v28 = [(JFXVideoWriter *)self depthCompressor];
      long long v29 = *(_OWORD *)&a4->var2.var0;
      long long v48 = *(_OWORD *)&a4->var1.var1;
      long long v49 = v29;
      int64_t var3 = a4->var2.var3;
      uint64_t v51 = 0;
      long long v30 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)formatDescription = *(_OWORD *)&a4->var0.var0;
      long long v47 = v30;
      id v8 = [v28 compressAVDepthData:v7 timingInfo:formatDescription error:&v51];
      uint64_t v31 = v51;

      if (v31 || !v8)
      {
        v43 = JFXLog_DebugWriter();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:]();
        }

        v39 = JFXVideoWriterIntervalSignpostCategory();
        unint64_t v44 = [(JFXVideoWriter *)self signPostID];
        if (v44 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_51;
        }
        os_signpost_id_t v41 = v44;
        if (!os_signpost_enabled(v39)) {
          goto LABEL_51;
        }
        LOWORD(formatDescription[0]) = 0;
        v42 = "encode_compressed_depth";
      }
      else
      {
        uint64_t v32 = [v8 sampleBufferRef];
        uint64_t v33 = JFXVideoWriterIntervalSignpostCategory();
        unint64_t v34 = [(JFXVideoWriter *)self signPostID];
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v35 = v34;
          if (os_signpost_enabled(v33))
          {
            LOWORD(formatDescription[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_234C41000, v33, OS_SIGNPOST_INTERVAL_END, v35, "encode_compressed_depth", (const char *)&unk_234D6C482, (uint8_t *)formatDescription, 2u);
          }
        }

        long long v36 = JFXVideoWriterIntervalSignpostCategory();
        unint64_t v37 = [(JFXVideoWriter *)self signPostID];
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v38 = v37;
          if (os_signpost_enabled(v36))
          {
            LOWORD(formatDescription[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_234C41000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v38, "write_compressed_depth", (const char *)&unk_234D6C482, (uint8_t *)formatDescription, 2u);
          }
        }

        [(JFXVideoWriter *)self JFX_writeBuffer:v32 sampleType:3];
        v39 = JFXVideoWriterIntervalSignpostCategory();
        unint64_t v40 = [(JFXVideoWriter *)self signPostID];
        if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_51;
        }
        os_signpost_id_t v41 = v40;
        if (!os_signpost_enabled(v39)) {
          goto LABEL_51;
        }
        LOWORD(formatDescription[0]) = 0;
        v42 = "write_compressed_depth";
      }
    }
    _os_signpost_emit_with_name_impl(&dword_234C41000, v39, OS_SIGNPOST_INTERVAL_END, v41, v42, (const char *)&unk_234D6C482, (uint8_t *)formatDescription, 2u);
    goto LABEL_51;
  }
  id v8 = JFXLog_DebugWriter();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[JFXVideoWriter JFX_writeDepthBufferForAVDepthData:withTimingInfo:]();
  }
LABEL_52:
}

- (BOOL)JFX_writeSampleBuffer:(opaqueCMSampleBuffer *)a3 assetWriterInput:(id)a4 sampleType:(int)a5 depthAdaptor:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  memset(&v18, 0, sizeof(v18));
  CMSampleBufferGetPresentationTimeStamp(&v18, a3);
  if (![v9 isReadyForMoreMediaData])
  {
    id v13 = JFXLog_DebugWriter();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      BOOL v12 = 0;
      goto LABEL_10;
    }
    uint64_t v14 = [(id)s_streamNames objectAtIndexedSubscript:a5];
    CMTime buf = v18;
    uint64_t v15 = JFXNSStringForCMTime(&buf);
    LODWORD(buf.value) = 138412546;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
    LOWORD(buf.flags) = 2112;
    *(void *)((char *)&buf.flags + 2) = v15;
    id v16 = "%@ input not ready %@";
LABEL_12:
    _os_log_debug_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&buf, 0x16u);

    goto LABEL_9;
  }
  if (a5 != 2)
  {
    if ([v9 appendSampleBuffer:a3]) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CMTime buf = v18;
  if (([v10 appendPixelBuffer:ImageBuffer withPresentationTime:&buf] & 1) == 0)
  {
LABEL_8:
    id v13 = JFXLog_DebugWriter();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    uint64_t v14 = [(id)s_streamNames objectAtIndexedSubscript:a5];
    CMTime buf = v18;
    uint64_t v15 = JFXNSStringForCMTime(&buf);
    LODWORD(buf.value) = 138412546;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
    LOWORD(buf.flags) = 2112;
    *(void *)((char *)&buf.flags + 2) = v15;
    id v16 = "%@ append failed %@";
    goto LABEL_12;
  }
LABEL_4:
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (void)JFX_queueAudioBufferBeforeSessionStart:(opaqueCMSampleBuffer *)a3
{
  long long v4 = (void *)[objc_alloc(MEMORY[0x263F61228]) initWithSampleBuffer:a3];
  if ((unint64_t)[(WriterReorderQ *)self->_reorderQ count] >= 6)
  {
    uint64_t v5 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_queueAudioBufferBeforeSessionStart:](v5);
    }

    [(WriterReorderQ *)self->_reorderQ removeObjectAtIndex:0];
  }
  [(WriterReorderQ *)self->_reorderQ addObject:v4];
}

- (void)JFX_drainQueuedAudioBufferBeforeSessionStart_noLock
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = self->_reorderQ;
  uint64_t v4 = [(WriterReorderQ *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        memset(&v15, 0, sizeof(v15));
        if (v8) {
          [v8 presentationTimeStamp];
        }
        CMTime time1 = v15;
        CMTime time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3);
        int32_t v9 = CMTimeCompare(&time1, &time2);
        id v10 = JFXLog_DebugWriter();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v9 < 0)
        {
          if (v11)
          {
            CMTime time1 = v15;
            id v13 = JFXNSStringForCMTime(&time1);
            LODWORD(time1.value) = 138412290;
            *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v13;
            _os_log_debug_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEBUG, "skipping queued audio sample before session start time: %@", (uint8_t *)&time1, 0xCu);
          }
        }
        else
        {
          if (v11)
          {
            CMTime time1 = v15;
            BOOL v12 = JFXNSStringForCMTime(&time1);
            LODWORD(time1.value) = 138412290;
            *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v12;
            _os_log_debug_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEBUG, "Draining queued audio buffer: %@", (uint8_t *)&time1, 0xCu);
          }
          -[JFXVideoWriter JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:](self, "JFX_writeSampleBuffer:assetWriterInput:sampleType:depthAdaptor:", [v8 sampleBufferRef], self->_audioAssetWriterInput, 1, 0);
        }
      }
      uint64_t v5 = [(WriterReorderQ *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v5);
  }
}

- (id)JFX_fileLevelMetadata
{
  v23[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = +[JFXVideoCameraController sharedInstance];
  unint64_t v4 = [v3 cameraPosition];

  uint64_t v5 = [MEMORY[0x263EFA790] metadataItem];
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "JFX_funcamCameraPositionMetadataIdentifier");
  [v5 setIdentifier:v6];

  uint64_t v7 = *MEMORY[0x263F00F68];
  [v5 setDataType:*MEMORY[0x263F00F68]];
  id v8 = [NSNumber numberWithUnsignedLongLong:bswap64(v4)];
  [v5 setValue:v8];

  unint64_t v9 = bswap64(+[JFXOrientationMonitor deviceInterfaceOrientation]);
  id v10 = [MEMORY[0x263EFA790] metadataItem];
  BOOL v11 = objc_msgSend((id)objc_opt_class(), "JFX_funcamCaptureInterfaceOrientationMetadataIdentifier");
  [v10 setIdentifier:v11];

  [v10 setDataType:v7];
  BOOL v12 = [NSNumber numberWithUnsignedLongLong:v9];
  [v10 setValue:v12];

  v23[0] = v5;
  v23[1] = v10;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  uint64_t v14 = (void *)[v13 mutableCopy];

  CMTime v15 = [(JFXVideoWriter *)self animojiMetadata];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    long long v17 = [MEMORY[0x263EFA790] metadataItem];
    long long v18 = objc_msgSend((id)objc_opt_class(), "JFX_animojiMetadataIdentifier");
    [v17 setIdentifier:v18];

    [v17 setDataType:*MEMORY[0x263F00F48]];
    long long v19 = [(JFXVideoWriter *)self animojiMetadata];
    [v17 setValue:v19];

    [v14 addObject:v17];
  }
  if ([(JFXVideoWriter *)self storeDepthDataAsVideoTrack])
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFA790]);
    [v20 setKeySpace:*MEMORY[0x263EF9E78]];
    [v20 setKey:*MEMORY[0x263EF9DA0]];
    os_signpost_id_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"RGBDV%04d", 114);
    [v20 setValue:v21];

    [v14 addObject:v20];
  }

  return v14;
}

- (void)JFX_writeAutoExposureMetadata:(opaqueCMSampleBuffer *)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  if (s_enableAutoExposureFilter)
  {
    memset(&v22, 0, sizeof(v22));
    CMSampleBufferGetPresentationTimeStamp(&v22, a3);
    if (![(AVAssetWriterInput *)self->_exposureMetadataAssetWriterInput isReadyForMoreMediaData])
    {
      uint64_t v6 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_writeAutoExposureMetadata:].cold.4((uint64_t)&v22);
      }
      goto LABEL_17;
    }
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    uint64_t v6 = exifMetadataForCVPixelBuffer(ImageBuffer);
    float v7 = exifBrightnessFromEXIFMetadata(v6);
    if (fabsf(v7) == INFINITY)
    {
      uint64_t v16 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_writeAutoExposureMetadata:]();
      }

      id v17 = objc_alloc(MEMORY[0x263EFA8C0]);
      CMTime start = v22;
      CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      CMTimeRangeMake(&v18, &start, &duration);
      id v8 = (void *)[v17 initWithItems:MEMORY[0x263EFFA68] timeRange:&v18];
      if ([(AVAssetWriterInputMetadataAdaptor *)self->_exposureMetadataAdaptor appendTimedMetadataGroup:v8])
      {
        goto LABEL_16;
      }
      uint64_t v14 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_writeAutoExposureMetadata:]();
      }
    }
    else
    {
      id v8 = [MEMORY[0x263EFA790] metadataItem];
      unint64_t v9 = BrightnessIdentifier();
      [v8 setIdentifier:v9];

      [v8 setDataType:*MEMORY[0x263F00F20]];
      *(float *)&double v10 = v7;
      BOOL v11 = [NSNumber numberWithFloat:v10];
      [v8 setValue:v11];

      id v12 = objc_alloc(MEMORY[0x263EFA8C0]);
      v23[0] = v8;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      CMTime start = v22;
      CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      CMTimeRangeMake(&v21, &start, &duration);
      uint64_t v14 = [v12 initWithItems:v13 timeRange:&v21];

      if (![(AVAssetWriterInputMetadataAdaptor *)self->_exposureMetadataAdaptor appendTimedMetadataGroup:v14])
      {
        CMTime v15 = JFXLog_DebugWriter();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[JFXVideoWriter JFX_writeAutoExposureMetadata:]();
        }
      }
    }

LABEL_16:
LABEL_17:
  }
}

- (void)JFX_writeJFXARMetadata:(id)a3 time:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6
    && [(AVAssetWriterInput *)self->_JFXARMetadataAssetWriterInput isReadyForMoreMediaData])
  {
    float v7 = objc_msgSend((id)objc_opt_class(), "META_JFXARMetadataIdentifier");
    id v18 = 0;
    id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v18];
    id v9 = v18;
    if (!v9)
    {
      double v10 = [MEMORY[0x263EFA790] metadataItem];
      [v10 setIdentifier:v7];
      [v10 setDataType:*MEMORY[0x263F00F48]];
      [v10 setValue:v8];
      memset(&v17, 0, sizeof(v17));
      *(_OWORD *)&v15.start.value = *(_OWORD *)&a4->var0;
      v15.start.epoch = a4->var3;
      CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      CMTimeRangeMake(&v17, &v15.start, &duration);
      id v11 = objc_alloc(MEMORY[0x263EFA8C0]);
      v19[0] = v10;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      CMTimeRange v15 = v17;
      id v13 = (void *)[v11 initWithItems:v12 timeRange:&v15];

      if ([(AVAssetWriterInputMetadataAdaptor *)self->_JFXARMetadataMetadataAdaptor appendTimedMetadataGroup:v13])
      {
        long long v14 = *(_OWORD *)&a4->var0;
        *(void *)&self->_sessionMetadataEndTime.flags = a4->var3;
        *(_OWORD *)((char *)&self->_sessionVideoEndTime.epoch + 4) = v14;
      }
    }
  }
}

- (void)JFX_writeFaceMetadata:(id)a3 withTimingInfo:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v6 = [a3 objectForKeyedSubscript:*MEMORY[0x263F616B0]];
    if (v6)
    {
      float v7 = [MEMORY[0x263EFF980] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = v6;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v6);
            }
            id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            id v13 = [v12 faceObject];

            if (v13)
            {
              long long v14 = [v12 faceObject];
              [v7 addObject:v14];
            }
          }
          uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }

      long long v18 = *(_OWORD *)&a4->var1.var0;
      int64_t var3 = a4->var1.var3;
      CMTimeRange v15 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_writeFaceMetadata:withTimingInfo:]();
      }

      long long v16 = v18;
      int64_t v17 = var3;
      [(JFXVideoWriter *)self JFX_writeFaceDetectMetadata:v7 pts:&v16];
    }
  }
  else
  {
    id v6 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_writeFaceMetadata:withTimingInfo:]();
    }
  }
}

- (void)JFX_writeFaceDetectMetadata:(id)a3 pts:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!self->_wroteSessionStartTime
    || (time1 = (CMTime)*a4, CMTime time2 = *(CMTime *)(&self->_wroteFirstAudioSample + 3), CMTimeCompare(&time1, &time2) < 0))
  {
    long long v20 = JFXLog_DebugWriter();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:]((uint64_t)a4);
    }
  }
  else
  {
    CMTime time1 = (CMTime)*a4;
    if ([(AVAssetWriterInput *)self->_faceMetadataAssetWriterInput isReadyForMoreMediaData])
    {
      if (v6 && [v6 count])
      {
        os_signpost_id_t v24 = self;
        float v7 = objc_opt_new();
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v29;
          uint64_t v12 = *MEMORY[0x263EF9E40];
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v14 = (void *)MEMORY[0x263EFA790];
              id v15 = *(id *)(*((void *)&v28 + 1) + 8 * i);
              long long v16 = [v14 metadataItem];
              [v16 setIdentifier:v12];
              [v16 setDataType:@"com.apple.quicktime.detected-face"];
              [v16 setValue:v15];

              [v7 addObject:v16];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
          }
          while (v10);
        }

        id v17 = objc_alloc(MEMORY[0x263EFA8C0]);
        CMTime time2 = time1;
        CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01090];
        CMTimeRangeMake(&v27, &time2, &duration);
        long long v18 = (void *)[v17 initWithItems:v7 timeRange:&v27];
        if (![(AVAssetWriterInputMetadataAdaptor *)v24->_faceMetadataAdaptor appendTimedMetadataGroup:v18])
        {
          long long v19 = JFXLog_DebugWriter();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:]();
          }
        }
      }
      else
      {
        long long v21 = JFXLog_DebugWriter();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:]();
        }

        id v22 = objc_alloc(MEMORY[0x263EFA8C0]);
        CMTime time2 = time1;
        CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01090];
        CMTimeRangeMake(&v25, &time2, &duration);
        float v7 = [v22 initWithItems:MEMORY[0x263EFFA68] timeRange:&v25];
        if (![(AVAssetWriterInputMetadataAdaptor *)self->_faceMetadataAdaptor appendTimedMetadataGroup:v7])
        {
          long long v23 = JFXLog_DebugWriter();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:]();
          }
        }
      }
    }
    else
    {
      float v7 = JFXLog_DebugWriter();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoWriter JFX_writeFaceDetectMetadata:pts:].cold.5((uint64_t)&time1);
      }
    }
  }
}

+ (void)META_metadataForVideo:(id)a3 completion:(id)a4
{
  v50[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFA470] assetWithURL:v6];
  uint64_t v9 = [v8 metadata];
  uint64_t v10 = v9;
  if (v8 && [v9 count])
  {
    dispatch_group_t v11 = dispatch_group_create();
    long long v30 = objc_msgSend(a1, "JFX_funcamCameraPositionMetadataIdentifier");
    uint64_t v12 = objc_msgSend(a1, "JFX_funcamCaptureInterfaceOrientationMetadataIdentifier");
    v49[0] = v30;
    v49[1] = v12;
    v50[0] = &unk_26E801AA0;
    v50[1] = &unk_26E801AA0;
    id v13 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    long long v14 = (void *)[v13 mutableCopy];

    id v15 = [v14 allKeys];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_119;
    v43[3] = &unk_264C0C250;
    id v16 = v10;
    id v44 = v16;
    id v17 = v11;
    unint64_t v45 = v17;
    id v18 = v14;
    id v46 = v18;
    [v15 enumerateObjectsUsingBlock:v43];

    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__18;
    v41[4] = __Block_byref_object_dispose__18;
    id v42 = 0;
    long long v29 = objc_msgSend(a1, "JFX_animojiMetadataIdentifier");
    long long v19 = objc_msgSend(MEMORY[0x263EFA748], "metadataItemsFromArray:filteredByIdentifier:", v16);
    if ([v19 count])
    {
      long long v20 = [v19 objectAtIndexedSubscript:0];
      dispatch_group_enter(v17);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_131;
      v37[3] = &unk_264C0A4B8;
      unint64_t v40 = v41;
      id v21 = v20;
      id v38 = v21;
      v39 = v17;
      [v21 loadValuesAsynchronouslyForKeys:&unk_26E801FF8 completionHandler:v37];
    }
    id v22 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2_132;
    block[3] = &unk_264C0C278;
    id v32 = v18;
    id v33 = v30;
    id v34 = v12;
    id v35 = v7;
    long long v36 = v41;
    id v28 = v7;
    id v27 = v12;
    long long v23 = v19;
    id v24 = v30;
    id v25 = v18;
    dispatch_group_notify(v17, v22, block);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    unint64_t v26 = dispatch_get_global_queue(21, 0);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke;
    v47[3] = &unk_264C0A3F0;
    id v48 = v7;
    id v17 = v7;
    dispatch_async(v26, v47);

    id v25 = v48;
  }
}

uint64_t __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_119(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [MEMORY[0x263EFA748] metadataItemsFromArray:*(void *)(a1 + 32) filteredByIdentifier:v3];
  if ([v4 count])
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2;
    v7[3] = &unk_264C0C228;
    id v8 = v5;
    id v9 = *(id *)(a1 + 48);
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    id v6 = v5;
    [v6 loadValuesAsynchronouslyForKeys:&unk_26E801FE0 completionHandler:v7];
  }
}

void __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) numberValue];
  unint64_t v2 = [v4 unsignedLongLongValue];
  id v3 = [NSNumber numberWithLongLong:bswap64(v2)];
  [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 48)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_131(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataValue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

uint64_t __51__JFXVideoWriter_META_metadataForVideo_completion___block_invoke_2_132(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 longLongValue];

  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v3 longLongValue];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v4();
}

+ (id)META_JFXARMetadataIdentifier
{
  uint64_t v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F086E0] jfxBundle];
  id v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@", v4, @"JFXARMetadata"];

  id v6 = [MEMORY[0x263EFA748] identifierForKey:v5 keySpace:*MEMORY[0x263EF9E88]];

  return v6;
}

+ (id)META_metadataAssetTrackFromAsset:(id)a3 metadataIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__18;
  long long v30 = __Block_byref_object_dispose__18;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__18;
  id v24 = __Block_byref_object_dispose__18;
  id v25 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = *MEMORY[0x263EF9D08];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke;
  _OWORD v17[3] = &unk_264C0AD08;
  long long v19 = &v20;
  id v9 = v7;
  id v18 = v9;
  [v5 loadTracksWithMediaType:v8 completionHandler:v17];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (void *)v21[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_2;
  v14[3] = &unk_264C0C2C8;
  id v11 = v6;
  id v15 = v11;
  id v16 = &v26;
  [v10 enumerateObjectsUsingBlock:v14];
  id v12 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  dispatch_semaphore_t v7 = [v6 formatDescriptions];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_3;
  v11[3] = &unk_264C0C2A0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v14 = v9;
  id v10 = v6;
  id v13 = v10;
  [v7 enumerateObjectsUsingBlock:v11];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __70__JFXVideoWriter_META_metadataAssetTrackFromAsset_metadataIdentifier___block_invoke_3(uint64_t a1, CMMetadataFormatDescriptionRef desc, uint64_t a3, unsigned char *a4)
{
  CMMetadataFormatDescriptionGetIdentifiers(desc);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    *a4 = 1;
  }
}

+ (id)META_ARMetadataTrackForAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "META_JFXARMetadataIdentifier");
  id v6 = objc_msgSend(a1, "META_metadataAssetTrackFromAsset:metadataIdentifier:", v4, v5);

  return v6;
}

+ (id)JFX_funcamCameraPositionMetadataIdentifier
{
  uint64_t v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F086E0] jfxBundle];
  id v4 = [v3 bundleIdentifier];
  id v5 = [v2 stringWithFormat:@"%@.%@", v4, @"cameraPosition"];

  id v6 = [MEMORY[0x263EFA748] identifierForKey:v5 keySpace:*MEMORY[0x263EF9E88]];

  return v6;
}

+ (id)JFX_funcamCaptureInterfaceOrientationMetadataIdentifier
{
  uint64_t v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F086E0] jfxBundle];
  id v4 = [v3 bundleIdentifier];
  id v5 = [v2 stringWithFormat:@"%@.%@", v4, @"captureInterfaceOrientation"];

  id v6 = [MEMORY[0x263EFA748] identifierForKey:v5 keySpace:*MEMORY[0x263EF9E88]];

  return v6;
}

+ (id)JFX_faceAnchorMetadataIdentifier
{
  uint64_t v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F086E0] jfxBundle];
  id v4 = [v3 bundleIdentifier];
  id v5 = [v2 stringWithFormat:@"%@.%@", v4, @"faceanchor"];

  id v6 = [MEMORY[0x263EFA748] identifierForKey:v5 keySpace:*MEMORY[0x263EF9E88]];

  return v6;
}

+ (id)JFX_animojiMetadataIdentifier
{
  uint64_t v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F086E0] jfxBundle];
  id v4 = [v3 bundleIdentifier];
  id v5 = [v2 stringWithFormat:@"%@.%@", v4, @"animojiMetadata"];

  id v6 = [MEMORY[0x263EFA748] identifierForKey:v5 keySpace:*MEMORY[0x263EF9E88]];

  return v6;
}

- (BOOL)JFX_writerCanBegin:(id *)a3
{
  id v5 = [(JFXVideoWriter *)self folderURL];

  if (v5)
  {
    id v6 = [(JFXVideoWriter *)self videoOutputSettings];
    if (v6)
    {

      return 1;
    }
    id v10 = [(JFXVideoWriter *)self audioOutputSettings];

    if (v10) {
      return 1;
    }
    dispatch_semaphore_t v7 = @"No video or audio output settings provided";
    id v8 = a3;
    uint64_t v9 = 3;
  }
  else
  {
    dispatch_semaphore_t v7 = @"nil url";
    id v8 = a3;
    uint64_t v9 = 1;
  }
  SetError(v8, @"com.apple.Clips.JFXVideoWriter", v9, v7);
  return 0;
}

- (void)JFX_removeFileAtURL:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v6 path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5) {
    [v3 removeItemAtURL:v6 error:0];
  }
}

- (__CVBuffer)JFX_copyDepthBufferAsBGRA:(__CVBuffer *)a3
{
  CVPixelBufferRef pixelBufferOut = 0;
  if (a3)
  {
    depthAdaptor = self->_depthAdaptor;
    if (depthAdaptor)
    {
      CVPixelBufferPoolCreatePixelBuffer(0, [(AVAssetWriterInputPixelBufferAdaptor *)depthAdaptor pixelBufferPool], &pixelBufferOut);
      if (pixelBufferOut)
      {
        if (CVPixelBufferGetPixelFormatType(pixelBufferOut) == 1111970369)
        {
          size_t Width = CVPixelBufferGetWidth(a3);
          size_t Height = CVPixelBufferGetHeight(a3);
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
          size_t v8 = CVPixelBufferGetBytesPerRow(pixelBufferOut);
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
          id v10 = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
          if (Height)
          {
            id v11 = v10;
            size_t v12 = 4 * Width;
            do
            {
              memcpy(v11, BaseAddress, v12);
              BaseAddress += BytesPerRow;
              v11 += v8;
              --Height;
            }
            while (Height);
          }
          CVPixelBufferUnlockBaseAddress(a3, 1uLL);
          CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
        }
      }
    }
  }
  return pixelBufferOut;
}

- (BOOL)wroteSessionStartTime
{
  return self->_wroteSessionStartTime;
}

- (BOOL)storeFaceMetadata
{
  return (BOOL)self->_audioBufferQ;
}

- (void)setStoreFaceMetadata:(BOOL)a3
{
  LOBYTE(self->_audioBufferQ) = a3;
}

- (BOOL)storeDepthDataAsVideoTrack
{
  return BYTE1(self->_audioBufferQ);
}

- ($2825F4736939C4A6D3AD43837233062D)depthDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_storeFaceMetadata;
}

- (void)setDepthDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_storeFaceMetadata = a3;
}

- (NSData)animojiMetadata
{
  return (NSData *)self->_depthDimensions;
}

- (void)setAnimojiMetadata:(id)a3
{
}

- (JFXVideoWriterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animojiMetadata);
  return (JFXVideoWriterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)trackOutOfOrderVideoBuffers
{
  return BYTE2(self->_audioBufferQ);
}

- (void)setTrackOutOfOrderVideoBuffers:(BOOL)a3
{
  BYTE2(self->_audioBufferQ) = a3;
}

- (int)depthCodecType
{
  return HIDWORD(self->_audioBufferQ);
}

- (void)setDepthCodecType:(int)a3
{
  HIDWORD(self->_audioBufferQ) = a3;
}

- (NSURL)folderURL
{
  return (NSURL *)self->_delegate;
}

- (void)setFolderURL:(id)a3
{
}

- (NSDictionary)videoOutputSettings
{
  return (NSDictionary *)self->_folderURL;
}

- (void)setVideoOutputSettings:(id)a3
{
}

- (NSDictionary)audioOutputSettings
{
  return self->_videoOutputSettings;
}

- (void)setAudioOutputSettings:(id)a3
{
}

- (JFXDepthCompressor)depthCompressor
{
  return (JFXDepthCompressor *)self->_audioOutputSettings;
}

- (void)setDepthCompressor:(id)a3
{
}

- (NSDictionary)depthBGRAPixelBufferAttributes
{
  return (NSDictionary *)self->_depthCompressor;
}

- (void)setDepthBGRAPixelBufferAttributes:(id)a3
{
}

- (unint64_t)signPostID
{
  return (unint64_t)self->_depthBGRAPixelBufferAttributes;
}

- (void)setSignPostID:(unint64_t)a3
{
  self->_depthBGRAPixelBufferAttributes = (NSDictionary *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthCompressor, 0);
  objc_storeStrong((id *)&self->_audioOutputSettings, 0);
  objc_storeStrong((id *)&self->_videoOutputSettings, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_animojiMetadata);
  objc_storeStrong((id *)&self->_depthDimensions, 0);
  objc_storeStrong((id *)&self->_reorderQ, 0);
  objc_storeStrong((id *)&self->_finishingLock, 0);
  objc_storeStrong((id *)&self->_preparingWriter, 0);
  objc_storeStrong((id *)&self->_JFXARMetadataMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_faceMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_exposureMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_depthAdaptor, 0);
  objc_storeStrong((id *)&self->_JFXARMetadataAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_faceMetadataAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_exposureMetadataAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_compressedDepthAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_depthAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_metadataAssetWriter, 0);
  objc_storeStrong((id *)&self->_audioAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_videoAssetWriterInput, 0);
  objc_storeStrong((id *)&self->_videoAssetWriter, 0);
}

- (void)writeCameraFrameSet:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Failed to get color buffer timing info, so not writing depth", v2, v3, v4, v5, v6);
}

- (void)finishWritingWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: finishWritingWithCompletionHandler was called without writing a session start time", v2, v3, v4, v5, v6);
}

void __53__JFXVideoWriter_finishWritingWithCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Finished writing with completion handler", v2, v3, v4, v5, v6);
}

- (void)JFX_setupMetadataWriterWithTransform:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: failed to setup face metadata output", v2, v3, v4, v5, v6);
}

- (void)JFX_setupMetadataWriterWithTransform:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: failed to setup depth output", v2, v3, v4, v5, v6);
}

- (void)JFX_setupMetadataWriterWithTransform:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: failed to setup compressed depth output", v2, v3, v4, v5, v6);
}

- (void)JFX_setupCompressedDepthOutputWithTransform:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: Could not add compressed depth writerInput", v2, v3, v4, v5, v6);
}

- (void)JFX_startSessionAtSourceTime_noLock:(uint64_t)a1 .cold.1(uint64_t a1)
{
  OUTLINED_FUNCTION_2(a1);
  uint64_t v2 = JFXNSStringForCMTime(v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "Session start time:      %@", v5, v6, v7, v8, v9);
}

- (void)JFX_startSessionAtSourceTime_noLock:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Waiting for some queued audio before starting session", v2, v3, v4, v5, v6);
}

- (void)JFX_writeBuffer:(uint64_t)a1 sampleType:arMetadata:.cold.2(uint64_t a1)
{
  OUTLINED_FUNCTION_2(a1);
  uint64_t v2 = JFXNSStringForCMTime(v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "Audio Sample Start time: %@", v5, v6, v7, v8, v9);
}

- (void)JFX_writeBuffer:sampleType:arMetadata:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Queue audio buffer to write when session starts", v2, v3, v4, v5, v6);
}

- (void)JFX_writeBuffer:(uint64_t)a1 sampleType:arMetadata:.cold.4(uint64_t a1)
{
  OUTLINED_FUNCTION_2(a1);
  uint64_t v2 = JFXNSStringForCMTime(v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "start session at %@", v5, v6, v7, v8, v9);
}

- (void)JFX_writeBuffer:(id *)a1 sampleType:arMetadata:.cold.5(id *a1)
{
  uint64_t v1 = [*a1 error];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "metadata error: %@", v4, v5, v6, v7, v8);
}

- (void)JFX_writeBuffer:(id *)a1 sampleType:arMetadata:.cold.6(id *a1)
{
  uint64_t v1 = [*a1 error];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "video error: %@", v4, v5, v6, v7, v8);
}

- (void)JFX_writeBuffer:sampleType:arMetadata:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "NO Write during preparing", v2, v3, v4, v5, v6);
}

- (void)JFX_writeBuffer:sampleType:arMetadata:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "still preparing writer", v2, v3, v4, v5, v6);
}

- (void)JFX_writeDepthBufferForAVDepthData:withTimingInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: invalid timing info", v2, v3, v4, v5, v6);
}

- (void)JFX_writeDepthBufferForAVDepthData:withTimingInfo:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Skipping compressed depth sample write because avDepthData is nil", v2, v3, v4, v5, v6);
}

- (void)JFX_writeDepthBufferForAVDepthData:withTimingInfo:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: compressAVDepthData failed.", v2, v3, v4, v5, v6);
}

- (void)JFX_queueAudioBufferBeforeSessionStart:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "Queued audio samples exceeded max size (%d). Dropping sample.", (uint8_t *)v1, 8u);
}

- (void)JFX_writeAutoExposureMetadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: autoexposure metadata writing failed.", v2, v3, v4, v5, v6);
}

- (void)JFX_writeAutoExposureMetadata:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Warning: writing gap in autoexposure metadata instead of invalid metadata. Reader must support this.", v2, v3, v4, v5, v6);
}

- (void)JFX_writeAutoExposureMetadata:(uint64_t)a1 .cold.4(uint64_t a1)
{
  OUTLINED_FUNCTION_4_1(a1, *MEMORY[0x263EF8340], v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "Error: dropping autoexposure metadata at time %f because writer not ready", v3, v4, v5, v6, 0);
}

- (void)JFX_writeFaceMetadata:withTimingInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Warning: metadata is nil in JFXVideoWriter", v2, v3, v4, v5, v6);
}

- (void)JFX_writeFaceMetadata:withTimingInfo:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_234C41000, v0, OS_LOG_TYPE_DEBUG, "Writing face metadata for %@", v1, 0xCu);
}

- (void)JFX_writeFaceDetectMetadata:(uint64_t)a1 pts:.cold.1(uint64_t a1)
{
  OUTLINED_FUNCTION_4_1(a1, *MEMORY[0x263EF8340], v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "Droppping face detection metadata at pts=%f", v3, v4, v5, v6, 0);
}

- (void)JFX_writeFaceDetectMetadata:pts:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: face detection metadata writing failed.", v2, v3, v4, v5, v6);
}

- (void)JFX_writeFaceDetectMetadata:pts:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Warning: writing gap in face detection metadata instead of invalid metadata. Reader must support this.", v2, v3, v4, v5, v6);
}

- (void)JFX_writeFaceDetectMetadata:(uint64_t)a1 pts:.cold.5(uint64_t a1)
{
  OUTLINED_FUNCTION_4_1(a1, *MEMORY[0x263EF8340], v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "Error: dropping face detection metadata at time %f because writer not ready", v3, v4, v5, v6, 0);
}

@end