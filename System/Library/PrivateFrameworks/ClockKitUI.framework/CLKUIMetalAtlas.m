@interface CLKUIMetalAtlas
+ (id)_allocateMTLTextureWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4 device:(id)a5;
+ (id)_createMTLTextureWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4 device:(id)a5 encoder:(id)a6;
+ (id)_uploadMTLTexture:(id)a3 withBacking:(id)a4 numMipmapLevelsToDrop:(unint64_t)a5 device:(id)a6 encoder:(id)a7;
+ (unint64_t)_computeMTLTextureMemoryUsageWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4;
- (CLKUIMetalAtlas)initWithUuid:(id)a3 nilTexture:(id)a4 streaming:(BOOL)a5;
- (MTLTexture)nilTexture;
- (void)bind:(id)a3 slot:(unint64_t)a4;
- (void)dealloc;
- (void)finishPrewarm;
- (void)prewarm;
- (void)purge;
- (void)updateTextureStreaming;
@end

@implementation CLKUIMetalAtlas

- (CLKUIMetalAtlas)initWithUuid:(id)a3 nilTexture:(id)a4 streaming:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKUIMetalAtlas;
  v10 = [(CLKUIAtlas *)&v13 initWithUuid:a3];
  v11 = v10;
  if (v10)
  {
    v10->_mainQueue_prewarmState = 0;
    objc_storeStrong((id *)&v10->_nilTexture, a4);
    v11->_streaming = a5;
    v11->_needsStreaming = a5;
  }

  return v11;
}

- (void)dealloc
{
  __assert_rtn("-[CLKUIMetalAtlas dealloc]", "CLKUIMetalTexture.m", 179, "_texture == nil");
}

+ (unint64_t)_computeMTLTextureMemoryUsageWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4
{
  id v4 = a3;
  if (v4)
  {
    [v4 structure];
    +[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]();
  }

  return 0;
}

+ (id)_allocateMTLTextureWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4 device:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (v6)
  {
    kdebug_trace();
    objc_msgSend(v6, "structure", 0, 0);
    +[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]();
  }

  return 0;
}

+ (id)_uploadMTLTexture:(id)a3 withBacking:(id)a4 numMipmapLevelsToDrop:(unint64_t)a5 device:(id)a6 encoder:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if (v11)
  {
    kdebug_trace();
    [v11 structure];
    +[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]();
  }

  return 0;
}

+ (id)_createMTLTextureWithBacking:(id)a3 numMipmapLevelsToDrop:(unint64_t)a4 device:(id)a5 encoder:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[CLKUIMetalAtlas _allocateMTLTextureWithBacking:v9 numMipmapLevelsToDrop:a4 device:v10];
  id v13 = +[CLKUIMetalAtlas _uploadMTLTexture:v12 withBacking:v9 numMipmapLevelsToDrop:a4 device:v10 encoder:v11];

  return v12;
}

- (void)prewarm
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = [a1 uuid];
  id v6 = @"none";
  if (*a2 == 1) {
    id v6 = @"prewarming";
  }
  if (*a2 == 2) {
    id v7 = @"prewarmed";
  }
  else {
    id v7 = v6;
  }
  v8 = v7;
  int v9 = 138412546;
  id v10 = v5;
  __int16 v11 = 2112;
  id v12 = v8;
  _os_log_error_impl(&dword_1D3174000, a3, OS_LOG_TYPE_ERROR, "Not prewarming %@ because prewarmState = %@, but the texture is already loaded", (uint8_t *)&v9, 0x16u);
}

void __26__CLKUIMetalAtlas_prewarm__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = +[CLKUIMetalAtlas _createMTLTextureWithBacking:*(void *)(a1 + 32) numMipmapLevelsToDrop:*(void *)(a1 + 56) device:*(void *)(a1 + 40) encoder:0];
    id v4 = (void *)WeakRetained[16];
    WeakRetained[16] = v3;

    v5 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [WeakRetained uuid];
      *(_DWORD *)buf = 138412290;
      int v9 = v6;
      _os_log_impl(&dword_1D3174000, v5, OS_LOG_TYPE_DEFAULT, "Finished prewarming texture %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__CLKUIMetalAtlas_prewarm__block_invoke_22;
    block[3] = &unk_1E697BF48;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __26__CLKUIMetalAtlas_prewarm__block_invoke_22(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 136) == 1) {
    *(void *)(v1 + 136) = 2;
  }
  return result;
}

