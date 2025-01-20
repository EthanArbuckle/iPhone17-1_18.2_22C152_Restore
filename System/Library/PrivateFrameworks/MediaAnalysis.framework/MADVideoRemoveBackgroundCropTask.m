@interface MADVideoRemoveBackgroundCropTask
+ (id)taskWithAsset:(id)a3 previewRequest:(id)a4 generationRequest:(id)a5 cancelBlock:(id)a6 progressHandler:(id)a7 resultHandler:(id)a8 completionHandler:(id)a9;
- (BOOL)cachesResources;
- (BOOL)exportFutureSamples:(id)a3 sequenceWriter:(id)a4 progress:(id)a5 error:(id *)a6;
- (BOOL)exportPastSamples:(id)a3 sequenceWriter:(id)a4 progress:(id)a5 error:(id *)a6;
- (BOOL)isAnimatedStickerPreferredWithPastSamples:(id)a3 futureSamples:(id)a4;
- (BOOL)isCanceled;
- (BOOL)run:(id *)a3;
- (BOOL)validateRequest:(id *)a3;
- (CGRect)scaleNormalizedCropRect:(CGRect)a3 forPixelBuffer:(__CVBuffer *)a4;
- (MADVideoRemoveBackgroundCropTask)initWithAsset:(id)a3 previewRequest:(id)a4 generationRequest:(id)a5 cancelBlock:(id)a6 progressHandler:(id)a7 resultHandler:(id)a8 completionHandler:(id)a9;
- (NSString)signpostPayload;
- (__CVBuffer)generateMaskForSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 error:(id *)a5;
- (id).cxx_construct;
- (id)compressSequenceData:(id)a3 sequenceWriter:(id)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6;
- (id)decodeSamplesUntilTime:(id *)a3 trackOutput:(id)a4 baseTime:(id *)a5 progress:(id)a6 error:(id *)a7;
- (id)decodeSettingsForTrack:(id)a3;
- (id)processFutureSamplesFromTrackOutput:(id)a3 baseTime:(id *)a4 orientation:(unsigned int)a5 maskSampleBuffer:(opaqueCMSampleBuffer *)a6 maskPixelBuffer:(__CVBuffer *)a7 cropUnion:(CGRect *)a8 endTime:(id *)a9 progress:(id)a10 error:(id *)a11;
- (id)processPastSampleBuffers:(id)a3 orientation:(unsigned int)a4 maskPixelBuffer:(__CVBuffer *)a5 cropUnion:(CGRect *)a6 progress:(id)a7 error:(id *)a8;
- (void)dealloc;
- (void)publishPayloadWidth:(unint64_t)a3 height:(unint64_t)a4 data:(id)a5;
- (void)publishPreviewResultsTimeRange:(id *)a3 pastSamples:(id)a4 futureSamples:(id)a5 cropRect:(CGRect)a6;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADVideoRemoveBackgroundCropTask

- (MADVideoRemoveBackgroundCropTask)initWithAsset:(id)a3 previewRequest:(id)a4 generationRequest:(id)a5 cancelBlock:(id)a6 progressHandler:(id)a7 resultHandler:(id)a8 completionHandler:(id)a9
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __143__MADVideoRemoveBackgroundCropTask_initWithAsset_previewRequest_generationRequest_cancelBlock_progressHandler_resultHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6297A60;
  id v20 = v19;
  id v36 = v20;
  v21 = _Block_copy(aBlock);
  v34.receiver = self;
  v34.super_class = (Class)MADVideoRemoveBackgroundCropTask;
  v22 = [(VCPMABaseTask *)&v34 initWithCompletionHandler:v21];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_previewRequest, a4);
    objc_storeStrong((id *)&v23->_request, a5);
    objc_storeStrong((id *)&v23->_asset, a3);
    v24 = _Block_copy(v17);
    id progressHandler = v23->_progressHandler;
    v23->_id progressHandler = v24;

    v26 = _Block_copy(v18);
    id resultHandler = v23->_resultHandler;
    v23->_id resultHandler = v26;

    v28 = _Block_copy(v20);
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = v28;

    -[VCPMABaseTask setCancelBlock:](v23, "setCancelBlock:", v16, v31, v32, v33);
  }

  return v23;
}

uint64_t __143__MADVideoRemoveBackgroundCropTask_initWithAsset_previewRequest_generationRequest_cancelBlock_progressHandler_resultHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)taskWithAsset:(id)a3 previewRequest:(id)a4 generationRequest:(id)a5 cancelBlock:(id)a6 progressHandler:(id)a7 resultHandler:(id)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAsset:v14 previewRequest:v15 generationRequest:v16 cancelBlock:v17 progressHandler:v18 resultHandler:v19 completionHandler:v20];

  return v21;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F45968] globalSession];
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)MADVideoRemoveBackgroundCropTask;
  [(VCPMABaseTask *)&v4 dealloc];
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)isCanceled
{
  v3 = [(MADVideoRemoveBackgroundRequest *)self->_request stickerIdentifiers];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MADVideoRemoveBackgroundCropTask;
    BOOL v4 = [(VCPMABaseTask *)&v6 isCanceled];
  }

  return v4;
}

- (BOOL)validateRequest:(id *)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  v5 = [(MADVideoRemoveBackgroundRequest *)self->_request maxDimension];
  if (v5)
  {
    objc_super v6 = [(MADVideoRemoveBackgroundRequest *)self->_request minDimension];
    if (v6)
    {
      v7 = [(MADVideoRemoveBackgroundRequest *)self->_request maxDimension];
      uint64_t v8 = [v7 integerValue];
      v9 = [(MADVideoRemoveBackgroundRequest *)self->_request minDimension];
      uint64_t v10 = [v9 integerValue];

      if (v8 < v10)
      {
        v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v38 = *MEMORY[0x1E4F28568];
        v12 = NSString;
        p_request = &self->_request;
        id v14 = [(MADVideoRemoveBackgroundRequest *)self->_request minDimension];
        id v15 = [(MADVideoRemoveBackgroundRequest *)*p_request maxDimension];
        id v16 = [v12 stringWithFormat:@"Invalid request - min dimension (%@) exceeds max dimension (%@)", v14, v15];
        v39[0] = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
        id v18 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v17];
        id v19 = *a3;
        *a3 = v18;

        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  id v20 = [(MADVideoRemoveBackgroundRequest *)self->_request maxFileSize];
  if (v20
    && ([(MADVideoRemoveBackgroundRequest *)self->_request maxFileSize],
        v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v22 = [v21 unsignedIntegerValue],
        v21,
        v20,
        !v22))
  {
    id v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    id v33 = NSString;
    id v14 = [(MADVideoRemoveBackgroundRequest *)self->_request maxFileSize];
    id v15 = [v33 stringWithFormat:@"Invalid request - max file size (%@) must be greater than zero", v14];
    v37 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v31 = [v32 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v16];
  }
  else
  {
    v23 = [(MADVideoRemoveBackgroundRequest *)self->_request instancePoint];
    if (!v23) {
      return 1;
    }
    v24 = [(MADVideoRemoveBackgroundRequest *)self->_request instancePoint];
    [v24 pointValue];
    v40.x = v25;
    v40.y = v26;
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.width = 1.0;
    v41.size.height = 1.0;
    BOOL v27 = CGRectContainsPoint(v41, v40);

    if (v27) {
      return 1;
    }
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v30 = NSString;
    id v14 = [(MADVideoRemoveBackgroundRequest *)self->_request instancePoint];
    id v15 = [v30 stringWithFormat:@"Invalid request - instance point (%@) outside of unit rect", v14];
    v35 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v31 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v16];
  }
  id v17 = *a3;
  *a3 = v31;
LABEL_14:

  return 0;
}

- (id)decodeSettingsForTrack:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:&unk_1F15EB7C0 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
  objc_super v6 = [(MADVideoRemoveBackgroundRequest *)self->_request maxDimension];

  if (v6)
  {
    v7 = [(MADVideoRemoveBackgroundRequest *)self->_request maxDimension];
    [v7 doubleValue];
    double v9 = v8;

    [v4 naturalSize];
    double v12 = v10 >= v11 ? v10 : v11;
    if (v9 < v12)
    {
      unint64_t v13 = ((unint64_t)(v10 * (v9 / v12)) + 1) & 0xFFFFFFFFFFFFFFFELL;
      unint64_t v14 = ((unint64_t)(v11 * (v9 / v12)) + 1) & 0xFFFFFFFFFFFFFFFELL;
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v19[0] = 67109376;
          v19[1] = v13;
          __int16 v20 = 1024;
          int v21 = v14;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "[RMBG] Scaling decode to %dx%d", (uint8_t *)v19, 0xEu);
        }
      }
      id v16 = [NSNumber numberWithUnsignedLong:v13];
      [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F24E10]];

      id v17 = [NSNumber numberWithUnsignedLong:v14];
      [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
    }
  }

  return v5;
}

