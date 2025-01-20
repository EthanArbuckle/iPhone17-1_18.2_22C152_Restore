@interface VCPVideoGyroStabilizer
- (VCPVideoGyroStabilizer)initWithMetadata:(id)a3 sourceSize:(CGSize)a4 cropRect:(CGRect)a5 stillImageMetadata:(id)a6 timeRange:(id *)a7;
- (int)convertAnalysisResult;
- (void)storeAnalytics:(CGAffineTransform *)a3 isLivePhoto:(BOOL)a4;
@end

@implementation VCPVideoGyroStabilizer

- (VCPVideoGyroStabilizer)initWithMetadata:(id)a3 sourceSize:(CGSize)a4 cropRect:(CGRect)a5 stillImageMetadata:(id)a6 timeRange:(id *)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v13 = a4.height;
  double v14 = a4.width;
  id v17 = a3;
  id v18 = a6;
  v34.receiver = self;
  v34.super_class = (Class)VCPVideoGyroStabilizer;
  v19 = [(VCPVideoStabilizer *)&v34 init];
  v20 = v19;
  if (v19)
  {
    [(VCPVideoStabilizer *)v19 setGyroStabilization:1];
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    analysisDict = v20->_analysisDict;
    v20->_analysisDict = v21;

    v35.double width = v14;
    v35.double height = v13;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v35);
    [(NSMutableDictionary *)v20->_analysisDict setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F6F390]];

    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    CFDictionaryRef v24 = CGRectCreateDictionaryRepresentation(v36);
    [(NSMutableDictionary *)v20->_analysisDict setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F6F380]];

    v20->_cropSize.double width = width;
    v20->_cropSize.double height = height;
    objc_storeStrong((id *)&v20->_metadata, a3);
    -[VCPVideoStabilizer setIsPathConstraintsStabilization:](v20, "setIsPathConstraintsStabilization:", [v18 count] != 0);
    [(VCPVideoStabilizer *)v20 setStillImageMetadata:v18];
    -[VCPVideoStabilizer setCropRect:](v20, "setCropRect:", x, y, width, height);
    -[VCPVideoStabilizer setSourceSize:](v20, "setSourceSize:", v14, v13);
    long long v25 = *(_OWORD *)&a7->var0.var3;
    v33[0] = *(_OWORD *)&a7->var0.var0;
    v33[1] = v25;
    v33[2] = *(_OWORD *)&a7->var1.var1;
    [(VCPVideoStabilizer *)v20 setTimeRange:v33];
    if ([(VCPVideoStabilizer *)v20 isPathConstraintsStabilization])
    {
      [(VCPVideoStabilizer *)v20 timeRange];
      if ((v32 & 1) == 0
        || ([(VCPVideoStabilizer *)v20 timeRange], (v31 & 1) == 0)
        || ([(VCPVideoStabilizer *)v20 timeRange], v30)
        || ([(VCPVideoStabilizer *)v20 timeRange], v26 = v20, v29 < 0))
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = v20;
    }
    v27 = v26;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (int)convertAnalysisResult
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  int v104 = 0;
  id v87 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analysisDict, "setObject:forKeyedSubscript:");
  [(NSMutableDictionary *)self->_analysisDict setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6F358]];
  [(NSMutableDictionary *)self->_analysisDict setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6F360]];
  CMTime time = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  CFDictionaryRef v79 = CMTimeCopyAsDictionary(&time, 0);
  memset(&v103, 0, sizeof(v103));
  v3 = [(VCPVideoStabilizer *)self stillImageMetadata];
  v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v4 objectForKeyedSubscript:@"attributes"];
  objc_msgSend(v5, "objectForKeyedSubscript:");
  CFDictionaryRef v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v103, v6);

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obj = self->_metadata;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v99 objects:v121 count:16];
  if (v7)
  {
    uint64_t v85 = *(void *)v100;
    do
    {
      uint64_t v81 = v7;
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v100 != v85) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v11 = [v9 objectForKeyedSubscript:@"attributes"];
        CFDictionaryRef v12 = [v11 objectForKeyedSubscript:@"MetaPresentationTimeResults"];

        [(VCPVideoStabilizer *)self timeRange];
        if (time.flags)
        {
          [(VCPVideoStabilizer *)self timeRange];
          if (v97)
          {
            [(VCPVideoStabilizer *)self timeRange];
            if (!v95)
            {
              [(VCPVideoStabilizer *)self timeRange];
              if ((v120 & 0x8000000000000000) == 0)
              {
                if (v12)
                {
                  [(VCPVideoStabilizer *)self timeRange];
                  CMTimeMake(&v91, 2, 600);
                  CMTime lhs = time1;
                  CMTime rhs = v91;
                  CMTimeSubtract(&v93, &lhs, &rhs);
                  CMTimeMakeFromDictionary(&v90, v12);
                  CMTime lhs = v93;
                  CMTime rhs = v90;
                  if (CMTimeCompare(&lhs, &rhs) > 0) {
                    goto LABEL_27;
                  }
                }
              }
            }
          }
        }
        if (![(VCPVideoStabilizer *)self isPathConstraintsStabilization])
        {
          [(VCPVideoStabilizer *)self timeRange];
          if (time.flags)
          {
            [(VCPVideoStabilizer *)self timeRange];
            if (v97)
            {
              [(VCPVideoStabilizer *)self timeRange];
              if (!v95)
              {
                [(VCPVideoStabilizer *)self timeRange];
                if ((v120 & 0x8000000000000000) == 0)
                {
                  if (v12)
                  {
                    [(VCPVideoStabilizer *)self timeRange];
                    CMTimeRangeGetEnd(&rhs, &range);
                    CMTimeMakeFromDictionary(&v93, v12);
                    CMTime time1 = rhs;
                    CMTime lhs = v93;
                    if (CMTimeCompare(&time1, &lhs) < 0)
                    {
                      int v75 = 2;
                      goto LABEL_40;
                    }
LABEL_14:
                    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F6F350]];
                    goto LABEL_16;
                  }
                }
              }
            }
          }
        }
        if (v12) {
          goto LABEL_14;
        }
        [v10 setObject:v79 forKeyedSubscript:*MEMORY[0x1E4F6F350]];
