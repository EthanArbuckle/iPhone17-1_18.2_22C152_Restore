@interface ASVInlinePreview
+ (id)getService;
+ (int)instanceCount;
+ (void)_kill:(int)a3;
+ (void)debugGetMemoryUsage:(id)a3;
+ (void)remoteInstanceCount:(id)a3;
- (ASVInlinePreview)initWithFrame:(CGRect)a3;
- (BOOL)enableShadows;
- (BOOL)hasAudio;
- (BOOL)hasError;
- (BOOL)isLooping;
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (CAActivityIndicatorLayer)spinnerLayer;
- (CALayer)errorLayer;
- (CALayer)layer;
- (NSString)urlFragment;
- (NSTimer)animationUpdateTimer;
- (NSURL)canonicalWebPageURL;
- (NSUUID)uuid;
- (__n128)cameraTransform;
- (double)currentTime;
- (double)duration;
- (id)_createErrorLayer;
- (id)animationObserverBlock;
- (id)cameraTransformReply;
- (id)inlineTouchesFromUITouches:(id)a3;
- (void)_getCameraTransform:(id)a3;
- (void)centerLayerInParent:(id)a3;
- (void)commonInitWithFrame:(CGRect)a3;
- (void)createFullscreenInstanceWithInitialFrame:(CGRect)a3 previewOptions:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)getCameraTransform:(id)a3;
- (void)getSharedInlineServiceFailable:(id)a3;
- (void)observeDismissFullscreenWithCompletionHandler:(id)a3;
- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4;
- (void)sendTeardownEvent;
- (void)setAnimationObserverBlock:(id)a3;
- (void)setCameraTransform:(ASVInlinePreview *)self;
- (void)setCameraTransformReply:(id)a3;
- (void)setCanonicalWebPageURL:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setEnableShadows:(BOOL)a3;
- (void)setFrameWithinFencedTransaction:(CGRect)a3;
- (void)setIsLooping:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3 reply:(id)a4;
- (void)setUrlFragment:(id)a3;
- (void)setWantsDebugColors:(BOOL)a3;
- (void)setupRemoteConnectionWithCompletionHandler:(id)a3;
- (void)showErrorLayer;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateFrame:(CGRect)a3 completionHandler:(id)a4;
- (void)updateLayout;
- (void)updateRuntimeStateFrom:(id)a3;
@end

@implementation ASVInlinePreview

- (void)commonInitWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ++_instanceCount;
  self->_duration = 0.0;
  v8 = (CALayer *)objc_opt_new();
  layer = self->_layer;
  self->_layer = v8;

  -[CALayer setFrame:](self->_layer, "setFrame:", x, y, width, height);
  v10 = [(ASVInlinePreview *)self _createErrorLayer];
  errorLayer = self->_errorLayer;
  self->_errorLayer = v10;

  [(CALayer *)self->_errorLayer setHidden:1];
  [(CALayer *)self->_layer addSublayer:self->_errorLayer];
  id v15 = [MEMORY[0x1E4FB1618] colorWithRed:0.235294118 green:0.235294118 blue:0.262745098 alpha:0.6];
  v12 = [[CAActivityIndicatorLayer alloc] initWithColor:v15];
  spinnerLayer = self->_spinnerLayer;
  self->_spinnerLayer = v12;

  -[CAActivityIndicatorLayer setFrame:](self->_spinnerLayer, "setFrame:", 0.0, 0.0, 20.0, 20.0);
  [(CALayer *)self->_layer addSublayer:self->_spinnerLayer];
  [(ASVInlinePreview *)self updateLayout];
  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel_showErrorLayer name:@"ASVConnectionInterrupted" object:0];
}

- (void)dealloc
{
  v3 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v3 = _asvLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v3, OS_LOG_TYPE_INFO, "#Inline: dealloc: invalidating _animationUpdateTimer", buf, 2u);
  }
  [(NSTimer *)self->_animationUpdateTimer invalidate];
  [(ASVInlinePreview *)self sendTeardownEvent];
  --_instanceCount;
  v4.receiver = self;
  v4.super_class = (Class)ASVInlinePreview;
  [(ASVInlinePreview *)&v4 dealloc];
}

+ (id)getService
{
  v2 = +[ASVInlinePreviewFactory shared];
  v3 = [v2 sharedInlineService];

  if (v3)
  {
    objc_super v4 = +[ASVInlinePreviewFactory shared];
    v5 = [v4 sharedInlineService];
  }
  else
  {
    v6 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v6 = _asvLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1E2840000, v6, OS_LOG_TYPE_INFO, "#Inline: Extension not launched", v8, 2u);
    }
    v5 = 0;
  }
  return v5;
}

- (void)sendTeardownEvent
{
  v3 = +[ASVInlinePreview getService];
  if (v3)
  {
    objc_super v4 = [(ASVInlinePreview *)self uuid];
    [v3 teardownInlinePreviewWithUUID:v4 completion:&__block_literal_global_2];
  }
  else
  {
    v5 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_INFO, "#Inline: Couldn't get service", v6, 2u);
    }
  }
}

