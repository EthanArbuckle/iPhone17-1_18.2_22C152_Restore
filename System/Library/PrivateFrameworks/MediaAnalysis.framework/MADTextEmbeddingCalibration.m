@interface MADTextEmbeddingCalibration
- (MADTextEmbeddingCalibration)init;
- (id).cxx_construct;
- (int)_createPlan;
- (int)_loadResources;
- (int)_processEmbedding:(id)a3 version:(unint64_t)a4 typeSize:(unint64_t)a5 mean:(float *)a6 standardDeviation:(float *)a7;
- (int)loadResources;
- (int)processEmbedding:(id)a3 mean:(float *)a4 standardDeviation:(float *)a5;
- (int)processEmbedding:(id)a3 version:(unint64_t)a4 typeSize:(unint64_t)a5 mean:(float *)a6 standardDeviation:(float *)a7;
- (void)dealloc;
@end

@implementation MADTextEmbeddingCalibration

- (MADTextEmbeddingCalibration)init
{
  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingCalibration;
  v2 = [(MADTextEmbeddingCalibration *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MADTextEmbeddingCalibration", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  if (espresso_plan_destroy() && (int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to destroy plan", buf, 2u);
    }
  }
  if (espresso_context_destroy() && (int)MediaAnalysisLogLevel() >= 3)
  {
    dispatch_queue_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to destroy context", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MADTextEmbeddingCalibration;
  [(MADTextEmbeddingCalibration *)&v5 dealloc];
}

- (int)_createPlan
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan) {
    return -18;
  }
  dispatch_queue_t v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  objc_super v5 = [v4 resourceURL];

  v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"text_calibration_md3.espresso.net" relativeToURL:v5];
  id v7 = [v6 path];
  [v7 UTF8String];
  int blob_dimensions = espresso_plan_add_network();

  if (!blob_dimensions)
  {
    int blob_dimensions = espresso_plan_build();
    if (!blob_dimensions)
    {
      int64x2_t v19 = 0u;
      int64x2_t v20 = 0u;
      int blob_dimensions = espresso_network_query_blob_dimensions();
      if (!blob_dimensions)
      {
        if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v19, (int64x2_t)xmmword_1BC2834D0), (int32x4_t)vceqq_s64(v20, vdupq_n_s64(1uLL)))))))
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v9 = VCPLogInstance();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              int v11 = 134218752;
              uint64_t v12 = v19.i64[0];
              __int16 v13 = 2048;
              uint64_t v14 = v19.i64[1];
              __int16 v15 = 2048;
              uint64_t v16 = v20.i64[0];
              __int16 v17 = 2048;
              uint64_t v18 = v20.i64[1];
              _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "Input has unexpected dimension %zux%zux%zux%zu", (uint8_t *)&v11, 0x2Au);
            }
          }
          int blob_dimensions = -18;
        }
        else
        {
          int blob_dimensions = espresso_network_bind_cvpixelbuffer();
          if (!blob_dimensions)
          {
            int blob_dimensions = espresso_network_bind_buffer();
            if (!blob_dimensions) {
              int blob_dimensions = espresso_network_bind_buffer();
            }
          }
        }
      }
    }
  }

  return blob_dimensions;
}

- (int)_loadResources
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_inputBuffer.value_)
  {
LABEL_2:
    if (self->_context || (context = (void *)espresso_create_context(), (self->_context = context) != 0))
    {
      if (self->_plan)
      {
        return 0;
      }
      else
      {
        CVReturn v4 = [(MADTextEmbeddingCalibration *)self _createPlan];
        if (v4)
        {
          espresso_plan_destroy();
          self->_plan = 0;
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to create ANE context", v10, 2u);
        }
      }
      return -18;
    }
    return v4;
  }
  uint64_t v11 = *MEMORY[0x1E4F24D20];
  v12[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  value = self->_inputBuffer.value_;
  if (value)
  {
    CFRelease(value);
    self->_inputBuffer.value_ = 0;
  }
  CVReturn v4 = CVPixelBufferCreate(0, 0x200uLL, 1uLL, 0x4C303068u, v5, &self->_inputBuffer.value_);
  if (!v4)
  {

    goto LABEL_2;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to create input buffer", v10, 2u);
    }
  }
  return v4;
}

