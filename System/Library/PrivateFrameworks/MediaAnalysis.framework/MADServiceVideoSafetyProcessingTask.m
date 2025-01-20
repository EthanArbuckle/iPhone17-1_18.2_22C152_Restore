@interface MADServiceVideoSafetyProcessingTask
- (BOOL)configureVideoProcessorWithError:(id *)a3;
- (BOOL)enablePowerLog;
- (BOOL)run:(id *)a3;
- (MADServiceVideoSafetyProcessingTask)initWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (id)finalizeSafetyResultsWithError:(id *)a3;
- (void)_processFrameBuffer:(opaqueCMSampleBuffer *)a3 stop:(BOOL *)a4;
- (void)setEnablePowerLog:(BOOL)a3;
@end

@implementation MADServiceVideoSafetyProcessingTask

- (MADServiceVideoSafetyProcessingTask)initWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __113__MADServiceVideoSafetyProcessingTask_initWithRequest_forAsset_cancelBlock_progressHandler_andCompletionHandler___block_invoke;
  v27[3] = &unk_1E6298188;
  id v18 = v17;
  id v28 = v18;
  v26.receiver = self;
  v26.super_class = (Class)MADServiceVideoSafetyProcessingTask;
  v19 = [(VCPMABaseTask *)&v26 initWithCompletionHandler:v27];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_request, a3);
    objc_storeStrong((id *)&v20->_asset, a4);
    v21 = _Block_copy(v16);
    id progressHandler = v20->_progressHandler;
    v20->_id progressHandler = v21;

    v23 = _Block_copy(v18);
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v23;

    [(VCPMABaseTask *)v20 setCancelBlock:v15];
    v20->_enablePowerLog = 1;
  }

  return v20;
}

void __113__MADServiceVideoSafetyProcessingTask_initWithRequest_forAsset_cancelBlock_progressHandler_andCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (objc_class *)MEMORY[0x1E4F74788];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setError:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_processFrameBuffer:(opaqueCMSampleBuffer *)a3 stop:(BOOL *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  videoAnalyzer = self->_videoAnalyzer;
  id v29 = 0;
  char v7 = [(SCMLVideoAnalyzer *)videoAnalyzer addFrameBuffer:a3 error:&v29];
  id v8 = v29;
  if (v7)
  {
    v9 = self->_videoAnalyzer;
    id v28 = v8;
    v10 = [(SCMLVideoAnalyzer *)v9 analyze:&v28];
    id v11 = v28;

    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      if ([v10 sensitive])
      {
        self->_isSensitive = [v10 sensitive];
        if ([(MADVideoSafetyClassificationRequest *)self->_request requiresScoresAndLabels])
        {
          objc_super v26 = [v10 scoresForLabels];
          scoresForLabels = self->_scoresForLabels;
          self->_scoresForLabels = v26;
        }
        *a4 = 1;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = objc_opt_class();
          id v15 = v14;
          id v16 = objc_opt_class();
          id v17 = v16;
          id v18 = [v11 description];
          *(_DWORD *)buf = 138412802;
          v31 = v14;
          __int16 v32 = 2112;
          v33 = v16;
          __int16 v34 = 2112;
          v35 = v18;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[%@] Failed to run %@::analyze: %@", buf, 0x20u);
        }
      }
      v19 = (NSError *)[v11 copy];
      processError = self->_processError;
      self->_processError = v19;
    }
    id v8 = v11;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_opt_class();
        id v23 = v22;
        v24 = [v8 description];
        *(_DWORD *)buf = 138412546;
        v31 = v22;
        __int16 v32 = 2112;
        v33 = v24;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Failed to run %@::addFrameBuffer:error: %@", buf, 0x16u);
      }
    }
    v25 = (NSError *)[v8 copy];
    v10 = self->_processError;
    self->_processError = v25;
  }
}