void __46__ASVInlinePreview_Private__sendTeardownEvent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v3 = _asvLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1E2840000, v3, OS_LOG_TYPE_INFO, "#Inline: Successfully teardown %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (int)instanceCount
{
  return _instanceCount;
}

+ (void)remoteInstanceCount:(id)a3
{
  id v3 = a3;
  int v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    int v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v4, OS_LOG_TYPE_INFO, "#Inline: Get remoteInstanceCount", buf, 2u);
  }
  id v5 = +[ASVInlinePreview getService];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__ASVInlinePreview_Private__remoteInstanceCount___block_invoke;
    v8[3] = &unk_1E6DD77E8;
    id v9 = v3;
    [v5 sendARQLEvent:&unk_1F3DEEAF8 forUUID:v6 completion:v8];
  }
  else
  {
    v7 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v7 = _asvLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: Couldn't get service", buf, 2u);
    }
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __49__ASVInlinePreview_Private__remoteInstanceCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: replyPayload: %@", (uint8_t *)&v11, 0xCu);
  }
  v8 = [v5 objectForKey:@"instanceCount"];
  id v9 = v8;
  if (v8)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 intValue]);
  }
  else
  {
    v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1E2840000, v10, OS_LOG_TYPE_ERROR, "#Inline: Couldn't get remoteInstanceCount", (uint8_t *)&v11, 2u);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0xFFFFFFFFLL);
  }
}

+ (void)debugGetMemoryUsage:(id)a3
{
  id v3 = a3;
  int v4 = +[ASVInlinePreview getService];
  if (v4)
  {
    id v5 = objc_opt_new();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__ASVInlinePreview_Private__debugGetMemoryUsage___block_invoke;
    v7[3] = &unk_1E6DD77E8;
    id v8 = v3;
    [v4 sendARQLEvent:&unk_1F3DEEB20 forUUID:v5 completion:v7];
  }
  else
  {
    id v6 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      id v6 = _asvLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2840000, v6, OS_LOG_TYPE_INFO, "#Inline: Couldn't get service", buf, 2u);
    }
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

void __49__ASVInlinePreview_Private__debugGetMemoryUsage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectForKey:@"processMemoryLimit"];
  int v4 = [v3 objectForKey:@"currentMemoryFootprint"];

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v5 integerValue], objc_msgSend(v4, "integerValue"));
}

- (void)updateLayout
{
  [(ASVInlinePreview *)self centerLayerInParent:self->_spinnerLayer];
  errorLayer = self->_errorLayer;
  [(ASVInlinePreview *)self centerLayerInParent:errorLayer];
}

- (void)centerLayerInParent:(id)a3
{
  id v15 = a3;
  id v3 = [v15 superlayer];
  int v4 = v3;
  if (v3)
  {
    [v3 bounds];
    double v6 = v5;
    [v15 bounds];
    double v8 = (v6 - v7) * 0.5;
    [v4 bounds];
    double v10 = v9;
    [v15 bounds];
    double v12 = (v10 - v11) * 0.5;
    [v15 bounds];
    double v14 = v13;
    [v15 bounds];
    objc_msgSend(v15, "setFrame:", v8, v12, v14);
  }
}

- (void)showErrorLayer
{
  id v3 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v3 = _asvLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v3, OS_LOG_TYPE_INFO, "#Inline: showErrorLayer called", buf, 2u);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__ASVInlinePreview_Private__showErrorLayer__block_invoke;
  v4[3] = &unk_1E6DD7810;
  v4[4] = self;
  ASVRunInMainThread(v4);
}

uint64_t __43__ASVInlinePreview_Private__showErrorLayer__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) stopAnimating];
  [*(id *)(*(void *)(a1 + 32) + 96) setHidden:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 updateLayout];
}

- (BOOL)hasError
{
  return ![(CALayer *)self->_errorLayer isHidden];
}

- (id)_createErrorLayer
{
  id v2 = objc_opt_new();
  [v2 setName:@"CircleMask"];
  id v3 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(v2, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  [v2 bounds];
  [v2 setCornerRadius:v4 * 0.5];
  id v5 = objc_alloc_init(MEMORY[0x1E4F5C340]);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  [v5 setName:@"CircleMaterial"];
  [v5 setRecipe:*MEMORY[0x1E4F5C2C0]];
  [v5 setWeighting:1.0];
  [v5 setMask:v2];
  double v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:22.5];
  double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arkit.badge.xmark" withConfiguration:v6];
  [v7 size];
  double v9 = v8;
  double v11 = v10;
  id v12 = v7;
  double v13 = [v12 CGImage];
  id v14 = [MEMORY[0x1E4FB1618] whiteColor];
  [v14 CGColor];

  id v15 = objc_opt_new();
  [v15 setContentsGravity:*MEMORY[0x1E4F3A3D8]];
  [v15 setName:@"IconMask"];
  [v15 setContents:v13];
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v9, v11);
  id v16 = objc_alloc_init(MEMORY[0x1E4F5C340]);
  objc_msgSend(v16, "setFrame:", (60.0 - v9) * 0.5 + 2.5, (60.0 - v11) * 0.5, v9, v11);
  [v16 setName:@"IconMaterial"];
  [v16 setRecipe:*MEMORY[0x1E4F5C2C8]];
  [v16 setWeighting:1.0];
  [v16 setMask:v15];
  [v5 addSublayer:v16];

  return v5;
}

