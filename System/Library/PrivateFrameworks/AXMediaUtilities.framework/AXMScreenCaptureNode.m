@interface AXMScreenCaptureNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMScreenGrabber)screenGrabber;
- (void)nodeInitialize;
- (void)produceImage:(id)a3;
- (void)setScreenGrabber:(id)a3;
- (void)triggerWithScreenCaptureRegion:(CGRect)a3 interfaceOrientation:(int64_t)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7;
@end

@implementation AXMScreenCaptureNode

- (void)nodeInitialize
{
  v3.receiver = self;
  v3.super_class = (Class)AXMScreenCaptureNode;
  [(AXMSourceNode *)&v3 nodeInitialize];
  [(AXMSourceNode *)self setShouldProcessRemotely:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"Screen Capture";
}

- (void)produceImage:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1BA9A10B0]();
  objc_initWeak(&location, v4);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AXMScreenCaptureNode_produceImage___block_invoke;
  v7[3] = &unk_1E6116F90;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v6 produceImage:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __37__AXMScreenCaptureNode_produceImage___block_invoke(id *a1, void *a2, uint64_t a3)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = [v4 objectForKeyedSubscript:@"region"];
  [v5 AXMRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [v4 objectForKeyedSubscript:@"orientation"];

  uint64_t v15 = [v14 integerValue];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v17 = [WeakRetained analysisOptions];
  v18 = [v17 ignoredLayerContextIDs];

  id v19 = objc_loadWeakRetained(a1 + 6);
  v20 = [v19 analysisOptions];
  v21 = [v20 includedLayerContextIDs];

  id v22 = objc_loadWeakRetained(a1 + 6);
  v23 = [v22 analysisOptions];
  v24 = [v23 snapshotLayerID];

  id v25 = objc_loadWeakRetained(a1 + 6);
  v26 = [v25 analysisOptions];
  v27 = [v26 snapshotContextID];

  v28 = [MEMORY[0x1E4F1CA60] dictionary];
  v29 = v28;
  if (v18) {
    [v28 setObject:v18 forKeyedSubscript:@"IgnoredLayerContextIDs"];
  }
  if (v21) {
    [v29 setObject:v21 forKeyedSubscript:@"IncludedLayerContextIDs"];
  }
  if (v24) {
    [v29 setObject:v24 forKeyedSubscript:@"SnapshotLayerID"];
  }
  if (v27) {
    [v29 setObject:v27 forKeyedSubscript:@"SnapshotContextID"];
  }
  id v30 = objc_loadWeakRetained(a1 + 6);
  v31 = [v30 analysisOptions];
  char v32 = [v31 preserveInputImageSize];

  if ((v32 & 1) == 0)
  {
    v40[0] = objc_opt_class();
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v29 setObject:v33 forKeyedSubscript:@"UsePreferredModelInputSizeForDetectors"];
  }
  v34 = [a1[4] screenGrabber];
  v35 = [a1[5] pipelineMetric];
  v36 = objc_msgSend(v34, "grabScreenWithRect:orientation:options:metrics:error:", v15, v29, v35, a3, v7, v9, v11, v13);

  v37 = +[AXMPipelineContextInput inputWithCIImage:v36];

  return v37;
}

- (AXMScreenGrabber)screenGrabber
{
  screenGrabber = self->_screenGrabber;
  if (!screenGrabber)
  {
    id v4 = objc_alloc_init(AXMScreenGrabber);
    v5 = self->_screenGrabber;
    self->_screenGrabber = v4;

    screenGrabber = self->_screenGrabber;
  }

  return screenGrabber;
}

- (void)triggerWithScreenCaptureRegion:(CGRect)a3 interfaceOrientation:(int64_t)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25[3] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v15)
  {
    id v15 = +[AXMVisionAnalysisOptions defaultOptions];
  }
  v24[0] = @"region";
  v18 = objc_msgSend(MEMORY[0x1E4F29238], "axmValueWithCGRect:", x, y, width, height);
  v25[0] = v18;
  v24[1] = @"orientation";
  id v19 = [NSNumber numberWithInteger:a4];
  v25[1] = v19;
  v24[2] = @"diagnosticsEnabled";
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v25[2] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  id v22 = +[AXMVisionPipelineContext contextWithSourceParameters:v21 options:v15];
  v23.receiver = self;
  v23.super_class = (Class)AXMScreenCaptureNode;
  [(AXMSourceNode *)&v23 triggerWithContext:v22 cacheKey:v16 resultHandler:v17];
}

- (void)setScreenGrabber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end