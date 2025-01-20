@interface MADTextEmbeddingTask
+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4;
- (BOOL)processInput:(id)a3 resource:(id)a4 result:(id *)a5 error:(id *)a6;
- (id)embeddingFromMultiArray:(id)a3 version:(unint64_t)a4;
- (int)run;
@end

@implementation MADTextEmbeddingTask

+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[MADTextEmbeddingResource sharedResource:](MADTextEmbeddingResource, "sharedResource:", [v5 version]);
  v7 = +[VCPMADResourceManager sharedManager];
  v64 = [v7 activateResource:v6];

  v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = VCPSignPostLog();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CSUTextEncoder_loadResources", "", buf, 2u);
  }

  uint64_t v12 = [v6 textEncoder];
  if (!v12)
  {
    id v16 = 0;
LABEL_21:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = [v16 description];
        *(_DWORD *)buf = 138412290;
        v75 = v33;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Failed to prewarm text encoder (%@)", buf, 0xCu);
      }
    }
    if (a4)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28760];
      uint64_t v72 = *MEMORY[0x1E4F28568];
      v28 = [NSString stringWithFormat:@"Failed to prewarm text encoder"];
      v73 = v28;
      v29 = (void *)MEMORY[0x1E4F1C9E8];
      v30 = &v73;
      v31 = &v72;
      goto LABEL_27;
    }
LABEL_44:
    BOOL v35 = 0;
    goto LABEL_45;
  }
  v13 = (void *)v12;
  v14 = [v6 textEncoder];
  id v65 = 0;
  char v15 = [v14 loadResources:&v65];
  id v16 = v65;

  if ((v15 & 1) == 0) {
    goto LABEL_21;
  }
  v17 = VCPSignPostLog();
  v18 = v17;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v9, "CSUTextEncoder_loadResources", "", buf, 2u);
  }

  if (![v5 computeThreshold])
  {
LABEL_33:
    if (objc_msgSend(v5, "computeSafety", v64))
    {
      v38 = VCPSignPostLog();
      os_signpost_id_t v39 = os_signpost_id_generate(v38);

      v40 = VCPSignPostLog();
      v41 = v40;
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "MADTextEmbeddingSafety_loadResources", "", buf, 2u);
      }

      v42 = [v6 safety];
      int v43 = [v42 loadResources];

      if (v43)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v44 = VCPLogInstance();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_ERROR, "Failed to prewarm text embedding safety", buf, 2u);
          }
        }
        if (a4)
        {
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = *MEMORY[0x1E4F28760];
          uint64_t v68 = *MEMORY[0x1E4F28568];
          v28 = [NSString stringWithFormat:@"Failed to prewarm text embedding safety"];
          v69 = v28;
          v29 = (void *)MEMORY[0x1E4F1C9E8];
          v30 = &v69;
          v31 = &v68;
          goto LABEL_27;
        }
        goto LABEL_44;
      }
      v47 = VCPSignPostLog();
      v48 = v47;
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v48, OS_SIGNPOST_INTERVAL_END, v39, "MADTextEmbeddingSafety_loadResources", "", buf, 2u);
      }
    }
    v45 = v64;
    [v64 reset];
    if (![v5 calibrate] || objc_msgSend(v5, "version") != 3)
    {
      BOOL v35 = 1;
      goto LABEL_46;
    }
    v28 = +[MADTextEmbeddingCalibrationResource sharedResource];
    v49 = +[VCPMADResourceManager sharedManager];
    v34 = [v49 activateResource:v28];

    v50 = VCPSignPostLog();
    os_signpost_id_t v51 = os_signpost_id_generate(v50);

    v52 = VCPSignPostLog();
    v53 = v52;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "MADTextEmbeddingCalibration_loadResources", "", buf, 2u);
    }

    v54 = [v28 instance];
    int v55 = [v54 loadResources];

    if (v55)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = [v16 description];
          *(_DWORD *)buf = 138412290;
          v75 = v57;
          _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_ERROR, "Failed to prewarm text embedding calibration (%@)", buf, 0xCu);
        }
      }
      if (a4)
      {
        v58 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = *MEMORY[0x1E4F28760];
        uint64_t v66 = *MEMORY[0x1E4F28568];
        v60 = [NSString stringWithFormat:@"Failed to prewarm text embedding calibration"];
        v67 = v60;
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        *a4 = [v58 errorWithDomain:v59 code:-50 userInfo:v61];
      }
      BOOL v35 = 0;
    }
    else
    {
      v62 = VCPSignPostLog();
      v63 = v62;
      if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v63, OS_SIGNPOST_INTERVAL_END, v51, "MADTextEmbeddingCalibration_loadResources", "", buf, 2u);
      }

      [v34 reset];
      BOOL v35 = 1;
    }
    goto LABEL_28;
  }
  v19 = VCPSignPostLog();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  v21 = VCPSignPostLog();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADTextEmbeddingThreshold_loadResources", "", buf, 2u);
  }

  v23 = [v6 calibration];
  int v24 = [v23 loadResources];

  if (!v24)
  {
    v36 = VCPSignPostLog();
    v37 = v36;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_END, v20, "MADTextEmbeddingThreshold_loadResources", "", buf, 2u);
    }

    goto LABEL_33;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "Failed to prewarm text embedding calibration", buf, 2u);
    }
  }
  if (!a4) {
    goto LABEL_44;
  }
  v26 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = *MEMORY[0x1E4F28760];
  uint64_t v70 = *MEMORY[0x1E4F28568];
  v28 = [NSString stringWithFormat:@"Failed to prewarm text embedding calibration"];
  v71 = v28;
  v29 = (void *)MEMORY[0x1E4F1C9E8];
  v30 = &v71;
  v31 = &v70;
