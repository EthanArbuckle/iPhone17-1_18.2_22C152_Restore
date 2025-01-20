@interface CSEnhancedEndpointer
- (BOOL)_didDefaultEndpointerFireWithPartialScore:(float)a3 rcScore:(float)a4;
- (BOOL)_didDetectSpeechWithPartialScore:(float)a3;
- (BOOL)_didRelaxedEndpointerFireWithPartialScore:(float)a3 rcScore:(float)a4;
- (BOOL)_shouldForceEndpoint:(id)a3;
- (BOOL)delayedTrigger;
- (BOOL)hasHadDelayedDefaultResult;
- (CSEnhancedEndpointer)initWithModelFile:(id)a3 defaultThresholdPartial:(float)a4 defaultThresholdRC:(float)a5 relaxedThresholdPartial:(float)a6 relaxedThresholdRC:(float)a7 extraDelayMs:(int)a8 continuityWindowDuration:(int)a9 speechDetectedThreshold:(float)a10;
- (MLModel)endpointerModel;
- (NSArray)outputNodes;
- (NSDictionary)inputSpecs;
- (_TtP20CoreSpeechFoundation31CSEnhancedEndpointerInputVector_)inputVector;
- (double)continuityEndTargetTime;
- (double)delayedTargetTimeDefault;
- (double)delayedTargetTimeRelaxed;
- (float)defaultThresholdPartial;
- (float)defaultThresholdRC;
- (float)relaxedThresholdPartial;
- (float)relaxedThresholdRC;
- (float)speechDetectedThreshold;
- (id)_constructFeatureDictionary:(id)a3;
- (id)modelType;
- (int)continuityWindowDuration;
- (int)extraDelayMs;
- (void)_extractModelSpecs;
- (void)didEndpointWithFeatures:(id)a3 audioTimestampMs:(double)a4 completion:(id)a5;
- (void)setContinuityEndTargetTime:(double)a3;
- (void)setContinuityWindowDuration:(int)a3;
- (void)setDefaultThresholdPartial:(float)a3;
- (void)setDefaultThresholdRC:(float)a3;
- (void)setDelayedTargetTimeDefault:(double)a3;
- (void)setDelayedTargetTimeRelaxed:(double)a3;
- (void)setDelayedTrigger:(BOOL)a3;
- (void)setEndpointerModel:(id)a3;
- (void)setExtraDelayMs:(int)a3;
- (void)setHasHadDelayedDefaultResult:(BOOL)a3;
- (void)setInputSpecs:(id)a3;
- (void)setInputVector:(id)a3;
- (void)setOutputNodes:(id)a3;
- (void)setRelaxedThresholdPartial:(float)a3;
- (void)setRelaxedThresholdRC:(float)a3;
- (void)setSpeechDetectedThreshold:(float)a3;
- (void)updateDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6;
- (void)updateDelayedTriggerSwitch:(BOOL)a3;
@end

@implementation CSEnhancedEndpointer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputVector, 0);
  objc_storeStrong((id *)&self->_outputNodes, 0);
  objc_storeStrong((id *)&self->_inputSpecs, 0);
  objc_storeStrong((id *)&self->_endpointerModel, 0);
}

- (void)setContinuityEndTargetTime:(double)a3
{
  self->_continuityEndTargetTime = a3;
}

- (double)continuityEndTargetTime
{
  return self->_continuityEndTargetTime;
}

- (void)setInputVector:(id)a3
{
}

- (_TtP20CoreSpeechFoundation31CSEnhancedEndpointerInputVector_)inputVector
{
  return self->_inputVector;
}

- (void)setHasHadDelayedDefaultResult:(BOOL)a3
{
  self->_hasHadDelayedDefaultResult = a3;
}

- (BOOL)hasHadDelayedDefaultResult
{
  return self->_hasHadDelayedDefaultResult;
}

- (void)setDelayedTargetTimeRelaxed:(double)a3
{
  self->_delayedTargetTimeRelaxed = a3;
}

- (double)delayedTargetTimeRelaxed
{
  return self->_delayedTargetTimeRelaxed;
}

- (void)setDelayedTargetTimeDefault:(double)a3
{
  self->_delayedTargetTimeDefault = a3;
}

- (double)delayedTargetTimeDefault
{
  return self->_delayedTargetTimeDefault;
}

- (void)setDelayedTrigger:(BOOL)a3
{
  self->_delayedTrigger = a3;
}

- (BOOL)delayedTrigger
{
  return self->_delayedTrigger;
}

