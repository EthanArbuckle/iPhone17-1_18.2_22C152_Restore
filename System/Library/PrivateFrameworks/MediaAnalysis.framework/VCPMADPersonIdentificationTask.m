@interface VCPMADPersonIdentificationTask
+ (id)dependencies;
+ (id)taskName;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (VCPMADPersonIdentificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
@end

@implementation VCPMADPersonIdentificationTask

- (VCPMADPersonIdentificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADPersonIdentificationTask;
  v12 = [(VCPMADPersonIdentificationTask *)&v15 init];
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

+ (id)taskName
{
  return @"VCPMADPersonIdentificationTask";
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

- (int)run
{
  v215[1] = *MEMORY[0x1E4F143B8];
  v171 = [(id)objc_opt_class() taskName];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)v171;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[%@] running ...", buf, 0xCu);
    }
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v3 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(VCPMADServiceImageAsset *)self->_imageAsset asset];
      [v4 fetchPropertySetsIfNeeded];
      v5 = [v4 importProperties];
      uint64_t v169 = [v5 importedBy] == 2;
    }
    else
    {
      uint64_t v169 = -1;
    }
    v170 = [(VCPMADServiceImageAsset *)self->_imageAsset faces];
    if ([v170 count])
    {
      v7 = [v170 firstObject];
      id v8 = [v7 photoLibrary];
      id v9 = [v8 librarySpecificFetchOptions];

      id v10 = [MEMORY[0x1E4F1CA48] array];
      v185[0] = MEMORY[0x1E4F143A8];
      v185[1] = 3221225472;
      v185[2] = __37__VCPMADPersonIdentificationTask_run__block_invoke;
      v185[3] = &unk_1E62993D8;
      id v11 = v9;
      id v186 = v11;
      v187 = self;
      id v12 = v10;
      id v188 = v12;
      [v170 enumerateObjectsUsingBlock:v185];
      request = self->_request;
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F74630]) initWithResultItems:v12 frontCameraCaptureState:v169];
      v215[0] = v14;
      objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v215 count:1];
      [(MADPersonIdentificationRequest *)request setResults:v15];

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = (uint64_t)v171;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);
        }
      }
      goto LABEL_162;
    }
    if (([(MADPersonIdentificationRequest *)self->_request allowOnDemand] & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = (uint64_t)v171;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_INFO, "[%@] complete without on-demand process", buf, 0xCu);
        }
      }
      [(MADPersonIdentificationRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];
      goto LABEL_162;
    }
    CFTypeRef cf = 0;
    int v183 = 0;
    if ([(MADPersonIdentificationRequest *)self->_request useLowResolutionPicture])
    {
      if (![(VCPMADServiceImageAsset *)self->_imageAsset loadLowResPixelBuffer:&cf orientation:&v183])goto LABEL_36; {
      if ((int)MediaAnalysisLogLevel() >= 4)
      }
      {
        v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = (uint64_t)v171;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "[%@] low res image loading failed", buf, 0xCu);
        }
      }
    }
    imageAsset = self->_imageAsset;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if ([(VCPMADServiceImageAsset *)imageAsset loadPixelBuffer:&cf orientation:&v183])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = (uint64_t)v171;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "[%@] image loading failed", buf, 0xCu);
        }
      }
      __int16 v20 = self->_request;
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v213 = *MEMORY[0x1E4F28568];
      uint64_t v214 = [NSString stringWithFormat:@"Image loading failed"];
      v167 = (void *)v214;
      v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v214 forKeys:&v213 count:1];
      uint64_t v22 = objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
      v23 = v20;
      v24 = (void *)v22;
      -[MADPersonIdentificationRequest setError:](v23, "setError:");
      goto LABEL_161;
    }
