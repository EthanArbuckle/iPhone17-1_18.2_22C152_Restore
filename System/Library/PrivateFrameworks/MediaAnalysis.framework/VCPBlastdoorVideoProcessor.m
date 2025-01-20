@interface VCPBlastdoorVideoProcessor
- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5;
- (BOOL)analyzeWithError:(id *)a3;
- (BOOL)processConfiguration:(id)a3 withError:(id *)a4;
- (NSDictionary)decoderSettings;
- (VCPBlastdoorVideoProcessor)initWithURL:(id)a3;
- (id)progressHandler;
- (void)cancel;
- (void)setDecoderSettings:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation VCPBlastdoorVideoProcessor

- (VCPBlastdoorVideoProcessor)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPBlastdoorVideoProcessor;
  v6 = [(VCPBlastdoorVideoProcessor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    frameProcessors = v7->_frameProcessors;
    v7->_frameProcessors = (NSMutableArray *)v8;

    atomic_store(0, (unsigned __int8 *)&v7->_canceled);
  }

  return v7;
}

- (BOOL)processConfiguration:(id)a3 withError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = (id)objc_opt_class();
        v9 = [v5 allKeys];
        *(_DWORD *)buf = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[%@] Unsupported configuration keys: %@", buf, 0x16u);
      }
    }
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      objc_super v11 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported configuration keys", *MEMORY[0x1E4F28568]);
      v15 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      *a4 = [v10 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v12];
    }
  }

  return v6 == 0;
}

- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [(VCPBlastdoorVideoProcessor *)self processConfiguration:a4 withError:a5];
  if (v9)
  {
    frameProcessors = self->_frameProcessors;
    objc_super v11 = _Block_copy(v8);
    [(NSMutableArray *)frameProcessors addObject:v11];
  }
  return v9;
}

- (BOOL)analyzeWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_frameProcessors count])
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2050000000;
    v4 = (void *)getIMMessagesBlastDoorInterfaceClass(void)::softClass;
    uint64_t v50 = getIMMessagesBlastDoorInterfaceClass(void)::softClass;
    if (!getIMMessagesBlastDoorInterfaceClass(void)::softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v54 = (uint64_t)___ZL36getIMMessagesBlastDoorInterfaceClassv_block_invoke;
      v55 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62970F8;
      v56 = (void (*)(uint64_t))&v47;
      ___ZL36getIMMessagesBlastDoorInterfaceClassv_block_invoke((uint64_t)&buf);
      v4 = (void *)v48[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v47, 8);
    id v39 = objc_alloc_init(v5);
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t v6 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:@"FrameLimit"];
    uint64_t v7 = [v6 unsignedIntegerValue];

    if (!v7 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = objc_opt_class();
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        id v10 = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "[%@] No frame limit, progress may be inaccurate", (uint8_t *)&buf, 0xCu);
      }
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__37;
    v56 = __Block_byref_object_dispose__37;
    id v57 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__VCPBlastdoorVideoProcessor_analyzeWithError___block_invoke;
    aBlock[3] = &unk_1E629B3C0;
    p_long long buf = &buf;
    v12 = v11;
    v42 = v12;
    v43 = self;
    v45 = &v47;
    uint64_t v46 = v7;
    v13 = _Block_copy(aBlock);
    progressHandler = (void (**)(double))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](0.0);
    }
    v15 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
    uint64_t v16 = [v15 unsignedIntegerValue];

    id v17 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
    uint64_t v18 = [v17 unsignedIntegerValue];

    if (!v16) {
      uint64_t v16 = 299;
    }
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 299;
    }
    uint64_t v20 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:@"UniformSampling"];
    uint64_t v21 = [v20 BOOLValue];

    v22 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:*MEMORY[0x1E4F16270]];
    uint64_t v23 = [v22 unsignedIntegerValue];

    v24 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:@"AppliesPreferredTrackTransform"];
    char v25 = [v24 BOOLValue];

    LOBYTE(v38) = v25;
    [v39 generateMovieFramesForAttachmentWithFileURL:self->_url targetPixelWidth:v16 targetPixelHeight:v19 frameLimit:v7 uniformSampling:v21 framesPerSync:v23 appliesPreferredTrackTransform:v38 resultHandler:v13];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    if (a3)
    {
      unsigned __int8 v26 = atomic_load((unsigned __int8 *)&self->_canceled);
      uint64_t v27 = *((void *)&buf + 1);
      if ((v26 & 1) != 0 && !*(void *)(*((void *)&buf + 1) + 40))
      {
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        v29 = [NSString stringWithFormat:@"%@ cancelled", objc_opt_class()];
        v52 = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        uint64_t v31 = [v28 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v30];
        v32 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v31;

        uint64_t v27 = *((void *)&buf + 1);
      }
      *a3 = (id)[*(id *)(v27 + 40) copy];
    }
    BOOL v33 = *(void *)(*((void *)&buf + 1) + 40) == 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v34 = VCPLogInstance();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = objc_opt_class();
        id v35 = *(id *)((char *)&buf + 4);
        _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEFAULT, "[%@] No frame processing request, analysis complete", (uint8_t *)&buf, 0xCu);
      }
    }
    v36 = (void (**)(double))self->_progressHandler;
    if (v36)
    {
      v36[2](0.0);
      (*((void (**)(double))self->_progressHandler + 2))(1.0);
    }
    return 1;
  }
  return v33;
}