- (void)finishPrewarm
{
  if (self->_loaderQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__CLKUIMetalAtlas_finishPrewarm__block_invoke;
    block[3] = &unk_1E697BF48;
    block[4] = self;
    dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_sync((dispatch_queue_t)self->_loaderQueue, v3);
    id v4 = +[CLKUIResourceManager sharedInstance];
    [v4 returnTextureLoadingQueue:self->_loaderQueue];

    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;
  }
}

void __32__CLKUIMetalAtlas_finishPrewarm__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_block_t v3 = [*(id *)(a1 + 32) uuid];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D3174000, v2, OS_LOG_TYPE_DEFAULT, "Loading prewarmed texture %@", (uint8_t *)&v6, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(*(void *)(a1 + 32) + 128));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = 0;

  *(void *)(*(void *)(a1 + 32) + 136) = 2;
}

- (void)bind:(id)a3 slot:(unint64_t)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CLKUIAtlas *)self uuid];

  if (!v7) {
    goto LABEL_46;
  }
  if (self->_loaderQueue) {
    [(CLKUIMetalAtlas *)self finishPrewarm];
  }
  if (self->_streaming)
  {
    unint64_t v8 = 0x1E697B000uLL;
    unint64_t v9 = 0x1EA6A4000;
    if (self->_needsStreaming)
    {
      self->_needsStreaming = 0;
      id v10 = [(CLKUIAtlas *)self backing];
      if (v10)
      {
        unint64_t numMipmapLevelsDropped = self->_numMipmapLevelsDropped;
        unint64_t v12 = +[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:v10 numMipmapLevelsToDrop:numMipmapLevelsDropped];
        v61 = +[CLKUIResourceManager sharedInstance];
        if (([v61 ensureMemoryAvailable:v12] & 1) == 0)
        {
          uint64_t v13 = CLKLoggingObjectForDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [(CLKUIAtlas *)self uuid];
            *(_DWORD *)buf = 138412290;
            v73 = v14;
            _os_log_impl(&dword_1D3174000, v13, OS_LOG_TYPE_DEFAULT, "failed to ensure enough memory for %@", buf, 0xCu);
          }
        }
        v15 = [v6 device];
        v16 = v15;
        unint64_t v60 = a4;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = +[CLKUIMetalResourceManager sharedDevice];
        }
        v30 = v17;

        v31 = +[CLKUIMetalAtlas _allocateMTLTextureWithBacking:v10 numMipmapLevelsToDrop:numMipmapLevelsDropped device:v30];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke;
        aBlock[3] = &unk_1E697BD68;
        aBlock[4] = self;
        id v32 = v31;
        id v71 = v32;
        v33 = _Block_copy(aBlock);
        v34 = _Block_copy(v33);
        id streamingCompletionBlock = self->_streamingCompletionBlock;
        self->_id streamingCompletionBlock = v34;

        v36 = +[CLKUIMetalResourceManager textureStreamingQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke_2;
        block[3] = &unk_1E697C438;
        id v63 = v32;
        id v10 = v10;
        unint64_t v69 = numMipmapLevelsDropped;
        id v64 = v10;
        id v65 = v30;
        id v37 = v6;
        id v66 = v37;
        v67 = self;
        id v68 = v33;
        id v38 = v33;
        id v39 = v30;
        id v40 = v32;
        dispatch_async(v36, block);

        self->_mainQueue_prewarmState = 2;
        [(CLKUIAtlas *)self setStatus:3];
        [v61 notifyAtlas:self willChangeToMemoryCost:v12];
        [(CLKUIAtlas *)self setMemoryCost:v12];

        unint64_t v9 = 0x1EA6A4000uLL;
        if (self->_texture)
        {
          unint64_t v8 = 0x1E697B000;
          a4 = v60;
        }
        else
        {
          unint64_t v41 = [v10 width];
          unint64_t v42 = [v10 height];
          unint64_t v43 = 0;
          while (v41 > [(CLKUIAtlas *)self maxPlaceholderSize]
               || v42 > [(CLKUIAtlas *)self maxPlaceholderSize])
          {
            ++v43;
            v41 >>= 1;
            v42 >>= 1;
          }
          if (self->_numMipmapLevelsDropped <= v43) {
            unint64_t v44 = v43;
          }
          else {
            unint64_t v44 = self->_numMipmapLevelsDropped;
          }
          v45 = [v37 device];
          v46 = v45;
          if (v45)
          {
            id v47 = v45;
          }
          else
          {
            id v47 = +[CLKUIMetalResourceManager sharedDevice];
          }
          v48 = v47;

          v49 = +[CLKUIMetalAtlas _createMTLTextureWithBacking:v10 numMipmapLevelsToDrop:v44 device:v48 encoder:v37];
          texture = self->_texture;
          self->_texture = v49;

          if (self->_mainQueue_prewarmState != 2) {
            -[CLKUIMetalAtlas bind:slot:]();
          }
          a4 = v60;
          if ([(CLKUIAtlas *)self status] != 3) {
            -[CLKUIMetalAtlas bind:slot:]();
          }

          unint64_t v8 = 0x1E697B000uLL;
        }
      }
    }
    else
    {
      id v10 = 0;
    }
    if ([*(id *)(v8 + 1704) synchronousTextureStreamingEnabled])
    {
      id v51 = self->_streamingCompletionBlock;
      if (v51)
      {
        unint64_t v52 = v8;
        v53 = (void (**)(void))_Block_copy(v51);
        id v54 = self->_streamingCompletionBlock;
        self->_id streamingCompletionBlock = 0;

        v55 = [*(id *)(v52 + 1704) textureStreamingQueue];
        dispatch_sync(v55, &__block_literal_global_12);

        v53[2](v53);
      }
    }

    uint64_t v18 = *(int *)(v9 + 2584);
  }
  else
  {
    uint64_t v18 = 80;
    if (!self->_texture)
    {
      v19 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(CLKUIAtlas *)self uuid];
        *(_DWORD *)buf = 138412290;
        v73 = v20;
        _os_log_impl(&dword_1D3174000, v19, OS_LOG_TYPE_DEFAULT, "Texure not prewarmed. %@", buf, 0xCu);
      }
      v21 = [(CLKUIAtlas *)self backing];
      if (v21)
      {
        unint64_t v22 = self->_numMipmapLevelsDropped;
        unint64_t v23 = +[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:v21 numMipmapLevelsToDrop:v22];
        v24 = +[CLKUIResourceManager sharedInstance];
        if (([v24 ensureMemoryAvailable:v23] & 1) == 0)
        {
          v25 = CLKLoggingObjectForDomain();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [(CLKUIAtlas *)self uuid];
            *(_DWORD *)buf = 138412290;
            v73 = v26;
            _os_log_impl(&dword_1D3174000, v25, OS_LOG_TYPE_DEFAULT, "failed to ensure enough memory for %@", buf, 0xCu);
          }
        }
        v27 = [v6 device];
        v28 = v27;
        if (v27)
        {
          id v29 = v27;
        }
        else
        {
          id v29 = +[CLKUIMetalResourceManager sharedDevice];
        }
        v57 = v29;

        v58 = +[CLKUIMetalAtlas _createMTLTextureWithBacking:v21 numMipmapLevelsToDrop:v22 device:v57 encoder:v6];
        v59 = self->_texture;
        self->_texture = v58;

        self->_mainQueue_prewarmState = 2;
        [(CLKUIAtlas *)self setStatus:3];
        [v24 notifyAtlas:self willChangeToMemoryCost:v23];
        [(CLKUIAtlas *)self setMemoryCost:v23];
      }
    }
  }
  if (*(Class *)((char *)&self->super.super.isa + v18))
  {
    [(CLKUIAtlas *)self setBoundTime:CACurrentMediaTime()];
    nilTexture = *(Class *)((char *)&self->super.super.isa + v18);
  }
  else
  {
LABEL_46:
    nilTexture = self->_nilTexture;
  }
  [v6 setFragmentTexture:nilTexture atIndex:a4];
}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke(uint64_t a1)
{
}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke_2(void *a1)
{
  id v2 = +[CLKUIMetalAtlas _uploadMTLTexture:a1[4] withBacking:a1[5] numMipmapLevelsToDrop:a1[10] device:a1[6] encoder:a1[7]];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke_3;
  v4[3] = &unk_1E697C410;
  dispatch_block_t v3 = (void *)a1[9];
  v4[4] = a1[8];
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 112);
  if (v3 == v2)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0;
  }
}