- (void)setSpeechDetectedThreshold:(float)a3
{
  self->_speechDetectedThreshold = a3;
}

- (float)speechDetectedThreshold
{
  return self->_speechDetectedThreshold;
}

- (void)setContinuityWindowDuration:(int)a3
{
  self->_continuityWindowDuration = a3;
}

- (int)continuityWindowDuration
{
  return self->_continuityWindowDuration;
}

- (void)setExtraDelayMs:(int)a3
{
  self->_extraDelayMs = a3;
}

- (int)extraDelayMs
{
  return self->_extraDelayMs;
}

- (void)setRelaxedThresholdRC:(float)a3
{
  self->_relaxedThresholdRC = a3;
}

- (float)relaxedThresholdRC
{
  return self->_relaxedThresholdRC;
}

- (void)setRelaxedThresholdPartial:(float)a3
{
  self->_relaxedThresholdPartial = a3;
}

- (float)relaxedThresholdPartial
{
  return self->_relaxedThresholdPartial;
}

- (void)setDefaultThresholdRC:(float)a3
{
  self->_defaultThresholdRC = a3;
}

- (float)defaultThresholdRC
{
  return self->_defaultThresholdRC;
}

- (void)setDefaultThresholdPartial:(float)a3
{
  self->_defaultThresholdPartial = a3;
}

- (float)defaultThresholdPartial
{
  return self->_defaultThresholdPartial;
}

- (void)setOutputNodes:(id)a3
{
}

- (NSArray)outputNodes
{
  return self->_outputNodes;
}

- (void)setInputSpecs:(id)a3
{
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (void)setEndpointerModel:(id)a3
{
}

- (MLModel)endpointerModel
{
  return self->_endpointerModel;
}

- (id)modelType
{
  return (id)[(CSEnhancedEndpointerInputVector *)self->_inputVector modelName];
}

- (void)updateDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6
{
  self->_defaultThresholdPartial = a3;
  self->_defaultThresholdRC = a4;
  self->_relaxedThresholdPartial = a5;
  self->_relaxedThresholdRC = a6;
}

- (void)updateDelayedTriggerSwitch:(BOOL)a3
{
  self->_delayedTrigger = a3;
}

- (BOOL)_shouldForceEndpoint:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 trailingSilenceDuration] >= 5000)
  {
    v4 = (void *)CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      int v12 = 136315394;
      v13 = "-[CSEnhancedEndpointer _shouldForceEndpoint:]";
      __int16 v14 = 2048;
      double v15 = COERCE_DOUBLE([v3 trailingSilenceDuration]);
      v6 = "%s Force endpointing based on trailingSilenceDuration: %ld";
LABEL_8:
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  [v3 silencePosteriorNF];
  if (v7 >= 5000.0)
  {
    v9 = (void *)CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v9;
      [v3 silencePosteriorNF];
      int v12 = 136315394;
      v13 = "-[CSEnhancedEndpointer _shouldForceEndpoint:]";
      __int16 v14 = 2048;
      double v15 = v10;
      v6 = "%s Force endpointing based on silencePosteriorNF: %f";
      goto LABEL_8;
    }
LABEL_9:
    BOOL v8 = 1;
    goto LABEL_10;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (id)_constructFeatureDictionary:(id)a3
{
  v4 = [(CSEnhancedEndpointerInputVector *)self->_inputVector multiArrayWithContext:a3];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  inputSpecs = self->_inputSpecs;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__CSEnhancedEndpointer__constructFeatureDictionary___block_invoke;
  v12[3] = &unk_1E6200C40;
  id v7 = v5;
  id v13 = v7;
  __int16 v14 = v4;
  id v8 = v4;
  [(NSDictionary *)inputSpecs enumerateKeysAndObjectsUsingBlock:v12];
  v9 = v14;
  id v10 = v7;

  return v10;
}

void __52__CSEnhancedEndpointer__constructFeatureDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 isEqualToString:@"x_1"])
  {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:v6];
  }
  else
  {
    id v7 = CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[CSEnhancedEndpointer _constructFeatureDictionary:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Unexpected key in model input specifications", (uint8_t *)&v8, 0xCu);
    }
    *a4 = 1;
  }
}

- (BOOL)_didDetectSpeechWithPartialScore:(float)a3
{
  return self->_speechDetectedThreshold > a3;
}

- (BOOL)_didDefaultEndpointerFireWithPartialScore:(float)a3 rcScore:(float)a4
{
  return self->_defaultThresholdPartial <= a3 || self->_defaultThresholdRC <= a4;
}