LABEL_27:
  v34 = objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1, v64);
  [v26 errorWithDomain:v27 code:-50 userInfo:v34];
  BOOL v35 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_45:
  v45 = v64;
LABEL_46:

  return v35;
}

- (id)embeddingFromMultiArray:(id)a3 version:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 dataType];
  if (v6 == 65552)
  {
    uint64_t v7 = 1;
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if (v6 == 65568)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 2;
LABEL_5:
    *(void *)buf = 0;
    v17 = buf;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__24;
    os_signpost_id_t v20 = __Block_byref_object_dispose__24;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__MADTextEmbeddingTask_embeddingFromMultiArray_version___block_invoke;
    v15[3] = &unk_1E62991D0;
    v15[4] = buf;
    [v5 getBytesWithHandler:v15];
    if (a4 - 1 <= 1)
    {
      uint64_t v9 = +[VCPTextEncoder applyL2Norm:*((void *)v17 + 5) isFP16:v7];
      v10 = (void *)*((void *)v17 + 5);
      *((void *)v17 + 5) = v9;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F745B8]);
    uint64_t v12 = (void *)[v11 initWithVersion:a4 data:*((void *)v17 + 5) type:v8];
    _Block_object_dispose(buf, 8);

    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v5 dataType];
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Unsupported embedding data type (%d)", buf, 8u);
    }
  }
  uint64_t v12 = 0;
LABEL_13:

  return v12;
}

void __56__MADTextEmbeddingTask_embeddingFromMultiArray_version___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 length:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)processInput:(id)a3 resource:(id)a4 result:(id *)a5 error:(id *)a6
{
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v164 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  v162 = v7;
  uint64_t v9 = [v7 segments];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v186 objects:v209 count:16];
  if (!v10) {
    goto LABEL_23;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v187;
  uint64_t v168 = *(void *)v187;
  v175 = v9;
  while (2)
  {
    uint64_t v13 = 0;
    id obj = (id)v11;
    do
    {
      if (*(void *)v187 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v186 + 1) + 8 * v13);
      char v15 = (void *)MEMORY[0x1C186D320]();
      if ([v14 type] == 1)
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F5D0B8]);
        v17 = [v14 text];
        [v16 setString:v17];

        [v8 addObject:v16];
        goto LABEL_21;
      }
      if ([v14 type] != 2)
      {
        if ([v14 type] == 3)
        {
          v165 = v15;
          id v16 = v14;
          long long v181 = 0u;
          long long v182 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          v26 = [v16 tokenIDs];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v181 objects:v204 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v182;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v182 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v181 + 1) + 8 * i);
                id v32 = objc_alloc_init(MEMORY[0x1E4F5D0D8]);
                [v32 setTokenID:v31];
                [v8 addObject:v32];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v181 objects:v204 count:16];
            }
            while (v28);
          }

          uint64_t v9 = v175;
          char v15 = v165;
          goto LABEL_20;
        }
        v57 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = *MEMORY[0x1E4F28760];
        uint64_t v202 = *MEMORY[0x1E4F28568];
        uint64_t v59 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported text input segment type (%d)", objc_msgSend(v14, "type"));
        v203 = v59;
        v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
        id v16 = [v57 errorWithDomain:v58 code:-18 userInfo:v60];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v61 = VCPLogInstance();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v62 = [v16 description];
            *(_DWORD *)buf = 138412290;
            v206 = v62;
            _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        if (!a6)
        {
LABEL_46:

          BOOL v63 = 0;
          goto LABEL_63;
        }
        id v16 = v16;
        id v19 = *a6;
        *a6 = v16;