- (void)purge
{
  uint64_t v3 = [(CLKUIAtlas *)self uuid];

  if (v3)
  {
    if (self->_loaderQueue) {
      [(CLKUIMetalAtlas *)self finishPrewarm];
    }
    if (self->_streaming)
    {
      if ([(CLKUIAtlas *)self isPurgable])
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __24__CLKUIMetalAtlas_purge__block_invoke;
        aBlock[3] = &unk_1E697BF48;
        aBlock[4] = self;
        uint64_t v4 = _Block_copy(aBlock);
        id v5 = _Block_copy(v4);
        id streamingCompletionBlock = self->_streamingCompletionBlock;
        self->_id streamingCompletionBlock = v5;

        id v7 = +[CLKUIMetalResourceManager textureStreamingQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __24__CLKUIMetalAtlas_purge__block_invoke_2;
        block[3] = &unk_1E697C410;
        void block[4] = self;
        id v13 = v4;
        id v8 = v4;
        dispatch_async(v7, block);

        self->_needsStreaming = 1;
        [(CLKUIAtlas *)self setStatus:4];
        unint64_t v9 = +[CLKUIResourceManager sharedInstance];
        [v9 notifyAtlas:self willChangeToMemoryCost:0];
        [(CLKUIAtlas *)self setMemoryCost:0];
        self->_mainQueue_prewarmState = 0;
      }
    }
    else if (self->_texture && [(CLKUIAtlas *)self isPurgable])
    {
      texture = self->_texture;
      self->_texture = 0;

      [(CLKUIAtlas *)self setStatus:4];
      id v11 = +[CLKUIResourceManager sharedInstance];
      [v11 notifyAtlas:self willChangeToMemoryCost:0];
      [(CLKUIAtlas *)self setMemoryCost:0];
      self->_mainQueue_prewarmState = 0;
    }
  }
}

