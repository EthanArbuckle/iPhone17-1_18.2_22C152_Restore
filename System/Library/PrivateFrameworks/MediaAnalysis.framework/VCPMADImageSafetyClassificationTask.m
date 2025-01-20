@interface VCPMADImageSafetyClassificationTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADImageSafetyClassificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (id).cxx_construct;
- (int)createUprightPixelBuffer:(__CVBuffer *)a3 fromSourceBuffer:(__CVBuffer *)a4 andOrientation:(unsigned int)a5;
- (int)run;
- (void)cancel;
@end

@implementation VCPMADImageSafetyClassificationTask

- (VCPMADImageSafetyClassificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADImageSafetyClassificationTask;
  v12 = [(VCPMADImageSafetyClassificationTask *)&v15 init];
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

- (int)createUprightPixelBuffer:(__CVBuffer *)a3 fromSourceBuffer:(__CVBuffer *)a4 andOrientation:(unsigned int)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (a5 == 1)
  {
    CVReturn v7 = 0;
    *a3 = (__CVBuffer *)CFRetain(a4);
    return v7;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  OSType v10 = PixelFormatType;
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType == 1111970369) {
      goto LABEL_9;
    }
    int v11 = 1380401729;
  }
  else
  {
    if (PixelFormatType == 32) {
      goto LABEL_9;
    }
    int v11 = 1094862674;
  }
  if (PixelFormatType == v11)
  {
LABEL_9:
    size_t Width = CVPixelBufferGetWidth(a4);
    size_t Height = CVPixelBufferGetHeight(a4);
    size_t v14 = Height;
    if (a5 <= 4) {
      size_t v15 = Width;
    }
    else {
      size_t v15 = Height;
    }
    if (a5 <= 4) {
      size_t v16 = Height;
    }
    else {
      size_t v16 = Width;
    }
    *(_OWORD *)v67 = 0u;
    memset(buf, 0, sizeof(buf));
    switch(a5)
    {
      case 2u:
        double v17 = (double)Width;
        *(void *)buf = 0xBFF0000000000000;
        *(void *)&buf[8] = 0;
        *(void *)&buf[16] = 0;
        *(void *)&buf[24] = 0x3FF0000000000000;
        goto LABEL_31;
      case 3u:
        double v21 = (double)Width;
        double v22 = (double)Height;
        *(void *)buf = 0xBFF0000000000000;
        *(void *)&buf[8] = 0;
        *(void *)&buf[16] = 0;
        *(void *)&buf[24] = 0xBFF0000000000000;
        goto LABEL_28;
      case 4u:
        double v19 = (double)Height;
        *(void *)buf = 0x3FF0000000000000;
        *(void *)&buf[8] = 0;
        *(void *)&buf[16] = 0;
        *(void *)&buf[24] = 0xBFF0000000000000;
        goto LABEL_25;
      case 5u:
        double v21 = (double)Height;
        double v22 = (double)Width;
        __asm { FMOV            V2.2D, #-1.0 }
        *(_OWORD *)&buf[8] = _Q2;
LABEL_28:
        v67[0] = v21;
        v67[1] = v22;
        break;
      case 6u:
        double v19 = (double)Width;
        *(_OWORD *)&buf[8] = xmmword_1BC281070;
        *(void *)&buf[24] = 0;
        v67[0] = 0.0;
LABEL_25:
        v67[1] = v19;
        break;
      case 7u:
        __asm { FMOV            V0.2D, #1.0; jumptable 00000001BBF469A8 case 7 }
        *(_OWORD *)&buf[8] = _Q0;
        *(_OWORD *)v67 = 0uLL;
        *(void *)&buf[24] = 0;
        break;
      case 8u:
        double v17 = (double)Height;
        *(_OWORD *)&buf[8] = xmmword_1BC281060;
LABEL_31:
        v67[0] = v17;
        break;
      default:
        long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&buf[16] = v20;
        *(_OWORD *)v67 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        break;
    }
    CFTypeRef cf = 0;
    uint64_t v64 = *MEMORY[0x1E4F24D20];
    uint64_t v65 = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    CVReturn v7 = CVPixelBufferCreate(0, v15, v16, v10, v29, (CVPixelBufferRef *)&cf);
    if (v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v62 = 0;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask CVPixelBuffer creation failed", v62, 2u);
        }
      }
    }
    else
    {
      CVReturn v56 = 0;
      CVPixelBufferRef v57 = a4;
      CVPixelBufferLockFlags v58 = 1;
      if (a4)
      {
        CVReturn v7 = CVPixelBufferLockBaseAddress(a4, 1uLL);
        CVReturn v56 = v7;
        if (!v7
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v62 = 134218240,
              *(void *)&v62[4] = v57,
              *(_WORD *)&v62[12] = 1024,
              *(_DWORD *)&v62[14] = v7,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v62, 0x12u), (CVReturn v7 = v56) == 0))
        {
          *(void *)v62 = CVPixelBufferGetBaseAddress(a4);
          *(void *)&v62[8] = v14;
          *(void *)&v62[16] = Width;
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
          CVReturn v53 = 0;
          CVPixelBufferRef pixelBuffer = (CVPixelBufferRef)cf;
          CVPixelBufferLockFlags unlockFlags = 0;
          if (cf)
          {
            CVReturn v7 = CVPixelBufferLockBaseAddress((CVPixelBufferRef)cf, 0);
            CVReturn v53 = v7;
            if (!v7
              || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)v60 = 134218240,
                  *(void *)&v60[4] = pixelBuffer,
                  *(_WORD *)&v60[12] = 1024,
                  *(_DWORD *)&v60[14] = v7,
                  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v60, 0x12u), (CVReturn v7 = v53) == 0))
            {
              *(void *)v60 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)cf);
              *(void *)&v60[8] = v16;
              *(void *)&v60[16] = v15;
              size_t v61 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)cf);
              int v52 = 0;
              CVReturn v31 = MEMORY[0x1C186DE50](v62, v60, 0, buf, &v52, 4);
              CVReturn v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v53);
              if (!v7)
              {
                CVReturn v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v56);
                if (!v7)
                {
                  if (v31)
                  {
                    CVReturn v7 = v31;
                    if ((int)MediaAnalysisLogLevel() >= 3)
                    {
                      v49 = VCPLogInstance();
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)v51 = 0;
                        _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask failed to warp image", v51, 2u);
                      }
                    }
                  }
                  else
                  {
                    v50 = (__CVBuffer *)cf;
                    if (cf) {
                      v50 = (__CVBuffer *)CFRetain(cf);
                    }
                    CVReturn v7 = 0;
                    *a3 = v50;
                  }
                }
              }
              if (pixelBuffer
                && !v53
                && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
                && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
              }
            }
          }
          else
          {
            BOOL v41 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v41) {
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v41, v42, v43, v44, v45, v46, v47, v48);
            }
            CVReturn v7 = -50;
          }
          if (v57
            && !v56
            && CVPixelBufferUnlockBaseAddress(v57, v58)
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
        }
      }
      else
      {
        BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v32) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v32, v33, v34, v35, v36, v37, v38, v39);
        }
        CVReturn v7 = -50;
      }
    }

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
    return v7;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask failed: unsupported pixel format %d", buf, 8u);
    }
  }
  return -50;
}