void __46__ASVInlinePreview_Private__setEnableShadows___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    double v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(unsigned __int8 *)(a1 + 32);
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: setEnableShadows: %d", (uint8_t *)v10, 8u);
  }
  double v9 = [v6 uuid];
  [v5 inlinePreview:v9 setEnableShadows:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setIsPlaying:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke;
  v8[3] = &unk_1E6DD7880;
  BOOL v10 = a3;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ASVInlinePreview *)self getSharedInlineServiceFailable:v8];
}

void __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    int v20 = v8;
    _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: setIsPlaying: %d", buf, 8u);
  }
  v17[1] = @"isPlaying";
  v18[0] = @"isPlaying";
  v17[0] = @"request";
  id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v18[1] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  uint64_t v11 = [*(id *)(a1 + 32) uuid];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke_77;
  v14[3] = &unk_1E6DD7858;
  id v12 = *(id *)(a1 + 40);
  id v15 = v10;
  id v16 = v12;
  v14[4] = *(void *)(a1 + 32);
  id v13 = v10;
  [v5 sendARQLEvent:v13 forUUID:v11 completion:v14];
}

void __48__ASVInlinePreview_Private__setIsPlaying_reply___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"error"];
  if (v3)
  {
    double v4 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      double v4 = _asvLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1E2840000, v4, OS_LOG_TYPE_ERROR, "#Inline: Unable to setIsPlaying. Error: %@", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void, uint64_t, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 32) isPlaying], v3);
  }
  else
  {
    [*(id *)(a1 + 32) updateRuntimeStateFrom:*(void *)(a1 + 40)];
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 32) isPlaying], 0);
  }
}

void __42__ASVInlinePreview_Private__setIsLooping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    uint64_t v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(unsigned __int8 *)(a1 + 32);
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: setIsLooping: %d", (uint8_t *)v10, 8u);
  }
  id v9 = [v6 uuid];
  [v5 inlinePreview:v9 setIsLooping:*(unsigned __int8 *)(a1 + 32)];
}

void __40__ASVInlinePreview_Private__setIsMuted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    uint64_t v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(unsigned __int8 *)(a1 + 32);
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: setIsMuted: %d", (uint8_t *)v10, 8u);
  }
  id v9 = [v6 uuid];
  [v5 inlinePreview:v9 setIsMuted:*(unsigned __int8 *)(a1 + 32)];
}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_2;
    v6[3] = &unk_1E6DD78F8;
    objc_copyWeak(&v7, v4);
    [WeakRetained getSharedInlineServiceFailable:v6];
    objc_destroyWeak(&v7);
  }
}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 uuid];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_3;
  v8[3] = &unk_1E6DD78D0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  [v5 sendARQLEvent:&unk_1F3DEEB48 forUUID:v7 completion:v8];

  objc_destroyWeak(&v9);
}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_4;
  v8[3] = &unk_1E6DD78A8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v7 = v5;
  id v9 = v7;
  ASVRunInMainThread(v8);

  objc_destroyWeak(&v10);
}

void __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[8])
  {
    id v5 = WeakRetained;
    [WeakRetained updateRuntimeStateFrom:*(void *)(a1 + 32)];
    uint64_t v3 = v5[8];
    uint64_t v4 = [v5 isPlaying];
    [v5 currentTime];
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
    id WeakRetained = v5;
  }
}

void __44__ASVInlinePreview_Private__setCurrentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 uuid];
  [v5 inlinePreview:v6 setCurrentTime:*(double *)(a1 + 32)];
}

- (void)_getCameraTransform:(id)a3
{
  id v4 = a3;
  id v5 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v5 = _asvLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_INFO, "#Inline: _getCameraTransform() called", buf, 2u);
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AssetViewer.ASVInlinePreview" code:5 userInfo:0];
  id v7 = [(ASVInlinePreview *)self cameraTransformReply];

  if (v7)
  {
    int v8 = [(ASVInlinePreview *)self cameraTransformReply];
    ((void (**)(void, void *, __n128))v8)[2](v8, v6, (__n128)0);
  }
  [(ASVInlinePreview *)self setCameraTransformReply:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__ASVInlinePreview_Private___getCameraTransform___block_invoke;
  v9[3] = &unk_1E6DD7990;
  v9[4] = self;
  [(ASVInlinePreview *)self getSharedInlineServiceFailable:v9];
}

void __49__ASVInlinePreview_Private___getCameraTransform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uuid];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ASVInlinePreview_Private___getCameraTransform___block_invoke_2;
  v6[3] = &unk_1E6DD7968;
  void v6[4] = *(void *)(a1 + 32);
  [v4 sendARQLEvent:&unk_1F3DEEB70 forUUID:v5 completion:v6];
}

void __49__ASVInlinePreview_Private___getCameraTransform___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: _getCameraTransform() received reply", v8, 2u);
  }
  [*(id *)(a1 + 32) updateRuntimeStateFrom:v5];
}

