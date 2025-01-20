@interface AVTMetalHelper
+ (id)helperForDevice:(uint64_t)a1;
- (id)_initWithDevice:(id)a3;
- (id)_locked_computePipelineStateWithFunctionName:(id)a3;
- (id)_locked_functionNamed:(id)a3;
- (id)_locked_renderPipelineStateWithDescriptor:(id *)a3 hashNumber:(id)a4;
- (id)computePipelineStateWithFunctionName:(id)a1;
- (id)device;
- (id)functionNamed:(id)a1;
- (id)renderPipelineStateWithDescriptor:(void *)a1;
- (os_unfair_lock_s)library;
- (void)_locked_instanciateLibraryIfNeeded;
@end

@implementation AVTMetalHelper

- (id)_initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTMetalHelper;
  v6 = [(AVTMetalHelper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (id)helperForDevice:(uint64_t)a1
{
  id v2 = a2;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&helperForDevice___lock);
  if (!helperForDevice___helpers)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)helperForDevice___helpers;
    helperForDevice___helpers = (uint64_t)v3;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "registryID"));
  id v6 = [(id)helperForDevice___helpers objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = [[AVTMetalHelper alloc] _initWithDevice:v2];
    [(id)helperForDevice___helpers setObject:v6 forKeyedSubscript:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&helperForDevice___lock);

  return v6;
}

- (id)device
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_locked_instanciateLibraryIfNeeded
{
  if (!self->_library)
  {
    +[AVTResourceLocator sharedResourceLocator]();
    id v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v3, @"default.metallib", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (MTLLibrary *)[(MTLDevice *)self->_device newLibraryWithURL:v6 error:0];
    library = self->_library;
    self->_library = v4;
  }
}

- (os_unfair_lock_s)library
{
  if (a1)
  {
    id v2 = a1;
    id v3 = *(void **)&a1[4]._os_unfair_lock_opaque;
    if (!v3)
    {
      os_unfair_lock_lock(a1 + 6);
      [(os_unfair_lock_s *)v2 _locked_instanciateLibraryIfNeeded];
      os_unfair_lock_unlock(v2 + 6);
      id v3 = *(void **)&v2[4]._os_unfair_lock_opaque;
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)functionNamed:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [*((id *)a1 + 4) objectForKeyedSubscript:v3];
    if (!v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)a1 + 6);
      v4 = objc_msgSend(a1, "_locked_functionNamed:", v3);
      os_unfair_lock_unlock((os_unfair_lock_t)a1 + 6);
    }
    a1 = v4;
  }
  return a1;
}

- (id)_locked_functionNamed:(id)a3
{
  id v4 = a3;
  functions = self->_functions;
  if (!functions)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = self->_functions;
    self->_functions = v6;

    functions = self->_functions;
  }
  v8 = [(NSMutableDictionary *)functions objectForKeyedSubscript:v4];
  if (!v8)
  {
    [(AVTMetalHelper *)self _locked_instanciateLibraryIfNeeded];
    v8 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v4];
    [(NSMutableDictionary *)self->_functions setObject:v8 forKeyedSubscript:v4];
    if (!v8)
    {
      objc_super v9 = avt_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AVTMetalHelper _locked_functionNamed:](v9, v10, v11, v12, v13, v14, v15, v16);
      }

      v8 = 0;
    }
  }

  return v8;
}

