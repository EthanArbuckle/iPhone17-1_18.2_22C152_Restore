@interface VCPColorNormalizationAnalyzer
- (VCPColorNormalizationAnalyzer)init;
- (int)analyzeCGImage:(CGImage *)a3 results:(id *)a4;
@end

@implementation VCPColorNormalizationAnalyzer

- (VCPColorNormalizationAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPColorNormalizationAnalyzer;
  v2 = [(VCPColorNormalizationAnalyzer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[VCPObjectPool objectPoolWithAllocator:&__block_literal_global_36];
    sessionPool = v2->_sessionPool;
    v2->_sessionPool = (VCPObjectPool *)v3;
  }
  return v2;
}

id __37__VCPColorNormalizationAnalyzer_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F45968]);
  return v0;
}

- (int)analyzeCGImage:(CGImage *)a3 results:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  v34 = [(VCPObjectPool *)self->_sessionPool getObject];
  id v6 = objc_alloc(MEMORY[0x1E4F45890]);
  v7 = [v34 object];
  uint64_t v8 = [v6 initWithCGImage:a3 options:MEMORY[0x1E4F1CC08] session:v7];

  v33 = (void *)v8;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F45690]);
    v10 = v9;
    if (v9)
    {
      id v40 = 0;
      char v11 = [v9 setRevision:3737841664 error:&v40];
      id v12 = v40;
      if (v11)
      {
        [v10 setMetalContextPriority:1];
        [v10 setPreferBackgroundProcessing:1];
        v32 = v10;
        if (DeviceHasANE())
        {
          v13 = [MEMORY[0x1E4F458E8] defaultANEDevice];
          [v10 setProcessingDevice:v13];
        }
        v47 = v10;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
        id v39 = v12;
        char v15 = [v33 performRequests:v14 error:&v39];
        id v31 = v39;

        if (v15)
        {
          v16 = [v10 results];
          if ([v16 count])
          {
            v17 = [MEMORY[0x1E4F1CA60] dictionary];
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            v18 = [v16 objectAtIndexedSubscript:0];
            v19 = [v18 adjustmentKeys];

            uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v46 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v36 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                  v24 = -[NSObject objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0, v31);
                  v25 = [v24 adjustmentValuesForKey:v23];
                  [v17 setObject:v25 forKeyedSubscript:v23];
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v46 count:16];
              }
              while (v20);
            }

            v26 = MEMORY[0x1C186C070](v17, 0);
            v44 = @"ColorNormalizationResults";
            v41 = @"colorNormalizationData";
            v42 = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            v43 = v27;
            v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
            v45 = v28;
            *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];

            int v29 = 0;
            goto LABEL_31;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            int v29 = -18;
            id v12 = v31;
            goto LABEL_33;
          }
          v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "VNGeneratePhotosAdjustmentsRequest failed", buf, 2u);
          }
        }
        int v29 = -18;
LABEL_31:
        id v12 = v31;
        goto LABEL_32;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v32 = v10;
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v49 = 3737841664;
          __int16 v50 = 2112;
          id v51 = v12;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Failed to set VNGeneratePhotosAdjustmentsRequest::setRevision %lu: %@", buf, 0x16u);
        }
LABEL_24:
        int v29 = -18;
LABEL_32:

LABEL_33:
        v10 = v32;
        goto LABEL_34;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v32 = 0;
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Failed to create VNGeneratePhotosAdjustmentsRequest", buf, 2u);
        }
        id v12 = 0;
        goto LABEL_24;
      }
      id v12 = 0;
    }
    int v29 = -18;
LABEL_34:

    goto LABEL_35;
  }
  int v29 = -108;
LABEL_35:

  return v29;
}

- (void).cxx_destruct
{
}

@end