void __24__CLKUIMetalAtlas_purge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = 0;
}

void __24__CLKUIMetalAtlas_purge__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __24__CLKUIMetalAtlas_purge__block_invoke_3;
  v2[3] = &unk_1E697C410;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __24__CLKUIMetalAtlas_purge__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 112);
  if (v3 == v2)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0;
  }
}

- (void)updateTextureStreaming
{
  unint64_t v3 = [(CLKUIAtlas *)self maxMipmapLevelsToDrop];
  unint64_t numMipmapLevelsDropped = self->_numMipmapLevelsDropped;
  if (v3 != numMipmapLevelsDropped)
  {
    unint64_t v5 = numMipmapLevelsDropped - (v3 != 0);
    unint64_t v6 = numMipmapLevelsDropped + 1;
    if (v3 <= v5 || v3 > v6)
    {
      self->_unint64_t numMipmapLevelsDropped = v3;
      self->_needsStreaming = 1;
    }
  }
  if (!+[CLKUIMetalResourceManager synchronousTextureStreamingEnabled])
  {
    double v8 = CACurrentMediaTime();
    [(CLKUIAtlas *)self boundTime];
    double v10 = v9;
    if ([(CLKUIAtlas *)self isPurgable])
    {
      if (v8 - v10 > 1.0)
      {
        [(CLKUIMetalAtlas *)self purge];
      }
    }
  }
}

- (MTLTexture)nilTexture
{
  return self->_nilTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilTexture, 0);
  objc_storeStrong((id *)&self->_loaderQueue_prewarmedTexture, 0);
  objc_storeStrong((id *)&self->_loaderQueue, 0);
  objc_storeStrong(&self->_streamingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.1()
{
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 225, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 226, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.4()
{
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.5()
{
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.6()
{
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.7()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 229, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:.cold.8()
{
  __assert_rtn("+[CLKUIMetalAtlas _computeMTLTextureMemoryUsageWithBacking:numMipmapLevelsToDrop:]", "CLKUIMetalTexture.m", 227, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.1()
{
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 323, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 324, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.4()
{
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.5()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 327, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:.cold.6()
{
  __assert_rtn("+[CLKUIMetalAtlas _allocateMTLTextureWithBacking:numMipmapLevelsToDrop:device:]", "CLKUIMetalTexture.m", 325, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.1()
{
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 405, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 406, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.4()
{
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.5()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 506, "planeStart == (uint8_t*)opt.bytes + opt.bytesLength");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.6()
{
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.7()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 409, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:.cold.8()
{
  __assert_rtn("+[CLKUIMetalAtlas _uploadMTLTexture:withBacking:numMipmapLevelsToDrop:device:encoder:]", "CLKUIMetalTexture.m", 407, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

- (void)bind:slot:.cold.1()
{
  __assert_rtn("-[CLKUIMetalAtlas bind:slot:]", "CLKUIMetalTexture.m", 734, "self.status == CLKUIContentStatusReady");
}

- (void)bind:slot:.cold.2()
{
  __assert_rtn("-[CLKUIMetalAtlas bind:slot:]", "CLKUIMetalTexture.m", 733, "_mainQueue_prewarmState == CLKUIMetalAtlasPrewarmStatePrewarmed");
}

@end