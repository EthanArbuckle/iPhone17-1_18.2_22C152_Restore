@interface MADPersonalizedEmbeddingTask
+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4;
+ (id)embeddingFromMultiArray:(id)a3 normalize:(BOOL)a4 version:(unint64_t)a5;
- (CGRect)expandNormalizedRect:(CGRect)a3;
- (id)gallery;
- (int)processEntitySegment:(id)a3 tokenEmbeddingType:(int64_t)a4 textEncoderInput:(id *)a5 ageType:(unsigned __int16 *)a6;
- (int)processFaceprintSegment:(id)a3 resource:(id)a4 textEncoderInput:(id *)a5 faceObservation:(id *)a6;
- (int)processGenerativePlaygroundsOutput:(id)a3 resource:(id)a4 entitySegment:(id)a5 imageSegment:(id)a6 faceObservation:(id)a7 personalizationIndex:(unint64_t)a8 embeddingResult:(id *)a9 hiddenLayerResult:(id *)a10 pooledEmbeddingResult:(id *)a11;
- (int)processImageSegment:(id)a3 resource:(id)a4 textEncoderInput:(id *)a5 faceObservation:(id *)a6 ageType:(unsigned __int16 *)a7;
- (int)processInput:(id)a3 resource:(id)a4 result:(id *)a5;
- (int)processPixelBuffer:(__CVBuffer *)a3 imageEmbedding:(id *)a4;
- (int)processSegments:(id)a3 resource:(id)a4 keyEntitySegment:(id *)a5 keyImageSegment:(id *)a6 faceObservation:(id *)a7 personalizationIndex:(unint64_t *)a8 textEncoderInputs:(id)a9;
- (int)processSystemSearchOutput:(id)a3 resource:(id)a4 embeddingResult:(id *)a5;
- (int)run;
- (int64_t)revision;
- (unint64_t)imageEmbeddingVersion;
@end

@implementation MADPersonalizedEmbeddingTask

+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    id v6 = v5;
    v7 = +[MADTextEncoderResource sharedResource:](MADTextEncoderResource, "sharedResource:", [v6 revision]);
    if (v7)
    {
      v8 = +[VCPMADResourceManager sharedManager];
      v9 = [v8 activateResource:v7];

      v10 = VCPSignPostLog();
      os_signpost_id_t v11 = os_signpost_id_generate(v10);

      v12 = VCPSignPostLog();
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CSUTextEncoder_loadResources", "", buf, 2u);
      }

      v14 = [v7 textEncoder];
      id v31 = 0;
      char v15 = [v14 loadResources:&v31];
      id v16 = v31;

      if (v15)
      {
        v17 = VCPSignPostLog();
        v18 = v17;
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v11, "CSUTextEncoder_loadResources", "", buf, 2u);
        }

        [v9 reset];
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = [v16 description];
            *(_DWORD *)buf = 138412290;
            v39 = v26;
            _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "Failed to pre-warm text encoder (%@)", buf, 0xCu);
          }
        }
        if (a4)
        {
          v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v28 = [NSString stringWithFormat:@"Failed to pre-warm text encoder"];
          v33 = v28;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = [v27 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v29];
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = [v6 revision];
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "Invalid personalized embedding revision specified (%d)", buf, 8u);
        }
      }
      if (!a4)
      {
        char v15 = 0;
        goto LABEL_31;
      }
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      id v16 = [NSString stringWithFormat:@"Invalid personalized embedding revision specified"];
      id v35 = v16;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      [v24 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v9];
      char v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_31:
    goto LABEL_32;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v19 = VCPLogInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138412290;
      v39 = v21;
      _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Pre-warming attempted for invalid request (%@)", buf, 0xCu);
    }
  }
  if (a4)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    id v6 = [NSString stringWithFormat:@"Pre-warming attempted for invalid request"];
    id v37 = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v7];
    char v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  char v15 = 0;
LABEL_32:

  return v15;
}

- (int64_t)revision
{
  v2 = [(MADMultiModalProcessingSubtask *)self request];
  int64_t v3 = [v2 revision];

  return v3;
}

- (id)gallery
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  gallery = self->_gallery;
  if (gallery)
  {
LABEL_15:
    v18 = gallery;
    goto LABEL_16;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
  id v5 = objc_msgSend(v4, "vcp_visionCacheStorageDirectoryURL");
  id v6 = [v5 URLByAppendingPathComponent:@"VUIndex.sqlite"];
  if (v6)
  {
    v7 = VCPSignPostLog();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    v9 = VCPSignPostLog();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VUWGallery_initWithPath", "", buf, 2u);
    }

    id v24 = 0;
    os_signpost_id_t v11 = (VUWGallery *)[objc_alloc(MEMORY[0x1E4FB4238]) initWithPath:v6 error:&v24];
    id v12 = v24;
    v13 = self->_gallery;
    self->_gallery = v11;

    v14 = VCPSignPostLog();
    char v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_END, v8, "VUWGallery_initWithPath", "", buf, 2u);
    }

    if (!self->_gallery && (int)MediaAnalysisLogLevel() >= 3)
    {
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [v12 description];
        *(_DWORD *)buf = 138412290;
        v26 = v17;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Failed to load VU Gallery (%@)", buf, 0xCu);
      }
    }

    gallery = self->_gallery;
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = [v4 photoLibraryURL];
      *(_DWORD *)buf = 138412546;
      v26 = v22;
      __int16 v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "Failed to create %@: no VUIndex URL for library %@", buf, 0x16u);
    }
  }

  v18 = 0;
LABEL_16:
  return v18;
}

+ (id)embeddingFromMultiArray:(id)a3 normalize:(BOOL)a4 version:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 dataType];
  if (v8 == 65552)
  {
    uint64_t v9 = 1;
    uint64_t v10 = 1;
    goto LABEL_5;
  }
  if (v8 == 65568)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 2;
LABEL_5:
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__47;
    id v24 = __Block_byref_object_dispose__47;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__MADPersonalizedEmbeddingTask_embeddingFromMultiArray_normalize_version___block_invoke;
    v19[3] = &unk_1E6298098;
    v19[4] = buf;
    [v7 getBytesWithHandler:v19];
    if (v6)
    {
      uint64_t v11 = +[VCPTextEncoder applyL2Norm:*((void *)v21 + 5) isFP16:v9];
      id v12 = (void *)*((void *)v21 + 5);
      *((void *)v21 + 5) = v11;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F745B8]);
    uint64_t v14 = *((void *)v21 + 5);
    char v15 = [v7 shape];
    id v16 = (void *)[v13 initWithVersion:a5 data:v14 type:v10 shape:v15];

    _Block_object_dispose(buf, 8);
    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v7 dataType];
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "Unsupported embedding data type (%d)", buf, 8u);
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

