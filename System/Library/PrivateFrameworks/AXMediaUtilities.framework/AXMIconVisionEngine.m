@interface AXMIconVisionEngine
+ (id)sharedInstance;
- (AXMBrailleEdgesDetectorNode)brailleEdgeDetector;
- (AXMIconClassDetectorNode)iconClassDetector;
- (AXMIconVisionEngine)initWithIdentifier:(id)a3;
- (AXMImageNode)imageNode;
- (id)classifyImages:(id)a3 withTimeout:(double)a4;
- (void)setBrailleEdgeDetector:(id)a3;
- (void)setIconClassDetector:(id)a3;
- (void)setImageNode:(id)a3;
@end

@implementation AXMIconVisionEngine

- (AXMIconVisionEngine)initWithIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AXMIconVisionEngine;
  v3 = [(AXMVisionEngine *)&v8 initWithIdentifier:a3];
  if (v3)
  {
    if ([(AXMVisionEngine *)v3 canAddSourceNodeClass:objc_opt_class()])
    {
      v4 = [(AXMVisionEngineNode *)[AXMImageNode alloc] initWithIdentifier:@"image"];
      [(AXMVisionEngine *)v3 addSourceNode:v4];
      [(AXMIconVisionEngine *)v3 setImageNode:v4];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v5 = [(AXMMobileAssetEvaluationNode *)[AXMIconClassDetectorNode alloc] initWithIdentifier:@"iconClass"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v5];
      [(AXMIconVisionEngine *)v3 setIconClassDetector:v5];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v6 = [(AXMVisionEngineNode *)[AXMBrailleEdgesDetectorNode alloc] initWithIdentifier:@"brailleEdges"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v6];
      [(AXMIconVisionEngine *)v3 setBrailleEdgeDetector:v6];
    }
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AXMIconVisionEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance__instance;

  return v2;
}

void __37__AXMIconVisionEngine_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithIdentifier:@"SharedIconVision"];
  v2 = (void *)sharedInstance__instance;
  sharedInstance__instance = v1;
}

- (id)classifyImages:(id)a3 withTimeout:(double)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  id v18 = a3;
  if ([v18 count])
  {
    v6 = dispatch_group_create();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v18;
    uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v11 = [MEMORY[0x1E4F1E050] imageWithData:v10];
          v12 = objc_alloc_init(AXMVisionAnalysisOptions);
          [(AXMVisionAnalysisOptions *)v12 setDetectIconClass:1];
          v13 = [(AXMIconVisionEngine *)self imageNode];
          [v13 setShouldProcessRemotely:1];

          dispatch_group_enter(v6);
          v14 = [(AXMIconVisionEngine *)self imageNode];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __50__AXMIconVisionEngine_classifyImages_withTimeout___block_invoke;
          v20[3] = &unk_1E6117560;
          v22 = v34;
          v23 = &v28;
          v21 = v6;
          [v14 triggerWithImage:v11 options:v12 cacheKey:v10 resultHandler:v20];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v35 count:16];
      }
      while (v7);
    }

    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_group_wait(v6, v15);
  }
  id v16 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v34, 8);

  return v16;
}

void __50__AXMIconVisionEngine_classifyImages_withTimeout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = objc_msgSend(a2, "features", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v9 = [v8 value];
        if ([v9 length])
        {
          [v8 confidence];
          double v11 = v10;
          double v12 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

          if (v11 > v12)
          {
            uint64_t v13 = [v8 value];
            uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
            dispatch_time_t v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;

            [v8 confidence];
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (AXMImageNode)imageNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageNode);

  return (AXMImageNode *)WeakRetained;
}

- (void)setImageNode:(id)a3
{
}

- (AXMIconClassDetectorNode)iconClassDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconClassDetector);

  return (AXMIconClassDetectorNode *)WeakRetained;
}

- (void)setIconClassDetector:(id)a3
{
}

- (AXMBrailleEdgesDetectorNode)brailleEdgeDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brailleEdgeDetector);

  return (AXMBrailleEdgesDetectorNode *)WeakRetained;
}

- (void)setBrailleEdgeDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_brailleEdgeDetector);
  objc_destroyWeak((id *)&self->_iconClassDetector);

  objc_destroyWeak((id *)&self->_imageNode);
}

@end