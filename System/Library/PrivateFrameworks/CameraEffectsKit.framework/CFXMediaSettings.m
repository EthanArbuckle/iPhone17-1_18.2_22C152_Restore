@interface CFXMediaSettings
+ (id)sharedInstance;
- (CFXMediaSettings)init;
- (CGSize)frameSize;
- (CGSize)renderSize;
- (OS_dispatch_queue)queue;
- (int)frameRate;
- (int)timeScale;
- (void)setFrameRate:(int)a3;
- (void)setFrameSize:(CGSize)a3;
- (void)setQueue:(id)a3;
- (void)setRenderSize:(CGSize)a3;
- (void)setTimeScale:(int)a3;
@end

@implementation CFXMediaSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_66);
  }
  v2 = (void *)sharedInstance_sharedCompositionSettings;
  return v2;
}

uint64_t __34__CFXMediaSettings_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CFXMediaSettings);
  uint64_t v1 = sharedInstance_sharedCompositionSettings;
  sharedInstance_sharedCompositionSettings = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (CFXMediaSettings)init
{
  v15.receiver = self;
  v15.super_class = (Class)CFXMediaSettings;
  v2 = [(CFXMediaSettings *)&v15 init];
  v3 = (CFXMediaSettings *)v2;
  if (v2)
  {
    *((void *)v2 + 1) = 0x1E0000001ELL;
    *(_OWORD *)(v2 + 40) = kDefaultRenderSize;
    *(_OWORD *)(v2 + 24) = kDefaultRenderSize;
    v4 = NSString;
    v5 = [MEMORY[0x263F086E0] jfxBundle];
    v6 = [v5 bundleIdentifier];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v4 stringWithFormat:@"%@.%@.queue", v6, v8];

    id v10 = v9;
    v11 = (const char *)[v10 UTF8String];
    dispatch_queue_t v12 = dispatch_queue_create(v11, MEMORY[0x263EF83A8]);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v12;
  }
  return v3;
}

- (int)timeScale
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v3 = [(CFXMediaSettings *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__CFXMediaSettings_timeScale__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __29__CFXMediaSettings_timeScale__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setTimeScale:(int)a3
{
  v5 = [(CFXMediaSettings *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__CFXMediaSettings_setTimeScale___block_invoke;
  v6[3] = &unk_264C0B450;
  v6[4] = self;
  int v7 = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __33__CFXMediaSettings_setTimeScale___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 8) = *(_DWORD *)(result + 40);
  return result;
}

- (int)frameRate
{
  v2 = self;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v3 = [(CFXMediaSettings *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__CFXMediaSettings_frameRate__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __29__CFXMediaSettings_frameRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 12);
  return result;
}

- (void)setFrameRate:(int)a3
{
  v5 = [(CFXMediaSettings *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__CFXMediaSettings_setFrameRate___block_invoke;
  v6[3] = &unk_264C0B450;
  v6[4] = self;
  int v7 = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __33__CFXMediaSettings_setFrameRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 12) = *(_DWORD *)(result + 40);
  return result;
}

- (CGSize)frameSize
{
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  dispatch_queue_t v12 = &unk_234D77F97;
  v3 = [(CFXMediaSettings *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__CFXMediaSettings_frameSize__block_invoke;
  v8[3] = &unk_264C09EE8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

__n128 __29__CFXMediaSettings_frameSize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 24);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = [(CFXMediaSettings *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CFXMediaSettings_setFrameSize___block_invoke;
  block[3] = &unk_264C0BB50;
  *(CGFloat *)&block[5] = width;
  *(CGFloat *)&block[6] = height;
  block[4] = self;
  dispatch_barrier_async(v6, block);
}

__n128 __33__CFXMediaSettings_setFrameSize___block_invoke(uint64_t a1)
{
  v2 = JFXLog_camera();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__CFXMediaSettings_setFrameSize___block_invoke_cold_1(a1);
  }

  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (CGSize)renderSize
{
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  dispatch_queue_t v12 = &unk_234D77F97;
  v3 = [(CFXMediaSettings *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__CFXMediaSettings_renderSize__block_invoke;
  v8[3] = &unk_264C09EE8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

__n128 __30__CFXMediaSettings_renderSize__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setRenderSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = [(CFXMediaSettings *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CFXMediaSettings_setRenderSize___block_invoke;
  block[3] = &unk_264C0BB50;
  *(CGFloat *)&block[5] = width;
  *(CGFloat *)&block[6] = height;
  block[4] = self;
  dispatch_barrier_async(v6, block);
}

__n128 __34__CFXMediaSettings_setRenderSize___block_invoke(uint64_t a1)
{
  v2 = JFXLog_camera();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__CFXMediaSettings_setFrameSize___block_invoke_cold_1(a1);
  }

  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __33__CFXMediaSettings_setFrameSize___block_invoke_cold_1(uint64_t a1)
{
  double v3 = OUTLINED_FUNCTION_2_4();
  double v5 = [v4 numberWithDouble:v3];
  double v6 = [*(id *)(v1 + 2584) numberWithDouble:*(double *)(a1 + 48)];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v7, v8, "size: {%@, %@}", v9, v10, v11, v12, v13);
}

@end