void __74__MADPersonalizedEmbeddingTask_embeddingFromMultiArray_normalize_version___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 length:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (int)processEntitySegment:(id)a3 tokenEmbeddingType:(int64_t)a4 textEncoderInput:(id *)a5 ageType:(unsigned __int16 *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [(MADPersonalizedEmbeddingTask *)self gallery];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F5D0D0]);
    id v13 = [v10 entityUUID];
    id v34 = 0;
    uint64_t v14 = [v11 tokenEmbeddingsForTag:v13 client:0 type:a4 error:&v34];
    char v15 = v34;
    [v12 setEmbedding:v14];

    id v16 = [v12 embedding];
    LODWORD(v13) = v16 == 0;

    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v27 = -18;
        goto LABEL_18;
      }
      log = VCPLogInstance();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v28 = [v10 entityUUID];
        uint64_t v29 = [v15 description];
        *(_DWORD *)buf = 138412546;
        id v37 = v28;
        __int16 v38 = 2112;
        v39 = v29;
        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "Failed to resolve entity %@ (%@)", buf, 0x16u);
      }
      int v27 = -18;
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    objc_storeStrong(a5, v12);
    log = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
    v17 = [log librarySpecificFetchOptions];
    [v17 setFetchLimit:1];
    v18 = (void *)MEMORY[0x1E4F391F8];
    v19 = [v10 entityUUID];
    v20 = [v19 UUIDString];
    id v35 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    uint64_t v22 = [v18 fetchPersonsWithLocalIdentifiers:v21 options:v17];

    if ([v22 count])
    {
      v23 = (void *)MEMORY[0x1E4F39048];
      id v24 = [v22 firstObject];
      id v25 = [v23 fetchFacesForPerson:v24 options:v17];

      if ([v25 count])
      {
        uint64_t v26 = [v25 firstObject];
        *a6 = [v26 ageType];
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_7;
        }
        uint64_t v26 = VCPLogInstance();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = [v10 entityUUID];
          *(_DWORD *)buf = 138412290;
          id v37 = v32;
          _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "Failed to fetch Photos face (%@)", buf, 0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_8;
      }
      id v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v31 = [v10 entityUUID];
        *(_DWORD *)buf = 138412290;
        id v37 = v31;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "Failed to fetch Photos person (%@)", buf, 0xCu);
      }
    }
LABEL_7:

LABEL_8:
    int v27 = 0;
    goto LABEL_17;
  }
  if ((int)MediaAnalysisLogLevel() < 3)
  {
    int v27 = -18;
    goto LABEL_20;
  }
  char v15 = VCPLogInstance();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "Failed to create VUWGallery", buf, 2u);
  }
  int v27 = -18;
LABEL_19:

LABEL_20:
  return v27;
}

- (CGRect)expandNormalizedRect:(CGRect)a3
{
  v3.origin.x = a3.origin.x - a3.size.width * 0.5;
  v3.origin.y = a3.origin.y - a3.size.height * 0.5;
  v3.size.width = a3.size.width + a3.size.width;
  v3.size.height = a3.size.height + a3.size.height;
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 1.0;
  v5.size.height = 1.0;
  return CGRectIntersection(v3, v5);
}

- (int)processImageSegment:(id)a3 resource:(id)a4 textEncoderInput:(id *)a5 faceObservation:(id *)a6 ageType:(unsigned __int16 *)a7
{
  v180[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v158 = a4;
  CFTypeRef cf = 0;
  id v10 = [v9 surface];
  CVReturn v11 = CVPixelBufferCreateWithIOSurface(0, v10, 0, (CVPixelBufferRef *)&cf);
  v153 = a5;

  if (!v11)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F457A8]);
    id v169 = 0;
    v157 = v13;
    char v14 = [v13 setRevision:3737841670 error:&v169];
    id v12 = v169;
    if (v14)
    {
      v168 = v12;
      v151 = objc_alloc_init(MEMORY[0x1E4F456E0]);
      char v15 = [v151 setRevision:3737841669 error:&v168];
      id v16 = v168;

      if (v15)
      {
        v167 = v16;
        v149 = objc_alloc_init(MEMORY[0x1E4F457C0]);
        char v17 = [v149 setRevision:3737841666 error:&v167];
        v18 = v167;

        if ((v17 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            CVReturn v11 = -18;
LABEL_151:
            id v16 = v18;
            v64 = v149;
LABEL_152:

            id v12 = v16;
            v62 = v151;
            goto LABEL_153;
          }
          v66 = VCPLogInstance();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = [v18 description];
            *(_DWORD *)buf = 138412290;
            v172 = v67;
            _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_ERROR, "Failed to configure torso detection (%@)", buf, 0xCu);
          }
          CVReturn v11 = -18;
LABEL_150:

          goto LABEL_151;
        }
        v146 = objc_alloc_init(MEMORY[0x1E4F45968]);
        id v19 = objc_alloc(MEMORY[0x1E4F45890]);
        v148 = (void *)[v19 initWithCVPixelBuffer:cf options:MEMORY[0x1E4F1CC08] session:v146];
        v20 = VCPSignPostLog();
        os_signpost_id_t v21 = os_signpost_id_generate(v20);

        uint64_t v22 = VCPSignPostLog();
        v23 = v22;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          id v24 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
          *(_DWORD *)buf = 138412290;
          v172 = v24;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);
        }
        v180[0] = v157;
        v180[1] = v151;
        v180[2] = v149;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:3];
        uint64_t v147 = v166[1] = v18;
        char v25 = objc_msgSend(v148, "performRequests:error:");
        uint64_t v26 = v18;

        if (v25)
        {
          int v27 = VCPSignPostLog();
          v28 = v27;
          if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
          {
            uint64_t v29 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
            *(_DWORD *)buf = 138412290;
            v172 = v29;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_END, v21, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);
          }
          v30 = [v157 results];
          BOOL v31 = [v30 count] == 0;

          if (v31)
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v70 = VCPLogInstance();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v70, OS_LOG_TYPE_DEFAULT, "No face detected, falling back to non-personalized embedding", buf, 2u);
              }
            }
            id v71 = *v153;
            id *v153 = 0;

            CVReturn v11 = 0;
            v69 = *a6;
            *a6 = 0;
            goto LABEL_148;
          }
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v32 = VCPLogInstance();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v33 = [v157 results];
              int v34 = [v33 count];
              *(_DWORD *)buf = 67109120;
              LODWORD(v172) = v34;
              _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_INFO, "Face count: %d", buf, 8u);
            }
          }
          v166[0] = v26;
          v145 = objc_alloc_init(MEMORY[0x1E4F45740]);
          char v35 = [v145 setRevision:3737841669 error:v166];
          v143 = v166[0];

          if (v35)
          {
            uint64_t v36 = [v157 results];
            id v37 = [v36 firstObject];

            __int16 v38 = [v151 results];
            v39 = [v38 firstObject];
            uint64_t v40 = [v39 faceAttributes];
            v41 = [v40 ageCategory];
            v42 = [v41 label];
            v150 = [v42 identifier];

            for (unint64_t i = 1; ; ++i)
            {
              v44 = [v157 results];
              BOOL v45 = i < [v44 count];

              if (!v45) {
                break;
              }
              v46 = [v157 results];
              v47 = [v46 objectAtIndexedSubscript:i];

              [v47 boundingBox];
              double v49 = v48;
              [v47 boundingBox];
              double v51 = v50;
              [v37 boundingBox];
              double v53 = v52;
              [v37 boundingBox];
              if (v49 * v51 <= v53 * v54)
              {
                v55 = v37;
              }
              else
              {
                v55 = v47;

                v56 = [v151 results];
                v57 = [v56 objectAtIndexedSubscript:i];
                v58 = [v57 faceAttributes];
                v59 = [v58 ageCategory];
                v60 = [v59 label];
                uint64_t v61 = [v60 identifier];

                v150 = (void *)v61;
              }

              id v37 = v55;
            }
            v73 = v145;
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v74 = VCPLogInstance();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v172 = v37;
                _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_INFO, "Largest face: %@", buf, 0xCu);
              }

              v73 = v145;
            }
            v179 = v37;
            v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v179 count:1];
            [v73 setInputFaceObservations:v75];

            v141 = [MEMORY[0x1E4F1CA48] array];
            [v141 addObject:v145];
            long long v164 = 0u;
            long long v165 = 0u;
            long long v162 = 0u;
            long long v163 = 0u;
            v76 = [v149 results];
            uint64_t v77 = [v76 countByEnumeratingWithState:&v162 objects:v178 count:16];
            if (v77)
            {
              uint64_t v78 = *(void *)v163;
              while (2)
              {
                for (uint64_t j = 0; j != v77; ++j)
                {
                  if (*(void *)v163 != v78) {
                    objc_enumerationMutation(v76);
                  }
                  v80 = *(void **)(*((void *)&v162 + 1) + 8 * j);
                  v81 = [v37 groupId];
                  v82 = [v80 groupId];
                  int v83 = [v81 isEqual:v82];

                  if (v83)
                  {
                    v142 = v80;
                    goto LABEL_73;
                  }
                }
                uint64_t v77 = [v76 countByEnumeratingWithState:&v162 objects:v178 count:16];
                if (v77) {
                  continue;
                }
                break;
              }
            }
            v142 = 0;