- (void)setCameraTransform:(ASVInlinePreview *)self
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__ASVInlinePreview_Private__setCameraTransform___block_invoke;
  v3[3] = &__block_descriptor_48_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  long long v4 = v2;
  [(ASVInlinePreview *)self getSharedInlineServiceFailable:v3];
}

void __48__ASVInlinePreview_Private__setCameraTransform___block_invoke(float *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v7 = _asvLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = a1[9];
    double v9 = a1[8];
    double v10 = a1[10];
    int v15 = 134218496;
    double v16 = v8;
    __int16 v17 = 2048;
    double v18 = v9;
    __int16 v19 = 2048;
    double v20 = v10;
    _os_log_impl(&dword_1E2840000, v7, OS_LOG_TYPE_INFO, "#Inline: setCameraYaw: %g, %g, %g", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v11 = [v6 uuid];
  *(float *)&double v13 = a1[8];
  *(float *)&double v12 = a1[9];
  *(float *)&double v14 = a1[10];
  [v5 inlinePreview:v11 setCameraYaw:&unk_1F3DEEB98 pitch:v12 scale:v13 options:v14];
}

- (void)updateRuntimeStateFrom:(id)a3
{
  id v22 = a3;
  long long v4 = [v22 objectForKey:@"duration"];
  if (v4)
  {
    [(ASVInlinePreview *)self willChangeValueForKey:@"duration"];
    [v4 doubleValue];
    self->_duration = v5;
    [(ASVInlinePreview *)self didChangeValueForKey:@"duration"];
  }
  id v6 = [v22 objectForKey:@"isPlaying"];
  if (v6)
  {
    [(ASVInlinePreview *)self willChangeValueForKey:@"isPlaying"];
    self->_isPlaying = [v6 BOOLValue];
    [(ASVInlinePreview *)self didChangeValueForKey:@"isPlaying"];
  }
  id v7 = [v22 objectForKey:@"hasAudio"];
  if (v7)
  {
    [(ASVInlinePreview *)self willChangeValueForKey:@"hasAudio"];
    self->_hasAudio = [v7 BOOLValue];
    [(ASVInlinePreview *)self didChangeValueForKey:@"hasAudio"];
  }
  double v8 = [v22 objectForKey:@"currentTime"];
  if (v8)
  {
    [(ASVInlinePreview *)self willChangeValueForKey:@"currentTime"];
    [v8 doubleValue];
    self->_currentTime = v9;
    [(ASVInlinePreview *)self didChangeValueForKey:@"currentTime"];
  }
  double v10 = [v22 objectForKey:@"yaw"];
  uint64_t v11 = [v22 objectForKey:@"pitch"];
  uint64_t v12 = [v22 objectForKey:@"scale"];
  double v13 = (void *)v12;
  if (v10)
  {
    if (v11)
    {
      if (v12)
      {
        [v11 floatValue];
        *(void *)&long long v21 = v14;
        [v10 floatValue];
        int v20 = v15;
        [v13 floatValue];
        long long v16 = v21;
        DWORD1(v16) = v20;
        DWORD2(v16) = v17;
        *(_OWORD *)self->_cameraTransform = v16;
        double v18 = [(ASVInlinePreview *)self cameraTransformReply];

        if (v18)
        {
          __int16 v19 = [(ASVInlinePreview *)self cameraTransformReply];
          v19[2](v19, 0, *(__n128 *)self->_cameraTransform);

          [(ASVInlinePreview *)self setCameraTransformReply:0];
        }
      }
    }
  }
}

- (ASVInlinePreview)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)ASVInlinePreview;
  id v7 = [(ASVInlinePreview *)&v12 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_resizeLayerImmediateldouble y = 1;
    -[ASVInlinePreview commonInitWithFrame:](v7, "commonInitWithFrame:", x, y, width, height);
    double v10 = v7;
  }

  return v7;
}

- (void)getSharedInlineServiceFailable:(id)a3
{
  id v4 = a3;
  double v5 = +[ASVInlinePreviewFactory shared];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ASVInlinePreview_getSharedInlineServiceFailable___block_invoke;
  v8[3] = &unk_1E6DD7FC0;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = v5;
  id v9 = v7;
  [v7 getSharedInlineServiceWithCompletionHandler:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __51__ASVInlinePreview_getSharedInlineServiceFailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      double v5 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        double v5 = _asvLogHandle;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_ERROR, "#Inline: getSharedInlineServiceFailable: Unable to get shared service, error: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = [*(id *)(a1 + 32) sharedInlineService];
      (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, WeakRetained);
    }
  }
}

