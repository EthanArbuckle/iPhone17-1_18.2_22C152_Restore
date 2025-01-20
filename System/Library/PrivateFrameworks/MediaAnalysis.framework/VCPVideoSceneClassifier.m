@interface VCPVideoSceneClassifier
- (BOOL)compareObjectsOfInterest:(id)a3 withScenes:(id)a4;
- (NSArray)qualityResults;
- (NSArray)sceneResults;
- (NSDictionary)frameScenes;
- (VCPVideoSceneClassifier)init;
- (float)adjustedConfidence:(id)a3 confidence:(float)a4;
- (id)filteredKeyFrameResults;
- (id)results;
- (id)sortScenesWithMaxNumCap:(id)a3;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)finishAnalysisPass:(id *)a3;
- (void)addAggregatedScenes:(id)a3 timerange:(id *)a4;
- (void)addResult:(id)a3 start:(id *)a4 duration:(id *)a5 keyIsName:(BOOL)a6;
- (void)findObjectsOfInterest:(id)a3;
- (void)setQualityResults:(id)a3;
- (void)setSceneResults:(id)a3;
@end

@implementation VCPVideoSceneClassifier

- (VCPVideoSceneClassifier)init
{
  v18.receiver = self;
  v18.super_class = (Class)VCPVideoSceneClassifier;
  v2 = [(VCPVideoSceneClassifier *)&v18 init];
  v3 = (VCPVideoSceneClassifier *)v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1FA08];
    *((void *)v2 + 3) = v4;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    existingScenes = v3->_existingScenes;
    v3->_existingScenes = (NSMutableDictionary *)v5;

    int64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)&v3->_start.value = *MEMORY[0x1E4F1F9F8];
    v3->_start.epoch = v7;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    results = v3->_results;
    v3->_results = (NSMutableArray *)v8;

    sceneResults = v3->_sceneResults;
    v3->_sceneResults = 0;

    qualityResults = v3->_qualityResults;
    v3->_qualityResults = 0;

    internalFrameScenes = v3->_internalFrameScenes;
    v3->_internalFrameScenes = 0;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    thresholdBySceneID = v3->_thresholdBySceneID;
    v3->_thresholdBySceneID = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F15EDF98];
    objectsOfInterest = v3->_objectsOfInterest;
    v3->_objectsOfInterest = (NSMutableArray *)v15;
  }
  return v3;
}

- (float)adjustedConfidence:(id)a3 confidence:(float)a4
{
  id v6 = a3;
  if ([(NSMutableDictionary *)self->_thresholdBySceneID count]
    && ([(NSMutableDictionary *)self->_thresholdBySceneID allKeys],
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:v6],
        v7,
        v8))
  {
    v9 = [(NSMutableDictionary *)self->_thresholdBySceneID objectForKeyedSubscript:v6];
    [v9 floatValue];
    a4 = a4 - v10;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
    v9 = objc_msgSend(v11, "nodeForSceneClassId:", objc_msgSend(v6, "unsignedIntValue"));

    if (v9)
    {
      v12 = NSNumber;
      [v9 highPrecisionThreshold];
      double v14 = v13;
      [v9 highRecallThreshold];
      double v16 = v15;
      [v9 searchThreshold];
      if (v16 >= v14) {
        double v18 = v14;
      }
      else {
        double v18 = v16;
      }
      if (v17 >= v18) {
        double v17 = v18;
      }
      v19 = [v12 numberWithDouble:v17];
      [(NSMutableDictionary *)self->_thresholdBySceneID setObject:v19 forKeyedSubscript:v6];

      v20 = [(NSMutableDictionary *)self->_thresholdBySceneID objectForKeyedSubscript:v6];
      [v20 floatValue];
      a4 = a4 - v21;
    }
  }

  return a4;
}