- (BOOL)_didRelaxedEndpointerFireWithPartialScore:(float)a3 rcScore:(float)a4
{
  return self->_relaxedThresholdPartial <= a3 || self->_relaxedThresholdRC <= a4;
}

- (void)didEndpointWithFeatures:(id)a3 audioTimestampMs:(double)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke;
  v41[3] = &unk_1E61FF3F8;
  id v10 = v9;
  id v42 = v10;
  v11 = (void (**)(void, void))MEMORY[0x1BA9E7570](v41);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = objc_alloc_init(CSEnhancedEndpointerResult);
  if (!v8) {
    goto LABEL_4;
  }
  objc_msgSend((id)v36[5], "setEndpointerType:", -[CSEnhancedEndpointerInputVector endpointerType](self->_inputVector, "endpointerType"));
  if (![(CSEnhancedEndpointer *)self _shouldForceEndpoint:v8])
  {
    int v12 = [(CSEnhancedEndpointer *)self _constructFeatureDictionary:v8];
    id v34 = 0;
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1E928]) initWithDictionary:v12 error:&v34];
    id v14 = v34;
    if (v14 || !v13)
    {
      v22 = (id)CSLogCategoryEP;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v26 = [v14 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v44 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
        __int16 v45 = 2114;
        v46 = v26;
        __int16 v47 = 2114;
        v48 = v12;
        _os_log_error_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_ERROR, "%s Unable to create feature dict with error %{public}@ from %{public}@", buf, 0x20u);
      }
      v11[2](v11, v36[5]);
      goto LABEL_35;
    }
    endpointerModel = self->_endpointerModel;
    id v33 = 0;
    uint64_t v16 = [(MLModel *)endpointerModel predictionFromFeatures:v13 error:&v33];
    id v14 = v33;
    if (v14 || !v16)
    {
      v23 = (id)CSLogCategoryEP;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v27 = [v14 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v44 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
        __int16 v45 = 2114;
        v46 = v27;
        __int16 v47 = 2114;
        v48 = v13;
        _os_log_error_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_ERROR, "%s Unable to create get prediction from model with error %{public}@ from %{public}@", buf, 0x20u);
      }
      goto LABEL_33;
    }
    if (self->_delayedTrigger) {
      [(id)v36[5] setExtraDelayMs:self->_extraDelayMs];
    }
    double delayedTargetTimeDefault = self->_delayedTargetTimeDefault;
    if (delayedTargetTimeDefault > 0.0 && delayedTargetTimeDefault <= a4 && !self->_hasHadDelayedDefaultResult)
    {
      v18 = CSLogCategoryEP;
      if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
        _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Reached delayed trigger target time for default endpointer", buf, 0xCu);
      }
      self->_hasHadDelayedDefaultResult = 1;
      [(id)v36[5] setDidDefaultEndpointerFire:1];
    }
    double delayedTargetTimeRelaxed = self->_delayedTargetTimeRelaxed;
    if (delayedTargetTimeRelaxed <= 0.0 || delayedTargetTimeRelaxed > a4)
    {
      double continuityEndTargetTime = self->_continuityEndTargetTime;
      if (continuityEndTargetTime <= 0.0 || continuityEndTargetTime > a4)
      {
        outputNodes = self->_outputNodes;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke_144;
        v28[3] = &unk_1E61FF420;
        v30 = self;
        v31 = &v35;
        id v29 = v16;
        double v32 = a4;
        [(NSArray *)outputNodes enumerateObjectsUsingBlock:v28];
        v11[2](v11, v36[5]);

        goto LABEL_34;
      }
      v20 = CSLogCategoryEP;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 136315138;
      v44 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
      v21 = "%s Reached continuity window end time - force endpointing";
    }
    else
    {
      v20 = CSLogCategoryEP;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        [(id)v36[5] setDidRelaxedEndpointerFire:1];
LABEL_33:
        v11[2](v11, v36[5]);
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      *(_DWORD *)buf = 136315138;
      v44 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
      v21 = "%s Reached delayed trigger target time for relaxed endpointer - force endpointing";
    }
    _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    goto LABEL_32;
  }
  [(id)v36[5] setDidDefaultEndpointerFire:1];
  [(id)v36[5] setDidRelaxedEndpointerFire:1];
  [(id)v36[5] setDidForceEndpoint:1];
LABEL_4:
  v11[2](v11, v36[5]);
LABEL_36:
  _Block_object_dispose(&v35, 8);
}

