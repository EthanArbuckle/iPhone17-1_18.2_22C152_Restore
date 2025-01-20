@interface VCPMADMLEnhancementTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADMLEnhancementTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (id).cxx_construct;
- (int)convertPixelFormat:(__CVBuffer *)a3;
- (int)createModel;
- (int)run;
- (void)cancel;
@end

@implementation VCPMADMLEnhancementTask

- (VCPMADMLEnhancementTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADMLEnhancementTask;
  v12 = [(VCPMADMLEnhancementTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
  }

  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    id v11 = (void *)[objc_alloc((Class)a1) initWithRequest:v8 imageAsset:v9 andSignpostPayload:v10];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_super v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v18 = 138412546;
        id v19 = v14;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v18, 0x16u);
      }
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (int)convertPixelFormat:(__CVBuffer *)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v5 = *a3;
  CFTypeRef cf = 0;
  CVPixelBufferRef pixelBuffer = v5;
  p_pixelBufferPool = &self->_pixelBufferPool;
  if (self->_pixelBufferPool.value_) {
    goto LABEL_2;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "Pixel buffer format is not 32BGRA; copying", v19, 2u);
    }
  }
  uint64_t v13 = *MEMORY[0x1E4F24D70];
  v23[0] = &unk_1F15ED518;
  uint64_t v14 = *MEMORY[0x1E4F24E10];
  v22[0] = v13;
  v22[1] = v14;
  objc_super v15 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(pixelBuffer)];
  v23[1] = v15;
  v22[2] = *MEMORY[0x1E4F24D08];
  v16 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(pixelBuffer)];
  v22[3] = *MEMORY[0x1E4F24D20];
  v23[2] = v16;
  v23[3] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

  if (p_pixelBufferPool->value_)
  {
    CFRelease(p_pixelBufferPool->value_);
    p_pixelBufferPool->value_ = 0;
  }
  CVReturn v10 = CVPixelBufferPoolCreate(0, 0, v17, &p_pixelBufferPool->value_);

  if (!v10)
  {
LABEL_2:
    value = self->_transferSession.value_;
    p_transferSession = &self->_transferSession;
    if (value || (CVReturn v10 = VTPixelTransferSessionCreate(0, &p_transferSession->value_)) == 0)
    {
      id v9 = p_pixelBufferPool->value_;
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      CVReturn v10 = CVPixelBufferPoolCreatePixelBuffer(0, v9, (CVPixelBufferRef *)&cf);
      if (!v10)
      {
        CVReturn v10 = VTPixelTransferSessionTransferImage(p_transferSession->value_, pixelBuffer, (CVPixelBufferRef)cf);
        if (!v10)
        {
          id v11 = (__CVBuffer *)cf;
          if (cf) {
            id v11 = (__CVBuffer *)CFRetain(cf);
          }
          CVReturn v10 = 0;
          *a3 = v11;
        }
      }
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
  return v10;
}

- (int)createModel
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = +[VCPMobileAssetManager sharedManager];
  v4 = [v3 retrieveAssetLocalURL:6];
  if (v4)
  {
    v5 = [(MADMLEnhancementRequest *)self->_request uuid];

    if (!v5)
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        uint64_t v15 = (uint64_t)v4;
        goto LABEL_35;
      }
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] UUID not set, creating universal model", buf, 2u);
      }
      uint64_t v15 = (uint64_t)v4;
LABEL_34:

LABEL_35:
      v25 = [MEMORY[0x1E4F1CB10] URLWithString:@"pissarro.espresso.net" relativeToURL:v15];
      v26 = [[CNNMLEnhancerEspresso alloc] initWithModelFile:v25];
      enhancer = self->_enhancer;
      p_enhancer = &self->_enhancer;
      *p_enhancer = v26;

      if (*p_enhancer)
      {
        if ((int)MediaAnalysisLogLevel() < 6)
        {
          int v14 = 0;
          goto LABEL_47;
        }
        v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v25;
          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] Model created from %@", buf, 0xCu);
        }
        int v14 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v14 = -108;
          goto LABEL_47;
        }
        v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Unable to allocate enhancer", buf, 2u);
        }
        int v14 = -108;
      }

LABEL_47:
      v4 = v15;
LABEL_57:

      goto LABEL_58;
    }
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"index.json" relativeToURL:v4];
    v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6];
    if (!v7)
    {
      if ((int)MediaAnalysisLogLevel() < 5)
      {
        uint64_t v15 = (uint64_t)v4;
        goto LABEL_33;
      }
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "[VCPMADMLEnhancementTask] Cannot read index.json, using universal model", buf, 2u);
      }
      uint64_t v15 = (uint64_t)v4;
