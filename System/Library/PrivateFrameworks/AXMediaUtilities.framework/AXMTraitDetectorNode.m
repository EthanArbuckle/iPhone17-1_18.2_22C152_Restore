@interface AXMTraitDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (BOOL)requiresVisionFramework;
- (BOOL)shouldEvaluateColorInformation;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (double)colorDistanceTheshold;
- (id)_blurValueForVisionObservation:(id)a3;
- (id)_brightnessValueForVisionObservation:(id)a3;
- (int64_t)sampleFrequency;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)setColorDistanceTheshold:(double)a3;
- (void)setSampleFrequency:(int64_t)a3;
- (void)setShouldEvaluateColorInformation:(BOOL)a3;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMTraitDetectorNode

- (void)nodeInitialize
{
  v3.receiver = self;
  v3.super_class = (Class)AXMTraitDetectorNode;
  [(AXMEvaluationNode *)&v3 nodeInitialize];
  self->_shouldEvaluateColorInformation = 0;
  self->_colorDistanceTheshold = 5.0;
  self->_sampleFrequency = 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return @"Traits";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNImageScoreObservationClass())
  {
    if (getVNImageBrightnessObservationClass())
    {
      if (getVNImageBlurObservationClass())
      {
        v5.receiver = self;
        v5.super_class = (Class)AXMTraitDetectorNode;
        return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
      }
      v4 = AXMediaLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols]();
      }
    }
    else
    {
      v4 = AXMediaLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols]();
      }
    }
  }
  else
  {
    v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols]();
    }
  }

  return 0;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)AXMTraitDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v27 evaluate:v6 metrics:v7];
  v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  if ([(AXMTraitDetectorNode *)self shouldEvaluateColorInformation]) {
    [(AXMTraitDetectorNode *)self _evaluateColorInformation:v6];
  }
  v10 = [v6 visionImageRequestHandler];
  if (v10)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v11 = (void *)getVNImageBlurScoreRequestClass_softClass;
    uint64_t v32 = getVNImageBlurScoreRequestClass_softClass;
    if (!getVNImageBlurScoreRequestClass_softClass)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __getVNImageBlurScoreRequestClass_block_invoke;
      v28[3] = &unk_1E6116AD8;
      v28[4] = &v29;
      __getVNImageBlurScoreRequestClass_block_invoke((uint64_t)v28);
      v11 = (void *)v30[3];
    }
    v12 = v11;
    _Block_object_dispose(&v29, 8);
    id v13 = objc_alloc_init(v12);
    v33[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v26 = 0;
    char v15 = [v10 performRequests:v14 error:&v26];
    v16 = v26;
    if (v15)
    {
      v17 = [v13 results];
      v18 = [v17 firstObject];
      v19 = [(AXMTraitDetectorNode *)self _blurValueForVisionObservation:v18];

      if (v19)
      {
        [v19 floatValue];
        int v21 = v20;
        [v6 size];
        double v23 = v22;
        LODWORD(v22) = v21;
        v25 = +[AXMVisionFeature featureWithVisionRequest:blurValue:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:blurValue:canvasSize:", v13, v22, v23, v24);
        [v6 appendFeature:v25];
      }
    }
    else
    {
      v19 = AXMediaLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AXMTraitDetectorNode evaluate:metrics:]((uint64_t)v16, v19);
      }
    }
  }
  else
  {
    v16 = AXMediaLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AXMTraitDetectorNode evaluate:metrics:]();
    }
  }
}

- (id)_brightnessValueForVisionObservation:(id)a3
{
  id v3 = a3;
  getVNImageBrightnessObservationClass();
  if (objc_opt_isKindOfClass())
  {
    v4 = NSNumber;
    [v3 brightness];
    uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  getVNImageScoreObservationClass();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 exposureScore];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)_blurValueForVisionObservation:(id)a3
{
  id v3 = a3;
  getVNImageBlurObservationClass();
  if (objc_opt_isKindOfClass())
  {
    v4 = NSNumber;
    [v3 blurMeasure];
    uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  getVNImageScoreObservationClass();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 blurScore];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (int64_t)sampleFrequency
{
  return self->_sampleFrequency;
}

- (void)setSampleFrequency:(int64_t)a3
{
  self->_sampleFrequency = a3;
}

- (BOOL)shouldEvaluateColorInformation
{
  return self->_shouldEvaluateColorInformation;
}

- (void)setShouldEvaluateColorInformation:(BOOL)a3
{
  self->_shouldEvaluateColorInformation = a3;
}

- (double)colorDistanceTheshold
{
  return self->_colorDistanceTheshold;
}

- (void)setColorDistanceTheshold:(double)a3
{
  self->_colorDistanceTheshold = a3;
}

- (void)validateVisionKitSoftLinkSymbols
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. VNImageBlurObservationSoft was nil", v2, v3, v4, v5, v6);
}

- (void)evaluate:metrics:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. requestHandler was nil", v2, v3, v4, v5, v6);
}

- (void)evaluate:(uint64_t)a1 metrics:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Could not evaluate: %@", (uint8_t *)&v2, 0xCu);
}

@end