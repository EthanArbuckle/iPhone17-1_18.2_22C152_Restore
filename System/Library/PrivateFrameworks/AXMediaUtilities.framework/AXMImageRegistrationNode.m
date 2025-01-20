@interface AXMImageRegistrationNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (BOOL)requiresVisionFramework;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (id)_translationalImageRegistrationRequestForInput:(id)a3;
- (int64_t)registrationState;
- (void)_recordTransposition:(CGPoint)a3;
- (void)_resetImageRegistration;
- (void)_resetTranspositionHistory;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMImageRegistrationNode

- (void)nodeInitialize
{
  v3.receiver = self;
  v3.super_class = (Class)AXMImageRegistrationNode;
  [(AXMEvaluationNode *)&v3 nodeInitialize];
  [(AXMImageRegistrationNode *)self _resetTranspositionHistory];
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
  return @"Image Registration";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNTranslationalImageRegistrationRequestClass())
  {
    if (getVNImageTranslationAlignmentObservationClass())
    {
      v19.receiver = self;
      v19.super_class = (Class)AXMImageRegistrationNode;
      return [(AXMVisionEngineNode *)&v19 validateVisionKitSoftLinkSymbols];
    }
    v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(AXMImageRegistrationNode *)v4 validateVisionKitSoftLinkSymbols];
    }
  }
  else
  {
    v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(AXMImageRegistrationNode *)v4 validateVisionKitSoftLinkSymbols];
    }
  }

  return 0;
}

- (id)_translationalImageRegistrationRequestForInput:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 inputType];
  switch(v4)
  {
    case 2:
      id v8 = objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass());
      uint64_t v6 = [v3 URL];
      uint64_t v7 = [v8 initWithTargetedImageURL:v6 options:MEMORY[0x1E4F1CC08]];
      goto LABEL_6;
    case 1:
      id v10 = objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass());
      uint64_t v6 = [v3 pixelBuffer];
      uint64_t v11 = [v6 pixelBuffer];
      uint64_t v12 = [v3 pixelBuffer];
      uint64_t v13 = [v12 orientation];
      uint64_t v9 = (void *)[v10 initWithTargetedCVPixelBuffer:v11 orientation:v13 options:MEMORY[0x1E4F1CC08]];

      goto LABEL_8;
    case 0:
      id v5 = objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass());
      uint64_t v6 = [v3 ciImage];
      uint64_t v7 = [v5 initWithTargetedCIImage:v6 options:MEMORY[0x1E4F1CC08]];
LABEL_6:
      uint64_t v9 = (void *)v7;
LABEL_8:

      goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)AXMImageRegistrationNode;
  id v8 = [(AXMEvaluationNode *)&v40 evaluate:v6 metrics:v7];
  uint64_t v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  p_previousInput = &self->_previousInput;
  objc_storeStrong((id *)&self->_previousInput, self->_currentInput);
  uint64_t v11 = [v6 sourceInput];
  currentInput = self->_currentInput;
  self->_currentInput = v11;

  if (self->_previousInput)
  {
    uint64_t v13 = [v6 sequenceRequestManager];
    uint64_t v14 = [v13 sequenceRequestHandler];

    if (!v14)
    {
      v20 = AXMediaLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[AXMImageRegistrationNode evaluate:metrics:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
      goto LABEL_22;
    }
    uint64_t v15 = [(AXMImageRegistrationNode *)self _translationalImageRegistrationRequestForInput:self->_currentInput];
    if (v15)
    {
      uint64_t v16 = [(AXMPipelineContextInput *)*p_previousInput inputType];
      if (v16 == 1)
      {
        v42[0] = v15;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
        v30 = [(AXMPipelineContextInput *)*p_previousInput pixelBuffer];
        uint64_t v37 = [v30 pixelBuffer];
        v31 = [(AXMPipelineContextInput *)*p_previousInput pixelBuffer];
        id v39 = 0;
        LOBYTE(v37) = objc_msgSend(v14, "performRequests:onCVPixelBuffer:orientation:error:", v29, v37, objc_msgSend(v31, "orientation"), &v39);
        v20 = v39;

        if (v37)
        {
LABEL_16:
          v32 = [v15 results];
          v33 = [v32 firstObject];
          getVNImageTranslationAlignmentObservationClass();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v35 = [v15 results];
            v36 = [v35 firstObject];

            if (v36) {
              [v36 alignmentTransform];
            }
            -[AXMImageRegistrationNode _recordTransposition:](self, "_recordTransposition:", 0.0, 0.0);
          }
          [v6 setImageRegistrationState:self->_registrationState];
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
LABEL_12:
        v28 = AXMediaLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[AXMTraitDetectorNode evaluate:metrics:]((uint64_t)v20, v28);
        }

        goto LABEL_21;
      }
      if (!v16)
      {
        v41 = v15;
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
        uint64_t v18 = [(AXMPipelineContextInput *)*p_previousInput ciImage];
        id v38 = 0;
        char v19 = [v14 performRequests:v17 onCIImage:v18 error:&v38];
        v20 = v38;

        if (v19) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
    }
    v20 = 0;
    goto LABEL_12;
  }
  [(AXMImageRegistrationNode *)self _resetTranspositionHistory];
LABEL_23:
}

