@interface SCNMTLResourceManager
+ (SCNMTLResourceManager)resourceManagerForDevice:(uint64_t)a1;
+ (void)_fillVertexDescriptor:(id)a3 withMeshSource:(__C3DMeshSource *)a4 semantic:(char)a5 inputSet:(int64_t)a6 bufferIndex:(int64_t)a7;
+ (void)_fillVertexDescriptor:(id)a3 withSemantic:(char)a4 inputSet:(int64_t)a5 bufferIndex:(int64_t)a6 vertexFormat:(unint64_t)a7 offset:(unint64_t)a8 stride:(unint64_t)a9;
+ (void)unregisterManagerForDevice:(id)a3;
- (BOOL)_copyImage:(__C3DImage *)a3 toTexture:(id)a4 desc:(id)a5 textureOptions:(int)a6 needsMipMapGeneration:(BOOL)a7;
- (BOOL)hasCommonProfilePrecompiledFunctions;
- (SCNMTLMesh)renderResourceForMesh:(int)a3 dataKind:;
- (SCNMTLMeshElement)renderResourceForMeshElement:(uint64_t)a1;
- (SCNMTLResourceManager)initWithDevice:(id)a3;
- (SCNMTLShadable)renderResourceForMaterial:(__C3DGeometry *)a3 geometry:(SCNMTLRenderPipeline *)a4 renderPipeline:(uint64_t)a5 engineContext:;
- (SCNMTLTessellator)renderResourceForTessellatedGeometry:(uint64_t)a1;
- (SCNMetalWireframeResource)wireframeResourceForRendererElement:(uint64_t)a3 engineContext:(unsigned __int8 *)a4 passInstance:(uint64_t)a5 hashPass:;
- (__C3DFXMetalProgram)defaultProgramUsingTessellation:(BOOL)a3;
- (id)_bufferForData:(__CFData *)a3 bytesPerIndex:(unint64_t)a4;
- (id)_bufferForMTLBuffer:(void *)a3;
- (id)_computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a6;
- (id)_newComputeDescriptorForPipelineDesc:(id *)a3 library:(id)a4;
- (id)_textureDescriptorFromImage:(__C3DImage *)a3 needsMipMap:(BOOL)a4 textureOptions:(int)a5;
- (id)areaLightPrecomputedDataTexture;
- (id)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceColorSpace:(CGColorSpace *)a7 destinationColorSpace:(CGColorSpace *)a8 renderContext:(id)a9;
- (id)colorMatchingComputePipelineStateForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4 renderContext:(id)a5;
- (id)computeEvaluatorWithContext:(MTLContext *)a3 srcDesc:(const BufferDescriptor *)a4 dstDesc:(const BufferDescriptor *)a5 duDesc:(const BufferDescriptor *)a6 dvDesc:(const BufferDescriptor *)a7;
- (id)computePipelineStateForKernel:(id)a3;
- (id)computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5;
- (id)computePipelineStateForKernel:(id)a3 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a4;
- (id)computePipelineStateForKernel:(id)a3 withStageDescriptor:(id)a4 stageDescriptorUpdateBlock:(id)a5 constants:(id)a6 constantsHash:(id)a7;
- (id)copyTextureByConvertingToCubeMapIfApplicable:(id)a3 engineContext:(__C3DEngineContext *)a4 needsMipmap:(BOOL)a5;
- (id)defaultCubeTexture;
- (id)defaultLightingEnvironmentIrradianceTexture;
- (id)defaultLightingEnvironmentRadianceTexture;
- (id)defaultTexture;
- (id)defaultTexture3D;
- (id)getUniqueStageDescriptor:(id)a3;
- (id)iesTextureForProfile:(id)a3 renderContext:(id)a4;
- (id)irradianceTextureForEnvironmentTexture:(id)a3 renderContext:(id)a4 applySH:(id)a5;
- (id)irradianceTextureForPrecomputedLightingEnvironment:(id)a3;
- (id)latlongTextureForCubemap:(id)a3 pixelFormat:(unint64_t)a4 renderContext:(id)a5 needsMipmap:(BOOL)a6;
- (id)lazyMTKTextureLoader;
- (id)newComputePipelineStateForDesc:(id *)a3 library:(id)a4;
- (id)newComputePipelineStateWithFunctionName:(id)a3;
- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4;
- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4;
- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4 constantValues:(id)a5;
- (id)newCubemapTextureForLatlongTexture:(id)a3 pixelFormat:(unint64_t)a4 engineContext:(__C3DEngineContext *)a5 needsMipmap:(BOOL)a6;
- (id)newRadianceTextureForEnvironmentTexture:(id)a3 engineContext:(__C3DEngineContext *)a4 cpuAccessible:(BOOL)a5 commandBuffer:(id)a6;
- (id)newRenderPipelineStateWithDesc:(id *)a3;
- (id)newTextureUsingMTKTextureLoaderWithData:(id)a3 options:(id)a4;
- (id)newTextureUsingMTKTextureLoaderWithURL:(id)a3 options:(id)a4;
- (id)newTextureWithDescriptor:(id)a3;
- (id)radianceTextureForEnvironmentTexture:(id)a3 engineContext:(__C3DEngineContext *)a4 commandBuffer:(id)a5;
- (id)radianceTextureForPrecomputedLightingEnvironment:(id)a3;
- (id)renderResourceForDeformerStack:(__C3DDeformerStack *)a3 node:(__C3DNode *)a4 dataKind:(unsigned __int8)a5;
- (id)renderResourceForEffectSlot:(__C3DEffectSlot *)a3 withEngineContext:(__C3DEngineContext *)a4 didFallbackToDefaultTexture:(BOOL *)a5;
- (id)renderResourceForImage:(__C3DImage *)a3 sampler:(__C3DTextureSampler *)a4 options:(int)a5 engineContext:(__C3DEngineContext *)a6 didFallbackToDefaultTexture:(BOOL *)a7;
- (id)renderResourceForImageProxy:(__C3DImageProxy *)a3 sampler:(__C3DTextureSampler *)a4 engineContext:(__C3DEngineContext *)a5 didFallbackToDefaultTexture:(BOOL *)a6;
- (id)renderResourceForMorpher:(__C3DMorpher *)a3 baseMesh:(__C3DMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6;
- (id)renderResourceForProgramDesc:(id *)a3 renderPassDescriptor:(id)a4;
- (id)renderResourceForSkinner:(__C3DSkinner *)a3 baseMesh:(__C3DMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6;
- (id)shFromCPU:(id)a3 commandBuffer:(id)a4;
- (id)specularDFGDiffuseHammonTextureWithRenderContext:(id)a3;
- (id)sphericalHarmonicsForEnvironmentTexture:(id)a3 order:(unint64_t)a4 commandBuffer:(id)a5;
- (id)unstageTexture:(id)a3 commandBuffer:(id)a4;
- (uint64_t)commandQueue;
- (uint64_t)depthAndStencilStateWithReadWriteDepthDisabled;
- (uint64_t)dispatchForCubemap:(void *)a3 computeEncoder:(void *)a4 pipelineState:;
- (uint64_t)dispatchForTexture:(void *)a3 computeEncoder:(void *)a4 pipelineState:;
- (uint64_t)libraryManager;
- (uint64_t)newBufferWithBytes:(uint64_t)a3 length:(uint64_t)a4 options:;
- (uint64_t)newBufferWithLength:(uint64_t)a3 options:;
- (uint64_t)newConstantBufferWithLength:(uint64_t)a3 options:;
- (uint64_t)newPrivateBufferWithBytes:(uint64_t)a3 length:(void *)a4 blitEncoder:;
- (uint64_t)stats;
- (void)__updateMutableMesh:(__C3DMesh *)a3 withMetalMesh:(id)a4;
- (void)_bakeSphericalHamonicsBasedIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 renderContext:(id)a5 applySH:(id)a6;
- (void)_bakeStochasticIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 mipmapLevelForSampling:(unint64_t)a5 renderContext:(id)a6;
- (void)_configureComputePipeline:(id)a3 withDescriptor:(id)a4;
- (void)_createPipelineStateWithDescriptor:(id)a3 desc:(id *)a4 pipeline:(id)a5;
- (void)_deformerStackDidChange:(id)a3;
- (void)_deformerStackWillDie:(id)a3;
- (void)_enqueueCopyFromTexture:(id)a3 toTexture:(id)a4 blitEncoder:(SCNMTLBlitCommandEncoder *)a5 generateMipMaps:(BOOL)a6;
- (void)_geometryWillDie:(id)a3;
- (void)_imageProxyWillDie:(id)a3;
- (void)_imageWillDie:(id)a3;
- (void)_materialWillDie:(id)a3;
- (void)_meshElementWillDie:(id)a3;
- (void)_meshSourceWillDie:(id)a3;
- (void)_meshWillDie:(id)a3;
- (void)_morphWillDie:(id)a3;
- (void)_passWillDie:(id)a3;
- (void)_precomputedLightingEnvironmentWillDie:(id)a3;
- (void)_programHashCodeWillDie:(id)a3;
- (void)_programWillDie:(id)a3;
- (void)_rasterizerStateDidDie:(const void *)a3;
- (void)_removeMatchingProgram:(__C3DFXMetalProgram *)a3 pass:(__C3DFXPass *)a4;
- (void)_skinWillDie:(id)a3;
- (void)colorMatchBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceTextureY:(id)a7 sourceTextureCbCr:(id)a8 sourceColorSpace:(CGColorSpace *)a9 destinationColorSpace:(CGColorSpace *)a10 destinationTexture:(id)a11 renderContext:(id)a12;
- (void)colorMatchSourceTexture:(id)a3 sourceColorSpace:(CGColorSpace *)a4 destinationColorSpace:(CGColorSpace *)a5 destinationTexture:(id)a6 renderContext:(id)a7;
- (void)commandBufferDidCompleteWithError:(id)a3;
- (void)dealloc;
- (void)removeAllShaders;
- (void)renderResourceForMeshSource:(uint64_t)a1;
- (void)renderResourceForRasterizerState:(int)a3 reverseZ:;
- (void)renderResourceForSampler:(uint64_t)a1;
- (void)resetRasterizerStates;
@end

@implementation SCNMTLResourceManager

- (void)_programWillDie:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 object];
  p_lock = &self->_availableShadables.lock;
  os_unfair_lock_lock(&self->_availableShadables.lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  registry = self->_availableShadables.registry;
  uint64_t v7 = [(NSMapTable *)registry countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(registry);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (*(void *)(*(void *)(v12 + 24) + 16) == v4)
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [(NSMapTable *)registry countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
    p_lock = &self->_availableShadables.lock;
    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v13 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v9);
            }
            [(NSMapTable *)self->_availableShadables.registry removeObjectForKey:*(void *)(*((void *)&v17 + 1) + 8 * j)];
          }
          uint64_t v14 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }
        while (v14);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  [(SCNMTLResourceManager *)self _removeMatchingProgram:v4 pass:0];
}

- (void)_meshWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableMeshes.lock);
  [(NSMapTable *)self->_availableMeshes.registry removeObjectForKey:v4];
  [(NSMapTable *)self->_availableMeshes.registry removeObjectForKey:v4 | 1];
  os_unfair_lock_unlock(&self->_availableMeshes.lock);
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  registry = self->_availableSkinDeformerReadOnlyBuffers.registry;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SCNMTLResourceManager__meshWillDie___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v32__0_8__NSMapTable_16_B24l;
  v8[4] = v4;
  [(NSMapTable *)registry scn_enumerateKeysAndValuesUsingBlock:v8];
  os_unfair_lock_unlock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  v6 = self->_availableMorphDeformerReadOnlyBuffers.registry;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SCNMTLResourceManager__meshWillDie___block_invoke_2;
  v7[3] = &__block_descriptor_40_e27_v32__0_8__NSMapTable_16_B24l;
  v7[4] = v4;
  [(NSMapTable *)v6 scn_enumerateKeysAndValuesUsingBlock:v7];
  os_unfair_lock_unlock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
}

- (void)_programHashCodeWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableWireframeMaterials.lock);
  [(NSMapTable *)self->_availableWireframeMaterials.registry removeObjectForKey:v4];

  os_unfair_lock_unlock(&self->_availableWireframeMaterials.lock);
}

- (void)_materialWillDie:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableShadables.lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  registry = self->_availableShadables.registry;
  uint64_t v6 = [(NSMapTable *)registry countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(registry);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (*(void *)(v11 + 8) == v4)
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [(NSMapTable *)registry countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
    if (v8)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v12 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v8);
            }
            [(NSMapTable *)self->_availableShadables.registry removeObjectForKey:*(void *)(*((void *)&v16 + 1) + 8 * j)];
          }
          uint64_t v13 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v13);
      }
    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
}

- (void)_removeMatchingProgram:(__C3DFXMetalProgram *)a3 pass:(__C3DFXPass *)a4
{
  context[0] = a3;
  context[1] = a4;
  CFArrayRef theArray = 0;
  p_availablePipelineStatesLock = &self->_availablePipelineStatesLock;
  os_unfair_lock_lock(&self->_availablePipelineStatesLock);
  CFDictionaryApplyFunction(self->_availablePipelineStates, (CFDictionaryApplierFunction)__removeMatchingProgram, context);
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
        id v10 = (id)(id)CFDictionaryGetValue(self->_availablePipelineStates, ValueAtIndex);
        CFDictionaryRemoveValue(self->_availablePipelineStates, ValueAtIndex);
      }
    }
    CFRelease(theArray);
  }
  os_unfair_lock_unlock(p_availablePipelineStatesLock);
}

- (id)renderResourceForEffectSlot:(__C3DEffectSlot *)a3 withEngineContext:(__C3DEngineContext *)a4 didFallbackToDefaultTexture:(BOOL *)a5
{
  if (a5)
  {
    *a5 = 1;
    id result = (id)C3DEffectSlotGetMTLTexture((uint64_t)a3);
    if (result)
    {
      *a5 = 0;
      return result;
    }
  }
  else
  {
    id result = (id)C3DEffectSlotGetMTLTexture((uint64_t)a3);
    if (result) {
      return result;
    }
  }
  uint64_t ImageProxy = C3DEffectSlotGetImageProxy((uint64_t)a3);
  if (!ImageProxy) {
    goto LABEL_9;
  }
  uint64_t v11 = ImageProxy;
  uint64_t TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)a3);
  if (!TextureSampler) {
    uint64_t TextureSampler = C3DTextureSamplerGetDefault();
  }
  id result = [(SCNMTLResourceManager *)self renderResourceForImageProxy:v11 sampler:TextureSampler engineContext:a4 didFallbackToDefaultTexture:a5];
  if (!result)
  {
LABEL_9:
    id result = (id)C3DEffectSlotGetImage((uint64_t)a3);
    if (result)
    {
      id v13 = result;
      uint64_t v14 = C3DEffectSlotGetTextureSampler((uint64_t)a3);
      uint64_t TextureOptions = C3DEffectSlotGetTextureOptions((uint64_t)a3);
      return [(SCNMTLResourceManager *)self renderResourceForImage:v13 sampler:v14 options:TextureOptions engineContext:a4 didFallbackToDefaultTexture:a5];
    }
  }
  return result;
}

- (SCNMTLMesh)renderResourceForMesh:(int)a3 dataKind:
{
  *(void *)((char *)&v32[1] + 4) = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  unint64_t v6 = (a3 == 0) | (unint64_t)a2;
  CFIndex v7 = (os_unfair_lock_s *)(a1 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
  id v8 = *(void **)(a1 + 200);
  if (!v8)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    *(void *)(a1 + 200) = v8;
  }
  uint64_t v9 = [v8 objectForKey:v6];
  if (v9)
  {
    id v10 = (SCNMTLMesh *)v9;
    if (C3DMeshIsMutable(a2)) {
      objc_msgSend((id)a1, "__updateMutableMesh:withMetalMesh:", a2, v10);
    }
  }
  else
  {
    unint64_t v22 = v6;
    id v10 = objc_alloc_init(SCNMTLMesh);
    C3DEntityGetName(a2);
    uint64_t v11 = (void *)[MEMORY[0x263F12A80] vertexDescriptor];
    uint64_t v12 = (char *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:C3DMeshGetSourcesCount(a2)];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke;
    v24[3] = &unk_264006010;
    char v25 = a3;
    v24[7] = v11;
    v24[8] = &v27;
    BOOL v26 = a3 == 0;
    v24[4] = v10;
    v24[5] = a1;
    v24[6] = v12;
    C3DMeshApplySources(a2, a3, (uint64_t)v24);
    if (a3 == 1)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke_2;
      v23[3] = &unk_264006038;
      v23[5] = v12;
      v23[6] = &v27;
      v23[4] = v11;
      C3DMeshApplySources(a2, 1, (uint64_t)v23);
    }
    -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v10, v11);
    -[SCNMTLMesh setBuffers:](v10, v12);
    -[SCNMTLMesh setVolatileStride:]((uint64_t)v10, v28[3]);

    ElementsCFIndex Count = C3DMeshGetElementsCount(a2);
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:ElementsCount];
    if ((uint64_t)ElementsCount >= 1)
    {
      for (CFIndex i = 0; (const __CFArray *)i != ElementsCount; ++i)
      {
        ElementAtIndex = C3DMeshGetElementAtIndex(a2, i, a3);
        uint64_t v17 = (uint64_t)ElementAtIndex;
        if (ElementAtIndex)
        {
          unsigned int Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
          if (C3DMeshElementTypeMapsToMTLPrimitiveType(Type))
          {
            objc_msgSend(v14, "addObject:", -[SCNMTLResourceManager renderResourceForMeshElement:](a1, v17));
          }
          else if (a3)
          {
            long long v19 = scn_default_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
              -[SCNMTLResourceManager renderResourceForMesh:dataKind:](v31, v32, v19);
            }
          }
        }
      }
    }
    -[SCNMTLMesh setElements:](v10, (char *)v14);

    [*(id *)(a1 + 200) setObject:v10 forKey:v22];
    _Block_object_dispose(&v27, 8);
  }
  long long v20 = v10;
  os_unfair_lock_unlock(v7);
  return v10;
}

uint64_t __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 != 7)
  {
    uint64_t v7 = result;
    id result = -[SCNMTLMesh verticesCount](*(void *)(result + 32));
    if (!result)
    {
      uint64_t Count = C3DMeshSourceGetCount(a2);
      id result = -[SCNMTLMesh setVerticesCount:](*(void *)(v7 + 32), Count);
    }
    if ((a3 == 3 || a4 <= 0) && (a3 != 3 || a4 <= 7))
    {
      if (*(unsigned char *)(v7 + 72) == 1 && (id result = C3DMeshSourceIsVolatile(a2), result))
      {
        uint64_t Accessor = C3DMeshSourceGetAccessor(a2);
        C3DSourceAccessorSetOffset(Accessor, *(void *)(*(void *)(*(void *)(v7 + 64) + 8) + 24));
        id result = C3DSceneSourceGetLibrary(Accessor);
        *(void *)(*(void *)(*(void *)(v7 + 64) + 8) + 24) += result;
      }
      else if (!a3 || !*(unsigned char *)(v7 + 73))
      {
        id result = (uint64_t)-[SCNMTLResourceManager renderResourceForMeshSource:](*(void *)(v7 + 40), a2);
        if (result)
        {
          uint64_t v10 = result;
          uint64_t v11 = [*(id *)(v7 + 48) indexOfObject:result];
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v11 = [*(id *)(v7 + 48) count];
            [*(id *)(v7 + 48) addObject:v10];
          }
          uint64_t v12 = *(void **)(v7 + 56);
          return _fillVertexDescriptor(v12, a2, a3, a4, v11);
        }
      }
    }
  }
  return result;
}

- (void)renderResourceForMeshSource:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (C3DMeshSourceIsVolatile(a2))
  {
    uint64_t v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(SCNMTLResourceManager *)v4 renderResourceForMeshSource:v6];
    }
  }
  MTLBuffer = (void *)C3DMeshSourceGetMTLBuffer(a2);
  if (!MTLBuffer)
  {
    CFDataRef Data = (const __CFData *)C3DMeshSourceGetData(a2);
    if (Data)
    {
      CFDataRef v9 = Data;
      CFIndex Length = CFDataGetLength(Data);
      if (Length)
      {
        CFIndex v11 = Length;
        BytePtr = CFDataGetBytePtr(v9);
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
        id v13 = *(void **)(a1 + 216);
        if (!v13)
        {
          id v13 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
          *(void *)(a1 + 216) = v13;
        }
        MTLBuffer = (void *)[v13 objectForKey:v9];
        if (!MTLBuffer)
        {
          MTLBuffer = (void *)[*(id *)(a1 + 8) newBufferWithBytes:BytePtr length:v11 options:0];
          uint64_t v14 = *(void *)(a1 + 24);
          ++*(_DWORD *)(v14 + 228);
          *(_DWORD *)(v14 + 256) += v11;
          [*(id *)(a1 + 216) setObject:MTLBuffer forKey:v9];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
        return MTLBuffer;
      }
    }
    return 0;
  }
  return MTLBuffer;
}

uint64_t __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = C3DMeshSourceIsVolatile(a2);
  if (result)
  {
    uint64_t Accessor = C3DMeshSourceGetAccessor(a2);
    C3DSourceAccessorSetStride(Accessor, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [*(id *)(a1 + 40) count];
    return _fillVertexDescriptor(v10, a2, a3, a4, v11);
  }
  return result;
}

- (uint64_t)libraryManager
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (id)renderResourceForImage:(__C3DImage *)a3 sampler:(__C3DTextureSampler *)a4 options:(int)a5 engineContext:(__C3DEngineContext *)a6 didFallbackToDefaultTexture:(BOOL *)a7
{
  if (!a3 && (id v13 = scn_default_log(), os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)))
  {
    -[SCNMTLResourceManager(Textures) renderResourceForImageProxy:sampler:engineContext:didFallbackToDefaultTexture:](v13, v14, v15, v16, v17, v18, v19, v20);
    if (a4)
    {
LABEL_4:
      if (C3DTextureSamplerGetMipFilter((uint64_t)a4)) {
        goto LABEL_7;
      }
    }
  }
  else if (a4)
  {
    goto LABEL_4;
  }
  if ((a5 & 4) == 0)
  {
    unsigned int v49 = 0;
    unsigned __int8 v21 = a5;
    goto LABEL_8;
  }
LABEL_7:
  unsigned __int8 v21 = a5 | 4;
  unsigned int v49 = 1;
LABEL_8:
  uint64_t v22 = a5 & 0xFFFFFF00;
  unint64_t v23 = 0xC6A4A7935BD1E995 * ((unint64_t)a3 ^ v21 ^ 0x1A929E4D6F47A654 ^ v22);
  unint64_t v24 = (0xC6A4A7935BD1E995 * (v23 ^ (v23 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v23 ^ (v23 >> 47))) >> 47);
  p_availableImages = &self->_availableImages;
  os_unfair_lock_lock(&self->_availableImages.lock);
  registry = self->_availableImages.registry;
  if (!registry)
  {
    SCNResourceRegistrySetup((uint64_t *)&self->_availableImages, 0);
    registry = p_availableImages->registry;
  }
  uint64_t v27 = [(NSMapTable *)registry objectForKey:v24];
  if (v27)
  {
    defaultTexture = (MTLTexture *)v27;
    goto LABEL_30;
  }
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a6);
  C3DImageGetName((uint64_t)a3);
  v48 = (id *)RenderContext;
  if (!C3DImageIsCatalogTexture((uint64_t)a3))
  {
    v47 = a6;
    uint64_t v36 = v22 | v21;
    if ((v21 & 2) != 0 && C3DImageIsConvertibleToCubeMap((uint64_t)a3))
    {
      id v37 = [(SCNMTLResourceManager *)self _textureDescriptorFromImage:a3 needsMipMap:0 textureOptions:v36];
      BOOL v35 = v49;
      if (!v37) {
        goto LABEL_29;
      }
      uint64_t v38 = v36;
      id v39 = v37;
      v40 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v37];
      [(SCNMTLResourceManager *)self _copyImage:a3 toTexture:v40 desc:v39 textureOptions:v38 needsMipMapGeneration:0];
      defaultTexture = [(SCNMTLResourceManager *)self copyTextureByConvertingToCubeMapIfApplicable:v40 engineContext:v47 needsMipmap:v49];
      v41 = defaultTexture;
    }
    else
    {
      id v42 = [(SCNMTLResourceManager *)self _textureDescriptorFromImage:a3 needsMipMap:v49 textureOptions:v36];
      if (!v42) {
        goto LABEL_29;
      }
      id v43 = v42;
      defaultTexture = [(SCNMTLResourceManager *)self newTextureWithDescriptor:v42];
      v44 = defaultTexture;
      BOOL v35 = [(SCNMTLResourceManager *)self _copyImage:a3 toTexture:defaultTexture desc:v43 textureOptions:v22 | v21 needsMipMapGeneration:v49];
    }
    C3DImageReleaseBitmapCache((uint64_t)a3);
    if (defaultTexture) {
      goto LABEL_25;
    }