- (void)setupRemoteConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = +[ASVInlinePreviewFactory shared];
  objc_initWeak(&location, self);
  [(CALayer *)self->_layer bounds];
  id v7 = v6;
  id v9 = v8;
  id v11 = v10;
  double v13 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E6DD8038;
  objc_copyWeak(v19, &location);
  id v14 = v4;
  id v18 = v14;
  v19[1] = v7;
  v19[2] = v9;
  v19[3] = v11;
  v19[4] = v13;
  id v15 = v5;
  id v17 = v15;
  [v15 getSharedInlineServiceWithCompletionHandler:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v5 = _asvLogHandle;
  if (v3)
  {
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      double v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v3;
      _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_ERROR, "#Inline: Unable to getSharedInlineServiceWithCompletionHandler, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [WeakRetained showErrorLayer];
  }
  else
  {
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      double v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CGFloat v6 = *(double *)(a1 + 56);
      CGFloat v7 = *(double *)(a1 + 64);
      CGFloat v8 = *(double *)(a1 + 72);
      CGFloat v9 = *(double *)(a1 + 80);
      uint64_t v10 = v5;
      v23.origin.double x = v6;
      v23.origin.double y = v7;
      v23.size.double width = v8;
      v23.size.double height = v9;
      id v11 = NSStringFromCGRect(v23);
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_impl(&dword_1E2840000, v10, OS_LOG_TYPE_INFO, "#Inline: setupRemoteConnectionWithCompletionHandler, frame: %@", buf, 0xCu);
    }
    objc_super v12 = [*(id *)(a1 + 32) sharedInlineService];
    uint64_t v13 = WeakRetained[1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E6DD8010;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    id v16 = *(id *)(a1 + 40);
    long long v14 = *(_OWORD *)(a1 + 72);
    long long v18 = *(_OWORD *)(a1 + 56);
    long long v19 = v14;
    objc_msgSend(v12, "createInlinePreviewWithUUID:initialBounds:contextIdReply:", v13, v15, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

    objc_destroyWeak(&v17);
  }
}

void __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8)
  {
    uint64_t v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      uint64_t v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_1E2840000, v10, OS_LOG_TYPE_ERROR, "#Inline: Unable to create remote context, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [WeakRetained showErrorLayer];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E6DD7FE8;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    int v17 = a3;
    long long v11 = *(_OWORD *)(a1 + 64);
    long long v15 = *(_OWORD *)(a1 + 48);
    long long v16 = v11;
    id v13 = *(id *)(a1 + 32);
    ASVRunInMainThread(v12);

    objc_destroyWeak(&v14);
  }
}

void __63__ASVInlinePreview_setupRemoteConnectionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [MEMORY[0x1E4F39BF0] layer];
  [v3 setContextId:*(unsigned int *)(a1 + 80)];
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = v4;
    [v3 frame];
    CGFloat v6 = NSStringFromCGRect(v12);
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_INFO, "#Inline: layerHost.frame: %@", (uint8_t *)&v9, 0xCu);
  }
  [v3 setAllowsHitTesting:0];
  id v7 = (void *)WeakRetained[2];
  WeakRetained[2] = v3;
  id v8 = v3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CAActivityIndicatorLayer *)self->_spinnerLayer startAnimating];
  id v8 = +[ASVInlinePreviewFactory shared];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke;
  v12[3] = &unk_1E6DD8100;
  objc_copyWeak(&v17, &location);
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  id v13 = v10;
  id v11 = v8;
  id v14 = v11;
  long long v15 = self;
  [v11 getSharedInlineServiceWithCompletionHandler:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    double v5 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      double v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_ERROR, "#Inline: Unable to getSharedInlineServiceWithCompletionHandler, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [WeakRetained showErrorLayer];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v15 = 0;
    id v7 = [MEMORY[0x1E4F3A640] wrapperWithURL:v6 readonly:1 error:&v15];
    id v8 = v15;
    id v9 = _asvLogHandle;
    if (v8)
    {
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        id v9 = _asvLogHandle;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v8;
        _os_log_impl(&dword_1E2840000, v9, OS_LOG_TYPE_ERROR, "#Inline: Unable to extend file sandbox to extension, error: %@", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      [WeakRetained showErrorLayer];
    }
    else
    {
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        id v9 = _asvLogHandle;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2840000, v9, OS_LOG_TYPE_INFO, "#Inline: calling prepareInlinePreviewWithScopedURLWrapperAttributes", buf, 2u);
      }
      id v10 = [*(id *)(a1 + 40) sharedInlineService];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_8;
      v12[3] = &unk_1E6DD80D8;
      objc_copyWeak(&v14, (id *)(a1 + 64));
      id v13 = *(id *)(a1 + 56);
      [v10 prepareInlinePreviewWithScopedURLWrapperAttributes:v7 forUUID:v11 completion:v12];

      objc_destroyWeak(&v14);
    }
  }
}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6DD80B0;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v10 = v9;
  id v13 = v10;
  id v15 = *(id *)(a1 + 32);
  id v11 = v8;
  id v14 = v11;
  ASVRunInMainThread(v12);

  objc_destroyWeak(&v16);
}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    double v5 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      double v5 = _asvLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v6;
      _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_ERROR, "#Inline: Unable to load file for inline preview, error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [v4 showErrorLayer];
  }
  else
  {
    id v7 = [WeakRetained spinnerLayer];
    [v7 stopAnimating];

    [v4[5] addSublayer:v4[2]];
    [v4 updateLayout];
    [v4 updateRuntimeStateFrom:*(void *)(a1 + 40)];
    *((unsigned char *)v4 + 32) = 0;
    [v4[5] bounds];
    double v9 = v8;
    double v11 = v10;
    [v4[2] bounds];
    if (v9 != v13 || v11 != v12)
    {
      id v15 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        id v15 = _asvLogHandle;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2840000, v15, OS_LOG_TYPE_INFO, "#Inline: Frame was changed during loading - resizing...", buf, 2u);
      }
      [v4[5] bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_9;
      v24[3] = &unk_1E6DD8088;
      objc_copyWeak(&v25, v2);
      objc_msgSend(v4, "updateFrame:completionHandler:", v24, v17, v19, v21, v23);
      objc_destroyWeak(&v25);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2_10;
  v7[3] = &unk_1E6DD8060;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  ASVRunInMainThread(v7);
  [v5 invalidate];
  objc_destroyWeak(&v8);
}

