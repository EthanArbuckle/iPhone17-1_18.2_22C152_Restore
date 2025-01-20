@interface MADTextEmbeddingThreshold
+ (NSString)modelName;
+ (float)computeThresholdBase:(float)a3;
+ (float)thresholdBase;
+ (id)createForEmbeddingVersion:(unint64_t)a3;
+ (unint64_t)embeddingLength;
+ (unint64_t)embeddingVersion;
- (MADTextEmbeddingThreshold)init;
- (id).cxx_construct;
- (int)_createPlan;
- (int)_loadResources;
- (int)_processEmbedding:(id)a3 bias:(float *)a4 scale:(float *)a5 threshold:(float *)a6;
- (int)loadResources;
- (int)processEmbedding:(id)a3 bias:(float *)a4 scale:(float *)a5 threshold:(float *)a6;
- (void)dealloc;
@end

@implementation MADTextEmbeddingThreshold

+ (NSString)modelName
{
  return 0;
}

+ (unint64_t)embeddingVersion
{
  return 0;
}

+ (unint64_t)embeddingLength
{
  return 0;
}

+ (float)thresholdBase
{
  return 0.0;
}

- (MADTextEmbeddingThreshold)init
{
  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingThreshold;
  v2 = [(MADTextEmbeddingThreshold *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MADTextEmbeddingThreshold", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)createForEmbeddingVersion:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    dispatch_queue_t v4 = MADTextEmbeddingThresholdMD5;
    goto LABEL_7;
  }
  int v3 = a3;
  if (a3 == 4)
  {
    dispatch_queue_t v4 = MADTextEmbeddingThresholdMD4;
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    dispatch_queue_t v4 = MADTextEmbeddingThresholdMD3;
LABEL_7:
    id v5 = objc_alloc_init(v4);
    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding version %d not supported", (uint8_t *)v8, 8u);
    }
  }
  id v5 = 0;
LABEL_13:
  return v5;
}

- (void)dealloc
{
  if (espresso_plan_destroy() && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to destroy plan", buf, 2u);
    }
  }
  if (espresso_context_destroy() && (int)MediaAnalysisLogLevel() >= 3)
  {
    dispatch_queue_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to destroy context", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MADTextEmbeddingThreshold;
  [(MADTextEmbeddingThreshold *)&v5 dealloc];
}

- (int)_createPlan
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan) {
    return -18;
  }
  dispatch_queue_t v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  objc_super v5 = [v4 resourceURL];

  v6 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v7 = [(id)objc_opt_class() modelName];
  v8 = [v6 URLWithString:v7 relativeToURL:v5];

  id v9 = [v8 path];
  [v9 UTF8String];
  int blob_dimensions = espresso_plan_add_network();

  if (!blob_dimensions)
  {
    int blob_dimensions = espresso_plan_build();
    if (!blob_dimensions)
    {
      int64x2_t v24 = 0u;
      int64x2_t v25 = 0u;
      int blob_dimensions = espresso_network_query_blob_dimensions();
      if (!blob_dimensions)
      {
        uint64_t v11 = [(id)objc_opt_class() embeddingLength];
        int64x2_t v12 = vdupq_n_s64(1uLL);
        int32x4_t v13 = (int32x4_t)vceqq_s64(v25, v12);
        v12.i64[0] = v11;
        if (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v24, v12), v13))), 0xFuLL))))
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v14 = VCPLogInstance();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218752;
              uint64_t v17 = v24.i64[0];
              __int16 v18 = 2048;
              uint64_t v19 = v24.i64[1];
              __int16 v20 = 2048;
              uint64_t v21 = v25.i64[0];
              __int16 v22 = 2048;
              uint64_t v23 = v25.i64[1];
              _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Input has unexpected dimension %zux%zux%zux%zu", buf, 0x2Au);
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
  v13[1] = *MEMORY[0x1E4F143B8];
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
        CVReturn v4 = [(MADTextEmbeddingThreshold *)self _createPlan];
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
        id v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to create ANE context", v11, 2u);
        }
      }
      return -18;
    }
    return v4;
  }
  uint64_t v12 = *MEMORY[0x1E4F24D20];
  v13[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  size_t v6 = [(id)objc_opt_class() embeddingLength];
  value = self->_inputBuffer.value_;
  if (value)
  {
    CFRelease(value);
    self->_inputBuffer.value_ = 0;
  }
  CVReturn v4 = CVPixelBufferCreate(0, v6, 1uLL, 0x4C303068u, v5, &self->_inputBuffer.value_);
  if (!v4)
  {

    goto LABEL_2;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to create input buffer", v11, 2u);
    }
  }
  return v4;
}