- (BOOL)configureVideoProcessorWithError:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = objc_opt_class();
      id v5 = *(id *)((char *)&buf.value + 4);
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[%@] Configuring video processor", (uint8_t *)&buf, 0xCu);
    }
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v48 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:&unk_1F15EB4D8 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
  [v6 setObject:&unk_1F15EB4F0 forKeyedSubscript:*MEMORY[0x1E4F24E10]];
  [v6 setObject:&unk_1F15EB4F0 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
  char v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MADVideoSafetyClassificationRequest appliesPreferredTrackTransform](self->_request, "appliesPreferredTrackTransform"));
  [v6 setObject:v7 forKeyedSubscript:@"AppliesPreferredTrackTransform"];

  id v8 = [(MADVideoSafetyClassificationRequest *)self->_request sampling];
  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_opt_class();
        id v11 = v10;
        BOOL v12 = [v8 description];
        LODWORD(buf.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v10;
        LOWORD(buf.flags) = 2112;
        *(void *)((char *)&buf.flags + 2) = v12;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Non-default sampling in use: %@", (uint8_t *)&buf, 0x16u);
      }
    }
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F747A0]) initWithFramesPerSync:1 frameLimit:30 uniformSampling:1];
  }
  if ([(MADVideoSafetyClassificationRequest *)self->_request requiresBlastdoor])
  {
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "framesPerSync"));
    [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F16270]];

    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "frameLimit"));
    [v6 setObject:v14 forKeyedSubscript:@"FrameLimit"];

    id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "uniformSampling"));
    [v6 setObject:v15 forKeyedSubscript:@"UniformSampling"];
  }
  else
  {
    [(VCPBlockBasedVideoProcessorProtocol *)self->_videoProcessor videoDuration];
    double v31 = v30;
    if (![v8 frameLimit]
      && [v8 uniformSampling]
      && (int)MediaAnalysisLogLevel() >= 4)
    {
      __int16 v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_opt_class();
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v33;
        id v34 = v33;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEFAULT, "[%@] Unexpected uniformSampling specified when frameLimit is 0, ignoring uniformSampling", (uint8_t *)&buf, 0xCu);
      }
    }
    if ([v8 framesPerSync])
    {
      v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "framesPerSync"));
      [v6 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F16270]];

      if ([v8 frameLimit])
      {
        uint64_t v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "frameLimit"));
        [v48 setObject:v36 forKeyedSubscript:@"FrameLimit"];

        if ([v8 uniformSampling])
        {
          double v37 = v31 / ((double)(unint64_t)([v8 frameLimit] - 1) + 0.1);
          if (v37 <= 0.0)
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v42 = VCPLogInstance();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v43 = objc_opt_class();
                uint64_t v44 = *MEMORY[0x1E4F161E0];
                LODWORD(buf.value) = 138412802;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v43;
                LOWORD(buf.flags) = 2112;
                *(void *)((char *)&buf.flags + 2) = v44;
                HIWORD(buf.epoch) = 2048;
                double v54 = v37;
                id v45 = v43;
                _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_DEFAULT, "[%@] Invalid decoder configuration value (%@ = %f), ignoring", (uint8_t *)&buf, 0x20u);
              }
            }
          }
          else
          {
            memset(&buf, 0, sizeof(buf));
            CMTimeMakeWithSeconds(&buf, v37, 1000);
            CFAllocatorRef v38 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            CMTime location = buf;
            CFDictionaryRef v39 = CMTimeCopyAsDictionary(&location, v38);
            [v6 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F161E0]];
          }
        }
      }
    }
    else if ([v8 frameLimit])
    {
      v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "frameLimit"));
      [v48 setObject:v40 forKeyedSubscript:@"FrameLimit"];

      if ([v8 uniformSampling])
      {
        v41 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v8, "frameLimit") / v31);
        [v48 setObject:v41 forKeyedSubscript:@"FramesPerSecond"];
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = objc_opt_class();
      request = self->_request;
      id v19 = v17;
      int v20 = [(MADVideoSafetyClassificationRequest *)request requiresBlastdoor];
      v21 = @"NO";
      LODWORD(buf.value) = 138413058;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v17;
      LOWORD(buf.flags) = 2112;
      if (v20) {
        v21 = @"YES";
      }
      *(void *)((char *)&buf.flags + 2) = v21;
      HIWORD(buf.epoch) = 2112;
      double v54 = *(double *)&v6;
      __int16 v55 = 2112;
      v56 = v48;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[%@] requiresBlastdoor: %@, decoder configuration: %@, request configuration: %@", (uint8_t *)&buf, 0x2Au);
    }
  }
  [(VCPBlockBasedVideoProcessorProtocol *)self->_videoProcessor setDecoderSettings:v6];
  objc_initWeak((id *)&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MADServiceVideoSafetyProcessingTask_configureVideoProcessorWithError___block_invoke;
  aBlock[3] = &unk_1E62981B0;
  objc_copyWeak(&v51, (id *)&location);
  v22 = _Block_copy(aBlock);
  videoProcessor = self->_videoProcessor;
  id v49 = 0;
  char v24 = [(VCPBlockBasedVideoProcessorProtocol *)videoProcessor addFrameProcessingRequest:v22 withConfiguration:v48 error:&v49];
  id v25 = v49;
  if ((v24 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      objc_super v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = (id)objc_opt_class();
        id v28 = [v25 description];
        LODWORD(buf.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v27;
        LOWORD(buf.flags) = 2112;
        *(void *)((char *)&buf.flags + 2) = v28;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "[%@] Failed to add request to video processor (%@)", (uint8_t *)&buf, 0x16u);
      }
    }
    if (v47) {
      void *v47 = (id)[v25 copy];
    }
  }

  objc_destroyWeak(&v51);
  objc_destroyWeak((id *)&location);

  return v24;
}