LABEL_29:
    defaultTexture = self->_defaultTexture;
    [-[SCNMTLRenderContext resourceManagerMonitor](v48) renderContext:v48, a3, objc_msgSend(NSString, "stringWithFormat:", @"Unable to find texture for source %@", a3) didFallbackToDefaultTextureForSource message];
    [(NSMapTable *)p_availableImages->registry setObject:defaultTexture forKey:v24];
    goto LABEL_30;
  }
  uint64_t CatalogTextureName = C3DImageGetCatalogTextureName((uint64_t)a3);
  uint64_t v31 = SCNGetResourceBundle();
  uint64_t v50 = 0;
  id v32 = [(SCNMTLResourceManager *)self lazyMTKTextureLoader];
  defaultTexture = (MTLTexture *)[v32 newTextureWithName:CatalogTextureName scaleFactor:v31 bundle:MEMORY[0x263EFFA78] options:&v50 error:1.0];
  v33 = defaultTexture;
  if (!defaultTexture)
  {
    v34 = scn_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Textures) renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:]();
    }
  }
  BOOL v35 = v49;
  if (!defaultTexture) {
    goto LABEL_29;
  }
LABEL_25:
  [(NSMapTable *)p_availableImages->registry setObject:defaultTexture forKey:v24];
  if (v35
    && C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)a3, 0) <= 1
    && SCNMTLPixelFormatSupportsMipmapGeneration([(MTLTexture *)defaultTexture pixelFormat]))
  {
    v45 = (void **)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)v48);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v45, defaultTexture);
  }
LABEL_30:
  os_unfair_lock_unlock(&self->_availableImages.lock);
  if (a7) {
    *a7 = self->_defaultTexture == defaultTexture;
  }
  return defaultTexture;
}

- (id)specularDFGDiffuseHammonTextureWithRenderContext:(id)a3
{
  objc_sync_enter(self);
  specularDFGDiffuseHammonTexture = self->_specularDFGDiffuseHammonTexture;
  if (!specularDFGDiffuseHammonTexture)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:128 height:128 mipmapped:0];
    [v6 setUsage:3];
    [v6 setStorageMode:2];
    self->_specularDFGDiffuseHammonTexture = (MTLTexture *)[(SCNMTLResourceManager *)self newTextureWithDescriptor:v6];
    uint64_t v7 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)[(SCNMTLResourceManager *)self computePipelineStateForKernel:@"compute_specularPreIntegratedDFG_diffuseHammon"]);
    id v8 = (void *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a3);
    bzero(v8, 0x678uLL);
    CFDataRef v9 = (void *)v8[207];
    [v9 setComputePipelineState:v7];
    [v9 setTexture:self->_specularDFGDiffuseHammonTexture atIndex:0];
    -[SCNMTLResourceManager dispatchForTexture:computeEncoder:pipelineState:]((uint64_t)self, self->_specularDFGDiffuseHammonTexture, v9, v7);
    specularDFGDiffuseHammonTexture = self->_specularDFGDiffuseHammonTexture;
  }
  objc_sync_exit(self);
  return specularDFGDiffuseHammonTexture;
}

- (id)newTextureWithDescriptor:(id)a3
{
  if ([a3 pixelFormat])
  {
    uint64_t v5 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:a3];
    if (v5)
    {
      ++self->__engineStats->texCount;
      uint64_t v6 = [a3 width];
      uint64_t v7 = [a3 height] * v6;
      uint64_t v8 = v7 * [a3 depth];
      [a3 pixelFormat];
      self->__engineStats->texMemory += (unint64_t)(v8 * SCNMTLPixelFormatGetBitSize()) >> 3;
    }
  }
  else
  {
    CFDataRef v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Textures) newTextureWithDescriptor:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0;
  }
  return v5;
}

- (id)renderResourceForProgramDesc:(id *)a3 renderPassDescriptor:(id)a4
{
  var0 = a3->var0;
  var3 = a3->var3;
  var5 = a3->var5;
  unsigned __int8 v10 = a3->var16.var0;
  id var1 = a3->var16.var1;
  long long v84 = 0u;
  long long v85 = 0u;
  memset(v83, 0, sizeof(v83));
  long long v82 = 0u;
  v81[0] = a3->var12;
  if (!v81[0])
  {
    uint64_t v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:].cold.4(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  uint64_t v19 = 0;
  v81[1] = C3DFXMetalProgramGetHash(var0);
  *((void *)&v82 + 1) = var3;
  LOBYTE(v83[0]) = v10;
  do
  {
    *((void *)v83 + v19 + 1) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "colorAttachments"), "objectAtIndexedSubscript:", v19), "texture"), "pixelFormat");
    ++v19;
  }
  while (v19 != 8);
  *((void *)&v84 + 1) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "depthAttachment"), "texture"), "pixelFormat");
  *(void *)&long long v85 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "stencilAttachment"), "texture"), "pixelFormat");
  BYTE8(v85) = a3->var8;
  if (a3->var10 <= 1u) {
    unsigned __int8 var10 = 1;
  }
  else {
    unsigned __int8 var10 = a3->var10;
  }
  BYTE10(v85) = var10;
  unint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "sampleCount");
  if (v21 <= 1) {
    unsigned __int8 v22 = 1;
  }
  else {
    unsigned __int8 v22 = v21;
  }
  unint64_t v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "depthAttachment"), "texture"), "sampleCount");
  if (v22 <= v23) {
    unsigned __int8 v22 = v23;
  }
  unint64_t v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "stencilAttachment"), "texture"), "sampleCount");
  char v25 = v22;
  if (v22 <= v24) {
    char v25 = v24;
  }
  BYTE9(v85) = v25;
  uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "pixelFormat");
  uint64_t v27 = (uint64_t)var5;
  if (!v26) {
    uint64_t v27 = C3DBlendStatesDefaultReplace();
  }
  uint64_t v28 = 0;
  *(void *)&long long v82 = v27;
  BYTE11(v85) = a3->var7;
  unint64_t v29 = 0x5253C9ADE8F4CA80;
  do
  {
    unint64_t v29 = 0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v81[v28]) ^ ((0xC6A4A7935BD1E995 * v81[v28]) >> 47))) ^ v29);
    ++v28;
  }
  while (v28 != 16);
  uint64_t v30 = (const void *)((0xC6A4A7935BD1E995 * (v29 ^ (v29 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v29 ^ (v29 >> 47))) >> 47));
  p_availablePipelineStatesLock = &self->_availablePipelineStatesLock;
  os_unfair_lock_lock(&self->_availablePipelineStatesLock);
  Value = (void *)CFDictionaryGetValue(self->_availablePipelineStates, v30);
  if (Value)
  {
    id v33 = Value;
    os_unfair_lock_unlock(&self->_availablePipelineStatesLock);
    return v33;
  }
  uint64_t TypeID = C3DFXMetalProgramGetTypeID();
  if (TypeID != CFGetTypeID(var0))
  {
    v51 = scn_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:](v51);
    }
    goto LABEL_32;
  }
  uint64_t FunctionName = C3DFXMetalProgramGetFunctionName(var0, 0);
  if (!FunctionName)
  {
    if ((renderResourceForProgramDesc_renderPassDescriptor__done & 1) == 0)
    {
      renderResourceForProgramDesc_renderPassDescriptor__done = 1;
      v53 = scn_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:](v53);
      }
    }
LABEL_32:
    os_unfair_lock_unlock(p_availablePipelineStatesLock);
    return 0;
  }
  uint64_t v56 = FunctionName;
  uint64_t v55 = C3DFXMetalProgramGetFunctionName(var0, 1);
  uint64_t Constants = C3DFXMetalProgramGetConstants(var0);
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3052000000;
  v78 = __Block_byref_object_copy__11;
  v79 = __Block_byref_object_dispose__11;
  uint64_t v80 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3052000000;
  v72 = __Block_byref_object_copy__11;
  v73 = __Block_byref_object_dispose__11;
  uint64_t v74 = 0;
  char LinkedFunctionsFamilies = C3DFXMetalProgramGetLinkedFunctionsFamilies((unsigned int *)var0);
  uint64_t v64 = MEMORY[0x263EF8330];
  uint64_t v65 = 3221225472;
  v66 = __88__SCNMTLResourceManager_Compilation__renderResourceForProgramDesc_renderPassDescriptor___block_invoke;
  v67 = &unk_26400B3B0;
  v68 = &v75;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v61 = __88__SCNMTLResourceManager_Compilation__renderResourceForProgramDesc_renderPassDescriptor___block_invoke_2;
  v62 = &unk_26400B3B0;
  v63 = &v69;
  if (LinkedFunctionsFamilies)
  {
    id v37 = objc_msgSend(-[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary"), "newFunctionWithName:", @"scn_is_inside_bezier_curve");
    v61((uint64_t)v60, (uint64_t)v37);
  }
  *(void *)&__src[22] = 0;
  memset(&__src[20], 0, 32);
  memset(&__src[18], 0, 32);
  long long v38 = *(_OWORD *)&a3->var13;
  __src[4] = *(_OWORD *)&a3->var11;
  __src[5] = v38;
  __src[6] = a3->var16;
  unint64_t var17 = a3->var17;
  long long v40 = *(_OWORD *)&a3->var2;
  __src[0] = *(_OWORD *)&a3->var0;
  __src[1] = v40;
  long long v41 = *(_OWORD *)&a3->var6;
  __src[2] = *(_OWORD *)&a3->var4;
  __src[3] = v41;
  *(_OWORD *)((char *)&__src[12] + 8) = 0u;
  *(_OWORD *)((char *)&__src[11] + 8) = 0u;
  *(_OWORD *)((char *)&__src[10] + 8) = 0u;
  *(_OWORD *)((char *)&__src[9] + 8) = 0u;
  *(_OWORD *)((char *)&__src[8] + 8) = 0u;
  *(_OWORD *)((char *)&__src[7] + 8) = 0u;
  *(void *)&__src[7] = var17;
  *((void *)&__src[13] + 1) = var5;
  *(void *)&__src[14] = a3->var7;
  *((void *)&__src[14] + 1) = *(void *)&__src[14];
  *(void *)&__src[15] = *(void *)&__src[14];
  *((void *)&__src[15] + 1) = *(void *)&__src[14];
  *(void *)&__src[16] = *(void *)&__src[14];
  *((void *)&__src[16] + 1) = *(void *)&__src[14];
  __src[17] = 0uLL;
  LOBYTE(__src[18]) = a3->var8;
  id var11 = a3->var11;
  *((void *)&__src[18] + 1) = Constants;
  *(void *)&__src[19] = var11;
  *((void *)&__src[19] + 1) = v56;
  *(void *)&__src[20] = v55;
  *((void *)&__src[20] + 1) = v76[5];
  *(void *)&__src[21] = v70[5];
  *((void *)&__src[21] + 1) = var1;
  LOBYTE(__src[22]) = a3->var14;
  WORD1(__src[22]) = 257;
  SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[8], a4);
  memcpy(__dst, __src, sizeof(__dst));
  id v33 = [(SCNMTLResourceManager *)self newRenderPipelineStateWithDesc:__dst];
  if (!v33)
  {
    id v43 = scn_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:](v43, v44, v45, v46, v47, v48, v49, v50);
    }
  }
  CFDictionarySetValue(self->_availablePipelineStates, v30, v33);

  os_unfair_lock_unlock(&self->_availablePipelineStatesLock);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
  return v33;
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2)
  {
    if (a3)
    {
      uint64_t v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_cold_1(a1, a3, v6);
      }
    }
  }
  [*(id *)(a1 + 32) setState:a2];
  uint64_t v7 = *(void *)(a1 + 32) + 32;
  long long v9 = *(_OWORD *)(a1 + 224);
  long long v8 = *(_OWORD *)(a1 + 240);
  long long v10 = *(_OWORD *)(a1 + 208);
  *(void *)(v7 + 80) = *(void *)(a1 + 256);
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)(v7 + 64) = v8;
  *(_OWORD *)(v7 + 32) = v10;
  long long v11 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v7 + 16) = v11;
  objc_msgSend(*(id *)(a1 + 32), "setVertexDescriptor:", objc_msgSend(*(id *)(a1 + 40), "vertexDescriptor"));
  objc_msgSend(*(id *)(a1 + 32), "setVertexFunction:", objc_msgSend(*(id *)(a1 + 40), "vertexFunction"));
  objc_msgSend(*(id *)(a1 + 32), "setFragmentFunction:", objc_msgSend(*(id *)(a1 + 40), "fragmentFunction"));
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 72);
  memcpy(__dst, (const void *)(a1 + 48), sizeof(__dst));
  SCNMTLRenderPipelineDescRelease((uint64_t)__dst);
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_2(uint64_t a1)
{
  *(CFTimeInterval *)(*(void *)(*(void *)(a1 + 32) + 24) + 304) = CACurrentMediaTime()
                                                                        - *(double *)(a1 + 88)
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 24)
                                                                                    + 304);
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  if (*(void *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) generateBindingsForPipeline:*(void *)(a1 + 56) withReflection:*(void *)(a1 + 64) program:*(void *)(a1 + 96) material:*(void *)(a1 + 104) geometry:*(void *)(a1 + 112) pass:*(void *)(a1 + 120)];
    uint64_t v2 = *(void *)(a1 + 48);
  }
  else
  {
    uint64_t v2 = 0;
  }
  [*(id *)(a1 + 56) setState:v2];
  memcpy(__dst, (const void *)(a1 + 96), sizeof(__dst));
  SCNMTLRenderPipelineDescRelease((uint64_t)__dst);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __69__SCNMTLResourceManager_Compilation__newRenderPipelineStateWithDesc___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (const void *)(a1 + 48);
  uint64_t v4 = *(const void **)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v6 = *(_OWORD *)(a1 + 136);
  long long v46 = *(_OWORD *)(a1 + 120);
  long long v47 = v6;
  long long v48 = *(_OWORD *)(a1 + 152);
  long long v7 = *(_OWORD *)(a1 + 72);
  long long v42 = *(_OWORD *)(a1 + 56);
  long long v43 = v7;
  long long v44 = *(_OWORD *)(a1 + 88);
  long long v45 = v5;
  long long v8 = *(_OWORD *)(a1 + 192);
  long long v36 = *(_OWORD *)(a1 + 176);
  long long v37 = v8;
  long long v9 = *(_OWORD *)(a1 + 208);
  long long v10 = *(_OWORD *)(a1 + 224);
  long long v11 = *(_OWORD *)(a1 + 240);
  uint64_t v12 = *(void *)(a1 + 264);
  uint64_t v41 = *(void *)(a1 + 256);
  long long v39 = v10;
  long long v40 = v11;
  long long v38 = v9;
  long long v13 = *(_OWORD *)(a1 + 272);
  long long v14 = *(_OWORD *)(a1 + 288);
  long long v15 = *(_OWORD *)(a1 + 304);
  long long v16 = *(_OWORD *)(a1 + 320);
  uint64_t Constants = *(void *)(a1 + 344);
  uint64_t v35 = *(void *)(a1 + 336);
  long long v33 = v15;
  long long v34 = v16;
  long long v31 = v13;
  long long v32 = v14;
  uint64_t v19 = *(void *)(a1 + 352);
  uint64_t FunctionName = *(void *)(a1 + 360);
  uint64_t v20 = *(void *)(a1 + 368);
  long long v21 = *(_OWORD *)(a1 + 392);
  long long v29 = *(_OWORD *)(a1 + 376);
  long long v30 = v21;
  unsigned __int8 v22 = *(void **)(*(void *)(a1 + 32) + 32);
  if (a2)
  {
    uint64_t v23 = a2;
    if ([v22 commonProfileCacheLibrary] == a2 && v4)
    {
      uint64_t FunctionName = C3DFXMetalProgramGetFunctionName(v4, 0);
      uint64_t v20 = C3DFXMetalProgramGetFunctionName(v4, 1);
    }
  }
  else
  {
    uint64_t v23 = [v22 frameworkLibrary];
    uint64_t v4 = (const void *)[*(id *)(a1 + 32) defaultProgramUsingTessellation:*(void *)(a1 + 392) != 0];
    uint64_t FunctionName = C3DFXMetalProgramGetFunctionName(v4, 0);
    uint64_t v20 = C3DFXMetalProgramGetFunctionName(v4, 1);
    uint64_t Constants = C3DFXMetalProgramGetConstants(v4);
    uint64_t v12 = 0;
  }
  *(void *)__dst = v4;
  *(_OWORD *)&__dst[56] = v45;
  *(_OWORD *)&__dst[72] = v46;
  *(_OWORD *)&__dst[88] = v47;
  *(_OWORD *)&__dst[104] = v48;
  *(_OWORD *)&__dst[8] = v42;
  *(_OWORD *)&__dst[24] = v43;
  *(_OWORD *)&__dst[40] = v44;
  *(void *)&__dst[120] = v23;
  *(_OWORD *)&__dst[144] = v37;
  *(_OWORD *)&__dst[128] = v36;
  *(_OWORD *)&__dst[192] = v40;
  *(_OWORD *)&__dst[176] = v39;
  *(_OWORD *)&__dst[160] = v38;
  *(void *)&__dst[208] = v41;
  *(void *)&__dst[216] = v12;
  *(_OWORD *)&__dst[272] = v34;
  *(_OWORD *)&__dst[256] = v33;
  *(_OWORD *)&__dst[224] = v31;
  *(_OWORD *)&__dst[240] = v32;
  *(void *)&__dst[288] = v35;
  *(void *)&__dst[296] = Constants;
  *(void *)&__dst[304] = v19;
  *(void *)&__dst[312] = FunctionName;
  *(void *)&__dst[320] = v20;
  *(_OWORD *)&__dst[328] = v29;
  *(_OWORD *)&__dst[344] = v30;
  id v24 = _pipelineDescriptorForPipelineDesc((uint64_t)__dst);
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void **)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 40);
    *(void *)__dst = v4;
    *(_OWORD *)&__dst[56] = v45;
    *(_OWORD *)&__dst[72] = v46;
    *(_OWORD *)&__dst[88] = v47;
    *(_OWORD *)&__dst[104] = v48;
    *(_OWORD *)&__dst[8] = v42;
    *(_OWORD *)&__dst[24] = v43;
    *(_OWORD *)&__dst[40] = v44;
    *(void *)&__dst[120] = v23;
    *(_OWORD *)&__dst[144] = v37;
    *(_OWORD *)&__dst[128] = v36;
    *(_OWORD *)&__dst[192] = v40;
    *(_OWORD *)&__dst[176] = v39;
    *(_OWORD *)&__dst[160] = v38;
    *(void *)&__dst[208] = v41;
    *(void *)&__dst[216] = v12;
    *(_OWORD *)&__dst[272] = v34;
    *(_OWORD *)&__dst[256] = v33;
    *(_OWORD *)&__dst[224] = v31;
    *(_OWORD *)&__dst[240] = v32;
    *(void *)&__dst[288] = v35;
    *(void *)&__dst[296] = Constants;
    *(void *)&__dst[304] = v19;
    *(void *)&__dst[312] = FunctionName;
    *(void *)&__dst[320] = v20;
    *(_OWORD *)&__dst[328] = v29;
    *(_OWORD *)&__dst[344] = v30;
    [v26 _createPipelineStateWithDescriptor:v25 desc:__dst pipeline:v27];
  }
  memcpy(__dst, v3, sizeof(__dst));
  SCNMTLRenderPipelineDescRelease((uint64_t)__dst);
}

- (void)_createPipelineStateWithDescriptor:(id)a3 desc:(id *)a4 pipeline:(id)a5
{
  memcpy(__dst, a4, sizeof(__dst));
  SCNMTLRenderPipelineDescRetain((uint64_t)__dst);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  uint64_t v20 = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke;
  long long v21 = &unk_26400B3D8;
  memcpy(v24, a4, sizeof(v24));
  id v22 = a5;
  id v23 = a3;
  ++self->__engineStats->renderPipelineCount;
  double v9 = CACurrentMediaTime();
  if (a4->var13 - 1 >= 2)
  {
    if (a4->var13)
    {
      long long v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:](&a4->var13, v13);
      }
    }
    else
    {
      __dst[0] = 0;
      if (a4->var15)
      {
        uint64_t v14 = 0;
        uint64_t v12 = (void *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:a3 options:3 reflection:&v14 error:__dst];
        self->__engineStats->renderPipelineCompilationTime = CACurrentMediaTime()
                                                           - v9
                                                           + self->__engineStats->renderPipelineCompilationTime;
        v20((uint64_t)v19, (uint64_t)v12, (void *)__dst[0]);
        if (v12) {
          [(SCNMTLShaderBindingsGenerator *)self->_bindingsGenerator generateBindingsForPipeline:a5 withReflection:v14 program:a4->var0.var0 material:a4->var0.var1 geometry:a4->var0.var2 pass:a4->var0.var3];
        }
      }
      else
      {
        uint64_t v12 = (void *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:a3 error:__dst];
        self->__engineStats->renderPipelineCompilationTime = CACurrentMediaTime()
                                                           - v9
                                                           + self->__engineStats->renderPipelineCompilationTime;
        v20((uint64_t)v19, (uint64_t)v12, (void *)__dst[0]);
      }
    }
  }
  else
  {
    long long v10 = [(SCNMTLLibraryManager *)self->_libraryManager shaderCompilationGroup];
    dispatch_group_enter(v10);
    device = self->_device;
    if (a4->var15)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_8;
      v16[3] = &unk_26400B428;
      memcpy(v17, a4, sizeof(v17));
      double v18 = v9;
      v16[4] = self;
      v16[5] = a5;
      v16[6] = v10;
      v16[7] = v19;
      [(MTLDevice *)device newRenderPipelineStateWithDescriptor:a3 options:3 completionHandler:v16];
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_3;
      v15[3] = &unk_26400B450;
      *(double *)&v15[7] = v9;
      v15[5] = v10;
      v15[6] = v19;
      v15[4] = self;
      [(MTLDevice *)device newRenderPipelineStateWithDescriptor:a3 completionHandler:v15];
    }
  }
}

- (id)newRenderPipelineStateWithDesc:(id *)a3
{
  if (a3->var1)
  {
    memcpy(__dst, a3, 0x168uLL);
    id v5 = _pipelineDescriptorForPipelineDesc((uint64_t)__dst);
    if (v5)
    {
      id v6 = v5;
      long long v7 = objc_alloc_init(SCNMTLRenderPipeline);
      memcpy(__dst, a3, 0x168uLL);
      [(SCNMTLResourceManager *)self _createPipelineStateWithDescriptor:v6 desc:__dst pipeline:v7];
      ++self->__engineStats->prgCount;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    long long v7 = objc_alloc_init(SCNMTLRenderPipeline);
    memcpy(__dst, a3, 0x168uLL);
    SCNMTLRenderPipelineDescRetain((uint64_t)__dst);
    libraryManager = self->_libraryManager;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__SCNMTLResourceManager_Compilation__newRenderPipelineStateWithDesc___block_invoke;
    v13[3] = &unk_26400B478;
    memcpy(v14, a3, sizeof(v14));
    v13[4] = self;
    v13[5] = v7;
    long long v9 = *(_OWORD *)&a3->var0.var13;
    __dst[4] = *(_OWORD *)&a3->var0.var11;
    __dst[5] = v9;
    __dst[6] = a3->var0.var16;
    *(void *)&__dst[7] = a3->var0.var17;
    long long v10 = *(_OWORD *)&a3->var0.var2;
    __dst[0] = *(_OWORD *)&a3->var0.var0;
    __dst[1] = v10;
    long long v11 = *(_OWORD *)&a3->var0.var6;
    __dst[2] = *(_OWORD *)&a3->var0.var4;
    __dst[3] = v11;
    [(SCNMTLLibraryManager *)libraryManager libraryForProgramDesc:__dst completionHandler:v13];
  }
  return v7;
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v8 = (const void *)(a1 + 64);
  memcpy(__dst, (const void *)(a1 + 64), sizeof(__dst));
  SCNMTLRenderPipelineDescRetain((uint64_t)__dst);
  long long v9 = [*(id *)(*(void *)(a1 + 32) + 32) deviceQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_2;
  v11[3] = &unk_26400B400;
  uint64_t v13 = *(void *)(a1 + 424);
  uint64_t v10 = *(void *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  v11[5] = a4;
  v11[6] = a2;
  v11[7] = v10;
  v11[8] = a3;
  memcpy(v14, v8, sizeof(v14));
  long long v12 = *(_OWORD *)(a1 + 48);
  dispatch_async(v9, v11);
}

- (void)renderResourceForSampler:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t Default = a2;
  if (!a2) {
    uint64_t Default = C3DTextureSamplerGetDefault();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  uint64_t v4 = *(void **)(a1 + 152);
  if (!v4)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    *(void *)(a1 + 152) = v4;
  }
  id v5 = (void *)[v4 objectForKey:C3DMeshSourceGetMTLVertexFormat(Default)];
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F129F8]);
    int MinFilter = C3DTextureSamplerGetMinFilter(Default);
    [v6 setMinFilter:C3DFilterModeToMTLFilter(MinFilter)];
    int MagFilter = C3DTextureSamplerGetMagFilter(Default);
    [v6 setMagFilter:C3DFilterModeToMTLFilter(MagFilter)];
    int MipFilter = C3DTextureSamplerGetMipFilter(Default);
    [v6 setMipFilter:C3DFilterModeToMTLMipFilter(MipFilter)];
    int WrapModeS = C3DTextureSamplerGetWrapModeS(Default);
    [v6 setSAddressMode:C3DWrapModeToMTLAddressMode(WrapModeS)];
    int WrapModeT = C3DTextureSamplerGetWrapModeT(Default);
    [v6 setTAddressMode:C3DWrapModeToMTLAddressMode(WrapModeT)];
    int WrapModeP = C3DTextureSamplerGetWrapModeP(Default);
    [v6 setRAddressMode:C3DWrapModeToMTLAddressMode(WrapModeP)];
    float Anisotropy = C3DTextureSamplerGetAnisotropy(Default);
    if (Anisotropy < 1.0) {
      float Anisotropy = 1.0;
    }
    objc_msgSend(v6, "setMaxAnisotropy:", (unint64_t)fminf(Anisotropy, 16.0));
    id v5 = (void *)[*(id *)(a1 + 8) newSamplerStateWithDescriptor:v6];

    [*(id *)(a1 + 152) setObject:v5 forKey:C3DMeshSourceGetMTLVertexFormat(Default)];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  return v5;
}