LABEL_45:

        goto LABEL_46;
      }
      uint64_t v18 = v15;
      id v16 = v14;
      id v19 = objc_alloc_init(MEMORY[0x1E4F5D0D0]);
      os_signpost_id_t v20 = [v164 entityGallery];
      id v21 = [v16 entityUUID];
      uint64_t v22 = [v164 tokenEmbeddingType];
      id v185 = 0;
      v23 = [v20 tokenEmbeddingsForTag:v21 client:0 type:v22 error:&v185];
      id v24 = v185;
      [v19 setEmbedding:v23];

      v25 = [v19 embedding];

      if (!v25)
      {
        id objc = (id)MEMORY[0x1E4F28C58];
        uint64_t v169 = *MEMORY[0x1E4F28760];
        uint64_t v207 = *MEMORY[0x1E4F28568];
        v50 = NSString;
        os_signpost_id_t v51 = [v16 entityUUID];
        v52 = [v24 description];
        v53 = [v50 stringWithFormat:@"Failed to resolve entity %@ (%@)", v51, v52];
        v208 = v53;
        v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
        id obja = [objc errorWithDomain:v169 code:-18 userInfo:v54];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          int v55 = VCPLogInstance();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = [obja description];
            *(_DWORD *)buf = 138412290;
            v206 = v56;
            _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        if (a6) {
          objc_storeStrong(a6, obja);
        }

        char v15 = v18;
        uint64_t v9 = v175;
        goto LABEL_45;
      }
      [v8 addObject:v19];

      char v15 = v18;
      uint64_t v9 = v175;
LABEL_20:
      uint64_t v12 = v168;
      uint64_t v11 = (uint64_t)obj;
LABEL_21:

      ++v13;
    }
    while (v13 != v11);
    uint64_t v11 = [v9 countByEnumeratingWithState:&v186 objects:v209 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_23:

  v33 = +[VCPMADResourceManager sharedManager];
  v176 = [v33 activateResource:v164];

  v34 = [(MADServiceTextProcessingSubtask *)self request];
  if ([v34 version] != 5) {
    goto LABEL_47;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    BOOL v35 = VCPLogInstance();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = qword_1BC282FC0[[v34 extendedContextLength]];
      *(_DWORD *)buf = 67109120;
      LODWORD(v206) = v36;
      _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_INFO, "Setting context length: %d", buf, 8u);
    }
  }
  v37 = [v164 textEncoder];
  uint64_t v38 = qword_1BC282FC0[[v34 extendedContextLength]];
  id v180 = 0;
  [v37 setContextLength:v38 error:&v180];
  id v39 = v180;

  if (!v39)
  {
LABEL_47:
    v64 = VCPSignPostLog();
    os_signpost_id_t v65 = os_signpost_id_generate(v64);

    uint64_t v66 = VCPSignPostLog();
    v67 = v66;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
    {
      uint64_t v68 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      v206 = v68;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);
    }
    v69 = [v164 textEncoder];
    id v179 = 0;
    [v69 runOnInput:v8 error:&v179];
    id v39 = v179;

    uint64_t v70 = VCPSignPostLog();
    v71 = v70;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
    {
      uint64_t v72 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      v206 = v72;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v71, OS_SIGNPOST_INTERVAL_END, v65, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);
    }
    v47 = a6;
    if (v39)
    {
      v73 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v74 = *MEMORY[0x1E4F28760];
      uint64_t v198 = *MEMORY[0x1E4F28568];
      v75 = NSString;
      uint64_t v76 = [v39 description];
      v77 = [v75 stringWithFormat:@"Text encoding failed (%@)", v76];
      v199 = v77;
      v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];
      v46 = [v73 errorWithDomain:v74 code:-18 userInfo:v78];

      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_59;
      }
      v48 = VCPLogInstance();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_58;
      }
