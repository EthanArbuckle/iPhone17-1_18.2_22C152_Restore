@interface AXPhotosVisionEngine
+ (id)sharedEngine;
- (AXMFaceDetectorNode)faceNode;
- (AXMImageNode)imageNode;
- (AXMVisionEngine)engine;
- (AXPhotosVisionEngine)init;
- (void)analyzeImage:(id)a3 completion:(id)a4;
- (void)setEngine:(id)a3;
- (void)setFaceNode:(id)a3;
- (void)setImageNode:(id)a3;
@end

@implementation AXPhotosVisionEngine

+ (id)sharedEngine
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__AXPhotosVisionEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedEngine_onceToken != -1) {
    dispatch_once(&sharedEngine_onceToken, block);
  }
  v2 = (void *)sharedEngine_sharedVisionEngine;

  return v2;
}

uint64_t __36__AXPhotosVisionEngine_sharedEngine__block_invoke(uint64_t a1)
{
  sharedEngine_sharedVisionEngine = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (AXPhotosVisionEngine)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXPhotosVisionEngine;
  v2 = [(AXPhotosVisionEngine *)&v9 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F21558]) initWithIdentifier:@"ImageTest"];
    [v3 setMaximumQueueSize:1000];
    [v3 setDiagnosticsEnabled:0];
    [(AXPhotosVisionEngine *)v2 setEngine:v3];
    v4 = (void *)[objc_alloc(MEMORY[0x263F21528]) initWithIdentifier:@"imageNode"];
    [v3 addSourceNode:v4];
    [(AXPhotosVisionEngine *)v2 setImageNode:v4];
    v5 = [(AXPhotosVisionEngine *)v2 engine];
    int v6 = [v5 canAddEvaluationNodeClass:objc_opt_class()];

    if (v6)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F21508]) initWithIdentifier:@"face"];
      [v3 addEvaluationNode:v7];
      [(AXPhotosVisionEngine *)v2 setFaceNode:v7];
    }
  }
  return v2;
}

- (void)analyzeImage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x263F00650];
    id v8 = a3;
    objc_super v9 = (void *)[[v7 alloc] initWithImage:v8];

    v10 = [MEMORY[0x263F21550] voiceOverOptions];
    [v10 setDetectText:0];
    [v10 setDetectFaceLandmarks:0];
    v11 = [(AXPhotosVisionEngine *)self imageNode];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__AXPhotosVisionEngine_analyzeImage_completion___block_invoke;
    v12[3] = &unk_2650A7E10;
    id v13 = v6;
    [v11 triggerWithImage:v9 options:v10 cacheKey:0 resultHandler:v12];
  }
}

uint64_t __48__AXPhotosVisionEngine_analyzeImage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AXMVisionEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (AXMImageNode)imageNode
{
  return self->_imageNode;
}

- (void)setImageNode:(id)a3
{
}

- (AXMFaceDetectorNode)faceNode
{
  return self->_faceNode;
}

- (void)setFaceNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceNode, 0);
  objc_storeStrong((id *)&self->_imageNode, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

@end