- (BOOL)compareObjectsOfInterest:(id)a3 withScenes:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v8 = self->_objectsOfInterest;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        double v13 = objc_msgSend(v6, "allKeys", (void)v17);
        int v14 = [v13 containsObject:v12];
        double v15 = [v7 allKeys];
        LODWORD(v12) = [v15 containsObject:v12];

        if ((v14 ^ v12))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)addResult:(id)a3 start:(id *)a4 duration:(id *)a5 keyIsName:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [v8 allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          double v15 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
          double v16 = objc_msgSend(v15, "mad_extendedSceneIdFromSceneName:", v14);

          if (v16)
          {
            long long v17 = [v8 objectForKeyedSubscript:v14];
            long long v18 = [v16 stringValue];
            [v9 setObject:v17 forKeyedSubscript:v18];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v11);
    }

    id v8 = v9;
  }
  if ([v8 count])
  {
    results = self->_results;
    v30[0] = @"start";
    CMTime time = (CMTime)*a4;
    CFDictionaryRef v20 = CMTimeCopyAsDictionary(&time, 0);
    v31[0] = v20;
    v30[1] = @"duration";
    CMTime time = (CMTime)*a5;
    CFDictionaryRef v21 = CMTimeCopyAsDictionary(&time, 0);
    v30[2] = @"attributes";
    v31[1] = v21;
    v31[2] = v8;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
    [(NSMutableArray *)results addObject:v22];
  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  internalFrameScenes = self->_internalFrameScenes;
  self->_internalFrameScenes = 0;

  v114 = self;
  p_timeLastProcess = (CMTime *)&self->_timeLastProcess;
  CMTime lhs = *(CMTime *)a4;
  v111 = (CMTime *)a4;
  CMTime rhs = *p_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < 1.0) {
    return 0;
  }
  long long v12 = *(_OWORD *)&a4->var0;
  p_timeLastProcess->int64_t epoch = a4->var3;
  *(_OWORD *)&p_timeLastProcess->value = v12;
  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = v114->_internalFrameScenes;
  v114->_internalFrameScenes = (NSMutableDictionary *)v13;

  id v116 = [MEMORY[0x1E4F1CA48] array];
  v109 = (void *)MEMORY[0x1C186D320]();
  id v15 = objc_alloc(MEMORY[0x1E4F45890]);
  v110 = (void *)[v15 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  if (v110)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F45948]);
    long long v17 = v16;
    v105 = v16;
    if (!v16)
    {
      int v27 = 1;
LABEL_80:

      int v11 = -18;
      goto LABEL_81;
    }
    [v16 setPreferBackgroundProcessing:1];
    id v152 = 0;
    char v18 = [v17 setRevision:3737841665 error:&v152];
    id v106 = v152;
    if (v18)
    {
      long long v19 = objc_alloc_init(MEMORY[0x1E4F456A0]);
      v104 = v19;
      if (v19)
      {
        CFDictionaryRef v20 = v19;
        [v19 setPreferBackgroundProcessing:1];
        id v151 = v106;
        LOBYTE(v20) = [v20 setRevision:2 error:&v151];
        id v21 = v151;

        if (v20)
        {
          os_log_t log = [MEMORY[0x1E4F1CA48] array];
          uint64_t v22 = v110;
          [log addObject:v105];
          [log addObject:v104];
          if (objc_msgSend(MEMORY[0x1E4F45940], "mad_includeEntityNet"))
          {
            v23 = objc_alloc_init(MEMORY[0x1E4F456F0]);
            v24 = v23;
            if (!v23) {
              goto LABEL_65;
            }
            [v23 setPreferBackgroundProcessing:1];
            id v150 = v21;
            char v25 = [v24 setRevision:3737841667 error:&v150];
            id v26 = v150;

            if ((v25 & 1) == 0)
            {
              if ((int)MediaAnalysisLogLevel() < 3)
              {
                int v27 = 1;
                id v21 = v26;
              }
              else
              {
                v55 = VCPLogInstance();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(lhs.value) = 134218242;
                  *(CMTimeValue *)((char *)&lhs.value + 4) = 3737841667;
                  LOWORD(lhs.flags) = 2112;
                  *(void *)((char *)&lhs.flags + 2) = v26;
                  _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_ERROR, "Failed to set VNClassifyImageRequest with revision %lu - %@", (uint8_t *)&lhs, 0x16u);
                }

                int v27 = 1;
                id v21 = v26;
              }
              goto LABEL_75;
            }
            [v24 setMaximumLeafObservations:15];
            [v24 setMaximumHierarchicalObservations:15];
            [log addObject:v24];

            uint64_t v22 = v110;
          }
          else
          {
            id v26 = v21;
          }
          id v149 = v26;
          char v31 = [v22 performRequests:log error:&v149];
          id v106 = v149;

          if (v31)
          {
            long long v147 = 0u;
            long long v148 = 0u;
            long long v145 = 0u;
            long long v146 = 0u;
            v24 = log;
            uint64_t v32 = [v24 countByEnumeratingWithState:&v145 objects:v160 count:16];
            if (v32)
            {
              uint64_t v107 = *(void *)v146;
              while (1)
              {
                uint64_t v33 = 0;
                uint64_t v108 = v32;
                do
                {
                  if (*(void *)v146 != v107) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v113 = v33;
                  v34 = *(void **)(*((void *)&v145 + 1) + 8 * v33);
                  context = (void *)MEMORY[0x1C186D320]();
                  long long v143 = 0u;
                  long long v144 = 0u;
                  long long v141 = 0u;
                  long long v142 = 0u;
                  v35 = [v34 results];
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v141 objects:v159 count:16];
                  if (v36)
                  {
                    uint64_t v37 = *(void *)v142;
                    do
                    {
                      for (uint64_t i = 0; i != v36; ++i)
                      {
                        if (*(void *)v142 != v37) {
                          objc_enumerationMutation(v35);
                        }
                        v39 = *(void **)(*((void *)&v141 + 1) + 8 * i);
                        v40 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
                        v41 = [v39 identifier];
                        v42 = [v40 nodeForName:v41];

                        if (!v42)
                        {
                          if ((int)MediaAnalysisLogLevel() < 7) {
                            goto LABEL_57;
                          }
                          v52 = VCPLogInstance();
                          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                          {
                            v53 = [v39 identifier];
                            LODWORD(lhs.value) = 138412290;
                            *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v53;
                            _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_DEBUG, "[VideoSceneClassifier] Unsupported scene label - %@", (uint8_t *)&lhs, 0xCu);
                          }
LABEL_56:

                          goto LABEL_57;
                        }
                        if (![v42 isIndexed])
                        {
                          if ((int)MediaAnalysisLogLevel() < 7) {
                            goto LABEL_57;
                          }
                          v52 = VCPLogInstance();
                          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                          {
                            v54 = [v39 identifier];
                            LODWORD(lhs.value) = 138412290;
                            *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v54;
                            _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_DEBUG, "[VideoSceneClassifier] Not-indexed scene label - %@", (uint8_t *)&lhs, 0xCu);
                          }
                          goto LABEL_56;
                        }
                        [v42 highPrecisionThreshold];
                        double v44 = v43;
                        [v42 highRecallThreshold];
                        double v46 = v45;
                        [v42 searchThreshold];
                        double v48 = v47;
                        [v39 confidence];
                        if (v46 >= v44) {
                          double v50 = v44;
                        }
                        else {
                          double v50 = v46;
                        }
                        if (v48 < v50) {
                          double v50 = v48;
                        }
                        double v51 = v49;
                        if (v50 < 0.01) {
                          double v50 = 0.01;
                        }
                        if (v50 < v51) {
                          [v116 addObject:v39];
                        }
LABEL_57:
                      }
                      uint64_t v36 = [v35 countByEnumeratingWithState:&v141 objects:v159 count:16];
                    }
                    while (v36);
                  }

                  uint64_t v33 = v113 + 1;
                }
                while (v113 + 1 != v108);
                uint64_t v32 = [v24 countByEnumeratingWithState:&v145 objects:v160 count:16];
                if (!v32)
                {
                  int v27 = 0;
                  id v21 = v106;
                  goto LABEL_75;
                }
              }
            }
            int v27 = 0;
            goto LABEL_73;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v24 = VCPLogInstance();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              int v27 = 1;