- (id)decodeSamplesUntilTime:(id *)a3 trackOutput:(id)a4 baseTime:(id *)a5 progress:(id)a6 error:(id *)a7
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v45 = a6;
  v46 = v11;
  double v12 = [v11 track];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v49 = *a3;
  v43 = [v12 makeSampleCursorWithPresentationTimeStamp:&v49];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (v43)
      {
        [v43 presentationTimeStamp];
        CMTimeValue v14 = *(void *)lhs;
        [v43 presentationTimeStamp];
        CMTimeScale timescale = rhs.timescale;
      }
      else
      {
        CMTimeScale timescale = 0;
        CMTimeValue v14 = 0;
        memset(lhs, 0, 24);
        memset(&rhs, 0, sizeof(rhs));
      }
      int64_t var0 = a3->var0;
      int var1 = a3->var1;
      LODWORD(buf.duration.value) = 134218752;
      *(CMTimeValue *)((char *)&buf.duration.value + 4) = v14;
      LOWORD(buf.duration.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = timescale;
      WORD1(buf.duration.epoch) = 2048;
      *(CMTimeEpoch *)((char *)&buf.duration.epoch + 4) = var0;
      WORD2(buf.presentationTimeStamp.value) = 1024;
      *(_DWORD *)((char *)&buf.presentationTimeStamp.value + 6) = var1;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "[RMBG] Decoding until %lld/%d (mask time: %lld/%d)", (uint8_t *)&buf, 0x22u);
    }
  }
  CGRect v41 = [MEMORY[0x1E4F1CA48] array];
  int64_t v44 = a5->var0;
  uint64_t v18 = *MEMORY[0x1E4F28760];
  uint64_t v19 = *MEMORY[0x1E4F28568];
  do
  {
    __int16 v20 = (void *)MEMORY[0x1C186D320]();
    if ([(MADVideoRemoveBackgroundCropTask *)self isCanceled])
    {
      int v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = v19;
      uint64_t v22 = [NSString stringWithFormat:@"Request canceled"];
      v58[0] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
      v24 = [v21 errorWithDomain:v18 code:-128 userInfo:v23];
      id v25 = *a7;
      *a7 = v24;

      int v26 = 1;
      goto LABEL_40;
    }
    BOOL v27 = (opaqueCMSampleBuffer *)[v46 copyNextSampleBuffer];
    CMSampleBufferRef originalSBuf = v27;
    if (v27)
    {
      memset(&v47, 0, sizeof(v47));
      CMSampleBufferGetPresentationTimeStamp(&v47, v27);
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.duration.value) = 134218240;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = v47.value;
          LOWORD(buf.duration.flags) = 1024;
          *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = v47.timescale;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_INFO, "[RMBG] Decoded %lld/%d", (uint8_t *)&buf, 0x12u);
        }
      }
      if (v44)
      {
        memset(&buf.presentationTimeStamp, 0, 48);
        v29 = (CMTime *)MEMORY[0x1E4F1F9F8];
        *(_OWORD *)&buf.duration.value = *MEMORY[0x1E4F1F9F8];
        buf.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        *(CMTime *)lhs = v47;
        CMTime rhs = (CMTime)*a5;
        CMTimeSubtract(&buf.presentationTimeStamp, (CMTime *)lhs, &rhs);
        buf.decodeTimeStamp = *v29;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)lhs = 134218752;
            *(void *)&lhs[4] = v47.value;
            *(_WORD *)&lhs[12] = 1024;
            *(_DWORD *)&lhs[14] = v47.timescale;
            *(_WORD *)&lhs[18] = 2048;
            *(void *)&lhs[20] = buf.presentationTimeStamp.value;
            __int16 v54 = 1024;
            CMTimeScale v55 = buf.presentationTimeStamp.timescale;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_INFO, "[RMBG] Adjusting time %lld/%d --> %lld/%d", lhs, 0x22u);
          }
        }
        rhs.value = 0;
        if (CMSampleBufferCreateCopyWithNewTiming(0, originalSBuf, 1, &buf, (CMSampleBufferRef *)&rhs))
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v31 = VCPLogInstance();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)lhs = 134218240;
              *(void *)&lhs[4] = v47.value;
              *(_WORD *)&lhs[12] = 1024;
              *(_DWORD *)&lhs[14] = v47.timescale;
              _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "[RMBG] Failed to adjust sample timing (%lld/%d)", lhs, 0x12u);
            }
          }
          id v32 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v51 = v19;
          id v33 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to adjust sample timing (%lld/%d)", v47.value, v47.timescale);
          v52 = v33;
          uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          v35 = [v32 errorWithDomain:v18 code:-18 userInfo:v34];
          id v36 = *a7;
          *a7 = v35;

          CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
          int v26 = 1;
          goto LABEL_39;
        }
        value = (opaqueCMSampleBuffer *)rhs.value;
        if (rhs.value) {
          value = (opaqueCMSampleBuffer *)CFRetain((CFTypeRef)rhs.value);
        }
        *(void *)lhs = value;
        if (originalSBuf)
        {
          CFRelease(originalSBuf);
          value = *(opaqueCMSampleBuffer **)lhs;
        }
        CMSampleBufferRef originalSBuf = value;
        *(void *)lhs = 0;
        CF<opaqueCMSampleBuffer *>::~CF((const void **)lhs);
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
      }
      [v41 addObject:originalSBuf];
      objc_msgSend(v45, "setCompletedUnitCount:", objc_msgSend(v45, "completedUnitCount") + 1);
      if (v43) {
        [v43 presentationTimeStamp];
      }
      else {
        memset(&rhs, 0, sizeof(rhs));
      }
      buf.duration = v47;
      *(CMTime *)lhs = rhs;
      if (CMTimeCompare(&buf.duration, (CMTime *)lhs) >= 0) {
        int v26 = 5;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 5;
    }
LABEL_39:
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&originalSBuf);
LABEL_40:
  }
  while (!v26);
  if (v26 == 5)
  {
    uint64_t v38 = v41;
    id v39 = v41;
  }
  else
  {
    id v39 = 0;
    uint64_t v38 = v41;
  }

  return v39;
}

- (__CVBuffer)generateMaskForSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v122[1] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C186D320](self, a2);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    double v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CMSampleTimingInfo buf = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "[RMBG] Creating mask to seed tracking", buf, 2u);
    }
  }
  double v10 = +[MADImageRemoveBackgroundResource sharedResource];
  [v10 setMaskOnly:1];
  id v11 = +[VCPMADResourceManager sharedManager];
  v105 = [v11 activateResource:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4F45840]);
  [v12 setRevision:1];
  if (DeviceHasANE())
  {
    unint64_t v13 = [MEMORY[0x1E4F458E8] defaultANEDevice];
    [v12 setProcessingDevice:v13];
  }
  id v14 = objc_alloc(MEMORY[0x1E4F45890]);
  id v15 = [v10 session];
  id v16 = (void *)[v14 initWithCMSampleBuffer:a3 orientation:v6 options:MEMORY[0x1E4F1CC08] session:v15];

  id v17 = VCPSignPostLog();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  uint64_t v19 = VCPSignPostLog();
  __int16 v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)CMSampleTimingInfo buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VNGenerateInstanceMaskRequest_PerformRequest", "", buf, 2u);
  }

  v122[0] = v12;
  int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:1];
  id v107 = 0;
  char v22 = [v16 performRequests:v21 error:&v107];
  id v23 = v107;

  if (v22)
  {
    v24 = VCPSignPostLog();
    id v25 = v24;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)CMSampleTimingInfo buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_END, v18, "VNGenerateInstanceMaskRequest_PerformRequest", "", buf, 2u);
    }

    int v26 = [v12 results];
    BOOL v27 = [v26 firstObject];

    if (!v27)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v43 = VCPLogInstance();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CMSampleTimingInfo buf = 0;
          _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEFAULT, "[RMBG] Video frame failed to produce a mask", buf, 2u);
        }
      }
      int64_t v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v120 = *MEMORY[0x1E4F28568];
      id v45 = [NSString stringWithFormat:@"Video frame failed to produce a mask"];
      v121 = v45;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
      CMTime v47 = [v44 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v46];
      id v48 = *a5;
      *a5 = v47;

      goto LABEL_49;
    }
    v28 = [v27 allInstances];
    BOOL v29 = [v28 count] == 0;

    if (v29)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v49 = VCPLogInstance();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CMSampleTimingInfo buf = 0;
          _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_DEFAULT, "[RMBG] No instances detected in video frame", buf, 2u);
        }
      }
      v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v118 = *MEMORY[0x1E4F28568];
      id v45 = [NSString stringWithFormat:@"No instances detected in video frame"];
      v119 = v45;
      uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
      v52 = [v50 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v51];
      id v53 = *a5;
      *a5 = v52;

      goto LABEL_49;
    }
    v30 = [v27 allInstances];
    if ((unint64_t)[v30 count] <= 1)
    {
    }
    else
    {
      id v31 = [(MADVideoRemoveBackgroundRequest *)self->_request instancePoint];
      BOOL v32 = v31 == 0;

      if (!v32)
      {
        id v33 = [(MADVideoRemoveBackgroundRequest *)self->_request instancePoint];
        [v33 pointValue];
        double v35 = v34;
        double v37 = v36;

        uint64_t v38 = (__CVBuffer *)[v27 instanceMask];
        uint64_t v39 = (uint64_t)v38;
        *(void *)&v116[4] = v38;
        uint64_t v117 = 1;
        if (!v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[MADVideoRemoveBackgroundCropTask generateMaskForSampleBuffer:orientation:error:]();
          }
          *(_DWORD *)CMSampleTimingInfo buf = -50;
          goto LABEL_48;
        }
        CVReturn v40 = CVPixelBufferLockBaseAddress(v38, 1uLL);
        *(_DWORD *)CMSampleTimingInfo buf = v40;
        if (v40)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[MADVideoRemoveBackgroundCropTask generateMaskForSampleBuffer:orientation:error:](v39, v40);
          }
LABEL_48:
          v62 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v113 = *MEMORY[0x1E4F28568];
          v63 = [NSString stringWithFormat:@"Failed to lock instance mask"];
          v114 = v63;
          v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
          v65 = [v62 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v64];
          id v66 = *a5;
          *a5 = v65;

          id v45 = 0;
LABEL_49:
          v42 = 0;
LABEL_50:

          goto LABEL_51;
        }
        int Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v27 instanceMask]);
        int Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v27 instanceMask]);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v27 instanceMask]);
        pixelBuffer = (__CVBuffer *)v39;
        BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v27 instanceMask]);
        int v72 = (int)(v35 * (double)(Width - 1));
        int v102 = (int)((1.0 - v37) * (double)(Height - 1));
        size_t v73 = BytesPerRow * v102 + v72;
        int v74 = Height;
        uint64_t v75 = BaseAddress[v73];
        if (BaseAddress[v73])
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v76 = VCPLogInstance();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v110 = 67109632;
              *(_DWORD *)v111 = v75;
              *(_WORD *)&v111[4] = 1024;
              *(_DWORD *)&v111[6] = (int)(v35 * (double)(Width - 1));
              LOWORD(v112) = 1024;
              *(_DWORD *)((char *)&v112 + 2) = v102;
              v77 = "[RMBG] Selecting instance %d at location (%d, %d)";
LABEL_85:
              _os_log_impl(&dword_1BBEDA000, v76, OS_LOG_TYPE_DEFAULT, v77, v110, 0x14u);
              goto LABEL_86;
            }
            goto LABEL_86;
          }
        }
        else
        {
          v99 = BaseAddress;
          int v100 = v74;
          int v101 = Width;
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v78 = VCPLogInstance();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v110 = 67109376;
              *(_DWORD *)v111 = v72;
              *(_WORD *)&v111[4] = 1024;
              *(_DWORD *)&v111[6] = v102;
              _os_log_impl(&dword_1BBEDA000, v78, OS_LOG_TYPE_DEFAULT, "[RMBG] No instance at (%d, %d), searching nearby", v110, 0xEu);
            }
          }
          int v79 = 0;
          uint64_t v75 = 0;
          int v80 = v100 - 50;
          if (v102 - 25 < v100 - 50) {
            int v80 = v102 - 25;
          }
          if (v102 <= 25) {
            int v81 = 0;
          }
          else {
            int v81 = v80;
          }
          int v82 = v101 - 50;
          if (v72 - 25 < v101 - 50) {
            int v82 = v72 - 25;
          }
          if (v72 <= 25) {
            int v83 = 0;
          }
          else {
            int v83 = v82;
          }
          size_t v84 = (size_t)&v99[BytesPerRow * v81 + v83];
          int v85 = v81 - v102;
          int v86 = v83 - v72;
          int v87 = 0x7FFFFFFF;
          do
          {
            for (uint64_t i = 0; i != 50; ++i)
            {
              int v89 = (v85 + v79) * (v85 + v79) + (v86 + i) * (v86 + i);
              if (v89 >= v87) {
                uint64_t v90 = v75;
              }
              else {
                uint64_t v90 = *(unsigned __int8 *)(v84 + i);
              }
              if (v89 >= v87) {
                int v89 = v87;
              }
              if (*(unsigned char *)(v84 + i))
              {
                uint64_t v75 = v90;
                int v87 = v89;
              }
            }
            ++v79;
            v84 += BytesPerRow;
          }
          while (v79 != 50);
          if (!v75)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v93 = VCPLogInstance();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v110 = 134218240;
                *(double *)v111 = v35;
                *(_WORD *)&v111[8] = 2048;
                double v112 = v37;
                _os_log_impl(&dword_1BBEDA000, v93, OS_LOG_TYPE_ERROR, "[RMBG] No instances near specified point (%0.2f, %0.2f)", v110, 0x16u);
              }
            }
            v94 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v108 = *MEMORY[0x1E4F28568];
            v95 = [NSString stringWithFormat:@"No instances near specified point (%0.2f, %0.2f)", *(void *)&v35, *(void *)&v37];
            v109 = v95;
            v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
            v97 = [v94 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v96];
            id v98 = *a5;
            *a5 = v97;

            char v91 = 0;
            id v45 = 0;
LABEL_88:
            CVReturn v92 = CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
            if (v92 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v110 = 134218240;
              *(void *)v111 = pixelBuffer;
              *(_WORD *)&v111[8] = 1024;
              LODWORD(v112) = v92;
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to unlock CVPixelBuffer (%p, %d)", v110, 0x12u);
            }
            if ((v91 & 1) == 0) {
              goto LABEL_49;
            }
