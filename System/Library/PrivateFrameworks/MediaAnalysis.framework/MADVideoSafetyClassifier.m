@interface MADVideoSafetyClassifier
+ (id)analyzeVideoAssetOnDemandWithURL:(id)a3 localIdentifier:(id)a4 timeRange:(id *)a5 cancelBlock:(id)a6 andProgressHandler:(id)a7;
- (MADVideoSafetyClassifier)init;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)analyzeFrameWithSampleBuffer:(opaqueCMSampleBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 andFlags:(unint64_t *)a6;
- (int)configureAndStartVideoAnalyzer;
- (int)finishAnalysisPass:(id *)a3;
- (void)addAnalysisResults;
- (void)configureProcessTimeIntervalFrom:(id *)a3;
@end

@implementation MADVideoSafetyClassifier

+ (id)analyzeVideoAssetOnDemandWithURL:(id)a3 localIdentifier:(id)a4 timeRange:(id *)a5 cancelBlock:(id)a6 andProgressHandler:(id)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = [MEMORY[0x1E4F1CA48] array];
  if ((a5->var0.var2 & 1) != 0
    && (a5->var1.var2 & 1) != 0
    && !a5->var1.var3
    && (a5->var1.var0 & 0x8000000000000000) == 0)
  {
    context = (void *)MEMORY[0x1C186D320]();
    id v45 = objc_alloc_init(MEMORY[0x1E4F74790]);
    [v45 setRequiresScoresAndLabels:1];
    v19 = [MEMORY[0x1E4F28B50] mainBundle];
    v20 = [v19 bundleIdentifier];
    v21 = +[MADServiceVideoAsset assetWithURL:v11 identifier:v12 clientBundleID:v20 clientTeamID:0];

    v46 = v21;
    if (!v21)
    {
      int v30 = MediaAnalysisLogLevel();
      v31 = 0;
      if (v30 < 3) {
        goto LABEL_41;
      }
      v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Failed to create MADServiceVideoAsset with %@", (uint8_t *)&buf, 0xCu);
      }

LABEL_40:
      v31 = v46;
LABEL_41:

      goto LABEL_8;
    }
    [v21 setUserSafetyEligible:1];
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    __int16 v56 = -1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__38;
    v66 = __Block_byref_object_dispose__38;
    id v67 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke;
    aBlock[3] = &unk_1E629B520;
    aBlock[4] = &v53;
    aBlock[5] = &buf;
    v43 = _Block_copy(aBlock);
    v22 = +[MADServiceVideoProcessingSubtask taskWithRequest:v45 forAsset:v21 cancelBlock:v13 progressHandler:v14 andCompletionHandler:v43];
    v23 = v22;
    if (v22)
    {
      v42 = v22;
      [v22 setEnablePowerLog:0];
      v24 = VCPSignPostLog();
      os_signpost_id_t v25 = os_signpost_id_generate(v24);

      v26 = VCPSignPostLog();
      v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)v51 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "MADServiceVideoSafetyProcessingTask_Run", "", v51, 2u);
      }

      if (![v42 run])
      {
        v33 = VCPSignPostLog();
        v34 = v33;
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)v51 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v25, "MADServiceVideoSafetyProcessingTask_Run", "", v51, 2u);
        }

        v35 = [MEMORY[0x1E4F1CA60] dictionary];
        v28 = v35;
        v36 = *(void **)(*((void *)&buf + 1) + 40);
        if (v36)
        {
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke_197;
          v49[3] = &unk_1E6298C90;
          v50 = v35;
          [v36 enumerateKeysAndObjectsUsingBlock:v49];
        }
        v61[0] = @"Sensitivity";
        v37 = [NSNumber numberWithShort:*((__int16 *)v54 + 12)];
        v61[1] = @"SensitivitySceneResults";
        v62[0] = v37;
        v62[1] = v28;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];

        v59[0] = @"start";
        CMTime var0 = (CMTime)a5->var0;
        v38 = CMTimeToNSDictionary(&var0);
        v60[0] = v38;
        v59[1] = @"duration";
        CMTime var1 = (CMTime)a5->var1;
        v39 = CMTimeToNSDictionary(&var1);
        v59[2] = @"attributes";
        v60[1] = v39;
        v60[2] = v41;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];
        [v15 addObject:v40];

        goto LABEL_37;
      }
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_38:
        v23 = v42;