LABEL_21:

LABEL_33:
      goto LABEL_34;
    }
    id v38 = 0;
    id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v38];
    id v9 = v38;
    if (v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CVReturn v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v9;
          id v11 = "[VCPMADMLEnhancementTask] Serializing index.json error %@";
          v12 = v10;
          uint32_t v13 = 12;
LABEL_51:
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
          goto LABEL_52;
        }
        goto LABEL_52;
      }
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CVReturn v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v11 = "[VCPMADMLEnhancementTask] Parsing index.json error, not a dictionary";
          v12 = v10;
          uint32_t v13 = 2;
          goto LABEL_51;
        }
LABEL_52:
        int v14 = -18;
        v37 = v8;
LABEL_53:

LABEL_54:
        id v8 = v37;
LABEL_56:

        goto LABEL_57;
      }
LABEL_55:
      int v14 = -18;
      goto LABEL_56;
    }
    v16 = [(MADMLEnhancementRequest *)self->_request uuid];
    v37 = [v8 objectForKey:v16];

    if (v37)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFDictionaryRef v17 = [v37 objectForKey:@"name"];
        modelName = self->_modelName;
        self->_modelName = v17;

        id v19 = [v37 objectForKey:@"ver"];
        modelVersion = self->_modelVersion;
        self->_modelVersion = v19;

        uint64_t v15 = [v3 retrieveAssetLocalURL:self->_modelName assetVersion:self->_modelVersion petWatchDog:0 cancelBlock:0];

        if (v15)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v36 = v21;
              uint64_t v22 = self->_modelName;
              v35 = self->_modelVersion;
              uint64_t v23 = [(MADMLEnhancementRequest *)self->_request uuid];
              *(_DWORD *)buf = 138412802;
              v40 = v22;
              __int16 v41 = 2112;
              v21 = v36;
              v42 = v35;
              __int16 v43 = 2112;
              uint64_t v44 = v23;
              v24 = (void *)v23;
              _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] Creating %@ (%@) for %@", buf, 0x20u);
            }
          }

          goto LABEL_21;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          CVReturn v10 = VCPLogInstance();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v33 = self->_modelName;
            v32 = self->_modelVersion;
            v34 = [(MADMLEnhancementRequest *)self->_request uuid];
            *(_DWORD *)buf = 138412802;
            v40 = v33;
            __int16 v41 = 2112;
            v42 = v32;
            __int16 v43 = 2112;
            uint64_t v44 = (uint64_t)v34;
            _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Unable to retrieve %@ (%@) for %@", buf, 0x20u);
          }
          v4 = 0;
LABEL_71:
          int v14 = -18;
LABEL_72:
          id v9 = v8;
          goto LABEL_53;
        }
        v4 = 0;
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CVReturn v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Parsing index.json error, model info is not a dictionary", buf, 2u);
        }
        goto LABEL_71;
      }
      int v14 = -18;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CVReturn v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v31 = [(MADMLEnhancementRequest *)self->_request uuid];
          *(_DWORD *)buf = 138412290;
          v40 = v31;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] No model registered for target %@", buf, 0xCu);
        }
        int v14 = -4;
        goto LABEL_72;
      }
      int v14 = -4;
    }
    id v9 = v8;
    goto LABEL_54;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Unable to retrieve Pissarro index or universal model", buf, 2u);
    }
    int v14 = -18;
    goto LABEL_57;
  }
  int v14 = -18;
LABEL_58:

  return v14;
}

- (int)run
{
  v97[1] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  mach_timebase_info(&info);
  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = mach_absolute_time();
  v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = VCPSignPostLog();
  CVReturn v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPMADMLEnhancementModelCreation", "", (uint8_t *)&buf, 2u);
  }

  CVReturn v11 = [(VCPMADMLEnhancementTask *)self createModel];
  if (!v11)
  {
    v12 = VCPSignPostLog();
    uint32_t v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(buf.data) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v8, "VCPMADMLEnhancementModelCreation", "", (uint8_t *)&buf, 2u);
    }

    if (v6)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    uint64_t v14 = mach_absolute_time();
    uint64_t numer = info.numer;
    LODWORD(v2) = info.denom;
    if ([(MADMLEnhancementRequest *)self->_request modelPreparationOnly])
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.data) = 0;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] Finished model preparation", (uint8_t *)&buf, 2u);
        }
      }