LABEL_36:
    v167 = +[VCPMADPersonIdentificationTaskResource sharedResource];
    v26 = +[VCPMADResourceManager sharedManager];
    v160 = [v26 activateResource:v167];

    v162 = [v167 personIdentityModel];
    v158 = [v167 faceProcessingContext];
    v163 = [v167 vuService];
    id v182 = 0;
    LODWORD(v26) = +[VCPFaceUtils configureVNRequest:&v182 withClass:objc_opt_class() andVisionRevision:[(MADPersonIdentificationRequest *)self->_request faceDetectorVisionRevision]];
    id v155 = v182;
    if (v26)
    {
      id v159 = [NSString stringWithFormat:@"[%@] Failed to configuate VNDetectFaceRectanglesRequest", v171];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = (uint64_t)v159;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v28 = self->_request;
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v211 = *MEMORY[0x1E4F28568];
      uint64_t v212 = [NSString stringWithFormat:@"%@", v159];
      v156 = (void *)v212;
      id v157 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v212 forKeys:&v211 count:1];
      v30 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v157];
      [(MADPersonIdentificationRequest *)v28 setError:v30];
      goto LABEL_159;
    }
    id v181 = 0;
    int v31 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v181, objc_opt_class(), [v158 processingVersion]);
    id v159 = v181;
    if (v31)
    {
      uint64_t v32 = [NSString stringWithFormat:@"[%@] Failed to configuate VNCreateFaceprintRequest", v171];
      v156 = (void *)v32;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v33 = VCPLogInstance();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = v32;
          _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v34 = self->_request;
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v209 = *MEMORY[0x1E4F28568];
      uint64_t v210 = [NSString stringWithFormat:@"%@", v32];
      id v157 = (id)v210;
      v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v210 forKeys:&v209 count:1];
      v36 = [v35 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v154];
      [(MADPersonIdentificationRequest *)v34 setError:v36];
LABEL_158:

      v30 = v154;
LABEL_159:

      v70 = v157;
LABEL_160:

      v24 = v162;
LABEL_161:

      CF<opaqueCMSampleBuffer *>::~CF(&cf);
LABEL_162:

      int v6 = 0;
      goto LABEL_163;
    }
    v37 = VCPSignPostLog();
    os_signpost_id_t v38 = os_signpost_id_generate(v37);

    v39 = VCPSignPostLog();
    v40 = v39;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "VCPMADPersonIdentificationTask_createVisionImageRequest", "%@", buf, 0xCu);
    }

    id v42 = objc_alloc(MEMORY[0x1E4F45890]);
    CFTypeRef v43 = cf;
    v44 = [v167 session];
    v156 = (void *)[v42 initWithCVPixelBuffer:v43 options:MEMORY[0x1E4F1CC08] session:v44];

    v45 = VCPSignPostLog();
    v46 = v45;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      v47 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)v47;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v46, OS_SIGNPOST_INTERVAL_END, v38, "VCPMADPersonIdentificationTask_createVisionImageRequest", "%@", buf, 0xCu);
    }

    v48 = VCPSignPostLog();
    os_signpost_id_t v49 = os_signpost_id_generate(v48);

    v50 = VCPSignPostLog();
    v51 = v50;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      v52 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)v52;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "VCPMADPersonIdentificationTask_detectFace", "%@", buf, 0xCu);
    }

    id v208 = v155;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v208 count:1];
    id v180 = 0;
    char v54 = [v156 performRequests:v53 error:&v180];
    id v157 = v180;

    if ((v54 & 1) == 0)
    {
      uint64_t v64 = [NSString stringWithFormat:@"[%@] Failed to detect faces - %@", v171, v157];
      v154 = (void *)v64;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v65 = VCPLogInstance();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = v64;
          _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v66 = self->_request;
      v67 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v206 = *MEMORY[0x1E4F28568];
      v36 = [NSString stringWithFormat:@"%@", v64];
      v207 = v36;
      v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
      v69 = [v67 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v68];
      [(MADPersonIdentificationRequest *)v66 setError:v69];

      goto LABEL_158;
    }
    v55 = VCPSignPostLog();
    v56 = v55;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      v57 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)v57;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v56, OS_SIGNPOST_INTERVAL_END, v49, "VCPMADPersonIdentificationTask_detectFace", "%@", buf, 0xCu);
    }

    v58 = [v155 results];
    unint64_t v59 = [v58 count];

    if (!v59)
    {
      v70 = v157;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v71 = VCPLogInstance();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = (uint64_t)v171;
          _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_DEBUG, "[%@] No face detected from CVPixelBuffer", buf, 0xCu);
        }

        v70 = v157;
      }
      [(MADPersonIdentificationRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];
      goto LABEL_160;
    }
    if ([(MADPersonIdentificationRequest *)self->_request maximumFaceCount]
      && v59 >= [(MADPersonIdentificationRequest *)self->_request maximumFaceCount])
    {
      v72 = [v155 results];
      v61 = [v72 sortedArrayUsingComparator:&__block_literal_global_296];

      v73 = -[NSObject subarrayWithRange:](v61, "subarrayWithRange:", 0, [(MADPersonIdentificationRequest *)self->_request maximumFaceCount]);
      [v159 setInputFaceObservations:v73];

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v74 = VCPLogInstance();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          v75 = [v155 results];
          uint64_t v76 = [v75 count];
          v77 = [v159 inputFaceObservations];
          uint64_t v78 = [v77 count];
          *(_DWORD *)buf = 138412802;
          uint64_t v193 = (uint64_t)v171;
          __int16 v194 = 2048;
          uint64_t v195 = v76;
          __int16 v196 = 2048;
          uint64_t v197 = v78;
          _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_DEBUG, "[%@] Detected %lu faces, identifying top %lu faces (by confidence) ...", buf, 0x20u);
        }
      }
    }
    else
    {
      v60 = [v155 results];
      [v159 setInputFaceObservations:v60];

      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_82;
      }
      v61 = VCPLogInstance();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        v62 = [v155 results];
        uint64_t v63 = [v62 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v193 = (uint64_t)v171;
        __int16 v194 = 2048;
        uint64_t v195 = v63;
        _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_DEBUG, "[%@] Detected %lu faces, identifying ...", buf, 0x16u);
      }
    }

