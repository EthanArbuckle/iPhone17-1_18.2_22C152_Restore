@interface AXMProminentObjectsDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMProminentObjectsDetectorNode)initWithCoder:(id)a3;
- (BOOL)requiresVisionFramework;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (VNGenerateAttentionBasedSaliencyImageRequest)_imageSaliencyRequest;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)set_imageSaliencyRequest:(id)a3;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMProminentObjectsDetectorNode

- (void)nodeInitialize
{
  v2.receiver = self;
  v2.super_class = (Class)AXMProminentObjectsDetectorNode;
  [(AXMEvaluationNode *)&v2 nodeInitialize];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMProminentObjectsDetectorNode)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMProminentObjectsDetectorNode;
  return [(AXMEvaluationNode *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXMProminentObjectsDetectorNode;
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
  return @"Prominent Object Detector";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNGenerateAttentionBasedSaliencyImageRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMProminentObjectsDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    objc_super v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMProminentObjectsDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXMProminentObjectsDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v26 evaluate:v6 metrics:v7];
  v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  v10 = [(AXMProminentObjectsDetectorNode *)self _imageSaliencyRequest];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)getVNGenerateAttentionBasedSaliencyImageRequestClass());
    [(AXMProminentObjectsDetectorNode *)self set_imageSaliencyRequest:v11];

    v12 = [(AXMProminentObjectsDetectorNode *)self _imageSaliencyRequest];
    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:v12];
  }
  v13 = [(AXMProminentObjectsDetectorNode *)self _imageSaliencyRequest];
  v27[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [(AXMEvaluationNode *)self evaluateRequests:v14 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];

  v15 = [v13 results];
  v16 = [v15 firstObject];

  v17 = [v16 salientObjects];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __52__AXMProminentObjectsDetectorNode_evaluate_metrics___block_invoke;
  v23 = &unk_1E6118588;
  id v24 = v16;
  id v18 = v6;
  id v25 = v18;
  id v19 = v16;
  [v17 enumerateObjectsUsingBlock:&v20];
  objc_msgSend(v18, "addEvaluatedFeatureType:", 19, v20, v21, v22, v23);
}

void __52__AXMProminentObjectsDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, void *a2)
{
  id v29 = a2;
  [v29 boundingBox];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [*(id *)(a1 + 32) narrowedBoundingBox];
  v33.origin.x = v11;
  v33.origin.y = v12;
  v33.size.width = v13;
  v33.size.height = v14;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  CGRect v32 = CGRectIntersection(v31, v33);
  if (!CGRectIsEmpty(v32))
  {
    [v29 boundingBox];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = 1.0 - v21 - v19;
    [*(id *)(a1 + 40) size];
    double v24 = v23;
    double v26 = v25;
    [v29 confidence];
    v28 = +[AXMVisionFeature prominentObjectWithBoundingBox:canvasSize:confidence:](AXMVisionFeature, "prominentObjectWithBoundingBox:canvasSize:confidence:", v16, v22, v18, v20, v24, v26, v27);
    [*(id *)(a1 + 40) appendFeature:v28];
  }
}

- (VNGenerateAttentionBasedSaliencyImageRequest)_imageSaliencyRequest
{
  return self->__imageSaliencyRequest;
}

- (void)set_imageSaliencyRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNGenerateAttentionBasedSaliencyImageRequestSoft was nil", v1, 2u);
}

@end