LABEL_73:

            v84 = v143;
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v85 = VCPLogInstance();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v172 = v142;
                _os_log_impl(&dword_1BBEDA000, v85, OS_LOG_TYPE_INFO, "Associated torso: %@", buf, 0xCu);
              }

              v84 = v143;
            }
            if (v142)
            {
              id v86 = objc_alloc_init(MEMORY[0x1E4F45760]);
              v161 = v84;
              char v87 = [v86 setRevision:3737841672 error:&v161];
              v88 = v161;

              if ((v87 & 1) == 0)
              {
                v127 = v86;
                if ((int)MediaAnalysisLogLevel() < 3)
                {
                  CVReturn v11 = -18;
LABEL_146:

                  v143 = v88;
LABEL_147:

                  uint64_t v26 = v143;
                  v69 = v145;
                  goto LABEL_148;
                }
                v128 = VCPLogInstance();
                if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                {
                  v129 = [v88 description];
                  *(_DWORD *)buf = 138412290;
                  v172 = v129;
                  _os_log_impl(&dword_1BBEDA000, v128, OS_LOG_TYPE_ERROR, "Failed to configure torso printing (%@)", buf, 0xCu);

                  CVReturn v11 = -18;
LABEL_145:

                  v127 = v86;
                  goto LABEL_146;
                }
LABEL_115:
                CVReturn v11 = -18;
                goto LABEL_145;
              }
              v177 = v142;
              v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v177 count:1];
              [v86 setInputDetectedObjectObservations:v89];

              [v141 addObject:v86];
            }
            else
            {
              id v86 = 0;
              v88 = v84;
            }
            v90 = VCPSignPostLog();
            os_signpost_id_t v91 = os_signpost_id_generate(v90);

            v92 = VCPSignPostLog();
            v93 = v92;
            if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
            {
              v94 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
              *(_DWORD *)buf = 138412290;
              v172 = v94;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v93, OS_SIGNPOST_INTERVAL_BEGIN, v91, "VNCreateFaceprintRequest", "%@", buf, 0xCu);
            }
            v160 = v88;
            char v95 = [v148 performRequests:v141 error:&v160];
            v96 = v160;

            if (v95)
            {
              v97 = VCPSignPostLog();
              v98 = v97;
              if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
              {
                v99 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
                *(_DWORD *)buf = 138412290;
                v172 = v99;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v98, OS_SIGNPOST_INTERVAL_END, v91, "VNCreateFaceprintRequest", "%@", buf, 0xCu);
              }
              v100 = [v145 results];
              BOOL v101 = [v100 count] == 0;

              if (!v101)
              {
                v102 = [v145 results];
                v103 = [v102 firstObject];
                uint64_t v144 = [v103 faceprint];

                v104 = [v86 results];
                v105 = [v104 firstObject];
                v140 = [v105 torsoprint];

                v139 = (void *)[objc_alloc(MEMORY[0x1E4F45800]) initWithFaceprint:v144 torsoprint:v140];
                v138 = objc_alloc_init(MEMORY[0x1E4F457F8]);
                [v138 setFaceTorsoprint:v139];
                [v138 setFaceprint:v144];
                objc_storeStrong(a6, v138);
                if (*a6)
                {
                  if ((int)MediaAnalysisLogLevel() >= 6)
                  {
                    v106 = VCPLogInstance();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
                    {
                      v137 = [v138 faceTorsoprint];
                      if ([v137 isValidFaceprint]) {
                        v107 = &stru_1F15A0D70;
                      }
                      else {
                        v107 = @"in";
                      }
                      v108 = [v138 faceTorsoprint];
                      if ([v108 isValidTorsoprint]) {
                        v109 = &stru_1F15A0D70;
                      }
                      else {
                        v109 = @"in";
                      }
                      *(_DWORD *)buf = 138412802;
                      v172 = v138;
                      __int16 v173 = 2112;
                      v174 = v107;
                      __int16 v175 = 2112;
                      v176 = v109;
                      _os_log_impl(&dword_1BBEDA000, v106, OS_LOG_TYPE_INFO, "Generated face-torso representation %@ (faceprint: %@valid - torsoprint: %@valid)", buf, 0x20u);
                    }
                  }
                  *a7 = +[VCPFaceUtils mad_PHValueFromVNAgeCategoryLabel:v150];
                  v110 = [(MADPersonalizedEmbeddingTask *)self gallery];
                  if (v110)
                  {
                    v111 = objc_alloc_init(MEMORY[0x1E4F5D0D0]);
                    v112 = VCPSignPostLog();
                    os_signpost_id_t v113 = os_signpost_id_generate(v112);

                    v114 = VCPSignPostLog();
                    v115 = v114;
                    if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v114))
                    {
                      v116 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
                      *(_DWORD *)buf = 138412290;
                      v172 = v116;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v115, OS_SIGNPOST_INTERVAL_BEGIN, v113, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);
                    }
                    id v117 = *a6;
                    v159 = v96;
                    v118 = -[NSObject tokenEmbeddingsForObservation:type:error:](v110, "tokenEmbeddingsForObservation:type:error:", v117, [v158 tokenEmbeddingType], &v159);
                    v119 = v159;

                    [v111 setEmbedding:v118];
                    v120 = VCPSignPostLog();
                    v121 = v120;
                    if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
                    {
                      v122 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
                      *(_DWORD *)buf = 138412290;
                      v172 = v122;
                      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v121, OS_SIGNPOST_INTERVAL_END, v113, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);
                    }
                    v123 = [v111 embedding];
                    BOOL v124 = v123 == 0;

                    if (v124)
                    {
                      if ((int)MediaAnalysisLogLevel() < 3)
                      {
                        CVReturn v11 = -18;
                        goto LABEL_141;
                      }
                      v126 = VCPLogInstance();
                      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                      {
                        v135 = [v119 description];
                        *(_DWORD *)buf = 138412290;
                        v172 = v135;
                        _os_log_impl(&dword_1BBEDA000, v126, OS_LOG_TYPE_ERROR, "Failed to resolve entity (%@)", buf, 0xCu);
                      }
                      CVReturn v11 = -18;
                    }
                    else
                    {
                      v125 = v111;
                      CVReturn v11 = 0;
                      v126 = *v153;
                      id *v153 = v125;
                    }

LABEL_141:
                    v96 = v119;
