@interface VCPImageFaceQualityAnalyzer
- (NSMutableArray)faceQualityScores;
- (int)analyzeDetectedFaces:(__CVBuffer *)a3 faceResults:(id)a4 cancel:(id)a5;
- (void)setFaceQualityScores:(id)a3;
@end

@implementation VCPImageFaceQualityAnalyzer

- (int)analyzeDetectedFaces:(__CVBuffer *)a3 faceResults:(id)a4 cancel:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v39 = a4;
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  faceQualityScores = self->_faceQualityScores;
  v40 = self;
  self->_faceQualityScores = v7;

  v35 = (void *)MEMORY[0x1C186D320]();
  v9 = [MEMORY[0x1E4F1CA48] array];
  v37 = [MEMORY[0x1E4F1CA48] array];
  context = (void *)MEMORY[0x1C186D320]();
  id v10 = objc_alloc(MEMORY[0x1E4F45890]);
  v38 = (void *)[v10 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  if (v38)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F45780]);
    v34 = v11;
    if (!v11)
    {
      int v30 = -18;
LABEL_30:

      goto LABEL_31;
    }
    [v11 setRevision:1];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v12 = v39;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v47 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = [*(id *)(*((void *)&v46 + 1) + 8 * i) observation];
          [v9 addObject:v16];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v13);
    }

    [v34 setInputFaceObservations:v9];
    v53 = v34;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    v32 = uint64_t v45 = 0;
    char v17 = objc_msgSend(v38, "performRequests:error:");
    id v33 = 0;
    if (v17)
    {
      v18 = [v34 results];
      BOOL v19 = v18 == 0;

      if (!v19)
      {
        v20 = [v34 results];
        [v37 addObjectsFromArray:v20];
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v21 = v37;
      v22 = v21;
      uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v42 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = v40->_faceQualityScores;
            v27 = NSNumber;
            v28 = [*(id *)(*((void *)&v41 + 1) + 8 * j) faceCaptureQuality];
            [v28 floatValue];
            v29 = objc_msgSend(v27, "numberWithFloat:");
            [(NSMutableArray *)v26 addObject:v29];
          }
          v21 = v22;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v23);
      }
      int v30 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v30 = -18;
        goto LABEL_29;
      }
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v33;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Failed to analyzeDetectedFaces - %@", buf, 0xCu);
      }
      int v30 = -18;
    }

LABEL_29:
    goto LABEL_30;
  }
  int v30 = -108;
LABEL_31:

  return v30;
}

- (NSMutableArray)faceQualityScores
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFaceQualityScores:(id)a3
{
}

- (void).cxx_destruct
{
}

@end