LABEL_73:
              id v21 = v106;
              goto LABEL_75;
            }
            LODWORD(lhs.value) = 138412290;
            id v21 = v106;
            *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v106;
            _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[VideoSceneClassifier] Failed to classify scene - %@", (uint8_t *)&lhs, 0xCu);
LABEL_65:
            int v27 = 1;
LABEL_75:

LABEL_76:
            id v106 = v21;
            goto LABEL_77;
          }
LABEL_66:
          int v27 = 1;
LABEL_77:

          goto LABEL_78;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v30 = VCPLogInstance();
          os_log_t log = v30;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            LODWORD(lhs.value) = 134218242;
            *(CMTimeValue *)((char *)&lhs.value + 4) = 2;
            LOWORD(lhs.flags) = 2112;
            *(void *)((char *)&lhs.flags + 2) = v21;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "Failed to set VNClassifySignificantEventRequest::setRevision %lu: %@", (uint8_t *)&lhs, 0x16u);
          }
          int v27 = 1;
          goto LABEL_76;
        }
        int v27 = 1;
        id v106 = v21;
LABEL_78:

        goto LABEL_79;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        VCPLogInstance();
        os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = objc_opt_class();
          LODWORD(lhs.value) = 138412290;
          *(CMTimeValue *)((char *)&lhs.value + 4) = v29;
          _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "Failed to create %@", (uint8_t *)&lhs, 0xCu);
        }
        goto LABEL_66;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v27 = 1;
LABEL_79:

        goto LABEL_80;
      }
      long long v28 = VCPLogInstance();
      v104 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LODWORD(lhs.value) = 134218242;
        *(CMTimeValue *)((char *)&lhs.value + 4) = 3737841665;
        LOWORD(lhs.flags) = 2112;
        *(void *)((char *)&lhs.flags + 2) = v106;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "Failed to set VNSceneClassificationRequest with revision %lu - %@", (uint8_t *)&lhs, 0x16u);
      }
    }
    int v27 = 1;
    goto LABEL_78;
  }
  int v11 = -108;
  int v27 = 1;