LABEL_41:
            id v106 = v23;
            v42 = (__CVBuffer *)[v27 createMaskForInstances:v45 error:&v106];
            id v59 = v106;

            if (v42)
            {
              [v105 reset];
            }
            else
            {
              v60 = (void *)[v59 copy];
              id v61 = *a5;
              *a5 = v60;

              v42 = 0;
            }
            id v23 = v59;
            goto LABEL_50;
          }
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v76 = VCPLogInstance();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v110 = 67109632;
              *(_DWORD *)v111 = v75;
              *(_WORD *)&v111[4] = 1024;
              *(_DWORD *)&v111[6] = v72;
              LOWORD(v112) = 1024;
              *(_DWORD *)((char *)&v112 + 2) = v102;
              v77 = "[RMBG] Selecting instance %d near location (%d, %d)";
              goto LABEL_85;
            }
LABEL_86:
          }
        }
        id v45 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v75];
        char v91 = 1;
        goto LABEL_88;
      }
    }
    __int16 v54 = [v27 allInstances];
    unint64_t v55 = [v54 count];
    v56 = @"only instance";
    if (v55 > 1) {
      v56 = @"all instances";
    }
    uint64_t v57 = v56;

    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v58 = VCPLogInstance();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMSampleTimingInfo buf = 138412290;
        *(void *)v116 = v57;
        _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_DEFAULT, "[RMBG] Selecting %@", buf, 0xCu);
      }
    }
    id v45 = [v27 allInstances];

    goto LABEL_41;
  }
  CGRect v41 = (void *)[v23 copy];
  v42 = 0;
  BOOL v27 = *a5;
  *a5 = v41;
LABEL_51:

  return v42;
}

- (CGRect)scaleNormalizedCropRect:(CGRect)a3 forPixelBuffer:(__CVBuffer *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = (double)CVPixelBufferGetWidth(a4);
  double v10 = (double)CVPixelBufferGetHeight(a4);
  double v11 = round(x * v9);
  double v12 = round((1.0 - y - height) * v10);
  double v13 = round(width * v9);
  double v14 = round(height * v10);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  double v17 = v9;
  return CGRectIntersection(*(CGRect *)&v11, *(CGRect *)&v15);
}

- (id)processPastSampleBuffers:(id)a3 orientation:(unsigned int)a4 maskPixelBuffer:(__CVBuffer *)a5 cropUnion:(CGRect *)a6 progress:(id)a7 error:(id *)a8
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v67 = a7;
  context = (void *)MEMORY[0x1C186D320]();
  double v13 = +[MADVideoRemoveBackgroundResource sharedResource];
  v71 = [v13 session];

  uint64_t v78 = 0;
  long long v77 = kMaskUpdateInterval;
  int v72 = (void *)[objc_alloc(MEMORY[0x1E4F45980]) initWithFrameUpdateSpacing:&v77 mask:a5 completionHandler:0];
  [v72 setGenerateCropRect:1];
  v65 = [MEMORY[0x1E4F1CA48] array];
  v64 = objc_alloc_init(MADConfidenceTracker);
  uint64_t v69 = *MEMORY[0x1E4F28760];
  uint64_t v70 = *MEMORY[0x1E4F28568];
  do
  {
    if (![v12 count]) {
      goto LABEL_39;
    }
    double v14 = (void *)MEMORY[0x1C186D320]();
    if ([(MADVideoRemoveBackgroundCropTask *)self isCanceled])
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v81 = v70;
      uint64_t v16 = [NSString stringWithFormat:@"Request canceled"];
      v82[0] = v16;
      double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:&v81 count:1];
      os_signpost_id_t v18 = [v15 errorWithDomain:v69 code:-128 userInfo:v17];
      id v19 = *a8;
      *a8 = v18;

      int v20 = 1;
    }
    else
    {
      int v21 = [v12 lastObject];

      memset(&v76, 0, sizeof(v76));
      CMSampleBufferGetPresentationTimeStamp(&v76, (CMSampleBufferRef)v21);
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        char v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)CMSampleTimingInfo buf = 134218240;
          *(void *)&uint8_t buf[4] = v76.value;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v76.timescale;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_INFO, "[RMBG][BW] Tracking mask %lld/%d", buf, 0x12u);
        }
      }
      id v23 = objc_alloc(MEMORY[0x1E4F45890]);
      v24 = (void *)[v23 initWithCMSampleBuffer:v21 orientation:a4 options:MEMORY[0x1E4F1CC08] session:v71];
      id v25 = VCPSignPostLog();
      os_signpost_id_t v26 = os_signpost_id_generate(v25);

      BOOL v27 = VCPSignPostLog();
      v28 = v27;
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)CMSampleTimingInfo buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VNTrackMaskRequest_PerformRequest", "", buf, 2u);
      }

      int v80 = v72;
      BOOL v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
      id v75 = 0;
      char v30 = [v24 performRequests:v29 error:&v75];
      id v31 = v75;

      if (v30)
      {
        BOOL v32 = VCPSignPostLog();
        id v33 = v32;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)CMSampleTimingInfo buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_END, v26, "VNTrackMaskRequest_PerformRequest", "", buf, 2u);
        }

        double v34 = [v72 results];
        double v35 = [v34 firstObject];

        if (v35)
        {
          if (+[MADVideoRemoveBackgroundSettings visionTrimEnabled](MADVideoRemoveBackgroundSettings, "visionTrimEnabled")&& ([v35 confidence], -[MADConfidenceTracker updateConfidence:](v64, "updateConfidence:", v36), double v38 = v37, +[MADVideoRemoveBackgroundSettings visionTrimThreshold](MADVideoRemoveBackgroundSettings, "visionTrimThreshold"), v38 < v39))
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v60 = VCPLogInstance();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CMSampleTimingInfo buf = 134218240;
                *(void *)&uint8_t buf[4] = v76.value;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v76.timescale;
                _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEFAULT, "[RMBG][BW] Confidence below threshold (%lld/%d), trimming", buf, 0x12u);
              }
            }
            [v12 removeAllObjects];
            int v20 = 3;
          }
          else
          {
            CGFloat x = a6->origin.x;
            CGFloat y = a6->origin.y;
            CGFloat width = a6->size.width;
            CGFloat height = a6->size.height;
            [v35 croppedBoundingBox];
            -[MADVideoRemoveBackgroundCropTask scaleNormalizedCropRect:forPixelBuffer:](self, "scaleNormalizedCropRect:forPixelBuffer:", [v35 pixelBuffer], v44, v45, v46, v47);
            v85.origin.CGFloat x = v48;
            v85.origin.CGFloat y = v49;
            v85.size.CGFloat width = v50;
            v85.size.CGFloat height = v51;
            v84.origin.CGFloat x = x;
            v84.origin.CGFloat y = y;
            v84.size.CGFloat width = width;
            v84.size.CGFloat height = height;
            *a6 = CGRectUnion(v84, v85);
            v52 = [MADMattedFullFrame alloc];
            uint64_t v53 = [v35 pixelBuffer];
            [v35 timeRange];
            long long v73 = *(_OWORD *)buf;
            uint64_t v74 = *(void *)&buf[16];
            [v35 confidence];
            unint64_t v55 = [(MADMattedFullFrame *)v52 initWithPixelBuffer:v53 presentationTimestamp:&v73 confidence:v54];
            [v65 addObject:v55];

            [v12 removeLastObject];
            objc_msgSend(v67, "setCompletedUnitCount:", objc_msgSend(v67, "completedUnitCount") + 1);
            int v20 = 0;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            id v59 = VCPLogInstance();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMSampleTimingInfo buf = 134218240;
              *(void *)&uint8_t buf[4] = v76.value;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v76.timescale;
              _os_log_impl(&dword_1BBEDA000, v59, OS_LOG_TYPE_DEFAULT, "[RMBG][BW] No observation at time %lld/%d", buf, 0x12u);
            }
          }
          int v20 = 2;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v56 = VCPLogInstance();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v57 = [v31 description];
            *(_DWORD *)CMSampleTimingInfo buf = 138412290;
            *(void *)&uint8_t buf[4] = v57;
            _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_ERROR, "[RMBG][BW] VNTrackMaskRequest failed (%@)", buf, 0xCu);
          }
        }
        v58 = (void *)[v31 copy];
        double v35 = *a8;
        *a8 = v58;
        int v20 = 1;
      }
    }
  }
  while (!v20 || v20 == 2);
  if (v20 == 3)
  {
LABEL_39:
    id v61 = v65;
    goto LABEL_41;
  }
  id v61 = 0;
LABEL_41:

  return v61;
}

- (BOOL)exportPastSamples:(id)a3 sequenceWriter:(id)a4 progress:(id)a5 error:(id *)a6
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v40 = a4;
  id v39 = a5;
  uint64_t v11 = *MEMORY[0x1E4F28760];
  uint64_t v41 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v12 = [v10 count];
    if (!v12) {
      break;
    }
    double v13 = (void *)MEMORY[0x1C186D320]();
    if ([(MADVideoRemoveBackgroundCropTask *)self isCanceled])
    {
      double v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = v41;
      uint64_t v15 = [NSString stringWithFormat:@"Request canceled"];
      v56[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      double v17 = [v14 errorWithDomain:v11 code:-128 userInfo:v16];
      id v18 = *a6;
      *a6 = v17;
    }
    else
    {
      uint64_t v15 = [v10 lastObject];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          if (v15)
          {
            [v15 presentationTimestamp];
            uint64_t v20 = *(void *)v46;
            [v15 presentationTimestamp];
            int v21 = v44;
          }
          else
          {
            int v21 = 0;
            uint64_t v20 = 0;
            *(void *)double v46 = 0;
            uint64_t v47 = 0;
            uint64_t v48 = 0;
            uint64_t v43 = 0;
            uint64_t v44 = 0;
            uint64_t v45 = 0;
          }
          *(_DWORD *)CMSampleTimingInfo buf = 134218240;
          uint64_t v52 = v20;
          __int16 v53 = 1024;
          int v54 = v21;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_INFO, "[RMBG] Encoding %lld/%d", buf, 0x12u);
        }
      }
      char v22 = VCPSignPostLog();
      os_signpost_id_t v23 = os_signpost_id_generate(v22);

      v24 = VCPSignPostLog();
      id v25 = v24;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)double v46 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "MADVideoRemoveBackground_ExportFrame", "", v46, 2u);
      }

      uint64_t v26 = [v15 pixelBuffer];
      if (v15) {
        [v15 presentationTimestamp];
      }
      else {
        memset(v42, 0, sizeof(v42));
      }
      if (![v40 addPixelBuffer:v26 withTime:v42])
      {
        id v31 = VCPSignPostLog();
        BOOL v32 = v31;
        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)double v46 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v32, OS_SIGNPOST_INTERVAL_END, v23, "MADVideoRemoveBackground_ExportFrame", "", v46, 2u);
        }

        [v10 removeLastObject];
        objc_msgSend(v39, "setCompletedUnitCount:", objc_msgSend(v39, "completedUnitCount") + 1);
        char v33 = 1;
        goto LABEL_28;
      }
      BOOL v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = v41;
      v28 = NSString;
      if (v15)
      {
        [v15 presentationTimestamp];
        uint64_t v29 = *(void *)v46;
        [v15 presentationTimestamp];
        uint64_t v30 = v44;
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v29 = 0;
        *(void *)double v46 = 0;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        uint64_t v45 = 0;
      }
      double v34 = objc_msgSend(v28, "stringWithFormat:", @"Failed to export matted frame (%lld/%d)", v29, v30);
      CGFloat v50 = v34;
      double v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      float v36 = [v27 errorWithDomain:v11 code:-18 userInfo:v35];
      id v37 = *a6;
      *a6 = v36;
    }
    char v33 = 0;
