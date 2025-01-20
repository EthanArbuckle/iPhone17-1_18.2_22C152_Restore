@interface MADImageRemoveBackgroundMatteTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (MADImageRemoveBackgroundMatteTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (int)run;
@end

@implementation MADImageRemoveBackgroundMatteTask

- (MADImageRemoveBackgroundMatteTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADImageRemoveBackgroundMatteTask;
  v11 = [(MADImageRemoveBackgroundTask *)&v14 initWithSignpostPayload:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    objc_storeStrong((id *)&v12->_imageAsset, a4);
  }

  return v12;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    v11 = (void *)[objc_alloc((Class)a1) initWithRequest:v8 imageAsset:v9 andSignpostPayload:v10];
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
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v18 = 138412546;
        id v19 = v14;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v18, 0x16u);
      }
    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (int)run
{
  v124[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
      int v5 = [(MADRemoveBackgroundMatteRequest *)self->_request cropResult];
      int v6 = [(MADRemoveBackgroundMatteRequest *)self->_request inPlace];
      v7 = [(MADRemoveBackgroundMatteRequest *)self->_request instances];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v6;
      LOWORD(v121) = 2112;
      *(void *)((char *)&v121 + 2) = v7;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "[RemoveBackgroundMatte][%@] running (Crop: %d, In-Place: %d, Instances: %@)...", buf, 0x22u);
    }
  }
  uint64_t v8 = _os_feature_enabled_impl();
  if (v8)
  {
LABEL_14:
    v13 = [MEMORY[0x1E4F1C9C8] now];
    [v13 timeIntervalSince1970];
    double v15 = v14;

    CFTypeRef cf = 0;
    unsigned int v111 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadHighResPixelBuffer:&cf orientation:&v111])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v17;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMatte][%@] image loading failed", buf, 0xCu);
        }
      }
      request = self->_request;
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v123 = *MEMORY[0x1E4F28568];
      __int16 v20 = [NSString stringWithFormat:@"Image loading failed"];
      v124[0] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:&v123 count:1];
      uint64_t v22 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v21];
      [(MADRemoveBackgroundMatteRequest *)request setError:v22];

      goto LABEL_105;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&long long v121 = __Block_byref_object_copy__53;
    *((void *)&v121 + 1) = __Block_byref_object_dispose__53;
    id v122 = 0;
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x3032000000;
    v108 = __Block_byref_object_copy__53;
    v109 = __Block_byref_object_dispose__53;
    id v110 = 0;
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x3032000000;
    v102 = __Block_byref_object_copy__53;
    v103 = __Block_byref_object_dispose__53;
    id v104 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = __40__MADImageRemoveBackgroundMatteTask_run__block_invoke;
    aBlock[3] = &unk_1F159F080;
    aBlock[4] = self;
    aBlock[5] = buf;
    aBlock[6] = &v105;
    aBlock[7] = &v99;
    CFTypeRef v97 = cf;
    if (cf) {
      CFRetain(cf);
    }
    unsigned int v98 = v111;
    v89 = (void (**)(void))_Block_copy(aBlock);
    double v93 = 0.0;
    double v94 = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    CGSize v87 = _Q0;
    CGSize v95 = _Q0;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
        LODWORD(v118) = 138412290;
        *(void *)((char *)&v118 + 4) = v29;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEBUG, "[RemoveBackgroundMatte][%@] Checking for cached mask state...", (uint8_t *)&v118, 0xCu);
      }
    }
    v30 = +[MADImageRemoveBackgroundResource sharedResource];
    v90 = [v30 cachedMaskState];

    if ([v90 matchesImageAsset:self->_imageAsset])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
          LODWORD(v118) = 138412290;
          *(void *)((char *)&v118 + 4) = v32;
          _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte][%@] Matched cached mask state", (uint8_t *)&v118, 0xCu);
        }
      }
      v33 = [v90 instanceMaskObservation];
      v89[2]();
      [v90 regionOfInterest];
      double v93 = v34;
      double v94 = v35;
      v95.width = v36;
      v95.height = v37;
LABEL_59:
      if ([(MADRemoveBackgroundMatteRequest *)self->_request inPlace])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v51 = 1;
          goto LABEL_67;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v52 = VCPLogInstance();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v118) = 0;
            _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte] Perform-in-place requested for ineligible input; ignoring",
              (uint8_t *)&v118,
              2u);
          }
        }
      }
      uint64_t v51 = 0;