LABEL_142:

                    goto LABEL_143;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    v111 = VCPLogInstance();
                    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1BBEDA000, v111, OS_LOG_TYPE_ERROR, "Failed to create VUWGallery", buf, 2u);
                    }
                    CVReturn v11 = -18;
                    goto LABEL_142;
                  }
                }
                else
                {
                  v130 = v138;
                  if ((int)MediaAnalysisLogLevel() < 3)
                  {
                    CVReturn v11 = -18;
LABEL_144:

                    v88 = v96;
                    v128 = v144;
                    goto LABEL_145;
                  }
                  v110 = VCPLogInstance();
                  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                  {
                    v156 = [v138 faceTorsoprint];
                    if ([v156 isValidFaceprint]) {
                      v131 = &stru_1F15A0D70;
                    }
                    else {
                      v131 = @"in";
                    }
                    v132 = [v138 faceTorsoprint];
                    int v133 = [v132 isValidTorsoprint];
                    v134 = @"in";
                    if (v133) {
                      v134 = &stru_1F15A0D70;
                    }
                    *(_DWORD *)buf = 138412802;
                    v172 = v138;
                    __int16 v173 = 2112;
                    v174 = v131;
                    __int16 v175 = 2112;
                    v176 = v134;
                    _os_log_impl(&dword_1BBEDA000, v110, OS_LOG_TYPE_ERROR, "Failed to generate valid face-torso representation %@ (faceprint: %@valid - torsoprint: %@valid)", buf, 0x20u);
                  }
                }
                CVReturn v11 = -18;
LABEL_143:

                v130 = v138;
                goto LABEL_144;
              }
              v127 = v86;
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v128 = VCPLogInstance();
                if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v128, OS_LOG_TYPE_ERROR, "Face printing produced no observations", buf, 2u);
                }
                goto LABEL_120;
              }
              goto LABEL_121;
            }
            v127 = v86;
            if ((int)MediaAnalysisLogLevel() < 3)
            {
LABEL_121:
              CVReturn v11 = -18;
              v88 = v96;
              goto LABEL_146;
            }
            v128 = VCPLogInstance();
            if (!os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
            {
LABEL_120:
              CVReturn v11 = -18;
              v88 = v96;
              goto LABEL_145;
            }
            *(_DWORD *)buf = 138412290;
            v88 = v96;
            v172 = v96;
            _os_log_impl(&dword_1BBEDA000, v128, OS_LOG_TYPE_ERROR, "Failed to perform face-torso printing - %@", buf, 0xCu);
            goto LABEL_115;
          }
          uint64_t v26 = v143;
          v69 = v145;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v72 = [v143 description];
              *(_DWORD *)buf = 138412290;
              v172 = v72;
              _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, "Failed to configure face printing (%@)", buf, 0xCu);
            }
            CVReturn v11 = -18;
            goto LABEL_147;
          }
        }
        else
        {
          v68 = (void *)v147;
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            CVReturn v11 = -18;
LABEL_149:

            v18 = v26;
            v66 = v146;
            goto LABEL_150;
          }
          v69 = VCPLogInstance();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v69, OS_LOG_TYPE_ERROR, "Failed to perform face detection", buf, 2u);
          }
        }
        CVReturn v11 = -18;
LABEL_148:

        v68 = (void *)v147;
        goto LABEL_149;
      }
      v62 = v151;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v64 = VCPLogInstance();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v65 = [v16 description];
          *(_DWORD *)buf = 138412290;
          v172 = v65;
          _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_ERROR, "Failed to configure face attributes (%@)", buf, 0xCu);
        }
        CVReturn v11 = -18;
        goto LABEL_152;
      }
      CVReturn v11 = -18;
      id v12 = v16;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        CVReturn v11 = -18;
LABEL_154:

LABEL_155:
        goto LABEL_156;
      }
      v62 = VCPLogInstance();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v63 = [v12 description];
        *(_DWORD *)buf = 138412290;
        v172 = v63;
        _os_log_impl(&dword_1BBEDA000, v62, OS_LOG_TYPE_ERROR, "Failed to configure face detection (%@)", buf, 0xCu);
      }
      CVReturn v11 = -18;
    }
LABEL_153:

    id v13 = v157;
    goto LABEL_154;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Failed to create pixel buffer", buf, 2u);
    }
    goto LABEL_155;
  }
LABEL_156:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);

  return v11;
}

- (int)processFaceprintSegment:(id)a3 resource:(id)a4 textEncoderInput:(id *)a5 faceObservation:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v35 = a4;
  CVReturn v11 = (void *)MEMORY[0x1E4F457F8];
  id v12 = [v10 faceprint];
  id v13 = objc_msgSend(v11, "faceObservationWithRequestRevision:boundingBox:faceprint:", 3737841670, v12, 0.0, 0.0, 1.0, 1.0);
  id v14 = *a6;
  *a6 = v13;

  char v15 = [(MADPersonalizedEmbeddingTask *)self gallery];
  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F5D0D0]);
    char v17 = VCPSignPostLog();
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    id v19 = VCPSignPostLog();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      os_signpost_id_t v21 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      __int16 v38 = v21;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);
    }
    id v22 = *a6;
    id v36 = 0;
    v23 = objc_msgSend(v15, "tokenEmbeddingsForObservation:type:error:", v22, objc_msgSend(v35, "tokenEmbeddingType"), &v36);
    id v24 = v36;
    [v16 setEmbedding:v23];

    char v25 = VCPSignPostLog();
    uint64_t v26 = v25;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      int v27 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      __int16 v38 = v27;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, v18, "VUWGallery_tokenEmbeddingsForObservation", "%@", buf, 0xCu);
    }
    v28 = [v16 embedding];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v31 = -18;
        goto LABEL_19;
      }
      uint64_t v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = [v24 description];
        *(_DWORD *)buf = 138412290;
        __int16 v38 = v33;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Failed to resolve entity (%@)", buf, 0xCu);
      }
      int v31 = -18;
    }
    else
    {
      v30 = v16;
      int v31 = 0;
      uint64_t v32 = *a5;
      *a5 = v30;
    }

LABEL_19:
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() < 3)
  {
    int v31 = -18;
    goto LABEL_21;
  }
  id v16 = VCPLogInstance();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Failed to create VUWGallery", buf, 2u);
  }
  int v31 = -18;
LABEL_20:

LABEL_21:
  return v31;
}