LABEL_28:
  }
  while ((v33 & 1) != 0);

  return v12 == 0;
}

- (id)processFutureSamplesFromTrackOutput:(id)a3 baseTime:(id *)a4 orientation:(unsigned int)a5 maskSampleBuffer:(opaqueCMSampleBuffer *)a6 maskPixelBuffer:(__CVBuffer *)a7 cropUnion:(CGRect *)a8 endTime:(id *)a9 progress:(id)a10 error:(id *)a11
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  id v98 = a10;
  context = (void *)MEMORY[0x1C186D320]();
  double v14 = +[MADVideoRemoveBackgroundResource sharedResource];
  v93 = [v14 session];

  uint64_t v105 = 0;
  long long v104 = kMaskUpdateInterval;
  v94 = (void *)[objc_alloc(MEMORY[0x1E4F45980]) initWithFrameUpdateSpacing:&v104 mask:a7 completionHandler:0];
  uint64_t v15 = (void *)MEMORY[0x1C186D320]([v94 setGenerateCropRect:1]);
  id v16 = objc_alloc(MEMORY[0x1E4F45890]);
  double v17 = (void *)[v16 initWithCMSampleBuffer:a6 orientation:a5 options:MEMORY[0x1E4F1CC08] session:v93];
  id v18 = VCPSignPostLog();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v20 = VCPSignPostLog();
  int v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(buf.duration.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VNTrackMaskRequest_PerformRequest", "", (uint8_t *)&buf, 2u);
  }

  v116[0] = v94;
  char v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:1];
  id v103 = 0;
  int v23 = [v17 performRequests:v22 error:&v103];
  id v24 = v103;

  if (v23)
  {
    id v25 = VCPSignPostLog();
    uint64_t v26 = v25;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      LOWORD(buf.duration.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, v19, "VNTrackMaskRequest_PerformRequest", "", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    BOOL v27 = (void *)[v24 copy];
    uint64_t v26 = *a11;
    *a11 = v27;
  }

  v28 = v94;
  if (v23)
  {
    int64_t var0 = a4->var0;
    int v87 = [MEMORY[0x1E4F1CA48] array];
    int v86 = objc_alloc_init(MADConfidenceTracker);
    uint64_t v96 = *MEMORY[0x1E4F28760];
    uint64_t v97 = *MEMORY[0x1E4F28568];
    while (1)
    {
      uint64_t v29 = (void *)MEMORY[0x1C186D320]();
      if ([(MADVideoRemoveBackgroundCropTask *)self isCanceled])
      {
        uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v114 = v97;
        id v31 = [NSString stringWithFormat:@"Request canceled"];
        v115 = v31;
        BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        char v33 = [v30 errorWithDomain:v96 code:-128 userInfo:v32];
        id v34 = *a11;
        *a11 = v33;

        int v35 = 1;
        goto LABEL_63;
      }
      float v36 = (opaqueCMSampleBuffer *)[v95 copyNextSampleBuffer];
      CMSampleBufferRef originalSBuf = v36;
      if (v36)
      {
        memset(&presentationTimeStamp, 0, sizeof(presentationTimeStamp));
        CMSampleBufferGetPresentationTimeStamp(&presentationTimeStamp, v36);
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v37 = VCPLogInstance();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf.duration.value) = 134218240;
            *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
            LOWORD(buf.duration.flags) = 1024;
            *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
            _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_INFO, "[RMBG][FW] Decoded %lld/%d", (uint8_t *)&buf, 0x12u);
          }
        }
        objc_msgSend(v98, "setCompletedUnitCount:", objc_msgSend(v98, "completedUnitCount") + 1);
        if (!var0) {
          goto LABEL_35;
        }
        memset(&buf.presentationTimeStamp, 0, 48);
        double v38 = (CMTime *)MEMORY[0x1E4F1F9F8];
        *(_OWORD *)&buf.duration.value = *MEMORY[0x1E4F1F9F8];
        buf.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        *(CMTime *)lhs = presentationTimeStamp;
        CMTime rhs = (CMTime)*a4;
        CMTimeSubtract(&buf.presentationTimeStamp, (CMTime *)lhs, &rhs);
        buf.decodeTimeStamp = *v38;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v39 = VCPLogInstance();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)lhs = 134218752;
            *(void *)&lhs[4] = presentationTimeStamp.value;
            *(_WORD *)&lhs[12] = 1024;
            *(_DWORD *)&lhs[14] = presentationTimeStamp.timescale;
            *(_WORD *)&lhs[18] = 2048;
            *(void *)&lhs[20] = buf.presentationTimeStamp.value;
            __int16 v111 = 1024;
            CMTimeScale timescale = buf.presentationTimeStamp.timescale;
            _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_INFO, "[RMBG][FW] Adjusting time %lld/%d --> %lld/%d", lhs, 0x22u);
          }
        }
        rhs.value = 0;
        if (!CMSampleBufferCreateCopyWithNewTiming(0, originalSBuf, 1, &buf, (CMSampleBufferRef *)&rhs))
        {
          value = (opaqueCMSampleBuffer *)rhs.value;
          if (rhs.value) {
            value = (opaqueCMSampleBuffer *)CFRetain((CFTypeRef)rhs.value);
          }
          *(void *)lhs = value;
          if (originalSBuf)
          {
            CFRelease(originalSBuf);
            value = *(opaqueCMSampleBuffer **)lhs;
          }
          CMSampleBufferRef originalSBuf = value;
          *(void *)lhs = 0;
          CF<opaqueCMSampleBuffer *>::~CF((const void **)lhs);
          CMTime presentationTimeStamp = buf.presentationTimeStamp;
          CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
LABEL_35:
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v47 = VCPLogInstance();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf.duration.value) = 134218240;
              *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
              LOWORD(buf.duration.flags) = 1024;
              *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
              _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_INFO, "[RMBG][FW] Tracking mask %lld/%d", (uint8_t *)&buf, 0x12u);
            }
          }
          id v48 = objc_alloc(MEMORY[0x1E4F45890]);
          uint64_t v49 = (void *)[v48 initWithCMSampleBuffer:originalSBuf orientation:a5 options:MEMORY[0x1E4F1CC08] session:v93];
          CGFloat v50 = VCPSignPostLog();
          os_signpost_id_t v51 = os_signpost_id_generate(v50);

          uint64_t v52 = VCPSignPostLog();
          __int16 v53 = v52;
          if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
          {
            LOWORD(buf.duration.value) = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "VNTrackMaskRequest_PerformRequest", "", (uint8_t *)&buf, 2u);
          }

          id v107 = v94;
          int v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
          id v100 = 0;
          char v55 = [v49 performRequests:v54 error:&v100];
          id v56 = v100;

          if (v55)
          {
            uint64_t v57 = VCPSignPostLog();
            v58 = v57;
            if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
            {
              LOWORD(buf.duration.value) = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v58, OS_SIGNPOST_INTERVAL_END, v51, "VNTrackMaskRequest_PerformRequest", "", (uint8_t *)&buf, 2u);
            }

            id v59 = [v94 results];
            v60 = [v59 firstObject];

            if (v60)
            {
              objc_msgSend(v98, "setCompletedUnitCount:", objc_msgSend(v98, "completedUnitCount") + 1);
              if (+[MADVideoRemoveBackgroundSettings visionTrimEnabled](MADVideoRemoveBackgroundSettings, "visionTrimEnabled")&& ([v60 confidence], -[MADConfidenceTracker updateConfidence:](v86, "updateConfidence:", v61), double v63 = v62, +[MADVideoRemoveBackgroundSettings visionTrimThreshold](MADVideoRemoveBackgroundSettings, "visionTrimThreshold"), v63 < v64))
              {
                if ((int)MediaAnalysisLogLevel() >= 5)
                {
                  int v83 = VCPLogInstance();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf.duration.value) = 134218240;
                    *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
                    LOWORD(buf.duration.flags) = 1024;
                    *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
                    _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_DEFAULT, "[RMBG][FW] Confidence below threshold (%lld/%d), trimming", (uint8_t *)&buf, 0x12u);
                  }
                }
                *(CMTime *)a9 = presentationTimeStamp;
                int v35 = 5;
              }
              else
              {
                CGFloat x = a8->origin.x;
                CGFloat y = a8->origin.y;
                CGFloat width = a8->size.width;
                CGFloat height = a8->size.height;
                [v60 croppedBoundingBox];
                -[MADVideoRemoveBackgroundCropTask scaleNormalizedCropRect:forPixelBuffer:](self, "scaleNormalizedCropRect:forPixelBuffer:", [v60 pixelBuffer], v69, v70, v71, v72);
                v119.origin.CGFloat x = v73;
                v119.origin.CGFloat y = v74;
                v119.size.CGFloat width = v75;
                v119.size.CGFloat height = v76;
                v118.origin.CGFloat x = x;
                v118.origin.CGFloat y = y;
                v118.size.CGFloat width = width;
                v118.size.CGFloat height = height;
                *a8 = CGRectUnion(v118, v119);
                long long v77 = [MADMattedFullFrame alloc];
                uint64_t v78 = [v60 pixelBuffer];
                CMTime v99 = presentationTimeStamp;
                [v60 confidence];
                int v80 = [(MADMattedFullFrame *)v77 initWithPixelBuffer:v78 presentationTimestamp:&v99 confidence:v79];
                [v87 addObject:v80];

                int v35 = 0;
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                int v82 = VCPLogInstance();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf.duration.value) = 134218240;
                  *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
                  LOWORD(buf.duration.flags) = 1024;
                  *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
                  _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_DEFAULT, "[RMBG][FW] No observation at time %lld/%d", (uint8_t *)&buf, 0x12u);
                }
              }
              int v35 = 4;
            }
          }
          else
          {
            uint64_t v81 = (void *)[v56 copy];
            v60 = *a11;
            *a11 = v81;
            int v35 = 1;
          }

          goto LABEL_62;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)lhs = 134218240;
            *(void *)&lhs[4] = presentationTimeStamp.value;
            *(_WORD *)&lhs[12] = 1024;
            *(_DWORD *)&lhs[14] = presentationTimeStamp.timescale;
            _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_ERROR, "[RMBG][FW] Failed to adjust sample timing (%lld/%d)", lhs, 0x12u);
          }
        }
        uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v108 = v97;
        v42 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to adjust sample timing (%lld/%d)", presentationTimeStamp.value, presentationTimeStamp.timescale);
        v109 = v42;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
        uint64_t v44 = [v41 errorWithDomain:v96 code:-18 userInfo:v43];
        id v45 = *a11;
        *a11 = v44;

        CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
        int v35 = 1;
      }
      else
      {
        int v35 = 5;
      }
LABEL_62:
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&originalSBuf);
LABEL_63:
      if (v35 && v35 != 4)
      {
        if (v35 == 5) {
          id v84 = v87;
        }
        else {
          id v84 = 0;
        }

        v28 = v94;
        goto LABEL_70;
      }
    }
  }
  id v84 = 0;
LABEL_70:

  return v84;
}