void __47__VCPBlastdoorVideoProcessor_analyzeWithError___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!v7)
  {
    id v41 = v8;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.duration.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v8;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    uint64_t v18 = [v8 copy];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    if (a4)
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_30;
      }
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor but decoding not finished yet", (uint8_t *)&buf, 2u);
      }
    }
LABEL_29:
    id v8 = v41;
    goto LABEL_30;
  }
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 40) + 40));
  if (v9 & 1) != 0 || (unsigned __int8 v10 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 40) + 41)), (v10))
  {
    if (!a4) {
      goto LABEL_30;
    }
    goto LABEL_11;
  }
  id v11 = v7;
  id v41 = v8;
  v12 = [v11 image];
  v13 = (__CVBuffer *)[v12 pixelBuffer];

  if (!v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "No CVPixelBuffer from BlastDoorVideoPreview", (uint8_t *)&buf, 2u);
      }
    }
    goto LABEL_29;
  }
  CMSampleBufferRef sampleBufferOut = 0;
  [v11 timestamp];
  CMTimeMakeWithSeconds(&v46, v14, 1000);
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  if (CMVideoFormatDescriptionCreateForImageBuffer(0, v13, &formatDescriptionOut))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v39 = v11;
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[CVPixelBuffer->CMSampleBuffer] Failed to create format description", (uint8_t *)&buf, 2u);
      }
LABEL_35:

      id v11 = v39;
      goto LABEL_36;
    }
    goto LABEL_36;
  }
  *(_OWORD *)&buf.duration.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v23 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  buf.presentationTimeStamp = v46;
  buf.duration.epoch = v23;
  *(_OWORD *)&buf.decodeTimeStamp.value = *(_OWORD *)&buf.duration.value;
  buf.decodeTimeStamp.epoch = v23;
  if (CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13, formatDescriptionOut, &buf, &sampleBufferOut))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v39 = v11;
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer", v48, 2u);
      }
      goto LABEL_35;
    }
LABEL_36:
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "Failed to convert CVPixelBuffer to CMSampleBuffer", (uint8_t *)&buf, 2u);
      }
    }
    char v25 = 1;
    goto LABEL_41;
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v27 = *(id *)(*(void *)(a1 + 40) + 16);
  v40 = v11;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v43;
    unsigned __int8 v30 = 1;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        BOOL v33 = (void *)MEMORY[0x1C186D320]();
        LOBYTE(buf.duration.value) = 0;
        (*(void (**)(uint64_t, CMSampleBufferRef, CMSampleTimingInfo *))(v32 + 16))(v32, sampleBufferOut, &buf);
        LODWORD(v32) = LOBYTE(buf.duration.value);
        v30 &= v32 != 0;
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v28);
  }
  else
  {
    unsigned __int8 v30 = 1;
  }

  atomic_store(v30, (unsigned __int8 *)(*(void *)(a1 + 40) + 41));
  unint64_t v34 = ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (*(void *)(a1 + 64)) {
    unint64_t v35 = *(void *)(a1 + 64);
  }
  else {
    unint64_t v35 = v34 + 1;
  }
  id v11 = v40;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v36 = VCPLogInstance();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      int v37 = [v40 frame];
      LODWORD(buf.duration.value) = 67109376;
      HIDWORD(buf.duration.value) = v37;
      LOWORD(buf.duration.timescale) = 2048;
      *(double *)((char *)&buf.duration.timescale + 2) = (double)v34 / (double)v35 * 100.0;
      _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEBUG, "Processed frame %d, progress %.2f%%", (uint8_t *)&buf, 0x12u);
    }

    id v11 = v40;
  }
  uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 32);
  if (v38) {
    (*(void (**)(double))(v38 + 16))((double)v34 / (double)v35);
  }
  char v25 = 0;
LABEL_41:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);

  char v26 = v25 | a4 ^ 1;
  id v8 = v41;
  if (v26) {
    goto LABEL_30;
  }
LABEL_11:
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 32);
  if (v16) {
    (*(void (**)(double))(v16 + 16))(1.0);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_30:
}

- (void)cancel
{
}

- (NSDictionary)decoderSettings
{
  return self->_decoderSettings;
}

- (void)setDecoderSettings:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_decoderSettings, 0);
  objc_storeStrong((id *)&self->_frameProcessors, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end