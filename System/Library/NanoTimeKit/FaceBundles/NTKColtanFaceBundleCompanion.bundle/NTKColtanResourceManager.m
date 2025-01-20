@interface NTKColtanResourceManager
+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3;
+ (void)_deallocInstance:(id)a3;
- (CLKUITexture)handLightTexture;
- (MTLComputePipelineState)blurDownsamplePipelineState;
- (MTLComputePipelineState)blurUpsamplePipelineState;
- (MTLComputePipelineState)scenePreparationComputePipelineState;
- (NTKColtanResourceManager)initWithPixelFormat:(unint64_t)a3;
- (id)_generatePipeline:(unint64_t)a3;
- (id)_makeComputePipelineWithFunctionName:(id)a3 config:(unint64_t)a4;
- (id)provideAtlasBacking:(id)a3;
- (id)renderPipelineForConfig:(unint64_t)a3;
- (id)resourceProviderKey;
- (id)shadowComputePipelineForConfig:(unint64_t)a3;
- (void)_asyncDeallocInstance;
- (void)addClient;
- (void)dealloc;
- (void)removeClient;
@end

@implementation NTKColtanResourceManager

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  if (!qword_16E10)
  {
    v5 = [[NTKColtanResourceManager alloc] initWithPixelFormat:a3];
    v6 = (void *)qword_16E10;
    qword_16E10 = (uint64_t)v5;
  }
  objc_sync_exit(v4);

  v7 = (void *)qword_16E10;
  if (*(void *)(qword_16E10 + 32) != a3) {
    sub_9C9C();
  }
  return v7;
}

+ (void)_deallocInstance:(id)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)qword_16E10;
  qword_16E10 = 0;

  objc_sync_exit(obj);
}

- (NTKColtanResourceManager)initWithPixelFormat:(unint64_t)a3
{
  v32.receiver = self;
  v32.super_class = (Class)NTKColtanResourceManager;
  id v4 = [(NTKColtanResourceManager *)&v32 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    resourceProviderKey = v4->_resourceProviderKey;
    v4->_resourceProviderKey = (CLKUIResourceProviderKey *)v5;

    uint64_t v7 = +[CLKUIMetalResourceManager sharedDevice];
    device = v4->_device;
    v4->_device = (MTLDevice *)v7;

    v9 = v4->_device;
    v10 = sub_46F4();
    v11 = (MTLLibrary *)[(MTLDevice *)v9 newDefaultLibraryWithBundle:v10 error:0];
    library = v4->_library;
    v4->_library = v11;

    v4->_pixelFormat = a3;
    v13 = +[CLKDevice currentDevice];
    CLKScaledValueWithCompactLuxoDeviceMetrics();
    *(float *)&double v14 = v14;
    int v31 = LODWORD(v14);
    CLKScaledValueWithCompactLuxoDeviceMetrics();
    *(float *)&double v15 = v15;
    int v30 = LODWORD(v15);
    CLKScaledValueWithCompactLuxoDeviceMetrics();
    *(float *)&double v16 = v16;
    int v29 = LODWORD(v16);
    CLKScaledValueWithCompactLuxoDeviceMetrics();
    *(float *)&double v17 = v17;
    int v28 = LODWORD(v17);
    CLKScaledValueWithCompactLuxoDeviceMetrics();
    *(float *)&double v18 = v18;
    int v27 = LODWORD(v18);
    CLKScaledValueWithCompactLuxoDeviceMetrics();
    *(float *)&double v19 = v19;
    int v26 = LODWORD(v19);
    [v13 screenBounds];
    float v21 = v20 / 162.0;
    float v25 = v21;
    uint64_t v22 = objc_opt_new();
    layoutConstants = v4->_layoutConstants;
    v4->_layoutConstants = (MTLFunctionConstantValues *)v22;

    [(MTLFunctionConstantValues *)v4->_layoutConstants setConstantValue:&v31 type:3 atIndex:3];
    [(MTLFunctionConstantValues *)v4->_layoutConstants setConstantValue:&v30 type:3 atIndex:4];
    [(MTLFunctionConstantValues *)v4->_layoutConstants setConstantValue:&v29 type:3 atIndex:5];
    [(MTLFunctionConstantValues *)v4->_layoutConstants setConstantValue:&v27 type:3 atIndex:6];
    [(MTLFunctionConstantValues *)v4->_layoutConstants setConstantValue:&v28 type:3 atIndex:7];
    [(MTLFunctionConstantValues *)v4->_layoutConstants setConstantValue:&v26 type:3 atIndex:8];
    [(MTLFunctionConstantValues *)v4->_layoutConstants setConstantValue:&v25 type:3 atIndex:9];
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKColtanResourceManager;
  [(NTKColtanResourceManager *)&v2 dealloc];
}

- (void)_asyncDeallocInstance
{
  unsigned int v2 = +[NSThread isMainThread];
  v3 = objc_opt_class();
  if (v2)
  {
    [v3 _deallocInstance:0];
  }
  else
  {
    objc_msgSend(v3, "performSelectorOnMainThread:withObject:waitUntilDone:", "_deallocInstance:");
  }
}

- (void)addClient
{
  id obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);
}