uint64_t __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke_144(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 featureValueForName:v7];
  id v9 = [v8 multiArrayValue];

  int v10 = [v7 isEqualToString:@"var_127"];
  if (v10)
  {
    v11 = [v9 convert1dMLMultiArrayToNSArray];
    if ([v11 count] != 2)
    {
      v28 = CSLogCategoryEP;
      if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v39 = 136315138;
        *(void *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
        _os_log_error_impl(&dword_1BA1A5000, v28, OS_LOG_TYPE_ERROR, "%s Model output had unexpected size", v39, 0xCu);
      }
      *a4 = 1;
      goto LABEL_35;
    }
    int v12 = [v11 objectAtIndex:0];
    [v12 floatValue];
    float v14 = v13;

    double v15 = [v11 objectAtIndex:1];
    [v15 floatValue];
    int v17 = v16;

    *(float *)&double v18 = v14;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPartialScore:v18];
    LODWORD(v19) = v17;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRcScore:v19];
    *(float *)&double v20 = v14;
    LODWORD(v21) = v17;
    if ([*(id *)(a1 + 40) _didRelaxedEndpointerFireWithPartialScore:v20 rcScore:v21])
    {
      uint64_t v24 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v24 + 8))
      {
        double v22 = *(double *)(v24 + 72);
        if (v22 < 0.0)
        {
          *(double *)(v24 + 72) = *(double *)(a1 + 56) + (double)*(int *)(v24 + 28);
          v25 = CSLogCategoryEP;
          if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 72);
            *(_DWORD *)v39 = 136315394;
            *(void *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
            *(_WORD *)&v39[12] = 2048;
            *(void *)&v39[14] = v26;
            _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, "%s Using delayed trigger logic for relaxed endpointer - target time: %f", v39, 0x16u);
          }
        }
      }
      else
      {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDidRelaxedEndpointerFire:1];
      }
    }
    *(float *)&double v22 = v14;
    LODWORD(v23) = v17;
    if ([*(id *)(a1 + 40) _didDefaultEndpointerFireWithPartialScore:v22 rcScore:v23])
    {
      uint64_t v30 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v30 + 8) && !*(unsigned char *)(v30 + 9))
      {
        double v29 = *(double *)(v30 + 64);
        if (v29 >= 0.0) {
          goto LABEL_27;
        }
        *(double *)(v30 + 64) = *(double *)(a1 + 56) + (double)*(int *)(v30 + 28);
        double v32 = CSLogCategoryEP;
        if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 64);
        *(_DWORD *)v39 = 136315394;
        *(void *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
        *(_WORD *)&v39[12] = 2048;
        *(void *)&v39[14] = v35;
        id v34 = "%s Using delayed trigger logic for default endpointer - target time: %f";
      }
      else
      {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDidDefaultEndpointerFire:1];
        uint64_t v31 = *(void *)(a1 + 40);
        double v29 = *(double *)(v31 + 88);
        if (v29 >= 0.0) {
          goto LABEL_27;
        }
        if (*(int *)(v31 + 32) < 1) {
          goto LABEL_27;
        }
        if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) didRelaxedEndpointerFire]) {
          goto LABEL_27;
        }
        *(double *)(*(void *)(a1 + 40) + 88) = *(double *)(a1 + 56) + (double)*(int *)(*(void *)(a1 + 40) + 32);
        double v32 = CSLogCategoryEP;
        if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 88);
        *(_DWORD *)v39 = 136315394;
        *(void *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
        *(_WORD *)&v39[12] = 2048;
        *(void *)&v39[14] = v33;
        id v34 = "%s Entering continuity window - target time for continuity end: %f";
      }
      _os_log_impl(&dword_1BA1A5000, v32, OS_LOG_TYPE_DEFAULT, v34, v39, 0x16u);
    }
LABEL_27:
    *(float *)&double v29 = v14;
    if (objc_msgSend(*(id *)(a1 + 40), "_didDetectSpeechWithPartialScore:", v29, *(_OWORD *)v39, *(void *)&v39[16], v40))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSpeechArrivalDetected:1];
      *(void *)(*(void *)(a1 + 40) + 88) = 0xBFF0000000000000;
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) didEndpointerFire])
    {
      uint64_t v37 = *(void *)(a1 + 40);
      if (v14 >= *(float *)(v37 + 12) || v14 >= *(float *)(v37 + 20))
      {
        v38 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(float *)&double v36 = v14;
      }
      else
      {
        v38 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        LODWORD(v36) = v17;
      }
      [v38 setEndpointPosterior:v36];
    }
