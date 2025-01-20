@interface VCPAudioClassifier
+ (id)sharedFeaturePrintRequest:(id)a3 version:(int)a4;
+ (void)purgeCachedModels;
- (VCPAudioClassifier)initWithTypes:(unint64_t)a3;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4;
- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 trackDuration:(id *)a4 andSampleBatchSize:(int)a5;
- (void)cacheModelsForClassifySoundRequest:(id)a3 requestIdentifier:(id)a4;
- (void)cacheModelsForDetectSoundRequest:(id)a3 requestIdentifier:(id)a4;
@end

@implementation VCPAudioClassifier

+ (void)purgeCachedModels
{
  v17[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F3BF38];
  v17[0] = *MEMORY[0x1E4F3BF30];
  v17[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F3BF48];
  v17[2] = *MEMORY[0x1E4F3BF40];
  v17[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F3BF58];
  v17[4] = *MEMORY[0x1E4F3BF50];
  v17[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F3BF28];
  v17[6] = *MEMORY[0x1E4F3BF20];
  v17[7] = v5;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = +[VCPSharedInstanceManager sharedManager];
        [v11 resetSharedInstanceWithIdentifier:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (VCPAudioClassifier)initWithTypes:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VCPAudioClassifier;
  uint64_t v4 = [(VCPAudioClassifier *)&v16 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_analysisTypes = a3;
    v4->_framePosition = 0;
    v4->_sampleRate = 16000.0;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    detectors = v5->_detectors;
    v5->_detectors = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    classifiers = v5->_classifiers;
    v5->_classifiers = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    classifiers300 = v5->_classifiers300;
    v5->_classifiers300 = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    embeddingGenerators = v5->_embeddingGenerators;
    v5->_embeddingGenerators = (NSMutableArray *)v12;

    long long v14 = v5;
  }

  return v5;
}

- (void)cacheModelsForDetectSoundRequest:(id)a3 requestIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int HasANE = DeviceHasANE();
  if (v5) {
    int v8 = HasANE;
  }
  else {
    int v8 = 0;
  }
  if (v6 && v8)
  {
    uint64_t v9 = +[VCPSharedInstanceManager sharedManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__VCPAudioClassifier_cacheModelsForDetectSoundRequest_requestIdentifier___block_invoke;
    v15[3] = &unk_1E629B308;
    id v16 = v5;
    uint64_t v10 = [v9 sharedInstanceWithIdentifier:v6 andCreationBlock:v15];
    BOOL v11 = v10 == 0;

    if (v11 && (int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        __int16 v19 = 2112;
        id v20 = v6;
        id v14 = v13;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[%@] failed to retain models for %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __73__VCPAudioClassifier_cacheModelsForDetectSoundRequest_requestIdentifier___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F3BEF0] eagerlyAllocateModelsForRequest:*(void *)(a1 + 32) error:0];
}

- (void)cacheModelsForClassifySoundRequest:(id)a3 requestIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int HasANE = DeviceHasANE();
  if (v5) {
    int v8 = HasANE;
  }
  else {
    int v8 = 0;
  }
  if (v6 && v8)
  {
    uint64_t v9 = +[VCPSharedInstanceManager sharedManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__VCPAudioClassifier_cacheModelsForClassifySoundRequest_requestIdentifier___block_invoke;
    v15[3] = &unk_1E629B308;
    id v16 = v5;
    uint64_t v10 = [v9 sharedInstanceWithIdentifier:v6 andCreationBlock:v15];
    BOOL v11 = v10 == 0;

    if (v11 && (int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        __int16 v19 = 2112;
        id v20 = v6;
        id v14 = v13;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[%@] failed to retain models for %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __75__VCPAudioClassifier_cacheModelsForClassifySoundRequest_requestIdentifier___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F3BEE0] eagerlyAllocateModelsForRequest:*(void *)(a1 + 32) error:0];
}

+ (id)sharedFeaturePrintRequest:(id)a3 version:(int)a4
{
  id v5 = a3;
  id v6 = +[VCPSharedInstanceManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__VCPAudioClassifier_sharedFeaturePrintRequest_version___block_invoke;
  v9[3] = &__block_descriptor_36_e34___SNCreateFeaturePrintRequest_8__0l;
  int v10 = a4;
  uint64_t v7 = [v6 sharedInstanceWithIdentifier:v5 andCreationBlock:v9];

  return v7;
}

id __56__VCPAudioClassifier_sharedFeaturePrintRequest_version___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F3BEE8]);
  uint64_t v3 = *(int *)(a1 + 32);
  id v11 = 0;
  uint64_t v4 = (void *)[v2 initWithFeaturePrintType:6 version:v3 error:&v11];
  id v5 = v11;
  if (v5 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [v5 description];
      *(_DWORD *)buf = 138412290;
      long long v13 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  if (v4)
  {
    CMTimeMake(&v10, 2, 1);
    CMTime v9 = v10;
    [v4 setWindowDuration:&v9];
    [v4 setOverlapFactor:0.0];
  }

  return v4;
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 trackDuration:(id *)a4 andSampleBatchSize:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v101[7] = *MEMORY[0x1E4F143B8];
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (StreamBasicDescription)
  {
    p_mSampleRate = &StreamBasicDescription->mSampleRate;
    v73 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initStandardFormatWithSampleRate:1 channels:StreamBasicDescription->mSampleRate];
    uint64_t v12 = (SNAudioStreamAnalyzer *)[objc_alloc(MEMORY[0x1E4F3BED0]) initWithFormat:v73];
    SNAnalyzer = self->_SNAnalyzer;
    self->_SNAnalyzer = v12;

    if (!self->_SNAnalyzer
      || (float v14 = *p_mSampleRate,
          self->_sampleRate = v14,
          long long v15 = (AVAudioPCMBuffer *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v73 frameCapacity:v5], pcmBuffer = self->_pcmBuffer, self->_pcmBuffer = v15, pcmBuffer, (v17 = self->_pcmBuffer) == 0))
    {
      int v40 = -18;
LABEL_32:

      return v40;
    }
    [(AVAudioPCMBuffer *)v17 setFrameLength:v5];
    v66 = (CMTime *)a4;
    memset(&v88, 0, sizeof(v88));
    CMSampleBufferGetPresentationTimeStamp(&v88, a3);
    uint64_t v19 = *MEMORY[0x1E4F3BF38];
    v95[0] = *MEMORY[0x1E4F3BF30];
    uint64_t v18 = v95[0];
    v95[1] = v19;
    v101[0] = &unk_1F15EACB8;
    v101[1] = &unk_1F15EACC8;
    uint64_t v21 = *MEMORY[0x1E4F3BF48];
    uint64_t v96 = *MEMORY[0x1E4F3BF40];
    uint64_t v20 = v96;
    uint64_t v97 = v21;
    v101[2] = &unk_1F15EACD8;
    v101[3] = &unk_1F15EACE8;
    uint64_t v23 = *MEMORY[0x1E4F3BF58];
    uint64_t v98 = *MEMORY[0x1E4F3BF50];
    uint64_t v22 = v98;
    uint64_t v99 = v23;
    uint64_t v68 = v23;
    v101[4] = &unk_1F15EACF8;
    v101[5] = &unk_1F15EAD08;
    uint64_t v100 = *MEMORY[0x1E4F3BF20];
    uint64_t v69 = v100;
    LODWORD(v24) = 1061997773;
    v25 = [NSNumber numberWithFloat:v24];
    v101[6] = v25;
    v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v95 count:7];

    v93[0] = v18;
    v93[1] = v19;
    v94[0] = @"ApplauseResults";
    v94[1] = @"BabbleResults";
    v93[2] = v20;
    v93[3] = v21;
    v94[2] = @"CheeringResults";
    v94[3] = @"LaughterResults";
    v93[4] = v22;
    v93[5] = v68;
    v94[4] = @"MusicResults";
    v94[5] = @"VoiceResults";
    uint64_t v26 = *MEMORY[0x1E4F3BF28];
    v93[6] = v69;
    uint64_t v67 = v26;
    v93[7] = v26;
    v94[6] = @"AudioQualityResults";
    v94[7] = @"SoundClassificationResults";
    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:8];
    unint64_t analysisTypes = self->_analysisTypes;
    if ((analysisTypes & 0x200000) != 0)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v91[0] = v18;
      v91[1] = v19;
      v91[2] = v20;
      v91[3] = v21;
      v91[4] = v22;
      id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:5];
      uint64_t v28 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v85;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v85 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void *)(*((void *)&v84 + 1) + 8 * i);
            v32 = [objc_alloc(MEMORY[0x1E4F3BEF0]) initWithSoundIdentifier:v31];
            [(VCPAudioClassifier *)self cacheModelsForDetectSoundRequest:v32 requestIdentifier:v31];
            v33 = [VCPSoundDetector alloc];
            CMTime v83 = v88;
            v34 = [v71 objectForKeyedSubscript:v31];
            [v34 floatValue];
            int v36 = v35;
            v37 = [v72 objectForKeyedSubscript:v31];
            LODWORD(v38) = v36;
            v39 = [(VCPSoundDetector *)v33 initWithTrackStart:&v83 threshold:v37 resultsKey:v38];

            if (!v32
              || !v39
              || ![(SNAudioStreamAnalyzer *)self->_SNAnalyzer addRequest:v32 withObserver:v39 error:0])
            {

              goto LABEL_28;
            }
            [(NSMutableArray *)self->_detectors addObject:v39];
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }

      unint64_t analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x10) != 0)
    {
      id obj = (id)[objc_alloc(MEMORY[0x1E4F3BEF0]) initWithSoundIdentifier:v68];
      -[VCPAudioClassifier cacheModelsForDetectSoundRequest:requestIdentifier:](self, "cacheModelsForDetectSoundRequest:requestIdentifier:");
      v41 = [VCPSoundDetector alloc];
      CMTime v82 = v88;
      v42 = [v71 objectForKeyedSubscript:v68];
      [v42 floatValue];
      int v44 = v43;
      v45 = [v72 objectForKeyedSubscript:v68];
      LODWORD(v46) = v44;
      v32 = [(VCPSoundDetector *)v41 initWithTrackStart:&v82 threshold:v45 resultsKey:v46];

      int v40 = -18;
      if (!obj
        || !v32
        || ![(SNAudioStreamAnalyzer *)self->_SNAnalyzer addRequest:obj withObserver:v32 error:0])
      {
        goto LABEL_29;
      }
      [(NSMutableArray *)self->_detectors addObject:v32];

      unint64_t analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x400000000) != 0)
    {
      id obj = (id)[objc_alloc(MEMORY[0x1E4F3BEE0]) initWithClassifierIdentifier:v69 error:0];
      [(VCPAudioClassifier *)self cacheModelsForClassifySoundRequest:obj requestIdentifier:v69];
      CMTime time = *v66;
      float v48 = fmin(CMTimeGetSeconds(&time) * 0.949999988, 3.0);
      CMTimeMake(&v80, (uint64_t)(float)(v48 * 1000.0), 1000);
      CMTime v79 = v80;
      [obj setWindowDuration:&v79];
      v49 = [VCPSoundClassifier alloc];
      CMTime v78 = v88;
      v50 = [v71 objectForKeyedSubscript:v69];
      [v50 floatValue];
      int v52 = v51;
      v53 = [v72 objectForKeyedSubscript:v69];
      LODWORD(v54) = v52;
      v32 = [(VCPSoundClassifier *)v49 initWithTrackStart:&v78 threshold:v53 resultsKey:v54];

      int v40 = -18;
      if (!obj
        || !v32
        || ![(SNAudioStreamAnalyzer *)self->_SNAnalyzer addRequest:obj withObserver:v32 error:0])
      {
        goto LABEL_29;
      }
      [(NSMutableArray *)self->_classifiers addObject:v32];

      unint64_t analysisTypes = self->_analysisTypes;
      if ((analysisTypes & 0x20000000000) == 0) {
        goto LABEL_19;
      }
    }
    else if ((analysisTypes & 0x20000000000) == 0)
    {
LABEL_19:
      if ((analysisTypes & 0x800000000000) == 0)
      {
LABEL_20:
        int v40 = 0;
LABEL_31:

        goto LABEL_32;
      }
      goto LABEL_42;
    }
    id obj = (id)[objc_alloc(MEMORY[0x1E4F3BEE0]) initWithClassifierIdentifier:v67 error:0];
    [(VCPAudioClassifier *)self cacheModelsForClassifySoundRequest:obj requestIdentifier:v67];
    CMTimeMake(&v77, 2, 1);
    CMTime v76 = v77;
    [obj setWindowDuration:&v76];
    [obj setOverlapFactor:0.0];
    v55 = [VCPSoundClassifier300 alloc];
    CMTime v75 = v88;
    v56 = [v72 objectForKeyedSubscript:v67];
    v32 = [(VCPSoundClassifier300 *)v55 initWithTrackStart:&v75 resultsKey:v56];

    int v40 = -18;
    if (!obj
      || !v32
      || ![(SNAudioStreamAnalyzer *)self->_SNAnalyzer addRequest:obj withObserver:v32 error:0])
    {
      goto LABEL_29;
    }
    [(NSMutableArray *)self->_classifiers300 addObject:v32];

    if ((self->_analysisTypes & 0x800000000000) == 0) {
      goto LABEL_20;
    }