LABEL_67:
      v53 = [(MADRemoveBackgroundMatteRequest *)self->_request instances];
      if (![v53 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v54 = VCPLogInstance();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v118) = 0;
            _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte] No instances specified, using all", (uint8_t *)&v118, 2u);
          }
        }
        uint64_t v55 = [v33 allInstances];

        v53 = (void *)v55;
      }
      long long v118 = 0uLL;
      CGSize v119 = v87;
      uint64_t v56 = v100[5];
      uint64_t v57 = [(MADRemoveBackgroundMatteRequest *)self->_request cropResult];
      id v91 = 0;
      v58 = (void *)[v33 generateMaskedImageOfInstances:v53 fromRequestHandler:v56 inPlace:v51 croppedToInstancesExtent:v57 returnCropRect:&v118 error:&v91];
      id v59 = v91;
      v92 = v58;
      if (v59)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v60 = VCPLogInstance();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v116 = 138412290;
            id v117 = v59;
            _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMatte] Matting failed: %@", v116, 0xCu);
          }
        }
        [(MADRemoveBackgroundMatteRequest *)self->_request setError:v59];
LABEL_103:
        CF<opaqueCMSampleBuffer *>::~CF(&v92);

        goto LABEL_104;
      }
      v88 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v58);
      if (!v88)
      {
        v73 = self->_request;
        v74 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v113 = *MEMORY[0x1E4F28568];
        v75 = [NSString stringWithFormat:@"Failed to obtain image from Vision"];
        v114 = v75;
        v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        v77 = [v74 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v76];
        [(MADRemoveBackgroundMatteRequest *)v73 setError:v77];

LABEL_98:
        [(id)v106[5] reset];
        MADPLLogStaticStickerCreation(v15);
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v83 = VCPLogInstance();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
            v84 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
            *(_DWORD *)v116 = 138412290;
            id v117 = v84;
            _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_INFO, "[RemoveBackgroundMatte][%@] complete", v116, 0xCu);
          }
        }

        goto LABEL_103;
      }
      v61 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth((CVPixelBufferRef)cf)];
      v86 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", CVPixelBufferGetHeight((CVPixelBufferRef)cf), v61);
      v62 = [NSNumber numberWithUnsignedInt:v111];
      id v63 = v61;
      id v64 = v86;
      id v65 = v62;
      if (![v63 intValue] || !objc_msgSend(v64, "intValue"))
      {
        double v72 = *MEMORY[0x1E4F1DB30];
        double v71 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_97:

        *(double *)&long long v118 = *(double *)&v118 + v93 * v72;
        v125.origin.x = *(double *)&v118;
        *((double *)&v118 + 1) = *((double *)&v118 + 1) + v94 * v71;
        v125.origin.y = *((double *)&v118 + 1);
        v125.size = v119;
        v127.origin.x = 0.0;
        v127.origin.y = 0.0;
        v127.size.width = v72;
        v127.size.height = v71;
        CGRect v126 = CGRectIntersection(v125, v127);
        *(CGFloat *)&long long v118 = v126.origin.x;
        *((void *)&v118 + 1) = *(void *)&v126.origin.y;
        v119.width = v126.size.width;
        v119.height = v126.size.height;
        +[VCPGeometryUtils normalizedRectForRect:inBounds:](VCPGeometryUtils, "normalizedRectForRect:inBounds:");
        v78 = self->_request;
        v75 = objc_msgSend(objc_alloc(MEMORY[0x1E4F74668]), "initWithSurface:cropRect:", v88, v79, v80, v81, v82);
        v115 = v75;
        v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
        [(MADRemoveBackgroundMatteRequest *)v78 setResults:v76];
        goto LABEL_98;
      }
      if (v65)
      {
        unsigned int v66 = [v65 unsignedIntValue];
        unsigned int v67 = v66;
        if (v66 - 9 > 0xFFFFFFF7)
        {
          if (v66 > 4)
          {
            int v68 = [v64 intValue];
            int v69 = [v63 intValue];
            goto LABEL_96;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v116 = 67109120;
          LODWORD(v117) = v67;
          _os_log_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Orientation value %u invalid, assuming kCGImagePropertyOrientationUp", v116, 8u);
        }
      }
      int v68 = [v63 intValue];
      int v69 = [v64 intValue];
LABEL_96:
      double v71 = (double)v69;
      double v72 = (double)v68;
      goto LABEL_97;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v38 = VCPLogInstance();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
        LODWORD(v118) = 138412290;
        *(void *)((char *)&v118 + 4) = v39;
        _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_INFO, "[RemoveBackgroundMatte][%@] No matching cached mask state", (uint8_t *)&v118, 0xCu);
      }
    }
    if ((v8 & 1) == 0)
    {
      v40 = [(VCPMADServiceImageAsset *)self->_imageAsset isSensitive];
      BOOL v41 = v40 == 0;

      if (v41)
      {
        v42 = [(MADImageRemoveBackgroundTask *)self computeSensitivityOfPixelBuffer:cf];
        if ([v42 BOOLValue])
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v43 = VCPLogInstance();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              v44 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
              LODWORD(v118) = 138412290;
              *(void *)((char *)&v118 + 4) = v44;
              _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Skipping for ineligible image", (uint8_t *)&v118, 0xCu);
            }
          }
          [(MADRemoveBackgroundMatteRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];

          goto LABEL_104;
        }
      }
    }
    *(void *)&long long v118 = 0;
    v45 = [(MADRemoveBackgroundMatteRequest *)self->_request imageType];
    if (v45)
    {
      uint64_t v8 = [(MADRemoveBackgroundMatteRequest *)self->_request imageType];
      if ([(id)v8 integerValue] == 1)
      {

        goto LABEL_52;
      }
    }
    BOOL v46 = [(VCPMADServiceImageAsset *)self->_imageAsset isScreenshot];
    BOOL v47 = v46;
    if (v45)
    {

      if (!v47) {
        goto LABEL_57;
      }
    }
    else if (!v46)
    {
LABEL_57:
      v89[2]();
      v33 = -[MADImageRemoveBackgroundTask generateMaskWithRequestHandler:regionOfInterest:error:](self, "generateMaskWithRequestHandler:regionOfInterest:error:", v100[5], &v118, v93, v94, v95);
      if (v33)
      {

        goto LABEL_59;
      }
      v70 = self->_request;
      if ((void)v118) {
        -[MADRemoveBackgroundMatteRequest setError:](v70, "setError:");
      }
      else {
        [(MADRemoveBackgroundMatteRequest *)v70 setResults:MEMORY[0x1E4F1CBF0]];
      }
LABEL_92:

LABEL_104:
      CF<opaqueCMSampleBuffer *>::~CF(&v97);
      _Block_object_dispose(&v99, 8);

      _Block_object_dispose(&v105, 8);
      _Block_object_dispose(buf, 8);

LABEL_105:
      CF<opaqueCMSampleBuffer *>::~CF(&cf);
      return 0;
    }