- (int)run
{
  v138[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask running...", buf, 2u);
    }
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v4) {
    return -128;
  }
  if (![(VCPMADServiceImageAsset *)self->_imageAsset userSafetyEligible])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      double v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "User Safety either not entitled for client or not enabled", buf, 2u);
      }
    }
    request = self->_request;
    double v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v137 = *MEMORY[0x1E4F28568];
    double v22 = [NSString stringWithFormat:@"User Safety either not entitled for client or not enabled"];
    v138[0] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:&v137 count:1];
    v24 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v23];
    [(MADImageSafetyClassificationRequest *)request setError:v24];

    return 0;
  }
  v5 = [MEMORY[0x1E4F1C9C8] now];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  if (+[MADUserSafetyQRCodeDetector enabled])
  {
    id v8 = (void *)MEMORY[0x1C186D320]();
    id v9 = objc_alloc_init(MADUserSafetyImageQRCodeDetector);
    OSType v10 = [(MADUserSafetyImageQRCodeDetector *)v9 sensitivityFromQRCodeInImage:self->_imageAsset signpostPayload:self->_signpostPayload];
    int v11 = v10;
    if (v10)
    {
      if ([v10 BOOLValue])
      {
        uint64_t v12 = *MEMORY[0x1E4F9A668];
        v133[0] = *MEMORY[0x1E4F9A660];
        v133[1] = v12;
        v134[0] = MEMORY[0x1E4F1CC38];
        v134[1] = &unk_1F15EB078;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:2];
        size_t v14 = self->_request;
        size_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F745F8]) initWithIsSensitive:1 andAttributes:v13];
        v132 = v15;
        size_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
        [(MADImageSafetyClassificationRequest *)v14 setResults:v16];

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          double v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask complete", buf, 2u);
          }
        }
        return 0;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (NSString *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v136 = v26;
        v27 = v26;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, "[%@] processing failed.", buf, 0xCu);
      }
    }
  }
  v28 = [(VCPMADServiceImageAsset *)self->_imageAsset nsfwClassifications];
  if (v28)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      CFDictionaryRef v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "VCPMADImageSafetyClassificationTask leveraging pre-computed IVS result", buf, 2u);
      }
    }
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v30 = v28;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v115 objects:v131 count:16];
    double v32 = 0.0;
    if (v31)
    {
      uint64_t v33 = *(void *)v116;
      while (2)
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v116 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void **)(*((void *)&v115 + 1) + 8 * i);
          if ([v35 extendedSceneIdentifier] == 2147481854)
          {
            [v35 confidence];
            double v32 = v37;
            uint64_t v38 = (void *)MEMORY[0x1E4F9A610];
            uint64_t v39 = VCPSpecialLabelFromExtendedSceneClassificationID([v35 extendedSceneIdentifier]);
            uint64_t v36 = [v38 isImageSensitiveForLabel:v39 confidenceScore:2 classificationMode:v32];

            goto LABEL_41;
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v115 objects:v131 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }
    uint64_t v36 = 0;