LABEL_21:
      CVReturn v11 = 0;
      goto LABEL_22;
    }
    CVPixelBufferRef pixelBuffer = 0;
    int v84 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&pixelBuffer orientation:&v84])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        CFDictionaryRef v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.data) = 0;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "VCPMADMLEnhancementTask image loading failed", (uint8_t *)&buf, 2u);
        }
      }
      request = self->_request;
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v96 = *MEMORY[0x1E4F28568];
      __int16 v20 = [NSString stringWithFormat:@"Image loading failed"];
      v97[0] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:&v96 count:1];
      uint64_t v22 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v21];
      [(MADMLEnhancementRequest *)request setError:v22];

      goto LABEL_21;
    }
    if (CVPixelBufferGetPixelFormatType(pixelBuffer) != 1111970369) {
      [(VCPMADMLEnhancementTask *)self convertPixelFormat:&pixelBuffer];
    }
    p_outputPixelBufferPool = &self->_outputPixelBufferPool;
    if (self->_outputPixelBufferPool.value_) {
      goto LABEL_26;
    }
    uint64_t v42 = *MEMORY[0x1E4F24E10];
    v94[0] = *MEMORY[0x1E4F24D70];
    v94[1] = v42;
    v95[0] = &unk_1F15ED518;
    v95[1] = &unk_1F15ED530;
    uint64_t v43 = *MEMORY[0x1E4F24D20];
    v94[2] = *MEMORY[0x1E4F24D08];
    v94[3] = v43;
    v95[2] = &unk_1F15ED548;
    v95[3] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:4];
    if (p_outputPixelBufferPool->value_)
    {
      CFRelease(p_outputPixelBufferPool->value_);
      p_outputPixelBufferPool->value_ = 0;
    }
    CVReturn v11 = CVPixelBufferPoolCreate(0, 0, v44, &self->_outputPixelBufferPool.value_);

    if (!v11)
    {
LABEL_26:
      uint64_t v25 = mach_absolute_time();
      uint64_t v74 = mach_absolute_time();
      v26 = VCPSignPostLog();
      os_signpost_id_t spid = os_signpost_id_generate(v26);

      v27 = VCPSignPostLog();
      v28 = v27;
      unint64_t v73 = spid - 1;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        uint64_t v29 = v25;
        modelName = self->_modelName;
        modelVersion = self->_modelVersion;
        v32 = [(MADMLEnhancementRequest *)self->_request uuid];
        LODWORD(buf.data) = 138412802;
        *(void **)((char *)&buf.data + 4) = modelName;
        WORD2(buf.height) = 2112;
        *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)modelVersion;
        HIWORD(buf.width) = 2112;
        buf.rowBytes = (size_t)v32;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADMLEnhancementModelExecution", "%@-%@ (%@)", (uint8_t *)&buf, 0x20u);

        uint64_t v25 = v29;
      }

      if (CVPixelBufferGetWidth(pixelBuffer) == 3840 && CVPixelBufferGetHeight(pixelBuffer) == 2160)
      {
        int v33 = 0;
        goto LABEL_32;
      }
      CVReturn v81 = 0;
      CVPixelBufferRef v82 = pixelBuffer;
      CVPixelBufferLockFlags unlockFlags = 1;
      if (pixelBuffer)
      {
        CVReturn v11 = CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
        CVReturn v81 = v11;
        if (!v11
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (LODWORD(buf.data) = 134218240,
              *(void **)((char *)&buf.data + 4) = v82,
              WORD2(buf.height) = 1024,
              *(_DWORD *)((char *)&buf.height + 6) = v11,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (CVReturn v11 = v81) == 0))
        {
          buf.data = CVPixelBufferGetBaseAddress(pixelBuffer);
          buf.height = CVPixelBufferGetHeight(pixelBuffer);
          buf.width = CVPixelBufferGetWidth(pixelBuffer);
          buf.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
          CVPixelBufferRef pixelBufferOut = 0;
          int v75 = CVPixelBufferPoolCreatePixelBuffer(0, p_outputPixelBufferPool->value_, &pixelBufferOut);
          if (v75)
          {
            CVReturn v11 = 0;
            int v41 = 16;
            goto LABEL_60;
          }
          CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)v79, pixelBufferOut, 0);
          CVReturn v11 = v79[0];
          if (v79[0])
          {
            int v75 = 0;
          }
          else
          {
            dest.data = CVPixelBufferGetBaseAddress(pixelBufferOut);
            dest.height = CVPixelBufferGetHeight(pixelBufferOut);
            dest.width = CVPixelBufferGetWidth(pixelBufferOut);
            dest.rowBytes = CVPixelBufferGetBytesPerRow(pixelBufferOut);
            int v75 = vImageScale_ARGB8888(&buf, &dest, 0, 0x20u);
            if (v75)
            {
              CVReturn v11 = 0;
              int v41 = 16;
              goto LABEL_59;
            }
            CVReturn v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v79);
            if (!v11)
            {
              CVReturn v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v81);
              if (!v11)
              {
                CVPixelBufferRelease(pixelBuffer);
                int v41 = 0;
                CVReturn v11 = 0;
                CVPixelBufferRef pixelBuffer = pixelBufferOut;
                goto LABEL_59;
              }
            }
          }
          int v41 = 1;