- (void)_resetTranspositionHistory
{
  self->_fillingHistoryBuffer = 1;
  self->_transpositionHistoryLastRecordedIndex = 0;
  self->_transpositionHistoryCircularBuffer[8] = 0u;
  self->_transpositionHistoryCircularBuffer[9] = 0u;
  self->_transpositionHistoryCircularBuffer[6] = 0u;
  self->_transpositionHistoryCircularBuffer[7] = 0u;
  self->_transpositionHistoryCircularBuffer[4] = 0u;
  self->_transpositionHistoryCircularBuffer[5] = 0u;
  self->_transpositionHistoryCircularBuffer[2] = 0u;
  self->_transpositionHistoryCircularBuffer[3] = 0u;
  self->_transpositionHistoryCircularBuffer[0] = 0u;
  self->_transpositionHistoryCircularBuffer[1] = 0u;
  self->_registrationState = 0;
}

- (void)_resetImageRegistration
{
  previousInput = self->_previousInput;
  self->_previousInput = 0;

  currentInput = self->_currentInput;
  self->_currentInput = 0;

  [(AXMImageRegistrationNode *)self _resetTranspositionHistory];
}

- (void)_recordTransposition:(CGPoint)a3
{
  unint64_t v3 = (self->_transpositionHistoryLastRecordedIndex + 1) % 0xA;
  self->_transpositionHistoryLastRecordedIndex = v3;
  self->_transpositionHistoryCircularBuffer[v3] = a3;
  if (self->_fillingHistoryBuffer)
  {
    if (v3)
    {
      int64_t v4 = 1;
      goto LABEL_14;
    }
    self->_fillingHistoryBuffer = 0;
  }
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    id v7 = &self->_transpositionHistoryCircularBuffer[v5];
    float64x2x2_t v9 = vld2q_f64(&v7->x);
    v9.val[0] = vsqrtq_f64(vmlaq_f64(vmulq_f64(v9.val[1], v9.val[1]), v9.val[0], v9.val[0]));
    double v6 = v6 + v9.val[0].f64[0] + v9.val[0].f64[1];
    v5 += 2;
  }
  while (v5 != 10);
  double v8 = v6 / 10.0;
  if (v8 >= 30.0)
  {
    if (v8 >= 70.0)
    {
      if (v8 >= 300.0) {
        int64_t v4 = 2;
      }
      else {
        int64_t v4 = 3;
      }
    }
    else
    {
      int64_t v4 = 4;
    }
  }
  else
  {
    int64_t v4 = 5;
  }
LABEL_14:
  self->_registrationState = v4;
}

- (int64_t)registrationState
{
  return self->_registrationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInput, 0);

  objc_storeStrong((id *)&self->_previousInput, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end