- (BOOL)isAnimatedStickerPreferredWithPastSamples:(id)a3 futureSamples:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = +[MADVideoRemoveBackgroundSettings visionTrimWindow];
  uint64_t v8 = [v5 count];
  if ([v6 count] + v8 <= 2 * v7)
  {
    LOBYTE(v21) = 0;
  }
  else
  {
    +[MADVideoRemoveBackgroundSettings visionPreferredVideoQualityThreshold];
    double v10 = v9;
    +[MADVideoRemoveBackgroundSettings visionPreferredLowQualityProportionThreshold];
    double v12 = v11;
    +[MADVideoRemoveBackgroundSettings visionPreferredWorstFrameScoreThreshold];
    double v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    double v17 = 1.0;
    while (v7 + v16 < [v5 count])
    {
      id v18 = [v5 objectAtIndexedSubscript:v16];
      [v18 confidence];
      double v20 = v19;

      if (v20 < v17) {
        double v17 = v20;
      }
      if (v20 < v10) {
        ++v15;
      }
      ++v16;
    }
    for (uint64_t i = 0; v7 + i < [v6 count]; ++i)
    {
      int v23 = [v6 objectAtIndexedSubscript:i];
      [v23 confidence];
      double v25 = v24;

      if (v25 < v17) {
        double v17 = v25;
      }
      if (v25 < v10) {
        ++v15;
      }
    }
    uint64_t v26 = [v5 count];
    double v27 = (double)v15 / (double)(unint64_t)([v6 count] + v26);
    BOOL v21 = v27 <= v12 && v17 >= v14;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v30[0] = 67110400;
        v30[1] = v21;
        __int16 v31 = 2048;
        double v32 = v27;
        __int16 v33 = 2048;
        double v34 = v10;
        __int16 v35 = 2048;
        double v36 = v12;
        __int16 v37 = 2048;
        double v38 = v17;
        __int16 v39 = 2048;
        double v40 = v14;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "[RMBG] Vision Preferred: %d - low quality proportion: %0.3f (th_v: %0.3f, th_prop: %0.3f), worst frame score: %0.3f (th_wfs: %0.3f)", (uint8_t *)v30, 0x3Au);
      }
    }
  }

  return v21;
}

- (BOOL)exportFutureSamples:(id)a3 sequenceWriter:(id)a4 progress:(id)a5 error:(id *)a6
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v40 = a4;
  id v39 = a5;
  uint64_t v11 = *MEMORY[0x1E4F28760];
  uint64_t v41 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v12 = [v10 count];
    if (!v12) {
      break;
    }
    double v13 = (void *)MEMORY[0x1C186D320]();
    if ([(MADVideoRemoveBackgroundCropTask *)self isCanceled])
    {
      double v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = v41;
      unint64_t v15 = [NSString stringWithFormat:@"Request canceled"];
      v56[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      double v17 = [v14 errorWithDomain:v11 code:-128 userInfo:v16];
      id v18 = *a6;
      *a6 = v17;
    }
    else
    {
      unint64_t v15 = [v10 firstObject];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        double v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          if (v15)
          {
            [v15 presentationTimestamp];
            uint64_t v20 = *(void *)v46;
            [v15 presentationTimestamp];
            int v21 = v44;
          }
          else
          {
            int v21 = 0;
            uint64_t v20 = 0;
            *(void *)double v46 = 0;
            uint64_t v47 = 0;
            uint64_t v48 = 0;
            uint64_t v43 = 0;
            uint64_t v44 = 0;
            uint64_t v45 = 0;
          }
          *(_DWORD *)CMSampleTimingInfo buf = 134218240;
          uint64_t v52 = v20;
          __int16 v53 = 1024;
          int v54 = v21;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_INFO, "[RMBG] Encoding %lld/%d", buf, 0x12u);
        }
      }
      char v22 = VCPSignPostLog();
      os_signpost_id_t v23 = os_signpost_id_generate(v22);

      double v24 = VCPSignPostLog();
      double v25 = v24;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)double v46 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "MADVideoRemoveBackground_ExportFrame", "", v46, 2u);
      }

      uint64_t v26 = [v15 pixelBuffer];
      if (v15) {
        [v15 presentationTimestamp];
      }
      else {
        memset(v42, 0, sizeof(v42));
      }
      if (![v40 addPixelBuffer:v26 withTime:v42])
      {
        __int16 v31 = VCPSignPostLog();
        double v32 = v31;
        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)double v46 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v32, OS_SIGNPOST_INTERVAL_END, v23, "MADVideoRemoveBackground_ExportFrame", "", v46, 2u);
        }

        [v10 removeObjectAtIndex:0];
        objc_msgSend(v39, "setCompletedUnitCount:", objc_msgSend(v39, "completedUnitCount") + 1);
        char v33 = 1;
        goto LABEL_28;
      }
      double v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = v41;
      v28 = NSString;
      if (v15)
      {
        [v15 presentationTimestamp];
        uint64_t v29 = *(void *)v46;
        [v15 presentationTimestamp];
        uint64_t v30 = v44;
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v29 = 0;
        *(void *)double v46 = 0;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        uint64_t v45 = 0;
      }
      double v34 = objc_msgSend(v28, "stringWithFormat:", @"Failed to export matted frame (%lld/%d)", v29, v30);
      CGFloat v50 = v34;
      __int16 v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      double v36 = [v27 errorWithDomain:v11 code:-18 userInfo:v35];
      id v37 = *a6;
      *a6 = v36;
    }
    char v33 = 0;
LABEL_28:
  }
  while ((v33 & 1) != 0);

  return v12 == 0;
}

- (id)compressSequenceData:(id)a3 sequenceWriter:(id)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v39 = a4;
  double v9 = [(MADVideoRemoveBackgroundRequest *)self->_request maxFileSize];
  unint64_t v38 = [v9 unsignedIntegerValue];

  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMSampleTimingInfo buf = 67109376;
      int v48 = [v41 length];
      __int16 v49 = 1024;
      int v50 = v38;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "[RMBG] Output exceeds max file size (%d > %d); compressing...",
        buf,
        0xEu);
    }
  }
  uint64_t v11 = [(MADVideoRemoveBackgroundRequest *)self->_request minDimension];
  if (v11)
  {
    uint64_t v12 = [(MADVideoRemoveBackgroundRequest *)self->_request minDimension];
    unint64_t v13 = [v12 unsignedIntegerValue];
  }
  else
  {
    unint64_t v13 = 300;
  }

  double v14 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v15 = [NSNumber numberWithUnsignedInteger:v13];
  double v36 = [v14 arrayWithObject:v15];

  unint64_t v16 = *a5;
  if (*a5 <= *a6) {
    unint64_t v16 = *a6;
  }
  if (v16 >= 0x259 && v13 <= 0x257) {
    [v36 insertObject:&unk_1F15EB7D8 atIndex:0];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v36;
  uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v17) {
    goto LABEL_40;
  }
  uint64_t v18 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v43 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        int v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = [v20 intValue];
          *(_DWORD *)CMSampleTimingInfo buf = 67109120;
          int v48 = v22;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "[RMBG] Transcoding to max dimension %d", buf, 8u);
        }
      }
      os_signpost_id_t v23 = VCPSignPostLog();
      os_signpost_id_t v24 = os_signpost_id_generate(v23);

      double v25 = VCPSignPostLog();
      uint64_t v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)CMSampleTimingInfo buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "MADVideoRemoveBackground_ReEncode", "", buf, 2u);
      }

      double v27 = objc_msgSend((id)objc_opt_class(), "transcodeSequenceData:maxDimension:outputWidth:outputHeight:", v41, objc_msgSend(v20, "unsignedIntegerValue"), a5, a6);
      v28 = VCPSignPostLog();
      uint64_t v29 = v28;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)CMSampleTimingInfo buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_END, v24, "MADVideoRemoveBackground_ReEncode", "", buf, 2u);
      }

      if (!v27)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_38;
        }
        uint64_t v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CMSampleTimingInfo buf = 0;
          double v32 = v30;
          char v33 = "[RMBG] Failed to transcode sequence";
          uint32_t v34 = 2;
LABEL_36:
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
        }
LABEL_37:

        goto LABEL_38;
      }
      if ([v27 length] <= v38) {
        goto LABEL_41;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          int v31 = [v27 length];
          *(_DWORD *)CMSampleTimingInfo buf = 67109376;
          int v48 = v31;
          __int16 v49 = 1024;
          int v50 = v38;
          double v32 = v30;
          char v33 = "[RMBG] Transcoded output exceeds max file size (%d vs %d)";
          uint32_t v34 = 14;
          goto LABEL_36;
        }
        goto LABEL_37;
      }
LABEL_38:
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v17);
LABEL_40:
  double v27 = 0;
LABEL_41:

  return v27;
}

- (void)publishPreviewResultsTimeRange:(id *)a3 pastSamples:(id)a4 futureSamples:(id)a5 cropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  long long v45 = self;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v47 = a5;
  int v48 = v11;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unint64_t v13 = [v11 reverseObjectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v58 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x1C186D320]();
        double v19 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v17 pixelBuffer]);
        id v20 = objc_alloc(MEMORY[0x1E4F74760]);
        if (v17) {
          [v17 presentationTimestamp];
        }
        else {
          memset(v56, 0, sizeof(v56));
        }
        int v21 = objc_msgSend(v20, "initWithPresentationTimeStamp:surface:", v56, v19, v45);
        [v12 addObject:v21];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v14);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v22 = v47;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v53 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        double v27 = (void *)MEMORY[0x1C186D320]();
        v28 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v26 pixelBuffer]);
        id v29 = objc_alloc(MEMORY[0x1E4F74760]);
        if (v26) {
          [v26 presentationTimestamp];
        }
        else {
          memset(v51, 0, sizeof(v51));
        }
        uint64_t v30 = objc_msgSend(v29, "initWithPresentationTimeStamp:surface:", v51, v28, v45);
        [v12 addObject:v30];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v23);
  }

  if ([v48 count]) {
    [v48 lastObject];
  }
  else {
  int v31 = [v22 firstObject];
  }
  double v32 = (__CVBuffer *)[v31 pixelBuffer];

  if (v32)
  {
    int v33 = CVPixelBufferGetWidth(v32);
    int v34 = CVPixelBufferGetHeight(v32);
    v65.origin.double x = x / (double)v33;
    v65.origin.double y = 1.0 - (y + height) / (double)v34;
    v65.size.double width = width / (double)v33;
    v65.size.double height = height / (double)v34;
    v67.origin.double x = 0.0;
    v67.origin.double y = 0.0;
    v67.size.double width = 1.0;
    v67.size.double height = 1.0;
    CGRect v66 = CGRectIntersection(v65, v67);
    double v35 = v66.origin.x;
    double v36 = v66.origin.y;
    double v37 = v66.size.width;
    double v38 = v66.size.height;
  }
  else
  {
    double v37 = 1.0;
    double v35 = 0.0;
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v39 = VCPLogInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMSampleTimingInfo buf = 0;
        _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEFAULT, "[RMBG] Failed to normalize crop rect", buf, 2u);
      }
    }
    double v36 = 0.0;
    double v38 = 1.0;
  }
  id v40 = objc_alloc_init(MEMORY[0x1E4F74788]);
  id v41 = objc_alloc(MEMORY[0x1E4F74770]);
  long long v42 = *(_OWORD *)&a3->var0.var3;
  v49[0] = *(_OWORD *)&a3->var0.var0;
  v49[1] = v42;
  v49[2] = *(_OWORD *)&a3->var1.var1;
  long long v43 = objc_msgSend(v41, "initWithTimeRange:frames:normalizedCropRect:", v49, v12, v35, v36, v37, v38);
  float v61 = v43;
  long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  [v40 setResults:v44];

  (*((void (**)(void))v45->_resultHandler + 2))();
}

- (void)publishPayloadWidth:(unint64_t)a3 height:(unint64_t)a4 data:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F74788]);
  id v10 = objc_alloc(MEMORY[0x1E4F74780]);
  id v11 = [(MADVideoRemoveBackgroundRequest *)self->_request outputType];
  uint64_t v12 = (void *)[v10 initWithUniformTypeIdentifier:v11 width:a3 height:a4 data:v8];
  v14[0] = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v9 setResults:v13];

  (*((void (**)(void))self->_resultHandler + 2))();
}