LABEL_41:

    v129[0] = *MEMORY[0x1E4F9A660];
    v40 = [NSNumber numberWithBool:v36];
    v130[0] = v40;
    v129[1] = *MEMORY[0x1E4F9A668];
    BOOL v41 = [NSNumber numberWithDouble:v32];
    v130[1] = v41;
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:2];

    uint64_t v43 = self->_request;
    uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F745F8]) initWithIsSensitive:v36 andAttributes:v42];
    v128 = v44;
    uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
    [(MADImageSafetyClassificationRequest *)v43 setResults:v45];

    uint64_t v46 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];
    MADPLLogIVSProcessing(v46, 1, [(VCPMADServiceImageAsset *)self->_imageAsset assetType], v7);

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v47 = VCPLogInstance();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask complete", buf, 2u);
      }
    }
    goto LABEL_98;
  }
  [(VCPMADImageSafetyClassificationTask *)self logMemoryWithMessage:@"[ImageSafety] Before decode"];
  v114 = 0;
  unsigned int v113 = 0;
  if ([(VCPMADServiceImageAsset *)self->_imageAsset loadLowResPixelBuffer:&v114 orientation:&v113])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v48 = VCPLogInstance();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_DEFAULT, "VCPMADImageSafetyClassificationTask image loading failed", buf, 2u);
      }
    }
    v49 = self->_request;
    v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v126 = *MEMORY[0x1E4F28568];
    v51 = [NSString stringWithFormat:@"Image loading failed"];
    v127 = v51;
    int v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
    CVReturn v53 = [v50 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v52];
    [(MADImageSafetyClassificationRequest *)v49 setError:v53];

    goto LABEL_97;
  }
  v51 = +[MADImageSafetyClassificationResource sharedResource];
  v54 = +[VCPMADResourceManager sharedManager];
  int v52 = [v54 activateResource:v51];

  v55 = VCPSignPostLog();
  os_signpost_id_t v56 = os_signpost_id_generate(v55);

  CVPixelBufferRef v57 = VCPSignPostLog();
  CVPixelBufferLockFlags v58 = v57;
  if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v136 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "CommSafetyHandler_scale", "%@", buf, 0xCu);
  }

  v112 = 0;
  Scaler::Scale(&self->_scaler, v114, &v112, 299, 299, 1111970369);
  if (v60)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      size_t v61 = VCPLogInstance();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask image pre-processing failed", buf, 2u);
      }
    }
    v62 = self->_request;
    v63 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v124 = *MEMORY[0x1E4F28568];
    uint64_t v64 = [NSString stringWithFormat:@"Image pre-processing failed"];
    v125 = v64;
    uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
    v66 = [v63 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v65];
    [(MADImageSafetyClassificationRequest *)v62 setError:v66];

    goto LABEL_96;
  }
  v67 = VCPSignPostLog();
  uint64_t v68 = v67;
  if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    v69 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v136 = v69;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v68, OS_SIGNPOST_INTERVAL_END, v56, "CommSafetyHandler_scale", "%@", buf, 0xCu);
  }

  v70 = VCPSignPostLog();
  os_signpost_id_t v71 = os_signpost_id_generate(v70);

  v72 = VCPSignPostLog();
  v73 = v72;
  if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
  {
    v74 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v136 = v74;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v73, OS_SIGNPOST_INTERVAL_BEGIN, v71, "CommSafetyHandler_affine", "%@", buf, 0xCu);
  }

  v111 = 0;
  if ([(VCPMADImageSafetyClassificationTask *)self createUprightPixelBuffer:&v111 fromSourceBuffer:v112 andOrientation:v113])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v75 = VCPLogInstance();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v75, OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask image affine transform failed", buf, 2u);
      }
    }
    v76 = self->_request;
    v77 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v122 = *MEMORY[0x1E4F28568];
    uint64_t v123 = [NSString stringWithFormat:@"Image affine transform failed"];
    v109 = (void *)v123;
    id v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
    v79 = [v77 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v78];
    [(MADImageSafetyClassificationRequest *)v76 setError:v79];
    goto LABEL_95;
  }
  v80 = VCPSignPostLog();
  v81 = v80;
  if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
  {
    v82 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v136 = v82;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v81, OS_SIGNPOST_INTERVAL_END, v71, "CommSafetyHandler_affine", "%@", buf, 0xCu);
  }

  [(VCPMADImageSafetyClassificationTask *)self logMemoryWithMessage:@"[ImageSafety] Before inference"];
  v109 = [v51 handler];
  if (v109)
  {
    v83 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v83);

    v84 = VCPSignPostLog();
    v85 = v84;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
    {
      v86 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v136 = v86;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v85, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CommSafetyHandler_classifyPixelBuffer", "%@", buf, 0xCu);
    }

    v87 = v111;
    v88 = [(MADImageSafetyClassificationRequest *)self->_request stagedText];
    v89 = [(MADImageSafetyClassificationRequest *)self->_request conversationIdentifier];
    id v110 = 0;
    v79 = [v109 classifyPixelBuffer:v87 stagedText:v88 inConversationWithIdentifier:v89 error:&v110];
    id v78 = v110;

    v90 = VCPSignPostLog();
    v91 = v90;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
    {
      v92 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v136 = v92;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v91, OS_SIGNPOST_INTERVAL_END, spid, "CommSafetyHandler_classifyPixelBuffer", "%@", buf, 0xCu);
    }

    [(VCPMADImageSafetyClassificationTask *)self logMemoryWithMessage:@"[ImageSafety] After inference"];
    if (v78)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v93 = VCPLogInstance();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v94 = [v78 description];
          *(_DWORD *)buf = 138412290;
          v136 = v94;
          _os_log_impl(&dword_1BBEDA000, v93, OS_LOG_TYPE_DEFAULT, "VCPMADImageSafetyClassificationTask failed (%@)", buf, 0xCu);
        }
      }
      v95 = self->_request;
      v96 = [v78 copy];
      [(MADImageSafetyClassificationRequest *)v95 setError:v96];
    }
    else
    {
      v102 = [v79 objectForKeyedSubscript:*MEMORY[0x1E4F9A660]];
      uint64_t v103 = [v102 BOOLValue];

      v104 = self->_request;
      v105 = (void *)[objc_alloc(MEMORY[0x1E4F745F8]) initWithIsSensitive:v103 andAttributes:v79];
      v119 = v105;
      v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
      [(MADImageSafetyClassificationRequest *)v104 setResults:v106];

      [v52 reset];
      v107 = [(VCPMADServiceImageAsset *)self->_imageAsset clientBundleID];
      MADPLLogIVSProcessing(v107, 0, [(VCPMADServiceImageAsset *)self->_imageAsset assetType], v7);

      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_95;
      }
      v96 = VCPLogInstance();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v96, OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask complete", buf, 2u);
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v97 = VCPLogInstance();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v98 = (NSString *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v136 = v98;
        v99 = v98;
        _os_log_impl(&dword_1BBEDA000, v97, OS_LOG_TYPE_ERROR, "%@ unavailable for classifying pixel buffer", buf, 0xCu);
      }
    }
    v100 = self->_request;
    v101 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v120 = *MEMORY[0x1E4F28568];
    id v78 = [NSString stringWithFormat:@"%@ unavailable", objc_opt_class()];
    id v121 = v78;
    v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
    v96 = [v101 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v79];
    [(MADImageSafetyClassificationRequest *)v100 setError:v96];
  }

LABEL_95:
  CF<opaqueCMSampleBuffer *>::~CF(&v111);
LABEL_96:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v112);
LABEL_97:

  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v114);
LABEL_98:

  return 0;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  return self;
}

@end