void __64__ASVInlinePreview_preparePreviewOfFileAtURL_completionHandler___block_invoke_2_10(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[5] bounds];
  objc_msgSend(WeakRetained, "setFrameWithinFencedTransaction:");
}

- (void)createFullscreenInstanceWithInitialFrame:(CGRect)a3 previewOptions:(id)a4 completionHandler:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  if (self->_fullscreenService)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"ASVInlinePreview_iOS.m" lineNumber:187 description:@"A fullscreen instance already exists"];
  }
  id v14 = +[ASVInlinePreviewFactory shared];
  objc_initWeak(&location, self);
  uuid = self->_uuid;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke;
  v18[3] = &unk_1E6DD8150;
  objc_copyWeak(v20, &location);
  id v16 = v13;
  id v19 = v16;
  v20[1] = (id)a2;
  objc_msgSend(v14, "createFullscreenInstanceWithUUID:initialFrame:previewOptions:completionHandler:", uuid, v12, v18, x, y, width, height);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke_2;
  v19[3] = &unk_1E6DD8128;
  objc_copyWeak(v25, (id *)(a1 + 40));
  id v13 = v12;
  id v20 = v13;
  id v14 = v9;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  id v16 = *(id *)(a1 + 32);
  double v17 = *(void **)(a1 + 48);
  id v24 = v16;
  v25[1] = v17;
  id v18 = v11;
  id v23 = v18;
  ASVRunInMainThread(v19);

  objc_destroyWeak(v25);
}

void __94__ASVInlinePreview_createFullscreenInstanceWithInitialFrame_previewOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (!*(void *)(a1 + 32) && *(void *)(a1 + 40) && (id v6 = *(void **)(a1 + 48)) != 0)
  {
    if (WeakRetained[3])
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 80) object:v3 file:@"ASVInlinePreview_iOS.m" lineNumber:201 description:@"A fullscreen instance already exists"];

      id v6 = *(void **)(a1 + 48);
    }
    objc_storeStrong(v3 + 3, v6);
    id v7 = [MEMORY[0x1E4F39BB8] handleFromXPCRepresentation:*(void *)(a1 + 56)];
    if (v7)
    {
      id v8 = [[ASVInlineHostViewController alloc] initWithUUID:v3[1] child:*(void *)(a1 + 40) fullscreenInlineService:*(void *)(a1 + 48) canonicalWebPageURL:v3[6]];
      id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AssetViewer.ASVInlinePreview" code:3 userInfo:0];
      id v10 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        id v10 = _asvLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_1E2840000, v10, OS_LOG_TYPE_ERROR, "#Inline: Didn't receive fence handler when creating fullscreen instance, error: %@", (uint8_t *)&v12, 0xCu);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v9();
  }
  else
  {
    id v4 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      id v4 = _asvLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(ASVInlineHostViewController **)(a1 + 32);
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1E2840000, v4, OS_LOG_TYPE_ERROR, "#Inline: Unable to create fullscreen instance, error: %@", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)observeDismissFullscreenWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!self->_fullscreenService)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ASVInlinePreview_iOS.m" lineNumber:221 description:@"_fullscreenService should not be nil before observing dismiss fullscreen"];
  }
  objc_initWeak(&location, self);
  fullscreenService = self->_fullscreenService;
  uuid = self->_uuid;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __66__ASVInlinePreview_observeDismissFullscreenWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6DD8178;
  objc_copyWeak(v12, &location);
  id v8 = v5;
  id v11 = v8;
  v12[1] = (id)a2;
  [(ARQLInlineService2 *)fullscreenService observeReturnedToInlineForUUID:uuid fenceHandleCompletion:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __66__ASVInlinePreview_observeDismissFullscreenWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F39BB8] handleFromXPCRepresentation:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      id v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1E2840000, v10, OS_LOG_TYPE_INFO, "#Inline: return to inline payload: %@", (uint8_t *)&v14, 0xCu);
    }
    id v11 = (void *)WeakRetained[3];
    if (!v11)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 48) object:WeakRetained file:@"ASVInlinePreview_iOS.m" lineNumber:238 description:@"_fullscreenService should not be nil before setting it nil"];

      id v11 = (void *)WeakRetained[3];
    }
    WeakRetained[3] = 0;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AssetViewer.ASVInlinePreview" code:3 userInfo:0];
    int v12 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      int v12 = _asvLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1E2840000, v12, OS_LOG_TYPE_ERROR, "#Inline: No CAFenceHandle when returning to inline, error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateFrame:(CGRect)a3 completionHandler:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v10 = _asvLogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    int v12 = NSStringFromCGRect(v35);
    [(CALayer *)self->_layer bounds];
    id v13 = NSStringFromCGRect(v36);
    *(_DWORD *)buf = 138412546;
    v31 = v12;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_1E2840000, v11, OS_LOG_TYPE_INFO, "#Inline: updateFrame called - newFrame: %@, oldFrame: %@", buf, 0x16u);
  }
  fullscreenService = self->_fullscreenService;
  if (!fullscreenService)
  {
    [(CALayerHost *)self->_layerHost bounds];
    if (width == v16 && height == v15)
    {
      id v18 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        id v18 = _asvLogHandle;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = v18;
        v37.origin.double x = x;
        v37.origin.double y = y;
        v37.size.double width = width;
        v37.size.double height = height;
        id v20 = NSStringFromCGRect(v37);
        [(CALayer *)self->_layer bounds];
        id v21 = NSStringFromCGRect(v38);
        *(_DWORD *)buf = 138412546;
        v31 = v20;
        __int16 v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_1E2840000, v19, OS_LOG_TYPE_INFO, "#Inline: Trying to updateFrame while in inline, but new bounds size is the same as current. newFrame: %@, oldFrame: %@", buf, 0x16u);
      }
    }
  }
  if (self->_resizeLayerImmediately)
  {
    id v22 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      id v22 = _asvLogHandle;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2840000, v22, OS_LOG_TYPE_INFO, "#Inline: Updating bounds immediately since showing error or spinner", buf, 2u);
    }
    -[ASVInlinePreview setFrameWithinFencedTransaction:](self, "setFrameWithinFencedTransaction:", x, y, width, height);
  }
  id v23 = +[ASVInlinePreviewFactory shared];
  id v24 = [v23 sharedInlineService];
  uuid = self->_uuid;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__ASVInlinePreview_updateFrame_completionHandler___block_invoke;
  v27[3] = &unk_1E6DD81A0;
  id v28 = v9;
  BOOL v29 = fullscreenService == 0;
  id v26 = v9;
  objc_msgSend(v24, "updateBounds:forUUID:fenceHandleCompletion:", uuid, v27, x, y, width, height);
}