LABEL_56:
      v49 = [v46 description];
      *(_DWORD *)buf = 138412290;
      v206 = v49;
      goto LABEL_57;
    }
    v80 = [v164 textEncoder];
    v81 = [v80 inferenceOutputs];
    v82 = [v81 CSUTextEmbedding];
    -[MADTextEmbeddingTask embeddingFromMultiArray:version:](self, "embeddingFromMultiArray:version:", v82, [v34 version]);
    id v39 = (id)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      v94 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v95 = *MEMORY[0x1E4F28760];
      uint64_t v196 = *MEMORY[0x1E4F28568];
      v96 = [NSString stringWithFormat:@"Failed to extract and normalize embedding"];
      v197 = v96;
      v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
      v46 = [v94 errorWithDomain:v95 code:-18 userInfo:v97];

      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_59;
      }
      v48 = VCPLogInstance();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_58;
      }
      goto LABEL_56;
    }
    if ([v34 computeThreshold])
    {
      uint64_t v178 = 0;
      int v177 = 0;
      v83 = VCPSignPostLog();
      os_signpost_id_t v84 = os_signpost_id_generate(v83);

      v85 = VCPSignPostLog();
      v86 = v85;
      if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
      {
        v87 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v206 = v87;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v86, OS_SIGNPOST_INTERVAL_BEGIN, v84, "MADTextEmbeddingThreshold", "%@", buf, 0xCu);
      }
      v88 = [v164 calibration];
      int v89 = [v88 processEmbedding:v39 bias:(char *)&v178 + 4 scale:&v178 threshold:&v177];

      if (v89)
      {
        v90 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v91 = *MEMORY[0x1E4F28760];
        uint64_t v194 = *MEMORY[0x1E4F28568];
        v92 = [NSString stringWithFormat:@"Text embedding threshold calibration failed"];
        v195 = v92;
        v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
        v46 = [v90 errorWithDomain:v91 code:v89 userInfo:v93];

        v47 = a6;
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_59;
        }
        v48 = VCPLogInstance();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        v49 = [v46 description];
        *(_DWORD *)buf = 138412290;
        v206 = v49;
