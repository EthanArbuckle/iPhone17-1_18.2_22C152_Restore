@interface MADImagePersonalizationGatingTask
+ (id)dependencies;
+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5;
- (BOOL)autoCancellable;
- (CGRect)expandNormalizedRect:(CGRect)a3;
- (MADImagePersonalizationGatingTask)initWithRequest:(id)a3 imageAsset:(id)a4 signpostPayload:(id)a5;
- (float)resourceRequirement;
- (int)processPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 faces:(id)a5;
- (int)run;
- (void)cancel;
@end

@implementation MADImagePersonalizationGatingTask

- (MADImagePersonalizationGatingTask)initWithRequest:(id)a3 imageAsset:(id)a4 signpostPayload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADImagePersonalizationGatingTask;
  v12 = [(MADImagePersonalizationGatingTask *)&v15 init];
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
    id v11 = (void *)[objc_alloc((Class)a1) initWithRequest:v8 imageAsset:v9 signpostPayload:v10];
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
  self->_canceled = 1;
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

- (int)processPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 faces:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v41 = +[MADFaceDetectionResource sharedResource];
  uint64_t v9 = +[VCPMADResourceManager sharedManager];
  v40 = [(id)v9 activateResource:v41];

  id v10 = objc_alloc_init(MEMORY[0x1E4F457A8]);
  id v47 = 0;
  LOBYTE(v9) = [v10 setRevision:3737841670 error:&v47];
  id v11 = v47;
  if (v9)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F45890]);
    v13 = [v41 session];
    os_log_t log = (os_log_t)[v12 initWithCVPixelBuffer:a3 orientation:v5 options:MEMORY[0x1E4F1CC08] session:v13];

    id v14 = VCPSignPostLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    v16 = VCPSignPostLog();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v51 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);
    }

    id v49 = v10;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    id v46 = v11;
    char v20 = [log performRequests:v19 error:&v46];
    id v21 = v46;

    if (v20)
    {
      uint64_t v22 = VCPSignPostLog();
      v23 = v22;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        v24 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v51 = v24;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v15, "VNDetectFaceRectanglesRequest", "%@", buf, 0xCu);
      }

      [v40 reset];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v25 = [v10 results];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v42 + 1) + 8 * i) boundingBox];
            -[MADImagePersonalizationGatingTask expandNormalizedRect:](self, "expandNormalizedRect:");
            v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F745D8]), "initWithNormalizedCropRect:", v29, v30, v31, v32);
            [v8 addObject:v33];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v26);
      }

      [v8 sortUsingComparator:&__block_literal_global_93];
      if ((int)MediaAnalysisLogLevel() < 5)
      {
        int v36 = 0;
        goto LABEL_32;
      }
      v34 = VCPLogInstance();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = [v8 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v51) = v35;
        _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEFAULT, "Total Faces: %d", buf, 8u);
      }
      int v36 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v36 = -18;
        goto LABEL_32;
      }
      v34 = VCPLogInstance();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_ERROR, "Failed to perform face detection", buf, 2u);
      }
      int v36 = -18;
    }

LABEL_32:
    id v11 = v21;
LABEL_33:

    goto LABEL_34;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    VCPLogInstance();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v37 = [v11 description];
      *(_DWORD *)buf = 138412290;
      v51 = v37;
      _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "Failed to configure face detection (%@)", buf, 0xCu);
    }
    int v36 = -18;
    goto LABEL_33;
  }
  int v36 = -18;
LABEL_34:

  return v36;
}

uint64_t __74__MADImagePersonalizationGatingTask_processPixelBuffer_orientation_faces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 normalizedCropRect];
  double v7 = v6;
  [v4 normalizedCropRect];
  double v9 = v8;
  [v5 normalizedCropRect];
  double v11 = v10;
  [v5 normalizedCropRect];
  if (v7 * v9 < v11 * v12) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }

  return v13;
}

- (int)run
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    CGRect v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "MADImagePersonalizationGatingTask running...", buf, 2u);
    }
  }
  *(void *)buf = 0;
  unsigned int v20 = 0;
  if ([(VCPMADServiceImageAsset *)self->_imageAsset loadPixelBuffer:buf orientation:&v20])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "MADImagePersonalizationGatingTask image loading failed", v19, 2u);
      }
    }
    request = self->_request;
    double v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    double v7 = [NSString stringWithFormat:@"Image loading failed"];
    v26[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    double v9 = [v6 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v8];
    [(MADImagePersonalizationGatingRequest *)request setError:v9];
  }
  else
  {
    double v7 = [MEMORY[0x1E4F1CA48] array];
    if ([(MADImagePersonalizationGatingTask *)self processPixelBuffer:*(void *)buf orientation:v20 faces:v7])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        double v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v19 = 0;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Face detection failed", v19, 2u);
        }
      }
      double v11 = self->_request;
      double v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      double v8 = [NSString stringWithFormat:@"Face detection failed"];
      v24 = v8;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v14 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v13];
      [(MADImagePersonalizationGatingRequest *)v11 setError:v14];
    }
    else
    {
      v16 = self->_request;
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F745E8]) initWithFaces:v7];
      uint64_t v22 = v17;
      int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [(MADImagePersonalizationGatingRequest *)v16 setResults:v18];

      if ((int)MediaAnalysisLogLevel() < 5) {
        goto LABEL_18;
      }
      double v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "MADImagePersonalizationGatingTask complete", v19, 2u);
      }
    }
  }

LABEL_18:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end