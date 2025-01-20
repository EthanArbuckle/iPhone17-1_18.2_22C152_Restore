@interface VCPMADMLScalingTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
+ (int64_t)getDownsamplingMode;
- (BOOL)autoCancellable;
- (VCPMADMLScalingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (id).cxx_construct;
- (int)convertPixelFormat:(__CVBuffer *)a3;
- (int)run;
- (void)cancel;
@end

@implementation VCPMADMLScalingTask

- (VCPMADMLScalingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADMLScalingTask;
  v12 = [(VCPMADMLScalingTask *)&v15 init];
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

+ (int64_t)getDownsamplingMode
{
  return 2;
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
  v23[0] = &unk_1F15EBB68;
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

- (int)run
{
  v115[1] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  uint64_t v3 = [(MADMLScalingRequest *)self->_request scaledImageWidth];
  uint64_t v4 = [(MADMLScalingRequest *)self->_request scaledImageHeight];
  v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = VCPSignPostLog();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPMADMLScalingTask", "", (uint8_t *)&buf, 2u);
  }

  CVPixelBufferRef texture = 0;
  int v92 = 0;
  if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&texture orientation:&v92])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "VCPMADMLScalingTask: Failed to load pixel buffer", (uint8_t *)&buf, 2u);
      }
    }
    request = self->_request;
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v114 = *MEMORY[0x1E4F28568];
    v12 = [NSString stringWithFormat:@"Failed to load pixel buffer"];
    v115[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:&v114 count:1];
    uint64_t v14 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v13];
    [(MADMLScalingRequest *)request setError:v14];

    goto LABEL_10;
  }
  if (CVPixelBufferGetPixelFormatType(texture) != 1111970369
    && [(VCPMADMLScalingTask *)self convertPixelFormat:&texture])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      CFDictionaryRef v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to convert pixel format", (uint8_t *)&buf, 2u);
      }
    }
    int v18 = self->_request;
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v112 = *MEMORY[0x1E4F28568];
    __int16 v20 = [NSString stringWithFormat:@"Failed to convert pixel format"];
    v113 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
    uint64_t v22 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v21];
    [(MADMLScalingRequest *)v18 setError:v22];

    goto LABEL_10;
  }
  int Width = CVPixelBufferGetWidth(texture);
  int Height = CVPixelBufferGetHeight(texture);
  p_outputPixelBufferPool = &self->_outputPixelBufferPool;
  v26 = self->_outputPixelBufferPool.value_;
  if (!v26)
  {
    value.data = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v34 = Mutable;
    theDict[0] = Mutable;
    if (value.data && Mutable)
    {
      valuePtr[0] = v3;
      CFNumberRef v35 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      buf.data = v35;
      if (v35) {
        CFDictionarySetValue(v34, (const void *)*MEMORY[0x1E4F24E10], v35);
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf.data);
      v36 = theDict[0];
      valuePtr[0] = v4;
      CFNumberRef v37 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      buf.data = v37;
      if (v37) {
        CFDictionarySetValue(v36, (const void *)*MEMORY[0x1E4F24D08], v37);
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf.data);
      v38 = theDict[0];
      valuePtr[0] = 1111970369;
      CFNumberRef v39 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      buf.data = v39;
      if (v39) {
        CFDictionarySetValue(v38, (const void *)*MEMORY[0x1E4F24D70], v39);
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf.data);
      CFDictionarySetValue(theDict[0], (const void *)*MEMORY[0x1E4F24D20], value.data);
      CFDictionaryRef v40 = theDict[0];
      if (p_outputPixelBufferPool->value_)
      {
        CFRelease(p_outputPixelBufferPool->value_);
        p_outputPixelBufferPool->value_ = 0;
      }
      if (!CVPixelBufferPoolCreate(0, 0, v40, &self->_outputPixelBufferPool.value_))
      {
        CF<opaqueCMSampleBuffer *>::~CF((const void **)theDict);
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&value.data);
        v26 = p_outputPixelBufferPool->value_;
        goto LABEL_22;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.data) = 0;
          _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to create pixel buffer pool", (uint8_t *)&buf, 2u);
        }
      }
      v42 = self->_request;
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v108 = *MEMORY[0x1E4F28568];
      v44 = [NSString stringWithFormat:@"Failed to create pixel buffer pool"];
      v109 = v44;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      v46 = [v43 errorWithDomain:*MEMORY[0x1E4F28760] code:-108 userInfo:v45];
      [(MADMLScalingRequest *)v42 setError:v46];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.data) = 0;
          _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to create pixel buffer pool", (uint8_t *)&buf, 2u);
        }
      }
      v57 = self->_request;
      v58 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v110 = *MEMORY[0x1E4F28568];
      v44 = [NSString stringWithFormat:@"Failed to create pixel buffer pool"];
      v111 = v44;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
      v46 = [v58 errorWithDomain:*MEMORY[0x1E4F28760] code:-108 userInfo:v45];
      [(MADMLScalingRequest *)v57 setError:v46];
    }

    CF<opaqueCMSampleBuffer *>::~CF((const void **)theDict);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&value.data);
LABEL_10:
    objc_super v15 = 0;
    goto LABEL_11;
  }
