@interface JFXEffectsPreviewGenerator
- (JFXEffectsPreviewGenerator)init;
- (JFXEffectsPreviewGenerator)initWithRendererOptions:(id)a3;
- (NSString)name;
- (OS_dispatch_queue)renderCompleteQueue;
- (id)colorSpace;
- (void)_renderJob:(id)a3 completionHandler:(id)a4;
- (void)clearCaches;
- (void)dealloc;
- (void)generatePreviewRequest:(id)a3 completionHandler:(id)a4;
- (void)perfLog;
- (void)setName:(id)a3;
- (void)setRenderCompleteQueue:(id)a3;
- (void)trackStats:(BOOL)a3;
@end

@implementation JFXEffectsPreviewGenerator

- (JFXEffectsPreviewGenerator)init
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F61710];
  v3 = [MEMORY[0x263F61230] rec709GammaColorSpace];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  v5 = [(JFXEffectsPreviewGenerator *)self initWithRendererOptions:v4];
  return v5;
}

- (JFXEffectsPreviewGenerator)initWithRendererOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXEffectsPreviewGenerator;
  v5 = [(JFXEffectsPreviewGenerator *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F612F8]) initWithOptions:v4];
    renderer = v5->_renderer;
    v5->_renderer = (PVRenderer *)v6;

    [(PVRenderer *)v5->_renderer trackStats:1];
    v8 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.clips.previewRenderCompleteQueue", v8);
    renderCompleteQueue = v5->_renderCompleteQueue;
    v5->_renderCompleteQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (void)dealloc
{
  [(PVRenderer *)self->_renderer printAndClearStats:1];
  v3.receiver = self;
  v3.super_class = (Class)JFXEffectsPreviewGenerator;
  [(JFXEffectsPreviewGenerator *)&v3 dealloc];
}

- (void)generatePreviewRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[JFXEffectsPreviewRequestHandler alloc] initWithRequest:v7];

  [(JFXEffectsPreviewGenerator *)self _renderJob:v8 completionHandler:v6];
}

- (void)_renderJob:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PVRenderer *)self->_renderer compositingContext];
  dispatch_queue_t v9 = [v8 outputColorSpace];

  v10 = [v6 buildPVRenderRequestWithOutputColorSpace:v9];
  renderer = self->_renderer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke;
  v14[3] = &unk_264C0CF88;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  [(PVRenderer *)renderer startRenderRequest:v10 completionHandler:v14];
}

void __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3, char a4)
{
  id v6 = a2;
  id v7 = [a1[4] renderCompleteQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke_2;
  v9[3] = &unk_264C0CF60;
  id v10 = v6;
  char v13 = a4;
  id v12 = a1[6];
  id v11 = a1[5];
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __59__JFXEffectsPreviewGenerator__renderJob_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 count])
  {
    uint64_t v3 = [*(id *)(a1 + 40) buildCallbackMap:*(void *)(a1 + 32)];
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    id v7 = (id)v3;
  }
  else
  {
    if (*(unsigned char *)(a1 + 56)) {
      v5 = &unk_26E802180;
    }
    else {
      v5 = &unk_26E8021A8;
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.clips.JFXEffectsPreviewGenerator" code:199 userInfo:v5];
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    id v7 = (id)v6;
  }
  v4();
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  id v5 = a3;
  [(PVRenderer *)self->_renderer setName:self->_name];
}

- (void)trackStats:(BOOL)a3
{
}

- (void)perfLog
{
}

- (void)clearCaches
{
}

- (id)colorSpace
{
  v2 = [(PVRenderer *)self->_renderer compositingContext];
  uint64_t v3 = [v2 outputColorSpace];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)renderCompleteQueue
{
  return self->_renderCompleteQueue;
}

- (void)setRenderCompleteQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderCompleteQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end