LABEL_81:

  if (v27)
  {
    id v56 = v116;
  }
  else
  {
    if ([v116 count])
    {
      if ((unint64_t)[v116 count] < 0x29)
      {
        v58 = v116;
      }
      else
      {
        v140[0] = MEMORY[0x1E4F143A8];
        v140[1] = 3221225472;
        v140[2] = __72__VCPVideoSceneClassifier_analyzeFrame_withTimestamp_andDuration_flags___block_invoke;
        v140[3] = &unk_1E6298140;
        v140[4] = v114;
        [v116 sortUsingComparator:v140];
        v57 = objc_msgSend(v116, "subarrayWithRange:", 0, 40);
        v58 = (void *)[v57 mutableCopy];
      }
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v117 = v58;
      uint64_t v62 = [v117 countByEnumeratingWithState:&v136 objects:v158 count:16];
      if (v62)
      {
        uint64_t v63 = *(void *)v137;
        do
        {
          for (uint64_t j = 0; j != v62; ++j)
          {
            if (*(void *)v137 != v63) {
              objc_enumerationMutation(v117);
            }
            v65 = *(void **)(*((void *)&v136 + 1) + 8 * j);
            v66 = v114->_internalFrameScenes;
            v67 = NSNumber;
            objc_msgSend(v65, "confidence", log);
            v68 = objc_msgSend(v67, "numberWithFloat:");
            v69 = [v65 identifier];
            [(NSMutableDictionary *)v66 setObject:v68 forKey:v69];
          }
          uint64_t v62 = [v117 countByEnumeratingWithState:&v136 objects:v158 count:16];
        }
        while (v62);
      }

      uint64_t v70 = [v117 count];
      p_existingScenes = (id *)&v114->_existingScenes;
      if (v70 == [(NSMutableDictionary *)v114->_existingScenes count])
      {
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        id v72 = v117;
        uint64_t v73 = [v72 countByEnumeratingWithState:&v132 objects:v157 count:16];
        if (v73)
        {
          uint64_t v74 = *(void *)v133;
          while (2)
          {
            for (uint64_t k = 0; k != v73; ++k)
            {
              if (*(void *)v133 != v74) {
                objc_enumerationMutation(v72);
              }
              id v76 = *p_existingScenes;
              v77 = objc_msgSend(*(id *)(*((void *)&v132 + 1) + 8 * k), "identifier", log);
              v78 = [v76 objectForKeyedSubscript:v77];
              LOBYTE(v76) = v78 == 0;

              if (v76)
              {
                int v79 = 0;
                goto LABEL_107;
              }
            }
            uint64_t v73 = [v72 countByEnumeratingWithState:&v132 objects:v157 count:16];
            if (v73) {
              continue;
            }
            break;
          }
        }
        int v79 = 1;
LABEL_107:
      }
      else
      {
        int v79 = 0;
      }
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", log);
      v115 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        long long v130 = 0uLL;
        long long v131 = 0uLL;
        long long v128 = 0uLL;
        long long v129 = 0uLL;
        id v56 = v117;
        uint64_t v80 = [v56 countByEnumeratingWithState:&v128 objects:v156 count:16];
        if (v80)
        {
          uint64_t v81 = *(void *)v129;
          do
          {
            for (uint64_t m = 0; m != v80; ++m)
            {
              if (*(void *)v129 != v81) {
                objc_enumerationMutation(v56);
              }
              v83 = *(void **)(*((void *)&v128 + 1) + 8 * m);
              id v84 = *p_existingScenes;
              v85 = [v83 identifier];
              v86 = [v84 objectForKeyedSubscript:v85];

              if (v86)
              {
                [v86 floatValue];
                float v88 = v87;
                [v83 confidence];
                if (v88 >= *(float *)&v89) {
                  *(float *)&double v89 = v88;
                }
                v90 = [NSNumber numberWithFloat:v89];
                id v91 = *p_existingScenes;
                v92 = [v83 identifier];
                [v91 setObject:v90 forKeyedSubscript:v92];
              }
            }
            uint64_t v80 = [v56 countByEnumeratingWithState:&v128 objects:v156 count:16];
          }
          while (v80);
        }
      }
      else
      {
        long long v126 = 0uLL;
        long long v127 = 0uLL;
        long long v124 = 0uLL;
        long long v125 = 0uLL;
        id v56 = v117;
        uint64_t v93 = [v56 countByEnumeratingWithState:&v124 objects:v155 count:16];
        if (v93)
        {
          uint64_t v94 = *(void *)v125;
          do
          {
            for (uint64_t n = 0; n != v93; ++n)
            {
              if (*(void *)v125 != v94) {
                objc_enumerationMutation(v56);
              }
              v96 = *(void **)(*((void *)&v124 + 1) + 8 * n);
              v97 = NSNumber;
              [v96 confidence];
              v98 = objc_msgSend(v97, "numberWithFloat:");
              v99 = [v96 identifier];
              [(NSMutableDictionary *)v115 setObject:v98 forKeyedSubscript:v99];
            }
            uint64_t v93 = [v56 countByEnumeratingWithState:&v124 objects:v155 count:16];
          }
          while (v93);
        }

        id v100 = *p_existingScenes;
        long long v122 = *(_OWORD *)&v114->_start.value;
        int64_t epoch = v114->_start.epoch;
        CMTime lhs = *v111;
        CMTime rhs = (CMTime)v114->_start;
        CMTimeSubtract(&v121, &lhs, &rhs);
        [(VCPVideoSceneClassifier *)v114 addResult:v100 start:&v122 duration:&v121 keyIsName:1];
        objc_storeStrong(p_existingScenes, v115);
        long long v101 = *(_OWORD *)&v111->value;
        v114->_start.int64_t epoch = v111->epoch;
        *(_OWORD *)&v114->_start.value = v101;
      }
      v61 = v115;
    }
    else
    {
      existingScenes = v114->_existingScenes;
      long long v119 = *(_OWORD *)&v114->_start.value;
      int64_t v120 = v114->_start.epoch;
      CMTime lhs = *v111;
      CMTime rhs = (CMTime)v114->_start;
      CMTimeSubtract(&v118, &lhs, &rhs);
      [(VCPVideoSceneClassifier *)v114 addResult:existingScenes start:&v119 duration:&v118 keyIsName:1];
      uint64_t v60 = [MEMORY[0x1E4F1CA60] dictionary];
      v61 = v114->_existingScenes;
      v114->_existingScenes = (NSMutableDictionary *)v60;
      id v56 = v116;
    }

    int v11 = 0;
  }

  return v11;
}