LABEL_22:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (CVPixelBufferPoolCreatePixelBuffer(0, v26, (CVPixelBufferRef *)&cf))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to create pixel buffer", (uint8_t *)&buf, 2u);
      }
    }
    v28 = self->_request;
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v106 = *MEMORY[0x1E4F28568];
    v30 = [NSString stringWithFormat:@"Failed to create pixel buffer"];
    v107 = v30;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    v32 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-108 userInfo:v31];
    [(MADMLScalingRequest *)v28 setError:v32];

    goto LABEL_10;
  }
  if ((int)v3 < Width || (int)v4 < Height)
  {
    float v59 = (float)(int)v3 / (float)Width;
    if (+[VCPMADMLScalingTask getDownsamplingMode])
    {
      if (+[VCPMADMLScalingTask getDownsamplingMode] == 1)
      {
        v60 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:texture];
        v102[0] = @"inputScale";
        *(float *)&double v61 = v59;
        v62 = [NSNumber numberWithFloat:v61];
        v103[0] = v62;
        v103[1] = &unk_1F15EBB80;
        v102[1] = @"inputB";
        v102[2] = @"inputC";
        v103[2] = &unk_1F15EB088;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
        v64 = [v60 imageByApplyingFilter:@"CIBicubicScaleTransform" withInputParameters:v63];

        v65 = [MEMORY[0x1E4F1E018] context];
        [v65 render:v64 toCVPixelBuffer:cf];
      }
      else if (+[VCPMADMLScalingTask getDownsamplingMode] == 2)
      {
        CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)theDict, texture, 1uLL);
        if (!LODWORD(theDict[0]))
        {
          buf.data = CVPixelBufferGetBaseAddress(texture);
          buf.height = CVPixelBufferGetHeight(texture);
          buf.width = CVPixelBufferGetWidth(texture);
          buf.rowBytes = CVPixelBufferGetBytesPerRow(texture);
          CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)valuePtr, (CVPixelBufferRef)cf, 0);
          if (!valuePtr[0])
          {
            value.data = CVPixelBufferGetBaseAddress((CVPixelBufferRef)cf);
            value.height = CVPixelBufferGetHeight((CVPixelBufferRef)cf);
            value.width = CVPixelBufferGetWidth((CVPixelBufferRef)cf);
            value.rowBytes = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)cf);
            vImageScale_ARGB8888(&buf, &value, 0, 0);
            if (!CVPixelBufferLock::Unlock((CVPixelBufferLock *)theDict)
              && !CVPixelBufferLock::Unlock((CVPixelBufferLock *)valuePtr))
            {
              CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)valuePtr);
              CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)theDict);
              goto LABEL_81;
            }
          }
          CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)valuePtr);
        }
        CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)theDict);
        goto LABEL_10;
      }
    }
    else
    {
      v66 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:texture];
      v104 = @"inputScale";
      *(float *)&double v67 = v59;
      v68 = [NSNumber numberWithFloat:v67];
      v105 = v68;
      v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
      v70 = [v66 imageByApplyingFilter:@"CILanczosScaleTransform" withInputParameters:v69];

      v71 = [MEMORY[0x1E4F1E018] context];
      [v71 render:v70 toCVPixelBuffer:cf];
    }
LABEL_81:
    CVBufferPropagateAttachments(texture, (CVBufferRef)cf);
    goto LABEL_82;
  }
  v47 = objc_msgSend(NSString, "stringWithFormat:", @"out_res_%dx%d", v3, v4);
  v48 = [[CNNMLScalerEspresso alloc] initWithConfig:v47 modelIndex:[(MADMLScalingRequest *)self->_request scalingModelIndex] scalingFactor:((int)v3 / Width)];
  v49 = v48;
  if (!v48)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v72 = VCPLogInstance();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1BBEDA000, v72, OS_LOG_TYPE_DEFAULT, "VCPMADMLScalingTask: Failed to initialize model", (uint8_t *)&buf, 2u);
      }
    }
    v73 = self->_request;
    v74 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v100 = *MEMORY[0x1E4F28568];
    v53 = [NSString stringWithFormat:@"Failed to initialize model"];
    v101 = v53;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    v55 = [v74 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v54];
    [(MADMLScalingRequest *)v73 setError:v55];
    goto LABEL_71;
  }
  if ([(CNNMLScalerEspresso *)v48 inferenceWithPixelBuffer:texture toDestinationPixelBuffer:cf])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v50 = VCPLogInstance();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to inference with model", (uint8_t *)&buf, 2u);
      }
    }
    v51 = self->_request;
    v52 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v98 = *MEMORY[0x1E4F28568];
    v53 = [NSString stringWithFormat:@"Failed to inference with model"];
    v99 = v53;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    v55 = [v52 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v54];
    [(MADMLScalingRequest *)v51 setError:v55];
LABEL_71:

    goto LABEL_10;
  }

LABEL_82:
  uint64_t v75 = CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
  if (!v75)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v81 = VCPLogInstance();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1BBEDA000, v81, OS_LOG_TYPE_ERROR, "VCPMADImageCaptionTask failed creating output IOSurface", (uint8_t *)&buf, 2u);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v82 = VCPLogInstance();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask failed creating output IOSurface", (uint8_t *)&buf, 2u);
      }
    }
    v83 = self->_request;
    v84 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v96 = *MEMORY[0x1E4F28568];
    v85 = [NSString stringWithFormat:@"Creating output IOSurface failed"];
    v97 = v85;
    v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    v87 = [v84 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v86];
    [(MADMLScalingRequest *)v83 setError:v87];

    goto LABEL_10;
  }
  v76 = self->_request;
  v77 = (void *)[objc_alloc(MEMORY[0x1E4F74618]) initWithSurface:v75];
  v95 = v77;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
  [(MADMLScalingRequest *)v76 setResults:v78];

  v79 = VCPSignPostLog();
  v80 = v79;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v80, OS_SIGNPOST_INTERVAL_END, v6, "VCPMADMLScalingTask", "", (uint8_t *)&buf, 2u);
  }

  objc_super v15 = (void *)v75;
LABEL_11:
  if (texture) {
    CVPixelBufferRelease(texture);
  }

  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return 0;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_outputPixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end