void __50__ASVInlinePreview_updateFrame_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      id v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1E2840000, v10, OS_LOG_TYPE_ERROR, "#Inline: Error while updating frame, error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = [MEMORY[0x1E4F39BB8] handleFromXPCRepresentation:v8];
    if (v8 || !*(unsigned char *)(a1 + 40))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AssetViewer.ASVInlinePreview" code:3 userInfo:0];
      id v13 = _asvLogHandle;
      if (!_asvLogHandle)
      {
        ASVInitLogging();
        id v13 = _asvLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = v12;
        _os_log_impl(&dword_1E2840000, v13, OS_LOG_TYPE_ERROR, "#Inline: No CAFenceHandle when updating frame, error: %@", (uint8_t *)&v14, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)setFrameWithinFencedTransaction:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v8 = _asvLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    v14.origin.double x = x;
    v14.origin.double y = y;
    v14.size.double width = width;
    v14.size.double height = height;
    id v10 = NSStringFromCGRect(v14);
    int v11 = 138412290;
    int v12 = v10;
    _os_log_impl(&dword_1E2840000, v9, OS_LOG_TYPE_INFO, "#Inline: Setting frame %@ to root and child layers", (uint8_t *)&v11, 0xCu);
  }
  -[CALayer setFrame:](self->_layer, "setFrame:", x, y, width, height);
  [(CALayer *)self->_layer bounds];
  -[CALayerHost setFrame:](self->_layerHost, "setFrame:");
  [(ASVInlinePreview *)self updateLayout];
}

- (id)inlineTouchesFromUITouches:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_alloc(MEMORY[0x1E4F3A638]);
        CGRect v14 = objc_msgSend(v13, "initWithUITouch:", v12, (void)v17);
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  if (![v6 count])
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"ASVInlinePreview_iOS.m" lineNumber:303 description:@"arqlTouches shound not return zero"];
  }
  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = +[ASVInlinePreviewFactory shared];
  id v7 = [(ASVInlinePreview *)self inlineTouchesFromUITouches:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __43__ASVInlinePreview_touchesBegan_withEvent___block_invoke;
  v10[3] = &unk_1E6DD81C8;
  id v11 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v6;
  [v9 getSharedInlineServiceWithCompletionHandler:v10];
}

void __43__ASVInlinePreview_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sharedInlineService];
  [v2 touchesBegan:*(void *)(a1 + 40) forUUID:*(void *)(*(void *)(a1 + 48) + 8)];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = +[ASVInlinePreviewFactory shared];
  id v7 = [(ASVInlinePreview *)self inlineTouchesFromUITouches:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __43__ASVInlinePreview_touchesMoved_withEvent___block_invoke;
  v10[3] = &unk_1E6DD81C8;
  id v11 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v6;
  [v9 getSharedInlineServiceWithCompletionHandler:v10];
}