void __72__MADServiceVideoSafetyProcessingTask_configureVideoProcessorWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained _processFrameBuffer:a2 stop:a3];
    id WeakRetained = v6;
  }
}

- (id)finalizeSafetyResultsWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v25 = (id)objc_opt_class();
      id v6 = v25;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Finalizing results", buf, 0xCu);
    }
  }
  if (self->_isSensitive) {
    goto LABEL_19;
  }
  videoAnalyzer = self->_videoAnalyzer;
  id v22 = 0;
  id v8 = [(SCMLVideoAnalyzer *)videoAnalyzer finalizeAnalysis:&v22];
  id v9 = v22;
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    self->_isSensitive = [v8 sensitive];
    if ([(MADVideoSafetyClassificationRequest *)self->_request requiresScoresAndLabels])
    {
      id v19 = [v8 scoresForLabels];
      scoresForLabels = self->_scoresForLabels;
      self->_scoresForLabels = v19;
    }
LABEL_19:
    id v18 = objc_alloc_init(MEMORY[0x1E4F74788]);
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F74798]) initWithIsSensitive:self->_isSensitive scoresForLabels:self->_scoresForLabels];
    id v23 = v11;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v18 setResults:v8];
    goto LABEL_20;
  }
  id v11 = v9;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    BOOL v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_opt_class();
      id v14 = v13;
      id v15 = objc_opt_class();
      id v16 = v15;
      id v17 = [v11 description];
      *(_DWORD *)CMTime buf = 138412802;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[%@] Failed to run %@::finalizeAnalysis: %@", buf, 0x20u);
    }
  }
  id v18 = 0;
  if (a3) {
    *a3 = (id)[v11 copy];
  }
LABEL_20:

  return v18;
}