LABEL_57:
        _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        goto LABEL_58;
      }
      v100 = VCPSignPostLog();
      v101 = v100;
      if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
      {
        v102 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v206 = v102;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v101, OS_SIGNPOST_INTERVAL_END, v84, "MADTextEmbeddingThreshold", "%@", buf, 0xCu);
      }
      uint64_t v103 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v164, "calibrationVersion"));
      LODWORD(v104) = HIDWORD(v178);
      v99 = [NSNumber numberWithFloat:v104];
      LODWORD(v105) = v178;
      id objb = [NSNumber numberWithFloat:v105];
      v98 = (void *)v103;
      LODWORD(v106) = v177;
      v170 = [NSNumber numberWithFloat:v106];
    }
    else
    {
      v98 = 0;
      v99 = 0;
      v170 = 0;
      id objb = 0;
    }
    if ([v34 computeSafety])
    {
      v166 = v98;
      HIDWORD(v178) = 0;
      LOBYTE(v178) = 0;
      v107 = VCPSignPostLog();
      os_signpost_id_t v108 = os_signpost_id_generate(v107);

      v109 = VCPSignPostLog();
      v110 = v109;
      if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
      {
        v111 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v206 = v111;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v110, OS_SIGNPOST_INTERVAL_BEGIN, v108, "MADTextEmbeddingSafety", "%@", buf, 0xCu);
      }
      v112 = [v164 safety];
      int v113 = [v112 processEmbedding:v39 safetyScore:(char *)&v178 + 4 isSafe:&v178];

      if (v113)
      {
        v114 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v115 = *MEMORY[0x1E4F28760];
        uint64_t v192 = *MEMORY[0x1E4F28568];
        v116 = [NSString stringWithFormat:@"Text embedding safety failed"];
        v193 = v116;
        v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
        v118 = [v114 errorWithDomain:v115 code:v113 userInfo:v117];

        v119 = objb;
        v98 = v166;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v120 = VCPLogInstance();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          {
            v121 = [v118 description];
            *(_DWORD *)buf = 138412290;
            v206 = v121;
            _os_log_impl(&dword_1BBEDA000, v120, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            v98 = v166;
          }
        }
        if (a6) {
          objc_storeStrong(a6, v118);
        }

        BOOL v63 = 0;
        goto LABEL_119;
      }
      v125 = VCPSignPostLog();
      v126 = v125;
      if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
      {
        v127 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v206 = v127;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v126, OS_SIGNPOST_INTERVAL_END, v108, "MADTextEmbeddingSafety", "%@", buf, 0xCu);
      }
      LODWORD(v128) = HIDWORD(v178);
      v122 = [NSNumber numberWithFloat:v128];
      uint64_t v123 = [NSNumber numberWithBool:v178];
      v124 = a5;
      v98 = v166;
    }
    else
    {
      v122 = 0;
      uint64_t v123 = 0;
      v124 = a5;
    }
    v158 = (void *)v123;
    [v176 reset];
    if ([v34 calibrate])
    {
      v167 = v98;
      v159 = v99;
      v129 = +[MADTextEmbeddingCalibrationResource sharedResource];
      v130 = +[VCPMADResourceManager sharedManager];
      v131 = [v130 activateResource:v129];

      uint64_t v178 = 0;
      v132 = VCPSignPostLog();
      os_signpost_id_t v133 = os_signpost_id_generate(v132);

      v134 = VCPSignPostLog();
      v135 = v134;
      if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
      {
        v136 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v206 = v136;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v135, OS_SIGNPOST_INTERVAL_BEGIN, v133, "MADTextEmbeddingCalibration", "%@", buf, 0xCu);
      }
      v157 = v129;
      v137 = [v129 instance];
      int v138 = [v137 processEmbedding:v39 mean:(char *)&v178 + 4 standardDeviation:&v178];

      if (v138)
      {
        v139 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v140 = *MEMORY[0x1E4F28760];
        uint64_t v190 = *MEMORY[0x1E4F28568];
        v141 = [NSString stringWithFormat:@"Text embedding calibration failed"];
        v191 = v141;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
        v143 = v142 = v131;
        v144 = [v139 errorWithDomain:v140 code:v138 userInfo:v143];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v145 = VCPLogInstance();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
          {
            v146 = [v144 description];
            *(_DWORD *)buf = 138412290;
            v206 = v146;
            _os_log_impl(&dword_1BBEDA000, v145, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        if (a6) {
          objc_storeStrong(a6, v144);
        }

        v147 = 0;
        v148 = 0;
        BOOL v63 = 0;
        v149 = v158;
        v99 = v159;
        v98 = v167;
        goto LABEL_118;
      }
      v150 = VCPSignPostLog();
      v151 = v150;
      if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v150))
      {
        v152 = [(MADServiceTextProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v206 = v152;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v151, OS_SIGNPOST_INTERVAL_END, v133, "MADTextEmbeddingCalibration", "%@", buf, 0xCu);
      }
      [v131 reset];

      LODWORD(v153) = HIDWORD(v178);
      v147 = [NSNumber numberWithFloat:v153];
      LODWORD(v154) = v178;
      v148 = [NSNumber numberWithFloat:v154];

      v98 = &unk_1F15EBC28;
      v124 = a5;
    }
    else
    {
      v147 = 0;
      v148 = 0;
    }
    uint64_t v155 = [objc_alloc(MEMORY[0x1E4F74690]) initWithEmbedding:v39 calibrationVersion:v98 mean:v147 standardDeviation:v148 bias:v99 scale:objb threshold:v170];
    id v156 = *v124;
    id *v124 = (id)v155;

    if ([v34 computeSafety])
    {
      v149 = v158;
      [*v124 setSafetyScore:v122 isSafe:v158];
      BOOL v63 = 1;
    }
    else
    {
      BOOL v63 = 1;
      v149 = v158;
    }