LABEL_82:
    v79 = VCPSignPostLog();
    os_signpost_id_t v80 = os_signpost_id_generate(v79);

    v81 = VCPSignPostLog();
    v82 = v81;
    if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
    {
      v83 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)v83;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v82, OS_SIGNPOST_INTERVAL_BEGIN, v80, "VCPMADPersonIdentificationTask_generateFaceprint", "%@", buf, 0xCu);
    }

    id v205 = v159;
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v205 count:1];
    id v179 = v157;
    char v85 = [v156 performRequests:v84 error:&v179];
    id v86 = v179;

    id v157 = v86;
    if ((v85 & 1) == 0)
    {
      uint64_t v145 = [NSString stringWithFormat:@"[%@] Failed to print faces - %@", v171, v86];
      v154 = (void *)v145;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v146 = VCPLogInstance();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = v145;
          _os_log_impl(&dword_1BBEDA000, v146, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v147 = self->_request;
      v148 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v203 = *MEMORY[0x1E4F28568];
      v36 = [NSString stringWithFormat:@"%@", v145];
      v204 = v36;
      v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v204 forKeys:&v203 count:1];
      v150 = [v148 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v149];
      [(MADPersonIdentificationRequest *)v147 setError:v150];

      goto LABEL_158;
    }
    v87 = VCPSignPostLog();
    v88 = v87;
    if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
    {
      v89 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)v89;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v88, OS_SIGNPOST_INTERVAL_END, v80, "VCPMADPersonIdentificationTask_generateFaceprint", "%@", buf, 0xCu);
    }

    v90 = [v159 results];
    BOOL v91 = [v90 count] == 0;

    if (v91)
    {
      v70 = v86;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v152 = VCPLogInstance();
        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v193 = (uint64_t)v171;
          _os_log_impl(&dword_1BBEDA000, v152, OS_LOG_TYPE_DEBUG, "[%@] No face to identify from CVPixelBuffer", buf, 0xCu);
        }

        v70 = v86;
      }
      [(MADPersonIdentificationRequest *)self->_request setResults:MEMORY[0x1E4F1CBF0]];
      goto LABEL_160;
    }
    v92 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v92);

    v93 = VCPSignPostLog();
    v94 = v93;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
    {
      v95 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      uint64_t v193 = (uint64_t)v95;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v94, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADPersonIdentificationTask_identifyFace", "%@", buf, 0xCu);
    }

    [MEMORY[0x1E4F1CA48] array];
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    v154 = long long v176 = 0u;
    id obj = [v159 results];
    uint64_t v96 = [obj countByEnumeratingWithState:&v175 objects:v202 count:16];
    if (!v96)
    {
LABEL_143:

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v136 = VCPLogInstance();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
        {
          v137 = [v159 results];
          uint64_t v138 = [v137 count];
          *(_DWORD *)buf = 138412546;
          uint64_t v193 = (uint64_t)v171;
          __int16 v194 = 2048;
          uint64_t v195 = v138;
          _os_log_impl(&dword_1BBEDA000, v136, OS_LOG_TYPE_DEBUG, "[%@] Identified %lu faces", buf, 0x16u);
        }
      }
      v139 = VCPSignPostLog();
      v140 = v139;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v139))
      {
        v141 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        uint64_t v193 = (uint64_t)v141;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v140, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADPersonIdentificationTask_identifyFace", "%@", buf, 0xCu);
      }

      v142 = self->_request;
      v143 = (void *)[objc_alloc(MEMORY[0x1E4F74630]) initWithResultItems:v154 frontCameraCaptureState:v169];
      v189 = v143;
      v144 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
      [(MADPersonIdentificationRequest *)v142 setResults:v144];

      v30 = v154;
      [v160 reset];
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_159;
      }
      v36 = VCPLogInstance();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v193 = (uint64_t)v171;
        _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_INFO, "[%@] complete with on-demand analysis", buf, 0xCu);
      }
      goto LABEL_158;
    }
    uint64_t v165 = *(void *)v176;
