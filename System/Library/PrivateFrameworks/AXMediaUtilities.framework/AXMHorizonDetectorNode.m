@interface AXMHorizonDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMHorizonDetectorNode)initWithCoder:(id)a3;
- (BOOL)requiresVisionFramework;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (VNDetectHorizonRequest)_detectHorizonRequest;
- (void)_setDetectHorizonRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMHorizonDetectorNode

- (void)nodeInitialize
{
  v2.receiver = self;
  v2.super_class = (Class)AXMHorizonDetectorNode;
  [(AXMEvaluationNode *)&v2 nodeInitialize];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMHorizonDetectorNode)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMHorizonDetectorNode;
  return [(AXMEvaluationNode *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXMHorizonDetectorNode;
  [(AXMEvaluationNode *)&v3 encodeWithCoder:a3];
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
  return @"Horizon Detector";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNDetectHorizonRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMHorizonDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    objc_super v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMHorizonDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AXMHorizonDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v17 evaluate:v6 metrics:v7];
  v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  v10 = [(AXMHorizonDetectorNode *)self _detectHorizonRequest];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)getVNDetectHorizonRequestClass());
    [(AXMHorizonDetectorNode *)self _setDetectHorizonRequest:v11];
  }
  v12 = [(AXMHorizonDetectorNode *)self _detectHorizonRequest];
  v18[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [(AXMEvaluationNode *)self evaluateRequests:v13 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];

  v14 = [v12 results];
  v15 = [v14 firstObject];

  if (v15)
  {
    [v6 size];
    v16 = +[AXMVisionFeature featureWithVisionRequest:horizonResult:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:horizonResult:canvasSize:", v12, v15);
    [v6 appendFeature:v16];
  }
}

- (VNDetectHorizonRequest)_detectHorizonRequest
{
  return self->__detectHorizonRequest;
}

- (void)_setDetectHorizonRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNDetectHorizonRequestSoft was nil", v1, 2u);
}

@end