LABEL_118:

    v119 = objb;
LABEL_119:

    goto LABEL_62;
  }
  v40 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v41 = *MEMORY[0x1E4F28760];
  uint64_t v200 = *MEMORY[0x1E4F28568];
  v42 = NSString;
  int v43 = [v39 description];
  v44 = [v42 stringWithFormat:@"Failed to set context length (%@)", v43];
  v201 = v44;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
  v46 = [v40 errorWithDomain:v41 code:-18 userInfo:v45];

  v47 = a6;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v48 = VCPLogInstance();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = [v46 description];
      *(_DWORD *)buf = 138412290;
      v206 = v49;
      goto LABEL_57;
    }
LABEL_58:
  }
LABEL_59:
  if (v47) {
    objc_storeStrong(v47, v46);
  }

  BOOL v63 = 0;
LABEL_62:

  uint64_t v9 = v176;
LABEL_63:

  return v63;
}

- (int)run
{
  v38[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "MADTextEmbeddingTask running...", buf, 2u);
    }
  }
  uint64_t v4 = [(MADServiceTextProcessingSubtask *)self request];
  if ([v4 calibrate] && objc_msgSend(v4, "version") != 3)
  {
    uint64_t v5 = [(MADServiceTextProcessingSubtask *)self request];
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [NSString stringWithFormat:@"Calibration only supported for MD3"];
    v38[0] = v6;
    os_signpost_id_t v20 = (void *)MEMORY[0x1E4F1C9E8];
    id v21 = (void **)v38;
    uint64_t v22 = &v37;
LABEL_32:
    uint64_t v8 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
    v23 = [v18 errorWithDomain:v19 code:-18 userInfo:v8];
    [v5 setError:v23];

    goto LABEL_33;
  }
  if ([v4 computeThreshold]
    && [v4 version] != 3
    && [v4 version] != 4
    && [v4 version] != 5)
  {
    uint64_t v5 = [(MADServiceTextProcessingSubtask *)self request];
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [NSString stringWithFormat:@"Threshold calibration only supported for MD3/MD4/MD5"];
    uint64_t v36 = v6;
    os_signpost_id_t v20 = (void *)MEMORY[0x1E4F1C9E8];
    id v21 = &v36;
    uint64_t v22 = &v35;
    goto LABEL_32;
  }
  if ([v4 computeSafety] && objc_msgSend(v4, "version") != 5)
  {
    uint64_t v5 = [(MADServiceTextProcessingSubtask *)self request];
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [NSString stringWithFormat:@"Safety only supported for MD5"];
    v34 = v6;
    os_signpost_id_t v20 = (void *)MEMORY[0x1E4F1C9E8];
    id v21 = &v34;
    uint64_t v22 = &v33;
    goto LABEL_32;
  }
  uint64_t v5 = +[MADTextEmbeddingResource sharedResource:](MADTextEmbeddingResource, "sharedResource:", objc_msgSend(v4, "version", v4));
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = [(MADServiceTextProcessingSubtask *)self asset];
  uint64_t v8 = [v7 textInputs];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
LABEL_15:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1C186D320]();
      id v26 = 0;
      *(void *)buf = 0;
      BOOL v15 = [(MADTextEmbeddingTask *)self processInput:v13 resource:v5 result:&v26 error:buf];
      if (v15)
      {
        [v6 addObject:v26];
      }
      else
      {
        id v16 = [(MADServiceTextProcessingSubtask *)self request];
        [v16 setError:*(void *)buf];
      }
      if (!v15) {
        goto LABEL_27;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_15;
        }
        break;
      }
    }
  }

  v17 = [(MADServiceTextProcessingSubtask *)self request];
  [v17 setResults:v6];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "MADTextEmbeddingTask complete", buf, 2u);
    }
LABEL_27:
    uint64_t v4 = v25;
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v4 = v25;
LABEL_34:

  return 0;
}

@end