- (id)computePipelineStateForKernel:(id)a3
{
  return [(SCNMTLResourceManager *)self _computePipelineStateForKernel:a3 constants:0 constantsHash:0 threadGroupSizeIsMultipleOfThreadExecutionWidth:0];
}

- (id)_computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a6
{
  p_availableComputePipelines = (uint64_t *)&self->_availableComputePipelines;
  p_lock = &self->_availableComputePipelines.lock;
  os_unfair_lock_lock(&self->_availableComputePipelines.lock);
  if (*p_availableComputePipelines)
  {
    if (!a4)
    {
LABEL_8:
      id v21 = a3;
      if (a5) {
        id v21 = (id)[a3 stringByAppendingString:a5];
      }
      goto LABEL_10;
    }
  }
  else
  {
    SCNResourceRegistrySetup(p_availableComputePipelines, 1);
    if (!a4) {
      goto LABEL_8;
    }
  }
  if (a5) {
    goto LABEL_8;
  }
  uint64_t v13 = scn_default_log();
  id v21 = a3;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    -[SCNMTLResourceManager(Compilation) _computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:](v13, v14, v15, v16, v17, v18, v19, v20);
    id v21 = a3;
  }
LABEL_10:
  id v22 = (id)[(id)*p_availableComputePipelines objectForKey:v21];
  if (!v22)
  {
    id v23 = [(SCNMTLLibraryManager *)self->_libraryManager frameworkLibrary];
    v25[0] = a3;
    v25[1] = a4;
    v25[2] = 0;
    v25[3] = 0;
    BOOL v26 = a6;
    memset(v27, 0, sizeof(v27));
    id v22 = [(SCNMTLResourceManager *)self newComputePipelineStateForDesc:v25 library:v23];
    if (v22)
    {
      [(id)*p_availableComputePipelines setObject:v22 forKey:v21];
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v22;
}

- (id)newComputePipelineStateForDesc:(id *)a3 library:(id)a4
{
  long long v5 = *(_OWORD *)&a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v5;
  uint64_t v11 = *(void *)&a3->var4;
  id v6 = [(SCNMTLResourceManager *)self _newComputeDescriptorForPipelineDesc:v10 library:a4];
  if (!v6) {
    return 0;
  }
  long long v7 = v6;
  long long v8 = objc_alloc_init(SCNMTLComputePipeline);
  [(SCNMTLResourceManager *)self _configureComputePipeline:v8 withDescriptor:v7];

  return v8;
}

- (id)_newComputeDescriptorForPipelineDesc:(id *)a3 library:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x263F12850]);
  id var1 = a3->var1;
  if (!var1)
  {
    long long v9 = (void *)[a4 newFunctionWithName:a3->var0];
    if (v9) {
      goto LABEL_5;
    }
    long long v12 = scn_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Compilation) _newComputeDescriptorForPipelineDesc:library:]();
    }
LABEL_12:

    return 0;
  }
  uint64_t v14 = 0;
  uint64_t v8 = [a4 newFunctionWithName:a3->var0 constantValues:var1 error:&v14];
  if (!v8)
  {
    uint64_t v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Compilation) _newComputeDescriptorForPipelineDesc:library:]();
    }
    goto LABEL_12;
  }
  long long v9 = (void *)v8;
LABEL_5:
  [v6 setComputeFunction:v9];

  var3 = (void (**)(id, void *, id))a3->var3;
  if (var3) {
    var3[2](var3, v9, a3->var2);
  }
  [v6 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:a3->var4];
  [v6 setStageInputDescriptor:a3->var2];
  return v6;
}

- (void)_configureComputePipeline:(id)a3 withDescriptor:(id)a4
{
  uint64_t v10 = 0;
  ++self->__engineStats->computePipelineCount;
  double v7 = CACurrentMediaTime();
  uint64_t v8 = (char *)[(MTLDevice *)self->_device newComputePipelineStateWithDescriptor:a4 options:0 reflection:0 error:&v10];
  self->__engineStats->computePipelineCompilationTime = CACurrentMediaTime()
                                                      - v7
                                                      + self->__engineStats->computePipelineCompilationTime;
  if (v8)
  {
    -[SCNMTLComputePipeline setComputeFunction:](a3, (char *)[a4 computeFunction]);
    -[SCNMTLComputePipeline setState:](a3, v8);
  }
  else
  {
    long long v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Compilation) _configureComputePipeline:withDescriptor:]();
    }
  }
}

- (uint64_t)dispatchForTexture:(void *)a3 computeEncoder:(void *)a4 pipelineState:
{
  if (result)
  {
    unint64_t v7 = [a4 threadExecutionWidth];
    unint64_t v8 = [a2 width];
    if (v7 >= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v7;
    }
    unint64_t v10 = [a2 height];
    if (v7 >= v10) {
      unint64_t v7 = v10;
    }
    unint64_t v11 = [a4 maxTotalThreadsPerThreadgroup];
    do
    {
      unint64_t v12 = v7;
      unint64_t v13 = v7 * v9;
      v7 >>= 1;
    }
    while (v13 > v11);
    v15[0] = (v9 + [a2 width] - 1) / v9;
    v15[1] = (v12 + [a2 height] - 1) / v12;
    v15[2] = 1;
    v14[0] = v9;
    v14[1] = v12;
    v14[2] = 1;
    return [a3 dispatchThreadgroups:v15 threadsPerThreadgroup:v14];
  }
  return result;
}

- (SCNMTLMeshElement)renderResourceForMeshElement:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t SharedMeshElement = C3DMeshElementGetSharedMeshElement(a2);
  if (SharedMeshElement == a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = -[SCNMTLResourceManager renderResourceForMeshElement:](a1, SharedMeshElement);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
  id v6 = *(void **)(a1 + 232);
  if (!v6)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    *(void *)(a1 + 232) = v6;
  }
  uint64_t v7 = [v6 objectForKey:SharedMeshElement];
  if (!v7)
  {
    unint64_t v8 = objc_alloc_init(SCNMTLMeshElement);
    -[SCNMTLMeshElement setupWithElement:](v8, a2);
    if (SharedMeshElement == a2)
    {
      if (C3DMeshElementGetMTLBuffer(a2))
      {
        unint64_t v10 = (char *)[(id)a1 _bufferForMTLBuffer:C3DMeshElementGetMTLBuffer(a2)];
      }
      else
      {
        unsigned int v16 = 0;
        uint64_t Indexes = C3DMeshElementGetIndexes(a2, &v16);
        if (!Indexes)
        {
LABEL_20:
          [*(id *)(a1 + 232) setObject:v8 forKey:a2];

          goto LABEL_21;
        }
        unint64_t v10 = (char *)[(id)a1 _bufferForData:Indexes bytesPerIndex:v16];
      }
    }
    else
    {
      unint64_t v10 = (char *)-[SCNMTLMeshElement indexBuffer](v5);
    }
    -[SCNMTLMeshElement setIndexBuffer:](v8, v10);
    goto LABEL_20;
  }
  unint64_t v8 = (SCNMTLMeshElement *)v7;
  if (SharedMeshElement != a2)
  {
    unint64_t v9 = (char *)-[SCNMTLMeshElement indexBuffer](v5);
    -[SCNMTLMeshElement setIndexBuffer:](v8, v9);
LABEL_13:
    Indexuint64_t Count = C3DMeshElementGetIndexCount(a2);
    -[SCNMTLMeshElement setIndexCount:]((uint64_t)v8, IndexCount);
    unsigned int SharedIndexBufferOffset = C3DMeshElementGetSharedIndexBufferOffset(a2);
    -[SCNMTLMeshElement setSharedIndexBufferOffset:]((uint64_t)v8, SharedIndexBufferOffset);
    goto LABEL_14;
  }
  if (C3DMeshElementIsVolatile(a2)) {
    goto LABEL_13;
  }
LABEL_14:
  Instanceuint64_t Count = C3DMeshElementGetInstanceCount(a2);
  -[SCNMTLMeshElement setInstanceCount:]((uint64_t)v8, InstanceCount);
LABEL_21:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  return v8;
}

- (uint64_t)stats
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)renderResourceForRasterizerState:(int)a3 reverseZ:
{
  if (!a1) {
    return 0;
  }
  id v6 = (os_unfair_lock_s *)(a1 + 256);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  uint64_t v7 = *(void **)(a1 + 248);
  if (!v7)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    *(void *)(a1 + 248) = v7;
  }
  unint64_t v8 = (void *)[v7 objectForKey:a2];
  if (!v8)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    int v16 = 0;
    uint64_t v15 = 0;
    C3DRasterizerStatesGetDesc(a2, (uint64_t)&v13);
    id v9 = objc_alloc_init(MEMORY[0x263F128A0]);
    if ((_BYTE)v14)
    {
      if (a3) {
        uint64_t v10 = C3DComparisonFuncToMTLCompareFunctionReverse(BYTE2(v14));
      }
      else {
        uint64_t v10 = C3DComparisonFuncToMTLCompareFunction(BYTE2(v14));
      }
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 7;
    }
    [v9 setDepthCompareFunction:v11];
    [v9 setDepthWriteEnabled:BYTE1(v14)];
    if (BYTE3(v14))
    {
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setStencilCompareFunction:", C3DComparisonFuncToMTLCompareFunction(BYTE5(v14)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setStencilFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE3(v15)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setDepthFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE2(v15)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setDepthStencilPassOperation:", C3DStencilOpToMTLStencilOperation(BYTE1(v15)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setReadMask:", BYTE6(v14));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setWriteMask:", HIBYTE(v14));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setStencilCompareFunction:", C3DComparisonFuncToMTLCompareFunction(BYTE4(v15)));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setStencilFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE2(v16)));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setDepthFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE1(v16)));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setDepthStencilPassOperation:", C3DStencilOpToMTLStencilOperation(v16));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setReadMask:", BYTE5(v15));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setWriteMask:", BYTE6(v15));
    }
    unint64_t v8 = (void *)[*(id *)(a1 + 8) newDepthStencilStateWithDescriptor:v9];

    [*(id *)(a1 + 248) setObject:v8 forKey:a2];
  }
  os_unfair_lock_unlock(v6);
  return v8;
}

- (SCNMTLShadable)renderResourceForMaterial:(__C3DGeometry *)a3 geometry:(SCNMTLRenderPipeline *)a4 renderPipeline:(uint64_t)a5 engineContext:
{
  uint64_t v199 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    id v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:].cold.5(v6, v7, v8);
    }
  }
  if (!a4)
  {
    id v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:].cold.4(v9, v10, v11);
    }
  }
  uint64_t v160 = (uint64_t)a2;
  ValueStorageModificationuint64_t Count = C3DEntityGetValueStorageModificationCount(a2);
  uint64_t v13 = a3;
  if (a3)
  {
    unsigned int v14 = C3DEntityGetValueStorageModificationCount(a3);
    uint64_t v13 = a3;
  }
  else
  {
    unsigned int v14 = 0;
  }
  uint64_t v15 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 416));
  if (!*(void *)(a1 + 408))
  {
    uint64_t v15 = a1;
    *(void *)(a1 + 408) = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:100];
    uint64_t v13 = a3;
  }
  *(void *)(*(void *)(v15 + 424) + 8) = v160;
  *(void *)(*(void *)(v15 + 424) + 16) = v13;
  *(void *)(*(void *)(v15 + 424) + 24) = a4;
  v150 = (SCNMTLShadable *)[*(id *)(v15 + 408) objectForKey:*(void *)(v15 + 424)];
  if (!v150
    || ValueStorageModificationCount != [(SCNMTLShadable *)v150 materialModificationCount]|| v14 != [(SCNMTLShadable *)v150 geometryModificationCount])
  {
    v150 = objc_alloc_init(SCNMTLShadable);
    [(SCNMTLShadable *)v150 setMaterialModificationCount:ValueStorageModificationCount];
    [(SCNMTLShadable *)v150 setGeometryModificationCount:v14];
    CommonProfileIfNoTechnique = (float *)C3DMaterialGetCommonProfileIfNoTechnique(v160);
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    obuint64_t j = [(SCNMTLRenderPipeline *)a4 shadableBufferBindings];
    uint64_t v155 = [(NSArray *)obj countByEnumeratingWithState:&v173 objects:v198 count:16];
    if (!v155) {
      goto LABEL_149;
    }
    uint64_t v154 = *(void *)v174;
    while (1)
    {
      uint64_t v157 = 0;
      do
      {
        if (*(void *)v174 != v154) {
          objc_enumerationMutation(obj);
        }
        uint64_t v158 = *(void *)(*((void *)&v173 + 1) + 8 * v157);
        if ([(id)v158 needsRenderResource])
        {
          int v16 = (void *)[(id)v158 name];
          uint64_t v17 = [(id)v158 type];
          if (v17 != 3)
          {
            if (v17 != 2)
            {
              if (v17) {
                goto LABEL_144;
              }
              if (CommonProfileIfNoTechnique
                && [v16 isEqualToString:@"scn_commonprofile"])
              {
                DWORD2(v192) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 2);
                HIDWORD(v192) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 3);
                DWORD1(v195) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 12);
                DWORD2(v195) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 13);
                HIDWORD(v195) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 14);
                LODWORD(v193) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 7);
                LODWORD(v194) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 4);
                DWORD1(v194) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 6);
                DWORD2(v194) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 5);
                HIDWORD(v194) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 10);
                LODWORD(v195) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 11);
                LODWORD(v196) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 15);
                *(void *)buf = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 2);
                *(void *)&buf[8] = v18;
                *(void *)&buf[16] = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 3);
                *(void *)&buf[24] = v19;
                LODWORD(v190) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 12);
                DWORD1(v190) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 13);
                *(void *)&long long v187 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 4);
                *((void *)&v187 + 1) = v20;
                *(void *)&long long v188 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 6);
                *((void *)&v188 + 1) = v21;
                *(void *)&long long v189 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 5);
                *((void *)&v189 + 1) = v22;
                LODWORD(v192) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 10);
                DWORD1(v192) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 11);
                if (C3DEffectCommonProfileIsUsingAmbientOcclusion((uint64_t)CommonProfileIfNoTechnique)) {
                  int v23 = 8;
                }
                else {
                  int v23 = 1;
                }
                *(void *)&long long v184 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, v23);
                *((void *)&v184 + 1) = v24;
                DWORD1(v193) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, v23);
                *(void *)&long long v186 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 9);
                *((void *)&v186 + 1) = v25;
                HIDWORD(v193) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 9);
                if (C3DWasLinkedBeforeMajorOSYear2017()
                  && C3DEffectCommonProfileIsUsingSelfIllumination((uint64_t)CommonProfileIfNoTechnique))
                {
                  float Intensity = 0.0;
                  long long v185 = 0uLL;
                }
                else
                {
                  *(void *)&long long v185 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 0);
                  *((void *)&v185 + 1) = v59;
                  float Intensity = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 0);
                }
                *((float *)&v193 + 2) = Intensity;
                *((float *)&v196 + 1) = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 16) * 128.0;
                DWORD2(v196) = C3DEffectCommonProfileGetSelfIlluminationOcclusion((uint64_t)CommonProfileIfNoTechnique);
                HIDWORD(v196) = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 18);
                float FloatProperty = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 19);
                float v61 = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 20);
                uint64_t v62 = 0;
                *(float *)&long long v63 = (float)((float)(1.0 - FloatProperty) * (float)(1.0 - FloatProperty))
                               / (float)((float)(FloatProperty + 1.0) * (float)(FloatProperty + 1.0));
                *((float *)&v63 + 1) = 1.0 - *(float *)&v63;
                *((float *)&v63 + 2) = v61;
                long long v197 = v63;
                memset(v182, 0, sizeof(v182));
                uint64_t v169 = 0;
                v170 = &v169;
                uint64_t v171 = 0x2020000000;
                uint64_t v172 = 0;
                do
                {
                  uint64_t EffectSlot = C3DEffectCommonProfileGetEffectSlot((uint64_t)CommonProfileIfNoTechnique, (char)v62, 0);
                  uint64_t v65 = EffectSlot;
                  if (EffectSlot
                    && C3DEffectSlotHasImageOrTexture(EffectSlot)
                    && C3DKeyframeControllerHasInterpolationModesPerKey(v65))
                  {
                    uint64_t ImageTransform = C3DEffectSlotGetImageTransform(v65);
                    uint64_t v67 = v170[3];
                    v170[3] = v67 + 1;
                    *((void *)v182 + v67) = ImageTransform;
                  }
                  ++v62;
                }
                while (v62 != 16);
                v168[0] = MEMORY[0x263EF8330];
                v168[1] = 3221225472;
                v168[2] = __89__SCNMTLResourceManager_renderResourceForMaterial_geometry_renderPipeline_engineContext___block_invoke;
                v168[3] = &unk_264006088;
                v168[5] = v182;
                v168[4] = &v169;
                C3DEntityEnumerateKeyValuesWithBlock(v160, (uint64_t)v168);
                if (a3) {
                  C3DEntityEnumerateKeyValuesWithBlock((uint64_t)a3, (uint64_t)v168);
                }
                if (v170[3] < 1)
                {
                  if ([(id)v158 argumentEncoder])
                  {
                    v153 = objc_alloc_init(SCNMTLBuffer);
                    v92 = objc_msgSend(*(id *)(a1 + 8), "newBufferWithLength:options:", objc_msgSend((id)objc_msgSend((id)v158, "argumentEncoder"), "encodedLength"), 0);
                    [(SCNMTLBuffer *)v153 setBuffer:v92];

                    objc_msgSend((id)objc_msgSend((id)v158, "argumentEncoder"), "setArgumentBuffer:offset:", -[SCNMTLBuffer buffer](v153, "buffer"), -[SCNMTLBuffer offset](v153, "offset"));
                    char v167 = 0;
                    char v93 = C3DEnumIterator<C3DEffectProperty,(signed char)0,(signed char)15>::end();
                    if (v93)
                    {
                      char v94 = 0;
                      uint64_t v95 = 27;
                      uint64_t v96 = 26;
                      do
                      {
                        if (v94 != 8)
                        {
                          char v97 = v94;
                          if (v94 == 1)
                          {
                            if (C3DEffectCommonProfileIsUsingAmbientOcclusion((uint64_t)CommonProfileIfNoTechnique)) {
                              char v97 = 8;
                            }
                            else {
                              char v97 = 1;
                            }
                          }
                          uint64_t v98 = C3DEffectCommonProfileGetEffectSlot((uint64_t)CommonProfileIfNoTechnique, v97, 0);
                          if (v98)
                          {
                            uint64_t v99 = [(id)a1 renderResourceForEffectSlot:v98 withEngineContext:a5 didFallbackToDefaultTexture:0];
                            uint64_t TextureSampler = C3DEffectSlotGetTextureSampler(v98);
                            if (v99)
                            {
                              uint64_t Default = TextureSampler;
                              objc_msgSend((id)objc_msgSend((id)v158, "argumentEncoder"), "setTexture:atIndex:", v99, v96);
                              objc_msgSend((id)objc_msgSend((id)v158, "usedResources"), "addObject:", v99);
                              if (!Default) {
                                uint64_t Default = C3DTextureSamplerGetDefault();
                              }
                              objc_msgSend((id)objc_msgSend((id)v158, "argumentEncoder"), "setSamplerState:atIndex:", -[SCNMTLResourceManager renderResourceForSampler:](a1, Default), v95);
                            }
                          }
                          v96 += 2;
                          v95 += 2;
                        }
                        ++v94;
                      }
                      while (v94 != v93);
                    }
                    v102 = (_OWORD *)objc_msgSend((id)objc_msgSend((id)v158, "argumentEncoder"), "constantDataAtIndex:", 0);
                    long long v103 = *(_OWORD *)buf;
                    long long v104 = *(_OWORD *)&buf[16];
                    long long v105 = v185;
                    v102[2] = v184;
                    v102[3] = v105;
                    _OWORD *v102 = v103;
                    v102[1] = v104;
                    long long v106 = v186;
                    long long v107 = v187;
                    long long v108 = v189;
                    v102[6] = v188;
                    v102[7] = v108;
                    v102[4] = v106;
                    v102[5] = v107;
                    long long v109 = v190;
                    long long v110 = v191;
                    long long v111 = v193;
                    v102[10] = v192;
                    v102[11] = v111;
                    v102[8] = v109;
                    v102[9] = v110;
                    long long v112 = v194;
                    long long v113 = v195;
                    long long v114 = v197;
                    v102[14] = v196;
                    v102[15] = v114;
                    v102[12] = v112;
                    v102[13] = v113;
                  }
                  else
                  {
                    v153 = (SCNMTLBuffer *)[*(id *)(a1 + 64) newSubBufferWithBytes:buf length:256 renderContext:C3DEngineContextGetRenderContext(a5)];
                  }
                  uint64_t v120 = *(void *)(a1 + 24);
                  ++*(_DWORD *)(v120 + 240);
                  *(_DWORD *)(v120 + 264) += 256;
                }
                else
                {
                  v153 = objc_alloc_init(SCNMTLBuffer);
                  uint64_t v68 = v170[3] << 6;
                  int v69 = v68 + 256;
                  v70 = (void *)[*(id *)(a1 + 8) newBufferWithLength:v68 + 256 options:0];
                  uint64_t v71 = *(void *)(a1 + 24);
                  ++*(_DWORD *)(v71 + 240);
                  *(_DWORD *)(v71 + 264) += v69;
                  v72 = (_OWORD *)[v70 contents];
                  long long v73 = *(_OWORD *)buf;
                  long long v74 = *(_OWORD *)&buf[16];
                  long long v75 = v185;
                  v72[2] = v184;
                  v72[3] = v75;
                  _OWORD *v72 = v73;
                  v72[1] = v74;
                  long long v76 = v186;
                  long long v77 = v187;
                  long long v78 = v189;
                  v72[6] = v188;
                  v72[7] = v78;
                  v72[4] = v76;
                  v72[5] = v77;
                  long long v79 = v190;
                  long long v80 = v191;
                  long long v81 = v193;
                  v72[10] = v192;
                  v72[11] = v81;
                  v72[8] = v79;
                  v72[9] = v80;
                  long long v82 = v194;
                  long long v83 = v195;
                  long long v84 = v197;
                  v72[14] = v196;
                  v72[15] = v84;
                  v72[12] = v82;
                  v72[13] = v83;
                  if (v170[3] >= 1)
                  {
                    uint64_t v85 = 0;
                    v86 = v72 + 19;
                    do
                    {
                      v87 = (_OWORD *)*((void *)v182 + v85);
                      if (!v87)
                      {
                        v88 = scn_default_log();
                        if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT)) {
                          -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:](v180, &v181, v88);
                        }
                      }
                      long long v89 = v87[1];
                      long long v90 = v87[2];
                      long long v91 = v87[3];
                      *(v86 - 3) = *v87;
                      *(v86 - 2) = v89;
                      *(v86 - 1) = v90;
                      _OWORD *v86 = v91;
                      ++v85;
                      v86 += 4;
                    }
                    while (v85 < v170[3]);
                  }
                  [(SCNMTLBuffer *)v153 setBuffer:v70];
                }
                _Block_object_dispose(&v169, 8);