- (int)processSegments:(id)a3 resource:(id)a4 keyEntitySegment:(id *)a5 keyImageSegment:(id *)a6 faceObservation:(id *)a7 personalizationIndex:(unint64_t *)a8 textEncoderInputs:(id)a9
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v76 = a4;
  id v82 = a9;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
  location = a5;
  if (v12)
  {
    uint64_t v13 = *(void *)v90;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v90 != v13) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v89 + 1) + 8 * i) type] == 4)
        {
          char v68 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  char v68 = 0;
LABEL_11:

  int64_t v77 = [(MADPersonalizedEmbeddingTask *)self revision];
  *a8 = 0x7FFFFFFFFFFFFFFFLL;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v80 = obj;
  uint64_t v15 = [v80 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (!v15)
  {

    v74 = 0;
    v75 = 0;
    v73 = 0;
    v79 = 0;
LABEL_154:
    v59 = location;
    LODWORD(v17) = -1;
    if (*a8 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_155;
    }
    goto LABEL_159;
  }
  v79 = 0;
  v73 = 0;
  v75 = 0;
  v74 = 0;
  uint64_t v83 = *(void *)v86;
  *(void *)&long long v16 = 67109120;
  long long v66 = v16;
  unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v86 != v83) {
        objc_enumerationMutation(v80);
      }
      id v19 = *(void **)(*((void *)&v85 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x1C186D320]();
      if ([v19 type] == 1)
      {
        os_signpost_id_t v21 = v19;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = [v21 text];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v23;
            _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "Processing text input (%@)", buf, 0xCu);
          }
        }
        id v24 = objc_alloc_init(MEMORY[0x1E4F5D0B8]);
        char v25 = [v21 text];
        [v24 setString:v25];

        [v82 addObject:v24];
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v76 supportsAgeTypePromptAdjustment])
          {
            uint64_t v26 = [v21 text];
            uint64_t v27 = [v26 rangeOfString:@"(^.* |^)person( |$)" options:1025];
            uint64_t v29 = v28;

            unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
            if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v30 = [v82 count];
              int v31 = [v21 text];
              uint64_t v32 = [v31 substringToIndex:v29];

              v74 = (void *)v32;
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v33 = VCPLogInstance();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v32;
                  _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEBUG, "Splitted string firstHalf (%@)", buf, 0xCu);
                }
              }
              int v34 = [v21 text];
              uint64_t v35 = [v34 substringFromIndex:v27 + v29];

              unint64_t v17 = v30 - 1;
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                id v36 = VCPLogInstance();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v35;
                  _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEBUG, "Splitted string secondHalf (%@)", buf, 0xCu);
                }
              }
              v75 = (void *)v35;
            }
          }
          else
          {
            unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }

LABEL_54:
        int v39 = 1;
        goto LABEL_131;
      }
      if ([v19 type] == 2)
      {
        if (v79)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_signpost_id_t v21 = VCPLogInstance();
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_130;
            }
LABEL_37:
            *(_WORD *)buf = 0;
            id v37 = v21;
            __int16 v38 = "Faceprints not supported with other personalizations";
LABEL_128:
            uint32_t v44 = 2;
LABEL_129:
            _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, v38, buf, v44);
            goto LABEL_130;
          }
          goto LABEL_144;
        }
        os_signpost_id_t v21 = v19;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            v41 = [v21 entityUUID];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v41;
            _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_DEBUG, "Processing entity input (%@)", buf, 0xCu);
          }
        }
        if (*location)
        {
          if ((unint64_t)(v77 - 5) < 4 || v77 == 3)
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_66;
            }
            v42 = VCPLogInstance();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "Multiple entity UUIDs not supported", buf, 2u);
            }
LABEL_65:

            goto LABEL_66;
          }
        }
        else
        {
          objc_storeStrong(location, v19);
        }
        if (v68)
        {
          if (![v82 count])
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_66;
            }
            v42 = VCPLogInstance();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "Entity should not be the first segment", buf, 2u);
            }
            goto LABEL_65;
          }
        }
        else
        {
          __int16 v84 = 0;
          *(void *)buf = 0;
          int v45 = -[MADPersonalizedEmbeddingTask processEntitySegment:tokenEmbeddingType:textEncoderInput:ageType:](self, "processEntitySegment:tokenEmbeddingType:textEncoderInput:ageType:", v21, [v76 tokenEmbeddingType], buf, &v84);
          if (v45) {
            goto LABEL_104;
          }
          [v82 addObject:*(void *)buf];
        }
        if (*a8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v79 = 0;
          *a8 = [v82 count] - 1;
          goto LABEL_54;
        }
        goto LABEL_142;
      }
      if ([v19 type] == 3)
      {
        if ((unint64_t)(v77 - 5) >= 4 && v77 != 3)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_signpost_id_t v21 = VCPLogInstance();
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_130;
            }
            *(_WORD *)buf = 0;
            id v37 = v21;
            __int16 v38 = "Configuration does not support image inputs";
            goto LABEL_128;
          }
          goto LABEL_144;
        }
        if (*a6)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_signpost_id_t v21 = VCPLogInstance();
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_130;
            }
            *(_WORD *)buf = 0;
            id v37 = v21;
            __int16 v38 = "Multiple images not supported";
            goto LABEL_128;
          }
          goto LABEL_144;
        }
        if (!v79)
        {
          os_signpost_id_t v21 = v19;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v46 = VCPLogInstance();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_DEBUG, "Processing image input", buf, 2u);
            }
          }
          objc_storeStrong(a6, v19);
          v47 = [(MADMultiModalProcessingSubtask *)self request];
          char v48 = [v47 bypassFaceDetection];

          if ((v48 & 1) == 0)
          {
            __int16 v84 = 0;
            *(void *)buf = 0;
            int v45 = [(MADPersonalizedEmbeddingTask *)self processImageSegment:v21 resource:v76 textEncoderInput:buf faceObservation:a7 ageType:&v84];
            if (v45)
            {
LABEL_104:

              v79 = 0;
              int v39 = 0;
LABEL_105:
              int v78 = v45;
              goto LABEL_131;
            }
            if (*(void *)buf)
            {
              objc_msgSend(v82, "addObject:");
              if (*a8 == 0x7FFFFFFFFFFFFFFFLL) {
                *a8 = [v82 count] - 1;
              }
            }
          }
LABEL_142:
          v79 = 0;
          goto LABEL_54;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_signpost_id_t v21 = VCPLogInstance();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_130;
          }
          goto LABEL_37;
        }
      }
      else if ([v19 type] == 4)
      {
        if ((unint64_t)(v77 - 5) < 4 || v77 == 3)
        {
          if (v73)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              os_signpost_id_t v21 = VCPLogInstance();
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                goto LABEL_130;
              }
              *(_WORD *)buf = 0;
              id v37 = v21;
              __int16 v38 = "Multiple person descriptions not supported";
              goto LABEL_128;
            }
          }
          else
          {
            if (!v79)
            {
              id v53 = v19;
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                double v54 = VCPLogInstance();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                {
                  v55 = [v53 text];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v55;
                  _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEBUG, "Processing description input (%@)", buf, 0xCu);
                }
              }
              os_signpost_id_t v21 = v53;
              id v56 = objc_alloc_init(MEMORY[0x1E4F5D0B8]);
              v57 = [v21 text];
              [v56 setString:v57];

              [v82 addObject:v56];
              v79 = 0;
              int v39 = 1;
              v73 = v21;
              goto LABEL_131;
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              os_signpost_id_t v21 = VCPLogInstance();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Faceprints not supported with other personalizations", buf, 2u);
              }
              v73 = 0;
LABEL_130:
              int v39 = 0;
              int v78 = -50;
