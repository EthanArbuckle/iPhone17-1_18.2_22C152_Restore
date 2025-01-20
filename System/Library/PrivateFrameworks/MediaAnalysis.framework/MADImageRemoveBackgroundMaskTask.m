@interface MADImageRemoveBackgroundMaskTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (MADImageRemoveBackgroundMaskTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (int)run;
@end

@implementation MADImageRemoveBackgroundMaskTask

- (MADImageRemoveBackgroundMaskTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADImageRemoveBackgroundMaskTask;
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
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask] Incompatible request (%@) specified to %@", (uint8_t *)&v18, 0x16u);
      }
    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int)run
{
  v168[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "[RemoveBackgroundMask][%@] running...", (uint8_t *)&buf, 0xCu);
    }
  }
  char v5 = _os_feature_enabled_impl();
  if (v5)
  {
LABEL_14:
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[RemoveBackgroundMask][%@] Resetting cached mask state", (uint8_t *)&buf, 0xCu);
      }
    }
    v12 = +[MADImageRemoveBackgroundResource sharedResource];
    [v12 setCachedMaskState:0];

    v141 = 0;
    unsigned int v140 = 0;
    if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:&v141 orientation:&v140])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Image loading failed", (uint8_t *)&buf, 0xCu);
        }
      }
      request = self->_request;
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v167 = *MEMORY[0x1E4F28568];
      v17 = [NSString stringWithFormat:@"Image loading failed"];
      v168[0] = v17;
      int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:&v167 count:1];
      id v19 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v18];
      [(MADRemoveBackgroundMaskRequest *)request setError:v19];

      goto LABEL_114;
    }
    if ([(MADImageRemoveBackgroundTask *)self canceled])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        __int16 v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v21;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Task request was canceled", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v22 = self->_request;
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v165 = *MEMORY[0x1E4F28568];
      v24 = [NSString stringWithFormat:@"Task request was canceled"];
      v166 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
      v26 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v25];
      [(MADRemoveBackgroundMaskRequest *)v22 setError:v26];

      goto LABEL_114;
    }
    if ((v5 & 1) == 0)
    {
      v27 = [(VCPMADServiceImageAsset *)self->_imageAsset isSensitive];
      BOOL v28 = v27 == 0;

      if (v28)
      {
        v29 = [(MADImageRemoveBackgroundTask *)self computeSensitivityOfPixelBuffer:v141];
        if ([v29 BOOLValue])
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v31;
              _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Skipping for ineligible image", (uint8_t *)&buf, 0xCu);
            }
          }
          [(MADRemoveBackgroundMaskRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];

          goto LABEL_114;
        }
      }
    }
    if ([(MADImageRemoveBackgroundTask *)self canceled])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Task request was canceled", (uint8_t *)&buf, 0xCu);
        }
      }
      v34 = self->_request;
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v163 = *MEMORY[0x1E4F28568];
      v36 = [NSString stringWithFormat:@"Task request was canceled"];
      v164 = v36;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
      v38 = [v35 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v37];
      [(MADRemoveBackgroundMaskRequest *)v34 setError:v38];

      goto LABEL_114;
    }
    id location = 0;
    long long buf = 0uLL;
    __asm { FMOV            V0.2D, #1.0 }
    long long v162 = _Q0;
    v44 = [(MADRemoveBackgroundMaskRequest *)self->_request imageType];
    if (v44
      && ([(MADRemoveBackgroundMaskRequest *)self->_request imageType],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 integerValue] == 1))
    {
    }
    else
    {
      BOOL v45 = [(VCPMADServiceImageAsset *)self->_imageAsset isScreenshot];
      BOOL v46 = v45;
      if (v44)
      {

        if (!v46) {
          goto LABEL_57;
        }
      }
      else if (!v45)
      {
        goto LABEL_57;
      }
    }
    v47 = (void *)MEMORY[0x1C186D320]();
    BOOL v48 = [(MADImageRemoveBackgroundTask *)self computeRegionOfInterest:&buf pixelBuffer:v141 orientation:v140 error:&location];
    if (!v48)
    {
      v49 = self->_request;
      if (location) {
        -[MADRemoveBackgroundMaskRequest setError:](v49, "setError:");
      }
      else {
        [(MADRemoveBackgroundMaskRequest *)v49 setResults:MEMORY[0x1E4F1CBF0]];
      }
    }
    if (!v48)
    {
LABEL_113:

LABEL_114:
      CF<opaqueCMSampleBuffer *>::~CF(&v141);
      return 0;
    }