- (BOOL)run:(id *)a3
{
  v213[1] = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v197 = (id)objc_opt_class();
      id v6 = v197;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, "[%@] running...", buf, 0xCu);
    }
  }
  if ([(MADServiceVideoAsset *)self->_asset userSafetyEligible])
  {
    char v7 = [MEMORY[0x1E4F1C9C8] now];
    [v7 timeIntervalSince1970];
    double v9 = v8;

    if (+[MADUserSafetyQRCodeDetector enabled])
    {
      BOOL v10 = (void *)MEMORY[0x1C186D320]();
      id v11 = objc_alloc_init(MADUserSafetyVideoQRCodeDetector);
      asset = self->_asset;
      request = self->_request;
      id v14 = [(MADServiceVideoProcessingSubtask *)self signpostPayload];
      id v15 = [(MADUserSafetyVideoQRCodeDetector *)v11 sensitivityFromQRCodeInVideo:asset request:request signpostPayload:v14 progressHandler:self->_progressHandler];

      if (v15)
      {
        if ([v15 BOOLValue])
        {
          if ([(MADVideoSafetyClassificationRequest *)self->_request requiresScoresAndLabels]&& (int)MediaAnalysisLogLevel() >= 4)
          {
            id v16 = VCPLogInstance();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = objc_opt_class();
              *(_DWORD *)CMTime buf = 138412290;
              id v197 = v17;
              id v18 = v17;
              _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, "[%@] ignore scores&labels request", buf, 0xCu);
            }
          }
          id v19 = objc_alloc_init(MEMORY[0x1E4F74788]);
          int v20 = (void *)[objc_alloc(MEMORY[0x1E4F74798]) initWithIsSensitive:1 scoresForLabels:0];
          v211 = v20;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v211 count:1];
          [v19 setResults:v21];

          (*((void (**)(void))self->_completionHandler + 2))();
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              id v23 = objc_opt_class();
              *(_DWORD *)CMTime buf = 138412290;
              id v197 = v23;
              id v24 = v23;
              _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);
            }
          }

          return 1;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v33 = VCPLogInstance();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = objc_opt_class();
          *(_DWORD *)CMTime buf = 138412290;
          id v197 = v34;
          id v35 = v34;
          _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "[%@] processing failed.", buf, 0xCu);
        }
      }
    }
    uint64_t v36 = [(MADServiceVideoAsset *)self->_asset isSensitive];
    uint64_t v37 = [(MADServiceVideoAsset *)self->_asset scoresForLabels];
    CFAllocatorRef v38 = (void *)v37;
    if (v36
      && (v37
       || ([(MADVideoSafetyClassificationRequest *)self->_request requiresScoresAndLabels] & 1) == 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        CFDictionaryRef v39 = VCPLogInstance();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          v40 = objc_opt_class();
          *(_DWORD *)CMTime buf = 138412290;
          id v197 = v40;
          id v41 = v40;
          _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEBUG, "[%@] Leveraging pre-computed IVS result", buf, 0xCu);
        }
      }
      id v42 = objc_alloc_init(MEMORY[0x1E4F74788]);
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F74798]), "initWithIsSensitive:scoresForLabels:", self->_isSensitive | objc_msgSend(v36, "BOOLValue"), v38);
      v210 = v43;
      uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];
      [v42 setResults:v44];

      (*((void (**)(void))self->_completionHandler + 2))();
      if (self->_enablePowerLog)
      {
        id v45 = [(MADServiceVideoAsset *)self->_asset clientBundleID];
        MADPLLogIVSProcessing(v45, 1, [(MADServiceVideoAsset *)self->_asset assetType], v9);
      }
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        BOOL v25 = 1;
LABEL_98:

LABEL_99:
        return v25;
      }
      v46 = VCPLogInstance();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = objc_opt_class();
        *(_DWORD *)CMTime buf = 138412290;
        id v197 = v47;
        id v48 = v47;
        _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);
      }
      BOOL v25 = 1;