LABEL_59:
          CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)v79);
LABEL_60:
          if (v82
            && !v81
            && CVPixelBufferUnlockBaseAddress(v82, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
          if (v41)
          {
            if (v41 != 16) {
              goto LABEL_22;
            }
            goto LABEL_67;
          }
          int v33 = v75;
LABEL_32:
          value = p_outputPixelBufferPool->value_;
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          int v75 = CVPixelBufferPoolCreatePixelBuffer(0, value, (CVPixelBufferRef *)&cf);
          if (!v75)
          {
            [(CNNMLEnhancerEspresso *)self->_enhancer inferenceWithPixelBuffer:pixelBuffer toDestinationPixelBuffer:cf];
            uint64_t v35 = CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
            if (!v35 && (int)MediaAnalysisLogLevel() >= 3)
            {
              v36 = VCPLogInstance();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf.data) = 0;
                _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, "VCPMADMLEnhancementTask failed creating output IOSurface", (uint8_t *)&buf, 2u);
              }
            }
            v37 = self->_request;
            id v38 = (void *)[objc_alloc(MEMORY[0x1E4F74608]) initWithSurface:v35];
            v92 = v38;
            v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
            [(MADMLEnhancementRequest *)v37 setResults:v39];

            v40 = (void *)v35;
            int v75 = v33;
            goto LABEL_68;
          }
LABEL_67:
          v40 = 0;
LABEL_68:
          v53 = VCPSignPostLog();
          v54 = v53;
          if (v73 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
          {
            LOWORD(buf.data) = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v54, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADMLEnhancementModelExecution", "", (uint8_t *)&buf, 2u);
          }

          if (v74)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          uint64_t v55 = v25;
          uint64_t v56 = mach_absolute_time();
          uint64_t v57 = info.numer;
          LODWORD(v3) = info.denom;
          v90[0] = @"QoS";
          qos_class_t v58 = qos_class_self();
          spida = VCPMAQoSDescription(v58);
          v91[0] = spida;
          v91[1] = @"AerialWallpaperEnhancement";
          v90[1] = @"RequestType";
          v90[2] = @"AssetType";
          v59 = (__CFString *)self->_modelName;
          v60 = (__CFString *)self->_modelVersion;
          if (!v59) {
            v59 = @"Unknown";
          }
          if (!v60) {
            v60 = @"Unknown";
          }
          v91[2] = v59;
          v91[3] = v60;
          v90[3] = @"AssetSubtype";
          v90[4] = @"Client";
          v61 = [(MADMLEnhancementRequest *)self->_request uuid];
          if (v61)
          {
            v62 = [(MADMLEnhancementRequest *)self->_request uuid];
          }
          else
          {
            v62 = @"Unknown";
          }
          v91[4] = v62;
          v90[5] = @"QueuedTime";
          v63 = [NSNumber numberWithDouble:(double)((v14 - v5) * numer) / (double)v2 / 1000000.0];
          v91[5] = v63;
          v90[6] = @"ProcessingTime";
          v64 = [NSNumber numberWithDouble:(double)((v56 - v55) * v57) / (double)v3 / 1000000.0];
          v91[6] = v64;
          v90[7] = @"Error";
          v65 = [NSNumber numberWithInt:-v75];
          v91[7] = v65;
          v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:8];

          if (v61) {
          v67 = +[VCPMADCoreAnalyticsManager sharedManager];
          }
          [v67 sendEvent:@"com.apple.mediaanalysisd.service.request" withAnalytics:v66];

          if (v75)
          {
            v68 = self->_request;
            v69 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v88 = *MEMORY[0x1E4F28568];
            v70 = [NSString stringWithFormat:@"Image pre-processing failed"];
            v89 = v70;
            v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
            v72 = [v69 errorWithDomain:*MEMORY[0x1E4F28760] code:v75 userInfo:v71];
            [(MADMLEnhancementRequest *)v68 setError:v72];
          }
          else if (pixelBuffer)
          {
            CVPixelBufferRelease(pixelBuffer);
          }

          goto LABEL_21;
        }
      }
      else
      {
        BOOL v45 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v45) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v45, v46, v47, v48, v49, v50, v51, v52);
        }
        CVReturn v11 = -50;
      }
    }
  }
LABEL_22:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v11;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_outputPixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_enhancer, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end