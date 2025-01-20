@interface AXMNSFWDetectorNode
+ (BOOL)addNSFWResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6;
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMNSFWDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v3 = (unint64_t)[v2 physicalMemory] > 0x773593FF;

  return v3;
}

+ (id)title
{
  return @"NSFW Detector";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNVYvzEtX1JlUdu8xx5qhDIClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMNSFWDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMNSFWDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXMNSFWDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v26 evaluate:v6 metrics:v7];
  context = (void *)MEMORY[0x1BA9A10B0](v8);
  request = self->_request;
  if (!request)
  {
    v10 = (VNVYvzEtX1JlUdu8xx5qhDI *)objc_alloc_init((Class)getVNVYvzEtX1JlUdu8xx5qhDIClass());
    v11 = self->_request;
    self->_request = v10;

    request = self->_request;
  }
  v28[0] = request;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [(AXMEvaluationNode *)self evaluateRequests:v12 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = [(VNVYvzEtX1JlUdu8xx5qhDI *)self->_request results];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v19 = [v18 identifier];
        [v18 confidence];
        +[AXMNSFWDetectorNode addNSFWResultToContext:v6 forIdentifier:v19 confidence:0 markAsSensitiveCaptionContent:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }
}

+ (BOOL)addNSFWResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v11 = (void *)getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr;
  uint64_t v24 = getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr;
  if (!getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr)
  {
    v12 = (void *)VisionLibrary_5();
    v22[3] = (uint64_t)dlsym(v12, "VN81aedeb999c79d74e79af7f1c922cf97");
    getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr = v22[3];
    v11 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v11)
  {
    float v20 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v20);
  }
  int v13 = [v10 isEqualToString:*v11];
  if (v13)
  {
    [v9 size];
    double v16 = v15;
    float v14 = a5;
    *(float *)&double v15 = v14;
    v18 = +[AXMVisionFeature nsfwClassificationWithCategory:@"NSFW Explicit", v15, v16, v17 confidence canvasSize];
    [v18 setCaptionMayContainSensitiveContent:v6];
    [v9 appendFeature:v18];
  }
  return v13;
}

- (void).cxx_destruct
{
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNClassifyNSFWImageRequestSoft was nil", v1, 2u);
}

@end