LABEL_97:

      goto LABEL_98;
    }
    uint64_t v49 = [(MADVideoSafetyClassificationRequest *)self->_request sensitiveFrameCountThreshold];
    if (!v49
      || (v50 = (void *)v49,
          -[MADVideoSafetyClassificationRequest sensitiveFrameCountThreshold](self->_request, "sensitiveFrameCountThreshold"), id v51 = objc_claimAutoreleasedReturnValue(), v52 = [v51 unsignedIntegerValue], v51, v50, v52))
    {
      id v42 = [(MADServiceVideoAsset *)self->_asset url];
      v189 = v38;
      if (v42)
      {
        v188 = v36;
        if ([(MADVideoSafetyClassificationRequest *)self->_request requiresBlastdoor]) {
          v53 = VCPBlastdoorVideoProcessor;
        }
        else {
          v53 = VCPVideoProcessor;
        }
        v63 = (VCPBlockBasedVideoProcessorProtocol *)[[v53 alloc] initWithURL:v42];
        videoProcessor = self->_videoProcessor;
        self->_videoProcessor = v63;

        if (self->_videoProcessor)
        {
          id progressHandler = self->_progressHandler;
          if (progressHandler)
          {
            v66 = _Block_copy(progressHandler);
            [(VCPBlockBasedVideoProcessorProtocol *)self->_videoProcessor setProgressHandler:v66];
          }
          v67 = VCPSignPostLog();
          os_signpost_id_t v68 = os_signpost_id_generate(v67);

          v69 = VCPSignPostLog();
          v70 = v69;
          if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
          {
            *(_WORD *)CMTime buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v70, OS_SIGNPOST_INTERVAL_BEGIN, v68, "CommSafetyHandler_Init", "", buf, 2u);
          }

          id v71 = objc_alloc(MEMORY[0x1E4F9A610]);
          uint64_t v202 = *MEMORY[0x1E4F9A670];
          uint64_t v203 = MEMORY[0x1E4F1CC38];
          v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
          id v193 = 0;
          v73 = (SCMLHandler *)[v71 initWithOptions:v72 error:&v193];
          v187 = v193;
          handler = self->_handler;
          self->_handler = v73;

          v75 = VCPSignPostLog();
          v76 = v75;
          if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
          {
            *(_WORD *)CMTime buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v76, OS_SIGNPOST_INTERVAL_END, v68, "CommSafetyHandler_Init", "", buf, 2u);
          }

          CFAllocatorRef v38 = v189;
          if (self->_handler && !v187)
          {
            v77 = (SCMLVideoAnalyzer *)[objc_alloc(MEMORY[0x1E4F9A640]) initWithMLHandler:self->_handler];
            videoAnalyzer = self->_videoAnalyzer;
            self->_videoAnalyzer = v77;

            if (!self->_videoAnalyzer)
            {
              v46 = 0;
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v112 = VCPLogInstance();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  v113 = objc_opt_class();
                  id v114 = v113;
                  v115 = objc_opt_class();
                  *(_DWORD *)CMTime buf = 138412546;
                  id v197 = v113;
                  __int16 v198 = 2112;
                  uint64_t v199 = (uint64_t)v115;
                  id v116 = v115;
                  _os_log_impl(&dword_1BBEDA000, v112, OS_LOG_TYPE_ERROR, "[%@] Failed to create %@", buf, 0x16u);
                }
              }
              if (!a3)
              {
                BOOL v25 = 0;
                CFAllocatorRef v38 = v189;
                goto LABEL_97;
              }
              v117 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v118 = *MEMORY[0x1E4F28760];
              uint64_t v194 = *MEMORY[0x1E4F28568];
              v119 = NSString;
              uint64_t v120 = objc_opt_class();
              id v59 = [v119 stringWithFormat:@"[%@] Failed to create %@", v120, objc_opt_class()];
              id v195 = v59;
              v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
              v122 = [v117 errorWithDomain:v118 code:-50 userInfo:v121];
              id v123 = *a3;
              *a3 = v122;

              BOOL v25 = 0;
              uint64_t v36 = v188;
              CFAllocatorRef v38 = v189;
              goto LABEL_89;
            }
            id v192 = 0;
            BOOL v79 = [(MADServiceVideoSafetyProcessingTask *)self configureVideoProcessorWithError:&v192];
            id v59 = v192;
            if (v79)
            {
              v80 = [(MADVideoSafetyClassificationRequest *)self->_request sensitiveFrameCountThreshold];
              if (v80)
              {
                v81 = [(MADVideoSafetyClassificationRequest *)self->_request sensitiveFrameCountThreshold];
                uint64_t v82 = [v81 unsignedIntegerValue];
              }
              else
              {
                uint64_t v82 = 2;
              }

              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v132 = VCPLogInstance();
                if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                {
                  v133 = objc_opt_class();
                  *(_DWORD *)CMTime buf = 138412546;
                  id v197 = v133;
                  __int16 v198 = 1024;
                  LODWORD(v199) = v82;
                  id v179 = v133;
                  _os_log_impl(&dword_1BBEDA000, v132, OS_LOG_TYPE_INFO, "[%@] Configuring sensitiveFrameCountThreshold: %u", buf, 0x12u);
                }
              }
              id v175 = objc_alloc(MEMORY[0x1E4F9A638]);
              v180 = [(MADVideoSafetyClassificationRequest *)self->_request sampling];
              uint64_t v174 = [v180 framesPerSync];
              type = [(MADVideoSafetyClassificationRequest *)self->_request sampling];
              uint64_t v134 = [type frameLimit];
              if (v134)
              {
                v135 = NSNumber;
                v173 = [(MADVideoSafetyClassificationRequest *)self->_request sampling];
                v136 = objc_msgSend(v135, "numberWithUnsignedInteger:", objc_msgSend(v173, "frameLimit"));
              }
              else
              {
                v136 = 0;
              }
              v137 = [(MADVideoSafetyClassificationRequest *)self->_request sampling];
              uint64_t v138 = objc_msgSend(v175, "initWithOptions:framesPerSync:frameLimit:sensitiveFrameCountThreshold:useUniformSampling:", 0, v174, v136, v82, objc_msgSend(v137, "uniformSampling"));

              if (v134)
              {
              }
              id v131 = (id)v138;
              [(SCMLVideoAnalyzer *)self->_videoAnalyzer startAnalysisWithConfig:v138];
              v139 = VCPSignPostLog();
              os_signpost_id_t v140 = os_signpost_id_generate(v139);

              v141 = VCPSignPostLog();
              v142 = v141;
              if (v140 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
              {
                v143 = [(MADServiceVideoProcessingSubtask *)self signpostPayload];
                *(_DWORD *)CMTime buf = 138412290;
                id v197 = v143;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v142, OS_SIGNPOST_INTERVAL_BEGIN, v140, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
              }
              v144 = self->_videoProcessor;
              id v191 = 0;
              char v145 = [(VCPBlockBasedVideoProcessorProtocol *)v144 analyzeWithError:&v191];
              id v186 = v191;
              if ((v145 & 1) == 0)
              {
                v46 = 0;
                uint64_t v36 = v188;
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v155 = VCPLogInstance();
                  if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
                  {
                    v156 = objc_opt_class();
                    id v182 = v156;
                    v157 = [v186 description];
                    *(_DWORD *)CMTime buf = 138412546;
                    id v197 = v156;
                    __int16 v198 = 2112;
                    uint64_t v199 = (uint64_t)v157;
                    _os_log_impl(&dword_1BBEDA000, v155, OS_LOG_TYPE_ERROR, "[%@] Failed to process video (%@)", buf, 0x16u);
                  }
                }
                if (a3)
                {
                  v158 = v186;
                  v159 = (void *)[v186 copy];
                  BOOL v25 = 0;
                  id v154 = *a3;
                  *a3 = v159;
LABEL_171:

                  goto LABEL_172;
                }
                BOOL v25 = 0;
                goto LABEL_161;
              }
              v146 = VCPSignPostLog();
              v147 = v146;
              if (v140 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v146))
              {
                v148 = [(MADServiceVideoProcessingSubtask *)self signpostPayload];
                *(_DWORD *)CMTime buf = 138412290;
                id v197 = v148;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v147, OS_SIGNPOST_INTERVAL_END, v140, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
              }
              if (self->_processError)
              {
                v46 = 0;
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v149 = VCPLogInstance();
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
                  {
                    v150 = objc_opt_class();
                    typea = self->_processError;
                    id v181 = v150;
                    uint64_t v151 = [(NSError *)typea description];
                    *(_DWORD *)CMTime buf = 138412546;
                    id v197 = v150;
                    __int16 v198 = 2112;
                    uint64_t v199 = v151;
                    v152 = (void *)v151;
                    _os_log_impl(&dword_1BBEDA000, v149, OS_LOG_TYPE_ERROR, "[%@] Failed to process frame buffer (%@)", buf, 0x16u);
                  }
                }
                if (a3)
                {
                  v153 = (void *)[(NSError *)self->_processError copy];
                  BOOL v25 = 0;
                  id v154 = *a3;
                  *a3 = v153;
                  uint64_t v36 = v188;
LABEL_170:
                  v158 = v186;
                  goto LABEL_171;
                }
                BOOL v25 = 0;
                uint64_t v36 = v188;