LABEL_131:

              goto LABEL_132;
            }
            v73 = 0;
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_signpost_id_t v21 = VCPLogInstance();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_130;
          }
          *(_WORD *)buf = 0;
          id v37 = v21;
          __int16 v38 = "Configuration does not support person description inputs";
          goto LABEL_128;
        }
      }
      else
      {
        if ([v19 type] != 5)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_signpost_id_t v21 = VCPLogInstance();
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_130;
            }
            int v43 = [v19 type];
            *(_DWORD *)buf = v66;
            *(_DWORD *)&uint8_t buf[4] = v43;
            id v37 = v21;
            __int16 v38 = "Unsupported input type (%d)";
            uint32_t v44 = 8;
            goto LABEL_129;
          }
          goto LABEL_144;
        }
        if ((unint64_t)(v77 - 5) >= 4 && v77 != 3)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_signpost_id_t v21 = VCPLogInstance();
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_130;
            }
            *(_WORD *)buf = 0;
            id v37 = v21;
            __int16 v38 = "Configuration does not support faceprint inputs";
            goto LABEL_128;
          }
          goto LABEL_144;
        }
        if (!v79)
        {
          if (*a8 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v49 = v19;
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              double v50 = VCPLogInstance();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                double v51 = [v49 faceprint];
                double v52 = [v51 originatingRequestSpecifier];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v52;
                _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_DEBUG, "Processing faceprint input (%@)", buf, 0xCu);
              }
            }
            os_signpost_id_t v21 = v49;
            *(void *)buf = 0;
            int v45 = [(MADPersonalizedEmbeddingTask *)self processFaceprintSegment:v21 resource:v76 textEncoderInput:buf faceObservation:a7];
            if (!v45)
            {
              [v82 addObject:*(void *)buf];
              *a8 = [v82 count] - 1;

              int v39 = 1;
              v79 = v21;
              goto LABEL_131;
            }

            int v39 = 0;
            v79 = v21;
            goto LABEL_105;
          }
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            v79 = 0;
            goto LABEL_144;
          }
          os_signpost_id_t v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Faceprints not supported with other personalizations", buf, 2u);
          }
LABEL_66:
          v79 = 0;
          goto LABEL_130;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          os_signpost_id_t v21 = VCPLogInstance();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_130;
          }
          *(_WORD *)buf = 0;
          id v37 = v21;
          __int16 v38 = "Multiple faceprints not supported";
          goto LABEL_128;
        }
      }
LABEL_144:
      int v39 = 0;
      int v78 = -50;
LABEL_132:
      if (!v39)
      {
        v62 = v80;
        goto LABEL_151;
      }
      ++v18;
    }
    while (v15 != v18);
    uint64_t v58 = [v80 countByEnumeratingWithState:&v85 objects:v94 count:16];
    uint64_t v15 = v58;
  }
  while (v58);

  if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_154;
  }
  v59 = location;
  if (*a8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v82 removeObjectAtIndex:v17];
    v60 = objc_alloc_init(MEMORY[0x1E4F5D0B8]);
    [v60 setString:v74];
    [v82 insertObject:v60 atIndex:v17];
    *a8 = v17;
    id v61 = objc_alloc_init(MEMORY[0x1E4F5D0B8]);
    [v61 setString:v75];
    [v82 insertObject:v61 atIndex:v17 + 1];

    goto LABEL_158;
  }
LABEL_155:
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v60 = VCPLogInstance();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      unint64_t v64 = *a8;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v17;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v64;
      _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_ERROR, "Invalid personalization due to unpaired text input with entity/image input (personStringIndex %d, personalizationIndex %d)", buf, 0xEu);
    }
LABEL_158:

    v59 = location;
  }
LABEL_159:
  if (!*v59 || !*a7)
  {
    if (v73)
    {
      if (*a7)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_177;
        }
        v62 = VCPLogInstance();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          goto LABEL_170;
        }
        *(_WORD *)buf = 0;
        v65 = "Description and face image input not supported";
LABEL_169:
        _os_log_impl(&dword_1BBEDA000, v62, OS_LOG_TYPE_ERROR, v65, buf, 2u);
        goto LABEL_170;
      }
      if (!*v59)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_177;
        }
        v62 = VCPLogInstance();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          goto LABEL_170;
        }
        *(_WORD *)buf = 0;
        v65 = "Description requires entity input";
        goto LABEL_169;
      }
    }
    else
    {
      v73 = 0;
    }
    int v78 = 0;
    goto LABEL_152;
  }
  if ((int)MediaAnalysisLogLevel() < 3)
  {
LABEL_177:
    int v78 = -50;
    goto LABEL_152;
  }
  v62 = VCPLogInstance();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v65 = "Entity and face image input not supported";
    goto LABEL_169;
  }
LABEL_170:
  int v78 = -50;
LABEL_151:

LABEL_152:
  return v78;
}

- (unint64_t)imageEmbeddingVersion
{
  v2 = [(MADMultiModalProcessingSubtask *)self request];
  uint64_t v3 = [v2 revision];

  if ((unint64_t)(v3 - 3) >= 6) {
    return 0;
  }
  else {
    return qword_1BC283898[v3 - 3];
  }
}

- (int)processPixelBuffer:(__CVBuffer *)a3 imageEmbedding:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(MADPersonalizedEmbeddingTask *)self imageEmbeddingVersion];
  if (v7)
  {
    unint64_t v8 = v7;
    id v9 = +[VCPMADImageEmbeddingResource sharedResourceForRevision:v7];
    id v10 = +[VCPMADResourceManager sharedManager];
    int v34 = [v10 activateResource:v9];

    id v11 = [v9 imageBackbone];

    if (!v11)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v18 = -18;
LABEL_37:

LABEL_38:
        return v18;
      }
      id v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to load image encoder", buf, 2u);
      }
      int v18 = -18;
      goto LABEL_36;
    }
    uint64_t v12 = VCPSignPostLog();
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    id v14 = VCPSignPostLog();
    uint64_t v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      long long v16 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      __int16 v38 = v16;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);
    }
    unint64_t v17 = [v9 imageBackbone];
    id v35 = 0;
    int v18 = [v17 analyzePixelBuffer:a3 flags:0 results:&v35 cancel:&__block_literal_global_71];
    id v19 = v35;

    if (v18)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "Image encoding failed", buf, 2u);
        }
        goto LABEL_35;
      }
LABEL_36:

      goto LABEL_37;
    }
    os_signpost_id_t v21 = VCPSignPostLog();
    id v22 = v21;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v23 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      __int16 v38 = v23;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v13, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);
    }
    v20 = [v19 objectForKeyedSubscript:@"ImageEmbeddingResults"];
    if ([v20 count])
    {
      id v24 = [v20 objectAtIndexedSubscript:0];
      char v25 = [v24 objectForKeyedSubscript:@"attributes"];
      uint64_t v26 = [v25 objectForKeyedSubscript:@"embeddings"];

      if (v26)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F745B8]);
        v36[0] = &unk_1F15ED9E0;
        uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", (unint64_t)-[NSObject length](v26, "length") >> 1);
        v36[1] = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
        uint64_t v30 = (void *)[v27 initWithVersion:v8 data:v26 type:1 shape:v29];
        id v31 = *a4;
        *a4 = v30;

        [v34 reset];
        int v18 = 0;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Image encoding produced no embedding", buf, 2u);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v18 = -18;
        goto LABEL_35;
      }
      uint64_t v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "Image encoding produced no embedding", buf, 2u);
      }
    }
    int v18 = -18;
    goto LABEL_34;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "Image encoding not supported in current configiuration", buf, 2u);
    }
    int v18 = -18;
    goto LABEL_38;
  }
  return -18;
}

uint64_t __66__MADPersonalizedEmbeddingTask_processPixelBuffer_imageEmbedding___block_invoke()
{
  return 0;
}

- (int)processSystemSearchOutput:(id)a3 resource:(id)a4 embeddingResult:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(MADPersonalizedEmbeddingTask *)self revision];
  id v11 = objc_opt_class();
  uint64_t v12 = [v8 CSUTextEmbedding];
  os_signpost_id_t v13 = objc_msgSend(v11, "embeddingFromMultiArray:normalize:version:", v12, v10 == 1, objc_msgSend(v9, "version"));
  id v14 = *a5;
  *a5 = v13;

  if (*a5)
  {
    int v15 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v18 = 0;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Failed to create output text embedding", v18, 2u);
      }
    }
    int v15 = -18;
  }

  return v15;
}