LABEL_143:
                uint64_t v135 = [(id)v158 type];
                unint64_t v148 = v148 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v158 + 9);
                -[SCNMTLShadable setResource:ofType:atIndices:](v150, "setResource:ofType:atIndices:", v153, v135);

                goto LABEL_144;
              }
              v153 = objc_alloc_init(SCNMTLBuffer);
              CFDictionaryRef ValueForKey = C3DEntityGetValueForKey(v160, v16);
              BOOL v35 = a3 == 0;
              if (ValueForKey) {
                BOOL v35 = 1;
              }
              if (!v35) {
                CFDictionaryRef ValueForKey = C3DEntityGetValueForKey((uint64_t)a3, v16);
              }
              if (!ValueForKey
                && (-[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done & 1) == 0)
              {
                -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done = 1;
                long long v36 = scn_default_log();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v136 = [(id)v158 name];
                  int v137 = *(char *)(v158 + 9);
                  int v138 = *(char *)(v158 + 10);
                  *(_DWORD *)buf = 138412802;
                  *(void *)&buf[4] = v136;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v137;
                  *(_WORD *)&buf[18] = 1024;
                  *(_DWORD *)&buf[20] = v138;
                  _os_log_error_impl(&dword_20B249000, v36, OS_LOG_TYPE_ERROR, "Error: missing value for attachment \"%@\" [vertex: %d fragment: %d]", buf, 0x18u);
                }
              }
              size_t v37 = objc_msgSend((id)objc_msgSend((id)v158, "argument"), "bufferDataSize");
              if ([(__CFDictionary *)ValueForKey conformsToProtocol:&unk_26C007E20])
              {
                if ([(__CFDictionary *)ValueForKey length] >= v37)
                {
                  [(SCNMTLBuffer *)v153 setBuffer:ValueForKey];
                }
                else
                {
                  if ((-[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done & 1) == 0)
                  {
                    -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done = 1;
                    long long v38 = scn_default_log();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      int v139 = *(char *)(v158 + 9);
                      int v140 = *(char *)(v158 + 10);
                      int v141 = [(__CFDictionary *)ValueForKey length];
                      *(_DWORD *)buf = 67109888;
                      *(_DWORD *)&buf[4] = v139;
                      *(_WORD *)&buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v140;
                      *(_WORD *)&buf[14] = 1024;
                      *(_DWORD *)&buf[16] = v37;
                      *(_WORD *)&buf[20] = 1024;
                      *(_DWORD *)&buf[22] = v141;
                      _os_log_error_impl(&dword_20B249000, v38, OS_LOG_TYPE_ERROR, "Error: incorrect buffer size  for attachments vertex [%d] fragments [%d]. Expected:%d Provided:%d", buf, 0x1Au);
                    }
                  }
                  long long v39 = (void *)[*(id *)(a1 + 8) newBufferWithLength:v37 options:0];
                  [(SCNMTLBuffer *)v153 setBuffer:v39];

                  [(SCNMTLBuffer *)v153 setOffset:0];
                }
                goto LABEL_143;
              }
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass)
              {
                unint64_t v44 = [(__CFDictionary *)ValueForKey length];
                if (v44 > v37) {
                  size_t v37 = v44;
                }
              }
              long long v45 = (void *)[*(id *)(a1 + 8) newBufferWithLength:v37 options:0];
              [(SCNMTLBuffer *)v153 setBuffer:v45];

              [(SCNMTLBuffer *)v153 setOffset:0];
              long long v46 = [(SCNMTLBuffer *)v153 contents];
              long long v47 = v46;
              if (ValueForKey)
              {
                CFTypeID v48 = CFGetTypeID(ValueForKey);
                if (v48 == C3DValueGetTypeID())
                {
                  if ((C3DValueWriteToMTLData((uint64_t)ValueForKey, objc_msgSend((id)objc_msgSend((id)v158, "argument"), "bufferDataType"), (uint64_t)v47) & 1) == 0)
                  {
                    uint64_t v49 = scn_default_log();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)&buf[4] = v16;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = ValueForKey;
                      uint64_t v50 = v49;
                      v51 = "Error: Argument '%@' : failed to write value to Metal buffer (%@)";
                      uint32_t v52 = 22;
                      goto LABEL_147;
                    }
                  }
                }
                else if (isKindOfClass)
                {
                  v115 = (const void *)[(__CFDictionary *)ValueForKey bytes];
                  uint64_t v116 = [(__CFDictionary *)ValueForKey length];
                  if (v37 == v116)
                  {
                    memcpy(v47, v115, v37);
                  }
                  else
                  {
                    v121 = scn_default_log();
                    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412802;
                      *(void *)&buf[4] = v16;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v116;
                      *(_WORD *)&buf[22] = 2048;
                      *(void *)&buf[24] = v37;
                      uint64_t v50 = v121;
                      v51 = "Error: Argument '%@' : mismatch between the NSData and the buffer size %ld != %ld";
                      uint32_t v52 = 32;
LABEL_147:
                      _os_log_error_impl(&dword_20B249000, v50, OS_LOG_TYPE_ERROR, v51, buf, v52);
                    }
                  }
                }
                else
                {
                  CFTypeID v117 = CFGetTypeID(ValueForKey);
                  CFStringRef v118 = CFCopyTypeIDDescription(v117);
                  v119 = scn_default_log();
                  if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&buf[4] = v16;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v118;
                    _os_log_error_impl(&dword_20B249000, v119, OS_LOG_TYPE_ERROR, "Error: Argument '%@' : only NSData and NSValue are supported for shadable value storage (found '%@'). Please make sure that your custom shader modifier uniform types match the custom properties of the shadable object", buf, 0x16u);
                  }
                  CFRelease(v118);
                }
              }
              else
              {
                bzero(v46, v37);
              }
              if (objc_msgSend((id)objc_msgSend((id)v158, "argument"), "bufferDataType") == 1)
              {
                uint64_t v122 = [(SCNMTLBuffer *)v153 contents];
                v123 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v158, "argument"), "name"), "stringByAppendingString:", @".");
                v124 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v158, "argument"), "bufferStructType"), "members");
                long long v165 = 0u;
                long long v166 = 0u;
                long long v163 = 0u;
                long long v164 = 0u;
                uint64_t v125 = [v124 countByEnumeratingWithState:&v163 objects:v179 count:16];
                if (v125)
                {
                  uint64_t v126 = *(void *)v164;
                  if (a3) {
                    BOOL v127 = ValueForKey == 0;
                  }
                  else {
                    BOOL v127 = 0;
                  }
                  int v128 = v127;
                  do
                  {
                    for (uint64_t i = 0; i != v125; ++i)
                    {
                      if (*(void *)v164 != v126) {
                        objc_enumerationMutation(v124);
                      }
                      v130 = *(void **)(*((void *)&v163 + 1) + 8 * i);
                      v131 = (const void *)objc_msgSend(v123, "stringByAppendingString:", objc_msgSend(v130, "name"));
                      CFDictionaryRef v132 = C3DEntityGetValueForKey(v160, v131);
                      if (v128) {
                        CFDictionaryRef v132 = C3DEntityGetValueForKey((uint64_t)a3, v131);
                      }
                      if (v132)
                      {
                        CFTypeID v133 = CFGetTypeID(v132);
                        if (v133 == C3DValueGetTypeID())
                        {
                          C3DValueWriteToStructMember((uint64_t)v132, v130, v122);
                        }
                        else
                        {
                          v134 = scn_default_log();
                          if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT)) {
                            -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:](v177, &v178, v134);
                          }
                        }
                      }
                    }
                    uint64_t v125 = [v124 countByEnumeratingWithState:&v163 objects:v179 count:16];
                  }
                  while (v125);
                }
              }
              goto LABEL_143;
            }
            CFDictionaryRef v28 = C3DEntityGetValueForKey(v160, v16);
            BOOL v29 = a3 == 0;
            if (v28) {
              BOOL v29 = 1;
            }
            if (!v29) {
              CFDictionaryRef v28 = C3DEntityGetValueForKey((uint64_t)a3, v16);
            }
            if (v28)
            {
              CFTypeID v30 = CFGetTypeID(v28);
              if (v30 == C3DEffectSlotGetTypeID())
              {
                uint64_t v31 = [(id)a1 renderResourceForEffectSlot:v28 withEngineContext:a5 didFallbackToDefaultTexture:0];
                uint64_t v32 = (uint64_t)v28;
                uint64_t v33 = a1;
                if (v31)
                {
                  uint64_t v32 = (uint64_t)v28;
LABEL_72:
                  uint64_t v55 = [(id)v158 type];
                  unint64_t v149 = v149 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v158 + 9);
                  -[SCNMTLShadable setResource:ofType:atIndices:](v150, "setResource:ofType:atIndices:", v31, v55);
                  uint64_t v56 = *(unsigned __int8 *)(v158 + 11);
                  uint64_t v57 = *(unsigned __int8 *)(v158 + 12);
                  if (v57 != 255 || v56 != 255)
                  {
                    if (!v32 || (uint64_t v58 = C3DEffectSlotGetTextureSampler(v32)) == 0) {
                      uint64_t v58 = C3DTextureSamplerGetDefault();
                    }
                    unint64_t v146 = v146 & 0xFFFFFFFFFFFF0000 | v56 | (v57 << 8);
                    -[SCNMTLShadable setResource:ofType:atIndices:](v150, "setResource:ofType:atIndices:", -[SCNMTLResourceManager renderResourceForSampler:](a1, v58), 3);
                  }
                  goto LABEL_144;
                }
LABEL_71:
                uint64_t v31 = *(void *)(v33 + 496);
                uint64_t RenderContext = (id *)C3DEngineContextGetRenderContext(a5);
                [-[SCNMTLRenderContext resourceManagerMonitor](RenderContext) renderContext:RenderContext, v158, objc_msgSend(NSString, "stringWithFormat:", @"Unable to find texture for binding %@ (\"%@\", material=%@)"), v158, v16, v32, v28, a3, v160) didFallbackToDefaultTextureForSource message];
                goto LABEL_72;
              }
              v53 = scn_default_log();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&buf[4] = v16;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v160;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&buf[24] = a3;
                uint64_t v41 = v53;
                long long v42 = "Warning: Missing effect slot for binding \"%@\" (material: %p, geometry: %p)";
LABEL_69:
                _os_log_impl(&dword_20B249000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 0x20u);
              }
            }
            else
            {
              long long v40 = scn_default_log();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&buf[4] = v16;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v160;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&buf[24] = a3;
                uint64_t v41 = v40;
                long long v42 = "Warning: Missing shadable value for binding \"%@\" (material: %p, geometry: %p)";
                goto LABEL_69;
              }
            }
            uint64_t v32 = 0;
            uint64_t v33 = a1;
            goto LABEL_71;
          }
          uint64_t v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:](&v161, v162, v27);
          }
        }
LABEL_144:
        ++v157;
      }
      while (v157 != v155);
      uint64_t v142 = [(NSArray *)obj countByEnumeratingWithState:&v173 objects:v198 count:16];
      uint64_t v155 = v142;
      if (!v142)
      {
LABEL_149:
        v143 = objc_alloc_init(SCNMTLShadableKey);
        v143->_material = (__C3DMaterial *)v160;
        v143->_geometry = a3;
        v143->_pipeline = a4;
        [*(id *)(a1 + 408) setObject:v150 forKey:v143];

        break;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 416));
  return v150;
}

- (id)_bufferForData:(__CFData *)a3 bytesPerIndex:(unint64_t)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  p_lock = &self->_availableBuffers.lock;
  os_unfair_lock_lock(&self->_availableBuffers.lock);
  registry = self->_availableBuffers.registry;
  if (!registry)
  {
    registry = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    self->_availableBuffers.registry = registry;
  }
  id v9 = [(NSMapTable *)registry objectForKey:a3];
  if (v9)
  {
    uint64_t v10 = v9;
    [(SCNMTLBuffer *)v9 incrementUsedCount];
  }
  else
  {
    uint64_t v10 = objc_alloc_init(SCNMTLBuffer);
    BytePtr = (UInt8 *)CFDataGetBytePtr(a3);
    CFIndex Length = CFDataGetLength(a3);
    if (BytePtr)
    {
      CFIndex v13 = Length;
      if (a4 == 1)
      {
        uint64_t v14 = 2 * Length;
        double v15 = MEMORY[0x270FA5388](Length);
        if (v13)
        {
          int v16 = (_WORD *)((char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
          do
          {
            __int16 v17 = *BytePtr++;
            *v16++ = v17;
            --v13;
          }
          while (v13);
        }
        BytePtr = (UInt8 *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v15);
        engineStats = self->__engineStats;
        ++engineStats->iboCount;
        engineStats->iboMemory += v14;
        [(SCNMTLBuffer *)v10 setOffset:0];
      }
      else
      {
        BytePtr = (UInt8 *)[(MTLDevice *)self->_device newBufferWithBytes:BytePtr length:Length options:0];
        uint64_t v19 = self->__engineStats;
        ++v19->iboCount;
        v19->iboMemory += v13;
        [(SCNMTLBuffer *)v10 setOffset:0];
      }
    }
    [(SCNMTLBuffer *)v10 setBuffer:BytePtr];

    [(SCNMTLBuffer *)v10 setDataSource:a3];
    [(SCNMTLBuffer *)v10 incrementUsedCount];
    [(NSMapTable *)self->_availableBuffers.registry setObject:v10 forKey:a3];
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)radianceTextureForPrecomputedLightingEnvironment:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  p_availableRadianceTextures = (uint64_t *)&self->_availableRadianceTextures;
  p_lock = &self->_availableRadianceTextures.lock;
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  uint64_t v7 = (void *)*p_availableRadianceTextures;
  if (!*p_availableRadianceTextures)
  {
    SCNResourceRegistrySetup(p_availableRadianceTextures, 0);
    uint64_t v7 = (void *)*p_availableRadianceTextures;
  }
  uint64_t v8 = [v7 objectForKey:a3];
  if (v8)
  {
    id v9 = (id)v8;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v10 = [a3 radianceData];
    uint64_t v28 = *MEMORY[0x263F12D50];
    v29[0] = MEMORY[0x263EFFA80];
    id v9 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithData:options:](self, "newTextureUsingMTKTextureLoaderWithData:options:", v10, [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1]);
    if ([v9 textureType] != 5)
    {
      uint64_t v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLResourceManager(PBR) radianceTextureForPrecomputedLightingEnvironment:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    if ([v9 pixelFormat] != 115)
    {
      uint64_t v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLResourceManager(PBR) radianceTextureForPrecomputedLightingEnvironment:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    [(id)*p_availableRadianceTextures setObject:v9 forKey:a3];
    os_unfair_lock_unlock(p_lock);
  }
  return v9;
}

- (id)irradianceTextureForPrecomputedLightingEnvironment:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  p_availableIrradianceTextures = (uint64_t *)&self->_availableIrradianceTextures;
  p_lock = &self->_availableIrradianceTextures.lock;
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  uint64_t v7 = (void *)*p_availableIrradianceTextures;
  if (!*p_availableIrradianceTextures)
  {
    SCNResourceRegistrySetup(p_availableIrradianceTextures, 0);
    uint64_t v7 = (void *)*p_availableIrradianceTextures;
  }
  uint64_t v8 = [v7 objectForKey:a3];
  if (v8)
  {
    id v9 = (id)v8;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v10 = [a3 irradianceData];
    uint64_t v28 = *MEMORY[0x263F12D50];
    v29[0] = MEMORY[0x263EFFA80];
    id v9 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithData:options:](self, "newTextureUsingMTKTextureLoaderWithData:options:", v10, [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1]);
    if ([v9 textureType] != 5)
    {
      uint64_t v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLResourceManager(PBR) irradianceTextureForPrecomputedLightingEnvironment:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    if ([v9 pixelFormat] != 115)
    {
      uint64_t v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLResourceManager(PBR) irradianceTextureForPrecomputedLightingEnvironment:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    [(id)*p_availableIrradianceTextures setObject:v9 forKey:a3];
    os_unfair_lock_unlock(p_lock);
  }
  return v9;
}

- (BOOL)_copyImage:(__C3DImage *)a3 toTexture:(id)a4 desc:(id)a5 textureOptions:(int)a6 needsMipMapGeneration:(BOOL)a7
{
  uint64_t v10 = a3;
  Imageunsigned int Type = C3DImageGetImageType((uint64_t)a3);
  TextureRawCFDataRef Data = C3DImageGetTextureRawData((uint64_t)v10);
  if (!TextureRawData)
  {
    long long v46 = (CGContext *)C3DImageCopyBitmap((uint64_t)v10, 1);
    if (!v46)
    {
      long long v47 = scn_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:]((uint64_t)v10);
      }
    }
    uint64_t v85 = (uint64_t)v10;
    CFDataRef Data = (char *)CGBitmapContextGetData(v46);
    if (!Data)
    {
      uint64_t v49 = scn_default_log();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        if (!v46) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:](v49, v50, v51, v52, v53, v54, v55, v56);
      if (v46)
      {
LABEL_20:
        CFRelease(v46);
        long long v46 = 0;
      }
    }
LABEL_21:
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v46);
    size_t BitsPerComponent = CGBitmapContextGetBitsPerComponent(v46);
    size_t v59 = (CGBitmapContextGetBitsPerPixel(v46) / BitsPerComponent * BitsPerComponent) >> 3;
    size_t v60 = v59 * [a5 width];
    uint64_t v61 = [a5 width];
    uint64_t v62 = [a5 height];
    if (ImageType == 2)
    {
      uint64_t v63 = [a5 width];
      uint64_t v64 = [a5 depth];
      v89[0] = MEMORY[0x263EF8330];
      v89[1] = 3221225472;
      v89[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_4;
      v89[3] = &unk_264006480;
      v89[4] = a5;
      v89[5] = a4;
      v89[6] = v60;
      C3DImageEnumerateTexture3DSlicePixelBuffers(2, v63, v64, BytesPerRow, v60, v59, Data, (uint64_t)v89);
      if (!v46) {
        return a7;
      }
    }
    else
    {
      uint64_t v73 = v62;
      if (C3DImageIsCubeMap(v85))
      {
        uint64_t v74 = [a5 width];
        v88[0] = MEMORY[0x263EF8330];
        v88[1] = 3221225472;
        v88[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2_5;
        v88[3] = &unk_264006458;
        memset(&v88[6], 0, 24);
        v88[9] = v61;
        v88[10] = v73;
        v88[11] = 1;
        v88[12] = v60;
        v88[4] = a4;
        v88[5] = a5;
        C3DImageEnumerateCubeMapFacePixelBuffers(ImageType, v74, BytesPerRow, v60, v59, (uint64_t)Data, (uint64_t)v88);
        if (!v46) {
          return a7;
        }
      }
      else
      {
        memset(v87, 0, 24);
        v87[3] = v61;
        v87[4] = v73;
        v87[5] = 1;
        objc_msgSend(a4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v87, 0, 0, Data, v60, objc_msgSend(a5, "height") * v60);
        if (!v46) {
          return a7;
        }
      }
    }
    CFRelease(v46);
    return a7;
  }
  uint64_t v12 = TextureRawData;
  BOOL IsCubeMap = C3DImageIsCubeMap((uint64_t)v10);
  BOOL HasCubeMapComplexLayout = C3DImageHasCubeMapComplexLayout((uint64_t)v10);
  v93[0] = 0;
  TextureRawDataMipmapLeveluint64_t Count = C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)v10, v93);
  if (TextureRawDataMipmapLevelCount > (unint64_t)[a5 mipmapLevelCount])
  {
    uint64_t v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  BOOL v81 = a7;
  if (IsCubeMap)
  {
    if (HasCubeMapComplexLayout)
    {
      if (TextureRawDataMipmapLevelCount)
      {
        for (CFIndex i = 0; i != TextureRawDataMipmapLevelCount; ++i)
        {
          uint64_t v24 = [a5 width];
          uint64_t v25 = [a5 height];
          CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v12 + 40), i);
          CFIndex Length = CFDataGetLength(ValueAtIndex);
          BytePtr = CFDataGetBytePtr(ValueAtIndex);
          double Size = C3DImageGetSize((uint64_t)v10);
          float v31 = (float)Length;
          if (*(unsigned __int8 *)(v12 + 7) < 2u)
          {
            unint64_t v43 = (unint64_t)*(unsigned __int8 *)(v12 + 4) >> 3;
            float v82 = *(float *)&Size;
            long long v83 = BytePtr;
            unint64_t v44 = v10;
            uint64_t v45 = [a5 width] * v43;
            uint64_t v36 = [a5 width];
            v90[0] = MEMORY[0x263EF8330];
            v90[1] = 3221225472;
            v90[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2;
            v90[3] = &unk_264006458;
            memset(&v90[6], 0, 24);
            v90[9] = v24;
            v90[10] = v25;
            v90[11] = 1;
            v90[12] = v45;
            v90[4] = a4;
            v90[5] = a5;
            long long v38 = v90;
            unsigned int v39 = ImageType;
            uint64_t v40 = (uint64_t)(float)(v31 / v82);
            size_t v37 = v45;
            uint64_t v10 = v44;
            size_t v41 = v43;
            uint64_t v42 = (uint64_t)v83;
          }
          else
          {
            LOBYTE(v30) = *(unsigned char *)(v12 + 8);
            uint64_t v32 = (uint64_t)(float)((float)(v31 / *((float *)&Size + 1)) * (float)v30);
            unint64_t v33 = (unint64_t)*(unsigned __int8 *)(v12 + 4) >> 3;
            LODWORD(v33) = [a5 width] / (unint64_t)*(unsigned __int8 *)(v12 + 7) * v33;
            unint64_t v34 = [a5 height];
            unint64_t v35 = *(unsigned __int8 *)(v12 + 8);
            v91[0] = MEMORY[0x263EF8330];
            v91[1] = 3221225472;
            v91[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke;
            v91[3] = &unk_264006430;
            memset(&v91[5], 0, 24);
            v91[4] = a4;
            v91[8] = v24;
            v91[9] = v25;
            uint64_t v36 = v34 / v35;
            size_t v37 = v33;
            int v92 = v33;
            v91[10] = 1;
            v91[11] = v34 / v35;
            long long v38 = v91;
            unsigned int v39 = ImageType;
            uint64_t v40 = v32;
            size_t v41 = 0;
            uint64_t v42 = (uint64_t)BytePtr;
          }
          C3DImageEnumerateCubeMapFacePixelBuffers(v39, v36, v40, v37, v41, v42, (uint64_t)v38);
        }
      }
    }
    else if (v93[0])
    {
      if (TextureRawDataMipmapLevelCount)
      {
        for (unsigned __int8 j = 0; j < TextureRawDataMipmapLevelCount; ++j)
        {
          for (uint64_t k = 0; k != 6; ++k)
          {
            CFDataRef v77 = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v12 + 40), 6 * j + k);
            replaceSlice(a4, a5, k, j, v77, v12);
          }
        }
      }
    }
    else
    {
      for (CFIndex m = 0; m != 6; ++m)
      {
        CFArrayRef v80 = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v12 + 40), m);
        replaceRegion(a4, a5, m, v80, v12);
      }
    }
  }
  else
  {
    replaceRegion(a4, a5, 0, *(CFArrayRef *)(v12 + 40), v12);
  }
  a7 = TextureRawDataMipmapLevelCount < 2 && v81;
  if (!a4)
  {
    uint64_t v65 = scn_default_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:](v65, v66, v67, v68, v69, v70, v71, v72);
    }
  }
  return a7;
}

- (id)_textureDescriptorFromImage:(__C3DImage *)a3 needsMipMap:(BOOL)a4 textureOptions:(int)a5
{
  char v5 = a5;
  BOOL v6 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263F12A50]);
  Imageunsigned int Type = C3DImageGetImageType((uint64_t)a3);
  [v9 setTextureType:C3DImageTypeToMTLTextureType(ImageType)];
  uint64_t v11 = 1;
  [v9 setUsage:1];
  [v9 setStorageMode:0];
  Texturedouble Size = C3DImageGetTextureSize((uint64_t)a3);
  if (*(float *)TextureSize.i32 >= 1.0) {
    float v14 = *(float *)TextureSize.i32;
  }
  else {
    float v14 = 1.0;
  }
  objc_msgSend(v9, "setWidth:", (unint64_t)v14, *(void *)&TextureSize, *(void *)&v13);
  float v15 = v27;
  if (v27 < 1.0) {
    float v15 = 1.0;
  }
  [v9 setHeight:(unint64_t)v15];
  [v9 setDepth:C3DImageGetDepth((uint64_t)a3)];
  if (v6)
  {
    float v16 = fmax((double)[v9 width], (double)objc_msgSend(v9, "height"));
    uint64_t v11 = (int)(float)(floorf(log2f(v16)) + 1.0);
  }
  [v9 setMipmapLevelCount:v11];
  if ((unint64_t)[v9 mipmapLevelCount] >= 2 && objc_msgSend(v9, "textureType") == 5) {
    objc_msgSend(v9, "setUsage:", objc_msgSend(v9, "usage") | 0x10);
  }
  TextureRawCFDataRef Data = C3DImageGetTextureRawData((uint64_t)a3);
  if (TextureRawData)
  {
    uint64_t v18 = TextureRawData;
    if (C3DLinearRenderingIsEnabled() && !*(unsigned char *)(v18 + 10))
    {
      objc_msgSend(v9, "setMipmapLevelCount:", C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)a3, 0));
      if ((v5 & 1) == 0)
      {
        uint64_t v19 = SCNMTLPixelFormatSRGBVariant(*(unsigned int *)(v18 + 36));
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v9, "setMipmapLevelCount:", C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)a3, 0));
    }
    uint64_t v19 = SCNMTLPixelFormatNonSRGBVariant(*(unsigned int *)(v18 + 36));
LABEL_16:
    [v9 setPixelFormat:v19];
    return v9;
  }
  uint64_t v20 = (CGContext *)C3DImageCopyBitmap((uint64_t)a3, 1);
  if (v20)
  {
    uint64_t v21 = v20;
    size_t BitsPerComponent = CGBitmapContextGetBitsPerComponent(v20);
    size_t BitsPerPixel = CGBitmapContextGetBitsPerPixel(v21);
    size_t v24 = BitsPerPixel / BitsPerComponent;
    objc_msgSend(v9, "setPixelFormat:", SCNMTLPixelFormatFromBitmapContextDescription(BitsPerPixel / BitsPerComponent, BitsPerComponent, v21, v5));
    if (v24 == 1 && SCNMTLDeviceSupportsTextureSwizzle(self->_device)) {
      [v9 setSwizzle:16908802];
    }
    CGContextRelease(v21);
  }
  else
  {
    uint64_t v25 = scn_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Textures) _textureDescriptorFromImage:needsMipMap:textureOptions:]((uint64_t)a3);
    }
    return 0;
  }
  return v9;
}