- (id)renderPipelineStateWithDescriptor:(void *)a1
{
  id v3 = a1;
  if (a1)
  {
    unint64_t v4 = 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * *(void *)a2) ^ ((0x9DDFEA08EB382D69 * *(void *)a2) >> 47));
    unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
    unint64_t v6 = 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69
         * (v5 ^ ((0x9DDFEA08EB382D69 * (v5 ^ *(void *)(a2 + 8))) >> 47) ^ (0x9DDFEA08EB382D69
                                                                              * (v5 ^ *(void *)(a2 + 8))))) ^ ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (v5 ^ *(void *)(a2 + 8))) >> 47) ^ (0x9DDFEA08EB382D69 * (v5 ^ *(void *)(a2 + 8))))) >> 47));
    if (*(unsigned char *)(a2 + 16))
    {
      unint64_t v7 = 0x9DDFEA08EB382D69 * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ 1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ 1)));
      unint64_t v8 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                         * (*(void *)(a2 + 24) ^ (0x9DDFEA08EB382D69
                                                                                  * (v7 ^ (v7 >> 47))))) >> 47) ^ (0x9DDFEA08EB382D69 * (*(void *)(a2 + 24) ^ (0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47))))));
      unint64_t v9 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                         * ((0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47))) ^ *(void *)(a2 + 32))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47))) ^ *(void *)(a2 + 32))));
      unint64_t v10 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v9 ^ (v9 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                          * ((0x9DDFEA08EB382D69 * (v9 ^ (v9 >> 47))) ^ *(void *)(a2 + 40))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v9 ^ (v9 >> 47))) ^ *(void *)(a2 + 40))));
      unint64_t v11 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                            * ((0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47))) ^ *(void *)(a2 + 48))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47))) ^ *(void *)(a2 + 48))));
      unint64_t v12 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                            * ((0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))) ^ *(void *)(a2 + 56))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))) ^ *(void *)(a2 + 56))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v6 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69
           * (v13 ^ ((0x9DDFEA08EB382D69 * (v13 ^ *(void *)(a2 + 64))) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                   * (v13 ^ *(void *)(a2 + 64))))) ^ ((0x9DDFEA08EB382D69 * (v13 ^ ((0x9DDFEA08EB382D69 * (v13 ^ *(void *)(a2 + 64))) >> 47) ^ (0x9DDFEA08EB382D69 * (v13 ^ *(void *)(a2 + 64))))) >> 47));
    }
    uint64_t v14 = [*(id *)(a2 + 72) hash];
    uint64_t v15 = [*(id *)(a2 + 80) hash];
    unint64_t v16 = 0x9DDFEA08EB382D69
        * (v6 ^ ((0x9DDFEA08EB382D69 * (v14 ^ v6)) >> 47) ^ (0x9DDFEA08EB382D69 * (v14 ^ v6)));
    unint64_t v17 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69 * (v16 ^ (v16 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                          * (v15 ^ (0x9DDFEA08EB382D69 * (v16 ^ (v16 >> 47))))) >> 47) ^ (0x9DDFEA08EB382D69 * (v15 ^ (0x9DDFEA08EB382D69 * (v16 ^ (v16 >> 47))))));
    unint64_t v18 = 0x9DDFEA08EB382D69 * (v17 ^ (v17 >> 47));
    v19 = [NSNumber numberWithUnsignedLongLong:0x9DDFEA08EB382D69* ((0x9DDFEA08EB382D69* (v18 ^ ((0x9DDFEA08EB382D69 * (*(void *)(a2 + 88) ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69* (*(void *)(a2 + 88) ^ v18)))) ^ ((0x9DDFEA08EB382D69 * (v18 ^ ((0x9DDFEA08EB382D69 * (*(void *)(a2 + 88) ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69 * (*(void *)(a2 + 88) ^ v18)))) >> 47))];
    v20 = [*((id *)v3 + 5) objectForKeyedSubscript:v19];
    if (!v20)
    {
      os_unfair_lock_lock((os_unfair_lock_t)v3 + 6);
      long long v21 = *(_OWORD *)(a2 + 48);
      v27[2] = *(_OWORD *)(a2 + 32);
      v27[3] = v21;
      v22 = *(void **)(a2 + 72);
      uint64_t v28 = *(void *)(a2 + 64);
      long long v23 = *(_OWORD *)(a2 + 16);
      v27[0] = *(_OWORD *)a2;
      v27[1] = v23;
      id v29 = v22;
      id v24 = *(id *)(a2 + 80);
      uint64_t v25 = *(void *)(a2 + 88);
      id v30 = v24;
      uint64_t v31 = v25;
      v20 = objc_msgSend(v3, "_locked_renderPipelineStateWithDescriptor:hashNumber:", v27, v19);
      os_unfair_lock_unlock((os_unfair_lock_t)v3 + 6);
    }
    id v3 = v20;
  }
  return v3;
}

- (id)_locked_renderPipelineStateWithDescriptor:(id *)a3 hashNumber:(id)a4
{
  id v6 = a4;
  renderPipelineStates = self->_renderPipelineStates;
  if (!renderPipelineStates)
  {
    unint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v9 = self->_renderPipelineStates;
    self->_renderPipelineStates = v8;

    renderPipelineStates = self->_renderPipelineStates;
  }
  unint64_t v10 = [(NSMutableDictionary *)renderPipelineStates objectForKeyedSubscript:v6];
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F129C8]);
    unint64_t v12 = [v11 colorAttachments];
    unint64_t v13 = [v12 objectAtIndexedSubscript:0];

    [v13 setPixelFormat:a3->var0];
    [v11 setDepthAttachmentPixelFormat:a3->var1];
    [v13 setBlendingEnabled:a3->var2];
    [v13 setRgbBlendOperation:a3->var3];
    [v13 setSourceRGBBlendFactor:a3->var4];
    [v13 setDestinationRGBBlendFactor:a3->var5];
    [v13 setAlphaBlendOperation:a3->var6];
    [v13 setSourceAlphaBlendFactor:a3->var7];
    [v13 setDestinationAlphaBlendFactor:a3->var8];
    uint64_t v14 = [(AVTMetalHelper *)self _locked_functionNamed:a3->var9];
    [v11 setVertexFunction:v14];

    uint64_t v15 = [(AVTMetalHelper *)self _locked_functionNamed:a3->var10];
    [v11 setFragmentFunction:v15];

    [v11 setRasterSampleCount:a3->var11];
    device = self->_device;
    id v27 = 0;
    unint64_t v10 = (void *)[(MTLDevice *)device newRenderPipelineStateWithDescriptor:v11 error:&v27];
    id v17 = v27;
    [(NSMutableDictionary *)self->_renderPipelineStates setObject:v10 forKeyedSubscript:v6];

    if (!v10)
    {
      unint64_t v18 = avt_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AVTMetalHelper _locked_renderPipelineStateWithDescriptor:hashNumber:](v18, v19, v20, v21, v22, v23, v24, v25);
      }

      unint64_t v10 = 0;
    }
  }

  return v10;
}