LABEL_42:
    if (_os_feature_enabled_impl()) {
      uint64_t v57 = 5;
    }
    else {
      uint64_t v57 = 4;
    }
    v58 = NSString;
    v59 = [NSNumber numberWithInt:v57];
    v60 = [v59 stringValue];
    id obj = [v58 stringWithFormat:@"SNCreateFeaturePrintRequest_%@", v60];

    uint64_t v61 = [(id)objc_opt_class() sharedFeaturePrintRequest:obj version:v57];
    if (v61)
    {
      v62 = [VCPAudioEmbeddingGenerator alloc];
      CMTime v74 = v88;
      v63 = [(VCPAudioEmbeddingGenerator *)v62 initWithTrackStart:&v74 threshold:@"AudioEmbeddingResults" resultsKey:v57 version:0.0];
      [(SNAudioStreamAnalyzer *)self->_SNAnalyzer addRequest:v61 withObserver:v63 error:0];
      [(NSMutableArray *)self->_embeddingGenerators addObject:v63];

      int v40 = 0;
      v32 = v61;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v40 = -18;
        goto LABEL_30;
      }
      v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v64 = [0 description];
        uint64_t v65 = [v64 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v90 = v65;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Failed to create FeaturePrintRequest %s", buf, 0xCu);
      }