LABEL_35:

    goto LABEL_36;
  }
  v27 = CSLogCategoryEP;
  if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v39 = 136315394;
    *(void *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
    *(_WORD *)&v39[12] = 2112;
    *(void *)&v39[14] = @"var_127";
    _os_log_error_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_ERROR, "%s Model had unexpected output vector name - should be %@", v39, 0x16u);
  }
  *a4 = 1;
LABEL_36:
}

- (void)_extractModelSpecs
{
  id v3 = [(MLModel *)self->_endpointerModel modelDescription];
  v4 = [v3 inputDescriptionsByName];
  inputSpecs = self->_inputSpecs;
  self->_inputSpecs = v4;

  id v6 = [(MLModel *)self->_endpointerModel modelDescription];
  id v10 = [v6 outputDescriptionsByName];

  id v7 = [v10 allKeys];
  id v8 = (NSArray *)[v7 copy];
  outputNodes = self->_outputNodes;
  self->_outputNodes = v8;
}

- (CSEnhancedEndpointer)initWithModelFile:(id)a3 defaultThresholdPartial:(float)a4 defaultThresholdRC:(float)a5 relaxedThresholdPartial:(float)a6 relaxedThresholdRC:(float)a7 extraDelayMs:(int)a8 continuityWindowDuration:(int)a9 speechDetectedThreshold:(float)a10
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CSEnhancedEndpointer;
  double v19 = [(CSEnhancedEndpointer *)&v48 init];
  double v20 = v19;
  if (!v19) {
    goto LABEL_15;
  }
  v19->_defaultThresholdPartial = a4;
  v19->_defaultThresholdRC = a5;
  v19->_relaxedThresholdPartial = a6;
  v19->_relaxedThresholdRC = a7;
  v19->_extraDelayMs = a8;
  v19->_continuityWindowDuration = a9;
  v19->_speechDetectedThreshold = a10;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&v19->_double delayedTargetTimeDefault = _Q0;
  v19->_double continuityEndTargetTime = -1.0;
  uint64_t v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1E988]);
  [v27 setComputeUnits:0];
  id v47 = 0;
  uint64_t v28 = [MEMORY[0x1E4F1E970] modelWithContentsOfURL:v26 configuration:v27 error:&v47];
  id v29 = v47;
  endpointerModel = v20->_endpointerModel;
  v20->_endpointerModel = (MLModel *)v28;

  if (v20->_endpointerModel)
  {
    [(CSEnhancedEndpointer *)v20 _extractModelSpecs];
    uint64_t v31 = [(NSDictionary *)v20->_inputSpecs objectForKeyedSubscript:@"x_1"];
    double v32 = [v31 multiArrayConstraint];

    uint64_t v33 = [v32 shape];
    id v46 = v29;
    uint64_t v34 = +[CSEnhancedEndpointerInputVectorFactory inputVectorWithShape:dataType:error:](_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorFactory, "inputVectorWithShape:dataType:error:", v33, [v32 dataType], &v46);
    id v35 = v46;

    inputVector = v20->_inputVector;
    v20->_inputVector = (_TtP20CoreSpeechFoundation31CSEnhancedEndpointerInputVector_ *)v34;

    if (!v20->_inputVector || v35)
    {
      v39 = (void *)CSLogCategoryEP;
      if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
      {
        v44 = v39;
        __int16 v45 = [v35 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v50 = "-[CSEnhancedEndpointer initWithModelFile:defaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartia"
              "l:relaxedThresholdRC:extraDelayMs:continuityWindowDuration:speechDetectedThreshold:]";
        __int16 v51 = 2112;
        v52 = v45;
        _os_log_error_impl(&dword_1BA1A5000, v44, OS_LOG_TYPE_ERROR, "%s Unable to create input vector. Error: %@", buf, 0x16u);
      }
      int v37 = 1;
    }
    else
    {
      int v37 = 0;
    }
  }
  else
  {
    v38 = (void *)CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      id v42 = v38;
      v43 = [v29 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v50 = "-[CSEnhancedEndpointer initWithModelFile:defaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:"
            "relaxedThresholdRC:extraDelayMs:continuityWindowDuration:speechDetectedThreshold:]";
      __int16 v51 = 2114;
      v52 = v43;
      _os_log_error_impl(&dword_1BA1A5000, v42, OS_LOG_TYPE_ERROR, "%s Unable to create MLModel with err %{public}@", buf, 0x16u);
    }
    int v37 = 1;
    id v35 = v29;
  }

  if (v37) {
    uint64_t v40 = 0;
  }
  else {
LABEL_15:
  }
    uint64_t v40 = v20;

  return v40;
}

@end