- (id)computePipelineStateWithFunctionName:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = [*((id *)a1 + 6) objectForKeyedSubscript:v3];
    if (!v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)a1 + 6);
      unint64_t v4 = objc_msgSend(a1, "_locked_computePipelineStateWithFunctionName:", v3);
      os_unfair_lock_unlock((os_unfair_lock_t)a1 + 6);
    }
    a1 = v4;
  }
  return a1;
}

- (id)_locked_computePipelineStateWithFunctionName:(id)a3
{
  id v4 = a3;
  computePipelineStates = self->_computePipelineStates;
  if (!computePipelineStates)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v7 = self->_computePipelineStates;
    self->_computePipelineStates = v6;

    computePipelineStates = self->_computePipelineStates;
  }
  unint64_t v8 = [(NSMutableDictionary *)computePipelineStates objectForKeyedSubscript:v4];
  if (!v8)
  {
    unint64_t v9 = [(AVTMetalHelper *)self _locked_functionNamed:v4];
    device = self->_device;
    id v21 = 0;
    unint64_t v8 = (void *)[(MTLDevice *)device newComputePipelineStateWithFunction:v9 error:&v21];
    id v11 = v21;
    [(NSMutableDictionary *)self->_computePipelineStates setObject:v8 forKeyedSubscript:v4];

    if (!v8)
    {
      unint64_t v12 = avt_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AVTMetalHelper _locked_renderPipelineStateWithDescriptor:hashNumber:](v12, v13, v14, v15, v16, v17, v18, v19);
      }

      unint64_t v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computePipelineStates, 0);
  objc_storeStrong((id *)&self->_renderPipelineStates, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_locked_functionNamed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_locked_renderPipelineStateWithDescriptor:(uint64_t)a3 hashNumber:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end