- (id)newTextureUsingMTKTextureLoaderWithData:(id)a3 options:(id)a4
{
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self)];
  if (!v6)
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  id v18 = 0;
  float v15 = (void *)[v6 newTextureWithData:a3 options:a4 error:&v18];

  if (v18)
  {
    float v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:](&v18);
    }
    return 0;
  }
  return v15;
}

- (uint64_t)newConstantBufferWithLength:(uint64_t)a3 options:
{
  if (result)
  {
    int v3 = a2;
    uint64_t v4 = result;
    uint64_t result = [*(id *)(result + 8) newBufferWithLength:a2 options:a3];
    uint64_t v5 = *(void *)(v4 + 24);
    ++*(_DWORD *)(v5 + 240);
    *(_DWORD *)(v5 + 264) += v3;
  }
  return result;
}

- (uint64_t)commandQueue
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

+ (SCNMTLResourceManager)resourceManagerForDevice:(uint64_t)a1
{
  self;
  if (+[SCNMTLResourceManager resourceManagerForDevice:]::onceToken != -1) {
    dispatch_once(&+[SCNMTLResourceManager resourceManagerForDevice:]::onceToken, &__block_literal_global_21);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__resourceManagersLock);
  int v3 = (SCNMTLResourceManager *)[(id)__resourceManagers objectForKey:a2];
  if (!v3)
  {
    int v3 = [[SCNMTLResourceManager alloc] initWithDevice:a2];
    [(id)__resourceManagers setObject:v3 forKey:a2];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__resourceManagersLock);
  return v3;
}

- (SCNMTLResourceManager)initWithDevice:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SCNMTLResourceManager;
  uint64_t v4 = [(SCNMTLResourceManager *)&v12 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    if (!C3DUseOneCommandQueuePerDevice())
    {
LABEL_5:
      v5->_libraryManager = [[SCNMTLLibraryManager alloc] initWithDevice:v5->_device];
      uint64_t v7 = (__C3DEngineStats *)malloc_type_calloc(0x358uLL, 1uLL, 0x9538AC25uLL);
      v5->__engineStats = v7;
      [(SCNMTLLibraryManager *)v5->_libraryManager _setEngineStats:v7];
      v5->_bindingsGenerator = objc_alloc_init(SCNMTLShaderBindingsGenerator);
      v5->_commonProfileBuffersAllocator = [[SCNMTLBufferAllocator alloc] initWithDevice:v5->_device fixedSizeElement:256 buffersize:0x40000 name:@"SCNMaterialData"];
      v5->_availablePipelineStates = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
      v5->_availablePipelineStatesLock._os_unfair_lock_opaque = 0;
      v5->_availableLightingSystemReflectionProbeTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableIrradianceTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableRadianceTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableIESTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableImages.lock._os_unfair_lock_opaque = 0;
      v5->_availableImageProxy.lock._os_unfair_lock_opaque = 0;
      v5->_availableSamplers.lock._os_unfair_lock_opaque = 0;
      v5->_availableMeshes.lock._os_unfair_lock_opaque = 0;
      v5->_availableDeformerStacks.lock._os_unfair_lock_opaque = 0;
      v5->_availableSkinDeformerReadOnlyBuffers.lock._os_unfair_lock_opaque = 0;
      v5->_availableMorphDeformerReadOnlyBuffers.lock._os_unfair_lock_opaque = 0;
      v5->_availableTessellators.lock._os_unfair_lock_opaque = 0;
      v5->_availableComputePipelines.lock._os_unfair_lock_opaque = 0;
      v5->_availableComputePipelinesWithStageDescriptor.lock._os_unfair_lock_opaque = 0;
      v5->_availableColorMatchingComputePipelines.lock._os_unfair_lock_opaque = 0;
      v5->_availableBuffers.lock._os_unfair_lock_opaque = 0;
      v5->_availableMeshSources.lock._os_unfair_lock_opaque = 0;
      v5->_availableMeshElements.lock._os_unfair_lock_opaque = 0;
      v5->_availableRasterizerStates.lock._os_unfair_lock_opaque = 0;
      v5->_availableWireframeMaterials.lock._os_unfair_lock_opaque = 0;
      v5->_availableOpenSubdivComputeEvaluators.lock._os_unfair_lock_opaque = 0;
      v5->_availableShadables.lock._os_unfair_lock_opaque = 0;
      v5->_availableShadablesSearchKey = objc_alloc_init(SCNMTLShadableKey);
      v5->_availableStageDescriptors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v5->_stageDescriptorsLock._os_unfair_lock_opaque = 0;
      uint64_t v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v8 addObserver:v5 selector:sel__meshSourceWillDie_ name:@"kC3DNotificationMeshSourceWillDie" object:0];
      [v8 addObserver:v5 selector:sel__meshElementWillDie_ name:@"kC3DNotificationMeshElementWillDie" object:0];
      [v8 addObserver:v5 selector:sel__meshWillDie_ name:@"kC3DNotificationMeshWillDie" object:0];
      [v8 addObserver:v5 selector:sel__imageWillDie_ name:@"kC3DNotificationImageWillDie" object:0];
      [v8 addObserver:v5 selector:sel__imageProxyWillDie_ name:@"kC3DNotificationImageProxyWillDie" object:0];
      [v8 addObserver:v5 selector:sel__programWillDie_ name:@"kC3DNotificationProgramWillDie" object:0];
      [v8 addObserver:v5 selector:sel__passWillDie_ name:@"kC3DNotificationPassWillDie" object:0];
      [v8 addObserver:v5 selector:sel__materialWillDie_ name:@"kC3DNotificationMaterialWillDie" object:0];
      [v8 addObserver:v5 selector:sel__geometryWillDie_ name:@"kC3DNotificationGeometryWillDie" object:0];
      [v8 addObserver:v5 selector:sel__morphWillDie_ name:@"kC3DNotificationMorphWillDie" object:0];
      [v8 addObserver:v5 selector:sel__skinWillDie_ name:@"kC3DNotificationSkinWillDie" object:0];
      [v8 addObserver:v5 selector:sel__deformerStackWillDie_ name:@"kC3DNotificationDeformerStackWillDie" object:0];
      [v8 addObserver:v5 selector:sel__deformerStackDidChange_ name:@"kC3DNotificationDeformerStackDidChange" object:0];
      [v8 addObserver:v5 selector:sel__programHashCodeWillDie_ name:@"kC3DNotificationProgramHashCodeWillDie" object:0];
      [v8 addObserver:v5 selector:sel__precomputedLightingEnvironmentWillDie_ name:@"kC3DNotificationPrecomputedLightingEnvironmentWillDie" object:0];
      v5->_defaultPrograCFIndex m = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(@"debug_vert", @"debug_frag");
      v5->_defaultProgramForTessellation = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(@"debug_post_tessellation_vert", @"debug_frag");
      v5->_isolatePrograCFIndex m = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(@"debug_vert", @"debug_isolate_frag");
      uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterAddObserver(SharedInstance, v5, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_rasterizerStateDidDie, @"kC3DNotificationRasterizerStatesDidDie", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      return v5;
    }
    BOOL v6 = (MTLCommandQueue *)[a3 newCommandQueue];
    if (v6)
    {
      v5->_commandQueue = v6;
      [(MTLCommandQueue *)v6 setLabel:@"com.apple.SceneKit"];
      goto LABEL_5;
    }
    uint64_t v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager initWithDevice:](v11);
    }
    return 0;
  }
  return v5;
}

uint64_t __50__SCNMTLResourceManager_resourceManagerForDevice___block_invoke()
{
  __resourceManagersLocuint64_t k = 0;
  __resourceManagers = (uint64_t)(id)[MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  +[SCNMTLShaderBindingsGenerator allocateRegistry];

  return +[SCNMTLRenderContext registerBindings]();
}

- (void)_imageWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableImages.lock);
  for (uint64_t i = 0; i != 16; ++i)
  {
    unint64_t v6 = 0xC6A4A7935BD1E995
       * (i & 0x7F000000 ^ v4 ^ i & 0xFF0000 ^ (unsigned __int16)i & 0xFF00 ^ i ^ 0x1A929E4D6F47A654);
    unint64_t v7 = (0xC6A4A7935BD1E995 * (v6 ^ (v6 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v6 ^ (v6 >> 47))) >> 47);
    id v8 = [(NSMapTable *)self->_availableImages.registry objectForKey:v7];
    if (v8)
    {
      id v9 = v8;
      os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
      [(NSMapTable *)self->_availableIrradianceTextures.registry removeObjectForKey:v9];
      os_unfair_lock_unlock(&self->_availableIrradianceTextures.lock);
      os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
      [(NSMapTable *)self->_availableRadianceTextures.registry removeObjectForKey:v9];
      os_unfair_lock_unlock(&self->_availableRadianceTextures.lock);
      [(NSMapTable *)self->_availableImages.registry removeObjectForKey:v7];
    }
  }

  os_unfair_lock_unlock(&self->_availableImages.lock);
}

- (id)computeEvaluatorWithContext:(MTLContext *)a3 srcDesc:(const BufferDescriptor *)a4 dstDesc:(const BufferDescriptor *)a5 duDesc:(const BufferDescriptor *)a6 dvDesc:(const BufferDescriptor *)a7
{
  unint64_t v12 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * *(void *)&a4->var1) ^ ((0xC6A4A7935BD1E995 * *(void *)&a4->var1) >> 47))) ^ 0x4FB7DAE84DD6F2FCLL)) ^ a5->var2);
  unint64_t v13 = (0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) >> 47);
  p_availableOpenSubdivComputeEvaluators = (uint64_t *)&self->_availableOpenSubdivComputeEvaluators;
  p_locuint64_t k = &self->_availableOpenSubdivComputeEvaluators.lock;
  os_unfair_lock_lock(&self->_availableOpenSubdivComputeEvaluators.lock);
  float v16 = (void *)*p_availableOpenSubdivComputeEvaluators;
  if (!*p_availableOpenSubdivComputeEvaluators)
  {
    SCNResourceRegistrySetup(p_availableOpenSubdivComputeEvaluators, 0);
    float v16 = (void *)*p_availableOpenSubdivComputeEvaluators;
  }
  uint64_t v17 = (void *)[v16 objectForKey:v13];
  if (!v17)
  {
    id v18 = objc_alloc_init(SCNMTLOpenSubdivComputeEvaluator);
    OpenSubdiv::v3_1_1::Osd::MTLComputeEvaluator::Create((OpenSubdiv::v3_1_1::Osd::MTLComputeEvaluator *)a4, a5, a6, a7, (const BufferDescriptor *)a3, v19);
  }
  os_unfair_lock_unlock(p_lock);
  return v17;
}

+ (void)unregisterManagerForDevice:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&__resourceManagersLock);
  [(id)__resourceManagers removeObjectForKey:a3];

  os_unfair_lock_unlock((os_unfair_lock_t)&__resourceManagersLock);
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  self->_availableLightingSystemReflectionProbeTextures.registry = 0;
  self->_availableIrradianceTextures.registry = 0;

  self->_availableRadianceTextures.registry = 0;
  self->_availableIESTextures.registry = 0;

  self->_availableImages.registry = 0;
  self->_availableImageProxy.registry = 0;

  self->_availableSamplers.registry = 0;
  self->_availableMeshes.registry = 0;

  self->_availableDeformerStacks.registry = 0;
  self->_availableSkinDeformerReadOnlyBuffers.registry = 0;

  self->_availableMorphDeformerReadOnlyBuffers.registry = 0;
  self->_availableTessellators.registry = 0;

  self->_availableComputePipelines.registry = 0;
  self->_availableComputePipelinesWithStageDescriptor.registry = 0;

  self->_availableColorMatchingComputePipelines.registry = 0;
  self->_availableBuffers.registry = 0;

  self->_availableMeshSources.registry = 0;
  self->_availableMeshElements.registry = 0;

  self->_availableRasterizerStates.registry = 0;
  self->_availableWireframeMaterials.registry = 0;

  self->_availableOpenSubdivComputeEvaluators.registry = 0;
  self->_availableShadables.registry = 0;
  CFRelease(self->_availablePipelineStates);

  defaultPrograCFIndex m = self->_defaultProgram;
  if (defaultProgram)
  {
    CFRelease(defaultProgram);
    self->_defaultPrograCFIndex m = 0;
  }
  defaultProgramForTessellation = self->_defaultProgramForTessellation;
  if (defaultProgramForTessellation)
  {
    CFRelease(defaultProgramForTessellation);
    self->_defaultProgramForTessellation = 0;
  }
  isolatePrograCFIndex m = self->_isolateProgram;
  if (isolateProgram)
  {
    CFRelease(isolateProgram);
    self->_isolatePrograCFIndex m = 0;
  }

  free(self->__engineStats);
  self->__engineStats = 0;

  +[SCNMTLResourceManager unregisterManagerForDevice:self->_device];
  v6.receiver = self;
  v6.super_class = (Class)SCNMTLResourceManager;
  [(SCNMTLResourceManager *)&v6 dealloc];
}

- (void)_meshSourceWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  if (C3DGenericSourceIsPrimary(v4))
  {
    CFDataRef Data = (const __CFData *)C3DMeshSourceGetData(v4);
    if (Data)
    {
      CFDataRef v6 = Data;
      if (CFDataGetLength(Data))
      {
        os_unfair_lock_lock(&self->_availableMeshSources.lock);
        [(NSMapTable *)self->_availableMeshSources.registry removeObjectForKey:v6];
        os_unfair_lock_unlock(&self->_availableMeshSources.lock);
      }
    }
  }
}

- (void)_meshElementWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableMeshElements.lock);
  id v5 = [(NSMapTable *)self->_availableMeshElements.registry objectForKey:v4];
  if (![(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v5) decrementUsedCount])
  {
    os_unfair_lock_lock(&self->_availableBuffers.lock);
    -[NSMapTable removeObjectForKey:](self->_availableBuffers.registry, "removeObjectForKey:", [(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v5) dataSource]);
    os_unfair_lock_unlock(&self->_availableBuffers.lock);
  }
  [(NSMapTable *)self->_availableMeshElements.registry removeObjectForKey:v4];

  os_unfair_lock_unlock(&self->_availableMeshElements.lock);
}

uint64_t __38__SCNMTLResourceManager__meshWillDie___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 32) | 1;

  return [a3 removeObjectForKey:v5];
}

uint64_t __38__SCNMTLResourceManager__meshWillDie___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 32) | 1;

  return [a3 removeObjectForKey:v5];
}

- (void)_morphWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  [(NSMapTable *)self->_availableMorphDeformerReadOnlyBuffers.registry removeObjectForKey:v4];

  os_unfair_lock_unlock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
}

- (void)_skinWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  [(NSMapTable *)self->_availableSkinDeformerReadOnlyBuffers.registry removeObjectForKey:v4];

  os_unfair_lock_unlock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
}

- (void)_deformerStackWillDie:(id)a3
{
  p_locuint64_t k = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  uint64_t v6 = [a3 object];
  [(NSMapTable *)self->_availableDeformerStacks.registry removeObjectForKey:v6];
  [(NSMapTable *)self->_availableDeformerStacks.registry removeObjectForKey:v6 | 1];

  os_unfair_lock_unlock(p_lock);
}

- (void)_deformerStackDidChange:(id)a3
{
  p_locuint64_t k = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  uint64_t v6 = [a3 object];
  BOOL v7 = C3DDeformerStackWantsGPU(v6);
  registry = self->_availableDeformerStacks.registry;
  uint64_t v9 = v6 | 1;
  if (v7)
  {
    uint64_t v10 = [(NSMapTable *)registry objectForKey:v6];
    id v11 = [(NSMapTable *)self->_availableDeformerStacks.registry objectForKey:v9];
    -[SCNMTLDeformerStack invalidate](v10);
    -[SCNMTLDeformerStack invalidate]((uint64_t)v11);
  }
  else
  {
    [(NSMapTable *)registry removeObjectForKey:v6];
    [(NSMapTable *)self->_availableDeformerStacks.registry removeObjectForKey:v6 | 1];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_imageProxyWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableImageProxy.lock);
  [(NSMapTable *)self->_availableImageProxy.registry removeObjectForKey:v4];

  os_unfair_lock_unlock(&self->_availableImageProxy.lock);
}

- (void)_precomputedLightingEnvironmentWillDie:(id)a3
{
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  [(NSMapTable *)self->_availableIrradianceTextures.registry removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_availableIrradianceTextures.lock);
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  [(NSMapTable *)self->_availableRadianceTextures.registry removeObjectForKey:v4];

  os_unfair_lock_unlock(&self->_availableRadianceTextures.lock);
}

- (void)_rasterizerStateDidDie:(const void *)a3
{
}

- (void)_passWillDie:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 object];
  p_locuint64_t k = &self->_availableShadables.lock;
  os_unfair_lock_lock(&self->_availableShadables.lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  registry = self->_availableShadables.registry;
  uint64_t v7 = [(NSMapTable *)registry countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(registry);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (*(void *)(*(void *)(v12 + 24) + 24) == v4)
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [(NSMapTable *)registry countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
    p_locuint64_t k = &self->_availableShadables.lock;
    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v13 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v9);
            }
            [(NSMapTable *)self->_availableShadables.registry removeObjectForKey:*(void *)(*((void *)&v17 + 1) + 8 * j)];
          }
          uint64_t v14 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }
        while (v14);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  [(SCNMTLResourceManager *)self _removeMatchingProgram:0 pass:v4];
}

- (void)_geometryWillDie:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 object];
  os_unfair_lock_lock(&self->_availableShadables.lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  registry = self->_availableShadables.registry;
  uint64_t v6 = [(NSMapTable *)registry countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(registry);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (*(void *)(v11 + 16) == v4)
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [(NSMapTable *)registry countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
    if (v8)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v12 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v8);
            }
            [(NSMapTable *)self->_availableShadables.registry removeObjectForKey:*(void *)(*((void *)&v16 + 1) + 8 * j)];
          }
          uint64_t v13 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v13);
      }
    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
  os_unfair_lock_lock(&self->_availableTessellators.lock);
  [(NSMapTable *)self->_availableTessellators.registry removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_availableTessellators.lock);
}

- (void)removeAllShaders
{
  if (a1)
  {
    [*(id *)(a1 + 32) clearCompiledLibraries];
    uint64_t v2 = *(__CFDictionary **)(a1 + 48);
    CFDictionaryRemoveAllValues(v2);
  }
}

- (void)resetRasterizerStates
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 256);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));

    *(void *)(a1 + 248) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (id)_bufferForMTLBuffer:(void *)a3
{
  p_locuint64_t k = &self->_availableBuffers.lock;
  os_unfair_lock_lock(&self->_availableBuffers.lock);
  registry = self->_availableBuffers.registry;
  if (!registry)
  {
    registry = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    self->_availableBuffers.registry = registry;
  }
  uint64_t v7 = [(NSMapTable *)registry objectForKey:a3];
  if (v7)
  {
    id v8 = v7;
    [(SCNMTLBuffer *)v7 incrementUsedCount];
  }
  else
  {
    id v8 = objc_alloc_init(SCNMTLBuffer);
    [(SCNMTLBuffer *)v8 setBuffer:a3];
    [(SCNMTLBuffer *)v8 setDataSource:a3];
    [(SCNMTLBuffer *)v8 incrementUsedCount];
    [(NSMapTable *)self->_availableBuffers.registry setObject:v8 forKey:a3];
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

+ (void)_fillVertexDescriptor:(id)a3 withMeshSource:(__C3DMeshSource *)a4 semantic:(char)a5 inputSet:(int64_t)a6 bufferIndex:(int64_t)a7
{
}

+ (void)_fillVertexDescriptor:(id)a3 withSemantic:(char)a4 inputSet:(int64_t)a5 bufferIndex:(int64_t)a6 vertexFormat:(unint64_t)a7 offset:(unint64_t)a8 stride:(unint64_t)a9
{
  char v13 = 0;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      char v13 = 1;
      break;
    case 2:
      char v13 = 3;
      break;
    case 3:
      if (a5 == -1)
      {
        char v13 = 6;
      }
      else
      {
        char v13 = a5 + 6;
        if ((a5 + 6) == 14) {
          goto LABEL_6;
        }
      }
      break;
    case 4:
      char v13 = 2;
      break;
    case 5:
      char v13 = 4;
      break;
    case 6:
      char v13 = 5;
      break;
    default:
LABEL_6:
      uint64_t v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        _fillVertexDescriptor();
      }
      char v13 = 14;
      break;
  }
  int64_t v15 = a6 + 18;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v13), "setFormat:", a7);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v13), "setOffset:", a8);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v13), "setBufferIndex:", v15);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v15), "setStride:", a9);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v15), "setStepFunction:", 1);
}

- (void)__updateMutableMesh:(__C3DMesh *)a3 withMetalMesh:(id)a4
{
  uint64_t MutabilityTimeStamp = C3DMeshGetMutabilityTimeStamp((uint64_t)a3);
  if (MutabilityTimeStamp != -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)a4))
  {
    -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)a4, MutabilityTimeStamp);
    os_unfair_lock_lock(&self->_availableMeshSources.lock);
    if (!self->_availableMeshSources.registry) {
      self->_availableMeshSources.registry = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke;
    v8[3] = &unk_264005FE8;
    v8[4] = self;
    void v8[5] = a4;
    C3DMeshApplySources((uint64_t)a3, 1, (uint64_t)v8);
    os_unfair_lock_unlock(&self->_availableMeshSources.lock);
  }
}

void *__59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)C3DMeshSourceIsMutable(a2);
  if (result)
  {
    uint64_t result = (void *)C3DMeshSourceGetMTLBuffer(a2);
    if (!result)
    {
      CFDataRef Data = (const __CFData *)C3DMeshSourceGetData(a2);
      uint64_t v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 216) objectForKey:Data];
      if ([(id)-[SCNMTLMesh buffers](*(void *)(a1 + 40)) indexOfObject:v6] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v7 = scn_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_2(v7, v8, v9);
        }
      }
      BytePtr = CFDataGetBytePtr(Data);
      CFIndex Length = CFDataGetLength(Data);
      if (Length != [v6 length])
      {
        uint64_t v12 = scn_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_1(Length, v6, v12);
        }
      }
      return memcpy((void *)[v6 contents], BytePtr, Length);
    }
  }
  return result;
}

- (id)renderResourceForDeformerStack:(__C3DDeformerStack *)a3 node:(__C3DNode *)a4 dataKind:(unsigned __int8)a5
{
  unint64_t v9 = (a5 == 0) | (unint64_t)a3;
  p_locuint64_t k = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  registry = self->_availableDeformerStacks.registry;
  if (!registry)
  {
    registry = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    self->_availableDeformerStacks.registry = registry;
  }
  uint64_t v12 = [(NSMapTable *)registry objectForKey:v9];
  if (!v12)
  {
    uint64_t v12 = -[SCNMTLDeformerStack initWithDeformerStack:node:dataKind:resourceManager:]([SCNMTLDeformerStack alloc], (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)self);
    [(NSMapTable *)self->_availableDeformerStacks.registry setObject:v12 forKey:v9];
  }
  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)renderResourceForSkinner:(__C3DSkinner *)a3 baseMesh:(__C3DMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6
{
  int v7 = a5;
  p_locuint64_t k = &self->_availableSkinDeformerReadOnlyBuffers.lock;
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  if (!self->_availableSkinDeformerReadOnlyBuffers.registry) {
    self->_availableSkinDeformerReadOnlyBuffers.registry = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
  }
  uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)a3);
  id v13 = [(NSMapTable *)self->_availableSkinDeformerReadOnlyBuffers.registry objectForKey:OverrideMaterial];
  if (!v13)
  {
    id v13 = (id)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:1];
    [(NSMapTable *)self->_availableSkinDeformerReadOnlyBuffers.registry setObject:v13 forKey:OverrideMaterial];
  }
  unint64_t v14 = (v7 == 0) | (unint64_t)a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3052000000;
  long long v23 = __Block_byref_object_copy__2;
  long long v24 = __Block_byref_object_dispose__2;
  uint64_t v25 = 0;
  uint64_t v25 = [v13 objectForKey:v14];
  if (!v21[5])
  {
    registry = self->_availableSkinDeformerReadOnlyBuffers.registry;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __77__SCNMTLResourceManager_renderResourceForSkinner_baseMesh_dataKind_provider___block_invoke;
    v19[3] = &unk_264006060;
    v19[6] = &v20;
    v19[7] = OverrideMaterial;
    v19[4] = v13;
    v19[5] = v14;
    [(NSMapTable *)registry scn_enumerateKeysAndValuesUsingBlock:v19];
    uint64_t v16 = v21[5];
    if (!v16)
    {
      uint64_t v16 = (*((uint64_t (**)(id))a6 + 2))(a6);
      v21[5] = v16;
    }
    [v13 setObject:v16 forKey:v14];
  }
  os_unfair_lock_unlock(p_lock);
  long long v17 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t __77__SCNMTLResourceManager_renderResourceForSkinner_baseMesh_dataKind_provider___block_invoke(uint64_t result, void *a2, void *a3, unsigned char *a4)
{
  if (*(void **)(result + 32) != a3)
  {
    uint64_t v6 = result;
    uint64_t result = +[SCNMTLSkinDeformer canSkin:reuseRenderResourceForSkin:]((uint64_t)SCNMTLSkinDeformer, *(void **)(result + 56), a2);
    if (result)
    {
      uint64_t result = [a3 objectForKey:*(void *)(v6 + 40)];
      *(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 40) = result;
      if (*(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 40)) {
        *a4 = 1;
      }
    }
  }
  return result;
}