LABEL_52:
    v48 = (void *)MEMORY[0x1C186D320]();
    BOOL v49 = [(MADImageRemoveBackgroundTask *)self computeRegionOfInterest:&v93 pixelBuffer:cf orientation:v111 error:&v118];
    if (!v49)
    {
      v50 = self->_request;
      if ((void)v118) {
        -[MADRemoveBackgroundMatteRequest setError:](v50, "setError:");
      }
      else {
        [(MADRemoveBackgroundMatteRequest *)v50 setResults:MEMORY[0x1E4F1CBF0]];
      }
    }
    if (!v49) {
      goto LABEL_92;
    }
    goto LABEL_57;
  }
  id v9 = [(VCPMADServiceImageAsset *)self->_imageAsset isSensitive];
  id v10 = v9;
  if (!v9 || ![v9 BOOLValue])
  {

    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v12;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte][%@] Skipping for ineligible image", buf, 0xCu);
    }
  }
  [(MADRemoveBackgroundMatteRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];

  return 0;
}

void __40__MADImageRemoveBackgroundMatteTask_run__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MADImageRemoveBackgroundResource sharedResource];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMaskOnly:0];
  int v5 = +[VCPMADResourceManager sharedManager];
  uint64_t v6 = [v5 activateResource:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = VCPSignPostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = VCPSignPostLog();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = [*(id *)(a1 + 32) signpostPayload];
    int v24 = 138412290;
    v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VNImageRequestHandler_init", "%@", (uint8_t *)&v24, 0xCu);
  }
  id v14 = objc_alloc(MEMORY[0x1E4F45890]);
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v16 = *(unsigned int *)(a1 + 72);
  v17 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) session];
  uint64_t v18 = [v14 initWithCVPixelBuffer:v15 orientation:v16 options:MEMORY[0x1E4F1CC08] session:v17];
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  v21 = VCPSignPostLog();
  uint64_t v22 = v21;
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
  {
    v23 = [*(id *)(a1 + 32) signpostPayload];
    int v24 = 138412290;
    v25 = v23;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v10, "VNImageRequestHandler_init", "%@", (uint8_t *)&v24, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end