- (int)processGenerativePlaygroundsOutput:(id)a3 resource:(id)a4 entitySegment:(id)a5 imageSegment:(id)a6 faceObservation:(id)a7 personalizationIndex:(unint64_t)a8 embeddingResult:(id *)a9 hiddenLayerResult:(id *)a10 pooledEmbeddingResult:(id *)a11
{
  v115[4] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v105 = a4;
  id v106 = a5;
  id v18 = a6;
  id v107 = a7;
  id v19 = [v17 additionalLayers];
  v20 = [v19 objectForKeyedSubscript:@"spatial_embed"];

  if (v20)
  {
    os_signpost_id_t v21 = [v17 additionalLayers];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"hidden_embed"];

    v104 = (void *)v22;
    if (!v22)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Text encoder did not produce pooled embedding", buf, 2u);
        }
      }
      CVReturn v24 = -18;
      goto LABEL_92;
    }
    CFTypeRef cf = 0;
    if (v18)
    {
      v23 = [v18 surface];
      CVReturn v24 = CVPixelBufferCreateWithIOSurface(0, v23, 0, (CVPixelBufferRef *)&cf);

      if (v24)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          char v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            uint64_t v26 = "Failed to create pixel buffer";
LABEL_22:
            _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
            goto LABEL_90;
          }
          goto LABEL_90;
        }
        goto LABEL_91;
      }
      CVReturn v24 = [(MADPersonalizedEmbeddingTask *)self processPixelBuffer:cf imageEmbedding:a9];
      if (v24)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          char v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            uint64_t v26 = "Failed to create image embedding";
            goto LABEL_22;
          }
LABEL_90:
        }
LABEL_91:
        CF<opaqueCMSampleBuffer *>::~CF(&cf);
LABEL_92:

LABEL_93:
        goto LABEL_94;
      }
    }
    v103 = [(MADMultiModalProcessingSubtask *)self request];
    [v103 targetBounds];
    if (CGRectIsEmpty(v116))
    {
      BOOL v101 = &unk_1F15EE688;
    }
    else
    {
      uint64_t v28 = NSNumber;
      [v103 targetBounds];
      uint64_t v29 = objc_msgSend(v28, "numberWithDouble:");
      v115[0] = v29;
      uint64_t v30 = NSNumber;
      [v103 targetBounds];
      uint64_t v32 = [v30 numberWithDouble:v31];
      v115[1] = v32;
      v33 = NSNumber;
      [v103 targetBounds];
      double v35 = v34;
      [v103 targetBounds];
      id v37 = [v33 numberWithDouble:v35 + v36];
      v115[2] = v37;
      __int16 v38 = NSNumber;
      [v103 targetBounds];
      double v40 = v39;
      [v103 targetBounds];
      v42 = [v38 numberWithDouble:v40 + v41];
      v115[3] = v42;
      BOOL v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:4];
    }
    v102 = [v103 personalizationOptions];
    if (!v102)
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4FB4240]);
      id v44 = v43;
      if (v101)
      {
        objc_msgSend(v43, "setBoundingBox:");
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          int v45 = VCPLogInstance();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v101;
            _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_INFO, "Personalization bounds: %@", buf, 0xCu);
          }
        }
      }
      v102 = v44;
    }
    if (v107)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v46 = VCPLogInstance();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v47 = [v107 faceTorsoprint];
          *(_DWORD *)buf = 138412290;
          v114 = v47;
          _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_INFO, "Providing personalization with face-torso print - %@", buf, 0xCu);
        }
      }
      char v48 = [v17 tokenSegments];
      id v49 = [v48 objectAtIndexedSubscript:a8];
      uint64_t v50 = [v49 rangeValue];
      uint64_t v52 = v51;

      id v53 = VCPSignPostLog();
      os_signpost_id_t spid = os_signpost_id_generate(v53);

      double v54 = VCPSignPostLog();
      v55 = v54;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        id v56 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v114 = v56;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v55, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VUWGallery_personalizeEmbeddingLayerImage", "%@", buf, 0xCu);
      }
      v57 = [v18 seed];
      BOOL v58 = v57 == 0;

      if (!v58)
      {
        v59 = [v18 seed];
        [v102 setSeed:v59];

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v60 = VCPLogInstance();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            id v61 = [v18 seed];
            *(_DWORD *)buf = 138412290;
            v114 = v61;
            _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_INFO, "Personalization seed: %@", buf, 0xCu);
          }
        }
      }
      v62 = [(MADPersonalizedEmbeddingTask *)self gallery];
      id v110 = 0;
      v111 = v20;
      char v63 = [v62 personalizeEmbeddingLayer:&v111 index:v52 + v50 - 1 observation:v107 type:3 options:v102 error:&v110];
      v100 = v111;

      unint64_t v64 = v110;
      if ((v63 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          long long v92 = VCPLogInstance();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            v93 = [v64 description];
            *(_DWORD *)buf = 138412290;
            v114 = v93;
            _os_log_impl(&dword_1BBEDA000, v92, OS_LOG_TYPE_ERROR, "Embedding personalization failed - %@", buf, 0xCu);
          }
        }
        goto LABEL_88;
      }
      v65 = VCPSignPostLog();
      long long v66 = v65;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        v67 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v114 = v67;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v66, OS_SIGNPOST_INTERVAL_END, spid, "VUWGallery_personalizeEmbeddingLayerImage", "%@", buf, 0xCu);
      }
    }
    else
    {
      if (!v106) {
        goto LABEL_68;
      }
      char v68 = [v17 tokenSegments];
      v69 = [v68 objectAtIndexedSubscript:a8];
      uint64_t v70 = [v69 rangeValue];
      uint64_t v72 = v71;

      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v73 = VCPLogInstance();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v114) = v70 + v72 - 1;
          _os_log_impl(&dword_1BBEDA000, v73, OS_LOG_TYPE_DEFAULT, "Personalization index: %d", buf, 8u);
        }
      }
      v74 = [v106 seed];
      BOOL v75 = v74 == 0;

      if (!v75)
      {
        id v76 = [v106 seed];
        [v102 setSeed:v76];

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          int64_t v77 = VCPLogInstance();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            int v78 = [v106 seed];
            *(_DWORD *)buf = 138412290;
            v114 = v78;
            _os_log_impl(&dword_1BBEDA000, v77, OS_LOG_TYPE_INFO, "Personalization seed: %@", buf, 0xCu);
          }
        }
      }
      v79 = VCPSignPostLog();
      os_signpost_id_t spida = os_signpost_id_generate(v79);

      v80 = VCPSignPostLog();
      v81 = v80;
      if (spida - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
      {
        id v82 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v114 = v82;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v81, OS_SIGNPOST_INTERVAL_BEGIN, spida, "VUWGallery_personalizeEmbeddingLayerEntity", "%@", buf, 0xCu);
      }
      uint64_t v83 = [(MADPersonalizedEmbeddingTask *)self gallery];
      v109 = v20;
      __int16 v84 = [v106 entityUUID];
      id v108 = 0;
      char v85 = [v83 personalizeEmbeddingLayer:&v109 index:v72 + v70 - 1 tag:v84 client:0 type:3 options:v102 error:&v108];
      v100 = v109;

      unint64_t v64 = v108;
      if ((v85 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          char v95 = VCPLogInstance();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            uint64_t v96 = [v64 description];
            *(_DWORD *)buf = 138412290;
            v114 = v96;
            _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_ERROR, "Embedding personalization failed (%@)", buf, 0xCu);
          }
        }
        goto LABEL_88;
      }
      long long v86 = VCPSignPostLog();
      long long v66 = v86;
      if (spida - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
      {
        long long v87 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
        *(_DWORD *)buf = 138412290;
        v114 = v87;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v66, OS_SIGNPOST_INTERVAL_END, spida, "VUWGallery_personalizeEmbeddingLayerEntity", "%@", buf, 0xCu);
      }
    }

    v20 = v100;