LABEL_39:

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v53, 8);
        goto LABEL_40;
      }
      v28 = VCPLogInstance();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_37:

        goto LABEL_38;
      }
      *(_WORD *)v51 = 0;
      v29 = "Failed to run the safety analyze task";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_39;
      }
      v42 = 0;
      v28 = VCPLogInstance();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_37;
      }
      *(_WORD *)v51 = 0;
      v29 = "Failed to create the safety analyze task";
    }
    _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, v29, v51, 2u);
    goto LABEL_37;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Invalid video time range", (uint8_t *)&buf, 2u);
    }
  }
LABEL_8:
  v57 = @"SafetyResults";
  v58 = v15;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1, v41);

  return v17;
}

void __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_24;
    }
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v9 = "Empty resultPayload";
LABEL_22:
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v18, 2u);
    }
LABEL_23:

    goto LABEL_24;
  }
  v5 = [v3 error];
  if (v5)
  {
  }
  else
  {
    v10 = [v4 results];
    if (v10)
    {
      id v11 = [v4 results];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        id v13 = [v4 results];
        v7 = [v13 objectAtIndexedSubscript:0];

        *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 isSensitive];
        uint64_t v14 = [v7 scoresForLabels];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        if ([v7 isSensitive]
          && ![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]
          && (int)MediaAnalysisLogLevel() >= 3)
        {
          v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "Empty scoresForLabels for sensitive content", (uint8_t *)&v18, 2u);
          }
        }
        goto LABEL_23;
      }
    }
  }
  v6 = [v4 error];

  if (!v6)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_24;
    }
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v9 = "No results in resultPayload";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v4 error];
      int v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "Invalid resultPayload with error %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_23;
  }
LABEL_24:
}

void __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = VCPSpecialLabelToExtendedSceneClassificationID(v5);
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v7 stringValue];
    [v9 setObject:v6 forKeyedSubscript:v10];
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (MADVideoSafetyClassifier)init
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)MADVideoSafetyClassifier;
  v2 = [(MADVideoSafetyClassifier *)&v26 init];
  id v3 = v2;
  if (!v2) {
    goto LABEL_17;
  }
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
  *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1FA08];
  *((void *)v2 + 3) = v4;
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *((_OWORD *)v2 + 2) = *MEMORY[0x1E4F1F9F8];
  *((void *)v2 + 6) = v6;
  uint64_t v7 = *(void *)(v5 + 16);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)v5;
  *((void *)v2 + 9) = v7;
  *((_DWORD *)v2 + 20) = 1065353216;
  *((_WORD *)v2 + 42) = -1;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = (void *)v3[11];
  v3[11] = v8;

  if (!v3[11])
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
LABEL_17:
      v17 = 0;
      goto LABEL_18;
    }
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier] Failed to create _results", buf, 2u);
    }
    goto LABEL_16;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F9A610]);
  uint64_t v31 = *MEMORY[0x1E4F9A670];
  v32[0] = MEMORY[0x1E4F1CC38];
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  id v25 = 0;
  uint64_t v12 = [v10 initWithOptions:v11 error:&v25];
  id v13 = v25;
  uint64_t v14 = (void *)v3[13];
  v3[13] = v12;

  if (!v3[13] || v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        *(_DWORD *)long long buf = 138412546;
        v28 = v21;
        __int16 v29 = 2112;
        int v30 = v13;
        id v22 = v21;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier] Failed to create %@: %@", buf, 0x16u);
      }
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F9A640]) initWithMLHandler:v3[13]];
  v16 = (void *)v3[14];
  v3[14] = v15;

  v17 = v3;
  if (!v3[14])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        *(_DWORD *)long long buf = 138412290;
        v28 = v19;
        id v20 = v19;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier] Failed to create %@", buf, 0xCu);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_18:
  v23 = v17;

  return v23;
}

- (void)configureProcessTimeIntervalFrom:(id *)a3
{
  if (a3->var2)
  {
    CMTime time = *(CMTime *)a3;
    float processTimeInterval = CMTimeGetSeconds(&time) / 30.0;
    if (self->_processTimeInterval >= processTimeInterval) {
      float processTimeInterval = self->_processTimeInterval;
    }
    self->_float processTimeInterval = processTimeInterval;
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "Invalid videoDuration, processTimeInterval unchanged.", v6, 2u);
    }
  }
}