- (BOOL)run:(id *)a3
{
  v288[1] = *MEMORY[0x1E4F143B8];
  if (-[MADVideoRemoveBackgroundCropTask validateRequest:](self, "validateRequest:"))
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    [v5 timeIntervalSince1970];
    double v7 = v6;

    id v8 = (void *)MEMORY[0x1E4F16330];
    id v9 = [(MADServiceVideoAsset *)self->_asset url];
    uint64_t v10 = [v8 assetWithURL:v9];

    v196 = (void *)v10;
    if (v10)
    {
      id v261 = 0;
      id v11 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v10 error:&v261];
      id v12 = v261;
      v194 = v12;
      v195 = v11;
      if (v11)
      {
        unint64_t v13 = objc_msgSend(v196, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E4F15C18]);
        v193 = v13;
        if (!v13)
        {
          if (a3)
          {
            id v22 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v285 = *MEMORY[0x1E4F28568];
            uint64_t v23 = [NSString stringWithFormat:@"Asset contains no video tracks"];
            v286 = v23;
            uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v286 forKeys:&v285 count:1];
            double v25 = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v24];
            id v26 = *a3;
            *a3 = v25;
          }
          goto LABEL_49;
        }
        memset(&v260, 0, sizeof(v260));
        [v13 timeRange];
        if (+[MADVideoRemoveBackgroundSettings autoplayTrimEnabled])
        {
          memset(&v275, 0, sizeof(v275));
          asset = self->_asset;
          if (asset
            && ([(MADServiceVideoAsset *)asset trimTimeRange], (v275.start.flags & 1) != 0)
            && (v275.duration.flags & 1) != 0
            && !v275.duration.epoch
            && (v275.duration.value & 0x8000000000000000) == 0
            && (time1 = v275.duration, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &time2)))
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              long long v54 = VCPLogInstance();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                CMTime start = v275.start;
                Float64 Seconds = CMTimeGetSeconds(&start);
                CMTimeRange v255 = v275;
                CMTimeRangeGetEnd(&v256, &v255);
                Float64 v56 = CMTimeGetSeconds(&v256);
                LODWORD(buf.start.value) = 134218240;
                *(Float64 *)((char *)&buf.start.value + 4) = Seconds;
                LOWORD(buf.start.flags) = 2048;
                *(Float64 *)((char *)&buf.start.flags + 2) = v56;
                _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_INFO, "[RMBG] Applying autoplay trim (%0.3fs-%0.3fs)", (uint8_t *)&buf, 0x16u);
              }
            }
            CMTimeRange v254 = v260;
            CMTimeRange otherRange = v275;
            CMTimeRangeGetIntersection(&buf, &v254, &otherRange);
            CMTimeRange v260 = buf;
          }
          else if ((int)MediaAnalysisLogLevel() >= 4)
          {
            uint64_t v15 = VCPLogInstance();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.start.value) = 0;
              _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "[RMBG] Autoplay trim range not available for asset", (uint8_t *)&buf, 2u);
            }
          }
        }
        memset(&v252, 0, sizeof(v252));
        request = self->_request;
        if (request)
        {
          [(MADVideoRemoveBackgroundRequest *)request maskTime];
          if (v275.start.flags)
          {
            uint64_t v17 = self->_request;
            if (v17)
            {
              [(MADVideoRemoveBackgroundRequest *)v17 maskTime];
LABEL_28:
              CMTimeRange range = v260;
              CMTime time = v252;
              if (CMTimeRangeContainsTime(&range, &time))
              {
                v191 = [(MADVideoRemoveBackgroundCropTask *)self decodeSettingsForTrack:v193];
                v28 = objc_msgSend(MEMORY[0x1E4F163A0], "assetReaderTrackOutputWithTrack:outputSettings:", v193);
                uint64_t v192 = (uint64_t)v28;
                if (v28)
                {
                  [v11 addOutput:v28];
                  CMTimeRange v245 = v260;
                  [v11 setTimeRange:&v245];
                  if ([v11 startReading])
                  {
                    unsigned int v184 = objc_msgSend(v193, "vcp_imageOrientation");
                    CMTimeRange v244 = v260;
                    uint64_t v188 = objc_msgSend(v193, "vcp_sampleCountForTimeRange:", &v244);
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      id v29 = VCPLogInstance();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                      {
                        LODWORD(v275.start.value) = 67109120;
                        HIDWORD(v275.start.value) = v188;
                        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_INFO, "[RMBG] Sample Count: %d", (uint8_t *)&v275, 8u);
                      }
                    }
                    id progressHandler = (void (**)(double))self->_progressHandler;
                    if (progressHandler) {
                      progressHandler[2](0.0);
                    }
                    int v31 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:3 * v188];
                    v241[0] = MEMORY[0x1E4F143A8];
                    v241[1] = 3221225472;
                    v241[2] = __40__MADVideoRemoveBackgroundCropTask_run___block_invoke;
                    v241[3] = &unk_1E62982E8;
                    id v190 = v31;
                    id v242 = v190;
                    v243 = self;
                    v187 = +[VCPTimer timerWithInterval:250 unit:2 oneShot:0 andBlock:v241];
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      double v32 = VCPLogInstance();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                      {
                        LOWORD(v275.start.value) = 0;
                        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEBUG, "[RMBG] Resetting cached mask state", (uint8_t *)&v275, 2u);
                      }
                    }
                    int v33 = +[MADImageRemoveBackgroundResource sharedResource];
                    [v33 setCachedMaskState:0];

                    int v34 = VCPSignPostLog();
                    os_signpost_id_t v35 = os_signpost_id_generate(v34);

                    double v36 = VCPSignPostLog();
                    double v37 = v36;
                    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
                    {
                      LOWORD(v275.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "MADVideoRemoveBackground_DecodePastFrames", "", (uint8_t *)&v275, 2u);
                    }

                    CMTime v240 = v252;
                    long long v238 = *(_OWORD *)&v260.start.value;
                    CMTimeEpoch epoch = v260.start.epoch;
                    double v38 = [(MADVideoRemoveBackgroundCropTask *)self decodeSamplesUntilTime:&v240 trackOutput:v192 baseTime:&v238 progress:v190 error:a3];
                    if (!v38)
                    {
                      BOOL v18 = 0;
                      goto LABEL_169;
                    }
                    v186 = v38;
                    if ([v11 status] == 3)
                    {
                      id v39 = [v11 error];
                      id v40 = *a3;
                      *a3 = v39;

                      BOOL v18 = 0;
LABEL_169:

                      int v48 = v242;
                      goto LABEL_170;
                    }
                    long long v57 = VCPSignPostLog();
                    long long v58 = v57;
                    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
                    {
                      LOWORD(v275.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v58, OS_SIGNPOST_INTERVAL_END, v35, "MADVideoRemoveBackground_DecodePastFrames", "", (uint8_t *)&v275, 2u);
                    }

                    long long v59 = [v186 lastObject];
                    CFTypeRef v237 = CFRetain(v59);

                    long long v60 = VCPSignPostLog();
                    os_signpost_id_t v61 = os_signpost_id_generate(v60);

                    double v62 = VCPSignPostLog();
                    double v63 = v62;
                    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
                    {
                      LOWORD(v275.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v63, OS_SIGNPOST_INTERVAL_BEGIN, v61, "MADVideoRemoveBackground_GenerateMask", "", (uint8_t *)&v275, 2u);
                    }

                    CFTypeRef cf = [(MADVideoRemoveBackgroundCropTask *)self generateMaskForSampleBuffer:v237 orientation:v184 error:a3];
                    double v38 = v186;
                    if (!cf)
                    {
                      BOOL v18 = 0;
LABEL_168:
                      CF<opaqueCMSampleBuffer *>::~CF(&cf);
                      CF<opaqueCMSampleBuffer *>::~CF(&v237);
                      goto LABEL_169;
                    }
                    uint64_t v64 = VCPSignPostLog();
                    CGRect v65 = v64;
                    if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
                    {
                      LOWORD(v275.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v65, OS_SIGNPOST_INTERVAL_END, v61, "MADVideoRemoveBackground_GenerateMask", "", (uint8_t *)&v275, 2u);
                    }

                    v177 = +[MADVideoRemoveBackgroundResource sharedResource];
                    CGRect v66 = +[VCPMADResourceManager sharedManager];
                    v179 = [v66 activateResource:v177];

                    v275.start.int value = 0;
                    *(void *)&v275.start.CMTimeScale timescale = &v275;
                    v275.start.CMTimeEpoch epoch = 0x5012000000;
                    v275.duration.int value = (CMTimeValue)__Block_byref_object_copy__11;
                    *(void *)&v275.duration.CMTimeScale timescale = __Block_byref_object_dispose__11;
                    v275.duration.CMTimeEpoch epoch = (CMTimeEpoch)&unk_1BC33760A;
                    uint64_t v67 = MEMORY[0x1E4F1DB20];
                    long long v68 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
                    long long v276 = *MEMORY[0x1E4F1DB20];
                    long long v277 = v68;
                    buf.start.int value = 0;
                    *(void *)&buf.start.CMTimeScale timescale = &buf;
                    buf.start.CMTimeEpoch epoch = 0x3032000000;
                    buf.duration.int value = (CMTimeValue)__Block_byref_object_copy__409;
                    *(void *)&buf.duration.CMTimeScale timescale = __Block_byref_object_dispose__410;
                    buf.duration.CMTimeEpoch epoch = 0;
                    uint64_t v230 = 0;
                    v231 = &v230;
                    uint64_t v232 = 0x3032000000;
                    v233 = __Block_byref_object_copy__409;
                    v234 = __Block_byref_object_dispose__410;
                    id v235 = 0;
                    group = dispatch_group_create();
                    double v69 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    v180 = dispatch_queue_create("trackMaskPastFrames", v69);

                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3321888768;
                    block[2] = __40__MADVideoRemoveBackgroundCropTask_run___block_invoke_412;
                    block[3] = &unk_1F159F128;
                    v225 = &v230;
                    block[4] = self;
                    unsigned int v229 = v184;
                    id v223 = v186;
                    CFTypeRef v228 = cf;
                    if (cf) {
                      CFRetain(cf);
                    }
                    v226 = &v275;
                    id v178 = v190;
                    id v224 = v178;
                    p_CMTimeRange buf = &buf;
                    dispatch_group_async(group, v180, block);
                    CGSize v70 = *(CGSize *)(v67 + 16);
                    r2.origin = *(CGPoint *)v67;
                    r2.size = v70;
                    memset(&v220, 0, sizeof(v220));
                    CMTimeRange v219 = v260;
                    CMTimeRangeGetEnd(&v220, &v219);
                    double v71 = VCPSignPostLog();
                    os_signpost_id_t v72 = os_signpost_id_generate(v71);

                    CGFloat v73 = VCPSignPostLog();
                    CGFloat v74 = v73;
                    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
                    {
                      *(_WORD *)v270 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "MADVideoRemoveBackground_ProcessFutureFrames", "", v270, 2u);
                    }

                    long long v217 = *(_OWORD *)&v260.start.value;
                    CMTimeEpoch v218 = v260.start.epoch;
                    v185 = [(MADVideoRemoveBackgroundCropTask *)self processFutureSamplesFromTrackOutput:v192 baseTime:&v217 orientation:v184 maskSampleBuffer:v237 maskPixelBuffer:cf cropUnion:&r2 endTime:&v220 progress:v178 error:a3];
                    CGFloat v75 = VCPSignPostLog();
                    CGFloat v76 = v75;
                    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                    {
                      *(_WORD *)v270 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v76, OS_SIGNPOST_INTERVAL_END, v72, "MADVideoRemoveBackground_ProcessFutureFrames", "", v270, 2u);
                    }

                    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
                    if (v185)
                    {
                      if (v231[5])
                      {
                        [v179 reset];
                        uint64_t v176 = [v185 count];
                        uint64_t v175 = [(id)v231[5] count];
                        if (!+[MADVideoRemoveBackgroundSettings visionTrimEnabled])goto LABEL_118; {
                        memset(&v216, 0, sizeof(v216));
                        }
                        long long v77 = [(id)v231[5] lastObject];
                        uint64_t v78 = v77;
                        if (v77) {
                          [v77 presentationTimestamp];
                        }
                        else {
                          memset(&v216, 0, sizeof(v216));
                        }

                        *(_OWORD *)lhs = *(_OWORD *)&v260.start.value;
                        *(void *)&lhs[16] = v260.start.epoch;
                        CMTime rhs = v216;
                        CMTimeAdd((CMTime *)v270, (CMTime *)lhs, &rhs);
                        *(_OWORD *)&v260.start.int value = *(_OWORD *)v270;
                        uint64_t v81 = *(void *)&v270[16];
                        v260.start.CMTimeEpoch epoch = *(void *)&v270[16];
                        *(CMTime *)v270 = v220;
                        *(_OWORD *)lhs = *(_OWORD *)&v260.start.value;
                        *(void *)&lhs[16] = v81;
                        CMTimeSubtract(&rhs, (CMTime *)v270, (CMTime *)lhs);
                        v260.CMTime duration = rhs;
                        if ((int)MediaAnalysisLogLevel() >= 5)
                        {
                          int v82 = VCPLogInstance();
                          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                          {
                            CMTime v215 = v260.start;
                            Float64 v83 = CMTimeGetSeconds(&v215);
                            CMTime v214 = v220;
                            Float64 v84 = CMTimeGetSeconds(&v214);
                            *(_DWORD *)v270 = 134218240;
                            *(Float64 *)&v270[4] = v83;
                            *(_WORD *)&v270[12] = 2048;
                            *(Float64 *)&v270[14] = v84;
                            _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_DEFAULT, "[RMBG] Tracking based trim (%0.3fs-%0.3fs)", v270, 0x16u);
                          }
                        }
                        +[MADVideoRemoveBackgroundSettings visionTrimMininumDuration];
                        double v86 = v85;
                        CMTime duration = v260.duration;
                        double v87 = CMTimeGetSeconds(&duration);
                        if (v87 >= v86)
                        {
                          long long v211 = 0u;
                          long long v212 = 0u;
                          long long v209 = 0u;
                          long long v210 = 0u;
                          id v88 = (id)v231[5];
                          uint64_t v89 = [v88 countByEnumeratingWithState:&v209 objects:v272 count:16];
                          if (v89)
                          {
                            uint64_t v90 = *(void *)v210;
                            do
                            {
                              for (uint64_t i = 0; i != v89; ++i)
                              {
                                if (*(void *)v210 != v90) {
                                  objc_enumerationMutation(v88);
                                }
                                CVReturn v92 = *(void **)(*((void *)&v209 + 1) + 8 * i);
                                if (v92) {
                                  [*(id *)(*((void *)&v209 + 1) + 8 * i) presentationTimestamp];
                                }
                                else {
                                  memset(&rhs, 0, sizeof(rhs));
                                }
                                *(CMTime *)v270 = rhs;
                                *(CMTime *)lhs = v216;
                                CMTimeSubtract(&v208, (CMTime *)v270, (CMTime *)lhs);
                                CMTime v207 = v208;
                                [v92 setPresentationTimestamp:&v207];
                              }
                              uint64_t v89 = [v88 countByEnumeratingWithState:&v209 objects:v272 count:16];
                            }
                            while (v89);
                          }

                          long long v205 = 0u;
                          long long v206 = 0u;
                          long long v203 = 0u;
                          long long v204 = 0u;
                          id v93 = v185;
                          uint64_t v94 = [v93 countByEnumeratingWithState:&v203 objects:v271 count:16];
                          if (v94)
                          {
                            uint64_t v95 = *(void *)v204;
                            do
                            {
                              for (uint64_t j = 0; j != v94; ++j)
                              {
                                if (*(void *)v204 != v95) {
                                  objc_enumerationMutation(v93);
                                }
                                uint64_t v97 = *(void **)(*((void *)&v203 + 1) + 8 * j);
                                if (v97) {
                                  [*(id *)(*((void *)&v203 + 1) + 8 * j) presentationTimestamp];
                                }
                                else {
                                  memset(&rhs, 0, sizeof(rhs));
                                }
                                *(CMTime *)v270 = rhs;
                                *(CMTime *)lhs = v216;
                                CMTimeSubtract(&v202, (CMTime *)v270, (CMTime *)lhs);
                                CMTime v201 = v202;
                                [v97 setPresentationTimestamp:&v201];
                              }
                              uint64_t v94 = [v93 countByEnumeratingWithState:&v203 objects:v271 count:16];
                            }
                            while (v94);
                          }

LABEL_118:
                          memset(v270, 0, sizeof(v270));
                          CGRect v289 = CGRectUnion(*(CGRect *)(*(void *)&v275.start.timescale + 48), r2);
                          CGFloat y = v289.origin.y;
                          *(int64x2_t *)&v289.origin.CGFloat y = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
                          CGFloat height = v289.size.height;
                          *(float64x2_t *)v270 = vcvtq_f64_u64((uint64x2_t)vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)v289.origin), *(int8x16_t *)&v289.origin.y));
                          *(float64x2_t *)&v270[16] = vcvtq_f64_u64((uint64x2_t)vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)v289.size), *(int8x16_t *)&v289.origin.y));
                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            id v100 = VCPLogInstance();
                            if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)lhs = 67109888;
                              *(_DWORD *)&lhs[4] = (int)*(double *)v270;
                              *(_WORD *)&lhs[8] = 1024;
                              *(_DWORD *)&lhs[10] = (int)*(double *)&v270[8];
                              *(_WORD *)&lhs[14] = 1024;
                              *(_DWORD *)&lhs[16] = (int)(*(double *)v270 + *(double *)&v270[16]);
                              *(_WORD *)&lhs[20] = 1024;
                              *(_DWORD *)&lhs[22] = (int)(*(double *)&v270[8] + *(double *)&v270[24]);
                              _os_log_impl(&dword_1BBEDA000, v100, OS_LOG_TYPE_INFO, "[RMBG] Crop (%d, %d) to (%d, %d)", lhs, 0x1Au);
                            }
                          }
                          if (self->_previewRequest)
                          {
                            CMTimeRange v200 = v260;
                            -[MADVideoRemoveBackgroundCropTask publishPreviewResultsTimeRange:pastSamples:futureSamples:cropRect:](self, "publishPreviewResultsTimeRange:pastSamples:futureSamples:cropRect:", &v200, v231[5], v185, *(double *)v270, *(double *)&v270[8], *(double *)&v270[16], *(double *)&v270[24]);
                            if (!self->_request)
                            {
                              (*((void (**)(void))self->_completionHandler + 2))();
                              BOOL v18 = 1;
                              goto LABEL_167;
                            }
                          }
                          BOOL v174 = [(MADVideoRemoveBackgroundCropTask *)self isAnimatedStickerPreferredWithPastSamples:v231[5] futureSamples:v185];
                          int v101 = [(MADVideoRemoveBackgroundRequest *)self->_request outputType];
                          int v102 = +[MADAlphaSequenceWriter writerWithUniformTypeIdentifier:v101 frameCount:v188 crop:v270];

                          if (!v102)
                          {
                            if ((int)MediaAnalysisLogLevel() >= 3)
                            {
                              v133 = VCPLogInstance();
                              if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                              {
                                v134 = [(MADVideoRemoveBackgroundRequest *)self->_request outputType];
                                *(_DWORD *)lhs = 138412290;
                                *(void *)&lhs[4] = v134;
                                _os_log_impl(&dword_1BBEDA000, v133, OS_LOG_TYPE_ERROR, "[RMBG] Invalid output type specified (%@)", lhs, 0xCu);
                              }
                            }
                            v135 = (void *)MEMORY[0x1E4F28C58];
                            uint64_t v268 = *MEMORY[0x1E4F28568];
                            v136 = NSString;
                            uint64_t v137 = [(MADVideoRemoveBackgroundRequest *)self->_request outputType];
                            v138 = [v136 stringWithFormat:@"Invalid output type specified (%@)", v137];
                            v269 = v138;
                            v139 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v269 forKeys:&v268 count:1];
                            v140 = [v135 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v139];
                            id v141 = *a3;
                            *a3 = v140;

                            BOOL v18 = 0;
                            v142 = (void *)v137;
                            goto LABEL_164;
                          }
                          id v103 = VCPSignPostLog();
                          os_signpost_id_t v104 = os_signpost_id_generate(v103);

                          uint64_t v105 = VCPSignPostLog();
                          id v106 = v105;
                          if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v106, OS_SIGNPOST_INTERVAL_BEGIN, v104, "MADVideoRemoveBackground_EncodePastFrames", "", lhs, 2u);
                          }

                          if (![(MADVideoRemoveBackgroundCropTask *)self exportPastSamples:v231[5] sequenceWriter:v102 progress:v178 error:a3])goto LABEL_152; {
                          id v107 = VCPSignPostLog();
                          }
                          uint64_t v108 = v107;
                          if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v108, OS_SIGNPOST_INTERVAL_END, v104, "MADVideoRemoveBackground_EncodePastFrames", "", lhs, 2u);
                          }

                          v109 = VCPSignPostLog();
                          os_signpost_id_t v110 = os_signpost_id_generate(v109);

                          __int16 v111 = VCPSignPostLog();
                          double v112 = v111;
                          if (v110 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v111))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v112, OS_SIGNPOST_INTERVAL_BEGIN, v110, "MADVideoRemoveBackground_EncodeFutureFrames", "", lhs, 2u);
                          }

                          if (![(MADVideoRemoveBackgroundCropTask *)self exportFutureSamples:v185 sequenceWriter:v102 progress:v178 error:a3])
                          {
LABEL_152:
                            BOOL v18 = 0;
LABEL_165:

                            goto LABEL_167;
                          }
                          uint64_t v113 = VCPSignPostLog();
                          uint64_t v114 = v113;
                          if (v110 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v114, OS_SIGNPOST_INTERVAL_END, v110, "MADVideoRemoveBackground_EncodeFutureFrames", "", lhs, 2u);
                          }

                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            v115 = VCPLogInstance();
                            if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)lhs = 0;
                              _os_log_impl(&dword_1BBEDA000, v115, OS_LOG_TYPE_INFO, "[RMBG] Finalizing output", lhs, 2u);
                            }
                          }
                          CMTimeRange v198 = v260;
                          CMTimeRangeGetEnd(&v199, &v198);
                          v116 = [v102 finishWithEndTime:&v199];
                          if (!v116)
                          {
                            if ((int)MediaAnalysisLogLevel() >= 3)
                            {
                              v144 = VCPLogInstance();
                              if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)lhs = 0;
                                _os_log_impl(&dword_1BBEDA000, v144, OS_LOG_TYPE_ERROR, "Failed to finalize output sequence", lhs, 2u);
                              }
                            }
                            v145 = (void *)MEMORY[0x1E4F28C58];
                            uint64_t v266 = *MEMORY[0x1E4F28568];
                            v142 = [NSString stringWithFormat:@"Failed to finalize output sequence"];
                            v267 = v142;
                            v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v267 forKeys:&v266 count:1];
                            v147 = [v145 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v146];
                            id v148 = *a3;
                            *a3 = v147;

                            BOOL v18 = 0;
                            goto LABEL_164;
                          }
                          rhs.int value = (unint64_t)*(double *)&v270[16];
                          v216.int value = (unint64_t)*(double *)&v270[24];
                          uint64_t v117 = [(MADVideoRemoveBackgroundRequest *)self->_request maxFileSize];
                          if (v117)
                          {
                            unint64_t v118 = [v116 length];
                            CGRect v119 = [(MADVideoRemoveBackgroundRequest *)self->_request maxFileSize];
                            BOOL v120 = v118 > [v119 unsignedIntegerValue];

                            if (v120)
                            {
                              uint64_t v121 = [(MADVideoRemoveBackgroundCropTask *)self compressSequenceData:v116 sequenceWriter:v102 outputWidth:&rhs outputHeight:&v216];

                              v116 = (void *)v121;
                              if (!v121)
                              {
                                if ((int)MediaAnalysisLogLevel() >= 3)
                                {
                                  v122 = VCPLogInstance();
                                  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)lhs = 0;
                                    _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_ERROR, "[RMBG] Failed to meet target filesize requirement", lhs, 2u);
                                  }
                                }
                                v123 = (void *)MEMORY[0x1E4F28C58];
                                uint64_t v264 = *MEMORY[0x1E4F28568];
                                v124 = [NSString stringWithFormat:@"Failed to meet target filesize requirement"];
                                v265 = v124;
                                v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v265 forKeys:&v264 count:1];
                                v126 = [v123 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v125];
                                v189 = 0;
                                id v182 = *a3;
                                *a3 = v126;