LABEL_57:
    v136 = +[MADImageRemoveBackgroundResource sharedResource];
    [v136 setMaskOnly:1];
    v50 = +[VCPMADResourceManager sharedManager];
    v135 = [v50 activateResource:v136];

    v51 = VCPSignPostLog();
    os_signpost_id_t v52 = os_signpost_id_generate(v51);

    v53 = VCPSignPostLog();
    v54 = v53;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      v55 = [(MADImageRemoveBackgroundTask *)self signpostPayload];
      *(_DWORD *)v142 = 138412290;
      v143 = v55;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "VNImageRequestHandler_init", "%@", v142, 0xCu);
    }
    id v56 = objc_alloc(MEMORY[0x1E4F45890]);
    v57 = v141;
    uint64_t v58 = v140;
    v59 = [v136 session];
    v134 = (void *)[v56 initWithCVPixelBuffer:v57 orientation:v58 options:MEMORY[0x1E4F1CC08] session:v59];

    v60 = VCPSignPostLog();
    v61 = v60;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
    {
      v62 = [(MADImageRemoveBackgroundTask *)self signpostPayload];
      *(_DWORD *)v142 = 138412290;
      v143 = v62;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v61, OS_SIGNPOST_INTERVAL_END, v52, "VNImageRequestHandler_init", "%@", v142, 0xCu);
    }
    if ([(MADImageRemoveBackgroundTask *)self canceled])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v63 = VCPLogInstance();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
          *(_DWORD *)v142 = 138412290;
          v143 = v64;
          _os_log_impl(&dword_1BBEDA000, v63, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Task request was canceled", v142, 0xCu);
        }
      }
      v65 = self->_request;
      v66 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v159 = *MEMORY[0x1E4F28568];
      v67 = [NSString stringWithFormat:@"Task request was canceled"];
      v160 = v67;
      v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
      v69 = [v66 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v68];
      [(MADRemoveBackgroundMaskRequest *)v65 setError:v69];

      [v135 reset];
    }
    else
    {
      v70 = -[MADImageRemoveBackgroundTask generateMaskWithRequestHandler:regionOfInterest:error:](self, "generateMaskWithRequestHandler:regionOfInterest:error:", v134, &location, buf, v162);
      v71 = v70;
      if (v70)
      {
        v132 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v70 instanceMask]);
        if (v132)
        {
          v133 = [MEMORY[0x1E4F1CA60] dictionary];
          v72 = [v71 allInstances];
          uint64_t v73 = [v72 firstIndex];

          if (v73 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_72:
            v74 = self->_request;
            id v75 = objc_alloc(MEMORY[0x1E4F74658]);
            v76 = [v71 allInstances];
            long long v77 = buf;
            long long v78 = v162;
            [v71 confidence];
            int v80 = v79;
            v81 = [(VCPMADServiceImageAsset *)self->_imageAsset animatedStickerScore];
            LODWORD(v82) = v80;
            v83 = objc_msgSend(v75, "initWithInstances:instanceMaskSurface:perInstanceMaskSurfaces:sourceRegionOfInterest:confidence:animatedStickerScore:", v76, v132, v133, v81, v77, v78, v82);
            v150 = v83;
            v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
            [(MADRemoveBackgroundMaskRequest *)v74 setResults:v84];

            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v85 = VCPLogInstance();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
              {
                v86 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
                [(VCPMADServiceImageAsset *)self->_imageAsset resolution];
                double v88 = v87;
                [(VCPMADServiceImageAsset *)self->_imageAsset resolution];
                double v90 = v89;
                unsigned int v91 = [(VCPMADServiceImageAsset *)self->_imageAsset orientation];
                *(_DWORD *)v142 = 138413058;
                v143 = v86;
                __int16 v144 = 1024;
                int v145 = (int)v88;
                __int16 v146 = 1024;
                int v147 = (int)v90;
                __int16 v148 = 1024;
                unsigned int v149 = v91;
                _os_log_impl(&dword_1BBEDA000, v85, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Caching image handler (resolution %dx%d, orientation %d)", v142, 0x1Eu);
              }
            }
            v92 = [MADRemoveBackgroundCachedMaskState alloc];
            v93 = -[MADRemoveBackgroundCachedMaskState initWithImageAsset:instanceMaskObservation:regionOfInterest:](v92, "initWithImageAsset:instanceMaskObservation:regionOfInterest:", self->_imageAsset, v71, *(double *)&buf, *((double *)&buf + 1), *(double *)&v162, *((double *)&v162 + 1));
            [v136 setCachedMaskState:v93];

            [v135 reset];
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v94 = VCPLogInstance();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                v95 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
                *(_DWORD *)v142 = 138412290;
                v143 = v95;
                _os_log_impl(&dword_1BBEDA000, v94, OS_LOG_TYPE_INFO, "[RemoveBackgroundMask][%@] complete", v142, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v130 = *MEMORY[0x1E4F28760];
            uint64_t v131 = *MEMORY[0x1E4F28568];
            while (![(MADImageRemoveBackgroundTask *)self canceled])
            {
              v103 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v73];
              id obj = location;
              v104 = (__CVBuffer *)[v71 createMaskForInstances:v103 error:&obj];
              objc_storeStrong(&location, obj);
              CVPixelBufferRef pixelBuffer = v104;

              if (!pixelBuffer)
              {
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v115 = VCPLogInstance();
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                  {
                    v116 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
                    *(_DWORD *)v142 = 138412546;
                    v143 = v116;
                    __int16 v144 = 1024;
                    int v145 = v73;
                    _os_log_impl(&dword_1BBEDA000, v115, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Failed to obtain mask %d from Vision", v142, 0x12u);
                  }
                }
                v117 = self->_request;
                v118 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v153 = v131;
                v119 = [NSString stringWithFormat:@"Failed to obtain image from Vision"];
                v154 = v119;
                v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
                v121 = [v118 errorWithDomain:v130 code:-18 userInfo:v120];
                [(MADRemoveBackgroundMaskRequest *)v117 setError:v121];

                goto LABEL_109;
              }
              v105 = CVPixelBufferGetIOSurface(pixelBuffer);
              if (!v105)
              {
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v122 = VCPLogInstance();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                  {
                    v123 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
                    *(_DWORD *)v142 = 138412546;
                    v143 = v123;
                    __int16 v144 = 1024;
                    int v145 = v73;
                    _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Failed to obtain mask %d from Vision", v142, 0x12u);
                  }
                }
                v124 = self->_request;
                v125 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v151 = v131;
                v126 = [NSString stringWithFormat:@"Failed to obtain image from Vision"];
                v152 = v126;
                v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
                v128 = [v125 errorWithDomain:v130 code:-18 userInfo:v127];
                [(MADRemoveBackgroundMaskRequest *)v124 setError:v128];

LABEL_109:
                CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
                goto LABEL_110;
              }
              v106 = [NSNumber numberWithUnsignedInteger:v73];
              [v133 setObject:v105 forKeyedSubscript:v106];

              v107 = [v71 allInstances];
              uint64_t v73 = [v107 indexGreaterThanIndex:v73];

              CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
              if (v73 == 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_72;
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v108 = VCPLogInstance();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
              {
                v109 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
                *(_DWORD *)v142 = 138412290;
                v143 = v109;
                _os_log_impl(&dword_1BBEDA000, v108, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Task request was canceled", v142, 0xCu);
              }
            }
            v110 = self->_request;
            v111 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v155 = v131;
            v112 = [NSString stringWithFormat:@"Task request was canceled"];
            v156 = v112;
            v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
            v114 = [v111 errorWithDomain:v130 code:-128 userInfo:v113];
            [(MADRemoveBackgroundMaskRequest *)v110 setError:v114];

            [v135 reset];
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v97 = VCPLogInstance();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              v98 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
              *(_DWORD *)v142 = 138412290;
              v143 = v98;
              _os_log_impl(&dword_1BBEDA000, v97, OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Failed to obtain instance mask from Vision", v142, 0xCu);
            }
          }
          v99 = self->_request;
          v100 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v157 = *MEMORY[0x1E4F28568];
          v133 = [NSString stringWithFormat:@"Failed to obtain image from Vision"];
          v158 = v133;
          v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
          v102 = [v100 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v101];
          [(MADRemoveBackgroundMaskRequest *)v99 setError:v102];
        }
LABEL_110:
      }
      else
      {
        v96 = self->_request;
        if (location) {
          -[MADRemoveBackgroundMaskRequest setError:](v96, "setError:");
        }
        else {
          [(MADRemoveBackgroundMaskRequest *)v96 setResults:MEMORY[0x1E4F1CBF0]];
        }
      }
    }
    goto LABEL_113;
  }
  v6 = [(VCPMADServiceImageAsset *)self->_imageAsset isSensitive];
  v7 = v6;
  if (!v6 || ![v6 BOOLValue])
  {

    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(VCPMADServiceImageAsset *)self->_imageAsset identifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Skipping for ineligible image", (uint8_t *)&buf, 0xCu);
    }
  }
  [(MADRemoveBackgroundMaskRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end