- (int)configureAndStartVideoAnalyzer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F9A638]) initWithOptions:0 framesPerSync:1 frameLimit:&unk_1F15ED500 sensitiveFrameCountThreshold:2 useUniformSampling:1];
  if (v3)
  {
    [(SCMLVideoAnalyzer *)self->_videoAnalyzer startAnalysisWithConfig:v3];
    int v4 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = (id)objc_opt_class();
        id v6 = v9;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier]: Failed to create %@", (uint8_t *)&v8, 0xCu);
      }
    }
    int v4 = -108;
  }

  return v4;
}

- (void)addAnalysisResults
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_results count])
  {
    p_start = (CMTime *)&self->_start;
    if (self->_start.flags)
    {
      p_end = (CMTime *)&self->_end;
      if (self->_end.flags)
      {
        uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
        id v6 = v5;
        scoresForLabels = self->_scoresForLabels;
        if (scoresForLabels)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __46__MADVideoSafetyClassifier_addAnalysisResults__block_invoke;
          v15[3] = &unk_1E6298C90;
          id v16 = v5;
          [(NSDictionary *)scoresForLabels enumerateKeysAndObjectsUsingBlock:v15];
        }
        v21[0] = @"Sensitivity";
        int v8 = [NSNumber numberWithShort:self->_sensitivity];
        v21[1] = @"SensitivitySceneResults";
        v22[0] = v8;
        v22[1] = v6;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

        results = self->_results;
        *(_OWORD *)&time.value = *(_OWORD *)&p_start->value;
        time.epoch = self->_start.epoch;
        v19[0] = @"start";
        CFDictionaryRef v11 = CMTimeCopyAsDictionary(&time, 0);
        v20[0] = v11;
        v19[1] = @"duration";
        CMTime time = *p_end;
        CMTime rhs = *p_start;
        CMTimeSubtract(&v14, &time, &rhs);
        CMTime time = v14;
        CFDictionaryRef v12 = CMTimeCopyAsDictionary(&time, 0);
        v19[2] = @"attributes";
        v20[1] = v12;
        v20[2] = v9;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
        [(NSMutableArray *)results addObject:v13];
      }
    }
  }
}