- (id)renderResourceForMorpher:(__C3DMorpher *)a3 baseMesh:(__C3DMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6
{
  int v7 = a5;
  p_locuint64_t k = &self->_availableMorphDeformerReadOnlyBuffers.lock;
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  if (!self->_availableMorphDeformerReadOnlyBuffers.registry) {
    self->_availableMorphDeformerReadOnlyBuffers.registry = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
  }
  uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)a3);
  id v13 = [(NSMapTable *)self->_availableMorphDeformerReadOnlyBuffers.registry objectForKey:OverrideMaterial];
  if (!v13)
  {
    id v13 = (id)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:1];
    [(NSMapTable *)self->_availableMorphDeformerReadOnlyBuffers.registry setObject:v13 forKey:OverrideMaterial];
  }
  unint64_t v14 = (v7 == 0) | (unint64_t)a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3052000000;
  long long v23 = __Block_byref_object_copy__2;
  long long v24 = __Block_byref_object_dispose__2;
  uint64_t v25 = 0;
  uint64_t v25 = [v13 objectForKey:v14];
  if (!v21[5])
  {
    registry = self->_availableMorphDeformerReadOnlyBuffers.registry;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __77__SCNMTLResourceManager_renderResourceForMorpher_baseMesh_dataKind_provider___block_invoke;
    v19[3] = &unk_264006060;
    v19[6] = &v20;
    v19[7] = OverrideMaterial;
    v19[4] = v13;
    v19[5] = v14;
    [(NSMapTable *)registry scn_enumerateKeysAndValuesUsingBlock:v19];
    uint64_t v16 = v21[5];
    if (!v16)
    {
      uint64_t v16 = (*((uint64_t (**)(id))a6 + 2))(a6);
      v21[5] = v16;
    }
    [v13 setObject:v16 forKey:v14];
  }
  os_unfair_lock_unlock(p_lock);
  long long v17 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t __77__SCNMTLResourceManager_renderResourceForMorpher_baseMesh_dataKind_provider___block_invoke(uint64_t result, uint64_t a2, void *a3, unsigned char *a4)
{
  if (*(void **)(result + 32) != a3)
  {
    uint64_t v6 = result;
    uint64_t result = +[SCNMTLMorphDeformer canMorph:reuseRenderResourceForMorph:]();
    if (result)
    {
      uint64_t result = [a3 objectForKey:*(void *)(v6 + 40)];
      *(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 40) = result;
      if (*(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 40)) {
        *a4 = 1;
      }
    }
  }
  return result;
}

- (SCNMTLTessellator)renderResourceForTessellatedGeometry:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 368);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 368));
  uint64_t v5 = *(void **)(a1 + 360);
  if (!v5)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    *(void *)(a1 + 360) = v5;
  }
  uint64_t v6 = (SCNMTLTessellator *)[v5 objectForKey:a2];
  if (!v6)
  {
    uint64_t v6 = [[SCNMTLTessellator alloc] initWithGeometry:a2 resourceManager:a1];
    [*(id *)(a1 + 360) setObject:v6 forKey:a2];
  }
  os_unfair_lock_unlock(v4);
  return v6;
}

- (SCNMetalWireframeResource)wireframeResourceForRendererElement:(uint64_t)a3 engineContext:(unsigned __int8 *)a4 passInstance:(uint64_t)a5 hashPass:
{
  if (!a1) {
    return 0;
  }
  uint64_t RenderContext = C3DEngineContextGetRenderContext(a3);
  uint64_t ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(a3);
  uint64_t ProgramHashCodeForRenderElement = C3DProgramHashCodeStoreGetProgramHashCodeForRenderElement(ProgramHashCodeStore, a2, 0, a5);
  if (!ProgramHashCodeForRenderElement) {
    return 0;
  }
  uint64_t v13 = ProgramHashCodeForRenderElement;
  unint64_t v14 = (os_unfair_lock_s *)(a1 + 384);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 384));
  int64_t v15 = *(void **)(a1 + 376);
  if (!v15)
  {
    int64_t v15 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:100];
    *(void *)(a1 + 376) = v15;
  }
  uint64_t v16 = (SCNMetalWireframeResource *)[v15 objectForKey:v13];
  if (!v16)
  {
    Node = (void *)C3DRendererElementGetNode((uint64_t)a2);
    Geometry = (__C3DGeometry *)C3DRendererElementGetGeometry((uint64_t)a2);
    uint64_t Mesh = C3DRendererElementGetMesh((uint64_t)a2);
    MeshElement = C3DRendererElementGetMeshElement((uint64_t)a2);
    uint64_t Material = C3DRendererElementGetMaterial((uint64_t)a2);
    long long v18 = (const void *)C3DMaterialCopyForFlatShading(Material);
    unsigned int CommonProfileConditioners = C3DEngineContextGetCommonProfileConditioners(a3);
    uint64_t v20 = a4[24];
    int v21 = (8 * (a4[27] & 3)) & 0x9F | (a2[36] >> 11) & 7 | (32 * (a4[28] & 3));
    if (-[SCNMTLRenderContext reverseZ](RenderContext)) {
      char v22 = 0x80;
    }
    else {
      char v22 = 0;
    }
    long long v23 = (const void *)C3DProgramHashCodeCreate(Node, Geometry, Mesh, (uint64_t)MeshElement, 0, (uint64_t)v18, (v20 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v21 | v22) << 24) | CommonProfileConditioners);
    long long v24 = (const void *)C3DEngineContextEvaluateProgramWithHashCode(a3, (uint64_t)v23, Material, 0);
    uint64_t v16 = objc_alloc_init(SCNMetalWireframeResource);
    uint64_t v25 = v16->material;
    if (v25 != v18)
    {
      if (v25)
      {
        CFRelease(v25);
        v16->material = 0;
      }
      if (v18) {
        uint64_t v26 = (void *)CFRetain(v18);
      }
      else {
        uint64_t v26 = 0;
      }
      v16->material = v26;
    }
    prograCFIndex m = v16->program;
    unint64_t v14 = (os_unfair_lock_s *)(a1 + 384);
    if (program != v24)
    {
      if (program)
      {
        CFRelease(program);
        v16->prograCFIndex m = 0;
      }
      if (v24) {
        uint64_t v28 = (void *)CFRetain(v24);
      }
      else {
        uint64_t v28 = 0;
      }
      v16->prograCFIndex m = v28;
    }
    uint64_t programHashCode = (uint64_t)v16->programHashCode;
    if ((const void *)programHashCode != v23)
    {
      C3DProgramHashCodeRelease(programHashCode);
      if (v23) {
        unsigned int v30 = (void *)CFRetain(v23);
      }
      else {
        unsigned int v30 = 0;
      }
      v16->uint64_t programHashCode = v30;
    }
    [*(id *)(a1 + 376) setObject:v16 forKey:v13];

    CFRelease(v18);
    C3DProgramHashCodeRelease((uint64_t)v23);
  }
  os_unfair_lock_unlock(v14);
  return v16;
}

- (uint64_t)newBufferWithBytes:(uint64_t)a3 length:(uint64_t)a4 options:
{
  if (result)
  {
    int v4 = a3;
    uint64_t v5 = result;
    uint64_t result = [*(id *)(result + 8) newBufferWithBytes:a2 length:a3 options:a4];
    uint64_t v6 = *(void *)(v5 + 24);
    ++*(_DWORD *)(v6 + 228);
    *(_DWORD *)(v6 + 256) += v4;
  }
  return result;
}

- (uint64_t)newPrivateBufferWithBytes:(uint64_t)a3 length:(void *)a4 blitEncoder:
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = [*(id *)(a1 + 8) newBufferWithLength:a3 options:32];
  unint64_t v9 = (void *)[*(id *)(a1 + 8) newBufferWithBytes:a2 length:a3 options:0];
  [a4 copyFromBuffer:v9 sourceOffset:0 toBuffer:v8 destinationOffset:0 size:a3];

  uint64_t v10 = *(void *)(a1 + 24);
  ++*(_DWORD *)(v10 + 228);
  *(_DWORD *)(v10 + 256) += a3;
  return v8;
}

- (uint64_t)newBufferWithLength:(uint64_t)a3 options:
{
  if (result)
  {
    int v3 = a2;
    uint64_t v4 = result;
    uint64_t result = [*(id *)(result + 8) newBufferWithLength:a2 options:a3];
    uint64_t v5 = *(void *)(v4 + 24);
    ++*(_DWORD *)(v5 + 228);
    *(_DWORD *)(v5 + 256) += v3;
  }
  return result;
}

uint64_t __89__SCNMTLResourceManager_renderResourceForMaterial_geometry_renderPipeline_engineContext___block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeID v5 = CFGetTypeID(cf);
  uint64_t result = C3DEffectSlotGetTypeID();
  if (cf && v5 == result)
  {
    uint64_t result = C3DKeyframeControllerHasInterpolationModesPerKey((uint64_t)cf);
    if (result)
    {
      uint64_t result = C3DEffectSlotGetImageTransform((uint64_t)cf);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = *(void *)(v8 + 24);
      *(void *)(v8 + 24) = v9 + 1;
      *(void *)(v7 + 8 * v9) = result;
    }
  }
  return result;
}

- (uint64_t)dispatchForCubemap:(void *)a3 computeEncoder:(void *)a4 pipelineState:
{
  if (result)
  {
    unint64_t v7 = [a4 threadExecutionWidth];
    unint64_t v8 = [a2 width];
    if (v7 >= v8) {
      unint64_t v7 = v8;
    }
    unint64_t v9 = [a4 maxTotalThreadsPerThreadgroup];
    unint64_t v10 = v7;
    do
    {
      unint64_t v11 = v10;
      unint64_t v12 = v10 * v7;
      v10 >>= 1;
    }
    while (v12 > v9);
    v14[0] = (v7 + [a2 width] - 1) / v7;
    v14[1] = (v11 + [a2 height] - 1) / v11;
    v14[2] = 6;
    v13[0] = v7;
    v13[1] = v11;
    v13[2] = 1;
    return [a3 dispatchThreadgroups:v14 threadsPerThreadgroup:v13];
  }
  return result;
}

- (uint64_t)depthAndStencilStateWithReadWriteDepthDisabled
{
  if (result)
  {
    uint64_t v1 = result;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__SCNMTLResourceManager_depthAndStencilStateWithReadWriteDepthDisabled__block_invoke;
    block[3] = &unk_264004DF8;
    block[4] = result;
    if (-[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]::onceToken != -1) {
      dispatch_once(&-[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]::onceToken, block);
    }
    return *(void *)(v1 + 488);
  }
  return result;
}

void __71__SCNMTLResourceManager_depthAndStencilStateWithReadWriteDepthDisabled__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F128A0]);
  [v2 setDepthCompareFunction:7];
  [v2 setDepthWriteEnabled:0];
  *(void *)(*(void *)(a1 + 32) + 488) = [*(id *)(*(void *)(a1 + 32) + 8) newDepthStencilStateWithDescriptor:v2];
}

- (void)commandBufferDidCompleteWithError:(id)a3
{
  p_locuint64_t k = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  [(NSMapTable *)self->_availableDeformerStacks.registry scn_enumerateKeysAndValuesUsingBlock:&__block_literal_global_224];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __59__SCNMTLResourceManager_commandBufferDidCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[SCNMTLDeformerStack setNextUpdateRequiresResetForIncrementalDeformers](a3);
}

- (id)copyTextureByConvertingToCubeMapIfApplicable:(id)a3 engineContext:(__C3DEngineContext *)a4 needsMipmap:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [a3 width];
  if (v8 == 2 * [a3 height])
  {
    uint64_t v9 = [a3 pixelFormat];
    if (v9 == 115 || v9 == 125) {
      uint64_t v11 = 115;
    }
    else {
      uint64_t v11 = 70;
    }
    return [(SCNMTLResourceManager *)self newCubemapTextureForLatlongTexture:a3 pixelFormat:v11 engineContext:a4 needsMipmap:v5];
  }
  else
  {
    return a3;
  }
}

- (id)newTextureUsingMTKTextureLoaderWithURL:(id)a3 options:(id)a4
{
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self)];
  if (!v6)
  {
    unint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  id v18 = 0;
  int64_t v15 = (void *)[v6 newTextureWithContentsOfURL:a3 options:a4 error:&v18];

  if (v18)
  {
    uint64_t v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:](&v18);
    }
    return 0;
  }
  return v15;
}

- (void)_enqueueCopyFromTexture:(id)a3 toTexture:(id)a4 blitEncoder:(SCNMTLBlitCommandEncoder *)a5 generateMipMaps:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v10 = [a3 width];
  if (v10 == [a4 width])
  {
    uint64_t v11 = [a3 height];
    if (v11 == [a4 height])
    {
      uint64_t v12 = [a3 depth];
      if (v12 == [a4 depth])
      {
        SCNMTLBlitCommandEncoder::copyTextureToTexture((void **)&a5->_encoder, a3, 0, a4, 0);
        if (v6)
        {
          SCNMTLBlitCommandEncoder::generateMipmapsForTexture((void **)&a5->_encoder, a4);
        }
      }
    }
  }
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v3 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  return [v3 replaceRegion:v6 mipmapLevel:0 slice:a2 withBytes:a3 bytesPerRow:*(unsigned int *)(a1 + 96) bytesPerImage:*(void *)(a1 + 88) * *(unsigned int *)(a1 + 96)];
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  long long v6 = *(_OWORD *)(a1 + 80);
  return objc_msgSend(*(id *)(a1 + 32), "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v5, 0, a2, a3, *(void *)(a1 + 96), *(void *)(a1 + 96) * objc_msgSend(*(id *)(a1 + 40), "height", v5[0], v3, v6));
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) width];
  uint64_t v7 = [*(id *)(a1 + 32) height];
  v9[0] = 0;
  v9[1] = 0;
  v9[2] = v5;
  v9[3] = v6;
  v9[4] = v7;
  v9[5] = 1;
  return objc_msgSend(*(id *)(a1 + 40), "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, 0, 0, a3, *(void *)(a1 + 48), *(void *)(a1 + 48) * objc_msgSend(*(id *)(a1 + 32), "height", 0, 0, v5, v6, v7, 1));
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2_5(uint64_t a1, unsigned int a2, uint64_t a3)
{
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  long long v6 = *(_OWORD *)(a1 + 80);
  return objc_msgSend(*(id *)(a1 + 32), "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v5, 0, a2, a3, *(void *)(a1 + 96), *(void *)(a1 + 96) * objc_msgSend(*(id *)(a1 + 40), "height", v5[0], v3, v6));
}

- (id)newCubemapTextureForLatlongTexture:(id)a3 pixelFormat:(unint64_t)a4 engineContext:(__C3DEngineContext *)a5 needsMipmap:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v11 = [a3 width];
  if (v11 >> 1 >= 0x800) {
    uint64_t v12 = 2048;
  }
  else {
    uint64_t v12 = v11 >> 1;
  }
  uint64_t v13 = (void *)[MEMORY[0x263F12A50] textureCubeDescriptorWithPixelFormat:a4 size:v12 mipmapped:v6];
  [v13 setUsage:19];
  [v13 setStorageMode:2];
  id v14 = [(SCNMTLResourceManager *)self newTextureWithDescriptor:v13];
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a5);
  BOOL HasFeatures = C3DEngineContextHasFeatures((uint64_t)a5, 512);
  BOOL v17 = HasFeatures;
  if (HasFeatures) {
    id v18 = @"compute_cube_from_equi";
  }
  else {
    id v18 = @"compute_cube_from_equi_views";
  }
  long long v19 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)[(SCNMTLResourceManager *)self computePipelineStateForKernel:v18]);
  uint64_t v20 = (void *)-[SCNMTLRenderContext resourceComputeEncoder](RenderContext);
  bzero(v20, 0x678uLL);
  int v21 = (void *)v20[207];
  [v21 setComputePipelineState:v19];
  [v21 setTexture:a3 atIndex:0];
  if (v17)
  {
    [v21 setTexture:v14 atIndex:1];
  }
  else
  {
    _fillViewsFromCubeMap(v14, 0, (uint64_t)v24);
    objc_msgSend(v21, "setTextures:withRange:", v24, 1, 6);
  }
  -[SCNMTLResourceManager dispatchForCubemap:computeEncoder:pipelineState:]((uint64_t)self, v14, v21, v19);
  if (v6)
  {
    char v22 = (void **)-[SCNMTLRenderContext resourceBlitEncoder](RenderContext);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v22, v14);
  }
  return v14;
}

- (id)latlongTextureForCubemap:(id)a3 pixelFormat:(unint64_t)a4 renderContext:(id)a5 needsMipmap:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v10 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, 2 * objc_msgSend(a3, "width"), objc_msgSend(a3, "height"), a6);
  [v10 setUsage:3];
  [v10 setStorageMode:2];
  id v11 = [(SCNMTLResourceManager *)self newTextureWithDescriptor:v10];
  uint64_t v12 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)[(SCNMTLResourceManager *)self computePipelineStateForKernel:@"compute_equi_from_cube"]);
  uint64_t v13 = (void *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a5);
  bzero(v13, 0x678uLL);
  id v14 = (void *)v13[207];
  [v14 setComputePipelineState:v12];
  [v14 setTexture:a3 atIndex:0];
  [v14 setTexture:v11 atIndex:1];
  v19[0] = [v10 width];
  v19[1] = [v10 height];
  void v19[2] = 1;
  int64x2_t v17 = vdupq_n_s64(1uLL);
  uint64_t v18 = 1;
  [v14 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
  if (v6)
  {
    int64_t v15 = (void **)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)a5);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v15, v11);
  }
  return v11;
}

- (id)unstageTexture:(id)a3 commandBuffer:(id)a4
{
  id v5 = a3;
  if ([a3 storageMode] == 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F12A50]);
    objc_msgSend(v7, "setTextureType:", objc_msgSend(v5, "textureType"));
    objc_msgSend(v7, "setPixelFormat:", objc_msgSend(v5, "pixelFormat"));
    objc_msgSend(v7, "setWidth:", objc_msgSend(v5, "width"));
    objc_msgSend(v7, "setHeight:", objc_msgSend(v5, "height"));
    objc_msgSend(v7, "setDepth:", objc_msgSend(v5, "depth"));
    objc_msgSend(v7, "setMipmapLevelCount:", objc_msgSend(v5, "mipmapLevelCount"));
    [v7 setUsage:0];
    [v7 setStorageMode:0];
    uint64_t v8 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v7];
    v10._encoder = 0;
    v10._commandBuffer = 0;
    SCNMTLBlitCommandEncoder::beginEncoding(&v10, a4, 0);
    SCNMTLBlitCommandEncoder::copyTextureToTexture((void **)&v10._encoder, v5, v8);
    SCNMTLBlitCommandEncoder::endEncoding(&v10);
    return v8;
  }
  return v5;
}

- (id)renderResourceForImageProxy:(__C3DImageProxy *)a3 sampler:(__C3DTextureSampler *)a4 engineContext:(__C3DEngineContext *)a5 didFallbackToDefaultTexture:(BOOL *)a6
{
  if (!a3)
  {
    id v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLResourceManager(Textures) renderResourceForImageProxy:sampler:engineContext:didFallbackToDefaultTexture:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  p_availableuint64_t ImageProxy = (uint64_t *)&self->_availableImageProxy;
  p_locuint64_t k = &self->_availableImageProxy.lock;
  os_unfair_lock_lock(p_lock);
  int v21 = (void *)*p_availableImageProxy;
  if (!*p_availableImageProxy)
  {
    SCNResourceRegistrySetup(p_availableImageProxy, 0);
    int v21 = (void *)*p_availableImageProxy;
  }
  char v22 = (const void *)[v21 objectForKey:a3];
  if (!v22)
  {
    uint64_t TextureProxy = C3DImageProxyCreateTextureProxy((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    if (!TextureProxy)
    {
      os_unfair_lock_unlock(p_lock);
      MetalTexture = 0;
      goto LABEL_18;
    }
    char v22 = (const void *)TextureProxy;
    *(void *)(TextureProxy + 40) = a3;
    [(id)*p_availableImageProxy setObject:TextureProxy forKey:a3];
    CFRelease(v22);
  }
  __int16 v29 = 257;
  MetalTexture = (void *)C3DTextureProxyGetMetalTexture((uint64_t)v22, (uint64_t)a5, (uint64_t)a4, (uint64_t)&v29);
  os_unfair_lock_unlock(p_lock);
  if (MetalTexture)
  {
    if (a4 && (_BYTE)v29 && HIBYTE(v29) && C3DTextureSamplerGetMipFilter((uint64_t)a4))
    {
      uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a5);
      uint64_t v26 = (void **)-[SCNMTLRenderContext resourceBlitEncoder](RenderContext);
      SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v26, MetalTexture);
    }
    if (a6)
    {
      BOOL v27 = 0;
LABEL_20:
      *a6 = v27;
      return MetalTexture;
    }
    return MetalTexture;
  }
LABEL_18:
  if (a6)
  {
    BOOL v27 = 1;
    goto LABEL_20;
  }
  return MetalTexture;
}

- (id)lazyMTKTextureLoader
{
  id result = self->_mtkTextureLoader;
  if (!result)
  {
    id result = (id)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:self->_device];
    self->_mtkTextureLoader = (MTKTextureLoader *)result;
  }
  return result;
}

- (id)defaultTexture
{
  v14[6] = *MEMORY[0x263EF8340];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_locuint64_t k = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages) {
    SCNResourceRegistrySetup(p_availableImages, 0);
  }
  if (!self->_defaultTexture)
  {
    id v5 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, 4, 4, 1, p_lock);
    [v5 setUsage:1];
    [v5 setStorageMode:0];
    self->_defaultTexture = (MTLTexture *)[(SCNMTLResourceManager *)self newTextureWithDescriptor:v5];
    unint64_t v6 = [v5 mipmapLevelCount];
    if (v6)
    {
      unint64_t v7 = 4;
      unint64_t v8 = 1;
      do
      {
        MEMORY[0x270FA5388](v6);
        SCNMTLBlitCommandEncoder v10 = (char *)&v14[-1] - v9;
        memset((char *)&v14[-1] - v9, 255, 4 * v7 * v7);
        defaultTexture = self->_defaultTexture;
        memset(v14, 0, 24);
        void v14[3] = v7;
        v14[4] = v7;
        v14[5] = 1;
        [(MTLTexture *)defaultTexture replaceRegion:v14 mipmapLevel:v8 - 1 slice:0 withBytes:v10 bytesPerRow:4 * v7 bytesPerImage:4 * v7 * v7];
        unint64_t v6 = [v5 mipmapLevelCount];
        if (v8 >= v6) {
          break;
        }
        ++v8;
        BOOL v12 = v7 > 1;
        v7 >>= 1;
      }
      while (v12);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return self->_defaultTexture;
}

- (id)defaultCubeTexture
{
  v16[6] = *MEMORY[0x263EF8340];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_locuint64_t k = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages) {
    SCNResourceRegistrySetup(p_availableImages, 0);
  }
  if (!self->_defaultCubeTexture)
  {
    long long v4 = (void *)[MEMORY[0x263F12A50] textureCubeDescriptorWithPixelFormat:70 size:4 mipmapped:1];
    [v4 setUsage:1];
    [v4 setStorageMode:0];
    self->_defaultCubeTexture = (MTLTexture *)[(SCNMTLResourceManager *)self newTextureWithDescriptor:v4];
    id v15 = v4;
    unint64_t v5 = [v4 mipmapLevelCount];
    if (v5)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 4;
      do
      {
        MEMORY[0x270FA5388](v5);
        uint64_t v9 = (char *)&v13 - v8;
        bzero((char *)&v13 - v8, 4 * v7 * v7);
        for (uint64_t i = 0; i != 6; ++i)
        {
          defaultCubeTexture = self->_defaultCubeTexture;
          memset(v16, 0, 24);
          v16[3] = v7;
          v16[4] = v7;
          v16[5] = 1;
          [(MTLTexture *)defaultCubeTexture replaceRegion:v16 mipmapLevel:v6 slice:i withBytes:v9 bytesPerRow:4 * v7 bytesPerImage:4 * v7 * v7];
        }
        ++v6;
        v7 >>= 1;
        unint64_t v5 = [v15 mipmapLevelCount];
      }
      while (v6 < v5);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return self->_defaultCubeTexture;
}