LABEL_16:
        double v13 = [v9 objectForKeyedSubscript:@"attributes"];
        double v14 = [v13 objectForKeyedSubscript:@"MetaHomographyResults"];
        [v10 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F6F348]];

        v15 = [v9 objectForKeyedSubscript:@"attributes"];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"MetaMotionBlurResults"];
        NSPoint v17 = NSPointFromString((NSString *)v16);

        id v18 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F6F348]];
        LOBYTE(v16) = [v18 count] == 9;

        if ((v16 & 1) == 0
          || ([v10 objectForKeyedSubscript:*MEMORY[0x1E4F6F348]],
              (v19 = objc_claimAutoreleasedReturnValue()) == 0)
          || ([v10 objectForKeyedSubscript:*MEMORY[0x1E4F6F350]],
              v20 = objc_claimAutoreleasedReturnValue(),
              BOOL v21 = v20 == 0,
              v20,
              v19,
              v21))
        {
          int v75 = 1;
          goto LABEL_40;
        }
        if ([(VCPVideoStabilizer *)self isPathConstraintsStabilization])
        {
          memset(&v94, 0, sizeof(v94));
          v22 = [v9 objectForKeyedSubscript:@"attributes"];
          CFDictionaryRef v23 = [v22 objectForKeyedSubscript:@"MetaPresentationTimeResults"];
          CMTimeMakeFromDictionary(&v94, v23);

          CMTime time = v94;
          CMTime time2 = v103;
          if (!CMTimeCompare(&time, &time2)) {
            goto LABEL_42;
          }
          CMTime time = v94;
          CMTime time2 = v103;
          if (CMTimeCompare(&time, &time2) >= 1)
          {
            CMTime time = v94;
            CMTime time2 = v103;
            CMTimeSubtract(&v119, &time, &time2);
            CMTimeMake(&time1, 2, 600);
            CMTime time = v119;
            CMTime time2 = time1;
            if (CMTimeCompare(&time, &time2) < 0) {
              goto LABEL_42;
            }
          }
          CMTime time = v94;
          CMTime time2 = v103;
          if (CMTimeCompare(&time, &time2) < 0)
          {
            CMTime time = v103;
            CMTime time2 = v94;
            CMTimeSubtract(&lhs, &time, &time2);
            CMTimeMake(&rhs, 2, 600);
            CMTime time = lhs;
            CMTime time2 = rhs;
            if (CMTimeCompare(&time, &time2) < 0)
            {
LABEL_42:
              uint64_t v29 = [(VCPVideoStabilizer *)self stillImageMetadata];
              uint64_t v30 = [v29 objectAtIndexedSubscript:0];
              char v31 = [v30 objectForKeyedSubscript:@"attributes"];
              char v32 = [v31 objectForKeyedSubscript:@"MetaPresentationTimeResults"];
              [v10 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F6F350]];

              [v87 addObject:v10];
              v33 = [(VCPVideoStabilizer *)self motionBlurVector];
              objc_super v34 = [NSNumber numberWithDouble:v17.x];
              v118[0] = v34;
              CGSize v35 = [NSNumber numberWithDouble:v17.y];
              v118[1] = v35;
              CGRect v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
              [v33 addObject:v36];

              goto LABEL_43;
            }
          }
          CMTime time = v94;
          CMTime time2 = v103;
          if (CMTimeCompare(&time, &time2) >= 1)
          {
            uint64_t v38 = [v87 count];
            if (v38
              && ([(VCPVideoStabilizer *)self motionBlurVector],
                  v39 = objc_claimAutoreleasedReturnValue(),
                  BOOL v40 = v38 == [v39 count],
                  v39,
                  v40))
            {
              uint64_t v41 = v38 - 1;
              v88 = [v87 objectAtIndexedSubscript:v38 - 1];
              v116 = @"privEMBVct";
              v42 = [(VCPVideoStabilizer *)self motionBlurVector];
              v43 = [v42 objectAtIndexedSubscript:v41];
              v117 = v43;
              v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];

              v115[0] = v88;
              v115[1] = v10;
              v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
              uint64_t v44 = *MEMORY[0x1E4F6F360];
              v113[0] = *MEMORY[0x1E4F6F358];
              v113[1] = v44;
              v114[0] = MEMORY[0x1E4F1CC38];
              v114[1] = MEMORY[0x1E4F1CC38];
              v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
              CMTime time = v103;
              CFDictionaryRef v45 = CMTimeCopyAsDictionary(&time, 0);
              CFDictionaryRef v112 = v45;
              v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];

              memset(&time, 0, sizeof(time));
              CFDictionaryRef v46 = [v88 objectForKeyedSubscript:*MEMORY[0x1E4F6F350]];
              CMTimeMakeFromDictionary(&time, v46);

              memset(&time2, 0, sizeof(time2));
              CFDictionaryRef v47 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F6F350]];
              CMTimeMakeFromDictionary(&time2, v47);

              v48 = ICFillHomographyGaps();
              id v49 = 0;
              if ([v48 count])
              {
                v50 = [v48 objectAtIndexedSubscript:0];
                v77 = v48;
                [v87 addObject:v50];

                v51 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F6F350]];
                NSPoint v52 = NSPointFromString(v51);

                v110 = @"privEMBVct";
                v53 = [NSNumber numberWithDouble:v52.x];
                v109[0] = v53;
                v54 = [NSNumber numberWithDouble:v52.y];
                v109[1] = v54;
                v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
                v111 = v55;
                uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];

                v56 = alInterpolateMetadataForGap();
                id v76 = v49;

                if ([v56 count])
                {
                  v57 = [v56 objectAtIndexedSubscript:0];
                  v58 = [v57 objectForKeyedSubscript:@"privEMBVct"];
                  v59 = [v58 objectAtIndexedSubscript:0];
                  [v59 floatValue];
                  float v61 = v60;
                  v62 = [v56 objectAtIndexedSubscript:0];
                  v63 = [v62 objectForKeyedSubscript:@"privEMBVct"];
                  v64 = [v63 objectAtIndexedSubscript:1];
                  [v64 floatValue];
                  float v66 = v65;

                  v67 = [(VCPVideoStabilizer *)self motionBlurVector];
                  v68 = [NSNumber numberWithDouble:v61];
                  v108[0] = v68;
                  v69 = [NSNumber numberWithDouble:v66];
                  v108[1] = v69;
                  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
                  [v67 addObject:v70];

                  int v75 = 2;
                  goto LABEL_66;
                }
                if ((int)MediaAnalysisLogLevel() < 3)
                {
                  int v75 = 1;
                }
                else
                {
                  v67 = VCPLogInstance();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                  {
                    v74 = [v76 description];
                    LODWORD(v119.value) = 138412290;
                    *(CMTimeValue *)((char *)&v119.value + 4) = (CMTimeValue)v74;
                    _os_log_impl(&dword_1BBEDA000, v67, OS_LOG_TYPE_ERROR, "Error interpolating metadata gaps: %@", (uint8_t *)&v119, 0xCu);
                  }
                  int v75 = 1;
LABEL_66:
                }
                id v49 = v76;
                v72 = v78;
