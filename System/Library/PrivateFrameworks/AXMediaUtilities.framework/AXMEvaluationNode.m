@interface AXMEvaluationNode
+ (BOOL)isANEDeviceAvailable;
+ (BOOL)supportsSecureCoding;
+ (CGSize)preferredModelInputSize;
+ (unint64_t)defaultPriority;
+ (void)configureForRunningOnANEIfPossibleWithRequest:(id)a3;
- (AXMEvaluationNode)initWithCoder:(id)a3;
- (BOOL)evaluateRequests:(id)a3 withContext:(id)a4 requestHandlerOptions:(id)a5 metrics:(id)a6 error:(id *)a7;
- (BOOL)shouldEvaluate:(id)a3;
- (double)minimumConfidence;
- (id)_diagnosticNameForRequests:(id)a3 metrics:(id)a4;
- (unint64_t)effectivePriority;
- (unint64_t)priority;
- (void)boostEffectivePriority;
- (void)encodeWithCoder:(id)a3;
- (void)nodeInitialize;
- (void)resetEffectivePriority;
- (void)setEffectivePriority:(unint64_t)a3;
- (void)setMinimumConfidence:(double)a3;
- (void)setPriority:(unint64_t)a3;
@end

@implementation AXMEvaluationNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMEvaluationNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMEvaluationNode;
  v5 = [(AXMVisionEngineNode *)&v7 initWithCoder:v4];
  if (v5)
  {
    -[AXMEvaluationNode setPriority:](v5, "setPriority:", [v4 decodeIntegerForKey:@"priority"]);
    if (![(AXMEvaluationNode *)v5 priority]) {
      -[AXMEvaluationNode setPriority:](v5, "setPriority:", [(id)objc_opt_class() defaultPriority]);
    }
    [v4 decodeDoubleForKey:@"minimumConfidence"];
    -[AXMEvaluationNode setMinimumConfidence:](v5, "setMinimumConfidence:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMEvaluationNode;
  id v4 = a3;
  [(AXMVisionEngineNode *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMEvaluationNode priority](self, "priority", v5.receiver, v5.super_class), @"priority");
  [(AXMEvaluationNode *)self minimumConfidence];
  objc_msgSend(v4, "encodeDouble:forKey:", @"minimumConfidence");
}

- (void)nodeInitialize
{
  v3.receiver = self;
  v3.super_class = (Class)AXMEvaluationNode;
  [(AXMVisionEngineNode *)&v3 nodeInitialize];
  self->_priority = [(id)objc_opt_class() defaultPriority];
  self->_effectivePriority = 0;
  self->_minimumConfidence = 0.0;
}

+ (CGSize)preferredModelInputSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)isANEDeviceAvailable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = MLAllComputeDevicesSoft();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    objc_super v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;

          objc_super v5 = v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5 != 0;
}

+ (void)configureForRunningOnANEIfPossibleWithRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = MLAllComputeDevicesSoft();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5)
  {
    objc_super v7 = v4;
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  objc_super v7 = 0;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;

        objc_super v7 = v11;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);

  if (v7)
  {
    objc_msgSend(v3, "setComputeDevice:forComputeStage:", v7, *MEMORY[0x1E4F45BB8], (void)v12);
LABEL_13:
  }
}

+ (unint64_t)defaultPriority
{
  return 15;
}

- (void)boostEffectivePriority
{
  self->_effectivePriority += [(AXMEvaluationNode *)self priority];
}

- (void)resetEffectivePriority
{
  self->_effectivePriority = 0;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_minimumConfidence = fmax(fmin(a3, 1.0), 0.0);
}

- (BOOL)shouldEvaluate:(id)a3
{
  return 1;
}

- (BOOL)evaluateRequests:(id)a3 withContext:(id)a4 requestHandlerOptions:(id)a5 metrics:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v14) {
    [v13 visionImageRequestHandlerWithOptions:v14];
  }
  else {
  uint64_t v16 = [v13 visionImageRequestHandler];
  }
  if (v16)
  {
    [v12 enumerateObjectsUsingBlock:&__block_literal_global_27];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v17 = [(AXMEvaluationNode *)self _diagnosticNameForRequests:v12 metrics:v15];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __86__AXMEvaluationNode_evaluateRequests_withContext_requestHandlerOptions_metrics_error___block_invoke_2;
    v23[3] = &unk_1E6118790;
    v26 = &v27;
    id v24 = v16;
    id v25 = v12;
    v18 = [v15 measure:v17 tryExecute:v23];

    if (!*((unsigned char *)v28 + 24))
    {
      v19 = AXMediaLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AXMTraitDetectorNode evaluate:metrics:]((uint64_t)v18, v19);
      }

      if (a7) {
        *a7 = v18;
      }
    }
    BOOL v20 = *((unsigned char *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v21 = AXMediaLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](v21);
    }

    BOOL v20 = 0;
  }

  return v20;
}

uint64_t __86__AXMEvaluationNode_evaluateRequests_withContext_requestHandlerOptions_metrics_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setModelFileBackingStore:1];
}

id __86__AXMEvaluationNode_evaluateRequests_withContext_requestHandlerOptions_metrics_error___block_invoke_2(void *a1)
{
  double v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  char v4 = [v2 performRequests:v3 error:&v7];
  id v5 = v7;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;

  return v5;
}

- (id)_diagnosticNameForRequests:(id)a3 metrics:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a4 measurementsEnabled])
  {
    uint64_t v6 = [MEMORY[0x1E4F28E78] stringWithString:@"Vision:"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (objc_class *)objc_opt_class();
          id v13 = NSStringFromClass(v12);
          [(__CFString *)v6 appendFormat:@"%@|", v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v6 = @"VN PerformRequests";
  }

  return v6;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)effectivePriority
{
  return self->_effectivePriority;
}

- (void)setEffectivePriority:(unint64_t)a3
{
  self->_effectivePriority = a3;
}

- (void)evaluateRequests:(os_log_t)log withContext:requestHandlerOptions:metrics:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. requestHandler was nil", v1, 2u);
}

@end