- (void)removeClient
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
  {
    [(NTKColtanResourceManager *)v2 _asyncDeallocInstance];
  }
}

- (CLKUITexture)handLightTexture
{
  handLightTexture = self->_handLightTexture;
  if (!handLightTexture)
  {
    id v4 = +[CLKUITexture textureWithProviderDelegate:self uuid:@"Coltan-Hand"];
    uint64_t v5 = self->_handLightTexture;
    self->_handLightTexture = v4;

    handLightTexture = self->_handLightTexture;
  }

  return handLightTexture;
}

- (id)_makeComputePipelineWithFunctionName:(id)a3 config:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  BOOL v22 = (v4 & 4) != 0;
  char v21 = v4 & 1;
  BOOL v20 = (v4 & 2) != 0;
  id v7 = [(MTLFunctionConstantValues *)self->_layoutConstants copy];
  [v7 setConstantValue:&v21 type:53 atIndex:0];
  [v7 setConstantValue:&v20 type:53 atIndex:1];
  [v7 setConstantValue:&v22 type:53 atIndex:2];
  library = self->_library;
  id v19 = 0;
  id v9 = [(MTLLibrary *)library newFunctionWithName:v6 constantValues:v7 error:&v19];
  id v10 = v19;
  if (v9)
  {
    device = self->_device;
    id v18 = v10;
    id v12 = [(MTLDevice *)device newComputePipelineStateWithFunction:v9 error:&v18];
    id v13 = v18;

    if (v12) {
      goto LABEL_10;
    }
    double v14 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      double v17 = self->_device;
      *(_DWORD *)buf = 138412802;
      id v24 = v6;
      __int16 v25 = 2112;
      int v26 = v17;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_fault_impl(&dword_0, v14, OS_LOG_TYPE_FAULT, "Coltan Metal compilation failure (nil computePiplineState): Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
    id v10 = v13;
  }
  else
  {
    double v14 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      double v16 = self->_device;
      *(_DWORD *)buf = 138412802;
      id v24 = v6;
      __int16 v25 = 2112;
      int v26 = v16;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_fault_impl(&dword_0, v14, OS_LOG_TYPE_FAULT, "Coltan Metal compilation failure (nil function): Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
    id v12 = 0;
  }

  id v13 = v10;
LABEL_10:

  return v12;
}

- (id)renderPipelineForConfig:(unint64_t)a3
{
  pipelineStates = self->_pipelineStates;
  id v6 = self->_pipelineStates[a3];
  if (!v6)
  {
    id v7 = [(NTKColtanResourceManager *)self _generatePipeline:a3];
    v8 = pipelineStates[a3];
    pipelineStates[a3] = v7;

    id v6 = v7;
  }

  return v6;
}

- (id)_generatePipeline:(unint64_t)a3
{
  BOOL v21 = (a3 & 4) != 0;
  unsigned __int8 v20 = a3 & 1;
  BOOL v19 = (a3 & 2) != 0;
  id v4 = [(MTLFunctionConstantValues *)self->_layoutConstants copy];
  [v4 setConstantValue:&v20 type:53 atIndex:0];
  [v4 setConstantValue:&v19 type:53 atIndex:1];
  [v4 setConstantValue:&v21 type:53 atIndex:2];
  uint64_t v5 = objc_opt_new();
  [v5 setLabel:@"Coltan render"];
  id v6 = [(MTLLibrary *)self->_library newFunctionWithName:@"compositeVertex"];
  [v5 setVertexFunction:v6];

  id v7 = [(MTLLibrary *)self->_library newFunctionWithName:@"compositeFragment" constantValues:v4 error:0];
  [v5 setFragmentFunction:v7];

  v8 = [v5 colorAttachments];
  id v9 = [v8 objectAtIndexedSubscript:0];

  [v9 setPixelFormat:self->_pixelFormat];
  [v9 setBlendingEnabled:0];
  if (v21 | v20)
  {
    [v9 setBlendingEnabled:1];
    [v9 setRgbBlendOperation:0];
    [v9 setAlphaBlendOperation:0];
    [v9 setSourceRGBBlendFactor:4];
    [v9 setSourceAlphaBlendFactor:4];
    [v9 setDestinationRGBBlendFactor:5];
    [v9 setDestinationAlphaBlendFactor:5];
  }
  device = self->_device;
  id v18 = 0;
  id v11 = [(MTLDevice *)device newRenderPipelineStateWithDescriptor:v5 error:&v18];
  id v12 = v18;
  if (!v11)
  {
    id v13 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      double v15 = [v5 fragmentFunction];
      double v16 = [v15 name];
      double v17 = self->_device;
      *(_DWORD *)buf = 138412802;
      v23 = v16;
      __int16 v24 = 2112;
      __int16 v25 = v17;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "Coltan Metal compilation failure: Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
  }

  return v11;
}

- (MTLComputePipelineState)blurUpsamplePipelineState
{
  uint64_t v3 = self->_blurUpsamplePipelineState;
  if (!v3)
  {
    id v4 = [(NTKColtanResourceManager *)self _makeComputePipelineWithFunctionName:@"Blur::upsample" config:0];
    blurUpsamplePipelineState = self->_blurUpsamplePipelineState;
    self->_blurUpsamplePipelineState = v4;

    uint64_t v3 = v4;
  }

  return v3;
}

- (MTLComputePipelineState)blurDownsamplePipelineState
{
  uint64_t v3 = self->_blurDownsamplePipelineState;
  if (!v3)
  {
    id v4 = [(NTKColtanResourceManager *)self _makeComputePipelineWithFunctionName:@"Blur::downsample" config:0];
    blurDownsamplePipelineState = self->_blurDownsamplePipelineState;
    self->_blurDownsamplePipelineState = v4;

    uint64_t v3 = v4;
  }

  return v3;
}

- (MTLComputePipelineState)scenePreparationComputePipelineState
{
  uint64_t v3 = self->_scenePreparationComputePipelineState;
  if (!v3)
  {
    id v4 = [(NTKColtanResourceManager *)self _makeComputePipelineWithFunctionName:@"placeLights" config:0];
    scenePreparationComputePipelineState = self->_scenePreparationComputePipelineState;
    self->_scenePreparationComputePipelineState = v4;

    uint64_t v3 = v4;
  }

  return v3;
}

- (id)shadowComputePipelineForConfig:(unint64_t)a3
{
  shadowComputePipelineStates = self->_shadowComputePipelineStates;
  id v6 = self->_shadowComputePipelineStates[a3];
  if (!v6)
  {
    id v7 = [(NTKColtanResourceManager *)self _makeComputePipelineWithFunctionName:@"shadow" config:a3];
    v8 = shadowComputePipelineStates[a3];
    shadowComputePipelineStates[a3] = v7;

    id v6 = v7;
  }

  return v6;
}

- (id)provideAtlasBacking:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Coltan-Hand"])
  {
    id v4 = sub_46F4();
    uint64_t v5 = [v4 pathForResource:v3 ofType:@"art"];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = +[CLKUIAtlasBacking atlasBackingWithArt:v5 uuid:v3];

      goto LABEL_8;
    }
    v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_9CC8((uint64_t)v3, v8);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstants, 0);
  for (uint64_t i = 0; i != -8; --i)
    objc_storeStrong((id *)&self->_pipelineStates[i + 7], 0);
  objc_storeStrong((id *)&self->_blurUpsamplePipelineState, 0);
  objc_storeStrong((id *)&self->_blurDownsamplePipelineState, 0);
  for (uint64_t j = 120; j != 56; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_scenePreparationComputePipelineState, 0);
  objc_storeStrong((id *)&self->_handLightTexture, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end