void __43__ASVInlinePreview_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sharedInlineService];
  [v2 touchesMoved:*(void *)(a1 + 40) forUUID:*(void *)(*(void *)(a1 + 48) + 8)];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[ASVInlinePreviewFactory shared];
  id v7 = [(ASVInlinePreview *)self inlineTouchesFromUITouches:v5];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__ASVInlinePreview_touchesEnded_withEvent___block_invoke;
  v19[3] = &unk_1E6DD81C8;
  id v8 = v6;
  id v20 = v8;
  id v9 = v7;
  id v21 = v9;
  uint64_t v22 = self;
  [v8 getSharedInlineServiceWithCompletionHandler:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(MEMORY[0x1E4F3A638], "removeUIDForUITouch:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

void __43__ASVInlinePreview_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sharedInlineService];
  [v2 touchesEnded:*(void *)(a1 + 40) forUUID:*(void *)(*(void *)(a1 + 48) + 8)];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[ASVInlinePreviewFactory shared];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __47__ASVInlinePreview_touchesCancelled_withEvent___block_invoke;
  v18[3] = &unk_1E6DD81C8;
  id v7 = v6;
  id v19 = v7;
  id v20 = self;
  id v8 = v5;
  id v21 = v8;
  [v7 getSharedInlineServiceWithCompletionHandler:v18];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(MEMORY[0x1E4F3A638], "removeUIDForUITouch:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

void __47__ASVInlinePreview_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) sharedInlineService];
  id v2 = [*(id *)(a1 + 40) inlineTouchesFromUITouches:*(void *)(a1 + 48)];
  [v3 touchesCancelled:v2 forUUID:*(void *)(*(void *)(a1 + 40) + 8)];
}

- (void)getCameraTransform:(id)a3
{
  id v4 = a3;
  id v5 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v5 = _asvLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_INFO, "#Inline: getCameraTransform() called", v6, 2u);
  }
  [(ASVInlinePreview *)self _getCameraTransform:v4];
}

+ (void)_kill:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1E2840000, v4, OS_LOG_TYPE_INFO, "#Inline: Killing inline preview service, signal: %d", (uint8_t *)v7, 8u);
  }
  id v5 = +[ASVInlinePreviewFactory shared];
  id v6 = [v5 extension];
  [v6 _kill:v3];
}

- (void)setWantsDebugColors:(BOOL)a3
{
  p_layerHost = &self->_layerHost;
  layerHost = self->_layerHost;
  if (a3)
  {
    [(CALayerHost *)layerHost setBorderWidth:2.0];
    id v6 = [MEMORY[0x1E4FB1618] orangeColor];
    -[CALayerHost setBorderColor:](self->_layerHost, "setBorderColor:", [v6 CGColor]);

    id v7 = [MEMORY[0x1E4FB1618] purpleColor];
    -[CALayerHost setBackgroundColor:](self->_layerHost, "setBackgroundColor:", [v7 CGColor]);

    layer = self->_layer;
    p_layer = &self->_layer;
    [(CALayer *)layer setBorderWidth:2.0];
    id v10 = [MEMORY[0x1E4FB1618] blueColor];
    -[CALayer setBorderColor:](*p_layer, "setBorderColor:", [v10 CGColor]);

    uint64_t v11 = [MEMORY[0x1E4FB1618] greenColor];
  }
  else
  {
    [(CALayerHost *)layerHost setBorderWidth:0.0];
    uint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
    p_layer = (CALayer **)p_layerHost;
  }
  id v12 = v11;
  -[CALayer setBackgroundColor:](*p_layer, "setBackgroundColor:", [v12 CGColor]);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSURL)canonicalWebPageURL
{
  return self->_canonicalWebPageURL;
}

- (void)setCanonicalWebPageURL:(id)a3
{
}

- (NSString)urlFragment
{
  return self->_urlFragment;
}

- (void)setUrlFragment:(id)a3
{
}

- (BOOL)enableShadows
{
  return self->_enableShadows;
}

- (void)setEnableShadows:(BOOL)a3
{
  self->_enableShadows = a3;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (id)animationObserverBlock
{
  return self->_animationObserverBlock;
}

- (void)setAnimationObserverBlock:(id)a3
{
}

- (BOOL)isLooping
{
  return self->_isLooping;
}

- (void)setIsLooping:(BOOL)a3
{
  self->_isLooping = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (__n128)cameraTransform
{
  return a1[8];
}

- (CAActivityIndicatorLayer)spinnerLayer
{
  return self->_spinnerLayer;
}

- (CALayer)errorLayer
{
  return self->_errorLayer;
}

- (id)cameraTransformReply
{
  return self->_cameraTransformReply;
}

- (void)setCameraTransformReply:(id)a3
{
}

- (NSTimer)animationUpdateTimer
{
  return self->_animationUpdateTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationUpdateTimer, 0);
  objc_storeStrong(&self->_cameraTransformReply, 0);
  objc_storeStrong((id *)&self->_errorLayer, 0);
  objc_storeStrong((id *)&self->_spinnerLayer, 0);
  objc_storeStrong(&self->_animationObserverBlock, 0);
  objc_storeStrong((id *)&self->_urlFragment, 0);
  objc_storeStrong((id *)&self->_canonicalWebPageURL, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_fullscreenService, 0);
  objc_storeStrong((id *)&self->_layerHost, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end