LABEL_161:
                v158 = v186;
LABEL_172:

                CFAllocatorRef v38 = v189;
                goto LABEL_173;
              }
              id v190 = 0;
              v160 = [(MADServiceVideoSafetyProcessingTask *)self finalizeSafetyResultsWithError:&v190];
              id v161 = v190;
              id v154 = v161;
              if (v160) {
                BOOL v162 = v161 == 0;
              }
              else {
                BOOL v162 = 0;
              }
              BOOL v25 = v162;
              if (v162)
              {
                (*((void (**)(void))self->_completionHandler + 2))();
                uint64_t v36 = v188;
                if (self->_enablePowerLog)
                {
                  v163 = [(MADServiceVideoAsset *)self->_asset clientBundleID];
                  MADPLLogIVSProcessing(v163, 0, [(MADServiceVideoAsset *)self->_asset assetType], v9);
                }
                v46 = 0;
                if ((int)MediaAnalysisLogLevel() < 6) {
                  goto LABEL_169;
                }
                v183 = v160;
                v164 = VCPLogInstance();
                if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
                {
                  v165 = objc_opt_class();
                  *(_DWORD *)CMTime buf = 138412290;
                  id v197 = v165;
                  id v166 = v165;
                  _os_log_impl(&dword_1BBEDA000, v164, OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);
                }
              }
              else
              {
                int v167 = MediaAnalysisLogLevel();
                v46 = 0;
                uint64_t v36 = v188;
                v183 = v160;
                if (v167 >= 3)
                {
                  v168 = VCPLogInstance();
                  if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
                  {
                    v169 = objc_opt_class();
                    id v176 = v169;
                    uint64_t v170 = [v154 description];
                    *(_DWORD *)CMTime buf = 138412546;
                    id v197 = v169;
                    __int16 v198 = 2112;
                    uint64_t v199 = v170;
                    v171 = (void *)v170;
                    _os_log_impl(&dword_1BBEDA000, v168, OS_LOG_TYPE_ERROR, "[%@] Failed to finalize results (%@)", buf, 0x16u);
                  }
                  v160 = v183;
                }
                if (!a3) {
                  goto LABEL_169;
                }
                v172 = (void *)[v154 copy];
                v164 = *a3;
                *a3 = v172;
              }

              v160 = v183;