LABEL_207:
                                BOOL v18 = 0;
                                v142 = v189;
                                goto LABEL_164;
                              }
                            }
                          }
                          if ((int)MediaAnalysisLogLevel() >= 5)
                          {
                            v149 = v116;
                            v150 = VCPLogInstance();
                            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
                            {
                              int value = rhs.value;
                              int v152 = v216.value;
                              int v153 = [v149 length];
                              *(_DWORD *)lhs = 67109632;
                              *(_DWORD *)&lhs[4] = value;
                              *(_WORD *)&lhs[8] = 1024;
                              *(_DWORD *)&lhs[10] = v152;
                              *(_WORD *)&lhs[14] = 1024;
                              *(_DWORD *)&lhs[16] = v153;
                              _os_log_impl(&dword_1BBEDA000, v150, OS_LOG_TYPE_DEFAULT, "[RMBG] Output - Resolution: %dx%d  Size: %d", lhs, 0x14u);
                            }

                            v116 = v149;
                          }
                          [v187 destroy];
                          v154 = (void (**)(double))self->_progressHandler;
                          if (v154) {
                            v154[2](1.0);
                          }
                          v155 = [(MADVideoRemoveBackgroundRequest *)self->_request stickerIdentifiers];
                          v189 = v116;
                          BOOL v156 = [v155 count] == 0;

                          if (!v156)
                          {
                            v157 = [(MADServiceVideoAsset *)self->_asset animatedStickerScore];
                            v124 = v157;
                            if (v157)
                            {
                              [v157 doubleValue];
                              double v159 = v158;
                              +[MADVideoRemoveBackgroundSettings photosPreferredThreshold];
                              BOOL v161 = v159 >= v160;
                              BOOL v162 = v159 >= v160 && v174;
                              v163 = NSString;
                              [v124 doubleValue];
                              objc_msgSend(v163, "stringWithFormat:", @"%0.3f", v164);
                              v125 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              BOOL v161 = 1;
                              v125 = @"-";
                              BOOL v162 = v174;
                            }
                            if ((int)MediaAnalysisLogLevel() >= 5)
                            {
                              v165 = VCPLogInstance();
                              if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)lhs = 67109890;
                                *(_DWORD *)&lhs[4] = v162;
                                *(_WORD *)&lhs[8] = 1024;
                                *(_DWORD *)&lhs[10] = v174;
                                *(_WORD *)&lhs[14] = 1024;
                                *(_DWORD *)&lhs[16] = v161;
                                *(_WORD *)&lhs[20] = 2112;
                                *(void *)&lhs[22] = v125;
                                _os_log_impl(&dword_1BBEDA000, v165, OS_LOG_TYPE_DEFAULT, "[RMBG] Preferred: %d (Vision: %d, Photos: %d - Score: %@)", lhs, 0x1Eu);
                              }
                            }
                            v166 = objc_alloc_init(_MADObjCStickerStoreFacade);
                            v167 = [(MADVideoRemoveBackgroundRequest *)self->_request stickerIdentifiers];
                            v168 = [(MADVideoRemoveBackgroundRequest *)self->_request outputType];
                            id v197 = 0;
                            BOOL v169 = -[_MADObjCStickerStoreFacade addAnimatedRepresentationWithIdentifiers:data:uti:size:isPreferred:error:](v166, "addAnimatedRepresentationWithIdentifiers:data:uti:size:isPreferred:error:", v167, v189, v168, v162, &v197, (double)(unint64_t)rhs.value, (double)(unint64_t)v216.value);
                            id v183 = v197;

                            if (!v169)
                            {
                              if ((int)MediaAnalysisLogLevel() >= 3)
                              {
                                v170 = VCPLogInstance();
                                if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
                                {
                                  v171 = [v183 description];
                                  *(_DWORD *)lhs = 138412290;
                                  *(void *)&lhs[4] = v171;
                                  _os_log_impl(&dword_1BBEDA000, v170, OS_LOG_TYPE_ERROR, "[RMBG] Failed to update sticker (%@)", lhs, 0xCu);
                                }
                              }
                              v172 = (void *)[v183 copy];
                              id v173 = *a3;
                              *a3 = v172;

                              goto LABEL_207;
                            }
                          }
                          v142 = v189;
                          [(MADVideoRemoveBackgroundCropTask *)self publishPayloadWidth:rhs.value height:v216.value data:v189];
                          (*((void (**)(void))self->_completionHandler + 2))();
                          MADPLLogAnimatedStickerCreation(v175 + v176, v7);
                          BOOL v18 = 1;