- (id)defaultTexture3D
{
  id v2 = self;
  v35[6] = *MEMORY[0x263EF8340];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_locuint64_t k = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages) {
    SCNResourceRegistrySetup(p_availableImages, 0);
  }
  uint64_t v5 = 504;
  if (!v2->_defaultTexture3D)
  {
    uint64_t v28 = p_lock;
    id v6 = objc_alloc_init(MEMORY[0x263F12A50]);
    [v6 setPixelFormat:70];
    [v6 setWidth:16];
    [v6 setHeight:16];
    [v6 setDepth:16];
    [v6 setTextureType:7];
    [v6 setMipmapLevelCount:1];
    [v6 setStorageMode:0];
    [v6 setUsage:1];
    v2->_defaultTexture3D = (MTLTexture *)[(SCNMTLResourceManager *)v2 newTextureWithDescriptor:v6];
    uint64_t v7 = 4 * [v6 width];
    uint64_t v8 = [v6 height];
    v27[1] = v27;
    uint64_t v32 = v7 * v8;
    double v9 = MEMORY[0x270FA5388](v8);
    unint64_t v33 = (char *)v27 - v10;
    if (objc_msgSend(v6, "depth", v9))
    {
      uint64_t v34 = 0;
      __int16 v29 = v33 + 3;
      uint64_t v30 = 504;
      float v31 = v2;
      do
      {
        uint64_t v11 = [v6 depth];
        if ([v6 height])
        {
          unint64_t v12 = 0;
          uint64_t v13 = v29;
          unint64_t v14 = 255 * v34 / (unint64_t)(v11 - 1);
          do
          {
            uint64_t v15 = [v6 height];
            if ([v6 width])
            {
              unint64_t v16 = 0;
              unint64_t v17 = 0;
              unint64_t v18 = v15 - 1;
              long long v19 = v13;
              unint64_t v20 = 255 * v12 / v18;
              do
              {
                *(v19 - 3) = v16 / ([v6 width] - 1);
                *(v19 - 2) = v20;
                *(v19 - 1) = v14;
                *long long v19 = -1;
                v19 += 4;
                ++v17;
                v16 += 255;
              }
              while (v17 < [v6 width]);
            }
            ++v12;
            v13 += v7;
          }
          while (v12 < [v6 height]);
        }
        uint64_t v5 = v30;
        id v2 = v31;
        int v21 = *(Class *)((char *)&v31->super.isa + v30);
        uint64_t v22 = [v6 width];
        uint64_t v23 = [v6 height];
        v35[0] = 0;
        v35[1] = 0;
        uint64_t v24 = v34;
        v35[2] = v34;
        v35[3] = v22;
        v35[4] = v23;
        v35[5] = 1;
        [v21 replaceRegion:v35 mipmapLevel:0 slice:0 withBytes:v33 bytesPerRow:v7 bytesPerImage:v32];
        unint64_t v25 = [v6 depth];
        uint64_t v34 = v24 + 1;
      }
      while (v24 + 1 < v25);
    }
    p_locuint64_t k = v28;
  }
  os_unfair_lock_unlock(p_lock);
  return *(Class *)((char *)&v2->super.isa + v5);
}

- (id)iesTextureForProfile:(id)a3 renderContext:(id)a4
{
  p_availableIESTextures = (uint64_t *)&self->_availableIESTextures;
  p_locuint64_t k = &self->_availableIESTextures.lock;
  os_unfair_lock_lock(&self->_availableIESTextures.lock);
  uint64_t v8 = (void *)*p_availableIESTextures;
  if (!*p_availableIESTextures)
  {
    SCNResourceRegistrySetup(p_availableIESTextures, 1);
    uint64_t v8 = (void *)*p_availableIESTextures;
  }
  uint64_t v9 = [v8 objectForKey:a3];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (C3DIESInfoLoad(a3, v21))
    {
      CACurrentMediaTime();
      Bitdouble Size = SCNMTLPixelFormatGetBitSize();
      unint64_t v12 = BitSize >> 3 << 8;
      size_t v13 = BitSize >> 3 << 12;
      unint64_t v14 = (int32x4_t *)malloc_type_malloc(v13, 0xACCDC612uLL);
      unint64_t v15 = SCNMTLPixelFormatGetBitSize();
      C3DIESInfoGenerateTexture2D((BOOL)v21, v14, 256, 0x10u, 1, v15 >> 3);
      unint64_t v16 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:25 width:256 height:16 mipmapped:0];
      [v16 setStorageMode:0];
      [v16 setUsage:1];
      uint64_t v10 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v16];
      memset(v18, 0, sizeof(v18));
      long long v19 = xmmword_20B5CCF00;
      uint64_t v20 = 1;
      [v10 replaceRegion:v18 mipmapLevel:0 slice:0 withBytes:v14 bytesPerRow:v12 bytesPerImage:v13];
      free(v14);
      [(id)*p_availableIESTextures setObject:v10 forKey:a3];
    }
    else
    {
      uint64_t v10 = 0;
    }
    C3DIESInfoDestroy((void **)v21);
    os_unfair_lock_unlock(p_lock);
  }
  return v10;
}

- (void)colorMatchSourceTexture:(id)a3 sourceColorSpace:(CGColorSpace *)a4 destinationColorSpace:(CGColorSpace *)a5 destinationTexture:(id)a6 renderContext:(id)a7
{
  id v10 = [(SCNMTLResourceManager *)self colorMatchingComputePipelineStateForSourceColorSpace:a4 destinationColorSpace:a5 renderContext:a7];
  uint64_t v11 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a7);
  uint64_t v12 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v10);
  if (v11->_computePipelineState != (MTLComputePipelineState *)v12)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v12;
    [(MTLComputeCommandEncoder *)v11->_encoder setComputePipelineState:v12];
  }
  if (v11->_textures[0] != a3)
  {
    v11->_textures[0] = (MTLTexture *)a3;
    v11->_texturesToBind[0] |= 1uLL;
  }
  if (v11->_textures[1] != a6)
  {
    v11->_textures[1] = (MTLTexture *)a6;
    v11->_texturesToBind[0] |= 2uLL;
  }
  unint64_t v13 = [a3 width];
  unint64_t v14 = [a3 height];

  SCNMTLComputeCommandEncoder::dispatchOnGrid2D(v11, v13, v14);
}

- (void)colorMatchBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceTextureY:(id)a7 sourceTextureCbCr:(id)a8 sourceColorSpace:(CGColorSpace *)a9 destinationColorSpace:(CGColorSpace *)a10 destinationTexture:(id)a11 renderContext:(id)a12
{
  id v14 = [(SCNMTLResourceManager *)self colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:*(void *)&a3 pixelBufferYCbCrMatrix:a4 pixelBufferColorPrimaries:a5 pixelBufferTransferFunction:a6 sourceColorSpace:a9 destinationColorSpace:a10 renderContext:a12];
  unint64_t v15 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a12);
  uint64_t v16 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v14);
  if (v15->_computePipelineState != (MTLComputePipelineState *)v16)
  {
    v15->_computePipelineState = (MTLComputePipelineState *)v16;
    [(MTLComputeCommandEncoder *)v15->_encoder setComputePipelineState:v16];
  }
  if (v15->_textures[0] != a7)
  {
    v15->_textures[0] = (MTLTexture *)a7;
    v15->_texturesToBind[0] |= 1uLL;
  }
  if (v15->_textures[1] != a8)
  {
    v15->_textures[1] = (MTLTexture *)a8;
    v15->_texturesToBind[0] |= 2uLL;
  }
  if (v15->_textures[2] != a11)
  {
    v15->_textures[2] = (MTLTexture *)a11;
    v15->_texturesToBind[0] |= 4uLL;
  }
  unint64_t v17 = [a11 width];
  unint64_t v18 = [a11 height];

  SCNMTLComputeCommandEncoder::dispatchOnGrid2D(v15, v17, v18);
}

- (id)defaultLightingEnvironmentIrradianceTexture
{
  v24[1] = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if (!self->_defaultLightingEnvironmentIrradianceTexture)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", @"SCNDefaultIrradiance", @"ktx");
    uint64_t v23 = *MEMORY[0x263F12D50];
    v24[0] = MEMORY[0x263EFFA80];
    long long v4 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithURL:options:](self, "newTextureUsingMTKTextureLoaderWithURL:options:", v3, [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1]);
    self->_defaultLightingEnvironmentIrradianceTexture = v4;
    if ([(MTLTexture *)v4 textureType] != 5)
    {
      uint64_t v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        [(SCNMTLResourceManager(PBR) *)v5 defaultLightingEnvironmentIrradianceTexture];
      }
    }
    if ([(MTLTexture *)self->_defaultLightingEnvironmentIrradianceTexture pixelFormat] != 115)
    {
      unint64_t v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        [(SCNMTLResourceManager(PBR) *)v13 defaultLightingEnvironmentIrradianceTexture];
      }
    }
  }
  defaultLightingEnvironmentIrradianceTexture = self->_defaultLightingEnvironmentIrradianceTexture;
  objc_sync_exit(self);
  return defaultLightingEnvironmentIrradianceTexture;
}

- (id)defaultLightingEnvironmentRadianceTexture
{
  v24[1] = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if (!self->_defaultLightingEnvironmentRadianceTexture)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", @"SCNDefaultRadiance", @"ktx");
    uint64_t v23 = *MEMORY[0x263F12D50];
    v24[0] = MEMORY[0x263EFFA80];
    long long v4 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithURL:options:](self, "newTextureUsingMTKTextureLoaderWithURL:options:", v3, [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1]);
    self->_defaultLightingEnvironmentRadianceTexture = v4;
    if ([(MTLTexture *)v4 textureType] != 5)
    {
      uint64_t v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        [(SCNMTLResourceManager(PBR) *)v5 defaultLightingEnvironmentRadianceTexture];
      }
    }
    if ([(MTLTexture *)self->_defaultLightingEnvironmentRadianceTexture pixelFormat] != 115)
    {
      unint64_t v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        [(SCNMTLResourceManager(PBR) *)v13 defaultLightingEnvironmentRadianceTexture];
      }
    }
  }
  defaultLightingEnvironmentRadianceTexture = self->_defaultLightingEnvironmentRadianceTexture;
  objc_sync_exit(self);
  return defaultLightingEnvironmentRadianceTexture;
}

- (id)irradianceTextureForEnvironmentTexture:(id)a3 renderContext:(id)a4 applySH:(id)a5
{
  p_availableIrradianceTextures = (uint64_t *)&self->_availableIrradianceTextures;
  p_locuint64_t k = &self->_availableIrradianceTextures.lock;
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  uint64_t v11 = (void *)*p_availableIrradianceTextures;
  if (!*p_availableIrradianceTextures)
  {
    SCNResourceRegistrySetup(p_availableIrradianceTextures, 0);
    uint64_t v11 = (void *)*p_availableIrradianceTextures;
  }
  uint64_t v12 = [v11 objectForKey:a3];
  if (v12)
  {
    id v13 = (id)v12;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v14 = (void *)[MEMORY[0x263F12A50] textureCubeDescriptorWithPixelFormat:115 size:64 mipmapped:0];
    [v14 setUsage:1];
    objc_msgSend(v14, "setUsage:", objc_msgSend(v14, "usage") | 4);
    [v14 setStorageMode:2];
    id v13 = [(SCNMTLResourceManager *)self newTextureWithDescriptor:v14];
    [(id)*p_availableIrradianceTextures setObject:v13 forKey:a3];
    os_unfair_lock_unlock(p_lock);

    [(SCNMTLResourceManager *)self _bakeSphericalHamonicsBasedIrradianceTexture:v13 forEnvironmentTexture:a3 renderContext:a4 applySH:a5];
  }
  return v13;
}

- (void)_bakeStochasticIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 mipmapLevelForSampling:(unint64_t)a5 renderContext:(id)a6
{
  int v7 = a5;
  uint64_t v10 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)[(SCNMTLResourceManager *)self computePipelineStateForKernel:@"compute_diffusePreIntegrated_texture2d"]);
  uint64_t v11 = [v10 threadExecutionWidth];
  unint64_t v12 = [v10 maxTotalThreadsPerThreadgroup];
  unint64_t v13 = vcvtms_u32_f32(sqrtf((float)v12));
  if (v11 * v11 <= v12) {
    unint64_t v14 = v11;
  }
  else {
    unint64_t v14 = v13;
  }
  id v23 = a6;
  uint64_t v15 = (void *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a6);
  bzero(v15, 0x678uLL);
  uint64_t v16 = (void *)v15[207];
  [v16 setComputePipelineState:v10];
  uint64_t v17 = 0;
  unint64_t v18 = v14 - 1;
  do
  {
    uint64_t v19 = objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(a3, "pixelFormat", v23), 2, 0, 1, v17, 1);
    [v16 setTexture:v19 atIndex:0];
    [v16 setTexture:a4 atIndex:1];
    int v26 = v17;
    int v27 = v7;
    [v16 setBytes:&v27 length:4 atIndex:0];
    [v16 setBytes:&v26 length:4 atIndex:1];
    unint64_t v20 = (v18 + [v19 width]) / v14;
    uint64_t v21 = [v19 height];
    v25[0] = v20;
    v25[1] = (v18 + v21) / v14;
    v25[2] = 1;
    v24[0] = v14;
    v24[1] = v14;
    void v24[2] = 1;
    [v16 dispatchThreadgroups:v25 threadsPerThreadgroup:v24];

    ++v17;
  }
  while (v17 != 6);
  if ((unint64_t)[a3 mipmapLevelCount] > 1)
  {
    uint64_t v22 = (void **)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)v23);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v22, a3);
  }
}

- (void)_bakeSphericalHamonicsBasedIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 renderContext:(id)a5 applySH:(id)a6
{
  id v11 = -[SCNMTLResourceManager sphericalHarmonicsForEnvironmentTexture:order:commandBuffer:](self, "sphericalHarmonicsForEnvironmentTexture:order:commandBuffer:", a4, 3, -[SCNMTLRenderContext resourceCommandBuffer](a5));
  if (a6)
  {
    unint64_t v12 = -[SCNMTLRenderContext resourceCommandBuffer](a5);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __119__SCNMTLResourceManager_PBR___bakeSphericalHamonicsBasedIrradianceTexture_forEnvironmentTexture_renderContext_applySH___block_invoke;
    v39[3] = &unk_264007050;
    v39[4] = v11;
    v39[5] = a6;
    [v12 addCompletedHandler:v39];
  }
  id v13 = [(SCNMTLLibraryManager *)self->_libraryManager frameworkLibrary];
  memset(v20, 0, sizeof(v20));
  uint64_t v21 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v38 = 0;
  id v22 = v13;
  *(void *)&long long v23 = [a3 pixelFormat];
  unint64_t v35 = @"scn_draw_fullscreen_quad_vertex";
  *(void *)&long long v36 = @"cubemap_from_sh";
  id v14 = [(SCNMTLResourceManager *)self newRenderPipelineStateWithDesc:v20];
  uint64_t v15 = -[SCNMTLRenderContext resourceCommandBuffer](a5);
  for (uint64_t i = 0; i != 6; ++i)
  {
    id v17 = objc_alloc_init(MEMORY[0x263F129A0]);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", a3);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLevel:", 0);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setSlice:", i);
    unint64_t v18 = (void *)[v15 renderCommandEncoderWithDescriptor:v17];

    objc_msgSend(v18, "setRenderPipelineState:", objc_msgSend(v14, "state"));
    [v18 setFragmentTexture:a4 atIndex:1];
    int v19 = i;
    [v18 setFragmentBuffer:v11 offset:0 atIndex:0];
    [v18 setFragmentBytes:&v19 length:4 atIndex:1];
    [v18 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v18 endEncoding];
  }
}

uint64_t __119__SCNMTLResourceManager_PBR___bakeSphericalHamonicsBasedIrradianceTexture_forEnvironmentTexture_renderContext_applySH___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)newRadianceTextureForEnvironmentTexture:(id)a3 engineContext:(__C3DEngineContext *)a4 cpuAccessible:(BOOL)a5 commandBuffer:(id)a6
{
  BOOL v7 = a5;
  id v11 = (void *)[MEMORY[0x263F12A50] textureCubeDescriptorWithPixelFormat:115 size:256 mipmapped:1];
  [v11 setUsage:1];
  objc_msgSend(v11, "setUsage:", objc_msgSend(v11, "usage") | 0x10);
  objc_msgSend(v11, "setUsage:", objc_msgSend(v11, "usage") | 2);
  if (v7) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 2;
  }
  [v11 setStorageMode:v12];
  unint64_t v43 = [a3 mipmapLevelCount];
  uint64_t v42 = [v11 mipmapLevelCount];
  objc_msgSend(v11, "setMipmapLevelCount:", objc_msgSend(v11, "mipmapLevelCount") - 4);
  id v13 = [(SCNMTLResourceManager *)self newTextureWithDescriptor:v11];
  BOOL HasFeatures = C3DEngineContextHasFeatures((uint64_t)a4, 512);
  if (HasFeatures) {
    uint64_t v15 = @"compute_specularPreIntegratedLD_texturecube";
  }
  else {
    uint64_t v15 = @"compute_specularPreIntegratedLD_texture2d";
  }
  uint64_t v16 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)[(SCNMTLResourceManager *)self computePipelineStateForKernel:v15]);
  unint64_t v17 = [v16 threadExecutionWidth];
  unint64_t v18 = [v16 maxTotalThreadsPerThreadgroup];
  do
  {
    unint64_t v19 = v17;
    unint64_t v20 = 6 * v17 * v17;
    v17 >>= 1;
  }
  while (v20 > v18);
  uint64_t v21 = (void *)[a6 computeCommandEncoder];
  [v21 setComputePipelineState:v16];
  [v21 setTexture:a3 atIndex:1];
  if ([v13 mipmapLevelCount])
  {
    unint64_t v22 = 0;
    uint64_t v23 = 6;
    if (!HasFeatures) {
      uint64_t v23 = 1;
    }
    uint64_t v45 = v23;
    do
    {
      if (v43 < 2)
      {
        unint64_t v44 = 0;
      }
      else
      {
        uint64_t v24 = [a3 mipmapLevelCount];
        if (v24 < v42) {
          uint64_t v25 = -1;
        }
        else {
          uint64_t v25 = v24 - v42;
        }
        unint64_t v44 = objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(a3, "pixelFormat"), 5, v22 + v25 + 1, 1, 0, 6);
        objc_msgSend(v21, "setTexture:atIndex:");
      }
      unint64_t v26 = 0;
      do
      {
        if (HasFeatures)
        {
          long long v27 = v13;
          uint64_t v28 = 5;
          unint64_t v29 = v22;
          unint64_t v30 = 0;
          uint64_t v31 = 6;
        }
        else
        {
          float v48 = *(float *)&v26;
          [v21 setBytes:&v48 length:4 atIndex:1];
          long long v27 = v13;
          uint64_t v28 = 2;
          unint64_t v29 = v22;
          unint64_t v30 = v26;
          uint64_t v31 = 1;
        }
        long long v32 = objc_msgSend(v27, "newTextureViewWithPixelFormat:textureType:levels:slices:", 115, v28, v29, 1, v30, v31);
        [v21 setTexture:v32 atIndex:0];
        unint64_t v33 = [v13 mipmapLevelCount];
        float v34 = 0.0;
        if (v33 >= 2) {
          float v34 = 1.0 / (float)(unint64_t)(objc_msgSend(v13, "mipmapLevelCount", 0.0) - 1);
        }
        float v48 = fminf(fmaxf(v34 * (float)v22, 0.01), 1.0);
        [v21 setBytes:&v48 length:4 atIndex:0];
        unint64_t v35 = [v32 width];
        if (v19 >= v35) {
          unint64_t v36 = v35;
        }
        else {
          unint64_t v36 = v19;
        }
        unint64_t v37 = (v36 - 1 + [v32 width]) / v36;
        uint64_t v38 = [v32 height];
        v47[0] = v37;
        v47[1] = (v36 - 1 + v38) / v36;
        v47[2] = v45;
        v46[0] = v36;
        v46[1] = v36;
        v46[2] = 1;
        [v21 dispatchThreadgroups:v47 threadsPerThreadgroup:v46];

        char v40 = v26++ > 4 || HasFeatures;
      }
      while ((v40 & 1) == 0);

      ++v22;
    }
    while (v22 < [v13 mipmapLevelCount]);
  }
  [v21 endEncoding];
  return v13;
}

- (id)radianceTextureForEnvironmentTexture:(id)a3 engineContext:(__C3DEngineContext *)a4 commandBuffer:(id)a5
{
  p_availableRadianceTextures = (uint64_t *)&self->_availableRadianceTextures;
  p_locuint64_t k = &self->_availableRadianceTextures.lock;
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  id v11 = (void *)*p_availableRadianceTextures;
  if (!*p_availableRadianceTextures)
  {
    SCNResourceRegistrySetup(p_availableRadianceTextures, 0);
    id v11 = (void *)*p_availableRadianceTextures;
  }
  uint64_t v12 = [v11 objectForKey:a3];
  if (v12)
  {
    id v13 = (id)v12;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v13 = [(SCNMTLResourceManager *)self newRadianceTextureForEnvironmentTexture:a3 engineContext:a4 cpuAccessible:0 commandBuffer:a5];
    [(id)*p_availableRadianceTextures setObject:v13 forKey:a3];
    os_unfair_lock_unlock(p_lock);
  }
  return v13;
}

- (id)areaLightPrecomputedDataTexture
{
  objc_sync_enter(self);
  areaLightPrecomputedDataTexture = self->_areaLightPrecomputedDataTexture;
  if (!areaLightPrecomputedDataTexture)
  {
    long long v4 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:125 width:64 height:64 mipmapped:0];
    [v4 setStorageMode:0];
    [v4 setTextureType:3];
    [v4 setArrayLength:3];
    uint64_t v5 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v4];
    self->_areaLightPrecomputedDataTexture = v5;
    memset(v15, 0, sizeof(v15));
    int64x2_t v16 = vdupq_n_s64(0x40uLL);
    uint64_t v17 = 1;
    [(MTLTexture *)v5 replaceRegion:v15 mipmapLevel:0 slice:0 withBytes:&area_lights_pre_computed_tables bytesPerRow:1024 bytesPerImage:0x10000];
    uint64_t v6 = self->_areaLightPrecomputedDataTexture;
    memset(v12, 0, sizeof(v12));
    int64x2_t v13 = vdupq_n_s64(0x40uLL);
    uint64_t v14 = 1;
    [(MTLTexture *)v6 replaceRegion:v12 mipmapLevel:0 slice:1 withBytes:&unk_20B5DD5C0 bytesPerRow:1024 bytesPerImage:0x10000];
    BOOL v7 = self->_areaLightPrecomputedDataTexture;
    memset(v9, 0, sizeof(v9));
    int64x2_t v10 = vdupq_n_s64(0x40uLL);
    uint64_t v11 = 1;
    [(MTLTexture *)v7 replaceRegion:v9 mipmapLevel:0 slice:2 withBytes:&unk_20B5DD5C0 bytesPerRow:1024 bytesPerImage:0x10000];
    areaLightPrecomputedDataTexture = self->_areaLightPrecomputedDataTexture;
  }
  objc_sync_exit(self);
  return areaLightPrecomputedDataTexture;
}

- (id)shFromCPU:(id)a3 commandBuffer:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = [(SCNMTLResourceManager *)self unstageTexture:a3 commandBuffer:a4];
  uint64_t v6 = 0;
  memset(v28, 0, 108);
  while (1)
  {
    uint64_t v7 = [v5 pixelFormat];
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) != 0x46) {
      break;
    }
    uint64_t v8 = 4 * [v5 width];
    size_t v9 = v8 * [v5 height];
    int64x2_t v10 = (char *)malloc_type_calloc(v9, 1uLL, 0xA116E992uLL);
    uint64_t v11 = [v5 width];
    uint64_t v12 = [v5 height];
    memset(v27, 0, 24);
    v27[3] = v11;
    v27[4] = v12;
    v27[5] = 1;
    [v5 getBytes:v10 bytesPerRow:v8 bytesPerImage:v9 fromRegion:v27 mipmapLevel:0 slice:v6];
    int64x2_t v13 = (char *)malloc_type_calloc([v5 height] * objc_msgSend(v5, "width"), 0x10uLL, 0x1000040451B5BE8uLL);
    convert_rgba8unorm_to_rgbaf32(v13, 16 * [v5 width], v10, v8, objc_msgSend(v5, "width"), objc_msgSend(v5, "height"));
LABEL_7:
    free(v10);