LABEL_95:
    uint64_t v97 = 0;
    uint64_t v166 = v96;
    while (1)
    {
      if (*(void *)v176 != v165) {
        objc_enumerationMutation(obj);
      }
      v98 = *(void **)(*((void *)&v175 + 1) + 8 * v97);
      context = (void *)MEMORY[0x1C186D320]();
      v99 = [v167 photoLibrary];
      int v100 = objc_msgSend(v99, "mad_useVUGallery");

      if (v100)
      {
        id v174 = 0;
        v101 = [v163 recognizeIn:v98 context:0 error:&v174];
        id v102 = v174;
        if (!v102)
        {
          v105 = [v101 firstObject];
          v106 = v105;
          if (!v105)
          {
            if ((int)MediaAnalysisLogLevel() < 5) {
              goto LABEL_136;
            }
            v104 = VCPLogInstance();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_131;
            }
            goto LABEL_132;
          }
          v107 = [v105 entityIdentifier];
          uint64_t v108 = [v107 stringValue];

          v109 = (void *)MEMORY[0x1E4F391F8];
          v110 = [v106 tag];
          v111 = [v110 UUIDString];
          v104 = [v109 localIdentifierWithUUID:v111];

          [v106 confidence];
          float v113 = v112;
          goto LABEL_114;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v103 = VCPLogInstance();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v193 = (uint64_t)v171;
            __int16 v194 = 2112;
            uint64_t v195 = (uint64_t)v98;
            __int16 v196 = 2112;
            uint64_t v197 = (uint64_t)v102;
            _os_log_impl(&dword_1BBEDA000, v103, OS_LOG_TYPE_DEFAULT, "[%@] Failed to classify face (%@) - %@; skipping",
              buf,
              0x20u);
          }
LABEL_108:
        }
      }
      else
      {
        id v173 = 0;
        v101 = [v162 predictPersonFromFaceObservation:v98 limit:1 canceller:0 error:&v173];
        id v102 = v173;
        if (!v102)
        {
          v114 = [v101 firstObject];
          v106 = v114;
          if (!v114)
          {
            if ((int)MediaAnalysisLogLevel() < 5)
            {
LABEL_136:
              id v102 = v101;
              goto LABEL_134;
            }
            v104 = VCPLogInstance();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
LABEL_131:
              *(_DWORD *)buf = 138412546;
              uint64_t v193 = (uint64_t)v171;
              __int16 v194 = 2112;
              uint64_t v195 = (uint64_t)v98;
              _os_log_impl(&dword_1BBEDA000, v104, OS_LOG_TYPE_DEFAULT, "[%@] No valid identification to face (%@); skipping",
                buf,
                0x16u);
            }
LABEL_132:
            id v102 = v101;
            goto LABEL_133;
          }
          v104 = [v114 predictedPersonUniqueIdentifier];
          [v106 confidence];
          float v113 = v115;
          uint64_t v108 = 0;
LABEL_114:

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v116 = VCPLogInstance();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
            {
              [v98 boundingBox];
              id v121 = [NSString stringWithFormat:@"{{x:%.*f, y:%.*f}, {width:%.*f, height:%.*f}} ", 3, v117, 3, v118, 3, v119, 3, v120];
              *(_DWORD *)buf = 138413314;
              uint64_t v193 = (uint64_t)v171;
              __int16 v194 = 2112;
              uint64_t v195 = (uint64_t)v104;
              __int16 v196 = 2112;
              uint64_t v197 = v108;
              __int16 v198 = 2048;
              double v199 = v113;
              __int16 v200 = 2112;
              id v201 = v121;
              _os_log_impl(&dword_1BBEDA000, v116, OS_LOG_TYPE_DEBUG, "[%@] prediction: %@, (mdid: %@), confidence: %.3f at %@", buf, 0x34u);
            }
          }
          v122 = [v167 photoLibrary];
          v164 = [v122 librarySpecificFetchOptions];

          if (v108)
          {
            v123 = (void *)MEMORY[0x1E4F391F8];
            uint64_t v191 = v108;
            v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
            v125 = [v123 fetchPersonsWithMdIDs:v124 options:v164];
            v126 = [v125 firstObject];

            if (v126) {
              goto LABEL_171;
            }
          }
          v127 = (void *)MEMORY[0x1E4F391F8];
          v190 = v104;
          v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v190 count:1];
          v129 = [v127 fetchPersonsWithLocalIdentifiers:v128 options:v164];
          v126 = [v129 firstObject];

          if (v126)
          {
LABEL_171:
            if (([(MADPersonIdentificationRequest *)self->_request allowUnverifiedIdentity] & 1) != 0
              || [v126 isVerified])
            {
              id v130 = objc_alloc(MEMORY[0x1E4F74638]);
              v131 = [v126 localIdentifier];
              v132 = [v126 name];
              v133 = [v126 mdID];
              uint64_t v134 = [v126 isVerified];
              [v98 boundingBox];
              v135 = objc_msgSend(v130, "initWithPersonIdentifier:personName:mdID:verified:boundingBox:andConfidence:", v131, v132, v133, v134);

              [v154 addObject:v135];
              goto LABEL_124;
            }
          }
          else if ((int)MediaAnalysisLogLevel() < 4)
          {
            v126 = 0;
          }
          else
          {
            v135 = VCPLogInstance();
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v193 = (uint64_t)v171;
              __int16 v194 = 2112;
              uint64_t v195 = (uint64_t)v104;
              __int16 v196 = 2112;
              uint64_t v197 = v108;
              _os_log_impl(&dword_1BBEDA000, v135, OS_LOG_TYPE_DEFAULT, "[%@] Failed to fetch person with identifier %@ and mdID %@; skipping",
                buf,
                0x20u);
            }
            v126 = 0;