LABEL_28:
      int v40 = -18;
    }
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  return -50;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  mData = a3->mBuffers[0].mData;
  uint64_t mDataByteSize = (int)a3->mBuffers[0].mDataByteSize;
  if (mDataByteSize != 4 * [(AVAudioPCMBuffer *)self->_pcmBuffer frameLength]) {
    return -50;
  }
  memcpy(*(void **)([(AVAudioPCMBuffer *)self->_pcmBuffer mutableAudioBufferList] + 16), mData, 4 * [(AVAudioPCMBuffer *)self->_pcmBuffer frameLength]);
  [(SNAudioStreamAnalyzer *)self->_SNAnalyzer analyzeAudioBuffer:self->_pcmBuffer atAudioFramePosition:self->_framePosition];
  AVAudioFrameCount v7 = [(AVAudioPCMBuffer *)self->_pcmBuffer frameLength];
  int result = 0;
  self->_framePosition += v7;
  return result;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = self->_detectors;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v5);
      }
      int v9 = [*(id *)(*((void *)&v32 + 1) + 8 * v8) finalizeAnalysisAtTime:a3];
      if (v9) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v5 = self->_classifiers;
    uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v29;
LABEL_11:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v5);
        }
        int v9 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) finalizeAnalysisAtTime:a3];
        if (v9) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v10) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v5 = self->_classifiers300;
      uint64_t v13 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v25;