LABEL_9:
    compute_sh((uint64_t)v13, [v5 width], v6, 3, (uint64_t)v28);
    free(v13);
    if (++v6 == 6) {
      return (id)[(MTLDevice *)self->_device newBufferWithBytes:v28 length:108 options:0];
    }
  }
  uint64_t v14 = v7;
  if (v7 == 125)
  {
    uint64_t v19 = 16 * [v5 width];
    size_t v20 = v19 * [v5 height];
    int64x2_t v13 = (char *)malloc_type_calloc(v20, 1uLL, 0x817F880DuLL);
    uint64_t v21 = [v5 width];
    uint64_t v22 = [v5 height];
    memset(v25, 0, 24);
    void v25[3] = v21;
    void v25[4] = v22;
    v25[5] = 1;
    [v5 getBytes:v13 bytesPerRow:v19 bytesPerImage:v20 fromRegion:v25 mipmapLevel:0 slice:v6];
    goto LABEL_9;
  }
  if (v7 == 115)
  {
    uint64_t v15 = 8 * [v5 width];
    size_t v16 = v15 * [v5 height];
    int64x2_t v10 = (char *)malloc_type_calloc(v16, 1uLL, 0x1D64DDAAuLL);
    uint64_t v17 = [v5 width];
    uint64_t v18 = [v5 height];
    memset(v26, 0, 24);
    v26[3] = v17;
    v26[4] = v18;
    v26[5] = 1;
    [v5 getBytes:v10 bytesPerRow:v15 bytesPerImage:v16 fromRegion:v26 mipmapLevel:0 slice:v6];
    int64x2_t v13 = (char *)malloc_type_calloc([v5 height] * objc_msgSend(v5, "width"), 0x10uLL, 0x1000040451B5BE8uLL);
    convert_rgba16f_to_rgbaf32((uint64_t)v13, 16 * [v5 width], v10, v15, objc_msgSend(v5, "width"), objc_msgSend(v5, "height"));
    goto LABEL_7;
  }
  uint64_t v24 = scn_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[SCNMTLResourceManager(SH) shFromCPU:commandBuffer:](v14, v24);
  }
  return 0;
}

- (id)sphericalHarmonicsForEnvironmentTexture:(id)a3 order:(unint64_t)a4 commandBuffer:(id)a5
{
  unint64_t v9 = a4 * a4;
  id v10 = (id)[(MTLDevice *)self->_device newBufferWithLength:12 * a4 * a4 options:0];
  uint64_t v11 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", objc_msgSend(NSString, "stringWithFormat:", @"compute_sh%d_from_cubemap_threadgroup_mem", a4)));
  uint64_t v12 = (void *)v11;
  if (!v11) {
    uint64_t v12 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", objc_msgSend(NSString, "stringWithFormat:", @"compute_sh%d_from_cubemap", a4)));
  }
  int64x2_t v13 = (void *)[a5 computeCommandEncoder];
  [v13 setComputePipelineState:v12];
  id v23 = v10;
  if ((unint64_t)[a3 mipmapLevelCount] >= 0xA)
  {
    uint64_t v14 = [a3 mipmapLevelCount];
    uint64_t v15 = 9;
    if (v14 > 9) {
      uint64_t v15 = v14;
    }
    a3 = (id)objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(a3, "pixelFormat"), 5, v15 - 9, 1, 0, 6);
  }
  [v13 setTexture:a3 atIndex:0];
  if (v11)
  {
    size_t v16 = (void *)[(MTLDevice *)self->_device newBufferWithLength:72 * v9 options:32];
    [v13 setBuffer:v16 offset:0 atIndex:1];
    uint64_t v17 = (16 * v9);
    unint64_t v18 = [v12 threadExecutionWidth];
    unint64_t v19 = 0x7FFF / v17;
    if (v18 < v19) {
      unint64_t v19 = v18;
    }
    if (v19 >= 0x40) {
      uint64_t v20 = 64;
    }
    else {
      uint64_t v20 = v19;
    }
    [v13 setThreadgroupMemoryLength:v20 * v17 atIndex:0];
    long long v34 = xmmword_20B5ED600;
    uint64_t v35 = 1;
    uint64_t v32 = v20;
    int64x2_t v33 = vdupq_n_s64(1uLL);
    [v13 dispatchThreadgroups:&v34 threadsPerThreadgroup:&v32];
    [v13 setComputePipelineState:-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", objc_msgSend(NSString, "stringWithFormat:", @"sum_sh%d", a4)))];
    uint64_t v21 = v23;
    [v13 setBuffer:v23 offset:0 atIndex:0];
    uint64_t v31 = 1;
    long long v30 = xmmword_20B5ED610;
    uint64_t v29 = 1;
    long long v28 = xmmword_20B5ED610;
    [v13 dispatchThreadgroups:&v30 threadsPerThreadgroup:&v28];
  }
  else
  {
    uint64_t v21 = v10;
    [v13 setBuffer:v10 offset:0 atIndex:0];
    uint64_t v27 = 1;
    long long v26 = xmmword_20B5ED610;
    uint64_t v25 = 1;
    long long v24 = xmmword_20B5ED610;
    [v13 dispatchThreadgroups:&v26 threadsPerThreadgroup:&v24];
  }
  [v13 endEncoding];
  return v21;
}

uint64_t __88__SCNMTLResourceManager_Compilation__renderResourceForProgramDesc_renderPassDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  long long v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "privateFunctions"), "arrayByAddingObject:", a2);
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return [v6 setPrivateFunctions:v5];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x263F12940]);
    v8[0] = a2;
    return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setPrivateFunctions:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v8, 1));
  }
}

uint64_t __88__SCNMTLResourceManager_Compilation__renderResourceForProgramDesc_renderPassDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  long long v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "privateFunctions"), "arrayByAddingObject:", a2);
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return [v6 setPrivateFunctions:v5];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x263F12940]);
    v8[0] = a2;
    return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setPrivateFunctions:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v8, 1));
  }
}

- (__C3DFXMetalProgram)defaultProgramUsingTessellation:(BOOL)a3
{
  uint64_t v3 = &OBJC_IVAR___SCNMTLResourceManager__defaultProgram;
  if (a3) {
    uint64_t v3 = &OBJC_IVAR___SCNMTLResourceManager__defaultProgramForTessellation;
  }
  return *(__C3DFXMetalProgram **)((char *)&self->super.isa + *v3);
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_3(uint64_t a1)
{
  *(CFTimeInterval *)(*(void *)(*(void *)(a1 + 32) + 24) + 304) = CACurrentMediaTime()
                                                                        - *(double *)(a1 + 56)
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 24)
                                                                                    + 304);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

- (id)computePipelineStateForKernel:(id)a3 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a4
{
  return [(SCNMTLResourceManager *)self _computePipelineStateForKernel:a3 constants:0 constantsHash:0 threadGroupSizeIsMultipleOfThreadExecutionWidth:a4];
}

- (id)computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5
{
  return [(SCNMTLResourceManager *)self _computePipelineStateForKernel:a3 constants:a4 constantsHash:a5 threadGroupSizeIsMultipleOfThreadExecutionWidth:0];
}

- (id)computePipelineStateForKernel:(id)a3 withStageDescriptor:(id)a4 stageDescriptorUpdateBlock:(id)a5 constants:(id)a6 constantsHash:(id)a7
{
  p_availableComputePipelinesWithStageDescriptor = (uint64_t *)&self->_availableComputePipelinesWithStageDescriptor;
  p_locuint64_t k = &self->_availableComputePipelinesWithStageDescriptor.lock;
  os_unfair_lock_lock(&self->_availableComputePipelinesWithStageDescriptor.lock);
  if (*p_availableComputePipelinesWithStageDescriptor)
  {
    if (!a6)
    {
LABEL_8:
      id v23 = a3;
      if (a7) {
        id v23 = (id)[a3 stringByAppendingString:a7];
      }
      goto LABEL_10;
    }
  }
  else
  {
    SCNResourceRegistrySetup(p_availableComputePipelinesWithStageDescriptor, 1);
    if (!a6) {
      goto LABEL_8;
    }
  }
  if (a7) {
    goto LABEL_8;
  }
  uint64_t v15 = scn_default_log();
  id v23 = a3;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    -[SCNMTLResourceManager(Compilation) _computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:](v15, v16, v17, v18, v19, v20, v21, v22);
    id v23 = a3;
  }
LABEL_10:
  long long v24 = (void *)[(id)*p_availableComputePipelinesWithStageDescriptor objectForKey:v23];
  if (v24)
  {
    if (a4) {
      goto LABEL_15;
    }
  }
  else
  {
    long long v24 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    [(id)*p_availableComputePipelinesWithStageDescriptor setObject:v24 forKey:v23];
    if (a4) {
      goto LABEL_15;
    }
  }
  uint64_t v25 = scn_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    -[SCNMTLResourceManager(Compilation) computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:](v25, v26, v27, v28, v29, v30, v31, v32);
    if (!a5) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_15:
  if (!a5)
  {
LABEL_18:
    id v34 = [(SCNMTLResourceManager *)self getUniqueStageDescriptor:a4];
    id v35 = (id)[v24 objectForKey:v34];
    if (!v35)
    {
      id v36 = [(SCNMTLLibraryManager *)self->_libraryManager frameworkLibrary];
      id v42 = a3;
      id v43 = a6;
      id v45 = 0;
      uint64_t v46 = 0;
      id v44 = a4;
      id v35 = [(SCNMTLResourceManager *)self newComputePipelineStateForDesc:&v42 library:v36];
      if (v35)
      {
        unint64_t v37 = v24;
        id v38 = v35;
        id v39 = v34;
LABEL_23:
        [v37 setObject:v38 forKey:v39];

        goto LABEL_24;
      }
    }
    goto LABEL_24;
  }
LABEL_16:
  if ([v24 count])
  {
    uint64_t v33 = -[SCNMTLResourceManager commandQueue](objc_msgSend((id)objc_msgSend(v24, "allValues"), "firstObject"));
    (*((void (**)(id, uint64_t, id))a5 + 2))(a5, v33, a4);
    goto LABEL_18;
  }
  id v40 = [(SCNMTLLibraryManager *)self->_libraryManager frameworkLibrary];
  id v42 = a3;
  id v43 = a6;
  id v44 = a4;
  id v45 = a5;
  uint64_t v46 = 0;
  id v35 = [(SCNMTLResourceManager *)self newComputePipelineStateForDesc:&v42 library:v40];
  if (v35)
  {
    id v39 = [(SCNMTLResourceManager *)self getUniqueStageDescriptor:a4];
    unint64_t v37 = v24;
    id v38 = v35;
    goto LABEL_23;
  }
LABEL_24:
  os_unfair_lock_unlock(p_lock);
  return v35;
}

- (id)getUniqueStageDescriptor:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_stageDescriptorsLocuint64_t k = &self->_stageDescriptorsLock;
  os_unfair_lock_lock(&self->_stageDescriptorsLock);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  availableStageDescriptors = self->_availableStageDescriptors;
  uint64_t v7 = [(NSMutableArray *)availableStageDescriptors countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(availableStageDescriptors);
        }
        uint64_t v11 = 0;
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        while (1)
        {
          uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "attributes"), "objectAtIndexedSubscript:", v11), "format");
          if (v13 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v11), "format"))break; {
          uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "attributes"), "objectAtIndexedSubscript:", v11), "offset");
          }
          if (v14 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v11), "offset"))break; {
          uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "attributes"), "objectAtIndexedSubscript:", v11), "bufferIndex");
          }
          if (v15 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v11), "bufferIndex"))break; {
          if (++v11 == 31)
          }
          {
            uint64_t v16 = 0;
            while (1)
            {
              uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "layouts"), "objectAtIndexedSubscript:", v16), "stride");
              if (v17 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v16), "stride"))goto LABEL_18; {
              uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "layouts"), "objectAtIndexedSubscript:", v16), "stepFunction");
              }
              if (v18 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v16), "stepFunction"))goto LABEL_18; {
              uint64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "layouts"), "objectAtIndexedSubscript:", v16), "stepRate");
              }
              if (v19 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v16), "stepRate"))goto LABEL_18; {
              if (++v16 == 31)
              }
              {
                uint64_t v20 = [v12 indexType];
                if (v20 != [a3 indexType]) {
                  goto LABEL_18;
                }
                uint64_t v21 = [v12 indexBufferIndex];
                if (v21 != [a3 indexBufferIndex]) {
                  goto LABEL_18;
                }
                if (v12) {
                  goto LABEL_23;
                }
                goto LABEL_22;
              }
            }
          }
        }
LABEL_18:
        ;
      }
      uint64_t v8 = [(NSMutableArray *)availableStageDescriptors countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
LABEL_22:
  uint64_t v12 = (void *)[a3 copy];
  [(NSMutableArray *)self->_availableStageDescriptors addObject:v12];

LABEL_23:
  os_unfair_lock_unlock(p_stageDescriptorsLock);
  return v12;
}

- (id)newComputePipelineStateWithFunctionName:(id)a3
{
  id v5 = [(SCNMTLLibraryManager *)self->_libraryManager frameworkLibrary];

  return [(SCNMTLResourceManager *)self newComputePipelineStateWithFunctionName:a3 library:v5 constantValues:0];
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4
{
  return [(SCNMTLResourceManager *)self newComputePipelineStateWithFunctionName:a3 library:a4 constantValues:0];
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4
{
  id v7 = [(SCNMTLLibraryManager *)self->_libraryManager frameworkLibrary];

  return [(SCNMTLResourceManager *)self newComputePipelineStateWithFunctionName:a3 library:v7 constantValues:a4];
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4 constantValues:(id)a5
{
  v6[0] = a3;
  v6[1] = a5;
  v6[2] = 0;
  v7[0] = 0;
  *(_DWORD *)((char *)v7 + 7) = 0;
  return [(SCNMTLResourceManager *)self newComputePipelineStateForDesc:v6 library:a4];
}

- (id)colorMatchingComputePipelineStateForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4 renderContext:(id)a5
{
  return [(SCNMTLResourceManager *)self colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:0xFFFFFFFFLL pixelBufferYCbCrMatrix:0 pixelBufferColorPrimaries:0 pixelBufferTransferFunction:0 sourceColorSpace:a3 destinationColorSpace:a4 renderContext:a5];
}

- (id)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceColorSpace:(CGColorSpace *)a7 destinationColorSpace:(CGColorSpace *)a8 renderContext:(id)a9
{
  p_availableColorMatchingComputePipelines = (uint64_t *)&self->_availableColorMatchingComputePipelines;
  p_locuint64_t k = &self->_availableColorMatchingComputePipelines.lock;
  os_unfair_lock_lock(&self->_availableColorMatchingComputePipelines.lock);
  uint64_t v18 = (void *)*p_availableColorMatchingComputePipelines;
  if (!*p_availableColorMatchingComputePipelines)
  {
    SCNResourceRegistrySetup(p_availableColorMatchingComputePipelines, 1);
    uint64_t v18 = (void *)*p_availableColorMatchingComputePipelines;
  }
  uint64_t v19 = (void *)[v18 objectForKey:a8];
  if (!v19)
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:1];
    [(id)*p_availableColorMatchingComputePipelines setObject:v19 forKey:a8];
  }
  uint64_t v20 = (void *)[v19 objectForKey:a7];
  if (!v20)
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:1];
    [v19 setObject:v20 forKey:a7];
  }
  id v21 = (id)objc_msgSend(v20, "objectForKey:", objc_msgSend(NSNumber, "numberWithBool:", a3 != -1));
  if (!v21)
  {
    if (a3 == -1)
    {
      long long v57 = 0u;
      v58[0] = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      C3DGetColorMatchingComputeKernelParameters(a7, (uint64_t)a8, &v51);
      id v23 = objc_alloc_init(MEMORY[0x263F128B0]);
      [v23 setConstantValue:&v51 type:53 withName:@"needsInputTRC"];
      [v23 setConstantValue:(char *)&v51 + 1 type:53 withName:@"needsColorMatrix"];
      [v23 setConstantValue:(char *)&v51 + 2 type:53 withName:@"needsOutputTRC"];
      [v23 setConstantValue:(char *)&v51 + 4 type:29 withName:@"inputTRC_type"];
      [v23 setConstantValue:(char *)&v51 + 8 type:3 withName:@"inputTRC_gamma"];
      [v23 setConstantValue:(unint64_t)&v51 | 0xC type:3 withName:@"inputTRC_a"];
      [v23 setConstantValue:&v52 type:3 withName:@"inputTRC_b"];
      [v23 setConstantValue:(char *)&v52 + 4 type:3 withName:@"inputTRC_c"];
      [v23 setConstantValue:(char *)&v52 + 8 type:3 withName:@"inputTRC_d"];
      [v23 setConstantValue:(char *)&v52 + 12 type:3 withName:@"inputTRC_e"];
      [v23 setConstantValue:&v53 type:3 withName:@"inputTRC_f"];
      [v23 setConstantValue:&v54 type:5 withName:@"colorMatrixColumn0"];
      [v23 setConstantValue:&v55 type:5 withName:@"colorMatrixColumn1"];
      [v23 setConstantValue:&v56 type:5 withName:@"colorMatrixColumn2"];
      [v23 setConstantValue:&v57 type:29 withName:@"outputTRC_type"];
      [v23 setConstantValue:(char *)&v57 + 4 type:3 withName:@"outputTRC_gamma"];
      [v23 setConstantValue:(char *)&v57 + 8 type:3 withName:@"outputTRC_a"];
      [v23 setConstantValue:(char *)&v57 + 12 type:3 withName:@"outputTRC_b"];
      [v23 setConstantValue:v58 type:3 withName:@"outputTRC_c"];
      [v23 setConstantValue:(char *)v58 + 4 type:3 withName:@"outputTRC_d"];
      [v23 setConstantValue:(char *)v58 + 8 type:3 withName:@"outputTRC_e"];
      [v23 setConstantValue:(char *)v58 + 12 type:3 withName:@"outputTRC_f"];
      long long v24 = @"color_matching_kernel";
LABEL_49:
      id v21 = [(SCNMTLResourceManager *)self newComputePipelineStateWithFunctionName:v24 constantValues:v23];

      objc_msgSend(v20, "setObject:forKey:", v21, objc_msgSend(NSNumber, "numberWithBool:", a3 != -1));
      goto LABEL_50;
    }
    if ((int)a3 > 875704949)
    {
      switch(a3)
      {
        case 0x34323276u:
          int v25 = 0;
          int v26 = 2;
          break;
        case 0x34343466u:
          int v22 = 3;
          goto LABEL_25;
        case 0x34343476u:
          int v25 = 0;
          int v26 = 3;
          break;
        default:
LABEL_26:
          LOBYTE(v51) = HIBYTE(a3);
          BYTE1(v51) = BYTE2(a3);
          BYTE2(v51) = BYTE1(a3);
          *(_WORD *)((char *)&v51 + 3) = a3;
          uint64_t v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[SCNMTLResourceManager(Compilation) colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:]((uint64_t)&v51, v27, v28, v29, v30, v31, v32, v33);
          }
          int v25 = 0;
          int v48 = 0;
LABEL_29:
          if ([a4 isEqualToString:*MEMORY[0x263F04050]])
          {
            BOOL v34 = v25 == 0;
            int v35 = 3;
          }
          else if ([a4 isEqualToString:*MEMORY[0x263F04038]])
          {
            BOOL v34 = v25 == 0;
            int v35 = 1;
          }
          else
          {
            if (![a4 isEqualToString:*MEMORY[0x263F04028]])
            {
              size_t v41 = scn_default_log();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                -[SCNMTLResourceManager(Compilation) colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:]((uint64_t)a4, v41, v42, v43, v44, v45, v46, v47);
              }
              int v36 = 0;
LABEL_38:
              long long v57 = 0u;
              v58[0] = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              if ([a5 isEqualToString:*MEMORY[0x263F03F08]]
                && ([a6 isEqualToString:*MEMORY[0x263F03FD8]] & 1) != 0)
              {
                unint64_t v37 = (CFStringRef *)MEMORY[0x263F00298];
              }
              else
              {
                if (![a5 isEqualToString:*MEMORY[0x263F03F20]]
                  || ![a6 isEqualToString:*MEMORY[0x263F03FD8]])
                {
                  goto LABEL_46;
                }
                unint64_t v37 = (CFStringRef *)MEMORY[0x263F001E0];
              }
              if (*v37)
              {
                id v38 = CGColorSpaceCreateWithName(*v37);
                C3DGetColorMatchingComputeKernelParameters(v38, (uint64_t)a8, &v51);
                CFRelease(v38);
LABEL_48:
                id v23 = objc_alloc_init(MEMORY[0x263F128B0]);
                [v23 setConstantValue:&v51 type:53 withName:@"needsInputTRC"];
                [v23 setConstantValue:(char *)&v51 + 1 type:53 withName:@"needsColorMatrix"];
                [v23 setConstantValue:(char *)&v51 + 2 type:53 withName:@"needsOutputTRC"];
                [v23 setConstantValue:(char *)&v51 + 4 type:29 withName:@"inputTRC_type"];
                [v23 setConstantValue:(char *)&v51 + 8 type:3 withName:@"inputTRC_gamma"];
                [v23 setConstantValue:(unint64_t)&v51 | 0xC type:3 withName:@"inputTRC_a"];
                [v23 setConstantValue:&v52 type:3 withName:@"inputTRC_b"];
                [v23 setConstantValue:(char *)&v52 + 4 type:3 withName:@"inputTRC_c"];
                [v23 setConstantValue:(char *)&v52 + 8 type:3 withName:@"inputTRC_d"];
                [v23 setConstantValue:(char *)&v52 + 12 type:3 withName:@"inputTRC_e"];
                [v23 setConstantValue:&v53 type:3 withName:@"inputTRC_f"];
                [v23 setConstantValue:&v54 type:5 withName:@"colorMatrixColumn0"];
                [v23 setConstantValue:&v55 type:5 withName:@"colorMatrixColumn1"];
                [v23 setConstantValue:&v56 type:5 withName:@"colorMatrixColumn2"];
                [v23 setConstantValue:&v57 type:29 withName:@"outputTRC_type"];
                [v23 setConstantValue:(char *)&v57 + 4 type:3 withName:@"outputTRC_gamma"];
                [v23 setConstantValue:(char *)&v57 + 8 type:3 withName:@"outputTRC_a"];
                [v23 setConstantValue:(char *)&v57 + 12 type:3 withName:@"outputTRC_b"];
                [v23 setConstantValue:v58 type:3 withName:@"outputTRC_c"];
                [v23 setConstantValue:(char *)v58 + 4 type:3 withName:@"outputTRC_d"];
                [v23 setConstantValue:(char *)v58 + 8 type:3 withName:@"outputTRC_e"];
                [v23 setConstantValue:(char *)v58 + 12 type:3 withName:@"outputTRC_f"];
                int v49 = v36;
                int v50 = v48;
                [v23 setConstantValue:&v50 type:29 withName:@"biPlanarTextureChromaSubsampling"];
                [v23 setConstantValue:&v49 type:29 withName:@"biPlanarTextureYCbCrMatrix"];
                long long v24 = @"color_matching_kernel_biplanar";
                goto LABEL_49;
              }
LABEL_46:
              id v39 = scn_default_log();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                -[SCNMTLResourceManager(Compilation) colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:]((uint64_t)a5, (uint64_t)a6, v39);
              }
              goto LABEL_48;
            }
            BOOL v34 = v25 == 0;
            int v35 = 5;
          }
          if (v34) {
            int v36 = v35;
          }
          else {
            int v36 = v35 + 1;
          }
          goto LABEL_38;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x34323066u:
          int v25 = 1;
          break;
        case 0x34323076u:
          int v25 = 0;
          break;
        case 0x34323266u:
          int v22 = 2;
LABEL_25:
          int v48 = v22;
          int v25 = 1;
          goto LABEL_29;
        default:
          goto LABEL_26;
      }
      int v26 = 1;
    }
    int v48 = v26;
    goto LABEL_29;
  }
LABEL_50:
  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (BOOL)hasCommonProfilePrecompiledFunctions
{
  return [(SCNMTLLibraryManager *)self->_libraryManager commonProfileCacheLibrary] != 0;
}

- (void)initWithDevice:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: SCNMTLResourceManager initWithDevice : cannot create a command queue. Bailing out.", v1, 2u);
}

- (void)renderResourceForMeshSource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  long long v4 = "C3DMeshSourceIsVolatile(meshSource) != true";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. cannot use volatile meshSource", (uint8_t *)&v3);
}

void __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_1(int a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = 136315650;
  uint64_t v5 = "dataSize == buf.length";
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 1024;
  int v9 = [a2 length];
  _os_log_fault_impl(&dword_20B249000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. size mismatch in mutable buffers %u!=%u", (uint8_t *)&v4, 0x18u);
}

void __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  int v4 = "[metalMesh.buffers indexOfObject:buf] != NSNotFound";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. source should be present", (uint8_t *)&v3);
}

- (void)renderResourceForMesh:(NSObject *)a3 dataKind:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "dataKind == kC3DMeshDataKindOriginal";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type", a1);
}

- (void)renderResourceForMaterial:(NSObject *)a3 geometry:renderPipeline:engineContext:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. only C3DValue are supported for partial struct storage", a1);
}

- (void)renderResourceForMaterial:(NSObject *)a3 geometry:renderPipeline:engineContext:.cold.2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "textureMatrix";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

- (void)renderResourceForMaterial:(os_log_t)log geometry:renderPipeline:engineContext:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Sampler are not yet implemented as separate bindings", buf, 2u);
}

- (void)renderResourceForMaterial:(uint64_t)a3 geometry:renderPipeline:engineContext:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  int v4 = "pipeline";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

- (void)renderResourceForMaterial:(uint64_t)a3 geometry:renderPipeline:engineContext:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  int v4 = "material";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 96);
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = [a2 description];
  _os_log_error_impl(&dword_20B249000, a3, OS_LOG_TYPE_ERROR, "Error: Compiler error while building render pipeline state for node %@:\n%@", (uint8_t *)&v5, 0x16u);
}

@end