LABEL_124:
          }
          id v102 = (id)v108;
          goto LABEL_133;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v103 = VCPLogInstance();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v193 = (uint64_t)v171;
            __int16 v194 = 2112;
            uint64_t v195 = (uint64_t)v98;
            __int16 v196 = 2112;
            uint64_t v197 = (uint64_t)v102;
            _os_log_impl(&dword_1BBEDA000, v103, OS_LOG_TYPE_DEFAULT, "[%@] Failed to classify face (%@) - %@; skipping",
              buf,
              0x20u);
          }
          goto LABEL_108;
        }
      }
      v104 = v101;
LABEL_133:

LABEL_134:
      if (v166 == ++v97)
      {
        uint64_t v96 = [obj countByEnumeratingWithState:&v175 objects:v202 count:16];
        if (!v96) {
          goto LABEL_143;
        }
        goto LABEL_95;
      }
    }
  }
  int v6 = -128;
LABEL_163:

  return v6;
}

void __37__VCPMADPersonIdentificationTask_run__block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  unsigned __int8 v3 = [v26 personLocalIdentifier];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F391F8] fetchPersonWithFace:v26 options:*(void *)(a1 + 32)];
    if ([v4 count])
    {
      v5 = [v4 firstObject];
      if (([*(id *)(*(void *)(a1 + 40) + 8) allowUnverifiedIdentity] & 1) != 0
        || ([v5 isVerified] & 1) != 0)
      {
        [v26 centerX];
        double v7 = v6;
        [v26 centerY];
        double v9 = v8;
        [v26 size];
        +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v7, v9, v10, (double)[v26 sourceWidth], (double)objc_msgSend(v26, "sourceHeight"));
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        id v19 = objc_alloc(MEMORY[0x1E4F74638]);
        __int16 v20 = [v5 localIdentifier];
        v21 = [v5 name];
        uint64_t v22 = [v5 mdID];
        uint64_t v23 = [v5 isVerified];
        LODWORD(v24) = 1.0;
        v25 = objc_msgSend(v19, "initWithPersonIdentifier:personName:mdID:verified:boundingBox:andConfidence:", v20, v21, v22, v23, v12, v14, v16, v18, v24);

        [*(id *)(a1 + 48) addObject:v25];
      }
    }
  }
}

uint64_t __37__VCPMADPersonIdentificationTask_run__block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 boundingBox];
  double v7 = v6;
  [v4 boundingBox];
  double v9 = v8;
  [v5 boundingBox];
  double v11 = v10;
  [v5 boundingBox];
  if (v7 * v9 > v11 * v12) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v7 * v9 < v11 * v12;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end