- (int)loadResources
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MADTextEmbeddingCalibration_loadResources__block_invoke;
  v5[3] = &unk_1E6297458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__MADTextEmbeddingCalibration_loadResources__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _loadResources];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_processEmbedding:(id)a3 version:(unint64_t)a4 typeSize:(unint64_t)a5 mean:(float *)a6 standardDeviation:(float *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  int v13 = [(MADTextEmbeddingCalibration *)self _loadResources];
  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to load calibration network", buf, 2u);
      }
    }
    goto LABEL_26;
  }
  if (a4 != 3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [NSNumber numberWithUnsignedInteger:a4];
        *(_DWORD *)buf = 138412290;
        *(void *)v34 = v18;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[Text|Calibration] Calibration not supported for embedding version %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_25:
    int v13 = -50;
    goto LABEL_26;
  }
  if (a5 != 2)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int64x2_t v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[Text|Calibration] Calibration only supported for fp16", buf, 2u);
      }
    }
    goto LABEL_25;
  }
  unint64_t v15 = (unint64_t)[v12 length] >> 1;
  if (v15 != 512)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int64x2_t v20 = [NSNumber numberWithUnsignedInteger:v15];
        *(_DWORD *)buf = 138412546;
        *(void *)v34 = v20;
        *(_WORD *)&v34[8] = 2112;
        *(void *)&v34[10] = &unk_1F15ED200;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[Text|Calibration] Embedding size (%@) does not match expected (%@)", buf, 0x16u);
      }
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  value = self->_inputBuffer.value_;
  *(void *)&v34[4] = value;
  *(void *)&v34[12] = 0;
  if (value)
  {
    int v13 = CVPixelBufferLockBaseAddress(value, 0);
    *(_DWORD *)buf = v13;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(self->_inputBuffer.value_);
      memcpy(BaseAddress, (const void *)[v12 bytes], 0x400uLL);
      int v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (!v13)
      {
        int v13 = espresso_plan_execute_sync();
        if (v13)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v31 = VCPLogInstance();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v32 = 0;
              _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to execute calibration network", v32, 2u);
            }
          }
        }
        else
        {
          *a6 = *(float *)self->_meanBuffer.data;
          *a7 = *(float *)self->_standardDeviationBuffer.data;
        }
      }
    }
  }
  else
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v22) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    int v13 = -50;
    *(_DWORD *)buf = -50;
  }
  if (*(void *)&v34[4]
    && !*(_DWORD *)buf
    && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&v34[4], *(CVPixelBufferLockFlags *)&v34[12])
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
  }
LABEL_26:

  return v13;
}

- (int)processEmbedding:(id)a3 mean:(float *)a4 standardDeviation:(float *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  int64x2_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MADTextEmbeddingCalibration_processEmbedding_mean_standardDeviation___block_invoke;
  block[3] = &unk_1E629B1E0;
  id v13 = v8;
  uint64_t v14 = self;
  unint64_t v15 = &v18;
  uint64_t v16 = a4;
  __int16 v17 = a5;
  id v10 = v8;
  dispatch_sync(queue, block);
  LODWORD(a4) = *((_DWORD *)v19 + 6);

  _Block_object_dispose(&v18, 8);
  return (int)a4;
}

void __71__MADTextEmbeddingCalibration_processEmbedding_mean_standardDeviation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type] == 2) {
    uint64_t v2 = 4;
  }
  else {
    uint64_t v2 = 2 * ([*(id *)(a1 + 32) type] != 0);
  }
  int v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) data];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_processEmbedding:version:typeSize:mean:standardDeviation:", v4, objc_msgSend(*(id *)(a1 + 32), "version"), v2, *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (int)processEmbedding:(id)a3 version:(unint64_t)a4 typeSize:(unint64_t)a5 mean:(float *)a6 standardDeviation:(float *)a7
{
  id v12 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MADTextEmbeddingCalibration_processEmbedding_version_typeSize_mean_standardDeviation___block_invoke;
  block[3] = &unk_1E629B208;
  void block[4] = self;
  id v17 = v12;
  uint64_t v18 = &v23;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  int v21 = a6;
  BOOL v22 = a7;
  id v14 = v12;
  dispatch_sync(queue, block);
  LODWORD(a6) = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return (int)a6;
}

uint64_t __88__MADTextEmbeddingCalibration_processEmbedding_version_typeSize_mean_standardDeviation___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _processEmbedding:*(void *)(a1 + 40) version:*(void *)(a1 + 56) typeSize:*(void *)(a1 + 64) mean:*(void *)(a1 + 72) standardDeviation:*(void *)(a1 + 80)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_inputBuffer.value_);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 48) = 0;
  return self;
}

@end