LABEL_169:

              goto LABEL_170;
            }
            v46 = 0;
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v124 = VCPLogInstance();
              if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
              {
                v125 = objc_opt_class();
                id v126 = v125;
                v127 = objc_opt_class();
                id v185 = v127;
                uint64_t v128 = [v59 description];
                *(_DWORD *)CMTime buf = 138412802;
                id v197 = v125;
                __int16 v198 = 2112;
                uint64_t v199 = (uint64_t)v127;
                __int16 v200 = 2112;
                uint64_t v201 = v128;
                v129 = (void *)v128;
                _os_log_impl(&dword_1BBEDA000, v124, OS_LOG_TYPE_ERROR, "[%@] Failed to configure %@ (%@)", buf, 0x20u);
              }
              CFAllocatorRef v38 = v189;
            }
            if (a3)
            {
              v130 = (void *)[v59 copy];
              BOOL v25 = 0;
              id v131 = *a3;
              *a3 = v130;
LABEL_173:

              goto LABEL_89;
            }
            goto LABEL_88;
          }
          v46 = v187;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v105 = VCPLogInstance();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              v106 = objc_opt_class();
              id v107 = v106;
              v108 = objc_opt_class();
              id v184 = v108;
              v109 = [v187 description];
              *(_DWORD *)CMTime buf = 138412802;
              id v197 = v106;
              __int16 v198 = 2112;
              uint64_t v199 = (uint64_t)v108;
              CFAllocatorRef v38 = v189;
              __int16 v200 = 2112;
              uint64_t v201 = (uint64_t)v109;
              _os_log_impl(&dword_1BBEDA000, v105, OS_LOG_TYPE_ERROR, "[%@] Failed to create %@ (%@)", buf, 0x20u);
            }
          }
          if (a3)
          {
            id v110 = [v187 copy];
            BOOL v25 = 0;
            id v59 = *a3;
            *a3 = v110;
            goto LABEL_89;
          }