uint64_t __72__VCPVideoSceneClassifier_analyzeFrame_withTimestamp_andDuration_flags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
  id v8 = [v5 identifier];
  uint64_t v9 = [v7 nodeForName:v8];
  uint64_t v10 = [v9 sceneClassId];

  int v11 = *(void **)(a1 + 32);
  long long v12 = [NSNumber numberWithUnsignedInt:v10];
  [v5 confidence];
  objc_msgSend(v11, "adjustedConfidence:confidence:", v12);
  float v14 = v13;

  id v15 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
  id v16 = [v6 identifier];
  long long v17 = [v15 nodeForName:v16];
  uint64_t v18 = [v17 sceneClassId];

  long long v19 = *(void **)(a1 + 32);
  CFDictionaryRef v20 = [NSNumber numberWithUnsignedInt:v18];
  [v6 confidence];
  objc_msgSend(v19, "adjustedConfidence:confidence:", v20);
  float v22 = v21;

  if (v14 > v22) {
    uint64_t v23 = -1;
  }
  else {
    uint64_t v23 = v14 < v22;
  }

  return v23;
}

- (id)sortScenesWithMaxNumCap:(id)a3
{
  v3 = [a3 allValues];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 sortUsingComparator:&__block_literal_global_14];
  if ((unint64_t)[v4 count] >= 0x29)
  {
    id v5 = objc_msgSend(v4, "subarrayWithRange:", 0, 40);
    uint64_t v6 = [v5 mutableCopy];

    uint64_t v4 = (void *)v6;
  }
  return v4;
}

uint64_t __51__VCPVideoSceneClassifier_sortScenesWithMaxNumCap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 sumAdjustConfidence];
  float v7 = v6;
  [v5 sumAdjustConfidence];
  if (v7 <= v8)
  {
    [v4 sumAdjustConfidence];
    float v11 = v10;
    [v5 sumAdjustConfidence];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)addAggregatedScenes:(id)a3 timerange:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = [(VCPVideoSceneClassifier *)self sortScenesWithMaxNumCap:a3];
  float v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v23;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        float v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v11 adjustDuration];
        if (v12 != 0.0)
        {
          [v11 sumAdjustConfidence];
          float v14 = v13;
          [v11 adjustDuration];
          if ((float)(v14 / v15) >= 0.0)
          {
            id v16 = NSNumber;
            [v11 sumConfidence];
            float v18 = v17;
            [v11 duration];
            *(float *)&double v20 = v18 / v19;
            float v21 = [v16 numberWithFloat:v20];
            float v22 = [v11 sceneId];
            [v6 setObject:v21 forKeyedSubscript:v22];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  long long v26 = *(_OWORD *)&a4->var0.var0;
  int64_t var3 = a4->var0.var3;
  long long v24 = *(_OWORD *)&a4->var1.var0;
  int64_t v25 = a4->var1.var3;
  [(VCPVideoSceneClassifier *)self addResult:v6 start:&v26 duration:&v24 keyIsName:0];
}

- (id)filteredKeyFrameResults
{
  id v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_results];
  int v3 = [(NSArray *)self->_qualityResults count];
  int v4 = [v15 count];
  if (v4 >= 1)
  {
    LODWORD(v5) = v3 - 1;
    uint64_t v6 = v4;
    do
    {
      memset(&v22, 0, sizeof(v22));
      CFDictionaryRef v7 = [v15 objectAtIndexedSubscript:(v6 - 1)];
      CMTimeRangeMakeFromDictionary(&v22, v7);

      CMTime v21 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if ((v5 & 0x80000000) == 0)
      {
        uint64_t v5 = v5;
        while (1)
        {
          memset(&v20, 0, sizeof(v20));
          CFDictionaryRef v8 = [(NSArray *)self->_qualityResults objectAtIndexedSubscript:v5];
          CMTimeRangeMakeFromDictionary(&v20, v8);

          uint64_t v9 = [(NSArray *)self->_qualityResults objectAtIndexedSubscript:v5];
          float v10 = [v9 objectForKeyedSubscript:@"quality"];
          [v10 floatValue];
          float v12 = v11;

          if (v12 < 0.3)
          {
            CMTimeRange range = v20;
            memset(&v19, 0, sizeof(v19));
            CMTimeRange otherRange = v22;
            CMTimeRangeGetIntersection(&v19, &range, &otherRange);
            CMTime lhs = v21;
            CMTime rhs = v19.duration;
            CMTimeAdd(&time2, &lhs, &rhs);
            CMTime v21 = time2;
          }
          *(_OWORD *)&v19.start.value = *(_OWORD *)&v20.start.value;
          v19.start.int64_t epoch = v20.start.epoch;
          CMTime time2 = v22.start;
          if (CMTimeCompare(&v19.start, &time2) < 1) {
            break;
          }
          BOOL v13 = v5-- <= 0;
          if (v13)
          {
            LODWORD(v5) = -1;
            break;
          }
        }
      }
      CMTime time = v21;
      if (CMTimeGetSeconds(&time) > 0.0) {
        [v15 removeObjectAtIndex:(v6 - 1)];
      }
      BOOL v13 = v6-- <= 1;
    }
    while (!v13);
  }
  return v15;
}

