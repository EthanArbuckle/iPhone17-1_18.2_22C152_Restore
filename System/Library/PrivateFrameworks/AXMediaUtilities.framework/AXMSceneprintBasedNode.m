@interface AXMSceneprintBasedNode
+ (id)title;
- (BOOL)requiresVisionFramework;
- (void)evaluate:(id)a3 metrics:(id)a4;
@end

@implementation AXMSceneprintBasedNode

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return @"Sceneprint Creator";
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AXMSceneprintBasedNode;
  id v8 = [(AXMEvaluationNode *)&v17 evaluate:v6 metrics:v7];
  v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke;
  v12[3] = &unk_1E6118288;
  objc_copyWeak(&v15, &location);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v10 createSceneObservationIfNilWithBlock:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (getVNCreateSceneprintRequestClass())
  {
    v2 = objc_alloc_init((Class)getVNCreateSceneprintRequestClass());
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v8[0] = v2;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [WeakRetained evaluateRequests:v4 withContext:*(void *)(a1 + 32) requestHandlerOptions:0 metrics:*(void *)(a1 + 40) error:0];

    v5 = [v2 results];
    id v6 = [v5 firstObject];
  }
  else
  {
    v2 = AXMediaLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke_cold_1(v2);
    }
    id v6 = 0;
  }

  return v6;
}

void __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNCreateSceneprintRequestSoft was nil", v1, 2u);
}

@end