void __46__MADVideoSafetyClassifier_addAnalysisResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VCPSpecialLabelToExtendedSceneClassificationID(v5);
  int v8 = v7;
  if (v7)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v7 stringValue];
    [v9 setObject:v6 forKeyedSubscript:v10];
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    CFDictionaryRef v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (int)analyzeFrameWithSampleBuffer:(opaqueCMSampleBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 andFlags:(unint64_t *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a4->var2)
  {
    p_timeLastProcess = &self->_timeLastProcess;
    CMTime buf = *(CMTime *)a4;
    CMTime rhs = (CMTime)self->_timeLastProcess;
    CMTimeSubtract(&time, &buf, &rhs);
    if (CMTimeGetSeconds(&time) < self->_processTimeInterval) {
      return 0;
    }
    long long v12 = *(_OWORD *)&a4->var0;
    p_timeLastProcess->epoch = a4->var3;
    *(_OWORD *)&p_timeLastProcess->value = v12;
    if ((self->_start.flags & 1) == 0)
    {
      int result = [(MADVideoSafetyClassifier *)self configureAndStartVideoAnalyzer];
      if (result) {
        return result;
      }
      long long v13 = *(_OWORD *)&a4->var0;
      self->_start.epoch = a4->var3;
      *(_OWORD *)&self->_start.value = v13;
    }
    int64_t var3 = a4->var3;
    *(_OWORD *)&self->_end.value = *(_OWORD *)&a4->var0;
    self->_end.epoch = var3;
    if (self->_sensitivity == 1) {
      return 0;
    }
    uint64_t v15 = (void *)MEMORY[0x1C186D320]();
    videoAnalyzer = self->_videoAnalyzer;
    id v34 = 0;
    char v17 = [(SCMLVideoAnalyzer *)videoAnalyzer addFrameBuffer:a3 error:&v34];
    id v18 = v34;
    if (v18) {
      char v19 = 0;
    }
    else {
      char v19 = v17;
    }
    if (v19)
    {
      id v20 = self->_videoAnalyzer;
      id v33 = 0;
      v21 = [(SCMLVideoAnalyzer *)v20 analyze:&v33];
      id v22 = v33;
      v23 = v22;
      if (v21 && !v22)
      {
        self->_sensitivity = [v21 sensitive];
        v24 = [v21 scoresForLabels];
        scoresForLabels = self->_scoresForLabels;
        self->_scoresForLabels = v24;

        return 0;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = objc_opt_class();
          LODWORD(buf.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v31;
          LOWORD(buf.flags) = 2112;
          *(void *)((char *)&buf.flags + 2) = v23;
          id v32 = v31;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "Failed to run %@::analyze: %@", (uint8_t *)&buf, 0x16u);
        }
      }
    }
    else
    {
      objc_super v26 = v18;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = objc_opt_class();
          LODWORD(buf.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v28;
          LOWORD(buf.flags) = 2112;
          *(void *)((char *)&buf.flags + 2) = v26;
          id v29 = v28;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Failed to run %@::addFrameBuffer:error: %@", (uint8_t *)&buf, 0x16u);
        }
      }
    }
    return -18;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Invalid frame timestamp", (uint8_t *)&buf, 2u);
    }
  }
  return -50;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  CMTime v20 = *(CMTime *)a4;
  CMSampleBufferRef sampleBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  OSStatus v11 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
  if (v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(sampleTiming.duration.value) = 0;
        long long v13 = "[CVPixelBuffer->CMSampleBuffer] Failed to create format description";
        p_CMSampleTimingInfo sampleTiming = (uint8_t *)&sampleTiming;
LABEL_9:
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, v13, p_sampleTiming, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E4F1F9F8];
    sampleTiming.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    sampleTiming.presentationTimeStamp = v20;
    sampleTiming.decodeTimeStamp = sampleTiming.duration;
    OSStatus v11 = CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
    if (!v11)
    {
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
      long long v18 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      long long v16 = *(_OWORD *)&a5->var0;
      int64_t v17 = a5->var3;
      OSStatus v11 = [(MADVideoSafetyClassifier *)self analyzeFrameWithSampleBuffer:sampleBufferOut timestamp:&v18 duration:&v16 andFlags:a6];
      goto LABEL_12;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTime buf = 0;
        long long v13 = "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer";
        p_CMSampleTimingInfo sampleTiming = buf;
        goto LABEL_9;
      }
LABEL_10:
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
LABEL_12:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
  return v11;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    long long v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v6;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd((CMTime *)&buf, &range);
    self->_end = buf;
    if (self->_sensitivity == 1 || (self->_start.flags & 1) == 0) {
      goto LABEL_18;
    }
    videoAnalyzer = self->_videoAnalyzer;
    id v18 = 0;
    int v8 = [(SCMLVideoAnalyzer *)videoAnalyzer finalizeAnalysis:&v18];
    id v9 = v18;
    uint64_t v10 = v9;
    if (!v8 || v9)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_23:

        return -18;
      }
      long long v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_opt_class();
        LODWORD(buf.value) = 138412546;
        *(int64_t *)((char *)&buf.value + 4) = (int64_t)v14;
        LOWORD(buf.flags) = 2112;
        *(void *)((char *)&buf.flags + 2) = v10;
        id v15 = v14;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Failed to run %@::finalizeAnalysis: %@", (uint8_t *)&buf, 0x16u);
      }
    }
    else
    {
      self->_sensitivity = [v8 sensitive];
      OSStatus v11 = [v8 scoresForLabels];
      scoresForLabels = self->_scoresForLabels;
      self->_scoresForLabels = v11;

      if (![v8 sensitive] || -[NSDictionary count](self->_scoresForLabels, "count"))
      {

LABEL_18:
        [(MADVideoSafetyClassifier *)self addAnalysisResults];
        return 0;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_23;
      }
      long long v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v16 = objc_opt_class();
        LODWORD(buf.value) = 138412290;
        *(int64_t *)((char *)&buf.value + 4) = (int64_t)v16;
        id v17 = v16;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Failed to run %@::finalizeAnalysis: No scoresForLabels results", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Invalid frame timerange", (uint8_t *)&buf, 2u);
    }
  }
  return -50;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  id v5 = @"SafetyResults";
  v6[0] = results;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAnalyzer, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_scoresForLabels, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end