LABEL_19:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v5);
          }
          int v9 = [*(id *)(*((void *)&v24 + 1) + 8 * v15) finalizeAnalysisAtTime:a3];
          if (v9) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v37 count:16];
            if (v13) {
              goto LABEL_19;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v5 = self->_embeddingGenerators;
        uint64_t v16 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v36 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v21;
LABEL_27:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v5);
            }
            int v9 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "finalizeAnalysisAtTime:", a3, (void)v20);
            if (v9) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v36 count:16];
              if (v16) {
                goto LABEL_27;
              }
              goto LABEL_33;
            }
          }
        }
        else
        {
LABEL_33:
          int v9 = 0;
        }
      }
    }
  }

  return v9;
}

- (id)results
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v4 = self->_detectors;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v37 + 1) + 8 * i) results];
        [v3 addEntriesFromDictionary:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v5);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v9 = self->_classifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v33 + 1) + 8 * j) results];
        [v3 addEntriesFromDictionary:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v10);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = self->_classifiers300;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = [*(id *)(*((void *)&v29 + 1) + 8 * k) results];
        [v3 addEntriesFromDictionary:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v15);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v19 = self->_embeddingGenerators;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t m = 0; m != v20; ++m)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * m), "results", (void)v25);
        [v3 addEntriesFromDictionary:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v20);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingGenerators, 0);
  objc_storeStrong((id *)&self->_classifiers300, 0);
  objc_storeStrong((id *)&self->_classifiers, 0);
  objc_storeStrong((id *)&self->_detectors, 0);
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
  objc_storeStrong((id *)&self->_SNAnalyzer, 0);
}

@end