LABEL_68:

                v48 = v77;
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v77 = v48;
                  v72 = VCPLogInstance();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  {
                    v73 = [v49 description];
                    LODWORD(v119.value) = 138412290;
                    *(CMTimeValue *)((char *)&v119.value + 4) = (CMTimeValue)v73;
                    _os_log_impl(&dword_1BBEDA000, v72, OS_LOG_TYPE_ERROR, "Error interpolating homography gaps: %@", (uint8_t *)&v119, 0xCu);
                  }
                  int v75 = 1;
                  goto LABEL_68;
                }
                int v75 = 1;
              }

LABEL_40:
              if (v75 == 2) {
                goto LABEL_44;
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v71 = VCPLogInstance();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(time.value) = 0;
                  _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_ERROR, "Inconsistent number of metadata", (uint8_t *)&time, 2u);
                }
              }
            }
            int v28 = -18;
            goto LABEL_47;
          }
        }
        [v87 addObject:v10];
        CFDictionaryRef v24 = [(VCPVideoStabilizer *)self motionBlurVector];
        long long v25 = [NSNumber numberWithDouble:v17.x];
        v107[0] = v25;
        v26 = [NSNumber numberWithDouble:v17.y];
        v107[1] = v26;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
        [v24 addObject:v27];

LABEL_27:
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v99 objects:v121 count:16];
    }
    while (v7);
  }
LABEL_43:

LABEL_44:
  [(VCPVideoStabilizer *)self setAnalysisResultRef:ICSynthesizeAnalysis()];
  if ([(VCPVideoStabilizer *)self analysisResultRef]) {
    int v28 = 0;
  }
  else {
    int v28 = -18;
  }
LABEL_47:

  return v28;
}

- (void)storeAnalytics:(CGAffineTransform *)a3 isLivePhoto:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(VCPVideoStabilizer *)self analysisResultRef])
  {
    CFDictionaryRef v6 = (id *)MEMORY[0x1E4F6F318];
    if (!v4) {
      CFDictionaryRef v6 = (id *)MEMORY[0x1E4F6F320];
    }
    id v7 = *v6;
    [(VCPVideoStabilizer *)self analysisResultRef];
    ICStoreAnalyticsViaDodML();
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "Gyro analytics stored via dodML", v9, 2u);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_analysisDict, 0);
}

@end