- (int)loadResources
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MADTextEmbeddingThreshold_loadResources__block_invoke;
  v5[3] = &unk_1E6297458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MADTextEmbeddingThreshold_loadResources__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _loadResources];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (float)computeThresholdBase:(float)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  float v4 = logf(a3);
  float v5 = logf(1.0 - a3);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 134219008;
      double v9 = a3;
      __int16 v10 = 2048;
      double v11 = 1.0 - a3;
      __int16 v12 = 2048;
      double v13 = v4;
      __int16 v14 = 2048;
      double v15 = v5;
      __int16 v16 = 2048;
      double v17 = (float)(v4 - v5);
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[Text|Threshold] Base: ln(%0.3f) - ln(%0.3f) = %0.6f - %0.6f = %0.6f", (uint8_t *)&v8, 0x34u);
    }
  }
  return v4 - v5;
}

- (int)_processEmbedding:(id)a3 bias:(float *)a4 scale:(float *)a5 threshold:(float *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = [(MADTextEmbeddingThreshold *)self _loadResources];
  if (v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to load network", buf, 2u);
      }
    }
    goto LABEL_32;
  }
  uint64_t v13 = [v10 version];
  if (v13 != [(id)objc_opt_class() embeddingVersion])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "version"));
        __int16 v22 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        double v45 = *(double *)&v22;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding version (%@) is not supported", buf, 0xCu);
      }
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  if ([v10 type] != 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "type"));
        uint64_t v23 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        double v45 = *(double *)&v23;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding type (%@) is not supported", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_31:
    int v11 = -50;
    goto LABEL_32;
  }
  uint64_t v14 = [v10 count];
  if (v14 != [(id)objc_opt_class() embeddingLength])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        int64x2_t v24 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        double v45 = *(double *)&v24;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding size (%@) is not supported", buf, 0xCu);
      }
LABEL_30:

      goto LABEL_31;
    }
    goto LABEL_31;
  }
  value = self->_inputBuffer.value_;
  int v41 = 0;
  CVPixelBufferRef pixelBuffer = value;
  CVPixelBufferLockFlags unlockFlags = 0;
  if (value)
  {
    int v11 = CVPixelBufferLockBaseAddress(value, 0);
    int v41 = v11;
    if (!v11
      || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
      && (*(_DWORD *)buf = 134218240,
          double v45 = *(double *)&pixelBuffer,
          __int16 v46 = 1024,
          LODWORD(v47) = v11,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v11 = v41) == 0))
    {
      BaseAddress = CVPixelBufferGetBaseAddress(self->_inputBuffer.value_);
      id v17 = [v10 data];
      uint64_t v18 = (const void *)[v17 bytes];
      uint64_t v19 = [(id)objc_opt_class() embeddingLength];
      memcpy(BaseAddress, v18, 2 * v19);

      int v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v41);
      if (!v11)
      {
        int v11 = espresso_plan_execute_sync();
        if (v11)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            __int16 v20 = VCPLogInstance();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to execute network", buf, 2u);
            }
          }
        }
        else
        {
          [(id)objc_opt_class() thresholdBase];
          *a4 = *(float *)self->_biasBuffer.data;
          data = (float *)self->_scaleBuffer.data;
          float v35 = *data;
          *a5 = *data;
          *a6 = (float)(v36 - *a4) / v35;
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              double v38 = *a4;
              double v39 = *a5;
              double v40 = *a6;
              *(_DWORD *)buf = 134218496;
              double v45 = v38;
              __int16 v46 = 2048;
              double v47 = v39;
              __int16 v48 = 2048;
              double v49 = v40;
              _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_INFO, "Bias: %0.3f  Scale: %0.3f  Threshold: %0.3f", buf, 0x20u);
            }
          }
          int v11 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v26) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
    int v11 = -50;
    int v41 = -50;
  }
  if (pixelBuffer
    && !v41
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }
LABEL_32:

  return v11;
}

- (int)processEmbedding:(id)a3 bias:(float *)a4 scale:(float *)a5 threshold:(float *)a6
{
  id v10 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__MADTextEmbeddingThreshold_processEmbedding_bias_scale_threshold___block_invoke;
  v14[3] = &unk_1E62984A8;
  v14[4] = self;
  id v15 = v10;
  __int16 v16 = &v20;
  id v17 = a4;
  uint64_t v18 = a5;
  uint64_t v19 = a6;
  id v12 = v10;
  dispatch_sync(queue, v14);
  LODWORD(a5) = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return (int)a5;
}

uint64_t __67__MADTextEmbeddingThreshold_processEmbedding_bias_scale_threshold___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _processEmbedding:*(void *)(a1 + 40) bias:*(void *)(a1 + 56) scale:*(void *)(a1 + 64) threshold:*(void *)(a1 + 72)];
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