LABEL_68:
    long long v88 = objc_msgSend((id)objc_opt_class(), "embeddingFromMultiArray:normalize:version:", v20, 0, objc_msgSend(v105, "version"));
    id v89 = *a10;
    *a10 = v88;

    if (*a10)
    {
      long long v90 = objc_msgSend((id)objc_opt_class(), "embeddingFromMultiArray:normalize:version:", v104, 0, objc_msgSend(v105, "version"));
      id v91 = *a11;
      *a11 = v90;

      if (*a11)
      {
        CVReturn v24 = 0;
LABEL_89:

        char v25 = v101;
        goto LABEL_90;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        unint64_t v64 = VCPLogInstance();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v94 = "Failed to create pooled embedding";
          goto LABEL_81;
        }
        goto LABEL_82;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unint64_t v64 = VCPLogInstance();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v94 = "Failed to create output hidden layer embedding";
LABEL_81:
        _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_ERROR, v94, buf, 2u);
      }
LABEL_82:
      v100 = v20;
LABEL_88:

      CVReturn v24 = -18;
      v20 = v100;
      goto LABEL_89;
    }
    CVReturn v24 = -18;
    goto LABEL_89;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "Text encoder did not produce hidden layer", buf, 2u);
    }
    CVReturn v24 = -18;
    goto LABEL_93;
  }
  CVReturn v24 = -18;
LABEL_94:

  return v24;
}

- (int)processInput:(id)a3 resource:(id)a4 result:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v44 = 0;
  unint64_t v45 = 0;
  uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v43 = 0;
  int64_t v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [v8 segments];
  int v12 = [(MADPersonalizedEmbeddingTask *)self processSegments:v11 resource:v9 keyEntitySegment:&v45 keyImageSegment:&v44 faceObservation:&v43 personalizationIndex:&v42 textEncoderInputs:v10];

  if (!v12)
  {
    os_signpost_id_t v13 = +[VCPMADResourceManager sharedManager];
    id v37 = [v13 activateResource:v9];

    id v14 = VCPSignPostLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    long long v16 = VCPSignPostLog();
    id v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      id v18 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);
    }
    id v19 = [v9 textEncoder];
    id v41 = 0;
    [v19 runOnInput:v10 error:&v41];
    id v20 = v41;

    os_signpost_id_t v21 = VCPSignPostLog();
    uint64_t v22 = v21;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v23 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v23;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v15, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);
    }
    if (v20)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v12 = -18;
        goto LABEL_30;
      }
      CVReturn v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        char v25 = [v20 description];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "Failed to generate text embedding (%@)", buf, 0xCu);
      }
      int v12 = -18;
    }
    else
    {
      uint64_t v26 = [v9 textEncoder];
      CVReturn v24 = [v26 inferenceOutputs];

      [v37 reset];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = [v24 processedInput];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v28;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "processedInput: %@", buf, 0xCu);
        }
      }
      *(void *)buf = 0;
      id v39 = 0;
      id v40 = 0;
      unint64_t v29 = [(MADPersonalizedEmbeddingTask *)self revision];
      if (v29 <= 9 && ((1 << v29) & 0x216) != 0) {
        int v30 = [(MADPersonalizedEmbeddingTask *)self processSystemSearchOutput:v24 resource:v9 embeddingResult:buf];
      }
      else {
        int v30 = [(MADPersonalizedEmbeddingTask *)self processGenerativePlaygroundsOutput:v24 resource:v9 entitySegment:v45 imageSegment:v44 faceObservation:v43 personalizationIndex:v42 embeddingResult:buf hiddenLayerResult:&v40 pooledEmbeddingResult:&v39];
      }
      int v12 = v30;
      if (!v30)
      {
        BOOL v31 = (v45 | v43) != 0;
        if (!(v45 | v43) && (int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v32 = VCPLogInstance();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int16 v38 = 0;
            _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "No identity source provided; generating non-personalized text embedding",
              v38,
              2u);
          }
        }
        id v33 = objc_alloc(MEMORY[0x1E4F74648]);
        double v34 = (void *)[v33 initWithEmbedding:*(void *)buf hiddenLayer:v40 pooledEmbedding:v39 personalized:v31];
        id v35 = *a5;
        *a5 = v34;

        int v12 = 0;
      }
    }
LABEL_30:
  }
  return v12;
}

- (int)run
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "MADPersonalizedEmbeddingTask running...", buf, 2u);
    }
  }
  uint64_t v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  BOOL v6 = VCPSignPostLog();
  unint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    id v8 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPersonalizedEmbeddingTask_run", "%@", buf, 0xCu);
  }
  int64_t v9 = [(MADPersonalizedEmbeddingTask *)self revision];
  if ((unint64_t)(v9 - 1) <= 2)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Revision is no longer supported (%d)", buf, 8u);
      }
    }
    id v11 = [(MADMultiModalProcessingSubtask *)self request];
    int v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    os_signpost_id_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Revision is no longer supported (%d)", v9);
    v46 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    os_signpost_id_t v15 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v14];
    [v11 setError:v15];

LABEL_39:
    goto LABEL_40;
  }
  id v11 = +[MADTextEncoderResource sharedResource:v9];
  if (!v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "Invalid personalized embedding revision specified (%d)", buf, 8u);
      }
    }
    os_signpost_id_t v13 = [(MADMultiModalProcessingSubtask *)self request];
    BOOL v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Invalid personalized embedding type specified"];
    id v44 = v14;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v33 = [v31 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v32];
    [v13 setError:v33];

    goto LABEL_39;
  }
  os_signpost_id_t v13 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = [(MADMultiModalProcessingSubtask *)self inputs];
  uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        *(void *)buf = 0;
        if ([(MADPersonalizedEmbeddingTask *)self processInput:v19 resource:v11 result:buf])
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            CVReturn v24 = VCPLogInstance();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)id v35 = 0;
              _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "Embedding generation failed", v35, 2u);
            }
          }
          char v25 = [(MADMultiModalProcessingSubtask *)self request];
          uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v40 = *MEMORY[0x1E4F28568];
          id v27 = [NSString stringWithFormat:@"Embedding generation failed"];
          id v41 = v27;
          uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          unint64_t v29 = [v26 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v28];
          [v25 setError:v29];

          goto LABEL_39;
        }
        [v13 addObject:*(void *)buf];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v20 = [(MADMultiModalProcessingSubtask *)self request];
  [v20 setResults:v13];

  os_signpost_id_t v21 = VCPSignPostLog();
  uint64_t v22 = v21;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    v23 = [(MADMultiModalProcessingSubtask *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v23;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v5, "MADPersonalizedEmbeddingTask_run", "%@", buf, 0xCu);
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "MADPersonalizedEmbeddingTask Complete", buf, 2u);
    }
    goto LABEL_39;
  }
LABEL_40:

  return 0;
}

- (void).cxx_destruct
{
}

@end