LABEL_164:

                          goto LABEL_165;
                        }
                        if ((int)MediaAnalysisLogLevel() >= 3)
                        {
                          v127 = VCPLogInstance();
                          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v270 = 134218240;
                            *(double *)&v270[4] = v87;
                            *(_WORD *)&v270[12] = 2048;
                            *(double *)&v270[14] = v86;
                            _os_log_impl(&dword_1BBEDA000, v127, OS_LOG_TYPE_ERROR, "[RMBG] Trimmed duration is too short (%0.3fs < %0.3fs)", v270, 0x16u);
                          }
                        }
                        v128 = (void *)MEMORY[0x1E4F28C58];
                        uint64_t v273 = *MEMORY[0x1E4F28568];
                        v129 = objc_msgSend(NSString, "stringWithFormat:", @"Trimmed duration is too short (%0.3fs < %0.3fs)", *(void *)&v87, *(void *)&v86);
                        v274 = v129;
                        v130 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v274 forKeys:&v273 count:1];
                        v131 = [v128 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v130];
                        id v132 = *a3;
                        *a3 = v131;
                      }
                      else
                      {
                        float v79 = (void *)[*(id *)(*(void *)&buf.start.timescale + 40) copy];
                        id v80 = *a3;
                        *a3 = v79;
                      }
                    }
                    BOOL v18 = 0;
LABEL_167:

                    CF<opaqueCMSampleBuffer *>::~CF(&v228);
                    _Block_object_dispose(&v230, 8);

                    _Block_object_dispose(&buf, 8);
                    _Block_object_dispose(&v275, 8);

                    double v38 = v186;
                    goto LABEL_168;
                  }
                  if (a3)
                  {
                    uint64_t v51 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v278 = *MEMORY[0x1E4F28568];
                    uint64_t v279 = [NSString stringWithFormat:@"Failed to start decoding video track"];
                    id v190 = (id)v279;
                    int v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
                    long long v52 = [v51 errorWithDomain:*MEMORY[0x1E4F28760] code:-19 userInfo:v48];
                    id v53 = *a3;
                    *a3 = v52;

                    goto LABEL_54;
                  }
                }
                else if (a3)
                {
                  id v47 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v280 = *MEMORY[0x1E4F28568];
                  uint64_t v281 = [NSString stringWithFormat:@"Failed to create video track output"];
                  id v190 = (id)v281;
                  int v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v281 forKeys:&v280 count:1];
                  __int16 v49 = [v47 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v48];
                  id v50 = *a3;
                  *a3 = v49;

LABEL_54:
                  BOOL v18 = 0;
LABEL_170:

                  id v46 = v190;
                  goto LABEL_171;
                }
                BOOL v18 = 0;
LABEL_172:

                goto LABEL_173;
              }
              if (a3)
              {
                id v41 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v282 = *MEMORY[0x1E4F28568];
                long long v42 = NSString;
                CMTime v249 = v252;
                Float64 v43 = CMTimeGetSeconds(&v249);
                CMTime v248 = v260.start;
                Float64 v44 = CMTimeGetSeconds(&v248);
                CMTimeRange v246 = v260;
                CMTimeRangeGetEnd(&v247, &v246);
                v191 = objc_msgSend(v42, "stringWithFormat:", @"Mask time (%0.3fs) falls outside video time range (%0.3fs-%0.3fs)", *(void *)&v43, *(void *)&v44, CMTimeGetSeconds(&v247));
                v283 = v191;
                uint64_t v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v283 forKeys:&v282 count:1];
                long long v45 = objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -50);
                BOOL v18 = 0;
                id v46 = *a3;
                *a3 = v45;
LABEL_171:

                v28 = (void *)v192;
                goto LABEL_172;
              }
LABEL_49:
              BOOL v18 = 0;
LABEL_173:
              id v21 = v193;
              goto LABEL_174;
            }
            goto LABEL_27;
          }
        }
        else
        {
          memset(&v275, 0, 24);
        }
        double v27 = self->_asset;
        if (v27)
        {
          [(MADServiceVideoAsset *)v27 stillTime];
          goto LABEL_28;
        }
LABEL_27:
        memset(&v252, 0, sizeof(v252));
        goto LABEL_28;
      }
      id v20 = (void *)[v12 copy];
    }
    else
    {
      if (!a3)
      {
        BOOL v18 = 0;
LABEL_175:

        return v18;
      }
      double v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v287 = *MEMORY[0x1E4F28568];
      v194 = [NSString stringWithFormat:@"Failed to load asset"];
      v288[0] = v194;
      v195 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v288 forKeys:&v287 count:1];
      id v20 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -50);
    }
    BOOL v18 = 0;
    id v21 = *a3;
    *a3 = v20;
LABEL_174:

    goto LABEL_175;
  }
  return 0;
}

void __40__MADVideoRemoveBackgroundCropTask_run___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) fractionCompleted];
      int v5 = 134217984;
      double v6 = v3 * 100.0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "[RMBG] Progress: %0.2f%%", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 72);
  if (v4)
  {
    [*(id *)(a1 + 32) fractionCompleted];
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

void __40__MADVideoRemoveBackgroundCropTask_run___block_invoke_412(uint64_t a1)
{
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = VCPSignPostLog();
  int v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADVideoRemoveBackground_TrackMaskPastFrames", "", buf, 2u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) processPastSampleBuffers:*(void *)(a1 + 40) orientation:*(unsigned int *)(a1 + 88) maskPixelBuffer:*(void *)(a1 + 80) cropUnion:*(void *)(*(void *)(a1 + 64) + 8) + 48 progress:*(void *)(a1 + 48) error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = VCPSignPostLog();
  uint64_t v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_END, v3, "MADVideoRemoveBackground_TrackMaskPastFrames", "", v11, 2u);
  }
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_previewRequest, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void)generateMaskForSampleBuffer:orientation:error:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot lock NULL CVPixelBuffer", v0, 2u);
}

- (void)generateMaskForSampleBuffer:(uint64_t)a1 orientation:(int)a2 error:.cold.2(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v2, 0x12u);
}

@end