- (void)findObjectsOfInterest:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  for (unint64_t i = 0; [v49 count] > i; ++i)
  {
    memset(&v60, 0, sizeof(v60));
    objc_msgSend(v49, "objectAtIndexedSubscript:");
    CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&v60, v5);

    uint64_t v6 = [v49 objectAtIndexedSubscript:i];
    CFDictionaryRef v7 = [v6 objectForKeyedSubscript:@"attributes"];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v57 != v10) {
            objc_enumerationMutation(v8);
          }
          float v12 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          BOOL v13 = [v8 objectForKeyedSubscript:v12];
          [v13 floatValue];
          float v15 = v14;

          CMTime time = v60.duration;
          double Seconds = CMTimeGetSeconds(&time);
          float v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue"));
          *(float *)&double v18 = v15;
          [(VCPVideoSceneClassifier *)self adjustedConfidence:v17 confidence:v18];
          float v20 = v19;

          CMTime v21 = [v4 objectForKeyedSubscript:v12];
          CMTimeRange v22 = v21;
          float v23 = Seconds;
          float v24 = v15 * v23;
          if (v21)
          {
            [v21 sumConfidence];
            *(float *)&double v26 = v24 + v25;
            [v22 setSumConfidence:v26];
            [v22 sumAdjustConfidence];
            *(float *)&double v28 = v20 + v27;
            [v22 setSumAdjustConfidence:v28];
            [v22 duration];
            *(float *)&double v30 = v29 + v23;
            [v22 setDuration:v30];
            [v22 adjustDuration];
            if (v20 <= 0.0) {
              float v32 = 0.0;
            }
            else {
              float v32 = v23;
            }
            *(float *)&double v31 = v32 + *(float *)&v31;
            [v22 setAdjustDuration:v31];
          }
          else
          {
            uint64_t v33 = [VCPClassification alloc];
            *(float *)&double v34 = v23;
            *(float *)&double v35 = v24;
            *(float *)&double v36 = v20;
            uint64_t v37 = [(VCPClassification *)v33 initWithSceneId:v12 withDuration:v34 withConfidence:v35 withAdjustConfidence:v36];
            if (v37) {
              [v4 setObject:v37 forKeyedSubscript:v12];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v9);
    }
  }
  [(VCPVideoSceneClassifier *)self sortScenesWithMaxNumCap:v4];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v38);
        }
        v42 = *(void **)(*((void *)&v51 + 1) + 8 * k);
        [v42 adjustDuration];
        if (v43 != 0.0)
        {
          [v42 sumAdjustConfidence];
          float v45 = v44;
          [v42 adjustDuration];
          if ((float)(v45 / v46) >= 0.0)
          {
            objectsOfInterest = self->_objectsOfInterest;
            double v48 = [v42 sceneId];
            [(NSMutableArray *)objectsOfInterest addObject:v48];
          }
        }
      }
      uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v39);
  }
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  {
    CMTimeMake((CMTime *)&-[VCPVideoSceneClassifier finishAnalysisPass:]::kMinSceneSegmentDuration, 300, 600);
  }
  memset(&v101, 0, sizeof(v101));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.int64_t epoch = v5;
  *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v101, &range);
  p_CMTime start = &self->_start;
  if (self->_start.flags)
  {
    existingScenes = self->_existingScenes;
    long long v98 = *(_OWORD *)&p_start->value;
    int64_t epoch = self->_start.epoch;
    lhs.CMTime start = v101;
    *(_OWORD *)&rhs.start.CMTimeValue value = *(_OWORD *)&p_start->value;
    rhs.start.int64_t epoch = self->_start.epoch;
    CMTimeSubtract(&v97, &lhs.start, &rhs.start);
    [(VCPVideoSceneClassifier *)self addResult:existingScenes start:&v98 duration:&v97 keyIsName:1];
  }
  if (self->_sceneResults)
  {
    long long v59 = [(VCPVideoSceneClassifier *)self filteredKeyFrameResults];
    [(VCPVideoSceneClassifier *)self findObjectsOfInterest:v59];
    [(NSMutableArray *)self->_results removeAllObjects];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    obunint64_t j = self->_sceneResults;
    uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v93 objects:v106 count:16];
    if (v49)
    {
      int v8 = 0;
      uint64_t v50 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v94 != v50) {
            objc_enumerationMutation(obj);
          }
          CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v93 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v9);
          rhs.CMTime start = lhs.duration;
          *(_OWORD *)&time2.start.CMTimeValue value = -[VCPVideoSceneClassifier finishAnalysisPass:]::kMinSceneSegmentDuration;
          time2.start.int64_t epoch = qword_1E9F95E58;
          if ((CMTimeCompare(&rhs.start, &time2.start) & 0x80000000) == 0)
          {
            uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
            memset(&rhs, 0, sizeof(rhs));
            CMTimeRangeMakeFromDictionary(&rhs, v9);
            CMTimeValue value = *MEMORY[0x1E4F1FA20];
            CMTimeFlags v11 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
            CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
            CMTimeValue v55 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
            CMTimeScale v52 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 32);
            CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 36);
            CMTimeFlags v57 = v11;
            CMTimeEpoch v53 = *(void *)(MEMORY[0x1E4F1FA20] + 16);
            CMTimeEpoch v54 = *(void *)(MEMORY[0x1E4F1FA20] + 40);
            for (unint64_t j = v8; ; unint64_t j = v60 + 1)
            {
              unint64_t v60 = j;
              if ([v59 count] <= j) {
                break;
              }
              memset(&time2, 0, sizeof(time2));
              objc_msgSend(v59, "objectAtIndexedSubscript:");
              CFDictionaryRef v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CMTimeRangeMakeFromDictionary(&time2, v13);

              CMTimeRange v88 = rhs;
              memset(&v89, 0, sizeof(v89));
              CMTimeRange otherRange = time2;
              CMTimeRangeGetIntersection(&v89, &v88, &otherRange);
              if ((v89.start.flags & 1) == 0
                || (v89.duration.flags & 1) == 0
                || v89.duration.epoch
                || v89.duration.value < 0
                || (time1 = v89.duration, CMTime v85 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &v85)))
              {
                float v14 = [v59 objectAtIndexedSubscript:v60];
                long long v58 = [v14 objectForKeyedSubscript:@"attributes"];

                if (-[VCPVideoSceneClassifier compareObjectsOfInterest:withScenes:](self, "compareObjectsOfInterest:withScenes:", v58, v10)&& [v10 count]&& (v57 & 1) != 0&& (flags & 1) != 0&& !v54&& (v55 & 0x8000000000000000) == 0)
                {
                  CMTimeValue v77 = value;
                  CMTimeScale v78 = timescale;
                  CMTimeFlags v79 = v57;
                  CMTimeEpoch v80 = v53;
                  CMTimeValue v81 = v55;
                  CMTimeScale v82 = v52;
                  CMTimeFlags v83 = flags;
                  uint64_t v84 = 0;
                  [(VCPVideoSceneClassifier *)self addAggregatedScenes:v10 timerange:&v77];
                  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];

                  CMTimeValue value = *MEMORY[0x1E4F1FA20];
                  CMTimeFlags v16 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
                  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
                  CMTimeValue v55 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
                  CMTimeScale v52 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 32);
                  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 36);
                  CMTimeFlags v57 = v16;
                  CMTimeEpoch v53 = *(void *)(MEMORY[0x1E4F1FA20] + 16);
                  CMTimeEpoch v54 = *(void *)(MEMORY[0x1E4F1FA20] + 40);
                  uint64_t v10 = (void *)v15;
                }
                if ((v57 & 1) == 0 || (flags & 1) == 0 || v54 || v55 < 0)
                {
                  CMTimeRange v76 = v89;
                }
                else
                {
                  v75.start.CMTimeValue value = value;
                  v75.start.CMTimeScale timescale = timescale;
                  v75.start.CMTimeFlags flags = v57;
                  v75.start.int64_t epoch = v53;
                  v75.duration.CMTimeValue value = v55;
                  v75.duration.CMTimeScale timescale = v52;
                  v75.duration.CMTimeFlags flags = flags;
                  v75.duration.int64_t epoch = 0;
                  CMTimeRange v74 = v89;
                  CMTimeRangeGetUnion(&v76, &v75, &v74);
                }
                CMTimeValue value = v76.start.value;
                CMTimeScale timescale = v76.start.timescale;
                CMTimeValue v55 = v76.duration.value;
                CMTimeScale v52 = v76.duration.timescale;
                CMTimeFlags flags = v76.duration.flags;
                CMTimeFlags v57 = v76.start.flags;
                CMTimeEpoch v53 = v76.start.epoch;
                CMTimeEpoch v54 = v76.duration.epoch;
                long long v70 = 0u;
                long long v71 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                id v17 = v58;
                uint64_t v18 = [v17 countByEnumeratingWithState:&v70 objects:v103 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v71;
                  do
                  {
                    for (uint64_t k = 0; k != v18; ++k)
                    {
                      if (*(void *)v71 != v19) {
                        objc_enumerationMutation(v17);
                      }
                      CMTime v21 = *(void **)(*((void *)&v70 + 1) + 8 * k);
                      CMTimeRange v22 = [v17 objectForKeyedSubscript:v21];
                      [v22 floatValue];
                      float v24 = v23;

                      CMTime time = v89.duration;
                      double Seconds = CMTimeGetSeconds(&time);
                      double v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "intValue"));
                      *(float *)&double v27 = v24;
                      [(VCPVideoSceneClassifier *)self adjustedConfidence:v26 confidence:v27];
                      float v29 = v28;

                      double v30 = [v10 objectForKeyedSubscript:v21];
                      double v31 = v30;
                      float v32 = Seconds;
                      float v33 = v24 * v32;
                      if (v30)
                      {
                        [v30 sumConfidence];
                        *(float *)&double v35 = v33 + v34;
                        [v31 setSumConfidence:v35];
                        [v31 sumAdjustConfidence];
                        *(float *)&double v37 = v29 + v36;
                        [v31 setSumAdjustConfidence:v37];
                        [v31 duration];
                        *(float *)&double v39 = v38 + v32;
                        [v31 setDuration:v39];
                        [v31 adjustDuration];
                        if (v29 <= 0.0) {
                          float v41 = 0.0;
                        }
                        else {
                          float v41 = v32;
                        }
                        *(float *)&double v40 = v41 + *(float *)&v40;
                        [v31 setAdjustDuration:v40];
                      }
                      else
                      {
                        v42 = [VCPClassification alloc];
                        *(float *)&double v43 = v32;
                        *(float *)&double v44 = v33;
                        *(float *)&double v45 = v29;
                        float v46 = [(VCPClassification *)v42 initWithSceneId:v21 withDuration:v43 withConfidence:v44 withAdjustConfidence:v45];
                        if (v46) {
                          [v10 setObject:v46 forKeyedSubscript:v21];
                        }
                      }
                    }
                    uint64_t v18 = [v17 countByEnumeratingWithState:&v70 objects:v103 count:16];
                  }
                  while (v18);
                }
              }
              else
              {
                *(_OWORD *)&v76.start.CMTimeValue value = *(_OWORD *)&time2.start.value;
                v76.start.int64_t epoch = time2.start.epoch;
                CMTime start = rhs.start;
                if (CMTimeCompare(&v76.start, &start) >= 1) {
                  break;
                }
              }
            }
            if ([v10 count]
              && (v57 & 1) != 0
              && (flags & 1) != 0
              && !v54
              && (v55 & 0x8000000000000000) == 0)
            {
              CMTimeValue v61 = value;
              CMTimeScale v62 = timescale;
              CMTimeFlags v63 = v57;
              CMTimeEpoch v64 = v53;
              CMTimeValue v65 = v55;
              CMTimeScale v66 = v52;
              CMTimeFlags v67 = flags;
              uint64_t v68 = 0;
              [(VCPVideoSceneClassifier *)self addAggregatedScenes:v10 timerange:&v61];
            }

            int v8 = v60;
          }
        }
        uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v93 objects:v106 count:16];
      }
      while (v49);
    }
  }
  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  if (results)
  {
    long long v5 = @"ClassificationResults";
    v6[0] = results;
    int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (NSDictionary)frameScenes
{
  if (self->_internalFrameScenes)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:");
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSArray)sceneResults
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSceneResults:(id)a3
{
}

- (NSArray)qualityResults
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setQualityResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualityResults, 0);
  objc_storeStrong((id *)&self->_sceneResults, 0);
  objc_storeStrong((id *)&self->_objectsOfInterest, 0);
  objc_storeStrong((id *)&self->_thresholdBySceneID, 0);
  objc_storeStrong((id *)&self->_internalFrameScenes, 0);
  objc_storeStrong((id *)&self->_existingScenes, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end