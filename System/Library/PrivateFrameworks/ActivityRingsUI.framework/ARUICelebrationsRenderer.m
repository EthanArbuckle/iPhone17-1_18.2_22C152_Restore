@interface ARUICelebrationsRenderer
- (ARUICelebrationsRenderer)initWithDevice:(id)a3 commandQueue:(id)a4;
- (BOOL)_needsCelebrationRenderPassOn:(id)a3;
- (void)renderCelebrationsForRings:(id)a3 withCommandBuffer:(id)a4 intoTexture:(id)a5 withContext:(id)a6;
@end

@implementation ARUICelebrationsRenderer

void __58__ARUICelebrationsRenderer__needsCelebrationRenderPassOn___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 celebration];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)renderCelebrationsForRings:(id)a3 withCommandBuffer:(id)a4 intoTexture:(id)a5 withContext:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(ARUICelebrationsRenderer *)self _needsCelebrationRenderPassOn:v10])
  {
    id v24 = v12;
    [(VFXRenderer *)self->_renderer setTexture:v12];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v25 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v20 = [v19 celebration];
          v21 = v20;
          if (v20)
          {
            [v20 apply:v19 context:v13];
            renderer = self->_renderer;
            v23 = [v21 scene];
            [(VFXRenderer *)renderer setScene:v23];

            [(VFXRenderer *)self->_renderer encodeWithCommandBuffer:v11];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    id v12 = v24;
    id v10 = v25;
  }
}

- (BOOL)_needsCelebrationRenderPassOn:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__ARUICelebrationsRenderer__needsCelebrationRenderPassOn___block_invoke;
  v6[3] = &unk_264499008;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (ARUICelebrationsRenderer)initWithDevice:(id)a3 commandQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUICelebrationsRenderer;
  v8 = [(ARUICelebrationsRenderer *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_device, v6);
    uint64_t v10 = [objc_alloc(MEMORY[0x263F84610]) initWithCommandQueue:v7];
    renderer = v9->_renderer;
    v9->_renderer = (VFXRenderer *)v10;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_destroyWeak((id *)&self->_device);
}

@end