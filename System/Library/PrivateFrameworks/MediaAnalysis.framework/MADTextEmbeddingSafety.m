@interface MADTextEmbeddingSafety
+ (NSString)modelName;
+ (float)threshold;
+ (id)createForEmbeddingVersion:(unint64_t)a3;
+ (unint64_t)embeddingLength;
+ (unint64_t)embeddingVersion;
- (MADTextEmbeddingSafety)init;
- (id).cxx_construct;
- (int)_createPlan;
- (int)_loadResources;
- (int)_processEmbedding:(id)a3 safetyScore:(float *)a4 isSafe:(BOOL *)a5;
- (int)loadResources;
- (int)processEmbedding:(id)a3 safetyScore:(float *)a4 isSafe:(BOOL *)a5;
- (void)dealloc;
@end

@implementation MADTextEmbeddingSafety

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

+ (float)threshold
{
  return 0.0;
}

- (MADTextEmbeddingSafety)init
{
  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingSafety;
  v2 = [(MADTextEmbeddingSafety *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MADTextEmbeddingSafety", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)createForEmbeddingVersion:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    v3 = objc_alloc_init(MADTextEmbeddingSafetyMD5);
  }
  else
  {
    int v4 = a3;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67109120;
        v7[1] = v4;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[Text|Safety] Embedding version %d not supported", (uint8_t *)v7, 8u);
      }
    }
    v3 = 0;
  }
  return v3;
}

- (void)dealloc
{
  if (espresso_plan_destroy() && (int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "[Text|Safety] Failed to destroy plan", buf, 2u);
    }
  }
  if (espresso_context_destroy() && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[Text|Safety] Failed to destroy context", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MADTextEmbeddingSafety;
  [(MADTextEmbeddingSafety *)&v5 dealloc];
}

- (int)_createPlan
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan) {
    return -18;
  }
  int v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  objc_super v5 = [v4 resourceURL];

  v6 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v7 = [(id)objc_opt_class() modelName];
  uint64_t v8 = [v6 URLWithString:v7 relativeToURL:v5];

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
          if (!blob_dimensions) {
            int blob_dimensions = espresso_network_bind_buffer();
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
  p_inputBuffer = &self->_inputBuffer;
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
        CVReturn v5 = [(MADTextEmbeddingSafety *)self _createPlan];
        if (v5)
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
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[Text|Safety] Failed to create ANE context", v11, 2u);
        }
      }
      return -18;
    }
    return v5;
  }
  uint64_t v12 = *MEMORY[0x1E4F24D20];
  v13[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  size_t v7 = [(id)objc_opt_class() embeddingLength];
  if (p_inputBuffer->value_)
  {
    CFRelease(p_inputBuffer->value_);
    p_inputBuffer->value_ = 0;
  }
  CVReturn v5 = CVPixelBufferCreate(0, v7, 1uLL, 0x4C303068u, v6, &p_inputBuffer->value_);
  if (!v5)
  {

    goto LABEL_2;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[Text|Safety] Failed to create input buffer", v11, 2u);
    }
  }
  return v5;
}

- (int)loadResources
{
  uint64_t v6 = 0;
  size_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MADTextEmbeddingSafety_loadResources__block_invoke;
  v5[3] = &unk_1E6297458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__MADTextEmbeddingSafety_loadResources__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _loadResources];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_processEmbedding:(id)a3 safetyScore:(float *)a4 isSafe:(BOOL *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [(MADTextEmbeddingSafety *)self _loadResources];
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[Text|Safety] Failed to load network", buf, 2u);
      }
    }
    goto LABEL_32;
  }
  uint64_t v11 = [v8 version];
  if (v11 != [(id)objc_opt_class() embeddingVersion])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "version"));
        *(_DWORD *)buf = 138412290;
        double v43 = *(double *)&v20;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[Text|Safety] Embedding version (%@) is not supported", buf, 0xCu);
      }
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  if ([v8 type] != 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "type"));
        *(_DWORD *)buf = 138412290;
        double v43 = *(double *)&v21;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[Text|Safety] Embedding type (%@) is not supported", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_31:
    int v9 = -50;
    goto LABEL_32;
  }
  uint64_t v12 = [v8 count];
  if (v12 != [(id)objc_opt_class() embeddingLength])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        *(_DWORD *)buf = 138412290;
        double v43 = *(double *)&v22;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[Text|Safety] Embedding size (%@) is not supported", buf, 0xCu);
      }
LABEL_30:

      goto LABEL_31;
    }
    goto LABEL_31;
  }
  value = self->_inputBuffer.value_;
  int v39 = 0;
  CVPixelBufferRef pixelBuffer = value;
  CVPixelBufferLockFlags unlockFlags = 0;
  if (value)
  {
    int v9 = CVPixelBufferLockBaseAddress(value, 0);
    int v39 = v9;
    if (!v9
      || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
      && (*(_DWORD *)buf = 134218240,
          double v43 = *(double *)&pixelBuffer,
          __int16 v44 = 1024,
          LODWORD(v45) = v9,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v9 = v39) == 0))
    {
      BaseAddress = CVPixelBufferGetBaseAddress(self->_inputBuffer.value_);
      id v15 = [v8 data];
      v16 = (const void *)[v15 bytes];
      uint64_t v17 = [(id)objc_opt_class() embeddingLength];
      memcpy(BaseAddress, v16, 2 * v17);

      int v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v39);
      if (!v9)
      {
        int v9 = espresso_plan_execute_sync();
        if (v9)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            __int16 v18 = VCPLogInstance();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[Text|Safety] Failed to execute network", buf, 2u);
            }
          }
        }
        else
        {
          data = (float *)self->_outputBuffer.data;
          float v33 = *data;
          *a4 = *data;
          [(id)objc_opt_class() threshold];
          *a5 = v33 <= v34;
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v35 = VCPLogInstance();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              float v36 = *a4;
              [(id)objc_opt_class() threshold];
              BOOL v37 = *a5;
              *(_DWORD *)buf = 134218496;
              double v43 = v36;
              __int16 v44 = 2048;
              double v45 = v38;
              __int16 v46 = 1024;
              BOOL v47 = v37;
              _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_INFO, "Score: %0.3f  Threshold: %0.3f  Safe: %d", buf, 0x1Cu);
            }
          }
          int v9 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v24) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    int v9 = -50;
    int v39 = -50;
  }
  if (pixelBuffer
    && !v39
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }
LABEL_32:

  return v9;
}

- (int)processEmbedding:(id)a3 safetyScore:(float *)a4 isSafe:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MADTextEmbeddingSafety_processEmbedding_safetyScore_isSafe___block_invoke;
  block[3] = &unk_1E629C6E8;
  block[4] = self;
  id v13 = v8;
  v14 = &v17;
  id v15 = a4;
  v16 = a5;
  id v10 = v8;
  dispatch_sync(queue, block);
  LODWORD(a4) = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return (int)a4;
}

uint64_t __62__MADTextEmbeddingSafety_processEmbedding_safetyScore_isSafe___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _processEmbedding:*(void *)(a1 + 40) safetyScore:*(void *)(a1 + 56) isSafe:*(void *)(a1 + 64)];
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
  *((void *)self + 6) = 0;
  return self;
}

@end