LABEL_96:
          BOOL v25 = 0;
          goto LABEL_97;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v90 = VCPLogInstance();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            v91 = objc_opt_class();
            v92 = self->_request;
            id v93 = v91;
            v94 = v92;
            CFAllocatorRef v38 = v189;
            int v95 = [(MADVideoSafetyClassificationRequest *)v94 requiresBlastdoor];
            v96 = @"NO";
            if (v95) {
              v96 = @"YES";
            }
            *(_DWORD *)CMTime buf = 138412546;
            id v197 = v91;
            __int16 v198 = 2112;
            uint64_t v199 = (uint64_t)v96;
            _os_log_impl(&dword_1BBEDA000, v90, OS_LOG_TYPE_ERROR, "[%@] Failed to create video processor (requiresBlastdoor: %@)", buf, 0x16u);
          }
        }
        if (!a3)
        {
          BOOL v25 = 0;
          goto LABEL_98;
        }
        v97 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v98 = *MEMORY[0x1E4F28760];
        uint64_t v204 = *MEMORY[0x1E4F28568];
        v99 = NSString;
        uint64_t v100 = objc_opt_class();
        int v101 = [(MADVideoSafetyClassificationRequest *)self->_request requiresBlastdoor];
        v102 = @"NO";
        if (v101) {
          v102 = @"YES";
        }
        v46 = [v99 stringWithFormat:@"[%@] Failed to create video processor (requiresBlastdoor: %@)", v100, v102];
        v205 = v46;
        id v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
        v60 = v97;
        uint64_t v61 = v98;
        CFAllocatorRef v38 = v189;
        uint64_t v62 = -50;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          double v54 = VCPLogInstance();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            __int16 v55 = objc_opt_class();
            *(_DWORD *)CMTime buf = 138412290;
            id v197 = v55;
            id v56 = v55;
            _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_ERROR, "[%@] Failed to obtain video resource", buf, 0xCu);
          }
        }
        uint64_t v57 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = *MEMORY[0x1E4F28760];
        uint64_t v206 = *MEMORY[0x1E4F28568];
        v46 = [NSString stringWithFormat:@"[%@] Failed to obtain video resource", objc_opt_class()];
        v207 = v46;
        id v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
        v60 = v57;
        uint64_t v61 = v58;
        CFAllocatorRef v38 = v189;
        uint64_t v62 = -18;
      }
      v103 = [v60 errorWithDomain:v61 code:v62 userInfo:v59];
      id v104 = *a3;
      *a3 = v103;

LABEL_88:
      BOOL v25 = 0;
LABEL_89:

      goto LABEL_97;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v83 = VCPLogInstance();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v84 = objc_opt_class();
        *(_DWORD *)CMTime buf = 138412290;
        id v197 = v84;
        id v85 = v84;
        _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_ERROR, "[%@] Invalid configuration, sensitiveFrameCountThreshold must be > 0", buf, 0xCu);
      }
    }
    if (!a3)
    {
      BOOL v25 = 0;
      goto LABEL_99;
    }
    v86 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v87 = *MEMORY[0x1E4F28760];
    uint64_t v208 = *MEMORY[0x1E4F28568];
    id v42 = [NSString stringWithFormat:@"[%@] Invalid configuration, sensitiveFrameCountThreshold must be > 0", objc_opt_class()];
    id v209 = v42;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
    v88 = [v86 errorWithDomain:v87 code:-50 userInfo:v46];
    id v89 = *a3;
    *a3 = v88;

    goto LABEL_96;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    __int16 v26 = VCPLogInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "User Safety either not entitled for client or not enabled", buf, 2u);
    }
  }
  if (a3)
  {
    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28760];
    uint64_t v212 = *MEMORY[0x1E4F28568];
    id v29 = [NSString stringWithFormat:@"User Safety either not entitled for client or not enabled"];
    v213[0] = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v213 forKeys:&v212 count:1];
    double v31 = [v27 errorWithDomain:v28 code:-18 userInfo:v30];
    id v32 = *a3;
    *a3 = v31;
  }
  return 0;
}

- (BOOL)enablePowerLog
{
  return self->_enablePowerLog;
}

- (void)setEnablePowerLog:(BOOL)a3
{
  self->_enablePowerLog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_scoresForLabels, 0);
  objc_storeStrong((id *)&self->_processError, 0);
  objc_storeStrong((id *)&self->_videoAnalyzer, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_videoProcessor, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end